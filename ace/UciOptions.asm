
UciOptions_Init:
			lea   rax, [uciOptions]
			mov   dword [rax+UciOptions.hash], 16
			mov   dword [rax+UciOptions.multiPv], 1
			mov   dword [rax+UciOptions.minSplitDepth], 0
			mov   dword [rax+UciOptions.threads], 1
			mov   dword [rax+UciOptions.weakness], 0
			ret


ParseSetOption:
		       push   rbx
	.Read:
		       call   SkipSpaces
			cmp   byte[rsi], ' '
			 jb   .Error

		     szcall   CmpString, 'name'
		       test   eax, eax
			 jz   .Error
		       call   SkipSpaces

		     szcall   CmpStringCaseLess, 'Hash'
			lea   rbx, [.Hash]
		       test   eax, eax
			jnz   .CheckValue
		     szcall   CmpStringCaseLess, 'Threads'
			lea   rbx, [.Threads]
		       test   eax, eax
			jnz   .CheckValue
		     szcall   CmpStringCaseLess, 'MultiPv'
			lea   rbx, [.MultiPv]
		       test   eax, eax
			jnz   .CheckValue
		     szcall   CmpStringCaseLess, 'Weakness'
			lea   rbx, [.Weakness]
		       test   eax, eax
			jnz   .CheckValue
.Error:
			lea   rdi, [Output]
		     szcall   PrintString, 'error in reading setoption'
			mov   al, 10
		      stosb
		       call   _WriteOut_Output
			pop   rbx
			ret
.CheckValue:
		       call   SkipSpaces
		     szcall   CmpString, 'value'
		       test   eax, eax
			 jz   .Error
		       call   SkipSpaces
			jmp   rbx

.Hash:
		       call   ParseInteger
	      ClampUnsigned   eax, 1, 1 shl MAX_HASH_LOG2MB
			mov   ecx, eax
			mov   dword [uciOptions+UciOptions.hash], eax
		       call   HashTable_Allocate
			pop   rbx
			ret
.Threads:
		       call   ParseInteger
	      ClampUnsigned   eax, 1, MAX_THREADS
			mov   dword [uciOptions+UciOptions.threads], eax
		       call   _ZN10ThreadPool16read_uci_optionsEv
			pop   rbx
			ret
.MultiPv:
		       call   ParseInteger
	      ClampUnsigned   eax, 1, MAX_MOVES
			mov   dword [uciOptions+UciOptions.multiPv], eax
			pop   rbx
			ret
.Weakness:
		       call   ParseInteger
			mov   dword [uciOptions+UciOptions.weakness], eax
			pop   rbx
			ret

