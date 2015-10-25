
PAGE_SIZE = 4*1024

___chkstk_ms:
	push	rcx
	push	rax
	cmp	rax, PAGE_SIZE
	lea	rcx, [rsp + 24]
	jb	._LessThanAPage
._MoreThanAPage:
	sub	rcx, PAGE_SIZE
	or	rcx, 0
	sub	rax, PAGE_SIZE
	cmp	rax, PAGE_SIZE
	ja	._MoreThanAPage
._LessThanAPage:
	sub	rcx, rax
	or	byte[rcx], 0
	pop	rax
	pop	rcx
	ret



GetRand:      ; get 16 random bits in ax
		     movdqa  xmm0,dqword[RandSeed]
		     movdqa  xmm1,xmm0
		     movdqa  xmm2,xmm0
		     pslldq  xmm1,1
		     psrldq  xmm2,15
			por  xmm1,xmm2
		     movdqa  xmm2,xmm0
		      psllq  xmm2,1
			por  xmm1,xmm2
		     movdqa  xmm2,xmm0
		     movdqa  xmm3,xmm0
		     psrldq  xmm2,1
		     pslldq  xmm3,15
			por  xmm2,xmm3
		     movdqa  xmm3,xmm0
		      psrlq  xmm3,1
		       pxor  xmm2,xmm3
			por  xmm0,xmm1
		       pxor  xmm0,xmm2
		   pmovmskb  eax,xmm0
		      paddq  xmm0,dqword[RandInc]
		     movdqa  dqword[RandSeed],xmm0
			ret



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



CmpString:	   ; if beginning of string at rsi matches null terminated string at rcx
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


CmpStringCaseLess:
		   ; if beginning of string at rsi matches null terminated string at rcx
		   ;    then advance rsi to end of match and return non zero,
		   ;    else return zero and do nothing
		       push  rsi
.Next:		      movzx  eax,byte[rcx]
			mov  edx,eax
			cmp  eax,64
			 jb  @f
			cmp  eax,128
			jae  @f
		      movzx  edx,byte[.SwitchCase+rax-64]
		@@:	lea  rcx,[rcx+1]
			cmp  al,0
			 je  .Found
			cmp  al,byte[rsi]
			lea  rsi,[rsi+1]
			 je  .Next
			cmp  dl,byte[rsi-1]
			 je  .Next

.NoMatch:		pop  rsi
			xor  eax,eax
			ret
.Found: 		pop  rax
			 or  eax,-1
			ret

.SwitchCase:	db '@abcdefghijklmnopqrstuvwxyz[\]^_'
		db '`ABCDEFGHIJKLMNOPQRSTUVWXYZ{|}~',127




		@@:	add  rsi,1
SkipSpaces:	; skip spaces of string at rsi
			cmp  byte[rsi],' '
			 je @b
			ret




		@@:	add  rsi,1
SkipToken:   ; skip characters of string at rsi
		      movzx  eax,byte[rsi]
			 bt  [.TokenCharacters],rax
			 jc @b
			ret
 .TokenCharacters:  dd 00000000000000000000000000000000b
		    dd 00000011111111110000000000000000b
		    dd 00000111111111111111111111111110b
		    dd 00000111111111111111111111111110b




ParseInteger:	    ; in: rsi string
		    ; out: rax signed integer
		       push  rcx rdx
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
			pop  rdx rcx
			ret


CheckCPU:	       push  rbp rbx r15

if HAVE and HAVE_POPCNT
			lea  r15,[szCPUError.POPCNT]
			mov  eax,1
			xor  ecx,ecx
		      cpuid
			and  ecx,(1 shl 23)
			cmp  ecx,(1 shl 23)
			jne  .Failed
end if

if HAVE and HAVE_AVX1
			lea  r15,[szCPUError.AVX1]
			mov  eax,1
			xor  ecx,ecx
		      cpuid
			and  ecx,(1 shl 27)+(1 shl 28)
			cmp  ecx,(1 shl 27)+(1 shl 28)
			jne  .Failed
			mov  ecx,0
		     xgetbv
			and  eax,0x06
			cmp  eax,0x06
			jne  .Failed
end if

if HAVE and HAVE_AVX2
			lea  r15,[szCPUError.AVX2]
			mov  eax,7
			xor  ecx,ecx
		      cpuid
			and  ebx,(1 shl 5)
			cmp  ebx,(1 shl 5)
			jne  .Failed
end if

if HAVE and HAVE_BMI1
			lea  r15,[szCPUError.BMI1]
			mov  eax,7
			xor  ecx,ecx
		      cpuid
			and  ebx,(1 shl 3)
			cmp  ebx,(1 shl 3)
			jne  .Failed
end if

if HAVE and HAVE_BMI2
			lea  r15,[szCPUError.BMI2]
			mov  eax,7
			xor  ecx,ecx
		      cpuid
			and  ebx,(1 shl 8)
			cmp  ebx,(1 shl 8)
			jne  .Failed
end if

			pop  r15 rbx rbp
			ret

	.Failed:	lea  rdi,[Output]
			lea  rsi,[szCPUError]
		       call  Append
			mov  rsi,r15
		       call  Append
			xor  eax,eax
		      stosd
			lea  rdi,[Output]
		       call  _ErrorBox
			xor  ecx,ecx
		       call  _ExitProcess



