



Engine_UpdatePlayer:
	       push  rbp rsi rdi
		mov  rbp, rcx
		mov  byte[rbp-Engine1+Engine1_GoingQ], 0
	       call  Engine_Position
		mov  rcx, rbp
	       call  Engine_ClearOutput
		mov  rcx, rbp
	       call  Engine_Think
		mov  byte[rbp-Engine1+Engine1_GoingQ], -1
Engine_UpdateDone:
		lea  rdi,[rbp-Engine1+Engine1_MemoryUsage]
		mov  [rdi+PROCESS_MEMORY_COUNTERS_EX.cb],sizeof.PROCESS_MEMORY_COUNTERS_EX
	     invoke  GetProcessMemoryInfo,qword[rbp-Engine1+Engine1_PI.hProcess],rdi,sizeof.PROCESS_MEMORY_COUNTERS_EX
		mov  rax,[rdi+PROCESS_MEMORY_COUNTERS_EX.PrivateUsage]
		shr  rax,20
	       call  PrintUnsignedInteger
		mov  rax,' MiB'
	      stosq
		pop  rdi rsi rbp
		ret
Engine_UpdateKibitzer:
	       push  rbp rsi rdi
		mov  rbp, rcx
		mov  byte[rbp-Engine1+Engine1_GoingQ], 0
	       call  Engine_Stop
		mov  rcx, rbp
	       call  Engine_Position
		mov  rcx, rbp
	       call  Engine_ClearOutput
		mov  rcx, rbp
	       call  Engine_GoInfinite
		jmp  Engine_UpdateDone


Engine_StopKibitzers:
	       push  rbp rdi rsi
		lea  rbp, [BoardPos]
		mov  byte[Engine3_GoingQ], 0
		mov  byte[Engine4_GoingQ], 0
		cmp  dword[Engine3_On], 0
		 je  .NoEngine3
		lea  rcx, [Engine3]
	       call  Engine_Stop
.NoEngine3:
		cmp  dword[Engine4_On], 0
		 je  .NoEngine4
		lea  rcx,[Engine4]
	       call  Engine_Stop
.NoEngine4:
		pop  rsi rdi rbp
		ret



Engine_ChangePVCount:
	; rcx address of Engine (3 or 4)
	; edx increment
	       push  rbp rsi rdi
		mov  rbp, rcx
		mov  eax, 1
		add  edx, dword[rbp-Engine1+Engine1_KibitzPVCount]
		cmp  edx, eax
	      cmovl  edx, eax
		mov  eax, ENGINE_PV_COUNT
		cmp  edx, eax
	      cmovg  edx, eax
		cmp  edx, dword[rbp-Engine1+Engine1_KibitzPVCount]
		 je  .Done
		mov  dword[rbp-Engine1+Engine1_KibitzPVCount], edx
		mov  byte[rbp-Engine1+Engine1_GoingQ], 0
		mov  rcx, rbp
	       call  Engine_Stop
		mov  rcx, rbp
	       call  Engine_ClearOutput
		lea  rdi, [rbp-Engine1+Engine1_InputBuffer]
		lea  rsi, [szCmdMultiPV]
	       call  Append
		mov  eax, [rbp-Engine1+Engine1_KibitzPVCount]
	       call  PrintUnsignedInteger
		mov  al, 10
	      stosb
		lea  rdx, [rbp-Engine1+Engine1_InputBuffer]
		mov  r8, rdi
		sub  r8, rdx
	     invoke  WriteFile, qword[rbp-Engine1+Engine1_In_Write], rdx, r8, temp, NULL
		mov  rcx, rbp
	       call  Engine_GoInfinite
		mov  byte[rbp-Engine1+Engine1_GoingQ], -1
.Done:
		pop  rdi rsi rbp
		ret



Engine_Write:
		lea  rdx, [rbp-Engine1+Engine1_InputBuffer]
		mov  r8, rdi
		sub  r8, rdx
	     invoke  WriteFile, qword[rbp-Engine1+Engine1_In_Write], rdx, r8, temp, NULL
Engine_Return:
		pop  rdi rsi rbp
		ret
Engine_UCI:
	       push  rbp rsi rdi
		mov  rbp, rcx
		lea  rdi, [rbp-Engine1+Engine1_InputBuffer]
		lea  rsi, [szCmdUCI]
	       call  AppendNewLine
		jmp  Engine_Write

Engine_Position:
	       push  rbp rsi rdi
		mov  rbp, rcx
		mov  rdx, qword[BoardPos+PosEx.szPosTable]
		mov  r8, qword[BoardPos+PosEx.szPos]
		mov  byte[r8], 10
		sub  r8, rdx
		add  r8, 1
	     invoke  WriteFile, qword[rbp-Engine1+Engine1_In_Write], rdx, r8, temp, NULL
		jmp  Engine_Return
