
		      align  16

CopyPosition:	; in: rdx address of POS to copy
		;     rbp address of destination
		       push  rbx rsi rdi

		; get repeat count
			mov  r9,qword[rdx+POS.ROOT_STATE_PTR]
		      movzx  r9d,byte[r9+STATE.REPEAT]
		       imul  r9d,sizeof.STATE

		; r8  = address of base
		; r9  = address of root
		; r10 = address or curr
		; rsi = address to start copying
		; rcx = number of bytes to transfer
			mov  r8,qword[rbp+POS.BASE_STATE_PTR]
			mov  rsi,qword[rdx+POS.ROOT_STATE_PTR]
			sub  rsi,r9
			add  r9,r8
			mov  rcx,qword[rdx+POS.CURR_STATE_PTR]
			sub  rcx,rsi
			mov  r10,r9
			add  r10,qword[rdx+POS.CURR_STATE_PTR]
			sub  r10,qword[rdx+POS.ROOT_STATE_PTR]

		; copy array of STATEs
			add  ecx,sizeof.STATE
			shr  ecx,3
			mov  rdi,r8
		  rep movsq

		; fill in POS structure
			mov  qword[rbp+POS.BASE_STATE_PTR],r8	; already done
			mov  qword[rbp+POS.ROOT_STATE_PTR],r9
			mov  qword[rbp+POS.CURR_STATE_PTR],r10

			pop  rdi rsi rbx
			ret