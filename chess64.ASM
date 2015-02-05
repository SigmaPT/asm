
format PE64 GUI 5.0
entry Start

include 'win64axp.inc'
;include 'gui\fDef.inc'
include 'ace\Def.asm'
include 'ace\Structs.asm'
include 'ace\BasicMacros.asm'
include 'ace\AttackMacros.asm'
include 'ace\AvxMacros.asm'

include 'gui\def.inc'

include 'ace\GenMacros.asm'




CPU_HAS_POPCNT	 equ 1	;  popcnt                                (very nice function)
CPU_HAS_AVX1	 equ 0	;  256 bit floating point                (probably only used for memory copy)
CPU_HAS_AVX2	 equ 0	;  256 bit integer + fused multiply add  (probably not used)
CPU_HAS_BMI1	 equ 0	;  andn                                  (why not use it if we can)
CPU_HAS_BMI2	 equ 0	;  pext + pdep                           (nice for move generation, but not much faster than magics)
DEBUG	      equ 0



section '.rdata' data readable writeable

 BoardPos  rb sizeof.PosEx

align 32
 MoveList rb MAX_MOVES*sizeof.EMove


align 8
 StdOut 	 dq ?
 StdIn		 dq ?
 StdError	 dq ?
 hSearchThread	 dq ?
 Frequency	 dq ?
 Time1		 dq ?
 Time2		 dq ?
 CurrentPos	 dq ?


align 32
 DepthMoves  rq 256
   FigMoves  rq 256
 ScoreMoves  rd 256
 SortMoves   rd 256
 AgeMoves    rd 256

align 32
; VisualBoard STATE
 VisualMessage rd 1024

align 32
 DepthArray rd 256*64

 Engine5MaxDepth dd ?


;Output rb 4*1024
Output rb 4*1024


section '.bss' data readable writeable

;;;;;;;;;;;;;;;;;;;;;;;; data for move generation  ;;;;;;;;;;;;;;;;;;;;;;;;;;

align 64
 SlidingAttackMasks  rb 212*1024*4
 BishopAttacksPEXT   rq 64     ; bitboards
 BishopAttacksMOFF   rd 64     ; addresses, only 32 bits needed
 BishopAttacksPDEP   rq 64     ; bitboards
 RookAttacksPEXT     rq 64     ; bitboards
 RookAttacksMOFF     rd 64     ; addresses, only 32 bits needed
 RookAttacksPDEP     rq 64     ; bitboards
match =0, CPU_HAS_BMI2 {
 BishopAttacksIMUL   rq 64
 RookAttacksIMUL     rq 64
 BishopAttacksSHIFT  rb 64
 RookAttacksSHIFT    rb 64
}
 BetweenBB	     rq 64*64
 LineBB 	     rq 64*64
PawnAttacks:
 WhitePawnAttacks    rq 64     ; bitboards
 BlackPawnAttacks    rq 64     ; bitboards
 KnightAttacks	     rq 64     ; bitboards
 KingAttacks	     rq 64     ; bitboards
 FileBB 	     rq 8

 History	rd 16*64
 Followupmoves	rd 16*64
 Countermoves	rd 16*64
 Gains		rd 16*64

;;;;;;;;;;;;;;;;;;;; DoMove data ;;;;;;;;;;;;;;;;;;;;;;;;

align 64
Scores_Pieces:	   rq 16*64
;Zobrist_Pieces:    rq 16*64
;Zobrist_Castling:  rq 16
;Zobrist_Ep:        rq 8
;Zobrist_side:      rq 1
Zobrist_exclusion: rq 1
PieceValue_MG:	  rd 16
PieceValue_EG:	  rd 16
ScoreCaptures_MoveTypeValues rd 8

CastlingMasks:	  rb 64
IsNotPawnMasks:   rb 16
IsNotPieceMasks:  rb 16
IsPawnMasks:	  rb 16



section '.code' code readable executable




