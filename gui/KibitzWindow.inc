proc KibitzWindowProc hwnd,wmsg,wparam,lparam

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
			 or  qword[OpenMask],KIBITZ_WND_MASK

 .wmsize:

 .wmcommand:
		     invoke  DeleteObject,[hKibitzBitmap]
		     invoke  DeleteDC,[hKibitzMemDC]

		     invoke  GetClientRect,[hwnd],rc

			mov  ecx,200
			mov  eax,[rc.bottom]
			cmp  eax,ecx
		      cmovb  eax,ecx
			mov  [rc.bottom],eax

			mov  ecx,300
			mov  eax,[rc.right]
			cmp  eax,ecx
		      cmovb  eax,ecx
			mov  [rc.right],eax

			xor  eax,eax
		     invoke  CreateCompatibleDC,rax
			mov  [hKibitzMemDC],rax
		     invoke  CreateBitmap,[rc.right],[rc.bottom],1,32,NULL
			mov  [hKibitzBitmap],rax
		     invoke  SelectObject,[hKibitzMemDC],[hKibitzBitmap]

.wm_redraw:
		       call  PaintKibitzWindow


 .wmpaint:
		     invoke  GetClientRect,[hwnd],rc
		     invoke  InvalidateRect,[hwnd],rc,FALSE
		     invoke  BeginPaint,[hwnd],ps
			mov  [hdc],rax
		     invoke  BitBlt,[hdc],0,0,[rc.right],[rc.bottom],[hKibitzMemDC],0,0,SRCCOPY


			mov  ecx,[rc.right]
			sub  ecx,22+0*21
			mov  edx,4
			mov  dword[Message],120-6
		       call  DrawButton
			mov  ecx,[rc.right]
			sub  ecx,22+1*21
			mov  edx,4
			mov  dword[Message],157
		       call  DrawButton

			cmp  dword[Engine3yOffset],0
			 je  @f

			mov  ecx,[rc.right]
			sub  ecx,30+0*21
			mov  edx,dword[Engine3yOffset]
			mov  dword[Message],120-6
		       call  DrawButton
			mov  ecx,[rc.right]
			sub  ecx,30+1*21
			mov  edx,dword[Engine3yOffset]
			mov  dword[Message],120-6-4*16+3
		       call  DrawButton
			mov  ecx,[rc.right]
			sub  ecx,30+2*21
			mov  edx,dword[Engine3yOffset]
			mov  dword[Message],120-6-4*16+4
		       call  DrawButton
			mov  ecx,[rc.right]
			sub  ecx,30+3*21
			mov  edx,dword[Engine3yOffset]
			mov  dword[Message],211
		       call  DrawButton
	@@:
			cmp  dword[Engine4yOffset],0
			 je  @f

			mov  ecx,[rc.right]
			sub  ecx,30+0*21
			mov  edx,dword[Engine4yOffset]
			mov  dword[Message],120-6
		       call  DrawButton
			mov  ecx,[rc.right]
			sub  ecx,30+1*21
			mov  edx,dword[Engine4yOffset]
			mov  dword[Message],120-6-4*16+3
		       call  DrawButton
			mov  ecx,[rc.right]
			sub  ecx,30+2*21
			mov  edx,dword[Engine4yOffset]
			mov  dword[Message],120-6-4*16+4
		       call  DrawButton
			mov  ecx,[rc.right]
			sub  ecx,30+3*21
			mov  edx,dword[Engine4yOffset]
			mov  dword[Message],211
		       call  DrawButton
	@@:
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
			jnz  .kibitz_window_close

			mov  ecx,[rc.right]
			sub  ecx,22+1*21
			mov  edx,4
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .kibitz_window_new


	.engine3_button:
			mov  ecx,[rc.right]
			sub  ecx,30
			mov  edx,dword[Engine3yOffset]
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

			sub  ecx,21
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .engine_upload

	.engine4_button:
			mov  ecx,[rc.right]
			sub  ecx,30
			mov  edx,dword[Engine4yOffset]
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

			sub  ecx,21
		       call  PointInButtonQ
		       test  eax,eax
			jnz  .engine_upload


			jmp  .returnz


