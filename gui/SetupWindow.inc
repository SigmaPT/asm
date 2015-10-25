proc SetupWindowProc hwnd,wmsg,wparam,lparam

		mov  [hwnd], rcx
		mov  [wmsg], rdx
		mov  [wparam], r8
		mov  [lparam], r9
	       push  r15 r14 r13 r12 rdx rbx rdi rsi

		cmp  edx,WM_COMMAND
		 je  .wmcommand
		cmp  edx,WM_CREATE
		 je  .wmcreate
		cmp  edx,WM_PAINT
		 je  .wmpaint
		cmp  edx,WM_SIZE
		 je  .wmsize
		cmp  edx,WM_LBUTTONDOWN
		 je  .wmlbuttondown
		cmp  edx,WM_DESTROY
		 je  .wm_destroy
.defwndproc:
	     invoke  DefWindowProc,[hwnd],[wmsg],[wparam],[lparam]
		jmp  .return
.wmcreate:
	     invoke  BringWindowToTop, qword[hwnd]
	       call  CopyBoardToSetupBoard
		mov  byte[SetupSelection], 0
		mov  byte[GameMode], GAMEMODE_SETUP
.wmsize:
.wmcommand:
	     invoke  DeleteObject,[hSetupBitmap]
	     invoke  DeleteDC,[hSetupMemDC]
	     invoke  GetClientRect,[hwnd],rc
		xor  eax,eax
	     invoke  CreateCompatibleDC,rax
		mov  [hSetupMemDC],rax
	     invoke  CreateBitmap,[rc.right],[rc.bottom],1,32,NULL
		mov  [hSetupBitmap],rax
	     invoke  SelectObject,[hSetupMemDC],[hSetupBitmap]
.wm_redraw:
	       call  PaintSetupWindow
.wmpaint:
	     invoke  GetClientRect,[hwnd],rc
	     invoke  InvalidateRect,[hwnd],rc,FALSE
	     invoke  BeginPaint,[hwnd],ps
		mov  [hdc],rax
	     invoke  BitBlt,[hdc],0,0,[rc.right],[rc.bottom],[hSetupMemDC],0,0,SRCCOPY
	     invoke  EndPaint,[hwnd],ps
		jmp  .returnz
.wmlbuttondown:

	     invoke  GetClientRect,[hwnd],rc
	      movsx  eax,word[lparam+0]
	      movsx  ecx,word[lparam+2]
		mov  dword[pt.x],eax
		mov  dword[pt.y],ecx

		mov  [rect.left], 10
		mov  [rect.right], 10+40*2
		mov  [rect.top], 20
		mov  [rect.bottom], 20+40*8
	       call  pt_In_rect
	       test  eax, eax
		jnz  .button_grid

		mov  [rect.left], 5
		mov  [rect.right], 105
		mov  [rect.top], 355
		mov  [rect.bottom], 390
	       call  pt_In_rect
	       test  eax, eax
		jnz  .button_side
		mov  [rect.top], 390
		mov  [rect.bottom], 425
	       call  pt_In_rect
	       test  eax, eax
		jnz  .button_ok
		mov  [rect.top], 425
		mov  [rect.bottom], 460
	       call  pt_In_rect
	       test  eax, eax
		jnz  .button_cancel
		jmp  .returnz

.button_grid:
		mov  ecx, 40
		mov  eax, dword[pt.x]
		sub  eax, 10
		xor  edx, edx
		div  ecx
		mov  r8d, eax
		mov  eax, dword[pt.y]
		sub  eax, 20
		xor  edx, edx
		div  ecx
		lea  eax, [8*r8+rax]

		cmp  eax, 1
		 je  .button_clear

		mov  byte[SetupSelection], al
		jmp  .wm_redraw

.button_clear:
		xor  eax, eax
		lea  rdi,[SetupPos+Pos.board]
		mov  ecx, 8
	  rep stosq
		mov  byte[SetupState+State.epSquare], 64
		mov  byte[SetupState+State.castlingRights], al
		mov  byte[SetupPos+Pos.sideToMove], al
	     invoke  SendMessage, [hBoardWindow], WM_PAINT, 0, 0
		jmp  .returnz

