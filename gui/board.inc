

;001000 010000

ParseUciMove_SetMoveData:
	; in: rcx address of MoveData, .moveUci should be set
	;     rbp address of Pos

		       push   rbx rdi rsi r12 r13 r14 r15

			mov   rbx, qword [rbp+Pos.state]
			mov   r15, rcx

			lea   rdi, [rbp+PosEx.moveList-sizeof.EMove]
		@@:	lea   rdi, [rdi+sizeof.EMove]
			mov   ecx, dword [rdi+EMove.move]
			xor   eax, eax
		       test   ecx, ecx
			 jz   .Return
		       call   _PrintUciMove	   ; string result is in rax
			mov   ecx, dword [rdi+EMove.move]
			cmp   rax, qword [r15+MoveData.moveUci]
			jne   @b
			mov   dword [r15+MoveData.moveInt], ecx

			lea   rdi, [r15+MoveData.moveSan]
		       call   .PrintSan
			mov   r14, rdi

			mov   ecx, dword [r15+MoveData.moveInt]
			mov   byte [r14], '+'	 ; add + in SAN string
		       call   GivesCheck
			mov   ecx, dword [r15+MoveData.moveInt]
			mov   edx, eax
			mov   byte [r15+MoveData.check], al
			neg   eax
			adc   r14, 0
			add   dword [rbp+Pos.gamePly], 1
		       call   DoMove_SetFullCi

			lea   rdi, [rbp+PosEx.moveList]
			lea   rsi, [rdi+sizeof.EMove]
			mov   byte [r14], '#'	 ; add # in SAN string
		       call   Gen_Legal
			mov   rdx, qword [r15+MoveData.ponderUci]
			xor   eax, eax
			mov   dword [rdi], eax
			cmp   rdi, rsi
			sbb   rax, rax
			sub   r14, rax
			mov   byte [r14], 0
			mov   byte [r15+MoveData.mate], al
		       test   dl,dl
			jnz   .HandlePonderMove
.HandlePonderMoveRet:

			 or   eax, -1
.Return:
			pop   r15 r14 r13 r12 rsi rdi rbx
			ret

.PrintSan:
	; in: ecx move
	;     rdi address to write string
	;     rbp address of PosEx
		       push   rsi r12 r13

			mov   r8d, ecx
			mov   r9d, ecx
			mov   r12d, ecx
			xor   r11d, r11d	; prom piece
			and   r9d, 63
			shr   r8d, 6
			and   r8d, 63
			shr   ecx, 12
		      movzx   r10d, byte [rbp+Pos.board+r8]
			cmp   ecx, MOVE_TYPE_DPAWN
			 je   .PawnPush
			cmp   ecx, MOVE_TYPE_EPCAP
			 je   .EpCap
			cmp   ecx, MOVE_TYPE_PROM
			jae   .PawnMoveProm
			cmp   ecx, MOVE_TYPE_CASTLE
			 je   .Castle
			mov   ecx, r10d
			and   ecx, 7
			cmp   ecx, Pawn
			 je   .PawnMove

			mov   eax, r10d
		      movzx   ecx, byte [rbp+Pos.board+r9]
			and   eax, 7
		      movzx   eax, byte [TypeToFigurine+rax]
		      stosb
			mov   byte [rdi], 'x'
			neg   ecx
			adc   rdi, 0

			lea   rsi, [rbp+PosEx.moveList]
			mov   r11d, r8d
			mov   r12d, r8d
			shr   r11d, 3
			and   r12d, 7

			xor   r13d, r13d   ; bit 0 = mul ranks, bit 1 = mul files, bit 2 = mul
