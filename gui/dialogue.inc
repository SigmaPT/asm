

proc LoadPersonDialogProc,hwnddlg,wmsg,wparam,lparam
			mov  [hwnddlg],rcx
			mov  [wmsg],rdx
			mov  [wparam],r8
			mov  [lparam],r9
			cmp  edx,WM_INITDIALOG
			 je  .wminitdialog
			cmp  edx,WM_COMMAND
			 je  .wmcommand
			cmp  edx,WM_CLOSE
			 je  .wmclose
			xor  eax,eax
			jmp  .finish
  .wminitdialog:       push  rsi rdi rbx rbp

		     invoke  GetDlgItem,[hwnddlg],ID_LoadPersonDialog_PERSON
			mov  rdi,rax

			mov  rax,'Human'
			mov  qword[Message],rax
		     invoke  SendMessage,rdi,CB_ADDSTRING,NULL,Message

			xor  ebx,ebx
       .PopulateNext:	mov  ecx,ebx
		       call  PersonGetNextEntry
			mov  rbx,rdx
		       test  eax,eax
			 jz  .PopulateDone
			cmp  eax,'NAME'
			jne  .PopulateNext
			mov  rcx,rdx
			lea  rdx,[Message]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
			mov  rbx,rcx
		     invoke  SendMessage,rdi,CB_ADDSTRING,NULL,Message
			jmp  .PopulateNext

.PopulateDone:	     invoke  SendMessage,rdi,CB_SETCURSEL,dword[CurrentPerson],0
			pop  rbp rbx rdi rsi
			jmp  .processed


  .wmcommand:		mov  eax,r8d
			cmp  eax,(BN_CLICKED shl 16) + ID_LoadPersonDialog_CANCEL
			 je  .wmclose
			cmp  ax,IDCANCEL
			 je  .wmclose
			cmp  eax,(BN_CLICKED shl 16) + ID_LoadPersonDialog_OK
			 je  .ok
			jmp  .processed
  .ok:		       push  rsi rdi
		     invoke  GetDlgItem,[hwnddlg],ID_LoadPersonDialog_PERSON
			mov  rdi,rax
		     invoke  SendMessage,rdi,CB_GETCURSEL,0,0
			mov  dword[CurrentPerson],eax
			xor  edx,edx
		     invoke  EndDialog,[hwnddlg],edx
			mov  eax,esi
			pop  rsi rsi
			jmp  .processed
  .wmclose:		 or  edx,-1
		     invoke  EndDialog,[hwnddlg],edx
  .processed:		mov  eax,1
  .finish:		ret
endp






proc SetupGameDialogProc,hwnddlg,wmsg,wparam,lparam
			mov  [hwnddlg],rcx
			mov  [wmsg],rdx
			mov  [wparam],r8
			mov  [lparam],r9
		       push  rsi rdi rbx r15

			cmp  edx,WM_INITDIALOG
			 je  .wminitdialog
			cmp  edx,WM_COMMAND
			 je  .wmcommand
			cmp  edx,WM_CLOSE
			 je  .wmclose
			xor  eax,eax
			jmp  .finish

  .wminitdialog:

