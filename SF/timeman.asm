; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\timeman.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: SSE2, x64

default rel

global _ZN14TimeManagement4initERN6Search10LimitsTypeE5Colori: function
global Time
global .refptr.Opt

extern Opt                                              ; byte
extern _Z8math_powdd                                    ; near
extern exp                                              ; near


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_ZN14TimeManagement4initERN6Search10LimitsTypeE5Colori:
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 168                                ; 000C _ 48: 81. EC, 000000A8
        movaps  oword [rsp+30H], xmm6                   ; 0013 _ 0F 29. 74 24, 30
        movaps  oword [rsp+40H], xmm7                   ; 0018 _ 0F 29. 7C 24, 40
        movaps  oword [rsp+50H], xmm8                   ; 001D _ 44: 0F 29. 44 24, 50
        movaps  oword [rsp+60H], xmm9                   ; 0023 _ 44: 0F 29. 4C 24, 60
        movaps  oword [rsp+70H], xmm10                  ; 0029 _ 44: 0F 29. 54 24, 70
        movaps  oword [rsp+80H], xmm11                  ; 002F _ 44: 0F 29. 9C 24, 00000080
        movaps  oword [rsp+90H], xmm12                  ; 0038 _ 44: 0F 29. A4 24, 00000090
        mov     rbx, qword [rel .refptr.Opt]            ; 0041 _ 48: 8B. 1D, 00000000(rel)
        mov     rax, qword [rel .refptr.Opt]            ; 0048 _ 48: 8B. 05, 00000000(rel)
        mov     esi, dword [rbx+2CH]                    ; 004F _ 8B. 73, 2C
        mov     r12d, dword [rax+24H]                   ; 0052 _ 44: 8B. 60, 24
        mov     rbp, rcx                                ; 0056 _ 48: 89. CD
        mov     ecx, dword [rax+20H]                    ; 0059 _ 8B. 48, 20
        mov     edi, r9d                                ; 005C _ 44: 89. CF
        movsxd  r8, r8d                                 ; 005F _ 4D: 63. C0
        mov     r15d, dword [rbx+28H]                   ; 0062 _ 44: 8B. 7B, 28
        test    esi, esi                                ; 0066 _ 85. F6
        mov     dword [rsp+2CH], ecx                    ; 0068 _ 89. 4C 24, 2C
        jne     _ZN14TimeManagement4initERN6Search10LimitsTypeE5Colori.cold.5; 006C _ 0F 85, 00000000(rel)
        mov     rax, qword [rdx+50H]                    ; 0072 _ 48: 8B. 42, 50
        lea     r13, [rdx+r8*4]                         ; 0076 _ 4E: 8D. 2C 82
        mov     ecx, r12d                               ; 007A _ 44: 89. E1
        mov     edx, dword [rdx+2CH]                    ; 007D _ 8B. 52, 2C
        cmp     dword [r13+18H], r12d                   ; 0080 _ 45: 39. 65, 18
        cmovge  ecx, dword [r13+18H]                    ; 0084 _ 41: 0F 4D. 4D, 18
        mov     qword [rbp+8H], rax                     ; 0089 _ 48: 89. 45, 08
        test    edx, edx                                ; 008D _ 85. D2
        mov     dword [rbp+14H], ecx                    ; 008F _ 89. 4D, 14
        mov     dword [rbp+10H], ecx                    ; 0092 _ 89. 4D, 10
        je      ?_008                                   ; 0095 _ 0F 84, 000001D2
        cmp     edx, 50                                 ; 009B _ 83. FA, 32
        mov     dword [rsp+28H], edx                    ; 009E _ 89. 54 24, 28
        jg      ?_008                                   ; 00A2 _ 0F 8F, 000001C5
?_001:  movsd   xmm9, qword [rel ?_010]                 ; 00A8 _ F2 44: 0F 10. 0D, 00000000(rel)
        mov     esi, 1                                  ; 00B1 _ BE, 00000001
        pxor    xmm8, xmm8                              ; 00B6 _ 66 45: 0F EF. C0
        movsd   xmm11, qword [rel ?_011]                ; 00BB _ F2 44: 0F 10. 1D, 00000008(rel)
        movsd   xmm10, qword [rel ?_012]                ; 00C4 _ F2 44: 0F 10. 15, 00000010(rel)
