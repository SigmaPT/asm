; see Endgame_Init.asm for how these functions work
; summary: these functions get strong side in ecx




	      align   16
EndgameEval_KXK:
	; Mate with KX vs K. This function is used to evaluate positions with
	; king and plenty of material vs a lone king. It simply gives the
	; attacking side a bonus for driving the defending king towards the edge
	; of the board, and for keeping the distance between the two kings small.
	       push   r15 r14 rdi rsi
		mov   esi, ecx

match =1, DEBUG {
	       push   rdx rcx
		xor   ecx, 1
	     popcnt   rax, qword[rbp+Pos.typeBB+8*rcx], rdx
	     Assert   e, eax, 1, 'weak pieces in EndgameEval_KXK'
		pop   rcx rdx
}


match =1, VERBOSE {
	       push   rcx rcx
	       push   rdi
		lea   rdi, [VerboseOutput]
	     szcall   PrintString, 'EndgameEval_KXK'
	       call   Position_PrintSmall
		lea   rcx, [VerboseOutput]
	       call   _WriteOut
		pop   rdi
		pop   rcx rcx
}

	; r15 = strong pieces
		mov   rdi, qword[rbp+Pos.typeBB+8*King]
		mov   r14, rdi
		xor   ecx, 1
		and   rdi, qword[rbp+Pos.typeBB+8*rcx]
		bsf   rdi, rdi
	; rdi = weak ksq
		and   r14, qword[rbp+Pos.typeBB+8*rsi]
		bsf   r14, r14
	; r14 = strong ksq
		cmp   esi, dword[rbp+Pos.sideToMove]
		 je   .CheckStalemate
.NotStalemate:
		mov   r8, qword[rbp+Pos.typeBB+8*Rook]
		 or   r8, qword[rbp+Pos.typeBB+8*Queen]
		mov   r9, qword[rbp+Pos.typeBB+8*Bishop]
		mov   r10, qword[rbp+Pos.typeBB+8*Knight]
		shl   r14d, 6
	      movzx   eax, word[rbx+State.npMaterial]
	      movzx   edx, byte[PushToEdges+1*rdi]
	      movzx   edi, byte[SquareDistance+r14+1*rdi]
	      movzx   edi, byte[PushClose+1*rdi]
		add   edi, edx
	     popcnt   rcx, qword[rbp+Pos.typeBB+8*Pawn], rdx
	       imul   ecx, PawnValueEg
		add   eax, ecx
		add   eax, edi

		mov   rcx, LightSquares
		mov   rdx, DarkSquares
		mov   edi, VALUE_MATE_IN_MAX_PLY - 1
		xor   esi, dword[rbp+Pos.sideToMove]
		neg   esi

	       test   r8, r8
		jnz   .Winning
	       test   r9, r9
		 jz   .Drawish
	       test   r10, r10
		jnz   .Winning
		and   rcx, r9
		 jz   .Drawish
		and   rdx, r9
		 jz   .Drawish
.Winning:
		add   eax, VALUE_KNOWN_WIN
		cmp   eax, edi
	      cmovg   eax, edi
.Drawish:
		xor   eax, esi
		sub   eax, esi
VerboseDisplay db 'eval: '
VerboseDisplayInt rax
		pop   rsi rdi r14 r15
		ret


.CheckStalemate:
		mov   r15, qword[KingAttacks+8*rdi]
 .NextSquare:
		mov   ecx, esi
		bsf   rdx, r15
	       call   AttackersTo_Side
	       test   rax, rax
		 jz   .NotStalemate
	       blsr   r15, r15, rcx
		jnz   .NextSquare
		xor   eax, eax
VerboseDisplay db 'eval: '
VerboseDisplayInt rax
		pop   rsi rdi r14 r15
		ret




	      align   16
EndgameEval_KBNK:
	; Mate with KBN vs K. This is similar to KX vs K, but we have to drive the
	; defending king towards a corner square of the right color.

		mov   rax, LightSquares
		and   rax, qword[rbp+Pos.typeBB+8*Bishop]
		mov   rdx, qword[rbp+Pos.typeBB+8*King]
		mov   r10, qword[rbp+Pos.typeBB+8*rcx]
		xor   ecx, 1
		mov   r11, qword[rbp+Pos.typeBB+8*rcx]
		and   r10, rdx
		and   r11, rdx
		bsf   r10, r10	 ; strong ksq
		bsf   r11, r11	 ; weak ksq

		neg   rax
		sbb   eax, eax
		and   eax, 0111000b
		xor   r10d, eax
		xor   r11d, eax

		shl   r10, 6
	      movzx   edx, byte[SquareDistance+r10+r11]
	      movzx   edx, byte[PushClose+rdx]
	      movzx   eax, byte[PushToCorners+r11]
		add   eax, VALUE_KNOWN_WIN
		add   eax, edx

		xor   ecx, dword[rbp+Pos.sideToMove]
		sub   ecx, 1
		xor   eax, ecx
		sub   eax, ecx
		ret




	      align   16
