



BitTable_Init:
		       push  rbx rsi rdi r12 r13 r14 r15

			mov   ecx, 64*64*2*64
		       call   _VirtualAlloc
		       push   rax


Init_KPKEndgameTable:

tn equ r15
wp equ r14
wk equ r13
bk equ r12
un equ r11
u  equ r10
to equ r9
cnt equ rsi
ocnt equ rdi

macro KPKEndgameTableOffset res,TN,WP,WK,BK {
			mov   res, WP
			shl   res, 6
			add   res, WK
			shl   res, 6
			add   res, BK
			shl   res, 1
			add   res, TN
			add   res, qword[rsp]
}

		; KPKEndgameTable[WhitePawn-8][WhiteKing] is a qword
		;  bit 2*BlackKing+0 is set if win for white to move
		;  bit 2*BlackKing+1 is set if win for black to move

		; use hash table for uncompressed data
			mov   rdi, qword[rsp]
			mov   ecx, (64*64*2*64)/8
			xor   eax, eax
		  rep stosq
		; clear space for compressed data
			lea  rdi, [KPKEndgameTable]
			mov  ecx, 48*64
			xor  eax, eax
		  rep stosq

			xor   cnt, cnt
			lea   ocnt, [cnt+1]
.Start:
			cmp   cnt, ocnt
			 je   .End
			mov   ocnt, cnt
			xor   cnt, cnt

			xor   tn, tn
    .TurnLoop:		xor   wp, wp
     .WhitePawnLoop:	xor   wk, wk
      .WhiteKingLoop:	xor   bk, bk
       .BlackKingLoop:

      KPKEndgameTableOffset   rbx, tn, wp, wk, bk
			cmp   byte[rbx], 0
			jne   .Continue
			add   cnt, 1
			cmp   wp, 8
			 jb   .Draw
			cmp   wp, 56
			jae   .Draw
			cmp   wp, wk
			 je   .Draw
			cmp   wk, bk
			 je   .Draw
			cmp   bk, wp
			 je   .Draw

		; is white pawn attacking black king ?
			 bt   qword[WhitePawnAttacks+8*wp], bk
			jnc   .CheckTurn
		; is it white's turn ?
			cmp   tn,0
			 je   .Draw
		; it is blacks turn - can black king leagally capture pawn ?
			 bt   qword[KingAttacks+8*wk], wp
			jnc   .Draw

	   .CheckTurn:	xor   un, un
			cmp   tn, 0
			 je   .WhiteToMove



    .BlackToMove:	mov   rax, qword[KingAttacks+8*bk]
			bts   rax, bk
			mov   u, qword[KingAttacks+8*wk]
			bts   u, wk
			 or   u, qword[WhitePawnAttacks+8*wp]
		       andn   u, u, rax
			bsf   to, u
			 jz   .Draw
  .BlackMoveLoop:	xor   tn, 1
      KPKEndgameTableOffset   rcx, tn, wp, wk, to
			xor   tn, 1
		       blsr   u, u, r8
			cmp   byte[rcx], 1
			 je   .Draw
			adc   un, 0
			bsf   to, u
			jnz   .BlackMoveLoop
		       test   un, un
			 jz   .Win
			jmp   .Continue



    .WhiteToMove:
			mov   rax, qword[KingAttacks+8*wk]
			bts   rax, wk
			mov   u, qword[KingAttacks+8*bk]
			bts   u, bk
			bts   u, wp
		       andn   u, u, rax
			bsf   to, u
			 jz   .WhiteMoveLoopDone
    .WhiteMoveLoop:	xor   tn, 1
      KPKEndgameTableOffset   rcx, tn, wp, to, bk
			xor   tn, 1
		       blsr   u, u, r8
			cmp   byte[rcx], 1
			 ja   .Win
			adc   un, 0
			bsf   to, u
			jnz   .WhiteMoveLoop
    .WhiteMoveLoopDone:
			lea   to, [wp-8]
			cmp   to, wk
			 je   .WhiteMoveDone
			cmp   to, bk
			 je   .WhiteMoveDone
			cmp   to, 8
			 jb   .PromCheck

			xor   tn, 1
      KPKEndgameTableOffset   rcx,tn,to,wk,bk
			xor   tn, 1
			cmp   byte[rcx], 1
			 ja   .Win
			adc   un, 0
			cmp   to, 48
			 jb   .WhiteMoveDone
	.DoubleCheck:
			sub   to, 8
			cmp   to, wk
			 je   .WhiteMoveDone
			cmp   to, bk
			 je   .WhiteMoveDone

			xor   tn, 1
      KPKEndgameTableOffset   rcx, tn, to, wk, bk
			xor   tn, 1
			cmp   byte[rcx], 1
			 ja   .Win
			adc   un, 0
			jmp   .WhiteMoveDone

	.PromCheck:	 bt   qword[KingAttacks+8*to], bk
			jnc   .Win
			 bt   qword[KingAttacks+8*to], wk
			 jc   .Win

    .WhiteMoveDone:    test   un, un
			jnz   .Continue
    .Draw:		mov   byte[rbx], 1
			jmp   .Continue
    .Win:
		   ; record the win in uncompressed table
			mov   byte[rbx], 2
		   ; record the win in compressed table
			cmp   wp, 8
			 jb   .Continue
			cmp   wp, 56
			jae   .Continue
			mov   rax, bk
			mov   rcx, bk
			and   eax, 00111b
			cmp   eax, 4
			jae   .Continue
			and   ecx, 0111000b
			lea   eax, [2*rax+tn]
			add   rcx, rax

			lea   rax, [wp-8]
			shl   rax, 6
			add   rax, wk
			bts   qword[KPKEndgameTable+8*rax], rcx

    .Continue:
			add   bk, 1
			cmp   bk, 64
			 jb   .BlackKingLoop
			add   wk, 1
			cmp   wk, 64
			 jb   .WhiteKingLoop
			add   wp, 1
			cmp   wp, 64
			 jb   .WhitePawnLoop
			add   tn, 1
			cmp   tn, 2
			 jb   .TurnLoop

		       test   cnt,cnt
			jnz   .Start

.End:

			pop   rax
		       call   _VirtualFree
			pop   r15 r14 r13 r12 rdi rsi rbx
			ret


















