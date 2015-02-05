
struct SplitPoint
		rq 1
		rq 1
		rq 1
		rq 1
		rq 1
		rq 1
		rq 1
 mutex		rq 5  ;0x038
 slavesMask	rd 4  ;0x60
		rq 1  ;0x70
		rq 1
		rq 1
		rq 1
		rq 1
ends

struct ThreadPool
 start		rq 1
 end		rq 1
 junk		rq 1 ; this junk has no identifiable function
 minSplitDepth	rd 2
 mutex		rq 5
 sleepCondition rq 1
 timerThread	rq 1
		rq 1
ends

struct ThreadBase      ; used in other thread stucts
 junk		rq 1   ; this junks holds the address of nasty stuff from c++ Thread struct
 mutex		rq 5
 sleepCondition rq 1
 handle 	rq 1
 exit		rb 8
ends

struct TimerThread   ; 72 bytes (0x0048)
 junk		rq 1
 mutex		rq 5
 sleepCondition rq 1
 handle 	rq 1
 exit		rb 1
 run		rb 1
		rb 6
ends

struct MainThread ; 1472 bytes  (0x05C0)
 junk		  rq 1
 mutex		  rq 5
 sleepCondition   rq 1
 handle 	  rq 1
 exit		  rb 8
 splitPoints	  rb MAX_SPLITPOINTS_PER_THREAD*sizeof.SplitPoint
 materialTable	  rq 3			 ;0x508
 endgames	  rq 12 		 ;0x520
 pawnsTable	  rq 3			 ;0x580
 activePosition   rq 1			 ;0x598
 idx		  rq 1			 ;0x5A0
 maxPly 	  rd 2			 ;0x5A8
 activeSplitPoint rq 1			 ;0x5B0
 splitPointsSize  rd 1			 ;0x5B8
 searching	  rb 1			 ;  5BC
 thinking	  rb 3
ends

struct Thread ; 1472 bytes  (0x05C0)
 junk		  rq 1
 mutex		  rq 5
 sleepCondition   rq 1
 handle 	  rq 1
 exit		  rb 8
 splitPoints	  rb MAX_SPLITPOINTS_PER_THREAD*sizeof.SplitPoint
 materialTable	  rq 3			 ;0x508
 endgames	  rq 12 		 ;0x520
 pawnsTable	  rq 3			 ;0x580
 activePosition   rq 1			 ;0x598
 idx		  rq 1			 ;0x5A0
 maxPly 	  rd 2			 ;0x5A8
 activeSplitPoint rq 1			 ;0x5B0
 splitPointsSize  rd 1			 ;0x5B8
 searching	  rb 4			 ;  5BC
ends

struct Pos
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
ends

struct State
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
 ksq		rb 1
 checkersBB	rq 1
 dcCandidates	rq 1
 pinned 	rq 1
 checkSq	rq 8
ends

struct Stack
 splitPoint	  rq 1
 killers	  rw 2
 ply		  rb 1
 reduction	  rb 1
 skipNullMove	  rb 1
 skipEarlyPruning rb 1
 staticEval	  rw 1
 currentMove	  rw 1
 ttMove 	  rw 1
 excludedMove	  rw 1
 pv		  rw MAX_PLY+1
ends

struct RMove   ; holds root moves
 move	rw 1
 pvIdx	rw 1
 score	rw 1
 pscore rw 1
ends

struct EMove   ; holds moves for gen/pick
 move	rw 1
	rw 1
 score	rw 1
	rw 1
ends

struct TT
 table	rq 1
 mask	rq 1
	rq 1
 sizeMB rd 1
 date	rb 1
	rb 3
ends

struct Cluster
 entry0  rq 1	; here we keep the entry data 8 byte aligned for atomicity
 entry1  rq 1
 entry2  rq 1
 key0	 rw 1
 key1	 rw 1
 key2	 rw 1
	 rw 1
ends

struct TTEntry
 genBound  rb 1  ; this order is fixed
 depth	   rb 1
 move	   rw 1
 evalValue rw 1
 value	   rw 1
ends

struct Pick
 cur		  rq 1
 end		  rq 1
 endBadCaptures   rq 1
 endQuiets	  rq 1
 stage		  rq 1
 ttMove 	  rd 1
 captureThreshold rd 1
 countermoves	  rw 2
 followupmoves	  rw 2
 recaptureSquare  rb 1
 depth		  rb 1
		  rb 1
 ss		  rq 1
 killers	  rb sizeof.EMove*6
 moves		  rb sizeof.EMove*MAX_MOVES
ends

struct RootMoves
 alpha		 rd 1
 beta		 rd 1
 depth		 rd 1
		 rd 1
 multiPv	 rd 1
 multiPvIdx	 rd 1
 size		 rd 1
 bestMoveChanges rd 1
 moves		 rb MAX_MOVES*sizeof.RMove
 pvs		 rw MAX_MOVES*(MAX_PLY+1)
ends

struct UciOptions
 hash		rd 1
 multiPv	rd 1
 minSplitDepth	rd 1
 threads	rd 1
 weakness	rd 1
		rd 3
ends

struct Prng
 seed	rq 1
	rq 3
ends






 if sizeof.Cluster <> 32
  err
 end if

 if sizeof.Thread <> sizeof.MainThread
  err
 end if

 if sizeof.Thread <> 1472
  err
 else if Thread.splitPoints <> 0x048
  err
 else if Thread.materialTable <> 0x0508
  err
 else if Thread.endgames <> 0x0520
  err
 else if Thread.pawnsTable <> 0x0580
  err
 else if Thread.idx <> 0x05A0
  err
 else if Thread.splitPointsSize <> 0x05B8
  err
 else if Thread.searching <> 0x05BC
  err
 end if


 if sizeof.SplitPoint <> 152
  err
 elseif SplitPoint.mutex <> 0x038
  err
 end if
