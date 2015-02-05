

macro DisplayCurrMove {
			lea   rdi, [Output]
			mov   rax, 'info cur'
		      stosq
			mov   rax, 'rmove '
		      stosq
			sub   rdi, 2
			mov   ecx, [.move]
		       call   PrintUciMove
			mov   rax, ' nodes '
		      stosq
			sub   rdi, 1
			mov   rax, qword [rbp+Pos.nodes]
		       call   PrintUnsignedInteger
			mov   rax, ' alpha '
		      stosq
			sub   rdi, 1
		     movsxd   rax, dword [.alpha]
		       call   PrintSignedInteger
			mov   rax, ' beta '
		      stosq
			sub   rdi, 2
		     movsxd   rax, dword [.beta]
		       call   PrintSignedInteger
			mov   al, 10
		      stosb
		       call   _WriteOut_Output

}



macro search NT, SpNode {

			; rbp: address of Pos
			; ecx: alpha
			; edx: beta
			; r8d: depth
			; r9:  address of Stack
			; r10d: cutNode

virtual at rsp

  .ss	     rq 1
  .tte	     rq 1
  .ltte      rq 1
  .posKey    rq 1

  .ttMove	  rd 1
  .ttValue	  rd 1
  .move 	  rd 1
  .excludedMove   rd 1
  .bestMove	  rd 1
  .ext		  rd 1
  .newDepth	  rd 1
  .predictedDepth rd 1
  .moveCount	  rd 1
  .quietCount	  rd 1
  .alpha	  rd 1
  .beta 	  rd 1
  .depth	  rd 1
  .bestValue	  rd 1
  .value	  rd 1
  .eval 	  rd 1
  .nullValue	  rd 1
  .futilityValue  rd 1
		  rd 2

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
  .quietsSearched rw 64

  .lend rb 0
end virtual
.localsize = ((.lend-rsp+15) and (-16))



		       push   rbx rsi rdi r12 r13 r14 r15
			sub   rsp, .localsize


match =_ROOT_NODE, NT
\{
 .PvNode equ 1
 .RootNode equ 1
\}

match =_PV_NODE, NT
\{
 .PvNode equ 1
 .RootNode equ 0
\}

match =_NONPV_NODE, NT
\{
 .PvNode equ 0
 .RootNode equ 0
\}


		; at non root node alpha and beta are calculate in Step 3
	if .RootNode eq 1
			mov   dword [.alpha], ecx
			mov   dword [.beta], edx
	end if
			mov   dword [.depth], r8d
			mov   qword [.ss], r9
			mov   byte [.cutNode], r10l

			mov   rsi, r9
			mov   rbx, [rbp+Pos.state]

			sub   r8d, 1
			mov   dword [.newDepth], r8d


		; Step 1. initialize node
			xor   eax, eax
			mov   dword [.moveCount], eax
			mov   dword [.quietCount], eax
			mov   dword [.bestValue], -VALUE_INFINITE
		      movzx   r12d, byte [r9+Stack.ply-1*sizeof.Stack]
			add   r12d, 1
			mov   byte [r9+Stack.ply], r12l

	if .RootNode eq 0
		; Step 2. check for aborted search and immediate draws
		      movzx   eax, byte [rbx+State.rule50]
		      movzx   r8d, byte [rbx+State.pliesFromNull]
			mov   r9, qword [rbx+State.key]
			cmp   r12d, MAX_PLY
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
		; Step 3. mate distance pruning
			mov   eax, r12d
			sub   eax, VALUE_MATE
			cmp   ecx, eax
		      cmovl   ecx, eax
			not   eax
			cmp   edx, eax
		      cmovg   edx, eax
			mov   dword [.alpha], ecx
			mov   dword [.beta], edx
			mov   eax, ecx
			cmp   ecx, edx
			jge   .Return
	end if

			xor   eax, eax
			mov   dword [.bestMove], eax
			mov   word [rsi+Stack.currentMove], ax
			mov   word [rsi+Stack.ttMove], ax
			mov   word [rsi+1*sizeof.Stack+Stack.excludedMove], ax
			mov   byte [rsi+1*sizeof.Stack+Stack.skipEarlyPruning], al
			mov   byte [rsi+1*sizeof.Stack+Stack.reduction], al
			mov   dword [rsi+2*sizeof.Stack+Stack.killers], eax

		; Step 4. transposition table look up
			mov   rcx, qword [rbx+State.key]
			mov   qword [.posKey], rcx
		       call   HashTable_Probe
			mov   qword [.tte], rax
			mov   qword [.ltte], rcx
			mov   byte [.ttHit], dl
			mov   rdi, rcx
			sar   rdi, 48
		      movsx   eax, ch
			mov   r13d, edx
	if .RootNode eq 0
			shr   rcx, 16
			mov   word [rsi+Stack.ttMove], cx
		      movzx   ecx, cx
	else
			mov   ecx, dword [rootMoves+RootMoves.multiPvIdx]
		      movzx   ecx, word [rootMoves+RootMoves.moves+rcx*sizeof.RMove+RMove.move]
			mov   word [rsi+Stack.ttMove], cx
	end if
			mov   dword [.ttMove], ecx
			mov   dword [.ttValue], edi

			lea   r8d, [rdi+VALUE_MATE_IN_MAX_PLY]
		       test   edx, edx
			 jz   .DontReturnTTValue

			cmp   edi, VALUE_NONE
			 je   .DontReturnTTValue
			cmp   r8d, 2*VALUE_MATE_IN_MAX_PLY
			jae   .ValueFromTT
.ValueFromTTRet:
			cmp   eax, dword [.depth]
			 jl   .DontReturnTTValue

	if .PvNode eq 0
			mov   eax, BOUND_UPPER
			mov   r8d, BOUND_LOWER
			cmp   edi, dword [.beta]
		     cmovge   eax, r8d
		       test   al, byte [.ltte+TTEntry.genBound]
			jnz   .ReturnTTValue
	end if

.DontReturnTTValue:

		; step 5. evaluate the position statically
			mov   eax, VALUE_NONE
			mov   dword [.eval], eax
			mov   word [rsi+Stack.staticEval], ax
			mov   rcx, qword [rbx+State.checkersBB] ; fetch checkersBB for step 5
		       test   rcx, rcx
			jnz   .moves_loop

		      movzx   edx, word [rsi+Stack.currentMove-1*sizeof.Stack]
		      movsx   eax, word[.ltte+TTEntry.evalValue]
		       test   r13d, r13d
			jnz   .StaticValueYesTTHit
.StaticValueNoTTHit:
		      movsx   eax, word [rsi+Stack.staticEval-1*sizeof.Stack]
			neg   eax
			add   eax, 2*Eval_Tempo
			mov   r12, qword [.tte]
			cmp   edx, MOVE_NULL
			 je   @f
		       call   Evaluate
		@@:	mov   r8d, eax
			mov   word [rsi+Stack.staticEval], ax
			mov   dword [.eval], eax
			mov   r9, qword [.posKey]
			shr   r9, 48
			mov   edx, VALUE_NONE
	     HashTable_Save   r12, r9w, edx, BOUND_NONE, DEPTH_NONE, 0, r8w
			jmp   .StaticValueDone

.StaticValueYesTTHit:
			cmp   eax, VALUE_NONE
			jne   @f
		       call   Evaluate
		@@:	xor   ecx, ecx
			mov   word [rsi+Stack.staticEval], ax

			cmp   edi, eax
		       setg   cl
			add   ecx, BOUND_UPPER
			cmp   edi, VALUE_NONE
			 je   @f
		       test   cl, byte [.ltte+TTEntry.genBound]
		     cmovnz   eax, edi
		@@:	mov   dword [.eval], eax
.StaticValueDone:





.moves_loop:
			mov   rcx, rsi
			mov   eax, dword [.depth]
			lea   rsi, [.movepick]
			mov   qword [rsi+Pick.ss], rcx
			mov   byte [rsi+Pick.depth], al
			mov   word [rsi+Pick.countermoves+2*0], 0
			mov   word [rsi+Pick.countermoves+2*1], 0
			mov   word [rsi+Pick.followupmoves+2*0], 0
			mov   word [rsi+Pick.followupmoves+2*1], 0
			mov   byte [rsi+Pick.recaptureSquare], 64
			mov   ecx, dword [.ttMove]
		       call   MovePick_Init_Search


.MovePickLoop:


			lea   rsi, [.movepick]
		GetNextMove
			mov   dword [.move], eax
			mov   rsi, qword [.ss]
		       test   eax, eax
			 jz   .MovePickDone

		; at the root search only moves in the move list
	if .RootNode eq 1
			mov   edx, dword [rootMoves+RootMoves.multiPvIdx]
			lea   rdx, [rootMoves+RootMoves.moves+rdx*sizeof.RMove]
		@@:   movzx   ecx, word [rdx+RMove.move]
			lea   rdx, [rdx+sizeof.RMove]
		       test   ecx, ecx
			 jz   .MovePickLoop
			cmp   ecx, eax
			jne   @b

	end if

			add   dword [.moveCount], 1

	if .RootNode eq 1
			cmp   dword [.moveCount], 1
		       sete   al
			mov   byte [Signals.firstRootMove], al

	     if DISPLAY_CURRMOVE
			DisplayCurrMove
	     end if
	end if

			mov   ecx, dword [.move]
			mov   r9d, ecx
			and   r9d, 63
			mov   r12d, ecx
			shr   r12d, 6
			and   r12d, 63
			cmp   ecx, MOVE_TYPE_CASTLE shl 12
			jae   .MoveIsNotNormal

		      movzx   r13d, byte [rbp+Pos.board+r12]	; r12d = from square
			and   r13d, 7				; r13d = from piece type
			mov   r11, qword [rbx+State.dcCandidates]
		      movzx   eax, byte [rbp+Pos.board+r9]
			mov   byte [.captureOrPromotion], al
		       test   r11, r11
			jnz   .MoveIsNormalDiscoveredCheck
			mov   rax, qword [rbx+State.checkSq+8*r13]
			 bt   rax, r9
			sbb   eax, eax
	.MoveIsNormalDiscoveredCheckRet:
			mov   edx, dword [rbp+Pos.sideToMove]
			mov   byte [.givesCheck], al
			mov   byte [.dangerous], al
		       test   eax, eax
			jne   .Step11Done
			cmp   r13d, Pawn
			jne   .Step11Done
			neg   edx
			and   edx, 7
			shr   r12d, 3
			xor   edx, r12d
			cmp   edx, 4
			sbb   edx, edx
			mov   byte [.dangerous], dl
			jmp   .Step11Done
	 .MoveIsNormalDiscoveredCheck:
		       call   GivesCheck
			jmp   .MoveIsNormalDiscoveredCheckRet

.MoveIsNotNormal:
			mov   edx, (MOVE_TYPE_EPCAP shl 12) - 1
			sub   edx, ecx
			sar   edx, 31
			mov   byte [.captureOrPromotion], dl
		       call   GivesCheck
			mov   byte [.givesCheck], al
			mov   byte [.dangerous], -1

.Step11Done:


      ; Step 12. Extend checks


		;        mov   r8d, ecx
		;        shr   r8d, 6
		;        and   r8d, 63                           ; r8d = from
		;      movzx   eax, byte [rbp+Pos.board+r8]     ; r14d = from piece
		;        add   eax, 7
		;
		;
		;        mov   ecx, dword [.move]
		;       call   GivesCheck
		;        mov   byte [.givesCheck], al
		;         or   byte [.dangerous], al
		;



		; check if move is legal
	if .RootNode eq 0
			mov   ecx, dword [.move]
		       call   IsMoveLegal
		       test   rax, rax
			 jz   .IllegalMove
	end if






			mov   ecx, dword [.move]
			mov   eax, dword [.quietCount]
		      movzx   edx, byte [.captureOrPromotion]
			mov   word [rsi+Stack.currentMove], cx
			cmp   eax, 64
			jae   .NotSearchingQuiet
		       test   edx, edx
			jnz   .NotSearchingQuiet
			mov   word [.quietsSearched+2*rax], cx
			add   eax, 1
			mov   dword [.quietCount], eax
.NotSearchingQuiet:
		      movsx   edx, byte [.givesCheck]
			add   qword [rbp+Pos.nodes], 1
		       call   DoMove_SetFullCi




		; Step 16. full depth search
	if .PvNode eq 1
			cmp   dword [.moveCount], 1
			 je   .DoFullPvSearch
	end if
			xor   r9, r9
			mov   r8d, dword [.newDepth]
			lea   r10, [QSearch_NonPv_InCheck]
			lea   r11, [QSearch_NonPv_NoCheck]
			cmp   byte [.givesCheck], 0
		     cmovne   r11, r10
			lea   rax, [Search_NonPv]
			cmp   r8d, 1
		      cmovl   rax, r11
		      cmovl   r8d, r9d
			mov   edx, dword [.alpha]
			neg   edx
			lea   ecx, [rdx-1]
			mov   r9, qword [.ss]
			add   r9, sizeof.Stack
		      movsx   r10d, byte [.cutNode]
			not   r10d
		       call   rax
			neg   eax
			mov   edi, eax
			mov   dword [.value], eax



	if .PvNode eq 1
			cmp   edi, dword [.alpha]
			jle   .SkipFullPvSearch
	    if .RootNode eq 0
			cmp   edi, dword [.beta]
			jge   .SkipFullPvSearch
	    end if
 .DoFullPvSearch:
			xor   r9, r9
			mov   r8d, dword [.newDepth]
			lea   r10, [QSearch_Pv_InCheck]
			lea   r11, [QSearch_Pv_NoCheck]
			cmp   byte [.givesCheck], 0
		     cmovne   r11, r10
			lea   rax, [Search_Pv]
			cmp   r8d, 1
		      cmovl   rax, r11
		      cmovl   r8d, r9d
			mov   ecx, dword [.beta]
			neg   ecx
			mov   edx, dword [.alpha]
			neg   edx
			mov   r9, qword [.ss]
			add   r9, sizeof.Stack
			mov   dword [r9+Stack.pv], 0
			xor   r10d, r10d
		       call   rax
			neg   eax
			mov   edi, eax
			mov   dword [.value], eax
 .SkipFullPvSearch:
	end if


		; Step 17. Undo move
			mov   ecx, dword [.move]
		       call   UndoMove

if SEARCH_DEBUG eq 1
mov byte[QSearchTesting] ,0
end if


			mov   ecx, dword [.move]

			xor   eax, eax
			cmp   al, byte [Signals.stop]
			jne   .Return


		; for the root, check for new best move
	if .RootNode eq 1
		; find the move in the root move list
			lea   r8, [rootMoves+RootMoves.moves-sizeof.RMove]
.FindRootMove:
			lea   r8, [r8+sizeof.RMove]
		      movzx   eax, word [r8+RMove.move]
		     Assert   ne, eax, 0, 'could not find root move'
			cmp   eax, ecx
			jne   .FindRootMove
		; update root move
			mov   word [r8+RMove.score], di
			cmp   dword [.moveCount], 1
			 je   .FoundRootMoveMoveCount1
			cmp   edi, dword [.alpha]
			 jg   .FoundRootMoveNewBestMove
			mov   word [r8+RMove.score], -VALUE_INFINITE
.FoundRootMoveRet:

	end if


		; check for new best move
			cmp   edi, dword [.bestValue]
			jle   .NoNewBestValue
			mov   dword [.bestValue], edi
			cmp   edi, dword [.alpha]
			jle   .NoNewAlpha

			mov   dword [.bestMove], ecx
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
			jge   .MovePickDone
			mov   dword [.alpha], edi
	else
		     Assert   ge, edi, dword [.beta], 'did not fail high'
			jmp   .MovePickDone
	end if

.NoNewAlpha:
.NoNewBestValue:

			jmp   .MovePickLoop

.MovePickDone:
		      ;  mov   rbx, qword [rbp+Pos.state]
			mov   rax, qword [rbx+State.checkersBB]
			mov   edi, dword [.bestValue]
			cmp   dword [.moveCount], 0
			 je   .Mate
			cmp   edi, dword [.beta]
			jge   .CheckQuietBestMove

.TTStore:
		      ;  mov   rsi, [.ss]
			mov   r9, qword [.posKey]


			lea   ecx, [rdi+VALUE_MATE_IN_MAX_PLY]

			mov   r8, qword [.tte]
			shr   r9, 48
			mov   edx, edi
			cmp   ecx, 2*VALUE_MATE_IN_MAX_PLY
			jae   .ValueToTT
     .ValueToTTRet:


	if .PvNode eq 0
			mov   eax, dword [.bestMove]
			xor   ebx, ebx
			cmp   edi, dword [.beta]
		      setge   bl
			add   ebx, BOUND_UPPER
	else
			mov   eax, dword [.bestMove]
			mov   ecx, BOUND_LOWER
			cmp   eax, 1
			sbb   ebx, ebx
			lea   ebx, [(BOUND_EXACT-BOUND_UPPER)*rbx+BOUND_EXACT]
			cmp   edi, dword [.beta]
		     cmovge   ebx, ecx
	end if
	     HashTable_Save   r8, r9w, edx, bl, byte [.depth], eax, word [rsi+Stack.staticEval]
			mov   eax, edi

.Return:

			add   rsp, .localsize
			pop   r15 r14 r13 r12 rdi rsi rbx
			ret



		      align   8
.CheckQuietBestMove:
			mov   ecx, dword [.bestMove]
			mov   edx, ecx
			shr   ecx, 12
			and   edx, 63
		       test   rax, rax
			jnz   .TTStore
			cmp   ecx, MOVE_TYPE_EPCAP
			jae   .TTStore
			cmp   byte [rbp+Pos.board+rdx], 0
			jne   .TTStore
		       ; jmp   .TTStore
	       UpdateStats2   .TTStore


		      align   8
.Mate:
			mov   ecx, dword [rbp+Pos.sideToMove]
		      movzx   edi, byte [rsi+Stack.ply]
			sub   edi, VALUE_MATE
		       test   rax, rax
		      cmovz   edi, dword [DrawValue+4*rcx]
			jmp   .TTStore

.IllegalMove:
			sub   dword [.moveCount], 1
			jmp   .MovePickLoop

	if .RootNode eq 1
		      align   8
.FoundRootMoveNewBestMove:
			add   dword [rootMoves+RootMoves.bestMoveChanges], 1
.FoundRootMoveMoveCount1:
		; copy pv
		      movzx   r9d, word [r8+RMove.pvIdx]
		       imul   r9d, 2*(MAX_PLY+1)
			lea   r9, [rootMoves+RootMoves.pvs+r9]
			mov   rdx, qword[.ss]
			lea   rdx, [rdx+Stack.pv+1*sizeof.Stack]
			mov   r10d, edi
			mov   word [r9], cx
		@@:	add   r9, 2
		      movzx   eax, word [rdx]
			add   rdx, 2
			mov   word [r9], ax
		       test   eax, eax
			jnz   @b
		; move new best move to front of move list
			mov   r9d, dword [rootMoves+RootMoves.multiPvIdx]
			lea   r9, [rootMoves+RootMoves.moves+r9*sizeof.RMove]
			mov   rax, qword [r8]
			mov   rdx, qword [r9]
			mov   qword [r8], rdx
			mov   qword [r9], rax
			jmp   .FoundRootMoveRet
	end if


	if .RootNode eq 0
		      align  8
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
	end if


	if .PvNode eq 0

		      align   8
.ReturnTTValue:
			mov   word [rsi+Stack.currentMove], cx
	       UpdateStats1   .Return
	end if


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
.ValueFromTT:
		      movzx   r8d, byte [rsi+Stack.ply]
			mov   r9d, edi
			sar   r9d, 31
			xor   r8d, r9d
			add   edi, r9d
			sub   edi, r8d
			mov   dword [.ttValue], edi
			jmp   .ValueFromTTRet

	if .RootNode eq 0
		      align   8
.CheckDrawBy50:
	   PosIsDrawCheck50   .AbortSearch_PlySmaller, r8
			jmp   .NoDrawBy50

	end if

}









