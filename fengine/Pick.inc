


		      align  16
LoudPick_Initialize:
		       push  rsi rdi
			lea  rdi,[rbx+STATE.MOVE_LIST]
			mov  rsi,rdi
			mov  qword[rbx+STATE.MOVE_PTR],rdi
		       call  Generate_PseudoLegal_Loud
			mov  qword[rbx+STATE.MOVE_END],rdi

	.Score: 	mov  ecx,dword[rsi+0]

			cmp  rsi,rdi
			jae  .ScoreDone
			add  rsi,8

			mov  r8d,ecx
			shr  r8d,6
			and  r8d,63
			mov  r9d,ecx
			and  r9d,63

			shr  ecx,12
			xor  edx,edx

		      movzx  eax,byte[rbx+STATE.BOARD+r9]
			shl  eax,8
			mov  al,byte[rbx+STATE.BOARD+r8]
			cmp  byte[rbx+STATE.BOARD+r9],0
			 je  .CheckProm
			xor  al,7
			mov  dword[rsi-4],eax
			jmp  .Score

	  .CheckProm:	lea  eax,[ecx-MOVE_TYPE_PROM-8]
			cmp  ecx,MOVE_TYPE_PROM
		      cmovb  eax,edx
			mov  dword[rsi-4],eax
			jmp  .Score
	.ScoreDone:
			pop  rdi rsi
			ret

		      align  16
LoudPick_Next:	 ; in: rbx address of STATE
		       push  rsi
			mov  rsi,qword[rbx+STATE.MOVE_PTR]

  .Next:		cmp  rsi,qword[rbx+STATE.MOVE_END]
			jae  .Done

			mov  rdx,qword[rsi]	; running maximum
			lea  rcx,[rsi+8]	; runs through the list
			mov  r8,rsi		; position of maximum
			cmp  rcx,qword[rbx+STATE.MOVE_END]
			jae  .GotEnd
    .TryNext:		mov  rax,qword[rcx]
			cmp  rdx,rax
		      cmovl  rdx,rax
		      cmovl  r8,rcx
			add  rcx,8
			cmp  rcx,qword[rbx+STATE.MOVE_END]
			 jb  .TryNext
			mov  rax,qword[r8]
			mov  rdx,qword[rsi]
			mov  qword[rsi],rax
			mov  qword[r8],rdx
    .GotEnd:		mov  eax,dword[rsi]
			add  rsi,8

			mov  r8d,eax
			shr  r8d,6
			and  r8d,63
			mov  r9d,eax
			and  r9d,63

		; return promotions and ep captures
			cmp  eax,(MOVE_TYPE_EPCAP shl 12)
			jae  .ReturnMove

		; return winning captures
		      movzx  edx,byte[rbx+STATE.BOARD+r9]
			cmp  dl,byte[rbx+STATE.BOARD+r8]
			jae  .ReturnMove

		; make sure see value >= 0
		       call  StaticExchangeEvalaution
			cmp  edx,0
			 jl  .Next

	.ReturnMove:
			mov  qword[rbx+STATE.MOVE_PTR],rsi
			pop  rsi
			ret

  .Done:		mov  qword[rbx+STATE.MOVE_PTR],rsi
			xor  eax,eax
			pop  rsi
			ret




		      align  16
StaticExchangeEvalaution:   ; in: rbx address of STATE
			    ;     eax = normal capture move (must preserve)
			    ;     r8d = from
			    ;     r9d = to
			    ; out: edx > 0 good capture
			    ;      edx < 0 bad capture


