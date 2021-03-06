Position_Test:
	; in: rbp Pos
	; out: eax = 0 if passed all test
	;      eax = move if failed some test


		       push   rbx rsi rdi r12 r13 r14 r15

virtual at rsp
.seed rq 1
.movelist rb MAX_MOVES*sizeof.ExtMove
.lend rb 0
end virtual
.localsize = .lend-rsp
			sub   rsp, .localsize

		; use all pieces as seed
			mov   rax, qword[rbp+Pos.typeBB+8*White]
			 or   rax, qword[rbp+Pos.typeBB+8*Black]
			mov   qword[.seed], rax

			mov   rbx, qword[rbp+Pos.state]
		       call   SetCheckInfo

			lea   rdi, [.movelist]
			mov   rsi, rdi
		       call   Gen_Legal
			xor   eax, eax
			mov   dword[rdi], eax
			jmp   .MoveTest
	.MoveLoop:
		      movzx   ecx, word[rsi]
		       call   IsMovePseudoLegal
		       test   rax, rax
			 jz   .LegalFail1
		      movzx   ecx, word[rsi]
		       call   IsMoveLegal
		       test   rax, rax
			 jz   .LegalFail2
			add   rsi, sizeof.ExtMove
	.MoveTest:
		      movzx   ecx, word[rsi]
		       test   ecx, ecx
			jnz   .MoveLoop

			mov   r15d, 100000
.RandomLoop:
			lea   rcx, [.seed]
		       call   randi
			and   eax, 0x07FFF
			mov   esi, eax
			 jz   .RandomLoop
			lea   rcx, [.movelist]
			jmp   .WhileTest
	.WhileLoop:	cmp   eax, esi
			 je   .RandomLoop
			add   rcx, sizeof.ExtMove
	.WhileTest:	mov   eax, dword[rcx]
		       test   eax, eax
			jnz   .WhileLoop

		      ; esi is now a 'move' that is not in list of legal moves

			mov   ecx, esi
		       call   IsMovePseudoLegal
		       test   rax, rax
			jnz   .RandomFail1

.RandomFail1Ret:
			sub   r15d, 1
			jns   .RandomLoop

			xor   eax, eax
.Return:
			add   rsp, .localsize
			pop   r15 r14 r13 r12 rdi rsi rbx
			ret

.LegalFail1:
.LegalFail2:
		      movzx   eax, word[rsi]
			jmp   .Return
.RandomFail1:
			mov   ecx, esi
		       call   IsMoveLegal
		       test   rax, rax
			 jz   .RandomFail1Ret
.RandomFail2:
			mov   eax, esi
			jmp  .Return





Position_SetState:
	; in:  rbp  address of Pos
	; set information in state struct

		       push   rbx rsi rdi r12 r13 r14 r15
			sub   rsp, 64
			mov   rbx, qword[rbp+Pos.state]

			mov   rax, qword[Zobrist_side]
			mov   r15d, dword[rbp+Pos.sideToMove]
		      movzx   ecx, byte[rbx+State.epSquare]
		      movzx   edx, byte[rbx+State.castlingRights]
			neg   r15
			and   r15, qword[Zobrist_side]
			xor   r15, qword[Zobrist_Castling+8*rdx]
			cmp   ecx, 64
			jae   @f
			and   ecx, 7
			xor   r15, qword[Zobrist_Ep+8*rcx]
			@@:

			xor   r14, r14
			xor   r13, r13

		      vpxor   xmm0, xmm0, xmm0	; npMaterial
		    vmovdqa   dqword[rsp], xmm0

			xor   esi, esi
	.NextSquare:
		      movzx   eax, byte[rbp+Pos.board+rsi]
			mov   edx, eax
			and   edx, 7	; edx = piece type
			 jz   .Empty

		       imul   ecx, eax, 64*8
		      vmovq   xmm1, qword[Scores_Pieces+rcx+8*rsi]
		     vpaddw   xmm0, xmm0, xmm1

			xor   r15, qword[Zobrist_Pieces+rcx+8*rsi]
			cmp   edx, Pawn
			jne   @f
			xor   r14, qword[Zobrist_Pieces+rcx+8*rsi]
		 @@:
		      movzx   edx, byte [rsp+rax]
			xor   r13, qword[Zobrist_Pieces+rcx+8*rdx]
			add   edx, 1
			mov   byte [rsp+rax], dl
	.Empty:
			add   esi, 1
			cmp   esi, 64
			 jb   .NextSquare

			mov   qword[rbx+State.key], r15
			mov   qword[rbx+State.pawnKey], r14
			mov   qword[rbx+State.materialKey], r13
		      vmovq   qword[rbx+State.psq], xmm0

			mov   ecx, dword [rbp+Pos.sideToMove]
			mov   rdx, qword [rbp+Pos.typeBB+8*King]
			and   rdx, qword [rbp+Pos.typeBB+8*rcx]
			bsf   rdx, rdx
		       call   AttackersTo_Side
			mov   qword [rbx+State.checkersBB], rax

		       call   SetCheckInfo

			add   rsp, 64
			pop   r15 r14 r13 r12 rdi rsi rbx
			ret