?_002:  cmp     dword [rsp+28H], esi                    ; 00CD _ 39. 74 24, 28
        jl      ?_007                                   ; 00D1 _ 0F 8C, 00000143
        mov     r14d, dword [rsp+2CH]                   ; 00D7 _ 44: 8B. 74 24, 2C
        lea     r8d, [rsi-1H]                           ; 00DC _ 44: 8D. 46, FF
        mov     ebx, 0                                  ; 00E0 _ BB, 00000000
        mov     ecx, edi                                ; 00E5 _ 89. F9
        imul    r8d, dword [r13+20H]                    ; 00E7 _ 45: 0F AF. 45, 20
        mov     r10d, 40                                ; 00EC _ 41: BA, 00000028
        mov     r11d, 4294967294                        ; 00F2 _ 41: BB, FFFFFFFE
        pxor    xmm7, xmm7                              ; 00F8 _ 66: 0F EF. FF
        add     r8d, dword [r13+18H]                    ; 00FC _ 45: 03. 45, 18
        cmp     esi, 40                                 ; 0100 _ 83. FE, 28
        cmovle  r10d, esi                               ; 0103 _ 44: 0F 4E. D6
        sub     r11d, r10d                              ; 0107 _ 45: 29. D3
        imul    r14d, r11d                              ; 010A _ 45: 0F AF. F3
        add     r14d, r8d                               ; 010E _ 45: 01. C6
        cmovns  ebx, r14d                               ; 0111 _ 41: 0F 49. DE
        mov     r14d, 1                                 ; 0115 _ 41: BE, 00000001
        call    _ZN12_GLOBAL__N_115move_importanceEi    ; 011B _ E8, 00000000(rel)
        cvtsi2sd xmm7, r15d                             ; 0120 _ F2 41: 0F 2A. FF
        movapd  xmm6, xmm0                              ; 0125 _ 66: 0F 28. F0
        mulsd   xmm6, xmm7                              ; 0129 _ F2: 0F 59. F7
        divsd   xmm6, xmm9                              ; 012D _ F2 41: 0F 5E. F1
        movapd  xmm12, xmm6                             ; 0132 _ 66 44: 0F 28. E6
        movapd  xmm6, xmm8                              ; 0137 _ 66 41: 0F 28. F0
        jmp     ?_004                                   ; 013C _ EB, 11

?_003:  lea     ecx, [rdi+r14*2]                        ; 013E _ 42: 8D. 0C 77
        add     r14d, 1                                 ; 0142 _ 41: 83. C6, 01
        call    _ZN12_GLOBAL__N_115move_importanceEi    ; 0146 _ E8, 00000000(rel)
        addsd   xmm6, xmm0                              ; 014B _ F2: 0F 58. F0
?_004:  cmp     esi, r14d                               ; 014F _ 44: 39. F6
        jg      ?_003                                   ; 0152 _ 7F, EA
        movapd  xmm0, xmm12                             ; 0154 _ 66 41: 0F 28. C4
        movapd  xmm1, xmm12                             ; 0159 _ 66 41: 0F 28. CC
        mov     ecx, edi                                ; 015E _ 89. F9
        addsd   xmm0, xmm6                              ; 0160 _ F2: 0F 58. C6
        mulsd   xmm6, xmm8                              ; 0164 _ F2 41: 0F 59. F0
        mov     r14d, 1                                 ; 0169 _ 41: BE, 00000001
        divsd   xmm1, xmm0                              ; 016F _ F2: 0F 5E. C8
        addsd   xmm6, xmm12                             ; 0173 _ F2 41: 0F 58. F4
        pxor    xmm12, xmm12                            ; 0178 _ 66 45: 0F EF. E4
        cvtsi2sd xmm12, ebx                             ; 017D _ F2 44: 0F 2A. E3
        divsd   xmm6, xmm0                              ; 0182 _ F2: 0F 5E. F0
        minsd   xmm6, xmm1                              ; 0186 _ F2: 0F 5D. F1
        call    _ZN12_GLOBAL__N_115move_importanceEi    ; 018A _ E8, 00000000(rel)
        mulsd   xmm7, xmm0                              ; 018F _ F2: 0F 59. F8
        mulsd   xmm6, xmm12                             ; 0193 _ F2 41: 0F 59. F4
        divsd   xmm7, xmm9                              ; 0198 _ F2 41: 0F 5E. F9
        cvttsd2si ebx, xmm6                             ; 019D _ F2: 0F 2C. DE
        movapd  xmm6, xmm8                              ; 01A1 _ 66 41: 0F 28. F0
        add     ebx, r12d                               ; 01A6 _ 44: 01. E3
        jmp     ?_006                                   ; 01A9 _ EB, 11

