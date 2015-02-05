






if 0

asdfSetUpGame:

.White:
			lea  rdi,[Message]

			mov  al,179
			mov  ah,' '
		      stosw

			mov  rax,'Human'
			mov  qword[rdi],rax
			add  rdi,5

			cmp  byte[WhiteCompQ],0
			 jz  @f
			sub  rdi,5
			lea  rsi,[Engine1_Name]
		       call  Append
		  @@:
			mov  eax,0x0a0d
		      stosw

			mov  ebx,dword[TimeWTIME]
		       test  ebx,ebx
			 js  @f
			cmp  byte[rbp+STATE.SIDE],0
			jne  @f
			cmp  byte[rbp+STATE.RESULT],0
			jne  @f
			add  ebx,dword[TimeSAVE]
		     invoke  GetTickCount
			sub  ebx,eax
		@@:	mov  eax,ebx
		       call  PrintTime
			mov  byte[rdi],0


	      ;       invoke  SendMessage,[hWhiteWindow],WM_SETTEXT,0,Message

.Black:
			lea  rdi,[Message]

			mov  al,176
			mov  ah,' '
		      stosw

			mov  rax,'Human'
			mov  qword[rdi],rax
			add  rdi,5

			cmp  byte[BlackCompQ],0
			 jz  @f
			sub  rdi,5
			lea  rsi,[Engine2_Name]
		       call  Append
		  @@:
			mov  eax,0x0a0d
		      stosw

			mov  ebx,dword[TimeBTIME]
		       test  ebx,ebx
			 js  @f
			cmp  byte[rbp+STATE.XSIDE],0
			jne  @f
			cmp  byte[rbp+STATE.RESULT],0
			jne  @f
			add  ebx,dword[TimeSAVE]
		     invoke  GetTickCount
			sub  ebx,eax
		@@:	mov  eax,ebx
		       call  PrintTime
			mov  byte[rdi],0

	       ;      invoke  SendMessage,[hBlackWindow],WM_SETTEXT,0,Message

.Done:


			pop  r15 rbx rdi rsi rbp
			ret

end if

SetInitFromTime:
			mov  eax,dword[Time_TIME+8*White]
			mov  dword[InitTimeWTIME],eax
			mov  eax,dword[Time_TIME+8*Black]
			mov  dword[InitTimeBTIME],eax
			mov  eax,dword[Time_INC+8*White]
			mov  dword[InitTimeWINC],eax
			mov  eax,dword[Time_INC+8*Black]
			mov  dword[InitTimeBINC],eax
			ret

SetTimeFromInit:
			mov  eax,dword[InitTimeWTIME]
			mov  dword[Time_TIME+8*White],eax
			mov  eax,dword[InitTimeBTIME]
			mov  dword[Time_TIME+8*Black],eax
			mov  eax,dword[InitTimeWINC]
			mov  dword[Time_INC+8*White],eax
			mov  eax,dword[InitTimeBINC]
			mov  dword[Time_INC+8*Black],eax
			ret

















