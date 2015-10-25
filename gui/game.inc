





Game_SetInitFromTime:
		mov  eax,dword[Time_TIME+8*White]
		mov  dword[InitTimeWTIME],eax
		mov  eax,dword[Time_TIME+8*Black]
		mov  dword[InitTimeBTIME],eax
		mov  eax,dword[Time_INC+8*White]
		mov  dword[InitTimeWINC],eax
		mov  eax,dword[Time_INC+8*Black]
		mov  dword[InitTimeBINC],eax
		ret

Game_SetTimeFromInit:
		mov  eax,dword[InitTimeWTIME]
		mov  qword[Time_TIME+8*White],rax
		mov  eax,dword[InitTimeBTIME]
		mov  qword[Time_TIME+8*Black],rax
		mov  eax,dword[InitTimeWINC]
		mov  qword[Time_INC+8*White],rax
		mov  eax,dword[InitTimeBINC]
		mov  qword[Time_INC+8*Black],rax
		ret





Game_StopThinkingEngines:
	       push  rbp
		lea  rbp, [BoardPos]
		mov  byte [rbp+PosEx.result], RESULT_INVALID shl 2
		lea  rcx, [Engine1]
	       call  Engine_Quit
		lea  rcx, [Engine2]
	       call  Engine_Quit
		pop  rbp
		ret


Game_StopEngines:
	       push  rbp rdi rsi
		lea  rcx, [Engine1]
	       call  Engine_Stop
		lea  rcx, [Engine2]
	       call  Engine_Stop
		lea  rcx, [Engine3]
	       call  Engine_Stop
		lea  rcx, [Engine4]
	       call  Engine_Stop
		pop  rsi rdi rbp
		ret



Game_MakeThinkString:
	       push  rdi rsi

		lea  rdi,[szCmdThink]
		mov  eax,'go '
	      stosd
		sub  rdi,1

		lea  rsi, [Engine1_MoveString]
		lea  rcx, [Engine2_MoveString]
		cmp  byte[BoardPos+PosEx.sideToMove], 0
	     cmovne  rsi, rcx
	       call  Append
		mov  al,' '
	      stosb

		mov  rax,'wtime '
	      stosq
		sub  rdi,2
		mov  rax, qword [Time_TIME+8*White]
		mov  ecx,200
		cmp  rax,rcx
	      cmovl  rax,rcx
	       call  PrintUnsignedInteger
		mov  al,' '
	      stosb

		mov  rax,'winc '
	      stosq
		sub  rdi,3
		mov  eax,dword[Time_INC+8*White]
	       call  PrintUnsignedInteger
		mov  al,' '
	      stosb

		mov  rax,'btime '
	      stosq
		sub  rdi,2
		mov  rax,qword[Time_TIME+8*Black]
		mov  ecx,200
		cmp  rax,rcx
	      cmovl  rax,rcx
	       call  PrintUnsignedInteger
		mov  al,' '
	      stosb

		mov  rax,'binc '
	      stosq
		sub  rdi,3
		mov  eax,dword[Time_INC+8*Black]
	       call  PrintUnsignedInteger
		mov  al,' '
	      stosb


		mov   byte [rdi],0

		pop  rsi rdi
		ret













Game_StartNewGame:
	; rcx white string
	; rdx white string end
	; r8  black string
	; r9  black string end
	; r10 fen
	; r11 rand

	       push  rbp r14 r15
		mov  r15, r10
		mov  r14, r11
		mov  rsi, rcx
		mov  rdi, rdx
		mov  r12, r8
		mov  r13, r9
	       call  Game_StopThinkingEngines

		mov  rcx, r15
	       call  SetupBoard
	     movdqa  xmm0, dqword[r14]
	     movdqa  dqword[BoardPos+PosEx.rand], xmm0
		mov  rcx, rsi
		mov  rdx, rdi
		mov  r8, r12
		mov  r9, r13
	       call  Game_SetUpPlayers

	       call  PaintGameStatusWindow
	     invoke  SendMessage, qword[hBoardWindow], WM_COMMAND, 0, 0
	     invoke  SendMessage, qword[hEngineWindow], WM_COMMAND, 0, 0

	      movzx  eax, byte[WhiteCompQ]
	       test  eax, eax
		 jz  .NoBookMove
	       call  GetBookMove
		cmp  ax, 'no'
		 je  .NoBookMove

		mov  r15, qword[BoardPos+PosEx.move]
		mov  qword[r15+MoveData.moveUci], rax
		mov  eax, 0x80000000
		mov  qword[r15+MoveData.score], rax  ; write over drawCheck ect
		mov  qword[r15+MoveData.ponderUci], 0
	     invoke  GetTickCount
		mov  qword[r15+MoveData.time1], rax
		mov  qword[r15+MoveData.time2], rax
	       call  MainMakeMove
	     invoke  GetTickCount
		jmp  .WriteTime
.NoBookMove:
	       call  Engine_UpdateMove
.WriteTime:
		mov  r15, qword [BoardPos+PosEx.move]
		mov  qword [r15+MoveData.time1], rax
		mov  qword [r15+MoveData.time2], rax

		pop  r15 r14 rbp
		ret


Game_SetUpPlayers:
	; rcx white string
	; rdx white string end
	; r8  black string
	; r9  black string end

	       push  rsi rdi rbx r12 r13 r14 r15
		mov  r12, rcx
		mov  r13, rdx
		mov  r14, r8
		mov  r15, r9

	       call  Game_StopThinkingEngines
		mov  byte[BoardPos+PosEx.result], RESULT_NONE

		mov  byte[WhiteCompQ],0
		mov  rax,(' Human' shl 8) + CHAR_WKING
		mov  qword[Engine1_Name], rax
	       test  r12, r12
		 jz  .NoEngine1
		mov  byte[WhiteCompQ],-1
		lea  rcx, [Engine1]
	       call  Engine_ClearOutput
		lea  rcx, [Engine1]
		mov  rdx, r12
		mov  r8, r13
	       call  Engine_TurnOnPlayer
.NoEngine1:
		mov  byte[BlackCompQ],0
		mov  rax,(' Human' shl 8) + CHAR_BKING
		mov  qword[Engine2_Name], rax
	       test  r14, r14
		 jz  .NoEngine2
		mov  byte[BlackCompQ],-1
		lea  rcx,[Engine2]
	       call  Engine_ClearOutput
		lea  rcx, [Engine2]
		mov  rdx, r14
		mov  r8, r15
	       call  Engine_TurnOnPlayer
.NoEngine2:
		pop  r15 r14 r13 r12 rbx rsi rdi
		ret




