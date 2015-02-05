proc MentorWindowProc hwnd,wmsg,wparam,lparam

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
			 or  qword[OpenMask],MENTOR_WND_MASK

			mov  ecx,1
		       call  TurnOnSuperKibitzer

 .wmsize:

 .wmcommand:
		     invoke  DeleteObject,[hMentorBitmap]
		     invoke  DeleteDC,[hMentorMemDC]

		     invoke  GetClientRect,[hwnd],rc

			mov  ecx,100
			mov  eax,[rc.bottom]
			cmp  eax,ecx
		      cmovb  eax,ecx
			mov  [rc.bottom],eax

			mov  ecx,250
			mov  eax,[rc.right]
			cmp  eax,ecx
		      cmovb  eax,ecx
			mov  [rc.right],eax

			xor  eax,eax
		     invoke  CreateCompatibleDC,rax
			mov  [hMentorMemDC],rax
		     invoke  CreateBitmap,[rc.right],[rc.bottom],1,32,NULL
			mov  [hMentorBitmap],rax
		     invoke  SelectObject,[hMentorMemDC],[hMentorBitmap]

.wm_redraw:
		       call  PaintMentorWindow


 .wmpaint:
		     invoke  GetClientRect,[hwnd],rc
		     invoke  InvalidateRect,[hwnd],rc,FALSE
		     invoke  BeginPaint,[hwnd],ps
			mov  [hdc],rax
		     invoke  BitBlt,[hdc],0,0,[rc.right],[rc.bottom],[hMentorMemDC],0,0,SRCCOPY

			mov  ecx,[rc.right]
			sub  ecx,22+0*21
			mov  edx,4
			mov  dword[Message],120-6
		       call  DrawButton

			mov  ecx,10+0*21
			mov  edx,20
			mov  dword[Message],120-6-4*16+3
		       call  DrawButton

			mov  ecx,10+1*21
			mov  edx,20
			mov  dword[Message],120-6-4*16+4
		       call  DrawButton

		     invoke  EndPaint,[hwnd],ps


			jmp  .returnz

 .wmlbuttondown:

;int3
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
			jnz  .mentor_window_close

			mov  ecx,10+0*21
			mov  edx,20
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .mentor_more

			mov  ecx,10+1*21
			mov  edx,20
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .mentor_less

			jmp  .returnz


.mentor_more:		mov  eax,dword[MentorMaxLines]
			add  eax,1
			mov  ecx,32
			cmp  eax,ecx
		      cmova  eax,ecx
			mov  dword[MentorMaxLines],eax
		       call  Coach_Update
			jmp  .returnz

.mentor_less:		mov  eax,dword[MentorMaxLines]
			mov  ecx,1
			sub  eax,1
		      cmovz  eax,ecx
			mov  dword[MentorMaxLines],eax
		       call  Coach_Update
			jmp  .returnz

.mentor_window_close:
			lea  rcx,[Engine5]
		       call  Engine_Quit
		     invoke  Sleep,125
			and  qword[OpenMask],not MENTOR_WND_MASK
		     invoke  DestroyWindow,[hMentorWindow]

			jmp  .returnz



 .wmmousemove:		jmp  .returnz
 .wmlbuttonup:		jmp  .returnz
 .wmrbuttondown:	jmp  .returnz

.wm_destroy:

		     invoke  GetWindowRect,[hMentorWindow],MentorWindowRect
		     invoke  MapWindowPoints,HWND_DESKTOP,[hMainWindow],MentorWindowRect,2
			mov  eax,[MentorWindowRect.left]
			sub  [MentorWindowRect.right],eax
			mov  eax,[MentorWindowRect.top]
			sub  [MentorWindowRect.bottom],eax

		     invoke  DeleteObject,[hMentorBitmap]
		     invoke  DeleteDC,[hMentorMemDC]
			xor  eax,eax
			mov  [hMentorBitmap],rax
			mov  [hMentorMemDC],rax
			mov  [hMentorWindow],rax

.returnz:		xor  eax,eax
.return:		pop  rsi rdi rbx rdx r12 r13 r14 r15
			ret
endp






PaintMentorWindow:

		       push  rbp rsi rdi r12 r13 r14 r15


			lea  rbp,[Engine5]

		     invoke  SelectObject,[hMentorMemDC],qword[GuiColor1brush1]
		     invoke  SelectObject,[hMentorMemDC],qword[GuiColor2pen1]
		     invoke  Rectangle,[hMentorMemDC],0,0,[rc.right],[rc.bottom]

		     invoke  SetTextColor,[hMentorMemDC],dword[GuiColor5]

		     invoke  SelectObject,[hMentorMemDC],[hFontTitle]
		     invoke  SetBkColor,[hMentorMemDC],dword[GuiColor1]
			mov  [rect.left],10
			mov  [rect.top],1
			mov  [rect.right],200
			mov  [rect.bottom],24
		     invoke  DrawTextA,[hMentorMemDC],'Coach',5,rect,DT_EDITCONTROL

		     invoke  SelectObject,[hMentorMemDC],[hFontMedium]
		     invoke  SetBkColor,[hMentorMemDC],dword[GuiColor1]


