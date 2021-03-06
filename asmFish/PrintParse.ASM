; printing and parsing stuff
; string functions


;;;;;;;;;;;;;;;;;; scores ;;;;;;;;;;;;;;;;;;;

PrintScore_Uci:
		cmp   ecx, +VALUE_NONE
		 je   .pNone
		 jg   .bad
		cmp   ecx, -VALUE_NONE
		 je   .nNone
		 jl   .bad
		cmp   ecx, +VALUE_INFINITE
		 je   .pInf
		cmp   ecx, -VALUE_INFINITE
		 je   .nInf
		cmp   ecx, +VALUE_MATE-MAX_PLY
		jge   .pMate
		cmp   ecx, -VALUE_MATE+MAX_PLY
		jle   .nMate

		mov   eax, 'cp '
	      stosd
		sub   rdi, 1
	       test   ecx, ecx
		jns   @f
		mov   al, '-'
		neg   ecx
	      stosb
	@@:	mov   eax, ecx
		mov   rdx, (100*(1 shl 32))/PawnValueEg
		mul   rdx
		shr   rax, 32
	       call   PrintUnsignedInteger
		ret
.pMate:
		mov   rax, 'mate '
	      stosq
		sub   rdi, 3
		mov   eax, VALUE_MATE+1
		sub   eax, ecx
		shr   eax, 1
	       call   PrintUnsignedInteger
		ret
.nMate:
		mov   rax, 'mate -'
	      stosq
		sub   rdi, 2
		mov   eax, VALUE_MATE
		add   eax, ecx
		shr   eax, 1
	       call   PrintUnsignedInteger
		ret
.nNone:
		mov   al,'-'
	      stosb
.pNone:
		mov   eax, 'NONE'
	      stosd
		ret
.nInf:
		mov   al,'-'
	      stosb
.pInf:
		mov   rax, 'INFINITE'
	      stosq
		ret

.bad:			mov   eax, 'bad '
	      stosd
	     movsxd   rax, ecx
		jmp   PrintSignedInteger


PrintScore_Xboard:
		cmp   ecx, +VALUE_NONE
		 je   .pNone
		 jg   .bad
		cmp   ecx, -VALUE_NONE
		 je   .nNone
		 jl   .bad
		cmp   ecx, +VALUE_INFINITE
		 je   .pInf
		cmp   ecx, -VALUE_INFINITE
		 je   .nInf
		cmp   ecx, +VALUE_MATE-MAX_PLY
		jge   .pMate
		cmp   ecx, -VALUE_MATE+MAX_PLY
		jle   .nMate

	       test   ecx, ecx
		jns   @f
		mov   al, '-'
		neg   ecx
	      stosb
	@@:	mov   eax, ecx
		mov   rdx, (100*(1 shl 32))/PawnValueEg
		mul   rdx
		shr   rax, 32
	       call   PrintUnsignedInteger
		ret
.pMate:
		mov   eax, VALUE_MATE+1
		sub   eax, ecx
		shr   eax, 1
		add   eax, 100000
	       call   PrintUnsignedInteger
		ret
.nMate:
		mov   eax, VALUE_MATE
		add   eax, ecx
		shr   eax, 1
		add   eax, 100000
		neg   rax
	       call   PrintSignedInteger
		ret
.nNone:
		mov   al,'-'
	      stosb
.pNone:
		mov   eax, 'NONE'
	      stosd
		ret
.nInf:
		mov   al,'-'
	      stosb
.pInf:
		mov   rax, 'INFINITE'
	      stosq
		ret

.bad:
		mov   eax, 'bad '
	      stosd
	     movsxd   rax, ecx
		jmp   PrintSignedInteger






;;;;;;;;;;;;;;;;;;;;;;; strings ;;;;;;;;;;;;;;;;;;;;;;;;


PrintString:
	      movzx   eax, byte [rcx]
		lea   rcx, [rcx+1]
		cmp   al, 0
		 je   .Done
	      stosb
		jmp   PrintString
.Done:		ret


