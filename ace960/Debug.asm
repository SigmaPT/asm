

macro VerboseDisplay m {
; lets not clobber any registers here
local ..message, ..over
 match =1, VERBOSE \{
	       push   rdi rax rcx rdx r8 r9 r10 r11
		lea   rcx, [..message]
		jmp   ..over
   ..message: db m
	      db 10,0
   ..over:
		lea   rdi, [DebugOutput]
	       call   PrintString
		lea   rcx, [DebugOutput]
	       call   _WriteOut
		pop   r11 r10 r9 r8 rdx rcx rax rdi
 \}
}

macro DebugDisplay m {
; lets not clobber any registers here
local ..message, ..over
 match =1, DEBUG \{
	       push   rdi rax rcx rdx r8 r9 r10 r11
		jmp   ..over
   ..message: db m
	      db 10,0
   ..over:
		lea   rdi,[..message]
	       call   _ErrorBox
		pop   r11 r10 r9 r8 rdx rcx rax rdi
 \}
}



macro Assert cc,a,b,m {
; if the assertion succeeds, only the eflags are clobbered
local ..skip, ..errorbox, ..message
 match =1, DEBUG \{
		cmp   a, b
	       j#cc   ..skip
		jmp   ..errorbox

   ..message: db m
	      db 0
   ..errorbox:
		lea   rdi,[..message]
	       call   _ErrorBox
		xor   ecx, ecx
		jmp   _ExitProcess
   ..skip:
 \}
}

macro Profile cc, var {
; do a profile on the conditional jmp j#cc
;  increment  qword[var+0] if the jump is not taken
;  incrememnt qword[var+8] if the jump is taken

match =1, PROFILE \{
	       push   rax rcx
		lea   rcx, [var+8]
	       j#cc   ..TakingJump
		lea   rcx, [var+0]
..TakingJump:
		mov   rax, qword [rcx]
		lea   rax, [rax+1]
		mov   qword [rcx], rax
		pop   rcx rax

 \}
}

