; see Endgame_Init.asm for how these functions work

EndgameEval_KPK:
EndgameEval_KNNK:
EndgameEval_KBNK:
EndgameEval_KRKP:
EndgameEval_KRKB:
EndgameEval_KRKN:
EndgameEval_KQKP:
EndgameEval_KQKR:

EndgameEval_KXK:


EndgameScale_KNPK:
EndgameScale_KNPKB:
EndgameScale_KRPKR:
EndgameScale_KRPKB:
EndgameScale_KBPKB:
EndgameScale_KBPKN:
EndgameScale_KBPPKB:
EndgameScale_KRPPKRP:

EndgameScale_KBPsKs:
EndgameScale_KQKRPs:
EndgameScale_KPsK:
EndgameScale_KPKP:


		lea   rdi, [.errorstring]
	       call   _ErrorBox
		xor   ecx,ecx
	       call   _ExitProcess

.errorstring: db 'endgame function not implemented'



