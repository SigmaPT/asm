; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\benchmark.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro, x64

default rel

global _Z9benchmarkPKcR8Positioniyy: function
global _ZN10ThreadPool4mainEv: function
global .refptr.Threads
global .refptr.TT
global .refptr.Opt

extern Opt                                              ; byte
extern TT                                               ; byte
extern Threads                                          ; byte
extern _ZSt20__throw_length_errorPKc                    ; near
extern _Znwy                                            ; near
extern _ZdlPv                                           ; near
extern _ZN6Search5perftILb1EEEyR8Position5Depth         ; near
extern _Z9print_intPcx                                  ; near
extern _ZN10ThreadPool14nodes_searchedEv                ; near
extern _ZN6Thread24wait_for_search_finishedEv           ; near
extern _ZN10ThreadPool14start_thinkingERK8PositionRKN6Search10LimitsTypeERSt10unique_ptrISt5stackI9StateInfoSt5dequeIS9_SaIS9_EEESt14default_deleteISD_EE ; near
extern _Z11write_errorPcS_                              ; near
extern _Z9print_intPcy                                  ; near
extern _Z12print_stringPcPKc                            ; near
extern _ZN8Position9parse_setEPKcbP6Thread              ; near
extern _Z3nowv                                          ; near
extern _ZN6Search5clearEv                               ; near
extern _ZN18TranspositionTable6resizeEy                 ; near
extern strcmp                                           ; near
extern _ZSt24__throw_out_of_range_fmtPKcz               ; near


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_Z9benchmarkPKcR8Positioniyy:
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 1448                               ; 000C _ 48: 81. EC, 000005A8
        mov     rbx, qword [rsp+610H]                   ; 0013 _ 48: 8B. 9C 24, 00000610
        mov     r12, rdx                                ; 001B _ 49: 89. D4
        mov     rdi, rcx                                ; 001E _ 48: 89. CF
        movsxd  rsi, r8d                                ; 0021 _ 49: 63. F0
        lea     rdx, [rel ?_008]                        ; 0024 _ 48: 8D. 15, 0000004A(rel)
        mov     rbp, r9                                 ; 002B _ 4C: 89. CD
        call    strcmp                                  ; 002E _ E8, 00000000(rel)
        test    eax, eax                                ; 0033 _ 85. C0
        je      _Z9benchmarkPKcR8Positioniyy.cold.55    ; 0035 _ 0F 84, 00000000(rel)
        test    rbp, rbp                                ; 003B _ 48: 85. ED
        mov     qword [rsp+70H], 0                      ; 003E _ 48: C7. 44 24, 70, 00000000
        mov     edx, 1                                  ; 0047 _ BA, 00000001
        mov     qword [rsp+78H], 0                      ; 004C _ 48: C7. 44 24, 78, 00000000
        mov     qword [rsp+80H], 0                      ; 0055 _ 48: C7. 84 24, 00000080, 00000000
        mov     dword [rsp+0B0H], 0                     ; 0061 _ C7. 84 24, 000000B0, 00000000
        mov     dword [rsp+0ACH], 0                     ; 006C _ C7. 84 24, 000000AC, 00000000
        mov     dword [rsp+0A8H], 0                     ; 0077 _ C7. 84 24, 000000A8, 00000000
        mov     dword [rsp+0A4H], 0                     ; 0082 _ C7. 84 24, 000000A4, 00000000
        mov     dword [rsp+0A0H], 0                     ; 008D _ C7. 84 24, 000000A0, 00000000
        mov     dword [rsp+9CH], 0                      ; 0098 _ C7. 84 24, 0000009C, 00000000
        mov     dword [rsp+98H], 0                      ; 00A3 _ C7. 84 24, 00000098, 00000000
        mov     dword [rsp+94H], 0                      ; 00AE _ C7. 84 24, 00000094, 00000000
        mov     dword [rsp+90H], 0                      ; 00B9 _ C7. 84 24, 00000090, 00000000
        mov     dword [rsp+8CH], 0                      ; 00C4 _ C7. 84 24, 0000008C, 00000000
        mov     dword [rsp+88H], 0                      ; 00CF _ C7. 84 24, 00000088, 00000000
        mov     qword [rsp+0B8H], 0                     ; 00DA _ 48: C7. 84 24, 000000B8, 00000000
        jz      ?_001                                   ; 00E6 _ 74, 13
        cmp     rbp, 1048576                            ; 00E8 _ 48: 81. FD, 00100000
        mov     eax, 1048576                            ; 00EF _ B8, 00100000
        cmovbe  rax, rbp                                ; 00F4 _ 48: 0F 46. C5
        mov     rdx, rax                                ; 00F8 _ 48: 89. C2
?_001:  mov     r12, qword [rel .refptr.Opt]            ; 00FB _ 4C: 8B. 25, 00000000(rel)
        mov     rcx, qword [rel .refptr.TT]             ; 0102 _ 48: 8B. 0D, 00000000(rel)
        mov     qword [r12+8H], rdx                     ; 0109 _ 49: 89. 54 24, 08
        call    _ZN18TranspositionTable6resizeEy        ; 010E _ E8, 00000000(rel)
        test    rbx, rbx                                ; 0113 _ 48: 85. DB
        mov     r9d, 1                                  ; 0116 _ 41: B9, 00000001
        jz      ?_002                                   ; 011C _ 74, 0B
        cmp     rbx, 50                                 ; 011E _ 48: 83. FB, 32
        mov     r9b, 50                                 ; 0122 _ 41: B1, 32
        cmovbe  r9, rbx                                 ; 0125 _ 4C: 0F 46. CB
?_002:  mov     r13, qword [rel .refptr.Threads]        ; 0129 _ 4C: 8B. 2D, 00000000(rel)
        mov     qword [r12], r9                         ; 0130 _ 4D: 89. 0C 24
        mov     rcx, qword [r13+8H]                     ; 0134 _ 49: 8B. 4D, 08
        mov     r8, qword [r13]                         ; 0138 _ 4D: 8B. 45, 00
        mov     rdx, rcx                                ; 013C _ 48: 89. CA
        sub     rdx, r8                                 ; 013F _ 4C: 29. C2
        sar     rdx, 3                                  ; 0142 _ 48: C1. FA, 03
        cmp     r9, rdx                                 ; 0146 _ 49: 39. D1
        ja      .text.unlikely+0B2H                     ; 0149 _ 0F 87, 000000B2(rel)
        jc      ?_006                                   ; 014F _ 0F 82, 000001F5
        call    _ZN6Search5clearEv                      ; 0155 _ E8, 00000000(rel)
        lea     rdx, [rel ?_010]                        ; 015A _ 48: 8D. 15, 0000006A(rel)
        mov     rcx, rdi                                ; 0161 _ 48: 89. F9
        call    strcmp                                  ; 0164 _ E8, 00000000(rel)
        test    eax, eax                                ; 0169 _ 85. C0
        je      .text.unlikely+99H                      ; 016B _ 0F 84, 00000099(rel)
        lea     rdx, [rel ?_011]                        ; 0171 _ 48: 8D. 15, 0000006F(rel)
        mov     rcx, rdi                                ; 0178 _ 48: 89. F9
        call    strcmp                                  ; 017B _ E8, 00000000(rel)
        test    eax, eax                                ; 0180 _ 85. C0
        je      ?_005                                   ; 0182 _ 0F 84, 000001BD
        lea     rdx, [rel ?_012]                        ; 0188 _ 48: 8D. 15, 00000075(rel)
        mov     rcx, rdi                                ; 018F _ 48: 89. F9
        call    strcmp                                  ; 0192 _ E8, 00000000(rel)
        test    eax, eax                                ; 0197 _ 85. C0
        je      ?_004                                   ; 0199 _ 0F 84, 000001A1
        mov     dword [rsp+0A0H], esi                   ; 019F _ 89. B4 24, 000000A0
        call    _Z3nowv                                 ; 01A6 _ E8, 00000000(rel)
        xor     ebx, ebx                                ; 01AB _ 31. DB
        xor     esi, esi                                ; 01AD _ 31. F6
        mov     qword [rsp+40H], rax                    ; 01AF _ 48: 89. 44 24, 40
        mov     rax, qword [rel .refptr.Threads]        ; 01B4 _ 48: 8B. 05, 00000000(rel)
        lea     r15, [rel _ZN12_GLOBAL__N_18DefaultsE]  ; 01BB _ 4C: 8D. 3D, 000008C0(rel)
        lea     rbp, [rsp+1D0H]                         ; 01C2 _ 48: 8D. AC 24, 000001D0
        lea     rdi, [rsp+0D0H]                         ; 01CA _ 48: 8D. BC 24, 000000D0
        lea     r14, [rsp+60H]                          ; 01D2 _ 4C: 8D. 74 24, 60
        lea     r13, [rsp+70H]                          ; 01D7 _ 4C: 8D. 6C 24, 70
        mov     qword [rsp+28H], rax                    ; 01DC _ 48: 89. 44 24, 28
        mov     qword [rsp+30H], rax                    ; 01E1 _ 48: 89. 44 24, 30
        mov     qword [rsp+38H], rax                    ; 01E6 _ 48: 89. 44 24, 38
