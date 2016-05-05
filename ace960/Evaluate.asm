



		      align   16
_Evaluate:
	; in  rbp address of Pos struct
	;     rbx address of State struct
	; out eax evaluation
	       ;        push   rbx
	       ;         mov   rbx, qword[rbp+Pos.state]
		      movsx   eax, word[rbx+State.psq+2*0]
			mov   ecx, dword[rbp+Pos.sideToMove]
			neg   ecx
			xor   eax, ecx
			sub   eax, ecx

	       ;         pop   rbx
			ret





		      align  16
Evaluate:     ; jmp _Evaluate
	; in  rbp address of Pos struct
	;     rbx address of State struct
	; out eax evaluation

		       push   rbx rsi rdi r12 r13 r14 r15

			mov   r15, qword[rbp+Pos.typeBB+8*White]
			 or   r15, qword[rbp+Pos.typeBB+8*Black]

		; eax holds the score
		      movsx   eax, word[rbx+State.psq+2*0]

	;                jmp   .Done
	;        ; get mobility if |material score | <= 200
	;                lea  ecx,[rax+200*PAWN_VALUE_MG]
	;                cmp  ecx,2*200*PAWN_VALUE_MG
	;                 ja  .MobilityDone

			mov  r9,qword[rbp+Pos.typeBB+8*Black]
		       ; xor  eax, eax

			mov  rsi,qword[rbp+Pos.typeBB+8*Bishop]
			bsf  rdi,rsi
			 jz  .BishopDone
	.Bishop:
		       blsr  rsi,rsi,r8
	      BishopAttacks  rdx,rdi,r15,r8
		     popcnt  rdx,rdx,r8
			 bt  r9,rdi
			sbb  ecx,ecx
			xor  edx,ecx
			sub  edx,ecx
			lea  eax,[rax+4*rdx]
			bsf  rdi,rsi
			jnz  .Bishop
	.BishopDone:

			mov  rsi,qword[rbp+Pos.typeBB+8*Rook]
			bsf  rdi,rsi
			 jz  .RookDone
	.Rook:
		       blsr  rsi,rsi,r8
		RookAttacks  rdx,rdi,r15,r8
		     popcnt  rdx,rdx,r8
			 bt  r9,rdi
			sbb  ecx,ecx
			xor  edx,ecx
			sub  edx,ecx
			lea  eax,[rax+2*rdx]
			bsf  rdi,rsi
			jnz  .Rook
	.RookDone:

			mov  rsi,qword[rbp+Pos.typeBB+8*Queen]
			bsf  rdi,rsi
			 jz  .QueenDone
	.Queen:
		       blsr  rsi,rsi,r8
		RookAttacks  rdx,rdi,r15,r8
	      BishopAttacks  r10,rdi,r15,r8
			 or  rdx,r10
		     popcnt  rdx,rdx,r8
			 bt  r9,rdi
			sbb  ecx,ecx
			xor  edx,ecx
			sub  edx,ecx
			lea  eax,[rax+1*rdx]
			bsf  rdi,rsi
			jnz  .Queen
	.QueenDone:
		     ; movsx   ecx, word [rbx+State.psq+2*0]
		     ;  imul   eax, PAWN_VALUE_MG
		     ;   add   eax, ecx
 .MobilityDone:

		; r14 = black pawns
		; r13 - white pawns
		; r12 - all pawns
			mov  r12, qword [rbp+Pos.typeBB+8*Pawn]
			mov  r13, qword [rbp+Pos.typeBB+8*White]
			mov  r14, qword [rbp+Pos.typeBB+8*Black]
			and  r13, r12
			and  r14, r12

		; white pawn positional bonuses
			mov  rbx,r13
			bsf  rcx,rbx
			 jz  .WhitePawnsDone
    .WhitePawns:
			mov   esi, ecx
			shr   esi, 3
			lea   esi, [5*rsi]
			add   esi, esi
		       blsr   rbx, rbx, r8

		; bonus for passed pawns
			mov  rdx,r14
			and  rdx,qword[WhitePassedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,esi
			add  eax,edx

		; penalty for isolated pawns
			mov  rdx,r13
			and  rdx,qword[IsolatedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,ISOLATED_PAWN_PENALTY
			sub  eax,edx

			bsf  rcx,rbx
			jnz  .WhitePawns
    .WhitePawnsDone:



		; black pawn positional bonuses
			mov  rbx,r14
			bsf  rcx,rbx
			 jz  .BlackPawnsDone
    .BlackPawns:
			mov  esi,ecx
			shr  esi,3
			xor  esi,7
			lea  esi,[5*rsi]
			add   esi, esi
		       blsr  rbx,rbx,r8

		; bonus for passed pawns
			mov  rdx,r13
			and  rdx,qword[BlackPassedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,esi
			sub  eax,edx

		; penalty for isolated pawns
			mov  rdx,r14
			and  rdx,qword[IsolatedPawns+8*rcx]
			cmp  rdx,1
			sbb  edx,edx
			and  edx,ISOLATED_PAWN_PENALTY
			add  eax,edx

			bsf  rcx,rbx
			jnz  .BlackPawns
    .BlackPawnsDone:


.Done:
		; adjust score for side to move
			mov   ecx, dword [rbp+Pos.sideToMove]
			neg   ecx
			xor   eax, ecx
			sub   eax, ecx

			pop   r15 r14 r13 r12 rdi rsi rbx
			ret


