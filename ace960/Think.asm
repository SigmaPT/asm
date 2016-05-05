MainThread_Think:
	; in: rcx address of Thread struct   should be mainThread

	       push   rbx rsi rdi
virtual at rsp
  .output rb 8*MAX_PLY
  .lend rb 0
end virtual
.lsize = ((.lend-rsp+15) and (-16))
		sub   rsp, .lsize
		mov   rbx, rcx

     VerboseDisplay   'MainThread_Think'

		mov   ecx, dword[rbx+Thread.rootPos+Pos.sideToMove]
		mov   edx, dword[rbx+Thread.rootPos+Pos.gamePly]
	       call   TimeMng_Init

		mov   eax, dword[rbx+Thread.rootPos+Pos.sideToMove]
		mov   ecx, VALUE_DRAW
		sub   ecx, dword[uciOptions.contempt]
		mov   dword[DrawValue+4*rax], ecx
		xor   eax, 1
		mov   ecx, VALUE_DRAW
		add   ecx, dword[uciOptions+UciOptions.contempt]
		mov   dword[DrawValue+4*rax], ecx
		add   byte[mainHash.date], 4

call   Search_Clear


	; check for mate
		lea   rcx, [rbx+Thread.rootPos+Pos.rootMovesVec]
	       call   RootMovesVec_Empty
	       test   eax, eax
		jnz   .mate

	; start workers
		mov   rsi, rbx
    .next_worker:
		sub   rsi, sizeof.Thread
		cmp   rsi, qword[threadPool.stackPointer]
		 jb   .workers_done
		mov   rcx, rsi
	       call   Thread_StartSearching
		jmp   .next_worker
    .workers_done:

	; start searching
		mov   rcx, rbx
	       call   Thread_Think
;invoke MessageBoxA,0,'Thread_Think returned','caption',MB_OK

.search_done:


	; check for wait
		mov   al, byte[signals.stop]
	       test   al, al
		jnz   .dont_wait
		mov   al, byte[limits.ponder]
		 or   al, byte[limits.infinite]
		 jz   .dont_wait
		mov   byte[signals.stopOnPonderhit], al


;invoke MessageBoxA,0,'Thread_Think CALLING WAIT','caption',MB_OK

		mov   rcx, rbx
		lea   rdx, [signals.stop]
	       call   Thread_Wait
;invoke MessageBoxA,0,'Thread_Think RETURNING FROM WAIT','caption',MB_OK


.dont_wait:
		 or   eax, -1
		mov   byte[signals.stop], al

	; wait for workers
		mov   rsi, rbx
	.next_worker2:
		sub   rsi, sizeof.Thread
		cmp   rsi, qword[threadPool.stackPointer]
		 jb   .workers_done2
		mov   rcx, rsi
	       call   Thread_WaitForSearchFinished
		jmp   .next_worker2
	.workers_done2:

;invoke MessageBoxA,0,'MainThread_Think finding best thread','caption',MB_OK

	; find best thread  rsi
		mov   rsi, rbx
		mov   al, byte[rbx+Thread.easyMovePlayed]
	       test   al, al
		jnz   .best_done
		mov   eax, dword[uciOptions.multiPV]
		cmp   eax, 1
		jne   .best_done

