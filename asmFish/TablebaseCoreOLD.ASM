; TablebaseCore by Ronald de Man   this code weighs in at 20KB
; there are three functions and one dword that an engine needs
;   and they are used here in an engine-independent way
;
; global _ZN13TablebaseCore4initEPKc: function
; global _ZN13TablebaseCore15probe_wdl_tableER8PositionPi: function
; global _ZN13TablebaseCore15probe_dtz_tableER8PositioniPi: function
; global _ZN13TablebaseCore14MaxCardinalityE

; we are also using the following definition of Rdm
; #define TB_PAWN 1
; #define TB_KNIGHT 2
; #define TB_BISHOP 3
; #define TB_ROOK 4
; #define TB_QUEEN 5
; #define TB_KING 6
; which off by one from the Pawn=2, Knight=3, as used by this engine


; these engine-specific functions are used by the core and need to be defined here
;   they should follow MS 64bit ABI

;extern _Z8calc_keyR8Positioni                           ; near
;extern _Z10pos_piecesR8Position5Color9PieceType         ; near
;extern _Z16pos_side_to_moveR8Position                   ; near
;extern _Z7prt_strR8PositionPci                          ; near
;extern _Z11pos_KvK_keyR8Position                        ; near
;extern _Z16pos_material_keyR8Position                   ; near
;extern _Z17calc_key_from_pcsPii                         ; near



_Z16pos_material_keyR8Position:
	; in: rcx address of position
	; out: rax material key
		mov   rax, qword[rcx+Pos.state]
		mov   rax, qword[rax+State.materialKey]
		ret


_Z11pos_KvK_keyR8Position:
	; in: rcx address of position  (not used)
	; out: rax material key of KvK configuration
		mov   rax, qword[Zobrist_Pieces+8*(64*(8*White+King)+0)]
		xor   rax, qword[Zobrist_Pieces+8*(64*(8*Black+King)+0)]
		ret


_Z10pos_piecesR8Position5Color9PieceType:
	; in: rcx address of position
	;     edx color
	;     r8d piece type (1=pawn, 2=knight, ..., 6=king)
	; out: rax bitboard of pieces
		mov   rax, qword[rcx+Pos.typeBB+8*rdx]
		and   rax, qword[rax+Pos.typeBB+8*(r8+1)]   ; we are shifted by one
		ret


_Z16pos_side_to_moveR8Position:
	; in: rcx address of position
	; out: eax side to move
		mov   eax, dword[rcx+Pos.sideToMove]
		ret



_Z17calc_key_from_pcsPii:
	; in: rcx address of pcs[16]
	;     edx mirror
	; out: rax material key
		xor   eax, eax
		neg   edx
		sbb   edx, edx
		and   edx, 8
irps color, White Black {
 irps pt, Pawn Knight Bishop Rook Queen King \{
  \local ..Next, ..Done
		lea   r8, [Zobrist_Pieces+8*(64*(8*color+Pawn))]
		mov   r9d, dword[rcx+rdx+Pawn-1]
		sub   r9d, 1
		 js   ..Done
	..Next:
		xor   rax, qword[r8+8*r9]
		sub   r9d, 1
		jns   ..Next
	..Done:
 \}
		xor   edx, 8
}
		xor   rax, rax
		ret


_Z8calc_keyR8Positioni:
	; in: rcx address of position
	;     edx mirror
	; out: rax material key
		xor   eax, eax
		neg   edx
		sbb   edx, edx
		and   edx, 8
irps color, White Black {
 irps pt, Pawn Knight Bishop Rook Queen King \{
  \local ..Next, ..Done
		lea   r8, [Zobrist_Pieces+8*(64*(8*color+Pawn))]
		mov   r9, qword[rcx+Pos.typeBB+8*pt]
		and   r9, qword[rcx+Pos.typeBB+rdx]
	     popcnt   r9, r9, r10
		sub   r9d, 1
		 js   ..Done
	..Next:
		xor   rax, qword[r8+8*r9]
		sub   r9d, 1
		jns   ..Next
	..Done:
 \}
		xor   edx, 8
}
		xor   rax, rax
		ret


_Z7prt_strR8PositionPci:
	; in: rcx address of position
	;     r8d mirror
	; out: rdx address to write string
	       push   rdi rbp
		mov   rbp, rcx
		mov   rdi, rdx
		mov   edx, r8d
		neg   edx
		sbb   edx, edx
		and   edx, 8
irps color, White Black {     ; not used;  edx has the color
 irps pt, King Queen Rook Bishop Pawn \{
  local ..Next, ..Done
		mov   r9, qword[rcx+Pos.typeBB+8*pt]
		and   r9, qword[rcx+Pos.typeBB+rdx]
	     popcnt   rcx, r9, r10
		mov   al, byte[_ZL4pchr+King-pt]
	  rep stosb
 \}
		mov   al, 'v'
		xor   edx, 8
}
		pop   rbp rdi
		ret





free:	jmp  qword[__imp_free]
exit:	jmp  qword[__imp_malloc]
printf: jmp  qword[__imp_printf]
puts:	jmp  qword[__imp_puts]
strcat: jmp  qword[__imp_strcat]
strcpy: jmp  qword[__imp_strcpy]
malloc: jmp  qword[__imp_malloc]
strcmp: jmp  qword[__imp_strcmp]
memset: jmp  qword[__imp_memset]
memmove: jmp  qword[__imp_memmove]
PAGE_SIZE = 4096
___chkstk_ms:
__chkstk_ms:
	push	rcx 
	push	rax 
	cmp	rax, PAGE_SIZE 
	lea	rcx, [rsp + 24] 
	jb	._LessThanAPage 
._MoreThanAPage: 
	sub	rcx, PAGE_SIZE 
	or	byte[rcx], 0 
	sub	rax, PAGE_SIZE 
	cmp	rax, PAGE_SIZE 
	ja	._MoreThanAPage 
._LessThanAPage: 
	sub	rcx, rax 
	or	byte[rcx], 0 
	pop	rax 
	pop	rcx 
	ret



rel equ

_ZL12encode_pieceP13TBEntry_piecePhPiS2_:
	push	r15					; 0000 _ 41: 57
	push	r14					; 0002 _ 41: 56
	push	r13					; 0004 _ 41: 55
	push	r12					; 0006 _ 41: 54
	push	rbp					; 0008 _ 55
	push	rdi					; 0009 _ 57
	push	rsi					; 000A _ 56
	push	rbx					; 000B _ 53
	test	byte [r8], 04H				; 000C _ 41: F6. 00, 04
	movzx	r10d, byte [rcx+19H]			; 0010 _ 44: 0F B6. 51, 19
	jnz	?_002					; 0015 _ 75, 08
?_001:	test	byte [r8], 20H				; 0017 _ 41: F6. 00, 20
	jnz	?_005					; 001B _ 75, 18
	jmp	?_004					; 001D _ EB, 11

?_002:	xor	eax, eax				; 001F _ 31. C0
?_003:	cmp	r10d, eax				; 0021 _ 41: 39. C2
	jle	?_001					; 0024 _ 7E, F1
	xor	dword [r8+rax*4], 07H			; 0026 _ 41: 83. 34 80, 07
	inc	rax					; 002B _ 48: FF. C0
	jmp	?_003					; 002E _ EB, F1

?_004:	xor	r11d, r11d				; 0030 _ 45: 31. DB
	jmp	?_008					; 0033 _ EB, 25

?_005:	xor	eax, eax				; 0035 _ 31. C0
?_006:	cmp	r10d, eax				; 0037 _ 41: 39. C2
	jle	?_004					; 003A _ 7E, F4
	xor	dword [r8+rax*4], 38H			; 003C _ 41: 83. 34 80, 38
	inc	rax					; 0041 _ 48: FF. C0
	jmp	?_006					; 0044 _ EB, F1

?_007:	movsxd	rbx, dword [r8+r11*4]			; 0046 _ 4B: 63. 1C 98
	lea	rsi, [rel _ZL7offdiag]			; 004A _ 48: 8D. 35, 00000800(rel)
	inc	r11					; 0051 _ 49: FF. C3
	cmp	byte [rsi+rbx], 0			; 0054 _ 80. 3C 1E, 00
	jnz	?_009					; 0058 _ 75, 08
?_008:	cmp	r11d, r10d				; 005A _ 45: 39. D3
	movsxd	rax, r11d				; 005D _ 49: 63. C3
	jl	?_007					; 0060 _ 7C, E4
?_009:	cmp	byte [rcx+1CH], 0			; 0062 _ 80. 79, 1C, 00
	jz	?_011					; 0066 _ 74, 2E
	cmp	eax, 1					; 0068 _ 83. F8, 01
	jle	?_012					; 006B _ 7E, 2E
?_010:	mov	al, byte [rcx+1CH]			; 006D _ 8A. 41, 1C
	test	al, al					; 0070 _ 84. C0
	jz	?_014					; 0072 _ 74, 59
	movsxd	rbx, dword [r8] 			; 0074 _ 49: 63. 18
	dec	al					; 0077 _ FE. C8
	mov	ecx, dword [r8+4H]			; 0079 _ 41: 8B. 48, 04
	lea	rbp, [rel _ZL8triangle] 		; 007D _ 48: 8D. 2D, 000007C0(rel)
	lea	rdi, [rel _ZL6KK_idx]			; 0084 _ 48: 8D. 3D, 00000140(rel)
	je	?_022					; 008B _ 0F 84, 00000122
	jmp	?_024					; 0091 _ E9, 0000019E

?_011:	cmp	eax, 2					; 0096 _ 83. F8, 02
	jg	?_014					; 0099 _ 7F, 32
?_012:	movsxd	r11, dword [r8+rax*4]			; 009B _ 4D: 63. 1C 80
	lea	rbx, [rel _ZL7offdiag]			; 009F _ 48: 8D. 1D, 00000800(rel)
	xor	eax, eax				; 00A6 _ 31. C0
	cmp	byte [rbx+r11], 0			; 00A8 _ 42: 80. 3C 1B, 00
	jle	?_010					; 00AD _ 7E, BE
?_013:	cmp	r10d, eax				; 00AF _ 41: 39. C2
	jle	?_010					; 00B2 _ 7E, B9
	movsxd	r11, dword [r8+rax*4]			; 00B4 _ 4D: 63. 1C 80
	lea	rbx, [rel _ZL8flipdiag] 		; 00B8 _ 48: 8D. 1D, 00000780(rel)
	movzx	r11d, byte [rbx+r11]			; 00BF _ 46: 0F B6. 1C 1B
	mov	dword [r8+rax*4], r11d			; 00C4 _ 45: 89. 1C 80
	inc	rax					; 00C8 _ 48: FF. C0
	jmp	?_013					; 00CB _ EB, E2

?_014:	movsxd	r11, dword [r8] 			; 00CD _ 4D: 63. 18
	lea	rbp, [rel _ZL7offdiag]			; 00D0 _ 48: 8D. 2D, 00000800(rel)
	xor	edi, edi				; 00D7 _ 31. FF
	movsxd	rcx, dword [r8+4H]			; 00D9 _ 49: 63. 48, 04
	movsxd	rax, dword [r8+8H]			; 00DD _ 49: 63. 40, 08
	cmp	ecx, r11d				; 00E1 _ 44: 39. D9
	setg	dil					; 00E4 _ 40: 0F 9F. C7
	xor	esi, esi				; 00E8 _ 31. F6
	cmp	eax, r11d				; 00EA _ 44: 39. D8
	setg	sil					; 00ED _ 40: 0F 9F. C6
	xor	ebx, ebx				; 00F1 _ 31. DB
	cmp	eax, ecx				; 00F3 _ 39. C8
	setg	bl					; 00F5 _ 0F 9F. C3
	add	ebx, esi				; 00F8 _ 01. F3
	cmp	byte [rbp+r11], 0			; 00FA _ 42: 80. 7C 1D, 00, 00
	jz	?_015					; 0100 _ 74, 20
	lea	rsi, [rel _ZL8triangle] 		; 0102 _ 48: 8D. 35, 000007C0(rel)
	sub	ecx, edi				; 0109 _ 29. F9
	movzx	r11d, byte [rsi+r11]			; 010B _ 46: 0F B6. 1C 1E
	imul	ecx, ecx, 62				; 0110 _ 6B. C9, 3E
	imul	r11d, r11d, 3906			; 0113 _ 45: 69. DB, 00000F42
	add	ecx, r11d				; 011A _ 44: 01. D9
	jmp	?_020					; 011D _ E9, 0000008B

?_015:	cmp	byte [rbp+rcx], 0			; 0122 _ 80. 7C 0D, 00, 00
	lea	rsi, [rel _ZL4diag]			; 0127 _ 48: 8D. 35, 00000700(rel)
	jz	?_018					; 012E _ 74, 32
	movzx	r11d, byte [rsi+r11]			; 0130 _ 46: 0F B6. 1C 1E
	lea	rsi, [rel _ZL5lower]			; 0135 _ 48: 8D. 35, 00000740(rel)
	movzx	ecx, byte [rsi+rcx]			; 013C _ 0F B6. 0C 0E
	imul	r11d, r11d, 1736			; 0140 _ 45: 69. DB, 000006C8
	imul	ecx, ecx, 62				; 0147 _ 6B. C9, 3E
	lea	ecx, [r11+rcx+5B8CH]			; 014A _ 41: 8D. 8C 0B, 00005B8C
	add	eax, ecx				; 0152 _ 01. C8
	sub	eax, ebx				; 0154 _ 29. D8
?_016:	cdqe						; 0156 _ 48: 98
?_017:	mov	ecx, 3					; 0158 _ B9, 00000003
	jmp	?_025					; 015D _ E9, 000000EB

?_018:	cmp	byte [rbp+rax], 0			; 0162 _ 80. 7C 05, 00, 00
	movzx	r11d, byte [rsi+r11]			; 0167 _ 46: 0F B6. 1C 1E
	jz	?_019					; 016C _ 74, 26
	movzx	ecx, byte [rsi+rcx]			; 016E _ 0F B6. 0C 0E
	imul	r11d, r11d, 196 			; 0172 _ 45: 69. DB, 000000C4
	sub	ecx, edi				; 0179 _ 29. F9
	imul	ecx, ecx, 28				; 017B _ 6B. C9, 1C
	lea	ecx, [r11+rcx+76ACH]			; 017E _ 41: 8D. 8C 0B, 000076AC
	lea	r11, [rel _ZL5lower]			; 0186 _ 4C: 8D. 1D, 00000740(rel)
	movzx	eax, byte [r11+rax]			; 018D _ 41: 0F B6. 04 03
	jmp	?_021					; 0192 _ EB, 1B

?_019:	movzx	ecx, byte [rsi+rcx]			; 0194 _ 0F B6. 0C 0E
	imul	r11d, r11d, 42				; 0198 _ 45: 6B. DB, 2A
	movzx	eax, byte [rsi+rax]			; 019C _ 0F B6. 04 06
	sub	ecx, edi				; 01A0 _ 29. F9
	imul	ecx, ecx, 6				; 01A2 _ 6B. C9, 06
	lea	ecx, [r11+rcx+79BCH]			; 01A5 _ 41: 8D. 8C 0B, 000079BC
?_020:	sub	eax, ebx				; 01AD _ 29. D8
?_021:	add	eax, ecx				; 01AF _ 01. C8
	jmp	?_016					; 01B1 _ EB, A3

?_022:	mov	eax, dword [r8+8H]			; 01B3 _ 41: 8B. 40, 08
	xor	esi, esi				; 01B7 _ 31. F6
	cmp	eax, ebx				; 01B9 _ 39. D8
	setg	sil					; 01BB _ 40: 0F 9F. C6
	xor	r11d, r11d				; 01BF _ 45: 31. DB
	cmp	eax, ecx				; 01C2 _ 39. C8
	setg	r11b					; 01C4 _ 41: 0F 9F. C3
	add	esi, r11d				; 01C8 _ 44: 01. DE
	movsxd	r11, ecx				; 01CB _ 4C: 63. D9
	movzx	ecx, byte [rbp+rbx]			; 01CE _ 0F B6. 4C 1D, 00
	shl	rcx, 6					; 01D3 _ 48: C1. E1, 06
	add	rcx, r11				; 01D7 _ 4C: 01. D9
	movsx	rcx, word [rdi+rcx*2]			; 01DA _ 48: 0F BF. 0C 4F
	cmp	rcx, 440				; 01DF _ 48: 81. F9, 000001B8
	ja	?_023					; 01E6 _ 77, 12
	sub	eax, esi				; 01E8 _ 29. F0
	imul	eax, eax, 441				; 01EA _ 69. C0, 000001B9
	cdqe						; 01F0 _ 48: 98
	add	rax, rcx				; 01F2 _ 48: 01. C8
	jmp	?_017					; 01F5 _ E9, FFFFFF5E

?_023:	lea	rbx, [rel _ZL7offdiag]			; 01FA _ 48: 8D. 1D, 00000800(rel)
	movsxd	r11, eax				; 0201 _ 4C: 63. D8
	lea	rax, [rel _ZL5lower]			; 0204 _ 48: 8D. 05, 00000740(rel)
	movzx	eax, byte [rax+r11]			; 020B _ 42: 0F B6. 04 18
	imul	rax, rax, 21				; 0210 _ 48: 6B. C0, 15
	cmp	byte [rbx+r11], 0			; 0214 _ 42: 80. 3C 1B, 00
	lea	rax, [rcx+rax+6915H]			; 0219 _ 48: 8D. 84 01, 00006915
	mov	ecx, 3					; 0221 _ B9, 00000003
	jnz	?_025					; 0226 _ 75, 25
	imul	r11d, esi, 21				; 0228 _ 44: 6B. DE, 15
	movsxd	r11, r11d				; 022C _ 4D: 63. DB
	sub	rax, r11				; 022F _ 4C: 29. D8
	jmp	?_025					; 0232 _ EB, 19

?_024:	movsxd	rax, ecx				; 0234 _ 48: 63. C1
	movzx	ecx, byte [rbp+rbx]			; 0237 _ 0F B6. 4C 1D, 00
	shl	rcx, 6					; 023C _ 48: C1. E1, 06
	add	rcx, rax				; 0240 _ 48: 01. C1
	movsx	rax, word [rdi+rcx*2]			; 0243 _ 48: 0F BF. 04 4F
	mov	ecx, 2					; 0248 _ B9, 00000002
?_025:	movsxd	r11, dword [r9] 			; 024D _ 4D: 63. 19
	imul	rax, r11				; 0250 _ 49: 0F AF. C3
?_026:	cmp	ecx, r10d				; 0254 _ 44: 39. D1
	jge	?_035					; 0257 _ 0F 8D, 000000B6
	movsxd	r11, ecx				; 025D _ 4C: 63. D9
	movzx	esi, byte [rdx+r11]			; 0260 _ 42: 0F B6. 34 1A
	lea	rdi, [r11*4+4H] 			; 0265 _ 4A: 8D. 3C 9D, 00000004
	mov	r11d, ecx				; 026D _ 41: 89. CB
	lea	rbp, [r8+rdi]				; 0270 _ 49: 8D. 2C 38
	add	esi, ecx				; 0274 _ 01. CE
?_027:	cmp	r11d, esi				; 0276 _ 41: 39. F3
	jge	?_031					; 0279 _ 7D, 30
	xor	ebx, ebx				; 027B _ 31. DB
	inc	r11d					; 027D _ 41: FF. C3
?_028:	lea	r12d, [r11+rbx] 			; 0280 _ 45: 8D. 24 1B
	cmp	r12d, esi				; 0284 _ 41: 39. F4
	jge	?_030					; 0287 _ 7D, 1C
	mov	r12d, dword [rbp-4H]			; 0289 _ 44: 8B. 65, FC
	mov	r13d, dword [rbp+rbx*4] 		; 028D _ 44: 8B. 6C 9D, 00
	cmp	r12d, r13d				; 0292 _ 45: 39. EC
	jle	?_029					; 0295 _ 7E, 09
	mov	dword [rbp-4H], r13d			; 0297 _ 44: 89. 6D, FC
	mov	dword [rbp+rbx*4], r12d 		; 029B _ 44: 89. 64 9D, 00
?_029:	inc	rbx					; 02A0 _ 48: FF. C3
	jmp	?_028					; 02A3 _ EB, DB

?_030:	add	rbp, 4					; 02A5 _ 48: 83. C5, 04
	jmp	?_027					; 02A9 _ EB, CB

?_031:	lea	r13, [r8+rdi-4H]			; 02AB _ 4D: 8D. 6C 38, FC
	xor	r12d, r12d				; 02B0 _ 45: 31. E4
	xor	ebp, ebp				; 02B3 _ 31. ED
?_032:	lea	r11d, [rcx+r12] 			; 02B5 _ 46: 8D. 1C 21
	cmp	r11d, esi				; 02B9 _ 41: 39. F3
	jge	?_034					; 02BC _ 7D, 3F
	mov	r11d, dword [r13+r12*4] 		; 02BE _ 47: 8B. 5C A5, 00
	xor	ebx, ebx				; 02C3 _ 31. DB
	xor	r14d, r14d				; 02C5 _ 45: 31. F6
?_033:	xor	r15d, r15d				; 02C8 _ 45: 31. FF
	cmp	r11d, dword [r8+rbx*4]			; 02CB _ 45: 3B. 1C 98
	setg	r15b					; 02CF _ 41: 0F 9F. C7
	inc	rbx					; 02D3 _ 48: FF. C3
	add	r14d, r15d				; 02D6 _ 45: 01. FE
	cmp	ecx, ebx				; 02D9 _ 39. D9
	jg	?_033					; 02DB _ 7F, EB
	sub	r11d, r14d				; 02DD _ 45: 29. F3
	movsxd	rbx, r11d				; 02E0 _ 49: 63. DB
	movsxd	r11, r12d				; 02E3 _ 4D: 63. DC
	inc	r12					; 02E6 _ 49: FF. C4
	shl	r11, 6					; 02E9 _ 49: C1. E3, 06
	add	r11, rbx				; 02ED _ 49: 01. DB
	lea	rbx, [rel _ZL8binomial] 		; 02F0 _ 48: 8D. 1D, 000002C0(rel)
	add	ebp, dword [rbx+r11*4]			; 02F7 _ 42: 03. 2C 9B
	jmp	?_032					; 02FB _ EB, B8

?_034:	movsxd	r11, dword [r9+rdi-4H]			; 02FD _ 4D: 63. 5C 39, FC
	movsxd	rcx, ebp				; 0302 _ 48: 63. CD
	imul	rcx, r11				; 0305 _ 49: 0F AF. CB
	add	rax, rcx				; 0309 _ 48: 01. C8
	mov	ecx, esi				; 030C _ 89. F1
	jmp	?_026					; 030E _ E9, FFFFFF41

?_035:	; Local function
	pop	rbx					; 0313 _ 5B
	pop	rsi					; 0314 _ 5E
	pop	rdi					; 0315 _ 5F
	pop	rbp					; 0316 _ 5D
	pop	r12					; 0317 _ 41: 5C
	pop	r13					; 0319 _ 41: 5D
	pop	r14					; 031B _ 41: 5E
	pop	r15					; 031D _ 41: 5F
	ret						; 031F _ C3

_ZL11encode_pawnP12TBEntry_pawnPhPiS2_:; Local function
	push	r15					; 0320 _ 41: 57
	push	r14					; 0322 _ 41: 56
	push	r13					; 0324 _ 41: 55
	push	r12					; 0326 _ 41: 54
	push	rbp					; 0328 _ 55
	push	rdi					; 0329 _ 57
	push	rsi					; 032A _ 56
	push	rbx					; 032B _ 53
	test	byte [r8], 04H				; 032C _ 41: F6. 00, 04
	movzx	r12d, byte [rcx+19H]			; 0330 _ 44: 0F B6. 61, 19
	jz	?_037					; 0335 _ 74, 11
	xor	eax, eax				; 0337 _ 31. C0
?_036:	cmp	r12d, eax				; 0339 _ 41: 39. C4
	jle	?_037					; 033C _ 7E, 0A
	xor	dword [r8+rax*4], 07H			; 033E _ 41: 83. 34 80, 07
	inc	rax					; 0343 _ 48: FF. C0
	jmp	?_036					; 0346 _ EB, F1

?_037:	; Local function
	lea	r11, [r8+8H]				; 0348 _ 4D: 8D. 58, 08
	mov	eax, 1					; 034C _ B8, 00000001
?_038:	movzx	r10d, byte [rcx+1CH]			; 0351 _ 44: 0F B6. 51, 1C
	cmp	eax, r10d				; 0356 _ 44: 39. D0
	mov	rbp, r10				; 0359 _ 4C: 89. D5
	jge	?_042					; 035C _ 7D, 3D
	xor	r10d, r10d				; 035E _ 45: 31. D2
	inc	eax					; 0361 _ FF. C0
?_039:	movzx	ebx, byte [rcx+1CH]			; 0363 _ 0F B6. 59, 1C
	lea	esi, [rax+r10]				; 0367 _ 42: 8D. 34 10
	cmp	esi, ebx				; 036B _ 39. DE
	jge	?_041					; 036D _ 7D, 26
	movsxd	r13, dword [r11-4H]			; 036F _ 4D: 63. 6B, FC
	lea	rdi, [rel _ZL6ptwist]			; 0373 _ 48: 8D. 3D, 00000680(rel)
	movsxd	rbp, dword [r11+r10*4]			; 037A _ 4B: 63. 2C 93
	mov	r15b, byte [rdi+rbp]			; 037E _ 44: 8A. 3C 2F
	cmp	byte [rdi+r13], r15b			; 0382 _ 46: 38. 3C 2F
	jnc	?_040					; 0386 _ 73, 08
	mov	dword [r11-4H], ebp			; 0388 _ 41: 89. 6B, FC
	mov	dword [r11+r10*4], r13d 		; 038C _ 47: 89. 2C 93
?_040:	inc	r10					; 0390 _ 49: FF. C2
	jmp	?_039					; 0393 _ EB, CE

?_041:	add	r11, 4					; 0395 _ 49: 83. C3, 04
	jmp	?_038					; 0399 _ EB, B6

?_042:	; Local function
	movsxd	rax, dword [r8] 			; 039B _ 49: 63. 00
	lea	rbx, [rel _ZL4flap]			; 039E _ 48: 8D. 1D, 000006C0(rel)
	lea	r11d, [r10-1H]				; 03A5 _ 45: 8D. 5A, FF
	movzx	eax, byte [rbx+rax]			; 03A9 _ 0F B6. 04 03
	movsxd	rbx, r11d				; 03AD _ 49: 63. DB
	imul	rsi, rbx, 24				; 03B0 _ 48: 6B. F3, 18
	lea	r13, [r8+rbx*4] 			; 03B4 _ 4D: 8D. 2C 98
	xor	ebx, ebx				; 03B8 _ 31. DB
	add	rax, rsi				; 03BA _ 48: 01. F0
	lea	rsi, [rel _ZL7pawnidx]			; 03BD _ 48: 8D. 35, 000000C0(rel)
	movsxd	rax, dword [rsi+rax*4]			; 03C4 _ 48: 63. 04 86
?_043:	test	r11d, r11d				; 03C8 _ 45: 85. DB
	jle	?_044					; 03CB _ 7E, 34
	imul	rsi, rbx, -4				; 03CD _ 48: 6B. F3, FC
	dec	r11d					; 03D1 _ 41: FF. CB
	lea	rdi, [rel _ZL6ptwist]			; 03D4 _ 48: 8D. 3D, 00000680(rel)
	movsxd	rsi, dword [r13+rsi]			; 03DB _ 49: 63. 74 35, 00
	movzx	edi, byte [rdi+rsi]			; 03E0 _ 0F B6. 3C 37
	movsxd	rsi, ebx				; 03E4 _ 48: 63. F3
	inc	rbx					; 03E7 _ 48: FF. C3
	shl	rsi, 6					; 03EA _ 48: C1. E6, 06
	add	rsi, rdi				; 03EE _ 48: 01. FE
	lea	rdi, [rel _ZL8binomial] 		; 03F1 _ 48: 8D. 3D, 000002C0(rel)
	movsxd	rsi, dword [rdi+rsi*4]			; 03F8 _ 48: 63. 34 B7
	add	rax, rsi				; 03FC _ 48: 01. F0
	jmp	?_043					; 03FF _ EB, C7

?_044:	; Local function
	movzx	ebx, byte [rcx+1DH]			; 0401 _ 0F B6. 59, 1D
	movsxd	r11, dword [r9] 			; 0405 _ 4D: 63. 19
	add	ebx, r10d				; 0408 _ 44: 01. D3
	imul	rax, r11				; 040B _ 49: 0F AF. C3
	cmp	ebx, r10d				; 040F _ 44: 39. D3
	jle	?_055					; 0412 _ 0F 8E, 000000AB
	movsxd	rcx, r10d				; 0418 _ 49: 63. CA
	lea	rdi, [rcx*4+4H] 			; 041B _ 48: 8D. 3C 8D, 00000004
	mov	ecx, r10d				; 0423 _ 44: 89. D1
	lea	r11, [r8+rdi]				; 0426 _ 4D: 8D. 1C 38
