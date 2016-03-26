; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\misc.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: BMI etc., x64, 80x87

default rel

global _Z3nowv: function
global _Z8MiscInitv: function
global _Z10math_2p64dy: function
global _Z6v_freePv: function
global _Z7v_allocy: function
global _Z9parse_intPKcRi: function
global _Z12print_stringPcPKc: function
global _Z9write_outPcS_: function
global _Z17print_engine_infoPc: function
global _Z14parse_gettokenPKcPc: function
global _Z9print_intPcy: function
global _Z11write_errorPcS_: function
global _Z9print_intPci: function
global _Z9print_intPcx: function
global Period
global Frequency
global hStdError
global hStdOut
global hStdIn
global _Z8math_expd: function
global _Z11print_hex64Pcy: function
global _Z7read_inPc: function
global _Z12print_doublePcd: function
global _Z13print_vstringPcS_: function
global _Z17parse_token_lowerPKcPc: function
global _Z9parse_intPKcRy: function
global _Z8math_logd: function
global _Z9parse_intPKcRx: function
global _Z8math_powdd: function

extern __imp_ReadFile                                   ; qword
extern __imp_WriteFile                                  ; qword
extern __imp_VirtualAlloc                               ; qword
extern __imp_VirtualFree                                ; qword
extern __imp_QueryPerformanceFrequency                  ; qword
extern __imp_GetStdHandle                               ; qword
extern __imp_QueryPerformanceCounter                    ; qword


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_Z3nowv:
        sub     rsp, 56                                 ; 0000 _ 48: 83. EC, 38
        lea     rcx, [rsp+28H]                          ; 0004 _ 48: 8D. 4C 24, 28
        call    near [rel __imp_QueryPerformanceCounter]; 0009 _ FF. 15, 00000000(rel)
        mov     rax, qword [rel Period]                 ; 000F _ 48: 8B. 05, 00000000(rel)
        mul     qword [rsp+28H]                         ; 0016 _ 48: F7. 64 24, 28
        xchg    rdx, rax                                ; 001B _ 48: 92
        add     rsp, 56                                 ; 001D _ 48: 83. C4, 38
        ret                                             ; 0021 _ C3

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH
;       db 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_Z8MiscInitv:; Function begin
        push    rbx                                     ; 0030 _ 53
        sub     rsp, 32                                 ; 0031 _ 48: 83. EC, 20
        mov     rbx, qword [rel __imp_GetStdHandle]     ; 0035 _ 48: 8B. 1D, 00000000(rel)
        mov     ecx, 4294967286                         ; 003C _ B9, FFFFFFF6
        call    rbx                                     ; 0041 _ FF. D3
        mov     ecx, 4294967285                         ; 0043 _ B9, FFFFFFF5
        mov     qword [rel hStdIn], rax                 ; 0048 _ 48: 89. 05, 00000020(rel)
        call    rbx                                     ; 004F _ FF. D3
        mov     ecx, 4294967284                         ; 0051 _ B9, FFFFFFF4
        mov     qword [rel hStdOut], rax                ; 0056 _ 48: 89. 05, 00000018(rel)
        call    rbx                                     ; 005D _ FF. D3
        lea     rcx, [rel Frequency]                    ; 005F _ 48: 8D. 0D, 00000008(rel)
        mov     qword [rel hStdError], rax              ; 0066 _ 48: 89. 05, 00000010(rel)
        call    near [rel __imp_QueryPerformanceFrequency]; 006D _ FF. 15, 00000000(rel)
        mov     rcx, qword [rel Frequency]              ; 0073 _ 48: 8B. 0D, 00000008(rel)
        call    _Z10math_2p64dy                         ; 007A _ E8, 00000011
        mov     qword [rel Period], rax                 ; 007F _ 48: 89. 05, 00000000(rel)
        add     rsp, 32                                 ; 0086 _ 48: 83. C4, 20
        pop     rbx                                     ; 008A _ 5B
        ret                                             ; 008B _ C3
; _Z8MiscInitv End of function

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_Z10math_2p64dy:; Function begin
        push    rbx                                     ; 0090 _ 53
        sub     rsp, 32                                 ; 0091 _ 48: 83. EC, 20
        mov     qword [rsp+30H], rcx                    ; 0095 _ 48: 89. 4C 24, 30
        mov     dword [rsp+10H], 64                     ; 009A _ C7. 44 24, 10, 00000040
        mov     dword [rsp+14H], 1000                   ; 00A2 _ C7. 44 24, 14, 000003E8
        fwait                                           ; 00AA _ 9B
        fnstcw  word [rsp+0CH]                          ; 00AB _ D9. 7C 24, 0C
        fwait                                           ; 00AF _ 9B
        fnstcw  word [rsp+0EH]                          ; 00B0 _ D9. 7C 24, 0E
; Note: Length-changing prefix causes delay on Intel processors
        or      word [rsp+0EH], 0C00H                   ; 00B4 _ 66: 81. 4C 24, 0E, 0C00
        fldcw   word [rsp+0EH]                          ; 00BB _ D9. 6C 24, 0E
        fild    dword [rsp+10H]                         ; 00BF _ DB. 44 24, 10
        fild    dword [rsp+14H]                         ; 00C3 _ DB. 44 24, 14
        fscale                                          ; 00C7 _ D9. FD
        fstp    st1                                     ; 00C9 _ DD. D9
        fild    qword [rsp+30H]                         ; 00CB _ DF. 6C 24, 30
        fdivp   st1, st(0)                              ; 00CF _ DE. F9
        fistp   qword [rsp+18H]                         ; 00D1 _ DF. 7C 24, 18
        fldcw   word [rsp+0CH]                          ; 00D5 _ D9. 6C 24, 0C
        mov     rax, qword [rsp+18H]                    ; 00D9 _ 48: 8B. 44 24, 18
        add     rsp, 32                                 ; 00DE _ 48: 83. C4, 20
        pop     rbx                                     ; 00E2 _ 5B
        ret                                             ; 00E3 _ C3