jmp  .best_done

	      ;  mov   eax, dword[uciOptions.multiPV]
	      ; test   eax, eax
	      ;  jnz   .best_done
		mov   rcx, qword[rsi+Thread.rootPos+Pos.rootMovesVec+RootMovesVec.table]
		mov   ecx, dword[rsi+0*sizeof.RootMove+RootMove.pv+4*0]
	       test   ecx, ecx
		 jz   .best_done
		mov   rdi, rbx
		mov   r8d, dword[rbx+Thread.completedDepth]
		mov   r9, qword[rbx+Thread.rootPos+Pos.rootMovesVec+RootMovesVec.table]
		mov   r9d, dword[r9+0*sizeof.RootMove+RootMove.score]
	.next_worker3:
		sub   rdi, sizeof.Thread
		cmp   rdi, qword[threadPool.stackPointer]
		 jb   .workers_done3
		mov   eax, dword[rdi+Thread.completedDepth]
		mov   rcx, qword[rbx+Thread.rootPos+Pos.rootMovesVec+RootMovesVec.table]
		mov   ecx, dword[rcx+0*sizeof.RootMove+RootMove.score]
		cmp   eax, r8d
		jbe   .next_worker3
		cmp   ecx, r9d
		jle   .next_worker3
		mov   eax, r8d
		mov   ecx, r9d
		mov   rsi, rdi
		jmp   .next_worker3
	.workers_done3:
	.best_done:
		mov   r9, qword[rsi+Thread.rootPos+Pos.rootMovesVec+RootMovesVec.table]
		mov   r9d, dword[r9+0*sizeof.RootMove+RootMove.score]
		mov   dword[rbx+Thread.previousScore], r9d

		cmp   rsi, rbx
		 je   .dont_send_pv


.dont_send_pv:

;invoke MessageBoxA,0,'MainThread_Think printing best move','caption',MB_OK


	; print best move and ponder move
		lea   rdi, [.output]
		mov   rax, 'bestmove'
	      stosq
		mov   al, ' '
	      stosb
		mov   rcx, qword[rsi+Thread.rootPos+Pos.rootMovesVec+RootMovesVec.table]
		mov   ecx, dword[rcx+0*sizeof.RootMove+RootMove.pv+4*0]
	      movzx   edx, byte[rsi+Thread.rootPos+Pos.chess960]
	       call   PrintUciMove
		mov   rcx, qword[rsi+Thread.rootPos+Pos.rootMovesVec+RootMovesVec.table]
		mov   eax, dword[rcx+0*sizeof.RootMove+RootMove.pvSize]
		cmp   eax, 2
		 jb   .get_ponder_from_tt
.have_ponder_from_tt:
		mov   rax, ' ponder '
	      stosq
		mov   ecx, dword[rcx+0*sizeof.RootMove+RootMove.pv+4*1]
	      movzx   edx, byte[rsi+Thread.rootPos+Pos.chess960]
	       call   PrintUciMove
.skip_ponder:
		mov   eax, 10
	      stosb
		lea   rcx, [.output]
	       call   _WriteOut

      VerboseDisplay   'MainThread_Think returning'

;invoke MessageBoxA,0,'MainThread_Think returning','caption',MB_OK

		add   rsp, .lsize
		pop   rdi rsi rbx
		ret


.mate:
		lea   rdi, [.output]
		mov   rax, 'info dep'
	      stosq
		mov   rax, 'th 0 sco'
	      stosq
		mov   eax, 're '
	      stosd
		sub   rdi, 1
		mov   rax, qword[rbx+Thread.rootPos+Pos.state]
		cmp   qword[rax+State.checkersBB], 1
		sbb   ecx, ecx
		and   ecx, VALUE_DRAW+VALUE_MATE
		sub   ecx, VALUE_MATE
	       call   PrintUciScore
		mov   al, 10
	      stosb
		lea   rcx, [.output]
	       call   _WriteOut
		jmp   .search_done


.get_ponder_from_tt:
		lea   rcx, [rsi+Thread.rootPos]
	       call   ExtractPonderFromTT
		mov   rcx, qword[rsi+Thread.rootPos+Pos.rootMovesVec+RootMovesVec.table]
	       test   eax, eax
		jnz   .have_ponder_from_tt
		jmp   .skip_ponder




ExtractPonderFromTT:
	; in: rcx address of position
	       push   rbp rbx rsi rdi r15
virtual at rsp
 .movelist rb sizeof.ExtMove*MAX_MOVES
 .lend	   rb 0
