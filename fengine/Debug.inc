if DEBUG_MODE


InternalError_IllegalPositionAtSearchStart:
and rsp ,-16
call  PrintDebugPosition
invoke	MessageBoxA,0,'InternalError_IllegalPositionAtSearchStart',0,MB_OK
invoke	ExitProcess,0

InternalError_IllegalPositionAtEval:
and rsp ,-16
call  PrintDebugPosition
invoke	MessageBoxA,0,'InternalError_IllegalPositionAtEval',0,MB_OK
invoke	ExitProcess,0

InternalError_GoDirection:
and rsp ,-16
call  PrintDebugPosition
invoke	MessageBoxA,0,'InternalError_GoDirection',0,MB_OK
invoke	ExitProcess,0

InternalError_PieceCoverage:
and rsp ,-16
call  PrintDebugPosition
invoke	MessageBoxA,0,'InternalError_PieceCoverage',0,MB_OK
invoke	ExitProcess,0

InternalError_Generate_Legal:
and rsp ,-16
call  PrintDebugPosition
invoke	MessageBoxA,0,'InternalError_Generate_Legal',0,MB_OK
invoke	ExitProcess,0

InternalError_Generate_NonEvasions:
and rsp ,-16
call  PrintDebugPosition
invoke	MessageBoxA,0,'InternalError_Generate_NonEvasions',0,MB_OK
invoke	ExitProcess,0

InternalError_Generate_Evasions:
and rsp ,-16
call  PrintDebugPosition
invoke	MessageBoxA,0,'InternalError_Generate_Evasions',0,MB_OK
invoke	ExitProcess,0

InternalError_Generate_Evasions1:
and rsp ,-16
call  PrintDebugPosition
invoke	MessageBoxA,0,'InternalError_Generate_Evasions1',0,MB_OK
invoke	ExitProcess,0




PrintDebugPosition:
		       push  rbp
			lea  rdi,[Output]
			lea  rbp,[BoardPosition]

		       call  PrintPosition

			mov  eax,10
		      stosd


			lea  rdi,[Output]
		       call  _WriteOut
			pop  rbp
			ret











end if
