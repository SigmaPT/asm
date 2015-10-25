

Interrupt:  int3
	    int3
	    int3



GoDirection:	; in: ebx square
		;     cl  x coord
		;     ch  y coord
		; out: eax square ebx + (x,y) or 64 if rbx + (x,y) is off board

		       call  SquareToXY
			add  al,cl
			 js  .Fail
			cmp  al,8
			jae  .Fail
			add  ah,ch
			 js  .Fail
			cmp  ah,8
			jae  .Fail
			mov  ecx,7
			and  ecx,eax
			shr  eax,5
			 or  eax,ecx
			ret
	     .Fail:	mov  eax,64
			ret

SquareToXY:	; in: rbx square
		; out: al  x coord
		;      ah  y coord
			xor  eax,eax
			mov  al,bl
			and  al,7
			mov  ah,bl
			shr  ah,3
			ret




InitializeMoveGeneration:
		       push  r15 r14 r13 r12


;for rook/bishop attacks the PDEP bitboard for a square s consists of all squares
;         that are attacked by a rook/bishop on square s on an otherwise empty board
;for rook/bishop attacks the PEXT bitboard, which is a subset of the PDEP bitboard, consists of those squares
;         that are necessary in determining which squares are actually attacked by a rook/bishop on square s on a non-empty chessboard
;the MASK array contains the actuall bitboards of attacks
; example: B means bishop, X means any piece
;
; suppose that the board is
;
; . . . . . . . .
; . X . . . . . .
; . X . . X . . .
; . X . . . . . .
; . . B . . . . .
; . . . . . . . .
; X X X X X X X X
; . . . . . . . .

; the PDEP bitboard for the bishop's square is
; . . . . . . 1 .
; . . . . . 1 . .
; 1 . . . 1 . . .
; . 1 . 1 . . . .
; . . . . . . . .
; . 1 . 1 . . . .
; 1 . . . 1 . . .
; . . . . . 1 . .

; the boarders are not necessary in determning attack info, so the PEXT bitboard is
; . . . . . . . .
; . . . . . 1 . .
; . . . . 1 . . .
; . 1 . 1 . . . .
; . . . . . . . .
; . 1 . 1 . . . .
; . . . . 1 . . .
; . . . . . . . .

;using the PEXT bitboard as a mask, extracting the bits in the bitboard of all pieces gives
; offset = pext(all pieces,PEXT board) = 1000110b
; this offset is used to lookup a pre-computed bitboard of attacks:
;
; . . . . . . . .
; . . . . . . . .
; . . . . 1 . . .
; . 1 . 1 . . . .
; . . . . . . . .
; . 1 . 1 . . . .
; 1 . . . 1 . . .
; . . . . . . . .
;
; these are the squares that are attacked by the bishop
;
; this bitboard (qword) used to be compressed into a word using pext(attacks,PDEP bitboard)
;   so that the size of the lookup table could be reduced by a factor of four
;   however, this means that a pdep instruction is required to uncompresse the data when computing the attacks squares
;   this slow down is enough to switch back to the uncompressed storage of the attaking data.



if ~(HAVE and HAVE_BMI2)

Init_IMUL_SHIFT:
			lea  rdi,[SlidingAttackMasks]
			mov  ecx,2*107648*4/8
			 or  rax,-1
		  rep stosq

			mov  ecx,64
			lea  rsi,[.RookSHIFT]
			lea  rdi,[RookAttacksSHIFT]
		  rep movsb

			mov  ecx,64
			lea  rsi,[.BishopSHIFT]
			lea  rdi,[BishopAttacksSHIFT]
		  rep movsb

			mov  ecx,64
			lea  rsi,[.RookIMUL]
			lea  rdi,[RookAttacksIMUL]
		  rep movsq

			mov  ecx,64
			lea  rsi,[.BishopIMUL]
			lea  rdi,[BishopAttacksIMUL]
		  rep movsq

			jmp  .Done

.RookSHIFT: db	52, 53, 53, 53, 53, 53, 53, 52, \
		53, 54, 54, 54, 54, 54, 54, 53, \
		53, 54, 54, 54, 54, 54, 54, 53, \
		53, 54, 54, 54, 54, 54, 54, 53, \
		53, 54, 54, 54, 54, 54, 54, 53, \
		53, 54, 54, 54, 54, 54, 54, 53, \
		53, 54, 54, 54, 54, 54, 54, 53, \
		52, 53, 53, 53, 53, 53, 53, 52

