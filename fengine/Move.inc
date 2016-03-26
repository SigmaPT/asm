

; move strucutre
;
; normal move
;  0000fffffftttttt
; pawn double move
;  0001fffffftttttt
; ep capture
;  0010fffffftttttt
; promotion
;  11ppfffffftttttt
; castling OO
;  0100fffffftttttt
; castling OOO
;  0101fffffftttttt


		      align  16

MakeNullMove:


		       push  rbp rsi rdi r12 r13 r14 r15

			mov  rax,rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]

		   _load192  rbp

		; hash key
			mov  r13,qword[rbp+STATE.MHASHKEY]
			mov  r15,qword[rbp+STATE.HASHKEY]
			mov  r14,qword[rbp+STATE.PHASHKEY]

			add  rbp,sizeof.STATE

		  _store192  rbp

			mov  qword[rax+POS.CURR_STATE_PTR],rbp
; clear ep square
			xor  eax,eax
			mov  qword[rbp+STATE.EPSQUARE],rax
; get hash and switch side
			xor  word[rbp+STATE.SIDE],-1
			xor  r15,-1
			xor  r13,-1
; increment ply and repeat
		      movzx  edx,word[rbp-sizeof.STATE+STATE.PLY]
			mov  word[rbp+STATE.PLY],dx
; store hash
			mov  qword[rbp+STATE.HASHKEY],r15
			mov  qword[rbp+STATE.MHASHKEY],r13
			mov  qword[rbp+STATE.PHASHKEY],r14
; prefech hash location
			and  r15,qword[HashMask]
			add  r15,qword[HashTable]
		  _prefetch  [r15]

			pop  r15 r14 r13 r12 rdi rsi rbp
			ret




		      align  16

MakeMove:
MakePseudoLegalMove:	   ; in: rbp address of position (POS)
			   ;     ecx move


		       push  rbp rbx rsi rdi r12 r13 r14 r15

			mov  rax,rbp
			mov  rbp,[rbp+POS.CURR_STATE_PTR]

		   _load192  rbp

		; r8d = from
		; r9d = to
			mov  r8d,ecx
			shr  r8d,6
			and  r8d,63
			mov  r9d,ecx
			and  r9d,63

		; r10 = TO PIECE
		; r11 = FROM PIECE
		      movzx  r10d,byte[rbp+STATE.BOARD+r9]
		      movzx  r11d,byte[rbp+STATE.BOARD+r8]

		; hash key
			mov  r15,qword[rbp+STATE.MHASHKEY]
			mov  r14,qword[rbp+STATE.PHASHKEY]
		; pst
		      _movq  xmm15,qword[rbp+STATE.WPSTMG]

			add  rbp,sizeof.STATE

		  _store192  rbp

			mov  qword[rax+POS.CURR_STATE_PTR],rbp

; r12 = address of our pieces
; r13 = address of their pieces
		      movzx  eax,byte[rbp+STATE.SIDE]
		      movsx  rsi,byte[rbp+STATE.SIDE]
			and  eax,64
			lea  r12,[rbp+rax]
			xor  eax,64
			lea  r13,[rbp+rax]

; xmm4 = our PST mask
; xmm5 = their PST mask
			 or  eax,-1
			mov  edx,eax
			shl  rdx,32
		       test  esi,esi
			 jz  @f
		       xchg  rax,rdx
		 @@:  _movq  xmm4,rax
		      _movq  xmm5,rdx

; edx = castling mask
		      movzx  edx,byte[CastlingMasks+r8]
			and  dl,byte[CastlingMasks+r9]

; clear ep square
			xor  eax,eax
			mov  qword[rbp+STATE.EPSQUARE],rax

; new castling mask
			and  byte[rbp+STATE.CASTLING],dl

; make move on board
			mov  byte[rbp+STATE.BOARD+r8],0
			mov  byte[rbp+STATE.BOARD+r9],r11l

; adjust material score for captured piece
			mov  edx,dword[MaterialScores+4*r10]
			sub  word[rbp+STATE.BMSCORE+2*rsi],dx

