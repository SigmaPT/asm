


ParsePerft:
		       call  SkipSpaces
		       call  ParseInteger
			mov  r15d,eax
			cmp  eax,9
			 ja  GetInput
			sub  r15d,1
			 js  GetInput

		       call  _ResetCounter
		       call  _QueryCounter
			mov  qword[rbp+POS.TIME1],rax

			mov  byte[PerftProblem],0

			mov  rbx,qword[rbp+POS.CURR_STATE_PTR]

			lea  rdi,[rbx+STATE.MOVE_LIST]
			mov  rsi,rdi
		       call  Generate_Legal
			xor  ecx,ecx
			mov  qword[rdi],rcx

			xor  r14d,r14d	; total

	.DepthNLoop:	mov  ecx,[rsi]
		       test  ecx,ecx
			 jz  .DepthNDone

		       call  MakeMove

			mov  ecx,r15d
		       call  PerftSearch
			mov  r13,rax
			add  r14,rax

			lea  rdi,[Output]
			mov  ecx,dword[rsi]
		       call  PrintUciMove
			mov  qword[rdi],rax
			add  rdi,rdx
			mov  eax,'  : '
		      stosd
			mov  rax,r13
		       call  PrintUnsignedInteger
			mov  eax,10
		      stosd
			lea  rdi,[Output]
		       call  _WriteOut

			mov  qword[rbp+POS.CURR_STATE_PTR],rbx
			add  rsi,4
			jmp  .DepthNLoop
	.DepthNDone:
			lea  rdi,[Output]

			mov  rax,'total : '
		      stosq
			mov  rax,r14
		       call  PrintUnsignedInteger

			mov  eax,'  ( '
		      stosd
		       call  _QueryCounter
			sub  rax,qword[rbp+POS.TIME1]
			cmp  rax,1
			adc  rax,0
			mov  rcx,rax
			mov  rax,r14
			mul  qword[_Frequency]
			div  rcx
		       call  PrintUnsignedInteger
			mov  rax,' nps ) '+ (10 shl (8*7))
		      stosq
			xor  eax,eax
		      stosd

			lea  rdi,[Output]
			jmp  WriteOutput












_ParsePerft:
		       call  SkipSpaces
		       call  ParseInteger
			mov  r15d,eax
			cmp  eax,9
			 ja  GetInput
			sub  r15d,1
			 js  GetInput

		       call  _ResetCounter
		       call  _QueryCounter
			mov  qword[rbp+POS.TIME1],rax

			mov  byte[PerftProblem],0

			mov  rbx,qword[rbp+POS.CURR_STATE_PTR]

			lea  rdi,[rbx+STATE.MOVE_LIST]
			mov  rsi,rdi
		       call  Generate_PseudoLegal
			xor  ecx,ecx
			mov  qword[rdi],rcx

			xor  r14d,r14d	; total

	.DepthNLoop:	mov  ecx,[rsi]
		       test  ecx,ecx
			 jz  .DepthNDone

		       call  MakeMove

		      movzx  ecx,byte[rbx+STATE.SIDE+1*sizeof.STATE]
		      movzx  edx,byte[rbx+STATE.XSIDE+1*sizeof.STATE]
			and  ecx,64
			and  edx,64
			bsf  rdx,qword[rbx+rdx+8*KING+1*sizeof.STATE]
		       call  AttackersTo_Boole
		       test  rax,rax
			jnz  .UndoMove

			mov  ecx,r15d
		       call  _PerftSearch
			mov  r13,rax
			add  r14,rax

			lea  rdi,[Output]
			mov  ecx,dword[rsi]
		       call  PrintUciMove
			mov  qword[rdi],rax
			add  rdi,rdx
			mov  eax,'  : '
		      stosd
			mov  rax,r13
		       call  PrintUnsignedInteger
			mov  eax,10
		      stosd
			lea  rdi,[Output]
		       call  _WriteOut
	.UndoMove:
			mov  qword[rbp+POS.CURR_STATE_PTR],rbx
			add  rsi,8
			jmp  .DepthNLoop
	.DepthNDone:
			lea  rdi,[Output]

			mov  rax,'total : '
		      stosq
			mov  rax,r14
		       call  PrintUnsignedInteger

			mov  eax,'  ( '
		      stosd
		       call  _QueryCounter
			sub  rax,qword[rbp+POS.TIME1]
			cmp  rax,1
			adc  rax,0
			mov  rcx,rax
			mov  rax,r14
			mul  qword[_Frequency]
			div  rcx
		       call  PrintUnsignedInteger
			mov  rax,' nps ) '+ (10 shl (8*7))
		      stosq
			xor  eax,eax
		      stosd

			lea  rdi,[Output]
			jmp  WriteOutput







		      align  16
PerftSearch:
		       push  rbx rdi rsi r14 r15
			mov  rbx,qword[rbp+POS.CURR_STATE_PTR]
			xor  r14,r14
			lea  eax,[r14+1]
			mov  r15d,ecx
			lea  rdi,[rbx+STATE.MOVE_LIST]
			sub  r15d,1
			 jz  .Depth1
			 js  .Depth0

			mov  rsi,rdi
		       call  Generate_Legal
			xor  ecx,ecx
			mov  qword[rdi],rcx