.engine_close:		mov  rcx,r15
		       call  Engine_Quit
		     invoke  Sleep,125
			jmp  .wm_redraw

.engine_pv:		mov  rcx,r15
			mov  edx,r14d
		       call  Engine_ChangePVCount
			jmp  .returnz

.engine_upload: 	mov  rcx,r15
			not  byte[rcx-Engine1+Engine1_UploadQ]
		     invoke  SendMessage,[hMainWindow],WM_PAINT,0,0
			jmp  .returnz

.kibitz_window_close:

			and  qword[OpenMask],not KIBITZ_WND_MASK
		     invoke  DestroyWindow,[hKibitzWindow]

			jmp  .returnz


.kibitz_window_new:
		     invoke  DialogBoxParamA,[hInstance],ID_LoadPersonDialog,[hKibitzWindow],LoadPersonDialogProc,0
		       test  eax,eax
			 js  .returnz
			mov  ecx,dword[CurrentPerson]
			cmp  dword[Engine3_On],0
			jne  .second_kibitz
	  .first_kibitz:
		       call  TurnOnKibitzer
		     invoke  Sleep,125
			jmp  .wm_redraw

	  .second_kibitz:
		       call  TurnOnSecondKibitzer
		     invoke  Sleep,125
			jmp  .wm_redraw



 .wmmousemove:		jmp  .returnz
 .wmlbuttonup:		jmp  .returnz
 .wmrbuttondown:	jmp  .returnz

.wm_destroy:

		     invoke  GetWindowRect,[hKibitzWindow],KibitzWindowRect
		     invoke  MapWindowPoints,HWND_DESKTOP,[hMainWindow],KibitzWindowRect,2
			mov  eax,[KibitzWindowRect.left]
			sub  [KibitzWindowRect.right],eax
			mov  eax,[KibitzWindowRect.top]
			sub  [KibitzWindowRect.bottom],eax

		     invoke  DeleteObject,[hKibitzBitmap]
		     invoke  DeleteDC,[hKibitzMemDC]
			xor  eax,eax
			mov  [hKibitzBitmap],rax
			mov  [hKibitzMemDC],rax
			mov  [hKibitzWindow],rax

.returnz:		xor  eax,eax
.return:		pop  rsi rdi rbx rdx r12 r13 r14 r15
			ret
endp






PaintKibitzWindow:

		       push  rbp rsi rdi r12 r13 r14 r15


			sub  rsp,8*16
			mov  rbp,rsp


virtual at rbp
 .engine  dq ?
 .engine1_top	 dq ?
 .engine1_bottom dq ?
 .engine2_top	 dq ?
 .engine2_bottom dq ?
end virtual


		     invoke  SelectObject,[hKibitzMemDC],qword[GuiColor1brush1]
		     invoke  SelectObject,[hKibitzMemDC],qword[GuiColor2pen1]
		     invoke  Rectangle,[hKibitzMemDC],0,0,[rc.right],[rc.bottom]

		     invoke  SetTextColor,[hKibitzMemDC],dword[GuiColor5]

		     invoke  SelectObject,[hKibitzMemDC],[hFontTitle]
		     invoke  SetBkColor,[hKibitzMemDC],dword[GuiColor1]
			mov  [rect.left],10
			mov  [rect.top],1
			mov  [rect.right],200
			mov  [rect.bottom],24
		     invoke  DrawTextA,[hKibitzMemDC],'Kibitzer',8,rect,DT_EDITCONTROL


			mov  eax,150
			mov  ebx,[rc.right]
			cmp  ebx,eax
		      cmovl  ebx,eax

			xor  eax,eax
			mov  dword[Engine3yOffset],eax
			mov  dword[Engine4yOffset],eax

			cmp  eax,dword[Engine3_On]
			 je  .engine3_no
			cmp  eax,dword[Engine4_On]
			 je  .engine3_yes_engine4_no