Position_VerifyState:
	; in:  rbp  address of Pos
	; out: eax =  0 if incrementally updated information is correct
	;      eax = -1 if not

		       push   rbx rsi rdi r12 r13 r14 r15
			sub   rsp, 64
			mov   rbx, qword[rbp+Pos.state]

			mov   rax, qword[Zobrist_side]
			mov   r15d, dword[rbp+Pos.sideToMove]
		      movzx   ecx, byte[rbx+State.epSquare]
		      movzx   edx, byte[rbx+State.castlingRights]
			neg   r15
			and   r15, qword[Zobrist_side]
			xor   r15, qword[Zobrist_Castling+8*rdx]
			cmp   ecx, 64
			jae   @f
			and   ecx, 7
			xor   r15, qword[Zobrist_Ep+8*rcx]
			@@:

			xor   r14, r14
			xor   r13, r13

		      vpxor   xmm0, xmm0, xmm0	; npMaterial
		    vmovdqu   dqword[rsp], xmm0

			xor   esi, esi
	.NextSquare:
		      movzx   eax, byte [rbp+Pos.board+rsi]
			mov   edx, eax
			and   edx, 7	; edx = piece type
			 jz   .Empty

		       imul   ecx, eax, 64*8
		      vmovq   xmm1, qword [Scores_Pieces+rcx+8*rsi]
		     vpaddw   xmm0, xmm0, xmm1

			xor   r15, qword [Zobrist_Pieces+rcx+8*rsi]
			cmp   edx, Pawn
			jne   @f
			xor   r14, qword [Zobrist_Pieces+rcx+8*rsi]
		 @@:
		      movzx   edx, byte [rsp+rax]
			xor   r13, qword [Zobrist_Pieces+rcx+8*rdx]
			add   edx, 1
			mov   byte [rsp+rax], dl
	.Empty:
			add   esi, 1
			cmp   esi, 64
			 jb   .NextSquare

			cmp   qword[rbx+State.key], r15
			jne   .Failed
			cmp   qword[rbx+State.pawnKey], r14
			jne   .Failed
			cmp   qword[rbx+State.materialKey], r13
			jne   .Failed
		      vmovq   rax, xmm0
			cmp   qword[rbx+State.psq], rax
			jne   .Failed

			mov   ecx, dword[rbp+Pos.sideToMove]
			mov   rdx, qword[rbp+Pos.typeBB+8*King]
			and   rdx, qword[rbp+Pos.typeBB+8*rcx]
			bsf   rdx, rdx
		       call   AttackersTo_Side
			cmp   qword[rbx+State.checkersBB], rax
			jne   .Failed

			 or   eax,-1
			add   rsp, 64
			pop   r15 r14 r13 r12 rdi rsi rbx
			ret

.Failed:
			xor   eax, eax
			add   rsp, 64
			pop   r15 r14 r13 r12 rdi rsi rbx
			ret




