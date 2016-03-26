GetNewTourRand:
		lea  rcx, [Tour.Rand]
	     movdqa  xmm0, dqword[rcx]
	       call  RandShuffle
	     movdqa  dqword[rcx], xmm0
	      rdtsc
		mov  dword[Tour.Rand+2], eax
		ret






InitTour:
		mov  dword[Tour.MaxRounds], 100
		mov  dword[Tour.CurrentRound], 0
		mov  dword[Tour.WPlayerInd], 0
		mov  dword[Tour.BPlayerInd], 0

		mov  rax, 1.0
		xor  ecx, ecx
	@@:	mov  qword[Tour.X+8*rcx], rax
		add  ecx, 1
		cmp  ecx, dword[Tour.PlayerCount]
		 jb  @b

		ret







StartTourGame:
	       push  rbp rsi rdi rbx r15
		mov  ebx, dword[Tour.CurrentRound]
		mov  esi, dword[Tour.WPlayerInd]
		mov  edi, dword[Tour.BPlayerInd]

.Advance:	add  esi, 1
		cmp  esi, dword[Tour.PlayerCount]
		 jb  @f
		xor  esi, esi
		add  edi, 1
		cmp  edi, dword[Tour.PlayerCount]
		 jb  @f
		add  ebx, 1
	       call  GetNewTourRand
		xor  esi, esi
		xor  edi, edi
	@@:	cmp  esi, edi
		 je  .Advance
.AdvanceDone:
		mov  eax, esi
		sub  eax, edi
		cdq
		xor  eax, edx
		sub  eax, edx
		cmp  eax, dword[Tour.PlayerWidth]
		 ja  .Advance


		mov  dword[Tour.CurrentRound], ebx
		mov  dword[Tour.WPlayerInd], esi
		mov  dword[Tour.BPlayerInd], edi
		cmp  ebx, dword[Tour.MaxRounds]
		jae  .Completed

		mov  dword[Tour.GoingQ], -1
		mov  rax, qword[Tour.Time]
		mov  rcx, qword[Tour.Inc]
		mov  qword[TimeWTIME], rax
		mov  qword[TimeBTIME], rax
		mov  qword[TimeWINC], rcx
		mov  qword[TimeBINC], rcx
		mov  qword[InitTimeWTIME], rax
		mov  qword[InitTimeBTIME], rax
		mov  qword[InitTimeWINC], rcx
		mov  qword[InitTimeBINC], rcx

		mov  rcx,qword[Tour.PlayersString+8*rsi]
		mov  r8, qword[Tour.PlayersString+8*rdi]
		mov  edx,dword[Tour.PlayersLength+4*rsi]
		mov  r9d,dword[Tour.PlayersLength+4*rdi]
		add  rdx, rcx
		add  r9, r8
		lea  r10, [szStartFen]
		lea  r11, [Tour.Rand]
	       call  Game_StartNewGame
.done:
		pop  r15 rbx rdi rsi rbp
		ret
.Completed:
		xor  ecx, ecx
		mov  dword[Tour.CurrentRound], ecx
		mov  dword[Tour.GoingQ], ecx
		jmp  .done








macro MatrixEntry a,i,j {
	       imul  a, i, MAX_TOUR_PLAYERS
		add  a, j	  }


UpdateELO:
	       push  rbp rsi rdi rbx r15
		mov  r15d, dword[Tour.PlayerCount]

	; fill in double matrix and dummy 1's
		xor  edi, edi
.loop1a:	xor  esi, esi
.loop1b:	mov  edx, 1
	MatrixEntry  eax, edi, esi
		mov  ecx, dword[Tour.Matrix+4*rax]
		cmp  edi, esi
	      cmove  ecx, edx
	  vcvtsi2sd  xmm0, xmm0, ecx
	     vmovsd  qword[Tour.dMatrix+8*rax], xmm0
		add  esi, 1
		cmp  esi, r15d
		 jb  .loop1b
		add  edi, 1
		cmp  edi, r15d
		 jb  .loop1a

		mov  ebp, 16
.loopMain:
	; y = z = ConstantArray[0.0, n];
	     vxorps  xmm0, xmm0, xmm0
		xor  edi, edi
 .loop2:     vmovsd  qword[Tour.Table1+8*rdi], xmm0
	     vmovsd  qword[Tour.Table2+8*rdi], xmm0
		add  edi, 1
		cmp  edi, r15d
		 jb  .loop2
	; loop over matrix
		xor  edi, edi
.loop3a:	xor  esi, esi
	     vxorps  xmm5, xmm5, xmm5
.loop3b:     vmovsd  xmm3, qword[Tour.X+8*rdi]
	     vmovsd  xmm4, qword[Tour.X+8*rsi]
	     vaddsd  xmm3, xmm3, xmm4
	     vmovsd  xmm6, qword[Tour.Table2+8*rsi]
	MatrixEntry  eax, edi, esi
	     vmovsd  xmm0, qword[Tour.dMatrix+8*rax]
	     vdivsd  xmm0, xmm0, xmm3
	     vmulsd  xmm2, xmm0, xmm4
	     vaddsd  xmm5, xmm5, xmm2
	     vaddsd  xmm6, xmm6, xmm0
	     vmovsd  qword[Tour.Table2+8*rsi], xmm6
		add  esi, 1
		cmp  esi, r15d
		 jb  .loop3b
	     vmovsd  qword[Tour.Table1+8*rdi], xmm5
		add  edi, 1
		cmp  edi, r15d
		 jb  .loop3a
	; x = y / z;
		xor  edi, edi
	     vmovsd  xmm1, qword[Tour.Table1+8*rdi]
	     vdivsd  xmm1, xmm1, qword[Tour.Table2+8*rdi]
 .loop4:     vmovsd  xmm0, qword[Tour.Table1+8*rdi]
	     vdivsd  xmm0, xmm0, qword[Tour.Table2+8*rdi]
	     vminsd  xmm1, xmm1, xmm0
	     vmovsd  qword[Tour.X+8*rdi], xmm0
		add  edi, 1
		cmp  edi, r15d
		 jb  .loop4
		sub  ebp, 1
		jnz  .loopMain

	; x = x / Min[x];
		xor  edi, edi
 .loop5:     vmovsd  xmm0, qword[Tour.X+8*rdi]
	     vdivsd  xmm0, xmm0, xmm1
	     vmovsd  qword[Tour.X+8*rdi], xmm0
	       call  logd
	     vmulsd  xmm0, xmm0, qword[ELOMultiplier]
	  vcvtsd2si  eax, xmm0
		mov  dword[Tour.ELO+4*rdi], eax
		add  edi, 1
		cmp  edi, r15d
		 jb  .loop5

		pop  r15 rbx rdi rsi rbp
		ret