; _Z10math_2p64dy End of function

; Filling space: 0CH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H
;       db 00H, 00H, 00H, 00H

ALIGN   16

_Z6v_freePv:; Function begin
        mov     rax, qword [rel __imp_VirtualFree]      ; 00F0 _ 48: 8B. 05, 00000000(rel)
        mov     r8d, 32768                              ; 00F7 _ 41: B8, 00008000
        xor     edx, edx                                ; 00FD _ 31. D2
; Note: Prefix valid but unnecessary
; Note: Prefix bit or byte has no meaning in this context
        jmp     rax                                     ; 00FF _ 48: FF. E0
; _Z6v_freePv End of function

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH
;       db 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_Z7v_allocy:; Function begin
        mov     rax, qword [rel __imp_VirtualAlloc]     ; 0110 _ 48: 8B. 05, 00000000(rel)
        mov     r9d, 4                                  ; 0117 _ 41: B9, 00000004
        mov     r8d, 4096                               ; 011D _ 41: B8, 00001000
        mov     rdx, rcx                                ; 0123 _ 48: 89. CA
        xor     ecx, ecx                                ; 0126 _ 31. C9
; Note: Prefix valid but unnecessary
; Note: Prefix bit or byte has no meaning in this context
        jmp     rax                                     ; 0128 _ 48: FF. E0
; _Z7v_allocy End of function

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_Z9parse_intPKcRi:; Function begin
        mov     rax, rcx                                ; 0130 _ 48: 89. C8
        movzx   r8d, byte [rax]                         ; 0133 _ 44: 0F B6. 00
        cmp     r8b, 32                                 ; 0137 _ 41: 80. F8, 20
        je      _Z9parse_intPKcRi.cold.0                ; 013B _ 0F 84, 00000000(rel)
        cmp     r8b, 45                                 ; 0141 _ 41: 80. F8, 2D
        je      .text.unlikely+12H                      ; 0145 _ 0F 84, 00000012(rel)
        cmp     r8b, 43                                 ; 014B _ 41: 80. F8, 2B
        mov     r10d, 1                                 ; 014F _ 41: BA, 00000001
        sete    cl                                      ; 0155 _ 0F 94. C1
        movzx   r9d, cl                                 ; 0158 _ 44: 0F B6. C9
        add     rax, r9                                 ; 015C _ 4C: 01. C8
        cmp     byte [rax], 32                          ; 015F _ 80. 38, 20
        je      .text.unlikely+9H                       ; 0162 _ 0F 84, 00000009(rel)
        xor     r9d, r9d                                ; 0168 _ 45: 31. C9
?_001:  movsx   r11d, byte [rax]                        ; 016B _ 44: 0F BE. 18
        lea     r8d, [r11-30H]                          ; 016F _ 45: 8D. 43, D0
        cmp     r8b, 9                                  ; 0173 _ 41: 80. F8, 09
        ja      ?_002                                   ; 0177 _ 77, 0F
        imul    ecx, r9d, 10                            ; 0179 _ 41: 6B. C9, 0A
        add     rax, 1                                  ; 017D _ 48: 83. C0, 01
        lea     r9d, [rcx+r11-30H]                      ; 0181 _ 46: 8D. 4C 19, D0
        jmp     ?_001                                   ; 0186 _ EB, E3
; _Z9parse_intPKcRi End of function

?_002:  ; Local function
        imul    r9d, r10d                               ; 0188 _ 45: 0F AF. CA
        mov     dword [rdx], r9d                        ; 018C _ 44: 89. 0A
        ret                                             ; 018F _ C3

_Z12print_stringPcPKc:; Function begin
        mov     rax, rcx                                ; 0190 _ 48: 89. C8
        jmp     ?_004                                   ; 0193 _ EB, 03

?_003:  mov     rax, r9                                 ; 0195 _ 4C: 89. C8
?_004:  movzx   r8d, byte [rdx]                         ; 0198 _ 44: 0F B6. 02
        lea     r9, [rax+1H]                            ; 019C _ 4C: 8D. 48, 01
        add     rdx, 1                                  ; 01A0 _ 48: 83. C2, 01
        test    r8b, r8b                                ; 01A4 _ 45: 84. C0
        mov     byte [r9-1H], r8b                       ; 01A7 _ 45: 88. 41, FF
        jnz     ?_003                                   ; 01AB _ 75, E8
        ret                                             ; 01AD _ C3
; _Z12print_stringPcPKc End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

