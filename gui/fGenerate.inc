
		      align  16

_IsCheck:	   ; in: rbx position POSITION
		  ; out: eax = 0  not check
		  ;          =-1  is check
		       push  rbp
			mov  rbp,[rbp+POS.STATE_PTR]
		      movzx  ecx,byte[rbp+STATE.SIDE]
			and  ecx,64
			xor  ecx,64
		       push  rcx
 ;                      call  PieceCoverage
			pop  rcx
			xor  ecx,64
			and  rax,qword[rbx+rcx+8*KING]
			neg  rax
			sbb  eax,eax
			pop  rbp
			ret






		      align  16

PieceCoverage:	  ; in: rbp address of state STATE
		  ;     ecx side ( 0 for white 64 for black)
		  ; out: rax bitboard of white's coverage  or black's

		       push  rdi rbx r11 r15

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
if DEBUG_MODE
      jz  InternalError_PieceCoverage
end if

			lea  rbx,[rbp+rcx]		      ; POS.WPIECES      or POS.BPIECES
			mov  rax,qword[KingAttacks+8*rax]


			mov  rdx,qword[rbx+8*PAWN]
			bsf  rcx,rdx
			 jz  .PawnDone
	.Pawn:	      _blsr  rdx,rdx,r8
			 or  rax,qword[rdi+8*rcx]
			bsf  rcx,rdx
			jnz  .Pawn
	.PawnDone:

			mov  rdx,qword[rbx+8*KNIGHT]
			bsf  rcx,rdx
			 jz  .KnightDone
	.Knight:      _blsr  rdx,rdx,r8
			 or  rax,qword[KnightAttacks+8*rcx]
			bsf  rcx,rdx
			jnz  .Knight
	.KnightDone:

			mov  rdx,qword[rbx+8*BISHOP]
			 or  rdx,qword[rbx+8*QUEEN]
			bsf  rcx,rdx
			 jz  .BishopDone
	.Bishop:      _blsr  rdx,rdx,r8
	      BishopAttacks  rdi,rcx,r15,r8,r9,r10,r11
			 or  rax,rdi
			bsf  rcx,rdx
			jnz  .Bishop
	.BishopDone:

			mov  rdx,qword[rbx+8*ROOK]
			 or  rdx,qword[rbx+8*QUEEN]
			bsf  rcx,rdx
			 jz  .RookDone
	.Rook:	      _blsr  rdx,rdx,r8
		RookAttacks  rdi,rcx,r15,r8,r9,r10,r11
			 or  rax,rdi
			bsf  rcx,rdx
			jnz  .Rook
	.RookDone:

			pop  r15 r11 rbx rdi
			ret




		      align  16

PinnedPieces:	  ; in: rbp address of position POS
		  ;     ecx our side ( 0 for white 64 for black)
		  ;     edx square
		  ; out: rax bitboard of pieces (of both colors) that
		  ;           when present block a sliding attack to edx
		  ;           but when removed allow our side to attack square edx by a sliding attack

		       push  rbp
			mov  rbp,[rbp+POS.STATE_PTR]
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
			mov  rbp,[rbp+POS.STATE_PTR]
		       push  rdi rsi rbx