Engine_Think:
	       push  rbp rsi rdi
		mov  rbp, rcx
		mov  byte[rbp-Engine1+Engine1_ThinkingQ], -1
		lea  rdi,[rbp-Engine1+Engine1_InputBuffer]
		lea  rsi, [szCmdThink]
	       call  AppendNewLine
		jmp  Engine_Write

Engine_GoInfinite:
	       push  rbp rsi rdi
		mov  rbp, rcx
		mov  byte[rbp-Engine1+Engine1_ThinkingQ], -1
		lea  rdi, [rbp-Engine1+Engine1_InputBuffer]
		lea  rsi, [szCmdGo]
	       call  AppendNewLine
		jmp  Engine_Write
Engine_Stop:
	       push  rbp rsi rdi
		mov  rbp, rcx
		cmp  byte[rbp-Engine1+Engine1_ThinkingQ], 0
		 je  Engine_Return
		mov  byte[rbp-Engine1+Engine1_ThinkingQ], 0
		mov  byte[rbp-Engine1+Engine1_GoingQ],0
		lea  rdi, [rbp-Engine1+Engine1_InputBuffer]
		lea  rsi, [szCmdStop]
	       call  AppendNewLine
		jmp  Engine_Write
Engine_Quit:
	       push  rbp rsi rdi
		mov  rbp, rcx
		cmp  dword[rbp-Engine1+Engine1_On], 0
		 je  .Return
	       call  Engine_Stop
		lea  rdi, [rbp-Engine1+Engine1_InputBuffer]
		lea  rsi, [szCmdQuit]
	       call  AppendNewLine
		lea  rdx, [rbp-Engine1+Engine1_InputBuffer]
		mov  r8, rdi
		sub  r8, rdx
	     invoke  WriteFile, qword[rbp-Engine1+Engine1_In_Write], rdx, r8, temp, NULL
	     invoke  WaitForSingleObject, qword[rbp-Engine1+Engine1_hThread], 500
		mov  byte[rbp-Engine1+Engine1_GoingQ],0
		mov  dword[rbp-Engine1+Engine1_On], 0	 ; this fill force the thread to terminate the process
	       test  eax, eax
		 jz  .CleanExit
		lea  rdx, qword[rbp-Engine1+Engine1_Name]
	     invoke  MessageBoxA, 0, rdx,'exit not clean',MB_OK
	     invoke  WaitForSingleObject, qword[rbp-Engine1+Engine1_hThread], -1
	.CleanExit:

	     invoke  CloseHandle, qword[rbp-Engine1+Engine1_hThread]

.Return:
		pop  rdi rsi rbp
		ret


Engine_ClearOutput:
		       push  rbp
			mov  rbp,rcx
			xor  eax,eax
			mov  ecx,(Engine1__ENDER-Engine1__)/8
			lea  rdi,[rbp-Engine1+Engine1__]
		  rep stosq
			mov  ecx,(ENGINE_LINE_COUNT*sizeof.ENGINE_LINE)/8
			lea  rdi,[rbp-Engine1+Engine1_Lines]
		  rep stosq
			mov  ecx,ENGINE_PV_COUNT
			lea  rdi,[rbp-Engine1+Engine1_PV]
		  rep stosq
			pop  rbp
			ret



Engine_TurnOnKibitzer:
	; rcx: address of engine (3 or 4)
	; rdx: string start
	; r8:  string end
	       push  rbp rsi rdi rbx r13 r14 r15
		mov  rbp, rcx
		mov  r14, rdx
		mov  r15, r8
	       call  Engine_Quit
		mov  rcx, rbp
	       call  Engine_ClearOutput
	; get name
		mov  rcx, r14
		mov  rdx, r15
		mov  r8d, 'NAME'
	       call  Person_GetXXXX
		mov  rcx, rax
		lea  rdx, [rbp-Engine1+Engine1_Name]
		mov  r8, r15
	       call  Person_CopyUntilEndQuote
		mov  byte[rdx],0
	; get ex string
		mov  rcx, r14
		mov  rdx, r15
		mov  r8d, 'PATH'
	       call  Person_GetXXXX
		mov  rcx, rax
		lea  rdx, [rbp-Engine1+Engine1_String]
		mov  r8, r15
	       call  Person_CopyUntilEndQuote
		mov  byte[rdx], 0
	; start engine
		mov  rcx, rbp
		mov  dword[rbp-Engine1+Engine1_KibitzPVCount],1
		mov  byte[rbp-Engine1+Engine1_UploadQ],-1
	       call  Engine_Start
		mov  rcx, rbp
	       call  Engine_UCI
	; send options
