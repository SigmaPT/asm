proc BoardWindowProc hwnd,wmsg,wparam,lparam

			mov  [hwnd],rcx
			mov  [wmsg],rdx
			mov  [wparam],r8
			mov  [lparam],r9

		       push  r15 r14 r13 r12 rdx rbx rdi rsi



			cmp  edx,WM_NCHITTEST
			 je  .wm_nchittest

			cmp  edx,WM_COMMAND
			 je  .wmcommand
			cmp  edx,WM_CREATE
			 je  .wmcreate
			cmp  edx,WM_PAINT
			 je  .wmpaint
			cmp  edx,WM_SIZE
			 je  .wmsize
		     ;   cmp  edx,WM_KEYDOWN
		     ;    je  .wmkeydown
		     ;   cmp  edx,WM_KEYUP
		     ;    je  .wmkeyup
			cmp  edx,WM_MOUSEMOVE
			 je  .wmmousemove
			cmp  edx,WM_LBUTTONUP
			 je  .wmlbuttonup
			cmp  edx,WM_LBUTTONDOWN
			 je  .wmlbuttondown
		     ;   cmp  edx,WM_RBUTTONDOWN
		     ;    je  .wmrbuttondown
			cmp  edx,WM_DESTROY
			 je  .wm_destroy

  .defwndproc:	     invoke  DefWindowProc,[hwnd],[wmsg],[wparam],[lparam]
			jmp  .return

  .wm_nchittest:

;  BOARD_BORDERWIDTH = MAIN_BOARD_OFFSET_Y-8
  HTLEFT      = 10
  HTRIGHT     = 11
  HTCLIENT    = 1
  HTCAPTION   = 2
  HTBOTTOMLEFT = 16
  HTBOTTOMRIGHT = 17
  HTBOTTOM = 15
  HTTOP = 12
  HTTOPLEFT = 13
  HTTOPRIGHT = 14

		     invoke  GetClientRect,[hwnd],rc
		      movsx  eax,word[lparam+0]
		      movsx  ecx,word[lparam+2]
			mov  dword[pt.x],eax
			mov  dword[pt.y],ecx
		     invoke  ScreenToClient,[hwnd],pt

			mov  r8d, dword[BoardBoarderSize]
			sub  r8d, 4

			mov  eax,HTCAPTION
			mov  ecx,dword[rc.right]
			sub  ecx,r8d
			mov  edx,dword[rc.bottom]
			sub  edx,r8d

			cmp  dword[pt.x],ecx
			 jl  @f
			cmp  dword[pt.y],edx
			 jl  @f
			mov  eax, HTBOTTOMRIGHT
			jmp  .return

			@@:

			cmp  dword[pt.y],r8d
			 jl  .return
			cmp  dword[pt.y],edx
			 jg  .return
			cmp  dword[pt.x],r8d
			 jl  .return
			cmp  dword[pt.x],ecx
			 jg  .return
			mov  eax,HTCLIENT
			jmp  .return


 .wmcreate:
 .wmsize:
	     invoke  DeleteObject,[hBitmap]
	     invoke  GetClientRect,[hwnd],rc
		mov  ecx, dword[rc.bottom]
		mov  eax, dword[rc.right]
		cmp  ecx, eax
	      cmova  ecx, eax
		mov  [BoardWindowSize],ecx
	       call  SetBoardBoarderSquareSize
;               call  CreateChessBoardBitmap
	       call  CreateBoardBitmap
	     invoke  GetWindowRect,[hBoardWindow],rc
	     invoke  MapWindowPoints,HWND_DESKTOP,[hMainWindow],rc,2
	     invoke  MoveWindow,[hwnd],[rc.left],[rc.top],[BoardWindowSize],[BoardWindowSize],TRUE

 .wmcommand:

 .wm_redraw:

 .wmpaint:
	       call  PaintBoard
		mov  eax, dword[BoardWindowSize]
		mov  [rect.top],0
		mov  [rect.left],0
		mov  [rect.right],eax
		mov  [rect.bottom],eax
	     invoke  InvalidateRect,[hBoardWindow],rect,FALSE
	     invoke  BeginPaint,[hBoardWindow],ps
		mov  [hdc],rax
	     invoke  CreateCompatibleDC,rax
		mov  [hBoardMemDC],rax
	     invoke  SelectObject,[hBoardMemDC],[hBitmap]
     ;        invoke  SetStretchBltMode,[hdc],HALFTONE
     ;           mov  esi, [Bitmap.x]
     ;           mov  edi, [Bitmap.y]
     ;        invoke  StretchBlt,[hdc],0, 0, [BoardWindowSize], [BoardWindowSize],\
     ;                [hBoardMemDC],0,0,[Bitmap.x],[Bitmap.y],SRCCOPY
	     invoke  BitBlt, [hdc], 0, 0, [BoardWindowSize], [BoardWindowSize],\
		     [hBoardMemDC], 0,0, SRCCOPY



	     invoke  DeleteDC,[hBoardMemDC]
	     invoke  EndPaint,[hBoardWindow],ps
		jmp  .returnz




