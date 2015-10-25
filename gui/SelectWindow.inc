proc SelectWindowProc hwnd,wmsg,wparam,lparam

		mov  [hwnd],rcx
		mov  [wmsg],rdx
		mov  [wparam],r8
		mov  [lparam],r9
	       push  r15 r14 r13 r12 rdx rbx rdi rsi

	  ;      cmp  edx,WM_COMMAND
	  ;       je  .wm_command
		cmp  edx,WM_CREATE
		 je  .wm_create
		cmp  edx,WM_SETFOCUS
		 je  .wm_setfocus
		cmp  edx,WM_PAINT
		 je  .wm_paint
		cmp  edx,WM_SIZE
		 je  .wm_size
		cmp  edx,WM_LBUTTONDOWN
		 je  .wm_lbuttondown
		cmp  edx,WM_DESTROY
		 je  .wm_destroy
		cmp  edx,WM_CTLCOLOREDIT
		 je  .wm_ctlcoloredit


.defwndproc:
	     invoke  DefWindowProc,[hwnd],[wmsg],[wparam],[lparam]
		jmp  .return


.wm_ctlcoloredit:
	     invoke  SetTextColor,[wparam], dword[GuiColor5]
	     invoke  SetBkColor  ,[wparam], qword[GuiColor1]
		mov  rax, qword[GuiColor1brush]
		jmp  .return


.wm_setfocus:
	     invoke  SetFocus,[hEditWindow]
		jmp  .wm_redraw

.wm_create:
	     invoke  BringWindowToTop, qword[hwnd]

		lea  rsi, [SelectEditRect]
	     invoke  CreateWindowEx,WS_EX_CLIENTEDGE,'EDIT',0,\
		     WS_VISIBLE+WS_CHILD+0*WS_HSCROLL+0*WS_VSCROLL+ES_AUTOHSCROLL+ES_AUTOVSCROLL+ES_MULTILINE,\
		     dword[rsi+0],dword[rsi+4],dword[rsi+8],dword[rsi+12],[hwnd],0,[hInstance],NULL
		mov  [hEditWindow], rax

	     invoke  SendMessage,[hEditWindow],WM_SETFONT,[hFontMedium],FALSE

.wm_redraw:
	     invoke  DeleteObject,[hSelectBitmap]
	     invoke  DeleteDC,[hSelectMemDC]
	     invoke  GetClientRect,[hwnd],rc
		xor  eax,eax
	     invoke  CreateCompatibleDC,rax
		mov  [hSelectMemDC],rax
	     invoke  CreateBitmap,[rc.right],[rc.bottom],1,32,NULL
		mov  [hSelectBitmap],rax
	     invoke  SelectObject,[hSelectMemDC],[hSelectBitmap]

	       call  PaintSelectWindow
.wm_size:
.wm_paint:
	     invoke  GetClientRect, [hwnd], rc
	     invoke  InvalidateRect, [hwnd], rc, FALSE
	     invoke  BeginPaint, [hwnd], ps
		mov  [hdc], rax
	     invoke  BitBlt, [hdc], 0, 0, [rc.right], [rc.bottom], [hSelectMemDC], 0, 0, SRCCOPY
	     invoke  EndPaint, [hwnd], ps
		jmp  .returnz
.wm_lbuttondown:
	     invoke  GetClientRect, [hwnd], rc
	      movsx  eax, word[lparam+0]
	      movsx  ecx, word[lparam+2]
		mov  dword[pt.x], eax
		mov  dword[pt.y], ecx

		mov  [rect.left],SELECT_X1+5
		mov  [rect.right],SELECT_X2-5
		mov  [rect.top], SELECT_Y1+1
		mov  [rect.bottom], SELECT_Y2
	       call  pt_In_rect
	       test  eax, eax
		jnz  .button_sel

		lea  rcx, [SelectOkRect]
	       call  pt_In_rect_2
	       test  eax, eax
		jnz  .button_ok

		lea  rcx, [SelectCloneRect]
	       call  pt_In_rect_2
	       test  eax, eax
		jnz  .button_clone
		lea  rcx, [SelectDeleteRect]
	       call  pt_In_rect_2
	       test  eax, eax
		jnz  .button_delete
		lea  rcx, [SelectUpRect]
	       call  pt_In_rect_2
	       test  eax, eax
		jnz  .button_up
		lea  rcx, [SelectDownRect]
	       call  pt_In_rect_2
	       test  eax, eax
		jnz  .button_down
		lea  rcx, [SelectUpdateRect]
	       call  pt_In_rect_2
	       test  eax, eax
		jnz  .button_update
		lea  rcx, [SelectHumanRect]
	       call  pt_In_rect_2
	       test  eax, eax
		jnz  .button_human
		jmp  .wm_redraw