?_005:  lea     ecx, [rdi+r14*2]                        ; 01AB _ 42: 8D. 0C 77
        add     r14d, 1                                 ; 01AF _ 41: 83. C6, 01
        call    _ZN12_GLOBAL__N_115move_importanceEi    ; 01B3 _ E8, 00000000(rel)
        addsd   xmm6, xmm0                              ; 01B8 _ F2: 0F 58. F0
?_006:  cmp     esi, r14d                               ; 01BC _ 44: 39. F6
        jg      ?_005                                   ; 01BF _ 7F, EA
        movapd  xmm2, xmm7                              ; 01C1 _ 66: 0F 28. D7
        movapd  xmm5, xmm6                              ; 01C5 _ 66: 0F 28. EE
        mov     ecx, dword [rbp+10H]                    ; 01C9 _ 8B. 4D, 10
        mulsd   xmm2, xmm11                             ; 01CC _ F2 41: 0F 59. D3
        mov     eax, dword [rbp+14H]                    ; 01D1 _ 8B. 45, 14
        mulsd   xmm5, xmm10                             ; 01D4 _ F2 41: 0F 59. EA
        cmp     ebx, ecx                                ; 01D9 _ 39. CB
        cmovg   ebx, ecx                                ; 01DB _ 0F 4F. D9
        movapd  xmm3, xmm2                              ; 01DE _ 66: 0F 28. DA
        addsd   xmm3, xmm6                              ; 01E2 _ F2: 0F 58. DE
        mov     dword [rbp+10H], ebx                    ; 01E6 _ 89. 5D, 10
        addsd   xmm5, xmm7                              ; 01E9 _ F2: 0F 58. EF
        addsd   xmm6, xmm7                              ; 01ED _ F2: 0F 58. F7
        divsd   xmm2, xmm3                              ; 01F1 _ F2: 0F 5E. D3
        divsd   xmm5, xmm6                              ; 01F5 _ F2: 0F 5E. EE
        minsd   xmm5, xmm2                              ; 01F9 _ F2: 0F 5D. EA
        mulsd   xmm12, xmm5                             ; 01FD _ F2 44: 0F 59. E5
        cvttsd2si ebx, xmm12                            ; 0202 _ F2 41: 0F 2C. DC
        add     ebx, r12d                               ; 0207 _ 44: 01. E3
        cmp     ebx, eax                                ; 020A _ 39. C3
        cmovg   ebx, eax                                ; 020C _ 0F 4F. D8
        add     esi, 1                                  ; 020F _ 83. C6, 01
        mov     dword [rbp+14H], ebx                    ; 0212 _ 89. 5D, 14
        jmp     ?_002                                   ; 0215 _ E9, FFFFFEB3

