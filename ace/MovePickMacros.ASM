macro GetNextMove {
	; r14 and r15 are clobbered
			mov   rdx, qword [rsi+Pick.stage]
			mov   r14, qword [rsi+Pick.cur]
			mov   r15, qword [rsi+Pick.end]
		       push   rdi r12 r13
		       call   rdx
			mov   qword [rsi+Pick.cur], r14
			mov   qword [rsi+Pick.end], r15
			pop   r13 r12 rdi
			mov   qword [rsi+Pick.stage], rdx
}



macro InsertionSort begin, end, p, q {
local .Outer, .Inner, .InnerDone, .OuterDone
			lea   p, [begin+8]
			cmp   p, end
			jae   .OuterDone

.Outer:
			mov   rax, qword [p]
			mov   edx, dword [p+4]
			mov   q, p

			cmp   q, begin
			jbe   .InnerDone
			mov   rcx, qword [q-8+0]
			cmp   edx, dword [q-8+4]
			jle   .InnerDone
 .Inner:
			mov   qword [q], rcx
			sub   q, 8

			cmp   q, begin
			jbe   .InnerDone
			mov   rcx, qword [q-8+0]
			cmp   edx, dword [q-8+4]
			 jg   .Inner

 .InnerDone:
			mov   qword [q], rax
			add   p, 8
			cmp   p, end
			 jb   .Outer
.OuterDone:

}


macro Partition  cur, end {

; at return cur point to start of elements that are <=0

local ._048, ._049, ._050, ._051, .Done


	cmp	cur, end
	lea	cur, [cur+8H]
	je	.Done
._048:
	mov	eax, dword [cur-4H]
	lea	rcx, [cur-8H]
	test	eax, eax
	jg	._051
	mov	eax, dword [end-4H]
	lea	end, [end-8H]
	cmp	end, rcx
	jz	.Done
	test	eax, eax
	jg	._050
._049:	sub	end, 8
	cmp	end, rcx
	jz	.Done
	mov	eax, dword [end+4H]
	test	eax, eax
	jle	._049
._050:	mov	rdx, qword [cur-8H]
	mov	rcx, qword [end]
	mov	qword [cur-8H], rcx
	mov	qword [end], rdx
._051:	cmp	end, cur
	lea	cur, [cur+8]
	jnz	._048

.Done:


;.Outer:
;
;                        cmp   first, last
;                        jae   .Inner1Done
;                        cmp   dword [first+4], 0
;                        jle   .Inner1Done
; .Inner1:
;                        add   first, 8
;                        cmp   first, last
;                        jae   .Inner1Done
;                        cmp   dword [first+4], 0
;                         jg   .Inner1
; .Inner1Done:
;                        cmp   first, last
;                        lea   last, [last-8]
;                        jae   .OuterDone
;
;                        cmp   first, last
;                        jae   .Inner2Done
;                        cmp   dword [last+4], 0
;                         jg   .Inner2Done
; .Inner2:
;                        sub   last, 8
;                        cmp   first, last
;                        jae   .Inner2Done
;                        cmp   dword [last+4], 0
;                        jle   .Inner2
; .Inner2Done:
;                        cmp   first, last
;                        jae   .OuterDone
;
;                        mov   rax, qword[first]
;                        mov   rcx, qword[last]
;                        mov   qword[first], rcx
;                        mov   qword[last], rax
;                        add   first, 8
;                        jmp   .Outer
;.OuterDone:

}




macro PickBest	beg, start, end {
local .Next, .Done
			mov   eax, dword [beg+0]
			mov   ecx, dword [beg+4]
			mov   rdx, beg
			add   beg, 8
			mov   start, beg
			cmp   beg, end
			jae   .Done
.Next:
			mov   eax, dword [start+4]
			cmp   eax, ecx
		      cmovg   rdx, start
		      cmovg   ecx, eax
			add   start, 8
			cmp   start, end
			 jb   .Next
			mov   rax, qword [rdx]
			mov   rcx, qword [beg-8]
			mov   qword [rdx], rcx
			mov   qword [beg-8], rax
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


macro ScoreCaptures start, end {
local .WhileLoop, .WhileTest, .Done

			cmp   start, end
			jae   .Done
.WhileLoop:
			mov   eax, dword [start+0]
			lea   start, [start+8]
			mov   edx, eax
			mov   ecx, eax
			shr   eax, 12
			and   edx, 63
			shr   ecx, 6
			and   ecx, 63
		      movzx   edx, byte [rbp+Pos.board+rdx]
		      movzx   ecx, byte [rbp+Pos.board+rcx]
			and   ecx, 7
			sub   ecx, 1   ; match pieces of SF, should have abs no effect
			mov   edx, dword [PieceValue_MG+4*rdx]
			sub   edx, ecx
			add   edx, dword [ScoreCaptures_MoveTypeValues+4*rax]
			mov   dword [start-4], edx
.WhileTest:		cmp   start, end
			 jb   .WhileLoop
.Done:
}



macro ScoreQuiets start, end {
local .WhileLoop, .WhileTest, .Done

			cmp   start, end
			jae   .Done
.WhileLoop:
			mov   eax, dword [start+0]
			lea   start, [start+8]
			mov   edx, eax
			shr   eax, 6
			and   eax, 63
			and   edx, 63
		      movzx   eax, [rbp+Pos.board+rax]
			shl   eax, 8
			lea   rdx, [History+4*rdx]
			mov   eax, [rax+rdx]
			mov   dword [start-4], eax
.WhileTest:
			cmp   start, end
			 jb   .WhileLoop
.Done:


}


macro ScoreEvasions start, end {
local .ok, .WhileLoop, .WhileTest, .Done, .Positive, .Capture, .Negative

;cmp byte[QSearchTesting],0
;je @f
; int3
;@@:


			cmp   start, end
			jae   .Done
.WhileLoop:
			mov   ecx, [start]
			lea   start, [start+8]
		    SeeSign   .Positive
		       test   eax, eax
			 js   .Negative

 .Positive:
			mov   r8d, ecx
			shr   r8d, 6
			mov   r10d, ecx
			shr   r10d, 12
			and   r8d, 63
			and   ecx, 63
		      movzx   r11d, byte [rbp+Pos.board+rcx]	 ; r11 = to piece
		      movzx   edx, byte [rbp+Pos.board+r8]	 ; edx = from piece
			lea   rcx, [History+4*rcx]
			mov   eax, 0;PawnValueMG         ; its ok to fetch 0 from PieceValue_MG instead of PawnValueMG
			cmp   r10d, MOVE_TYPE_EPCAP
			 je   .CaptureEp
		       test   r11d, r11d
			jnz   .Capture

			shl   edx, 8
			mov   eax, dword [rdx+rcx]
			mov   dword [start-4], eax
			cmp   start, end
			 jb   .WhileLoop
			jmp   .Done

 .Capture:		mov   eax, dword [PieceValue_MG+4*r11]
 .CaptureEp:
			and   edx, 7
			sub   edx, 1  ; match piece indicies of SF !!   not really important though
			sub   eax, edx
			add   eax, HistoryStats_Max
			mov   dword [start-4], eax
			cmp   start, end
			 jb   .WhileLoop
			jmp   .Done

 .Negative:
			sub   eax, HistoryStats_Max
			mov   dword [start-4], eax
			cmp   start, end
			 jb   .WhileLoop
			jmp   .Done



.WhileTest:
			cmp   start, end
			 jb   .WhileLoop
.Done:



}




