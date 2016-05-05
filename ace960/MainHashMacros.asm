

macro HashTable_Save entry, key16, value, bound, depth, move, ev, t {
local .write_move, .dont_write_move, .replace, .dont_replace

	if value eq edx
	else if value eq 0
	else
	    display 'value argument of HashTable_Save is not edx or 0'
	    display 13,10
	    err
	end if

	if move eq eax
	else if move eq 0
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
		jnz   .write_move
		cmp   key16, word[rcx]
		 je   .dont_write_move
.write_move:
		mov   word[entry+MainHashEntry.move], ax
.dont_write_move:
	      movsx   eax, byte[entry+MainHashEntry.depth]
		sub   eax, 2
    if bound eq 0
    else if bound eq 1
    else if bound eq 2
    else if bound eq 3
		jmp   .replace
    else
		cmp   bound, BOUND_EXACT
		 je   .replace
    end if
		cmp   key16, word[rcx]
		jne   .replace
		cmp   al, depth
		jge   .dont_replace
.replace:
		mov   al, [mainHash.date]
		 or   al, bound
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
.dont_replace:


}