;xor  edx,edx
;ret
		       push  rax rcx rsi rdi r12 r13 r14 r15



		       push  rbp
			mov  rbp,rsp

		; rsi = bishops + queens
		; rdi = bishops + queens
			mov  rax,qword[rbx+STATE.WPIECES+8*QUEEN]
			 or  rax,qword[rbx+STATE.BPIECES+8*QUEEN]
			mov  rsi,qword[rbx+STATE.WPIECES+8*BISHOP]
			 or  rsi,qword[rbx+STATE.BPIECES+8*BISHOP]
			 or  rsi,rax
			mov  rdi,qword[rbx+STATE.WPIECES+8*ROOK]
			 or  rdi,qword[rbx+STATE.BPIECES+8*ROOK]
			 or  rdi,rax

		; r12d = type
		      movzx  r12d,byte[rbx+STATE.BOARD+r8]

		; r13d = side
		      movzx  r13d,byte[rbx+STATE.XSIDE]
			and  r13d,64

		; set initial gain
		      movzx  eax,byte[rbx+STATE.BOARD+r9]
			mov  eax,dword[SwapValues+4*rax]
		       push  rax

		; r14 = occupied
		; r15 = attackers
			mov  r14,qword[rbx+STATE.WPIECES+8*0]
			 or  r14,qword[rbx+STATE.BPIECES+8*0]

	; king
			mov  r15,qword[KingAttacks+8*r9]
			mov  rax,qword[rbx+STATE.WPIECES+8*KING]
			 or  rax,qword[rbx+STATE.BPIECES+8*KING]
			and  r15,rax

	; knight
			mov  rdx,qword[KnightAttacks+8*r9]
			mov  rax,qword[rbx+STATE.WPIECES+8*KNIGHT]
			 or  rax,qword[rbx+STATE.BPIECES+8*KNIGHT]
			and  rdx,rax
			 or  r15,rdx

	; rook + queen
		RookAttacks  rdx,r9,r14,r10
			and  rdx,rdi
			 or  r15,rdx
	; bishop + queen
	      BishopAttacks  rdx,r9,r14,r10
			and  rdx,rsi
			 or  r15,rdx
	; pawn
			mov  rax,qword[BlackPawnAttacks+8*r9]
			and  rax,qword[rbx+STATE.WPIECES+8*PAWN]
			 or  r15,rax
			mov  rax,qword[WhitePawnAttacks+8*r9]
			and  rax,qword[rbx+STATE.BPIECES+8*PAWN]
			 or  r15,rax

	; clear moving piece from occupied
			btr  r14,r8

	; update attacks
			cmp  r12d,ROOK
			 je  .UpdateRook
		       test  r12d,1
			 jz  .UpdateDone

.UpdateBishop:
	      BishopAttacks  rdx,r9,r14,r10
			and  rdx,rsi
			 or  r15,rdx
			cmp  r12d,QUEEN
			jne  .UpdateDone
.UpdateRook:
		RookAttacks  rdx,r9,r14,r10
			and  rdx,rdi
			 or  r15,rdx

.UpdateDone:		and  r15,r14

			mov  eax,dword[SwapValues+4*r12]
		       test  r15,qword[rbx+r13+8*0]
			 jz  .SwapDone
			cmp  r12d,KING
			 je  .KingBreak
			sub  eax,dword[rsp]
		       push  rax

		irps p, PAWN KNIGHT BISHOP ROOK QUEEN {
			mov  r12d,p
			mov  rax,qword[rbx+r13+8*p]
			and  rax,r15
			jnz  .Found			   }

			mov  r12d,KING

	.Found:       _blsi  rax,rax,rcx
			xor  r13,64
			xor  r14,rax
		       test  r12d,1
			jnz  .UpdateBishop
			cmp  r12,ROOK
			 je  .UpdateRook
			jmp  .UpdateDone
     .KingBreak:
			mov  eax,INF_SCORE
		       push  rax
     .SwapDone:
			pop  rdx
			cmp  rsp,rbp
			jae  .Return
	.PopLoop:	pop  rcx
			neg  edx
			cmp  edx,ecx
		      cmovg  edx,ecx
			cmp  rsp,rbp
			 jb  .PopLoop
	.Return:	pop  rbp
			pop  r15 r14 r13 r12 rdi rsi rcx rax
			ret






		      align  16
MovePick_Initialize:   ; in: rbx address of STATE
			lea  rdx,[MovePick_HashMove]
		      movzx  ecx,byte[rbx+STATE.PLY]
			mov  ecx,dword[KillerMoves+4*ecx]
			mov  qword[rbx+STATE.MOVE_PHASE],rdx
			mov  dword[rbx+STATE.KILLER1],ecx
			lea  r8,[rbx+STATE.BAD_LIST]
			mov  qword[rbx+STATE.BAD_END],r8
			ret





		      align  16