_Z9write_outPcS_:; Function begin
        sub     rsp, 72                                 ; 01B0 _ 48: 83. EC, 48
        mov     qword [rsp+20H], 0                      ; 01B4 _ 48: C7. 44 24, 20, 00000000
        lea     r9, [rsp+3CH]                           ; 01BD _ 4C: 8D. 4C 24, 3C
        mov     r8d, edx                                ; 01C2 _ 41: 89. D0
        mov     rdx, rcx                                ; 01C5 _ 48: 89. CA
        sub     r8d, ecx                                ; 01C8 _ 41: 29. C8
        mov     rcx, qword [rel hStdOut]                ; 01CB _ 48: 8B. 0D, 00000018(rel)
        call    near [rel __imp_WriteFile]              ; 01D2 _ FF. 15, 00000000(rel)
        test    eax, eax                                ; 01D8 _ 85. C0
        setne   al                                      ; 01DA _ 0F 95. C0
        add     rsp, 72                                 ; 01DD _ 48: 83. C4, 48
        ret                                             ; 01E1 _ C3
; _Z9write_outPcS_ End of function

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH
;       db 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_Z17print_engine_infoPc:; Function begin
        lea     rdx, [rel ?_035]                        ; 01F0 _ 48: 8D. 15, 00000000(rel)
        mov     rax, rcx                                ; 01F7 _ 48: 89. C8
        jmp     ?_006                                   ; 01FA _ EB, 03

?_005:  mov     rax, r9                                 ; 01FC _ 4C: 89. C8
?_006:  movzx   r8d, byte [rdx]                         ; 01FF _ 44: 0F B6. 02
        lea     r9, [rax+1H]                            ; 0203 _ 4C: 8D. 48, 01
        add     rdx, 1                                  ; 0207 _ 48: 83. C2, 01
        test    r8b, r8b                                ; 020B _ 45: 84. C0
        mov     byte [r9-1H], r8b                       ; 020E _ 45: 88. 41, FF
        jnz     ?_005                                   ; 0212 _ 75, E8
        ret                                             ; 0214 _ C3
; _Z17print_engine_infoPc End of function

; Filling space: 0BH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H

ALIGN   16

_Z14parse_gettokenPKcPc:; Function begin
        mov     rax, rcx                                ; 0220 _ 48: 89. C8
        cmp     byte [rax], 32                          ; 0223 _ 80. 38, 20
        jnz     ?_008                                   ; 0226 _ 75, 0D
        jmp     ?_009                                   ; 0228 _ EB, 17

?_007:  add     rdx, 1                                  ; 022A _ 48: 83. C2, 01
        add     rax, 1                                  ; 022E _ 48: 83. C0, 01
        mov     byte [rdx-1H], cl                       ; 0232 _ 88. 4A, FF
?_008:  movzx   ecx, byte [rax]                         ; 0235 _ 0F B6. 08
        cmp     cl, 32                                  ; 0238 _ 80. F9, 20
        jg      ?_007                                   ; 023B _ 7F, ED
        mov     byte [rdx], 0                           ; 023D _ C6. 02, 00
        ret                                             ; 0240 _ C3
; _Z14parse_gettokenPKcPc End of function

?_009:  ; Local function
        jmp     _Z14parse_gettokenPKcPc.cold.1          ; 0241 _ E9, 0000001F(rel)

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

_Z9print_intPcy:; Function begin
        push    rbx                                     ; 0250 _ 53
        sub     rsp, 32                                 ; 0251 _ 48: 83. EC, 20
        mov     ebx, 10                                 ; 0255 _ BB, 0000000A
        mov     rax, rdx                                ; 025A _ 48: 89. D0
        mov     r8, rdx                                 ; 025D _ 49: 89. D0
        xor     edx, edx                                ; 0260 _ 31. D2
        div     rbx                                     ; 0262 _ 48: F7. F3
        test    rax, rax                                ; 0265 _ 48: 85. C0
        mov     rbx, rdx                                ; 0268 _ 48: 89. D3
        jz      ?_010                                   ; 026B _ 74, 10
        test    r8, r8                                  ; 026D _ 4D: 85. C0
        jz      ?_010                                   ; 0270 _ 74, 0B
        mov     rdx, rax                                ; 0272 _ 48: 89. C2
        call    _Z9print_intPcy                         ; 0275 _ E8, FFFFFFD6
        mov     rcx, rax                                ; 027A _ 48: 89. C1
?_010:  lea     rax, [rcx+1H]                           ; 027D _ 48: 8D. 41, 01
        add     ebx, 48                                 ; 0281 _ 83. C3, 30
        mov     byte [rcx], bl                          ; 0284 _ 88. 19
        add     rsp, 32                                 ; 0286 _ 48: 83. C4, 20
        pop     rbx                                     ; 028A _ 5B
        ret                                             ; 028B _ C3
; _Z9print_intPcy End of function

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_Z11write_errorPcS_:; Function begin
        sub     rsp, 72                                 ; 0290 _ 48: 83. EC, 48
        mov     qword [rsp+20H], 0                      ; 0294 _ 48: C7. 44 24, 20, 00000000
        lea     r9, [rsp+3CH]                           ; 029D _ 4C: 8D. 4C 24, 3C
        mov     r8d, edx                                ; 02A2 _ 41: 89. D0
        mov     rdx, rcx                                ; 02A5 _ 48: 89. CA
        sub     r8d, ecx                                ; 02A8 _ 41: 29. C8
        mov     rcx, qword [rel hStdError]              ; 02AB _ 48: 8B. 0D, 00000010(rel)
        call    near [rel __imp_WriteFile]              ; 02B2 _ FF. 15, 00000000(rel)
        test    eax, eax                                ; 02B8 _ 85. C0
        setne   al                                      ; 02BA _ 0F 95. C0
        add     rsp, 72                                 ; 02BD _ 48: 83. C4, 48
        ret                                             ; 02C1 _ C3
