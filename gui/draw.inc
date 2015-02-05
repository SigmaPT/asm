

GetRandColor:	 ; in rbx address of c0,c1,c2
		       push  rbp

			mov  rbp,rsp
			sub  rsp,16*8
			and  rsp,-32

			mov  ecx,11
	       @@:    movzx  eax,byte[rbx+rcx]
		   cvtsi2ss  xmm0,eax
		      movss  [rsp+4*rcx],xmm0
			sub  ecx,1
			jns  @b

		       call  GetRand
			mov  edx,eax
		       call  GetRand

			mov  ecx,0x00F000
			and  eax,ecx
			and  edx,ecx

		   cvtsi2ss  xmm2,ecx
		   cvtsi2ss  xmm0,eax
		   cvtsi2ss  xmm1,edx
		      divss  xmm0,xmm2
		      divss  xmm1,xmm2
		     shufps  xmm0,xmm0,0
		     shufps  xmm1,xmm1,0

		      xorps  xmm7,xmm7

		     movaps  xmm2,dqword[rsp+16*1]
		      subps  xmm2,dqword[rsp+16*0]
		      mulps  xmm1,xmm2

		     movaps  xmm2,dqword[rsp+16*2]
		      subps  xmm2,dqword[rsp+16*0]
		      mulps  xmm0,xmm2

		      addps  xmm0,xmm1
		      addps  xmm0,dqword[rsp+16*0]

		   cvtps2dq  xmm0,xmm0
		   packssdw  xmm0,xmm7
		   packuswb  xmm0,xmm7
		       movd  eax,xmm0


			mov  rsp,rbp
			pop  rbp
			ret



CreateChessBoardBitmap:

		       push  rbp rsi rdi
			mov  rbp,rsp
			sub  rsp,16*8
			and  rsp,-32

		     invoke  VirtualFree,qword[ChessBoardBitmap],0,MEM_RELEASE

			mov  edx,4*CHESSBOARD_SIZE*CHESSBOARD_SIZE
		     invoke  VirtualAlloc,0,edx,MEM_COMMIT,PAGE_READWRITE
			mov  qword[ChessBoardBitmap],rax



			xor  edi,edi
	     .ColLoop:	xor  esi,esi
	      .RowLoop:

			lea  rbx,[BorderColor]

			xor  r9d,r9d

			mov  eax,esi
			sub  eax,MAIN_BOARD_OFFSET_X
			 js  .outside
			xor  edx,edx
			mov  ecx,MAIN_SQUARE_SIZE
			div  ecx
			cmp  eax,8
			jae  .outside
			mov  r8d,eax

			xor  eax,eax
			cmp  edx,0
		       sete  al
			 or  r9d,eax
			cmp  edx,MAIN_SQUARE_SIZE-1
		       sete  al
			 or  r9d,eax

			mov  eax,edi
			sub  eax,MAIN_BOARD_OFFSET_X
			 js  .outside
			xor  edx,edx
			mov  ecx,MAIN_SQUARE_SIZE
			div  ecx
			cmp  eax,8
			jae  .outside

			add  r8d,eax

			xor  eax,eax
			cmp  edx,0
		       sete  al
			 or  r9d,eax
			cmp  edx,MAIN_SQUARE_SIZE-1
		       sete  al
			 or  r9d,eax


			lea  rbx,[LightColor]
			lea  rdx,[DarkColor]
		       test  r8d,1
		     cmovnz  rbx,rdx

			lea  rdx,[LightGrooveColor]
			lea  rcx,[DarkGrooveColor]
		       test  r8d,1
		     cmovnz  rdx,rcx

		       test  r9d,r9d
		     cmovnz  rbx,rdx
			jmp  .get

	     .outside:
			mov  eax,MAIN_BOARD_OFFSET_X-1
			sub  eax,esi
			mov  edx,esi
			sub  edx,MAIN_BOARD_OFFSET_X+8*MAIN_SQUARE_SIZE
			cmp  eax,edx
		      cmovl  eax,edx

			mov  ecx,MAIN_BOARD_OFFSET_X-1
			sub  ecx,edi
			mov  edx,edi
			sub  edx,MAIN_BOARD_OFFSET_X+8*MAIN_SQUARE_SIZE
			cmp  ecx,edx
		      cmovl  ecx,edx

			cmp  eax,ecx
		      cmovl  eax,ecx

			lea  rbx,[OuterGrooveColor]
			cmp  eax,1
			 jb  .get

			lea  rbx,[BorderColor]
			cmp  eax,MAIN_BOARD_OFFSET_Y-2
			 jb  .get

			lea  rbx,[BorderColor2]
			cmp  eax,MAIN_BOARD_OFFSET_Y-1
			 jb  .get

			jmp  .done

	    .get:
		       call  GetRandColor
		       imul  ecx,edi,CHESSBOARD_SIZE
			add  ecx,esi
			shl  ecx,2
			add  rcx,qword[ChessBoardBitmap]
			mov  dword[rcx],eax
	    .done:
			add  esi,1
			cmp  esi,CHESSBOARD_SIZE
			 jb  .RowLoop
			add  edi,1
			cmp  edi,CHESSBOARD_SIZE
			 jb  .ColLoop

			mov  rsp,rbp
			pop  rdi rsi rbp
			ret