end virtual
.localsize = .lend-rsp
	 _chkstk_ms   rsp, .localsize
		sub   rsp, .localsize

		mov   r15, qword[rcx+Pos.rootMovesVec+RootMovesVec.table]

		mov   rbp, rcx
		mov   rbx, qword[rcx+Pos.state]
	       call   SetCheckInfo
		mov   ecx, dword[r15+RootMove.pv+4*0]
	       call   GivesCheck
		mov   ecx, dword[r15+RootMove.pv+4*0]
		mov   edx, eax
	       call   DoMove__ExtractPonderFromTT
		mov   rcx, qword[rbx+State.key]
	       call   MainHash_Probe
		mov   esi, ecx
		shr   esi, 16
		mov   edi, edx
		mov   ecx, dword[r15+RootMove.pv+4*0]
	       call   UndoMove
		xor   eax, eax
	       test   edi, edi
		 jz   .done

		lea   rdi, [.movelist]
	       call   Gen_Legal
		lea   rdx, [.movelist]
	.loop:
		xor   eax, eax
		cmp   rdx, rdi
		jae   .done
		add   rdx, sizeof.ExtMove
		cmp   esi, dword[rdx+ExtMove.move]
		jne   .loop

		 or   eax, -1
		mov   ecx, 2
		mov   dword[r15+RootMove.pv+4*1], esi
		mov   dword[r15+RootMove.pvSize], ecx
.done:
		add   rsp, .localsize
		pop   r15 rdi rsi rbx rbp
		ret






Thread_Think:
	; in: rcx address of Thread struct

	       push   rbp rbx rsi rdi r13 r14 r15
virtual at rsp
 .completedDepth rd 1
 .alpha      rd 1
 .beta	     rd 1
 .delta      rd 1
 .bestValue  rd 1
 .easyMove   rd 1
 .multiPV    rd 1
 .output rb 8*MAX_PLY
 .lend rb 0
end virtual
.localsize = ((.lend-rsp+15) and (-16))
	 _chkstk_ms   rsp, .localsize
		sub   rsp, .localsize

		lea   rbp, [rcx+Thread.rootPos]
		mov   rbx, qword[rbp+Pos.state]
     VerboseDisplay   'Thread_Think'

		mov   dword[.easyMove], 0
		mov   dword[.alpha], -VALUE_INFINITE
		mov   dword[.beta], +VALUE_INFINITE
		mov   dword[.delta], -VALUE_INFINITE
		mov   dword[.bestValue], -VALUE_INFINITE
		mov   dword[.completedDepth], 0

	; clear the search stack
		lea   rdx, [rbx-5*sizeof.State]
		lea   r8, [rbx+3*sizeof.State]
.clear_stack:
		xor   eax, eax
		lea   rdi, [rdx+State._stack_start]
		mov   ecx, State._stack_end-State._stack_start
	  rep stosb
		add   rdx, sizeof.State
		cmp   rdx, r8
		 jb   .clear_stack


	; resets for main thread
		cmp   rbp, mainThread.rootPos
		jne   .skip_easymove
		mov   rcx, qword[rbx+State.key]
	       call   EasyMoveMng_Get
		mov   dword[.easyMove], eax
	       call   EasyMoveMng_Clear
		xor   eax, eax
		mov   byte[rbp-Thread.rootPos+Thread.easyMovePlayed], al
		mov   byte[rbp-Thread.rootPos+Thread.failedLow], al
		mov   qword[rbp-Thread.rootPos+Thread.bestMoveChanges], rax
.skip_easymove:

	; set multiPV
		lea   rcx, [rbp+Pos.rootMovesVec]
	       call   RootMovesVec_Size
		mov   ecx, dword[uciOptions.multiPV]
		cmp   eax, ecx
	      cmova   eax, ecx
		mov   dword[.multiPV], eax

	; id loop
		mov   r15d, dword[rbp-Thread.rootPos+Thread.rootDepth]	 ; this should be set to 0 by ThreadPool_StartThinking
