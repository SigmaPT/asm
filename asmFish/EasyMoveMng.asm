EasyMoveMng_Clear:
		lea   rcx, [easyMoveMng]
		xor   eax, eax
		mov   qword[rcx+EasyMoveMng.pv+4*0], rax
		mov   qword[rcx+EasyMoveMng.pv+4*2], rax
		mov   qword[rcx+EasyMoveMng.expectedPosKey], rax
		mov   dword[rcx+EasyMoveMng.stableCnt], eax
		ret

EasyMoveMng_Get:
	; in: rcx key
		xor   eax, eax
		cmp   rcx, qword[easyMoveMng.expectedPosKey]
	      cmove   eax, dword[easyMoveMng.pv+4*2]
		ret

EasyMoveMng_Update:
	; in: rbp position
	;     rbx state
	;     rcx address of RootMove struct

	       push   rbp

		mov   edx, dword[easyMoveMng.stableCnt]
		xor   r8d, r8d
		add   edx, 1
		mov   eax, dword[rcx+RootMove.pv+4*2]
		cmp   eax, dword[easyMoveMng.pv+4*2]
	     cmovne   edx, r8d
		mov   dword[easyMoveMng.stableCnt], edx

		mov   rax, qword[rcx+RootMove.pv+4*0]
		cmp   rax, qword[easyMoveMng.pv+4*0]
		jne   @f
		mov   ecx, dword[rcx+RootMove.pv+4*2]
		cmp   ecx, dword[easyMoveMng.pv+4*2]
		 je   .done
	@@:
		mov   qword[easyMoveMng.pv+4*0], rax
		mov   dword[easyMoveMng.pv+4*2], ecx

	       call   SetCheckInfo
		mov   ecx, dword[easyMoveMng.pv+4*0]
	       call   GivesCheck
		mov   ecx, dword[easyMoveMng.pv+4*0]
		mov   edx, eax
	       call   DoMove__EasyMoveMng
	       call   SetCheckInfo
		mov   ecx, dword[easyMoveMng.pv+4*1]
	       call   GivesCheck
		mov   ecx, dword[easyMoveMng.pv+4*1]
		mov   edx, eax
	       call   DoMove__EasyMoveMng

		mov   rax, qword[rbx+State.key]
		mov   qword[easyMoveMng.expectedPosKey], rax

		mov   ecx, dword[easyMoveMng.pv+4*1]
	       call   UndoMove
		mov   ecx, dword[easyMoveMng.pv+4*0]
	       call   UndoMove

.done:
		pop   rbp
		ret