


		      align   16

Gen_Legal:
		       push   rsi r12 r13 r14 r15

; r15  = pinned pieces
; r14d = our king square
; r13d = side
; r12 = our king bitboard

		; generate moves
			mov   rax, qword [rbx+State.checkersBB]
			mov   rsi, rdi
			mov   r15, qword [rbx+State.pinned]
			mov   r13d, dword [rbp+Pos.sideToMove]
			mov   r12, qword [rbp+Pos.typeBB+8*King]
			and   r12, qword [rbp+Pos.typeBB+8*r13]
			bsf   r14, r12

		       test   rax, rax
			jnz   .InCheck
	.NotInCheck:   call   Gen_NonEvasions
			jmp   .GenDone
	.InCheck:      call   Gen_Evasions
	.GenDone:
			mov   edx, dword [rsi]
			mov   ecx, edx
			mov   eax, edx
			cmp   rsi, rdi
			 je   .FilterDone
		       test   r15, r15
			jne   .FilterYesPinned
.FilterNoPinned:
			shr   edx, 12	 ; edx = move type
			shr   ecx, 6
			and   ecx, 63	 ; ecx = source square
			add   rsi, 8
			cmp   edx, MOVE_TYPE_EPCAP
			 je   .EpCapture
			cmp   ecx, r14d
			 je   .KingMove
			mov   edx, dword [rsi]
			mov   ecx, edx	 ; move is legal at this point
			mov   eax, edx
			cmp   rsi, rdi
			jne   .FilterNoPinned
.FilterDone:
			pop   r15 r14 r13 r12 rsi
			ret


		      align  8
		; if they have an attacker to king's destination square, then move is illegal
.KingMove:
			and   eax, 63	; eax = destination square
			mov   ecx, r13d
			shl   ecx, 6+3
			mov   rcx, qword [PawnAttacks+rcx+8*rax]

	; pseudo legal castling moves are always legal
			cmp   edx, MOVE_TYPE_CASTLE
			 je   .FilterLegalChoose

			mov   r9, qword [rbp+Pos.typeBB+8*r13]
			xor   r13d, 1
			mov   r10, qword [rbp+Pos.typeBB+8*r13]
			 or   r9, r10
			xor   r13d, 1
	; pawn
			and   rcx, qword [rbp+Pos.typeBB+8*Pawn]
		       test   rcx, r10
			jnz   .FilterIllegalChoose
	; king
			mov   rdx, qword [KingAttacks+8*rax]
			and   rdx, qword [rbp+Pos.typeBB+8*King]
		       test   rdx, r10
			jnz   .FilterIllegalChoose
	; knight
			mov   rdx, qword [KnightAttacks+8*rax]
			and   rdx, qword [rbp+Pos.typeBB+8*Knight]
		       test   rdx, r10
			jnz   .FilterIllegalChoose
	; bishop + queen
	      BishopAttacks   rdx, rax, r9, r8
			mov   r8, qword [rbp+Pos.typeBB+8*Bishop]
			 or   r8, qword [rbp+Pos.typeBB+8*Queen]
			and   r8, r10
		       test   rdx, r8
			jnz   .FilterIllegalChoose
	; rook + queen
		RookAttacks   rdx, rax, r9, r8
			mov   r8, qword [rbp+Pos.typeBB+8*Rook]
			 or   r8, qword [rbp+Pos.typeBB+8*Queen]
			and   r8, r10
		       test   rdx, r8
			jnz   .FilterIllegalChoose


.FilterLegalChoose:
			mov   edx, dword [rsi]
			mov   ecx, edx	 ; move is legal at this point
			mov   eax, edx
			cmp   rsi, rdi
			 je   .FilterDone
		       test   r15, r15
			 jz   .FilterNoPinned
			jmp   .FilterYesPinned
.FilterIllegalChoose:
			sub   rdi, 8
			sub   rsi, 8
			mov   edx, dword [rdi]
			mov   dword [rsi], edx
			mov   ecx, edx	 ; move is legal at this point
			mov   eax, edx
			cmp   rsi, rdi
			 je   .FilterDone
		       test   r15, r15
			 jz   .FilterNoPinned
			jmp   .FilterYesPinned




.FilterYesPinned:
			shr   edx, 12	 ; edx = move type
			shr   ecx, 6
			and   ecx, 63	 ; ecx = source square
			add   rsi, 8
			cmp   edx, MOVE_TYPE_EPCAP
			 je   .EpCapture
			cmp   ecx, r14d
			 je   .KingMove
			and   eax, (64*64)-1
			 bt   r15, rcx
			 jc   .FilterYesPinnedWeArePinned
.FilterYesPinnedLegal:
			mov   edx, dword [rsi]
			mov   ecx, edx	 ; move is legal at this point
			mov   eax, edx
			cmp   rsi, rdi
			jne   .FilterYesPinned
			jmp   .FilterDone
.FilterYesPinnedWeArePinned:
		       test   r12, qword[LineBB+8*rax]
			jnz   .FilterYesPinnedLegal
.FilterYesPinnedIllegal:
			sub   rdi, 8
			sub   rsi, 8
			mov   edx, dword [rdi]
			mov   dword [rsi], edx
			mov   ecx, edx	 ; move is legal at this point
			mov   eax, edx
			cmp   rsi, rdi
			jne   .FilterYesPinned
			jmp   .FilterDone


		      align  8

	; for ep captures, just make the move and test if our king is attacked
.EpCapture:
			xor   r13d, 1
			mov   r10, qword [rbp+Pos.typeBB+8*r13]
			xor   r13d, 1
	; all pieces
			mov   rdx, qword [rbp+Pos.typeBB+8*White]
			 or   rdx, qword [rbp+Pos.typeBB+8*Black]
	; remove source square
			btr   rdx, rcx
	; add destination square (ep square)
			and   eax, 63
			bts   rdx, rax
	; get queens
			mov   r9, qword [rbp+Pos.typeBB+8*Queen]
	; remove captured pawn
			lea   ecx, [2*r13-1]
			lea   ecx, [rax+8*rcx]
			btr   rdx, rcx
	; check for rook attacks
		RookAttacks   rax, r14, rdx, r8
			mov   rcx, qword [rbp+Pos.typeBB+8*Rook]
			 or   rcx, r9
			and   rcx, r10
		       test   rax, rcx
			jnz   .FilterIllegalChoose
	; check for bishop attacks
	      BishopAttacks   rax, r14, rdx, r8
			mov   rcx, qword [rbp+Pos.typeBB+8*Bishop]
			 or   rcx, r9
			and   rcx, r10
		       test   rax, rcx
			jnz   .FilterIllegalChoose
			jmp   .FilterLegalChoose