.CheckNext:
			mov   eax, dword [rsi+EMove.move]
			add   rsi, sizeof.EMove
			mov   ecx, eax
		       test   eax, eax
			 jz   .CheckDone
			shr   ecx, 6
			and   ecx, 63
			and   eax, 63
			cmp   eax, r9d
			jne   .CheckNext
			cmp   ecx, r8d
			 je   .CheckNext
			cmp   r10l, byte [rbp+Pos.board+rcx]
			jne   .CheckNext

			mov   edx, ecx
			and   edx, 7   ; file
			shr   ecx, 3   ; rank

			 or   r13d, 0100b

			xor   eax, eax
			cmp   ecx, r11d
		       sete   al
			 or   r13d, eax
			cmp   edx, r12d
		       sete   al
			add   eax, eax
			 or   r13d, eax
			jmp   .CheckNext

.CheckDone:		cmp   r13, 0100b
			 je   .DisplayFile
			and   r13d, 011b
			cmp   r13d, 011b
			 je   .DisplayRankFile
			cmp   r13d, 001b
			 je   .DisplayFile
			cmp   r13d, 010b
			 je   .DisplayRank
.PrintDestination:
			mov   eax, r9d
			shr   eax, 3
			shl   eax, 8
			and   r9d, 7
			lea   eax, [rax+r9+'a1']
		      stosw

.PrintSanDone:
			pop   r13 r12 rsi
			ret

.DisplayFile:
			mov   eax, r8d
			and   eax, 7
			lea   eax, [rax+'a']
		      stosb
			jmp   .PrintDestination
.DisplayRank:
			mov   eax, r8d
			shr   eax, 3
			lea   eax, [rax+'1']
		      stosb
			jmp   .PrintDestination
.DisplayRankFile:
			mov   eax, r8d
			shr   eax, 3
			shl   eax, 8
			and   r8d, 7
			lea   eax, [rax+r8+'a1']
		      stosw
			jmp   .PrintDestination

.PawnMoveProm:
		      movzx   r11d, byte [TypeToFigurine+rcx-MOVE_TYPE_PROM+Knight]
.PawnMove:
			cmp   byte [rbp+Pos.board+r9], 0
			 je   .PawnPush
			and   r8d, 7
			lea   eax, [r8+'ax']
		      stosw
.PawnPush:
			mov   eax, r9d
			shr   eax, 3
			shl   eax, 8
			and   r9d, 7
			lea   eax, [rax+r9+'a1']
		      stosw

		       test   r11d, r11d
			 jz   .PrintSanDone
			mov   al,'='
		      stosb
			mov   al, r11l
		      stosb
			jmp   .PrintSanDone

.EpCap:
			mov   rax, 'axa1ep'
			and   r8d, 7
			add   rax, r8
			mov   ecx, r9d
			and   ecx, 7
			shl   rcx, 8*2
			add   rax, rcx
			shr   r9d, 3
			shl   r9, 8*3
			add   rax, r9
		      stosq
			sub   rdi, 2
			jmp   .PrintSanDone
.Castle:
			cmp   r8d, r9d
			sbb   rax, rax
			mov   rcx, 'O-O-O'
			mov   qword [rdi], rcx
			lea   rdi, [rdi+5+2*rax]
			jmp   .PrintSanDone


.HandlePonderMove:
			lea   rdi, [rbp+PosEx.moveList]
			mov   ecx, dword [rdi+EMove.move]
		@@:    test   ecx, ecx
			 jz   .HandlePonderMoveRet
		       call   _PrintUciMove	   ; string result is in rax
			mov   ecx, dword [rdi+EMove.move]
			lea   rdi, [rdi+sizeof.EMove]
			cmp   rax, qword [r15+MoveData.ponderUci]
			jne   @b

			mov   esi, ecx
			lea   rdi, [r15+MoveData.ponderSan]
		       call   .PrintSan

			mov   ecx, esi
		       call   GivesCheck
			mov   byte [rdi], '+'
			neg   eax
			adc   rdi, 0
			mov   byte [rdi], 0

			 or   eax, -1
			jmp   .Return


