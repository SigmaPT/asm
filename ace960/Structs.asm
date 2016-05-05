;;;;;;;;;;;;;;;;;;;;
; hash table structures
;;;;;;;;;;;;;;;;;;;;

struct MainHash
 table	rq 1
 mask	rq 1
	rq 1
 sizeMB rd 1
 date	rb 1
	rb 3
ends

struct MainHashEntry
 genBound  rb 1  ; this order is fixed
 depth	   rb 1  ;
 move	   rw 1  ;
 eval	   rw 1  ;
 value	   rw 1  ;
ends


struct MaterialHash
 blah  rq 3
ends


struct MaterialHashEntry
 key		    rq 1
 scalingFunction    rd 2 ; these functions are stored as offsets
 evaluationFunction rd 1 ;
 value		    rd 1
ends

struct EndgameTable
 blah  rq 12
ends


struct PawnHash
 blah  rq 3
ends



;;;;;;;;;;;;;;;;;;;;
; search structures
;;;;;;;;;;;;;;;;;;;;


struct Limits
 nodes	     rq 1
 startTime   rq 1
 time	     rd 2
 incr	     rd 2
 movestogo   rd 1
 depth	     rd 1
 movetime    rd 1
 mate	     rd 1
 multiPV     rd 1
	     rd 1
 infinite    rb 1
 ponder      rb 1
 useTimeMgmt rb 1
	     rb 1
	     rb 4
ends


struct UciOptions
 hash		rd 1
 multiPV	rd 1
 threads	rd 1
 weakness	rd 1
 chess960	rd 1
 contempt	rd 1
 minThinkTime	rd 1
 slowMover	rd 1
 ponder 	rb 1
		rb 3
		rb 15
ends


struct EasyMoveMng
 expectedPosKey rq 1
 pv		rd 4
 stableCnt	rd 1
		rd 3
ends


struct Signals
 stop		 rb 1
 stopOnPonderhit rb 1
		 rb 14
ends


struct Time
 startTime   rq 1
 optimumTime rq 1
 maximumTime rq 1
	     rq 1
ends




struct Pos
 typeBB      rq 8
 board	     rb 64
 sideToMove  rd 1
	     rd 1
 gamePly     rd 1
 chess960    rd 1
 _copy_size rb 0

match =1, DEBUG {
 debugPointer	rq 1
 debugMove	rd 1
		rd 1
}

 state		 rq 1 ; the current state struct
 stateTable	 rq 1 ; the beginning of the state of State structs
 stateEnd	 rq 1 ; the end of
 history	 rq 1			   ; these structs hold addresses
 counterMoves	 rq 1			   ; of tables used by the search
 rootMovesVec	 rb sizeof.RootMovesVec    ;
 materialTable	 rb sizeof.MaterialHash    ;
 endgamesTable	 rb sizeof.EndgameTable    ;
 pawnsTable	 rb sizeof.PawnHash	   ;
ends


; Since the original State struct is used in a stack like fasion
;  with the Stack struct, these are combined into one struct
; Also, the CheckInfo struct can be harmlessly moved here too

struct State
; State struct
 key		rq 1
 pawnKey	rq 1
 materialKey	rq 1
 psq		rw 2
 npMaterial	rw 2
 rule50 	rb 1  ; these should be together
 pliesFromNull	rb 1  ;
 castlingRights rb 1
 epSquare	rb 1
 move		rw 1  ; currently only used for undo cmd in global pos structure
 capturedPiece	rb 1
; CheckInfo struct
 ksq		rb 1
 checkersBB	rq 1
 dcCandidates	rq 1
 pinned 	rq 1
 checkSq	rq 8
; Stack struct
_stack_start rb 0
 pv		rq 1
 counterMoves	rq 1
 currentMove	rd 1
 _excludedMove	 rd 1
 killers	rd 2
 moveCount	rd 1
 _staticEval	 rd 1
 _ply		 rd 1
 skipEarlyPruning rb 1
		  rb 3
_stack_end rb 0
ends


;;;;;;;;;;;;;;;;;;;;
; move structures
;;;;;;;;;;;;;;;;;;;;

struct ExtMove	 ; holds moves for gen/pick
 move	rd 1
 score	rd 1
ends


struct Pick
 cur		  rq 1
 endMoves	  rq 1
 endBadCaptures   rq 1
 endQuiets	  rq 1
 stage		  rq 1
 ttMove 	  rd 1
 threshold	  rd 1
 countermove	  rd 1
 followupmoves	  rd 1
 recaptureSquare  rd 1
 depth		  rd 1
 killers	  rb sizeof.ExtMove*3
 moves		  rb sizeof.ExtMove*MAX_MOVES
ends


struct RootMovesVec
 table	rq 1
 end	rq 1
ends


struct RootMove   ; holds root moves
 prevScore rd 1 ; this order is used in PrintUciInfo
 score	   rd 1 ;
 pvSize    rd 1
	   rd 1
 pv	   rd MAX_PLY
ends




;;;;;;;;;;;;;;;;;;;;
; thread structures
;;;;;;;;;;;;;;;;;;;;

struct Thread
 mutex		 rq 5
 sleepCond	 rq 1
 sleepCond2	 rq 1
 handle 	 rq 1
 bestMoveChanges rq 1
 nodes		 rq 1
 idx		 rd 1
 rootDepth	 rd 1
 PVIdx		 rd 1
 previousScore	 rd 1
 completedDepth  rd 1
 callsCnt	 rd 1
 searching	 rb 1
 exit		 rb 1
 failedLow	 rb 1
 easyMovePlayed  rb 1
 resetCalls	 rb 1
		 rb 1
		 rb 1
		 rb 1
 rootPos	 rb sizeof.Pos
ends


struct ThreadPool
 stackPointer	rq 1 ; address of last worker Thread stuct
		rq 1
ends




; some assumptions are made on the size of structers

if sizeof.ExtMove <> 8
 err
end if