.button_side:
		xor  byte[SetupPos+Pos.sideToMove], 1
		jmp  .wm_redraw
.button_ok:
	       push  rbp rbp
		lea  rbp, [SetupPos]


		xor  esi, esi
  irps i, 0 1 2 3 4 5 6 7 {
		mov  qword[rbp+Pos.typeBB+8*i], rsi    }

		lea  rax, [SetupState]
		mov  qword[rbp+Pos.nodes], rsi
		mov  qword[rbp+Pos.state], rax
		mov  dword[rbp+Pos.gamePly], esi

.fill_typebb:
	      movzx  eax, byte[rbp+Pos.board+rsi]
		mov  edx, eax
		and  eax, 7
		shr  edx, 3
		and  edx, 1
		cmp  eax, 2
		 jb  .nopiece
		bts  qword[rbp+Pos.typeBB+8*rax], rsi
		bts  qword[rbp+Pos.typeBB+8*rdx], rsi
.nopiece:
		add  esi, 1
		cmp  esi, 64
		 jb  .fill_typebb
	       call  IsPositionOk
	       test  eax, eax
		 jz  .button_ok_done
		lea  rdi, [Message]
	       call  PrintFen
		xor  eax, eax
	      stosd

		mov  rcx,qword[SetupWPerson_String]
		mov  r8, qword[SetupBPerson_String]
		mov  edx,dword[SetupWPerson_Length]
		mov  r9d,dword[SetupBPerson_Length]
		add  rdx, rcx
		add  r9, r8
		lea  r10, [Message]
		lea  r11, [RandSeed]
	       call  Game_StartNewGame

	     invoke  DestroyWindow,[hSetupWindow]
		mov  byte[GameMode], GAMEMODE_NORMAL
.button_ok_done:
	     invoke  SendMessage, [hBoardWindow], WM_PAINT, 0, 0
		pop  rbp rbp
		jmp  .returnz

.button_cancel:
	     invoke  DestroyWindow,[hSetupWindow]
		mov  byte[GameMode], GAMEMODE_NORMAL
	     invoke  SendMessage, [hBoardWindow], WM_PAINT, 0, 0
		jmp  .returnz
.wm_destroy:
	     invoke  DeleteObject, qword[hSetupBitmap]
	     invoke  DeleteDC, qword[hSetupMemDC]
		xor  eax, eax
		mov  [hSetupBitmap], rax
		mov  [hSetupMemDC], rax
		mov  [hSetupWindow], rax

.returnz:
		xor  eax,eax
.return:
		pop  rsi rdi rbx rdx r12 r13 r14 r15
		ret
endp


pt_In_rect:
		mov  eax, dword[pt.x]
		mov  ecx, dword[pt.y]
		cmp  eax, dword[rect.left]
		 jl  .false
		cmp  eax, dword[rect.right]
		 jg  .false
		cmp  ecx, dword[rect.top]
		 jl  .false
		cmp  ecx, dword[rect.bottom]
		 jg  .false
		 or  eax, -1
		ret
.false:
		xor  eax, eax
		ret

pt_In_rect_2:
		mov  eax, dword[pt.x]
		mov  edx, dword[pt.y]
		cmp  eax, dword[rcx+RECT.left]
		 jl  .false
		cmp  eax, dword[rcx+RECT.right]
		 jg  .false
		cmp  edx, dword[rcx+RECT.top]
		 jl  .false
		cmp  edx, dword[rcx+RECT.bottom]
		 jg  .false
		 or  eax, -1
		ret
.false:
		xor  eax, eax
		ret



CopyBoardToSetupBoard:
	       push  rbp rsi rdi
		mov  r8, qword[BoardPos+PosEx.state]
		lea  rsi, [BoardPos+PosEx.board]
		lea  rdi, [SetupPos+Pos.board]
		mov  ecx, 64
	  rep movsb
	      movzx  eax, byte[r8+State.castlingRights]
	      movzx  ecx, byte[r8+State.epSquare]
		mov  byte[SetupState+State.castlingRights], al
		mov  byte[SetupState+State.epSquare], cl
		pop  rdi rsi rbp
		ret









