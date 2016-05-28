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




macro HashTable_Save entry, key16, value, bounder, depth, move, ev {
local ..write_move, ..dont_write_move, ..replace, ..dont_replace

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
		mov   rcx, entry
		shr   ecx, 3  -  1
		and   ecx, 3 shl 1
	     Assert   b, ecx, 3 shl 1, 'index 3 in cluster encountered'
		neg   rcx
		lea   rcx, [8*3+3*rcx]
		add   rcx, entry



	       test   eax, eax
		jnz   ..write_move
		cmp   key16, word[rcx]
		 je   ..dont_write_move
..write_move:
match =1, PROFILE \{
lock inc qword[profile.moveStore]
\}
		mov   word[entry+MainHashEntry.move], ax
..dont_write_move:


	      movsx   eax, byte[entry+MainHashEntry.depth]
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
		mov   byte[entry+MainHashEntry.genBound], al
		mov   al, depth
		mov   byte[entry+MainHashEntry.depth], al
    if ev eqtype 0
		mov   word[entry+MainHashEntry.eval], ev
    else
	      movsx   eax, ev
		mov   word[entry+MainHashEntry.eval], ax
    end if
		mov   word[entry+MainHashEntry.value], dx
		mov   word[rcx], key16
..dont_replace:


}