.id_loop:
		mov   al, byte[signals.stop]
		mov   ecx, dword[limits.depth]
		sub   ecx, 1
		cmp   r15d, ecx
		 ja   .id_loop_done
		add   r15d, 1
		mov   dword[rbp-Thread.rootPos+Thread.rootDepth], r15d
		cmp   r15d, MAX_PLY
		jge   .id_loop_done
	       test   al, al
		jnz   .id_loop_done

	; skip depths for helper threads
		mov   eax, dword[rbp-Thread.rootPos+Thread.idx]
		mov   ecx, HalfDensitySize
		sub   eax, 1
		 jc   .age_out
		xor   edx, edx
		div   ecx
		mov   r8d, dword[HalfDensityRows+8*rdx+4*0]
		mov   r9d, dword[HalfDensityRows+8*rdx+4*1]
		mov   eax, dword[rbp+Pos.gamePly]
		add   eax, r15d
		xor   edx, edx
		div   r8d
		 bt   r9d, edx
		 jc   .id_loop
		jmp   .save_prev_score

.age_out:
	; Age out PV variability metric
	     vmovsd   xmm0, qword[rbp-Thread.rootPos+Thread.bestMoveChanges]
	     vmulsd   xmm0, xmm0, qword[constd.0p505]
		mov   byte[rbp-Thread.rootPos+Thread.failedLow], 0
	     vmovsd   qword[rbp-Thread.rootPos+Thread.bestMoveChanges], xmm0

.save_prev_score:
	; Save the last iteration's scores before first PV line is searched and all the move scores except the (new) PV are set to -VALUE_INFINITE.
		mov   rcx, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
		mov   rdx, qword[rbp+Pos.rootMovesVec+RootMovesVec.end]
    .save_next:
		mov   eax, dword[rcx+RootMove.score]
		mov   dword[rcx+RootMove.prevScore], eax
		add   rcx, sizeof.RootMove
		cmp   rcx, rdx
		 jb   .save_next

	; MultiPV loop. We perform a full root search for each PV line
		 or   r14d, -1
.multipv_loop:
		add   r14d, 1
		mov   al, byte[signals.stop]
		mov   dword[rbp-Thread.rootPos+Thread.PVIdx], r14d
		cmp   r14d, dword[.multiPV]
		jae   .multipv_done
	       test   al, al
		jnz   .multipv_done


match =1, VERBOSE {
		lea   rdi, [DebugOutput]
	     szcall   PrintString,'Thread.PVIdx: '
		mov   eax, r14d
	       call   PrintUnsignedInteger
		mov   al, 10
	      stosb
		lea   rcx, [DebugOutput]
	       call   _WriteOut
}

	; Reset aspiration window starting size
	       imul   r8d, r14d, sizeof.RootMove
		mov   edx, 18
		add   r8, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
		cmp   r15d, 5
		 jl   .reset_window_done
		mov   eax, dword[r8+RootMove.prevScore]
		mov   ecx, -VALUE_INFINITE
		sub   eax, edx
		cmp   eax, ecx
	      cmovl   eax, ecx
		mov   dword[.alpha], eax
		mov   eax, dword[r8+RootMove.prevScore]
		mov   ecx, VALUE_INFINITE
		add   eax, edx
		cmp   eax, ecx
	      cmovg   eax, ecx
		mov   dword[.beta], eax
		mov   dword[.delta], edx
    .reset_window_done:

	; Start with a small aspiration window and, in the case of a fail high/low, re-search with a bigger window until we're not failing high/low anymore.
.search_loop:

match =1, VERBOSE {
		lea   rdi, [DebugOutput]
		mov   rax, 'alpha:  '
	      stosq
	     movsxd   rax, dword[.alpha]
	       call   PrintSignedInteger
		mov   rax, ' beta:  '
	      stosq
	     movsxd   rax, dword[.beta]
	       call   PrintSignedInteger
		mov   al, 10
	      stosb
		lea   rcx, [DebugOutput]
	       call   _WriteOut
}

		mov   ecx, dword[.alpha]
		mov   edx, dword[.beta]
		mov   r8d, r15d
		xor   r9d, r9d
	       call   Search_Root ; rootPos is in rbp, ss is in rbx
		mov   r12d, eax
		mov   dword[.bestValue], eax


     VerboseDisplay   'Search_Root returned'


	       imul   ecx, r14d, sizeof.RootMove
		add   rcx, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
		mov   rdx, qword[rbp+Pos.rootMovesVec+RootMovesVec.end]
	       call   RootMovesVec_StableSort

