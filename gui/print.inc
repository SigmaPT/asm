PrintSeconds:
		xor  edx, edx
		mov  ecx, 1000
		div  rcx
	       push  rdx
	       call  PrintUnsignedInteger
		pop  rax
	       test  rax, rax
		jnz  @f
		ret
@@:		mov  ecx, 10
		mov  byte[rdi+0],'.'
		xor  edx, edx
		div  ecx
		add  edx, '0'
		mov  byte[rdi+3],dl
		xor  edx, edx
		div  ecx
		add  edx, '0'
		mov  byte[rdi+2],dl
		xor  edx, edx
		div  ecx
		add  edx, '0'
		mov  byte[rdi+1],dl
		add  rdi, 4
		ret

ParseSeconds:
	       push  rcx rdx rbx
		xor  ecx, ecx
		xor  eax, eax
		xor  edx, edx
		xor  ebx, ebx
.next:		mov  cl,byte[rsi]
	       test  cl,cl
		 jz  .done
		cmp  cl,'.'
		 je  .period
		sub  cl,'0'
		 js  .done
		cmp  cl,9
		 ja  .done
		add  rsi,1
		cmp  ebx, 3
		 ja  .next
	       imul  rax,10
		add  rax,rcx
		add  ebx, edx
		jmp  .next
.done:		cmp  ebx, 3
		jae  .ret
		add  ebx, 1
	       imul  rax, 10
		jmp  .done
.ret:		pop  rbx rdx rcx
		ret
.period:	mov  edx, 1
		add  rsi, 1
		jmp  .next








FixWindowRect:
			mov  rdx,rcx

			xor  ecx,ecx

			mov  eax,dword[rdx+RECT.left]
			cmp  eax,ecx
		      cmovl  eax,ecx
			mov  dword[rdx+RECT.left],eax

			mov  eax,dword[rdx+RECT.top]
			cmp  eax,ecx
		      cmovl  eax,ecx
			mov  dword[rdx+RECT.top],eax

			mov  ecx,200

			mov  eax,dword[rdx+RECT.right]
			cmp  eax,ecx
		      cmovl  eax,ecx
			mov  dword[rdx+RECT.right],eax

			mov  eax,dword[rdx+RECT.bottom]
			cmp  eax,ecx
		      cmovl  eax,ecx
			mov  dword[rdx+RECT.bottom],eax

			ret









_CmpString:	    ; if beginning of string at rsi matches null terminated string at rcx
		   ;    then advance rsi to end of match and return non zero,
		   ;    else return zero and do nothing
		       push  rsi
.Next:		      movzx  eax,byte[rcx]
			lea  rcx,[rcx+1]
			cmp  al,0
			 je  .Found
			cmp  al,byte[rsi]
			lea  rsi,[rsi+1]
			 je  .Next
.NoMatch:		pop  rsi
			xor  eax,eax
			ret
.Found: 		pop  rax
			 or  eax,-1
			ret




SkipWhiteSpaces:
		  @@:	cmp  byte[rsi],' '
			 ja  .done
			cmp  byte[rsi],0
			 je  .done
			add  rsi,1
			jmp  @b
	     .done:	ret



CopyIfNotEmpty:
			cmp  byte[rsi],0
			 je  .Skip
	       @@:    lodsb
		      stosb
		       test  al,al
			jnz  @b
		.Skip:
			ret


CopyTokenSmall: ; token at rsi is copied to rax

			xor  eax,eax
			xor  ecx,ecx

	      @@:	xor  edx,edx
			mov  dl,byte[rsi]
			cmp  dl,' '
			jbe  .done
			shl  rdx,cl
			 or  rax,rdx
			add  ecx,8
			add  rsi,1
			jmp  @b

		.done:

			ret



CopyToken:	; token at rsi is copied to rdi and a space is appended

			cmp  r12d,r13d
			jae  .skip

	      @@:	mov  al,byte[rsi]
			cmp  al,' '
			jbe  .done1
			add  rsi,1
		      stosb
			jmp  @b

	    .done1:	mov  al,' '
		      stosb
			ret


 .skip:
	      @@:	mov  al,byte[rsi]
			cmp  al,' '
			jbe  .done2
			add  rsi,1
			jmp  @b

	    .done2:	ret








