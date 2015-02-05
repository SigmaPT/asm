

PerftPick_Root:
		; in rbp address of Pos
		;    ecx depth

virtual at rsp
  .depth	rd 1
  .move 	rd 1
  .perftnodes	rq 1
  .time 	rq 1
  .ss		rq 1
  .movepick	rb sizeof.Pick
  .searchStack	rb (MAX_PLY+1)*sizeof.Stack
  .lend rb 0
end virtual
  .localsize = (.lend-rsp+15) and -16

		       push   rbx rsi rdi r12 r13 r14 r15
			mov   eax, .localsize
		       call   __chkstk_ms
			sub   rsp, rax

			lea   rax, [.searchStack]
			mov   qword [.ss], rax

			xor   eax, eax
			sub   ecx, 1
			mov   dword [.depth], ecx
			mov   qword [.perftnodes], rax
			mov   qword [rbp+Pos.nodes], rax

		       call   _GetTime
			mov   qword [.time], rax


			mov   rbx, [rbp+Pos.state]
			mov   rcx, qword [.ss]
			lea   rsi, [.movepick]
			mov   qword [rsi+Pick.ss], rcx
			mov   word [rsi+Pick.countermoves+2*0], 0
			mov   word [rsi+Pick.countermoves+2*1], 0
			mov   word [rsi+Pick.followupmoves+2*0], 0
			mov   word [rsi+Pick.followupmoves+2*1], 0
			mov   byte [rsi+Pick.recaptureSquare], 64
			xor   ecx, ecx
		       call   MovePick_Init_Search
.GenNext:
		GetNextMove
			mov   dword [.move], eax
		       test   eax, eax
			 jz   .GenDone

			mov   ecx, eax
		       call   IsMoveLegal
		       test   rax, rax
			 jz   .GenNext

			add   qword [rbp+Pos.nodes], 1

			lea   rdi, [Output]
			mov   ecx, dword [.move]
		       call   PrintUciMove
			mov   eax, ' : '
		      stosd
			sub   rdi, 1

			mov   ecx, dword [.move]
		       call   GivesCheck
			mov   edx, eax
			mov   ecx, dword [.move]
		       call   DoMove_SetFullCi

			mov   ecx, dword [.depth]
			mov   rdx, qword [.ss]
			add   rdx, sizeof.Stack
		       call   PerftPick_Branch
			add   qword [.perftnodes], rax

		       call   PrintUnsignedInteger
			mov   al, 10
		      stosb
			lea   rcx, [Output]
		       call   _WriteOut

			mov   ecx, dword [.move]
		       call   UndoMove

			jmp   .GenNext
.GenDone:

		       call   _GetTime
			sub   rax, qword [.time]
			cmp   rax, 1
			adc   rax, 0
			mov   qword [.time], rax

			lea   rdi, [Output]
		     szcall   PrintString, 'total: '
			mov   rax, qword [.perftnodes]
		       call   PrintUnsignedInteger
			mov   eax,'  ( '
		      stosd
			mov   rax, qword[.time]
		       call   PrintUnsignedInteger
			mov   rax,' ms  '
		      stosq
			sub   rdi, 3
			mov   eax, 1000
			mul   qword [rbp+Pos.nodes]
			div   qword [.time]
		       call   PrintUnsignedInteger
			mov   rax,' nps ) ' + (10 shl 56)
		      stosq
			lea   rcx, [Output]
		       call   _WriteOut



			mov   rax, qword[.perftnodes]

.Return:

			add   rsp, .localsize
			pop   r15 r14 r13 r12 rdi rsi rbx
			ret











PerftPick_Branch:
		; in rbp address of Pos
		;    ecx depth

virtual at rsp
  .depth	rd 1
  .move 	rd 1
  .perftnodes	rq 1
  .ss		rq 1
  .movepick	rb sizeof.Pick
  .lend rb 1
end virtual
  .localsize = .lend - rsp

		       push   rbx rsi rdi r12 r13 r14 r15
			sub   rsp, .localsize

			mov   qword [.ss] ,rdx

			xor   eax, eax
			sub   ecx, 1
			mov   dword [.depth], ecx
			mov   qword [.perftnodes], rax
			lea   rax, [rax+1]
		       test   ecx, ecx
			 js   .Return


			mov   rbx, [rbp+Pos.state]
			mov   rcx, qword [.ss]
			lea   rsi, [.movepick]
			mov   qword [rsi+Pick.ss], rcx
			mov   word [rsi+Pick.countermoves+2*0], 0
			mov   word [rsi+Pick.countermoves+2*1], 0
			mov   word [rsi+Pick.followupmoves+2*0], 0
			mov   word [rsi+Pick.followupmoves+2*1], 0
			mov   byte [rsi+Pick.recaptureSquare], 64
			xor   ecx, ecx
		       call   MovePick_Init_Search
.GenNext:
		GetNextMove
			mov   dword [.move], eax
		       test   eax, eax
			 jz   .GenDone

			mov   ecx, eax
		       call   IsMoveLegal
		       test   rax, rax
			 jz   .GenNext

			mov   ecx, dword [.move]
		       call   GivesCheck
			mov   edx, eax
			mov   ecx, dword [.move]
			add   qword [rbp+Pos.nodes], 1
		       call   DoMove_SetFullCi

			mov   ecx, dword [.depth]
			mov   rdx, qword [.ss]
			add   rdx, sizeof.Stack
		       call   PerftPick_Branch
			add   qword [.perftnodes], rax

			mov   ecx, dword [.move]
		       call   UndoMove

			jmp   .GenNext
.GenDone:



			mov   rax, qword[.perftnodes]

.Return:

			add   rsp, .localsize
			pop   r15 r14 r13 r12 rdi rsi rbx
			ret

