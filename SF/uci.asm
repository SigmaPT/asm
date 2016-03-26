; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\uci.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro, x64

default rel

global _ZN3UCI4loopEiPPc: function
global _ZN3UCI11print_valueEPc5Value: function
global _ZN3UCI10print_moveEPc4Moveb: function
global Opt
global _ZN3UCI10parse_moveERK8PositionPc: function
global _ZN3UCI12print_squareEPc6Square: function
global _ZN10ThreadPool4mainEv: function
global _ZN3UCI7Options13print_optionsEPc: function
global _ZNSt11_Deque_baseI9StateInfoSaIS0_EED2Ev: function
global .weak._ZNSt6vectorI4MoveSaIS0_EE12emplace_backIJS0_EEEvDpOT_._ZN3UCI4loopEiPPc
global _ZNSt6vectorI4MoveSaIS0_EE12emplace_backIIS0_EEEvDpOT_: function
global _ZNSt11_Deque_baseI9StateInfoSaIS0_EE17_M_initialize_mapEy: function
global _ZNSt5dequeI9StateInfoSaIS0_EE22_M_reserve_map_at_backEy: function
global .weak._ZNSt5dequeI9StateInfoSaIS0_EE12emplace_backIJS0_EEEvDpOT_._ZN3UCI4loopEiPPc
global _ZNSt5dequeI9StateInfoSaIS0_EE12emplace_backIIS0_EEEvDpOT_: function
global .refptr.TT
global .refptr.Time
global .refptr._ZN6Search6LimitsE
global .refptr._ZN6Search7SignalsE
global .refptr.Threads

extern Threads                                          ; byte
extern _ZN6Search7SignalsE                              ; byte
extern _ZN6Search6LimitsE                               ; byte
extern Time                                             ; byte
extern TT                                               ; byte
extern memmove                                          ; near
extern _ZSt17__throw_bad_allocv                         ; near
extern _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_  ; near
extern _Z9print_intPci                                  ; near
extern _ZSt24__throw_out_of_range_fmtPKcz               ; near
extern _ZN6Thread15start_searchingEb                    ; near
extern _Z9parse_intPKcRx                                ; near
extern _ZN10ThreadPool14start_thinkingERK8PositionRKN6Search10LimitsTypeERSt10unique_ptrISt5stackI9StateInfoSt5dequeIS9_SaIS9_EEESt14default_deleteISD_EE ; near
extern _ZN8Position7do_moveE4MoveR9StateInfob           ; near
extern _ZNK8Position11gives_checkE4MoveRK9CheckInfo     ; near
extern _ZN9CheckInfoC1ERK8Position                      ; near
extern _ZdlPv                                           ; near
extern _Znwy                                            ; near
extern _Z3nowv                                          ; near
extern _ZN18TranspositionTable6resizeEy                 ; near
extern _ZN10ThreadPool16read_uci_optionsEv              ; near
extern _ZN18TranspositionTable5clearEv                  ; near
extern _ZN10Tablebases4initEPKc                         ; near
extern memcpy                                           ; near
extern _ZdaPv                                           ; near
extern _ZN6Search5clearEv                               ; near
extern _Z17parse_token_lowerPKcPc                       ; near
extern _Z9parse_intPKcRi                                ; near
extern _Z13print_vstringPcS_                            ; near
extern _Z7read_inPc                                     ; near
extern _ZN6Thread24wait_for_search_finishedEv           ; near
extern _Z9benchmarkPKcR8Positioniyy                     ; near
extern strcmp                                           ; near
extern _Z14parse_gettokenPKcPc                          ; near
extern _Z17print_engine_infoPc                          ; near
extern _Z9write_outPcS_                                 ; near
extern _Z12print_stringPcPKc                            ; near
extern _ZN8Position9parse_setEPKcbP6Thread              ; near
extern atexit                                           ; near
extern _Znay                                            ; near
extern ___chkstk_ms                                     ; near


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_ZN3UCI4loopEiPPc:
        push    r15                                     ; 0000 _ 41: 57
        mov     eax, 6680                               ; 0002 _ B8, 00001A18
        push    r14                                     ; 0007 _ 41: 56
        push    r13                                     ; 0009 _ 41: 55
        push    r12                                     ; 000B _ 41: 54
        push    rbp                                     ; 000D _ 55
        push    rdi                                     ; 000E _ 57
        push    rsi                                     ; 000F _ 56
        push    rbx                                     ; 0010 _ 53
        call    ___chkstk_ms                            ; 0011 _ E8, 00000000(rel)
        sub     rsp, rax                                ; 0016 _ 48: 29. C4
        xor     r15d, r15d                              ; 0019 _ 45: 31. FF
        lea     r13, [rsp+240H]                         ; 001C _ 4C: 8D. AC 24, 00000240
        mov     ebp, ecx                                ; 0024 _ 89. CD
        mov     rbx, rdx                                ; 0026 _ 48: 89. D3
        mov     rcx, qword [rel .refptr.Threads]        ; 0029 _ 48: 8B. 0D, 00000000(rel)
        lea     r12, [rsp+610H]                         ; 0030 _ 4C: 8D. A4 24, 00000610
        lea     r14, [rsp+0A10H]                        ; 0038 _ 4C: 8D. B4 24, 00000A10
        call    _ZN10ThreadPool4mainEv                  ; 0040 _ E8, 00000000(rel)
        xor     r8d, r8d                                ; 0045 _ 45: 31. C0
        mov     rcx, r13                                ; 0048 _ 4C: 89. E9
        lea     rdx, [rel ?_075]                        ; 004B _ 48: 8D. 15, 00000000(rel)
        mov     r9, rax                                 ; 0052 _ 49: 89. C1
        call    _ZN8Position9parse_setEPKcbP6Thread     ; 0055 _ E8, 00000000(rel)
        lea     rdx, [rel ?_076]                        ; 005A _ 48: 8D. 15, 00000039(rel)
        mov     rcx, r12                                ; 0061 _ 4C: 89. E1
        call    _Z12print_stringPcPKc                   ; 0064 _ E8, 00000000(rel)
        lea     rdx, [rel ?_077]                        ; 0069 _ 48: 8D. 15, 00000058(rel)
        mov     rcx, rax                                ; 0070 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 0073 _ E8, 00000000(rel)
        lea     rcx, [rel Opt]                          ; 0078 _ 48: 8D. 0D, 00000000(rel)
        mov     rdx, rax                                ; 007F _ 48: 89. C2
        call    _ZN3UCI7Options13print_optionsEPc       ; 0082 _ E8, 00000000(rel)
        lea     rdx, [rel ?_078]                        ; 0087 _ 48: 8D. 15, 00000091(rel)
        mov     rcx, rax                                ; 008E _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 0091 _ E8, 00000000(rel)
        mov     rcx, r12                                ; 0096 _ 4C: 89. E1
        mov     rdx, rax                                ; 0099 _ 48: 89. C2
        call    _Z9write_outPcS_                        ; 009C _ E8, 00000000(rel)
        mov     rcx, r12                                ; 00A1 _ 4C: 89. E1
        call    _Z17print_engine_infoPc                 ; 00A4 _ E8, 00000000(rel)
        mov     rcx, r12                                ; 00A9 _ 4C: 89. E1
        mov     byte [rax], 10                          ; 00AC _ C6. 00, 0A
        lea     rdx, [rax+1H]                           ; 00AF _ 48: 8D. 50, 01
        call    _Z9write_outPcS_                        ; 00B3 _ E8, 00000000(rel)
        mov     rcx, r14                                ; 00B8 _ 4C: 89. F1
        jmp     ?_002                                   ; 00BB _ EB, 15

?_001:  mov     rdx, qword [rbx+r15*8+8H]               ; 00BD _ 4A: 8B. 54 FB, 08
        add     r15, 1                                  ; 00C2 _ 49: 83. C7, 01
        call    _Z12print_stringPcPKc                   ; 00C6 _ E8, 00000000(rel)
        lea     rcx, [rax+1H]                           ; 00CB _ 48: 8D. 48, 01
        mov     byte [rax], 32                          ; 00CF _ C6. 00, 20
?_002:  lea     edx, [r15+1H]                           ; 00D2 _ 41: 8D. 57, 01
        cmp     ebp, edx                                ; 00D6 _ 39. D5
        jg      ?_001                                   ; 00D8 _ 7F, E3
        mov     rbx, qword [rel .refptr._ZN6Search7SignalsE]; 00DA _ 48: 8B. 1D, 00000000(rel)
        lea     r15, [rsp+140H]                         ; 00E1 _ 4C: 8D. BC 24, 00000140
        lea     rcx, [r15+38H]                          ; 00E9 _ 49: 8D. 4F, 38
        mov     qword [rsp+30H], rcx                    ; 00ED _ 48: 89. 4C 24, 30
        mov     qword [rsp+38H], rbx                    ; 00F2 _ 48: 89. 5C 24, 38
?_003:  cmp     ebp, 1                                  ; 00F7 _ 83. FD, 01
        jle     _ZN3UCI4loopEiPPc.cold.74               ; 00FA _ 0F 8E, 00000000(rel)
        lea     rsi, [rsp+0C0H]                         ; 0100 _ 48: 8D. B4 24, 000000C0
        mov     rcx, r14                                ; 0108 _ 4C: 89. F1
        mov     rdx, rsi                                ; 010B _ 48: 89. F2
        call    _Z14parse_gettokenPKcPc                 ; 010E _ E8, 00000000(rel)
        cmp     byte [rsp+0C0H], 31                     ; 0113 _ 80. BC 24, 000000C0, 1F
        mov     rbx, rax                                ; 011B _ 48: 89. C3
        jle     ?_004                                   ; 011E _ 0F 8E, 0000012C
        lea     rdx, [rel ?_079]                        ; 0124 _ 48: 8D. 15, 00000098(rel)
        mov     rcx, rsi                                ; 012B _ 48: 89. F1
        call    strcmp                                  ; 012E _ E8, 00000000(rel)
        test    eax, eax                                ; 0133 _ 85. C0
        je      .text.unlikely+0ADAH                    ; 0135 _ 0F 84, 00000ADA(rel)
        lea     rdx, [rel ?_080]                        ; 013B _ 48: 8D. 15, 0000009D(rel)
        mov     rcx, rsi                                ; 0142 _ 48: 89. F1
        call    strcmp                                  ; 0145 _ E8, 00000000(rel)
        test    eax, eax                                ; 014A _ 85. C0
        je      ?_014                                   ; 014C _ 0F 84, 00000154
        lea     rdx, [rel ?_081]                        ; 0152 _ 48: 8D. 15, 000000A2(rel)
        mov     rcx, rsi                                ; 0159 _ 48: 89. F1
        call    strcmp                                  ; 015C _ E8, 00000000(rel)
        test    eax, eax                                ; 0161 _ 85. C0
        mov     edi, eax                                ; 0163 _ 89. C7
        je      ?_013                                   ; 0165 _ 0F 84, 00000136
        lea     rdx, [rel ?_115]                        ; 016B _ 48: 8D. 15, 000001BD(rel)
        mov     rcx, rsi                                ; 0172 _ 48: 89. F1
        call    strcmp                                  ; 0175 _ E8, 00000000(rel)
        test    eax, eax                                ; 017A _ 85. C0
        je      ?_012                                   ; 017C _ 0F 84, 0000011A
        lea     rdx, [rel ?_083]                        ; 0182 _ 48: 8D. 15, 000000B5(rel)
        mov     rcx, rsi                                ; 0189 _ 48: 89. F1
        call    strcmp                                  ; 018C _ E8, 00000000(rel)
        test    eax, eax                                ; 0191 _ 85. C0
        je      .text.unlikely+463H                     ; 0193 _ 0F 84, 00000463(rel)
        lea     rdx, [rel ?_096]                        ; 0199 _ 48: 8D. 15, 0000010E(rel)
        mov     rcx, rsi                                ; 01A0 _ 48: 89. F1
        call    strcmp                                  ; 01A3 _ E8, 00000000(rel)
        test    eax, eax                                ; 01A8 _ 85. C0
        je      ?_011                                   ; 01AA _ 0F 84, 000000E7
        test    edi, edi                                ; 01B0 _ 85. FF
        je      ?_010                                   ; 01B2 _ 0F 84, 000000DA
        lea     rdx, [rel ?_099]                        ; 01B8 _ 48: 8D. 15, 00000124(rel)
        mov     rcx, rsi                                ; 01BF _ 48: 89. F1
        call    strcmp                                  ; 01C2 _ E8, 00000000(rel)
        test    eax, eax                                ; 01C7 _ 85. C0
        je      ?_009                                   ; 01C9 _ 0F 84, 000000BE
        lea     rdx, [rel ?_100]                        ; 01CF _ 48: 8D. 15, 00000128(rel)
        mov     rcx, rsi                                ; 01D6 _ 48: 89. F1
        call    strcmp                                  ; 01D9 _ E8, 00000000(rel)
        test    eax, eax                                ; 01DE _ 85. C0
        je      ?_008                                   ; 01E0 _ 0F 84, 000000A2
        lea     rdx, [rel ?_101]                        ; 01E6 _ 48: 8D. 15, 00000133(rel)
        mov     rcx, rsi                                ; 01ED _ 48: 89. F1
        call    strcmp                                  ; 01F0 _ E8, 00000000(rel)
        test    eax, eax                                ; 01F5 _ 85. C0
        je      ?_006                                   ; 01F7 _ 0F 84, 00000081
        lea     rdx, [rel ?_112]                        ; 01FD _ 48: 8D. 15, 0000019F(rel)
        mov     rcx, rsi                                ; 0204 _ 48: 89. F1
        call    strcmp                                  ; 0207 _ E8, 00000000(rel)
        test    eax, eax                                ; 020C _ 85. C0
        jz      ?_007                                   ; 020E _ 74, 73
        lea     rdx, [rel ?_113]                        ; 0210 _ 48: 8D. 15, 000001A5(rel)
        mov     rcx, rsi                                ; 0217 _ 48: 89. F1
        call    strcmp                                  ; 021A _ E8, 00000000(rel)
        test    eax, eax                                ; 021F _ 85. C0
        jnz     ?_005                                   ; 0221 _ 75, 56
        mov     r9d, 32                                 ; 0223 _ 41: B9, 00000020
        mov     r8d, 16                                 ; 0229 _ 41: B8, 00000010
        mov     rdx, r13                                ; 022F _ 4C: 89. EA
        mov     qword [rsp+20H], 1                      ; 0232 _ 48: C7. 44 24, 20, 00000001
        lea     rcx, [rel ?_090]                        ; 023B _ 48: 8D. 0D, 000000E4(rel)
        call    _Z9benchmarkPKcR8Positioniyy            ; 0242 _ E8, 00000000(rel)
        cmp     ebp, 1                                  ; 0247 _ 83. FD, 01
        jle     ?_003                                   ; 024A _ 0F 8E, FFFFFEA7
?_004:  mov     rcx, qword [rel .refptr.Threads]        ; 0250 _ 48: 8B. 0D, 00000000(rel)
        call    _ZN10ThreadPool4mainEv                  ; 0257 _ E8, 00000000(rel)
        mov     rcx, rax                                ; 025C _ 48: 89. C1
        call    _ZN6Thread24wait_for_search_finishedEv  ; 025F _ E8, 00000000(rel)
        nop                                             ; 0264 _ 90
        add     rsp, 6680                               ; 0265 _ 48: 81. C4, 00001A18
        pop     rbx                                     ; 026C _ 5B
        pop     rsi                                     ; 026D _ 5E
        pop     rdi                                     ; 026E _ 5F
        pop     rbp                                     ; 026F _ 5D
        pop     r12                                     ; 0270 _ 41: 5C
        pop     r13                                     ; 0272 _ 41: 5D
        pop     r14                                     ; 0274 _ 41: 5E
        pop     r15                                     ; 0276 _ 41: 5F
        ret                                             ; 0278 _ C3

?_005:  jmp     .text.unlikely+3AH                      ; 0279 _ E9, 0000003A(rel)

?_006:  jmp     .text.unlikely+9EH                      ; 027E _ E9, 0000009E(rel)

?_007:  jmp     .text.unlikely+68H                      ; 0283 _ E9, 00000068(rel)

?_008:  jmp     .text.unlikely+0D2H                     ; 0288 _ E9, 000000D2(rel)

?_009:  jmp     .text.unlikely+404H                     ; 028D _ E9, 00000404(rel)

?_010:  jmp     .text.unlikely+450H                     ; 0292 _ E9, 00000450(rel)

?_011:  jmp     .text.unlikely+58FH                     ; 0297 _ E9, 0000058F(rel)

?_012:  jmp     .text.unlikely+0A84H                    ; 029C _ E9, 00000A84(rel)

?_013:  jmp     .text.unlikely+0AA3H                    ; 02A1 _ E9, 00000AA3(rel)

?_014:  ; Local function
        jmp     .text.unlikely+0B03H                    ; 02A6 _ E9, 00000B03(rel)

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZN3UCI11print_valueEPc5Value:; Function begin
        push    rbx                                     ; 02B0 _ 53
        sub     rsp, 32                                 ; 02B1 _ 48: 83. EC, 20
        mov     ebx, edx                                ; 02B5 _ 89. D3
        sar     edx, 31                                 ; 02B7 _ C1. FA, 1F
        mov     eax, edx                                ; 02BA _ 89. D0
        xor     eax, ebx                                ; 02BC _ 31. D8
        sub     eax, edx                                ; 02BE _ 29. D0
        cmp     eax, 31871                              ; 02C0 _ 3D, 00007C7F
        jg      _ZN3UCI11print_valueEPc5Value.cold.75   ; 02C5 _ 0F 8F, 00000B0A(rel)
        lea     rdx, [rel ?_129]                        ; 02CB _ 48: 8D. 15, 000004D3(rel)
        call    _Z12print_stringPcPKc                   ; 02D2 _ E8, 00000000(rel)
        mov     r11d, 258                               ; 02D7 _ 41: BB, 00000102
        mov     rcx, rax                                ; 02DD _ 48: 89. C1
        imul    eax, ebx, 100                           ; 02E0 _ 6B. C3, 64
        cdq                                             ; 02E3 _ 99
        idiv    r11d                                    ; 02E4 _ 41: F7. FB
        mov     edx, eax                                ; 02E7 _ 89. C2
        add     rsp, 32                                 ; 02E9 _ 48: 83. C4, 20
        pop     rbx                                     ; 02ED _ 5B
        jmp     _Z9print_intPci                         ; 02EE _ E9, 00000000(rel)
