PieceCoverage:
	; in: rbp address of Pos
	;     ecx side
	; out: rax bitboard of side's coverage

		       push   rdi rsi r14 r15

; r15 = bitboard of all pieces
; rdi =  WhitePawnAttacks or BlackPawnAttacks

			mov   r14, qword [rbp+8*rcx]
			xor   ecx, 1
			mov   r15, qword [rbp+8*rcx]
			xor   ecx, 1

			mov   rax, qword [rbp+Pos.typeBB+8*King]
			and   rax, r14
			bsf   rax, rax
			mov   rax, qword[KingAttacks+8*rax]

			shl   ecx, 6+3
			lea   rdi, [PawnAttacks+rcx]
			 or   r15, r14

			mov   rdx, qword [rbp+Pos.typeBB+8*Knight]
			and   rdx, r14
			 jz   .KnightDone
	.Knight:	bsf   rsi, rdx
			 or   rax, qword [KnightAttacks+8*rsi]
		       blsr   rdx, rdx, r8
			jnz   .Knight
	.KnightDone:

			mov   rdx, qword [rbp+Pos.typeBB+8*Pawn]
			and   rdx, r14
			 jz   .PawnDone
	.Pawn:		bsf   rsi, rdx
			 or   rax, qword [rdi+8*rsi]
		       blsr   rdx, rdx, r8
			jnz   .Pawn
	.PawnDone:

			mov   rdx, qword [rbp+Pos.typeBB+8*Bishop]
			 or   rdx, qword [rbp+Pos.typeBB+8*Queen]
			and   rdx, r14
			 jz   .BishopDone
	.Bishop:	bsf   rsi, rdx
	      BishopAttacks   rdi, rsi, r15, r8
			 or   rax, rdi
		       blsr   rdx, rdx, r8
			jnz   .Bishop
	.BishopDone:

			mov   rdx, qword [rbp+Pos.typeBB+8*Rook]
			 or   rdx, qword [rbp+Pos.typeBB+8*Queen]
			and   rdx, r14
			 jz   .RookDone
	.Rook:		bsf   rsi, rdx
		RookAttacks   rdi, rsi, r15, r8
			 or   rax, rdi
		       blsr   rdx, rdx, r8
			jnz   .Rook
	.RookDone:

			pop   r15 r14 rsi rdi
			ret
