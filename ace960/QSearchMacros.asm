

macro QSearch NT, InCheck {
	; in:
	;  rbp: address of Pos struct in thread struct
	;  rbx: address of State
	;  ecx: alpha
	;  edx: beta
	;  r8d: depth

;jmp _Evaluate

match =_PV_NODE, NT \{
 .PvNode equ 1	\}

match =_NONPV_NODE, NT \{
 .PvNode equ 0	\}



virtual at rsp
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

if .PvNode eq 1
  ._pv		   rd MAX_PLY+1
end if

  .lend rb 0

end virtual
.localsize = ((.lend-rsp+15) and (-16))


	       push   rbx rsi rdi r12 r13 r14 r15
	 _chkstk_ms   rsp, .localsize
		sub   rsp, .localsize

		mov   dword[.alpha], ecx
		mov   dword[.beta], edx
		mov   dword[.depth], r8d

		mov   edx, dword[rbx-1*sizeof.State+State._ply]
		add   edx, 1
		xor   eax, eax
	if .PvNode eq 1
		lea   r8, [._pv]
		mov   r9, qword[rbx+State.pv]
		mov   dword[.oldAlpha], ecx
		mov   qword[rbx+1*sizeof.State+State.pv], r8
		mov   dword[r9], eax
	end if
		mov   dword[.bestMove], eax
		mov   dword[rbx+State.currentMove], eax
		mov   dword[rbx+State._ply], edx

	; check for instant draw or max ply
	      movzx   eax, byte[rbx+State.rule50]
	      movzx   r8d, byte[rbx+State.pliesFromNull]
		mov   r9, qword[rbx+State.key]
		cmp   edx, MAX_PLY
		jae   .AbortSearch_PlyBigger
		cmp   eax, 100
		jae   .CheckDrawBy50
		cmp   eax, r8d
	      cmova   eax, r8d
		shr   eax, 1
		 jz   .NoDrawBy50
	       imul   rax, -2*sizeof.State
     @@:	cmp   r9, qword[rbx+rax+State.key]
		 je   .AbortSearch_PlySmaller
		add   rax, 2*sizeof.State
		jnz   @b
     .NoDrawBy50:

	if InCheck eq 1
		mov   r12d, DEPTH_QS_CHECKS
		mov   dword[.ttDepth],r12d
	else
		mov   eax, DEPTH_QS_CHECKS
		mov   r12d, DEPTH_QS_NO_CHECKS
		cmp   eax, dword[.depth]
	     cmovle   r12d, eax
		mov   dword[.ttDepth], r12d
	end if

	; transposition table lookup
		mov   rcx, qword[rbx+State.key]
		sub   r12d, 1
	       call   MainHash_Probe
		mov   qword[.tte], rax
		mov   qword[.ltte], rcx
		mov   byte[.ttHit], dl
		mov   rdi, rcx
		sar   rdi, 48
	      movsx   eax, ch
		sub   r12d, eax
		sar   r12d, 31
	; r12d = 0 if tte.depth <  ttDepth
	;      =-1 if tte.depth >= ttDepth
		shr   rcx, 16
		mov   r13d, edx
	      movzx   ecx, cx
		mov   dword[.ttMove], ecx
		mov   dword[.ttValue], edi

		lea   r8d, [rdi+VALUE_MATE_IN_MAX_PLY]
	       test   edx, edx
		 jz   .DontReturnTTValue

		mov   eax, edi
		sub   eax, dword[.beta]
		sar   eax, 31
	; eax = 0 if ttValue<beta
	;     =-1 if ttvalue>=beta
		cmp   edi, VALUE_NONE
		 je   .DontReturnTTValue
		cmp   r8d, 2*VALUE_MATE_IN_MAX_PLY
		jae   .ValueFromTT
.ValueFromTTRet:
	if .PvNode eq 0
		add   eax, 2
	; eax = 2 if ttValue<beta     ie BOUND_UPPER
	;     = 1 if ttvalue>=beta    ie BOUND_LOWER
		and   eax, r12d
	       test   al, byte[.ltte+MainHashEntry.genBound]
		jnz   .ReturnTTValue
	end if

.DontReturnTTValue:

	; Evaluate the position statically
	;  r13d = ttHit
	if InCheck eq 1
		mov   eax, -VALUE_INFINITE
		mov   dword[rbx+State._staticEval], VALUE_NONE
		mov   dword[.bestValue], eax
		mov   dword[.futilityBase], eax
	else
		mov   edx, dword[rbx-1*sizeof.State+State.currentMove]
	       test   r13d, r13d
		 jz   .StaticValueNoTTHit
.StaticValueYesTTHit:
	      movsx   eax, word[.ltte+MainHashEntry.eval]
		cmp   eax, VALUE_NONE
		jne   @f
	       call   Evaluate
	@@:	xor   ecx, ecx
		mov   dword[rbx+State._staticEval], eax
		cmp   edi, eax
	       setg   cl
		add   ecx, 1
	; ecx = 2 if ttValue > bestValue   ie BOUND_LOWER
	;     = 1 if ttValue <=bestValue   ie BOUND_UPPER
		cmp   edi, VALUE_NONE
		 je   .StaticValueDone
	       test   cl, byte[.ltte+MainHashEntry.genBound]
	     cmovnz   eax, edi
		jmp   .StaticValueDone

.StaticValueNoTTHit:
		mov   eax, dword[rbx+State._staticEval-1*sizeof.State]
		neg   eax
		add   eax, 2*Eval_Tempo
		cmp   edx, MOVE_NULL
		 je   @f
	       call   Evaluate
	@@:	mov   dword[rbx+State._staticEval], eax
.StaticValueDone:
		mov   dword[.bestValue], eax

	; Return immediately if static value is at least beta
		cmp   eax, dword[.beta]
		jge   .ReturnStaticValue


	    if .PvNode eq 1
		mov   ecx, dword[.alpha]
		cmp   ecx, eax
	      cmovl   ecx, eax
		mov   dword[.alpha], ecx
	    end if
		add   eax, 128
		mov   dword[.futilityBase], eax

	end if ; InCheck eq 1

	; initialize move picker
	;   Pick.endQuiets, Pick.endBadCaptures are not used in q search




	      ; endBadCaptures should not be used in qsearch
		lea   rsi, [.movepick]
		lea   r15, [rsi+Pick.moves]
	      ;  lea   rax, [r15+sizeof.ExtMove*(MAX_MOVES-1)]
		mov   qword[rsi+Pick.cur], r15
	      ;  mov   qword[rsi+Pick.endBadCaptures], rax

	if InCheck eq 1
	     Assert   ne, qword[rbx+State.checkersBB], 0, 'assertion qword[rbx+State.checkers]!=0 failed in QSearch'
		lea   rdx, [MovePick_Evasion]
	else
	     Assert   e, qword[rbx+State.checkersBB], 0, 'assertion qword[rbx+State.checkers]==0 failed in QSearch'
		mov   eax, dword[rbx-1*sizeof.State+State.currentMove]
		and   eax, 63
		mov   ecx, dword[.ttMove]
		lea   rdx, [MovePick_QSearchWithChecks]
		cmp   dword [.depth], DEPTH_QS_NO_CHECKS
		 jg   .MovePickInitGo
		lea   rdx, [MovePick_QSearchWithoutChecks]
		cmp   dword [.depth], DEPTH_QS_RECAPTURES
		 jg   .MovePickInitGo
		lea   rdx, [MovePick_Recapture]
		mov   dword[rsi+Pick.recaptureSquare], eax
		xor   edi, edi
		mov   qword[rsi+Pick.stage], rdx
		jmp   .MovePickNoTTMove
	end if

 .MovePickInitGo:
		mov   qword[rsi+Pick.stage], rdx
		mov   edi, ecx
	       test   ecx, ecx
		 jz   .MovePickNoTTMove

	       call   IsMovePseudoLegal
	       test   rax, rax
	      cmovz   edi, eax
		 jz   .MovePickNoTTMove

		add   r15, sizeof.ExtMove
.MovePickNoTTMove:
		mov   dword[rsi+Pick.ttMove], edi
		mov   qword[rsi+Pick.endMoves], r15

	       call   SetCheckInfo



.MovePickLoop:

    ;            mov   rax, 0x78f060ce351dda3d
    ;            cmp   rax, qword[rbx+State.key]
    ;            jne   @f
    ;           int3
    ;    @@:


		lea   rsi, [.movepick]
	GetNextMove
		mov   dword[.move], eax
	       test   eax, eax
		 jz   .MovePickDone

	; check for check and get address of search function
		mov   ecx, eax
	       call   GivesCheck
		mov   byte[.givesCheck], al
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
		mov   qword[.searchFxn], rdx



		mov   ecx, dword[.move]
		mov   edi, dword[.bestValue]
		mov   esi, ecx
		shr   esi, 12

		mov   r8d, ecx
		shr   r8d, 6
		and   r8d, 63			      ; r8d = from
	      movzx   eax, byte[rbp+Pos.board+r8]     ; r14d = from piece
		mov   r14d, eax

		mov   r9d, ecx
		and   r9d, 63			       ; r9d = to
	      movzx   r15d, byte[rbp+Pos.board+r9]     ; r15d = to piece

		; futility pruning
	if InCheck eq 0
		mov   r12d, dword[.futilityBase]
	       test   r13d,r13d
		jnz   .SkipFutilityPruning
		and   eax, 7
		cmp   r12d, -VALUE_KNOWN_WIN
		jle   .SkipFutilityPruning

		mov   edx, dword[rbp+Pos.sideToMove]
		neg   edx
		cmp   eax, Pawn
		 je   .CheckAdvancedPawnPush
.DoFutilityPruning:
		mov   edx, dword [PieceValue_EG+4*r15]
		add   edx, r12d
		cmp   edx, dword [.alpha]
		jle   .ContinueFromFutilityValue
		cmp   r12d, dword [.beta]
		jle   .ContinueFromFutilityBase
.SkipFutilityPruning:
	end if

	; prepare pieces for Zobrist look up
		shl   r14d, 6+3
		shl   r15d, 6+3

	; do not search moves with negative see value
	if InCheck eq 0
		cmp   esi, MOVE_TYPE_PROM
		 je   .DontContinue
	else
		mov   eax, dword[rbp+Pos.sideToMove]
		cmp   edi, VALUE_MATED_IN_MAX_PLY
		jle   .DontContinue
		cmp   esi, MOVE_TYPE_CASTLE
		 je   .MovePickLoop
	       ; cmp   esi, MOVE_TYPE_EPCAP
	       ;  je   .DontContinue
		cmp   esi, MOVE_TYPE_PROM
		jae   .DontContinue	   ; catch MOVE_TYPE_EPCAP
	       test   r15d, r15d
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

	; speculative prefetch
		mov   rax, qword[rbx+State.key]
		xor   rax, qword[Zobrist_side]
		xor   rax, qword[Zobrist_Pieces+r14+8*rcx]
		xor   rax, qword[Zobrist_Pieces+r14+8*rdx]
		xor   rax, qword[Zobrist_Pieces+r15+8*rdx]
		and   rax, qword[mainHash.mask]
		shl   rax, 5
		add   rax, qword[mainHash.table]
	prefetchnta   [rax]


	; check for legality
		mov   ecx, dword[.move]
	       call   IsMoveLegal
	       test   rax, rax
		 jz   .MovePickLoop

	; make the move
		mov   ecx, dword[.move]
	      movzx   edx, byte[.givesCheck]
		mov   dword[rbx+State.currentMove], ecx
		add   qword[rbp-Thread.rootPos+Thread.nodes], 1
		mov   rsi, qword[.searchFxn]
	       call   DoMove__QSearch

	; search the move
		mov   ecx, dword[.beta]
		neg   ecx
		mov   edx, dword[.alpha]
		neg   edx
		mov   r8d, dword[.depth]
		sub   r8d, 1
	       call   rsi
		neg   eax
		mov   edi, eax
		mov   dword[.value], eax

	; undo the move
		mov   ecx, dword[.move]
	       call   UndoMove

	; check for new best move
		cmp   edi, dword[.bestValue]
		jle   .MovePickLoop
		mov   dword [.bestValue], edi
		cmp   edi, dword[.alpha]
		jle   .MovePickLoop

     if .PvNode eq 1
		mov   ecx, dword[.move]
		mov   r8, qword[rbx+0*sizeof.State+State.pv]
		mov   r9, qword[rbx+1*sizeof.State+State.pv]
		xor   eax, eax
		mov   dword[r8], ecx
		add   r8, 4
	       test   r9, r9
		 jz   .pv_copy_end
	.pv_copy_loop:
		mov   eax, dword[r9]
		add   r9, 4
	.pv_copy_end:
		mov   dword[r8], eax
		add   r8, 4
	       test   eax, eax
		jnz   .pv_copy_loop

		cmp   edi, dword[.beta]
		jge   .FailHigh
		mov   dword[.alpha], edi
		mov   dword[.bestMove], ecx

		jmp   .MovePickLoop
    end if




.FailHigh:
		mov   r9, qword[rbx+State.key]
		mov   r8, qword[.tte]
		shr   r9, 48
		mov   edx, edi
		lea   ecx, [rdi+VALUE_MATE_IN_MAX_PLY]
		cmp   ecx, 2*VALUE_MATE_IN_MAX_PLY
		jae   .FailHighValueToTT
.FailHighValueToTTRet:
		mov   eax, dword[.move]
     HashTable_Save   r8, r9w, edx, BOUND_LOWER, byte[.ttDepth], eax, word[rbx+State._staticEval]
		mov   eax, edi
		jmp   .Return

.FailHighValueToTT:
		mov   edx, dword[rbx+State._ply]
		mov   eax, edi
		sar   eax, 31
		xor   edx, eax
		sub   edx, eax
		add   edx, edi
		jmp   .FailHighValueToTTRet



.MovePickDone:
		mov   r9, qword[rbx+State.key]
		mov   edi, dword[.bestValue]
		lea   ecx, [rdi+VALUE_MATE_IN_MAX_PLY]

	if InCheck eq 1
		mov   eax, dword[rbx+State._ply]
		sub   eax, VALUE_MATE
		cmp   edi, -VALUE_INFINITE
		 je   .Return
	end if

	if .PvNode eq 1
		mov   esi, dword [.oldAlpha]
		sub   esi, edi
		sar   esi, 31
	end if
		mov   r8, qword [.tte]
		shr   r9, 48
		mov   edx, edi
		cmp   ecx, 2*VALUE_MATE_IN_MAX_PLY
		jae   .ValueToTT
     .ValueToTTRet:


	if .PvNode eq 0
		mov   eax, dword [.bestMove]
     HashTable_Save   r8, r9w, edx, BOUND_UPPER, byte[.ttDepth], eax, word[rbx+State._staticEval]
	else
		mov   eax, dword [.bestMove]
		and   esi, BOUND_EXACT-BOUND_UPPER
		add   esi, BOUND_UPPER
     HashTable_Save   r8, r9w, edx, sil, byte[.ttDepth], eax, word[rbx+State._staticEval]
	end if
		mov   eax, edi

.Return:
		add   rsp, .localsize
		pop   r15 r14 r13 r12 rdi rsi rbx
		ret









;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
		mov   dword[.bestValue], edi
		jmp   .MovePickLoop

    end if


		      align   8
.AbortSearch_PlyBigger:
		mov   rcx, qword[rbx+State.checkersBB]
		mov   eax, dword[rbp+Pos.sideToMove]
		mov   eax, dword[DrawValue+4*rax]
	       test   rcx, rcx
		 jz   .Return
	       call   Evaluate
		jmp   .Return

		      align   8
.AbortSearch_PlySmaller:
		mov   eax, dword[rbp+Pos.sideToMove]
		mov   eax, dword[DrawValue+4*rax]
		jmp   .Return

	if .PvNode eq 0

	      align   8
.ReturnTTValue:
		mov   dword[rbx+State.currentMove], ecx
		mov   eax, edi
		jmp   .Return
	end if



	      align   8
.ReturnStaticValue:
		mov   r8, qword[.tte]
		mov   r9, qword[rbx+State.key]
		shr   r9, 48
		mov   edx, eax
	       test   r13d, r13d
		jnz   .Return
		add   eax, VALUE_MATE_IN_MAX_PLY
		cmp   eax, 2*VALUE_MATE_IN_MAX_PLY
		jae   .ReturnStaticValue_ValueToTT
 .ReturnStaticValue_ValueToTTRet:
     HashTable_Save   r8, r9w, edx, BOUND_LOWER, DEPTH_NONE, 0, word[rbx+State._staticEval]
		mov   eax, dword[.bestValue]
		jmp   .Return

 .ReturnStaticValue_ValueToTT:
		mov   ecx, dword[rbx+State._ply]
		mov   eax, edx
		sar   eax, 31
		xor   ecx, eax
		sub   edx, eax
		add   edx, ecx
		jmp   .ReturnStaticValue_ValueToTTRet


		      align   8
.ValueFromTT:
	; value in edi is not VALUE_NONE
		mov   r8d, dword[rbx+State._ply]
		mov   r9d, edi
		sar   r9d, 31
		xor   r8d, r9d
		add   edi, r9d
		sub   edi, r8d
		mov   dword[.ttValue], edi
		mov   eax, edi
		sub   eax, dword[.beta]
		sar   eax, 31
		jmp   .ValueFromTTRet

		      align   8
.ValueToTT:
		mov   edx, dword[rbx+State._ply]
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



;if SEARCH_DEBUG eq 1
;cmp byte[QSearchTesting],0
;je @f
;lea rdi,[Output]
;mov ecx,dword[.depth]
;neg ecx
;mov eax,'    '
;rep stosd
;mov ecx, dword[.move]
;call PrintUciMove
;mov rax,' nodes: '
;stosq
;mov rax, qword[rbp+Pos.nodes]
;call PrintUnsignedInteger
;mov al,10
;stosb
;call _WriteOut_Output
;@@:
;end if


;if SEARCH_DEBUG eq 1
;cmp byte[QSearchTesting],0
;je @f
;lea rdi,[Output]
;szcall PrintString,'starting pick'
;mov al,10
;stosb
;call _WriteOut_Output
;@@:
;end if