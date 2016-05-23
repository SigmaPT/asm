Options_Init:
		lea   rax, [options]
		lea   rcx, [Position_WriteOutInfo_Uci]
		mov   qword[rax+Options.printFxn], rcx
		mov   dword[rax+Options.hash], 16
		mov   dword[rax+Options.multiPV], 1
		mov   dword[rax+Options.slowMover], 80
		mov   dword[rax+Options.minThinkTime], 20
		mov   dword[rax+Options.threads], 1
		mov   dword[rax+Options.weakness], 0
		mov   dword[rax+Options.chess960], 0
		ret




UciLoop:
	       push   rbp rsi rdi r12 r13 r14 r15

		lea   rbp, [pos1]
		lea   rsi, [szStartFEN]
	       call   Position_ParseFEN
		jmp   UciUci



UciUci:
		lea   rdi, [Output]
		lea   rcx, [szUCIresponse]
	       call   PrintString


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
		mov   r8, rdx
		mov   ecx, 1000
		mul   rcx
	       xchg   rax, r8
		mul   rcx
		lea   rax, [r8+rdx]
	       call   PrintUnsignedInteger
		mov   eax, ' us' + (10 shl 24)
	      stosd
	       call   _WriteOut_Output
}


	@@:    call   _ReadIn
		cmp   byte[rsi], ' '
		 jb   @b	    ; don't process empty lines
		lea   rbp, [pos1]



match =1, VERBOSE {
	       call   _GetTime
		mov   qword[VerboseTime1+8*0], rdx
		mov   qword[VerboseTime1+8*1], rax
}


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
	    stdcall   CmpString, 'isready'
	       test   eax, eax
		jnz   UciIsReady
	    stdcall   CmpString, 'ucinewgame'
	       test   eax, eax
		jnz   UciNewGame
	    stdcall   CmpString, 'uci'
	       test   eax, eax
		jnz   UciUci
	    stdcall   CmpString, 'setoption'
	       test   eax, eax
		jnz   UciSetOption
	    stdcall   CmpString, 'quit'
	       test   eax, eax
		jnz   UciQuit

	    stdcall   CmpString, 'perft'
	       test   eax, eax
		jnz   UciPerft

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
	    stdcall   CmpString, 'moves'
	       test   eax, eax
		jnz   UciMoves
	    stdcall   CmpString, 'donull'
	       test   eax, eax
		jnz   UciDoNull
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




UciQuit:
		lea   rcx, [mainThread]
		mov   byte[signals.stop], -1
	       call   Thread_StartSearching_TRUE

		lea   rcx, [mainThread]
	       call   Thread_WaitForSearchFinished

		mov   rcx, qword[pos2.stateTable]
	       call   _VirtualFree
		mov   rcx, qword[pos1.stateTable]
	       call   _VirtualFree
		xor   eax, eax
		mov   qword[pos1.stateTable], rax
		mov   qword[pos2.stateTable], rax

		pop   r15 r14 r13 r12 rdi rsi rbp
		ret

UciNewGame:
	       call   Search_Clear
		jmp   UciGetInput

;;;;;;;;;;;;
; isready
;;;;;;;;;;;;

UciIsReady:
		lea   rdi, [Output]
		mov   rax, 'readyok' + (10 shl 56)
	      stosq
		jmp   UciWriteOut

;;;;;;;;
; stop
;;;;;;;;

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
		lea   rsi, [szStartFEN]
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
		lea   rcx, [pos1]
	       call   Position_CopyTo
		lea   rbp, [pos1]

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
		lea   rbp, [pos1]
		jmp   UciWriteOut
.illegal:
		lea   rdi, [Output]
	     szcall   PrintString, 'error: illegal fen'
		mov   al, 10
	      stosb
		lea   rbp, [pos1]
		jmp   UciWriteOut
