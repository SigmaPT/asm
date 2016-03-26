
ParsePosition:
		       push  rbx
		       call  SkipSpaces

		    stdcall  CmpString,'fen'
		       test  eax,eax
			jnz  .GetFen

		    stdcall  CmpString,'startpos'
		       test  eax,eax
			jnz  .StartPos

.Failed:		lea  rdi,[szParseError]
		       call  _WriteOut
			lea  rsi,[szStartPosition]
		       call  ParseFEN
			pop  rbx
			ret

.StartPos:	       push  rsi
			lea  rsi,[szStartPosition]
		       call  ParseFEN
			pop  rsi
			jmp  .CheckMoves

.GetFen:	       call  ParseFEN
		       test  eax,eax
			 jz  .Failed

.CheckMoves:	       call  SkipSpaces
			cmp  byte[rsi],' '
			 jb  .Done

		    stdcall  CmpString,'moves'
		       test  eax,eax
			 jz  .Done

		       call  ParseMoves

.Done:			pop  rbx
			ret





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ParseMoves:	       push  rbx rsi rdi

			lea  rdi,[MoveList]
		       call  Generate_Legal
			mov  r15d,eax
			xor  r14d,r14d

.GetMoves:	       call  SkipSpaces
			cmp  byte[rsi],' '
			 jb  .Done

		      lodsd
		      movzx  edx,byte[rsi]
			cmp  dl,' '
			jbe  @f
			add  rsi,1
			shl  rdx,32
			 or  rax,rdx
		  @@:	mov  r13,rax


		  @@:	cmp  r14d,r15d
			jae  .Failed
			mov  ecx,dword[MoveList+4*r14]
		       call  PrintUciMove
			cmp  rax,r13
			 je  .Found
			add  r14d,1
			jmp  @b

	   .Found:	mov  ecx,dword[MoveList+4*r14]
		       call  MakeMove
			lea  rdi,[MoveList]
		       call  Generate_Legal
			mov  r15d,eax
			xor  r14d,r14d

			jmp  .GetMoves

.Done:		    ; set the root to the top
			mov  rax,qword[rbp+POS.CURR_STATE_PTR]
			mov  qword[rbp+POS.ROOT_STATE_PTR],rax

			pop  rdi rsi rbx
			ret

.Failed:		lea  rdi,[szParseError]
		       call  _WriteOut
			lea  rsi,[szStartPosition]
		       call  ParseFEN
			pop  rdi rsi rbx
			ret