MakeMoveSound:
	; in: rcx address of MoveData
	;     rbp address of Pos
	; this should always take a few ms to return

	       push  rsi

	     invoke  Sleep, 50


	       ;         lea   rsi, [WMoveWaveFile]
	       ;         mov   edx, r12d
	       ;         shr   edx, 12
	       ;         mov   ecx, r12d
	       ;         and   ecx, 63
	       ;
	       ;         lea   rax, [BMoveWaveFile]
	       ;         cmp   byte [rbp+Pos.sideToMove], 0
	       ;      cmovne   rsi, rax
	       ;
	       ;         lea   rax, [CastleWaveFile]
	       ;         cmp   edx, MOVE_TYPE_CASTLE
	       ;       cmove   rsi, rax
	       ;
	       ;         lea   rax, [CaptureWaveFile]
	       ;         cmp   byte [rbp+Pos.board+rcx], 0
	       ;      cmovne   rsi, rax
	       ;      invoke   PlaySound,rsi,0,SND_ASYNC+SND_FILENAME

		pop  rsi
		ret




MainMakeMove:
	; to make a move:
	;     at the element [BoardPos.move],
	;     write the uci string to .moveUci member
	;     and other time data as well
	; this will be played if it is legal and the rest of the info will be filled in

		       push   rbp rdi rsi rbx r13 r14 r15
  .Start:
			lea   rbp, [BoardPos]
			mov   rbx, qword [rbp+PosEx.state]
			mov   r15, qword [rbp+PosEx.move]

			xor   eax, eax
			cmp   al, byte [rbp+PosEx.result]
			jne   .Done

			lea   rax, [rbx+sizeof.State]
			cmp   rax, qword [rbp+Pos.stateEnd]
			jae   .ReAllocState
.ReAllocStateRet:
			lea   rax, [r15+sizeof.State]
			cmp   rax, qword [rbp+PosEx.moveEnd]
			jae   .ReAllocMove
.ReAllocMoveRet:
			mov   rax, qword [rbp+PosEx.szPos]
			add   rax, 8
			cmp   rax, qword [rbp+PosEx.szPosEnd]
			jae   .ReAllocPosString
.ReAllocPosStringRet:

	; test for legality first
		lea  rdi, [rbp+PosEx.moveList]
	@@:	mov  ecx, dword[rdi+EMove.move]
	       test  ecx, ecx
		 jz  .Illegal
	       call  _PrintUciMove	  ; string result is in rax
		lea  rdi, [rdi+sizeof.EMove]
		cmp  rax, qword[r15+MoveData.moveUci]
		jne  @b

	; stop the kibiters
		mov  byte[Engine1_GoingQ],0
		mov  byte[Engine2_GoingQ],0
	       call  Engine_StopKibitzers

	; make the move and write stuff to MoveData
		mov  rcx, r15
	       call  ParseUciMove_SetMoveData
		mov  rbx, qword[rbp+PosEx.state]

	; call sound at least to limit the the move rate
	       call  MakeMoveSound

	; append the move to the position string
		mov  rdi, qword[rbp+PosEx.szPos]
		mov  al, ' '
	      stosb
		lea  rsi, [r15+MoveData.moveUci]
	       call  Append
		mov  qword[rbp+PosEx.szPos], rdi

	; sub time taken for move
		mov  eax, dword[rbp+Pos.sideToMove]
		xor  eax, 1
		mov  rcx, qword[r15+MoveData.time2]
		sub  rcx, qword[r15+MoveData.time1]
		sub  rcx, qword[Time_INC+8*rax]
		sub  qword[Time_TIME+8*rax], rcx

	; update result
	      movsx  ecx, byte[r15+MoveData.mate]
	      movsx  edx, byte[r15+MoveData.check]
	       test  ecx, ecx
		 jz  .CheckDraw
		mov  eax, RESULT_STALEMATE shl 2
	       test  edx, edx
		 jz  .StoreResult
		mov  eax, dword[rbp+Pos.gamePly]
		xor  eax, 1
		and  eax, 1
		add  eax, 1 + (RESULT_CHECKMATE shl 2)
.StoreResult:
		mov  byte[rbp+PosEx.result], al
