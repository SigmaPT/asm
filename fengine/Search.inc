







SearchThread:
			and  rsp,-32

		; put the POS structure on the stack
			mov  eax,sizeof.POS
		       call  ___chkstk_ms
			sub  rsp,rax
			mov  rbp,rsp

		; allocate space for the array of STATEs  256 slots should be enough
			mov  ecx,256*sizeof.STATE
		       call  _VirtualAlloc
			mov  qword[rbp+POS.BASE_STATE_PTR],rax


.WaitForWork:
		     invoke  WaitForSingleObject,[SearchThreadStartEvent],-1
			jmp  .Search



.Search:

			lea  rdx,[BoardPosition]
		       call  CopyPosition
		       call  _QueryCounter
			mov  qword[rbp+POS.TIME1],rax

		; reset history bonus and killer moves
			xor  eax,eax
			mov  qword[rbp+POS.NODES],rax
			mov  dword[BestMove],eax
			mov  dword[Score],eax
			mov  ecx,64*64
			lea  rdi,[HistoryBonus]
		  rep stosd
			mov  ecx,MAX_PLY
			lea  rdi,[KillerMoves]
		  rep stosd
			add  byte[HashDate],1

		; set root to be current position
			mov  rbx,qword[rbp+POS.CURR_STATE_PTR]
			mov  qword[rbp+POS.ROOT_STATE_PTR],rbx
			mov  byte[rbx+STATE.PLY],0
			mov  byte[rbx+STATE.FLAGS],0

		; clear PV
			xor  eax,eax
			mov  qword[rbx+STATE.PV_LENGTH],rax

		; fill in list of legal moves
			lea  rdi,[rbx+STATE.MOVE_LIST]
			mov  qword[rbx+STATE.MOVE_PTR],rdi
		       call  Generate_Legal
			mov  qword[rbx+STATE.MOVE_END],rdi


		; r13d = RootDepth
		; r14d = alpha
		; r15d = beta
			mov  r13d,1
			mov  dword[RootDepth],r13d
     .SearchLoop:
		; first try small window around previous score
			mov  r14d,dword[Score]
			lea  r15d,[r14+ASPIRATION]
			lea  r14d,[r14-ASPIRATION]

		; if depth <=6 use infinite window
			cmp  r13d,6
			jbe  .ReReSearch

			mov  byte[rbx+STATE.DEPTH],r13l
			mov  dword[rbx+STATE.ALPHA],r14d
			mov  dword[rbx+STATE.BETA],r15d
		       call  Search_ROOT
			mov  dword[Score],eax
			mov  edx,dword[rbx+STATE.PV_MOVES]
			cmp  byte[SearchThreadState],THREAD_STATE_SEARCH
			jne  .ExitSearch
			mov  dword[BestMove],edx

		; if score is outside window, research with large window
			cmp  eax,r15d
			jge  .ReSearchHigh
			cmp  eax,r14d
			jle  .ReSearchLow
.SearchDone:
		       call  PrintInfo

			add  r13d,1
			mov  dword[RootDepth],r13d
			cmp  r13,MAX_PLY-8
			jbe  .SearchLoop
			jmp  .ExitSearch

		; search with bigger window
.ReSearchHigh:		add  r15d,2*ASPIRATION
			add  r14d,2*ASPIRATION
.ReSearchLow:		sub  r14d,2*ASPIRATION

			mov  byte[rbx+STATE.DEPTH],r13l
			mov  dword[rbx+STATE.ALPHA],r14d
			mov  dword[rbx+STATE.BETA],r15d
		       call  Search_ROOT
			mov  dword[Score],eax
			mov  edx,dword[rbx+STATE.PV_MOVES]
			cmp  byte[SearchThreadState],THREAD_STATE_SEARCH
			jne  .ExitSearch
			mov  dword[BestMove],edx

		; if score is outside bigger window, research with infinite window
			cmp  eax,r15d
			jge  .ReReSearch
			cmp  eax,r14d
			jle  .ReReSearch
			jmp  .SearchDone

		; search with infinite window