?_045:	cmp	ecx, ebx				; 042A _ 39. D9
	jz	?_049					; 042C _ 74, 2D
	xor	esi, esi				; 042E _ 31. F6
	inc	ecx					; 0430 _ FF. C1
?_046:	lea	r13d, [rcx+rsi] 			; 0432 _ 44: 8D. 2C 31
	cmp	r13d, ebx				; 0436 _ 41: 39. DD
	jge	?_048					; 0439 _ 7D, 1A
	mov	r13d, dword [r11-4H]			; 043B _ 45: 8B. 6B, FC
	mov	r14d, dword [r11+rsi*4] 		; 043F _ 45: 8B. 34 B3
	cmp	r13d, r14d				; 0443 _ 45: 39. F5
	jle	?_047					; 0446 _ 7E, 08
	mov	dword [r11-4H], r14d			; 0448 _ 45: 89. 73, FC
	mov	dword [r11+rsi*4], r13d 		; 044C _ 45: 89. 2C B3
?_047:	inc	rsi					; 0450 _ 48: FF. C6
	jmp	?_046					; 0453 _ EB, DD

?_048:	add	r11, 4					; 0455 _ 49: 83. C3, 04
	jmp	?_045					; 0459 _ EB, CF

?_049:	lea	r13, [r8+rdi-4H]			; 045B _ 4D: 8D. 6C 38, FC
	xor	esi, esi				; 0460 _ 31. F6
	xor	edi, edi				; 0462 _ 31. FF
?_050:	lea	ecx, [r10+rdi]				; 0464 _ 41: 8D. 0C 3A
	cmp	ecx, ebx				; 0468 _ 39. D9
	jge	?_053					; 046A _ 7D, 46
	mov	ecx, dword [r13+rdi*4]			; 046C _ 41: 8B. 4C BD, 00
	xor	r11d, r11d				; 0471 _ 45: 31. DB
	xor	r14d, r14d				; 0474 _ 45: 31. F6
?_051:	cmp	r10d, r11d				; 0477 _ 45: 39. DA
	jle	?_052					; 047A _ 7E, 13
	xor	r15d, r15d				; 047C _ 45: 31. FF
	cmp	ecx, dword [r8+r11*4]			; 047F _ 43: 3B. 0C 98
	setg	r15b					; 0483 _ 41: 0F 9F. C7
	inc	r11					; 0487 _ 49: FF. C3
	add	r14d, r15d				; 048A _ 45: 01. FE
	jmp	?_051					; 048D _ EB, E8

?_052:	sub	ecx, r14d				; 048F _ 44: 29. F1
	sub	ecx, 8					; 0492 _ 83. E9, 08
	movsxd	r11, ecx				; 0495 _ 4C: 63. D9
	movsxd	rcx, edi				; 0498 _ 48: 63. CF
	inc	rdi					; 049B _ 48: FF. C7
	shl	rcx, 6					; 049E _ 48: C1. E1, 06
	add	rcx, r11				; 04A2 _ 4C: 01. D9
	lea	r11, [rel _ZL8binomial] 		; 04A5 _ 4C: 8D. 1D, 000002C0(rel)
	add	esi, dword [r11+rcx*4]			; 04AC _ 41: 03. 34 8B
	jmp	?_050					; 04B0 _ EB, B2

?_053:	movsxd	rcx, dword [r9+rbp*4]			; 04B2 _ 49: 63. 0C A9
	movsxd	rsi, esi				; 04B6 _ 48: 63. F6
	imul	rsi, rcx				; 04B9 _ 48: 0F AF. F1
	add	rax, rsi				; 04BD _ 48: 01. F0
?_054:	mov	r10d, ebx				; 04C0 _ 41: 89. DA
?_055:	cmp	r10d, r12d				; 04C3 _ 45: 39. E2
	jge	?_065					; 04C6 _ 0F 8D, 000000B0
	movsxd	rcx, r10d				; 04CC _ 49: 63. CA
	movzx	ebx, byte [rdx+rcx]			; 04CF _ 0F B6. 1C 0A
	lea	rsi, [rcx*4+4H] 			; 04D3 _ 48: 8D. 34 8D, 00000004
	mov	ecx, r10d				; 04DB _ 44: 89. D1
	lea	r11, [r8+rsi]				; 04DE _ 4D: 8D. 1C 30
	add	ebx, r10d				; 04E2 _ 44: 01. D3
?_056:	cmp	ecx, ebx				; 04E5 _ 39. D9
	jge	?_060					; 04E7 _ 7D, 2B
	xor	edi, edi				; 04E9 _ 31. FF
	inc	ecx					; 04EB _ FF. C1
?_057:	lea	ebp, [rcx+rdi]				; 04ED _ 8D. 2C 39
	cmp	ebp, ebx				; 04F0 _ 39. DD
	jge	?_059					; 04F2 _ 7D, 1A
	mov	ebp, dword [r11-4H]			; 04F4 _ 41: 8B. 6B, FC
	mov	r13d, dword [r11+rdi*4] 		; 04F8 _ 45: 8B. 2C BB
	cmp	ebp, r13d				; 04FC _ 44: 39. ED
	jle	?_058					; 04FF _ 7E, 08
	mov	dword [r11-4H], r13d			; 0501 _ 45: 89. 6B, FC
	mov	dword [r11+rdi*4], ebp			; 0505 _ 41: 89. 2C BB
?_058:	inc	rdi					; 0509 _ 48: FF. C7
	jmp	?_057					; 050C _ EB, DF

?_059:	add	r11, 4					; 050E _ 49: 83. C3, 04
	jmp	?_056					; 0512 _ EB, D1

?_060:	lea	r13, [r8+rsi-4H]			; 0514 _ 4D: 8D. 6C 30, FC
	xor	ebp, ebp				; 0519 _ 31. ED
	xor	edi, edi				; 051B _ 31. FF
?_061:	lea	ecx, [r10+rbp]				; 051D _ 41: 8D. 0C 2A
	cmp	ecx, ebx				; 0521 _ 39. D9
	jge	?_064					; 0523 _ 7D, 43
	mov	ecx, dword [r13+rbp*4]			; 0525 _ 41: 8B. 4C AD, 00
	xor	r11d, r11d				; 052A _ 45: 31. DB
	xor	r14d, r14d				; 052D _ 45: 31. F6
?_062:	cmp	r10d, r11d				; 0530 _ 45: 39. DA
	jle	?_063					; 0533 _ 7E, 13
	xor	r15d, r15d				; 0535 _ 45: 31. FF
	cmp	ecx, dword [r8+r11*4]			; 0538 _ 43: 3B. 0C 98
	setg	r15b					; 053C _ 41: 0F 9F. C7
	inc	r11					; 0540 _ 49: FF. C3
	add	r14d, r15d				; 0543 _ 45: 01. FE
	jmp	?_062					; 0546 _ EB, E8

?_063:	sub	ecx, r14d				; 0548 _ 44: 29. F1
	movsxd	r11, ecx				; 054B _ 4C: 63. D9
	movsxd	rcx, ebp				; 054E _ 48: 63. CD
	inc	rbp					; 0551 _ 48: FF. C5
	shl	rcx, 6					; 0554 _ 48: C1. E1, 06
	add	rcx, r11				; 0558 _ 4C: 01. D9
	lea	r11, [rel _ZL8binomial] 		; 055B _ 4C: 8D. 1D, 000002C0(rel)
	add	edi, dword [r11+rcx*4]			; 0562 _ 41: 03. 3C 8B
	jmp	?_061					; 0566 _ EB, B5

?_064:	movsxd	rcx, dword [r9+rsi-4H]			; 0568 _ 49: 63. 4C 31, FC
	movsxd	rdi, edi				; 056D _ 48: 63. FF
	imul	rdi, rcx				; 0570 _ 48: 0F AF. F9
	add	rax, rdi				; 0574 _ 48: 01. F8
	jmp	?_054					; 0577 _ E9, FFFFFF44

?_065:	; Local function
	pop	rbx					; 057C _ 5B
	pop	rsi					; 057D _ 5E
	pop	rdi					; 057E _ 5F
	pop	rbp					; 057F _ 5D
	pop	r12					; 0580 _ 41: 5C
	pop	r13					; 0582 _ 41: 5D
	pop	r14					; 0584 _ 41: 5E
	pop	r15					; 0586 _ 41: 5F
	ret						; 0588 _ C3

_ZL14set_norm_pieceP13TBEntry_piecePhS1_:; Local function
	push	rdi					; 0589 _ 57
	push	rsi					; 058A _ 56
	push	rbx					; 058B _ 53
	xor	eax, eax				; 058C _ 31. C0
?_066:	movzx	r9d, byte [rcx+19H]			; 058E _ 44: 0F B6. 49, 19
	cmp	r9d, eax				; 0593 _ 41: 39. C1
	jle	?_067					; 0596 _ 7E, 09
	mov	byte [rdx+rax], 0			; 0598 _ C6. 04 02, 00
	inc	rax					; 059C _ 48: FF. C0
	jmp	?_066					; 059F _ EB, ED

?_067:	; Local function
	mov	al, byte [rcx+1CH]			; 05A1 _ 8A. 41, 1C
	test	al, al					; 05A4 _ 84. C0
	jz	?_068					; 05A6 _ 74, 09
	cmp	al, 2					; 05A8 _ 3C, 02
	jnz	?_069					; 05AA _ 75, 0A
	mov	byte [rdx], 2				; 05AC _ C6. 02, 02
	jmp	?_070					; 05AF _ EB, 09

?_068:	mov	byte [rdx], 3				; 05B1 _ C6. 02, 03
	jmp	?_070					; 05B4 _ EB, 04

?_069:	dec	eax					; 05B6 _ FF. C8
	mov	byte [rdx], al				; 05B8 _ 88. 02
?_070:	movzx	eax, byte [rdx] 			; 05BA _ 0F B6. 02
?_071:	movzx	r9d, byte [rcx+19H]			; 05BD _ 44: 0F B6. 49, 19
	cmp	eax, r9d				; 05C2 _ 44: 39. C8
	jge	?_074					; 05C5 _ 7D, 34
	movsxd	r10, eax				; 05C7 _ 4C: 63. D0
	xor	r9d, r9d				; 05CA _ 45: 31. C9
	lea	r11, [r8+r10]				; 05CD _ 4F: 8D. 1C 10
	lea	rbx, [rdx+r10]				; 05D1 _ 4A: 8D. 1C 12
?_072:	movzx	esi, byte [rcx+19H]			; 05D5 _ 0F B6. 71, 19
	lea	edi, [rax+r9]				; 05D9 _ 42: 8D. 3C 08
	cmp	edi, esi				; 05DD _ 39. F7
	jge	?_073					; 05DF _ 7D, 10
	mov	sil, byte [r11+r9]			; 05E1 _ 43: 8A. 34 0B
	inc	r9					; 05E5 _ 49: FF. C1
	cmp	sil, byte [r11] 			; 05E8 _ 41: 3A. 33
	jnz	?_073					; 05EB _ 75, 04
	inc	byte [rbx]				; 05ED _ FE. 03
	jmp	?_072					; 05EF _ EB, E4

?_073:	movzx	r9d, byte [rdx+r10]			; 05F1 _ 46: 0F B6. 0C 12
	add	eax, r9d				; 05F6 _ 44: 01. C8
	jmp	?_071					; 05F9 _ EB, C2

?_074:	; Local function
	pop	rbx					; 05FB _ 5B
	pop	rsi					; 05FC _ 5E
	pop	rdi					; 05FD _ 5F
	ret						; 05FE _ C3

_ZL13set_norm_pawnP12TBEntry_pawnPhS1_:; Local function
	push	rdi					; 05FF _ 57
	push	rsi					; 0600 _ 56
	push	rbx					; 0601 _ 53
	xor	eax, eax				; 0602 _ 31. C0
?_075:	movzx	r9d, byte [rcx+19H]			; 0604 _ 44: 0F B6. 49, 19
	cmp	r9d, eax				; 0609 _ 41: 39. C1
	jle	?_076					; 060C _ 7E, 09
	mov	byte [rdx+rax], 0			; 060E _ C6. 04 02, 00
	inc	rax					; 0612 _ 48: FF. C0
	jmp	?_075					; 0615 _ EB, ED

?_076:	; Local function
	mov	al, byte [rcx+1CH]			; 0617 _ 8A. 41, 1C
	mov	byte [rdx], al				; 061A _ 88. 02
	mov	al, byte [rcx+1DH]			; 061C _ 8A. 41, 1D
	test	al, al					; 061F _ 84. C0
	jz	?_077					; 0621 _ 74, 09
	movzx	r9d, byte [rcx+1CH]			; 0623 _ 44: 0F B6. 49, 1C
	mov	byte [rdx+r9], al			; 0628 _ 42: 88. 04 0A
?_077:	movzx	r9d, byte [rcx+1CH]			; 062C _ 44: 0F B6. 49, 1C
	movzx	eax, byte [rcx+1DH]			; 0631 _ 0F B6. 41, 1D
?_078:	add	eax, r9d				; 0635 _ 44: 01. C8
	movzx	r9d, byte [rcx+19H]			; 0638 _ 44: 0F B6. 49, 19
	cmp	eax, r9d				; 063D _ 44: 39. C8
	jge	?_081					; 0640 _ 7D, 31
	movsxd	r10, eax				; 0642 _ 4C: 63. D0
	xor	r9d, r9d				; 0645 _ 45: 31. C9
	lea	r11, [r8+r10]				; 0648 _ 4F: 8D. 1C 10
	lea	rbx, [rdx+r10]				; 064C _ 4A: 8D. 1C 12
?_079:	movzx	esi, byte [rcx+19H]			; 0650 _ 0F B6. 71, 19
	lea	edi, [rax+r9]				; 0654 _ 42: 8D. 3C 08
	cmp	edi, esi				; 0658 _ 39. F7
	jge	?_080					; 065A _ 7D, 10
	mov	sil, byte [r11+r9]			; 065C _ 43: 8A. 34 0B
	inc	r9					; 0660 _ 49: FF. C1
	cmp	sil, byte [r11] 			; 0663 _ 41: 3A. 33
	jnz	?_080					; 0666 _ 75, 04
	inc	byte [rbx]				; 0668 _ FE. 03
	jmp	?_079					; 066A _ EB, E4

?_080:	movzx	r9d, byte [rdx+r10]			; 066C _ 46: 0F B6. 0C 12
	jmp	?_078					; 0671 _ EB, C2

?_081:	; Local function
	pop	rbx					; 0673 _ 5B
	pop	rsi					; 0674 _ 5E
	pop	rdi					; 0675 _ 5F
	ret						; 0676 _ C3

_ZL11calc_symlenP9PairsDataiPc:; Local function
	push	r13					; 0677 _ 41: 55
	push	r12					; 0679 _ 41: 54
	push	rbp					; 067B _ 55
	push	rdi					; 067C _ 57
	push	rsi					; 067D _ 56
	push	rbx					; 067E _ 53
	sub	rsp, 40 				; 067F _ 48: 83. EC, 28
	lea	eax, [rdx+rdx*2]			; 0683 _ 8D. 04 52
	mov	rbp, rcx				; 0686 _ 48: 89. CD
	mov	rdi, r8 				; 0689 _ 4C: 89. C7
	cdqe						; 068C _ 48: 98
	add	rax, qword [rcx+28H]			; 068E _ 48: 03. 41, 28
	movsxd	rsi, edx				; 0692 _ 48: 63. F2
	movzx	ebx, byte [rax+1H]			; 0695 _ 0F B6. 58, 01
	movzx	ecx, byte [rax+2H]			; 0699 _ 0F B6. 48, 02
	mov	r9d, ebx				; 069D _ 41: 89. D9
	sar	ebx, 4					; 06A0 _ C1. FB, 04
	shl	ecx, 4					; 06A3 _ C1. E1, 04
	or	ebx, ecx				; 06A6 _ 09. CB
	cmp	ebx, 4095				; 06A8 _ 81. FB, 00000FFF
	jnz	?_082					; 06AE _ 75, 0A
	mov	rax, qword [rbp+20H]			; 06B0 _ 48: 8B. 45, 20
	mov	byte [rax+rsi], 0			; 06B4 _ C6. 04 30, 00
	jmp	?_085					; 06B8 _ EB, 4A

?_082:	movzx	edx, byte [rax] 			; 06BA _ 0F B6. 10
	and	r9d, 0FH				; 06BD _ 41: 83. E1, 0F
	shl	r9d, 8					; 06C1 _ 41: C1. E1, 08
	or	edx, r9d				; 06C5 _ 44: 09. CA
	movsxd	r12, edx				; 06C8 _ 4C: 63. E2
	cmp	byte [r8+r12], 0			; 06CB _ 43: 80. 3C 20, 00
	jnz	?_083					; 06D0 _ 75, 08
	mov	rcx, rbp				; 06D2 _ 48: 89. E9
	call	_ZL11calc_symlenP9PairsDataiPc		; 06D5 _ E8, FFFFFF9D
?_083:	movsxd	r13, ebx				; 06DA _ 4C: 63. EB
	cmp	byte [rdi+r13], 0			; 06DD _ 42: 80. 3C 2F, 00
	jnz	?_084					; 06E2 _ 75, 0D
	mov	r8, rdi 				; 06E4 _ 49: 89. F8
	mov	edx, ebx				; 06E7 _ 89. DA
	mov	rcx, rbp				; 06E9 _ 48: 89. E9
	call	_ZL11calc_symlenP9PairsDataiPc		; 06EC _ E8, FFFFFF86
?_084:	mov	rax, qword [rbp+20H]			; 06F1 _ 48: 8B. 45, 20
	mov	dl, byte [rax+r13]			; 06F5 _ 42: 8A. 14 28
	mov	cl, byte [rax+r12]			; 06F9 _ 42: 8A. 0C 20
	lea	edx, [rdx+rcx+1H]			; 06FD _ 8D. 54 0A, 01
	mov	byte [rax+rsi], dl			; 0701 _ 88. 14 30
?_085:	mov	byte [rdi+rsi], 1			; 0704 _ C6. 04 37, 01
	add	rsp, 40 				; 0708 _ 48: 83. C4, 28
	pop	rbx					; 070C _ 5B
	pop	rsi					; 070D _ 5E
	pop	rdi					; 070E _ 5F
	pop	rbp					; 070F _ 5D
	pop	r12					; 0710 _ 41: 5C
	pop	r13					; 0712 _ 41: 5D
	ret						; 0714 _ C3

_ZL11setup_pairsPhyPyPS_S_i:; Local function
	push	r15					; 0715 _ 41: 57
	mov	eax, 4184				; 0717 _ B8, 00001058
	push	r14					; 071C _ 41: 56
	push	r13					; 071E _ 41: 55
	push	r12					; 0720 _ 41: 54
	push	rbp					; 0722 _ 55
	push	rdi					; 0723 _ 57
	push	rsi					; 0724 _ 56
	push	rbx					; 0725 _ 53
	call	___chkstk_ms				; 0726 _ E8, 00000000(rel)
	sub	rsp, rax				; 072B _ 48: 29. C4
	mov	rax, qword [rsp+10C0H]			; 072E _ 48: 8B. 84 24, 000010C0
	mov	rbx, rcx				; 0736 _ 48: 89. CB
	mov	cl, byte [rcx]				; 0739 _ 8A. 09
	mov	r15, r9 				; 073B _ 4D: 89. CF
	mov	byte [rax], cl				; 073E _ 88. 08
	cmp	byte [rbx], 0				; 0740 _ 80. 3B, 00
	jns	?_088					; 0743 _ 79, 58
	mov	ecx, 72 				; 0745 _ B9, 00000048
	mov	qword [rsp+20H], r8			; 074A _ 4C: 89. 44 24, 20
	call	malloc					; 074F _ E8, 00000000(rel)
	cmp	dword [rsp+10C8H], 0			; 0754 _ 83. BC 24, 000010C8, 00
	mov	dword [rax+34H], 0			; 075C _ C7. 40, 34, 00000000
	mov	r8, qword [rsp+20H]			; 0763 _ 4C: 8B. 44 24, 20
	jz	?_086					; 0768 _ 74, 09
	movzx	edx, byte [rbx+1H]			; 076A _ 0F B6. 53, 01
	mov	dword [rax+38H], edx			; 076E _ 89. 50, 38
	jmp	?_087					; 0771 _ EB, 07

?_086:	mov	dword [rax+38H], 0			; 0773 _ C7. 40, 38, 00000000
?_087:	add	rbx, 2					; 077A _ 48: 83. C3, 02
	mov	qword [r15], rbx			; 077E _ 49: 89. 1F
	mov	qword [r8+10H], 0			; 0781 _ 49: C7. 40, 10, 00000000
	mov	qword [r8+8H], 0			; 0789 _ 49: C7. 40, 08, 00000000
	mov	qword [r8], 0				; 0791 _ 49: C7. 00, 00000000
	jmp	?_098					; 0798 _ E9, 000001EA

?_088:	movzx	eax, byte [rbx+5H]			; 079D _ 0F B6. 43, 05
	mov	qword [rsp+48H], r8			; 07A1 _ 4C: 89. 44 24, 48
	movzx	r12d, byte [rbx+9H]			; 07A6 _ 44: 0F B6. 63, 09
	mov	qword [rsp+40H], rdx			; 07AB _ 48: 89. 54 24, 40
	movzx	ebp, byte [rbx+8H]			; 07B0 _ 0F B6. 6B, 08
	movzx	r11d, byte [rbx+1H]			; 07B4 _ 44: 0F B6. 5B, 01
	shl	eax, 8					; 07B9 _ C1. E0, 08
	movzx	r9d, byte [rbx+2H]			; 07BC _ 44: 0F B6. 4B, 02
	mov	ecx, eax				; 07C1 _ 89. C1
	movzx	eax, byte [rbx+6H]			; 07C3 _ 0F B6. 43, 06
	sub	ebp, r12d				; 07C7 _ 44: 29. E5
	lea	edi, [rbp+rbp+0CH]			; 07CA _ 8D. 7C 2D, 0C
	movsxd	r14, ebp				; 07CE _ 4C: 63. F5
	mov	dword [rsp+3CH], r11d			; 07D1 _ 44: 89. 5C 24, 3C
	lea	r10, [r14*8+48H]			; 07D6 _ 4E: 8D. 14 F5, 00000048
	mov	dword [rsp+38H], r9d			; 07DE _ 44: 89. 4C 24, 38
	shl	eax, 16 				; 07E3 _ C1. E0, 10
	mov	qword [rsp+30H], r10			; 07E6 _ 4C: 89. 54 24, 30
	or	eax, ecx				; 07EB _ 09. C8
	movzx	ecx, byte [rbx+4H]			; 07ED _ 0F B6. 4B, 04
	or	eax, ecx				; 07F1 _ 09. C8
	movzx	ecx, byte [rbx+7H]			; 07F3 _ 0F B6. 4B, 07
	shl	ecx, 24 				; 07F7 _ C1. E1, 18
	or	eax, ecx				; 07FA _ 09. C8
	mov	dword [rsp+20H], eax			; 07FC _ 89. 44 24, 20
	movzx	eax, byte [rbx+3H]			; 0800 _ 0F B6. 43, 03
	add	eax, dword [rsp+20H]			; 0804 _ 03. 44 24, 20
	mov	dword [rsp+2CH], eax			; 0808 _ 89. 44 24, 2C
	movsxd	rax, edi				; 080C _ 48: 63. C7
	add	rax, rbx				; 080F _ 48: 01. D8
	movzx	esi, byte [rax+1H]			; 0812 _ 0F B6. 70, 01
	movzx	eax, byte [rax] 			; 0816 _ 0F B6. 00
	shl	esi, 8					; 0819 _ C1. E6, 08
	or	esi, eax				; 081C _ 09. C6
	movzx	ecx, si 				; 081E _ 0F B7. CE
	movzx	r13d, si				; 0821 _ 44: 0F B7. EE
	and	esi, 01H				; 0825 _ 83. E6, 01
	add	rcx, r10				; 0828 _ 4C: 01. D1
	call	malloc					; 082B _ E8, 00000000(rel)
	mov	r10, qword [rsp+30H]			; 0830 _ 4C: 8B. 54 24, 30
	lea	rcx, [rbx+0AH]				; 0835 _ 48: 8D. 4B, 0A
	mov	qword [rax+18H], rcx			; 0839 _ 48: 89. 48, 18
	mov	r9d, dword [rsp+38H]			; 083D _ 44: 8B. 4C 24, 38
	mov	rdx, qword [rsp+40H]			; 0842 _ 48: 8B. 54 24, 40
	mov	dword [rax+38H], r12d			; 0847 _ 44: 89. 60, 38
	mov	r8, qword [rsp+48H]			; 084B _ 4C: 8B. 44 24, 48
	add	r10, rax				; 0850 _ 49: 01. C2
	mov	r11d, dword [rsp+3CH]			; 0853 _ 44: 8B. 5C 24, 3C
	mov	qword [rax+20H], r10			; 0858 _ 4C: 89. 50, 20
	lea	r10d, [rdi+2H]				; 085C _ 44: 8D. 57, 02
	movsxd	rdi, r10d				; 0860 _ 49: 63. FA
	mov	dword [rax+34H], r9d			; 0863 _ 44: 89. 48, 34
	lea	rcx, [rbx+rdi]				; 0867 _ 48: 8D. 0C 3B
	mov	qword [rax+28H], rcx			; 086B _ 48: 89. 48, 28
	lea	ecx, [r13+r13*2]			; 086F _ 43: 8D. 4C 6D, 00
	add	ecx, r10d				; 0874 _ 44: 01. D1
	mov	r10d, 1 				; 0877 _ 41: BA, 00000001
	mov	dword [rax+30H], r11d			; 087D _ 44: 89. 58, 30
	add	ecx, esi				; 0881 _ 01. F1
	movsxd	rcx, ecx				; 0883 _ 48: 63. C9
	add	rbx, rcx				; 0886 _ 48: 01. CB
	mov	cl, r9b 				; 0889 _ 44: 88. C9
	shl	r10, cl 				; 088C _ 49: D3. E2
	mov	qword [r15], rbx			; 088F _ 49: 89. 1F
	lea	rdx, [rdx+r10-1H]			; 0892 _ 4A: 8D. 54 12, FF
	shr	rdx, cl 				; 0897 _ 48: D3. EA
	mov	cl, r11b				; 089A _ 44: 88. D9
	imul	rdx, rdx, 6				; 089D _ 48: 6B. D2, 06
	mov	qword [r8], rdx 			; 08A1 _ 49: 89. 10
	movsxd	rdx, dword [rsp+2CH]			; 08A4 _ 48: 63. 54 24, 2C
	add	rdx, rdx				; 08A9 _ 48: 01. D2
	mov	qword [r8+8H], rdx			; 08AC _ 49: 89. 50, 08
	movsxd	rdx, dword [rsp+20H]			; 08B0 _ 48: 63. 54 24, 20
	shl	rdx, cl 				; 08B5 _ 48: D3. E2
	mov	qword [r8+10H], rdx			; 08B8 _ 49: 89. 50, 10
	xor	edx, edx				; 08BC _ 31. D2
?_089:	cmp	r13d, edx				; 08BE _ 41: 39. D5
	jle	?_090					; 08C1 _ 7E, 0A
	mov	byte [rsp+rdx+50H], 0			; 08C3 _ C6. 44 14, 50, 00
	inc	rdx					; 08C8 _ 48: FF. C2
	jmp	?_089					; 08CB _ EB, F1

?_090:	lea	rsi, [rsp+50H]				; 08CD _ 48: 8D. 74 24, 50
	xor	ebx, ebx				; 08D2 _ 31. DB
?_091:	cmp	ebx, r13d				; 08D4 _ 44: 39. EB
	jge	?_093					; 08D7 _ 7D, 22
	cmp	byte [rbx+rsi], 0			; 08D9 _ 80. 3C 33, 00
	jnz	?_092					; 08DD _ 75, 17
	mov	rcx, rax				; 08DF _ 48: 89. C1
	mov	r8, rsi 				; 08E2 _ 49: 89. F0
	mov	edx, ebx				; 08E5 _ 89. DA
	mov	qword [rsp+20H], rax			; 08E7 _ 48: 89. 44 24, 20
	call	_ZL11calc_symlenP9PairsDataiPc		; 08EC _ E8, FFFFFD86
	mov	rax, qword [rsp+20H]			; 08F1 _ 48: 8B. 44 24, 20
?_092:	inc	rbx					; 08F6 _ 48: FF. C3
	jmp	?_091					; 08F9 _ EB, D9

?_093:	mov	qword [rax+r14*8+40H], 0		; 08FB _ 4A: C7. 44 F0, 40, 00000000
	lea	r8d, [rbp-1H]				; 0904 _ 44: 8D. 45, FF
	sub	rdi, 16 				; 0908 _ 48: 83. EF, 10
