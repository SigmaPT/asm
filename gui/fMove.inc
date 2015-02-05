

; move strucutre
;
; normal move
; 0000000000FFFTTT 0000fffffftttttt
; pawn double move
; 0000000000001000 0001fffffftttttt
; ep capture
; 0000000000001001 0010fffffftttttt
; promotion
; 0000000000PPPTTT 0011fffffftttttt
; castling OO
; 0000000000110000 0100fffffftttttt
; castling OOO
; 0000000000110000 0101fffffftttttt


; ! TTT is not filled in



		      align  16

MakeMove:
			mov  rax,[rbp+POS.STATE_PTR]
		    vmovaps  ymm0,[rax+32*0]
		    vmovaps  ymm1,[rax+32*1]
		    vmovaps  ymm2,[rax+32*2]
		    vmovaps  ymm3,[rax+32*3]
		    vmovaps  ymm4,[rax+32*4]
		    vmovaps  ymm5,[rax+32*5]



MakePseudoLegalMove:	   ; in: rbp address of position (POS)
			   ;     ecx move

		       push  rbp

			add  dword[rbp+POS.MOVE_CT],1

			mov  rax,rbp
			mov  rbp,[rbp+POS.STATE_PTR]
			add  rbp,sizeof.STATE
		       push  rsi rdi r12 r13 r15



		    vmovaps  [rbp+32*0],ymm0
		    vmovaps  [rbp+32*1],ymm1
		    vmovaps  [rbp+32*2],ymm2
		    vmovaps  [rbp+32*3],ymm3
		    vmovaps  [rbp+32*4],ymm4
		    vmovaps  [rbp+32*5],ymm5

			mov  qword[rax+POS.STATE_PTR],rbp

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
			mov  r11d,ecx
			shr  r11d,16+3
			and  r11d,7

; 50 move rule
			mov  eax,dword[rbp-sizeof.STATE+STATE.MOVE50]
			add  eax,1
			cmp  r11d,PAWN
			 je  .reset50
		       test  r10d,r10d
			 je  .inc50
	   .reset50:	xor  eax,eax
	   .inc50:	mov  dword[rbp+STATE.MOVE50],eax


; r12 = address of our pieces
; r13 = address of their pieces
		      movzx  eax,byte[rbp+STATE.SIDE]
		      movsx  rsi,byte[rbp+STATE.SIDE]
			and  eax,64
			lea  r12,[rbp+rax]
			xor  eax,64
			lea  r13,[rbp+rax]

; edx = castling mask
		      movzx  edx,byte[CastlingMasks+r8]
			and  dl,byte[CastlingMasks+r9]
; clear ep square
			xor  eax,eax
			mov  qword[rbp+STATE.EPSQUARE],rax
; clear move
			mov  dword[rbp+STATE.MOVE],eax
; new castling mask
			and  byte[rbp+STATE.CASTLING],dl
; make move on board
			mov  byte[rbp+STATE.BOARD+r8],0
			mov  byte[rbp+STATE.BOARD+r9],r11l
;; adjust material score for captured piece
;                        mov  edx,dword[MaterialScores+4*r10]
;                        sub  word[rbp+STATE.BMSCORE+2*rsi],dx
; get hash and switch side
;                        mov  r15,qword[rbp-sizeof.STATE+STATE.MHASHKEY]
			xor  word[rbp+STATE.SIDE],-1
;                        xor  r15,qword[SideKey]
; rax = to + from
			bts  rax,r8
			bts  rax,r9
; increment ply
		 ;       mov  edx,dword[rbp-sizeof.STATE+STATE.PLY]
		 ;       add  edx,1
		 ;       mov  dword[rbp+STATE.PLY],edx
;; adjust material key
;                        lea  edx,[r10+r10+rsi+1]
;                        shl  edx,6+3
;                        lea  edi,[r11+r11]
;                        sub  edi,esi
;                        shl  edi,6+3
;                        xor  r15,[MaterialKeys+rdx+8*r9]
;                        xor  r15,[MaterialKeys+rdi+8*r8]
;                        xor  r15,[MaterialKeys+rdi+8*r9]
; cases for move
			shr  ecx,12
			and  ecx,7
			jnz  .NotNormalMove

    .NormalMove:	xor  qword[r12+8*0],rax
			xor  qword[r12+8*r11],rax
			btr  qword[r13+8*0],r9
			btr  qword[r13+8*r10],r9

.Done:

;; store hash
;                        mov  qword[rbp+STATE.MHASHKEY],r15
;                      movzx  ecx,byte[rbp+STATE.CASTLING]
;                        xor  r15,qword[CastleKey+8*rcx]
;                        xor  ecx,ecx                    ; incase there is no ep square ecx should be zero
;                        bsf  rcx,[rbp+STATE.EPSQUARE]
;                        xor  r15,qword[EpKey+8*rcx]
;                        mov  qword[rbp+STATE.HASHKEY],r15
;
;; prefech hash location
;                        and  r15,qword[HashMask]
;                        add  r15,qword[HashTable]
;              ;  prefetchnta  [r15]



			pop  r15 r13 r12 rdi rsi
			pop  rbp
			ret



		      align  8

 .NotNormalMove:	lea  edx,[r9+r8]
			shr  edx,1
			cmp  ecx,MOVE_TYPE_DPAWN
			 je  .PawnDouble
			mov  edx,8
			xor  edx,esi
			sub  edx,esi
			add  edx,r9d
			cmp  ecx,MOVE_TYPE_PROM
			 jb  .EpCapture
			 ja  .Castle

    .Promotion: 	xor  qword[r12+8*0],rax
			btr  qword[r12+8*PAWN],r8
			bts  qword[r12+8*r11],r9
			btr  qword[r13+8*0],r9
			btr  qword[r13+8*r10],r9
;                        neg  rsi
;                        mov  edx,dword[MaterialScores+4*r11]
;                        sub  edx,PAWN_MSCORE
;                        add  word[rbp+STATE.WMSCORE+2*rsi],dx
;                        xor  r15,[MaterialKeys+rdi+8*r8]
;                        mov  edx,esi
;                        and  edx,64*8
;                        xor  r15,qword[WhitePawnKey+rdx+8*r8]
			jmp  .Done

    .PawnDouble:	xor  qword[r12+8*0],rax
			xor  qword[r12+8*r11],rax
			bts  qword[rbp+STATE.EPSQUARE],rdx
			jmp  .Done

    .EpCapture: 	xor  qword[r12+8*0],rax
			xor  qword[r12+8*PAWN],rax
			btr  qword[r13+8*0],rdx
			btr  qword[r13+8*PAWN],rdx
			mov   byte[rbp+STATE.BOARD+rdx],0
			jmp  .Done


    .Castle:	       test  esi,esi
			jnz  .BlackCastle
    .WhiteCastle:
			cmp  ecx,MOVE_TYPE_OO
			mov  rdx,(1 shl SQUARE_E1) or (1 shl SQUARE_C1) or (1 shl SQUARE_D1) or (1 shl SQUARE_A1)
			 ja  .WOOO
			mov  rdx,(1 shl SQUARE_E1) or (1 shl SQUARE_G1) or (1 shl SQUARE_F1) or (1 shl SQUARE_H1)

    .WOO:		xor  qword[rbp+STATE.WPIECES],rdx
			xor  rdx,rax
			mov   byte[rbp+STATE.BOARD+SQUARE_H1],0
			mov   byte[rbp+STATE.BOARD+SQUARE_F1],ROOK
			xor  qword[rbp+STATE.WKING],rax
			xor  qword[rbp+STATE.WROOKS],rdx
			jmp  .Done

    .WOOO:		xor  qword[rbp+STATE.WPIECES],rdx
			xor  rdx,rax
			mov   byte[rbp+STATE.BOARD+SQUARE_A1],0
			mov   byte[rbp+STATE.BOARD+SQUARE_D1],ROOK
			xor  qword[rbp+STATE.WKING],rax
			xor  qword[rbp+STATE.WROOKS],rdx
			jmp  .Done

    .BlackCastle:
			cmp  ecx,MOVE_TYPE_OO
			mov  rdx,(1 shl SQUARE_E8) or (1 shl SQUARE_C8) or (1 shl SQUARE_D8) or (1 shl SQUARE_A8)
			 ja  .BOOO
			mov  rdx,(1 shl SQUARE_E8) or (1 shl SQUARE_G8) or (1 shl SQUARE_F8) or (1 shl SQUARE_H8)

    .BOO:		xor  qword[rbp+STATE.BPIECES],rdx
			xor  rdx,rax
			mov   byte[rbp+STATE.BOARD+SQUARE_H8],0
			mov   byte[rbp+STATE.BOARD+SQUARE_F8],ROOK
			xor  qword[rbp+STATE.BKING],rax
			xor  qword[rbp+STATE.BROOKS],rdx
			jmp  .Done

    .BOOO:		xor  qword[rbp+STATE.BPIECES],rdx
			xor  rdx,rax
			mov   byte[rbp+STATE.BOARD+SQUARE_A8],0
			mov   byte[rbp+STATE.BOARD+SQUARE_D8],ROOK
			xor  qword[rbp+STATE.BKING],rax
			xor  qword[rbp+STATE.BROOKS],rdx
			jmp  .Done












		      align  16

UndoMove:		xor  eax,eax
			mov  ecx,dword[rbp+POS.MOVE_CT]
			mov  rdx,qword[rbp+POS.STATE_PTR]
			sub  ecx,1
			 js  .ret
			cmp  rdx,qword[rbp+POS.ORG_STATE_PTR]
			jbe  .ret
			 or  eax,-1
			sub  rdx,sizeof.STATE
			mov  dword[rbp+POS.MOVE_CT],ecx
			mov  qword[rbp+POS.STATE_PTR],rdx
    .ret:		ret


MakeNullMove:		ret