EndgameEval_KPK:
	; KP vs K. This endgame is evaluated with the help of a bitbase.

match =1, DEBUG {
	       push   rdx rcx
	     Assert   e, qword[rbp+Pos.typeBB+8*Knight], 0, 'knight(s) in EndgameEval_KPK'
	     Assert   e, qword[rbp+Pos.typeBB+8*Bishop], 0, 'bishop(s) in EndgameEval_KPK'
	     Assert   e, qword[rbp+Pos.typeBB+8*Rook], 0,   'rook(s) in EndgameEval_KPK'
	     Assert   e, qword[rbp+Pos.typeBB+8*Queen], 0,  'queen(s) in EndgameEval_KPK'
		xor   ecx, 1
		mov   rax, qword[rbp+Pos.typeBB+8*Pawn]
		and   rax, qword[rbp+Pos.typeBB+8*rcx]
	     Assert   e, rax, 0,  'weak pawn(s) in EndgameEval_KPK'
		xor   ecx, 1
		mov   rax, qword[rbp+Pos.typeBB+8*Pawn]
		and   rax, qword[rbp+Pos.typeBB+8*rcx]
	     popcnt   rax, rax, rdx
	     Assert   e, eax, 1,  'the number of strong pawns != 1 in EndgameEval_KPK'
		pop   rcx rdx
}

match =1, VERBOSE {
	       push   rcx rcx
	       push   rdi
		lea   rdi, [VerboseOutput]
	       call   Position_PrintSmall
		lea   rcx, [VerboseOutput]
	       call   _WriteOut
		pop   rdi
		pop   rcx rcx
}

		mov   rdx, qword[rbp+Pos.typeBB+8*rcx]
		mov   r9, qword[rbp+Pos.typeBB+8*King]
		mov   r8, qword[rbp+Pos.typeBB+8*Pawn]
	; rdx = strong pieces

		xor   ecx, 1
	; ecx = weak side
		mov   r10, qword[rbp+Pos.typeBB+8*rcx]
	; r10 = weak pieces  should be the long king

		and   r8, rdx
		bsf   r8, r8
	; r8d = strong pawn

		and   r9, rdx
		bsf   r9, r9
	; r9d = strong king

		bsf   r10, r10
	; r10d = weak king


	; if black is the strong side, flip pieces along horizontal axis
		lea   eax, [rcx-1]
		and   eax, 0111000b
	; if weak king is on right side of board, flip pieces along vertical axis
		 bt   r10d, 2
		sbb   edx, edx
		and   edx, 0000111b
	; do the flip
		xor   eax, edx
		xor   r8d, eax
		xor   r9d, eax
		xor   r10d, eax

	; look up entry
		mov   eax, r8d
		shl   r8, 6
		lea   r11, [r8+r9]
		mov   r11, qword[KPKEndgameTable+8*(r11-8*64)]

	; figure out which bit to test
	; bit 2 of weak king should now be 0, so fill it with the correct side
		xor   ecx, dword[rbp+Pos.sideToMove]
		lea   edx, [r10+4*rcx]

		sub   ecx, 1
		shr   eax, 3
		add   eax, VALUE_KNOWN_WIN + PawnValueEg
		xor   eax, ecx
		sub   eax, ecx
	; eax = score if win

		 bt   r11, rdx
		sbb   edx, edx
		and   eax, edx

VerboseDisplay db 'eval: '
VerboseDisplayInt rax
		ret





	      align   16