?_094:	test	r8d, r8d				; 090C _ 45: 85. C0
	js	?_095					; 090F _ 78, 51
	mov	r9, qword [rax+18H]			; 0911 _ 4C: 8B. 48, 18
	lea	rcx, [r9+rdi]				; 0915 _ 49: 8D. 0C 39
	movzx	edx, byte [rcx+1H]			; 0919 _ 0F B6. 51, 01
	lea	r9, [r9+rdi+2H] 			; 091D _ 4D: 8D. 4C 39, 02
	sub	rdi, 2					; 0922 _ 48: 83. EF, 02
	movzx	ecx, byte [rcx] 			; 0926 _ 0F B6. 09
	shl	edx, 8					; 0929 _ C1. E2, 08
	or	edx, ecx				; 092C _ 09. CA
	lea	ecx, [r8+1H]				; 092E _ 41: 8D. 48, 01
	movzx	edx, dx 				; 0932 _ 0F B7. D2
	movsxd	rcx, ecx				; 0935 _ 48: 63. C9
	add	rdx, qword [rax+rcx*8+40H]		; 0938 _ 48: 03. 54 C8, 40
	movzx	ecx, byte [r9+1H]			; 093D _ 41: 0F B6. 49, 01
	movzx	r9d, byte [r9]				; 0942 _ 45: 0F B6. 09
	shl	ecx, 8					; 0946 _ C1. E1, 08
	or	ecx, r9d				; 0949 _ 44: 09. C9
	movsxd	r9, r8d 				; 094C _ 4D: 63. C8
	dec	r8d					; 094F _ 41: FF. C8
	movzx	ecx, cx 				; 0952 _ 0F B7. C9
	sub	rdx, rcx				; 0955 _ 48: 29. CA
	shr	rdx, 1					; 0958 _ 48: D1. EA
	mov	qword [rax+r9*8+40H], rdx		; 095B _ 4A: 89. 54 C8, 40
	jmp	?_094					; 0960 _ EB, AA

?_095:	mov	ecx, 64 				; 0962 _ B9, 00000040
	xor	edx, edx				; 0967 _ 31. D2
	sub	ecx, r12d				; 0969 _ 44: 29. E1
?_096:	cmp	ebp, edx				; 096C _ 39. D5
	jl	?_097					; 096E _ 7C, 0C
	shl	qword [rax+rdx*8+40H], cl		; 0970 _ 48: D3. 64 D0, 40
	inc	rdx					; 0975 _ 48: FF. C2
	dec	ecx					; 0978 _ FF. C9
	jmp	?_096					; 097A _ EB, F0

?_097:	movsxd	rdx, dword [rax+38H]			; 097C _ 48: 63. 50, 38
	add	rdx, rdx				; 0980 _ 48: 01. D2
	sub	qword [rax+18H], rdx			; 0983 _ 48: 29. 50, 18
?_098:	add	rsp, 4184				; 0987 _ 48: 81. C4, 00001058
	pop	rbx					; 098E _ 5B
	pop	rsi					; 098F _ 5E
	pop	rdi					; 0990 _ 5F
	pop	rbp					; 0991 _ 5D
	pop	r12					; 0992 _ 41: 5C
	pop	r13					; 0994 _ 41: 5D
	pop	r14					; 0996 _ 41: 5E
	pop	r15					; 0998 _ 41: 5F
	ret						; 099A _ C3

_ZL7open_tbPKcS0_:; Local function
	push	rbp					; 099B _ 55
	push	rdi					; 099C _ 57
	push	rsi					; 099D _ 56
	push	rbx					; 099E _ 53
	sub	rsp, 328				; 099F _ 48: 81. EC, 00000148
	xor	esi, esi				; 09A6 _ 31. F6
	lea	rbx, [rsp+40H]				; 09A8 _ 48: 8D. 5C 24, 40
	mov	rdi, rcx				; 09AD _ 48: 89. CF
	mov	rbp, rdx				; 09B0 _ 48: 89. D5
?_099:	cmp	dword [rel _ZL9num_paths], esi		; 09B3 _ 39. 35, 000344E8(rel)
	jle	?_100					; 09B9 _ 7E, 73
	mov	rax, qword [rel _ZL5paths]		; 09BB _ 48: 8B. 05, 000344D8(rel)
	mov	rcx, rbx				; 09C2 _ 48: 89. D9
	mov	rdx, qword [rax+rsi*8]			; 09C5 _ 48: 8B. 14 F0
	inc	rsi					; 09C9 _ 48: FF. C6
	call	strcpy					; 09CC _ E8, 00000000(rel)
	lea	rdx, [rel ?_338]			; 09D1 _ 48: 8D. 15, 00000000(rel)
	mov	rcx, rbx				; 09D8 _ 48: 89. D9
	call	strcat					; 09DB _ E8, 00000000(rel)
	mov	rdx, rdi				; 09E0 _ 48: 89. FA
	mov	rcx, rbx				; 09E3 _ 48: 89. D9
	call	strcat					; 09E6 _ E8, 00000000(rel)
	mov	rdx, rbp				; 09EB _ 48: 89. EA
	mov	rcx, rbx				; 09EE _ 48: 89. D9
	call	strcat					; 09F1 _ E8, 00000000(rel)
	xor	r9d, r9d				; 09F6 _ 45: 31. C9
	mov	edx, 2147483648 			; 09F9 _ BA, 80000000
	mov	rcx, rbx				; 09FE _ 48: 89. D9
	mov	qword [rsp+30H], 0			; 0A01 _ 48: C7. 44 24, 30, 00000000
	mov	r8d, 1					; 0A0A _ 41: B8, 00000001
	mov	dword [rsp+28H], 128			; 0A10 _ C7. 44 24, 28, 00000080
	mov	dword [rsp+20H], 3			; 0A18 _ C7. 44 24, 20, 00000003
	call	near [rel __imp_CreateFileA]		; 0A20 _ FF. 15, 00000000(rel)
	cmp	rax, -1 				; 0A26 _ 48: 83. F8, FF
	jz	?_099					; 0A2A _ 74, 87
	jmp	?_101					; 0A2C _ EB, 04

?_100:	or	rax, 0FFFFFFFFFFFFFFFFH 		; 0A2E _ 48: 83. C8, FF
?_101:	add	rsp, 328				; 0A32 _ 48: 81. C4, 00000148
	pop	rbx					; 0A39 _ 5B
	pop	rsi					; 0A3A _ 5E
	pop	rdi					; 0A3B _ 5F
	pop	rbp					; 0A3C _ 5D
	ret						; 0A3D _ C3

_ZL8map_filePKcS0_Py:; Local function
	push	rbp					; 0A3E _ 55
	push	rdi					; 0A3F _ 57
	push	rsi					; 0A40 _ 56
	push	rbx					; 0A41 _ 53
	sub	rsp, 72 				; 0A42 _ 48: 83. EC, 48
	mov	rdi, rcx				; 0A46 _ 48: 89. CF
	mov	rbp, rdx				; 0A49 _ 48: 89. D5
	mov	rbx, r8 				; 0A4C _ 4C: 89. C3
	call	_ZL7open_tbPKcS0_			; 0A4F _ E8, FFFFFF47
	cmp	rax, -1 				; 0A54 _ 48: 83. F8, FF
	mov	rsi, rax				; 0A58 _ 48: 89. C6
	je	?_105					; 0A5B _ 0F 84, 0000009F
	lea	rdx, [rsp+3CH]				; 0A61 _ 48: 8D. 54 24, 3C
	mov	rcx, rax				; 0A66 _ 48: 89. C1
	call	near [rel __imp_GetFileSize]		; 0A69 _ FF. 15, 00000000(rel)
	xor	edx, edx				; 0A6F _ 31. D2
	mov	r9d, dword [rsp+3CH]			; 0A71 _ 44: 8B. 4C 24, 3C
	mov	rcx, rsi				; 0A76 _ 48: 89. F1
	mov	qword [rsp+28H], 0			; 0A79 _ 48: C7. 44 24, 28, 00000000
	mov	r8d, 2					; 0A82 _ 41: B8, 00000002
	mov	dword [rsp+20H], eax			; 0A88 _ 89. 44 24, 20
	call	near [rel __imp_CreateFileMappingA]	; 0A8C _ FF. 15, 00000000(rel)
	test	rax, rax				; 0A92 _ 48: 85. C0
	jnz	?_102					; 0A95 _ 75, 0E
	lea	rcx, [rel ?_339]			; 0A97 _ 48: 8D. 0D, 00000002(rel)
	call	puts					; 0A9E _ E8, 00000000(rel)
	jmp	?_103					; 0AA3 _ EB, 43

?_102:	mov	qword [rbx], rax			; 0AA5 _ 48: 89. 03
	xor	r9d, r9d				; 0AA8 _ 45: 31. C9
	xor	r8d, r8d				; 0AAB _ 45: 31. C0
	mov	edx, 4					; 0AAE _ BA, 00000004
	mov	qword [rsp+20H], 0			; 0AB3 _ 48: C7. 44 24, 20, 00000000
	mov	rcx, rax				; 0ABC _ 48: 89. C1
	call	near [rel __imp_MapViewOfFile]		; 0ABF _ FF. 15, 00000000(rel)
	test	rax, rax				; 0AC5 _ 48: 85. C0
	mov	rbx, rax				; 0AC8 _ 48: 89. C3
	jnz	?_104					; 0ACB _ 75, 25
	call	near [rel __imp_GetLastError]		; 0ACD _ FF. 15, 00000000(rel)
	mov	r8, rbp 				; 0AD3 _ 49: 89. E8
	mov	rdx, rdi				; 0AD6 _ 48: 89. FA
	lea	rcx, [rel ?_340]			; 0AD9 _ 48: 8D. 0D, 0000001E(rel)
	mov	r9d, eax				; 0AE0 _ 41: 89. C1
	call	printf					; 0AE3 _ E8, 00000000(rel)
?_103:	mov	ecx, 1					; 0AE8 _ B9, 00000001
	call	exit					; 0AED _ E8, 00000000(rel)
?_104:	mov	rcx, rsi				; 0AF2 _ 48: 89. F1
	call	near [rel __imp_CloseHandle]		; 0AF5 _ FF. 15, 00000000(rel)
	mov	rax, rbx				; 0AFB _ 48: 89. D8
	jmp	?_106					; 0AFE _ EB, 02

?_105:	xor	eax, eax				; 0B00 _ 31. C0
?_106:	add	rsp, 72 				; 0B02 _ 48: 83. C4, 48
	pop	rbx					; 0B06 _ 5B
	pop	rsi					; 0B07 _ 5E
	pop	rdi					; 0B08 _ 5F
	pop	rbp					; 0B09 _ 5D
	ret						; 0B0A _ C3

_Z16decompress_pairsILb1EEhP9PairsDatay:; Local function
	push	r15					; 0B0B _ 41: 57
	push	r14					; 0B0D _ 41: 56
	push	r13					; 0B0F _ 41: 55
	push	r12					; 0B11 _ 41: 54
	push	rbp					; 0B13 _ 55
	push	rdi					; 0B14 _ 57
	push	rsi					; 0B15 _ 56
	push	rbx					; 0B16 _ 53
	mov	eax, dword [rcx+34H]			; 0B17 _ 8B. 41, 34
	test	eax, eax				; 0B1A _ 85. C0
	mov	r9, rcx 				; 0B1C _ 49: 89. C9
	jnz	?_107					; 0B1F _ 75, 08
	mov	al, byte [rcx+38H]			; 0B21 _ 8A. 41, 38
	jmp	?_117					; 0B24 _ E9, 0000015F

?_107:	mov	r10d, 1 				; 0B29 _ 41: BA, 00000001
	mov	cl, al					; 0B2F _ 88. C1
	mov	r8, r10 				; 0B31 _ 4D: 89. D0
	shl	r8, cl					; 0B34 _ 49: D3. E0
	lea	ecx, [rax-1H]				; 0B37 _ 8D. 48, FF
	dec	r8d					; 0B3A _ 41: FF. C8
	shl	r10, cl 				; 0B3D _ 49: D3. E2
	and	r8d, edx				; 0B40 _ 41: 21. D0
	mov	cl, al					; 0B43 _ 88. C1
	shr	rdx, cl 				; 0B45 _ 48: D3. EA
	sub	r8d, r10d				; 0B48 _ 45: 29. D0
	mov	r10, qword [r9] 			; 0B4B _ 4D: 8B. 11
	imul	edx, edx, 6				; 0B4E _ 6B. D2, 06
	mov	rcx, qword [r9+8H]			; 0B51 _ 49: 8B. 49, 08
	mov	eax, dword [r10+rdx]			; 0B55 _ 41: 8B. 04 12
	movzx	edx, word [r10+rdx+4H]			; 0B59 _ 41: 0F B7. 54 12, 04
	add	r8d, edx				; 0B5F _ 41: 01. D0
	jns	?_109					; 0B62 _ 79, 16
?_108:	lea	edx, [rax-1H]				; 0B64 _ 8D. 50, FF
	mov	rax, rdx				; 0B67 _ 48: 89. D0
	movzx	edx, word [rcx+rdx*2]			; 0B6A _ 0F B7. 14 51
	lea	r8d, [r8+rdx+1H]			; 0B6E _ 45: 8D. 44 10, 01
	test	r8d, r8d				; 0B73 _ 45: 85. C0
	js	?_108					; 0B76 _ 78, EC
	jmp	?_110					; 0B78 _ EB, 14

?_109:	mov	edx, eax				; 0B7A _ 89. C2
	movzx	edx, word [rcx+rdx*2]			; 0B7C _ 0F B7. 14 51
	cmp	r8d, edx				; 0B80 _ 41: 39. D0
	jle	?_110					; 0B83 _ 7E, 09
	inc	edx					; 0B85 _ FF. C2
	inc	eax					; 0B87 _ FF. C0
	sub	r8d, edx				; 0B89 _ 41: 29. D0
	jmp	?_109					; 0B8C _ EB, EC

?_110:	mov	ecx, dword [r9+30H]			; 0B8E _ 41: 8B. 49, 30
	lea	rsi, [r9+40H]				; 0B92 _ 49: 8D. 71, 40
	xor	r11d, r11d				; 0B96 _ 45: 31. DB
	mov	r13d, 64				; 0B99 _ 41: BD, 00000040
	movsxd	rbp, dword [r9+38H]			; 0B9F _ 49: 63. 69, 38
	mov	r12, qword [r9+18H]			; 0BA3 _ 4D: 8B. 61, 18
	mov	rbx, qword [r9+20H]			; 0BA7 _ 49: 8B. 59, 20
	shl	eax, cl 				; 0BAB _ D3. E0
	add	rax, qword [r9+10H]			; 0BAD _ 49: 03. 41, 10
	mov	rdi, rbp				; 0BB1 _ 48: 89. EF
	lea	rcx, [rbp*8]				; 0BB4 _ 48: 8D. 0C ED, 00000000
	sub	rsi, rcx				; 0BBC _ 48: 29. CE
	mov	r10, qword [rax]			; 0BBF _ 4C: 8B. 10
	lea	rdx, [rax+8H]				; 0BC2 _ 48: 8D. 50, 08
	bswap	r10					; 0BC6 _ 49: 0F CA
?_111:	mov	rax, rbp				; 0BC9 _ 48: 89. E8
	mov	r14d, edi				; 0BCC _ 41: 89. FE
?_112:	lea	r15, [rax+1H]				; 0BCF _ 4C: 8D. 78, 01
	mov	rcx, qword [rsi+r15*8-8H]		; 0BD3 _ 4A: 8B. 4C FE, F8
	cmp	r10, rcx				; 0BD8 _ 49: 39. CA
	jnc	?_113					; 0BDB _ 73, 08
	inc	r14d					; 0BDD _ 41: FF. C6
	mov	rax, r15				; 0BE0 _ 4C: 89. F8
	jmp	?_112					; 0BE3 _ EB, EA

?_113:	movzx	r15d, word [r12+rax*2]			; 0BE5 _ 45: 0F B7. 3C 44
	mov	rax, r10				; 0BEA _ 4C: 89. D0
	sub	rax, rcx				; 0BED _ 48: 29. C8
	mov	ecx, r13d				; 0BF0 _ 44: 89. E9
	sub	ecx, r14d				; 0BF3 _ 44: 29. F1
	shr	rax, cl 				; 0BF6 _ 48: D3. E8
	add	eax, r15d				; 0BF9 _ 44: 01. F8
	movsxd	rcx, eax				; 0BFC _ 48: 63. C8
	movzx	ecx, byte [rbx+rcx]			; 0BFF _ 0F B6. 0C 0B
	cmp	ecx, r8d				; 0C03 _ 44: 39. C1
	jge	?_114					; 0C06 _ 7D, 2D
	not	ecx					; 0C08 _ F7. D1
	add	r11d, r14d				; 0C0A _ 45: 01. F3
	add	r8d, ecx				; 0C0D _ 41: 01. C8
	mov	cl, r14b				; 0C10 _ 44: 88. F1
	shl	r10, cl 				; 0C13 _ 49: D3. E2
	cmp	r11d, 31				; 0C16 _ 41: 83. FB, 1F
	jle	?_111					; 0C1A _ 7E, AD
	mov	eax, dword [rdx]			; 0C1C _ 8B. 02
	sub	r11d, 32				; 0C1E _ 41: 83. EB, 20
	add	rdx, 4					; 0C22 _ 48: 83. C2, 04
	mov	cl, r11b				; 0C26 _ 44: 88. D9
	bswap	eax					; 0C29 _ 0F C8
	mov	eax, eax				; 0C2B _ 89. C0
	shl	rax, cl 				; 0C2D _ 48: D3. E0
	or	r10, rax				; 0C30 _ 49: 09. C2
	jmp	?_111					; 0C33 _ EB, 94

?_114:	mov	r10, qword [r9+28H]			; 0C35 _ 4D: 8B. 51, 28
?_115:	movsxd	rdx, eax				; 0C39 _ 48: 63. D0
	cmp	byte [rbx+rdx], 0			; 0C3C _ 80. 3C 13, 00
	jz	?_116					; 0C40 _ 74, 3D
	lea	edx, [rax+rax*2]			; 0C42 _ 8D. 14 40
	movsxd	rdx, edx				; 0C45 _ 48: 63. D2
	add	rdx, r10				; 0C48 _ 4C: 01. D2
	movzx	ecx, byte [rdx+1H]			; 0C4B _ 0F B6. 4A, 01
	movzx	r9d, byte [rdx] 			; 0C4F _ 44: 0F B6. 0A
	mov	eax, ecx				; 0C53 _ 89. C8
	and	eax, 0FH				; 0C55 _ 83. E0, 0F
	shl	eax, 8					; 0C58 _ C1. E0, 08
	or	eax, r9d				; 0C5B _ 44: 09. C8
	movsxd	r9, eax 				; 0C5E _ 4C: 63. C8
	movzx	r9d, byte [rbx+r9]			; 0C61 _ 46: 0F B6. 0C 0B
	cmp	r9d, r8d				; 0C66 _ 45: 39. C1
	jge	?_115					; 0C69 _ 7D, CE
	movzx	eax, byte [rdx+2H]			; 0C6B _ 0F B6. 42, 02
	not	r9d					; 0C6F _ 41: F7. D1
	sar	ecx, 4					; 0C72 _ C1. F9, 04
	add	r8d, r9d				; 0C75 _ 45: 01. C8
	shl	eax, 4					; 0C78 _ C1. E0, 04
	or	eax, ecx				; 0C7B _ 09. C8
	jmp	?_115					; 0C7D _ EB, BA

?_116:	lea	eax, [rax+rax*2]			; 0C7F _ 8D. 04 40
	cdqe						; 0C82 _ 48: 98
	mov	al, byte [r10+rax]			; 0C84 _ 41: 8A. 04 02
?_117:	pop	rbx					; 0C88 _ 5B
	pop	rsi					; 0C89 _ 5E
	pop	rdi					; 0C8A _ 5F
	pop	rbp					; 0C8B _ 5D
	pop	r12					; 0C8C _ 41: 5C
	pop	r13					; 0C8E _ 41: 5D
	pop	r14					; 0C90 _ 41: 5E
	pop	r15					; 0C92 _ 41: 5F
	ret						; 0C94 _ C3

_ZL9pawn_fileP12TBEntry_pawnPi.isra.0:; Local function
	push	rbx					; 0C95 _ 53
	xor	r8d, r8d				; 0C96 _ 45: 31. C0
?_118:	movzx	eax, byte [rcx] 			; 0C99 _ 0F B6. 01
	lea	r9d, [r8+1H]				; 0C9C _ 45: 8D. 48, 01
	cmp	r9d, eax				; 0CA0 _ 41: 39. C1
	mov	eax, dword [rdx]			; 0CA3 _ 8B. 02
	jge	?_120					; 0CA5 _ 7D, 29
	movsxd	rbx, dword [rdx+r8*4+4H]		; 0CA7 _ 4A: 63. 5C 82, 04
	lea	r11, [rel _ZL4flap]			; 0CAC _ 4C: 8D. 1D, 000006C0(rel)
	movsxd	r9, eax 				; 0CB3 _ 4C: 63. C8
	mov	r10, rbx				; 0CB6 _ 49: 89. DA
	mov	bl, byte [r11+rbx]			; 0CB9 _ 41: 8A. 1C 1B
	cmp	byte [r11+r9], bl			; 0CBD _ 43: 38. 1C 0B
	jbe	?_119					; 0CC1 _ 76, 08
	mov	dword [rdx], r10d			; 0CC3 _ 44: 89. 12
	mov	dword [rdx+r8*4+4H], eax		; 0CC6 _ 42: 89. 44 82, 04
?_119:	inc	r8					; 0CCB _ 49: FF. C0
	jmp	?_118					; 0CCE _ EB, C9

?_120:	; Local function
	lea	rdx, [rel _ZL12file_to_file]		; 0CD0 _ 48: 8D. 15, 00000640(rel)
	and	eax, 07H				; 0CD7 _ 83. E0, 07
	movzx	eax, byte [rdx+rax]			; 0CDA _ 0F B6. 04 02
	pop	rbx					; 0CDE _ 5B
	ret						; 0CDF _ C3

_ZL11add_to_hashP7TBEntryy:; Local function
	push	rbx					; 0CE0 _ 53
	sub	rsp, 32 				; 0CE1 _ 48: 83. EC, 20
	lea	rax, [rel _ZL7TB_hash]			; 0CE5 _ 48: 8D. 05, 00000DC0(rel)
	xor	r9d, r9d				; 0CEC _ 45: 31. C9
	mov	r10, rax				; 0CEF _ 49: 89. C2
	mov	r11, rdx				; 0CF2 _ 49: 89. D3
	shr	r11, 54 				; 0CF5 _ 49: C1. EB, 36
	imul	rbx, r11, 80				; 0CF9 _ 49: 6B. DB, 50
	add	rbx, rax				; 0CFD _ 48: 01. C3
?_121:	mov	rax, r9 				; 0D00 _ 4C: 89. C8
	movsxd	r8, r9d 				; 0D03 _ 4D: 63. C1
	shl	rax, 4					; 0D06 _ 48: C1. E0, 04
	cmp	qword [rbx+rax+8H], 0			; 0D0A _ 48: 83. 7C 03, 08, 00
	jz	?_122					; 0D10 _ 74, 1F
	inc	r9					; 0D12 _ 49: FF. C1
	cmp	r9, 5					; 0D15 _ 49: 83. F9, 05
	jnz	?_121					; 0D19 _ 75, E5
	lea	rcx, [rel ?_341]			; 0D1B _ 48: 8D. 0D, 00000051(rel)
	call	puts					; 0D22 _ E8, 00000000(rel)
	mov	ecx, 1					; 0D27 _ B9, 00000001
	call	exit					; 0D2C _ E8, 00000000(rel)
?_122:	lea	rax, [r11+r11*4]			; 0D31 _ 4B: 8D. 04 9B
	add	rax, r8 				; 0D35 _ 4C: 01. C0
	shl	rax, 4					; 0D38 _ 48: C1. E0, 04
	add	rax, r10				; 0D3C _ 4C: 01. D0
	mov	qword [rax], rdx			; 0D3F _ 48: 89. 10
	mov	qword [rax+8H], rcx			; 0D42 _ 48: 89. 48, 08
	add	rsp, 32 				; 0D46 _ 48: 83. C4, 20
	pop	rbx					; 0D4A _ 5B
	ret						; 0D4B _ C3

_ZL7init_tbPc.constprop.4:; Local function
	push	rbp					; 0D4C _ 55
	push	rdi					; 0D4D _ 57
	push	rsi					; 0D4E _ 56
	push	rbx					; 0D4F _ 53
	sub	rsp, 104				; 0D50 _ 48: 83. EC, 68
	lea	rdx, [rel ?_342]			; 0D54 _ 48: 8D. 15, 00000061(rel)
	mov	rbx, rcx				; 0D5B _ 48: 89. CB
	call	_ZL7open_tbPKcS0_			; 0D5E _ E8, FFFFFC38
	cmp	rax, -1 				; 0D63 _ 48: 83. F8, FF
	je	?_149					; 0D67 _ 0F 84, 000001EE
	lea	rdi, [rsp+20H]				; 0D6D _ 48: 8D. 7C 24, 20
	mov	rcx, rax				; 0D72 _ 48: 89. C1
	call	near [rel __imp_CloseHandle]		; 0D75 _ FF. 15, 00000000(rel)
	xor	eax, eax				; 0D7B _ 31. C0
?_123:	mov	dword [rax+rdi], 0			; 0D7D _ C7. 04 38, 00000000
	add	rax, 4					; 0D84 _ 48: 83. C0, 04
	cmp	rax, 64 				; 0D88 _ 48: 83. F8, 40
	jnz	?_123					; 0D8C _ 75, EF
	xor	al, al					; 0D8E _ 30. C0
	mov	ecx, 8					; 0D90 _ B9, 00000008
?_124:	mov	dl, byte [rbx]				; 0D95 _ 8A. 13
	test	dl, dl					; 0D97 _ 84. D2
	jz	?_133					; 0D99 _ 74, 59
	cmp	dl, 80					; 0D9B _ 80. FA, 50
	jz	?_126					; 0D9E _ 74, 27
	jg	?_125					; 0DA0 _ 7F, 16
	cmp	dl, 75					; 0DA2 _ 80. FA, 4B
	jz	?_130					; 0DA5 _ 74, 3C
	cmp	dl, 78					; 0DA7 _ 80. FA, 4E
	jz	?_127					; 0DAA _ 74, 22
	cmp	dl, 66					; 0DAC _ 80. FA, 42
	jnz	?_132					; 0DAF _ 75, 3E
	mov	edx, eax				; 0DB1 _ 89. C2
	or	edx, 03H				; 0DB3 _ 83. CA, 03
	jmp	?_131					; 0DB6 _ EB, 30

?_125:	cmp	dl, 82					; 0DB8 _ 80. FA, 52
	jz	?_128					; 0DBB _ 74, 18
	jl	?_129					; 0DBD _ 7C, 1D
	cmp	dl, 118 				; 0DBF _ 80. FA, 76
	cmove	eax, ecx				; 0DC2 _ 0F 44. C1
	jmp	?_132					; 0DC5 _ EB, 28

?_126:	mov	edx, eax				; 0DC7 _ 89. C2
	or	edx, 01H				; 0DC9 _ 83. CA, 01
	jmp	?_131					; 0DCC _ EB, 1A

?_127:	mov	edx, eax				; 0DCE _ 89. C2
	or	edx, 02H				; 0DD0 _ 83. CA, 02
	jmp	?_131					; 0DD3 _ EB, 13

?_128:	mov	edx, eax				; 0DD5 _ 89. C2
	or	edx, 04H				; 0DD7 _ 83. CA, 04
	jmp	?_131					; 0DDA _ EB, 0C

?_129:	mov	edx, eax				; 0DDC _ 89. C2
	or	edx, 05H				; 0DDE _ 83. CA, 05
	jmp	?_131					; 0DE1 _ EB, 05

?_130:	mov	edx, eax				; 0DE3 _ 89. C2
	or	edx, 06H				; 0DE5 _ 83. CA, 06
?_131:	movsxd	rdx, edx				; 0DE8 _ 48: 63. D2
	inc	dword [rsp+rdx*4+20H]			; 0DEB _ FF. 44 94, 20
?_132:	inc	rbx					; 0DEF _ 48: FF. C3
	jmp	?_124					; 0DF2 _ EB, A1

?_133:	xor	edx, edx				; 0DF4 _ 31. D2
	mov	rcx, rdi				; 0DF6 _ 48: 89. F9
	call	_Z17calc_key_from_pcsPii		; 0DF9 _ E8, 00000000(rel)
	mov	rcx, rdi				; 0DFE _ 48: 89. F9
	mov	edx, 1					; 0E01 _ BA, 00000001
	mov	rsi, rax				; 0E06 _ 48: 89. C6
	call	_Z17calc_key_from_pcsPii		; 0E09 _ E8, 00000000(rel)
	mov	ecx, dword [rsp+24H]			; 0E0E _ 8B. 4C 24, 24
	mov	rbp, rax				; 0E12 _ 48: 89. C5
	mov	eax, dword [rsp+44H]			; 0E15 _ 8B. 44 24, 44
	mov	r9d, ecx				; 0E19 _ 41: 89. C9
	add	r9d, eax				; 0E1C _ 41: 01. C1
	jnz	?_135					; 0E1F _ 75, 2E
	movsxd	rbx, dword [rel _ZL11TBnum_piece]	; 0E21 _ 48: 63. 1D, 000344D4(rel)
	cmp	ebx, 254				; 0E28 _ 81. FB, 000000FE
	jnz	?_134					; 0E2E _ 75, 09
	lea	rcx, [rel ?_343]			; 0E30 _ 48: 8D. 0D, 00000067(rel)
	jmp	?_136					; 0E37 _ EB, 2C