.engine3_yes_engine4_yes:

			mov  esi,26
			mov  dword[Engine3yOffset],esi
			mov  edi,[rc.bottom]
			shr  edi,1
			sub  edi,37
			lea  eax,[rsi+40]
			cmp  edi,eax
		      cmovl  edi,eax
			mov  ebx,[rc.right]
			lea  r15,[Engine3]
		       call  .paint_engine

			lea  esi,[rdi+50]
			mov  dword[Engine4yOffset],esi
			mov  edi,[rc.bottom]
			sub  edi,50
			lea  eax,[rsi+40]
			cmp  edi,eax
		      cmovl  edi,eax
			lea  r15,[Engine4]
		       call  .paint_engine

			jmp  .done_painting

.engine3_yes_engine4_no:
			mov  esi,26
			mov  dword[Engine3yOffset],esi
			mov  edi,[rc.bottom]
			sub  edi,50
			lea  eax,[rsi+40]
			cmp  edi,eax
		      cmovl  edi,eax
			lea  r15,[Engine3]
		       call  .paint_engine

			jmp  .done_painting
.engine3_no:
			cmp  dword[Engine4_On],0
			 je  .engine3_no_engine4_no
.engine3_no_engine4_yes:
			mov  esi,26
			mov  dword[Engine4yOffset],esi
			mov  edi,[rc.bottom]
			sub  edi,50
			lea  eax,[rsi+40]
			cmp  edi,eax
		      cmovl  edi,eax
			lea  r15,[Engine4]
		       call  .paint_engine
			jmp  .done_painting

.engine3_no_engine4_no:

.done_painting:

			mov  rsp,rbp
			add  rsp,8*16
			pop  r15 r14 r13 r12 rdi rsi rbp
			ret


.paint_engine:
			mov  qword[.engine],r15
		       push  rbp

		     invoke  SetBkColor,[hKibitzMemDC],dword[GuiColor1]
		     invoke  SelectObject,[hKibitzMemDC],[hFontMedium]
			mov  [rect.left],5
			mov  [rect.top],esi
			mov  [rect.right],ebx
			add  esi,20
			mov  [rect.bottom],esi
			lea  rdx,[r15-Engine1+Engine1_Name]
		     invoke  DrawTextA,[hKibitzMemDC],rdx,-1,rect,DT_EDITCONTROL


		     invoke  SelectObject,[hKibitzMemDC],[GuiColor3brush2]
		     invoke  SelectObject,[hKibitzMemDC],[GuiColor4pen2]
			mov  [rect.left],BORDERWIDTH
			mov  [rect.top],esi
			lea  eax,[rbx-BORDERWIDTH-1]
			mov  [rect.right],eax
			mov  [rect.bottom],edi
		     invoke  Rectangle,[hKibitzMemDC],[rect.left],[rect.top],[rect.right],[rect.bottom]