.button_human:
		xor  eax, eax
		jmp  .return_sel
.button_ok:
		mov  eax, dword[PersonSelection]
		add  eax, 1
.return_sel:
		mov  dword[CurrentPerson], eax
	     invoke  SendMessage,[hSelectParent],WM_COMMAND, 0, 0
	     invoke  DestroyWindow,[hSelectWindow]
		jmp  .returnz
.button_update:
	     invoke  SendMessage,[hEditWindow],WM_GETTEXT,ENGINE_READ_BUFFER_SIZE,Message
		lea  rcx, [Message]
		mov  edx, eax
	       call  Person_Update
		jmp  .wm_redraw
.button_down:
	       call  Person_MoveDown
		jmp  .wm_redraw
.button_up:
	       call  Person_MoveUp
		jmp  .wm_redraw
.button_clone:
	       call  Person_Clone
		jmp  .wm_redraw
.button_delete:
	       call  Person_Delete
		jmp  .wm_redraw


.button_sel:
		mov  eax, dword[pt.y]
		sub  eax, SELECT_Y1+1
		 js  .returnz
		mov  ecx, 19
		xor  edx, edx
		div  ecx
		add  eax, dword[PersonSelOrg]
		mov  ecx, dword[PersonCount]
		cmp  eax, ecx
		jae  .returnz
		mov  dword[PersonSelection], eax
		jmp  .wm_redraw
.wm_destroy:
	     invoke  DeleteObject, [hSelectBitmap]
	     invoke  DeleteDC, [hSelectMemDC]
		xor  eax, eax
		mov  [hSelectBitmap], rax
		mov  [hSelectMemDC], rax
		mov  [hSelectWindow], rax
.returnz:
		xor  eax,eax
.return:
		pop  rsi rdi rbx rdx r12 r13 r14 r15
		ret
endp




PaintSelectWindow:
	       push  rbp rsi rdi r12 r13 r14 r15

		lea  rdi, [Message]
		mov  ecx, dword[PersonSelection]
		mov  esi, dword[PersonOffsets+4*rcx]
		mov  ecx, dword[PersonOffsets+4*rcx+4]
		sub  ecx, esi
		add  rsi, qword[PersonText]
	  rep movsb
		xor  eax, eax
	      stosb
	     invoke  SendMessage, [hEditWindow], WM_SETTEXT, 0, Message

	     invoke  SelectObject,[hSelectMemDC],qword[GuiColor1brush]
	     invoke  SelectObject,[hSelectMemDC],qword[GuiColor2pen]
	     invoke  Rectangle,[hSelectMemDC],0,0,[rc.right],[rc.bottom]

	     invoke  SetTextColor,[hSelectMemDC],dword[GuiColor5]
	     invoke  SelectObject,[hSelectMemDC],[hFontTitle]
	     invoke  SetBkColor,[hSelectMemDC],dword[GuiColor1]
		mov  [rect.left],10
		mov  [rect.top],1
		mov  [rect.right],200
		mov  [rect.bottom],24
	     invoke  DrawTextA,[hSelectMemDC],'Select Player',13,rect,DT_EDITCONTROL

	     invoke  SelectObject,[hSelectMemDC],[GuiColor3brush]
	     invoke  SelectObject,[hSelectMemDC],[GuiColor4pen]
		mov  [rect.left],SELECT_X1
		mov  [rect.right],SELECT_X2
		mov  [rect.top],SELECT_Y1
		mov  [rect.bottom],SELECT_Y2
	     invoke  Rectangle,[hSelectMemDC],[rect.left],[rect.top],[rect.right],[rect.bottom]

	     invoke  SelectObject,[hSelectMemDC],[hFontLarge]
	     invoke  SetTextColor,[hSelectMemDC],dword[GuiColor5]
	     invoke  SetBkColor,[hSelectMemDC],dword[GuiColor3]
		mov  [rect.left],SELECT_X1+6
		mov  [rect.right],SELECT_X2-6

		xor  ecx, ecx
		mov  eax, dword[PersonSelection]
		sub  eax, 10
		mov  edx, dword[PersonCount]
		sub  edx, 21
		cmp  eax, edx
	      cmovg  eax, edx
	       test  eax, eax
	      cmovs  eax, ecx
		mov  dword[PersonSelOrg], eax

		mov  r13d, 21