.loop_optn:
		mov  rcx, r14
		mov  rdx, r15
		mov  r8d, 'OPTN'
	       call  Person_GetXXXX
		mov  r14, rax
	       test  rax, rax
		 jz  .done_optn
		lea  rdx,[rbp-Engine1+Engine1_InputBuffer]
		mov  r8, r15
	       call  Person_CopyUntilEndQuote
		mov  byte[rdx], 10
		add  rdx, 1
		lea  r8, [rbp-Engine1+Engine1_InputBuffer]
		sub  rdx, r8
	       xchg  rdx, r8
	     invoke  WriteFile,qword[rbp-Engine1+Engine1_In_Write],rdx,r8,temp,NULL
		jmp  .loop_optn
.done_optn:
		mov  rcx, rbp
	       call  Engine_Position
	; go ?
		cmp  byte[BoardPos+PosEx.result], 0
		jne  .Done
		mov  rcx, rbp
	       call  Engine_GoInfinite
		mov  byte[Engine3_GoingQ], -1
.Done:
		pop  r15 r14 r13 rbx rdi rsi rbp
		ret


Engine_TurnOnPlayer:
	; rcx: address of engine (1 or 2)
	; rdx: string start
	; r8:  string end
	       push  rbp rsi rdi rbx r13 r14 r15
		mov  rbp, rcx
		mov  r14, rdx
		mov  r15, r8
	       call  Engine_ClearOutput
	; get name
		mov  rcx, r14
		mov  rdx, r15
		mov  r8d, 'NAME'
	       call  Person_GetXXXX
		mov  rcx, rax
		lea  rdx, [rbp-Engine1+Engine1_Name+2]
		mov  r8, r15
	       call  Person_CopyUntilEndQuote
		mov  byte[rdx],0
	; get ex string
		mov  rcx, r14
		mov  rdx, r15
		mov  r8d, 'PATH'
	       call  Person_GetXXXX
		mov  rcx, rax
		lea  rdx, [rbp-Engine1+Engine1_String]
		mov  r8, r15
	       call  Person_CopyUntilEndQuote
		mov  byte[rdx], 0
	; get move options
		mov  rcx, r14
		mov  rdx, r15
		mov  r8d, 'MOVE'
	       call  Person_GetXXXX
		mov  rcx, rax
		lea  rdx, [rbp-Engine1+Engine1_MoveString]
		mov  r8, r15
	       call  Person_CopyUntilEndQuote
		mov  byte[rdx], 0
	; start engine
		mov  rcx, rbp
		mov  dword[rbp-Engine1+Engine1_KibitzPVCount], 1
	       call  Engine_Start
		mov  rcx, rbp
	       call  Engine_UCI
	; send options
.loop_optn:
		mov  rcx, r14
		mov  rdx, r15
		mov  r8d, 'OPTN'
	       call  Person_GetXXXX
		mov  r14, rax
	       test  rax, rax
		 jz  .done_optn
		lea  rdx, [rbp-Engine1+Engine1_InputBuffer]
		mov  r8, r15
	       call  Person_CopyUntilEndQuote
		mov  byte[rdx], 10
		add  rdx, 1
		lea  r8, [rbp-Engine1+Engine1_InputBuffer]
		sub  rdx, r8
	       xchg  rdx, r8
	     invoke  WriteFile, qword[rbp-Engine1+Engine1_In_Write], rdx, r8, temp, NULL
		jmp  .loop_optn
.done_optn:
		mov  rcx, rbp
	       call  Engine_Position
.Done:
		pop  r15 r14 r13 rbx rdi rsi rbp
		ret



