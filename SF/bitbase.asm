; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\bitbase.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: BMI etc., x64

default rel

global _ZN8Bitbases5probeE6SquareS0_S0_5Color: function
global _ZN8Bitbases4initEv: function
global .refptr.SquareBB
global .refptr.StepAttacksBB
global .refptr.SquareDistance

extern SquareDistance                                   ; byte
extern StepAttacksBB                                    ; byte
extern SquareBB                                         ; byte
extern _ZdlPv                                           ; near
extern _Znwy                                            ; near


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_ZN8Bitbases5probeE6SquareS0_S0_5Color:
        shl     r8d, 6                                  ; 0000 _ 41: C1. E0, 06
        mov     eax, edx                                ; 0004 _ 89. D0
        shr     rdx, 3                                  ; 0006 _ 48: C1. EA, 03
        and     eax, 07H                                ; 000A _ 83. E0, 07
        shl     r9d, 12                                 ; 000D _ 41: C1. E1, 0C
        shl     eax, 13                                 ; 0011 _ C1. E0, 0D
        or      ecx, eax                                ; 0014 _ 09. C1
        or      ecx, r8d                                ; 0016 _ 44: 09. C1
        mov     r8d, 6                                  ; 0019 _ 41: B8, 00000006
        sub     r8d, edx                                ; 001F _ 41: 29. D0
        lea     rdx, [rel _ZN12_GLOBAL__N_110KPKBitbaseE]; 0022 _ 48: 8D. 15, 00000000(rel)
        shl     r8d, 15                                 ; 0029 _ 41: C1. E0, 0F
        or      ecx, r8d                                ; 002D _ 44: 09. C1
        or      ecx, r9d                                ; 0030 _ 44: 09. C9
        mov     r9d, 1                                  ; 0033 _ 41: B9, 00000001
        shl     r9d, cl                                 ; 0039 _ 41: D3. E1
        shr     ecx, 5                                  ; 003C _ C1. E9, 05
        test    dword [rdx+rcx*4], r9d                  ; 003F _ 44: 85. 0C 8A
        setne   al                                      ; 0043 _ 0F 95. C0
        ret                                             ; 0046 _ C3

        nop                                             ; 0047 _ 90
        nop                                             ; 0048 _ 90
        nop                                             ; 0049 _ 90
        nop                                             ; 004A _ 90
        nop                                             ; 004B _ 90
        nop                                             ; 004C _ 90
        nop                                             ; 004D _ 90
        nop                                             ; 004E _ 90
        nop                                             ; 004F _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=64 noexecute                      ; section number 3, bss

_ZN12_GLOBAL__N_110KPKBitbaseE:                         ; byte
        resb    24576                                   ; 0000


SECTION .text.unlikely align=16 execute                 ; section number 4, code


SECTION .text.hot align=16 execute                      ; section number 5, code

.text.hot:; Local function

_ZN8Bitbases4initEv:
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 56                                 ; 000C _ 48: 83. EC, 38
        mov     ecx, 7864320                            ; 0010 _ B9, 00780000
        call    _Znwy                                   ; 0015 _ E8, 00000000(rel)
        lea     r8, [rax+780000H]                       ; 001A _ 4C: 8D. 80, 00780000
        mov     rdx, rax                                ; 0021 _ 48: 89. C2
