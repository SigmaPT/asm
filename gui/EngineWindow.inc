proc EngineWindowProc hwnd,wmsg,wparam,lparam

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
			 or  qword[OpenMask],ENGINE_WND_MASK
			 or  eax,-1
			mov  byte[Engine1_UploadQ],al
			mov  byte[Engine2_UploadQ],al
.wmsize:
		     invoke  DeleteObject,[hEngineBitmap]
		     invoke  DeleteDC,[hEngineMemDC]

		     invoke  GetClientRect,[hwnd],EWrc

			mov  ecx,100
			mov  eax,[EWrc.bottom]
			cmp  eax,ecx
		      cmovb  eax,ecx
			mov  [EWrc.bottom],eax
			mov  ecx,200
			mov  eax,[EWrc.right]
			cmp  eax,ecx
		      cmovb  eax,ecx
			mov  [EWrc.right],eax


		xor  eax,eax
	     invoke  CreateCompatibleDC,rax
		mov  [hEngineMemDC],rax
	     invoke  CreateBitmap,[EWrc.right],[EWrc.bottom],1,32,NULL
		mov  [hEngineBitmap],rax
	     invoke  SelectObject,[hEngineMemDC],[hEngineBitmap]

.wm_redraw:
		       call  PaintEngineWindow
 .wmpaint:
		     invoke  GetClientRect,[hwnd],rc
		     invoke  InvalidateRect,[hwnd],rc,FALSE
		     invoke  BeginPaint,[hwnd],ps
			mov  [hdc],rax
		     invoke  BitBlt,[hdc],0,0,[rc.right],[rc.bottom],[hEngineMemDC],0,0,SRCCOPY
		     invoke  EndPaint,[hwnd],ps
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
		jnz  .engine_window_close

		mov  ecx,[rc.right]
		sub  ecx,22+1*21
		mov  edx,4
	       call  PointInButtonQ
	       test  eax,eax
		jnz  .kibitz_window_new

;                jmp  .returnz

	.engine3_button:
		cmp  dword[Engine3_On],0
		 je  .engine4_button

		mov  ecx,[rc.right]
		sub  ecx,30
		mov  edx,dword[Engine3_yOffset]
		lea  r15,[Engine3]

	       test  edx,edx
		 jz  .engine4_button

	       call  PointInButtonQ
	       test  eax,eax
		jnz  .engine_close

			sub  ecx,21
			mov  r14d,1
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .engine_pv

			sub  ecx,21
			mov  r14d,-1
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .engine_pv

.engine4_button:
		cmp  dword[Engine4_On],0
		 je  .kibitz_buttons_done

			mov  ecx,[rc.right]
			sub  ecx,30
			mov  edx,dword[Engine4_yOffset]
			lea  r15,[Engine4]

		       test  edx,edx
			 jz  .returnz

		       call  PointInButtonQ
		       test  eax,eax
			jnz  .engine_close

			sub  ecx,21
			mov  r14d,1
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .engine_pv

			sub  ecx,21
			mov  r14d,-1
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .engine_pv

.kibitz_buttons_done:
			jmp  .returnz


.engine_close:		mov  rcx,r15
		       call  Engine_Quit
		     invoke  Sleep,125
			jmp  .wm_redraw

.engine_pv:		mov  rcx,r15
			mov  edx,r14d
		       call  Engine_ChangePVCount
			jmp  .returnz



.engine_window_close:
		and  qword[OpenMask],not ENGINE_WND_MASK
	     invoke  DestroyWindow,[hEngineWindow]
		jmp  .returnz

.kibitz_window_new:
	     invoke  DialogBoxParamA,[hInstance],ID_LoadPersonDialog,[hEngineWindow],LoadPersonDialogProc,0
		cmp  eax, 2
		jne  .returnz
		lea  rcx, [Engine3]
		lea  rax, [Engine4]
		cmp  dword[Engine3_On],0
	     cmovne  rcx, rax
		mov  eax, dword[PersonSelection]
		mov  edx, dword[PersonOffsets+4*rax]
		mov  r8d, dword[PersonOffsets+4*rax+4]
		add  rdx, qword[PersonText]
		add  r8, qword[PersonText]
	       call  Engine_TurnOnKibitzer
	     invoke  Sleep, 100
		jmp  .wm_redraw

.wmrbuttondown:
		jmp  .returnz