EndgameEval_KRKP:
	; KR vs KP. This is a somewhat tricky endgame to evaluate precisely without
	; a bitbase. The function below returns drawish scores when the pawn is
	; far advanced with support of the king, while the attacking king is far
	; away.

	       push   rsi
		mov   r8, qword[rbp+Pos.typeBB+8*rcx]
		mov   esi, ecx
		xor   ecx, 1
		xor   esi, dword[rbp+Pos.sideToMove]	; esi = pos.side_to_move() == weakSide
		mov   r9, qword[rbp+Pos.typeBB+8*rcx]
		and   r8, qword[rbp+Pos.typeBB+8*King]
		and   r9, qword[rbp+Pos.typeBB+8*King]
		mov   r10, qword[rbp+Pos.typeBB+8*Rook]
		mov   r11, qword[rbp+Pos.typeBB+8*Pawn]
		bsf   r8, r8
		bsf   r9, r9
		bsf   r10, r10
		bsf   r11, r11
	       imul   ecx, 56
		xor   r8d, ecx
		xor   r9d, ecx
		xor   r10d, ecx
		xor   r11d, ecx

.wksq equ r8
.bksq equ r9
.rsq equ r10
.psq equ r11
.wksq_d equ r8d
.bksq_d equ r9d
.rsq_d equ r10d
.psq_d equ r11d

	; If the stronger side's king is in front of the pawn, it's a win
		lea   rax, [8*.wksq]
	      movzx   eax, byte[SquareDistance+8*rax+.psq]
		sub   eax, RookValueEg
		mov   ecx, .wksq_d
		mov   edx, .psq_d
		and   ecx, 7
		and   edx, 7
		sub   ecx, edx
		mov   edx, .psq_d
		sub   edx, .wksq_d
		sar   edx, 31
		 or   ecx, edx
		 jz   .Return

	; If the weaker side's king is too far from the pawn and the rook,
	; it's a win.
		shl   .bksq_d, 6
	      movzx   ecx, byte[SquareDistance+.bksq+.psq]
		sub   ecx, 3
		sub   ecx, esi
	      movzx   edx, byte[SquareDistance+.bksq+.rsq]
		sub   edx, 3
		 or   ecx, edx
		jns   .Return

	; If the pawn is far advanced and supported by the defending king,
	; the position is drawish
		mov   ecx, esi
		xor   ecx, 1
		add   ecx, 2
		sub   ecx, eax
		lea   rax, [8*rax-80]
	      movzx   edx, byte[SquareDistance+.bksq+.psq]
		sub   edx, 2
		and   ecx, edx
		mov   edx, .wksq_d
		shr   edx, 3
		sub   edx, 3
		neg   edx
		and   ecx, edx
		mov   edx, .bksq_d
		shr   edx, 6+3
		sub   edx, 4
		and   ecx, edx
		 js   .Return

	; If the pawn is far advanced and supported by the defending king,
	; the position is drawish
		shl   .wksq_d, 6
		mov   ecx, .psq_d
		and   ecx, 0111b
		shl   ecx, 6
	      movzx   edx, byte[SquareDistance+.bksq+.psq+DELTA_S]
	      movzx   eax, byte[SquareDistance+.wksq+.psq+DELTA_S]
	      movzx   ecx, byte[SquareDistance+rcx+.psq]
		sub   eax, edx
		sub   eax, ecx
		lea   eax, [8*rax-200]

.Return:
		sub   esi, 1
		xor   eax, esi
		sub   eax, esi
		pop   rsi
		ret






	      align   16
EndgameEval_KRKB:
	; KR vs KB. This is very simple, and always returns drawish scores.  The
	; score is slightly bigger when the defending king is close to the edge.

		mov   rax, qword[rbp+Pos.typeBB+8*King]
		xor   ecx, 1
		and   rax, qword[rbp+Pos.typeBB+8*rcx]
		bsf   rax, rax

	      movzx   eax, byte[PushToEdges+rax]

		xor   ecx, dword[rbp+Pos.sideToMove]
		sub   ecx, 1
		xor   eax, ecx
		sub   eax, ecx
		ret




	      align   16
EndgameEval_KRKN:
	; KR vs KN. The attacking side has slightly better winning chances than
	; in KR vs KB, particularly if the king and the knight are far apart.

		mov   r8, qword[rbp+Pos.typeBB+8*Knight]
		mov   r9, qword[rbp+Pos.typeBB+8*King]
		xor   ecx, 1
		and   r9, qword[rbp+Pos.typeBB+8*rcx]
		bsf   r8, r8
		bsf   r9, r9
		shl   r8, 6

	      movzx   eax, byte[SquareDistance+r8+r9]
	      movzx   eax, byte[PushAway+rax]
	      movzx   edx, byte[PushToEdges+r9]
		add   eax, edx

		xor   ecx, dword[rbp+Pos.sideToMove]
		sub   ecx, 1
		xor   eax, ecx
		sub   eax, ecx
		ret







	      align   16