?_001:  mov     dword [rdx], 0                          ; 0024 _ C7. 02, 00000000
        add     rdx, 320                                ; 002A _ 48: 81. C2, 00000140
        mov     qword [rdx-138H], 0                     ; 0031 _ 48: C7. 82, FFFFFEC8, 00000000
        mov     qword [rdx-130H], 0                     ; 003C _ 48: C7. 82, FFFFFED0, 00000000
        mov     qword [rdx-128H], 0                     ; 0047 _ 48: C7. 82, FFFFFED8, 00000000
        mov     dword [rdx-120H], 0                     ; 0052 _ C7. 82, FFFFFEE0, 00000000
        mov     dword [rdx-118H], 0                     ; 005C _ C7. 82, FFFFFEE8, 00000000
        mov     qword [rdx-110H], 0                     ; 0066 _ 48: C7. 82, FFFFFEF0, 00000000
        mov     qword [rdx-108H], 0                     ; 0071 _ 48: C7. 82, FFFFFEF8, 00000000
        mov     qword [rdx-100H], 0                     ; 007C _ 48: C7. 82, FFFFFF00, 00000000
        mov     dword [rdx-0F8H], 0                     ; 0087 _ C7. 82, FFFFFF08, 00000000
        mov     dword [rdx-0F0H], 0                     ; 0091 _ C7. 82, FFFFFF10, 00000000
        mov     qword [rdx-0E8H], 0                     ; 009B _ 48: C7. 82, FFFFFF18, 00000000
        mov     qword [rdx-0E0H], 0                     ; 00A6 _ 48: C7. 82, FFFFFF20, 00000000
        mov     qword [rdx-0D8H], 0                     ; 00B1 _ 48: C7. 82, FFFFFF28, 00000000
        mov     dword [rdx-0D0H], 0                     ; 00BC _ C7. 82, FFFFFF30, 00000000
        mov     dword [rdx-0C8H], 0                     ; 00C6 _ C7. 82, FFFFFF38, 00000000
        mov     qword [rdx-0C0H], 0                     ; 00D0 _ 48: C7. 82, FFFFFF40, 00000000
        mov     qword [rdx-0B8H], 0                     ; 00DB _ 48: C7. 82, FFFFFF48, 00000000
        mov     qword [rdx-0B0H], 0                     ; 00E6 _ 48: C7. 82, FFFFFF50, 00000000
        mov     dword [rdx-0A8H], 0                     ; 00F1 _ C7. 82, FFFFFF58, 00000000
        mov     dword [rdx-0A0H], 0                     ; 00FB _ C7. 82, FFFFFF60, 00000000
        mov     qword [rdx-98H], 0                      ; 0105 _ 48: C7. 82, FFFFFF68, 00000000
        mov     qword [rdx-90H], 0                      ; 0110 _ 48: C7. 82, FFFFFF70, 00000000
        mov     qword [rdx-88H], 0                      ; 011B _ 48: C7. 82, FFFFFF78, 00000000
        mov     dword [rdx-80H], 0                      ; 0126 _ C7. 42, 80, 00000000
        mov     dword [rdx-78H], 0                      ; 012D _ C7. 42, 88, 00000000
        mov     qword [rdx-70H], 0                      ; 0134 _ 48: C7. 42, 90, 00000000
        mov     qword [rdx-68H], 0                      ; 013C _ 48: C7. 42, 98, 00000000
        mov     qword [rdx-60H], 0                      ; 0144 _ 48: C7. 42, A0, 00000000
        mov     dword [rdx-58H], 0                      ; 014C _ C7. 42, A8, 00000000
        mov     dword [rdx-50H], 0                      ; 0153 _ C7. 42, B0, 00000000
        mov     qword [rdx-48H], 0                      ; 015A _ 48: C7. 42, B8, 00000000
        mov     qword [rdx-40H], 0                      ; 0162 _ 48: C7. 42, C0, 00000000
        mov     qword [rdx-38H], 0                      ; 016A _ 48: C7. 42, C8, 00000000
        mov     dword [rdx-30H], 0                      ; 0172 _ C7. 42, D0, 00000000
        mov     dword [rdx-28H], 0                      ; 0179 _ C7. 42, D8, 00000000
        mov     qword [rdx-20H], 0                      ; 0180 _ 48: C7. 42, E0, 00000000
        mov     qword [rdx-18H], 0                      ; 0188 _ 48: C7. 42, E8, 00000000
        mov     qword [rdx-10H], 0                      ; 0190 _ 48: C7. 42, F0, 00000000
        mov     dword [rdx-8H], 0                       ; 0198 _ C7. 42, F8, 00000000
        cmp     rdx, r8                                 ; 019F _ 4C: 39. C2
        jne     ?_001                                   ; 01A2 _ 0F 85, FFFFFE7C
        mov     rdi, qword [rel .refptr.StepAttacksBB]  ; 01A8 _ 48: 8B. 3D, 00000000(rel)
        mov     r8, rax                                 ; 01AF _ 49: 89. C0
        xor     ecx, ecx                                ; 01B2 _ 31. C9
        mov     r12d, 6                                 ; 01B4 _ 41: BC, 00000006
        mov     rbp, qword [rel .refptr.SquareDistance] ; 01BA _ 48: 8B. 2D, 00000000(rel)
        mov     r13, qword [rel .refptr.SquareBB]       ; 01C1 _ 4C: 8B. 2D, 00000000(rel)
        mov     r14, rdi                                ; 01C8 _ 49: 89. FE
        jmp     ?_004                                   ; 01CB _ EB, 53

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_002:  mov     r15, qword [r14+rsi*8+200H]             ; 01D0 _ 4D: 8B. BC F6, 00000200
        test    qword [r13+rdx*8], r15                  ; 01D8 _ 4D: 85. 7C D5, 00
        jne     ?_006                                   ; 01DD _ 0F 85, 00000144
        mov     r15, rsi                                ; 01E3 _ 49: 89. F7
        mov     r10d, 1                                 ; 01E6 _ 41: BA, 00000001
        shr     r15, 3                                  ; 01EC _ 49: C1. EF, 03
        cmp     r15, 6                                  ; 01F0 _ 49: 83. FF, 06
        je      ?_005                                   ; 01F4 _ 0F 84, 000000E3
