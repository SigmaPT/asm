


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
IDM_MANAGE_PERSON   = 02007h
IDM_CLOSE_KIBITZER  = 02008h
IDM_LOAD_SUPERKIBITZER	= 2009h
IDM_CLOSE_SUPERKIBITZER  = 200Ah
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

IDT_UPDATETIMER = 001000h

ID_LoadPersonDialog	    fix 03001h
ID_LoadPersonDialog_OK	    fix 03002h
ID_LoadPersonDialog_CANCEL  fix 03003h
ID_LoadPersonDialog_PERSON  fix 03004h

ID_SetupGameDialog		=  04001h
ID_SetupGameDialog_OK		=  04002h
ID_SetupGameDialog_CANCEL	=  04003h
ID_SetupGameDialog_WHITEPERSON	=  04004h
ID_SetupGameDialog_BLACKPERSON	=  04005h
ID_SetupGameDialog_BLACKPERSONLIST  =  04006h
ID_SetupGameDialog_BLACKPERSONDESC  =  04007h
ID_SetupGameDialog_WHITEPERSONLIST  =  04008h
ID_SetupGameDialog_WHITEPERSONDESC  =  04009h
ID_SetupGameDialog_SQUARES   = 0x05000


ID_SetupGameDialog_WTIME	   = 04011h
ID_SetupGameDialog_WINC 	   = 04012h
ID_SetupGameDialog_WMOVES	   = 04013h
ID_SetupGameDialog_BTIME	   = 04014h
ID_SetupGameDialog_BINC 	   = 04015h
ID_SetupGameDialog_BMOVES	   = 04016h

ID_SetupGameDialog_CASTLING	   = 04020h
ID_SetupGameDialog_EPSQUARE	   = 04021h
ID_SetupGameDialog_50MOVES	   = 04022h
ID_SetupGameDialog_SIDE 	   = 04023h

ID_SetupGameDialog_RESET	   = 04024h
ID_SetupGameDialog_CLEAR	   = 04025h

ID_ManagePersonDialog		   = 04041h
ID_ManageGameDialog_LIST	   = 04042h





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
 score	    dq ?
 moveInt    dd ?
 result     db ?
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
MAIN_SQUARE_SIZE    = 72
MAIN_BOARD_OFFSET_X = 28
MAIN_BOARD_OFFSET_Y = 28

CHESSBOARD_SIZE = 2*MAIN_BOARD_OFFSET_X+8*MAIN_SQUARE_SIZE


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


;struct PERSONALITY
; TYPE     rb 4  ; 0: end of list, 1: human, 2: computer, 3: computer fixed
; RATING   rb 8
; KFACTOR  rb 8
; NAME     rb 128
; DESC     rb 128
; PATH     rb 256
; OPTIONS  rb 256
;          rb 1024-256-256-128-128-8-8-4
;ends
;struct PERSON
; TYPE     rb 4  ; 0: end of list, 1: human, 2: computer, 3: computer fixed
; RATING   rb 8
; KFACTOR  rb 8
; NAME     rb 128
; DESC     rb 128
; PATH     rb 256
; OPTIONS  rb 256
;          rb 1024-256-256-128-128-8-8-4
;ends

;; structure for board information
;struct BOARD
; SQUARES  rb 64  ; this sould be at offset 0
; CASTLING rb 1   ; bit 0 white king, bit 1 white queen, bit 2 black king, bit 3 black queen
; EPSQUARE rb 1   ; >=64 for no square
; SIDE     rb 1
; RESULT   rb 1
; CHECK    rb 1
;          rb 3
;ends

