

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
	       call  Person_Enumerate
		pop  r15 r14 r13 rbx rdi rsi rbp
		ret




Person_Enumerate:
	       push  rdi
		xor  edi, edi
	       call  PersonGetFirstNAME
		mov  dword[PersonOffsets+4*rdi], edx
	       test  eax, eax
		 jz  .Done
.Next:
		mov  ecx, edx
	       call  PersonGetNextNAME
		add  edi, 1
		mov  dword[PersonOffsets+4*rdi], edx
	       test  eax, eax
		jnz  .Next
.Done:
		mov  dword[PersonCount], edi
		pop  rdi
		ret



Person_Update:
		; rcx address of string
		; edx length of string
	       push  rbp rsi rdi r12 r13 r14 r15
		mov  r12, rcx
		mov  r13d, edx

		mov  r15d, dword[PersonCount]
		mov  r14d, dword[PersonSelection]

		mov  edx, r13d
		sub  edx, dword[PersonOffsets+4*r14+4]
		add  edx, dword[PersonOffsets+4*r14]
		add  edx, dword[PersonOffsets+4*r15]
	     invoke  VirtualAlloc,0,rdx,MEM_COMMIT,PAGE_READWRITE
		mov  rbp, rax
		mov  rdi, rax

		mov  rsi, qword[PersonText]
		mov  ecx, dword[PersonOffsets+4*r14]
	  rep movsb

		mov  rsi, r12
		mov  ecx, r13d
	  rep movsb

		mov  rsi, qword[PersonText]
		mov  ecx, dword[PersonOffsets+4*r14+4]
		add  rsi, rcx
		sub  ecx, dword[PersonOffsets+4*r15]
		neg  ecx
	  rep movsb

		sub  rdi, rbp
		mov  qword[PersonTextSizeB], rdi
	     invoke  VirtualFree,qword[PersonText],0,MEM_RELEASE
		mov  qword[PersonText], rbp
	       call  Person_Enumerate

.Done:
		pop  r15 r14 r13 r12 rdi rsi rbp
		ret



Person_Clone:
	       push  rbp rsi rdi r14 r15
		mov  r15d, dword[PersonCount]
		mov  r14d, dword[PersonSelection]
		cmp  r15d, 500
		 ja  .Done

		mov  edx, dword[PersonOffsets+4*r14+4]
		sub  edx, dword[PersonOffsets+4*r14]
		add  edx, dword[PersonOffsets+4*r15]
	     invoke  VirtualAlloc,0,rdx,MEM_COMMIT,PAGE_READWRITE
		mov  rbp, rax
		mov  rdi, rax

		mov  rsi, qword[PersonText]
		mov  ecx, dword[PersonOffsets+4*r14+4]
	  rep movsb
		mov  rsi, qword[PersonText]
		mov  ecx, dword[PersonOffsets+4*r14]
		add  rsi, rcx
		sub  ecx, dword[PersonOffsets+4*r15]
		neg  ecx
	  rep movsb

		sub  rdi, rbp
		mov  qword[PersonTextSizeB], rdi
	     invoke  VirtualFree,qword[PersonText],0,MEM_RELEASE
		mov  qword[PersonText], rbp
	       call  Person_Enumerate
.Done:
		pop  r15 r14 rdi rsi rbp
		ret





Person_Delete:
	       push  rbp rsi rdi r14 r15
		mov  r15d, dword[PersonCount]
		mov  r14d, dword[PersonSelection]
		cmp  r15d, 1
		jbe  .Done

		mov  edx, dword[PersonOffsets+4*r15]
		sub  edx, dword[PersonOffsets+4*r14+4]
		add  edx, dword[PersonOffsets+4*r14]
	     invoke  VirtualAlloc,0,rdx,MEM_COMMIT,PAGE_READWRITE
		mov  rbp, rax
		mov  rdi, rax

		mov  rsi, qword[PersonText]
		mov  ecx, dword[PersonOffsets+4*r14]
	  rep movsb
		mov  rsi, qword[PersonText]
		mov  ecx, dword[PersonOffsets+4*r14+4]
		add  rsi, rcx
		sub  ecx, dword[PersonOffsets+4*r15]
		neg  ecx
	  rep movsb

		sub  rdi, rbp
		mov  qword[PersonTextSizeB], rdi
	     invoke  VirtualFree,qword[PersonText],0,MEM_RELEASE
		mov  qword[PersonText], rbp
	       call  Person_Enumerate
.Done:
		pop  r15 r14 rdi rsi rbp
		ret





Person_MoveDown:
	       push  rbp
		mov  ebp, dword[PersonSelection]
		add  ebp, 1
		cmp  ebp, dword[PersonCount]
		jae  .Done
		mov  dword[PersonSelection], ebp
	       call  Person_MoveUp
		mov  dword[PersonSelection], ebp
.Done:
		pop  rbp
		ret

Person_MoveUp:
	       push  rbp rsi rdi r14 r15
		mov  r15d, dword[PersonCount]
		mov  r14d, dword[PersonSelection]
		cmp  r14d, 1
		 jb  .Done
		mov  r8d, dword[PersonOffsets+4*r14]
		sub  r8d, dword[PersonOffsets+4*r14-4]
		mov  r9d, dword[PersonOffsets+4*r14+4]
		sub  r9d, dword[PersonOffsets+4*r14]
		mov  rbp, qword[PersonText]
		lea  rdi, [Message]
		mov  esi, dword[PersonOffsets+4*r14-4]
		add  rsi, rbp
		mov  ecx, r8d
	  rep movsb
		mov  edi, dword[PersonOffsets+4*r14-4]
		add  rdi, rbp
		mov  esi, dword[PersonOffsets+4*r14]
		add  rsi, rbp
		mov  ecx, r9d
	  rep movsb
		mov  rax, rdi
		sub  rax, rbp
		mov  dword[PersonOffsets+4*r14], eax
		lea  rsi, [Message]
		mov  ecx, r8d
	  rep movsb
		sub  r14d, 1
		mov  dword[PersonSelection], r14d
