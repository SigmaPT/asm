
ThreadPool_Create:
	       push   rdi rsi rbx
		lea   rbx, [threadPool]
		lea   rcx, [mainThread]
		mov   qword[rbx+ThreadPool.stackPointer], rcx
	       call   Thread_Create
		mov   rcx, rbx
	       call   ThreadPool_ReadOptions
		pop   rbx rsi rdi
		ret


ThreadPool_Destroy:
	       push   rsi rdi rbx
		lea   rbx, [threadPool]
		mov   rdi, qword[rbx+ThreadPool.stackPointer]
		lea   rsi, [mainThread]
.delete:	mov   rcx, rdi
		add   rdi, sizeof.Thread
	       call   Thread_Delete
		cmp   rdi, rsi
		jbe   .delete
		pop   rbx rdi rsi
		ret


ThreadPool_ReadOptions:
	       push   rbx rsi rdi
		lea   rbx, [threadPool]
		mov   rdi, qword[rbx+ThreadPool.stackPointer]
		mov   esi, dword[options.threads]
		sub   esi, 1
	       imul   esi, sizeof.Thread
		neg   rsi
		lea   rsi, [rsi+mainThread]
.CheckCreate:
		cmp   rdi, rsi
		 ja   .Create
.CheckDelete:
		cmp   rdi, rsi
		 jb   .Delete
		mov   qword[rbx+ThreadPool.stackPointer], rdi
		pop   rdi rsi rbx
		ret
.Create:
		sub   rdi, sizeof.Thread
		mov   rcx, rdi
	       call   Thread_Create
		jmp   .CheckCreate
.Delete:
		mov   rcx, rdi
		add   rdi, sizeof.Thread
	       call   Thread_Delete
		jmp   .CheckDelete


ThreadPool_NodesSearched:
		lea   rcx, [mainThread]
		xor   eax, eax
	.next_thread:
		add   rax, qword[rcx+Thread.nodes]
		sub   rcx, sizeof.Thread
		cmp   rcx, qword[threadPool.stackPointer]
		jae   .next_thread
		ret



ThreadPool_StartThinking:
	; in: rbp address of position
	;     rcx address of limits struct
	;            this will be copied to the global limits struct
	;            so that search threads can see it
	       push   rbx rsi rdi
virtual at rsp
  .moveList rb sizeof.ExtMove*MAX_MOVES
  .lend rb 0
end virtual
.localsize = ((.lend-rsp+15) and (-16))

	 _chkstk_ms   rsp, .localsize
		sub   rsp, .localsize

		mov   rsi, rcx

		mov   rbx, qword[rbp+Pos.state]
	       call   SetCheckInfo
		lea   rdi, [.moveList]
	       call   Gen_Legal

		lea   rcx, [mainThread]
	       call   Thread_WaitForSearchFinished
	     Assert   e, byte[mainThread.searching], 0, 'assertion byte[mainThread.searching]==0 failed in ThreadPool_StartThinking'

		xor   eax, eax
		mov   byte[signals.stop], al
		mov   byte[signals.stopOnPonderhit], al

		lea   rcx, [limits]
		mov   rdx, rsi
	       call   Limits_Copy

		lea   rbx, [mainThread]
.next_thread:
		lea   rcx, [rbx+Thread.rootPos]
	       call   Position_CopyToSearch
		xor   eax, eax
		mov   dword[rbx+Thread.rootDepth], eax
		mov   qword[rbx+Thread.nodes], rax
		lea   rsi, [.moveList]
		lea   rcx, [rbx+Thread.rootPos+Pos.rootMovesVec]
	       call   RootMovesVec_Clear
    .push_moves:
		cmp   rsi, rdi
		jae   .push_moves_done
		lea   rcx, [rbx+Thread.rootPos+Pos.rootMovesVec]
		mov   edx, dword[rsi+ExtMove.move]
		add   rsi, sizeof.ExtMove
	       call   RootMovesVec_PushBackMove
		jmp   .push_moves
    .push_moves_done:
		sub   rbx, sizeof.Thread
		cmp   rbx, qword[threadPool.stackPointer]
		jae   .next_thread

		lea   rcx, [mainThread]
	       call   Thread_StartSearching

		add   rsp, .localsize
		pop   rdi rsi rbx
		ret


