
MainLoop:
			lea  rdi,[szGreeting]
WriteOutput:
		       call  _WriteOut

GetInput:		lea  rbp,[BoardPosition]

			lea  rsi,[Input]
		       call  _ReadIn

		    stdcall  CmpString,'uci'
		       test  eax,eax
			jnz  Uci

		    stdcall  CmpString,'isready'
		       test  eax,eax
			jnz  IsReady

		    stdcall  CmpString,'setoption'
		       test  eax,eax
			jnz  SetOption

		    stdcall  CmpString,'ucinewgame'
		       test  eax,eax
			jnz  UciNewGame

		    stdcall  CmpString,'position'
		       test  eax,eax
			jnz  Position

		    stdcall  CmpString,'go'
		       test  eax,eax
			jnz  Go

		    stdcall  CmpString,'stop'
		       test  eax,eax
			jnz  Stop

		    stdcall  CmpString,'ponderhit'
		       test  eax,eax
			jnz  PonderHit

		    stdcall  CmpString,'quit'
		       test  eax,eax
			jnz  Quit

		    stdcall  CmpString,'test'
		       test  eax,eax
			jnz  TestBit

		    stdcall  CmpString,'eval'
		       test  eax,eax
			jnz  Eval

		    stdcall  CmpString,'moves'
		       test  eax,eax
			jnz  Moves

		    stdcall  CmpString,'see'
		       test  eax,eax
			jnz  See

		    stdcall  CmpString,'undo'
		       test  eax,eax
			jnz  Undo

		    stdcall  CmpString,'perft'
		       test  eax,eax
			jnz  ParsePerft

		    stdcall  CmpString,'_perft'
		       test  eax,eax
			jnz  _ParsePerft

Error:
			lea  rdi,[szUnknownCommand]
			jmp  WriteOutput


Uci:			lea  rdi,[szUCIresponse]
			jmp  WriteOutput

UciNewGame:		lea  rsi,[szStartPosition]
			lea  rbp,[BoardPosition]
		       call  ParseFEN
			jmp  GetInput

IsReady:		lea  rdi,[szReadyOK]
			jmp  WriteOutput

SetOption:	       call  ParseSetOption
			jmp  GetInput

Position:	       call  ParsePosition
			jmp  GetInput

Go:		       call  ParseGo

			jmp  GetInput

Stop:			mov  byte[SearchThreadState],THREAD_STATE_WAIT
			jmp  GetInput

PonderHit:		jmp  GetInput

Quit:			xor  ecx,ecx
		       call  _ExitProcess
		       int3




Moves:		       call  ParseMoves
See:
			lea  rdi,[Output]
		       call  PrintPosition
			mov  al,10
		      stosb
		       call  FillInPosition
		       call  PrintPosition

			lea  rdi,[Output]
			jmp  WriteOutput





Undo:			mov  rax,[rbp+POS.CURR_STATE_PTR]
			mov  rcx,[rbp+POS.BASE_STATE_PTR]
			cmp  rax,rcx
			jbe  GetInput
		       call  UndoMove
		       call  VerifyPosition
			lea  rdi,[Output]
		       call  PrintPosition
			mov  eax,10
		      stosd
			lea  rdi,[Output]
			jmp  WriteOutput





TestBit:		lea  rdi,[Output]
		;
		;        mov  edx,SQUARE_B2
		;        mov  eax,SQUARE_E2
		;
		;        shl  edx,6+3
		;        mov  rcx,qword[LineMasks+rdx+8*rax]
		;       call  PrintBitBoard
		;
		;        lea  rdi,[Output]
		;        jmp  WriteOutput
		;
		;
		;
		;
		;    ;    mov  ecx,64
		;    ;   call  PieceCoverage
		;    ;    mov  rcx,rax
		;    ;   call  PrintBitBoard
		;
		;       call  VerifyPosition
		;       call  PrintPosition
		;       call  ComputeHashKeys
		;       movq  xmm0,rax
		;       call  PrintHex64
		;     movdqu  dqword[rdi],xmm1
		;        add  rdi,16
		;        mov  rax,' redone' + 10 shl (8*7)
		;      stosq



		       push  rdi
			lea  rdi,[MoveList]
		       call  Generate_PseudoLegal_Loud
			pop  rdi
			mov  rcx,'illegal'
			mov  qword[rdi],rcx
		       test  eax,eax
			 js  WriteOutput
			mov  r15d,eax
			xor  r14d,r14d
			mov  rax,'moves:  '
		      stosq
		@@:	cmp  r14d,r15d
			jae  .Done
			mov  ecx,dword[MoveList+8*r14]
		       call  PrintUciMove
			mov  qword[rdi],rax
			add  rdi,rdx
			mov  al,' '
		      stosb
			add  r14d,1
			jmp  @b
      .Done:		mov  al,10
		      stosb


			lea  rdi,[Output]
			jmp  WriteOutput





