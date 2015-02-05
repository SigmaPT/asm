

LoadPersonText:
		       push  rbp rsi rdi rbx r13 r14 r15
		     invoke  VirtualFree,qword[PersonText],0,MEM_RELEASE
		     invoke  CreateFileA,PersonFileString,GENERIC_READ,0,0,OPEN_ALWAYS,0,0
			mov  r14,rax
		     invoke  GetFileSize,r14,NULL
			mov  qword[PersonTextSizeB],rax
			lea  rdx,[rax+10]
		     invoke  VirtualAlloc,0,rdx,MEM_COMMIT,PAGE_READWRITE
			mov  r15,rax
			mov  qword[PersonText],rax
		     invoke  ReadFile,r14,r15,qword[PersonTextSizeB],Temp,0
		     invoke  CloseHandle,r14
			pop  r15 r14 r13 rbx rdi rsi rbp
			ret

SavePersonText:
		       push  rbp rsi rdi rbx r13 r14 r15
		     invoke  CreateFileA,PersonFileString,GENERIC_WRITE,0,0,CREATE_ALWAYS,0,0
			mov  r14,rax
		     invoke  WriteFile,r14,qword[PersonText],qword[PersonTextSizeB],Temp,0
		     invoke  CloseHandle,r14

			pop  r15 r14 r13 rbx rdi rsi rbp
			ret


PersonGetNAME:
		      ; in  ecx index of computer personality
		      ; out eax offset of start of corresponding NAME string in PersonText
		      ;          -1 for fail
		       push  rsi rdi rbx
			mov  edi,ecx
			xor  ebx,ebx
			xor  esi,esi
       .next:		mov  ecx,ebx
		       call  PersonGetNextEntry
			mov  ebx,edx
		       test  eax,eax
			 jz  .fail
			cmp  eax,'NAME'
			jne  .next
			add  esi,1
			cmp  esi,edi
			 ja  .fail
			 je  .done
			jmp  .next

.done:
			mov  eax,ebx

			pop  rbx rdi rsi
			ret

.fail:			 or  rax,-1
			pop  rbx rdi rsi
			ret


PersonGetXXXXFromNAME:
			; in:  ecx offset in person string
			;      edx 4 byte token XXXX to find
			; out: eax offset of text for XXXX entry


		       push  rsi rdi rbx

			mov  edi,edx
			mov  ebx,ecx
       .next:		mov  ecx,ebx
		       call  PersonGetNextEntry
			mov  ebx,edx
		       test  eax,eax
			 jz  .fail
			cmp  eax,'NAME'
			 je  .fail
			cmp  eax,edi
			 je  .done
			jmp  .next

.done:			mov  eax,ebx
			pop  rbx rdi rsi
			ret

.fail:			 or  rax,-1
			pop  rbx rdi rsi
			ret



PersonGetNextEntry:	; NAME PATH OPTN DESC PLAY RATE
		      ; in rcx offset in PersonText
		      ; out  eax "NAME" or "PATH" ...  or 0 if fail
		      ;      rdx offset of start of corresponding string
		       push  rbx
			mov  rbx,qword[PersonText]
		.loop:	cmp  rcx,qword[PersonTextSizeB]
			jae  .fail
			mov  eax,'NAME'
			cmp  dword[rbx+rcx],eax
			 je  .found
			mov  eax,'PATH'
			cmp  dword[rbx+rcx],eax
			 je  .found
			mov  eax,'OPTN'
			cmp  dword[rbx+rcx],eax
			 je  .found
			mov  eax,'DESC'
			cmp  dword[rbx+rcx],eax
			 je  .found
			mov  eax,'PLAY'
			cmp  dword[rbx+rcx],eax
			 je  .found
			mov  eax,'RATE'
			cmp  dword[rbx+rcx],eax
			 je  .found
			mov  eax,'LOGO'
			cmp  dword[rbx+rcx],eax
			 je  .found
			add  rcx,1
			jmp  .loop
.found: 		lea  rdx,[rcx+5]
	    .loop2:	cmp  rdx,qword[PersonTextSizeB]
			jae  .fail
			cmp  byte[rbx+rdx-1],'"'
			 je  .done
			add  rdx,1
			jmp  .loop2
.fail:			xor  eax,eax
.done:			pop  rbx
			ret


CopyUntilEndQuote:
		      ; in/out rcx offset in PersonText
		      ; in/out rdx address to write string

		       push  rbx
			mov  rbx,qword[PersonText]
		.loop:	cmp  rcx,qword[PersonTextSizeB]
			jae  .done
		      movzx  eax,byte[rbx+rcx]
			cmp  al,'"'
			 je  .done
			mov  byte[rdx],al
			add  rdx,1
			add  rcx,1
			jmp  .loop
		 .done:
			pop  rbx
			ret





CopyUntilEndQuoteWithNewLine:
		      ; in/out rcx offset in PersonText
		      ; in/out rdi address to write string

		       push  rbx
			mov  rbx,qword[PersonText]
		.loop:	cmp  rcx,qword[PersonTextSizeB]
			jae  .done
		      movzx  eax,byte[rbx+rcx]
			cmp  al,'"'
			 je  .done
			mov  byte[rdi],al
			add  rdi,1
			add  rcx,1
			jmp  .loop
		 .done:
			mov  byte[rdi],10
			add  rdi,1
			pop  rbx
			ret