?_003:  mov     rcx, qword [rsp+28H]                    ; 01EB _ 48: 8B. 4C 24, 28
        call    _ZN10ThreadPool4mainEv                  ; 01F0 _ E8, 00000000(rel)
        movzx   r8d, byte [r12+41H]                     ; 01F5 _ 45: 0F B6. 44 24, 41
        mov     rcx, rbp                                ; 01FB _ 48: 89. E9
        mov     rdx, qword [r15+rbx*8]                  ; 01FE _ 49: 8B. 14 DF
        mov     r9, rax                                 ; 0202 _ 49: 89. C1
        add     rbx, 1                                  ; 0205 _ 48: 83. C3, 01
        call    _ZN8Position9parse_setEPKcbP6Thread     ; 0209 _ E8, 00000000(rel)
        lea     rdx, [rel ?_013]                        ; 020E _ 48: 8D. 15, 0000007A(rel)
        mov     rcx, rdi                                ; 0215 _ 48: 89. F9
        call    _Z12print_stringPcPKc                   ; 0218 _ E8, 00000000(rel)
        mov     rdx, rbx                                ; 021D _ 48: 89. DA
        mov     rcx, rax                                ; 0220 _ 48: 89. C1
        call    _Z9print_intPcy                         ; 0223 _ E8, 00000000(rel)
        lea     rdx, [rel ?_014]                        ; 0228 _ 48: 8D. 15, 00000085(rel)
        mov     rcx, rax                                ; 022F _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 0232 _ E8, 00000000(rel)
        mov     rcx, rdi                                ; 0237 _ 48: 89. F9
        mov     rdx, rax                                ; 023A _ 48: 89. C2
        call    _Z11write_errorPcS_                     ; 023D _ E8, 00000000(rel)
        mov     qword [rsp+60H], 0                      ; 0242 _ 48: C7. 44 24, 60, 00000000
        call    _Z3nowv                                 ; 024B _ E8, 00000000(rel)
        mov     rcx, qword [rsp+30H]                    ; 0250 _ 48: 8B. 4C 24, 30
        mov     r9, r14                                 ; 0255 _ 4D: 89. F1
        mov     r8, r13                                 ; 0258 _ 4D: 89. E8
        mov     rdx, rbp                                ; 025B _ 48: 89. EA
        mov     qword [rsp+0C0H], rax                   ; 025E _ 48: 89. 84 24, 000000C0
        call    _ZN10ThreadPool14start_thinkingERK8PositionRKN6Search10LimitsTypeERSt10unique_ptrISt5stackI9StateInfoSt5dequeIS9_SaIS9_EEESt14default_deleteISD_EE; 0266 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+38H]                    ; 026B _ 48: 8B. 4C 24, 38
        call    _ZN10ThreadPool4mainEv                  ; 0270 _ E8, 00000000(rel)
        mov     rcx, rax                                ; 0275 _ 48: 89. C1
        call    _ZN6Thread24wait_for_search_finishedEv  ; 0278 _ E8, 00000000(rel)
        mov     rcx, qword [rel .refptr.Threads]        ; 027D _ 48: 8B. 0D, 00000000(rel)
        call    _ZN10ThreadPool14nodes_searchedEv       ; 0284 _ E8, 00000000(rel)
        mov     r10, qword [rsp+60H]                    ; 0289 _ 4C: 8B. 54 24, 60
        add     rsi, rax                                ; 028E _ 48: 01. C6
        test    r10, r10                                ; 0291 _ 4D: 85. D2
        jne     .text.unlikely+2EH                      ; 0294 _ 0F 85, 0000002E(rel)
        cmp     rbx, 30                                 ; 029A _ 48: 83. FB, 1E
        jne     ?_003                                   ; 029E _ 0F 85, FFFFFF47
        mov     rcx, qword [rsp+70H]                    ; 02A4 _ 48: 8B. 4C 24, 70
        test    rcx, rcx                                ; 02A9 _ 48: 85. C9
        jne     .text.unlikely+24H                      ; 02AC _ 0F 85, 00000024(rel)
        call    _Z3nowv                                 ; 02B2 _ E8, 00000000(rel)
        sub     rax, qword [rsp+40H]                    ; 02B7 _ 48: 2B. 44 24, 40
        mov     rcx, rdi                                ; 02BC _ 48: 89. F9
        lea     rdx, [rel ?_015]                        ; 02BF _ 48: 8D. 15, 0000008A(rel)
        lea     rbx, [rax+1H]                           ; 02C6 _ 48: 8D. 58, 01
        call    _Z12print_stringPcPKc                   ; 02CA _ E8, 00000000(rel)
        mov     rdx, rbx                                ; 02CF _ 48: 89. DA
        mov     rcx, rax                                ; 02D2 _ 48: 89. C1
        call    _Z9print_intPcx                         ; 02D5 _ E8, 00000000(rel)
        lea     rdx, [rel ?_016]                        ; 02DA _ 48: 8D. 15, 0000009E(rel)
        mov     rcx, rax                                ; 02E1 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 02E4 _ E8, 00000000(rel)
        mov     rdx, rsi                                ; 02E9 _ 48: 89. F2
        mov     rcx, rax                                ; 02EC _ 48: 89. C1
        call    _Z9print_intPcy                         ; 02EF _ E8, 00000000(rel)
        lea     rdx, [rel ?_017]                        ; 02F4 _ 48: 8D. 15, 000000B2(rel)
        mov     rcx, rax                                ; 02FB _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 02FE _ E8, 00000000(rel)
        mov     rcx, rax                                ; 0303 _ 48: 89. C1
        mov     rax, rsi                                ; 0306 _ 48: 89. F0
        mov     edx, 1000                               ; 0309 _ BA, 000003E8
        mul     rdx                                     ; 030E _ 48: F7. E2
        div     rbx                                     ; 0311 _ 48: F7. F3
        mov     rdx, rax                                ; 0314 _ 48: 89. C2
        call    _Z9print_intPcy                         ; 0317 _ E8, 00000000(rel)
        mov     rcx, rdi                                ; 031C _ 48: 89. F9
        lea     rdx, [rax+1H]                           ; 031F _ 48: 8D. 50, 01
        mov     byte [rax], 10                          ; 0323 _ C6. 00, 0A
        call    _Z11write_errorPcS_                     ; 0326 _ E8, 00000000(rel)
        nop                                             ; 032B _ 90
        add     rsp, 1448                               ; 032C _ 48: 81. C4, 000005A8
        pop     rbx                                     ; 0333 _ 5B
        pop     rsi                                     ; 0334 _ 5E
        pop     rdi                                     ; 0335 _ 5F
        pop     rbp                                     ; 0336 _ 5D
        pop     r12                                     ; 0337 _ 41: 5C
        pop     r13                                     ; 0339 _ 41: 5D
        pop     r14                                     ; 033B _ 41: 5E
        pop     r15                                     ; 033D _ 41: 5F
        ret                                             ; 033F _ C3

?_004:  jmp     .text.unlikely+8DH                      ; 0340 _ E9, 0000008D(rel)

?_005:  jmp     .text.unlikely+0A5H                     ; 0345 _ E9, 000000A5(rel)

?_006:  ; Local function
        jmp     .text.unlikely+0EEH                     ; 034A _ E9, 000000EE(rel)

        nop                                             ; 034F _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=16 noexecute                      ; section number 3, bss


SECTION .rdata  align=64 noexecute                      ; section number 4, const

?_007:                                                  ; byte
        db 76H, 65H, 63H, 74H, 6FH, 72H, 3AH, 3AH       ; 0000 _ vector::
        db 5FH, 4DH, 5FH, 72H, 61H, 6EH, 67H, 65H       ; 0008 _ _M_range
        db 5FH, 63H, 68H, 65H, 63H, 6BH, 3AH, 20H       ; 0010 _ _check: 
        db 5FH, 5FH, 6EH, 20H, 28H, 77H, 68H, 69H       ; 0018 _ __n (whi
        db 63H, 68H, 20H, 69H, 73H, 20H, 25H, 7AH       ; 0020 _ ch is %z
        db 75H, 29H, 20H, 3EH, 3DH, 20H, 74H, 68H       ; 0028 _ u) >= th
        db 69H, 73H, 2DH, 3EH, 73H, 69H, 7AH, 65H       ; 0030 _ is->size
        db 28H, 29H, 20H, 28H, 77H, 68H, 69H, 63H       ; 0038 _ () (whic
        db 68H, 20H, 69H, 73H, 20H, 25H, 7AH, 75H       ; 0040 _ h is %zu
        db 29H, 00H                                     ; 0048 _ ).

