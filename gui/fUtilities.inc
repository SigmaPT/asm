
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
	      ;        paddq  xmm0,dqword[RandInc]
		     movdqa  dqword[RandSeed],xmm0
			ret


GetRand_Book:	   ; get 32 random bits in ax
		     movdqa  xmm0,dqword[RandSeedBook]
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
			and  eax,0x0FFFF
		       push  rax
		     movdqa  dqword[RandSeedBook],xmm0

		     movdqa  xmm0,dqword[RandSeedBook+16]
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
			shl  eax,16
			 or  qword[rsp],rax
			pop  rax
		       pxor  xmm0,dqword[RandSeedBook]
		     movdqa  dqword[RandSeedBook+16],xmm0

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