Start:
		       push  rbp

		      rdtsc
			mov  dword[RandSeedBook+0],eax
			mov  dword[RandSeedBook+6],edx

		irps i, 1 2 3 4 {
		     movups  xmm0,dqword[ColorPV#i]
		     movups  dqword[Engine#i#_PVColors],xmm0   }

		       call  Init_MoveGen
		       call  Init_PosGui

		       call  CreateChessBoardBitmap

		       call  SetTimeFromInit

		     invoke  GetModuleFileNameA,NULL,INIFileString,1024
			mov  dword[INIFileString+rax-3],'ini'
		     invoke  CreateFileA,INIFileString,GENERIC_READ,0,0,OPEN_EXISTING,0,0
			mov  rsi,rax
		     invoke  ReadFile,rsi,MainWindowRect  ,4*4,Temp,0
		     invoke  ReadFile,rsi,EngineWindowRect,4*4,Temp,0
		     invoke  ReadFile,rsi,KibitzWindowRect,4*4,Temp,0
		     invoke  ReadFile,rsi,StatusWindowRect,4*4,Temp,0
		     invoke  ReadFile,rsi,VisualWindowRect,4*4,Temp,0
		     invoke  ReadFile,rsi,OpenMask	  ,4*4,Temp,0
		     invoke  ReadFile,rsi,MentorWindowRect,4*4,Temp,0
		     invoke  ReadFile,rsi,BoardOffset.x   ,4*2,Temp,0
		     invoke  CloseHandle,rsi


		     invoke  AddFontResource,'graphics\cm9000.ttf'

		     invoke  GetModuleFileNameA,NULL,PersonFileString,1024
			mov  dword[PersonFileString+rax-3],'txt'

		       call  LoadPersonText

		       call  LoadBook

			lea   rcx, [szStartFen]
		       call   SetupBoard
		       call   UpdateHighlightMask


			mov  [Bitmap.x],8*MAIN_SQUARE_SIZE+2*MAIN_BOARD_OFFSET_Y
			mov  [Bitmap.y],8*MAIN_SQUARE_SIZE+2*MAIN_BOARD_OFFSET_Y

	     ;        invoke  LoadImage,NULL,'graphics\human.bmp',IMAGE_BITMAP,0,0,LR_LOADFROMFILE
	     ;           mov  [hBmpWhiteLogo],rax
	     ;        invoke  LoadImage,NULL,'graphics\human.bmp',IMAGE_BITMAP,0,0,LR_LOADFROMFILE
	     ;           mov  [hBmpBlackLogo],rax

		     invoke  CreateSolidBrush,0
			mov  [hGrayBrush],rax

		     invoke  CreateSolidBrush,dword[GuiColor1]
			mov  qword[GuiColor1brush1],rax
		     invoke  CreatePen,PS_SOLID,1,dword[GuiColor2]
			mov  qword[GuiColor2pen1],rax

		     invoke  CreateSolidBrush,dword[GuiColor3]
			mov  qword[GuiColor3brush2],rax
		     invoke  CreatePen,PS_SOLID,1,dword[GuiColor4]
			mov  qword[GuiColor4pen2],rax


		     invoke  GetModuleHandle,0
			mov  [wc.hInstance],rax
			mov  [hInstance],rax
		     invoke  LoadIcon,0,IDI_APPLICATION
			mov  [wc.hIcon],rax
		     invoke  LoadCursor,0,IDC_ARROW
			mov  [wc.hCursor],rax
			mov  rax,[hGrayBrush]
			mov  [wc.hbrBackground],rax

			mov  [wc.lpfnWndProc],MainWindowProc
			mov  [wc.lpszClassName],MainWindowClass
		     invoke  RegisterClass,wc

			mov  [wc.lpfnWndProc],StatusWindowProc
			mov  [wc.lpszClassName],StatusWindowClass
		     invoke  RegisterClass,wc

			mov  [wc.lpfnWndProc],EngineWindowProc
			mov  [wc.lpszClassName],EngineWindowClass
		     invoke  RegisterClass,wc

			mov  [wc.lpfnWndProc],KibitzWindowProc
			mov  [wc.lpszClassName],KibitzWindowClass
		     invoke  RegisterClass,wc

;                        mov  [wc.lpfnWndProc],VisualWindowProc
;                        mov  [wc.lpszClassName],VisualWindowClass
;                     invoke  RegisterClass,wc

;                        mov  [wc.lpfnWndProc],MentorWindowProc
;                        mov  [wc.lpszClassName],MentorWindowClass
;                     invoke  RegisterClass,wc

			mov  [wc.lpfnWndProc],BoardWindowProc
			mov  [wc.lpszClassName],BoardWindowClass
		     invoke  RegisterClass,wc

			lea  rcx,[MainWindowRect]
		       call  FixWindowRect
			lea  rcx,[EngineWindowRect]
		       call  FixWindowRect
			lea  rcx,[KibitzWindowRect]
		       call  FixWindowRect
			lea  rcx,[StatusWindowRect]
		       call  FixWindowRect
;                        lea  rcx,[VisualWindowRect]
;                       call  FixWindowRect
			lea  rcx,[MentorWindowRect]
		       call  FixWindowRect




		     invoke  CreateWindowEx,0,MainWindowClass,'chess gui',WS_VISIBLE+WS_OVERLAPPEDWINDOW+WS_CLIPCHILDREN,\
			 [MainWindowRect.left],[MainWindowRect.top],[MainWindowRect.right],[MainWindowRect.bottom],NULL,NULL,[hInstance],NULL
			mov  qword[hMainWindow],rax


		     invoke  SetTimer,[hMainWindow],IDT_UPDATETIMER,330,NULL


		       call   SetUpGame
		       call   UpdateEngineMove
			mov   rcx, qword [BoardPos+PosEx.move]
			mov   qword [rcx+MoveData.time1], rax

  .MsgLoop:	     invoke  GetMessage,msg,NULL,0,0
			cmp  eax,1
			 jb  .EndLoop
			jne  .MsgLoop
		      rdtsc
			mov  dword[RandSeed+4*0],eax
			mov  dword[RandSeed+4*3],edx
		     invoke  TranslateMessage,msg
		     invoke  DispatchMessage,msg

			jmp  .MsgLoop
  .EndLoop:
		       call  SavePersonText

			lea  rcx,[Engine1]
		       call  Engine_Quit
			lea  rcx,[Engine2]
		       call  Engine_Quit
			lea  rcx,[Engine3]
		       call  Engine_Quit
			lea  rcx,[Engine4]
		       call  Engine_Quit
			lea  rcx,[Engine5]
		       call  Engine_Quit

		     invoke  KillTimer,[hMainWindow],IDT_UPDATETIMER

		     invoke  DeleteObject,[hGrayBrush]
		     invoke  DeleteObject,[hFontMedium]
		     invoke  DeleteObject,[hFontLarge]
		     invoke  DeleteObject,[hBitmap]
		;     invoke  DeleteObject,[hBmpWhiteLogo]
		;     invoke  DeleteObject,[hBmpBlackLogo]

		     invoke  DeleteObject,[GuiColor1brush1]
		     invoke  DeleteObject,[GuiColor2pen1]
		     invoke  DeleteObject,[GuiColor3brush2]
		     invoke  DeleteObject,[GuiColor4pen2]

		     invoke  VirtualFree,[ChessBoardBitmap],0,MEM_RELEASE
		     invoke  VirtualFree,[OpeningBook],0,MEM_RELEASE
		     invoke  VirtualFree,[PersonText],0,MEM_RELEASE

		     invoke  RemoveFontResource,'cm9000.ttf'
		     invoke  Sleep,50

		     invoke  CreateFileA,INIFileString,GENERIC_WRITE,0,0,CREATE_ALWAYS,0,0
			mov  rsi,rax
		     invoke  WriteFile,rsi,MainWindowRect,4*4,Temp,0
		     invoke  WriteFile,rsi,EngineWindowRect,4*4,Temp,0
		     invoke  WriteFile,rsi,KibitzWindowRect,4*4,Temp,0
		     invoke  WriteFile,rsi,StatusWindowRect,4*4,Temp,0
		     invoke  WriteFile,rsi,VisualWindowRect,4*4,Temp,0
		     invoke  WriteFile,rsi,OpenMask,4*4,Temp,0
		     invoke  WriteFile,rsi,MentorWindowRect,4*4,Temp,0
		     invoke  WriteFile,rsi,BoardOffset.x,8,Temp,0
		     invoke  CloseHandle,rsi

		     invoke  ExitProcess,0




proc MainWindowProc hwnd,wmsg,wparam,lparam

			mov  [hwnd],rcx
			mov  [wmsg],rdx
			mov  [wparam],r8
			mov  [lparam],r9

		       push  r15 r14 r13 r12 rdx rbx rdi rsi

			sub  rsp,16*8
irps i, 0 1 2 3 4 5 6 7 {
		     movaps  dqword[rsp+16*i],xmm#i	 }

			cmp  edx,WM_COMMAND
			 je  .wmcommand
			cmp  edx,WM_CREATE
			 je  .wmcreate
		    ;    cmp  edx,WM_PAINT
		    ;     je  .wmpaint
		    ;    cmp  edx,WM_SIZE
		    ;     je  .wmsize
			cmp  edx,WM_KEYDOWN
			 je  .wmkeydown
			cmp  edx,WM_KEYUP
			 je  .wmkeyup
			cmp  edx,WM_RBUTTONDOWN
			 je  .wmrbuttondown
			cmp  edx,WM_DESTROY
			 je  .wm_destroy

			cmp  edx,WM_TIMER
			 je  .wm_time


			cmp  edx,WM_CTLCOLOREDIT
			 je  .wm_ctlcoloredit
			cmp  edx,WM_CTLCOLORBTN
			 je  .wm_ctlcolorbtn

  .defwndproc:	     invoke  DefWindowProc,[hwnd],[wmsg],[wparam],[lparam]
			jmp  .return

  .wm_time:
		       call  UpdateGameStatus
			jmp  .return

  .wm_ctlcoloredit:
		     invoke  SetTextColor,[wparam],0x00FFFFFF
		     invoke  SetBkColor  ,[wparam],0
			mov  eax,dword[hGrayBrush]
			jmp  .return

  .wm_ctlcolorbtn:
			mov  eax,dword[hGrayBrush]
			jmp  .return

  .wmcommand:		mov  eax,r8d

			cmp  r8d,ID_CMD_MAKEMOVE
			 je  .wmcmd_playmove

			shr  eax,16
			and  r8d,0x0FFFF
			cmp  eax, BN_CLICKED
			 je  .wmcmd_bn_clicked

			jmp  .returnz

    .wmcmd_bn_clicked:
			jmp  .returnz

    .wmcmd_playmove:
		       call   MainMakeMove
		     invoke   SendMessage, qword [hBoardWindow], WM_PAINT, 0, 0
			jmp   .returnz


  .wmrbuttondown:	cmp   byte [GameMode], GAMEMODE_NORMAL
			jne   .returnz

		      movsx   esi, word [lparam+2*0]
		      movsx   edi, word [lparam+2*1]
     .wmpopupmenu:	mov  dword[Temp+4*0],esi
			mov  dword[Temp+4*1],edi
		     invoke  GetClientRect,[hwnd],rc
		     invoke  PtInRect,rc,esi,edi
		       test  eax,eax
			 jz  .returnz
		     invoke  ClientToScreen,[hwnd],Temp
		     invoke  LoadMenu,[wc.hInstance],37
			mov  rsi,rax
		     invoke  GetSubMenu,rsi,0
			mov  rdi,rax
		     invoke  TrackPopupMenu,rdi,TPM_LEFTALIGN+TPM_LEFTBUTTON+TPM_RETURNCMD,dword[Temp+4*0],dword[Temp+4*1],0,[hwnd],NULL
			mov  rbx,rax
		     invoke  DestroyMenu,rdi
		     invoke  DestroyMenu,rsi

			cmp  ebx,IDM_FLIP_BOARD
			 je  .cmd_flipboard
			cmp  ebx,IDM_OPTION_PRETTYPV
			 je  .cmd_prettypv


			cmp  ebx,IDM_SETUP_BOARD
			; je  .cmd_resetboard
			 je  .cmd_setupboard
			cmp  ebx,IDM_MANAGE_PERSON
			 je  .cmd_manageperson
			cmp  ebx,IDM_SETUP_GAME
			 je  .cmd_setupgame
			cmp  ebx,IDM_NEW_GAME
			 je  .cmd_newgame
			cmp  ebx,IDM_TAKEBACK
			 je  .cmd_takeback

		    ;    cmp  ebx,IDM_ENDGAME_KBN_K
		    ;     je  .cmd_endgame_kbn_k
		    ;    cmp  ebx,IDM_ENDGAME_KBB_K
		    ;     je  .cmd_endgame_kbb_k
		    ;    cmp  ebx,IDM_ENDGAME_KR_K
		    ;     je  .cmd_endgame_kr_k
		    ;    cmp  ebx,IDM_ENDGAME_KQ_K
		    ;     je  .cmd_endgame_kq_k


			mov  eax,HIGHLIGHT_MODE_NONE
			cmp  ebx,IDM_HIGHLIGHT_MODE_NONE
			 je  .cmd_highlightmode

			mov  eax,HIGHLIGHT_MODE_LEGAL
			cmp  ebx,IDM_HIGHLIGHT_MODE_LEGAL
			 je  .cmd_highlightmode

			mov  eax,HIGHLIGHT_MODE_WHITE_COVERAGE
			cmp  ebx,IDM_HIGHLIGHT_MODE_WHITE_COVERAGE
			 je  .cmd_highlightmode

			mov  eax,HIGHLIGHT_MODE_BLACK_COVERAGE
			cmp  ebx,IDM_HIGHLIGHT_MODE_BLACK_COVERAGE
			 je  .cmd_highlightmode

			mov  eax,HIGHLIGHT_MODE_ATTACKED
			cmp  ebx,IDM_HIGHLIGHT_MODE_ATTACKED
			 je  .cmd_highlightmode

			mov  eax,HIGHLIGHT_MODE_UNGUARDED
			cmp  ebx,IDM_HIGHLIGHT_MODE_UNGUARDED
			 je  .cmd_highlightmode


			jmp  .returnz

  .cmd_highlightmode:
			mov  dword[HighlightMode],eax
		       call  UpdateHighlightMask
		     invoke  SendMessage,[hBoardWindow],WM_PAINT,0,0
			jmp  .returnz


  .cmd_takeback:
;                       call  TakeBackMove
		     invoke  SendMessage,[hBoardWindow],WM_PAINT,0,0
			jmp  .returnz

  .cmd_manageperson:
		     invoke  DialogBoxParamA,[hInstance],ID_ManagePersonDialog,[hMainWindow],ManagePersonDialogProc,0
			jmp  .returnz


  .cmd_flipboard:
			lea   rdi, [Message]
			mov   ax, '0x'
		      stosw
			mov   rcx, qword [BoardPos+Pos.state]
			mov   rcx, qword [rcx+State.key]
			xor   rcx, qword [Zobrist_side]
		       call   PrintAddress
			mov   byte [rdi], 0
		     invoke   MessageBoxA, 0, Message, 'key', MB_OK

			not   byte [BoardFlip]
		     invoke   SendMessage, [hBoardWindow], WM_PAINT, 0, 0
			jmp   .returnz

  .cmd_prettypv:
			not   byte [PrettyPV]
			jmp   .returnz

  .cmd_setupboard:
	     ;          call  StopEngine
	     ;           lea  rcx,[Engine1]
	     ;          call  Engine_Quit
	     ;           lea  rcx,[Engine2]
	     ;          call  Engine_Quit
	     ;        invoke  Sleep,125

	 int3
	     ;           mov  rsi,qword[BoardPosition+POS.STATE_PTR]
	     ;           lea  rdi,[rsi+sizeof.STATE]
	     ;           mov  qword[BoardPosition+POS.STATE_PTR],rdi
	     ;           mov  ecx,sizeof.STATE/8
	     ;     rep movsq



			mov  byte[GameMode],GAMEMODE_SETUP

			jmp  .return


   .cmd_newgame:
		     invoke  DialogBoxParamA,[hInstance],ID_SetupGameDialog,[hMainWindow],SetupGameDialogProc,0
		       test  eax,eax
			 js  .returnz

		    vmovaps   xmm0, dqword [RandSeedBook_Save]
		    vmovaps   xmm1, dqword [RandSeedBook_Save+16]
		       vpor   xmm2, xmm0, xmm1
		      vpxor   xmm3, xmm3, xmm3
		   vpcmpeqb   xmm2, xmm2, xmm3
		  vpmovmskb   eax, xmm2
			cmp   eax, 0x0FFFF
			 je   .seed_new
		    vmovaps   dqword [RandSeedBook_Save], xmm3
		    vmovaps   dqword [RandSeedBook_Save+16], xmm3
		    vmovaps   dqword [RandSeedBook], xmm0
		    vmovaps   dqword [RandSeedBook+16], xmm1
			jmp   .seed_done
	  .seed_new:
		    vmovaps   xmm0, dqword [RandSeedBook]
		    vmovaps   xmm1, dqword [RandSeedBook+16]
		    vmovaps   dqword [RandSeedBook_Save], xmm0
		    vmovaps   dqword [RandSeedBook_Save+16], xmm1
	  .seed_done:
		       call   StopEngines
			lea   rcx, [Engine1]
		       call   Engine_Quit
			lea   rcx, [Engine2]
		       call   Engine_Quit
		     invoke   Sleep, 125

			lea   rcx, [szStartFen]
		       call   SetupBoard
		       call   SetUpGame
		       call   UpdateEngineMove
			mov   rcx, qword [BoardPos+PosEx.move]
			mov   qword [rcx+MoveData.time1], rax

		     invoke   SendMessage, qword [hBoardWindow], WM_PAINT, 0, 0
			jmp   .returnz



   .cmd_setupgame:
		     invoke   DialogBoxParamA,[hInstance],ID_SetupGameDialog,[hMainWindow],SetupGameDialogProc,0
		       test   eax,eax
			 js   .returnz

		       call   StopEngines
			lea   rcx, [Engine1]
		       call   Engine_Quit
			lea   rcx, [Engine2]
		       call   Engine_Quit
		     invoke   Sleep, 125

		       call   SetUpGame
		       call   UpdateEngineMove
			mov   rcx, qword [BoardPos+PosEx.move]
			mov   qword [rcx+MoveData.time1], rax

		     invoke   SendMessage, qword [hBoardWindow], WM_PAINT, 0, 0
			jmp   .returnz


  .cmd_resetboard:
;                       call  StopEngine
;                        lea  rcx,[Engine1]
;                       call  Engine_Quit
;                        lea  rcx,[Engine2]
;                       call  Engine_Quit
;                     invoke  Sleep,250
;                       call  ResetBoard
;
			jmp  .cmd_startsetup

   .cmd_startsetup:
;                       call  SetUpGame
;                        mov  rcx,[hwnd]
;                    ;   call  SizeWindows
;                       call  UpdateEngineMove
		     invoke  SendMessage,[hBoardWindow],WM_PAINT,0,0
			jmp  .returnz

  .wmkeydown:	      movzx  eax,r8l

			cmp  eax,VK_RETURN
			 je  .wmkeydown_enter
			cmp  eax,VK_F1
			 je  .wmkeydown_F1
			cmp  eax,VK_F2
			 je  .wmkeydown_F2
			cmp  eax,VK_F3
			 je  .wmkeydown_F3
			cmp  eax,VK_F4
			 je  .wmkeydown_F4
			cmp  eax,VK_F5
			 je  .wmkeydown_F5
			cmp  eax,'R'
			 je  .keydn_r
			cmp  eax,'Q'
			 je  .keydn_q
			cmp  eax,'K'
			 je  .keydn_k
			cmp  eax,'P'
			 je  .keydn_p
			cmp  eax,'B'
			 je  .keydn_b
			cmp  eax,'N'
			 je  .keydn_n
			cmp  eax,'E'
			 je  .keydn_e
			jmp  .returnz

.keydn_e:		 or  dword[KeyMask], KEY_EP_MASK
			jmp  .returnz
.keydn_r:		 or  dword[KeyMask], KEY_R_MASK
			jmp  .returnz
.keydn_q:		 or  dword[KeyMask], KEY_Q_MASK
			jmp  .returnz
.keydn_k:		 or  dword[KeyMask], KEY_K_MASK
			jmp  .returnz
.keydn_p:		 or  dword[KeyMask], KEY_P_MASK
			jmp  .returnz
.keydn_b:		 or  dword[KeyMask], KEY_B_MASK
			jmp  .returnz
.keydn_n:		 or  dword[KeyMask], KEY_N_MASK
			jmp  .returnz

.wmkeydown_enter:
			cmp  byte[GameMode],GAMEMODE_SETUP
			jne  .returnz

;                        mov  rsi,qword[BoardPosition+POS.STATE_PTR]
;                        lea  rdi,[StateList]
;                        mov  qword[BoardPosition+POS.STATE_PTR],rdi
;                        mov  qword[BoardPosition+POS.ORG_STATE_PTR],rdi
;                        mov  dword[BoardPosition+POS.MOVE_CT],0
;                        mov  dword[BoardPosition+POS.MOVE_LIST_STRING],0
;                        mov  ecx,sizeof.STATE/8
;                  rep movsq
;
;                        lea  rdi,[BoardPosition+POS.START_FEN]
;                        mov  rcx,qword[BoardPosition+POS.STATE_PTR]
;                        xor  edx,edx
;                       call  PrintFen
;
;                        lea  rdx,[BoardPosition+POS.START_FEN]
;                     invoke  MessageBoxA,0,rdx,'fen',MB_OK
;
;                        mov  byte[GameMode],GAMEMODE_NORMAL
;
;                        mov  r15,rbp
;                        lea  rbp,[BoardPosition]
;                       call  UpdateMoveListString
;                        mov  rbp,r15
;
;                       call  SetUpGame
;
;                       call  UpdateEngineMove
;
;                      invoke  SendMessage,[hBoardWindow],WM_PAINT,0,0
			jmp  .returnz


	.wmkeydown_F3:
			cmp  qword[hKibitzWindow],0
			jne  .returnz
		     invoke  CreateWindowEx,0,KibitzWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[KibitzWindowRect.left],[KibitzWindowRect.top],[KibitzWindowRect.right],[KibitzWindowRect.bottom],[hwnd],0,[hInstance],NULL
			mov  qword[hKibitzWindow],rax
			jmp  .returnz
	.wmkeydown_F2:
			cmp  qword[hEngineWindow],0
			jne  .returnz
		     invoke  CreateWindowEx,0,EngineWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[EngineWindowRect.left],[EngineWindowRect.top],[EngineWindowRect.right],[EngineWindowRect.bottom],[hwnd],0,[hInstance],NULL
			mov  qword[hEngineWindow],rax
			jmp  .returnz
	.wmkeydown_F1:
			cmp  qword[hStatusWindow],0
			jne  .returnz
		     invoke  CreateWindowEx,0,StatusWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[StatusWindowRect.left],[StatusWindowRect.top],[StatusWindowRect.right],[StatusWindowRect.bottom],[hwnd],0,[hInstance],NULL
			mov  qword[hStatusWindow],rax
			jmp  .returnz
	.wmkeydown_F4:
;                        cmp  qword[hVisualWindow],0
;                        jne  .returnz
;                     invoke  CreateWindowEx,0,VisualWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[VisualWindowRect.left],[VisualWindowRect.top],[VisualWindowRect.right],[VisualWindowRect.bottom],[hwnd],0,[hInstance],NULL
;                        mov  qword[hVisualWindow],rax
			jmp  .returnz

	.wmkeydown_F5:
;                        cmp  qword[hMentorWindow],0
;                        jne  .returnz
;                     invoke  CreateWindowEx,0,MentorWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[MentorWindowRect.left],[MentorWindowRect.top],[MentorWindowRect.right],[MentorWindowRect.bottom],[hwnd],0,[hInstance],NULL
;                        mov  qword[hMentorWindow],rax
			jmp  .returnz

  .wmkeyup:	      movzx  eax,r8l
			cmp  eax,'R'
			 je  .keyup_r
			cmp  eax,'Q'
			 je  .keyup_q
			cmp  eax,'K'
			 je  .keyup_k
			cmp  eax,'P'
			 je  .keyup_p
			cmp  eax,'B'
			 je  .keyup_b
			cmp  eax,'N'
			 je  .keyup_n
			cmp  eax,'E'
			 je  .keyup_e
			jmp  .returnz

.keyup_e:		and  dword[KeyMask], not KEY_EP_MASK
			jmp  .returnz
.keyup_r:		and  dword[KeyMask], not KEY_R_MASK
			jmp  .returnz
.keyup_q:		and  dword[KeyMask], not KEY_Q_MASK
			jmp  .returnz
.keyup_k:		and  dword[KeyMask], not KEY_K_MASK
			jmp  .returnz
.keyup_p:		and  dword[KeyMask], not KEY_P_MASK
			jmp  .returnz
.keyup_b:		and  dword[KeyMask], not KEY_B_MASK
			jmp  .returnz
.keyup_n:		and  dword[KeyMask], not KEY_N_MASK
			jmp  .returnz


  .wmcreate:
	; create board bitmap
			mov  [bmiheader.biSize],sizeof.BITMAPINFOHEADER
			mov  eax,[Bitmap.x]
			mov  [bmiheader.biWidth],eax
			mov  eax,[Bitmap.y]
			neg  eax
			mov  [bmiheader.biHeight],eax
			mov  [bmiheader.biPlanes],1
			mov  [bmiheader.biBitCount],32
			mov  [bmiheader.biCompression],BI_RGB
			mov  eax,[Bitmap.x]
		       imul  eax,[Bitmap.y]
			lea  eax,[4*rax+16]
			mov  [bmiheader.biSizeImage],eax
			mov  [bmiheader.biXPelsPerMeter],0
			mov  [bmiheader.biYPelsPerMeter],0
			mov  [bmiheader.biClrUsed],0
			mov  [bmiheader.biClrImportant],0
		     invoke  CreateDIBSection,0,bmiheader,DIB_RGB_COLORS,ppvBits,0,0
			mov  [hBitmap],rax

	; create fonts
		       CLEARTYPE_QUALITY = 5

		     invoke  CreateFont,16,0,0,0,FW_DONTCARE,FALSE,FALSE,FALSE,DEFAULT_CHARSET,OUT_OUTLINE_PRECIS,CLIP_DEFAULT_PRECIS,CLEARTYPE_QUALITY,VARIABLE_PITCH,'Chessmaster9000';'Chess Merida''Lucida Console'
			mov  qword[hFontMedium],rax
		     invoke  CreateFont,21,0,0,0,FW_DONTCARE,FALSE,FALSE,FALSE,DEFAULT_CHARSET,OUT_OUTLINE_PRECIS,CLIP_DEFAULT_PRECIS,CLEARTYPE_QUALITY,VARIABLE_PITCH,'Chessmaster9000';'Microsoft Sans Serif';'Chess Merida'
			mov  qword[hFontLarge],rax
		     invoke  CreateFont,18,0,0,0,FW_BOLD,FALSE,FALSE,FALSE,DEFAULT_CHARSET,OUT_OUTLINE_PRECIS,CLIP_DEFAULT_PRECIS,CLEARTYPE_QUALITY,VARIABLE_PITCH,'Microsoft Sans Serif';'Chess Merida'
			mov  qword[hFontTitle],rax
		     invoke  CreateFont,33,0,0,0,FW_DONTCARE,FALSE,FALSE,FALSE,DEFAULT_CHARSET,OUT_OUTLINE_PRECIS,CLIP_DEFAULT_PRECIS,CLEARTYPE_QUALITY,VARIABLE_PITCH,'Chessmaster9000';'Chess Merida'
			mov  qword[hFontHuge],rax
		     invoke  CreateFont,18,0,0,0,FW_DONTCARE,FALSE,FALSE,FALSE,DEFAULT_CHARSET,OUT_OUTLINE_PRECIS,CLIP_DEFAULT_PRECIS,CLEARTYPE_QUALITY,VARIABLE_PITCH,'Webdings';'Chess Merida'
			mov  qword[hFontSymbols],rax
		   ;  invoke  CreateFont,35,0,0,0,FW_DONTCARE,FALSE,FALSE,FALSE,DEFAULT_CHARSET,OUT_OUTLINE_PRECIS,CLIP_DEFAULT_PRECIS,CLEARTYPE_QUALITY,VARIABLE_PITCH,'Chess Merida'
		   ;     mov  qword[hFontMerida],rax


		     invoke  CreateWindowEx,0,BoardWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[BoardOffset.x],[BoardOffset.y],8*MAIN_SQUARE_SIZE+2*MAIN_BOARD_OFFSET_Y,8*MAIN_SQUARE_SIZE+2*MAIN_BOARD_OFFSET_Y,[hwnd],0,[hInstance],NULL
			mov  qword[hBoardWindow],rax

		       test  qword[OpenMask],ENGINE_WND_MASK
			 jz  @f
		     invoke  CreateWindowEx,0,EngineWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[EngineWindowRect.left],[EngineWindowRect.top],[EngineWindowRect.right],[EngineWindowRect.bottom],[hwnd],0,[hInstance],NULL
			mov  qword[hEngineWindow],rax
			@@:

		       test  qword[OpenMask],KIBITZ_WND_MASK
			 jz  @f
		     invoke  CreateWindowEx,0,KibitzWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[KibitzWindowRect.left],[KibitzWindowRect.top],[KibitzWindowRect.right],[KibitzWindowRect.bottom],[hwnd],0,[hInstance],NULL
			mov  qword[hKibitzWindow],rax
			@@:

		       test  qword[OpenMask],STATUS_WND_MASK
			 jz  @f
		     invoke  CreateWindowEx,0,StatusWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[StatusWindowRect.left],[StatusWindowRect.top],[StatusWindowRect.right],[StatusWindowRect.bottom],[hwnd],0,[hInstance],NULL
			mov  qword[hStatusWindow],rax
			 @@:
	      ;
	      ;         test  qword[OpenMask],VISUAL_WND_MASK
	      ;           jz  @f
	      ;       invoke  CreateWindowEx,0,VisualWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[VisualWindowRect.left],[VisualWindowRect.top],[VisualWindowRect.right],[VisualWindowRect.bottom],[hwnd],0,[hInstance],NULL
	      ;          mov  qword[hVisualWindow],rax
	      ;          @@:
	      ;
	      ;         test  qword[OpenMask],MENTOR_WND_MASK
	      ;           jz  @f
	      ;       invoke  CreateWindowEx,0,MentorWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[MentorWindowRect.left],[MentorWindowRect.top],[MentorWindowRect.right],[MentorWindowRect.bottom],[hwnd],0,[hInstance],NULL
	      ;          mov  qword[hMentorWindow],rax
	      ;          @@:

			jmp  .returnz

.wm_destroy:
		     invoke  GetWindowRect,[hMainWindow],MainWindowRect
			mov  eax,[MainWindowRect.left]
			sub  [MainWindowRect.right],eax
			mov  eax,[MainWindowRect.top]
			sub  [MainWindowRect.bottom],eax

		     invoke  PostQuitMessage,0


.returnz:		xor  eax,eax
.return:

irps i, 0 1 2 3 4 5 6 7 {
		     movaps  xmm#i,dqword[rsp+16*i]	 }
			add  rsp,16*8
			pop  rsi rdi rbx rdx r12 r13 r14 r15
			ret
endp



_ErrorBox:
_ExitProcess: int3




include 'ace\Gen_Legal.asm'
include 'ace\Gen_Evasions.asm'
include 'ace\Gen_NonEvasions.asm'
include 'ace\PrintParse.asm'
include 'ace\Position.asm'
include 'ace\SetCheckInfo.asm'
include 'ace\IsMovePseudoLegal.asm'
include 'ace\IsMoveLegal.asm'
include 'ace\AttackersTo.asm'

include 'ace\PieceCoverage.asm'

include 'ace\DoMove_SetFullCi.asm'
include 'ace\UndoMove.asm'

include 'ace\Castling.asm'

include 'ace\Misc.asm'

include 'ace\GivesCheck.asm'

include 'gui\Button.asm'

include 'gui\BoardWindow.inc'
include 'gui\EngineWindow.inc'
include 'gui\KibitzWindow.inc'
include 'gui\StatusWindow.inc'
;include 'gui\VisualWindow.inc'
;include 'gui\MentorWindow.inc'

include 'gui\book.inc'

;include 'gui\fGenerate.inc'
;include 'gui\fMove.inc'
;include 'gui\fPosition.inc'
;include 'gui\fInitialize.inc'

include 'ace\Init_MoveGen.asm'
include 'gui\Init_PosGui.asm'

include 'gui\fUtilities.inc'
;include 'gui\fWindows.inc'
;include 'gui\fParse.inc'
;include 'gui\fPrint.inc'

include 'gui\dialogue.inc'

include 'gui\board.inc'
include 'gui\draw.inc'
include 'gui\print.inc'
include 'gui\handle.inc'
include 'gui\engine.inc'
include 'gui\game.inc'
include 'gui\person.inc'
include 'gui\coach.inc'
include 'gui\kibitzer.inc'

;include 'ace\Windows.asm'



section '.idata' import data readable writeable


 library kernel32,'KERNEL32.DLL',\
	 user32,'USER32.DLL',\
	 psapi,'PSAPI.DLL',\
	 gdi32,'GDI32.DLL',\
	 winmm,'WINMM.DLL'

include 'api\kernel32.inc'
include 'api\user32.inc'
include 'api\gdi32.inc'

  import winmm,\
	 timeBeginPeriod,'timeBeginPeriod',\
	 timeEndPeriod,'timeEndPeriod',\
	 PlaySound,'PlaySoundA',\
	 mciSendCommand,'mciSendCommandA'

 import  psapi,\
	 GetProcessMemoryInfo,'GetProcessMemoryInfo'


section '.data' data readable writeable

WhiteKing:   file 'graphics\wking.dat'
WhiteQueen:  file 'graphics\wqueen.dat'
WhiteKnight: file 'graphics\wknight.dat'
WhiteRook:   file 'graphics\wrook.dat'
WhiteBishop: file 'graphics\wbishop.dat'
WhitePawn:   file 'graphics\wpawn.dat'

BlackKing:   file 'graphics\bking.dat'
BlackQueen:  file 'graphics\bqueen.dat'
BlackKnight: file 'graphics\bknight.dat'
BlackRook:   file 'graphics\brook.dat'
BlackBishop: file 'graphics\bbishop.dat'
BlackPawn:   file 'graphics\bpawn.dat'

LightSquare: ;file 'graphics\ltsquare.dat'
DarkSquare:  ;file 'graphics\dksquare.dat'

Circle:      file 'graphics\cir.dat'

include 'gui\PolygltoKeys.inc'

include 'ace\PSQR.asm'

align 16

const_f4v4_1:	dd 1.0,1.0,1.0,1.0
const_f4v4_1d2: dd 0.5,0.5,0.5,0.5
const_f4v4_128: dd 128.0,128.0,128.0,0.0
const_f4v4_255: dd 255.0,255.0,255.0,0.0
const_f4v4_sign: dd 0x7FFFFFFF,0x7FFFFFFF,0x7FFFFFFF,0x7FFFFFFF
const_Color_Gray: dd 170.0,170.0,170.0,0.75

align 8

const_f8_1: dq 1.0

align 4
const_f4_1: dd 1.0


align 16
 RandSeedBook	dd 0x23498764,0x1F8A58B3,0x12345C78,0x8D654321 ,0x12354234,0x24987643,0x23453345,0x1348765
 RandSeed	dd 0x23498764,0x1F8A58B3,0x12345C78,0x8D654321


align 16
  PieceToBitmapTable:
   dq 0,0,WhitePawn,WhiteKnight,WhiteBishop,WhiteRook,WhiteQueen,WhiteKing
   dq 0,0,BlackPawn,BlackKnight,BlackBishop,BlackRook,BlackQueen,BlackKing

align 16
ColorPV1: dd 000.0,000.0,255.0,0.875
ColorPV2: dd 000.0,000.0,255.0,0.875
ColorPV3: dd 000.0,255.0,128.0,0.875
ColorPV4: dd 000.0,255.0,128.0,0.875

GuiColor1: db 15,15,15,0
GuiColor2: db 55,55,55,0
GuiColor3: db 35,35,35,0
GuiColor4: db 137,125,121,0
GuiColor5: db 190,180,170,0
GuiColor6: db 230,225,220,0
GuiColor7: db 130,125,120,0
GuiColor8: dd 0x000066FF

align 16

Colors:

HighlightColor:   db 150,250,200,0
MouseSquareColor: db 150,200,250,0
PrevMoveColor:	  db 255,255,230,0

DarkColor:    db 150,110,080,0
	      db 145,115,085,0
	      db 155,110,085,0
DarkGrooveColor:
	      db 135,115,090,0
	      db 140,110,095,0
	      db 145,110,105,0



LightColor:   db 220,190,160,0
	      db 210,185,160,0
	      db 215,180,165,0

LightGrooveColor:
	      db 205,195,250,0
	      db 220,250,225,0
	      db 205,190,235,0


OuterGrooveColor:
	      db 105,065,050,0
	      db 100,070,055,0
	      db 105,060,055,0


BorderColor:  db 135,095,040,0
	      db 135,095,040,0
	      db 135,095,040,0


BorderColor2: db 217,191,132, 0
	      db 217,191,132, 0
	      db 217,191,132, 0


				 
				 
				 





MentorMaxLines	 dd 7
Bitmap.x	 dd ?
Bitmap.y	 dd ?
BoardSize.w	 dd ?
BoardSize.h	 dd ?
BoardOffset.x	 dd ?
BoardOffset.y	 dd ?
;AnimationSteps   dd 2

align 8
EngineGrab.x	 dq 3.5
EngineGrab.y	 dq 3.5
EngineGrabSquare db -1,?,?,?,?,?,?,?

Promotion:
.Square dq LightSquare
.X	dd 100
.Y	dd 100

;MoveListWindow_TabStops dd 32,72
;EngineWindow_TabStops dd 25,55,85,95,105,115


InitTimeWTIME  dq 120000
InitTimeBTIME  dq 120000
InitTimeWINC   dq 5000
InitTimeBINC   dq 5000


HighlightMode dd HIGHLIGHT_MODE_LEGAL


  wc WNDCLASS ;0,WindowProc,0,0,NULL,NULL,NULL,COLOR_BTNFACE+1,NULL,MainWindowClass


align 1

  BoardFlip   db 0
  PrettyPV    db -1
  GameMode    db GAMEMODE_NORMAL



  MouseFromSquare db -1
  MouseToSquare   db -1

;CheckWaveFile:    db 'sounds\cork.wav',0
;MateWaveFile:     db 'sounds\draw.wav',0
;WMoveWaveFile:    db 'sounds\wmove.wav',0
;BMoveWaveFile:    db 'sounds\bmove.wav',0
;CastleWaveFile:   db 'sounds\castle.wav',0
;CaptureWaveFile:  db 'sounds\capture.wav',0
;IllegalWaveFile:  db 'sounds\illegal.wav',0


 szStartFen	db 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',0
 PieceToChar	   db '.?PNBRQK??pnbrqk'
 TypeToFigurine:   db 0,0,0,CHAR_KNIGHT,CHAR_BISHOP,CHAR_ROOK,CHAR_QUEEN,CHAR_KING
 ToLowerCase:	  ; use assembler to make table for case conversion
			 db   0
repeat 127
		if (% >= 'A') & ( % <='Z')
			 db   % +('a'-'A')
		else
			 db   %
		end if
end repeat


  szCmdUCI	    db 'uci',0
  szCmdMultiPV	    db 'setoption name MultiPV value ',0
 ; szCmdOptions      db 'setoption name Threads value 4',10,'setoption name Hash value 256',0,'setoption name MultiPV value 1',0
;  szCmdPosition     db 'position fen ',0
;  szCmdMoves        db ' moves',0
;  szCmdPosition     db 'position startpos moves ',0
;  szCmdStartPos     db 'position startpos',0
  szCmdGo	    db 'go infinite',0
  szCmdThink	    db 'go wtime 500 winc 1000 btime 500 binc 1000                           ',10,0
  szCmdStop	    db 'stop',0
  szCmdQuit	    db 'quit',0

  Piece:   dw 0,0,0,CHAR_KNIGHT,CHAR_BISHOP,CHAR_ROOK,CHAR_QUEEN,CHAR_KING


  szKibits	    db 'kibitzer:',0
  szWhiteC	    db 'white:',0
  szBlackC	    db 'black:',0
  szIllegalMove     db 'illegal move:',13,10,0
  szLoadPersonality db 'Load Personality',0

  szType_bestmove	 db 'bestmove',0
  szType_ponder 	 db 'ponder',0
  szType_currmove	 db 'currmove',0
  szType_currmovenumber  db 'currmovenumber',0
  szType_currline	 db 'currline',0
  szType_refutation	 db 'refutation',0
  szType_nps		 db 'nps',0
  szType_hashfull	 db 'hashfull',0
  szType_tbhits 	 db 'tbhits',0
  szType_cpuload	 db 'cpuload',0
  szType_string 	 db 'string',0
  szType_multipv	 db 'multipv',0
  szType_time		 db 'time',0
  szType_depth		 db 'depth',0
  szType_seldepth	 db 'seldepth',0
  szType_score		 db 'score',0
  szType_nodes		 db 'nodes',0
  szType_pv		 db 'pv',0
  szTIME	  db 'Time',0
  szDEPTH	  db 'Depth',0
  szSCORE	  db 'Score',0
  szNODES	  db 'Nodes',0
  szMOVES	  db 'Moves',0
;  MainWindowTitle db 'FASM CHESS GUI', 0
  MainWindowClass   db 'chess64', 0
  BoardWindowClass  db 'chess64 board',0
  StatusWindowClass db 'chess64 status',0
  EngineWindowClass db 'chess64 engine',0
  KibitzWindowClass db 'chess64 kibitz',0
  VisualWindowClass db 'chess64 visual',0
  MentorWindowClass db 'chess64 mentor',0


;  _edit TCHAR  'EDIT',0
;  _redit TCHAR  'RICHEDIT50W',0

 PersonFileString rb 1024
 INIFileString	  rb 1024


align 16
  RandSeedBook_Save dq ?,?,?,?

align 8
  GrabbedPiece	  dq ?
  HighlightMask   dq ?
  Time_TIME:
    TimeWTIME	  dq ?
    TimeBTIME	  dq ?
  Time_INC:
    TimeWINC	  dq ?
    TimeBINC	  dq ?

    TimeWMOVES	  dq ?
    TimeBMOVES	  dq ?

align 4
  CurrentPerson   dd ?
  CurrentPersonW  dd ?
  CurrentPersonB  dd ?

  Mouse.x	  dd ?
  Mouse.y	  dd ?
  MouseDiff.x	  dd ?
  MouseDiff.y	  dd ?
  WhiteCompQ	  db ?
  BlackCompQ	  db ?




align 8
  Cursor	  dq ?
  hMainWindow	  dq ?

  hBoardWindow	 dq ?
  hBoardBitmap	 dq ?
  hBoardMemDC	 dq ?

  hStatusWindow   dq ?
  hStatusBitmap   dq ?
  hStatusMemDC	  dq ?

  hEngineWindow   dq ?
  hEngineBitmap   dq ?
  hEngineMemDC	  dq ?

  hKibitzWindow   dq ?
  hKibitzBitmap   dq ?
  hKibitzMemDC	  dq ?

  hMentorWindow   dq ?
  hMentorBitmap   dq ?
  hMentorMemDC	  dq ?

  OpenMask	  dq ?

  GuiColor1brush1 dq ?
  GuiColor2pen1   dq ?
  GuiColor3brush2 dq ?
  GuiColor4pen2   dq ?

Engine1yOffset dd ?
Engine2yOffset dd ?
Engine3yOffset dd ?
Engine4yOffset dd ?


  hFontMedium	  dq ?
  hFontLarge	  dq ?
  hFontHuge	  dq ?
  hFontTitle	  dq ?
  hFontMerida	  dq ?
  hFontSymbols	  dq ?

  hGrayBrush	  dq ?
  Temp		  dq ?
  hMainMenu	  dq ?
  hInstance	  dq ?
  ppvBits	  dq ?
  hMemDC	  dq ?
  hdc		  dq ?
  hBitmap	  dq ?
;  hBmpWhiteLogo   dq ?
;  hBmpBlackLogo   dq ?


ChessBoardBitmap   dq ?

  BookMove	  dq ?
  OpeningBook	   dq ?
  OpeningBookSizeB dq ?

  TickCount	  dq ?
  temp		  dq ?
  PersonText	  dq ?
  PersonTextSizeB dq ?



align 8
  bmiheader	BITMAPINFOHEADER
  ps		PAINTSTRUCT
  rc		RECT
  rect		RECT
  pt		POINT
  msg		MSG
  MainWindowRect    RECT
  EngineWindowRect  RECT
  KibitzWindowRect  RECT
  StatusWindowRect  RECT
  VisualWindowRect  RECT
  MentorWindowRect  RECT


align 4

  KeyMask    dd ?





align 32

irps i, 1 2 3 4 5 {
Engine#i:
Engine#i#_UpdateTextQ	db ?
Engine#i#_GoingQ	db ?
Engine#i#_UploadQ	db ?
Engine#i#_ThinkingQ	db ?
Engine#i#_KibitzPVCount dd ?
Engine#i#_BookMove	dq ?
Engine#i#_TotalNodes	dq ?
Engine#i#_InputCursor	dq ?
Engine#i#_PVColors	dd ?,?,?,?
Engine#i#_InputBuffer	rb ENGINE_WRITE_BUFFER_SIZE
Engine#i#_OutputBuffer	rb ENGINE_READ_BUFFER_SIZE
Engine#i#_Name		rb 512
Engine#i#_String	rb 512
Engine#i#_MemoryUsage	rb 64
Engine#i#_SA   SECURITY_ATTRIBUTES
Engine#i#_PI   PROCESS_INFORMATION
Engine#i#_SI   STARTUPINFO
Engine#i#_Out_Read   dq ?
Engine#i#_Out_Write  dq ?
Engine#i#_In_Read    dq ?
Engine#i#_In_Write   dq ?
Engine#i#_Bread    dd ?
Engine#i#_Avail    dd ?
Engine#i#_Exit	   dd ?
Engine#i#_On	dd ?
Engine#i#_X	dd ?
Engine#i#_Y	dd ?
Engine#i#_readTick dq ?
Engine#i#_moveData rb sizeof.MoveData
Engine#i#_PV	rq ENGINE_PV_COUNT
Engine#i#_:
Engine#i#_currmove	   rb 2*16
Engine#i#_currmovenumber   rb 2*16
Engine#i#_currline	   rb 2*16
Engine#i#_refutation	   rb 2*64
Engine#i#_nps		   rb 2*64
Engine#i#_hashfull	   rb 2*32
Engine#i#_tbhits	   rb 2*32
Engine#i#_cpuload	   rb 2*16
Engine#i#_string	   rb 2*64
Engine#i#_multipv	   rb 2*16
Engine#i#_time		   rb 2*16
Engine#i#_depth 	   rb 2*16
Engine#i#_seldepth	   rb 2*16
Engine#i#_score 	   rb 2*32
Engine#i#_nodes 	   rb 2*32
Engine#i#_pv		   rb 4*256
Engine#i#_bestmove	   rb 2*16
Engine#i#_ponder	   rb 2*16
Engine#i#_ENDER:	   rb 1024
Engine#i#__:
Engine#i#__bestmove	   rb 2*16
Engine#i#__ponder	   rb 2*16
Engine#i#__currmove	   rb 2*16
Engine#i#__currmovenumber  rb 2*16
Engine#i#__currline	   rb 2*16
Engine#i#__refutation	   rb 2*64
Engine#i#__nps		   rb 2*64
Engine#i#__score	   rb 2*8
Engine#i#__nodes	   rb 2*32
Engine#i#__hashfull	   rb 2*32
Engine#i#__tbhits	   rb 2*32
Engine#i#__cpuload	   rb 2*16
Engine#i#__string	   rb 2*64
Engine#i#__ENDER:	   rb 1024
Engine#i#_Lines 	   rb ENGINE_LINE_COUNT*sizeof.ENGINE_LINE

align 32
Engine#i#_BoardPos	   rb sizeof.PosEx
align 32
Engine#i#_StateList	   rb 32*sizeof.State

Engine#i#_Message	   rb ENGINE_LINE_COUNT*sizeof.ENGINE_LINE


		 }









Message 	   rb ENGINE_READ_BUFFER_SIZE
MessageASDF	       rb ENGINE_READ_BUFFER_SIZE



section '.rsrc' resource data readable writable

  directory RT_MENU,menus,\
	    RT_DIALOG,dialogs

  resource menus,\
	   37,LANG_ENGLISH+SUBLANG_DEFAULT,main_menu
  resource dialogs,\
	     ID_LoadPersonDialog,   LANG_ENGLISH+SUBLANG_DEFAULT,   _LoadPersonDialog,\
	     ID_SetupGameDialog,    LANG_ENGLISH+SUBLANG_DEFAULT,   _SetupGameDialog,\
	     ID_ManagePersonDialog, LANG_ENGLISH+SUBLANG_DEFAULT,   _ManagePersonDialog


  menu main_menu

menuitem 'popup',0,MFR_POPUP+MFR_END
     ;  menuitem 'take back',IDM_TAKEBACK
       menuitem 'flip board',IDM_FLIP_BOARD
       menuitem 'setup board',IDM_SETUP_BOARD
       menuitem 'personalities...',IDM_MANAGE_PERSON
     ;  menuitem 'load kibitzer...',IDM_LOAD_KIBITZER
     ;  menuitem 'load super kibitzer',IDM_LOAD_SUPERKIBITZER
     ;  menuitem 'close super kibitzer',IDM_CLOSE_KIBITZER
       menuitem 'setup game...',IDM_SETUP_GAME
       menuitem 'new game...',IDM_NEW_GAME
       menuitem 'endgames...',0,MFR_POPUP
		menuitem 'KQvK',IDM_ENDGAME_KQ_K
		menuitem 'KRvK',IDM_ENDGAME_KR_K
		menuitem 'KBBvK',IDM_ENDGAME_KBB_K
		menuitem 'KBNvK',IDM_ENDGAME_KBN_K,MFR_END
       menuitem 'options...',0,MFR_POPUP
		menuitem 'toggle pretty pv',IDM_OPTION_PRETTYPV,MFR_END
       menuitem 'highlights...',0,MFR_POPUP+MFR_END
		menuitem 'none',IDM_HIGHLIGHT_MODE_NONE
		menuitem 'legal moves for piece',IDM_HIGHLIGHT_MODE_LEGAL
		menuitem 'white coverage',IDM_HIGHLIGHT_MODE_WHITE_COVERAGE
		menuitem 'black coverage',IDM_HIGHLIGHT_MODE_BLACK_COVERAGE
		menuitem 'attacked pieces',IDM_HIGHLIGHT_MODE_ATTACKED
		menuitem 'unguarded pieces',IDM_HIGHLIGHT_MODE_UNGUARDED,MFR_END



 dialog _LoadPersonDialog,'load personality',50,50,500,50,WS_CAPTION+WS_POPUP+WS_SYSMENU+DS_MODALFRAME
  dialogitem 'combobox','',ID_LoadPersonDialog_PERSON,10,10,180,80,WS_VISIBLE+WS_VSCROLL+CBS_DROPDOWNLIST
  dialogitem 'BUTTON' ,'&Ok'	      ,ID_LoadPersonDialog_OK	     ,15  ,30 ,40  ,15	 ,WS_VISIBLE+WS_TABSTOP+BS_DEFPUSHBUTTON
  dialogitem 'BUTTON' ,'Cancel'       ,ID_LoadPersonDialog_CANCEL    ,60  ,30 ,40  ,15	 ,WS_VISIBLE+WS_TABSTOP
 enddialog

SS_EDITCONTROL = 0x2000

 dialog _SetupGameDialog,'setup game',50,50,400,300,WS_CAPTION+WS_POPUP+WS_SYSMENU+DS_MODALFRAME

  dialogitem 'BUTTON' ,'white player',-1			   ,005 , 5   ,190  ,260 ,BS_GROUPBOX+WS_VISIBLE,0
  dialogitem 'EDIT'   ,''	     ,ID_SetupGameDialog_WTIME	   ,040 , 17  ,50   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
  dialogitem 'EDIT'   ,''	     ,ID_SetupGameDialog_WINC	   ,040 , 30  ,50   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
 ; dialogitem 'EDIT'   ,''            ,ID_SetupGameDialog_WMOVES    ,040 , 43  ,50   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
  dialogitem 'STATIC' ,'time',-1				   ,010 , 19  ,30   ,12  ,WS_VISIBLE+SS_EDITCONTROL
  dialogitem 'STATIC' ,'inc',-1 				   ,010 , 32  ,30   ,12  ,WS_VISIBLE+SS_EDITCONTROL
 ; dialogitem 'STATIC' ,'moves',-1                                  ,010 , 45  ,30   ,12  ,WS_VISIBLE+SS_EDITCONTROL
  dialogitem 'LISTBOX','',ID_SetupGameDialog_WHITEPERSONLIST	   ,010 , 50  ,180  ,140 ,WS_VISIBLE+WS_VSCROLL+WS_TABSTOP+WS_BORDER+LBS_NOTIFY
  dialogitem 'STATIC' ,'',ID_SetupGameDialog_WHITEPERSONDESC	   ,010 , 180 ,180  ,50  ,WS_VISIBLE+SS_EDITCONTROL

  dialogitem 'BUTTON' ,'black player',-1			   ,205 , 5   ,190  ,260 ,BS_GROUPBOX+WS_VISIBLE,0
  dialogitem 'EDIT'   ,''	     ,ID_SetupGameDialog_BTIME	   ,240 , 17  ,50   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
  dialogitem 'EDIT'   ,''	     ,ID_SetupGameDialog_BINC	   ,240 , 30  ,50   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
 ; dialogitem 'EDIT'   ,''            ,ID_SetupGameDialog_BMOVES    ,240 , 43  ,50   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
  dialogitem 'STATIC' ,'time',-1				   ,210 , 19  ,30   ,12  ,WS_VISIBLE+SS_EDITCONTROL
  dialogitem 'STATIC' ,'inc',-1 				   ,210 , 32  ,30   ,12  ,WS_VISIBLE+SS_EDITCONTROL
 ; dialogitem 'STATIC' ,'moves',-1                                  ,210 , 45  ,30   ,12  ,WS_VISIBLE+SS_EDITCONTROL
  dialogitem 'LISTBOX','',ID_SetupGameDialog_BLACKPERSONLIST	   ,210 , 50  ,180  ,140 ,WS_VISIBLE+WS_VSCROLL+WS_TABSTOP+WS_BORDER+LBS_NOTIFY
  dialogitem 'STATIC' ,'',ID_SetupGameDialog_BLACKPERSONDESC	   ,210 , 180 ,180  ,50  ,WS_VISIBLE+SS_EDITCONTROL

  dialogitem 'BUTTON' ,'&Ok'	      ,ID_SetupGameDialog_OK	   ,15	,280 ,40  ,15	,WS_VISIBLE+WS_TABSTOP+BS_DEFPUSHBUTTON
  dialogitem 'BUTTON' ,'Cancel'       ,ID_SetupGameDialog_CANCEL   ,60	,280 ,40  ,15	,WS_VISIBLE+WS_TABSTOP


;  dialogitem 'BUTTON' ,'position',-1                               ,405 , 5   ,210  ,260 ,BS_GROUPBOX+WS_VISIBLE,0
;
;  dialogitem 'BUTTON' ,'reset'        ,ID_SetupGameDialog_RESET    ,420  ,20 ,30  ,15   ,WS_VISIBLE+WS_TABSTOP
;  dialogitem 'BUTTON' ,'clear'        ,ID_SetupGameDialog_CLEAR    ,460  ,20 ,30  ,15   ,WS_VISIBLE+WS_TABSTOP
;
;
;  dialogitem 'STATIC' ,'side',-1                                   ,410 , 230  ,30   ,12  ,WS_VISIBLE+SS_EDITCONTROL
;  dialogitem 'EDIT'   ,''            ,ID_SetupGameDialog_SIDE      ,410 , 240  ,25   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
;  dialogitem 'STATIC' ,'castling',-1                               ,460 , 230  ,30   ,12  ,WS_VISIBLE+SS_EDITCONTROL
;  dialogitem 'EDIT'   ,''            ,ID_SetupGameDialog_CASTLING  ,460 , 240  ,25   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
;  dialogitem 'STATIC' ,'ep square',-1                              ,510 , 230  ,35   ,12  ,WS_VISIBLE+SS_EDITCONTROL
;  dialogitem 'EDIT'   ,''            ,ID_SetupGameDialog_EPSQUARE  ,510 , 240  ,25   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
;  dialogitem 'STATIC' ,'50 moves',-1                               ,560 , 230  ,35   ,12  ,WS_VISIBLE+SS_EDITCONTROL
;  dialogitem 'EDIT'   ,''            ,ID_SetupGameDialog_50MOVES   ,560 , 240  ,30   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
;
;
;irps j, 0 1 2 3 4 5 6 7 {
;irps i, 0 1 2 3 4 5 6 7 \{
;  dialogitem 'EDIT'   ,''   , ID_SetupGameDialog_SQUARES+i+8*j, 410+25*i, 40+23*j, 24, 22, WS_VISIBLE+ES_AUTOHSCROLL+WS_TABSTOP
;\}
;}

 enddialog

 dialog _ManagePersonDialog,'edit personalities',50,50,300,200,WS_CAPTION+WS_POPUP+WS_SYSMENU+DS_MODALFRAME
  dialogitem 'EDIT'   ,''	      ,ID_ManageGameDialog_LIST 	    ,3 ,3  ,300-6   ,200-30  ,WS_VISIBLE+WS_VSCROLL+WS_BORDER+ES_AUTOHSCROLL+ES_WANTRETURN+ES_MULTILINE ;+WS_TABSTOP
  dialogitem 'BUTTON' ,'&Ok'	      ,ID_SetupGameDialog_OK	    ,15  ,200-20 ,40  ,15   ,WS_VISIBLE+WS_TABSTOP+BS_DEFPUSHBUTTON
  dialogitem 'BUTTON' ,'Cancel'       ,ID_SetupGameDialog_CANCEL    ,60  ,200-20 ,40  ,15   ,WS_VISIBLE+WS_TABSTOP
 enddialog

