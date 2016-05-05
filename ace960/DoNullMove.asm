DoNullMove:
		mov   eax, dword[rbx+State.rule50]
		mov   r8, qword[rbx+State.key]
		mov   r9, qword[rbx+State.pawnKey]
		mov   r10, qword[rbx+State.materialKey]
		mov   r11, qword[rbx+State.psq] ; copy psq and npMaterial
		mov   edx, dword[rbx+State.move] ; copy capturedpiece

		add   rbx, sizeof.State
		xor   dword[rbp+Pos.sideToMove], 1
		xor   r8, qword[Zobrist_side]

		mov   ecx, eax
		cmp   eax, 0x40000000
		jae   .epsq
.epsq_ret:
		and   eax, 0x00FF00FF	 ; clear ep square and plies from null
		add   eax, 0x40000001	 ; reset ep square and increment 50moves

		mov   qword[rbx+State.key], r8
		mov   qword[rbx+State.pawnKey], r9
		mov   qword[rbx+State.materialKey], r10
		mov   qword[rbx+State.psq], r11
		mov   dword[rbx+State.rule50], eax
		mov   dword[rbx+State.move], edx
		ret

.epsq:
		shr   ecx, 12
		and   ecx, 7
		xor   r8, qword[Zobrist_Ep+8*rcx]
		jmp   .epsq_ret