ASPIRATION = 32


; search depths
MAX_DEPTH = 64
MAX_PLY   = 32
NULL_MOVE_DEPTH = 1

NODE_TYPE_PV  = 0
NODE_TYPE_CUT = 1
NODE_TYPE_ALL = 2

NODE_FLAG_WASNULL    = 0x001

; threads
THREAD_STATE_EXIT   equ 0
THREAD_STATE_WAIT   equ 1
THREAD_STATE_SEARCH equ 2
TIMER_STATE_WAITING equ 1
TIMER_STATE_TICKING equ 2

; pieces
PAWN   = 1
KNIGHT = 2
BISHOP = 3
ROOK   = 4
QUEEN  = 5
KING   = 6

; move types
MOVE_TYPE_DPAWN  = 1
MOVE_TYPE_OO	 = 2
MOVE_TYPE_OOO	 = 3
MOVE_TYPE_EPCAP  = 4
MOVE_TYPE_PROM	 = 12


; scoring

NO_SCORE	fix (-32768)
INF_SCORE	fix (+32767)
MATE_SCORE	fix (+32000)
ENDGAME_WIN	fix (+20000)
MAX_EVAL	fix (+29999)

PAWN_MSCORE	fix 100
KNIGHT_MSCORE	fix 325
BISHOP_MSCORE	fix 325
ROOK_MSCORE	fix 500
QUEEN_MSCORE	fix 1000

DOUBLED_PAWN_PENALTY	    fix 10
ISOLATED_PAWN_PENALTY	    fix 20
BACKWARD_PAWN_PENALTY	    fix 8
PASSED_PAWN_BONUS	    fix 20
KING_NEAR_OPEN_FILE_PENALTY fix 10
ROOK_SEMI_OPEN_FILE_BONUS   fix 10
ROOK_OPEN_FILE_BONUS	    fix 15
ROOK_ON_SEVENTH_BONUS	    fix 20


BITBOARD_RANK2	 = 0000000011111111000000000000000000000000000000000000000000000000b
BITBOARD_RANK7	 = 0000000000000000000000000000000000000000000000001111111100000000b
BITBOARD_RANK1	 = 1111111100000000000000000000000000000000000000000000000000000000b
BITBOARD_RANK8	 = 0000000000000000000000000000000000000000000000000000000011111111b
BITBOARD_FILEA	 = 0000000100000001000000010000000100000001000000010000000100000001b
BITBOARD_FILEH	 = 1000000010000000100000001000000010000000100000001000000010000000b
BITBOARD_CORNERS = 0111111011111111111111111111111111111111111111111111111101111110b

; structure for hash entry 128 bytes

struct ENTRY
 KEY   dq ?
 DATE  db ?
 DEPTH db ?
 FLAGS db ?
       db ?
 MOVE  dw ?
 SCORE dw ?
ends

ENTRY_CLUSTER_CT fix 4

FLAG_NONE  fix 0
FLAG_UPPER fix 1
FLAG_LOWER fix 2
FLAG_EXACT fix 3


; structure for position   256 bytes

struct POS
 BASE_STATE_PTR  dq ? ; must be first
 ROOT_STATE_PTR  dq ? ; and second
 CURR_STATE_PTR  dq ?
		 dq ?
 NODES		 dq ?
 TIME1		 dq ?
		 dq ?
		 dq ?
ends


struct STATE	 ; the first 8*8*3 bytes should be identical for identical positions
;+64*0
 WPIECES     dq ?
 WPAWNS      dq ?
 WKNIGHTS    dq ?
 WBISHOPS    dq ?
 WROOKS      dq ?
 WQUEENS     dq ?
 WKING	     dq ?
 EPSQUARE    dq ?
;+64*1
 BPIECES     dq ?
 BPAWNS      dq ?
 BKNIGHTS    dq ?
 BBISHOPS    dq ?
 BROOKS      dq ?
 BQUEENS     dq ?
 BKING	     dq ?
 WMSCORE     dw ?
 BMSCORE     dw ?
 SIDE	     db ?
 XSIDE	     db ?
 CASTLING    db ?
	     db ?  ; should be zero
;+64*2
 BOARD	     rb 64
;+64*3
 HASHKEY     dq ? ; these should be in this order
 MHASHKEY    dq ? ;
 PHASHKEY    dq ? ;
	     dq ?
 WPSTMG      dw ? ;
 WPSTEG      dw ? ;
 BPSTMG      dw ? ;
 BPSTEG      dw ? ;
 CHECKERS    dq ?
 PINNED      dq ?
 DCCANDYS    dq ?