?_134:	lea	edx, [rbx+1H]				; 0E39 _ 8D. 53, 01
	mov	dword [rel _ZL11TBnum_piece], edx	; 0E3C _ 89. 15, 000344D4(rel)
	imul	rbx, rbx, 120				; 0E42 _ 48: 6B. DB, 78
	lea	rdx, [rel _ZL8TB_piece] 		; 0E46 _ 48: 8D. 15, 0002CDC0(rel)
	jmp	?_138					; 0E4D _ EB, 3C

?_135:	movsxd	rbx, dword [rel _ZL10TBnum_pawn]	; 0E4F _ 48: 63. 1D, 000344D0(rel)
	cmp	ebx, 256				; 0E56 _ 81. FB, 00000100
	jnz	?_137					; 0E5C _ 75, 16
	lea	rcx, [rel ?_344]			; 0E5E _ 48: 8D. 0D, 00000082(rel)
?_136:	call	puts					; 0E65 _ E8, 00000000(rel)
	mov	ecx, 1					; 0E6A _ B9, 00000001
	call	exit					; 0E6F _ E8, 00000000(rel)
?_137:	lea	edx, [rbx+1H]				; 0E74 _ 8D. 53, 01
	imul	rbx, rbx, 384				; 0E77 _ 48: 69. DB, 00000180
	mov	dword [rel _ZL10TBnum_pawn], edx	; 0E7E _ 89. 15, 000344D0(rel)
	lea	rdx, [rel _ZL7TB_pawn]			; 0E84 _ 48: 8D. 15, 00014DC0(rel)
?_138:	add	rbx, rdx				; 0E8B _ 48: 01. D3
	xor	r8d, r8d				; 0E8E _ 45: 31. C0
	xor	edx, edx				; 0E91 _ 31. D2
	mov	qword [rbx+8H], rsi			; 0E93 _ 48: 89. 73, 08
	mov	byte [rbx+18H], 0			; 0E97 _ C6. 43, 18, 00
?_139:	add	r8d, dword [rdi+rdx]			; 0E9B _ 44: 03. 04 17
	add	rdx, 4					; 0E9F _ 48: 83. C2, 04
	cmp	rdx, 64 				; 0EA3 _ 48: 83. FA, 40
	jnz	?_139					; 0EA7 _ 75, F2
	cmp	rsi, rbp				; 0EA9 _ 48: 39. EE
	mov	byte [rbx+19H], r8b			; 0EAC _ 44: 88. 43, 19
	movzx	r8d, r8b				; 0EB0 _ 45: 0F B6. C0
	sete	byte [rbx+1AH]				; 0EB4 _ 0F 94. 43, 1A
	test	r9d, r9d				; 0EB8 _ 45: 85. C9
	setg	dl					; 0EBB _ 0F 9F. C2
	cmp	r8d, dword [rel _ZN13TablebaseCore14MaxCardinalityE]; 0EBE _ 44: 3B. 05, 00000000(rel)
	mov	byte [rbx+1BH], dl			; 0EC5 _ 88. 53, 1B
	jle	?_140					; 0EC8 _ 7E, 07
	mov	dword [rel _ZN13TablebaseCore14MaxCardinalityE], r8d; 0ECA _ 44: 89. 05, 00000000(rel)
?_140:	test	dl, dl					; 0ED1 _ 84. D2
	jz	?_142					; 0ED3 _ 74, 1A
	test	eax, eax				; 0ED5 _ 85. C0
	mov	byte [rbx+1CH], cl			; 0ED7 _ 88. 4B, 1C
	mov	byte [rbx+1DH], al			; 0EDA _ 88. 43, 1D
	jle	?_148					; 0EDD _ 7E, 60
	test	ecx, ecx				; 0EDF _ 85. C9
	jz	?_141					; 0EE1 _ 74, 04
	cmp	eax, ecx				; 0EE3 _ 39. C8
	jge	?_148					; 0EE5 _ 7D, 58
?_141:	mov	byte [rbx+1CH], al			; 0EE7 _ 88. 43, 1C
	mov	byte [rbx+1DH], cl			; 0EEA _ 88. 4B, 1D
	jmp	?_148					; 0EED _ EB, 50

?_142:	xor	eax, eax				; 0EEF _ 31. C0
	xor	edx, edx				; 0EF1 _ 31. D2
?_143:	xor	ecx, ecx				; 0EF3 _ 31. C9
	cmp	dword [rdi+rax], 1			; 0EF5 _ 83. 3C 07, 01
	sete	cl					; 0EF9 _ 0F 94. C1
	add	rax, 4					; 0EFC _ 48: 83. C0, 04
	add	edx, ecx				; 0F00 _ 01. CA
	cmp	rax, 64 				; 0F02 _ 48: 83. F8, 40
	jnz	?_143					; 0F06 _ 75, EB
	cmp	edx, 2					; 0F08 _ 83. FA, 02
	jle	?_144					; 0F0B _ 7E, 06
	mov	byte [rbx+1CH], 0			; 0F0D _ C6. 43, 1C, 00
	jmp	?_148					; 0F11 _ EB, 2C

?_144:	jnz	?_145					; 0F13 _ 75, 06
	mov	byte [rbx+1CH], 2			; 0F15 _ C6. 43, 1C, 02
	jmp	?_148					; 0F19 _ EB, 24

?_145:	xor	eax, eax				; 0F1B _ 31. C0
	mov	edx, 16 				; 0F1D _ BA, 00000010
?_146:	mov	ecx, dword [rdi+rax]			; 0F22 _ 8B. 0C 07
	cmp	ecx, edx				; 0F25 _ 39. D1
	jge	?_147					; 0F27 _ 7D, 06
	cmp	ecx, 1					; 0F29 _ 83. F9, 01
	cmovg	edx, ecx				; 0F2C _ 0F 4F. D1
?_147:	add	rax, 4					; 0F2F _ 48: 83. C0, 04
	lea	ecx, [rdx+1H]				; 0F33 _ 8D. 4A, 01
	cmp	rax, 64 				; 0F36 _ 48: 83. F8, 40
	jnz	?_146					; 0F3A _ 75, E6
	mov	byte [rbx+1CH], cl			; 0F3C _ 88. 4B, 1C
?_148:	mov	rdx, rsi				; 0F3F _ 48: 89. F2
	mov	rcx, rbx				; 0F42 _ 48: 89. D9
	call	_ZL11add_to_hashP7TBEntryy		; 0F45 _ E8, FFFFFD96
	cmp	rbp, rsi				; 0F4A _ 48: 39. F5
	jz	?_149					; 0F4D _ 74, 0C
	mov	rdx, rbp				; 0F4F _ 48: 89. EA
	mov	rcx, rbx				; 0F52 _ 48: 89. D9
	call	_ZL11add_to_hashP7TBEntryy		; 0F55 _ E8, FFFFFD86
	nop						; 0F5A _ 90
?_149:	add	rsp, 104				; 0F5B _ 48: 83. C4, 68
	pop	rbx					; 0F5F _ 5B
	pop	rsi					; 0F60 _ 5E
	pop	rdi					; 0F61 _ 5F
	pop	rbp					; 0F62 _ 5D
	ret						; 0F63 _ C3

_ZL18calc_factors_piecePiiiPhh:; Local function
	push	r14					; 0F64 _ 41: 56
	push	r13					; 0F66 _ 41: 55
	push	r12					; 0F68 _ 41: 54
	push	rbp					; 0F6A _ 55
	push	rdi					; 0F6B _ 57
	push	rsi					; 0F6C _ 56
	push	rbx					; 0F6D _ 53
	mov	ebx, 64 				; 0F6E _ BB, 00000040
	mov	r11d, 1 				; 0F73 _ 41: BB, 00000001
	xor	edi, edi				; 0F79 _ 31. FF
	movzx	esi, byte [r9]				; 0F7B _ 41: 0F B6. 31
	movzx	r13d, byte [rsp+60H]			; 0F7F _ 44: 0F B6. 6C 24, 60
	mov	r12d, edx				; 0F85 _ 41: 89. D4
	sub	ebx, esi				; 0F88 _ 29. F3
?_150:	cmp	edi, r8d				; 0F8A _ 44: 39. C7
	jnz	?_153					; 0F8D _ 75, 2A
	lea	rax, [rel _ZZL18calc_factors_piecePiiiPhhE6pivfac]; 0F8F _ 48: 8D. 05, 000000F8(rel)
	mov	dword [rcx], r11d			; 0F96 _ 44: 89. 19
	movsxd	rax, dword [rax+r13*4]			; 0F99 _ 4A: 63. 04 A8
	imul	r11, rax				; 0F9D _ 4C: 0F AF. D8
	jmp	?_152					; 0FA1 _ EB, 12

?_151:	mov	eax, r10d				; 0FA3 _ 44: 89. D0
	sub	ebx, ebp				; 0FA6 _ 29. EB
	add	esi, ebp				; 0FA8 _ 01. EE
	cdq						; 0FAA _ 99
	idiv	r14d					; 0FAB _ 41: F7. FE
	movsxd	r10, eax				; 0FAE _ 4C: 63. D0
	imul	r11, r10				; 0FB1 _ 4D: 0F AF. DA
?_152:	inc	edi					; 0FB5 _ FF. C7
	jmp	?_150					; 0FB7 _ EB, D1

?_153:	; Local function
	cmp	esi, r12d				; 0FB9 _ 44: 39. E6
	jge	?_155					; 0FBC _ 7D, 2E
	movsxd	rax, esi				; 0FBE _ 48: 63. C6
	mov	r10d, ebx				; 0FC1 _ 41: 89. DA
	mov	r14d, 1 				; 0FC4 _ 41: BE, 00000001
	mov	dword [rcx+rax*4], r11d 		; 0FCA _ 44: 89. 1C 81
	movzx	ebp, byte [r9+rax]			; 0FCE _ 41: 0F B6. 2C 01
	mov	eax, 1					; 0FD3 _ B8, 00000001
?_154:	cmp	eax, ebp				; 0FD8 _ 39. E8
	jge	?_151					; 0FDA _ 7D, C7
	mov	edx, ebx				; 0FDC _ 89. DA
	sub	edx, eax				; 0FDE _ 29. C2
	inc	eax					; 0FE0 _ FF. C0
	imul	r10d, edx				; 0FE2 _ 44: 0F AF. D2
	imul	r14d, eax				; 0FE6 _ 44: 0F AF. F0
	jmp	?_154					; 0FEA _ EB, EC

?_155:	; Local function
	mov	rax, r11				; 0FEC _ 4C: 89. D8
	pop	rbx					; 0FEF _ 5B
	pop	rsi					; 0FF0 _ 5E
	pop	rdi					; 0FF1 _ 5F
	pop	rbp					; 0FF2 _ 5D
	pop	r12					; 0FF3 _ 41: 5C
	pop	r13					; 0FF5 _ 41: 5D
	pop	r14					; 0FF7 _ 41: 5E
	ret						; 0FF9 _ C3

_ZL14free_dtz_entryP7TBEntry:; Local function
	push	rsi					; 0FFA _ 56
	push	rbx					; 0FFB _ 53
	sub	rsp, 40 				; 0FFC _ 48: 83. EC, 28
	mov	rsi, qword [rcx+10H]			; 1000 _ 48: 8B. 71, 10
	mov	rbx, rcx				; 1004 _ 48: 89. CB
	mov	rcx, qword [rcx]			; 1007 _ 48: 8B. 09
	test	rcx, rcx				; 100A _ 48: 85. C9
	jz	?_156					; 100D _ 74, 0F
	call	near [rel __imp_UnmapViewOfFile]	; 100F _ FF. 15, 00000000(rel)
	mov	rcx, rsi				; 1015 _ 48: 89. F1
	call	near [rel __imp_CloseHandle]		; 1018 _ FF. 15, 00000000(rel)
?_156:	xor	esi, esi				; 101E _ 31. F6
	cmp	byte [rbx+1BH], 0			; 1020 _ 80. 7B, 1B, 00
	jnz	?_157					; 1024 _ 75, 0B
	mov	rcx, qword [rbx+20H]			; 1026 _ 48: 8B. 4B, 20
	call	free					; 102A _ E8, 00000000(rel)
	jmp	?_158					; 102F _ EB, 17

?_157:	mov	rcx, qword [rbx+rsi+20H]		; 1031 _ 48: 8B. 4C 33, 20
	add	rsi, 48 				; 1036 _ 48: 83. C6, 30
	call	free					; 103A _ E8, 00000000(rel)
	cmp	rsi, 192				; 103F _ 48: 81. FE, 000000C0
	jnz	?_157					; 1046 _ 75, E9
?_158:	mov	rcx, rbx				; 1048 _ 48: 89. D9
	add	rsp, 40 				; 104B _ 48: 83. C4, 28
	pop	rbx					; 104F _ 5B
	pop	rsi					; 1050 _ 5E
	jmp	free					; 1051 _ E9, 00000000(rel)

_ZL17calc_factors_pawnPiiiiPhi:; Local function
	push	r15					; 1056 _ 41: 57
	push	r14					; 1058 _ 41: 56
	push	r13					; 105A _ 41: 55
	push	r12					; 105C _ 41: 54
	push	rbp					; 105E _ 55
	push	rdi					; 105F _ 57
	push	rsi					; 1060 _ 56
	push	rbx					; 1061 _ 53
	sub	rsp, 24 				; 1062 _ 48: 83. EC, 18
	mov	rbx, qword [rsp+80H]			; 1066 _ 48: 8B. 9C 24, 00000080
	cmp	r9d, 14 				; 106E _ 41: 83. F9, 0E
	mov	r13d, edx				; 1072 _ 41: 89. D5
	movzx	r11d, byte [rbx]			; 1075 _ 44: 0F B6. 1B
	jg	?_159					; 1079 _ 7F, 08
	movzx	eax, byte [rbx+r11]			; 107B _ 42: 0F B6. 04 1B
	add	r11d, eax				; 1080 _ 41: 01. C3
?_159:	movsxd	r14, dword [rsp+88H]			; 1083 _ 4C: 63. B4 24, 00000088
	mov	esi, 64 				; 108B _ BE, 00000040
	mov	r10d, 1 				; 1090 _ 41: BA, 00000001
	xor	edi, edi				; 1096 _ 31. FF
	sub	esi, r11d				; 1098 _ 44: 29. DE
?_160:	cmp	edi, r8d				; 109B _ 44: 39. C7
	jnz	?_165					; 109E _ 75, 3A
	mov	dword [rcx], r10d			; 10A0 _ 44: 89. 11
	movzx	eax, byte [rbx] 			; 10A3 _ 0F B6. 03
	dec	eax					; 10A6 _ FF. C8
	cdqe						; 10A8 _ 48: 98
	lea	rdx, [r14+rax*4]			; 10AA _ 49: 8D. 14 86
	lea	rax, [rel _ZL7pfactor]			; 10AE _ 48: 8D. 05, 00000040(rel)
	movsxd	rax, dword [rax+rdx*4]			; 10B5 _ 48: 63. 04 90
	jmp	?_162					; 10B9 _ EB, 06

?_161:	cdq						; 10BB _ 99
	idiv	r12d					; 10BC _ 41: F7. FC
	cdqe						; 10BF _ 48: 98
?_162:	imul	r10, rax				; 10C1 _ 4C: 0F AF. D0
	jmp	?_164					; 10C5 _ EB, 0F

?_163:	cdq						; 10C7 _ 99
	sub	esi, ebp				; 10C8 _ 29. EE
	add	r11d, ebp				; 10CA _ 41: 01. EB
	idiv	r12d					; 10CD _ 41: F7. FC
	cdqe						; 10D0 _ 48: 98
	imul	r10, rax				; 10D2 _ 4C: 0F AF. D0
?_164:	inc	edi					; 10D6 _ FF. C7
	jmp	?_160					; 10D8 _ EB, C1

?_165:	; Local function
	cmp	r11d, r13d				; 10DA _ 45: 39. EB
	jge	?_170					; 10DD _ 7D, 72
	cmp	edi, r9d				; 10DF _ 44: 39. CF
	jnz	?_168					; 10E2 _ 75, 3F
?_166:	movzx	eax, byte [rbx] 			; 10E4 _ 0F B6. 03
	mov	r15d, 48				; 10E7 _ 41: BF, 00000030
	mov	r12d, 1 				; 10ED _ 41: BC, 00000001
	mov	ebp, 1					; 10F3 _ BD, 00000001
	mov	dword [rcx+rax*4], r10d 		; 10F8 _ 44: 89. 14 81
	movzx	edx, byte [rbx] 			; 10FC _ 0F B6. 13
	movzx	eax, byte [rbx+rdx]			; 10FF _ 0F B6. 04 13
	sub	r15d, edx				; 1103 _ 41: 29. D7
	mov	dword [rsp+0CH], eax			; 1106 _ 89. 44 24, 0C
	mov	eax, r15d				; 110A _ 44: 89. F8
?_167:	cmp	ebp, dword [rsp+0CH]			; 110D _ 3B. 6C 24, 0C
	jge	?_161					; 1111 _ 7D, A8
	mov	edx, r15d				; 1113 _ 44: 89. FA
	sub	edx, ebp				; 1116 _ 29. EA
	inc	ebp					; 1118 _ FF. C5
	imul	eax, edx				; 111A _ 0F AF. C2
	imul	r12d, ebp				; 111D _ 44: 0F AF. E5
	jmp	?_167					; 1121 _ EB, EA

?_168:	movsxd	rax, r11d				; 1123 _ 49: 63. C3
	mov	r12d, 1 				; 1126 _ 41: BC, 00000001
	mov	edx, 1					; 112C _ BA, 00000001
	mov	dword [rcx+rax*4], r10d 		; 1131 _ 44: 89. 14 81
	movzx	ebp, byte [rbx+rax]			; 1135 _ 0F B6. 2C 03
	mov	eax, esi				; 1139 _ 89. F0
?_169:	cmp	edx, ebp				; 113B _ 39. EA
	jge	?_163					; 113D _ 7D, 88
	mov	r15d, esi				; 113F _ 41: 89. F7
	sub	r15d, edx				; 1142 _ 41: 29. D7
	inc	edx					; 1145 _ FF. C2
	imul	eax, r15d				; 1147 _ 41: 0F AF. C7
	imul	r12d, edx				; 114B _ 44: 0F AF. E2
	jmp	?_169					; 114F _ EB, EA

?_170:	; Local function
	cmp	edi, r9d				; 1151 _ 44: 39. CF
	jz	?_166					; 1154 _ 74, 8E
	mov	rax, r10				; 1156 _ 4C: 89. D0
	add	rsp, 24 				; 1159 _ 48: 83. C4, 18
	pop	rbx					; 115D _ 5B
	pop	rsi					; 115E _ 5E
	pop	rdi					; 115F _ 5F
	pop	rbp					; 1160 _ 5D
	pop	r12					; 1161 _ 41: 5C
	pop	r13					; 1163 _ 41: 5D
	pop	r14					; 1165 _ 41: 5E
	pop	r15					; 1167 _ 41: 5F
	ret						; 1169 _ C3

_ZL14free_wdl_entryP7TBEntry:; Local function
	push	rsi					; 116A _ 56
	push	rbx					; 116B _ 53
	sub	rsp, 40 				; 116C _ 48: 83. EC, 28
	mov	rsi, qword [rcx+10H]			; 1170 _ 48: 8B. 71, 10
	mov	rbx, rcx				; 1174 _ 48: 89. CB
	mov	rcx, qword [rcx]			; 1177 _ 48: 8B. 09
	test	rcx, rcx				; 117A _ 48: 85. C9
	jz	?_171					; 117D _ 74, 0F
	call	near [rel __imp_UnmapViewOfFile]	; 117F _ FF. 15, 00000000(rel)
	mov	rcx, rsi				; 1185 _ 48: 89. F1
	call	near [rel __imp_CloseHandle]		; 1188 _ FF. 15, 00000000(rel)
?_171:	xor	esi, esi				; 118E _ 31. F6
	cmp	byte [rbx+1BH], 0			; 1190 _ 80. 7B, 1B, 00
	jnz	?_173					; 1194 _ 75, 2A
	mov	rcx, qword [rbx+20H]			; 1196 _ 48: 8B. 4B, 20
	call	free					; 119A _ E8, 00000000(rel)
	mov	rcx, qword [rbx+28H]			; 119F _ 48: 8B. 4B, 28
	test	rcx, rcx				; 11A3 _ 48: 85. C9
	jz	?_174					; 11A6 _ 74, 33
	add	rsp, 40 				; 11A8 _ 48: 83. C4, 28
	pop	rbx					; 11AC _ 5B
	pop	rsi					; 11AD _ 5E
	jmp	free					; 11AE _ E9, 00000000(rel)

?_172:	add	rsi, 88 				; 11B3 _ 48: 83. C6, 58
	cmp	rsi, 352				; 11B7 _ 48: 81. FE, 00000160
	jz	?_174					; 11BE _ 74, 1B
?_173:	mov	rcx, qword [rbx+rsi+20H]		; 11C0 _ 48: 8B. 4C 33, 20
	call	free					; 11C5 _ E8, 00000000(rel)
	mov	rcx, qword [rbx+rsi+28H]		; 11CA _ 48: 8B. 4C 33, 28
	test	rcx, rcx				; 11CF _ 48: 85. C9
	jz	?_172					; 11D2 _ 74, DF
	call	free					; 11D4 _ E8, 00000000(rel)
	jmp	?_172					; 11D9 _ EB, D8

?_174:	; Local function
	add	rsp, 40 				; 11DB _ 48: 83. C4, 28
	pop	rbx					; 11DF _ 5B
	pop	rsi					; 11E0 _ 5E
	ret						; 11E1 _ C3

WinMain:; Function begin
	xor	eax, eax				; 11E2 _ 31. C0
	ret						; 11E4 _ C3
; WinMain End of function

_ZN13TablebaseCore4initEPKc:; Function begin
	push	r15					; 11E5 _ 41: 57
	push	r14					; 11E7 _ 41: 56
	push	r13					; 11E9 _ 41: 55
	push	r12					; 11EB _ 41: 54
	push	rbp					; 11ED _ 55
	push	rdi					; 11EE _ 57
	push	rsi					; 11EF _ 56
	push	rbx					; 11F0 _ 53
	sub	rsp, 72 				; 11F1 _ 48: 83. EC, 48
	cmp	byte [rel _ZL11initialized], 0		; 11F5 _ 80. 3D, 000344EB(rel), 00
	mov	rbx, rcx				; 11FC _ 48: 89. CB
	jnz	?_175					; 11FF _ 75, 12
	lea	r9, [rel _ZL8binomial]			; 1201 _ 4C: 8D. 0D, 000002C0(rel)
	xor	r10d, r10d				; 1208 _ 45: 31. D2
	mov	rcx, r9 				; 120B _ 4C: 89. C9
	jmp	?_182					; 120E _ E9, 00000086

?_175:	mov	rcx, qword [rel _ZL11path_string]	; 1213 _ 48: 8B. 0D, 000344E0(rel)
	lea	rdi, [rel _ZL8TB_piece] 		; 121A _ 48: 8D. 3D, 0002CDC0(rel)
	xor	esi, esi				; 1221 _ 31. F6
	call	free					; 1223 _ E8, 00000000(rel)
	mov	rcx, qword [rel _ZL5paths]		; 1228 _ 48: 8B. 0D, 000344D8(rel)
	call	free					; 122F _ E8, 00000000(rel)
?_176:	cmp	esi, dword [rel _ZL11TBnum_piece]	; 1234 _ 3B. 35, 000344D4(rel)
	jge	?_177					; 123A _ 7D, 10
	mov	rcx, rdi				; 123C _ 48: 89. F9
	inc	esi					; 123F _ FF. C6
	add	rdi, 120				; 1241 _ 48: 83. C7, 78
	call	_ZL14free_wdl_entryP7TBEntry		; 1245 _ E8, FFFFFF20
	jmp	?_176					; 124A _ EB, E8

?_177:	lea	rdi, [rel _ZL7TB_pawn]			; 124C _ 48: 8D. 3D, 00014DC0(rel)
	xor	esi, esi				; 1253 _ 31. F6
?_178:	cmp	esi, dword [rel _ZL10TBnum_pawn]	; 1255 _ 3B. 35, 000344D0(rel)
	jge	?_179					; 125B _ 7D, 13
	mov	rcx, rdi				; 125D _ 48: 89. F9
	inc	esi					; 1260 _ FF. C6
	add	rdi, 384				; 1262 _ 48: 81. C7, 00000180
	call	_ZL14free_wdl_entryP7TBEntry		; 1269 _ E8, FFFFFEFC
	jmp	?_178					; 126E _ EB, E5

?_179:	xor	esi, esi				; 1270 _ 31. F6
?_180:	lea	rax, [rel ?_334]			; 1272 _ 48: 8D. 05, 000007D0(rel)
	mov	rcx, qword [rax+rsi]			; 1279 _ 48: 8B. 0C 30
	test	rcx, rcx				; 127D _ 48: 85. C9
	jz	?_181					; 1280 _ 74, 05
	call	_ZL14free_dtz_entryP7TBEntry		; 1282 _ E8, FFFFFD73
?_181:	add	rsi, 24 				; 1287 _ 48: 83. C6, 18
	cmp	rsi, 1536				; 128B _ 48: 81. FE, 00000600
	jnz	?_180					; 1292 _ 75, DE
	jmp	?_195					; 1294 _ E9, 00000192

?_182:	xor	r8d, r8d				; 1299 _ 45: 31. C0
?_183:	mov	eax, r8d				; 129C _ 44: 89. C0
	mov	r11d, 1 				; 129F _ 41: BB, 00000001
	mov	edx, 1					; 12A5 _ BA, 00000001
?_184:	cmp	edx, r10d				; 12AA _ 44: 39. D2
	jg	?_185					; 12AD _ 7F, 10
	mov	esi, r8d				; 12AF _ 44: 89. C6
	sub	esi, edx				; 12B2 _ 29. D6
	inc	edx					; 12B4 _ FF. C2
	imul	eax, esi				; 12B6 _ 0F AF. C6
	imul	r11d, edx				; 12B9 _ 44: 0F AF. DA
	jmp	?_184					; 12BD _ EB, EB

?_185:	cdq						; 12BF _ 99
	idiv	r11d					; 12C0 _ 41: F7. FB
	mov	dword [r9+r8*4], eax			; 12C3 _ 43: 89. 04 81
	inc	r8					; 12C7 _ 49: FF. C0
	cmp	r8, 64					; 12CA _ 49: 83. F8, 40
	jnz	?_183					; 12CE _ 75, CC
	inc	r10d					; 12D0 _ 41: FF. C2
	add	r9, 256 				; 12D3 _ 49: 81. C1, 00000100
	cmp	r10d, 5 				; 12DA _ 41: 83. FA, 05
	jnz	?_182					; 12DE _ 75, B9
	lea	r9, [rel _ZL7pfactor]			; 12E0 _ 4C: 8D. 0D, 00000040(rel)
	or	r8d, 0FFFFFFFFH 			; 12E7 _ 41: 83. C8, FF
	xor	eax, eax				; 12EB _ 31. C0
	lea	r10, [rel _ZL7pawnidx]			; 12ED _ 4C: 8D. 15, 000000C0(rel)
?_186:	movsxd	rsi, r8d				; 12F4 _ 49: 63. F0
	xor	edx, edx				; 12F7 _ 31. D2
	xor	r11d, r11d				; 12F9 _ 45: 31. DB
	shl	rsi, 6					; 12FC _ 48: C1. E6, 06
?_187:	test	eax, eax				; 1300 _ 85. C0
	mov	dword [r10+rdx*4], r11d 		; 1302 _ 45: 89. 1C 92
	mov	edi, 1					; 1306 _ BF, 00000001
	jz	?_188					; 130B _ 74, 1D
	lea	rdi, [rel _ZL7invflap]			; 130D _ 48: 8D. 3D, 00000650(rel)
	movzx	edi, byte [rdi+rdx]			; 1314 _ 0F B6. 3C 17
	lea	rbp, [rel _ZL6ptwist]			; 1318 _ 48: 8D. 2D, 00000680(rel)
	movzx	edi, byte [rbp+rdi]			; 131F _ 0F B6. 7C 3D, 00
	add	rdi, rsi				; 1324 _ 48: 01. F7
	mov	edi, dword [rcx+rdi*4]			; 1327 _ 8B. 3C B9
?_188:	inc	rdx					; 132A _ 48: FF. C2
	add	r11d, edi				; 132D _ 41: 01. FB
	cmp	rdx, 6					; 1330 _ 48: 83. FA, 06
	jnz	?_187					; 1334 _ 75, CA
	movsxd	rsi, r8d				; 1336 _ 49: 63. F0
	mov	dword [r9], r11d			; 1339 _ 45: 89. 19
	xor	dl, dl					; 133C _ 30. D2
	xor	r11d, r11d				; 133E _ 45: 31. DB
	shl	rsi, 6					; 1341 _ 48: C1. E6, 06
