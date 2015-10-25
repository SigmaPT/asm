

max_move_width = 280
inc_space = 60

proc StatusWindowProc hwnd,wmsg,wparam,lparam

			mov  [hwnd],rcx
			mov  [wmsg],rdx
			mov  [wparam],r8
			mov  [lparam],r9

		       push  r15 r14 r13 r12 rdx rbx rdi rsi

			cmp  edx,WM_NCHITTEST
			 je  .wm_nchittest
			cmp  edx,WM_COMMAND
			 je  .wm_redraw
			cmp  edx,WM_CREATE
			 je  .wmcreate
			cmp  edx,WM_PAINT
			 je  .wmpaint
			cmp  edx,WM_SIZE
			 je  .wmsize
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
; .wmcommand:
	     invoke  DeleteObject,[hStatusBitmap]
	     invoke  DeleteDC,[hStatusMemDC]
	     invoke  GetClientRect,[hwnd],SWrc

		mov  ecx, 240
		mov  eax, [SWrc.bottom]
		cmp  eax, ecx
	      cmovb  eax, ecx
		mov  [SWrc.bottom], eax
		mov  ecx, 200;max_move_width+50
		mov  eax, dword[SWrc.right]
		cmp  eax, ecx
	      cmovb  eax, ecx
		mov  [SWrc.right], eax

		xor  eax,eax
	     invoke  CreateCompatibleDC,rax
		mov  [hStatusMemDC],rax
	     invoke  CreateBitmap,[SWrc.right],[SWrc.bottom],1,32,NULL
		mov  [hStatusBitmap],rax
	     invoke  SelectObject,[hStatusMemDC],[hStatusBitmap]
	       call  PaintGameStatusWindow

.wm_redraw:
	       call   PaintGameStatusTime
.wmpaint:
	     invoke  GetClientRect,[hwnd],SWrc
	     invoke  InvalidateRect,[hwnd],SWrc,FALSE
	     invoke  BeginPaint,[hwnd],ps
		mov  [hdc],rax
	     invoke  BitBlt,[hdc],0,0,[SWrc.right],[SWrc.bottom],[hStatusMemDC],0,0,SRCCOPY

		mov  ecx,[SWrc.right]
		sub  ecx,22+0*21
		mov  edx,4
		mov  dword[Message],120-6
	       call  DrawButton

		mov  ecx,22
		mov  ebx,[SWrc.right]
		shr  ebx,1
		sub  ebx,80
		cmp  ebx,ecx
	      cmovl  ebx,ecx

	     invoke  EndPaint,[hwnd],ps
		jmp  .returnz

 .wmlbuttondown:
	     invoke  GetClientRect,[hwnd],SWrc
	      movsx  eax,word[lparam+0]
	      movsx  ecx,word[lparam+2]
		mov  dword[pt.x],eax
		mov  dword[pt.y],ecx

		mov  ecx,[SWrc.right]
		sub  ecx,22+0*21
		mov  edx,4
	       call  PointInButtonQ
	       test  eax,eax
		jnz  .status_window_close
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









PaintGameStatusTime:

	       push  rbp rsi rdi r12 r13 r14 r15

		lea  rbp, [BoardPos]
		mov  r12, 24
		mov  r13d, [SWrc.bottom]
		sub  r13d, 60
		cmp  byte [BoardFlip], 0
		jnz  @f
	       xchg  r12, r13
	@@:	mov  r14d, 5
		mov  r15d, dword [SWrc.right]
		lea  r15d, [3*r15]
		shr  r15d, 2
		mov  eax, max_move_width
		cmp  r15d, eax
	      cmova  r15d, eax

	     invoke  SelectObject,[hStatusMemDC],qword[GuiColor1brush]
		lea  eax,[r14+10-5]
		mov  [rect.left],eax
		lea  eax,[r15-inc_space-5]
		mov  [rect.right],eax
		lea  eax,[r12+21]
		mov  [rect.top],eax
		lea  eax,[r12+52+1]
		mov  [rect.bottom],eax
	     invoke  SelectObject,[hStatusMemDC],qword[GuiColor1pen]
	     invoke  Rectangle,[hStatusMemDC],[rect.left],[rect.top],[rect.right],[rect.bottom]
		lea  eax,[r13+21]
		mov  [rect.top],eax
		lea  eax,[r13+52+1]
		mov  [rect.bottom],eax
	     invoke  SelectObject,[hStatusMemDC], qword[GuiColor1pen]
	     invoke  Rectangle,[hStatusMemDC],[rect.left],[rect.top],[rect.right],[rect.bottom]
	     invoke  SetBkColor,[hStatusMemDC],dword[GuiColor1]


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
			cmp   byte [rbp+PosEx.result], 0
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
			cmp   byte [rbp+PosEx.result],0
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

			pop  r15 r14 r13 r12 rdi rsi rbp
			ret





