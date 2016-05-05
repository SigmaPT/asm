
  FileABB   equ 0x0101010101010101
  FileHBB   equ 0x8080808080808080
  Rank8BB   equ 0xFF00000000000000
  Rank7BB   equ 0x00FF000000000000
  Rank6BB   equ 0x0000FF0000000000
  Rank3BB   equ 0x0000000000FF0000
  Rank2BB   equ 0x000000000000FF00
  Rank1BB   equ 0x00000000000000FF
  CornersBB equ 0111111011111111111111111111111111111111111111111111111101111110b

Timer_Resolution equ 5
Eval_Tempo equ 17

  ONE_PLY = 1
  MAX_PLY = 128
  DEPTH_QS_CHECKS     =  0
  DEPTH_QS_NO_CHECKS  = -1
  DEPTH_QS_RECAPTURES = -5
  DEPTH_NONE	      = -6


MAX_MOVES equ 224
MAX_THREADS equ 64
MAX_HASH_LOG2MB equ 16


; move types
 MOVE_TYPE_NORMAL equ 0
 MOVE_TYPE_DPAWN  equ 1
 MOVE_TYPE_PROM   equ 2
 MOVE_TYPE_CASTLE equ 6
 MOVE_TYPE_EPCAP  equ 7

; special moves
 MOVE_NONE	  equ 0        ; must be zero
 MOVE_NULL	  equ 0x08000  ; last 15 bits must be zero

; piece types. these need to be fixed for conditional preprocessing in movegen
 White	 fix 0
 Black	 fix 1
 Pawn	 fix 2
 Knight  fix 3
 Bishop  fix 4
 Rook	 fix 5
 Queen	 fix 6
 King	 fix 7

; piece values

  VALUE_ZERO	  = 0
  VALUE_DRAW	  = 0
  VALUE_KNOWN_WIN = 10000
  VALUE_MATE	  = 32000
  VALUE_INFINITE  = 32001
  VALUE_NONE	  = 32002
  VALUE_MATE_IN_MAX_PLY  =  VALUE_MATE - 2 * MAX_PLY
  VALUE_MATED_IN_MAX_PLY = -VALUE_MATE_IN_MAX_PLY

PAWN_VALUE_MG	= 198
KNIGHT_VALUE_MG = 817
BISHOP_VALUE_MG = 836
ROOK_VALUE_MG	= 1270
QUEEN_VALUE_MG	= 2521

PAWN_VALUE_EG	= 258
KNIGHT_VALUE_EG = 846
BISHOP_VALUE_EG = 857
ROOK_VALUE_EG	= 1278
QUEEN_VALUE_EG	= 2558

ISOLATED_PAWN_PENALTY = 40


; definitions for move gen macros
  CAPTURES     equ 0
  QUIETS       equ 1
  QUIET_CHECKS equ 2
  EVASIONS     equ 3
  NON_EVASIONS equ 4
  LEGAL        equ 5

  DELTA_N equ  8
  DELTA_E equ  1
  DELTA_S equ -8
  DELTA_W equ -1

  DELTA_NN equ 16
  DELTA_NE equ 9
  DELTA_SE equ -7
  DELTA_SS equ -16
  DELTA_SW equ -9
  DELTA_NW equ 7


; bounds
BOUND_NONE  equ 0
BOUND_UPPER equ 1 ; fixed!
BOUND_LOWER equ 2 ; fixed!
BOUND_EXACT equ 3

if BOUND_UPPER-BOUND_LOWER <> -1
 err
end if


HistoryStats_Max equ 268435456





SQ_A1 equ (0+8*0)
SQ_B1 equ (1+8*0)
SQ_C1 equ (2+8*0)
SQ_D1 equ (3+8*0)
SQ_E1 equ (4+8*0)
SQ_F1 equ (5+8*0)
SQ_G1 equ (6+8*0)
SQ_H1 equ (7+8*0)

SQ_A2 equ (0+8*1)
SQ_B2 equ (1+8*1)
SQ_C2 equ (2+8*1)
SQ_D2 equ (3+8*1)
SQ_E2 equ (4+8*1)
SQ_F2 equ (5+8*1)
SQ_G2 equ (6+8*1)
SQ_H2 equ (7+8*1)

SQ_A3 equ (0+8*2)
SQ_B3 equ (1+8*2)
SQ_C3 equ (2+8*2)
SQ_D3 equ (3+8*2)
SQ_E3 equ (4+8*2)
SQ_F3 equ (5+8*2)
SQ_G3 equ (6+8*2)
SQ_H3 equ (7+8*2)

SQ_A4 equ (0+8*3)
SQ_B4 equ (1+8*3)
SQ_C4 equ (2+8*3)
SQ_D4 equ (3+8*3)
SQ_E4 equ (4+8*3)
SQ_F4 equ (5+8*3)
SQ_G4 equ (6+8*3)
SQ_H4 equ (7+8*3)

SQ_A5 equ (0+8*4)
SQ_B5 equ (1+8*4)
SQ_C5 equ (2+8*4)
SQ_D5 equ (3+8*4)
SQ_E5 equ (4+8*4)
SQ_F5 equ (5+8*4)
SQ_G5 equ (6+8*4)
SQ_H5 equ (7+8*4)

SQ_A6 equ (0+8*5)
SQ_B6 equ (1+8*5)
SQ_C6 equ (2+8*5)
SQ_D6 equ (3+8*5)
SQ_E6 equ (4+8*5)
SQ_F6 equ (5+8*5)
SQ_G6 equ (6+8*5)
SQ_H6 equ (7+8*5)

SQ_A7 equ (0+8*6)
SQ_B7 equ (1+8*6)
SQ_C7 equ (2+8*6)
SQ_D7 equ (3+8*6)
SQ_E7 equ (4+8*6)
SQ_F7 equ (5+8*6)
SQ_G7 equ (6+8*6)
SQ_H7 equ (7+8*6)

SQ_A8 equ (0+8*7)
SQ_B8 equ (1+8*7)
SQ_C8 equ (2+8*7)
SQ_D8 equ (3+8*7)
SQ_E8 equ (4+8*7)
SQ_F8 equ (5+8*7)
SQ_G8 equ (6+8*7)
SQ_H8 equ (7+8*7)