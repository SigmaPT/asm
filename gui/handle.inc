

MouseUpHandler_SETUP:
			ret




MouseDownHandler_SETUP:
		       push  rbp rdi rsi rbx r15

 if 0
			lea  rbp, qword [BoardPosition]

		      movzx  ebx,byte[BoardFlip]
			and  ebx,7
			mov  ecx,MAIN_SQUARE_SIZE

			mov  eax,dword[Mouse.x]
			sub  eax,MAIN_BOARD_OFFSET_X
			 js  .Reset
			xor  edx,edx
			div  ecx
			mov  r8d,eax
			xor  r8d,ebx
			cmp  eax,8
			jae  .Reset
			mul  ecx
			add  eax,MAIN_BOARD_OFFSET_X
			sub  eax,dword[Mouse.x]
			mov  dword[MouseDiff.x],eax

			mov  eax,dword[Mouse.y]
			sub  eax,MAIN_BOARD_OFFSET_Y
			 js  .Reset
			xor  edx,edx
			div  ecx
			mov  r9d,eax
			xor  r9d,ebx
			cmp  eax,8
			jae  .Reset
			mul  ecx
			add  eax,MAIN_BOARD_OFFSET_Y
			sub  eax,dword[Mouse.y]
			mov  dword[MouseDiff.y],eax

			lea  ecx,[8*r9+r8]

			mov  eax,dword[KeyMask]
			and  eax,KEY_R_MASK+KEY_Q_MASK+KEY_K_MASK+KEY_P_MASK+KEY_B_MASK+KEY_N_MASK+KEY_EP_MASK
			bsf  eax,eax

			cmp  eax,7
			 je  .Extra

			mov  byte[rbp+Pos.board+rcx],al

	; remove piece
		irps i, 0 1 2 3 4 5 6 {
			btr  qword[rbp+STATE.WPIECES+8*i],rcx
			btr  qword[rbp+STATE.BPIECES+8*i],rcx		   }

	; set piece
			 bt  dword[KeyMask],31
			sbb  edx,edx
			and  edx,64
			add  rdx,rbp
		       test  eax,eax
			 jz  @f
			bts  qword[rdx+STATE.WPIECES+8*0],rcx
			bts  qword[rdx+STATE.WPIECES+8*rax],rcx
		  @@:
      .Return:
			pop  r15 rbx rsi rdi rbp
			ret

	.Extra:
			cmp  ecx,SQUARE_H1
			jne  @f
			xor  byte[rbp+STATE.CASTLING],1
		  @@:	cmp  ecx,SQUARE_A1
			jne  @f
			xor  byte[rbp+STATE.CASTLING],2
		  @@:	cmp  ecx,SQUARE_H8
			jne  @f
			xor  byte[rbp+STATE.CASTLING],4
		  @@:	cmp  ecx,SQUARE_A8
			jne  @f
			xor  byte[rbp+STATE.CASTLING],8
		  @@:	mov  eax,ecx
			shr  eax,3
			cmp  eax,2
			 je  @f
			cmp  eax,5
			 je  @f
			jmp  .Return

		@@:	xor  eax,eax
			bts  rax,rcx
			cmp  qword[rbp+STATE.EPSQUARE],rax
			jne  @f
			xor  eax,eax
	       @@:	mov  qword[rbp+STATE.EPSQUARE],rax
			jmp  .Return
 end if
    .Reset:
			pop  r15 rbx rsi rdi rbp
			ret




MouseUpHandler_PROM:
			ret


MouseDownHandler_PROM:
		       push   rbp rdi rsi
			lea   rbp, [BoardPos]


			mov  ecx,MAIN_SQUARE_SIZE
			mov  eax,dword[Mouse.x]
			sub  eax,dword[Promotion.X]
			 js  .Miss
			xor  edx,edx
			div  ecx
			cmp  eax,4
			jae  .Miss

			lea  ecx,[8*eax]
			mov  edi,'nbrq'
			shr  edi,cl
			and  edi,0x0FF
			shl  rdi,32

		      movzx  ecx,byte[MouseFromSquare]
		       call  SquareToCoor
		       push  rax
		      movzx  ecx,byte[MouseToSquare]
		       call  SquareToCoor
			pop  rcx
			mov  byte[GameMode],0

			shl  eax,16
			 or  eax,ecx
			 or  rax,rdi

			mov  byte[MouseFromSquare],-1
			mov  byte[MouseToSquare],-1


			mov   rsi, qword [rbp+PosEx.move]
			xor   ecx, ecx
			mov   qword [rsi+MoveData.moveUci], rax
			mov   qword [rsi+MoveData.ponderUci], rcx
			mov   qword [rsi+MoveData.ponderSan], rcx
		     invoke   GetTickCount
			mov   qword [rsi+MoveData.time2],rax

		     invoke  SendMessage,qword[hMainWindow],WM_COMMAND,ID_CMD_MAKEMOVE,r9


.Miss:
			mov  byte[MouseFromSquare],-1
			mov  byte[MouseToSquare],-1

			pop  rsi rdi rbp
			ret