?_189:	test	eax, eax				; 1345 _ 85. C0
	mov	dword [r10+rdx*4+18H], r11d		; 1347 _ 45: 89. 5C 92, 18
	mov	edi, 1					; 134C _ BF, 00000001
	jz	?_190					; 1351 _ 74, 1D
	lea	rdi, [rel ?_350]			; 1353 _ 48: 8D. 3D, 00000656(rel)
	movzx	edi, byte [rdi+rdx]			; 135A _ 0F B6. 3C 17
	lea	rbp, [rel _ZL6ptwist]			; 135E _ 48: 8D. 2D, 00000680(rel)
	movzx	edi, byte [rbp+rdi]			; 1365 _ 0F B6. 7C 3D, 00
	add	rdi, rsi				; 136A _ 48: 01. F7
	mov	edi, dword [rcx+rdi*4]			; 136D _ 8B. 3C B9
?_190:	inc	rdx					; 1370 _ 48: FF. C2
	add	r11d, edi				; 1373 _ 41: 01. FB
	cmp	rdx, 6					; 1376 _ 48: 83. FA, 06
	jnz	?_189					; 137A _ 75, C9
	movsxd	rsi, r8d				; 137C _ 49: 63. F0
	mov	dword [r9+4H], r11d			; 137F _ 45: 89. 59, 04
	xor	dl, dl					; 1383 _ 30. D2
	xor	r11d, r11d				; 1385 _ 45: 31. DB
	shl	rsi, 6					; 1388 _ 48: C1. E6, 06
?_191:	test	eax, eax				; 138C _ 85. C0
	mov	dword [r10+rdx*4+30H], r11d		; 138E _ 45: 89. 5C 92, 30
	mov	edi, 1					; 1393 _ BF, 00000001
	jz	?_192					; 1398 _ 74, 1D
	lea	rdi, [rel ?_351]			; 139A _ 48: 8D. 3D, 0000065C(rel)
	movzx	edi, byte [rdi+rdx]			; 13A1 _ 0F B6. 3C 17
	lea	rbp, [rel _ZL6ptwist]			; 13A5 _ 48: 8D. 2D, 00000680(rel)
	movzx	edi, byte [rbp+rdi]			; 13AC _ 0F B6. 7C 3D, 00
	add	rdi, rsi				; 13B1 _ 48: 01. F7
	mov	edi, dword [rcx+rdi*4]			; 13B4 _ 8B. 3C B9
?_192:	inc	rdx					; 13B7 _ 48: FF. C2
	add	r11d, edi				; 13BA _ 41: 01. FB
	cmp	rdx, 6					; 13BD _ 48: 83. FA, 06
	jnz	?_191					; 13C1 _ 75, C9
	movsxd	rsi, r8d				; 13C3 _ 49: 63. F0
	mov	dword [r9+8H], r11d			; 13C6 _ 45: 89. 59, 08
	xor	dl, dl					; 13CA _ 30. D2
	xor	r11d, r11d				; 13CC _ 45: 31. DB
	shl	rsi, 6					; 13CF _ 48: C1. E6, 06
?_193:	test	eax, eax				; 13D3 _ 85. C0
	mov	dword [r10+rdx*4+48H], r11d		; 13D5 _ 45: 89. 5C 92, 48
	mov	edi, 1					; 13DA _ BF, 00000001
	jz	?_194					; 13DF _ 74, 1D
	lea	rdi, [rel ?_352]			; 13E1 _ 48: 8D. 3D, 00000662(rel)
	movzx	edi, byte [rdi+rdx]			; 13E8 _ 0F B6. 3C 17
	lea	rbp, [rel _ZL6ptwist]			; 13EC _ 48: 8D. 2D, 00000680(rel)
	movzx	edi, byte [rbp+rdi]			; 13F3 _ 0F B6. 7C 3D, 00
	add	rdi, rsi				; 13F8 _ 48: 01. F7
	mov	edi, dword [rcx+rdi*4]			; 13FB _ 8B. 3C B9
?_194:	inc	rdx					; 13FE _ 48: FF. C2
	add	r11d, edi				; 1401 _ 41: 01. FB
	cmp	rdx, 6					; 1404 _ 48: 83. FA, 06
	jnz	?_193					; 1408 _ 75, C9
	inc	eax					; 140A _ FF. C0
	mov	dword [r9+0CH], r11d			; 140C _ 45: 89. 59, 0C
	add	r10, 96 				; 1410 _ 49: 83. C2, 60
	add	r9, 16					; 1414 _ 49: 83. C1, 10
	inc	r8d					; 1418 _ 41: FF. C0
	cmp	eax, 5					; 141B _ 83. F8, 05
	jne	?_186					; 141E _ 0F 85, FFFFFED0
	mov	byte [rel _ZL11initialized], 1		; 1424 _ C6. 05, 000344EB(rel), 01
?_195:	cmp	byte [rbx], 0				; 142B _ 80. 3B, 00
	je	?_233					; 142E _ 0F 84, 000004B3
	lea	rdx, [rel ?_345]			; 1434 _ 48: 8D. 15, 0000009C(rel)
	mov	rcx, rbx				; 143B _ 48: 89. D9
	call	strcmp					; 143E _ E8, 00000000(rel)
	test	eax, eax				; 1443 _ 85. C0
	je	?_233					; 1445 _ 0F 84, 0000049C
	xor	eax, eax				; 144B _ 31. C0
	mov	rdi, rbx				; 144D _ 48: 89. DF
	or	rcx, 0FFFFFFFFFFFFFFFFH 		; 1450 _ 48: 83. C9, FF
	repne scasb					; 1454 _ F2: AE
	not	rcx					; 1456 _ 48: F7. D1
	call	malloc					; 1459 _ E8, 00000000(rel)
	mov	rdx, rbx				; 145E _ 48: 89. DA
	xor	ebx, ebx				; 1461 _ 31. DB
	mov	rcx, rax				; 1463 _ 48: 89. C1
	mov	rsi, rax				; 1466 _ 48: 89. C6
	mov	qword [rel _ZL11path_string], rax	; 1469 _ 48: 89. 05, 000344E0(rel)
	call	strcpy					; 1470 _ E8, 00000000(rel)
	xor	eax, eax				; 1475 _ 31. C0
?_196:	movsxd	rdx, eax				; 1477 _ 48: 63. D0
	xor	ecx, ecx				; 147A _ 31. C9
	add	rdx, rsi				; 147C _ 48: 01. F2
	cmp	byte [rdx], 59				; 147F _ 80. 3A, 3B
	setne	cl					; 1482 _ 0F 95. C1
	add	ebx, ecx				; 1485 _ 01. CB
?_197:	mov	cl, byte [rdx]				; 1487 _ 8A. 0A
	mov	r8, rdx 				; 1489 _ 49: 89. D0
	inc	rdx					; 148C _ 48: FF. C2
	cmp	cl, 59					; 148F _ 80. F9, 3B
	jz	?_198					; 1492 _ 74, 08
	test	cl, cl					; 1494 _ 84. C9
	jz	?_198					; 1496 _ 74, 04
	inc	eax					; 1498 _ FF. C0
	jmp	?_197					; 149A _ EB, EB

?_198:	test	cl, cl					; 149C _ 84. C9
	jz	?_199					; 149E _ 74, 08
	mov	byte [r8], 0				; 14A0 _ 41: C6. 00, 00
	inc	eax					; 14A4 _ FF. C0
	jmp	?_196					; 14A6 _ EB, CF

?_199:	movsxd	rcx, ebx				; 14A8 _ 48: 63. CB
	mov	dword [rel _ZL9num_paths], ebx		; 14AB _ 89. 1D, 000344E8(rel)
	shl	rcx, 3					; 14B1 _ 48: C1. E1, 03
	call	malloc					; 14B5 _ E8, 00000000(rel)
	xor	ecx, ecx				; 14BA _ 31. C9
	xor	r8d, r8d				; 14BC _ 45: 31. C0
	mov	qword [rel _ZL5paths], rax		; 14BF _ 48: 89. 05, 000344D8(rel)
?_200:	cmp	ebx, ecx				; 14C6 _ 39. CB
	jle	?_204					; 14C8 _ 7E, 3A
	movsxd	rdx, r8d				; 14CA _ 49: 63. D0
	add	rdx, rsi				; 14CD _ 48: 01. F2
?_201:	mov	r9, rdx 				; 14D0 _ 49: 89. D1
	inc	rdx					; 14D3 _ 48: FF. C2
	cmp	byte [rdx-1H], 0			; 14D6 _ 80. 7A, FF, 00
	jnz	?_202					; 14DA _ 75, 05
	inc	r8d					; 14DC _ 41: FF. C0
	jmp	?_201					; 14DF _ EB, EF

?_202:	mov	qword [rax+rcx*8], r9			; 14E1 _ 4C: 89. 0C C8
	movsxd	r9, r8d 				; 14E5 _ 4D: 63. C8
	xor	edx, edx				; 14E8 _ 31. D2
	add	r9, rsi 				; 14EA _ 49: 01. F1
?_203:	lea	r10d, [r8+rdx]				; 14ED _ 45: 8D. 14 10
	inc	rdx					; 14F1 _ 48: FF. C2
	cmp	byte [r9+rdx-1H], 0			; 14F4 _ 41: 80. 7C 11, FF, 00
	jnz	?_203					; 14FA _ 75, F1
	mov	r8d, r10d				; 14FC _ 45: 89. D0
	inc	rcx					; 14FF _ 48: FF. C1
	jmp	?_200					; 1502 _ EB, C2

?_204:	xor	edx, edx				; 1504 _ 31. D2
	xor	ecx, ecx				; 1506 _ 31. C9
	xor	r8d, r8d				; 1508 _ 45: 31. C0
	call	near [rel __imp_CreateMutexA]		; 150B _ FF. 15, 00000000(rel)
	lea	rdx, [rel _ZL7TB_hash]			; 1511 _ 48: 8D. 15, 00000DC0(rel)
	mov	dword [rel _ZL10TBnum_pawn], 0		; 1518 _ C7. 05, 000344CC(rel), 00000000
	mov	qword [rel _ZL8TB_mutex], rax		; 1522 _ 48: 89. 05, 000344F0(rel)
	lea	rcx, [rel _ZL7TB_pawn]			; 1529 _ 48: 8D. 0D, 00014DC0(rel)
	mov	dword [rel _ZL11TBnum_piece], 0 	; 1530 _ C7. 05, 000344D0(rel), 00000000
	mov	dword [rel _ZN13TablebaseCore14MaxCardinalityE], 0; 153A _ C7. 05, FFFFFFFC(rel), 00000000
?_205:	xor	eax, eax				; 1544 _ 31. C0
?_206:	mov	qword [rdx+rax], 0			; 1546 _ 48: C7. 04 02, 00000000
	mov	qword [rdx+rax+8H], 0			; 154E _ 48: C7. 44 02, 08, 00000000
	add	rax, 16 				; 1557 _ 48: 83. C0, 10
	cmp	rax, 80 				; 155B _ 48: 83. F8, 50
	jnz	?_206					; 155F _ 75, E5
	add	rdx, 80 				; 1561 _ 48: 83. C2, 50
	cmp	rdx, rcx				; 1565 _ 48: 39. CA
	jnz	?_205					; 1568 _ 75, DA
	xor	eax, eax				; 156A _ 31. C0
?_207:	lea	rdx, [rel ?_334]			; 156C _ 48: 8D. 15, 000007D0(rel)
	mov	qword [rdx+rax], 0			; 1573 _ 48: C7. 04 02, 00000000
	add	rax, 24 				; 157B _ 48: 83. C0, 18
	cmp	rax, 1536				; 157F _ 48: 3D, 00000600
	jnz	?_207					; 1585 _ 75, E5
	lea	rsi, [rel ?_353]			; 1587 _ 48: 8D. 35, 00000865(rel)
	xor	ebx, ebx				; 158E _ 31. DB
	lea	rdi, [rsp+30H]				; 1590 _ 48: 8D. 7C 24, 30
?_208:	mov	al, byte [rbx+rsi]			; 1595 _ 8A. 04 33
	mov	rcx, rdi				; 1598 _ 48: 89. F9
	inc	rbx					; 159B _ 48: FF. C3
	mov	byte [rsp+30H], 75			; 159E _ C6. 44 24, 30, 4B
	mov	byte [rsp+32H], 118			; 15A3 _ C6. 44 24, 32, 76
	lea	r13, [rel ?_353]			; 15A8 _ 4C: 8D. 2D, 00000865(rel)
	mov	byte [rsp+33H], 75			; 15AF _ C6. 44 24, 33, 4B
	mov	byte [rsp+34H], 0			; 15B4 _ C6. 44 24, 34, 00
	mov	byte [rsp+31H], al			; 15B9 _ 88. 44 24, 31
	call	_ZL7init_tbPc.constprop.4		; 15BD _ E8, FFFFF78A
	cmp	rbx, 5					; 15C2 _ 48: 83. FB, 05
	jnz	?_208					; 15C6 _ 75, CD
	lea	r14, [rel _ZL4pchr]			; 15C8 _ 4C: 8D. 35, 00000864(rel)
	xor	esi, esi				; 15CF _ 31. F6
?_209:	mov	r12b, byte [r13+rsi]			; 15D1 _ 45: 8A. 64 35, 00
	lea	ebp, [rsi+1H]				; 15D6 _ 8D. 6E, 01
?_210:	movsxd	rax, ebp				; 15D9 _ 48: 63. C5
	mov	rcx, rdi				; 15DC _ 48: 89. F9
	inc	ebp					; 15DF _ FF. C5
	mov	byte [rsp+30H], 75			; 15E1 _ C6. 44 24, 30, 4B
	mov	al, byte [r14+rax]			; 15E6 _ 41: 8A. 04 06
	mov	byte [rsp+31H], r12b			; 15EA _ 44: 88. 64 24, 31
	lea	rbx, [rel _ZL4pchr]			; 15EF _ 48: 8D. 1D, 00000864(rel)
	mov	byte [rsp+32H], 118			; 15F6 _ C6. 44 24, 32, 76
	mov	byte [rsp+33H], 75			; 15FB _ C6. 44 24, 33, 4B
	mov	byte [rsp+35H], 0			; 1600 _ C6. 44 24, 35, 00
	mov	byte [rsp+34H], al			; 1605 _ 88. 44 24, 34
	call	_ZL7init_tbPc.constprop.4		; 1609 _ E8, FFFFF73E
	cmp	ebp, 6					; 160E _ 83. FD, 06
	jnz	?_210					; 1611 _ 75, C6
	inc	rsi					; 1613 _ 48: FF. C6
	cmp	rsi, 5					; 1616 _ 48: 83. FE, 05
	jnz	?_209					; 161A _ 75, B5
	xor	esi, esi				; 161C _ 31. F6
?_211:	mov	r12b, byte [r13+rsi]			; 161E _ 45: 8A. 64 35, 00
	lea	ebp, [rsi+1H]				; 1623 _ 8D. 6E, 01
?_212:	movsxd	rax, ebp				; 1626 _ 48: 63. C5
	mov	rcx, rdi				; 1629 _ 48: 89. F9
	inc	ebp					; 162C _ FF. C5
	mov	byte [rsp+30H], 75			; 162E _ C6. 44 24, 30, 4B
	mov	al, byte [rbx+rax]			; 1633 _ 8A. 04 03
	mov	byte [rsp+31H], r12b			; 1636 _ 44: 88. 64 24, 31
	mov	byte [rsp+33H], 118			; 163B _ C6. 44 24, 33, 76
	mov	byte [rsp+34H], 75			; 1640 _ C6. 44 24, 34, 4B
	mov	byte [rsp+35H], 0			; 1645 _ C6. 44 24, 35, 00
	mov	byte [rsp+32H], al			; 164A _ 88. 44 24, 32
	call	_ZL7init_tbPc.constprop.4		; 164E _ E8, FFFFF6F9
	cmp	ebp, 6					; 1653 _ 83. FD, 06
	jnz	?_212					; 1656 _ 75, CE
	inc	rsi					; 1658 _ 48: FF. C6
	cmp	rsi, 5					; 165B _ 48: 83. FE, 05
	jnz	?_211					; 165F _ 75, BD
	xor	esi, esi				; 1661 _ 31. F6
?_213:	mov	r15b, byte [r13+rsi]			; 1663 _ 45: 8A. 7C 35, 00
	lea	ebp, [rsi+1H]				; 1668 _ 8D. 6E, 01
?_214:	movsxd	rax, ebp				; 166B _ 48: 63. C5
	mov	r12d, 5 				; 166E _ 41: BC, 00000005
	mov	r14b, byte [rbx+rax]			; 1674 _ 44: 8A. 34 03
?_215:	mov	rcx, rdi				; 1678 _ 48: 89. F9
	mov	byte [rsp+30H], 75			; 167B _ C6. 44 24, 30, 4B
	mov	byte [rsp+31H], r15b			; 1680 _ 44: 88. 7C 24, 31
	mov	byte [rsp+32H], r14b			; 1685 _ 44: 88. 74 24, 32
	mov	byte [rsp+33H], 118			; 168A _ C6. 44 24, 33, 76
	mov	byte [rsp+34H], 75			; 168F _ C6. 44 24, 34, 4B
	mov	byte [rsp+35H], r14b			; 1694 _ 44: 88. 74 24, 35
	mov	byte [rsp+36H], 0			; 1699 _ C6. 44 24, 36, 00
	call	_ZL7init_tbPc.constprop.4		; 169E _ E8, FFFFF6A9
	dec	r12d					; 16A3 _ 41: FF. CC
	jnz	?_215					; 16A6 _ 75, D0
	inc	ebp					; 16A8 _ FF. C5
	cmp	ebp, 6					; 16AA _ 83. FD, 06
	jnz	?_214					; 16AD _ 75, BC
	inc	rsi					; 16AF _ 48: FF. C6
	cmp	rsi, 5					; 16B2 _ 48: 83. FE, 05
	jnz	?_213					; 16B6 _ 75, AB
	xor	esi, esi				; 16B8 _ 31. F6
?_216:	mov	r14b, byte [r13+rsi]			; 16BA _ 45: 8A. 74 35, 00
	lea	ebp, [rsi+1H]				; 16BF _ 8D. 6E, 01
?_217:	movsxd	rax, ebp				; 16C2 _ 48: 63. C5
	mov	r12d, ebp				; 16C5 _ 41: 89. EC
	mov	r15b, byte [rbx+rax]			; 16C8 _ 44: 8A. 3C 03
?_218:	movsxd	rax, r12d				; 16CC _ 49: 63. C4
	mov	rcx, rdi				; 16CF _ 48: 89. F9
	inc	r12d					; 16D2 _ 41: FF. C4
	mov	byte [rsp+30H], 75			; 16D5 _ C6. 44 24, 30, 4B
	mov	al, byte [rbx+rax]			; 16DA _ 8A. 04 03
	mov	byte [rsp+31H], r14b			; 16DD _ 44: 88. 74 24, 31
	mov	byte [rsp+32H], r15b			; 16E2 _ 44: 88. 7C 24, 32
	mov	byte [rsp+34H], 118			; 16E7 _ C6. 44 24, 34, 76
	mov	byte [rsp+35H], 75			; 16EC _ C6. 44 24, 35, 4B
	mov	byte [rsp+33H], al			; 16F1 _ 88. 44 24, 33
	mov	byte [rsp+36H], 0			; 16F5 _ C6. 44 24, 36, 00
	call	_ZL7init_tbPc.constprop.4		; 16FA _ E8, FFFFF64D
	cmp	r12d, 6 				; 16FF _ 41: 83. FC, 06
	jnz	?_218					; 1703 _ 75, C7
	inc	ebp					; 1705 _ FF. C5
	cmp	ebp, 6					; 1707 _ 83. FD, 06
	jnz	?_217					; 170A _ 75, B6
	inc	rsi					; 170C _ 48: FF. C6
	cmp	rsi, 5					; 170F _ 48: 83. FE, 05
	jnz	?_216					; 1713 _ 75, A5
	xor	r12d, r12d				; 1715 _ 45: 31. E4
?_219:	lea	r15d, [r12+1H]				; 1718 _ 45: 8D. 7C 24, 01
	mov	esi, r15d				; 171D _ 44: 89. FE
?_220:	mov	ebp, r15d				; 1720 _ 44: 89. FD
	mov	r14d, esi				; 1723 _ 41: 89. F6
	movsxd	rax, esi				; 1726 _ 48: 63. C6
?_221:	movsxd	rdx, ebp				; 1729 _ 48: 63. D5
?_222:	cmp	r14d, 5 				; 172C _ 41: 83. FE, 05
	jg	?_223					; 1730 _ 7F, 56
	mov	cl, byte [r13+r12]			; 1732 _ 43: 8A. 4C 25, 00
	mov	qword [rsp+28H], rax			; 1737 _ 48: 89. 44 24, 28
	mov	qword [rsp+20H], rdx			; 173C _ 48: 89. 54 24, 20
	mov	byte [rsp+30H], 75			; 1741 _ C6. 44 24, 30, 4B
	mov	byte [rsp+33H], 118			; 1746 _ C6. 44 24, 33, 76
	mov	byte [rsp+31H], cl			; 174B _ 88. 4C 24, 31
	mov	cl, byte [rbx+rax]			; 174F _ 8A. 0C 03
	mov	byte [rsp+34H], 75			; 1752 _ C6. 44 24, 34, 4B
	mov	byte [rsp+37H], 0			; 1757 _ C6. 44 24, 37, 00
	mov	byte [rsp+32H], cl			; 175C _ 88. 4C 24, 32
	mov	cl, byte [rbx+rdx]			; 1760 _ 8A. 0C 13
	mov	byte [rsp+35H], cl			; 1763 _ 88. 4C 24, 35
	movsxd	rcx, r14d				; 1767 _ 49: 63. CE
	inc	r14d					; 176A _ 41: FF. C6
	mov	cl, byte [rbx+rcx]			; 176D _ 8A. 0C 0B
	mov	byte [rsp+36H], cl			; 1770 _ 88. 4C 24, 36
	mov	rcx, rdi				; 1774 _ 48: 89. F9
	call	_ZL7init_tbPc.constprop.4		; 1777 _ E8, FFFFF5D0
	mov	rax, qword [rsp+28H]			; 177C _ 48: 8B. 44 24, 28
	mov	rdx, qword [rsp+20H]			; 1781 _ 48: 8B. 54 24, 20
	jmp	?_222					; 1786 _ EB, A4

?_223:	inc	ebp					; 1788 _ FF. C5
	cmp	ebp, 6					; 178A _ 83. FD, 06
	jz	?_224					; 178D _ 74, 0C
	cmp	r15d, ebp				; 178F _ 41: 39. EF
	mov	r14d, ebp				; 1792 _ 41: 89. EE
	cmove	r14d, esi				; 1795 _ 44: 0F 44. F6
	jmp	?_221					; 1799 _ EB, 8E

?_224:	inc	esi					; 179B _ FF. C6
	cmp	esi, 6					; 179D _ 83. FE, 06
	jne	?_220					; 17A0 _ 0F 85, FFFFFF7A
	inc	r12					; 17A6 _ 49: FF. C4
	cmp	r12, 5					; 17A9 _ 49: 83. FC, 05
	jne	?_219					; 17AD _ 0F 85, FFFFFF65
	lea	r14, [rel ?_353]			; 17B3 _ 4C: 8D. 35, 00000865(rel)
	xor	edi, edi				; 17BA _ 31. FF
	lea	r12, [rsp+30H]				; 17BC _ 4C: 8D. 64 24, 30
?_225:	lea	esi, [rdi+1H]				; 17C1 _ 8D. 77, 01
?_226:	movsxd	rax, esi				; 17C4 _ 48: 63. C6
	mov	ebp, esi				; 17C7 _ 89. F5
	mov	al, byte [rbx+rax]			; 17C9 _ 8A. 04 03
?_227:	xor	r13d, r13d				; 17CC _ 45: 31. ED
	movsxd	rdx, ebp				; 17CF _ 48: 63. D5
?_228:	mov	cl, byte [rdi+r14]			; 17D2 _ 42: 8A. 0C 37
	inc	r13					; 17D6 _ 49: FF. C5
	mov	byte [rsp+32H], al			; 17D9 _ 88. 44 24, 32
	mov	byte [rsp+28H], al			; 17DD _ 88. 44 24, 28
	lea	r15, [rel ?_353]			; 17E1 _ 4C: 8D. 3D, 00000865(rel)
	mov	qword [rsp+20H], rdx			; 17E8 _ 48: 89. 54 24, 20
	mov	byte [rsp+30H], 75			; 17ED _ C6. 44 24, 30, 4B
	mov	byte [rsp+31H], cl			; 17F2 _ 88. 4C 24, 31
	mov	cl, byte [rbx+rdx]			; 17F6 _ 8A. 0C 13
	mov	byte [rsp+34H], 118			; 17F9 _ C6. 44 24, 34, 76
	mov	byte [rsp+35H], 75			; 17FE _ C6. 44 24, 35, 4B
	mov	byte [rsp+37H], 0			; 1803 _ C6. 44 24, 37, 00
	mov	byte [rsp+33H], cl			; 1808 _ 88. 4C 24, 33
	mov	cl, byte [r13+r14-1H]			; 180C _ 43: 8A. 4C 35, FF
	mov	byte [rsp+36H], cl			; 1811 _ 88. 4C 24, 36
	mov	rcx, r12				; 1815 _ 4C: 89. E1
	call	_ZL7init_tbPc.constprop.4		; 1818 _ E8, FFFFF52F
	cmp	r13, 5					; 181D _ 49: 83. FD, 05
	mov	rdx, qword [rsp+20H]			; 1821 _ 48: 8B. 54 24, 20
	mov	al, byte [rsp+28H]			; 1826 _ 8A. 44 24, 28
	jnz	?_228					; 182A _ 75, A6
	inc	ebp					; 182C _ FF. C5
	cmp	ebp, 6					; 182E _ 83. FD, 06
	jnz	?_227					; 1831 _ 75, 99
	inc	esi					; 1833 _ FF. C6
	cmp	esi, 6					; 1835 _ 83. FE, 06
	jnz	?_226					; 1838 _ 75, 8A
	inc	rdi					; 183A _ 48: FF. C7
	cmp	rdi, 5					; 183D _ 48: 83. FF, 05
	jne	?_225					; 1841 _ 0F 85, FFFFFF7A
	lea	r13, [rel _ZL4pchr]			; 1847 _ 4C: 8D. 2D, 00000864(rel)
	xor	ebx, ebx				; 184E _ 31. DB
?_229:	mov	r14b, byte [r15+rbx]			; 1850 _ 45: 8A. 34 1F
	lea	esi, [rbx+1H]				; 1854 _ 8D. 73, 01
?_230:	movsxd	rax, esi				; 1857 _ 48: 63. C6
	mov	edi, esi				; 185A _ 89. F7
	mov	al, byte [r13+rax]			; 185C _ 41: 8A. 44 05, 00
?_231:	movsxd	rdx, edi				; 1861 _ 48: 63. D7
	mov	ebp, edi				; 1864 _ 89. FD
	mov	dl, byte [r13+rdx]			; 1866 _ 41: 8A. 54 15, 00
?_232:	movsxd	rcx, ebp				; 186B _ 48: 63. CD
	inc	ebp					; 186E _ FF. C5
	mov	byte [rsp+32H], al			; 1870 _ 88. 44 24, 32
	mov	cl, byte [r13+rcx]			; 1874 _ 41: 8A. 4C 0D, 00
	mov	byte [rsp+28H], al			; 1879 _ 88. 44 24, 28
	mov	byte [rsp+33H], dl			; 187D _ 88. 54 24, 33
	mov	byte [rsp+20H], dl			; 1881 _ 88. 54 24, 20
	mov	byte [rsp+30H], 75			; 1885 _ C6. 44 24, 30, 4B
	mov	byte [rsp+34H], cl			; 188A _ 88. 4C 24, 34
	mov	rcx, r12				; 188E _ 4C: 89. E1
	mov	byte [rsp+31H], r14b			; 1891 _ 44: 88. 74 24, 31
	mov	byte [rsp+35H], 118			; 1896 _ C6. 44 24, 35, 76
	mov	byte [rsp+36H], 75			; 189B _ C6. 44 24, 36, 4B
	mov	byte [rsp+37H], 0			; 18A0 _ C6. 44 24, 37, 00
	call	_ZL7init_tbPc.constprop.4		; 18A5 _ E8, FFFFF4A2
	cmp	ebp, 6					; 18AA _ 83. FD, 06
	mov	dl, byte [rsp+20H]			; 18AD _ 8A. 54 24, 20
	mov	al, byte [rsp+28H]			; 18B1 _ 8A. 44 24, 28
	jnz	?_232					; 18B5 _ 75, B4
	inc	edi					; 18B7 _ FF. C7
	cmp	edi, 6					; 18B9 _ 83. FF, 06
	jnz	?_231					; 18BC _ 75, A3
	inc	esi					; 18BE _ FF. C6
	cmp	esi, 6					; 18C0 _ 83. FE, 06
	jnz	?_230					; 18C3 _ 75, 92
	inc	rbx					; 18C5 _ 48: FF. C3
	cmp	rbx, 5					; 18C8 _ 48: 83. FB, 05
	jnz	?_229					; 18CC _ 75, 82
	mov	edx, dword [rel _ZL10TBnum_pawn]	; 18CE _ 8B. 15, 000344D0(rel)
	lea	rcx, [rel ?_346]			; 18D4 _ 48: 8D. 0D, 000000A4(rel)
	add	edx, dword [rel _ZL11TBnum_piece]	; 18DB _ 03. 15, 000344D4(rel)
	call	printf					; 18E1 _ E8, 00000000(rel)
	nop						; 18E6 _ 90
