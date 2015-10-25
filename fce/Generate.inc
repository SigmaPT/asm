



		      align  16

PieceCoverage:	  ; in: rbp address of state STATE
		  ;     ecx side ( 0 for white 64 for black)
		  ; out: rax bitboard of white's coverage  or black's

		       push  rbp rdi rbx r15

; r15 = bitboard of all pieces
; rbx = address of our pieces
; rax = bitboard of king attacks
; rdi =  WhitePawnAttacks or BlackPawnAttacks

			lea  edi,[WhitePawnAttacks]
			lea  eax,[BlackPawnAttacks]
		       test  ecx,ecx
		     cmovnz  edi,eax

			mov  r15,qword[rbp+STATE.WPIECES]
			 or  r15,qword[rbp+STATE.BPIECES]
			bsf  rax,qword[rbp+rcx+8*KING]

			mov  rax,qword[KingAttacks+8*rax]
			lea  rbp,[rbp+rcx]		      ; POS.WPIECES      or POS.BPIECES

			mov  rdx,qword[rbp+8*PAWN]
			bsf  rbx,rdx
			 jz  .PawnDone
	.Pawn:	      _blsr  rdx,rdx,r8
			 or  rax,qword[rdi+8*rbx]
			bsf  rbx,rdx
			jnz  .Pawn
	.PawnDone:

			mov  rdx,qword[rbp+8*KNIGHT]
			bsf  rbx,rdx
			 jz  .KnightDone
	.Knight:      _blsr  rdx,rdx,r8
			 or  rax,qword[KnightAttacks+8*rbx]
			bsf  rbx,rdx
			jnz  .Knight
	.KnightDone:

			mov  rdx,qword[rbp+8*BISHOP]
			 or  rdx,qword[rbp+8*QUEEN]
			bsf  rbx,rdx
			 jz  .BishopDone
	.Bishop:      _blsr  rdx,rdx,r8
	      BishopAttacks  rdi,rbx,r15,r8
			 or  rax,rdi
			bsf  rbx,rdx
			jnz  .Bishop
	.BishopDone:

			mov  rdx,qword[rbp+8*ROOK]
			 or  rdx,qword[rbp+8*QUEEN]
			bsf  rbx,rdx
			 jz  .RookDone
	.Rook:	      _blsr  rdx,rdx,r8
		RookAttacks  rdi,rbx,r15,r8
			 or  rax,rdi
			bsf  rbx,rdx
			jnz  .Rook
	.RookDone:

			pop  r15 rbx rdi rbp
			ret




		      align  16

PinnedPieces:	  ; in: rbp address of position POS
		  ;     ecx our side ( 0 for white 64 for black)
		  ;     edx square
		  ; out: rax bitboard of pieces (of both colors) that
		  ;           when present block a sliding attack to edx
		  ;           but when removed allow our side to attack square edx by a sliding attack

		       push  rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]
		       push  rbx
; r11 = bitboard of all pieces
; rcx = address of our pieces
; rbx = bitboard of pinners on our side
			add  rcx,rbp
			xor  eax,eax
			mov  rbx,qword[rcx+8*ROOK]
			 or  rbx,qword[rcx+8*QUEEN]
			and  rbx,qword[RookAttacksPDEP+8*rdx]
			mov  r8,qword[rcx+8*BISHOP]
			 or  r8,qword[rcx+8*QUEEN]
			and  r8,qword[BishopAttacksPDEP+8*rdx]
			mov  r10,qword[rbp+STATE.WPIECES]
			 or  r10,qword[rbp+STATE.BPIECES]
			 or  rbx,r8
			jnz  .PinnedPieces
			pop  rbx
			pop  rbp
			ret

		      align  8
.PinnedPieces:
		; prepare square for between lookup
			shl  rdx,6+3
			lea  rdx,[BetweenMasks+rdx]
		; loop over pinned pieces
			bsf  rcx,rbx
    .NextPinner:	mov  rcx,[rdx+8*rcx]
		      _blsr  rbx,rbx,r9
			and  rcx,r10
		      _blsr  r8,rcx,r9
			neg  r8
			sbb  r8,r8
		      _andn  rcx,r8,rcx
			 or  rax,rcx
			bsf  rcx,rbx
			jnz  .NextPinner
			pop  rbx
			pop  rbp
			ret





		      align  16

AttackersTo:	  ; in: rbp position POS
		  ;     ecx our side ( 0 for white 64 for black)
		  ;     edx square
		  ; out: rax bitboard of pieces on our side that attack square edx

		       push  rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]
		       push  rdi rsi rbx

; rsi = bitboard of all pieces
; rcx = address of our pieces
; rdi =  BlackPawnAttacks or WhitePawnAttacks
			lea  edi,[WhitePawnAttacks]
			lea  eax,[BlackPawnAttacks]
		       test  ecx,ecx
		      cmovz  edi,eax
			mov  rsi,qword[rbp+STATE.WPIECES]
			 or  rsi,qword[rbp+STATE.BPIECES]
			add  rbp,rcx
	; king
			mov  rax,qword[KingAttacks+8*rdx]
			and  rax,qword[rbp+8*KING]
	; knight
			mov  rbx,qword[KnightAttacks+8*rdx]
			and  rbx,qword[rbp+8*KNIGHT]
			 or  rax,rbx
	; rook + queen
		RookAttacks  rbx,rdx,rsi,r8
			mov  r8,qword[rbp+8*ROOK]
			 or  r8,qword[rbp+8*QUEEN]
			and  rbx,r8
			 or  rax,rbx
	; bishop + queen
	      BishopAttacks  rbx,rdx,rsi,r8
			mov  r8,qword[rbp+8*BISHOP]
			 or  r8,qword[rbp+8*QUEEN]
			and  rbx,r8
			 or  rax,rbx
	; pawn
			mov  rbx,qword[rdi+8*rdx]
			and  rbx,qword[rbp+8*PAWN]
			 or  rax,rbx

			pop  rbx rsi rdi
			pop  rbp
			ret




		      align  16