.ReReSearch:		mov  r14d,-INF_SCORE
			mov  r15d,+INF_SCORE

			mov  byte[rbx+STATE.DEPTH],r13l
			mov  dword[rbx+STATE.ALPHA],r14d
			mov  dword[rbx+STATE.BETA],r15d
		       call  Search_ROOT
			mov  dword[Score],eax
			mov  edx,dword[rbx+STATE.PV_MOVES]
			cmp  byte[SearchThreadState],THREAD_STATE_SEARCH
			jne  .ExitSearch
			mov  dword[BestMove],edx
			jmp  .SearchDone

.ExitSearch:
			lea  rdi,[Output]

			mov  rax,'bestmove'
		      stosq
			mov  al,' '
		      stosb
		      movzx  ecx,word[BestMove]
		       call  PrintUciMove
			mov  qword[rdi],rax
			add  rdi,rdx

			mov  rax,' ponder '
		      stosq
		      movzx  ecx,word[PonderMove]
		       call  PrintUciMove
			mov  qword[rdi],rax
			add  rdi,rdx

	.NoMove:	mov  eax,10
		      stosd
			lea  rdi,[Output]
		       call  _WriteOut

			mov  dword[SearchThreadState],THREAD_STATE_WAIT
			jmp  .WaitForWork


		      align  16
CopyPV: 	       push  rsi rdi
			lea  rdi,[rbx+STATE.PV_MOVES]
			lea  rsi,[rbx+STATE.PV_MOVES+sizeof.STATE]
		      movzx  ecx,word[rbx+STATE.PV_LENGTH+sizeof.STATE]
		      stosw
			lea  eax,[rcx+1]
			mov  [rbx+STATE.PV_LENGTH],ax
		  rep movsw
			pop  rdi rsi
			ret




		      align  16

