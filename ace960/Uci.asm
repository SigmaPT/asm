UciOptions_Init:
		lea   rax, [uciOptions]
		mov   dword[rax+UciOptions.hash], 32
		mov   dword[rax+UciOptions.multiPV], 1
		mov   dword[rax+UciOptions.slowMover], 80
		mov   dword[rax+UciOptions.minThinkTime], 20
		mov   dword[rax+UciOptions.threads], 1
		mov   dword[rax+UciOptions.weakness], 0
		mov   dword[rax+UciOptions.chess960], 0
		ret




UciLoop:
	       push   rbp rsi rdi r12 r13 r14 r15

		lea   rbp, [pos]

		xor   eax, eax
		mov   qword[pos+Pos.stateTable], rax
		mov   qword[pos2+Pos.stateTable], rax

		mov   ecx, 4096
		mov   qword[InputBufferSizeB], rcx
	       call   _VirtualAlloc
		mov   qword[InputBuffer], rax

		lea   rsi, [szStartPosition]
	       call   Position_ParseFEN

		lea   rdi, [Output]
		lea   rcx, [szGreeting]
	       call   PrintString
		jmp   UciWriteOut

UciQuit:
		lea   rcx, [mainThread]
		mov   byte[signals.stop], -1
	       call   Thread_StartSearching_TRUE

		lea   rcx, [mainThread]
	       call   Thread_WaitForSearchFinished

		mov   rcx, qword[InputBuffer]
	       call   _VirtualFree
		xor   ecx, ecx
		mov   qword[InputBuffer], rcx
		mov   qword[InputBufferSizeB], rcx

		mov   rcx, qword[pos2+Pos.stateTable]
	       call   _VirtualFree
		mov   rcx, qword[pos+Pos.stateTable]
	       call   _VirtualFree

		pop   r15 r14 r13 r12 rdi rsi rbp
		ret


UciWriteOut:
	       call   _WriteOut_Output
UciGetInput:

match =1, VERBOSE {
		lea   rdi, [Output]
		mov   rax, 'response'
	      stosq
		mov   rax, ' time:  '
	      stosq
	       call   _GetTime
		sub   rdx, qword[VerboseTime1+8*0]
		sbb   rax, qword[VerboseTime1+8*1]
		mov   r8, rax
		mov   rax, rdx
		mov   ecx, 1000
		mul   rcx
		add   rdx, r8
		mov   rax, rdx
	       call   PrintUnsignedInteger
		mov   eax, ' us' + (10 shl 24)
	      stosd
	       call   _WriteOut_Output
}


	@@:
		lea   rbp, [pos]
	       call   _ReadIn
		cmp   byte[rsi], ' '
		 jb   @b	    ; don't process empty lines



match =1, VERBOSE {
	       call   _GetTime
		mov   qword[VerboseTime1+8*0], rdx
		mov   qword[VerboseTime1+8*1], rax
}


	    ;    mov   ecx, 100
	    ;   call   _Sleep


;                mov   rdi, rsi
;               call   _ErrorBox

UciChoose:
	       call   SkipSpaces

	    stdcall   CmpString, 'position'
	       test   eax, eax
		jnz   UciPosition
	    stdcall   CmpString, 'stop'
	       test   eax, eax
		jnz   UciStop
	    stdcall   CmpString, 'go'
	       test   eax, eax
		jnz   UciGo
	    stdcall   CmpString, 'uci'
	       test   eax, eax
		jnz   UciUci
	    stdcall   CmpString, 'setoption'
	       test   eax, eax
		jnz   UciSetOption
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
	    stdcall   CmpString, 'test'
	       test   eax, eax
		jnz   UciTest
	    stdcall   CmpString, 'eval'
	       test   eax, eax
		jnz   UciEval
UciUnknown:
		lea   rdi, [Output]
	    stdcall   PrintString, 'error: unknown command '
	       call   ParseToken
		mov   al, 10
	      stosb
		jmp   UciWriteOut


;;;;;;;;;;;;
; is ready
;;;;;;;;;;;;

UciIsReady:
		lea   rdi, [Output]
		mov   rax, 'readyok' + (10 shl 56)
	      stosd
		jmp   UciWriteOut



UciStop:
		mov   byte[signals.stop], -1
		lea   rcx, [mainThread]
	       call   Thread_StartSearching_TRUE
		jmp   UciGetInput



;;;;;;;
; go
;;;;;;;

UciGo:
	       call   UciParseGo
		jmp   UciGetInput
UciParseGo:
	; in: rbp pos
	;     rsi string
	       push   rbx rdi r13 r14 r15
virtual at rsp
  .limits rb sizeof.Limits
  .lend rb 0
end virtual
.lsize = ((.lend-rsp+15) and (-16))
		sub   rsp, .lsize

		lea   rcx, [.limits]
		mov   rbx, rcx
	       call   Limits_Init
