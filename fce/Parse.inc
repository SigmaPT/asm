ParseSetOption:

		   ;     'setoption name Hash value 256'


		       push  rbx

	.Read:
		       call  SkipSpaces
			cmp  byte[rsi],' '
			 jb  .ReadDone
		    stdcall  CmpString,'name'

		       call  SkipSpaces
		    stdcall  CmpStringCaseLess,'hash'
		       test  eax,eax
			jnz  .Hash


	.ReadDone:

			pop  rbx
			ret

    .Hash:
		       call  SkipSpaces
		    stdcall  CmpString,'value'
		       call  SkipSpaces
		       call  ParseInteger
			mov  ecx,eax
		       call  AllocateHashTable
			jmp  .ReadDone




ParseGo:	       push  rbx

			mov  rbx,qword[rbp+POS.CURR_STATE_PTR]

			xor  eax,eax
			mov  ecx,360000
			mov  qword[MoveTime],rax
			mov  qword[WTime],rcx
			mov  qword[BTime],rcx
			mov  qword[WInc],rax
			mov  qword[BInc],rax
			mov  dword[MovesToGo],12


	 .ReadLoop:
		       call  SkipSpaces
			cmp  byte[rsi],' '
			 jb  .ReadLoopDone
		    stdcall  CmpString,'wtime'
		       test  eax,eax
			jnz  .wtime
		    stdcall  CmpString,'btime'
		       test  eax,eax
			jnz  .btime
		    stdcall  CmpString,'winc'
		       test  eax,eax
			jnz  .winc
		    stdcall  CmpString,'binc'
		       test  eax,eax
			jnz  .binc
		    stdcall  CmpString,'movestogo'
		       test  eax,eax
			jnz  .movestogo
		    stdcall  CmpString,'ponder'
		       test  eax,eax
			jnz  .ponder
		    stdcall  CmpString,'movetime'
		       test  eax,eax
			jnz  .movetime
		    stdcall  CmpString,'infinite'
		       test  eax,eax
			jnz  .infinite
		       call  SkipToken
			jmp  .ReadLoop
	.ReadLoopDone:


			mov  rax,[MoveTime]
		       test  rax,rax
			jnz  .Return

		      movzx  ecx,byte[rbx+STATE.SIDE]
			and  ecx,8
		       fild  dword[MovesToGo]
		       fild  qword[WTime+rcx]
		       fild  qword[WInc+rcx]
		       fld1
		      fsubr  st0,st3
		      fmulp  st1,st0
		      faddp  st1,st0
		     fdivrp  st1,st0
		       push  rax
		      fistp  qword[rsp]
			pop  rax

    .Return:		xor  ecx,ecx
		       test  rax,rax
		      cmovs  rax,rcx
		   ;     mul  qword[_Frequency]
		   ;     mov  ecx,1000
		   ;     div  rcx
			mov  qword[AlottedTime],rax

		       call  _ResetCounter

			mov  byte[SearchThreadState],THREAD_STATE_SEARCH
		     invoke  SetEvent,dword[SearchThreadStartEvent]
		     invoke  SetEvent,dword[TimerThreadStartEvent]

			pop  rbx
			ret

	.wtime:        call  SkipSpaces
		       call  ParseInteger
			mov  qword[WTime],rax
			jmp  .ReadLoop

	.btime:        call  SkipSpaces
		       call  ParseInteger
			mov  qword[BTime],rax
			jmp  .ReadLoop

	.winc:	       call  SkipSpaces
		       call  ParseInteger
			mov  qword[WInc],rax
			jmp  .ReadLoop

	.binc:	       call  SkipSpaces
		       call  ParseInteger
			mov  qword[BInc],rax
			jmp  .ReadLoop

	.ponder:       call  SkipSpaces
			jmp  .ReadLoop

	.infinite:     call  SkipSpaces
			 or  eax,-1
			mov  qword[MoveTime],rax
			jmp  .ReadLoop

	.movetime:     call  SkipSpaces
		       call  ParseInteger
			mov  qword[MoveTime],rax
			jmp  .ReadLoop

	.movestogo:    call  SkipSpaces
		       call  ParseInteger
			cmp  eax,1
			adc  eax,1
			mov  dword[MovesToGo],eax
			jmp  .ReadLoop