?_233:	add	rsp, 72 				; 18E7 _ 48: 83. C4, 48
	pop	rbx					; 18EB _ 5B
	pop	rsi					; 18EC _ 5E
	pop	rdi					; 18ED _ 5F
	pop	rbp					; 18EE _ 5D
	pop	r12					; 18EF _ 41: 5C
	pop	r13					; 18F1 _ 41: 5D
	pop	r14					; 18F3 _ 41: 5E
	pop	r15					; 18F5 _ 41: 5F
	ret						; 18F7 _ C3
; _ZN13TablebaseCore4initEPKc End of function

_ZN13TablebaseCore15probe_wdl_tableER8PositionPi:; Function begin
	push	r15					; 18F8 _ 41: 57
	push	r14					; 18FA _ 41: 56
	push	r13					; 18FC _ 41: 55
	push	r12					; 18FE _ 41: 54
	push	rbp					; 1900 _ 55
	push	rdi					; 1901 _ 57
	push	rsi					; 1902 _ 56
	push	rbx					; 1903 _ 53
	sub	rsp, 392				; 1904 _ 48: 81. EC, 00000188
	xor	ebx, ebx				; 190B _ 31. DB
	mov	rdi, rcx				; 190D _ 48: 89. CF
	mov	r13, rdx				; 1910 _ 49: 89. D5
	call	_Z16pos_material_keyR8Position		; 1913 _ E8, 00000000(rel)
	mov	rcx, rdi				; 1918 _ 48: 89. F9
	mov	qword [rsp+38H], rax			; 191B _ 48: 89. 44 24, 38
	call	_Z11pos_KvK_keyR8Position		; 1920 _ E8, 00000000(rel)
	cmp	qword [rsp+38H], rax			; 1925 _ 48: 39. 44 24, 38
	je	?_281					; 192A _ 0F 84, 000007AA
	mov	rsi, qword [rsp+38H]			; 1930 _ 48: 8B. 74 24, 38
	shr	rsi, 54 				; 1935 _ 48: C1. EE, 36
	imul	rax, rsi, 80				; 1939 _ 48: 6B. C6, 50
	lea	rsi, [rel _ZL7TB_hash]			; 193D _ 48: 8D. 35, 00000DC0(rel)
	add	rsi, rax				; 1944 _ 48: 01. C6
	lea	rax, [rsi+50H]				; 1947 _ 48: 8D. 46, 50
?_234:	mov	rbx, qword [rsp+38H]			; 194B _ 48: 8B. 5C 24, 38
	cmp	qword [rsi], rbx			; 1950 _ 48: 39. 1E
	jz	?_235					; 1953 _ 74, 18
	add	rsi, 16 				; 1955 _ 48: 83. C6, 10
	cmp	rsi, rax				; 1959 _ 48: 39. C6
	jnz	?_234					; 195C _ 75, ED
	mov	dword [r13], 0				; 195E _ 41: C7. 45, 00, 00000000
	xor	ebx, ebx				; 1966 _ 31. DB
	jmp	?_281					; 1968 _ E9, 0000076D

?_235:	mov	rbx, qword [rsi+8H]			; 196D _ 48: 8B. 5E, 08
	cmp	byte [rbx+18H], 0			; 1971 _ 80. 7B, 18, 00
	jne	?_268					; 1975 _ 0F 85, 0000057D
	or	edx, 0FFFFFFFFH 			; 197B _ 83. CA, FF
	mov	rcx, qword [rel _ZL8TB_mutex]		; 197E _ 48: 8B. 0D, 000344F0(rel)
	call	near [rel __imp_WaitForSingleObject]	; 1985 _ FF. 15, 00000000(rel)
	cmp	byte [rbx+18H], 0			; 198B _ 80. 7B, 18, 00
	jne	?_267					; 198F _ 0F 85, 00000556
	mov	rax, qword [rsp+38H]			; 1995 _ 48: 8B. 44 24, 38
	lea	r12, [rsp+70H]				; 199A _ 4C: 8D. 64 24, 70
	xor	r8d, r8d				; 199F _ 45: 31. C0
	mov	rcx, rdi				; 19A2 _ 48: 89. F9
	cmp	qword [rbx+8H], rax			; 19A5 _ 48: 39. 43, 08
	mov	rdx, r12				; 19A9 _ 4C: 89. E2
	setne	r8b					; 19AC _ 41: 0F 95. C0
	call	_Z7prt_strR8PositionPci 		; 19B0 _ E8, 00000000(rel)
	lea	r8, [rbx+10H]				; 19B5 _ 4C: 8D. 43, 10
	mov	rcx, r12				; 19B9 _ 4C: 89. E1
	lea	rdx, [rel ?_342]			; 19BC _ 48: 8D. 15, 00000061(rel)
	call	_ZL8map_filePKcS0_Py			; 19C3 _ E8, FFFFF076
	test	rax, rax				; 19C8 _ 48: 85. C0
	mov	rbp, rax				; 19CB _ 48: 89. C5
	mov	qword [rbx], rax			; 19CE _ 48: 89. 03
	jnz	?_236					; 19D1 _ 75, 11
	lea	rcx, [rel ?_347]			; 19D3 _ 48: 8D. 0D, 000000C6(rel)
	mov	rdx, r12				; 19DA _ 4C: 89. E2
	call	printf					; 19DD _ E8, 00000000(rel)
	jmp	?_239					; 19E2 _ EB, 45

?_236:	cmp	byte [rax], 113 			; 19E4 _ 80. 38, 71
	jnz	?_237					; 19E7 _ 75, 12
	cmp	byte [rax+1H], -24			; 19E9 _ 80. 78, 01, E8
	jnz	?_237					; 19ED _ 75, 0C
	cmp	byte [rax+2H], 35			; 19EF _ 80. 78, 02, 23
	jnz	?_237					; 19F3 _ 75, 06
	cmp	byte [rax+3H], 93			; 19F5 _ 80. 78, 03, 5D
	jz	?_240					; 19F9 _ 74, 51
?_237:	lea	rcx, [rel ?_348]			; 19FB _ 48: 8D. 0D, 000000DD(rel)
	call	puts					; 1A02 _ E8, 00000000(rel)
	mov	rcx, qword [rbx]			; 1A07 _ 48: 8B. 0B
	mov	rdi, qword [rbx+10H]			; 1A0A _ 48: 8B. 7B, 10
	test	rcx, rcx				; 1A0E _ 48: 85. C9
	jz	?_238					; 1A11 _ 74, 0F
	call	near [rel __imp_UnmapViewOfFile]	; 1A13 _ FF. 15, 00000000(rel)
	mov	rcx, rdi				; 1A19 _ 48: 89. F9
	call	near [rel __imp_CloseHandle]		; 1A1C _ FF. 15, 00000000(rel)
?_238:	mov	qword [rbx], 0				; 1A22 _ 48: C7. 03, 00000000
?_239:	mov	qword [rsi], 0				; 1A29 _ 48: C7. 06, 00000000
	xor	ebx, ebx				; 1A30 _ 31. DB
	mov	rcx, qword [rel _ZL8TB_mutex]		; 1A32 _ 48: 8B. 0D, 000344F0(rel)
	mov	dword [r13], 0				; 1A39 _ 41: C7. 45, 00, 00000000
	call	near [rel __imp_ReleaseMutex]		; 1A41 _ FF. 15, 00000000(rel)
	jmp	?_281					; 1A47 _ E9, 0000068E

?_240:	mov	al, byte [rax+4H]			; 1A4C _ 8A. 40, 04
	lea	rsi, [rbp+5H]				; 1A4F _ 48: 8D. 75, 05
	mov	r12b, al				; 1A53 _ 41: 88. C4
	and	eax, 02H				; 1A56 _ 83. E0, 02
	and	r12d, 01H				; 1A59 _ 41: 83. E4, 01
	cmp	al, 1					; 1A5D _ 3C, 01
	sbb	eax, eax				; 1A5F _ 19. C0
	mov	dword [rsp+30H], eax			; 1A61 _ 89. 44 24, 30
	and	dword [rsp+30H], 0FFFFFFFDH		; 1A65 _ 83. 64 24, 30, FD
	add	dword [rsp+30H], 4			; 1A6A _ 83. 44 24, 30, 04
	cmp	byte [rbx+1BH], 0			; 1A6F _ 80. 7B, 1B, 00
	jne	?_249					; 1A73 _ 0F 85, 000001B6
	movzx	ecx, byte [rbx+19H]			; 1A79 _ 0F B6. 4B, 19
	xor	eax, eax				; 1A7D _ 31. C0
?_241:	cmp	ecx, eax				; 1A7F _ 39. C1
	jle	?_242					; 1A81 _ 7E, 10
	mov	dl, byte [rbp+rax+6H]			; 1A83 _ 8A. 54 05, 06
	and	edx, 0FH				; 1A87 _ 83. E2, 0F
	mov	byte [rbx+rax+60H], dl			; 1A8A _ 88. 54 03, 60
	inc	rax					; 1A8E _ 48: FF. C0
	jmp	?_241					; 1A91 _ EB, EC

?_242:	lea	r9, [rbx+6CH]				; 1A93 _ 4C: 8D. 4B, 6C
	mov	r13b, byte [rbp+5H]			; 1A97 _ 44: 8A. 6D, 05
	mov	rcx, rbx				; 1A9B _ 48: 89. D9
	lea	r8, [rbx+60H]				; 1A9E _ 4C: 8D. 43, 60
	mov	rdx, r9 				; 1AA2 _ 4C: 89. CA
	mov	qword [rsp+30H], r9			; 1AA5 _ 4C: 89. 4C 24, 30
	call	_ZL14set_norm_pieceP13TBEntry_piecePhS1_; 1AAA _ E8, FFFFEADA
	movzx	eax, byte [rbx+1CH]			; 1AAF _ 0F B6. 43, 1C
	lea	rcx, [rbx+30H]				; 1AB3 _ 48: 8D. 4B, 30
	movzx	edx, byte [rbx+19H]			; 1AB7 _ 0F B6. 53, 19
	mov	r9, qword [rsp+30H]			; 1ABB _ 4C: 8B. 4C 24, 30
	and	r13d, 0FH				; 1AC0 _ 41: 83. E5, 0F
	mov	r8d, r13d				; 1AC4 _ 45: 89. E8
	mov	dword [rsp+20H], eax			; 1AC7 _ 89. 44 24, 20
	call	_ZL18calc_factors_piecePiiiPhh		; 1ACB _ E8, FFFFF494
	movzx	edx, byte [rbx+19H]			; 1AD0 _ 0F B6. 53, 19
	xor	ecx, ecx				; 1AD4 _ 31. C9
	mov	r13, rax				; 1AD6 _ 49: 89. C5
	mov	qword [rsp+80H], rax			; 1AD9 _ 48: 89. 84 24, 00000080
?_243:	cmp	edx, ecx				; 1AE1 _ 39. CA
	jle	?_244					; 1AE3 _ 7E, 11
	movzx	eax, byte [rbp+rcx+6H]			; 1AE5 _ 0F B6. 44 0D, 06
	sar	eax, 4					; 1AEA _ C1. F8, 04
	mov	byte [rbx+rcx+66H], al			; 1AED _ 88. 44 0B, 66
	inc	rcx					; 1AF1 _ 48: FF. C1
	jmp	?_243					; 1AF4 _ EB, EB

?_244:	lea	r9, [rbx+72H]				; 1AF6 _ 4C: 8D. 4B, 72
	movzx	ebp, byte [rbp+5H]			; 1AFA _ 0F B6. 6D, 05
	mov	rcx, rbx				; 1AFE _ 48: 89. D9
	lea	r8, [rbx+66H]				; 1B01 _ 4C: 8D. 43, 66
	mov	rdx, r9 				; 1B05 _ 4C: 89. CA
	mov	qword [rsp+30H], r9			; 1B08 _ 4C: 89. 4C 24, 30
	call	_ZL14set_norm_pieceP13TBEntry_piecePhS1_; 1B0D _ E8, FFFFEA77
	movzx	eax, byte [rbx+1CH]			; 1B12 _ 0F B6. 43, 1C
	lea	rcx, [rbx+48H]				; 1B16 _ 48: 8D. 4B, 48
	movzx	edx, byte [rbx+19H]			; 1B1A _ 0F B6. 53, 19
	lea	r14, [rsp+68H]				; 1B1E _ 4C: 8D. 74 24, 68
	mov	r9, qword [rsp+30H]			; 1B23 _ 4C: 8B. 4C 24, 30
	lea	r15, [rsp+67H]				; 1B28 _ 4C: 8D. 7C 24, 67
	sar	ebp, 4					; 1B2D _ C1. FD, 04
	mov	r8d, ebp				; 1B30 _ 41: 89. E8
	mov	dword [rsp+20H], eax			; 1B33 _ 89. 44 24, 20
	call	_ZL18calc_factors_piecePiiiPhh		; 1B37 _ E8, FFFFF428
	mov	r9, r14 				; 1B3C _ 4D: 89. F1
	mov	rdx, r13				; 1B3F _ 4C: 89. EA
	mov	qword [rsp+88H], rax			; 1B42 _ 48: 89. 84 24, 00000088
	mov	rbp, rax				; 1B4A _ 48: 89. C5
	movzx	eax, byte [rbx+19H]			; 1B4D _ 0F B6. 43, 19
	mov	dword [rsp+28H], 1			; 1B51 _ C7. 44 24, 28, 00000001
	mov	qword [rsp+20H], r15			; 1B59 _ 4C: 89. 7C 24, 20
	lea	rcx, [rsi+rax+1H]			; 1B5E _ 48: 8D. 4C 06, 01
	lea	rsi, [rsp+0C0H] 			; 1B63 _ 48: 8D. B4 24, 000000C0
	mov	rax, rcx				; 1B6B _ 48: 89. C8
	and	eax, 01H				; 1B6E _ 83. E0, 01
	mov	r8, rsi 				; 1B71 _ 49: 89. F0
	add	rcx, rax				; 1B74 _ 48: 01. C1
	call	_ZL11setup_pairsPhyPyPS_S_i		; 1B77 _ E8, FFFFEB99
	test	r12b, r12b				; 1B7C _ 45: 84. E4
	mov	rcx, qword [rsp+68H]			; 1B7F _ 48: 8B. 4C 24, 68
	mov	qword [rbx+20H], rax			; 1B84 _ 48: 89. 43, 20
	jz	?_245					; 1B88 _ 74, 27
	mov	qword [rsp+20H], r15			; 1B8A _ 4C: 89. 7C 24, 20
	lea	r8, [rsi+18H]				; 1B8F _ 4C: 8D. 46, 18
	mov	r9, r14 				; 1B93 _ 4D: 89. F1
	mov	rdx, rbp				; 1B96 _ 48: 89. EA
	mov	dword [rsp+28H], 1			; 1B99 _ C7. 44 24, 28, 00000001
	call	_ZL11setup_pairsPhyPyPS_S_i		; 1BA1 _ E8, FFFFEB6F
	mov	rcx, qword [rsp+68H]			; 1BA6 _ 48: 8B. 4C 24, 68
	mov	qword [rbx+28H], rax			; 1BAB _ 48: 89. 43, 28
	jmp	?_246					; 1BAF _ EB, 08

?_245:	mov	qword [rbx+28H], 0			; 1BB1 _ 48: C7. 43, 28, 00000000
?_246:	mov	rax, qword [rbx+20H]			; 1BB9 _ 48: 8B. 43, 20
	mov	qword [rax], rcx			; 1BBD _ 48: 89. 08
	add	rcx, qword [rsp+0C0H]			; 1BC0 _ 48: 03. 8C 24, 000000C0
	test	r12b, r12b				; 1BC8 _ 45: 84. E4
	jz	?_247					; 1BCB _ 74, 0F
	mov	rdx, qword [rbx+28H]			; 1BCD _ 48: 8B. 53, 28
	mov	qword [rdx], rcx			; 1BD1 _ 48: 89. 0A
	add	rcx, qword [rsp+0D8H]			; 1BD4 _ 48: 03. 8C 24, 000000D8
?_247:	mov	qword [rax+8H], rcx			; 1BDC _ 48: 89. 48, 08
	add	rcx, qword [rsp+0C8H]			; 1BE0 _ 48: 03. 8C 24, 000000C8
	test	r12b, r12b				; 1BE8 _ 45: 84. E4
	jz	?_248					; 1BEB _ 74, 10
	mov	rdx, qword [rbx+28H]			; 1BED _ 48: 8B. 53, 28
	mov	qword [rdx+8H], rcx			; 1BF1 _ 48: 89. 4A, 08
	add	rcx, qword [rsp+0E0H]			; 1BF5 _ 48: 03. 8C 24, 000000E0
?_248:	add	rcx, 63 				; 1BFD _ 48: 83. C1, 3F
	and	rcx, 0FFFFFFFFFFFFFFC0H 		; 1C01 _ 48: 83. E1, C0
	mov	qword [rax+10H], rcx			; 1C05 _ 48: 89. 48, 10
	add	rcx, qword [rsp+0D0H]			; 1C09 _ 48: 03. 8C 24, 000000D0
	test	r12b, r12b				; 1C11 _ 45: 84. E4
	je	?_266					; 1C14 _ 0F 84, 000002CD
	mov	rax, qword [rbx+28H]			; 1C1A _ 48: 8B. 43, 28
	add	rcx, 63 				; 1C1E _ 48: 83. C1, 3F
	and	rcx, 0FFFFFFFFFFFFFFC0H 		; 1C22 _ 48: 83. E1, C0
	mov	qword [rax+10H], rcx			; 1C26 _ 48: 89. 48, 10
	jmp	?_266					; 1C2A _ E9, 000002B8

?_249:	cmp	byte [rbx+1DH], 1			; 1C2F _ 80. 7B, 1D, 01
	lea	r13, [rsp+80H]				; 1C33 _ 4C: 8D. AC 24, 00000080
	mov	rbp, rbx				; 1C3B _ 48: 89. DD
	mov	r11, r13				; 1C3E _ 4D: 89. EB
	sbb	eax, eax				; 1C41 _ 19. C0
	xor	r14d, r14d				; 1C43 _ 45: 31. F6
	mov	dword [rsp+58H], eax			; 1C46 _ 89. 44 24, 58
	add	dword [rsp+58H], 2			; 1C4A _ 83. 44 24, 58, 02
?_250:	mov	al, byte [rbx+1DH]			; 1C4F _ 8A. 43, 1D
	mov	r9d, 15 				; 1C52 _ 41: B9, 0000000F
	mov	r15b, byte [rsi]			; 1C58 _ 44: 8A. 3E
	cmp	al, 1					; 1C5B _ 3C, 01
	sbb	r10d, r10d				; 1C5D _ 45: 19. D2
	mov	edx, r15d				; 1C60 _ 44: 89. FA
	and	edx, 0FH				; 1C63 _ 83. E2, 0F
	add	r10d, 2 				; 1C66 _ 41: 83. C2, 02
	test	al, al					; 1C6A _ 84. C0
	mov	dword [rsp+40H], edx			; 1C6C _ 89. 54 24, 40
	jz	?_251					; 1C70 _ 74, 08
	mov	r9b, byte [rsi+1H]			; 1C72 _ 44: 8A. 4E, 01
	and	r9d, 0FH				; 1C76 _ 41: 83. E1, 0F
?_251:	movzx	ecx, byte [rbx+19H]			; 1C7A _ 0F B6. 4B, 19
	movsxd	rdx, r10d				; 1C7E _ 49: 63. D2
	xor	eax, eax				; 1C81 _ 31. C0
	add	rdx, rsi				; 1C83 _ 48: 01. F2
?_252:	cmp	ecx, eax				; 1C86 _ 39. C1
	jle	?_253					; 1C88 _ 7E, 12
	mov	r8b, byte [rdx+rax]			; 1C8A _ 44: 8A. 04 02
	and	r8d, 0FH				; 1C8E _ 41: 83. E0, 0F
	mov	byte [rbp+rax+60H], r8b 		; 1C92 _ 44: 88. 44 05, 60
	inc	rax					; 1C97 _ 48: FF. C0
	jmp	?_252					; 1C9A _ EB, EA

?_253:	lea	r15, [rbp+6CH]				; 1C9C _ 4C: 8D. 7D, 6C
	mov	rcx, rbx				; 1CA0 _ 48: 89. D9
	mov	qword [rsp+50H], r11			; 1CA3 _ 4C: 89. 5C 24, 50
	lea	r8, [rbp+60H]				; 1CA8 _ 4C: 8D. 45, 60
	mov	rdx, r15				; 1CAC _ 4C: 89. FA
	mov	dword [rsp+48H], r10d			; 1CAF _ 44: 89. 54 24, 48
	mov	dword [rsp+5CH], r9d			; 1CB4 _ 44: 89. 4C 24, 5C
	call	_ZL13set_norm_pawnP12TBEntry_pawnPhS1_	; 1CB9 _ E8, FFFFE941
	movzx	edx, byte [rbx+19H]			; 1CBE _ 0F B6. 53, 19
	lea	rcx, [rbp+30H]				; 1CC2 _ 48: 8D. 4D, 30
	mov	qword [rsp+20H], r15			; 1CC6 _ 4C: 89. 7C 24, 20
	mov	r9d, dword [rsp+5CH]			; 1CCB _ 44: 8B. 4C 24, 5C
	mov	dword [rsp+28H], r14d			; 1CD0 _ 44: 89. 74 24, 28
	mov	r8d, dword [rsp+40H]			; 1CD5 _ 44: 8B. 44 24, 40
	call	_ZL17calc_factors_pawnPiiiiPhi		; 1CDA _ E8, FFFFF377
	movzx	r15d, byte [rsi]			; 1CDF _ 44: 0F B6. 3E
	mov	r9d, 15 				; 1CE3 _ 41: B9, 0000000F
	mov	r11, qword [rsp+50H]			; 1CE9 _ 4C: 8B. 5C 24, 50
	movsxd	r10, dword [rsp+48H]			; 1CEE _ 4C: 63. 54 24, 48
	sar	r15d, 4 				; 1CF3 _ 41: C1. FF, 04
	cmp	byte [rbx+1DH], 0			; 1CF7 _ 80. 7B, 1D, 00
	mov	qword [r11], rax			; 1CFB _ 49: 89. 03
	mov	dword [rsp+40H], r15d			; 1CFE _ 44: 89. 7C 24, 40
	jz	?_254					; 1D03 _ 74, 09
	movzx	r9d, byte [rsi+1H]			; 1D05 _ 44: 0F B6. 4E, 01
	sar	r9d, 4					; 1D0A _ 41: C1. F9, 04
?_254:	movzx	edx, byte [rbx+19H]			; 1D0E _ 0F B6. 53, 19
	xor	eax, eax				; 1D12 _ 31. C0
	add	r10, rsi				; 1D14 _ 49: 01. F2
?_255:	cmp	edx, eax				; 1D17 _ 39. C2
	jle	?_256					; 1D19 _ 7E, 11
	movzx	ecx, byte [r10+rax]			; 1D1B _ 41: 0F B6. 0C 02
	sar	ecx, 4					; 1D20 _ C1. F9, 04
	mov	byte [rbp+rax+66H], cl			; 1D23 _ 88. 4C 05, 66
	inc	rax					; 1D27 _ 48: FF. C0
	jmp	?_255					; 1D2A _ EB, EB

?_256:	lea	r15, [rbp+72H]				; 1D2C _ 4C: 8D. 7D, 72
	mov	rcx, rbx				; 1D30 _ 48: 89. D9
	mov	qword [rsp+48H], r11			; 1D33 _ 4C: 89. 5C 24, 48
	lea	r8, [rbp+66H]				; 1D38 _ 4C: 8D. 45, 66
	mov	rdx, r15				; 1D3C _ 4C: 89. FA
	mov	dword [rsp+50H], r9d			; 1D3F _ 44: 89. 4C 24, 50
	call	_ZL13set_norm_pawnP12TBEntry_pawnPhS1_	; 1D44 _ E8, FFFFE8B6
	movzx	edx, byte [rbx+19H]			; 1D49 _ 0F B6. 53, 19
	lea	rcx, [rbp+48H]				; 1D4D _ 48: 8D. 4D, 48
	mov	dword [rsp+28H], r14d			; 1D51 _ 44: 89. 74 24, 28
	mov	r9d, dword [rsp+50H]			; 1D56 _ 44: 8B. 4C 24, 50
	mov	qword [rsp+20H], r15			; 1D5B _ 4C: 89. 7C 24, 20
	inc	r14d					; 1D60 _ 41: FF. C6
	add	rbp, 88 				; 1D63 _ 48: 83. C5, 58
	mov	r8d, dword [rsp+40H]			; 1D67 _ 44: 8B. 44 24, 40
	call	_ZL17calc_factors_pawnPiiiiPhi		; 1D6C _ E8, FFFFF2E5
	mov	r11, qword [rsp+48H]			; 1D71 _ 4C: 8B. 5C 24, 48
	mov	qword [r11+8H], rax			; 1D76 _ 49: 89. 43, 08
	movzx	eax, byte [rbx+19H]			; 1D7A _ 0F B6. 43, 19
	add	r11, 16 				; 1D7E _ 49: 83. C3, 10
	add	eax, dword [rsp+58H]			; 1D82 _ 03. 44 24, 58
	cdqe						; 1D86 _ 48: 98
	add	rsi, rax				; 1D88 _ 48: 01. C6
	cmp	r14d, 4 				; 1D8B _ 41: 83. FE, 04
	jne	?_250					; 1D8F _ 0F 85, FFFFFEBA
	lea	rax, [rsp+68H]				; 1D95 _ 48: 8D. 44 24, 68
	mov	rcx, rsi				; 1D9A _ 48: 89. F1
	mov	dword [rsp+58H], 0			; 1D9D _ C7. 44 24, 58, 00000000
	lea	r15, [rsp+0C0H] 			; 1DA5 _ 4C: 8D. BC 24, 000000C0
	and	ecx, 01H				; 1DAD _ 83. E1, 01
	mov	qword [rsp+40H], rax			; 1DB0 _ 48: 89. 44 24, 40
	lea	r14, [rbx+28H]				; 1DB5 _ 4C: 8D. 73, 28
	add	rcx, rsi				; 1DB9 _ 48: 01. F1
	mov	rbp, r15				; 1DBC _ 4C: 89. FD
	lea	rsi, [rsp+67H]				; 1DBF _ 48: 8D. 74 24, 67
?_257:	mov	dword [rsp+28H], 1			; 1DC4 _ C7. 44 24, 28, 00000001
	mov	r9, qword [rsp+40H]			; 1DCC _ 4C: 8B. 4C 24, 40
	mov	r8, rbp 				; 1DD1 _ 49: 89. E8
	mov	qword [rsp+20H], rsi			; 1DD4 _ 48: 89. 74 24, 20
	mov	rdx, qword [r13]			; 1DD9 _ 49: 8B. 55, 00
	call	_ZL11setup_pairsPhyPyPS_S_i		; 1DDD _ E8, FFFFE933
	test	r12b, r12b				; 1DE2 _ 45: 84. E4
	mov	qword [r14-8H], rax			; 1DE5 _ 49: 89. 46, F8
	mov	rcx, qword [rsp+68H]			; 1DE9 _ 48: 8B. 4C 24, 68
	jz	?_258					; 1DEE _ 74, 29
	mov	rdx, qword [r13+8H]			; 1DF0 _ 49: 8B. 55, 08
	lea	r8, [rbp+18H]				; 1DF4 _ 4C: 8D. 45, 18
	mov	qword [rsp+20H], rsi			; 1DF8 _ 48: 89. 74 24, 20
	mov	r9, qword [rsp+40H]			; 1DFD _ 4C: 8B. 4C 24, 40
	mov	dword [rsp+28H], 1			; 1E02 _ C7. 44 24, 28, 00000001
	call	_ZL11setup_pairsPhyPyPS_S_i		; 1E0A _ E8, FFFFE906
	mov	qword [r14], rax			; 1E0F _ 49: 89. 06
	mov	rcx, qword [rsp+68H]			; 1E12 _ 48: 8B. 4C 24, 68
	jmp	?_259					; 1E17 _ EB, 07

?_258:	mov	qword [r14], 0				; 1E19 _ 49: C7. 06, 00000000
?_259:	inc	dword [rsp+58H] 			; 1E20 _ FF. 44 24, 58
	add	r13, 16 				; 1E24 _ 49: 83. C5, 10
	add	rbp, 48 				; 1E28 _ 48: 83. C5, 30
	add	r14, 88 				; 1E2C _ 49: 83. C6, 58
	mov	eax, dword [rsp+58H]			; 1E30 _ 8B. 44 24, 58
	cmp	eax, dword [rsp+30H]			; 1E34 _ 3B. 44 24, 30
	jnz	?_257					; 1E38 _ 75, 8A
	lea	rax, [rbx+20H]				; 1E3A _ 48: 8D. 43, 20
	mov	rdx, r15				; 1E3E _ 4C: 89. FA
	xor	r9d, r9d				; 1E41 _ 45: 31. C9
	mov	r8, rax 				; 1E44 _ 49: 89. C0
