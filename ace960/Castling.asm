



; castling functions


		      align   16
CastleOOLegal_White:
		CastlingJmp   2*White+0, .Good, .Done
 .Good: 		 or   eax, -1
			ret
 .Done: 		xor   eax, eax
			ret


		      align   16
CastleOOLegal_Black:
		CastlingJmp   2*Black+0, .Good, .Done
 .Good: 		 or   eax, -1
			ret
 .Done: 		xor   eax, eax
			ret


		      align   16
CastleOOOLegal_White:
		CastlingJmp   2*White+1, .Good, .Done
 .Good: 		 or   eax, -1
			ret
 .Done: 		xor   eax, eax
			ret


		      align   16
CastleOOOLegal_Black:
		CastlingJmp   2*Black+1, .Good, .Done
 .Good: 		 or   eax, -1
			ret
 .Done: 		xor   eax, eax
			ret