PaintGameStatusWindow:
	       push  rbp rsi rdi r12 r13 r14 r15

	     invoke  SelectObject,[hStatusMemDC],qword[GuiColor1brush]
	     invoke  SelectObject,[hStatusMemDC],qword[GuiColor2pen]
	     invoke  Rectangle,[hStatusMemDC],0,0,[SWrc.right],[SWrc.bottom]

	     invoke  SetTextColor,[hStatusMemDC],dword[GuiColor5]

	     invoke  SelectObject,[hStatusMemDC],[hFontTitle]
	     invoke  SetBkColor,[hStatusMemDC],dword[GuiColor1]
		mov  [rect.left],10
		mov  [rect.top],1
		mov  [rect.right],200
		mov  [rect.bottom],24
	     invoke  DrawTextA,[hStatusMemDC],'Game Status',11,rect,DT_EDITCONTROL

		lea  rbp, [BoardPos]
		mov  r12, 24
		mov  r13d, [SWrc.bottom]
		sub  r13d, 60
		cmp  byte [BoardFlip], 0
		jnz  @f
	       xchg  r12, r13
	@@:	mov  r14d, 5
		mov  r15d, dword[SWrc.right]
		lea  r15d, [3*r15]
		shr  r15d, 2
		mov  eax, max_move_width
		cmp  r15d, eax
	      cmova  r15d, eax

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


if 0
		; ratings
			cmp   dword[Tournament.GoingQ], 0
			 je   .rating_done

			lea   eax,[r15-160]
			mov   [rect.left],eax
			lea   eax,[r15-5]
			mov   [rect.right],eax

		       push   r12 r13

		       test   dword[Tournament.GameCt], 1
			 jz   @f
		       xchg   r12, r13
		    @@:

			lea   rdi,[Message]
			lea   rsi, [Tournament.P1Win]
		       call   PrintRatingStats
			lea   eax,[r12+3]
			mov   [rect.top],eax
			lea   eax,[r12+20]
			mov   [rect.bottom],eax
		     invoke   DrawTextA,[hStatusMemDC],Message,-1,rect,DT_RIGHT

			lea   rdi,[Message]
			lea   rsi, [Tournament.P2Win]
		       call   PrintRatingStats
			lea   eax,[r13+3]
			mov   [rect.top],eax
			lea   eax,[r13+23]
			mov   [rect.bottom],eax
		     invoke   DrawTextA,[hStatusMemDC],Message,-1,rect,DT_RIGHT

			pop   r13 r12
      .rating_done:

end if

		; moves

		     invoke  SelectObject,[hStatusMemDC],[GuiColor3brush]
		     invoke  SelectObject,[hStatusMemDC],[GuiColor2pen]
			mov  [rect.left],8
			mov  [rect.top],80
			mov  eax, r15d ;[SWrc.right]
			sub  eax,8
			mov  [rect.right],eax
			mov  eax,[SWrc.bottom]
			sub  eax,64
			mov  [rect.bottom],eax
		     invoke  Rectangle,[hStatusMemDC],[rect.left],[rect.top],[rect.right],[rect.bottom]

		     invoke  SetBkColor,[hStatusMemDC],dword[GuiColor3]
		     invoke  SelectObject,[hStatusMemDC],[hFontMedium]

		     invoke  SelectObject,[hStatusMemDC],[GuiColor10brush]

			mov  r13d, 48
	    .move:

			mov  r12d, dword [rbp+Pos.gamePly]
			sub  r12d, r13d
			jle  .next_move

			lea  eax, [r13+1]
		       imul  eax, sizeof.MoveData
			mov  r14, qword [rbp+PosEx.move]
			sub  r14, rax

			cmp  r14, qword [rbp+PosEx.moveTable]
			 jb  .next_move

			mov  edx, r13d
			add  edx, dword [rbp+Pos.sideToMove]
			shr  edx, 1
		       imul  edx, 15
			add  edx, 80+3
			lea  ecx, [rdx+16]
			mov  eax, [SWrc.bottom]
			sub  eax, 64+3
			cmp  ecx, eax
		      cmova  ecx, eax
			cmp  edx, eax
			jge  .next_move

			mov  [rect.top], edx
			mov  [rect.bottom], ecx


		     invoke  SetTextColor,[hStatusMemDC],dword[GuiColor6]

			mov  eax,r12d
			shr  eax,1
			jnc  .PrintBlack
			add  eax,1
	.PrintWhite:
			mov  [rect.left],18
			mov  [rect.right],60
			lea  rdi, [Message]
		       call  PrintUnsignedInteger
			mov  eax, '.'
		      stosd
		     invoke  DrawTextA,[hStatusMemDC],Message,-1,rect,DT_EDITCONTROL
			mov  dword[rect.left],60
			mov  dword[rect.right],120
			jmp  .Print
	.PrintBlack:
			mov  dword[rect.left],120
			mov  dword[rect.right],180
	.Print:
			lea  rdx, [r14+MoveData.moveSan]
		     invoke  DrawTextA,[hStatusMemDC],rdx,-1,rect,DT_EDITCONTROL


			mov  ecx, dword[r14+MoveData.score]
			cmp  ecx, 0x80000000
			 je  .next_move
			mov  eax, -512
			cmp  ecx, eax
		      cmovl  ecx, eax
			mov  eax, 512
			cmp  ecx, eax
		      cmovg  ecx, eax
			add  eax, ecx

			mov  r8d, r15d
			sub  r8d, 180+12
			cmp  r8d, 60
			jle  .next_move


		       imul  eax, r8d
			shr  eax, 10
			add  eax, 180

			mov  edx, 512
		       imul  edx, r8d
			shr  edx, 10
			add  edx, 180

			cmp  eax, edx
			 je  .next_move
			 jb  @f
		       xchg  eax, edx
		 @@:	mov  [rect.left],eax
			mov  [rect.right],edx

			mov  eax, dword[rect.top]
		       test  r12d, 1
			 jz  @f
			add  eax, 7
		 @@:	mov  [rect.top], eax
			add  eax, 7
			mov  [rect.bottom], eax

			mov  ecx, [rect.bottom]
			mov  edx, [rect.top]
			mov  eax, [SWrc.bottom]
			sub  eax, 64+3
			cmp  ecx, eax
		      cmova  ecx, eax
			cmp  edx, eax
			 ja  .next_move
			mov  [rect.bottom], ecx

		     invoke  Rectangle,[hStatusMemDC],[rect.left],[rect.top],[rect.right],[rect.bottom]

	 .next_move:
			sub   r13d, 1
			jns   .move




	     invoke  SetBkColor,[hStatusMemDC],dword[GuiColor1]
	     invoke  SetTextColor,[hStatusMemDC],dword[GuiColor5]
		lea  eax, [r15+5]
		mov  ecx, dword[SWrc.right]
		mov  [rect.left], eax
		mov  [rect.right], ecx
		mov  r13d, MAX_LOG_LINES-1
		mov  r14d, dword[SWrc.bottom]
		sub  r14d, 5
.LogLineLoop:
		mov  edx, dword[CurrentLogLine]
		sub  edx, r13d
		jns  @f
		add  edx, MAX_LOG_LINES
	@@:    imul  eax, r13d, 15
	       imul  edx, LOG_LINE_LENGTH
		lea  rdx, [LogLines+rdx]
		add  eax, 20
		mov  dword[rect.top], eax
		add  eax, 20
		cmp  eax, r14d
	      cmova  eax, r14d
		cmp  eax, dword[rect.top]
		 jb  @f
		mov  dword[rect.bottom], eax
	     invoke  DrawTextA,[hStatusMemDC],rdx,-1,rect,DT_EDITCONTROL
	@@:	sub  r13d, 1
		jns  .LogLineLoop




		pop  r15 r14 r13 r12 rdi rsi rbp
		ret


AddLogLine:
	; in: rcx address of null-terminated string
	       push  rsi rdi
		mov  rsi, rcx
		mov  edi, dword[CurrentLogLine]
		add  edi, 1
		mov  ecx, MAX_LOG_LINES
		xor  eax, eax
		cmp  edi, ecx
	     cmovae  edi, eax
		mov  dword[CurrentLogLine], edi
	       imul  edi, LOG_LINE_LENGTH
		lea  rdi, [LogLines+rdi]
.Loop:
	      lodsb
	      stosb
		cmp  al, ' '
		 jb  .Return
		sub  ecx, 1
		jnz  .Loop
.Return:
		pop  rdi rsi
		ret

