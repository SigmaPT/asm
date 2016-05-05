ParseGo:	       push   rbx

			xor   eax, eax
			mov   ecx, 60000
			mov   qword [MoveTime], rax
			mov   qword [WTime], rcx
			mov   qword [BTime], rcx
			mov   qword [WInc], rax
			mov   qword [BInc], rax
			mov   dword [MovesToGo], 32
			mov   dword [Limits.depth], -1
			mov   dword [Limits.alpha], -VALUE_INFINITE
			mov   dword [Limits.beta], VALUE_INFINITE
			mov   byte [Limits.useTmgr], -1

	 .ReadLoop:
		       call   SkipSpaces
			cmp   byte [rsi], ' '
			 jb   .ReadLoopDone
		     szcall   CmpString, 'alpha'
		       test   eax, eax
			jnz   .alpha
		     szcall   CmpString, 'beta'
		       test   eax, eax
			jnz   .beta
		     szcall   CmpString, 'wtime'
		       test   eax, eax
			jnz   .wtime
		     szcall   CmpString, 'btime'
		       test   eax, eax
			jnz   .btime
		     szcall   CmpString, 'winc'
		       test   eax, eax
			jnz   .winc
		     szcall   CmpString, 'binc'
		       test   eax, eax
			jnz   .binc
		     szcall   CmpString, 'movestogo'
		       test   eax, eax
			jnz   .movestogo
		     szcall   CmpString, 'ponder'
		       test   eax, eax
			jnz   .ponder
		     szcall   CmpString, 'movetime'
		       test   eax, eax
			jnz   .movetime
		     szcall   CmpString, 'depth'
		       test   eax, eax
			jnz   .depth
		     szcall   CmpString, 'infinite'
		       test   eax, eax
			jnz   .infinite
		       call   SkipToken
			jmp   .ReadLoop
	.ReadLoopDone:

			mov   rax, qword [MoveTime]
		       test   rax, rax
			jnz   .Return

			mov   ecx, dword [rbp+Pos.sideToMove]
		       fild   dword [MovesToGo]
		       fild   qword [WTime+8*rcx]
		       fild   qword [WInc+8*rcx]
		       fld1
		      fsubr   st0, st3
		      fmulp   st1, st0
		      faddp   st1, st0
		     fdivrp   st1, st0
		       push   rax
		      fistp   qword [rsp]
			pop   rax

    .Return:		xor   ecx, ecx
		       test   rax, rax
		      cmovs   rax, rcx
			mov   qword [AlottedTime], rax


			lea   rcx, [threadPool]
		       call   _ZN10ThreadPool14start_thinkingERK

			pop   rbx
			ret

	.alpha:        call  SkipSpaces
		       call  ParseInteger
			mov  dword [Limits.alpha], eax
			jmp  .ReadLoop

	.beta:	       call  SkipSpaces
		       call  ParseInteger
			mov  dword [Limits.beta], eax
			jmp  .ReadLoop



	.wtime:        call  SkipSpaces
		       call  ParseInteger
			mov  qword [WTime], rax
			jmp  .ReadLoop

	.btime:        call  SkipSpaces
		       call  ParseInteger
			mov  qword [BTime], rax
			jmp  .ReadLoop

	.winc:	       call  SkipSpaces
		       call  ParseInteger
			mov  qword [WInc], rax
			jmp  .ReadLoop

	.binc:	       call  SkipSpaces
		       call  ParseInteger
			mov  qword [BInc], rax
			jmp  .ReadLoop

	.ponder:       call  SkipSpaces
			jmp  .ReadLoop

	.depth:        call  SkipSpaces
		       call  ParseInteger
			mov  dword [Limits.depth], eax
			jmp  .ReadLoop

	.infinite:     call  SkipSpaces
			 or  eax,-1
			mov  qword [MoveTime], rax
			jmp  .ReadLoop

	.movetime:     call  SkipSpaces
		       call  ParseInteger
			mov  qword [MoveTime], rax
			jmp  .ReadLoop

	.movestogo:    call  SkipSpaces
		       call  ParseInteger
			cmp  eax,1
			adc  eax,1
			mov  dword [MovesToGo], eax
			jmp  .ReadLoop