EndgameEval_KQKP:
	; KQ vs KP. In general, this is a win for the stronger side, but there are a
	; few important exceptions. A pawn on 7th rank and on the A,C,F or H files
	; with a king positioned next to it can be a draw, so in that case, we only
	; use the distance between the kings.

		mov   r8, qword[rbp+Pos.typeBB+8*Pawn]
		mov   rdx, qword[rbp+Pos.typeBB+8*King]
		mov   r10, qword[rbp+Pos.typeBB+8*rcx]
		xor   ecx, 1
		mov   r11, qword[rbp+Pos.typeBB+8*rcx]

		and   r10, rdx
		and   r11, rdx
		bsf   r10, r10	 ; strong ksq
		bsf   r11, r11	 ; weak ksq
		bsf   rdx, r8	 ; weak pawn sq
		shl   r11, 6
		lea   r9d, [1+5*rcx]  ; strong 7th rank

		mov   rax, FileABB or FileCBB or FileFBB or FileHBB
		and   r8, rax
		cmp   r8, 1
		sub   r8d, r8d
	      movzx   eax, byte[SquareDistance+r11+rdx]
		sub   eax, 1
		 or   eax, r8d
		shr   edx, 3
		xor   edx, r9d
		 or   eax, edx
		neg   eax
		sbb   eax, eax
		and   eax, QueenValueEg - PawnValueEg
	      movzx   edx, byte[SquareDistance+r11+r10]
	      movzx   edx, byte[PushClose+rdx]
		add   eax, edx

		xor   ecx, dword[rbp+Pos.sideToMove]
		sub   ecx, 1
		xor   eax, ecx
		sub   eax, ecx
		ret







	      align   16
EndgameEval_KQKR:
	; KQ vs KR.  This is almost identical to KX vs K:  We give the attacking
	; king a bonus for having the kings close together, and for forcing the
	; defending king towards the edge. If we also take care to avoid null move for
	; the defending side in the search, this is usually sufficient to win KQ vs KR.

		mov   rdx, qword[rbp+Pos.typeBB+8*King]
		mov   r10, qword[rbp+Pos.typeBB+8*rcx]
		xor   ecx, 1
		mov   r11, qword[rbp+Pos.typeBB+8*rcx]
		and   r10, rdx
		and   r11, rdx
		bsf   r10, r10	 ; strong ksq
		bsf   r11, r11	 ; weak ksq

		shl   r10, 6
	      movzx   edx, byte[SquareDistance+r10+r11]
	      movzx   edx, byte[PushClose+rdx]
	      movzx   eax, byte[PushToEdges+r11]
		add   eax, QueenValueEg - RookValueEg
		add   eax, edx

		xor   ecx, dword[rbp+Pos.sideToMove]
		sub   ecx, 1
		xor   eax, ecx
		sub   eax, ecx
		ret







	      align   16
EndgameEval_KNNK:
	; Some cases of trivial draws
		xor   eax, eax
		ret








EndgameScale_KNPK:
		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess
.errorstring: db 'EndgameScale_KNPK not implemented'


EndgameScale_KNPKB:
		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess
.errorstring: db 'EndgameScale_KNPKB not implemented'


EndgameScale_KRPKR:
		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess
.errorstring: db 'EndgameScale_KRPKR not implemented'


EndgameScale_KRPKB:
		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess
.errorstring: db 'EndgameScale_KRPKB not implemented'


EndgameScale_KBPKB:
		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess
.errorstring: db 'EndgameScale_KBPKB not implemented'


EndgameScale_KBPKN:
		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess
.errorstring: db 'EndgameScale_KBPKN not implemented'


EndgameScale_KBPPKB:
		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess
.errorstring: db 'EndgameScale_KBPPKB not implemented'


EndgameScale_KRPPKRP:
		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess
.errorstring: db 'EndgameScale_KRPPKRP not implemented'


EndgameScale_KBPsKs:
		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess
.errorstring: db 'EndgameScale_KBPsKs not implemented'


EndgameScale_KQKRPs:
		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess
.errorstring: db 'EndgameScale_KQKRPs not implemented'


EndgameScale_KPsK:
		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess
.errorstring: db 'EndgameScale_KPsK not implemented'


EndgameScale_KPKP:
		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess
.errorstring: db 'EndgameScale_KPKP not implemented'


