

; todo: _ZN13TablebaseCore14MaxCardinalityE should be renamed Tablebase_MaxCardinality
; and then _ZN13TablebaseCore14MaxCardinalityE can be elliminated

TableBase_Init:
		sub   rsp, 8*5
	       call   _ZN13TablebaseCore4initEPKc
		mov   eax, dword[_ZN13TablebaseCore14MaxCardinalityE]
		mov   dword[Tablebase_MaxCardinality], eax
		add   rsp, 8*5
		ret



Tablebase_ProbeAB:
	; in: rbp address of position
	;     rbx address of state
	;     ecx  alpha
	;     edx  beta
	;     r8  address of success
	; out: eax v

	       push   rsi rdi r13 r14 r15
virtual at rsp
  .stack rb 64*sizeof.ExtMove
  .localend rb 0
end virtual
.localsize = ((.localend-rsp+15) and (-16))
		sub   rsp, .localsize
		mov   rax, qword[rbx+State.checkersBB]
		mov   r14d, ecx
		mov   r15d, edx
		mov   r13, r8
		lea   rdi, [.stack]
	       test   rax, rax
		jnz   .InCheck
.NotInCheck:   call   Gen_Captures
		lea   rsi, [.stack-8]
		mov   rdx, rdi
.NextMove:	add   rsi, 8
		mov   ecx, dword[rsi+ExtMove.move]
		mov   eax, ecx
		and   eax, 63
	      movzx   eax, byte[rbp+Pos.board+rax]
		cmp   rsi, rdx
		jae   .GenDone
		cmp   ecx, (MOVE_TYPE_PROM+3) shl 12
		 jb   .NextMove
		cmp   ecx, (MOVE_TYPE_PROM+4) shl 12
		jae   .NextMove
	       test   eax, eax
		 jz   .NextMove
		sub   eax, 1 shl 12
	      stosq
		sub   eax, 1 shl 12
	      stosq
		sub   eax, 1 shl 12
	      stosq
		jmp   .NextMove
.InCheck:      call   Gen_Captures
.GenDone:      call   SetCheckInfo

		lea   rsi, [.stack-8]
.MoveLoop:
		add   rsi, 8
		mov   ecx, dword[rsi+ExtMove.move]
		mov   eax, ecx
		and   eax, 63
	      movzx   eax, byte[rbp+Pos.board+rax]
		cmp   rsi, rdi
		jae   .MovesDone
		cmp   ecx, MOVE_TYPE_CASTLE shl 12
		jae   .MoveLoop
	       test   eax, eax
		 jz   .MoveLoop
	       call   Move_IsLegal
		mov   ecx, dword[rsi+ExtMove.move]
	       test   eax, eax
		 jz   .MoveLoop
	       call   Move_GivesCheck
		mov   ecx, dword[rsi+ExtMove.move]
		mov   edx, eax
	       call   Move_Do
		mov   ecx, r15d
		mov   edx, r14d
		neg   ecx
		neg   edx
		mov   r8, r13
	       call   Tablebase_ProbeAB
		neg   eax
	       push   rax
		mov   ecx, dword[rsi+ExtMove.move]
	       call   Move_Undo
		pop   rax
		xor   edx, edx
		cmp   edx, dword[r13]
	      cmove   eax, edx
		 je   .Return	     ; failed
		lea   edx, [rdx+2]
		cmp   eax, r14d
		jle   .MoveLoop
		cmp   eax, r15d
		jge   .Return
		mov   r14d, eax
		jmp   .MoveLoop
.MovesDone:
		mov   rcx, rbp
		mov   rdx, r13
		sub   rsp, 8*4
	       call   _ZN13TablebaseCore15probe_wdl_tableER8PositionPi
		add   rsp, 8*4
		xor   edx, edx
		cmp   edx, dword[r13]
	      cmove   eax, edx
		 je   .Return	     ; failed
		lea   edx, [rdx+1]
		cmp   r14d, eax
		 jl   .Return
		neg   r14d
		sar   r14d, 31
		sub   edx, r14d