?_260:	mov	r11, qword [r8] 			; 1E47 _ 4D: 8B. 18
	mov	qword [r11], rcx			; 1E4A _ 49: 89. 0B
	add	rcx, qword [rdx]			; 1E4D _ 48: 03. 0A
	test	r12b, r12b				; 1E50 _ 45: 84. E4
	jz	?_261					; 1E53 _ 74, 0B
	mov	r11, qword [r8+8H]			; 1E55 _ 4D: 8B. 58, 08
	mov	qword [r11], rcx			; 1E59 _ 49: 89. 0B
	add	rcx, qword [rdx+18H]			; 1E5C _ 48: 03. 4A, 18
?_261:	inc	r9d					; 1E60 _ 41: FF. C1
	add	r8, 88					; 1E63 _ 49: 83. C0, 58
	add	rdx, 48 				; 1E67 _ 48: 83. C2, 30
	cmp	r9d, dword [rsp+30H]			; 1E6B _ 44: 3B. 4C 24, 30
	jnz	?_260					; 1E70 _ 75, D5
	mov	rdx, r15				; 1E72 _ 4C: 89. FA
	mov	r8, rax 				; 1E75 _ 49: 89. C0
	xor	r9d, r9d				; 1E78 _ 45: 31. C9
?_262:	mov	r11, qword [r8] 			; 1E7B _ 4D: 8B. 18
	mov	qword [r11+8H], rcx			; 1E7E _ 49: 89. 4B, 08
	add	rcx, qword [rdx+8H]			; 1E82 _ 48: 03. 4A, 08
	test	r12b, r12b				; 1E86 _ 45: 84. E4
	jz	?_263					; 1E89 _ 74, 0C
	mov	r11, qword [r8+8H]			; 1E8B _ 4D: 8B. 58, 08
	mov	qword [r11+8H], rcx			; 1E8F _ 49: 89. 4B, 08
	add	rcx, qword [rdx+20H]			; 1E93 _ 48: 03. 4A, 20
?_263:	inc	r9d					; 1E97 _ 41: FF. C1
	add	r8, 88					; 1E9A _ 49: 83. C0, 58
	add	rdx, 48 				; 1E9E _ 48: 83. C2, 30
	cmp	r9d, dword [rsp+30H]			; 1EA2 _ 44: 3B. 4C 24, 30
	jnz	?_262					; 1EA7 _ 75, D2
	xor	edx, edx				; 1EA9 _ 31. D2
?_264:	mov	r8, qword [rax] 			; 1EAB _ 4C: 8B. 00
	add	rcx, 63 				; 1EAE _ 48: 83. C1, 3F
	and	rcx, 0FFFFFFFFFFFFFFC0H 		; 1EB2 _ 48: 83. E1, C0
	mov	qword [r8+10H], rcx			; 1EB6 _ 49: 89. 48, 10
	add	rcx, qword [r15+10H]			; 1EBA _ 49: 03. 4F, 10
	test	r12b, r12b				; 1EBE _ 45: 84. E4
	jz	?_265					; 1EC1 _ 74, 14
	mov	r8, qword [rax+8H]			; 1EC3 _ 4C: 8B. 40, 08
	add	rcx, 63 				; 1EC7 _ 48: 83. C1, 3F
	and	rcx, 0FFFFFFFFFFFFFFC0H 		; 1ECB _ 48: 83. E1, C0
	mov	qword [r8+10H], rcx			; 1ECF _ 49: 89. 48, 10
	add	rcx, qword [r15+28H]			; 1ED3 _ 49: 03. 4F, 28
?_265:	inc	edx					; 1ED7 _ FF. C2
	add	rax, 88 				; 1ED9 _ 48: 83. C0, 58
	add	r15, 48 				; 1EDD _ 49: 83. C7, 30
	cmp	edx, dword [rsp+30H]			; 1EE1 _ 3B. 54 24, 30
	jnz	?_264					; 1EE5 _ 75, C4
?_266:	mov	byte [rbx+18H], 1			; 1EE7 _ C6. 43, 18, 01
?_267:	mov	rcx, qword [rel _ZL8TB_mutex]		; 1EEB _ 48: 8B. 0D, 000344F0(rel)
	call	near [rel __imp_ReleaseMutex]		; 1EF2 _ FF. 15, 00000000(rel)
?_268:	cmp	byte [rbx+1AH], 0			; 1EF8 _ 80. 7B, 1A, 00
	jnz	?_270					; 1EFC _ 75, 3C
	mov	rax, qword [rsp+38H]			; 1EFE _ 48: 8B. 44 24, 38
	mov	rcx, rdi				; 1F03 _ 48: 89. F9
	cmp	rax, qword [rbx+8H]			; 1F06 _ 48: 3B. 43, 08
	jz	?_269					; 1F0A _ 74, 1A
	call	_Z16pos_side_to_moveR8Position		; 1F0C _ E8, 00000000(rel)
	xor	esi, esi				; 1F11 _ 31. F6
	mov	ebp, 8					; 1F13 _ BD, 00000008
	mov	r12d, 56				; 1F18 _ 41: BC, 00000038
	test	eax, eax				; 1F1E _ 85. C0
	sete	sil					; 1F20 _ 40: 0F 94. C6
	jmp	?_271					; 1F24 _ EB, 3D

?_269:	call	_Z16pos_side_to_moveR8Position		; 1F26 _ E8, 00000000(rel)
	xor	esi, esi				; 1F2B _ 31. F6
	test	eax, eax				; 1F2D _ 85. C0
	setne	sil					; 1F2F _ 40: 0F 95. C6
	xor	ebp, ebp				; 1F33 _ 31. ED
	xor	r12d, r12d				; 1F35 _ 45: 31. E4
	jmp	?_271					; 1F38 _ EB, 29

?_270:	mov	rcx, rdi				; 1F3A _ 48: 89. F9
	call	_Z16pos_side_to_moveR8Position		; 1F3D _ E8, 00000000(rel)
	mov	rcx, rdi				; 1F42 _ 48: 89. F9
	cmp	eax, 1					; 1F45 _ 83. F8, 01
	sbb	ebp, ebp				; 1F48 _ 19. ED
	call	_Z16pos_side_to_moveR8Position		; 1F4A _ E8, 00000000(rel)
	not	ebp					; 1F4F _ F7. D5
	and	ebp, 08H				; 1F51 _ 83. E5, 08
	cmp	eax, 1					; 1F54 _ 83. F8, 01
	sbb	r12d, r12d				; 1F57 _ 45: 19. E4
	xor	esi, esi				; 1F5A _ 31. F6
	not	r12d					; 1F5C _ 41: F7. D4
	and	r12d, 38H				; 1F5F _ 41: 83. E4, 38
?_271:	cmp	byte [rbx+1BH], 0			; 1F63 _ 80. 7B, 1B, 00
	jnz	?_275					; 1F67 _ 75, 7E
	imul	rax, rsi, 6				; 1F69 _ 48: 6B. C6, 06
	xor	r12d, r12d				; 1F6D _ 45: 31. E4
	lea	r13, [rbx+rax+60H]			; 1F70 _ 4C: 8D. 6C 03, 60
?_272:	movzx	eax, byte [rbx+19H]			; 1F75 _ 0F B6. 43, 19
	cmp	r12d, eax				; 1F79 _ 41: 39. C4
	jge	?_274					; 1F7C _ 7D, 3A
	movsxd	rax, r12d				; 1F7E _ 49: 63. C4
	mov	rcx, rdi				; 1F81 _ 48: 89. F9
	movzx	edx, byte [r13+rax]			; 1F84 _ 41: 0F B6. 54 05, 00
	mov	r8d, edx				; 1F8A _ 41: 89. D0
	xor	edx, ebp				; 1F8D _ 31. EA
	sar	edx, 3					; 1F8F _ C1. FA, 03
	and	r8d, 07H				; 1F92 _ 41: 83. E0, 07
	call	_Z10pos_piecesR8Position5Color9PieceType; 1F96 _ E8, 00000000(rel)
?_273:	lea	rdx, [rax-1H]				; 1F9B _ 48: 8D. 50, FF
	movsxd	rcx, r12d				; 1F9F _ 49: 63. CC
	inc	r12d					; 1FA2 _ 41: FF. C4
	bsf	r8, rax 				; 1FA5 _ 4C: 0F BC. C0
	and	rax, rdx				; 1FA9 _ 48: 21. D0
	mov	dword [rsp+rcx*4+0C0H], r8d		; 1FAC _ 44: 89. 84 8C, 000000C0
	jnz	?_273					; 1FB4 _ 75, E5
	jmp	?_272					; 1FB6 _ EB, BD

?_274:	imul	rax, rsi, 24				; 1FB8 _ 48: 6B. C6, 18
	mov	rcx, rbx				; 1FBC _ 48: 89. D9
	imul	rdx, rsi, 6				; 1FBF _ 48: 6B. D6, 06
	add	rsi, 4					; 1FC3 _ 48: 83. C6, 04
	lea	r8, [rsp+0C0H]				; 1FC7 _ 4C: 8D. 84 24, 000000C0
	lea	r9, [rbx+rax+30H]			; 1FCF _ 4C: 8D. 4C 03, 30
	lea	rdx, [rbx+rdx+6CH]			; 1FD4 _ 48: 8D. 54 13, 6C
	call	_ZL12encode_pieceP13TBEntry_piecePhPiS2_; 1FD9 _ E8, FFFFE022
	mov	rcx, qword [rbx+rsi*8]			; 1FDE _ 48: 8B. 0C F3
	jmp	?_280					; 1FE2 _ E9, 000000E5

?_275:	movzx	r8d, byte [rbx+60H]			; 1FE7 _ 44: 0F B6. 43, 60
	lea	r14, [rsp+0C0H] 			; 1FEC _ 4C: 8D. B4 24, 000000C0
	mov	rcx, rdi				; 1FF4 _ 48: 89. F9
	xor	r8d, ebp				; 1FF7 _ 41: 31. E8
	mov	edx, r8d				; 1FFA _ 44: 89. C2
	and	r8d, 07H				; 1FFD _ 41: 83. E0, 07
	sar	edx, 3					; 2001 _ C1. FA, 03
	call	_Z10pos_piecesR8Position5Color9PieceType; 2004 _ E8, 00000000(rel)
	xor	edx, edx				; 2009 _ 31. D2
?_276:	bsf	rcx, rax				; 200B _ 48: 0F BC. C8
	lea	r8, [rax-1H]				; 200F _ 4C: 8D. 40, FF
	xor	ecx, r12d				; 2013 _ 44: 31. E1
	lea	r9d, [rdx+1H]				; 2016 _ 44: 8D. 4A, 01
	mov	dword [r14+rdx*4], ecx			; 201A _ 41: 89. 0C 96
	inc	rdx					; 201E _ 48: FF. C2
	and	rax, r8 				; 2021 _ 4C: 21. C0
	jnz	?_276					; 2024 _ 75, E5
	lea	rcx, [rbx+1CH]				; 2026 _ 48: 8D. 4B, 1C
	mov	rdx, r14				; 202A _ 4C: 89. F2
	mov	r13d, r9d				; 202D _ 45: 89. CD
	call	_ZL9pawn_fileP12TBEntry_pawnPi.isra.0	; 2030 _ E8, FFFFEC60
	imul	rdx, rsi, 6				; 2035 _ 48: 6B. D6, 06
	cdqe						; 2039 _ 48: 98
	mov	qword [rsp+30H], rax			; 203B _ 48: 89. 44 24, 30
	imul	rax, rax, 88				; 2040 _ 48: 6B. C0, 58
	lea	r15, [rdx+rax+60H]			; 2044 _ 4C: 8D. 7C 02, 60
	add	r15, rbx				; 2049 _ 49: 01. DF
?_277:	movzx	eax, byte [rbx+19H]			; 204C _ 0F B6. 43, 19
	cmp	r13d, eax				; 2050 _ 41: 39. C5
	jge	?_279					; 2053 _ 7D, 3C
	movsxd	rax, r13d				; 2055 _ 49: 63. C5
	mov	rcx, rdi				; 2058 _ 48: 89. F9
	movzx	edx, byte [r15+rax]			; 205B _ 41: 0F B6. 14 07
	mov	r8d, edx				; 2060 _ 41: 89. D0
	xor	edx, ebp				; 2063 _ 31. EA
	sar	edx, 3					; 2065 _ C1. FA, 03
	and	r8d, 07H				; 2068 _ 41: 83. E0, 07
	call	_Z10pos_piecesR8Position5Color9PieceType; 206C _ E8, 00000000(rel)
?_278:	lea	rcx, [rax-1H]				; 2071 _ 48: 8D. 48, FF
	movsxd	r8, r13d				; 2075 _ 4D: 63. C5
	inc	r13d					; 2078 _ 41: FF. C5
	bsf	rdx, rax				; 207B _ 48: 0F BC. D0
	xor	edx, r12d				; 207F _ 44: 31. E2
	and	rax, rcx				; 2082 _ 48: 21. C8
	mov	dword [rsp+r8*4+0C0H], edx		; 2085 _ 42: 89. 94 84, 000000C0
	jnz	?_278					; 208D _ 75, E2
	jmp	?_277					; 208F _ EB, BB

?_279:	imul	rax, qword [rsp+30H], 88		; 2091 _ 48: 6B. 44 24, 30, 58
	mov	r8, r14 				; 2097 _ 4D: 89. F0
	imul	rdx, rsi, 24				; 209A _ 48: 6B. D6, 18
	lea	rcx, [rdx+rax+30H]			; 209E _ 48: 8D. 4C 02, 30
	imul	rdx, rsi, 6				; 20A3 _ 48: 6B. D6, 06
	lea	r9, [rbx+rcx]				; 20A7 _ 4C: 8D. 0C 0B
	mov	rcx, rbx				; 20AB _ 48: 89. D9
	lea	rax, [rax+rdx+60H]			; 20AE _ 48: 8D. 44 10, 60
	lea	rdx, [rbx+rax+0CH]			; 20B3 _ 48: 8D. 54 03, 0C
	call	_ZL11encode_pawnP12TBEntry_pawnPhPiS2_	; 20B8 _ E8, FFFFE263
	imul	r13, qword [rsp+30H], 11		; 20BD _ 4C: 6B. 6C 24, 30, 0B
	lea	rdx, [rsi+r13+4H]			; 20C3 _ 4A: 8D. 54 2E, 04
	mov	rcx, qword [rbx+rdx*8]			; 20C8 _ 48: 8B. 0C D3
?_280:	mov	rdx, rax				; 20CC _ 48: 89. C2
	call	_Z16decompress_pairsILb1EEhP9PairsDatay ; 20CF _ E8, FFFFEA37
	movzx	eax, al 				; 20D4 _ 0F B6. C0
	lea	ebx, [rax-2H]				; 20D7 _ 8D. 58, FE
?_281:	mov	eax, ebx				; 20DA _ 89. D8
	add	rsp, 392				; 20DC _ 48: 81. C4, 00000188
	pop	rbx					; 20E3 _ 5B
	pop	rsi					; 20E4 _ 5E
	pop	rdi					; 20E5 _ 5F
	pop	rbp					; 20E6 _ 5D
	pop	r12					; 20E7 _ 41: 5C
	pop	r13					; 20E9 _ 41: 5D
	pop	r14					; 20EB _ 41: 5E
	pop	r15					; 20ED _ 41: 5F
	ret						; 20EF _ C3
; _ZN13TablebaseCore15probe_wdl_tableER8PositionPi End of function

_ZN13TablebaseCore15probe_dtz_tableER8PositioniPi:; Function begin
	push	r15					; 20F0 _ 41: 57
	push	r14					; 20F2 _ 41: 56
	push	r13					; 20F4 _ 41: 55
	push	r12					; 20F6 _ 41: 54
	push	rbp					; 20F8 _ 55
	push	rdi					; 20F9 _ 57
	push	rsi					; 20FA _ 56
	push	rbx					; 20FB _ 53
	sub	rsp, 248				; 20FC _ 48: 81. EC, 000000F8
	mov	rbx, rcx				; 2103 _ 48: 89. CB
	mov	dword [rsp+148H], edx			; 2106 _ 89. 94 24, 00000148
	mov	qword [rsp+150H], r8			; 210D _ 4C: 89. 84 24, 00000150
	call	_Z16pos_material_keyR8Position		; 2115 _ E8, 00000000(rel)
	cmp	qword [rel _ZL9DTZ_table], rax		; 211A _ 48: 39. 05, 000007C0(rel)
	mov	rbp, rax				; 2121 _ 48: 89. C5
	je	?_286					; 2124 _ 0F 84, 000000B3
	cmp	qword [rel ?_333], rax			; 212A _ 48: 39. 05, 000007C8(rel)
	je	?_286					; 2131 _ 0F 84, 000000A6
	lea	rdx, [rel _ZL9DTZ_table]		; 2137 _ 48: 8D. 15, 000007C0(rel)
	mov	eax, 1					; 213E _ B8, 00000001
	mov	r8, rdx 				; 2143 _ 49: 89. D0
?_282:	cmp	qword [rdx+18H], rbp			; 2146 _ 48: 39. 6A, 18
	jz	?_284					; 214A _ 74, 3B
	inc	eax					; 214C _ FF. C0
	add	rdx, 24 				; 214E _ 48: 83. C2, 18
	cmp	eax, 64 				; 2152 _ 83. F8, 40
	jnz	?_282					; 2155 _ 75, EF
	lea	r13, [rel _ZL7TB_hash]			; 2157 _ 4C: 8D. 2D, 00000DC0(rel)
	mov	rax, rbp				; 215E _ 48: 89. E8
	shr	rax, 54 				; 2161 _ 48: C1. E8, 36
	imul	rax, rax, 80				; 2165 _ 48: 6B. C0, 50
	add	rax, r13				; 2169 _ 4C: 01. E8
	lea	rdx, [rax+50H]				; 216C _ 48: 8D. 50, 50
?_283:	cmp	qword [rax], rbp			; 2170 _ 48: 39. 28
	je	?_305					; 2173 _ 0F 84, 000002FE
	add	rax, 16 				; 2179 _ 48: 83. C0, 10
	cmp	rax, rdx				; 217D _ 48: 39. D0
	jnz	?_283					; 2180 _ 75, EE
	jmp	?_304					; 2182 _ E9, 000002DD

?_284:	movsxd	rdx, eax				; 2187 _ 48: 63. D0
	imul	rdx, rdx, 24				; 218A _ 48: 6B. D2, 18
	add	rdx, r8 				; 218E _ 4C: 01. C2
	mov	r12, qword [rdx]			; 2191 _ 4C: 8B. 22
	mov	r11, qword [rdx+8H]			; 2194 _ 4C: 8B. 5A, 08
	mov	r10, qword [rdx+10H]			; 2198 _ 4C: 8B. 52, 10
	mov	edx, 6					; 219C _ BA, 00000006
?_285:	lea	r9d, [rax-1H]				; 21A1 _ 44: 8D. 48, FF
	cdqe						; 21A5 _ 48: 98
	mov	rcx, rdx				; 21A7 _ 48: 89. D1
	imul	rax, rax, 24				; 21AA _ 48: 6B. C0, 18
	movsxd	rsi, r9d				; 21AE _ 49: 63. F1
	imul	rsi, rsi, 24				; 21B1 _ 48: 6B. F6, 18
	add	rax, r8 				; 21B5 _ 4C: 01. C0
	add	rsi, r8 				; 21B8 _ 4C: 01. C6
	test	r9d, r9d				; 21BB _ 45: 85. C9
	mov	rdi, rax				; 21BE _ 48: 89. C7
	rep movsd					; 21C1 _ F3: A5
	mov	eax, r9d				; 21C3 _ 44: 89. C8
	jnz	?_285					; 21C6 _ 75, D9
	mov	qword [rel _ZL9DTZ_table], r12		; 21C8 _ 4C: 89. 25, 000007C0(rel)
	mov	qword [rel ?_333], r11			; 21CF _ 4C: 89. 1D, 000007C8(rel)
	mov	qword [rel ?_334], r10			; 21D6 _ 4C: 89. 15, 000007D0(rel)
?_286:	mov	rsi, qword [rel ?_334]			; 21DD _ 48: 8B. 35, 000007D0(rel)
	test	rsi, rsi				; 21E4 _ 48: 85. F6
	je	?_304					; 21E7 _ 0F 84, 00000277
	cmp	byte [rsi+1AH], 0			; 21ED _ 80. 7E, 1A, 00
	mov	rcx, rbx				; 21F1 _ 48: 89. D9
	jnz	?_288					; 21F4 _ 75, 34
	cmp	rbp, qword [rsi+8H]			; 21F6 _ 48: 3B. 6E, 08
	jz	?_287					; 21FA _ 74, 1A
	call	_Z16pos_side_to_moveR8Position		; 21FC _ E8, 00000000(rel)
	xor	r15d, r15d				; 2201 _ 45: 31. FF
	mov	edi, 8					; 2204 _ BF, 00000008
	mov	ebp, 56 				; 2209 _ BD, 00000038
	test	eax, eax				; 220E _ 85. C0
	sete	r15b					; 2210 _ 41: 0F 94. C7
	jmp	?_289					; 2214 _ EB, 38

?_287:	call	_Z16pos_side_to_moveR8Position		; 2216 _ E8, 00000000(rel)
	xor	r15d, r15d				; 221B _ 45: 31. FF
	test	eax, eax				; 221E _ 85. C0
	setne	r15b					; 2220 _ 41: 0F 95. C7
	xor	edi, edi				; 2224 _ 31. FF
	xor	ebp, ebp				; 2226 _ 31. ED
	jmp	?_289					; 2228 _ EB, 24

?_288:	call	_Z16pos_side_to_moveR8Position		; 222A _ E8, 00000000(rel)
	mov	rcx, rbx				; 222F _ 48: 89. D9
	cmp	eax, 1					; 2232 _ 83. F8, 01
	sbb	edi, edi				; 2235 _ 19. FF
	call	_Z16pos_side_to_moveR8Position		; 2237 _ E8, 00000000(rel)
	not	edi					; 223C _ F7. D7
	and	edi, 08H				; 223E _ 83. E7, 08
	cmp	eax, 1					; 2241 _ 83. F8, 01
	sbb	ebp, ebp				; 2244 _ 19. ED
	xor	r15d, r15d				; 2246 _ 45: 31. FF
	not	ebp					; 2249 _ F7. D5
	and	ebp, 38H				; 224B _ 83. E5, 38
?_289:	cmp	byte [rsi+1BH], 0			; 224E _ 80. 7E, 1B, 00
	jne	?_296					; 2252 _ 0F 85, 000000CC
	mov	al, byte [rsi+4CH]			; 2258 _ 8A. 46, 4C
	and	eax, 01H				; 225B _ 83. E0, 01
	cmp	eax, r15d				; 225E _ 44: 39. F8
	jz	?_292					; 2261 _ 74, 1B
	cmp	byte [rsi+1AH], 0			; 2263 _ 80. 7E, 1A, 00
	jnz	?_292					; 2267 _ 75, 15
?_290:	mov	rax, qword [rsp+150H]			; 2269 _ 48: 8B. 84 24, 00000150
	mov	dword [rax], -1 			; 2271 _ C7. 00, FFFFFFFF
?_291:	xor	eax, eax				; 2277 _ 31. C0
	jmp	?_332					; 2279 _ E9, 0000069B

?_292:	lea	r12, [rsi+40H]				; 227E _ 4C: 8D. 66, 40
	xor	ebp, ebp				; 2282 _ 31. ED
?_293:	movzx	eax, byte [rsi+19H]			; 2284 _ 0F B6. 46, 19
	cmp	ebp, eax				; 2288 _ 39. C5
	jge	?_295					; 228A _ 7D, 38
	movsxd	rax, ebp				; 228C _ 48: 63. C5
	mov	rcx, rbx				; 228F _ 48: 89. D9
	movzx	edx, byte [r12+rax]			; 2292 _ 41: 0F B6. 14 04
	mov	r8d, edx				; 2297 _ 41: 89. D0
	xor	edx, edi				; 229A _ 31. FA
	sar	edx, 3					; 229C _ C1. FA, 03
	and	r8d, 07H				; 229F _ 41: 83. E0, 07
	call	_Z10pos_piecesR8Position5Color9PieceType; 22A3 _ E8, 00000000(rel)
?_294:	lea	rdx, [rax-1H]				; 22A8 _ 48: 8D. 50, FF
	movsxd	rcx, ebp				; 22AC _ 48: 63. CD
	inc	ebp					; 22AF _ FF. C5
	bsf	r8, rax 				; 22B1 _ 4C: 0F BC. C0
	and	rax, rdx				; 22B5 _ 48: 21. D0
	mov	dword [rsp+rcx*4+90H], r8d		; 22B8 _ 44: 89. 84 8C, 00000090
	jnz	?_294					; 22C0 _ 75, E6
	jmp	?_293					; 22C2 _ EB, C0

?_295:	lea	r8, [rsp+90H]				; 22C4 _ 4C: 8D. 84 24, 00000090
	mov	rcx, rsi				; 22CC _ 48: 89. F1
	lea	rdx, [rsi+46H]				; 22CF _ 48: 8D. 56, 46
	lea	r9, [rsi+28H]				; 22D3 _ 4C: 8D. 4E, 28
	call	_ZL12encode_pieceP13TBEntry_piecePhPiS2_; 22D7 _ E8, FFFFDD24
	mov	rcx, qword [rsi+20H]			; 22DC _ 48: 8B. 4E, 20
	mov	rdx, rax				; 22E0 _ 48: 89. C2
	call	_Z16decompress_pairsILb1EEhP9PairsDatay ; 22E3 _ E8, FFFFE823
	mov	r8b, byte [rsi+4CH]			; 22E8 _ 44: 8A. 46, 4C
	movzx	edx, al 				; 22EC _ 0F B6. D0
	mov	eax, dword [rsp+148H]			; 22EF _ 8B. 84 24, 00000148
	test	r8b, 02H				; 22F6 _ 41: F6. C0, 02
	lea	ecx, [rax+2H]				; 22FA _ 8D. 48, 02
	je	?_302					; 22FD _ 0F 84, 00000139
	lea	r9, [rel _ZL10wdl_to_map]		; 2303 _ 4C: 8D. 0D, 00000850(rel)
	movsxd	rax, ecx				; 230A _ 48: 63. C1
	movsxd	rax, dword [r9+rax*4]			; 230D _ 49: 63. 04 81
	movzx	eax, word [rsi+rax*2+4EH]		; 2311 _ 0F B7. 44 46, 4E
	add	edx, eax				; 2316 _ 01. C2
	mov	rax, qword [rsi+58H]			; 2318 _ 48: 8B. 46, 58
	movsxd	rdx, edx				; 231C _ 48: 63. D2
	jmp	?_301					; 231F _ E9, 00000114

?_296:	movzx	r8d, byte [rsi+40H]			; 2324 _ 44: 0F B6. 46, 40
	lea	r13, [rsp+90H]				; 2329 _ 4C: 8D. AC 24, 00000090
	mov	rcx, rbx				; 2331 _ 48: 89. D9
	xor	r8d, edi				; 2334 _ 41: 31. F8
	mov	edx, r8d				; 2337 _ 44: 89. C2
	and	r8d, 07H				; 233A _ 41: 83. E0, 07
	sar	edx, 3					; 233E _ C1. FA, 03
	call	_Z10pos_piecesR8Position5Color9PieceType; 2341 _ E8, 00000000(rel)
	xor	edx, edx				; 2346 _ 31. D2
?_297:	bsf	rcx, rax				; 2348 _ 48: 0F BC. C8
	lea	r8, [rax-1H]				; 234C _ 4C: 8D. 40, FF
	xor	ecx, ebp				; 2350 _ 31. E9
	lea	r14d, [rdx+1H]				; 2352 _ 44: 8D. 72, 01
	mov	dword [r13+rdx*4], ecx			; 2356 _ 41: 89. 4C 95, 00
	inc	rdx					; 235B _ 48: FF. C2
	and	rax, r8 				; 235E _ 4C: 21. C0
	jnz	?_297					; 2361 _ 75, E5
	lea	rcx, [rsi+1CH]				; 2363 _ 48: 8D. 4E, 1C
	mov	rdx, r13				; 2367 _ 4C: 89. EA
	call	_ZL9pawn_fileP12TBEntry_pawnPi.isra.0	; 236A _ E8, FFFFE926
	movsxd	r12, eax				; 236F _ 4C: 63. E0
	mov	al, byte [rsi+r12+0E0H] 		; 2372 _ 42: 8A. 84 26, 000000E0
	and	eax, 01H				; 237A _ 83. E0, 01
	cmp	eax, r15d				; 237D _ 44: 39. F8
	jne	?_290					; 2380 _ 0F 85, FFFFFEE3
	imul	rax, r12, 48				; 2386 _ 49: 6B. C4, 30
	lea	r15, [rsi+rax+40H]			; 238A _ 4C: 8D. 7C 06, 40
