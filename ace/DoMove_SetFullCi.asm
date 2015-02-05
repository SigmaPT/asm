		      align   16
DoMove_SetFullCi:
		; in: rbp  address of Pos
		;     rbx  address of State
		;     ecx  move
		;     edx  move is check
		       push   rsi rdi r12 r13 r14 r15

		       push   rcx rdx

			mov   esi, dword [rbp+Pos.sideToMove]

			mov   r15, qword[Zobrist_side]

			mov   r8d, ecx
			shr   r8d, 6
			and   r8d, 63	; r8d = from
			mov   r9d, ecx
			and   r9d, 63	; r9d = to
			shr   ecx, 12

		      movzx   r10d, byte [rbp+Pos.board+r8]	; r10 = FROM PIECE
		      movzx   r11d, byte [rbp+Pos.board+r9]	; r11 = TO PIECE

		       push   r10

			xor   r15, qword [rbx+State.key]
			mov   r14, qword [rbx+State.pawnKey]
			mov   r13, qword [rbx+State.materialKey]
		      vmovq   xmm0, qword [rbx+State.psq]	; psq and npMaterial

	; update rule50 and pliesFromNull and capturedPiece
		      movzx   eax, word [rbx+State.rule50]
			add   eax, 0101H
			and   al,byte[IsNotPawnMasks+r10]
			and   al,byte[IsNotPieceMasks+r11]
			mov   word [rbx+State.rule50+sizeof.State], ax
			mov   byte [rbx+State.capturedPiece+sizeof.State], r11l

	; castling rights
		      movzx   edx, byte [rbx+State.castlingRights]
		      movzx   eax, byte [CastlingMasks+r8]
			 or   al, byte [CastlingMasks+r9]
			and   al, dl
			jnz   .Rights
.RightsRet:		mov   byte [rbx+State.castlingRights+sizeof.State], dl

	; ep square
		      movzx   eax, byte [rbx+State.epSquare]
			cmp   eax, 64
			 jb   .ResetEp
			mov   byte [rbx+State.epSquare+sizeof.State], al

	; capture
			mov   eax, r11d
			and   eax, 7
			jnz   .Capture
.CaptureRet:
.ResetEpRet:

	; move piece
			xor   edx, edx
			bts   rdx, r8
		       push   rdx
			bts   rdx, r9
		       push   rdx
			mov   eax, r10d
			and   eax, 7
			mov   byte [rbp+Pos.board+r8], 0
			mov   byte [rbp+Pos.board+r9], r10l
			xor   qword [rbp+Pos.typeBB+8*rax], rdx
			xor   qword [rbp+Pos.typeBB+8*rsi], rdx
		      movsx   rax, byte[IsPawnMasks+r10]
			shl   r10d, 6+3
			mov   rdx, qword [Zobrist_Pieces+r10+8*r8]
			xor   rdx, qword [Zobrist_Pieces+r10+8*r9]
		      vmovd   xmm1, dword [Scores_Pieces+r10+8*r8]
		      vmovd   xmm2, dword [Scores_Pieces+r10+8*r9]
			xor   r15, rdx
			and   rax, rdx
			xor   r14, rax
		     vpsubw   xmm0, xmm0, xmm1
		     vpaddw   xmm0, xmm0, xmm2
			shr   r10d, 6+3

	; special moves
			cmp   ecx, MOVE_TYPE_DPAWN
			 je   .DoublePawn
			jae   .Special
.SpecialRet:

	; write remaining data to next state entry

			pop   r9 r8 r10
			xor   esi, 1
			add   rbx, sizeof.State
			pop   rdx rcx
			xor   r9, r8
			and   r10d, 7
			shr   ecx, 12

		 ;       add   dword [rbp+Pos.gamePly], 1
			mov   dword [rbp+Pos.sideToMove], esi
			mov   qword [rbp+Pos.state], rbx

			mov   qword [rbx+State.key], r15
			mov   qword [rbx+State.pawnKey], r14
			mov   qword [rbx+State.materialKey], r13
		      vmovq   qword [rbx+State.psq], xmm0

			mov   r13, qword [rbp+Pos.typeBB+8*Rook]
			mov   r12, qword [rbp+Pos.typeBB+8*Bishop]

		       test   rdx, rdx
			jnz   .MoveIsCheck
			mov   qword [rbx+State.checkersBB], rdx

		     ;  test   r12d, r12d
		     ;    jz   SetCheckInfo.afterprolog

.Done:
			mov   rax, qword [rbp+Pos.typeBB+8*Queen]
			mov   rcx, qword [rbp+Pos.typeBB+8*King]
			mov   r15, qword [rbp+Pos.typeBB+8*rsi]
			xor   esi, 1
			mov   r14, qword [rbp+Pos.typeBB+8*rsi]
			shl   esi, 6+3
			mov   r11, r15		; r11 = our pieces
			mov   r10, r14		; r10 = their pieces
			mov   rdi, r15
			 or   rdi, r14		; rdi = all pieces
			and   r15, rcx
			and   r14, rcx
			bsf   r15, r15		; r15 = our king
			bsf   r14, r14		; r14 = their king

			 or   r13, rax
			 or   r12, rax
			mov   byte [rbx+State.ksq], r14l

			mov   rax, qword [RookAttacksPDEP+8*r15]
			and   rax, r13
			mov   rcx, qword [BishopAttacksPDEP+8*r15]
			and   rcx, r12
			 or   rax, rcx
			and   rax, r10
			jnz   .Pinned
			mov   qword [rbx+State.pinned], rax