; _ZN3UCI11print_valueEPc5Value End of function

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH, 84H
;       db 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZN3UCI10print_moveEPc4Moveb:; Function begin
        mov     eax, edx                                ; 0300 _ 89. D0
        mov     r9d, edx                                ; 0302 _ 41: 89. D1
        sar     eax, 6                                  ; 0305 _ C1. F8, 06
        and     r9d, 3FH                                ; 0308 _ 41: 83. E1, 3F
        and     eax, 3FH                                ; 030C _ 83. E0, 3F
        test    edx, edx                                ; 030F _ 85. D2
        movsxd  r10, eax                                ; 0311 _ 4C: 63. D0
        je      _ZN3UCI10print_moveEPc4Moveb.cold.76    ; 0314 _ 0F 84, 00000B4B(rel)
        cmp     edx, 65                                 ; 031A _ 83. FA, 41
        je      ?_017                                   ; 031D _ 0F 84, 00000089
        mov     r11d, edx                               ; 0323 _ 41: 89. D3
        and     r11d, 0C000H                            ; 0326 _ 41: 81. E3, 0000C000
        cmp     r11d, 49152                             ; 032D _ 41: 81. FB, 0000C000
        jnz     ?_015                                   ; 0334 _ 75, 21
        test    r8b, r8b                                ; 0336 _ 45: 84. C0
        jnz     ?_015                                   ; 0339 _ 75, 1C
        mov     r8, r10                                 ; 033B _ 4D: 89. D0
        shr     r8, 3                                   ; 033E _ 49: C1. E8, 03
        cmp     r10, r9                                 ; 0342 _ 4D: 39. CA
        sbb     r9d, r9d                                ; 0345 _ 45: 19. C9
        shl     r8d, 3                                  ; 0348 _ 41: C1. E0, 03
        and     r9d, 04H                                ; 034C _ 41: 83. E1, 04
        add     r9d, 2                                  ; 0350 _ 41: 83. C1, 02
        or      r9d, r8d                                ; 0354 _ 45: 09. C1
?_015:  and     eax, 07H                                ; 0357 _ 83. E0, 07
        shr     r10, 3                                  ; 035A _ 49: C1. EA, 03
        add     eax, 97                                 ; 035E _ 83. C0, 61
        add     r10d, 49                                ; 0361 _ 41: 83. C2, 31
        mov     byte [rcx], al                          ; 0365 _ 88. 01
        mov     eax, r9d                                ; 0367 _ 44: 89. C8
        shr     r9, 3                                   ; 036A _ 49: C1. E9, 03
        and     eax, 07H                                ; 036E _ 83. E0, 07
        add     r9d, 49                                 ; 0371 _ 41: 83. C1, 31
        mov     byte [rcx+1H], r10b                     ; 0375 _ 44: 88. 51, 01
        add     eax, 97                                 ; 0379 _ 83. C0, 61
        cmp     r11d, 16384                             ; 037C _ 41: 81. FB, 00004000
        mov     byte [rcx+3H], r9b                      ; 0383 _ 44: 88. 49, 03
        mov     byte [rcx+2H], al                       ; 0387 _ 88. 41, 02
        lea     rax, [rcx+4H]                           ; 038A _ 48: 8D. 41, 04
        jz      ?_016                                   ; 038E _ 74, 01
        ret                                             ; 0390 _ C3

?_016:  lea     r10, [rel ?_133]                        ; 0391 _ 4C: 8D. 15, 000004E9(rel)
        sar     edx, 12                                 ; 0398 _ C1. FA, 0C
        lea     rax, [rcx+5H]                           ; 039B _ 48: 8D. 41, 05
        and     edx, 03H                                ; 039F _ 83. E2, 03
        movzx   edx, byte [r10+rdx+2H]                  ; 03A2 _ 41: 0F B6. 54 12, 02
        mov     byte [rcx+4H], dl                       ; 03A8 _ 88. 51, 04
        ret                                             ; 03AB _ C3
; _ZN3UCI10print_moveEPc4Moveb End of function

?_017:  ; Local function
        jmp     .text.unlikely+0B57H                    ; 03AC _ E9, 00000B57(rel)

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 66H, 2EH, 0FH
;       db 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

__tcf_1:; Local function
        push    rbx                                     ; 03C0 _ 53
        sub     rsp, 32                                 ; 03C1 _ 48: 83. EC, 20
        mov     rbx, qword [rel _ZN12_GLOBAL__N_111SetupStatesE]; 03C5 _ 48: 8B. 1D, 00000048(rel)
        test    rbx, rbx                                ; 03CC _ 48: 85. DB
        jne     __tcf_1.cold.77                         ; 03CF _ 0F 85, 00000B63(rel)
        add     rsp, 32                                 ; 03D5 _ 48: 83. C4, 20
        pop     rbx                                     ; 03D9 _ 5B
        ret                                             ; 03DA _ C3

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

__tcf_0:; Local function
        mov     rcx, qword [rel ?_026]                  ; 03E0 _ 48: 8B. 0D, 00000030(rel)
        test    rcx, rcx                                ; 03E7 _ 48: 85. C9
        je      __tcf_0.cold.78                         ; 03EA _ 0F 84, 00000B78(rel)
        jmp     _ZdaPv                                  ; 03F0 _ E9, 00000000(rel)

        nop                                             ; 03F5 _ 90
        nop                                             ; 03F6 _ 90
        nop                                             ; 03F7 _ 90
        nop                                             ; 03F8 _ 90
        nop                                             ; 03F9 _ 90
        nop                                             ; 03FA _ 90
        nop                                             ; 03FB _ 90
        nop                                             ; 03FC _ 90
        nop                                             ; 03FD _ 90
        nop                                             ; 03FE _ 90
        nop                                             ; 03FF _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=64 noexecute                      ; section number 3, bss

Opt:                                                    ; qword
        resq    1                                       ; 0000

?_018:  resq    1                                       ; 0008

?_019:  resq    1                                       ; 0010

?_020:  resd    1                                       ; 0018

?_021:  resd    1                                       ; 001C

?_022:  resd    1                                       ; 0020

?_023:  resd    1                                       ; 0024

?_024:  resd    1                                       ; 0028

?_025:  resd    1                                       ; 002C

?_026:  resq    1                                       ; 0030

?_027:  resd    1                                       ; 0038

?_028:  resd    1                                       ; 003C

?_029:  resb    1                                       ; 0040

?_030:  resb    1                                       ; 0041

?_031:  resb    6                                       ; 0042

_ZN12_GLOBAL__N_111SetupStatesE:                        ; qword
        resq    7                                       ; 0048


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_ZN3UCI4loopEiPPc.cold.74:
        mov     rcx, r14                                ; 0000 _ 4C: 89. F1
        call    _Z7read_inPc                            ; 0003 _ E8, 00000000(rel)
        test    al, al                                  ; 0008 _ 84. C0
        jnz     ?_032                                   ; 000A _ 75, 29
        lea     rsi, [rsp+0C0H]                         ; 000C _ 48: 8D. B4 24, 000000C0
        mov     rcx, r14                                ; 0014 _ 4C: 89. F1
        mov     rdx, rsi                                ; 0017 _ 48: 89. F2
        call    _Z14parse_gettokenPKcPc                 ; 001A _ E8, 00000000(rel)
        cmp     byte [rsp+0C0H], 31                     ; 001F _ 80. BC 24, 000000C0, 1F
        mov     rbx, rax                                ; 0027 _ 48: 89. C3
        jle     ?_003                                   ; 002A _ 0F 8E, 000000F7(rel)
        jmp     .text+124H                              ; 0030 _ E9, 00000124(rel)

?_032:  ; Local function
        jmp     ?_004                                   ; 0035 _ E9, 00000250(rel)

        lea     rdx, [rel ?_114]                        ; 003A _ 48: 8D. 15, 000001AB(rel)
        mov     rcx, r12                                ; 0041 _ 4C: 89. E1
        call    _Z12print_stringPcPKc                   ; 0044 _ E8, 00000000(rel)
        mov     rdx, rsi                                ; 0049 _ 48: 89. F2
        mov     rcx, rax                                ; 004C _ 48: 89. C1
        call    _Z13print_vstringPcS_                   ; 004F _ E8, 00000000(rel)
        mov     rcx, r12                                ; 0054 _ 4C: 89. E1
        lea     rdx, [rax+1H]                           ; 0057 _ 48: 8D. 50, 01
        mov     byte [rax], 10                          ; 005B _ C6. 00, 0A
        call    _Z9write_outPcS_                        ; 005E _ E8, 00000000(rel)
        jmp     .text+247H                              ; 0063 _ E9, 00000247(rel)

        mov     rdx, r15                                ; 0068 _ 4C: 89. FA
        mov     rcx, rbx                                ; 006B _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 006E _ E8, 00000000(rel)
        mov     r8d, dword [rsp+140H]                   ; 0073 _ 44: 8B. 84 24, 00000140
        mov     rdx, r13                                ; 007B _ 4C: 89. EA
        mov     qword [rsp+20H], 1                      ; 007E _ 48: C7. 44 24, 20, 00000001
        lea     rcx, [rel ?_112]                        ; 0087 _ 48: 8D. 0D, 0000019F(rel)
        mov     r9d, 16                                 ; 008E _ 41: B9, 00000010
        call    _Z9benchmarkPKcR8Positioniyy            ; 0094 _ E8, 00000000(rel)
        jmp     .text+247H                              ; 0099 _ E9, 00000247(rel)

        lea     rsi, [rsp+60H]                          ; 009E _ 48: 8D. 74 24, 60
        mov     rcx, rbx                                ; 00A3 _ 48: 89. D9
        mov     rdx, rsi                                ; 00A6 _ 48: 89. F2
        call    _Z14parse_gettokenPKcPc                 ; 00A9 _ E8, 00000000(rel)
        mov     rdx, r15                                ; 00AE _ 4C: 89. FA
        mov     rcx, rax                                ; 00B1 _ 48: 89. C1
        call    _Z17parse_token_lowerPKcPc              ; 00B4 _ E8, 00000000(rel)
        mov     rdx, rsi                                ; 00B9 _ 48: 89. F2
        mov     rcx, rax                                ; 00BC _ 48: 89. C1
        call    _Z17parse_token_lowerPKcPc              ; 00BF _ E8, 00000000(rel)
        mov     rbx, rax                                ; 00C4 _ 48: 89. C3
?_033:  cmp     byte [rbx], 32                          ; 00C7 _ 80. 3B, 20
        jnz     ?_034                                   ; 00CA _ 75, 1E
        add     rbx, 1                                  ; 00CC _ 48: 83. C3, 01
        jmp     ?_033                                   ; 00D0 _ EB, F5

; Note: No jump seems to point here
        call    _ZN6Search5clearEv                      ; 00D2 _ E8, 00000000(rel)
        mov     r10, qword [rel .refptr.Time]           ; 00D7 _ 4C: 8B. 15, 00000000(rel)
        mov     qword [r10], 0                          ; 00DE _ 49: C7. 02, 00000000
        jmp     .text+247H                              ; 00E5 _ E9, 00000247(rel)

?_034:  ; Local function
        cmp     byte [rsp+140H], 0                      ; 00EA _ 80. BC 24, 00000140, 00
        je      .text+247H                              ; 00F2 _ 0F 84, 00000247(rel)
        lea     rdx, [rel ?_102]                        ; 00F8 _ 48: 8D. 15, 0000013D(rel)
        mov     rcx, r15                                ; 00FF _ 4C: 89. F9
        call    strcmp                                  ; 0102 _ E8, 00000000(rel)
        test    eax, eax                                ; 0107 _ 85. C0
        je      ?_046                                   ; 0109 _ 0F 84, 000002B1
        lea     rdx, [rel ?_103]                        ; 010F _ 48: 8D. 15, 00000142(rel)
        mov     rcx, r15                                ; 0116 _ 4C: 89. F9
        call    strcmp                                  ; 0119 _ E8, 00000000(rel)
        test    eax, eax                                ; 011E _ 85. C0
        je      ?_044                                   ; 0120 _ 0F 84, 0000025A
        lea     rdx, [rel ?_104]                        ; 0126 _ 48: 8D. 15, 0000014A(rel)
        mov     rcx, r15                                ; 012D _ 4C: 89. F9
        call    strcmp                                  ; 0130 _ E8, 00000000(rel)
        test    eax, eax                                ; 0135 _ 85. C0
        je      ?_043                                   ; 0137 _ 0F 84, 00000232
        lea     rdx, [rel ?_105]                        ; 013D _ 48: 8D. 15, 00000154(rel)
        mov     rcx, r15                                ; 0144 _ 4C: 89. F9
        call    strcmp                                  ; 0147 _ E8, 00000000(rel)
        test    eax, eax                                ; 014C _ 85. C0
        je      ?_042                                   ; 014E _ 0F 84, 000001E9
        lea     rdx, [rel ?_106]                        ; 0154 _ 48: 8D. 15, 0000015D(rel)
        mov     rcx, r15                                ; 015B _ 4C: 89. F9
        call    strcmp                                  ; 015E _ E8, 00000000(rel)
        test    eax, eax                                ; 0163 _ 85. C0
        je      ?_040                                   ; 0165 _ 0F 84, 0000019C
        lea     rdx, [rel ?_107]                        ; 016B _ 48: 8D. 15, 00000165(rel)
        mov     rcx, r15                                ; 0172 _ 4C: 89. F9
        call    strcmp                                  ; 0175 _ E8, 00000000(rel)
        test    eax, eax                                ; 017A _ 85. C0
        mov     edi, eax                                ; 017C _ 89. C7
        je      ?_039                                   ; 017E _ 0F 84, 0000014D
        lea     rdx, [rel ?_108]                        ; 0184 _ 48: 8D. 15, 00000172(rel)
        mov     rcx, r15                                ; 018B _ 4C: 89. F9
        call    strcmp                                  ; 018E _ E8, 00000000(rel)
        test    eax, eax                                ; 0193 _ 85. C0
        mov     esi, eax                                ; 0195 _ 89. C6
        je      ?_038                                   ; 0197 _ 0F 84, 000000FD
        lea     rdx, [rel ?_109]                        ; 019D _ 48: 8D. 15, 0000017F(rel)
        mov     rcx, r15                                ; 01A4 _ 4C: 89. F9
        call    strcmp                                  ; 01A7 _ E8, 00000000(rel)
        test    eax, eax                                ; 01AC _ 85. C0
        je      ?_037                                   ; 01AE _ 0F 84, 000000B3
        lea     rdx, [rel ?_110]                        ; 01B4 _ 48: 8D. 15, 0000018A(rel)
        mov     rcx, r15                                ; 01BB _ 4C: 89. F9
        call    strcmp                                  ; 01BE _ E8, 00000000(rel)
        test    eax, eax                                ; 01C3 _ 85. C0
        mov     edi, eax                                ; 01C5 _ 89. C7
        jz      ?_036                                   ; 01C7 _ 74, 6D
        lea     rdx, [rel ?_111]                        ; 01C9 _ 48: 8D. 15, 00000194(rel)
        mov     rcx, r15                                ; 01D0 _ 4C: 89. F9
        call    strcmp                                  ; 01D3 _ E8, 00000000(rel)
        test    eax, eax                                ; 01D8 _ 85. C0
        jne     .text+247H                              ; 01DA _ 0F 85, 00000247(rel)
        or      rcx, 0FFFFFFFFFFFFFFFFH                 ; 01E0 _ 48: 83. C9, FF
        mov     rdi, rbx                                ; 01E4 _ 48: 89. DF
        repne scasb                                     ; 01E7 _ F2: AE
        mov     r11, rcx                                ; 01E9 _ 49: 89. CB
        mov     rcx, qword [rel ?_026]                  ; 01EC _ 48: 8B. 0D, 00000030(rel)
        not     r11                                     ; 01F3 _ 49: F7. D3
        lea     rsi, [r11-1H]                           ; 01F6 _ 49: 8D. 73, FF
        test    rcx, rcx                                ; 01FA _ 48: 85. C9
        jz      ?_035                                   ; 01FD _ 74, 05
        call    _ZdaPv                                  ; 01FF _ E8, 00000000(rel)
?_035:  add     rsi, 1                                  ; 0204 _ 48: 83. C6, 01
        mov     rcx, rsi                                ; 0208 _ 48: 89. F1
        call    _Znay                                   ; 020B _ E8, 00000000(rel)
        mov     r8, rsi                                 ; 0210 _ 49: 89. F0
        mov     rdx, rbx                                ; 0213 _ 48: 89. DA
        mov     rcx, rax                                ; 0216 _ 48: 89. C1
        mov     qword [rel ?_026], rax                  ; 0219 _ 48: 89. 05, 00000030(rel)
        call    memcpy                                  ; 0220 _ E8, 00000000(rel)
        mov     rcx, qword [rel ?_026]                  ; 0225 _ 48: 8B. 0D, 00000030(rel)
        call    _ZN10Tablebases4initEPKc                ; 022C _ E8, 00000000(rel)
        jmp     .text+247H                              ; 0231 _ E9, 00000247(rel)

