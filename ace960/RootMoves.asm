;PrintPV:
;        ; in: rcx address of start
;        ;     rdx address of end
;        ;     rbp address of position
;
;               push   r12 r13
;                mov   r12, rcx
;                mov   r13, rdx
;.loop:
;                cmp   r12, r13
;                jae   .done
;                mov   ecx, [r12]
;                add   r12, 4
;                mov   edx, dword[rbp+Pos.chess960]
;               call   PrintUciMoveLong
;                mov   al, ' '
;              stosb
;                jmp   .loop
;
;.done:          int3
;                pop   r13 r12
;                ret





RootMovesVec_Create:
	       push   rbx
		mov   rbx, rcx
		mov   ecx, sizeof.RootMove*MAX_MOVES
	       call   _VirtualAlloc
		mov   qword[rbx+RootMovesVec.table], rax
		mov   qword[rbx+RootMovesVec.end], rax
		pop   rbx
		ret


RootMovesVec_Destroy:
		mov   rcx, qword[rbx+RootMovesVec.table]
		xor   eax, eax
		mov   qword[rbx+RootMovesVec.table], rax
		mov   qword[rbx+RootMovesVec.end], rax
		jmp   _VirtualFree

match =1, VERBOSE {
RootMovesVec_Print:
	; in: rbp  position   the rootmovesvec member will be printed
	; io: rdi
	       push   rbx rsi r13 r14 r15
		mov   rbx, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
.loop:		cmp   rbx, qword[rbp+Pos.rootMovesVec+RootMovesVec.end]
		jae   .done

		mov   eax, dword[rbx+RootMove.score]
		cmp   eax, -VALUE_INFINITE
		jle  .skip

		mov   rax, 'prevScor'
	      stosq
		mov   eax, 'e: '
	      stosd
		sub   rdi, 1
		mov   ecx, dword[rbx+RootMove.prevScore]
	       call   PrintUciScore
		mov   rax, ' score: '
	      stosq
		mov   ecx, dword[rbx+RootMove.score]
	       call   PrintUciScore
		mov   eax, ' pv:'
	      stosd

		mov   r15d, dword[rbx+RootMove.pvSize]
		lea   r14, [rbx+RootMove.pv]
		lea   r15, [r14+4*r15]
		mov   rsi, r14
.pvloop:
		cmp   rsi, r15
		jae   .pvdone
		mov   al, ' '
	      stosb
		mov   ecx, dword[rsi]
		mov   edx, dword[rbp+Pos.chess960]
	       call   PrintUciMoveLong
		add   rsi, 4
		jmp   .pvloop
.pvdone:
		mov   al, 10
	      stosb

.skip:
		add   rbx, sizeof.RootMove
		jmp   .loop
.done:
		pop   r15 r14 r13 rsi rbx
		ret
}




RootMovesVec_Clear:
	; in: rcx address of RootMovesVec struct
		mov   rax, qword[rcx+RootMovesVec.table]
		mov   qword[rcx+RootMovesVec.end], rax
		ret


RootMovesVec_Empty:
	; in: rcx address of RootMovesVec struct
	; out: eax=0 if empty
	;      eax=-1 if not
		mov   rax, qword[rcx+RootMovesVec.end]
		sub   rax, qword[rcx+RootMovesVec.table]
		cmp   rax, 1
		sbb   eax, eax
		ret

RootMovesVec_Size:
	; in: rcx address of RootMovesVec struct
	; out: eax size
		mov   rax, qword[rcx+RootMovesVec.end]
		sub   rax, qword[rcx+RootMovesVec.table]
		mov   ecx, sizeof.RootMove
		xor   edx, edx
		div   ecx
	     Assert   e, edx, 0, 'bad div in RootMovesVec_Size'
	     Assert   b, eax, MAX_MOVES, 'too many moves in RootMovesVec_Size'
		ret



