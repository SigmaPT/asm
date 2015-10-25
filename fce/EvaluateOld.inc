
if 0

		      align  16
EvaluatePosition:	; in rbx address of position
			; out eax evaluation of position

		       push  rbp
			mov  rbp,[rbp+POS.STATE_PTR]
		       push  rbx rsi rdi r12 r13 r14 r15


		; eax holds the score
		      movzx  eax,word[rbp+STATE.WMSCORE]
		      movzx  ecx,word[rbp+STATE.BMSCORE]
			sub  eax,ecx

		; r15 = all pieces
			mov  r15,qword[rbp+STATE.WPIECES]
			 or  r15,qword[rbp+STATE.BPIECES]


		; get mobility if |material score| < 200
			lea  ecx,[rax+199]
			cmp  ecx,2*199
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



		; adjust score for side to move
		      movsx  edx,byte[rbp+STATE.SIDE]
			xor  eax,edx
			sub  eax,edx


.Done:

			pop  r15 r14 r13 r12 rdi rsi rbx
			pop  rbp
			ret







EvaluateMobility:  ; in rbp address of state
		   ;    r15 occlusion mask
		   ;    rbx address of pieces

			xor  eax,eax

			mov  rsi,qword[rbx+8*BISHOP]
			bsf  rdi,rsi
			 jz  .BishopDone
	.Bishop:      _blsr  rsi,rsi,r8
	      BishopAttacks  rdx,rdi,r15,r8
		    _popcnt  rdx,rdx,r8
			lea  eax,[rax+4*rdx]
			bsf  rdi,rsi
			jnz  .Bishop
	.BishopDone:

			mov  rsi,qword[rbx+8*ROOK]
			bsf  rdi,rsi
			 jz  .RookDone
	.Rook:	      _blsr  rsi,rsi,r8
		RookAttacks  rdx,rdi,r15,r8
		    _popcnt  rdx,rdx,r8
			lea  eax,[rax+2*rdx]
			bsf  rdi,rsi
			jnz  .Rook
	.RookDone:

			mov  rsi,qword[rbx+8*QUEEN]
			bsf  rdi,rsi
			 jz  .QueenDone
	.Queen:       _blsr  rsi,rsi,r8
		RookAttacks  rdx,rdi,r15,r8
		    _popcnt  rdx,rdx,r8
			lea  eax,[rax+1*rdx]
	      BishopAttacks  rdx,rdi,r15,r8
		    _popcnt  rdx,rdx,r8
			lea  eax,[rax+1*rdx]
			bsf  rdi,rsi
			jnz  .Queen
	.QueenDone:

			ret



		      align  16

_2EvaluateMobility:  ; in rbp address of state
		   ;    r15 occlusion mask
		   ;    rbx address of pieces


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

			ret




EvaluatePST:	   ; in rsi bitboard
		   ;    rbx address of pst


			ret

_EvaluatePosition:
		       push  rbp
			mov  rbp,[rbp+POS.STATE_PTR]
		       push  rbx rsi rdi r12 r13 r14 r15

		; ebx holds the score
		      movzx  r12d,word[rbp+STATE.WMSCORE]
		      movzx  ecx,word[rbp+STATE.BMSCORE]
			sub  r12d,ecx

		; r15 = all pieces
			mov  r15,[rbp+64*0+8*0]
			 or  r15,[rbp+64*1+8*0]

		; get mobility if |material score | <= 200
			lea  eax,[r12+200]
			cmp  eax,2*200
			 ja  @f
			lea  rbx,[rbp+64*0]
		       call  EvaluateMobility
			add  r12d,eax
			lea  rbx,[rbp+64*1]
		       call  EvaluateMobility
			sub  r12d,eax
		@@:

.Done:		       ; adjust score for side to move
		      movsx  edx,byte[rbp+STATE.SIDE]
			mov  eax,r12d
			xor  eax,edx
			sub  eax,edx

			pop  r15 r14 r13 r12 rdi rsi rbx
			pop  rbp
			ret


