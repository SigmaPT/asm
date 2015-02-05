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
			cmp  edx,WM_KEYDOWN
			 je  .wmkeydown
			cmp  edx,WM_KEYUP
			 je  .wmkeyup
			cmp  edx,WM_MOUSEMOVE
			 je  .wmmousemove
			cmp  edx,WM_LBUTTONUP
			 je  .wmlbuttonup
			cmp  edx,WM_LBUTTONDOWN
			 je  .wmlbuttondown
			cmp  edx,WM_RBUTTONDOWN
			 je  .wmrbuttondown
			cmp  edx,WM_DESTROY
			 je  .wm_destroy

  .defwndproc:	     invoke  DefWindowProc,[hwnd],[wmsg],[wparam],[lparam]
			jmp  .return

  .wm_nchittest:

  BOARD_BORDERWIDTH = MAIN_BOARD_OFFSET_Y-8
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
			mov  eax,HTCAPTION
			mov  ecx,dword[rc.right]
			sub  ecx,BOARD_BORDERWIDTH
			mov  edx,dword[rc.bottom]
			sub  edx,BOARD_BORDERWIDTH
			cmp  dword[pt.y],BOARD_BORDERWIDTH
			 jl  .return
			cmp  dword[pt.y],edx
			 jg  .return
			cmp  dword[pt.x],BOARD_BORDERWIDTH
			 jl  .return
			cmp  dword[pt.x],ecx
			 jg  .return
			mov  eax,HTCLIENT
			jmp  .return


 .wmcreate:
 .wmsize:
 .wmcommand:
	       ;      invoke  DeleteObject,[hBoardBitmap]
	       ;      invoke  DeleteDC,[hBoardMemDC]
	       ;
	       ;      invoke  GetClientRect,[hwnd],rc
	       ;
	       ;         mov  ecx,340
	       ;         mov  eax,[rc.bottom]
	       ;         cmp  eax,ecx
	       ;       cmovb  eax,ecx
	       ;         mov  [rc.bottom],eax
	       ;
	       ;         mov  ecx,150
	       ;         mov  eax,[rc.right]
	       ;         cmp  eax,ecx
	       ;       cmovb  eax,ecx
	       ;         mov  [rc.right],eax
	       ;
	       ;         xor  eax,eax
	       ;      invoke  CreateCompatibleDC,rax
	       ;         mov  [hBoardMemDC],rax
	       ;      invoke  CreateBitmap,[rc.right],[rc.bottom],1,32,NULL
	       ;         mov  [hBoardBitmap],rax
	       ;      invoke  SelectObject,[hBoardMemDC],[hBoardBitmap]



 .wm_redraw:
		;       call  PaintBoardWindow


 .wmpaint:

		       call  PaintBoard

			mov  [rect.top],0
			mov  [rect.left],0
			mov  [rect.right],8*MAIN_SQUARE_SIZE+2*MAIN_BOARD_OFFSET_Y
			mov  [rect.bottom],8*MAIN_SQUARE_SIZE+2*MAIN_BOARD_OFFSET_Y

		     invoke  InvalidateRect,[hBoardWindow],rect,FALSE
		     invoke  BeginPaint,[hBoardWindow],ps
			mov  [hdc],rax
		     invoke  CreateCompatibleDC,rax
			mov  [hBoardMemDC],rax

		  ;      lea  rbp,[BoardPosition]
		  ;     call  DrawBitmap

		   ;     cmp  byte[GameMode],GAMEMODE_PROM
		   ;     jne  @f
		   ;    call  DrawPromotion
		   ;     @@:

		     invoke  SelectObject,[hBoardMemDC],[hBitmap]
		     invoke  BitBlt,[hdc],0,0,8*MAIN_SQUARE_SIZE+2*MAIN_BOARD_OFFSET_Y,8*MAIN_SQUARE_SIZE+2*MAIN_BOARD_OFFSET_Y,[hBoardMemDC],0,0,SRCCOPY

;                        mov  edx,dword[BorderColor]
;                      bswap  edx
;                        shr  edx,8
;                     invoke  SetBkColor,[hdc],edx
;                     invoke  SelectObject,[hdc],[hFontMedium]
;                     invoke  SetTextColor,[hdc],dword[GuiColor6]