;                cmp  al, 0
;                jne  .TerminateDone
;        ; check for termination in tournament
;                cmp  dword[Tournament.GoingQ], 0
;  jmp  .TerminateDone
;                 je  .TerminateDone
;                cmp  dword[rbp+Pos.gamePly], 1
;                jbe  .TerminateDone
;               call  TerminateByDrawCheck
;               test  eax, eax
;                jnz  .TerminateSuccess
;               call  TerminateByWhiteCheck
;               test  eax, eax
;                jnz  .TerminateSuccess
;               call  TerminateByBlackCheck
;               test  eax, eax
;                jnz  .TerminateSuccess
;                jmp  .TerminateDone
;.TerminateSuccess:
;                mov  byte[rbp+PosEx.result], al
.TerminateDone:
		add  r15, sizeof.MoveData
		mov  qword[rbp+PosEx.move], r15
		mov  eax, dword[rbp+PosEx.sideToMove]
	      movzx  eax, byte[WhiteCompQ+rax]
		cmp  byte[rbp+PosEx.result], 0
		jne  .NoBook
	       test  eax, eax
		 jz  .NoBook
	       call  GetBookMove
		cmp  ax, 'no'
		jne  .HaveBookMove
.NoBook:
	       call  UpdateHighlightMask
	       call  Engine_UpdateMove
		mov  qword [r15+MoveData.time1], rax
		 or  eax, -1
.Done:
	      movzx  eax, byte[rbp+PosEx.result]
	       test  eax, eax
		 jz  @f
	     stdcall  AddLogLine, 'game over'
		@@:


	       call  PaintGameStatusWindow
		mov  byte[DrawQ_Board], -1
		mov  byte[DrawQ_Status], -1
.return:
		pop  r15 r14 r13 rbx rsi rdi rbp
		ret

.HaveBookMove:
		mov  qword [r15+MoveData.moveUci], rax
		mov  dword [r15+MoveData.score], 0x80000000
	     invoke  GetTickCount
		mov  qword [r15+MoveData.ponderUci], rax
		mov  qword [r15+MoveData.time1], rax
		mov  qword [r15+MoveData.time2], rax
	     invoke  SendMessage, qword [hBoardWindow], WM_PAINT, 0, 0
	       call  PaintGameStatusWindow
	     invoke  SendMessage,[hStatusWindow],WM_COMMAND,0,0
		jmp  .Start

.CheckDraw:
		mov  eax, RESULT_DRAW shl 2
		mov  ecx, dword [rbp+Pos.gamePly]
	      movzx  edx, byte [rbx+State.rule50]
		cmp  ecx, 500
		 ja  .StoreResult
		cmp  edx, 100
		jae  .StoreResult

	      movzx  eax, byte [rbx+State.pliesFromNull]
		cmp  eax, edx
	      cmova  eax, edx
		mov  r8, qword [rbx+State.key]
		shr  eax, 1
		 jz  .StoreResult
		xor  ecx, ecx
	       imul  rax, -2*sizeof.State
.CheckPrev:
		xor  edx, edx
		cmp  r8, qword [rbx+rax+State.key]
	       sete  dl
		add  ecx, edx
		add  rax, 2*sizeof.State
		jnz  .CheckPrev
		cmp  ecx, 2
		 jb  .StoreResult
		mov  eax, RESULT_DRAW shl 2
		jmp  .StoreResult


.Illegal:

;                     invoke   PlaySound,IllegalWaveFile,0,SND_ASYNC+SND_FILENAME
		     invoke   Sleep, 50
			lea   rdi, [Message]
			lea   rsi, [szIllegalMove]
		       call   Append
			mov   rax, qword[r15+MoveData.moveUci]
			mov   qword [rdi],rax

		     invoke   MessageBoxA,0,Message,'illegal',MB_OK
		    ; invoke  SendMessage,[hExtraWindow],WM_SETTEXT,0,Message

			xor  eax,eax
			jmp  .Done