Search_ROOT:	; in: rbp address of position (POS)
		;       move list of current STATE must already be filled in

		       push  rbx rdi rsi

		; get the address of the current state
			mov  rbx,[rbp+POS.CURR_STATE_PTR]

		; maintance
			xor  eax,eax
			add  qword[rbp+POS.NODES],1
			cmp  byte[SearchThreadState],THREAD_STATE_SEARCH
			jne  .Return

		; calculate check extension to depth
		      movzx  ecx,byte[rbx+STATE.XSIDE]
		      movzx  edx,byte[rbx+STATE.SIDE]
			and  ecx,64
			and  edx,64
			bsf  rdx,qword[rbx+rdx+8*KING]
		       call  AttackersTo_Boole
		      movsx  edi,byte[rbx+STATE.DEPTH]
			mov  qword[rbx+STATE.CHECKERS],rax
			neg  rax
			adc  edi,0

			mov  eax,dword[rbx+STATE.ALPHA]
			mov  edx,dword[rbx+STATE.BETA]
			mov  byte[rbx+STATE.DEPTH],dil

		; mate distance pruning
			mov  ecx,-MATE_SCORE
			cmp  eax,ecx
		      cmovl  eax,ecx
			neg  ecx
			cmp  edx,ecx
		      cmovg  edx,ecx
			cmp  eax,edx
			jge  .Return

		; get move and score from hash
		       call  HashGet
			mov  word[rbx+STATE.HASH_MOVE],dx

		; internal iterative deepening
			cmp  edi,4
			 jb  .HashDone
		       test  edx,edx
			 jz  .InternalIterativeDeepening
	.HashDone:

		; sort list of legal moves
		      movzx  edx,word[rbx+STATE.HASH_MOVE]
			mov  rdi,qword[rbx+STATE.MOVE_PTR]
			cmp  word[rdi+0],dx
			jne  .SortNextMove
			mov  word[rdi+2],0x7FFF   ; make hash move highest score
			jmp  .SortNextMove
	 .ForLoop:	cmp  rdi,qword[rbx+STATE.MOVE_END]
			jae  .SortDone
			mov  rsi,rdi
	  .WhileLoop:	mov  eax,dword[rsi-4]
			mov  ecx,dword[rsi-0]
			cmp  eax,ecx
			 jg  .SortNextMove
			mov  dword[rsi-4],ecx
			mov  dword[rsi-0],eax
			sub  rsi,4
			cmp  rsi,qword[rbx+STATE.MOVE_PTR]
			 ja  .WhileLoop
       .SortNextMove:	add  rdi,4
			cmp  word[rdi+0],dx
			jne  .ForLoop
			mov  word[rdi+2],0x7FFF   ; make hash move highest score
			jmp  .ForLoop
	  .SortDone:

		; negative infinite score before entering move loop
			mov  dword[rbx+STATE.BEST],-INF_SCORE

			mov  rsi,qword[rbx+STATE.MOVE_PTR]

    .MovesLoop:
		; do we have any more pseudo legal moves?
			cmp  rsi,qword[rbx+STATE.MOVE_END]
			jae  .MovesDone
		      movzx  ecx,word[rsi]
			add  rsi,4
			mov  word[rbx+STATE.CUR_MOVE],cx

		; make current legal move in ecx
		       call  MakePseudoLegalMove

		; if best > -INF, try null window first
		      movzx  edi,byte[rbx+STATE.DEPTH]
			sub  edi,1
			mov  byte[rbx+sizeof.STATE+STATE.FLAGS],0
			cmp  dword[rbx+STATE.BEST],-INF_SCORE
			 je  .FullSearch

			mov  ecx,dword[rbx+STATE.ALPHA]
			neg  ecx
			mov  dword[rbx+sizeof.STATE+STATE.BETA],ecx
			sub  ecx,1
			mov  dword[rbx+sizeof.STATE+STATE.ALPHA],ecx
			mov  byte[rbx+sizeof.STATE+STATE.DEPTH],dil
		       call  Search_CUT
			neg  eax

		; if alpha < eax < beta
			cmp  eax,dword[rbx+STATE.ALPHA]
			jle  .UndoMove
			cmp  eax,dword[rbx+STATE.BETA]
			jge  .UndoMove

	.FullSearch:
		; call negamax (eax = score)
			mov  r8d,dword[rbx+STATE.ALPHA]
			mov  ecx,dword[rbx+STATE.BETA]
			neg  r8d
			neg  ecx
			mov  dword[rbx+sizeof.STATE+STATE.ALPHA],ecx
			mov  dword[rbx+sizeof.STATE+STATE.BETA],r8d
			mov  byte[rbx+sizeof.STATE+STATE.DEPTH],dil
		       call  Search_PV
			neg  eax
	.UndoMove:
		; undo move
			mov  qword[rbp+POS.CURR_STATE_PTR],rbx

		; store score in move list
			mov  word[rsi-2],ax

		; if score >= beta, undo move and return score
		      movzx  edx,word[rbx+STATE.CUR_MOVE]
			cmp  eax,dword[rbx+STATE.BETA]
			jge  .BetaCutoff

		; if score > best, update PV
			cmp  eax,dword[rbx+STATE.BEST]
			jle  .MovesLoop

	.UpdatePV:
		; save score in alpha
			mov  dword[rbx+STATE.BEST],eax
			cmp  eax,dword[rbx+STATE.ALPHA]
			jle  .MovesLoop
			mov  dword[rbx+STATE.ALPHA],eax
		; save move in PV
		      movzx  eax,word[rbx+STATE.CUR_MOVE]
		       call  CopyPV
			jmp  .MovesLoop


	.MovesDone:
		; if all moves have been tested and at least one is legal
			cmp  dword[rbx+STATE.BEST],-INF_SCORE
			 je  .IsMate

		; store in transposition table
			mov  ecx,FLAG_EXACT
			mov  eax,FLAG_UPPER
		      movzx  edx,word[rbx+STATE.PV_MOVES+2*0]
		       test  edx,edx
		      cmovz  ecx,eax
			mov  eax,dword[rbx+STATE.BEST]
		       call  HashStore

		; return best
			mov  eax,dword[rbx+STATE.BEST]

	.Return:
			pop  rsi rdi rbx
			ret


		      align  8
    .BetaCutoff:  ; edx = move
		  ; eax = score

			mov  edi,eax

		; store in transposition table
			mov  ecx,FLAG_LOWER
		       call  HashStore

		; return score
			mov  eax,edi

			pop  rsi rdi rbx
			ret


		      align  8
    .UndoIllegalMove:
		; undo illegal move
			mov  qword[rbp+POS.CURR_STATE_PTR],rbx
			jmp  .MovesLoop


		      align  8
    .IsMate:
		; mate with check is loss    (score -MATE_SCORE + STATE.PLY)
		; mate without check is draw (score 0)
			mov  rax,qword[rbx+STATE.CHECKERS]
		      movzx  ecx,byte[rbx+STATE.PLY]
			sub  ecx,MATE_SCORE
			neg  rax
			sbb  eax,eax
			and  eax,ecx
			mov  dword[rbx+STATE.BEST],eax
			pop  rsi rdi rbx
			ret


		      align  8
    .ReturnEval:
		; return the result of static evaluation
		       call  EvaluatePosition
		       ; mov  dword[rbx+STATE.EVAL],eax
			pop  rsi rdi rbx
			ret

    .InternalIterativeDeepening:
			sub  rsp,16
		    _movaps  xmm0,dqword[rbx+STATE.ALPHA]
		    _movaps  dqword[rsp],xmm0
			lea  eax,[rdi-2]
			mov  byte[rbx+STATE.DEPTH],al
		       ; mov  byte[rbx+STATE.FLAGS],0   should be already be 0
		       call  Search_PV
		    _movaps  xmm0,dqword[rsp]
		    _movaps  dqword[rbx+STATE.ALPHA],xmm0
			add  rsp,16
			xor  eax,eax
		      movzx  edx,word[rbx+STATE.PV_MOVES]
			mov  qword[rbx+STATE.PV_LENGTH],rax
			mov  word[rbx+STATE.HASH_MOVE],dx
			jmp  .HashDone






