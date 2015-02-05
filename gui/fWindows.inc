_CreateFileRead:  ; rcx string
			sub  rsp,8*11
			mov  edx,GENERIC_READ
			xor  r8,r8
			xor  r9,r9
			mov  qword[rsp+8*4],OPEN_ALWAYS
			mov  qword[rsp+8*5],r8
			mov  qword[rsp+8*6],r8
		       call  qword[CreateFileA]
			add  rsp,8*11
			ret

_CreateFileWrite:  ; rcx string
			sub  rsp,8*11
			mov  edx,GENERIC_WRITE
			xor  r8,r8
			xor  r9,r9
			mov  qword[rsp+8*4],OPEN_ALWAYS
			mov  qword[rsp+8*5],r8
			mov  qword[rsp+8*6],r8
		       call  qword[CreateFileA]
			add  rsp,8*11
			ret



_GetFileSize:  ; rcx handle
			sub  rsp,8*5
			xor  edx,edx
		       call  qword[GetFileSize]
			add  rsp,8*5
			ret


_WriteFile:	; rcx handle
		; rdx buffer
		; r8 byte count
			sub  rsp,8*9
			xor  eax,eax
			lea  r9,[rsp+8*8]	   ; bytes read
			mov  qword[rsp+8*4],rax
		       call  qword[WriteFile]
			add  rsp,8*9
			ret


_ReadFile:	; rcx handle
		; rdx buffer
		; r8 byte count
			sub  rsp,8*9
			xor  eax,eax
			lea  r9,[rsp+8*8]	   ; bytes read
			mov  qword[rsp+8*4],rax
		       call  qword[ReadFile]
			add  rsp,8*9
			ret


_CloseHandle:	; rcx handle
			sub  rsp,8*5
		       call  qword[CloseHandle]
			add  rsp,8*5
			ret




_CreateThread:	; rcx is start address
		; rdx is parameter to pass
			sub  rsp,8*9
			mov  r8,rcx
			mov  r9,rdx
			xor  ecx,ecx
			xor  edx,edx
			mov  qword[rsp+8*4],rcx
			mov  qword[rsp+8*5],rcx
		       call  qword[CreateThread]
			add  rsp,8*9
			ret


_ExitProcess:	; rcx is exit code
			sub  rsp,8*5
		       call  qword[ExitProcess]
		       int3


_ExitThread:	; rcx is exit code
			sub  rsp,8*5
		       call  qword[ExitThread]
		       int3


_GetStdHandles: ; no arguments
			sub  rsp,8*5
			mov  ecx,STD_INPUT_HANDLE
		       call  [GetStdHandle]
			mov  qword[StdIn],rax
			mov  ecx,STD_OUTPUT_HANDLE
		       call  [GetStdHandle]
			mov  qword[StdOut],rax
			mov  ecx,STD_ERROR_HANDLE
		       call  [GetStdHandle]
			mov  qword[StdError],rax
			add  rsp,8*5
			ret


_QueryPerformanceCounter:  ; rcx is address
			sub  rsp,8*5
		       call  qword[QueryPerformanceCounter]
			add  rsp,8*5
			ret


_QueryPerformanceFrequency:  ; no arguments
			sub  rsp,8*5
			lea  rcx,[Frequency]
		       call  qword[QueryPerformanceFrequency]
			add  rsp,8*5
			ret


_ReadIn:	; rsi points to string to write stdin
			sub  rsp,8*7
			xor  eax,eax
			mov  rcx,qword[StdIn]
			mov  rdx,rsi
			mov  r8d,1024
			lea  r9,[temp]
			mov  qword[rsp+8*4],rax
		       call  qword[ReadFile]
			add  rsp,8*7
			ret


_VirtualAlloc:	; rcx is size
			sub  rsp,8*5
			mov  rdx,rcx
			xor  ecx,ecx
			mov  r8d,MEM_COMMIT
			mov  r9d,PAGE_READWRITE
		       call  qword[VirtualAlloc]
			add  rsp,8*5
			ret


_VirtualFree:	; rcx is address
			sub  rsp,8*5
			xor  edx,edx
			mov  r8d,MEM_RELEASE
		       test  rcx,rcx
			 jz  @f
		       call  qword[VirtualFree]
		   @@:	add  rsp,8*5
			ret

_WaitForMultipleObjects:   ; rcx is number of objects
			   ; rdx is address of handle array
			sub  rsp,8*5
			mov  r8d,1
			 or  r9,-1
		       call  qword[WaitForMultipleObjects]
			add  rsp,8*5
			ret




_WriteError:	; rdi points to null terminated string to write to stderr
			sub  rsp,8*7
			mov  rdx,rdi
			 or  ecx,-1
			xor  eax,eax
		repne scasb
			not  ecx
			lea  r8,[rcx-1]
			mov  rcx,qword[StdError]
			lea  r9,[temp]
			mov  qword[rsp+8*4],rax
		       call  qword[WriteFile]
			add  rsp,8*7
			ret


_WriteOut:	; rdi points to null terminated string to write to stdout
			sub  rsp,8*7
			mov  rdx,rdi
			 or  ecx,-1
			xor  eax,eax
		repne scasb
			not  ecx
			lea  r8,[rcx-1]
			mov  rcx,qword[StdOut]
			lea  r9,[temp]
			mov  qword[rsp+8*4],rax
		       call  qword[WriteFile]
			add  rsp,8*7
			ret