MovePick_HashMove:     ; in: rbx address of STATE
		      movzx  ecx,word[rbx+STATE.HASH_MOVE]
		       test  ecx,ecx
			 jz  MovePick_GenerateLoud
		       call  IsPseudoLegal
		       test  rax,rax
			 jz  MovePick_GenerateLoud
		      movzx  eax,word[rbx+STATE.HASH_MOVE]
			lea  rdx,[MovePick_GenerateLoud]
			mov  qword[rbx+STATE.MOVE_PHASE],rdx
			ret




		      align  16
MovePick_GenerateLoud: ; in: rbx address of STATE
		       push  rsi rdi


			lea  rdi,[rbx+STATE.MOVE_LIST]
			mov  rsi,rdi
			mov  qword[rbx+STATE.MOVE_PTR],rdi
		       call  Generate_PseudoLegal_Loud
			mov  qword[rbx+STATE.MOVE_END],rdi

	.Score: 	mov  ecx,dword[rsi+0]

			cmp  rsi,rdi
			jae  .ScoreDone
			add  rsi,8

			mov  r8d,ecx
			shr  r8d,6
			and  r8d,63
			mov  r9d,ecx
			and  r9d,63

			shr  ecx,12
			xor  edx,edx

		      movzx  eax,byte[rbx+STATE.BOARD+r9]
			shl  eax,8
			mov  al,byte[rbx+STATE.BOARD+r8]
			cmp  byte[rbx+STATE.BOARD+r9],0
			 je  .CheckProm
			xor  al,7
			mov  dword[rsi-4],eax
			jmp  .Score

	  .CheckProm:	lea  eax,[ecx-MOVE_TYPE_PROM-8]
			cmp  ecx,MOVE_TYPE_PROM
		      cmovb  eax,edx
			mov  dword[rsi-4],eax
			jmp  .Score
	.ScoreDone:
			lea  rdx,[MovePick_Loud]
			mov  qword[rbx+STATE.MOVE_PHASE],rdx
			pop  rdi rsi
			jmp  MovePick_Loud




		      align  16
MovePick_Loud:	   ; in: rbx address of STATE
		       push  rsi
			mov  rsi,qword[rbx+STATE.MOVE_PTR]

  .Next:		cmp  rsi,qword[rbx+STATE.MOVE_END]
			jae  .Done

			mov  rdx,qword[rsi]	; running maximum
			lea  rcx,[rsi+8]	; runs through the list
			mov  r8,rsi		; position of maximum
			cmp  rcx,qword[rbx+STATE.MOVE_END]
			jae  .GotEnd
    .TryNext:		mov  rax,qword[rcx]
			cmp  rdx,rax
		      cmovl  rdx,rax
		      cmovl  r8,rcx
			add  rcx,8
			cmp  rcx,qword[rbx+STATE.MOVE_END]
			 jb  .TryNext
			mov  rax,qword[r8]
			mov  rdx,qword[rsi]
			mov  qword[rsi],rax
			mov  qword[r8],rdx
    .GotEnd:		mov  eax,dword[rsi]
			add  rsi,8

			mov  r8d,eax
			shr  r8d,6
			and  r8d,63
			mov  r9d,eax
			and  r9d,63

		; skip hash move
			cmp  ax,word[rbx+STATE.HASH_MOVE]
			 je  .Next

		; return promotions and ep captures
			cmp  eax,(MOVE_TYPE_EPCAP shl 12)
			jae  .ReturnMove

		; return winning captures
		      movzx  edx,byte[rbx+STATE.BOARD+r9]
			cmp  dl,byte[rbx+STATE.BOARD+r8]
			jae  .ReturnMove

		; iff see >=0 do capture
		       call  StaticExchangeEvalaution
			cmp  edx,0
			jge  .ReturnMove

		; else put in bad list
			mov  rdx,qword[rbx+STATE.BAD_END]
			mov  dword[rdx],eax
			add  rdx,4
			mov  qword[rbx+STATE.BAD_END],rdx
			jmp  .Next

	.ReturnMove:
			mov  qword[rbx+STATE.MOVE_PTR],rsi
			pop  rsi
			ret

  .Done:		mov  qword[rbx+STATE.MOVE_PTR],rsi
			pop  rsi
			jmp  MovePick_Killer1




		      align  16
