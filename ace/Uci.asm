UciLoop:
		       push   rbp rsi rdi r12 r13 r14 r15

			lea   rbp, [pos]

			mov   ecx, 4096
			mov   qword [InputBufferSizeB], rcx
		       call   _VirtualAlloc
			mov   qword [InputBuffer], rax

			mov   ecx, 256*sizeof.State
		       call   _VirtualAlloc
			mov   qword [rbp+Pos.state], rax
			mov   qword [rbp+Pos.stateTable], rax
			add   rax, 256*sizeof.State
			mov   qword [rbp+Pos.stateEnd], rax

			lea   rsi, [szStartPosition]
		       call   ParseFEN

			lea   rdi, [Output]
			lea   rcx, [szGreeting]
		       call   PrintString
	if CPU_HAS_POPCNT eq 1
			lea   rcx, [szCPUError.POPCNT]
		       call   PrintString
	end if
	if CPU_HAS_AVX1 eq 1
			lea   rcx, [szCPUError.AVX1]
		       call   PrintString
	end if
	if CPU_HAS_AVX2 eq 1
			lea   rcx, [szCPUError.AVX2]
		       call   PrintString
	end if
	if CPU_HAS_BMI1 eq 1
			lea   rcx, [szCPUError.BMI1]
		       call   PrintString
	end if
	if CPU_HAS_BMI2 eq 1
			lea   rcx, [szCPUError.BMI2]
		       call   PrintString
	end if
			mov  al, 10
		      stosb

			jmp   UciWriteOut

UciQuit:
			lea   rcx, [mainThread]
			mov   byte [Signals.stop], 1
		       call   _ZN10ThreadBase10notify_oneEv

			lea   rcx, [threadPool]
		       call   _ZN10ThreadPool23wait_for_think_finishedEv

			mov   rcx, qword[InputBuffer]
		       call   _VirtualFree
			xor   ecx, ecx
			mov   qword [InputBuffer], rcx
			mov   qword [InputBufferSizeB], rcx

			pop   r15 r14 r13 r12 rdi rsi rbp
			ret


UciWriteOut:
			lea   rcx, [Output]
		       call   _WriteOut
UciGetInput:
		       call   _ReadIn

			cmp   byte [rsi], ' '
			 jb   UciGetInput

		       call   SkipSpaces

		    stdcall   CmpString, 'uci'
		       test   eax, eax
			jnz   UciUci
		    stdcall   CmpString, 'setoption'
		       test   eax, eax
			jnz   UciSetOption
		    stdcall   CmpString, 'go'
		       test   eax, eax
			jnz   UciGo
		    stdcall   CmpString, 'position'
		       test   eax, eax
			jnz   UciPosition
		    stdcall   CmpString, 'quit'
		       test   eax, eax
			jnz   UciQuit
		    stdcall   CmpString, 'isready'
		       test   eax, eax
			jnz   UciIsReady

		    stdcall   CmpString, 'pick'
		       test   eax, eax
			jnz   UciPick
		    stdcall   CmpString, 'show'
		       test   eax, eax
			jnz   UciShow
		    stdcall   CmpString, 'undo'
		       test   eax, eax
			jnz   UciUndo
		    stdcall   CmpString, 'verify'
		       test   eax, eax
			jnz   UciVerify
		    stdcall   CmpString, 'isok'
		       test   eax, eax
			jnz   UciIsOk
		    stdcall   CmpString, 'perftp'
		       test   eax, eax
			jnz   UciPerftP
		    stdcall   CmpString, 'perft'
		       test   eax, eax
			jnz   UciPerft
		    stdcall   CmpString, 'moves'
		       test   eax, eax
			jnz   UciMoves
		    stdcall   CmpString, 'stop'
		       test   eax, eax
			jnz   UciStop
		    stdcall   CmpString, 'test'
		       test   eax, eax
			jnz   UciTest
		    stdcall   CmpString, 'eval'
		       test   eax, eax
			jnz   UciEval
UciUnknown:
			lea   rdi, [Output]
		    stdcall   PrintString, 'unknown command'
			mov   al, 10
		      stosb
			jmp   UciWriteOut


UciIsReady:
			lea   rdi, [Output]
		    stdcall   PrintString, 'readyok'
			jmp   UciWriteOut


UciPick:
		       call   TestPick
			jmp   UciGetInput


UciStop:
			lea   rcx, [mainThread]
			mov   byte [Signals.stop], 1
		       call   _ZN10ThreadBase10notify_oneEv
			jmp   UciGetInput


UciGo:
			mov   byte [Signals.stop], 0
		       call   ParseGo
			jmp   UciGetInput

UciPerftP:
			xor   eax, eax
			mov   qword [rbp+Pos.nodes], rax
		       call   SkipSpaces
		       call   ParseInteger
			mov   ecx, eax
		       call   PerftPick_Root
			jmp   UciGetInput



UciPerft:
		       call   SkipSpaces
		       call   ParseInteger
			mov   ecx, eax
		       call   PerftGen_Root

  if DEBUG
			cmp   byte [perft_ok], -1
			 je   UciGetInput
			lea   rdi, [Output]
		    stdcall   PrintString, 'failed'
			mov   al, 10
		      stosb
			jmp   UciWriteOut
  else
			jmp   UciGetInput
  end if



