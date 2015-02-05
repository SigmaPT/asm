


Engine_ChangePVCount:	  ; rcx address of Engine
			  ; edx increment
		       push  rbp rsi rdi
			mov  rbp,rcx
			mov  eax,1
			add  edx,dword[rbp-Engine1+Engine1_KibitzPVCount]
			cmp  edx,eax
		      cmovl  edx,eax
			mov  eax,ENGINE_PV_COUNT
			cmp  edx,eax
		      cmovg  edx,eax
			cmp  edx,dword[rbp-Engine1+Engine1_KibitzPVCount]
			 je  .Done
			mov   dword [rbp-Engine1+Engine1_KibitzPVCount], edx

			mov   byte [rbp-Engine1+Engine1_GoingQ], 0

			mov   rcx, rbp
		       call   Engine_Stop

			mov   rcx, rbp
		       call   Engine_ClearOutput



			lea  rdi,[rbp-Engine1+Engine1_InputBuffer]
			lea  rsi,[szCmdMultiPV]
		       call  Append
			mov  eax,[rbp-Engine1+Engine1_KibitzPVCount]
		       call  PrintUnsignedInteger
			mov  al,10
		      stosb

			lea  rdx,[rbp-Engine1+Engine1_InputBuffer]
			mov  r8,rdi
			sub  r8,rdx
		     invoke  WriteFile,qword[rbp-Engine1+Engine1_In_Write],rdx,r8,temp,NULL

			mov  rcx,rbp
		       call  Engine_GoInfinite
			mov  byte[rbp-Engine1+Engine1_GoingQ],-1
	.Done:
			pop  rdi rsi rbp
			ret



Engine_Write:		lea   rdx, [rbp-Engine1+Engine1_InputBuffer]
			mov   r8, rdi
			sub   r8, rdx
		     invoke   WriteFile, qword [rbp-Engine1+Engine1_In_Write], rdx, r8, temp, NULL
Engine_Return:		pop   rdi rsi rbp
			ret

Engine_UCI:	       push   rbp rsi rdi
			mov   rbp, rcx
			lea   rdi, [rbp-Engine1+Engine1_InputBuffer]
			lea   rsi, [szCmdUCI]
		       call   AppendNewLine
			jmp   Engine_Write

Engine_Position:       push   rbp rsi rdi
			mov   rbp, rcx
			mov   rdx, qword [BoardPos+PosEx.szPosTable]
			mov   r8, qword [BoardPos+PosEx.szPos]
			mov   byte [r8], 10
			sub   r8, rdx
			add   r8, 1
		     invoke   WriteFile, qword [rbp-Engine1+Engine1_In_Write], rdx, r8, temp, NULL
			jmp   Engine_Return
;                       push   rbx
;                        mov   rbx, qword [BoardPos+PosEx.moveTable]
;        .next:          cmp   rbx, qword [BoardPos+PosEx.move]
;                        jae   .done
;                        mov   al, ' '
;                      stosb
;                        lea   rsi, [rbx+MoveData.moveUci]
;                       call   Append
;                        add   rbx, sizeof.MoveData
;                        jmp   .next
;        .done:          mov   eax, 10
;                      stosb
;                        pop   rbx
		   ;     jmp   Engine_Write

Engine_Think:	       push   rbp rsi rdi
			mov   rbp, rcx
			mov   byte [rbp-Engine1+Engine1_ThinkingQ], -1
			lea   rdi,[rbp-Engine1+Engine1_InputBuffer]
			lea   rsi, [szCmdThink]
		       call   AppendNewLine
			jmp   Engine_Write

Engine_GoInfinite:     push   rbp rsi rdi
			mov   rbp,rcx
			mov   byte[rbp-Engine1+Engine1_ThinkingQ],-1
			lea   rdi,[rbp-Engine1+Engine1_InputBuffer]
			lea   rsi,[szCmdGo]
		       call   AppendNewLine
			jmp   Engine_Write

