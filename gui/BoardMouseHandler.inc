





MouseUpHandler_PROM:
			ret


MouseDownHandler_PROM:
		       push   rbp rdi rsi
			lea   rbp, [BoardPos]


			mov   ecx, dword[BoardSquareSize]
			mov   eax, dword[Mouse.x]
			sub   eax, dword[Promotion.X]
			 js   .Miss
			xor   edx, edx
			div   ecx
			cmp   eax, 4
			jae   .Miss

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


			mov   rsi, qword[rbp+PosEx.move]
			xor   ecx, ecx
			mov   qword[rsi+MoveData.moveUci], rax
			mov   qword[rsi+MoveData.ponderUci], rcx
			mov   qword[rsi+MoveData.ponderSan], rcx
		     invoke   GetTickCount
			mov   qword[rsi+MoveData.time2],rax
			mov   eax, 0x80000000
			mov   qword[rsi+MoveData.score], rax  ; write over drawCheck ect



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
			mov   ecx, dword[BoardSquareSize]

			mov   eax, dword[BoardSquareSize]
			shr   eax, 1
			add   eax, dword [MouseDiff.x]
			add   eax, dword [Mouse.x]

			sub   eax, dword[BoardBoarderSize]
			 js   .Reset
			xor   edx, edx
			div   ecx
			cmp   eax, 8
			jae   .Reset
			cmp   byte [BoardFlip], 0
			 je   @f
			xor   eax, 7
		  @@:	mov   r8d, eax

			mov   eax, dword[BoardSquareSize]
			shr   eax, 1
			add   eax, dword[MouseDiff.y]
			add   eax, dword[Mouse.y]

			sub   eax, dword[BoardBoarderSize]
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

			mov   rsi, qword[rbp+PosEx.move]
			xor   ecx, ecx
			mov   qword[rsi+MoveData.moveUci], rax
			mov   qword[rsi+MoveData.ponderUci], rcx
			mov   qword[rsi+MoveData.ponderSan], rcx
		     invoke   GetTickCount
			mov   qword[rsi+MoveData.time2],rax
			mov   eax, 0x80000000
			mov   qword[rsi+MoveData.score], rax  ; write over drawCheck ect



		     invoke   SendMessage, qword [hMainWindow], WM_COMMAND, ID_CMD_MAKEMOVE, r9

   .Reset:		mov   word [MouseFromSquare], -1
			pop   rbp
			ret

.CheckWhitePawnPromotion:
	      movzx   eax, byte[MouseToSquare]
		shr   eax, 3
		cmp   eax, 7
		jne   .Play
		xor   ecx, ecx
		jmp   .DoPromotion
.CheckBlackPawnPromotion:
	      movzx   eax, byte[MouseToSquare]
		shr   eax, 3
		cmp   eax, 0
		jne   .Play
		 or   ecx, -1
.DoPromotion:
		xor   cl, byte[BoardFlip]
		and   ecx, 12
		add   ecx, 1
		mov   eax, dword[BoardSquareSize]
	       imul   eax, 8
		add   eax, dword[Mouse.x]
		shr   eax, 2
		mov   dword [Promotion.X], eax
		mov   eax, dword[BoardSquareSize]
	       imul   eax, ecx
		shr   eax, 1
		add   eax, dword[BoardBoarderSize]
		mov   dword [Promotion.Y], eax
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
			mov   ecx, dword[BoardSquareSize]

			mov   eax,dword[Mouse.x]
			sub   eax,dword[BoardBoarderSize]
			 js   .Reset
			xor   edx,edx
			div   ecx
			mov   r8d,eax
			xor   r8d,ebx
			cmp   eax,8
			jae   .Reset
			mul   ecx
			add   eax,dword[BoardBoarderSize]
			sub   eax,dword[Mouse.x]
			mov   dword[MouseDiff.x],eax

			mov  eax,dword[Mouse.y]
			sub  eax,dword[BoardBoarderSize]
			 js  .Reset
			xor  edx,edx
			div  ecx
			mov  r9d,eax
			xor  r9d,ebx
			cmp  eax,8
			jae  .Reset
			mul  ecx
			add  eax,dword[BoardBoarderSize]
			sub  eax,dword[Mouse.y]
			mov  dword[MouseDiff.y],eax


			lea   rbp, [BoardPos]

			xor   r9, 7
			lea   ecx, [8*r9+r8]

		      movzx   eax, byte [rbp+Pos.board+rcx]
			xor   edx, edx
			cmp   cl, byte [MouseFromSquare]
		     cmovnz   edx, eax
			mov   byte [GrabbedPiece], dl
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