.wm_destroy:

	     invoke  GetWindowRect,[hEngineWindow],EngineWindowRect
	     invoke  MapWindowPoints,HWND_DESKTOP,[hMainWindow],EngineWindowRect,2
		mov  eax,[EngineWindowRect.left]
		sub  [EngineWindowRect.right],eax
		mov  eax,[EngineWindowRect.top]
		sub  [EngineWindowRect.bottom],eax

	     invoke  DeleteObject,[hEngineBitmap]
	     invoke  DeleteDC,[hEngineMemDC]
		xor  eax,eax
		mov  [hEngineBitmap],rax
		mov  [hEngineMemDC],rax
		mov  [hEngineWindow],rax

		mov  byte[Engine1_UploadQ],al
		mov  byte[Engine2_UploadQ],al


.returnz:
		xor  eax,eax
.return:
		pop  rsi rdi rbx rdx r12 r13 r14 r15
		ret
endp








PaintEngineWindow:

		       push  rbp rsi rdi r12 r13 r14 r15


			sub  rsp,8*16
			mov  rbp,rsp


virtual at rbp
 .engineA  dq ?
 .engineB  dq ?
 .engineC  dq ?
 .engineD  dq ?
 .count    dq ?
end virtual

		     invoke  SelectObject,[hEngineMemDC],qword[GuiColor1brush]
		     invoke  SelectObject,[hEngineMemDC],qword[GuiColor2pen]
		     invoke  Rectangle,[hEngineMemDC],0,0,[EWrc.right],[EWrc.bottom]

		     invoke  SetTextColor,[hEngineMemDC],dword[GuiColor5]

		     invoke  SelectObject,[hEngineMemDC],[hFontTitle]
		     invoke  SetBkColor,[hEngineMemDC],dword[GuiColor1]
			mov  [rect.left],10
			mov  [rect.top],1
			mov  [rect.right],200
			mov  [rect.bottom],24
		     invoke  DrawTextA,[hEngineMemDC],'Thinking Lines',14,rect,DT_EDITCONTROL


			mov  eax,250
			mov  ebx,[EWrc.right]
			cmp  ebx,eax
		      cmovl  ebx,eax

		xor  ecx, ecx

.Check1:
		lea  rax, [Engine1]
		cmp  dword[Engine1_On],0
		 je  .Check2
		mov  qword[.engineA+8*rcx], rax
		add  ecx, 1
.Check2:
		lea  rax, [Engine2]
		cmp  dword[Engine2_On],0
		 je  .CheckFlip
		mov  qword[.engineA+8*rcx], rax
		add  ecx, 1
.CheckFlip:
		cmp  ecx, 2
		 jb  .Check3
		cmp  byte[BoardFlip], 0
		jne  .Check3
		mov  rax, qword[.engineA+8*0]
		mov  rdx, qword[.engineA+8*1]
		mov  qword[.engineA+8*1], rax
		mov  qword[.engineA+8*0], rdx
.Check3:
		lea  rax, [Engine3]
		cmp  dword[Engine3_On],0
		 je  .Check4
		mov  qword[.engineA+8*rcx], rax
		add  ecx, 1
.Check4:
		lea  rax, [Engine4]
		cmp  dword[Engine4_On],0
		 je  .Check5
		mov  qword[.engineA+8*rcx], rax
		add  ecx, 1
.Check5:
		mov  qword[.count], rcx
	       test  ecx, ecx
		 jz  .finished_drawing

		mov  eax, dword[EWrc.bottom]
		sub  eax, 25
		xor  edx, edx
		div  ecx
		xor  r13d, r13d
		mov  ecx, 103
		cmp  eax, ecx
	      cmovb  eax, ecx
		mov  r14d, eax
		xor  r12d, r12d
.draw_next:
		mov  r15, [.engineA+8*r12]
		lea  esi, [r13+25]
		add  r13d, r14d
		lea  edi, [r13d-20]
		mov  dword[r15-Engine1+Engine1_yOffset], esi
	       call  .paint_engine
		add  r12d, 1
		cmp  r12d, dword[.count]
		 jb  .draw_next
.finished_drawing:

		mov  ecx,[EWrc.right]
		sub  ecx,22+0*21
		mov  edx,4
		mov  r8, [hEngineMemDC]
		mov  dword[Message],120-6
	       call  DrawButtonHdc
		mov  ecx,[EWrc.right]
		sub  ecx,22+1*21
		mov  edx,4
		mov  r8, [hEngineMemDC]
		mov  dword[Message],157
	       call  DrawButtonHdc


		mov  rsp,rbp
		add  rsp,8*16
		pop  r15 r14 r13 r12 rdi rsi rbp
		ret