SCORE_SPACE = 56
MOVE_SPACE = 82

			mov  [rect.top],20
			mov  [rect.bottom],20+16
			mov  ebx,dword[Engine5MaxDepth]
			xor  r13d,r13d
	      @@:	lea  rdi,[Message]
			mov  eax,ebx
		       call  PrintUnsignedInteger
			xor  eax,eax
		      stosd
		       imul  eax,r13d,SCORE_SPACE
			add  eax,MOVE_SPACE
			mov  [rect.left],eax
			add  eax,SCORE_SPACE
			mov  [rect.right],eax
		     invoke  DrawTextA,[hMentorMemDC],Message,-1,rect,DT_EDITCONTROL
			add  r13d,1
			sub  ebx,1
			 jg  @b


		     invoke  SelectObject,[hMentorMemDC],qword[GuiColor3brush2]
		     invoke  SelectObject,[hMentorMemDC],qword[GuiColor4pen2]

			mov  [rect.top],39
			mov  eax,[rc.bottom]
			sub  eax,5

			mov  ecx,dword[Engine5_KibitzPVCount]
		       imul  ecx,15
			add  ecx,43
			cmp  eax,ecx
		      cmova  eax,ecx
			mov  [rect.bottom],eax


			mov  [rect.left],5
			mov  [rect.right],MOVE_SPACE-8

		     invoke  Rectangle,[hMentorMemDC],[rect.left],[rect.top] ,[rect.right],[rect.bottom]

			mov  [rect.top],37
			mov  [rect.left],MOVE_SPACE-6
			mov  eax,[rc.right]
			sub  eax,5
			mov  [rect.right],eax

		     invoke  Rectangle,[hMentorMemDC],[rect.left],[rect.top] ,[rect.right],[rect.bottom]

		     invoke  SetBkColor,[hMentorMemDC],dword[GuiColor3]


	; get move engine is thinking about:
			xor   r12, r12
			cmp   byte [BoardPos+Pos.sideToMove], 0
			lea   rax, [Engine1]
			lea   rcx, [Engine2]
		     cmovne   rax, rcx
			mov   r12, qword [rax-Engine1+Engine1_PV]


			mov  r13d,dword[Engine5_KibitzPVCount]
     .moveloop: 	sub  r13d,1
			 js  .moveloopdone

			lea  rdi,[Message]
			mov  r14d,dword[SortMoves+4*r13]
			lea  rsi,[FigMoves+8*r14]
		       call  Append
			xor  eax,eax
		      stosd


			mov  eax,[rc.bottom]
			sub  eax,5

			mov  ecx,dword[Engine5_KibitzPVCount]
		       imul  ecx,15
			add  ecx,43
			cmp  eax,ecx
		      cmova  eax,ecx
			lea  edx,[rax-2]


		       imul  eax,r13d,15
			add  eax,40
			lea  ecx,[rax+16]
			mov  [rect.top],eax

			cmp  ecx,edx
		      cmova  ecx,edx
			cmp  eax,ecx
			jge  .skip
			mov  [rect.bottom],ecx

			mov  edx,dword[GuiColor5]
			mov  eax,dword[GuiColor8]
			cmp  r12d,dword[DepthMoves+8*r14]
		      cmove  edx,eax
		     invoke  SetTextColor,[hMentorMemDC],edx

			mov  [rect.left],10
			mov  [rect.right],MOVE_SPACE
		     invoke  DrawTextA,[hMentorMemDC],Message,-1,rect,DT_EDITCONTROL


		       imul  ebx,r14d,64
			lea  rbx,[DepthArray+4*rbx]
			mov  r15d,dword[Engine5MaxDepth]
      .scoreloop:	lea  rdi,[Message]
			mov  ecx,[rbx+4*r15]
		       call  PrintEngineScore
			xor  eax,eax
		      stosd
			mov  eax,dword[Engine5MaxDepth]
			sub  eax,r15d
		       imul  eax,SCORE_SPACE
			add  eax,MOVE_SPACE
			lea  ecx,[rax+SCORE_SPACE]
			mov  [rect.left],eax

			mov  edx,[rc.right]
			sub  edx,7
			cmp  ecx,edx
		      cmova  ecx,edx
			cmp  eax,ecx
			jge  .skip
			mov  [rect.right],ecx

		     invoke  DrawTextA,[hMentorMemDC],Message,-1,rect,DT_EDITCONTROL

	 .skip:
			sub  r15d,1
			jns  .scoreloop


			jmp  .moveloop
      .moveloopdone:








			pop  r15 r14 r13 r12 rdi rsi rbp
			ret