; _Z11write_errorPcS_ End of function

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH
;       db 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_Z9print_intPci:; Function begin
        test    edx, edx                                ; 02D0 _ 85. D2
        js      ?_012                                   ; 02D2 _ 78, 08
?_011:  movsxd  rdx, edx                                ; 02D4 _ 48: 63. D2
        jmp     _Z9print_intPcy                         ; 02D7 _ E9, FFFFFF74
; _Z9print_intPci End of function

?_012:  ; Local function
        mov     byte [rcx], 45                          ; 02DC _ C6. 01, 2D
        neg     edx                                     ; 02DF _ F7. DA
        add     rcx, 1                                  ; 02E1 _ 48: 83. C1, 01
        jmp     ?_011                                   ; 02E5 _ EB, ED

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16

_Z9print_intPcx:; Function begin
        test    rdx, rdx                                ; 02F0 _ 48: 85. D2
        js      _Z9print_intPcx.cold.2                  ; 02F3 _ 0F 88, 00000028(rel)
        jmp     _Z9print_intPcy                         ; 02F9 _ E9, FFFFFF52
; _Z9print_intPcx End of function

        nop                                             ; 02FE _ 90
        nop                                             ; 02FF _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=16 noexecute                      ; section number 3, bss

Period:                                                 ; qword
        resq    1                                       ; 0000

Frequency:                                              ; qword
        resq    1                                       ; 0008

hStdError:                                              ; qword
        resq    1                                       ; 0010

hStdOut: resq   1                                       ; 0018

hStdIn: resq    2                                       ; 0020


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_Z9parse_intPKcRi.cold.0:
        add     rax, 1                                  ; 0000 _ 48: 83. C0, 01
        jmp     .text+133H                              ; 0004 _ E9, 00000133(rel)

        add     rax, 1                                  ; 0009 _ 48: 83. C0, 01
        jmp     .text+15FH                              ; 000D _ E9, 0000015F(rel)

        add     rax, 1                                  ; 0012 _ 48: 83. C0, 01
        or      r10d, 0FFFFFFFFH                        ; 0016 _ 41: 83. CA, FF
        jmp     .text+15FH                              ; 001A _ E9, 0000015F(rel)

_Z14parse_gettokenPKcPc.cold.1:; Local function
        add     rax, 1                                  ; 001F _ 48: 83. C0, 01
        jmp     .text+223H                              ; 0023 _ E9, 00000223(rel)

_Z9print_intPcx.cold.2:; Local function
        mov     byte [rcx], 45                          ; 0028 _ C6. 01, 2D
        neg     rdx                                     ; 002B _ 48: F7. DA
        add     rcx, 1                                  ; 002E _ 48: 83. C1, 01
        jmp     .text+2F9H                              ; 0032 _ E9, 000002F9(rel)

_Z8math_expd:; Function begin
        push    rbx                                     ; 0037 _ 53
        sub     rsp, 32                                 ; 0038 _ 48: 83. EC, 20
        movsd   qword [rsp+8H], xmm0                    ; 003C _ F2: 0F 11. 44 24, 08
        fld     qword [rsp+8H]                          ; 0042 _ DD. 44 24, 08
        fwait                                           ; 0046 _ 9B
        fnstcw  word [rsp+1CH]                          ; 0047 _ D9. 7C 24, 1C
        fwait                                           ; 004B _ 9B
        fnstcw  word [rsp+1EH]                          ; 004C _ D9. 7C 24, 1E
; Note: Length-changing prefix causes delay on Intel processors
        or      word [rsp+1EH], 0C00H                   ; 0050 _ 66: 81. 4C 24, 1E, 0C00
        fldcw   word [rsp+1EH]                          ; 0057 _ D9. 6C 24, 1E
        fldl2e                                          ; 005B _ D9. EA
        fmulp   st1, st(0)                              ; 005D _ DE. C9
        fld     st0                                     ; 005F _ D9. C0
        frndint                                         ; 0061 _ D9. FC
        fxch    st1                                     ; 0063 _ D9. C9
        fsub    st(0), st1                              ; 0065 _ D8. E1
        f2xm1                                           ; 0067 _ D9. F0
        fld1                                            ; 0069 _ D9. E8
        faddp   st1, st(0)                              ; 006B _ DE. C1
        fxch    st1                                     ; 006D _ D9. C9
        fld1                                            ; 006F _ D9. E8
        fscale                                          ; 0071 _ D9. FD
        fstp    st1                                     ; 0073 _ DD. D9
        fmulp   st1, st(0)                              ; 0075 _ DE. C9
        fldcw   word [rsp+1CH]                          ; 0077 _ D9. 6C 24, 1C
        fstp    qword [rsp+8H]                          ; 007B _ DD. 5C 24, 08
        movsd   xmm0, qword [rsp+8H]                    ; 007F _ F2: 0F 10. 44 24, 08
        add     rsp, 32                                 ; 0085 _ 48: 83. C4, 20
        pop     rbx                                     ; 0089 _ 5B
        ret                                             ; 008A _ C3
; _Z8math_expd End of function

_Z11print_hex64Pcy:; Function begin
        mov     eax, 15                                 ; 008B _ B8, 0000000F
        mov     byte [rcx], 48                          ; 0090 _ C6. 01, 30
        lea     r9, [rcx+2H]                            ; 0093 _ 4C: 8D. 49, 02
        mov     byte [rcx+1H], 120                      ; 0097 _ C6. 41, 01, 78