.Return:
		mov   dword[r13], edx
		add   rsp, .localsize
		pop   r15 r14 r13 rsi rdi
		ret






Tablebase_ProbeWDL:
	; in: rbp address of position
	;     rbx address of state
	;     rcx  address of success
	; out: eax v
	       push   r15
		mov   dword[rcx], 1	        
		mov   r15, rcx
		mov   r8, rcx
		mov   ecx, -2
		mov   edx, 2
	       call   Tablebase_ProbeAB
		mov   edx, dword[r15]
		cmp   byte[rbx+State.epSquare], 64
		 jb   .HaveEP
.Return1:
		pop   r15
		ret

.HaveEP:
	       test   edx, edx
	      cmovz   eax, edx
		 jz   .Return1
	       push   r14 r13 rsi rdi
virtual at rsp
  .stack rb 192*sizeof.ExtMove
  .localend rb 0
end virtual
.localsize = ((.localend-rsp+15) and (-16))
		sub   rsp, .localsize
		mov   rcx, qword[rbx+State.checkersBB]
		mov   r13d, eax
		mov   r14d, -3
	; r13d = v, r14d = v1
		lea   rdi, [.stack]
	       test   rcx, rcx
		jnz   .InCheck
.NotInCheck:   call   Gen_Captures
		jmp   .GenDone
.InCheck:      call   Gen_Evasions
.GenDone:      call   SetCheckInfo

		lea   rsi, [.stack-8]
.MoveLoop:
		add   rsi, 8
		mov   ecx, dword[rsi+ExtMove.move]
		cmp   rsi, rdi
		jae   .MovesDone
		cmp   ecx, MOVE_TYPE_EPCAP shl 12
		 jb   .MoveLoop
	       call   Move_IsLegal
	       test   eax, eax
		 jz   .MoveLoop
		mov   ecx, dword[rsi+ExtMove.move]
	       call   Move_GivesCheck
		mov   ecx, dword[rsi+ExtMove.move]
		mov   edx, eax
	       call   Move_Do
		mov   ecx, -2
		mov   edx, 2
		mov   r8, r15
	       call   Tablebase_ProbeAB
		neg   eax
	       push   rax
		mov   ecx, dword[rsi+ExtMove.move]
	       call   Move_Undo
		pop   rax
	; eax = v0
		mov   edx, dword[r15]
		cmp   eax, r14d
	      cmovg   r14d, eax
	       test   edx, edx
	      cmovz   eax, edx
		 jz   .Return2
		jmp   .MoveLoop
.MovesDone:
		cmp   r14d, -3
		jle   .Return2_r13d
		cmp   r14d, r13d
	     cmovge   r13d, r14d
		jge   .Return2_r13d
	       test   r13d, r13d
		jnz   .Return2_r13d
	; Check whether there is at least one legal non-ep move.
		lea   rdi, [.stack]
	       call   Gen_Legal
		lea   rsi, [.stack]
		jmp   .CheckLoop
.CheckNext:	mov   ecx, dword[rsi+ExtMove.move]
		cmp   ecx, MOVE_TYPE_EPCAP shl 12
		 jb   .Return2_r13d
		add   rsi, 8
.CheckLoop:	cmp   rsi, rdi
		 jb   .CheckNext
	; If not, then we are forced to play the losing ep capture.
		mov   r13d, r14d
.Return2_r13d:
		mov   eax, r13d
.Return2:
		add   rsp, .localsize
		pop   rdi rsi r13 r14
		pop   r15
		ret



Tablebase_ProbeDTZNoEP:
	; in: rbp address of position
	;     rbx address of state
	;     rcx  address of success
	; out: eax best

	       push   rbx rsi rdi r12 r13 r14 r15

