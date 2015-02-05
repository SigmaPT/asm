proc StatusWindowProc hwnd,wmsg,wparam,lparam

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
			 or  qword[OpenMask],STATUS_WND_MASK
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

			mov  ecx,120
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

			mov  ecx,[rc.right]
			sub  ecx,22+0*21
			mov  edx,4
			mov  dword[Message],120-6
		       call  DrawButton


			mov  ecx,22
			mov  ebx,[rc.right]
			shr  ebx,1
			sub  ebx,80
			cmp  ebx,ecx
		      cmovl  ebx,ecx

STATUS_BUTTON_Y =80

			lea  ecx,[rbx+0*21]
			mov  edx,STATUS_BUTTON_Y
			mov  dword[Message],57
		       call  DrawButton
			lea  ecx,[rbx+1*21]
			mov  edx,STATUS_BUTTON_Y
			mov  dword[Message],55
		       call  DrawButton
			lea  ecx,[rbx+2*21]
			mov  edx,STATUS_BUTTON_Y
			mov  dword[Message],51
		       call  DrawButton
			lea  ecx,[rbx+3*21]
			mov  edx,STATUS_BUTTON_Y
			mov  dword[Message],60
		       call  DrawButton
			lea  ecx,[rbx+4*21]
			mov  edx,STATUS_BUTTON_Y
			mov  dword[Message],52
		       call  DrawButton
			lea  ecx,[rbx+5*21]
			mov  edx,STATUS_BUTTON_Y
			mov  dword[Message],56
		       call  DrawButton
			lea  ecx,[rbx+6*21]
			mov  edx,STATUS_BUTTON_Y
			mov  dword[Message],58
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



			mov  ecx,22
			mov  ebx,[rc.right]
			shr  ebx,1
			sub  ebx,80
			cmp  ebx,ecx
		      cmovl  ebx,ecx


			lea  ecx,[rbx+2*21]
			mov  edx,STATUS_BUTTON_Y
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .takeback

			lea  ecx,[rbx+1*21]
			mov  edx,STATUS_BUTTON_Y
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .takeback2

			lea  ecx,[rbx+4*21]
			mov  edx,STATUS_BUTTON_Y
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .redo

			lea  ecx,[rbx+5*21]
			mov  edx,STATUS_BUTTON_Y
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .redo2

			jmp  .returnz


 .status_window_close:

			and  qword[OpenMask],not STATUS_WND_MASK
		     invoke  DestroyWindow,[hStatusWindow]

			jmp  .returnz
;
  .redo2:	   ;    call  RedoMove2
		     invoke  SendMessage,[hBoardWindow],WM_PAINT,0,0
			jmp  .wm_redraw

  .redo:	   ;    call  RedoMove
		     invoke  SendMessage,[hBoardWindow],WM_PAINT,0,0
			jmp  .wm_redraw

  .takeback:	       call  TakeBackMove
		     invoke  SendMessage,[hBoardWindow],WM_PAINT,0,0
			jmp  .wm_redraw

  .takeback2:	       call  TakeBackMove2
		     invoke  SendMessage,[hBoardWindow],WM_PAINT,0,0
			jmp  .wm_redraw



 .wmrbuttondown:
			jmp  .returnz


.wm_destroy:

		     invoke  GetWindowRect,[hStatusWindow],StatusWindowRect
		     invoke  MapWindowPoints,HWND_DESKTOP,[hMainWindow],StatusWindowRect,2
			mov  eax,[StatusWindowRect.left]
			sub  [StatusWindowRect.right],eax
			mov  eax,[StatusWindowRect.top]
			sub  [StatusWindowRect.bottom],eax

		     invoke  DeleteObject,[hStatusBitmap]
		     invoke  DeleteDC,[hStatusMemDC]
		 ;    invoke  DeleteDC,[hStatusWhiteMemDC]
		  ;   invoke  PostQuitMessage,0
			xor  eax,eax
			mov  [hStatusBitmap],rax
			mov  [hStatusMemDC],rax
			mov  [hStatusWindow],rax

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

		     invoke  SetTextColor,[hStatusMemDC],dword[GuiColor5]

		     invoke  SelectObject,[hStatusMemDC],[hFontTitle]
		     invoke  SetBkColor,[hStatusMemDC],dword[GuiColor1]
			mov  [rect.left],10
			mov  [rect.top],1
			mov  [rect.right],200
			mov  [rect.bottom],24
		     invoke  DrawTextA,[hStatusMemDC],'Game Status',11,rect,DT_EDITCONTROL



		;        mov  r12,[hBmpBlackLogo]
		;        mov  r13,[hBmpWhiteLogo]
		;        cmp  byte[BoardFlip],0
		;         je  @f
		;       xchg  r12,r13
		;        @@:
		;
		;     invoke  CreateCompatibleDC,[hStatusMemDC]
		;        mov  rsi,rax
		;     invoke  SelectObject,rsi,r12
		;     invoke  BitBlt,[hStatusMemDC],10,25,75,96,rsi,0,0,SRCCOPY
		;     invoke  SelectObject,rsi,r13
		;        mov  r8d,[rc.bottom]
		;        sub  r8d,105
		;     invoke  BitBlt,[hStatusMemDC],10,r8,75,96,rsi,0,0,SRCCOPY
		;     invoke  DeleteDC,rsi

			lea   rbp, [BoardPos]


			mov   r12, 24
			mov   r13d, [rc.bottom]
			sub   r13d, 60
			cmp   byte [BoardFlip], 0
			jnz   @f
		       xchg   r12, r13
			@@:

			mov   r14d, 5
			mov   r15d, dword [rc.right]