.ReadLoop:
	       call   SkipSpaces
		cmp   byte[rsi], ' '
		 jb   .ReadLoopDone
		lea   rdi, [rbx+Limits.time+4*White]
	     szcall   CmpString, 'wtime'
	       test   eax, eax
		jnz   .parse_dword
		lea   rdi, [rbx+Limits.time+4*Black]
	     szcall   CmpString, 'btime'
	       test   eax, eax
		jnz   .parse_dword
		lea   rdi, [rbx+Limits.incr+4*White]
	     szcall   CmpString, 'winc'
	       test   eax, eax
		jnz   .parse_dword
		lea   rdi, [rbx+Limits.incr+4*Black]
	     szcall   CmpString, 'binc'
	       test   eax, eax
		jnz   .parse_dword

		lea   rdi, [rbx+Limits.infinite]
	     szcall   CmpString, 'infinite'
	       test   eax, eax
		jnz   .parse_true

		lea   rdi, [rbx+Limits.movestogo]
	     szcall   CmpString, 'movestogo'
	       test   eax, eax
		jnz   .parse_dword

		lea   rdi, [rbx+Limits.nodes]
	     szcall   CmpString, 'nodes'
	       test   eax, eax
		jnz   .parse_qword

		lea   rdi, [rbx+Limits.movetime]
	     szcall   CmpString, 'movetime'
	       test   eax, eax
		jnz   .parse_dword

		lea   rdi, [rbx+Limits.depth]
	     szcall   CmpString, 'depth'
	       test   eax, eax
		jnz   .parse_dword

		lea   rdi, [rbx+Limits.mate]
	     szcall   CmpString, 'mate'
	       test   eax, eax
		jnz   .parse_dword

		lea   rdi, [rbx+Limits.ponder]
	     szcall   CmpString, 'ponder'
	       test   eax, eax
		jnz   .parse_true

	       call   SkipToken
		jmp   .ReadLoop
.ReadLoopDone:
		lea   rcx, [.limits]
	       call   Limits_Set
		lea   rcx, [.limits]
	       call   ThreadPool_StartThinking
		add   rsp, .lsize
		pop   r15 r14 r13 rdi rbx
		ret

.parse_qword:
	       call   SkipSpaces
	       call   ParseInteger
		mov   qword[rdi], rax
		jmp   .ReadLoop
.parse_dword:
	       call   SkipSpaces
	       call   ParseInteger
		mov   dword[rdi], eax
		jmp   .ReadLoop
.parse_true:
		mov   byte[rdi], -1
		jmp   .ReadLoop





;;;;;;;;;;;;
; position
;;;;;;;;;;;;

UciPosition:
	       call   SkipSpaces
		cmp   byte[rsi], ' '
		 jb   UciUnknown

	; write to pos2 in case of failure
		lea   rbp, [pos2]

	     szcall   CmpString, 'fen'
	       test   eax, eax
		jnz   .Fen
	     szcall   CmpString, 'startpos'
	       test   eax, eax
		 jz   .BadCmd
.Start:
		mov   r15, rsi
		lea   rsi, [szStartPosition]
	       call   Position_ParseFEN
		mov   rsi, r15
		jmp   .check
.Fen:
	       call   Position_ParseFEN
.check:
	       test   eax, eax
		jnz   .illegal
.moves:
	; copy pos2 to pos  before parsing moves
		lea   rcx, [pos]
	       call   Position_CopyTo
		lea   rbp, [pos]

	       call   SkipSpaces
	     szcall   CmpString, 'moves'
	       test   eax, eax
		 jz   UciGetInput
	       call   UciParseMoves
	       test   rax, rax
		 jz   UciGetInput
.badmove:
		mov   rsi, rax
		lea   rdi, [Output]
	     szcall   PrintString, 'error: illegal move '
	       call   ParseToken
		mov   al, 10
	      stosb
		lea   rbp, [pos]
		jmp   UciWriteOut
.illegal:
		lea   rdi, [Output]
	     szcall   PrintString, 'error: illegal fen'
		mov   al, 10
	      stosb
		lea   rbp, [pos]
		jmp   UciWriteOut
.BadCmd:
		lea   rbp, [pos]
		jmp   UciUnknown
UciParseMoves:
	; in: rbp position
	;     rsi string
	; rax = 0 if full string could be parsed
	;     = address of illegal move if there is one
	       push   rbx rsi rdi
.get_move:
	       call   SkipSpaces
		xor   eax, eax
		cmp   byte[rsi], ' '
		 jb   .done
	       call   ParseUciMove
		mov   edi, eax
	       test   eax, eax
		mov   rax, rsi
		 jz   .done
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
	       call   GivesCheck
	      movzx   ecx, word[rbx+State.move+sizeof.State]
		mov   edx, eax
	       call   DoMove__UciParseMoves
		mov   qword[rbp+Pos.state], rbx
	       call   SetCheckInfo
		jmp   .get_move
.done:
		pop   rdi rsi rbx
		ret



;;;;;;;;;;;;
; setoption
;;;;;;;;;;;;


UciSetOption:
	       call   ParseSetOption
		jmp   UciGetInput
ParseSetOption:
	       push   rbx