virtual at rsp
  .stack rb 192*sizeof.ExtMove
  .localend rb 0
end virtual
.localsize = ((.localend-rsp+15) and (-16))

		mov   r15, rcx
	; r15 = address of success
		mov   r8, rcx
		mov   ecx, -2
		mov   edx, 2
	       call   Tablebase_ProbeAB
		mov   r14d, eax
	; r14d = wdl
		mov   edx, dword[r15]
	       test   edx, edx
		 jz   .SuccessIs0
	       test   eax, eax
		 jz   .WdlIs0
		cmp   edx, 2
		 je   .SuccessIs2

	       call   SetCheckInfo

		cmp   r14d, 0
		jle   .WdlIsNonpositive
.WdlIsPositive:
	; Generate at least all legal non-capturing pawn moves
	; including non-capturing promotions.
		lea   rdi, [.stack]
	       call   Gen_Legal
		lea   rsi, [.stack-8]
.MoveLoop:
		add   rsi, 8
		mov   ecx, dword[rsi+ExtMove.move]
		mov   eax, ecx
		mov   edx, ecx
		shr   eax, 6
		and   eax, 63
		and   edx, 63
	      movzx   eax, byte[rbp+Pos.board+rax]
	      movzx   edx, byte[rbp+Pos.board+rdx]
		cmp   rsi, rdi
		jae   .MovesDone
		add   rsi, 8
		and   eax, 7
		cmp   ecx, MOVE_TYPE_EPCAP shl 12
		jae   .MoveLoop
		cmp   eax, Pawn
		jne   .MoveLoop
	       test   edx, edx
		jnz   .MoveLoop
	       call   Move_GivesCheck
		mov   ecx, dword[rsi+ExtMove.move]
		mov   edx, eax
	       call   Move_Do
		mov   ecx, -2
		mov   edx, 1
		sub   edx, r14d
		mov   r8, r15
	       call   Tablebase_ProbeAB
		neg   eax
	       push   rax
		mov   ecx, dword[rsi+ExtMove.move]
	       call   Move_Undo
		pop   rax
		mov   edx, dword[r15]
	       test   edx, edx
		 jz   .SuccessIs0
		cmp   eax, r14d
		 je   .VIsWdl
		jmp   .MoveLoop
.MovesDone:
.WdlIsNonpositive:
		sub   rsp, 8*4
		mov   rcx, rbp
		mov   edx, r14d
		mov   r8, r15
	       call   _ZN13TablebaseCore15probe_dtz_tableER8PositioniPi
		add   rsp, 8*4
		mov   edx, dword[r15]
		add   eax, 1
	       test   edx, edx
		 js   Tablebase_ProbeDTZNoEP_SuccessIsNeg
		mov   ecx, r14d
		and   ecx, 1
	       imul   ecx, 100
		add   eax, ecx
		mov   ecx, r14d
		sar   ecx, 31
		xor   eax, ecx
		sub   eax, ecx
.Return:
		add   rsp, .localsize
		pop   r15 r14 r13 r12 rdi rsi rbx
		ret

.VIsWdl:
.SuccessIs2:
		mov   eax, 1
		cmp   r14d, 2
		 je   .Return
		mov   eax, 101
		jmp   .Return
.WdlIs0:
.SuccessIs0:
		xor   eax, eax
		jmp   .Return


Tablebase_ProbeDTZNoEP_SuccessIsNeg:

		cmp   r14d, 0
		jle   Tablebase_ProbeDTZNoEP_SuccessIsNeg_WdlIsNonpositive

Tablebase_ProbeDTZNoEP_SuccessIsNeg_WdlIsPositive:

		mov   r13d, 0x0FFFF
	; r13d = best
		lea   rsi, [Tablebase_ProbeDTZNoEP.stack-8]