?_003:  add     ecx, 1                                  ; 01FA _ 83. C1, 01
        mov     dword [r8], r11d                        ; 01FD _ 45: 89. 18
        add     r8, 40                                  ; 0200 _ 49: 83. C0, 28
        mov     qword [r8-20H], rbx                     ; 0204 _ 49: 89. 58, E0
        mov     qword [r8-18H], rdx                     ; 0208 _ 49: 89. 50, E8
        mov     qword [r8-10H], rsi                     ; 020C _ 49: 89. 70, F0
        mov     dword [r8-8H], r10d                     ; 0210 _ 45: 89. 50, F8
        cmp     ecx, 196608                             ; 0214 _ 81. F9, 00030000
        je      ?_007                                   ; 021A _ 0F 84, 0000010F
?_004:  mov     r9d, ecx                                ; 0220 _ 41: 89. C9
        mov     esi, r12d                               ; 0223 _ 44: 89. E6
        mov     ebx, ecx                                ; 0226 _ 89. CB
        shr     r9d, 15                                 ; 0228 _ 41: C1. E9, 0F
        mov     edx, ecx                                ; 022C _ 89. CA
        mov     r11d, ecx                               ; 022E _ 41: 89. CB
        sub     esi, r9d                                ; 0231 _ 44: 29. CE
        mov     r9d, ecx                                ; 0234 _ 41: 89. C9
        shr     edx, 6                                  ; 0237 _ C1. EA, 06
        shr     r9d, 13                                 ; 023A _ 41: C1. E9, 0D
        shr     r11d, 12                                ; 023E _ 41: C1. EB, 0C
        and     ebx, 3FH                                ; 0242 _ 83. E3, 3F
        lea     r15d, [rsi*8]                           ; 0245 _ 44: 8D. 3C F5, 00000000
        and     r9d, 03H                                ; 024D _ 41: 83. E1, 03
        and     edx, 3FH                                ; 0251 _ 83. E2, 3F
        or      r9d, r15d                               ; 0254 _ 45: 09. F9
        and     r11d, 01H                               ; 0257 _ 41: 83. E3, 01
        mov     esi, r9d                                ; 025B _ 44: 89. CE
        cmp     rbx, rsi                                ; 025E _ 48: 39. F3
        sete    r15b                                    ; 0261 _ 41: 0F 94. C7
        cmp     rdx, rsi                                ; 0265 _ 48: 39. F2
        sete    r10b                                    ; 0268 _ 41: 0F 94. C2
        or      r15b, r10b                              ; 026C _ 45: 08. D7
        jne     ?_006                                   ; 026F _ 0F 85, 000000B2
        mov     r15, rbx                                ; 0275 _ 49: 89. DF
        shl     r15, 6                                  ; 0278 _ 49: C1. E7, 06
        add     r15, rdx                                ; 027C _ 49: 01. D7
        cmp     dword [rbp+r15*4], 1                    ; 027F _ 42: 83. 7C BD, 00, 01
        jle     ?_006                                   ; 0285 _ 0F 8E, 0000009C
        test    r11d, r11d                              ; 028B _ 45: 85. DB
        je      ?_002                                   ; 028E _ 0F 84, FFFFFF3C
        mov     r9, qword [rdi+rbx*8+0C00H]             ; 0294 _ 4C: 8B. 8C DF, 00000C00
        mov     r15, qword [rdi+rdx*8+0C00H]            ; 029C _ 4C: 8B. BC D7, 00000C00
        mov     r10, r9                                 ; 02A4 _ 4D: 89. CA
        or      r10, qword [rdi+rsi*8+200H]             ; 02A7 _ 4C: 0B. 94 F7, 00000200
        andn    r10, r10, r15                           ; 02AF _ C4 42 A8: F2. D7
        test    r10, r10                                ; 02B4 _ 4D: 85. D2
        je      ?_030                                   ; 02B7 _ 0F 84, 00000402
        andn    r9, r9, r15                             ; 02BD _ C4 42 B0: F2. CF
        mov     r15, qword [rel .refptr.SquareBB]       ; 02C2 _ 4C: 8B. 3D, 00000000(rel)
        and     r9, qword [r15+rsi*8]                   ; 02C9 _ 4D: 23. 0C F7
        cmp     r9, 1                                   ; 02CD _ 49: 83. F9, 01
        sbb     r10d, r10d                              ; 02D1 _ 45: 19. D2
        add     r10d, 2                                 ; 02D4 _ 41: 83. C2, 02
        jmp     ?_003                                   ; 02D8 _ E9, FFFFFF1D