?_007:  mov     rdi, qword [rel .refptr.Opt]            ; 021A _ 48: 8B. 3D, 00000000(rel)
        cmp     byte [rdi+42H], 0                       ; 0221 _ 80. 7F, 42, 00
        jne     .text.unlikely+37H                      ; 0225 _ 0F 85, 00000037(rel)
        movaps  xmm6, oword [rsp+30H]                   ; 022B _ 0F 28. 74 24, 30
        movaps  xmm7, oword [rsp+40H]                   ; 0230 _ 0F 28. 7C 24, 40
        movaps  xmm8, oword [rsp+50H]                   ; 0235 _ 44: 0F 28. 44 24, 50
        movaps  xmm9, oword [rsp+60H]                   ; 023B _ 44: 0F 28. 4C 24, 60
        movaps  xmm10, oword [rsp+70H]                  ; 0241 _ 44: 0F 28. 54 24, 70
        movaps  xmm11, oword [rsp+80H]                  ; 0247 _ 44: 0F 28. 9C 24, 00000080
        movaps  xmm12, oword [rsp+90H]                  ; 0250 _ 44: 0F 28. A4 24, 00000090
        add     rsp, 168                                ; 0259 _ 48: 81. C4, 000000A8
        pop     rbx                                     ; 0260 _ 5B
        pop     rsi                                     ; 0261 _ 5E
        pop     rdi                                     ; 0262 _ 5F
        pop     rbp                                     ; 0263 _ 5D
        pop     r12                                     ; 0264 _ 41: 5C
        pop     r13                                     ; 0266 _ 41: 5D
        pop     r14                                     ; 0268 _ 41: 5E
        pop     r15                                     ; 026A _ 41: 5F
        ret                                             ; 026C _ C3

?_008:  ; Local function
        mov     dword [rsp+28H], 50                     ; 026D _ C7. 44 24, 28, 00000032
        jmp     ?_001                                   ; 0275 _ E9, FFFFFE2E

        nop                                             ; 027A _ 90
        nop                                             ; 027B _ 90
        nop                                             ; 027C _ 90
        nop                                             ; 027D _ 90
        nop                                             ; 027E _ 90
        nop                                             ; 027F _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=16 noexecute                      ; section number 3, bss

Time:                                                   ; byte
        resb    32                                      ; 0000


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_ZN14TimeManagement4initERN6Search10LimitsTypeE5Colori.cold.5:
        cmp     qword [rbp], 0                          ; 0000 _ 48: 83. 7D, 00, 00
        jnz     ?_009                                   ; 0005 _ 75, 10
        mov     r9d, dword [rdx+r8*4+18H]               ; 0007 _ 46: 8B. 4C 82, 18
        imul    r9d, esi                                ; 000C _ 44: 0F AF. CE
        movsxd  r10, r9d                                ; 0010 _ 4D: 63. D1
        mov     qword [rbp], r10                        ; 0013 _ 4C: 89. 55, 00
?_009:  lea     r11, [rdx+r8*4]                         ; 0017 _ 4E: 8D. 1C 82
        mov     r13, qword [rbp]                        ; 001B _ 4C: 8B. 6D, 00
        mov     r14d, dword [r11+20H]                   ; 001F _ 45: 8B. 73, 20
        mov     dword [r11+18H], r13d                   ; 0023 _ 45: 89. 6B, 18
        imul    r14d, esi                               ; 0027 _ 44: 0F AF. F6
        mov     dword [r11+20H], r14d                   ; 002B _ 45: 89. 73, 20
        mov     dword [rdx+28H], esi                    ; 002F _ 89. 72, 28
        jmp     .text+72H                               ; 0032 _ E9, 00000072(rel)

        mov     r12d, dword [rbp+10H]                   ; 0037 _ 44: 8B. 65, 10
        mov     r15d, 4                                 ; 003B _ 41: BF, 00000004
        mov     eax, r12d                               ; 0041 _ 44: 89. E0
        cdq                                             ; 0044 _ 99
        idiv    r15d                                    ; 0045 _ 41: F7. FF
        lea     esi, [r12+rax]                          ; 0048 _ 41: 8D. 34 04
        mov     dword [rbp+10H], esi                    ; 004C _ 89. 75, 10
        jmp     .text+22BH                              ; 004F _ E9, 0000022B(rel)

        nop                                             ; 0054 _ 90
        nop                                             ; 0055 _ 90
        nop                                             ; 0056 _ 90
        nop                                             ; 0057 _ 90
        nop                                             ; 0058 _ 90
        nop                                             ; 0059 _ 90
        nop                                             ; 005A _ 90
        nop                                             ; 005B _ 90
        nop                                             ; 005C _ 90
        nop                                             ; 005D _ 90
        nop                                             ; 005E _ 90
        nop                                             ; 005F _ 90