AttackersTo_Boole:	; in: rbp position POS
			;     ecx our side ( 0 for white 64 for black)
			;     edx square
			; out: rax bitboard of some pieces on our side that attack square edx
			;            fxn returns as soon as rax is found to be non zero

		       push  rdi rsi rbx
			mov  rbx,[rbp+POS.CURR_STATE_PTR]

; rsi = bitboard of all pieces
; rbx = address of our pieces
; rdi =  BlackPawnAttacks or WhitePawnAttacks

			lea  edi,[WhitePawnAttacks]
			lea  eax,[BlackPawnAttacks]
		       test  ecx,ecx
		      cmovz  edi,eax

			mov  rsi,qword[rbx+STATE.WPIECES]
			 or  rsi,qword[rbx+STATE.BPIECES]
			add  rbx,rcx

	; king
			mov  rax,qword[KingAttacks+8*rdx]
			and  rax,qword[rbx+8*KING]
			jnz  .Return

	; knight
			mov  rax,qword[KnightAttacks+8*rdx]
			and  rax,qword[rbx+8*KNIGHT]
			jnz  .Return

	; pawn
			mov  rax,qword[rdi+8*rdx]
			and  rax,qword[rbx+8*PAWN]
			jnz  .Return

	; bishop + queen
	      BishopAttacks  rax,rdx,rsi,r8
			mov  r8,qword[rbx+8*BISHOP]
			 or  r8,qword[rbx+8*QUEEN]
			and  rax,r8
			jnz  .Return

	; rook + queen
		RookAttacks  rax,rdx,rsi,r8
			mov  r8,qword[rbx+8*ROOK]
			 or  r8,qword[rbx+8*QUEEN]
			and  rax,r8


	.Return:
			pop  rbx rsi rdi
			ret





		      align  16

Generate_Legal:
		       push  rbx rsi r12 r13 r14 r15 rdi

			mov  rbx,qword[rbp+POS.CURR_STATE_PTR]

; r15  = pinned pieces
; r14d = our king square
; r13d =  0 for white to move
;        64 for black to move

		      movzx  ecx,byte[rbx+STATE.SIDE]
			and  ecx,64
			mov  r13d,ecx
			bsf  rdx,qword[rbx+rcx+8*KING]
			mov  r14d,edx
			xor  ecx,64
		       call  PinnedPieces
			and  rax,qword[rbx+r13+8*0]
			mov  qword[rbx+STATE.PINNED],rax
			mov  r15,rax

		; fill in checkers
			mov  ecx,r13d
			mov  edx,r14d
			xor  ecx,64
		       call  AttackersTo
			mov  qword[rbx+STATE.CHECKERS],rax

		; generate moves
			mov  rsi,rdi
		       test  rax,rax
			jnz  .InCheck
	.NotInCheck:   call  Generate_NonEvasions
			jmp  .GenDone
	.InCheck:      call  Generate_Evasions
	.GenDone:	xor  ecx,ecx
			mov  qword[rdi],rcx
			mov  rdi,rsi

		; r10 = king bitboard
			xor  r11,r11
			bts  r11,r14
			jmp  .TestNext

		; remove illegal moves

	.Legal: 	mov  eax,r12d
		      stosd

	.Illegal:
	.TestNext:

		; load next move
		      lodsd
			mov  r12d,eax
		       test  eax,eax
			 jz  .TestDone

		; edx = move type
			mov  edx,eax
			shr  edx,12

		; ecx = source square
			mov  ecx,eax
			shr  ecx,6
			and  ecx,63

		; pseudo legal castling moves are always legal
			cmp  edx,MOVE_TYPE_OO
			 je  .Legal
			cmp  edx,MOVE_TYPE_OOO
			 je  .Legal

		; ep captures require special attention
			cmp  edx,MOVE_TYPE_EPCAP
			 je  .EpCapture

		; if we are moving king, have to check destination square
			cmp  ecx,r14d
			 je  .KingMove

		; if piece is not pinned, then move is legal
			 bt  r15,rcx
			jnc  .Legal

		; if something is pinned, its movement should be aligned with our king
			and  eax,((64*64)-1)
		       test  r11,qword[LineMasks+8*rax]
			jnz  .Legal
			jmp  .Illegal

		      align  8
	.TestDone:
			mov  rax,rdi
			pop  rdx
			sub  rax,rdx
			shr  eax,2

			pop  r15 r14 r13 r12 rsi rbx
			ret



		      align  8
		; if they have an attacker to king's destination square, then move is illegal
	.KingMove:
			mov  ecx,r13d
			xor  ecx,64
			mov  edx,r12d
			and  edx,63
		       call  AttackersTo_Boole
		       test  rax,rax
			 jz  .Legal
			jmp  .Illegal




		      align  8

; for ep captures, just make the move and test if our king is attacked
	.EpCapture:
	      ; reverse r13
			mov  r10d,r13d
			xor  r10d,64
			mov  r8d,r10d
			shr  r8d,2
	      ; all pieces
			mov  rdx,qword[rbx+STATE.WPIECES]
			 or  rdx,qword[rbx+STATE.BPIECES]
	      ; remove source square
			btr  rdx,rcx
	      ; add destination square (ep square)
			and  eax,63
			bts  rdx,rax
	      ; remove captured pawn
			lea  eax,[rax+r8-8]
			btr  rdx,rax
	      ; check for rook attacks
		RookAttacks  rax,r14,rdx,r8
			mov  r8,qword[rbx+r10+8*QUEEN]
			 or  r8,qword[rbx+r10+8*ROOK]
		       test  rax,r8
			jnz  .Illegal
	      ; check for bishop attacks
	      BishopAttacks  rax,r14,rdx,r8
			mov  r8,qword[rbx+r10+8*QUEEN]
			 or  r8,qword[rbx+r10+8*BISHOP]
		       test  rax,r8
			jnz  .Illegal
			jmp  .Legal







		      align  16