?_013:  lea     r8d, [rax*4]                            ; 009B _ 44: 8D. 04 85, 00000000
        inc     r9                                      ; 00A3 _ 49: FF. C1
        shrx    r8, rdx, r8                             ; 00A6 _ C4 62 BB: F7. C2
        and     r8d, 0FH                                ; 00AB _ 41: 83. E0, 0F
        lea     r10d, [r8+30H]                          ; 00AF _ 45: 8D. 50, 30
        cmp     r8d, 9                                  ; 00B3 _ 41: 83. F8, 09
        lea     r11d, [r8+37H]                          ; 00B7 _ 45: 8D. 58, 37
        cmovbe  r11d, r10d                              ; 00BB _ 45: 0F 46. DA
        dec     eax                                     ; 00BF _ FF. C8
        cmp     eax, -1                                 ; 00C1 _ 83. F8, FF
        mov     byte [r9-1H], r11b                      ; 00C4 _ 45: 88. 59, FF
        jnz     ?_013                                   ; 00C8 _ 75, D1
        lea     rax, [rcx+12H]                          ; 00CA _ 48: 8D. 41, 12
        ret                                             ; 00CE _ C3
; _Z11print_hex64Pcy End of function

_Z7read_inPc:; Function begin
        push    rdi                                     ; 00CF _ 57
        push    rsi                                     ; 00D0 _ 56
        push    rbx                                     ; 00D1 _ 53
        sub     rsp, 64                                 ; 00D2 _ 48: 83. EC, 40
        mov     rsi, qword [rel __imp_ReadFile]         ; 00D6 _ 48: 8B. 35, 00000000(rel)
        lea     rdi, [rsp+3CH]                          ; 00DD _ 48: 8D. 7C 24, 3C
        mov     rbx, rcx                                ; 00E2 _ 48: 89. CB
?_014:  mov     rdx, rbx                                ; 00E5 _ 48: 89. DA
        mov     r9, rdi                                 ; 00E8 _ 49: 89. F9
        mov     qword [rsp+20H], 0                      ; 00EB _ 48: C7. 44 24, 20, 00000000
        mov     r8d, 1                                  ; 00F4 _ 41: B8, 00000001
        mov     rcx, qword [rel hStdIn]                 ; 00FA _ 48: 8B. 0D, 00000020(rel)
        call    rsi                                     ; 0101 _ FF. D6
        mov     dl, byte [rbx]                          ; 0103 _ 8A. 13
        test    eax, eax                                ; 0105 _ 85. C0
        jz      ?_015                                   ; 0107 _ 74, 07
        cmp     dword [rsp+3CH], 0                      ; 0109 _ 83. 7C 24, 3C, 00
        jz      ?_016                                   ; 010E _ 74, 0A
?_015:  cmp     dl, 31                                  ; 0110 _ 80. FA, 1F
        jle     ?_017                                   ; 0113 _ 7E, 09
        inc     rbx                                     ; 0115 _ 48: FF. C3
        jmp     ?_014                                   ; 0118 _ EB, CB

?_016:  mov     al, 1                                   ; 011A _ B0, 01
        jmp     ?_018                                   ; 011C _ EB, 05

?_017:  mov     byte [rbx], 0                           ; 011E _ C6. 03, 00
        xor     eax, eax                                ; 0121 _ 31. C0
?_018:  add     rsp, 64                                 ; 0123 _ 48: 83. C4, 40
        pop     rbx                                     ; 0127 _ 5B
        pop     rsi                                     ; 0128 _ 5E
        pop     rdi                                     ; 0129 _ 5F
        ret                                             ; 012A _ C3
; _Z7read_inPc End of function

_Z12print_doublePcd:; Function begin
        push    rbx                                     ; 012B _ 53
        sub     rsp, 32                                 ; 012C _ 48: 83. EC, 20
        mulsd   xmm1, qword [rel ?_036]                 ; 0130 _ F2: 0F 59. 0D, 00000020(rel)
        cvttsd2si rax, xmm1                             ; 0138 _ F2 48: 0F 2C. C1
        test    rax, rax                                ; 013D _ 48: 85. C0
        jns     ?_019                                   ; 0140 _ 79, 09
        mov     byte [rcx], 45                          ; 0142 _ C6. 01, 2D
        neg     rax                                     ; 0145 _ 48: F7. D8
        inc     rcx                                     ; 0148 _ 48: FF. C1
?_019:  mov     ebx, 100                                ; 014B _ BB, 00000064
        xor     edx, edx                                ; 0150 _ 31. D2
        div     rbx                                     ; 0152 _ 48: F7. F3
        mov     rbx, rdx                                ; 0155 _ 48: 89. D3
        mov     rdx, rax                                ; 0158 _ 48: 89. C2
        call    _Z9print_intPcy                         ; 015B _ E8, 00000250(rel)
        mov     r8d, 10                                 ; 0160 _ 41: B8, 0000000A
        xor     edx, edx                                ; 0166 _ 31. D2
        mov     rcx, rax                                ; 0168 _ 48: 89. C1
        mov     byte [rax], 46                          ; 016B _ C6. 00, 2E
        mov     rax, rbx                                ; 016E _ 48: 89. D8
        div     r8                                      ; 0171 _ 49: F7. F0
        lea     r9d, [rax+30H]                          ; 0174 _ 44: 8D. 48, 30
        add     edx, 48                                 ; 0178 _ 83. C2, 30
        lea     rax, [rcx+3H]                           ; 017B _ 48: 8D. 41, 03
        mov     byte [rcx+1H], r9b                      ; 017F _ 44: 88. 49, 01
        mov     byte [rcx+2H], dl                       ; 0183 _ 88. 51, 02
        add     rsp, 32                                 ; 0186 _ 48: 83. C4, 20
        pop     rbx                                     ; 018A _ 5B
        ret                                             ; 018B _ C3
