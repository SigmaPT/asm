; Disassembly of file: C:\Users\Dan\Dropbox\asm\SF\ucioption.o
; Thu Nov 05 01:03:55 2015
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro, x64

default rel

global _ZN3UCI13on_clear_hashERKNS_6OptionE: function
global _ZN3UCI10on_threadsERKNS_6OptionE: function
global _ZN3UCI10on_tb_pathERKNS_6OptionE: function
global _ZN3UCI12on_hash_sizeERKNS_6OptionE: function
global _ZNK3UCI19CaseInsensitiveLessclERKSsS2_: function
global _ZN3UCIlsERSoRKSt3mapISsNS_6OptionENS_19CaseInsensitiveLessESaISt4pairIKSsS2_EEE: function
global _ZN3UCI6OptionC1EPKcPFvRKS0_E: function
global _ZN3UCI6OptionC2EPKcPFvRKS0_E: function
global _ZN3UCI6OptionC1EbPFvRKS0_E: function
global _ZN3UCI6OptionC2EbPFvRKS0_E: function
global _ZN3UCI6OptionC1EPFvRKS0_E: function
global _ZN3UCI6OptionC2EPFvRKS0_E: function
global _ZN3UCI6OptionC1EiiiPFvRKS0_E: function
global _ZN3UCI6OptionC2EiiiPFvRKS0_E: function
global _ZNK3UCI6OptioncviEv: function
global _ZNK3UCI6OptioncvSsEv: function
global _ZN3UCI6OptionlsERKS0_: function
global _ZN3UCI6OptionaSERKSs: function
global _ZN3UCI4initERSt3mapISsNS_6OptionENS_19CaseInsensitiveLessESaISt4pairIKSsS1_EEE: function
global Options
global .weak._ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJOSsEESE_IJEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_._ZN3UCI13on_clear_hashERKNS_6OptionE
global _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_: function
global _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E: function
global .refptr.TT
global .refptr.Threads

extern Threads                                          ; byte
extern TT                                               ; byte
extern atexit                                           ; near
extern _ZdlPv                                           ; near
extern _ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base  ; near
extern _ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_ ; near
extern _ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base  ; near
extern _Znwy                                            ; near
extern _ZNSs4swapERSs                                   ; near
extern _ZNSs6assignERKSs                                ; near
extern _ZNSs6assignEPKcy                                ; near
extern strlen                                           ; near
extern _ZNSsC1EPKcRKSaIcE                               ; near
extern _ZNSs12_S_constructEycRKSaIcE                    ; near
extern _ZNSolsEi                                        ; near
extern _ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x ; near
extern _ZSt18_Rb_tree_incrementPKSt18_Rb_tree_node_base ; near
extern _ZSt24__throw_invalid_argumentPKc                ; near
extern _ZSt20__throw_out_of_rangePKc                    ; near
extern strtol                                           ; near
extern _ZN18TranspositionTable6resizeEy                 ; near
extern _ZNKSs7compareEPKc                               ; near
extern _ZNSs4_Rep10_M_destroyERKSaIcE                   ; near
extern _ZN10Tablebases4initERKSs                        ; near
extern _ZNSsC1ERKSs                                     ; near
extern memcpy                                           ; near
extern _ZNSs4_Rep9_S_createEyyRKSaIcE                   ; near
extern __mingw_vsnprintf                                ; near
extern _ZN10ThreadPool16read_uci_optionsEv              ; near
extern _ZN6Search5clearEv                               ; near
extern __imp_tolower                                    ; qword
extern __imp__errno                                     ; qword


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_ZN3UCI13on_clear_hashERKNS_6OptionE:
        jmp     _ZN6Search5clearEv                      ; 0000 _ E9, 00000000(rel)

; Filling space: 0BH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H

ALIGN   16

_ZN3UCI10on_threadsERKNS_6OptionE:; Function begin
        mov     rcx, qword [rel .refptr.Threads]        ; 0010 _ 48: 8B. 0D, 00000000(rel)
        jmp     _ZN10ThreadPool16read_uci_optionsEv     ; 0017 _ E9, 00000000(rel)
; _ZN3UCI10on_threadsERKNS_6OptionE End of function

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_ZL9vsnprintfPcyPKcS_:; Local function
        jmp     __mingw_vsnprintf                       ; 0020 _ E9, 00000000(rel)

; Filling space: 0BH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H

ALIGN   16

_ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60:; Local function
        push    rbp                                     ; 0030 _ 55
        push    r12                                     ; 0031 _ 41: 54
        push    rdi                                     ; 0033 _ 57
        push    rsi                                     ; 0034 _ 56
        push    rbx                                     ; 0035 _ 53
        mov     rbp, rsp                                ; 0036 _ 48: 89. E5
        sub     rsp, 48                                 ; 0039 _ 48: 83. EC, 30
        lea     r8, [rel ?_271]                         ; 003D _ 4C: 8D. 05, 00000000(rel)
        mov     edx, 16                                 ; 0044 _ BA, 00000010
        lea     r9, [rbp+50H]                           ; 0049 _ 4C: 8D. 4D, 50
        sub     rsp, 32                                 ; 004D _ 48: 83. EC, 20
        mov     r12, rcx                                ; 0051 _ 49: 89. CC
        lea     rdi, [rsp+20H]                          ; 0054 _ 48: 8D. 7C 24, 20
        mov     qword [rbp-8H], r9                      ; 0059 _ 4C: 89. 4D, F8
        mov     rcx, rdi                                ; 005D _ 48: 89. F9
        call    __mingw_vsnprintf                       ; 0060 _ E8, 00000000(rel)
        lea     r8, [rbp-9H]                            ; 0065 _ 4C: 8D. 45, F7
        xor     edx, edx                                ; 0069 _ 31. D2
        movsxd  rbx, eax                                ; 006B _ 48: 63. D8
        mov     rcx, rbx                                ; 006E _ 48: 89. D9
        call    _ZNSs4_Rep9_S_createEyyRKSaIcE          ; 0071 _ E8, 00000000(rel)
        cmp     rbx, 1                                  ; 0076 _ 48: 83. FB, 01
        lea     r9, [rax+18H]                           ; 007A _ 4C: 8D. 48, 18
        mov     rsi, rax                                ; 007E _ 48: 89. C6
        jz      ?_002                                   ; 0081 _ 74, 31
        mov     rcx, r9                                 ; 0083 _ 4C: 89. C9
        mov     r8, rbx                                 ; 0086 _ 49: 89. D8
        mov     rdx, rdi                                ; 0089 _ 48: 89. FA
        call    memcpy                                  ; 008C _ E8, 00000000(rel)
        mov     r9, rax                                 ; 0091 _ 49: 89. C1
?_001:  mov     rax, r12                                ; 0094 _ 4C: 89. E0
        mov     dword [rsi+10H], 0                      ; 0097 _ C7. 46, 10, 00000000
        mov     qword [rsi], rbx                        ; 009E _ 48: 89. 1E
        mov     byte [rsi+rbx+18H], 0                   ; 00A1 _ C6. 44 1E, 18, 00
        mov     qword [r12], r9                         ; 00A6 _ 4D: 89. 0C 24
        mov     rsp, rbp                                ; 00AA _ 48: 89. EC
        pop     rbx                                     ; 00AD _ 5B
        pop     rsi                                     ; 00AE _ 5E
        pop     rdi                                     ; 00AF _ 5F
        pop     r12                                     ; 00B0 _ 41: 5C
        pop     rbp                                     ; 00B2 _ 5D
        ret                                             ; 00B3 _ C3

?_002:  ; Local function
        movzx   eax, byte [rdi]                         ; 00B4 _ 0F B6. 07
        mov     byte [rsi+18H], al                      ; 00B7 _ 88. 46, 18
        jmp     ?_001                                   ; 00BA _ EB, D8

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_ZN3UCI10on_tb_pathERKNS_6OptionE:; Function begin
        push    rbx                                     ; 00C0 _ 53
        sub     rsp, 64                                 ; 00C1 _ 48: 83. EC, 40
        lea     rbx, [rsp+30H]                          ; 00C5 _ 48: 8D. 5C 24, 30
        lea     rdx, [rcx+8H]                           ; 00CA _ 48: 8D. 51, 08
        mov     rcx, rbx                                ; 00CE _ 48: 89. D9
        call    _ZNSsC1ERKSs                            ; 00D1 _ E8, 00000000(rel)
        mov     rcx, rbx                                ; 00D6 _ 48: 89. D9
        call    _ZN10Tablebases4initERKSs               ; 00D9 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+30H]                    ; 00DE _ 48: 8B. 4C 24, 30
        mov     eax, 4294967295                         ; 00E3 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 00E8 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 00ED _ 85. C0
        jle     ?_003                                   ; 00EF _ 7E, 0F
        add     rsp, 64                                 ; 00F1 _ 48: 83. C4, 40
        pop     rbx                                     ; 00F5 _ 5B
        ret                                             ; 00F6 _ C3

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_003:  lea     rdx, [rsp+2FH]                          ; 0100 _ 48: 8D. 54 24, 2F
        sub     rcx, 24                                 ; 0105 _ 48: 83. E9, 18
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 0109 _ E8, 00000000(rel)
        nop                                             ; 010E _ 90
        add     rsp, 64                                 ; 010F _ 48: 83. C4, 40
        pop     rbx                                     ; 0113 _ 5B
        ret                                             ; 0114 _ C3
; _ZN3UCI10on_tb_pathERKNS_6OptionE End of function

; Filling space: 0BH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H

ALIGN   16

_ZN3UCI12on_hash_sizeERKNS_6OptionE:; Function begin
        push    rdi                                     ; 0120 _ 57
        push    rsi                                     ; 0121 _ 56
        push    rbx                                     ; 0122 _ 53
        sub     rsp, 48                                 ; 0123 _ 48: 83. EC, 30
        lea     rdx, [rel ?_272]                        ; 0127 _ 48: 8D. 15, 00000003(rel)
        mov     rbx, rcx                                ; 012E _ 48: 89. CB
        lea     rcx, [rcx+10H]                          ; 0131 _ 48: 8D. 49, 10
        call    _ZNKSs7compareEPKc                      ; 0135 _ E8, 00000000(rel)
        test    eax, eax                                ; 013A _ 85. C0
        jz      ?_005                                   ; 013C _ 74, 32
        lea     rcx, [rbx+8H]                           ; 013E _ 48: 8D. 4B, 08
        lea     rdx, [rel ?_274]                        ; 0142 _ 48: 8D. 15, 0000000D(rel)
        call    _ZNKSs7compareEPKc                      ; 0149 _ E8, 00000000(rel)
        test    eax, eax                                ; 014E _ 85. C0
        sete    al                                      ; 0150 _ 0F 94. C0
        movzx   eax, al                                 ; 0153 _ 0F B6. C0
?_004:  mov     rcx, qword [rel .refptr.TT]             ; 0156 _ 48: 8B. 0D, 00000000(rel)
        movsxd  rdx, eax                                ; 015D _ 48: 63. D0
        call    _ZN18TranspositionTable6resizeEy        ; 0160 _ E8, 00000000(rel)
        nop                                             ; 0165 _ 90
        add     rsp, 48                                 ; 0166 _ 48: 83. C4, 30
        pop     rbx                                     ; 016A _ 5B
        pop     rsi                                     ; 016B _ 5E
        pop     rdi                                     ; 016C _ 5F
        ret                                             ; 016D _ C3

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_005:  mov     rsi, qword [rbx+8H]                     ; 0170 _ 48: 8B. 73, 08
        mov     rdi, qword [rel __imp__errno]           ; 0174 _ 48: 8B. 3D, 00000000(rel)
        call    rdi                                     ; 017B _ FF. D7
        lea     rdx, [rsp+28H]                          ; 017D _ 48: 8D. 54 24, 28
        mov     r8d, 10                                 ; 0182 _ 41: B8, 0000000A
        mov     dword [rax], 0                          ; 0188 _ C7. 00, 00000000
        mov     rcx, rsi                                ; 018E _ 48: 89. F1
        call    strtol                                  ; 0191 _ E8, 00000000(rel)
        cmp     rsi, qword [rsp+28H]                    ; 0196 _ 48: 3B. 74 24, 28
        mov     ebx, eax                                ; 019B _ 89. C3
        jz      ?_007                                   ; 019D _ 74, 1D
        call    rdi                                     ; 019F _ FF. D7
        cmp     dword [rax], 34                         ; 01A1 _ 83. 38, 22
        jz      ?_006                                   ; 01A4 _ 74, 0A
        mov     eax, ebx                                ; 01A6 _ 89. D8
        jmp     ?_004                                   ; 01A8 _ EB, AC

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_006:  lea     rcx, [rel ?_273]                        ; 01B0 _ 48: 8D. 0D, 00000008(rel)
        call    _ZSt20__throw_out_of_rangePKc           ; 01B7 _ E8, 00000000(rel)
?_007:  lea     rcx, [rel ?_273]                        ; 01BC _ 48: 8D. 0D, 00000008(rel)
        call    _ZSt24__throw_invalid_argumentPKc       ; 01C3 _ E8, 00000000(rel)
        nop                                             ; 01C8 _ 90
        nop                                             ; 01C9 _ 90
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZNK3UCI19CaseInsensitiveLessclERKSsS2_:
        push    r14                                     ; 01D0 _ 41: 56
        push    r13                                     ; 01D2 _ 41: 55
        push    r12                                     ; 01D4 _ 41: 54
        push    rbp                                     ; 01D6 _ 55
        push    rdi                                     ; 01D7 _ 57
        push    rsi                                     ; 01D8 _ 56
        push    rbx                                     ; 01D9 _ 53
        sub     rsp, 32                                 ; 01DA _ 48: 83. EC, 20
        mov     rbx, qword [rdx]                        ; 01DE _ 48: 8B. 1A
        mov     r13, qword [r8]                         ; 01E1 _ 4D: 8B. 28
        mov     rax, qword [rbx-18H]                    ; 01E4 _ 48: 8B. 43, E8
        mov     r12, qword [r13-18H]                    ; 01E8 _ 4D: 8B. 65, E8
        mov     rsi, r13                                ; 01EC _ 4C: 89. EE
        lea     rdx, [rbx+rax]                          ; 01EF _ 48: 8D. 14 03
        lea     rbp, [rbx+r12]                          ; 01F3 _ 4A: 8D. 2C 23
        cmp     rax, r12                                ; 01F7 _ 4C: 39. E0
        cmovle  rbp, rdx                                ; 01FA _ 48: 0F 4E. EA
        cmp     rbx, rbp                                ; 01FE _ 48: 39. EB
        jz      ?_009                                   ; 0201 _ 74, 28
        mov     rdi, qword [rel __imp_tolower]          ; 0203 _ 48: 8B. 3D, 00000000(rel)
?_008:  movsx   ecx, byte [rbx]                         ; 020A _ 0F BE. 0B
        call    rdi                                     ; 020D _ FF. D7
        movsx   ecx, byte [rsi]                         ; 020F _ 0F BE. 0E
        mov     r14d, eax                               ; 0212 _ 41: 89. C6
        call    rdi                                     ; 0215 _ FF. D7
        cmp     r14d, eax                               ; 0217 _ 41: 39. C6
        jl      ?_012                                   ; 021A _ 7C, 35
        jg      ?_010                                   ; 021C _ 7F, 22
        add     rbx, 1                                  ; 021E _ 48: 83. C3, 01
        add     rsi, 1                                  ; 0222 _ 48: 83. C6, 01
        cmp     rbp, rbx                                ; 0226 _ 48: 39. DD
        jnz     ?_008                                   ; 0229 _ 75, DF
?_009:  add     r12, r13                                ; 022B _ 4D: 01. EC
        cmp     rsi, r12                                ; 022E _ 4C: 39. E6
        setne   al                                      ; 0231 _ 0F 95. C0
        jmp     ?_011                                   ; 0234 _ EB, 0C

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_010:  xor     eax, eax                                ; 0240 _ 31. C0
?_011:  add     rsp, 32                                 ; 0242 _ 48: 83. C4, 20
        pop     rbx                                     ; 0246 _ 5B
        pop     rsi                                     ; 0247 _ 5E
        pop     rdi                                     ; 0248 _ 5F
        pop     rbp                                     ; 0249 _ 5D
        pop     r12                                     ; 024A _ 41: 5C
        pop     r13                                     ; 024C _ 41: 5D
        pop     r14                                     ; 024E _ 41: 5E
        ret                                             ; 0250 _ C3
; _ZN3UCI12on_hash_sizeERKNS_6OptionE End of function

?_012:  ; Local function
        mov     eax, 1                                  ; 0251 _ B8, 00000001
        add     rsp, 32                                 ; 0256 _ 48: 83. C4, 20
        pop     rbx                                     ; 025A _ 5B
        pop     rsi                                     ; 025B _ 5E
        pop     rdi                                     ; 025C _ 5F
        pop     rbp                                     ; 025D _ 5D
        pop     r12                                     ; 025E _ 41: 5C
        pop     r13                                     ; 0260 _ 41: 5D
        pop     r14                                     ; 0262 _ 41: 5E
        ret                                             ; 0264 _ C3

; Filling space: 0BH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H

ALIGN   16

_ZN3UCIlsERSoRKSt3mapISsNS_6OptionENS_19CaseInsensitiveLessESaISt4pairIKSsS2_EEE:; Function begin
        push    r13                                     ; 0270 _ 41: 55
        push    r12                                     ; 0272 _ 41: 54
        push    rbp                                     ; 0274 _ 55
        push    rdi                                     ; 0275 _ 57
        push    rsi                                     ; 0276 _ 56
        push    rbx                                     ; 0277 _ 53
        sub     rsp, 40                                 ; 0278 _ 48: 83. EC, 28
        xor     esi, esi                                ; 027C _ 31. F6
        mov     r13, qword [rdx+28H]                    ; 027E _ 4C: 8B. 6A, 28
        test    r13, r13                                ; 0282 _ 4D: 85. ED
        mov     r12, rcx                                ; 0285 _ 49: 89. CC
        mov     rbp, rdx                                ; 0288 _ 48: 89. D5
        lea     rdi, [rdx+8H]                           ; 028B _ 48: 8D. 7A, 08
        je      ?_019                                   ; 028F _ 0F 84, 000000B0
?_013:  mov     rbx, qword [rbp+18H]                    ; 0295 _ 48: 8B. 5D, 18
        cmp     rbx, rdi                                ; 0299 _ 48: 39. FB
        jnz     ?_015                                   ; 029C _ 75, 19
        jmp     ?_018                                   ; 029E _ E9, 00000095

?_014:  mov     rcx, rbx                                ; 02A3 _ 48: 89. D9
        call    _ZSt18_Rb_tree_incrementPKSt18_Rb_tree_node_base; 02A6 _ E8, 00000000(rel)
        cmp     rax, rdi                                ; 02AB _ 48: 39. F8
        mov     rbx, rax                                ; 02AE _ 48: 89. C3
        je      ?_018                                   ; 02B1 _ 0F 84, 00000081
?_015:  cmp     qword [rbx+48H], rsi                    ; 02B7 _ 48: 39. 73, 48
        jnz     ?_014                                   ; 02BB _ 75, E6
        mov     r8d, 13                                 ; 02BD _ 41: B8, 0000000D
        mov     rcx, r12                                ; 02C3 _ 4C: 89. E1
        lea     rdx, [rel ?_275]                        ; 02C6 _ 48: 8D. 15, 00000012(rel)
        call    _ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x; 02CD _ E8, 00000000(rel)
        mov     rdx, qword [rbx+20H]                    ; 02D2 _ 48: 8B. 53, 20
        mov     rcx, r12                                ; 02D6 _ 4C: 89. E1
        mov     r8, qword [rdx-18H]                     ; 02D9 _ 4C: 8B. 42, E8
        call    _ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x; 02DD _ E8, 00000000(rel)
        mov     r8d, 6                                  ; 02E2 _ 41: B8, 00000006
        lea     rdx, [rel ?_276]                        ; 02E8 _ 48: 8D. 15, 00000020(rel)
        mov     rcx, rax                                ; 02EF _ 48: 89. C1
        mov     r13, rax                                ; 02F2 _ 49: 89. C5
        call    _ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x; 02F5 _ E8, 00000000(rel)
        mov     rdx, qword [rbx+38H]                    ; 02FA _ 48: 8B. 53, 38
        mov     rcx, r13                                ; 02FE _ 4C: 89. E9
        lea     r13, [rbx+38H]                          ; 0301 _ 4C: 8D. 6B, 38
        mov     r8, qword [rdx-18H]                     ; 0305 _ 4C: 8B. 42, E8
        call    _ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x; 0309 _ E8, 00000000(rel)
        lea     rdx, [rel ?_277]                        ; 030E _ 48: 8D. 15, 00000027(rel)
        mov     rcx, r13                                ; 0315 _ 4C: 89. E9
        call    _ZNKSs7compareEPKc                      ; 0318 _ E8, 00000000(rel)
        test    eax, eax                                ; 031D _ 85. C0
        jnz     ?_021                                   ; 031F _ 75, 7F
?_016:  lea     rdx, [rel ?_272]                        ; 0321 _ 48: 8D. 15, 00000003(rel)
        mov     rcx, r13                                ; 0328 _ 4C: 89. E9
        call    _ZNKSs7compareEPKc                      ; 032B _ E8, 00000000(rel)
        test    eax, eax                                ; 0330 _ 85. C0
        jz      ?_020                                   ; 0332 _ 74, 21
?_017:  mov     r13, qword [rbp+28H]                    ; 0334 _ 4C: 8B. 6D, 28
?_018:  add     rsi, 1                                  ; 0338 _ 48: 83. C6, 01
        cmp     r13, rsi                                ; 033C _ 49: 39. F5
        ja      ?_013                                   ; 033F _ 0F 87, FFFFFF50
?_019:  mov     rax, r12                                ; 0345 _ 4C: 89. E0
        add     rsp, 40                                 ; 0348 _ 48: 83. C4, 28
        pop     rbx                                     ; 034C _ 5B
        pop     rsi                                     ; 034D _ 5E
        pop     rdi                                     ; 034E _ 5F
        pop     rbp                                     ; 034F _ 5D
        pop     r12                                     ; 0350 _ 41: 5C
        pop     r13                                     ; 0352 _ 41: 5D
        ret                                             ; 0354 _ C3

?_020:  mov     r13d, dword [rbx+44H]                   ; 0355 _ 44: 8B. 6B, 44
        mov     r8d, 5                                  ; 0359 _ 41: B8, 00000005
        mov     rcx, r12                                ; 035F _ 4C: 89. E1
        mov     ebx, dword [rbx+40H]                    ; 0362 _ 8B. 5B, 40
        lea     rdx, [rel ?_279]                        ; 0365 _ 48: 8D. 15, 00000038(rel)
        call    _ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x; 036C _ E8, 00000000(rel)
        mov     rcx, r12                                ; 0371 _ 4C: 89. E1
        mov     edx, ebx                                ; 0374 _ 89. DA
        call    _ZNSolsEi                               ; 0376 _ E8, 00000000(rel)
        mov     r8d, 5                                  ; 037B _ 41: B8, 00000005
        lea     rdx, [rel ?_280]                        ; 0381 _ 48: 8D. 15, 0000003E(rel)
        mov     rbx, rax                                ; 0388 _ 48: 89. C3
        mov     rcx, rax                                ; 038B _ 48: 89. C1
        call    _ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x; 038E _ E8, 00000000(rel)
        mov     edx, r13d                               ; 0393 _ 44: 89. EA
        mov     rcx, rbx                                ; 0396 _ 48: 89. D9
        call    _ZNSolsEi                               ; 0399 _ E8, 00000000(rel)
        jmp     ?_017                                   ; 039E _ EB, 94
; _ZN3UCIlsERSoRKSt3mapISsNS_6OptionENS_19CaseInsensitiveLessESaISt4pairIKSsS2_EEE End of function

?_021:  ; Local function
        mov     rcx, r12                                ; 03A0 _ 4C: 89. E1
        mov     r8d, 9                                  ; 03A3 _ 41: B8, 00000009
        lea     rdx, [rel ?_278]                        ; 03A9 _ 48: 8D. 15, 0000002E(rel)
        call    _ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x; 03B0 _ E8, 00000000(rel)
        mov     rdx, qword [rbx+28H]                    ; 03B5 _ 48: 8B. 53, 28
        mov     rcx, r12                                ; 03B9 _ 4C: 89. E1
        mov     r8, qword [rdx-18H]                     ; 03BC _ 4C: 8B. 42, E8
        call    _ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_x; 03C0 _ E8, 00000000(rel)
        jmp     ?_016                                   ; 03C5 _ E9, FFFFFF57

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZN3UCI6OptionC1EPKcPFvRKS0_E:; Function begin