?_036:  lea     rdx, [rsp+5CH]                          ; 0236 _ 48: 8D. 54 24, 5C
        mov     rcx, rbx                                ; 023B _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 023E _ E8, 00000000(rel)
        mov     eax, 5000                               ; 0243 _ B8, 00001388
        cmp     dword [rsp+5CH], 5000                   ; 0248 _ 81. 7C 24, 5C, 00001388
        mov     edx, eax                                ; 0250 _ 89. C2
        cmovle  edx, dword [rsp+5CH]                    ; 0252 _ 0F 4E. 54 24, 5C
        test    edx, edx                                ; 0257 _ 85. D2
        cmovs   edx, edi                                ; 0259 _ 0F 48. D7
        mov     dword [rel ?_024], edx                  ; 025C _ 89. 15, 00000028(rel)
        jmp     .text+247H                              ; 0262 _ E9, 00000247(rel)

?_037:  lea     rdx, [rsp+5CH]                          ; 0267 _ 48: 8D. 54 24, 5C
        mov     rcx, rbx                                ; 026C _ 48: 89. D9
        mov     ebx, 20                                 ; 026F _ BB, 00000014
        call    _Z9parse_intPKcRi                       ; 0274 _ E8, 00000000(rel)
        cmp     dword [rsp+5CH], 20                     ; 0279 _ 83. 7C 24, 5C, 14
        mov     r8d, 0                                  ; 027E _ 41: B8, 00000000
        cmovle  ebx, dword [rsp+5CH]                    ; 0284 _ 0F 4E. 5C 24, 5C
        test    ebx, ebx                                ; 0289 _ 85. DB
        cmovs   ebx, r8d                                ; 028B _ 41: 0F 48. D8
        mov     dword [rel ?_021], ebx                  ; 028F _ 89. 1D, 0000001C(rel)
        jmp     .text+247H                              ; 0295 _ E9, 00000247(rel)

?_038:  lea     rdx, [rsp+5CH]                          ; 029A _ 48: 8D. 54 24, 5C
        mov     rcx, rbx                                ; 029F _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 02A2 _ E8, 00000000(rel)
        mov     r9d, 5000                               ; 02A7 _ 41: B9, 00001388
        cmp     dword [rsp+5CH], 5000                   ; 02AD _ 81. 7C 24, 5C, 00001388
        mov     r10d, r9d                               ; 02B5 _ 45: 89. CA
        cmovle  r10d, dword [rsp+5CH]                   ; 02B8 _ 44: 0F 4E. 54 24, 5C
        test    r10d, r10d                              ; 02BE _ 45: 85. D2
        cmovs   r10d, esi                               ; 02C1 _ 44: 0F 48. D6
        mov     dword [rel ?_022], r10d                 ; 02C5 _ 44: 89. 15, 00000020(rel)
        jmp     .text+247H                              ; 02CC _ E9, 00000247(rel)

?_039:  lea     rdx, [rsp+5CH]                          ; 02D1 _ 48: 8D. 54 24, 5C
        mov     rcx, rbx                                ; 02D6 _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 02D9 _ E8, 00000000(rel)
        mov     ecx, 5000                               ; 02DE _ B9, 00001388
        cmp     dword [rsp+5CH], 5000                   ; 02E3 _ 81. 7C 24, 5C, 00001388
        mov     r11d, ecx                               ; 02EB _ 41: 89. CB
        cmovle  r11d, dword [rsp+5CH]                   ; 02EE _ 44: 0F 4E. 5C 24, 5C
        test    r11d, r11d                              ; 02F4 _ 45: 85. DB
        cmovs   r11d, edi                               ; 02F7 _ 44: 0F 48. DF
        mov     dword [rel ?_023], r11d                 ; 02FB _ 44: 89. 1D, 00000024(rel)
        jmp     .text+247H                              ; 0302 _ E9, 00000247(rel)

?_040:  lea     rdx, [rsp+5CH]                          ; 0307 _ 48: 8D. 54 24, 5C
        mov     rcx, rbx                                ; 030C _ 48: 89. D9
        mov     esi, 1                                  ; 030F _ BE, 00000001
        call    _Z9parse_intPKcRi                       ; 0314 _ E8, 00000000(rel)
        movsxd  rdi, dword [rsp+5CH]                    ; 0319 _ 48: 63. 7C 24, 5C
        test    rdi, rdi                                ; 031E _ 48: 85. FF
        jz      ?_041                                   ; 0321 _ 74, 0E
        cmp     rdi, 250                                ; 0323 _ 48: 81. FF, 000000FA
        mov     sil, -6                                 ; 032A _ 40: B6, FA
        cmovbe  rsi, rdi                                ; 032D _ 48: 0F 46. F7
?_041:  mov     qword [rel ?_019], rsi                  ; 0331 _ 48: 89. 35, 00000010(rel)
        jmp     .text+247H                              ; 0338 _ E9, 00000247(rel)

?_042:  lea     rdx, [rsp+5CH]                          ; 033D _ 48: 8D. 54 24, 5C
        mov     rcx, rbx                                ; 0342 _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 0345 _ E8, 00000000(rel)
        cmp     dword [rsp+5CH], 100                    ; 034A _ 83. 7C 24, 5C, 64
        mov     eax, 100                                ; 034F _ B8, 00000064
        mov     edx, 4294967196                         ; 0354 _ BA, FFFFFF9C
        cmovle  eax, dword [rsp+5CH]                    ; 0359 _ 0F 4E. 44 24, 5C
        cmp     eax, -100                               ; 035E _ 83. F8, 9C
        cmovl   eax, edx                                ; 0361 _ 0F 4C. C2
        mov     dword [rel ?_020], eax                  ; 0364 _ 89. 05, 00000018(rel)
        jmp     .text+247H                              ; 036A _ E9, 00000247(rel)

?_043:  mov     rcx, qword [rel .refptr.TT]             ; 036F _ 48: 8B. 0D, 00000000(rel)
        call    _ZN18TranspositionTable5clearEv         ; 0376 _ E8, 00000000(rel)
        jmp     .text+247H                              ; 037B _ E9, 00000247(rel)

?_044:  lea     rdx, [rsp+5CH]                          ; 0380 _ 48: 8D. 54 24, 5C
        mov     rcx, rbx                                ; 0385 _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 0388 _ E8, 00000000(rel)
        movsxd  rbx, dword [rsp+5CH]                    ; 038D _ 48: 63. 5C 24, 5C
        mov     r8d, 1                                  ; 0392 _ 41: B8, 00000001
        test    rbx, rbx                                ; 0398 _ 48: 85. DB
        jz      ?_045                                   ; 039B _ 74, 0B
        cmp     rbx, 50                                 ; 039D _ 48: 83. FB, 32
        mov     r8b, 50                                 ; 03A1 _ 41: B0, 32
        cmovbe  r8, rbx                                 ; 03A4 _ 4C: 0F 46. C3
?_045:  mov     rcx, qword [rel .refptr.Threads]        ; 03A8 _ 48: 8B. 0D, 00000000(rel)
        mov     qword [rel Opt], r8                     ; 03AF _ 4C: 89. 05, 00000000(rel)
        call    _ZN10ThreadPool16read_uci_optionsEv     ; 03B6 _ E8, 00000000(rel)
        jmp     .text+247H                              ; 03BB _ E9, 00000247(rel)

?_046:  ; Local function
        lea     rdx, [rsp+5CH]                          ; 03C0 _ 48: 8D. 54 24, 5C
        mov     rcx, rbx                                ; 03C5 _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 03C8 _ E8, 00000000(rel)
        movsxd  r9, dword [rsp+5CH]                     ; 03CD _ 4C: 63. 4C 24, 5C
        mov     edx, 1                                  ; 03D2 _ BA, 00000001
        test    r9, r9                                  ; 03D7 _ 4D: 85. C9
        jz      ?_047                                   ; 03DA _ 74, 10
        cmp     r9, 1048576                             ; 03DC _ 49: 81. F9, 00100000
        mov     edx, 1048576                            ; 03E3 _ BA, 00100000
        cmovbe  rdx, r9                                 ; 03E8 _ 49: 0F 46. D1
?_047:  mov     rcx, qword [rel .refptr.TT]             ; 03EC _ 48: 8B. 0D, 00000000(rel)
        mov     qword [rel ?_018], rdx                  ; 03F3 _ 48: 89. 15, 00000008(rel)
        call    _ZN18TranspositionTable6resizeEy        ; 03FA _ E8, 00000000(rel)
        jmp     .text+247H                              ; 03FF _ E9, 00000247(rel)

        lea     rdx, [rel ?_076]                        ; 0404 _ 48: 8D. 15, 00000039(rel)
        mov     rcx, r12                                ; 040B _ 4C: 89. E1
        call    _Z12print_stringPcPKc                   ; 040E _ E8, 00000000(rel)
        lea     rdx, [rel ?_077]                        ; 0413 _ 48: 8D. 15, 00000058(rel)
        mov     rcx, rax                                ; 041A _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 041D _ E8, 00000000(rel)
        lea     rcx, [rel Opt]                          ; 0422 _ 48: 8D. 0D, 00000000(rel)
        mov     rdx, rax                                ; 0429 _ 48: 89. C2
        call    _ZN3UCI7Options13print_optionsEPc       ; 042C _ E8, 00000000(rel)
        lea     rdx, [rel ?_078]                        ; 0431 _ 48: 8D. 15, 00000091(rel)
        mov     rcx, rax                                ; 0438 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 043B _ E8, 00000000(rel)
        mov     rcx, r12                                ; 0440 _ 4C: 89. E1
        mov     rdx, rax                                ; 0443 _ 48: 89. C2
        call    _Z9write_outPcS_                        ; 0446 _ E8, 00000000(rel)
        jmp     .text+247H                              ; 044B _ E9, 00000247(rel)

        mov     rcx, qword [rel .refptr._ZN6Search6LimitsE]; 0450 _ 48: 8B. 0D, 00000000(rel)
        mov     dword [rcx+40H], 0                      ; 0457 _ C7. 41, 40, 00000000
        jmp     .text+247H                              ; 045E _ E9, 00000247(rel)

        mov     qword [rsp+140H], 0                     ; 0463 _ 48: C7. 84 24, 00000140, 00000000
        lea     rsi, [rsp+60H]                          ; 046F _ 48: 8D. 74 24, 60
        mov     qword [rsp+148H], 0                     ; 0474 _ 48: C7. 84 24, 00000148, 00000000
        lea     rdi, [r15+34H]                          ; 0480 _ 49: 8D. 7F, 34
        mov     qword [rsp+150H], 0                     ; 0484 _ 48: C7. 84 24, 00000150, 00000000
        mov     dword [rsp+180H], 0                     ; 0490 _ C7. 84 24, 00000180, 00000000
        mov     dword [rsp+17CH], 0                     ; 049B _ C7. 84 24, 0000017C, 00000000
        mov     dword [rsp+178H], 0                     ; 04A6 _ C7. 84 24, 00000178, 00000000
        mov     dword [rsp+174H], 0                     ; 04B1 _ C7. 84 24, 00000174, 00000000
        mov     dword [rsp+170H], 0                     ; 04BC _ C7. 84 24, 00000170, 00000000
        mov     dword [rsp+16CH], 0                     ; 04C7 _ C7. 84 24, 0000016C, 00000000
        mov     dword [rsp+168H], 0                     ; 04D2 _ C7. 84 24, 00000168, 00000000
        mov     dword [rsp+164H], 0                     ; 04DD _ C7. 84 24, 00000164, 00000000
        mov     dword [rsp+160H], 0                     ; 04E8 _ C7. 84 24, 00000160, 00000000
        mov     dword [rsp+15CH], 0                     ; 04F3 _ C7. 84 24, 0000015C, 00000000
        mov     dword [rsp+158H], 0                     ; 04FE _ C7. 84 24, 00000158, 00000000
        mov     qword [rsp+188H], 0                     ; 0509 _ 48: C7. 84 24, 00000188, 00000000
        call    _Z3nowv                                 ; 0515 _ E8, 00000000(rel)
        lea     r11, [rsp+5CH]                          ; 051A _ 4C: 8D. 5C 24, 5C
        mov     qword [rsp+190H], rax                   ; 051F _ 48: 89. 84 24, 00000190
        mov     qword [rsp+40H], r11                    ; 0527 _ 4C: 89. 5C 24, 40
?_048:  mov     rcx, rbx                                ; 052C _ 48: 89. D9
        mov     rdx, rsi                                ; 052F _ 48: 89. F2
        call    _Z14parse_gettokenPKcPc                 ; 0532 _ E8, 00000000(rel)
        cmp     byte [rsp+60H], 0                       ; 0537 _ 80. 7C 24, 60, 00
        mov     rbx, rax                                ; 053C _ 48: 89. C3
        je      ?_058                                   ; 053F _ 0F 84, 00000430
        lea     rdx, [rel ?_084]                        ; 0545 _ 48: 8D. 15, 000000B8(rel)
        mov     rcx, rsi                                ; 054C _ 48: 89. F1
        call    strcmp                                  ; 054F _ E8, 00000000(rel)
        test    eax, eax                                ; 0554 _ 85. C0
        jne     ?_057                                   ; 0556 _ 0F 85, 0000032B
?_049:  mov     rcx, rbx                                ; 055C _ 48: 89. D9
        mov     rdx, rsi                                ; 055F _ 48: 89. F2
        call    _Z14parse_gettokenPKcPc                 ; 0562 _ E8, 00000000(rel)
        cmp     byte [rsp+60H], 0                       ; 0567 _ 80. 7C 24, 60, 00
        mov     rbx, rax                                ; 056C _ 48: 89. C3
        jz      ?_048                                   ; 056F _ 74, BB
        mov     rdx, rsi                                ; 0571 _ 48: 89. F2
        mov     rcx, r13                                ; 0574 _ 4C: 89. E9
        call    _ZN3UCI10parse_moveERK8PositionPc       ; 0577 _ E8, 000005FD
        mov     rdx, qword [rsp+40H]                    ; 057C _ 48: 8B. 54 24, 40
        mov     rcx, r15                                ; 0581 _ 4C: 89. F9
        mov     dword [rsp+5CH], eax                    ; 0584 _ 89. 44 24, 5C
        call    _ZNSt6vectorI4MoveSaIS0_EE12emplace_backIIS0_EEEvDpOT_; 0588 _ E8, 00000000(rel)
        jmp     ?_049                                   ; 058D _ EB, CD

; Note: No jump seems to point here
        mov     rdx, r15                                ; 058F _ 4C: 89. FA
        mov     rcx, rbx                                ; 0592 _ 48: 89. D9
        call    _Z17parse_token_lowerPKcPc              ; 0595 _ E8, 00000000(rel)
        lea     rdx, [rel ?_097]                        ; 059A _ 48: 8D. 15, 00000117(rel)
        mov     rcx, r15                                ; 05A1 _ 4C: 89. F9
        mov     rdi, rax                                ; 05A4 _ 48: 89. C7
        call    strcmp                                  ; 05A7 _ E8, 00000000(rel)
        test    eax, eax                                ; 05AC _ 85. C0
        je      ?_056                                   ; 05AE _ 0F 84, 000002A8
        lea     rdx, [rel ?_098]                        ; 05B4 _ 48: 8D. 15, 00000120(rel)
        mov     rcx, r15                                ; 05BB _ 4C: 89. F9
        call    strcmp                                  ; 05BE _ E8, 00000000(rel)
        test    eax, eax                                ; 05C3 _ 85. C0
        jne     .text+247H                              ; 05C5 _ 0F 85, 00000247(rel)
        mov     rcx, qword [rel .refptr.Threads]        ; 05CB _ 48: 8B. 0D, 00000000(rel)
        call    _ZN10ThreadPool4mainEv                  ; 05D2 _ E8, 00000000(rel)
        mov     rdx, rdi                                ; 05D7 _ 48: 89. FA
        mov     rcx, r13                                ; 05DA _ 4C: 89. E9
        movzx   r8d, byte [rel ?_030]                   ; 05DD _ 44: 0F B6. 05, 00000041(rel)
        mov     r9, rax                                 ; 05E5 _ 49: 89. C1
        call    _ZN8Position9parse_setEPKcbP6Thread     ; 05E8 _ E8, 00000000(rel)
        mov     rdi, rax                                ; 05ED _ 48: 89. C7
