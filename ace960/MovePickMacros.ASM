
macro apply_bonus address, bonus32, absbonus, denominator {
		mov   eax, dword[address]
	       imul   eax, absbonus
		cdq
		mov   ecx, denominator
	       idiv   ecx
		add   eax, bonus32
		mov   dword[address], eax
}



macro GetNextMove {
	; r14 and r15 are clobbered
		mov   rdx, qword[rsi+Pick.stage]
		mov   r14, qword[rsi+Pick.cur]
		mov   r15, qword[rsi+Pick.endMoves]
	       push   rdi r12 r13
	       call   rdx
		mov   qword[rsi+Pick.cur], r14
		mov   qword[rsi+Pick.endMoves], r15
		pop   r13 r12 rdi
		mov   qword[rsi+Pick.stage], rdx
}


macro InsertionSort begin, end, p, q {
local .Outer, .Inner, .InnerDone, .OuterDone
		lea   p, [begin+8]
		cmp   p, end
		jae   .OuterDone
.Outer:
		mov   rax, qword[p]
		mov   edx, dword[p+4]
		mov   q, p

		cmp   q, begin
		jbe   .InnerDone
		mov   rcx, qword[q-8+0]
		cmp   edx, dword[q-8+4]
		jle   .InnerDone
 .Inner:
		mov   qword [q], rcx
		sub   q, 8

		cmp   q, begin
		jbe   .InnerDone
		mov   rcx, qword[q-8+0]
		cmp   edx, dword[q-8+4]
		 jg   .Inner
 .InnerDone:
		mov   qword[q], rax
		add   p, 8
		cmp   p, end
		 jb   .Outer
.OuterDone:

}


macro Partition  cur, ender {

; at return cur point to start of elements that are <=0

local ._048, ._049, ._050, ._051, .Done
		cmp	cur, ender
		lea	cur, [cur+8]
		je	.Done
._048:		mov	eax, dword [cur-4]
		lea	rcx, [cur-8]
		test	eax, eax
		jg	._051
		mov	eax, dword [ender-4]
		lea	ender, [ender-8]
		cmp	ender, rcx
		jz	.Done
		test	eax, eax
		jg	._050
._049:		sub	ender, 8
		cmp	ender, rcx
		jz	.Done
		mov	eax, dword [ender+4]
		test	eax, eax
		jle	._049
._050:		mov	rdx, qword [cur-8]
		mov	rcx, qword [ender]
		mov	qword [cur-8], rcx
		mov	qword [ender], rdx
._051:		cmp	ender, cur
		lea	cur, [cur+8]
		jnz	._048

.Done:

}




macro PickBest	beg, start, ender {
local .Next, .Done
		mov   eax, dword[beg+0]
		mov   ecx, dword[beg+4]
		mov   rdx, beg
		add   beg, 8
		mov   start, beg
		cmp   beg, ender
		jae   .Done
.Next:
		mov   eax, dword[start+4]
		cmp   eax, ecx
	      cmovg   rdx, start
	      cmovg   ecx, eax
		add   start, 8
		cmp   start, ender
		 jb   .Next
		mov   rax, qword[rdx]
		mov   rcx, qword[beg-8]
		mov   qword[rdx], rcx
		mov   qword[beg-8], rax
.Done:

}



; use assembler to set mask of bits used in see sign
SeeSignBitMask = 0

_from = 0
while _from < 8
 _to = 0
 while _to < 8

   _fromvalue = 0
   if Pawn <= _from & _from <= Queen
    _fromvalue = _from
   end if

   _tovalue = 0
   if Pawn <= _to & _to <= Queen
    _tovalue = _to
   end if

   if _fromvalue > _tovalue
    SeeSignBitMask = SeeSignBitMask or (1 shl (_from+8*_to))
   end if

  _to = _to+1
 end while
 _from = _from+1
end while



macro SeeSign JmpTo {
local .Positive
	; ecx move (preserved)

		mov   r8d, ecx
		shr   r8d, 6
		and   r8d, 63	; r8d = from
		mov   r9d, ecx
		and   r9d, 63	; r9d = to
	      movzx   r10d, byte [rbp+Pos.board+r8]	; r10 = FROM PIECE
	      movzx   r11d, byte [rbp+Pos.board+r9]	; r11 = TO PIECE
		mov   r8, SeeSignBitMask
		and   r10d, 7
		and   r11d, 7
		lea   r10d, [r10+8*r11]
		mov   eax, VALUE_KNOWN_WIN
		 bt   r8, r10
if JmpTo eq
		jnc   .Positive
else
		jnc   JmpTo
end if
	       call   See
.Positive:
}


