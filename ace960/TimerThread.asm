




_ZN11TimerThread9idle_loopEv:
	; in: rcx address of timerThread
		       push   rbx rdi rsi
			mov   rbx, rcx

			jmp   .CheckExit
.Loop:
			lea   rcx, [rbx+TimerThread.mutex]
		       call   _MutexLock
			cmp   byte [rbx+TimerThread.exit], 0
			jne   .ExitTrue
			mov   rcx, qword [rbx+TimerThread.sleepCondition]
			lea   rdx, [rbx+TimerThread.mutex]
			cmp   byte [rbx+TimerThread.run], 1
			sbb   r8d, r8d
			and   r8d, -1-Timer_Resolution
			add   r8d, Timer_Resolution
		       call   _EventTimedWait
.ExitTrue:
			lea   rcx, [rbx+TimerThread.mutex]
		       call   _MutexUnlock
			cmp   byte [rbx+TimerThread.run], 0
			jnz   .CheckTime
.CheckExit:
			cmp   byte [rbx+TimerThread.exit], 0
			 je   .Loop
			pop   rsi rdi rbx
			ret		; exit thread

.CheckTime:
		       call   _GetTime
			sub   rax, qword [SearchStartTime]
			cmp   rax, [AlottedTime]
			 jl   @f

			mov   byte [Signals.stop], 1
		@@:

			jmp   .CheckExit


_ZN11TimerThreadD1Ev:; Function begin
	lea	rax, [_ZTV11TimerThread+10H]
	mov	qword [rcx+TimerThread.junk], rax
	jmp	_ZN10ThreadBaseD2Ev

_ZN11TimerThreadD0Ev:; Function begin
	push	rbx
	sub	rsp, 32
	mov	rbx, rcx
	call	_ZN11TimerThreadD1Ev
	mov	rcx, rbx
	add	rsp, 32
	pop	rbx
	jmp	_ZdlPv