?_050:  mov     rdx, r15                                ; 05F0 _ 4C: 89. FA
        mov     rcx, rdi                                ; 05F3 _ 48: 89. F9
        call    _Z14parse_gettokenPKcPc                 ; 05F6 _ E8, 00000000(rel)
        lea     r11, [rsp+60H]                          ; 05FB _ 4C: 8D. 5C 24, 60
        xor     edx, edx                                ; 0600 _ 31. D2
        mov     qword [rsp+60H], 0                      ; 0602 _ 48: C7. 44 24, 60, 00000000
        mov     rcx, r11                                ; 060B _ 4C: 89. D9
        mov     qword [rsp+40H], r11                    ; 060E _ 4C: 89. 5C 24, 40
        mov     qword [rsp+48H], rax                    ; 0613 _ 48: 89. 44 24, 48
        mov     qword [rsp+68H], 0                      ; 0618 _ 48: C7. 44 24, 68, 00000000
        mov     qword [rsp+70H], 0                      ; 0621 _ 48: C7. 44 24, 70, 00000000
        mov     qword [rsp+78H], 0                      ; 062A _ 48: C7. 44 24, 78, 00000000
        mov     qword [rsp+80H], 0                      ; 0633 _ 48: C7. 84 24, 00000080, 00000000
        mov     qword [rsp+88H], 0                      ; 063F _ 48: C7. 84 24, 00000088, 00000000
        mov     qword [rsp+90H], 0                      ; 064B _ 48: C7. 84 24, 00000090, 00000000
        mov     qword [rsp+98H], 0                      ; 0657 _ 48: C7. 84 24, 00000098, 00000000
        mov     qword [rsp+0A0H], 0                     ; 0663 _ 48: C7. 84 24, 000000A0, 00000000
        mov     qword [rsp+0A8H], 0                     ; 066F _ 48: C7. 84 24, 000000A8, 00000000
        call    _ZNSt11_Deque_baseI9StateInfoSaIS0_EE17_M_initialize_mapEy; 067B _ E8, 00000000(rel)
        mov     ecx, 80                                 ; 0680 _ B9, 00000050
        call    _Znwy                                   ; 0685 _ E8, 00000000(rel)
        xor     edx, edx                                ; 068A _ 31. D2
        mov     qword [rax], 0                          ; 068C _ 48: C7. 00, 00000000
        mov     rcx, rax                                ; 0693 _ 48: 89. C1
        mov     rbx, rax                                ; 0696 _ 48: 89. C3
        mov     qword [rax+8H], 0                       ; 0699 _ 48: C7. 40, 08, 00000000
        mov     qword [rax+10H], 0                      ; 06A1 _ 48: C7. 40, 10, 00000000
        mov     qword [rax+18H], 0                      ; 06A9 _ 48: C7. 40, 18, 00000000
        mov     qword [rax+20H], 0                      ; 06B1 _ 48: C7. 40, 20, 00000000
        mov     qword [rax+28H], 0                      ; 06B9 _ 48: C7. 40, 28, 00000000
        mov     qword [rax+30H], 0                      ; 06C1 _ 48: C7. 40, 30, 00000000
        mov     qword [rax+38H], 0                      ; 06C9 _ 48: C7. 40, 38, 00000000
        mov     qword [rax+40H], 0                      ; 06D1 _ 48: C7. 40, 40, 00000000
        mov     qword [rax+48H], 0                      ; 06D9 _ 48: C7. 40, 48, 00000000
        call    _ZNSt11_Deque_baseI9StateInfoSaIS0_EE17_M_initialize_mapEy; 06E1 _ E8, 00000000(rel)
        mov     r11, qword [rsp+60H]                    ; 06E6 _ 4C: 8B. 5C 24, 60
        test    r11, r11                                ; 06EB _ 4D: 85. DB
        je      ?_051                                   ; 06EE _ 0F 84, 0000009D
        lea     rax, [rbx+10H]                          ; 06F4 _ 48: 8D. 43, 10
        mov     rdx, qword [rbx+10H]                    ; 06F8 _ 48: 8B. 53, 10
        mov     ecx, 8                                  ; 06FC _ B9, 00000008
        mov     r8, qword [rbx+18H]                     ; 0701 _ 4C: 8B. 43, 18
        lea     rsi, [rsp+70H]                          ; 0705 _ 48: 8D. 74 24, 70
        mov     rdi, rax                                ; 070A _ 48: 89. C7
        mov     r9, qword [rbx+20H]                     ; 070D _ 4C: 8B. 4B, 20
        lea     rax, [rbx+30H]                          ; 0711 _ 48: 8D. 43, 30
        mov     r10, qword [rbx+28H]                    ; 0715 _ 4C: 8B. 53, 28
        rep movsd                                       ; 0719 _ F3: A5
        mov     qword [rsp+70H], rdx                    ; 071B _ 48: 89. 54 24, 70
        lea     rsi, [rsp+90H]                          ; 0720 _ 48: 8D. B4 24, 00000090
        mov     rdi, rax                                ; 0728 _ 48: 89. C7
        mov     qword [rsp+78H], r8                     ; 072B _ 4C: 89. 44 24, 78
        mov     qword [rsp+80H], r9                     ; 0730 _ 4C: 89. 8C 24, 00000080
        mov     qword [rsp+88H], r10                    ; 0738 _ 4C: 89. 94 24, 00000088
        mov     r9, qword [rbx+30H]                     ; 0740 _ 4C: 8B. 4B, 30
        mov     r8, qword [rbx+38H]                     ; 0744 _ 4C: 8B. 43, 38
        mov     rdx, qword [rbx+40H]                    ; 0748 _ 48: 8B. 53, 40
        mov     r10, qword [rbx+48H]                    ; 074C _ 4C: 8B. 53, 48
        mov     cl, 8                                   ; 0750 _ B1, 08
        rep movsd                                       ; 0752 _ F3: A5
        mov     qword [rsp+90H], r9                     ; 0754 _ 4C: 89. 8C 24, 00000090
        mov     r9, qword [rsp+68H]                     ; 075C _ 4C: 8B. 4C 24, 68
        mov     qword [rsp+98H], r8                     ; 0761 _ 4C: 89. 84 24, 00000098
        mov     qword [rsp+0A0H], rdx                   ; 0769 _ 48: 89. 94 24, 000000A0
        mov     qword [rsp+0A8H], r10                   ; 0771 _ 4C: 89. 94 24, 000000A8
        mov     rcx, qword [rbx]                        ; 0779 _ 48: 8B. 0B
        mov     qword [rbx], r11                        ; 077C _ 4C: 89. 1B
        mov     r11, qword [rbx+8H]                     ; 077F _ 4C: 8B. 5B, 08
        mov     qword [rsp+60H], rcx                    ; 0783 _ 48: 89. 4C 24, 60
        mov     qword [rbx+8H], r9                      ; 0788 _ 4C: 89. 4B, 08
        mov     qword [rsp+68H], r11                    ; 078C _ 4C: 89. 5C 24, 68
?_051:  mov     rsi, qword [rel _ZN12_GLOBAL__N_111SetupStatesE]; 0791 _ 48: 8B. 35, 00000048(rel)
        mov     qword [rel _ZN12_GLOBAL__N_111SetupStatesE], rbx; 0798 _ 48: 89. 1D, 00000048(rel)
        test    rsi, rsi                                ; 079F _ 48: 85. F6
        jz      ?_052                                   ; 07A2 _ 74, 10
        mov     rcx, rsi                                ; 07A4 _ 48: 89. F1
        call    _ZNSt11_Deque_baseI9StateInfoSaIS0_EED2Ev; 07A7 _ E8, 00000000(rel)
        mov     rcx, rsi                                ; 07AC _ 48: 89. F1
        call    _ZdlPv                                  ; 07AF _ E8, 00000000(rel)
?_052:  mov     rcx, qword [rsp+40H]                    ; 07B4 _ 48: 8B. 4C 24, 40
        lea     rbx, [rsp+60H]                          ; 07B9 _ 48: 8D. 5C 24, 60
        call    _ZNSt11_Deque_baseI9StateInfoSaIS0_EED2Ev; 07BE _ E8, 00000000(rel)
?_053:  mov     rcx, qword [rsp+48H]                    ; 07C3 _ 48: 8B. 4C 24, 48
        mov     rdx, r15                                ; 07C8 _ 4C: 89. FA
        call    _Z17parse_token_lowerPKcPc              ; 07CB _ E8, 00000000(rel)
        mov     rdx, r15                                ; 07D0 _ 4C: 89. FA
        mov     rcx, r13                                ; 07D3 _ 4C: 89. E9
        mov     qword [rsp+48H], rax                    ; 07D6 _ 48: 89. 44 24, 48
        call    _ZN3UCI10parse_moveERK8PositionPc       ; 07DB _ E8, 00000399
        test    eax, eax                                ; 07E0 _ 85. C0
        mov     esi, eax                                ; 07E2 _ 89. C6
        jz      ?_055                                   ; 07E4 _ 74, 71
        mov     rdi, qword [rsp+40H]                    ; 07E6 _ 48: 8B. 7C 24, 40
        xor     eax, eax                                ; 07EB _ 31. C0
        mov     ecx, 20                                 ; 07ED _ B9, 00000014
        mov     rdx, rbx                                ; 07F2 _ 48: 89. DA
        mov     qword [rsp+40H], rbx                    ; 07F5 _ 48: 89. 5C 24, 40
        rep stosd                                       ; 07FA _ F3: AB
        mov     rcx, qword [rel _ZN12_GLOBAL__N_111SetupStatesE]; 07FC _ 48: 8B. 0D, 00000048(rel)
        call    _ZNSt5dequeI9StateInfoSaIS0_EE12emplace_backIIS0_EEEvDpOT_; 0803 _ E8, 00000000(rel)
        mov     rdx, r13                                ; 0808 _ 4C: 89. EA
        mov     rcx, rbx                                ; 080B _ 48: 89. D9
        call    _ZN9CheckInfoC1ERK8Position             ; 080E _ E8, 00000000(rel)
        mov     r8, rbx                                 ; 0813 _ 49: 89. D8
        mov     edx, esi                                ; 0816 _ 89. F2
        mov     rcx, r13                                ; 0818 _ 4C: 89. E9
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 081B _ E8, 00000000(rel)
        mov     r8, qword [rel _ZN12_GLOBAL__N_111SetupStatesE]; 0820 _ 4C: 8B. 05, 00000048(rel)
        movzx   r9d, al                                 ; 0827 _ 44: 0F B6. C8
        mov     r10, qword [r8+30H]                     ; 082B _ 4D: 8B. 50, 30
        cmp     r10, qword [r8+38H]                     ; 082F _ 4D: 3B. 50, 38
        mov     rdx, qword [r8+48H]                     ; 0833 _ 49: 8B. 50, 48
        jnz     ?_054                                   ; 0837 _ 75, 0B
        mov     r10, qword [rdx-8H]                     ; 0839 _ 4C: 8B. 52, F8
        add     r10, 480                                ; 083D _ 49: 81. C2, 000001E0
?_054:  lea     r8, [r10-50H]                           ; 0844 _ 4D: 8D. 42, B0
        mov     edx, esi                                ; 0848 _ 89. F2
        mov     rcx, r13                                ; 084A _ 4C: 89. E9
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 084D _ E8, 00000000(rel)
        jmp     ?_053                                   ; 0852 _ E9, FFFFFF6C

?_055:  jmp     .text+247H                              ; 0857 _ E9, 00000247(rel)

?_056:  mov     rcx, qword [rel .refptr.Threads]        ; 085C _ 48: 8B. 0D, 00000000(rel)
        call    _ZN10ThreadPool4mainEv                  ; 0863 _ E8, 00000000(rel)
        lea     rdx, [rel ?_075]                        ; 0868 _ 48: 8D. 15, 00000000(rel)
        mov     rcx, r13                                ; 086F _ 4C: 89. E9
        movzx   r8d, byte [rel ?_030]                   ; 0872 _ 44: 0F B6. 05, 00000041(rel)
        mov     r9, rax                                 ; 087A _ 49: 89. C1
        call    _ZN8Position9parse_setEPKcbP6Thread     ; 087D _ E8, 00000000(rel)
        jmp     ?_050                                   ; 0882 _ E9, FFFFFD69

?_057:  lea     rdx, [rel ?_085]                        ; 0887 _ 48: 8D. 15, 000000C4(rel)
        mov     rcx, rsi                                ; 088E _ 48: 89. F1
        call    strcmp                                  ; 0891 _ E8, 00000000(rel)
        test    eax, eax                                ; 0896 _ 85. C0
        je      ?_068                                   ; 0898 _ 0F 84, 000001D2
        lea     rdx, [rel ?_086]                        ; 089E _ 48: 8D. 15, 000000CA(rel)
        mov     rcx, rsi                                ; 08A5 _ 48: 89. F1
        call    strcmp                                  ; 08A8 _ E8, 00000000(rel)
        test    eax, eax                                ; 08AD _ 85. C0
        je      ?_067                                   ; 08AF _ 0F 84, 000001A7
        lea     rdx, [rel ?_087]                        ; 08B5 _ 48: 8D. 15, 000000D0(rel)
        mov     rcx, rsi                                ; 08BC _ 48: 89. F1
        call    strcmp                                  ; 08BF _ E8, 00000000(rel)
        test    eax, eax                                ; 08C4 _ 85. C0
        je      ?_066                                   ; 08C6 _ 0F 84, 0000017C
        lea     rdx, [rel ?_088]                        ; 08CC _ 48: 8D. 15, 000000D5(rel)
        mov     rcx, rsi                                ; 08D3 _ 48: 89. F1
        call    strcmp                                  ; 08D6 _ E8, 00000000(rel)
        test    eax, eax                                ; 08DB _ 85. C0
        je      ?_065                                   ; 08DD _ 0F 84, 00000151
        lea     rdx, [rel ?_089]                        ; 08E3 _ 48: 8D. 15, 000000DA(rel)
        mov     rcx, rsi                                ; 08EA _ 48: 89. F1
        call    strcmp                                  ; 08ED _ E8, 00000000(rel)
        test    eax, eax                                ; 08F2 _ 85. C0
        je      ?_064                                   ; 08F4 _ 0F 84, 00000126
        lea     rdx, [rel ?_090]                        ; 08FA _ 48: 8D. 15, 000000E4(rel)
        mov     rcx, rsi                                ; 0901 _ 48: 89. F1
        call    strcmp                                  ; 0904 _ E8, 00000000(rel)
        test    eax, eax                                ; 0909 _ 85. C0
        je      ?_063                                   ; 090B _ 0F 84, 000000FB
        lea     rdx, [rel ?_091]                        ; 0911 _ 48: 8D. 15, 000000EA(rel)
        mov     rcx, rsi                                ; 0918 _ 48: 89. F1
        call    strcmp                                  ; 091B _ E8, 00000000(rel)
        test    eax, eax                                ; 0920 _ 85. C0
        je      ?_062                                   ; 0922 _ 0F 84, 000000D0
        lea     rdx, [rel ?_092]                        ; 0928 _ 48: 8D. 15, 000000F0(rel)
        mov     rcx, rsi                                ; 092F _ 48: 89. F1
        call    strcmp                                  ; 0932 _ E8, 00000000(rel)
        test    eax, eax                                ; 0937 _ 85. C0
        je      ?_061                                   ; 0939 _ 0F 84, 000000A6
        lea     rdx, [rel ?_093]                        ; 093F _ 48: 8D. 15, 000000F9(rel)
        mov     rcx, rsi                                ; 0946 _ 48: 89. F1
        call    strcmp                                  ; 0949 _ E8, 00000000(rel)
        test    eax, eax                                ; 094E _ 85. C0
        jz      ?_060                                   ; 0950 _ 74, 7E
        lea     rdx, [rel ?_094]                        ; 0952 _ 48: 8D. 15, 000000FE(rel)
        mov     rcx, rsi                                ; 0959 _ 48: 89. F1
        call    strcmp                                  ; 095C _ E8, 00000000(rel)
        test    eax, eax                                ; 0961 _ 85. C0
        jnz     ?_059                                   ; 0963 _ 75, 44
        mov     dword [rsp+17CH], 1                     ; 0965 _ C7. 84 24, 0000017C, 00000001
        jmp     ?_048                                   ; 0970 _ E9, FFFFFBB7

?_058:  mov     rcx, qword [rel .refptr.Threads]        ; 0975 _ 48: 8B. 0D, 00000000(rel)
        lea     r9, [rel _ZN12_GLOBAL__N_111SetupStatesE]; 097C _ 4C: 8D. 0D, 00000048(rel)
        mov     r8, r15                                 ; 0983 _ 4D: 89. F8
        mov     rdx, r13                                ; 0986 _ 4C: 89. EA
        call    _ZN10ThreadPool14start_thinkingERK8PositionRKN6Search10LimitsTypeERSt10unique_ptrISt5stackI9StateInfoSt5dequeIS9_SaIS9_EEESt14default_deleteISD_EE; 0989 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+140H]                   ; 098E _ 48: 8B. 8C 24, 00000140
        test    rcx, rcx                                ; 0996 _ 48: 85. C9
        je      .text+247H                              ; 0999 _ 0F 84, 00000247(rel)
        call    _ZdlPv                                  ; 099F _ E8, 00000000(rel)
        jmp     .text+247H                              ; 09A4 _ E9, 00000247(rel)

?_059:  lea     rdx, [rel ?_095]                        ; 09A9 _ 48: 8D. 15, 00000107(rel)
        mov     rcx, rsi                                ; 09B0 _ 48: 89. F1
        call    strcmp                                  ; 09B3 _ E8, 00000000(rel)
        test    eax, eax                                ; 09B8 _ 85. C0
        jne     ?_048                                   ; 09BA _ 0F 85, FFFFFB6C
        mov     dword [rsp+180H], 1                     ; 09C0 _ C7. 84 24, 00000180, 00000001
        jmp     ?_048                                   ; 09CB _ E9, FFFFFB5C

?_060:  mov     rdx, qword [rsp+30H]                    ; 09D0 _ 48: 8B. 54 24, 30
        mov     rcx, rbx                                ; 09D5 _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 09D8 _ E8, 00000000(rel)
        mov     rbx, rax                                ; 09DD _ 48: 89. C3
        jmp     ?_048                                   ; 09E0 _ E9, FFFFFB47

?_061:  mov     rcx, rbx                                ; 09E5 _ 48: 89. D9
        mov     rdx, rdi                                ; 09E8 _ 48: 89. FA
        call    _Z9parse_intPKcRi                       ; 09EB _ E8, 00000000(rel)
        mov     rbx, rax                                ; 09F0 _ 48: 89. C3
        jmp     ?_048                                   ; 09F3 _ E9, FFFFFB34

?_062:  lea     rdx, [r15+48H]                          ; 09F8 _ 49: 8D. 57, 48
        mov     rcx, rbx                                ; 09FC _ 48: 89. D9
        call    _Z9parse_intPKcRx                       ; 09FF _ E8, 00000000(rel)
        mov     rbx, rax                                ; 0A04 _ 48: 89. C3
        jmp     ?_048                                   ; 0A07 _ E9, FFFFFB20

?_063:  lea     rdx, [r15+30H]                          ; 0A0C _ 49: 8D. 57, 30
        mov     rcx, rbx                                ; 0A10 _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 0A13 _ E8, 00000000(rel)
        mov     rbx, rax                                ; 0A18 _ 48: 89. C3
        jmp     ?_048                                   ; 0A1B _ E9, FFFFFB0C

