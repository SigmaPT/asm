GetRand:      ; get 16 random bits in ax
	     movdqa  xmm0, dqword[rcx]
	     movdqa  xmm1, xmm0
	     movdqa  xmm2, xmm0
	     pslldq  xmm1, 1
	     psrldq  xmm2, 15
		por  xmm1, xmm2
	     movdqa  xmm2, xmm0
	      psllq  xmm2, 1
		por  xmm1, xmm2
	     movdqa  xmm2, xmm0
	     movdqa  xmm3, xmm0
	     psrldq  xmm2, 1
	     pslldq  xmm3, 15
		por  xmm2, xmm3
	     movdqa  xmm3, xmm0
	      psrlq  xmm3, 1
	       pxor  xmm2, xmm3
		por  xmm0, xmm1
	       pxor  xmm0, xmm2
	   pmovmskb  eax, xmm0
	      paddq  xmm0, dqword[RandInc]
	     movdqa  dqword[rcx], xmm0
		ret



RandShuffle:  ; shuffle xmm0
	     movdqa  xmm1, xmm0
	     movdqa  xmm2, xmm0
	     pslldq  xmm1, 1
	     psrldq  xmm2, 15
		por  xmm1, xmm2
	     movdqa  xmm2, xmm0
	      psllq  xmm2, 1
		por  xmm1, xmm2
	     movdqa  xmm2, xmm0
	     movdqa  xmm3, xmm0
	     psrldq  xmm2, 1
	     pslldq  xmm3, 15
		por  xmm2, xmm3
	     movdqa  xmm3, xmm0
	      psrlq  xmm3, 1
	       pxor  xmm2, xmm3
		por  xmm0, xmm1
	       pxor  xmm0, xmm2
	      paddq  xmm0, dqword[RandInc]
		ret