DrawBitmap:

		       push   rbp rbx rdi rsi r13 r14 r15


			lea   rbp, [BoardPos]

       ; draw board
			mov   rcx, qword [ChessBoardBitmap]
			mov   eax, 0
			mov   edx, 0
			mov   r8d, 2*MAIN_BOARD_OFFSET_X+8*MAIN_SQUARE_SIZE
			mov   r9d, 2*MAIN_BOARD_OFFSET_X+8*MAIN_SQUARE_SIZE
		       call   BitBltBitmap


       ; draw current mouse squares
			mov  ecx,MAIN_SQUARE_SIZE
			mov  eax,dword[Mouse.x]
			sub  eax,MAIN_BOARD_OFFSET_X
			 js  @f
			xor  edx,edx
			div  ecx
			cmp  eax,8
			jae  @f
			mov  r8d,eax
			mov  eax,dword[Mouse.y]
			sub  eax,MAIN_BOARD_OFFSET_Y
			 js  @f
			xor  edx,edx
			div  ecx
			cmp  eax,8
			jae  @f

		       imul  edx,eax,MAIN_SQUARE_SIZE
		       imul  eax,r8d,MAIN_SQUARE_SIZE
			add  eax,MAIN_BOARD_OFFSET_X
			add  edx,MAIN_BOARD_OFFSET_Y
			mov  ebx,dword[MouseSquareColor]
			mov  r8d,MAIN_SQUARE_SIZE
			mov  r9d,MAIN_SQUARE_SIZE
		       call  DrawAverageSquare
		  @@:

       ; draw previous move
			cmp   byte [GameMode], GAMEMODE_SETUP
			 je   @f
			mov   ebx, dword [PrevMoveColor]
			mov   r15, qword [BoardPos+PosEx.move]
			sub   r15, sizeof.MoveData
			cmp   r15, qword [BoardPos+PosEx.moveTable]
			 jb   @f
			mov   eax, dword [r15+MoveData.moveInt]
			shr   eax, 6
		       call   ConvertTo
			lea   rcx, [Circle]
		       call   BitBltAlphaMainSquareColor
			mov   eax, dword [r15+MoveData.moveInt]
		       call   ConvertTo
			lea   rcx, [Circle]
			mov   ebx, dword [PrevMoveColor]
		       call   BitBltAlphaMainSquareColor
	       @@:
  if 0
      ; draw ep square and casltig eights
			mov  rbp,qword[BoardPosition+POS.STATE_PTR]
			cmp  byte[GameMode],GAMEMODE_SETUP
			jne  .Skip

			mov  ebx,dword[HighlightColor]

		       test  byte[rbp+STATE.CASTLING],1
			 jz  @f
			mov  eax,SQUARE_H1
		       call  ConvertTo
			mov  r8d,MAIN_SQUARE_SIZE
			mov  r9d,MAIN_SQUARE_SIZE
		       call  DrawAverageSquare
		   @@:
		       test  byte[rbp+STATE.CASTLING],2
			 jz  @f
			mov  eax,SQUARE_A1
		       call  ConvertTo
			mov  r8d,MAIN_SQUARE_SIZE
			mov  r9d,MAIN_SQUARE_SIZE
		       call  DrawAverageSquare
		   @@:
		       test  byte[rbp+STATE.CASTLING],4
			 jz  @f
			mov  eax,SQUARE_H8
		       call  ConvertTo
			mov  r8d,MAIN_SQUARE_SIZE
			mov  r9d,MAIN_SQUARE_SIZE
		       call  DrawAverageSquare
		   @@:
		       test  byte[rbp+STATE.CASTLING],8
			 jz  @f
			mov  eax,SQUARE_A8
		       call  ConvertTo
			mov  r8d,MAIN_SQUARE_SIZE
			mov  r9d,MAIN_SQUARE_SIZE
		       call  DrawAverageSquare
		   @@:
			xor  eax,eax
			bsf  rax,qword[rbp+STATE.EPSQUARE]
			 jz  @f
		       call  ConvertTo
			mov  r8d,MAIN_SQUARE_SIZE
			mov  r9d,MAIN_SQUARE_SIZE
		       call  DrawAverageSquare
		  @@:
	     .Skip:
  end if
       ; draw pieces
			xor   esi, esi
     .NextSquare:
			mov   eax, esi
		       call   ConvertTo
		      movzx   ecx, byte [rbp+Pos.board+rsi]
			mov   rcx, qword [PieceToBitmapTable+8*rcx]
			cmp   sil, byte [MouseFromSquare]
			 je   .NoPiece
			cmp   sil, byte [EngineGrabSquare]
			 je   .NoPiece
		       call   BitBltAlphaMainSquare
	  .NoPiece:
			add   esi, 1
			cmp   esi, 64
			 jb   .NextSquare


       ; draw from grabbed square
			cmp  byte[GameMode],GAMEMODE_SETUP
			 je  @f
			mov  ebx,dword[PrevMoveColor]
		      movzx  eax,byte[MouseFromSquare]
			cmp  al,-1
			 je  @f
		       call  ConvertTo
			lea  rcx,[Circle]
		       call  BitBltAlphaMainSquareColor
	       @@:

;       ; draw engine from grabbed square
;                        cmp  byte[GameMode],GAMEMODE_SETUP
;                         je  @f
;                        mov  ebx,dword[PrevMoveColor]
;                      movzx  eax,byte[EngineGrabSquare]
;                        cmp  al,-1
;                         je  @f
;                       call  ConvertTo
;                        lea  rcx,[Circle]
;                       call  BitBltAlphaMainSquareColor
;               @@:

       ; draw highlights
			xor  esi,esi
	.NextMaskPos:	mov  eax,esi
			 bt  qword[HighlightMask],rsi
			jnc  @f
		       call  ConvertTo
			mov  ebx,dword[HighlightColor]
			mov  r8d,MAIN_SQUARE_SIZE
			mov  r9d,MAIN_SQUARE_SIZE
		       call  DrawAverageSquare
		 @@:	add  esi,1
			cmp  esi,64
			 jb  .NextMaskPos

if 0
			cmp  byte[GameMode],GAMEMODE_SETUP
			 je  .EngineGrabbedDone

			lea  rbp,[Engine4]
     .EngineSuggMove:
			cmp  dword[rbp-Engine1+Engine1_On],0
			 je  .PVLineDone
			cmp  byte[rbp-Engine1+Engine1_GoingQ],0
			 je  .PVLineDone
			cmp  byte[rbp-Engine1+Engine1_UploadQ],0
			 je  .PVLineDone

			mov  esi,dword[rbp-Engine1+Engine1_KibitzPVCount]
			sub  esi,1
			 js  .PVLineDone
     .PVLineLoop:
			lea  eax,[rsi+1]
		     movups  xmm0,dqword[rbp-Engine1+Engine1_PVColors]
		      xorps  xmm7,xmm7
		   cvtsi2ss  xmm1,eax
		     shufps  xmm1,xmm1,0
		      rcpps  xmm1,xmm1
		     movaps  xmm2,dqword[const_f4v4_1]
		      subps  xmm2,xmm1
		      mulps  xmm0,xmm1
		      mulps  xmm2,dqword[const_Color_Gray]
		      addps  xmm0,xmm2
		     movaps  xmm1,xmm0

		      movzx  eax,word[rbp-Engine1+Engine1_PV+8*rsi+0]
			cmp  ax,word[rbp-Engine1+Engine1_PV+8*rsi+2]
			 je  .NoLine

		      movzx  eax,byte[rbp-Engine1+Engine1_PV+8*rsi+0]
			sub  eax,'a'
			 js  .NoLine
			cmp  eax,8
			jae  .NoLine
		      movzx  edx,byte[rbp-Engine1+Engine1_PV+8*rsi+1]
			sub  edx,'1'
			 js  .NoLine
			cmp  edx,8
			jae  .NoLine
			xor  edx,7
			lea  eax,[rax+8*rdx]
		       call  ConvertTo
			lea  r8,[rax+MAIN_SQUARE_SIZE/2]
			lea  r9,[rdx+MAIN_SQUARE_SIZE/2]

		      movzx  eax,byte[rbp-Engine1+Engine1_PV+8*rsi+2]
			sub  eax,'a'
			 js  .NoLine
			cmp  eax,8
			jae  .NoLine
		      movzx  edx,byte[rbp-Engine1+Engine1_PV+8*rsi+3]
			sub  edx,'1'
			 js  .NoLine
			cmp  edx,8
			jae  .NoLine
			xor  edx,7
			lea  eax,[rax+8*rdx]
		       call  ConvertTo
			lea  ecx,[rax+MAIN_SQUARE_SIZE/2]
			lea  edx,[rdx+MAIN_SQUARE_SIZE/2]

			mov  eax,4.0
		       movd  xmm0,eax
		       call  DrawLine

	.NoLine:
			sub  esi,1
			jns  .PVLineLoop
	.PVLineDone:
			lea  rax,[Engine1]
			sub  rbp,Engine2-Engine1
			cmp  rbp,rax
			jae  .EngineSuggMove
