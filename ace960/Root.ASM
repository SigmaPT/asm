;;;;;;;;;;;;;;;;;;;;;;; info ;;;;;;;;;;;;;;;;;;;;;;;;

PrintUciInfo:
	; in: rcx time since start
	; io: rdi info string

		       push   rbx rsi r13 r14 r15

			mov   rbx, rcx
			mov   r15, rcx
			cmp   rcx, 1
			adc   r15, 0	; avoid divide by zero in nps

			xor   r13, r13
.MultiPvLoop:
			cmp   r13d, dword [rootMoves+RootMoves.multiPvIdx]
			 ja   .Continue

			mov   rax, 'info dep'
		      stosq
			mov   eax, 'th '
		      stosd
			sub   rdi, 1
			mov   eax, dword [rootMoves+RootMoves.depth]
		       call   PrintUnsignedInteger

			mov   rax, ' time '
		      stosq
			sub   rdi, 2
			mov   rax, rbx
		       call   PrintUnsignedInteger

			mov   rax, ' score '
		      stosq
			sub   rdi, 1
		      movsx   ecx, word [rootMoves+RootMoves.moves+r13*sizeof.RMove+RMove.score]
		       call   PrintUciScore

			mov   rax, ' nodes '
		      stosq
			sub   rdi, 1
			mov   rax, qword [rbp+Pos.nodes]
		       call   PrintUnsignedInteger

			mov   rax, ' nps '
		      stosq
			sub   rdi, 3
			mov   eax, 1000
			mul   qword [rbp+Pos.nodes]
			div   r15
		       call   PrintUnsignedInteger

			mov   al, ' '
		      stosb
			mov   rax, 'multipv '
		      stosq
			lea   eax, [r13+1]
		       call   PrintUnsignedInteger

			mov   eax, ' pv'
		      stosd
			sub   rdi, 1
		      movzx   esi, word [rootMoves+RootMoves.moves+r13*sizeof.RMove+RMove.pvIdx]
		       imul   esi, 2*(MAX_PLY+1)
			lea   rsi, [rootMoves+RootMoves.pvs+rsi]
		      movzx   ecx, word [rsi]
		@@:	add   rsi, 2
			mov   al,' '
		      stosb
		       call   PrintUciMove
		      movzx   ecx, word [rsi]
		       test   ecx, ecx
			jnz   @b

			mov   al, 10
		      stosb

.Continue:
			add   r13d, 1
			cmp   r13d, dword [rootMoves+RootMoves.multiPv]
			 jb   .MultiPvLoop

			pop   r15 r14 r13 rsi rbx
			ret