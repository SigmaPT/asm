



; castling functions


		      align   16
CastleOOLegal_White:
	      CastlingOOJmp   White, .Done
			 or   eax, -1
			ret
		    ;  align   8
 .Done: 		xor   eax, eax
			ret


		      align   16
CastleOOLegal_Black:
	      CastlingOOJmp   Black, .Done
			 or   eax, -1
			ret
		    ;  align   8
 .Done: 		xor   eax, eax
			ret


		      align   16
CastleOOOLegal_White:
	     CastlingOOOJmp   White, .Done
			 or   eax, -1
			ret
		    ;  align   8
 .Done: 		xor   eax, eax
			ret


		      align   16
CastleOOOLegal_Black:
	     CastlingOOOJmp   Black, .Done
			 or   eax, -1
			ret
		     ; align   8
 .Done: 		xor   eax, eax
			ret