macro ScoreCaptures start, ender {
local ..WhileLoop, ..Done

	       imul   ecx, dword[rbp+Pos.sideToMove], 7
		cmp   start, ender
		jae   ..Done
..WhileLoop:
		mov   eax, dword[start+ExtMove.move]
		and   eax, 63
		lea   start, [start+sizeof.ExtMove]
	      movzx   edx, byte[rbp+Pos.board+rax]
		mov   edx, dword[PieceValue_MG+4*rdx]
		shr   eax, 3
		xor   eax, ecx
	       imul   eax, eax, 200
		sub   edx, eax
		mov   dword[start-sizeof.ExtMove+ExtMove.score], edx
		cmp   start, ender
		 jb   ..WhileLoop
..Done:
}



macro ScoreQuiets start, ender {
local ..Loop, ..Done

		mov   r8, [rbp+Pos.history]
		mov   r9, [rbx-1*sizeof.State+State.counterMoves]
		mov   r10, [rbx-2*sizeof.State+State.counterMoves]
		mov   r11, [rbx-4*sizeof.State+State.counterMoves]
		lea   rax, [CounterMoveHistory]
	       test   r9, r9
	      cmovz   r9, rax
	       test   r10, r10
	      cmovz   r10, rax
	       test   r11, r11
	      cmovz   r11, rax
		cmp   start, ender
		jae   ..Done
..Loop:
		mov   ecx, dword[start+ExtMove.move]
		mov   edx, ecx
		shr   edx, 6
		lea   start, [start+sizeof.ExtMove]
		and   ecx, 63
		and   edx, 63
	      movzx   edx, [rbp+Pos.board+rdx]
		shl   edx, 6
		add   edx, ecx
		mov   eax, dword[r8+4*rdx]
		add   eax, dword[r9+4*rdx]
		add   eax, dword[r10+4*rdx]
		add   eax, dword[r11+4*rdx]
		mov   dword[start-1*sizeof.ExtMove+ExtMove.score], eax
		cmp   start, ender
		 jb   ..Loop
..Done:

}


macro ScoreEvasions start, ender {
local .ok, .WhileLoop, .normal, .special, .Done, .Positive, .Capture, .Negative

		mov   rdi, qword[rbp+Pos.history]
		cmp   start, ender
		jae   .Done
.WhileLoop:
		mov   ecx, [start]
		lea   start, [start+sizeof.ExtMove]
	    SeeSign   .Positive
	       test   eax, eax
		 js   .Negative
 .Positive:
		mov   r8d, ecx
		shr   r8d, 6
		mov   r10d, ecx
		and   r8d, 63
		and   ecx, 63
	      movzx   r11d, byte [rbp+Pos.board+rcx]	 ; r11 = to piece
	      movzx   edx, byte [rbp+Pos.board+r8]	 ; edx = from piece
		lea   rcx, [rdi+4*rcx]
		cmp   r10d, MOVE_TYPE_CASTLE shl 12
		jae   .special
	       test   r11d, r11d
		jnz   .Capture
 .normal:
		shl   edx, 8
		mov   eax, dword[rdx+rcx]
		mov   dword[start-1*sizeof.ExtMove+ExtMove.score], eax
		cmp   start, ender
		 jb   .WhileLoop
		jmp   .Done
 .Capture:
		mov   eax, dword[PieceValue_MG+4*r11]
 .captureEP:
		and   edx, 7
		sub   eax, edx
		add   eax, HistoryStats_Max
		mov   dword[start-1*sizeof.ExtMove+ExtMove.score], eax
		cmp   start, ender
		 jb   .WhileLoop
		jmp   .Done

 .special:
		cmp   r10d, MOVE_TYPE_EPCAP shl 12
		 jb   .normal ; castling
		mov   eax, PAWN_VALUE_MG
		jmp   .captureEP

 .Negative:
		sub   eax, HistoryStats_Max
		mov   dword[start-1*sizeof.ExtMove+ExtMove.score], eax
		cmp   start, ender
		 jb   .WhileLoop
.Done:



}




