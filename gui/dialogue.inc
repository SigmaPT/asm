

;return:
; eax = 0 cancel
;     = 1 human selected
;     = 2 computer selected  (in dword[PersonSelection])

proc LoadPersonDialogProc,hwnddlg,wmsg,wparam,lparam
	       push  rsi rdi rbx rbp
		mov  [hwnddlg], rcx
		mov  [wmsg], rdx
		mov  [wparam], r8
		mov  [lparam], r9
		cmp  edx, WM_INITDIALOG
		 je  .wminitdialog
		cmp  edx, WM_COMMAND
		 je  .wmcommand
		cmp  edx, WM_CLOSE
		 je  .wmclose
		xor  eax, eax
		jmp  .finish
.wminitdialog:
		mov  rax, qword[hwnddlg]
		mov  qword[hLoadPersonDialog], rax
.reset_text:
		mov  eax, dword[PersonSelection]
		mov  esi, dword[PersonOffsets+4*rax]
		mov  ecx, dword[PersonOffsets+4*rax+4]
		mov  dword[PersonSelection], eax
		sub  ecx, esi
		add  rsi, qword[PersonText]
		lea  rdi, [Message]
	  rep movsb
		xor  eax, eax
	      stosb
	     invoke  SetDlgItemText,[hwnddlg],ID_LoadPersonDialog_TEXT,Message
.reset_list:
	     invoke  GetDlgItem, qword[hwnddlg], ID_LoadPersonDialog_LIST
		mov  rdi, rax
	     invoke  SendMessage, rdi, LB_RESETCONTENT, 0, 0
		xor  ebx, ebx
 .PopulateNext:
		mov  ecx, ebx
	       call  PersonGetNextEntry
		mov  rbx, rdx
	       test  eax, eax
		 jz  .PopulateDone
		cmp  eax,'NAME'
		jne  .PopulateNext
		mov  rcx, rdx
		lea  rdx, [Message]
	       call  CopyUntilEndQuote
		mov  byte[rdx], 0
		mov  rbx, rcx
	     invoke  SendMessage, rdi, LB_INSERTSTRING, -1, Message
		jmp  .PopulateNext
  .PopulateDone:
	     invoke  SendMessage, rdi, LB_SETCURSEL, dword[PersonSelection], 0
		jmp  .processed
.wmcommand:
		mov  eax, r8d
		cmp  eax, (LBN_SELCHANGE shl 16) + ID_LoadPersonDialog_LIST
		 je  .wmclickedlist
		cmp  ax, ID_LoadPersonDialog_CANCEL
		 je  .wmclose
		cmp  ax, IDCANCEL
		 je  .wmclose
		cmp  ax, ID_LoadPersonDialog_OK
		 je  .ok
		cmp  ax, ID_LoadPersonDialog_UP
		 je  .wcmd_up
		cmp  ax, ID_LoadPersonDialog_DOWN
		 je  .wcmd_down
		cmp  ax, ID_LoadPersonDialog_CLONE
		 je  .wcmd_clone
		cmp  ax, ID_LoadPersonDialog_HUMAN
		 je  .wcmd_human
		cmp  ax, ID_LoadPersonDialog_DELETE
		 je  .wcmd_delete
		cmp  eax, (EN_CHANGE shl 16) + ID_LoadPersonDialog_TEXT
		 je  .wmeditchange
		jmp  .processed
.wmeditchange:
	     invoke  GetDlgItem, [hwnddlg], ID_LoadPersonDialog_TEXT
	     invoke  SendMessage, rax, WM_GETTEXTLENGTH, 0, 0
		mov  esi, eax
		lea  r9, [rax+1]
	     invoke  GetDlgItemText, [hwnddlg], ID_LoadPersonDialog_TEXT, Message, r9
		lea  rcx, [Message]
		mov  edx, esi
	       call  Person_Update
		jmp  .reset_list
.wcmd_up:
	       call  Person_MoveUp
		jmp  .reset_list
.wcmd_down:
	       call  Person_MoveDown
		jmp  .reset_list
