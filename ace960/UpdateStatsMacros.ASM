

macro UpdateStats1 target {
local .ok, .SkipKillers, .NoHistoryBonus, .NoCounterMove
	; in: ecx ttMove
	;     edi ttValue

			mov   r9d, ecx
			and   r9d, 63
			mov   r8d, ecx
			shr   r8d, 6
			and   r8d, 63
			mov   r10, qword [rbx+State.checkersBB]
			mov   edx, dword [rsi+Stack.killers]
			mov   eax, edi
			cmp   edi, dword [.beta]
			 jl   target
		       test   ecx, ecx
			 jz   target
			cmp   ecx, MOVE_TYPE_EPCAP shl 12
			jae   target
			mov   r11d, dword [.depth]
		       test   r10, r10
			jnz   target
		       imul   r11d, r11d
			cmp   byte [rbp+Pos.board+r9], 0
			jne   target
		      movzx   r8d, byte [rbp+Pos.board+r8]
			shl   r8d, 6+2
			cmp   dx, cx
			 je   .SkipKillers
			shl   edx, 16
			mov   dx, cx
			mov   dword [rsi+Stack.killers], edx
.SkipKillers:
			mov   edx, dword [History+r8+4*r9]
			add   edx, r11d
			cmp   edx, HistoryStats_Max
			jge   .NoHistoryBonus
			mov   dword [History+r8+4*r9], edx

.NoHistoryBonus:
		      movzx   r8d, word [rsi-1*sizeof.Stack+Stack.currentMove]
			mov   r9d, r8d
			mov   r10d, r8d
			and   r9d, 63
			shr   r8d, 6
			and   r8d, 63
			cmp   r8d, r9d
			 je   .NoCounterMove
		      movzx   r8d, byte[rbp+Pos.board+r9]
			shl   r8d, 6+2
			mov   edx, dword [Countermoves+r8+4*r9]
			cmp   dx, cx
			 je   .NoCounterMove
			shl   edx, 16
			mov   dx, cx
			mov   dword [Countermoves+r8+4*r9], edx
.NoCounterMove:
		      movzx   r8d, word [rsi-2*sizeof.Stack+Stack.currentMove]
			mov   r9d, r8d
			and   r9d, 63
			shr   r8d, 6
			and   r8d, 63
;                        cmp   r10w, word [rsi-1*sizeof.Stack+Stack.ttMove]
			 je   target
			cmp   r8d, r9d
			 je   target
		      movzx   r8d, byte[rbp+Pos.board+r9]
			shl   r8d, 6+2
			mov   edx, dword [Followupmoves+r8+4*r9]
			cmp   dx, cx
			 je   target
			shl   edx, 16
			mov   dx, cx
			mov   dword [Followupmoves+r8+4*r9], edx
			jmp   target


}


;cmp r8d, King shl 8
;jne .ok
;cmp r9d, SQ_G1
;jne .ok
;push rdx rcx rax rdi r8 r9 r10 r11
; lea  rdi, [Output]
; mov rax, 'king hi '
; stosq
; push r8 r9
; call  PrintUciMoveLong
; pop r9 r8
; mov al,' '
; stosb
; movsxd   rax, dword [History+r8+4*r9]
; call PrintSignedInteger
; mov al, ' '
; stosb
; mov eax, [rsp]
; call PrintSignedInteger
; mov  al, 10
; stosb
; call _WriteOut_Output
;pop r11 r10 r9 r8 rdi rax rcx rdx
;.ok:

  if 0
		       push   rdi rax rcx rdx r8 r9 r10 r11
			lea   rdi, [Output]
			mov   rax, ' history'
		      stosq
			mov   al, ' '
		      stosb
			mov   rax, r8
		       push   r8 r9
			shr   rax, 6+2
		       call   PrintUnsignedInteger
			pop   r9 r8
			mov   al, ' '
		      stosb
		       push  r8 r9
			mov   rax, r9
		       call   PrintUnsignedInteger
			pop   r9 r8
			mov   al, ' '
		      stosb
			mov   eax, dword [History+r8+4*r9]
		       call   PrintUnsignedInteger
			mov   al, 10
		      stosb
		       call  _WriteOut_Output


			pop   r11 r10 r9 r8 rdx rcx rax rdi
    end if



macro UpdateStats2 target {
local .ok, .SkipKillers, .NoHistoryBonus, .NoCounterMove
	; in: edi best value (preserve)
			mov   ecx, dword [.bestMove]
			mov   r9d, ecx
			and   r9d, 63
			mov   r8d, ecx
			shr   r8d, 6
			and   r8d, 63
			mov   edx, dword [rsi+Stack.killers]
			mov   eax, edi
			mov   r11d, dword [.depth]
		       imul   r11d, r11d
		      movzx   r8d, byte [rbp+Pos.board+r8]
			shl   r8d, 6+2
			cmp   dx, cx
			 je   .SkipKillers
			shl   edx, 16
			mov   dx, cx
			mov   dword [rsi+Stack.killers], edx
.SkipKillers:
			mov   edx, dword [History+r8+4*r9]
			add   edx, r11d
			cmp   edx, HistoryStats_Max
			jge   .NoHistoryBonus
			mov   dword [History+r8+4*r9], edx

.NoHistoryBonus:
			mov   ecx, 1
		      movzx   r9d, word [.quietsSearched]
			cmp   ecx, dword [.quietCount]
			jae   .HistoryPenaltyDone
.HistoryPenaltyLoop:
			mov   r8d, r9d
			and   r9d, 63
			shr   r8d, 6
			and   r8d, 63
		      movzx   r8d, byte [rbp+Pos.board+r8]
			shl   r8d, 6+2
			add   ecx, 1
			mov   edx, dword [History+r8+4*r9]
			sub   edx, r11d
			cmp   edx, -HistoryStats_Max
			jle   .NoHistoryPenalty
			mov   dword [History+r8+4*r9], edx
   .NoHistoryPenalty:
		      movzx   r9d, word [.quietsSearched+2*(rcx-1)]
			cmp   ecx, dword [.quietCount]
			 jb   .HistoryPenaltyLoop
   .HistoryPenaltyDone:

			mov   ecx, dword [.bestMove]

		      movzx   r8d, word [rsi-1*sizeof.Stack+Stack.currentMove]
			mov   r9d, r8d
			mov   r10d, r8d
			and   r9d, 63
			shr   r8d, 6
			and   r8d, 63
			cmp   r8d, r9d
			 je   .NoCounterMove
		      movzx   r8d, byte[rbp+Pos.board+r9]
			shl   r8d, 6+2
			mov   edx, dword [Countermoves+r8+4*r9]
			cmp   dx, cx
			 je   .NoCounterMove
			shl   edx, 16
			mov   dx, cx
			mov   dword [Countermoves+r8+4*r9], edx
.NoCounterMove:
		      movzx   r8d, word [rsi-2*sizeof.Stack+Stack.currentMove]
			mov   r9d, r8d
			and   r9d, 63
			shr   r8d, 6
			and   r8d, 63
		     ;   cmp   r10w, word [rsi-1*sizeof.Stack+Stack.ttMove]
			 je   target
			cmp   r8d, r9d
			 je   target
		      movzx   r8d, byte[rbp+Pos.board+r9]
			shl   r8d, 6+2
			mov   edx, dword [Followupmoves+r8+4*r9]
			cmp   dx, cx
			 je   target
			shl   edx, 16
			mov   dx, cx
			mov   dword [Followupmoves+r8+4*r9], edx
			jmp   target

}