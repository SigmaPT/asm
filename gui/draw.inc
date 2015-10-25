





DrawBitmap:

		       push   rbp rbx rdi rsi r13 r14 r15


			lea   rbp, [BoardPos]

       ; draw board
		      ;  mov   rcx, qword [ChessBoardBitmap]

			lea   rcx, [BmpChessBoard]
			mov   eax, 0
			mov   edx, 0
			mov   r8d, dword[BoardSize]
			mov   r9d, dword[BoardSize]
		       call   BitBltBitmap
		      ;  jmp   .Done



       ; draw current mouse squares
			mov   ecx, dword[BoardSquareSize]
			mov   eax, dword[Mouse.x]
			sub   eax, dword[BoardBoarderSize]
			 js   @f
			xor   edx, edx
			div   ecx
			cmp   eax, 8
			jae   @f
			mov   r8d, eax
			mov   eax, dword[Mouse.y]
			sub   eax, dword[BoardBoarderSize]
			 js   @f
			xor   edx, edx
			div   ecx
			cmp   eax, 8
			jae   @f
			mov   edx, eax
		       imul   edx, dword[BoardSquareSize]
			mov   eax, r8d
		       imul   eax, dword[BoardSquareSize]
			add   eax, dword[BoardBoarderSize]
			add   edx, dword[BoardBoarderSize]
			mov   ebx, dword[MouseSquareColor]
		       call  DrawAverageSquare_BoardSquareSize
		  @@:

       ; draw previous move
			cmp   byte [GameMode], GAMEMODE_SETUP
			 je   @f
			mov   r15, qword [BoardPos+PosEx.move]
			sub   r15, sizeof.MoveData
			cmp   r15, qword [BoardPos+PosEx.moveTable]
			 jb   @f
			mov   eax, dword [r15+MoveData.moveInt]
			shr   eax, 6
		       call   ConvertTo
			lea   rcx, [BmpCircle]
			mov   r8d, dword [PrevMoveColor]
			mov   r9d, dword [PrevMoveColor]
		       call   BitBltAlphaMainSquare
			mov   eax, dword [r15+MoveData.moveInt]
		       call   ConvertTo
			lea   rcx, [BmpCircle]
			mov   r8d, dword [PrevMoveColor]
			mov   r9d, dword [PrevMoveColor]
		       call   BitBltAlphaMainSquare
	       @@:

       ; draw pieces
			xor   esi, esi
     .NextSquare:
			mov   eax, esi
			cmp   sil, byte[MouseFromSquare]
			 je   .NoPiece
		       call   ConvertTo
		      movzx   ecx, byte[rbp+Pos.board+rsi]
		       call   BitBltAlphaPiece
	  .NoPiece:
			add   esi, 1
			cmp   esi, 64
			 jb   .NextSquare


       ; draw from grabbed square
			cmp  byte[GameMode],GAMEMODE_SETUP
			 je  @f
		      movzx  eax,byte[MouseFromSquare]
			cmp  al,-1
			 je  @f
		       call  ConvertTo
			lea  rcx,[BmpCircle]
			mov   r8d, dword [PrevMoveColor]
			mov   r9d, dword [PrevMoveColor]
		       call   BitBltAlphaMainSquare
	       @@:

       ; draw highlights
		xor  esi,esi
.NextMaskPos:	mov  eax,esi
		 bt  qword[HighlightMask],rsi
		jnc  @f
	       call  ConvertTo
		mov  ebx,dword[HighlightColor]
	       call  DrawAverageSquare_BoardSquareSize
	 @@:	add  esi,1
		cmp  esi,64
		 jb  .NextMaskPos

       ; draw grabbed piece
		cmp  byte[MouseFromSquare], -1
		 je  .GrabbedDone
		mov  ecx, dword[BoardSquareSize]
	       imul  ecx, 7
		add  ecx, dword[BoardBoarderSize]
		mov  eax, dword[MouseDiff.x]
		mov  edx, dword[MouseDiff.y]
		add  eax, dword[Mouse.x]
		jns  @f
		xor  eax, eax
	@@:	add  edx, dword[Mouse.y]
		jns  @f
		xor  edx, edx
	@@:	cmp  eax, ecx
	      cmova  eax, ecx
		cmp  edx, ecx
	      cmova  edx, ecx
	      movzx  ecx, byte[GrabbedPiece]
	       call  BitBltAlphaPiece
