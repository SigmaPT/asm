proc VisualWindowProc hwnd,wmsg,wparam,lparam

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

  BORDERWIDTH = 6
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
			mov  ecx,dword[rc.right]
			sub  ecx,BORDERWIDTH
			mov  edx,dword[rc.bottom]
			sub  edx,BORDERWIDTH
			cmp  dword[pt.y],BORDERWIDTH
			 jl  .y_small
			cmp  dword[pt.y],edx
			 jg  .y_large
			mov  eax,HTLEFT
			cmp  dword[pt.x],BORDERWIDTH
			 jl  .return
			mov  eax,HTRIGHT
			cmp  dword[pt.x],ecx
			 jg  .return
			mov  eax,HTCLIENT
			cmp  dword[pt.y],20
			 jg  .return
			mov  ecx,dword[rc.right]
			sub  ecx,40
			cmp  dword[pt.x],ecx
			 jg  .return
			mov  eax,HTCAPTION
			jmp  .return
	.y_small:	mov  eax,HTTOPLEFT
			cmp  dword[pt.x],BORDERWIDTH
			 jl .return
			mov  eax,HTTOPRIGHT
			cmp  dword[pt.x],ecx
			 jg .return
			mov  eax,HTTOP
			jmp  .return
	.y_large:	mov  eax,HTBOTTOMLEFT
			cmp  dword[pt.x],BORDERWIDTH
			 jl .return
			mov  eax,HTBOTTOMRIGHT
			cmp  dword[pt.x],ecx
			 jg .return
			mov  eax,HTBOTTOM
			jmp  .return


 .wmcreate:
			 or  qword[OpenMask],VISUAL_WND_MASK

 .wmsize:
 .wmcommand:
		     invoke  DeleteObject,[hVisualBitmap]
		     invoke  DeleteDC,[hVisualMemDC]

		     invoke  GetClientRect,[hwnd],rc

			mov  ecx,240
			mov  eax,[rc.bottom]
			cmp  eax,ecx
		      cmovb  eax,ecx
			mov  [rc.bottom],eax

			mov  ecx,150
			mov  eax,[rc.right]
			cmp  eax,ecx
		      cmovb  eax,ecx
			mov  [rc.right],eax

			xor  eax,eax
		     invoke  CreateCompatibleDC,rax
			mov  [hVisualMemDC],rax
		     invoke  CreateBitmap,[rc.right],[rc.bottom],1,32,NULL
			mov  [hVisualBitmap],rax
		     invoke  SelectObject,[hVisualMemDC],[hVisualBitmap]

 .wm_redraw:
		       call  PaintVisualWindow


 .wmpaint:
		     invoke  GetClientRect,[hwnd],rc
		     invoke  InvalidateRect,[hwnd],rc,FALSE
		     invoke  BeginPaint,[hwnd],ps
			mov  [hdc],rax
		     invoke  BitBlt,[hdc],0,0,[rc.right],[rc.bottom],[hVisualMemDC],0,0,SRCCOPY

			mov  ecx,[rc.right]
			sub  ecx,22+0*21
			mov  edx,4
			mov  dword[Message],120-6
		       call  DrawButton


		     invoke  EndPaint,[hwnd],ps

	       ;      invoke  ShowWindow,qword[hMoveListWindow],SW_SHOW

			jmp  .returnz
 .wmkeydown:
			jmp  .returnz
 .wmkeyup:
			jmp  .returnz
 .wmmousemove:
			jmp  .returnz
 .wmlbuttonup:
			jmp  .returnz

 .wmlbuttondown:
		     invoke  GetClientRect,[hwnd],rc
		      movsx  eax,word[lparam+0]
		      movsx  ecx,word[lparam+2]
			mov  dword[pt.x],eax
			mov  dword[pt.y],ecx


			mov  ecx,[rc.right]
			sub  ecx,22+0*21
			mov  edx,4
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .status_window_close

			jmp  .returnz


 .status_window_close:

			and  qword[OpenMask],not VISUAL_WND_MASK
		     invoke  DestroyWindow,[hVisualWindow]

			jmp  .returnz



 .wmrbuttondown:
			jmp  .returnz


