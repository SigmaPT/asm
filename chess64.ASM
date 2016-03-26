

format PE64 GUI 5.0
entry Start

include 'win64axp.inc'
include 'ace\Def.asm'
include 'ace\Structs.asm'
include 'ace\BasicMacros.asm'
include 'ace\AttackMacros.asm'
include 'ace\AvxMacros.asm'

include 'gui\def.inc'

include 'ace\GenMacros.asm'


CPU_HAS_POPCNT equ 1  ; popcnt                  (very nice function)
CPU_HAS_AVX1   equ 1  ; 256 bit floating point  (probably only used for memory copy)
CPU_HAS_AVX2   equ 0  ; 256 bit integer + fma   (probably not used)
CPU_HAS_BMI1   equ 0  ; andn                    (why not use it if we can)
CPU_HAS_BMI2   equ 0  ; pext + pdep             (nice for move generation, but not much faster than magics)
DEBUG	       equ 0



section '.rdata' data readable writeable

 BoardPos  rb sizeof.PosEx

rb 16

align 16
 StateArray	 rb MAX_MOVES_PER_GAME*sizeof.State
 MoveDataArray	 rb MAX_MOVES_PER_GAME*sizeof.MoveData
 MoveStringArray rb MAX_MOVES_PER_GAME*8


align 16
LogLines:
 rb MAX_LOG_LINES*LOG_LINE_LENGTH


