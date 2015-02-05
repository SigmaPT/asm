
PAGE_SIZE = 4*1024

	align	16
__chkstk_ms:
	push	rcx
	push	rax
	cmp	rax, PAGE_SIZE
	lea	rcx, [rsp + 24]
	jb	._LessThanAPage
._MoreThanAPage:
	sub	rcx, PAGE_SIZE
	or	byte[rcx], 0
	sub	rax, PAGE_SIZE
	cmp	rax, PAGE_SIZE
	ja	._MoreThanAPage
._LessThanAPage:
	sub	rcx, rax
	or	byte[rcx], 0
	pop	rax
	pop	rcx
	ret



		      align   16
randi:
	; in: rcx address of Prng
	; out: rax  integer in [0,2^64)
			mov   rax, qword [rcx+Prng.seed]
			mov   rdx, rax
			shr   rdx, 12
			xor   rax, rdx
			mov   rdx, rax
			shl   rdx, 25
			xor   rax, rdx
			mov   rdx, rax
			shr   rdx, 27
			xor   rax, rdx
			mov   rdx, 2685821657736338717
			mov   qword [rcx+Prng.seed], rax
		       imul   rax, rdx
			ret

		      align   16
randd:
	; in: rcx address of Prng
	; out: xmm0  scalar double in [0,1)
		       call   randi
			mov   ecx, 1023
			shl   rax, 11	; 53 bits
			 jz   .Return
.Shift: 		sub   ecx, 1
			shl   rax, 1
			jnc   .Shift
			 or   rax, rcx
			ror   rax, 12
.Return:	      vmovq   xmm0, rax
			ret



		      align   16
expd:
	; xmm0 = Exp[xmm0]
		       push   rbx
			sub   rsp, 32
		      movsd   qword [rsp+8H], xmm0
			fld   qword [rsp+8H]
		      fwait
		     fnstcw   word [rsp+1CH]
		      fwait
		     fnstcw   word [rsp+1EH]
			 or   word [rsp+1EH], 0C00H
		      fldcw   word [rsp+1EH]
		     fldl2e
		      fmulp   st1, st0
			fld   st0
		    frndint
		       fxch   st1
		       fsub   st0, st1
		      f2xm1
		       fld1
		      faddp   st1, st0
		       fxch   st1
		       fld1
		     fscale
		       fstp   st1
		      fmulp   st1, st0
		      fldcw   word [rsp+1CH]
		       fstp   qword [rsp+8H]
		      movsd   xmm0, qword [rsp+8H]
			add   rsp, 32
			pop   rbx
			ret

		      align   16
logd:
	; xmm0 = Log[xmm0]
		       push   rbx
			sub   rsp, 32
		      movsd   qword [rsp+8H], xmm0
			fld   qword [rsp+8H]
		      fwait
		     fnstcw   word [rsp+1CH]
		      fwait
		     fnstcw   word [rsp+1EH]
			 or   word [rsp+1EH], 0C00H
		      fldcw   word [rsp+1EH]
		     fldln2
		       fxch   st1
		      fyl2x
		      fldcw   word [rsp+1CH]
		       fstp   qword [rsp+8H]
		      movsd   xmm0, qword [rsp+8H]
			add   rsp, 32
			pop   rbx
			ret


		      align   16
powdd:
	; xmm0 = Power[xmm0, xmm1]
		       push   rsi
		       push   rbx
			sub   rsp, 40
		      movsd   qword [rsp+8H], xmm0
			fld   qword [rsp+8H]
		      movsd   qword [rsp+8H], xmm1
			fld   qword [rsp+8H]
		       fxch   st1
		       ftst
		      fwait
		     fnstsw   ax
			and   ah, 040H
			 jz   ._035
		       fstp   st0
		       ftst
		      fwait
		     fnstsw   ax
		       fstp   st0
			and   ah, 040H
			jnz   ._034
		       fldz
			jmp   ._036
._034:
		       fld1
			jmp   ._036
._035:
		      fwait
		     fnstcw   word [rsp+1CH]
		      fwait
		     fnstcw   word [rsp+1EH]
			 or   word [rsp+1EH], 0C00H
		      fldcw   word [rsp+1EH]
		       fld1
		       fxch   st1
		      fyl2x
		      fmulp   st1, st0
			fld   st0
		    frndint
		       fxch   st1
		       fsub   st0, st1
		      f2xm1
		       fld1
		      faddp   st1, st0
		       fxch   st1
		       fld1
		     fscale
		       fstp   st1
		      fmulp   st1, st0
		      fldcw   word [rsp+1CH]
._036:
		       fstp   qword [rsp+8H]
		      movsd   xmm0, qword [rsp+8H]
			add   rsp, 40
			pop   rbx
			pop   rsi
			ret