.ReAllocState:	 int3
			mov   r13, qword [rbp+PosEx.state]
			mov   r14, qword [rbp+PosEx.stateTable]
			sub   r13, r14
			mov   rdx, qword [rbp+PosEx.stateEnd]
			sub   rdx, r14
			add   rdx, 256*sizeof.State
			mov   rdi, rdx
		     invoke   VirtualAlloc, 0, rdx, MEM_COMMIT, PAGE_READWRITE
			lea   ecx, [r13+sizeof.State]
			shr   ecx, 3
			lea   rdx, [rax+rdi]
			mov   rdi, rax
			add   r13, rax
			mov   qword [rbp+PosEx.stateTable], rax
			mov   qword [rbp+PosEx.state], r13
			mov   qword [rbp+PosEx.stateEnd], rdx
			mov   rsi, r14
		  rep movsq
		     invoke   VirtualFree, r14, 0, MEM_RELEASE
			jmp   .ReAllocStateRet

.ReAllocMove:  int3
			mov   r13, qword [rbp+PosEx.move]
			mov   r14, qword [rbp+PosEx.moveTable]
			sub   r13, r14
			mov   rdx, qword [rbp+PosEx.moveEnd]
			sub   rdx, r14
			add   rdx, 256*sizeof.MoveData
			mov   rdi, rdx
		     invoke   VirtualAlloc, 0, rdx, MEM_COMMIT, PAGE_READWRITE
			lea   ecx, [r13+sizeof.MoveData]
			shr   ecx, 3
			lea   rdx, [rax+rdi]
			mov   rdi, rax
			add   r13, rax
			mov   r15, r13
			mov   qword [rbp+PosEx.moveTable], rax
			mov   qword [rbp+PosEx.move], r13
			mov   qword [rbp+PosEx.moveEnd], rdx
			mov   rsi, r14
		  rep movsq
		     invoke   VirtualFree, r14, 0, MEM_RELEASE
			jmp   .ReAllocStateRet


.ReAllocPosString:  int3
			mov   r13, qword [rbp+PosEx.szPos]
			mov   r14, qword [rbp+PosEx.szPosTable]
			sub   r13, r14
			mov   rdx, qword [rbp+PosEx.szPosEnd]
			sub   rdx, r14
			add   rdx, 256*8
			mov   rdi, rdx
		     invoke   VirtualAlloc, 0, rdx, MEM_COMMIT, PAGE_READWRITE
			mov   ecx, r13d
			lea   rdx, [rax+rdi]
			mov   rdi, rax
			add   r13, rax
			mov   qword [rbp+PosEx.szPosTable], rax
			mov   qword [rbp+PosEx.szPos], r13
			mov   qword [rbp+PosEx.szPosEnd], rdx
			mov   rsi, r14
		  rep movsb
		     invoke   VirtualFree, r14, 0, MEM_RELEASE
			jmp   .ReAllocPosString





TerminateByDrawCheck:
; rbp address of pos
; r15 address of move

			mov  edx, dword[rbp+Pos.gamePly]
		       push  rdx
		       fild  dword[rsp]
		      fsqrt
			mov  dword[rsp], 70
		       fild  dword[rsp]
		      fsqrt
		      fsubp  st1, st0
		      fistp  dword[rsp]
			pop  rdx

			mov  ecx, dword[r15+MoveData.score]
		      movzx  eax, byte[r15+MoveData.drawCheck-sizeof.MoveData]
			cmp  ecx, 0x80000000
			 je  .no
			cmp  ecx, edx
			 jg  .no
			neg  edx
			cmp  ecx, edx
			 jl  .no
			cmp  dword[rbp+Pos.gamePly], 80
			 jb  .no
			add  eax, 1
			mov  byte[r15+MoveData.drawCheck], al
			cmp  eax, 20
			sbb  eax, eax
			not  eax
			and  eax, (RESULT_TERMINATE shl 2) + 0
			ret
	.no:
			xor  eax, eax
			mov  byte[r15+MoveData.drawCheck], al
			ret


