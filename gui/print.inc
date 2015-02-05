
PrintBoard:
	; in: rbp address of Pos
	; io: rdi string

       if 0
			xor  ecx,ecx
       .NextBit:	mov  eax,'P' + (0x0a0d shl 8)
			 bt  qword[rbp+STATE.WPAWNS],rcx
			 jc  .Found
			mov  al,'N'
			 bt  qword[rbp+STATE.WKNIGHTS],rcx
			 jc  .Found
			mov  al,'B'
			 bt  qword[rbp+STATE.WBISHOPS],rcx
			 jc  .Found
			mov  al,'R'
			 bt  qword[rbp+STATE.WROOKS],rcx
			 jc  .Found
			mov  al,'Q'
			 bt  qword[rbp+STATE.WQUEENS],rcx
			 jc  .Found
			mov  al,'K'
			 bt  qword[rbp+STATE.WKING],rcx
			 jc  .Found
			mov  al,'p'
			 bt  qword[rbp+STATE.BPAWNS],rcx
			 jc  .Found
			mov  al,'n'
			 bt  qword[rbp+STATE.BKNIGHTS],rcx
			 jc  .Found
			mov  al,'b'
			 bt  qword[rbp+STATE.BBISHOPS],rcx
			 jc  .Found
			mov  al,'r'
			 bt  qword[rbp+STATE.BROOKS],rcx
			 jc  .Found
			mov  al,'q'
			 bt  qword[rbp+STATE.BQUEENS],rcx
			 jc  .Found
			mov  al,'k'
			 bt  qword[rbp+STATE.BKING],rcx
			 jc  .Found
			mov  al,'*'
			 bt  qword[rbp+STATE.EPSQUARE],rcx
			 jc  .Found
			mov  al,'.'
	  .Found:     stosd
			sub  rdi,3
			add  ecx,1
		       test  ecx,7
			jnz  @f
			add  rdi,2
		  @@:	cmp  ecx,64
			 jb  .NextBit

	end if
			ret



PrintTimeShort:
		       push  r15 r14 r13

		       test   rax,rax
			jns   @f
			mov   byte [rdi], '-'
			add   rdi, 1
			neg   rax
			@@:

			mov   r15, rax
			mov   ecx, 1000
			cmp   rax, rcx
			 jb   .do_ms

			xor   edx,edx
			div   rcx

			mov   ecx, 60
			xor   edx, edx
			div   rcx
			mov   r15, rdx	 ;seconds

			mov   ecx, 60
			xor   edx, edx
			div   rcx
			mov   r14, rdx	 ;minutes

			mov   rax, r14
		       call   PrintUnsignedInteger
			mov   al,':'
		      stosb

			mov  eax,r15d
		       call  PrintIntegerMod100

			pop  r13 r14 r15
			ret

.do_ms: 		mov   eax, '.'
		      stosb
			mov   rax, r15
		       call   PrintIntegerMod1000
			pop   r13 r14 r15
			ret


PrintTime:
		       push  r15 r14 r13

		       test   rax,rax
			jns   @f
			mov   byte [rdi], '-'
			add   rdi, 1
			neg   rax
			@@:

			mov   r15, rax
			mov   ecx, 1000
			cmp   rax, rcx
			 jb   .do_ms

			xor   edx,edx
			div   rcx

			mov   ecx, 60
			xor   edx, edx
			div   rcx
			mov   r15, rdx	 ;seconds

			mov   ecx, 60
			xor   edx, edx
			div   rcx
			mov   r14, rdx	 ;minutes

			mov   ecx, 60
			xor   edx, edx
			div   rcx
			mov   r13, rdx	 ;hours

		       test   r13, r13
			 jz   @f
			mov   rax, r13
		       call   PrintUnsignedInteger
			mov   al,':'
		      stosb
		@@:

			mov   rax, r14
		       call   PrintUnsignedInteger
			mov   al,':'
		      stosb

			mov  eax,r15d
		       call  PrintIntegerMod100

			pop  r13 r14 r15
			ret

.do_ms: 		mov   eax, '.'
		      stosb
			mov   rax, r15
		       call   PrintIntegerMod1000
			pop   r13 r14 r15
			ret


PrintIntegerMod1000:
			xor  edx,edx
			mov  ecx,100
			div  ecx
			add  eax,'0'
		      stosb
			mov  eax,edx
PrintIntegerMod100:
			xor  edx,edx
			mov  ecx,10
			div  ecx
			add  eax,'0'
		      stosb
			lea  eax,[rdx+'0']
		      stosb
			ret





_PrintUnsignedInteger:	     ; eax: number
		       push  rbp rcx rdx
			mov  ecx,10
			mov  rbp,rsp
		.l1:	xor  edx,edx
			div  rcx
		       push  rdx
		       test  eax,eax
			jnz  .l1
		.l2:	pop  rax
			add  al,'0'
		      stosb
			cmp  rsp,rbp
			 jb  .l2
			pop  rdx rcx rbp
			ret

		      align  16
PrintGroupedInteger:  ; eax: number
		      ; edi: string result
		       push  rbx rbp rcx rdx
			mov  ecx,10
			mov  ebx,4
			mov  ebp,esp
		.l1:	xor  edx,edx
			div  rcx
			sub  ebx,1
			jnz  @f
		       push  ','-'0'
			mov  ebx,3
		 @@:   push  rdx
		       test  rax,rax
			jnz  .l1
		.l2:	pop  rax
			add  al,'0'
		      stosb
			cmp  rsp,rbp
			 jb  .l2
			pop  rdx rcx rbp rbx
			ret