align 8
 StdOut 	 dq ?
 StdIn		 dq ?
 StdError	 dq ?
 hSearchThread	 dq ?
 Frequency	 dq ?
 Time1		 dq ?
 Time2		 dq ?
 CurrentPos	 dq ?

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
	       call  Init_MoveGen
	       call  Init_PosGui

		mov  qword[Tour.Time], 120000
		mov  qword[Tour.Inc], 2000
		mov  qword[Tour.PlayerCount], 2
		mov  qword[Tour.PlayerWidth], 2
	       call  Game_SetTimeFromInit
	      rdtsc
		mov  dword[RandSeed+4*0],eax
		mov  dword[RandSeed+4*3],edx



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


	     invoke  CreateFileA,'graphics\1board.dat',GENERIC_READ,0,0,OPEN_EXISTING,0,0
		mov  rsi,rax
	     invoke  ReadFile,rsi,BmpChessBoard,4*800*800,Temp,0
	     invoke  CloseHandle,rsi

	     invoke  CreateFileA,'graphics\1king.dat',GENERIC_READ,0,0,OPEN_EXISTING,0,0
		mov  rsi,rax
	     invoke  ReadFile,rsi,BmpKing,4*72*72,Temp,0
	     invoke  CloseHandle,rsi

	     invoke  CreateFileA,'graphics\1queen.dat',GENERIC_READ,0,0,OPEN_EXISTING,0,0
		mov  rsi,rax
	     invoke  ReadFile,rsi,BmpQueen,4*72*72,Temp,0
	     invoke  CloseHandle,rsi

	     invoke  CreateFileA,'graphics\1rook.dat',GENERIC_READ,0,0,OPEN_EXISTING,0,0
		mov  rsi,rax
	     invoke  ReadFile,rsi,BmpRook,4*72*72,Temp,0
	     invoke  CloseHandle,rsi

	     invoke  CreateFileA,'graphics\1bishop.dat',GENERIC_READ,0,0,OPEN_EXISTING,0,0
		mov  rsi,rax
	     invoke  ReadFile,rsi,BmpBishop,4*72*72,Temp,0
	     invoke  CloseHandle,rsi

	     invoke  CreateFileA,'graphics\1knight.dat',GENERIC_READ,0,0,OPEN_EXISTING,0,0
		mov  rsi,rax
	     invoke  ReadFile,rsi,BmpKnight,4*72*72,Temp,0
	     invoke  CloseHandle,rsi

	     invoke  CreateFileA,'graphics\1pawn.dat',GENERIC_READ,0,0,OPEN_EXISTING,0,0
		mov  rsi,rax
	     invoke  ReadFile,rsi,BmpPawn,4*72*72,Temp,0
	     invoke  CloseHandle,rsi

	     invoke  CreateFileA,'graphics\1cir.dat',GENERIC_READ,0,0,OPEN_EXISTING,0,0
		mov  rsi,rax
	     invoke  ReadFile,rsi,BmpCircle,4*72*72,Temp,0
	     invoke  CloseHandle,rsi

	     invoke  AddFontResource,'graphics\cm9000.ttf'

	     invoke  GetModuleFileNameA,NULL,PersonFileString,1024
		mov  dword[PersonFileString+rax-3],'txt'

	       call  LoadPersonText

	    stdcall  LoadBook,'books\performance.bin'

		lea  rcx, [szStartFen]
	       call  SetupBoard
	       call  UpdateHighlightMask
	       call  CreateBoardBitmap

	     invoke  CreateSolidBrush,0
		mov  [hGrayBrush],rax

	     invoke  CreatePen,PS_SOLID,1,dword[GuiColor1]
		mov  qword[GuiColor1pen],rax
	     invoke  CreateSolidBrush,dword[GuiColor1]
		mov  qword[GuiColor1brush],rax
	     invoke  CreatePen,PS_SOLID,1,dword[GuiColor2]
		mov  qword[GuiColor2pen],rax

	     invoke  CreateSolidBrush,dword[GuiColor3]
		mov  qword[GuiColor3brush],rax
	     invoke  CreatePen,PS_SOLID,1,dword[GuiColor4]
		mov  qword[GuiColor4pen],rax
	     invoke  CreatePen,PS_SOLID,1,dword[GuiColor6]
		mov  qword[GuiColor6pen],rax
	     invoke  CreatePen,PS_SOLID,1,dword[GuiColor7]
		mov  qword[GuiColor7pen],rax
	     invoke  CreateSolidBrush,dword[GuiColor10]
		mov  qword[GuiColor10brush],rax
	     invoke  CreateSolidBrush,dword[GuiColor11]
		mov  qword[GuiColor11brush],rax

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
		mov  [wc.lpfnWndProc],SetupWindowProc
		mov  [wc.lpszClassName],SetupWindowClass
	     invoke  RegisterClass,wc
		mov  [wc.lpfnWndProc],BoardWindowProc
		mov  [wc.lpszClassName],BoardWindowClass
	     invoke  RegisterClass,wc

		lea  rcx,[MainWindowRect]
	       call  FixWindowRect
		lea  rcx,[EngineWindowRect]
	       call  FixWindowRect
		lea  rcx,[StatusWindowRect]
	       call  FixWindowRect

	     invoke  LoadMenu,[hInstance],37
		mov  rsi, rax
	     invoke  CreateWindowEx,0,MainWindowClass,'chess gui',WS_VISIBLE+WS_OVERLAPPEDWINDOW+WS_CLIPCHILDREN,\
			 [MainWindowRect.left],[MainWindowRect.top],[MainWindowRect.right],[MainWindowRect.bottom],\
			 NULL,rsi,[hInstance],NULL
		mov  qword[hMainWindow], rax
	     invoke  SetTimer,[hMainWindow],IDT_UPDATETIMER,240,NULL

		xor  ecx, ecx
		xor  r8, r8
		xor  edx, edx
		xor  r9, r9
		lea  r10, [szStartFen]
		lea  r11, [RandSeed]
	       call  Game_StartNewGame

	     invoke  SendMessage, qword[hBoardWindow], WM_PAINT, 0, 0

.MsgLoop:
	     invoke  GetMessage,msg,NULL,0,0
		cmp  eax,1
		 jb  .EndLoop
		jne  .MsgLoop
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

	     invoke  DeleteObject,[GuiColor1pen]
	     invoke  DeleteObject,[GuiColor6pen]
	     invoke  DeleteObject,[GuiColor7pen]
	     invoke  DeleteObject,[GuiColor1brush]
	     invoke  DeleteObject,[GuiColor2pen]
	     invoke  DeleteObject,[GuiColor3brush]
	     invoke  DeleteObject,[GuiColor4pen]
	     invoke  DeleteObject,[GuiColor10brush]
	     invoke  DeleteObject,[GuiColor11brush]

	     invoke  VirtualFree,[OpeningBook],0,MEM_RELEASE
	     invoke  VirtualFree,[PersonText],0,MEM_RELEASE
	     invoke  RemoveFontResource,'graphics\cm9000.ttf'
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

		cmp  edx, WM_COMMAND
		 je  .wmcommand
		cmp  edx, WM_CREATE
		 je  .wmcreate
		cmp  edx, WM_DESTROY
		 je  .wm_destroy
		cmp  edx, WM_TIMER
		 je  .wm_time