Engine_Stop:	       push  rbp rsi rdi
			mov  rbp,rcx
			cmp  byte[rbp-Engine1+Engine1_ThinkingQ],0
			 je  Engine_Return
			mov  byte[rbp-Engine1+Engine1_ThinkingQ],0
			lea  rdi,[rbp-Engine1+Engine1_InputBuffer]
			lea  rsi,[szCmdStop]
		       call  AppendNewLine
			jmp  Engine_Write

Engine_Quit:	       push  rbp rsi rdi
			mov  rbp,rcx
		       call  Engine_Stop
			lea  rdi,[rbp-Engine1+Engine1_InputBuffer]
			lea  rsi,[szCmdQuit]
		       call  AppendNewLine
			lea  rdx,[rbp-Engine1+Engine1_InputBuffer]
			mov  r8,rdi
			sub  r8,rdx
		     invoke  WriteFile,qword[rbp-Engine1+Engine1_In_Write],rdx,r8,temp,NULL
		     invoke  Sleep,100
			mov  dword[rbp-Engine1+Engine1_On],0
			pop  rdi rsi rbp
			ret



_Engine_Start:		push  rbp rsi rdi
			mov  rbp,rcx
			cmp  dword[rbp-Engine1+Engine1_On],0
			jne  .Done
			mov  dword[rbp-Engine1+Engine1_SA.nLength],sizeof.SECURITY_ATTRIBUTES
			mov  dword[rbp-Engine1+Engine1_SA.lpSecurityDescriptor],NULL
			mov  dword[rbp-Engine1+Engine1_SA.bInheritHandle],TRUE
			lea  rcx,[rbp-Engine1+Engine1_Out_Read]
			lea  rdx,[rbp-Engine1+Engine1_Out_Write]
			lea  r8,[rbp-Engine1+Engine1_SA]
			xor  r9,r9
		     invoke  CreatePipe,rcx,rdx,r8,r9
			lea  rcx,[rbp-Engine1+Engine1_In_Read]
			lea  rdx,[rbp-Engine1+Engine1_In_Write]
			lea  r8,[rbp-Engine1+Engine1_SA]
			xor  r9,r9
		     invoke  CreatePipe,rcx,rdx,r8,r9
			xor  eax,eax 
			mov  ecx,sizeof.PROCESS_INFORMATION 
			lea  rdi,[rbp-Engine1+Engine1_PI]
		  rep stosb 
			xor  eax,eax 
			mov  ecx,sizeof.STARTUPINFO 
			lea  rdi,[rbp-Engine1+Engine1_SI]
		  rep stosb 
			mov  dword[rbp-Engine1+Engine1_SI.cb],sizeof.STARTUPINFO
			mov  rax,[rbp-Engine1+Engine1_Out_Write]
			mov  [rbp-Engine1+Engine1_SI.hStdError],rax
			mov  [rbp-Engine1+Engine1_SI.hStdOutput],rax
			mov  rax,[rbp-Engine1+Engine1_In_Read]
			mov  [rbp-Engine1+Engine1_SI.hStdInput],rax
			mov  [rbp-Engine1+Engine1_SI.dwFlags],STARTF_USESTDHANDLES+STARTF_USESHOWWINDOW
			mov  dword[rbp-Engine1+Engine1_SI.wShowWindow],SW_HIDE
			lea  rdx,[rbp-Engine1+Engine1_String]
			lea  rsi,[rbp-Engine1+Engine1_SI]
			lea  rdi,[rbp-Engine1+Engine1_PI]
		     invoke  CreateProcess,NULL,rdx,NULL,NULL,TRUE,0,NULL,NULL,rsi,rdi
		     invoke  Sleep,125
		     invoke  CreateThread,0,0,Engine_Thread,rbp,0,0

		 @@: invoke  Sleep,25
			cmp  dword[rbp-Engine1+Engine1_On],0
			 je  @b


			mov  rcx,rbp

		       call  Print_Engine_Name


      .Done:		pop  rdi rsi rbp
			ret