Eval:
			lea  rdi,[Output]
			mov  rax,'static: '
		      stosq
		       call  EvaluatePosition
			mov  ecx,eax
		       call  PrintUciScore
			mov  al,10
		      stosb

			jmp  .Moves1Done

			mov  rbx,qword[rbp+POS.CURR_STATE_PTR]
			mov  byte[rbx+STATE.PLY],0
			mov  byte[rbx+STATE.DEPTH],0
			mov  dword[rbx+STATE.ALPHA],-INF_SCORE
			mov  dword[rbx+STATE.BETA], +INF_SCORE
		       call  Search_Quiet
			mov  ecx,eax
		 ;       lea  rdi,[Output]
			mov  rax,'search: '
		      stosq
		       call  PrintUciScore
			mov  al,10
		      stosb

			xor  r15,r15
	.PvPrint:	cmp  r15w,word[rbx+STATE.PV_LENGTH]
			jae  .PvPrintDone
		      movzx  ecx,word[rbx+STATE.PV_MOVES+2*r15]
		       call  PrintUciMove
			mov  qword[rdi],rax
			add  rdi,rdx
			add  ebx,1
			mov  al,' '
		      stosb
			jmp  .PvPrint
	.PvPrintDone:
			mov  al,10
		      stosb

			mov  rax,'all:    '
		      stosq

		       call  MovePick_Initialize
.NextMove:	       call  qword[rbx+STATE.MOVE_PHASE]
			mov  ecx,eax
		       test  eax,eax
			 jz  .MovesDone
		       call  PrintUciMove
			mov  [rdi],rax
			add  rdi,rdx
			mov  al,' '
		      stosb
			jmp  .NextMove
.MovesDone:
			mov  eax,10
		      stosb
			mov  rax,'loud:   '
		      stosq

		       call  LoudPick_Initialize
.Next1Move:	       call  LoudPick_Next
			mov  ecx,eax
		       test  eax,eax
			 jz  .Moves1Done
		       call  PrintUciMove
			mov  [rdi],rax
			add  rdi,rdx
			mov  al,' '
		      stosb
			jmp  .Next1Move
.Moves1Done:
			mov  eax,10
		      stosd

			lea  rdi,[Output]
			jmp  WriteOutput
















if 0
		       push  rdi
			lea  rdi,[MoveList]
		       call  Generate_Legal
			pop  rdi
			mov  rcx,'illegal' + (10 shl (8*7))
			mov  qword[rdi],rcx
		       test  eax,eax
			 js  WriteOutput
			mov  r15d,eax
			xor  r14d,r14d
			mov  rax,'moves:  '
		      stosq
	.MoveLoop1:	cmp  r14d,r15d
			jae  @f
			mov  ecx,dword[MoveList+4*r14]
		       call  PrintUciMove
			mov  qword[rdi],rax
			add  rdi,rdx
			mov  al,' '
		      stosb
			add  r14d,1
			jmp  .MoveLoop1
	@@:




			mov  al,10
		      stosb
			mov  rax,'order:  '
		      stosq

		       call  MovePick_Initialize
       .MoveLoop2:     call  qword[rbx+STATE.MOVE_PHASE]
			mov  ecx,eax
			mov  word[rbx+STATE.CUR_MOVE],ax
		       test  eax,eax
			 jz  @f

		       call  MakeMove

		      movzx  ecx,byte[rbx+STATE.SIDE+1*sizeof.STATE]
		      movzx  edx,byte[rbx+STATE.XSIDE+1*sizeof.STATE]
			and  ecx,64
			and  edx,64
			bsf  rdx,qword[rbx+rdx+8*KING+1*sizeof.STATE]
		       call  AttackersTo_Boole
		       test  rax,rax
			jnz  .UndoMove

		      movzx  ecx,word[rbx+STATE.CUR_MOVE]
		       call  PrintUciMove
			mov  qword[rdi],rax
			add  rdi,rdx
			mov  al,' '
		      stosb

	.UndoMove:	mov  qword[rbp+POS.STATE_PTR],rbx
			jmp  .MoveLoop2
		@@:


			mov  eax,10
		      stosd



end if