irps ntype, PV CUT ALL {

		      align  16

Search_#ntype:

match =PV, ntype \{    nodetype = NODE_TYPE_PV	 \}
match =CUT,ntype \{    nodetype = NODE_TYPE_CUT  \}
match =ALL,ntype \{    nodetype = NODE_TYPE_ALL  \}

		; in: rbp address of position (POS)
		;       move list of current STATE must already be filled in

		       push  rbx rdi rsi

		; get the address of the current state
			mov  rbx,[rbp+POS.CURR_STATE_PTR]

		; maintance
			xor  eax,eax
			add  qword[rbp+POS.NODES],1
			cmp  byte[SearchThreadState],THREAD_STATE_SEARCH
			jne  .Return

		; calculate check extension to depth
		      movzx  ecx,byte[rbx+STATE.XSIDE]
		      movzx  edx,byte[rbx+STATE.SIDE]
			and  ecx,64
			and  edx,64
			bsf  rdx,qword[rbx+rdx+8*KING]
		       call  AttackersTo_Boole
		      movsx  edi,byte[rbx+STATE.DEPTH]
			mov  qword[rbx+STATE.CHECKERS],rax
			neg  rax
			adc  edi,0
			mov  byte[rbx+STATE.DEPTH],dil

		; set pv length and check for draws
		      movzx  esi,byte[rbx+STATE.PLY]
			xor  eax,eax
		       test  esi,esi
			 jz  .DrawCheckDone
			mov  qword[rbx+STATE.PV_LENGTH],rax
		       call  NotRepeated
		       test  eax,eax
			 jz  .Return
	.DrawCheckDone:

		; run qsearch on non positive depths
			mov  eax,dword[rbx+STATE.ALPHA]
			mov  edx,dword[rbx+STATE.BETA]
			cmp  edi,0
			jle  Search_Quiet.EnterFromNegaMax

		; mate distance pruning
			lea  ecx,[rsi-MATE_SCORE]
			cmp  eax,ecx
		      cmovl  eax,ecx
			neg  ecx
			cmp  edx,ecx
		      cmovg  edx,ecx
			cmp  eax,edx
			jge  .Return

		; get move and score from hash
		       call  HashGet
			mov  word[rbx+STATE.HASH_MOVE],dx
			cmp  eax,NO_SCORE
			jne  .Return
		; set full_eval to no_score
			mov  dword[rbx+STATE.FULL_EVAL],eax

		; if ply is too deep return static eval
			mov  rcx,qword[rbx+STATE.CHECKERS]
			mov  eax,dword[rbx+STATE.WMSCORE]
			mov  edx,dword[rbx+STATE.BETA]
			cmp  esi,MAX_PLY-1
			jae  .ReturnEval

		; if in check or lone king, go right to moves
		       test  rcx,rcx
			jnz  .MovesInit
		       test  ax,ax
			 jz  .MovesInit
			shr  eax,16
			 jz  .MovesInit
		       test  byte[rbx+STATE.FLAGS],NODE_FLAG_WASNULL
			jnz  .IID
			cmp  edx,MAX_EVAL
			jge  .PruningDone
		      movzx  edx,byte[rbx+STATE.SIDE]
			and  edx,2
			cmp  word[rbx+rdx+STATE.WMSCORE],KNIGHT_MSCORE
			jbe  .PruningDone

; eval pruning
if nodetype <> NODE_TYPE_PV
			cmp  edi,3
			 ja  .EvalPruningDone
		       call  EvaluatePosition
			mov  dword[rbx+STATE.FAST_EVAL],eax
		       imul  ecx,edi,40
			sub  eax,ecx
			cmp  eax,dword[rbx+STATE.BETA]
			jge  .Return
	.EvalPruningDone:
end if

; quiescence null move pruning
if nodetype <> NODE_TYPE_PV
			cmp  edi,NULL_MOVE_DEPTH
			 ja  .QNullPruningDone
		       call  MakeNullMove
			mov  ecx,dword[rbx+STATE.BETA]
			neg  ecx
			mov  dword[rbx+sizeof.STATE+STATE.ALPHA],ecx
			add  ecx,1
			mov  dword[rbx+sizeof.STATE+STATE.BETA],ecx
		       call  Search_Quiet
			neg  eax
			mov  qword[rbp+POS.CURR_STATE_PTR],rbx
			cmp  eax,dword[rbx+STATE.BETA]
			jge  .Return
	.QNullPruningDone:
end if


; null move
if nodetype <> NODE_TYPE_PV
		      movzx  edx,byte[rbx+STATE.SIDE]
			and  edx,64
			add  rdx,rbx
			mov  rcx,qword[rdx+8*PAWN]
			cmp  edi,NULL_MOVE_DEPTH
			jbe  .NullDone
			 or  rcx,qword[rdx+8*KING]
			cmp  rcx,qword[rdx+8*0]
			 je  .NullDone
		       call  EvaluatePosition
			mov  dword[rbx+STATE.FULL_EVAL],eax
			cmp  eax,dword[rbx+STATE.BETA]
			 jl  .NullDone
		       call  MakeNullMove
			mov  ecx,dword[rbx+STATE.BETA]
			neg  ecx
			sub  edi,3
			mov  dword[rbx+sizeof.STATE+STATE.ALPHA],ecx
			add  ecx,1
			mov  dword[rbx+sizeof.STATE+STATE.BETA],ecx
			mov  byte[rbx+sizeof.STATE+STATE.DEPTH],dil
			mov  byte[rbx+sizeof.STATE+STATE.FLAGS],NODE_FLAG_WASNULL
match =PV, ntype \{    call  Search_PV	 \}
match =CUT,ntype \{    call  Search_ALL  \}
match =ALL,ntype \{    call  Search_CUT  \}
			neg  eax
			mov  qword[rbp+POS.CURR_STATE_PTR],rbx
			xor  edx,edx
			cmp  eax,dword[rbx+STATE.BETA]
			jge  .BetaCutoff

	.NullDone:

end if


.PruningDone:


; razoring
if nodetype <> NODE_TYPE_PV
			mov  rax,BITBOARD_RANK2
			mov  rcx,BITBOARD_RANK7
		      movzx  edx,byte[rbx+STATE.SIDE]
			and  edx,64
		      cmovz  rax,rcx
			mov  eax,dword[rbx+STATE.FULL_EVAL]
			cmp  edi,3
			 ja  .RazoringDone
		       test  rcx,qword[rbx+rdx+8*PAWN]
			jnz  .RazoringDone
		       imul  ecx,edi,15
			cmp  word[rbx+STATE.HASH_MOVE],0
			jne  .RazoringDone
			mov  esi,dword[rbx+STATE.BETA]
			sub  esi,300-15
			sub  esi,ecx
			cmp  eax,NO_SCORE
			jne  @f
		       call  EvaluatePosition
			mov  dword[rbx+STATE.FULL_EVAL],eax
		  @@:	cmp  eax,esi
			jge  .RazoringDone
			sub  rsp,16
		    _movaps  xmm0,dqword[rbx+STATE.ALPHA]
		    _movaps  dqword[rsp],xmm0
		       call  Search_Quiet
		    _movaps  xmm0,dqword[rsp]
		    _movaps  dqword[rbx+STATE.ALPHA],xmm0
			add  rsp,16
			cmp  eax,esi
			 jl  .Return
	.RazoringDone:
end if






.IID:

; internal iterative deepening
if nodetype <> NODE_TYPE_ALL
		      movzx  edx,word[rbx+STATE.HASH_MOVE]
match =PV, ntype \{	cmp  edi,4	\}
match =CUT,ntype \{	cmp  edi,6	\}
			 jb  .IIDDone
		       test  edx,edx
			 jz  .InternalIterativeDeepening
	.IIDDone:
end if




.MovesInit:
		; negative infinite score before entering move loop
			mov  dword[rbx+STATE.BEST],-INF_SCORE

		; initiate pseodu legal moves for position
		       call  MovePick_Initialize


    .MovesLoop:
		; do we have any more pseudo legal moves?
		       call  qword[rbx+STATE.MOVE_PHASE]
			mov  ecx,eax
			mov  word[rbx+STATE.CUR_MOVE],ax
		       test  eax,eax
			 jz  .MovesDone

		; make current pseudo legal move in ecx
		       call  MakePseudoLegalMove

		; was the pseudo legal move legal?
		      movzx  ecx,byte[rbx+STATE.SIDE+1*sizeof.STATE]
		      movzx  edx,byte[rbx+STATE.XSIDE+1*sizeof.STATE]
			and  ecx,64
			and  edx,64
			bsf  rdx,qword[rbx+rdx+8*KING+1*sizeof.STATE]
		       call  AttackersTo_Boole
		       test  rax,rax
			jnz  .UndoIllegalMove


		; if best > -INF, try null window first
		      movzx  edi,byte[rbx+STATE.DEPTH]
			sub  edi,1
			mov  byte[rbx+sizeof.STATE+STATE.FLAGS],0
			cmp  dword[rbx+STATE.BEST],-INF_SCORE
			 je  .FullSearch

			mov  ecx,dword[rbx+STATE.ALPHA]
			neg  ecx
			mov  dword[rbx+sizeof.STATE+STATE.BETA],ecx
			sub  ecx,1
			mov  dword[rbx+sizeof.STATE+STATE.ALPHA],ecx
			mov  byte[rbx+sizeof.STATE+STATE.DEPTH],dil
		       call  Search_CUT
			neg  eax

		; if alpha < eax < beta
			mov  r8d,dword[rbx+STATE.ALPHA]
			mov  ecx,dword[rbx+STATE.BETA]
			add  esi,1				 ;mov  esi,NODE_TYPE_PV
			cmp  eax,r8d
			jle  .UndoMove
			cmp  eax,ecx
			jge  .UndoMove
			neg  r8d
			neg  ecx
			mov  dword[rbx+sizeof.STATE+STATE.ALPHA],ecx
			mov  dword[rbx+sizeof.STATE+STATE.BETA],r8d
			mov  byte[rbx+sizeof.STATE+STATE.DEPTH],dil
		       call  Search_PV
			neg  eax
			jmp  .UndoMove
	.FullSearch:
		; call negamax (eax = score)
			mov  r8d,dword[rbx+STATE.ALPHA]
			mov  ecx,dword[rbx+STATE.BETA]
			neg  r8d
			neg  ecx
			mov  dword[rbx+sizeof.STATE+STATE.ALPHA],ecx
			mov  dword[rbx+sizeof.STATE+STATE.BETA],r8d
			mov  byte[rbx+sizeof.STATE+STATE.DEPTH],dil
match =PV ,ntype    \{ call  Search_PV	 \}
match =CUT,ntype    \{ call  Search_ALL  \}
match =ALL,ntype    \{ call  Search_CUT  \}
			neg  eax
	.UndoMove:
		; undo move
			mov  qword[rbp+POS.CURR_STATE_PTR],rbx

		; if score >= beta, undo move and return score
		      movzx  edx,word[rbx+STATE.CUR_MOVE]
			cmp  eax,dword[rbx+STATE.BETA]
			jge  .BetaCutoff

		; if score > best, update PV
			cmp  eax,dword[rbx+STATE.BEST]
			jle  .MovesLoop

	.UpdatePV:
		; save score in alpha
			mov  dword[rbx+STATE.BEST],eax
			cmp  eax,dword[rbx+STATE.ALPHA]
			jle  .MovesLoop
			mov  dword[rbx+STATE.ALPHA],eax
		; save move in PV
match =PV ,ntype \{   movzx  eax,word[rbx+STATE.CUR_MOVE]
		       call  CopyPV			      \}
			jmp  .MovesLoop


	.MovesDone:
		; if all moves have been tested and at least one is legal
			cmp  dword[rbx+STATE.BEST],-INF_SCORE
			 je  .IsMate

		; store in transposition table
			mov  ecx,FLAG_EXACT
			mov  eax,FLAG_UPPER
		      movzx  edx,word[rbx+STATE.PV_MOVES+2*0]
		       test  edx,edx
		      cmovz  ecx,eax
			mov  eax,dword[rbx+STATE.BEST]
		       call  HashStore

		; return best
			mov  eax,dword[rbx+STATE.BEST]

	.Return:
			pop  rsi rdi rbx
			ret


		      align  8
    .BetaCutoff:  ; edx = move
		  ; eax = score

			mov  edi,eax

		; store in transposition table
			mov  ecx,FLAG_LOWER
		       call  HashStore

		; return score
			mov  eax,edi

			pop  rsi rdi rbx
			ret


		      align  8
    .UndoIllegalMove:
		; undo illegal move
			mov  qword[rbp+POS.CURR_STATE_PTR],rbx
			jmp  .MovesLoop


		      align  8
    .IsMate:
		; mate with check is loss    (score -MATE_SCORE + STATE.PLY)
		; mate without check is draw (score 0)
			mov  rax,qword[rbx+STATE.CHECKERS]
		      movzx  ecx,byte[rbx+STATE.PLY]
			sub  ecx,MATE_SCORE
			neg  rax
			sbb  eax,eax
			and  eax,ecx
			mov  dword[rbx+STATE.BEST],eax
			pop  rsi rdi rbx
			ret


		      align  8
    .ReturnEval:
		; return the result of static evaluation
		       call  EvaluatePosition
		       ; mov  dword[rbx+STATE.EVAL],eax
			pop  rsi rdi rbx
			ret

if nodetype <> NODE_TYPE_ALL
    .InternalIterativeDeepening:
			sub  rsp,16
		    _movaps  xmm0,dqword[rbx+STATE.ALPHA]
		    _movaps  dqword[rsp],xmm0
match =PV, ntype \{	lea  eax,[rdi-2]    \}
match =CUT,ntype \{	lea  eax,[rdi-4]    \}
			mov  byte[rbx+STATE.DEPTH],al
		       call  Search_PV
		    _movaps  xmm0,dqword[rsp]
		    _movaps  dqword[rbx+STATE.ALPHA],xmm0
			add  rsp,16
			xor  eax,eax
		      movzx  edx,word[rbx+STATE.PV_MOVES]
			mov  qword[rbx+STATE.PV_LENGTH],rax
			mov  word[rbx+STATE.HASH_MOVE],dx
			jmp  .IIDDone
end if


}




		      align  16