.PinnedRet:
.CheckInfo:
			mov   rax, qword [RookAttacksPDEP+8*r14]
			and   rax, r13
			mov   rcx, qword [BishopAttacksPDEP+8*r14]
			and   rcx, r12
			 or   rax, rcx
			and   rax, r11
			jnz   .dcCandidates
			mov   qword [rbx+State.dcCandidates], rax
.dcCandidatesRet:
			mov   rax, qword [WhitePawnAttacks+rsi+8*r14]
			mov   rdx, qword [KnightAttacks+8*r14]
			mov   qword [rbx+State.checkSq+8*Pawn], rax
			mov   qword [rbx+State.checkSq+8*Knight], rdx

	      BishopAttacks   rax, r14, rdi, r8
		RookAttacks   rdx, r14, rdi, r8
			xor   ecx, ecx
			mov   qword [rbx+State.checkSq+8*Bishop], rax
			mov   qword [rbx+State.checkSq+8*Rook], rdx
			 or   rax, rdx
			mov   qword [rbx+State.checkSq+8*Queen], rax
			mov   qword [rbx+State.checkSq+8*King], rcx

			pop   r15 r14 r13 r12 rdi rsi
			ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

if DEBUG
.KingCapture:

mov   r14, qword [rbp+Pos.ssTable]
lea   r14, [r14+2*sizeof.Stack]
lea   rdi, [Output]

movzx	ecx, word[r14+Stack.currentMove]
@@:
call   _PrintUciMove
mov   al, 10
stosb
add    r14, sizeof.Stack
movzx	ecx, word[r14+Stack.currentMove]
test  ecx,ecx
jnz  @b
call   _WriteOut_Output
int3
end if


		      align   8
.Capture:

if DEBUG
cmp   eax, King
 je   .KingCapture
end if

			xor   esi, 1
	; remove piece
			mov   rdi, qword [rbp+Pos.typeBB+8*rsi]
			mov   rdx, qword [rbp+Pos.typeBB+8*rax]
			btr   rdi, r9
			btr   rdx, r9
			mov   qword [rbp+Pos.typeBB+8*rsi], rdi
			mov   qword [rbp+Pos.typeBB+8*rax], rdx
			xor   esi, 1
			and   rdi, rdx
		     popcnt   rdi, rdi, rdx
		      movsx   rax, byte [IsPawnMasks+r11]
			shl   r11d, 6+3
			mov   rdx, qword [Zobrist_Pieces+r11+8*r9]
			xor   r15, rdx
			and   rax, rdx
			xor   r14, rax
			xor   r13, qword [Zobrist_Pieces+r11+8*rdi]
		      vmovq   xmm1, qword [Scores_Pieces+r11+8*r9]
		     vpsubw   xmm0, xmm0, xmm1
			shr   r11d, 6+3
			jmp   .CaptureRet

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		      align   8
.MoveIsCheck:
			mov   rax, qword [rbx+State.dcCandidates-sizeof.State]
			mov   r10, qword [rbx+State.checkSq-sizeof.State+8*r10]
			cmp   ecx, MOVE_TYPE_CASTLE
			jae   .DoFull
			and   r10, r9
		       test   rax, r8
			jnz   .DoFull
			mov   qword [rbx+State.checkersBB], r10
			jmp   .Done
.DoFull:
			mov   ecx, esi
			mov   rdx, qword [rbp+Pos.typeBB+8*King]
			and   rdx, qword [rbp+Pos.typeBB+8*rsi]
			bsf   rdx, rdx
		       call   AttackersTo_Side
			mov   qword [rbx+State.checkersBB], rax
			jmp   .Done

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		      align   8
.Pinned:
			xor   r10d, r10d
			mov   edx, r15d
			shl   rdx, 6+3
			lea   rdx, [BetweenBB+rdx]
			bsf   rcx, rax
		@@:	mov   rcx, qword [rdx+8*rcx]
		       blsr   rax, rax, r9
			and   rcx, rdi
		       blsr   r8, rcx, r9
			neg   r8
			sbb   r8, r8
		       andn   rcx, r8, rcx
			 or   r10, rcx
			bsf   rcx, rax
			jnz   @b
			and   r10, r11
			mov   qword [rbx+State.pinned], r10
			jmp   .PinnedRet

		      align   8
