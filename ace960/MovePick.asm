if 0

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

end if


		      align   16
MovePick_Init_Search:
	; in: rbp  address of Pos
	;     rbx  address of State
	;     rsi  address of Pick
	;     ecx  Move ttm
	;     edx  Depth d


	       push   rdi r15

		mov   dword[rsi+Pick.depth], edx

		mov   rdi, qword[rbp+Pos.counterMoves]
		mov   eax, dword[rbx-1*sizeof.State+State.currentMove]
		and   eax, 63
	      movzx   edx, byte[rbp+Pos.board+rax]
		shl   edx, 6
		add   edx, eax
		mov   eax, dword[rdi+4*rdx]
		mov   dword[rsi+Pick.countermove], eax

		lea   r15, [rsi+Pick.moves]
		lea   rax, [r15+8*(MAX_MOVES-1)]
		lea   r8, [MovePick_MainSearch]
		lea   r9, [MovePick_Evasion]
		mov   r10, qword[rbx+State.checkersBB]
	       test   r10, r10
	     cmovnz   r8, r9
		mov   qword[rsi+Pick.cur], r15
		mov   qword[rsi+Pick.endBadCaptures], rax
		mov   qword[rsi+Pick.stage], r8

		mov   edi, ecx
	       test   ecx, ecx
		 jz   .NoTTMove

	       call   IsMovePseudoLegal
	       test   rax, rax
	      cmovz   edi, eax
		 jz   .NoTTMove

		add   r15, sizeof.ExtMove
.NoTTMove:
		mov   dword[rsi+Pick.ttMove], edi
		mov   qword[rsi+Pick.endMoves], r15
		pop   r15 rdi
		ret





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MovePick_MainSearch:
		cmp   r14, r15
		 je   GenNext_GoodCaptures
		mov   r14, r15
		mov   eax, dword[rsi+Pick.ttMove]
		lea   rdx, [MovePick_MainSearch]
		ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_GoodCaptures:
		lea   rdi, [rsi+Pick.moves]
		mov   r14, rdi
	       call   Gen_Captures
		mov   r15, rdi
		mov   r13, r14
      ScoreCaptures   r13, rdi



MovePick_GoodCaptures:
		cmp   r14, r15
		 je   GenNext_Killers
	   PickBest   r14, r13, r15
		mov   ecx, eax
		cmp   eax, dword[rsi+Pick.ttMove]
		 je   MovePick_GoodCaptures
	    SeeSign   .Positive
		mov   rdx, qword[rsi+Pick.endBadCaptures]
	       test   eax, eax
		 js   .Negative
  .Positive:
		mov   eax, ecx
		lea   rdx, [MovePick_GoodCaptures]
		ret
  .Negative:
		mov   dword[rdx], ecx
		sub   rdx, sizeof.ExtMove
		mov   qword[rsi+Pick.endBadCaptures], rdx
		jmp   MovePick_GoodCaptures



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_Killers:
		lea   r14, [rsi+Pick.killers+0*sizeof.ExtMove]
		lea   r15, [rsi+Pick.killers+3*sizeof.ExtMove]
		lea   r13, [rsi+Pick.killers+2*sizeof.ExtMove]
		mov   eax, dword[rbx+State.killers+4*0]
		mov   ecx, dword[rbx+State.killers+4*1]
		mov   edx, dword[rsi+Pick.countermove]
		mov   dword[r14+Pick.killers+0*sizeof.ExtMove], eax
		mov   dword[r14+Pick.killers+1*sizeof.ExtMove], ecx
		mov   dword[r14+Pick.killers+2*sizeof.ExtMove], edx
		cmp   edx, eax
	      cmove   r15, r13
		cmp   edx, ecx
	      cmove   r15, r13

MovePick_Killers:
		mov   edi, dword[r14]
		; upper 16 bits of edi should be zero if r14<r15
		mov   eax, edi
		mov   ecx, edi
		and   eax, 63
	      movzx   eax, [rbp+Pos.board+rax]
		cmp   r14, r15
		 je   GenNext_GoodQuiets
		add   r14, sizeof.ExtMove
	       test   edi, edi
		 jz   MovePick_Killers
		cmp   edi, dword[rsi+Pick.ttMove]
		 je   MovePick_Killers
		cmp   edi, MOVE_TYPE_CASTLE shl 12
		jae   .special
	       test   eax, eax
		jnz   MovePick_Killers
	       call   IsMovePseudoLegal
	       test   rax, rax
		 jz   MovePick_Killers
		mov   eax, edi
		lea   rdx, [MovePick_Killers]
		ret