?_064:  lea     rdx, [r15+2CH]                          ; 0A20 _ 49: 8D. 57, 2C
        mov     rcx, rbx                                ; 0A24 _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 0A27 _ E8, 00000000(rel)
        mov     rbx, rax                                ; 0A2C _ 48: 89. C3
        jmp     ?_048                                   ; 0A2F _ E9, FFFFFAF8

?_065:  lea     rdx, [r15+24H]                          ; 0A34 _ 49: 8D. 57, 24
        mov     rcx, rbx                                ; 0A38 _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 0A3B _ E8, 00000000(rel)
        mov     rbx, rax                                ; 0A40 _ 48: 89. C3
        jmp     ?_048                                   ; 0A43 _ E9, FFFFFAE4

?_066:  lea     rdx, [r15+20H]                          ; 0A48 _ 49: 8D. 57, 20
        mov     rcx, rbx                                ; 0A4C _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 0A4F _ E8, 00000000(rel)
        mov     rbx, rax                                ; 0A54 _ 48: 89. C3
        jmp     ?_048                                   ; 0A57 _ E9, FFFFFAD0

?_067:  lea     rdx, [r15+1CH]                          ; 0A5C _ 49: 8D. 57, 1C
        mov     rcx, rbx                                ; 0A60 _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 0A63 _ E8, 00000000(rel)
        mov     rbx, rax                                ; 0A68 _ 48: 89. C3
        jmp     ?_048                                   ; 0A6B _ E9, FFFFFABC

?_068:  ; Local function
        lea     rdx, [r15+18H]                          ; 0A70 _ 49: 8D. 57, 18
        mov     rcx, rbx                                ; 0A74 _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 0A77 _ E8, 00000000(rel)
        mov     rbx, rax                                ; 0A7C _ 48: 89. C3
        jmp     ?_048                                   ; 0A7F _ E9, FFFFFAA8

        lea     rdx, [rel ?_082]                        ; 0A84 _ 48: 8D. 15, 000000AC(rel)
        mov     rcx, r12                                ; 0A8B _ 4C: 89. E1
        call    _Z12print_stringPcPKc                   ; 0A8E _ E8, 00000000(rel)
        mov     rcx, r12                                ; 0A93 _ 4C: 89. E1
        mov     rdx, rax                                ; 0A96 _ 48: 89. C2
        call    _Z9write_outPcS_                        ; 0A99 _ E8, 00000000(rel)
        jmp     .text+247H                              ; 0A9E _ E9, 00000247(rel)

        mov     r8, qword [rel .refptr._ZN6Search7SignalsE]; 0AA3 _ 4C: 8B. 05, 00000000(rel)
        movzx   r10d, byte [r8+1H]                      ; 0AAA _ 45: 0F B6. 50, 01
        test    r10b, r10b                              ; 0AAF _ 45: 84. D2
        je      .text+16BH                              ; 0AB2 _ 0F 84, 0000016B(rel)
?_069:  mov     rcx, qword [rel .refptr.Threads]        ; 0AB8 _ 48: 8B. 0D, 00000000(rel)
        mov     byte [r8], 1                            ; 0ABF _ 41: C6. 00, 01
        call    _ZN10ThreadPool4mainEv                  ; 0AC3 _ E8, 00000000(rel)
        mov     edx, 1                                  ; 0AC8 _ BA, 00000001
        mov     rcx, rax                                ; 0ACD _ 48: 89. C1
        call    _ZN6Thread15start_searchingEb           ; 0AD0 _ E8, 00000000(rel)
        jmp     .text+247H                              ; 0AD5 _ E9, 00000247(rel)

        mov     rbp, qword [rel .refptr._ZN6Search7SignalsE]; 0ADA _ 48: 8B. 2D, 00000000(rel)
        mov     rcx, qword [rel .refptr.Threads]        ; 0AE1 _ 48: 8B. 0D, 00000000(rel)
        mov     byte [rbp], 1                           ; 0AE8 _ C6. 45, 00, 01
        call    _ZN10ThreadPool4mainEv                  ; 0AEC _ E8, 00000000(rel)
        mov     edx, 1                                  ; 0AF1 _ BA, 00000001
        mov     rcx, rax                                ; 0AF6 _ 48: 89. C1
        call    _ZN6Thread15start_searchingEb           ; 0AF9 _ E8, 00000000(rel)
        jmp     ?_004                                   ; 0AFE _ E9, 00000250(rel)

        mov     r8, qword [rsp+38H]                     ; 0B03 _ 4C: 8B. 44 24, 38
        jmp     ?_069                                   ; 0B08 _ EB, AE

_ZN3UCI11print_valueEPc5Value.cold.75:; Local function
        lea     rdx, [rel ?_130]                        ; 0B0A _ 48: 8D. 15, 000004D7(rel)
        call    _Z12print_stringPcPKc                   ; 0B11 _ E8, 00000000(rel)
        test    ebx, ebx                                ; 0B16 _ 85. DB
        mov     rcx, rax                                ; 0B18 _ 48: 89. C1
        jle     ?_071                                   ; 0B1B _ 7E, 21
        mov     r9d, 32001                              ; 0B1D _ 41: B9, 00007D01
        mov     eax, r9d                                ; 0B23 _ 44: 89. C8
        sub     eax, ebx                                ; 0B26 _ 29. D8
?_070:  mov     r10d, 2                                 ; 0B28 _ 41: BA, 00000002
        cdq                                             ; 0B2E _ 99
        idiv    r10d                                    ; 0B2F _ 41: F7. FA
        mov     edx, eax                                ; 0B32 _ 89. C2
        add     rsp, 32                                 ; 0B34 _ 48: 83. C4, 20
        pop     rbx                                     ; 0B38 _ 5B
        jmp     _Z9print_intPci                         ; 0B39 _ E9, 00000000(rel)

?_071:  ; Local function
        mov     r8d, 4294935296                         ; 0B3E _ 41: B8, FFFF8300
        mov     eax, r8d                                ; 0B44 _ 44: 89. C0
        sub     eax, ebx                                ; 0B47 _ 29. D8
        jmp     ?_070                                   ; 0B49 _ EB, DD

_ZN3UCI10print_moveEPc4Moveb.cold.76:; Local function
        lea     rdx, [rel ?_131]                        ; 0B4B _ 48: 8D. 15, 000004DD(rel)
        jmp     _Z12print_stringPcPKc                   ; 0B52 _ E9, 00000000(rel)

        lea     rdx, [rel ?_132]                        ; 0B57 _ 48: 8D. 15, 000004E4(rel)
        jmp     _Z12print_stringPcPKc                   ; 0B5E _ E9, 00000000(rel)

__tcf_1.cold.77:; Local function
        mov     rcx, rbx                                ; 0B63 _ 48: 89. D9
        call    _ZNSt11_Deque_baseI9StateInfoSaIS0_EED2Ev; 0B66 _ E8, 00000000(rel)
        mov     rcx, rbx                                ; 0B6B _ 48: 89. D9
        add     rsp, 32                                 ; 0B6E _ 48: 83. C4, 20
        pop     rbx                                     ; 0B72 _ 5B
        jmp     _ZdlPv                                  ; 0B73 _ E9, 00000000(rel)

__tcf_0.cold.78:; Local function
        ret                                             ; 0B78 _ C3

_ZN3UCI10parse_moveERK8PositionPc:; Function begin
        push    r13                                     ; 0B79 _ 41: 55
        push    r12                                     ; 0B7B _ 41: 54
        push    rbp                                     ; 0B7D _ 55
        push    rdi                                     ; 0B7E _ 57
        push    rsi                                     ; 0B7F _ 56
        push    rbx                                     ; 0B80 _ 53
        sub     rsp, 2120                               ; 0B81 _ 48: 81. EC, 00000848
        lea     rbx, [rsp+30H]                          ; 0B88 _ 48: 8D. 5C 24, 30
        mov     r13, rdx                                ; 0B8D _ 49: 89. D5
        mov     rbp, rcx                                ; 0B90 _ 48: 89. CD
        lea     rsi, [rsp+20H]                          ; 0B93 _ 48: 8D. 74 24, 20
        mov     rdx, rbx                                ; 0B98 _ 48: 89. DA
        call    _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_; 0B9B _ E8, 00000000(rel)
        mov     rdi, rax                                ; 0BA0 _ 48: 89. C7
        mov     qword [rsp+830H], rax                   ; 0BA3 _ 48: 89. 84 24, 00000830
?_072:  cmp     rbx, rdi                                ; 0BAB _ 48: 39. FB
        mov     r12, rbx                                ; 0BAE _ 49: 89. DC
        jz      ?_073                                   ; 0BB1 _ 74, 2E
        mov     edx, dword [rbx]                        ; 0BB3 _ 8B. 13
        mov     rcx, rsi                                ; 0BB5 _ 48: 89. F1
        add     rbx, 8                                  ; 0BB8 _ 48: 83. C3, 08
        movzx   r8d, byte [rbp+3C0H]                    ; 0BBC _ 44: 0F B6. 85, 000003C0
        call    _ZN3UCI10print_moveEPc4Moveb            ; 0BC4 _ E8, 00000300(rel)
        mov     rdx, r13                                ; 0BC9 _ 4C: 89. EA
        mov     rcx, rsi                                ; 0BCC _ 48: 89. F1
        mov     byte [rax], 0                           ; 0BCF _ C6. 00, 00
        call    strcmp                                  ; 0BD2 _ E8, 00000000(rel)
        test    eax, eax                                ; 0BD7 _ 85. C0
        jnz     ?_072                                   ; 0BD9 _ 75, D0
        mov     eax, dword [r12]                        ; 0BDB _ 41: 8B. 04 24
        jmp     ?_074                                   ; 0BDF _ EB, 02

?_073:  xor     eax, eax                                ; 0BE1 _ 31. C0
?_074:  add     rsp, 2120                               ; 0BE3 _ 48: 81. C4, 00000848
        pop     rbx                                     ; 0BEA _ 5B
        pop     rsi                                     ; 0BEB _ 5E
        pop     rdi                                     ; 0BEC _ 5F
        pop     rbp                                     ; 0BED _ 5D
        pop     r12                                     ; 0BEE _ 41: 5C
        pop     r13                                     ; 0BF0 _ 41: 5D
        ret                                             ; 0BF2 _ C3
; _ZN3UCI10parse_moveERK8PositionPc End of function

_ZN3UCI12print_squareEPc6Square:; Function begin
        mov     eax, edx                                ; 0BF3 _ 89. D0
        shr     rdx, 3                                  ; 0BF5 _ 48: C1. EA, 03
        and     eax, 07H                                ; 0BF9 _ 83. E0, 07
        add     edx, 49                                 ; 0BFC _ 83. C2, 31
        add     eax, 97                                 ; 0BFF _ 83. C0, 61
        mov     byte [rcx+1H], dl                       ; 0C02 _ 88. 51, 01
        mov     byte [rcx], al                          ; 0C05 _ 88. 01
        lea     rax, [rcx+2H]                           ; 0C07 _ 48: 8D. 41, 02
        ret                                             ; 0C0B _ C3
; _ZN3UCI12print_squareEPc6Square End of function

        nop                                             ; 0C0C _ 90
        nop                                             ; 0C0D _ 90
        nop                                             ; 0C0E _ 90
        nop                                             ; 0C0F _ 90


SECTION .text.startup align=16 execute                  ; section number 5, code

.text.startup:; Local function
_GLOBAL__sub_I_Opt:
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     ecx, 8                                  ; 0004 _ B9, 00000008
        mov     dword [rel ?_020], 0                    ; 0009 _ C7. 05, 00000014(rel), 00000000
        mov     qword [rel Opt], 1                      ; 0013 _ 48: C7. 05, FFFFFFFC(rel), 00000001
        mov     qword [rel ?_018], 16                   ; 001E _ 48: C7. 05, 00000004(rel), 00000010
        mov     byte [rel ?_031], 0                     ; 0029 _ C6. 05, 00000041(rel), 00
        mov     qword [rel ?_019], 1                    ; 0030 _ 48: C7. 05, 0000000C(rel), 00000001
        mov     dword [rel ?_021], 20                   ; 003B _ C7. 05, 00000018(rel), 00000014
        mov     dword [rel ?_022], 30                   ; 0045 _ C7. 05, 0000001C(rel), 0000001E
        mov     dword [rel ?_023], 20                   ; 004F _ C7. 05, 00000020(rel), 00000014
        mov     dword [rel ?_024], 80                   ; 0059 _ C7. 05, 00000024(rel), 00000050
        mov     byte [rel ?_030], 0                     ; 0063 _ C6. 05, 00000040(rel), 00
        mov     dword [rel ?_025], 0                    ; 006A _ C7. 05, 00000028(rel), 00000000
        call    _Znay                                   ; 0074 _ E8, 00000000(rel)
        lea     rcx, [rel __tcf_0]                      ; 0079 _ 48: 8D. 0D, 000003E0(rel)
        mov     rdx, qword 3E7974706D653CH              ; 0080 _ 48: BA, 003E7974706D653C
        mov     qword [rel ?_026], rax                  ; 008A _ 48: 89. 05, 00000030(rel)
        mov     qword [rax], rdx                        ; 0091 _ 48: 89. 10
        mov     dword [rel ?_027], 1                    ; 0094 _ C7. 05, 00000034(rel), 00000001
        mov     byte [rel ?_029], 1                     ; 009E _ C6. 05, 0000003F(rel), 01
        mov     dword [rel ?_028], 6                    ; 00A5 _ C7. 05, 00000038(rel), 00000006
        call    atexit                                  ; 00AF _ E8, 00000000(rel)
        lea     rcx, [rel __tcf_1]                      ; 00B4 _ 48: 8D. 0D, 000003C0(rel)
        add     rsp, 40                                 ; 00BB _ 48: 83. C4, 28
        jmp     atexit                                  ; 00BF _ E9, 00000000(rel)

        nop                                             ; 00C4 _ 90
        nop                                             ; 00C5 _ 90
        nop                                             ; 00C6 _ 90
        nop                                             ; 00C7 _ 90
        nop                                             ; 00C8 _ 90
        nop                                             ; 00C9 _ 90
        nop                                             ; 00CA _ 90
        nop                                             ; 00CB _ 90
        nop                                             ; 00CC _ 90
        nop                                             ; 00CD _ 90
        nop                                             ; 00CE _ 90
        nop                                             ; 00CF _ 90


SECTION .xdata.startup align=4 noexecute                ; section number 6, const

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .ctors  align=8 noexecute                       ; section number 8, data

        dq _GLOBAL__sub_I_Opt                           ; 0000 _ 0000000000000000 (d)


SECTION .rdata  align=16 noexecute                      ; section number 9, const

?_075:                                                  ; byte
        db 72H, 6EH, 62H, 71H, 6BH, 62H, 6EH, 72H       ; 0000 _ rnbqkbnr
        db 2FH, 70H, 70H, 70H, 70H, 70H, 70H, 70H       ; 0008 _ /ppppppp
        db 70H, 2FH, 38H, 2FH, 38H, 2FH, 38H, 2FH       ; 0010 _ p/8/8/8/
        db 38H, 2FH, 50H, 50H, 50H, 50H, 50H, 50H       ; 0018 _ 8/PPPPPP
        db 50H, 50H, 2FH, 52H, 4EH, 42H, 51H, 4BH       ; 0020 _ PP/RNBQK
        db 42H, 4EH, 52H, 20H, 77H, 20H, 4BH, 51H       ; 0028 _ BNR w KQ
        db 6BH, 71H, 20H, 2DH, 20H, 30H, 20H, 31H       ; 0030 _ kq - 0 1
        db 00H                                          ; 0038 _ .

?_076:                                                  ; byte
        db 69H, 64H, 20H, 6EH, 61H, 6DH, 65H, 20H       ; 0039 _ id name 
        db 53H, 74H, 6FH, 63H, 6BH, 66H, 69H, 73H       ; 0041 _ Stockfis
        db 68H, 20H, 6CH, 65H, 61H, 6EH, 0AH, 00H       ; 0049 _ h lean..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H            ; 0051 _ .......

?_077:                                                  ; byte
        db 69H, 64H, 20H, 61H, 75H, 74H, 68H, 6FH       ; 0058 _ id autho
        db 72H, 20H, 54H, 6FH, 72H, 64H, 20H, 52H       ; 0060 _ r Tord R
        db 6FH, 6DH, 73H, 74H, 61H, 64H, 2CH, 20H       ; 0068 _ omstad, 
        db 4DH, 61H, 72H, 63H, 6FH, 20H, 43H, 6FH       ; 0070 _ Marco Co
        db 73H, 74H, 61H, 6CH, 62H, 61H, 20H, 61H       ; 0078 _ stalba a
        db 6EH, 64H, 20H, 4AH, 6FH, 6FH, 6EH, 61H       ; 0080 _ nd Joona
        db 20H, 4BH, 69H, 69H, 73H, 6BH, 69H, 0AH       ; 0088 _  Kiiski.
        db 00H                                          ; 0090 _ .

?_078:                                                  ; byte
        db 75H, 63H, 69H, 6FH, 6BH, 0AH, 00H            ; 0091 _ uciok..

?_079:                                                  ; byte
        db 71H, 75H, 69H, 74H, 00H                      ; 0098 _ quit.

?_080:                                                  ; byte
        db 73H, 74H, 6FH, 70H, 00H                      ; 009D _ stop.

?_081:                                                  ; byte
        db 70H, 6FH, 6EH, 64H, 65H, 72H, 68H, 69H       ; 00A2 _ ponderhi
        db 74H, 00H                                     ; 00AA _ t.

?_082:                                                  ; byte
        db 72H, 65H, 61H, 64H, 79H, 6FH, 6BH, 0AH       ; 00AC _ readyok.
        db 00H                                          ; 00B4 _ .

?_083:                                                  ; byte
        db 67H, 6FH, 00H                                ; 00B5 _ go.

?_084:                                                  ; byte
        db 73H, 65H, 61H, 72H, 63H, 68H, 6DH, 6FH       ; 00B8 _ searchmo
        db 76H, 65H, 73H, 00H                           ; 00C0 _ ves.

