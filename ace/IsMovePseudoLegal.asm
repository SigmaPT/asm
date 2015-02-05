;;;;;;;;;;;;;;;;;;;;;;
;  IsMovePseudoLegal ;
;;;;;;;;;;;;;;;;;;;;;;


		      align   16

IsMovePseudoLegal:
		; in: rbp address of Pos
		;     rbx address of State
		;     ecx move
		; out: rax = 0 if move is not pseudo legal
		;      rax !=0 if move is pseudo legal

		       push   rsi rdi r12 r13 r14 r15

		      movzx   eax, byte[rbp+Pos.sideToMove]
			mov   esi, eax
			xor   eax, 1

		; r8d = from
		; r9d = to
			mov   r8d, ecx
			shr   r8d, 6
			and   r8d, 63
			mov   r9d, ecx
			and   r9d, 63

		; r11 = FROM PIECE
		      movzx   r11d, byte[rbp+Pos.board+r8]

		; r14 = bitboard of our pieces
		; r15 = bitboard of all pieces
			mov   r14, qword [rbp+Pos.typeBB+8*rsi]
			mov   r15, qword [rbp+Pos.typeBB+8*rax]
			 or   r15, r14

		; r13 = checkers
		; r12 = -(checkers != 0)
			mov   r12, qword [rbx+State.checkersBB]
			mov   r13, r12
			neg   r12
			sbb   r12, r12

		; ecx = MOVE_TYPE
		; rdi = bitboard of to square r9d
		; r10 = -(MOVE_TYPE=0) & rdx
		; eax = move
			mov   eax, ecx
			shr   ecx, 12
			cmp   ecx, 1
			sbb   r10, r10
			xor   edi, edi
			bts   rdi, r9
			and   r10, rdi

		; make sure that our piece is on from square
			 bt   r14, r8
			jnc   .ReturnFalse

		; make sure that we don't capture our own piece
			 bt   r14, r9
			 jc   .ReturnFalse

			and   r11d, 7
			jmp   qword [.JmpTable+8*r11]
.JmpTable:
		dq IsMovePseudoLegal.NoPiece
		dq IsMovePseudoLegal.NoPiece
		dq IsMovePseudoLegal.Pawn
		dq IsMovePseudoLegal.Knight
		dq IsMovePseudoLegal.Bishop
		dq IsMovePseudoLegal.Rook
		dq IsMovePseudoLegal.Queen
		dq IsMovePseudoLegal.King


		      align   8
    .NoPiece:
    .ReturnFalse:
			xor   eax,eax
			pop   r15 r14 r13 r12 rdi rsi
			ret



		      align   8
.Knight:
			mov   rax, qword [KnightAttacks+8*r8]
			and   rax, r10
		       test   rax, r12
			jnz   .Checkers
			pop   r15 r14 r13 r12 rdi rsi
			ret

		      align   8
.Bishop:
	      BishopAttacks   rax, r8, r15, r11
			and   rax, r10
		       test   rax, r12
			jnz   .Checkers
			pop   r15 r14 r13 r12 rdi rsi
			ret

		      align   8
.Rook:
		RookAttacks   rax, r8, r15, r11
			and   rax, r10
		       test   rax, r12
			jnz   .Checkers
			pop   r15 r14 r13 r12 rdi rsi
			ret

		      align   8
.Queen:
		RookAttacks   rax, r8, r15, r11
	      BishopAttacks   r9, r8, r15, r11
			 or   rax, r9
			and   rax, r10
		       test   rax, r12
			jnz   .Checkers
			pop   r15 r14 r13 r12 rdi rsi
			ret

		      align   8
.Checkers:
		; if moving P|K|R|B|Q and in check, filter some moves out
			mov   rcx, qword [rbp+Pos.typeBB+8*King]
			bsf   rax, r13
			shl   eax, 6+3
			and   rcx, r14
			bsf   rcx, rcx
			mov   rax, qword[BetweenBB+rax+8*rcx]
			 or   rax, r13

		; if more than one checker, must move king
			lea   rcx, [r13 -1]
		       test   rcx, r13
			jnz   .ReturnFalse

		; move must be a blocking evasion or a capture of the checking piece
			and   rax, rdi

			pop   r15 r14 r13 r12 rdi rsi
			ret

		      align  8
