
section '.rsrc' resource data readable writable

  directory RT_MENU,menus,\
	    RT_DIALOG,dialogs

  resource menus,\
	   37,LANG_ENGLISH+SUBLANG_DEFAULT,main_menu
  resource dialogs,\
	     ID_LoadPersonDialog,   LANG_ENGLISH+SUBLANG_DEFAULT,   _LoadPersonDialog,\
	     ID_SetupGameDialog,    LANG_ENGLISH+SUBLANG_DEFAULT,   _SetupGameDialog,\
	     ID_SetupTourDialog,    LANG_ENGLISH+SUBLANG_DEFAULT,   _SetupTourDialog,\
	     ID_ManagePersonDialog, LANG_ENGLISH+SUBLANG_DEFAULT,   _ManagePersonDialog


  menu main_menu

     ;  menuitem 'take back',IDM_TAKEBACK
;       menuitem 'flip board',IDM_FLIP_BOARD
;       menuitem 'setup board',IDM_SETUP_BOARD
;       menuitem 'personalities...',IDM_MANAGE_PERSON
;     ;  menuitem 'load kibitzer...',IDM_LOAD_KIBITZER
;     ;  menuitem 'load super kibitzer',IDM_LOAD_SUPERKIBITZER
;     ;  menuitem 'close super kibitzer',IDM_CLOSE_KIBITZER
       menuitem 'game',0,MFR_POPUP
		menuitem 'new game...',IDM_NEW_GAME
		menuitem 'setup game...',IDM_SETUP_GAME
		menuitem 'setup tournament...',IDM_SETUP_TOURNAMENT,MFR_END

       menuitem 'windows',0,MFR_POPUP
		menuitem 'status',IDM_TOGGLE_STATUS
		menuitem 'thinking',IDM_TOGGLE_ENGINE
		menuitem 'arrange',IDM_ARRANGE_WINDOWS,MFR_END


       menuitem 'board',0,MFR_POPUP
		menuitem 'flip board',IDM_FLIP_BOARD
		menuitem 'twice takeback',IDM_TAKEBACK2
		menuitem 'once takeback',IDM_TAKEBACK
		menuitem 'setup board...',IDM_SETUP_BOARD
		menuitem 'highlights',0,MFR_POPUP+MFR_END
			 menuitem 'none',IDM_HIGHLIGHT_MODE_NONE
			 menuitem 'legal moves for piece',IDM_HIGHLIGHT_MODE_LEGAL
			 menuitem 'white coverage',IDM_HIGHLIGHT_MODE_WHITE_COVERAGE
			 menuitem 'black coverage',IDM_HIGHLIGHT_MODE_BLACK_COVERAGE
			 menuitem 'attacked pieces',IDM_HIGHLIGHT_MODE_ATTACKED
			 menuitem 'unguarded pieces',IDM_HIGHLIGHT_MODE_UNGUARDED,MFR_END

       menuitem 'endgames',0,MFR_POPUP
		menuitem 'KQvK',IDM_ENDGAME_KQ_K
		menuitem 'KRvK',IDM_ENDGAME_KR_K
		menuitem 'KBBvK',IDM_ENDGAME_KBB_K
		menuitem 'KBNvK',IDM_ENDGAME_KBN_K,MFR_END
       menuitem 'options',0,MFR_POPUP+MFR_END
		menuitem 'personalities...',IDM_MANAGE_PERSON
		menuitem 'toggle pretty pv',IDM_OPTION_PRETTYPV,MFR_END