.MoveLoop:
		add   rsi, 8
		mov   ecx, dword[rsi+ExtMove.move]
		mov   eax, ecx
		mov   edx, ecx
		shr   eax, 6
		and   eax, 63
		and   edx, 63
	      movzx   eax, byte[rbp+Pos.board+rax]
	      movzx   edx, byte[rbp+Pos.board+rdx]
		cmp   rsi, rdi
		jae   .MovesDone
		and   eax, 7
		;cmp   ecx, MOVE_TYPE_EPCAP shl 12
		;jae   .MoveLoop
		cmp   eax, Pawn
		 je   .MoveLoop
		cmp   ecx, MOVE_TYPE_CASTLE shl 12
		jae   @f
	       test   edx, edx
		jnz   .MoveLoop
	@@:    call   Move_GivesCheck
		mov   ecx, dword[rsi+ExtMove.move]
		mov   edx, eax
	       call   Move_Do
		mov   rcx, r15
	       call   Tablebase_ProbeDTZ
		neg   eax
	       push   rax
		mov   ecx, dword[rsi+ExtMove.move]
	       call   Move_Undo
		pop   rax
		mov   edx, dword[r15]
	       test   edx, edx
		 jz   .SuccessIs0
	       test   eax, eax
		 js   .MoveLoop
		add   eax, 1
		cmp   eax, r13d
	      cmovl   r13d, eax
		jmp   .MoveLoop
.MovesDone:
		mov   eax, r13d
.Return:
		add   rsp, Tablebase_ProbeDTZNoEP.localsize
		pop   r15 r14 r13 r12 rdi rsi rbx
		ret
.SuccessIs0:
		xor   eax, eax
		jmp   .Return


Tablebase_ProbeDTZNoEP_SuccessIsNeg_WdlIsNonpositive:

		 or   r13d, -1
		lea   rdi, [Tablebase_ProbeDTZNoEP.stack]
	       call   Gen_Legal
		lea   rsi, [Tablebase_ProbeDTZNoEP.stack-8]
.MoveLoop:
		add   rsi, 8
		mov   ecx, dword[rsi+ExtMove.move]
		cmp   rsi, rdi
		jae   .MovesDone
	       call   Move_GivesCheck
		mov   ecx, dword[rsi+ExtMove.move]
		mov   edx, eax
	       call   Move_Do
		mov   al, byte[rbx+State.rule50]
	       test   al, al
		jnz   .Rule50IsNot0
		mov   eax, -1
		cmp   r14d, -2
		 je   .ProbeDone
		mov   ecx, 1
		mov   edx, 2
		mov   r8, r15
	       call   Tablebase_ProbeAB
		sub   eax, 2
		neg   eax
		sbb   eax, eax
		and   eax, -101
		jmp   .ProbeDone
.Rule50IsNot0:
		mov   rcx, r15
	       call   Tablebase_ProbeDTZ
		not   eax
.ProbeDone:
	       push   rax
		mov   ecx, dword[rsi+ExtMove.move]
	       call   Move_Undo
		pop   rax
		mov   edx, dword[r15]
	       test   edx, edx
		 jz   .SuccessIs0
		cmp   eax, r13d
	      cmovl   r13d, eax
		jmp   .MoveLoop
.MovesDone:
		mov   eax, r13d
.Return:
		add   rsp, Tablebase_ProbeDTZNoEP.localsize
		pop   r15 r14 r13 r12 rdi rsi rbx
		ret
.SuccessIs0:
		xor   eax, eax
		jmp   .Return


Tablebase_ProbeDTZ:
	; in: rbp address of position
	;     rbx address of state
	;     rcx  address of success
	; out: eax v

	       push   r15
		mov   dword[rcx], 1
		mov   r15, rcx
	       call   Tablebase_ProbeDTZNoEP
		mov   edx, dword[r15]
		cmp   byte[rbx+State.epSquare], 64
		 jb   .HaveEP
.Return:
		pop   r15
		ret

