


_ZN6ThreadC2Ev:
		       push   rbp rsi rbx
			mov   rsi, rcx
		       call   _ZN10ThreadBaseC2Ev
			lea   rax, [_ZTV6Thread+10H]
			lea   rbx, [rsi+Thread.splitPoints]
			lea   rbp, [rbx+MAX_SPLITPOINTS_PER_THREAD*sizeof.SplitPoint]
			mov   qword [rsi+Thread.junk], rax
		@@:	lea   rcx, [rbx+SplitPoint.mutex]
		       call   _MutexCreate
			xor   eax, eax
			mov   qword [rbx+SplitPoint.slavesMask+0], rax
			mov   qword [rbx+SplitPoint.slavesMask+8], rax
			add   rbx, sizeof.SplitPoint
			cmp   rbx, rbp
			jnz   @b
			lea   rcx, [rsi+Thread.materialTable]
		     ;  call    _ZN9HashTableIN8Material5EntryELi8192EEC1Ev
			lea   rcx, [rsi+Thread.endgames]
		     ;  call    _ZN8EndgamesC1Ev
			lea   rcx, [rsi+Thread.pawnsTable]
		     ;  call    _ZN9HashTableIN5Pawns5EntryELi16384EEC1Ev
			xor   eax, eax
			mov   qword [rsi+Thread.activePosition], rax
			mov   dword [rsi+Thread.maxPly], eax
			mov   qword [rsi+Thread.activeSplitPoint], rax
			mov   dword [rsi+Thread.splitPointsSize], eax
			mov   byte [rsi+Thread.searching], al
			lea   rdx, [threadPool]
			mov   rax, qword [rdx+ThreadPool.end]
			sub   rax, qword [rdx+ThreadPool.start]
			xor   edx, edx
			mov   ecx, sizeof.Thread
			div   ecx
		     Assert   e, edx, 0, 'weird remainder in _ZN6ThreadC2Ev'
			mov   qword [rsi+Thread.idx], rax
			pop   rbx rsi rbp
			ret



_ZN6Thread9idle_loopEv:

		       int3





_ZN6ThreadD2Ev:
	; rcx: address of thread
		       push    rbp rsi rbx
			lea	rax, [_ZTV6Thread+10H]		    ; 0008 _ 48: 8D. 05, 00000010(rel)
			mov	rbp, rcx				; 000F _ 48: 89. CD
			mov	qword [rcx+Thread.junk], rax			    ; 0012 _ 48: 89. 01
			mov	rcx, qword [rcx+Thread.pawnsTable]		     ; 0015 _ 48: 8B. 89, 00000580
			call	_ZdlPv					; 0021 _ E8, 00000000(rel)
			lea	rcx, [rbp+Thread.endgames]			   ; 0026 _ 48: 8D. 8D, 00000520
			call	_ZN8EndgamesD1Ev			; 002D _ E8, 00000000(rel)
			mov	rcx, qword [rbp+Thread.materialTable]			; 0032 _ 48: 8B. 8D, 00000508
			call	_ZdlPv					; 003E _ E8, 00000000(rel)
			lea	rsi, [rbp+Thread.splitPoints]	; 72                       ; 0043 _ 48: 8D. 75, 48
			lea	rbx, [rsi+MAX_SPLITPOINTS_PER_THREAD*sizeof.SplitPoint]  ; 1288                       ; 0047 _ 48: 8D. 9D, 00000508
			jmp	._056					; 0055 _ EB, 0D
._055:
			sub	rbx, sizeof.SplitPoint				      ; 0057 _ 48: 81. EB, 00000098
			lea	rcx, [rbx+SplitPoint.mutex]			     ; 005E _ 48: 8D. 4B, 38
			call	_MutexDestroy					  ; 0062 _ FF. D7
._056:
			cmp	rbx, rsi				; 0064 _ 48: 39. F3
			jnz	._055					; 0067 _ 75, EE
			mov	rcx, rbp				; 0069 _ 48: 89. E9
			pop	rbx rsi rbp
			jmp	_ZN10ThreadBaseD2Ev


_ZN6ThreadD0Ev:; first calls 1, then deletes self. no need to delete here, so just call 1
_ZN6ThreadD1Ev:
		       push   rdi rsi rbx
			lea   rax, [_ZTV6Thread+10H]		  ; 0007 _ 48: 8D. 05, 00000010(rel)
			mov   rbx, rcx				      ; 000E _ 48: 89. CB
			mov   qword [rcx], rax			      ; 0011 _ 48: 89. 01
			mov   rcx, qword [rcx+580H]		      ; 0014 _ 48: 8B. 89, 00000580
		       call   _ZdlPv
			lea   rcx, [rbx+520H]			      ; 0025 _ 48: 8D. 8B, 00000520
		       call   _ZN8EndgamesD1Ev			      ; 002C _ E8, 00000000(rel)
			mov   rcx, qword [rbx+508H]		      ; 0031 _ 48: 8B. 8B, 00000508
		       call   _ZdlPv
			lea   rdi, [rbx+48H]
			lea   rsi, [rbx+508H]
._0761:
			cmp   rsi, rdi
			 jz   ._0762
			sub   rsi, 152
			lea   rcx, [rsi+38H]
		       call   _MutexDestroy
			jmp   ._0761
._0762:
			lea   rcx, [_ZTV10ThreadBase+10H]
			mov   qword [rbx+Thread.junk], rcx
			mov   rcx, qword [rbx+Thread.sleepCondition]
		       call   _EventDestroy
			lea   rcx, [rbx+Thread.mutex]
			pop   rbx rsi rdi
			jmp   _MutexDestroy



_ZN8EndgamesD1Ev:
			ret









_ZdlPv:
	ret