; get hash and switch side
			xor  word[rbp+STATE.SIDE],-1
			xor  r15,-1

; increment ply and repeat
			mov  eax,0x0FF
			mov  edi,ecx
			shr  edi,12
		      movzx  edx,word[rbp-sizeof.STATE+STATE.PLY]
			add  edx,0x0101
			and  eax,edx
			 or  edi,r10d
		     cmovnz  edx,eax
			mov  word[rbp+STATE.PLY],dx

; rax = to + from
			xor  eax,eax
			bts  rax,r8
			bts  rax,r9

; adjust material key
			lea  edx,[r10+r10+rsi+1]
			shl  edx,6+3
			lea  edi,[r11+r11]
			sub  edi,esi
			shl  edi,6+3
			mov  rbx,[MaterialKeys+rdx+8*r9]
			mov  rdx,[MaterialKeys+rdi+8*r8]
			xor  rdx,[MaterialKeys+rdi+8*r9]

; adjust pawn material key and material key
			cmp  r10d,PAWN
			jne  @f
			xor  r14,rbx
		@@:	cmp  r11d,PAWN
			jne  @f
			xor  r14,rdx
		@@:	xor  r15,rbx
			xor  r15,rdx

; adjust pst
		; r8d = from
		; r9d = to
		; r10 = TO PIECE
		; r11 = FROM PIECE
			mov  edi,r11d
			shl  edi,6+3
			mov  edx,r10d
			shl  edx,6+3
		      _movq  xmm0,qword[PstScores+rdi+8*r9]
		      _movq  xmm1,qword[PstScores+rdi+8*r8]
		      _movq  xmm2,qword[PstScores+rdx+8*r9]
		     _psubw  xmm0,xmm0,xmm1
		      _pand  xmm0,xmm0,xmm4
		      _pand  xmm2,xmm2,xmm5
		     _paddw  xmm15,xmm15,xmm0
		     _psubw  xmm15,xmm15,xmm2

; rbx = to
			xor  ebx,ebx
			bts  rbx,r9

; cases for move
			shr  ecx,12
			jnz  .NotNormalMove

    .NormalMove:	not  rbx
			xor  qword[r12+8*0],rax
			xor  qword[r12+8*r11],rax
			and  qword[r13+8*0],rbx
			and  qword[r13+8*r10],rbx

.Done:

; store hash
			mov  rax,[rbp+STATE.EPSQUARE]
			bsf  rdx,rax
			and  edx,7
			mov  qword[rbp+STATE.MHASHKEY],r15
		      movzx  ecx,byte[rbp+STATE.CASTLING]
			xor  r15,qword[CastleKey+8*rcx]
			neg  rax
			sbb  rax,rax
			and  rax,qword[EpKey+8*rdx]
			xor  r15,rax
			mov  qword[rbp+STATE.HASHKEY],r15
			mov  qword[rbp+STATE.PHASHKEY],r14
		      _movq  qword[rbp+STATE.WPSTMG],xmm15

; prefech hash location
			and  r15,qword[HashMask]
			add  r15,qword[HashTable]
		  _prefetch  [r15]

			pop  r15 r14 r13 r12 rdi rsi rbx


	if DEBUG
			xor  eax,eax
			cmp  rax,qword[rbp+STATE.WKING]
			 jz  .PrintTree
			xor  eax,eax
			cmp  rax,qword[rbp+STATE.BKING]
			 jz  .PrintTree
	   .PrintTreeRet:
			xor  eax,eax
			cmp  rax,qword[rbp+STATE.WKING]
		  assert_nz  'no white king after MakeMove'
			xor  eax,eax
			cmp  rax,qword[rbp+STATE.BKING]
		  assert_nz  'no black king after MakeMove'
	end if

			pop  rbp
			ret

	if DEBUG