TerminateByWhiteCheck:
; rbp address of pos
; r15 address of move
			mov  ecx, dword[r15+MoveData.score]
		      movzx  eax, byte[r15+MoveData.whiteCheck-sizeof.MoveData]
			cmp  ecx, 0x80000000
			 je  .no
			cmp  ecx, +1024
			jle  .no
			add  eax, 1
			mov  byte[r15+MoveData.whiteCheck], al
			cmp  eax, 10
			sbb  eax, eax
			not  eax
			and  eax, (RESULT_TERMINATE shl 2) + 1
			ret
	.no:
			xor  eax, eax
			mov  byte[r15+MoveData.whiteCheck], al
			ret

TerminateByBlackCheck:
; rbp address of pos
; r15 address of move
			mov  ecx, dword[r15+MoveData.score]
		      movzx  eax, byte[r15+MoveData.blackCheck-sizeof.MoveData]
			cmp  ecx, 0x80000000
			 je  .no
			cmp  ecx, -1024
			jge  .no
			add  eax, 1
			mov  byte[r15+MoveData.blackCheck], al
			cmp  eax, 10
			sbb  eax, eax
			not  eax
			and  eax, (RESULT_TERMINATE shl 2) + 2
			ret
	.no:
			xor  eax, eax
			mov  byte[r15+MoveData.blackCheck], al
			ret









TakeBackMove:
	       push  rbp rdi rsi rbx r15
		lea  rbp, [BoardPos]
		mov  rbx, qword[rbp+PosEx.state]
		cmp  rbx, qword[rbp+PosEx.stateTable]
		jbe  .Ret
	; stop the engines that might be thinking
	       call  Game_StopEngines
	; undo the move
		mov  r15, qword[rbp+PosEx.move]
		sub  r15, sizeof.MoveData
		mov  ecx, dword[r15+MoveData.moveInt]
	       call  UndoMove
		mov  qword[rbp+PosEx.move], r15
	; create move list
		lea  rdi, [rbp+PosEx.moveList]
	       call  Gen_Legal
		xor  eax, eax
	      stosq
	; take the move off of the position string
		mov  rax, qword [rbp+PosEx.szPos]
	  @@:	sub  rax, 1
		cmp  byte [rax], ' '
		 ja  @b
		mov  qword [rbp+PosEx.szPos], rax
	; add time taken for move
		mov  eax, dword[rbp+Pos.sideToMove]
		mov  rcx, qword[r15+MoveData.time2]
		sub  rcx, qword[r15+MoveData.time1]
		sub  rcx, qword[Time_INC+8*rax]
		add  qword[Time_TIME+8*rax], rcx
	; update highlights
	       call  UpdateHighlightMask
	; update the engines
	       call  Engine_UpdateMove
		mov  qword[r15+MoveData.time1], rax
.Ret:
		pop  r15 rbx rsi rdi rbp
		ret


TakeBackMove2:
	       push  rbp rdi rsi rbx r15
		lea  rbp, [BoardPos]
		mov  rbx, qword[rbp+PosEx.state]
		cmp  rbx, qword[rbp+PosEx.stateTable]
		jbe  .Ret
	; stop the engines that might be thinking
	       call  Game_StopEngines
	; undo the move
		mov  r15, qword [rbp+PosEx.move]
		sub  r15, sizeof.MoveData
		mov  ecx, dword [r15+MoveData.moveInt]
	       call  UndoMove
		mov  qword[rbp+PosEx.move], r15
	; create move list
		lea  rdi, [rbp+PosEx.moveList]
	       call  Gen_Legal
		xor  eax, eax
	      stosq
	; take the move off of the position string
		mov  rax, qword [rbp+PosEx.szPos]
	  @@:	sub  rax, 1
		cmp  byte[rax], ' '
		 ja  @b
		mov  qword[rbp+PosEx.szPos], rax
	; add time taken for move
		mov  eax, dword[rbp+Pos.sideToMove]
		mov  rcx, qword[r15+MoveData.time2]
		sub  rcx, qword[r15+MoveData.time1]
		sub  rcx, qword[Time_INC+8*rax]
		add  qword[Time_TIME+8*rax], rcx

		mov  rbx, qword[rbp+PosEx.state]
		cmp  rbx, qword[rbp+PosEx.stateTable]
		jbe  .RetStart
	; undo the move
		mov  r15, qword[rbp+PosEx.move]
		sub  r15, sizeof.MoveData
		mov  ecx, dword[r15+MoveData.moveInt]
	       call  UndoMove
		mov  qword[rbp+PosEx.move], r15
	; create move list
		lea  rdi, [rbp+PosEx.moveList]
	       call  Gen_Legal
		xor  eax, eax
	      stosq
	; take the move off of the position string
		mov  rax, qword[rbp+PosEx.szPos]
	  @@:	sub  rax, 1
		cmp  byte[rax], ' '
		 ja  @b
		mov  qword[rbp+PosEx.szPos], rax
	; add time taken for move
		mov  eax, dword[rbp+Pos.sideToMove]
		mov  rcx, qword[r15+MoveData.time2]
		sub  rcx, qword[r15+MoveData.time1]
		sub  rcx, qword[Time_INC+8*rax]
		add  qword[Time_TIME+8*rax], rcx