dialog _LoadPersonDialog,'load personality',20,20,300,200,WS_CAPTION+WS_POPUP+WS_SYSMENU+DS_MODALFRAME
 dialogitem 'LISTBOX','',ID_LoadPersonDialog_LIST     ,005 , 005  ,095	,190 ,WS_VISIBLE+WS_VSCROLL+WS_TABSTOP+WS_BORDER+LBS_NOTIFY
 dialogitem 'EDIT'   ,'',ID_LoadPersonDialog_TEXT     ,105 , 005  ,190	,090 ,WS_VISIBLE+WS_VSCROLL+WS_BORDER+ES_AUTOHSCROLL+ES_WANTRETURN+ES_MULTILINE
 dialogitem 'BUTTON' ,'Clone' ,ID_LoadPersonDialog_CLONE  ,170	,100 ,40  ,15	,WS_VISIBLE+WS_TABSTOP
 dialogitem 'BUTTON' ,'Delete',ID_LoadPersonDialog_DELETE ,230	,100 ,40  ,15	,WS_VISIBLE+WS_TABSTOP
 dialogitem 'BUTTON' ,'Up'    ,ID_LoadPersonDialog_UP	  ,110	,100 ,30  ,15	,WS_VISIBLE+WS_TABSTOP
 dialogitem 'BUTTON' ,'Down'  ,ID_LoadPersonDialog_DOWN   ,110	,120 ,30  ,15	,WS_VISIBLE+WS_TABSTOP
 dialogitem 'BUTTON' ,'&Ok'   ,ID_LoadPersonDialog_OK	  ,110	,170 ,40  ,15	,WS_VISIBLE+WS_TABSTOP+BS_DEFPUSHBUTTON
 dialogitem 'BUTTON' ,'Cancel',ID_LoadPersonDialog_CANCEL ,170	,170 ,40  ,15	,WS_VISIBLE+WS_TABSTOP
 dialogitem 'BUTTON' ,'Human' ,ID_LoadPersonDialog_HUMAN  ,230	,170 ,40  ,15	,WS_VISIBLE+WS_TABSTOP
enddialog

SS_EDITCONTROL = 0x2000

dialog _SetupGameDialog,'setup game',50,50,420,170,WS_CAPTION+WS_POPUP+WS_SYSMENU+DS_MODALFRAME
 dialogitem 'BUTTON' ,'white player',-1 	      ,005 ,5	,200  ,135 ,BS_GROUPBOX+WS_VISIBLE,0
 dialogitem 'EDIT'   ,'',ID_SetupGameDialog_WTIME     ,030 ,17	,50   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
 dialogitem 'EDIT'   ,'',ID_SetupGameDialog_WINC      ,030 ,30	,50   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
 dialogitem 'STATIC' ,'base',-1 		      ,010 ,19	,18   ,12  ,WS_VISIBLE+SS_EDITCONTROL
 dialogitem 'STATIC' ,'inc',-1			      ,010 ,32	,18   ,12  ,WS_VISIBLE+SS_EDITCONTROL
 dialogitem 'BUTTON' ,'Load',ID_SetupGameDialog_WLOAD ,090 ,25	,30   ,15  ,WS_VISIBLE+WS_TABSTOP
 dialogitem 'EDIT'   ,'',ID_SetupGameDialog_WPERSON   ,010 ,45	,190  ,090 ,WS_VISIBLE+WS_VSCROLL+WS_BORDER+ES_AUTOHSCROLL+ES_WANTRETURN+ES_MULTILINE
 dialogitem 'BUTTON' ,'black player',-1 	      ,215 ,5	,200  ,135 ,BS_GROUPBOX+WS_VISIBLE,0
 dialogitem 'EDIT'   ,'',ID_SetupGameDialog_BTIME     ,240 ,17	,50   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
 dialogitem 'EDIT'   ,'',ID_SetupGameDialog_BINC      ,240 ,30	,50   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
 dialogitem 'STATIC' ,'base',-1 		      ,220 ,19	,18   ,12  ,WS_VISIBLE+SS_EDITCONTROL
 dialogitem 'STATIC' ,'inc',-1			      ,220 ,32	,18   ,12  ,WS_VISIBLE+SS_EDITCONTROL
 dialogitem 'BUTTON' ,'Load',ID_SetupGameDialog_BLOAD ,300 ,25	,30   ,15  ,WS_VISIBLE+WS_TABSTOP
 dialogitem 'EDIT'   ,'',ID_SetupGameDialog_BPERSON   ,220 ,45 ,190   ,90  ,WS_VISIBLE+WS_VSCROLL+WS_BORDER+ES_AUTOHSCROLL+ES_WANTRETURN+ES_MULTILINE
 dialogitem 'BUTTON' ,'&Ok'   ,ID_SetupGameDialog_OK	 ,010  ,150 ,40  ,15   ,WS_VISIBLE+WS_TABSTOP+BS_DEFPUSHBUTTON
 dialogitem 'BUTTON' ,'Cancel',ID_SetupGameDialog_CANCEL ,070  ,150 ,40  ,15   ,WS_VISIBLE+WS_TABSTOP