SendBookInfo:
		       push  rbp rsi rdi


			lea  rdi,[rbp-Engine1+Engine1_MemoryUsage]
			mov  [rdi+PROCESS_MEMORY_COUNTERS_EX.cb],sizeof.PROCESS_MEMORY_COUNTERS_EX
		     invoke  GetProcessMemoryInfo,qword[rbp-Engine1+Engine1_PI.hProcess],rdi,sizeof.PROCESS_MEMORY_COUNTERS_EX
			mov  rax,[rdi+PROCESS_MEMORY_COUNTERS_EX.PrivateUsage]
			shr  rax,20
		       call  PrintUnsignedInteger
			mov  rax,' MiB'
		      stosq

			xor  eax,eax

			mov  dword[rbp-Engine1+Engine1__nps],eax
			mov  dword[rbp-Engine1+Engine1__nodes],eax


			lea  rdi,[rbp-Engine1+Engine1_Lines+ENGINE_LINE.TEXT]

			mov  al,9
		      stosb
		      stosb
			mov  eax,'book'
		      stosd
			mov  al,9
		      stosb

			mov  eax, 'move'
		      stosd


			xor  eax,eax
		      stosb


			mov  dword[rbp-Engine1+Engine1_Lines+ENGINE_LINE.TEXT+sizeof.ENGINE_LINE],eax


			xor  ecx,ecx
			mov  rax,[hEngineWindow]
			cmp  rbp,Engine1
		      cmove  rcx,rax
			mov  rax,[hEngineWindow]
			cmp  rbp,Engine2
		      cmove  rcx,rax

		       test  rcx,rcx
			 jz  @f
		     invoke  SendMessage,rcx,WM_COMMAND,0,0
			 @@:

		 ;       cmp  rbp,Engine3
		 ;        je  @f
		 ;       cmp  rbp,Engine4
		 ;        je  @f
		 ;    invoke  SendMessage,[hVisualWindow],WM_COMMAND,0,0
		 ;        @@:


			pop  rdi rsi rbp
			ret





Print_Engine_Name:
			ret

		;       push  rdi
		;
		;        lea  rdi,[rbp-Engine1+Engine1_Message]
		;
		;        mov  al,' '
		;
		;        mov  ecx,179
		;        cmp  rbp,Engine1
		;      cmove  eax,ecx
		;
		;        mov  ecx,176
		;        cmp  rbp,Engine2
		;      cmove  eax,ecx
		;
		;        mov  ah,' '
		;      stosw
		;
		;        lea  rsi,[rbp-Engine1+Engine1_Name]
		;       call  Append
		;        mov  al,0
		;      stosb
		;
		;
		;        mov  rcx,[hEngine1TitleWindow]
		;
		;        lea  rax,[Engine2]
		;        mov  rdx,[hEngine2TitleWindow]
		;        cmp  rbp,rax
		;      cmove  rcx,rdx
		;
		;        lea  rax,[Engine3]
		;        mov  rdx,[hEngine3TitleWindow]
		;        cmp  rbp,rax
		;      cmove  rcx,rdx
		;
		;        lea  rax,[Engine4]
		;        mov  rdx,[hEngine4TitleWindow]
		;        cmp  rbp,rax
		;      cmove  rcx,rdx
		;
		;
		;        lea  r9,[rbp-Engine1+Engine1_Message]
		;     invoke  SendMessage,rcx,WM_SETTEXT,0,r9
		;
		;        pop  rdi
		;        ret


Engine_Thread:
			sub  rsp,8*5

virtual at rsp
.PaintQ dd ?