.special:
		cmp   edi, MOVE_TYPE_EPCAP shl 12
		jae   MovePick_Killers
	       call   IsMovePseudoLegal
	       test   rax, rax
		 jz   MovePick_Killers
		mov   eax, edi
		lea   rdx, [MovePick_Killers]
		ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_GoodQuiets:
		lea   rdi, [rsi+Pick.moves]
		mov   r14, rdi
	       call   Gen_Quiets
		mov   qword[rsi+Pick.endQuiets], rdi
		mov   r15, rdi
		mov   r13, r14
	ScoreQuiets   r13, rdi
		mov   r12, r14
		mov   r13, r15
	  Partition   r12, r13
		mov   r15, r13
      InsertionSort   r14, r15, r12, r13


MovePick_GoodQuiets:
	      movzx   eax, word[r14]
		cmp   r14, r15
		 je   GenNext_BadQuiets
		add   r14, sizeof.ExtMove
		cmp   eax, dword[rsi+Pick.ttMove]
		 je   MovePick_GoodQuiets
		cmp   eax, dword[rsi+Pick.killers+0*sizeof.ExtMove]
		 je   MovePick_GoodQuiets
		cmp   eax, dword[rsi+Pick.killers+1*sizeof.ExtMove]
		 je   MovePick_GoodQuiets
		cmp   eax, dword[rsi+Pick.killers+2*sizeof.ExtMove]
		 je   MovePick_GoodQuiets
		lea   rdx, [MovePick_GoodQuiets]
		ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_BadQuiets:
		mov   r14, r15
		mov   eax, dword[rsi+Pick.depth]
		mov   r15, qword[rsi+Pick.endQuiets]
		cmp   eax, 3
		 jl   MovePick_BadQuiets
      InsertionSort   r14, r15, r12, r13



MovePick_BadQuiets:
		mov   eax, dword[r14]
		cmp   r14, r15
		 je   GenNext_BadCaptures
		add   r14, sizeof.ExtMove
		cmp   eax, dword[rsi+Pick.ttMove]
		 je   MovePick_BadQuiets
		cmp   eax, dword[rsi+Pick.killers+0*sizeof.ExtMove]
		 je   MovePick_BadQuiets
		cmp   eax, dword[rsi+Pick.killers+1*sizeof.ExtMove]
		 je   MovePick_BadQuiets
		cmp   eax, dword[rsi+Pick.killers+2*sizeof.ExtMove]
		 je   MovePick_BadQuiets
		lea   rdx, [MovePick_BadQuiets]
		ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_BadCaptures:
		lea   r14, [rsi+Pick.moves+(MAX_MOVES-1)*sizeof.ExtMove]
		mov   r15, qword[rsi+Pick.endBadCaptures]

MovePick_BadCaptures:
		mov   eax, dword[r14]
		cmp   r14, r15
		 je   GenNext_Evasion
		sub   r14, sizeof.ExtMove
		lea   rdx, [MovePick_BadCaptures]
		ret




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_Evasion:
		xor   eax, eax
		xor   edx, edx
		ret

MovePick_Evasion:
		cmp   r14, r15
		 je   GenNext_AllEvasions
		mov   r14, r15
		mov   eax, dword[rsi+Pick.ttMove]
		lea   rdx, [MovePick_Evasion]
		ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_AllEvasions:
		lea   rdi, [rsi+Pick.moves]
		mov   r14, rdi
	       call   Gen_Evasions
		mov   r15, rdi
		sub   rdi, sizeof.ExtMove
		cmp   rdi, r14
		 ja   MovePick_AllEvasions
		mov   r12, r14
      ScoreEvasions   r12, r15



MovePick_AllEvasions:

      ;          cmp  byte[rbp+Pos.board+SQ_D2], 8*White+Queen
      ;          jne  @f
      ;          cmp  byte[rbp+Pos.board+SQ_B1], 8*White+Knight
      ;          jne  @f
      ;          int3
      ;          call   WriteOutPosition
      ;  @@:

		cmp   r14, r15
		 je   GenNext_QSearchWithChecks
	   PickBest   r14, r13, r15
		mov   ecx, eax
		cmp   eax, dword [rsi+Pick.ttMove]
		 je   MovePick_AllEvasions
		lea   rdx, [MovePick_AllEvasions]
		ret



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_QSearchWithChecks:
		xor   eax, eax
		xor   edx, edx
		ret