.defwndproc:
	     invoke  DefWindowProc,[hwnd],[wmsg],[wparam],[lparam]
		jmp  .return
.wm_time:
		cmp  byte[DrawQ_Board], 0
		 je  @f
	     invoke  SendMessage, qword[hBoardWindow], WM_PAINT, 0, 0
		mov  byte[DrawQ_Board], 0
		@@:
		cmp  byte[DrawQ_Engine], 0
		 je  @f
	     invoke  SendMessage, qword[hEngineWindow], WM_COMMAND, 0, 0
		mov  byte[DrawQ_Engine], 0
		@@:

	     invoke  SendMessage, qword[hStatusWindow], WM_COMMAND, 0, 0
		mov  eax, dword[Tour.GoingQ]
	      movzx  ecx, byte[BoardPos+PosEx.result]
	       test  eax, eax
		 jz  .returnz
	       test  ecx, ecx
		 jz  .returnz

		and  ecx, 3
	       call  UpdateTournamentStats
	     invoke  SendMessage, qword[hBoardWindow], WM_PAINT, 0, 0

	       call  StartTourGame
		jmp  .returnz
.wmcommand:
	      movzx  eax, r8w

		cmp  r8d, IDM_ARRANGE_WINDOWS
		 je  .cmd_arrange

		cmp  r8d, ID_CMD_MAKEMOVE
		 je  .cmd_playmove

		cmp  r8d, IDM_SETUP_BOARD
		 je  .cmd_setupboard
		cmp  r8w, IDM_FLIP_BOARD
		 je  .cmd_flipboard
		cmp  r8w, IDM_TAKEBACK
		 je  .cmd_takeback
		cmp  r8w, IDM_TAKEBACK2
		 je  .cmd_takeback2

		cmp  r8w, IDM_TOGGLE_STATUS
		 je  .cmd_toggle_status
		cmp  r8w, IDM_TOGGLE_ENGINE
		 je  .cmd_toggle_engine

		cmp  r8w, IDM_NEW_GAME
		 je  .cmd_newgame
		cmp  r8w, IDM_SETUP_TOURNAMENT
		 je  .cmd_setuptournament
		cmp  r8w, IDM_SETUP_GAME
		 je  .cmd_setupgame
		cmp  r8w, IDM_MANAGE_PERSON
		 je  .cmd_manageperson

		mov  eax, HIGHLIGHT_MODE_NONE
		cmp  r8w, IDM_HIGHLIGHT_MODE_NONE
		 je  .cmd_highlightmode
		mov  eax, HIGHLIGHT_MODE_LEGAL
		cmp  r8w, IDM_HIGHLIGHT_MODE_LEGAL
		 je  .cmd_highlightmode
		mov  eax, HIGHLIGHT_MODE_WHITE_COVERAGE
		cmp  r8w, IDM_HIGHLIGHT_MODE_WHITE_COVERAGE
		 je  .cmd_highlightmode
		mov  eax, HIGHLIGHT_MODE_BLACK_COVERAGE
		cmp  r8w, IDM_HIGHLIGHT_MODE_BLACK_COVERAGE
		 je  .cmd_highlightmode
		mov  eax, HIGHLIGHT_MODE_ATTACKED
		cmp  r8w, IDM_HIGHLIGHT_MODE_ATTACKED
		 je  .cmd_highlightmode
		mov  eax, HIGHLIGHT_MODE_UNGUARDED
		cmp  r8w, IDM_HIGHLIGHT_MODE_UNGUARDED
		 je  .cmd_highlightmode

		shr  eax, 16
		and  r8d, 0x0FFFF
		cmp  eax, BN_CLICKED
		 je  .cmd_bn_clicked
		jmp  .returnz