MouseUpHandler_NORMAL:
		       push   rbp
			lea   rbp, [BoardPos]

			xor   eax, eax
			mov   qword [HighlightMask], rax
			cmp   byte [MouseFromSquare], -1
			 je   .Reset
			mov   ecx, MAIN_SQUARE_SIZE

			mov   eax, dword [MouseDiff.x]
			add   eax, MAIN_SQUARE_SIZE/2
			add   eax, dword [Mouse.x]

			sub   eax, MAIN_BOARD_OFFSET_X
			 js   .Reset
			xor   edx, edx
			div   ecx
			cmp   eax, 8
			jae   .Reset
			cmp   byte [BoardFlip], 0
			 je   @f
			xor   eax, 7
		  @@:	mov   r8d, eax

			mov   eax, dword[MouseDiff.y]
			add   eax, MAIN_SQUARE_SIZE/2
			add   eax, dword[Mouse.y]

			sub   eax, MAIN_BOARD_OFFSET_Y
			 js   .Reset
			xor   edx, edx
			div   ecx
			cmp   eax, 8
			jae   .Reset
			cmp   byte [BoardFlip], 0
			jne   @f
			xor   eax, 7
		  @@:	mov   r9d, eax
			lea   ecx, [8*r9+r8]
			mov   byte [MouseToSquare],cl
		      movzx   eax, byte [MouseFromSquare]
			cmp   byte [rbp+Pos.board+rax], 8*White+Pawn
			 je   .CheckWhitePawnPromotion
			cmp   byte [rbp+Pos.board+rax], 8*Black+Pawn
			 je   .CheckBlackPawnPromotion
   .Play:
		      movzx   ecx, byte [MouseFromSquare]
		       call   SquareToCoor
		      movzx   ecx, byte [MouseToSquare]
			cmp   cl, byte [MouseFromSquare]
			 je   .Reset
		       push   rax
		       call   SquareToCoor
			pop   rcx
			shl   eax, 16
			 or   eax, ecx

			mov   byte [MouseFromSquare], -1
			mov   byte [MouseToSquare], -1

			mov   rsi, qword [rbp+PosEx.move]
			xor   ecx, ecx
			mov   qword [rsi+MoveData.moveUci], rax
			mov   qword [rsi+MoveData.ponderUci], rcx
			mov   qword [rsi+MoveData.ponderSan], rcx
		     invoke   GetTickCount
			mov   qword [rsi+MoveData.time2],rax

		     invoke   SendMessage, qword [hMainWindow], WM_COMMAND, ID_CMD_MAKEMOVE, r9

   .Reset:		mov   word [MouseFromSquare], -1
			pop   rbp
			ret


.CheckBlackPawnPromotion:
		      movzx   eax, byte [MouseToSquare]
			shr   eax, 3
			cmp   eax, 0
			jne   .Play

			mov   eax, dword [Mouse.x]
			add   eax, 3*48*3
			shr   eax, 2
			mov   dword [Promotion.X], eax
			mov   eax, dword [Mouse.y]
			mov   dword [Promotion.Y], MAIN_BOARD_OFFSET_Y+13*MAIN_SQUARE_SIZE/2

			mov   byte [GameMode], GAMEMODE_PROM
			pop   rbp
			ret

.CheckWhitePawnPromotion:
		      movzx   eax, byte [MouseToSquare]
			shr   eax, 3
			cmp   eax, 7
			jne   .Play

			mov   eax, dword [Mouse.x]
			add   eax, 3*48*3
			shr   eax, 2
			mov   dword [Promotion.X], eax
			mov   dword [Promotion.Y], MAIN_BOARD_OFFSET_Y+1*MAIN_SQUARE_SIZE/2

			mov   byte [GameMode], GAMEMODE_PROM
			pop   rbp
			ret



SquareToCoor:		mov  eax,ecx
			and  eax,7
			add  eax,'a'
			shr  ecx,3
			add  ecx,'1'
			mov  ah,cl
			ret



MouseDownHandler_NORMAL:

		       push   rbp rdi rsi rbx r15

		      movzx   ebx, byte[BoardFlip]
			and   ebx, 7
			mov   ecx, MAIN_SQUARE_SIZE

			mov   eax,dword[Mouse.x]
			sub   eax,MAIN_BOARD_OFFSET_X
			 js   .Reset
			xor   edx,edx
			div   ecx
			mov   r8d,eax
			xor   r8d,ebx
			cmp   eax,8
			jae   .Reset
			mul   ecx
			add   eax,MAIN_BOARD_OFFSET_X
			sub   eax,dword[Mouse.x]
			mov   dword[MouseDiff.x],eax

			mov  eax,dword[Mouse.y]
			sub  eax,MAIN_BOARD_OFFSET_Y
			 js  .Reset
			xor  edx,edx
			div  ecx
			mov  r9d,eax
			xor  r9d,ebx
			cmp  eax,8
			jae  .Reset
			mul  ecx
			add  eax,MAIN_BOARD_OFFSET_Y
			sub  eax,dword[Mouse.y]
			mov  dword[MouseDiff.y],eax


			lea   rbp, [BoardPos]

			xor   r9, 7
			lea   ecx, [8*r9+r8]

		       push   rcx r12
			mov   r12d, ecx
		      movzx   eax, byte [rbp+Pos.board+r12]
			xor   ecx, ecx
			cmp   r12l, byte [MouseFromSquare]
			 je   @f
			mov   rcx, qword[PieceToBitmapTable+8*rax]
		  @@:	mov   qword [GrabbedPiece],rcx
			pop   r12 rcx

			mov   byte [MouseFromSquare],cl

			cmp  dword[HighlightMode],HIGHLIGHT_MODE_LEGAL
			jne  @f
		       call  UpdateHighlightMask
			@@:


			pop  r15 rbx rsi rdi rbp
			ret

    .Reset:

			mov  byte[MouseFromSquare],-1
			pop  r15 rbx rsi rdi rbp
			ret