CmpString:
	; if beginning of string at rsi matches null terminated string at rcx
	;    then advance rsi to end of match and return non zero,
	;    else return zero and do nothing
	       push   rsi
.Next:	      movzx   eax, byte [rcx]
		lea   rcx, [rcx+1]
	       test   al, al
		 jz   .Found
		cmp   al, byte [rsi]
		lea   rsi,[rsi+1]
		 je   .Next
.NoMatch:	pop   rsi
		xor   eax, eax
		ret
.Found: 	pop   rax
		 or   eax, -1
		ret


CmpStringCaseless:
	; if beginning of string at rsi matches null terminated string at rcx
	;    then advance rsi to end of match and return non zero,
	;    else return zero and do nothing
	       push   rsi
.Next:	      movzx   eax, byte[rsi]
	      movzx   edx, byte[rcx]
	      movzx   eax, byte[ToLowerCase+rax]
		lea   rcx, [rcx+1]
	       test   edx, edx
		 jz   .Found
		cmp   al, byte[ToLowerCase+rdx]
		lea   rsi, [rsi+1]
		 je   .Next
.NoMatch:	pop   rsi
		xor   eax, eax
		ret
.Found: 	pop   rax
		 or   eax, -1
		ret


	; skip spaces of string at rsi
	@@:	add   rsi, 1
SkipSpaces:	cmp   byte[rsi], ' '
		 je   @b
		ret

	; write at most ecx characters of string at rsi to rdi
	@@:	add   rsi, 1
	      stosb
_ParseToken:  movzx   eax, byte[rsi]
		sub   ecx, 1
		 js   @f
		 bt   [TokenCharacters], eax
		 jc   @b
	@@:	ret

	; skip at most ecx characters of string at rsi
	@@:	add   rsi,1
_SkipToken:   movzx   eax, byte[rsi]
		sub   ecx, 1
		 js   @f
		 bt   [TokenCharacters], eax
		 jc   @b
	@@:	ret
align 4
TokenCharacters:dd 0
		dd 00000011111111111000000000000000b
		dd 00010111111111111111111111111110b
		dd 00000111111111111111111111111110b

;;;;;;;;;;;;;;;;;;;;;;;; moves ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PrintUciMove:
	       call   _PrintUciMove
		mov   qword[rdi], rax
		add   rdi, rdx
		ret

_PrintUciMove:
	; in:  ecx  move
	;      edx  is chess960
	; out: rax  move string
	;      edx  byte length of move string  4 or 5 for promotions
		mov   r8d, edx
		mov   eax, 'NONE'
	       test   ecx, ecx
		 jz   .Return
		mov   eax, 'NULL'
		cmp   ecx, MOVE_NULL
		 jz   .Return
		xor   eax, eax
		mov   edx, ecx
		and   edx, 7
		add   edx, 'a'
		shl   edx, 16
		 or   eax, edx
		mov   edx, ecx
		shr   edx, 3
		and   edx, 7
		add   edx, '1'
		shl   edx, 24
		 or   eax, edx
		mov   edx, ecx
		shr   edx, 6
		and   edx, 7
		add   edx, 'a'
		 or   eax, edx
		mov   edx, ecx
		shr   edx, 6+3
		and   edx, 7
		add   edx, '1'
		shl   edx, 8
		 or   eax, edx
		mov   edx, ecx
		shr   edx, 12
		cmp   edx, MOVE_TYPE_CASTLE
		 je   .Castle
		cmp   edx, MOVE_TYPE_PROM+4
		jae   .Return
		sub   edx, MOVE_TYPE_PROM
		jae   .Promotion
.Return:
		mov   edx, 4
		ret
.Promotion:
		lea   ecx, [8*rdx]
		mov   edx, 'nbrq'
		shr   edx, cl
		and   edx, 0x0FF
		shl   rdx, 32
		 or   rax, rdx
		mov   edx, 5
		ret
.Castle:
	       test   r8d, r8d
		jnz   .Castle960    ; in chess960 castling moves are encoded differently
		mov   edx, 4
		ret
