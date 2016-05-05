InsertPvInTT:
	; in: ecx index of move in rootMoves
	;     rbp address of position

		       push   rbx rsi rdi r12 r13 r14 r15
			mov   rbx, qword [rbp+Pos.state]

		      movzx   esi, word [rootMoves+RootMoves.moves+rcx*sizeof.RMove+RMove.pvIdx]
		       imul   esi, 2*(MAX_PLY+1)
			lea   rsi, [rootMoves+RootMoves.pvs+rsi]
			mov   r12, rsi
  .InsertPvDoLoop:
		      movzx   ecx, word [rsi]
		       test   ecx, ecx
			 jz   .InsertPvUndoLoop

		       call   GivesCheck
			mov   edx, eax
		      movzx   ecx, word [rsi]
			add   qword [rbp+Pos.nodes], 1
		       call   DoMove_SetFullCi

			add   rsi, 2
			jmp   .InsertPvDoLoop
  .InsertPvUndoLoop:
			sub   rsi, 2
			cmp   rsi, r12
			 jb   .InsertPvDone

		      movzx   ecx, word [rsi]
		       call   UndoMove

			mov   rcx, qword [rbx+State.key]
			mov   r13, rcx
		       call   HashTable_Probe
			mov   rdi, rax
		      movzx   eax, word [rsi+RMove.move]
		       test   edx, edx
			 jz   .SaveMove
			cmp   ax, word [rdi+TTEntry.move]
			 je   .DontSaveMove
    .SaveMove:
			shr   r13, 48
			mov   edx, VALUE_NONE
	     HashTable_Save   rdi, r13w, edx, BOUND_NONE, DEPTH_NONE, eax, VALUE_NONE
    .DontSaveMove:
			jmp   .InsertPvUndoLoop
  .InsertPvDone:

			pop   r15 r14 r13 r12 rdi rsi rbx
			ret