.cmd_bn_clicked:
		jmp  .returnz
.cmd_playmove:
	       call  MainMakeMove
		jmp  .returnz
.cmd_takeback:
	       call  TakeBackMove
	     invoke  SendMessage,[hBoardWindow],WM_PAINT,0,0
		jmp  .returnz
.cmd_takeback2:
	       call  TakeBackMove2
	     invoke  SendMessage,[hBoardWindow],WM_PAINT,0,0
		jmp  .returnz
.cmd_manageperson:
	     invoke  DialogBoxParamA,[hInstance],ID_ManagePersonDialog,[hMainWindow],ManagePersonDialogProc,0
		jmp  .returnz
.cmd_flipboard:
		not  byte[BoardFlip]
	     invoke  SendMessage, qword[hBoardWindow], WM_PAINT, 0, 0
		jmp  .returnz
.cmd_highlightmode:
		mov  dword[HighlightMode], eax
	       call  UpdateHighlightMask
	     invoke  SendMessage, qword[hBoardWindow], WM_PAINT, 0, 0
		jmp  .returnz
.cmd_newgame:
		mov  byte[NewGameWindowMode], 0
	     invoke  DialogBoxParamA,[hInstance],ID_SetupGameDialog,[hMainWindow],SetupGameDialogProc,0
	       test  eax, eax
		 jz  .returnz
		mov  rcx,qword[SetupWPerson_String]
		mov  r8, qword[SetupBPerson_String]
		mov  edx,dword[SetupWPerson_Length]
		mov  r9d,dword[SetupBPerson_Length]
		add  rdx, rcx
		add  r9, r8
		lea  r10, [szStartFen]
		lea  r11, [RandSeed]
	       call  Game_StartNewGame
		jmp  .returnz
.cmd_setupgame:
		mov  byte[NewGameWindowMode], 1
	     invoke  DialogBoxParamA,[hInstance],ID_SetupGameDialog,[hMainWindow],SetupGameDialogProc,0
	       test  eax, eax
		 jz  .returnz
	       call  Game_StopEngines
		lea  rcx, [Engine1]
	       call  Engine_Quit
		lea  rcx, [Engine2]
	       call  Engine_Quit
		mov  rcx,qword[SetupWPerson_String]
		mov  r8, qword[SetupBPerson_String]
		mov  edx,dword[SetupWPerson_Length]
		mov  r9d,dword[SetupBPerson_Length]
		add  rdx, rcx
		add  r9, r8
	       call  Game_SetUpPlayers
	       call  Engine_UpdateMove
		mov  rcx, qword[BoardPos+PosEx.move]
		mov  qword[rcx+MoveData.time1], rax
		jmp  .returnz
.cmd_setuptournament:
	     invoke  DialogBoxParamA,[hInstance],ID_SetupTourDialog,[hMainWindow],SetupTourDialogProc,0
	       test  eax, eax
		 jz  .returnz
	       call  InitTour
	       call  StartTourGame
		jmp  .returnz
.cmd_setupboard:
		mov  edi, [BoardOffset.y]
		add  edi, 30
		mov  esi, [BoardOffset.x]
		add  esi, [BoardSize]
		add  esi, 2
	     invoke  CreateWindowEx,0,SetupWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,\
		     rsi,rdi,105,460,[hwnd],0,[hInstance],NULL
		mov  qword[hSetupWindow],rax
		jmp  .returnz
.cmd_arrange:


		jmp  .returnz

.cmd_toggle_status:
		xor  eax, eax
		cmp  rax, qword[hStatusWindow]
		 je  @f
	     invoke  DestroyWindow,[hStatusWindow]
		and  qword[OpenMask], not STATUS_WND_MASK
		jmp  .returnz

		@@:
	     invoke  CreateWindowEx,0,StatusWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[StatusWindowRect.left],[StatusWindowRect.top],[StatusWindowRect.right],[StatusWindowRect.bottom],[hwnd],0,[hInstance],NULL
		mov  qword[hStatusWindow],rax
		jmp  .returnz