match =1, VERBOSE {
		lea   rdi, [DebugOutput]
	       call   RootMovesVec_Print
		lea   rcx, [DebugOutput]
	       call   _WriteOut
}
	; Write PV back to the transposition table in case the relevant entries have been overwritten during the search.
		mov   esi, r14d
	.insert_next:
	       imul   ecx, esi, sizeof.RootMove
		add   rcx, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
	       call   RootMove_InsertPVInTT
		sub   esi, 1
		jns   .insert_next

	; If search has been stopped, break immediately. Sorting and writing PV back to TT is safe because RootMoves is still valid, although it refers to the previous iteration.
		mov   al, byte[signals.stop]
	       test   al, al
		jnz   .search_done

	; When failing high/low give some update before a re-search.
		mov   eax, dword[.multiPV]
		cmp   rbp, mainThread.rootPos
		jnz   .dont_print_pv
		cmp   eax, 1
		jne   .dont_print_pv
		cmp   r12d, dword[.alpha]
		jle   @f
		cmp   r12d, dword[.beta]
		 jl   .dont_print_pv
	@@:    call   _GetTime
		sub   rax, qword[time.startTime]
		mov   r9, rax
		cmp   rax, 3000
		jbe   .dont_print_pv
		lea   rdi, [.output]
		mov   ecx, r15d
		mov   edx, dword[.alpha]
		mov   r8d, dword[.beta]
		mov   r10d, dword[.multiPV]
	       call   Position_PrintUciInfo    ; writes terminating newline
		lea   rcx, [.output]
	       call   _WriteOut
	.dont_print_pv:

	; In case of failing low/high increase aspiration window and re-search, otherwise exit the loop.
		mov   ecx, dword[.alpha]
		mov   edx, dword[.beta]
		mov   r8d, dword[.delta]
		cmp   r12d, ecx
		jle   .fail_low
		cmp   r12d, edx
		jge   .fail_high
		jmp   .search_done
    .fail_low:
		add   edx, ecx
		sar   edx, 1
		mov   ecx, r12d
		sub   ecx, r8d
		mov   eax, -VALUE_INFINITE
		cmp   ecx, eax
	      cmovl   ecx, eax
		mov   eax, r8d
		sar   eax, 2
		lea   r8d, [r8+rax+5]
		mov   dword[.alpha], ecx
		mov   dword[.beta], edx
		mov   dword[.delta], r8d
		cmp   rbp, mainThread.rootPos
		jne   .search_loop
		mov   byte[rbp-Thread.rootPos+Thread.failedLow], -1
		mov   byte[signals.stopOnPonderhit], 0
		jmp   .search_loop
    .fail_high:
		add   ecx, edx
		sar   ecx, 1
		mov   edx, r12d
		add   edx, r8d
		mov   eax, VALUE_INFINITE
		cmp   ecx, eax
	      cmovg   ecx, eax
		mov   eax, r8d
		sar   eax, 2
		lea   r8d, [r8+rax+5]
		mov   dword[.alpha], ecx
		mov   dword[.beta], edx
		mov   dword[.delta], r8d
		jmp   .search_loop
.search_done:

	; Sort the PV lines searched so far and update the GUI
	       imul   edx, r14d, sizeof.RootMove
		mov   rcx, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
		lea   rdx, [rcx+rdx+sizeof.RootMove]
	       call   RootMovesVec_StableSort

		cmp   rbp, mainThread.rootPos
		jne   .multipv_done

	       call   _GetTime
		mov   r9, rax
		sub   r9, qword[time.startTime]
		lea   eax, [r14+1]
		cmp   eax, dword[.multiPV]
		 je   @f
		cmp   r9, 3000
		jbe   .multipv_loop
	@@:	lea   rdi, [.output]
		mov   ecx, r15d
		mov   edx, dword[.alpha]
		mov   r8d, dword[.beta]
		mov   r10d, dword[.multiPV]
	       call   Position_PrintUciInfo    ; writes terminating newline
		lea   rcx, [.output]
	       call   _WriteOut
		jmp   .multipv_loop