; at depth N, call perft(N-1)
	.DepthNLoop:	mov  ecx,dword[rsi]
		       test  ecx,ecx
			 jz  .DepthNDone
		       call  MakeMove
			mov  ecx,r15d
		       call  PerftSearch
			add  r14,rax
	.UndoMove:
			mov  qword[rbp+POS.CURR_STATE_PTR],rbx
			add  rsi,4
			jmp  .DepthNLoop
	.DepthNDone:
			mov  rax,r14

; at depth 0, just return 1
    .Depth0:		pop  r15 r14 rsi rdi rbx
			ret

; at Depth 1, return legal move count
    .Depth1:
		       call  Generate_Legal
			pop  r15 r14 rsi rdi rbx
			ret





		      align  16
_PerftSearch:
		       push  rbx rdi rsi r14 r15
			mov  rbx,qword[rbp+POS.CURR_STATE_PTR]
			xor  r14,r14
			lea  eax,[r14+1]
			mov  r15d,ecx
			sub  r15d,1
			 js  .Depth0

			cmp  byte[PerftProblem],0
			jne  .Depth0


		   ;     lea  rdi,[MoveList]
		   ;    call  Generate_PseudoLegal_Loud
		   ;     xor  ecx,ecx
		   ;     mov  qword[rdi],rcx
		   ;     mov  esi,eax
		   ;     lea  rdi,[MoveList1]
		   ;    call  Generate_PseudoLegal_Quiet
		   ;     add  esi,eax
		   ;     xor  ecx,ecx
		   ;     mov  qword[rdi],rcx
		   ;
		   ;     lea  rdi,[rbx+STATE.MOVE_LIST]
		   ;    call  Generate_PseudoLegal
		   ;     xor  ecx,ecx
		   ;     mov  qword[rdi],rcx
		   ;
		   ;     cmp  esi,eax
		   ;     jne  .PerftProblem
		   ;
		   ;     lea  rsi,[rbx+STATE.MOVE_LIST]


		       call  MovePick_Initialize

; at depth N, call perft(N-1)
	.DepthNLoop:   ; mov  ecx,dword[rsi]

		       call  qword[rbx+STATE.MOVE_PHASE]
			mov  ecx,eax
			mov  word[rbx+STATE.CUR_MOVE],ax
		       test  eax,eax
			 jz  .DepthNDone

		       call  IsPseudoLegal
		       test  rax,rax
			 jz  .PerftProblem

		      movzx  ecx,word[rbx+STATE.CUR_MOVE]
		       call  MakeMove

		      movzx  ecx,byte[rbx+STATE.SIDE+1*sizeof.STATE]
		      movzx  edx,byte[rbx+STATE.XSIDE+1*sizeof.STATE]
			and  ecx,64
			and  edx,64
			bsf  rdx,qword[rbx+rdx+8*KING+1*sizeof.STATE]
		       call  AttackersTo_Boole
		       test  rax,rax
			jnz  .UndoMove


	       ;        call  ComputeHashKeys
	       ;         cmp  rax,qword[rbx+STATE.HASHKEY+1*sizeof.STATE]
	       ;         jne  .PerftProblem
	       ;         cmp  rdx,qword[rbx+STATE.MHASHKEY+1*sizeof.STATE]
	       ;         jne  .PerftProblem

		     ;   ComputeMaterialScores

			mov  ecx,r15d
		       call  _PerftSearch
			add  r14,rax
	.UndoMove:
			mov  qword[rbp+POS.CURR_STATE_PTR],rbx
			add  rsi,8
			jmp  .DepthNLoop
	.DepthNDone:
			mov  rax,r14

; at depth 0, just return 1
    .Depth0:		pop  r15 r14 rsi rdi rbx
			ret

.PerftProblem:
			mov  byte[PerftProblem],-1

		   ;     lea  rdi,[szPerftProblem]
		   ;    call  _WriteOut

			lea  rdi,[Output]
			lea  rsi,[szPerftProblem]
		       call  Append

			mov  rax,'loud:   '
		      stosq

			xor  r14d,r14d
	  .Loop1:	mov  ecx,dword[MoveList+8*r14]
		       test  ecx,ecx
			 jz  @f
		       call  PrintUciMove
			mov  qword[rdi],rax
			add  rdi,rdx
			mov  al,' '
		      stosb
			add  r14d,1
			jmp  .Loop1
		@@:

			mov  al,10
		      stosb

			mov  rax,'quiet:  '
		      stosq

			xor  r14d,r14d
	  .Loop3:	mov  ecx,dword[MoveList1+8*r14]
		       test  ecx,ecx
			 jz  @f
		       call  PrintUciMove
			mov  qword[rdi],rax
			add  rdi,rdx
			mov  al,' '
		      stosb
			add  r14d,1
			jmp  .Loop3
		@@:

			mov  al,10
		      stosb

			mov  rax,'all:    '
		      stosq


			xor  r14d,r14d
	  .Loop2:	mov  ecx,dword[rbx+STATE.MOVE_LIST+8*r14]
		       test  ecx,ecx
			 jz  @f
		       call  PrintUciMove
			mov  qword[rdi],rax
			add  rdi,rdx
			mov  al,' '
		      stosb
			add  r14d,1
			jmp  .Loop2
		@@:

			mov  eax,10
		      stosd

			lea  rdi,[Output]
		       call  _WriteOut

			mov  qword[rbp+POS.CURR_STATE_PTR],rbx

			xor  eax,eax
			pop  r15 r14 rsi rdi rbx
			ret