?_008:                                                  ; byte
        db 70H, 65H, 72H, 66H, 74H, 00H                 ; 004A _ perft.

?_009:                                                  ; byte
        db 76H, 65H, 63H, 74H, 6FH, 72H, 3AH, 3AH       ; 0050 _ vector::
        db 5FH, 4DH, 5FH, 64H, 65H, 66H, 61H, 75H       ; 0058 _ _M_defau
        db 6CH, 74H, 5FH, 61H, 70H, 70H, 65H, 6EH       ; 0060 _ lt_appen
        db 64H, 00H                                     ; 0068 _ d.

?_010:                                                  ; byte
        db 74H, 69H, 6DH, 65H, 00H                      ; 006A _ time.

?_011:                                                  ; byte
        db 6EH, 6FH, 64H, 65H, 73H, 00H                 ; 006F _ nodes.

?_012:                                                  ; byte
        db 6DH, 61H, 74H, 65H, 00H                      ; 0075 _ mate.

?_013:                                                  ; byte
        db 50H, 6FH, 73H, 69H, 74H, 69H, 6FH, 6EH       ; 007A _ Position
        db 3AH, 20H, 00H                                ; 0082 _ : .

?_014:                                                  ; byte
        db 2FH, 33H, 30H, 0AH, 00H                      ; 0085 _ /30..

?_015:                                                  ; byte
        db 0AH, 54H, 6FH, 74H, 61H, 6CH, 20H, 74H       ; 008A _ .Total t
        db 69H, 6DH, 65H, 20H, 28H, 6DH, 73H, 29H       ; 0092 _ ime (ms)
        db 20H, 3AH, 20H, 00H                           ; 009A _  : .

?_016:                                                  ; byte
        db 0AH, 4EH, 6FH, 64H, 65H, 73H, 20H, 73H       ; 009E _ .Nodes s
        db 65H, 61H, 72H, 63H, 68H, 65H, 64H, 20H       ; 00A6 _ earched 
        db 20H, 3AH, 20H, 00H                           ; 00AE _  : .