; rsi = bitboard of all pieces
; rcx = address of our pieces
; rdi =  BlackPawnAttacks or WhitePawnAttacks
			lea  edi,[WhitePawnAttacks]
			lea  eax,[BlackPawnAttacks]
		       test  ecx,ecx
		      cmovz  edi,eax
			add  rcx,rbp
			mov  rsi,qword[rbp+STATE.WPIECES]
			 or  rsi,qword[rbp+STATE.BPIECES]
	; king
			mov  rax,qword[KingAttacks+8*rdx]
			and  rax,qword[rcx+8*KING]
	; knight
			mov  rbx,qword[KnightAttacks+8*rdx]
			and  rbx,qword[rcx+8*KNIGHT]
			 or  rax,rbx
	; rook + queen
		RookAttacks  rbx,rdx,rsi,r8,r9,r10,r11
			mov  r8,qword[rcx+8*ROOK]
			 or  r8,qword[rcx+8*QUEEN]
			and  rbx,r8
			 or  rax,rbx
	; bishop + queen
	      BishopAttacks  rbx,rdx,rsi,r8,r9,r10,r11
			mov  r8,qword[rcx+8*BISHOP]
			 or  r8,qword[rcx+8*QUEEN]
			and  rbx,r8
			 or  rax,rbx
	; pawn
			mov  rbx,qword[rdi+8*rdx]
			and  rbx,qword[rcx+8*PAWN]
			 or  rax,rbx

			pop  rbx rsi rdi
			pop  rbp
			ret







;template<>
;ExtMove* generate<LEGAL>(const Position& pos, ExtMove* mlist) {
;  ExtMove *end, *cur = mlist;
;  Bitboard pinned = pos.pinned_pieces();
;  Square ksq = pos.king_square(pos.side_to_move());
;  end = pos.checkers() ? generate<EVASIONS>(pos, mlist)
;                       : generate<NON_EVASIONS>(pos, mlist);
;  while (cur != end)
;      if (   (pinned || from_sq(cur->move) == ksq || type_of(cur->move) == ENPASSANT)   && !pos.legal(cur->move, pinned)   )
;          cur->move = (--end)->move;
;      else
;          ++cur;
;  return end;
;}

; pinned = hidden_checkers(king_square(sideToMove), ~sideToMove);
; checkersBB = attackers_to(king_square(them)) & pieces(us)

;inline bool squares_aligned(Square s1, Square s2, Square s3) {
;  return  (BetweenBB[s1][s2] | BetweenBB[s1][s3] | BetweenBB[s2][s3])
;        & (     SquareBB[s1] |      SquareBB[s2] |      SquareBB[s3]);
;}

;/// Position::legal() tests whether a pseudo-legal move is legal
;
;bool Position::legal(Move m, Bitboard pinned) const {
;  Color us = sideToMove;
;  Square from = from_sq(m);
;  if (type_of(m) == ENPASSANT)
;  {
;      Color them = ~us;
;      Square to = to_sq(m);
;      Square capsq = to + pawn_push(them);
;      Square ksq = king_square(us);
;      Bitboard b = (pieces() ^ from ^ capsq) | to;
;      return   !(attacks_bb<  ROOK>(ksq, b) & pieces(them, QUEEN, ROOK))
;            && !(attacks_bb<BISHOP>(ksq, b) & pieces(them, QUEEN, BISHOP));
;  }
;  if (type_of(piece_on(from)) == KING)
;      return type_of(m) == CASTLE || !(attackers_to(to_sq(m)) & pieces(~us));
;  return   !pinned
;        || !(pinned & from)
;        ||  squares_aligned(from, to_sq(m), king_square(us));
;}

		      align  16

Generate_Legal:
		       push  rbx rsi r12 r13 r14 r15 rdi

			mov  rbx,qword[rbp+POS.STATE_PTR]

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

; fill in checkers
			mov  ecx,r13d
			mov  edx,r14d
			xor  ecx,64
		       call  AttackersTo
			mov  qword[rbx+STATE.CHECKERS],rax

; generate moves
			mov  r15,rdi
		       test  rax,rax
			jnz  .InCheck
	.NotInCheck:   call  Generate_NonEvasions
			jmp  .GenDone
	.InCheck:      call  Generate_Evasions
	.GenDone:

; remove illegal moves
			mov  rsi,r15
		       xchg  rdi,r15
			jmp  .TestNext

	.Legal: 	mov  eax,r12d
		      stosd

	.Illegal:
	.TestNext:	cmp  rsi,r15
			jae  .TestDone

		      lodsd
			mov  r12d,eax

