
		      align  16

HashGet:	 ; in:  rbx = address of STATE
		 ; out: edx = move zero extended
		 ;      eax = score sign extended
;int3
		       push  r14 r15

			mov  r15,qword[rbx+STATE.HASHKEY]
			mov  r14,qword[HashMask]
			and  r14,r15
			add  r14,qword[HashTable]

			xor  edx,edx

		      ;  jmp  .Return_NoScore

			xor  ecx,ecx
	    irps i, 0 1 2 3 {
		    _movdqa  xmm0,dqword[r14+i*sizeof.ENTRY]
		      _movq  r8,xmm0
			cmp  r8,r15
			 je  .Found
			add  ecx,sizeof.ENTRY
	    }

.Return_NoScore:	mov  eax,NO_SCORE
.Return:		and  edx,0x0FFFF
			pop  r15 r14
			ret


		      align  8
.Found:
			add  r14,rcx
		      movzx  r8d,byte[HashDate]

		; get upper 8 bytes into rcx
		    _psrldq  xmm0,xmm0,8
		      _movq  rcx,xmm0

		; get move
			mov  rdx,rcx
			shr  rdx,32
			shr  ecx,8

		; update the date
			mov  byte[r14+ENTRY.DATE],r8l

		; return if stored depth is lower
			cmp  cl,byte[rbx+STATE.DEPTH]
			 jb  .Return_NoScore

		; get score
			mov  eax,edx
			sar  eax,16    ; eax = sign extended score

			shr  ecx,8

			lea  r8d,[rax+ENDGAME_WIN]
			cmp  r8d,2*ENDGAME_WIN
			 ja  .AdjustMax
	.AdjustMaxRet:

	.Try_Upper:    test  ecx,FLAG_UPPER
			 jz  .Try_Lower
			cmp  eax,dword[rbx+STATE.ALPHA]
			jle  .Return
	.Try_Lower:    test  ecx,FLAG_LOWER
			 jz  .Return_NoScore
			cmp  eax,dword[rbx+STATE.BETA]
			 jl  .Return_NoScore
			and  edx,0x0FFFF
			pop  r15 r14
			ret


		      align  8
	.AdjustMax:
			mov  r8d,eax
			sar  r8d,31
		      movzx  r9d,byte[rbx+STATE.PLY]
			xor  r9d,r8d
			sub  r9d,r8d
			sub  eax,r9d
			jmp  .AdjustMaxRet









		      align  16

HashStore:	 ; in:  rbx = address of STATE
		 ;      edx = move zero extended
		 ;      eax = score sign extended
		 ;      ecx = flags
;int3
		       push  rbx rsi rdi r14 r15

			and  edx,0x0FFFF

			shl  ecx,16		 ; flags
			mov  cl,byte[HashDate]	 ; date

		; add move to history tables
			mov  r8d,edx
		      movzx  r9d,byte[rbx+STATE.DEPTH]
		      movzx  r11d,byte[rbx+STATE.PLY]
		      movzx  r10d,word[KillerMoves+4*r11]
			and  r8d,(1 shl 12)-1
		       test  edx,edx
			 jz  .HistoryDone
			cmp  edx,(MOVE_TYPE_EPCAP shl 12)
			jae  .HistoryDone
			add  dword[HistoryBonus+4*r8],r9d
			cmp  r10d,edx
			 je  .HistoryDone
			shl  r10d,16
			 or  r10d,edx
			mov  dword[KillerMoves+4*r11],r10d
    .HistoryDone:
			shl  r9d,8
			 or  ecx,r9d		 ; depth

			mov  r15,qword[rbx+STATE.HASHKEY]
			mov  r14,qword[HashMask]
			and  r14,r15
			add  r14,qword[HashTable]

		      _movq  xmm2,r15

			lea  r8d,[rax+ENDGAME_WIN]
			cmp  r8d,2*ENDGAME_WIN
			 ja  .AdjustMax
    .AdjustMaxRet:
			shl  rax,48
			 or  rcx,rax	   ; only move(edx) needs to be added to rcx now

			xor  edi,edi		   ; rdi = replace
			 or  esi,-1

	irps i, 0 1 2 3 {
		    _movdqa  xmm0,dqword[r14]
		      _movq  r8,xmm0
		    _psrldq  xmm0,xmm0,8
		      _movq  rax,xmm0
		      movzx  ebx,ah
			cmp  r8,r15
			 je  .FoundKey

			not  bl
			mov  bh,byte[HashDate]
			sub  bh,al
			cmp  esi,ebx
		      cmovl  esi,ebx
		      cmovl  rdi,r14

			add  r14,sizeof.ENTRY
	    }

    .Store:
			shl  rdx,32
			 or  rcx,rdx
		      _movq  xmm0,rcx
		    _pslldq  xmm0,xmm0,8
		       _por  xmm0,xmm0,xmm2
		    _movdqa  dqword[rdi],xmm0


			pop  r15 r14 rdi rsi rbx
			ret




		      align  8
    .FoundKey:
			shr  rax,32
			and  eax,0x0FFFF
		       test  edx,edx
		      cmovz  edx,eax

			shl  rdx,32
			 or  rcx,rdx

		      _movq  xmm0,rcx
		    _pslldq  xmm0,xmm0,8
		       _por  xmm0,xmm0,xmm2
		    _movdqa  dqword[r14],xmm0

			pop  r15 r14 rdi rsi rbx
			ret


		      align  8
    .AdjustMax:
			mov  r8d,eax
			sar  r8d,31
			xor  r11d,r8d
			sub  r11d,r8d
			add  eax,r11d
			jmp  .AdjustMaxRet