.PrintTree:		mov  rbp,[rsp]
		       call  PrintTree
			jmp  .PrintTreeRet
	end if

		      align  8
 .NotNormalMove:	lea  edx,[r9+r8]
			shr  edx,1
			cmp  ecx,MOVE_TYPE_DPAWN
			 je  .PawnDouble
			mov  edx,8
			xor  edx,esi
			sub  edx,esi
			add  edx,r9d
			cmp  ecx,MOVE_TYPE_EPCAP
			 je  .EpCapture
			 jb  .Castle

    .Promotion: 	and  ecx,3
			lea  r11,[rcx+2]
			xor  qword[r12+8*0],rax
			btr  qword[r12+8*PAWN],r8
			 or  qword[r12+8*r11],rbx
			not  rbx
			and  qword[r13+8*0],rbx
			and  qword[r13+8*r10],rbx
			mov  byte[rbp+STATE.BOARD+r9],r11l
			and  esi,1
			mov  edx,dword[MaterialScores+4*r11]
			sub  edx,PAWN_MSCORE
			add  word[rbp+STATE.WMSCORE+2*rsi],dx
			mov  edi,r11d
			shl  edi,6+3
		      _movq  xmm0,qword[PstScores+rdi+8*r9] ; don't need to subtract pawn pst because it should be zero
		      _pand  xmm0,xmm0,xmm4
		     _paddw  xmm15,xmm15,xmm0
			lea  edi,[r11+r11+rsi]
			shl  edi,6+3
			xor  r15,[MaterialKeys+rdi+8*r9]
			shl  esi,6+3
			xor  r15,qword[WhitePawnKey+rsi+8*r9]
			xor  r14,qword[WhitePawnKey+rsi+8*r9]
			jmp  .Done

		      align  8
    .PawnDouble:	xor  ecx,ecx
			bts  rcx,rdx
			xor  qword[r12+8*0],rax
			xor  qword[r12+8*PAWN],rax
			mov  qword[rbp+STATE.EPSQUARE],rcx
			jmp  .Done

		      align  8
    .EpCapture: 	 or  rcx,-1
			btr  rcx,rdx
			xor  qword[r12+8*0],rax
			xor  qword[r12+8*PAWN],rax
			and  qword[r13+8*0],rcx
			and  qword[r13+8*PAWN],rcx
			sub  word[rbp+STATE.BMSCORE+2*rsi],PAWN_MSCORE
			mov  byte[rbp+STATE.BOARD+rdx],0
			add  esi,2*PAWN+1
			shl  esi,6+3
			xor  r15,qword[MaterialKeys+rsi+8*rdx]
			xor  r14,qword[MaterialKeys+rsi+8*rdx]
		      _movq  xmm0,qword[PstPawn+8*rdx]
		      _pand  xmm0,xmm0,xmm5
		     _psubw  xmm15,xmm15,xmm0
			jmp  .Done

		      align  8
    .Castle:		lea  edx,[8*rcx]
			lea  r8,[r8+rcx+17]
			lea  r9d,[r9+2*rcx-5]
			sub  r8d,edx
			xor  edx,edx
			bts  rdx,r8
			bts  rdx,r9
			mov   byte[rbp+STATE.BOARD+r8],0
			mov   byte[rbp+STATE.BOARD+r9],ROOK
			xor  qword[r12+8*KING],rax
			xor  qword[r12+8*ROOK],rdx
			 or  rdx,rax
			xor  qword[r12+8*0],rdx
			and  esi,64*8
			add  esi,64*8*2*ROOK
			xor  r15,qword[MaterialKeys+rsi+8*r8]
			xor  r15,qword[MaterialKeys+rsi+8*r9]
		      _movq  xmm0,qword[PstRook+8*r9]
		      _movq  xmm1,qword[PstRook+8*r8]
		     _psubw  xmm0,xmm0,xmm1
		      _pand  xmm0,xmm0,xmm4
		     _paddw  xmm15,xmm15,xmm0
			jmp  .Done








		      align  16

UndoMove:
			mov  rax,qword[rbp+POS.CURR_STATE_PTR]
			cmp  rax,qword[rbp+POS.BASE_STATE_PTR]
			jbe  @f
			sub  rax,sizeof.STATE
			mov  qword[rbp+POS.CURR_STATE_PTR],rax
	       @@:	ret