.Pawn:
			mov   r11d, esi
			shl   r11d, 6+3

			mov   rdx, 0x00FFFFFFFFFFFF00
		     ; _andn   rdx, r15, rdx
			xor   eax,eax

			cmp   ecx, MOVE_TYPE_DPAWN
			 je   .DoublePawn
			cmp   ecx, MOVE_TYPE_EPCAP
			 je   .EpCapture
			cmp   ecx, MOVE_TYPE_PROM+4
			jae   .ReturnFalse
			cmp   ecx, MOVE_TYPE_CASTLE
			 je   .ReturnFalse
			cmp   ecx, MOVE_TYPE_PROM
			jae   .Promotion

			xor   esi, 1
			lea   ecx, [2*rsi-1]
			lea   ecx, [r8+8*rcx]
			bts   rax, rcx
		       andn   rax, r15, rax
			mov   rcx, [rbp+Pos.typeBB+8*rsi]
			and   rcx, qword [PawnAttacks+r11+8*r8]
			 or   rax, rcx
			and   rax, rdx

			and   rax, r10
		       test   rax, r12
			jnz   .Checkers

			pop   r15 r14 r13 r12 rdi rsi
			ret

		      align   8
 .Promotion:
			lea   ecx, [rsi-1]
			xor   esi, 1
			and   ecx, 56
			mov   edx, 0x0FF
			shl   rdx, cl

			xor   eax,eax

			lea   ecx, [2*rsi-1]
			lea   ecx, [r8+8*rcx]
			bts   rax, rcx
		       andn   rax, r15, rax
			mov   rcx, [rbp+Pos.typeBB+8*rsi]
			and   rcx, qword [PawnAttacks+r11+8*r8]
			 or   rax, rcx
			and   rax, rdx

			and   rax, rdi
		       test   rax, r12
			jnz   .Checkers

			pop   r15 r14 r13 r12 rdi rsi
			ret


		      align   8
 .DoublePawn:
		; made sure that to is two ranks from from
			mov   eax, r8d
			xor   eax, r9d
			cmp   eax, 16
			jne   .ReturnFalse
		; make sure that two squares are clear
			lea   eax, [r8+r9]
			shr   eax, 1
			mov   rdx, rdi
			bts   rdx, rax
		       test   rdx, r15
			jnz   .ReturnFalse
		; make sure that from is on home
			mov   eax, r8d
			shr   eax, 3
			lea   ecx, [1+5*rsi]
			cmp   eax, ecx
			jne   .ReturnFalse
			 or   eax, -1
		       test   r12, r12
			jnz   .Checkers
			pop   r15 r14 r13 r12 rdi rsi
			ret

		      align   8
 .EpCapture:
			lea   ecx, [2*rsi-1]
			lea   ecx, [r9+8*rcx]
			mov   rax, qword [PawnAttacks+r11+8*r8]
			btr   r13, rcx
			cmp   r13, 1
			sbb   rdx, rdx
		; make sure to == epsquare
			cmp   r9l, byte [rbx+State.epSquare]
			jne   .ReturnFalse

		; make sure pawnattacks[from] include to
		;  and there are no checkers or the ep captured pawn is the checker
			and   rax, rdi
			and   rax, rdx

			pop   r15 r14 r13 r12 rdi rsi
			ret




		      align  8