Position_IsLegal:
	; in: rbp position (POS)
	; out: eax =  0 if position is legal
	;      eax = -1 if position is illegal
	;      rdx address of string

		       push   rbx rdi
			mov   rbx, qword [rbp+Pos.state]

			lea   rdi,[.szErrorDisjoint]
			mov   rax, qword[rbp+Pos.typeBB+8*White]
			and   rax, qword[rbp+Pos.typeBB+8*Black]
			jnz   .Failed

  .VerifyKings:
			lea   rdi,[.szErrorKings]
			mov   rax, qword [rbp+Pos.typeBB+8*White]
			and   rax, qword [rbp+Pos.typeBB+8*King]
		     popcnt   rax, rax,r8
			cmp   eax, 1
			jne   .Failed
			mov   rax, qword [rbp+Pos.typeBB+8*Black]
			and   rax, qword [rbp+Pos.typeBB+8*King]
		     popcnt   rax, rax, r8
			cmp   eax, 1
			jne   .Failed

  .VerifyPawns:
			lea   rdi,[.szErrorPawns]
			mov   rax, 0xFF000000000000FF
		       test   rax, qword [rbp+Pos.typeBB+8*Pawn]
			jnz   .Failed

  .VerifyPieces:
			lea   rdi,[.szErrorPieces]
			mov   rcx, qword [rbp+Pos.typeBB+8*White]
			mov   r9, rcx
			and   rcx, qword [rbp+Pos.typeBB+8*King]
		     popcnt   rdx, r9, r8
      irps p, Pawn Knight Bishop Rook Queen {
			mov   rax, qword [rbp+Pos.typeBB+8*p]
			and   rax, r9
			 or   rcx, rax
		     popcnt   rax, rax, r8
			sub   edx, eax
      }
			sub   edx, 1
			jnz   .Failed
			cmp   rcx, r9
			jne   .Failed

			mov   rcx, qword [rbp+Pos.typeBB+8*Black]
			mov   r9, rcx
			and   rcx, qword [rbp+Pos.typeBB+8*King]
		     popcnt   rdx, r9, r8
      irps p, Pawn Knight Bishop Rook Queen {
			mov   rax, qword [rbp+Pos.typeBB+8*p]
			and   rax, r9
			 or   rcx, rax
		     popcnt   rax, rax, r8
			sub   edx, eax
      }
			sub   edx, 1
			jnz   .Failed
			cmp   rcx, r9
			jne   .Failed






			lea   rdi, [.szErrorBoardMatch]
			xor   edx, edx
    .VerifyBoard:
		      movzx   eax, byte[rbp+Pos.board+rdx]
		       test   eax, eax
			 jz   .empty
			cmp   eax, 16
			jae   .Failed
			mov   ecx, eax
			and   eax, 7
			 jz   .Failed
			cmp   eax, 1
			 je   .Failed
			and   ecx, 8
			mov   r8, [rbp+Pos.typeBB+8*rax]
			and   r8, [rbp+Pos.typeBB+rcx]
			 bt   r8, rdx
			jnc   .Failed
			jmp   .next
	.empty:
			mov   r8, [rbp+Pos.typeBB+8*0]
			 or   r8, [rbp+Pos.typeBB+8*1]
			 or   r8, [rbp+Pos.typeBB+8*2]
			 or   r8, [rbp+Pos.typeBB+8*3]
			 or   r8, [rbp+Pos.typeBB+8*4]
			 or   r8, [rbp+Pos.typeBB+8*5]
			 or   r8, [rbp+Pos.typeBB+8*6]
			 or   r8, [rbp+Pos.typeBB+8*7]
			 bt   r8, rdx
			 jc   .Failed

	.next:
			add   edx, 1
			cmp   edx, 64
			 jb   .VerifyBoard

 .VerifyEp:
			lea   rdi, [.szErrorEpSquare]
		      movzx   ecx, byte [rbx+State.epSquare]
			cmp   ecx, 64
			jae   .VerifyEpDone
			mov   rax, Rank3BB+Rank6BB
			 bt   rax, rcx
			jnc  .Failed
		    ; make sure square behind ep square is empty
		      movzx   eax, byte[rbp+Pos.sideToMove]
			xor   eax, 1
			mov   rdx, qword[rbp+Pos.typeBB+8*rax]
			shl   eax, 4
			lea   eax, [rax+rcx-8]
			 bt   qword[rbp+Pos.typeBB+8*Black], rax
			 jc   .Failed
			 bt   qword[rbp+Pos.typeBB+8*White], rax
			 jc   .Failed
		    ; and square in front is occupied by one of their pawns
		      movzx   eax, byte[rbp+Pos.sideToMove]
			and   rdx, qword[rbp+Pos.typeBB+8*Pawn]
			shl   eax, 4
			lea   eax, [rax+rcx-8]
			 bt   rdx, rax
			jnc   .Failed
		    ; and opposing pawn can capture eqsquare
		      movzx   eax, byte[rbp+Pos.sideToMove]
			mov   rdx, qword[rbp+Pos.typeBB+8*rax]
			and   rdx, qword[rbp+Pos.typeBB+8*Pawn]
			xor   eax, 1
			shl   eax, 6+3
		       test   rdx, qword[WhitePawnAttacks+rax+8*rcx]
			 jz   .Failed
  .VerifyEpDone:

 .VerifyKingCapture:
		    ; make sure we can't capture their king
			lea   rdi, [.szErrorKingCapture]
		      movzx   ecx, byte [rbp+Pos.sideToMove]
			xor   ecx, 1
			mov   rdx, qword [rbp+Pos.typeBB+8*King]
			and   rdx, qword [rbp+Pos.typeBB+8*rcx]
			bsf   rdx, rdx
		       call   AttackersTo_Side
		       test   rax, rax
			jnz   .Failed


			lea   rdi, [.szErrorState]
		       call   Position_VerifyState
		       test   eax, eax
			 jz   .Failed

.Done:
			lea   rdx, [.szOK]
			xor   eax, eax
			pop   rdi rbx
			ret
.Failed:
			mov   rdx, rdi
			 or   eax, -1
			pop   rdi rbx
			ret

 .szOK	  db 'ok',10,0
 .szErrorDisjoint      db 'not disjoint',10,0
 .szErrorKings	       db 'king count',10,0
 .szErrorPawns	       db 'pawns on 1st or 8th',10,0
 .szErrorCastling      db 'castling',10,0
 .szErrorBoardMatch    db 'bitboards do not match',10,0
 .szErrorEpSquare      db 'ep square',10,0
 .szErrorPieces        db 'pieces',10,0
 .szErrorPieces2       db 'pieces2',10,0
 .szErrorKingCapture   db 'king capture',10,0
 .szErrorState	       db 'state',10,0




;;;;;;;;;;;;;; fen ;;;;;;;;;;;;;;;;;;


WriteOutPosition:
       push  rdi
	lea  rdi, [Output]
       call  Position_Print
	mov  al, 10
      stosb
       call   _WriteOut_Output
	pop  rdi
	ret


Position_Print:  ; in: rbp address of Pos
		 ; io: rdi string

