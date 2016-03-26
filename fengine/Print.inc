PrintTree:
		       push  rsi rdi rbx

			lea  rdi,[Output]

			mov  rbx,[rbp+POS.ROOT_STATE_PTR]
      .NextMove:
			cmp  rbx,[rbp+POS.CURR_STATE_PTR]
			 jae  .MovesDone

		      movzx  ecx,word[rbx+STATE.CUR_MOVE]
		       call  PrintUciMove
			mov  [rdi],rax
			add  rdi,rdx
			mov  al,' '
		      stosb

			mov  al,'('
		      stosb

			mov  eax,'NULL'
		       test  byte[rbx+STATE.FLAGS],NODE_FLAG_WASNULL
			 jz  @f
		 stosd
	      @@:	   mov	al,')'
		      stosb

			mov  ecx,dword[rbx+STATE.BEST]
		       call  PrintUciScore
			mov  al,' '
		      stosb

			add  rbx,sizeof.STATE
			jmp  .NextMove
     .MovesDone:
			mov  eax,10
		      stosd

			lea  rdi,[Output]
		       call  _WriteOut

			pop  rbx rdi rsi
			ret


PrintInfo:     ; rbp: address of position
		       push  rbx rdi rsi

			mov  rbx,[rbp+POS.CURR_STATE_PTR]

			lea  rdi,[Output]
			mov  eax,'info'
		      stosd

			mov  rax,' depth '
		      stosq
			sub  rdi,1
			mov  eax,dword[RootDepth]
		       call  PrintUnsignedInteger

			mov  rax,' score '
		      stosq
			sub  rdi,1
			mov  ecx,dword[rbx+STATE.BEST]
		       call  PrintUciScore

			mov  rax,' nodes '
		      stosq
			sub  rdi,1
			mov  rax,qword[rbp+POS.NODES]
		       call  PrintUnsignedInteger

			mov  rax,' nps '
		      stosq
			sub  rdi,3
		       call  _QueryCounter
			sub  rax,qword[rbp+POS.TIME1]
			cmp  rax,1
			adc  rax,0
			mov  rbx,rax	       ; rbx = time spend
			mov  rcx,rax
			mov  rax,qword[rbp+POS.NODES]
			mul  qword[_Frequency]
			div  rcx
		       call  PrintUnsignedInteger

			mov  rax,' time '
		      stosq
			sub  rdi,2
			mov  eax,1000
			mul  rbx
			div  qword[_Frequency]
		       call  PrintUnsignedInteger

			mov  rax,' multipv'
		      stosq
			mov  rax,' 1 pv '
		      stosq
			sub  rdi,2

			xor  ebx,ebx
			mov  r15,qword[rbp+POS.ROOT_STATE_PTR]
	.PvPrint:	cmp  bx,word[r15+STATE.PV_LENGTH]
			jae  .PvPrintDone
		      movzx  ecx,word[r15+STATE.PV_MOVES+2*rbx]
		       call  PrintUciMove
			mov  qword[rdi],rax
			add  rdi,rdx
			add  ebx,1
			mov  al,' '
		      stosb
			jmp  .PvPrint

	.PvPrintDone:


			mov  eax,10
		      stosd

			lea  rdi,[Output]
		       call  _WriteOut

			pop  rsi rdi rbx
			ret




PrintUciScore: ; in: ecx score 16 bits sign extended
	       ; inout: rdi address string output

			mov  eax,'+inf'
			cmp  ecx,+INF_SCORE
			 je  .store
			mov  eax,'-inf'
			cmp  ecx,-INF_SCORE
			 je  .store

			mov  rax,'mate '
			mov  edx,MATE_SCORE+1
			cmp  ecx,+MAX_EVAL
			 jg  .Mate
			mov  edx,-MATE_SCORE
			cmp  ecx,-MAX_EVAL
			 jl  .Mate
			mov  eax,'cp '
		      stosd
			sub  rdi,1
		     movsxd  rax,ecx
		       call  PrintSignedInteger
			ret

    .Mate:		sub  edx,ecx
			sar  edx,1
		      stosq
			sub  rdi,3
		     movsxd  rax,edx
		       call  PrintSignedInteger
			ret

  .store:	      stosd
			ret




PrintUciMove:	   ; in: ecx move
		   ; out: rax move string
		   ;      edx byte length of move string  4 or 5 for promotions

			mov  eax,'NULL'
		       test  ecx,(1 shl 12)-1
			 jz  .Return

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
			cmp  edx,MOVE_TYPE_PROM
			jae  .Promotion
	.Return:
			mov  edx,4
			ret

	.Promotion:
			and  edx,3
		      movzx  edx,byte[@f+rdx]
			shl  rdx,32
			 or  rax,rdx
			mov  edx,5
			ret

	@@: db 'nbrq'



PrintBitBoard:	 ; in: rcx bitboard
		 ; inout: rdi string
			xor  edx,edx
       .NextBit:	 bt  rcx,rdx
			sbb  eax,eax
			add  edx,1
			and  eax,'X'-'.'
			add  eax,'. ' + (10 shl 16)
		      stosd
			mov  eax,edx
			and  eax,7
			neg  eax
			sbb  rdi,1
			cmp  edx,64
			 jb  .NextBit
			ret