TIME_O	= 0
DEPTH_O = 50
EVAL_O	= 90
MOVES_O = 150
TEXT_O	= 5
		     invoke  SetBkColor,[hKibitzMemDC],dword[GuiColor1]

			add  esi,2
			mov  [rect.top],esi
			add  esi,17
			mov  [rect.bottom],esi

			mov  [rect.left], BORDERWIDTH+2+TIME_O
			mov  [rect.right],BORDERWIDTH+2+DEPTH_O-2
		     invoke  FillRect,[hKibitzMemDC],rect,[GuiColor1brush1]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hKibitzMemDC],'Time',4,rect,DT_LEFT+DT_TOP

			mov  [rect.left], BORDERWIDTH+2+DEPTH_O
			mov  [rect.right],BORDERWIDTH+2+EVAL_O-2
		     invoke  FillRect,[hKibitzMemDC],rect,[GuiColor1brush1]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hKibitzMemDC],'Ply',3,rect,DT_LEFT+DT_TOP

			mov  [rect.left], BORDERWIDTH+2+EVAL_O
			mov  [rect.right],BORDERWIDTH+2+MOVES_O-2
		     invoke  FillRect,[hKibitzMemDC],rect,[GuiColor1brush1]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hKibitzMemDC],'Score',5,rect,DT_LEFT+DT_TOP

			mov  [rect.left], BORDERWIDTH+2+MOVES_O
			lea  eax,[rbx-BORDERWIDTH-1-2]
			mov  [rect.right],eax
		     invoke  FillRect,[hKibitzMemDC],rect,[GuiColor1brush1]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hKibitzMemDC],'Moves',5,rect,DT_LEFT+DT_TOP



		     invoke  SetBkColor,[hKibitzMemDC],dword[GuiColor3]


			mov  r14d,ENGINE_LINE_COUNT-1

       .next_row:
		       imul  edx,r14d,15
			lea  edx,[rdx+rsi+1]
			lea  eax,[rdx+rsi+16]
			mov  [rect.top],edx

			lea  ecx,[rdi-3]
			cmp  eax,ecx
		      cmova  eax,ecx
			mov  dword[rect.bottom],eax

			cmp  edx,eax
			jge  .line_done


			mov  r15,qword[.engine]
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



		     invoke  DrawTextA,[hKibitzMemDC],r12,r13,rect,DT_LEFT+DT_TOP


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

			mov  r15,qword[.engine]


			lea  esi,[rdi+1]

		     invoke  SelectObject,[hKibitzMemDC],[GuiColor3brush2]
		     invoke  SelectObject,[hKibitzMemDC],[GuiColor4pen2]
			mov  [rect.left],BORDERWIDTH
			lea  eax,[rbx-BORDERWIDTH-1]
			mov  [rect.right],eax
			mov  [rect.top],esi
			lea  eax,[rsi+40]
			mov  [rect.bottom],eax
		     invoke  Rectangle,[hKibitzMemDC],[rect.left],[rect.top],[rect.right],[rect.bottom]





		     invoke  SetBkColor,[hKibitzMemDC],dword[GuiColor1]

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
		     invoke  FillRect,[hKibitzMemDC],rect,[GuiColor1brush1]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hKibitzMemDC],'Memory',6,rect,DT_LEFT+DT_TOP

			mov  [rect.left], BORDERWIDTH+2+SPEED_O
			mov  [rect.right],BORDERWIDTH+2+NODES_O-2
		     invoke  FillRect,[hKibitzMemDC],rect,[GuiColor1brush1]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hKibitzMemDC],'Nodes / Sec',11,rect,DT_LEFT+DT_TOP

			mov  [rect.left], BORDERWIDTH+2+NODES_O
			mov  [rect.right],BORDERWIDTH+2+CURRENT_O-2
		     invoke  FillRect,[hKibitzMemDC],rect,[GuiColor1brush1]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hKibitzMemDC],'Positions',9,rect,DT_LEFT+DT_TOP

			mov  [rect.left], BORDERWIDTH+2+CURRENT_O
			lea  eax,[rbx-BORDERWIDTH-1-2]
			mov  [rect.right],eax
		     invoke  FillRect,[hKibitzMemDC],rect,[GuiColor1brush1]
			add  [rect.left],TEXT_O
		     invoke  DrawTextA,[hKibitzMemDC],'Extras',6,rect,DT_LEFT+DT_TOP


		     invoke  SetBkColor,[hKibitzMemDC],dword[GuiColor3]

			add  esi,2
			mov  [rect.top],esi
			add  esi,16
			mov  [rect.bottom],esi


			mov  [rect.left],BORDERWIDTH+2+MEMORY_O    +TEXT_O+2
			mov  [rect.right],BORDERWIDTH+2+SPEED_O-2
			lea  rdx,[r15-Engine1+Engine1_MemoryUsage]
		     invoke  DrawTextA,[hKibitzMemDC],rdx,-1,rect,DT_LEFT+DT_TOP

			mov  [rect.left],BORDERWIDTH+2+SPEED_O	  +TEXT_O+2
			mov  [rect.right],BORDERWIDTH+2+NODES_O-2
			lea  rdx,[r15-Engine1+Engine1__nps]
		     invoke  DrawTextA,[hKibitzMemDC],rdx,-1,rect,DT_LEFT+DT_TOP

			mov  [rect.left],BORDERWIDTH+2+NODES_O	  +TEXT_O+2
			mov  [rect.right],BORDERWIDTH+2+CURRENT_O-2
			lea  rdx,[r15-Engine1+Engine1__nodes]
		     invoke  DrawTextA,[hKibitzMemDC],rdx,-1,rect,DT_LEFT+DT_TOP


			pop  rbp
			ret