; edx = move type
			mov  edx,eax
			shr  edx,12
			and  edx,7

; ecx = source square
			mov  ecx,eax
			shr  ecx,6
			and  ecx,63

; pseudo legal castling moves are always legal
			cmp  edx,MOVE_TYPE_CASTLING_OO
			jae  .Legal

; ep captures require special attention
			cmp  edx,2
			 je  .EpCapture

; if we are moving king, have to check destination square
			cmp  ecx,r14d
			 je  .KingMove

; if piece is not pinned, then move is legal
			 bt  qword[rbx+STATE.PINNED],rcx
			jnc  .Legal

; if something is pinned, its movement should be aligned with our king
			and  eax,((64*64)-1)
			 bt  qword[LineMasks+8*rax],r14
			 jc  .Legal
			jnc  .Illegal

; if they have an attacker to king's destination square, then move is illegal
	.KingMove:	mov  ecx,r13d
			xor  ecx,64
			mov  edx,r12d
			and  edx,63
		       call  AttackersTo
		       test  rax,rax
			 jz  .Legal
			jmp  .Illegal


	.TestDone:


			mov  rax,rdi
			pop  rdx
			sub  rax,rdx
			shr  eax,2

			pop  r15 r14 r13 r12 rsi rbx
			ret


		      align  16

; for ep captures, just make the move and test if our king is attacked
	.EpCapture:

			mov  rdx,qword[rbx+STATE.WPIECES]
			 or  rdx,qword[rbx+STATE.BPIECES]
	      ; remove source square
			btr  rdx,rcx
if DEBUG_MODE
     jnc  InternalError_Generate_Legal
end if
	      ; add destination square (ep square)
			and  eax,63
			bts  rdx,rax
if DEBUG_MODE
      jc  InternalError_Generate_Legal
end if
	      ; remove captured pawn
			shr  r13d,2
			xor  r13d,16
			lea  eax,[rax+r13-8]
			btr  rdx,rax
if DEBUG_MODE
     jnc  InternalError_Generate_Legal
end if
	      ; reverse r13
			shl  r13d,2
	      ; check for rook attacks
		RookAttacks  rax,r14,rdx,r8,r9,r10,r11
			mov  r8,qword[rbx+r13+8*QUEEN]
			 or  r8,qword[rbx+r13+8*ROOK]
		       test  rax,r8
			jnz  .Illegal
	      ; check for bishop attacks
	      BishopAttacks  rax,r14,rdx,r8,r9,r10,r11
			mov  r8,qword[rbx+r13+8*QUEEN]
			 or  r8,qword[rbx+r13+8*BISHOP]
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
			mov  rbp,[rbp+POS.STATE_PTR]
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
			bsf  rcx,rsi
		       test  rsi,rsi
			 jz  .RookDone
    .Rook:	RookAttacks  rdx,rcx,r15,r8,r9,r10,r11
		      _andn  rdx,r14,rdx
		      _blsr  rsi,rsi,r8
		      movzx  r9d,byte[rbp+STATE.BOARD+rcx]	; piece on source square - either ROOK or QUEEN
			shl  ecx,6
			shl  r9d,3+16
			 or  ecx,r9d
if DEBUG_MODE
    test  rdx,qword[r13+8*KING]
     jnz  InternalError_Generate_NonEvasions
end if
			bsf  rax,rdx
		       test  rdx,rdx
			 jz  .RookMoveDone
    .RookMove:	      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosd
			bsf  rax,rdx
		       test  rdx,rdx
			jnz  .RookMove
    .RookMoveDone:	bsf  rcx,rsi
		       test  rsi,rsi
			jnz  .Rook
    .RookDone:



; loop through bishop moves
			mov  rsi,qword[r12+8*BISHOP]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rcx,rsi
		       test  rsi,rsi
			 jz  .BishopDone
    .Bishop:  BishopAttacks  rdx,rcx,r15,r8,r9,r10,r11
		      _andn  rdx,r14,rdx
		      _blsr  rsi,rsi,r8
		      movzx  r9d,byte[rbp+STATE.BOARD+rcx]	; piece on source square - either BISHOP or QUEEN
			shl  ecx,6
			shl  r9d,3+16
			 or  ecx,r9d
if DEBUG_MODE
    test  rdx,qword[r13+8*KING]
     jnz  InternalError_Generate_NonEvasions
end if
			bsf  rax,rdx
		       test  rdx,rdx
			 jz  .BishopMoveDone
    .BishopMove:      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosd
			bsf  rax,rdx
		       test  rdx,rdx
			jnz  .BishopMove
    .BishopMoveDone:	bsf  rcx,rsi
		       test  rsi,rsi
			jnz  .Bishop
    .BishopDone:



; loop through knight moves
			mov  rsi,qword[r12+8*KNIGHT]
			bsf  rcx,rsi
		       test  rsi,rsi
			 jz  .KnightDone
    .Knight:	      _andn  rdx,r14,qword[KnightAttacks+8*rcx]
		      _blsr  rsi,rsi,r8

if DEBUG_MODE
    test  rdx,qword[r13+8*KING]
     jnz  InternalError_Generate_NonEvasions
end if
			shl  ecx,6
			 or  ecx,(KNIGHT shl (16+3))
			bsf  rax,rdx
		       test  rdx,rdx
			 jz  .KnightMoveDone
    .KnightMove:      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosd
			bsf  rax,rdx
		       test  rdx,rdx
			jnz  .KnightMove
    .KnightMoveDone:	bsf  rcx,rsi
		       test  rsi,rsi
			jnz  .Knight
    .KnightDone:



; loop through king moves
			bsf  rcx,qword[r12+8*KING]
if DEBUG_MODE
			 jz  Interrupt
end if

    .King:	      _andn  rdx,r14,qword[KingAttacks+8*rcx]

if DEBUG_MODE
    test  rdx,qword[r13+8*KING]
     jnz  InternalError_Generate_NonEvasions
end if
			shl  ecx,6
			 or  ecx,(KING shl (16+3))
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
			bsf  rcx,rsi
			 jz  .PawnDone
    .Pawn:	      _andn  rdx,r14,qword[WhitePawnAttacks+r11+8*rcx]
		      _blsr  rsi,rsi,r8
			mov  rax,qword[r13+8*0]
			 or  rax,qword[rbp+STATE.EPSQUARE]

if DEBUG_MODE
    test  rdx,qword[r13+8*KING]
     jnz  InternalError_Generate_NonEvasions
end if

			and  rdx,rax
		      _andn  rax,r15,qword[WhitePawnMoves+r11+8*rcx]
			 or  rdx,rax

			shl  ecx,6
			bsf  rbx,rdx
			 jz  .PawnMoveDone
    .PawnMove:	      _blsr  rdx,rdx,r8
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]
			shl  eax,16+0		    ; destination piece
			 or  eax,ebx		    ; destination square
			 or  eax,ecx		    ; source square
			 bt  qword[rbp+STATE.EPSQUARE],rbx
			 jc  .EpCapture
			 bt  qword[WhitePawnPromRank+r11],rbx
			 jc  .Promotion

      .NormalPawnMove:	 or  eax,(PAWN shl (16+3))
		      stosd
			jmp  @f

      .Promotion:	 or  eax,((QUEEN shl (16+3)) + (MOVE_TYPE_PROM shl 12))
		      stosd
			sub  eax,(1 shl (16+3)) 	; rook promotion
		      stosd
			sub  eax,(1 shl (16+3)) 	; bishop promotion
		      stosd
			sub  eax,(1 shl (16+3)) 	; knight promotion
		      stosd
			jmp  @f

      .EpCapture:      ;int3
			 or  eax,((PAWN shl (16+3)) + (PAWN shl (16+0)) + (MOVE_TYPE_EPCAP shl 12))
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
			 or  eax,((MOVE_TYPE_DPAWN shl 12) + (PAWN shl (16+3)))
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
			mov  rbp,[rbp+POS.STATE_PTR]
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
		      stosw
		      movzx  eax,byte[rbp+STATE.BOARD+rdx]  ; piece on destination square
			 or  eax,(KING shl 3)		  ; piece on source square
		      stosw
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
			bsf  rcx,rsi
			 jz  .RookDone
    .Rook:	RookAttacks  rdx,rcx,r15,r8,r9,r10,r11
			and  rdx,r14
		      _blsr  rsi,rsi,r8
		      movzx  r9d,byte[rbp+STATE.BOARD+rcx]	; piece on source square - either ROOK or QUEEN
			shl  ecx,6
			shl  r9d,3
