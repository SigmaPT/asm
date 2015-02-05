
_ZN10ThreadPool4initEv:
	; rcx: address of ThreadPool

		       push   rdi rsi rbx
			mov   rsi, rcx

		; constructor for ThreadPool
			lea   rcx, [rcx+ThreadPool.mutex]
			mov   qword [rsi+ThreadPool.junk], 0
		       call   _MutexCreate
		       call   _EventCreate
			mov   qword [rsi+ThreadPool.sleepCondition], rax

		; create timer thread
			lea   rax, [timerThread]
			mov   rcx, rax
			mov   rbx, rax
		       call   _ZN10ThreadBaseC2Ev
			lea   rax, [_ZTV11TimerThread+10H]
			mov   qword [rbx+TimerThread.junk], rax
			mov   byte [rbx+TimerThread.run], 0
			mov   rcx, qword [rax+10H]
			mov   rdx, rbx
		       call   _ThreadCreate
			mov   qword [rbx+TimerThread.handle], rax

		; add timer thread to Threads
			mov   qword [rsi+50H], rbx

		; create main thread
			lea   rax, [mainThread]
			mov   rcx, rax
			mov   rbx, rax
		       call   _ZN6ThreadC2Ev
			lea   rax, [_ZTV10MainThread+10H]
			mov   qword [rbx+MainThread.junk], rax
			mov   byte [rbx+MainThread.thinking], 1
			mov   rcx, qword [rax+10H]
			mov   rdx, rbx
		       call   _ThreadCreate
			mov   qword [rbx+MainThread.handle], rax

		; add main thread to Threads vector
			lea   rax, [rbx+sizeof.MainThread]
			mov   qword [rsi+ThreadPool.start], rbx
			mov   qword [rsi+ThreadPool.end], rax

		; create proper number of threads
			mov   rcx, rsi
		       call   _ZN10ThreadPool16read_uci_optionsEv

			pop   rbx rsi rdi
			ret




_ZN10ThreadPool16read_uci_optionsEv:
	; rcx: address of ThreadPool
		       push   rdi rsi rbx
			mov   rbx, rcx

			lea   rax, [uciOptions]
			mov   esi, dword [rax+UciOptions.threads]
			mov   eax, dword [rax+UciOptions.minSplitDepth]
		       test   eax, eax
			jnz   .NoDefault
			cmp   rsi, 8
			sbb   eax, eax
			and   eax, 4-7
			add   eax, 7
.NoDefault:
			mov   dword [rbx+ThreadPool.minSplitDepth], eax
		       imul   esi, sizeof.Thread
			add   rsi, qword [rbx+ThreadPool.start]
.CheckCreate:
			cmp   rsi, qword [rbx+ThreadPool.end]
			 ja   .Create
.CheckDelete:
			cmp   rsi, qword [rbx+ThreadPool.end]
			 jb   .Delete

			pop   rbx rsi rdi
			ret
.Create:
			mov   rax, qword [rbx+ThreadPool.end]
			mov   rdi, rax
			mov   rcx, rax
		       call   _ZN6ThreadC2Ev
			mov   rax, qword [rdi+Thread.junk]
			mov   rcx, qword [rax+10H]
			mov   rdx, rdi
		       call   _ThreadCreate
			lea   rcx, [rdi+sizeof.Thread]
			mov   qword [rbx+ThreadPool.end], rcx
			jmp   .CheckCreate
.Delete:
			lea   rcx, [rdi-sizeof.Thread]
			mov   qword [rbx+ThreadPool.end], rcx
		       call   _ZN12_GLOBAL__N_113delete_threadEP10ThreadBase
			jmp   .CheckDelete




_ZN10ThreadPool4exitEv:
	; rcx: address of threadPool
		       push   rsi rdi rbx
			mov   rsi, rcx
			mov   rcx, qword [rcx+50H]
		       call   _ZN12_GLOBAL__N_113delete_threadEP10ThreadBase
			mov   rbx, qword [rsi+ThreadPool.start]
.Check:
			cmp   qword [rsi+ThreadPool.end], rbx
			jne   .Delete
		; deconstructor for ThreadPool
			mov   rcx, qword [rsi+ThreadPool.sleepCondition]
		       call   _EventDestroy
			lea   rcx, [rsi+ThreadPool.mutex]
		       call   _MutexDestroy
			pop   rbx rdi rsi
			ret
.Delete:
			mov   rcx, rbx
			add   rbx, sizeof.MainThread
		       call   _ZN12_GLOBAL__N_113delete_threadEP10ThreadBase
			jmp   .Check





_ZN10ThreadPool23wait_for_think_finishedEv:
	; rcx: address of threadPool
		       push   rdi rsi rbx
			mov   rsi, qword [rcx+ThreadPool.start]
			mov   rdi, qword [rcx+ThreadPool.sleepCondition]
			lea   rbx, [rsi+MainThread.mutex]
			mov   rcx, rbx
		       call   _MutexLock
			jmp   .Check
.Wait:
			mov   rcx, rdi
			mov   rdx, rbx
		       call   _EventWait
.Check:
		      movzx   edx, byte [rsi+MainThread.thinking]
		       test   dl, dl
			jnz   .Wait
			mov   rcx, rbx
			pop   rbx rsi rdi
			jmp   _MutexUnlock


_ZN10ThreadPool14start_thinkingERK:
	; rcx: address of threadPool
		       push   rbx
			mov   rbx, rcx
		       call   _ZN10ThreadPool23wait_for_think_finishedEv
		       call   _GetTime
			mov   qword [SearchStartTime], rax
			mov   rcx, qword [rbx+ThreadPool.start]
			mov   byte [rcx+MainThread.thinking], 1
		       call   _ZN10ThreadBase10notify_oneEv
			pop   rbx
			ret