NotRepeated:   ; in: rbx address of state
	       ; out: eax = 0 if position is repeated
	       ;      eax = -1 if position is new
			mov  rax,qword[rbx+STATE.HASHKEY]
		      movzx  ecx,byte[rbx+STATE.REPEAT]
			shr  ecx,1
			 jz  .ReturnTrue
    irps i, 1 2 3 4 5 6 7 8 {
			cmp  rax,qword[rbx+STATE.HASHKEY-2*i*sizeof.STATE]
			 je  .ReturnFalse
			cmp  ecx,i
			 je  .ReturnTrue	       }
			cmp  rax,qword[rbx+STATE.HASHKEY-2*9*sizeof.STATE]
			 je  .ReturnFalse
	.ReturnTrue:	 or  eax,-1
			ret
	.ReturnFalse:	xor  eax,eax
			ret







		      align  16

Search_Quiet:	; in: rbp address of position (POS)
		;       move list of current STATE must already be filled in

		       push  rbx rdi rsi

		; get the address of the current state
			mov  rbx,[rbp+POS.CURR_STATE_PTR]

    .EnterFromNegaMax:

			mov  byte[rbx+STATE.DEPTH],1

		; maintance
			add  qword[rbp+POS.NODES],1

		; clear pv
			mov  dword[rbx+STATE.PV_LENGTH],0

		;if repetition
		       call  NotRepeated
		       test  eax,eax
			 jz  .Return

		; get static eval
		       call  EvaluatePosition
			mov  dword[rbx+STATE.BEST],eax

		; if ply is too deep return static eval
		      movzx  ecx,byte[rbx+STATE.PLY]
			cmp  ecx,MAX_PLY-1
			jae  .Return