.Castle960:
		and   ecx, 63	; ecx = to
		xor   edx, edx
		cmp   ecx, 4
		adc   edx, edx
	      movzx   edx, byte[castling_rfrom+rdx]
		add   edx, 'a'
		and   eax, 0xFF00FFFF
		shl   edx, 16
		 or   eax, edx
		mov   edx, 4
		ret


PrintUciMoveLong:
	; in: ecx move
	; io: rdi string for move, the move type (upper 4 bits) are displayed after
	       push   rcx
	       call   PrintUciMove
		pop   rax
		shr   eax, 12
		lea   rcx, [.error]
		cmp   eax, 8
		jae   PrintString
		lea   rcx, [.normal+8*rax]
		jmp   PrintString
.normal:
 db '.NORML',0,0
 db '.DPAWN',0,0
 db '.PROM N',0
 db '.PROM B',0
 db '.PROM R',0
 db '.PROM Q',0
 db '.CASTL',0,0
 db '.EPCAP',0,0
.error:
 db '.?????',0,0




ParseUciMove:
	; if string at rsi is a legal move, it is return in eax and rsi is advanced,
	;   othersize MOVE_NONE (0) is return and rsi is unchanged

	       push   rbx rdi rsi
virtual at rsp
  .moveList    rb sizeof.ExtMove*MAX_MOVES
  .lend rb 0
end virtual
.lsize = ((.lend-rsp+15) and (-16))
	 _chkstk_ms   rsp, .lsize
		sub   rsp, .lsize

		lea   rdi, [.moveList]
		mov   rbx, qword[rbp+Pos.state]
	       call   SetCheckInfo
	       call   Gen_Legal
		xor   eax, eax
	      stosd

		mov   ebx, dword[rsi]
	      movzx   eax, byte[rsi+4]
	      movzx   eax, byte[ToLowerCase+rax]
		mov   edx, ' '
		sub   edx, eax
		adc   rsi, 4
		sar   edx, 31
		and   eax, edx
		shl   rax, 32
		 or   rbx, rax
		lea   rdi, [.moveList-sizeof.ExtMove]
.CheckNext:
		add   rdi, sizeof.ExtMove
		mov   ecx, dword[rdi+ExtMove.move]
		xor   eax, eax
	       test   ecx, ecx
		 jz   .Failed
		mov   edx, dword[rbp+Pos.chess960]
	       call   _PrintUciMove	   ; string result is in rax
		cmp   rax, rbx
		jne   .CheckNext

		mov   eax, dword[rdi+ExtMove.move]
		add   rsp, .lsize
		pop   rdx rdi rbx	   ; move found - keep advanced value of rsi
		ret

.Failed:
		add   rsp, .lsize
		pop   rsi rdi rbx
		ret






;;;;;;;;;;;; bitboard ;;;;;;;;;;;;;;;;;;;

PrintBitboard:	 ; in: rcx bitboard
		 ; io: rdi string
		xor   edx, edx
       .NextBit:
		xor   edx, 0111000b  ; don't print upside down
		 bt   rcx, rdx
		sbb   eax, eax
		xor   edx, 0111000b  ;
		add   edx, 1
		and   eax, 'X'-'.'
		add   eax, '. ' + (10 shl 16)
	      stosd
		mov   eax, edx
		and   eax, 7
		neg   eax
		sbb   rdi, 1
		cmp   edx, 64
		 jb   .NextBit
		ret

PrintBitboardCompact:
	       push   rsi
		mov   rsi, rcx
	@@:    test   rsi, rsi
		 jz   @f
		bsf   rcx, rsi
	       blsr   rsi, rsi, rax
	       call   PrintSquare
		mov   al, ' '
	      stosb
		jmp   @b
	@@:	pop   rsi
		ret

;;;;;;;;;;;;; square ;;;;;;;;;;;;;;;;

PrintSquare:
		mov   al,'-'
		cmp   ecx, 64
		jae   .none
		mov   eax, ecx
		and   eax, 7
		add   eax, 'a'
	      stosb
		mov   eax, ecx
		shr   eax, 3
		add   eax, '1'