.HaveEP:
	       test   edx, edx
	      cmovz   eax, edx
		 jz   .Return


wdl_to_dtz equ	(((-1 and 255) shl 0)+((-101 and 255) shl 8)+((0 and 255) shl 16)+((101 and 255) shl 24)++((1 and 255) shl 8))

Tablebase_ProbeDTZ_HaveEP:

	       push   rsi rdi r13 r14
virtual at rsp
  .stack rb 192*sizeof.ExtMove
  .localend rb 0
end virtual
.localsize = ((.localend-rsp+15) and (-16))
		sub   rsp, .localsize
		mov   r13d, eax
		mov   r14d, -3
	; r13d = v, r14d = v1
		mov   rcx, qword[rbx+State.checkersBB]
		lea   rdi, [.stack]
	       test   rcx, rcx
		jnz   .InCheck
.NotInCheck:   call   Gen_Captures
		jmp   .GenDone
.InCheck:      call   Gen_Evasions
.GenDone:      call   SetCheckInfo
		lea   rsi, [.stack-8]
.MoveLoop:
		add   rsi, 8
		mov   ecx, dword[rsi+ExtMove.move]
		cmp   rsi, rdx
		jae   .MovesDone
		cmp   ecx, MOVE_TYPE_EPCAP shl 12
		 jb   .MoveLoop
	       call   Move_IsLegal
	       test   eax, eax
		 jz   .MoveLoop
		mov   ecx, dword[rsi+ExtMove.move]
	       call   Move_GivesCheck
		mov   ecx, dword[rsi+ExtMove.move]
		mov   edx, eax
	       call   Move_Do
		mov   ecx, -2
		mov   edx, 2
		mov   r8, r15
	       call   Tablebase_ProbeAB
		neg   eax
	       push   rax
		mov   ecx, dword[rsi+ExtMove.move]
	       call   Move_Undo
		pop   rax
		mov   edx, dword[r15]
	       test   edx, edx
		 jz   .SuccessIs0
		cmp   eax, r14d
	      cmovg   r14d, eax
		jmp   .MoveLoop
.MovesDone:
		mov   eax, r13d
		cmp   r14d, -3
		jle   .Return

		mov   rdx, wdl_to_dtz
		lea   ecx, [8*(r14+2)]
		shr   rdx, cl
	      movsx   r14d, dl
		cmp   eax, -100
		 jl   .VLessm100
		cmp   eax, 0
		 jl   .VLess0
		cmp   eax, 100
		 jg   .VGreater100
		cmp   eax, 0
		 jg   .VGreater0
	       test   r14d, r14d
		jns   .V1GreaterEqual0

		lea   rsi, [.stack-8]
.CaptureLoop:
		add   rsi, 8
		mov   ecx, dword[rsp+ExtMove.move]
		cmp   rsi, rdi
		jae   .CheckQuiets
		cmp   ecx, MOVE_TYPE_EPCAP shl 12
		jae   .CaptureLoop
	       call   Move_IsLegal
	       test   eax, eax
		jnz   .Return_v
		jmp   .CaptureLoop

.CheckQuiets:
	; we get here when there isn't a legal non-ep capture
		mov   rcx, qword[rbx+State.checkersBB]
	       test   rcx, rcx
		jnz   .Return_v
		lea   rdi, [.stack]
	       call   Gen_Quiets
		lea   rsi, [.stack-8]
.QuietLoop:
		add   rsi, 8
		mov   ecx, dword[rsp+ExtMove.move]
		mov   eax, r14d   ;return r14d = v1 if no legal moves here
		cmp   rsi, rdi
		jae   .Return
	       call   Move_IsLegal
	       test   eax, eax
		jnz   .Return_v
		jmp   .CaptureLoop


.VGreater0:
		cmp   r14d, 1
	      cmove   eax, r14d
		jmp   .Return
.VGreater100:
		cmp   r14d, 0
	      cmovg   eax, r14d
		jmp   .Return
