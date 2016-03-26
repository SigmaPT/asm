


_ZN6Search5thinkEv:

virtual at rsp
  .weakMove    rd 1
	       rd 3
  .pos	       rb sizeof.Pos
  .stateArray  rb sizeof.State*(MAX_PLY+101) ; to allow 50 move rule checking
  .searchStack rb sizeof.Stack*(MAX_PLY+5)   ; To allow referencing (ss-2) and (ss+2)
  .moveList    rb sizeof.EMove*MAX_MOVES
  .lend rb 0
end virtual
.localsize = ((.lend-rsp+15) and (-16)) +8

		       push   rbp rbx rsi rdi r12 r13 r14 r15

			mov   eax, .localsize
		       call   __chkstk_ms
			sub   rsp, rax

		; start timer
			lea   rcx, [timerThread]
			mov   byte [rcx+TimerThread.run], 1
		       call   _ZN10ThreadBase10notify_oneEv

		; copy board from uciLoop thread to main thread
			lea   rbx, [pos]
			lea   rbp, [.pos]
			lea   rcx, [.stateArray]
			lea   rdx, [mainThread]
		       call   PositionCopy

if DEBUG
		       call   VerifyPositionState
		       test   eax, eax
			 jz   .ProblemAtRoot
end if

		; setup root moves
			lea   rdi, [.moveList]
			mov   rsi, rdi
			mov   rbx, qword [rbp+Pos.state]
		       call   Gen_Legal
			xor   eax, eax
		      stosq
			lea   rdi, [rootMoves+RootMoves.moves]
			xor   ecx, ecx
			lea   rdx, [rootMoves+RootMoves.pvs]
		@@:   movzx   eax, word [rsi+EMove.move]
			mov   word [rdi+RMove.move], ax
			mov   word [rdi+RMove.pvIdx], cx
			mov   word [rdi+RMove.score], -VALUE_INFINITE
			mov   word [rdi+RMove.pscore], -VALUE_INFINITE
			mov   word [rdx], MOVE_NONE			; clear the pv for this move
			add   rsi, sizeof.EMove
			add   ecx, 1
			add   rdi, sizeof.RMove
			add   rdx, (MAX_PLY+1)*2
		       test   eax, eax
			jnz   @b

			sub   ecx, 1
			xor   edx, edx
			mov   eax, dword [uciOptions+UciOptions.multiPv]
			cmp   eax, ecx
		      cmova   eax, ecx
			lea   rdi, [rootMoves]
			mov   dword [rdi+RootMoves.depth], r15d
			mov   dword [rdi+RootMoves.multiPv], eax
			mov   dword [rdi+RootMoves.multiPvIdx], edx
			mov   dword [rdi+RootMoves.size], ecx
			mov   dword [rdi+RootMoves.bestMoveChanges], edx
			mov   ecx, dword [uciOptions+UciOptions.weakness]
		       test   ecx, ecx
			 jz   @f
		       call   Weakness_SetMultiPv
		@@:

		; if no root moves, display mate
			mov   ecx, dword [rdi+RootMoves.size]
		       test   ecx, ecx
			 jz   .NoRootMoves

		; clear portion of search stack and set Pos.ssTable
			lea   rdi, [.searchStack]
			lea   r14, [rdi+2*sizeof.Stack]
			mov   ecx, 5*sizeof.Stack/8
			xor   eax, eax
		  rep stosq

		; set up pos struct
			xor   eax, eax
			mov   qword [rbp+Pos.nodes], rax

		; set up hash table
			lea   rax, [hashTable]
			and   byte[rax+TT.date], -4
			add   byte[rax+TT.date], 4
    ;    if SEARCH_DEBUG eq 1
    ;                   call   HashTable_Clear
    ;                    mov   byte [QSearchTesting],0
    ;    end if

		; clear stats
			xor   eax, eax
			lea   rdi, [History]
			mov   ecx, 16*64
		  rep stosd
			lea   rdi, [Followupmoves]
			mov   ecx, 16*64
		  rep stosd
			lea   rdi, [Countermoves]
			mov   ecx, 16*64
		  rep stosd
			lea   rdi, [Gains]
			mov   ecx, 16*64
		  rep stosd

		; iterative deepening
			xor   r15d, r15d
  .IdLoop:
			add   r15d, 1
			mov   dword [rootMoves+RootMoves.depth], r15d
			cmp   r15d, MAX_PLY
			jae   .IdLoopDone
			cmp   r15d, dword[Limits.depth]
			 ja   .IdLoopDone


			xor   r13d, r13d
   .PvLoop:
			mov   dword [rootMoves+RootMoves.multiPvIdx], r13d

			mov   ecx, -VALUE_INFINITE
			mov   eax, dword [Limits.alpha]
			cmp   ecx, eax
		      cmovl   ecx, eax

			mov   edx, +VALUE_INFINITE
			mov   eax, dword [Limits.beta]
			cmp   edx, eax
		      cmovg   edx, eax

			mov   r8d, r15d
			mov   r9, r14
			xor   r10, r10
		       call   Search_Root

		; don't need to sort because best move was already brought to index PVIdx in Search_Root
		; insert pvs back into transposition table
			mov   esi, r13d
		   @@:	mov   ecx, esi
		       call   InsertPvInTT
			sub   esi, 1
			jns   @b

		; sort the root moves
			mov   r8d, 1
			lea   rdi, [rootMoves+RootMoves.moves]
	.SortOuter:
			cmp   r8d, r13d
			 ja   .SortOuterDone
			mov   rax, qword [rdi+sizeof.RMove*r8]
		      movsx   edx, word [rdi+sizeof.RMove*r8+RMove.score]
			mov   r9d, r8d
	.SortInner:
			mov   rcx, qword [rdi+sizeof.RMove*(r9-1)]
			cmp   dx, word [rdi+sizeof.RMove*(r9-1)+RMove.score]
			jle   .SortInnerDone
			mov   qword [rdi+sizeof.RMove*r9], rcx
			sub   r9d, 1
			jge   .SortInnerDone
	.SortInnerDone:
			mov   qword [rdi+sizeof.RMove*r9], rax
			add   r8d, 1
			jmp   .SortOuter
	.SortOuterDone:

			mov   r13d, dword [rootMoves+RootMoves.multiPvIdx]
			add   r13d, 1

		; update the gui
			lea   rdi, [Output]
		       call   _GetTime
			sub   rax, qword [SearchStartTime]
			mov   rcx, rax
			cmp   byte [Signals.stop], 0
			jne   .UpdateStopped
			cmp   r13d, dword [rootMoves+RootMoves.multiPv]
			 je   @f
			cmp   rcx, 3000
			jbe   .UpdateGuiDone
		 @@:   call   PrintUciInfo
		       call   _WriteOut_Output
			jmp   .UpdateGuiDone
    .UpdateStopped:
			mov   rax, 'info tim'
		      stosq
			mov   ax, 'e '
		      stosw
			mov   rax, rcx
		       call   PrintUnsignedInteger
			mov   rax, ' nodes '
		      stosq
			sub   rdi, 1
			mov   rax, qword [rbp+Pos.nodes]
		       call   PrintUnsignedInteger
			mov   al, 10
		      stosb
		       call   _WriteOut_Output
    .UpdateGuiDone:

			cmp   byte [Signals.stop], 0
			jne   .PvLoopDoneStop
			cmp   r13d, dword [rootMoves+RootMoves.multiPv]
			 jb   .PvLoop
 .PvLoopDone:
		; if weakness pick a move now that all pv lines have been searched
			mov   ecx, dword [uciOptions+UciOptions.weakness]
		       test   ecx, ecx
			 jz   @f
		       call   Weakness_PickMove
			mov   dword [.weakMove], eax
			@@:
 .PvLoopDoneStop:


			mov   r15d, dword [rootMoves+RootMoves.depth]
			cmp   byte [Signals.stop], 0
			 je   .IdLoop
