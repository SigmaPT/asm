

VerifyState:		; in: rcx position (POS)
			;  eax = ( position is legal)

		       push  rbp
			mov  rbp,rcx

  .VerifyKings:
		    _popcnt  rax,qword[rbp+STATE.WKING]
			cmp  eax,1
			jne  .Failed
		    _popcnt  rax,qword[rbp+STATE.BKING]
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
		    _popcnt  rdx,qword[rbp+STATE.WPIECES]
      irps p, PAWNS KNIGHTS BISHOPS ROOKS QUEENS {
		    _popcnt  rax,qword[rbp+STATE.W#p]
			 or  rcx,qword[rbp+STATE.W#p]
			sub  edx,eax				 }
			sub  edx,1
			jnz  .Failed
			cmp  rcx,qword[rbp+STATE.WPIECES]
			jne  .Failed

			mov  rcx,qword[rbp+STATE.BKING]
		    _popcnt  rdx,qword[rbp+STATE.BPIECES]
      irps p, PAWNS KNIGHTS BISHOPS ROOKS QUEENS {
		    _popcnt  rax,qword[rbp+STATE.B#p]
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
		    _popcnt  rax,rcx
		       test  rcx,rcx
			 jz  .Done
			cmp  eax,1
			jne  .Failed
			mov  rax,( ((2 shl SQUARE_H3) - (1 shl SQUARE_A3)) + ((2 shl SQUARE_H6) - (1 shl SQUARE_A6)) )
		       test  rax,rcx
			 jz  .Failed
    .Done:
			 or  eax,-1
			pop  rbp
			ret

.Failed:		xor  eax,eax
			pop  rbp
			ret







VerifyPosition: 	; in: rbp position (POS)
			; crashes if position is illegal
		       push  rbp
			mov  rbp,[rbp+POS.STATE_PTR]




  .VerifyKings:
		    _popcnt  rax,qword[rbp+STATE.WKING]
			cmp  eax,1
			jne  .Failed
		    _popcnt  rax,qword[rbp+STATE.BKING]
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
		    _popcnt  rdx,qword[rbp+STATE.WPIECES]
      irps p, PAWNS KNIGHTS BISHOPS ROOKS QUEENS {
		    _popcnt  rax,qword[rbp+STATE.W#p]
			 or  rcx,qword[rbp+STATE.W#p]
			sub  edx,eax				 }
			sub  edx,1
			jnz  .Failed
			cmp  rcx,qword[rbp+STATE.WPIECES]
			jne  .Failed

			mov  rcx,qword[rbp+STATE.BKING]
		    _popcnt  rdx,qword[rbp+STATE.BPIECES]
      irps p, PAWNS KNIGHTS BISHOPS ROOKS QUEENS {
		    _popcnt  rax,qword[rbp+STATE.B#p]
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
		    _popcnt  rax,rcx
		       test  rcx,rcx
			 jz  .Done
			cmp  eax,1
			jne  .Failed
			mov  rax,( ((2 shl SQUARE_H3) - (1 shl SQUARE_A3)) + ((2 shl SQUARE_H6) - (1 shl SQUARE_A6)) )
		       test  rax,rcx
			 jz  .Failed
    .Done:
			 or  eax,-1
			pop  rbp
			ret

.Failed:		xor  eax,eax
			pop  rbp
			ret


if 0

FillInCurrentState:    ; in: rbp position (POS)
		       ; fill in hashkeys

		       push  rbx
			mov  rbx,[rbp+POS.STATE_PTR]
		       call  ComputeMaterialHashKey
			mov  qword[rbx+STATE.MHASHKEY],rax
		       call  ComputeHashKey
			mov  qword[rbx+STATE.HASHKEY],rax
			pop  rbx
			ret




ComputeMaterialHashKey:
		       ; in: rbp position (POS)

		       push  rbp
		       push  rbx rsi
			mov  rbp,[rbp+POS.STATE_PTR]

	; hash key to return
			xor  eax,eax
			mov  rcx,qword[SideKey]
			cmp  byte[rbp+STATE.SIDE],0
		     cmovne  rax,rcx

	; all of the pieces on the board
			mov  rbx,[rbp+STATE.BPIECES]
			xor  esi,esi
    .NextSquare:      movzx  ecx,byte[rbp+STATE.BOARD+rsi]
			 bt  rbx,rsi
			adc  ecx,ecx
			shl  ecx,6+3
			xor  rax,qword[MaterialKeys+rcx+8*rsi]
    .NoPieceOnSquare:	add  esi,1
			cmp  esi,64
			 jb  .NextSquare


			pop  rsi rbx
			pop  rbp
			ret



ComputeHashKey:
		       ; in: rbp position (POS)
		       push  rbx
			mov  rbx,[rbp+POS.STATE_PTR]
			call  ComputeMaterialHashKey
	; castling rights
		      movzx  ecx,byte[rbx+STATE.CASTLING]
			xor  rax,qword[CastleKey+8*rcx]
	; ep square
			xor  ecx,ecx			; incase there is no ep square ecx should be zero
			bsf  rcx,[rbx+STATE.EPSQUARE]
			xor  rax,qword[EpKey+8*rcx]
			pop  rbx
			ret


end if





