?_005:  add     r9d, 8                                  ; 02DD _ 41: 83. C1, 08
        movsxd  r9, r9d                                 ; 02E1 _ 4D: 63. C9
        cmp     rbx, r9                                 ; 02E4 _ 4C: 39. CB
        je      ?_003                                   ; 02E7 _ 0F 84, FFFFFF0D
        mov     r15, rdx                                ; 02ED _ 49: 89. D7
        mov     r10b, 4                                 ; 02F0 _ 41: B2, 04
        shl     r15, 6                                  ; 02F3 _ 49: C1. E7, 06
        add     r15, r9                                 ; 02F7 _ 4D: 01. CF
        cmp     dword [rbp+r15*4], 1                    ; 02FA _ 42: 83. 7C BD, 00, 01
        jg      ?_003                                   ; 0300 _ 0F 8F, FFFFFEF4
        mov     r10, qword [r13+r9*8]                   ; 0306 _ 4F: 8B. 54 CD, 00
        and     r10, qword [r14+rbx*8+0C00H]            ; 030B _ 4D: 23. 94 DE, 00000C00
        cmp     r10, 1                                  ; 0313 _ 49: 83. FA, 01
        sbb     r10d, r10d                              ; 0317 _ 45: 19. D2
        and     r10d, 0FFFFFFFDH                        ; 031A _ 41: 83. E2, FD
        add     r10d, 4                                 ; 031E _ 41: 83. C2, 04
        jmp     ?_003                                   ; 0322 _ E9, FFFFFED3

?_006:  xor     r10d, r10d                              ; 0327 _ 45: 31. D2
        jmp     ?_003                                   ; 032A _ E9, FFFFFECB

?_007:  mov     rbp, qword [rel .refptr.StepAttacksBB]  ; 032F _ 48: 8B. 2D, 00000000(rel)
        lea     r8, [rax+20H]                           ; 0336 _ 4C: 8D. 40, 20
        mov     r12d, 6                                 ; 033A _ 41: BC, 00000006
        mov     qword [rsp+28H], r8                     ; 0340 _ 4C: 89. 44 24, 28
        lea     rcx, [rax+780020H]                      ; 0345 _ 48: 8D. 88, 00780020
        mov     qword [rsp+20H], rbp                    ; 034C _ 48: 89. 6C 24, 20
?_008:  mov     rdx, qword [rsp+28H]                    ; 0351 _ 48: 8B. 54 24, 28
        xor     r8d, r8d                                ; 0356 _ 45: 31. C0
        jmp     ?_010                                   ; 0359 _ EB, 15

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_009:  add     rdx, 40                                 ; 0360 _ 48: 83. C2, 28
        or      r8d, r9d                                ; 0364 _ 45: 09. C8
        cmp     rdx, rcx                                ; 0367 _ 48: 39. CA
        je      ?_015                                   ; 036A _ 0F 84, 0000010D
?_010:  xor     r9d, r9d                                ; 0370 _ 45: 31. C9
        cmp     dword [rdx], 1                          ; 0373 _ 83. 3A, 01
        jnz     ?_009                                   ; 0376 _ 75, E8
        mov     edi, dword [rdx-20H]                    ; 0378 _ 8B. 7A, E0
        test    edi, edi                                ; 037B _ 85. FF
        jne     ?_025                                   ; 037D _ 0F 85, 00000252
        mov     rsi, qword [rdx-18H]                    ; 0383 _ 48: 8B. 72, E8
        mov     r13, qword [rsp+20H]                    ; 0387 _ 4C: 8B. 6C 24, 20
        mov     r10, qword [rdx-8H]                     ; 038C _ 4C: 8B. 52, F8
        mov     r11, qword [r13+rsi*8+0C00H]            ; 0390 _ 4D: 8B. 9C F5, 00000C00
        mov     rbx, r10                                ; 0398 _ 4C: 89. D3
        shr     rbx, 3                                  ; 039B _ 48: C1. EB, 03
        test    r11, r11                                ; 039F _ 4D: 85. DB
        jz      ?_012                                   ; 03A2 _ 74, 48
        mov     edi, r10d                               ; 03A4 _ 44: 89. D7
        mov     r14d, r12d                              ; 03A7 _ 45: 89. E6
        mov     r15d, 6                                 ; 03AA _ 41: BF, 00000006
