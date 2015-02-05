


StopKibitzer:	       push  rbp rdi rsi

			lea  rbp, [BoardPos]

			mov  byte[Engine3_GoingQ],0
			mov  byte[Engine4_GoingQ],0

			cmp  dword[Engine3_On],0
			 je  .NoEngine3
			lea  rcx,[Engine3]
		       call  Engine_Stop
      .NoEngine3:

			cmp  dword[Engine4_On],0
			 je  .NoEngine4
			lea  rcx,[Engine4]
		       call  Engine_Stop
      .NoEngine4:

      .Done:

			pop  rsi rdi rbp
			ret



Engine_UpdateKibitzer:
		       push   rbp
			mov   rbp, rcx
			mov   byte [rbp-Engine1+Engine1_GoingQ], 0
		       call   Engine_Stop
			mov   rcx, rbp
		       call   Engine_Position
			mov   rcx, rbp
		       call   Engine_ClearOutput
			mov   rcx, rbp
		       call   Engine_GoInfinite
			mov   byte [rbp-Engine1+Engine1_GoingQ], -1
			pop   rbp
			ret

Engine_UpdatePlayer:
		       push   rbp
			mov   rbp, rcx
			mov   byte [rbp-Engine1+Engine1_GoingQ], 0
		       call   Engine_Position
			mov   rcx, rbp
		       call   Engine_ClearOutput
			mov   rcx, rbp
		       call   Engine_Think
			mov   byte [rbp-Engine1+Engine1_GoingQ], -1
			pop   rbp
			ret


Engine_UpdateCoach:
		       push  rbp

		;        lea  rbp,[BoardPosition]
		;        lea  rdi,[rbp+POS.MOVE_LIST]
		;
		;        mov  rax,qword[rbp+POS.STATE_PTR]
		;        cmp  byte[rax+STATE.RESULT],0
		;        jne  .Illegal
		;
		;       call  Generate_Legal


			pop  rbp
			ret