.VLess0:
	       test   r14d, r14d
	     cmovns   eax, r14d
		cmp   r14d, -100
	      cmovl   eax, r14d
		jmp   .Return
.VLessm100:
	       test   r14d, r14d
	     cmovns   eax, r14d
		jmp   .Return
.V1GreaterEqual0:
		mov   eax, r14d
.Return:
		add   rsp, .localsize
		pop   r14 r13 rdi rsi
		pop   r15
		ret

.SuccessIs0:
		xor   eax, eax
		jmp   .Return

.Return_v:
		mov   eax, r13d
		jmp   .Return




Tablebase_RootProbe:
	; in: rbp address of position
	;     rbx address of state
	; out: eax bool
	;          score is in Tablebase_Score

	       push   rbx rsi rdi r12 r13 r14 r15
virtual at rsp
  .success rd 1
	   rd 1
  .mlist  rb MAX_MOVES*sizeof.ExtMove
  .localend rb 0
end virtual
.localsize = ((.localend-rsp+15) and (-16))
		sub   rsp, .localsize

		lea   rcx, [.success]
	       call   Tablebase_ProbeDTZ
		mov   edx, dword[.success]
		mov   r15d, eax
	; r15d = dtz
	       test   edx, edx
	      cmovz   eax, edx
		jmp   .Return

	       call   SetCheckInfo

		mov   r12, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
.RootMoveLoop:
		cmp   r12, qword[rbp+Pos.rootMovesVec+RootMovesVec.ender]
		jae   .RootMovesDone

		mov   ecx, dword[r12+RootMove.pv+4*0]
	       call   Move_GivesCheck
		mov   ecx, dword[r12+RootMove.pv+4*0]
		mov   edx, eax
	       call   Move_Do

		mov   rcx, qword[rbx+State.checkersBB]
		xor   esi, esi
	; esi = v
	       test   rcx, rcx
		jnz   @f
		lea   rdi, [.mlist]
	       call   Gen_Legal
		lea   rax, [.mlist]
		cmp   rax, rdi
		jne   @f
		mov   esi, 1
	@@:

	       test   esi, esi
		jnz   .UndoMove

		lea   rcx, [.success]
		cmp   byte[rbx+State.rule50], 0
		 je   .Rule50Is0
.Rule50IsNot0:
	       call   Tablebase_ProbeDTZ
		mov   esi, eax
		neg   esi
		lea   eax, [rsi+1]
		cmp   esi, 0
	      cmovg   esi, eax
		lea   eax, [rsi-1]
	       test   esi, esi
	      cmovs   esi, eax
		jmp   .UndoMove
.Rule50Is0:
	       call   Tablebase_ProbeWDL
		neg   eax
		lea   ecx, [8*(rax+2)]
		mov   rsi, wdl_to_dtz
		shr   rsi, cl
	      movsx   esi, sil
.UndoMove:
		mov   ecx, dword[r12+RootMove.pv+4*0]
	       call   Move_Undo
		mov   edx, dword[.success]
	       test   edx, edx
	      cmovz   eax, edx
		jmp   .Return
		mov   dword[r12+RootMove.score], esi
		add   r12, sizeof.RootMove
		jmp   .RootMoveLoop
.RootMovesDone:

	      movzx   r14d, byte[rbx+State.rule50]
	; r14d = cnt50
		xor   esi, esi
	; esi = wdl

		mov   eax, r14d
		cmp   r15d, 0
		 jg   .DtzPos
		mov   edi, -1
		mov   ecx, -2
		sub   eax, r15d
		cmp   eax, 100
	     cmovle   edi, ecx
		jmp   @f
.DtzPos:
		mov   edi, 1
		mov   ecx, 2
		add   eax, r15d
		cmp   eax, 100
	     cmovle   edi, ecx