.cmd_toggle_engine:
		xor  eax, eax
		cmp  rax, qword[hEngineWindow]
		 je  @f
	     invoke  DestroyWindow,[hEngineWindow]
		and  qword[OpenMask], not ENGINE_WND_MASK
		jmp  .returnz

		@@:
	     invoke  CreateWindowEx,0,EngineWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[EngineWindowRect.left],[EngineWindowRect.top],[EngineWindowRect.right],[EngineWindowRect.bottom],[hwnd],0,[hInstance],NULL
		mov  qword[hEngineWindow], rax
		jmp  .returnz


.wmcreate:
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
	     invoke  CreateWindowEx,0,BoardWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[BoardOffset.x],[BoardOffset.y],\
		     [BoardSize],[BoardSize],[hwnd],0,[hInstance],NULL
		mov  qword[hBoardWindow],rax
	       test  qword[OpenMask],ENGINE_WND_MASK
		 jz  @f
	     invoke  CreateWindowEx,0,EngineWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[EngineWindowRect.left],[EngineWindowRect.top],[EngineWindowRect.right],[EngineWindowRect.bottom],[hwnd],0,[hInstance],NULL
		mov  qword[hEngineWindow],rax
	@@:    test  qword[OpenMask],STATUS_WND_MASK
		 jz  @f
	     invoke  CreateWindowEx,0,StatusWindowClass,0,WS_VISIBLE+WS_CHILD+WS_CLIPSIBLINGS,[StatusWindowRect.left],[StatusWindowRect.top],[StatusWindowRect.right],[StatusWindowRect.bottom],[hwnd],0,[hInstance],NULL
		mov  qword[hStatusWindow],rax
	@@:
		jmp  .returnz

.wm_destroy:
	     invoke  GetWindowRect, [hMainWindow], MainWindowRect
		mov  eax, [MainWindowRect.left]
		sub  [MainWindowRect.right], eax
		mov  eax, [MainWindowRect.top]
		sub  [MainWindowRect.bottom], eax
	     invoke  PostQuitMessage, 0
.returnz:
		xor  eax, eax
.return:
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
include 'ace\Init_MoveGen.asm'

include 'gui\Init_PosGui.asm'
include 'gui\Button.asm'
include 'gui\BoardWindow.inc'
include 'gui\EngineWindow.inc'
include 'gui\StatusWindow.inc'
include 'gui\SetupWindow.inc'
include 'gui\Tournament.inc'
include 'gui\book.inc'
include 'gui\Rand.inc'
include 'gui\Dialogue.inc'
include 'gui\Board.inc'
include 'gui\Draw.inc'
include 'gui\Print.inc'
include 'gui\BoardMouseHandler.inc'
include 'gui\Engine.inc'
include 'gui\Game.inc'
include 'gui\Person.inc'



section '.idata' import data readable writeable


 library kernel32,'KERNEL32.DLL',\
	 user32,'USER32.DLL',\
	 psapi,'PSAPI.DLL',\
	 gdi32,'GDI32.DLL'

include 'api\kernel32.inc'
include 'api\user32.inc'
include 'api\gdi32.inc'

 import  psapi,\
	 GetProcessMemoryInfo,'GetProcessMemoryInfo'


section '.data' data readable writeable



include 'gui\PolygltoKeys.inc'
include 'ace\PSQR.asm'



align 8
BoardSquareSize   dd 72
BoardBoarderSize  dd 28;21
BoardSize	  dd 632;617
BoardWindowSize   dd 632;617

;PieceColors: db 190,220,230,0
;             db 040,040,047,0
 ;            db 040,032,050,0
  ;           db 153,184,190,0

PieceColors: db 210,240,255,0
	     db 010,015,015,0
	     db 010,020,030,0
	     db 220,240,250,0



align 16
ColorPV1: dd 000.0,000.0,255.0,0.875
ColorPV2: dd 000.0,000.0,255.0,0.875
ColorPV3: dd 000.0,255.0,128.0,0.875
ColorPV4: dd 000.0,255.0,128.0,0.875

