







PrintUciMove:	   ; in: ecx move
		   ; out: rax move string
		   ;      edx byte length of move string  4 or 5 for promotions

			xor  eax,eax

			mov  edx,ecx
			and  edx,7
			add  edx,'a'
			shl  edx,16
			 or  eax,edx

			mov  edx,ecx
			shr  edx,3
			and  edx,7
			xor  edx,7
			add  edx,'1'
			shl  edx,24
			 or  eax,edx

			mov  edx,ecx
			shr  edx,6
			and  edx,7
			add  edx,'a'
		      ;  shl  edx,0
			 or  eax,edx

			mov  edx,ecx
			shr  edx,6+3
			and  edx,7
			xor  edx,7
			add  edx,'1'
			shl  edx,8
			 or  eax,edx

			mov  edx,ecx
			shr  edx,12
			and  edx,15
			cmp  edx,MOVE_TYPE_PROM
			 je  .Promotion
			mov  edx,4
			ret

	.Promotion:
			mov  edx,ecx
			shr  edx,16+3
			and  edx,7
		      movzx  edx,byte[@f+rdx]
			shl  rdx,32
			 or  rax,rdx
			mov  edx,5
			ret

	@@: db '??nbrq??'



PrintHex64:	bswap  rcx
		movq  xmm0,rcx
		call  hexa_to_ascii_common
	      movdqu  dqword[rdi],xmm1
		 add  rdi,16
		 ret

hexa_to_ascii_common:
	movdqa	xmm3,dqword [.Sum1]
	movdqa	xmm4,dqword [.Comp1]
	movdqa	xmm2,dqword [.Mask1]
	movdqa	xmm5,dqword [.Num1]
	movdqa	xmm1,xmm0
	psrlq	xmm0,4
	pand	xmm0,xmm2
	pand	xmm1,xmm2
	punpcklbw	xmm0,xmm1
	movdqa	xmm1,xmm0
	pcmpgtb xmm0,xmm4
	pand	xmm0,xmm5
	paddb	xmm1,xmm3
	paddb	xmm1,xmm0
	ret

align 16
  .Sum1  dq 3030303030303030h, 3030303030303030h
  .Mask1 dq 0f0f0f0f0f0f0f0fh, 0f0f0f0f0f0f0f0fh
  .Comp1 dq 0909090909090909h, 0909090909090909h
  .Num1  dq 0707070707070707h, 0707070707070707h




PrintUnsignedInteger:; in: rax unsigned integer
		     ; out: rdi string
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


PrintSignedInteger:  ; in: rax signed integer
		     ; out: rdi string
		       push  rbp rcx rdx
			mov  ecx,10
			mov  rbp,rsp
			mov  byte[rdi],'+'
			add  rdi,1
		       test  rax,rax
			jns  .l1
			mov  byte[rdi-1],'-'
			neg  rax
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






