
macro assert_nz m {

local .skip, .errorbox, .message
 if DEBUG

   jnz	.skip
   jmp	.errorbox

   .message: db m
	     db 0
   .errorbox:
	lea  rdi,[.message]
       call  _ErrorBox
       call  _ExitProcess

   .skip:

 end if

}

macro assert_z m {

local .skip, .errorbox, .message
 if DEBUG

    jz	.skip
   jmp	.errorbox

   .message: db m
	     db 0
   .errorbox:
	lea  rdi,[.message]
       call  _ErrorBox
       call  _ExitProcess

   .skip:

 end if

}



; load 192 bytes into mm registers
macro _load192 a {
    if (HAVE and HAVE_AVX1)
		    vmovaps  ymm0,qqword[a+32*0]
		    vmovaps  ymm1,qqword[a+32*1]
		    vmovaps  ymm2,qqword[a+32*2]
		    vmovaps  ymm3,qqword[a+32*3]
		    vmovaps  ymm4,qqword[a+32*4]
		    vmovaps  ymm5,qqword[a+32*5]
    else
		     movaps  xmm0,dqword[a+16*0]
		     movaps  xmm1,dqword[a+16*1]
		     movaps  xmm2,dqword[a+16*2]
		     movaps  xmm3,dqword[a+16*3]
		     movaps  xmm4,dqword[a+16*4]
		     movaps  xmm5,dqword[a+16*5]
		     movaps  xmm6,dqword[a+16*6]
		     movaps  xmm7,dqword[a+16*7]
		     movaps  xmm8,dqword[a+16*8]
		     movaps  xmm9,dqword[a+16*9]
		     movaps  xmm10,dqword[a+16*10]
		     movaps  xmm11,dqword[a+16*11]
    end if
}

; store 192 bytes from mm registers
macro _store192 a {
    if (HAVE and HAVE_AVX1)
		    vmovaps  qqword[a+32*0],ymm0
		    vmovaps  qqword[a+32*1],ymm1
		    vmovaps  qqword[a+32*2],ymm2
		    vmovaps  qqword[a+32*3],ymm3
		    vmovaps  qqword[a+32*4],ymm4
		    vmovaps  qqword[a+32*5],ymm5
    else
		     movaps  dqword[a+16*0],xmm0
		     movaps  dqword[a+16*1],xmm1
		     movaps  dqword[a+16*2],xmm2
		     movaps  dqword[a+16*3],xmm3
		     movaps  dqword[a+16*4],xmm4
		     movaps  dqword[a+16*5],xmm5
		     movaps  dqword[a+16*6],xmm6
		     movaps  dqword[a+16*7],xmm7
		     movaps  dqword[a+16*8],xmm8
		     movaps  dqword[a+16*9],xmm9
		     movaps  dqword[a+16*10],xmm10
		     movaps  dqword[a+16*11],xmm11
    end if
}


macro _prefetch a {
		prefetchnta  a
}


macro _movdqa a,b {
    if (HAVE and HAVE_AVX1)
		    vmovdqa  a,b
    else
		     movdqa  a,b
    end if
}

macro _movaps a,b {
    if (HAVE and HAVE_AVX1)
		    vmovaps  a,b
    else
		     movaps  a,b
    end if
}


macro _movq a,b {
    if (HAVE and HAVE_AVX1)
		      vmovq  a,b
    else
		       movq  a,b
    end if
}


macro _paddw a,b,c {
    if (HAVE and HAVE_AVX1)
		     vpaddw  a,b,c
    else
	    if a eq b
		      paddw  a,c
	    else
		     movdqa  a,b
		      paddw  a,c
	    end if
    end if
}
macro _psubw a,b,c {
    if (HAVE and HAVE_AVX1)
		     vpsubw  a,b,c
    else
	    if a eq b
		      psubw  a,c
	    else
		     movdqa  a,b
		      psubw  a,c
	    end if
    end if
}


