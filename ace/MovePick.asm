

		      align   16
TestPick:
		       push   rbx rdi rsi r12 r13 r14 r15
virtual at rsp
  .movepick rb sizeof.Pick
  .lend rb 1
end virtual
  .localsize = .lend - rsp

			sub   rsp, .localsize
			mov   rbx, [rbp+Pos.state]
			lea   rsi, [.movepick]
			mov   word [rsi+Pick.countermoves+2*0], 0
			mov   word [rsi+Pick.countermoves+2*1], 0
			mov   word [rsi+Pick.followupmoves+2*0], 0
			mov   word [rsi+Pick.followupmoves+2*1], 0
			mov   byte [rsi+Pick.recaptureSquare], 64
			xor   ecx, ecx
		       call   MovePick_Init_Search

.GenNext:
		GetNextMove
			mov   edi, eax
		       test   eax, eax
			 jz   .GenDone

			mov   ecx, eax
		       call   IsMoveLegal
		       test   rax, rax
			 jz   .GenNext

			mov   ecx, edi
			lea   rdi, [Output]
		       call   PrintUciMove
			mov   al, 10
		      stosb

			lea   rcx, [Output]
		       call   _WriteOut
			jmp   .GenNext
.GenDone:

			add   rsp, .localsize
			pop   r15 r14 r13 r12 rsi rdi rbx
			ret



		      align   16
MovePick_Init_Search:
		; in: rbp  address of Pos
		;     rsi  address of Pick
		;     rbx  address of State
		;     ecx  ttm
		;     edx  cm
		;     r8d  fm

		       push   rdi r15

			lea   r15, [rsi+Pick.moves]
			lea   rax, [r15+8*(MAX_MOVES-1)]
			lea   r8, [MovePick_MainSearch]
			lea   r9, [MovePick_Evasion]

			mov   qword [rsi+Pick.cur], r15
			mov   qword [rsi+Pick.endBadCaptures], rax

			mov   r10, qword [rbx+State.checkersBB]
		       test   r10, r10
		     cmovnz   r8, r9
			mov   qword [rsi+Pick.stage], r8

			mov   edi, ecx
		       test   ecx, ecx
			 jz   .NoTTMove

		       call   IsMovePseudoLegal
		       test   rax, rax
		      cmovz   edi, eax
			 jz   .NoTTMove

			add   r15, 8
.NoTTMove:
			mov   dword [rsi+Pick.ttMove], edi
			mov   qword [rsi+Pick.end], r15
			pop   r15 rdi
			ret






MovePick_MainSearch:
			cmp   r14, r15
			jae   GenNext_Captures_S1
			mov   r14, r15
			mov   eax, dword[rsi+Pick.ttMove]
			lea   rdx, [MovePick_MainSearch]
			ret


GenNext_Captures_S1:
			lea   rdi, [rsi+Pick.moves]
			mov   r14, rdi
		       call   Gen_Captures
			mov   r15, rdi
			mov   r13, r14
	      ScoreCaptures   r13, rdi



MovePick_Captures_S1:
			cmp   r14, r15
			jae   GenNext_Killers_S1
		   PickBest   r14, r13, r15
			mov   ecx, eax
			cmp   eax, dword [rsi+Pick.ttMove]
			 je   MovePick_Captures_S1
		    SeeSign   .Positive
			mov   rdx, qword[rsi+Pick.endBadCaptures]
		       test   eax, eax
			 js   .Negative
  .Positive:
			mov   eax, ecx
			lea   rdx, [MovePick_Captures_S1]
			ret
  .Negative:
			mov   dword [rdx], ecx
			sub   rdx, 8
			mov   qword[rsi+Pick.endBadCaptures], rdx
			jmp   MovePick_Captures_S1



GenNext_Killers_S1:
			mov   rcx, qword [rsi+Pick.ss]
			lea   r14, [rsi+Pick.killers+8*0]
			lea   r15, [rsi+Pick.killers+8*2]
			xor   eax, eax
		      movzx   edx, word [rcx+Stack.killers+2*1]
		      movzx   ecx, word [rcx+Stack.killers+2*0]
			mov   dword [rsi+Pick.killers+8*0], ecx
			mov   dword [rsi+Pick.killers+8*1], edx
			mov   dword [rsi+Pick.killers+8*2], eax
			mov   dword [rsi+Pick.killers+8*3], eax
			mov   dword [rsi+Pick.killers+8*4], eax
			mov   dword [rsi+Pick.killers+8*5], eax

	irps i, 0 1 {
		      movzx   eax, word [rsi+Pick.countermoves+2*i]
			cmp   eax, ecx
			 je   @f
			cmp   eax, edx
			 je   @f
			mov   dword [r15], eax
			add   r15, 8
			@@:
	}

			mov   r8d, dword [rsi+Pick.killers+8*2]
			mov   r9d, dword [rsi+Pick.killers+8*3]

	irps i, 0 1 {
		      movzx   eax, word [rsi+Pick.followupmoves+2*i]
			cmp   eax, edx
			 je   @f
			cmp   eax, ecx
			 je   @f
			cmp   eax, r8d
			 je   @f
			cmp   eax, r9d
			 je   @f
			mov   dword [r15], eax
			add   r15, 8
			@@:
	}