; Note: Prefix bit or byte has no meaning in this context
        shlx    ebp, dword [rdx-10H], r15d              ; 03B0 _ C4 E2 01: F7. 6A, F0
        and     edi, 07H                                ; 03B6 _ 83. E7, 07
        or      ebp, 1000H                              ; 03B9 _ 81. CD, 00001000
        sub     r14d, ebx                               ; 03BF _ 41: 29. DE
        shl     edi, 13                                 ; 03C2 _ C1. E7, 0D
        shl     r14d, 15                                ; 03C5 _ 41: C1. E6, 0F
        xor     r9d, r9d                                ; 03C9 _ 45: 31. C9
        or      edi, ebp                                ; 03CC _ 09. EF
        or      r14d, edi                               ; 03CE _ 41: 09. FE
?_011:  bsf     r13, r11                                ; 03D1 _ 4D: 0F BC. EB
        or      r13d, r14d                              ; 03D5 _ 45: 09. F5
        blsr    r11, r11                                ; 03D8 _ C4 C2 A0: F3. CB
        lea     r15, [r13+r13*4]                        ; 03DD _ 4F: 8D. 7C AD, 00
        or      r9d, dword [rax+r15*8+20H]              ; 03E2 _ 46: 0B. 4C F8, 20
        test    r11, r11                                ; 03E7 _ 4D: 85. DB
        jnz     ?_011                                   ; 03EA _ 75, E5
?_012:  cmp     ebx, 5                                  ; 03EC _ 83. FB, 05
        ja      ?_013                                   ; 03EF _ 77, 56
        mov     r13, qword [rdx-10H]                    ; 03F1 _ 4C: 8B. 6A, F0
        mov     edi, r10d                               ; 03F5 _ 44: 89. D7
        mov     r14d, esi                               ; 03F8 _ 41: 89. F6
        add     r10d, 8                                 ; 03FB _ 41: 83. C2, 08
        or      r14d, 1000H                             ; 03FF _ 41: 81. CE, 00001000
        movsxd  rbp, r10d                               ; 0406 _ 49: 63. EA
        mov     r15d, r12d                              ; 0409 _ 45: 89. E7
        and     r10d, 07H                               ; 040C _ 41: 83. E2, 07
        shl     r10d, 13                                ; 0410 _ 41: C1. E2, 0D
        mov     r11d, r13d                              ; 0414 _ 45: 89. EB
        shl     r11d, 6                                 ; 0417 _ 41: C1. E3, 06
        or      r11d, r14d                              ; 041B _ 45: 09. F3
        mov     r14, rbp                                ; 041E _ 49: 89. EE
        shr     r14, 3                                  ; 0421 _ 49: C1. EE, 03
        or      r10d, r11d                              ; 0425 _ 45: 09. DA
        sub     r15d, r14d                              ; 0428 _ 45: 29. F7
        mov     r14d, r15d                              ; 042B _ 45: 89. FE
        shl     r14d, 15                                ; 042E _ 41: C1. E6, 0F
        or      r10d, r14d                              ; 0432 _ 45: 09. F2
        lea     r10, [r10+r10*4]                        ; 0435 _ 4F: 8D. 14 92
        or      r9d, dword [rax+r10*8+20H]              ; 0439 _ 46: 0B. 4C D0, 20
        cmp     ebx, 1                                  ; 043E _ 83. FB, 01
        je      ?_028                                   ; 0441 _ 0F 84, 0000022A
?_013:  test    r9b, 04H                                ; 0447 _ 41: F6. C1, 04
        jne     ?_027                                   ; 044B _ 0F 85, 0000020F
        and     r9d, 01H                                ; 0451 _ 41: 83. E1, 01
        cmp     r9d, 1                                  ; 0455 _ 41: 83. F9, 01
        sbb     r14d, r14d                              ; 0459 _ 45: 19. F6
        mov     r9d, r14d                               ; 045C _ 45: 89. F1
        not     r14d                                    ; 045F _ 41: F7. D6
        and     r9d, 01H                                ; 0462 _ 41: 83. E1, 01
        add     r14d, 2                                 ; 0466 _ 41: 83. C6, 02
?_014:  mov     dword [rdx], r14d                       ; 046A _ 44: 89. 32
        add     rdx, 40                                 ; 046D _ 48: 83. C2, 28
        or      r8d, r9d                                ; 0471 _ 45: 09. C8
        cmp     rdx, rcx                                ; 0474 _ 48: 39. CA
        jne     ?_010                                   ; 0477 _ 0F 85, FFFFFEF3
?_015:  test    r8d, r8d                                ; 047D _ 45: 85. C0
        jne     ?_008                                   ; 0480 _ 0F 85, FFFFFECB
        mov     rsi, qword [rsp+28H]                    ; 0486 _ 48: 8B. 74 24, 28
        xor     ecx, ecx                                ; 048B _ 31. C9
        mov     r12d, 1                                 ; 048D _ 41: BC, 00000001