Engine_Start:
	       push  rbp rsi rdi
		mov  rbp, rcx
		cmp  dword[rbp-Engine1+Engine1_On], 0
		jne  .Done
		mov  dword[rbp-Engine1+Engine1_SA.nLength],sizeof.SECURITY_ATTRIBUTES
		mov  dword[rbp-Engine1+Engine1_SA.lpSecurityDescriptor], NULL
		mov  dword[rbp-Engine1+Engine1_SA.bInheritHandle], TRUE
		lea  rcx, [rbp-Engine1+Engine1_Out_Read]
		lea  rdx, [rbp-Engine1+Engine1_Out_Write]
		lea  r8, [rbp-Engine1+Engine1_SA]
		xor  r9, r9
	     invoke  CreatePipe, rcx, rdx, r8, r9
	     invoke  SetHandleInformation,[rbp-Engine1+Engine1_Out_Read],HANDLE_FLAG_INHERIT,0
		lea  rcx, [rbp-Engine1+Engine1_In_Read]
		lea  rdx, [rbp-Engine1+Engine1_In_Write]
		lea  r8, [rbp-Engine1+Engine1_SA]
		xor  r9,r9
	     invoke  CreatePipe, rcx, rdx, r8, r9
	     invoke  SetHandleInformation,[rbp-Engine1+Engine1_In_Write],HANDLE_FLAG_INHERIT,0
		xor  eax, eax
		mov  ecx, sizeof.PROCESS_INFORMATION
		lea  rdi, [rbp-Engine1+Engine1_PI]
	  rep stosb
		xor  eax, eax
		mov  ecx, sizeof.STARTUPINFO
		lea  rdi, [rbp-Engine1+Engine1_SI]
	  rep stosb
		mov  dword[rbp-Engine1+Engine1_SI.cb], sizeof.STARTUPINFO
		mov  rax, [rbp-Engine1+Engine1_Out_Write]
		mov  [rbp-Engine1+Engine1_SI.hStdError], rax
		mov  [rbp-Engine1+Engine1_SI.hStdOutput], rax
		mov  rax, [rbp-Engine1+Engine1_In_Read]
		mov  [rbp-Engine1+Engine1_SI.hStdInput], rax
		mov  [rbp-Engine1+Engine1_SI.dwFlags], STARTF_USESTDHANDLES+STARTF_USESHOWWINDOW
		mov  dword[rbp-Engine1+Engine1_SI.wShowWindow], SW_HIDE
		lea  rdx, [rbp-Engine1+Engine1_String]
		lea  rsi, [rbp-Engine1+Engine1_SI]
		lea  rdi, [rbp-Engine1+Engine1_PI]
	     invoke  CreateProcess, NULL, rdx, NULL, NULL, TRUE, 0, NULL, NULL, rsi, rdi
	     invoke  Sleep, 125
	     invoke  CreateThread, 0, 0, Engine_Thread, rbp, 0, 0
		mov  qword[rbp-Engine1+Engine1_hThread], rax
		mov  esi, 10
.Check:
	     invoke  Sleep, 50
		cmp  dword[rbp-Engine1+Engine1_On], 0
		jne  .Done
		sub  esi, 1
		jns  .Check
.Done:
		pop   rdi rsi rbp
		ret