.wcmd_clone:
	       call  Person_Clone
		jmp  .reset_list
.wcmd_delete:
	       call  Person_Delete
		jmp  .reset_text
.wcmd_human:
	     invoke  EndDialog, qword[hwnddlg], 1
		jmp  .processed
.wmclickedlist:
	     invoke  GetDlgItem, qword[hwnddlg], ID_LoadPersonDialog_LIST
		mov  rdi,rax
	     invoke  SendMessage, rdi, LB_GETCURSEL, 0, 0
		mov  dword[PersonSelection], eax
		jmp  .reset_text
 .ok:
	     invoke  GetDlgItem,[hwnddlg],ID_LoadPersonDialog_LIST
		mov  rdi, rax
	     invoke  SendMessage, rdi, LB_GETCURSEL, 0, 0
		mov  dword[PersonSelection], eax
	     invoke  GetDlgItem, [hwnddlg], ID_LoadPersonDialog_TEXT
	     invoke  SendMessage, rax, WM_GETTEXTLENGTH, 0, 0
		mov  esi, eax
		lea  r9, [rax+1]
	     invoke  GetDlgItemText, [hwnddlg], ID_LoadPersonDialog_TEXT, Message, r9
		lea  rcx, [Message]
		mov  edx, esi
	       call  Person_Update
	     invoke  EndDialog, qword[hwnddlg], 2
		jmp  .processed
 .wmclose:
	     invoke  EndDialog, qword[hwnddlg], 0
 .processed:
		mov  eax, 1
 .finish:
		pop  rbp rbx rdi rsi
		ret
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

		lea  rdi, [Message]
		mov  rax, qword[InitTimeWTIME]
		mov  rcx, qword[TimeWTIME]
		cmp  byte[NewGameWindowMode], 0
	     cmovne  rax, rcx
	       call  PrintSeconds
		xor  eax, eax
	      stosb
	     invoke  SetDlgItemText, qword[hwnddlg], ID_SetupGameDialog_WTIME, Message

		lea  rdi, [Message]
		mov  rax, qword[InitTimeWINC]
		mov  rcx, qword[TimeWINC]
		cmp  byte[NewGameWindowMode], 0
	     cmovne  rax, rcx
	       call  PrintSeconds
		xor  eax, eax
	      stosb
	     invoke  SetDlgItemText, qword[hwnddlg], ID_SetupGameDialog_WINC, Message

		lea  rdi, [Message]
		mov  rax, qword[InitTimeBTIME]
		mov  rcx, qword[TimeBTIME]
		cmp  byte[NewGameWindowMode], 0
	     cmovne  rax, rcx
	       call  PrintSeconds
		xor  eax, eax
	      stosb
	     invoke  SetDlgItemText, qword[hwnddlg], ID_SetupGameDialog_BTIME, Message

		lea  rdi, [Message]
		mov  rax, qword[InitTimeBINC]
		mov  rcx, qword[TimeBINC]
		cmp  byte[NewGameWindowMode], 0
	     cmovne  rax, rcx
	       call  PrintSeconds
		xor  eax, eax
	      stosb
	     invoke  SetDlgItemText, qword[hwnddlg], ID_SetupGameDialog_BINC, Message

		mov  r8, qword[SetupWPerson_String]
	       test  r8, r8
		 jz  @f
	     invoke  SetDlgItemText, qword[hwnddlg], ID_SetupGameDialog_WPERSON, r8
		@@:

		mov  r8, qword[SetupBPerson_String]
	       test  r8, r8
		 jz  @f
	     invoke  SetDlgItemText, qword[hwnddlg], ID_SetupGameDialog_BPERSON, r8
		@@:

		jmp  .processed
