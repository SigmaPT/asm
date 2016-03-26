format PE64 console
entry Start
;org 0x04000

DEBUG = 0

include 'win64axp.inc'
include 'Def.inc'
include 'Functions.inc'

 ; special instruction sets
 ;  HAVE_POPCNT   popcnt
 ;  HAVE_AVX1     256 bit floating point
 ;  HAVE_AVX2     256 bit integer + fused multiply add  (probably not used)
 ;  HAVE_BMI1     andn
 ;  HAVE_BMI2     pext + pdep
 ; just add the ones you have into HAVE:
HAVE = 0 + HAVE_POPCNT ;+ HAVE_AVX1 + HAVE_AVX2 + HAVE_BMI1 + HAVE_BMI2


section '.data' data readable writeable


align 16
 RandSeed   dd 0x23498764,0x1F8A58B3,0x12345C78,0x8D654321
 RandInc    dd 0x23498764,0x1F8A58B3,0x12345C78,0x8D654321

align 8
BitBoard_Rank1	   dq 1111111100000000000000000000000000000000000000000000000000000000b
BitBoard_Rank8	   dq 0000000000000000000000000000000000000000000000000000000011111111b
BitBoard_FileA	   dq 0000000100000001000000010000000100000001000000010000000100000001b
BitBoard_FileH	   dq 1000000010000000100000001000000010000000100000001000000010000000b
BitBoard_Corners   dq 0111111011111111111111111111111111111111111111111111111101111110b
Mask55	  dq 0x5555555555555555
Mask33	  dq 0x3333333333333333
Mask0F	  dq 0x0F0F0F0F0F0F0F0F
Mask01	  dq 0x0101010101010101

;0xF386
;1111 001110 000110

align 1
 szUCIresponse	      db 'id name fasm chess engine',10
		      db 'id author tthsqe',10
		      db 'option name Hash type spin min 16 max 65536 default 128',10
		      db 'option name MultiPV type spin min 1 max 64 default 1',10
		      db 'option name Ponder type check default false',10
		      db 'option name Threads type spin min 1 max 8 default 1',10
		      db 'uciok',10,0
 szCPUError	      db 'Error: processor does not support ',0
   .POPCNT	      db 'POPCNT',0
   .AVX1	      db 'AVX1',0
   .AVX2	      db 'AVX2',0
   .BMI1	      db 'BMI1',0
   .BMI2	      db 'BMI2',0
 szReadyOK	      db 'readyok',10,0
 szCommandTestBit     db 'test',0
 szCommandMove	      db 'move',0
 szParseError	      db 'command parsing error',10,0
 szIllegal	      db 'illegal position',10,0
 szIsMate	      db 'it is checkmate',10,0
 szPerftProblem       db 'perft problem',10,0
 szMoveNotPseudoLegal db 'move is not pseudo legal',10,0
 szMovePseudoLegal    db 'move is pseudo legal',10,0
 szMoveLegal	      db 'move is legal',10,0
 szMoveIllegal	      db 'move is illegal',10,0
 szInternalError      db 'internal error',10,0
 szGreeting	      db 'fasm chess engine',10,0
 szUnknownCommand     db 'unknown command',10,0
 szStartPosition      db 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',0

include 'Pst.inc'

align 16
 hThreadArray	 rq 64

align 8
 HashTableData:
 HashMask	  rq 1
 HashTable	  rq 1
 HashTableSizeMB  rd 1
 HashDate	  rb 4


align 8
 _Counter	 dq ?
 _Frequency	 dq ?
 _ProcessAffinityMask dq ?
 _SystemAffinityMask  dq ?
 StdOut 	 dq ?
 StdIn		 dq ?
 StdError	 dq ?
 hSearchThread	 dq ?
 hTimerThread	 dq ?
 AlottedTime	 dq ?
 MoveTime	 dq ?
 WTime		 dq ?
 BTime		 dq ?
 WInc		 dq ?
 BInc		 dq ?
 MovesToGo	 dq ?
 temp		 dq ?

align 4
 MultiPV      dd ?
 Ponder       dd ?
 Threads      dd ?

align 4
 RootDepth	   dd ?
 Score		   dd ?
 BestMove	   dw ?
 PonderMove	   dw ?
 SearchThreadStartEvent  dd ?
 TimerThreadStartEvent	 dd ?
 TimerThreadEndEvent	 dd ?

align 1
 PerftProblem	    db ?
 SearchThreadState  db ?
 TimerThreadState   db ?



section '.rdata' data readable writeable

align 8
 HistoryBonus	       rd 64*64

align 8
 KillerMoves	       rd MAX_PLY


;;;;;;;;;;;;;;;;;;;;;;;; structures for position searcing ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

align 32
 BoardPosition	 rb sizeof.POS

align 32
 StateList	 rb 1024*sizeof.STATE

align 8
 MoveList	 rd 1024
 MoveList1	 rd 1024

align 16
 Input		 rb 8*1024
 Output 	 rb 4*1024



section '.bss' data readable writeable


;;;;;;;;;;;;;;;;;;;;;;;; data for move generation  ;;;;;;;;;;;;;;;;;;;;;;;;;;

align 8
 SlidingAttackMasks  rb 212*1024*4
 BishopAttacksPEXT   rq 64     ; bitboards
 BishopAttacksMOFF   rd 64     ; addresses, only 32 bits needed
 BishopAttacksPDEP   rq 64     ; bitboards
 RookAttacksPEXT     rq 64     ; bitboards
 RookAttacksMOFF     rd 64     ; addresses, only 32 bits needed
 RookAttacksPDEP     rq 64     ; bitboards