;;moves fit into a word
;; from square a to square b
;;    msb  00bbbbbb00aaaaaa lsb
;; pawn promotion from square a to square b, promotion piece TT
;MOVE_PROM        = 11000000b
;MOVE_PROM_QUEEN  = 00000000b
;MOVE_PROM_ROOK   = 01000000b
;MOVE_PROM_BISHOP = 10000000b
;MOVE_PROM_KNIGHT = 11000000b
;
;; marks for pieces on the board
;MARK_SIDE   = 00110000b
;MARK_BLACK  = 00100000b      ; -8
;MARK_WHITE  = 00010000b      ;8
;MARK_PIECE  = 00000111b
;MARK_KING   = 00000101b
;MARK_QUEEN  = 00000100b
;MARK_ROOK   = 00000011b
;MARK_BISHOP = 00000010b
;MARK_KNIGHT = 00000001b
;MARK_PAWN   = 00000000b
;MARK_EMPTY  = 0

RESULT_NONE	 fix 0
RESULT_CHECKMATE fix 1
RESULT_STALEMATE fix 2
RESULT_DRAW	 fix 3





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



;CHAR_KING   = 0x1F
;CHAR_QUEEN  = 0x1E
;CHAR_ROOK   = 0x1D
;CHAR_BISHOP = 0x1C
;CHAR_KNIGHT = 0x1B



VK_OEM_PLUS    fix 0xBB
VK_OEM_MINUS   fix 0xBD
VK_OEM_2       fix 0xBF
VK_OEM_PERIOD  fix 0xBE
VK_OEM_4       fix 0xDB
VK_OEM_6       fix 0xDD
VK_OEM_COMMA   fix 0xBC

CHAR_EXCLAMATION   fix 0x21
CHAR_AT 	   fix 0x40
CHAR_POUND	   fix 0x23
CHAR_DOLLAR	   fix 0x24
CHAR_PERCENT	   fix 0x25
CHAR_CARET	   fix 0x5E
CHAR_AMPERSAND	   fix 0x26
CHAR_STAR	   fix 0x2A
CHAR_LEFT_PAR	   fix 0x28
CHAR_RIGHT_PAR	   fix 0x29

CHAR_SPACE     fix 0x20

CHAR_LEFT_BRACKET   fix 0x5B
CHAR_LEFT_LIST	    fix 0x7B
CHAR_RIGHT_BRACKET  fix 0x5D
CHAR_RIGHT_LIST     fix 0x7D

CHAR_PLUS	fix 0x2B
CHAR_EQUAL	fix 0x3D
CHAR_MINUS	fix 0x2D
CHAR_UNDERSCORE fix 0x5F
CHAR_DIVIDE	fix 0x2F
CHAR_QUESTION	fix 0x3F
CHAR_PERIOD	fix 0x2E
CHAR_GREATER	fix 0x3E
CHAR_COMMA	fix 0x2C
CHAR_LESSER	fix 0x3C



CHAR_DOT  fix 0x2E
CHAR_0	  fix 0x30
CHAR_1	  fix 0x31
CHAR_2	  fix 0x32
CHAR_3	  fix 0x33
CHAR_4	  fix 0x34
CHAR_5	  fix 0x35
CHAR_6	  fix 0x36
CHAR_7	  fix 0x37
CHAR_8	  fix 0x38
CHAR_9	  fix 0x39

CHAR_A	  fix 0x61
CHAR_B	  fix 0x62
CHAR_C	  fix 0x63
CHAR_D	  fix 0x64
CHAR_E	  fix 0x65
CHAR_F	  fix 0x66
CHAR_G	  fix 0x67
CHAR_H	  fix 0x68
CHAR_I	  fix 0x69
CHAR_J	  fix 0x6A
CHAR_K	  fix 0x6B
CHAR_L	  fix 0x6C
CHAR_M	  fix 0x6D
CHAR_N	  fix 0x6E
CHAR_O	  fix 0x6F
CHAR_P	  fix 0x70
CHAR_Q	  fix 0x71
CHAR_R	  fix 0x72
CHAR_S	  fix 0x73
CHAR_T	  fix 0x74
CHAR_U	  fix 0x75
CHAR_V	  fix 0x76
CHAR_W	  fix 0x77
CHAR_X	  fix 0x78
CHAR_Y	  fix 0x79
CHAR_Z	  fix 0x7A

