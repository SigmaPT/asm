

PerftGen_Root:
		       push   rbx rsi rdi r14 r15
virtual at rsp
.time	  dq ?
.movelist rq MAX_MOVES
.lend	   db ?
end virtual
.localsize = .lend-rsp
			sub   rsp, .localsize

			mov   rbx, qword [rbp+Pos.state]
			mov   r15d, ecx
			xor   r14, r14

if DEBUG
			mov   byte [perft_ok], -1
		       call   TestPosition
		       test   eax, eax
			 jz   .TestFailed
end if

		       call   _GetTime
			mov   qword [.time], rax

			lea   rdi, [.movelist]
			mov   rsi, rdi
		       call   Gen_Legal
			xor   eax, eax
			mov   dword [rdi], eax
.MoveLoop:
			mov   ecx, dword [rsi]
		       test   ecx, ecx
			 jz   .MoveLoopDone
			lea   rdi, [Output]
		       call   PrintUciMove
			mov   eax, ' : '
		      stosd
			sub   rdi, 1
			mov   ecx, dword [rsi]
		       call   GivesCheck
			mov   ecx, dword [rsi]
		       call   DoMove_SetFullCi
			lea   ecx, [r15-1]
		       call   PerftGen_Branch

			add   r14, rax
		       call   PrintUnsignedInteger
			mov   al, 10
		      stosb
			lea   rcx, [Output]
		       call   _WriteOut
			mov   ecx, dword [rsi]
		       call   UndoMove

if DEBUG
			cmp   byte [perft_ok], -1
			jne   .Done
end if

		       test   eax, eax
			 jz   .Error
			add   rsi, 8
			jmp   .MoveLoop
.MoveLoopDone:
		       call   _GetTime
			sub   rax, qword [.time]
			cmp   rax, 1
			adc   rax, 0
			mov   qword [.time], rax

			lea   rdi, [Output]
		    stdcall   PrintString, 'total: '
			mov   rax, r14
		       call   PrintUnsignedInteger
			mov   eax,'  ( '
		      stosd
			mov   rax, qword[.time]
		       call   PrintUnsignedInteger
			mov   rax,' ms  '
		      stosq
			sub   rdi, 3
			mov   eax, 1000
			mul   r14
			div   qword [.time]
		       call   PrintUnsignedInteger
			mov   rax,' nps ) ' + (10 shl 56)
		      stosq
			lea   rcx, [Output]
		       call   _WriteOut
.Done:
			mov   eax, r14d
			add   rsp, .localsize
			pop   r15 r14 rdi rsi rbx
			ret
.Error:
			lea   rdi, [Output]
			mov   al, 10
		      stosb
			mov   rcx, rdx
		       call   PrintString
			lea   rcx, [Output]
		       call   _WriteOut
			jmp   .Done

if DEBUG
.TestFailed:
			xor   r14d, r14d
			jmp   .Done

end if




		      align  16
PerftGen_Branch:
		       push   rbx rdi rsi r14 r15
virtual at rsp
.movelist rq MAX_MOVES
.lend	   db ?
end virtual
.localsize = .lend-rsp
			sub   rsp, .localsize
			mov   r15d, ecx


			xor   r14, r14

if DEBUG
			cmp   byte [perft_ok],-1
			jne   .DepthNDone
		       call   TestPosition
		       test   eax, eax
			 jz   .TestFailed
end if

			lea   rdi, [.movelist]
			mov   rsi, rdi
			lea   eax, [r14+1]
			cmp   r15d, 2
			 je   .Depth2
			sub   r15d, 1
			 jz   .Depth1
			 js   .Depth0


		       call   Gen_Legal
			xor   eax, eax
			mov   dword [rdi], eax
.DepthNLoop:
			mov   ecx, dword[rsi]
		       test   ecx, ecx
			 jz   .DepthNDone
		       call   GivesCheck
			mov   edx, eax
			mov   ecx, dword[rsi]
		       call   DoMove_SetFullCi
			mov   ecx, r15d
		       call   PerftGen_Branch
			add   r14, rax
			mov   ecx, dword [rsi]
		       call   UndoMove

if DEBUG
			cmp   byte [perft_ok], -1
			jne   .TestFailed
end if

			add   rsi, 8
			jmp  .DepthNLoop



		      align   8
.Depth2:
			sub   r15, 1
		       call   Gen_Legal
			xor   eax, eax
			mov   dword [rdi], eax
.Depth2Loop:
			mov   ecx, dword[rsi]
		       test   ecx, ecx
			 jz   .DepthNDone
		       call   GivesCheck
			mov   edx, eax
			mov   ecx, dword[rsi]
		       call   DoMove_SetHalfCi
			mov   ecx, r15d
		       call   PerftGen_Branch
			add   r14, rax
			mov   ecx, dword [rsi]
		       call   UndoMove
if DEBUG
			cmp   byte [perft_ok], -1
			jne   .TestFailed
end if
			add   rsi, 8
			jmp  .Depth2Loop


		      align   8
.Depth1:
		       call   Gen_Legal
			mov   r14, rdi
			sub   r14, rsi
			shr   r14d, 3

		      align   8
.DepthNDone:
			mov   rax, r14
.Depth0:
			add   rsp, .localsize
			pop   r15 r14 rsi rdi rbx
			ret








if DEBUG
.TestFailed:
			mov   byte [perft_ok], 0
			xor   r14, r14
			jmp   .DepthNDone
end if