macro _pxor a,b,c {
    if (HAVE and HAVE_AVX1)
		      vpxor  a,b,c
    else
	    if a eq b
		       pxor  a,c
	    else
		     movdqa  a,b
		       pxor  a,c
	    end if
    end if
}


macro _pand a,b,c {
    if (HAVE and HAVE_AVX1)
		      vpand  a,b,c
    else
	    if a eq b
		       pand  a,c
	    else
		     movdqa  a,b
		       pand  a,c
	    end if
    end if
}


macro _psrldq a,b,c {
    if (HAVE and HAVE_AVX1)
		    vpsrldq  a,b,c
    else
	    if a eq b
		     psrldq  a,c
	    else
		     movdqa  a,b
		     psrldq  a,c
	    end if
    end if
}


macro _pslldq a,b,c {
    if (HAVE and HAVE_AVX1)
		    vpslldq  a,b,c
    else
	    if a eq b
		     pslldq  a,c
	    else
		     movdqa  a,b
		     pslldq  a,c
	    end if
    end if
}


macro _por a,b,c {
    if (HAVE and HAVE_AVX1)
		       vpor  a,b,c
    else
	    if a eq b
			por  a,c
	    else
		     movdqa  a,b
			por  a,c
	    end if
    end if
}


macro move a,b,c {
		if c eq
			mov  a,b
		else
			mov  b,c
			mov  a,b
		end if
}


; a = PopCnt(b)
macro _popcnt a,x,t {
local .start,.skip,.done
    if (HAVE and HAVE_POPCNT)
		     popcnt  a,x
    else
	if a eq x

			mov  t,x
			shr  t,1
			and  t,qword[Mask55]
			sub  x,t

			mov  t,x
			shr  t,2
			and  x,qword[Mask33]
			and  t,qword[Mask33]
			add  x,t

			mov  t,x
			shr  t,4
			add  x,t
			and  x,qword[Mask0F]

		       imul  x,qword[Mask01]
			shr  x,56
	else
			mov  a,x
			mov  t,x
			shr  a,1
			and  a,qword[Mask55]
			sub  t,a

			mov  a,t
			shr  t,2
			and  a,qword[Mask33]
			and  t,qword[Mask33]
			add  a,t

			mov  t,a
			shr  a,4
			add  a,t
			and  a,qword[Mask0F]

		       imul  a,qword[Mask01]
			shr  a,56

	end if
    end if
}


; a = ClearLowestBit(b)
; carry flag is not handled consistently
macro _blsr a,b,t {
    if (HAVE and HAVE_BMI1)
		       blsr  a,b
    else
	if a eq b
			lea  t,[a-1]
			and  a,t
	else
			lea  a,[b-1]
			and  a,b
	end if
    end if
}

; a = IsolateLowestBit(b)
; carry flag is not handled consistently
macro _blsi a,b,t {
    if (HAVE and HAVE_BMI1)
		       blsi  a,b
    else
	if a eq b
			mov  t,a
			neg  a
			and  a,t
	else
			mov  a,b
			neg  a
			and  a,b
	end if
    end if
}


; a = And(Not(b),c)
macro _andn a,b,c {
    if (HAVE and HAVE_BMI1)
		       andn  a,b,c
    else
	if b eq c

	  display 'arguments of _andn are strange'
	  display 13,10
	  err

	else if a eq c
			not  b
			and  a,b
			not  b
	else if a eq b
			not  a
			and  a,c
	else
			mov  a,b
			not  a
			and  a,c
	end if
    end if
}



; y = BitDeposit(x,m)
macro _pdep y,x,m,b,t,tm {
local .start,.skip,.done
    if (HAVE and HAVE_BMI2)
		       pdep  y,x,m
    else

			mov  tm,m
			xor  y,y
			lea  b,[y+1]
		       test  tm,tm
			 jz  .done
		.start: mov  t,tm
			neg  t
			and  t,tm
		       test  x,b
			 jz  .skip
			 or  y,t
		.skip:	lea  t,[tm-1]
			add  b,b
			and  tm,t
			jnz  .start
		.done:
    end if

}



