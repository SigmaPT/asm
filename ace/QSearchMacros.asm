

macro QSearch NT, InCheck {

virtual at rsp

  .ss	     rq 1
  .tte	     rq 1
  .ltte      rq 1
  .searchFxn rq 1

  .ttMove	  rd 1
  .ttValue	  rd 1
  .ttDepth	  rd 1
  .move 	  rd 1
  .excludedMove   rd 1
  .bestMove	  rd 1
  .ext		  rd 1
  .newDepth	  rd 1
  .predictedDepth rd 1
  .moveCount	  rd 1
  .oldAlpha	  rd 1
  .alpha	  rd 1
  .beta 	  rd 1
  .depth	  rd 1
  .bestValue	  rd 1
  .value	  rd 1
  .eval 	  rd 1
  .nullValue	  rd 1
  .futilityValue  rd 1
  .futilityBase   rd 1

  .inCheck		   rb 1
  .givesCheck		   rb 1
  .singularExtensionNode   rb 1
  .improving		   rb 1
  .captureOrPromotion	   rb 1
  .dangerous		   rb 1
  .doFullDepthSearch	   rb 1
  .cutNode		   rb 1
  .ttHit		   rb 1
			   rb 1
			   rb 1
			   rb 1
			   rb 1
			   rb 1
			   rb 1
			   rb 1

  .movepick	  rb sizeof.Pick

  .lend rb 0
end virtual
.localsize = ((.lend-rsp+15) and (-16))


match =_PV_NODE, NT
\{
 .PvNode equ 1
\}

match =_NONPV_NODE, NT
\{
 .PvNode equ 0
\}

		       push   rbx rsi rdi r12 r13 r14 r15
			sub   rsp, .localsize

			mov   rsi, r9
			mov   rbx, [rbp+Pos.state]

			mov   dword [.alpha], ecx
			mov   dword [.beta], edx
			mov   dword [.depth], r8d
			mov   qword [.ss], r9


if SEARCH_DEBUG = 1
push rcx r9
cmp byte[QSearchTesting],0
je @f
;int3
   lea	rdi,[Output]
   mov	rax, 'hello'
   stosq
   sub rdi,3
   mov al,10
   stosb
   call _WriteOut_Output
@@:
pop r9 rcx
end if

		      movzx   edx, byte [rsi+Stack.ply-1*sizeof.Stack]
			add   edx, 1
			xor   eax, eax
	if .PvNode eq 1
			mov   dword[.oldAlpha], ecx
			mov   dword [rsi+Stack.pv], eax
	end if
			mov   dword [.bestMove], eax
			mov   word [rsi+Stack.currentMove], ax
			mov   byte [rsi+Stack.ply], dl

		; check for instant draw or max ply
		      movzx   eax, byte [rbx+State.rule50]
		      movzx   r8d, byte [rbx+State.pliesFromNull]
			mov   r9, qword [rbx+State.key]
			cmp   edx, MAX_PLY
			jae   .AbortSearch_PlyBigger
			cmp   byte [Signals.stop], 0
			jne   .AbortSearch_PlySmaller
			cmp   eax, 100
			jae   .CheckDrawBy50
			cmp   eax, r8d
		      cmova   eax, r8d
			shr   eax, 1
			 jz   .NoDrawBy50
		       imul   rax, -2*sizeof.State
	     @@:	cmp   r9, qword [rbx+rax+State.key]
			 je   .AbortSearch_PlySmaller
			add   rax, 2*sizeof.State
			jnz   @b
     .NoDrawBy50:

	if InCheck eq 1
			mov   r12d, DEPTH_QS_CHECKS
			mov   dword [.ttDepth],r12d
	else
			mov   eax, DEPTH_QS_CHECKS
			mov   r12d, DEPTH_QS_NO_CHECKS
			cmp   eax, dword [.depth]
		     cmovle   r12d, eax
			mov   dword [.ttDepth], r12d
	end if

		; transposition table lookup
			mov   rcx, qword [rbx+State.key]
			sub   r12d, 1
		       call   HashTable_Probe
			mov   qword [.tte], rax
			mov   qword [.ltte], rcx
			mov   byte [.ttHit], dl
			mov   rdi, rcx
			sar   rdi, 48
		      movsx   eax, ch
			sub   r12d, eax
			sar   r12d, 31
			shr   rcx, 16
			mov   r13d, edx
			mov   word [rsi+Stack.ttMove], cx
		      movzx   ecx, cx
			mov   dword [.ttMove], ecx
			mov   dword [.ttValue], edi

			lea   r8d, [rdi+VALUE_MATE_IN_MAX_PLY]
		       test   edx, edx
			 jz   .DontReturnTTValue

			mov   eax, edi
			sub   eax, dword [.beta]
			sar   eax, 31
			cmp   edi, VALUE_NONE
			 je   .DontReturnTTValue
			cmp   r8d, 2*VALUE_MATE_IN_MAX_PLY
			jae   .ValueFromTT
.ValueFromTTRet:
	if .PvNode eq 0
			add   eax, BOUND_LOWER
			and   eax, r12d
		       test   al, byte [.ltte+TTEntry.genBound]
			jnz   .ReturnTTValue
	end if

.DontReturnTTValue:

	if InCheck eq 1
			mov   word [rsi+Stack.staticEval], VALUE_NONE
			mov   dword [.bestValue], -VALUE_INFINITE
			mov   dword [.futilityBase], -VALUE_INFINITE
	else
		      movzx   edx, word [rsi+Stack.currentMove-1*sizeof.Stack]
		       test   r13d, r13d
			 jz   .StaticValueNoTTHit
.StaticValueYesTTHit:
		      movsx   eax, word [.ltte+TTEntry.evalValue]
			cmp   eax, VALUE_NONE
			jne   @f
		       call   Evaluate
		@@:	xor   ecx, ecx
			mov   word [rsi+Stack.staticEval], ax

			cmp   edi, eax
		       setg   cl
			add   ecx, BOUND_UPPER
			cmp   edi, VALUE_NONE
			 je   .StaticValueDone
		       test   cl, byte [.ltte+TTEntry.genBound]
		     cmovnz   eax, edi
			jmp   .StaticValueDone
.StaticValueNoTTHit:
		      movsx   eax, word [rsi+Stack.staticEval-1*sizeof.Stack]
			neg   eax
			add   eax, 2*Eval_Tempo
			cmp   edx, MOVE_NULL
			 je   @f
		       call   Evaluate
		@@:	mov   word [rsi+Stack.staticEval], ax
.StaticValueDone:
			mov   dword [.bestValue], eax

		; Return immediately if static value is at least beta
			cmp   eax, dword [.beta]
			jge   .ReturnStaticValue


	    if .PvNode eq 1
			mov   ecx, dword [.alpha]
			cmp   ecx, eax
		      cmovl   ecx, eax
			mov   dword [.alpha], ecx
	    end if
			add   eax, 128
			mov   dword [.futilityBase], eax
	end if


if SEARCH_DEBUG eq 1
cmp byte[QSearchTesting],0
je @f
lea rdi,[Output]
szcall PrintString,'starting pick'
mov al,10
stosb
call _WriteOut_Output
@@:
end if

		; initialize move picker
		      movzx   eax, word [rsi+Stack.currentMove-1*sizeof.Stack]
			mov   rcx, rsi
			lea   rsi, [.movepick]
			mov   qword [rsi+Pick.ss], rcx
			lea   r15, [rsi+Pick.moves]
			mov   qword [rsi+Pick.cur], r15
			mov   ecx, dword [.ttMove]

	if InCheck eq 1
			lea   rdx, [MovePick_Evasion]
			jmp   .MovePickInitGo
	else
			lea   rdx, [MovePick_QSearch_0]
			cmp   dword [.depth], DEPTH_QS_NO_CHECKS
			 jg   .MovePickInitGo
			lea   rdx, [MovePick_QSearch_1]
			cmp   dword [.depth], DEPTH_QS_RECAPTURES
			 jg   .MovePickInitGo
			lea   rdx, [MovePick_Recapture]
			and   eax, 63
			mov   byte [rsi+Pick.recaptureSquare], al
			xor   edi, edi
			mov   qword [rsi+Pick.stage], rdx
			jmp   .MovePickNoTTMove
	end if

 .MovePickInitGo:
			mov   qword [rsi+Pick.stage], rdx
			mov   edi, ecx
		       test   ecx, ecx
			 jz   .MovePickNoTTMove

		       call   IsMovePseudoLegal
		       test   rax, rax
		      cmovz   edi, eax
			 jz   .MovePickNoTTMove

			add   r15, 8
.MovePickNoTTMove:
			mov   dword [rsi+Pick.ttMove], edi
			mov   qword [rsi+Pick.end], r15


.MovePickLoop:
			lea   rsi, [.movepick]
		GetNextMove
			mov   dword [.move], eax
			mov   rsi, qword [.ss]
		       test   eax, eax
			 jz   .MovePickDone

		; check for check and get address of search function
			mov   ecx, eax
		       call   GivesCheck
			mov   byte [.givesCheck], al
		      movsx   r13d, al
	if .PvNode eq 1
			lea   rdx, [QSearch_Pv_NoCheck]
			lea   rcx, [QSearch_Pv_InCheck]
	else
			lea   rdx, [QSearch_NonPv_NoCheck]
			lea   rcx, [QSearch_NonPv_InCheck]
	end if
		       test   eax, eax
		     cmovnz   rdx, rcx
			mov   qword [.searchFxn], rdx




    if .PvNode eq 0
			mov   ecx, dword [.move]
			mov   edi, dword [.bestValue]

			mov   r8d, ecx
			shr   r8d, 6
			and   r8d, 63				; r8d = from
		      movzx   eax, byte [rbp+Pos.board+r8]     ; r14d = from piece
			mov   r14d, eax

			mov   r9d, ecx
			and   r9d, 63				; r9d = to
		      movzx   r15d, byte [rbp+Pos.board+r9]	; r15d = to piece

		; futility pruning
	if InCheck eq 0
			mov   r12d, dword [.futilityBase]
		       test   r13d,r13d
			jnz   .SkipFutilityPruning
			and   eax, 7
			cmp   r12d, -VALUE_KNOWN_WIN
			jle   .SkipFutilityPruning

			mov   edx, dword [rbp+Pos.sideToMove]
			neg   edx
			cmp   eax, Pawn
			 je   .CheckAdvancedPawnPush
.DoFutilityPruning:
			mov   edx, dword [PieceValue_EG+4*r15]
			add   edx, r12d
			cmp   edx, dword [.beta]
			 jl   .ContinueFromFutilityValue
			cmp   r12d, dword [.beta]
			 jl   .ContinueFromFutilityBase
.SkipFutilityPruning:
	end if

		; prepare pieces for Zobrist look up
			shl   r14d, 6+3
			shl   r15d, 6+3

		; do not search moves with negative see value
	if InCheck eq 0
			cmp   ecx, MOVE_TYPE_PROM shl 12
			jae   .DontContinue
	else
			mov   eax, dword [rbp+Pos.sideToMove]
			cmp   edi, VALUE_MATED_IN_MAX_PLY
			jle   .DontContinue
		       test   r15d, r15d
			jnz   .DontContinue
			cmp   ecx, MOVE_TYPE_EPCAP shl 12
			jae   .DontContinue
			lea   eax, [3+9*rax]
		       test   al, byte [rbx+State.castlingRights]
			jnz   .DontContinue
	end if
		    SeeSign   .DontContinue
		       test   eax, eax
			 js   .MovePickLoop
.DontContinue:

		; prepare square for prefetch
			mov   edx, ecx
			and   edx, 63				; edx = to
			shr   ecx, 6
			and   ecx, 63				; ecx = from

    else;.PvNode eq 1
			mov   ecx, dword [.move]
			mov   edx, ecx
			and   edx, 63				; edx = to
			shr   ecx, 6
			and   ecx, 63				; ecx = from
		      movzx   r14, byte[rbp+Pos.board+rcx]
		      movzx   r15, byte[rbp+Pos.board+rdx]
			shl   r14d, 6+3
			shl   r15d, 6+3

    end if

		; speculative prefetch
			mov   rax, qword [rbx+State.key]
			xor   rax, qword [Zobrist_side]
			xor   rax, qword [Zobrist_Pieces+r14+8*rcx]
			xor   rax, qword [Zobrist_Pieces+r14+8*rdx]
			xor   rax, qword [Zobrist_Pieces+r15+8*rdx]
			and   rax, qword [hashTable+TT.mask]
			shl   rax, 5
			add   rax, qword [hashTable+TT.table]
		   Prefetch   [rax]


		; check for legality
			mov   ecx, dword [.move]
		       call   IsMoveLegal
		       test   rax, rax
			 jz   .MovePickLoop

if SEARCH_DEBUG eq 1
cmp byte[QSearchTesting],0
je @f
lea rdi,[Output]
mov ecx,dword[.depth]
neg ecx
mov eax,'    '
rep stosd
mov ecx, dword[.move]
call PrintUciMove
mov rax,' nodes: '
stosq
mov rax, qword[rbp+Pos.nodes]
call PrintUnsignedInteger
mov al,10
stosb
call _WriteOut_Output
@@:
end if

		; make the move
		      movzx   edx, byte [.givesCheck]
			mov   ecx, dword [.move]
			mov   word [rsi+Stack.currentMove], cx
			add   qword [rbp+Pos.nodes], 1
		       call   DoMove_SetFullCi

		; search the move
			mov   ecx, dword [.beta]
			neg   ecx
			mov   edx, dword [.alpha]
			neg   edx
			mov   r8d, dword [.depth]
			sub   r8d, 1
			lea   r9, [rsi+sizeof.Stack]
		       call   qword [.searchFxn]
			neg   eax
			mov   edi, eax
			mov   dword [.value], eax

		; undo the move
			mov   ecx, dword [.move]
		       call   UndoMove

		; check for new best move
			mov   ecx, dword [.move]
			cmp   edi, dword [.bestValue]
			jle   .MovePickLoop
			mov   dword [.bestValue], edi
			cmp   edi, dword [.alpha]
			jle   .MovePickLoop

	if .PvNode eq 1
			lea   rdx, [rsi+Stack.pv]
			mov   word [rdx], cx
		@@:   movzx   eax, word [rdx+sizeof.Stack]
			add   rdx, 2
			mov   word [rdx], ax
		       test   eax, eax
			jnz   @b
	end if

	if .PvNode eq 1
			cmp   edi, dword [.beta]
			jge   .FailHigh
			mov   dword [.alpha], edi
			mov   dword [.bestMove], ecx
			jmp   .MovePickLoop
	end if

.FailHigh:

			mov   r9, qword [rbx+State.key]
			mov   r8, qword [.tte]
			shr   r9, 48
			mov   edx, edi
			lea   ecx, [rdi+VALUE_MATE_IN_MAX_PLY]
			cmp   ecx, 2*VALUE_MATE_IN_MAX_PLY
			jae   .FailHighValueToTT
.FailHighValueToTTRet:
			mov   eax, dword [.move]
	     HashTable_Save   r8, r9w, edx, BOUND_LOWER, byte [.ttDepth], eax, word [rsi+Stack.staticEval]
			mov   eax, edi
			jmp   .Return

	 .FailHighValueToTT:
		      movzx   edx, byte [rsi+Stack.ply]
			mov   eax, edi
			sar   eax, 31
			xor   edx, eax
			sub   edx, eax
			add   edx, edi
			jmp   .FailHighValueToTTRet



.MovePickDone:
			mov   r9, qword [rbx+State.key] 	; ok to trash ebx after this read
			mov   edi, dword [.bestValue]
			lea   ecx, [rdi+VALUE_MATE_IN_MAX_PLY]

	if InCheck eq 1
		      movzx   eax, byte [rsi+Stack.ply]
			sub   eax, VALUE_MATE
			cmp   edi, -VALUE_INFINITE
			 je   .Return
	end if

	if .PvNode eq 1
			mov   ebx, dword [.oldAlpha]
			sub   ebx, edi
			sar   ebx, 31
	end if
			mov   r8, qword [.tte]
			shr   r9, 48
			mov   edx, edi
			cmp   ecx, 2*VALUE_MATE_IN_MAX_PLY
			jae   .ValueToTT
     .ValueToTTRet:


	if .PvNode eq 0
			mov   eax, dword [.bestMove]
	     HashTable_Save   r8, r9w, edx, BOUND_UPPER, byte [.ttDepth], eax, word [rsi+Stack.staticEval]
	else
			mov   eax, dword [.bestMove]
			and   ebx, BOUND_EXACT-BOUND_UPPER
			add   ebx, BOUND_UPPER
	     HashTable_Save   r8, r9w, edx, bl, byte [.ttDepth], eax, word [rsi+Stack.staticEval]
	end if
			mov   eax, edi

.Return:
			add   rsp, .localsize
			pop   r15 r14 r13 r12 rdi rsi rbx
			ret









;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	if .PvNode eq 0
	if InCheck eq 0

		      align   8
.CheckAdvancedPawnPush:
			and   edx, 7
			shr   r8d, 3
			xor   edx, r8d
			cmp   edx, 4
			 jb   .DoFutilityPruning
			jmp   .SkipFutilityPruning

		      align   8
.ContinueFromFutilityBase:
		       call   See
			mov   edx, r12d
			cmp   eax, 0
			 jg   .SkipFutilityPruning

		      align   8
.ContinueFromFutilityValue:
			cmp   edi, edx
		      cmovl   edi, edx
			mov   dword [.bestValue], edi
			jmp   .MovePickLoop

	end if
	end if

		      align   8
.AbortSearch_PlyBigger:
			mov   eax, dword [rbp+Pos.sideToMove]
			mov   eax, dword [DrawValue+4*rax]
			cmp   qword [rbx+State.checkersBB], 0
			 je   .Return
		       call   Evaluate
			jmp   .Return

		      align   8
.AbortSearch_PlySmaller:
			mov   eax, dword [rbp+Pos.sideToMove]
			mov   eax, dword [DrawValue+4*rax]
			jmp   .Return

	if .PvNode eq 0

		      align   8
.ReturnTTValue:
			mov   word [rsi+Stack.currentMove], cx
			mov   eax, edi
			jmp   .Return
	end if

		      align   8
.ReturnStaticValue:
			mov   r8, qword [.tte]
			mov   r9, qword [rbx+State.key]
			shr   r9, 48
			mov   edx, eax
		       test   r13d, r13d
			jnz   .Return
			add   eax, VALUE_MATE_IN_MAX_PLY
			cmp   eax, 2*VALUE_MATE_IN_MAX_PLY
			jae   .ReturnStaticValue_ValueToTT
 .ReturnStaticValue_ValueToTTRet:
	     HashTable_Save   r8, r9w, edx, BOUND_LOWER, DEPTH_NONE, 0, word [rsi+Stack.staticEval]
			mov   eax, dword [.bestValue]
			jmp   .Return

 .ReturnStaticValue_ValueToTT:
		      movzx   ecx, byte [rsi+Stack.ply]
			mov   eax, edx
			sar   eax, 31
			xor   ecx, eax
			sub   edx, eax
			add   edx, ecx
			jmp   .ReturnStaticValue_ValueToTTRet


		      align   8
.ValueFromTT:
		      movzx   r8d, byte [rsi+Stack.ply]
			mov   r9d, edi
			sar   r9d, 31
			xor   r8d, r9d
			add   edi, r9d
			sub   edi, r8d
			mov   dword [.ttValue], edi
			mov   eax, edi
			sub   eax, dword [.beta]
			sar   eax, 31
			jmp   .ValueFromTTRet

		      align   8
.ValueToTT:
		      movzx   edx, byte [rsi+Stack.ply]
			mov   eax, edi
			sar   eax, 31
			xor   edx, eax
			sub   edx, eax
			add   edx, edi
			jmp   .ValueToTTRet


		      align   8
.CheckDrawBy50:
	   PosIsDrawCheck50   .AbortSearch_PlySmaller, r8
			jmp   .NoDrawBy50


}