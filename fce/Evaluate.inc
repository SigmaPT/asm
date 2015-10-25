



		      align  16
LoneKing:
		; r12 = weak pieces
			mov  r12d,ecx
			add  r12,rbp
		; r13 = strong pieces
			mov  r13d,ecx
			xor  r13d,64
			add  r13,rbp
		; ebx =  0 white is strong side  xor white to move
		;     = -1 black is strong side  xor white to move
			cmp  ecx,1
			sbb  ebx,ebx
		      movsx  eax,byte[rbp+STATE.SIDE]
			xor  ebx,eax
		; r14d = distance^2 between kings
		; r15d = weak king
		; r8d  = strong king
			bsf  r15,qword[r12+8*KING]
			bsf  r8,qword[r13+8*KING]
			mov  r14d,r8d
			and  r14d,7
			mov  r10d,r15d
			and  r10d,7
			sub  r14d,r10d
		       imul  r14d,r14d
			mov  r11d,r8d
			shr  r11d,3
			mov  r10d,r15d
			shr  r10d,3
			sub  r11d,r10d
		       imul  r11d,r11d
			add  r14d,r11d
		; have pawns?
			xor  eax,eax
			cmp  rax,qword[r13+8*PAWN]
			jne  .HavePawns
		; have queen?     have rook?
			xor  edx,edx
			cmp  rdx,qword[r13+8*QUEEN]
			jne  .HaveQueen
			cmp  rdx,qword[r13+8*ROOK]
			jne  .HaveRook
		; have two bishops?
		    _popcnt  rdx,qword[r13+8*KNIGHT],r9
		    _popcnt  rax,qword[r13+8*BISHOP],r9
			cmp  eax,1
			 ja  .HaveTwoBishops
			 jb  .OnlyKnights
		; have knights?
			cmp  edx,1
			jae  .HaveBishopKnights
			xor  eax,eax
			jmp  .Return

.OnlyKnights:		cmp  edx,2
			 ja  .HaveTwoBishops  ; evaluate three knights as two bishops

			xor  eax,eax
 .Return:
			xor  eax,ebx
			sub  eax,ebx
			pop  r15 r14 r13 r12 rdi rsi rbx
			pop  rbp
			ret

		      align  8
.HavePawns:
		    _popcnt  rdx,qword[r13+8*PAWN],r9
		; have only pawns?
			mov  rax,qword[r13+8*PAWN]
			 or  rax,qword[r13+8*KING]
			cmp  rax,qword[r13+8*0]
			jne  EvaluatePosition.LoneKingReturn
		; have only one pawn?
			cmp  edx,1
			jne  EvaluatePosition.LoneKingReturn

		; white is strong side?
		       test  ecx,ecx
			 jz  EvaluatePosition.LoneKingReturn

		; r9 = strong pawn
			bsf  r9,qword[r13+8*PAWN]

		; if black king is on right side of board, flip pieces
			 bt  r15d,2
			sbb  eax,eax
			and  eax,7
			xor  r8d,eax
			xor  r9d,eax
			xor  r15d,eax

		; look up entry in table
			mov  edx,r15d
			shr  edx,1
			and  edx,011100b
			mov  eax,r15d
			and  eax,000011b
			 or  edx,eax
		      movsx  eax,byte[rbp+STATE.SIDE]
			sub  edx,eax

			lea  rax,[r9-8]
			shl  rax,6
			add  rax,r8
			mov  rax,qword[KPKEndgameTable+8*rax]
			 bt  rax,rdx
			sbb  eax,eax

		; get pawn rank
			mov  edx,r9d
			and  edx,0111000b
			xor  edx,0111000b
			lea  edx,[8*rdx+ENDGAME_WIN]
		      movzx  ecx,byte[rbp+STATE.PLY]
			sub  edx,ecx
		; score
			and  eax,edx
			jmp  .Return


		      align  8
.HaveQueen:		add  edx,500
.HaveRook:	      movzx  eax,byte[.LoneKingRook+r15]
			mov  ecx,200
			shl  r14d,1
			cmp  r14d,ecx
		      cmova  r14d,ecx
			sub  eax,r14d
			add  eax,ecx
			shl  eax,3
			lea  eax,[rax+ENDGAME_WIN+MAX_PLY+rdx]
		      movzx  ecx,byte[rbp+STATE.PLY]
			sub  eax,ecx
			jmp  .Return

		      align  8