MovePick_Killers_S1:
			mov   edi, dword [r14+0]
			mov   eax, edi
			mov   ecx, edi
			shr   ecx, 12
			cmp   r14, r15
			jae   GenNext_Quiets_1_S1
			and   eax, 63
		      movzx   eax, [rbp+Pos.board+rax]
			add   r14, 8
		       test   edi, edi
			 jz   MovePick_Killers_S1
			cmp   edi, dword [rsi+Pick.ttMove]
			 je   MovePick_Killers_S1
		       test   eax, eax
			jnz   MovePick_Killers_S1
			cmp   ecx, MOVE_TYPE_EPCAP
			 je   MovePick_Killers_S1
			mov   ecx, edi
		       call   IsMovePseudoLegal
		       test   rax, rax
			 jz   MovePick_Killers_S1

		 ;      push   rdi rsi
		 ;       lea  rdi,[Output]
		 ;       mov  rax, '--killer'
		 ;     stosq
		 ;       mov  al, 10
		 ;     stosb
		 ;     call   _WriteOut_Output
		 ;       pop   rsi rdi

			mov   eax, edi
			lea   rdx, [MovePick_Killers_S1]
			ret




GenNext_Quiets_1_S1:
			lea   rdi, [rsi+Pick.moves]
			mov   r14, rdi
		       call   Gen_Quiets
			mov   qword [rsi+Pick.endQuiets], rdi
			mov   r15, rdi
			mov   r13, r14
		ScoreQuiets   r13, rdi

			mov   r12, r14
			mov   r13, r15
		  Partition   r12, r13
			mov   r15, r13

	      InsertionSort   r14, r15, r12, r13


MovePick_Quiets_1_S1:
			mov   eax, dword [r14+0]
			cmp   r14, r15
			jae   GenNext_Quiets_2_S1
			add   r14, 8
			cmp   eax, dword [rsi+Pick.ttMove]
			 je   MovePick_Quiets_1_S1
	irps i, 0 1 2 3 4 5 {
			cmp   eax, dword [rsi+Pick.killers+8*i]
			 je   MovePick_Quiets_1_S1
	}
			lea   rdx, [MovePick_Quiets_1_S1]
			ret


GenNext_Quiets_2_S1:
			mov   r14, r15
		      movzx   eax, byte [rsi+Pick.depth]
			mov   r15, qword [rsi+Pick.endQuiets]
			cmp   eax, 3
			 jb   MovePick_Quiets_2_S1
	      InsertionSort   r14, r15, r12, r13



MovePick_Quiets_2_S1:
			mov   eax, dword [r14+0]
			cmp   r14, r15
			jae   GenNext_BadCaptures
			add   r14, 8
			cmp   eax, dword [rsi+Pick.ttMove]
			 je   MovePick_Quiets_2_S1
	irps i, 0 1 2 3 4 5 {
			cmp   eax, dword [rsi+Pick.killers+8*i]
			 je   MovePick_Quiets_2_S1
	}
			lea   rdx, [MovePick_Quiets_2_S1]
			ret


GenNext_BadCaptures:
			lea   r14, [rsi+Pick.moves+8*(MAX_MOVES-1)]
			mov   r15, qword [rsi+Pick.endBadCaptures]

MovePick_BadCaptures:
			mov   eax, dword [r14+0]
			cmp   r14, r15
			jbe   GenNext_Evasion
			sub   r14, 8
			lea   rdx, [MovePick_BadCaptures]
			ret




GenNext_Evasion:
			xor   eax, eax
			xor   edx, edx
			ret

MovePick_Evasion:
			cmp   r14, r15
			jae   GenNext_Evasions_S2
			mov   r14, r15
			mov   eax, dword[rsi+Pick.ttMove]
			lea   rdx, [MovePick_Evasion]
			ret



GenNext_Evasions_S2:
			lea   rdi, [rsi+Pick.moves]
			mov   r14, rdi
		       call   Gen_Evasions
			mov   r15, rdi
			cmp   r14, rdi
			 je   MovePick_Evasions_S2
			mov   r12, r14
	      ScoreEvasions   r12, r15



