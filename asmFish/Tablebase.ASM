
TableBase_Init:
		jmp   _ZN13TablebaseCore4initEPKc



Tablebase_ProbeAB:
	; in: rbp address of position
	;     rbx address of state
	;     ecx  alpha
	;     edx  beta
	;     r8  address of success
	; out: eax v

	       push   rsi rdi r13 r14 r15
virtual at rsp
  .stack rb 64*sizeof.ExtMove
  .localend rb 0
end virtual
.localsize = ((.localend-rsp+15) and (-16))
		sub   rsp, .localsize
		mov   rax, qword[rbx+State.checkersBB]
		mov   r14d, ecx
		mov   r15d, edx
		mov   r13, r8
		lea   rdi, [.stack]
	       test   rax, rax
		jnz   .InCheck
.NotInCheck:   call   Gen_Captures
		lea   rsi, [.stack-8]
		mov   rdx, rdi
.NextMove:	add   rsi, 8
		mov   ecx, dword[rsi+ExtMove.move]
		mov   eax, ecx
		and   eax, 63
	      movzx   eax, byte[rbp+Pos.board+rax]
		cmp   rsi, rdx
		jae   .GenDone
		cmp   ecx, (MOVE_TYPE_PROM+3) shl 12
		 jb   .NextMove
		cmp   ecx, (MOVE_TYPE_PROM+4) shl 12
		jae   .NextMove
	       test   eax, eax
		 jz   .NextMove
		sub   eax, 1 shl 12
	      stosq
		sub   eax, 1 shl 12
	      stosq
		sub   eax, 1 shl 12
	      stosq
		jmp   .NextMove
.InCheck:      call   Gen_Captures
.GenDone:      call   SetCheckInfo

		lea   rsi, [.stack-8]
.MoveLoop:
		add   rsi, 8
		mov   ecx, dword[rsi+ExtMove.move]
		mov   eax, ecx
		and   eax, 63
	      movzx   eax, byte[rbp+Pos.board+rax]
		cmp   rsi, rdi
		jae   .MovesDone
		cmp   ecx, MOVE_TYPE_CASTLE shl 12
		jae   .MoveLoop
	       test   eax, eax
		 jz   .MoveLoop
	       call   Move_IsLegal
		mov   ecx, dword[rsi+ExtMove.move]
	       test   eax, eax
		 jz   .MoveLoop
	       call   Move_GivesCheck
		mov   ecx, dword[rsi+ExtMove.move]
		mov   edx, eax
	       call   Move_Do
		mov   ecx, r15d
		mov   edx, r14d
		neg   ecx
		neg   edx
		mov   r8, r13
	       call   Tablebase_ProbeAB
		neg   eax
	       push   rax
		mov   ecx, dword[rsi+ExtMove.move]
	       call   Move_Undo
		pop   rax
		xor   edx, edx
		cmp   edx, dword[r13]
	      cmove   eax, edx
		 je   .Return	     ; failed
		lea   edx, [rdx+2]
		cmp   eax, r14d
		jle   .MoveLoop
		cmp   eax, r15d
		jge   .Return
		mov   r14d, eax
		jmp   .MoveLoop
.MovesDone:
		mov   rcx, rbp
		mov   rdx, r13
	       call   _ZN13TablebaseCore15probe_dtz_tableER8PositioniPi
		xor   edx, edx
		cmp   edx, dword[r13]
	      cmove   eax, edx
		 je   .Return	     ; failed
		lea   edx, [rdx+1]
		cmp   r14d, eax
		 jl   .Return
		neg   r14d
		sar   r14d, 31
		sub   edx, r14d
.Return:
		mov   dword[r13], edx
		add   rsp, .localsize
		pop   r15 r14 r13 rsi rdi
		ret




Tablebase_ProbeWDL:
	; in: rbp address of position
	;     rbx address of state
	;     rcx  address of success
	; out: eax v
	       push   r15
		mov   r15, rcx
		mov   r8, rcx
		mov   ecx, -2
		mov   edx, 2
	       call   Tablebase_ProbeAB
		mov   edx, dword[r15]
		cmp   byte[rbx+State.epSquare], 64
		 jb   .HaveEP
.Return1:
		pop   r15
		ret

.HaveEP:
	       test   edx, edx
	      cmovz   eax, edx
		 jz   .Return1
	       push   r14 r13 rsi rdi
virtual at rsp
  .stack rb 64*sizeof.ExtMove
  .localend rb 0
end virtual
.localsize = ((.localend-rsp+15) and (-16))
		sub   rsp, .localsize
		mov   rcx, qword[rbx+State.checkersBB]
		mov   r14d, -3
		lea   rdi, [.stack]
		mov   rsi, rdi
	       test   rcx, rcx
		jnz   .InCheck
.NotInCheck:   call   Gen_Captures
		jmp   .GenDone
.InCheck:      call   Gen_Captures
.GenDone:      call   SetCheckInfo

		lea   rsi, [.stack-8]
.MoveLoop:
		add   rsi, 8
		mov   ecx, dword[rsi+ExtMove.move]
		cmp   rsi, rdi
		jae   .MovesDone
		cmp   ecx, MOVE_TYPE_EPCAP shl 12
		 jb   .MoveLoop
	       call   Move_IsLegal
	       test   eax, eax
		 jz   .MoveLoop
		mov   ecx, dword[rsi+ExtMove.move]
	       call   Move_GivesCheck
		mov   ecx, dword[rsi+ExtMove.move]
		mov   edx, eax
	       call   Move_Do
		mov   ecx, -2
		mov   edx, 2
		mov   r8, r15
	       call   Tablebase_ProbeAB
		neg   eax
	       push   rax
		mov   ecx, dword[rsi+ExtMove.move]
	       call   Move_Undo
		pop   rax
		mov   edx, dword[r15]
		cmp   r14d, r13d
	       test   edx, edx
	      cmovz   eax, edx
		 jz   .Return2



.Return2:
		add   rsp, .localsize
		pop   rdi rsi r13 r14
		pop   r15
		ret



Tablebase_ProbeDTZNoEP:
	; in: rbp address of position
	;     rbx address of state
	;     rcx  address of success
	; out: eax best

	       int3
		ret



Tablebase_ProbeDTZ:
	; in: rbp address of position
	;     rbx address of state
	;     rcx  address of success
	; out: eax v

	       int3
		ret


Tablebase_RootProbe:
	; in: rbp address of position
	;     rbx address of state
	; out: eax bool
	;          score is in Tablebase_Score
	       int3
		ret


Tablebase_RootProbeWDL:
	; in: rbp address of position
	;     rbx address of state
	; out: eax bool
	;          score is in Tablebase_Score

	       int3
		ret