Engine_UpdateMove:
	; out: rax tick just after engine has been sent go cmd
	       push  rbp rdi rsi rbx r15
   irps i, 1 2 3 4 {
		mov  byte[Engine#i#_GoingQ], 0
		lea  rcx, [Engine#i#_BoardPos]
		lea  rdx, [Engine#i#_StateList]
		lea  r8, [BoardPos]
	       call  CopyPosExToThread
   }
		lea  rbp, qword[BoardPos]
		mov  rax, qword[rbp+PosEx.move]
		cmp  byte[rbp+PosEx.result], 0
		jne  .Done
	       call  Game_MakeThinkString

.Engine1:	cmp  byte[WhiteCompQ], 0
		 jz  .Engine2
		cmp  byte[rbp+Pos.sideToMove], 0
		jne  .NoEngine1
		lea  rcx, [Engine1]
	       call  Engine_UpdatePlayer
		jmp  .Engine2
.NoEngine1:	lea  rcx, [Engine1]
	       call  Engine_Stop

.Engine2:	cmp  byte[BlackCompQ], 0
		 jz  .Engine3
		cmp  byte[rbp+Pos.sideToMove], 0
		 je  .NoEngine2
		lea  rcx, [Engine2]
	       call  Engine_UpdatePlayer
		jmp  .Engine3
.NoEngine2:	lea  rcx,[Engine2]
	       call  Engine_Stop
.Engine3:
	     invoke  GetTickCount
		mov  r15, rax
		lea  rcx, [Engine3]
		cmp  dword[rcx-Engine1+Engine1_On], 0
		 je  .Engine4
	       call  Engine_UpdateKibitzer
.Engine4:
		lea  rcx,[Engine4]
		cmp  dword[rcx-Engine1+Engine1_On], 0
		 je  .Done
	       call  Engine_UpdateKibitzer
.Done:
		mov  rax, r15
		pop  r15 rbx rsi rdi rbp
		ret








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




Engine_Thread:
			sub  rsp,8*5
			mov  rbp,rcx

			mov   dword[rbp-Engine1+Engine1_Score], 0x80000000

		     invoke  Sleep,50

			mov  dword[rbp-Engine1+Engine1_On],-1

    .ActiveCheck:	mov  rcx,qword[rbp-Engine1+Engine1_PI.hProcess]
			lea  rdx,[rbp-Engine1+Engine1_Exit]
		     invoke  GetExitCodeProcess,rcx,rdx
			cmp  dword[rbp-Engine1+Engine1_Exit],STILL_ACTIVE
			jne  .ActiveDone
    .ReadCheck:
			mov  rcx,qword[rbp-Engine1+Engine1_Out_Read]
			lea  rdx,[rbp-Engine1+Engine1_OutputBuffer]
			mov  r8d,ENGINE_READ_BUFFER_SIZE
			lea  r9,[rbp-Engine1+Engine1_Bread]
			lea  rax,[rbp-Engine1+Engine1_Avail]
		     invoke  PeekNamedPipe,rcx,rdx,r8,r9,rax,NULL
		       test  eax, eax
			 jz  .ReadDone
			cmp  dword[rbp-Engine1+Engine1_Bread], 0
			 jz  .ReadDone

			lea  rdi,[rbp-Engine1+Engine1_OutputBuffer]
			xor  eax,eax
			mov  ecx,ENGINE_READ_BUFFER_SIZE/8
		  rep stosq
			lea  rsi,[rbp-Engine1+Engine1_OutputBuffer]
		     invoke  GetTickCount
			mov  qword [rbp-Engine1+Engine1_readTick], rax
	      .ReadMore:
			mov  rcx, qword[rbp-Engine1+Engine1_Out_Read]
			mov  rdx, rsi
			lea  r9, [rbp-Engine1+Engine1_Bread]
			xor  eax, eax
		     invoke  ReadFile, rcx, rdx, 1, r9, rax
		       test  eax, eax
			 jz  .ActiveCheck
		      movzx  eax, byte[rsi]
			add  rsi, 1
			cmp  al, ' '
			jae  .ReadMore
      .ReadComplete:
			mov  dword [rsi], 0
		       call  ParseEngineOutput
			jmp  .ReadCheck
      .ReadDone:
		     invoke  Sleep,50

			cmp  dword[rbp-Engine1+Engine1_On],0
			jne  .ActiveCheck

		     invoke  Sleep,50

			mov  rcx,qword[rbp-Engine1+Engine1_PI.hProcess]
			xor  edx,edx
		     invoke  TerminateProcess,rcx,edx

    .ActiveDone:

	     invoke  CloseHandle,qword[rbp-Engine1+Engine1_Out_Read]
	     invoke  CloseHandle,qword[rbp-Engine1+Engine1_Out_Write]
	     invoke  CloseHandle,qword[rbp-Engine1+Engine1_In_Read]
	     invoke  CloseHandle,qword[rbp-Engine1+Engine1_In_Write]
		xor  eax,eax
		mov  dword[rbp-Engine1+Engine1_On],eax
		mov  qword[rbp-Engine1+Engine1_Out_Read],rax
		mov  qword[rbp-Engine1+Engine1_Out_Write],rax
		mov  qword[rbp-Engine1+Engine1_In_Read],rax
		mov  qword[rbp-Engine1+Engine1_In_Write],rax

	     invoke  CloseHandle, [rbp-Engine1+Engine1_PI.hProcess]
	     invoke  CloseHandle, [rbp-Engine1+Engine1_PI.hThread]
		xor  eax,eax
		mov  qword[rbp-Engine1+Engine1_PI.hProcess], rax
		mov  qword[rbp-Engine1+Engine1_PI.hThread], rax

;invoke MessageBoxA,0, "exiting thread", "Asdf", MB_OK

	     invoke  ExitThread,0












ParseEngineOutput:     push  rbp rbx rdi rsi r12 r14 r15

			mov  byte[rbp-Engine1+Engine1_UpdateTextQ],0


			lea  rsi,[rbp-Engine1+Engine1_OutputBuffer]

		     ;   cmp  byte[rbp-Engine1+Engine1_GoingQ],0
		     ;    je  .Return


.Clear: 		mov  r13d,6
			xor  eax,eax
			mov  ecx,(Engine1_ENDER-Engine1_)/8
			lea  rdi,[rbp-Engine1+Engine1_]
		  rep stosq
			lea  rdi,[rbp-Engine1+Engine1_ENDER]
			xor  r12d,r12d
.ParseNext:	       call  SkipWhiteSpaces
		    stdcall  CmpString,'info'
		       test  eax,eax
			jnz  .ParseAgain
			cmp  byte[rsi],0
			 je  .ParseDone

irps type, bestmove ponder currmovenumber currmove  currline refutation nps hashfull tbhits cpuload \
	   string multipv time depth seldepth score nodes {
			lea  rbx,[rbp-Engine1+Engine1_#type]
		    stdcall  CmpString,szType_#type
		       test  eax,eax
			jnz  .FoundInfo 		    }

irps type, pv {
			lea  rbx,[rbp-Engine1+Engine1_#type]
		    stdcall  CmpString,szType_#type
		       test  eax,eax
			jnz  .FoundBigInfo		       }

			add  r12d,1
		       call  SkipSpaces
		       call  CopyToken
			jmp  .ParseNext

.FoundBigInfo:		mov  r13d,MAX_PV_LENGTH
			jmp  @f
.FoundInfo:		mov  r13d,6
		 @@:	mov  byte[rdi],0
			mov  rdi,rbx
			xor  r12d,r12d

			jmp  .ParseNext

.ParseDone:		mov  byte[rdi],0

			cmp  rbp,Engine5
			 je  @f
		       call  ProcessParsed
			jmp  .processeddone
	      @@:

		.processeddone:


			cmp  byte[rbp-Engine1+Engine1_UpdateTextQ],0
			 je  .update_text_done


		mov  byte[DrawQ_Engine], -1

	.update_text_done:

.Return:
			pop  r15 r14 r12 rsi rdi rbx rbp
			ret

.ParseAgain:		mov  byte[rdi],0

		       cmp  rbp,Engine5
			 je  @f
		       call  ProcessParsed
			jmp  .processeddone1
	      @@:   ;   call  ProcessEngine5
		.processeddone1:

			lea  rdi,[rbp-Engine1+Engine1_ENDER]
			xor  r12d,r12d
	       ;     invoke  MessageBoxA,0,rsi,'PARSE AGIAN',MB_OK
			jmp  .Clear





ProcessParsed:	       push  rbp rbx rsi rdi r13 r14 r15

irps type, currmove currmovenumber currline refutation hashfull tbhits cpuload string {
			lea  rsi,[rbp-Engine1+Engine1_#type]
			lea  rdi,[rbp-Engine1+Engine1__#type]
		       call  CopyIfNotEmpty
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.NPS:			lea  rsi,[rbp-Engine1+Engine1_nps]
			cmp  byte[rsi],0
			 je  .NPS_done
			lea  rdi,[rbp-Engine1+Engine1__nps]
		       call  ParseInteger
		       call  PrintGroupedInteger
			mov  al,0
		      stosb
.NPS_done:


;;;;;;;;;;;;;;;;;;; print pv ;;;;;;;;;;;;;;;;;;;;;


		      ;  cmp  byte[rbp-Engine1+Engine1_GoingQ],0
		      ;   je  .AllDone
			cmp  byte[rbp-Engine1+Engine1_pv],0
			 je  .PVDone


			lea  rsi,[rbp-Engine1+Engine1_multipv]
		       call  SkipWhiteSpaces
		       call  ParseInteger
			mov  r15d, 1
			cmp  r15, rax
		      cmovl  r15, rax

			lea  rsi,[rbp-Engine1+Engine1_depth]
		       call  SkipWhiteSpaces
		       call  ParseInteger
			mov  r14,rax

			lea  rdx,[rbp-Engine1+Engine1_Lines+sizeof.ENGINE_LINE*(0)]
			lea  rdi,[rbp-Engine1+Engine1_Lines+sizeof.ENGINE_LINE*(ENGINE_LINE_COUNT)]
.cmp_line:
			cmp  r14w, word [rdx+ENGINE_LINE.depth]
			 jl  .go_down
			 jg  .found_place_to_insert
			cmp  r15w, word [rdx+ENGINE_LINE.multiPv]
			 jg  .go_down
			 jl  .found_place_to_insert
			jmp  .found_place_to_replace

.go_down:
			add  rdx, sizeof.ENGINE_LINE
			cmp  rdx, rdi
			 jb  .cmp_line
			jmp  .PVDone

.found_place_to_insert:
			lea  rsi,[rbp-Engine1+Engine1_Lines+sizeof.ENGINE_LINE*(ENGINE_LINE_COUNT-2)]
			lea  rdi,[rbp-Engine1+Engine1_Lines+sizeof.ENGINE_LINE*(ENGINE_LINE_COUNT-1)]
	.Shift:
			cmp  rsi, rdx
			 jb  .ShiftDone
			mov  ecx,sizeof.ENGINE_LINE/8
		  rep movsq
			sub  rsi,2*sizeof.ENGINE_LINE
			sub  rdi,2*sizeof.ENGINE_LINE
			jmp  .Shift
	.ShiftDone:
.found_place_to_replace:
			mov  word[rdx+ENGINE_LINE.depth], r14w
			mov  word[rdx+ENGINE_LINE.multiPv], r15w
			lea  rdi, [rdx+ENGINE_LINE.TEXT]

.start_read:

			mov  byte[rbp-Engine1+Engine1_UpdateTextQ], -1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.Time:			lea  rsi,[rbp-Engine1+Engine1_time]
			cmp  byte[rsi],0
			 je  .Time_done
		       call  ParseInteger
		       call  PrintTime
.Time_done:		mov  al,9
		      stosb



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.Depth: 		lea  rsi,[rbp-Engine1+Engine1_depth]
			cmp  byte[rsi],0
			 je  .Depth_done
		       call  AppendNoWhiteSpace
		     ;   lea  rsi,[rbp-Engine1+Engine1_seldepth]
		     ;   cmp  byte[rsi],0
		     ;    je  .Depth_done
		     ;   mov  al,'/'
		     ; stosb
		     ;  call  AppendNoWhiteSpace
.Depth_done:		mov  al,9
		      stosb

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.Score: 	       push  rdi
			lea  rsi,[rbp-Engine1+Engine1_score]
			cmp  byte[rsi],0
			 je  .Score_done
		    stdcall  CmpString,'mate'
		       test  eax,eax
			jnz  .Score_mate
		    stdcall  CmpString,'cp'
		       test  eax,eax
			 jz  .Score_done
.Score_cp:	       call  SkipWhiteSpaces
		       call  ParseInteger

			mov   edx, eax
			mov   ecx, dword[rbp-Engine1+Engine1_BoardPos+Pos.sideToMove]
			neg   ecx
			xor   edx, ecx
			sub   edx, ecx
			mov   dword[rbp-Engine1+Engine1_Score], edx

			mov  rdx,rax
			sar  rdx,63
			xor  rax,rdx
			sub  rax,rdx
			mov   ecx, dword [rbp-Engine1+Engine1_BoardPos+Pos.sideToMove]
			sub   ecx, 1
			xor  edx,ecx
			lea  edx,['- '+2*rdx]
			mov  byte[rdi],dl
			add  rdi,1
			xor  edx,edx
			mov  ecx,100
			div  rcx
		       call  PrintUnsignedInteger
			mov  byte[rdi],'.'
			add  rdi,1
			mov  eax,edx
			xor  edx,edx
			mov  ecx,10
			div  rcx
		       call  PrintUnsignedInteger
			mov  eax,edx
		       call  PrintUnsignedInteger
			jmp  .Score_done
.Score_mate:	       call  SkipWhiteSpaces
		       call  ParseInteger
			mov  rdx,rax
			sar  rdx,63
			xor  rax,rdx
			sub  rax,rdx

			mov   ecx, dword [rbp-Engine1+Engine1_BoardPos+Pos.sideToMove]
			neg   ecx
			xor   ecx, edx
			mov   r8d, 2000000000
			sub   r8d, eax
			xor   r8d, ecx
			sub   r8d, ecx
			mov   dword[rbp-Engine1+Engine1_Score], r8d

			mov   ecx, dword [rbp-Engine1+Engine1_BoardPos+Pos.sideToMove]
			sub   ecx, 1
			xor  edx,ecx
			lea  edx,['- '+2*rdx]
			mov  byte[rdi],dl
			add  rdi,1
			mov  byte[rdi],'#'
			add  rdi,1
		       call  PrintUnsignedInteger
.Score_done:		pop  rdx
			mov  qword[rdi],0
			mov  rax,qword[rdx]
			mov  qword[rbp-Engine1+Engine1__score],rax


		       call  SkipWhiteSpaces
		    stdcall  CmpString,'upperbound'
		       test  eax,eax
			 jz  @f
			mov  al,'+'
		      stosb
			@@:
		    stdcall  CmpString,'lowerbound'
		       test  eax,eax
			 jz  @f
			mov  al,'-'
		      stosb
			@@:
			mov  al,9
		      stosb

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.Nodes: 	lea  rsi,[rbp-Engine1+Engine1_nodes]
		cmp  byte[rsi],0
		 je  .Nodes_done
	       call  SkipWhiteSpaces
	       call  ParseInteger
	       push  rdi
		lea  rdi,[rbp-Engine1+Engine1__nodes]
		mov  qword[rbp-Engine1+Engine1_TotalNodes],rax
	       call  PrintGroupedInteger
		xor  eax,eax
	      stosd
		pop  rdi
.Nodes_done:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.PV:
			lea   rsi,[rbp-Engine1+Engine1_pv]

			mov   edx,ENGINE_PV_COUNT
			mov   rax,qword[rsi]
			mov   ecx, r15d
			sub   ecx,1
			shl   rax,8*3
			shr   rax,8*3
			cmp   ecx,edx
			jae   @f
			mov   qword [rbp-Engine1+Engine1_PV+8*rcx], rax
		@@:
		       test   ecx, ecx
			jle   @f
			mov   eax, '    '
		      stosd
		@@:

.PV_pretty:
			mov   r15, rbp
			lea   rbp, [rbp-Engine1+Engine1_BoardPos]

		       test   dword [rbp+PosEx.gamePly], 1
			 jz   @f
			mov   eax, '... '
		      stosd
		      @@:

  .PV_pretty_loop:
		       call   SkipSpaces
			cmp   byte [rsi], ' '
			 jb   .PV_pretty_done

			mov   r14, rsi
		       call   CopyTokenSmall
			lea   rcx, [r15-Engine1+Engine1_moveData]
			xor   edx, edx

			mov   qword [rcx+MoveData.moveUci], rax
			mov   qword [rcx+MoveData.ponderUci], rdx
		       call   ParseUciMove_SetMoveData
		       test   eax, eax
			 jz   .Illegal

			mov   eax, dword [rbp+PosEx.gamePly]
			shr   eax, 1
			jnc   @f
			add   eax, 1
		       call   PrintUnsignedInteger
			mov   ax, '. '
		      stosw
		@@:

			lea   rcx, [r15-Engine1+Engine1_moveData+MoveData.moveSan]
		       call   PrintString
			mov   al,' '
		      stosb

			jmp   .PV_pretty_loop


.Illegal:
			mov   rax, ' illegal'
		      stosq
			mov   eax, ' [ '
		      stosd
			sub   rdi, 1
			mov   rsi, r14
		       call   Append
			mov   al, ']'
		      stosb

.PV_pretty_done:

			lea   rcx, [r15-Engine1+Engine1_BoardPos]
			lea   rdx, [r15-Engine1+Engine1_StateList]
			lea   r8, [BoardPos]
		       call   CopyPosExToThread

			mov   rbp, r15

.PV_done:		xor   eax,eax
		      stosd




.PVDone:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.bestmove:		lea   rsi,[rbp-Engine1+Engine1_bestmove]
			cmp   byte [rsi], 0
			 je   .bestmove_done

			lea   rbx, [BoardPos]
			cmp   rbp, Engine2
			 ja   .bestmove_done


		lea  rax, [BoardPos]
		cmp  byte [rax+PosEx.result], 0
		jne  .bestmove_done


			mov   byte [rbp-Engine1+Engine1_ThinkingQ], 0

			lea   rdi, [rbp-Engine1+Engine1__bestmove]
		       call   AppendNoWhiteSpace
			mov   word [rdi], 0

			lea   rsi, [rbp-Engine1+Engine1_ponder]
			lea   rdi, [rbp-Engine1+Engine1__ponder]
			xor   eax, eax
			mov   qword [rdi], rax
		       call   AppendNoWhiteSpace
			mov   word [rdi], 0

			mov   rsi, qword [rbx+PosEx.move]
			mov   rax, qword [rbp-Engine1+Engine1__bestmove]
			mov   qword [rsi+MoveData.moveUci], rax
			mov   rax, qword [rbp-Engine1+Engine1__ponder]
			mov   qword [rsi+MoveData.ponderUci], rax
			mov   eax, dword [rbp-Engine1+Engine1_Score]
			mov   dword [rsi+MoveData.score], eax
			mov   rax, qword [rbp-Engine1+Engine1_readTick]
			mov   qword [rsi+MoveData.time2], rax



			cmp   rbp, Engine1
			jne   @f
			cmp   byte [rbx+Pos.sideToMove], 0
			jne   @f
		     invoke  SendMessage, qword[hEngineWindow], WM_COMMAND, 0, 0
		     invoke   SendMessage, qword [hMainWindow], WM_COMMAND, ID_CMD_MAKEMOVE, r9
			jmp   .bestmove_done
		    @@:

			cmp   rbp, Engine2
			jne   @f
			cmp   byte [rbx+Pos.sideToMove], 0
			 je   @f
		     invoke  SendMessage, qword[hEngineWindow], WM_COMMAND, 0, 0
		     invoke   SendMessage, qword[hMainWindow], WM_COMMAND, ID_CMD_MAKEMOVE, r9
		    @@:

.bestmove_done:

.AllDone:
			pop  r15 r14 r13 rdi rsi rbx rbp
			ret
