?_085:                                                  ; byte
        db 77H, 74H, 69H, 6DH, 65H, 00H                 ; 00C4 _ wtime.

?_086:                                                  ; byte
        db 62H, 74H, 69H, 6DH, 65H, 00H                 ; 00CA _ btime.

?_087:                                                  ; byte
        db 77H, 69H, 6EH, 63H, 00H                      ; 00D0 _ winc.

?_088:                                                  ; byte
        db 62H, 69H, 6EH, 63H, 00H                      ; 00D5 _ binc.

?_089:                                                  ; byte
        db 6DH, 6FH, 76H, 65H, 73H, 74H, 6FH, 67H       ; 00DA _ movestog
        db 6FH, 00H                                     ; 00E2 _ o.

?_090:                                                  ; byte
        db 64H, 65H, 70H, 74H, 68H, 00H                 ; 00E4 _ depth.

?_091:                                                  ; byte
        db 6EH, 6FH, 64H, 65H, 73H, 00H                 ; 00EA _ nodes.

?_092:                                                  ; byte
        db 6DH, 6FH, 76H, 65H, 74H, 69H, 6DH, 65H       ; 00F0 _ movetime
        db 00H                                          ; 00F8 _ .

?_093:                                                  ; byte
        db 6DH, 61H, 74H, 65H, 00H                      ; 00F9 _ mate.

?_094:                                                  ; byte
        db 69H, 6EH, 66H, 69H, 6EH, 69H, 74H, 65H       ; 00FE _ infinite
        db 00H                                          ; 0106 _ .

?_095:                                                  ; byte
        db 70H, 6FH, 6EH, 64H, 65H, 72H, 00H            ; 0107 _ ponder.

?_096:                                                  ; byte
        db 70H, 6FH, 73H, 69H, 74H, 69H, 6FH, 6EH       ; 010E _ position
        db 00H                                          ; 0116 _ .

?_097:                                                  ; byte
        db 73H, 74H, 61H, 72H, 74H, 70H, 6FH, 73H       ; 0117 _ startpos
        db 00H                                          ; 011F _ .

?_098:                                                  ; byte
        db 66H, 65H, 6EH, 00H                           ; 0120 _ fen.

?_099:                                                  ; byte
        db 75H, 63H, 69H, 00H                           ; 0124 _ uci.

?_100:                                                  ; byte
        db 75H, 63H, 69H, 6EH, 65H, 77H, 67H, 61H       ; 0128 _ ucinewga
        db 6DH, 65H, 00H                                ; 0130 _ me.

?_101:                                                  ; byte
        db 73H, 65H, 74H, 6FH, 70H, 74H, 69H, 6FH       ; 0133 _ setoptio
        db 6EH, 00H                                     ; 013B _ n.

?_102:                                                  ; byte
        db 68H, 61H, 73H, 68H, 00H                      ; 013D _ hash.

?_103:                                                  ; byte
        db 74H, 68H, 72H, 65H, 61H, 64H, 73H, 00H       ; 0142 _ threads.

?_104:                                                  ; byte
        db 63H, 6CH, 65H, 61H, 72H, 68H, 61H, 73H       ; 014A _ clearhas
        db 68H, 00H                                     ; 0152 _ h.

?_105:                                                  ; byte
        db 63H, 6FH, 6EH, 74H, 65H, 6DH, 70H, 74H       ; 0154 _ contempt
        db 00H                                          ; 015C _ .

?_106:                                                  ; byte
        db 6DH, 75H, 6CH, 74H, 69H, 70H, 76H, 00H       ; 015D _ multipv.

?_107:                                                  ; byte
        db 6DH, 69H, 6EH, 74H, 68H, 69H, 6EH, 6BH       ; 0165 _ minthink
        db 74H, 69H, 6DH, 65H, 00H                      ; 016D _ time.

?_108:                                                  ; byte
        db 6DH, 6FH, 76H, 65H, 6FH, 76H, 65H, 72H       ; 0172 _ moveover
        db 68H, 65H, 61H, 64H, 00H                      ; 017A _ head.

?_109:                                                  ; byte
        db 73H, 6BH, 69H, 6CH, 6CH, 6CH, 65H, 76H       ; 017F _ skilllev
        db 65H, 6CH, 00H                                ; 0187 _ el.

?_110:                                                  ; byte
        db 73H, 6CH, 6FH, 77H, 6DH, 6FH, 76H, 65H       ; 018A _ slowmove
        db 72H, 00H                                     ; 0192 _ r.

?_111:                                                  ; byte
        db 73H, 79H, 7AH, 79H, 67H, 79H, 70H, 61H       ; 0194 _ syzygypa
        db 74H, 68H, 00H                                ; 019C _ th.

?_112:                                                  ; byte
        db 70H, 65H, 72H, 66H, 74H, 00H                 ; 019F _ perft.

?_113:                                                  ; byte
        db 62H, 65H, 6EH, 63H, 68H, 00H                 ; 01A5 _ bench.

?_114:                                                  ; byte
        db 55H, 6EH, 6BH, 6EH, 6FH, 77H, 6EH, 20H       ; 01AB _ Unknown 
        db 63H, 6FH, 6DH, 6DH, 61H, 6EH, 64H, 3AH       ; 01B3 _ command:
        db 20H, 00H                                     ; 01BB _  .

?_115:                                                  ; byte
        db 69H, 73H, 72H, 65H, 61H, 64H, 79H, 00H       ; 01BD _ isready.
        db 00H, 00H, 00H                                ; 01C5 _ ...

?_116:                                                  ; byte
        db 76H, 65H, 63H, 74H, 6FH, 72H, 3AH, 3AH       ; 01C8 _ vector::
        db 5FH, 4DH, 5FH, 72H, 61H, 6EH, 67H, 65H       ; 01D0 _ _M_range
        db 5FH, 63H, 68H, 65H, 63H, 6BH, 3AH, 20H       ; 01D8 _ _check: 
        db 5FH, 5FH, 6EH, 20H, 28H, 77H, 68H, 69H       ; 01E0 _ __n (whi
        db 63H, 68H, 20H, 69H, 73H, 20H, 25H, 7AH       ; 01E8 _ ch is %z
        db 75H, 29H, 20H, 3EH, 3DH, 20H, 74H, 68H       ; 01F0 _ u) >= th
        db 69H, 73H, 2DH, 3EH, 73H, 69H, 7AH, 65H       ; 01F8 _ is->size
        db 28H, 29H, 20H, 28H, 77H, 68H, 69H, 63H       ; 0200 _ () (whic
        db 68H, 20H, 69H, 73H, 20H, 25H, 7AH, 75H       ; 0208 _ h is %zu
        db 29H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0210 _ ).......

?_117:                                                  ; byte
        db 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H, 6EH       ; 0218 _ option n
        db 61H, 6DH, 65H, 20H, 54H, 68H, 72H, 65H       ; 0220 _ ame Thre
        db 61H, 64H, 73H, 20H, 74H, 79H, 70H, 65H       ; 0228 _ ads type
        db 20H, 73H, 70H, 69H, 6EH, 20H, 64H, 65H       ; 0230 _  spin de
        db 66H, 61H, 75H, 6CH, 74H, 20H, 31H, 20H       ; 0238 _ fault 1 
        db 6DH, 69H, 6EH, 20H, 31H, 20H, 6DH, 61H       ; 0240 _ min 1 ma
        db 78H, 20H, 35H, 30H, 0AH, 00H, 00H, 00H       ; 0248 _ x 50....

?_118:                                                  ; byte
        db 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H, 6EH       ; 0250 _ option n
        db 61H, 6DH, 65H, 20H, 48H, 61H, 73H, 68H       ; 0258 _ ame Hash
        db 20H, 74H, 79H, 70H, 65H, 20H, 73H, 70H       ; 0260 _  type sp
        db 69H, 6EH, 20H, 64H, 65H, 66H, 61H, 75H       ; 0268 _ in defau
        db 6CH, 74H, 20H, 31H, 36H, 20H, 6DH, 69H       ; 0270 _ lt 16 mi
        db 6EH, 20H, 31H, 20H, 6DH, 61H, 78H, 20H       ; 0278 _ n 1 max 
        db 31H, 30H, 34H, 38H, 35H, 37H, 36H, 0AH       ; 0280 _ 1048576.
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0288 _ ........

?_119:                                                  ; byte
        db 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H, 6EH       ; 0290 _ option n
        db 61H, 6DH, 65H, 20H, 4DH, 75H, 6CH, 74H       ; 0298 _ ame Mult
        db 69H, 50H, 56H, 20H, 74H, 79H, 70H, 65H       ; 02A0 _ iPV type
        db 20H, 73H, 70H, 69H, 6EH, 20H, 64H, 65H       ; 02A8 _  spin de
        db 66H, 61H, 75H, 6CH, 74H, 20H, 31H, 20H       ; 02B0 _ fault 1 
        db 6DH, 69H, 6EH, 20H, 31H, 20H, 6DH, 61H       ; 02B8 _ min 1 ma
        db 78H, 20H, 32H, 35H, 30H, 0AH, 00H, 00H       ; 02C0 _ x 250...

?_120:                                                  ; byte
        db 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H, 6EH       ; 02C8 _ option n
        db 61H, 6DH, 65H, 20H, 43H, 6FH, 6EH, 74H       ; 02D0 _ ame Cont
        db 65H, 6DH, 70H, 74H, 20H, 74H, 79H, 70H       ; 02D8 _ empt typ
        db 65H, 20H, 73H, 70H, 69H, 6EH, 20H, 64H       ; 02E0 _ e spin d
        db 65H, 66H, 61H, 75H, 6CH, 74H, 20H, 30H       ; 02E8 _ efault 0
        db 20H, 6DH, 69H, 6EH, 20H, 2DH, 31H, 30H       ; 02F0 _  min -10
        db 30H, 20H, 6DH, 61H, 78H, 20H, 31H, 30H       ; 02F8 _ 0 max 10
        db 30H, 0AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 0300 _ 0.......

?_121:                                                  ; byte
        db 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H, 6EH       ; 0308 _ option n
        db 61H, 6DH, 65H, 20H, 53H, 6BH, 69H, 6CH       ; 0310 _ ame Skil
        db 6CH, 4CH, 65H, 76H, 65H, 6CH, 20H, 74H       ; 0318 _ lLevel t
        db 79H, 70H, 65H, 20H, 73H, 70H, 69H, 6EH       ; 0320 _ ype spin
        db 20H, 64H, 65H, 66H, 61H, 75H, 6CH, 74H       ; 0328 _  default
        db 20H, 32H, 30H, 20H, 6DH, 69H, 6EH, 20H       ; 0330 _  20 min 
        db 30H, 20H, 6DH, 61H, 78H, 20H, 32H, 30H       ; 0338 _ 0 max 20
        db 0AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0340 _ ........

?_122:                                                  ; byte
        db 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H, 6EH       ; 0348 _ option n
        db 61H, 6DH, 65H, 20H, 4DH, 6FH, 76H, 65H       ; 0350 _ ame Move
        db 4FH, 76H, 65H, 72H, 68H, 65H, 61H, 64H       ; 0358 _ Overhead
        db 20H, 74H, 79H, 70H, 65H, 20H, 73H, 70H       ; 0360 _  type sp
        db 69H, 6EH, 20H, 64H, 65H, 66H, 61H, 75H       ; 0368 _ in defau
        db 6CH, 74H, 20H, 33H, 30H, 20H, 6DH, 69H       ; 0370 _ lt 30 mi
        db 6EH, 20H, 30H, 20H, 6DH, 61H, 78H, 20H       ; 0378 _ n 0 max 
        db 35H, 30H, 30H, 30H, 0AH, 00H, 00H, 00H       ; 0380 _ 5000....

?_123:                                                  ; byte
        db 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H, 6EH       ; 0388 _ option n
        db 61H, 6DH, 65H, 20H, 4DH, 69H, 6EH, 54H       ; 0390 _ ame MinT
        db 68H, 69H, 6EH, 6BH, 54H, 69H, 6DH, 65H       ; 0398 _ hinkTime
        db 20H, 74H, 79H, 70H, 65H, 20H, 73H, 70H       ; 03A0 _  type sp
        db 69H, 6EH, 20H, 64H, 65H, 66H, 61H, 75H       ; 03A8 _ in defau
        db 6CH, 74H, 20H, 32H, 30H, 20H, 6DH, 69H       ; 03B0 _ lt 20 mi
        db 6EH, 20H, 30H, 20H, 6DH, 61H, 78H, 20H       ; 03B8 _ n 0 max 
        db 35H, 30H, 30H, 30H, 0AH, 00H, 00H, 00H       ; 03C0 _ 5000....

?_124:                                                  ; byte
        db 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H, 6EH       ; 03C8 _ option n
        db 61H, 6DH, 65H, 20H, 53H, 6CH, 6FH, 77H       ; 03D0 _ ame Slow
        db 4DH, 6FH, 76H, 65H, 72H, 20H, 74H, 79H       ; 03D8 _ Mover ty
        db 70H, 65H, 20H, 73H, 70H, 69H, 6EH, 20H       ; 03E0 _ pe spin 
        db 64H, 65H, 66H, 61H, 75H, 6CH, 74H, 20H       ; 03E8 _ default 
        db 38H, 30H, 20H, 6DH, 69H, 6EH, 20H, 31H       ; 03F0 _ 80 min 1
        db 30H, 20H, 6DH, 61H, 78H, 20H, 31H, 30H       ; 03F8 _ 0 max 10
        db 30H, 30H, 0AH, 00H, 00H, 00H, 00H, 00H       ; 0400 _ 00......

?_125:                                                  ; byte
        db 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H, 6EH       ; 0408 _ option n
        db 61H, 6DH, 65H, 20H, 4EH, 6FH, 64H, 65H       ; 0410 _ ame Node
        db 73H, 54H, 69H, 6DH, 65H, 20H, 74H, 79H       ; 0418 _ sTime ty
        db 70H, 65H, 20H, 73H, 70H, 69H, 6EH, 20H       ; 0420 _ pe spin 
        db 64H, 65H, 66H, 61H, 75H, 6CH, 74H, 20H       ; 0428 _ default 
        db 30H, 20H, 6DH, 69H, 6EH, 20H, 30H, 20H       ; 0430 _ 0 min 0 
        db 6DH, 61H, 78H, 20H, 31H, 30H, 30H, 30H       ; 0438 _ max 1000
        db 30H, 0AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 0440 _ 0.......

?_126:                                                  ; byte
        db 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H, 6EH       ; 0448 _ option n
        db 61H, 6DH, 65H, 20H, 43H, 6CH, 65H, 61H       ; 0450 _ ame Clea
        db 72H, 48H, 61H, 73H, 68H, 20H, 74H, 79H       ; 0458 _ rHash ty
        db 70H, 65H, 20H, 62H, 75H, 74H, 74H, 6FH       ; 0460 _ pe butto
        db 6EH, 0AH, 00H, 00H, 00H, 00H, 00H, 00H       ; 0468 _ n.......

?_127:                                                  ; byte
        db 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H, 6EH       ; 0470 _ option n
        db 61H, 6DH, 65H, 20H, 50H, 6FH, 6EH, 64H       ; 0478 _ ame Pond
        db 65H, 72H, 20H, 74H, 79H, 70H, 65H, 20H       ; 0480 _ er type 
        db 63H, 68H, 65H, 63H, 6BH, 20H, 64H, 65H       ; 0488 _ check de
        db 66H, 61H, 75H, 6CH, 74H, 20H, 66H, 61H       ; 0490 _ fault fa
        db 6CH, 73H, 65H, 0AH, 00H, 00H, 00H, 00H       ; 0498 _ lse.....

?_128:                                                  ; byte
        db 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H, 6EH       ; 04A0 _ option n
        db 61H, 6DH, 65H, 20H, 55H, 43H, 49H, 5FH       ; 04A8 _ ame UCI_
        db 43H, 68H, 65H, 73H, 73H, 39H, 36H, 30H       ; 04B0 _ Chess960
        db 20H, 74H, 79H, 70H, 65H, 20H, 63H, 68H       ; 04B8 _  type ch
        db 65H, 63H, 6BH, 20H, 64H, 65H, 66H, 61H       ; 04C0 _ eck defa
        db 75H, 6CH, 74H, 20H, 66H, 61H, 6CH, 73H       ; 04C8 _ ult fals
        db 65H, 0AH, 00H                                ; 04D0 _ e..

?_129:                                                  ; byte
        db 63H, 70H, 20H, 00H                           ; 04D3 _ cp .

?_130:                                                  ; byte
        db 6DH, 61H, 74H, 65H, 20H, 00H                 ; 04D7 _ mate .

?_131:                                                  ; byte
        db 28H, 6EH, 6FH, 6EH, 65H, 29H, 00H            ; 04DD _ (none).

?_132:                                                  ; byte
        db 30H, 30H, 30H, 30H, 00H                      ; 04E4 _ 0000.

?_133:                                                  ; byte
        db 20H, 70H, 6EH, 62H, 72H, 71H, 6BH, 00H       ; 04E9 _  pnbrqk.
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 04F1 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H            ; 04F9 _ .......


