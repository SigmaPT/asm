

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



macro search NT {
	; in:
	;  rbp: address of Pos struct in thread struct
	;  rbx: address of State
	;  ecx: alpha
	;  edx: beta
	;  r8d: depth
	;  r9l: cutNode  must be 0 or -1 (=FFh)
	; out:
	;  eax: score


match =_ROOT_NODE, NT
\{
 .PvNode equ 1
 .RootNode equ 1
VerboseDisplay db 'search root '
\}

match =_PV_NODE, NT
\{
 .PvNode equ 1
 .RootNode equ 0
VerboseDisplay db 'search pv '
\}

match =_NONPV_NODE, NT
\{
 .PvNode equ 0
 .RootNode equ 0
VerboseDisplay db 'search nonpv '
\}

VerboseDisplayInt r8


virtual at rsp
  .tte	     rq 1    ;0
  .ltte      rq 1    ;8
  .posKey    rq 1    ;16
  .cmh	     rq 1    ;24
  .fmh	     rq 1    ;32
  .fmh2      rq 1    ; 40
  .r		  rd 1	  ; 48
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
  .prevSq	  rd 1
  .extension	  rd 1
  .moved_piece	  rd 1
  .success	  rd 1	 ; for tb
		  rd 1
  .givesCheck		   rb 1  ; 144
  .singularExtensionNode   rb 1
  .improving		   rb 1
  .captureOrPromotion	   rb 1  ; nonzero for true
  .doFullDepthSearch	   rb 1
  .cutNode		   rb 1  ; -1 for true
  .ttHit		   rb 1
			   rb 1
			   rb 1
			   rb 1
			   rb 1
			   rb 1
			   rb 1
			   rb 1
			   rb 1
			   rb 1

  .movepick	  rb sizeof.Pick       ; 116
  .quietsSearched rd 64

if .PvNode eq 1
  .pv  rd MAX_PLY+1

end if

  .lend rb 0
end virtual
.localsize = ((.lend-rsp+15) and (-16))


	       push   rbx rsi rdi r12 r13 r14 r15
	 _chkstk_ms   rsp, .localsize
		sub   rsp, .localsize

match =2, VERBOSE \{
push rcx rdx r8 r9 r13 r14 r15
mov r15, rcx
mov r14, rdx
mov r13, r8
lea rdi, [VerboseOutput]
mov rax,'search<'
stosq
sub rdi, 1
match =_ROOT_NODE, NT
\\{
mov al, '2'
\\}
match =_PV_NODE, NT
\\{
mov al, '1'
\\}
match =_NONPV_NODE, NT
\\{
mov al, '0'
\\}
stosb
mov eax, '> ('
stosd
sub rdi, 1
movsxd rax, r15d
call PrintSignedInteger
mov ax, ', '
stosw
movsxd rax, r14d
call PrintSignedInteger
mov eax, ')  '
stosd
sub rdi, 1
movsxd rax, r13d
call PrintSignedInteger
mov al, 10
stosb
lea rcx, [VerboseOutput]
call _WriteOut
pop r15 r14 r13 r9 r8 rdx rcx
\}


		mov   dword[.alpha], ecx
		mov   dword[.beta], edx
		mov   dword[.depth], r8d
		mov   byte[.cutNode], r9l
match =1, DEBUG \{
		lea   eax, [r9+1]
	     Assert   b, al, 2, 'assertion .cutNode == 0 or -1 failed in Search'
\}
	; Step 1. initialize node
		xor   eax, eax
		mov   dword[.moveCount], eax
		mov   dword[.quietCount], eax
		mov   dword[.bestValue], -VALUE_INFINITE
		mov   r12d, dword[rbx-1*sizeof.State+State.ply]
		add   r12d, 1
		mov   dword[rbx+State.ply], r12d

		mov   al, byte[rbp-Thread.rootPos+Thread.resetCalls]
	       test   al, al
		 jz   .dontreset
		mov   byte[rbp-Thread.rootPos+Thread.resetCalls], 0
		mov   dword[rbp-Thread.rootPos+Thread.callsCnt], 0
	.dontreset:
		mov   eax, dword[rbp-Thread.rootPos+Thread.callsCnt]
		add   eax, 1
		mov   dword[rbp-Thread.rootPos+Thread.callsCnt], eax
		cmp   eax, 4096
		jbe   .dontchecktime
		lea   rax, [mainThread]
		mov   rcx, [threadPool.stackPointer]
	@@:	mov   byte[rax+Thread.resetCalls], -1
		sub   rax, sizeof.Thread
		cmp   rax, rcx
		jae   @b
	       call   CheckTime
	.dontchecktime:


    if .RootNode eq 0
	; Step 2. check for aborted search and immediate draws
	      movzx   eax, byte[rbx+State.rule50]
	      movzx   r8d, byte[rbx+State.pliesFromNull]
		mov   r9, qword[rbx+State.key]
		cmp   r12d, MAX_PLY
		jae   .AbortSearch_PlyBigger
		cmp   byte [signals.stop], 0
		jne   .AbortSearch_PlySmaller
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


	; Step 3. mate distance pruning
		mov   ecx, dword[.alpha]
		mov   edx, dword[.beta]
		mov   eax, r12d
		sub   eax, VALUE_MATE
		cmp   ecx, eax
	      cmovl   ecx, eax
		not   eax
		cmp   edx, eax
	      cmovg   edx, eax
		mov   dword[.alpha], ecx
		mov   dword[.beta], edx
		mov   eax, ecx
		cmp   ecx, edx
		jge   .Return
    end if ;.RootNode eq 0

		xor   eax, eax
		mov   dword[.bestMove], eax
		mov   dword[rbx+1*sizeof.State+State.excludedMove], eax
		mov   dword[rbx+0*sizeof.State+State.currentMove], eax
		mov   qword[rbx+0*sizeof.State+State.counterMoves], rax
		mov   byte[rbx+1*sizeof.State+State.skipEarlyPruning], al
		mov   dword[rbx+2*sizeof.State+State.killers+4*0], eax
		mov   dword[rbx+2*sizeof.State+State.killers+4*1], eax

    if .RootNode eq 0
	; get a count of the piece for tb
		mov   rax, qword[rbp+Pos.typeBB+8*White]
		 or   rax, qword[rbp+Pos.typeBB+8*Black]
	     popcnt   rax, rax, rdx
		mov   r15d, dword[Tablebase_Cardinality]
		sub   r15d, eax
		mov   eax, dword[rbx+State.rule50]
		and   eax, 0x00FF00FF
		neg   eax
		 or   r15d, eax
	; if r15d <0, don't do tb probe
    end if

	; Step 4. transposition table look up
		mov   eax, dword[rbx+State.excludedMove]
		mov   rcx, qword[rbx+State.key]
		mov   dword[.excludedMove], eax
	       test   eax, eax
	     cmovnz   rax, qword[Zobrist_exclusion]
		xor   rcx, rax
		mov   qword[.posKey], rcx
	       call   MainHash_Probe
		mov   qword[.tte], rax
		mov   qword[.ltte], rcx
		mov   byte[.ttHit], dl
		mov   rdi, rcx
		sar   rdi, 48
	      movsx   eax, ch
		mov   r13d, edx
	if .RootNode eq 0
		shr   ecx, 16
	else
	       imul   ecx, dword[rbp-Thread.rootPos+Thread.PVIdx], sizeof.RootMove
		add   rcx, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
		mov   ecx, dword[rcx+RootMove.pv+4*0]
	end if
		mov   dword[.ttMove], ecx
		mov   dword[.ttValue], edi

		lea   r8d, [rdi+VALUE_MATE_IN_MAX_PLY]
	       test   edx, edx
		 jz   .DontReturnTTValue

		cmp   edi, VALUE_NONE
		 je   .DontReturnTTValue
		cmp   r8d, 2*VALUE_MATE_IN_MAX_PLY
		jae   .ValueFromTT
.ValueFromTTRet:
		cmp   eax, dword[.depth]
		 jl   .DontReturnTTValue
    if .PvNode eq 0
		mov   eax, BOUND_UPPER
		mov   r8d, BOUND_LOWER
		cmp   edi, dword[.beta]
	     cmovge   eax, r8d
	       test   al, byte[.ltte+MainHashEntry.genBound]
		jnz   .ReturnTTValue
    end if

.DontReturnTTValue:

    if .RootNode eq 0
	; Step 4a. Tablebase probe
;               test   r15d, r15d
;                jns   .CheckTablebase
.CheckTablebaseReturn:
    end if

	; step 5. evaluate the position statically
		mov   eax, VALUE_NONE
		mov   dword [.eval], eax
		mov   dword[rbx+State.staticEval], eax
		mov   rcx, qword[rbx+State.checkersBB]
	       test   rcx, rcx
		jnz   .moves_loop
		mov   edx, dword[rbx-1*sizeof.State+State.currentMove]
	      movsx   eax, word[.ltte+MainHashEntry.eval]
	       test   r13d, r13d
		jnz   .StaticValueYesTTHit
.StaticValueNoTTHit:
		mov   eax, dword[rbx-1*sizeof.State+State.staticEval]
		neg   eax
		add   eax, 2*Eval_Tempo
		mov   r12, qword[.tte]
		cmp   edx, MOVE_NULL
		 je   @f
	       call   Evaluate
	@@:	mov   r8d, eax
		mov   dword[rbx+State.staticEval], eax
		mov   dword[.eval], eax
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
		mov   dword[rbx+State.staticEval], eax
		cmp   edi, eax
	       setg   cl
		add   ecx, BOUND_UPPER
		cmp   edi, VALUE_NONE
		 je   @f
	       test   cl, byte[.ltte+MainHashEntry.genBound]
	     cmovnz   eax, edi
	@@:	mov   dword[.eval], eax
.StaticValueDone:


		mov   al, byte[rbx+State.skipEarlyPruning]
	       test   al, al
		jnz   .moves_loop



	; Step 6. Razoring (skipped when in check)
    if .PvNode eq 0
		mov   edx, dword[.depth]
		cmp   edx, 4*ONE_PLY
		jge   .6skip
		mov   eax, dword[.ttMove]
	       test   eax, eax
		jnz   .6skip
		mov   ecx, dword[.eval]
		mov   eax, dword[RazorMargin+4*rdx]
		add   eax, ecx
		cmp   eax, dword[.alpha]
		 jg   .6skip

		cmp   edx, ONE_PLY
		 jg   .6b
		mov   eax, dword[RazorMargin+4*3*ONE_PLY]
		add   eax, ecx
		cmp   eax, dword[.alpha]
		 jg   .6b
.6a:
		mov   ecx, dword[.alpha]
		mov   edx, dword[.beta]
		xor   r8d, r8d
	       call   QSearch_NonPv_NoCheck
		jmp   .Return
.6b:
		mov   ecx, dword[.alpha]
		sub   ecx, dword[RazorMargin+4*rdx]
		lea   edx, [rcx+1]
		mov   esi, ecx
		xor   r8d, r8d
	       call   QSearch_NonPv_NoCheck
		cmp   eax, esi
		jle   .Return
.6skip:
    end if


	; Step 7. Futility pruning: child node (skipped when in check)
    if .RootNode eq 0
		mov   edx, dword[.depth]
		mov   ecx, dword[rbp+Pos.sideToMove]
	      movzx   ecx, word[rbx+State.npMaterial+2*rcx]
		cmp   edx, 7*ONE_PLY
		jge   .7skip
	       imul   edx, 200
		mov   eax, dword[.eval]
		cmp   eax, VALUE_KNOWN_WIN
		jge   .7skip
		sub   eax, edx
		cmp   eax, dword[.beta]
		 jl   .7skip
	       test   ecx, ecx
		jnz   .Return
.7skip:
    end if




	; Step 8. Null move search with verification search (is omitted in PV nodes)
    if .PvNode eq 0
		mov   edx, dword[.depth]
		cmp   edx, 2*ONE_PLY
		 jl   .8skip
		mov   eax, dword[.eval]
		cmp   eax, dword[.beta]
		 jl   .8skip
		mov   ecx, dword[rbp+Pos.sideToMove]
	      movzx   ecx, word[rbx+State.npMaterial+2*rcx]
	       test   ecx, ecx
		 jz   .8skip

		xor   eax, eax
		mov   dword[rbx+State.currentMove], MOVE_NULL
		mov   qword[rbx+State.counterMoves], rax

		mov   eax, dword[.eval]
		sub   eax, dword[.beta]
		mov   ecx, PawnValueMg
		xor   edx, edx
	       idiv   ecx
		mov   ecx, 3
		cmp   eax, ecx
	      cmovg   eax, ecx
	       imul   ecx, dword[.depth], 67
		add   ecx, 823
		sar   ecx, 8
		add   eax, ecx

	     Assert   ge, eax, 0, 'assertion eax >= 0 failed in Search'

		mov   esi, dword[.depth]
		sub   esi, eax
	; esi = depth-R

	       call   Move_DoNull
		mov   byte[rbx+State.skipEarlyPruning], -1
		mov   r8d, esi
		xor   eax, eax
		lea   r12, [QSearch_NonPv_NoCheck]
		lea   rcx, [Search_NonPv]
		cmp   esi, ONE_PLY
	     cmovge   r12, rcx
	      cmovl   r8d, eax
		mov   ecx, dword[.beta]
		neg   ecx
		lea   edx, [rcx+1]
		mov   r9l, byte[.cutNode]
		xor   r9l, -1	     ; not used in qsearch case
	       call   r12
		neg   eax
		mov   byte[rbx+State.skipEarlyPruning], 0
		xor   dword[rbp+Pos.sideToMove], 1	  ;undo null move
		sub   rbx, sizeof.State 		  ;

		mov   edx, dword[.beta]
		cmp   eax, edx
		 jl   .8skip

		cmp   eax, VALUE_MATE_IN_MAX_PLY
	     cmovge   eax, edx
		mov   edi, eax
	; edi = nullValue

		mov   ecx, dword[.depth]
		cmp   ecx, 12*ONE_PLY
		jge   .8check
		lea   ecx, [rdx+VALUE_KNOWN_WIN-1]
		cmp   ecx, 2*(VALUE_KNOWN_WIN-1)
		jbe   .Return
.8check:
		mov   byte[rbx+State.skipEarlyPruning], -1
		mov   r8d, esi
		xor   eax, eax
		lea   r12, [QSearch_NonPv_NoCheck]
		lea   rcx, [Search_NonPv]
		cmp   esi, ONE_PLY
	     cmovge   r12, rcx
	      cmovl   r8d, eax
		lea   ecx, [rdx-1]
		xor   r9d, r9d
	       call   r12
		mov   byte[rbx+State.skipEarlyPruning], 0
		cmp   eax, dword[.beta]
		mov   eax, edi
		jge   .Return
.8skip:
    end if



	; Step 9. ProbCut (skipped when in check)
    if .PvNode eq 0
		mov   eax, dword[.depth]
		cmp   eax, 5*ONE_PLY
		 jl   .9skip
		mov   eax, dword[.beta]
		add   eax, VALUE_MATE_IN_MAX_PLY-1
		cmp   eax, 2*(VALUE_MATE_IN_MAX_PLY-1)
		 ja   .9skip

	     Assert   ne, dword[rbx-1*sizeof.State+State.currentMove], 0	, 'assertion dword[rbx-1*sizeof.State+State.currentMove] != MOVE_NONE failed in Search.Step9'
	     Assert   ne, dword[rbx-1*sizeof.State+State.currentMove], MOVE_NULL, 'assertion dword[rbx-1*sizeof.State+State.currentMove] != MOVE_NULL failed in Search.Step9'

	; initialize movepick
	     Assert   e, qword[rbx+State.checkersBB], 0, 'assertion qword[rbx+State.checkersBB] == 0 failed in Search.Step9'
		lea   rsi, [.movepick]
	      movzx   eax, byte[rbx+State.capturedPiece]
		mov   eax, dword[PieceValue_MG+4*rax]
		mov   dword[rsi+Pick.threshold], eax
		lea   r11, [rsi+Pick.moves]
		lea   rax, [r11+8*(MAX_MOVES-1)]
		lea   r8, [MovePick_Probcut]
		mov   qword[rsi+Pick.cur], r11
		mov   qword[rsi+Pick.endBadCaptures], rax
		mov   qword[rsi+Pick.stage], r8
		mov   qword[rsi+Pick.endMoves], r11
		mov   ecx, dword[.ttMove]
		mov   eax, ecx
		mov   edx, ecx
		and   edx, 63
		shr   eax, 12
	      movzx   edx, byte[rbp+Pos.board+rdx]
		xor   edi, edi
	       test   ecx, ecx
		 jz   .9NoTTMove
		cmp   eax, MOVE_TYPE_CASTLE
		 je   .9NoTTMove
		cmp   eax, MOVE_TYPE_EPCAP
		 je   @f
	       test   edx, edx
		 jz   .9NoTTMove
	@@:	mov   ecx, dword[.ttMove]
	       call   Move_IsPseudoLegal
	       test   rax, rax
		 jz   .9NoTTMove
		mov   ecx, dword[.ttMove]
	       call   See
		cmp   eax, dword[rsi+Pick.threshold]
		jle   .9NoTTMove
		mov   edi, dword[.ttMove]
		add   qword[rsi+Pick.endMoves], sizeof.ExtMove
.9NoTTMove:
		mov   dword[rsi+Pick.ttMove], edi
	; movepick struct is now initialized

	       call   SetCheckInfo

		mov   edi, dword[.beta]
		add   edi, 200
		mov   eax, VALUE_INFINITE
		cmp   edi, eax
	      cmovg   edi, eax
	; edi = rbeta

.9moveloop:
		lea   rsi, [.movepick]
	GetNextMove
		mov   dword[.move], eax
	       test   eax, eax
		 jz   .9moveloop_done
		mov   ecx, eax
	       call   Move_IsLegal
	       test   eax, eax
		 jz   .9moveloop

		mov   ecx, dword[.move]
		mov   dword[rbx+State.currentMove], ecx
		mov   eax, ecx
		shr   eax, 6
		and   eax, 63
		and   ecx, 63

match =1, PROFILE \{
lock inc qword[profile.moveUnpack]
\}

	      movzx   eax, byte[rbp+Pos.board+rax]
		shl   eax, 6
		add   eax, ecx
	     Assert   b, eax, 64*16, 'oops2'
	       imul   eax, 4*16*64
		lea   rax, [CounterMoveHistory+rax]
		mov   qword[rbx+State.counterMoves], rax

		mov   ecx, dword[.move]
	       call   Move_GivesCheck
		mov   ecx, dword[.move]
		mov   edx, eax
	       call   Move_Do__ProbCut
		mov   ecx, edi
		neg   ecx
		lea   edx, [rcx+1]
		mov   r8d, dword[.depth]
		sub   r8d, 4*ONE_PLY
	     Assert   ge, r8d, ONE_PLY, 'assertion dword[.depth] - 4*ONE_PLY >= ONE_PLY failed in Search.9moveloop'
		mov   r9l, byte[.cutNode]
		xor   r9l, -1
	       call   Search_NonPv
		neg   eax
		mov   esi, eax
		mov   ecx, dword[.move]
	       call   Move_Undo
		mov   eax, esi
		cmp   esi, edi
		 jl   .9moveloop
		jmp   .Return

.9moveloop_done:
.9skip:
    end if



	; Step 10. Internal iterative deepening (skipped when in check)


		mov   r8d, dword[.depth]
		mov   ecx, dword[.ttMove]
	       test   ecx, ecx
		jnz   .10skip
	if .PvNode eq 1
		cmp   r8d, 5*ONE_PLY
		 jl   .10skip
		sub   r8d, 2*ONE_PLY
		mov   ecx, dword[.alpha]
		mov   edx, dword[.beta]
		 or   r9d, -1
		mov   byte[rbx+State.skipEarlyPruning], -1
	       call   Search_Pv
	else
		cmp   r8d, 8*ONE_PLY
		 jl   .10skip
		mov   eax, dword[rbx+State.staticEval]
		add   eax, 256
		cmp   eax, dword[.beta]
		 jl   .10skip
		mov   eax, r8d
		sar   eax, 2
		sub   r8d, 2*ONE_PLY
		sub   r8d, eax
		mov   ecx, dword[.alpha]
		mov   edx, dword[.beta]
		 or   r9d, -1
		mov   byte[rbx+State.skipEarlyPruning], -1
	       call   Search_NonPv
	end if
		mov   byte[rbx+State.skipEarlyPruning], 0
		mov   rcx, qword[.posKey]
	       call   MainHash_Probe
		mov   qword[.tte], rax
		mov   qword[.ltte], rcx
		mov   byte[.ttHit], dl
		shr   ecx, 16
		mov   dword[.ttMove], ecx
.10skip:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.moves_loop:	    ; this is actually not the head of the loop
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

VerboseDisplay <db 'entering moves_loop',10>

		mov   eax, dword[rbx-1*sizeof.State+State.currentMove]
		and   eax, 63
		mov   dword[.prevSq], eax
	; not sure if these need to stored on the fxn stack as well
		mov   rax, qword[rbx-1*sizeof.State+State.counterMoves]
		mov   rcx, qword[rbx-2*sizeof.State+State.counterMoves]
		mov   rdx, qword[rbx-4*sizeof.State+State.counterMoves]
		mov   qword[.cmh], rax
		mov   qword[.fmh], rcx
		mov   qword[.fmh2], rdx

		lea   rsi, [.movepick]
		mov   ecx, dword[.ttMove]
		mov   edx, dword[.depth]
	       call   MovePick_Init_Search

	       call   SetCheckInfo

		mov   eax, dword[.bestValue]
		mov   dword[.value], eax

		mov   edx, dword[rbx-0*sizeof.State+State.staticEval]
		mov   ecx, dword[rbx-2*sizeof.State+State.staticEval]
		cmp   edx, ecx
	      setge   al
		cmp   edx, VALUE_NONE
	       sete   dl
		cmp   ecx, VALUE_NONE
	       sete   cl
		 or   al, dl
		 or   al, cl
	     Assert   b, al, 2, 'assertion al<2 in Search failed'
		mov   byte[.improving], al   ; should be 0 or 1

    if .RootNode eq 1
		mov   byte[.singularExtensionNode], 0
    else
		mov   eax, 1
		mov   ecx, dword[.depth]
		cmp   ecx, 8*ONE_PLY
	      setge   cl
		and   al, cl
		mov   edx, dword[.ttMove]
	       test   edx, edx
	      setne   cl
		and   al, cl
		mov   edx, dword[.ttValue]
		add   edx, VALUE_KNOWN_WIN-1
		cmp   edx, 2*(VALUE_KNOWN_WIN-1)
	      setbe   cl
		and   al, cl
		mov   edx, dword[.excludedMove]
	       test   edx, edx
	       setz   cl
		and   al, cl
		mov   dl, byte[.ltte+MainHashEntry.genBound]
	       test   dl, BOUND_LOWER
	      setnz   cl
		and   al, cl
	      movsx   edx, byte[.ltte+MainHashEntry.depth]
		add   edx, 3
		cmp   edx, dword[.depth]
	      setge   cl
		and   al, cl
		mov   byte[.singularExtensionNode], al
    end if




	; Step 11. Loop through moves
.MovePickLoop:	     ; this is the head of the loop

		lea   rsi, [.movepick]
	GetNextMove
		mov   dword[.move], eax
	       test   eax, eax
		 jz   .MovePickDone
		cmp   eax, dword[.excludedMove]
		 je   .MovePickLoop

		; at the root search only moves in the move list
	if .RootNode eq 1
	       imul   ecx, dword[rbp-Thread.rootPos+Thread.PVIdx], sizeof.RootMove
		add   rcx, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
		mov   rdx, qword[rbp+Pos.rootMovesVec+RootMovesVec.ender]
	@@:	cmp   rcx, rdx
		jae   .MovePickLoop
		cmp   eax, dword[rcx+RootMove.pv+4*0]
		lea   rcx, [rcx+sizeof.RootMove]
		jne   @b

	end if

		mov   eax, dword[.moveCount]
		add   eax, 1
		mov   dword[rbx+State.moveCount], eax
		mov   dword[.moveCount], eax

		xor   eax, eax
	if .PvNode eq 1
		mov   qword[rbx+1*sizeof.State+State.pv], rax
	end if
		mov   dword[.extension], eax


		mov   ecx, dword[.move]
		mov   edx, ecx
		shr   edx, 6
		and   edx, 63
match =1, PROFILE \{
lock inc qword[profile.moveUnpack]
\}

	      movzx   edx, byte[rbp+Pos.board+rdx]
		mov   dword[.moved_piece], edx
		mov   eax, ecx
		and   eax, 63
		shr   ecx, 12
	      movzx   eax, byte[rbp+Pos.board+rax]
		 or   al, byte[CaptureOrPromotion_or+rcx]
		and   al, byte[CaptureOrPromotion_and+rcx]
		mov   byte[.captureOrPromotion], al
		mov   ecx, dword[.move]
	       call   Move_GivesCheck
		mov   byte[.givesCheck], al


      ; Step 12. Extend checks
		mov   ecx, dword[.move]
		mov   al, byte[.givesCheck]
	       test   al, al
		 jz   .12dont_extend
	    SeeSign   .12extend_oneply
	       test   eax, eax
		 js   .12dont_extend
.12extend_oneply:
		mov   dword[.extension], 1
.12dont_extend:

		mov   al, byte[.singularExtensionNode]
	       test   al, al
		 jz   .12done
		mov   ecx, dword[.move]
		cmp   ecx, dword[.ttMove]
		jne   .12done
		mov   eax, dword[.extension]
	       test   eax, eax
		jnz   .12done
	       call   Move_IsLegal
		mov   edx, dword[.ttValue]
		mov   r8d, dword[.depth]
		mov   r9l, byte[.cutNode]
	       test   eax, eax
		 jz   .12done
		sub   edx, r8d
		sub   edx, r8d
		lea   ecx, [rdx-1]
		mov   edi, edx
		sar   r8d, 1
		mov   eax, dword[.move]
		mov   dword[rbx+State.excludedMove], eax
		mov   byte[rbx+State.skipEarlyPruning], -1
	       call   Search_NonPv
		xor   ecx, ecx
		mov   byte[rbx+State.skipEarlyPruning], cl
		mov   dword[rbx+State.excludedMove], ecx
		cmp   eax, edi
	       setl   cl
		mov   dword[.extension], ecx
.12done:
		mov   eax, dword[.depth]
		sub   eax, 1
		add   eax, dword[.extension]
		mov   dword[.newDepth], eax



	; Step 13. Pruning at shallow depth

		mov   r12d, dword[.move]
		shr   r12d, 6
		and   r12d, 63				; r12d = from
		mov   r13d, dword[.move]
		and   r13d, 63				; r13d = to
	      movzx   r14d, byte[rbp+Pos.board+r12]	; r14d = from piece
	      movzx   r15d, byte[rbp+Pos.board+r13]	; r15d = to piece
match =1, PROFILE \{
lock inc qword[profile.moveUnpack]
\}

    if .RootNode eq 0

		mov   al, byte[.captureOrPromotion]
	       test   al, al
		jnz   .13done
		mov   rax, qword[rbx+State.checkersBB]
	       test   rax, rax
		jnz   .13done
		mov   al, byte[.givesCheck]
	       test   al, al
		jnz   .13done
		mov   eax, dword[.bestValue]
		cmp   eax, VALUE_MATED_IN_MAX_PLY
		jle   .13done
		mov   eax, dword[rbp+Pos.sideToMove]
		lea   ecx, [8*rax+Pawn]
		cmp   r14d, ecx
		jne   .13do
		mov   ecx, r12d
		shr   ecx, 3
	       imul   eax, 7
		xor   ecx, eax
		cmp   ecx, RANK_4
		 ja   .13done
.13do:
		mov   edx, dword[.depth]

	; Move count based pruning
		cmp   edx, 16*ONE_PLY
		jge   .13DontSkip1
		mov   ecx, dword[.moveCount]
	      movzx   eax, byte[.improving]
	       imul   eax, 16*4
		cmp   ecx, dword[FutilityMoveCounts+rax+4*rdx]
		jge   .MovePickLoop
       .13DontSkip1:

	; History based pruning
		mov   r8, qword[.cmh]
		mov   r9, qword[.fmh]
		mov   r10, qword[.fmh2]
		cmp   edx, 4*ONE_PLY
		 jg   .13DontSkip2
		mov   ecx, dword[.move]
		cmp   ecx, dword[rbx+State.killers+4*0]
		 je   .13DontSkip2
	       imul   eax, r14d, 64
		add   eax, r13d
	       test   r8, r8
		 jz   @f
		cmp   dword[r8+4*rax], 0
		jge   .13DontSkip2
	@@:    test   r9, r9
		 jz   @f
		cmp   dword[r9+4*rax], 0
		jge   .13DontSkip2
	@@:    test   r10, r10
		 jz   .MovePickLoop
		cmp   dword[r10+4*rax], 0
		 jl   .MovePickLoop
	       test   r8, r8
		 jz   .13DontSkip2
	       test   r9, r9
		jnz   .MovePickLoop
	.13DontSkip2:

		mov   esi, 63
	      movzx   eax, byte[.improving]
		mov   ecx, dword[.depth]
		cmp   ecx, esi
	      cmova   ecx, esi
	       imul   eax, 64
		add   eax, ecx
		mov   ecx, dword[.moveCount]
		cmp   ecx, esi
	      cmova   ecx, esi
	       imul   eax, 64
		add   eax, ecx
		mov   edx, dword[.newDepth]
		sub   edx, dword[Reductions+4*(rax+2*64*64*.PvNode)]
	; Futility pruning: parent node
		cmp   edx, 7*ONE_PLY
		jge   .13done
		xor   eax, eax
	       test   edx, edx
	      cmovs   edx, eax
	; edx = predictedDepth
	       imul   eax, edx, 200
		add   eax, 256
		add   eax, dword[rbx+State.staticEval]
		cmp   eax, dword[.alpha]
		jle   .MovePickLoop

	; Prune moves with negative SEE at low depths
		mov   ecx, dword[.move]
		cmp   edx, 4*ONE_PLY
		jge   .13done
	    SeeSign   .13done
	       test   eax, eax
		 js   .MovePickLoop
.13done:
    end if

	; Speculative prefetch as early as possible
		shl   r14d, 6+3
		shl   r15d, 6+3
		mov   rax, qword[rbx+State.key]
		xor   rax, qword[Zobrist_side]
		xor   rax, qword[Zobrist_Pieces+r14+8*r12]
		xor   rax, qword[Zobrist_Pieces+r14+8*r13]
		xor   rax, qword[Zobrist_Pieces+r15+8*r13]
		and   rax, qword[mainHash.mask]
		shl   rax, 5
		add   rax, qword[mainHash.table]
	prefetchnta   [rax]

	; Check for legality just before making the move
    if .RootNode eq 0
		mov   ecx, dword[.move]
	       call   Move_IsLegal
	       test   rax, rax
		 jz   .IllegalMove
    end if

		mov   ecx, dword[.move]
		mov   dword[rbx+State.currentMove], ecx
		and   ecx, 63
		mov   eax, dword[.moved_piece]
		shl   eax, 6
		add   eax, ecx
	     Assert   b, eax, 64*16, 'oops2'
	       imul   eax, 4*16*64
		lea   rax, [CounterMoveHistory+rax]
		mov   qword[rbx+State.counterMoves], rax


	; Step 14. Make the move
		mov   ecx, dword[.move]
	      movsx   edx, byte[.givesCheck]
	       call   Move_Do__Search


	; Step 15. Reduced depth search (LMR)
		mov   eax, dword[.depth]
		cmp   eax, 3*ONE_PLY
		 jl   .15skip
		mov   eax, dword[.moveCount]
		cmp   eax, 1
		jbe   .15skip
		mov   al, byte[.captureOrPromotion]
	       test   al, al
		jnz   .15skip

		mov   esi, 63
	      movzx   eax, byte[.improving]
		mov   ecx, dword[.depth]
		cmp   ecx, esi
	      cmova   ecx, esi
	       imul   eax, 64
		add   eax, ecx
		mov   ecx, dword[.moveCount]
		cmp   ecx, esi
	      cmova   ecx, esi
	       imul   eax, 64
		add   eax, ecx
		mov   eax, dword[Reductions+4*(rax+2*64*64*.PvNode)]
		mov   dword[.r], eax
		mov   edi, eax



SD_String db '_r='
SD_Int rdi
SD_String db '|'


		mov   r12d, dword[.move]
		shr   r12d, 6
		and   r12d, 63				; r12d = from
		mov   r13d, dword[.move]
		and   r13d, 63				; r13d = to
	      movzx   r14d, byte[rbp+Pos.board+r12]	; r14d = from piece   should be 0
	      movzx   r15d, byte[rbp+Pos.board+r13]	; r15d = to piece


	if .PvNode eq 0
		cmp   byte[.cutNode], 0
		 jz   .15testA
		add   edi, 2*ONE_PLY
		jmp   .15skipA
	end if
.15testA:
		mov   ecx, dword[.move]
		cmp   ecx, MOVE_TYPE_PROM shl 12
		jae   .15skipA
		mov   eax, r15d
		and   eax, 7
		cmp   eax, Pawn
		 je   .15skipA
		mov   eax, ecx
		and   eax, 63
		shl   eax, 6
		shr   ecx, 6
		and   ecx, 63
		add   ecx, eax
	       call   See
	       test   eax, eax
		jns   .15skipA
		sub   edi, 2*ONE_PLY
.15skipA:

SD_String db '_r='
SD_Int rdi
SD_String db '|'

	       imul   ecx, r15d, 64
		add   ecx, r13d
		mov   r8, qword[rbp+Pos.history]
		mov   r9, qword[.cmh]
		mov   r10, qword[.fmh]
		mov   r11, qword[.fmh2]
		mov   eax, dword[r8+4*rcx]
	       test   r9, r9
		 jz   @f
		add   eax, dword[r9+4*rcx]
	@@:    test   r10, r10
		 jz   @f
		add   eax, dword[r10+4*rcx]
	@@:    test   r11, r11
		 jz   @f
		add   eax, dword[r11+4*rcx]
	@@:

SD_String db '_val='
SD_Int rax
SD_String db '|'

		sub   eax, 10000
		cdq
		mov   ecx, 20000
	       idiv   ecx
		xor   ecx, ecx
		sub   edi, eax
	      cmovs   edi, ecx
		mov   dword[.r], edi


		mov   eax, 1
		mov   r8d, dword[.newDepth]
		sub   r8d, edi
		cmp   r8d, eax
	      cmovl   r8d, eax


SD_String db '_d='
SD_Int r8
SD_String db '|'

		mov   edx, dword[.alpha]
		neg   edx
		lea   ecx, [rdx-1]
		 or   r9d, -1
	       call   Search_NonPv
		neg   eax
		mov   dword[.value], eax

		cmp   eax, dword[.alpha]
		jle   .17entry
		mov   edi, dword[.r]
	       test   edi, edi
		 jz   .15dontdofulldepthsearch

		xor   r9, r9
		mov   r8d, dword[.newDepth]
		lea   r10, [QSearch_NonPv_InCheck]
		lea   r11, [QSearch_NonPv_NoCheck]
		cmp   byte[.givesCheck], 0
	     cmovne   r11, r10
		lea   rax, [Search_NonPv]
		cmp   r8d, 1
	      cmovl   rax, r11
	      cmovl   r8d, r9d
		mov   edx, dword[.alpha]
		neg   edx
		lea   ecx, [rdx-1]
		mov   r9l, byte[.cutNode]
		xor   r9l, -1
	       call   rax
		neg   eax
		mov   dword[.value], eax

		cmp   eax, dword[.alpha]
		jle   .17entry

.15dontdofulldepthsearch:
    if .PvNode eq 1
	if .RootNode eq 0
		mov   eax, dword[.value]
		cmp   eax, dword[.beta]
		jge   .17entry
	end if
		lea   rax, [.pv]
		mov   qword[rbx+State.pv], rax
		mov   dword[rax], 0

		xor   r9, r9
		mov   r8d, dword [.newDepth]
		lea   r10, [QSearch_Pv_InCheck]
		lea   r11, [QSearch_Pv_NoCheck]
		cmp   byte[.givesCheck], 0
	     cmovne   r11, r10
		lea   rax, [Search_Pv]
		cmp   r8d, 1
	      cmovl   rax, r11
	      cmovl   r8d, r9d
		mov   ecx, dword[.beta]
		neg   ecx
		mov   edx, dword[.alpha]
		neg   edx
		xor   r9d, r9d
	       call   rax
		neg   eax
		mov   dword[.value], eax
    end if
		jmp   .17entry



.15skip:

	; Step 16. full depth search   this is for when step 15 is skipped
    if .PvNode eq 1
		cmp   dword[.moveCount], 1
		jbe   .DoFullPvSearch
    end if

 .FullDepthSearch:
		xor   r9, r9
		mov   r8d, dword[.newDepth]
		lea   r10, [QSearch_NonPv_InCheck]
		lea   r11, [QSearch_NonPv_NoCheck]
		cmp   byte[.givesCheck], 0
	     cmovne   r11, r10
		lea   rax, [Search_NonPv]
		cmp   r8d, 1
	      cmovl   rax, r11
	      cmovl   r8d, r9d
		mov   edx, dword[.alpha]
		neg   edx
		lea   ecx, [rdx-1]
		mov   r9l, byte[.cutNode]
		xor   r9l, -1
	       call   rax
		neg   eax
		mov   edi, eax
		mov   dword[.value], eax



    if .PvNode eq 1
		cmp   edi, dword[.alpha]
		jle   .SkipFullPvSearch
	if .RootNode eq 0
		cmp   edi, dword[.beta]
		jge   .SkipFullPvSearch
	end if


 .DoFullPvSearch:
		lea   rax, [.pv]
		mov   qword[rbx+State.pv], rax
		mov   dword[rax], 0

		xor   r9, r9
		mov   r8d, dword [.newDepth]
		lea   r10, [QSearch_Pv_InCheck]
		lea   r11, [QSearch_Pv_NoCheck]
		cmp   byte[.givesCheck], 0
	     cmovne   r11, r10
		lea   rax, [Search_Pv]
		cmp   r8d, 1
	      cmovl   rax, r11
	      cmovl   r8d, r9d
		mov   ecx, dword[.beta]
		neg   ecx
		mov   edx, dword[.alpha]
		neg   edx
		xor   r9d, r9d
	       call   rax
		neg   eax
		mov   edi, eax
		mov   dword[.value], eax
 .SkipFullPvSearch:
    end if





	; Step 17. Undo move
.17entry:

		mov   ecx, dword[.move]
	       call   Move_Undo

	; Step 18. Check for new best move

		mov   edi, dword[.value]
		xor   eax, eax
		cmp   al, byte[signals.stop]
		jne   .Return

    if .RootNode eq 1
		mov   ecx, dword[.move]
		mov   rdx, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
		lea   rdx, [rdx-sizeof.RootMove]
	.FindRootMove:
		lea   rdx, [rdx+sizeof.RootMove]
	     Assert   b, rdx, qword[rbp+Pos.rootMovesVec+RootMovesVec.ender], 'cant find root move'
		cmp   ecx, dword[rdx+RootMove.pv+4*0]
		jne   .FindRootMove
		mov   esi, 1
		mov   r10d, -VALUE_INFINITE
		cmp   esi, dword[.moveCount]
		 je   .FoundRootMove1
		cmp   edi, dword[.alpha]
		jle   .FoundRootMoveDone
	     vmovsd   xmm0, qword[rbp-Thread.rootPos+Thread.bestMoveChanges]
	     vaddsd   xmm0, xmm0, qword[constd.1p0]
	     vmovsd   qword[rbp-Thread.rootPos+Thread.bestMoveChanges], xmm0
.FoundRootMove1:
		mov   r10d, edi
		mov   rcx, qword[rbx+1*sizeof.State+State.pv]
		jmp   .CopyRootPvw
    .CopyRootPv:
		add   rcx, 4
		mov   dword[rdx+RootMove.pv+4*rsi], eax
		add   esi, 1
    .CopyRootPvw:
		mov   eax, dword[rcx]
	       test   eax, eax
		jnz   .CopyRootPv

.FoundRootMoveDone:
		mov   dword[rdx+RootMove.pvSize], esi
		mov   dword[rdx+RootMove.score], r10d
    end if


	; check for new best move
		mov   ecx, dword[.move]
		cmp   edi, dword[.bestValue]
		jle   .18NoNewBestValue
		mov   dword[.bestValue], edi



;push rsi rdi rax rcx rdx r8 r9 r13 r14 r15
;mov r15, rdi
;lea rdi, [VerboseOutput]
;mov rax,'bestValu'
;stosq
;mov ax, 'e='
;stosw
;movsxd rax, r15d
;call PrintSignedInteger
;mov al, '|'
;stosb
;lea rcx, [VerboseOutput]
;call _WriteOut
;pop r15 r14 r13 r9 r8 rdx rcx rax rdi rsi




		cmp   edi, dword[.alpha]
		jle   .18NoNewAlpha
		mov   dword[.bestMove], ecx

    if .PvNode eq 1
		cmp   rbp, mainThread.rootPos
		jne   .18skipeasy
		mov   rcx, qword[rbx+State.key]
	       call   EasyMoveMng_Get
	       test   eax, eax
		 jz   .18skipeasy
		cmp   eax, dword[.move]
		jne   .18easy
		cmp   dword[.moveCount], 1
		jbe   .18skipeasy
.18easy:
	       call   EasyMoveMng_Clear

.18skipeasy:
    end if

    if .PvNode eq 1
    if .RootNode eq 0

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
    end if
    end if


    if .PvNode eq 1
		cmp   edi, dword[.beta]
		jge   .18fail_high
		mov   dword[.alpha], edi
		jmp   .18NoNewBestValue
    end if

.18fail_high:
	     Assert   ge, edi, dword[.beta], 'did not fail high in Search'
		jmp   .MovePickDone

.18NoNewAlpha:
.18NoNewBestValue:

		mov   ecx, dword[.move]
		mov   eax, dword[.quietCount]
		cmp   byte[.captureOrPromotion], 0
		jnz   .18Done
		cmp   ecx, dword[.bestMove]
		 je   .18Done
		cmp   eax, 64
		jae   .18Done
		mov   dword[.quietsSearched+4*rax], ecx
		add   eax, 1
		mov   dword[.quietCount], eax
.18Done:



		jmp   .MovePickLoop


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.MovePickDone:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


	; Step 20. Check for mate and stalemate
		mov   edi, dword[.bestValue]


;push rsi rdi rax rcx rdx r8 r9 r13 r14 r15
;mov r15, rdi
;lea rdi, [VerboseOutput]
;mov al, 'i'
;stosb
;mov rax,'bestValu'
;stosq
;mov ax, 'e='
;stosw
;movsxd rax, r15d
;call PrintSignedInteger
;mov al, '|'
;stosb
;lea rcx, [VerboseOutput]
;call _WriteOut
;pop r15 r14 r13 r9 r8 rdx rcx rax rdi rsi

		mov   edx, dword[.bestMove]
		mov   ecx, edx
		mov   eax, edx
		and   eax, 63
		shr   ecx, 12
	      movzx   eax, byte[rbp+Pos.board+rax]
		 or   al, byte[CaptureOrPromotion_or+rcx]
		and   al, byte[CaptureOrPromotion_and+rcx]
		cmp   dword[.moveCount], 0
		 je   .20Mate
	       test   edx, edx
		 jz   .20CheckBonus
	       test   al, al
		jnz   .20TTStore
.20Quiet:
		mov   ecx, dword[.bestMove]
		mov   edx, dword[.depth]
		lea   r8, [.quietsSearched]
		mov   r9d, dword[.quietCount]
	       call   UpdateStats
		jmp   .20TTStore
.20Mate:
		mov   rax, qword[rbx+State.checkersBB]
		mov   ecx, dword[rbp+Pos.sideToMove]
		mov   edx, dword[.excludedMove]
		mov   edi, dword[rbx+State.ply]
		sub   edi, VALUE_MATE
	       test   rax, rax
	      cmovz   edi, dword[DrawValue+4*rcx]
	       test   edx, edx
	     cmovnz   edi, dword[.alpha]
		jmp   .20TTStore
.20CheckBonus:
	; we already checked that bestMove = 0
		mov   eax, dword[.depth]
		cmp   eax, 3*ONE_PLY
		 jl   .20TTStore
	      movzx   eax, byte[rbx+State.capturedPiece]
		 or   rax, qword[rbx+State.checkersBB]
		jnz   .20TTStore
		mov   eax, dword[rbx-1*sizeof.State+State.currentMove]
	       test   eax, 0x07FFF
		 jz   .20TTStore

		mov   eax, dword[.prevSq]
	      movzx   r8d, byte[rbp+Pos.board+rax]
		shl   r8d, 6
		add   r8d, eax
		shl   r8d, 2

		mov   r10d, dword[.depth]
	       imul   r10d, r10d
		add   r10d, dword[.depth]
		sub   r10d, 1

	       imul   r11d, r10d, 32

		mov   r9, qword[rbx-2*sizeof.State+State.counterMoves]
	       test   r9, r9
		 jz   @f
		add   r9, r8
	apply_bonus   r9, r11d, r10d, 936
	@@:
		mov   r9, qword[rbx-3*sizeof.State+State.counterMoves]
	       test   r9, r9
		 jz   @f
		add   r9, r8
	apply_bonus   r9, r11d, r10d, 936
	@@:
		mov   r9, qword[rbx-5*sizeof.State+State.counterMoves]
	       test   r9, r9
		 jz   @f
		add   r9, r8
	apply_bonus   r9, r11d, r10d, 936
	@@:




.20TTStore:

;push rsi rdi rax rcx rdx r8 r9 r13 r14 r15
;mov r15, rdi
;lea rdi, [VerboseOutput]
;mov rax,'bestValu'
;stosq
;mov ax, 'e='
;stosw
;movsxd rax, r15d
;call PrintSignedInteger
;mov al, '|'
;stosb
;lea rcx, [VerboseOutput]
;call _WriteOut
;pop r15 r14 r13 r9 r8 rdx rcx rax rdi rsi

	; edi = bestValue
		mov   r9, qword[.posKey]
		lea   ecx, [rdi+VALUE_MATE_IN_MAX_PLY]
		mov   r8, qword[.tte]
		shr   r9, 48
		mov   edx, edi
		cmp   ecx, 2*VALUE_MATE_IN_MAX_PLY
		jae   .20ValueToTT
	.20ValueToTTRet:
    if .PvNode eq 0
		mov   eax, dword[.bestMove]
		xor   esi, esi
		cmp   edi, dword[.beta]
	      setge   sil
		add   esi, BOUND_UPPER
    else
		mov   eax, dword[.bestMove]
		mov   ecx, BOUND_LOWER
		cmp   eax, 1
		sbb   esi, esi
		lea   esi, [(BOUND_EXACT-BOUND_UPPER)*rsi+BOUND_EXACT]
		cmp   edi, dword[.beta]
	     cmovge   esi, ecx
    end if
     HashTable_Save   r8, r9w, edx, sil, byte[.depth], eax, word[rbx+State.staticEval]
		mov   eax, edi

match =2, VERBOSE \{
push rsi rdi rax rcx rdx r8 r9 r13 r14 r15
mov r15, rax
lea rdi, [VerboseOutput]
mov rax,'search<'
stosq
sub rdi, 1
match =_ROOT_NODE, NT
\\{
mov al, '2'
\\}
match =_PV_NODE, NT
\\{
mov al, '1'
\\}
match =_NONPV_NODE, NT
\\{
mov al, '0'
\\}
stosb
mov eax, '> '
stosw
mov rax, 'return: '
stosq
movsxd rax, r15d
call PrintSignedInteger
mov al, 10
stosb
lea rcx, [VerboseOutput]
call _WriteOut
pop r15 r14 r13 r9 r8 rdx rcx rax rdi rsi
\}


.Return:
		add   rsp, .localsize
		pop   r15 r14 r13 r12 rdi rsi rbx
		ret


.IllegalMove:
		sub   dword[.moveCount], 1
		jmp   .MovePickLoop



if .RootNode eq 0
	      align  8
.AbortSearch_PlyBigger:
		mov   eax, dword[rbp+Pos.sideToMove]
		mov   eax, dword[DrawValue+4*rax]
		cmp   qword [rbx+State.checkersBB], 0
		 je   .Return
	       call   Evaluate
		jmp   .Return

	      align   8
.AbortSearch_PlySmaller:
		mov   eax, dword[rbp+Pos.sideToMove]
		mov   eax, dword[DrawValue+4*rax]
		jmp   .Return
end if


    if .PvNode eq 0

	      align   8
.ReturnTTValue:
		mov   eax, edi
		mov   dword[rbx+State.currentMove], ecx
		cmp   edi, dword[.beta]
		 jl   .Return
		and   ecx, 0x07FFF
		 jz   .Return
		mov   edx, ecx
		and   edx, 63
		shr   ecx, 12
	      movzx   edx, byte[rbp+Pos.board+rdx]
		 or   dl, byte[CaptureOrPromotion_or+rcx]
		and   dl, byte[CaptureOrPromotion_and+rcx]
		jnz   .Return
		mov   ecx, dword[rbx+State.currentMove]
		mov   edx, dword[.depth]
		xor   r8, r8
		xor   r9d, r9d
	       call   UpdateStats
		mov   eax, edi
		jmp   .Return
    end if


	      align   8
.20ValueToTT:
		mov   edx, dword[rbx+State.ply]
		mov   eax, edi
		sar   eax, 31
		xor   edx, eax
		sub   edx, eax
		add   edx, edi
		jmp   .20ValueToTTRet

	      align   8
.ValueFromTT:
		mov   r8d, dword[rbx+State.ply]
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




	      align 8
.CheckTablebase:
	; r14 =  TB::Cardinality - piecesCnt
		mov   ecx, dword[.depth]
		mov   rax, qword[rbp+Pos.typeBB+8*White]
		 or   rax, qword[rbp+Pos.typeBB+8*Black]
	     popcnt   rax, rax, rdx
		cmp   ecx, dword[Tablebase_ProbeDepth]
		jge   .DoTbProbe
		cmp   eax, dword[Tablebase_Cardinality]
		jge   .CheckTablebaseReturn
.DoTbProbe:
		lea   rcx, [.success]
	       call   Tablebase_ProbeWDL
		mov   edx, dword[.success]
	       test   edx, edx
		 jz   .CheckTablebaseReturn

	      movzx   ecx, byte[Tablebase_UseRule50]
		lea   edx, [2*rax]
	       imul   edx, ecx

		mov   r8d, VALUE_MATE - MAX_PLY
		cmp   eax, ecx
	      cmovg   edx, r8d
		neg   ecx
		mov   r8d, -VALUE_MATE + MAX_PLY
		cmp   eax, ecx
	      cmovl   edx, r8d

		inc   qword[Tablebase_Hits]

		mov   r9, qword[.posKey]
		lea   ecx, [rdi+VALUE_MATE_IN_MAX_PLY]
		mov   r8, qword[.tte]
		shr   r9, 48
		mov   edi, edx
		mov   eax, MAX_PLY - 1
		mov   esi, dword[.depth]
		add   esi, 6
		cmp   esi, eax
	      cmovg   esi, eax
		xor   eax, eax
     HashTable_Save   r8, r9w, edx, BOUND_EXACT, sil, eax, 0
		mov   eax, edi
		jmp   .Return
    end if

}
