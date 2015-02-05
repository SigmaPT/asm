
PositionCopy:
		; rbx address of source Pos
		; rbp address of destination Pos
		; rcx address of destination state array
		; rdx destination thread

		       push   rsi rdi r15

			mov   r15, rcx
			mov   qword [rbp+Pos.stateTable], rcx
			mov   qword [rbp+Pos.thisThread], rdx

		; copy typeBB and board
			lea   rsi, [rbx+Pos.typeBB]
			lea   rdi, [rbp+Pos.typeBB]
			mov   ecx, 128/8
		  rep movsq

		; copy gamePly and sideToMove
			mov   rax, qword [rbx+Pos.gamePly]
			mov   qword [rbp+Pos.gamePly], rax

		; copy relevent State elements
			mov   rcx, [rbx+Pos.state]
			mov   esi, 99
		      movzx   eax, [rcx+State.rule50]
			cmp   esi, eax
		      cmova   esi, eax
		      movzx   eax, [rcx+State.pliesFromNull]
			cmp   esi, eax
		      cmova   esi, eax

			mov   rdi, r15
		       imul   esi, sizeof.State
			lea   rax, [rdi+rsi]
			mov   qword [rbp+Pos.state], rax
			lea   ecx, [rsi+sizeof.State]
			neg   rsi
			add   rsi, qword [rbx+Pos.state]
			shr   ecx, 3
		  rep movsq

			pop   r15 rdi rsi
			ret




CopyPositionToThread:

		; in: rbp address of destination Pos
		;     rbx address of source Pos

		       push   rsi rdi

		; copy typeBB and board
			lea   rsi, [rbx+Pos.typeBB]
			lea   rdi, [rbp+Pos.typeBB]
			mov   ecx, 128/8
		  rep movsq

		; copy gamePly and sideToMove
			mov   rax, qword [rbx+Pos.gamePly]
			mov   qword [rbp+Pos.gamePly], rax

		; copy relevent State elements
			mov   rcx, [rbx+Pos.state]
			mov   esi, 99
		      movzx   eax, [rcx+State.rule50]
			cmp   esi, eax
		      cmova   esi, eax
		      movzx   eax, [rcx+State.pliesFromNull]
			cmp   esi, eax
		      cmova   esi, eax

		       imul   esi, sizeof.State
			mov   rdi, qword [rbp+Pos.stateTable]
			lea   rax, [rdi+rsi]
			mov   qword [rbp+Pos.state], rax
			lea   ecx, [rsi+sizeof.State]
			neg   rsi
			add   rsi, qword [rbx+Pos.state]
			shr   ecx, 3
		  rep movsq

			pop   rdi rsi
			ret