SECTION .xdata  align=4 noexecute                       ; section number 5, const

        db 01H, 41H, 18H, 00H, 41H, 0C8H, 09H, 00H      ; 0000 _ .A..A...
        db 38H, 0B8H, 08H, 00H, 2FH, 0A8H, 07H, 00H     ; 0008 _ 8.../...
        db 29H, 98H, 06H, 00H, 23H, 88H, 05H, 00H       ; 0010 _ )...#...
        db 1DH, 78H, 04H, 00H, 18H, 68H, 03H, 00H       ; 0018 _ .x...h..
        db 13H, 01H, 15H, 00H, 0CH, 30H, 0BH, 60H       ; 0020 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 0028 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H                         ; 0030 _ ....


SECTION .text.hot align=16 execute                      ; section number 7, code

.text.hot:; Local function
_ZN12_GLOBAL__N_115move_importanceEi:
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        pxor    xmm0, xmm0                              ; 0004 _ 66: 0F EF. C0
        cvtsi2sd xmm0, ecx                              ; 0008 _ F2: 0F 2A. C1
        subsd   xmm0, qword [rel ?_013]                 ; 000C _ F2: 0F 5C. 05, 00000018(rel)
        divsd   xmm0, qword [rel ?_014]                 ; 0014 _ F2: 0F 5E. 05, 00000020(rel)
        call    exp                                     ; 001C _ E8, 00000000(rel)
        addsd   xmm0, qword [rel ?_016]                 ; 0021 _ F2: 0F 58. 05, 00000030(rel)
        movsd   xmm1, qword [rel ?_015]                 ; 0029 _ F2: 0F 10. 0D, 00000028(rel)
        call    _Z8math_powdd                           ; 0031 _ E8, 00000000(rel)
        addsd   xmm0, qword [rel ?_017]                 ; 0036 _ F2: 0F 58. 05, 00000038(rel)
        add     rsp, 40                                 ; 003E _ 48: 83. C4, 28
        ret                                             ; 0042 _ C3

        nop                                             ; 0043 _ 90
        nop                                             ; 0044 _ 90
        nop                                             ; 0045 _ 90
        nop                                             ; 0046 _ 90
        nop                                             ; 0047 _ 90
        nop                                             ; 0048 _ 90
        nop                                             ; 0049 _ 90
        nop                                             ; 004A _ 90
        nop                                             ; 004B _ 90
        nop                                             ; 004C _ 90
        nop                                             ; 004D _ 90
        nop                                             ; 004E _ 90
        nop                                             ; 004F _ 90


SECTION .xdata.hot align=4 noexecute                    ; section number 8, const

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .rdata  align=16 noexecute                      ; section number 10, const

?_010:                                                  ; qword
        dq 4059000000000000H                            ; 0000 _ 100.0 

?_011:  dq 401C5C28F5C28F5CH                            ; 0008 _ 7.09 

?_012:  dq 3FD6666666666666H                            ; 0010 _ 0.35 

?_013:  dq 404D333333333333H                            ; 0018 _ 58.4 

?_014:  dq 401E8F5C28F5C28FH                            ; 0020 _ 7.64 

?_015:  dq 0BFC76C8B43958106H                           ; 0028 _ -0.183 

?_016:  dq 3FF0000000000000H                            ; 0030 _ 1.0 

?_017:  dq 0010000000000000H                            ; 0038 _ 2.225073858507201E-308 


SECTION .rdata$zzz align=16 noexecute                   ; section number 11, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr.Opt align=16 noexecute           ; section number 12, const
;  Communal section not supported by YASM

.refptr.Opt:                                            ; qword
        dq Opt                                          ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


