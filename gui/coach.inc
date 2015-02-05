Coach_Update:

		       push  rbp rsi rdi rbx r13 r14 r15

			mov  byte[Engine5_GoingQ],0

			xor  eax,eax

			lea  rdi,[DepthMoves]
			mov  ecx,256
		  rep stosq

			lea  rdi,[AgeMoves]
			mov  ecx,256
		  rep stosd

			mov  eax,0x80000000

			lea  rdi,[DepthArray]
			mov  ecx,256*64
		  rep stosd

			lea  rdi,[ScoreMoves]
			mov  ecx,256
		  rep stosd

			lea  rdi,[SortMoves]
			xor  eax,eax
		 @@:  stosd
			add  eax,1
			cmp  eax,256
			 jb  @b

			mov  dword[Engine5MaxDepth],0

if 0
			lea  rcx,[Engine5_BoardPosition]
			lea  rdx,[Engine5_StateList]
			lea  r8,[BoardPosition]
		       call  CopyPOSITION


			lea  rbp,[Engine5_BoardPosition]
			lea  rdi,[BoardPosition+POS.MOVE_LIST]
		       call  Generate_Legal
			mov  r13d,eax		  ;r13d = legal move count
			mov  dword[Engine5_KibitzPVCount],eax
;int3

			xor  esi,esi
	.move_loop:	cmp  esi,r13d
			jae  .move_loop_done
			mov  ecx,dword[BoardPosition+POS.MOVE_LIST+4*rsi]
		       call  PrintUciMove
			mov  qword[DepthMoves+8*rsi],rax
			mov  rcx,rax
		       call  QuickMakeMove
			mov  rax,qword[rbp+POS.STATE_PTR]
			sub  rax,sizeof.STATE
			mov  qword[rbp+POS.STATE_PTR],rax
			mov  rax,qword[rax+STATE.FIG_MOVE]
			mov  qword[FigMoves+8*rsi],rax
			add  esi,1
			jmp  .move_loop
	.move_loop_done:

			lea  rbp,[Engine5]

			mov  byte[rbp-Engine1+Engine1_GoingQ],0

			lea  rcx,[rbp-Engine1+Engine1]
		       call  Engine_ClearOutput
			lea  rcx,[rbp-Engine1+Engine1]
		       call  Engine_Stop



			lea  rdi,[Engine5_InputBuffer]
			lea  rsi,[szCmdMultiPV]
		       call  Append
			mov  eax,dword[Engine5_KibitzPVCount]
			mov  ecx,dword[MentorMaxLines]
			cmp  eax,ecx
		      cmova  eax,ecx
		       call  PrintUnsignedInteger
			mov  al,10
		      stosb
			lea  rdx,[Engine5_InputBuffer]
			mov  r8,rdi
			sub  r8,rdx
		     invoke  WriteFile,qword[Engine5_In_Write],rdx,r8,temp,NULL



			lea  rcx,[rbp-Engine1+Engine1]
		       call  Engine_Position
			lea  rcx,[rbp-Engine1+Engine1]
		       call  Engine_GoInfinite
			mov  byte[rbp-Engine1+Engine1_GoingQ],-1

end if
			mov  dword[Engine5MaxDepth],0

			pop  r15 r14 r13 rbx rdi rsi rbp
			ret