.wm_destroy:

		     invoke  GetWindowRect,[hVisualWindow],VisualWindowRect
		     invoke  MapWindowPoints,HWND_DESKTOP,[hMainWindow],VisualWindowRect,2
			mov  eax,[VisualWindowRect.left]
			sub  [VisualWindowRect.right],eax
			mov  eax,[VisualWindowRect.top]
			sub  [VisualWindowRect.bottom],eax

		     invoke  DeleteObject,[hVisualBitmap]
		     invoke  DeleteDC,[hVisualMemDC]
		  ;   invoke  PostQuitMessage,0
			xor  eax,eax
			mov  [hVisualBitmap],rax
			mov  [hVisualMemDC],rax
			mov  [hVisualWindow],rax

.returnz:
			xor  eax,eax
.return:
			pop  rsi rdi rbx rdx r12 r13 r14 r15
			ret
endp


PaintVisualWindow:

		       push  rbp rsi rdi r12 r13 r14 r15



		     invoke  SelectObject,[hVisualMemDC],qword[GuiColor1brush1]
		     invoke  SelectObject,[hVisualMemDC],qword[GuiColor2pen1]
		     invoke  Rectangle,[hVisualMemDC],0,0,[rc.right],[rc.bottom]

		     invoke  SetTextColor,[hVisualMemDC],dword[GuiColor5]

		     invoke  SelectObject,[hVisualMemDC],[hFontTitle]
		     invoke  SetBkColor,[hVisualMemDC],dword[GuiColor1]
			mov  [rect.left],10
			mov  [rect.top],1
			mov  [rect.right],200
			mov  [rect.bottom],24
		     invoke  DrawTextA,[hVisualMemDC],'Thinking',8,rect,DT_EDITCONTROL


		     invoke  SetTextColor,[hVisualMemDC],dword[GuiColor6]
		     invoke  SelectObject,[hVisualMemDC],[hFontLarge]



			mov  ebx,[rc.right]
			sub  ebx,10

			lea  rsi,[Engine1]
			lea  rax,[Engine2]
			mov  rbp,qword[BoardPosition+POS.STATE_PTR]
			cmp  byte[rbp+STATE.SIDE],0
		     cmovne  rsi,rax

			cmp  dword[rsi-Engine1+Engine1_On],0
			 je  .print_board



			mov  [rect.left],10
			mov  [rect.top],28
			mov  [rect.right],ebx
			mov  [rect.bottom],50
			lea  rdx,[rsi-Engine1+Engine1_Name]
		     invoke  DrawTextA,[hVisualMemDC],rdx,-1,rect,DT_EDITCONTROL+DT_TABSTOP+DT_CALCRECT



			lea  r12,[rsi-Engine1+Engine1_Lines+ENGINE_LINE.TEXT]


			 or  r13,-1
		   @@:	add  r13,1
			cmp  byte[r12+r13],' '
			jae  @b
			mov  [rect.left],150
			mov  [rect.right],200
			mov  [rect.top],50
			mov  [rect.bottom],70
		     invoke  DrawTextA,[hVisualMemDC],r12,r13,rect,DT_LEFT+DT_TOP
			lea  r12,[r12+r13+1]


			 or  r13,-1
		   @@:	add  r13,1
			cmp  byte[r12+r13],' '
			jae  @b
			mov  [rect.left],80
			mov  [rect.right],145
			mov  [rect.top],50
			mov  [rect.bottom],70
		     invoke  DrawTextA,[hVisualMemDC],r12,r13,rect,DT_LEFT+DT_TOP
			lea  r12,[r12+r13+1]

			 or  r13,-1
		   @@:	add  r13,1
			cmp  byte[r12+r13],' '
			jae  @b
			mov  [rect.left],10
			mov  [rect.right],75
			mov  [rect.top],50
			mov  [rect.bottom],70
		     invoke  DrawTextA,[hVisualMemDC],r12,r13,rect,DT_LEFT+DT_TOP
			lea  r12,[r12+r13+1]

			mov  [rect.left],10
			mov  [rect.right],ebx
			mov  [rect.top],70
			mov  [rect.bottom],95
		     invoke  DrawTextA,[hVisualMemDC],r12,-1,rect,DT_LEFT+DT_TOP
			lea  r12,[r12+r13+1]