?_016:  cmp     dword [rsi], 4                          ; 0493 _ 83. 3E, 04
        jnz     ?_017                                   ; 0496 _ 75, 15
        lea     r8, [rel _ZN12_GLOBAL__N_110KPKBitbaseE]; 0498 _ 4C: 8D. 05, 00000000(rel)
        mov     edx, ecx                                ; 049F _ 89. CA
        mov     ebp, r12d                               ; 04A1 _ 44: 89. E5
        shr     edx, 5                                  ; 04A4 _ C1. EA, 05
        shl     ebp, cl                                 ; 04A7 _ D3. E5
        or      dword [r8+rdx*4], ebp                   ; 04A9 _ 41: 09. 2C 90
?_017:  cmp     dword [rsi+28H], 4                      ; 04AD _ 83. 7E, 28, 04
        lea     r13d, [rcx+1H]                          ; 04B1 _ 44: 8D. 69, 01
        lea     r15, [rsi+28H]                          ; 04B5 _ 4C: 8D. 7E, 28
        jnz     ?_018                                   ; 04B9 _ 75, 1B
        mov     r9d, r13d                               ; 04BB _ 45: 89. E9
        mov     r14d, r12d                              ; 04BE _ 45: 89. E6
        mov     ecx, r13d                               ; 04C1 _ 44: 89. E9
        shr     r9d, 5                                  ; 04C4 _ 41: C1. E9, 05
        shl     r14d, cl                                ; 04C8 _ 41: D3. E6
        lea     r11, [rel _ZN12_GLOBAL__N_110KPKBitbaseE]; 04CB _ 4C: 8D. 1D, 00000000(rel)
        or      dword [r11+r9*4], r14d                  ; 04D2 _ 47: 09. 34 8B
?_018:  cmp     dword [r15+28H], 4                      ; 04D6 _ 41: 83. 7F, 28, 04
        lea     ecx, [r13+1H]                           ; 04DB _ 41: 8D. 4D, 01
        jnz     ?_019                                   ; 04DF _ 75, 14
        lea     rdi, [rel _ZN12_GLOBAL__N_110KPKBitbaseE]; 04E1 _ 48: 8D. 3D, 00000000(rel)
        mov     ebx, ecx                                ; 04E8 _ 89. CB
        mov     esi, r12d                               ; 04EA _ 44: 89. E6
        shr     ebx, 5                                  ; 04ED _ C1. EB, 05
        shl     esi, cl                                 ; 04F0 _ D3. E6
        or      dword [rdi+rbx*4], esi                  ; 04F2 _ 09. 34 9F
?_019:  cmp     dword [r15+50H], 4                      ; 04F5 _ 41: 83. 7F, 50, 04
        lea     ecx, [r13+2H]                           ; 04FA _ 41: 8D. 4D, 02
        jnz     ?_020                                   ; 04FE _ 75, 19
        lea     rbp, [rel _ZN12_GLOBAL__N_110KPKBitbaseE]; 0500 _ 48: 8D. 2D, 00000000(rel)
        mov     r8d, ecx                                ; 0507 _ 41: 89. C8
        mov     r9d, r12d                               ; 050A _ 45: 89. E1
        shr     r8d, 5                                  ; 050D _ 41: C1. E8, 05
        shl     r9d, cl                                 ; 0511 _ 41: D3. E1
        or      dword [rbp+r8*4], r9d                   ; 0514 _ 46: 09. 4C 85, 00
?_020:  cmp     dword [r15+78H], 4                      ; 0519 _ 41: 83. 7F, 78, 04
        lea     ecx, [r13+3H]                           ; 051E _ 41: 8D. 4D, 03
        jnz     ?_021                                   ; 0522 _ 75, 17
        lea     r10, [rel _ZN12_GLOBAL__N_110KPKBitbaseE]; 0524 _ 4C: 8D. 15, 00000000(rel)
        mov     r14d, ecx                               ; 052B _ 41: 89. CE
        mov     ebx, r12d                               ; 052E _ 44: 89. E3
        shr     r14d, 5                                 ; 0531 _ 41: C1. EE, 05
        shl     ebx, cl                                 ; 0535 _ D3. E3
        or      dword [r10+r14*4], ebx                  ; 0537 _ 43: 09. 1C B2
