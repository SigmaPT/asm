


macro ReadStateToXMM c {
		    vmovaps  ymm0,[c+32*0]
		    vmovaps  ymm1,[c+32*1]
		    vmovaps  ymm2,[c+32*2]
		    vmovaps  ymm3,[c+32*3]
		    vmovaps  ymm4,[c+32*4]
		    vmovaps  ymm5,[c+32*5]
			}

macro WriteStateFromXMM c {
		    vmovaps  [c+32*0],ymm0
		    vmovaps  [c+32*1],ymm1
		    vmovaps  [c+32*2],ymm2
		    vmovaps  [c+32*3],ymm3
		    vmovaps  [c+32*4],ymm4
		    vmovaps  [c+32*5],ymm5
			}

macro move a,b,c {
		if c eq
			mov  a,b
		else
			mov  b,c
			mov  a,b
		end if		     }




; a = PopCnt(b)
macro _popcnt a,x,t {
    if (HAVE_INSTRUCTIONS and HAVE_POPCNT)
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
			and  t,qword[Mask0F]
			add  x,t

		       imul  x,qword[Mask01]
			shr  x,56
	else
			mov  a,x
			mov  t,x
			shr  a,1
			and  a,qword[Mask55]
			sub  t,a

			mov  a,t
			shr  a,2
			and  t,qword[Mask33]
			and  a,qword[Mask33]
			add  t,a

			mov  a,t
			shr  t,4
			and  t,qword[Mask0F]
			add  a,t

		       imul  a,qword[Mask01]
			shr  a,56
	end if
    end if
}


; a = ClearLowestBit(b)
; carry flag is not handled consistently
macro _blsr a,x,t {
    if (HAVE_INSTRUCTIONS and HAVE_BMI1)
		       blsr  a,x
    else
	if a eq x
			lea  t,[a-1]
			and  a,t
	else
			lea  a,[x-1]
			and  a,x
	end if
    end if
}

; a = And(Not(b),c)
macro _andn a,b,c {
    if (HAVE_INSTRUCTIONS and HAVE_BMI1)
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
    if (HAVE_INSTRUCTIONS and HAVE_BMI2)
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
    if (HAVE_INSTRUCTIONS and HAVE_BMI2)
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



;macro BetweenSquares res,x,y {
;local .start,.skip,.done
;                        xor  res,res
;                        cmp  x,y
;                         je  .same
;                        mov  res,125
;                         jb  .noswap
;                       xchg  x,y
;          .noswap:      sub  res,x
;                       imul  res,x
;                        lea  res,[res+2*y-2]
;                        mov  res,[BetweenMasks+4*res]
;          .same:
;}




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


;res1 = bitboard of pseudo legal moves for a queen on (square) sq with (bitboard) occ pieces occluding its movement on the board

macro QueenAttacks res1,res2,sq,occ,t1,t2,t3,t4  {

		      mov32  res1,dword[RookAttacksMOFF+4*sq]
		      mov32  res2,dword[BishopAttacksMOFF+4*sq]
		      _pext  t1,occ,qword[RookAttacksPEXT+8*sq],t2,t3,t4
			mov  res1,qword[res1+8*t1]
		      _pext  t1,occ,qword[BishopAttacksPEXT+8*sq],t2,t3,t4
			mov  res2,qword[res2+8*t1]
			 or  res1,res2					       }

;res1 = bitboard of pseudo legal moves for a rook on (square) sq with (bitboard) occ pieces occluding its movement on the board

macro RookAttacks res1,sq,occ,t1,t2,t3,t4    {
		      mov32  res1,dword[RookAttacksMOFF+4*sq]
		      _pext  t1,occ,qword[RookAttacksPEXT+8*sq],t2,t3,t4
			mov  res1,qword[res1+8*t1]				  }

;res1 = bitboard of pseudo legal moves for a bishop on (square) sq with (bitboard) occ pieces occluding its movement on the board

macro BishopAttacks res1,sq,occ,t1,t2,t3,t4    {
		      mov32  res1,dword[BishopAttacksMOFF+4*sq]
		      _pext  t1,occ,qword[BishopAttacksPEXT+8*sq],t2,t3,t4
			mov  res1,qword[res1+8*t1]				  }


