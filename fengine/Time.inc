
TimerThread:
			and  rsp,-32
			sub  rsp,32

.Wait:
			mov  byte[TimerThreadState],TIMER_STATE_WAITING
		     invoke  WaitForSingleObject,[TimerThreadStartEvent],-1
			mov  byte[TimerThreadState],TIMER_STATE_TICKING

	    ;     simply wait for AlottedTimes ms and then change search state
			mov  rdx,qword[AlottedTime]
		     invoke  WaitForSingleObject,[TimerThreadEndEvent],rdx
			mov  byte[SearchThreadState],THREAD_STATE_WAIT

			jmp  .Wait