MovePick_Killer1:  ; in: rbx address of STATE

    ;   cmp  word[rbx+STATE.CUR_MOVE-1*sizeof.STATE],(0 shl 12) + (SQUARE_D7 shl 6) + (SQUARE_D6 shl 0)
    ;                    jne  @f
    ;                   int3
    ;                    @@:


		      movzx  ecx,word[rbx+STATE.KILLER1]
			mov  r9d,ecx
			and  r9d,63
		   ; if no killer, skip
		       test  ecx,ecx
			 jz  MovePick_Killer2
		   ; if killer is hash, skip
			cmp  cx,word[rbx+STATE.HASH_MOVE]
			 je  MovePick_Killer2
		   ; if killer is a capture, skip
			cmp  byte[rbx+STATE.BOARD+r9],0
			jne  MovePick_Killer2
		   ; if killer is a promotion, skip
			cmp  ecx,(MOVE_TYPE_EPCAP shl 12)
			jae  MovePick_Killer2
		   ; if move is not legal
		       call  IsPseudoLegal
			lea  rdx,[MovePick_Killer2]
		       test  rax,rax
			 jz  MovePick_Killer2

;int3
		      movzx  eax,word[rbx+STATE.KILLER1]
			mov  qword[rbx+STATE.MOVE_PHASE],rdx
			ret




		      align  16
MovePick_Killer2:  ; in: rbx address of STATE
  ;                   cmp  word[rbx+STATE.CUR_MOVE-1*sizeof.STATE],(0 shl 12) + (SQUARE_D7 shl 6) + (SQUARE_D6 shl 0)
  ;                      jne  @f
  ;                     int3
  ;                      @@:

		      movzx  ecx,word[rbx+STATE.KILLER2]
			mov  r9d,ecx
			and  r9d,63
		   ; if no killer, skip
		       test  ecx,ecx
			 jz  MovePick_GenerateQuiet
		   ; if killer is hash, skip
			cmp  cx,word[rbx+STATE.HASH_MOVE]
			 je  MovePick_GenerateQuiet
		   ; if killer is a capture, skip
			cmp  byte[rbx+STATE.BOARD+r9],0
			jne  MovePick_GenerateQuiet
		   ; if killer is a promotion, skip
			cmp  ecx,(MOVE_TYPE_EPCAP shl 12)
			jae  MovePick_GenerateQuiet
		   ; if move is not legal
		       call  IsPseudoLegal
			lea  rdx,[MovePick_GenerateQuiet]
		       test  rax,rax
			 jz  MovePick_GenerateQuiet

;int3
		      movzx  eax,word[rbx+STATE.KILLER2]
			mov  qword[rbx+STATE.MOVE_PHASE],rdx
			ret




		      align  16
MovePick_GenerateQuiet: ; in: rbx address of STATE
		       push  rsi rdi
			lea  rdi,[rbx+STATE.MOVE_LIST]
			mov  rsi,rdi
			mov  qword[rbx+STATE.MOVE_PTR],rdi
		       call  Generate_PseudoLegal_Quiet
			mov  qword[rbx+STATE.MOVE_END],rdi

	.Score: 	mov  ecx,dword[rsi+0]
			and  ecx,(1 shl 12)-1
			cmp  rsi,rdi
			jae  .ScoreDone
			mov  ecx,[HistoryBonus+4*rcx]
			mov  dword[rsi+4],ecx
			add  rsi,8
			jmp  .Score
	.ScoreDone:
			lea  rdx,[MovePick_Quiet]
			mov  qword[rbx+STATE.MOVE_PHASE],rdx
			pop  rdi rsi
			jmp  MovePick_Quiet




		      align  16