.GrabbedDone:


.Done:
		pop  r15 r14 r13 rsi rdi rbx rbp
		ret





DrawBoardSETUP:

	       push   rbp rbx rdi rsi r13 r14 r15
		lea   rbp, [BoardPos]

       ; draw board
		lea   rcx, [BmpChessBoard]
		mov   eax, 0
		mov   edx, 0
		mov   r8d, dword[BoardSize]
		mov   r9d, dword[BoardSize]
	       call   BitBltBitmap

      ; draw ep square and casltig eights

		mov  ebx,dword[HighlightColor]

	       test  byte[SetupState+State.castlingRights],1
		 jz  @f
		mov  eax,SQ_H1
	       call  ConvertTo
	       call  DrawAverageSquare_BoardSquareSize
	   @@:
	       test  byte[SetupState+State.castlingRights],2
		 jz  @f
		mov  eax,SQ_A1
	       call  ConvertTo
	       call  DrawAverageSquare_BoardSquareSize
	   @@:
	       test  byte[SetupState+State.castlingRights],4
		 jz  @f
		mov  eax,SQ_H8
	       call  ConvertTo
	       call  DrawAverageSquare_BoardSquareSize
	   @@:
	       test  byte[SetupState+State.castlingRights],8
		 jz  @f
		mov  eax,SQ_A8
	       call  ConvertTo
	       call  DrawAverageSquare_BoardSquareSize
	   @@:
	      movzx  eax, byte[SetupState+State.epSquare]
		cmp  eax, 64
		jae  @f
	       call  ConvertTo
	       call  DrawAverageSquare_BoardSquareSize
	   @@:

       ; draw pieces
		xor   esi, esi
.NextSquare:
		mov   eax, esi
		cmp   sil, byte[MouseFromSquare]
		 je   .NoPiece
	       call   ConvertTo
	      movzx   ecx, byte[SetupPos+Pos.board+rsi]
	       call   BitBltAlphaPiece
.NoPiece:
		add   esi, 1
		cmp   esi, 64
		 jb   .NextSquare

       ; draw grabbed piece
		cmp  byte[MouseFromSquare], -1
		 je  .GrabbedDone
		mov  ecx, dword[BoardSquareSize]
	       imul  ecx, 7
		add  ecx, dword[BoardBoarderSize]
		mov  eax, dword[MouseDiff.x]
		mov  edx, dword[MouseDiff.y]
		add  eax, dword[Mouse.x]
		jns  @f
		xor  eax, eax
	@@:	add  edx, dword[Mouse.y]
		jns  @f
		xor  edx, edx
	@@:	cmp  eax, ecx
	      cmova  eax, ecx
		cmp  edx, ecx
	      cmova  edx, ecx
	      movzx  ecx, byte[GrabbedPiece]
	       call  BitBltAlphaPiece
.GrabbedDone:
		pop  r15 r14 r13 rsi rdi rbx rbp
		ret




BitBltBitmap:  ;  (eax,edx): coordinate on which to paste
	       ;  r8d,r9d:   width, height
	       ;  rcx:       address of bitmap

		       push  rdi rsi
			mov  rsi,rcx
			mov  edi,dword[Bitmap.x]
		       imul  edi,edx
			add  edi,eax
			shl  edi,2
			add  rdi,qword[ppvBits]
			mov  ecx,r9d
	     .l1:      push  rdi
			mov  edx,r8d
	      .l2:	xor  eax,eax
		      lodsd
		      stosd
			sub  edx,1
			jnz  .l2
			pop  rdi
			mov  eax,dword[Bitmap.x]
			lea  rdi,[rdi+4*rax]
			sub  ecx,1
			jnz  .l1
			pop  rsi rdi
			ret



ConvertTo:
	; in: eax square
	; out: (eax,edx) bitmap coordinates
			mov   edx, eax
			and   eax, 7
			cmp   byte [BoardFlip], 0
			 je   @f
			xor   eax, 7
		 @@:   imul   eax, dword[BoardSquareSize]
			add   eax, dword[BoardBoarderSize]
			shr   edx, 3
			and   edx, 7
			cmp   byte [BoardFlip], 0
			jne   @f
			xor   edx, 7
		 @@:   imul   edx, dword[BoardSquareSize]
			add   edx, dword[BoardBoarderSize]
			ret