.HaveTwoBishops:      movzx  eax,byte[.LoneKingTwoBishop+r15]
			mov  ecx,200
			shl  r14d,1
			cmp  r14d,ecx
		      cmova  r14d,ecx
			sub  eax,r14d
			add  eax,ecx
			shl  eax,3
			lea  eax,[rax+ENDGAME_WIN+MAX_PLY]
		      movzx  ecx,byte[rbp+STATE.PLY]
			sub  eax,ecx
			jmp  .Return


		      align  8
.HaveBishopKnights:	mov  rax,0xAA55AA55AA55AA55
			and  rax,qword[r13+8*BISHOP]
			cmp  rax,1
			sbb  eax,eax
			and  eax,7
			xor  eax,r15d
		      movzx  eax,byte[.LoneKingBishopKnight+rax]

			mov  ecx,200
			shl  r14d,1
			cmp  r14d,ecx
		      cmova  r14d,ecx
			sub  eax,r14d
			add  eax,ecx
			shl  eax,2
			lea  eax,[rax+ENDGAME_WIN+MAX_PLY]

		      movzx  ecx,byte[rbp+STATE.PLY]
			sub  eax,ecx
			jmp  .Return

align 8

.LoneKingBishopKnight:
    db 230,210,190,170,150,090,070,030
    db 210,190,170,150,120,070,020,070
    db 190,170,100,060,050,010,070,090
    db 170,150,060,010,000,050,120,150
    db 150,120,050,000,010,060,150,170
    db 090,070,010,050,060,100,170,190
    db 070,020,070,120,150,170,190,210
    db 030,070,090,150,170,190,210,230
.LoneKingTwoBishop:
    db 160,140,120,100,100,120,140,160
    db 140,100,050,030,030,050,100,140
    db 120,050,020,010,010,020,050,120
    db 100,030,010,000,000,010,030,100
    db 100,030,010,000,000,010,030,100
    db 120,050,020,010,010,020,050,120
    db 140,100,050,030,030,050,100,140
    db 160,140,120,100,100,120,140,160
.LoneKingRook:
    db 200,190,180,170,170,180,190,200
    db 190,150,100,080,080,100,150,190
    db 180,100,030,010,010,030,100,180
    db 170,080,010,000,000,010,080,170
    db 170,080,010,000,000,010,080,170
    db 180,100,030,010,010,030,100,180
    db 190,150,100,080,080,100,150,190
    db 200,190,180,170,170,180,190,200












		      align  16