MovePick_Quiet:     ; in: rbx address of STATE
		       push  rsi
			mov  rsi,qword[rbx+STATE.MOVE_PTR]

		 ;       cmp  word[rbx+STATE.CUR_MOVE-1*sizeof.STATE],(0 shl 12) + (SQUARE_D7 shl 6) + (SQUARE_D6 shl 0)
		 ;       jne  @f
		 ;      int3
		 ;       @@:


  .Next:		cmp  rsi,qword[rbx+STATE.MOVE_END]
			jae  .Done

			mov  rdx,qword[rsi]	; running maximum
			lea  rcx,[rsi+8]	; runs through the list
			mov  r8,rsi		; position of maximum
			cmp  rcx,qword[rbx+STATE.MOVE_END]
			jae  .GotEnd
    .TryNext:		mov  rax,qword[rcx]
			cmp  rdx,rax

		      cmovb  rdx,rax
		      cmovb  r8,rcx
		   ;     mov  rdx,rax
		   ;     mov  r8,rcx

			add  rcx,8
			cmp  rcx,qword[rbx+STATE.MOVE_END]
			 jb  .TryNext
			mov  rax,qword[r8]
			mov  rdx,qword[rsi]
			mov  qword[rsi],rax
			mov  qword[r8],rdx
    .GotEnd:		mov  eax,dword[rsi]
			add  rsi,8
			mov  qword[rbx+STATE.MOVE_PTR],rsi

		; skip hash move
			cmp  ax,word[rbx+STATE.HASH_MOVE]
			 je  .Next
		; skip killer 1
			cmp  ax,word[rbx+STATE.KILLER1]
			 je  .Next
		; skip killer 2
			cmp  ax,word[rbx+STATE.KILLER2]
			 je  .Next

			pop  rsi
			ret

  .Done:		pop  rsi

			lea  rcx,[rbx+STATE.BAD_LIST]
			mov  qword[rbx+STATE.MOVE_PTR],rcx
			lea  rdx,[MovePick_BadCaptures]
			mov  qword[rbx+STATE.MOVE_PHASE],rdx
			jmp  MovePick_BadCaptures




		      align  16
MovePick_BadCaptures:	  ; in: rbx address of STATE
		       push  rsi
			xor  eax,eax
			mov  rsi,qword[rbx+STATE.MOVE_PTR]
			cmp  rsi,qword[rbx+STATE.BAD_END]
			jae  .Done
			mov  eax,dword[rsi]
			add  rsi,4
			mov  qword[rbx+STATE.MOVE_PTR],rsi
	.Done:
			pop  rsi
			ret







		      align  16

