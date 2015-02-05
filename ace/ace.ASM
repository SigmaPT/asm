format PE64 console
entry Start

include 'win64a.inc'
include 'Def.asm'
include 'BasicMacros.asm'
include 'Structs.asm'
include 'Debug.asm'


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; compile options       ;
CPU_HAS_POPCNT	 equ 1	;  popcnt                                (very nice function)
CPU_HAS_AVX1	 equ 1	;  256 bit floating point                (probably only used for memory copy)
CPU_HAS_AVX2	 equ 1	;  256 bit integer + fused multiply add  (probably not used)
CPU_HAS_BMI1	 equ 1	;  andn                                  (why not use it if we can)
CPU_HAS_BMI2	 equ 1	;  pext + pdep                           (nice for move generation, but not much faster than magics)
DEBUG		 equ 0	;  turns on the asserts and some printing
PROFILE 	 equ 0	;  eventually will be used to profile the branches
DISPLAY_CURRMOVE equ 0	;  displays currmove in the root
SEARCH_DEBUG	 equ 0	;   compilcated use with caution
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



section '.data' data readable writeable

; nasty stuff from c++ Thread struct, should be cleaned up in a future version
align 32
_ZTV11TimerThread:					; byte
	dq 0,0
	dq _ZN11TimerThreadD1Ev 			; 0010 _ 0000000000000000 (d)
	dq _ZN11TimerThreadD0Ev 			; 0018 _ 0000000000000000 (d)
	dq _ZN11TimerThread9idle_loopEv 		; 0020 _ 0000000000000070 (d)
	dq 0,0,0
align 32
_ZTV10MainThread:					; byte
	dq 0,0
	dq _ZN10MainThreadD1Ev				; 0010 _ 0000000000000000 (d)
	dq _ZN10MainThreadD0Ev				; 0018 _ 0000000000000000 (d)
	dq _ZN10MainThread9idle_loopEv			; 0020 _ 0000000000000100 (d)
	dq 0,0,0
align 32
_ZTV6Thread:						; byte
	dq 0,0
	dq _ZN6ThreadD1Ev				; 0010 _ 0000000000000000 (d)
	dq _ZN6ThreadD0Ev				; 0018 _ 0000000000000000 (d)
	dq _ZN6Thread9idle_loopEv			; 0020 _ 00000000000003BC (d)
	dq 0,0,0			   ; 0038 _ 0000000000000000
align 32
_ZTV10ThreadBase:					; byte
	dq 0,0
	dq _ZN10ThreadBaseD1Ev				; 0010 _ 0000000000000000 (d)
	dq _ZN10ThreadBaseD0Ev				; 0018 _ 0000000000000000 (d)
	dq 0;__cxa_pure_virtual                           ; 0020 _ 0000000000000000 (d)
	dq 0,0,0			   ; 0038 _ 0000000000000000




align 16



match =0, CPU_HAS_POPCNT {
 Mask55    dq 0x5555555555555555
 Mask33    dq 0x3333333333333333
 Mask0F    dq 0x0F0F0F0F0F0F0F0F
 Mask01    dq 0x0101010101010101
 Mask11    dq 0x1111111111111111
}


match =0, DEBUG {
  perft_ok db ?
}

match =1, SEARCH_DEBUG {
  QSearchTesting db ?
}




align 1
 szGreeting	      db 'fasm chess engine based on stockfish '
 szDate:	      create_build_time DAY, MONTH, YEAR
 szUCIresponse	      db 'id name another chess engine',10
		      db 'id author fasm',10
		      db 'option name Hash type spin min 1 max 65536 default 16',10
		      db 'option name MultiPV type spin min 1 max 64 default 1',10
		      db 'option name Ponder type check default false',10
		      db 'option name Threads type spin min 1 max 8 default 1',10
		      db 'option name Weakness type spin min 0 max 1000 default 0',10
		      db 'uciok',10,0
 szCPUError	      db 'Error: processor does not support',0
   .POPCNT	      db ' POPCNT',0
   .AVX1	      db ' AVX1',0
   .AVX2	      db ' AVX2',0
   .BMI1	      db ' BMI1',0
   .BMI2	      db ' BMI2',0
 szReadyOK	      db 'readyok',10,0
 szOK		      db 'ok',10,0
 szError	      db 'error',10,0
 szParseError	      db 'command parsing error',10,0
 szStartPosition      db 'rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1',0
 PieceToChar	      db '.?PNBRQK??pnbrqk'
 ToLowerCase:	  ; use assembler to make table for case conversion
			 db   0
repeat 127
		if (% >= 'A') & ( % <='Z')
			 db   % +('a'-'A')
		else
			 db   %
		end if
end repeat


include 'psqr.asm'



align 8
 Frequency   dq ?
 Period      dq ?
 hStdOut     dq ?
 hStdIn      dq ?
 hStdError   dq ?
 InputBuffer	  dq ?	   ; input buffer has dynamic allocation
 InputBufferSizeB dq ?
 Output 	  rd 1024  ; output buffer has static allocation



 MoveTime	 dq ?
 WTime		 dq ?
 BTime		 dq ?
 WInc		 dq ?
 BInc		 dq ?
 MovesToGo	 dq ?
 SearchStartTime dq ?
 AlottedTime	 dq ?







section '.rdata' data readable writeable