end if

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
		; r14d = distance between kings
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
			jne  EvaluatePosition.LoneKingReturn
		; have queen?
			xor  eax,eax
			cmp  rax,qword[r13+8*QUEEN]
			jne  .HaveQueen
		; have rook?
			xor  eax,eax
			cmp  rax,qword[r13+8*ROOK]
			jne  .HaveRook
		; have two bishops?
		     popcnt  rcx,qword[r13+8*KNIGHT]
		     popcnt  rax,qword[r13+8*BISHOP]
			cmp  eax,1
			 ja  .HaveTwoBishops
			 jb  .OnlyKnights
		; have knights?
			cmp  ecx,1
			jae  .HaveBishopKnights
			xor  eax,eax
			jmp  .Return

.OnlyKnights:		cmp  ecx,2
			 ja  .HaveTwoBishops  ; evaluate three knights as two bishops

			xor  eax,eax



 .Return:
			xor  eax,ebx
			sub  eax,ebx
			add  rsp,8*2
			pop  r15 r14 r13 r12 rdi rsi rbx
			pop  rbp
			ret

.HaveRook:
.HaveQueen:	      movzx  eax,byte[.LoneKingRook+r15]
			mov  ecx,200
			shl  r14d,2
			cmp  r14d,ecx
		      cmova  r14d,ecx
			sub  eax,r14d
			add  eax,ecx
			shl  eax,3
			lea  eax,[rax+ENDGAME_WIN+MAX_PLY]
		      movzx  ecx,byte[rbp+STATE.PLY]
			sub  eax,ecx
			jmp  .Return

.HaveTwoBishops:      movzx  eax,byte[.LoneKingTwoBishop+r15]
			mov  ecx,200
			shl  r14d,2
			cmp  r14d,ecx
		      cmova  r14d,ecx
			sub  eax,r14d
			add  eax,ecx
			shl  eax,3
			lea  eax,[rax+ENDGAME_WIN+MAX_PLY]
		      movzx  ecx,byte[rbp+STATE.PLY]
			sub  eax,ecx
			jmp  .Return


.HaveBishopKnights:
			mov  rax,0xAA55AA55AA55AA55
			and  rax,qword[r13+8*BISHOP]

			cmp  rax,1
		      ; neg  rax

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

	       ;         bsf  rcx,qword[r13+8*KNIGHT]
	       ;         shl  r8d,6
	       ;       movzx  ecx,byte[SquareDistance+r8+rcx]
	       ;       movzx  ecx,byte[.PushClose+rcx]
	       ;         add  eax,ecx
		       ; shl  eax,4
		       ; add  eax,ENDGAME_WIN+MAX_PLY

			lea  eax,[rax+ENDGAME_WIN+MAX_PLY]


		      movzx  ecx,byte[rbp+STATE.PLY]
			sub  eax,ecx
			jmp  .Return

align 8
;.PushClose:
;    db  0, 80, 70, 60, 50, 40, 20, 10
;    db  0,0,0,0,0,0,0,0

.LoneKingBishopKnight:
    db 230, 210, 190, 170, 150, 090, 070, 030
    db 210, 190, 170, 150, 120, 070, 020, 070
    db 190, 170, 100, 060, 050, 010, 070, 090
    db 170, 150, 060, 010, 000, 050, 120, 150
    db 150, 120, 050, 000, 010, 060, 150, 170
    db 090, 070, 010, 050, 060, 100, 170, 190
    db 070, 020, 070, 120, 150, 170, 190, 210
    db 030, 070, 090, 150, 170, 190, 210, 230

;   db 200, 190, 180, 170, 160, 150, 140, 130
;   db 190, 180, 170, 160, 150, 140, 130, 140
;   db 180, 170, 155, 140, 140, 125, 140, 150
;   db 170, 160, 140, 120, 110, 140, 150, 160
;   db 160, 150, 140, 110, 120, 140, 160, 170
;   db 150, 140, 125, 140, 140, 155, 170, 180
;   db 140, 130, 140, 150, 160, 170, 180, 190
;   db 130, 140, 150, 160, 170, 180, 190, 200

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
	   db 100,100,100,100,100,100,100,160
	   db 100,080,080,080,008,008,080,100
	   db 100,080,030,010,010,030,080,100
	   db 100,080,010,000,000,010,080,100
	   db 100,080,010,000,000,010,080,100
	   db 100,080,030,010,010,030,080,100
	   db 100,080,080,080,080,080,080,100
	   db 100,100,100,100,100,100,100,100




















		      align  16
