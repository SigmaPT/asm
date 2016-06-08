;
;macro HashTable_Save entry, key16, value, bound, depth, move, ev {
;local .Skip, .indok
;
;        if value eq edx
;        else if value eq 0
;        else
;            display 'value argument of HashTable_Save is not edx or 0'
;            display 13,10
;            err
;        end if
;
;        if move eq eax
;        else if move eq 0
;        else
;            display 'move argument of HashTable_Save is not eax or 0'
;            display 13,10
;            err
;        end if
;                        mov   rcx, entry
;                        shr   ecx, 3  -  1
;                        and   ecx, 3 shl 1
;                     Assert   b, ecx, 3 shl 1, 'index 3 in cluster encountered'
;                        neg   rcx
;                        lea   rcx, [8*3+3*rcx]
;                        add   rcx, entry
;        if value eq 0
;            if ev eq 0
;                        xor   edx, edx
;            else
;                      movzx   edx, ev
;                        shl   rdx, 32
;            end if
;        else
;            if ev eq 0
;                        shl   rdx, 48
;            else
;                        shl   edx, 16
;                        mov   dx, ev
;                        shl   rdx, 32
;            end if
;        end if
;        if move eq 0
;                        xor   eax, eax
;        else
;                       test   eax, eax
;                        jnz   .Skip
;        end if
;                        cmp   key16, word [rcx]
;                      cmove   eax, dword [entry+MainHashEntry.move]
;.Skip:
;
;                        shl   eax, 16
;                        mov   al, byte[mainHash.date]
;                         or   al, bound
;                        mov   ah, depth
;
;                         or   rax, rdx
;                        mov   qword [entry], rax
;                        mov   word [rcx], key16
;}




macro HashTable_Save entr, key16, value, bounder, depth, move, ev {
local ..write_move, ..dont_write_move, ..replace, ..dont_replace


match =2, VERBOSE \{
mov qword[Verbr15], r15
mov r15w, key16
push rdi rsi rax rcx rdx r8 r9 r10 r11
lea  rdi, [Output]
szcall PrintString, 'tt save key='

movzx rax, r15w
call PrintUnsignedInteger
call _WriteOut_Output
pop r11 r10 r9 r8 rdx rcx rax rsi rdi

mov r15d, move
push rdi rsi rax rcx rdx r8 r9 r10 r11
lea  rdi, [Output]
szcall PrintString, ' move='
mov ecx, r15d
xor edx, edx
call PrintUciMove
call _WriteOut_Output
pop r11 r10 r9 r8 rdx rcx rax rsi rdi

mov r15d, value
push rdi rsi rax rcx rdx r8 r9 r10 r11
lea  rdi, [Output]
szcall PrintString, ' value='
movsxd rax, r15d
call PrintSignedInteger
call _WriteOut_Output
pop r11 r10 r9 r8 rdx rcx rax rsi rdi


    if ev eqtype 0
		mov   r15d, ev
    else
	      movsx   r15d, ev
    end if


push rdi rsi rax rcx rdx r8 r9 r10 r11
lea  rdi, [Output]
szcall PrintString, ' eval='
movsxd rax, r15d
call PrintSignedInteger
call _WriteOut_Output
pop r11 r10 r9 r8 rdx rcx rax rsi rdi

    if depth eqtype 0
		mov   r15d, depth
    else
	      movsx   r15d, depth
    end if

push rdi rsi rax rcx rdx r8 r9 r10 r11
lea  rdi, [Output]
szcall PrintString, ' depth='
movsxd rax, r15d
call PrintSignedInteger
mov al, '|'
stosb
call _WriteOut_Output
pop r11 r10 r9 r8 rdx rcx rax rsi rdi

mov r15, qword[Verbr15]

\}




	if value eq edx
	else if value eq 0
		xor   edx, edx
	else
	    display 'value argument of HashTable_Save is not edx or 0'
	    display 13,10
	    err
	end if

	if move eq eax
	else if move eq 0
		xor   eax, eax
	else
	    display 'move argument of HashTable_Save is not eax or 0'
	    display 13,10
	    err
	end if
		mov   rcx, entr
		shr   ecx, 3  -  1
		and   ecx, 3 shl 1
	     Assert   b, ecx, 3 shl 1, 'index 3 in cluster encountered'
		neg   rcx
		lea   rcx, [8*3+3*rcx]
		add   rcx, entr



	       test   eax, eax
		jnz   ..write_move
		cmp   key16, word[rcx]
		 je   ..dont_write_move
..write_move:
match =1, PROFILE \{
lock inc qword[profile.moveStore]
\}
		mov   word[entr+MainHashEntry.move], ax
..dont_write_move:


	      movsx   eax, byte[entr+MainHashEntry.depth]
		sub   eax, 2
		cmp   key16, word[rcx]
		jne   ..replace
		cmp   al, depth
		 jl   ..replace
		mov   al, bounder
		cmp   al, BOUND_EXACT
		 je   ..replace
		jmp   ..dont_replace

..replace:
		mov   al, [mainHash.date]
		 or   al, bounder
		mov   byte[entr+MainHashEntry.genBound], al
		mov   al, depth
		mov   byte[entr+MainHashEntry.depth], al
    if ev eqtype 0
		mov   word[entr+MainHashEntry.eval], ev
    else
	      movsx   eax, ev
		mov   word[entr+MainHashEntry.eval], ax
    end if
		mov   word[entr+MainHashEntry.value], dx
		mov   word[rcx], key16
..dont_replace:


}


