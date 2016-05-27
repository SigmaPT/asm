

XBoardLoop:
	       push   rbp rsi rdi r12 r13 r14 r15
virtual at rsp
  .comp_side rd 1
  .limits rb sizeof.Limits
  .output rb 256
  .lend   rb 0
end virtual
.lsize = ((.lend-rsp+15) and (-16))
		sub   rsp, .lsize
		mov   rbx, rcx

		lea   rcx, [Position_WriteOutInfo_Xboard]
		mov   qword[options.printFxn], rcx

		mov   byte[XBoardMode], -1

		xor   eax, eax
		mov   qword[pos1.stateTable], rax
		mov   qword[pos2.stateTable], rax

		lea   rbp, [pos1]
		lea   rsi, [szStartFEN]
	       call   Position_ParseFEN

		jmp   .Observing

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.Quit:
		lea   rcx, [mainThread]
		mov   byte[signals.stop], -1
	       call   Thread_StartSearching_TRUE

		lea   rcx, [mainThread]
	       call   Thread_WaitForSearchFinished

		mov   rcx, qword[pos2.stateTable]
	       call   _VirtualFree
		mov   rcx, qword[pos1.stateTable]
	       call   _VirtualFree

		add   rsp, .lsize
		pop   r15 r14 r13 r12 rdi rsi rbp
		ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.Observing:
	       call   _ReadIn
		cmp   byte[rsi], ' '
		 jb   .Observing
	    stdcall   CmpString, 'time'
	       test   eax, eax
		jnz   .Time
	    stdcall   CmpString, 'otim'
	       test   eax, eax
		jnz   .OTime
	    stdcall   CmpString, 'go'
	       test   eax, eax
		jnz   .Go
	    stdcall   CmpString, 'force'
	       test   eax, eax
		jnz   .Force
	    stdcall   CmpString, 'post'
	       test   eax, eax
		jnz   .Post
	    stdcall   CmpString, 'nopost'
	       test   eax, eax
		jnz   .NoPost
	    stdcall   CmpString, 'white'
	       test   eax, eax
		jnz   .White
	    stdcall   CmpString, 'black'
	       test   eax, eax
		jnz   .Black
	    stdcall   CmpString, 'quit'
	       test   eax, eax
		jnz   .Quit
	    stdcall   CmpString, 'new'
	       test   eax, eax
		jnz   .New
	       test   eax, eax
		jnz   .Black
	       call   ParseUciMove
		mov   edi, eax
	       test   eax, eax
		jnz   .usermove

.Unknown:
		lea   rdi, [Output]
	    stdcall   PrintString, 'error: unknown command '
		mov   ecx, 64
	       call   _ParseToken
		mov   al, 10
	      stosb
	       call   _WriteOut_Output
		jmp   .Observing

.Time:
		jmp   .Observing

.OTime:
		jmp   .Observing

.Force:
		mov   dword[.comp_side], 0
		jmp   .Observing

.White:
		mov   dword[.comp_side], 1
		jmp   .Observing

.Black:
		mov   dword[.comp_side], 2
		jmp   .Observing

.Post:
		lea   rcx, [Position_WriteOutInfo_Xboard]
		mov   qword[options.printFxn], rcx
		jmp   .Observing

.NoPost:
		lea   rcx, [Position_WriteOutInfo_None]
		mov   qword[options.printFxn], rcx
		jmp   .Observing

.New:
		mov   dword[.comp_side], 2
		lea   rbp, [pos1]
		lea   rsi, [szStartFEN]
	       call   Position_ParseFEN
		jmp   .Observing

.Go:
		mov   eax, dword[rbp+Pos.sideToMove]
		add   eax, 1
		mov   dword[.comp_side], eax

.calculate:
		lea   rcx, [.limits]
	       call   Limits_Init
		lea   rcx, [.limits]
		mov   dword[rcx+Limits.time+4*0], 100000
		mov   dword[rcx+Limits.time+4*1], 100000
		mov   dword[rcx+Limits.incr+4*0], 4000
		mov   dword[rcx+Limits.incr+4*1], 4000

		mov   dword[XBoardMove], 0
	       call   Limits_Set
		lea   rcx, [.limits]
	       call   ThreadPool_StartThinking
		lea   rcx, [mainThread]
	       call   Thread_WaitForSearchFinished

	; the main search thread will print the move
	; we just need to update our board with the move
		mov   edi, dword[XBoardMove]
		mov   rbx, qword[rbp+Pos.state]
		mov   rax, rbx
		sub   rax, qword[rbp+Pos.stateTable]
		xor   edx, edx
		mov   ecx, sizeof.State
		div   ecx
	     Assert   e, edx, 0, 'weird remainder in UciParseMoves'
		lea   ecx, [rax+8]
		shr   ecx, 2
		add   ecx, eax
	       call   Position_SetExtraCapacity
		mov   rbx, qword[rbp+Pos.state]
		mov   ecx, edi
		mov   word[rbx+State.move+sizeof.State], cx
	       call   Move_GivesCheck
	      movzx   ecx, word[rbx+State.move+sizeof.State]
		mov   edx, eax
	       call   Move_Do__UciParseMoves
		mov   qword[rbp+Pos.state], rbx
	       call   SetCheckInfo
		jmp   .Observing

.usermove:
	; edi: move
		mov   rbx, qword[rbp+Pos.state]
		mov   rax, rbx
		sub   rax, qword[rbp+Pos.stateTable]
		xor   edx, edx
		mov   ecx, sizeof.State
		div   ecx
	     Assert   e, edx, 0, 'weird remainder in UciParseMoves'
		lea   ecx, [rax+8]
		shr   ecx, 2
		add   ecx, eax
	       call   Position_SetExtraCapacity
		mov   rbx, qword[rbp+Pos.state]
		mov   ecx, edi
		mov   word[rbx+State.move+sizeof.State], cx
	       call   Move_GivesCheck
	      movzx   ecx, word[rbx+State.move+sizeof.State]
		mov   edx, eax
	       call   Move_Do__UciParseMoves
		mov   qword[rbp+Pos.state], rbx
	       call   SetCheckInfo


		mov   eax, dword[rbp+Pos.sideToMove]
		add   eax, 1
	       test   eax, dword[.comp_side]
		jnz   .calculate

		jmp   .Observing


;;;;;;;;;;;;;;;;;;;;;;