;                        xor  r15d,r15d
;        .letter_loop:
;                      movzx  r14d,byte[BoardFlip]
;                        and  r14d,7
;                        xor  r14d,r15d
;
;                        lea  eax,[r14+'a']
;                        mov  dword[Message],eax
;                       imul  eax,r15d,MAIN_SQUARE_SIZE
;                        add  eax,MAIN_SQUARE_SIZE/2+MAIN_BOARD_OFFSET_Y-8
;                        mov  [rect.left],eax
;                        add  eax,16
;                        mov  [rect.right],eax
;                        mov  [rect.top],4
;                        mov  [rect.bottom],MAIN_BOARD_OFFSET_Y-4
;                     invoke  DrawTextA,[hdc],Message,1,rect,DT_CENTER+DT_VCENTER+DT_SINGLELINE
;
;                        xor  r14d,7
;                        lea  eax,[r14+'1']
;                        mov  dword[Message],eax
 ;                      imul  eax,r15d,MAIN_SQUARE_SIZE
 ;                       add  eax,MAIN_SQUARE_SIZE/2+MAIN_BOARD_OFFSET_Y-8
 ;                       mov  [rect.left],4
 ;                       mov  [rect.right],MAIN_BOARD_OFFSET_Y-4
 ;                       mov  [rect.top],eax
 ;                       add  eax,16
 ;                       mov  [rect.bottom],eax
 ;                    invoke  DrawTextA,[hdc],Message,1,rect,DT_CENTER+DT_VCENTER+DT_SINGLELINE
 ;
 ;                       add  r15d,1
 ;                       cmp  r15d,8
 ;                        jb  .letter_loop

		     invoke  DeleteDC,[hBoardMemDC]
		     invoke  EndPaint,[hBoardWindow],ps

			jmp  .returnz




  .wmmousemove:       movzx  eax,word[lparam+0]
		      movzx  ecx,word[lparam+2]
			mov  [Mouse.x],eax
			mov  [Mouse.y],ecx
			cmp  eax,[Bitmap.x]
			 ja  .returnz
			cmp  ecx,[Bitmap.y]
			 ja  .returnz
			jmp  .wmpaint

  .wmlbuttonup:       movzx  eax,word[lparam+0]
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


		  ;      cmp  byte[GameMode],GAMEMODE_NORMAL
		  ;      jne  .returnz
		  ;     call  MouseUpHandler_NORMAL
		  ;      jmp  .wmpaint


  .wmrbuttondown:	cmp  byte[GameMode],GAMEMODE_SETUP
			jne  .returnz
			bts  dword[KeyMask],31
			jmp  @f
  .wmlbuttondown:	btr  dword[KeyMask],31
		 @@:  movzx  eax,word[lparam+0]
		      movzx  ecx,word[lparam+2]
			mov  [Mouse.x],eax
			mov  [Mouse.y],ecx
			lea  rax,[MouseDownHandler_NORMAL]
			lea  rcx,[MouseDownHandler_PROM]
			cmp  byte[GameMode],GAMEMODE_PROM
		      cmove  rax,rcx
			lea  rcx,[MouseDownHandler_SETUP]
			cmp  byte[GameMode],GAMEMODE_SETUP
		      cmove  rax,rcx
		       call  rax
			jmp  .wmpaint


 .wmkeydown:
			jmp  .returnz
 .wmkeyup:
			jmp  .returnz



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



DrawButtonBoard:
		       push  rbp r14 r15
		     movsxd  r14,ecx
		     movsxd  r15,edx

			lea  ecx,[r14+2]
			mov  [rect.left],ecx
			add  ecx,15
			mov  [rect.right],ecx

			lea  edx,[r15-1]
			mov  [rect.top],edx
			add  edx,18
			mov  [rect.bottom],edx

		     invoke  SetTextColor,[hdc],dword[GuiColor4]
		     invoke  SelectObject,[hdc],[hFontSymbols]
			mov  edx,dword[BorderColor]
		      bswap  edx
			shr  edx,8
		     invoke  SetBkColor,[hdc],edx
		     invoke  DrawTextA,[hdc],Message,1,rect,DT_EDITCONTROL


			mov  ecx,r14d
			mov  edx,r15d

			mov  [rect.left],ecx
			add  ecx,17
			mov  [rect.right],ecx

			mov  [rect.top],edx
			add  edx,17
			mov  [rect.bottom],edx


		  ;   invoke  SelectObject,[hdc],qword[GuiColor1brush1]
		  ;   invoke  SelectObject,[hdc],qword[GuiColor4pen2]
		     invoke  FrameRect,[hdc],rect,qword[GuiColor3brush2]

			pop  r15 r14 rbp
			ret



PaintBoard:	       push  rbp rsi rdi
			cmp  [hBitmap],0
			 je  .Done



			lea  rbp,[BoardPos]
		       call  DrawBitmap

			cmp  byte[GameMode],GAMEMODE_PROM
			jne  @f
		       call  DrawPromotion
			@@:


	.Done:		pop  rdi rsi rbp
			ret






PaintBoardWindow:

		       push  rbp rsi rdi r12 r13 r14 r15



		     invoke  SelectObject,[hBoardMemDC],qword[GuiColor1brush1]
		     invoke  SelectObject,[hBoardMemDC],qword[GuiColor2pen1]
		     invoke  Rectangle,[hBoardMemDC],0,0,[rc.right],[rc.bottom]

		     invoke  SetTextColor,[hBoardMemDC],dword[GuiColor5]

		     invoke  SelectObject,[hBoardMemDC],[hFontTitle]
		     invoke  SetBkColor,[hBoardMemDC],dword[GuiColor1]
			mov  [rect.left],10
			mov  [rect.top],1
			mov  [rect.right],200
			mov  [rect.bottom],24
		     invoke  DrawTextA,[hBoardMemDC],'Game Board',11,rect,DT_EDITCONTROL



			pop  r15 r14 r13 r12 rdi rsi rbp
			ret