.paint_engine:
	       push  rbp r12 r13 r14 r15

		lea  rax, [Engine3]
		cmp  r15, rax
		 jb  .NotKibitzer
		mov  ecx,[EWrc.right]
		sub  ecx,30+0*21
		mov  edx,esi
		mov  dword[Message],120-6
		mov  r8, [hEngineMemDC]
	       call  DrawButtonHdc
		mov  ecx,[EWrc.right]
		sub  ecx,30+1*21
		mov  edx,esi
		mov  dword[Message],120-6-4*16+3
		mov  r8, [hEngineMemDC]
	       call  DrawButtonHdc
		mov  ecx,[EWrc.right]
		sub  ecx,30+2*21
		mov  edx,esi
		mov  dword[Message],120-6-4*16+4
		mov  r8, [hEngineMemDC]
	       call  DrawButtonHdc
.NotKibitzer:

	     invoke  SetBkColor,[hEngineMemDC],dword[GuiColor1]
	     invoke  SetTextColor,[hEngineMemDC],dword[GuiColor5]
	     invoke  SelectObject,[hEngineMemDC],[hFontMedium]
		mov  [rect.left],5
		mov  [rect.top],esi
		mov  [rect.right],ebx
		add  esi,20
		mov  [rect.bottom],esi
		lea  rdx,[r15-Engine1+Engine1_Name]
	     invoke  DrawTextA,[hEngineMemDC],rdx,-1,rect,DT_EDITCONTROL




		     invoke  SelectObject,[hEngineMemDC],[GuiColor3brush]
		     invoke  SelectObject,[hEngineMemDC],[GuiColor4pen]
			mov  [rect.left],BORDERWIDTH
			mov  [rect.top],esi
			lea  eax,[rbx-BORDERWIDTH-1]
			mov  [rect.right],eax
			mov  [rect.bottom],edi
		     invoke  Rectangle,[hEngineMemDC],[rect.left],[rect.top],[rect.right],[rect.bottom]


TIME_O	= 0
DEPTH_O = 50
EVAL_O	= 90
MOVES_O = 150
TEXT_O	= 5
		     invoke  SetBkColor,[hEngineMemDC],dword[GuiColor1]

			add  esi,2
			mov  [rect.top],esi
			add  esi,17
			mov  [rect.bottom],esi

			mov  [rect.left], BORDERWIDTH+2+TIME_O
			mov  [rect.right],BORDERWIDTH+2+DEPTH_O-2
		     invoke  FillRect,[hEngineMemDC],rect,[GuiColor1brush]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hEngineMemDC],'Time',4,rect,DT_LEFT+DT_TOP

			mov  [rect.left], BORDERWIDTH+2+DEPTH_O
			mov  [rect.right],BORDERWIDTH+2+EVAL_O-2
		     invoke  FillRect,[hEngineMemDC],rect,[GuiColor1brush]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hEngineMemDC],'Ply',3,rect,DT_LEFT+DT_TOP

			mov  [rect.left], BORDERWIDTH+2+EVAL_O
			mov  [rect.right],BORDERWIDTH+2+MOVES_O-2
		     invoke  FillRect,[hEngineMemDC],rect,[GuiColor1brush]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hEngineMemDC],'Score',5,rect,DT_LEFT+DT_TOP

			mov  [rect.left], BORDERWIDTH+2+MOVES_O
			lea  eax,[rbx-BORDERWIDTH-1-2]
			mov  [rect.right],eax
		     invoke  FillRect,[hEngineMemDC],rect,[GuiColor1brush]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hEngineMemDC],'Moves',5,rect,DT_LEFT+DT_TOP



		     invoke  SetBkColor,[hEngineMemDC],dword[GuiColor3]




			mov  r14d,ENGINE_LINE_COUNT-1

       .next_row:
		       imul  edx,r14d,15
			lea  edx,[rdx+rsi+1]
			lea  eax,[rdx+rsi+16]
			mov  [rect.top],edx
		 ;       mov  [rect.bottom],eax
		 ;
		 ;       mov  eax,[rect.bottom]
			lea  ecx,[rdi-3]
			cmp  eax,ecx
		      cmova  eax,ecx
			mov  dword[rect.bottom],eax

			cmp  edx,eax
			jge  .line_done


			mov  r15,qword[rsp]
		       imul  r12,r14,sizeof.ENGINE_LINE
			lea  rax,[r15-Engine1+Engine1_Lines+ENGINE_LINE.TEXT]
			add  r12,rax

			xor  r15d,r15d
       .line_next:	cmp  byte[r12],0
			 je  .line_done

			 or  r13,-1
		   @@:	add  r13,1
			cmp  byte[r12+r13],' '
			jae  @b

			mov  eax,BORDERWIDTH+2+TIME_O	 +TEXT_O+1
			mov  ecx,BORDERWIDTH+2+DEPTH_O-2
			cmp  r15d,0
			 je  .draw_text
			mov  eax,BORDERWIDTH+2+DEPTH_O	 +TEXT_O+1
			mov  ecx,BORDERWIDTH+2+EVAL_O-2
			cmp  r15d,1
			 je  .draw_text
			mov  eax,BORDERWIDTH+2+EVAL_O	 +TEXT_O+1
			mov  ecx,BORDERWIDTH+2+MOVES_O-2
			cmp  r15d,2
			 je  .draw_text
			mov  eax, BORDERWIDTH+2+MOVES_O  +TEXT_O+1
			lea  ecx,[rbx-BORDERWIDTH-1-3]
	.draw_text:
			mov  [rect.left],eax
			mov  [rect.right],ecx



		     invoke  DrawTextA,[hEngineMemDC],r12,r13,rect,DT_LEFT+DT_TOP


			add  r15d,1
			lea  r12,[r12+r13+1]
			cmp  byte[r12-1],0
			 je  .line_done
			cmp  byte[r12-1],9
			 je  .line_next

       .line_done:

			sub  r14d,1
			jns  .next_row