.ListNextPerson:
		mov  r15d, dword[PersonSelOrg]
		sub  r13d, 1
		 js  .ListDone

		add  r15d, r13d
		cmp  r15d, dword[PersonCount]
		jae  .ListNextPerson

	       imul  eax, r13d, 19
		add  eax, SELECT_Y1+1
		lea  ecx, [rax+22]
		mov  [rect.top], eax
		mov  [rect.bottom], ecx

		mov  ecx, dword[PersonOffsets+4*r15]
	       call  PersonGetNextEntry
		mov  ecx, edx
		mov  edx,'RATE'
	       call  PersonGetXXXXFromNAME
		mov  ecx, eax
	       test  eax, eax
		 js  .NoRate
		lea  rdx, [Message]
	       call  CopyUntilEndQuote
	     invoke  SetTextColor,[hSelectMemDC],dword[GuiColor7]
	     invoke  DrawTextA,[hSelectMemDC],Message,4,rect,DT_RIGHT+DT_TOP;EDITCONTROL
.NoRate:
		mov  ecx, dword[PersonOffsets+4*r15]
	       call  PersonGetNextEntry
		mov  ecx, edx
		mov  esi, edx
		lea  rdx, [Message]
	       call  CopyUntilEndQuote
		mov  rdi, rdx
	       call  PersonGetNextEntry
		mov  dword[rdi], ' '
	     invoke  SetTextColor,[hSelectMemDC],dword[GuiColor6]
	     invoke  DrawTextA,[hSelectMemDC],Message,-1,rect,DT_LEFT+DT_TOP;EDITCONTROL
		cmp  r15d, dword[PersonSelection]
		jne  .ListNextPerson
		mov  r14d, [rect.top]
		jmp  .ListNextPerson
.ListDone:
		lea  eax, [r14d+2]
		lea  ecx, [r14d+21]
		mov  [rect.top], eax
		mov  [rect.bottom], ecx
		add  [rect.right], 3
		sub  [rect.left], 3
	     invoke  FrameRect,[hSelectMemDC],rect,qword[GuiColor10brush]




	     invoke  SetTextColor,[hSelectMemDC],dword[GuiColor6]
	     invoke  SelectObject,[hSelectMemDC],[hFontLarge]
	     invoke  DrawTextA, [hSelectMemDC], 'Ok',2, SelectOkRect, DT_CENTER
	     invoke  DrawTextA, [hSelectMemDC], 'Up',2, SelectUpRect, DT_CENTER
	     invoke  DrawTextA, [hSelectMemDC], 'Down',4, SelectDownRect, DT_CENTER
	     invoke  DrawTextA, [hSelectMemDC], 'Update', 6, SelectUpdateRect, DT_CENTER
	     invoke  DrawTextA, [hSelectMemDC], 'Clone', 5, SelectCloneRect, DT_CENTER
	     invoke  DrawTextA, [hSelectMemDC], 'Delete', 6, SelectDeleteRect, DT_CENTER
	     invoke  DrawTextA, [hSelectMemDC], 'Human', 5, SelectHumanRect, DT_CENTER


		pop  r15 r14 r13 r12 rdi rsi rbp
		ret