.wmcommand:
		mov  eax, r8d
		cmp  ax, IDCANCEL
		 je  .wmclose
		cmp  eax, (BN_CLICKED shl 16) + ID_SetupGameDialog_CANCEL
		 je  .wmclose
		cmp  eax, (BN_CLICKED shl 16) + ID_SetupGameDialog_OK
		 je  .ok
		mov  ebx, ID_SetupGameDialog_WPERSON
		cmp  eax, (BN_CLICKED shl 16) + ID_SetupGameDialog_WLOAD
		 je  .load
		mov  ebx, ID_SetupGameDialog_BPERSON
		cmp  eax, (BN_CLICKED shl 16) + ID_SetupGameDialog_BLOAD
		 je  .load
		jmp  .processed
.load:
	     invoke  DialogBoxParamA, qword[hInstance], ID_LoadPersonDialog, qword[hwnddlg], LoadPersonDialogProc, 0
		lea  rdi,[Message]
	       test  eax, eax
		 je  .processed
		cmp  eax, 1
		mov  rax, 'Human'
		 je  .load_human
.load_comp:
		mov  eax, dword[PersonSelection]
		mov  esi, dword[PersonOffsets+4*rax]
		mov  ecx, dword[PersonOffsets+4*rax+4]
		sub  ecx, esi
		add  rsi, qword[PersonText]
	  rep movsb
		xor  eax, eax
.load_human:
	      stosq
	     invoke  SetDlgItemText, qword[hwnddlg], rbx, Message
		jmp  .processed

.ok:
		lea  rsi, [Message]
	     invoke  GetDlgItemText, qword[hwnddlg], ID_SetupGameDialog_WTIME, rsi, 31
	       call  ParseSeconds
		mov  qword[TimeWTIME],rax
		cmp  byte[NewGameWindowMode], 0
		jne  @f
		mov  qword[InitTimeWTIME],rax
		@@:

		lea  rsi, [Message]
	     invoke  GetDlgItemText, qword[hwnddlg], ID_SetupGameDialog_WINC, rsi, 31
	       call  ParseSeconds
		mov  qword[TimeWINC],rax
		cmp  byte[NewGameWindowMode], 0
		jne  @f
		mov  qword[InitTimeWINC],rax
		@@:

		lea  rsi, [Message]
	     invoke  GetDlgItemText, qword[hwnddlg], ID_SetupGameDialog_BTIME, rsi, 31
	       call  ParseSeconds
		mov  qword[TimeBTIME],rax
		cmp  byte[NewGameWindowMode], 0
		jne  @f
		mov  qword[InitTimeBTIME],rax
		@@:

		lea  rsi, [Message]
	     invoke  GetDlgItemText, qword[hwnddlg], ID_SetupGameDialog_BINC, rsi, 31
	       call  ParseSeconds
		mov  qword[TimeBINC],rax
		mov  qword[InitTimeBINC],rax

	     invoke  VirtualFree, qword[SetupWPerson_String], 0, MEM_RELEASE
	     invoke  VirtualFree, qword[SetupBPerson_String], 0, MEM_RELEASE
		xor  eax, eax
		mov  qword[SetupWPerson_String], rax
		mov  qword[SetupBPerson_String], rax
		mov  dword[SetupWPerson_Length], eax
		mov  dword[SetupBPerson_Length], eax

	     invoke  GetDlgItem, qword[hwnddlg], ID_SetupGameDialog_WPERSON
	     invoke  SendMessage, rax, WM_GETTEXTLENGTH, 0, 0
		mov  ebx, eax
		cmp  eax, 16
		 jb  .human_white
		lea  edx, [rbx+1]
	     invoke  VirtualAlloc, 0, rdx, MEM_COMMIT, PAGE_READWRITE
		mov  qword[SetupWPerson_String], rax
		mov  dword[SetupWPerson_Length], ebx
	     invoke  GetDlgItemText, qword[hwnddlg], ID_SetupGameDialog_WPERSON, rax, rbx
	.human_white:

	     invoke  GetDlgItem, qword[hwnddlg], ID_SetupGameDialog_BPERSON
	     invoke  SendMessage, rax, WM_GETTEXTLENGTH, 0, 0
		mov  ebx, eax
		cmp  eax, 16
		 jb  .human_black
		lea  edx, [rbx+1]
	     invoke  VirtualAlloc, 0, rdx, MEM_COMMIT, PAGE_READWRITE
		mov  qword[SetupBPerson_String], rax
		mov  dword[SetupBPerson_Length], ebx
	     invoke  GetDlgItemText, qword[hwnddlg], ID_SetupGameDialog_BPERSON, rax, rbx
	.human_black:


		 or  edx, -1
	     invoke  EndDialog,[hwnddlg],edx
		jmp  .processed