GuiColor1: db 015,015,015,0
GuiColor2: db 055,055,055,0
GuiColor3: db 032,031,028,0
GuiColor4: db 137,125,121,0
GuiColor5: db 190,180,170,0
GuiColor6: db 230,225,220,0
GuiColor7: db 130,125,120,0
GuiColor8: dd 0x000066FF
GuiColor10: dd 0x00A0B0C0
GuiColor11: dd 0x000066FF


align 16
Colors:
HighlightColor:   db 150,250,200,0
MouseSquareColor: db 190,200,220,0
PrevMoveColor:	  db 180,200,210,0










align 16

const_f4v4_1:	   dd 1.0,1.0,1.0,1.0
const_f4v4_1d2:    dd 0.5,0.5,0.5,0.5
const_f4v4_128:    dd 128.0,128.0,128.0,0.0
const_f4v4_255:    dd 255.0,255.0,255.0,0.0
const_f4v4_sign:   dd 0x7FFFFFFF,0x7FFFFFFF,0x7FFFFFFF,0x7FFFFFFF
const_Color_Gray:  dd 170.0,170.0,170.0,0.75
ELOMultiplier: dq 173.717792761300731

align 16
 RandSeed  dd 0x23498764,0x1F8A58B3,0x12345C78,0x8D654321
 RandInc   dd 0x23498764,0x1F8A58B3,0x12345C78,0x8D654321


align 16
  PieceTypeToBitmapTable:
   dq 0,0,BmpPawn,BmpKnight,BmpBishop,BmpRook,BmpQueen,BmpKing



 CurrentLogLine dd 0


Bitmap.x	 dd ?
Bitmap.y	 dd ?
BoardSize.w	 dd ?
BoardSize.h	 dd ?
BoardOffset.x	 dd ?
BoardOffset.y	 dd ?

align 8
Promotion:
.X	dd 100
.Y	dd 100


align 16
UpdateTable:  dd 1,1 , 2,0 , 0,2 , 0,0




align 8
InitTimeWTIME  dq 60000
InitTimeBTIME  dq 60000
InitTimeWINC   dq 1000
InitTimeBINC   dq 1000


align 4
HighlightMode dd HIGHLIGHT_MODE_LEGAL
  wc WNDCLASS ;0,WindowProc,0,0,NULL,NULL,NULL,COLOR_BTNFACE+1,NULL,MainWindowClass


align 1

 DrawQ_Board   db 0
 DrawQ_Status  db 0
 DrawQ_Engine  db 0
	       db 0


 StartNewQ  db 0
 SetupNewQ  db 0
 BoardFlip  db 0
 NewGameWindowMode db 0
 GameMode   db GAMEMODE_NORMAL
 MouseFromSquare db -1
 MouseToSquare	 db -1


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
  szCmdGo	    db 'go infinite',0
  szCmdThink	    db 'go wtime 500 winc 1000 btime 500 binc 1000                                ',10,0
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

  MainWindowClass   db 'chess64', 0
  BoardWindowClass  db 'chess64 board',0
  StatusWindowClass db 'chess64 status',0
  EngineWindowClass db 'chess64 engine',0
  SetupWindowClass  db 'chess64 setup',0



 PersonFileString rb 1024
 INIFileString	  rb 1024




align 16
SetupWPerson_String dq ?
SetupBPerson_String dq ?
SetupBPerson_Length dd ?
SetupWPerson_Length dd ?
		    dd ?,?

PersonSelOrg	dd ?
PersonSelection dd ?
PersonCount	dd ?
		dd ?
PersonOffsets rd 512



align 16
SetupPos Pos

align 16
SetupState State



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
  SetupSelection  db ?