; y = BitExtract(x,m)
macro _pext y,x,m,b,t,tm {
local .start,.skip,.done
    if (HAVE and HAVE_BMI2)
		       pext  y,x,m
    else
			mov  tm,m
			xor  y,y
			lea  b,[y+1]
		       test  tm,tm
			 jz  .done
		.start: mov  t,tm
			neg  t
			and  t,tm
		       test  t,x
			lea  t,[tm-1]
			 jz  .skip
			 or  y,b
		.skip:	add  b,b
			and  tm,t
			jnz  .start
		.done:
    end if

}





; converts 64 bit register reg to its 32 bit version

macro mov32 reg,b {
 if	 reg eq rax
			mov  eax,b
 else if reg eq rbx
			mov  ebx,b
 else if reg eq rcx
			mov  ecx,b
 else if reg eq rdx
			mov  edx,b
 else if reg eq rsi
			mov  esi,b
 else if reg eq rdi
			mov  edi,b
 else if reg eq rbp
			mov  ebp,b
 else if reg eq rsp
			mov  esp,b
 else if reg eq r8
			mov  r8d,b
 else if reg eq r9
			mov  r9d,b
 else if reg eq r10
			mov  r10d,b
 else if reg eq r11
			mov  r11d,b
 else if reg eq r12
			mov  r12d,b
 else if reg eq r13
			mov  r13d,b
 else if reg eq r14
			mov  r14d,b
 else if reg eq r15
			mov  r15d,b
 else

	  display 'first argument of mov32 is strange'
	  display 13,10
	  err
 end if
}



;;res1 = bitboard of pseudo legal moves for a queen on (square) sq with (bitboard) occ pieces occluding its movement on the board
;
;macro QueenAttacks res1,res2,sq,occ,t1,t2,t3,t4  {
;
;                      mov32  res1,dword[RookAttacksMOFF+4*sq]
;                      mov32  res2,dword[BishopAttacksMOFF+4*sq]
;                      _pext  t1,occ,qword[RookAttacksPEXT+8*sq],t2,t3,t4
;                        mov  res1,qword[res1+8*t1]
;                      _pext  t1,occ,qword[BishopAttacksPEXT+8*sq],t2,t3,t4
;                        mov  res2,qword[res2+8*t1]
;                         or  res1,res2                                         }

;x = bitboard of pseudo legal moves for a rook on (square) sq with (bitboard) occ pieces occluding its movement on the board

macro RookAttacks x,sq,occ,t	{

if HAVE and HAVE_BMI2
		      mov32  x,dword[RookAttacksMOFF+4*sq]
		       pext  t,occ,qword[RookAttacksPEXT+8*sq]
			mov  x,qword[x+8*t]
else
			mov  t,qword[RookAttacksPEXT+8*sq]
			and  t,occ
		      mov32  x,dword[RookAttacksMOFF+4*sq]
		      movzx  ecx,byte[RookAttacksSHIFT+sq]
		       imul  t,qword[RookAttacksIMUL+8*sq]
			shr  t,cl
			mov  x,qword[x+8*t]

end if
										  }


;x = bitboard of pseudo legal moves for a bishop on (square) sq with (bitboard) occ pieces occluding its movement on the board

macro BishopAttacks x,sq,occ,t	  {

if HAVE and HAVE_BMI2
		      mov32  x,dword[BishopAttacksMOFF+4*sq]
		       pext  t,occ,qword[BishopAttacksPEXT+8*sq]
			mov  x,qword[x+8*t]
else
			mov  t,qword[BishopAttacksPEXT+8*sq]
			and  t,occ
		      mov32  x,dword[BishopAttacksMOFF+4*sq]
		      movzx  ecx,byte[BishopAttacksSHIFT+sq]
		       imul  t,qword[BishopAttacksIMUL+8*sq]
			shr  t,cl
			mov  x,qword[x+8*t]

end if
										 }