end virtual

			mov  rbp,rcx
		     invoke  Sleep,100



			mov  dword[rbp-Engine1+Engine1_On],-1




    .ActiveCheck:	mov  rcx,qword[rbp-Engine1+Engine1_PI.hProcess]
			lea  rdx,[rbp-Engine1+Engine1_Exit]
		     invoke  GetExitCodeProcess,rcx,rdx
			cmp  dword[rbp-Engine1+Engine1_Exit],STILL_ACTIVE
			jne  .ActiveDone

    .BookCheck:
			mov   rbx, qword[rbp-Engine1+Engine1_BookMove]
		       test   rbx, rbx
			 jz   .ReadCheck
			xor   eax,eax
			mov   qword [rbp-Engine1+Engine1_BookMove], rax

			mov   rsi, qword [BoardPos+PosEx.move]
			mov   qword [rsi+MoveData.moveUci], rbx
			mov   qword [rsi+MoveData.ponderUci], rax
			mov   qword [rsi+MoveData.score], 'book'
		     invoke   GetTickCount
			mov   qword [rsi+MoveData.time2], rax
		     invoke   SendMessage, qword [hMainWindow], WM_COMMAND, ID_CMD_MAKEMOVE, r9

		       call   SendBookInfo

    .ReadCheck:
			mov  rcx,qword[rbp-Engine1+Engine1_Out_Read]
			lea  rdx,[rbp-Engine1+Engine1_OutputBuffer]
			mov  r8d,ENGINE_READ_BUFFER_SIZE
			lea  r9,[rbp-Engine1+Engine1_Bread]
			lea  rax,[rbp-Engine1+Engine1_Avail]
		     invoke  PeekNamedPipe,rcx,rdx,r8,r9,rax,NULL
			cmp  dword[rbp-Engine1+Engine1_Bread],0
			 jz  .ReadDone

			lea  rdi,[rbp-Engine1+Engine1_OutputBuffer]
			xor  eax,eax
			mov  ecx,ENGINE_READ_BUFFER_SIZE/8
		  rep stosq

			lea  rsi,[rbp-Engine1+Engine1_OutputBuffer]
			mov  rcx,qword[rbp-Engine1+Engine1_Out_Read]
			mov  rdx,rsi
			mov  r8d,ENGINE_READ_BUFFER_SIZE
			lea  r9,[rbp-Engine1+Engine1_Bread]
			xor  eax,eax
		     invoke  ReadFile,rcx,rdx,r8,r9,rax
			mov  eax,[rbp-Engine1+Engine1_Bread]
			add  rsi,rax

      .ReadCompleteTest:
			cmp  byte[rsi-1],' '
			 jb  .ReadComplete

			mov  rcx,qword[rbp-Engine1+Engine1_Out_Read]
			mov  rdx,rsi
			mov  r8d,1
			lea  r9,[rbp-Engine1+Engine1_Bread]
			xor  eax,eax
		     invoke  ReadFile,rcx,rdx,r8,r9,rax
			mov  eax,[rbp-Engine1+Engine1_Bread]
			add  rsi,rax
			jmp  .ReadCompleteTest

      .ReadComplete:
		     invoke  GetTickCount
			mov  qword [rbp-Engine1+Engine1_readTick], rax
		       call  ParseEngineOutput
		     invoke  Sleep,50
			jmp  .ReadCheck
      .ReadDone:
		     invoke  Sleep,50

			cmp  dword[rbp-Engine1+Engine1_On],0
			jne  .ActiveCheck


			mov  dword[rbp-Engine1+Engine1_On],0
		     invoke  Sleep,250

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

			mov  dword[rbp-Engine1+Engine1_On],0

		     invoke  ExitThread,0












