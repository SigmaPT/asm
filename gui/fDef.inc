

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



; threads
THREAD_STATE_EXIT   fix 0
THREAD_STATE_WAIT   fix 0
THREAD_STATE_SEARCH fix 2


; move types
MOVE_TYPE_NORMAL       = 0
MOVE_TYPE_PAWNDOUBLE   = 1
MOVE_TYPE_EPCAPTURE    = 2
MOVE_TYPE_PROMOTION    = 3
MOVE_TYPE_CASTLING_OO  = 4
MOVE_TYPE_CASTLING_OOO = 5


; scoring

MATE_SCORE	fix 0x7FF0
PAWN_MSCORE	fix (100)
QUEEN_MSCORE	fix (900)

DOUBLED_PAWN_PENALTY	    fix 10
ISOLATED_PAWN_PENALTY	    fix 20
BACKWARD_PAWN_PENALTY	    fix 8
PASSED_PAWN_BONUS	    fix 20
KING_NEAR_OPEN_FILE_PENALTY fix 10
ROOK_SEMI_OPEN_FILE_BONUS   fix 10
ROOK_OPEN_FILE_BONUS	    fix 15
ROOK_ON_SEVENTH_BONUS	    fix 20




; moves

; move strucutre
;
; normal move
; 0000000000FFFTTT 0000fffffftttttt
; pawn double move
; 0000000000001000 0001fffffftttttt
; ep capture
; 0000000000001001 0010fffffftttttt
; promotion
; 0000000000PPPTTT 0011fffffftttttt
; castling OO
; 0000000000000000 0100fffffftttttt
; castling OOO
; 0000000000000000 0101fffffftttttt

MOVE_TYPE_DPAWN  fix 1
MOVE_TYPE_EPCAP  fix 2
MOVE_TYPE_PROM	 fix 3
MOVE_TYPE_OO	 fix 4
MOVE_TYPE_OOO	 fix 5



; structure for position   256 bytes

PAWN   fix 1
KNIGHT fix 2
BISHOP fix 3
ROOK   fix 4
QUEEN  fix 5
KING   fix 6

struct POS

 STATE_PTR	  dq ? ;28
 ORG_STATE_PTR	  dq ? ;29
		  dq ?
 MOVE_CT	  dd ?
		  dd ? ;

 MOVE		  dq ?
 PONDER 	  dq ?
 SCORE		  dq ?
 DEPTH		  dq ?

 MOVE_LIST	  rb 1024*256
 START_FEN	  rb 1024
 MOVE_LIST_STRING rq 1024

ends




struct STATE	 ; the first 8*8*3 bytes should be identical for identical positions
		 ; the first 8*8*2 bytes are sufficient for testing
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
 BOARD_      dq ?,?,?,?,?,?,?,?
;+64*3
 CHECKERS    dq ?
 PINNED      dq ?
 UCI_MOVE    dq ? ; move in uci notation
 FIG_MOVE    dq ? ; move in figurin notation
 FIG_PONDER  dq ?
 SCORE	     dq ?
 DEPTH	     dd ?
 MOVE	     dd ? ;move in internal format
 MOVE50      dd ?
 PLY	     dw ?
 MATE	     db ?
 RESULT      db ?
ends

;struct BOARD
;;+64*0
; WPIECES  dq ?
; BPIECES  dq ?
; PAWNS    dq ?
; KNIGHTS  dq ?
; BISHOPS  dq ?
; ROOKS    dq ?
; QUEENS   dq ?
; WKING    db ?
; BKING    db ?
; SIDE     db ?
; XSIDE    db ?
; EPFILE   db ?
; CASTLING db ?
; MOVES50  db ?
;          db ?
;;+64*1
; BARRAY  rb 64
;;+64*2
; SIDE        db ?
; XSIDE       db ?
; CASTLING    db ?
; EPFILE      db ?
; MATE        db ?
; RESULT      db ?
;             db ?
;             db ?
; MOVE        dd ? ;move in internal format
; MOVE50      dd ?
; UCI_MOVE    dq ? ; move in uci notation
; FIG_MOVE    dq ? ; move in figurin notation
;ends


STATE.BOARD equ STATE.BOARD_