StopEngines:
		       push  rbp rdi rsi

  irps i, 1 2 3 4 {
			mov  byte[Engine#i#_GoingQ],0

			lea  rdi,[Engine#i#_InputBuffer]
			lea  rsi,[szCmdStop]
		       call  AppendNewLine

			lea  rdx,[Engine#i#_InputBuffer]
			mov  r8,rdi
			sub  r8,rdx
		     invoke  WriteFile,qword[Engine#i#_In_Write],rdx,r8,temp,NULL
    }
			pop  rsi rdi rbp
			ret









MakeThinkString:       push  rdi

			lea  rdi,[szCmdThink]
			mov  eax,'go '
		      stosd
			sub  rdi,1

			mov  rax,'wtime '
		      stosq
			sub  rdi,2
			mov  rax, qword [Time_TIME+8*White]
			mov  ecx,200
			cmp  rax,rcx
		      cmovl  rax,rcx
		       call  PrintUnsignedInteger
			mov  al,' '
		      stosb

			mov  rax,'winc '
		      stosq
			sub  rdi,3
			mov  eax,dword[Time_INC+8*White]
		       call  PrintUnsignedInteger
			mov  al,' '
		      stosb

			mov  rax,'btime '
		      stosq
			sub  rdi,2
			mov  rax,qword[Time_TIME+8*Black]
			mov  ecx,200
			cmp  rax,rcx
		      cmovl  rax,rcx
		       call  PrintUnsignedInteger
			mov  al,' '
		      stosb

			mov  rax,'binc '
		      stosq
			sub  rdi,3
			mov  eax,dword[Time_INC+8*Black]
		       call  PrintUnsignedInteger
			mov  al,' '
		      stosb


			mov   byte [rdi],0

			pop   rdi
			ret



UpdateEngineMove:

	; out: rax tick just after engine has been sent go cmd

		       push  rbp rdi rsi rbx r15
   irps i, 1 2 3 4 {
			mov   byte [Engine#i#_GoingQ], 0
			lea   rcx, [Engine#i#_BoardPos]
			lea   rdx, [Engine#i#_StateList]
			lea   r8, [BoardPos]
		       call   CopyPosExToThread
		}

			lea   rbp, qword [BoardPos]
			mov   rax, qword [rbp+PosEx.move]

			cmp   byte [rax+MoveData.result], 0
			jne   .Done

		       call  GetBookMove
		      ;  mov   eax, 'no'
			mov   rbx,rax


		       call   MakeThinkString

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      .Engine1: 	cmp   byte [WhiteCompQ], 0
			 jz   .Engine2
			cmp   byte [rbp+Pos.sideToMove], 0
			jne   .NoEngine1
			cmp   bx, 'no'
			jne   .Engine1Book
			lea   rcx, [Engine1]
		       call   Engine_UpdatePlayer
			jmp   .Engine2

      .Engine1Book:	mov   qword [Engine1_BookMove], rbx
			jmp   .Engine2

      .NoEngine1:	lea   rcx, [Engine1]
		       call   Engine_Stop



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      .Engine2: 	cmp   byte [BlackCompQ], 0
			 jz   .Engine3
			cmp   byte [rbp+Pos.sideToMove], 0
			 je   .NoEngine2
			cmp   bx, 'no'
			jne   .Engine2Book
			lea   rcx, [Engine2]
		       call   Engine_UpdatePlayer
			jmp   .Engine3

      .Engine2Book:	mov   qword [Engine2_BookMove], rbx
			jmp   .Engine3

      .NoEngine2:	lea   rcx,[Engine2]
		       call   Engine_Stop


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      .Engine3:
		; get the time after engines 1 and 2 have been updated
		     invoke   GetTickCount
			mov   r15, rax

			lea   rcx, [Engine3]
			cmp   dword [rcx-Engine1+Engine1_On], 0
			 je   .Engine4
		       call   Engine_UpdateKibitzer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      .Engine4:
			lea   rcx,[Engine4]
			cmp   dword [rcx-Engine1+Engine1_On], 0
			 je   .Engine5
		       call   Engine_UpdateKibitzer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      .Engine5:
		       call   Coach_Update
      .Done:
			mov   rax, r15
			pop   r15 rbx rsi rdi rbp
			ret








TurnOnKibitzer:    ; rcx index of personality

		       push  rbp rsi rdi rbx r13 r14 r15

			lea  rbp, [BoardPos]

			mov  r14,rcx

    ; engine 3  (first kibitzer)

			cmp  dword[Engine3_On],0
			 je  .alreadyoff

			lea  rcx,[Engine3]
		       call  Engine_Quit

       .alreadyoff:
			lea  rcx,[Engine3]
		       call  Engine_ClearOutput
		; check type
			cmp  r14d,0
			 je  .Done

		; get name
			mov  ecx,r14d
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,eax
			lea  rdx,[Engine3_Name]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		; get ex string
			mov  ecx,ebx
			mov  edx,'PATH'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Engine3_String]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0

		; start engine
			lea  rcx,[Engine3]
			mov  dword[rcx-Engine1+Engine1_KibitzPVCount],1
			mov  byte[rcx-Engine1+Engine1_UploadQ],-1
		       call  _Engine_Start

			lea  rcx,[Engine3]
		       call  Engine_UCI

			mov  r15d,ebx
     .loop_optn3:
			mov  ecx,r15d
			mov  edx,'OPTN'
		       call  PersonGetXXXXFromNAME
			mov  r15d,eax
			mov  ecx,eax
		       test  eax,eax
			 js  .skip_optn3

			lea  rdi,[Engine3_InputBuffer]
		       call  CopyUntilEndQuoteWithNewLine

			lea  rdx,[Engine3_InputBuffer]
			mov  r8,rdi
			sub  r8,rdx
		     invoke  WriteFile,qword[Engine3_In_Write],rdx,r8,temp,NULL

			jmp  .loop_optn3
     .skip_optn3:

			lea  rcx,[Engine3]
		       call  Engine_Position

		 ; go ?
			mov   rax, qword [rbp+PosEx.move]
			cmp   byte [rax+MoveData.result], 0
			jne   @f
			lea   rcx, [Engine3]
		       call   Engine_GoInfinite
			mov   byte [Engine3_GoingQ], -1
		@@:

.Done:
			pop  r15 r14 r13 rbx rdi rsi rbp
			ret




TurnOnSecondKibitzer:	 ; rcx index of personality

		       push  rbp rsi rdi rbx r13 r14 r15

			lea  rbp, [BoardPos]

			mov  r14,rcx

    ; engine 3  (first kibitzer)

			cmp  dword[Engine4_On],0
			 je  .alreadyoff

			lea  rcx,[Engine4]
		       call  Engine_Quit

       .alreadyoff:
			lea  rcx,[Engine4]
		       call  Engine_ClearOutput
		; check type
			cmp  r14d,0
			 je  .Done
		; get name
			mov  ecx,r14d
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,eax
			lea  rdx,[Engine4_Name]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		; get ex string
			mov  ecx,ebx
			mov  edx,'PATH'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Engine4_String]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		; make command

			lea  rcx,[Engine4]
			mov  dword[rcx-Engine1+Engine1_KibitzPVCount],1
			mov  byte[rcx-Engine1+Engine1_UploadQ],-1
		       call  _Engine_Start

			lea  rcx,[Engine4]
		       call  Engine_UCI

			mov  r15d,ebx
     .loop_optn4:
			mov  ecx,r15d
			mov  edx,'OPTN'
		       call  PersonGetXXXXFromNAME
			mov  r15d,eax
			mov  ecx,eax
		       test  eax,eax
			 js  .skip_optn4

			lea  rdi,[Engine4_InputBuffer]
		       call  CopyUntilEndQuoteWithNewLine

			lea  rdx,[Engine4_InputBuffer]
			mov  r8,rdi
			sub  r8,rdx
		     invoke  WriteFile,qword[Engine4_In_Write],rdx,r8,temp,NULL

			jmp  .loop_optn4
     .skip_optn4:

			lea  rcx,[Engine4]
		       call  Engine_Position
		 ; go ?
			mov   rax, qword [rbp+PosEx.move]
			cmp   byte [rax+MoveData.result], 0
			jne   @f
			lea   rcx, [Engine4]
		       call   Engine_GoInfinite
			mov   byte [Engine4_GoingQ], -1
		@@:

.Done:
			pop  r15 r14 r13 rbx rdi rsi rbp
			ret









TurnOnSuperKibitzer:	; rcx index of personality

		       push  rbp rsi rdi rbx r13 r14 r15

   if 0
			mov  r14,rcx


			xor  eax,eax

			lea  rdi,[DepthMoves]
			mov  ecx,256
		  rep stosq

			lea  rdi,[AgeMoves]
			mov  ecx,256
		  rep stosd

			mov  eax,0x80000000

			lea  rdi,[DepthArray]
			mov  ecx,256*64
		  rep stosd

			lea  rdi,[ScoreMoves]
			mov  ecx,256
		  rep stosd

			lea  rdi,[SortMoves]
			xor  eax,eax
		 @@:  stosd
			add  eax,1
			cmp  eax,256
			 jb  @b

			mov  dword[Engine5MaxDepth],0

			lea  rcx,[Engine5_BoardPosition]
			lea  rdx,[Engine5_StateList]
			lea  r8,[BoardPosition]
		       call  CopyPOSITION


			lea  rbp,[Engine5_BoardPosition]
			lea  rdi,[BoardPosition+POS.MOVE_LIST]
		       call  Generate_Legal
			mov  r13d,eax		  ;r13d = legal move count

			mov  dword[Engine5_KibitzPVCount],eax
;int3

			xor  esi,esi
	.move_loop:	cmp  esi,r13d
			jae  .move_loop_done
			mov  ecx,dword[BoardPosition+POS.MOVE_LIST+4*rsi]
		       call  PrintUciMove
			mov  qword[DepthMoves+8*rsi],rax
			mov  rcx,rax
		       call  QuickMakeMove
			mov  rax,qword[rbp+POS.STATE_PTR]
			sub  rax,sizeof.STATE
			mov  qword[rbp+POS.STATE_PTR],rax
			mov  rax,qword[rax+STATE.FIG_MOVE]
			mov  qword[FigMoves+8*rsi],rax
			add  esi,1
			jmp  .move_loop
	.move_loop_done:




    ; engine 5
			mov  rbp,qword[BoardPosition+POS.STATE_PTR]

			cmp  dword[Engine5_On],0
			 je  .alreadyoff

			lea  rcx,[Engine5]
		       call  Engine_Quit

       .alreadyoff:
			lea  rcx,[Engine5]
		       call  Engine_ClearOutput
		; check type
			cmp  r14d,0
			 je  .Done
		; get name
			mov  ecx,r14d
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,eax
			lea  rdx,[Engine5_Name]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		; get ex string
			mov  ecx,ebx
			mov  edx,'PATH'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Engine5_String]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		; make command

			lea  rcx,[Engine5]
		      ;  mov  dword[rcx-Engine1+Engine1_KibitzPVCount],1
			mov  byte[rcx-Engine1+Engine1_UploadQ],-1
		       call  _Engine_Start

			lea  rcx,[Engine5]
		       call  Engine_UCI

			mov  r15d,ebx
     .loop_optn5:
			mov  ecx,r15d
			mov  edx,'OPTN'
		       call  PersonGetXXXXFromNAME
			mov  r15d,eax
			mov  ecx,eax
		       test  eax,eax
			 js  .skip_optn5

			lea  rdi,[Engine5_InputBuffer]
		       call  CopyUntilEndQuoteWithNewLine

			lea  rdx,[Engine5_InputBuffer]
			mov  r8,rdi
			sub  r8,rdx
		     invoke  WriteFile,qword[Engine5_In_Write],rdx,r8,temp,NULL

			jmp  .loop_optn5
     .skip_optn5:


			lea  rdi,[Engine5_InputBuffer]
			lea  rsi,[szCmdMultiPV]
		       call  Append
			mov  eax,dword[Engine5_KibitzPVCount]
			mov  ecx,dword[MentorMaxLines]
			cmp  eax,ecx
		      cmova  eax,ecx
		       call  PrintUnsignedInteger
			mov  al,10
		      stosb
			lea  rdx,[Engine5_InputBuffer]
			mov  r8,rdi
			sub  r8,rdx
		     invoke  WriteFile,qword[Engine5_In_Write],rdx,r8,temp,NULL


			lea  rcx,[Engine5]
		       call  Engine_Position
		; go ?
			cmp  byte[rbp+STATE.RESULT],0
			jne  @f
			lea  rcx,[Engine5]
		       call  Engine_GoInfinite
			mov  byte[Engine5_GoingQ],-1
		@@:
.Done:
	end if
			pop  r15 r14 r13 rbx rdi rsi rbp
			ret















SetUpGame:
	    ; dword[CurrentPersonW]
	    ; dword[CurrentPersonB]

		       push  rbp rsi rdi rbx r13 r14 r15

			lea  rbp,[BoardPos]

;                     invoke  DeleteObject,[hBmpWhiteLogo]
;                     invoke  DeleteObject,[hBmpBlackLogo]
;
;                     invoke  LoadImage,NULL,'graphics\human.bmp',IMAGE_BITMAP,0,0,LR_LOADFROMFILE
;                        mov  [hBmpWhiteLogo],rax
;                     invoke  LoadImage,NULL,'graphics\human.bmp',IMAGE_BITMAP,0,0,LR_LOADFROMFILE
;                        mov  [hBmpBlackLogo],rax

			lea  rcx,[Engine1]
		       call  Engine_Quit
			lea  rcx,[Engine2]
		       call  Engine_Quit


    ; engine 1  (white)
			mov  byte[WhiteCompQ],0
			mov  rax,(' Human' shl 8) + CHAR_WKING
			mov  qword[Engine1_Name],rax

			cmp  dword[CurrentPersonW],0
			 je  .NoEngine1
			mov  byte[WhiteCompQ],-1
			lea  rcx,[Engine1]
		       call  Engine_ClearOutput
		; get name
			mov  ecx,dword[CurrentPersonW]
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,eax
			mov  word[Engine1_Name],(CHAR_WKING + ' ' shl 8)
			lea  rdx,[Engine1_Name+2]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		; get ex string
			mov  ecx,ebx
			mov  edx,'PATH'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Engine1_String]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		; get logo
	    ;            mov  ecx,ebx
	    ;            mov  edx,'LOGO'
	    ;           call  PersonGetXXXXFromNAME
	    ;            mov  ecx,eax
	    ;            lea  rdx,[Message]
	    ;           call  CopyUntilEndQuote
	    ;            mov  byte[rdx],0
	    ;         invoke  LoadImage,NULL,Message,IMAGE_BITMAP,0,0,LR_LOADFROMFILE
	    ;           test  rax,rax
	    ;             jz  @f
	    ;            mov  [hBmpWhiteLogo],rax
	    ;      @@:
		; start engine
			lea  rcx,[Engine1]
			mov  dword[rcx-Engine1+Engine1_KibitzPVCount],1
			mov  rax,qword[hEngineWindow]
			neg  rax
			sbb  eax,eax
			mov  byte[rcx-Engine1+Engine1_UploadQ],al
		       call  _Engine_Start

			lea  rcx,[Engine1]
		       call  Engine_UCI

			mov  r15d,ebx
     .loop_optn1:
			mov  ecx,r15d
			mov  edx,'OPTN'
		       call  PersonGetXXXXFromNAME
			mov  r15d,eax
			mov  ecx,eax
		       test  eax,eax
			 js  .skip_w_optn1

			lea  rdi,[Engine1_InputBuffer]
		       call  CopyUntilEndQuoteWithNewLine

			lea  rdx,[Engine1_InputBuffer]
			mov  r8,rdi
			sub  r8,rdx
		     invoke  WriteFile,qword[Engine1_In_Write],rdx,r8,temp,NULL

			jmp  .loop_optn1
     .skip_w_optn1:

			lea  rcx,[Engine1]
		       call  Engine_Position

      .NoEngine1:



    ; engine 2  (black)
			mov  byte[BlackCompQ],0
			mov  rax,(' Human' shl 8) + CHAR_BKING
			mov  qword[Engine2_Name],rax

			cmp  dword[CurrentPersonB],0
			 je  .NoEngine2
			mov  byte[BlackCompQ],-1
			lea  rcx,[Engine2]
		       call  Engine_ClearOutput
		; get name
			mov  ecx,dword[CurrentPersonB]
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,eax
			mov  word[Engine2_Name],(CHAR_BKING + ' ' shl 8)
			lea  rdx,[Engine2_Name+2]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		; get ex string
			mov  ecx,ebx
			mov  edx,'PATH'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Engine2_String]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		; get logo
	    ;            mov  ecx,ebx
	    ;            mov  edx,'LOGO'
	    ;           call  PersonGetXXXXFromNAME
	    ;            mov  ecx,eax
	    ;            lea  rdx,[Message]
	    ;           call  CopyUntilEndQuote
	    ;            mov  byte[rdx],0
	    ;         invoke  LoadImage,NULL,Message,IMAGE_BITMAP,0,0,LR_LOADFROMFILE
	    ;           test  rax,rax
	    ;             jz  @f
	    ;            mov  [hBmpBlackLogo],rax
	    ;      @@:
		; start engine
			lea  rcx,[Engine2]
			mov  dword[rcx-Engine1+Engine1_KibitzPVCount],1
			mov  rax,qword[hEngineWindow]
			neg  rax
			sbb  eax,eax
			mov  byte[rcx-Engine1+Engine1_UploadQ],al
		       call  _Engine_Start

			lea  rcx,[Engine2]
		       call  Engine_UCI

			mov  r15d,ebx
     .loop_optn2:
			mov  ecx,r15d
			mov  edx,'OPTN'
		       call  PersonGetXXXXFromNAME
			mov  r15d,eax
			mov  ecx,eax
		       test  eax,eax
			 js  .skip_w_optn2

			lea  rdi,[Engine2_InputBuffer]
		       call  CopyUntilEndQuoteWithNewLine

			lea  rdx,[Engine2_InputBuffer]
			mov  r8,rdi
			sub  r8,rdx
		     invoke  WriteFile,qword[Engine2_In_Write],rdx,r8,temp,NULL

			jmp  .loop_optn2
     .skip_w_optn2:
			lea  rcx,[Engine2]
		       call  Engine_Position
      .NoEngine2:


			pop  r15 r14 r13 rbx rdi rsi rbp
			ret




