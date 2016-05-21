ParseCommandLine:
	       push   rbx rsi rdi
	       call   _GetCommandLine
		mov   rsi, rax


		pop   rdi rsi rbx
		ret