virtual at rsp
  .moveList    rb sizeof.ExtMove*MAX_MOVES
  .lend rb 0
end virtual
.localsize = ((.lend-rsp+15) and (-16)) +8


		       push   rbx rsi r13 r14 r15
			sub   rsp, .localsize

			mov   rbx, [rbp+Pos.state]

			xor   ecx, ecx
		@@:	xor   ecx, 0111000b
		      movzx   eax, byte [rbp+Pos.board+rcx]
			mov   edx, '  ' + (10 shl 16)
			mov   dl, byte [PieceToChar+rax]
			mov   eax, '* ' + (10 shl 16)
			cmp   cl, byte [rbx+State.epSquare]
		     cmovne   eax, edx
		      stosd
			xor   ecx, 0111000b
			lea   eax, [rcx+1]
			and   eax, 7
			neg   eax
			sbb   rdi, 1
			add   ecx, 1
			cmp   ecx, 64
			 jb   @b


		     szcall   PrintString, 'white:     '
			mov   rcx, qword[rbp+Pos.typeBB+8*0]
		       call   PrintBitboardCompact
			mov   al, 10
		      stosb
		     szcall   PrintString, 'black:     '
			mov   rcx, qword [rbp+Pos.typeBB+8*1]
		       call   PrintBitboardCompact
			mov   al, 10
		      stosb
		     szcall   PrintString, 'pawn:      '
			mov   rcx, qword [rbp+Pos.typeBB+8*2]
		       call   PrintBitboardCompact
			mov   al, 10
		      stosb
		     szcall   PrintString, 'knight:    '
			mov   rcx, qword [rbp+Pos.typeBB+8*3]
		       call   PrintBitboardCompact
			mov   al, 10
		      stosb
		     szcall   PrintString, 'bishop:    '
			mov   rcx, qword [rbp+Pos.typeBB+8*4]
		       call   PrintBitboardCompact
			mov   al, 10
		      stosb
		     szcall   PrintString, 'rook:      '
			mov   rcx, qword [rbp+Pos.typeBB+8*5]
		       call   PrintBitboardCompact
			mov   al, 10
		      stosb
		     szcall   PrintString, 'queen:     '
			mov   rcx, qword [rbp+Pos.typeBB+8*6]
		       call   PrintBitboardCompact
			mov   al, 10
		      stosb
		     szcall   PrintString, 'king:      '
			mov   rcx, qword [rbp+Pos.typeBB+8*7]
		       call   PrintBitboardCompact
			mov   al, 10
		      stosb

		     szcall   PrintString, 'checkers:  '
			mov   rcx, qword[rbx+State.checkersBB]
		       call   PrintBitboardCompact
			mov   al, 10
		      stosb
		     szcall   PrintString, 'pinned:    '
			mov   rcx, qword[rbx+State.pinned]
		       call   PrintBitboardCompact
			mov   al, 10
		      stosb


		     szcall   PrintString, 'fen:            '
		       call   Position_PrintFen
			mov   al, 10
		      stosb

		     szcall   PrintString, 'isok:           '
		       call   Position_IsLegal
			mov   rcx, rdx
		       call   PrintString

		     szcall   PrintString, 'sideToMove:     '
			mov   eax, dword [rbp+Pos.sideToMove]
			sub   eax, 1
			and   eax, 'w' - 'b'
			add   eax, 'b'
			mov   ah, 10
		      stosw

		     szcall   PrintString, 'castlingRights: '
		      movzx   ecx, byte[rbx+State.castlingRights]
			mov   byte [rdi], 'K'
			shr   ecx, 1
			adc   rdi, 0
			mov   byte [rdi], 'Q'
			shr   ecx, 1
			adc   rdi, 0
			mov   byte [rdi], 'k'
			shr   ecx, 1
			adc   rdi, 0
			mov   byte [rdi], 'q'
			shr   ecx, 1
			adc   rdi, 0
			mov   al, 10
		      stosb

		     szcall   PrintString, 'epSquare:       '
		      movzx   ecx, byte [rbx+State.epSquare]
		       call   PrintSquare
			mov   al, 10
		      stosb

		     szcall   PrintString, 'rule50:         '
		      movzx   rax, byte [rbx+State.rule50]
		       call   PrintUnsignedInteger
			mov   al, 10
		      stosb

		     szcall   PrintString, 'pliesFromNull:  '
		      movzx   rax, byte [rbx+State.pliesFromNull]
		       call   PrintUnsignedInteger
			mov   al, 10
		      stosb

		     szcall   PrintString, 'capturedPiece:  '
		      movzx   eax, byte [rbx+State.capturedPiece]
			mov   al, byte [PieceToChar+rax]
		      stosb
			mov   al, 10
		      stosb

		     szcall   PrintString, 'key:            '
			mov   rcx, qword[rbx+State.key]
		       call   PrintAddress
			mov   al, 10
		      stosb

		     szcall   PrintString, 'pawnKey:        '
			mov   rcx, qword [rbx+State.pawnKey]
		       call   PrintAddress
			mov   al, 10
		      stosb

		     szcall   PrintString, 'materialKey:    '
			mov   rcx, qword [rbx+State.materialKey]
		       call   PrintAddress
			mov   al, 10
		      stosb

		     szcall   PrintString, 'psq:            '
			mov   eax, 'mg: '
		      stosd
		      movsx   rax, word [rbx+State.psq+2*0]
		       call   PrintSignedInteger
			mov   ax, '  '
		      stosw
			mov   eax, 'eg: '
		      stosd
		      movsx   rax, word [rbx+State.psq+2*1]
		       call   PrintSignedInteger
			mov   al, 10
		      stosb

		     szcall   PrintString, 'npMaterial:     '
			mov   eax,'w: '
		      stosd
			sub   rdi, 1
		      movsx   rax, word [rbx+State.npMaterial+2*0]
		       call   PrintSignedInteger
			mov   eax, ' b: '
		      stosb
		      stosd
		      movsx   rax, word [rbx+State.npMaterial+2*1]
		       call   PrintSignedInteger
			mov   al, 10
		      stosb



	     szcall   PrintString, 'Gen_Legal:      '
		mov   r15, rdi
		mov   rbx, qword[rbp+Pos.state]
		lea   rdi, [.moveList]
	       call   Gen_Legal
		xor   eax, eax
		mov   qword[rdi], rax
		mov   rdi, r15
		lea   rsi, [.moveList]
		xor   r14d, r14d