; _Z12print_doublePcd End of function

_Z13print_vstringPcS_:; Function begin
        mov     rax, rcx                                ; 018C _ 48: 89. C8
?_020:  mov     cl, byte [rdx]                          ; 018F _ 8A. 0A
        lea     r8, [rax+1H]                            ; 0191 _ 4C: 8D. 40, 01
        inc     rdx                                     ; 0195 _ 48: FF. C2
        test    cl, cl                                  ; 0198 _ 84. C9
        mov     byte [r8-1H], cl                        ; 019A _ 41: 88. 48, FF
        jz      ?_021                                   ; 019E _ 74, 05
        mov     rax, r8                                 ; 01A0 _ 4C: 89. C0
        jmp     ?_020                                   ; 01A3 _ EB, EA
; _Z13print_vstringPcS_ End of function

?_021:  ; Local function
        ret                                             ; 01A5 _ C3

_Z17parse_token_lowerPKcPc:; Function begin
        cmp     byte [rcx], 32                          ; 01A6 _ 80. 39, 20
        lea     rcx, [rcx+1H]                           ; 01A9 _ 48: 8D. 49, 01
        jz      _Z17parse_token_lowerPKcPc              ; 01AD _ 74, F7
?_022:  mov     r8b, byte [rcx-1H]                      ; 01AF _ 44: 8A. 41, FF
        lea     rax, [rcx-1H]                           ; 01B3 _ 48: 8D. 41, FF
        inc     rdx                                     ; 01B7 _ 48: FF. C2
        cmp     r8b, 32                                 ; 01BA _ 41: 80. F8, 20
        jle     ?_023                                   ; 01BE _ 7E, 19
        lea     r9d, [r8-41H]                           ; 01C0 _ 45: 8D. 48, BF
        lea     eax, [r8+20H]                           ; 01C4 _ 41: 8D. 40, 20
        cmp     r9b, 25                                 ; 01C8 _ 41: 80. F9, 19
        cmovbe  r8d, eax                                ; 01CC _ 44: 0F 46. C0
        inc     rcx                                     ; 01D0 _ 48: FF. C1
        mov     byte [rdx-1H], r8b                      ; 01D3 _ 44: 88. 42, FF
        jmp     ?_022                                   ; 01D7 _ EB, D6
; _Z17parse_token_lowerPKcPc End of function

?_023:  ; Local function
        mov     byte [rdx-1H], 0                        ; 01D9 _ C6. 42, FF, 00
        ret                                             ; 01DD _ C3

_Z9parse_intPKcRy:; Function begin
        mov     rax, rcx                                ; 01DE _ 48: 89. C8
?_024:  cmp     byte [rax], 32                          ; 01E1 _ 80. 38, 20
        jnz     ?_025                                   ; 01E4 _ 75, 05
        inc     rax                                     ; 01E6 _ 48: FF. C0
        jmp     ?_024                                   ; 01E9 _ EB, F6
; _Z9parse_intPKcRy End of function

?_025:  ; Local function
        xor     ecx, ecx                                ; 01EB _ 31. C9
?_026:  movsx   r8d, byte [rax]                         ; 01ED _ 44: 0F BE. 00
        lea     r9d, [r8-30H]                           ; 01F1 _ 45: 8D. 48, D0
        cmp     r9b, 9                                  ; 01F5 _ 41: 80. F9, 09
        ja      ?_027                                   ; 01F9 _ 77, 13
        imul    rcx, rcx, 10                            ; 01FB _ 48: 6B. C9, 0A
        sub     r8d, 48                                 ; 01FF _ 41: 83. E8, 30
        inc     rax                                     ; 0203 _ 48: FF. C0
        movsxd  r10, r8d                                ; 0206 _ 4D: 63. D0
        add     rcx, r10                                ; 0209 _ 4C: 01. D1
        jmp     ?_026                                   ; 020C _ EB, DF

?_027:  ; Local function
        mov     qword [rdx], rcx                        ; 020E _ 48: 89. 0A
        ret                                             ; 0211 _ C3

_Z8math_logd:; Function begin
        push    rbx                                     ; 0212 _ 53
        sub     rsp, 32                                 ; 0213 _ 48: 83. EC, 20
        movsd   qword [rsp+8H], xmm0                    ; 0217 _ F2: 0F 11. 44 24, 08
        fld     qword [rsp+8H]                          ; 021D _ DD. 44 24, 08
        fwait                                           ; 0221 _ 9B
        fnstcw  word [rsp+1CH]                          ; 0222 _ D9. 7C 24, 1C
        fwait                                           ; 0226 _ 9B
        fnstcw  word [rsp+1EH]                          ; 0227 _ D9. 7C 24, 1E
