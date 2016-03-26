
MAX_LOG_LINES = 32
LOG_LINE_LENGTH = 64
MAX_TOUR_PLAYERS = 24

CLEARTYPE_QUALITY = 5
HANDLE_FLAG_INHERIT = 0x00000001

NewGameWindow_Height = 250
NewGameWindow_Width  = 350


SELECT_X0 = 560
SELECT_X1 = 010
SELECT_X2 = 220

SELECT_Y0 = 442
SELECT_Y1 = 025
SELECT_Y2 = SELECT_Y1+387+19



CHAR_BISHOP = 134
CHAR_QUEEN  = 137
CHAR_KNIGHT = 149
CHAR_ROOK   = 136
CHAR_KING   = 139
CHAR_BKING  = 176
CHAR_WKING  = 179


KEY_R_MASK  = (1 shl Rook)
KEY_Q_MASK  = (1 shl Queen)
KEY_K_MASK  = (1 shl King)
KEY_P_MASK  = (1 shl Pawn)
KEY_B_MASK  = (1 shl Bishop)
KEY_N_MASK  = (1 shl Knight)
KEY_EP_MASK = (1 shl 8)


ENGINE_WND_MASK = 0x001
KIBITZ_WND_MASK = 0x002
STATUS_WND_MASK = 0x004
VISUAL_WND_MASK = 0x008
MENTOR_WND_MASK = 0x010



HIGHLIGHT_MODE_NONE  =0
HIGHLIGHT_MODE_LEGAL =1
HIGHLIGHT_MODE_WHITE_COVERAGE =2
HIGHLIGHT_MODE_BLACK_COVERAGE =3
HIGHLIGHT_MODE_ATTACKED       =4
HIGHLIGHT_MODE_UNGUARDED      =5


  SND_ASYNC    = 01h
  SND_FILENAME = 020000h
  SND_RESOURCE = 040004h


IDM_FLIP_BOARD	    = 02001h
IDM_LOAD_KIBITZER   = 02002h
IDM_SETUP_GAME	    = 02003h
IDM_NEW_GAME	    = 02004h
IDM_SETUP_BOARD     = 02005h
IDM_TAKEBACK	    = 02006h
IDM_TAKEBACK2	    = 02007h
IDM_MANAGE_PERSON   = 02008h
IDM_CLOSE_KIBITZER  = 02009h
IDM_LOAD_SUPERKIBITZER	= 200Ah
IDM_CLOSE_SUPERKIBITZER  = 200Bh



IDM_SETUP_TOURNAMENT = 200Bh

IDM_HIGHLIGHT_MODE_NONE 	   =  02011h
IDM_HIGHLIGHT_MODE_LEGAL	   =  02012h
IDM_HIGHLIGHT_MODE_WHITE_COVERAGE  =  02013h
IDM_HIGHLIGHT_MODE_BLACK_COVERAGE  =  02014h
IDM_HIGHLIGHT_MODE_ATTACKED	   =  02015h
IDM_HIGHLIGHT_MODE_UNGUARDED	   =  02016h
IDM_ENDGAME_KBB_K		   =  02020h
IDM_ENDGAME_KR_K		   =  02021h
IDM_ENDGAME_KQ_K		   =  02022h
IDM_ENDGAME_KBN_K		   =  02023h
IDM_OPTION_PRETTYPV		   =  02030h


IDM_TOGGLE_STATUS  = 02040h
IDM_TOGGLE_ENGINE  = 02041h
IDM_ARRANGE_WINDOWS  = 02048h

IDM_COMMAND_SELECT   = 28000h


IDT_UPDATETIMER = 001000h

ID_LoadPersonDialog	    = 03000h
ID_LoadPersonDialog_LIST    = 03001h
ID_LoadPersonDialog_TEXT    = 03002h
ID_LoadPersonDialog_OK	    = 03003h
ID_LoadPersonDialog_CANCEL  = 03004h
ID_LoadPersonDialog_HUMAN   = 03005h
;ID_LoadPersonDialog_UPDATE  = 03006h
ID_LoadPersonDialog_UP	    = 03007h
ID_LoadPersonDialog_DOWN    = 03008h
ID_LoadPersonDialog_CLONE   = 03009h
ID_LoadPersonDialog_DELETE  = 0300Ah

ID_SetupGameDialog	   = 04000h
ID_SetupGameDialog_OK	   = 04002h
ID_SetupGameDialog_CANCEL  = 04003h
ID_SetupGameDialog_WPERSON = 04008h
ID_SetupGameDialog_BPERSON = 04009h
ID_SetupGameDialog_WLOAD   = 0400Ah
ID_SetupGameDialog_BLOAD   = 0400Bh
ID_SetupGameDialog_WTIME   = 04011h
ID_SetupGameDialog_WINC    = 04012h
ID_SetupGameDialog_WMOVES  = 04013h
ID_SetupGameDialog_BTIME   = 04014h
ID_SetupGameDialog_BINC    = 04015h
ID_SetupGameDialog_BMOVES  = 04016h


ID_SetupTourDialog	   = 05000h
ID_SetupTourDialog_LIST    = 05001h
ID_SetupTourDialog_TEXT    = 05002h
ID_SetupTourDialog_OK	   = 05003h
ID_SetupTourDialog_CANCEL  = 05004h
ID_SetupTourDialog_LOAD    = 05005h
ID_SetupTourDialog_TIME    = 05006h
ID_SetupTourDialog_INC	   = 05007h
ID_SetupTourDialog_COUNT   = 05008h
ID_SetupTourDialog_WIDTH   = 05009h