.King:
			mov   r11d, esi
			shl   r11d, 6+3
			mov   rdx, qword [rbx+State.checkersBB]
			cmp   ecx, MOVE_TYPE_CASTLE
			 je   .Castle
			mov   rax, qword [KingAttacks+8*r8]
			and   rax, r10
		       test   rax, r12
			jnz   .KingCheckers
			pop   r15 r14 r13 r12 rdi rsi
			ret

		      align   8
 .KingCheckers:
		; r14 = their pieces
		; r15 = pieces ^ our king
		       andn   r14, r14, r15
			btr   r15, r8

			mov   rax, qword [KingAttacks+8*r9]
			and   rax, qword [rbp+Pos.typeBB+8*King]

			mov   rdx, qword [KnightAttacks+8*r9]
			and   rdx, qword [rbp+Pos.typeBB+8*Knight]
			 or   rax, rdx

			mov   rdx, qword [PawnAttacks+r11+8*r9]
			and   rdx, qword [rbp+Pos.typeBB+8*Pawn]
			 or   rax, rdx

		RookAttacks   rdx, r9, r15, r10
			mov   rcx, qword [rbp+Pos.typeBB+8*Rook]
			 or   rcx, qword [rbp+Pos.typeBB+8*Queen]
			and   rdx, rcx
			 or   rax, rdx

	      BishopAttacks   rdx, r9, r15, r10
			mov   rcx, qword [rbp+Pos.typeBB+8*Bishop]
			 or   rcx, qword [rbp+Pos.typeBB+8*Queen]
			and   rdx, rcx
			 or   rax, rdx

			and   rax, r14
			cmp   rax, 1
			sbb   eax, eax

			pop   r15 r14 r13 r12 rdi rsi
			ret

		      align   8
 .Castle:
		       test   rdx, rdx
			jnz   .CastleReturnFalse
		       andn   r13, r14, r15
			mov   r14, r15
		       test   esi, esi
			jnz   .CastleBlack
.CastleWhite:
			cmp   eax, (MOVE_TYPE_CASTLE shl 12) + (SQ_E1 shl 6) + (SQ_G1 shl 0)
			 je   .CastleCheck_WhiteOO
			cmp   eax, (MOVE_TYPE_CASTLE shl 12) + (SQ_E1 shl 6) + (SQ_C1 shl 0)
			 je   .CastleCheck_WhiteOOO
.CastleReturnFalse:
			xor   eax, eax
			pop   r15 r14 r13 r12 rdi rsi
			ret
.CastleBlack:
			cmp   eax, (MOVE_TYPE_CASTLE shl 12) + (SQ_E8 shl 6) + (SQ_G8 shl 0)
			 je   .CastleCheck_BlackOO
			cmp   eax, (MOVE_TYPE_CASTLE shl 12) + (SQ_E8 shl 6) + (SQ_C8 shl 0)
			 je   .CastleCheck_BlackOOO
			jmp   .CastleReturnFalse



  .CastleCheck_WhiteOO:
		      movzx   eax, byte[rbx+State.castlingRights]
			mov   rcx, (1 shl SQ_F1) + (1 shl SQ_G1)
			and   rcx, r14
			and   eax, 1 shl (0)
			xor   eax, 1 shl (0)
			 or   rax, rcx
			jnz   .ReturnFalse
		       call   CastleOOLegal_White
			pop   r15 r14 r13 r12 rdi rsi
			ret

  .CastleCheck_BlackOO:
		      movzx   eax, byte[rbx+State.castlingRights]
			mov   rcx, (1 shl SQ_F8) + (1 shl SQ_G8)
			and   rcx, r14
			and   eax, 1 shl (2)
			xor   eax, 1 shl (2)
			 or   rax, rcx
			jnz   .ReturnFalse
		       call   CastleOOLegal_Black
			pop   r15 r14 r13 r12 rdi rsi
			ret


  .CastleCheck_WhiteOOO:
		      movzx   eax, byte[rbx+State.castlingRights]
			mov   rcx, (1 shl SQ_D1) + (1 shl SQ_C1) + (1 shl SQ_B1)
			and   rcx, r14
			and   eax, 2 shl (0)
			xor   eax, 2 shl (0)
			 or   rax, rcx
			jnz   .ReturnFalse
		       call   CastleOOOLegal_White
			pop   r15 r14 r13 r12 rdi rsi
			ret

  .CastleCheck_BlackOOO:
		      movzx   eax, byte[rbx+State.castlingRights]
			mov   rcx, (1 shl SQ_D8) + (1 shl SQ_C8) + (1 shl SQ_B8)
			and   rcx, r14
			and   eax, 2 shl (2)
			xor   eax, 2 shl (2)
			 or   rax, rcx
			jnz   .ReturnFalse
		       call   CastleOOOLegal_Black
			pop   r15 r14 r13 r12 rdi rsi
			ret

