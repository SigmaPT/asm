

; these macro simulate the avx instructions with lower ones
; might be confusing


macro vaddsd a,b,c {
 match =1, CPU_HAS_AVX1 \{
		     vaddsd  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		      addsd  a,c
	    else
		     movaps  a,b
		      addsd  a,c
	    end if
 \}
}

macro vcvtsi2sd a,b,c {
 match =1, CPU_HAS_AVX1 \{
		  vcvtsi2sd  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		   cvtsi2sd  a,c
	    else
		     movaps  a,b
		   cvtsi2sd  a,c
	    end if
 \}
}

macro vdivsd a,b,c {
 match =1, CPU_HAS_AVX1 \{
		     vdivsd  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		      divsd  a,c
	    else
		     movaps  a,b
		      divsd  a,c
	    end if
 \}
}

macro vmovaps a,b {
 match =1, CPU_HAS_AVX1 \{
		    vmovaps  a,b
 \}
 match =0, CPU_HAS_AVX1 \{
		     movaps  a,b
 \}
}

macro vmovd a,b {
 match =1, CPU_HAS_AVX1 \{
		      vmovd  a,b
 \}
 match =0, CPU_HAS_AVX1 \{
		       movd  a,b
 \}
}

macro vmovdqa a,b {
 match =1, CPU_HAS_AVX1 \{
		    vmovdqa  a,b
 \}
 match =0, CPU_HAS_AVX1 \{
		     movdqa  a,b
 \}
}

macro vmovdqu a,b {
 match =1, CPU_HAS_AVX1 \{
		    vmovdqu  a,b
 \}
 match =0, CPU_HAS_AVX1 \{
		     movdqu  a,b
 \}
}

macro vmovq a,b {
 match =1, CPU_HAS_AVX1 \{
		      vmovq  a,b
 \}
 match =0, CPU_HAS_AVX1 \{
		       movq  a,b
 \}
}

macro vmulsd a,b,c {
 match =1, CPU_HAS_AVX1 \{
		     vmulsd  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		      mulsd  a,c
	    else
		     movaps  a,b
		      mulsd  a,c
	    end if
 \}
}

macro vpaddb a,b,c {
 match =1, CPU_HAS_AVX1 \{
		     vpaddb  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		      paddb  a,c
	    else
		     movdqa  a,b
		      paddb  a,c
	    end if
 \}
}

macro vpaddw a,b,c {
 match =1, CPU_HAS_AVX1 \{
		     vpaddw  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		      paddw  a,c
	    else
		     movdqa  a,b
		      paddw  a,c
	    end if
 \}
}

macro vpand a,b,c {
 match =1, CPU_HAS_AVX1 \{
		      vpand  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		       pand  a,c
	    else
		     movdqa  a,b
		       pand  a,c
	    end if
 \}
}

macro vpcmpeqb a,b,c {
 match =1, CPU_HAS_AVX1 \{
		   vpcmpeqb  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		    pcmpeqb  a,c
	    else
		     movdqa  a,b
		    pcmpeqb  a,c
	    end if
 \}
}

macro vpcmpgtb a,b,c {
 match =1, CPU_HAS_AVX1 \{
		   vpcmpgtb  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		    pcmpgtb  a,c
	    else
		     movdqa  a,b
		    pcmpgtb  a,c
	    end if
 \}
}

macro vpmovmskb a,b {
 match =1, CPU_HAS_AVX1 \{
		  vpmovmskb  a,b
 \}
 match =0, CPU_HAS_AVX1 \{
		  vpmovmskb  a,b
 \}
}



macro vpor a,b,c {
 match =1, CPU_HAS_AVX1 \{
		       vpor  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
			por  a,c
	    else
		     movdqa  a,b
			por  a,c
	    end if
 \}
}

macro vpslldq a,b,c {
 match =1, CPU_HAS_AVX1 \{
		    vpslldq  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		     pslldq  a,c
	    else
		     movdqa  a,b
		     pslldq  a,c
	    end if
 \}
}

macro vpsrldq a,b,c {
 match =1, CPU_HAS_AVX1 \{
		    vpsrldq  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		     psrldq  a,c
	    else
		     movdqa  a,b
		     psrldq  a,c
	    end if
 \}
}

macro vpsrlq a,b,c {
 match =1, CPU_HAS_AVX1 \{
		     vpsrlq  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		      psrlq  a,c
	    else
		     movdqa  a,b
		      psrlq  a,c
	    end if
 \}
}

macro vpsubw a,b,c {
 match =1, CPU_HAS_AVX1 \{
		     vpsubw  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		      psubw  a,c
	    else
		     movdqa  a,b
		      psubw  a,c
	    end if
 \}
}

macro vpunpcklbw a,b,c {
 match =1, CPU_HAS_AVX1 \{
		 vpunpcklbw  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		  punpcklbw  a,c
	    else
		     movdqa  a,b
		  punpcklbw  a,c
	    end if
 \}
}

macro vpxor a,b,c {
 match =1, CPU_HAS_AVX1 \{
		      vpxor  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		       pxor  a,c
	    else
		     movdqa  a,b
		       pxor  a,c
	    end if
 \}
}

macro vsqrtsd a,b,c {
 match =1, CPU_HAS_AVX1 \{
		    vsqrtsd  a,b,c
 \}
 match =0, CPU_HAS_AVX1 \{
	    if a eq b
		     sqrtsd  a,c
	    else
		     movaps  a,b
		     sqrtsd  a,c
	    end if
 \}
}

