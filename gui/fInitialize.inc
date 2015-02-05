

Interrupt:  int3
	    int3
	    int3



GoDirection:	; in: ebx square
		;     cl  x coord
		;     ch  y coord
		; out: eax square ebx + (x,y) or 64 if rbx + (x,y) is off board

if DEBUG_MODE
     cmp  ebx,64
     jae  InternalError_GoDirection
end if

		       call  SquareToXY
			add  al,cl
			 js  .Fail
			cmp  al,8
			jae  .Fail
			add  ah,ch
			 js  .Fail
			cmp  ah,8
			jae  .Fail
			mov  ecx,7
			and  ecx,eax
			shr  eax,5
			 or  eax,ecx
			ret
	     .Fail:	mov  eax,64
			ret

SquareToXY:	; in: rbx square
		; out: al  x coord
		;      ah  y coord
			xor  eax,eax
			mov  al,bl
			and  al,7
			mov  ah,bl
			shr  ah,3
			ret




InitializeMoveGeneration:
		       push  r15 r14 r13 r12


;for rook/bishop attacks the PDEP bitboard for a square s consists of all squares
;         that are attacked by a rook/bishop on square s on an otherwise empty board
;for rook/bishop attacks the PEXT bitboard, which is a subset of the PDEP bitboard, consists of those squares
;         that are necessary in determining which squares are actually attacked by a rook/bishop on square s on a non-empty chessboard
;the MASK array contains the actuall bitboards of attacks
; example: B means bishop, X means any piece
;
; suppose that the board is
;
; . . . . . . . .
; . X . . . . . .
; . X . . X . . .
; . X . . . . . .
; . . B . . . . .
; . . . . . . . .
; X X X X X X X X
; . . . . . . . .

; the PDEP bitboard for the bishop's square is
; . . . . . . 1 .
; . . . . . 1 . .
; 1 . . . 1 . . .
; . 1 . 1 . . . .
; . . . . . . . .
; . 1 . 1 . . . .
; 1 . . . 1 . . .
; . . . . . 1 . .

; the boarders are not necessary in determning attack info, so the PEXT bitboard is
; . . . . . . . .
; . . . . . 1 . .
; . . . . 1 . . .
; . 1 . 1 . . . .
; . . . . . . . .
; . 1 . 1 . . . .
; . . . . 1 . . .
; . . . . . . . .

;using the PEXT bitboard as a mask, extracting the bits in the bitboard of all pieces gives
; offset = pext(all pieces,PEXT board) = 1000110b
; this offset is used to lookup a pre-computed bitboard of attacks:
;
; . . . . . . . .
; . . . . . . . .
; . . . . 1 . . .
; . 1 . 1 . . . .
; . . . . . . . .
; . 1 . 1 . . . .
; 1 . . . 1 . . .
; . . . . . . . .
;
; these are the squares that are attacked by the bishop
;
; this bitboard (qword) used to be compressed into a word using pext(attacks,PDEP bitboard)
;   so that the size of the lookup table could be reduced by a factor of four
;   however, this means that a pdep instruction is required to uncompresse the data when computing the attacks squares
;   this slow down is enough to switch back to the uncompressed storage of the attaking data.




Init_RookAttack_PDEP_PEXT:
			xor  r15d,r15d
	.NextSquare:	mov  ebx,r15d
		       call  SquareToXY
			mov  edx,eax
			xor  r13,r13
			xor  r14d,r14d
	.NextSquare2:	mov  ebx,r14d
		       call  SquareToXY
			cmp  al,dl
			jne  @f
			btc  r13,r14
		  @@:	cmp  ah,dh
			jne  @f
			btc  r13,r14
		  @@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare2
			mov  rax,[BitBoard_Rank1]
			 or  rax,[BitBoard_Rank8]
			 or  rax,[BitBoard_FileA]
			 or  rax,[BitBoard_FileH]
			not  rax
			cmp  dh,0
			jne  @f
			 or  rax,[BitBoard_Rank8]
		  @@:	cmp  dh,7
			jne  @f
			 or  rax,[BitBoard_Rank1]
		  @@:	cmp  dl,0
			jne  @f
			 or  rax,[BitBoard_FileA]
		  @@:	cmp  dl,7
			jne  @f
			 or  rax,[BitBoard_FileH]
		  @@:	and  rax,[BitBoard_Corners]
			and  rax,r13
			mov  qword[RookAttacksPDEP+8*r15],r13
			mov  qword[RookAttacksPEXT+8*r15],rax
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare


Init_BishopAttack_PDEP_PEXT:
			xor  r15d,r15d
	.NextSquare:	mov  ebx,r15d
		       call  SquareToXY
			mov  edx,eax
			xor  r13,r13
			xor  r14d,r14d
	.NextSquare2:	mov  ebx,r14d
		       call  SquareToXY
			mov  cl,dl
			add  cl,dh
			sub  cl,al
			sub  cl,ah
			jnz  @f
			btc  r13,r14
		  @@:	mov  cl,dl
			sub  cl,dh
			sub  cl,al
			add  cl,ah
			jnz  @f
			btc  r13,r14
		  @@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare2
			mov  rax,[BitBoard_Rank1]
			 or  rax,[BitBoard_Rank8]
			 or  rax,[BitBoard_FileA]
			 or  rax,[BitBoard_FileH]
			not  rax
			and  rax,r13
			mov  qword[BishopAttacksPDEP+8*r15],r13
			mov  qword[BishopAttacksPEXT+8*r15],rax
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare



			lea  rdi,[SlidingAttackMasks]  ; rdi will keep track of the addresses
Init_RookAttack_MASK:
			xor  r15d,r15d
	.NextSquare:	mov  dword[RookAttacksMOFF+4*r15],edi
			xor  r14d,r14d
		    _popcnt  rax,qword[RookAttacksPEXT+8*r15],rcx
			xor  r13,r13
			bts  r13,rax
	.NextMask:    _pdep  r12,r14,qword[RookAttacksPEXT+8*r15],rax,rbx,rcx
			xor  r10,r10
			xor  r11d,r11d
	.NextDirection: mov  r9,r15
			 or  r8,-1
			jmp  .Step
	.NextStep:	xor  eax,eax
			bts  rax,r9
			and  rax,r8
			add  r10,rax
			 bt  r12,r9
			sbb  rax,rax
		      _andn  r8,rax,r8
	.Step:		mov  ebx,r9d
		      movzx  rcx,word[.Directions+2*r11]
		       call  GoDirection
			mov  r9d,eax
			cmp  eax,64
			 jb  .NextStep
			add  r11d,1
			cmp  r11d,4
			 jb  .NextDirection

		   ;   _pext  rax,r10,qword[RookAttacksPDEP+8*r15],rbx,rcx,rdx
		   ;   stosw
			mov  rax,r10
		      stosq

			add  r14d,1
			cmp  r14d,r13d
			 jb  .NextMask
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db +1, 0, -1, 0, 0, +1, 0, -1
		@@:

Init_BishopAttack_MASK:
			xor  r15d,r15d
	.NextSquare:	mov  dword[BishopAttacksMOFF+4*r15],edi
			xor  r14d,r14d
		    _popcnt  rax,qword[BishopAttacksPEXT+8*r15],rcx
			xor  r13,r13
			bts  r13,rax
	.NextMask:    _pdep  r12,r14,qword[BishopAttacksPEXT+8*r15],rax,rbx,rcx
			xor  r10,r10
			xor  r11d,r11d
	.NextDirection: mov  r9,r15
			 or  r8,-1
			jmp  .Step
	.NextStep:	xor  eax,eax
			bts  rax,r9
			and  rax,r8
			add  r10,rax
			 bt  r12,r9
			sbb  rax,rax
		      _andn  r8,rax,r8
	.Step:		mov  ebx,r9d
		      movzx  rcx,word[.Directions+2*r11]
		       call  GoDirection
			mov  r9d,eax
			cmp  eax,64
			 jb  .NextStep
			add  r11d,1
			cmp  r11d,4
			 jb  .NextDirection

		 ;     _pext  rax,r10,qword[BishopAttacksPDEP+8*r15],rbx,rcx,rdx
		 ;     stosw
			mov  rax,r10
		      stosq

			add  r14d,1
			cmp  r14d,r13d
			 jb  .NextMask
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db +1, +1, -1, +1, +1, -1, -1, -1
		@@:

			cmp  rdi,SlidingAttackMasks+2*107648*4
			jne  Interrupt