@@:
	; edi = wdl

		mov   eax, dword[wdl_to_Value5+4*(rdi+2)]
	; eax = score
.TestA:
		cmp   edi, 1
		jne   .TestB
		cmp   r15d, 100
		 jg   .TestB
		mov   eax, 200
		sub   eax, r15d
		sub   eax, r14d
		mov   ecx, PawnValueEg
	       imul   eax, ecx
		cdq
		mov   ecx, 200
	       idiv   ecx
		jmp   .TestDone
.TestB:
		cmp   edi, -1
		jne   .TestDone
		cmp   r15d, -100
		 jl   .TestDone
		mov   eax, 200
		add   eax, r15d
		sub   eax, r14d
		mov   ecx, PawnValueEg
	       imul   eax, ecx
		cdq
		mov   ecx, 200
	       idiv   ecx
		neg   eax
.TestDone:
		mov   dword[Tablebase_Score], eax



		mov   rdi, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
		cmp   r15d, 0
		 jg   .Winning
		 jl   .Losing

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.Drawing:
		lea   rsi, [rdi-sizeof.RootMove]
.Drawing1:
		add   rsi, sizeof.RootMove
.Drawing1a:
		cmp   rsi, qword[rbp+Pos.rootMovesVec+RootMovesVec.ender]
		jae   .Drawing1Done
		mov   eax, dword[rsi+RootMove.score]
	       test   eax, eax
		jnz   .Drawing1
		mov   ecx, sizeof.RootMove
	  rep movsb
		jmp   .Drawing1a
.Drawing1Done:

;;;;;;;;;;;;;;;;;;;;;;;;;
.Resize:
		mov   qword[rbp+Pos.rootMovesVec+RootMovesVec.ender], rdi

.ReturnTrue:
		 or   eax, -1
.Return:
		add   rsp, .localsize
		pop   r15 r14 r13 r12 rdi rsi rbx
		ret


;;;;;;;;;;;;;;;;;;;;;;;;
.Winning:
		mov   r12d, 0x0FFFF
	; r12d = best
		lea   rsi, [rdi-sizeof.RootMove]
.Winning1:
		add   rsi, sizeof.RootMove
		cmp   rsi, qword[rbp+Pos.rootMovesVec+RootMovesVec.ender]
		jae   .Winning1Done
		mov   eax, dword[rsi+RootMove.score]
		cmp   eax, 0
		jle   .Winning1
		cmp   eax, r12d
		jge   .Winning1
		mov   r12d, eax
		jmp   .Winning1
.Winning1Done:
		mov   r13d, r12d
	; r13d = max

		lea   eax, [r12+r14]
		cmp   eax, 99
		 jg   .WinningDontMax

		mov   r8, rbx
	; r8 = st
 .WinningLoop:
		mov   ecx, 4
	; ecx = i
	      movzx   edx, byte[r8+State.rule50]
	      movzx   eax, byte[r8+State.pliesFromNull]
		cmp   edx, eax
	      cmova   edx, eax
		lea   r9, [r8-2*sizeof.State]
	; r9 = *stp = st->previous->previous
		cmp   edx, ecx
		 jb   .WinningDoMax
  .WinningStateLoop:
		sub   r9, 2*sizeof.State
		mov   rax, qword[r9+State.key]
		cmp   rax, qword[r8+State.key]
		 je   .WinningDontMax
		add   ecx, 2
		cmp   ecx, edx
		jbe   .WinningStateLoop
		sub   r8, 1*sizeof.State
		jmp   .WinningLoop
.WinningDoMax:
		mov   r13d, 99
		sub   r13d, r14d
.WinningDontMax:

		lea   rsi, [rdi-sizeof.RootMove]
.Winning2:
		add   rsi, sizeof.RootMove