align 8
  Cursor       dq ?
  hMainWindow  dq ?
  hEditWindow  dq ?

  hSetupTourDialog  dq ?
  hLoadPersonDialog dq ?

  hBoardWindow	 dq ?
  hBoardBitmap	 dq ?
  hBoardMemDC	 dq ?

  hStatusWindow   dq ?
  hStatusBitmap   dq ?
  hStatusMemDC	  dq ?

  hEngineWindow   dq ?
  hEngineBitmap   dq ?
  hEngineMemDC	  dq ?

  hSetupWindow	 dq ?
  hSetupBitmap	 dq ?
  hSetupMemDC	 dq ?

  OpenMask	  dq ?

  GuiColor1pen	  dq ?
  GuiColor1brush  dq ?
  GuiColor2pen	  dq ?
  GuiColor3brush  dq ?
  GuiColor4pen	  dq ?
  GuiColor5brush  dq ?
  GuiColor6pen	  dq ?
  GuiColor7pen	  dq ?
  GuiColor10brush dq ?
  GuiColor11brush dq ?

  hFontMedium	  dq ?
  hFontLarge	  dq ?
  hFontHuge	  dq ?
  hFontTitle	  dq ?
  hFontSymbols	  dq ?

  hGrayBrush	  dq ?
  Temp		  dq ?
  hMainMenu	  dq ?
  hInstance	  dq ?
  ppvBits	  dq ?
  hMemDC	  dq ?
  hdc		  dq ?
  hBitmap	  dq ?


  OpeningBook	   dq ?
  OpeningBookSizeB dq ?

  TickCount	  dq ?
  temp		  dq ?
  PersonText	  dq ?
  PersonTextSizeB dq ?


align 16
Tour:
.Rand	      dq ?,?
.MaxRounds    dd ?
.CurrentRound dd ?
.PlayerCount  dd ?
.PlayerWidth  dd ?
.GoingQ       dd ?
.WPlayerInd   dd ?
.BPlayerInd   dd ?
.Selected     dd ?
.Time	      dq ?
.Inc	      dq ?
.PlayersString rq MAX_TOUR_PLAYERS
.PlayersLength rd MAX_TOUR_PLAYERS
.Score	 rd MAX_TOUR_PLAYERS
.ELO	 rd MAX_TOUR_PLAYERS
.Matrix  rd MAX_TOUR_PLAYERS*MAX_TOUR_PLAYERS
.X	 rq MAX_TOUR_PLAYERS
.dMatrix rq MAX_TOUR_PLAYERS*MAX_TOUR_PLAYERS
.Table1 rq MAX_TOUR_PLAYERS
.Table2 rq MAX_TOUR_PLAYERS
.Table3 rq MAX_TOUR_PLAYERS



align 8
  bmiheader	BITMAPINFOHEADER
  ps		PAINTSTRUCT
  SWrc		RECT
  EWrc		RECT
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


align 32

irps i, 1 2 3 4 5 {
Engine#i:
Engine#i#_UpdateTextQ	db ?
Engine#i#_GoingQ	db ?
Engine#i#_UploadQ	db ?
Engine#i#_ThinkingQ	db ?
Engine#i#_KibitzPVCount dd ?
Engine#i#_Score 	dd ?
Engine#i#_yOffset	dd ?
Engine#i#_TotalNodes	dq ?
Engine#i#_InputCursor	dq ?
Engine#i#_PVColors	dd ?,?,?,?
Engine#i#_InputBuffer	rb ENGINE_WRITE_BUFFER_SIZE
Engine#i#_OutputBuffer	rb ENGINE_READ_BUFFER_SIZE
Engine#i#_Name		rb 512
Engine#i#_String	rb 512
Engine#i#_MemoryUsage	rb 256
Engine#i#_MoveString	rb 64
Engine#i#_SA   SECURITY_ATTRIBUTES
Engine#i#_PI   PROCESS_INFORMATION
Engine#i#_SI   STARTUPINFO
Engine#i#_Out_Read   dq ?
Engine#i#_Out_Write  dq ?
Engine#i#_In_Read    dq ?
Engine#i#_In_Write   dq ?
Engine#i#_hThread    dq ?
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
Engine#i#_bestmove	   rb 2*16
Engine#i#_ponder	   rb 2*16
Engine#i#_pv		   rb 8*128
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









Message        rb ENGINE_READ_BUFFER_SIZE



align 8

BmpKing:   rb 4*72*72
BmpQueen:  rb 4*72*72
BmpKnight: rb 4*72*72
BmpRook:   rb 4*72*72
BmpBishop: rb 4*72*72
BmpPawn:   rb 4*72*72
BmpCircle: rb 4*72*72
BmpChessBoard: rb 4*800*800



include 'gui\Resource.inc'