if 0

if SEARCH_DEGUB eq 1
			mov   rsi, qword [.ss]
	cmp   byte[rsi-0*sizeof.Stack+Stack.ply],11
	jne   .NoPrint1
	cmp   word [rsi-10*sizeof.Stack+Stack.currentMove],(SQ_B4 shl 6) + SQ_F4
	jne   .NoPrint1
	cmp   word [rsi-9*sizeof.Stack+Stack.currentMove],(SQ_H4 shl 6) + SQ_G3
	jne   .NoPrint1
	cmp   word [rsi-8*sizeof.Stack+Stack.currentMove],(SQ_F4 shl 6) + SQ_F7
	jne   .NoPrint1
	cmp   word [rsi-7*sizeof.Stack+Stack.currentMove],(SQ_H5 shl 6) + SQ_C5
	jne   .NoPrint1
	cmp   word [rsi-6*sizeof.Stack+Stack.currentMove],(SQ_F7 shl 6) + SQ_G7
	jne   .NoPrint1
	cmp   word [rsi-5*sizeof.Stack+Stack.currentMove],(SQ_G3 shl 6) + SQ_F2
	jne   .NoPrint1
	cmp   word [rsi-4*sizeof.Stack+Stack.currentMove],(SQ_G2 shl 6) + SQ_G3
	jne   .NoPrint1
	cmp   word [rsi-3*sizeof.Stack+Stack.currentMove],(SQ_C5 shl 6) + SQ_C2
	jne   .NoPrint1
	cmp   word [rsi-2*sizeof.Stack+Stack.currentMove],(SQ_A5 shl 6) + SQ_B4
	jne   .NoPrint1
	cmp   word [rsi-1*sizeof.Stack+Stack.currentMove],(SQ_C7 shl 6) + SQ_C5 +(MOVE_TYPE_DPAWN shl 12)
	jne   .NoPrint1
 int3