inc_space = 60

		   ;  invoke  BitBlt,[hStatusMemDC],20,20,76,97,[hStatusWhiteMemDC],0,0,SRCCOPY

		; engine names
			lea  eax,[r14+5]
			mov  [rect.left],eax
			lea  eax,[r14+200]
			mov  [rect.right],eax
		     invoke  SelectObject,[hStatusMemDC],[hFontLarge]
			mov  [rect.top],r12d
			lea  eax,[r12+23]
			mov  [rect.bottom],eax
		     invoke  DrawTextA,[hStatusMemDC],Engine1_Name,-1,rect,DT_EDITCONTROL
			mov  [rect.top],r13d
			lea  eax,[r13+23]
			mov  [rect.bottom],eax
		     invoke  DrawTextA,[hStatusMemDC],Engine2_Name,-1,rect,DT_EDITCONTROL

		; time control
			lea  eax,[r15-inc_space+2]
			mov  [rect.left],eax
			lea  eax,[r15-2]
			mov  [rect.right],eax
		     invoke  SelectObject,[hStatusMemDC],[hFontMedium]
			lea  eax,[r12+20]
			mov  [rect.top],eax
			lea  eax,[r12+35]
			mov  [rect.bottom],eax
			lea  rdi,[Message]
			mov  rax, qword [InitTimeWTIME]
		       call  PrintTimeShort
			xor  eax, eax
		      stosd
		     invoke  DrawTextA,[hStatusMemDC],Message,-1,rect,DT_EDITCONTROL
			lea  eax,[r13+20]
			mov  [rect.top],eax
			lea  eax,[r13+35]
			mov  [rect.bottom],eax
			lea  rdi,[Message]
			mov  rax, qword [InitTimeBTIME]
		       call  PrintTimeShort
			xor  eax, eax
		      stosd
		     invoke  DrawTextA,[hStatusMemDC],Message,-1,rect,DT_EDITCONTROL
			lea  eax,[r12+35]
			mov  [rect.top],eax
			lea  eax,[r12+50]
			mov  [rect.bottom],eax
			lea  rdi,[Message]
			mov  al, '+'
		      stosb
			mov  rax, qword [InitTimeWINC]
		       call  PrintTimeShort
			xor  eax, eax
		      stosd
		     invoke  DrawTextA,[hStatusMemDC],Message,-1,rect,DT_EDITCONTROL
			lea  eax,[r13+35]
			mov  [rect.top],eax
			lea  eax,[r13+50]
			mov  [rect.bottom],eax
			lea  rdi,[Message]
			mov  al, '+'
		      stosb
			mov  rax, qword [InitTimeBINC]
		       call  PrintTimeShort
			xor  eax, eax
		      stosd
		     invoke  DrawTextA,[hStatusMemDC],Message,-1,rect,DT_EDITCONTROL



		; time remaining

			lea  eax,[r14+10]
			mov  [rect.left],eax
			lea  eax,[r15-inc_space-5]
			mov  [rect.right],eax
		     invoke  SelectObject,[hStatusMemDC],[hFontHuge]

			mov   esi, dword [GuiColor7]
			lea   rdi, [Message]
			mov   rbx, qword [Time_TIME+8*White]
			mov   rax, qword [rbp+PosEx.move]
			cmp   byte [rbp+Pos.sideToMove], 0
			jne   @f
			cmp   byte [rax+MoveData.result], 0
			jne   @f
			mov   esi, dword [GuiColor6]
			add   rbx, qword [rax+MoveData.time1]
		     invoke   GetTickCount
			sub   rbx, rax
		@@:	mov   rax, rbx
		       call   PrintTime
			xor   eax, eax
		      stosd

		     invoke  SetTextColor,[hStatusMemDC],esi
			lea  eax,[r12+21]
			mov  [rect.top],eax
			lea  eax,[r12+52]
			mov  [rect.bottom],eax
		     invoke  DrawTextA,[hStatusMemDC],Message,-1,rect,DT_EDITCONTROL
			mov  esi, dword[GuiColor7]

			lea   rdi, [Message]
			mov   rbx, qword[Time_TIME+8*Black]
			mov   rax, qword [rbp+PosEx.move]
			cmp   byte [rbp+Pos.sideToMove], 0
			 je   @f
			cmp   byte [rax+MoveData.result],0
			jne   @f
			mov   esi, dword[GuiColor6]
			add   rbx, qword [rax+MoveData.time1]
		     invoke   GetTickCount
			sub   rbx, rax
		@@:	mov   rax, rbx
		       call   PrintTime
			xor   eax,eax
		      stosd

		     invoke  SetTextColor,[hStatusMemDC],esi
			lea  eax,[r13+21]
			mov  [rect.top],eax
			lea  eax,[r13+52]
			mov  [rect.bottom],eax
		     invoke  DrawTextA,[hStatusMemDC],Message,-1,rect,DT_EDITCONTROL


			cmp  byte [rbp+PosEx.sideToMove], 0
			mov  ecx, r12d
		     cmovne  ecx, r13d
			lea  eax,[r14+10-3]
			mov  [rect.left],eax
			lea  eax,[r15-inc_space-5]
			mov  [rect.right],eax
			lea  eax,[rcx+21+2]
			mov  [rect.top],eax
			lea  eax,[rcx+52-1]
			mov  [rect.bottom],eax
		     invoke  FrameRect,[hStatusMemDC],rect,qword[GuiColor3brush2]
	       @@:






		; moves

		     invoke  SelectObject,[hStatusMemDC],[GuiColor3brush2]
		     invoke  SelectObject,[hStatusMemDC],[GuiColor2pen1]
			mov  [rect.left],8
			mov  [rect.top],STATUS_BUTTON_Y+20
			mov  eax,[rc.right]
			sub  eax,8
			mov  [rect.right],eax
			mov  eax,[rc.bottom]
			sub  eax,64
			mov  [rect.bottom],eax
		     invoke  Rectangle,[hStatusMemDC],[rect.left],[rect.top],[rect.right],[rect.bottom]

		     invoke  SetBkColor,[hStatusMemDC],dword[GuiColor3]
		     invoke  SelectObject,[hStatusMemDC],[hFontMedium]

			mov   r13d, 32
	    .move:
			mov   r12d, dword [rbp+Pos.gamePly]
			sub   r12d, r13d
			jle   .next_move

			lea   eax, [r13+1]
		       imul   eax, sizeof.MoveData
			mov   r14, qword [rbp+PosEx.move]
			sub   r14, rax

			cmp   r14, qword [rbp+PosEx.moveTable]
			 jb   .next_move

		       imul  edx,r13d,15
			add  edx,STATUS_BUTTON_Y+23
			lea  ecx,[rdx+16]
			mov  eax,[rc.bottom]
			sub  eax,64+2
			cmp  ecx,eax
		      cmova  ecx,eax
			cmp  edx,eax
			jge  .next_move

			mov  [rect.top],edx
			mov  [rect.bottom],ecx



		     invoke  SetTextColor,[hStatusMemDC],dword[GuiColor6]

			mov  [rect.left],20
			mov  [rect.right],60
			lea  rdi,[Message]
			mov  rax,'  ...'
			mov  qword[rdi],rax
			mov  eax,r12d
			shr  eax,1
			jnc  @f
			add  eax,1
		       call  PrintUnsignedInteger
			mov  dword[rdi],'.'
	     @@:     invoke  DrawTextA,[hStatusMemDC],Message,-1,rect,DT_EDITCONTROL

			mov   dword [rect.left],60
			mov   dword [rect.right],125
			lea   rdx, [r14+MoveData.moveSan]
		     invoke   DrawTextA,[hStatusMemDC],rdx,-1,rect,DT_EDITCONTROL


		     invoke  SetTextColor,[hStatusMemDC],dword[GuiColor5]

			mov   [rect.left],125
			mov   [rect.right],190
			lea   rdx, [r14+MoveData.score]
		     invoke   DrawTextA,[hStatusMemDC],rdx,-1,rect,DT_EDITCONTROL
			mov   [rect.left], 190
			mov   [rect.right],240
			lea   rdx, [r14+MoveData.ponderSan]
		     invoke   DrawTextA,[hStatusMemDC],rdx,-1,rect,DT_EDITCONTROL

	 .next_move:
			sub   r13d, 1
			jns   .move


			pop  r15 r14 r13 r12 rdi rsi rbp
			ret