.MoveList:
		mov   eax, dword[rsi]
		add   rsi, sizeof.ExtMove
		mov   ecx, eax
		mov   edx, dword[rbp+Pos.chess960]
	       test   eax, eax
		 jz   .MoveListDone
	       call   PrintUciMove
		add   r14d, 1
		and   r14d, 7
		 jz   .MoveListNL
		mov   al, ' '
	      stosb
		jmp   .MoveList
.MoveListNL:
		mov   al, 10
	      stosb
		mov   rax,'        '
	      stosq
	      stosq
		jmp   .MoveList
.MoveListDone:
		mov   al, 10
	      stosb

		add   rsp, .localsize
		pop   r15 r14 r13 rsi rbx
		ret




Position_PrintSmall:
	; in: rbp address of Pos
	; io: rdi string

	       push   rbx rsi r13 r14 r15

		mov   rbx, [rbp+Pos.state]

		xor   ecx, ecx
	@@:	xor   ecx, 0111000b
	      movzx   eax, byte [rbp+Pos.board+rcx]
		mov   edx, '  ' + (10 shl 16)
		mov   dl, byte [PieceToChar+rax]
		mov   eax, '* ' + (10 shl 16)
		cmp   cl, byte [rbx+State.epSquare]
	     cmovne   eax, edx
	      stosd
		xor   ecx, 0111000b
		lea   eax, [rcx+1]
		and   eax, 7
		neg   eax
		sbb   rdi, 1
		add   ecx, 1
		cmp   ecx, 64
		 jb   @b

		pop   r15 r14 r13 rsi rbx
		ret






;;;;;;;;;;;;;;;
;  fen
;;;;;;;;;;;;;;;



Position_ParseFEN:
		; in: rsi address of fen string
		;     rbp address of Pos
		; out: eax = 0 success
		;      eax = -1 failure

		       push   rbp rbx rdi r12 r13 r14 r15

			mov   rbx, qword[rbp+Pos.stateTable]
		       test   rbx, rbx
			 jz   .alloc
.alloc_ret:
			xor   eax, eax
			mov   ecx, Pos._copy_size/8
			mov   rdi, rbp
		  rep stosq

			xor   eax, eax
			mov   ecx, sizeof.State/8
			mov   rdi, rbx
		  rep stosq

		       call   SkipSpaces

			xor   eax,eax
			xor   ecx,ecx
			jmp   .ExpectPiece