?_017:                                                  ; byte
        db 0AH, 4EH, 6FH, 64H, 65H, 73H, 2FH, 73H       ; 00B2 _ .Nodes/s
        db 65H, 63H, 6FH, 6EH, 64H, 20H, 20H, 20H       ; 00BA _ econd   
        db 20H, 3AH, 20H, 00H, 00H, 00H, 72H, 6EH       ; 00C2 _  : ...rn
        db 62H, 71H, 6BH, 62H, 6EH, 72H, 2FH, 70H       ; 00CA _ bqkbnr/p
        db 70H, 70H, 70H, 70H, 70H, 70H, 70H, 2FH       ; 00D2 _ ppppppp/
        db 38H, 2FH, 38H, 2FH, 38H, 2FH, 38H, 2FH       ; 00DA _ 8/8/8/8/
        db 50H, 50H, 50H, 50H, 50H, 50H, 50H, 50H       ; 00E2 _ PPPPPPPP
        db 2FH, 52H, 4EH, 42H, 51H, 4BH, 42H, 4EH       ; 00EA _ /RNBQKBN
        db 52H, 20H, 77H, 20H, 4BH, 51H, 6BH, 71H       ; 00F2 _ R w KQkq
        db 20H, 2DH, 20H, 30H, 20H, 31H, 00H, 00H       ; 00FA _  - 0 1..
        db 00H, 00H, 00H, 00H, 00H, 00H, 72H, 33H       ; 0102 _ ......r3
        db 6BH, 32H, 72H, 2FH, 70H, 31H, 70H, 70H       ; 010A _ k2r/p1pp
        db 71H, 70H, 62H, 31H, 2FH, 62H, 6EH, 32H       ; 0112 _ qpb1/bn2
        db 70H, 6EH, 70H, 31H, 2FH, 33H, 50H, 4EH       ; 011A _ pnp1/3PN
        db 33H, 2FH, 31H, 70H, 32H, 50H, 33H, 2FH       ; 0122 _ 3/1p2P3/
        db 32H, 4EH, 32H, 51H, 31H, 70H, 2FH, 50H       ; 012A _ 2N2Q1p/P
        db 50H, 50H, 42H, 42H, 50H, 50H, 50H, 2FH       ; 0132 _ PPBBPPP/
        db 52H, 33H, 4BH, 32H, 52H, 20H, 77H, 20H       ; 013A _ R3K2R w 
        db 4BH, 51H, 6BH, 71H, 20H, 2DH, 20H, 30H       ; 0142 _ KQkq - 0
        db 20H, 31H, 30H, 00H, 00H, 00H, 38H, 2FH       ; 014A _  10...8/
        db 32H, 70H, 35H, 2FH, 33H, 70H, 34H, 2FH       ; 0152 _ 2p5/3p4/
        db 4BH, 50H, 35H, 72H, 2FH, 31H, 52H, 33H       ; 015A _ KP5r/1R3
        db 70H, 31H, 6BH, 2FH, 38H, 2FH, 34H, 50H       ; 0162 _ p1k/8/4P
        db 31H, 50H, 31H, 2FH, 38H, 20H, 77H, 20H       ; 016A _ 1P1/8 w 
        db 2DH, 20H, 2DH, 20H, 30H, 20H, 31H, 31H       ; 0172 _ - - 0 11
        db 00H, 00H, 00H, 00H, 00H, 00H, 34H, 72H       ; 017A _ ......4r
        db 72H, 6BH, 31H, 2FH, 70H, 70H, 31H, 6EH       ; 0182 _ rk1/pp1n
        db 33H, 70H, 2FH, 33H, 71H, 32H, 70H, 51H       ; 018A _ 3p/3q2pQ
        db 2FH, 32H, 70H, 31H, 70H, 62H, 32H, 2FH       ; 0192 _ /2p1pb2/
        db 32H, 50H, 50H, 34H, 2FH, 32H, 50H, 33H       ; 019A _ 2PP4/2P3
        db 4EH, 31H, 2FH, 50H, 32H, 42H, 32H, 50H       ; 01A2 _ N1/P2B2P
        db 50H, 2FH, 34H, 52H, 52H, 4BH, 31H, 20H       ; 01AA _ P/4RRK1 
        db 62H, 20H, 2DH, 20H, 2DH, 20H, 37H, 20H       ; 01B2 _ b - - 7 
        db 31H, 39H, 00H, 00H, 00H, 00H, 72H, 71H       ; 01BA _ 19....rq
        db 33H, 72H, 6BH, 31H, 2FH, 70H, 70H, 70H       ; 01C2 _ 3rk1/ppp
        db 32H, 70H, 70H, 70H, 2FH, 31H, 62H, 6EH       ; 01CA _ 2ppp/1bn
        db 70H, 62H, 33H, 2FH, 33H, 4EH, 32H, 42H       ; 01D2 _ pb3/3N2B
        db 31H, 2FH, 33H, 4EH, 50H, 33H, 2FH, 37H       ; 01DA _ 1/3NP3/7
        db 50H, 2FH, 50H, 50H, 50H, 51H, 31H, 50H       ; 01E2 _ P/PPPQ1P
        db 50H, 31H, 2FH, 32H, 4BH, 52H, 33H, 52H       ; 01EA _ P1/2KR3R
        db 20H, 77H, 20H, 2DH, 20H, 2DH, 20H, 37H       ; 01F2 _  w - - 7
        db 20H, 31H, 34H, 00H, 00H, 00H, 72H, 31H       ; 01FA _  14...r1
        db 62H, 71H, 31H, 72H, 31H, 6BH, 2FH, 31H       ; 0202 _ bq1r1k/1
        db 70H, 70H, 31H, 6EH, 31H, 70H, 70H, 2FH       ; 020A _ pp1n1pp/
        db 31H, 70H, 31H, 70H, 34H, 2FH, 34H, 70H       ; 0212 _ 1p1p4/4p
        db 32H, 51H, 2FH, 34H, 50H, 70H, 32H, 2FH       ; 021A _ 2Q/4Pp2/
        db 31H, 42H, 4EH, 50H, 34H, 2FH, 50H, 50H       ; 0222 _ 1BNP4/PP
        db 50H, 32H, 50H, 50H, 50H, 2FH, 33H, 52H       ; 022A _ P2PPP/3R
        db 31H, 52H, 4BH, 31H, 20H, 77H, 20H, 2DH       ; 0232 _ 1RK1 w -
        db 20H, 2DH, 20H, 32H, 20H, 31H, 34H, 00H       ; 023A _  - 2 14.
        db 00H, 00H, 00H, 00H, 00H, 00H, 72H, 33H       ; 0242 _ ......r3
        db 72H, 31H, 6BH, 31H, 2FH, 32H, 70H, 32H       ; 024A _ r1k1/2p2
        db 70H, 70H, 70H, 2FH, 70H, 31H, 70H, 31H       ; 0252 _ ppp/p1p1
        db 62H, 6EH, 32H, 2FH, 38H, 2FH, 31H, 71H       ; 025A _ bn2/8/1q
        db 32H, 50H, 33H, 2FH, 32H, 4EH, 50H, 51H       ; 0262 _ 2P3/2NPQ
        db 4EH, 32H, 2FH, 50H, 50H, 50H, 33H, 50H       ; 026A _ N2/PPP3P
        db 50H, 2FH, 52H, 34H, 52H, 4BH, 31H, 20H       ; 0272 _ P/R4RK1 
        db 62H, 20H, 2DH, 20H, 2DH, 20H, 32H, 20H       ; 027A _ b - - 2 
        db 31H, 35H, 00H, 00H, 00H, 00H, 72H, 31H       ; 0282 _ 15....r1
        db 62H, 62H, 6BH, 31H, 6EH, 72H, 2FH, 70H       ; 028A _ bbk1nr/p
        db 70H, 33H, 70H, 31H, 70H, 2FH, 32H, 6EH       ; 0292 _ p3p1p/2n
        db 35H, 2FH, 31H, 4EH, 34H, 70H, 31H, 2FH       ; 029A _ 5/1N4p1/
        db 32H, 4EH, 70H, 31H, 42H, 32H, 2FH, 38H       ; 02A2 _ 2Np1B2/8
        db 2FH, 50H, 50H, 50H, 32H, 50H, 50H, 50H       ; 02AA _ /PPP2PPP
        db 2FH, 32H, 4BH, 52H, 31H, 42H, 31H, 52H       ; 02B2 _ /2KR1B1R
        db 20H, 77H, 20H, 6BH, 71H, 20H, 2DH, 20H       ; 02BA _  w kq - 
        db 30H, 20H, 31H, 33H, 00H, 00H, 72H, 31H       ; 02C2 _ 0 13..r1
        db 62H, 71H, 31H, 72H, 6BH, 31H, 2FH, 70H       ; 02CA _ bq1rk1/p
        db 70H, 70H, 31H, 6EH, 70H, 70H, 70H, 2FH       ; 02D2 _ pp1nppp/
        db 34H, 6EH, 33H, 2FH, 33H, 70H, 33H, 51H       ; 02DA _ 4n3/3p3Q
        db 2FH, 33H, 50H, 34H, 2FH, 31H, 42H, 50H       ; 02E2 _ /3P4/1BP
        db 31H, 42H, 33H, 2FH, 50H, 50H, 31H, 4EH       ; 02EA _ 1B3/PP1N
        db 32H, 50H, 50H, 2FH, 52H, 34H, 52H, 4BH       ; 02F2 _ 2PP/R4RK
        db 31H, 20H, 77H, 20H, 2DH, 20H, 2DH, 20H       ; 02FA _ 1 w - - 
        db 31H, 20H, 31H, 36H, 00H, 00H, 34H, 72H       ; 0302 _ 1 16..4r
        db 31H, 6BH, 31H, 2FH, 72H, 31H, 71H, 32H       ; 030A _ 1k1/r1q2
        db 70H, 70H, 70H, 2FH, 70H, 70H, 70H, 32H       ; 0312 _ ppp/ppp2
        db 6EH, 32H, 2FH, 34H, 50H, 33H, 2FH, 35H       ; 031A _ n2/4P3/5
        db 52H, 62H, 31H, 2FH, 31H, 4EH, 31H, 42H       ; 0322 _ Rb1/1N1B
        db 51H, 33H, 2FH, 50H, 50H, 50H, 33H, 50H       ; 032A _ Q3/PPP3P
        db 50H, 2FH, 52H, 35H, 4BH, 31H, 20H, 77H       ; 0332 _ P/R5K1 w
        db 20H, 2DH, 20H, 2DH, 20H, 31H, 20H, 31H       ; 033A _  - - 1 1
        db 37H, 00H, 00H, 00H, 00H, 00H, 32H, 72H       ; 0342 _ 7.....2r
        db 71H, 6BH, 62H, 31H, 72H, 2FH, 70H, 70H       ; 034A _ qkb1r/pp
        db 70H, 32H, 70H, 32H, 2FH, 32H, 6EH, 70H       ; 0352 _ p2p2/2np
        db 62H, 31H, 70H, 31H, 2FH, 31H, 4EH, 31H       ; 035A _ b1p1/1N1
        db 4EH, 6EH, 32H, 70H, 2FH, 32H, 50H, 31H       ; 0362 _ Nn2p/2P1
        db 50H, 50H, 32H, 2FH, 38H, 2FH, 50H, 50H       ; 036A _ PP2/8/PP
        db 32H, 42H, 31H, 50H, 50H, 2FH, 52H, 31H       ; 0372 _ 2B1PP/R1
        db 42H, 51H, 4BH, 32H, 52H, 20H, 62H, 20H       ; 037A _ BQK2R b 
        db 4BH, 51H, 20H, 2DH, 20H, 30H, 20H, 31H       ; 0382 _ KQ - 0 1
        db 31H, 00H, 00H, 00H, 00H, 00H, 72H, 31H       ; 038A _ 1.....r1
        db 62H, 71H, 31H, 72H, 31H, 6BH, 2FH, 62H       ; 0392 _ bq1r1k/b
        db 31H, 70H, 31H, 6EH, 70H, 70H, 31H, 2FH       ; 039A _ 1p1npp1/
        db 70H, 32H, 70H, 33H, 70H, 2FH, 31H, 70H       ; 03A2 _ p2p3p/1p
        db 36H, 2FH, 33H, 50H, 50H, 33H, 2FH, 31H       ; 03AA _ 6/3PP3/1
        db 42H, 32H, 4EH, 4EH, 32H, 2FH, 50H, 50H       ; 03B2 _ B2NN2/PP
        db 33H, 50H, 50H, 50H, 2FH, 52H, 32H, 51H       ; 03BA _ 3PPP/R2Q
        db 31H, 52H, 4BH, 31H, 20H, 77H, 20H, 2DH       ; 03C2 _ 1RK1 w -
        db 20H, 2DH, 20H, 31H, 20H, 31H, 36H, 00H       ; 03CA _  - 1 16.
        db 00H, 00H, 00H, 00H, 00H, 00H, 33H, 72H       ; 03D2 _ ......3r
        db 31H, 72H, 6BH, 31H, 2FH, 70H, 35H, 70H       ; 03DA _ 1rk1/p5p
        db 70H, 2FH, 62H, 70H, 70H, 31H, 70H, 70H       ; 03E2 _ p/bpp1pp
        db 32H, 2FH, 38H, 2FH, 71H, 31H, 50H, 50H       ; 03EA _ 2/8/q1PP
        db 31H, 50H, 32H, 2FH, 62H, 33H, 50H, 33H       ; 03F2 _ 1P2/b3P3
        db 2FH, 50H, 32H, 4EH, 51H, 52H, 50H, 50H       ; 03FA _ /P2NQRPP
        db 2FH, 31H, 52H, 32H, 42H, 31H, 4BH, 31H       ; 0402 _ /1R2B1K1
        db 20H, 62H, 20H, 2DH, 20H, 2DH, 20H, 36H       ; 040A _  b - - 6
        db 20H, 32H, 32H, 00H, 00H, 00H, 72H, 31H       ; 0412 _  22...r1
        db 71H, 32H, 72H, 6BH, 31H, 2FH, 32H, 70H       ; 041A _ q2rk1/2p
        db 31H, 62H, 70H, 70H, 70H, 2FH, 32H, 50H       ; 0422 _ 1bppp/2P
        db 70H, 34H, 2FH, 70H, 36H, 62H, 2FH, 51H       ; 042A _ p4/p6b/Q
        db 31H, 50H, 4EH, 70H, 33H, 2FH, 34H, 42H       ; 0432 _ 1PNp3/4B
        db 33H, 2FH, 50H, 50H, 31H, 52H, 31H, 50H       ; 043A _ 3/PP1R1P
        db 50H, 50H, 2FH, 32H, 4BH, 34H, 52H, 20H       ; 0442 _ PP/2K4R 
        db 77H, 20H, 2DH, 20H, 2DH, 20H, 32H, 20H       ; 044A _ w - - 2 
        db 31H, 38H, 00H, 00H, 00H, 00H, 34H, 6BH       ; 0452 _ 18....4k
        db 32H, 72H, 2FH, 31H, 70H, 62H, 32H, 70H       ; 045A _ 2r/1pb2p
        db 70H, 70H, 2FH, 31H, 70H, 32H, 70H, 33H       ; 0462 _ pp/1p2p3
        db 2FH, 31H, 52H, 31H, 70H, 34H, 2FH, 33H       ; 046A _ /1R1p4/3
        db 50H, 34H, 2FH, 32H, 72H, 31H, 50H, 4EH       ; 0472 _ P4/2r1PN
        db 32H, 2FH, 50H, 34H, 50H, 50H, 50H, 2FH       ; 047A _ 2/P4PPP/
        db 31H, 52H, 34H, 4BH, 31H, 20H, 62H, 20H       ; 0482 _ 1R4K1 b 
        db 2DH, 20H, 2DH, 20H, 33H, 20H, 32H, 32H       ; 048A _ - - 3 22
        db 00H, 00H, 00H, 00H, 00H, 00H, 33H, 71H       ; 0492 _ ......3q
        db 32H, 6BH, 31H, 2FH, 70H, 62H, 33H, 70H       ; 049A _ 2k1/pb3p
        db 31H, 70H, 2FH, 34H, 70H, 62H, 70H, 31H       ; 04A2 _ 1p/4pbp1
        db 2FH, 32H, 72H, 35H, 2FH, 50H, 70H, 4EH       ; 04AA _ /2r5/PpN
        db 32H, 4EH, 32H, 2FH, 31H, 50H, 32H, 50H       ; 04B2 _ 2N2/1P2P
        db 32H, 50H, 2FH, 35H, 50H, 50H, 31H, 2FH       ; 04BA _ 2P/5PP1/
        db 51H, 32H, 52H, 32H, 4BH, 31H, 20H, 62H       ; 04C2 _ Q2R2K1 b
        db 20H, 2DH, 20H, 2DH, 20H, 34H, 20H, 32H       ; 04CA _  - - 4 2
        db 36H, 00H, 00H, 00H, 00H, 00H, 36H, 6BH       ; 04D2 _ 6.....6k
        db 31H, 2FH, 36H, 70H, 31H, 2FH, 36H, 50H       ; 04DA _ 1/6p1/6P
        db 70H, 2FH, 70H, 70H, 70H, 35H, 2FH, 33H       ; 04E2 _ p/ppp5/3
        db 70H, 6EH, 32H, 50H, 2FH, 31H, 50H, 33H       ; 04EA _ pn2P/1P3
        db 4BH, 32H, 2FH, 31H, 50H, 50H, 32H, 50H       ; 04F2 _ K2/1PP2P
        db 32H, 2FH, 33H, 4EH, 34H, 20H, 62H, 20H       ; 04FA _ 2/3N4 b 
        db 2DH, 20H, 2DH, 20H, 30H, 20H, 31H, 00H       ; 0502 _ - - 0 1.
        db 00H, 00H, 00H, 00H, 00H, 00H, 33H, 62H       ; 050A _ ......3b
        db 34H, 2FH, 35H, 6BH, 70H, 31H, 2FH, 31H       ; 0512 _ 4/5kp1/1
        db 70H, 31H, 70H, 31H, 70H, 31H, 70H, 2FH       ; 051A _ p1p1p1p/
        db 70H, 50H, 31H, 50H, 70H, 50H, 31H, 50H       ; 0522 _ pP1PpP1P
        db 2FH, 50H, 31H, 50H, 31H, 50H, 33H, 2FH       ; 052A _ /P1P1P3/
        db 33H, 4BH, 4EH, 33H, 2FH, 38H, 2FH, 38H       ; 0532 _ 3KN3/8/8
        db 20H, 77H, 20H, 2DH, 20H, 2DH, 20H, 30H       ; 053A _  w - - 0
        db 20H, 31H, 00H, 00H, 00H, 00H, 32H, 4BH       ; 0542 _  1....2K
        db 35H, 2FH, 70H, 37H, 2FH, 37H, 50H, 2FH       ; 054A _ 5/p7/7P/
        db 35H, 70H, 52H, 31H, 2FH, 38H, 2FH, 35H       ; 0552 _ 5pR1/8/5
        db 6BH, 32H, 2FH, 72H, 37H, 2FH, 38H, 20H       ; 055A _ k2/r7/8 
        db 77H, 20H, 2DH, 20H, 2DH, 20H, 30H, 20H       ; 0562 _ w - - 0 
        db 31H, 00H, 00H, 00H, 00H, 00H, 38H, 2FH       ; 056A _ 1.....8/
        db 36H, 70H, 6BH, 2FH, 31H, 70H, 36H, 2FH       ; 0572 _ 6pk/1p6/
        db 38H, 2FH, 50H, 50H, 33H, 70H, 31H, 70H       ; 057A _ 8/PP3p1p
        db 2FH, 35H, 50H, 32H, 2FH, 34H, 4BH, 50H       ; 0582 _ /5P2/4KP
        db 31H, 71H, 2FH, 33H, 51H, 34H, 20H, 77H       ; 058A _ 1q/3Q4 w
        db 20H, 2DH, 20H, 2DH, 20H, 30H, 20H, 31H       ; 0592 _  - - 0 1
        db 00H, 00H, 00H, 00H, 00H, 00H, 37H, 6BH       ; 059A _ ......7k
        db 2FH, 33H, 70H, 32H, 70H, 70H, 2FH, 34H       ; 05A2 _ /3p2pp/4
        db 71H, 33H, 2FH, 38H, 2FH, 34H, 51H, 33H       ; 05AA _ q3/8/4Q3
        db 2FH, 35H, 4BH, 70H, 31H, 2FH, 50H, 36H       ; 05B2 _ /5Kp1/P6
        db 62H, 2FH, 38H, 20H, 77H, 20H, 2DH, 20H       ; 05BA _ b/8 w - 
        db 2DH, 20H, 30H, 20H, 31H, 00H, 38H, 2FH       ; 05C2 _ - 0 1.8/
        db 32H, 70H, 35H, 2FH, 38H, 2FH, 32H, 6BH       ; 05CA _ 2p5/8/2k
        db 50H, 4BH, 70H, 31H, 70H, 2FH, 32H, 70H       ; 05D2 _ PKp1p/2p
        db 34H, 50H, 2FH, 32H, 50H, 35H, 2FH, 33H       ; 05DA _ 4P/2P5/3
        db 50H, 34H, 2FH, 38H, 20H, 77H, 20H, 2DH       ; 05E2 _ P4/8 w -
        db 20H, 2DH, 20H, 30H, 20H, 31H, 00H, 00H       ; 05EA _  - 0 1..
        db 00H, 00H, 00H, 00H, 00H, 00H, 38H, 2FH       ; 05F2 _ ......8/
        db 31H, 70H, 33H, 70H, 70H, 31H, 2FH, 37H       ; 05FA _ 1p3pp1/7
        db 70H, 2FH, 35H, 50H, 31H, 50H, 2FH, 32H       ; 0602 _ p/5P1P/2
        db 6BH, 33H, 50H, 31H, 2FH, 38H, 2FH, 32H       ; 060A _ k3P1/8/2
        db 4BH, 32H, 50H, 32H, 2FH, 38H, 20H, 77H       ; 0612 _ K2P2/8 w
        db 20H, 2DH, 20H, 2DH, 20H, 30H, 20H, 31H       ; 061A _  - - 0 1
        db 00H, 00H, 00H, 00H, 00H, 00H, 38H, 2FH       ; 0622 _ ......8/
        db 70H, 70H, 32H, 72H, 31H, 6BH, 31H, 2FH       ; 062A _ pp2r1k1/
        db 32H, 70H, 31H, 70H, 33H, 2FH, 33H, 70H       ; 0632 _ 2p1p3/3p
        db 50H, 32H, 70H, 2FH, 31H, 50H, 31H, 50H       ; 063A _ P2p/1P1P
        db 31H, 50H, 31H, 50H, 2FH, 50H, 35H, 4BH       ; 0642 _ 1P1P/P5K
        db 52H, 2FH, 38H, 2FH, 38H, 20H, 77H, 20H       ; 064A _ R/8/8 w 
        db 2DH, 20H, 2DH, 20H, 30H, 20H, 31H, 00H       ; 0652 _ - - 0 1.
        db 00H, 00H, 00H, 00H, 00H, 00H, 38H, 2FH       ; 065A _ ......8/
        db 33H, 70H, 34H, 2FH, 70H, 31H, 62H, 6BH       ; 0662 _ 3p4/p1bk
        db 33H, 70H, 2FH, 50H, 70H, 36H, 2FH, 31H       ; 066A _ 3p/Pp6/1
        db 4BH, 70H, 31H, 50H, 70H, 50H, 70H, 2FH       ; 0672 _ Kp1PpPp/
        db 32H, 50H, 32H, 50H, 31H, 50H, 2FH, 32H       ; 067A _ 2P2P1P/2
        db 50H, 35H, 2FH, 35H, 42H, 32H, 20H, 62H       ; 0682 _ P5/5B2 b
        db 20H, 2DH, 20H, 2DH, 20H, 30H, 20H, 31H       ; 068A _  - - 0 1
        db 00H, 00H, 00H, 00H, 00H, 00H, 35H, 6BH       ; 0692 _ ......5k
        db 32H, 2FH, 37H, 52H, 2FH, 34H, 50H, 32H       ; 069A _ 2/7R/4P2
        db 70H, 2FH, 35H, 4BH, 32H, 2FH, 70H, 31H       ; 06A2 _ p/5K2/p1
        db 72H, 32H, 50H, 31H, 70H, 2FH, 38H, 2FH       ; 06AA _ r2P1p/8/
        db 38H, 2FH, 38H, 20H, 62H, 20H, 2DH, 20H       ; 06B2 _ 8/8 b - 
        db 2DH, 20H, 30H, 20H, 31H, 00H, 36H, 6BH       ; 06BA _ - 0 1.6k
        db 31H, 2FH, 36H, 70H, 31H, 2FH, 50H, 36H       ; 06C2 _ 1/6p1/P6
        db 70H, 2FH, 72H, 31H, 4EH, 35H, 2FH, 35H       ; 06CA _ p/r1N5/5
        db 70H, 32H, 2FH, 37H, 50H, 2FH, 31H, 62H       ; 06D2 _ p2/7P/1b
        db 33H, 50H, 50H, 31H, 2FH, 34H, 52H, 31H       ; 06DA _ 3PP1/4R1
        db 4BH, 31H, 20H, 77H, 20H, 2DH, 20H, 2DH       ; 06E2 _ K1 w - -
        db 20H, 30H, 20H, 31H, 00H, 00H, 31H, 72H       ; 06EA _  0 1..1r
        db 33H, 6BH, 32H, 2FH, 34H, 71H, 33H, 2FH       ; 06F2 _ 3k2/4q3/
        db 32H, 50H, 70H, 33H, 62H, 2FH, 33H, 42H       ; 06FA _ 2Pp3b/3B
        db 70H, 33H, 2FH, 32H, 51H, 32H, 70H, 32H       ; 0702 _ p3/2Q2p2
        db 2FH, 31H, 70H, 31H, 50H, 32H, 50H, 31H       ; 070A _ /1p1P2P1
        db 2FH, 31H, 50H, 32H, 4BH, 50H, 32H, 2FH       ; 0712 _ /1P2KP2/
        db 33H, 4EH, 34H, 20H, 77H, 20H, 2DH, 20H       ; 071A _ 3N4 w - 
        db 2DH, 20H, 30H, 20H, 31H, 00H, 36H, 6BH       ; 0722 _ - 0 1.6k
        db 31H, 2FH, 34H, 70H, 70H, 31H, 70H, 2FH       ; 072A _ 1/4pp1p/
        db 33H, 70H, 32H, 70H, 31H, 2FH, 50H, 31H       ; 0732 _ 3p2p1/P1
        db 70H, 50H, 62H, 33H, 2FH, 52H, 37H, 2FH       ; 073A _ pPb3/R7/
        db 31H, 72H, 32H, 50H, 31H, 50H, 50H, 2FH       ; 0742 _ 1r2P1PP/
        db 33H, 42H, 31H, 50H, 32H, 2FH, 36H, 4BH       ; 074A _ 3B1P2/6K
        db 31H, 20H, 77H, 20H, 2DH, 20H, 2DH, 20H       ; 0752 _ 1 w - - 
        db 30H, 20H, 31H, 00H, 00H, 00H, 38H, 2FH       ; 075A _ 0 1...8/
        db 33H, 70H, 33H, 42H, 2FH, 35H, 70H, 32H       ; 0762 _ 3p3B/5p2
        db 2FH, 35H, 50H, 32H, 2FH, 70H, 37H, 2FH       ; 076A _ /5P2/p7/
        db 50H, 50H, 35H, 62H, 2FH, 6BH, 37H, 2FH       ; 0772 _ PP5b/k7/
        db 36H, 4BH, 31H, 20H, 77H, 20H, 2DH, 20H       ; 077A _ 6K1 w - 
        db 2DH, 20H, 30H, 20H, 31H, 00H, 38H, 2FH       ; 0782 _ - 0 1.8/
        db 38H, 2FH, 38H, 2FH, 38H, 2FH, 35H, 6BH       ; 078A _ 8/8/8/5k
        db 70H, 31H, 2FH, 50H, 37H, 2FH, 38H, 2FH       ; 0792 _ p1/P7/8/
        db 31H, 4BH, 31H, 4EH, 34H, 20H, 77H, 20H       ; 079A _ 1K1N4 w 
        db 2DH, 20H, 2DH, 20H, 30H, 20H, 31H, 00H       ; 07A2 _ - - 0 1.
        db 00H, 00H, 00H, 00H, 00H, 00H, 38H, 2FH       ; 07AA _ ......8/
        db 38H, 2FH, 38H, 2FH, 35H, 4EH, 32H, 2FH       ; 07B2 _ 8/8/5N2/
        db 38H, 2FH, 70H, 37H, 2FH, 38H, 2FH, 32H       ; 07BA _ 8/p7/8/2
        db 4EH, 4BH, 33H, 6BH, 20H, 77H, 20H, 2DH       ; 07C2 _ NK3k w -
        db 20H, 2DH, 20H, 30H, 20H, 31H, 00H, 00H       ; 07CA _  - 0 1..
        db 00H, 00H, 00H, 00H, 00H, 00H, 38H, 2FH       ; 07D2 _ ......8/
        db 33H, 6BH, 34H, 2FH, 38H, 2FH, 38H, 2FH       ; 07DA _ 3k4/8/8/
        db 38H, 2FH, 34H, 42H, 33H, 2FH, 34H, 4BH       ; 07E2 _ 8/4B3/4K
        db 42H, 32H, 2FH, 32H, 42H, 35H, 20H, 77H       ; 07EA _ B2/2B5 w
        db 20H, 2DH, 20H, 2DH, 20H, 30H, 20H, 31H       ; 07F2 _  - - 0 1
        db 00H, 00H, 00H, 00H, 00H, 00H, 38H, 2FH       ; 07FA _ ......8/
        db 38H, 2FH, 31H, 50H, 36H, 2FH, 35H, 70H       ; 0802 _ 8/1P6/5p
        db 72H, 31H, 2FH, 38H, 2FH, 34H, 52H, 33H       ; 080A _ r1/8/4R3
        db 2FH, 37H, 6BH, 2FH, 32H, 4BH, 35H, 20H       ; 0812 _ /7k/2K5 
        db 77H, 20H, 2DH, 20H, 2DH, 20H, 30H, 20H       ; 081A _ w - - 0 
        db 31H, 00H, 00H, 00H, 00H, 00H, 38H, 2FH       ; 0822 _ 1.....8/
        db 32H, 70H, 34H, 50H, 2FH, 38H, 2FH, 6BH       ; 082A _ 2p4P/8/k
        db 72H, 36H, 2FH, 36H, 52H, 31H, 2FH, 38H       ; 0832 _ r6/6R1/8
        db 2FH, 38H, 2FH, 31H, 4BH, 36H, 20H, 77H       ; 083A _ /8/1K6 w
        db 20H, 2DH, 20H, 2DH, 20H, 30H, 20H, 31H       ; 0842 _  - - 0 1
        db 00H, 00H, 00H, 00H, 00H, 00H, 38H, 2FH       ; 084A _ ......8/
        db 38H, 2FH, 33H, 50H, 33H, 6BH, 2FH, 38H       ; 0852 _ 8/3P3k/8
        db 2FH, 31H, 70H, 36H, 2FH, 38H, 2FH, 31H       ; 085A _ /1p6/8/1
        db 50H, 36H, 2FH, 31H, 4BH, 33H, 6EH, 32H       ; 0862 _ P6/1K3n2
        db 20H, 62H, 20H, 2DH, 20H, 2DH, 20H, 30H       ; 086A _  b - - 0
        db 20H, 31H, 00H, 00H, 00H, 00H, 38H, 2FH       ; 0872 _  1....8/
        db 52H, 37H, 2FH, 32H, 71H, 35H, 2FH, 38H       ; 087A _ R7/2q5/8
        db 2FH, 36H, 6BH, 31H, 2FH, 38H, 2FH, 31H       ; 0882 _ /6k1/8/1
        db 50H, 35H, 70H, 2FH, 4BH, 36H, 52H, 20H       ; 088A _ P5p/K6R 
        db 77H, 20H, 2DH, 20H, 2DH, 20H, 30H, 20H       ; 0892 _ w - - 0 
        db 31H, 32H, 34H, 00H, 00H, 00H, 00H, 00H       ; 089A _ 124.....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 08A2 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 08AA _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 08B2 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H                 ; 08BA _ ......