ParseEngineOutput:     push  rbp rbx rdi rsi r12 r14 r15

			mov  byte[rbp-Engine1+Engine1_UpdateTextQ],0

			lea  rsi,[rbp-Engine1+Engine1_OutputBuffer]

			cmp  byte[rbp-Engine1+Engine1_GoingQ],0
			 je  .Return


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
	      @@:      call  ProcessEngine5

		.processeddone:


			cmp  byte[rbp-Engine1+Engine1_UpdateTextQ],0
			 je  .update_text_done

			cmp  rbp,Engine5
			 je  PrintEngine5




			lea  rdi,[rbp-Engine1+Engine1_MemoryUsage]

			mov  [rdi+PROCESS_MEMORY_COUNTERS_EX.cb],sizeof.PROCESS_MEMORY_COUNTERS_EX
		     invoke  GetProcessMemoryInfo,qword[rbp-Engine1+Engine1_PI.hProcess],rdi,sizeof.PROCESS_MEMORY_COUNTERS_EX


			mov  rax,[rdi+PROCESS_MEMORY_COUNTERS_EX.PrivateUsage]
			shr  rax,20
		       call  PrintUnsignedInteger
			mov  rax,' MiB'
		      stosq

			xor  ecx,ecx
			mov  rax,[hEngineWindow]
			cmp  rbp,Engine1
		      cmove  rcx,rax
			mov  rax,[hEngineWindow]
			cmp  rbp,Engine2
		      cmove  rcx,rax
			mov  rax,[hKibitzWindow]
			cmp  rbp,Engine3
		      cmove  rcx,rax
			mov  rax,[hKibitzWindow]
			cmp  rbp,Engine4
		      cmove  rcx,rax

		       test  rcx,rcx
			 jz  @f
		     invoke  SendMessage,rcx,WM_COMMAND,0,0
			 @@:

;                        cmp  rbp,Engine3
;                         je  @f
;                        cmp  rbp,Engine4
;                         je  @f
;                     invoke  SendMessage,[hVisualWindow],WM_COMMAND,0,0
;                         @@:

		  ;      cmp  byte[rbp-Engine1+Engine1_UploadQ],0
		  ;       je  @f
		  ;   invoke  SendMessage,[hBoardWindow],WM_PAINT,0,0
		  ;       @@:


	.update_text_done:



.Return:

			pop  r15 r14 r12 rsi rdi rbx rbp
			ret

.ParseAgain:		mov  byte[rdi],0

		       cmp  rbp,Engine5
			 je  @f
		       call  ProcessParsed
			jmp  .processeddone1
	      @@:      call  ProcessEngine5
		.processeddone1:

			lea  rdi,[rbp-Engine1+Engine1_ENDER]
			xor  r12d,r12d
	       ;     invoke  MessageBoxA,0,rsi,'PARSE AGIAN',MB_OK
			jmp  .Clear








PrintEngineScore:	mov  eax,ecx
			cmp  ecx,0x80000000
			 je  .ret

			mov  byte[rdi],'+'
		       test  eax,eax
			jns  @f
			mov  byte[rdi],'-'
			neg  eax
		   @@:
			add  rdi,1


			cmp  eax,1000000000
			jae  .mate

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

.ret:
			ret

.mate:			mov  byte[rdi],'#'
			add  rdi,1
			sub  eax,2000000000
			neg  eax
		       call  PrintUnsignedInteger
			ret







PrintEngine5:		lea  rdi,[rbp-Engine1+Engine1_Message]




		     invoke  SendMessage,[hMentorWindow],WM_COMMAND,0,0

			pop  r15 r14 r12 rsi rdi rbx rbp
			ret




ProcessEngine5:
		       push  rbp rbx rsi rdi r13 r14 r15