_ZN3UCI6OptionC2EPKcPFvRKS0_E:
        push    rbp                                     ; 03D0 _ 55
        push    rdi                                     ; 03D1 _ 57
        push    rsi                                     ; 03D2 _ 56
        push    rbx                                     ; 03D3 _ 53
        sub     rsp, 56                                 ; 03D4 _ 48: 83. EC, 38
        lea     rsi, [rsp+2FH]                          ; 03D8 _ 48: 8D. 74 24, 2F
        mov     rbx, rcx                                ; 03DD _ 48: 89. CB
        mov     rdi, rdx                                ; 03E0 _ 48: 89. D7
        mov     rbp, r8                                 ; 03E3 _ 4C: 89. C5
        xor     edx, edx                                ; 03E6 _ 31. D2
        mov     r8, rsi                                 ; 03E8 _ 49: 89. F0
        xor     ecx, ecx                                ; 03EB _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 03ED _ E8, 00000000(rel)
        mov     r8, rsi                                 ; 03F2 _ 49: 89. F0
        xor     edx, edx                                ; 03F5 _ 31. D2
        xor     ecx, ecx                                ; 03F7 _ 31. C9
        mov     qword [rbx], rax                        ; 03F9 _ 48: 89. 03
        call    _ZNSs12_S_constructEycRKSaIcE           ; 03FC _ E8, 00000000(rel)
        lea     rcx, [rbx+10H]                          ; 0401 _ 48: 8D. 4B, 10
        mov     r8, rsi                                 ; 0405 _ 49: 89. F0
        mov     qword [rbx+8H], rax                     ; 0408 _ 48: 89. 43, 08
        lea     rdx, [rel ?_281]                        ; 040C _ 48: 8D. 15, 00000044(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 0413 _ E8, 00000000(rel)
        mov     rcx, rdi                                ; 0418 _ 48: 89. F9
        mov     dword [rbx+18H], 0                      ; 041B _ C7. 43, 18, 00000000
        mov     dword [rbx+1CH], 0                      ; 0422 _ C7. 43, 1C, 00000000
        mov     qword [rbx+28H], rbp                    ; 0429 _ 48: 89. 6B, 28
        call    strlen                                  ; 042D _ E8, 00000000(rel)
        lea     rcx, [rbx+8H]                           ; 0432 _ 48: 8D. 4B, 08
        mov     rdx, rdi                                ; 0436 _ 48: 89. FA
        mov     r8, rax                                 ; 0439 _ 49: 89. C0
        call    _ZNSs6assignEPKcy                       ; 043C _ E8, 00000000(rel)
        mov     rcx, rbx                                ; 0441 _ 48: 89. D9
        mov     rdx, rax                                ; 0444 _ 48: 89. C2
        call    _ZNSs6assignERKSs                       ; 0447 _ E8, 00000000(rel)
        nop                                             ; 044C _ 90
        add     rsp, 56                                 ; 044D _ 48: 83. C4, 38
        pop     rbx                                     ; 0451 _ 5B
        pop     rsi                                     ; 0452 _ 5E
        pop     rdi                                     ; 0453 _ 5F
        pop     rbp                                     ; 0454 _ 5D
        ret                                             ; 0455 _ C3
; _ZN3UCI6OptionC1EPKcPFvRKS0_E End of function

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

_ZN3UCI6OptionC1EbPFvRKS0_E:; Function begin

_ZN3UCI6OptionC2EbPFvRKS0_E:
        push    rbp                                     ; 0460 _ 55
        push    rdi                                     ; 0461 _ 57
        push    rsi                                     ; 0462 _ 56
        push    rbx                                     ; 0463 _ 53
        sub     rsp, 56                                 ; 0464 _ 48: 83. EC, 38
        lea     rsi, [rsp+2FH]                          ; 0468 _ 48: 8D. 74 24, 2F
        mov     rbx, rcx                                ; 046D _ 48: 89. CB
        mov     edi, edx                                ; 0470 _ 89. D7
        mov     rbp, r8                                 ; 0472 _ 4C: 89. C5
        xor     edx, edx                                ; 0475 _ 31. D2
        mov     r8, rsi                                 ; 0477 _ 49: 89. F0
        xor     ecx, ecx                                ; 047A _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 047C _ E8, 00000000(rel)
        mov     r8, rsi                                 ; 0481 _ 49: 89. F0
        xor     edx, edx                                ; 0484 _ 31. D2
        xor     ecx, ecx                                ; 0486 _ 31. C9
        mov     qword [rbx], rax                        ; 0488 _ 48: 89. 03
        call    _ZNSs12_S_constructEycRKSaIcE           ; 048B _ E8, 00000000(rel)
        lea     rcx, [rbx+10H]                          ; 0490 _ 48: 8D. 4B, 10
        mov     r8, rsi                                 ; 0494 _ 49: 89. F0
        mov     qword [rbx+8H], rax                     ; 0497 _ 48: 89. 43, 08
        lea     rdx, [rel ?_283]                        ; 049B _ 48: 8D. 15, 00000051(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 04A2 _ E8, 00000000(rel)
        cmp     dil, 1                                  ; 04A7 _ 40: 80. FF, 01
        mov     dword [rbx+18H], 0                      ; 04AB _ C7. 43, 18, 00000000
        lea     rax, [rel ?_274]                        ; 04B2 _ 48: 8D. 05, 0000000D(rel)
        sbb     r8, r8                                  ; 04B9 _ 4D: 19. C0
        test    dil, dil                                ; 04BC _ 40: 84. FF
        mov     qword [rbx+28H], rbp                    ; 04BF _ 48: 89. 6B, 28
        lea     rcx, [rbx+8H]                           ; 04C3 _ 48: 8D. 4B, 08
        not     r8                                      ; 04C7 _ 49: F7. D0
        mov     dword [rbx+1CH], 0                      ; 04CA _ C7. 43, 1C, 00000000
        lea     rdx, [rel ?_282]                        ; 04D1 _ 48: 8D. 15, 0000004B(rel)
        cmovne  rdx, rax                                ; 04D8 _ 48: 0F 45. D0
        add     r8, 5                                   ; 04DC _ 49: 83. C0, 05
        call    _ZNSs6assignEPKcy                       ; 04E0 _ E8, 00000000(rel)
        mov     rcx, rbx                                ; 04E5 _ 48: 89. D9
        mov     rdx, rax                                ; 04E8 _ 48: 89. C2
        call    _ZNSs6assignERKSs                       ; 04EB _ E8, 00000000(rel)
        nop                                             ; 04F0 _ 90
        add     rsp, 56                                 ; 04F1 _ 48: 83. C4, 38
        pop     rbx                                     ; 04F5 _ 5B
        pop     rsi                                     ; 04F6 _ 5E
        pop     rdi                                     ; 04F7 _ 5F
        pop     rbp                                     ; 04F8 _ 5D
        ret                                             ; 04F9 _ C3
; _ZN3UCI6OptionC1EbPFvRKS0_E End of function

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZN3UCI6OptionC1EPFvRKS0_E:; Function begin

_ZN3UCI6OptionC2EPFvRKS0_E:
        push    rdi                                     ; 0500 _ 57
        push    rsi                                     ; 0501 _ 56
        push    rbx                                     ; 0502 _ 53
        sub     rsp, 48                                 ; 0503 _ 48: 83. EC, 30
        lea     rsi, [rsp+2FH]                          ; 0507 _ 48: 8D. 74 24, 2F
        mov     rbx, rcx                                ; 050C _ 48: 89. CB
        mov     rdi, rdx                                ; 050F _ 48: 89. D7
        mov     r8, rsi                                 ; 0512 _ 49: 89. F0
        xor     edx, edx                                ; 0515 _ 31. D2
        xor     ecx, ecx                                ; 0517 _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0519 _ E8, 00000000(rel)
        mov     r8, rsi                                 ; 051E _ 49: 89. F0
        xor     edx, edx                                ; 0521 _ 31. D2
        xor     ecx, ecx                                ; 0523 _ 31. C9
        mov     qword [rbx], rax                        ; 0525 _ 48: 89. 03
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0528 _ E8, 00000000(rel)
        lea     rcx, [rbx+10H]                          ; 052D _ 48: 8D. 4B, 10
        mov     r8, rsi                                 ; 0531 _ 49: 89. F0
        mov     qword [rbx+8H], rax                     ; 0534 _ 48: 89. 43, 08
        lea     rdx, [rel ?_277]                        ; 0538 _ 48: 8D. 15, 00000027(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 053F _ E8, 00000000(rel)
        mov     dword [rbx+18H], 0                      ; 0544 _ C7. 43, 18, 00000000
        mov     dword [rbx+1CH], 0                      ; 054B _ C7. 43, 1C, 00000000
        mov     qword [rbx+28H], rdi                    ; 0552 _ 48: 89. 7B, 28
        add     rsp, 48                                 ; 0556 _ 48: 83. C4, 30
        pop     rbx                                     ; 055A _ 5B
        pop     rsi                                     ; 055B _ 5E
        pop     rdi                                     ; 055C _ 5F
        ret                                             ; 055D _ C3
; _ZN3UCI6OptionC1EPFvRKS0_E End of function

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

_ZN3UCI6OptionC1EiiiPFvRKS0_E:; Function begin

_ZN3UCI6OptionC2EiiiPFvRKS0_E:
        push    r12                                     ; 0560 _ 41: 54
        push    rbp                                     ; 0562 _ 55
        push    rdi                                     ; 0563 _ 57
        push    rsi                                     ; 0564 _ 56
        push    rbx                                     ; 0565 _ 53
        sub     rsp, 80                                 ; 0566 _ 48: 83. EC, 50
        lea     rsi, [rsp+40H]                          ; 056A _ 48: 8D. 74 24, 40
        mov     rbx, rcx                                ; 056F _ 48: 89. CB
        mov     edi, edx                                ; 0572 _ 89. D7
        mov     r12d, r8d                               ; 0574 _ 45: 89. C4
        xor     edx, edx                                ; 0577 _ 31. D2
        mov     r8, rsi                                 ; 0579 _ 49: 89. F0
        xor     ecx, ecx                                ; 057C _ 31. C9
        mov     ebp, r9d                                ; 057E _ 44: 89. CD
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0581 _ E8, 00000000(rel)
        mov     r8, rsi                                 ; 0586 _ 49: 89. F0
        xor     edx, edx                                ; 0589 _ 31. D2
        xor     ecx, ecx                                ; 058B _ 31. C9
        mov     qword [rbx], rax                        ; 058D _ 48: 89. 03
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0590 _ E8, 00000000(rel)
        lea     rcx, [rbx+10H]                          ; 0595 _ 48: 8D. 4B, 10
        mov     r8, rsi                                 ; 0599 _ 49: 89. F0
        mov     qword [rbx+8H], rax                     ; 059C _ 48: 89. 43, 08
        lea     rdx, [rel ?_272]                        ; 05A0 _ 48: 8D. 15, 00000003(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 05A7 _ E8, 00000000(rel)
        mov     rax, qword [rsp+0A0H]                   ; 05AC _ 48: 8B. 84 24, 000000A0
        mov     dword [rsp+20H], edi                    ; 05B4 _ 89. 7C 24, 20
        mov     rcx, rsi                                ; 05B8 _ 48: 89. F1
        lea     rdi, [rbx+8H]                           ; 05BB _ 48: 8D. 7B, 08
        mov     r8d, 16                                 ; 05BF _ 41: B8, 00000010
        mov     dword [rbx+18H], r12d                   ; 05C5 _ 44: 89. 63, 18
        lea     r9, [rel ?_271]                         ; 05C9 _ 4C: 8D. 0D, 00000000(rel)
        mov     dword [rbx+1CH], ebp                    ; 05D0 _ 89. 6B, 1C
        lea     rdx, [rel _ZL9vsnprintfPcyPKcS_]        ; 05D3 _ 48: 8D. 15, FFFFFA46(rel)
        mov     qword [rbx+28H], rax                    ; 05DA _ 48: 89. 43, 28
        call    _ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60; 05DE _ E8, FFFFFA4D
        mov     rdx, rsi                                ; 05E3 _ 48: 89. F2
        mov     rcx, rdi                                ; 05E6 _ 48: 89. F9
        call    _ZNSs4swapERSs                          ; 05E9 _ E8, 00000000(rel)
        mov     rcx, rbx                                ; 05EE _ 48: 89. D9
        mov     rdx, rdi                                ; 05F1 _ 48: 89. FA
        call    _ZNSs6assignERKSs                       ; 05F4 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+40H]                    ; 05F9 _ 48: 8B. 4C 24, 40
        mov     eax, 4294967295                         ; 05FE _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0603 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0608 _ 85. C0
        jle     ?_022                                   ; 060A _ 7E, 14
        add     rsp, 80                                 ; 060C _ 48: 83. C4, 50
        pop     rbx                                     ; 0610 _ 5B
        pop     rsi                                     ; 0611 _ 5E
        pop     rdi                                     ; 0612 _ 5F
        pop     rbp                                     ; 0613 _ 5D
        pop     r12                                     ; 0614 _ 41: 5C
        ret                                             ; 0616 _ C3

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_022:  lea     rdx, [rsp+3FH]                          ; 0620 _ 48: 8D. 54 24, 3F
        sub     rcx, 24                                 ; 0625 _ 48: 83. E9, 18
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 0629 _ E8, 00000000(rel)
        nop                                             ; 062E _ 90
        add     rsp, 80                                 ; 062F _ 48: 83. C4, 50
        pop     rbx                                     ; 0633 _ 5B
        pop     rsi                                     ; 0634 _ 5E
        pop     rdi                                     ; 0635 _ 5F
        pop     rbp                                     ; 0636 _ 5D
        pop     r12                                     ; 0637 _ 41: 5C
        ret                                             ; 0639 _ C3
; _ZN3UCI6OptionC1EiiiPFvRKS0_E End of function

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZNK3UCI6OptioncviEv:; Function begin
        push    rdi                                     ; 0640 _ 57
        push    rsi                                     ; 0641 _ 56
        push    rbx                                     ; 0642 _ 53
        sub     rsp, 48                                 ; 0643 _ 48: 83. EC, 30
        lea     rdx, [rel ?_272]                        ; 0647 _ 48: 8D. 15, 00000003(rel)
        mov     rbx, rcx                                ; 064E _ 48: 89. CB
        lea     rcx, [rcx+10H]                          ; 0651 _ 48: 8D. 49, 10
        call    _ZNKSs7compareEPKc                      ; 0655 _ E8, 00000000(rel)
        test    eax, eax                                ; 065A _ 85. C0
        jz      ?_023                                   ; 065C _ 74, 22
        lea     rcx, [rbx+8H]                           ; 065E _ 48: 8D. 4B, 08
        lea     rdx, [rel ?_274]                        ; 0662 _ 48: 8D. 15, 0000000D(rel)
        call    _ZNKSs7compareEPKc                      ; 0669 _ E8, 00000000(rel)
        test    eax, eax                                ; 066E _ 85. C0
        sete    al                                      ; 0670 _ 0F 94. C0
        movzx   eax, al                                 ; 0673 _ 0F B6. C0
        add     rsp, 48                                 ; 0676 _ 48: 83. C4, 30
        pop     rbx                                     ; 067A _ 5B
        pop     rsi                                     ; 067B _ 5E
        pop     rdi                                     ; 067C _ 5F
        ret                                             ; 067D _ C3

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_023:  mov     rsi, qword [rbx+8H]                     ; 0680 _ 48: 8B. 73, 08
        mov     rdi, qword [rel __imp__errno]           ; 0684 _ 48: 8B. 3D, 00000000(rel)
        call    rdi                                     ; 068B _ FF. D7
        lea     rdx, [rsp+28H]                          ; 068D _ 48: 8D. 54 24, 28
        mov     r8d, 10                                 ; 0692 _ 41: B8, 0000000A
        mov     dword [rax], 0                          ; 0698 _ C7. 00, 00000000
        mov     rcx, rsi                                ; 069E _ 48: 89. F1
        call    strtol                                  ; 06A1 _ E8, 00000000(rel)
        cmp     rsi, qword [rsp+28H]                    ; 06A6 _ 48: 3B. 74 24, 28
        mov     ebx, eax                                ; 06AB _ 89. C3
        jz      ?_025                                   ; 06AD _ 74, 1D
        call    rdi                                     ; 06AF _ FF. D7
        cmp     dword [rax], 34                         ; 06B1 _ 83. 38, 22
        jz      ?_024                                   ; 06B4 _ 74, 0A
        mov     eax, ebx                                ; 06B6 _ 89. D8
        add     rsp, 48                                 ; 06B8 _ 48: 83. C4, 30
        pop     rbx                                     ; 06BC _ 5B
        pop     rsi                                     ; 06BD _ 5E
        pop     rdi                                     ; 06BE _ 5F
        ret                                             ; 06BF _ C3

?_024:  lea     rcx, [rel ?_273]                        ; 06C0 _ 48: 8D. 0D, 00000008(rel)
        call    _ZSt20__throw_out_of_rangePKc           ; 06C7 _ E8, 00000000(rel)
?_025:  lea     rcx, [rel ?_273]                        ; 06CC _ 48: 8D. 0D, 00000008(rel)
        call    _ZSt24__throw_invalid_argumentPKc       ; 06D3 _ E8, 00000000(rel)
        nop                                             ; 06D8 _ 90
        nop                                             ; 06D9 _ 90
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZNK3UCI6OptioncvSsEv:
        push    rbx                                     ; 06E0 _ 53
        sub     rsp, 32                                 ; 06E1 _ 48: 83. EC, 20
        mov     rbx, rcx                                ; 06E5 _ 48: 89. CB
        add     rdx, 8                                  ; 06E8 _ 48: 83. C2, 08
        call    _ZNSsC1ERKSs                            ; 06EC _ E8, 00000000(rel)
        mov     rax, rbx                                ; 06F1 _ 48: 89. D8
        add     rsp, 32                                 ; 06F4 _ 48: 83. C4, 20
        pop     rbx                                     ; 06F8 _ 5B
        ret                                             ; 06F9 _ C3
; _ZNK3UCI6OptioncviEv End of function

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZN3UCI6OptionlsERKS0_:; Function begin
        push    rsi                                     ; 0700 _ 56
        push    rbx                                     ; 0701 _ 53
        sub     rsp, 40                                 ; 0702 _ 48: 83. EC, 28
        mov     rbx, rcx                                ; 0706 _ 48: 89. CB
        mov     rsi, rdx                                ; 0709 _ 48: 89. D6
        call    _ZNSs6assignERKSs                       ; 070C _ E8, 00000000(rel)
        lea     rdx, [rsi+8H]                           ; 0711 _ 48: 8D. 56, 08
        lea     rcx, [rbx+8H]                           ; 0715 _ 48: 8D. 4B, 08
        call    _ZNSs6assignERKSs                       ; 0719 _ E8, 00000000(rel)
        lea     rdx, [rsi+10H]                          ; 071E _ 48: 8D. 56, 10
        lea     rcx, [rbx+10H]                          ; 0722 _ 48: 8D. 4B, 10
        call    _ZNSs6assignERKSs                       ; 0726 _ E8, 00000000(rel)
        mov     eax, dword [rsi+18H]                    ; 072B _ 8B. 46, 18
        mov     dword [rbx+18H], eax                    ; 072E _ 89. 43, 18
        mov     eax, dword [rsi+1CH]                    ; 0731 _ 8B. 46, 1C
        mov     dword [rbx+1CH], eax                    ; 0734 _ 89. 43, 1C
        mov     rax, qword [rsi+28H]                    ; 0737 _ 48: 8B. 46, 28
        mov     qword [rbx+28H], rax                    ; 073B _ 48: 89. 43, 28
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 073F _ 48: 8B. 05, 00000030(rel)
        lea     rdx, [rax+1H]                           ; 0746 _ 48: 8D. 50, 01
        mov     qword [rbx+20H], rax                    ; 074A _ 48: 89. 43, 20
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 074E _ 48: 89. 15, 00000030(rel)
        add     rsp, 40                                 ; 0755 _ 48: 83. C4, 28
        pop     rbx                                     ; 0759 _ 5B
        pop     rsi                                     ; 075A _ 5E
        ret                                             ; 075B _ C3
; _ZN3UCI6OptionlsERKS0_ End of function

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_ZN3UCI6OptionaSERKSs:; Function begin
        push    r13                                     ; 0760 _ 41: 55
        push    r12                                     ; 0762 _ 41: 54
        push    rbp                                     ; 0764 _ 55
        push    rdi                                     ; 0765 _ 57
        push    rsi                                     ; 0766 _ 56
        push    rbx                                     ; 0767 _ 53
        sub     rsp, 56                                 ; 0768 _ 48: 83. EC, 38
        lea     rsi, [rcx+10H]                          ; 076C _ 48: 8D. 71, 10
        mov     rbx, rcx                                ; 0770 _ 48: 89. CB
        mov     rdi, rdx                                ; 0773 _ 48: 89. D7
        lea     rdx, [rel ?_277]                        ; 0776 _ 48: 8D. 15, 00000027(rel)
        mov     rcx, rsi                                ; 077D _ 48: 89. F1
        call    _ZNKSs7compareEPKc                      ; 0780 _ E8, 00000000(rel)
        test    eax, eax                                ; 0785 _ 85. C0
        jz      ?_027                                   ; 0787 _ 74, 1A
        mov     rax, qword [rdi]                        ; 0789 _ 48: 8B. 07
        cmp     qword [rax-18H], 0                      ; 078C _ 48: 83. 78, E8, 00
        jnz     ?_027                                   ; 0791 _ 75, 10
?_026:  mov     rax, rbx                                ; 0793 _ 48: 89. D8
        add     rsp, 56                                 ; 0796 _ 48: 83. C4, 38
        pop     rbx                                     ; 079A _ 5B
        pop     rsi                                     ; 079B _ 5E
        pop     rdi                                     ; 079C _ 5F
        pop     rbp                                     ; 079D _ 5D
        pop     r12                                     ; 079E _ 41: 5C
        pop     r13                                     ; 07A0 _ 41: 5D
        ret                                             ; 07A2 _ C3
; _ZN3UCI6OptionaSERKSs End of function

?_027:  ; Local function
        lea     rdx, [rel ?_283]                        ; 07A3 _ 48: 8D. 15, 00000051(rel)
        mov     rcx, rsi                                ; 07AA _ 48: 89. F1
        call    _ZNKSs7compareEPKc                      ; 07AD _ E8, 00000000(rel)
        test    eax, eax                                ; 07B2 _ 85. C0
        jnz     ?_028                                   ; 07B4 _ 75, 17
        lea     rdx, [rel ?_274]                        ; 07B6 _ 48: 8D. 15, 0000000D(rel)
        mov     rcx, rdi                                ; 07BD _ 48: 89. F9
        call    _ZNKSs7compareEPKc                      ; 07C0 _ E8, 00000000(rel)
        test    eax, eax                                ; 07C5 _ 85. C0
        jne     ?_032                                   ; 07C7 _ 0F 85, 000000D3
?_028:  lea     rdx, [rel ?_272]                        ; 07CD _ 48: 8D. 15, 00000003(rel)
        mov     rcx, rsi                                ; 07D4 _ 48: 89. F1
        call    _ZNKSs7compareEPKc                      ; 07D7 _ E8, 00000000(rel)
        test    eax, eax                                ; 07DC _ 85. C0
        jz      ?_031                                   ; 07DE _ 74, 35
?_029:  lea     rdx, [rel ?_277]                        ; 07E0 _ 48: 8D. 15, 00000027(rel)
        mov     rcx, rsi                                ; 07E7 _ 48: 89. F1
        call    _ZNKSs7compareEPKc                      ; 07EA _ E8, 00000000(rel)
        test    eax, eax                                ; 07EF _ 85. C0
        jne     ?_034                                   ; 07F1 _ 0F 85, 000000D9
?_030:  mov     rax, qword [rbx+28H]                    ; 07F7 _ 48: 8B. 43, 28
        test    rax, rax                                ; 07FB _ 48: 85. C0
        jz      ?_026                                   ; 07FE _ 74, 93
        mov     rcx, rbx                                ; 0800 _ 48: 89. D9
        call    rax                                     ; 0803 _ FF. D0
        mov     rax, rbx                                ; 0805 _ 48: 89. D8
        add     rsp, 56                                 ; 0808 _ 48: 83. C4, 38
        pop     rbx                                     ; 080C _ 5B
        pop     rsi                                     ; 080D _ 5E
        pop     rdi                                     ; 080E _ 5F
        pop     rbp                                     ; 080F _ 5D
        pop     r12                                     ; 0810 _ 41: 5C
        pop     r13                                     ; 0812 _ 41: 5D
        ret                                             ; 0814 _ C3

?_031:  mov     r12, qword [rdi]                        ; 0815 _ 4C: 8B. 27
        mov     rbp, qword [rel __imp__errno]           ; 0818 _ 48: 8B. 2D, 00000000(rel)
        call    rbp                                     ; 081F _ FF. D5
        lea     rdx, [rsp+20H]                          ; 0821 _ 48: 8D. 54 24, 20
        mov     r8d, 10                                 ; 0826 _ 41: B8, 0000000A
        mov     dword [rax], 0                          ; 082C _ C7. 00, 00000000
        mov     rcx, r12                                ; 0832 _ 4C: 89. E1
        call    strtol                                  ; 0835 _ E8, 00000000(rel)
        cmp     r12, qword [rsp+20H]                    ; 083A _ 4C: 3B. 64 24, 20
        mov     r13d, eax                               ; 083F _ 41: 89. C5
        je      ?_035                                   ; 0842 _ 0F 84, 00000099
        call    rbp                                     ; 0848 _ FF. D5
        cmp     dword [rax], 34                         ; 084A _ 83. 38, 22
        jz      ?_033                                   ; 084D _ 74, 71
        cmp     dword [rbx+18H], r13d                   ; 084F _ 44: 39. 6B, 18
        jg      ?_026                                   ; 0853 _ 0F 8F, FFFFFF3A
        mov     r12, qword [rdi]                        ; 0859 _ 4C: 8B. 27
        call    rbp                                     ; 085C _ FF. D5
        lea     rdx, [rsp+28H]                          ; 085E _ 48: 8D. 54 24, 28
        mov     r8d, 10                                 ; 0863 _ 41: B8, 0000000A
        mov     dword [rax], 0                          ; 0869 _ C7. 00, 00000000
        mov     rcx, r12                                ; 086F _ 4C: 89. E1
        call    strtol                                  ; 0872 _ E8, 00000000(rel)
        cmp     r12, qword [rsp+28H]                    ; 0877 _ 4C: 3B. 64 24, 28
        mov     r13d, eax                               ; 087C _ 41: 89. C5
        jz      ?_035                                   ; 087F _ 74, 60
        call    rbp                                     ; 0881 _ FF. D5
        cmp     dword [rax], 34                         ; 0883 _ 83. 38, 22
        jz      ?_033                                   ; 0886 _ 74, 38
        cmp     dword [rbx+1CH], r13d                   ; 0888 _ 44: 39. 6B, 1C
        jl      ?_026                                   ; 088C _ 0F 8C, FFFFFF01
        jmp     ?_029                                   ; 0892 _ E9, FFFFFF49

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_032:  lea     rdx, [rel ?_282]                        ; 08A0 _ 48: 8D. 15, 0000004B(rel)
        mov     rcx, rdi                                ; 08A7 _ 48: 89. F9
        call    _ZNKSs7compareEPKc                      ; 08AA _ E8, 00000000(rel)
        test    eax, eax                                ; 08AF _ 85. C0
        jne     ?_026                                   ; 08B1 _ 0F 85, FFFFFEDC
        jmp     ?_028                                   ; 08B7 _ E9, FFFFFF11

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_033:  lea     rcx, [rel ?_273]                        ; 08C0 _ 48: 8D. 0D, 00000008(rel)
        call    _ZSt20__throw_out_of_rangePKc           ; 08C7 _ E8, 00000000(rel)
; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_034:  lea     rcx, [rbx+8H]                           ; 08D0 _ 48: 8D. 4B, 08
        mov     rdx, rdi                                ; 08D4 _ 48: 89. FA
        call    _ZNSs6assignERKSs                       ; 08D7 _ E8, 00000000(rel)
        jmp     ?_030                                   ; 08DC _ E9, FFFFFF16

?_035:  ; Local function
        lea     rcx, [rel ?_273]                        ; 08E1 _ 48: 8D. 0D, 00000008(rel)
        call    _ZSt24__throw_invalid_argumentPKc       ; 08E8 _ E8, 00000000(rel)
        nop                                             ; 08ED _ 90
; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

_ZN3UCI4initERSt3mapISsNS_6OptionENS_19CaseInsensitiveLessESaISt4pairIKSsS1_EEE:
        push    r15                                     ; 08F0 _ 41: 57
        push    r14                                     ; 08F2 _ 41: 56
        push    r13                                     ; 08F4 _ 41: 55
        push    r12                                     ; 08F6 _ 41: 54
        push    rbp                                     ; 08F8 _ 55
        push    rdi                                     ; 08F9 _ 57
        push    rsi                                     ; 08FA _ 56
        push    rbx                                     ; 08FB _ 53
        sub     rsp, 152                                ; 08FC _ 48: 81. EC, 00000098
        xor     edx, edx                                ; 0903 _ 31. D2
        lea     rdi, [rsp+50H]                          ; 0905 _ 48: 8D. 7C 24, 50
        mov     rsi, rcx                                ; 090A _ 48: 89. CE
        xor     ecx, ecx                                ; 090D _ 31. C9
        lea     rbp, [rsp+60H]                          ; 090F _ 48: 8D. 6C 24, 60
        mov     r8, rdi                                 ; 0914 _ 49: 89. F8
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0917 _ E8, 00000000(rel)
        mov     r8, rdi                                 ; 091C _ 49: 89. F8
        xor     edx, edx                                ; 091F _ 31. D2
        xor     ecx, ecx                                ; 0921 _ 31. C9
        mov     qword [rsp+60H], rax                    ; 0923 _ 48: 89. 44 24, 60
        lea     rbx, [rbp+8H]                           ; 0928 _ 48: 8D. 5D, 08
        call    _ZNSs12_S_constructEycRKSaIcE           ; 092C _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 0931 _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 0935 _ 49: 89. F8
        lea     rdx, [rel ?_272]                        ; 0938 _ 48: 8D. 15, 00000003(rel)
        mov     qword [rsp+68H], rax                    ; 093F _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 0944 _ E8, 00000000(rel)
        lea     r9, [rel ?_271]                         ; 0949 _ 4C: 8D. 0D, 00000000(rel)
        mov     rcx, rdi                                ; 0950 _ 48: 89. F9
        mov     r8d, 16                                 ; 0953 _ 41: B8, 00000010
        mov     dword [rsp+20H], 0                      ; 0959 _ C7. 44 24, 20, 00000000
        lea     rdx, [rel _ZL9vsnprintfPcyPKcS_]        ; 0961 _ 48: 8D. 15, FFFFF6B8(rel)
        mov     dword [rsp+78H], -100                   ; 0968 _ C7. 44 24, 78, FFFFFF9C
        mov     dword [rsp+7CH], 100                    ; 0970 _ C7. 44 24, 7C, 00000064
        mov     qword [rsp+88H], 0                      ; 0978 _ 48: C7. 84 24, 00000088, 00000000
        call    _ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60; 0984 _ E8, FFFFF6A7
        mov     rdx, rdi                                ; 0989 _ 48: 89. FA
        mov     rcx, rbx                                ; 098C _ 48: 89. D9
        call    _ZNSs4swapERSs                          ; 098F _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 0994 _ 48: 89. E9
        mov     rdx, rbx                                ; 0997 _ 48: 89. DA
        call    _ZNSs6assignERKSs                       ; 099A _ E8, 00000000(rel)
        mov     rcx, qword [rsp+50H]                    ; 099F _ 48: 8B. 4C 24, 50
        mov     eax, 4294967295                         ; 09A4 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 09A9 _ F0: 0F C1. 41, F8
        lea     rbx, [rsp+40H]                          ; 09AE _ 48: 8D. 5C 24, 40
        test    eax, eax                                ; 09B3 _ 85. C0
        jle     ?_231                                   ; 09B5 _ 0F 8E, 00002129
?_036:  lea     r14, [rsp+3EH]                          ; 09BB _ 4C: 8D. 74 24, 3E
        mov     rcx, rbx                                ; 09C0 _ 48: 89. D9
        lea     rdx, [rel ?_284]                        ; 09C3 _ 48: 8D. 15, 00000057(rel)
        mov     r8, r14                                 ; 09CA _ 4D: 89. F0
        call    _ZNSsC1EPKcRKSaIcE                      ; 09CD _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 09D2 _ 4C: 8B. 66, 10
        lea     r13, [rsi+8H]                           ; 09D6 _ 4C: 8D. 6E, 08
        mov     r15, r13                                ; 09DA _ 4D: 89. EF
        test    r12, r12                                ; 09DD _ 4D: 85. E4
        jnz     ?_038                                   ; 09E0 _ 75, 1B
        jmp     ?_175                                   ; 09E2 _ E9, 00001B1C

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_037:  mov     r15, r12                                ; 09F0 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 09F3 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 09F8 _ 4D: 85. E4
        jz      ?_039                                   ; 09FB _ 74, 1E
?_038:  lea     rdx, [r12+20H]                          ; 09FD _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 0A02 _ 49: 89. D8
        mov     rcx, rsi                                ; 0A05 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 0A08 _ E8, FFFFF7C3
        test    al, al                                  ; 0A0D _ 84. C0
        jz      ?_037                                   ; 0A0F _ 74, DF
        mov     r12, qword [r12+18H]                    ; 0A11 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 0A16 _ 4D: 85. E4
        jnz     ?_038                                   ; 0A19 _ 75, E2
?_039:  cmp     r13, r15                                ; 0A1B _ 4D: 39. FD
        je      ?_175                                   ; 0A1E _ 0F 84, 00001ADF
        lea     r8, [r15+20H]                           ; 0A24 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 0A28 _ 48: 89. DA
        mov     rcx, rdi                                ; 0A2B _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 0A2E _ E8, FFFFF79D
        test    al, al                                  ; 0A33 _ 84. C0
        jne     ?_175                                   ; 0A35 _ 0F 85, 00001AC8
?_040:  lea     rcx, [r15+28H]                          ; 0A3B _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 0A3F _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 0A42 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 0A47 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 0A4B _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 0A4F _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 0A54 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 0A58 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 0A5C _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 0A61 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 0A65 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 0A69 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 0A6D _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 0A71 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 0A79 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 0A7D _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 0A84 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 0A89 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 0A8D _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 0A91 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 0A96 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 0A9D _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0AA2 _ 85. C0
        jle     ?_248                                   ; 0AA4 _ 0F 8E, 00002179
?_041:  mov     rcx, qword [rsp+70H]                    ; 0AAA _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 0AAF _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0AB4 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0AB9 _ 85. C0
        jle     ?_249                                   ; 0ABB _ 0F 8E, 00002173
?_042:  mov     rcx, qword [rsp+68H]                    ; 0AC1 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 0AC6 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0ACB _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0AD0 _ 85. C0
        jle     ?_250                                   ; 0AD2 _ 0F 8E, 0000216D
?_043:  mov     rcx, qword [rsp+60H]                    ; 0AD8 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 0ADD _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0AE2 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0AE7 _ 85. C0
        jle     ?_251                                   ; 0AE9 _ 0F 8E, 00002171
?_044:  mov     r8, rdi                                 ; 0AEF _ 49: 89. F8
        xor     edx, edx                                ; 0AF2 _ 31. D2
        xor     ecx, ecx                                ; 0AF4 _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0AF6 _ E8, 00000000(rel)
        mov     r8, rdi                                 ; 0AFB _ 49: 89. F8
        xor     edx, edx                                ; 0AFE _ 31. D2
        xor     ecx, ecx                                ; 0B00 _ 31. C9
        mov     qword [rsp+60H], rax                    ; 0B02 _ 48: 89. 44 24, 60
        lea     r12, [rbp+8H]                           ; 0B07 _ 4C: 8D. 65, 08
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0B0B _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 0B10 _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 0B14 _ 49: 89. F8
        lea     rdx, [rel ?_272]                        ; 0B17 _ 48: 8D. 15, 00000003(rel)
        mov     qword [rsp+68H], rax                    ; 0B1E _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 0B23 _ E8, 00000000(rel)
        lea     rax, [rel _ZN3UCI10on_threadsERKNS_6OptionE]; 0B28 _ 48: 8D. 05, FFFFF4E1(rel)
        mov     r8d, 16                                 ; 0B2F _ 41: B8, 00000010
        mov     rcx, rdi                                ; 0B35 _ 48: 89. F9
        lea     r9, [rel ?_271]                         ; 0B38 _ 4C: 8D. 0D, 00000000(rel)
        mov     dword [rsp+20H], 1                      ; 0B3F _ C7. 44 24, 20, 00000001
        lea     rdx, [rel _ZL9vsnprintfPcyPKcS_]        ; 0B47 _ 48: 8D. 15, FFFFF4D2(rel)
        mov     qword [rsp+88H], rax                    ; 0B4E _ 48: 89. 84 24, 00000088
        mov     dword [rsp+78H], 1                      ; 0B56 _ C7. 44 24, 78, 00000001
        mov     dword [rsp+7CH], 128                    ; 0B5E _ C7. 44 24, 7C, 00000080
        call    _ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60; 0B66 _ E8, FFFFF4C5
        mov     rdx, rdi                                ; 0B6B _ 48: 89. FA
        mov     rcx, r12                                ; 0B6E _ 4C: 89. E1
        call    _ZNSs4swapERSs                          ; 0B71 _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 0B76 _ 48: 89. E9
        mov     rdx, r12                                ; 0B79 _ 4C: 89. E2
        call    _ZNSs6assignERKSs                       ; 0B7C _ E8, 00000000(rel)
        mov     rcx, qword [rsp+50H]                    ; 0B81 _ 48: 8B. 4C 24, 50
        mov     eax, 4294967295                         ; 0B86 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0B8B _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0B90 _ 85. C0
        jle     ?_191                                   ; 0B92 _ 0F 8E, 00001C68
?_045:  mov     r8, r14                                 ; 0B98 _ 4D: 89. F0
        mov     rcx, rbx                                ; 0B9B _ 48: 89. D9
        mov     r15, r13                                ; 0B9E _ 4D: 89. EF
        lea     rdx, [rel ?_285]                        ; 0BA1 _ 48: 8D. 15, 00000060(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 0BA8 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 0BAD _ 4C: 8B. 66, 10
        test    r12, r12                                ; 0BB1 _ 4D: 85. E4
        jnz     ?_047                                   ; 0BB4 _ 75, 17
        jmp     ?_190                                   ; 0BB6 _ E9, 00001C15

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_046:  mov     r15, r12                                ; 0BC0 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 0BC3 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 0BC8 _ 4D: 85. E4
        jz      ?_048                                   ; 0BCB _ 74, 1E
?_047:  lea     rdx, [r12+20H]                          ; 0BCD _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 0BD2 _ 49: 89. D8
        mov     rcx, rsi                                ; 0BD5 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 0BD8 _ E8, FFFFF5F3
        test    al, al                                  ; 0BDD _ 84. C0
        jz      ?_046                                   ; 0BDF _ 74, DF
        mov     r12, qword [r12+18H]                    ; 0BE1 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 0BE6 _ 4D: 85. E4
        jnz     ?_047                                   ; 0BE9 _ 75, E2
?_048:  cmp     r13, r15                                ; 0BEB _ 4D: 39. FD
        je      ?_190                                   ; 0BEE _ 0F 84, 00001BDC
        lea     r8, [r15+20H]                           ; 0BF4 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 0BF8 _ 48: 89. DA
        mov     rcx, rdi                                ; 0BFB _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 0BFE _ E8, FFFFF5CD
        test    al, al                                  ; 0C03 _ 84. C0
        jne     ?_190                                   ; 0C05 _ 0F 85, 00001BC5
?_049:  lea     rcx, [r15+28H]                          ; 0C0B _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 0C0F _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 0C12 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 0C17 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 0C1B _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 0C1F _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 0C24 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 0C28 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 0C2C _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 0C31 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 0C35 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 0C39 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 0C3D _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 0C41 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 0C49 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 0C4D _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 0C54 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 0C59 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 0C5D _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 0C61 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 0C66 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 0C6D _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0C72 _ 85. C0
        jle     ?_264                                   ; 0C74 _ 0F 8E, 000020D7
?_050:  mov     rcx, qword [rsp+70H]                    ; 0C7A _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 0C7F _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0C84 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0C89 _ 85. C0
        jle     ?_265                                   ; 0C8B _ 0F 8E, 000020D1
?_051:  mov     rcx, qword [rsp+68H]                    ; 0C91 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 0C96 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0C9B _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0CA0 _ 85. C0
        jle     ?_244                                   ; 0CA2 _ 0F 8E, 00001F2D
?_052:  mov     rcx, qword [rsp+60H]                    ; 0CA8 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 0CAD _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0CB2 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0CB7 _ 85. C0
        jle     ?_245                                   ; 0CB9 _ 0F 8E, 00001F31
?_053:  mov     r8, rdi                                 ; 0CBF _ 49: 89. F8
        xor     edx, edx                                ; 0CC2 _ 31. D2
        xor     ecx, ecx                                ; 0CC4 _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0CC6 _ E8, 00000000(rel)
        mov     r8, rdi                                 ; 0CCB _ 49: 89. F8
        xor     edx, edx                                ; 0CCE _ 31. D2
        xor     ecx, ecx                                ; 0CD0 _ 31. C9
        mov     qword [rsp+60H], rax                    ; 0CD2 _ 48: 89. 44 24, 60
        lea     r12, [rbp+8H]                           ; 0CD7 _ 4C: 8D. 65, 08
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0CDB _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 0CE0 _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 0CE4 _ 49: 89. F8
        lea     rdx, [rel ?_272]                        ; 0CE7 _ 48: 8D. 15, 00000003(rel)
        mov     qword [rsp+68H], rax                    ; 0CEE _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 0CF3 _ E8, 00000000(rel)
        lea     rax, [rel _ZN3UCI12on_hash_sizeERKNS_6OptionE]; 0CF8 _ 48: 8D. 05, FFFFF421(rel)
        mov     r8d, 16                                 ; 0CFF _ 41: B8, 00000010
        mov     rcx, rdi                                ; 0D05 _ 48: 89. F9
        lea     r9, [rel ?_271]                         ; 0D08 _ 4C: 8D. 0D, 00000000(rel)
        mov     dword [rsp+20H], 16                     ; 0D0F _ C7. 44 24, 20, 00000010
        lea     rdx, [rel _ZL9vsnprintfPcyPKcS_]        ; 0D17 _ 48: 8D. 15, FFFFF302(rel)
        mov     qword [rsp+88H], rax                    ; 0D1E _ 48: 89. 84 24, 00000088
        mov     dword [rsp+78H], 1                      ; 0D26 _ C7. 44 24, 78, 00000001
        mov     dword [rsp+7CH], 1048576                ; 0D2E _ C7. 44 24, 7C, 00100000
        call    _ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60; 0D36 _ E8, FFFFF2F5
        mov     rdx, rdi                                ; 0D3B _ 48: 89. FA
        mov     rcx, r12                                ; 0D3E _ 4C: 89. E1
        call    _ZNSs4swapERSs                          ; 0D41 _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 0D46 _ 48: 89. E9
        mov     rdx, r12                                ; 0D49 _ 4C: 89. E2
        call    _ZNSs6assignERKSs                       ; 0D4C _ E8, 00000000(rel)
        mov     rcx, qword [rsp+50H]                    ; 0D51 _ 48: 8B. 4C 24, 50
        mov     eax, 4294967295                         ; 0D56 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0D5B _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0D60 _ 85. C0
        jle     ?_246                                   ; 0D62 _ 0F 8E, 00001E99
?_054:  mov     r8, r14                                 ; 0D68 _ 4D: 89. F0
        mov     rcx, rbx                                ; 0D6B _ 48: 89. D9
        mov     r15, r13                                ; 0D6E _ 4D: 89. EF
        lea     rdx, [rel ?_286]                        ; 0D71 _ 48: 8D. 15, 00000068(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 0D78 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 0D7D _ 4C: 8B. 66, 10
        test    r12, r12                                ; 0D81 _ 4D: 85. E4
        jnz     ?_056                                   ; 0D84 _ 75, 17
        jmp     ?_189                                   ; 0D86 _ E9, 00001A15

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_055:  mov     r15, r12                                ; 0D90 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 0D93 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 0D98 _ 4D: 85. E4
        jz      ?_057                                   ; 0D9B _ 74, 1E
?_056:  lea     rdx, [r12+20H]                          ; 0D9D _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 0DA2 _ 49: 89. D8
        mov     rcx, rsi                                ; 0DA5 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 0DA8 _ E8, FFFFF423
        test    al, al                                  ; 0DAD _ 84. C0
        jz      ?_055                                   ; 0DAF _ 74, DF
        mov     r12, qword [r12+18H]                    ; 0DB1 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 0DB6 _ 4D: 85. E4
        jnz     ?_056                                   ; 0DB9 _ 75, E2
?_057:  cmp     r13, r15                                ; 0DBB _ 4D: 39. FD
        je      ?_189                                   ; 0DBE _ 0F 84, 000019DC
        lea     r8, [r15+20H]                           ; 0DC4 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 0DC8 _ 48: 89. DA
        mov     rcx, rdi                                ; 0DCB _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 0DCE _ E8, FFFFF3FD
        test    al, al                                  ; 0DD3 _ 84. C0
        jne     ?_189                                   ; 0DD5 _ 0F 85, 000019C5
?_058:  lea     rcx, [r15+28H]                          ; 0DDB _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 0DDF _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 0DE2 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 0DE7 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 0DEB _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 0DEF _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 0DF4 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 0DF8 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 0DFC _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 0E01 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 0E05 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 0E09 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 0E0D _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 0E11 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 0E19 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 0E1D _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 0E24 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 0E29 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 0E2D _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 0E31 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 0E36 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 0E3D _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0E42 _ 85. C0
        jle     ?_240                                   ; 0E44 _ 0F 8E, 00001D47
?_059:  mov     rcx, qword [rsp+70H]                    ; 0E4A _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 0E4F _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0E54 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0E59 _ 85. C0
        jle     ?_241                                   ; 0E5B _ 0F 8E, 00001D41
?_060:  mov     rcx, qword [rsp+68H]                    ; 0E61 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 0E66 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0E6B _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0E70 _ 85. C0
        jle     ?_242                                   ; 0E72 _ 0F 8E, 00001D3B
?_061:  mov     rcx, qword [rsp+60H]                    ; 0E78 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 0E7D _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0E82 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0E87 _ 85. C0
        jle     ?_243                                   ; 0E89 _ 0F 8E, 00001D35
?_062:  xor     edx, edx                                ; 0E8F _ 31. D2
        xor     ecx, ecx                                ; 0E91 _ 31. C9
        mov     r8, rdi                                 ; 0E93 _ 49: 89. F8
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0E96 _ E8, 00000000(rel)
        xor     edx, edx                                ; 0E9B _ 31. D2
        xor     ecx, ecx                                ; 0E9D _ 31. C9
        mov     r8, rdi                                 ; 0E9F _ 49: 89. F8
        mov     qword [rsp+60H], rax                    ; 0EA2 _ 48: 89. 44 24, 60
        mov     r15, r13                                ; 0EA7 _ 4D: 89. EF
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0EAA _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 0EAF _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 0EB3 _ 49: 89. F8
        lea     rdx, [rel ?_277]                        ; 0EB6 _ 48: 8D. 15, 00000027(rel)
        mov     qword [rsp+68H], rax                    ; 0EBD _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 0EC2 _ E8, 00000000(rel)
        lea     rax, [rel _ZN3UCI13on_clear_hashERKNS_6OptionE]; 0EC7 _ 48: 8D. 05, FFFFF132(rel)
        mov     r8, r14                                 ; 0ECE _ 4D: 89. F0
        mov     rcx, rbx                                ; 0ED1 _ 48: 89. D9
        lea     rdx, [rel ?_287]                        ; 0ED4 _ 48: 8D. 15, 0000006D(rel)
        mov     dword [rsp+78H], 0                      ; 0EDB _ C7. 44 24, 78, 00000000
        mov     dword [rsp+7CH], 0                      ; 0EE3 _ C7. 44 24, 7C, 00000000
        mov     qword [rsp+88H], rax                    ; 0EEB _ 48: 89. 84 24, 00000088
        call    _ZNSsC1EPKcRKSaIcE                      ; 0EF3 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 0EF8 _ 4C: 8B. 66, 10
        test    r12, r12                                ; 0EFC _ 4D: 85. E4
        jnz     ?_064                                   ; 0EFF _ 75, 1C
        jmp     ?_188                                   ; 0F01 _ E9, 0000186A

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_063:  mov     r15, r12                                ; 0F10 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 0F13 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 0F18 _ 4D: 85. E4
        jz      ?_065                                   ; 0F1B _ 74, 1E
?_064:  lea     rdx, [r12+20H]                          ; 0F1D _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 0F22 _ 49: 89. D8
        mov     rcx, rsi                                ; 0F25 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 0F28 _ E8, FFFFF2A3
        test    al, al                                  ; 0F2D _ 84. C0
        jz      ?_063                                   ; 0F2F _ 74, DF
        mov     r12, qword [r12+18H]                    ; 0F31 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 0F36 _ 4D: 85. E4
        jnz     ?_064                                   ; 0F39 _ 75, E2
?_065:  cmp     r13, r15                                ; 0F3B _ 4D: 39. FD
        je      ?_188                                   ; 0F3E _ 0F 84, 0000182C
        lea     r8, [r15+20H]                           ; 0F44 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 0F48 _ 48: 89. DA
        mov     rcx, rdi                                ; 0F4B _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 0F4E _ E8, FFFFF27D
        test    al, al                                  ; 0F53 _ 84. C0
        jne     ?_188                                   ; 0F55 _ 0F 85, 00001815
?_066:  lea     rcx, [r15+28H]                          ; 0F5B _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 0F5F _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 0F62 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 0F67 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 0F6B _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 0F6F _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 0F74 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 0F78 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 0F7C _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 0F81 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 0F85 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 0F89 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 0F8D _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 0F91 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 0F99 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 0F9D _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 0FA4 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 0FA9 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 0FAD _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 0FB1 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 0FB6 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 0FBD _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0FC2 _ 85. C0
        jle     ?_247                                   ; 0FC4 _ 0F 8E, 00001C48
?_067:  mov     rcx, qword [rsp+70H]                    ; 0FCA _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 0FCF _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0FD4 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0FD9 _ 85. C0
        jle     ?_260                                   ; 0FDB _ 0F 8E, 00001D22
?_068:  mov     rcx, qword [rsp+68H]                    ; 0FE1 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 0FE6 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0FEB _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0FF0 _ 85. C0
        jle     ?_261                                   ; 0FF2 _ 0F 8E, 00001D1C
?_069:  mov     rcx, qword [rsp+60H]                    ; 0FF8 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 0FFD _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1002 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1007 _ 85. C0
        jle     ?_258                                   ; 1009 _ 0F 8E, 00001CD2
?_070:  xor     edx, edx                                ; 100F _ 31. D2
        xor     ecx, ecx                                ; 1011 _ 31. C9
        mov     r8, rdi                                 ; 1013 _ 49: 89. F8
        call    _ZNSs12_S_constructEycRKSaIcE           ; 1016 _ E8, 00000000(rel)
        xor     edx, edx                                ; 101B _ 31. D2
        xor     ecx, ecx                                ; 101D _ 31. C9
        mov     r8, rdi                                 ; 101F _ 49: 89. F8
        mov     qword [rsp+60H], rax                    ; 1022 _ 48: 89. 44 24, 60
        mov     r15, r13                                ; 1027 _ 4D: 89. EF
        call    _ZNSs12_S_constructEycRKSaIcE           ; 102A _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 102F _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 1033 _ 49: 89. F8
        lea     rdx, [rel ?_283]                        ; 1036 _ 48: 8D. 15, 00000051(rel)
        mov     qword [rsp+68H], rax                    ; 103D _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 1042 _ E8, 00000000(rel)
        lea     rcx, [rbp+8H]                           ; 1047 _ 48: 8D. 4D, 08
        mov     r8d, 4                                  ; 104B _ 41: B8, 00000004
        mov     dword [rsp+78H], 0                      ; 1051 _ C7. 44 24, 78, 00000000
        lea     rdx, [rel ?_274]                        ; 1059 _ 48: 8D. 15, 0000000D(rel)
        mov     dword [rsp+7CH], 0                      ; 1060 _ C7. 44 24, 7C, 00000000
        mov     qword [rsp+88H], 0                      ; 1068 _ 48: C7. 84 24, 00000088, 00000000
        call    _ZNSs6assignEPKcy                       ; 1074 _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 1079 _ 48: 89. E9
        mov     rdx, rax                                ; 107C _ 48: 89. C2
        call    _ZNSs6assignERKSs                       ; 107F _ E8, 00000000(rel)
        mov     r8, r14                                 ; 1084 _ 4D: 89. F0
        mov     rcx, rbx                                ; 1087 _ 48: 89. D9
        lea     rdx, [rel ?_288]                        ; 108A _ 48: 8D. 15, 00000078(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 1091 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 1096 _ 4C: 8B. 66, 10
        test    r12, r12                                ; 109A _ 4D: 85. E4
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_072                                   ; 109D _ 0F 85, 0000001A
        jmp     ?_187                                   ; 10A3 _ E9, 00001698

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_071:  mov     r15, r12                                ; 10B0 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 10B3 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 10B8 _ 4D: 85. E4
        jz      ?_073                                   ; 10BB _ 74, 1E
?_072:  lea     rdx, [r12+20H]                          ; 10BD _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 10C2 _ 49: 89. D8
        mov     rcx, rsi                                ; 10C5 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 10C8 _ E8, FFFFF103
        test    al, al                                  ; 10CD _ 84. C0
        jz      ?_071                                   ; 10CF _ 74, DF
        mov     r12, qword [r12+18H]                    ; 10D1 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 10D6 _ 4D: 85. E4
        jnz     ?_072                                   ; 10D9 _ 75, E2
?_073:  cmp     r13, r15                                ; 10DB _ 4D: 39. FD
        je      ?_187                                   ; 10DE _ 0F 84, 0000165C
        lea     r8, [r15+20H]                           ; 10E4 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 10E8 _ 48: 89. DA
        mov     rcx, rdi                                ; 10EB _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 10EE _ E8, FFFFF0DD
        test    al, al                                  ; 10F3 _ 84. C0
        jne     ?_187                                   ; 10F5 _ 0F 85, 00001645
?_074:  lea     rcx, [r15+28H]                          ; 10FB _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 10FF _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 1102 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 1107 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 110B _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 110F _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 1114 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 1118 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 111C _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 1121 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 1125 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 1129 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 112D _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 1131 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 1139 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 113D _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 1144 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 1149 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 114D _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 1151 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 1156 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 115D _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1162 _ 85. C0
        jle     ?_256                                   ; 1164 _ 0F 8E, 00001B4B
?_075:  mov     rcx, qword [rsp+70H]                    ; 116A _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 116F _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1174 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1179 _ 85. C0
        jle     ?_257                                   ; 117B _ 0F 8E, 00001B4F
?_076:  mov     rcx, qword [rsp+68H]                    ; 1181 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 1186 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 118B _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1190 _ 85. C0
        jle     ?_262                                   ; 1192 _ 0F 8E, 00001B8D
?_077:  mov     rcx, qword [rsp+60H]                    ; 1198 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 119D _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 11A2 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 11A7 _ 85. C0
        jle     ?_263                                   ; 11A9 _ 0F 8E, 00001B91
?_078:  mov     r8, rdi                                 ; 11AF _ 49: 89. F8
        xor     edx, edx                                ; 11B2 _ 31. D2
        xor     ecx, ecx                                ; 11B4 _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 11B6 _ E8, 00000000(rel)
        mov     r8, rdi                                 ; 11BB _ 49: 89. F8
        xor     edx, edx                                ; 11BE _ 31. D2
        xor     ecx, ecx                                ; 11C0 _ 31. C9
        mov     qword [rsp+60H], rax                    ; 11C2 _ 48: 89. 44 24, 60
        lea     r12, [rbp+8H]                           ; 11C7 _ 4C: 8D. 65, 08
        call    _ZNSs12_S_constructEycRKSaIcE           ; 11CB _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 11D0 _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 11D4 _ 49: 89. F8
        lea     rdx, [rel ?_272]                        ; 11D7 _ 48: 8D. 15, 00000003(rel)
        mov     qword [rsp+68H], rax                    ; 11DE _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 11E3 _ E8, 00000000(rel)
        lea     r9, [rel ?_271]                         ; 11E8 _ 4C: 8D. 0D, 00000000(rel)
        mov     rcx, rdi                                ; 11EF _ 48: 89. F9
        mov     r8d, 16                                 ; 11F2 _ 41: B8, 00000010
        mov     dword [rsp+20H], 1                      ; 11F8 _ C7. 44 24, 20, 00000001
        lea     rdx, [rel _ZL9vsnprintfPcyPKcS_]        ; 1200 _ 48: 8D. 15, FFFFEE19(rel)
        mov     dword [rsp+78H], 1                      ; 1207 _ C7. 44 24, 78, 00000001
        mov     dword [rsp+7CH], 500                    ; 120F _ C7. 44 24, 7C, 000001F4
        mov     qword [rsp+88H], 0                      ; 1217 _ 48: C7. 84 24, 00000088, 00000000
        call    _ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60; 1223 _ E8, FFFFEE08
        mov     rdx, rdi                                ; 1228 _ 48: 89. FA
        mov     rcx, r12                                ; 122B _ 4C: 89. E1
        call    _ZNSs4swapERSs                          ; 122E _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 1233 _ 48: 89. E9
        mov     rdx, r12                                ; 1236 _ 4C: 89. E2
        call    _ZNSs6assignERKSs                       ; 1239 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+50H]                    ; 123E _ 48: 8B. 4C 24, 50
        mov     eax, 4294967295                         ; 1243 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1248 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 124D _ 85. C0
        jle     ?_259                                   ; 124F _ 0F 8E, 00001A9D
?_079:  mov     r8, r14                                 ; 1255 _ 4D: 89. F0
        mov     rcx, rbx                                ; 1258 _ 48: 89. D9
        mov     r15, r13                                ; 125B _ 4D: 89. EF
        lea     rdx, [rel ?_289]                        ; 125E _ 48: 8D. 15, 0000007F(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 1265 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 126A _ 4C: 8B. 66, 10
        test    r12, r12                                ; 126E _ 4D: 85. E4
        jnz     ?_081                                   ; 1271 _ 75, 1A
        jmp     ?_186                                   ; 1273 _ E9, 00001498

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_080:  mov     r15, r12                                ; 1280 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 1283 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 1288 _ 4D: 85. E4
        jz      ?_082                                   ; 128B _ 74, 1E
?_081:  lea     rdx, [r12+20H]                          ; 128D _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 1292 _ 49: 89. D8
        mov     rcx, rsi                                ; 1295 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 1298 _ E8, FFFFEF33
        test    al, al                                  ; 129D _ 84. C0
        jz      ?_080                                   ; 129F _ 74, DF
        mov     r12, qword [r12+18H]                    ; 12A1 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 12A6 _ 4D: 85. E4
        jnz     ?_081                                   ; 12A9 _ 75, E2
?_082:  cmp     r13, r15                                ; 12AB _ 4D: 39. FD
        je      ?_186                                   ; 12AE _ 0F 84, 0000145C
        lea     r8, [r15+20H]                           ; 12B4 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 12B8 _ 48: 89. DA
        mov     rcx, rdi                                ; 12BB _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 12BE _ E8, FFFFEF0D
        test    al, al                                  ; 12C3 _ 84. C0
        jne     ?_186                                   ; 12C5 _ 0F 85, 00001445
?_083:  lea     rcx, [r15+28H]                          ; 12CB _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 12CF _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 12D2 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 12D7 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 12DB _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 12DF _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 12E4 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 12E8 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 12EC _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 12F1 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 12F5 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 12F9 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 12FD _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 1301 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 1309 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 130D _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 1314 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 1319 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 131D _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 1321 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 1326 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 132D _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1332 _ 85. C0
        jle     ?_252                                   ; 1334 _ 0F 8E, 00001937
?_084:  mov     rcx, qword [rsp+70H]                    ; 133A _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 133F _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1344 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1349 _ 85. C0
        jle     ?_253                                   ; 134B _ 0F 8E, 00001931
?_085:  mov     rcx, qword [rsp+68H]                    ; 1351 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 1356 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 135B _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1360 _ 85. C0
        jle     ?_254                                   ; 1362 _ 0F 8E, 0000192B
?_086:  mov     rcx, qword [rsp+60H]                    ; 1368 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 136D _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1372 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1377 _ 85. C0
        jle     ?_255                                   ; 1379 _ 0F 8E, 00001925
?_087:  mov     r8, rdi                                 ; 137F _ 49: 89. F8
        xor     edx, edx                                ; 1382 _ 31. D2
        xor     ecx, ecx                                ; 1384 _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 1386 _ E8, 00000000(rel)
        mov     r8, rdi                                 ; 138B _ 49: 89. F8
        xor     edx, edx                                ; 138E _ 31. D2
        xor     ecx, ecx                                ; 1390 _ 31. C9
        mov     qword [rsp+60H], rax                    ; 1392 _ 48: 89. 44 24, 60
        lea     r12, [rbp+8H]                           ; 1397 _ 4C: 8D. 65, 08
        call    _ZNSs12_S_constructEycRKSaIcE           ; 139B _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 13A0 _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 13A4 _ 49: 89. F8
        lea     rdx, [rel ?_272]                        ; 13A7 _ 48: 8D. 15, 00000003(rel)
        mov     qword [rsp+68H], rax                    ; 13AE _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 13B3 _ E8, 00000000(rel)
        lea     r9, [rel ?_271]                         ; 13B8 _ 4C: 8D. 0D, 00000000(rel)
        mov     rcx, rdi                                ; 13BF _ 48: 89. F9
        mov     r8d, 16                                 ; 13C2 _ 41: B8, 00000010
        mov     dword [rsp+20H], 20                     ; 13C8 _ C7. 44 24, 20, 00000014
        lea     rdx, [rel _ZL9vsnprintfPcyPKcS_]        ; 13D0 _ 48: 8D. 15, FFFFEC49(rel)
        mov     dword [rsp+78H], 0                      ; 13D7 _ C7. 44 24, 78, 00000000
        mov     dword [rsp+7CH], 20                     ; 13DF _ C7. 44 24, 7C, 00000014
        mov     qword [rsp+88H], 0                      ; 13E7 _ 48: C7. 84 24, 00000088, 00000000
        call    _ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60; 13F3 _ E8, FFFFEC38
        mov     rdx, rdi                                ; 13F8 _ 48: 89. FA
        mov     rcx, r12                                ; 13FB _ 4C: 89. E1
        call    _ZNSs4swapERSs                          ; 13FE _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 1403 _ 48: 89. E9
        mov     rdx, r12                                ; 1406 _ 4C: 89. E2
        call    _ZNSs6assignERKSs                       ; 1409 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+50H]                    ; 140E _ 48: 8B. 4C 24, 50
        mov     eax, 4294967295                         ; 1413 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1418 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 141D _ 85. C0
        jle     ?_222                                   ; 141F _ 0F 8E, 0000161C
?_088:  mov     r8, r14                                 ; 1425 _ 4D: 89. F0
        mov     rcx, rbx                                ; 1428 _ 48: 89. D9
        mov     r15, r13                                ; 142B _ 4D: 89. EF
        lea     rdx, [rel ?_290]                        ; 142E _ 48: 8D. 15, 00000087(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 1435 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 143A _ 4C: 8B. 66, 10
        test    r12, r12                                ; 143E _ 4D: 85. E4
        jnz     ?_090                                   ; 1441 _ 75, 1A
        jmp     ?_185                                   ; 1443 _ E9, 00001298

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_089:  mov     r15, r12                                ; 1450 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 1453 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 1458 _ 4D: 85. E4
        jz      ?_091                                   ; 145B _ 74, 1E
?_090:  lea     rdx, [r12+20H]                          ; 145D _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 1462 _ 49: 89. D8
        mov     rcx, rsi                                ; 1465 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 1468 _ E8, FFFFED63
        test    al, al                                  ; 146D _ 84. C0
        jz      ?_089                                   ; 146F _ 74, DF
        mov     r12, qword [r12+18H]                    ; 1471 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 1476 _ 4D: 85. E4
        jnz     ?_090                                   ; 1479 _ 75, E2
?_091:  cmp     r13, r15                                ; 147B _ 4D: 39. FD
        je      ?_185                                   ; 147E _ 0F 84, 0000125C
        lea     r8, [r15+20H]                           ; 1484 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 1488 _ 48: 89. DA
        mov     rcx, rdi                                ; 148B _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 148E _ E8, FFFFED3D
        test    al, al                                  ; 1493 _ 84. C0
        jne     ?_185                                   ; 1495 _ 0F 85, 00001245
?_092:  lea     rcx, [r15+28H]                          ; 149B _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 149F _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 14A2 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 14A7 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 14AB _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 14AF _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 14B4 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 14B8 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 14BC _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 14C1 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 14C5 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 14C9 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 14CD _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 14D1 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 14D9 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 14DD _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 14E4 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 14E9 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 14ED _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 14F1 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 14F6 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 14FD _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1502 _ 85. C0
        jle     ?_220                                   ; 1504 _ 0F 8E, 0000150B
?_093:  mov     rcx, qword [rsp+70H]                    ; 150A _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 150F _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1514 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1519 _ 85. C0
        jle     ?_221                                   ; 151B _ 0F 8E, 0000150F
?_094:  mov     rcx, qword [rsp+68H]                    ; 1521 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 1526 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 152B _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1530 _ 85. C0
        jle     ?_216                                   ; 1532 _ 0F 8E, 00001499
?_095:  mov     rcx, qword [rsp+60H]                    ; 1538 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 153D _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1542 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1547 _ 85. C0
        jle     ?_217                                   ; 1549 _ 0F 8E, 00001493
?_096:  mov     r8, rdi                                 ; 154F _ 49: 89. F8
        xor     edx, edx                                ; 1552 _ 31. D2
        xor     ecx, ecx                                ; 1554 _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 1556 _ E8, 00000000(rel)
        mov     r8, rdi                                 ; 155B _ 49: 89. F8
        xor     edx, edx                                ; 155E _ 31. D2
        xor     ecx, ecx                                ; 1560 _ 31. C9
        mov     qword [rsp+60H], rax                    ; 1562 _ 48: 89. 44 24, 60
        lea     r12, [rbp+8H]                           ; 1567 _ 4C: 8D. 65, 08
        call    _ZNSs12_S_constructEycRKSaIcE           ; 156B _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 1570 _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 1574 _ 49: 89. F8
        lea     rdx, [rel ?_272]                        ; 1577 _ 48: 8D. 15, 00000003(rel)
        mov     qword [rsp+68H], rax                    ; 157E _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 1583 _ E8, 00000000(rel)
        lea     r9, [rel ?_271]                         ; 1588 _ 4C: 8D. 0D, 00000000(rel)
        mov     rcx, rdi                                ; 158F _ 48: 89. F9
        mov     r8d, 16                                 ; 1592 _ 41: B8, 00000010
        mov     dword [rsp+20H], 30                     ; 1598 _ C7. 44 24, 20, 0000001E
        lea     rdx, [rel _ZL9vsnprintfPcyPKcS_]        ; 15A0 _ 48: 8D. 15, FFFFEA79(rel)
        mov     dword [rsp+78H], 0                      ; 15A7 _ C7. 44 24, 78, 00000000
        mov     dword [rsp+7CH], 5000                   ; 15AF _ C7. 44 24, 7C, 00001388
        mov     qword [rsp+88H], 0                      ; 15B7 _ 48: C7. 84 24, 00000088, 00000000
        call    _ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60; 15C3 _ E8, FFFFEA68
        mov     rdx, rdi                                ; 15C8 _ 48: 89. FA
        mov     rcx, r12                                ; 15CB _ 4C: 89. E1
        call    _ZNSs4swapERSs                          ; 15CE _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 15D3 _ 48: 89. E9
        mov     rdx, r12                                ; 15D6 _ 4C: 89. E2
        call    _ZNSs6assignERKSs                       ; 15D9 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+50H]                    ; 15DE _ 48: 8B. 4C 24, 50
        mov     eax, 4294967295                         ; 15E3 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 15E8 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 15ED _ 85. C0
        jle     ?_223                                   ; 15EF _ 0F 8E, 0000145D
?_097:  mov     r8, r14                                 ; 15F5 _ 4D: 89. F0
        mov     rcx, rbx                                ; 15F8 _ 48: 89. D9
        mov     r15, r13                                ; 15FB _ 4D: 89. EF
        lea     rdx, [rel ?_291]                        ; 15FE _ 48: 8D. 15, 00000093(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 1605 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 160A _ 4C: 8B. 66, 10
        test    r12, r12                                ; 160E _ 4D: 85. E4
        jnz     ?_099                                   ; 1611 _ 75, 1A
        jmp     ?_184                                   ; 1613 _ E9, 00001098

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_098:  mov     r15, r12                                ; 1620 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 1623 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 1628 _ 4D: 85. E4
        jz      ?_100                                   ; 162B _ 74, 1E
?_099:  lea     rdx, [r12+20H]                          ; 162D _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 1632 _ 49: 89. D8
        mov     rcx, rsi                                ; 1635 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 1638 _ E8, FFFFEB93
        test    al, al                                  ; 163D _ 84. C0
        jz      ?_098                                   ; 163F _ 74, DF
        mov     r12, qword [r12+18H]                    ; 1641 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 1646 _ 4D: 85. E4
        jnz     ?_099                                   ; 1649 _ 75, E2
?_100:  cmp     r13, r15                                ; 164B _ 4D: 39. FD
        je      ?_184                                   ; 164E _ 0F 84, 0000105C
        lea     r8, [r15+20H]                           ; 1654 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 1658 _ 48: 89. DA
        mov     rcx, rdi                                ; 165B _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 165E _ E8, FFFFEB6D
        test    al, al                                  ; 1663 _ 84. C0
        jne     ?_184                                   ; 1665 _ 0F 85, 00001045
?_101:  lea     rcx, [r15+28H]                          ; 166B _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 166F _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 1672 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 1677 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 167B _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 167F _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 1684 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 1688 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 168C _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 1691 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 1695 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 1699 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 169D _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 16A1 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 16A9 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 16AD _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 16B4 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 16B9 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 16BD _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 16C1 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 16C6 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 16CD _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 16D2 _ 85. C0
        jle     ?_208                                   ; 16D4 _ 0F 8E, 0000125B
?_102:  mov     rcx, qword [rsp+70H]                    ; 16DA _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 16DF _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 16E4 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 16E9 _ 85. C0
        jle     ?_209                                   ; 16EB _ 0F 8E, 0000125F
?_103:  mov     rcx, qword [rsp+68H]                    ; 16F1 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 16F6 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 16FB _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1700 _ 85. C0
        jle     ?_210                                   ; 1702 _ 0F 8E, 00001259
?_104:  mov     rcx, qword [rsp+60H]                    ; 1708 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 170D _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1712 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1717 _ 85. C0
        jle     ?_211                                   ; 1719 _ 0F 8E, 00001253
?_105:  mov     r8, rdi                                 ; 171F _ 49: 89. F8
        xor     edx, edx                                ; 1722 _ 31. D2
        xor     ecx, ecx                                ; 1724 _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 1726 _ E8, 00000000(rel)
        mov     r8, rdi                                 ; 172B _ 49: 89. F8
        xor     edx, edx                                ; 172E _ 31. D2
        xor     ecx, ecx                                ; 1730 _ 31. C9
        mov     qword [rsp+60H], rax                    ; 1732 _ 48: 89. 44 24, 60
        lea     r12, [rbp+8H]                           ; 1737 _ 4C: 8D. 65, 08
        call    _ZNSs12_S_constructEycRKSaIcE           ; 173B _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 1740 _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 1744 _ 49: 89. F8
        lea     rdx, [rel ?_272]                        ; 1747 _ 48: 8D. 15, 00000003(rel)
        mov     qword [rsp+68H], rax                    ; 174E _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 1753 _ E8, 00000000(rel)
        lea     r9, [rel ?_271]                         ; 1758 _ 4C: 8D. 0D, 00000000(rel)
        mov     rcx, rdi                                ; 175F _ 48: 89. F9
        mov     r8d, 16                                 ; 1762 _ 41: B8, 00000010
        mov     dword [rsp+20H], 20                     ; 1768 _ C7. 44 24, 20, 00000014
        lea     rdx, [rel _ZL9vsnprintfPcyPKcS_]        ; 1770 _ 48: 8D. 15, FFFFE8A9(rel)
        mov     dword [rsp+78H], 0                      ; 1777 _ C7. 44 24, 78, 00000000
        mov     dword [rsp+7CH], 5000                   ; 177F _ C7. 44 24, 7C, 00001388
        mov     qword [rsp+88H], 0                      ; 1787 _ 48: C7. 84 24, 00000088, 00000000
        call    _ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60; 1793 _ E8, FFFFE898
        mov     rdx, rdi                                ; 1798 _ 48: 89. FA
        mov     rcx, r12                                ; 179B _ 4C: 89. E1
        call    _ZNSs4swapERSs                          ; 179E _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 17A3 _ 48: 89. E9
        mov     rdx, r12                                ; 17A6 _ 4C: 89. E2
        call    _ZNSs6assignERKSs                       ; 17A9 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+50H]                    ; 17AE _ 48: 8B. 4C 24, 50
        mov     eax, 4294967295                         ; 17B3 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 17B8 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 17BD _ 85. C0
        jle     ?_214                                   ; 17BF _ 0F 8E, 000011E0
?_106:  mov     r8, r14                                 ; 17C5 _ 4D: 89. F0
        mov     rcx, rbx                                ; 17C8 _ 48: 89. D9
        mov     r15, r13                                ; 17CB _ 4D: 89. EF
        lea     rdx, [rel ?_292]                        ; 17CE _ 48: 8D. 15, 000000A1(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 17D5 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 17DA _ 4C: 8B. 66, 10
        test    r12, r12                                ; 17DE _ 4D: 85. E4
        jnz     ?_108                                   ; 17E1 _ 75, 1A
        jmp     ?_183                                   ; 17E3 _ E9, 00000E98

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_107:  mov     r15, r12                                ; 17F0 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 17F3 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 17F8 _ 4D: 85. E4
        jz      ?_109                                   ; 17FB _ 74, 1E
?_108:  lea     rdx, [r12+20H]                          ; 17FD _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 1802 _ 49: 89. D8
        mov     rcx, rsi                                ; 1805 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 1808 _ E8, FFFFE9C3
        test    al, al                                  ; 180D _ 84. C0
        jz      ?_107                                   ; 180F _ 74, DF
        mov     r12, qword [r12+18H]                    ; 1811 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 1816 _ 4D: 85. E4
        jnz     ?_108                                   ; 1819 _ 75, E2
?_109:  cmp     r13, r15                                ; 181B _ 4D: 39. FD
        je      ?_183                                   ; 181E _ 0F 84, 00000E5C
        lea     r8, [r15+20H]                           ; 1824 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 1828 _ 48: 89. DA
        mov     rcx, rdi                                ; 182B _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 182E _ E8, FFFFE99D
        test    al, al                                  ; 1833 _ 84. C0
        jne     ?_183                                   ; 1835 _ 0F 85, 00000E45
?_110:  lea     rcx, [r15+28H]                          ; 183B _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 183F _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 1842 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 1847 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 184B _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 184F _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 1854 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 1858 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 185C _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 1861 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 1865 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 1869 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 186D _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 1871 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 1879 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 187D _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 1884 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 1889 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 188D _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 1891 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 1896 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 189D _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 18A2 _ 85. C0
        jle     ?_212                                   ; 18A4 _ 0F 8E, 000010D9
?_111:  mov     rcx, qword [rsp+70H]                    ; 18AA _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 18AF _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 18B4 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 18B9 _ 85. C0
        jle     ?_213                                   ; 18BB _ 0F 8E, 000010D3
?_112:  mov     rcx, qword [rsp+68H]                    ; 18C1 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 18C6 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 18CB _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 18D0 _ 85. C0
        jle     ?_218                                   ; 18D2 _ 0F 8E, 0000111B
?_113:  mov     rcx, qword [rsp+60H]                    ; 18D8 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 18DD _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 18E2 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 18E7 _ 85. C0
        jle     ?_219                                   ; 18E9 _ 0F 8E, 00001115
?_114:  mov     r8, rdi                                 ; 18EF _ 49: 89. F8
        xor     edx, edx                                ; 18F2 _ 31. D2
        xor     ecx, ecx                                ; 18F4 _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 18F6 _ E8, 00000000(rel)
        mov     r8, rdi                                 ; 18FB _ 49: 89. F8
        xor     edx, edx                                ; 18FE _ 31. D2
        xor     ecx, ecx                                ; 1900 _ 31. C9
        mov     qword [rsp+60H], rax                    ; 1902 _ 48: 89. 44 24, 60
        lea     r12, [rbp+8H]                           ; 1907 _ 4C: 8D. 65, 08
        call    _ZNSs12_S_constructEycRKSaIcE           ; 190B _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 1910 _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 1914 _ 49: 89. F8
        lea     rdx, [rel ?_272]                        ; 1917 _ 48: 8D. 15, 00000003(rel)
        mov     qword [rsp+68H], rax                    ; 191E _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 1923 _ E8, 00000000(rel)
        lea     r9, [rel ?_271]                         ; 1928 _ 4C: 8D. 0D, 00000000(rel)
        mov     rcx, rdi                                ; 192F _ 48: 89. F9
        mov     r8d, 16                                 ; 1932 _ 41: B8, 00000010
        mov     dword [rsp+20H], 80                     ; 1938 _ C7. 44 24, 20, 00000050
        lea     rdx, [rel _ZL9vsnprintfPcyPKcS_]        ; 1940 _ 48: 8D. 15, FFFFE6D9(rel)
        mov     dword [rsp+78H], 10                     ; 1947 _ C7. 44 24, 78, 0000000A
        mov     dword [rsp+7CH], 1000                   ; 194F _ C7. 44 24, 7C, 000003E8
        mov     qword [rsp+88H], 0                      ; 1957 _ 48: C7. 84 24, 00000088, 00000000
        call    _ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60; 1963 _ E8, FFFFE6C8
        mov     rdx, rdi                                ; 1968 _ 48: 89. FA
        mov     rcx, r12                                ; 196B _ 4C: 89. E1
        call    _ZNSs4swapERSs                          ; 196E _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 1973 _ 48: 89. E9
        mov     rdx, r12                                ; 1976 _ 4C: 89. E2
        call    _ZNSs6assignERKSs                       ; 1979 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+50H]                    ; 197E _ 48: 8B. 4C 24, 50
        mov     eax, 4294967295                         ; 1983 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1988 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 198D _ 85. C0
        jle     ?_215                                   ; 198F _ 0F 8E, 0000102B
?_115:  mov     r8, r14                                 ; 1995 _ 4D: 89. F0
        mov     rcx, rbx                                ; 1998 _ 48: 89. D9
        mov     r15, r13                                ; 199B _ 4D: 89. EF
        lea     rdx, [rel ?_293]                        ; 199E _ 48: 8D. 15, 000000B7(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 19A5 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 19AA _ 4C: 8B. 66, 10
        test    r12, r12                                ; 19AE _ 4D: 85. E4
        jnz     ?_117                                   ; 19B1 _ 75, 1A
        jmp     ?_182                                   ; 19B3 _ E9, 00000C98

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_116:  mov     r15, r12                                ; 19C0 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 19C3 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 19C8 _ 4D: 85. E4
        jz      ?_118                                   ; 19CB _ 74, 1E
?_117:  lea     rdx, [r12+20H]                          ; 19CD _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 19D2 _ 49: 89. D8
        mov     rcx, rsi                                ; 19D5 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 19D8 _ E8, FFFFE7F3
        test    al, al                                  ; 19DD _ 84. C0
        jz      ?_116                                   ; 19DF _ 74, DF
        mov     r12, qword [r12+18H]                    ; 19E1 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 19E6 _ 4D: 85. E4
        jnz     ?_117                                   ; 19E9 _ 75, E2
?_118:  cmp     r13, r15                                ; 19EB _ 4D: 39. FD
        je      ?_182                                   ; 19EE _ 0F 84, 00000C5C
        lea     r8, [r15+20H]                           ; 19F4 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 19F8 _ 48: 89. DA
        mov     rcx, rdi                                ; 19FB _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 19FE _ E8, FFFFE7CD
        test    al, al                                  ; 1A03 _ 84. C0
        jne     ?_182                                   ; 1A05 _ 0F 85, 00000C45
?_119:  lea     rcx, [r15+28H]                          ; 1A0B _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 1A0F _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 1A12 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 1A17 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 1A1B _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 1A1F _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 1A24 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 1A28 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 1A2C _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 1A31 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 1A35 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 1A39 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 1A3D _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 1A41 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 1A49 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 1A4D _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 1A54 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 1A59 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 1A5D _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 1A61 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 1A66 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 1A6D _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1A72 _ 85. C0
        jle     ?_200                                   ; 1A74 _ 0F 8E, 00000E29
?_120:  mov     rcx, qword [rsp+70H]                    ; 1A7A _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 1A7F _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1A84 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1A89 _ 85. C0
        jle     ?_201                                   ; 1A8B _ 0F 8E, 00000E23
?_121:  mov     rcx, qword [rsp+68H]                    ; 1A91 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 1A96 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1A9B _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1AA0 _ 85. C0
        jle     ?_202                                   ; 1AA2 _ 0F 8E, 00000E1D
?_122:  mov     rcx, qword [rsp+60H]                    ; 1AA8 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 1AAD _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1AB2 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1AB7 _ 85. C0
        jle     ?_203                                   ; 1AB9 _ 0F 8E, 00000E21
?_123:  mov     r8, rdi                                 ; 1ABF _ 49: 89. F8
        xor     edx, edx                                ; 1AC2 _ 31. D2
        xor     ecx, ecx                                ; 1AC4 _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 1AC6 _ E8, 00000000(rel)
        mov     r8, rdi                                 ; 1ACB _ 49: 89. F8
        xor     edx, edx                                ; 1ACE _ 31. D2
        xor     ecx, ecx                                ; 1AD0 _ 31. C9
        mov     qword [rsp+60H], rax                    ; 1AD2 _ 48: 89. 44 24, 60
        lea     r12, [rbp+8H]                           ; 1AD7 _ 4C: 8D. 65, 08
        call    _ZNSs12_S_constructEycRKSaIcE           ; 1ADB _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 1AE0 _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 1AE4 _ 49: 89. F8
        lea     rdx, [rel ?_272]                        ; 1AE7 _ 48: 8D. 15, 00000003(rel)
        mov     qword [rsp+68H], rax                    ; 1AEE _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 1AF3 _ E8, 00000000(rel)
        lea     r9, [rel ?_271]                         ; 1AF8 _ 4C: 8D. 0D, 00000000(rel)
        mov     rcx, rdi                                ; 1AFF _ 48: 89. F9
        mov     r8d, 16                                 ; 1B02 _ 41: B8, 00000010
        mov     dword [rsp+20H], 0                      ; 1B08 _ C7. 44 24, 20, 00000000
        lea     rdx, [rel _ZL9vsnprintfPcyPKcS_]        ; 1B10 _ 48: 8D. 15, FFFFE509(rel)
        mov     dword [rsp+78H], 0                      ; 1B17 _ C7. 44 24, 78, 00000000
        mov     dword [rsp+7CH], 10000                  ; 1B1F _ C7. 44 24, 7C, 00002710
        mov     qword [rsp+88H], 0                      ; 1B27 _ 48: C7. 84 24, 00000088, 00000000
        call    _ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60; 1B33 _ E8, FFFFE4F8
        mov     rdx, rdi                                ; 1B38 _ 48: 89. FA
        mov     rcx, r12                                ; 1B3B _ 4C: 89. E1
        call    _ZNSs4swapERSs                          ; 1B3E _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 1B43 _ 48: 89. E9
        mov     rdx, r12                                ; 1B46 _ 4C: 89. E2
        call    _ZNSs6assignERKSs                       ; 1B49 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+50H]                    ; 1B4E _ 48: 8B. 4C 24, 50
        mov     eax, 4294967295                         ; 1B53 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1B58 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1B5D _ 85. C0
        jle     ?_198                                   ; 1B5F _ 0F 8E, 00000D1C
?_124:  mov     r8, r14                                 ; 1B65 _ 4D: 89. F0
        mov     rcx, rbx                                ; 1B68 _ 48: 89. D9
        mov     r15, r13                                ; 1B6B _ 4D: 89. EF
        lea     rdx, [rel ?_294]                        ; 1B6E _ 48: 8D. 15, 000000C2(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 1B75 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 1B7A _ 4C: 8B. 66, 10
        test    r12, r12                                ; 1B7E _ 4D: 85. E4
        jnz     ?_126                                   ; 1B81 _ 75, 1A
        jmp     ?_181                                   ; 1B83 _ E9, 00000A98

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_125:  mov     r15, r12                                ; 1B90 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 1B93 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 1B98 _ 4D: 85. E4
        jz      ?_127                                   ; 1B9B _ 74, 1E
?_126:  lea     rdx, [r12+20H]                          ; 1B9D _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 1BA2 _ 49: 89. D8
        mov     rcx, rsi                                ; 1BA5 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 1BA8 _ E8, FFFFE623
        test    al, al                                  ; 1BAD _ 84. C0
        jz      ?_125                                   ; 1BAF _ 74, DF
        mov     r12, qword [r12+18H]                    ; 1BB1 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 1BB6 _ 4D: 85. E4
        jnz     ?_126                                   ; 1BB9 _ 75, E2
?_127:  cmp     r13, r15                                ; 1BBB _ 4D: 39. FD
        je      ?_181                                   ; 1BBE _ 0F 84, 00000A5C
        lea     r8, [r15+20H]                           ; 1BC4 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 1BC8 _ 48: 89. DA
        mov     rcx, rdi                                ; 1BCB _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 1BCE _ E8, FFFFE5FD
        test    al, al                                  ; 1BD3 _ 84. C0
        jne     ?_181                                   ; 1BD5 _ 0F 85, 00000A45
?_128:  lea     rcx, [r15+28H]                          ; 1BDB _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 1BDF _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 1BE2 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 1BE7 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 1BEB _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 1BEF _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 1BF4 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 1BF8 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 1BFC _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 1C01 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 1C05 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 1C09 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 1C0D _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 1C11 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 1C19 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 1C1D _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 1C24 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 1C29 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 1C2D _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 1C31 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 1C36 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 1C3D _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1C42 _ 85. C0
        jle     ?_196                                   ; 1C44 _ 0F 8E, 00000C0B
?_129:  mov     rcx, qword [rsp+70H]                    ; 1C4A _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 1C4F _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1C54 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1C59 _ 85. C0
        jle     ?_197                                   ; 1C5B _ 0F 8E, 00000C0F
?_130:  mov     rcx, qword [rsp+68H]                    ; 1C61 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 1C66 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1C6B _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1C70 _ 85. C0
        jle     ?_192                                   ; 1C72 _ 0F 8E, 00000B99
?_131:  mov     rcx, qword [rsp+60H]                    ; 1C78 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 1C7D _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1C82 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1C87 _ 85. C0
        jle     ?_193                                   ; 1C89 _ 0F 8E, 00000B93
?_132:  xor     edx, edx                                ; 1C8F _ 31. D2
        xor     ecx, ecx                                ; 1C91 _ 31. C9
        mov     r8, rdi                                 ; 1C93 _ 49: 89. F8
        call    _ZNSs12_S_constructEycRKSaIcE           ; 1C96 _ E8, 00000000(rel)
        xor     edx, edx                                ; 1C9B _ 31. D2
        xor     ecx, ecx                                ; 1C9D _ 31. C9
        mov     r8, rdi                                 ; 1C9F _ 49: 89. F8
        mov     qword [rsp+60H], rax                    ; 1CA2 _ 48: 89. 44 24, 60
        mov     r15, r13                                ; 1CA7 _ 4D: 89. EF
        call    _ZNSs12_S_constructEycRKSaIcE           ; 1CAA _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 1CAF _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 1CB3 _ 49: 89. F8
        lea     rdx, [rel ?_283]                        ; 1CB6 _ 48: 8D. 15, 00000051(rel)
        mov     qword [rsp+68H], rax                    ; 1CBD _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 1CC2 _ E8, 00000000(rel)
        lea     rcx, [rbp+8H]                           ; 1CC7 _ 48: 8D. 4D, 08
        mov     r8d, 5                                  ; 1CCB _ 41: B8, 00000005
        mov     dword [rsp+78H], 0                      ; 1CD1 _ C7. 44 24, 78, 00000000
        lea     rdx, [rel ?_282]                        ; 1CD9 _ 48: 8D. 15, 0000004B(rel)
        mov     dword [rsp+7CH], 0                      ; 1CE0 _ C7. 44 24, 7C, 00000000
        mov     qword [rsp+88H], 0                      ; 1CE8 _ 48: C7. 84 24, 00000088, 00000000
        call    _ZNSs6assignEPKcy                       ; 1CF4 _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 1CF9 _ 48: 89. E9
        mov     rdx, rax                                ; 1CFC _ 48: 89. C2
        call    _ZNSs6assignERKSs                       ; 1CFF _ E8, 00000000(rel)
        mov     r8, r14                                 ; 1D04 _ 4D: 89. F0
        mov     rcx, rbx                                ; 1D07 _ 48: 89. D9
        lea     rdx, [rel ?_295]                        ; 1D0A _ 48: 8D. 15, 000000CC(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 1D11 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 1D16 _ 4C: 8B. 66, 10
        test    r12, r12                                ; 1D1A _ 4D: 85. E4
        jnz     ?_134                                   ; 1D1D _ 75, 12
        jmp     ?_180                                   ; 1D1F _ E9, 000008CC

?_133:  mov     r15, r12                                ; 1D24 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 1D27 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 1D2C _ 4D: 85. E4
        jz      ?_135                                   ; 1D2F _ 74, 1E
?_134:  lea     rdx, [r12+20H]                          ; 1D31 _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 1D36 _ 49: 89. D8
        mov     rcx, rsi                                ; 1D39 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 1D3C _ E8, FFFFE48F
        test    al, al                                  ; 1D41 _ 84. C0
        jz      ?_133                                   ; 1D43 _ 74, DF
        mov     r12, qword [r12+18H]                    ; 1D45 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 1D4A _ 4D: 85. E4
        jnz     ?_134                                   ; 1D4D _ 75, E2
?_135:  cmp     r13, r15                                ; 1D4F _ 4D: 39. FD
        je      ?_180                                   ; 1D52 _ 0F 84, 00000898
        lea     r8, [r15+20H]                           ; 1D58 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 1D5C _ 48: 89. DA
        mov     rcx, rdi                                ; 1D5F _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 1D62 _ E8, FFFFE469
        test    al, al                                  ; 1D67 _ 84. C0
        jne     ?_180                                   ; 1D69 _ 0F 85, 00000881
?_136:  lea     rcx, [r15+28H]                          ; 1D6F _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 1D73 _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 1D76 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 1D7B _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 1D7F _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 1D83 _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 1D88 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 1D8C _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 1D90 _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 1D95 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 1D99 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 1D9D _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 1DA1 _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 1DA5 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 1DAD _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 1DB1 _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 1DB8 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 1DBD _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 1DC1 _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 1DC5 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 1DCA _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 1DD1 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1DD6 _ 85. C0
        jle     ?_199                                   ; 1DD8 _ 0F 8E, 00000AB4
?_137:  mov     rcx, qword [rsp+70H]                    ; 1DDE _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 1DE3 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1DE8 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1DED _ 85. C0
        jle     ?_236                                   ; 1DEF _ 0F 8E, 00000D4E
?_138:  mov     rcx, qword [rsp+68H]                    ; 1DF5 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 1DFA _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1DFF _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1E04 _ 85. C0
        jle     ?_237                                   ; 1E06 _ 0F 8E, 00000D48
?_139:  mov     rcx, qword [rsp+60H]                    ; 1E0C _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 1E11 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1E16 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1E1B _ 85. C0
        jle     ?_238                                   ; 1E1D _ 0F 8E, 00000D42
?_140:  xor     edx, edx                                ; 1E23 _ 31. D2
        xor     ecx, ecx                                ; 1E25 _ 31. C9
        mov     r8, rdi                                 ; 1E27 _ 49: 89. F8
        call    _ZNSs12_S_constructEycRKSaIcE           ; 1E2A _ E8, 00000000(rel)
        xor     edx, edx                                ; 1E2F _ 31. D2
        xor     ecx, ecx                                ; 1E31 _ 31. C9
        mov     r8, rdi                                 ; 1E33 _ 49: 89. F8
        mov     qword [rsp+60H], rax                    ; 1E36 _ 48: 89. 44 24, 60
        mov     r15, r13                                ; 1E3B _ 4D: 89. EF
        call    _ZNSs12_S_constructEycRKSaIcE           ; 1E3E _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 1E43 _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 1E47 _ 49: 89. F8
        lea     rdx, [rel ?_281]                        ; 1E4A _ 48: 8D. 15, 00000044(rel)
        mov     qword [rsp+68H], rax                    ; 1E51 _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 1E56 _ E8, 00000000(rel)
        lea     rcx, [rbp+8H]                           ; 1E5B _ 48: 8D. 4D, 08
        mov     r8d, 7                                  ; 1E5F _ 41: B8, 00000007
        mov     dword [rsp+78H], 0                      ; 1E65 _ C7. 44 24, 78, 00000000
        lea     rax, [rel _ZN3UCI10on_tb_pathERKNS_6OptionE]; 1E6D _ 48: 8D. 05, FFFFE24C(rel)
        mov     dword [rsp+7CH], 0                      ; 1E74 _ C7. 44 24, 7C, 00000000
        lea     rdx, [rel ?_296]                        ; 1E7C _ 48: 8D. 15, 000000D9(rel)
        mov     qword [rsp+88H], rax                    ; 1E83 _ 48: 89. 84 24, 00000088
        call    _ZNSs6assignEPKcy                       ; 1E8B _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 1E90 _ 48: 89. E9
        mov     rdx, rax                                ; 1E93 _ 48: 89. C2
        call    _ZNSs6assignERKSs                       ; 1E96 _ E8, 00000000(rel)
        mov     r8, r14                                 ; 1E9B _ 4D: 89. F0
        mov     rcx, rbx                                ; 1E9E _ 48: 89. D9
        lea     rdx, [rel ?_297]                        ; 1EA1 _ 48: 8D. 15, 000000E1(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 1EA8 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 1EAD _ 4C: 8B. 66, 10
        test    r12, r12                                ; 1EB1 _ 4D: 85. E4
        jnz     ?_142                                   ; 1EB4 _ 75, 17
        jmp     ?_179                                   ; 1EB6 _ E9, 00000705

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_141:  mov     r15, r12                                ; 1EC0 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 1EC3 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 1EC8 _ 4D: 85. E4
        jz      ?_143                                   ; 1ECB _ 74, 1E
?_142:  lea     rdx, [r12+20H]                          ; 1ECD _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 1ED2 _ 49: 89. D8
        mov     rcx, rsi                                ; 1ED5 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 1ED8 _ E8, FFFFE2F3
        test    al, al                                  ; 1EDD _ 84. C0
        jz      ?_141                                   ; 1EDF _ 74, DF
        mov     r12, qword [r12+18H]                    ; 1EE1 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 1EE6 _ 4D: 85. E4
        jnz     ?_142                                   ; 1EE9 _ 75, E2
?_143:  cmp     r13, r15                                ; 1EEB _ 4D: 39. FD
        je      ?_179                                   ; 1EEE _ 0F 84, 000006CC
        lea     r8, [r15+20H]                           ; 1EF4 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 1EF8 _ 48: 89. DA
        mov     rcx, rdi                                ; 1EFB _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 1EFE _ E8, FFFFE2CD
        test    al, al                                  ; 1F03 _ 84. C0
        jne     ?_179                                   ; 1F05 _ 0F 85, 000006B5
?_144:  lea     rcx, [r15+28H]                          ; 1F0B _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 1F0F _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 1F12 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 1F17 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 1F1B _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 1F1F _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 1F24 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 1F28 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 1F2C _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 1F31 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 1F35 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 1F39 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 1F3D _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 1F41 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 1F49 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 1F4D _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 1F54 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 1F59 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 1F5D _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 1F61 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 1F66 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 1F6D _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1F72 _ 85. C0
        jle     ?_232                                   ; 1F74 _ 0F 8E, 00000B7B
?_145:  mov     rcx, qword [rsp+70H]                    ; 1F7A _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 1F7F _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1F84 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1F89 _ 85. C0
        jle     ?_233                                   ; 1F8B _ 0F 8E, 00000B7F
?_146:  mov     rcx, qword [rsp+68H]                    ; 1F91 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 1F96 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1F9B _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1FA0 _ 85. C0
        jle     ?_234                                   ; 1FA2 _ 0F 8E, 00000B79
?_147:  mov     rcx, qword [rsp+60H]                    ; 1FA8 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 1FAD _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 1FB2 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 1FB7 _ 85. C0
        jle     ?_235                                   ; 1FB9 _ 0F 8E, 00000B73
?_148:  mov     r8, rdi                                 ; 1FBF _ 49: 89. F8
        xor     edx, edx                                ; 1FC2 _ 31. D2
        xor     ecx, ecx                                ; 1FC4 _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 1FC6 _ E8, 00000000(rel)
        mov     r8, rdi                                 ; 1FCB _ 49: 89. F8
        xor     edx, edx                                ; 1FCE _ 31. D2
        xor     ecx, ecx                                ; 1FD0 _ 31. C9
        mov     qword [rsp+60H], rax                    ; 1FD2 _ 48: 89. 44 24, 60
        lea     r12, [rbp+8H]                           ; 1FD7 _ 4C: 8D. 65, 08
        call    _ZNSs12_S_constructEycRKSaIcE           ; 1FDB _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 1FE0 _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 1FE4 _ 49: 89. F8
        lea     rdx, [rel ?_272]                        ; 1FE7 _ 48: 8D. 15, 00000003(rel)
        mov     qword [rsp+68H], rax                    ; 1FEE _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 1FF3 _ E8, 00000000(rel)
        lea     r9, [rel ?_271]                         ; 1FF8 _ 4C: 8D. 0D, 00000000(rel)
        mov     rcx, rdi                                ; 1FFF _ 48: 89. F9
        mov     r8d, 16                                 ; 2002 _ 41: B8, 00000010
        mov     dword [rsp+20H], 1                      ; 2008 _ C7. 44 24, 20, 00000001
        lea     rdx, [rel _ZL9vsnprintfPcyPKcS_]        ; 2010 _ 48: 8D. 15, FFFFE009(rel)
        mov     dword [rsp+78H], 1                      ; 2017 _ C7. 44 24, 78, 00000001
        mov     dword [rsp+7CH], 100                    ; 201F _ C7. 44 24, 7C, 00000064
        mov     qword [rsp+88H], 0                      ; 2027 _ 48: C7. 84 24, 00000088, 00000000
        call    _ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60; 2033 _ E8, FFFFDFF8
        mov     rdx, rdi                                ; 2038 _ 48: 89. FA
        mov     rcx, r12                                ; 203B _ 4C: 89. E1
        call    _ZNSs4swapERSs                          ; 203E _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 2043 _ 48: 89. E9
        mov     rdx, r12                                ; 2046 _ 4C: 89. E2
        call    _ZNSs6assignERKSs                       ; 2049 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+50H]                    ; 204E _ 48: 8B. 4C 24, 50
        mov     eax, 4294967295                         ; 2053 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 2058 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 205D _ 85. C0
        jle     ?_239                                   ; 205F _ 0F 8E, 00000B1B
?_149:  mov     r8, r14                                 ; 2065 _ 4D: 89. F0
        mov     rcx, rbx                                ; 2068 _ 48: 89. D9
        mov     r15, r13                                ; 206B _ 4D: 89. EF
        lea     rdx, [rel ?_298]                        ; 206E _ 48: 8D. 15, 000000EC(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 2075 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 207A _ 4C: 8B. 66, 10
        test    r12, r12                                ; 207E _ 4D: 85. E4
        jnz     ?_151                                   ; 2081 _ 75, 1A
        jmp     ?_178                                   ; 2083 _ E9, 00000508

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_150:  mov     r15, r12                                ; 2090 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 2093 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 2098 _ 4D: 85. E4
        jz      ?_152                                   ; 209B _ 74, 1E
?_151:  lea     rdx, [r12+20H]                          ; 209D _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 20A2 _ 49: 89. D8
        mov     rcx, rsi                                ; 20A5 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 20A8 _ E8, FFFFE123
        test    al, al                                  ; 20AD _ 84. C0
        jz      ?_150                                   ; 20AF _ 74, DF
        mov     r12, qword [r12+18H]                    ; 20B1 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 20B6 _ 4D: 85. E4
        jnz     ?_151                                   ; 20B9 _ 75, E2
?_152:  cmp     r13, r15                                ; 20BB _ 4D: 39. FD
        je      ?_178                                   ; 20BE _ 0F 84, 000004CC
        lea     r8, [r15+20H]                           ; 20C4 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 20C8 _ 48: 89. DA
        mov     rcx, rdi                                ; 20CB _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 20CE _ E8, FFFFE0FD
        test    al, al                                  ; 20D3 _ 84. C0
        jne     ?_178                                   ; 20D5 _ 0F 85, 000004B5
?_153:  lea     rcx, [r15+28H]                          ; 20DB _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 20DF _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 20E2 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 20E7 _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 20EB _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 20EF _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 20F4 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 20F8 _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 20FC _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 2101 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 2105 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 2109 _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 210D _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 2111 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 2119 _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 211D _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 2124 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 2129 _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 212D _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 2131 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 2136 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 213D _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 2142 _ 85. C0
        jle     ?_194                                   ; 2144 _ 0F 8E, 000006E9
?_154:  mov     rcx, qword [rsp+70H]                    ; 214A _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 214F _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 2154 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 2159 _ 85. C0
        jle     ?_195                                   ; 215B _ 0F 8E, 000006E3
?_155:  mov     rcx, qword [rsp+68H]                    ; 2161 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 2166 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 216B _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 2170 _ 85. C0
        jle     ?_204                                   ; 2172 _ 0F 8E, 00000779
?_156:  mov     rcx, qword [rsp+60H]                    ; 2178 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 217D _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 2182 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 2187 _ 85. C0
        jle     ?_205                                   ; 2189 _ 0F 8E, 00000773
?_157:  xor     edx, edx                                ; 218F _ 31. D2
        xor     ecx, ecx                                ; 2191 _ 31. C9
        mov     r8, rdi                                 ; 2193 _ 49: 89. F8
        call    _ZNSs12_S_constructEycRKSaIcE           ; 2196 _ E8, 00000000(rel)
        xor     edx, edx                                ; 219B _ 31. D2
        xor     ecx, ecx                                ; 219D _ 31. C9
        mov     r8, rdi                                 ; 219F _ 49: 89. F8
        mov     qword [rsp+60H], rax                    ; 21A2 _ 48: 89. 44 24, 60
        mov     r15, r13                                ; 21A7 _ 4D: 89. EF
        call    _ZNSs12_S_constructEycRKSaIcE           ; 21AA _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 21AF _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 21B3 _ 49: 89. F8
        lea     rdx, [rel ?_283]                        ; 21B6 _ 48: 8D. 15, 00000051(rel)
        mov     qword [rsp+68H], rax                    ; 21BD _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 21C2 _ E8, 00000000(rel)
        lea     rcx, [rbp+8H]                           ; 21C7 _ 48: 8D. 4D, 08
        mov     r8d, 4                                  ; 21CB _ 41: B8, 00000004
        mov     dword [rsp+78H], 0                      ; 21D1 _ C7. 44 24, 78, 00000000
        lea     rdx, [rel ?_274]                        ; 21D9 _ 48: 8D. 15, 0000000D(rel)
        mov     dword [rsp+7CH], 0                      ; 21E0 _ C7. 44 24, 7C, 00000000
        mov     qword [rsp+88H], 0                      ; 21E8 _ 48: C7. 84 24, 00000088, 00000000
        call    _ZNSs6assignEPKcy                       ; 21F4 _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 21F9 _ 48: 89. E9
        mov     rdx, rax                                ; 21FC _ 48: 89. C2
        call    _ZNSs6assignERKSs                       ; 21FF _ E8, 00000000(rel)
        mov     r8, r14                                 ; 2204 _ 4D: 89. F0
        mov     rcx, rbx                                ; 2207 _ 48: 89. D9
        lea     rdx, [rel ?_299]                        ; 220A _ 48: 8D. 15, 000000FD(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 2211 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 2216 _ 4C: 8B. 66, 10
        test    r12, r12                                ; 221A _ 4D: 85. E4
        jnz     ?_159                                   ; 221D _ 75, 12
        jmp     ?_177                                   ; 221F _ E9, 0000033C

?_158:  mov     r15, r12                                ; 2224 _ 4D: 89. E7
        mov     r12, qword [r12+10H]                    ; 2227 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 222C _ 4D: 85. E4
        jz      ?_160                                   ; 222F _ 74, 1E
?_159:  lea     rdx, [r12+20H]                          ; 2231 _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 2236 _ 49: 89. D8
        mov     rcx, rsi                                ; 2239 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 223C _ E8, FFFFDF8F
        test    al, al                                  ; 2241 _ 84. C0
        jz      ?_158                                   ; 2243 _ 74, DF
        mov     r12, qword [r12+18H]                    ; 2245 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 224A _ 4D: 85. E4
        jnz     ?_159                                   ; 224D _ 75, E2
?_160:  cmp     r13, r15                                ; 224F _ 4D: 39. FD
        je      ?_177                                   ; 2252 _ 0F 84, 00000308
        lea     r8, [r15+20H]                           ; 2258 _ 4D: 8D. 47, 20
        mov     rdx, rbx                                ; 225C _ 48: 89. DA
        mov     rcx, rdi                                ; 225F _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 2262 _ E8, FFFFDF69
        test    al, al                                  ; 2267 _ 84. C0
        jne     ?_177                                   ; 2269 _ 0F 85, 000002F1
?_161:  lea     rcx, [r15+28H]                          ; 226F _ 49: 8D. 4F, 28
        mov     rdx, rbp                                ; 2273 _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 2276 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 227B _ 48: 8D. 55, 08
        lea     rcx, [r15+30H]                          ; 227F _ 49: 8D. 4F, 30
        call    _ZNSs6assignERKSs                       ; 2283 _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 2288 _ 48: 8D. 55, 10
        lea     rcx, [r15+38H]                          ; 228C _ 49: 8D. 4F, 38
        call    _ZNSs6assignERKSs                       ; 2290 _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 2295 _ 8B. 44 24, 78
        mov     dword [r15+40H], eax                    ; 2299 _ 41: 89. 47, 40
        mov     eax, dword [rsp+7CH]                    ; 229D _ 8B. 44 24, 7C
        mov     dword [r15+44H], eax                    ; 22A1 _ 41: 89. 47, 44
        mov     rax, qword [rsp+88H]                    ; 22A5 _ 48: 8B. 84 24, 00000088
        mov     qword [r15+50H], rax                    ; 22AD _ 49: 89. 47, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 22B1 _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 22B8 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 22BD _ 48: 8D. 50, 01
        mov     qword [r15+48H], rax                    ; 22C1 _ 49: 89. 47, 48
        mov     eax, 4294967295                         ; 22C5 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 22CA _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 22D1 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 22D6 _ 85. C0
        jle     ?_206                                   ; 22D8 _ 0F 8E, 00000635
?_162:  mov     rcx, qword [rsp+70H]                    ; 22DE _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 22E3 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 22E8 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 22ED _ 85. C0
        jle     ?_224                                   ; 22EF _ 0F 8E, 0000076E
?_163:  mov     rcx, qword [rsp+68H]                    ; 22F5 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 22FA _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 22FF _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 2304 _ 85. C0
        jle     ?_225                                   ; 2306 _ 0F 8E, 00000768
?_164:  mov     rcx, qword [rsp+60H]                    ; 230C _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 2311 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 2316 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 231B _ 85. C0
        jle     ?_226                                   ; 231D _ 0F 8E, 00000762
?_165:  mov     r8, rdi                                 ; 2323 _ 49: 89. F8
        xor     edx, edx                                ; 2326 _ 31. D2
        xor     ecx, ecx                                ; 2328 _ 31. C9
        call    _ZNSs12_S_constructEycRKSaIcE           ; 232A _ E8, 00000000(rel)
        mov     r8, rdi                                 ; 232F _ 49: 89. F8
        xor     edx, edx                                ; 2332 _ 31. D2
        xor     ecx, ecx                                ; 2334 _ 31. C9
        mov     qword [rsp+60H], rax                    ; 2336 _ 48: 89. 44 24, 60
        lea     r12, [rbp+8H]                           ; 233B _ 4C: 8D. 65, 08
        call    _ZNSs12_S_constructEycRKSaIcE           ; 233F _ E8, 00000000(rel)
        lea     rcx, [rbp+10H]                          ; 2344 _ 48: 8D. 4D, 10
        mov     r8, rdi                                 ; 2348 _ 49: 89. F8
        lea     rdx, [rel ?_272]                        ; 234B _ 48: 8D. 15, 00000003(rel)
        mov     qword [rsp+68H], rax                    ; 2352 _ 48: 89. 44 24, 68
        call    _ZNSsC1EPKcRKSaIcE                      ; 2357 _ E8, 00000000(rel)
        lea     r9, [rel ?_271]                         ; 235C _ 4C: 8D. 0D, 00000000(rel)
        mov     rcx, rdi                                ; 2363 _ 48: 89. F9
        mov     r8d, 16                                 ; 2366 _ 41: B8, 00000010
        mov     dword [rsp+20H], 6                      ; 236C _ C7. 44 24, 20, 00000006
        lea     rdx, [rel _ZL9vsnprintfPcyPKcS_]        ; 2374 _ 48: 8D. 15, FFFFDCA5(rel)
        mov     dword [rsp+78H], 0                      ; 237B _ C7. 44 24, 78, 00000000
        mov     dword [rsp+7CH], 6                      ; 2383 _ C7. 44 24, 7C, 00000006
        mov     qword [rsp+88H], 0                      ; 238B _ 48: C7. 84 24, 00000088, 00000000
        call    _ZN9__gnu_cxx12__to_xstringISscEET_PFiPT0_yPKS2_PcEyS5_z.constprop.60; 2397 _ E8, FFFFDC94
        mov     rdx, rdi                                ; 239C _ 48: 89. FA
        mov     rcx, r12                                ; 239F _ 4C: 89. E1
        call    _ZNSs4swapERSs                          ; 23A2 _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 23A7 _ 48: 89. E9
        mov     rdx, r12                                ; 23AA _ 4C: 89. E2
        call    _ZNSs6assignERKSs                       ; 23AD _ E8, 00000000(rel)
        mov     rcx, qword [rsp+50H]                    ; 23B2 _ 48: 8B. 4C 24, 50
        mov     eax, 4294967295                         ; 23B7 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 23BC _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 23C1 _ 85. C0
        jle     ?_227                                   ; 23C3 _ 0F 8E, 000006D7
?_166:  lea     rdx, [rel ?_300]                        ; 23C9 _ 48: 8D. 15, 0000010E(rel)
        mov     r8, r14                                 ; 23D0 _ 4D: 89. F0
        mov     rcx, rbx                                ; 23D3 _ 48: 89. D9
        call    _ZNSsC1EPKcRKSaIcE                      ; 23D6 _ E8, 00000000(rel)
        mov     r12, qword [rsi+10H]                    ; 23DB _ 4C: 8B. 66, 10
        mov     r14, r13                                ; 23DF _ 4D: 89. EE
        test    r12, r12                                ; 23E2 _ 4D: 85. E4
        jnz     ?_168                                   ; 23E5 _ 75, 16
        jmp     ?_176                                   ; 23E7 _ E9, 00000144

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_167:  mov     r14, r12                                ; 23F0 _ 4D: 89. E6
        mov     r12, qword [r12+10H]                    ; 23F3 _ 4D: 8B. 64 24, 10
        test    r12, r12                                ; 23F8 _ 4D: 85. E4
        jz      ?_169                                   ; 23FB _ 74, 1E
?_168:  lea     rdx, [r12+20H]                          ; 23FD _ 49: 8D. 54 24, 20
        mov     r8, rbx                                 ; 2402 _ 49: 89. D8
        mov     rcx, rsi                                ; 2405 _ 48: 89. F1
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 2408 _ E8, FFFFDDC3
        test    al, al                                  ; 240D _ 84. C0
        jz      ?_167                                   ; 240F _ 74, DF
        mov     r12, qword [r12+18H]                    ; 2411 _ 4D: 8B. 64 24, 18
        test    r12, r12                                ; 2416 _ 4D: 85. E4
        jnz     ?_168                                   ; 2419 _ 75, E2
?_169:  cmp     r13, r14                                ; 241B _ 4D: 39. F5
        je      ?_176                                   ; 241E _ 0F 84, 0000010C
        lea     r8, [r14+20H]                           ; 2424 _ 4D: 8D. 46, 20
        mov     rdx, rbx                                ; 2428 _ 48: 89. DA
        mov     rcx, rdi                                ; 242B _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 242E _ E8, FFFFDD9D
        test    al, al                                  ; 2433 _ 84. C0
        jne     ?_176                                   ; 2435 _ 0F 85, 000000F5
?_170:  lea     rcx, [r14+28H]                          ; 243B _ 49: 8D. 4E, 28
        mov     rdx, rbp                                ; 243F _ 48: 89. EA
        call    _ZNSs6assignERKSs                       ; 2442 _ E8, 00000000(rel)
        lea     rdx, [rbp+8H]                           ; 2447 _ 48: 8D. 55, 08
        lea     rcx, [r14+30H]                          ; 244B _ 49: 8D. 4E, 30
        call    _ZNSs6assignERKSs                       ; 244F _ E8, 00000000(rel)
        lea     rdx, [rbp+10H]                          ; 2454 _ 48: 8D. 55, 10
        lea     rcx, [r14+38H]                          ; 2458 _ 49: 8D. 4E, 38
        call    _ZNSs6assignERKSs                       ; 245C _ E8, 00000000(rel)
        mov     eax, dword [rsp+78H]                    ; 2461 _ 8B. 44 24, 78
        mov     dword [r14+40H], eax                    ; 2465 _ 41: 89. 46, 40
        mov     eax, dword [rsp+7CH]                    ; 2469 _ 8B. 44 24, 7C
        mov     dword [r14+44H], eax                    ; 246D _ 41: 89. 46, 44
        mov     rax, qword [rsp+88H]                    ; 2471 _ 48: 8B. 84 24, 00000088
        mov     qword [r14+50H], rax                    ; 2479 _ 49: 89. 46, 50
        mov     rax, qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order]; 247D _ 48: 8B. 05, 00000030(rel)
        mov     rcx, qword [rsp+40H]                    ; 2484 _ 48: 8B. 4C 24, 40
        lea     rdx, [rax+1H]                           ; 2489 _ 48: 8D. 50, 01
        mov     qword [r14+48H], rax                    ; 248D _ 49: 89. 46, 48
        mov     eax, 4294967295                         ; 2491 _ B8, FFFFFFFF
        mov     qword [rel _ZZN3UCI6OptionlsERKS0_E12insert_order], rdx; 2496 _ 48: 89. 15, 00000030(rel)
        lock xadd dword [rcx-8H], eax                   ; 249D _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 24A2 _ 85. C0
        jle     ?_207                                   ; 24A4 _ 0F 8E, 0000047A
?_171:  mov     rcx, qword [rsp+70H]                    ; 24AA _ 48: 8B. 4C 24, 70
        mov     eax, 4294967295                         ; 24AF _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 24B4 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 24B9 _ 85. C0
        jle     ?_228                                   ; 24BB _ 0F 8E, 000005F0
?_172:  mov     rcx, qword [rsp+68H]                    ; 24C1 _ 48: 8B. 4C 24, 68
        mov     eax, 4294967295                         ; 24C6 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 24CB _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 24D0 _ 85. C0
        jle     ?_229                                   ; 24D2 _ 0F 8E, 000005EA
?_173:  mov     rcx, qword [rsp+60H]                    ; 24D8 _ 48: 8B. 4C 24, 60
        mov     eax, 4294967295                         ; 24DD _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 24E2 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 24E7 _ 85. C0
        jle     ?_230                                   ; 24E9 _ 0F 8E, 000005E4
?_174:  add     rsp, 152                                ; 24EF _ 48: 81. C4, 00000098
        pop     rbx                                     ; 24F6 _ 5B
        pop     rsi                                     ; 24F7 _ 5E
        pop     rdi                                     ; 24F8 _ 5F
        pop     rbp                                     ; 24F9 _ 5D
        pop     r12                                     ; 24FA _ 41: 5C
        pop     r13                                     ; 24FC _ 41: 5D
        pop     r14                                     ; 24FE _ 41: 5E
        pop     r15                                     ; 2500 _ 41: 5F
        ret                                             ; 2502 _ C3

?_175:  lea     rax, [rsp+3FH]                          ; 2503 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 2508 _ 4C: 89. FA
        mov     r9, rdi                                 ; 250B _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 250E _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 2513 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 2518 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 251F _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 2522 _ E8, 00000000(rel)
        mov     r15, rax                                ; 2527 _ 49: 89. C7
        jmp     ?_040                                   ; 252A _ E9, FFFFE50C

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_176:  lea     rax, [rsp+3FH]                          ; 2530 _ 48: 8D. 44 24, 3F
        mov     rdx, r14                                ; 2535 _ 4C: 89. F2
        mov     r9, rdi                                 ; 2538 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 253B _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 2540 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 2545 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 254C _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 254F _ E8, 00000000(rel)
        mov     r14, rax                                ; 2554 _ 49: 89. C6
        jmp     ?_170                                   ; 2557 _ E9, FFFFFEDF

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_177:  lea     rax, [rsp+3FH]                          ; 2560 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 2565 _ 4C: 89. FA
        mov     r9, rdi                                 ; 2568 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 256B _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 2570 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 2575 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 257C _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 257F _ E8, 00000000(rel)
        mov     r15, rax                                ; 2584 _ 49: 89. C7
        jmp     ?_161                                   ; 2587 _ E9, FFFFFCE3

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_178:  lea     rax, [rsp+3FH]                          ; 2590 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 2595 _ 4C: 89. FA
        mov     r9, rdi                                 ; 2598 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 259B _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 25A0 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 25A5 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 25AC _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 25AF _ E8, 00000000(rel)
        mov     r15, rax                                ; 25B4 _ 49: 89. C7
        jmp     ?_153                                   ; 25B7 _ E9, FFFFFB1F

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_179:  lea     rax, [rsp+3FH]                          ; 25C0 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 25C5 _ 4C: 89. FA
        mov     r9, rdi                                 ; 25C8 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 25CB _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 25D0 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 25D5 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 25DC _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 25DF _ E8, 00000000(rel)
        mov     r15, rax                                ; 25E4 _ 49: 89. C7
        jmp     ?_144                                   ; 25E7 _ E9, FFFFF91F

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_180:  lea     rax, [rsp+3FH]                          ; 25F0 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 25F5 _ 4C: 89. FA
        mov     r9, rdi                                 ; 25F8 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 25FB _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 2600 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 2605 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 260C _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 260F _ E8, 00000000(rel)
        mov     r15, rax                                ; 2614 _ 49: 89. C7
        jmp     ?_136                                   ; 2617 _ E9, FFFFF753

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_181:  lea     rax, [rsp+3FH]                          ; 2620 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 2625 _ 4C: 89. FA
        mov     r9, rdi                                 ; 2628 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 262B _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 2630 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 2635 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 263C _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 263F _ E8, 00000000(rel)
        mov     r15, rax                                ; 2644 _ 49: 89. C7
        jmp     ?_128                                   ; 2647 _ E9, FFFFF58F

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_182:  lea     rax, [rsp+3FH]                          ; 2650 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 2655 _ 4C: 89. FA
        mov     r9, rdi                                 ; 2658 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 265B _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 2660 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 2665 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 266C _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 266F _ E8, 00000000(rel)
        mov     r15, rax                                ; 2674 _ 49: 89. C7
        jmp     ?_119                                   ; 2677 _ E9, FFFFF38F

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_183:  lea     rax, [rsp+3FH]                          ; 2680 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 2685 _ 4C: 89. FA
        mov     r9, rdi                                 ; 2688 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 268B _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 2690 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 2695 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 269C _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 269F _ E8, 00000000(rel)
        mov     r15, rax                                ; 26A4 _ 49: 89. C7
        jmp     ?_110                                   ; 26A7 _ E9, FFFFF18F

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_184:  lea     rax, [rsp+3FH]                          ; 26B0 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 26B5 _ 4C: 89. FA
        mov     r9, rdi                                 ; 26B8 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 26BB _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 26C0 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 26C5 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 26CC _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 26CF _ E8, 00000000(rel)
        mov     r15, rax                                ; 26D4 _ 49: 89. C7
        jmp     ?_101                                   ; 26D7 _ E9, FFFFEF8F

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_185:  lea     rax, [rsp+3FH]                          ; 26E0 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 26E5 _ 4C: 89. FA
        mov     r9, rdi                                 ; 26E8 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 26EB _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 26F0 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 26F5 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 26FC _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 26FF _ E8, 00000000(rel)
        mov     r15, rax                                ; 2704 _ 49: 89. C7
        jmp     ?_092                                   ; 2707 _ E9, FFFFED8F

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_186:  lea     rax, [rsp+3FH]                          ; 2710 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 2715 _ 4C: 89. FA
        mov     r9, rdi                                 ; 2718 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 271B _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 2720 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 2725 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 272C _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 272F _ E8, 00000000(rel)
        mov     r15, rax                                ; 2734 _ 49: 89. C7
        jmp     ?_083                                   ; 2737 _ E9, FFFFEB8F

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_187:  lea     rax, [rsp+3FH]                          ; 2740 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 2745 _ 4C: 89. FA
        mov     r9, rdi                                 ; 2748 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 274B _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 2750 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 2755 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 275C _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 275F _ E8, 00000000(rel)
        mov     r15, rax                                ; 2764 _ 49: 89. C7
        jmp     ?_074                                   ; 2767 _ E9, FFFFE98F

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_188:  lea     rax, [rsp+3FH]                          ; 2770 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 2775 _ 4C: 89. FA
        mov     r9, rdi                                 ; 2778 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 277B _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 2780 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 2785 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 278C _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 278F _ E8, 00000000(rel)
        mov     r15, rax                                ; 2794 _ 49: 89. C7
        jmp     ?_066                                   ; 2797 _ E9, FFFFE7BF

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_189:  lea     rax, [rsp+3FH]                          ; 27A0 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 27A5 _ 4C: 89. FA
        mov     r9, rdi                                 ; 27A8 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 27AB _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 27B0 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 27B5 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 27BC _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 27BF _ E8, 00000000(rel)
        mov     r15, rax                                ; 27C4 _ 49: 89. C7
        jmp     ?_058                                   ; 27C7 _ E9, FFFFE60F

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_190:  lea     rax, [rsp+3FH]                          ; 27D0 _ 48: 8D. 44 24, 3F
        mov     rdx, r15                                ; 27D5 _ 4C: 89. FA
        mov     r9, rdi                                 ; 27D8 _ 49: 89. F9
        mov     qword [rsp+50H], rbx                    ; 27DB _ 48: 89. 5C 24, 50
        mov     qword [rsp+20H], rax                    ; 27E0 _ 48: 89. 44 24, 20
        lea     r8, [rel _ZStL19piecewise_construct]    ; 27E5 _ 4C: 8D. 05, 0000011F(rel)
        mov     rcx, rsi                                ; 27EC _ 48: 89. F1
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_; 27EF _ E8, 00000000(rel)
        mov     r15, rax                                ; 27F4 _ 49: 89. C7
        jmp     ?_049                                   ; 27F7 _ E9, FFFFE40F

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_191:  sub     rcx, 24                                 ; 2800 _ 48: 83. E9, 18
        mov     rdx, rbx                                ; 2804 _ 48: 89. DA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2807 _ E8, 00000000(rel)
        jmp     ?_045                                   ; 280C _ E9, FFFFE387

?_192:  sub     rcx, 24                                 ; 2811 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2815 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2818 _ E8, 00000000(rel)
        jmp     ?_131                                   ; 281D _ E9, FFFFF456

?_193:  sub     rcx, 24                                 ; 2822 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2826 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2829 _ E8, 00000000(rel)
        jmp     ?_132                                   ; 282E _ E9, FFFFF45C

?_194:  sub     rcx, 24                                 ; 2833 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2837 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 283A _ E8, 00000000(rel)
        jmp     ?_154                                   ; 283F _ E9, FFFFF906

?_195:  sub     rcx, 24                                 ; 2844 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2848 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 284B _ E8, 00000000(rel)
        jmp     ?_155                                   ; 2850 _ E9, FFFFF90C

?_196:  sub     rcx, 24                                 ; 2855 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2859 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 285C _ E8, 00000000(rel)
        jmp     ?_129                                   ; 2861 _ E9, FFFFF3E4

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_197:  sub     rcx, 24                                 ; 2870 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2874 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2877 _ E8, 00000000(rel)
        jmp     ?_130                                   ; 287C _ E9, FFFFF3E0

?_198:  sub     rcx, 24                                 ; 2881 _ 48: 83. E9, 18
        mov     rdx, rbx                                ; 2885 _ 48: 89. DA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2888 _ E8, 00000000(rel)
        jmp     ?_124                                   ; 288D _ E9, FFFFF2D3

?_199:  sub     rcx, 24                                 ; 2892 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2896 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2899 _ E8, 00000000(rel)
        jmp     ?_137                                   ; 289E _ E9, FFFFF53B

?_200:  sub     rcx, 24                                 ; 28A3 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 28A7 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 28AA _ E8, 00000000(rel)
        jmp     ?_120                                   ; 28AF _ E9, FFFFF1C6

?_201:  sub     rcx, 24                                 ; 28B4 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 28B8 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 28BB _ E8, 00000000(rel)
        jmp     ?_121                                   ; 28C0 _ E9, FFFFF1CC

?_202:  sub     rcx, 24                                 ; 28C5 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 28C9 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 28CC _ E8, 00000000(rel)
        jmp     ?_122                                   ; 28D1 _ E9, FFFFF1D2

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_203:  sub     rcx, 24                                 ; 28E0 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 28E4 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 28E7 _ E8, 00000000(rel)
        jmp     ?_123                                   ; 28EC _ E9, FFFFF1CE

?_204:  sub     rcx, 24                                 ; 28F1 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 28F5 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 28F8 _ E8, 00000000(rel)
        jmp     ?_156                                   ; 28FD _ E9, FFFFF876

?_205:  sub     rcx, 24                                 ; 2902 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2906 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2909 _ E8, 00000000(rel)
        jmp     ?_157                                   ; 290E _ E9, FFFFF87C

?_206:  sub     rcx, 24                                 ; 2913 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2917 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 291A _ E8, 00000000(rel)
        jmp     ?_162                                   ; 291F _ E9, FFFFF9BA

?_207:  sub     rcx, 24                                 ; 2924 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2928 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 292B _ E8, 00000000(rel)
        jmp     ?_171                                   ; 2930 _ E9, FFFFFB75

?_208:  sub     rcx, 24                                 ; 2935 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2939 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 293C _ E8, 00000000(rel)
        jmp     ?_102                                   ; 2941 _ E9, FFFFED94

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_209:  sub     rcx, 24                                 ; 2950 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2954 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2957 _ E8, 00000000(rel)
        jmp     ?_103                                   ; 295C _ E9, FFFFED90

?_210:  sub     rcx, 24                                 ; 2961 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2965 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2968 _ E8, 00000000(rel)
        jmp     ?_104                                   ; 296D _ E9, FFFFED96

?_211:  sub     rcx, 24                                 ; 2972 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2976 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2979 _ E8, 00000000(rel)
        jmp     ?_105                                   ; 297E _ E9, FFFFED9C

?_212:  sub     rcx, 24                                 ; 2983 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2987 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 298A _ E8, 00000000(rel)
        jmp     ?_111                                   ; 298F _ E9, FFFFEF16

?_213:  sub     rcx, 24                                 ; 2994 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2998 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 299B _ E8, 00000000(rel)
        jmp     ?_112                                   ; 29A0 _ E9, FFFFEF1C

?_214:  sub     rcx, 24                                 ; 29A5 _ 48: 83. E9, 18
        mov     rdx, rbx                                ; 29A9 _ 48: 89. DA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 29AC _ E8, 00000000(rel)
        jmp     ?_106                                   ; 29B1 _ E9, FFFFEE0F

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_215:  sub     rcx, 24                                 ; 29C0 _ 48: 83. E9, 18
        mov     rdx, rbx                                ; 29C4 _ 48: 89. DA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 29C7 _ E8, 00000000(rel)
        jmp     ?_115                                   ; 29CC _ E9, FFFFEFC4

?_216:  sub     rcx, 24                                 ; 29D1 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 29D5 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 29D8 _ E8, 00000000(rel)
        jmp     ?_095                                   ; 29DD _ E9, FFFFEB56

?_217:  sub     rcx, 24                                 ; 29E2 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 29E6 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 29E9 _ E8, 00000000(rel)
        jmp     ?_096                                   ; 29EE _ E9, FFFFEB5C

?_218:  sub     rcx, 24                                 ; 29F3 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 29F7 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 29FA _ E8, 00000000(rel)
        jmp     ?_113                                   ; 29FF _ E9, FFFFEED4

?_219:  sub     rcx, 24                                 ; 2A04 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2A08 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2A0B _ E8, 00000000(rel)
        jmp     ?_114                                   ; 2A10 _ E9, FFFFEEDA

?_220:  sub     rcx, 24                                 ; 2A15 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2A19 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2A1C _ E8, 00000000(rel)
        jmp     ?_093                                   ; 2A21 _ E9, FFFFEAE4

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_221:  sub     rcx, 24                                 ; 2A30 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2A34 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2A37 _ E8, 00000000(rel)
        jmp     ?_094                                   ; 2A3C _ E9, FFFFEAE0

?_222:  sub     rcx, 24                                 ; 2A41 _ 48: 83. E9, 18
        mov     rdx, rbx                                ; 2A45 _ 48: 89. DA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2A48 _ E8, 00000000(rel)
        jmp     ?_088                                   ; 2A4D _ E9, FFFFE9D3

?_223:  sub     rcx, 24                                 ; 2A52 _ 48: 83. E9, 18
        mov     rdx, rbx                                ; 2A56 _ 48: 89. DA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2A59 _ E8, 00000000(rel)
        jmp     ?_097                                   ; 2A5E _ E9, FFFFEB92

?_224:  sub     rcx, 24                                 ; 2A63 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2A67 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2A6A _ E8, 00000000(rel)
        jmp     ?_163                                   ; 2A6F _ E9, FFFFF881

?_225:  sub     rcx, 24                                 ; 2A74 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2A78 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2A7B _ E8, 00000000(rel)
        jmp     ?_164                                   ; 2A80 _ E9, FFFFF887

?_226:  sub     rcx, 24                                 ; 2A85 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2A89 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2A8C _ E8, 00000000(rel)
        jmp     ?_165                                   ; 2A91 _ E9, FFFFF88D

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_227:  sub     rcx, 24                                 ; 2AA0 _ 48: 83. E9, 18
        mov     rdx, rbx                                ; 2AA4 _ 48: 89. DA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2AA7 _ E8, 00000000(rel)
        jmp     ?_166                                   ; 2AAC _ E9, FFFFF918

?_228:  sub     rcx, 24                                 ; 2AB1 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2AB5 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2AB8 _ E8, 00000000(rel)
        jmp     ?_172                                   ; 2ABD _ E9, FFFFF9FF

?_229:  sub     rcx, 24                                 ; 2AC2 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2AC6 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2AC9 _ E8, 00000000(rel)
        jmp     ?_173                                   ; 2ACE _ E9, FFFFFA05

?_230:  sub     rcx, 24                                 ; 2AD3 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2AD7 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2ADA _ E8, 00000000(rel)
        jmp     ?_174                                   ; 2ADF _ E9, FFFFFA0B

?_231:  sub     rcx, 24                                 ; 2AE4 _ 48: 83. E9, 18
        mov     rdx, rbx                                ; 2AE8 _ 48: 89. DA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2AEB _ E8, 00000000(rel)
        jmp     ?_036                                   ; 2AF0 _ E9, FFFFDEC6

?_232:  sub     rcx, 24                                 ; 2AF5 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2AF9 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2AFC _ E8, 00000000(rel)
        jmp     ?_145                                   ; 2B01 _ E9, FFFFF474

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_233:  sub     rcx, 24                                 ; 2B10 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2B14 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2B17 _ E8, 00000000(rel)
        jmp     ?_146                                   ; 2B1C _ E9, FFFFF470

?_234:  sub     rcx, 24                                 ; 2B21 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2B25 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2B28 _ E8, 00000000(rel)
        jmp     ?_147                                   ; 2B2D _ E9, FFFFF476

?_235:  sub     rcx, 24                                 ; 2B32 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2B36 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2B39 _ E8, 00000000(rel)
        jmp     ?_148                                   ; 2B3E _ E9, FFFFF47C

?_236:  sub     rcx, 24                                 ; 2B43 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2B47 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2B4A _ E8, 00000000(rel)
        jmp     ?_138                                   ; 2B4F _ E9, FFFFF2A1

?_237:  sub     rcx, 24                                 ; 2B54 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2B58 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2B5B _ E8, 00000000(rel)
        jmp     ?_139                                   ; 2B60 _ E9, FFFFF2A7

?_238:  sub     rcx, 24                                 ; 2B65 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2B69 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2B6C _ E8, 00000000(rel)
        jmp     ?_140                                   ; 2B71 _ E9, FFFFF2AD

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_239:  sub     rcx, 24                                 ; 2B80 _ 48: 83. E9, 18
        mov     rdx, rbx                                ; 2B84 _ 48: 89. DA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2B87 _ E8, 00000000(rel)
        jmp     ?_149                                   ; 2B8C _ E9, FFFFF4D4

?_240:  sub     rcx, 24                                 ; 2B91 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2B95 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2B98 _ E8, 00000000(rel)
        jmp     ?_059                                   ; 2B9D _ E9, FFFFE2A8

?_241:  sub     rcx, 24                                 ; 2BA2 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2BA6 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2BA9 _ E8, 00000000(rel)
        jmp     ?_060                                   ; 2BAE _ E9, FFFFE2AE

?_242:  sub     rcx, 24                                 ; 2BB3 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2BB7 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2BBA _ E8, 00000000(rel)
        jmp     ?_061                                   ; 2BBF _ E9, FFFFE2B4

?_243:  sub     rcx, 24                                 ; 2BC4 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2BC8 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2BCB _ E8, 00000000(rel)
        jmp     ?_062                                   ; 2BD0 _ E9, FFFFE2BA

?_244:  sub     rcx, 24                                 ; 2BD5 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2BD9 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2BDC _ E8, 00000000(rel)
        jmp     ?_052                                   ; 2BE1 _ E9, FFFFE0C2

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_245:  sub     rcx, 24                                 ; 2BF0 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2BF4 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2BF7 _ E8, 00000000(rel)
        jmp     ?_053                                   ; 2BFC _ E9, FFFFE0BE

?_246:  sub     rcx, 24                                 ; 2C01 _ 48: 83. E9, 18
        mov     rdx, rbx                                ; 2C05 _ 48: 89. DA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2C08 _ E8, 00000000(rel)
        jmp     ?_054                                   ; 2C0D _ E9, FFFFE156

?_247:  sub     rcx, 24                                 ; 2C12 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2C16 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2C19 _ E8, 00000000(rel)
        jmp     ?_067                                   ; 2C1E _ E9, FFFFE3A7

?_248:  sub     rcx, 24                                 ; 2C23 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2C27 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2C2A _ E8, 00000000(rel)
        jmp     ?_041                                   ; 2C2F _ E9, FFFFDE76

?_249:  sub     rcx, 24                                 ; 2C34 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2C38 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2C3B _ E8, 00000000(rel)
        jmp     ?_042                                   ; 2C40 _ E9, FFFFDE7C

?_250:  sub     rcx, 24                                 ; 2C45 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2C49 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2C4C _ E8, 00000000(rel)
        jmp     ?_043                                   ; 2C51 _ E9, FFFFDE82

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_251:  sub     rcx, 24                                 ; 2C60 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2C64 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2C67 _ E8, 00000000(rel)
        jmp     ?_044                                   ; 2C6C _ E9, FFFFDE7E

?_252:  sub     rcx, 24                                 ; 2C71 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2C75 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2C78 _ E8, 00000000(rel)
        jmp     ?_084                                   ; 2C7D _ E9, FFFFE6B8

?_253:  sub     rcx, 24                                 ; 2C82 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2C86 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2C89 _ E8, 00000000(rel)
        jmp     ?_085                                   ; 2C8E _ E9, FFFFE6BE

?_254:  sub     rcx, 24                                 ; 2C93 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2C97 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2C9A _ E8, 00000000(rel)
        jmp     ?_086                                   ; 2C9F _ E9, FFFFE6C4

?_255:  sub     rcx, 24                                 ; 2CA4 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2CA8 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2CAB _ E8, 00000000(rel)
        jmp     ?_087                                   ; 2CB0 _ E9, FFFFE6CA

?_256:  sub     rcx, 24                                 ; 2CB5 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2CB9 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2CBC _ E8, 00000000(rel)
        jmp     ?_075                                   ; 2CC1 _ E9, FFFFE4A4

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_257:  sub     rcx, 24                                 ; 2CD0 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2CD4 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2CD7 _ E8, 00000000(rel)
        jmp     ?_076                                   ; 2CDC _ E9, FFFFE4A0

?_258:  sub     rcx, 24                                 ; 2CE1 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2CE5 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2CE8 _ E8, 00000000(rel)
        jmp     ?_070                                   ; 2CED _ E9, FFFFE31D

?_259:  sub     rcx, 24                                 ; 2CF2 _ 48: 83. E9, 18
        mov     rdx, rbx                                ; 2CF6 _ 48: 89. DA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2CF9 _ E8, 00000000(rel)
        jmp     ?_079                                   ; 2CFE _ E9, FFFFE552

?_260:  sub     rcx, 24                                 ; 2D03 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2D07 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2D0A _ E8, 00000000(rel)
        jmp     ?_068                                   ; 2D0F _ E9, FFFFE2CD

?_261:  sub     rcx, 24                                 ; 2D14 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2D18 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2D1B _ E8, 00000000(rel)
        jmp     ?_069                                   ; 2D20 _ E9, FFFFE2D3

?_262:  sub     rcx, 24                                 ; 2D25 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2D29 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2D2C _ E8, 00000000(rel)
        jmp     ?_077                                   ; 2D31 _ E9, FFFFE462

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_263:  sub     rcx, 24                                 ; 2D40 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2D44 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2D47 _ E8, 00000000(rel)
        jmp     ?_078                                   ; 2D4C _ E9, FFFFE45E

?_264:  sub     rcx, 24                                 ; 2D51 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2D55 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2D58 _ E8, 00000000(rel)
        jmp     ?_050                                   ; 2D5D _ E9, FFFFDF18

?_265:  ; Local function
        sub     rcx, 24                                 ; 2D62 _ 48: 83. E9, 18
        mov     rdx, rdi                                ; 2D66 _ 48: 89. FA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 2D69 _ E8, 00000000(rel)
        jmp     ?_051                                   ; 2D6E _ E9, FFFFDF1E

; Filling space: 0DH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH, 84H
;       db 00H, 00H, 00H, 00H, 00H

ALIGN   16

__tcf_0:; Local function
        mov     rdx, qword [rel ?_267]                  ; 2D80 _ 48: 8B. 15, 00000010(rel)
        lea     rcx, [rel Options]                      ; 2D87 _ 48: 8D. 0D, 00000000(rel)
        jmp     _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E; 2D8E _ E9, 00000000(rel)

        nop                                             ; 2D93 _ 90
        nop                                             ; 2D94 _ 90
        nop                                             ; 2D95 _ 90
        nop                                             ; 2D96 _ 90
        nop                                             ; 2D97 _ 90
        nop                                             ; 2D98 _ 90
        nop                                             ; 2D99 _ 90
        nop                                             ; 2D9A _ 90
        nop                                             ; 2D9B _ 90
        nop                                             ; 2D9C _ 90
        nop                                             ; 2D9D _ 90
        nop                                             ; 2D9E _ 90
        nop                                             ; 2D9F _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=32 noexecute                      ; section number 3, bss

Options:                                                ; byte
        resb    8                                       ; 0000

?_266:  resd    2                                       ; 0008

?_267:  resq    1                                       ; 0010

?_268:  resq    1                                       ; 0018

?_269:  resq    1                                       ; 0020

?_270:  resq    1                                       ; 0028

_ZZN3UCI6OptionlsERKS0_E12insert_order:                 ; qword
        resq    2                                       ; 0030


SECTION .text.unlikely align=16 execute                 ; section number 4, code


SECTION .xdata  align=4 noexecute                       ; section number 5, const

        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0000 _ ........
        db 01H, 00H, 00H, 00H, 01H, 0DH, 07H, 05H       ; 0008 _ ........
        db 0DH, 52H, 09H, 03H, 06H, 30H, 05H, 60H       ; 0010 _ .R...0.`
        db 04H, 70H, 03H, 0C0H, 01H, 50H, 00H, 00H      ; 0018 _ .p...P..
        db 01H, 05H, 02H, 00H, 05H, 72H, 01H, 30H       ; 0020 _ .....r.0
        db 01H, 07H, 04H, 00H, 07H, 52H, 03H, 30H       ; 0028 _ .....R.0
        db 02H, 60H, 01H, 70H, 01H, 0EH, 08H, 00H       ; 0030 _ .`.p....
        db 0EH, 32H, 0AH, 30H, 09H, 60H, 08H, 70H       ; 0038 _ .2.0.`.p
        db 07H, 50H, 06H, 0C0H, 04H, 0D0H, 02H, 0E0H    ; 0040 _ .P......
        db 01H, 0CH, 07H, 00H, 0CH, 42H, 08H, 30H       ; 0048 _ .....B.0
        db 07H, 60H, 06H, 70H, 05H, 50H, 04H, 0C0H      ; 0050 _ .`.p.P..
        db 02H, 0D0H, 00H, 00H, 01H, 08H, 05H, 00H      ; 0058 _ ........
        db 08H, 62H, 04H, 30H, 03H, 60H, 02H, 70H       ; 0060 _ .b.0.`.p
        db 01H, 50H, 00H, 00H, 01H, 08H, 05H, 00H       ; 0068 _ .P......
        db 08H, 62H, 04H, 30H, 03H, 60H, 02H, 70H       ; 0070 _ .b.0.`.p
        db 01H, 50H, 00H, 00H, 01H, 07H, 04H, 00H       ; 0078 _ .P......
        db 07H, 52H, 03H, 30H, 02H, 60H, 01H, 70H       ; 0080 _ .R.0.`.p
        db 01H, 0AH, 06H, 00H, 0AH, 92H, 06H, 30H       ; 0088 _ .......0
        db 05H, 60H, 04H, 70H, 03H, 50H, 02H, 0C0H      ; 0090 _ .`.p.P..
        db 01H, 07H, 04H, 00H, 07H, 52H, 03H, 30H       ; 0098 _ .....R.0
        db 02H, 60H, 01H, 70H, 01H, 05H, 02H, 00H       ; 00A0 _ .`.p....
        db 05H, 32H, 01H, 30H, 01H, 06H, 03H, 00H       ; 00A8 _ .2.0....
        db 06H, 42H, 02H, 30H, 01H, 60H, 00H, 00H       ; 00B0 _ .B.0.`..
        db 01H, 0CH, 07H, 00H, 0CH, 62H, 08H, 30H       ; 00B8 _ .....b.0
        db 07H, 60H, 06H, 70H, 05H, 50H, 04H, 0C0H      ; 00C0 _ .`.p.P..
        db 02H, 0D0H, 00H, 00H, 01H, 13H, 0AH, 00H      ; 00C8 _ ........
        db 13H, 01H, 13H, 00H, 0CH, 30H, 0BH, 60H       ; 00D0 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 00D8 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 00H, 00H, 00H     ; 00E0 _ ........


SECTION .rdata  align=16 noexecute                      ; section number 7, const

?_271:                                                  ; byte
        db 25H, 64H, 00H                                ; 0000 _ %d.

?_272:                                                  ; byte
        db 73H, 70H, 69H, 6EH, 00H                      ; 0003 _ spin.

?_273:                                                  ; byte
        db 73H, 74H, 6FH, 69H, 00H                      ; 0008 _ stoi.

?_274:                                                  ; byte
        db 74H, 72H, 75H, 65H, 00H                      ; 000D _ true.

?_275:                                                  ; byte
        db 0AH, 6FH, 70H, 74H, 69H, 6FH, 6EH, 20H       ; 0012 _ .option 
        db 6EH, 61H, 6DH, 65H, 20H, 00H                 ; 001A _ name .

?_276:                                                  ; byte
        db 20H, 74H, 79H, 70H, 65H, 20H, 00H            ; 0020 _  type .

?_277:                                                  ; byte
        db 62H, 75H, 74H, 74H, 6FH, 6EH, 00H            ; 0027 _ button.

?_278:                                                  ; byte
        db 20H, 64H, 65H, 66H, 61H, 75H, 6CH, 74H       ; 002E _  default
        db 20H, 00H                                     ; 0036 _  .

?_279:                                                  ; byte
        db 20H, 6DH, 69H, 6EH, 20H, 00H                 ; 0038 _  min .

?_280:                                                  ; byte
        db 20H, 6DH, 61H, 78H, 20H, 00H                 ; 003E _  max .

?_281:                                                  ; byte
        db 73H, 74H, 72H, 69H, 6EH, 67H, 00H            ; 0044 _ string.

?_282:                                                  ; byte
        db 66H, 61H, 6CH, 73H, 65H, 00H                 ; 004B _ false.

?_283:                                                  ; byte
        db 63H, 68H, 65H, 63H, 6BH, 00H                 ; 0051 _ check.

?_284:                                                  ; byte
        db 43H, 6FH, 6EH, 74H, 65H, 6DH, 70H, 74H       ; 0057 _ Contempt
        db 00H                                          ; 005F _ .

?_285:                                                  ; byte
        db 54H, 68H, 72H, 65H, 61H, 64H, 73H, 00H       ; 0060 _ Threads.

?_286:                                                  ; byte
        db 48H, 61H, 73H, 68H, 00H                      ; 0068 _ Hash.

?_287:                                                  ; byte
        db 43H, 6CH, 65H, 61H, 72H, 20H, 48H, 61H       ; 006D _ Clear Ha
        db 73H, 68H, 00H                                ; 0075 _ sh.

?_288:                                                  ; byte
        db 50H, 6FH, 6EH, 64H, 65H, 72H, 00H            ; 0078 _ Ponder.

?_289:                                                  ; byte
        db 4DH, 75H, 6CH, 74H, 69H, 50H, 56H, 00H       ; 007F _ MultiPV.

?_290:                                                  ; byte
        db 53H, 6BH, 69H, 6CH, 6CH, 20H, 4CH, 65H       ; 0087 _ Skill Le
        db 76H, 65H, 6CH, 00H                           ; 008F _ vel.

?_291:                                                  ; byte
        db 4DH, 6FH, 76H, 65H, 20H, 4FH, 76H, 65H       ; 0093 _ Move Ove
        db 72H, 68H, 65H, 61H, 64H, 00H                 ; 009B _ rhead.

?_292:                                                  ; byte
        db 4DH, 69H, 6EH, 69H, 6DH, 75H, 6DH, 20H       ; 00A1 _ Minimum 
        db 54H, 68H, 69H, 6EH, 6BH, 69H, 6EH, 67H       ; 00A9 _ Thinking
        db 20H, 54H, 69H, 6DH, 65H, 00H                 ; 00B1 _  Time.

?_293:                                                  ; byte
        db 53H, 6CH, 6FH, 77H, 20H, 4DH, 6FH, 76H       ; 00B7 _ Slow Mov
        db 65H, 72H, 00H                                ; 00BF _ er.

?_294:                                                  ; byte
        db 6EH, 6FH, 64H, 65H, 73H, 74H, 69H, 6DH       ; 00C2 _ nodestim
        db 65H, 00H                                     ; 00CA _ e.

?_295:                                                  ; byte
        db 55H, 43H, 49H, 5FH, 43H, 68H, 65H, 73H       ; 00CC _ UCI_Ches
        db 73H, 39H, 36H, 30H, 00H                      ; 00D4 _ s960.

?_296:                                                  ; byte
        db 3CH, 65H, 6DH, 70H, 74H, 79H, 3EH, 00H       ; 00D9 _ <empty>.

?_297:                                                  ; byte
        db 53H, 79H, 7AH, 79H, 67H, 79H, 50H, 61H       ; 00E1 _ SyzygyPa
        db 74H, 68H, 00H                                ; 00E9 _ th.

?_298:                                                  ; byte
        db 53H, 79H, 7AH, 79H, 67H, 79H, 50H, 72H       ; 00EC _ SyzygyPr
        db 6FH, 62H, 65H, 44H, 65H, 70H, 74H, 68H       ; 00F4 _ obeDepth
        db 00H                                          ; 00FC _ .

?_299:                                                  ; byte
        db 53H, 79H, 7AH, 79H, 67H, 79H, 35H, 30H       ; 00FD _ Syzygy50
        db 4DH, 6FH, 76H, 65H, 52H, 75H, 6CH, 65H       ; 0105 _ MoveRule
        db 00H                                          ; 010D _ .

?_300:                                                  ; byte
        db 53H, 79H, 7AH, 79H, 67H, 79H, 50H, 72H       ; 010E _ SyzygyPr
        db 6FH, 62H, 65H, 4CH, 69H, 6DH, 69H, 74H       ; 0116 _ obeLimit
        db 00H                                          ; 011E _ .

_ZStL19piecewise_construct:                             ; byte
        db 00H                                          ; 011F _ .


SECTION .text$_ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_ align=16 execute ; section number 8, code
;  Communal section not supported by YASM

.weak._ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJOSsEESE_IJEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_._ZN3UCI13on_clear_hashERKNS_6OptionE:; Function begin

_ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_:
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 72                                 ; 000C _ 48: 83. EC, 48
        mov     rbp, r9                                 ; 0010 _ 4C: 89. CD
        mov     rdi, rcx                                ; 0013 _ 48: 89. CF
        mov     ecx, 88                                 ; 0016 _ B9, 00000058
        mov     rsi, rdx                                ; 001B _ 48: 89. D6
        call    _Znwy                                   ; 001E _ E8, 00000000(rel)
        mov     r13, qword [rbp]                        ; 0023 _ 4C: 8B. 6D, 00
        lea     rbp, [rsp+3FH]                          ; 0027 _ 48: 8D. 6C 24, 3F
        xor     edx, edx                                ; 002C _ 31. D2
        mov     rbx, rax                                ; 002E _ 48: 89. C3
        xor     ecx, ecx                                ; 0031 _ 31. C9
        mov     r8, rbp                                 ; 0033 _ 49: 89. E8
        lea     r12, [rax+20H]                          ; 0036 _ 4C: 8D. 60, 20
        mov     rax, qword [r13]                        ; 003A _ 49: 8B. 45, 00
        mov     qword [rbx+20H], rax                    ; 003E _ 48: 89. 43, 20
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0042 _ E8, 00000000(rel)
        xor     edx, edx                                ; 0047 _ 31. D2
        xor     ecx, ecx                                ; 0049 _ 31. C9
        mov     r8, rbp                                 ; 004B _ 49: 89. E8
        mov     qword [r13], rax                        ; 004E _ 49: 89. 45, 00
        lea     r13, [rdi+8H]                           ; 0052 _ 4C: 8D. 6F, 08
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0056 _ E8, 00000000(rel)
        xor     edx, edx                                ; 005B _ 31. D2
        xor     ecx, ecx                                ; 005D _ 31. C9
        mov     r8, rbp                                 ; 005F _ 49: 89. E8
        mov     qword [rbx+28H], rax                    ; 0062 _ 48: 89. 43, 28
        call    _ZNSs12_S_constructEycRKSaIcE           ; 0066 _ E8, 00000000(rel)
        lea     rcx, [rbx+38H]                          ; 006B _ 48: 8D. 4B, 38
        mov     r8, rbp                                 ; 006F _ 49: 89. E8
        mov     qword [rbx+30H], rax                    ; 0072 _ 48: 89. 43, 30
        lea     rdx, [rel ?_277]                        ; 0076 _ 48: 8D. 15, 00000027(rel)
        call    _ZNSsC1EPKcRKSaIcE                      ; 007D _ E8, 00000000(rel)
        cmp     r13, rsi                                ; 0082 _ 49: 39. F5
        mov     dword [rbx+40H], 0                      ; 0085 _ C7. 43, 40, 00000000
        mov     dword [rbx+44H], 0                      ; 008C _ C7. 43, 44, 00000000
        mov     qword [rbx+50H], 0                      ; 0093 _ 48: C7. 43, 50, 00000000
        je      ?_315                                   ; 009B _ 0F 84, 00000183
        lea     r15, [rsi+20H]                          ; 00A1 _ 4C: 8D. 7E, 20
        mov     rdx, r12                                ; 00A5 _ 4C: 89. E2
        mov     rcx, rdi                                ; 00A8 _ 48: 89. F9
        mov     r8, r15                                 ; 00AB _ 4D: 89. F8
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 00AE _ E8, 000001D0(rel)
        test    al, al                                  ; 00B3 _ 84. C0
        mov     r14d, eax                               ; 00B5 _ 41: 89. C6
        je      ?_307                                   ; 00B8 _ 0F 84, 00000092
        mov     rax, qword [rdi+18H]                    ; 00BE _ 48: 8B. 47, 18
        cmp     rax, rsi                                ; 00C2 _ 48: 39. F0
        mov     qword [rsp+28H], rax                    ; 00C5 _ 48: 89. 44 24, 28
        jz      ?_301                                   ; 00CA _ 74, 2D
        mov     rcx, rsi                                ; 00CC _ 48: 89. F1
        call    _ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base; 00CF _ E8, 00000000(rel)
        mov     r8, r12                                 ; 00D4 _ 4D: 89. E0
        mov     rcx, rdi                                ; 00D7 _ 48: 89. F9
        lea     rdx, [rax+20H]                          ; 00DA _ 48: 8D. 50, 20
        mov     r14, rax                                ; 00DE _ 49: 89. C6
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 00E1 _ E8, 000001D0(rel)
        test    al, al                                  ; 00E6 _ 84. C0
        je      ?_322                                   ; 00E8 _ 0F 84, 000001A2
        cmp     qword [r14+18H], 0                      ; 00EE _ 49: 83. 7E, 18, 00
        je      ?_339                                   ; 00F3 _ 0F 84, 000002A7
?_301:  mov     r9, rsi                                 ; 00F9 _ 49: 89. F1
?_302:  test    rsi, rsi                                ; 00FC _ 48: 85. F6
        je      ?_308                                   ; 00FF _ 0F 84, 0000009F
?_303:  test    r9, r9                                  ; 0105 _ 4D: 85. C9
        jne     ?_338                                   ; 0108 _ 0F 85, 00000286
        cmp     r13, rsi                                ; 010E _ 49: 39. F5
        je      ?_338                                   ; 0111 _ 0F 84, 0000027D
?_304:  lea     r8, [rsi+20H]                           ; 0117 _ 4C: 8D. 46, 20
        mov     rdx, r12                                ; 011B _ 4C: 89. E2
        mov     rcx, rdi                                ; 011E _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 0121 _ E8, 000001D0(rel)
        mov     r14d, eax                               ; 0126 _ 41: 89. C6
?_305:  movzx   ecx, r14b                               ; 0129 _ 41: 0F B6. CE
?_306:  mov     r9, r13                                 ; 012D _ 4D: 89. E9
        mov     r8, rsi                                 ; 0130 _ 49: 89. F0
        mov     rdx, rbx                                ; 0133 _ 48: 89. DA
        call    _ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_; 0136 _ E8, 00000000(rel)
        mov     rax, rbx                                ; 013B _ 48: 89. D8
        add     qword [rdi+28H], 1                      ; 013E _ 48: 83. 47, 28, 01
        jmp     ?_314                                   ; 0143 _ E9, 000000CB

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_307:  mov     r8, r12                                 ; 0150 _ 4D: 89. E0
        mov     rdx, r15                                ; 0153 _ 4C: 89. FA
        mov     rcx, rdi                                ; 0156 _ 48: 89. F9
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 0159 _ E8, 000001D0(rel)
        test    al, al                                  ; 015E _ 84. C0
        jz      ?_309                                   ; 0160 _ 74, 4E
        cmp     qword [rdi+20H], rsi                    ; 0162 _ 48: 39. 77, 20
        je      ?_341                                   ; 0166 _ 0F 84, 00000254
        mov     rcx, rsi                                ; 016C _ 48: 89. F1
        call    _ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base; 016F _ E8, 00000000(rel)
        mov     rdx, r12                                ; 0174 _ 4C: 89. E2
        mov     rcx, rdi                                ; 0177 _ 48: 89. F9
        lea     r8, [rax+20H]                           ; 017A _ 4C: 8D. 40, 20
        mov     qword [rsp+28H], rax                    ; 017E _ 48: 89. 44 24, 28
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 0183 _ E8, 000001D0(rel)
        test    al, al                                  ; 0188 _ 84. C0
        je      ?_342                                   ; 018A _ 0F 84, 00000240
        cmp     qword [rsi+18H], 0                      ; 0190 _ 48: 83. 7E, 18, 00
        jz      ?_305                                   ; 0195 _ 74, 92
        mov     r9, qword [rsp+28H]                     ; 0197 _ 4C: 8B. 4C 24, 28
        mov     rsi, r9                                 ; 019C _ 4C: 89. CE
        jmp     ?_302                                   ; 019F _ E9, FFFFFF58

?_308:  mov     rsi, r9                                 ; 01A4 _ 4C: 89. CE
; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_309:  mov     rcx, qword [rbx+38H]                    ; 01B0 _ 48: 8B. 4B, 38
        mov     eax, 4294967295                         ; 01B4 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 01B9 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 01BE _ 85. C0
        jle     ?_337                                   ; 01C0 _ 0F 8E, 000001BD
?_310:  mov     rcx, qword [rbx+30H]                    ; 01C6 _ 48: 8B. 4B, 30
        mov     eax, 4294967295                         ; 01CA _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 01CF _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 01D4 _ 85. C0
        jle     ?_335                                   ; 01D6 _ 0F 8E, 00000185
?_311:  mov     rcx, qword [rbx+28H]                    ; 01DC _ 48: 8B. 4B, 28
        mov     eax, 4294967295                         ; 01E0 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 01E5 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 01EA _ 85. C0
        jle     ?_336                                   ; 01EC _ 0F 8E, 00000180
?_312:  mov     rcx, qword [rbx+20H]                    ; 01F2 _ 48: 8B. 4B, 20
        mov     eax, 4294967295                         ; 01F6 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 01FB _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 0200 _ 85. C0
        jle     ?_334                                   ; 0202 _ 0F 8E, 00000148
?_313:  mov     rcx, rbx                                ; 0208 _ 48: 89. D9
        call    _ZdlPv                                  ; 020B _ E8, 00000000(rel)
        mov     rax, rsi                                ; 0210 _ 48: 89. F0
?_314:  add     rsp, 72                                 ; 0213 _ 48: 83. C4, 48
        pop     rbx                                     ; 0217 _ 5B
        pop     rsi                                     ; 0218 _ 5E
        pop     rdi                                     ; 0219 _ 5F
        pop     rbp                                     ; 021A _ 5D
        pop     r12                                     ; 021B _ 41: 5C
        pop     r13                                     ; 021D _ 41: 5D
        pop     r14                                     ; 021F _ 41: 5E
        pop     r15                                     ; 0221 _ 41: 5F
        ret                                             ; 0223 _ C3

?_315:  cmp     qword [rdi+28H], 0                      ; 0224 _ 48: 83. 7F, 28, 00
        jnz     ?_320                                   ; 0229 _ 75, 45
?_316:  mov     r15, qword [rdi+10H]                    ; 022B _ 4C: 8B. 7F, 10
        test    r15, r15                                ; 022F _ 4D: 85. FF
        jnz     ?_319                                   ; 0232 _ 75, 1C
        jmp     ?_340                                   ; 0234 _ E9, 00000177

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_317:  mov     r9, qword [r15+10H]                     ; 0240 _ 4D: 8B. 4F, 10
?_318:  test    r9, r9                                  ; 0244 _ 4D: 85. C9
        je      ?_326                                   ; 0247 _ 0F 84, 00000083
        mov     r15, r9                                 ; 024D _ 4D: 89. CF
?_319:  lea     r14, [r15+20H]                          ; 0250 _ 4D: 8D. 77, 20
        mov     rdx, r12                                ; 0254 _ 4C: 89. E2
        mov     rcx, rdi                                ; 0257 _ 48: 89. F9
        mov     r8, r14                                 ; 025A _ 4D: 89. F0
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 025D _ E8, 000001D0(rel)
        test    al, al                                  ; 0262 _ 84. C0
        jnz     ?_317                                   ; 0264 _ 75, DA
        mov     r9, qword [r15+18H]                     ; 0266 _ 4D: 8B. 4F, 18
        jmp     ?_318                                   ; 026A _ EB, D8

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_320:  mov     rsi, qword [rdi+20H]                    ; 0270 _ 48: 8B. 77, 20
        mov     r8, r12                                 ; 0274 _ 4D: 89. E0
        mov     rcx, rdi                                ; 0277 _ 48: 89. F9
        lea     rdx, [rsi+20H]                          ; 027A _ 48: 8D. 56, 20
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 027E _ E8, 000001D0(rel)
        test    al, al                                  ; 0283 _ 84. C0
        jz      ?_316                                   ; 0285 _ 74, A4
?_321:  xor     r9d, r9d                                ; 0287 _ 45: 31. C9
        jmp     ?_302                                   ; 028A _ E9, FFFFFE6D

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_322:  mov     r15, qword [rdi+10H]                    ; 0290 _ 4C: 8B. 7F, 10
        test    r15, r15                                ; 0294 _ 4D: 85. FF
        jnz     ?_325                                   ; 0297 _ 75, 13
        jmp     ?_332                                   ; 0299 _ E9, 0000009E

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_323:  mov     r9, qword [r15+10H]                     ; 02A0 _ 4D: 8B. 4F, 10
?_324:  test    r9, r9                                  ; 02A4 _ 4D: 85. C9
        jz      ?_330                                   ; 02A7 _ 74, 67
        mov     r15, r9                                 ; 02A9 _ 4D: 89. CF
?_325:  lea     r14, [r15+20H]                          ; 02AC _ 4D: 8D. 77, 20
        mov     rdx, r12                                ; 02B0 _ 4C: 89. E2
        mov     rcx, rdi                                ; 02B3 _ 48: 89. F9
        mov     r8, r14                                 ; 02B6 _ 4D: 89. F0
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 02B9 _ E8, 000001D0(rel)
        test    al, al                                  ; 02BE _ 84. C0
        jnz     ?_323                                   ; 02C0 _ 75, DE
        mov     r9, qword [r15+18H]                     ; 02C2 _ 4D: 8B. 4F, 18
        jmp     ?_324                                   ; 02C6 _ EB, DC

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_326:  test    al, al                                  ; 02D0 _ 84. C0
        jz      ?_331                                   ; 02D2 _ 74, 40
?_327:  cmp     qword [rdi+18H], r15                    ; 02D4 _ 4C: 39. 7F, 18
        jz      ?_329                                   ; 02D8 _ 74, 22
?_328:  mov     rcx, r15                                ; 02DA _ 4C: 89. F9
        call    _ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base; 02DD _ E8, 00000000(rel)
        mov     r8, r12                                 ; 02E2 _ 4D: 89. E0
        mov     rcx, rdi                                ; 02E5 _ 48: 89. F9
        lea     rdx, [rax+20H]                          ; 02E8 _ 48: 8D. 50, 20
        mov     rsi, rax                                ; 02EC _ 48: 89. C6
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 02EF _ E8, 000001D0(rel)
        test    al, al                                  ; 02F4 _ 84. C0
        je      ?_309                                   ; 02F6 _ 0F 84, FFFFFEB4
?_329:  mov     rsi, r15                                ; 02FC _ 4C: 89. FE
        xor     r9d, r9d                                ; 02FF _ 45: 31. C9
        jmp     ?_302                                   ; 0302 _ E9, FFFFFDF5

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_330:  test    al, al                                  ; 0310 _ 84. C0
        jnz     ?_333                                   ; 0312 _ 75, 2C
?_331:  mov     r8, r12                                 ; 0314 _ 4D: 89. E0
        mov     rdx, r14                                ; 0317 _ 4C: 89. F2
        mov     rcx, rdi                                ; 031A _ 48: 89. F9
        mov     qword [rsp+28H], r9                     ; 031D _ 4C: 89. 4C 24, 28
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 0322 _ E8, 000001D0(rel)
        mov     rsi, r15                                ; 0327 _ 4C: 89. FE
        mov     r9, qword [rsp+28H]                     ; 032A _ 4C: 8B. 4C 24, 28
        test    al, al                                  ; 032F _ 84. C0
        je      ?_309                                   ; 0331 _ 0F 84, FFFFFE79
        jmp     ?_303                                   ; 0337 _ E9, FFFFFDC9

?_332:  mov     r15, r13                                ; 033C _ 4D: 89. EF
        nop                                             ; 033F _ 90
?_333:  cmp     r15, qword [rsp+28H]                    ; 0340 _ 4C: 3B. 7C 24, 28
        jnz     ?_328                                   ; 0345 _ 75, 93
        jmp     ?_329                                   ; 0347 _ EB, B3

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_334:  sub     rcx, 24                                 ; 0350 _ 48: 83. E9, 18
        mov     rdx, rbp                                ; 0354 _ 48: 89. EA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 0357 _ E8, 00000000(rel)
        jmp     ?_313                                   ; 035C _ E9, FFFFFEA7

?_335:  sub     rcx, 24                                 ; 0361 _ 48: 83. E9, 18
        mov     rdx, rbp                                ; 0365 _ 48: 89. EA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 0368 _ E8, 00000000(rel)
        jmp     ?_311                                   ; 036D _ E9, FFFFFE6A

?_336:  sub     rcx, 24                                 ; 0372 _ 48: 83. E9, 18
        mov     rdx, rbp                                ; 0376 _ 48: 89. EA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 0379 _ E8, 00000000(rel)
        jmp     ?_312                                   ; 037E _ E9, FFFFFE6F

?_337:  sub     rcx, 24                                 ; 0383 _ 48: 83. E9, 18
        mov     rdx, rbp                                ; 0387 _ 48: 89. EA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 038A _ E8, 00000000(rel)
        jmp     ?_310                                   ; 038F _ E9, FFFFFE32

?_338:  mov     ecx, 1                                  ; 0394 _ B9, 00000001
        jmp     ?_306                                   ; 0399 _ E9, FFFFFD8F

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_339:  xor     r9d, r9d                                ; 03A0 _ 45: 31. C9
        mov     rsi, r14                                ; 03A3 _ 4C: 89. F6
        jmp     ?_303                                   ; 03A6 _ E9, FFFFFD5A

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_340:  mov     r15, r13                                ; 03B0 _ 4D: 89. EF
        jmp     ?_327                                   ; 03B3 _ E9, FFFFFF1C

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_341:  test    rsi, rsi                                ; 03C0 _ 48: 85. F6
        jne     ?_304                                   ; 03C3 _ 0F 85, FFFFFD4E
        jmp     ?_309                                   ; 03C9 _ E9, FFFFFDE2

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_342:  mov     r15, qword [rdi+10H]                    ; 03D0 _ 4C: 8B. 7F, 10
        test    r15, r15                                ; 03D4 _ 4D: 85. FF
        jnz     ?_345                                   ; 03D7 _ 75, 13
        jmp     ?_348                                   ; 03D9 _ EB, 4F

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_343:  mov     r9, qword [r15+10H]                     ; 03E0 _ 4D: 8B. 4F, 10
?_344:  test    r9, r9                                  ; 03E4 _ 4D: 85. C9
        jz      ?_346                                   ; 03E7 _ 74, 27
        mov     r15, r9                                 ; 03E9 _ 4D: 89. CF
?_345:  lea     r14, [r15+20H]                          ; 03EC _ 4D: 8D. 77, 20
        mov     rdx, r12                                ; 03F0 _ 4C: 89. E2
        mov     rcx, rdi                                ; 03F3 _ 48: 89. F9
        mov     r8, r14                                 ; 03F6 _ 4D: 89. F0
        call    _ZNK3UCI19CaseInsensitiveLessclERKSsS2_ ; 03F9 _ E8, 000001D0(rel)
        test    al, al                                  ; 03FE _ 84. C0
        jnz     ?_343                                   ; 0400 _ 75, DE
        mov     r9, qword [r15+18H]                     ; 0402 _ 4D: 8B. 4F, 18
        jmp     ?_344                                   ; 0406 _ EB, DC

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_346:  test    al, al                                  ; 0410 _ 84. C0
        je      ?_331                                   ; 0412 _ 0F 84, FFFFFEFC
?_347:  mov     rsi, qword [rdi+18H]                    ; 0418 _ 48: 8B. 77, 18
        cmp     r15, rsi                                ; 041C _ 49: 39. F7
        jne     ?_328                                   ; 041F _ 0F 85, FFFFFEB5
        jmp     ?_321                                   ; 0425 _ E9, FFFFFE5D
; .weak._ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJOSsEESE_IJEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_._ZN3UCI13on_clear_hashERKNS_6OptionE End of function

?_348:  ; Local function
        mov     r15, r13                                ; 042A _ 4D: 89. EF
        jmp     ?_347                                   ; 042D _ EB, E9

        nop                                             ; 042F _ 90


SECTION .xdata$_ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIOSsEESE_IIEEEEESt17_Rb_tree_iteratorIS4_ESt23_Rb_tree_const_iteratorIS4_EDpOT_ align=4 noexecute ; section number 9, const
;  Communal section not supported by YASM

        db 01H, 10H, 09H, 00H, 10H, 82H, 0CH, 30H       ; 0000 _ .......0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .text$_ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E align=16 execute ; section number 11, code
;  Communal section not supported by YASM

_ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E:; Function begin
        push    rbp                                     ; 0000 _ 55
        push    rdi                                     ; 0001 _ 57
        push    rsi                                     ; 0002 _ 56
        push    rbx                                     ; 0003 _ 53
        sub     rsp, 56                                 ; 0004 _ 48: 83. EC, 38
        test    rdx, rdx                                ; 0008 _ 48: 85. D2
        mov     rdi, rcx                                ; 000B _ 48: 89. CF
        mov     rbx, rdx                                ; 000E _ 48: 89. D3
        lea     rbp, [rsp+2FH]                          ; 0011 _ 48: 8D. 6C 24, 2F
        jnz     ?_352                                   ; 0016 _ 75, 56
        jmp     ?_354                                   ; 0018 _ E9, 000000A3

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_349:  mov     rcx, qword [rbx+30H]                    ; 0020 _ 48: 8B. 4B, 30
        mov     eax, 4294967295                         ; 0024 _ B8, FFFFFFFF
        lock xadd dword [rcx-8H], eax                   ; 0029 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 002E _ 85. C0
        jle     ?_356                                   ; 0030 _ 0F 8E, 000000AB
?_350:  mov     rax, qword [rbx+28H]                    ; 0036 _ 48: 8B. 43, 28
        mov     edx, 4294967295                         ; 003A _ BA, FFFFFFFF
        lock xadd dword [rax-8H], edx                   ; 003F _ F0: 0F C1. 50, F8
        test    edx, edx                                ; 0044 _ 85. D2
        jle     ?_355                                   ; 0046 _ 0F 8E, 00000084
?_351:  mov     rax, qword [rbx+20H]                    ; 004C _ 48: 8B. 43, 20
        mov     edx, 4294967295                         ; 0050 _ BA, FFFFFFFF
        lock xadd dword [rax-8H], edx                   ; 0055 _ F0: 0F C1. 50, F8
        test    edx, edx                                ; 005A _ 85. D2
        jle     ?_353                                   ; 005C _ 7E, 42
        mov     rcx, rbx                                ; 005E _ 48: 89. D9
        mov     rbx, rsi                                ; 0061 _ 48: 89. F3
        call    _ZdlPv                                  ; 0064 _ E8, 00000000(rel)
        test    rsi, rsi                                ; 0069 _ 48: 85. F6
        jz      ?_354                                   ; 006C _ 74, 52
?_352:  mov     rdx, qword [rbx+18H]                    ; 006E _ 48: 8B. 53, 18
        mov     rcx, rdi                                ; 0072 _ 48: 89. F9
        call    _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E; 0075 _ E8, FFFFFF86
        mov     rsi, qword [rbx+10H]                    ; 007A _ 48: 8B. 73, 10
        mov     eax, 4294967295                         ; 007E _ B8, FFFFFFFF
        mov     rcx, qword [rbx+38H]                    ; 0083 _ 48: 8B. 4B, 38
        lock xadd dword [rcx-8H], eax                   ; 0087 _ F0: 0F C1. 41, F8
        test    eax, eax                                ; 008C _ 85. C0
        jg      ?_349                                   ; 008E _ 7F, 90
        sub     rcx, 24                                 ; 0090 _ 48: 83. E9, 18
        mov     rdx, rbp                                ; 0094 _ 48: 89. EA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 0097 _ E8, 00000000(rel)
        jmp     ?_349                                   ; 009C _ EB, 82

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_353:  lea     rcx, [rax-18H]                          ; 00A0 _ 48: 8D. 48, E8
        mov     rdx, rbp                                ; 00A4 _ 48: 89. EA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 00A7 _ E8, 00000000(rel)
        mov     rcx, rbx                                ; 00AC _ 48: 89. D9
        mov     rbx, rsi                                ; 00AF _ 48: 89. F3
        call    _ZdlPv                                  ; 00B2 _ E8, 00000000(rel)
        test    rsi, rsi                                ; 00B7 _ 48: 85. F6
        jnz     ?_352                                   ; 00BA _ 75, B2
; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_354:  add     rsp, 56                                 ; 00C0 _ 48: 83. C4, 38
        pop     rbx                                     ; 00C4 _ 5B
        pop     rsi                                     ; 00C5 _ 5E
        pop     rdi                                     ; 00C6 _ 5F
        pop     rbp                                     ; 00C7 _ 5D
        ret                                             ; 00C8 _ C3

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_355:  lea     rcx, [rax-18H]                          ; 00D0 _ 48: 8D. 48, E8
        mov     rdx, rbp                                ; 00D4 _ 48: 89. EA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 00D7 _ E8, 00000000(rel)
        jmp     ?_351                                   ; 00DC _ E9, FFFFFF6B
; _ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E End of function

?_356:  ; Local function
        sub     rcx, 24                                 ; 00E1 _ 48: 83. E9, 18
        mov     rdx, rbp                                ; 00E5 _ 48: 89. EA
        call    _ZNSs4_Rep10_M_destroyERKSaIcE          ; 00E8 _ E8, 00000000(rel)
        jmp     ?_350                                   ; 00ED _ E9, FFFFFF44

        nop                                             ; 00F2 _ 90
        nop                                             ; 00F3 _ 90
        nop                                             ; 00F4 _ 90
        nop                                             ; 00F5 _ 90
        nop                                             ; 00F6 _ 90
        nop                                             ; 00F7 _ 90
        nop                                             ; 00F8 _ 90
        nop                                             ; 00F9 _ 90
        nop                                             ; 00FA _ 90
        nop                                             ; 00FB _ 90
        nop                                             ; 00FC _ 90
        nop                                             ; 00FD _ 90
        nop                                             ; 00FE _ 90
        nop                                             ; 00FF _ 90


SECTION .xdata$_ZNSt8_Rb_treeISsSt4pairIKSsN3UCI6OptionEESt10_Select1stIS4_ENS2_19CaseInsensitiveLessESaIS4_EE8_M_eraseEPSt13_Rb_tree_nodeIS4_E align=4 noexecute ; section number 12, const
;  Communal section not supported by YASM

        db 01H, 08H, 05H, 00H, 08H, 62H, 04H, 30H       ; 0000 _ .....b.0
        db 03H, 60H, 02H, 70H, 01H, 50H, 00H, 00H       ; 0008 _ .`.p.P..


SECTION .text.startup align=16 execute                  ; section number 14, code

.text.startup:; Local function
_GLOBAL__sub_I_Options:
        lea     rax, [rel ?_266]                        ; 0000 _ 48: 8D. 05, 00000008(rel)
        mov     dword [rel ?_266], 0                    ; 0007 _ C7. 05, 00000004(rel), 00000000
        lea     rcx, [rel __tcf_0]                      ; 0011 _ 48: 8D. 0D, 00002D80(rel)
        mov     qword [rel ?_268], rax                  ; 0018 _ 48: 89. 05, 00000018(rel)
        mov     qword [rel ?_267], 0                    ; 001F _ 48: C7. 05, 0000000C(rel), 00000000
        mov     qword [rel ?_270], 0                    ; 002A _ 48: C7. 05, 00000024(rel), 00000000
        mov     qword [rel ?_269], rax                  ; 0035 _ 48: 89. 05, 00000020(rel)
        jmp     atexit                                  ; 003C _ E9, 00000000(rel)

        nop                                             ; 0041 _ 90
        nop                                             ; 0042 _ 90
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


SECTION .xdata.startup align=4 noexecute                ; section number 15, const

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .ctors  align=8 noexecute                       ; section number 17, data

        dq _GLOBAL__sub_I_Options                       ; 0000 _ 0000000000000000 (d)


SECTION .rdata$zzz align=16 noexecute                   ; section number 18, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr.TT align=16 noexecute            ; section number 19, const
;  Communal section not supported by YASM

.refptr.TT:                                             ; qword
        dq TT                                           ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.Threads align=16 noexecute       ; section number 20, const
;  Communal section not supported by YASM

.refptr.Threads:                                        ; qword
        dq Threads                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