_ZN12_GLOBAL__N_18DefaultsE:                            ; byte
        dq .rdata+0C8H                                  ; 08C0 _ 00000000000000C8 (d)
        dq .rdata+108H                                  ; 08C8 _ 0000000000000108 (d)
        dq .rdata+150H                                  ; 08D0 _ 0000000000000150 (d)
        dq .rdata+180H                                  ; 08D8 _ 0000000000000180 (d)
        dq .rdata+1C0H                                  ; 08E0 _ 00000000000001C0 (d)
        dq .rdata+200H                                  ; 08E8 _ 0000000000000200 (d)
        dq .rdata+248H                                  ; 08F0 _ 0000000000000248 (d)
        dq .rdata+288H                                  ; 08F8 _ 0000000000000288 (d)
        dq .rdata+2C8H                                  ; 0900 _ 00000000000002C8 (d)
        dq .rdata+308H                                  ; 0908 _ 0000000000000308 (d)
        dq .rdata+348H                                  ; 0910 _ 0000000000000348 (d)
        dq .rdata+390H                                  ; 0918 _ 0000000000000390 (d)
        dq .rdata+3D8H                                  ; 0920 _ 00000000000003D8 (d)
        dq .rdata+418H                                  ; 0928 _ 0000000000000418 (d)
        dq .rdata+458H                                  ; 0930 _ 0000000000000458 (d)
        dq .rdata+498H                                  ; 0938 _ 0000000000000498 (d)
        dq .rdata+4D8H                                  ; 0940 _ 00000000000004D8 (d)
        dq .rdata+510H                                  ; 0948 _ 0000000000000510 (d)
        dq .rdata+548H                                  ; 0950 _ 0000000000000548 (d)
        dq .rdata+570H                                  ; 0958 _ 0000000000000570 (d)
        dq .rdata+5A0H                                  ; 0960 _ 00000000000005A0 (d)
        dq .rdata+5C8H                                  ; 0968 _ 00000000000005C8 (d)
        dq .rdata+5F8H                                  ; 0970 _ 00000000000005F8 (d)
        dq .rdata+628H                                  ; 0978 _ 0000000000000628 (d)
        dq .rdata+660H                                  ; 0980 _ 0000000000000660 (d)
        dq .rdata+698H                                  ; 0988 _ 0000000000000698 (d)
        dq .rdata+6C0H                                  ; 0990 _ 00000000000006C0 (d)
        dq .rdata+6F0H                                  ; 0998 _ 00000000000006F0 (d)
        dq .rdata+728H                                  ; 09A0 _ 0000000000000728 (d)
        dq .rdata+760H                                  ; 09A8 _ 0000000000000760 (d)
        dq .rdata+788H                                  ; 09B0 _ 0000000000000788 (d)
        dq .rdata+7B0H                                  ; 09B8 _ 00000000000007B0 (d)
        dq .rdata+7D8H                                  ; 09C0 _ 00000000000007D8 (d)
        dq .rdata+800H                                  ; 09C8 _ 0000000000000800 (d)
        dq .rdata+828H                                  ; 09D0 _ 0000000000000828 (d)
        dq .rdata+850H                                  ; 09D8 _ 0000000000000850 (d)
        dq .rdata+878H                                  ; 09E0 _ 0000000000000878 (d)
        dq 0000000000000000H                            ; 09E8 _ 0000000000000000 
        dq 0000000000000000H                            ; 09F0 _ 0000000000000000 
        dq 0000000000000000H                            ; 09F8 _ 0000000000000000 