.Done:
		pop  r15 r14 rdi rsi rbp
		ret




SavePersonText:
	       push  rbp rsi rdi rbx r13 r14 r15
	     invoke  CreateFileA,PersonFileString,GENERIC_WRITE,0,0,CREATE_ALWAYS,0,0
		mov  r14,rax
	     invoke  WriteFile,r14,qword[PersonText],qword[PersonTextSizeB],Temp,0
	     invoke  CloseHandle,r14
		pop  r15 r14 r13 rbx rdi rsi rbp
		ret


Person_CopyUntilEndQuote:
	; in/out rcx string start
	; in/out rdx address to write string
	; in  r8 string end
.loop:
		cmp  rcx, r8
		jae  .done
	      movzx  eax, byte[rcx]
		cmp  al,'"'
		 je  .done
		mov  byte[rdx], al
		add  rdx,1
		add  rcx,1
		jmp  .loop
.done:
		ret

Person_GetXXXX:
	; in:  rcx address of string
	;      rdx address of end
	;      r8d 4 byte token XXXX to find
	; out: rax address of text for XXXX entry

	       push  rsi rdi rbx
		mov  rsi, rcx
		mov  rdi, rdx
		mov  ebx, r8d
.next:		mov  rcx, rsi
		mov  rdx, rdi
	       call  _PersonGetNextEntry
		mov  rsi, rcx
	       test  eax, eax
		 jz  .fail
		cmp  eax, ebx
		 je  .done
		jmp  .next

.done:		mov  rax, rsi
		pop  rbx rdi rsi
		ret

.fail:		xor  eax, eax
		pop  rbx rdi rsi
		ret

_PersonGetNextEntry:
;       in: rcx address of start
;           rdx address of end
;       out:  eax "NAME" or "PATH" ...  or 0 if fail
;             rcx address of corresponding text
	       push  rbx
.loop:		cmp  rcx, rdx
		jae  .fail
		mov  eax, 'NAME'
		cmp  dword[rcx], eax
		 je  .found
		mov  eax, 'PATH'
		cmp  dword[rcx], eax
		 je  .found
		mov  eax, 'MOVE'
		cmp  dword[rcx], eax
		 je  .found
		mov  eax, 'OPTN'
		cmp  dword[rcx], eax
		 je  .found
		add  rcx, 1
		jmp  .loop
.found: 	add  rcx, 4
    .loop2:	cmp  rcx, rdx
		jae  .fail
		cmp  byte[rcx-1], '"'
		 je  .done
		add  rdx, 1
		add  ecx, 1
		jmp  .loop2
.fail:		xor  eax, eax
.done:		pop  rbx
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
			mov  eax,'MOVE'
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
			mov  r8, rcx
	    .loop2:	cmp  rdx,qword[PersonTextSizeB]
			jae  .fail
			cmp  byte[rbx+rdx-1],'"'
			 je  .done
			add  rdx,1
			jmp  .loop2
.fail:			xor  eax,eax
.done:			pop  rbx
			ret

PersonGetFirstNAME:
	       push  rbx rdi rsi
		mov  rbx, qword[PersonText]
		xor  ecx, ecx
.Next:
		mov  rdx, qword[PersonTextSizeB]
		xor  eax, eax
		cmp  rcx, rdx
		jae  .Fail
		 or  eax, -1
		cmp  dword[rbx+rcx], 'NAME'
		 je  .Found
		add  ecx, 1
		jmp  .Next
.Found:
		mov  edx, ecx
.Fail:
		pop  rsi rdi rbx
		ret

PersonGetNextNAME:    ; NAME
		      ; in  ecx offset in PersonText
		      ; out  eax -1 or 0 if fail at end
		      ;      rdx offset of next NAME or end
	       push  rbx rdi rsi
		mov  rbx, qword[PersonText]

		mov  esi, ecx
		cmp  rsi, qword[PersonTextSizeB]
		jae  .Fail

		mov  ecx, esi
	       call  PersonGetNextEntry
	       test  eax, eax
		 jz  .Fail
		cmp  eax, 'NAME'
		jne  .Fail
.SearchAgain:
		mov  ecx, edx
	       call  GoUntilEndQuote
		cmp  rcx, qword[PersonTextSizeB]
		jae  .Fail
	       call  PersonGetNextEntry
	       test  eax, eax
		 jz  .Fail
		mov  esi, edx
		cmp  eax, 'NAME'
		jne  .SearchAgain

		 or  eax, -1
		mov  rdx, r8
		pop  rsi rdi rbx
		ret
.Fail:
		mov  rdx, qword[PersonTextSizeB]
		xor  eax, eax
		pop  rsi rdi rbx
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


GoUntilEndQuote:
		      ; in/out rcx offset in PersonText
	       push  rbx
		mov  rbx, qword[PersonText]
.loop:
		cmp  rcx, qword[PersonTextSizeB]
		jae  .done
	      movzx  eax,byte[rbx+rcx]
		cmp  al, '"'
		 je  .done
		add  rcx, 1
		jmp  .loop
.done:
		add  rcx, 1
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