align 16
 uciOptions  rb sizeof.UciOptions
 threadPool  rb sizeof.ThreadPool
 timerThread rb sizeof.TimerThread
 mainThread  rb sizeof.MainThread
	     rb sizeof.Thread*(MAX_THREADS-1)
 rootMoves   rb sizeof.RootMoves
 hashTable   rb sizeof.TT
 pos	     rb sizeof.Pos

align 8
Signals:
 .stop		rb 1
 .firstRootMove rb 1

align 8
Limits:
 .depth rd 1
 .alpha rd 1
 .beta	rd 1
 .useTmgr rb 1






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
Zobrist_Pieces:    rq 16*64
Zobrist_Castling:  rq 16
Zobrist_Ep:	   rq 8
Zobrist_side:	   rq 1
Zobrist_exclusion: rq 1
PieceValue_MG:	  rd 16
PieceValue_EG:	  rd 16
ScoreCaptures_MoveTypeValues rd 8

CastlingMasks:	  rb 64
IsNotPawnMasks:   rb 16
IsNotPieceMasks:  rb 16
IsPawnMasks:	  rb 16


;;;;;;;;;;;;;;;;;;;; data for evaluation ;;;;;;;;;;;;;;;;;;;;;;;

align 64
 KPKEndgameTable   rq 48*64 ; bit table for lookup
 WhitePassedPawns  rq 64    ; bitboards
 BlackPassedPawns  rq 64    ; bitboards
 IsolatedPawns	   rq 64    ; bitboards
 DrawValue	   rd 2



section '.code' code readable executable

include 'AvxMacros.asm'
include 'AttackMacros.asm'
include 'GenMacros.asm'
include 'MovePickMacros.asm'
include 'SearchMacros.asm'
include 'QSearchMacros.asm'
include 'HashTableMacros.asm'
include 'PosIsDrawMacro.asm'
include 'UpdateStatsMacros.asm'

include 'Evaluate.asm'
include 'HashTable_Probe.asm'
include 'QSearch.asm'
include 'Search.asm'

include 'SetCheckInfo.asm'
include 'AttackersTo.asm'
include 'DoMove_SetHalfCi.asm'
include 'DoMove_SetFullCi.asm'
include 'GivesCheck.asm'
include 'UndoMove.asm'
include 'Gen_NonEvasions.asm'
include 'Gen_Legal.asm'
include 'Gen_Evasions.asm'

include 'Castling.asm'
include 'PerftGen.asm'

include 'Gen_Quiets.asm'
include 'Gen_QuietChecks.asm'
include 'Gen_Captures.asm'

include 'IsMoveLegal.asm'
include 'IsMovePseudoLegal.asm'
include 'MovePick.asm'
include 'See.asm'

include 'ThreadPool.asm'
include 'ThreadBase.asm'
include 'Thread.asm'
include 'TimerThread.asm'
include 'MainThread.asm'
include 'PositionCopy.asm'
include 'InsertPvInTT.asm'
include 'Think.asm'
include 'Weakness.asm'

include 'PerftPick.asm'
include 'Position.asm'
include 'HashTable.asm'
include 'Uci.asm'
include 'UciOptions.asm'
include 'UciGo.asm'

include 'Root.asm'

include 'PrintParse.asm'
include 'Misc.asm'

include 'Windows.asm'
include 'Init.asm'
include 'Init_MoveGen.asm'

include 'Position_Init.asm'


Start:

			and   rsp, -32
			sub   rsp, 32

		       call   _SetStdHandles
		       call   _SetFrequency
		       call   _CheckCPU

		       call   UciOptions_Init
			mov   ecx, dword [uciOptions+UciOptions.hash]
		       call   HashTable_Allocate
		       call   Init_MoveGen
		       call   Position_Init
		       call   Tables_Init
			lea   rcx, [threadPool]
		       call   _ZN10ThreadPool4initEv

		       call   UciLoop

			lea   rcx, [threadPool]
		       call   _ZN10ThreadPool4exitEv
		       call   HashTable_Free

			xor   ecx, ecx
		       call   _ExitProcess




section '.idata' import data readable writeable

 library kernel,'KERNEL32.DLL'

import kernel,\
	__imp_CreateThread,'CreateThread',\
	__imp_GetProcAddress,'GetProcAddress',\
	__imp_GetCurrentProcess,'GetCurrentProcess',\
	__imp_GetProcessAffinityMask,'GetProcessAffinityMask',\
	__imp_EnterCriticalSection,'EnterCriticalSection',\
	__imp_LeaveCriticalSection,'LeaveCriticalSection',\
	__imp_CloseHandle,'CloseHandle',\
	__imp_WaitForSingleObject,'WaitForSingleObject',\
	__imp_SetEvent,'SetEvent',\
	__imp_QueryPerformanceFrequency,'QueryPerformanceFrequency',\
	__imp_GetStdHandle,'GetStdHandle',\
	__imp_ReadFile,'ReadFile',\
	__imp_CreateEvent,'CreateEventA',\
	__imp_VirtualFree,'VirtualFree',\
	__imp_ExitProcess,'ExitProcess',\
	__imp_ExitThread,'ExitThread',\
	__imp_InitializeCriticalSection,'InitializeCriticalSection',\
	__imp_DeleteCriticalSection,'DeleteCriticalSection',\
	__imp_QueryPerformanceCounter,'QueryPerformanceCounter',\
	__imp_LoadLibrary,'LoadLibraryA',\
	__imp_VirtualAlloc,'VirtualAlloc',\
	__imp_SetThreadAffinityMask,'SetThreadAffinityMask',\
	__imp_WriteFile,'WriteFile',\
	__imp_Sleep,'Sleep'