.wmmousemove:
	      movzx  eax, word[lparam+0]
	      movzx  ecx, word[lparam+2]
		mov  [Mouse.x], eax
		mov  [Mouse.y], ecx
		cmp  eax, [Bitmap.x]
		 ja  .returnz
		cmp  ecx, [Bitmap.y]
		 ja  .returnz
		jmp  .wmpaint
.wmlbuttonup:
	      movzx  eax,word[lparam+0]
	      movzx  ecx,word[lparam+2]
		mov  [Mouse.x],eax
		mov  [Mouse.y],ecx
		lea  rax,[MouseUpHandler_NORMAL]
		lea  rcx,[MouseUpHandler_PROM]
		cmp  byte[GameMode],GAMEMODE_PROM
	      cmove  rax,rcx
		lea  rcx,[MouseUpHandler_SETUP]
		cmp  byte[GameMode],GAMEMODE_SETUP
	      cmove  rax,rcx
	       call  rax
		jmp  .wmpaint
.wmlbuttondown:
	      movzx  eax, word[lparam+0]
	      movzx  ecx, word[lparam+2]
		mov  [Mouse.x], eax
		mov  [Mouse.y], ecx
		lea  rax, [MouseDownHandler_NORMAL]
		lea  rcx, [MouseDownHandler_PROM]
		cmp  byte[GameMode], GAMEMODE_PROM
	      cmove  rax, rcx
		lea  rcx, [MouseDownHandler_SETUP]
		cmp  byte[GameMode], GAMEMODE_SETUP
	      cmove  rax, rcx
	       call  rax
		jmp  .wmpaint
.wm_destroy:
	     invoke  GetWindowRect,[hBoardWindow],rect
	     invoke  MapWindowPoints,HWND_DESKTOP,[hMainWindow],rect,2
		mov  eax,[rect.left]
		mov  dword[BoardOffset.x],eax
		mov  eax,[rect.top]
		mov  dword[BoardOffset.y],eax
.returnz:
		xor  eax,eax
.return:
		pop  rsi rdi rbx rdx r12 r13 r14 r15
		ret
endp





PaintBoard:
	       push  rbp rsi rdi
		cmp  [hBitmap],0
		 je  .Done
		lea  rbp,[BoardPos]
		cmp  byte[GameMode],GAMEMODE_SETUP
		 je  .Setup
	       call  DrawBitmap
		cmp  byte[GameMode],GAMEMODE_PROM
		jne  .Done
	       call  DrawPromotion
		jmp  .Done
.Setup:
	       call  DrawBoardSETUP
.Done:
		pop  rdi rsi rbp
		ret








SetBoardBoarderSquareSize:
	       ; mov  dword[BoardBoarderSize], 21
	       ; mov  dword[BoardSquareSize], 72
	       ; mov  dword[BoardSize], 617
		ret


CreateBoardBitmap:
	       push   rdi
	       ; mov   dword[BoardSize], 617

		mov   eax, dword[BoardSize]
		mov   dword[Bitmap.x], eax
		mov   dword[Bitmap.y], eax
		mov   [bmiheader.biSize], sizeof.BITMAPINFOHEADER
		mov   eax, [Bitmap.x]
		mov   [bmiheader.biWidth], eax
		mov   eax, [Bitmap.y]
		neg   eax
		mov   [bmiheader.biHeight], eax
		mov   [bmiheader.biPlanes], 1
		mov   [bmiheader.biBitCount], 32
		mov   [bmiheader.biCompression], BI_RGB
		mov   eax, [Bitmap.x]
	       imul   eax, [Bitmap.y]
		lea   eax, [4*rax+16]
		mov   [bmiheader.biSizeImage], eax
		mov   [bmiheader.biXPelsPerMeter], 0
		mov   [bmiheader.biYPelsPerMeter], 0
		mov   [bmiheader.biClrUsed], 0
		mov   [bmiheader.biClrImportant], 0
	     invoke   CreateDIBSection,0,bmiheader,DIB_RGB_COLORS,ppvBits,0,0
		mov   [hBitmap],rax
		pop   rdi
		ret