.multipv_done:
		mov   al, byte[signals.stop]
	       test   al, al
		jnz   @f
		mov   dword[rbp-Thread.rootPos+Thread.completedDepth], r15d
	@@:
		cmp   rbp, mainThread.rootPos
		jne   .id_loop

	; If skill level is enabled and time is up, pick a sub-optimal best move

	; Have we found a "mate in x"

		mov   al, byte[limits.useTimeMgmt]
	       test   al, al
		 jz   .id_loop

		mov   al, byte[signals.stop]
		 or   al, byte[signals.stopOnPonderhit]
		jnz   .handle_easymove

	       call   _GetTime
		sub   rax, qword[time.startTime]
		mov   r11, rax

		xor   ecx, ecx
		cmp   r12d, dword[rbp-Thread.rootPos+Thread.previousScore]
	      setge   cl
		mov   al, byte[rbp-Thread.rootPos+Thread.failedLow]
		cmp   al, 1
		adc   ecx, ecx
	  vcvtsi2sd   xmm3, xmm3, dword[.improvingFactor_lookup+4*rcx]

		xor   r9d, r9d
		mov   eax, dword[time.optimumTime]
		mov   ecx, 25
		mul   ecx
		mov   ecx, 204
		div   ecx
		mov   r8, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
		mov   ecx, dword[r8+RootMove.pv+4*0]

	     vmovsd   xmm0, qword[rbp-Thread.rootPos+Thread.bestMoveChanges]
	     vmovsd   xmm2, qword[constd.1p0]
	     vaddsd   xmm2, xmm2, xmm0
		cmp   r11d, eax
		jbe   @f
		cmp   ecx, dword[.easyMove]
		jne   @f
	    vcomisd   xmm0, qword[constd.0p03]
		sbb   r9d, r9d
		@@:

	     vmulsd   xmm2, xmm2, xmm3
	  vcvtsi2sd   xmm0, xmm0, r11
	     vmulsd   xmm0, xmm0, qword[constd.634]
	  vcvtsi2sd   xmm1, xmm1, dword[time.optimumTime]
	     vmulsd   xmm1, xmm1, xmm2
		add   r8, sizeof.RootMove
		cmp   r8, qword[rbp+Pos.rootMovesVec+RootMovesVec.end]
		 je   .set_stop
	    vcomisd   xmm0, xmm1
		 ja   .set_stop
		mov   byte[rbp-Thread.rootPos+Thread.easyMovePlayed], r9l
	       test   r9d, r9d
		 jz   .handle_easymove
    .set_stop:
		 or   ecx, -1
		mov   al, byte[limits.ponder]
	       test   al, al
		jnz   @f
		mov   byte[signals.stop], cl
		jmp   .handle_easymove
	@@:	mov   byte[signals.stopOnPonderhit], cl


    .handle_easymove:
		mov   rcx, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
		mov   eax, dword[rcx+RootMove.pvSize]
		cmp   eax, 3
		 jb   @f
	       call   EasyMoveMng_Update
		jmp   .id_loop
	@@:    call   EasyMoveMng_Clear
		jmp   .id_loop


.id_loop_done:
		cmp   rbp, mainThread.rootPos
		jne   .done

.done:

     VerboseDisplay   'Thread_Think returning'


		add   rsp, .localsize
		pop   r15 r14 r13 rdi rsi rbx rbp
		ret


align 4
.improvingFactor_lookup:
	dd 640-160*0-126*0-124*0*0
	dd 640-160*1-126*0-124*1*0
	dd 640-160*0-126*1-124*0*1
	dd 640-160*1-126*1-124*1*1













