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
 .wmsize:
 .wmcommand:
		     invoke  DeleteObject,[hStatusBitmap]
		     invoke  DeleteDC,[hStatusMemDC]

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
			mov  [hStatusMemDC],rax
		     invoke  CreateBitmap,[rc.right],[rc.bottom],1,32,NULL
			mov  [hStatusBitmap],rax
		     invoke  SelectObject,[hStatusMemDC],[hStatusBitmap]

 .wm_redraw:
		       call  PaintStatusWindow


 .wmpaint:
		     invoke  GetClientRect,[hwnd],rc
		     invoke  InvalidateRect,[hwnd],rc,FALSE
		     invoke  BeginPaint,[hwnd],ps
			mov  [hdc],rax
		     invoke  BitBlt,[hdc],0,0,[rc.right],[rc.bottom],[hStatusMemDC],0,0,SRCCOPY
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
			jmp  .returnz
 .wmrbuttondown:
			jmp  .returnz


.wm_destroy:	     invoke  DeleteObject,[hStatusBitmap]
		     invoke  DeleteDC,[hStatusMemDC]
		     invoke  PostQuitMessage,0
			xor  eax,eax
			mov  [hStatusBitmap],rax
			mov  [hStatusMemDC],rax

.returnz:
			xor  eax,eax
.return:
			pop  rsi rdi rbx rdx r12 r13 r14 r15
			ret
endp


PaintStatusWindow:

		       push  rbp rsi rdi r12 r13 r14 r15



		     invoke  SelectObject,[hStatusMemDC],qword[GuiColor1brush1]
		     invoke  SelectObject,[hStatusMemDC],qword[GuiColor2pen1]
		     invoke  Rectangle,[hStatusMemDC],0,0,[rc.right],[rc.bottom]

		     invoke  SetTextColor,[hStatusMemDC],[GuiColor5]

		     invoke  SelectObject,[hStatusMemDC],[hFontTitle]
		     invoke  SetBkColor,[hStatusMemDC],[GuiColor1]
			mov  [rect.left],10
			mov  [rect.top],1
			mov  [rect.right],200
			mov  [rect.bottom],24
		     invoke  DrawTextA,[hStatusMemDC],'Game Status',11,rect,DT_EDITCONTROL



			mov  rbp,qword[BoardPosition+POS.STATE_PTR]

			mov  r12,25
			mov  r13d,[rc.bottom]
			sub  r13d,78
			cmp  byte[BoardFlip],0
			jnz  @f
		       xchg  r12,r13
			@@:




		     invoke  SelectObject,[hStatusMemDC],[hFontLarge]
			mov  [rect.left],5
			mov  [rect.right],200
			mov  [rect.top],r12d
			lea  eax,[r12+23]
			mov  [rect.bottom],eax
		     invoke  DrawTextA,[hStatusMemDC],Engine1_Name,-1,rect,DT_EDITCONTROL


			lea  rdi,[Message]
			mov  rax,'20/20'
		      stosq
		     invoke  SelectObject,[hStatusMemDC],[hFontLarge]
			mov  [rect.left],30
			mov  [rect.right],200
			lea  eax,[r12+51]
			mov  [rect.top],eax
			lea  eax,[r12+70]
			mov  [rect.bottom],eax
		     invoke  DrawTextA,[hStatusMemDC],Message,-1,rect,DT_EDITCONTROL


			mov  r15d,[GuiColor7]
			xor  r14d,r14d

			lea  rdi,[Message]
			mov  ebx,dword[TimeWTIME]
			cmp  byte[rbp+STATE.SIDE],0
			jne  @f
			cmp  byte[rbp+STATE.RESULT],0
			jne  @f
			 or  r14d,-1
			mov  r15d,[GuiColor6]
		       test  ebx,ebx
			 js  @f
			add  ebx,dword[TimeSAVE]
		     invoke  GetTickCount
			sub  ebx,eax
		@@:	mov  eax,ebx
		       call  PrintTime
			xor  eax,eax
		      stosd

		     invoke  SelectObject,[hStatusMemDC],[hFontHuge]

		     invoke  SetTextColor,[hStatusMemDC],r15
			mov  [rect.left],30
			mov  [rect.right],120
			lea  eax,[r12+21]
			mov  [rect.top],eax
			lea  eax,[r12+52]
			mov  [rect.bottom],eax
		     invoke  DrawTextA,[hStatusMemDC],Message,-1,rect,DT_EDITCONTROL

		       test  r14d,r14d
			 jz  @f
			mov  [rect.left],27
			mov  [rect.right],120
			lea  eax,[r12+23]
			mov  [rect.top],eax
			lea  eax,[r12+51]
			mov  [rect.bottom],eax
		     invoke  FrameRect,[hStatusMemDC],rect,qword[GuiColor3brush2]
	       @@:




		     invoke  SetTextColor,[hStatusMemDC],[GuiColor5]





		     invoke  SelectObject,[hStatusMemDC],[hFontLarge]
			mov  [rect.left],5
			mov  [rect.right],200
			mov  [rect.top],r13d
			lea  eax,[r13+23]
			mov  [rect.bottom],eax
		     invoke  DrawTextA,[hStatusMemDC],Engine2_Name,-1,rect,DT_EDITCONTROL


			lea  rdi,[Message]
			mov  rax,'20/20'
		      stosq
		     invoke  SelectObject,[hStatusMemDC],[hFontLarge]
			mov  [rect.left],30
			mov  [rect.right],200
			lea  eax,[r13+51]
			mov  [rect.top],eax
			lea  eax,[r13+70]
			mov  [rect.bottom],eax
		     invoke  DrawTextA,[hStatusMemDC],Message,-1,rect,DT_EDITCONTROL


			mov  r15d,[GuiColor7]
			xor  r14d,r14d

			lea  rdi,[Message]
			mov  ebx,dword[TimeBTIME]
			cmp  byte[rbp+STATE.XSIDE],0
			jne  @f
			cmp  byte[rbp+STATE.RESULT],0
			jne  @f
			 or  r14d,-1
			mov  r15d,[GuiColor6]
		       test  ebx,ebx
			 js  @f
			add  ebx,dword[TimeSAVE]
		     invoke  GetTickCount
			sub  ebx,eax
		@@:	mov  eax,ebx
		       call  PrintTime
			xor  eax,eax
		      stosd

		     invoke  SelectObject,[hStatusMemDC],[hFontHuge]

		     invoke  SetTextColor,[hStatusMemDC],r15
			mov  [rect.left],30
			mov  [rect.right],120
			lea  eax,[r13+21]
			mov  [rect.top],eax
			lea  eax,[r13+52]
			mov  [rect.bottom],eax
		     invoke  DrawTextA,[hStatusMemDC],Message,-1,rect,DT_EDITCONTROL

		       test  r14d,r14d
			 jz  @f
			mov  [rect.left],27
			mov  [rect.right],120
			lea  eax,[r13+23]
			mov  [rect.top],eax
			lea  eax,[r13+51]
			mov  [rect.bottom],eax
		     invoke  FrameRect,[hStatusMemDC],rect,qword[GuiColor3brush2]
	       @@:





			pop  r15 r14 r13 r12 rdi rsi rbp
			ret