.BadCmd:
		lea   rbp, [pos1]
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
	       call   Move_GivesCheck
	      movzx   ecx, word[rbx+State.move+sizeof.State]
		mov   edx, eax
	       call   Move_Do__UciParseMoves
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

	     szcall   CmpStringCaseless, 'Hash'
		lea   rbx, [.Hash]
	       test   eax, eax
		jnz   .CheckValue
	     szcall   CmpStringCaseless, 'Threads'
		lea   rbx, [.Threads]
	       test   eax, eax
		jnz   .CheckValue
	     szcall   CmpStringCaseless, 'MultiPv'
		lea   rbx, [.MultiPv]
	       test   eax, eax
		jnz   .CheckValue
	     szcall   CmpStringCaseless, 'Weakness'
		lea   rbx, [.Weakness]
	       test   eax, eax
		jnz   .CheckValue
	     szcall   CmpStringCaseless, 'UCI_Chess960'
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
		mov   dword[options.hash], eax
	       call   MainHash_Allocate
		pop   rbx
		ret
.Threads:
	       call   ParseInteger
      ClampUnsigned   eax, 1, MAX_THREADS
		mov   dword[options.threads], eax
	       call   ThreadPool_ReadOptions
		pop   rbx
		ret
.MultiPv:
	       call   ParseInteger
      ClampUnsigned   eax, 1, MAX_MOVES
		mov   dword[options.multiPV], eax
		pop   rbx
		ret
.Weakness:
	       call   ParseInteger
      ClampUnsigned   eax, 0, 1000
		mov   dword[options.weakness], eax
		pop   rbx
		ret
.Chess960:
	       call   ParseBoole
		mov   dword[options.chess960], eax
		pop   rbx
		ret


















;;;;;;;;;;;;
; *extras*
;;;;;;;;;;;;




UciDoNull:

		mov   rbx, qword[rbp+Pos.state]
		mov   rax, qword[rbx+State.checkersBB]
	       test   rax, rax
		jnz   UciGetInput

		mov   rax, rbx
		sub   rax, qword[rbp+Pos.stateTable]
		xor   edx, edx
		mov   ecx, sizeof.State
		div   ecx
	     Assert   e, edx, 0, 'weird remainder in UciDoNull'
		lea   ecx, [rax+8]
		shr   ecx, 2
		add   ecx, eax
	       call   Position_SetExtraCapacity
		mov   rbx, qword[rbp+Pos.state]
		mov   word[rbx+State.move+sizeof.State], MOVE_NULL
	       call   Move_DoNull
		mov   qword[rbp+Pos.state], rbx
	       call   SetCheckInfo
		jmp   UciShow

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

UciShow:
		lea   rdi, [Output]
		mov   rbx, qword[rbp+Pos.state]
	       call   Position_Print
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
	       call   Move_Undo
		sub   r15d, 1
		jns   .Undo
		jmp   UciShow


UciMoves:
		lea   rbp, [pos1]
	       call   UciParseMoves
		jmp   UciShow


UciTest:
	;        lea   rdi, [Output]
	;        mov   rcx, qword[DistanceRingBB+8*(8*SQ_E1+0)]
	;       call   PrintBitboard
	;        mov   al, 10
	;      stosb
	;        mov   rcx, qword[DistanceRingBB+8*(8*SQ_E1+1)]
	;       call   PrintBitboard
	;        mov   al, 10
	;      stosb
	;        jmp   UciWriteOut



		mov   rdi, [InputBuffer]
	     szcall   PrintString, 'position startpos moves c2c4 e7e5 b1c3 f8b4 c3d5 a7a5 e2e3 g8f6 g1f3 e5e4 f3d4 c7c6 d5b4 a5b4 b2b3 e8g8 c1b2 d7d6 h2h3 f8e8 g2g4 b8a6 h1g1 a6c5 d1c2 f6d7 d4f5 d7e5 f1e2 c8f5 g4f5 d8f6 f2f4 e4f3 e2f1 e5d3 f1d3 f6b2 e1f2 b2f6 f2f3 e8e5 e3e4 a8e8 g1g4 e5e4 d3e4 f6a1 d2d3 a1e5 c2e2 d6d5 c4d5 c6d5 e2e3 d5e4 d3e4 e8d8 f3g2 d8d3 e3f4 e5b2 g2h1 d3d1 g4g1 d1g1 h1g1 b2b1 g1h2 b1a2 h2g1 a2b1 g1h2 b1c2 h2g1 c2d1 g1h2 d1e2 h2g1 h7h6 e4e5 c5e4 e5e6 f7e6 f5e6 e4g5 f4b8 g8h7 h3h4 g5f3 g1h1'