CHAR_CAP_A    fix 0x41
CHAR_CAP_B    fix 0x42
CHAR_CAP_C    fix 0x43
CHAR_CAP_D    fix 0x44
CHAR_CAP_E    fix 0x45
CHAR_CAP_F    fix 0x46
CHAR_CAP_G    fix 0x47
CHAR_CAP_H    fix 0x48
CHAR_CAP_I    fix 0x49
CHAR_CAP_J    fix 0x4A
CHAR_CAP_K    fix 0x4B
CHAR_CAP_L    fix 0x4C
CHAR_CAP_M    fix 0x4D
CHAR_CAP_N    fix 0x4E
CHAR_CAP_O    fix 0x4F
CHAR_CAP_P    fix 0x50
CHAR_CAP_Q    fix 0x51
CHAR_CAP_R    fix 0x52
CHAR_CAP_S    fix 0x53
CHAR_CAP_T    fix 0x54
CHAR_CAP_U    fix 0x55
CHAR_CAP_V    fix 0x56
CHAR_CAP_W    fix 0x57
CHAR_CAP_X    fix 0x58
CHAR_CAP_Y    fix 0x59
CHAR_CAP_Z    fix 0x5A

CHAR_CAP_ALPHA	   fix 0x80
CHAR_CAP_BETA	   fix 0x81
CHAR_CAP_GAMMA	   fix 0x82
CHAR_CAP_DELTA	   fix 0x83
CHAR_CAP_EPSILON   fix 0x84
CHAR_CAP_ZETA	   fix 0x85
CHAR_CAP_ETA	   fix 0x86
CHAR_CAP_THETA	   fix 0x87
CHAR_CAP_IOTA	   fix 0x88
CHAR_CAP_KAPPA	   fix 0x89
CHAR_CAP_LAMBDA    fix 0x8A
CHAR_CAP_MU	   fix 0x8B
CHAR_CAP_NU	   fix 0x8C
CHAR_CAP_XI	   fix 0x8D
CHAR_CAP_OMICRON   fix 0x8E
CHAR_CAP_PI	   fix 0x8F
CHAR_CAP_RHO	   fix 0x90
CHAR_CAP_STIGMA    fix 0x91
CHAR_CAP_SIGMA	   fix 0x92
CHAR_CAP_TAO	   fix 0x93
CHAR_CAP_UPSILON   fix 0x94
CHAR_CAP_PHI	   fix 0x95
CHAR_CAP_CHI	   fix 0x96
CHAR_CAP_PSI	   fix 0x97
CHAR_CAP_OMEGA	   fix 0x98
CHAR_CAP_SAMPI	   fix 0x99
CHAR_CAP_DIGAMMA   fix 0x9A
CHAR_CAP_KOPPA	   fix 0x9B


CHAR_ALPHA     fix 0x9C
CHAR_BETA      fix 0x9D
CHAR_GAMMA     fix 0x9E
CHAR_DELTA     fix 0x9F
CHAR_EPSILON   fix 0xA0
CHAR_ZETA      fix 0xA1
CHAR_ETA       fix 0xA2
CHAR_THETA     fix 0xA3
CHAR_IOTA      fix 0xA4
CHAR_KAPPA     fix 0xA5
CHAR_LAMBDA    fix 0xA6
CHAR_MU        fix 0xA7
CHAR_NU        fix 0xA8
CHAR_XI        fix 0xA9
CHAR_OMICRON   fix 0xAA
CHAR_PI        fix 0xAB
CHAR_RHO       fix 0xAC
CHAR_STIGMA    fix 0xAD
CHAR_SIGMA     fix 0xAE
CHAR_TAO       fix 0xAF
CHAR_UPSILON   fix 0xB0
CHAR_PHI       fix 0xB1
CHAR_CHI       fix 0xB2
CHAR_PSI       fix 0xB3
CHAR_OMEGA     fix 0xB4
CHAR_SAMPI     fix 0xB5
CHAR_DIGAMMA   fix 0xB6
CHAR_KOPPA     fix 0xB7

CHAR_VAR_THETA fix 0xB8
CHAR_VAR_RHO   fix 0xB9
CHAR_VAR_PHI   fix 0xBA