.all_rows_done:

			mov  r15,qword[rsp]


			lea  esi,[rdi-1]

		     invoke  SelectObject,[hEngineMemDC],[GuiColor3brush]
		     invoke  SelectObject,[hEngineMemDC],[GuiColor4pen]
			mov  [rect.left],BORDERWIDTH
			lea  eax,[rbx-BORDERWIDTH-1]
			mov  [rect.right],eax
			mov  [rect.top],esi
			lea  eax,[rsi+40]
			mov  [rect.bottom],eax
		     invoke  Rectangle,[hEngineMemDC],[rect.left],[rect.top],[rect.right],[rect.bottom]





		     invoke  SetBkColor,[hEngineMemDC],dword[GuiColor1]

			add  esi,2
			mov  [rect.top],esi
			add  esi,17
			mov  [rect.bottom],esi


MEMORY_O  = 0
SPEED_O   = 80
NODES_O  =  190
CURRENT_O = 310

			mov  [rect.left], BORDERWIDTH+2+MEMORY_O
			mov  [rect.right],BORDERWIDTH+2+SPEED_O-2
		     invoke  FillRect,[hEngineMemDC],rect,[GuiColor1brush]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hEngineMemDC],'Memory',6,rect,DT_LEFT+DT_TOP

			mov  [rect.left], BORDERWIDTH+2+SPEED_O
			mov  [rect.right],BORDERWIDTH+2+NODES_O-2
		     invoke  FillRect,[hEngineMemDC],rect,[GuiColor1brush]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hEngineMemDC],'Nodes / Sec',11,rect,DT_LEFT+DT_TOP

			mov  [rect.left], BORDERWIDTH+2+NODES_O
			mov  [rect.right],BORDERWIDTH+2+CURRENT_O-2
		     invoke  FillRect,[hEngineMemDC],rect,[GuiColor1brush]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hEngineMemDC],'Positions',9,rect,DT_LEFT+DT_TOP

			mov  [rect.left], BORDERWIDTH+2+CURRENT_O
			lea  eax,[rbx-BORDERWIDTH-1-2]
			mov  [rect.right],eax
		     invoke  FillRect,[hEngineMemDC],rect,[GuiColor1brush]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hEngineMemDC],'Extras',6,rect,DT_LEFT+DT_TOP


		     invoke  SetBkColor,[hEngineMemDC],dword[GuiColor3]

			add  esi,2
			mov  [rect.top],esi
			add  esi,16
			mov  [rect.bottom],esi


			mov  [rect.left],BORDERWIDTH+2+MEMORY_O    +TEXT_O+2
			mov  [rect.right],BORDERWIDTH+2+SPEED_O-2
			lea  rdx,[r15-Engine1+Engine1_MemoryUsage]
		     invoke  DrawTextA,[hEngineMemDC],rdx,-1,rect,DT_LEFT+DT_TOP

			mov  [rect.left],BORDERWIDTH+2+SPEED_O	  +TEXT_O+2
			mov  [rect.right],BORDERWIDTH+2+NODES_O-2
			lea  rdx,[r15-Engine1+Engine1__nps]
		     invoke  DrawTextA,[hEngineMemDC],rdx,-1,rect,DT_LEFT+DT_TOP

			mov  [rect.left],BORDERWIDTH+2+NODES_O	  +TEXT_O+2
			mov  [rect.right],BORDERWIDTH+2+CURRENT_O-2
			lea  rdx,[r15-Engine1+Engine1__nodes]
		     invoke  DrawTextA,[hEngineMemDC],rdx,-1,rect,DT_LEFT+DT_TOP


			pop  r15 r14 r13 r12 rbp
			ret