Generate_NonEvasions:	    ; in:    rbp address of position POSITION
			    ; inout: rdi address of psuedo legal move list
			    ; out:
			    ;     eax:  -1           if opposing king is attacked
			    ;           move count   otherwise

		       push  rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]
		       push  rsi rbx r12 r13 r14 r15 rdi

; r14 = bitboard of our pieces
; r15 = bitboard of all pieces
; r12 = address of our pieces
; r13 = address of their pieces
			mov  r15,qword[rbp+STATE.WPIECES]
			 or  r15,qword[rbp+STATE.BPIECES]
		      movzx  eax,byte[rbp+STATE.SIDE]
			and  eax,64
			lea  r12,[rbp+rax]
			xor  eax,64
			lea  r13,[rbp+rax]
			mov  r14,qword[r12+8*0]

; loop through rook moves


			mov  rsi,qword[r12+8*ROOK]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rbx,rsi
			 jz  .RookDone
    .Rook:	RookAttacks  rdx,rbx,r15,r8
		      _andn  rdx,r14,rdx
		      _blsr  rsi,rsi,r8
			shl  ebx,6
			bsf  rax,rdx
			 jz  .RookMoveDone
    .RookMove:	      _blsr  rdx,rdx,r8
			 or  eax,ebx			  ; source square
		      stosd
			bsf  rax,rdx
			jnz  .RookMove
    .RookMoveDone:	bsf  rbx,rsi
			jnz  .Rook
    .RookDone:



; loop through bishop moves
			mov  rsi,qword[r12+8*BISHOP]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rbx,rsi
			 jz  .BishopDone
    .Bishop:  BishopAttacks  rdx,rbx,r15,r8
		      _andn  rdx,r14,rdx
		      _blsr  rsi,rsi,r8
			shl  ebx,6
			bsf  rax,rdx
			 jz  .BishopMoveDone
    .BishopMove:      _blsr  rdx,rdx,r8
			 or  eax,ebx			  ; source square
		      stosd
			bsf  rax,rdx
			jnz  .BishopMove
    .BishopMoveDone:	bsf  rbx,rsi
			jnz  .Bishop
    .BishopDone:



; loop through knight moves
			mov  rsi,qword[r12+8*KNIGHT]
			bsf  rcx,rsi
			 jz  .KnightDone
    .Knight:	      _andn  rdx,r14,qword[KnightAttacks+8*rcx]
		      _blsr  rsi,rsi,r8
			shl  ecx,6
			bsf  rax,rdx
			 jz  .KnightMoveDone
    .KnightMove:      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosd
			bsf  rax,rdx
			jnz  .KnightMove
    .KnightMoveDone:	bsf  rcx,rsi
			jnz  .Knight
    .KnightDone:



; loop through king moves
			bsf  rcx,qword[r12+8*KING]
    .King:	      _andn  rdx,r14,qword[KingAttacks+8*rcx]
			shl  ecx,6
			bsf  rax,rdx
			 jz  .KingMoveDone
    .KingMove:	      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosd
			bsf  rax,rdx
			jnz  .KingMove
    .KingMoveDone:

; check castling

;jmp .Done

		      movzx  r11d,byte[rbp+STATE.SIDE]
			and  r11d,3
			add  r11d,1
		      movzx  ebx,byte[rbp+STATE.SIDE]
			and  ebx,4

	       .OO:	xor  esi,esi
		       test  r11l,byte[rbp+STATE.CASTLING]
			 jz  .OOO
		       test  r15,qword[CastlingOOClear+2*rbx]
			jnz  .OOO
		      movzx  ecx,byte[rbp+STATE.XSIDE]
			and  ecx,64
		       call  PieceCoverage
			mov  rsi,rax
		       test  rax,qword[CastlingOOCheck+2*rbx]
			jnz  .OOO
			mov  eax,dword[CastlingOOMove+rbx]
		      stosd

	       .OOO:	shl  r11d,1
		       test  r11l,byte[rbp+STATE.CASTLING]
			 jz  .KingDone
		       test  r15,qword[CastlingOOOClear+2*rbx]
			jnz  .KingDone
			mov  rax,rsi
		      movzx  ecx,byte[rbp+STATE.XSIDE]
			and  ecx,64
		       test  rsi,rsi
			jnz  @f
		       call  PieceCoverage
		@@:    test  rax,qword[CastlingOOOCheck+2*rbx]
			jnz  .KingDone
			mov  eax,dword[CastlingOOOMove+rbx]
		      stosd
    .KingDone:



; loop through pawn moves

; WhitePawnAttacks + r11 = WhitePawnAttacks   if white to move
; WhitePawnAttacks + r11 = BlackPawnAttacks   if black to move



		      movsx  r11,byte[rbp+STATE.SIDE]
			and  r11,BlackPawnAttacks-WhitePawnAttacks
			mov  rsi,qword[r12+8*PAWN]
			mov  r9,qword[WhitePawnPromRank+r11]
			mov  r10,qword[rbp+STATE.EPSQUARE]
			bsf  rcx,rsi
			 jz  .PawnDone

    .Pawn:	      _andn  rdx,r14,qword[WhitePawnAttacks+r11+8*rcx]
		      _blsr  rsi,rsi,r8
			mov  rax,qword[r13+8*0]
			 or  rax,r10

			and  rdx,rax
		      _andn  rax,r15,qword[WhitePawnMoves+r11+8*rcx]
			 or  rdx,rax

			shl  ecx,6
			bsf  rbx,rdx
			 jz  .PawnMoveDone

    .PawnMove:	      _blsr  rdx,rdx,r8
			mov  eax,ebx		    ; destination square
			 or  eax,ecx		    ; source square
			 bt  r9,rbx
			 jc  .Promotion
	  ; ep capture ?
			 bt  r10,rbx
			sbb  r8d,r8d
			and  r8d,(MOVE_TYPE_EPCAP shl 12)
			 or  eax,r8d
      .NormalPawnMove:
		      stosd
			jmp  @f

      .Promotion:	 or  eax,(MOVE_TYPE_PROM shl 12) + (3 shl 12)
		      stosd
			sub  eax,(1 shl 12)	    ; rook promotion
		      stosd
			sub  eax,(1 shl 12)	    ; bishop promotion
		      stosd
			sub  eax,(1 shl 12)	    ; knight promotion
		      stosd

	 @@:		bsf  rbx,rdx
			jnz  .PawnMove
    .PawnMoveDone:	bsf  rcx,rsi
			jnz  .Pawn
    .PawnDone:



; loop through double pawn moves
			mov  edx,16
		      movsx  eax,byte[rbp+STATE.SIDE]
			xor  edx,eax
			sub  edx,eax
			mov  rax,r15
			mov  rsi,qword[WhitePawnHomeRank+r11]
			and  rsi,qword[r12+8*PAWN]
			cmp  byte[rbp+STATE.SIDE],0
			jne  .BlackPawnDouble
    .WhitePawnDouble:	shl  rax,8
			 or  rax,r15
			shl  rax,8
			jmp  @f
    .BlackPawnDouble:	shr  rax,8
			 or  rax,r15
			shr  rax,8
		   @@:
		      _andn  rsi,rax,rsi
			bsf  rcx,rsi
			 jz  .PawnDoubleMoveDone
    .PawnDoubleMove:   imul  eax,ecx,65
		      _blsr  rsi,rsi,r8
			sub  eax,edx
			 or  eax,(MOVE_TYPE_DPAWN shl 12)
		      stosd
			bsf  rcx,rsi
			jnz  .PawnDoubleMove
    .PawnDoubleMoveDone:



; finished generating moves
    .Done:		mov  rax,rdi
			pop  rdx
			sub  rax,rdx
			shr  eax,2
			pop  r15 r14 r13 r12 rbx rsi
			pop  rbp
			ret








		      align  16

Generate_Evasions:
		       push  rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]
		       push  rsi rbx r12 r13 r14 r15 rdi

; ecx = side (0 or 64)
		      movzx  ecx,byte[rbp+STATE.SIDE]
			and  ecx,64

; r14 = our king square
			bsf  r14,qword[rbp+rcx+8*KING]

; rsi = their sliding checkers
			xor  ecx,64
			mov  rsi,qword[rbp+rcx+8*PAWN]
			 or  rsi,qword[rbp+rcx+8*KNIGHT]
		      _andn  rsi,rsi,qword[rbp+STATE.CHECKERS]

; rbx = slider attacks
			mov  r9,r14
			shl  r9,6+3
			xor  ebx,ebx
			bsf  rdx,rsi
			 jz  .SlidersDone
    .NextSlider:      _blsr  rsi,rsi,r8
			mov  rax,[LineMasks+r9+8*rdx]
			btr  rax,rdx
			 or  rbx,rax
			bsf  rdx,rsi
			jnz  .NextSlider
    .SlidersDone:

; generate moves for the king to safe squares

			xor  ecx,64
			mov  rsi,qword[rbp+rcx+8*0]
		      _andn  rsi,rsi,qword[KingAttacks+8*r14]
		      _andn  rbx,rbx,rsi
			mov  ecx,r14d
			shl  ecx,6
			bsf  rdx,rbx
			 jz  .KingMoveDone
    .NextKingMove:    _blsr  rbx,rbx,r8
			mov  eax,edx			  ; destination square
			 or  eax,ecx			  ; source square
		      stosd
			bsf  rdx,rbx
			jnz  .NextKingMove
    .KingMoveDone:

; if there are multiple checkers, only king moves can be evasions
			mov  r10,qword[rbp+STATE.CHECKERS]
		      _blsr  rax,r10
			jnz  .Done

; r14 = bitboard of places to block check
			bsf  rax,r10
			mov  r14,qword[BetweenMasks+r9+8*rax]
			 or  r14,r10

; r15 = bitboard of all pieces
; r12 = address of our pieces
; r13 = address of their pieces
			mov  r15,qword[rbp+STATE.WPIECES]
			 or  r15,qword[rbp+STATE.BPIECES]
		      movzx  eax,byte[rbp+STATE.SIDE]
			and  eax,64
			lea  r12,[rbp+rax]
			xor  eax,64
			lea  r13,[rbp+rax]

; loop through rook moves
			mov  rsi,qword[r12+8*ROOK]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rbx,rsi
			 jz  .RookDone
    .Rook:	RookAttacks  rdx,rbx,r15,r8
			and  rdx,r14
		      _blsr  rsi,rsi,r8
			shl  ebx,6
			bsf  rax,rdx
			 jz  .RookMoveDone
    .RookMove:	      _blsr  rdx,rdx,r8
			 or  eax,ebx			  ; source square
		      stosd
			bsf  rax,rdx
			jnz  .RookMove
    .RookMoveDone:	bsf  rbx,rsi
			jnz  .Rook
    .RookDone:


; loop through bishop moves
			mov  rsi,qword[r12+8*BISHOP]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rbx,rsi
			 jz  .BishopDone
    .Bishop:  BishopAttacks  rdx,rbx,r15,r8
			and  rdx,r14
		      _blsr  rsi,rsi,r8
			shl  ebx,6
			bsf  rax,rdx
			 jz  .BishopMoveDone
    .BishopMove:      _blsr  rdx,rdx,r8
			 or  eax,ebx			  ; source square
		      stosd
			bsf  rax,rdx
			jnz  .BishopMove
    .BishopMoveDone:	bsf  rbx,rsi
			jnz  .Bishop
    .BishopDone:


; loop through knight moves
			mov  rsi,qword[r12+8*KNIGHT]
			bsf  rcx,rsi
			 jz  .KnightDone
    .Knight:		mov  rdx,qword[KnightAttacks+8*rcx]
			and  rdx,r14
		      _blsr  rsi,rsi,r8
			shl  ecx,6
			bsf  rbx,rdx
			 jz  .KnightMoveDone
    .KnightMove:	mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosd
			bsf  rbx,rdx
			jnz  .KnightMove
    .KnightMoveDone:	bsf  rcx,rsi
			jnz  .Knight
    .KnightDone:



; loop through pawn moves

; WhitePawnAttacks + r11 = WhitePawnAttacks   if white to move
; WhitePawnAttacks + r11 = BlackPawnAttacks   if black to move

		      movsx  r11,byte[rbp+STATE.SIDE]
			and  r11,BlackPawnAttacks-WhitePawnAttacks

			bsf  rax,qword[r12+8*KING]
			mov  rax,qword[WhitePawnAttacks+r11+8*rax]
			and  rax,qword[r13+8*PAWN]
			neg  rax
			sbb  r9,r9
			and  r9,qword[rbp+STATE.EPSQUARE]

			mov  rsi,qword[r12+8*PAWN]
			bsf  rcx,rsi
			 jz  .PawnDone
    .Pawn:		mov  rax,qword[WhitePawnAttacks+r11+8*rcx]
			mov  rdx,qword[r13+8*0]
		      _blsr  rsi,rsi,r8
			and  rdx,r14
			and  rdx,rax
			and  rax,r9
			 or  rdx,rax
		      _andn  rax,r15,qword[WhitePawnMoves+r11+8*rcx]
			and  rax,r14
			 or  rdx,rax

			shl  ecx,6
			bsf  rbx,rdx
			 jz  .PawnMoveDone
    .PawnMove:	      _blsr  rdx,rdx,r8
			mov  eax,ebx		    ; destination square
			 or  eax,ecx		    ; source square
			 bt  qword[WhitePawnPromRank+r11],rbx
			 jc  .Promotion
	  ; ep capture ?
			 bt  qword[rbp+STATE.EPSQUARE],rbx
			sbb  r8d,r8d
			and  r8d,(MOVE_TYPE_EPCAP shl 12)
			 or  eax,r8d
      .NormalPawnMove:
		      stosd
			jmp  @f

      .Promotion:	 or  eax,(MOVE_TYPE_PROM shl 12) + (3 shl 12)
		      stosd
			sub  eax,(1 shl 12)	    ; rook promotion
		      stosd
			sub  eax,(1 shl 12)	    ; bishop promotion
		      stosd
			sub  eax,(1 shl 12)	    ; knight promotion
		      stosd

	 @@:		bsf  rbx,rdx
			jnz  .PawnMove
    .PawnMoveDone:	bsf  rcx,rsi
			jnz  .Pawn
    .PawnDone:



; loop through double pawn moves

			mov  edx,16
		      movsx  eax,byte[rbp+STATE.SIDE]
			xor  edx,eax
			sub  edx,eax
			mov  rax,r14
			not  rax
			 or  rax,r15
			mov  rsi,qword[WhitePawnHomeRank+r11]
			and  rsi,qword[r12+8*PAWN]
			cmp  byte[rbp+STATE.SIDE],0
			jne  .BlackPawnDouble
    .WhitePawnDouble:	shl  rax,8
			 or  rax,r15
			shl  rax,8
			jmp  @f
    .BlackPawnDouble:	shr  rax,8
			 or  rax,r15
			shr  rax,8
		@@:   _andn  rsi,rax,rsi
			bsf  rcx,rsi
			 jz  .PawnDoubleMoveDone
    .PawnDoubleMove:   imul  eax,ecx,65
		      _blsr  rsi,rsi,r8
			sub  eax,edx
			 or  eax,(MOVE_TYPE_DPAWN shl 12)
		      stosd
			bsf  rcx,rsi
			jnz  .PawnDoubleMove
    .PawnDoubleMoveDone:



; finished generating moves
    .Done:		mov  rax,rdi
			pop  rdx
			sub  rax,rdx
			shr  eax,2
			pop  r15 r14 r13 r12 rbx rsi
			pop  rbp
			ret


















		      align  16

Generate_PseudoLegal:	    ; in:    rbp address of position POSITION
			    ; inout: rdi address of psuedo legal move list
			    ; out:
			    ;     eax:  -1           if opposing king is attacked
			    ;           move count   otherwise

		       push  rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]
		       push  rsi rbx r12 r13 r14 r15 rdi

; r14 = bitboard of our pieces
; r15 = bitboard of all pieces
; r12 = address of our pieces
; r13 = address of their pieces
			mov  r15,qword[rbp+STATE.WPIECES]
			 or  r15,qword[rbp+STATE.BPIECES]
		      movzx  eax,byte[rbp+STATE.SIDE]
			and  eax,64
			lea  r12,[rbp+rax]
			xor  eax,64
			lea  r13,[rbp+rax]
			mov  r14,qword[r12+8*0]

; loop through rook moves
			mov  rsi,qword[r12+8*ROOK]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rbx,rsi
			 jz  .RookDone
    .Rook:	RookAttacks  rdx,rbx,r15,r8
		      _andn  rdx,r14,rdx
		      _blsr  rsi,rsi,r8
			shl  ebx,6
			bsf  rax,rdx
			 jz  .RookMoveDone
    .RookMove:	      _blsr  rdx,rdx,r8
			 or  eax,ebx			  ; source square
		      stosq
			bsf  rax,rdx
			jnz  .RookMove
    .RookMoveDone:	bsf  rbx,rsi
			jnz  .Rook
    .RookDone:



; loop through bishop moves
			mov  rsi,qword[r12+8*BISHOP]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rbx,rsi
			 jz  .BishopDone
    .Bishop:  BishopAttacks  rdx,rbx,r15,r8
		      _andn  rdx,r14,rdx
		      _blsr  rsi,rsi,r8
			shl  ebx,6
			bsf  rax,rdx
			 jz  .BishopMoveDone
    .BishopMove:      _blsr  rdx,rdx,r8
			 or  eax,ebx
		      stosq
			bsf  rax,rdx
			jnz  .BishopMove
    .BishopMoveDone:	bsf  rbx,rsi
			jnz  .Bishop
    .BishopDone:



; loop through knight moves
			mov  rsi,qword[r12+8*KNIGHT]
			bsf  rcx,rsi
			 jz  .KnightDone
    .Knight:	      _andn  rdx,r14,qword[KnightAttacks+8*rcx]
		      _blsr  rsi,rsi,r8
			shl  ecx,6
			bsf  rax,rdx
			 jz  .KnightMoveDone
    .KnightMove:      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosq
			bsf  rax,rdx
			jnz  .KnightMove
    .KnightMoveDone:	bsf  rcx,rsi
			jnz  .Knight
    .KnightDone:



; loop through king moves
			bsf  rcx,qword[r12+8*KING]
		  assert_nz "no king in Generate_PseudoLegal"
    .King:	      _andn  rdx,r14,qword[KingAttacks+8*rcx]
			shl  ecx,6
			bsf  rax,rdx
			 jz  .KingMoveDone
    .KingMove:	      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosq
			bsf  rax,rdx
			jnz  .KingMove
    .KingMoveDone:

; check castling
		      movzx  r11d,byte[rbp+STATE.SIDE]
			and  r11d,3
			add  r11d,1
		      movzx  ebx,byte[rbp+STATE.SIDE]
			and  ebx,4

	       .OO:	xor  esi,esi
		       test  r11l,byte[rbp+STATE.CASTLING]
			 jz  .OOO
		       test  r15,qword[CastlingOOClear+2*rbx]
			jnz  .OOO
		      movzx  ecx,byte[rbp+STATE.XSIDE]
			and  ecx,64
		       call  PieceCoverage
			mov  rsi,rax
		       test  rax,qword[CastlingOOCheck+2*rbx]
			jnz  .OOO
			mov  eax,dword[CastlingOOMove+rbx]
		      stosq

	       .OOO:	shl  r11d,1
		       test  r11l,byte[rbp+STATE.CASTLING]
			 jz  .KingDone
		       test  r15,qword[CastlingOOOClear+2*rbx]
			jnz  .KingDone
			mov  rax,rsi
		      movzx  ecx,byte[rbp+STATE.XSIDE]
			and  ecx,64
		       test  rsi,rsi
			jnz  @f
		       call  PieceCoverage
		@@:    test  rax,qword[CastlingOOOCheck+2*rbx]
			jnz  .KingDone
			mov  eax,dword[CastlingOOOMove+rbx]
		      stosq
    .KingDone:



; loop through pawn moves

; WhitePawnAttacks + r11 = WhitePawnAttacks   if white to move
; WhitePawnAttacks + r11 = BlackPawnAttacks   if black to move

		      movsx  r11,byte[rbp+STATE.SIDE]
			and  r11,BlackPawnAttacks-WhitePawnAttacks
			mov  rsi,qword[r12+8*PAWN]
			mov  r9,qword[WhitePawnPromRank+r11]
			mov  r10,qword[rbp+STATE.EPSQUARE]
			bsf  rcx,rsi
			 jz  .PawnDone
    .Pawn:		mov  rdx,qword[r13+8*0]
			 or  rdx,r10
			and  rdx,qword[WhitePawnAttacks+r11+8*rcx]
		      _blsr  rsi,rsi,r8
		      _andn  rax,r15,qword[WhitePawnMoves+r11+8*rcx]
			 or  rdx,rax
			shl  ecx,6
			bsf  rbx,rdx
			 jz  .PawnMoveDone
    .PawnMove:	      _blsr  rdx,rdx,r8
			mov  eax,ebx		    ; destination square
			 or  eax,ecx		    ; source square
			 bt  r9,rbx
			 jc  .Promotion
	  ; ep capture ?
			 bt  r10,rbx
			sbb  r8d,r8d
			and  r8d,(MOVE_TYPE_EPCAP shl 12)
			 or  eax,r8d
      .NormalPawnMove:
		      stosq
			jmp  @f

      .Promotion:	 or  eax,(MOVE_TYPE_PROM shl 12) + (3 shl 12)
		      stosq
			sub  eax,(1 shl 12)	    ; rook promotion
		      stosq
			sub  eax,(1 shl 12)	    ; bishop promotion
		      stosq
			sub  eax,(1 shl 12)	    ; knight promotion
		      stosq

	 @@:		bsf  rbx,rdx
			jnz  .PawnMove
    .PawnMoveDone:	bsf  rcx,rsi
			jnz  .Pawn
    .PawnDone:



; loop through double pawn moves
			mov  edx,16
		      movsx  eax,byte[rbp+STATE.SIDE]
			xor  edx,eax
			sub  edx,eax
			mov  rax,r15
			mov  rsi,qword[WhitePawnHomeRank+r11]
			and  rsi,qword[r12+8*PAWN]
			cmp  byte[rbp+STATE.SIDE],0
			jne  .BlackPawnDouble
    .WhitePawnDouble:	shl  rax,8
			 or  rax,r15
			shl  rax,8
			jmp  @f
    .BlackPawnDouble:	shr  rax,8
			 or  rax,r15
			shr  rax,8
		   @@:
		      _andn  rsi,rax,rsi
			bsf  rcx,rsi
			 jz  .PawnDoubleMoveDone
    .PawnDoubleMove:
		       imul  eax,ecx,65
		      _blsr  rsi,rsi,r8
			sub  eax,edx
			 or  eax,(MOVE_TYPE_DPAWN shl 12)
		      stosq
			bsf  rcx,rsi
			jnz  .PawnDoubleMove
    .PawnDoubleMoveDone:



; finished generating moves
    .Done:		mov  rax,rdi
			pop  rdx
			sub  rax,rdx
			shr  eax,3
			pop  r15 r14 r13 r12 rbx rsi
			pop  rbp
			ret






		      align  16

Generate_PseudoLegal_Loud:  ; in:    rbp address of position POSITION
			    ; inout: rdi address of psuedo legal move list   moves are captures or promotions
			    ; out:
			    ;     eax:  move count

		       push  rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]
		       push  rsi rbx r12 r13 r14 r15 rdi