irps i, WTIME WINC BTIME BINC {
			mov  rax,qword[InitTime#i]
			lea  rdi,[Message]
		       call  PrintUnsignedInteger
			mov  byte[rdi],0
		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_#i,Message
	      }

		     invoke  GetDlgItem,[hwnddlg],ID_SetupGameDialog_WHITEPERSONLIST
			mov  rdi,rax
		     invoke  GetDlgItem,[hwnddlg],ID_SetupGameDialog_BLACKPERSONLIST
			mov  rsi,rax

			mov  rax,'Human'
			mov  qword[Message],rax
		     invoke  SendMessage,rdi,LB_INSERTSTRING,-1,Message
		     invoke  SendMessage,rsi,LB_INSERTSTRING,-1,Message

			xor  ebx,ebx
		  .1:	mov  ecx,ebx
		       call  PersonGetNextEntry
			mov  rbx,rdx
		       test  eax,eax
			 jz  .2
			cmp  eax,'NAME'
			jne  .1
			mov  rcx,rdx
			lea  rdx,[Message]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
			mov  rbx,rcx
		     invoke  SendMessage,rdi,LB_INSERTSTRING,-1,Message
		     invoke  SendMessage,rsi,LB_INSERTSTRING,-1,Message
			jmp  .1

	   .2:	     invoke  SendMessage,rdi,LB_SETCURSEL,dword[CurrentPersonW],0
		     invoke  SendMessage,rsi,LB_SETCURSEL,dword[CurrentPersonB],0

			mov  ecx,dword[CurrentPersonW]
		       test  ecx,ecx
			 jz  @f
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,ebx
			mov  edx,'DESC'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Message]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0

		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_WHITEPERSONDESC,Message
		   @@:

			mov  ecx,dword[CurrentPersonB]
		       test  ecx,ecx
			 jz  @f
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,ebx
			mov  edx,'DESC'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Message]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0

		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_BLACKPERSONDESC,Message
		   @@:
			jmp  .processed

  .wmcommand:		mov  eax,r8d
			cmp  eax,(BN_CLICKED shl 16) + ID_SetupGameDialog_CANCEL
			 je  .wmclose
			cmp  ax,IDCANCEL
			 je  .wmclose
			cmp  ax,ID_SetupGameDialog_BLACKPERSONLIST
			 je  .wmblacklist
			cmp  ax,ID_SetupGameDialog_WHITEPERSONLIST
			 je  .wmwhitelist
			cmp  eax,(BN_CLICKED shl 16) + ID_SetupGameDialog_OK
			 je  .ok
			jmp  .processed

  .wmblacklist: 	shr  eax,16
			cmp  ax,LBN_SELCHANGE
			 je  .wmblacklist_change
			jmp  .processed

    .wmblacklist_change:

		     invoke  GetDlgItem,[hwnddlg],ID_SetupGameDialog_BLACKPERSONLIST
			mov  rdi,rax
		     invoke  SendMessage,rdi, LB_GETCURSEL, 0, 0

			mov  ecx,eax

			mov  rax,'Human'
			mov  qword[Message],rax

		       test  ecx,ecx
			 jz  @f
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,ebx
			mov  edx,'DESC'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Message]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		   @@:
		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_BLACKPERSONDESC,Message

			jmp  .processed


  .wmwhitelist: 	shr  eax,16
			cmp  ax,LBN_SELCHANGE
			 je  .wmwhitelist_change
			jmp  .processed

    .wmwhitelist_change:

		     invoke  GetDlgItem,[hwnddlg],ID_SetupGameDialog_WHITEPERSONLIST
			mov  rdi,rax
		     invoke  SendMessage,rdi, LB_GETCURSEL, 0, 0

			mov  ecx,eax

			mov  rax,'Human'
			mov  qword[Message],rax

		       test  ecx,ecx
			 jz  @f
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,ebx
			mov  edx,'DESC'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Message]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		   @@:
		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_WHITEPERSONDESC,Message

			jmp  .processed





  .ok:
		     invoke  GetDlgItem,[hwnddlg],ID_SetupGameDialog_WHITEPERSONLIST
			mov  rdi,rax
		     invoke  SendMessage,rdi,LB_GETCURSEL,0,0
			mov  dword[CurrentPersonW],eax

		     invoke  GetDlgItem,[hwnddlg],ID_SetupGameDialog_BLACKPERSONLIST
			mov  rdi,rax
		     invoke  SendMessage,rdi,LB_GETCURSEL,0,0
			mov  dword[CurrentPersonB],eax

