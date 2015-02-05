

EmptyTTEntry = VALUE_NONE shl (8*TTEntry.value)


_HashTable_Probe:
		      align   8
.FoundRefresh:
			mov   rcx, qword [rax]
			and   rcx, 0xFFFFFFFFFFFFFF03
			 or   rcx, r11
			mov   byte [rax+TTEntry.genBound], cl
			 or   edx, -1
if 0
push rsi rdi rbx rcx rdx rax
mov rbx, rcx

lea rdi, [Output]
mov rax, ' tt hit '
stosq
mov  rcx,r8
call PrintAddress
mov rax, '  value '
stosq
mov rax, rbx
sar rax,48
call PrintSignedInteger
mov rax, '   move '
stosq
mov rax, rbx
shr rax, 16
movzx rax, ax
call PrintSignedInteger
mov rax, '  depth '
stosq
mov rax, rbx
shr rax, 8
movzx rax, al
call PrintSignedInteger
mov rax, '  bound '
stosq
mov rax, rbx
and eax, 3
call PrintSignedInteger
mov al, 10
stosb
call _WriteOut_Output


pop rax rdx rcx rbx rdi rsi
end if

;
;11269
;                        mov   rcx, qword [rax]
;                        and   cl, 3
;                         or   cl, r11l
;                        mov   byte [rax+TTEntry.genBound], cl
;                         or   edx, -1


;push rsi rdi rax rcx rdx
;
;lea rdi, [Output]
;mov rax, ' tt hit '
;stosq
;mov  rcx,r8
;call PrintAddress
;mov al, 10
;stosb
;call _WriteOut_Output
;
;
;pop rdx rcx rax rdi rsi
			ret


		      align   8
.Found: 		mov   rcx, EmptyTTEntry
			xor   edx, edx
			ret


		      align   16
HashTable_Probe:
	; in:   rcx  key
	; out:  rax  address of entry
	;       rdx  edx == -1 if found
	;            edx == 0  if not found
	;       rcx  entry (8 bytes)

			mov   rax, qword [hashTable+TT.mask]
			and   rax, rcx
			shl   rax, 5
			mov   r8, rcx
			shr   rcx, 48
			add   rax, qword [hashTable+TT.table]
		      movzx   r11d, byte [hashTable+TT.date]

		  ;      jmp   _HashTable_Probe.Found

			mov   rdx, qword [rax+8*3]
		       test   dx, dx
			 jz   _HashTable_Probe.Found
			cmp   dx, cx
			 je   _HashTable_Probe.FoundRefresh
			shr   rdx, 16
			add   rax, 8
		       test   dx, dx
			 jz   _HashTable_Probe.Found
			cmp   dx, cx
			 je   _HashTable_Probe.FoundRefresh
			shr   rdx, 16
			add   rax, 8
		       test   dx, dx
			 jz   _HashTable_Probe.Found
			cmp   dx, cx
			 je   _HashTable_Probe.FoundRefresh

		  ;      mov   rcx, EmptyTTEntry
		  ;      xor   edx, edx
		  ;      lea   rax, [rax-16]
		  ;      ret

		       push   rax rbx
		      movzx   ecx, word [rax-16+8*2]
		      movzx   ebx, word [rax-16+8*1]
		      movzx   eax, word [rax-16+8*0]
			xor   r10d, r10d

			mov   r8d, 1
			mov   edx, ebx
			and   edx, 0x0FC
			xor   r9d, r9d
			cmp   dl, r11l
			 je   @f
			mov   edx, ebx
			and   edx, 3
			cmp   edx, 3
		       sete   r8b
		@@:	mov   edx, eax
			and   edx, 0x0FC
			cmp   dl, r11l
		       sete   r9l
			sub   r8d, r9d
			cmp   bh, ah
		       setl   r9l
			mov   edx, 1
			cmp   r8l, r9l
		      cmovs   eax, ebx
		      cmovs   r10d, edx

			mov   r8d, 1
			mov   edx, ecx
			and   edx, 0x0FC
			xor   r9d, r9d
			cmp   dl, r11l
			 je   @f
			mov   edx, ecx
			and   edx, 3
			cmp   edx, 3
		       sete   r8l
		@@:	mov   edx, eax
			and   edx, 0x0FC
			cmp   dl, r11l
		       sete   r9l
			sub   r8d, r9d
			cmp   ch, ah
		       setl   r9l
			mov   edx, 2
			cmp   r8l, r9l
		      cmovs   r10d, edx

			pop   rbx rax

			mov   rcx, EmptyTTEntry
			xor   edx, edx
			lea   rax, [rax-16+8*r10]
			ret