.RetStart:
	; update highlights
	       call  UpdateHighlightMask
	; update the engines
	       call  Engine_UpdateMove
		mov  qword[r15+MoveData.time1], rax

.Ret:
		pop  r15 rbx rsi rdi rbp
		ret




UpdateHighlightMask:
		       push   rbp rsi rdi rbx r15

			mov   edx, dword [HighlightMode]
			xor   eax, eax
			lea   rbp, [BoardPos]

			cmp   edx, HIGHLIGHT_MODE_LEGAL
			 je   .MovesHighlight
			mov   ecx, White
			cmp   edx, HIGHLIGHT_MODE_WHITE_COVERAGE
			 je   .Coverage
			mov   ecx, Black
			cmp   edx, HIGHLIGHT_MODE_BLACK_COVERAGE
			 je   .Coverage
			cmp   edx, HIGHLIGHT_MODE_ATTACKED
			 je   .Attacked
			cmp   edx, HIGHLIGHT_MODE_UNGUARDED
			 je   .Unguarded

	.ret:		mov   qword [HighlightMask], rax
			pop   r15 rbx rdi rsi rbp
			ret

.Unguarded:
			mov   ecx, White
		       call   PieceCoverage
			mov   rbx, rax
			mov   ecx, Black
		       call   PieceCoverage
		       andn   rcx, rax, rbx
		       andn   rax, rbx, rax
			and   rcx, qword [rbp+Pos.typeBB+8*White]
			and   rax, qword [rbp+Pos.typeBB+8*Black]
			 or   rax, rcx
			jmp   .ret
.Attacked:
			xor   ecx, ecx
		       call   PieceCoverage
			mov   rbx, qword [rbp+Pos.typeBB+8*Black]
			and   rbx, rax
			mov   ecx, Black
		       call   PieceCoverage
			and   rax, qword [rbp+Pos.typeBB+8*White]
			 or   rax, rbx
			jmp   .ret


.Coverage:	       call   PieceCoverage
			jmp   .ret


.MovesHighlight:
			xor   eax, eax
			lea   rsi, [BoardPos+PosEx.moveList]
			mov   edx, dword [rsi+EMove.move]
		       test   edx, edx
			 jz   .ret
    .NextMove:
			add   rsi, sizeof.EMove
			mov   ecx, edx
			shr   edx, 6
			and   edx, 63
			and   ecx, 63
			cmp   dl, byte [MouseFromSquare]
			jne   @f
			bts   rax, rcx
		 @@:	mov   edx, dword [rsi+EMove.move]
		       test   edx, edx
			jnz   .NextMove
			jmp   .ret