SECTION .text$_ZN10ThreadPool4mainEv align=16 execute   ; section number 5, code
;  Communal section not supported by YASM

_ZN10ThreadPool4mainEv:; Function begin
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     rdx, qword [rcx]                        ; 0004 _ 48: 8B. 11
        mov     rax, qword [rcx+8H]                     ; 0007 _ 48: 8B. 41, 08
        sub     rax, rdx                                ; 000B _ 48: 29. D0
        sar     rax, 3                                  ; 000E _ 48: C1. F8, 03
        test    rax, rax                                ; 0012 _ 48: 85. C0
        jz      ?_018                                   ; 0015 _ 74, 08
        mov     rax, qword [rdx]                        ; 0017 _ 48: 8B. 02
        add     rsp, 40                                 ; 001A _ 48: 83. C4, 28
        ret                                             ; 001E _ C3
; _ZN10ThreadPool4mainEv End of function

?_018:  ; Local function
        lea     rcx, [rel ?_007]                        ; 001F _ 48: 8D. 0D, 00000000(rel)
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


SECTION .xdata$_ZN10ThreadPool4mainEv align=4 noexecute ; section number 6, const
;  Communal section not supported by YASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .text.unlikely align=16 execute                 ; section number 8, code

.text.unlikely:; Local function
_Z9benchmarkPKcR8Positioniyy.cold.55:
        call    _Z3nowv                                 ; 0000 _ E8, 00000000(rel)
        mov     edx, esi                                ; 0005 _ 89. F2
        mov     rcx, r12                                ; 0007 _ 4C: 89. E1
        mov     qword [rsp+40H], rax                    ; 000A _ 48: 89. 44 24, 40
        lea     rdi, [rsp+0D0H]                         ; 000F _ 48: 8D. BC 24, 000000D0
        call    _ZN6Search5perftILb1EEEyR8Position5Depth; 0017 _ E8, 00000000(rel)
        mov     rsi, rax                                ; 001C _ 48: 89. C6
        jmp     .text+2B2H                              ; 001F _ E9, 000002B2(rel)

        call    _ZdlPv                                  ; 0024 _ E8, 00000000(rel)
        jmp     .text+2B2H                              ; 0029 _ E9, 000002B2(rel)

        cmp     qword [r10], 0                          ; 002E _ 49: 83. 3A, 00
        jz      ?_021                                   ; 0032 _ 74, 4C
        mov     r9, qword [r10+48H]                     ; 0034 _ 4D: 8B. 4A, 48
        mov     rdx, qword [r10+28H]                    ; 0038 _ 49: 8B. 52, 28
        add     r9, 8                                   ; 003C _ 49: 83. C1, 08
        mov     qword [rsp+48H], r9                     ; 0040 _ 4C: 89. 4C 24, 48
