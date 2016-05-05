HashTable_Allocate:
	; in:   ecx  size in MB

		       push   rbx rsi rdi

			lea   rsi, [hashTable]

			mov   edx, MAX_HASH_LOG2MB
			xor   eax, eax
			bsr   eax, ecx
			cmp   eax, edx
		      cmova   eax, edx
			xor   ebx, ebx
			bts   rbx, rax
			mov   dword[rsi+TT.sizeMB], ebx

			mov   rcx,qword[rsi+TT.table]
		       call   _VirtualFree

			shl   rbx, 20	; rbx = # of bytes in HashTable
			mov   rcx, rbx
		       call   _VirtualAlloc
			shr   rbx, 5
			sub   rbx, 1
			mov   qword[rsi+TT.table], rax
			mov   qword[rsi+TT.mask], rbx
			mov   byte[rsi+TT.date], 0

			pop   rdi rsi rbx
			ret



HashTable_Clear:
		       push   rdi
			mov   rdi, qword[hashTable+TT.table]
			mov   ecx, dword[hashTable+TT.sizeMB]
			shl   rcx, 20-3
			xor   eax, eax
		  rep stosq
			pop   rdi
			ret


HashTable_Free:
			mov   rcx, qword [hashTable+TT.table]
			jmp   _VirtualFree