;             szcall   PrintString, 'position startpos moves e2e4 d7d6 d2d4 g8f6 b1c3 g7g6 f2f4 f8g7 e4e5 f6d7 g1f3 e8g8 h2h4 h7h5 e5e6 f7e6 f3g5 f8f6 g2g4 h5g4 d1g4 d7f8 h4h5 e6e5 g4h4 g6h5 f1c4 e7e6 d4e5 d6e5 f4e5 f6h6 c1d2 b8c6 e1c1 d8e7 c3e4 c6e5 c4b3 c8d7 d1g1 e5g4 h4e1 d7c6 d2b4 e7e8 b4c3 e8g6 c3g7 g6g7 c1b1 c6d5 g5f3 f8g6 b3d5 e6d5 e4g3 g7f7 g3h5 f7f3 g1g4 h6h5 g4g6 g8h8'
		mov   eax, 10
	      stosd
		mov   rsi, [InputBuffer]
		jmp   UciChoose

	 ;      call   Position_Test
	 ;       lea   rdi,[Output]
	 ;      test   eax, eax
	 ;       jnz   .Failed
	 ;       lea   rcx, [szOK]
	 ;      call   PrintString
	 ;       jmp   UciWriteOut
.Failed:
		mov   ecx, eax
	       call   PrintUciMoveLong
	     szcall   PrintString, ' failed'
		mov   al, 10
	      stosb
		jmp   UciWriteOut








UciEval:
		lea   rbp, [pos1]
		mov   rbx, qword[rbp+Pos.state]

	; allocate pawn hash
		mov   ecx, PAWN_HASH_ENTRY_COUNT*sizeof.PawnEntry
	       call   _VirtualAlloc
		mov   qword[rbp+Pos.pawnTable], rax
	; allocate material hash
		mov   ecx, MATERIAL_HASH_ENTRY_COUNT*sizeof.MaterialEntry
	       call   _VirtualAlloc
		mov   qword[rbp+Pos.materialTable], rax
	       call   Evaluate
		mov   r15d, eax
	; free material hash
		mov   rcx, qword[rbp+Pos.materialTable]
	       call   _VirtualFree
		xor   eax, eax
		mov   qword[rbp+Pos.materialTable], rax
	; free pawn hash
		mov   rcx, qword[rbp+Pos.pawnTable]
	       call   _VirtualFree
		xor   eax, eax
		mov   qword[rbp+Pos.pawnTable], rax