SECTION .xdata  align=4 noexecute                       ; section number 10, const

        db 01H, 19H, 0AH, 00H, 19H, 01H, 43H, 03H       ; 0000 _ ......C.
        db 11H, 30H, 10H, 60H, 0FH, 70H, 0EH, 50H       ; 0008 _ .0.`.p.P
        db 0DH, 0C0H, 0BH, 0D0H, 09H, 0E0H, 02H, 0F0H   ; 0010 _ ........
        db 01H, 05H, 02H, 00H, 05H, 32H, 01H, 30H       ; 0018 _ .....2.0
        db 01H, 00H, 00H, 00H, 01H, 05H, 02H, 00H       ; 0020 _ ........
        db 05H, 32H, 01H, 30H, 01H, 00H, 00H, 00H       ; 0028 _ .2.0....


SECTION .text$_ZN10ThreadPool4mainEv align=16 execute   ; section number 12, code
;  Communal section not supported by YASM

_ZN10ThreadPool4mainEv:; Function begin
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     rdx, qword [rcx]                        ; 0004 _ 48: 8B. 11
        mov     rax, qword [rcx+8H]                     ; 0007 _ 48: 8B. 41, 08
        sub     rax, rdx                                ; 000B _ 48: 29. D0
        sar     rax, 3                                  ; 000E _ 48: C1. F8, 03
        test    rax, rax                                ; 0012 _ 48: 85. C0
        jz      ?_134                                   ; 0015 _ 74, 08
        mov     rax, qword [rdx]                        ; 0017 _ 48: 8B. 02
        add     rsp, 40                                 ; 001A _ 48: 83. C4, 28
        ret                                             ; 001E _ C3
; _ZN10ThreadPool4mainEv End of function

?_134:  ; Local function
        lea     rcx, [rel ?_116]                        ; 001F _ 48: 8D. 0D, 000001C8(rel)
        xor     r8d, r8d                                ; 0026 _ 45: 31. C0
        xor     edx, edx                                ; 0029 _ 31. D2
        call    _ZSt24__throw_out_of_range_fmtPKcz      ; 002B _ E8, 00000000(rel)
        nop                                             ; 0030 _ 90
        nop                                             ; 0031 _ 90
        nop                                             ; 0032 _ 90
        nop                                             ; 0033 _ 90
        nop                                             ; 0034 _ 90
        nop                                             ; 0035 _ 90
        nop                                             ; 0036 _ 90
        nop                                             ; 0037 _ 90
        nop                                             ; 0038 _ 90
        nop                                             ; 0039 _ 90
        nop                                             ; 003A _ 90
        nop                                             ; 003B _ 90
        nop                                             ; 003C _ 90
        nop                                             ; 003D _ 90
        nop                                             ; 003E _ 90
        nop                                             ; 003F _ 90


SECTION .xdata$_ZN10ThreadPool4mainEv align=4 noexecute ; section number 13, const
;  Communal section not supported by YASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .text$_ZN3UCI7Options13print_optionsEPc align=16 execute ; section number 15, code
;  Communal section not supported by YASM

_ZN3UCI7Options13print_optionsEPc:; Function begin
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     rcx, rdx                                ; 0004 _ 48: 89. D1
        lea     rdx, [rel ?_117]                        ; 0007 _ 48: 8D. 15, 00000218(rel)
        call    _Z12print_stringPcPKc                   ; 000E _ E8, 00000000(rel)
        lea     rdx, [rel ?_118]                        ; 0013 _ 48: 8D. 15, 00000250(rel)
        mov     rcx, rax                                ; 001A _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 001D _ E8, 00000000(rel)
        lea     rdx, [rel ?_119]                        ; 0022 _ 48: 8D. 15, 00000290(rel)
        mov     rcx, rax                                ; 0029 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 002C _ E8, 00000000(rel)
        lea     rdx, [rel ?_120]                        ; 0031 _ 48: 8D. 15, 000002C8(rel)
        mov     rcx, rax                                ; 0038 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 003B _ E8, 00000000(rel)
        lea     rdx, [rel ?_121]                        ; 0040 _ 48: 8D. 15, 00000308(rel)
        mov     rcx, rax                                ; 0047 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 004A _ E8, 00000000(rel)
        lea     rdx, [rel ?_122]                        ; 004F _ 48: 8D. 15, 00000348(rel)
        mov     rcx, rax                                ; 0056 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 0059 _ E8, 00000000(rel)
        lea     rdx, [rel ?_123]                        ; 005E _ 48: 8D. 15, 00000388(rel)
        mov     rcx, rax                                ; 0065 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 0068 _ E8, 00000000(rel)
        lea     rdx, [rel ?_124]                        ; 006D _ 48: 8D. 15, 000003C8(rel)
        mov     rcx, rax                                ; 0074 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 0077 _ E8, 00000000(rel)
        lea     rdx, [rel ?_125]                        ; 007C _ 48: 8D. 15, 00000408(rel)
        mov     rcx, rax                                ; 0083 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 0086 _ E8, 00000000(rel)
        lea     rdx, [rel ?_126]                        ; 008B _ 48: 8D. 15, 00000448(rel)
        mov     rcx, rax                                ; 0092 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 0095 _ E8, 00000000(rel)
        lea     rdx, [rel ?_127]                        ; 009A _ 48: 8D. 15, 00000470(rel)
        mov     rcx, rax                                ; 00A1 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 00A4 _ E8, 00000000(rel)
        lea     rdx, [rel ?_128]                        ; 00A9 _ 48: 8D. 15, 000004A0(rel)
        mov     rcx, rax                                ; 00B0 _ 48: 89. C1
        add     rsp, 40                                 ; 00B3 _ 48: 83. C4, 28
        jmp     _Z12print_stringPcPKc                   ; 00B7 _ E9, 00000000(rel)
; _ZN3UCI7Options13print_optionsEPc End of function

        nop                                             ; 00BC _ 90
        nop                                             ; 00BD _ 90
        nop                                             ; 00BE _ 90
        nop                                             ; 00BF _ 90


SECTION .xdata$_ZN3UCI7Options13print_optionsEPc align=4 noexecute ; section number 16, const
;  Communal section not supported by YASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .text$_ZNSt11_Deque_baseI9StateInfoSaIS0_EED2Ev align=16 execute ; section number 18, code
;  Communal section not supported by YASM

_ZNSt11_Deque_baseI9StateInfoSaIS0_EED2Ev:; Function begin
        push    rdi                                     ; 0000 _ 57
        push    rsi                                     ; 0001 _ 56
        push    rbx                                     ; 0002 _ 53
        sub     rsp, 32                                 ; 0003 _ 48: 83. EC, 20
        cmp     qword [rcx], 0                          ; 0007 _ 48: 83. 39, 00
        jz      ?_137                                   ; 000B _ 74, 31
        mov     rax, qword [rcx+48H]                    ; 000D _ 48: 8B. 41, 48
        mov     rbx, rcx                                ; 0011 _ 48: 89. CB
        mov     rsi, qword [rcx+28H]                    ; 0014 _ 48: 8B. 71, 28
        lea     rdi, [rax+8H]                           ; 0018 _ 48: 8D. 78, 08
?_135:  cmp     rdi, rsi                                ; 001C _ 48: 39. F7
        jbe     ?_136                                   ; 001F _ 76, 0E
        mov     rcx, qword [rsi]                        ; 0021 _ 48: 8B. 0E
        add     rsi, 8                                  ; 0024 _ 48: 83. C6, 08
        call    _ZdlPv                                  ; 0028 _ E8, 00000000(rel)
        jmp     ?_135                                   ; 002D _ EB, ED

?_136:  mov     rcx, qword [rbx]                        ; 002F _ 48: 8B. 0B
        add     rsp, 32                                 ; 0032 _ 48: 83. C4, 20
        pop     rbx                                     ; 0036 _ 5B
        pop     rsi                                     ; 0037 _ 5E
        pop     rdi                                     ; 0038 _ 5F
        jmp     _ZdlPv                                  ; 0039 _ E9, 00000000(rel)
; _ZNSt11_Deque_baseI9StateInfoSaIS0_EED2Ev End of function

?_137:  ; Local function
        add     rsp, 32                                 ; 003E _ 48: 83. C4, 20
        pop     rbx                                     ; 0042 _ 5B
        pop     rsi                                     ; 0043 _ 5E
        pop     rdi                                     ; 0044 _ 5F
        ret                                             ; 0045 _ C3

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


SECTION .xdata$_ZNSt11_Deque_baseI9StateInfoSaIS0_EED2Ev align=4 noexecute ; section number 19, const
;  Communal section not supported by YASM

        db 01H, 07H, 04H, 00H, 07H, 32H, 03H, 30H       ; 0000 _ .....2.0
        db 02H, 60H, 01H, 70H                           ; 0008 _ .`.p


SECTION .xdata.unlikely align=4 noexecute               ; section number 21, const

        db 01H, 0FH, 08H, 00H, 0FH, 01H, 09H, 01H       ; 0000 _ ........
        db 08H, 30H, 07H, 60H, 06H, 70H, 05H, 50H       ; 0008 _ .0.`.p.P
        db 04H, 0C0H, 02H, 0D0H, 01H, 00H, 00H, 00H     ; 0010 _ ........


SECTION .text$_ZNSt6vectorI4MoveSaIS0_EE12emplace_backIIS0_EEEvDpOT_ align=16 execute ; section number 23, code
;  Communal section not supported by YASM

.weak._ZNSt6vectorI4MoveSaIS0_EE12emplace_backIJS0_EEEvDpOT_._ZN3UCI4loopEiPPc:; Function begin

_ZNSt6vectorI4MoveSaIS0_EE12emplace_backIIS0_EEEvDpOT_:
        push    rbp                                     ; 0000 _ 55
        push    rdi                                     ; 0001 _ 57
        push    rsi                                     ; 0002 _ 56
        push    rbx                                     ; 0003 _ 53
        sub     rsp, 40                                 ; 0004 _ 48: 83. EC, 28
        mov     rax, qword [rcx+8H]                     ; 0008 _ 48: 8B. 41, 08
        cmp     rax, qword [rcx+10H]                    ; 000C _ 48: 3B. 41, 10
        jz      ?_139                                   ; 0010 _ 74, 16
        test    rax, rax                                ; 0012 _ 48: 85. C0
        mov     ebx, dword [rdx]                        ; 0015 _ 8B. 1A
        jz      ?_138                                   ; 0017 _ 74, 02
        mov     dword [rax], ebx                        ; 0019 _ 89. 18
?_138:  add     rax, 4                                  ; 001B _ 48: 83. C0, 04
        mov     qword [rcx+8H], rax                     ; 001F _ 48: 89. 41, 08
        jmp     ?_149                                   ; 0023 _ E9, 000000AC

?_139:  sub     rax, qword [rcx]                        ; 0028 _ 48: 2B. 01
        mov     ebx, 1                                  ; 002B _ BB, 00000001
        mov     rbp, rdx                                ; 0030 _ 48: 89. D5
        mov     rsi, rcx                                ; 0033 _ 48: 89. CE
        sar     rax, 2                                  ; 0036 _ 48: C1. F8, 02
        cmovne  rbx, rax                                ; 003A _ 48: 0F 45. D8
        add     rbx, rax                                ; 003E _ 48: 01. C3
        jc      ?_140                                   ; 0041 _ 72, 0F
        mov     rdx, qword 3FFFFFFFFFFFFFFFH            ; 0043 _ 48: BA, 3FFFFFFFFFFFFFFF
        cmp     rbx, rdx                                ; 004D _ 48: 39. D3
        jbe     ?_148                                   ; 0050 _ 76, 79
?_140:  mov     rbx, qword 3FFFFFFFFFFFFFFFH            ; 0052 _ 48: BB, 3FFFFFFFFFFFFFFF
?_141:  lea     rcx, [rbx*4]                            ; 005C _ 48: 8D. 0C 9D, 00000000
        call    _Znwy                                   ; 0064 _ E8, 00000000(rel)
        mov     rdi, rax                                ; 0069 _ 48: 89. C7
?_142:  mov     r10, qword [rsi+8H]                     ; 006C _ 4C: 8B. 56, 08
        mov     rcx, qword [rsi]                        ; 0070 _ 48: 8B. 0E
        mov     r8d, dword [rbp]                        ; 0073 _ 44: 8B. 45, 00
        mov     r9, r10                                 ; 0077 _ 4D: 89. D1
        sub     r9, rcx                                 ; 007A _ 49: 29. C9
        add     r9, rdi                                 ; 007D _ 49: 01. F9
        jz      ?_143                                   ; 0080 _ 74, 03
        mov     dword [r9], r8d                         ; 0082 _ 45: 89. 01
?_143:  mov     rax, rcx                                ; 0085 _ 48: 89. C8
        mov     r11, rdi                                ; 0088 _ 49: 89. FB
?_144:  cmp     r10, rax                                ; 008B _ 49: 39. C2
        jz      ?_146                                   ; 008E _ 74, 14
        test    r11, r11                                ; 0090 _ 4D: 85. DB
        mov     edx, dword [rax]                        ; 0093 _ 8B. 10
        jz      ?_145                                   ; 0095 _ 74, 03
        mov     dword [r11], edx                        ; 0097 _ 41: 89. 13
?_145:  add     r11, 4                                  ; 009A _ 49: 83. C3, 04
        add     rax, 4                                  ; 009E _ 48: 83. C0, 04
        jmp     ?_144                                   ; 00A2 _ EB, E7

?_146:  sub     r10, rcx                                ; 00A4 _ 49: 29. CA
        and     r10, 0FFFFFFFFFFFFFFFCH                 ; 00A7 _ 49: 83. E2, FC
        test    rcx, rcx                                ; 00AB _ 48: 85. C9
        lea     rbp, [rdi+r10+4H]                       ; 00AE _ 4A: 8D. 6C 17, 04
        jz      ?_147                                   ; 00B3 _ 74, 05
        call    _ZdlPv                                  ; 00B5 _ E8, 00000000(rel)
?_147:  lea     rcx, [rdi+rbx*4]                        ; 00BA _ 48: 8D. 0C 9F
        mov     qword [rsi], rdi                        ; 00BE _ 48: 89. 3E
        mov     qword [rsi+8H], rbp                     ; 00C1 _ 48: 89. 6E, 08
        mov     qword [rsi+10H], rcx                    ; 00C5 _ 48: 89. 4E, 10
        jmp     ?_149                                   ; 00C9 _ EB, 09

?_148:  xor     edi, edi                                ; 00CB _ 31. FF
        test    rbx, rbx                                ; 00CD _ 48: 85. DB
        jz      ?_142                                   ; 00D0 _ 74, 9A
        jmp     ?_141                                   ; 00D2 _ EB, 88
; .weak._ZNSt6vectorI4MoveSaIS0_EE12emplace_backIJS0_EEEvDpOT_._ZN3UCI4loopEiPPc End of function

?_149:  ; Local function
        add     rsp, 40                                 ; 00D4 _ 48: 83. C4, 28
        pop     rbx                                     ; 00D8 _ 5B
        pop     rsi                                     ; 00D9 _ 5E
        pop     rdi                                     ; 00DA _ 5F
        pop     rbp                                     ; 00DB _ 5D
        ret                                             ; 00DC _ C3

        nop                                             ; 00DD _ 90
        nop                                             ; 00DE _ 90
        nop                                             ; 00DF _ 90


SECTION .xdata$_ZNSt6vectorI4MoveSaIS0_EE12emplace_backIIS0_EEEvDpOT_ align=4 noexecute ; section number 24, const
;  Communal section not supported by YASM

        db 01H, 08H, 05H, 00H, 08H, 42H, 04H, 30H       ; 0000 _ .....B.0
        db 03H, 60H, 02H, 70H, 01H, 50H, 00H, 00H       ; 0008 _ .`.p.P..


SECTION .text$_ZNSt11_Deque_baseI9StateInfoSaIS0_EE17_M_initialize_mapEy align=16 execute ; section number 26, code
;  Communal section not supported by YASM

_ZNSt11_Deque_baseI9StateInfoSaIS0_EE17_M_initialize_mapEy:; Function begin
        push    r12                                     ; 0000 _ 41: 54
        push    rbp                                     ; 0002 _ 55
        push    rdi                                     ; 0003 _ 57
        push    rsi                                     ; 0004 _ 56
        push    rbx                                     ; 0005 _ 53
        sub     rsp, 32                                 ; 0006 _ 48: 83. EC, 20
        mov     edi, 8                                  ; 000A _ BF, 00000008
        mov     r8, qword 1FFFFFFFFFFFFFFFH             ; 000F _ 49: B8, 1FFFFFFFFFFFFFFF
        mov     rbx, rcx                                ; 0019 _ 48: 89. CB
        mov     rax, rdx                                ; 001C _ 48: 89. D0
        mov     ecx, 6                                  ; 001F _ B9, 00000006
        mov     rsi, rdx                                ; 0024 _ 48: 89. D6
        xor     edx, edx                                ; 0027 _ 31. D2
        div     rcx                                     ; 0029 _ 48: F7. F1
        lea     rcx, [rax+3H]                           ; 002C _ 48: 8D. 48, 03
        lea     rbp, [rax+1H]                           ; 0030 _ 48: 8D. 68, 01
        cmp     rcx, 8                                  ; 0034 _ 48: 83. F9, 08
        cmovc   rcx, rdi                                ; 0038 _ 48: 0F 42. CF
        cmp     rcx, r8                                 ; 003C _ 4C: 39. C1
        mov     qword [rbx+8H], rcx                     ; 003F _ 48: 89. 4B, 08
        jbe     ?_150                                   ; 0043 _ 76, 05
        call    _ZSt17__throw_bad_allocv                ; 0045 _ E8, 00000000(rel)
?_150:  shl     rcx, 3                                  ; 004A _ 48: C1. E1, 03
        call    _Znwy                                   ; 004E _ E8, 00000000(rel)
        mov     r9, qword [rbx+8H]                      ; 0053 _ 4C: 8B. 4B, 08
        mov     qword [rbx], rax                        ; 0057 _ 48: 89. 03
        sub     r9, rbp                                 ; 005A _ 49: 29. E9
        shr     r9, 1                                   ; 005D _ 49: D1. E9
        lea     rdi, [rax+r9*8]                         ; 0060 _ 4A: 8D. 3C C8
        lea     r12, [rdi+rbp*8]                        ; 0064 _ 4C: 8D. 24 EF
        mov     rbp, rdi                                ; 0068 _ 48: 89. FD