UciUci:
			lea   rdi, [Output]
			lea   rcx, [szUCIresponse]
		       call   PrintString
			jmp   UciWriteOut

UciShow:
			lea   rdi, [Output]
		       call   PrintPosition
			jmp   UciWriteOut

UciEval:
		       call   Evaluate
			lea   rdi, [Output]
			mov   ecx, eax
		       call   PrintUciScore
			mov   al, 10
		      stosb
			jmp   UciWriteOut

UciVerify:
		       call   VerifyPositionState
			lea   rcx, [szOK]
			lea   rdx, [szError]
			lea   rdi, [Output]
		       test   eax, eax
		      cmovz   rcx, rdx
		       call   PrintString
			jmp   UciWriteOut

UciIsOk:
			mov   rbx, qword [rbp+Pos.state]
		       call   IsPositionOk
			lea   rdi, [Output]
			mov   rcx, rdx
		       call   PrintString
			jmp   UciWriteOut

UciUndo:
			mov   rbx, qword [rbp+Pos.state]
		       call   SkipSpaces
		       call   ParseInteger
			mov   r15d, eax
			cmp   r15d, 1
			adc   r15d, 0
			sub   r15d, 1
.Undo:
			cmp   rbx, qword [rbp+Pos.stateTable]
			jbe   UciShow
		      movzx   ecx, word [rbx+State.move]
		       call   UndoMove
			sub   r15d, 1
			jns   .Undo
			jmp   UciShow

UciSetOption:
		       call   ParseSetOption
			jmp   UciGetInput
UciMoves:
		       call   ParseMoves
			jmp   UciShow


UciTest:
		       call   TestPosition
			lea   rdi,[Output]
		       test   eax, eax
			jnz   .Failed
			lea   rcx, [szOK]
		       call   PrintString
			jmp   UciWriteOut
.Failed:
			mov   ecx, eax
		       call   PrintUciMoveLong
		     szcall   PrintString, ' failed'
			mov   al, 10
		      stosb
			jmp   UciWriteOut



UciPosition:
		       call   SkipSpaces
			cmp   byte [rsi], ' '
			 jb   UciUnknown

	; write temorarily to Output in case of falure
			lea   rbp, [Output]
			lea   rbx, [rbp+sizeof.Pos]
			mov   qword [rbp+Pos.stateTable], rbx

		     szcall   CmpString, 'fen'
		       test   eax, eax
			jnz   .Fen
		     szcall   CmpString, 'startpos'
		       test   eax, eax
			jnz   .Start
.BadCmd:
			lea   rbp, [pos]
			jmp   UciUnknown

.Start:
			mov   r15, rsi
			lea   rsi, [szStartPosition]
		       call   ParseFEN
			mov   rsi, r15
.Moves:
		; free old state table and get new one
			lea   rbp, [pos]
			mov   rcx, [rbp+Pos.stateTable]
		       call   _VirtualFree
			mov   ecx, 256*sizeof.State
		       call   _VirtualAlloc

		; copy temp to pos
			mov   qword [rbp+Pos.state], rax
			mov   qword [rbp+Pos.stateTable], rax
			mov   rcx, rax
			add   rax, 256*sizeof.State
			mov   qword [rbp+Pos.stateEnd], rax
			lea   rbx, [Output]
		       call   PositionCopy

		       call   SkipSpaces
		     szcall   CmpString, 'moves'
		       test   eax, eax
			 jz   UciGetInput
		       call   ParseMoves
			jmp   UciGetInput
.Fen:
		       call   SkipSpaces
		       call   ParseFEN
		       call   IsPositionOk
		       test   eax, eax
			jnz   .Moves
.Error:
			lea   rdi, [Output]
		     szcall   PrintString, 'illegal fen'
			mov   al, 10
		      stosb
			jmp   UciWriteOut



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ParseMoves:
	; the capacity the .stateTable buffer changes based on how many moves are made
		       push   rbx rsi rdi r12 r13 r14 r15
			mov   rbx, qword [rbp+Pos.state]
.GetMoves:
		       call   SkipSpaces
			cmp   byte [rsi], ' '
			 jb   .Done
		       call   ParseUciMove
			mov   ecx, eax
			mov   edi, eax
		       test   eax, eax
			 jz   .Done
			mov   word [rbx+State.move+sizeof.State], ax
		       call   GivesCheck
			mov   ecx, edi
			mov   edx, eax
		       call   DoMove_SetFullCi

			lea   r13, [rbx+sizeof.State]
			mov   rcx, qword [rbp+Pos.stateEnd]
			cmp   r13, rcx
			 jb   .GetMoves
.ReAlloc:
			mov   r14, rsi
			mov   rsi, qword [rbp+Pos.stateTable]
			sub   rcx, rsi
			add   ecx, 256*sizeof.State
			mov   r12d, ecx
		       call   _VirtualAlloc
			mov   rdi, rax
			add   r12, rax
			sub   r13, rsi
			lea   rbx, [r13-sizeof.State+rax]
			mov   rcx, r13
			mov   qword [rbp+Pos.state], rbx
			mov   qword [rbp+Pos.stateTable], rax
			mov   qword [rbp+Pos.stateEnd], r12
		       push   rsi
		  rep movsb
			pop   rcx
		       call   _VirtualFree
			mov   rsi, r14
			jmp   .GetMoves

.Done:			pop   r15 r14 r13 r12 rdi rsi rbx
			ret


