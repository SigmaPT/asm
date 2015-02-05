align 8
SquareStrings: db 'a8b8c8d8e8f8g8h8'
	       db 'a7b7c7d7e7f7g7h7'
	       db 'a6b6c6d6e6f6g6h6'
	       db 'a5b5c5d5e5f5g5h5'
	       db 'a4b4c4d4e4f4g4h4'
	       db 'a3b3c3d3e3f3g3h3'
	       db 'a2b2c2d2e2f2g2h2'
	       db 'a1b1c1d1e1f1g1h1'

align 8
PieceStrings: db '?',CHAR_KNIGHT,CHAR_BISHOP,CHAR_ROOK,CHAR_QUEEN,CHAR_KING,'?','?'


align 8
MailboxArray: db \
	 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,\
	 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,\
	 -1,  0,  1,  2,  3,  4,  5,  6,  7, -1,\
	 -1,  8,  9, 10, 11, 12, 13, 14, 15, -1,\
	 -1, 16, 17, 18, 19, 20, 21, 22, 23, -1,\
	 -1, 24, 25, 26, 27, 28, 29, 30, 31, -1,\
	 -1, 32, 33, 34, 35, 36, 37, 38, 39, -1,\
	 -1, 40, 41, 42, 43, 44, 45, 46, 47, -1,\
	 -1, 48, 49, 50, 51, 52, 53, 54, 55, -1,\
	 -1, 56, 57, 58, 59, 60, 61, 62, 63, -1,\
	 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,\
	 -1, -1, -1, -1, -1, -1, -1, -1, -1, -1

align 8
Mailbox64Array: db \
	21, 22, 23, 24, 25, 26, 27, 28,\
	31, 32, 33, 34, 35, 36, 37, 38,\
	41, 42, 43, 44, 45, 46, 47, 48,\
	51, 52, 53, 54, 55, 56, 57, 58,\
	61, 62, 63, 64, 65, 66, 67, 68,\
	71, 72, 73, 74, 75, 76, 77, 78,\
	81, 82, 83, 84, 85, 86, 87, 88,\
	91, 92, 93, 94, 95, 96, 97, 98

align 8
SlideArray:   db 0,0,-1,-1,-1,0

align 8
OffsetsArray:  db 0, 8, 4, 4, 8, 8

align 8
OffsetArray:
	db  0, 0, 0, 0, 0, 0, 0, 0
	db -21, -19, -12, -8, 8, 12, 19, 21
	db  -11, -9, 9, 11, 0, 0, 0, 0
	db -10, -1, 1, 10, 0, 0, 0, 0
	db  -11, -10, -9, -1, 1, 9, 10, 11
	db  -11, -10, -9, -1, 1, 9, 10, 11

;CastleMaskArray: db \
;         7, 15, 15, 15,  3, 15, 15, 11,\
;        15, 15, 15, 15, 15, 15, 15, 15,\
;        15, 15, 15, 15, 15, 15, 15, 15,\
;        15, 15, 15, 15, 15, 15, 15, 15,\
;        15, 15, 15, 15, 15, 15, 15, 15,\
;        15, 15, 15, 15, 15, 15, 15, 15,\
;        15, 15, 15, 15, 15, 15, 15, 15,\
;        13, 15, 15, 15, 12, 15, 15, 14
;
;
;InitialBoardArray: db \
; MARK_BLACK+MARK_ROOK, MARK_BLACK+MARK_KNIGHT, MARK_BLACK+MARK_BISHOP, MARK_BLACK+MARK_QUEEN, MARK_BLACK+MARK_KING, MARK_BLACK+MARK_BISHOP, MARK_BLACK+MARK_KNIGHT, MARK_BLACK+MARK_ROOK,\
; MARK_BLACK+MARK_PAWN,MARK_BLACK+MARK_PAWN,MARK_BLACK+MARK_PAWN,MARK_BLACK+MARK_PAWN,MARK_BLACK+MARK_PAWN,MARK_BLACK+MARK_PAWN,MARK_BLACK+MARK_PAWN,MARK_BLACK+MARK_PAWN,\
; 0,0,0,0,0,0,0,0,\
; 0,0,0,0,0,0,0,0,\
; 0,0,0,0,0,0,0,0,\
; 0,0,0,0,0,0,0,0,\
; MARK_WHITE+MARK_PAWN,MARK_WHITE+MARK_PAWN,MARK_WHITE+MARK_PAWN,MARK_WHITE+MARK_PAWN,MARK_WHITE+MARK_PAWN,MARK_WHITE+MARK_PAWN,MARK_WHITE+MARK_PAWN,MARK_WHITE+MARK_PAWN,\
; MARK_WHITE+MARK_ROOK, MARK_WHITE+MARK_KNIGHT, MARK_WHITE+MARK_BISHOP, MARK_WHITE+MARK_QUEEN, MARK_WHITE+MARK_KING, MARK_WHITE+MARK_BISHOP, MARK_WHITE+MARK_KNIGHT, MARK_WHITE+MARK_ROOK