UpdateScore:
		xor  edi, edi
	@@:	mov  dword[Tour.Table1+4*rdi], 0
		mov  dword[Tour.Table2+4*rdi], 0
		add  edi, 1
		cmp  edi, dword[Tour.PlayerCount]
		 jb  @b

		xor  esi, esi
.Loop1: 	xor  edi, edi
 .Loop2:       imul  eax, esi, MAX_TOUR_PLAYERS
		add  eax, edi
		mov  eax, dword[Tour.Matrix+4*rax]
		add  dword[Tour.Table1+4*rsi], eax
		add  dword[Tour.Table2+4*rsi], eax
		add  dword[Tour.Table2+4*rdi], eax
		add  edi, 1
		cmp  edi, dword[Tour.PlayerCount]
		 jb  .Loop2
		add  esi, 1
		cmp  esi, dword[Tour.PlayerCount]
		 jb  .Loop1


		xor  edi, edi
.Loop3: 	xor  eax, eax
		mov  ecx, dword[Tour.Table2+4*rdi]
	       test  ecx, ecx
		 jz  @f
		mov  eax, dword[Tour.Table1+4*rdi]
	       imul  eax, 10000
		xor  edx, edx
		div  ecx
	@@:	mov  dword[Tour.Score+4*rdi], eax
		add  edi, 1
		cmp  edi, dword[Tour.PlayerCount]
		 jb  .Loop3


		ret






UpdateTournamentStats:
	       push  rbp rdi rsi r14 r15

; ecx = 1 for white win
;     = 2 for black win
;     = 0 for draw
		mov  esi, dword[Tour.WPlayerInd]
		mov  edi, dword[Tour.BPlayerInd]
		mov  r8d, dword[UpdateTable+8*rcx]
		mov  r9d, dword[UpdateTable+8*rcx+4]
	       imul  eax, esi, MAX_TOUR_PLAYERS
		add  eax, edi
		add  dword[Tour.Matrix+4*rax], r8d
	       imul  eax, edi, MAX_TOUR_PLAYERS
		add  eax, esi
		add  dword[Tour.Matrix+4*rax], r9d

	       call  UpdateScore
	       call  UpdateELO

		xor  edi, edi
	@@:	mov  dword[Tour.Table1+4*rdi], edi
		add  edi, 1
		cmp  edi, dword[Tour.PlayerCount]
		 jb  @b

		xor  edi, edi
.Sort2: 	mov  esi, 1
.Sort1: 	mov  eax, dword[Tour.Table1+4*(rsi-1)]
		mov  edx, dword[Tour.Table1+4*(rsi)]
		mov  r8d, dword[Tour.ELO+4*rax]
		mov  r9d, dword[Tour.ELO+4*rdx]
		cmp  r8d, r9d
		jbe  @f
		mov  dword[Tour.Table1+4*(rsi-1)], edx
		mov  dword[Tour.Table1+4*(rsi)], eax
	@@:	add  esi, 1
		cmp  esi, dword[Tour.PlayerCount]
		 jb  .Sort1
		add  edi, 1
		cmp  edi, dword[Tour.PlayerCount]
		 jb  .Sort2

		xor  ebp, ebp
.Loop:		mov  esi, dword[Tour.Table1+4*rbp]
		lea  rdi, [Message]
		mov  eax, dword[Tour.Score+4*rsi]
	       call  PrintPercent
		mov  eax, '%  ('
	      stosd
		mov  eax, dword[Tour.ELO+4*rsi]
	       call  PrintUnsignedInteger
		mov  eax, ')  '
	      stosd
		dec  rdi
		lea  rcx, [Message+15]
		mov  al, ' '
	    @@: cmp  rdi, rcx
		 ja  @f
	      stosb
		jmp  @b
		@@:
		mov  rcx, qword[Tour.PlayersString+8*rsi]
		mov  edx, dword[Tour.PlayersLength+4*rsi]
		add  rdx, rcx
		mov  r15, rdx
		mov  r8d, 'NAME'
	       call  Person_GetXXXX
		mov  rdx, rdi
		mov  r8, r15
	       call  Person_CopyUntilEndQuote
		mov  byte[rdx], 0
		lea  rcx, [Message]
	       call  AddLogLine
		add  ebp, 1
		cmp  ebp, dword[Tour.PlayerCount]
		 jb  .Loop
		lea  rdi, [Message]
		mov  rax, 'Round '
	      stosq
		sub  rdi, 2
		mov  eax, dword[Tour.CurrentRound]
	       call  PrintUnsignedInteger
		mov  eax, ':'
	      stosd
		lea  rcx, [Message]
	       call  AddLogLine

		pop  r15 r14 rsi rdi rbp
		ret