; r14 = bitboard of their pieces
; r15 = bitboard of all pieces
; r12 = address of our pieces
; r13 = address of their pieces
			mov  r15,qword[rbp+STATE.WPIECES]
			 or  r15,qword[rbp+STATE.BPIECES]
		      movzx  eax,byte[rbp+STATE.SIDE]
			and  eax,64
			lea  r12,[rbp+rax]
			xor  eax,64
			lea  r13,[rbp+rax]
			mov  r14,qword[r13+8*0]

; loop through rook moves
			mov  rsi,qword[r12+8*ROOK]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rbx,rsi
			 jz  .RookDone
    .Rook:	RookAttacks  rdx,rbx,r15,r8
			and  rdx,r14
		      _blsr  rsi,rsi,r8
			shl  ebx,6
			bsf  rax,rdx
			 jz  .RookMoveDone
    .RookMove:	      _blsr  rdx,rdx,r8
			 or  eax,ebx			  ; source square
		      stosq
			bsf  rax,rdx
			jnz  .RookMove
    .RookMoveDone:	bsf  rbx,rsi
			jnz  .Rook
    .RookDone:



; loop through bishop moves
			mov  rsi,qword[r12+8*BISHOP]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rbx,rsi
			 jz  .BishopDone
    .Bishop:  BishopAttacks  rdx,rbx,r15,r8
			and  rdx,r14
		      _blsr  rsi,rsi,r8
			shl  ebx,6
			bsf  rax,rdx
			 jz  .BishopMoveDone
    .BishopMove:      _blsr  rdx,rdx,r8
			 or  eax,ebx			  ; source square
		      stosq
			bsf  rax,rdx
			jnz  .BishopMove
    .BishopMoveDone:	bsf  rbx,rsi
			jnz  .Bishop
    .BishopDone:



; loop through knight moves
			mov  rsi,qword[r12+8*KNIGHT]
			bsf  rcx,rsi
			 jz  .KnightDone
    .Knight:		mov  rdx,qword[KnightAttacks+8*rcx]
			and  rdx,r14
		      _blsr  rsi,rsi,r8
			shl  ecx,6
			bsf  rax,rdx
			 jz  .KnightMoveDone
    .KnightMove:      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosq
			bsf  rax,rdx
			jnz  .KnightMove
    .KnightMoveDone:	bsf  rcx,rsi
			jnz  .Knight
    .KnightDone:



; loop through king moves
			bsf  rcx,qword[r12+8*KING]
		  assert_nz "no king in Generate_PseudoLegal_Loud"
    .King:		mov  rdx,qword[KingAttacks+8*rcx]
			and  rdx,r14
		      _blsr  rsi,rsi,r8
			shl  ecx,6
			bsf  rbx,rdx
			 jz  .KingMoveDone
    .KingMove:		mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosq
			bsf  rbx,rdx
			jnz  .KingMove
    .KingMoveDone:


; loop through pawn moves
		      movsx  r11,byte[rbp+STATE.SIDE]
			and  r11,BlackPawnAttacks-WhitePawnAttacks
			mov  rsi,qword[r12+8*PAWN]
			mov  r9,qword[WhitePawnPromRank+r11]
			mov  r10,qword[rbp+STATE.EPSQUARE]
			bsf  rcx,rsi
			 jz  .PawnDone
    .Pawn:		mov  rdx,r14
			 or  rdx,r10
			and  rdx,qword[WhitePawnAttacks+r11+8*rcx]
		      _blsr  rsi,rsi,r8
		      _andn  rax,r15,qword[WhitePawnMoves+r11+8*rcx]
			and  rax,r9
			 or  rdx,rax
			shl  ecx,6
			bsf  rbx,rdx
			 jz  .PawnMoveDone
    .PawnMove:	      _blsr  rdx,rdx,r8
			mov  eax,ebx		    ; destination square
			 or  eax,ecx		    ; source square
			 bt  r9,rbx
			 jc  .Promotion
		; ep capture ?
			 bt  r10,rbx
			sbb  r8d,r8d
			and  r8d,(MOVE_TYPE_EPCAP shl 12)
			 or  eax,r8d
      .NormalPawnMove:
		      stosq
			jmp  @f

      .Promotion:	 or  eax,(3 shl 12) + (MOVE_TYPE_PROM shl 12)
		      stosq
			sub  eax,(1 shl 12)	    ; rook promotion
		      stosq
			sub  eax,(1 shl 12)	    ; queen promotion
		      stosq
			sub  eax,(1 shl 12)	    ; knight promotion
		      stosq
			jmp  @f

      .EpCapture:	 or  eax,(MOVE_TYPE_EPCAP shl 12)
		      stosq

	 @@:		bsf  rbx,rdx
			jnz  .PawnMove
    .PawnMoveDone:	bsf  rcx,rsi
			jnz  .Pawn
    .PawnDone:


; finished generating moves
    .Done:		mov  rax,rdi
			pop  rdx
			sub  rax,rdx
			shr  eax,3
			pop  r15 r14 r13 r12 rbx rsi
			pop  rbp
			ret




		      align  16

Generate_PseudoLegal_Quiet: ; in:    rbp address of position POSITION
			    ; inout: rdi address of psuedo legal move list
			    ; out:
			    ;           move count   otherwise

		       push  rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]
		       push  rsi rbx r12 r13 r14 r15 rdi

; r14 = bitboard of our pieces
; r15 = bitboard of all pieces
; r12 = address of our pieces
; r13 = address of their pieces
			mov  r15,qword[rbp+STATE.WPIECES]
			 or  r15,qword[rbp+STATE.BPIECES]
		      movzx  eax,byte[rbp+STATE.SIDE]
			and  eax,64
			lea  r12,[rbp+rax]
			xor  eax,64
			lea  r13,[rbp+rax]
			mov  r14,qword[r12+8*0]