irps type, currmove currmovenumber currline refutation hashfull tbhits cpuload string {
			lea  rsi,[rbp-Engine1+Engine1_#type]
			lea  rdi,[rbp-Engine1+Engine1__#type]
		       call  CopyIfNotEmpty
}
			lea  rsi,[rbp-Engine1+Engine1_pv]

			mov  r15,rsi
		       call  CopyTokenSmall
			mov  r14,rax	       ; r14 = move

		       test  eax,eax
			 jz  .done


			cmp  byte[Engine5_GoingQ],0
			 je  .done

			mov  byte[rbp-Engine1+Engine1_UpdateTextQ],-1

			lea  rsi,[rbp-Engine1+Engine1_depth]
		       call  SkipWhiteSpaces
		       call  ParseInteger

			mov  ebx,eax


			mov  eax,dword[Engine5MaxDepth]
			add  eax,5
			cmp  ebx,eax
			 ja  .done

			cmp  ebx,dword[Engine5MaxDepth]
			jbe  .clearloopdone

			mov  dword[Engine5MaxDepth],ebx
			 or  esi,-1
     .clearloop:	add  esi,1
			cmp  esi,dword[Engine5_KibitzPVCount]
			jae  .clearloopdone
			mov  eax,dword[AgeMoves+4*rsi]
			add  eax,1
			mov  ecx,4
			cmp  eax,ecx
		      cmova  eax,ecx
			mov  dword[AgeMoves+4*rsi],eax
			cmp  eax,3
			 jb  .clearloop
			mov  dword[ScoreMoves+4*rsi],0x80000000
			jmp  .clearloop
     .clearloopdone:


			mov  r13d,0x80000000
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
			mov  r13d,eax
			jmp  .Score_done

.Score_mate:	       call  SkipWhiteSpaces
		       call  ParseInteger
			mov  r13d,eax
			mov  ecx,2000000000
			sar  eax,63
			xor  ecx,eax
			sub  ecx,eax
			sub  r13d,ecx
			neg  r13d

.Score_done:		mov   ecx, dword[Engine5_BoardPos+Pos.sideToMove]
			neg   ecx
			xor   r13d, ecx
			sub   r13d, ecx

			 or  esi,-1
     .moveloop: 	add  esi,1
			cmp  esi,dword[Engine5_KibitzPVCount]
			jae  .done
			mov  rcx,qword[DepthMoves+8*rsi]
			cmp  r14,rcx
			jne  .moveloop
       .found:
			mov  qword[DepthMoves+8*rsi],r14
			mov  dword[ScoreMoves+4*rsi],r13d
			mov  dword[AgeMoves+4*rsi],0

		       imul  ecx,esi,64
			add  ecx,ebx
			mov  dword[DepthArray+4*rcx],r13d

			mov  r11d,dword[Engine5_KibitzPVCount]
			xor  r10d,r10d
			sub  r11d,1
			 js  .done
	.sortloop:	cmp  r10d,r11d
			jae  .sortloopdone
			mov  r8d,dword[SortMoves+4*r10]
			mov  r9d,dword[SortMoves+4*(r10+1)]
			mov  ecx,dword[ScoreMoves+4*r8]
			mov  edx,dword[ScoreMoves+4*r9]
		       call  NeedToSwap
		       test  eax,eax
			 jz  @f
			mov  dword[SortMoves+4*r10],r9d
			mov  dword[SortMoves+4*(r10+1)],r8d
		 @@:	add  r10d,1
			jmp  .sortloop
	.sortloopdone:

	.done:


			pop  r15 r14 r13 rdi rsi rbx rbp
			ret



NeedToSwap:		xor   eax, eax
			cmp   ecx, 0x80000000
			 je   .yes
			cmp   edx, 0x80000000
			 je   .ret
			cmp   ecx, edx
			 je   .ret
			mov   eax, dword [Engine5_BoardPos+Pos.sideToMove]
			neg   eax
			jge   .ret
			not   eax
	   .ret:
		       ; xor  eax,eax
			ret

	   .yes:	cmp   edx,0x80000000
			 je   .ret
			 or   eax,-1
			ret







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


			cmp  byte[rbp-Engine1+Engine1_GoingQ],0
			 je  .AllDone
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
			mov  word [rdx+ENGINE_LINE.depth], r14w
			mov  word [rdx+ENGINE_LINE.multiPv], r15w
			lea  rdi, [rdx+ENGINE_LINE.TEXT]

.start_read:

			mov  byte[rbp-Engine1+Engine1_UpdateTextQ],-1

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
.Nodes: 		lea  rsi,[rbp-Engine1+Engine1_nodes]
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
		  ;      mov  dword[rbp-Engine1+Engine1_TotalNodes],'asd'

		;        mov  qword[rbp-Engine1+Engine1_TotalNodes],rax
		;       call  PrintGroupedInteger;PrintUnsignedIntegerPostfix
.Nodes_done:	;        mov  al,9
		;      stosb


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

			cmp   byte [PrettyPV], 0
			jne   .PV_pretty

			lea   rsi, [rbp-Engine1+Engine1_pv]
		       call   Append

			jmp   .PV_done

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
       ;
       ;
       ;
       ;         @@:
       ;                 mov   rbx, qword [rbp+PosEx.state]
       ;                 cmp   rbx, qword [rbp+PosEx.stateTable]
       ;                 jbe   @f
       ;                call   UndoMove
       ;                 jmp   @b
       ;         @@:
       ;                 lea   rdi, [rbp+PosEx.moveList]
       ;                call   Gen_Legal
       ;                 xor   eax, eax
       ;               stosq

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
			mov   rax, qword [rbp-Engine1+Engine1__score]
			shl   rax, 8
			shr   rax, 8
			mov   qword [rsi+MoveData.score], rax
			mov   rax, qword [rbp-Engine1+Engine1_readTick]
			mov   qword [rsi+MoveData.time2], rax

			cmp   rbp, Engine1
			jne   @f
			cmp   byte [rbx+Pos.sideToMove], 0
			jne   @f
		     invoke   SendMessage, qword [hMainWindow], WM_COMMAND, ID_CMD_MAKEMOVE, r9
			jmp   .bestmove_done
		    @@:

			cmp   rbp, Engine2
			jne   @f
			cmp   byte [rbx+Pos.sideToMove], 0
			 je   @f
		     invoke   SendMessage, qword[hMainWindow], WM_COMMAND, ID_CMD_MAKEMOVE, r9
		    @@:

.bestmove_done:

.AllDone:
			pop  r15 r14 r13 rdi rsi rbx rbp
			ret







	     ;           mov   byte [EngineGrabSquare], -1
	     ;
	     ;
	      ;          cmp  dword[AnimationSteps],2
	      ;           jl  .skip_animation
	      ;
	      ;        movzx  r12d,byte[rbp-Engine1+Engine1__bestmove+0]
	      ;        movzx  r13d,byte[rbp-Engine1+Engine1__bestmove+1]
	      ;          sub  r12d,'a'
	      ;           js  .skip_animation
	      ;          cmp  r12d,7
	      ;           ja  .skip_animation
	      ;          sub  r13d,'1'
	      ;           js  .skip_animation
	      ;          cmp  r13d,7
	      ;           ja  .skip_animation
	      ;          xor  r13d,7
	      ;          lea  eax,[r12+8*r13]
	      ;        movzx  r14d,byte[rbp-Engine1+Engine1__bestmove+2]
	      ;        movzx  r15d,byte[rbp-Engine1+Engine1__bestmove+3]
	      ;          sub  r14d,'a'
	      ;           js  .skip_animation
	      ;          cmp  r14d,7
	      ;           ja  .skip_animation
	      ;          sub  r15d,'1'
	      ;           js  .skip_animation
	      ;          cmp  r15d,7
	      ;           ja  .skip_animation
	      ;          xor  r15d,7
	      ;
	      ;          mov  byte[EngineGrabSquare],al
	      ;
	      ;          movzx  eax, byte[BoardFlip]
	      ;          and  eax,7
	      ;          xor  r12d,eax
	      ;          xor  r13d,eax
	      ;          xor  r14d,eax
	      ;          xor  r15d,eax
	      ;
	      ;          mov  eax,r12d
	      ;          sub  eax,r14d
	      ;          mov  ecx,r13d
	      ;          sub  ecx,r15d
	      ;         imul  eax,eax
	      ;         imul  ecx,ecx
	      ;          add  eax,ecx
	      ;           jz  .skip_animation
	      ;         imul  eax,dword[AnimationSteps]
	      ;         imul  eax,dword[AnimationSteps]
	      ;     cvtsi2sd  xmm0,eax
	      ;       sqrtsd  xmm0,xmm0
	      ;     cvtsd2si  edi,xmm0
	      ;          mov  ebx,1
;          .next_frame:

; p1 (ebx/edi) + p2 ((edi-ebx)/edi)

	      ;     cvtsi2sd  xmm0,r14d
	      ;     cvtsi2sd  xmm1,r12d
	      ;     cvtsi2sd  xmm2,ebx
	      ;     cvtsi2sd  xmm3,edi
	      ;        mulsd  xmm0,xmm2
	      ;        subsd  xmm2,xmm3
	      ;        mulsd  xmm1,xmm2
	      ;        subsd  xmm0,xmm1
	      ;        divsd  xmm0,xmm3
	      ;        movsd  qword[EngineGrab.x],xmm0
	      ;
	      ;     cvtsi2sd  xmm0,r15d
	      ;     cvtsi2sd  xmm1,r13d
	      ;     cvtsi2sd  xmm2,ebx
	      ;     cvtsi2sd  xmm3,edi
	      ;        mulsd  xmm0,xmm2
	      ;        subsd  xmm2,xmm3
	      ;        mulsd  xmm1,xmm2
	      ;        subsd  xmm0,xmm1
	      ;        divsd  xmm0,xmm3
	      ;        movsd  qword[EngineGrab.y],xmm0
	      ;
	      ;       invoke  SendMessage,qword[hBoardWindow],WM_PAINT,0,0
	      ;       invoke  Sleep,20
	      ;          add  ebx,1
	      ;          cmp  ebx,edi
	      ;           jb  .next_frame
	      ;
	      ;          mov  byte[EngineGrabSquare],-1


;        .skip_animation:




;.Done:













_ParseInteger:	     ; string at rsi, return integer in rax
			xor  ecx,ecx
			xor  eax,eax
			xor  edx,edx
			cmp  byte[rsi],'-'
			 je  .neg
			cmp  byte[rsi],'+'
			 je  .pos
			jmp  .next
	 .neg:		not  rdx
	 .pos:		add  rsi,1
	 .next: 	mov  cl,byte[rsi]
		       test  cl,cl
			 jz  .done
			sub  cl,'0'
			 js  .done
			cmp  cl,9
			 ja  .done
			add  rsi,1
		       imul  rax,10
			add  rax,rcx
			jmp  .next
	.done:		xor  rax,rdx
			sub  rax,rdx
			ret

__PrintUnsignedInteger:       ; rax: number
		       push  rbp rcx rdx
			mov  ecx,10
			mov  rbp,rsp
		.l1:	xor  edx,edx
			div  rcx
		       push  rdx
		       test  rax,rax
			jnz  .l1
		.l2:	pop  rax
			add  al,'0'
		      stosb
			cmp  rsp,rbp
			 jb  .l2
			pop  rdx rcx rbp
			ret


PrintUnsignedIntegerPostfix:	   ; rax: number
		       push  rbx rcx rdx
			xor  edx,edx

			mov  ecx,1000000000
			mov  bl,'B'
		       imul  r8,rcx,1000
			cmp  rax,r8
			 ja  .Postfix

			mov  ecx,1000000
			mov  bl,'M'
		       imul  r8,rcx,1000
			cmp  rax,r8
			 ja  .Postfix

			mov  ecx,1000
			mov  bl,'K'
		       imul  r8,rcx,1000
			cmp  rax,r8
			jbe  .NoPostfix

     .Postfix:		div  rcx
		       call  PrintUnsignedInteger
			mov  al,bl
		      stosb
			pop  rdx rcx rbx
			ret

    .NoPostfix:        call  PrintUnsignedInteger
			pop  rdx rcx rbx
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

