Move_DoNull:

match =1, DEBUG {
	       push   rcx
		lea   rdi, [DebugOutput]
		mov   qword[rbp+Pos.state], rbx
	       call   Position_PrintSmall
		mov   eax, 10
	      stosd
		mov   qword[rbp+Pos.state], rbx
	       call   Position_IsLegal
	       test   eax, eax
		jnz   Move_DoNull_posill
		pop   rcx
}



		mov   eax, dword[rbx+State.rule50]
		mov   r8, qword[rbx+State.key]
		mov   r9, qword[rbx+State.pawnKey]
		mov   r10, qword[rbx+State.materialKey]
		mov   r11, qword[rbx+State.psq] ; copy psq and npMaterial
		mov   edx, dword[rbx+State.move] ; copy capturedpiece

	     Assert   e, qword[rbx+State.checkersBB], 0, 'assertion qword[rbx+State.checkersBB] = 0 failed in DoNullMove'

		add   rbx, sizeof.State
		xor   dword[rbp+Pos.sideToMove], 1
		xor   r8, qword[Zobrist_side]

		mov   ecx, eax
		cmp   eax, 0x40000000
		 jb   .epsq
.epsq_ret:
		and   eax, 0x00FF00FF	 ; clear ep square and plies from null
		add   eax, 0x40000001	 ; reset ep square and increment 50moves
		xor   ecx, ecx
		mov   qword[rbx+State.key], r8
		mov   qword[rbx+State.pawnKey], r9
		mov   qword[rbx+State.materialKey], r10
		mov   qword[rbx+State.psq], r11
		mov   dword[rbx+State.rule50], eax
		mov   dword[rbx+State.move], edx
		mov   qword[rbx+State.checkersBB], rcx


match =1, DEBUG {
	       push   rcx
		mov   qword[rbp+Pos.state], rbx
	       call   Position_IsLegal
	       test   eax, eax
		jnz   Move_DoNull_post_posill
		pop   rcx
}

		ret

.epsq:
		shr   ecx, 24
		and   ecx, 7
		xor   r8, qword[Zobrist_Ep+8*rcx]
		jmp   .epsq_ret




match =1, DEBUG {

Move_DoNull_posill:
		lea   rdi, [Output]
	     szcall   PrintString, 'position did not pass Position_IsLegal in DoNullMove'
		jmp   Move_DoNull_GoError
Move_DoNull_post_posill:
		lea   rdi, [Output]
	      szcall  PrintString, 'position not legal after making null move in DoNullMove'
		jmp   Move_DoNull_GoError


Move_DoNull_GoError:
		mov   al, 10
	      stosb
		mov   rcx, qword[rbp+Pos.debugPointer]
	       call   PrintString
		mov   al, 10
	      stosb
		lea   rcx, [DebugOutput]
	       call   PrintString
		xor   eax, eax
	      stosd
		lea   rdi, [Output]
	       call   _ErrorBox
	       int3

}