.wmclose:
		xor  edx, edx
	     invoke  EndDialog, qword[hwnddlg], edx
.processed:
		mov  eax,1
.finish:
		pop  r15 rbx rdi rsi
		ret
endp






proc SetupTourDialogProc,hwnddlg,wmsg,wparam,lparam
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
		mov  rax, qword[hwnddlg]
		mov  qword[hSetupTourDialog], rax


		lea  rdi, [Message]
		mov  rax, qword[Tour.Time]
	       call  PrintSeconds
		xor  eax, eax
	      stosb
	     invoke  SetDlgItemText, qword[hSetupTourDialog], ID_SetupTourDialog_TIME, Message

		lea  rdi, [Message]
		mov  rax, qword[Tour.Inc]
	       call  PrintSeconds
		xor  eax, eax
	      stosb
	     invoke  SetDlgItemText, qword[hSetupTourDialog], ID_SetupTourDialog_INC, Message

		lea  rdi, [Message]
		mov  rax, qword[Tour.PlayerCount]
	       call  PrintUnsignedInteger
		xor  eax, eax
	      stosb
	     invoke  SetDlgItemText, qword[hSetupTourDialog], ID_SetupTourDialog_COUNT, Message


.redo_text:
		mov  eax, dword[Tour.Selected]
		lea  rdi, [Message]
		mov  rsi, qword[Tour.PlayersString+8*rax]
		mov  ecx, dword[Tour.PlayersLength+4*rax]
	       test  rsi, rsi
		 jz  @f
	  rep movsb
	@@:	xor  eax, eax
	      stosb
	     invoke  SetDlgItemText, qword[hSetupTourDialog], ID_SetupTourDialog_TEXT, Message

.redo_stuff:
	     invoke  GetDlgItem, qword[hSetupTourDialog], ID_SetupTourDialog_LIST
		mov  rdi, rax
	     invoke  SendMessage, rdi, LB_RESETCONTENT, 0, 0
		xor  ebx, ebx
.PopulateNext:
		cmp  ebx, dword[Tour.PlayerCount]
		jae  .PopulateDone
		mov  rax, '[BLANK]'
		mov  qword[Message], rax
		mov  rcx, qword[Tour.PlayersString+8*rbx]
		mov  edx, dword[Tour.PlayersLength+4*rbx]
		add  rdx, rcx
		mov  r15, rdx
		mov  r8d, 'NAME'
	       test  rcx, rcx
		 jz  @f
	       call  Person_GetXXXX
		mov  rcx, rax
		lea  rdx,[Message]
	       test  rax, rax
		 jz  @f
		mov  r8, r15
	       call  Person_CopyUntilEndQuote
		mov  byte[rdx],0
	@@:  invoke  SendMessage, rdi, LB_INSERTSTRING, -1, Message
		add  ebx, 1
		jmp  .PopulateNext
.PopulateDone:
	     invoke  SendMessage, rdi, LB_SETCURSEL, dword[Tour.Selected], 0
		jmp  .processed
.wmcommand:
		mov  eax, r8d
		cmp  ax, IDCANCEL
		 je  .wmclose
		cmp  eax, (BN_CLICKED shl 16) + ID_SetupTourDialog_CANCEL
		 je  .wmclose
		cmp  eax, (BN_CLICKED shl 16) + ID_SetupTourDialog_OK
		 je  .ok
		cmp  eax, (BN_CLICKED shl 16) + ID_SetupTourDialog_LOAD
		 je  .load
		cmp  eax, (EN_CHANGE shl 16) + ID_SetupTourDialog_TEXT
		 je  .text_change
		cmp  eax, (EN_CHANGE shl 16) + ID_SetupTourDialog_COUNT
		 je  .count_change
		cmp  eax, (LBN_SELCHANGE shl 16) + ID_SetupTourDialog_LIST
		 je  .clicked_list
		jmp  .processed
