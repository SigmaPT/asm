

;;;;;;;;;
; mutex ;
;;;;;;;;;

_MutexCreate:
	; rcx: address of critial section object
			sub   rsp, 8*5
		       call   qword [__imp_InitializeCriticalSection]
			add   rsp, 8*5
			ret
_MutexLock:
	; rcx: address of critial section object
			sub   rsp, 8*5
		       call   qword [__imp_EnterCriticalSection]
			add   rsp, 8*5
			ret
_MutexUnlock:
	; rcx: address of critial section object
			sub   rsp, 8*5
		       call   qword [__imp_LeaveCriticalSection]
			add   rsp, 8*5
			ret
_MutexDestroy:
	; rcx: address of critial section object
			sub   rsp, 8*5
		       call   qword [__imp_InitializeCriticalSection]
			add   rsp, 8*5
			ret

;;;;;;;;;
; event ;
;;;;;;;;;

_EventCreate:
	; no arguments
			sub   rsp, 8*5
			xor   ecx, ecx
			xor   edx, edx
			xor   r8d, r8d
			xor   r9d, r9d
		       call   qword [__imp_CreateEvent]
			add   rsp, 8*5
			ret
_EventSignal:
	; rcx: handle
			sub   rsp, 8*5
		       call   qword [__imp_SetEvent]
			add   rsp, 8*5
			ret
_EventWait:
	; rcx: handle
	; rdx: address of critial section object
		       push   rbx rsi
			sub   rsp, 8*5
			mov   rbx, rcx
			mov   rsi, rdx
			mov   rcx, rdx
		       call   qword [__imp_LeaveCriticalSection]
			mov   rcx, rbx
			 or   edx, -1
		       call   qword [__imp_WaitForSingleObject]
			mov   rcx, rsi
		       call   qword [__imp_EnterCriticalSection]
			add   rsp, 8*5
			pop   rsi rbx
			ret
_EventTimedWait:
	; rcx: handle
	; rdx: address of critial section object
	; r8d: ms
		       push   rbx rsi rdi
			sub   rsp, 8*4
			mov   rbx, rcx
			mov   rsi, rdx
			mov   edi, r8d
			mov   rcx, rdx
		       call   qword [__imp_LeaveCriticalSection]
			mov   rcx, rbx
			mov   edx, edi
		       call   qword [__imp_WaitForSingleObject]
			mov   rcx, rsi
		       call   qword [__imp_EnterCriticalSection]
			add   rsp, 8*4
			pop   rdi rsi rbx
			ret
_EventDestroy:
	; rcx: handle
			sub   rsp, 8*5
		       call   qword [__imp_CloseHandle]
			add   rsp, 8*5
			ret

;;;;;;;;;;
; thread ;
;;;;;;;;;;

_ThreadCreate:
	; rcx: start address
	; rdx: parameter to pass
			sub   rsp, 8*7
			mov   r8, rcx
			mov   r9, rdx
			xor   ecx, ecx
			xor   edx, edx
			mov   qword [rsp+8*4], rcx
			mov   qword [rsp+8*5], rcx
		       call   qword [__imp_CreateThread]
			add   rsp, 8*7
			ret
_ThreadJoin:
	; rcx: handle
		       push   rbx
			sub   rsp, 8*4
			mov   rbx, rcx
			 or   edx, -1
		       call   qword [__imp_WaitForSingleObject]
			mov   rcx, rbx
		       call   qword [__imp_CloseHandle]
			add   rsp, 8*4
			pop   rbx
			ret

_ExitProcess:
	; rcx is exit code
			sub   rsp, 8*5
			jmp   qword[__imp_ExitProcess]
_ExitThread:
	; rcx is exit code
			sub   rsp, 8*5
			jmp   qword[__imp_ExitThread]








_Sleep:
	; ecx  ms
			sub   rsp, 8*5
		       call   qword [__imp_Sleep]
			add   rsp, 8*5
			ret



_SetStdHandles:
	; no arguments
			sub   rsp,8*5
			mov   ecx,STD_INPUT_HANDLE
		       call   [__imp_GetStdHandle]
			mov   qword[hStdIn], rax
			mov   ecx,STD_OUTPUT_HANDLE
		       call   [__imp_GetStdHandle]
			mov   qword[hStdOut], rax
			mov   ecx,STD_ERROR_HANDLE
		       call   [__imp_GetStdHandle]
			mov   qword[hStdError], rax
			add   rsp, 8*5
			ret


_SetFrequency:
	; no arguments
			sub   rsp, 8*5
			lea   rcx, [Frequency]
		       call   qword [__imp_QueryPerformanceFrequency]
			mov   dword [rsp], 64
			mov   dword [rsp+8], 1000
		       fild   dword [rsp]
		       fild   dword [rsp+8]
		     fscale
		       fstp   st1
		       fild   qword [Frequency]
		      fdivp   st1, st0
		      fistp   qword [Period]
			add   rsp, 8*5
			ret




_GetTime:
	; out: rax  time in ms
	;      rdx  fractional part of time in ms
			sub   rsp, 8*9
			lea   rcx, [rsp+8*8]
		       call   qword [__imp_QueryPerformanceCounter]
			mov   rax, qword [Period]
			mul   qword [rsp+8*8]
		       xchg   rax, rdx
			add   rsp, 8*9
			ret


_VirtualAlloc:
	; rcx is size
			sub   rsp, 8*5
			mov   rdx, rcx
			xor   ecx, ecx
			mov   r8d, MEM_COMMIT
			mov   r9d, PAGE_READWRITE
		       call   qword [__imp_VirtualAlloc]
			add   rsp, 8*5
			ret