end if

       ; draw grabbed piece
			cmp   byte[MouseFromSquare], -1
			 je   .GrabbedDone
			mov   ecx, 7*MAIN_SQUARE_SIZE+MAIN_BOARD_OFFSET_X
			mov   eax, dword [MouseDiff.x]
			mov   edx, dword [MouseDiff.y]
			add   eax, dword [Mouse.x]
			jns   @f
			xor   eax, eax
		@@:	add   edx, dword [Mouse.y]
			jns   @f
			xor   edx, edx
		@@:	cmp   eax, ecx
		      cmova   eax, ecx
			cmp   edx, ecx
		      cmova   edx, ecx
			mov   rcx, qword [GrabbedPiece]
		       call   BitBltAlphaMainSquare
	  .GrabbedDone:

if 0
       ; draw engine grabbed piece
			mov  rbp,qword[BoardPosition+POS.STATE_PTR]
		      movzx  ebx,byte[EngineGrabSquare]
			cmp  bl,-1
			 je  .EngineGrabbedDone
			xor  eax,eax
		      movzx  ecx,byte[rbp+STATE.BOARD+rbx]
			 bt  qword[rbp+STATE.BPIECES],rbx
			adc  eax,0
			lea  ecx,[rcx+8*rax]
			mov  rcx,qword[PieceToBitmapTable+8*rcx]
			mov  eax,MAIN_SQUARE_SIZE
		   cvtsi2sd  xmm0,eax
		      movsd  xmm1,xmm0
		      mulsd  xmm0,qword[EngineGrab.x]
		      mulsd  xmm1,qword[EngineGrab.y]
		   cvtsd2si  eax,xmm0
		   cvtsd2si  edx,xmm1
			add  eax,MAIN_BOARD_OFFSET_X
			add  edx,MAIN_BOARD_OFFSET_Y
		       call  BitBltAlphaMainSquare
	  .EngineGrabbedDone:

end if

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
		 @@:   imul   eax, MAIN_SQUARE_SIZE
			add   eax, MAIN_BOARD_OFFSET_X
			shr   edx, 3
			and   edx, 7
			cmp   byte [BoardFlip], 0
			jne   @f
			xor   edx, 7
		 @@:   imul   edx, MAIN_SQUARE_SIZE
			add   edx, MAIN_BOARD_OFFSET_Y
			ret




BitBltAlphaMainSquareColor:  ;  (eax,edx): coordinate on which to paste
			;  ecx: address of square bitmap


		       push  rdi rsi rbx

		       test  rcx,rcx
			 jz  .Done


			mov  r8d,ebx
			mov  r9d,ebx
			and  ebx,0x000000FF
			and  r8d,0x0000FF00
			and  r9d,0x00FF0000
			shl  r8,8
			shl  r9,16
			 or  rbx,r8
			 or  rbx,r9

			mov  rsi,rcx

			mov  edi,dword[Bitmap.x]
		       imul  edi,edx
			add  edi,eax
			shl  edi,2
			add  rdi,qword[ppvBits]


			mov  r8,0x000100010001
			mov  eax,128
		       imul  rax,r8
		       movq  xmm6,rax
		       pxor  xmm7,xmm7