BitBltAlphaPiece:
		mov  r9d, ecx
		and  ecx, 7
		shr  r9d, 3
		mov  r8d, dword[PieceColors+8*r9]
		mov  r9d, dword[PieceColors+8*r9+4]
		cmp  ecx, Pawn
		mov  rcx, qword[PieceTypeToBitmapTable+8*rcx]
		jae  BitBltAlphaMainSquare
		ret


BitBltAlphaMainSquare:	;  (eax,edx): coordinate on which to paste
			;  rcx: address of square bitmap
			;  0-128 is lerped between colors in r8d and r9d

		       push   rdi rsi

		; to go upper left
			mov   rsi, rcx
			mov   edi, dword[Bitmap.x]
		       imul   edi, edx
			add   edi, eax
			shl   edi, 2
			add   rdi, qword[ppvBits]

		; prepare the colors
			mov   r10, 0x0000000100010001
			mov   eax, 0x00808080
		       pxor   xmm7, xmm7
		       movd   xmm6, eax
		       movd   xmm5, r9d
		       movd   xmm4, r8d
		  punpcklbw   xmm6, xmm7
		  punpcklbw   xmm5, xmm7
		  punpcklbw   xmm4, xmm7

		; skip if bmp address is 0
			cmp   rsi, 64
			 jb   .Done

			mov   ecx, dword[BoardSquareSize]
	     .l1:      push   rdi
			mov   edx, dword[BoardSquareSize]
	      .l2:
		; get alpha component 0-128 in xmm2
		      movzx   eax, byte [rsi+1]
		       imul   rax, r10
		       movq   xmm2, rax

		; original color
		       movd   xmm0, dword [rdi]
		  punpcklbw   xmm0, xmm7

		; get color in xmm1
		      movzx   eax, byte [rsi+0]
		       imul   rax, r10
		       movq   xmm1, rax
		     movdqa   xmm3, xmm6
		      psubw   xmm3, xmm1
		     pmullw   xmm1, xmm4
		     pmullw   xmm3, xmm5
		      paddw   xmm1, xmm3
		      psrlw   xmm1, 7


		; blend with original color
		     movdqa  xmm3,xmm6
		      psubw  xmm3,xmm2

		     pmullw  xmm0,xmm2
		     pmullw  xmm1,xmm3
		      paddw  xmm0,xmm1
		      psrlw  xmm0,7

		   packuswb  xmm0,xmm7
		       movd  eax,xmm0
		      stosd

			add  rsi,2
			sub  edx,1
			jnz  .l2
			pop  rdi
			mov  eax,dword[Bitmap.x]
			lea  rdi,[rdi+4*rax]
			sub  ecx,1
			jnz  .l1
.Done:
			pop  rsi rdi
			ret











_BitBltMainSquare:  ;  (eax,edx): coordinate on which to paste
		   ;  ecx: address of square bitmap
		       push  rdi rsi
			mov  esi,ecx
			mov  edi,dword[Bitmap.x]
		       imul  edi,edx
			add  edi,eax
			shl  edi,2
			add  rdi,qword[ppvBits]
			mov  ecx,dword[BoardSquareSize]
	     .l1:      push  rdi
			mov  edx,dword[BoardSquareSize]
	      .l2:	xor  eax,eax
		      lodsd
		      stosd
			sub  edx,1
			jnz  .l2
			pop  rdi
			mov  eax,dword[Bitmap.x]
			lea  rdi,[rdi+4*rax]
			sub  ecx,1
			jnz  .l1
			pop  rsi rdi
			ret



DrawSquare:
		    ; (eax,edx): top left
		    ; r8d: width
		    ; r9d: height
		    ; rbx: color


		       push  rdi rsi
			mov  edi,dword[Bitmap.x]
		       imul  edi,edx
			add  edi,eax
			shl  edi,2
			add  rdi,qword[ppvBits]
			xor  ecx,ecx
	     .l1:      push  rdi
			mov  esi,ecx
			and  esi,31
			shl  esi,5
			xor  edx,edx
	      .l2:	mov  eax,edx
			and  eax,31
			add  eax,esi
			mov  eax,ebx
		      stosd
			add  edx,1
			cmp  edx,r8d
			 jb  .l2
			pop  rdi
			mov  eax,dword[Bitmap.x]
			lea  rdi,[rdi+4*rax]
			add  ecx,1
			cmp  ecx,r9d
			 jb  .l1
			pop  rsi rdi
			ret

