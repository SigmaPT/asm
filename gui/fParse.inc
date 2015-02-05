



CmpString:	   ; if beginning of string at rsi matches null terminated string at rcx
		   ;    then advance rsi to end of match and return non zero,
		   ;    else return zero and do nothing
		       push  rsi
.Next:		      movzx  eax,byte[rcx]
			lea  rcx,[rcx+1]
			cmp  al,0
			 je  .Found
			cmp  al,byte[rsi]
			lea  rsi,[rsi+1]
			 je  .Next
.NoMatch:		pop  rsi
			xor  eax,eax
			ret
.Found: 		pop  rax
			 or  eax,-1
			ret


		@@:	add  rsi,1
SkipSpaces:	; skip spaces of string at rsi
			cmp  byte[rsi],' '
			 je @b
			ret


ParseInteger:	    ; in: rsi string
		    ; out: rax signed integer
		       push  rcx rdx
			xor  ecx,ecx
			xor  eax,eax
			xor  edx,edx
			cmp  byte[rsi],'-'
			 je  .neg
			cmp  byte[rsi],'+'
			 je  .pos
			jmp  .next
	 .neg:		not  rdx
	 .pos:		add  rsi,1
	 .next: 	mov  cl,byte[rsi]
		       test  cl,cl
			 jz  .done
			sub  cl,'0'
			 js  .done
			cmp  cl,9
			 ja  .done
			add  rsi,1
		       imul  rax,10
			add  rax,rcx
			jmp  .next
	.done:		xor  rax,rdx
			sub  rax,rdx
			pop  rdx rcx
			ret





PrintFen:	; in: rcx address of STATE
		;     edx  move number
		; inout: rdi string

		       push  rbp
			mov  rbp,rcx
			mov  r11d,edx

			mov  eax,'fen '
		      stosd

			xor  r8d,r8d
	.loop1:
			xor  ecx,ecx

			xor  r9d,r9d
	 .loop2:
			lea  r10d,[r9+8*r8]
		  int3
		 ;     movzx  edx,byte[rbp+STATE.BOARD_+r10]
		       test  edx,edx
			 jz  .space

			lea  eax,['0'+rcx]
		       test  ecx,ecx
			 jz  @f
		      stosb
		@@:
		  int3
		 ;        bt  qword[rbp+STATE.BPIECES],r10
			adc  edx,edx
		      movzx  eax,byte[.pieces+rdx]
		      stosb

			xor  ecx,ecx

			jmp  .cont
		.space:
			add  ecx,1
		.cont:
			add  r9d,1
			cmp  r9d,8
			 jb  .loop2

			lea  eax,['0'+rcx]
		       test  ecx,ecx
			 jz  @f
		      stosb
		@@:
			mov  al,'/'
		      stosb

			add  r8d,1
			cmp  r8d,8
			 jb  .loop1

			mov  byte[rdi-1],' '
			mov  ax,'w '
			mov  cx,'b '
			cmp  byte[rbp+STATE.SIDE],0
		     cmovne  eax,ecx
		      stosw

		      movzx  ecx,byte[rbp+STATE.CASTLING]
		       test  ecx,ecx
			 jz  .no_castling

			mov  byte[rdi],'K'
			 bt  ecx,0
			adc  rdi,0
			mov  byte[rdi],'Q'
			 bt  ecx,1
			adc  rdi,0
			mov  byte[rdi],'k'
			 bt  ecx,2
			adc  rdi,0
			mov  byte[rdi],'q'
			 bt  ecx,3
			adc  rdi,0
			jmp  .ep

.no_castling:		mov  eax,'-'
		      stosb

.ep:			mov  eax,' '
		      stosb
			bsf  rcx,qword[rbp+STATE.EPSQUARE]
			 jz  .no_ep

			mov  eax,ecx
			and  eax,7
			add  eax,'a'
		      stosb

			mov  eax,ecx
			shr  eax,3
			and  eax,7
			xor  eax,7
			add  eax,'1'
		      stosb
			jmp  .50moves

.no_ep: 		mov  eax,'-'
		      stosb

.50moves:		mov  eax,' '
		      stosb
			mov  eax,dword[rbp+STATE.MOVE50]
		       call  PrintUnsignedInteger

			mov  eax,' '
		      stosb
			lea  eax,[r11+2]
			shr  eax,1
		       call  PrintUnsignedInteger

			xor  eax,eax
		      stosd

			pop  rbp
			ret


.pieces: db '  PpNnBbRrQqKk  '










ParseFEN:	; in: rsi address of fen string
		; inout: rbp address of board position (POS)

		   ; clear position

		       push  rbp
			mov  rax,rbp




			lea  rbp,[StateList]
			mov  qword[rax+POS.STATE_PTR],rbp
			mov  qword[rax+POS.ORG_STATE_PTR],rbp
			mov  dword[rax+POS.MOVE_CT],0
			mov  dword[rax+POS.MOVE_LIST_STRING],0

		       push  rdi
			xor  eax,eax
			mov  ecx,(sizeof.STATE/8)
			mov  rdi,rbp
		  rep stosq
			pop  rdi

		       call  SkipSpaces

			xor  eax,eax
			xor  ecx,ecx
			jmp  .ExpectPiece