.print_board:


			lea  rbp,[VisualBoard]



SPACING  = 20

			mov  r15d,7
	 .outer_loop:
			xor  r14d,r14d
	     .inner_loop:

			lea  edx,[r14+8*r15]

		      movzx  eax,byte[rbp+STATE.BOARD_+rdx]
			 bt  qword[rbp+STATE.BPIECES],rdx
			adc  eax,eax
			and  eax,0x0FF
			mov  eax,dword[.pieces+4*rax]
			mov  dword[Message],eax

		       imul  eax,r14d,SPACING
			add  eax,25
			mov  [rect.left],eax
			add  eax,SPACING+1
			mov  [rect.right],eax

		       imul  eax,r15d,SPACING
			add  eax,110
			mov  [rect.top],eax
			add  eax,SPACING+1
			mov  [rect.bottom],eax

			lea  eax,[r14+r15]
			and  eax,1
			mov  edx,dword[GuiColor1]
			mov  ecx,dword[GuiColor2]
		      cmovz  edx,ecx
		     invoke  SetBkColor,[hVisualMemDC],rdx

		     invoke  DrawTextA,[hVisualMemDC],Message,-1,rect,DT_EDITCONTROL

			add  r14d,1
			cmp  r14d,8
			 jb  .inner_loop

			sub  r15d,1
			jns  .outer_loop

			mov  [rect.left],24
			mov  [rect.right],24+8*SPACING
			mov  [rect.top],110
			mov  [rect.bottom],112+8*SPACING
		     invoke  FrameRect,[hVisualMemDC],rect,[GuiColor3brush2]

			pop  r15 r14 r13 r12 rdi rsi rbp
			ret

BOARD_WPAWN = 159
BOARD_BPAWN = 253
BOARD_WKNIGHT = 151
BOARD_BKNIGHT = 149
BOARD_WROOK = 167
BOARD_BROOK = 164
BOARD_WBISHOP = 158
BOARD_BBISHOP = 155
BOARD_WQUEEN = 173
BOARD_BQUEEN = 170
BOARD_WKING = 179
BOARD_BKING = 176

BOARD_W1PAWN = 131
BOARD_B1PAWN = 255
BOARD_W1KNIGHT = 151
BOARD_B1KNIGHT = 149
BOARD_W1ROOK = 167
BOARD_B1ROOK = 164
BOARD_W1BISHOP = 158
BOARD_B1BISHOP = 155
BOARD_W1QUEEN = 173
BOARD_B1QUEEN = 170
BOARD_W1KING = 179
BOARD_B1KING = 176

.pieces: db '  ',0,0,'  ',0,0,\
	    BOARD_WPAWN,0,0,0,BOARD_BPAWN,0,0,0,\
	    BOARD_WKNIGHT,0,0,0,BOARD_BKNIGHT,0,0,0,\
	    BOARD_WBISHOP,0,0,0,BOARD_BBISHOP,0,0,0,\
	    BOARD_WROOK,0,0,0,BOARD_BROOK,0,0,0,\
	    BOARD_WQUEEN,0,0,0,BOARD_BQUEEN,0,0,0,\
	    BOARD_WKING,0,0,0,BOARD_BKING,0,0,0,\
	    ' ',' ';,\
       ;     ' ',' ',\
       ;     BOARD_W1PAWN,BOARD_B1PAWN,\
       ;     BOARD_W1KNIGHT,BOARD_B1KNIGHT,\
       ;     BOARD_W1BISHOP,BOARD_B1BISHOP,\
       ;     BOARD_W1ROOK,BOARD_B1ROOK,\
       ;     BOARD_W1QUEEN,BOARD_B1QUEEN,\
       ;     BOARD_W1KING,BOARD_B1KING,\
       ;     ' ',' '