DrawAverageSquare_BoardSquareSize:
		mov  r8d, dword[BoardSquareSize]
		mov  r9d, dword[BoardSquareSize]

DrawAverageSquare:
		    ; (eax,edx): top left
		    ; r8d: width
		    ; r9d: height
		    ; rbx: color


		       push  rdi rsi

		       pxor  xmm7,xmm7
		       movd  xmm1,ebx
		  punpcklbw  xmm1,xmm7

			mov  edi,dword[Bitmap.x]
		       imul  edi,edx
			add  edi,eax
			shl  edi,2
			add  rdi,qword[ppvBits]
			xor  ecx,ecx
	     .l1:      push  rdi
			mov  esi,ecx
			and  esi,31
			shl  esi,5
			xor  edx,edx
	      .l2:
		       movd  xmm0,dword[rdi]
		  punpcklbw  xmm0,xmm7
		      paddw  xmm0,xmm1
		      psrlw  xmm0,1
		   packuswb  xmm0,xmm7
		       movd  dword[rdi],xmm0
			add  rdi,4


		   ;     mov  eax,edx
		   ;     and  eax,31
		   ;     add  eax,esi
		   ;     mov  eax,ebx
		   ;   stosd
			add  edx,1
			cmp  edx,r8d
			 jb  .l2
			pop  rdi
			mov  eax,dword[Bitmap.x]
			lea  rdi,[rdi+4*rax]
			add  ecx,1
			cmp  ecx,r9d
			 jb  .l1
			pop  rsi rdi
			ret








DrawRect:	    ; (eax,edx): top left
		    ; r8d: width
		    ; r9d: height
		    ; rbx: color


		       push  rdi rsi
			mov  edi,dword[Bitmap.x]
		       imul  edi,edx
			add  edi,eax
			shl  edi,2
			add  rdi,qword[ppvBits]
		       push  rdi

			mov  eax,ebx
			mov  ecx,r8d
		  rep stosd
			sub  rdi,4

			lea  ecx,[r9d-1]
	    @@: 	mov  dword[rdi],ebx
			mov  eax,dword[Bitmap.x]
			lea  rdi,[rdi+4*rax]
			sub  ecx,1
			jnz  @b

			pop  rdi

			lea  ecx,[r9d-1]
	    @@: 	mov  dword[rdi],ebx
			mov  eax,dword[Bitmap.x]
			lea  rdi,[rdi+4*rax]
			sub  ecx,1
			jnz  @b

			mov  eax,ebx
			mov  ecx,r8d
		  rep stosd

			pop  rsi rdi
			ret




DrawPromotion:	       push  rbp rsi rdi

			mov  rdi,qword[ppvBits]
			mov  ecx,dword[Bitmap.y]
		       imul  ecx,dword[Bitmap.x]
			shl  ecx,2
		@@:   movzx  eax,byte[rdi]
			shr  eax,2
		      stosb
			sub  ecx,1
			jnz  @b

			xor  ebp,ebp
      .NextPromPiece:
			mov   eax, dword [BoardPos+Pos.sideToMove]
			mov   rcx, qword [PieceTypeToBitmapTable+8*(Knight+rbp)]
			mov   eax, ebp
		       imul   eax, dword[BoardSquareSize]
			add   eax, dword[Promotion.X]
			mov   edx, dword[Promotion.Y]
		       call   BitBltAlphaMainSquare
			add   ebp, 1
			cmp   ebp, 4
			 jb   .NextPromPiece

			mov  ecx,dword[BoardSquareSize]
			mov  eax,dword[Mouse.x]
			sub  eax,dword[Promotion.X]
			 js  @f
			xor  edx,edx
			div  ecx
			cmp  eax,4
			jae  @f
			mul  ecx
			add  eax,dword[Promotion.X]

			mov  edx,dword[Mouse.y]
			sub  edx,dword[Promotion.Y]
			 js  @f
			cmp  edx,ecx
			jae  @f
			mov  edx,dword[Promotion.Y]
			add  eax,1
			add  edx,1
			mov  ebx,0x00909090

			mov   r8d, dword[BoardSquareSize]
			sub   r8d, 2
			mov   r9d, r8d
		       call   DrawRect
	       @@:
			pop   rdi rsi rbp
			ret