enddialog

dialog _SetupTourDialog,'setup tournament',20,20,300,200,WS_CAPTION+WS_POPUP+WS_SYSMENU+DS_MODALFRAME
 dialogitem 'LISTBOX','',ID_SetupTourDialog_LIST     ,005 , 005  ,095  ,190 ,WS_VISIBLE+WS_VSCROLL+WS_TABSTOP+WS_BORDER+LBS_NOTIFY
 dialogitem 'EDIT'   ,'',ID_SetupTourDialog_TEXT     ,105 , 060  ,190  ,090 ,WS_VISIBLE+WS_VSCROLL+WS_BORDER+ES_AUTOHSCROLL+ES_WANTRETURN+ES_MULTILINE
 dialogitem 'BUTTON' ,'players',-1		     ,110 ,5   ,60  ,50 ,BS_GROUPBOX+WS_VISIBLE,0
 dialogitem 'EDIT'   ,'',ID_SetupTourDialog_COUNT    ,118 ,16  ,40  ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
 dialogitem 'BUTTON' ,'Load',ID_SetupTourDialog_LOAD ,118 ,33  ,40  ,15   ,WS_VISIBLE+WS_TABSTOP
 dialogitem 'BUTTON' ,'time',-1 		     ,180 ,5   ,85  ,50 ,BS_GROUPBOX+WS_VISIBLE,0
 dialogitem 'EDIT'   ,'',ID_SetupTourDialog_TIME     ,205 ,17  ,50   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
 dialogitem 'EDIT'   ,'',ID_SetupTourDialog_INC      ,205 ,30  ,50   ,12  ,WS_VISIBLE+WS_BORDER+ES_AUTOHSCROLL+WS_TABSTOP
 dialogitem 'STATIC' ,'base',-1 		     ,185 ,19  ,18   ,12  ,WS_VISIBLE+SS_EDITCONTROL
 dialogitem 'STATIC' ,'inc',-1			     ,185 ,32  ,18   ,12  ,WS_VISIBLE+SS_EDITCONTROL
 dialogitem 'BUTTON' ,'&Ok'   ,ID_SetupTourDialog_OK	 ,110  ,170 ,40  ,15   ,WS_VISIBLE+WS_TABSTOP+BS_DEFPUSHBUTTON
 dialogitem 'BUTTON' ,'Cancel',ID_SetupTourDialog_CANCEL ,170  ,170 ,40  ,15   ,WS_VISIBLE+WS_TABSTOP
enddialog


dialog _ManagePersonDialog,'edit personalities',50,50,300,200,WS_CAPTION+WS_POPUP+WS_SYSMENU+DS_MODALFRAME
 dialogitem 'EDIT'   ,''	     ,ID_ManageGameDialog_LIST		   ,3 ,3  ,300-6   ,200-30  ,WS_VISIBLE+WS_VSCROLL+WS_BORDER+ES_AUTOHSCROLL+ES_WANTRETURN+ES_MULTILINE ;+WS_TABSTOP
 dialogitem 'BUTTON' ,'&Ok'	     ,ID_SetupGameDialog_OK	   ,15	,200-20 ,40  ,15   ,WS_VISIBLE+WS_TABSTOP+BS_DEFPUSHBUTTON
 dialogitem 'BUTTON' ,'Cancel'	     ,ID_SetupGameDialog_CANCEL    ,60	,200-20 ,40  ,15   ,WS_VISIBLE+WS_TABSTOP
enddialog