.ExpectPieceOrSlash:
		       test   ecx,7
			jnz   .ExpectPiece
		      lodsb
			cmp   al, '/'
			jne   .Failed
	.ExpectPiece:
		      lodsb

			mov   edx, 8*White+Pawn
			cmp   al, 'P'
			 je   .FoundPiece
			mov   edx, 8*White+Knight
			cmp   al, 'N'
			 je   .FoundPiece
			mov   edx, 8*White+Bishop
			cmp   al, 'B'
			 je   .FoundPiece
			mov   edx, 8*White+Rook
			cmp   al, 'R'
			 je   .FoundPiece
			mov   edx, 8*White+Queen
			cmp   al, 'Q'
			 je   .FoundPiece
			mov   edx, 8*White+King
			cmp   al, 'K'
			 je   .FoundPiece

			mov   edx, 8*Black+Pawn
			cmp   al, 'p'
			 je   .FoundPiece
			mov   edx, 8*Black+Knight
			cmp   al, 'n'
			 je   .FoundPiece
			mov   edx, 8*Black+Bishop
			cmp   al, 'b'
			 je   .FoundPiece
			mov   edx, 8*Black+Rook
			cmp   al, 'r'
			 je   .FoundPiece
			mov   edx, 8*Black+Queen
			cmp   al, 'q'
			 je   .FoundPiece
			mov   edx, 8*Black+King
			cmp   al, 'k'
			 je   .FoundPiece

			sub   eax, '0'
			 js   .Failed
			cmp   eax, 8
			 ja   .Failed
	.Spaces:
			add   ecx, eax
			jmp   .PieceDone

	.FoundPiece:
			xor   ecx, 0111000b
			mov   edi, edx
			and   edi, 7
			bts   qword[rbp+Pos.typeBB+8*rdi], rcx
			mov   edi, edx
			shr   edi, 3
			bts   qword[rbp+Pos.typeBB+8*rdi], rcx
			mov   byte[rbp+Pos.board+rcx], dl
			xor   ecx, 0111000b
			add   ecx, 1
	.PieceDone:
			cmp   ecx, 64
			 jb   .ExpectPieceOrSlash

	.Turn:
		       call   SkipSpaces
		      lodsb
			xor   ecx, ecx
			cmp   al, 'b'
		       sete   cl
			mov   dword[rbp+Pos.sideToMove], ecx

      .Castling:
	       call   SkipSpaces
		xor   eax, eax
	      lodsb
		cmp   al, '-'
		 je   .EpSquare
     @@:
		xor   edx, edx
	      movzx   ecx, byte[ToLowerCase+rax]
		cmp   eax, ecx
		adc   edx, edx
		xor   edx, 1	 ; edx = color
	       call   SetCastlingRights
	       test   eax, eax
		jnz   .Failed
		xor   eax, eax
	      lodsb
		cmp   al, ' '
		jne   @b

.EpSquare:
	       call   SkipSpaces
	       call   ParseSquare
		mov   byte[rbx+State.epSquare], al
		cmp   eax, 64
		jae   .FiftyMoves

		mov   rdx, qword[rbp+Pos.typeBB+8*Pawn]
		mov   ecx, dword[rbp+Pos.sideToMove]
		and   rdx, qword[rbp+Pos.typeBB+8*rcx]
		xor   ecx, 1
		shl   ecx, 6+3
	       test   rdx, qword[PawnAttacks+rcx+8*rax]
		jnz   .FiftyMoves
		mov   byte[rbx+State.epSquare], 64

.FiftyMoves:
	       call   SkipSpaces
	       call   ParseInteger
		mov   byte[rbx+State.rule50], al

.MoveNumber:
	       call   SkipSpaces
	       call   ParseInteger
		sub   eax, 1
		adc   eax, 0
		shl   eax, 1
		add   eax, dword[rbp+Pos.sideToMove]
		mov   dword[rbp+Pos.gamePly], eax

	       call   Position_SetState

	       call   Position_IsLegal
	       test   eax,eax
		jnz   .Failed

.done:
		pop   r15 r14 r13 r12 rdi rbx rbp
		ret

.Failed:
		 or   eax, -1
		jmp   .done



.alloc:
		mov   ecx, 64*sizeof.State
		mov   r15d, ecx
	       call   _VirtualAlloc
		mov   rbx, rax
		mov   qword[rbp+Pos.state], rax
		mov   qword[rbp+Pos.stateTable], rax
		add   rax, r15
		mov   qword[rbp+Pos.stateEnd], rax
		jmp   .alloc_ret




SetCastlingRights:
	; in: edx color
	;     ecx = 'q' for qeenside castling
	;           'k' for kingside castling
	;           'a' through 'h' for file of rook
	; out eax = 0 if success
	;         = -1 if failed

		       push   rdi rsi r12 r13 r14 rsi

			mov   rdi, qword[rbp+Pos.typeBB+8*King]
			and   rdi, qword[rbp+Pos.typeBB+8*rdx]
			bsf   rdi, rdi
			 jz   .failed
		       imul   esi, edx, 56
			lea   r8d, [8*rdx+Rook]
			add   esi, 7
			 or   r9d, -1
			cmp   cl, 'k'
			 je   .find_rook_sq
			sub   esi, 7
			neg   r9d
			cmp   cl, 'q'
			 je   .find_rook_sq
			sub   ecx, 'a'
			add   esi, ecx
			cmp   ecx, 7
			 ja   .failed

