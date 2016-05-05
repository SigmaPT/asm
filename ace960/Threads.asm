
ThreadPool_Init:
		       push   rdi rsi rbx
			lea   rbx, [threadPool]
			lea   rcx, [mainThread]
			mov   qword[rbx+ThreadPool.stackpointer], rcx
		       call   Thread_Create
			mov   rcx, rbx
		       call   ThreadPool_ReadOptions
			pop   rbx rsi rdi
			ret


ThreadPool_Exit:
		       push   rsi rdi rbx
			lea   rbx, [threadPool]
			mov   rdi, qword[rbx+ThreadPool.stackpointer]
			lea   rsi, [mainThread]
	.Delete:
			mov   rcx, rdi
			add   rdi, sizeof.Thread
		       call   Thread_Delete
			cmp   rdi, rsi
			jbe   .Delete
			pop   rbx rdi rsi
			ret


ThreadPool_ReadOptions:
		       push   rsi rdi rbx
			lea   rbx, [threadPool]
			mov   rdi, qword[rbx+ThreadPool.stackpointer]
			mov   esi, dword[uciOptions+UciOptions.threads]
			sub   esi, 1
		       imul   esi, sizeof.Thread
			neg   rsi
			lea   rsi, [rsi+mainThread]
.CheckCreate:
			cmp   rdi, rsi
			 ja   .Create
.CheckDelete:
			cmp   rdi, rsi
			 jb   .Delete
			mov   qword[rbx+ThreadPool.stackpointer], rdi
			pop   rbx rdi rsi
			ret
.Create:
			sub   rdi, sizeof.Thread
			mov   rcx, rdi
		       call   Thread_Create
			jmp   .CheckCreate
.Delete:
			mov   rcx, rdi
			add   rdi, sizeof.Thread
		       call   Thread_Delete
			jmp   .CheckDelete





ThreadPool_StartThinking:
		       push   rsi rdi rbx

			lea   rcx, [mainThread]
		       call   Thread_WaitForSearchFinished

			xor   eax, eax
			mov   byte[Signals.stop], al
			mov   byte[Signals.stopOnPonderhit], al

			lea   rcx, [mainThread+Thread.rootPos]
			mov   dword[rcx+Pos.rootMovesSize], eax

		       call   Position_CopyToThread

			lea   rcx, [mainThread]
		       call   Thread_StartSearching

			pop   rbx rdi rsi
			ret















Thread_Create:
	; rcx: address of Thread struct
		       push   rsi rdi rbx
			mov   rbx, rcx

			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexCreate
		       call   _EventCreate
			mov   qword[rbx+Thread.sleepCondition], rax
		       call   _EventCreate
			mov   qword[rbx+Thread.sleepCondition2], rax

			xor   eax, eax
			mov   byte[rbx+Thread.exit], al
			mov   byte[rbx+Thread.rootPos+Pos.resetCalls], al
			mov   dword[rbx+Thread.rootPos+Pos.callsCnt], eax
			lea   rax, [mainThread]
			sub   rax, rbx
			xor   edx, edx
			mov   ecx, sizeof.Thread
			div   ecx
			mov   dword[rbx+Thread.idx], eax
		     Assert   e, edx, 0, 'weird remainder Thread_Create'

			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexLock

			mov   byte[rbx+Thread.searching], -1

			lea   rcx, [Thread_IdleLoop]
			mov   rdx, rbx
		       call   _ThreadCreate

			jmp   .check
	.wait:
			mov   rcx, qword[rbx+Thread.sleepCondition2]
			lea   rdx, [rbx+Thread.mutex]
		       call   _EventWait
	.check:
			mov   al, byte[rbx+Thread.searching]
		       test   al, al
			jnz   .wait

			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexUnlock

			pop   rbx rdi rsi
			ret


Thread_Delete:
	; rcx: address of Thread struct
		       push   rsi rdi rbx
			mov   rbx, rcx
			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexLock
			mov   byte [rbx+Thread.exit], -1
			mov   rcx, qword[rbx+Thread.sleepCondition]
		       call   _EventSignal
			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexUnlock
			mov   rcx, qword[rbx+Thread.handle]
		       call   _ThreadJoin
			mov   rcx, qword[rbx+Thread.sleepCondition2]
		       call   _EventDestroy
			mov   rcx, qword[rbx+Thread.sleepCondition]
		       call   _EventDestroy
			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexDestroy
			pop   rbx rdi rsi
			ret


Thread_IdleLoop:
	; rcx: address of Thread struct
		       push   rsi rdi rbx
			mov   rbx, rcx
			lea   rbp, [Thread_Search]
			lea   rdx, [MainThread_Search]
			lea   rax, [mainThread]
			cmp   rcx, rax
		      cmove   rbp, rdx
			mov   rsi, qword[rbx+Thread.sleepCondition]
			mov   rdi, qword[rbx+Thread.sleepCondition2]
	       DebugDisplay   'Thread_IdleLoop start'
			jmp   .check_out
.loop:
		       call   rbp

			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexLock
			mov   byte[rbx+Thread.searching], 0
	.check_exit:
			mov   al, byte[rbx+Thread.exit]
		       test   al, al
			jnz   .unlock
			mov   rcx, rdi
		       call   _EventSignal
			mov   rcx, rsi
			lea   rdx, [rbx+Thread.mutex]
		       call   _EventWait
			mov   al, byte[rbx+Thread.searching]
		       test   al, al
			 jz   .check_exit
	.unlock:
			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexUnlock
.check_out:
			mov   al, byte[rbx+Thread.exit]
		       test   al, al
			 jz   .loop

	       DebugDisplay   'Thread_IdleLoop finish'
			xor   ecx, ecx
		       call   _ExitThread
		       int3




Thread_StartSearching:
	; rcx: address of Thread struct
		       push   rbx
			mov   rbx, rcx
			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexLock
			mov   byte[rbx+Thread.searching], -1
	.sleep:
			mov   rcx, qword[rbx+Thread.sleepCondition]
		       call   _EventSignal
			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexUnlock
			pop   rbx
			ret

Thread_StartSearching_TRUE:
	; rcx: address of Thread struct
		       push   rbx
			mov   rbx, rcx
			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexLock
			jmp   Thread_StartSearching.sleep



Thread_WaitForSearchFinished:
	; rcx: address of Thread struct
		       push   rsi rdi rbx
			mov   rbx, rcx
			mov   rsi, qword[rbx+Thread.sleepCondition2]
			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexLock
			jmp   .check
	.wait:
			mov   rcx, rsi
			lea   rdx, [rbx+Thread.mutex]
		       call   _EventWait
	.check:
			mov   al, byte[rbx+Thread.searching]
		       test   al, al
			jnz   .wait

			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexUnlock
			pop   rbx rdi rsi
			ret



Thread_Wait:
	; rcx: address of Thread struct
	; rdx: address of bool
		       push   rsi rdi rbx
			mov   rbx, rcx
			mov   rdi, rdx
			mov   rsi, qword[rbx+Thread.sleepCondition]
			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexLock
			jmp   .check
	.wait:
			mov   rcx, rsi
			lea   rdx, [rbx+Thread.mutex]
		       call   _EventWait
	.check:
			mov   al, byte[rdi]
		       test   al, al
			 jz   .wait

			lea   rcx, [rbx+Thread.mutex]
		       call   _MutexUnlock
			pop   rbx rdi rsi
			ret