; loop through rook moves
			mov  rsi,qword[r12+8*ROOK]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rbx,rsi
			 jz  .RookDone
    .Rook:	RookAttacks  rdx,rbx,r15,r8
		      _andn  rdx,r15,rdx
		      _blsr  rsi,rsi,r8
			shl  ebx,6
			bsf  rax,rdx
			 jz  .RookMoveDone
    .RookMove:	      _blsr  rdx,rdx,r8
			 or  eax,ebx			  ; source square
		      stosq
			bsf  rax,rdx
			jnz  .RookMove
    .RookMoveDone:	bsf  rbx,rsi
			jnz  .Rook
    .RookDone:



; loop through bishop moves
			mov  rsi,qword[r12+8*BISHOP]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rbx,rsi
			 jz  .BishopDone
    .Bishop:  BishopAttacks  rdx,rbx,r15,r8
		      _andn  rdx,r15,rdx
		      _blsr  rsi,rsi,r8
			shl  ebx,6
			bsf  rax,rdx
			 jz  .BishopMoveDone
    .BishopMove:      _blsr  rdx,rdx,r8
			 or  eax,ebx
		      stosq
			bsf  rax,rdx
			jnz  .BishopMove
    .BishopMoveDone:	bsf  rbx,rsi
			jnz  .Bishop
    .BishopDone:



; loop through knight moves
			mov  rsi,qword[r12+8*KNIGHT]
			bsf  rbx,rsi
			 jz  .KnightDone
    .Knight:	      _andn  rdx,r15,qword[KnightAttacks+8*rbx]
		      _blsr  rsi,rsi,r8
			shl  ebx,6
			bsf  rax,rdx
			 jz  .KnightMoveDone
    .KnightMove:      _blsr  rdx,rdx,r8
			 or  eax,ebx			  ; source square
		      stosq
			bsf  rax,rdx
			jnz  .KnightMove
    .KnightMoveDone:	bsf  rbx,rsi
			jnz  .Knight
    .KnightDone:



; loop through king moves
			bsf  rcx,qword[r12+8*KING]
		  assert_nz "no king in Generate_PseudoLegal_Quiet"
    .King:	      _andn  rdx,r15,qword[KingAttacks+8*rcx]
			shl  ecx,6
			bsf  rax,rdx
			 jz  .KingMoveDone
    .KingMove:	      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosq
			bsf  rax,rdx
			jnz  .KingMove
    .KingMoveDone:

; check castling
		      movzx  r11d,byte[rbp+STATE.SIDE]
			and  r11d,3
			add  r11d,1
		      movzx  ebx,byte[rbp+STATE.SIDE]
			and  ebx,4

	       .OO:	xor  esi,esi
		       test  r11l,byte[rbp+STATE.CASTLING]
			 jz  .OOO
		       test  r15,qword[CastlingOOClear+2*rbx]
			jnz  .OOO
		      movzx  ecx,byte[rbp+STATE.XSIDE]
			and  ecx,64
		       call  PieceCoverage
			mov  rsi,rax
		       test  rax,qword[CastlingOOCheck+2*rbx]
			jnz  .OOO
			mov  eax,dword[CastlingOOMove+rbx]
		      stosq

	       .OOO:	shl  r11d,1
		       test  r11l,byte[rbp+STATE.CASTLING]
			 jz  .KingDone
		       test  r15,qword[CastlingOOOClear+2*rbx]
			jnz  .KingDone
			mov  rax,rsi
		      movzx  ecx,byte[rbp+STATE.XSIDE]
			and  ecx,64
		       test  rsi,rsi
			jnz  @f
		       call  PieceCoverage
		@@:    test  rax,qword[CastlingOOOCheck+2*rbx]
			jnz  .KingDone
			mov  eax,dword[CastlingOOOMove+rbx]
		      stosq
    .KingDone:


; loop through pawn moves

; WhitePawnAttacks + r11 = WhitePawnAttacks   if white to move
; WhitePawnAttacks + r11 = BlackPawnAttacks   if black to move

		      movsx  r11,byte[rbp+STATE.SIDE]
			and  r11,BlackPawnAttacks-WhitePawnAttacks
			mov  rsi,qword[r12+8*PAWN]
			mov  r9,qword[WhitePawnPromRank+r11]
			 or  r9,r15
			bsf  rbx,rsi
			 jz  .PawnDone
    .Pawn:	      _blsr  rsi,rsi,r8
		      _andn  rdx,r9,qword[WhitePawnMoves+r11+8*rbx]
			shl  ebx,6
			bsf  rax,rdx
			 jz  .PawnMoveDone
    .PawnMove:	      _blsr  rdx,rdx,r8
			 or  eax,ebx		    ; source square
		      stosq
			bsf  rax,rdx
			jnz  .PawnMove
    .PawnMoveDone:	bsf  rbx,rsi
			jnz  .Pawn
    .PawnDone:



; loop through double pawn moves
			mov  edx,16
		      movsx  eax,byte[rbp+STATE.SIDE]
			xor  edx,eax
			sub  edx,eax
			mov  rax,r15
			mov  rsi,qword[WhitePawnHomeRank+r11]
			and  rsi,qword[r12+8*PAWN]
			cmp  byte[rbp+STATE.SIDE],0
			jne  .BlackPawnDouble
    .WhitePawnDouble:	shl  rax,8
			 or  rax,r15
			shl  rax,8
			jmp  @f
    .BlackPawnDouble:	shr  rax,8
			 or  rax,r15
			shr  rax,8
		   @@:
		      _andn  rsi,rax,rsi
			bsf  rcx,rsi
			 jz  .PawnDoubleMoveDone
    .PawnDoubleMove:
		       imul  eax,ecx,65
		      _blsr  rsi,rsi,r8
			sub  eax,edx
			 or  eax,(MOVE_TYPE_DPAWN shl 12)
		      stosq
			bsf  rcx,rsi
			jnz  .PawnDoubleMove
    .PawnDoubleMoveDone:



; finished generating moves
    .Done:		mov  rax,rdi
			pop  rdx
			sub  rax,rdx
			shr  eax,3
			pop  r15 r14 r13 r12 rbx rsi
			pop  rbp
			ret