if ~(HAVE and HAVE_BMI2)
 BishopAttacksIMUL   rq 64
 RookAttacksIMUL     rq 64
 BishopAttacksSHIFT  rb 64
 RookAttacksSHIFT    rb 64
end if
 BetweenMasks	     rq 64*64
 LineMasks	     rq 64*64
 WhitePawnAttacks    rq 64     ; bitboards
 WhitePawnMoves      rq 64     ; bitboards
 WhitePawnPromRank   rq 1      ; bitboard
 WhitePawnHomeRank   rq 1      ; bitboard
 BlackPawnAttacks    rq 64     ; bitboards
 BlackPawnMoves      rq 64     ; bitboards
 BlackPawnPromRank   rq 1      ; bitboard
 BlackPawnHomeRank   rq 1      ; bitboard
 KnightAttacks	     rq 64     ; bitboards
 KingAttacks	     rq 64     ; bitboards
 SquareDistance      rb 64*64
 CastlingMasks	     rb 64     ; masks, 8 bits
 CastlingOOClear     rq 2
 CastlingOOOClear    rq 2
 CastlingOOCheck     rq 2
 CastlingOOOCheck    rq 2
 CastlingOOMove      rd 2
 CastlingOOOMove     rd 2

;;;;;;;;;;;;;;;;;;;; data for hash key generation ;;;;;;;;;;;;;;;;;;;;;;;;

align 64
MaterialKeys:
 WhiteKey	  rq 64  ; all zeros
 BlackKey	  rq 64  ; all zeros
 WhitePawnKey	  rq 64
 BlackPawnKey	  rq 64
 WhiteKnightKey   rq 64
 BlackKnightKey   rq 64
 WhiteBishopKey   rq 64
 BlackBishopKey   rq 64
 WhiteRookKey	  rq 64
 BlackRookKey	  rq 64
 WhiteQueenKey	  rq 64
 BlackQueenKey	  rq 64
 WhiteKingKey	  rq 64
 BlackKingKey	  rq 64
 CastleKey	  rq 16
 EpKey		  rq 8
MaterialKeys_End:

;;;;;;;;;;;;;;;;;;;; data for evaluation ;;;;;;;;;;;;;;;;;;;;;;;

align 64
 SwapValues	     rd 8
 MaterialScores      rd 8
 PstScores	     rq 64   ; zeroes
 PstPawn	     rq 64
 PstKnight	     rq 64
 PstBishop	     rq 64
 PstRook	     rq 64
 PstQueen	     rq 64
 PstKing	     rq 64
 WhitePassedPawns    rq 64    ; bitboards
 BlackPassedPawns    rq 64    ; bitboards
 IsolatedPawns	     rq 64    ; bitboards
 KPKEndgameTable     rq 48*64 ; bit table for lookup

section '.code' code readable executable


Start:			and  rsp,-32
			sub  rsp,32



		; get stuff from os
		       call  _GetStdHandles
		       call  _QueryFrequency
		       call  _GetAffinityMasks
		       call  CheckCPU


		; initialize stuff
			mov  ecx,128
		       call  AllocateHashTable
		       call  InitializeMoveGeneration
		       call  InitializeScores
		       call  InitializeHashKeys
		       call  InitializeTables

		; set up starting position
			lea  rsi,[szStartPosition]
			lea  rbp,[BoardPosition]
		       call  ParseFEN
		       call  VerifyPosition

		; start search thread
			mov  ecx,FALSE
			mov  edx,FALSE
		       call  _CreateEvent
			mov  dword[SearchThreadStartEvent],eax
			lea  rcx,[SearchThread]
			xor  edx,edx
			mov  r8,qword[_ProcessAffinityMask]
		      _blsi  r8,r8,rax
		       call  _CreateThread
			mov  qword[hSearchThread],rax

		; start timer thread
			mov  ecx,FALSE
			mov  edx,FALSE
		       call  _CreateEvent
			mov  dword[TimerThreadStartEvent],eax
			mov  ecx,FALSE
			mov  edx,FALSE
		       call  _CreateEvent
			mov  dword[TimerThreadEndEvent],eax
			lea  rcx,[TimerThread]
			xor  edx,edx
			xor  r8d,r8d
		       call  _CreateThread
			mov  qword[hTimerThread],rax

		; goto main loop
			jmp  MainLoop


;;;;;;;;;;;; main loop ;;;;;;;;;;;;;;
include 'Main.inc'
include 'Windows.inc'

;;;;;;;;;;;; speedy functions ;;;;;;;;;;;;;
include 'Hash.inc'
include 'Search.inc'
include 'Generate.inc'
include 'Move.inc'
include 'Pick.inc'
include 'Evaluate.inc'

;;;;;;;;;;;; thread functions ;;;;;;;;;;;;;
include 'Thread.inc'
include 'Time.inc'

;;;;;;;;;;;; slow functions ;;;;;;;;;;;
include 'Perft.inc'
include 'Position.inc'
include 'Print.inc'
include 'Parse.inc'
include 'Utilities.inc'
include 'Initialize.inc'



section '.idata' import data readable

 library kernel32,'KERNEL32.DLL'
include 'api/kernel32.inc'