CopyPosExToThread:
	; in: rcx address of destination PosEx
	;     rdx address of destination stateTable
	;     r8  address of source PosEx

		       push   rbx rsi rdi
			mov   rbx, rcx

		; copy the pos except for move list members
			mov   rsi, r8
			mov   rdi, rcx
			mov   ecx, sizeof.PosEx/8
		  rep movsq
			xor   eax, eax
			mov   qword [rbx+PosEx.state], rdx
			mov   qword [rbx+PosEx.stateTable], rdx
			mov   qword [rbx+PosEx.stateEnd], rax
			mov   qword [rbx+PosEx.move], rax
			mov   qword [rbx+PosEx.moveTable], rax
			mov   qword [rbx+PosEx.moveEnd], rax

		; copy the first state member
			mov   rsi, qword [r8+Pos.state]
			mov   rdi, rdx
			mov   ecx, sizeof.State/8
		  rep movsq

	      ;  ; copy movelist
	      ;          lea   rsi, [r8+PosEx.moveList]
	      ;          lea   rdi, [rbx+PosEx.moveList]
	      ;          mov   ecx, MAX_MOVES
	      ;    rep stosq

			pop   rdi rsi rbx
			ret






SetupBoard:
	; rcx address of fen string
		       push   rbp rsi rdi
			mov   rsi, rcx
			lea   rbp, [BoardPos]

if 0
		; state array
		     invoke   VirtualFree, qword [rbp+PosEx.stateTable] , 0, MEM_RELEASE
		     invoke   VirtualAlloc, 0, 256*sizeof.State, MEM_COMMIT, PAGE_READWRITE
			mov   rbx, rax
			mov   qword [rbp+PosEx.state], rax
			mov   qword [rbp+PosEx.stateTable], rax
			add   rax, 256*sizeof.State
			mov   qword [rbp+PosEx.stateEnd], rax


		; move data array
		     invoke   VirtualFree, qword [rbp+PosEx.moveTable] , 0, MEM_RELEASE
		     invoke   VirtualAlloc, 0, 256*sizeof.MoveData, MEM_COMMIT, PAGE_READWRITE
			mov   qword [rbp+PosEx.move], rax
			mov   qword [rbp+PosEx.moveTable], rax
			add   rax, 256*sizeof.MoveData
			mov   qword [rbp+PosEx.moveEnd], rax


		; position string
		     invoke   VirtualFree, qword [rbp+PosEx.szPosTable] , 0, MEM_RELEASE
		     invoke   VirtualAlloc, 0, 256*8, MEM_COMMIT, PAGE_READWRITE
			mov   qword [rbp+PosEx.szPosTable], rax
			mov   qword [rbp+PosEx.szPos], rax
			add   rax, 256*8
			mov   qword [rbp+PosEx.szPosEnd], rax

end if


		lea   rax, [StateArray]
		mov   qword [rbp+PosEx.state], rax
		mov   qword [rbp+PosEx.stateTable], rax
		add   rax, MAX_MOVES_PER_GAME*sizeof.State
		mov   qword [rbp+PosEx.stateEnd], rax
		lea   rax, [MoveDataArray]
		mov   qword[rbp+PosEx.move], rax
		mov   qword[rbp+PosEx.moveTable], rax
		add   rax, MAX_MOVES_PER_GAME*sizeof.MoveData
		mov   qword[rbp+PosEx.moveEnd], rax
		lea   rax, [MoveStringArray]
		mov   qword [rbp+PosEx.szPosTable], rax
		mov   qword [rbp+PosEx.szPos], rax
		add   rax, MAX_MOVES_PER_GAME*8
		mov   qword [rbp+PosEx.szPosEnd], rax



		; set position string
		       call   ParseFEN
			mov   rdi, [rbp+PosEx.szPosTable]
			mov   rax, 'position'
		      stosq
			mov   rax, ' fen '
		      stosq
			sub   rdi, 3
		       call   PrintFen
			mov   rax, ' moves'
		      stosq
			sub   rdi, 2
			mov   qword [rbp+PosEx.szPos], rdi

		; set list of legal moves
			lea   rdi, [rbp+PosEx.moveList]
			mov   rbx, qword [rbp+PosEx.state]
		       call   Gen_Legal
			mov   dword [rdi], 0

			pop   rdi rsi rbp
			ret








