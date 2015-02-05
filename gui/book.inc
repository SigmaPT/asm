LoadBook:	       push  rsi
		     invoke  VirtualFree,qword[OpeningBook],0,MEM_RELEASE
			xor  eax,eax
			mov  qword[OpeningBook],rax
		     invoke  CreateFile,'books\varied.bin',GENERIC_READ,0,0,OPEN_EXISTING,0,0
		       test  rax,rax
			 js  .Failed
			mov  rsi,rax
		     invoke  GetFileSize,rax,0
			mov  qword[OpeningBookSizeB],rax
		     invoke  VirtualAlloc,0,rax,MEM_COMMIT,PAGE_READWRITE
			mov  qword[OpeningBook],rax
		     invoke  ReadFile,rsi,rax,qword[OpeningBookSizeB],Temp,0
		     invoke  CloseHandle,rsi

	; convert to little endian
			mov  rsi,qword[OpeningBook]
			xor  ecx,ecx
	   .convert:	cmp  rcx,qword[OpeningBookSizeB]
			jae  .convert_done

			mov  rax,qword[rsi+rcx+0]
		      bswap  rax
			mov  qword[rsi+rcx+0],rax

			mov  ax,word[rsi+rcx+8]
		       xchg  al,ah
			mov  word[rsi+rcx+8],ax

			mov  ax,word[rsi+rcx+10]
		       xchg  al,ah
			mov  word[rsi+rcx+10],ax

			mov  eax,dword[rsi+rcx+12]
		      bswap  eax
			mov  dword[rsi+rcx+12],eax

			add  rcx,16
			jmp  .convert
.convert_done:

.Failed:
			pop  rsi
			ret




GetBookMove:
		       push  rbx rsi rdi r14 r15
			mov  r15,rsp

			mov   rax, qword [BoardPos+Pos.state]
			mov   rax, qword [rax+State.key]
			xor   rax, qword [Zobrist_side]
			mov   rbx, rax

			mov   rax, 'no book'

			mov   rsi, qword[OpeningBook]
		       test   rsi, rsi
			 jz   .done

			mov   rax, 'no move'
			cmp   dword [BoardPos+Pos.gamePly], 8
			jae   .done

			xor   r14,r14
			xor   ecx,ecx
	    .next:	cmp   rcx, qword [OpeningBookSizeB]
			jae   .select
			cmp   rbx, qword [rsi+rcx+0]
		      movzx   eax, word [rsi+rcx+8]
			jne   @f
		       push   rax
		       push   r14
		      movzx   eax, word [rsi+rcx+10]
			add   r14d, eax
	       @@:	add   rcx, 16
			jmp   .next
	    .select:

			mov   rax, 'no move'
		       test   r14, r14
			 jz   .done

		       call   GetRand_Book

			xor   edx, edx
			div   r14

	.next1: 	mov   rax, 'no move'
			cmp   rsp, r15
			jae   .done

			mov   eax, r14d
			pop   r14
			pop   rcx

			cmp   edx, eax
			jae   .next1
			cmp   edx, r14d
			 jb   .next1

		       call   PolyglotToUci

	    .done:	mov   rsp, r15
			pop   r15 r14 rdi rsi rbx
			ret








PrintBookMoves:
		       push   rbx  r14 r15
			mov   r15, rsp

			mov   rax, qword [BoardPos+Pos.state]
			mov   rax, qword [rax+State.key]
			xor   rax, qword [Zobrist_side]
			mov   rbx, rax

			mov   rsi, qword [OpeningBook]
		       test   rsi, rsi
			 jz   .done

			cmp   dword[BoardPos+Pos.gamePly],8
			jae   .done

			xor  ecx,ecx
	    .next:	cmp  rcx,qword[OpeningBookSizeB]
			jae  .select
			cmp  rbx,qword[rsi+rcx+0]
		      movzx  eax,word[rsi+rcx+8]
		      movzx  edx,word[rsi+rcx+10]
			jne  @f
		       push  rdx
		       push  rax
	       @@:	add  rcx,16
			jmp  .next
	    .select:


	.next1: 	cmp  rsp,r15
			jae  .done

			pop  rcx
		       call  PolyglotToUci

			mov  qword[rdi],rax
			add  rdi,4
			shr  rax,32
			 jz  @f
			add  rdi,1
		@@:
			add  eax,'    '
		      stosd

			pop  rax
		       call  PrintUnsignedInteger

			mov  ax,0x0a0d
		      stosw


			jmp  .next1


	    .done:	mov  rsp,r15
			pop  r15 rsi rbx
			ret


















PolyglotToUci:

xor  eax,eax
			mov  edx,ecx
			shr  edx,0
			and  edx,7
			add  edx,'a'
			shl  edx,8*2
			 or  eax,edx

			mov  edx,ecx
			shr  edx,3
			and  edx,7
			add  edx,'1'
			shl  edx,8*3
			 or  eax,edx

			mov  edx,ecx
			shr  edx,6
			and  edx,7
			add  edx,'a'
			shl  edx,8*0
			 or  eax,edx

			mov  edx,ecx
			shr  edx,9
			and  edx,7
			add  edx,'1'
			shl  edx,8*1
			 or  eax,edx

			mov  edx,ecx
			shr  edx,12
			and  edx,7
		      movzx  edx,byte[.prom+rdx]
			shl  edx,8*4
			 or  rax,rdx

;                      movzx  ecx,byte[rbp+STATE.CASTLING]

			cmp  eax,'e1h1'
			jne  @f
		       test  ecx,1
			 jz  @f
			mov  eax,'e1g1'
		  @@:
			cmp  eax,'e1a1'
			jne  @f
		       test  ecx,2
			 jz  @f
			mov  eax,'e1c1'
		  @@:
			cmp  eax,'e8h8'
			jne  @f
		       test  ecx,4
			 jz  @f
			mov  eax,'e8g8'
		  @@:
			cmp  eax,'e8a8'
			jne  @f
		       test  ecx,8
			 jz  @f
			mov  eax,'e8c8'
		  @@:

			ret

    .prom: db 0,'k','b','r','q',0,0,0