.ExpectPieceOrSlash:   test  ecx,7
			jnz  .ExpectPiece
		      lodsb
			cmp  al,'/'
			jne  .Failed
.ExpectPiece:	      lodsb
			mov  edi,STATE.WPIECES
			mov  edx,STATE.WPAWNS
			cmp  al,'P'
			 je  .FoundPiece
			mov  edx,STATE.WKNIGHTS
			cmp  al,'N'
			 je  .FoundPiece
			mov  edx,STATE.WBISHOPS
			cmp  al,'B'
			 je  .FoundPiece
			mov  edx,STATE.WROOKS
			cmp  al,'R'
			 je  .FoundPiece
			mov  edx,STATE.WQUEENS
			cmp  al,'Q'
			 je  .FoundPiece
			mov  edx,STATE.WKING
			cmp  al,'K'
			 je  .FoundPiece
			mov  edi,STATE.BPIECES
			mov  edx,STATE.BPAWNS
			cmp  al,'p'
			 je  .FoundPiece
			mov  edx,STATE.BKNIGHTS
			cmp  al,'n'
			 je  .FoundPiece
			mov  edx,STATE.BBISHOPS
			cmp  al,'b'
			 je  .FoundPiece
			mov  edx,STATE.BROOKS
			cmp  al,'r'
			 je  .FoundPiece
			mov  edx,STATE.BQUEENS
			cmp  al,'q'
			 je  .FoundPiece
			mov  edx,STATE.BKING
			cmp  al,'k'
			 je  .FoundPiece
			sub  eax,'0'
			 js  .Failed
			cmp  eax,8
			 ja  .Failed
.Spaces:		add  ecx,eax
			jmp  .PieceDone
.FoundPiece:		bts  qword[rbp+rdx],rcx
			bts  qword[rbp+rdi],rcx
			sub  edx,edi
			shr  edx,3
			mov  byte[rbp+STATE.BOARD+rcx],dl
			add  ecx,1
.PieceDone:		cmp  ecx,64
			 jb  .ExpectPieceOrSlash
.Turn:		       call  SkipSpaces
		      lodsb
			mov  byte[rbp+STATE.XSIDE],-1

			cmp  al,'b'
			jne  .Castling
			xor  word[rbp+STATE.SIDE],-1

.Castling:	       call  SkipSpaces
		      lodsb
			cmp  al,'-'
			 je  .EpSquare
			cmp  al,'K'
			jne  @f
			 or  byte[rbp+STATE.CASTLING],1
		      lodsb
		 @@:	cmp  al,'Q'
			jne  @f
			 or  byte[rbp+STATE.CASTLING],2
		      lodsb
		 @@:	cmp  al,'k'
			jne  @f
			 or  byte[rbp+STATE.CASTLING],4
		      lodsb
		 @@:	cmp  al,'q'
			jne  @f
			 or  byte[rbp+STATE.CASTLING],8
		 @@:

.EpSquare:	       call  SkipSpaces
			xor  eax,eax
		      lodsb
			cmp  al,'-'
			 je  .FiftyMoves
			sub  al,'a'
			 js  .Failed
			cmp  al,8
			jae  .Failed

			mov  ecx,eax

			xor  eax,eax
		      lodsb
			sub  al,'1'
			 js  .Failed
			cmp  al,8
			jae  .Failed
			xor  eax,7
			shl  eax,3
			 or  eax,ecx
			bts  qword[rbp+STATE.EPSQUARE],rax

.FiftyMoves:	       call  SkipSpaces
		       call  ParseInteger
			mov  dword[rbp+STATE.MOVE50],eax

.MoveNumber:	       call  SkipSpaces
		       call  ParseInteger	 ; do nothing with this integer, don't care about move number


		 ;      call  GetMaterialScores

			 or  eax,-1
			pop  rbp
			ret

.Failed:		xor  eax,eax
			pop  rbp
			ret


if 0
GetMaterialScores: ; in: rbp address of state


			xor  eax,eax
			xor  edx,edx
			xor  ecx,ecx
	    .NextSquare:
		      movzx  r8d,byte[rbp+STATE.BOARD+rcx]
			 bt  qword[rbp+STATE.WPIECES],rcx
			 jc  .WhitePiece
	   .BlackPiece: add  edx,dword[MaterialScores+4*r8]
			jmp  @f
	   .WhitePiece: add  eax,dword[MaterialScores+4*r8]
			@@:
			add  ecx,1
			cmp  ecx,64
			 jb  .NextSquare

			mov  word[rbp+STATE.WMSCORE],ax
			mov  word[rbp+STATE.BMSCORE],dx

			ret
end if