irps i, WTIME WINC BTIME BINC {
			lea  rsi,[Message]
		     invoke  GetDlgItemText,[hwnddlg],ID_SetupGameDialog_#i,rsi,31
		       call  ParseInteger
			mov  qword[Time#i],rax
			mov  qword[InitTime#i],rax
   }



			xor  edx,edx
		     invoke  EndDialog,[hwnddlg],edx
			mov  eax,esi
			jmp  .processed

  .wmclose:		 or  edx,-1
		     invoke  EndDialog,[hwnddlg],edx

  .processed:		mov  eax,1
  .finish:
			pop  r15 rbx rdi rsi
			ret
endp


proc ManagePersonDialogProc,hwnddlg,wmsg,wparam,lparam
			mov  [hwnddlg],rcx
			mov  [wmsg],rdx
			mov  [wparam],r8
			mov  [lparam],r9
			cmp  edx,WM_INITDIALOG
			 je  .wminitdialog
			cmp  edx,WM_COMMAND
			 je  .wmcommand
			cmp  edx,WM_CLOSE
			 je  .wmclose
			xor  eax,eax
			jmp  .finish

  .wminitdialog:       push  rsi rdi rbx rbp

		     invoke  SetDlgItemText,[hwnddlg],ID_ManageGameDialog_LIST,qword[PersonText]

			pop  rbp rbx rdi rsi
			jmp  .processed

  .wmcommand:		mov  eax,r8d
			cmp  eax,(BN_CLICKED shl 16) + ID_SetupGameDialog_CANCEL
			 je  .wmclose
			cmp  ax,IDCANCEL
			 je  .wmclose
			cmp  eax,(BN_CLICKED shl 16) + ID_SetupGameDialog_OK
			 je  .ok
			jmp  .processed
  .ok:

		       push  rsi rdi
		     invoke  VirtualFree,qword[PersonText],0,MEM_RELEASE
		     invoke  GetDlgItem,[hwnddlg],ID_ManageGameDialog_LIST
		     invoke  SendMessage,rax,WM_GETTEXTLENGTH,0,0
			mov  qword[PersonTextSizeB],rax
			lea  rsi,[rax+10]
		     invoke  VirtualAlloc,0,rsi,MEM_COMMIT,PAGE_READWRITE
			mov  qword[PersonText],rax
		     invoke  GetDlgItemText,[hwnddlg],ID_ManageGameDialog_LIST,qword[PersonText],rsi
		      ;  mov  byte[+rsi-10],0


			xor  edx,edx
		     invoke  EndDialog,[hwnddlg],edx
			mov  eax,esi
			pop  rdi rsi
			jmp  .processed
  .wmclose:		 or  edx,-1
		     invoke  EndDialog,[hwnddlg],edx
  .processed:		mov  eax,1
  .finish:		ret
endp








if 0
			lea  r15,[SetupState]

			xor  eax,eax
			mov  ecx,sizeof.STATE
			lea  rdi,[SetupState]
		  rep stosb

			xor  ebx,ebx
	 .loop2:	lea  edx,[rbx+ID_SetupGameDialog_SQUARES]
			mov  dword[Message],0
		     invoke  GetDlgItemText,[hwnddlg],rdx,Message,31
		      movzx  eax,byte[Message]

			cmp  eax,'k'
			 je  .loop2k
			cmp  eax,'l'
			 je  .loop2l
			cmp  eax,'q'
			 je  .loop2q
			cmp  eax,'w'
			 je  .loop2w
			cmp  eax,'r'
			 je  .loop2r
			cmp  eax,'t'
			 je  .loop2t
			cmp  eax,'p'
			 je  .loop2p
			cmp  eax,'o'
			 je  .loop2o
			cmp  eax,'n'
			 je  .loop2n
			cmp  eax,'m'
			 je  .loop2m
			cmp  eax,'b'
			 je  .loop2b
			cmp  eax,'v'
			 je  .loop2v
			jmp  .loop2skip

	.loop2k:	bts  qword[r15+STATE.WPIECES],rbx
			bts  qword[r15+STATE.WKING],rbx
			mov  byte[r15+STATE.BOARD_+rbx],KING
			jmp  .loop2skip

	.loop2l:	bts  qword[r15+STATE.BPIECES],rbx
			bts  qword[r15+STATE.BKING],rbx
			mov  byte[r15+STATE.BOARD_+rbx],KING
			jmp  .loop2skip

	.loop2q:	bts  qword[r15+STATE.WPIECES],rbx
			bts  qword[r15+STATE.WQUEENS],rbx
			mov  byte[r15+STATE.BOARD_+rbx],QUEEN
			jmp  .loop2skip

	.loop2w:	bts  qword[r15+STATE.BPIECES],rbx
			bts  qword[r15+STATE.BQUEENS],rbx
			mov  byte[r15+STATE.BOARD_+rbx],QUEEN
			jmp  .loop2skip

	.loop2r:	bts  qword[r15+STATE.WPIECES],rbx
			bts  qword[r15+STATE.WROOKS],rbx
			mov  byte[r15+STATE.BOARD_+rbx],ROOK
			jmp  .loop2skip

	.loop2t:	bts  qword[r15+STATE.BPIECES],rbx
			bts  qword[r15+STATE.BROOKS],rbx
			mov  byte[r15+STATE.BOARD_+rbx],ROOK
			jmp  .loop2skip

	.loop2b:	bts  qword[r15+STATE.WPIECES],rbx
			bts  qword[r15+STATE.WBISHOPS],rbx
			mov  byte[r15+STATE.BOARD_+rbx],BISHOP
			jmp  .loop2skip

	.loop2v:	bts  qword[r15+STATE.BPIECES],rbx
			bts  qword[r15+STATE.BBISHOPS],rbx
			mov  byte[r15+STATE.BOARD_+rbx],BISHOP
			jmp  .loop2skip

	.loop2n:	bts  qword[r15+STATE.WPIECES],rbx
			bts  qword[r15+STATE.WKNIGHTS],rbx
			mov  byte[r15+STATE.BOARD_+rbx],KNIGHT
			jmp  .loop2skip

	.loop2m:	bts  qword[r15+STATE.BPIECES],rbx
			bts  qword[r15+STATE.BKNIGHTS],rbx
			mov  byte[r15+STATE.BOARD_+rbx],KNIGHT
			jmp  .loop2skip

	.loop2p:	bts  qword[r15+STATE.WPIECES],rbx
			bts  qword[r15+STATE.WPAWNS],rbx
			mov  byte[r15+STATE.BOARD_+rbx],PAWN
			jmp  .loop2skip

	.loop2o:	bts  qword[r15+STATE.BPIECES],rbx
			bts  qword[r15+STATE.BPAWNS],rbx
			mov  byte[r15+STATE.BOARD_+rbx],PAWN
			jmp  .loop2skip



	    .loop2skip:
			add  ebx,1
			cmp  ebx,64
			 jb  .loop2



			mov  byte[r15+STATE.SIDE],0
			mov  byte[r15+STATE.XSIDE],-1
			mov  qword[Message],0
		     invoke  GetDlgItemText,[hwnddlg],ID_SetupGameDialog_SIDE,Message,8
			cmp  byte[Message],'b'
			jne  @f
			mov  byte[r15+STATE.SIDE],-1
			mov  byte[r15+STATE.XSIDE],0
			@@:



			mov  qword[Message],0
		     invoke  GetDlgItemText,[hwnddlg],ID_SetupGameDialog_CASTLING,Message,8
			mov  rax,qword[Message]
		.castling_read:
		       test  rax,rax
			 jz  .castling_read_done
			xor  ecx,ecx
			mov  edx,1
			cmp  al,'K'
		      cmove  ecx,edx
			 or  byte[r15+STATE.CASTLING],cl
			xor  ecx,ecx
			mov  edx,2
			cmp  al,'Q'
		      cmove  ecx,edx
			 or  byte[r15+STATE.CASTLING],cl
			xor  ecx,ecx
			mov  edx,4
			cmp  al,'k'
		      cmove  ecx,edx
			 or  byte[r15+STATE.CASTLING],cl
			xor  ecx,ecx
			mov  edx,8
			cmp  al,'q'
		      cmove  ecx,edx
			 or  byte[r15+STATE.CASTLING],cl
			shr  rax,8
			jmp  .castling_read
		.castling_read_done:


			lea  rsi,[Message]
		     invoke  GetDlgItemText,[hwnddlg],ID_SetupGameDialog_EPSQUARE,rsi,8
		      movzx  eax,byte[rsi+0]
			sub  eax,'a'
			 js  @f
			cmp  eax,7
			 ja  @f
		      movzx  edx,byte[rsi+1]
			sub  edx,'1'
			 js  @f
			cmp  edx,7
			 ja  @f
			xor  edx,7
			lea  eax,[rax+8*rdx]
			xor  ecx,ecx
			bts  rcx,rax
			mov  qword[r15+STATE.EPSQUARE],rcx
			@@:


			lea  rsi,[Message]
			mov  dword[rsi],0
		     invoke  GetDlgItemText,[hwnddlg],ID_SetupGameDialog_50MOVES,rsi,8
		       call  ParseInteger
			mov  dword[r15+STATE.MOVE50],eax




			lea  rcx,[SetupState]
		       call  VerifyState
		       test  eax,eax
			 jz  .wmclose
end if






if 0
proc LoadPersonDialogProc,hwnddlg,wmsg,wparam,lparam
			mov  [hwnddlg],rcx
			mov  [wmsg],rdx
			mov  [wparam],r8
			mov  [lparam],r9
			cmp  edx,WM_INITDIALOG
			 je  .wminitdialog
			cmp  edx,WM_COMMAND
			 je  .wmcommand
			cmp  edx,WM_CLOSE
			 je  .wmclose
			xor  eax,eax
			jmp  .finish
  .wminitdialog:       push  rsi rdi rbx rbp

		     invoke  GetDlgItem,[hwnddlg],ID_LoadPersonDialog_PERSON
			mov  rdi,rax

			mov  rax,'Human'
			mov  qword[Message],rax
		     invoke  SendMessage,rdi,CB_ADDSTRING,NULL,Message

			xor  ebx,ebx
       .PopulateNext:	mov  ecx,ebx
		       call  PersonGetNextEntry
			mov  rbx,rdx
		       test  eax,eax
			 jz  .PopulateDone
			cmp  eax,'NAME'
			jne  .PopulateNext
			mov  rcx,rdx
			lea  rdx,[Message]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
			mov  rbx,rcx
		     invoke  SendMessage,rdi,CB_ADDSTRING,NULL,Message
			jmp  .PopulateNext

.PopulateDone:	     invoke  SendMessage,rdi,CB_SETCURSEL,dword[CurrentPerson],0
			pop  rbp rbx rdi rsi
			jmp  .processed


  .wmcommand:		mov  eax,r8d
			cmp  eax,(BN_CLICKED shl 16) + ID_LoadPersonDialog_CANCEL
			 je  .wmclose
			cmp  ax,IDCANCEL
			 je  .wmclose
			cmp  eax,(BN_CLICKED shl 16) + ID_LoadPersonDialog_OK
			 je  .ok
			jmp  .processed
  .ok:		       push  rsi rdi
		     invoke  GetDlgItem,[hwnddlg],ID_LoadPersonDialog_PERSON
			mov  rdi,rax
		     invoke  SendMessage,rdi,CB_GETCURSEL,0,0
			mov  dword[CurrentPerson],eax
			xor  edx,edx
		     invoke  EndDialog,[hwnddlg],edx
			mov  eax,esi
			pop  rsi rsi
			jmp  .processed
  .wmclose:		 or  edx,-1
		     invoke  EndDialog,[hwnddlg],edx
  .processed:		mov  eax,1
  .finish:		ret
endp





piece_lookup: db '  ponmbvrtqwkl  '


proc SetupGameDialogProc,hwnddlg,wmsg,wparam,lparam
			mov  [hwnddlg],rcx
			mov  [wmsg],rdx
			mov  [wparam],r8
			mov  [lparam],r9
		       push  rsi rdi rbx r15

			cmp  edx,WM_INITDIALOG
			 je  .wminitdialog
			cmp  edx,WM_COMMAND
			 je  .wmcommand
			cmp  edx,WM_CLOSE
			 je  .wmclose
			xor  eax,eax
			jmp  .finish





  .wminitdialog:

		    ;   call  SetTimeFromInit

irps i, WTIME WINC BTIME BINC {
			mov  rax,qword[InitTime#i]
			lea  rdi,[Message]
		       call  PrintSignedInteger
			mov  byte[rdi],0
		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_#i,Message
	      }



		     invoke  GetDlgItem,[hwnddlg],ID_SetupGameDialog_WHITEPERSONLIST
			mov  rdi,rax
		     invoke  GetDlgItem,[hwnddlg],ID_SetupGameDialog_BLACKPERSONLIST
			mov  rsi,rax

			mov  rax,'Human'
			mov  qword[Message],rax
		     invoke  SendMessage,rdi,LB_INSERTSTRING,-1,Message
		     invoke  SendMessage,rsi,LB_INSERTSTRING,-1,Message

			xor  ebx,ebx
		  .1:	mov  ecx,ebx
		       call  PersonGetNextEntry
			mov  rbx,rdx
		       test  eax,eax
			 jz  .2
			cmp  eax,'NAME'
			jne  .1
			mov  rcx,rdx
			lea  rdx,[Message]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
			mov  rbx,rcx
		     invoke  SendMessage,rdi,LB_INSERTSTRING,-1,Message
		     invoke  SendMessage,rsi,LB_INSERTSTRING,-1,Message
			jmp  .1

	   .2:	     invoke  SendMessage,rdi,LB_SETCURSEL,dword[CurrentPersonW],0
		     invoke  SendMessage,rsi,LB_SETCURSEL,dword[CurrentPersonB],0

			mov  ecx,dword[CurrentPersonW]
		       test  ecx,ecx
			 jz  @f
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,ebx
			mov  edx,'DESC'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Message]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0

		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_WHITEPERSONDESC,Message
		   @@:

			mov  ecx,dword[CurrentPersonB]
		       test  ecx,ecx
			 jz  @f
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,ebx
			mov  edx,'DESC'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Message]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0

		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_BLACKPERSONDESC,Message
		   @@:




  .set_board:
			lea  r15,[SetupState]

			xor  ebx,ebx
	     @@:	lea  edx,[rbx+ID_SetupGameDialog_SQUARES]
		     invoke  GetDlgItem,[hwnddlg],rdx
			mov  rsi,rax
		     invoke  SendMessage,rsi,WM_SETFONT,[hFontMerida],FALSE
		     invoke  SendMessage,rsi,EM_SETLIMITTEXT,1,0
		      movzx  eax,byte[r15+STATE.BOARD_+rbx]
			 bt  qword[r15+STATE.BPIECES],rbx
			adc  eax,eax
		      movzx  eax,byte[piece_lookup+rax]
			mov  dword[Message],eax
		     invoke  SendMessage,rsi,WM_SETTEXT,0,Message
			add  ebx,1
			cmp  ebx,64
			 jb  @b


			mov  eax,'w'
			mov  ecx,'b'
			cmp  byte[r15+STATE.SIDE],0
		     cmovne  eax,ecx
			mov  dword[Message],eax
		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_SIDE,Message


			lea  rdi,[Message]
		      movzx  ecx,byte[r15+STATE.CASTLING]
			mov  byte[rdi],'K'
			 bt  ecx,0
			adc  rdi,0
			mov  byte[rdi],'Q'
			 bt  ecx,1
			adc  rdi,0
			mov  byte[rdi],'k'
			 bt  ecx,2
			adc  rdi,0
			mov  byte[rdi],'q'
			 bt  ecx,3
			adc  rdi,0
			xor  eax,eax
		      stosd
		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_CASTLING,Message


			lea  rdi,[Message]
			bsf  rcx,qword[r15+STATE.EPSQUARE]
			 jz  @f
			mov  eax,ecx
			and  eax,7
			add  eax,'a'
		      stosb
			mov  eax,ecx
			shr  eax,3
			and  eax,7
			xor  eax,7
			add  eax,'1'
		      stosb
		 @@:	xor  eax,eax
		      stosd
		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_EPSQUARE,Message


			lea  rdi,[Message]
			mov  eax,dword[r15+STATE.MOVE50]
		       call  PrintUnsignedInteger
			xor  eax,eax
		      stosd
		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_50MOVES,Message


			jmp  .processed



  .wmcommand:		mov  eax,r8d
			cmp  eax,(BN_CLICKED shl 16) + ID_SetupGameDialog_CANCEL
			 je  .wmclose
			cmp  ax,IDCANCEL
			 je  .wmclose
			cmp  ax,ID_SetupGameDialog_BLACKPERSONLIST
			 je  .wmblacklist
			cmp  ax,ID_SetupGameDialog_WHITEPERSONLIST
			 je  .wmwhitelist
			cmp  eax,(BN_CLICKED shl 16) + ID_SetupGameDialog_OK
			 je  .ok
		 ;       cmp  eax,(BN_CLICKED shl 16) + ID_SetupGameDialog_RESET
		 ;        je  .reset
		 ;       cmp  eax,(BN_CLICKED shl 16) + ID_SetupGameDialog_CLEAR
		 ;        je  .clear
			jmp  .processed

  .wmblacklist: 	shr  eax,16
			cmp  ax,LBN_SELCHANGE
			 je  .wmblacklist_change
			jmp  .processed

    .wmblacklist_change:

		     invoke  GetDlgItem,[hwnddlg],ID_SetupGameDialog_BLACKPERSONLIST
			mov  rdi,rax
		     invoke  SendMessage,rdi, LB_GETCURSEL, 0, 0

			mov  ecx,eax

			mov  rax,'Human'
			mov  qword[Message],rax

		       test  ecx,ecx
			 jz  @f
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,ebx
			mov  edx,'DESC'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Message]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		   @@:
		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_BLACKPERSONDESC,Message

			jmp  .processed


  .wmwhitelist: 	shr  eax,16
			cmp  ax,LBN_SELCHANGE
			 je  .wmwhitelist_change
			jmp  .processed

    .wmwhitelist_change:

		     invoke  GetDlgItem,[hwnddlg],ID_SetupGameDialog_WHITEPERSONLIST
			mov  rdi,rax
		     invoke  SendMessage,rdi, LB_GETCURSEL, 0, 0

			mov  ecx,eax

			mov  rax,'Human'
			mov  qword[Message],rax

		       test  ecx,ecx
			 jz  @f
		       call  PersonGetNAME
			mov  ebx,eax
			mov  ecx,ebx
			mov  edx,'DESC'
		       call  PersonGetXXXXFromNAME
			mov  ecx,eax
			lea  rdx,[Message]
		       call  CopyUntilEndQuote
			mov  byte[rdx],0
		   @@:
		     invoke  SetDlgItemText,[hwnddlg],ID_SetupGameDialog_WHITEPERSONDESC,Message

			jmp  .processed