MovePick_Evasions_S2:
			cmp   r14, r15
			jae   GenNext_QSearch_0
		   PickBest   r14, r13, r15
			mov   ecx, eax
			cmp   eax, dword [rsi+Pick.ttMove]
			 je   MovePick_Evasions_S2
			lea   rdx, [MovePick_Evasions_S2]
			ret



GenNext_QSearch_0:
			xor   eax, eax
			xor   edx, edx
			ret

MovePick_QSearch_0:
			cmp   r14, r15
			jae   GenNext_Captures_S3
			mov   r14, r15
			mov   eax, dword[rsi+Pick.ttMove]
			lea   rdx, [MovePick_QSearch_0]
			ret


GenNext_Captures_S3:
			lea   rdi, [rsi+Pick.moves]
			mov   r14, rdi
		       call   Gen_Captures
			mov   r15, rdi
			mov   r13, r14
	      ScoreCaptures   r13, rdi

MovePick_Captures_S3:
			cmp   r14, r15
			jae   GenNext_QuietChecks_S3
		   PickBest   r14, r13, r15
			mov   ecx, eax
			cmp   eax, dword [rsi+Pick.ttMove]
			 je   MovePick_Captures_S3
			lea   rdx, [MovePick_Captures_S3]
			ret

GenNext_QuietChecks_S3:
			lea   rdi, [rsi+Pick.moves]
			mov   r14, rdi
		       call   Gen_QuietChecks
			mov   r15, rdi

MovePick_QuietChecks_S3:
			mov   eax, dword [r14+0]
			cmp   r14, r15
			jae   GenNext_QSearch_1
			add   r14, 8
			cmp   eax, dword [rsi+Pick.ttMove]
			 je   MovePick_QuietChecks_S3
			lea   rdx, [MovePick_QuietChecks_S3]
			ret

GenNext_QSearch_1:
			xor   eax, eax
			xor   edx, edx
			ret
MovePick_QSearch_1:
			cmp   r14, r15
			jae   GenNext_Captures_S4
			mov   r14, r15
			mov   eax, dword[rsi+Pick.ttMove]
			lea   rdx, [MovePick_QSearch_1]
			ret
GenNext_Captures_S4:
			lea   rdi, [rsi+Pick.moves]
			mov   r14, rdi
		       call   Gen_Captures
			mov   r15, rdi
			mov   r13, r14
	      ScoreCaptures   r13, rdi

MovePick_Captures_S4:
			cmp   r14, r15
			jae   GenNext_Probcut
		   PickBest   r14, r13, r15
			mov   ecx, eax
			cmp   eax, dword [rsi+Pick.ttMove]
			 je   MovePick_Captures_S4
			lea   rdx, [MovePick_Captures_S4]
			ret


GenNext_Probcut:
			xor   eax, eax
			xor   edx, edx
			ret

MovePick_Probcut:
			cmp   r14, r15
			jae   GenNext_Captures_S5
			mov   r14, r15
			mov   eax, dword[rsi+Pick.ttMove]
			lea   rdx, [MovePick_Probcut]
			ret


GenNext_Captures_S5:
			lea   rdi, [rsi+Pick.moves]
			mov   r14, rdi
		       call   Gen_Captures
			mov   r15, rdi
			mov   r13, r14
	      ScoreCaptures   r13, rdi

MovePick_Captures_S5:
			cmp   r14, r15
			jae   GenNext_Recapture
		   PickBest   r14, r13, r15
			mov   ecx, eax
			cmp   eax, dword [rsi+Pick.ttMove]
			 je   MovePick_Captures_S5
		       call   See
			cmp   eax, dword[rsi+Pick.captureThreshold]
			jle   MovePick_Captures_S5
			mov   eax, ecx
			lea   rdx, [MovePick_Captures_S5]
			ret

GenNext_Recapture:
			xor   eax, eax
			xor   edx, edx
			ret

MovePick_Recapture:
			cmp   r14, r15
			jae   GenNext_Captures_S6
		       int3



GenNext_Captures_S6:
			lea   rdi, [rsi+Pick.moves]
			mov   r14, rdi
		       call   Gen_Captures
			mov   r15, rdi
			mov   r13, r14
	      ScoreCaptures   r13, rdi



MovePick_Captures_S6:
			cmp   r14, r15
			jae   GenNext_Stop
		   PickBest   r14, r13, r15
			mov   ecx, eax
			and   ecx, 63
			cmp   cl, byte [rsi+Pick.recaptureSquare]
			jne   MovePick_Captures_S6
			lea   rdx, [MovePick_Captures_S6]
			ret


GenNext_Stop:
			xor   eax, eax
			xor   edx, edx
			ret
MovePick_Stop:
			xor   eax, eax
			xor   edx, edx
			ret





