;int3
			mov  ecx,MAIN_SQUARE_SIZE
	     .l1:      push  rdi
			mov  edx,MAIN_SQUARE_SIZE
	      .l2:
		      movzx  eax,byte[rsi+0]
		       imul  rax,r8
		       movq  xmm2,rax

		       movd  xmm0,dword[rdi]
		  punpcklbw  xmm0,xmm7

		       movq  xmm1,rbx

			add  rsi,1

		     movdqa  xmm3,xmm6
		      psubw  xmm3,xmm2

		     pmullw  xmm0,xmm2
		     pmullw  xmm1,xmm3
		      paddw  xmm0,xmm1
		      psrlw  xmm0,7

		   packuswb  xmm0,xmm7
		       movd  eax,xmm0
		      stosd

			sub  edx,1
			jnz  .l2
			pop  rdi
			mov  eax,dword[Bitmap.x]
			lea  rdi,[rdi+4*rax]
			sub  ecx,1
			jnz  .l1
.Done:
			pop  rbx rsi rdi
			ret


BitBltAlphaMainSquare:	;  (eax,edx): coordinate on which to paste
			;  ecx: address of square bitmap


		       push  rdi rsi

		       test  rcx,rcx
			 jz  .Done

			mov  rsi,rcx

			mov  edi,dword[Bitmap.x]
		       imul  edi,edx
			add  edi,eax
			shl  edi,2
			add  rdi,qword[ppvBits]


			mov  r8,0x000100010001
			mov  eax,128
		       imul  rax,r8
		       movq  xmm6,rax
		       pxor  xmm7,xmm7
;int3
			mov  ecx,MAIN_SQUARE_SIZE
	     .l1:      push  rdi
			mov  edx,MAIN_SQUARE_SIZE
	      .l2:
		      movzx  eax,byte[rsi+1]
		       imul  rax,r8
		       movq  xmm2,rax

		       movd  xmm0,dword[rdi]
		  punpcklbw  xmm0,xmm7

		      movzx  eax,byte[rsi+0]
		       imul  rax,r8
		       movq  xmm1,rax

			add  rsi,2

		     movdqa  xmm3,xmm6
		      psubw  xmm3,xmm2

		     pmullw  xmm0,xmm2
		     pmullw  xmm1,xmm3
		      paddw  xmm0,xmm1
		      psrlw  xmm0,7

		   packuswb  xmm0,xmm7
		       movd  eax,xmm0
		      stosd

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











BitBltMainSquare:  ;  (eax,edx): coordinate on which to paste
		   ;  ecx: address of square bitmap
		       push  rdi rsi
			mov  esi,ecx
			mov  edi,dword[Bitmap.x]
		       imul  edi,edx
			add  edi,eax
			shl  edi,2
			add  rdi,qword[ppvBits]
			mov  ecx,MAIN_SQUARE_SIZE
	     .l1:      push  rdi
			mov  edx,MAIN_SQUARE_SIZE
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
			lea   eax, [Knight+rbp+8*rax]
			mov   rcx, qword [PieceToBitmapTable+8*rax]
		       imul  eax,ebp,MAIN_SQUARE_SIZE
			add  eax,dword[Promotion.X]
			mov  edx,dword[Promotion.Y]
		       call  BitBltAlphaMainSquare
			add  ebp,1
			cmp  ebp,4
			 jb  .NextPromPiece

			mov  ecx,MAIN_SQUARE_SIZE
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
			mov  ebx,0x008080E0
			mov  r8d,MAIN_SQUARE_SIZE-2
			mov  r9d,MAIN_SQUARE_SIZE-2
		       call  DrawRect
	       @@:
			pop  rdi rsi rbp
			ret