AppendNoWhiteSpace:
		 @@:  lodsb
		      stosb
			cmp  al,' '
			 ja  @b
			sub  rdi,1
			ret


Append:
		 @@:  lodsb
		      stosb
			cmp  al,0
			jne  @b
			sub  rdi,1
			ret

AppendNewLine:
		 @@:  lodsb
		      stosb
			cmp  al,0
			jne  @b
			mov  byte[rdi-1],10
			ret





PrintScore:
	; in: ecx score
	; oi: rdi string
			cmp  ecx, 0x80000000
			 je  .book

			cmp  ecx, 1000000000
			 jg  .pmate
			cmp  ecx, -1000000000
			 jl  .nmate

		       test  ecx, ecx
			 jz  .zero
			 js  .neg

			mov  al, '+'
		      stosb
			jmp  .go
.neg:
			mov  al, '-'
		      stosb
			neg  ecx
.zero:
.go:
			mov  eax, ecx
			xor  edx, edx
			mov  ecx, 100
			div  ecx
		       push  rdx
		       call  PrintUnsignedInteger
			mov  al, '.'
		      stosb
			pop  rax
			xor  edx, edx
			mov  ecx, 10
			div  ecx
			add  eax, '0'
		      stosb
			lea  eax, [rdx+'0']
		      stosb
			ret

.nmate:
			mov  eax, '-#'
		      stosw
			mov  eax, 2000000000
			add  eax, ecx
		       call  PrintUnsignedInteger
			ret
.pmate:
			mov  eax, '+#'
		      stosw
			mov  eax, 2000000000
			sub  eax, ecx
		       call  PrintUnsignedInteger
			ret
.book:
			mov  eax, 'book'
		      stosd
			ret



_ParseInteger:	     ; string at rsi, return integer in rax
			xor  ecx,ecx
			xor  eax,eax
			xor  edx,edx
			cmp  byte[rsi],'-'
			 je  .neg
			cmp  byte[rsi],'+'
			 je  .pos
			jmp  .next
	 .neg:		not  rdx
	 .pos:		add  rsi,1
	 .next: 	mov  cl,byte[rsi]
		       test  cl,cl
			 jz  .done
			sub  cl,'0'
			 js  .done
			cmp  cl,9
			 ja  .done
			add  rsi,1
		       imul  rax,10
			add  rax,rcx
			jmp  .next
	.done:		xor  rax,rdx
			sub  rax,rdx
			ret

__PrintUnsignedInteger:       ; rax: number
		       push  rbp rcx rdx
			mov  ecx,10
			mov  rbp,rsp
		.l1:	xor  edx,edx
			div  rcx
		       push  rdx
		       test  rax,rax
			jnz  .l1
		.l2:	pop  rax
			add  al,'0'
		      stosb
			cmp  rsp,rbp
			 jb  .l2
			pop  rdx rcx rbp
			ret


PrintUnsignedIntegerPostfix:	   ; rax: number
		       push  rbx rcx rdx
			xor  edx,edx

			mov  ecx,1000000000
			mov  bl,'B'
		       imul  r8,rcx,1000
			cmp  rax,r8
			 ja  .Postfix

			mov  ecx,1000000
			mov  bl,'M'
		       imul  r8,rcx,1000
			cmp  rax,r8
			 ja  .Postfix

			mov  ecx,1000
			mov  bl,'K'
		       imul  r8,rcx,1000
			cmp  rax,r8
			jbe  .NoPostfix

     .Postfix:		div  rcx
		       call  PrintUnsignedInteger
			mov  al,bl
		      stosb
			pop  rdx rcx rbx
			ret

    .NoPostfix:        call  PrintUnsignedInteger
			pop  rdx rcx rbx
			ret


PrintPercent:
	;in: eax 0-10000
		mov  ecx, 100
		xor  edx, edx
		div  ecx
	       push  rdx
	       call  PrintUnsignedInteger
		mov  al, '.'
	      stosb
		pop  rax
	       call  PrintIntegerMod100
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