.Read:
	       call   SkipSpaces
		cmp   byte[rsi], ' '
		 jb   .Error

	     szcall   CmpString, 'name'
	       test   eax, eax
		 jz   .Error
	       call   SkipSpaces

	     szcall   CmpStringCaseLess, 'Hash'
		lea   rbx, [.Hash]
	       test   eax, eax
		jnz   .CheckValue
	     szcall   CmpStringCaseLess, 'Threads'
		lea   rbx, [.Threads]
	       test   eax, eax
		jnz   .CheckValue
	     szcall   CmpStringCaseLess, 'MultiPv'
		lea   rbx, [.MultiPv]
	       test   eax, eax
		jnz   .CheckValue
	     szcall   CmpStringCaseLess, 'Weakness'
		lea   rbx, [.Weakness]
	       test   eax, eax
		jnz   .CheckValue
	     szcall   CmpStringCaseLess, 'UCI_Chess960'
		lea   rbx, [.Weakness]
	       test   eax, eax
		jnz   .CheckValue
.Error:
		lea   rdi, [Output]
	     szcall   PrintString, 'error: setoption has no value'
		mov   al, 10
	      stosb
	       call   _WriteOut_Output
		pop   rbx
		ret
.CheckValue:
	       call   SkipSpaces
	     szcall   CmpString, 'value'
	       test   eax, eax
		 jz   .Error
	       call   SkipSpaces
		jmp   rbx

.Hash:
	       call   ParseInteger
      ClampUnsigned   eax, 1, 1 shl MAX_HASH_LOG2MB
		mov   ecx, eax
		mov   dword[uciOptions.hash], eax
	       call   MainHash_Allocate
		pop   rbx
		ret
.Threads:
	       call   ParseInteger
      ClampUnsigned   eax, 1, MAX_THREADS
		mov   dword[uciOptions.threads], eax
	       call   ThreadPool_ReadOptions
		pop   rbx
		ret
.MultiPv:
	       call   ParseInteger
      ClampUnsigned   eax, 1, MAX_MOVES
		mov   dword[uciOptions.multiPV], eax
		pop   rbx
		ret
.Weakness:
	       call   ParseInteger
      ClampUnsigned   eax, 0, 1000
		mov   dword[uciOptions.weakness], eax
		pop   rbx
		ret
.Chess960:
	       call   ParseBoole
		mov   dword[uciOptions.chess960], eax
		pop   rbx
		ret






;;;;;;;;;;;;
; *extras*
;;;;;;;;;;;;


UciPick:
	     ;  call   TestPick
		jmp   UciGetInput



UciPerftP:
	     ;           xor   eax, eax
	     ;    ;       mov   qword[rbp+Pos.nodes], rax
	     ;          call   SkipSpaces
	     ;          call   ParseInteger
	     ;           mov   ecx, eax
	     ;          call   PerftPick_Root
			jmp   UciGetInput



UciPerft:
	       call   SkipSpaces
	       call   ParseInteger
	       test   eax, eax
		 jz   .bad_depth
		cmp   eax, 9
		 ja   .bad_depth
		mov   esi, eax
		mov   ecx, eax
	       call   Position_SetExtraCapacity
		mov   ecx, esi
	       call   PerftGen_Root
		jmp   UciGetInput
.bad_depth:
		lea   rdi, [Output]
	     szcall   PrintString, 'error: bad depth '
	       call   ParseToken
		mov   al, 10
	      stosb
		jmp   UciWriteOut



UciUci:
		lea   rdi, [Output]
		lea   rcx, [szUCIresponse]
	       call   PrintString
		jmp   UciWriteOut

UciShow:
		lea   rdi, [Output]
		mov   rbx, qword[rbp+Pos.state]
	       call   Position_Print
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
	       call   Position_VerifyState
		lea   rcx, [szOK]
		lea   rdx, [szError]
		lea   rdi, [Output]
	       test   eax, eax
	      cmovz   rcx, rdx
	       call   PrintString
		jmp   UciWriteOut

UciIsOk:
		mov   rbx, qword[rbp+Pos.state]
	       call   Position_IsLegal
		lea   rdi, [Output]
		mov   rcx, rdx
	       call   PrintString
		jmp   UciWriteOut

UciUndo:
		mov   rbx, qword[rbp+Pos.state]
	       call   SkipSpaces
	       call   ParseInteger
		mov   r15d, eax
		cmp   r15d, 1
		adc   r15d, 0
		sub   r15d, 1
.Undo:
		cmp   rbx, qword[rbp+Pos.stateTable]
		jbe   UciShow
	      movzx   ecx, word[rbx+State.move]
	       call   UndoMove
		sub   r15d, 1
		jns   .Undo
		jmp   UciShow


UciMoves:
		lea   rbp, [pos]
	       call   UciParseMoves
		jmp   UciShow


UciTest:
		mov   rdi, [InputBuffer]
	     szcall   PrintString, 'position startpos moves c2c4 g8f6 d2d4 e7e6 g1f3 d7d5 b1c3 f8e7 c1g5 h7h6 g5h4 e8g8 e2e3 b8c6 c4d5 f6d5 c3d5 e6d5 h4g3 a7a5 f1e2'
		mov   eax, 10
	      stosd
		mov   rsi, [InputBuffer]
		jmp   UciChoose

	       call   Position_Test
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