.have_rook_sq:
	; esi = rook from
	; edi = king from

			cmp   r8l, byte[rbp+Pos.board+rsi]
			jne   .failed

	; r14 = 0 if OO, 1 if OOO
			xor   r14, r14
			cmp   esi, edi
			adc   r14, r14

	; r15 = 2*color + r14
			lea   r15, [2*rdx+r14]

	; r8 = rook to
	; r9 = king to
		      movzx   r8d, byte[.rsquare_lookup+r15]
		      movzx   r9d, byte[.ksquare_lookup+r15]

	; set castling rights
		      movzx   eax, byte[rbx+State.castlingRights]
			bts   eax, r15d
			mov   byte[rbx+State.castlingRights], al

	; set masks
		      movzx   eax, byte[castling_rightsMask+rsi]
			bts   eax, r15d
			mov   byte[castling_rightsMask+rsi], al
		      movzx   eax, byte[castling_rightsMask+rdi]
			bts   eax, r15d
			mov   byte[castling_rightsMask+rdi], al

	; set rook from/to
			mov   byte[castling_rfrom+r15], sil
			mov   byte[castling_rto+r15], r8l

	; set castling path
			lea   r11, [castling_ksqpath+8*r15]
			xor   eax, eax
			mov   byte[r11], al
			mov   r12, rdi
			mov   r13, r9
			cmp   r12, r13
			 jb   @f
		       xchg   r12, r13
		@@:	sub   r12, 1
	.king_loop:
			add   r12, 1
			cmp   r12, r13
			 ja   .king_loop_done
			cmp   r12, rdi
			 je   .king_loop
			add   byte[castling_ksqpath+8*r15], 1
			add   r11, 1
			mov   byte[r11], r12l
			mov   rcx, qword[KnightAttacks+8*r12]
			 or   qword[castling_knights+8*r15], rcx
			mov   rcx, qword[KingAttacks+8*r12]
			 or   qword[castling_kingpawns+8*r15], rcx
			cmp   r12, rsi
			 je   .king_loop
			bts   rax, r12
			jmp   .king_loop
	.king_loop_done:


			mov   r12, rsi
			mov   r13, r8
			cmp   r12, r13
			 jb   @f
		       xchg   r12, r13
		@@:	sub   r12, 1
	.rook_loop:
			add   r12, 1
			cmp   r12, r13
			 ja   .rook_loop_done
			cmp   r12, rdi
			 je   .rook_loop
			cmp   r12, rsi
			 je   .rook_loop
			bts   rax, r12
			jmp   .rook_loop
	.rook_loop_done:

			mov   qword[castling_path+8*r15], rax

	; set castling move
			mov   eax, MOVE_TYPE_CASTLE
			shl   eax, 6
			add   eax, edi
			shl   eax, 6
			add   eax, r9d
			mov   dword[castling_movgen+4*r15], eax

			xor   eax, eax
.done:
			pop   r15 r14 r13 r12 rsi rdi
			ret
.failed:
			 or   eax, -1
			jmp   .done


.find_rook_sq:		cmp   esi, 64
			jae   .failed
			cmp   r8l, byte[rbp+Pos.board+rsi]
			 je   .have_rook_sq
			add   esi, r9d
			jmp   .find_rook_sq


.rsquare_lookup:  db SQ_F1, SQ_D1, SQ_F8, SQ_D8
.ksquare_lookup:  db SQ_G1, SQ_C1, SQ_G8, SQ_C8







Position_PrintFen:
	; in: rbp address of Pos
	; io: rdi string

		       push   rbx
			mov   rbx, qword[rbp+Pos.state]

			mov   r8d, 7
	.loop1:
			xor   ecx, ecx

			xor   r9d, r9d
	 .loop2:
			lea   r10d, [r9+8*r8]
		      movzx   edx, byte[rbp+Pos.board+r10]
		       test   edx, edx
			 jz   .space

			lea   eax, ['0'+rcx]
		       test   ecx,ecx
			 jz   @f
		      stosb
		@@:
		      movzx   eax, byte[PieceToChar+rdx]
		      stosb

			xor   ecx,ecx

			jmp   .cont
		.space:
			add   ecx,1
		.cont:
			add   r9d,1
			cmp   r9d,8
			 jb   .loop2

			lea   eax, ['0'+rcx]
		       test   ecx, ecx
			 jz   @f
		      stosb
		@@:
			mov   al, '/'
		      stosb

			sub   r8d, 1
			jns   .loop1

	; side to move
			mov   byte[rdi-1], ' '
			mov   eax, 'w '
			mov   ecx, 'b '
			cmp   byte[rbp+Pos.sideToMove], 0
		     cmovne   eax, ecx
		      stosw

	; castling
		      movzx   ecx, byte[rbx+State.castlingRights]
			mov   byte[rdi], '-'
			cmp   ecx, 1
			adc   rdi, 0
			mov   eax, 'KQkq'
			mov   edx, dword[castling_rfrom]
			add   edx, 'AAaa'
			cmp   byte[rbp+Pos.chess960], 0
		     cmovne   eax, edx
		irps i, 0 1 2 3 {
			mov   byte[rdi], al
			shr   eax, 8
			 bt   ecx, i
			adc   rdi, 0
		}

	; ep
			mov   eax, ' '
		      stosb
		      movzx   rcx, byte[rbx+State.epSquare]
		       call   PrintSquare

	; 50 moves
			mov   eax, ' '
		      stosb
		      movzx   eax, byte[rbx+State.rule50]
		       call   PrintUnsignedInteger

	; ply
			mov   eax, ' '
		      stosb
			mov   eax, dword[rbp+Pos.gamePly]
			add   eax, 2
			shr   eax, 1
		       call   PrintUnsignedInteger

			pop   rbx
			ret










;;;;;;;;;;;;;;;
;  copying
;;;;;;;;;;;;;;;