MouseUpHandler_SETUP:
	       push  rbp

		xor  eax, eax
		mov  qword [HighlightMask], rax

		cmp  byte [SetupSelection], 0
		jne  .Reset
		cmp  byte [MouseFromSquare], -1
		 je  .Reset
		mov  ecx, dword[BoardSquareSize]
		mov  eax, dword[BoardSquareSize]
		shr  eax, 1
		add  eax, dword[MouseDiff.x]
		add  eax, dword[Mouse.x]

		sub  eax, dword[BoardBoarderSize]
		 js  .Reset
		xor  edx, edx
		div  ecx
		cmp  eax, 8
		jae  .Reset
		cmp  byte[BoardFlip], 0
		 je  @f
		xor  eax, 7
	  @@:	mov  r8d, eax

		mov  eax, dword[BoardSquareSize]
		shr  eax, 1
		add  eax, dword[MouseDiff.y]
		add  eax, dword[Mouse.y]

		sub  eax, dword[BoardBoarderSize]
		 js  .Reset
		xor  edx, edx
		div  ecx
		cmp  eax, 8
		jae  .Reset
		cmp  byte[BoardFlip], 0
		jne  @f
		xor  eax, 7
	  @@:	mov  r9d, eax
		lea  ecx, [8*r9+r8]
		mov  byte[MouseToSquare],cl

.Play:
	      movzx  ecx, byte[MouseFromSquare]
	      movzx  edx, byte[MouseToSquare]
	      movzx  eax, byte[SetupPos+Pos.board+rcx]
		mov  byte[SetupPos+Pos.board+rdx], al
		mov  byte[SetupPos+Pos.board+rcx], 0
.Reset:
		mov  word[MouseFromSquare], -1
		pop  rbp
		ret




MouseDownHandler_SETUP:

	       push  rbp rdi rsi rbx r15

	      movzx  ebx, byte[BoardFlip]
		and  ebx, 7
		mov  ecx, dword[BoardSquareSize]

		mov  eax,dword[Mouse.x]
		sub  eax,dword[BoardBoarderSize]
		 js  .Reset
		xor  edx,edx
		div  ecx
		mov  r8d,eax
		xor  r8d,ebx
		cmp  eax,8
		jae  .Reset
		mul  ecx
		add  eax,dword[BoardBoarderSize]
		sub  eax,dword[Mouse.x]
		mov  dword[MouseDiff.x],eax

		mov  eax,dword[Mouse.y]
		sub  eax,dword[BoardBoarderSize]
		 js  .Reset
		xor  edx,edx
		div  ecx
		mov  r9d,eax
		xor  r9d,ebx
		cmp  eax,8
		jae  .Reset
		mul  ecx
		add  eax,dword[BoardBoarderSize]
		sub  eax,dword[Mouse.y]
		mov  dword[MouseDiff.y],eax

		xor   r9, 7
		lea   ecx, [8*r9+r8]

	      movzx   eax, byte[SetupPos+Pos.board+rcx]
		xor   edx, edx
		cmp   cl, byte[MouseFromSquare]
	     cmovnz   edx, eax
		mov   byte[GrabbedPiece], dl
		mov   byte[MouseFromSquare],cl

	      movzx  eax, byte[SetupSelection]
	       test  eax, eax
		jnz  .Other

		pop  r15 rbx rsi rdi rbp
		ret

.Other:
	      movzx  ecx, byte[MouseFromSquare]
		cmp  eax, 16
		jae  .Reset
		cmp  eax, 1
		 je  .Reset
		cmp  eax, 8
		 je  .Delete
		cmp  eax, 9
		 je  .Special
		jmp  .SetPiece
.Delete:
		xor  eax, eax
.SetPiece:
		mov  byte[SetupPos+Pos.board+rcx], al
.Reset:
		mov  byte[MouseFromSquare],-1
		pop  r15 rbx rsi rdi rbp
		ret
.Special:
		mov  eax, 1
		cmp  ecx, SQ_H1
		 je  .castling
		add  eax, eax
		cmp  ecx, SQ_A1
		 je  .castling
		add  eax, eax
		cmp  ecx, SQ_H8
		 je  .castling
		add  eax, eax
		cmp  ecx, SQ_H1
		 je  .castling
		mov  edx, 64
		cmp  al, byte[SetupState+State.epSquare]
	      cmove  eax, edx
		mov  byte[SetupState+State.epSquare], al
		jmp  .Reset
.castling:
		xor  byte[SetupState+State.castlingRights], al
		jmp  .Reset