.IdLoopDone:



		; stop timer
			lea   rcx, [timerThread]
			mov   byte [rcx+TimerThread.run], 0


		; print best move and ponder move

			mov   edx, dword [uciOptions+UciOptions.weakness]

			lea   rdi, [Output]
			mov   rax, 'bestmove'
		      stosq
			mov   al, ' '
		      stosb
			mov   ecx, dword [.weakMove]
		       test   edx, edx
			jnz   .PrintWeakMove
		      movzx   ecx, word [rootMoves+RootMoves.moves+0*sizeof.RMove+RMove.move]
		       call   PrintUciMove

		      movzx   ecx, word [rootMoves+RootMoves.moves+0*sizeof.RMove+RMove.pvIdx]
		       imul   ecx, 2*(MAX_PLY+1)
		      movzx   ecx, word [rootMoves+RootMoves.pvs+rcx+2*1]
		       test   ecx, ecx
			 jz   .NoPonderMove
			mov   rax, ' ponder '
		      stosq
      .PrintWeakMove:
		       call   PrintUciMove

   .NoPonderMove:


			mov   eax, 10
		      stosb
		       call   _WriteOut_Output


.Return:

			add   rsp, .localsize
			pop   r15 r14 r13 r12 rdi rsi rbx rbp
			ret


.NoRootMoves:
			lea   rdi, [Output]
		     szcall   PrintString, 'info depth 0 score '
			cmp   qword [rbx+State.checkersBB], 1
			sbb   ecx, ecx
			and   ecx, VALUE_DRAW+VALUE_MATE
			sub   ecx, VALUE_MATE
		       call   PrintUciScore
			mov   al, 10
		      stosb
		       call   _WriteOut_Output
			jmp   .IdLoopDone






.TestQSearch:

			mov   ecx, -VALUE_INFINITE
			mov   eax, dword [Limits.alpha]
			cmp   ecx, eax
		      cmovl   ecx, eax

			mov   edx, +VALUE_INFINITE
			mov   eax, dword [Limits.beta]
			cmp   edx, eax
		      cmovg   edx, eax

			xor   r8d,r8d
			mov   r9, r14

			lea   rax,[QSearch_Pv_NoCheck]
			lea   r10,[QSearch_Pv_InCheck]
			cmp   qword [rbx+State.checkersBB], 0
		     cmovne   rax, r10
		       call   rax
			neg   eax

			lea   rdi, [Output]
		     movsxd   rax, eax
		       call   PrintSignedInteger
			mov   rax, '  nodes '
		      stosq
		       mov   rax, qword[rbp+Pos.nodes]
		       call   PrintUnsignedInteger
			mov   al, 10
		      stosb
		       call   _WriteOut_Output

			jmp   .IdLoopDone





if DEBUG
.ProblemAtRoot:
			lea   rdi, [Output]
		     szcall   PrintString, 'problem at root'
			mov   al, 10
		      stosb
		       call   _WriteOut_Output
			jmp   .IdLoopDone
end if