?_019:  cmp     qword [rsp+48H], rdx                    ; 0045 _ 48: 39. 54 24, 48
        jbe     ?_020                                   ; 004A _ 76, 22
        mov     rcx, qword [rdx]                        ; 004C _ 48: 8B. 0A
        mov     qword [rsp+58H], r10                    ; 004F _ 4C: 89. 54 24, 58
        mov     qword [rsp+50H], rdx                    ; 0054 _ 48: 89. 54 24, 50
        call    _ZdlPv                                  ; 0059 _ E8, 00000000(rel)
        mov     rdx, qword [rsp+50H]                    ; 005E _ 48: 8B. 54 24, 50
        mov     r10, qword [rsp+58H]                    ; 0063 _ 4C: 8B. 54 24, 58
        add     rdx, 8                                  ; 0068 _ 48: 83. C2, 08
        jmp     ?_019                                   ; 006C _ EB, D7

?_020:  mov     rcx, qword [r10]                        ; 006E _ 49: 8B. 0A
        mov     qword [rsp+48H], r10                    ; 0071 _ 4C: 89. 54 24, 48
        call    _ZdlPv                                  ; 0076 _ E8, 00000000(rel)
        mov     r10, qword [rsp+48H]                    ; 007B _ 4C: 8B. 54 24, 48