EvaluatePosition:	; in rbp address of position
			; out eax evaluation of position

		       push  rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]
		       push  rbx rsi rdi r12 r13 r14 r15

		; r15 = all pieces
			xor  ecx,ecx
			cmp  word[rbp+STATE.WMSCORE],0
			 je  LoneKing
			xor  ecx,64
			cmp  word[rbp+STATE.BMSCORE],0
			 je  LoneKing

  .LoneKingReturn:	mov  r15,qword[rbp+STATE.WPIECES]
			 or  r15,qword[rbp+STATE.BPIECES]

		; eax holds the score
		      movzx  eax,word[rbp+STATE.WMSCORE]
		      movzx  ecx,word[rbp+STATE.BMSCORE]
			sub  eax,ecx


		; get mobility if |material score | <= 200
			lea  ecx,[rax+200]
			cmp  ecx,2*200
			 ja  .MobilityDone

			mov  r9,qword[rbp+64*1]

			mov  rsi,qword[rbp+64*0+8*BISHOP]
			 or  rsi,qword[rbp+64*1+8*BISHOP]
			bsf  rdi,rsi
			 jz  .BishopDone
	.Bishop:      _blsr  rsi,rsi,r8
	      BishopAttacks  rdx,rdi,r15,r8
		    _popcnt  rdx,rdx,r8
			 bt  r9,rdi
			sbb  ecx,ecx
			xor  edx,ecx
			sub  edx,ecx
			lea  eax,[rax+4*rdx]
			bsf  rdi,rsi
			jnz  .Bishop
	.BishopDone:

			mov  rsi,qword[rbp+64*0+8*ROOK]
			 or  rsi,qword[rbp+64*1+8*ROOK]
			bsf  rdi,rsi
			 jz  .RookDone
	.Rook:	      _blsr  rsi,rsi,r8
		RookAttacks  rdx,rdi,r15,r8
		    _popcnt  rdx,rdx,r8
			 bt  r9,rdi
			sbb  ecx,ecx
			xor  edx,ecx
			sub  edx,ecx
			lea  eax,[rax+2*rdx]
			bsf  rdi,rsi
			jnz  .Rook
	.RookDone:

			mov  rsi,qword[rbp+64*0+8*QUEEN]
			 or  rsi,qword[rbp+64*1+8*QUEEN]
			bsf  rdi,rsi
			 jz  .QueenDone
	.Queen:       _blsr  rsi,rsi,r8
		RookAttacks  rdx,rdi,r15,r8
	      BishopAttacks  r10,rdi,r15,r8
			 or  rdx,r10
		    _popcnt  rdx,rdx,r8
			 bt  r9,rdi
			sbb  ecx,ecx
			xor  edx,ecx
			sub  edx,ecx
			lea  eax,[rax+1*rdx]
			bsf  rdi,rsi
			jnz  .Queen
	.QueenDone:

 .MobilityDone:
			bsf  r8,qword[rbp+STATE.WPIECES+8*KING]
		  assert_nz "no white king in Evaluate"
			bsf  r9,qword[rbp+STATE.BPIECES+8*KING]
		  assert_nz "no black king in Evaluate"
		      movsx  r8d,word[PstKing+8*r8+0]
		      movsx  r9d,word[PstKing+8*r9+4]

		; pst
		      movsx  ecx,word[rbp+STATE.WPSTMG]
		      movsx  edx,word[rbp+STATE.BPSTMG]
			add  eax,ecx
			sub  eax,edx

		; white king
			mov  rdx,qword[rbp+STATE.BPIECES+8*QUEEN]
		      movzx  ecx,word[rbp+STATE.BMSCORE]
			add  r8d,r8d
			cmp  ecx,1600
			jbe  @f
		       test  rdx,rdx
			 jz  @f
			sub  eax,r8d
		     @@:

		; black king
			mov  rdx,qword[rbp+STATE.WPIECES+8*QUEEN]
		      movzx  ecx,word[rbp+STATE.WMSCORE]
			add  r9d,r9d
			cmp  ecx,1600
			jbe  @f
		       test  rdx,rdx
			 jz  @f
			add  eax,r9d
		     @@:



		; r14 = black pawns
		; r13 - white pawns
		; r12 - all pawns
			mov  r13,qword[rbp+STATE.WPAWNS]
			mov  r14,qword[rbp+STATE.BPAWNS]
			mov  r12,r14
			 or  r12,r13

		; white pawn positional bonuses
			mov  rbx,r13
			bsf  rcx,rbx
			 jz  .WhitePawnsDone
    .WhitePawns:
			mov  esi,ecx
			shr  esi,3
			xor  esi,7
			lea  esi,[5*rsi]
		      _blsr  rbx,rbx,r8

		; bonus for passed pawns
			mov  rdx,r14
			and  rdx,qword[WhitePassedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,esi
			add  eax,edx

		; penalty for isolated pawns
			mov  rdx,r13
			and  rdx,qword[IsolatedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,ISOLATED_PAWN_PENALTY
			sub  eax,edx

			bsf  rcx,rbx
			jnz  .WhitePawns
    .WhitePawnsDone:



		; black pawn positional bonuses
			mov  rbx,r14
			bsf  rcx,rbx
			 jz  .BlackPawnsDone
    .BlackPawns:
			mov  esi,ecx
			shr  esi,3
			lea  esi,[5*rsi]
		      _blsr  rbx,rbx,r8

		; bonus for passed pawns
			mov  rdx,r13
			and  rdx,qword[BlackPassedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,esi
			sub  eax,edx

		; penalty for isolated pawns
			mov  rdx,r14
			and  rdx,qword[IsolatedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,ISOLATED_PAWN_PENALTY
			add  eax,edx

			bsf  rcx,rbx
			jnz  .BlackPawns
    .BlackPawnsDone:



		; adjust score for side to move
		      movsx  edx,byte[rbp+STATE.SIDE]
			xor  eax,edx
			sub  eax,edx


.Done:

			pop  r15 r14 r13 r12 rdi rsi rbx
			pop  rbp
			ret