.NoPrint1:
end if


if SEARCH_DEBUG eq 1

	cmp   byte[rsi-0*sizeof.Stack+Stack.ply],11
	jne   .NoPrint
	cmp   word [rsi-10*sizeof.Stack+Stack.currentMove],(SQ_B4 shl 6) + SQ_F4
	jne   .NoPrint
	cmp   word [rsi-9*sizeof.Stack+Stack.currentMove],(SQ_H4 shl 6) + SQ_G3
	jne   .NoPrint
	cmp   word [rsi-8*sizeof.Stack+Stack.currentMove],(SQ_F4 shl 6) + SQ_F7
	jne   .NoPrint
	cmp   word [rsi-7*sizeof.Stack+Stack.currentMove],(SQ_H5 shl 6) + SQ_C5
	jne   .NoPrint
	cmp   word [rsi-6*sizeof.Stack+Stack.currentMove],(SQ_F7 shl 6) + SQ_G7
	jne   .NoPrint
	cmp   word [rsi-5*sizeof.Stack+Stack.currentMove],(SQ_G3 shl 6) + SQ_F2
	jne   .NoPrint
	cmp   word [rsi-4*sizeof.Stack+Stack.currentMove],(SQ_G2 shl 6) + SQ_G3
	jne   .NoPrint
	cmp   word [rsi-3*sizeof.Stack+Stack.currentMove],(SQ_C5 shl 6) + SQ_C2
	jne   .NoPrint
	cmp   word [rsi-2*sizeof.Stack+Stack.currentMove],(SQ_A5 shl 6) + SQ_B4
	jne   .NoPrint
	cmp   word [rsi-1*sizeof.Stack+Stack.currentMove],(SQ_C7 shl 6) + SQ_C5 +(MOVE_TYPE_DPAWN shl 12)
	jne   .NoPrint
;cmp dword[.move], (SQ_A5 shl 6)+SQ_B4
;jne .NoPrint

mov byte[QSearchTesting], -1
			lea   rdi, [Output]
			mov   rax, ' searchi'
		      stosq
			mov   rax, 'ing '
		      stosd
			mov   ecx, [.move]
		       call   PrintUciMove
			mov   rax, ' nodes '
		      stosq
			sub   rdi, 1
			mov   rax, qword [rbp+Pos.nodes]
		       call   PrintUnsignedInteger
			mov   rax, ' alpha '
		      stosq
			sub   rdi, 1
		     movsxd   rax, dword [.alpha]
		       call   PrintSignedInteger
			mov   rax, ' beta '
		      stosq
			sub   rdi, 2
		     movsxd   rax, dword [.beta]
		       call   PrintSignedInteger
			mov   al, 10
		      stosb
		       call   _WriteOut_Output


      .NoPrint:
end if


end if