.load:
	     invoke  DialogBoxParamA, qword[hInstance], ID_LoadPersonDialog, qword[hSetupTourDialog], LoadPersonDialogProc, 0
		lea  rdi,[Message]
		cmp  eax, 2
		jne  .processed
		mov  eax, dword[PersonSelection]
		mov  esi, dword[PersonOffsets+4*rax]
		mov  ecx, dword[PersonOffsets+4*rax+4]
		sub  ecx, esi
		add  rsi, qword[PersonText]
	  rep movsb
		xor  eax, eax
	      stosb
	     invoke  SetDlgItemText, qword[hSetupTourDialog], ID_SetupTourDialog_TEXT, Message
	       call  SetupTourDialogProc_SaveSelected
		jmp  .redo_stuff
.clicked_list:
	     invoke  GetDlgItem, qword[hSetupTourDialog], ID_SetupTourDialog_LIST
	     invoke  SendMessage, rax, LB_GETCURSEL, 0, 0
		mov  dword[Tour.Selected], eax
		jmp  .redo_text
.count_change:
		lea  rsi, [Message]
	     invoke  GetDlgItemText, qword[hSetupTourDialog], ID_SetupTourDialog_COUNT, rsi, 31
	       call  ParseInteger
		mov  edx, dword[Tour.Selected]
		mov  ecx, 2
		cmp  eax, ecx
	      cmovb  eax, ecx
		mov  ecx, MAX_TOUR_PLAYERS
		cmp  eax, ecx
	      cmova  eax, ecx
		mov  dword[Tour.PlayerCount], eax
		cmp  edx, eax
	      cmova  edx, eax
		mov  dword[Tour.Selected], edx
		jmp  .redo_text
.text_change:
	       call  SetupTourDialogProc_SaveSelected
		jmp  .redo_stuff
.ok:

		lea  rsi, [Message]
	     invoke  GetDlgItemText, qword[hwnddlg], ID_SetupTourDialog_TIME, rsi, 31
	       call  ParseSeconds
		mov  qword[Tour.Time], rax

		lea  rsi, [Message]
	     invoke  GetDlgItemText, qword[hwnddlg], ID_SetupTourDialog_INC, rsi, 31
	       call  ParseSeconds
		mov  qword[Tour.Inc], rax


		 or  edx, -1
	     invoke  EndDialog, qword[hSetupTourDialog], edx
		jmp  .processed
.wmclose:
		xor  edx, edx
	     invoke  EndDialog, qword[hSetupTourDialog], edx
.processed:
		mov  eax, 1
.finish:
		pop  r15 rbx rdi rsi
		ret
endp


SetupTourDialogProc_SaveSelected:
	       push  rsi rdi rbx
		mov  esi, dword[Tour.Selected]
	     invoke  VirtualFree, qword[Tour.PlayersString+8*rsi], 0, MEM_RELEASE
	     invoke  GetDlgItem, qword[hSetupTourDialog], ID_SetupTourDialog_TEXT
	     invoke  SendMessage, rax, WM_GETTEXTLENGTH, 0, 0
		mov  ebx, eax
		lea  edx, [rbx+1]
	     invoke  VirtualAlloc, 0, rdx, MEM_COMMIT, PAGE_READWRITE
		mov  qword[Tour.PlayersString+8*rsi], rax
		mov  dword[Tour.PlayersLength+4*rsi], ebx
	     invoke  GetDlgItemText, qword[hSetupTourDialog], ID_SetupTourDialog_TEXT, rax, rbx
		pop  rbx rdi rsi
		ret






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

.wmcommand:
		mov  eax, r8d
		cmp  ax, ID_SetupGameDialog_CANCEL
		 je  .wmclose
		cmp  ax, IDCANCEL
		 je  .wmclose
		cmp  ax, ID_SetupGameDialog_OK
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

