?_021:  cmp     dword [r15+0A0H], 4                     ; 053B _ 41: 83. BF, 000000A0, 04
        lea     ecx, [r13+4H]                           ; 0543 _ 41: 8D. 4D, 04
        jnz     ?_022                                   ; 0547 _ 75, 15
        lea     r8, [rel _ZN12_GLOBAL__N_110KPKBitbaseE]; 0549 _ 4C: 8D. 05, 00000000(rel)
        mov     edx, ecx                                ; 0550 _ 89. CA
        mov     esi, r12d                               ; 0552 _ 44: 89. E6
        shr     edx, 5                                  ; 0555 _ C1. EA, 05
        shl     esi, cl                                 ; 0558 _ D3. E6
        or      dword [r8+rdx*4], esi                   ; 055A _ 41: 09. 34 90
?_022:  cmp     dword [r15+0C8H], 4                     ; 055E _ 41: 83. BF, 000000C8, 04
        lea     ecx, [r13+5H]                           ; 0566 _ 41: 8D. 4D, 05
        jnz     ?_023                                   ; 056A _ 75, 18
        lea     r11, [rel _ZN12_GLOBAL__N_110KPKBitbaseE]; 056C _ 4C: 8D. 1D, 00000000(rel)
        mov     r9d, ecx                                ; 0573 _ 41: 89. C9
        mov     r14d, r12d                              ; 0576 _ 45: 89. E6
        shr     r9d, 5                                  ; 0579 _ 41: C1. E9, 05
        shl     r14d, cl                                ; 057D _ 41: D3. E6
        or      dword [r11+r9*4], r14d                  ; 0580 _ 47: 09. 34 8B
?_023:  cmp     dword [r15+0F0H], 4                     ; 0584 _ 41: 83. BF, 000000F0, 04
        lea     ecx, [r13+6H]                           ; 058C _ 41: 8D. 4D, 06
        jnz     ?_024                                   ; 0590 _ 75, 14
        lea     rdi, [rel _ZN12_GLOBAL__N_110KPKBitbaseE]; 0592 _ 48: 8D. 3D, 00000000(rel)
        mov     ebx, ecx                                ; 0599 _ 89. CB
        mov     edx, r12d                               ; 059B _ 44: 89. E2
        shr     ebx, 5                                  ; 059E _ C1. EB, 05
        shl     edx, cl                                 ; 05A1 _ D3. E2
        or      dword [rdi+rbx*4], edx                  ; 05A3 _ 09. 14 9F
?_024:  lea     ecx, [r13+7H]                           ; 05A6 _ 41: 8D. 4D, 07
        lea     rsi, [r15+118H]                         ; 05AA _ 49: 8D. B7, 00000118
        cmp     ecx, 196608                             ; 05B1 _ 81. F9, 00030000
        jne     ?_016                                   ; 05B7 _ 0F 85, FFFFFED6
        mov     rcx, rax                                ; 05BD _ 48: 89. C1
        add     rsp, 56                                 ; 05C0 _ 48: 83. C4, 38
        pop     rbx                                     ; 05C4 _ 5B
        pop     rsi                                     ; 05C5 _ 5E
        pop     rdi                                     ; 05C6 _ 5F
        pop     rbp                                     ; 05C7 _ 5D
        pop     r12                                     ; 05C8 _ 41: 5C
        pop     r13                                     ; 05CA _ 41: 5D
        pop     r14                                     ; 05CC _ 41: 5E
        pop     r15                                     ; 05CE _ 41: 5F
        jmp     _ZdlPv                                  ; 05D0 _ E9, 00000000(rel)

?_025:  mov     r14, qword [rdx-10H]                    ; 05D5 _ 4C: 8B. 72, F0
        mov     r13, qword [rel .refptr.StepAttacksBB]  ; 05D9 _ 4C: 8B. 2D, 00000000(rel)
        mov     r10, qword [r13+r14*8+0C00H]            ; 05E0 _ 4F: 8B. 94 F5, 00000C00
        test    r10, r10                                ; 05E8 _ 4D: 85. D2
        jz      ?_027                                   ; 05EB _ 74, 73
        mov     r11, qword [rdx-8H]                     ; 05ED _ 4C: 8B. 5A, F8
        mov     esi, r12d                               ; 05F1 _ 44: 89. E6
        xor     r15d, r15d                              ; 05F4 _ 45: 31. FF
        mov     ebx, r11d                               ; 05F7 _ 44: 89. DB
        shr     r11, 3                                  ; 05FA _ 49: C1. EB, 03
        and     ebx, 07H                                ; 05FE _ 83. E3, 07
        sub     esi, r11d                               ; 0601 _ 44: 29. DE
        shl     ebx, 13                                 ; 0604 _ C1. E3, 0D
        or      ebx, dword [rdx-18H]                    ; 0607 _ 0B. 5A, E8
        mov     r9d, esi                                ; 060A _ 41: 89. F1
        shl     r9d, 15                                 ; 060D _ 41: C1. E1, 0F
        or      ebx, r9d                                ; 0611 _ 44: 09. CB
