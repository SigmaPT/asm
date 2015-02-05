		      align  16
UndoMove:
		       push   rsi
			mov   esi, dword [rbp+Pos.sideToMove]
			xor   esi, 1

			mov   r8d, ecx
			shr   r8d, 6
			and   r8d, 63	; r8d = from
			mov   r9d, ecx
			and   r9d, 63	; r9d = to
			shr   ecx, 12

		      movzx   r11d, byte [rbx+State.capturedPiece]	; r11 = TO PIECE
		      movzx   r10d, byte [rbp+Pos.board+r9]		; r10 = FROM PIECE

			xor   edx, edx
			bts   rdx, r8
			bts   rdx, r9

			mov   eax, r10d
			and   eax, 7
			mov   byte [rbp+Pos.board+r8], r10l
			mov   byte [rbp+Pos.board+r9], r11l
			xor   qword [rbp+Pos.typeBB+8*rax], rdx
			xor   qword [rbp+Pos.typeBB+8*rsi], rdx

			sub   rbx, sizeof.State
			mov   qword [rbp+Pos.state], rbx
			mov   dword [rbp+Pos.sideToMove], esi
			sub   dword [rbp+Pos.gamePly], 1

			and   r11d, 7
			jnz   .Captured
			cmp   ecx, MOVE_TYPE_CASTLE
			jae   .Special
			pop   rsi
			ret

		      align   8
.Captured:
			xor   esi, 1
			btr   rdx, r8
			 or   qword [rbp+Pos.typeBB+8*r11], rdx
			 or   qword [rbp+Pos.typeBB+8*rsi], rdx
			xor   esi, 1
			cmp   ecx, MOVE_TYPE_CASTLE
			jae   .Special
			pop   rsi
			ret


		      align   8
.Special:
			xor   edx, edx
			cmp   ecx, MOVE_TYPE_EPCAP
			 je   .EpCapture
			cmp   ecx, MOVE_TYPE_CASTLE
			 je   .Castle

.Prom:
	; change promoted piece back to pawn on r8d
			lea   eax, [8*rsi+Pawn]
			lea   ecx, [rcx-MOVE_TYPE_PROM+Knight]
			bts   rdx, r8
			 or   qword [rbp+Pos.typeBB+8*Pawn], rdx
			xor   qword [rbp+Pos.typeBB+8*rcx], rdx
			mov   byte [rbp+Pos.board+r8], al
			pop   rsi
			ret

		      align   8
.EpCapture:
			lea   ecx, [2*rsi-1]
			lea   ecx, [r9+8*rcx]
			xor   r10d, 8
			xor   esi, 1
			bts   rdx, rcx
			 or   qword [rbp+Pos.typeBB+8*Pawn], rdx
			 or   qword [rbp+Pos.typeBB+8*rsi], rdx
			mov   byte [rbp+Pos.board+rcx], r10l
			pop   rsi
			ret

		      align   8
.Castle:
			mov   eax, r8d
			sub   eax, r9d
			sar   eax, 31
			and   eax, 7
			add   r9d, r8d
			and   r8d, 0111000b
			 or   r8d, eax
			shr   r9, 1
			bts   rdx, r8
			bts   rdx, r9
			sub   r10d, King-Rook
			mov   byte [rbp+Pos.board+r8], r10l
			mov   byte [rbp+Pos.board+r9], 0
			xor   qword [rbp+Pos.typeBB+8*rsi], rdx
			xor   qword [rbp+Pos.typeBB+8*Rook], rdx
			pop   rsi
			ret