if DEBUG_MODE
    test  rdx,qword[r13+8*KING]
     jnz  InternalError_Generate_Evasions
end if
			bsf  rbx,rdx
			 jz  .RookMoveDone
    .RookMove:		mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosw
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]  ; piece on destination square
			 or  eax,r9d			  ; piece on source square
		      stosw
			bsf  rbx,rdx
			jnz  .RookMove
    .RookMoveDone:	bsf  rcx,rsi
			jnz  .Rook
    .RookDone:


; loop through bishop moves
			mov  rsi,qword[r12+8*BISHOP]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rcx,rsi
			 jz  .BishopDone
    .Bishop:  BishopAttacks  rdx,rcx,r15,r8,r9,r10,r11
			and  rdx,r14
		      _blsr  rsi,rsi,r8
		      movzx  r9d,byte[rbp+STATE.BOARD+rcx]	; piece on source square - either BISHOP or QUEEN
			shl  ecx,6
			shl  r9d,3
if DEBUG_MODE
    test  rdx,qword[r13+8*KING]
     jnz  InternalError_Generate_Evasions
end if
			bsf  rbx,rdx
			 jz  .BishopMoveDone
    .BishopMove:	mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosw
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]  ; piece on destination square
			 or  eax,r9d			  ; piece on source square
		      stosw
			bsf  rbx,rdx
			jnz  .BishopMove
    .BishopMoveDone:	bsf  rcx,rsi
			jnz  .Bishop
    .BishopDone:


; loop through knight moves
			mov  rsi,qword[r12+8*KNIGHT]
			bsf  rcx,rsi
			 jz  .KnightDone
    .Knight:		mov  rdx,qword[KnightAttacks+8*rcx]
			and  rdx,r14
		      _blsr  rsi,rsi,r8

if DEBUG_MODE
    test  rdx,qword[r13+8*KING]
     jnz  InternalError_Generate_Evasions