?_021:  mov     rcx, r10                                ; 0080 _ 4C: 89. D1
        call    _ZdlPv                                  ; 0083 _ E8, 00000000(rel)
        jmp     .text+29AH                              ; 0088 _ E9, 0000029A(rel)

        mov     dword [rsp+0A8H], esi                   ; 008D _ 89. B4 24, 000000A8
        jmp     .text+1A6H                              ; 0094 _ E9, 000001A6(rel)

        mov     dword [rsp+0A4H], esi                   ; 0099 _ 89. B4 24, 000000A4
        jmp     .text+1A6H                              ; 00A0 _ E9, 000001A6(rel)

        mov     qword [rsp+0B8H], rsi                   ; 00A5 _ 48: 89. B4 24, 000000B8
        jmp     .text+1A6H                              ; 00AD _ E9, 000001A6(rel)

        sub     r9, rdx                                 ; 00B2 _ 49: 29. D1
        mov     rbx, r9                                 ; 00B5 _ 4C: 89. CB
        je      .text+155H                              ; 00B8 _ 0F 84, 00000155(rel)
        mov     r11, qword [r13+10H]                    ; 00BE _ 4D: 8B. 5D, 10
        sub     r11, rcx                                ; 00C2 _ 49: 29. CB
        sar     r11, 3                                  ; 00C5 _ 49: C1. FB, 03
        cmp     r9, r11                                 ; 00C9 _ 4D: 39. D9
        ja      ?_023                                   ; 00CC _ 77, 2D
        xor     ebp, ebp                                ; 00CE _ 31. ED
?_022:  mov     qword [rcx+rbp*8], 0                    ; 00D0 _ 48: C7. 04 E9, 00000000
        add     rbp, 1                                  ; 00D8 _ 48: 83. C5, 01
        cmp     rbp, rbx                                ; 00DC _ 48: 39. DD
        jnz     ?_022                                   ; 00DF _ 75, EF
        shl     rbp, 3                                  ; 00E1 _ 48: C1. E5, 03
        add     qword [r13+8H], rbp                     ; 00E5 _ 49: 01. 6D, 08
        jmp     .text+155H                              ; 00E9 _ E9, 00000155(rel)

; Note: No jump seems to point here
        lea     r10, [r8+r9*8]                          ; 00EE _ 4F: 8D. 14 C8
        mov     qword [r13+8H], r10                     ; 00F2 _ 4D: 89. 55, 08
        jmp     .text+155H                              ; 00F6 _ E9, 00000155(rel)

?_023:  ; Local function
        mov     r14, qword 1FFFFFFFFFFFFFFFH            ; 00FB _ 49: BE, 1FFFFFFFFFFFFFFF
        mov     r15, r14                                ; 0105 _ 4D: 89. F7
        sub     r15, rdx                                ; 0108 _ 49: 29. D7
        cmp     r9, r15                                 ; 010B _ 4D: 39. F9
        ja      ?_032                                   ; 010E _ 0F 87, 0000009E
        cmp     r9, rdx                                 ; 0114 _ 49: 39. D1
        mov     rbp, rdx                                ; 0117 _ 48: 89. D5
        cmovnc  rbp, r9                                 ; 011A _ 49: 0F 43. E9
        add     rdx, rbp                                ; 011E _ 48: 01. EA
        jc      ?_024                                   ; 0121 _ 72, 09
        cmp     rdx, r14                                ; 0123 _ 4C: 39. F2
        jbe     ?_033                                   ; 0126 _ 0F 86, 00000092
?_024:  mov     r15, qword 1FFFFFFFFFFFFFFFH            ; 012C _ 49: BF, 1FFFFFFFFFFFFFFF
?_025:  lea     rcx, [r15*8]                            ; 0136 _ 4A: 8D. 0C FD, 00000000
        call    _Znwy                                   ; 013E _ E8, 00000000(rel)
        mov     r14, rax                                ; 0143 _ 49: 89. C6
?_026:  mov     r8, qword [r13]                         ; 0146 _ 4D: 8B. 45, 00
        mov     r10, r14                                ; 014A _ 4D: 89. F2
        mov     rdx, qword [r13+8H]                     ; 014D _ 49: 8B. 55, 08
        mov     rcx, r8                                 ; 0151 _ 4C: 89. C1
?_027:  cmp     rdx, rcx                                ; 0154 _ 48: 39. CA
        jz      ?_029                                   ; 0157 _ 74, 15
        test    r10, r10                                ; 0159 _ 4D: 85. D2
        mov     r11, qword [rcx]                        ; 015C _ 4C: 8B. 19
        jz      ?_028                                   ; 015F _ 74, 03
        mov     qword [r10], r11                        ; 0161 _ 4D: 89. 1A
?_028:  add     r10, 8                                  ; 0164 _ 49: 83. C2, 08
        add     rcx, 8                                  ; 0168 _ 48: 83. C1, 08
        jmp     ?_027                                   ; 016C _ EB, E6

?_029:  sub     rdx, r8                                 ; 016E _ 4C: 29. C2
        xor     eax, eax                                ; 0171 _ 31. C0
        and     rdx, 0FFFFFFFFFFFFFFF8H                 ; 0173 _ 48: 83. E2, F8
        add     rdx, r14                                ; 0177 _ 4C: 01. F2
?_030:  mov     qword [rdx+rax*8], 0                    ; 017A _ 48: C7. 04 C2, 00000000
        add     rax, 1                                  ; 0182 _ 48: 83. C0, 01
        cmp     rax, rbx                                ; 0186 _ 48: 39. D8
        jnz     ?_030                                   ; 0189 _ 75, EF
        mov     rcx, qword [r13]                        ; 018B _ 49: 8B. 4D, 00
        lea     rbx, [rdx+rax*8]                        ; 018F _ 48: 8D. 1C C2
        test    rcx, rcx                                ; 0193 _ 48: 85. C9
        jz      ?_031                                   ; 0196 _ 74, 05
        call    _ZdlPv                                  ; 0198 _ E8, 00000000(rel)
?_031:  lea     r9, [r14+r15*8]                         ; 019D _ 4F: 8D. 0C FE
        mov     qword [r13], r14                        ; 01A1 _ 4D: 89. 75, 00
        mov     qword [r13+8H], rbx                     ; 01A5 _ 49: 89. 5D, 08
        mov     qword [r13+10H], r9                     ; 01A9 _ 4D: 89. 4D, 10
        jmp     .text+155H                              ; 01AD _ E9, 00000155(rel)

?_032:  lea     rcx, [rel ?_009]                        ; 01B2 _ 48: 8D. 0D, 00000050(rel)
        call    _ZSt20__throw_length_errorPKc           ; 01B9 _ E8, 00000000(rel)
?_033:  test    rdx, rdx                                ; 01BE _ 48: 85. D2
        jnz     ?_034                                   ; 01C1 _ 75, 0B
        xor     r15d, r15d                              ; 01C3 _ 45: 31. FF
        xor     r14d, r14d                              ; 01C6 _ 45: 31. F6
        jmp     ?_026                                   ; 01C9 _ E9, FFFFFF78

?_034:  ; Local function
        mov     r15, rdx                                ; 01CE _ 49: 89. D7
        jmp     ?_025                                   ; 01D1 _ E9, FFFFFF60

        nop                                             ; 01D6 _ 90
        nop                                             ; 01D7 _ 90
        nop                                             ; 01D8 _ 90
        nop                                             ; 01D9 _ 90
        nop                                             ; 01DA _ 90
        nop                                             ; 01DB _ 90
        nop                                             ; 01DC _ 90
        nop                                             ; 01DD _ 90
        nop                                             ; 01DE _ 90
        nop                                             ; 01DF _ 90


SECTION .xdata  align=4 noexecute                       ; section number 9, const

        db 01H, 13H, 0AH, 00H, 13H, 01H, 0B5H, 00H      ; 0000 _ ........
        db 0CH, 30H, 0BH, 60H, 0AH, 70H, 09H, 50H       ; 0008 _ .0.`.p.P
        db 08H, 0C0H, 06H, 0D0H, 04H, 0E0H, 02H, 0F0H   ; 0010 _ ........


SECTION .rdata$zzz align=16 noexecute                   ; section number 11, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr.Threads align=16 noexecute       ; section number 12, const
;  Communal section not supported by YASM

.refptr.Threads:                                        ; qword
        dq Threads                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.TT align=16 noexecute            ; section number 13, const
;  Communal section not supported by YASM

.refptr.TT:                                             ; qword
        dq TT                                           ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.Opt align=16 noexecute           ; section number 14, const
;  Communal section not supported by YASM

.refptr.Opt:                                            ; qword
        dq Opt                                          ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