MovePick_QSearchWithChecks:
		cmp   r14, r15
		 je   GenNext_QCaptures1
		mov   r14, r15
		mov   eax, dword[rsi+Pick.ttMove]
		lea   rdx, [MovePick_QSearchWithChecks]
		ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_QCaptures1:
		lea   rdi, [rsi+Pick.moves]
		mov   r14, rdi
	       call   Gen_Captures
		mov   r15, rdi
		mov   r13, r14
      ScoreCaptures   r13, rdi

MovePick_QCaptures1:
		cmp   r14, r15
		 je   GenNext_Checks
	   PickBest   r14, r13, r15
		mov   ecx, eax
		cmp   eax, dword[rsi+Pick.ttMove]
		 je   MovePick_QCaptures1
		lea   rdx, [MovePick_QCaptures1]
		ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_Checks:
		lea   rdi, [rsi+Pick.moves]
		mov   r14, rdi
	       call   Gen_QuietChecks
		mov   r15, rdi

MovePick_Checks:
	      movzx   eax, word[r14]
		cmp   r14, r15
		 je   GenNext_QSearchWithoutChecks
		add   r14, sizeof.ExtMove
		cmp   eax, dword[rsi+Pick.ttMove]
		 je   MovePick_Checks
		lea   rdx, [MovePick_Checks]
		ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_QSearchWithoutChecks:
		xor   eax, eax
		xor   edx, edx
		ret

MovePick_QSearchWithoutChecks:
		cmp   r14, r15
		 je   GenNext_QCaptures2
		mov   r14, r15
		mov   eax, dword[rsi+Pick.ttMove]
		lea   rdx, [MovePick_QSearchWithoutChecks]
		ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_QCaptures2:
		lea   rdi, [rsi+Pick.moves]
		mov   r14, rdi
	       call   Gen_Captures
		mov   r15, rdi
		mov   r13, r14
      ScoreCaptures   r13, rdi

MovePick_QCaptures2:
		cmp   r14, r15
		 je   GenNext_Probcut
	   PickBest   r14, r13, r15
		mov   ecx, eax
		cmp   eax, dword[rsi+Pick.ttMove]
		 je   MovePick_QCaptures2
		lea   rdx, [MovePick_QCaptures2]
		ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_Probcut:
		xor   eax, eax
		xor   edx, edx
		ret

MovePick_Probcut:
		cmp   r14, r15
		 je   GenNext_ProbcutCaptures
		mov   r14, r15
		mov   eax, dword[rsi+Pick.ttMove]
		lea   rdx, [MovePick_Probcut]
		ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_ProbcutCaptures:
		lea   rdi, [rsi+Pick.moves]
		mov   r14, rdi
	       call   Gen_Captures
		mov   r15, rdi
		mov   r13, r14
      ScoreCaptures   r13, rdi

MovePick_ProbcutCaptures:
		cmp   r14, r15
		 je   GenNext_Recapture
	   PickBest   r14, r13, r15
		mov   ecx, eax
		cmp   eax, dword[rsi+Pick.ttMove]
		 je   MovePick_ProbcutCaptures
	       call   See
		cmp   eax, dword[rsi+Pick.threshold]
		jle   MovePick_ProbcutCaptures
		mov   eax, ecx
		lea   rdx, [MovePick_ProbcutCaptures]
		ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_Recapture:
		xor   eax, eax
		xor   edx, edx
		ret

MovePick_Recapture:
		cmp   r14, r15
		 je   GenNext_Recaptures
	       int3



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_Recaptures:
		lea   rdi, [rsi+Pick.moves]
		mov   r14, rdi
	       call   Gen_Captures
		mov   r15, rdi
		mov   r13, r14
      ScoreCaptures   r13, rdi



MovePick_Recaptures:
		cmp   r14, r15
		 je   GenNext_Stop
	   PickBest   r14, r13, r15
		mov   ecx, eax
		and   ecx, 63
		cmp   ecx, dword[rsi+Pick.recaptureSquare]
		jne   MovePick_Recaptures
		lea   rdx, [MovePick_Recaptures]
		ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
GenNext_Stop:
		xor   eax, eax
		xor   edx, edx
		ret
MovePick_Stop:
		xor   eax, eax
		xor   edx, edx
		ret





