DrawLine:    ; (rcx,rdx) to (r8,r9)
	     ; xmm0ss width/2
	     ; xmm1ps color

		       push  rbp rbx rdi rsi r12 r13 r14 r15

 .x0 equ rcx
 .y0 equ rdx
 .x1 equ r8
 .y1 equ r9
 .x2 equ r10
 .y2 equ r11
 .dx equ r12
 .dy equ r13
 .err equ r14
 .e2  equ r15
 .sx  equ rsi
 .sy  equ rdi

			 or  .sx,-1
			mov  .dx,.x0
			sub  .dx,.x1
			jns  @f
			neg  .dx
			neg  .sx
		   @@:

			 or  .sy,-1
			mov  .dy,.y0
			sub  .dy,.y1
			jns  @f
			neg  .dy
			neg  .sy
		   @@:

			mov  .err,.dx
			sub  .err,.dy

		   cvtsi2ss  xmm2,.dx
		   cvtsi2ss  xmm3,.dy
		      mulss  xmm2,xmm2
		      mulss  xmm3,xmm3
		      addss  xmm2,xmm3
		      maxss  xmm2,dword[const_f4_1]

		      movss  xmm3,xmm0
		      mulss  xmm3,xmm2
		   cvtss2si  ebx,xmm3


			mov  eax,1000
		       push  rax
	.looper:
			mov  rax,.y0
		       imul  eax,dword[Bitmap.x]
			add  rax,.x0
			shl  rax,2
			add  rax,qword[ppvBits]
			mov  rbp,.err
			sub  rbp,.dx
			add  rbp,.dy
		       call  .Plot

			mov  .e2,.err
			mov  .x2,.x0

			lea  rax,[2*.e2+.dx]
			cmp  rax,0
			 jl  .no_x_step
		.x_step:
			add  .e2,.dy
			mov  .y2,.y0
			cmp  .e2,rbx
			jge  .end_x_for
			cmp  .y1,.y2
			jne  .x_for
			cmp  .dx,.dy
			 jg  .x_for
			jmp  .end_x_for
		.x_for:
			add  .y2,.sy

			mov  rax,.y2
		       imul  eax,dword[Bitmap.x]
			add  rax,.x0
			shl  rax,2
			add  rax,qword[ppvBits]
			mov  rbp,.e2
		       call  .Plot

			add  .e2,.dx
		.end_x_for:
			cmp  .x0,.x1
			 je  .break
			mov  .e2,.err
			sub  .err,.dy
			add  .x0,.sx
		.no_x_step:


			lea  rax,[2*.e2]
			cmp  rax,.dy
			 jg  .no_y_step
		.y_step:
			sub  .e2,.dx
			neg  .e2
			cmp  .e2,rbx
			jge  .end_y_for
			cmp  .x1,.x2
			jne  .y_for
			cmp  .dx,.dy
			 jl  .y_for
			jmp  .end_y_for
		.y_for:
			add  .x2,.sx

			mov  rax,.y0
		       imul  eax,dword[Bitmap.x]
			add  rax,.x2
			shl  rax,2
			add  rax,qword[ppvBits]
			mov  rbp,.e2
		       call  .Plot

			add  .e2,.dy
		.end_y_for:
			cmp  .y0,.y1
			 je  .break
			add  .err,.dx
			add  .y0,.sy
		.no_y_step:

			sub  dword[rsp],1
			jnz  .looper
	.break:
			pop  rax

			pop  r15 r14 r13 r12 rsi rdi rbx rbp
			ret



	.Plot:	   ;    push  rbp
		   ;   xorps  xmm7,xmm7
		   ;
		   ;    movd  dword[rax],xmm7
		   ;     pop  rbp
		   ;     ret

		       push  rbp
		      xorps  xmm7,xmm7

		   cvtsi2ss  xmm3,ebp
		      andps  xmm3,dqword[const_f4v4_sign]
		      divss  xmm3,xmm2
		      movss  xmm4,dword[const_f4_1]
		      subss  xmm4,xmm0
		      addss  xmm3,xmm4
		     shufps  xmm3,xmm3,0
		      maxps  xmm3,xmm7

		     movaps  xmm5,xmm1
		     shufps  xmm5,xmm5,0x0FF
		     movaps  xmm4,dqword[const_f4v4_1]
		      subps  xmm4,xmm3
		      mulps  xmm4,xmm5

		     movaps  xmm3,dqword[const_f4v4_1]
		      subps  xmm3,xmm4

		       movd  xmm5,dword[rax]
		  punpcklbw  xmm5,xmm7
		  punpcklwd  xmm5,xmm7
		   cvtdq2ps  xmm5,xmm5

		      mulps  xmm3,xmm5
		      mulps  xmm4,xmm1
		      addps  xmm3,xmm4
		   cvtps2dq  xmm3,xmm3

		   packssdw  xmm3,xmm7
		   packuswb  xmm3,xmm7
		       movd  dword[rax],xmm3

			pop  rbp
			ret