RootMovesVec_PushBackMove:
	; in: rcx address of RootMovesVec struct
	;     edx move
		mov   rax, qword[rcx+RootMovesVec.end]
		mov   dword[rax+RootMove.score], -VALUE_INFINITE
		mov   dword[rax+RootMove.prevScore], -VALUE_INFINITE
		mov   dword[rax+RootMove.pvSize], 1
		mov   dword[rax+RootMove.pv], edx
match =1, DEBUG {
		mov   edx, sizeof.RootMove*MAX_MOVES
		add   rdx, qword[rcx+RootMovesVec.table]
	     Assert   b, rax, rdx, 'too many moves in RootMovesVec_PushBackMove'
}
		add   rax, sizeof.RootMove
		mov   qword[rcx+RootMovesVec.end], rax
		ret

RootMovesVec_Copy:
	; in: rcx address of destination RootMovesVec struct
	;     rdx address of source      RootMovesVec struct
	       push   rsi rdi
		mov   rdi, qword[rcx+RootMovesVec.table]
		mov   rsi, qword[rdx+RootMovesVec.table]
		mov   r8, rcx
		mov   rcx, qword[rdx+RootMovesVec.end]
		sub   rcx, rsi
	  rep movsb
		mov   qword[r8+RootMovesVec.end], rdi
		pop   rdi rsi
		ret

RootMovesVec_StableSort:
	; in: rcx start RootMove
	;     rdx end RootMove
	       push   rsi rdi r12 r13 r14 r15
		sub   rsp, sizeof.RootMove
		mov   r14, rcx
		mov   r15, rdx
		mov   r13, r14
.l1:		add   r13, sizeof.RootMove
		cmp   r13, r15
		jae   .l1d
		mov   rdi, rsp
		mov   rsi, r13
		mov   ecx, sizeof.RootMove/4
	  rep movsd
		mov   r12, r13
.l2:		cmp   r12, r14
		jbe   .l2d
		mov   eax, dword[r12-1*sizeof.RootMove+RootMove.score]
		cmp   eax, dword[rsp+RootMove.score]
		jge   .l2d
		mov   rdi, r12
		sub   r12, sizeof.RootMove
		mov   rsi, r12
		mov   ecx, sizeof.RootMove/4
	  rep movsd
		jmp   .l2
.l2d:		mov   rdi, r12
		mov   rsi, rsp
		mov   ecx, sizeof.RootMove/4
	  rep movsd
		jmp   .l1
.l1d:		add   rsp, sizeof.RootMove
		pop   r15 r14 r13 r12 rdi rsi
		ret


RootMove_InsertPVInTT:
	; in: rbp Pos
	;     rbx State
	;     rcx RootMove struct
	       push   rbx rsi rdi r12 r13 r14 r15
		mov   r15d, dword[rcx+RootMove.pvSize]
		lea   r14, [rcx+RootMove.pv]
		lea   r15, [r14+4*r15]
		mov   rsi, r14
.InsertPvDoLoop:
		cmp   rsi, r15
		jae   .InsertPvUndoLoop
	       call   SetCheckInfo
		mov   ecx, dword[rsi]
	       call   GivesCheck
		mov   edx, eax
		mov   ecx, dword[rsi]
	       call   DoMove__RootMove_InsertPVInTT
		add   rsi, 4
		jmp   .InsertPvDoLoop

.InsertPvUndoLoop:
		sub   rsi, 4
		cmp   rsi, r14
		 jb   .InsertPvDone
		mov   ecx, dword[rsi]
	       call   UndoMove
		mov   rcx, qword[rbx+State.key]
		mov   r13, rcx
	       call   MainHash_Probe
		mov   rdi, rax
		mov   eax, dword[rsi]
		shr   ecx, 16
	       test   edx, edx
		 jz   .SaveMove
		cmp   eax, ecx
		 je   .InsertPvUndoLoop
.SaveMove:
		shr   r13, 48
		mov   edx, VALUE_NONE
     HashTable_Save   rdi, r13w, edx, BOUND_NONE, DEPTH_NONE, eax, VALUE_NONE
		jmp   .InsertPvUndoLoop
.InsertPvDone:
		pop   r15 r14 r13 r12 rdi rsi rbx
		ret