; Note: Length-changing prefix causes delay on Intel processors
        or      word [rsp+1EH], 0C00H                   ; 022B _ 66: 81. 4C 24, 1E, 0C00
        fldcw   word [rsp+1EH]                          ; 0232 _ D9. 6C 24, 1E
        fldln2                                          ; 0236 _ D9. ED
        fxch    st1                                     ; 0238 _ D9. C9
        fyl2x                                           ; 023A _ D9. F1
        fldcw   word [rsp+1CH]                          ; 023C _ D9. 6C 24, 1C
        fstp    qword [rsp+8H]                          ; 0240 _ DD. 5C 24, 08
        movsd   xmm0, qword [rsp+8H]                    ; 0244 _ F2: 0F 10. 44 24, 08
        add     rsp, 32                                 ; 024A _ 48: 83. C4, 20
        pop     rbx                                     ; 024E _ 5B
        ret                                             ; 024F _ C3
; _Z8math_logd End of function

_Z9parse_intPKcRx:; Function begin
        mov     rax, rcx                                ; 0250 _ 48: 89. C8
?_028:  mov     cl, byte [rax]                          ; 0253 _ 8A. 08
        cmp     cl, 32                                  ; 0255 _ 80. F9, 20
        jnz     ?_029                                   ; 0258 _ 75, 05
        inc     rax                                     ; 025A _ 48: FF. C0
        jmp     ?_028                                   ; 025D _ EB, F4
; _Z9parse_intPKcRx End of function

?_029:  ; Local function
        cmp     cl, 45                                  ; 025F _ 80. F9, 2D
        jnz     ?_030                                   ; 0262 _ 75, 09
        inc     rax                                     ; 0264 _ 48: FF. C0
        or      r9, 0FFFFFFFFFFFFFFFFH                  ; 0267 _ 49: 83. C9, FF
        jmp     ?_031                                   ; 026B _ EB, 14

?_030:  cmp     cl, 43                                  ; 026D _ 80. F9, 2B
        mov     r9d, 1                                  ; 0270 _ 41: B9, 00000001
        sete    r8b                                     ; 0276 _ 41: 0F 94. C0
        movzx   r10d, r8b                               ; 027A _ 45: 0F B6. D0
        add     rax, r10                                ; 027E _ 4C: 01. D0
?_031:  cmp     byte [rax], 32                          ; 0281 _ 80. 38, 20
        jnz     ?_032                                   ; 0284 _ 75, 05
        inc     rax                                     ; 0286 _ 48: FF. C0
        jmp     ?_031                                   ; 0289 _ EB, F6

?_032:  ; Local function
        xor     r10d, r10d                              ; 028B _ 45: 31. D2
?_033:  movsx   r11d, byte [rax]                        ; 028E _ 44: 0F BE. 18
        lea     ecx, [r11-30H]                          ; 0292 _ 41: 8D. 4B, D0
        cmp     cl, 9                                   ; 0296 _ 80. F9, 09
        ja      ?_034                                   ; 0299 _ 77, 13
        imul    r10, r10, 10                            ; 029B _ 4D: 6B. D2, 0A
        sub     r11d, 48                                ; 029F _ 41: 83. EB, 30
        inc     rax                                     ; 02A3 _ 48: FF. C0
        movsxd  r11, r11d                               ; 02A6 _ 4D: 63. DB
        add     r10, r11                                ; 02A9 _ 4D: 01. DA
        jmp     ?_033                                   ; 02AC _ EB, E0

?_034:  ; Local function
        mov     r8, r10                                 ; 02AE _ 4D: 89. D0
        imul    r8, r9                                  ; 02B1 _ 4D: 0F AF. C1
        mov     qword [rdx], r8                         ; 02B5 _ 4C: 89. 02
        ret                                             ; 02B8 _ C3

        nop                                             ; 02B9 _ 90
        nop                                             ; 02BA _ 90
        nop                                             ; 02BB _ 90
        nop                                             ; 02BC _ 90
        nop                                             ; 02BD _ 90
        nop                                             ; 02BE _ 90
        nop                                             ; 02BF _ 90


SECTION .xdata  align=4 noexecute                       ; section number 5, const

        db 01H, 04H, 01H, 00H, 04H, 62H, 00H, 00H       ; 0000 _ .....b..
        db 01H, 05H, 02H, 00H, 05H, 32H, 01H, 30H       ; 0008 _ .....2.0
        db 01H, 05H, 02H, 00H, 05H, 32H, 01H, 30H       ; 0010 _ .....2.0
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0018 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0020 _ ........
        db 01H, 04H, 01H, 00H, 04H, 82H, 00H, 00H       ; 0028 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0030 _ ........
        db 01H, 05H, 02H, 00H, 05H, 32H, 01H, 30H       ; 0038 _ .....2.0
        db 01H, 04H, 01H, 00H, 04H, 82H, 00H, 00H       ; 0040 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0048 _ ........


SECTION .rdata  align=16 noexecute                      ; section number 7, const

?_035:                                                  ; byte
        db 53H, 74H, 6FH, 63H, 6BH, 66H, 69H, 73H       ; 0000 _ Stockfis
        db 68H, 20H, 2DH, 20H, 6CH, 65H, 61H, 6EH       ; 0008 _ h - lean
        db 20H, 61H, 6EH, 64H, 20H, 6DH, 65H, 61H       ; 0010 _  and mea
        db 6EH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ n.......

?_036:  dq 4059000000000000H                            ; 0020 _ 100.0 
        dq 0000000000000000H                            ; 0028 _ 0.0 


