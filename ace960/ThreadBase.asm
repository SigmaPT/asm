_ZN10ThreadBase10notify_oneEv:; Function begin
		       push   rsi
			mov   rsi, rcx
			lea   rcx, [rcx+ThreadBase.mutex]
		       call   _MutexLock
			mov   rcx, qword [rsi+ThreadBase.sleepCondition]
		       call   _EventSignal
			lea   rcx, [rsi+ThreadBase.mutex]
			pop   rsi
			jmp   _MutexUnlock


_ZN10ThreadBase8wait_forERVKb:
		       push   rdi rsi rbx
			lea   rbx, [rcx+ThreadBase.mutex]
			mov   rsi, qword [rcx+ThreadBase.sleepCondition]
			mov   rdi, rdx
			mov   rcx, rbx
		       call   _MutexLock
			jmp   .Check
.Wait:
			mov   rdx, rbx
			mov   rcx, rsi
		       call   _EventWait
.Check:
			mov   al, byte [rdi]
		       test   al, al
			 jz   .Wait
			mov   rcx, rbx
			pop   rbx rsi rdi
			jmp   _MutexUnlock


_ZN10ThreadBaseC2Ev:
		       push   rbx
			lea   rax, [_ZTV10ThreadBase+10H]
			mov   rbx, rcx
			mov   qword [rcx+ThreadBase.junk], rax
			lea   rcx, [rcx+ThreadBase.mutex]
		       call   _MutexCreate
		       call   _EventCreate
			mov   qword [rbx+ThreadBase.sleepCondition], rax
			xor   eax, eax
			mov   qword [rbx+ThreadBase.handle], rax
			mov   byte [rbx+ThreadBase.exit], al
			pop   rbx
			ret

_ZN10ThreadBaseD0Ev: ; first calls 1, then deletes self. no need to delete here, so just call 1
_ZN10ThreadBaseD1Ev: ; same as 2
_ZN10ThreadBaseD2Ev:
		       push   rbx
			lea   rax, [_ZTV10ThreadBase+10H]
			mov   rbx, rcx
			mov   qword [rcx+ThreadBase.junk], rax
			mov   rcx, qword [rcx+ThreadBase.sleepCondition]
		       call   _EventDestroy
			lea   rcx, [rbx+ThreadBase.mutex]
			pop   rbx
			jmp   _MutexDestroy




_ZN12_GLOBAL__N_113delete_threadEP10ThreadBase:
	; rcx: address of Thread
		       push   rbx
			mov   rbx, rcx
			mov   byte [rcx+ThreadBase.exit], 1
		       call   _ZN10ThreadBase10notify_oneEv
			mov   rcx, qword [rbx+ThreadBase.handle]
		       call   _ThreadJoin
			mov   rax, qword [rbx+ThreadBase.junk]
			mov   rcx, rbx
			mov   rdx, qword [rax+8H]
			pop   rbx
			jmp   rdx