;;;;;;;;;;;;;;;;;;;;;;; info ;;;;;;;;;;;;;;;;;;;;;;;;

Position_PrintUciInfo:
	; in: rbp thread pos
	;     ecx depth
	;     edx alpha
	;     r8d beta
	;     r9 elapsed
	;     r10d multipv
	; io: rdi info string

	       push   rsi r12 r13 r14 r15
virtual at rsp
 .elapsed    rq 1
 .nodes      rq 1
 .nps	     rq 1
 .depth      rd 1
 .alpha      rd 1
 .beta	     rd 1
 .multiPV    rd 1
 .lend rb 0
end virtual
.localsize = ((.lend-rsp+15) and (-16))
		sub   rsp, .localsize
		mov   dword[.depth], ecx
		mov   dword[.alpha], edx
		mov   dword[.beta], r8d
		mov   qword[.elapsed], r9
		mov   dword[.multiPV], r10d

	     Assert   ne, r10d, 0, 'assertion dword[.multiPV]!=0 in PrintUciInfo failed'

	       call   ThreadPool_NodesSearched
		mov   qword[.nodes], rax
		mov   edx, 1000
		mul   rdx
		mov   rcx, qword[.elapsed]
		cmp   rcx, 1
		adc   rcx, 0
		div   rcx
		mov   qword[.nps], rax


		xor   r15d, r15d
.multipv_loop:
		xor   eax, eax
		cmp   r15d, dword[rbp-Thread.rootPos+Thread.PVIdx]
	      setbe   al

		mov   ecx, dword[.depth]
		sub   ecx, 1
		mov   edx, eax
		 or   edx, ecx
		 jz   .multipv_cont

		add   ecx, eax

	       imul   esi, r15d, sizeof.RootMove
		add   rsi, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
		mov   r12d, dword[rsi+4*rax]

		mov   rax, 'info dep'
	      stosq
		mov   eax, 'th '
	      stosd
		sub   rdi, 1
		mov   eax, ecx
	       call   PrintUnsignedInteger

		mov   al, ' '
	      stosb
		mov   rax, 'multipv '
	      stosq
		lea   eax, [r15+1]
	       call   PrintUnsignedInteger

		mov   rax, ' time '
	      stosq
		sub   rdi, 2
		mov   rax, qword[.elapsed]
	       call   PrintUnsignedInteger

		mov   rax, ' nps '
	      stosq
		sub   rdi, 3
		mov   rax, qword[.nps]
	       call   PrintUnsignedInteger

		mov   rax, ' score '
	      stosq
		sub   rdi, 1
		mov   ecx, r12d
	       call   PrintUciScore

		mov   ecx, 'und'
		cmp   r15d, dword[rbp-Thread.rootPos+Thread.PVIdx]
		jne   .no_bound
		mov   rax, ' lowerbo'
		cmp   r12d, dword[.beta]
		jge   .yes_bound
		mov   rax, ' upperbo'
		cmp   r12d, dword[.alpha]
		 jg   .no_bound
	.yes_bound:
	      stosq
		mov   eax, ecx
	      stosd
		sub   rdi, 1
	.no_bound:


		mov   rax, ' nodes '
	      stosq
		sub   rdi, 1
		mov   rax, qword[.nodes]
	       call   PrintUnsignedInteger

		mov   eax, ' pv'
	      stosd
		sub   rdi, 1

		mov   r13d, dword[rsi+RootMove.pvSize]
		lea   r12, [rsi+RootMove.pv]
		lea   r13, [r12+4*r13]
	.next_move:
		mov   al, ' '
		cmp   r12, r13
		jae   .moves_done
	      stosb
		mov   ecx, dword[r12]
	      movzx   edx, byte[rbp+Pos.chess960]
	       call   PrintUciMove
		add   r12, 4
		jmp   .next_move
	.moves_done:

		mov   al, 10
	      stosb

.multipv_cont:
		add   r15d, 1
		cmp   r15d, dword[.multiPV]
		 jb   .multipv_loop


		add   rsp, .localsize
		pop   r15 r14 r13 r12 rsi
		ret