;+64*4
 CHECKSQ     rq 8

;+64*5
	; local variables used in node
 ALPHA	     dd ? ; these should be next to each other
 BETA	     dd ? ;
 BEST	     dd ? ;
 DEPTH	     db ? ;
 FLAGS	     db ? ;
 PLY	     db ? ;; PLY and REPEAT should be next to each other
 REPEAT      db ? ;;
	     dq ?
	     dq ?
	     rq 4

;+64*6  stuff used in move loop
 FULL_EVAL   dd ?
 FAST_EVAL   dd ?
	     dq ?
	     dq ?
 CUR_MOVE    dw ?
 HASH_MOVE   dw ?
 KILLER1     dw ?
 KILLER2     dw ?
 MOVE_PHASE  dq ?
 MOVE_PTR    dq ?
 MOVE_END    dq ?
 BAD_END     dq ?

;+64*7
 PV_LENGTH   dw ?
 PV_MOVES    rw 31

;+64*8
 MOVE_LIST   rq 128
;+64*
 BAD_LIST    rd 64

ends


 HAVE_POPCNT  fix 0x000001
 HAVE_AVX1    fix 0x000010
 HAVE_AVX2    fix 0x000020
 HAVE_BMI1    fix 0x000100
 HAVE_BMI2    fix 0x000200

SQUARE_A8 fix (8*0+0)
SQUARE_B8 fix (8*0+1)
SQUARE_C8 fix (8*0+2)
SQUARE_D8 fix (8*0+3)
SQUARE_E8 fix (8*0+4)
SQUARE_F8 fix (8*0+5)
SQUARE_G8 fix (8*0+6)
SQUARE_H8 fix (8*0+7)

SQUARE_A7 fix (8*1+0)
SQUARE_B7 fix (8*1+1)
SQUARE_C7 fix (8*1+2)
SQUARE_D7 fix (8*1+3)
SQUARE_E7 fix (8*1+4)
SQUARE_F7 fix (8*1+5)
SQUARE_G7 fix (8*1+6)
SQUARE_H7 fix (8*1+7)

SQUARE_A6 fix (8*2+0)
SQUARE_B6 fix (8*2+1)
SQUARE_C6 fix (8*2+2)
SQUARE_D6 fix (8*2+3)
SQUARE_E6 fix (8*2+4)
SQUARE_F6 fix (8*2+5)
SQUARE_G6 fix (8*2+6)
SQUARE_H6 fix (8*2+7)

SQUARE_A5 fix (8*3+0)
SQUARE_B5 fix (8*3+1)
SQUARE_C5 fix (8*3+2)
SQUARE_D5 fix (8*3+3)
SQUARE_E5 fix (8*3+4)
SQUARE_F5 fix (8*3+5)
SQUARE_G5 fix (8*3+6)
SQUARE_H5 fix (8*3+7)

SQUARE_A4 fix (8*4+0)
SQUARE_B4 fix (8*4+1)
SQUARE_C4 fix (8*4+2)
SQUARE_D4 fix (8*4+3)
SQUARE_E4 fix (8*4+4)
SQUARE_F4 fix (8*4+5)
SQUARE_G4 fix (8*4+6)
SQUARE_H4 fix (8*4+7)

SQUARE_A3 fix (8*5+0)
SQUARE_B3 fix (8*5+1)
SQUARE_C3 fix (8*5+2)
SQUARE_D3 fix (8*5+3)
SQUARE_E3 fix (8*5+4)
SQUARE_F3 fix (8*5+5)
SQUARE_G3 fix (8*5+6)
SQUARE_H3 fix (8*5+7)

SQUARE_A2 fix (8*6+0)
SQUARE_B2 fix (8*6+1)
SQUARE_C2 fix (8*6+2)
SQUARE_D2 fix (8*6+3)
SQUARE_E2 fix (8*6+4)
SQUARE_F2 fix (8*6+5)
SQUARE_G2 fix (8*6+6)
SQUARE_H2 fix (8*6+7)

SQUARE_A1 fix (8*7+0)
SQUARE_B1 fix (8*7+1)
SQUARE_C1 fix (8*7+2)
SQUARE_D1 fix (8*7+3)
SQUARE_E1 fix (8*7+4)
SQUARE_F1 fix (8*7+5)
SQUARE_G1 fix (8*7+6)
SQUARE_H1 fix (8*7+7)