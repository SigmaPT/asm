PointInButtonQ:
		       push  rdx rcx
			xor  eax,eax
			sub  ecx,[pt.x]
			 jg  .no
			sub  edx,[pt.y]
			 jg  .no
			cmp  ecx,-18
			 jl  .no
			cmp  edx,-18
			 jl  .no
			 or  eax,-1
		.no:	pop  rcx rdx
			ret




DrawButton:
		       push  rbp r14 r15
		     movsxd  r14,ecx
		     movsxd  r15,edx

			lea  ecx,[r14+2]
			mov  [rect.left],ecx
			add  ecx,15
			mov  [rect.right],ecx

			lea  edx,[r15-1]
			mov  [rect.top],edx
			add  edx,18
			mov  [rect.bottom],edx

		     invoke  SetTextColor,[hdc],dword[GuiColor4]
		     invoke  SelectObject,[hdc],[hFontSymbols]
		     invoke  SetBkColor,[hdc],dword[GuiColor1]
		     invoke  DrawTextA,[hdc],Message,1,rect,DT_EDITCONTROL


			mov  ecx,r14d
			mov  edx,r15d

			mov  [rect.left],ecx
			add  ecx,17
			mov  [rect.right],ecx

			mov  [rect.top],edx
			add  edx,17
			mov  [rect.bottom],edx


		  ;   invoke  SelectObject,[hdc],qword[GuiColor1brush1]
		  ;   invoke  SelectObject,[hdc],qword[GuiColor4pen2]
		     invoke  FrameRect,[hdc],rect,qword[GuiColor3brush]

			pop  r15 r14 rbp
			ret


DrawButtonHdc:
		       push  rbp r12 r13 r14 r15
		     movsxd  r14,ecx
		     movsxd  r15,edx

			mov  r13, r8

			lea  ecx,[r14+2]
			mov  [rect.left],ecx
			add  ecx,15
			mov  [rect.right],ecx

			lea  edx,[r15-1]
			mov  [rect.top],edx
			add  edx,18
			mov  [rect.bottom],edx

		     invoke  SetTextColor,r13,dword[GuiColor4]
		     invoke  SelectObject,r13,[hFontSymbols]
		     invoke  SetBkColor,r13,dword[GuiColor1]
		     invoke  DrawTextA,r13,Message,1,rect,DT_EDITCONTROL


			mov  ecx,r14d
			mov  edx,r15d

			mov  [rect.left],ecx
			add  ecx,17
			mov  [rect.right],ecx

			mov  [rect.top],edx
			add  edx,17
			mov  [rect.bottom],edx


		  ;   invoke  SelectObject,[hdc],qword[GuiColor1brush1]
		  ;   invoke  SelectObject,[hdc],qword[GuiColor4pen2]
		     invoke  FrameRect,r13,rect,qword[GuiColor3brush]

			pop  r15 r14 r13 r12 rbp
			ret