PrintPosition:	; in: rbp address of position (POS)
		; inout: rdi string

		       push  rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]

			xor  ecx,ecx
       .NextBit:	mov  eax,'P ' + (10 shl 16)
			 bt  qword[rbp+STATE.WPAWNS],rcx
			 jc  .Found
			mov  al,'N'
			 bt  qword[rbp+STATE.WKNIGHTS],rcx
			 jc  .Found
			mov  al,'B'
			 bt  qword[rbp+STATE.WBISHOPS],rcx
			 jc  .Found
			mov  al,'R'
			 bt  qword[rbp+STATE.WROOKS],rcx
			 jc  .Found
			mov  al,'Q'
			 bt  qword[rbp+STATE.WQUEENS],rcx
			 jc  .Found
			mov  al,'K'
			 bt  qword[rbp+STATE.WKING],rcx
			 jc  .Found
			mov  al,'p'
			 bt  qword[rbp+STATE.BPAWNS],rcx
			 jc  .Found
			mov  al,'n'
			 bt  qword[rbp+STATE.BKNIGHTS],rcx
			 jc  .Found
			mov  al,'b'
			 bt  qword[rbp+STATE.BBISHOPS],rcx
			 jc  .Found
			mov  al,'r'
			 bt  qword[rbp+STATE.BROOKS],rcx
			 jc  .Found
			mov  al,'q'
			 bt  qword[rbp+STATE.BQUEENS],rcx
			 jc  .Found
			mov  al,'k'
			 bt  qword[rbp+STATE.BKING],rcx
			 jc  .Found
			mov  al,'*'
			 bt  qword[rbp+STATE.EPSQUARE],rcx
			 jc  .Found
			mov  al,'.'
	  .Found:     stosd
			lea  eax,[rcx+1]
			and  eax,7
			neg  eax
			sbb  rdi,1
			add  ecx,1
			cmp  ecx,64
			 jb  .NextBit



;                        xor  ecx,ecx
;       .NextChar:     movzx  eax,byte[rbp+POS.BOARD+rcx]
;                        mov  eax,dword[@f+4*rax]
;                      stosd
;                        lea  eax,[rcx+1]
;                        and  eax,7
;                        neg  eax
;                        sbb  rdi,1
;                        add  ecx,1
;                        cmp  ecx,64
;                         jb  .NextChar

		      movzx  ecx,byte[rbp+STATE.CASTLING]
			mov  byte[rdi],'K'
			shr  ecx,1
			adc  rdi,0
			mov  byte[rdi],'Q'
			shr  ecx,1
			adc  rdi,0
			mov  byte[rdi],'k'
			shr  ecx,1
			adc  rdi,0
			mov  byte[rdi],'q'
			shr  ecx,1
			adc  rdi,0
			mov  al,10
		      stosb

			mov  rax,'repeat: '
		      stosq
		      movzx  rax,byte[rbp+STATE.REPEAT]
		       call  PrintUnsignedInteger
			mov  al,10
		      stosb

			mov  rax,'hash:   '
		      stosq
		       movq  xmm0,qword[rbp+STATE.HASHKEY]
		       call  PrintHex64
		     movdqu  dqword[rdi],xmm1
			add  rdi,16
			mov  al,10
		      stosb

			mov  rax,'mhash:  '
		      stosq
		       movq  xmm0,qword[rbp+STATE.MHASHKEY]
		       call  PrintHex64
		     movdqu  dqword[rdi],xmm1
			add  rdi,16
			mov  al,10
		      stosb

			mov  rax,'phash:  '
		      stosq
		       movq  xmm0,qword[rbp+STATE.PHASHKEY]
		       call  PrintHex64
		     movdqu  dqword[rdi],xmm1
			add  rdi,16
			mov  al,10
		      stosb

			mov  rax,'white:  '
		      stosq
		      movzx  eax,word[rbp+STATE.WMSCORE]
		       call  PrintSignedIntegerAligned
		      movsx  rax,word[rbp+STATE.WPSTMG]
		       call  PrintSignedIntegerAligned
		      movsx  rax,word[rbp+STATE.WPSTEG]
		       call  PrintSignedInteger
			mov  al,10
		      stosb

			mov  rax,'black:  '
		      stosq
		      movzx  eax,word[rbp+STATE.BMSCORE]
		       call  PrintSignedIntegerAligned
		      movsx  rax,word[rbp+STATE.BPSTMG]
		       call  PrintSignedIntegerAligned
		      movsx  rax,word[rbp+STATE.BPSTEG]
		       call  PrintSignedInteger
			mov  al,10
		      stosb

			pop  rbp
			ret






PrintSignedIntegerAligned:
		       push  rdi
		       call  PrintSignedInteger
			pop  rcx
			sub  rcx,rdi
			mov  al,' '
			add  rcx,8
			 js  @f
		  rep stosb
		@@:	ret



PrintHex64:
		     movdqa  xmm3,dqword[.Sum1]
		     movdqa  xmm4,dqword[.Comp1]
		     movdqa  xmm2,dqword[.Mask1]
		     movdqa  xmm5,dqword[.Num1]
		     movdqa  xmm1,xmm0
		      psrlq  xmm0,4
		       pand  xmm0,xmm2
		       pand  xmm1,xmm2
		  punpcklbw  xmm0,xmm1
		     movdqa  xmm1,xmm0
		    pcmpgtb  xmm0,xmm4
		       pand  xmm0,xmm5
		      paddb  xmm1,xmm3
		      paddb  xmm1,xmm0
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
		       test  rax,rax
			jns  .l1
			mov  byte[rdi],'-'
			add  rdi,1
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