VerifyPosition: 	; in: rbp position (POS)
			; out: eax =  0 if position is illegal
			;      eax = -1 if position is legal

		       push  rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]


  .VerifyKings:
		    _popcnt  rax,qword[rbp+STATE.WKING],r8
			cmp  eax,1
			jne  .Failed
		    _popcnt  rax,qword[rbp+STATE.BKING],r8
			cmp  eax,1
			jne  .Failed

  .VerifyPawns: 	mov  rax,qword[BitBoard_Rank8]
			 or  rax,qword[BitBoard_Rank1]
			mov  rcx,qword[rbp+STATE.WPAWNS]
			 or  rcx,qword[rbp+STATE.BPAWNS]
		       test  rax,rcx
			jnz  .Failed

  .VerifyWhiteOO:      test  byte[rbp+STATE.CASTLING],1
			 jz  .VerifyWhiteOOO
			 bt  qword[rbp+STATE.WKING],8*7+4
			jnc  .Failed
			 bt  qword[rbp+STATE.WROOKS],8*7+7
			jnc  .Failed

  .VerifyWhiteOOO:     test  byte[rbp+STATE.CASTLING],2
			 jz  .VerifyBlackOO
			 bt  qword[rbp+STATE.WKING],8*7+4
			jnc  .Failed
			 bt  qword[rbp+STATE.WROOKS],8*7+0
			jnc  .Failed

  .VerifyBlackOO:      test  byte[rbp+STATE.CASTLING],4
			 jz  .VerifyBlackOOO
			 bt  qword[rbp+STATE.BKING],8*0+4
			jnc  .Failed
			 bt  qword[rbp+STATE.BROOKS],8*0+7
			jnc  .Failed

  .VerifyBlackOOO:     test  byte[rbp+STATE.CASTLING],8
			 jz  .VerifyPieces
			 bt  qword[rbp+STATE.BKING],8*0+4
			jnc  .Failed
			 bt  qword[rbp+STATE.BROOKS],8*0+0
			jnc  .Failed

  .VerifyPieces:	mov  rcx,qword[rbp+STATE.WKING]
		    _popcnt  rdx,qword[rbp+STATE.WPIECES],r8
      irps p, PAWNS KNIGHTS BISHOPS ROOKS QUEENS {
		    _popcnt  rax,qword[rbp+STATE.W#p],r8
			 or  rcx,qword[rbp+STATE.W#p]
			sub  edx,eax				 }
			sub  edx,1
			jnz  .Failed
			cmp  rcx,qword[rbp+STATE.WPIECES]
			jne  .Failed

			mov  rcx,qword[rbp+STATE.BKING]
		    _popcnt  rdx,qword[rbp+STATE.BPIECES],r8
      irps p, PAWNS KNIGHTS BISHOPS ROOKS QUEENS {
		    _popcnt  rax,qword[rbp+STATE.B#p],r8
			 or  rcx,qword[rbp+STATE.B#p]
			sub  edx,eax				 }
			sub  edx,1
			jnz  .Failed
			cmp  rcx,qword[rbp+STATE.BPIECES]
			jne  .Failed

			xor  edx,edx
    .VerifyBoard:     movzx  eax,byte[rbp+STATE.BOARD+rdx]
		       test  eax,eax
			 jz  @f
			cmp  eax,KING
			 ja  .Failed
			mov  rcx,[rbp+STATE.WPIECES+8*rax]
			xor  rcx,[rbp+STATE.BPIECES+8*rax]
			 bt  rcx,rdx
			jnc  .Failed
		@@:	add  edx,1
			cmp  edx,64
			 jb  .VerifyBoard

    .VerifyEP:		mov  rcx,qword[rbp+STATE.EPSQUARE]
		    _popcnt  rax,rcx,r8
		       test  rcx,rcx
			 jz  @f
			cmp  eax,1
			jne  .Failed
			mov  rax,( ((2 shl SQUARE_H3) - (1 shl SQUARE_A3)) + ((2 shl SQUARE_H6) - (1 shl SQUARE_A6)) )
		       test  rax,rcx
			 jz  .Failed
			bsf  rcx,rcx
		    ; make sure square behind ep square is empty
		      movzx  eax,byte[rbp+STATE.SIDE]
			and  eax,16
			lea  eax,[rax+rcx-8]
			 bt  qword[rbp+STATE.WPIECES+8*0],rax
			 jc  .Failed
			 bt  qword[rbp+STATE.BPIECES+8*0],rax
			 jc  .Failed
		    ; and square in front is occupied by one of their pawns
		      movzx  edx,byte[rbp+STATE.XSIDE]
			and  edx,64
		      movzx  eax,byte[rbp+STATE.XSIDE]
			and  eax,16
			lea  eax,[rax+rcx-8]
			 bt  qword[rbp+rdx+8*0],rax
			jnc  .Failed
		@@:

    .VerifyKingCapture:
		    ; make sure we can't capture their king



    .Done:
			 or  eax,-1
			pop  rbp
			ret

.Failed:		xor  eax,eax
			pop  rbp
			ret


FillInPosition:
		       ; in: rbp position (POS)
		       ; fill in incrementally updated information of surrent state
		       push  rbx
			mov  rbx,[rbp+POS.CURR_STATE_PTR]
		       call  ComputeHashKeys
			mov  qword[rbx+STATE.HASHKEY],rax
			mov  qword[rbx+STATE.MHASHKEY],rdx
			mov  qword[rbx+STATE.PHASHKEY],rcx
		       call  ComputeScores
			mov  word[rbx+STATE.WMSCORE],ax
			mov  word[rbx+STATE.BMSCORE],dx
		      _movq  qword[rbx+STATE.WPSTMG],xmm0
			pop  rbx
			ret




ComputeHashKeys:       ; in: rbp position (POS)
		       ; out: rax = HASHKEY
		       ;      rdx = MHASHKEY
		       ;      rcx = PHASHKEY

		       push  rbx rsi rbp

			mov  rbp,[rbp+POS.CURR_STATE_PTR]

	; mhash key to return
		      movsx  rdx,byte[rbp+STATE.SIDE]

	; phash key to return
			xor  rcx,rcx

	; all of the pieces on the board
			mov  rbx,qword[rbp+STATE.BPIECES]
			xor  esi,esi
    .NextSquare:      movzx  r8d,byte[rbp+STATE.BOARD+rsi]
			mov  r9d,r8d
			cmp  r9d,PAWN+1
			sbb  r9,r9
			 bt  rbx,rsi
			adc  r8d,r8d
			shl  r8d,6+3
			xor  rdx,qword[MaterialKeys+r8+8*rsi]
			and  r9,qword[MaterialKeys+r8+8*rsi]
			xor  rcx,r9
			add  esi,1
			cmp  esi,64
			 jb  .NextSquare

	; hash key to return
			mov  rax,rdx
	; castling rights
		      movzx  r8d,byte[rbp+STATE.CASTLING]
			xor  rax,qword[CastleKey+8*r8]
	; ep square
			bsf  r8,qword[rbp+STATE.EPSQUARE]
			 jz  @f
			and  r8d,7
			xor  rax,qword[EpKey+8*r8]
		@@:
			pop  rbp rsi rbx
			ret



ComputeScores: ; in: rbp address of POS

		       push  rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]

		      _pxor  xmm0,xmm0,xmm0
			mov  eax,-1
		      _movq  xmm3,rax
			shl  rax,32
		      _movq  xmm2,rax

			mov  r10,qword[rbp+STATE.WPIECES]

			xor  eax,eax
			xor  edx,edx
			xor  ecx,ecx
	    .NextSquare:
		   ; rcx = square
		   ; r8d = type
		      movzx  r8d,byte[rbp+STATE.BOARD+rcx]
			mov  r9,r8
			shl  r9,6+3

			 bt  r10,rcx
			 jc  .WhitePiece

	   .BlackPiece:
			add  edx,dword[MaterialScores+4*r8]
		      _movq  xmm1,qword[PstScores+r9+8*rcx]
		      _pand  xmm1,xmm1,xmm2
		     _paddw  xmm0,xmm0,xmm1
			jmp  @f

	   .WhitePiece:
			add  eax,dword[MaterialScores+4*r8]
		      _movq  xmm1,qword[PstScores+r9+8*rcx]
		      _pand  xmm1,xmm1,xmm3
		     _paddw  xmm0,xmm0,xmm1

			@@:

			add  ecx,1
			cmp  ecx,64
			 jb  .NextSquare

			pop  rbp
			ret






