.BishopSHIFT: db  58, 59, 59, 59, 59, 59, 59, 58, \
		  59, 59, 59, 59, 59, 59, 59, 59, \
		  59, 59, 57, 57, 57, 57, 59, 59, \
		  59, 59, 57, 55, 55, 57, 59, 59, \
		  59, 59, 57, 55, 55, 57, 59, 59, \
		  59, 59, 57, 57, 57, 57, 59, 59, \
		  59, 59, 59, 59, 59, 59, 59, 59, \
		  58, 59, 59, 59, 59, 59, 59, 58

.BishopIMUL: dq  0x0048610528020080, 0x00c4100212410004, 0x0004180181002010, 0x0004040188108502, 0x0012021008003040, 0x0002900420228000, 0x0080808410c00100, 0x000600410c500622, \
		 0x00c0056084140184, 0x0080608816830050, 0x00a010050200b0c0, 0x0000510400800181, 0x0000431040064009, 0x0000008820890a06, 0x0050028488184008, 0x00214a0104068200, \
		 0x004090100c080081, 0x000a002014012604, 0x0020402409002200, 0x008400c240128100, 0x0001000820084200, 0x0024c02201101144, 0x002401008088a800, 0x0003001045009000, \
		 0x0084200040981549, 0x0001188120080100, 0x0048050048044300, 0x0008080000820012, 0x0001001181004003, 0x0090038000445000, 0x0010820800a21000, 0x0044010108210110, \
		 0x0090241008204e30, 0x000c04204004c305, 0x0080804303300400, 0x00a0020080080080, 0x0000408020220200, 0x0000c08200010100, 0x0010008102022104, 0x0008148118008140, \
		 0x0008080414809028, 0x0005031010004318, 0x0000603048001008, 0x0008012018000100, 0x0000202028802901, 0x004011004b049180, 0x0022240b42081400, 0x00c4840c00400020, \
		 0x0084009219204000, 0x000080c802104000, 0x0002602201100282, 0x0002040821880020, 0x0002014008320080, 0x0002082078208004, 0x0009094800840082, 0x0020080200b1a010, \
		 0x0003440407051000, 0x000000220e100440, 0x00480220a4041204, 0x00c1800011084800, 0x000008021020a200, 0x0000414128092100, 0x0000042002024200, 0x0002081204004200

.RookIMUL: dq  0x00800011400080a6, 0x004000100120004e, 0x0080100008600082, 0x0080080016500080, 0x0080040008000280, 0x0080020005040080, 0x0080108046000100, 0x0080010000204080, \
	       0x0010800424400082, 0x00004002c8201000, 0x000c802000100080, 0x00810010002100b8, 0x00ca808014000800, 0x0002002884900200, 0x0042002148041200, 0x00010000c200a100, \
	       0x00008580004002a0, 0x0020004001403008, 0x0000820020411600, 0x0002120021401a00, 0x0024808044010800, 0x0022008100040080, 0x00004400094a8810, 0x0000020002814c21, \
	       0x0011400280082080, 0x004a050e002080c0, 0x00101103002002c0, 0x0025020900201000, 0x0001001100042800, 0x0002008080022400, 0x000830440021081a, 0x0080004200010084, \
	       0x00008000c9002104, 0x0090400081002900, 0x0080220082004010, 0x0001100101000820, 0x0000080011001500, 0x0010020080800400, 0x0034010224009048, 0x0002208412000841, \
	       0x000040008020800c, 0x001000c460094000, 0x0020006101330040, 0x0000a30010010028, 0x0004080004008080, 0x0024000201004040, 0x0000300802440041, 0x00120400c08a0011, \
	       0x0080006085004100, 0x0028600040100040, 0x00a0082110018080, 0x0010184200221200, 0x0040080005001100, 0x0004200440104801, 0x0080800900220080, 0x000a01140081c200, \
	       0x0080044180110021, 0x0008804001001225, 0x00a00c4020010011, 0x00001000a0050009, 0x0011001800021025, 0x00c9000400620811, 0x0032009001080224, 0x001400810044086a

.Done:

end if


Init_RookAttack_PDEP_PEXT:
			xor  r15d,r15d
	.NextSquare:	mov  ebx,r15d
		       call  SquareToXY
			mov  edx,eax
			xor  r13,r13
			xor  r14d,r14d
	.NextSquare2:	mov  ebx,r14d
		       call  SquareToXY
			cmp  al,dl
			jne  @f
			btc  r13,r14
		  @@:	cmp  ah,dh
			jne  @f
			btc  r13,r14
		  @@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare2
			mov  rax,[BitBoard_Rank1]
			 or  rax,[BitBoard_Rank8]
			 or  rax,[BitBoard_FileA]
			 or  rax,[BitBoard_FileH]
			not  rax
			cmp  dh,0
			jne  @f
			 or  rax,[BitBoard_Rank8]
		  @@:	cmp  dh,7
			jne  @f
			 or  rax,[BitBoard_Rank1]
		  @@:	cmp  dl,0
			jne  @f
			 or  rax,[BitBoard_FileA]
		  @@:	cmp  dl,7
			jne  @f
			 or  rax,[BitBoard_FileH]
		  @@:	and  rax,[BitBoard_Corners]
			and  rax,r13
			mov  qword[RookAttacksPDEP+8*r15],r13
			mov  qword[RookAttacksPEXT+8*r15],rax
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare


Init_BishopAttack_PDEP_PEXT:
			xor  r15d,r15d
	.NextSquare:	mov  ebx,r15d
		       call  SquareToXY
			mov  edx,eax
			xor  r13,r13
			xor  r14d,r14d
	.NextSquare2:	mov  ebx,r14d
		       call  SquareToXY
			mov  cl,dl
			add  cl,dh
			sub  cl,al
			sub  cl,ah
			jnz  @f
			btc  r13,r14
		  @@:	mov  cl,dl
			sub  cl,dh
			sub  cl,al
			add  cl,ah
			jnz  @f
			btc  r13,r14
		  @@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare2
			mov  rax,[BitBoard_Rank1]
			 or  rax,[BitBoard_Rank8]
			 or  rax,[BitBoard_FileA]
			 or  rax,[BitBoard_FileH]
			not  rax
			and  rax,r13
			mov  qword[BishopAttacksPDEP+8*r15],r13
			mov  qword[BishopAttacksPEXT+8*r15],rax
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare



			lea  rdi,[SlidingAttackMasks]  ; rdi will keep track of the addresses
Init_RookAttack_MASK:
			xor  r15d,r15d
	.NextSquare:	mov  dword[RookAttacksMOFF+4*r15],edi
			xor  r14d,r14d
		    _popcnt  rax,qword[RookAttacksPEXT+8*r15],rcx
			xor  r13,r13
			bts  r13,rax
	.NextMask:    _pdep  r12,r14,qword[RookAttacksPEXT+8*r15],rax,rbx,rcx
			xor  r10,r10
			xor  r11d,r11d
	.NextDirection: mov  r9,r15
			 or  r8,-1
			jmp  .Step
	.NextStep:	xor  eax,eax
			bts  rax,r9
			and  rax,r8
			add  r10,rax
			 bt  r12,r9
			sbb  rax,rax
		      _andn  r8,rax,r8
	.Step:		mov  ebx,r9d
		      movzx  rcx,word[.Directions+2*r11]
		       call  GoDirection
			mov  r9d,eax
			cmp  eax,64
			 jb  .NextStep
			add  r11d,1
			cmp  r11d,4
			 jb  .NextDirection

if HAVE and HAVE_BMI2
			mov  rax,r10
		      stosq
else
			mov  rax,r12
		       imul  rax,qword[RookAttacksIMUL+8*r15]
		      movzx  ecx,byte[RookAttacksSHIFT+r15]
			shr  rax,cl
			mov  edx,dword[RookAttacksMOFF+4*r15]
			cmp  qword[rdx+8*rax],-1
			jne  .Error
			mov  qword[rdx+8*rax],r10
			add  rdi,8
end if


			add  r14d,1
			cmp  r14d,r13d
			 jb  .NextMask
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  .Done
    .Directions:    db +1, 0, -1, 0, 0, +1, 0, -1

		     .Error:
		       push  rdi
			lea  rdi,[Output]
			mov  rax,'rook @: '
			mov  eax,r15d
		       call  PrintUnsignedInteger
			mov  ax,', '
		      stosw
			mov  eax,r14d
		       call  PrintUnsignedInteger
			mov  ax,', '
		      stosw
			mov  eax,r13d
		       call  PrintUnsignedInteger
			xor  eax,eax
		      stosd

			lea  rdi,[Output]
		       call  _ErrorBox
		       call  _ExitProcess



	       .Done:

Init_BishopAttack_MASK:
			xor  r15d,r15d
	.NextSquare:	mov  dword[BishopAttacksMOFF+4*r15],edi
			xor  r14d,r14d
		    _popcnt  rax,qword[BishopAttacksPEXT+8*r15],rcx
			xor  r13,r13
			bts  r13,rax
	.NextMask:    _pdep  r12,r14,qword[BishopAttacksPEXT+8*r15],rax,rbx,rcx
			xor  r10,r10
			xor  r11d,r11d
	.NextDirection: mov  r9,r15
			 or  r8,-1
			jmp  .Step
	.NextStep:	xor  eax,eax
			bts  rax,r9
			and  rax,r8
			add  r10,rax
			 bt  r12,r9
			sbb  rax,rax
		      _andn  r8,rax,r8
	.Step:		mov  ebx,r9d
		      movzx  rcx,word[.Directions+2*r11]
		       call  GoDirection
			mov  r9d,eax
			cmp  eax,64
			 jb  .NextStep
			add  r11d,1
			cmp  r11d,4
			 jb  .NextDirection