Position_CopyTo:
		; rbp address of source position
		; rcx address of destination position
		;  up to Pos._copy_size is copied
		;  and state array is copied

		       push   rbx rsi rdi r13 r14
			mov   r13, rcx

		; copy basic position info
			lea   rsi, [rbp]
			lea   rdi, [r13]
			mov   ecx, Pos._copy_size/8
		  rep movsq

		; rsi = address of our state table
			mov   rsi, qword[rbp+Pos.stateTable]

		; r14 = size of states that need to be copied
			mov   r14, qword[rbp+Pos.state]
			sub   r14, rsi
			add   r14, sizeof.State

		; if destination has no table, we need to alloc
			mov   rdi, qword[r13+Pos.stateTable]
		       test   rdi, rdi
			 jz   .alloc

		; rcx = capacity of states in destination
			mov   rcx, qword[r13+Pos.stateEnd]
			sub   rcx, rdi

		; if rcx < r14, we need to realloc
			cmp   rcx, r14
			 jb   .realloc

		; also, if rcx/2 > max(2*r14,64), realloc to save space
			cmp   rcx, 64*sizeof.State
			jbe   .copy_states
			shr   rcx, 1
			cmp   rcx, r14
			 ja   .realloc
.copy_states:
		; copy State elements
			mov   rcx, r14
			shr   ecx, 3
		  rep movsq

		; set pointer to destination state
			sub   rdi, sizeof.State
			mov   qword[r13+Pos.state], rdi

			pop   r14 r13 rdi rsi rbx
			ret

.realloc:
			mov   rcx, rdi
		       call   _VirtualFree
.alloc:
			lea   rcx, [2*r14]
		       call   _VirtualAlloc
			mov   rdi, rax
			mov   qword[r13+Pos.stateTable], rax
			lea   rax, [rax+2*r14]
			mov   qword[r13+Pos.stateEnd], rax
			jmp   .copy_states



Position_CopyToSearch:
	; rbp address of source position
	; rcx address of destination position
	;  up to Pos._copy_size is copied
	;  and state array is copied
	; enough elements are copied for
	;   draw by 50 move detection
	;   referencing ss-5 and ss+2 in search

	       push   rsi rdi r13
		mov   r13, rcx

	; copy basic position info
		lea   rsi, [rbp]
		lea   rdi, [r13]
		mov   ecx, Pos._copy_size/8
	  rep movsq

	; if destination has no table, we need to alloc
		mov   r9, qword[r13+Pos.stateTable]
	       test   r9, r9
		 jz   .alloc

		; rcx = capacity of states in destination
		; if rcx < MAX_PLY+102, we need to realloc
			mov   rcx, qword[r13+Pos.stateEnd]
			sub   rcx, r9
			cmp   rcx, sizeof.State*(102+MAX_PLY)
			 jb   .realloc
.copy_states:
		; r9 = address of its state table
		; r8 = address of our state table
			mov   r8, qword[rbp+Pos.stateTable]

			mov   r10, [rbp+Pos.state]
			lea   r11, [r9+100*sizeof.State]
			mov   qword[r13+Pos.state], r11
.loop:
			mov   rsi, r10
			mov   rdi, r11
			mov   ecx, sizeof.State/8
		  rep movsq
			sub   r10, sizeof.State
			sub   r11, sizeof.State
			cmp   r11, r9
			 jb   .done
			cmp   r10, r8
			jae   .loop
.done:
			pop   r13 rdi rsi
			ret

.realloc:
			mov   rcx, r9
		       call   _VirtualFree
.alloc:
			mov   ecx, sizeof.State*(102+MAX_PLY)
		       call   _VirtualAlloc
			mov   r9, rax
			mov   qword[r13+Pos.stateTable], rax
			lea   rax, [rax+sizeof.State*(102+MAX_PLY)]
			mov   qword[r13+Pos.stateEnd], rax
			jmp   .copy_states




Position_SetExtraCapacity:
	; in: rbp postion
	;     ecx
	; reserve space for ecx additional state elements after the current

			add   ecx, 1
		       imul   ecx, sizeof.State
			add   rcx, qword[rbp+Pos.state]
			cmp   rcx, qword[rbp+Pos.stateEnd]
			 ja   .realloc
			ret
.realloc:
		       push   rbx rsi rdi
			sub   rcx, qword[rbp+Pos.stateTable]
			mov   ebx, ecx
		       call   _VirtualAlloc
			mov   r8, rax
			lea   r10, [rax+rbx]
			mov   rsi, qword[rbp+Pos.stateTable]
			mov   rdi, r8
			mov   r9, qword[rbp+Pos.state]
			sub   r9, rsi
			add   r9, r8
			mov   rcx, qword[rbp+Pos.stateEnd]
			sub   rcx, rsi
			shr   ecx, 3
		  rep movsq
			mov   rcx, qword[rbp+Pos.stateTable]
			mov   rbx, r9
			mov   qword[rbp+Pos.state], r9
			mov   qword[rbp+Pos.stateTable], r8
			mov   qword[rbp+Pos.stateEnd], r10
		       call   _VirtualFree
			pop   rdi rsi rbx
			ret