Init_KnightAttacks:
			xor  r15d,r15d
	.NextSquare:	xor  r14d,r14d
			xor  r13d,r13d
	.NextDirection: mov  ebx,r15d
		      movzx  rcx,word[.Directions+2*r14]
		       call  GoDirection
			cmp  eax,64
			jae  @f
			bts  r13,rax
		@@:	add  r14d,1
			cmp  r14d,8
			 jb  .NextDirection
			mov  qword[KnightAttacks+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db +2,+1, +2,-1, -2,+1, -2,-1, +1,+2, -1,+2, +1,-2, -1,-2
		@@:


Init_KingAttacks:
			xor  r15d,r15d
	.NextSquare:	xor  r14d,r14d
			xor  r13d,r13d
	.NextDirection: mov  ebx,r15d
		      movzx  rcx,word[.Directions+2*r14]
		       call  GoDirection
			cmp  eax,64
			jae  @f
			bts  r13,rax
		@@:	add  r14d,1
			cmp  r14d,8
			 jb  .NextDirection
			mov  qword[KingAttacks+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db +1,+1, +1, 0, +1,-1,  0,+1,  0,-1, -1,+1, -1, 0, -1,-1
		@@:


Init_WhitePawnAttacks:
			xor  r15d,r15d
	.NextSquare:	xor  r14d,r14d
			xor  r13d,r13d
	.NextDirection: mov  ebx,r15d
		      movzx  rcx,word[.Directions+2*r14]
		       call  GoDirection
			cmp  eax,64
			jae  @f
			bts  r13,rax
		@@:	add  r14d,1
			cmp  r14d,2
			 jb  .NextDirection
			mov  qword[WhitePawnAttacks+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db +1,-1, -1,-1
		@@:


Init_BlackPawnAttacks:
			xor  r15d,r15d
	.NextSquare:	xor  r14d,r14d
			xor  r13d,r13d
	.NextDirection: mov  ebx,r15d
		      movzx  rcx,word[.Directions+2*r14]
		       call  GoDirection
			cmp  eax,64
			jae  @f
			bts  r13,rax
		@@:	add  r14d,1
			cmp  r14d,2
			 jb  .NextDirection
			mov  qword[BlackPawnAttacks+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db +1,+1, -1,+1
		@@:


Init_WhitePawnMoves:
			xor  r15d,r15d
	.NextSquare:	xor  r14d,r14d
			xor  r13d,r13d
	.NextDirection: mov  ebx,r15d
		      movzx  rcx,word[.Directions+2*r14]
		       call  GoDirection
			cmp  eax,64
			jae  @f
			bts  r13,rax
		@@:	add  r14d,1
			cmp  r14d,1
			 jb  .NextDirection
			mov  qword[WhitePawnMoves+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db 0,-1
		@@:


Init_BlackPawnMoves:
			xor  r15d,r15d
	.NextSquare:	xor  r14d,r14d
			xor  r13d,r13d
	.NextDirection: mov  ebx,r15d
		      movzx  rcx,word[.Directions+2*r14]
		       call  GoDirection
			cmp  eax,64
			jae  @f
			bts  r13,rax
		@@:	add  r14d,1
			cmp  r14d,1
			 jb  .NextDirection
			mov  qword[BlackPawnMoves+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db 0,+1
		@@:


Init_CastlingRights:
			lea  rdi,[CastlingMasks]
			mov  rax,0x0B0F0F030F0F0F07
		      stosq
			mov  rax,0x0F0F0F0F0F0F0F0F
		      stosq
		      stosq
		      stosq
		      stosq
		      stosq
		      stosq
			mov  rax,0x0E0F0F0C0F0F0F0D
		      stosq



		       move  qword[WhitePawnPromRank],rax,((2 shl SQUARE_H8) - (1 shl SQUARE_A8))
		       move  qword[BlackPawnPromRank],rax,((	0	   ) - (1 shl SQUARE_A1))    ; (2 shl SQUARE_H1)

		       move  qword[WhitePawnHomeRank],rax,((2 shl SQUARE_H2) - (1 shl SQUARE_A2))
		       move  qword[BlackPawnHomeRank],rax,((2 shl SQUARE_H7) - (1 shl SQUARE_A7))


		       move  qword[CastlingOOClear+8*0],rax,((1 shl SQUARE_F1) + (1 shl SQUARE_G1))
		       move  qword[CastlingOOClear+8*1],rax,((1 shl SQUARE_F8) + (1 shl SQUARE_G8))
		       move  qword[CastlingOOCheck+8*0],rax,((1 shl SQUARE_E1) + (1 shl SQUARE_F1) + (1 shl SQUARE_G1))
		       move  qword[CastlingOOCheck+8*1],rax,((1 shl SQUARE_E8) + (1 shl SQUARE_F8) + (1 shl SQUARE_G8))
		       move  dword[CastlingOOMove+4*0],eax,(KING shl (16+3)) + (MOVE_TYPE_OO shl 12)+ (SQUARE_E1 shl 6) + (SQUARE_G1 shl 0)
		       move  dword[CastlingOOMove+4*1],eax,(KING shl (16+3)) + (MOVE_TYPE_OO shl 12)+ (SQUARE_E8 shl 6) + (SQUARE_G8 shl 0)

		       move  qword[CastlingOOOClear+8*0],rax,((1 shl SQUARE_D1) + (1 shl SQUARE_C1) + (1 shl SQUARE_B1))
		       move  qword[CastlingOOOClear+8*1],rax,((1 shl SQUARE_D8) + (1 shl SQUARE_C8) + (1 shl SQUARE_B8))
		       move  qword[CastlingOOOCheck+8*0],rax,((1 shl SQUARE_E1) + (1 shl SQUARE_D1) + (1 shl SQUARE_C1))
		       move  qword[CastlingOOOCheck+8*1],rax,((1 shl SQUARE_E8) + (1 shl SQUARE_D8) + (1 shl SQUARE_C8))
		       move  dword[CastlingOOOMove+4*0],eax,(KING shl (16+3)) + (MOVE_TYPE_OOO shl 12)+ (SQUARE_E1 shl 6) + (SQUARE_C1 shl 0)
		       move  dword[CastlingOOOMove+4*1],eax,(KING shl (16+3)) + (MOVE_TYPE_OOO shl 12)+ (SQUARE_E8 shl 6) + (SQUARE_C8 shl 0)




Init_BetweenMasks_LineMasks:

 ; for (Square s1 = SQ_A1; s1 <= SQ_H8; ++s1)
 ; {
 ;     PseudoAttacks[QUEEN][s1]  = PseudoAttacks[BISHOP][s1] = attacks_bb<BISHOP>(s1, 0);
 ;     PseudoAttacks[QUEEN][s1] |= PseudoAttacks[  ROOK][s1] = attacks_bb<  ROOK>(s1, 0);
 ;
 ;     for (Square s2 = SQ_A1; s2 <= SQ_H8; ++s2)
 ;     {
;;          Piece pc = (PseudoAttacks[BISHOP][s1] & s2) ? W_BISHOP :
;                     (PseudoAttacks[ROOK][s1]   & s2) ? W_ROOK   : NO_PIECE;
;
;          if (pc == NO_PIECE)
;              continue;
;
;          LineBB[s1][s2] = (attacks_bb(pc, s1, 0) & attacks_bb(pc, s2, 0)) | s1 | s2;
;          BetweenBB[s1][s2] = attacks_bb(pc, s1, SquareBB[s2]) & attacks_bb(pc, s2, SquareBB[s1]);
;      }
;  }
;}



			xor  r15d,r15d
	.NextSquare1:	xor  r14d,r14d
	.NextSquare2:
			xor  rax,rax
			mov  edx,r15d
			shl  edx,6+3
			 bt  qword[BishopAttacksPDEP+8*r15],r14
			 jc  .Bishop
			 bt  qword[RookAttacksPDEP+8*r15],r14
			 jc  .Rook
			mov  qword[LineMasks+rdx+8*r14],rax
			mov  qword[BetweenMasks+rdx+8*r14],rax
			jmp  .Done

	.Bishop:

			xor  r13,r13
	      BishopAttacks  rax,r15,r13,r8,r9,r10,r11
	      BishopAttacks  rcx,r14,r13,r8,r9,r10,r11
			and  rax,rcx
			bts  rax,r15
			bts  rax,r14
			mov  qword[LineMasks+rdx+8*r14],rax


			xor  r13,r13
			bts  r13,r14
	      BishopAttacks  rax,r15,r13,r8,r9,r10,r11
			xor  r13,r13
			bts  r13,r15
	      BishopAttacks  rcx,r14,r13,r8,r9,r10,r11
			and  rax,rcx
			mov  qword[BetweenMasks+rdx+8*r14],rax
			jmp  .Done

	.Rook:

			xor  r13,r13
		RookAttacks  rax,r15,r13,r8,r9,r10,r11
		RookAttacks  rcx,r14,r13,r8,r9,r10,r11
			and  rax,rcx
			bts  rax,r15
			bts  rax,r14
			mov  qword[LineMasks+rdx+8*r14],rax


			xor  r13,r13
			bts  r13,r14
		RookAttacks  rax,r15,r13,r8,r9,r10,r11
			xor  r13,r13
			bts  r13,r15
		RookAttacks  rcx,r14,r13,r8,r9,r10,r11
			and  rax,rcx
			mov  qword[BetweenMasks+rdx+8*r14],rax
			jmp  .Done



	.Done:

			add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare2
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare1



			pop  r12 r13 r14 r15
			ret











if 0


InitializeScores:
		       push  rbx rsi rdi r12 r13 r14 r15

Init_MaterialScores:
			mov  dword[MaterialScores+4*PAWN],   PAWN_MSCORE
			mov  dword[MaterialScores+4*KNIGHT], (300)
			mov  dword[MaterialScores+4*BISHOP], (300)
			mov  dword[MaterialScores+4*ROOK],   (500)
			mov  dword[MaterialScores+4*QUEEN],  QUEEN_MSCORE


Init_PositionalBonuses:
			lea  rsi,[.WhitePawnsPosBonus]
			lea  rdi,[WhitePawnsPosBonus]
			mov  ecx,64
		  rep movsb
			lea  rsi,[.BlackPawnsPosBonus]
			lea  rdi,[BlackPawnsPosBonus]
			mov  ecx,64
		  rep movsb

			lea  rsi,[.WhiteKnightPosBonus]
			lea  rdi,[WhiteKnightPosBonus]
			mov  ecx,64
		  rep movsb
			lea  rsi,[.BlackKnightPosBonus]
			lea  rdi,[BlackKnightPosBonus]
			mov  ecx,64
		  rep movsb

			lea  rsi,[.WhiteBishopPosBonus]
			lea  rdi,[WhiteBishopPosBonus]
			mov  ecx,64
		  rep movsb
			lea  rsi,[.BlackBishopPosBonus]
			lea  rdi,[BlackBishopPosBonus]
			mov  ecx,64
		  rep movsb

			lea  rsi,[.WhiteKingPosBonus]
			lea  rdi,[WhiteKingPosBonus]
			mov  ecx,64
		  rep movsb
			lea  rsi,[.BlackKingPosBonus]
			lea  rdi,[BlackKingPosBonus]
			mov  ecx,64
		  rep movsb
			lea  rsi,[.KingEndPosBonus]
			lea  rdi,[KingEndPosBonus]
			mov  ecx,64
		  rep movsb
			lea  rsi,[.WhiteKingPawnPenalty]
			lea  rdi,[WhiteKingPawnPenalty]
			mov  ecx,64
		  rep movsb
			lea  rsi,[.BlackKingPawnPenalty]
			lea  rdi,[BlackKingPawnPenalty]
			mov  ecx,64
		  rep movsb
			jmp  @f


;WhitePawnRank + 8* (BlackPawnRank)
.WhiteKingPawnPenalty:	db \
	40, 38, 37, 36, 35, 25, 15, 00,\   ; no enemy pawn
	25, 23, 22, 21, 20, 10, 00, 00,\   ; enemy pawn on home row
	25, 23, 22, 21, 20, 10, 00, 00,\   ; enemy pawn advanced one
	25, 23, 22, 21, 20, 10, 00, 00,\   ; enemy pawn advanced two
	30, 28, 27, 26, 25, 15, 05, 00,\   ; enemy pawn advanced three
	35, 33, 32, 31, 30, 20, 10, 00,\   ; enemy pawn advanced four
	35, 33, 32, 31, 30, 20, 15, 00,\   ; enemy pawn advanced five
	00, 00, 00, 00, 00, 00, 00, 00

;BlackPawnRank + 8* (WhitePawnRank)
.BlackKingPawnPenalty:	db \
	40, 15, 25, 35, 36, 37, 38, 00,\   ; no enemy pawn
	35, 15, 20, 30, 31, 32, 33, 00,\   ; enemy pawn advanced five
	25, 10, 20, 30, 31, 32, 33, 00,\   ; enemy pawn advanced four
	25, 05, 15, 25, 26, 27, 28, 00,\   ; enemy pawn advanced three
	25, 00, 10, 20, 21, 22, 23, 00,\   ; enemy pawn advanced two
	25, 00, 10, 20, 21, 22, 23, 00,\   ; enemy pawn advanced one
	25, 00, 10, 20, 21, 22, 23, 00,\   ; enemy pawn on home row
	00, 00, 00, 00, 00, 00, 00, 00


.KingEndPosBonus:  db \
	  0,  10,  20,	30,  30,  20,  10,   0, \
	 10,  20,  30,	40,  40,  30,  20,  10, \
	 20,  30,  40,	50,  50,  40,  30,  20, \
	 30,  40,  50,	60,  60,  50,  40,  30, \
	 30,  40,  50,	60,  60,  50,  40,  30, \
	 20,  30,  40,	50,  50,  40,  30,  20, \
	 10,  20,  30,	40,  40,  30,  20,  10, \
	  0,  10,  20,	30,  30,  20,  10,   0
.WhiteKingPosBonus:  db \
	-40, -40, -40, -40, -40, -40, -40, -40, \
	-40, -40, -40, -40, -40, -40, -40, -40, \
	-40, -40, -40, -40, -40, -40, -40, -40, \
	-40, -40, -40, -40, -40, -40, -40, -40, \
	-40, -40, -40, -40, -40, -40, -40, -40, \
	-40, -40, -40, -40, -40, -40, -40, -40, \
	-20, -20, -20, -20, -20, -20, -20, -20, \
	  0,  20,  40, -20,   0, -20,  40,  20
.BlackKingPosBonus:  db \
	  0,  20,  40, -20,   0, -20,  40,  20, \
	-20, -20, -20, -20, -20, -20, -20, -20, \
	-40, -40, -40, -40, -40, -40, -40, -40, \
	-40, -40, -40, -40, -40, -40, -40, -40, \
	-40, -40, -40, -40, -40, -40, -40, -40, \
	-40, -40, -40, -40, -40, -40, -40, -40, \
	-40, -40, -40, -40, -40, -40, -40, -40, \
	-40, -40, -40, -40, -40, -40, -40, -40
.WhitePawnsPosBonus:  db \
	  0,   0,   0,	 0,   0,   0,	0,   0, \
	  5,  10,  15,	20,  20,  15,  10,   5, \
	  4,   8,  12,	16,  16,  12,	8,   4, \
	  3,   6,   9,	12,  12,   9,	6,   3, \
	  2,   4,   6,	 8,   8,   6,	4,   2, \
	  1,   2,   3, -10, -10,   3,	2,   1, \
	  0,   0,   0, -40, -40,   0,	0,   0, \
	  0,   0,   0,	 0,   0,   0,	0,   0
.BlackPawnsPosBonus:  db \
	  0,   0,   0,	 0,   0,   0,	0,   0, \
	  0,   0,   0, -40, -40,   0,	0,   0, \
	  1,   2,   3, -10, -10,   3,	2,   1, \
	  2,   4,   6,	 8,   8,   6,	4,   2, \
	  3,   6,   9,	12,  12,   9,	6,   3, \
	  4,   8,  12,	16,  16,  12,	8,   4, \
	  5,  10,  15,	20,  20,  15,  10,   5, \
	  0,   0,   0,	 0,   0,   0,	0,   0
.WhiteKnightPosBonus: db \
	-10, -10, -10, -10, -10, -10, -10, -10, \
	-10,   0,   0,	 0,   0,   0,	0, -10, \
	-10,   0,   5,	 5,   5,   5,	0, -10, \
	-10,   0,   5,	10,  10,   5,	0, -10, \
	-10,   0,   5,	10,  10,   5,	0, -10, \
	-10,   0,   5,	 5,   5,   5,	0, -10, \
	-10,   0,   0,	 0,   0,   0,	0, -10, \
	-10, -30, -10, -10, -10, -10, -30, -10
.BlackKnightPosBonus: db \
	-10, -30, -10, -10, -10, -10, -30, -10, \
	-10,   0,   0,	 0,   0,   0,	0, -10, \
	-10,   0,   5,	 5,   5,   5,	0, -10, \
	-10,   0,   5,	10,  10,   5,	0, -10, \
	-10,   0,   5,	10,  10,   5,	0, -10, \
	-10,   0,   5,	 5,   5,   5,	0, -10, \
	-10,   0,   0,	 0,   0,   0,	0, -10, \
	-10, -10, -10, -10, -10, -10, -10, -10

.WhiteBishopPosBonus: db \
	-10, -10, -10, -10, -10, -10, -10, -10, \
	-10,   0,   0,	 0,   0,   0,	0, -10, \
	-10,   0,   5,	 5,   5,   5,	0, -10, \
	-10,   0,   5,	10,  10,   5,	0, -10, \
	-10,   0,   5,	10,  10,   5,	0, -10, \
	-10,   0,   5,	 5,   5,   5,	0, -10, \
	-10,   0,   0,	 0,   0,   0,	0, -10, \
	-10, -10, -20, -10, -10, -20, -10, -10

.BlackBishopPosBonus: db \
	-10, -10, -20, -10, -10, -20, -10, -10, \
	-10,   0,   0,	 0,   0,   0,	0, -10, \
	-10,   0,   5,	 5,   5,   5,	0, -10, \
	-10,   0,   5,	10,  10,   5,	0, -10, \
	-10,   0,   5,	10,  10,   5,	0, -10, \
	-10,   0,   5,	 5,   5,   5,	0, -10, \
	-10,   0,   0,	 0,   0,   0,	0, -10, \
	-10, -10, -10, -10, -10, -10, -10, -10

Init_IsolatedPawns:
		; files on either side pawns
			xor  r15d,r15d
    .NextPawn:		xor  r13,r13
			xor  r14,r14
	.NextSquare:	mov  eax,r15d
			and  eax,7
			mov  ecx,r14d
			and  ecx,7
			sub  eax,ecx
			cmp  eax,1
			 jg  @f
			cmp  eax,-1
			 jl  @f
			cmp  eax,0
			 je  @f
			bts  r13,r14
		@@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare
			mov  qword[IsolatedPawns+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextPawn




Init_WhiteDoubledPawns:
		; same file in back
			xor  r15d,r15d
    .NextPawn:		xor  r13,r13
			xor  r14,r14
	.NextSquare:	mov  eax,r15d
			and  eax,7
			mov  ecx,r14d
			and  ecx,7
			cmp  eax,ecx
			jne  @f
			mov  eax,r15d
			shr  eax,3
			mov  ecx,r14d
			shr  ecx,3
			cmp  ecx,eax
			jbe  @f
			bts  r13,r14
		@@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare
			mov  qword[WhiteDoubledPawns+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextPawn

Init_BlackDoubledPawns:
		; same file in front
			xor  r15d,r15d
    .NextPawn:		xor  r13,r13
			xor  r14,r14
	.NextSquare:	mov  eax,r15d
			and  eax,7
			mov  ecx,r14d
			and  ecx,7
			cmp  eax,ecx
			jne  @f
			mov  eax,r15d
			shr  eax,3
			mov  ecx,r14d
			shr  ecx,3
			cmp  ecx,eax
			jae  @f
			bts  r13,r14
		@@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare
			mov  qword[BlackDoubledPawns+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextPawn




Init_WhitePassedPawns:
		; three closest files in front
			xor  r15d,r15d
    .NextPawn:		xor  r13,r13
			xor  r14,r14
	.NextSquare:	mov  eax,r15d
			and  eax,7
			mov  ecx,r14d
			and  ecx,7
			sub  eax,ecx
			cmp  eax,1
			 jg  @f
			cmp  eax,-1
			 jl  @f
			mov  eax,r15d
			shr  eax,3
			mov  ecx,r14d
			shr  ecx,3
			cmp  ecx,eax
			jae  @f
			bts  r13,r14
		@@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare
			mov  qword[WhitePassedPawns+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextPawn


Init_BlackPassedPawns:
		; three closest files in back
			xor  r15d,r15d
    .NextPawn:		xor  r13,r13
			xor  r14,r14
	.NextSquare:	mov  eax,r15d
			and  eax,7
			mov  ecx,r14d
			and  ecx,7
			sub  eax,ecx
			cmp  eax,1
			 jg  @f
			cmp  eax,-1
			 jl  @f
			mov  eax,r15d
			shr  eax,3
			mov  ecx,r14d
			shr  ecx,3
			cmp  ecx,eax
			jbe  @f
			bts  r13,r14
		@@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare
			mov  qword[BlackPassedPawns+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextPawn


			pop  r15 r14 r13 r12 rdi rsi rbx
			ret


InitializeHashKeys:
		       push  rbx rsi rdi

		; zeros for empty squares
			xor  eax,eax
			lea  rdi,[WhiteKey]
			mov  ecx,64*2
		  rep stosq
		; keys for peices on squares + castling + epsquare + side
			lea  rdi,[WhitePawnKey]
			lea  rbx,[SideKey+8]
		@@:    call  GetRand
		      stosw
			cmp  rdi,rbx
			 jb  @b

			pop  rdi rsi rbx
			ret




InitialHashTable:   ; initialize hash table to 128MB

		       push  rbx rsi rdi

			mov  ecx,(128 shl 20)
		       call  _VirtualAlloc
			mov  qword[HashTable],rax

			pop  rdi rsi rbx
			ret


end if