_VirtualFree:
	; rcx is address
			sub   rsp, 8*5
			xor   edx, edx
			mov   r8d, MEM_RELEASE
		       test   rcx, rcx
			 jz   @f
		       call   qword [__imp_VirtualFree]
		   @@:	add   rsp, 8*5
			ret


_WriteOut_Output:
			lea   rcx, [Output]

_WriteOut:
	; in: rcx  address of string start
	;     rdi  address of string end
			sub   rsp, 8*9
			mov   r8, rdi
			sub   r8, rcx
			mov   rdx, rcx
			mov   qword [rsp+8*4], 0
			mov   rcx, qword [hStdOut]
			lea   r9, [rsp+8*8]
		       call   qword [__imp_WriteFile]
			add   rsp, 8*9
			ret


_WriteError:
	; in: rcx  address of string start
	;     rdi  address of string end
			sub   rsp, 8*9
			mov   r8, rdi
			sub   r8, rcx
			mov   rdx, rcx
			mov   qword [rsp+8*4], 0
			mov   rcx, qword [hStdError]
			lea   r9, [rsp+8*8]
		       call   qword [__imp_WriteFile]
			add   rsp, 8*9
			ret



_ReadIn:
	; out: eax =  0 if not file end
	;      eax = -1 if file end
	;      rsi address of string start
	;      rcx address of string end

		       push   rbx
			mov   rsi, qword [InputBuffer]
			mov   rbx, rsi
			sub   rsp, 8*8
.Read:
			mov   rcx, qword [InputBufferSizeB]
			add   rcx, rsi
			cmp   rbx, rcx
		     ;   jae   .ReAlloc
.ReAllocRet:
			mov   rcx, qword [hStdIn]
			mov   rdx, rbx
			mov   r8d, 1
			lea   r9, [rsp+8*6]
			mov   qword [rsp+8*4], 0
		       call   qword [__imp_ReadFile]
			mov   dl, byte [rbx]
			add   rbx, 1
		       test   eax, eax
			jnz   .FileEnd
.Compare:
			cmp   dl, ' '
			jae   .Read

			mov   byte [rbx-1], 0
			xor   eax, eax
.Return:
			mov   rcx, rbx
			add   rsp, 8*8
			pop   rbx
			ret
.FileEnd:
			 or   eax, -1
			cmp   dword [rsp+8*6], 0
			 jz   .Return
			jmp   .Compare
.ReAlloc:
			sub   rcx, rsi
			add   ecx, 4096
			mov   qword [InputBufferSizeB], rcx
		       call   _VirtualAlloc
			mov   rdi, rax
			mov   rcx, rbx
			sub   rcx, rsi
			lea   rbx, [rcx+rax]
		  rep movsb
			mov   rcx, qword [InputBuffer]
			mov   rsi, rax
		       call   _VirtualFree
			mov   qword [InputBuffer], rsi
			jmp   .ReAllocRet






_ErrorBox:
		; rdi points to null terminated string to write to message box
			sub   rsp, 8*7
			lea   rcx, [.user32]
		       call   qword [__imp_LoadLibrary]
			mov   rcx, rax
			lea   rdx, [.MessageBoxA]
		       call   qword [__imp_GetProcAddress]
			xor   ecx, ecx
			mov   rdx, rdi
			lea   r8, [.caption]
			mov   r9d, MB_OK
		       call   rax
			add   rsp, 8*7
			ret

.user32: db 'user32.dll',0
.MessageBoxA: db 'MessageBoxA',0
.caption: db 'error',0


_CheckCPU:
		       push   rbp rbx r15

match =1, CPU_HAS_POPCNT {
			lea   r15, [szCPUError.POPCNT]
			mov   eax, 1
			xor   ecx, ecx
		      cpuid
			and   ecx, (1 shl 23)
			cmp   ecx, (1 shl 23)
			jne   .Failed
}

match =1, CPU_HAS_AVX1 {
			lea   r15, [szCPUError.AVX1]
			mov   eax, 1
			xor   ecx, ecx
		      cpuid
			and   ecx, (1 shl 27)+(1 shl 28)
			cmp   ecx, (1 shl 27)+(1 shl 28)
			jne   .Failed
			mov   ecx, 0
		     xgetbv
			and   eax, 0x06
			cmp   eax, 0x06
			jne   .Failed
}

match =1, CPU_HAS_AVX2 {
			lea   r15, [szCPUError.AVX2]
			mov   eax, 7
			xor   ecx, ecx
		      cpuid
			and   ebx, (1 shl 5)
			cmp   ebx, (1 shl 5)
			jne   .Failed
}

match =1, CPU_HAS_BMI1 {
			lea   r15, [szCPUError.BMI1]
			mov   eax, 7
			xor   ecx, ecx
		      cpuid
			and   ebx, (1 shl 3)
			cmp   ebx, (1 shl 3)
			jne   .Failed
}

match =1, CPU_HAS_BMI2 {
			lea   r15, [szCPUError.BMI2]
			mov   eax, 7
			xor   ecx, ecx
		      cpuid
			and   ebx, (1 shl 8)
			cmp   ebx, (1 shl 8)
			jne   .Failed
}

			pop  r15 rbx rbp
			ret

	.Failed:	lea   rdi, [Output]
			lea   rcx, [szCPUError]
		       call   PrintString
			mov   rcx, r15
		       call   PrintString
			xor   eax,eax
		      stosd
			lea   rdi,[Output]
		       call   _ErrorBox
			xor   ecx,ecx
		       call   _ExitProcess