.none:
	      stosb
		ret

ParseSquare:
	; if string at rsi is a square return it
	;    else return 65 and don't change rsi
		mov   rdx, rsi
		xor   eax, eax
	      lodsb
		mov   ecx, eax
		cmp   al, '-'
		 je   .none
		sub   ecx, 'a'
		 js   .error
		cmp   ecx, 8
		jae   .error
		xor   eax, eax
	      lodsb
		sub   eax, '1'
		 js   .error
		cmp   eax, 8
		jae   .error
		lea   eax, [rcx+8*rax]
		ret
.none:
		mov   eax, 64
		ret
.error:
		mov   rsi, rdx
		mov   eax, 65
		ret





ParseBoole:
	; io: rsi string
	;out: rax = -1 if string starts with true
	;         = 0  otherwise
	; rsi is advanced if true or false is read

		 or   rax, -1
		mov   ecx, dword[rsi]
		add   rsi, 4
		cmp   ecx, 'true'
		 je   .done
		sub   rsi, 4
		xor   eax, eax
		cmp   ecx, 'fals'
		jne   .done
		cmp   byte[rsi+4], 'e'
		jne   .done
		add   rsi, 5
	.done:
		ret





;;;;;;;;;;;;;;;; numbers ;;;;;;;;;;;;;;;;;;;;;;;;;;

ParseInteger:
	; io: rsi string
	;out: rax signed integer
	       push   rcx rdx
		xor   ecx, ecx
		xor   eax, eax
		xor   edx, edx
		cmp   byte [rsi],'-'
		 je   .neg
		cmp   byte [rsi],'+'
		 je   .pos
		jmp   .next
 .neg:		not   rdx
 .pos:		add   rsi,1
 .next: 	mov   cl, byte[rsi]
	       test   cl, cl
		 jz   .done
		sub   cl, '0'
		 js   .done
		cmp   cl, 9
		 ja   .done
		add   rsi, 1
		lea   rax, [5*rax]
		lea   rax, [2*rax+rcx]
		jmp   .next
.done:		xor   rax, rdx
		sub   rax, rdx
		pop   rdx rcx
		ret

PrintSignedInteger:
	; in: rax signed integer
	; io: rdi string
		mov   rcx, rax
		sar   rcx, 63
		mov   byte[rdi], '-'
		sub   rdi, rcx
		xor   rax, rcx
		sub   rax, rcx
PrintUnsignedInteger:
	; in: rax unsigned integer
	; io: rdi string
	       push   rbp rcx rdx
		mov   ecx, 10
		mov   rbp, rsp
	.l1:	xor   edx, edx
		div   rcx
	       push   rdx
	       test   rax, rax
		jnz   .l1
	.l2:	pop   rax
		add   al, '0'
	      stosb
		cmp   rsp,rbp
		 jb   .l2
		pop   rdx rcx rbp
		ret




PrintAddress:
	      bswap   rcx
	      vmovq   xmm0, rcx
	      vpand   xmm1, xmm0, dqword[.Mask1]
	     vpsrlq   xmm0, xmm0, 4
	      vpand   xmm0, xmm0, dqword[.Mask1]
	 vpunpcklbw   xmm0, xmm0, xmm1
	     vpaddb   xmm1, xmm0, dqword[.Sum1]
	   vpcmpgtb   xmm0, xmm0, dqword[.Comp1]
	      vpand   xmm0, xmm0, dqword[.Num1]
	     vpaddb   xmm0, xmm0, xmm1
	    vmovdqu   dqword[rdi], xmm0
		add   rdi, 16
		ret
align 16
  .Sum1  dq 3030303030303030h, 3030303030303030h
  .Mask1 dq 0f0f0f0f0f0f0f0fh, 0f0f0f0f0f0f0f0fh
  .Comp1 dq 0909090909090909h, 0909090909090909h
  .Num1  dq 0707070707070707h, 0707070707070707h