match =1, VERBOSE {
 .size equ (.trl01-.trl00)

		lea   rsi, [.trl00]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output

		lea   rsi, [.trl01]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output

		lea   rsi, [.trl02]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output



		lea   rsi, [.trl03]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+46]
		mov   eax, dword[trace.Material]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.Material]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output




		lea   rsi, [.trl04]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+46]
		mov   eax, dword[trace.Imbalance]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.Imbalance]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output





		lea   rsi, [.trl05]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+46]
		mov   eax, dword[trace.Pawn]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.Pawn]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output



		mov   eax, dword[trace.Knight+4*0]
		sub   eax, dword[trace.Knight+4*1]
		mov   dword[trace.Knight+4*2], eax
		lea   rsi, [.trl06]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+18]
		mov   eax, dword[trace.Knight+4*0]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+24]
	      movsx   rax, word[trace.Knight+4*0]
	       call   PrintSignedInteger
		lea   rdi, [Output+32]
		mov   eax, dword[trace.Knight+4*1]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+38]
	      movsx   rax, word[trace.Knight+4*1]
	       call   PrintSignedInteger
		lea   rdi, [Output+46]
		mov   eax, dword[trace.Knight+4*2]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.Knight+4*2]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output



		mov   eax, dword[trace.Bishop+4*0]
		sub   eax, dword[trace.Bishop+4*1]
		mov   dword[trace.Bishop+4*2], eax
		lea   rsi, [.trl07]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+18]
		mov   eax, dword[trace.Bishop+4*0]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+24]
	      movsx   rax, word[trace.Bishop+4*0]
	       call   PrintSignedInteger
		lea   rdi, [Output+32]
		mov   eax, dword[trace.Bishop+4*1]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+38]
	      movsx   rax, word[trace.Bishop+4*1]
	       call   PrintSignedInteger
		lea   rdi, [Output+46]
		mov   eax, dword[trace.Bishop+4*2]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.Bishop+4*2]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output


		mov   eax, dword[trace.Rook+4*0]
		sub   eax, dword[trace.Rook+4*1]
		mov   dword[trace.Rook+4*2], eax
		lea   rsi, [.trl08]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+18]
		mov   eax, dword[trace.Rook+4*0]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+24]
	      movsx   rax, word[trace.Rook+4*0]
	       call   PrintSignedInteger
		lea   rdi, [Output+32]
		mov   eax, dword[trace.Rook+4*1]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+38]
	      movsx   rax, word[trace.Rook+4*1]
	       call   PrintSignedInteger
		lea   rdi, [Output+46]
		mov   eax, dword[trace.Rook+4*2]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.Rook+4*2]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output

		mov   eax, dword[trace.Queen+4*0]
		sub   eax, dword[trace.Queen+4*1]
		mov   dword[trace.Queen+4*2], eax
		lea   rsi, [.trl09]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+18]
		mov   eax, dword[trace.Queen+4*0]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+24]
	      movsx   rax, word[trace.Queen+4*0]
	       call   PrintSignedInteger
		lea   rdi, [Output+32]
		mov   eax, dword[trace.Queen+4*1]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+38]
	      movsx   rax, word[trace.Queen+4*1]
	       call   PrintSignedInteger
		lea   rdi, [Output+46]
		mov   eax, dword[trace.Queen+4*2]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.Queen+4*2]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output


		mov   eax, dword[trace.Mobility+4*0]
		sub   eax, dword[trace.Mobility+4*1]
		mov   dword[trace.Mobility+4*2], eax
		lea   rsi, [.trl10]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+18]
		mov   eax, dword[trace.Mobility+4*0]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+24]
	      movsx   rax, word[trace.Mobility+4*0]
	       call   PrintSignedInteger
		lea   rdi, [Output+32]
		mov   eax, dword[trace.Mobility+4*1]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+38]
	      movsx   rax, word[trace.Mobility+4*1]
	       call   PrintSignedInteger
		lea   rdi, [Output+46]
		mov   eax, dword[trace.Mobility+4*2]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.Mobility+4*2]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output



		mov   eax, dword[trace.King+4*0]
		sub   eax, dword[trace.King+4*1]
		mov   dword[trace.King+4*2], eax
		lea   rsi, [.trl11]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+18]
		mov   eax, dword[trace.King+4*0]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+24]
	      movsx   rax, word[trace.King+4*0]
	       call   PrintSignedInteger
		lea   rdi, [Output+32]
		mov   eax, dword[trace.King+4*1]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+38]
	      movsx   rax, word[trace.King+4*1]
	       call   PrintSignedInteger
		lea   rdi, [Output+46]
		mov   eax, dword[trace.King+4*2]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.King+4*2]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output



		mov   eax, dword[trace.Threats+4*0]
		sub   eax, dword[trace.Threats+4*1]
		mov   dword[trace.Threats+4*2], eax
		lea   rsi, [.trl12]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+18]
		mov   eax, dword[trace.Threats+4*0]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+24]
	      movsx   rax, word[trace.Threats+4*0]
	       call   PrintSignedInteger
		lea   rdi, [Output+32]
		mov   eax, dword[trace.Threats+4*1]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+38]
	      movsx   rax, word[trace.Threats+4*1]
	       call   PrintSignedInteger
		lea   rdi, [Output+46]
		mov   eax, dword[trace.Threats+4*2]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.Threats+4*2]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output







		mov   eax, dword[trace.PassedPawns+4*0]
		sub   eax, dword[trace.PassedPawns+4*1]
		mov   dword[trace.PassedPawns+4*2], eax
		lea   rsi, [.trl13]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+18]
		mov   eax, dword[trace.PassedPawns+4*0]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+24]
	      movsx   rax, word[trace.PassedPawns+4*0]
	       call   PrintSignedInteger
		lea   rdi, [Output+32]
		mov   eax, dword[trace.PassedPawns+4*1]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+38]
	      movsx   rax, word[trace.PassedPawns+4*1]
	       call   PrintSignedInteger
		lea   rdi, [Output+46]
		mov   eax, dword[trace.PassedPawns+4*2]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.PassedPawns+4*2]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output




		mov   eax, dword[trace.Space+4*0]
		sub   eax, dword[trace.Space+4*1]
		mov   dword[trace.Space+4*2], eax
		lea   rsi, [.trl14]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+18]
		mov   eax, dword[trace.Space+4*0]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+24]
	      movsx   rax, word[trace.Space+4*0]
	       call   PrintSignedInteger
		lea   rdi, [Output+32]
		mov   eax, dword[trace.Space+4*1]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+38]
	      movsx   rax, word[trace.Space+4*1]
	       call   PrintSignedInteger
		lea   rdi, [Output+46]
		mov   eax, dword[trace.Space+4*2]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.Space+4*2]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output



		lea   rsi, [.trl15]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output


		lea   rsi, [.trl16]
		lea   rdi, [Output]
		mov   ecx, .size
	  rep movsb
		lea   rdi, [Output+46]
		mov   eax, dword[trace.Total]
		add   eax, 0x08000
		sar   eax, 16
	     movsxd   rax, eax
	       call   PrintSignedInteger
		lea   rdi, [Output+52]
	      movsx   rax, word[trace.Total]
	       call   PrintSignedInteger
		lea   rdi, [Output+.size]
	       call   _WriteOut_Output

		lea   rdi, [Output]
		mov   rax, 'eval: '
	      stosq
		sub   rdi, 2
		mov   ecx, r15d
}

		lea   rdi, [Output]
	     movsxd   rax, r15d
	       call   PrintSignedInteger
		mov   eax, ' == '
	      stosd
		mov   ecx, r15d
	       call   PrintScore_Uci
		mov   al, 10
	      stosb
		jmp   UciWriteOut


match =1, VERBOSE {
.trl00: db '      Eval term |    White    |    Black    |    Total    ',10
.trl01: db '                | MG    EG    | MG    EG    | MG    EG    ',10
.trl02: db '----------------+-------------+-------------+-------------',10
.trl03: db '       Material | ----  ----  | ----  ----  |             ',10
.trl04: db '      Imbalance | ----  ----  | ----  ----  |             ',10
.trl05: db '          Pawns | ----  ----  | ----  ----  |             ',10
.trl06: db '        Knights |             |             |             ',10
.trl07: db '         Bishop |             |             |             ',10
.trl08: db '          Rooks |             |             |             ',10
.trl09: db '         Queens |             |             |             ',10
.trl10: db '       Mobility |             |             |             ',10
.trl11: db '    King safety |             |             |             ',10
.trl12: db '        Threats |             |             |             ',10
.trl13: db '   Passed pawns |             |             |             ',10
.trl14: db '          Space |             |             |             ',10
.trl15: db '----------------+-------------+-------------+-------------',10
.trl16: db '                                     Total  |             ',10
}