.dcCandidates:
			xor   r10d, r10d
			mov   edx, r14d
			shl   rdx, 6+3
			lea   rdx, [BetweenBB+rdx]
			bsf   rcx, rax
		@@:	mov   rcx, qword [rdx+8*rcx]
		       blsr   rax, rax, r9
			and   rcx, rdi
		       blsr   r8, rcx, r9
			neg   r8
			sbb   r8, r8
		       andn   rcx, r8, rcx
			 or   r10, rcx
			bsf   rcx, rax
			jnz   @b
			and   r10, r11
			mov   qword [rbx+State.dcCandidates], r10
			jmp   .dcCandidatesRet

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		      align   8
.ResetEp:
			and   eax, 7
			xor   r15, qword [Zobrist_Ep+8*rax]
			mov   byte [rbx+State.epSquare+sizeof.State], 64
			mov   eax, r11d
			and   eax, 7
			jnz   .Capture
			jmp   .ResetEpRet


		      align   8
.Rights:
			xor   edx, eax
			xor   r15, qword [Zobrist_Castling+8*rax]
			jmp   .RightsRet

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		      align   8
.Special:
			xor   edx, edx
			cmp   ecx, MOVE_TYPE_EPCAP
			 ja   .Promotion
			 je   .EpCapture

.Castling:
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
			mov   byte [rbp+Pos.board+r8], 0
			mov   byte [rbp+Pos.board+r9], r10l
			xor   qword [rbp+Pos.typeBB+8*rsi], rdx
			xor   qword [rbp+Pos.typeBB+8*Rook], rdx
			shl   r10d, 6+3
			xor   r15, qword [Zobrist_Pieces+r10+8*r8]
			xor   r15, qword [Zobrist_Pieces+r10+8*r9]
		      vmovd   xmm1, dword [Scores_Pieces+r10+8*r8]
		      vmovd   xmm2, dword [Scores_Pieces+r10+8*r9]
		     vpsubw   xmm0, xmm0, xmm1
		     vpaddw   xmm0, xmm0, xmm2
			jmp   .SpecialRet


		      align   8
.DoublePawn:
			mov   edx, esi
			shl   edx, 6+3
			add   r8d, r9d
			shr   r8d, 1
			mov   rax, qword [WhitePawnAttacks+rdx+8*r8]
			mov   edx, esi
			xor   edx, 1
			and   rax, qword [rbp+Pos.typeBB+8*Pawn]
		       test   rax, qword [rbp+Pos.typeBB+8*rdx]
			 jz   .SpecialRet
			mov   byte [rbx+State.epSquare+sizeof.State], r8l
			and   r8d, 7
			xor   r15, qword [Zobrist_Ep+8*r8]
			jmp   .SpecialRet



		      align   8
.Promotion:
			lea   ecx, [rcx-MOVE_TYPE_PROM+8*rsi+Knight]
		; remove pawn r10 on square r9
			mov   rdx, qword [rbp+Pos.typeBB+8*Pawn]
			btr   rdx, r9
			mov   qword [rbp+Pos.typeBB+8*Pawn], rdx
			and   rdx, qword [rbp+Pos.typeBB+8*rsi]
		     popcnt   rax, rdx, r8
			shl   r10d, 6+3
			mov   rdx, qword [Zobrist_Pieces+r10+8*r9]
			xor   r15, rdx
			xor   r14, rdx
			xor   r13, qword [Zobrist_Pieces+r10+8*rax]
		      vmovd   xmm1, dword [Scores_Pieces+r10+8*r9]
		     vpsubw   xmm0, xmm0, xmm1
		; place piece ecx on square r9
			mov   eax, ecx
			and   eax, 7
			mov   rdx, qword [rbp+Pos.typeBB+8*rax]
			bts   rdx, r9
			mov   qword [rbp+Pos.typeBB+8*rax], rdx
			mov   byte [rbp+Pos.board+r9], cl
			and   rdx, qword [rbp+Pos.typeBB+8*rsi]
		     popcnt   rax, rdx, r8
			shl   ecx, 6+3
			xor   r15, qword [Zobrist_Pieces+rcx+8*r9]
			xor   r13, qword [Zobrist_Pieces+rcx+8*(rax-1)]
		      vmovd   xmm1, dword [Scores_Pieces+rcx+8*r9]
		     vpaddw   xmm0, xmm0, xmm1
			jmp   .SpecialRet



		      align   8
.EpCapture:
	; remove pawn r10^8 on sqare ecx=r9+8*(2*esi-1)
			lea   ecx, [2*rsi-1]
			lea   ecx, [r9+8*rcx]
			xor   r10, 8
			xor   esi, 1
			mov   rdx, qword [rbp+Pos.typeBB+8*Pawn]
			mov   rdi, qword [rbp+Pos.typeBB+8*rsi]
			btr   rdx, rcx
			btr   rdi, rcx
			mov   qword [rbp+Pos.typeBB+8*Pawn], rdx
			mov   qword [rbp+Pos.typeBB+8*rsi], rdi
			mov   byte [rbp+Pos.board+rcx], 0
			and   rdi, rdx
		     popcnt   rdi, rdi, rdx
			shl   r10d, 6+3
			mov   rdx, qword [Zobrist_Pieces+r10+8*rcx]
			xor   r15, rdx
			xor   r14, rdx
			xor   r13, qword [Zobrist_Pieces+r10+8*rdi]
		      vmovq   xmm1, qword [Scores_Pieces+r10+8*rcx]
		     vpsubw   xmm0, xmm0, xmm1
			xor   esi, 1
			jmp   .SpecialRet