ID_ManagePersonDialog	  = 04041h
ID_ManageGameDialog_LIST  = 04042h





ID_CMD_MAKEMOVE 	    fix 0x3000
ID_CMD_MAKEBOOKMOVE	    fix 0x3001


struct SECURITY_ATTRIBUTES
	nLength 	       dd ?,?
	lpSecurityDescriptor   dq ?
	bInheritHandle	       dd ? 
ends


ENGINE_READ_BUFFER_SIZE = 1024*16
ENGINE_WRITE_BUFFER_SIZE = 1024*8

ENGINE_LINE_COUNT = 24
ENGINE_PV_COUNT = 24
MAX_PV_LENGTH  = 32


struct MoveData
 moveUci    dq ?
 moveSan    dq ?
 ponderUci  dq ?
 ponderSan  dq ?
 time1	    dq ?   ; tick when engine started thinking
 time2	    dq ?   ; tick when engine submitted move
 score	    dd ?
 drawCheck  db ?
 whiteCheck db ?
 blackCheck db ?
	    db ?
 moveInt    dd ?
	    db ?
 check	    db ?
 mate	    db ?
	    db ?
ends

struct PosEx  ; just like Pos struct but some more stuff at the end
 typeBB       rq 8
 board	      rb 64
 gamePly      rd 1
 sideToMove   rd 1
 nodes	      rq 1
 thisThread   rq 1
	      rq 1
	      rq 1
 state	      rq 1
 stateTable   rq 1 ; these two should come after .state
 stateEnd     rq 1 ;
	      rq 1
 move	      rq 1
 moveTable    rq 1
 moveEnd      rq 1
	      rq 1
 szPos	      rq 1
 szPosTable   rq 1
 szPosEnd     rq 1
 rand	      rq 4
 result       rb 8
 moveList     rq MAX_MOVES ; holds null terminated list of legal moves of currect pos
ends



struct ENGINE_LINE
 depth	  dw ?
 multiPv  dw ?
 TEXT	  rd (2*MAX_PV_LENGTH)-1
ends


struct PROCESS_MEMORY_COUNTERS
  cb				dq ?
  PageFaultCount		dq ?
  PeakWorkingSetSize		dq ?
  WorkingSetSize		dq ?
  QuotaPeakPagedPoolUsage	dq ?
  QuotaPagedPoolUsage		dq ?
  QuotaPeakNonPagedPoolUsage	dq ?
  QuotaNonPagedPoolUsage	dq ?
  PagefileUsage 		dq ?
  PeakPagefileUsage		dq ?
ends

struct PROCESS_MEMORY_COUNTERS_EX
  cb				dd ?
  PageFaultCount		dd ?
  PeakWorkingSetSize		dq ?
  WorkingSetSize		dq ?
  QuotaPeakPagedPoolUsage	dq ?
  QuotaPagedPoolUsage		dq ?
  QuotaPeakNonPagedPoolUsage	dq ?
  QuotaNonPagedPoolUsage	dq ?
  PagefileUsage 		dq ?
  PeakPagefileUsage		dq ?
  PrivateUsage			dq ?
ends



WHITE_TEXT_COLOR = 0x00FFF8F0
BLACK_TEXT_COLOR = 0x00A8B8B8



ENGINE_TIMEWIDTH  = 48
ENGINE_DEPTHWIDTH = 64
ENGINE_SCOREWIDTH = 64
ENGINE_NODESWIDTH = 72
ENGINE_MOVESWIDTH = 500

ENGINE_TITLE_HEIGHT =  24

GAMESTATUS_TITLEHEIGHT = 56
GAMESTATUS_NUMBERWIDTH = 44
GAMESTATUS_MOVEWIDTH   = 66


GAMEMODE_NORMAL   fix 0
GAMEMODE_PROM	  fix 1
GAMEMODE_SETUP	  fix 2

; structure for personality information

PTYPE_FIXED    fix 3
PTYPE_COMPUTER fix 2
PTYPE_HUMAN    fix 1

LOAD_PERSON_LINES fix 16
LOAD_PERSON_TITLE fix 17
LOAD_PERSON_SCROLL fix 12


DIALOG_CONFIRM	fix 24
DIALOG_BOX_H	fix 18
DIALOG_OK_X	fix 20
DIALOG_OK_W	fix 30

DIALOG_CANCEL_X     fix 60
DIALOG_CANCEL_W     fix 60


MAX_MOVES_PER_GAME fix 512
RESULT_NONE	 fix 0
RESULT_CHECKMATE fix 1
RESULT_STALEMATE fix 2
RESULT_DRAW	 fix 3
RESULT_TERMINATE fix 4
RESULT_INVALID	 fix 15





struct ENGINE
 X	  dd ?
 Y	  dd ?
 LINES	  dd ?
 RATE	  dd ?
 WTIME	  dd ?
 WDEPTH   dd ?
 WSCORE   dd ?
 WNODES   dd ?
 WMOVES   dd ?
 NAME	  rb 256-9*4
ends

struct THINKING
 TIME	  dd ?
 DEPTH	  dd ?
 SCORE	  dd ?
 NODES	  dd ?,?
 MOVES	  rb 256-4*5
ends




DIB_RGB_COLORS = 0