.Winning2a:
		cmp   rsi, qword[rbp+Pos.rootMovesVec+RootMovesVec.ender]
		jae   .Winning2Done
		mov   eax, dword[rsi+RootMove.score]
		cmp   eax, 0
		jle   .Winning2
		cmp   eax, r13d
		jge   .Winning2
		mov   ecx, sizeof.RootMove
	  rep movsb
		jmp   .Winning2a
.Winning2Done:
		jmp   .Resize

;;;;;;;;;;;;;;;;;;;;;;;;;;;
.Losing:
		xor   edx, edx
	; edx = best
		lea   rsi, [rdi-sizeof.RootMove]
.Losing1:
		add   rsi, sizeof.RootMove
		cmp   rsi, qword[rbp+Pos.rootMovesVec+RootMovesVec.ender]
		jae   .Losing1Done
		mov   eax, dword[rsi+RootMove.score]
		cmp   eax, edx
	      cmovl   edx, eax
		jmp   .Losing1
.Losing1Done:

		mov   eax, r14d
		sub   eax, edx
		sub   eax, edx
		cmp   eax, 100
		 jl   .ReturnTrue

		lea   rsi, [rdi-sizeof.RootMove]
.Losing2:
		add   rsi, sizeof.RootMove
.Losing2a:
		cmp   rsi, qword[rbp+Pos.rootMovesVec+RootMovesVec.ender]
		jae   .Losing2Done
		mov   eax, dword[rsi+RootMove.score]
		cmp   eax, edx
		jne   .Losing2
		mov   ecx, sizeof.RootMove
	  rep movsb
		jmp   .Losing2a
.Losing2Done:
		jmp   .Resize







Tablebase_RootProbeWDL:
	; in: rbp address of position
	;     rbx address of state
	; out: eax bool
	;          score is in Tablebase_Score

	       push   rsi rdi r15
virtual at rsp
  .success rd 1
	   rd 1
  .localend rb 0
end virtual
.localsize = ((.localend-rsp+15) and (-16))
		sub   rsp, .localsize

		lea   rcx, [.success]
	       call   Tablebase_ProbeWDL
		mov   edx, dword[.success]
	       test   edx, edx
	      cmovz   eax, edx
		 jz   .Return
		mov   eax, dword[wdl_to_Value5+4*rax]
		mov   dword[Tablebase_Score], eax

		mov   r15d, -2
	; r15d = best

		mov   rsi, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
.RootMoveLoop:
		cmp   rsi, qword[rbp+Pos.rootMovesVec+RootMovesVec.ender]
		jae   .RootMovesDone
		mov   ecx, dword[rsi+RootMove.pv+4*0]
	       call   Move_GivesCheck
		mov   ecx, dword[rsi+RootMove.pv+4*0]
		mov   edx, eax
	       call   Move_Do
		lea   rcx, [.success]
	       call   Tablebase_ProbeWDL
		neg   rax
		mov   edi, eax
		mov   ecx, dword[rsi+RootMove.pv+4*0]
	       call   Move_Undo
		mov   edx, dword[.success]
	       test   edx, edx
	      cmovz   eax, edx
		 jz   .Return
		cmp   edi, r15d
	      cmovg   r15d, edi
		jmp   .RootMoveLoop
.RootMovesDone:

		mov   rdi, qword[rbp+Pos.rootMovesVec+RootMovesVec.table]
		lea   rsi, [rdi-sizeof.RootMove]
.Copy:
		add   rsi, sizeof.RootMove
.Copya:
		cmp   rsi, qword[rbp+Pos.rootMovesVec+RootMovesVec.ender]
		jae   .CopyDone
		mov   eax, dword[rsi+RootMove.score]
		cmp   eax, r15d
		jne   .Copy
		mov   ecx, sizeof.RootMove
	  rep movsb
		jmp   .Copya
.CopyDone:
		mov   qword[rbp+Pos.rootMovesVec+RootMovesVec.ender], rdi
		 or   eax, -1
.Return:
		sub   rsp, .localsize
		pop   r15 rdi rsi
		ret