PaintSetupWindow:

		       push  rbp rsi rdi r12 r13 r14 r15



		     invoke  SelectObject,[hSetupMemDC],qword[GuiColor1brush]
		     invoke  SelectObject,[hSetupMemDC],qword[GuiColor2pen]
		     invoke  Rectangle,[hSetupMemDC],0,0,[rc.right],[rc.bottom]

		     invoke  SetTextColor,[hSetupMemDC],dword[GuiColor5]

		     invoke  SelectObject,[hSetupMemDC],[hFontTitle]
		     invoke  SetBkColor,[hSetupMemDC],dword[GuiColor1]
			mov  [rect.left],10
			mov  [rect.top],1
			mov  [rect.right],200
			mov  [rect.bottom],24
		     invoke  DrawTextA,[hSetupMemDC],'Setup',5,rect,DT_EDITCONTROL


		     invoke  SetTextColor,[hSetupMemDC],dword[GuiColor5]
		     invoke  SelectObject,[hSetupMemDC],[hFontHuge]





		xor  edi, edi
.row_loop:
		xor  esi, esi
.col_loop:
	       imul  eax, edi, 40
		add  eax, 10
		mov  [rect.left], eax
		add  eax, 40
		mov  [rect.right], eax
	       imul  ecx, esi, 40
		add  ecx, 23
		mov  [rect.top], ecx
		add  ecx, 40
		mov  [rect.bottom], ecx

	      movzx  eax, byte[.lookup+8*rdi+rsi]
		mov  dword[Message], eax
	     invoke  DrawTextA,[hSetupMemDC],Message,1,rect,DT_CENTER+DT_VCENTER

		add  esi, 1
		cmp  esi, 8
		 jb  .col_loop
		add  edi, 1
		cmp  edi, 2
		 jb  .row_loop

	      movzx  edi, byte[SetupSelection]
	      movzx  esi, byte[SetupSelection]
		and  esi, 7
		shr  edi, 3
	       imul  eax, edi, 40
		add  eax, 10
		mov  [rect.left], eax
		add  eax, 40
		mov  [rect.right], eax
	       imul  ecx, esi, 40
		add  ecx, 20
		mov  [rect.top], ecx
		add  ecx, 40
		mov  [rect.bottom], ecx
	     invoke  SelectObject,[hSetupMemDC],
	     invoke  SelectObject,[hSetupMemDC],qword[GuiColor2pen]
	     invoke  FrameRect,[hSetupMemDC],rect,qword[GuiColor10brush]


	     invoke  SelectObject,[hSetupMemDC],[hFontLarge]

		mov  [rect.left], 5
		mov  [rect.right], 105

		mov  [rect.top], 355
		mov  [rect.bottom], 390
		mov  rax, 'white'
		mov  rcx, 'black'
		cmp  byte[SetupPos+Pos.sideToMove], 0
	     cmovne  rax, rcx
		mov  qword[Message], rax
	     invoke  DrawTextA,[hSetupMemDC],Message,5,rect,DT_CENTER+DT_VCENTER
		mov  [rect.top], 390
		mov  [rect.bottom], 425
		mov  rax, 'Ok'
		mov  qword[Message], rax
	     invoke  DrawTextA,[hSetupMemDC],Message,2,rect,DT_CENTER+DT_VCENTER
		mov  [rect.top], 425
		mov  [rect.bottom], 460
		mov  rax, 'Cancel'
		mov  qword[Message], rax
	     invoke  DrawTextA,[hSetupMemDC],Message,6,rect,DT_CENTER+DT_VCENTER

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

align 8
.lookup:
db 0,16*15+08	,BOARD_WPAWN,BOARD_WKNIGHT,BOARD_WBISHOP,BOARD_WROOK,BOARD_WQUEEN,BOARD_WKING
db 16*13+07,'O' ,BOARD_BPAWN,BOARD_BKNIGHT,BOARD_BBISHOP,BOARD_BROOK,BOARD_BQUEEN,BOARD_BKING