if HAVE and HAVE_BMI2
			mov  rax,r10
		      stosq
else
			mov  rax,r12
		       imul  rax,qword[BishopAttacksIMUL+8*r15]
		      movzx  ecx,byte[BishopAttacksSHIFT+r15]
			shr  rax,cl
			mov  edx,dword[BishopAttacksMOFF+4*r15]
			cmp  qword[rdx+8*rax],-1
			jne  .Error
			mov  qword[rdx+8*rax],r10
			add  rdi,8
end if

			add  r14d,1
			cmp  r14d,r13d
			 jb  .NextMask
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  .Done
    .Directions:    db +1, +1, -1, +1, +1, -1, -1, -1
		@@:

		     .Error:
		       push  rdi
			lea  rdi,[Output]
			mov  rax,'bishop @'
		      stosq
			mov  ax,': '
		      stosw
			mov  eax,r15d
		       call  PrintUnsignedInteger
			mov  ax,', '
		      stosw
			mov  eax,r14d
		       call  PrintUnsignedInteger
			mov  ax,', '
		      stosw
			mov  eax,r13d
		       call  PrintUnsignedInteger
			xor  eax,eax
		      stosd

			lea  rdi,[Output]
		       call  _ErrorBox
		       call  _ExitProcess



	       .Done:

			cmp  rdi,SlidingAttackMasks+8*107648   ; this should be the size of the table
			 je  @f

			lea  rdi,[.BigSizeError]
		       call  _ErrorBox
		       call  _ExitProcess
		 .BigSizeError: db 'error in calculating slinding attacks',0

		@@:







Init_KnightAttacks:
			xor  r15d,r15d
	.NextSquare:	xor  r14d,r14d
			xor  r13d,r13d
	.NextDirection: mov  ebx,r15d
		      movzx  rcx,word[.Directions+2*r14]
		       call  GoDirection
			cmp  eax,64
			jae  @f
			bts  r13,rax
		@@:	add  r14d,1
			cmp  r14d,8
			 jb  .NextDirection
			mov  qword[KnightAttacks+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db +2,+1, +2,-1, -2,+1, -2,-1, +1,+2, -1,+2, +1,-2, -1,-2
		@@:


Init_KingAttacks:
			xor  r15d,r15d
	.NextSquare:	xor  r14d,r14d
			xor  r13d,r13d
	.NextDirection: mov  ebx,r15d
		      movzx  rcx,word[.Directions+2*r14]
		       call  GoDirection
			cmp  eax,64
			jae  @f
			bts  r13,rax
		@@:	add  r14d,1
			cmp  r14d,8
			 jb  .NextDirection
			mov  qword[KingAttacks+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db +1,+1, +1, 0, +1,-1,  0,+1,  0,-1, -1,+1, -1, 0, -1,-1
		@@:


Init_WhitePawnAttacks:
			xor  r15d,r15d
	.NextSquare:	xor  r14d,r14d
			xor  r13d,r13d
	.NextDirection: mov  ebx,r15d
		      movzx  rcx,word[.Directions+2*r14]
		       call  GoDirection
			cmp  eax,64
			jae  @f
			bts  r13,rax
		@@:	add  r14d,1
			cmp  r14d,2
			 jb  .NextDirection
			mov  qword[WhitePawnAttacks+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db +1,-1, -1,-1
		@@:


Init_BlackPawnAttacks:
			xor  r15d,r15d
	.NextSquare:	xor  r14d,r14d
			xor  r13d,r13d
	.NextDirection: mov  ebx,r15d
		      movzx  rcx,word[.Directions+2*r14]
		       call  GoDirection
			cmp  eax,64
			jae  @f
			bts  r13,rax
		@@:	add  r14d,1
			cmp  r14d,2
			 jb  .NextDirection
			mov  qword[BlackPawnAttacks+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db +1,+1, -1,+1
		@@:


Init_WhitePawnMoves:
			xor  r15d,r15d
	.NextSquare:	xor  r14d,r14d
			xor  r13d,r13d
	.NextDirection: mov  ebx,r15d
		      movzx  rcx,word[.Directions+2*r14]
		       call  GoDirection
			cmp  eax,64
			jae  @f
			bts  r13,rax
		@@:	add  r14d,1
			cmp  r14d,1
			 jb  .NextDirection
			mov  qword[WhitePawnMoves+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db 0,-1
		@@:


Init_BlackPawnMoves:
			xor  r15d,r15d
	.NextSquare:	xor  r14d,r14d
			xor  r13d,r13d
	.NextDirection: mov  ebx,r15d
		      movzx  rcx,word[.Directions+2*r14]
		       call  GoDirection
			cmp  eax,64
			jae  @f
			bts  r13,rax
		@@:	add  r14d,1
			cmp  r14d,1
			 jb  .NextDirection
			mov  qword[BlackPawnMoves+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare
			jmp  @f
    .Directions:    db 0,+1
		@@:


Init_CastlingRights:
			lea  rdi,[CastlingMasks]
			mov  rax,0x0B0F0F030F0F0F07
		      stosq
			mov  rax,0x0F0F0F0F0F0F0F0F
		      stosq
		      stosq
		      stosq
		      stosq
		      stosq
		      stosq
			mov  rax,0x0E0F0F0C0F0F0F0D
		      stosq



		       move  qword[WhitePawnPromRank],rax,((2 shl SQUARE_H8) - (1 shl SQUARE_A8))
		       move  qword[BlackPawnPromRank],rax,((	0	   ) - (1 shl SQUARE_A1))    ; (2 shl SQUARE_H1)

		       move  qword[WhitePawnHomeRank],rax,((2 shl SQUARE_H2) - (1 shl SQUARE_A2))
		       move  qword[BlackPawnHomeRank],rax,((2 shl SQUARE_H7) - (1 shl SQUARE_A7))


		       move  qword[CastlingOOClear+8*0],rax,((1 shl SQUARE_F1) + (1 shl SQUARE_G1))
		       move  qword[CastlingOOClear+8*1],rax,((1 shl SQUARE_F8) + (1 shl SQUARE_G8))
		       move  qword[CastlingOOCheck+8*0],rax,((1 shl SQUARE_E1) + (1 shl SQUARE_F1) + (1 shl SQUARE_G1))
		       move  qword[CastlingOOCheck+8*1],rax,((1 shl SQUARE_E8) + (1 shl SQUARE_F8) + (1 shl SQUARE_G8))
		       move  dword[CastlingOOMove+4*0],eax, (MOVE_TYPE_OO shl 12)+ (SQUARE_E1 shl 6) + (SQUARE_G1 shl 0)
		       move  dword[CastlingOOMove+4*1],eax, (MOVE_TYPE_OO shl 12)+ (SQUARE_E8 shl 6) + (SQUARE_G8 shl 0)

		       move  qword[CastlingOOOClear+8*0],rax,((1 shl SQUARE_D1) + (1 shl SQUARE_C1) + (1 shl SQUARE_B1))
		       move  qword[CastlingOOOClear+8*1],rax,((1 shl SQUARE_D8) + (1 shl SQUARE_C8) + (1 shl SQUARE_B8))
		       move  qword[CastlingOOOCheck+8*0],rax,((1 shl SQUARE_E1) + (1 shl SQUARE_D1) + (1 shl SQUARE_C1))
		       move  qword[CastlingOOOCheck+8*1],rax,((1 shl SQUARE_E8) + (1 shl SQUARE_D8) + (1 shl SQUARE_C8))
		       move  dword[CastlingOOOMove+4*0],eax, (MOVE_TYPE_OOO shl 12)+ (SQUARE_E1 shl 6) + (SQUARE_C1 shl 0)
		       move  dword[CastlingOOOMove+4*1],eax, (MOVE_TYPE_OOO shl 12)+ (SQUARE_E8 shl 6) + (SQUARE_C8 shl 0)




Init_BetweenMasks_LineMasks:

			xor  r15d,r15d
	.NextSquare1:	xor  r14d,r14d
	.NextSquare2:
			xor  rax,rax
			mov  edx,r15d
			shl  edx,6+3
			 bt  qword[BishopAttacksPDEP+8*r15],r14
			 jc  .Bishop
			 bt  qword[RookAttacksPDEP+8*r15],r14
			 jc  .Rook
			mov  qword[LineMasks+rdx+8*r14],rax
			mov  qword[BetweenMasks+rdx+8*r14],rax
			jmp  .Done

	.Bishop:

			xor  r13,r13
	      BishopAttacks  rax,r15,r13,r8
	      BishopAttacks  rbx,r14,r13,r8
			and  rax,rbx
			bts  rax,r15
			bts  rax,r14
			mov  qword[LineMasks+rdx+8*r14],rax


			xor  r13,r13
			bts  r13,r14
	      BishopAttacks  rax,r15,r13,r8
			xor  r13,r13
			bts  r13,r15
	      BishopAttacks  rbx,r14,r13,r8
			and  rax,rbx
			mov  qword[BetweenMasks+rdx+8*r14],rax
			jmp  .Done

	.Rook:

			xor  r13,r13
		RookAttacks  rax,r15,r13,r8
		RookAttacks  rbx,r14,r13,r8
			and  rax,rbx
			bts  rax,r15
			bts  rax,r14
			mov  qword[LineMasks+rdx+8*r14],rax


			xor  r13,r13
			bts  r13,r14
		RookAttacks  rax,r15,r13,r8
			xor  r13,r13
			bts  r13,r15
		RookAttacks  rbx,r14,r13,r8
			and  rax,rbx
			mov  qword[BetweenMasks+rdx+8*r14],rax
			jmp  .Done



	.Done:

			add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare2
			add  r15d,1
			cmp  r15d,64
			 jb  .NextSquare1



			pop  r12 r13 r14 r15
			ret





InitializeTables:
		       push  rbx rsi rdi r12 r13 r14 r15

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
			mov  res,WP
			shl  res,6
			add  res,WK
			shl  res,6
			add  res,BK
			shl  res,1
			add  res,TN
			add  res,qword[HashTable]
}

		; KPKEndgameTable[WhitePawn-8][WhiteKing] is a qword
		;  bit 2*BlackKing+0 is set if win for white to move
		;  bit 2*BlackKing+1 is set if win for black to move

		; use hash table for uncompressed data
			mov  rdi,qword[HashTable]
			mov  ecx,(64*64*2*64)/8
			xor  eax,eax
		  rep stosq
		; clear space for compressed data
			lea  rdi,[KPKEndgameTable]
			mov  ecx,48*64
			xor  eax,eax
		  rep stosq


			xor  cnt,cnt
			lea  ocnt,[cnt+1]
.Start:
			cmp  cnt,ocnt
			 je  .End
			mov  ocnt,cnt
			xor  cnt,cnt

			xor  tn,tn
    .TurnLoop:		xor  wp,wp
     .WhitePawnLoop:	xor  wk,wk
      .WhiteKingLoop:	xor  bk,bk
       .BlackKingLoop:

      KPKEndgameTableOffset  rbx,tn,wp,wk,bk
			cmp  byte[rbx],0
			jne  .Continue
			add  cnt,1
			cmp  wp,8
			 jb  .Draw
			cmp  wp,56
			jae  .Draw
			cmp  wp,wk
			 je  .Draw
			cmp  wk,bk
			 je  .Draw
			cmp  bk,wp
			 je  .Draw

		; is white pawn attacking black king ?
			 bt  qword[WhitePawnAttacks+8*wp],bk
			jnc  .CheckTurn
		; is it white's turn ?
			cmp  tn,0
			 je  .Draw
		; it is blacks turn - can black king leagally capture pawn ?
			 bt  qword[KingAttacks+8*wk],wp
			jnc  .Draw

	   .CheckTurn:	xor  un,un
			cmp  tn,0
			 je  .WhiteToMove



    .BlackToMove:	mov  rax,qword[KingAttacks+8*bk]
			bts  rax,bk
			mov  u,qword[KingAttacks+8*wk]
			bts  u,wk
			 or  u,qword[WhitePawnAttacks+8*wp]
		      _andn  u,u,rax
			bsf  to,u
			 jz  .Draw
  .BlackMoveLoop:	xor  tn,1
      KPKEndgameTableOffset  rcx,tn,wp,wk,to
			xor  tn,1
		      _blsr  u,u,r8
			cmp  byte[rcx],1
			 je  .Draw
			adc  un,0
			bsf  to,u
			jnz  .BlackMoveLoop
		       test  un,un
			 jz  .Win
			jmp  .Continue



    .WhiteToMove:
			mov  rax,qword[KingAttacks+8*wk]
			bts  rax,wk
			mov  u,qword[KingAttacks+8*bk]
			bts  u,bk
			bts  u,wp
		      _andn  u,u,rax
			bsf  to,u
			 jz  .WhiteMoveLoopDone
    .WhiteMoveLoop:	xor  tn,1
      KPKEndgameTableOffset  rcx,tn,wp,to,bk
			xor  tn,1
		      _blsr  u,u,r8
			cmp  byte[rcx],1
			 ja  .Win
			adc  un,0
			bsf  to,u
			jnz  .WhiteMoveLoop
    .WhiteMoveLoopDone:
			lea  to,[wp-8]
			cmp  to,wk
			 je  .WhiteMoveDone
			cmp  to,bk
			 je  .WhiteMoveDone
			cmp  to,8
			 jb  .PromCheck

			xor  tn,1
      KPKEndgameTableOffset  rcx,tn,to,wk,bk
			xor  tn,1
			cmp  byte[rcx],1
			 ja  .Win
			adc  un,0
			cmp  to,48
			 jb  .WhiteMoveDone
	.DoubleCheck:
			sub  to,8
			cmp  to,wk
			 je  .WhiteMoveDone
			cmp  to,bk
			 je  .WhiteMoveDone

			xor  tn,1
      KPKEndgameTableOffset  rcx,tn,to,wk,bk
			xor  tn,1
			cmp  byte[rcx],1
			 ja  .Win
			adc  un,0
			jmp  .WhiteMoveDone

	.PromCheck:	 bt  qword[KingAttacks+8*to],bk
			jnc  .Win
			 bt  qword[KingAttacks+8*to],wk
			 jc  .Win

    .WhiteMoveDone:    test  un,un
			jnz  .Continue
    .Draw:		mov  byte[rbx],1
			jmp  .Continue
    .Win:
		   ; record the win in uncompressed table
			mov  byte[rbx],2
		   ; record the win in compressed table
			cmp  wp,8
			 jb  .Continue
			cmp  wp,56
			jae  .Continue
			mov  rax,bk
			mov  rcx,bk
			and  eax,00111b
			cmp  eax,4
			jae  .Continue
			and  ecx,0111000b
			lea  eax,[2*rax+tn]
			add  rcx,rax

			lea  rax,[wp-8]
			shl  rax,6
			add  rax,wk
			bts  qword[KPKEndgameTable+8*rax],rcx

    .Continue:
			add  bk,1
			cmp  bk,64
			 jb  .BlackKingLoop
			add  wk,1
			cmp  wk,64
			 jb  .WhiteKingLoop
			add  wp,1
			cmp  wp,64
			 jb  .WhitePawnLoop
			add  tn,1
			cmp  tn,2
			 jb  .TurnLoop

		       test  cnt,cnt
			jnz  .Start

.End:
		   ; clear part of hash table that was messed up
			mov  rdi,qword[HashTable]
			mov  ecx,(64*64*2*64)/8
			xor  eax,eax
		  rep stosq



			pop  r15 r14 r13 r12 rdi rsi rbx
			ret







InitializeScores:
		       push  rbx rsi rdi r12 r13 r14 r15

Init_MaterialScores:
			mov  dword[MaterialScores+4*PAWN],   PAWN_MSCORE
			mov  dword[MaterialScores+4*KNIGHT], KNIGHT_MSCORE
			mov  dword[MaterialScores+4*BISHOP], BISHOP_MSCORE
			mov  dword[MaterialScores+4*ROOK],   ROOK_MSCORE
			mov  dword[MaterialScores+4*QUEEN],  QUEEN_MSCORE

Init_SwapValues:
			mov  dword[SwapValues+4*PAWN],	 80
			mov  dword[SwapValues+4*KNIGHT], 325
			mov  dword[SwapValues+4*BISHOP], 335
			mov  dword[SwapValues+4*ROOK],	 500
			mov  dword[SwapValues+4*QUEEN],  975


irps p, Pawn Knight Bishop Rook Queen King {

Init_#p#Pst:
			xor  esi,esi
		 @@:  movsx  eax,byte[Table#p#PstMg+rsi]
		      movsx  edx,byte[Table#p#PstEg+rsi]
			mov  word[Pst#p+8*rsi+0],ax
			mov  word[Pst#p+8*rsi+2],dx
			xor  esi,0111000b
			mov  word[Pst#p+8*rsi+4],ax
			mov  word[Pst#p+8*rsi+6],dx
			xor  esi,0111000b
			add  esi,1
			cmp  esi,64
			 jb  @b

}



Init_IsolatedPawns:
		; files on either side pawns
			xor  r15d,r15d
    .NextPawn:		xor  r13,r13
			xor  r14,r14
	.NextSquare:	mov  eax,r15d
			and  eax,7
			mov  ecx,r14d
			and  ecx,7
			sub  eax,ecx
			cmp  eax,1
			 jg  @f
			cmp  eax,-1
			 jl  @f
			cmp  eax,0
			 je  @f
			bts  r13,r14
		@@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare
			mov  qword[IsolatedPawns+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextPawn



if 0
Init_WhiteDoubledPawns:
		; same file in back
			xor  r15d,r15d
    .NextPawn:		xor  r13,r13
			xor  r14,r14
	.NextSquare:	mov  eax,r15d
			and  eax,7
			mov  ecx,r14d
			and  ecx,7
			cmp  eax,ecx
			jne  @f
			mov  eax,r15d
			shr  eax,3
			mov  ecx,r14d
			shr  ecx,3
			cmp  ecx,eax
			jbe  @f
			bts  r13,r14
		@@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare
			mov  qword[WhiteDoubledPawns+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextPawn

Init_BlackDoubledPawns:
		; same file in front
			xor  r15d,r15d
    .NextPawn:		xor  r13,r13
			xor  r14,r14
	.NextSquare:	mov  eax,r15d
			and  eax,7
			mov  ecx,r14d
			and  ecx,7
			cmp  eax,ecx
			jne  @f
			mov  eax,r15d
			shr  eax,3
			mov  ecx,r14d
			shr  ecx,3
			cmp  ecx,eax
			jae  @f
			bts  r13,r14
		@@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare
			mov  qword[BlackDoubledPawns+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextPawn

end if



Init_WhitePassedPawns:
		; three closest files in front
			xor  r15d,r15d
    .NextPawn:		xor  r13,r13
			xor  r14,r14
	.NextSquare:	mov  eax,r15d
			and  eax,7
			mov  ecx,r14d
			and  ecx,7
			sub  eax,ecx
			cmp  eax,1
			 jg  @f
			cmp  eax,-1
			 jl  @f
			mov  eax,r15d
			shr  eax,3
			mov  ecx,r14d
			shr  ecx,3
			cmp  ecx,eax
			jae  @f
			bts  r13,r14
		@@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare
			mov  qword[WhitePassedPawns+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextPawn


Init_BlackPassedPawns:
		; three closest files in back
			xor  r15d,r15d
    .NextPawn:		xor  r13,r13
			xor  r14,r14
	.NextSquare:	mov  eax,r15d
			and  eax,7
			mov  ecx,r14d
			and  ecx,7
			sub  eax,ecx
			cmp  eax,1
			 jg  @f
			cmp  eax,-1
			 jl  @f
			mov  eax,r15d
			shr  eax,3
			mov  ecx,r14d
			shr  ecx,3
			cmp  ecx,eax
			jbe  @f
			bts  r13,r14
		@@:	add  r14d,1
			cmp  r14d,64
			 jb  .NextSquare
			mov  qword[BlackPassedPawns+8*r15],r13
			add  r15d,1
			cmp  r15d,64
			 jb  .NextPawn


Init_SquareDistance:
			xor  r15d,r15d
		.Next1:
			xor  r14d,r14d
		 .Next2:
			mov  eax,r14d
			and  eax,7
			mov  ecx,r15d
			and  ecx,7
			sub  eax,ecx
			mov  ecx,eax
			sar  ecx,31
			xor  eax,ecx
			sub  eax,ecx

			mov  edx,r14d
			shr  edx,3
			and  edx,7
			mov  ecx,r15d
			shr  ecx,3
			and  ecx,7
			sub  edx,ecx
			mov  ecx,edx
			sar  ecx,31
			xor  edx,ecx
			sub  edx,ecx

			cmp  eax,edx
		      cmova  eax,edx
		       imul  ecx,r15d,64
			mov  byte[SquareDistance+rcx+r14],al

			add  r14d,1
			cmp  r14d,64
			 jb  .Next2
			add  r15d,1
			cmp  r15d,64
			 jb  .Next1

			pop  r15 r14 r13 r12 rdi rsi rbx
			ret







InitializeHashKeys:
		       push  rbx rsi rdi

		; zeros for empty squares
			xor  eax,eax
			lea  rdi,[WhiteKey]
			mov  ecx,64*2
		  rep stosq
		; keys for peices on squares + castling + epsquare + side
			lea  rdi,[WhitePawnKey]
			lea  rbx,[MaterialKeys_End]
		@@:    call  GetRand
		      stosw
			cmp  rdi,rbx
			 jb  @b

			pop  rdi rsi rbx
			ret




AllocateHashTable:   ; initialize hash table

		       push  rbx rsi rdi

			mov  edx,4     ; minimum 2^4 MB
			mov  ebx,16    ; maximum 2^16 MB
			bsr  eax,ecx
		      cmovz  eax,edx
			cmp  eax,ebx
		      cmova  eax,edx
			xor  ebx,ebx
			bts  rbx,rax
			mov  dword[HashTableSizeMB],ebx

			mov  rcx,qword[HashTable]
		       call  _VirtualFree

			shl  rbx,20   ; rbx = # of bytes in HashTable
			mov  rcx,rbx
		       call  _VirtualAlloc
			sub  rbx,ENTRY_CLUSTER_CT*sizeof.ENTRY
			mov  qword[HashTable],rax
			mov  qword[HashMask],rbx
			mov   byte[HashDate],0

			pop  rdi rsi rbx
			ret



ClearHashTable:        push  rdi
			mov  rdi,[HashTable]
			mov  ecx,dword[HashTableSizeMB]
			shl  rcx,20-3
			xor  eax,eax
		  rep stosq
			pop  rdi
			ret