;jmp  .Return

		; eval >= beta, return eval
			cmp  eax,dword[rbx+STATE.BETA]
			jge  .Return

		; alpha = max(alpha, eval)
			cmp  eax,dword[rbx+STATE.ALPHA]
			jle  @f
			mov  dword[rbx+STATE.ALPHA],eax
		   @@:

		; initiate pseodu legal moves for position

		       call  LoudPick_Initialize

    .MovesLoop:
		; do we have any more pseudo legal moves?

		       call  LoudPick_Next
			mov  ecx,eax
			mov  word[rbx+STATE.CUR_MOVE],ax
		       test  eax,eax
			 jz  .MovesDone

		; make current pseudo legal move in [rsi]
		       call  MakePseudoLegalMove

		; was the pseudo legal move legal?
		      movzx  ecx,byte[rbx+STATE.SIDE+1*sizeof.STATE]
		      movzx  edx,byte[rbx+STATE.XSIDE+1*sizeof.STATE]
			and  ecx,64
			and  edx,64
			bsf  rdx,qword[rbx+rdx+8*KING+1*sizeof.STATE]
		       call  AttackersTo_Boole
		       test  rax,rax
			jnz  .UndoMove

		; call negamax (eax = score)
			mov  r8d,dword[rbx+STATE.ALPHA]
			mov  ecx,dword[rbx+STATE.BETA]
			neg  r8d
			neg  ecx
			mov  dword[rbx+sizeof.STATE+STATE.ALPHA],ecx
			mov  dword[rbx+sizeof.STATE+STATE.BETA],r8d
		       call  Search_Quiet
			neg  eax

		; undo move
			mov  qword[rbp+POS.CURR_STATE_PTR],rbx

		; if score >= beta, undo move and return score
		      movzx  edx,word[rbx+STATE.CUR_MOVE]
			cmp  eax,dword[rbx+STATE.BETA]
			jge  .BetaCutoff

		; if score > best, update PV
			cmp  eax,dword[rbx+STATE.BEST]
			jle  .MovesLoop

	.UpdatePV:
		; save score in alpha
			mov  dword[rbx+STATE.BEST],eax
			cmp  eax,dword[rbx+STATE.ALPHA]
			jle  .MovesLoop
			mov  dword[rbx+STATE.ALPHA],eax
		; save move in PV
		      movzx  eax,word[rbx+STATE.CUR_MOVE]
		       call  CopyPV
			jmp  .MovesLoop

    .UndoMove:
		; undo move and move to next move
			mov  qword[rbp+POS.CURR_STATE_PTR],rbx
			jmp  .MovesLoop

    .MovesDone:
		; store in transposition table
			mov  ecx,FLAG_EXACT
			mov  eax,FLAG_UPPER
		      movzx  edx,word[rbx+STATE.PV_MOVES+2*0]
		       test  edx,edx
		      cmovz  ecx,eax
			mov  eax,dword[rbx+STATE.BEST]
		       call  HashStore
		; return best
			mov  eax,dword[rbx+STATE.BEST]

    .Return:
			pop  rsi rdi rbx
			ret


		      align  8
    .ReturnEval:
		; return the result of static evaluation
		       call  EvaluatePosition

		      ;  jmp  .Return

			pop  rsi rdi rbx
			ret



		      align  8
    .BetaCutoff:  ; edx = move
		  ; eax = score

			mov  edi,eax

		; store in transposition table
			mov  ecx,FLAG_LOWER
		       call  HashStore

		; return score
			mov  eax,edi

			pop  rsi rdi rbx
			ret
