IsPseudoLegal:	; in: rbx address of STATE
		;     ecx move
		; out: rax = 0 if move is not pseudo legal
		;      rax !=0 if move is pseudo legal

		       push  r12 r13 r14 r15

		; r8d = from
		; r9d = to
			mov  r8d,ecx
			shr  r8d,6
			and  r8d,63
			mov  r9d,ecx
			and  r9d,63

		; r11 = FROM PIECE
		      movzx  r11d,byte[rbx+STATE.BOARD+r8]

		; r12 = address of our pieces
		; r13 = address of their pieces
		; r14 = bitboard of our pieces
		; r15 = bitboard of all pieces
		      movzx  eax,byte[rbx+STATE.SIDE]
			and  eax,64
			lea  r12,[rbx+rax]
			xor  eax,64
			lea  r13,[rbx+rax]
			mov  r14,qword[r12+8*0]
			mov  r15,qword[rbx+STATE.WPIECES]
			 or  r15,qword[rbx+STATE.BPIECES]

		; ecx = MOVE_TYPE
		; r10 = MOVE_TYPE=0
		; rdx = bitboard of to square r9d
		; eax = move
			mov  eax,ecx
			shr  ecx,12
			cmp  ecx,1
			sbb  r10,r10
			xor  edx,edx
			bts  rdx,r9

		; make sure that our piece is on from square
			 bt  r14,r8
			jnc  .ReturnFalse

		; make sure that we don't capture our own piece
			 bt  r14,r9
			 jc  .ReturnFalse

		     ;   cmp  r11d,KING
		     ;    ja  Interrupt
			jmp  qword[@f+8*r11]

		      align  8
	      @@:   dq .NoPiece
		    dq .Pawn
		    dq .Knight
		    dq .Bishop
		    dq .Rook
		    dq .Queen
		    dq .King

		      align  8
    .NoPiece:
    .ReturnFalse:
			xor  eax,eax
			pop  r15 r14 r13 r12
			ret

		      align  8
    .Knight:		mov  rax,qword[KnightAttacks+8*r8]
			and  rax,rdx
			and  rax,r10
			pop  r15 r14 r13 r12
			ret

		      align  8
    .Bishop:  BishopAttacks  rax,r8,r15,r11
			and  rax,rdx
			and  rax,r10
			pop  r15 r14 r13 r12
			ret

		      align  8
    .Rook:	RookAttacks  rax,r8,r15,r11
			and  rax,rdx
			and  rax,r10
			pop  r15 r14 r13 r12
			ret

		      align  8
    .Queen:	RookAttacks  rax,r8,r15,r11
	      BishopAttacks  r9,r8,r15,r11
			 or  rax,r9
			and  rax,rdx
			and  rax,r10
			pop  r15 r14 r13 r12
			ret

		      align  8
    .Pawn:	      movsx  r11,byte[rbx+STATE.SIDE]
			and  r11,BlackPawnAttacks-WhitePawnAttacks

			cmp  ecx,MOVE_TYPE_DPAWN
			 je  .DoublePawn
			cmp  ecx,MOVE_TYPE_EPCAP
			 je  .EpCapture
			cmp  ecx,MOVE_TYPE_PROM
			jae  .Promotion

		      _andn  rax,r15,qword[WhitePawnMoves+r11+8*r8]
			mov  rcx,[r13+8*0]
			and  rcx,qword[WhitePawnAttacks+r11+8*r8]
			 or  rax,rcx

			and  rax,rdx
			and  rax,r10
			pop  r15 r14 r13 r12
			ret

	.Promotion:
		      _andn  rax,r15,qword[WhitePawnMoves+r11+8*r8]
			mov  rcx,[r13+8*0]
			and  rcx,qword[WhitePawnAttacks+r11+8*r8]
			 or  rax,rcx
			and  rax,qword[WhitePawnPromRank+r11]
			and  rax,rdx
			pop  r15 r14 r13 r12
			ret


	.DoublePawn:
		    ; made sure that to is two ranks from start
		      movzx  eax,byte[rbx+STATE.SIDE]
			and  eax,32
			lea  eax,[r8+rax-16]
			cmp  eax,r9d
			jne  .ReturnFalse
		    ; make sure that two squares are clear
			add  r9d,r8d
			shr  r9d,1
			bts  rdx,r9
		       test  rdx,r15
			jnz  .ReturnFalse
		    ; make sure that from is on home
			xor  eax,eax
			bts  rax,r8
			and  rax,qword[WhitePawnHomeRank+r11]
			pop  r15 r14 r13 r12
			ret

	.EpCapture:
			mov  rax,rdx
			and  rax,qword[rbx+STATE.EPSQUARE]
			and  rax,qword[WhitePawnAttacks+r11+8*r8]

			pop  r15 r14 r13 r12
			ret







		      align  8
    .King:	      movzx  r12d,byte[rbx+STATE.SIDE]
			mov  r13d,r12d
			and  r12d,3
			add  r12d,1
			and  r13d,4
			cmp  ecx,MOVE_TYPE_OO
			 je  .OO
			shl  r12d,1
			cmp  ecx,MOVE_TYPE_OOO
			 je  .OOO
			mov  rax,qword[KingAttacks+8*r8]
			and  rax,rdx
			and  rax,r10
			pop  r15 r14 r13 r12
			ret

		      align  8
	       .OO:	cmp  eax,dword[CastlingOOMove+r13]
			jne  .ReturnFalse
		       test  r12l,byte[rbx+STATE.CASTLING]
			 jz  .ReturnFalse
		       test  r15,qword[CastlingOOClear+2*r13]
			jnz  .ReturnFalse
		      movzx  ecx,byte[rbx+STATE.XSIDE]
			and  ecx,64
		       push  rbp
			mov  rbp,rbx
		       call  PieceCoverage
			pop  rbp
		       test  rax,qword[CastlingOOCheck+2*r13]
			jnz  .ReturnFalse
			 or  eax,-1
			pop  r15 r14 r13 r12
			ret

		      align  8
	       .OOO:	cmp  eax,dword[CastlingOOOMove+r13]
			jne  .ReturnFalse
		       test  r12l,byte[rbx+STATE.CASTLING]
			 jz  .ReturnFalse
		       test  r15,qword[CastlingOOOClear+2*r13]
			jnz  .ReturnFalse
			mov  rax,rsi
		      movzx  ecx,byte[rbx+STATE.XSIDE]
			and  ecx,64
		       push  rbp
			mov  rbp,rbx
		       call  PieceCoverage
			pop  rbp
		       test  rax,qword[CastlingOOOCheck+2*r13]
			jnz  .ReturnFalse
			 or  eax,-1
			pop  r15 r14 r13 r12
			ret
