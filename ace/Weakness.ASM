

; if x1, ..., xn  are the sorted scores
; and k is the weakness
; assign weight wi to score xi as
;
; wi = (1 + Sqrt[c * k * (x1 - xi)]) * Exp[(d / k ^ 0.25) * (x1 - xi)^2]
;
; where c and -d are certain positive constants
;
; we then accumuate the weights and choose a random real in the interval [0,w1+...+wn)
; in order to choose a move




; this is called when weakness <> 0
; should return a root move

Weakness_PickMove:
	; in: ecx weakness
	; out: eax index of root move

virtual at rsp
  .prng    rb sizeof.Prng
  .weights rq MAX_MOVES
  .lend rb 0
end virtual
.localsize = ((.lend-rsp+15) and (-16))

		       push   rdi
			sub   rsp, .localsize
			mov   edi, ecx

		; get some randomness into the generator
		       call   _GetTime
			xor   rax, rdx
			mov   qword [.prng+Prng.seed], rax

			mov   ecx, edi
			lea   rdi, [rootMoves]

		; xmm5 = c*k
		  vcvtsi2sd   xmm0, xmm0, ecx
		     vmulsd   xmm5, xmm0, qword [.c]

		; xmm6 = d/k^0.25
		    vsqrtsd   xmm0, xmm0, xmm0
		    vsqrtsd   xmm0, xmm0, xmm0
		     vmovsd   xmm6, qword [.d]
		     vdivsd   xmm6, xmm6, xmm0

		; xmm7 hold the sum of the weights
			xor   edx, edx
		     vxorps   xmm7, xmm7, xmm7
.NextWeight:
		      movsx   eax, word [rdi+RootMoves.moves+sizeof.RMove*0+RMove.score]
		      movsx   ecx, word [rdi+RootMoves.moves+sizeof.RMove*rdx+RMove.score]
			sub   eax, ecx
		  vcvtsi2sd   xmm0, xmm0, eax
		     vmulsd   xmm1, xmm0, xmm5
		    vsqrtsd   xmm1, xmm1, xmm1
		     vaddsd   xmm1, xmm1, qword [.one]
		     vmulsd   xmm0, xmm0, xmm0
		     vmulsd   xmm0, xmm0, xmm6
		       call   expd
		     vmulsd   xmm0, xmm0, xmm1
		     vaddsd   xmm7, xmm7, xmm0
		     vmovsd   qword [.weights+8*rdx], xmm7
			add   edx, 1
			cmp   edx, dword [rdi+RootMoves.multiPv]
			 jb   .NextWeight
.WeightsDone:
			lea   rcx, [.prng]
		       call   randd
		     vmulsd   xmm0, xmm0, xmm7
			xor   eax, eax
.SearchNext:
		    vcomisd   xmm0, qword [.weights+8*rax]
			jbe   .Found
			add   eax, 1
			cmp   eax, dword [rdi+RootMoves.multiPv]
			 jb   .SearchNext
			sub   eax, 1	    ; in case something bad happend, return last move
.Found:
		      movzx   eax, word [rdi+RootMoves.moves+sizeof.RMove*rax+RMove.move]
			add   rsp, .localsize
			pop   rdi
			ret

align 8
.one dq +1.0
.c   dq +0.0001
.d   dq -0.0002



; this is called when weakness <> 0
; should set rootsMoves.multiPv

Weakness_SetMultiPv:
	; in: ecx weakness
			lea   rdx, [rootMoves]
			shr   ecx, 5
			add   ecx, 2
			mov   eax, dword [rdx+RootMoves.size]
			cmp   ecx, eax
		      cmova   ecx, eax
			mov   dword [rdx+RootMoves.multiPv], ecx
			ret