SECTION .text.hot align=16 execute                      ; section number 8, code

.text.hot:; Local function

_Z8math_powdd:
        push    rsi                                     ; 0000 _ 56
        push    rbx                                     ; 0001 _ 53
        sub     rsp, 40                                 ; 0002 _ 48: 83. EC, 28
        movsd   qword [rsp+8H], xmm0                    ; 0006 _ F2: 0F 11. 44 24, 08
        fld     qword [rsp+8H]                          ; 000C _ DD. 44 24, 08
        movsd   qword [rsp+8H], xmm1                    ; 0010 _ F2: 0F 11. 4C 24, 08
        fld     qword [rsp+8H]                          ; 0016 _ DD. 44 24, 08
        fxch    st1                                     ; 001A _ D9. C9
        ftst                                            ; 001C _ D9. E4
        fwait                                           ; 001E _ 9B
        fnstsw  ax                                      ; 001F _ DF. E0
        and     ah, 40H                                 ; 0021 _ 80. E4, 40
        jz      ?_038                                   ; 0024 _ 74, 16
        fstp    st0                                     ; 0026 _ DD. D8
        ftst                                            ; 0028 _ D9. E4
        fwait                                           ; 002A _ 9B
        fnstsw  ax                                      ; 002B _ DF. E0
        fstp    st0                                     ; 002D _ DD. D8
        and     ah, 40H                                 ; 002F _ 80. E4, 40
        jnz     ?_037                                   ; 0032 _ 75, 04
        fldz                                            ; 0034 _ D9. EE
        jmp     ?_039                                   ; 0036 _ EB, 3D

?_037:  fld1                                            ; 0038 _ D9. E8
        jmp     ?_039                                   ; 003A _ EB, 39

?_038:  fwait                                           ; 003C _ 9B
        fnstcw  word [rsp+1CH]                          ; 003D _ D9. 7C 24, 1C
        fwait                                           ; 0041 _ 9B
        fnstcw  word [rsp+1EH]                          ; 0042 _ D9. 7C 24, 1E
; Note: Length-changing prefix causes delay on Intel processors
        or      word [rsp+1EH], 0C00H                   ; 0046 _ 66: 81. 4C 24, 1E, 0C00
        fldcw   word [rsp+1EH]                          ; 004D _ D9. 6C 24, 1E
        fld1                                            ; 0051 _ D9. E8
        fxch    st1                                     ; 0053 _ D9. C9
        fyl2x                                           ; 0055 _ D9. F1
        fmulp   st1, st(0)                              ; 0057 _ DE. C9
        fld     st0                                     ; 0059 _ D9. C0
        frndint                                         ; 005B _ D9. FC
        fxch    st1                                     ; 005D _ D9. C9
        fsub    st(0), st1                              ; 005F _ D8. E1
        f2xm1                                           ; 0061 _ D9. F0
        fld1                                            ; 0063 _ D9. E8
        faddp   st1, st(0)                              ; 0065 _ DE. C1
        fxch    st1                                     ; 0067 _ D9. C9
        fld1                                            ; 0069 _ D9. E8
        fscale                                          ; 006B _ D9. FD
        fstp    st1                                     ; 006D _ DD. D9
        fmulp   st1, st(0)                              ; 006F _ DE. C9
        fldcw   word [rsp+1CH]                          ; 0071 _ D9. 6C 24, 1C
?_039:  fstp    qword [rsp+8H]                          ; 0075 _ DD. 5C 24, 08
        movsd   xmm0, qword [rsp+8H]                    ; 0079 _ F2: 0F 10. 44 24, 08
        add     rsp, 40                                 ; 007F _ 48: 83. C4, 28
        pop     rbx                                     ; 0083 _ 5B
        pop     rsi                                     ; 0084 _ 5E
        ret                                             ; 0085 _ C3

        nop                                             ; 0086 _ 90
        nop                                             ; 0087 _ 90
        nop                                             ; 0088 _ 90
        nop                                             ; 0089 _ 90
        nop                                             ; 008A _ 90
        nop                                             ; 008B _ 90
        nop                                             ; 008C _ 90
        nop                                             ; 008D _ 90
        nop                                             ; 008E _ 90
        nop                                             ; 008F _ 90


SECTION .xdata.hot align=4 noexecute                    ; section number 9, const

        db 01H, 06H, 03H, 00H, 06H, 42H, 02H, 30H       ; 0000 _ .....B.0
        db 01H, 60H, 00H, 00H                           ; 0008 _ .`..


SECTION .xdata.unlikely align=4 noexecute               ; section number 11, const

        db 01H, 05H, 02H, 00H, 05H, 32H, 01H, 30H       ; 0000 _ .....2.0
        db 01H, 00H, 00H, 00H, 01H, 07H, 04H, 00H       ; 0008 _ ........
        db 07H, 72H, 03H, 30H, 02H, 60H, 01H, 70H       ; 0010 _ .r.0.`.p
        db 01H, 05H, 02H, 00H, 05H, 32H, 01H, 30H       ; 0018 _ .....2.0
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0020 _ ........
        db 01H, 00H, 00H, 00H, 01H, 05H, 02H, 00H       ; 0028 _ ........
        db 05H, 32H, 01H, 30H, 01H, 00H, 00H, 00H       ; 0030 _ .2.0....


SECTION .rdata$zzz align=16 noexecute                   ; section number 13, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