?_026:  bsf     rbp, r10                                ; 0614 _ 49: 0F BC. EA
        shl     ebp, 6                                  ; 0618 _ C1. E5, 06
        blsr    r10, r10                                ; 061B _ C4 C2 A8: F3. CA
        or      ebp, ebx                                ; 0620 _ 09. DD
        lea     rdi, [rbp+rbp*4]                        ; 0622 _ 48: 8D. 7C AD, 00
        or      r15d, dword [rax+rdi*8+20H]             ; 0627 _ 44: 0B. 7C F8, 20
        test    r10, r10                                ; 062C _ 4D: 85. D2
        jnz     ?_026                                   ; 062F _ 75, E3
        test    r15b, 02H                               ; 0631 _ 41: F6. C7, 02
        jnz     ?_029                                   ; 0635 _ 75, 77
        and     r15d, 01H                               ; 0637 _ 41: 83. E7, 01
        cmp     r15d, 1                                 ; 063B _ 41: 83. FF, 01
        sbb     r14d, r14d                              ; 063F _ 45: 19. F6
        mov     r9d, r14d                               ; 0642 _ 45: 89. F1
        and     r14d, 03H                               ; 0645 _ 41: 83. E6, 03
        and     r9d, 01H                                ; 0649 _ 41: 83. E1, 01
        add     r14d, 1                                 ; 064D _ 41: 83. C6, 01
        jmp     ?_014                                   ; 0651 _ E9, FFFFFE14

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_027:  mov     r9d, 1                                  ; 0660 _ 41: B9, 00000001
        mov     r14d, 4                                 ; 0666 _ 41: BE, 00000004
        jmp     ?_014                                   ; 066C _ E9, FFFFFDF9

?_028:  cmp     rsi, rbp                                ; 0671 _ 48: 39. EE
        je      ?_013                                   ; 0674 _ 0F 84, FFFFFDCD
        cmp     rbp, r13                                ; 067A _ 4C: 39. ED
        je      ?_013                                   ; 067D _ 0F 84, FFFFFDC4
        add     edi, 16                                 ; 0683 _ 83. C7, 10
        mov     ebx, r12d                               ; 0686 _ 44: 89. E3
        movsxd  rsi, edi                                ; 0689 _ 48: 63. F7
        and     edi, 07H                                ; 068C _ 83. E7, 07
        shr     rsi, 3                                  ; 068F _ 48: C1. EE, 03
        shl     edi, 13                                 ; 0693 _ C1. E7, 0D
        sub     ebx, esi                                ; 0696 _ 29. F3
        or      edi, r11d                               ; 0698 _ 44: 09. DF
        shl     ebx, 15                                 ; 069B _ C1. E3, 0F
        or      edi, ebx                                ; 069E _ 09. DF
        lea     rdi, [rdi+rdi*4]                        ; 06A0 _ 48: 8D. 3C BF
        or      r9d, dword [rax+rdi*8+20H]              ; 06A4 _ 44: 0B. 4C F8, 20
        jmp     ?_013                                   ; 06A9 _ E9, FFFFFD99

?_029:  mov     r9d, 1                                  ; 06AE _ 41: B9, 00000001
        mov     r14d, 2                                 ; 06B4 _ 41: BE, 00000002
        jmp     ?_014                                   ; 06BA _ E9, FFFFFDAB

?_030:  ; Local function
        mov     r10d, 2                                 ; 06BF _ 41: BA, 00000002
        jmp     ?_003                                   ; 06C5 _ E9, FFFFFB30

        nop                                             ; 06CA _ 90
        nop                                             ; 06CB _ 90
        nop                                             ; 06CC _ 90
        nop                                             ; 06CD _ 90
        nop                                             ; 06CE _ 90
        nop                                             ; 06CF _ 90


SECTION .xdata.hot align=4 noexecute                    ; section number 6, const

        db 01H, 10H, 09H, 00H, 10H, 62H, 0CH, 30H       ; 0000 _ .....b.0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .xdata  align=4 noexecute                       ; section number 8, const

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .rdata$zzz align=16 noexecute                   ; section number 10, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr.SquareBB align=16 noexecute      ; section number 11, const
;  Communal section not supported by YASM

.refptr.SquareBB:                                       ; qword
        dq SquareBB                                     ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.StepAttacksBB align=16 noexecute ; section number 12, const
;  Communal section not supported by YASM

.refptr.StepAttacksBB:                                  ; qword
        dq StepAttacksBB                                ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.SquareDistance align=16 noexecute ; section number 13, const
;  Communal section not supported by YASM

.refptr.SquareDistance:                                 ; qword
        dq SquareDistance                               ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