?_298:	movzx	eax, byte [rsi+19H]			; 238F _ 0F B6. 46, 19
	cmp	r14d, eax				; 2393 _ 41: 39. C6
	jge	?_300					; 2396 _ 7D, 3B
	movsxd	rax, r14d				; 2398 _ 49: 63. C6
	mov	rcx, rbx				; 239B _ 48: 89. D9
	movzx	edx, byte [r15+rax]			; 239E _ 41: 0F B6. 14 07
	mov	r8d, edx				; 23A3 _ 41: 89. D0
	xor	edx, edi				; 23A6 _ 31. FA
	sar	edx, 3					; 23A8 _ C1. FA, 03
	and	r8d, 07H				; 23AB _ 41: 83. E0, 07
	call	_Z10pos_piecesR8Position5Color9PieceType; 23AF _ E8, 00000000(rel)
?_299:	lea	rcx, [rax-1H]				; 23B4 _ 48: 8D. 48, FF
	movsxd	r8, r14d				; 23B8 _ 4D: 63. C6
	inc	r14d					; 23BB _ 41: FF. C6
	bsf	rdx, rax				; 23BE _ 48: 0F BC. D0
	xor	edx, ebp				; 23C2 _ 31. EA
	and	rax, rcx				; 23C4 _ 48: 21. C8
	mov	dword [rsp+r8*4+90H], edx		; 23C7 _ 42: 89. 94 84, 00000090
	jnz	?_299					; 23CF _ 75, E3
	jmp	?_298					; 23D1 _ EB, BC

?_300:	imul	rbx, r12, 48				; 23D3 _ 49: 6B. DC, 30
	mov	r8, r13 				; 23D7 _ 4D: 89. E8
	mov	rcx, rsi				; 23DA _ 48: 89. F1
	lea	rdx, [rsi+rbx+46H]			; 23DD _ 48: 8D. 54 1E, 46
	lea	r9, [rsi+rbx+28H]			; 23E2 _ 4C: 8D. 4C 1E, 28
	call	_ZL11encode_pawnP12TBEntry_pawnPhPiS2_	; 23E7 _ E8, FFFFDF34
	mov	rcx, qword [rsi+rbx+20H]		; 23EC _ 48: 8B. 4C 1E, 20
	mov	rdx, rax				; 23F1 _ 48: 89. C2
	call	_Z16decompress_pairsILb1EEhP9PairsDatay ; 23F4 _ E8, FFFFE712
	mov	r8b, byte [rsi+r12+0E0H]		; 23F9 _ 46: 8A. 84 26, 000000E0
	movzx	edx, al 				; 2401 _ 0F B6. D0
	mov	eax, dword [rsp+148H]			; 2404 _ 8B. 84 24, 00000148
	test	r8b, 02H				; 240B _ 41: F6. C0, 02
	lea	ecx, [rax+2H]				; 240F _ 8D. 48, 02
	jz	?_302					; 2412 _ 74, 28
	lea	r9, [rel _ZL10wdl_to_map]		; 2414 _ 4C: 8D. 0D, 00000850(rel)
	movsxd	rax, ecx				; 241B _ 48: 63. C1
	movsxd	rax, dword [r9+rax*4]			; 241E _ 49: 63. 04 81
	lea	rax, [rax+r12*4+70H]			; 2422 _ 4A: 8D. 44 A0, 70
	movzx	eax, word [rsi+rax*2+4H]		; 2427 _ 0F B7. 44 46, 04
	add	edx, eax				; 242C _ 01. C2
	mov	rax, qword [rsi+108H]			; 242E _ 48: 8B. 86, 00000108
	movsxd	rdx, edx				; 2435 _ 48: 63. D2
?_301:	movzx	edx, byte [rax+rdx]			; 2438 _ 0F B6. 14 10
?_302:	lea	rax, [rel _ZL8pa_flags] 		; 243C _ 48: 8D. 05, 00000840(rel)
	movsxd	rcx, ecx				; 2443 _ 48: 63. C9
	test	byte [rax+rcx], r8b			; 2446 _ 44: 84. 04 08
	jz	?_303					; 244A _ 74, 10
	test	byte [rsp+148H], 01H			; 244C _ F6. 84 24, 00000148, 01
	mov	eax, edx				; 2454 _ 89. D0
	je	?_332					; 2456 _ 0F 84, 000004BD
?_303:	lea	eax, [rdx+rdx]				; 245C _ 8D. 04 12
	jmp	?_332					; 245F _ E9, 000004B5

?_304:	mov	rax, qword [rsp+150H]			; 2464 _ 48: 8B. 84 24, 00000150
	mov	dword [rax], 0				; 246C _ C7. 00, 00000000
	jmp	?_291					; 2472 _ E9, FFFFFE00

?_305:	mov	rax, qword [rax+8H]			; 2477 _ 48: 8B. 40, 08
	lea	r14, [rsp+60H]				; 247B _ 4C: 8D. 74 24, 60
	mov	rcx, rbx				; 2480 _ 48: 89. D9
	mov	rdx, r14				; 2483 _ 4C: 89. F2
	cmp	qword [rax+8H], rbp			; 2486 _ 48: 39. 68, 08
	setne	r12b					; 248A _ 41: 0F 95. C4
	movzx	r15d, r12b				; 248E _ 45: 0F B6. FC
	mov	r8d, r15d				; 2492 _ 45: 89. F8
	call	_Z7prt_strR8PositionPci 		; 2495 _ E8, 00000000(rel)
	mov	rcx, qword [rel ?_337]			; 249A _ 48: 8B. 0D, 00000DB8(rel)
	test	rcx, rcx				; 24A1 _ 48: 85. C9
	jz	?_306					; 24A4 _ 74, 05
	call	_ZL14free_dtz_entryP7TBEntry		; 24A6 _ E8, FFFFEB4F
?_306:	lea	r9, [rel ?_336] 			; 24AB _ 4C: 8D. 0D, 00000DA8(rel)
	xor	eax, eax				; 24B2 _ 31. C0
	mov	edx, 6					; 24B4 _ BA, 00000006
	lea	r8, [rel ?_335] 			; 24B9 _ 4C: 8D. 05, 00000D90(rel)
?_307:	lea	rdi, [r9+rax]				; 24C0 _ 49: 8D. 3C 01
	mov	rcx, rdx				; 24C4 _ 48: 89. D1
	lea	rsi, [r8+rax]				; 24C7 _ 49: 8D. 34 00
	sub	rax, 24 				; 24CB _ 48: 83. E8, 18
	rep movsd					; 24CF _ F3: A5
	cmp	rax, -1512				; 24D1 _ 48: 3D, FFFFFA18
	jnz	?_307					; 24D7 _ 75, E7
	xor	r12d, 01H				; 24D9 _ 41: 83. F4, 01
	mov	rcx, rbx				; 24DD _ 48: 89. D9
	movzx	edx, r12b				; 24E0 _ 41: 0F B6. D4
	call	_Z8calc_keyR8Positioni			; 24E4 _ E8, 00000000(rel)
	mov	edx, r15d				; 24E9 _ 44: 89. FA
	mov	rcx, rbx				; 24EC _ 48: 89. D9
	mov	rsi, rax				; 24EF _ 48: 89. C6
	call	_Z8calc_keyR8Positioni			; 24F2 _ E8, 00000000(rel)
	mov	qword [rel ?_333], rsi			; 24F7 _ 48: 89. 35, 000007C8(rel)
	mov	rdx, rax				; 24FE _ 48: 89. C2
	mov	rcx, rax				; 2501 _ 48: 89. C1
	mov	qword [rel _ZL9DTZ_table], rax		; 2504 _ 48: 89. 05, 000007C0(rel)
	mov	qword [rel ?_334], 0			; 250B _ 48: C7. 05, 000007CC(rel), 00000000
	shr	rdx, 54 				; 2516 _ 48: C1. EA, 36
	imul	rdx, rdx, 80				; 251A _ 48: 6B. D2, 50
	add	r13, rdx				; 251E _ 49: 01. D5
	lea	rax, [r13+50H]				; 2521 _ 49: 8D. 45, 50
?_308:	cmp	qword [r13], rcx			; 2525 _ 49: 39. 4D, 00
	jz	?_309					; 2529 _ 74, 0E
	add	r13, 16 				; 252B _ 49: 83. C5, 10
	cmp	r13, rax				; 252F _ 49: 39. C5
	jnz	?_308					; 2532 _ 75, F1
	jmp	?_286					; 2534 _ E9, FFFFFCA4

?_309:	mov	rsi, qword [r13+8H]			; 2539 _ 49: 8B. 75, 08
	cmp	byte [rsi+1BH], 1			; 253D _ 80. 7E, 1B, 01
	sbb	rcx, rcx				; 2541 _ 48: 19. C9
	and	cl, 50H 				; 2544 _ 80. E1, 50
	add	rcx, 272				; 2547 _ 48: 81. C1, 00000110
	call	malloc					; 254E _ E8, 00000000(rel)
	lea	rdx, [rel ?_349]			; 2553 _ 48: 8D. 15, 000000EE(rel)
	mov	rcx, r14				; 255A _ 4C: 89. F1
	lea	r8, [rax+10H]				; 255D _ 4C: 8D. 40, 10
	mov	r12, rax				; 2561 _ 49: 89. C4
	call	_ZL8map_filePKcS0_Py			; 2564 _ E8, FFFFE4D5
	mov	rdx, qword [rsi+8H]			; 2569 _ 48: 8B. 56, 08
	mov	qword [r12], rax			; 256D _ 49: 89. 04 24
	mov	qword [r12+8H], rdx			; 2571 _ 49: 89. 54 24, 08
	mov	dl, byte [rsi+19H]			; 2576 _ 8A. 56, 19
	mov	byte [r12+19H], dl			; 2579 _ 41: 88. 54 24, 19
	mov	dl, byte [rsi+1AH]			; 257E _ 8A. 56, 1A
	mov	byte [r12+1AH], dl			; 2581 _ 41: 88. 54 24, 1A
	mov	dl, byte [rsi+1BH]			; 2586 _ 8A. 56, 1B
	test	dl, dl					; 2589 _ 84. D2
	mov	byte [r12+1BH], dl			; 258B _ 41: 88. 54 24, 1B
	jz	?_310					; 2590 _ 74, 12
	mov	dl, byte [rsi+1CH]			; 2592 _ 8A. 56, 1C
	mov	byte [r12+1CH], dl			; 2595 _ 41: 88. 54 24, 1C
	mov	dl, byte [rsi+1DH]			; 259A _ 8A. 56, 1D
	mov	byte [r12+1DH], dl			; 259D _ 41: 88. 54 24, 1D
	jmp	?_311					; 25A2 _ EB, 08

?_310:	mov	dl, byte [rsi+1CH]			; 25A4 _ 8A. 56, 1C
	mov	byte [r12+1CH], dl			; 25A7 _ 41: 88. 54 24, 1C
?_311:	test	rax, rax				; 25AC _ 48: 85. C0
	je	?_330					; 25AF _ 0F 84, 0000034B
	cmp	byte [rax], -41 			; 25B5 _ 80. 38, D7
	jnz	?_312					; 25B8 _ 75, 12
	cmp	byte [rax+1H], 102			; 25BA _ 80. 78, 01, 66
	jnz	?_312					; 25BE _ 75, 0C
	cmp	byte [rax+2H], 12			; 25C0 _ 80. 78, 02, 0C
	jnz	?_312					; 25C4 _ 75, 06
	cmp	byte [rax+3H], -91			; 25C6 _ 80. 78, 03, A5
	jz	?_313					; 25CA _ 74, 11
?_312:	lea	rcx, [rel ?_348]			; 25CC _ 48: 8D. 0D, 000000DD(rel)
	call	puts					; 25D3 _ E8, 00000000(rel)
	jmp	?_330					; 25D8 _ E9, 00000323

?_313:	mov	dl, byte [rax+4H]			; 25DD _ 8A. 50, 04
	lea	rsi, [rax+5H]				; 25E0 _ 48: 8D. 70, 05
	and	edx, 02H				; 25E4 _ 83. E2, 02
	cmp	dl, 1					; 25E7 _ 80. FA, 01
	sbb	r13d, r13d				; 25EA _ 45: 19. ED
	and	r13d, 0FFFFFFFDH			; 25ED _ 41: 83. E5, FD
	add	r13d, 4 				; 25F1 _ 41: 83. C5, 04
	cmp	byte [r12+1BH], 0			; 25F5 _ 41: 80. 7C 24, 1B, 00
	jne	?_318					; 25FB _ 0F 85, 0000010A
	movzx	r8d, byte [r12+19H]			; 2601 _ 45: 0F B6. 44 24, 19
	xor	edx, edx				; 2607 _ 31. D2
?_314:	cmp	r8d, edx				; 2609 _ 41: 39. D0
	jle	?_315					; 260C _ 7E, 11
	mov	cl, byte [rax+rdx+6H]			; 260E _ 8A. 4C 10, 06
	and	ecx, 0FH				; 2612 _ 83. E1, 0F
	mov	byte [r12+rdx+40H], cl			; 2615 _ 41: 88. 4C 14, 40
	inc	rdx					; 261A _ 48: FF. C2
	jmp	?_314					; 261D _ EB, EA

?_315:	lea	r9, [r12+46H]				; 261F _ 4D: 8D. 4C 24, 46
	mov	dil, byte [rax+5H]			; 2624 _ 40: 8A. 78, 05
	mov	rcx, r12				; 2628 _ 4C: 89. E1
	lea	r8, [r12+40H]				; 262B _ 4D: 8D. 44 24, 40
	mov	rdx, r9 				; 2630 _ 4C: 89. CA
	mov	qword [rsp+38H], r9			; 2633 _ 4C: 89. 4C 24, 38
	call	_ZL14set_norm_pieceP13TBEntry_piecePhS1_; 2638 _ E8, FFFFDF4C
	movzx	eax, byte [r12+1CH]			; 263D _ 41: 0F B6. 44 24, 1C
	lea	rcx, [r12+28H]				; 2643 _ 49: 8D. 4C 24, 28
	movzx	edx, byte [r12+19H]			; 2648 _ 41: 0F B6. 54 24, 19
	mov	r9, qword [rsp+38H]			; 264E _ 4C: 8B. 4C 24, 38
	and	edi, 0FH				; 2653 _ 83. E7, 0F
	mov	r8d, edi				; 2656 _ 41: 89. F8
	mov	dword [rsp+20H], eax			; 2659 _ 89. 44 24, 20
	call	_ZL18calc_factors_piecePiiiPhh		; 265D _ E8, FFFFE902
	movzx	edx, byte [r12+19H]			; 2662 _ 41: 0F B6. 54 24, 19
	lea	r9, [rsp+58H]				; 2668 _ 4C: 8D. 4C 24, 58
	mov	dword [rsp+28H], 0			; 266D _ C7. 44 24, 28, 00000000
	lea	r8, [rsi+rdx+1H]			; 2675 _ 4C: 8D. 44 16, 01
	lea	rdx, [r12+4CH]				; 267A _ 49: 8D. 54 24, 4C
	mov	rcx, r8 				; 267F _ 4C: 89. C1
	and	ecx, 01H				; 2682 _ 83. E1, 01
	mov	qword [rsp+20H], rdx			; 2685 _ 48: 89. 54 24, 20
	mov	rdx, rax				; 268A _ 48: 89. C2
	add	rcx, r8 				; 268D _ 4C: 01. C1
	lea	r8, [rsp+90H]				; 2690 _ 4C: 8D. 84 24, 00000090
	call	_ZL11setup_pairsPhyPyPS_S_i		; 2698 _ E8, FFFFE078
	mov	rdx, qword [rsp+58H]			; 269D _ 48: 8B. 54 24, 58
	test	byte [r12+4CH], 02H			; 26A2 _ 41: F6. 44 24, 4C, 02
	mov	qword [r12+20H], rax			; 26A8 _ 49: 89. 44 24, 20
	mov	qword [r12+58H], rdx			; 26AD _ 49: 89. 54 24, 58
	jz	?_317					; 26B2 _ 74, 2F
	mov	rcx, rdx				; 26B4 _ 48: 89. D1
	xor	r8d, r8d				; 26B7 _ 45: 31. C0
?_316:	lea	r9, [rcx+1H]				; 26BA _ 4C: 8D. 49, 01
	sub	r9, rdx 				; 26BE _ 49: 29. D1
	mov	word [r12+r8+4EH], r9w			; 26C1 _ 66 47: 89. 4C 04, 4E
	movzx	r9d, byte [rcx] 			; 26C7 _ 44: 0F B6. 09
	add	r8, 2					; 26CB _ 49: 83. C0, 02
	cmp	r8, 8					; 26CF _ 49: 83. F8, 08
	lea	rcx, [rcx+r9+1H]			; 26D3 _ 4A: 8D. 4C 09, 01
	jnz	?_316					; 26D8 _ 75, E0
	mov	rdx, rcx				; 26DA _ 48: 89. CA
	and	edx, 01H				; 26DD _ 83. E2, 01
	add	rdx, rcx				; 26E0 _ 48: 01. CA
?_317:	mov	qword [rax], rdx			; 26E3 _ 48: 89. 10
	add	rdx, qword [rsp+90H]			; 26E6 _ 48: 03. 94 24, 00000090
	mov	qword [rax+8H], rdx			; 26EE _ 48: 89. 50, 08
	add	rdx, qword [rsp+98H]			; 26F2 _ 48: 03. 94 24, 00000098
	add	rdx, 63 				; 26FA _ 48: 83. C2, 3F
	and	rdx, 0FFFFFFFFFFFFFFC0H 		; 26FE _ 48: 83. E2, C0
	mov	qword [rax+10H], rdx			; 2702 _ 48: 89. 50, 10
	jmp	?_331					; 2706 _ E9, 00000202

?_318:	cmp	byte [r12+1DH], 1			; 270B _ 41: 80. 7C 24, 1D, 01
	lea	rdi, [r12+46H]				; 2711 _ 49: 8D. 7C 24, 46
	lea	r10, [rsp+70H]				; 2716 _ 4C: 8D. 54 24, 70
	sbb	r11d, r11d				; 271B _ 45: 19. DB
	xor	r14d, r14d				; 271E _ 45: 31. F6
	add	r11d, 2 				; 2721 _ 41: 83. C3, 02
?_319:	mov	cl, byte [r12+1DH]			; 2725 _ 41: 8A. 4C 24, 1D
	mov	dword [rsp+38H], r14d			; 272A _ 44: 89. 74 24, 38
	mov	r9d, 15 				; 272F _ 41: B9, 0000000F
	mov	r15b, byte [rsi]			; 2735 _ 44: 8A. 3E
	cmp	cl, 1					; 2738 _ 80. F9, 01
	sbb	edx, edx				; 273B _ 19. D2
	and	r15d, 0FH				; 273D _ 41: 83. E7, 0F
	add	edx, 2					; 2741 _ 83. C2, 02
	test	cl, cl					; 2744 _ 84. C9
	jz	?_320					; 2746 _ 74, 08
	mov	r9b, byte [rsi+1H]			; 2748 _ 44: 8A. 4E, 01
	and	r9d, 0FH				; 274C _ 41: 83. E1, 0F
?_320:	movzx	eax, byte [r12+19H]			; 2750 _ 41: 0F B6. 44 24, 19
	movsxd	rdx, edx				; 2756 _ 48: 63. D2
	xor	ecx, ecx				; 2759 _ 31. C9
	add	rdx, rsi				; 275B _ 48: 01. F2
?_321:	cmp	eax, ecx				; 275E _ 39. C8
	jle	?_322					; 2760 _ 7E, 12
	mov	r8b, byte [rdx+rcx]			; 2762 _ 44: 8A. 04 0A
	inc	rcx					; 2766 _ 48: FF. C1
	and	r8d, 0FH				; 2769 _ 41: 83. E0, 0F
	mov	byte [rcx+rdi-7H], r8b			; 276D _ 44: 88. 44 39, F9
	jmp	?_321					; 2772 _ EB, EA

?_322:	lea	r8, [rdi-6H]				; 2774 _ 4C: 8D. 47, FA
	mov	rdx, rdi				; 2778 _ 48: 89. FA
	mov	rcx, r12				; 277B _ 4C: 89. E1
	mov	qword [rsp+48H], r10			; 277E _ 4C: 89. 54 24, 48
	mov	dword [rsp+40H], r11d			; 2783 _ 44: 89. 5C 24, 40
	mov	dword [rsp+44H], r9d			; 2788 _ 44: 89. 4C 24, 44
	call	_ZL13set_norm_pawnP12TBEntry_pawnPhS1_	; 278D _ E8, FFFFDE6D
	mov	eax, dword [rsp+38H]			; 2792 _ 8B. 44 24, 38
	lea	rcx, [rdi-1EH]				; 2796 _ 48: 8D. 4F, E2
	mov	r8d, r15d				; 279A _ 45: 89. F8
	movzx	edx, byte [r12+19H]			; 279D _ 41: 0F B6. 54 24, 19
	mov	qword [rsp+20H], rdi			; 27A3 _ 48: 89. 7C 24, 20
	add	rdi, 48 				; 27A8 _ 48: 83. C7, 30
	mov	r9d, dword [rsp+44H]			; 27AC _ 44: 8B. 4C 24, 44
	mov	dword [rsp+28H], eax			; 27B1 _ 89. 44 24, 28
	call	_ZL17calc_factors_pawnPiiiiPhi		; 27B5 _ E8, FFFFE89C
	mov	r10, qword [rsp+48H]			; 27BA _ 4C: 8B. 54 24, 48
	mov	r11d, dword [rsp+40H]			; 27BF _ 44: 8B. 5C 24, 40
	mov	qword [r10+r14*8], rax			; 27C4 _ 4B: 89. 04 F2
	movzx	eax, byte [r12+19H]			; 27C8 _ 41: 0F B6. 44 24, 19
	inc	r14					; 27CE _ 49: FF. C6
	add	eax, r11d				; 27D1 _ 44: 01. D8
	cdqe						; 27D4 _ 48: 98
	add	rsi, rax				; 27D6 _ 48: 01. C6
	cmp	r14, 4					; 27D9 _ 49: 83. FE, 04
	jne	?_319					; 27DD _ 0F 85, FFFFFF42
	lea	rdi, [rsp+90H]				; 27E3 _ 48: 8D. BC 24, 00000090
	mov	rcx, rsi				; 27EB _ 48: 89. F1
	lea	r15, [rsp+58H]				; 27EE _ 4C: 8D. 7C 24, 58
	and	ecx, 01H				; 27F3 _ 83. E1, 01
	mov	r14, rdi				; 27F6 _ 49: 89. FE
	add	rcx, rsi				; 27F9 _ 48: 01. F1
	xor	esi, esi				; 27FC _ 31. F6
?_323:	mov	rdx, qword [r10+rsi*8]			; 27FE _ 49: 8B. 14 F2
	mov	r8, rdi 				; 2802 _ 49: 89. F8
	mov	r9, r15 				; 2805 _ 4D: 89. F9
	mov	qword [rsp+38H], r10			; 2808 _ 4C: 89. 54 24, 38
	lea	rax, [r12+rsi+0E0H]			; 280D _ 49: 8D. 84 34, 000000E0
	mov	dword [rsp+28H], 0			; 2815 _ C7. 44 24, 28, 00000000
	add	rdi, 24 				; 281D _ 48: 83. C7, 18
	mov	qword [rsp+20H], rax			; 2821 _ 48: 89. 44 24, 20
	call	_ZL11setup_pairsPhyPyPS_S_i		; 2826 _ E8, FFFFDEEA
	imul	rdx, rsi, 48				; 282B _ 48: 6B. D6, 30
	inc	rsi					; 282F _ 48: FF. C6
	mov	rcx, qword [rsp+58H]			; 2832 _ 48: 8B. 4C 24, 58
	cmp	r13d, esi				; 2837 _ 41: 39. F5
	mov	r10, qword [rsp+38H]			; 283A _ 4C: 8B. 54 24, 38
	mov	qword [r12+rdx+20H], rax		; 283F _ 49: 89. 44 14, 20
	jg	?_323					; 2844 _ 7F, B8
	mov	r10, rcx				; 2846 _ 49: 89. CA
	mov	qword [r12+108H], rcx			; 2849 _ 49: 89. 8C 24, 00000108
	mov	r8, r12 				; 2851 _ 4D: 89. E0
	xor	eax, eax				; 2854 _ 31. C0
?_324:	test	byte [r12+rax+0E0H], 02H		; 2856 _ 41: F6. 84 04, 000000E0, 02
	jz	?_326					; 285F _ 74, 25
	xor	edx, edx				; 2861 _ 31. D2
?_325:	lea	r9, [rcx+1H]				; 2863 _ 4C: 8D. 49, 01
	sub	r9, r10 				; 2867 _ 4D: 29. D1
	mov	word [r8+rdx+0E4H], r9w 		; 286A _ 66 45: 89. 8C 10, 000000E4
	movzx	r9d, byte [rcx] 			; 2873 _ 44: 0F B6. 09
	add	rdx, 2					; 2877 _ 48: 83. C2, 02
	cmp	rdx, 8					; 287B _ 48: 83. FA, 08
	lea	rcx, [rcx+r9+1H]			; 287F _ 4A: 8D. 4C 09, 01
	jnz	?_325					; 2884 _ 75, DD
?_326:	inc	rax					; 2886 _ 48: FF. C0
	add	r8, 8					; 2889 _ 49: 83. C0, 08
	cmp	r13d, eax				; 288D _ 41: 39. C5
	jg	?_324					; 2890 _ 7F, C4
	mov	rsi, rcx				; 2892 _ 48: 89. CE
	xor	eax, eax				; 2895 _ 31. C0
	xor	edx, edx				; 2897 _ 31. D2
	and	esi, 01H				; 2899 _ 83. E6, 01
	add	rcx, rsi				; 289C _ 48: 01. F1
?_327:	mov	r8, qword [r12+rax*2+20H]		; 289F _ 4D: 8B. 44 44, 20
	inc	edx					; 28A4 _ FF. C2
	mov	qword [r8], rcx 			; 28A6 _ 49: 89. 08
	add	rcx, qword [r14+rax]			; 28A9 _ 49: 03. 0C 06
	add	rax, 24 				; 28AD _ 48: 83. C0, 18
	cmp	edx, r13d				; 28B1 _ 44: 39. EA
	jnz	?_327					; 28B4 _ 75, E9
	lea	r8, [r14+8H]				; 28B6 _ 4D: 8D. 46, 08
	xor	eax, eax				; 28BA _ 31. C0
	xor	edx, edx				; 28BC _ 31. D2
?_328:	mov	r9, qword [r12+rax*2+20H]		; 28BE _ 4D: 8B. 4C 44, 20
	inc	edx					; 28C3 _ FF. C2
	mov	qword [r9+8H], rcx			; 28C5 _ 49: 89. 49, 08
	add	rcx, qword [r8+rax]			; 28C9 _ 49: 03. 0C 00
	add	rax, 24 				; 28CD _ 48: 83. C0, 18
	cmp	edx, r13d				; 28D1 _ 44: 39. EA
	jnz	?_328					; 28D4 _ 75, E8
	xor	eax, eax				; 28D6 _ 31. C0
	xor	edx, edx				; 28D8 _ 31. D2
	add	r14, 16 				; 28DA _ 49: 83. C6, 10
?_329:	mov	r8, qword [r12+rax*2+20H]		; 28DE _ 4D: 8B. 44 44, 20
	add	rcx, 63 				; 28E3 _ 48: 83. C1, 3F
	inc	edx					; 28E7 _ FF. C2
	and	rcx, 0FFFFFFFFFFFFFFC0H 		; 28E9 _ 48: 83. E1, C0
	mov	qword [r8+10H], rcx			; 28ED _ 49: 89. 48, 10
	add	rcx, qword [r14+rax]			; 28F1 _ 49: 03. 0C 06
	add	rax, 24 				; 28F5 _ 48: 83. C0, 18
	cmp	edx, r13d				; 28F9 _ 44: 39. EA
	jnz	?_329					; 28FC _ 75, E0
	jmp	?_331					; 28FE _ EB, 0D

?_330:	mov	rcx, r12				; 2900 _ 4C: 89. E1
	call	free					; 2903 _ E8, 00000000(rel)
	jmp	?_286					; 2908 _ E9, FFFFF8D0

?_331:	mov	qword [rel ?_334], r12			; 290D _ 4C: 89. 25, 000007D0(rel)
	jmp	?_286					; 2914 _ E9, FFFFF8C4
; _ZN13TablebaseCore15probe_dtz_tableER8PositioniPi End of function

?_332:	; Local function
	add	rsp, 248				; 2919 _ 48: 81. C4, 000000F8
	pop	rbx					; 2920 _ 5B
	pop	rsi					; 2921 _ 5E
	pop	rdi					; 2922 _ 5F
	pop	rbp					; 2923 _ 5D
	pop	r12					; 2924 _ 41: 5C
	pop	r13					; 2926 _ 41: 5D
	pop	r14					; 2928 _ 41: 5E
	pop	r15					; 292A _ 41: 5F
	ret						; 292C _ C3

