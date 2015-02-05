Position_Init:

virtual at rsp
  .prng        rb sizeof.Prng
  .lend rb 0
end virtual
.localsize = ((.lend-rsp+15) and (-16))

	       push   rbx rsi rdi
		sub   rsp, .localsize

		mov   qword[.prng+Prng.seed], 1070372

		xor   ebx, ebx
	.l:    imul   esi, ebx, 64*8
		lea   rdi, [Zobrist_Pieces+8*rsi]
		mov   esi, 64*Pawn
	.l0:	lea   rcx, [.prng]
	       call   randi
		mov   qword [rdi+8*(rsi)], rax
		add   esi, 1
		cmp   esi, 64*(King+1)
		 jb   .l0
		add   ebx, 1
		cmp   ebx, 2
		 jb   .l

		lea   rdi, [Zobrist_Ep]
		xor   esi, esi
	.l3:	lea   rcx, [.prng]
	       call   randi
		mov   qword [rdi+8*rsi], rax
		add   esi, 1
		cmp   esi, 8
		 jb   .l3

		lea   rdi, [Zobrist_Castling]
		xor   esi, esi
	.l2:	lea   rcx, [.prng]
	       call   randi
		xor   ebx, ebx
	.l1:	 bt   ebx, esi
		sbb   rcx, rcx
		and   rcx, rax
		xor   qword [rdi+8*rbx], rcx
		add   ebx, 1
		cmp   ebx, 16
		 jb   .l1
		add   esi, 1
		cmp   esi, 4
		 jb   .l2

		lea   rcx, [.prng]
	       call   randi
		mov   qword [Zobrist_side], rax

		lea   rcx, [.prng]
	       call   randi
		mov   qword [Zobrist_exclusion], rax

		lea   rdi, [FileBB]
		mov   rax, FileABB
	      stosq
		shl   rax, 1
	      stosq
		shl   rax, 1
	      stosq
		shl   rax, 1
	      stosq
		shl   rax, 1
	      stosq
		shl   rax, 1
	      stosq
		shl   rax, 1
	      stosq
		shl   rax, 1
	      stosq

		lea   rdi, [CastlingMasks]
		mov   byte [rdi+SQ_A1],00010b
		mov   byte [rdi+SQ_E1],00011b
		mov   byte [rdi+SQ_H1],00001b
		mov   byte [rdi+SQ_A8],01000b
		mov   byte [rdi+SQ_E8],01100b
		mov   byte [rdi+SQ_H8],00100b

		mov   rax, 00FF0000H
		mov   qword [IsPawnMasks+0], rax
		mov   qword [IsPawnMasks+8], rax
		not   rax
		mov   qword [IsNotPawnMasks+0], rax
		mov   qword [IsNotPawnMasks+8], rax
		mov   rax, 00FFH
		mov   qword [IsNotPieceMasks+0], rax
		mov   qword [IsNotPieceMasks+8], rax

		lea   rdi, [PieceValue_MG]
		mov   dword [rdi+4*(Pawn)],	PAWN_VALUE_MG
		mov   dword [rdi+4*(Knight)], KNIGHT_VALUE_MG
		mov   dword [rdi+4*(Bishop)], BISHOP_VALUE_MG
		mov   dword [rdi+4*(Rook)],	ROOK_VALUE_MG
		mov   dword [rdi+4*(Queen)],   QUEEN_VALUE_MG
		lea   rdi, [PieceValue_MG+8*4]
		mov   dword [rdi+4*(Pawn)],	PAWN_VALUE_MG
		mov   dword [rdi+4*(Knight)], KNIGHT_VALUE_MG
		mov   dword [rdi+4*(Bishop)], BISHOP_VALUE_MG
		mov   dword [rdi+4*(Rook)],	ROOK_VALUE_MG
		mov   dword [rdi+4*(Queen)],   QUEEN_VALUE_MG

		lea   rdi, [PieceValue_EG]
		mov   dword [rdi+4*(Pawn)],	PAWN_VALUE_EG
		mov   dword [rdi+4*(Knight)], KNIGHT_VALUE_EG
		mov   dword [rdi+4*(Bishop)], BISHOP_VALUE_EG
		mov   dword [rdi+4*(Rook)],	ROOK_VALUE_EG
		mov   dword [rdi+4*(Queen)],   QUEEN_VALUE_EG
		lea   rdi, [PieceValue_EG+8*4]
		mov   dword [rdi+4*(Pawn)],	PAWN_VALUE_EG
		mov   dword [rdi+4*(Knight)], KNIGHT_VALUE_EG
		mov   dword [rdi+4*(Bishop)], BISHOP_VALUE_EG
		mov   dword [rdi+4*(Rook)],	ROOK_VALUE_EG
		mov   dword [rdi+4*(Queen)],   QUEEN_VALUE_EG

		lea   rdi, [ScoreCaptures_MoveTypeValues]
		mov   dword[rdi+4*MOVE_TYPE_EPCAP], PAWN_VALUE_MG
		mov   dword[rdi+4*(MOVE_TYPE_PROM+0)], KNIGHT_VALUE_MG-PAWN_VALUE_MG
		mov   dword[rdi+4*(MOVE_TYPE_PROM+1)], BISHOP_VALUE_MG-PAWN_VALUE_MG
		mov   dword[rdi+4*(MOVE_TYPE_PROM+2)],	 ROOK_VALUE_MG-PAWN_VALUE_MG
		mov   dword[rdi+4*(MOVE_TYPE_PROM+3)],	QUEEN_VALUE_MG-PAWN_VALUE_MG

		lea   rdi, [Scores_Pieces]
		lea   rbx, [PSQR]
		mov   esi, 64*Pawn
	.l4:
		mov   ecx, esi
		shr   ecx, 6

		mov   eax, dword[PieceValue_EG+4*rcx]
		mov   edx, dword[PieceValue_MG+4*rcx]
		shl   eax, 16
		 or   eax, edx

		cmp   ecx, Pawn
		 ja   @f
		xor   edx, edx
		@@:

	      vmovd   xmm0, eax
	      vmovd   xmm1, dword[rbx+4*rsi]
	     vpaddw   xmm0, xmm0, xmm1
	      vmovd   dword [rdi+8*rsi+0], xmm0
		mov   dword [rdi+8*rsi+4], edx

	      vpxor   xmm1, xmm1, xmm1
	     vpsubw   xmm1, xmm1, xmm0
		mov   r8d, esi
		xor   r8d, 0111000b
		add   r8d, 64*8
		shl   edx, 16
	      vmovd   dword [rdi+8*r8+0], xmm1
		mov   dword [rdi+8*r8+4], edx

		add   esi, 1
		cmp   esi, 64*(King+1)
		 jb   .l4

      .Return:
		add   rsp, .localsize
		pop   rdi rsi rbx
		ret