;  .clear:
;  .reset:
;                        lea  rcx,[StartState]
;                        lea  rdx,[SetupState]
;             ReadStateToXMM  rcx
;          WriteStateFromXMM  rdx
;                        jmp  .set_board


  .ok:


		     invoke  GetDlgItem,[hwnddlg],ID_SetupGameDialog_WHITEPERSONLIST
			mov  rdi,rax
		     invoke  SendMessage,rdi,LB_GETCURSEL,0,0
			mov  dword[CurrentPersonW],eax

		     invoke  GetDlgItem,[hwnddlg],ID_SetupGameDialog_BLACKPERSONLIST
			mov  rdi,rax
		     invoke  SendMessage,rdi,LB_GETCURSEL,0,0
			mov  dword[CurrentPersonB],eax

irps i, WTIME WINC BTIME BINC {
			lea  rsi,[Message]
		     invoke  GetDlgItemText,[hwnddlg],ID_SetupGameDialog_#i,rsi,31
		       call  ParseInteger
			mov  qword[Time#i],eax
   }

		       call  SetInitFromTime



			xor  edx,edx
		     invoke  EndDialog,[hwnddlg],edx
			mov  eax,esi
			jmp  .processed

  .wmclose:		 or  edx,-1
		     invoke  EndDialog,[hwnddlg],edx

  .processed:		mov  eax,1
  .finish:
			pop  r15 rbx rdi rsi
			ret
endp

















proc ManagePersonDialogProc,hwnddlg,wmsg,wparam,lparam
			mov  [hwnddlg],rcx
			mov  [wmsg],rdx
			mov  [wparam],r8
			mov  [lparam],r9
			cmp  edx,WM_INITDIALOG
			 je  .wminitdialog
			cmp  edx,WM_COMMAND
			 je  .wmcommand
			cmp  edx,WM_CLOSE
			 je  .wmclose
			xor  eax,eax
			jmp  .finish

  .wminitdialog:       push  rsi rdi rbx rbp

		     invoke  SetDlgItemText,[hwnddlg],ID_ManageGameDialog_LIST,qword[PersonText]

			pop  rbp rbx rdi rsi
			jmp  .processed

  .wmcommand:		mov  eax,r8d
			cmp  eax,(BN_CLICKED shl 16) + ID_SetupGameDialog_CANCEL
			 je  .wmclose
			cmp  ax,IDCANCEL
			 je  .wmclose
			cmp  eax,(BN_CLICKED shl 16) + ID_SetupGameDialog_OK
			 je  .ok
			jmp  .processed
  .ok:

		       push  rsi rdi
		     invoke  VirtualFree,qword[PersonText],0,MEM_RELEASE
		     invoke  GetDlgItem,[hwnddlg],ID_ManageGameDialog_LIST
		     invoke  SendMessage,rax,WM_GETTEXTLENGTH,0,0
			mov  qword[PersonTextSizeB],rax
			lea  rsi,[rax+10]
		     invoke  VirtualAlloc,0,rsi,MEM_COMMIT,PAGE_READWRITE
			mov  qword[PersonText],rax
		     invoke  GetDlgItemText,[hwnddlg],ID_ManageGameDialog_LIST,qword[PersonText],rsi
		      ;  mov  byte[+rsi-10],0


			xor  edx,edx
		     invoke  EndDialog,[hwnddlg],edx
			mov  eax,esi
			pop  rdi rsi
			jmp  .processed
  .wmclose:		 or  edx,-1
		     invoke  EndDialog,[hwnddlg],edx
  .processed:		mov  eax,1
  .finish:		ret
endp

end if