EvaluatePosition:	; in rbx address of position
			; out eax evaluation of position

		       push  rbp
			mov  rbp,[rbp+POS.STATE_PTR]
		       push  rbx rsi rdi r12 r13 r14 r15

			sub  rsp,8*2

virtual at rsp
 .WhiteCoverage dq ?
 .BlackCoverage dq ?
end virtual

			xor  eax,eax
			mov  qword[.WhiteCoverage],rax
			mov  qword[.BlackCoverage],rax

		; eax holds the score
		      movzx  eax,word[rbp+STATE.WMSCORE]
		      movzx  ecx,word[rbp+STATE.BMSCORE]
			sub  eax,ecx

		; r15 = all pieces
			xor  ecx,ecx
			mov  r15,qword[rbp+STATE.WPIECES]
			cmp  r15,qword[rbp+STATE.WKING]
			 je  LoneKing
			xor  ecx,64
			mov  rdx,qword[rbp+STATE.BPIECES]
			cmp  rdx,qword[rbp+STATE.BKING]
			 je  LoneKing

  .LoneKingReturn:	mov  r15,qword[rbp+STATE.WPIECES]
			 or  r15,qword[rbp+STATE.BPIECES]


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


		; r14 = all pawns
			mov  r14,qword[rbp+STATE.WPAWNS]
			 or  r14,qword[rbp+STATE.BPAWNS]

		; r13 - white pawns
			mov  r13,qword[rbp+STATE.WPAWNS]

		; white pawn positional bonuses
			mov  rbx,[rbp+STATE.WPAWNS]
			bsf  rcx,rbx
			 jz  .WhitePawnsDone
    .WhitePawns:      _blsr  rbx,rbx,r8
		     ; ecx = sq
		     ; esi = rank
			mov  esi,ecx
			shr  esi,3
			xor  esi,7
		       imul  esi,PASSED_PAWN_BONUS

		      movsx  edx,byte[WhitePawnsPosBonus+rcx]
			add  eax,edx

			mov  rdx,r13
			and  rdx,qword[WhiteDoubledPawns+8*rcx]
			neg  rdx
			sbb  edx,edx
			and  edx,DOUBLED_PAWN_PENALTY
			sub  eax,edx

			mov  rdx,r13
			and  rdx,qword[IsolatedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,ISOLATED_PAWN_PENALTY
			sub  eax,edx

			mov  rdx,r13
			and  rdx,qword[BlackPassedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,BACKWARD_PAWN_PENALTY
			sub  eax,edx

			mov  rdx,r14
			and  rdx,qword[WhitePassedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,esi
			add  eax,edx

			bsf  rcx,rbx
			jnz  .WhitePawns
    .WhitePawnsDone:

		; r14 - white pawns
			mov  r13,qword[rbp+STATE.BPAWNS]

		; black pawn positional bonuses
			mov  rbx,[rbp+STATE.BPAWNS]
			bsf  rcx,rbx
			 jz  .BlackPawnsDone
    .BlackPawns:      _blsr  rbx,rbx,r8
		     ; ecx = sq
		     ; esi = rank
			mov  esi,ecx
			shr  esi,3
		       imul  esi,PASSED_PAWN_BONUS

		      movsx  edx,byte[BlackPawnsPosBonus+rcx]
			sub  eax,edx

			mov  rdx,r13
			and  rdx,qword[BlackDoubledPawns+8*rcx]
			neg  rdx
			sbb  edx,edx
			and  edx,DOUBLED_PAWN_PENALTY
			add  eax,edx

			mov  rdx,r13
			and  rdx,qword[IsolatedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,ISOLATED_PAWN_PENALTY
			add  eax,edx

			mov  rdx,r13
			and  rdx,qword[WhitePassedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,BACKWARD_PAWN_PENALTY
			add  eax,edx

			mov  rdx,r14
			and  rdx,qword[BlackPassedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,esi
			sub  eax,edx

			bsf  rcx,rbx
			jnz  .BlackPawns
    .BlackPawnsDone:

		; knight positional bonuses
			mov  rbx,[rbp+STATE.WKNIGHTS]
			bsf  rcx,rbx
			 jz  .WhiteKnightsDone
    .WhiteKnights:    movsx  edx,byte[WhiteKnightPosBonus+rcx]
		      _blsr  rbx,rbx,r8
			add  eax,edx
			bsf  rcx,rbx
			jnz  .WhiteKnights
    .WhiteKnightsDone:

			mov  rbx,[rbp+STATE.BKNIGHTS]
			bsf  rcx,rbx
			 jz  .BlackKnightsDone
    .BlackKnights:    movsx  edx,byte[BlackKnightPosBonus+rcx]
		      _blsr  rbx,rbx,r8
			sub  eax,edx
			bsf  rcx,rbx
			jnz  .BlackKnights
    .BlackKnightsDone:


		; bishop positional bonuses
			mov  rbx,[rbp+STATE.WBISHOPS]
			bsf  rcx,rbx
			 jz  .WhiteBishopsDone
    .WhiteBishops:    movsx  edx,byte[WhiteBishopPosBonus+rcx]
		      _blsr  rbx,rbx,r8
			add  eax,edx
			bsf  rcx,rbx
			jnz  .WhiteBishops
    .WhiteBishopsDone:

			mov  rbx,[rbp+STATE.BBISHOPS]
			bsf  rcx,rbx
			 jz  .BlackBishopsDone
    .BlackBishops:    movsx  edx,byte[BlackBishopPosBonus+rcx]
		      _blsr  rbx,rbx,r8
			sub  eax,edx
			bsf  rcx,rbx
			jnz  .BlackBishops
    .BlackBishopsDone:


		; rook positional bonus
			mov  r9,0x0101010101010101
			mov  rbx,[rbp+STATE.WROOKS]
			bsf  rcx,rbx
			 jz  .WhiteRooksDone
    .WhiteRooks:	mov  esi,ecx
		      _blsr  rbx,rbx,r8
			and  esi,7
			xor  r8,r8
			bts  r8,rsi
		       imul  r8,r9
			mov  rdx,r8
			and  rdx,qword[rbp+STATE.WPAWNS]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,ROOK_SEMI_OPEN_FILE_BONUS
			add  eax,edx
			mov  rdx,r8
			and  rdx,r14
			cmp  rdx,1
			sbb  edx,edx
			and  edx,ROOK_OPEN_FILE_BONUS-ROOK_SEMI_OPEN_FILE_BONUS
			add  eax,edx
			mov  esi,ecx
			shr  esi,3
			sub  esi,1
			cmp  esi,1
			sbb  edx,edx
			and  edx,ROOK_ON_SEVENTH_BONUS
			add  eax,edx
			bsf  rcx,rbx
			jnz  .WhiteRooks
    .WhiteRooksDone:
			mov  rbx,[rbp+STATE.BROOKS]
			bsf  rcx,rbx
			 jz  .BlackRooksDone
    .BlackRooks:	mov  esi,ecx
		      _blsr  rbx,rbx,r8
			and  esi,7
			xor  r8,r8
			bts  r8,rsi
		       imul  r8,r9
			mov  rdx,r8
			and  rdx,qword[rbp+STATE.BPAWNS]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,ROOK_SEMI_OPEN_FILE_BONUS
			sub  eax,edx
			mov  rdx,r8
			and  rdx,r14
			cmp  rdx,1
			sbb  edx,edx
			and  edx,ROOK_OPEN_FILE_BONUS-ROOK_SEMI_OPEN_FILE_BONUS
			sub  eax,edx
			mov  esi,ecx
			shr  esi,3
			sub  esi,6
			cmp  esi,1
			sbb  edx,edx
			sub  edx,ROOK_ON_SEVENTH_BONUS
			sub  eax,edx
			bsf  rcx,rbx
			jnz  .BlackRooks
    .BlackRooksDone:



		; king


;;;;;;;;;;;;;;;;;;;;;;;;;;;; white king ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

			mov  r9,0x0101010101010101
			bsf  rcx,qword[rbp+STATE.WKING]
			cmp  word[rbp+STATE.BMSCORE],1200
			jbe  .WhiteKingEndGame
    .WhiteKingMidGame:
		      movsx  edx,byte[WhiteKingPosBonus+rcx]
			add  eax,edx
			xor  edi,edi
			mov  esi,ecx
			and  esi,7
			cmp  esi,3
			 jb  .WhiteKingQueenSide
			cmp  esi,4
			 ja  .WhiteKingKingSide

	.WhiteKingMiddle:
			sub  esi,1
    repeat 3
			xor  r8,r8
			bts  r8,rsi
		       imul  r8,r9
			mov  rdx,r14
			and  rdx,r8
			cmp  rdx,1
			sbb  edx,edx
			and  edx,KING_NEAR_OPEN_FILE_PENALTY
			add  edi,edx
			add  esi,1
    end repeat
		      movzx  edx,word[rbp+STATE.BMSCORE]
		       imul  edi,edx
			shr  edi,13
			sub  eax,edi
			jmp  .WhiteKingDone

	.WhiteKingKingSide:

			xor  edx,edx
			mov  r8,((1 shl SQUARE_F1) + (1 shl SQUARE_F2) + (1 shl SQUARE_F3) + (1 shl SQUARE_F4) + (1 shl SQUARE_F5) + (1 shl SQUARE_F6) + (1 shl SQUARE_F7) + (1 shl SQUARE_F8))
			mov  r9,qword[rbp+STATE.WPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  edx,edx
			bsr  edx,r10d

			mov  r8,((1 shl SQUARE_F1) + (1 shl SQUARE_F2) + (1 shl SQUARE_F3) + (1 shl SQUARE_F4) + (1 shl SQUARE_F5) + (1 shl SQUARE_F6) + (1 shl SQUARE_F7) + (1 shl SQUARE_F8))
			mov  r9,qword[rbp+STATE.BPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  ebx,ebx
			bsf  ebx,r10d
		      movzx  edx,byte[WhiteKingPawnPenalty+rdx+8*rbx]
			shr  edx,1
			add  edi,edx

			xor  edx,edx
			mov  r8,((1 shl SQUARE_G1) + (1 shl SQUARE_G2) + (1 shl SQUARE_G3) + (1 shl SQUARE_G4) + (1 shl SQUARE_G5) + (1 shl SQUARE_G6) + (1 shl SQUARE_G7) + (1 shl SQUARE_G8))
			mov  r9,qword[rbp+STATE.WPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  edx,edx
			bsr  edx,r10d

			mov  r8,((1 shl SQUARE_G1) + (1 shl SQUARE_G2) + (1 shl SQUARE_G3) + (1 shl SQUARE_G4) + (1 shl SQUARE_G5) + (1 shl SQUARE_G6) + (1 shl SQUARE_G7) + (1 shl SQUARE_G8))
			mov  r9,qword[rbp+STATE.BPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  ebx,ebx
			bsf  ebx,r10d
		      movzx  edx,byte[WhiteKingPawnPenalty+rdx+8*rbx]
			add  edi,edx

			xor  edx,edx
			mov  r8,((1 shl SQUARE_H1) + (1 shl SQUARE_H2) + (1 shl SQUARE_H3) + (1 shl SQUARE_H4) + (1 shl SQUARE_H5) + (1 shl SQUARE_H6) + (1 shl SQUARE_H7) + (1 shl SQUARE_H8))
			mov  r9,qword[rbp+STATE.WPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  edx,edx
			bsr  edx,r10d

			mov  r8,((1 shl SQUARE_H1) + (1 shl SQUARE_H2) + (1 shl SQUARE_H3) + (1 shl SQUARE_H4) + (1 shl SQUARE_H5) + (1 shl SQUARE_H6) + (1 shl SQUARE_H7) + (1 shl SQUARE_H8))
			mov  r9,qword[rbp+STATE.BPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  ebx,ebx
			bsf  ebx,r10d
		      movzx  edx,byte[WhiteKingPawnPenalty+rdx+8*rbx]
			add  edi,edx

		      movzx  edx,word[rbp+STATE.BMSCORE]
		       imul  edi,edx
			lea  edi,[3*rdi]
			shr  edi,13
			sub  eax,edi
			jmp  .WhiteKingDone

	.WhiteKingQueenSide:

			xor  edx,edx
			mov  r8,((1 shl SQUARE_C1) + (1 shl SQUARE_C2) + (1 shl SQUARE_C3) + (1 shl SQUARE_C4) + (1 shl SQUARE_C5) + (1 shl SQUARE_C6) + (1 shl SQUARE_C7) + (1 shl SQUARE_C8))
			mov  r9,qword[rbp+STATE.WPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  edx,edx
			bsr  edx,r10d

			mov  r8,((1 shl SQUARE_C1) + (1 shl SQUARE_C2) + (1 shl SQUARE_C3) + (1 shl SQUARE_C4) + (1 shl SQUARE_C5) + (1 shl SQUARE_C6) + (1 shl SQUARE_C7) + (1 shl SQUARE_C8))
			mov  r9,qword[rbp+STATE.BPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  ebx,ebx
			bsf  ebx,r10d
		      movzx  edx,byte[WhiteKingPawnPenalty+rdx+8*rbx]
			shr  edx,1
			add  edi,edx

			xor  edx,edx
			mov  r8,((1 shl SQUARE_B1) + (1 shl SQUARE_B2) + (1 shl SQUARE_B3) + (1 shl SQUARE_B4) + (1 shl SQUARE_B5) + (1 shl SQUARE_B6) + (1 shl SQUARE_B7) + (1 shl SQUARE_B8))
			mov  r9,qword[rbp+STATE.WPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  edx,edx
			bsr  edx,r10d

			mov  r8,((1 shl SQUARE_B1) + (1 shl SQUARE_B2) + (1 shl SQUARE_B3) + (1 shl SQUARE_B4) + (1 shl SQUARE_B5) + (1 shl SQUARE_B6) + (1 shl SQUARE_B7) + (1 shl SQUARE_B8))
			mov  r9,qword[rbp+STATE.BPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  ebx,ebx
			bsf  ebx,r10d
		      movzx  edx,byte[WhiteKingPawnPenalty+rdx+8*rbx]
			add  edi,edx

			xor  edx,edx
			mov  r8,((1 shl SQUARE_A1) + (1 shl SQUARE_A2) + (1 shl SQUARE_A3) + (1 shl SQUARE_A4) + (1 shl SQUARE_A5) + (1 shl SQUARE_A6) + (1 shl SQUARE_A7) + (1 shl SQUARE_A8))
			mov  r9,qword[rbp+STATE.WPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  edx,edx
			bsr  edx,r10d

			mov  r8,((1 shl SQUARE_A1) + (1 shl SQUARE_A2) + (1 shl SQUARE_A3) + (1 shl SQUARE_A4) + (1 shl SQUARE_A5) + (1 shl SQUARE_A6) + (1 shl SQUARE_A7) + (1 shl SQUARE_A8))
			mov  r9,qword[rbp+STATE.BPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  ebx,ebx
			bsf  ebx,r10d
		      movzx  edx,byte[WhiteKingPawnPenalty+rdx+8*rbx]
			add  edi,edx

		      movzx  edx,word[rbp+STATE.BMSCORE]
		       imul  edi,edx
			lea  edi,[3*rdi]
			shr  edi,13
			sub  eax,edi
			jmp  .WhiteKingDone



    .WhiteKingEndGame:
		      movsx  edx,byte[KingEndPosBonus+rcx]
			add  eax,edx
    .WhiteKingDone:





;;;;;;;;;;;;;;;;;;;;;;; black king ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

			bsf  rcx,qword[rbp+STATE.BKING]
			cmp  word[rbp+STATE.WMSCORE],1200
			jbe  .BlackKingEndGame
    .BlackKingMidGame:
		      movsx  edx,byte[BlackKingPosBonus+rcx]
			sub  eax,edx
			xor  edi,edi
			mov  esi,ecx
			and  esi,7
			cmp  esi,3
			 jb  .BlackKingQueenSide
			cmp  esi,4
			 ja  .BlackKingKingSide

	.BlackKingMiddle:
			sub  esi,1
    repeat 3
			xor  r8,r8
			bts  r8,rsi
		       imul  r8,r9
			mov  rdx,r14
			and  rdx,r8
			cmp  rdx,1
			sbb  edx,edx
			and  edx,KING_NEAR_OPEN_FILE_PENALTY
			add  edi,edx
			add  esi,1
    end repeat
		      movzx  edx,word[rbp+STATE.WMSCORE]
		       imul  edi,edx
			shr  edi,13
			add  eax,edi
			jmp  .BlackKingDone

	.BlackKingKingSide:

			xor  edx,edx
			mov  r8,((1 shl SQUARE_F1) + (1 shl SQUARE_F2) + (1 shl SQUARE_F3) + (1 shl SQUARE_F4) + (1 shl SQUARE_F5) + (1 shl SQUARE_F6) + (1 shl SQUARE_F7) + (1 shl SQUARE_F8))
			mov  r9,qword[rbp+STATE.BPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  edx,edx
			bsf  edx,r10d

			mov  r8,((1 shl SQUARE_F1) + (1 shl SQUARE_F2) + (1 shl SQUARE_F3) + (1 shl SQUARE_F4) + (1 shl SQUARE_F5) + (1 shl SQUARE_F6) + (1 shl SQUARE_F7) + (1 shl SQUARE_F8))
			mov  r9,qword[rbp+STATE.WPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  ebx,ebx
			bsr  ebx,r10d
		      movzx  edx,byte[BlackKingPawnPenalty+rdx+8*rbx]
			shr  edx,1
			add  edi,edx

			xor  edx,edx
			mov  r8,((1 shl SQUARE_G1) + (1 shl SQUARE_G2) + (1 shl SQUARE_G3) + (1 shl SQUARE_G4) + (1 shl SQUARE_G5) + (1 shl SQUARE_G6) + (1 shl SQUARE_G7) + (1 shl SQUARE_G8))
			mov  r9,qword[rbp+STATE.BPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  edx,edx
			bsf  edx,r10d

			mov  r8,((1 shl SQUARE_G1) + (1 shl SQUARE_G2) + (1 shl SQUARE_G3) + (1 shl SQUARE_G4) + (1 shl SQUARE_G5) + (1 shl SQUARE_G6) + (1 shl SQUARE_G7) + (1 shl SQUARE_G8))
			mov  r9,qword[rbp+STATE.WPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  ebx,ebx
			bsr  ebx,r10d
		      movzx  edx,byte[BlackKingPawnPenalty+rdx+8*rbx]
			add  edi,edx

			xor  edx,edx
			mov  r8,((1 shl SQUARE_H1) + (1 shl SQUARE_H2) + (1 shl SQUARE_H3) + (1 shl SQUARE_H4) + (1 shl SQUARE_H5) + (1 shl SQUARE_H6) + (1 shl SQUARE_H7) + (1 shl SQUARE_H8))
			mov  r9,qword[rbp+STATE.BPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  edx,edx
			bsf  edx,r10d

			mov  r8,((1 shl SQUARE_H1) + (1 shl SQUARE_H2) + (1 shl SQUARE_H3) + (1 shl SQUARE_H4) + (1 shl SQUARE_H5) + (1 shl SQUARE_H6) + (1 shl SQUARE_H7) + (1 shl SQUARE_H8))
			mov  r9,qword[rbp+STATE.WPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  ebx,ebx
			bsr  ebx,r10d
		      movzx  edx,byte[BlackKingPawnPenalty+rdx+8*rbx]
			add  edi,edx

		      movzx  edx,word[rbp+STATE.WMSCORE]
		       imul  edi,edx
			lea  edi,[3*rdi]
			shr  edi,13
			add  eax,edi
			jmp  .BlackKingDone

	.BlackKingQueenSide:

			xor  edx,edx
			mov  r8,((1 shl SQUARE_C1) + (1 shl SQUARE_C2) + (1 shl SQUARE_C3) + (1 shl SQUARE_C4) + (1 shl SQUARE_C5) + (1 shl SQUARE_C6) + (1 shl SQUARE_C7) + (1 shl SQUARE_C8))
			mov  r9,qword[rbp+STATE.BPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  edx,edx
			bsf  edx,r10d

			mov  r8,((1 shl SQUARE_C1) + (1 shl SQUARE_C2) + (1 shl SQUARE_C3) + (1 shl SQUARE_C4) + (1 shl SQUARE_C5) + (1 shl SQUARE_C6) + (1 shl SQUARE_C7) + (1 shl SQUARE_C8))
			mov  r9,qword[rbp+STATE.WPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  ebx,ebx
			bsr  ebx,r10d
		      movzx  edx,byte[BlackKingPawnPenalty+rdx+8*rbx]
			shr  edx,1
			add  edi,edx

			xor  edx,edx
			mov  r8,((1 shl SQUARE_B1) + (1 shl SQUARE_B2) + (1 shl SQUARE_B3) + (1 shl SQUARE_B4) + (1 shl SQUARE_B5) + (1 shl SQUARE_B6) + (1 shl SQUARE_B7) + (1 shl SQUARE_B8))
			mov  r9,qword[rbp+STATE.BPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  edx,edx
			bsf  edx,r10d

			mov  r8,((1 shl SQUARE_B1) + (1 shl SQUARE_B2) + (1 shl SQUARE_B3) + (1 shl SQUARE_B4) + (1 shl SQUARE_B5) + (1 shl SQUARE_B6) + (1 shl SQUARE_B7) + (1 shl SQUARE_B8))
			mov  r9,qword[rbp+STATE.WPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  ebx,ebx
			bsr  ebx,r10d
		      movzx  edx,byte[BlackKingPawnPenalty+rdx+8*rbx]
			add  edi,edx

			xor  edx,edx
			mov  r8,((1 shl SQUARE_A1) + (1 shl SQUARE_A2) + (1 shl SQUARE_A3) + (1 shl SQUARE_A4) + (1 shl SQUARE_A5) + (1 shl SQUARE_A6) + (1 shl SQUARE_A7) + (1 shl SQUARE_A8))
			mov  r9,qword[rbp+STATE.BPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  edx,edx
			bsf  edx,r10d

			mov  r8,((1 shl SQUARE_A1) + (1 shl SQUARE_A2) + (1 shl SQUARE_A3) + (1 shl SQUARE_A4) + (1 shl SQUARE_A5) + (1 shl SQUARE_A6) + (1 shl SQUARE_A7) + (1 shl SQUARE_A8))
			mov  r9,qword[rbp+STATE.WPAWNS]
		      _pext  r10,r9,r8,r11,r12,r13
			xor  ebx,ebx
			bsr  ebx,r10d
		      movzx  edx,byte[BlackKingPawnPenalty+rdx+8*rbx]
			add  edi,edx

		      movzx  edx,word[rbp+STATE.WMSCORE]
		       imul  edi,edx
			lea  edi,[3*rdi]
			shr  edi,13
			add  eax,edi
			jmp  .BlackKingDone




    .BlackKingEndGame:
		      movsx  edx,byte[KingEndPosBonus+rcx]
			sub  eax,edx
    .BlackKingDone:















		; adjust score for side to move
		      movsx  edx,byte[rbp+STATE.SIDE]
			xor  eax,edx
			sub  eax,edx


.Done:
			add  rsp,8*2

			pop  r15 r14 r13 r12 rdi rsi rbx
			pop  rbp
			ret

