

_ZN10MainThread9idle_loopEv:
	; rcx: address of mainThread
		       push   rdi rsi rbx
			lea   rsi, [rcx+MainThread.mutex]
			mov   rdi, qword[rcx+MainThread.sleepCondition]
			mov   rbx, rcx
	       DebugDisplay   '_ZN10MainThread9idle_loopEv start'
._006:
			mov   rcx, rsi
		       call   _MutexLock
			mov   byte [rbx+MainThread.thinking], 0
._007:
		      movzx   eax, byte [rbx+MainThread.thinking]
		       test   al, al
			jnz   ._008
		      movzx   edx, byte [rbx+MainThread.exit]
		       test   dl, dl
			jnz   ._008
			mov   rcx, qword [threadPool+ThreadPool.sleepCondition]
		       call   _EventSignal
	       DebugDisplay   '_ZN10MainThread9idle_loopEv before wait'
			mov   rdx, rsi
			mov   rcx, rdi
		       call   _EventWait
	       DebugDisplay   '_ZN10MainThread9idle_loopEv after wait'
			jmp   ._007
._008:
			mov   rcx, rsi
		       call   _MutexUnlock
		      movzx   ecx, byte [rbx+MainThread.exit]
		       test   cl, cl
			jnz   ._009
			mov   byte [rbx+MainThread.searching], 1
		       call   _ZN6Search5thinkEv
			mov   byte [rbx+MainThread.searching], 0
			jmp   ._006
._009:
	       DebugDisplay   '_ZN10MainThread9idle_loopEv end'
			pop   rbx rsi rdi
			ret





_ZN10MainThreadD0Ev:; first calls 1, then deletes self. no need to delete here, so just call 1
_ZN10MainThreadD1Ev:; Function begin
			lea   rax, [_ZTV10MainThread+10H]
			mov   qword [rcx+MainThread.junk], rax
			jmp   _ZN6ThreadD2Ev