end if
			shl  ecx,6
			bsf  rbx,rdx
			 jz  .KnightMoveDone
    .KnightMove:	mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosw
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]  ; piece on destination square
			 or  eax,(KNIGHT shl 3) 	  ; piece on source square
		      stosw
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
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]
			shl  eax,16+0		    ; destination piece
			 or  eax,ebx		    ; destination square
			 or  eax,ecx		    ; source square
			 bt  qword[rbp+STATE.EPSQUARE],rbx
			 jc  .EpCapture
			 bt  qword[WhitePawnPromRank+r11],rbx
			 jc  .Promotion

      .NormalPawnMove:	 or  eax,(PAWN shl (16+3))
		      stosd
			jmp  @f

      .Promotion:	 or  eax,((QUEEN shl (16+3)) + (MOVE_TYPE_PROM shl 12))
		      stosd
			sub  eax,(1 shl (16+3)) 	; rook promotion
		      stosd
			sub  eax,(1 shl (16+3)) 	; bishop promotion
		      stosd
			sub  eax,(1 shl (16+3)) 	; knight promotion
		      stosd
			jmp  @f

      .EpCapture:      ;int3
			 or  eax,((PAWN shl (16+3)) + (PAWN shl (16+0)) + (MOVE_TYPE_EPCAP shl 12))
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
			 or  eax,((MOVE_TYPE_DPAWN shl 12) + (PAWN shl (16+3)))
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
			mov  rbp,[rbp+POS.STATE_PTR]
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
			bsf  rcx,rsi
			 jz  .RookDone
    .Rook:	RookAttacks  rdx,rcx,r15,r8,r9,r10,r11
		      _andn  rdx,r14,rdx
		      _blsr  rsi,rsi,r8
		      movzx  r9d,byte[rbp+STATE.BOARD+rcx]	; piece on source square - either ROOK or QUEEN
			shl  ecx,6
			shl  r9d,3
		       test  rdx,qword[r13+8*KING]
			jnz  .Failed
			bsf  rbx,rdx
			 jz  .RookMoveDone
    .RookMove:		mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosw
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]  ; piece on destination square
			 or  eax,r9d			  ; piece on source square
		      stosw
			xor  eax,eax
		      stosd
			bsf  rbx,rdx
			jnz  .RookMove
    .RookMoveDone:	bsf  rcx,rsi
			jnz  .Rook
    .RookDone:



; loop through bishop moves
			mov  rsi,qword[r12+8*BISHOP]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rcx,rsi
			 jz  .BishopDone
    .Bishop:  BishopAttacks  rdx,rcx,r15,r8,r9,r10,r11
		      _andn  rdx,r14,rdx
		      _blsr  rsi,rsi,r8
		      movzx  r9d,byte[rbp+STATE.BOARD+rcx]	; piece on source square - either BISHOP or QUEEN
			shl  ecx,6
			shl  r9d,3
		       test  rdx,qword[r13+8*KING]
			jnz  .Failed
			bsf  rbx,rdx
			 jz  .BishopMoveDone
    .BishopMove:	mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosw
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]  ; piece on destination square
			 or  eax,r9d			  ; piece on source square
		      stosw
			xor  eax,eax
		      stosd
			bsf  rbx,rdx
			jnz  .BishopMove
    .BishopMoveDone:	bsf  rcx,rsi
			jnz  .Bishop
    .BishopDone:



; loop through knight moves
			mov  rsi,qword[r12+8*KNIGHT]
			bsf  rcx,rsi
			 jz  .KnightDone
    .Knight:	      _andn  rdx,r14,qword[KnightAttacks+8*rcx]
		      _blsr  rsi,rsi,r8
		       test  rdx,qword[r13+8*KING]
			jnz  .Failed
			shl  ecx,6
			bsf  rbx,rdx
			 jz  .KnightMoveDone
    .KnightMove:	mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosw
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]  ; piece on destination square
			 or  eax,(KNIGHT shl 3) 	  ; piece on source square
		      stosw
			xor  eax,eax
		      stosd
			bsf  rbx,rdx
			jnz  .KnightMove
    .KnightMoveDone:	bsf  rcx,rsi
			jnz  .Knight
    .KnightDone:



; loop through king moves
			bsf  rcx,qword[r12+8*KING]
			 jz  Interrupt
    .King:	      _andn  rdx,r14,qword[KingAttacks+8*rcx]
		       test  rdx,qword[r13+8*KING]
			jnz  .Failed
			shl  ecx,6
			bsf  rbx,rdx
			 jz  .KingMoveDone
    .KingMove:		mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosw
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]  ; piece on destination square
			 or  eax,(KING shl 3)		  ; piece on source square
		      stosw
			xor  eax,eax
		      stosd
			bsf  rbx,rdx
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
			bsf  rcx,rsi
			 jz  .PawnDone
    .Pawn:	      _andn  rdx,r14,qword[WhitePawnAttacks+r11+8*rcx]
		      _blsr  rsi,rsi,r8
			mov  rax,qword[r13+8*0]
			 or  rax,qword[rbp+STATE.EPSQUARE]
		       test  rdx,qword[r13+8*KING]
			jnz  .Failed
			and  rdx,rax
		      _andn  rax,r15,qword[WhitePawnMoves+r11+8*rcx]
			 or  rdx,rax
			shl  ecx,6
			bsf  rbx,rdx
			 jz  .PawnMoveDone
    .PawnMove:	      _blsr  rdx,rdx,r8
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]
			shl  eax,16+0		    ; destination piece
			 or  eax,ebx		    ; destination square
			 or  eax,ecx		    ; source square
			 bt  qword[rbp+STATE.EPSQUARE],rbx
			 jc  .EpCapture
			 bt  qword[WhitePawnPromRank+r11],rbx
			 jc  .Promotion

      .NormalPawnMove:	 or  eax,(PAWN shl (16+3))
		      stosq
			jmp  @f

      .Promotion:	 or  eax,((QUEEN shl (16+3)) + (MOVE_TYPE_PROM shl 12))
		      stosq
			sub  eax,(1 shl (16+3)) 	; rook promotion
		      stosq
			sub  eax,(1 shl (16+3)) 	; bishop promotion
		      stosq
			sub  eax,(1 shl (16+3)) 	; knight promotion
		      stosq
			jmp  @f

      .EpCapture:      ;int3
			 or  eax,((PAWN shl (16+3)) + (PAWN shl (16+0)) + (MOVE_TYPE_EPCAP shl 12))
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

		     ;   cmp  ecx,0x008
		     ;    jb  .Failer
		     ;   cmp  ecx,0x038
		     ;   jae  .Failer

			imul  eax,ecx,65
		      _blsr  rsi,rsi,r8
			sub  eax,edx

		      ;  cmp  al,0
		      ;   je  .Failer

			 or  eax,((MOVE_TYPE_DPAWN shl 12) + (PAWN shl (16+3)))
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

;.Failer: int3


; their king could be captured
    .Failed:		 or  eax,-1
			pop  rdx
			pop  r15 r14 r13 r12 rbx rsi
			pop  rbp
			ret







		      align  16

Generate_PseudoLegal_Loud:  ; in:    rbp address of position POSITION
			    ; inout: rdi address of psuedo legal move list   moves are captures or promotions
			    ; out:
			    ;     eax:  -1           if opposing king is attacked
			    ;           move count   otherwise

		       push  rbp
			mov  rbp,[rbp+POS.STATE_PTR]
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
			bsf  rcx,rsi
			 jz  .RookDone
    .Rook:	RookAttacks  rdx,rcx,r15,r8,r9,r10,r11
			and  rdx,r14
		      _blsr  rsi,rsi,r8
		      movzx  r9d,byte[rbp+STATE.BOARD+rcx]	; piece on source square - either ROOK or QUEEN
			shl  ecx,6
			shl  r9d,3
		       test  rdx,qword[r13+8*KING]
			jnz  .Failed
			bsf  rbx,rdx
			 jz  .RookMoveDone
    .RookMove:		mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosw
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]  ; piece on destination square
			 or  eax,r9d			  ; piece on source square
		      stosw
			xor  eax,eax
		      stosd
			bsf  rbx,rdx
			jnz  .RookMove
    .RookMoveDone:	bsf  rcx,rsi
			jnz  .Rook
    .RookDone:



; loop through bishop moves
			mov  rsi,qword[r12+8*BISHOP]
			 or  rsi,qword[r12+8*QUEEN]
			bsf  rcx,rsi
			 jz  .BishopDone
    .Bishop:  BishopAttacks  rdx,rcx,r15,r8,r9,r10,r11
			and  rdx,r14
		      _blsr  rsi,rsi,r8
		      movzx  r9d,byte[rbp+STATE.BOARD+rcx]	; piece on source square - either BISHOP or QUEEN
			shl  ecx,6
			shl  r9d,3
		       test  rdx,qword[r13+8*KING]
			jnz  .Failed
			bsf  rbx,rdx
			 jz  .BishopMoveDone
    .BishopMove:	mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosw
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]  ; piece on destination square
			 or  eax,r9d			  ; piece on source square
		      stosw
			xor  eax,eax
		      stosd
			bsf  rbx,rdx
			jnz  .BishopMove
    .BishopMoveDone:	bsf  rcx,rsi
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
		       test  rdx,qword[r13+8*KING]
			jnz  .Failed
			bsf  rbx,rdx
			 jz  .KnightMoveDone
    .KnightMove:	mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosw
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]  ; piece on destination square
			 or  eax,(KNIGHT shl 3) 	  ; piece on source square
		      stosw
			xor  eax,eax
		      stosd
			bsf  rbx,rdx
			jnz  .KnightMove
    .KnightMoveDone:	bsf  rcx,rsi
			jnz  .Knight
    .KnightDone:



; loop through king moves
			bsf  rcx,qword[r12+8*KING]
			 jz  Interrupt
    .King:		mov  rdx,qword[KingAttacks+8*rcx]
			and  rdx,r14
		      _blsr  rsi,rsi,r8
			shl  ecx,6
		       test  rdx,qword[r13+8*KING]
			jnz  .Failed
			bsf  rbx,rdx
			 jz  .KingMoveDone
    .KingMove:		mov  eax,ebx			  ; destination square
		      _blsr  rdx,rdx,r8
			 or  eax,ecx			  ; source square
		      stosw
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]  ; piece on destination square
			 or  eax,(KING shl 3)		  ; piece on source square
		      stosw
			xor  eax,eax
		      stosd
			bsf  rbx,rdx
			jnz  .KingMove
    .KingMoveDone:


; loop through pawn moves
			mov  r10,qword[r12+8*0]
		      movsx  r11,byte[rbp+STATE.SIDE]
			and  r11,BlackPawnAttacks-WhitePawnAttacks
			mov  rsi,qword[r12+8*PAWN]
			bsf  rcx,rsi
			 jz  .PawnDone
    .Pawn:	      _andn  rdx,r10,qword[WhitePawnAttacks+r11+8*rcx]
		      _blsr  rsi,rsi,r8
			mov  rax,qword[rbp+STATE.EPSQUARE]
			 or  rax,r14
		       test  rdx,qword[r13+8*KING]
			jnz  .Failed
			and  rdx,rax
			shl  ecx,6
			bsf  rbx,rdx
			 jz  .PawnMoveDone
    .PawnMove:	      _blsr  rdx,rdx,r8
		      movzx  eax,byte[rbp+STATE.BOARD+rbx]
			shl  eax,16+0		    ; destination piece
			 or  eax,ebx		    ; destination square
			 or  eax,ecx		    ; source square
			 bt  qword[rbp+STATE.EPSQUARE],rbx
			 jc  .EpCapture
			 bt  qword[WhitePawnPromRank+r11],rbx
			 jc  .Promotion

      .NormalPawnMove:	 or  eax,(PAWN shl (16+3))
		      stosq
			jmp  @f

      .Promotion:	 or  eax,((QUEEN shl (16+3)) + (MOVE_TYPE_PROM shl 12))
		      stosq
			sub  eax,(1 shl (16+3)) 	; rook promotion
		      stosq
			sub  eax,(1 shl (16+3)) 	; queen promotion
		      stosq
			sub  eax,(1 shl (16+3)) 	; knight promotion
		      stosq
			jmp  @f

      .EpCapture:	 or  eax,((PAWN shl (16+3)) + (PAWN shl (16+0)) + (MOVE_TYPE_EPCAP shl 12))
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


; their king could be captured
    .Failed:		 or  eax,-1
			pop  rdx
			pop  r15 r14 r13 r12 rbx rsi
			pop  rbp
			ret