?_151:  cmp     r12, rbp                                ; 006B _ 49: 39. EC
        jbe     ?_152                                   ; 006E _ 76, 14
        mov     ecx, 480                                ; 0070 _ B9, 000001E0
        add     rbp, 8                                  ; 0075 _ 48: 83. C5, 08
        call    _Znwy                                   ; 0079 _ E8, 00000000(rel)
        mov     qword [rbp-8H], rax                     ; 007E _ 48: 89. 45, F8
        jmp     ?_151                                   ; 0082 _ EB, E7
; _ZNSt11_Deque_baseI9StateInfoSaIS0_EE17_M_initialize_mapEy End of function

?_152:  ; Local function
        mov     qword [rbx+28H], rdi                    ; 0084 _ 48: 89. 7B, 28
        mov     r10, qword [rdi]                        ; 0088 _ 4C: 8B. 17
        lea     rcx, [r12-8H]                           ; 008B _ 49: 8D. 4C 24, F8
        xor     edx, edx                                ; 0090 _ 31. D2
        mov     qword [rbx+48H], rcx                    ; 0092 _ 48: 89. 4B, 48
        mov     ebp, 6                                  ; 0096 _ BD, 00000006
        lea     r11, [r10+1E0H]                         ; 009B _ 4D: 8D. 9A, 000001E0
        mov     qword [rbx+18H], r10                    ; 00A2 _ 4C: 89. 53, 18
        mov     qword [rbx+20H], r11                    ; 00A6 _ 4C: 89. 5B, 20
        mov     r12, qword [r12-8H]                     ; 00AA _ 4D: 8B. 64 24, F8
        mov     qword [rbx+10H], r10                    ; 00AF _ 4C: 89. 53, 10
        lea     rax, [r12+1E0H]                         ; 00B3 _ 49: 8D. 84 24, 000001E0
        mov     qword [rbx+38H], r12                    ; 00BB _ 4C: 89. 63, 38
        mov     qword [rbx+40H], rax                    ; 00BF _ 48: 89. 43, 40
        mov     rax, rsi                                ; 00C3 _ 48: 89. F0
        div     rbp                                     ; 00C6 _ 48: F7. F5
        imul    rsi, rdx, 80                            ; 00C9 _ 48: 6B. F2, 50
        add     rsi, r12                                ; 00CD _ 4C: 01. E6
        mov     qword [rbx+30H], rsi                    ; 00D0 _ 48: 89. 73, 30
        add     rsp, 32                                 ; 00D4 _ 48: 83. C4, 20
        pop     rbx                                     ; 00D8 _ 5B
        pop     rsi                                     ; 00D9 _ 5E
        pop     rdi                                     ; 00DA _ 5F
        pop     rbp                                     ; 00DB _ 5D
        pop     r12                                     ; 00DC _ 41: 5C
        ret                                             ; 00DE _ C3

        nop                                             ; 00DF _ 90


SECTION .xdata$_ZNSt11_Deque_baseI9StateInfoSaIS0_EE17_M_initialize_mapEy align=4 noexecute ; section number 27, const
;  Communal section not supported by YASM

        db 01H, 0AH, 06H, 00H, 0AH, 32H, 06H, 30H       ; 0000 _ .....2.0
        db 05H, 60H, 04H, 70H, 03H, 50H, 02H, 0C0H      ; 0008 _ .`.p.P..


SECTION .text$_ZNSt5dequeI9StateInfoSaIS0_EE22_M_reserve_map_at_backEy align=16 execute ; section number 29, code
;  Communal section not supported by YASM

_ZNSt5dequeI9StateInfoSaIS0_EE22_M_reserve_map_at_backEy:; Function begin
        push    r12                                     ; 0000 _ 41: 54
        push    rbp                                     ; 0002 _ 55
        push    rdi                                     ; 0003 _ 57
        push    rsi                                     ; 0004 _ 56
        push    rbx                                     ; 0005 _ 53
        sub     rsp, 32                                 ; 0006 _ 48: 83. EC, 20
        mov     r9, qword [rcx+48H]                     ; 000A _ 4C: 8B. 49, 48
        mov     r10, qword [rcx]                        ; 000E _ 4C: 8B. 11
        mov     rax, qword [rcx+8H]                     ; 0011 _ 48: 8B. 41, 08
        lea     r11, [rdx+1H]                           ; 0015 _ 4C: 8D. 5A, 01
        mov     r8, r9                                  ; 0019 _ 4D: 89. C8
        sub     r8, r10                                 ; 001C _ 4D: 29. D0
        sar     r8, 3                                   ; 001F _ 49: C1. F8, 03
        mov     rdi, rax                                ; 0023 _ 48: 89. C7
        sub     rdi, r8                                 ; 0026 _ 4C: 29. C7
        cmp     r11, rdi                                ; 0029 _ 49: 39. FB
        jbe     ?_158                                   ; 002C _ 0F 86, 0000010B
        mov     rbp, rdx                                ; 0032 _ 48: 89. D5
        mov     rdx, qword [rcx+28H]                    ; 0035 _ 48: 8B. 51, 28
        mov     rdi, r9                                 ; 0039 _ 4C: 89. CF
        mov     rbx, rcx                                ; 003C _ 48: 89. CB
        sub     rdi, rdx                                ; 003F _ 48: 29. D7
        sar     rdi, 3                                  ; 0042 _ 48: C1. FF, 03
        inc     rdi                                     ; 0046 _ 48: FF. C7
        lea     rsi, [rdi+rbp]                          ; 0049 _ 48: 8D. 34 2F
        lea     rcx, [rsi+rsi]                          ; 004D _ 48: 8D. 0C 36
        cmp     rax, rcx                                ; 0051 _ 48: 39. C8
        jbe     ?_154                                   ; 0054 _ 76, 4A
        lea     r8, [r9+8H]                             ; 0056 _ 4D: 8D. 41, 08
        sub     rax, rsi                                ; 005A _ 48: 29. F0
        shr     rax, 1                                  ; 005D _ 48: D1. E8
        lea     rsi, [r10+rax*8]                        ; 0060 _ 49: 8D. 34 C2
        cmp     rdx, rsi                                ; 0064 _ 48: 39. F2
        jbe     ?_153                                   ; 0067 _ 76, 1D
        sub     r8, rdx                                 ; 0069 _ 49: 29. D0
        mov     rcx, r8                                 ; 006C _ 4C: 89. C1
        shr     rcx, 3                                  ; 006F _ 48: C1. E9, 03
        je      ?_157                                   ; 0073 _ 0F 84, 00000093
        mov     rcx, rsi                                ; 0079 _ 48: 89. F1
        call    memmove                                 ; 007C _ E8, 00000000(rel)
        jmp     ?_157                                   ; 0081 _ E9, 00000086

?_153:  sub     r8, rdx                                 ; 0086 _ 49: 29. D0
        mov     r11, r8                                 ; 0089 _ 4D: 89. C3
        shr     r11, 3                                  ; 008C _ 49: C1. EB, 03
        jz      ?_157                                   ; 0090 _ 74, 7A
        lea     rcx, [rsi+rdi*8]                        ; 0092 _ 48: 8D. 0C FE
        sub     rcx, r8                                 ; 0096 _ 4C: 29. C1
        call    memmove                                 ; 0099 _ E8, 00000000(rel)
        jmp     ?_157                                   ; 009E _ EB, 6C

?_154:  mov     rdx, qword 1FFFFFFFFFFFFFFFH            ; 00A0 _ 48: BA, 1FFFFFFFFFFFFFFF
        cmp     rbp, rax                                ; 00AA _ 48: 39. C5
        cmovc   rbp, rax                                ; 00AD _ 48: 0F 42. E8
        lea     rbp, [rax+rbp+2H]                       ; 00B1 _ 48: 8D. 6C 28, 02
        cmp     rbp, rdx                                ; 00B6 _ 48: 39. D5
        jbe     ?_155                                   ; 00B9 _ 76, 05
        call    _ZSt17__throw_bad_allocv                ; 00BB _ E8, 00000000(rel)
?_155:  lea     rcx, [rbp*8]                            ; 00C0 _ 48: 8D. 0C ED, 00000000
        call    _Znwy                                   ; 00C8 _ E8, 00000000(rel)
        mov     r9, qword [rbx+48H]                     ; 00CD _ 4C: 8B. 4B, 48
        mov     rdx, qword [rbx+28H]                    ; 00D1 _ 48: 8B. 53, 28
        mov     r12, rax                                ; 00D5 _ 49: 89. C4
        mov     rax, rbp                                ; 00D8 _ 48: 89. E8
        sub     rax, rsi                                ; 00DB _ 48: 29. F0
        shr     rax, 1                                  ; 00DE _ 48: D1. E8
        lea     r8, [r9+8H]                             ; 00E1 _ 4D: 8D. 41, 08
        lea     rsi, [r12+rax*8]                        ; 00E5 _ 49: 8D. 34 C4
        sub     r8, rdx                                 ; 00E9 _ 49: 29. D0
        mov     r10, r8                                 ; 00EC _ 4D: 89. C2
        shr     r10, 3                                  ; 00EF _ 49: C1. EA, 03
        jz      ?_156                                   ; 00F3 _ 74, 08
        mov     rcx, rsi                                ; 00F5 _ 48: 89. F1
        call    memmove                                 ; 00F8 _ E8, 00000000(rel)
?_156:  mov     rcx, qword [rbx]                        ; 00FD _ 48: 8B. 0B
        call    _ZdlPv                                  ; 0100 _ E8, 00000000(rel)
        mov     qword [rbx], r12                        ; 0105 _ 4C: 89. 23
        mov     qword [rbx+8H], rbp                     ; 0108 _ 48: 89. 6B, 08
?_157:  mov     qword [rbx+28H], rsi                    ; 010C _ 48: 89. 73, 28
        mov     r8, qword [rsi]                         ; 0110 _ 4C: 8B. 06
        lea     rdi, [rsi+rdi*8-8H]                     ; 0113 _ 48: 8D. 7C FE, F8
        mov     qword [rbx+48H], rdi                    ; 0118 _ 48: 89. 7B, 48
        mov     qword [rbx+18H], r8                     ; 011C _ 4C: 89. 43, 18
        add     r8, 480                                 ; 0120 _ 49: 81. C0, 000001E0
        mov     qword [rbx+20H], r8                     ; 0127 _ 4C: 89. 43, 20
        mov     rbp, qword [rdi]                        ; 012B _ 48: 8B. 2F
        mov     qword [rbx+38H], rbp                    ; 012E _ 48: 89. 6B, 38
        add     rbp, 480                                ; 0132 _ 48: 81. C5, 000001E0
        mov     qword [rbx+40H], rbp                    ; 0139 _ 48: 89. 6B, 40
?_158:  add     rsp, 32                                 ; 013D _ 48: 83. C4, 20
        pop     rbx                                     ; 0141 _ 5B
        pop     rsi                                     ; 0142 _ 5E
        pop     rdi                                     ; 0143 _ 5F
        pop     rbp                                     ; 0144 _ 5D
        pop     r12                                     ; 0145 _ 41: 5C
        ret                                             ; 0147 _ C3
; _ZNSt5dequeI9StateInfoSaIS0_EE22_M_reserve_map_at_backEy End of function

        nop                                             ; 0148 _ 90
        nop                                             ; 0149 _ 90
        nop                                             ; 014A _ 90
        nop                                             ; 014B _ 90
        nop                                             ; 014C _ 90
        nop                                             ; 014D _ 90
        nop                                             ; 014E _ 90
        nop                                             ; 014F _ 90


SECTION .xdata$_ZNSt5dequeI9StateInfoSaIS0_EE22_M_reserve_map_at_backEy align=4 noexecute ; section number 30, const
;  Communal section not supported by YASM

        db 01H, 0AH, 06H, 00H, 0AH, 32H, 06H, 30H       ; 0000 _ .....2.0
        db 05H, 60H, 04H, 70H, 03H, 50H, 02H, 0C0H      ; 0008 _ .`.p.P..


SECTION .text$_ZNSt5dequeI9StateInfoSaIS0_EE12emplace_backIIS0_EEEvDpOT_ align=16 execute ; section number 32, code
;  Communal section not supported by YASM

.weak._ZNSt5dequeI9StateInfoSaIS0_EE12emplace_backIJS0_EEEvDpOT_._ZN3UCI4loopEiPPc:; Function begin

_ZNSt5dequeI9StateInfoSaIS0_EE12emplace_backIIS0_EEEvDpOT_:
        push    rdi                                     ; 0000 _ 57
        push    rsi                                     ; 0001 _ 56
        push    rbx                                     ; 0002 _ 53
        sub     rsp, 32                                 ; 0003 _ 48: 83. EC, 20
        mov     rdi, qword [rcx+40H]                    ; 0007 _ 48: 8B. 79, 40
        mov     rax, qword [rcx+30H]                    ; 000B _ 48: 8B. 41, 30
        mov     rsi, rdx                                ; 000F _ 48: 89. D6
        mov     rbx, rcx                                ; 0012 _ 48: 89. CB
        lea     rdx, [rdi-50H]                          ; 0015 _ 48: 8D. 57, B0
        cmp     rax, rdx                                ; 0019 _ 48: 39. D0
        jz      ?_160                                   ; 001C _ 74, 19
        test    rax, rax                                ; 001E _ 48: 85. C0
        jz      ?_159                                   ; 0021 _ 74, 0A
        mov     ecx, 20                                 ; 0023 _ B9, 00000014
        mov     rdi, rax                                ; 0028 _ 48: 89. C7
        rep movsd                                       ; 002B _ F3: A5
?_159:  add     rax, 80                                 ; 002D _ 48: 83. C0, 50
        mov     qword [rbx+30H], rax                    ; 0031 _ 48: 89. 43, 30
        jmp     ?_162                                   ; 0035 _ EB, 52

?_160:  mov     edx, 1                                  ; 0037 _ BA, 00000001
        call    _ZNSt5dequeI9StateInfoSaIS0_EE22_M_reserve_map_at_backEy; 003C _ E8, 00000000(rel)
        mov     rdi, qword [rbx+48H]                    ; 0041 _ 48: 8B. 7B, 48
        mov     ecx, 480                                ; 0045 _ B9, 000001E0
        call    _Znwy                                   ; 004A _ E8, 00000000(rel)
        mov     qword [rdi+8H], rax                     ; 004F _ 48: 89. 47, 08
        mov     r8, qword [rbx+30H]                     ; 0053 _ 4C: 8B. 43, 30
        test    r8, r8                                  ; 0057 _ 4D: 85. C0
        jz      ?_161                                   ; 005A _ 74, 0A
        mov     ecx, 20                                 ; 005C _ B9, 00000014
        mov     rdi, r8                                 ; 0061 _ 4C: 89. C7
        rep movsd                                       ; 0064 _ F3: A5
?_161:  mov     r9, qword [rbx+48H]                     ; 0066 _ 4C: 8B. 4B, 48
        lea     r10, [r9+8H]                            ; 006A _ 4D: 8D. 51, 08
        mov     qword [rbx+48H], r10                    ; 006E _ 4C: 89. 53, 48
        mov     r11, qword [r9+8H]                      ; 0072 _ 4D: 8B. 59, 08
        lea     rsi, [r11+1E0H]                         ; 0076 _ 49: 8D. B3, 000001E0
        mov     qword [rbx+38H], r11                    ; 007D _ 4C: 89. 5B, 38
        mov     qword [rbx+40H], rsi                    ; 0081 _ 48: 89. 73, 40
        mov     qword [rbx+30H], r11                    ; 0085 _ 4C: 89. 5B, 30
?_162:  add     rsp, 32                                 ; 0089 _ 48: 83. C4, 20
        pop     rbx                                     ; 008D _ 5B
        pop     rsi                                     ; 008E _ 5E
        pop     rdi                                     ; 008F _ 5F
        ret                                             ; 0090 _ C3
; .weak._ZNSt5dequeI9StateInfoSaIS0_EE12emplace_backIJS0_EEEvDpOT_._ZN3UCI4loopEiPPc End of function

        nop                                             ; 0091 _ 90
        nop                                             ; 0092 _ 90
        nop                                             ; 0093 _ 90
        nop                                             ; 0094 _ 90
        nop                                             ; 0095 _ 90
        nop                                             ; 0096 _ 90
        nop                                             ; 0097 _ 90
        nop                                             ; 0098 _ 90
        nop                                             ; 0099 _ 90
        nop                                             ; 009A _ 90
        nop                                             ; 009B _ 90
        nop                                             ; 009C _ 90
        nop                                             ; 009D _ 90
        nop                                             ; 009E _ 90
        nop                                             ; 009F _ 90


SECTION .xdata$_ZNSt5dequeI9StateInfoSaIS0_EE12emplace_backIIS0_EEEvDpOT_ align=4 noexecute ; section number 33, const
;  Communal section not supported by YASM

        db 01H, 07H, 04H, 00H, 07H, 32H, 03H, 30H       ; 0000 _ .....2.0
        db 02H, 60H, 01H, 70H                           ; 0008 _ .`.p


SECTION .rdata$zzz align=16 noexecute                   ; section number 35, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr.TT align=16 noexecute            ; section number 36, const
;  Communal section not supported by YASM

.refptr.TT:                                             ; qword
        dq TT                                           ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.Time align=16 noexecute          ; section number 37, const
;  Communal section not supported by YASM

.refptr.Time:                                           ; qword
        dq Time                                         ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr._ZN6Search6LimitsE align=16 noexecute ; section number 38, const
;  Communal section not supported by YASM

.refptr._ZN6Search6LimitsE:                             ; qword
        dq _ZN6Search6LimitsE                           ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr._ZN6Search7SignalsE align=16 noexecute ; section number 39, const
;  Communal section not supported by YASM

.refptr._ZN6Search7SignalsE:                            ; qword
        dq _ZN6Search7SignalsE                          ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.Threads align=16 noexecute       ; section number 40, const
;  Communal section not supported by YASM

.refptr.Threads:                                        ; qword
        dq Threads                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