ParseFEN:	; in: rsi address of fen string
		; inout: rbp address of board position (POS)

		   ; clear position

		       push  rbp
			mov  rax,rbp
			lea  rbp,[StateList]
			mov  qword[rax+POS.CURR_STATE_PTR],rbp
			mov  qword[rax+POS.ROOT_STATE_PTR],rbp

		       push  rdi
			xor  eax,eax
			mov  ecx,(sizeof.STATE/8)
			mov  rdi,rbp
		  rep stosq
			pop  rdi

		       call  SkipSpaces

			xor  eax,eax
			xor  ecx,ecx
			jmp  .ExpectPiece

.ExpectPieceOrSlash:   test  ecx,7
			jnz  .ExpectPiece
		      lodsb
			cmp  al,'/'
			jne  .Failed
.ExpectPiece:	      lodsb
			mov  edi,STATE.WPIECES
			mov  edx,STATE.WPAWNS
			cmp  al,'P'
			 je  .FoundPiece
			mov  edx,STATE.WKNIGHTS
			cmp  al,'N'
			 je  .FoundPiece
			mov  edx,STATE.WBISHOPS
			cmp  al,'B'
			 je  .FoundPiece
			mov  edx,STATE.WROOKS
			cmp  al,'R'
			 je  .FoundPiece
			mov  edx,STATE.WQUEENS
			cmp  al,'Q'
			 je  .FoundPiece
			mov  edx,STATE.WKING
			cmp  al,'K'
			 je  .FoundPiece
			mov  edi,STATE.BPIECES
			mov  edx,STATE.BPAWNS
			cmp  al,'p'
			 je  .FoundPiece
			mov  edx,STATE.BKNIGHTS
			cmp  al,'n'
			 je  .FoundPiece
			mov  edx,STATE.BBISHOPS
			cmp  al,'b'
			 je  .FoundPiece
			mov  edx,STATE.BROOKS
			cmp  al,'r'
			 je  .FoundPiece
			mov  edx,STATE.BQUEENS
			cmp  al,'q'
			 je  .FoundPiece
			mov  edx,STATE.BKING
			cmp  al,'k'
			 je  .FoundPiece
			sub  eax,'0'
			 js  .Failed
			cmp  eax,8
			 ja  .Failed
.Spaces:		add  ecx,eax
			jmp  .PieceDone
.FoundPiece:		bts  qword[rbp+rdx],rcx
			bts  qword[rbp+rdi],rcx
			sub  edx,edi
			shr  edx,3
			mov  byte[rbp+STATE.BOARD+rcx],dl
			add  ecx,1
.PieceDone:		cmp  ecx,64
			 jb  .ExpectPieceOrSlash
.Turn:		       call  SkipSpaces
		      lodsb
			mov  byte[rbp+STATE.XSIDE],-1

			cmp  al,'b'
			jne  .Castling
			xor  word[rbp+STATE.SIDE],-1

.Castling:	       call  SkipSpaces
		      lodsb
			cmp  al,'-'
			 je  .EpSquare
			cmp  al,'K'
			jne  @f
			 or  byte[rbp+STATE.CASTLING],1
		      lodsb
		 @@:	cmp  al,'Q'
			jne  @f
			 or  byte[rbp+STATE.CASTLING],2
		      lodsb
		 @@:	cmp  al,'k'
			jne  @f
			 or  byte[rbp+STATE.CASTLING],4
		      lodsb
		 @@:	cmp  al,'q'
			jne  @f
			 or  byte[rbp+STATE.CASTLING],8
		 @@:

.EpSquare:	       call  SkipSpaces
			xor  eax,eax
		      lodsb
			cmp  al,'-'
			 je  .FiftyMoves
			sub  al,'a'
			 js  .Failed
			cmp  al,8
			jae  .Failed

			mov  ecx,eax

			xor  eax,eax
		      lodsb
			sub  al,'1'
			 js  .Failed
			cmp  al,8
			jae  .Failed
			xor  eax,7
			shl  eax,3
			 or  eax,ecx
			bts  qword[rbp+STATE.EPSQUARE],rax

.FiftyMoves:	       call  SkipSpaces
		       call  ParseInteger
			mov  byte[rbp+STATE.REPEAT],0


.MoveNumber:	       call  SkipSpaces
		       call  ParseInteger	 ; do nothing with this integer, don't care about move number

			pop  rbp

		       call  VerifyPosition
		       test  eax,eax
			 jz  .Failed

		       call  FillInPosition

			 or  eax,-1
			ret

.Failed:		xor  eax,eax
			pop  rbp
			ret



