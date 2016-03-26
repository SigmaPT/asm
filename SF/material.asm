; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\material.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: BMI etc., x64

default rel

global _ZN8Material5probeERK8Position: function
global .weak._ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJRS1_EESK_IJEEEEESt17_Rb_tree_iteratorIS9_ESt23_Rb_tree_const_iteratorIS9_EDpOT_._ZN8Material5probeERK8Position
global _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIRS1_EESK_IIEEEEESt17_Rb_tree_iteratorIS9_ESt23_Rb_tree_const_iteratorIS9_EDpOT_: function
global _ZN7EndgameIL11EndgameType21E11ScaleFactorED1Ev: function
global _ZN7EndgameIL11EndgameType15E11ScaleFactorED1Ev: function
global _ZN7EndgameIL11EndgameType11E11ScaleFactorED1Ev: function
global _ZN7EndgameIL11EndgameType10E11ScaleFactorED1Ev: function
global _ZN7EndgameIL11EndgameType1E5ValueED1Ev: function
global _ZNK7EndgameIL11EndgameType10E11ScaleFactorE11strong_sideEv: function
global _ZNK7EndgameIL11EndgameType1E5ValueE11strong_sideEv: function
global _ZN7EndgameIL11EndgameType1E5ValueED0Ev: function
global _ZN7EndgameIL11EndgameType10E11ScaleFactorED0Ev: function
global _ZN7EndgameIL11EndgameType11E11ScaleFactorED0Ev: function
global _ZN7EndgameIL11EndgameType15E11ScaleFactorED0Ev: function
global _ZN7EndgameIL11EndgameType21E11ScaleFactorED0Ev: function
global _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_: function
global _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_: function
global _ZNK7EndgameIL11EndgameType15E11ScaleFactorE11strong_sideEv: function
global _ZNK7EndgameIL11EndgameType21E11ScaleFactorE11strong_sideEv: function
global _ZNK7EndgameIL11EndgameType11E11ScaleFactorE11strong_sideEv: function
global _ZTV7EndgameIL11EndgameType1E5ValueE
global _ZTV7EndgameIL11EndgameType10E11ScaleFactorE
global _ZTV7EndgameIL11EndgameType11E11ScaleFactorE
global _ZTV7EndgameIL11EndgameType15E11ScaleFactorE
global _ZTV7EndgameIL11EndgameType21E11ScaleFactorE

extern _ZNK7EndgameIL11EndgameType21E11ScaleFactorEclERK8Position ; near
extern _ZNK7EndgameIL11EndgameType15E11ScaleFactorEclERK8Position ; near
extern _ZNK7EndgameIL11EndgameType11E11ScaleFactorEclERK8Position ; near
extern _ZNK7EndgameIL11EndgameType10E11ScaleFactorEclERK8Position ; near
extern _ZNK7EndgameIL11EndgameType1E5ValueEclERK8Position ; near
extern _ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base  ; near
extern _ZdlPv                                           ; near
extern _ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base  ; near
extern _ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_ ; near
extern _Znwy                                            ; near
extern _ZNK8Position10game_phaseEv                      ; near
extern atexit                                           ; near


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function
__tcf_4:sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     rax, qword [rel ?_003]                  ; 0004 _ 48: 8B. 05, 00000010(rel)
        lea     rcx, [rel ?_003]                        ; 000B _ 48: 8D. 0D, 00000010(rel)
        call    near [rax]                              ; 0012 _ FF. 10
        mov     rdx, qword [rel _ZN12_GLOBAL__N_19ScaleKPKPE]; 0014 _ 48: 8B. 15, 00000000(rel)
        lea     rcx, [rel _ZN12_GLOBAL__N_19ScaleKPKPE] ; 001B _ 48: 8D. 0D, 00000000(rel)
        mov     r8, qword [rdx]                         ; 0022 _ 4C: 8B. 02
        add     rsp, 40                                 ; 0025 _ 48: 83. C4, 28
; Note: Prefix bit or byte has no meaning in this context
        jmp     r8                                      ; 0029 _ 49: FF. E0

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

__tcf_3:; Local function
        sub     rsp, 40                                 ; 0030 _ 48: 83. EC, 28
        mov     rax, qword [rel ?_008]                  ; 0034 _ 48: 8B. 05, 00000030(rel)
        lea     rcx, [rel ?_008]                        ; 003B _ 48: 8D. 0D, 00000030(rel)
        call    near [rax]                              ; 0042 _ FF. 10
        mov     rdx, qword [rel _ZN12_GLOBAL__N_19ScaleKPsKE]; 0044 _ 48: 8B. 15, 00000020(rel)
        lea     rcx, [rel _ZN12_GLOBAL__N_19ScaleKPsKE] ; 004B _ 48: 8D. 0D, 00000020(rel)
        mov     r8, qword [rdx]                         ; 0052 _ 4C: 8B. 02
        add     rsp, 40                                 ; 0055 _ 48: 83. C4, 28
; Note: Prefix bit or byte has no meaning in this context
        jmp     r8                                      ; 0059 _ 49: FF. E0

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

__tcf_2:; Local function
        sub     rsp, 40                                 ; 0060 _ 48: 83. EC, 28
        mov     rax, qword [rel ?_013]                  ; 0064 _ 48: 8B. 05, 00000050(rel)
        lea     rcx, [rel ?_013]                        ; 006B _ 48: 8D. 0D, 00000050(rel)
        call    near [rax]                              ; 0072 _ FF. 10
        mov     rdx, qword [rel _ZN12_GLOBAL__N_111ScaleKQKRPsE]; 0074 _ 48: 8B. 15, 00000040(rel)
        lea     rcx, [rel _ZN12_GLOBAL__N_111ScaleKQKRPsE]; 007B _ 48: 8D. 0D, 00000040(rel)
        mov     r8, qword [rdx]                         ; 0082 _ 4C: 8B. 02
        add     rsp, 40                                 ; 0085 _ 48: 83. C4, 28
; Note: Prefix bit or byte has no meaning in this context
        jmp     r8                                      ; 0089 _ 49: FF. E0

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

__tcf_1:; Local function
        sub     rsp, 40                                 ; 0090 _ 48: 83. EC, 28
        mov     rax, qword [rel ?_018]                  ; 0094 _ 48: 8B. 05, 00000070(rel)
        lea     rcx, [rel ?_018]                        ; 009B _ 48: 8D. 0D, 00000070(rel)
        call    near [rax]                              ; 00A2 _ FF. 10
        mov     rdx, qword [rel _ZN12_GLOBAL__N_110ScaleKBPsKE]; 00A4 _ 48: 8B. 15, 00000060(rel)
        lea     rcx, [rel _ZN12_GLOBAL__N_110ScaleKBPsKE]; 00AB _ 48: 8D. 0D, 00000060(rel)
        mov     r8, qword [rdx]                         ; 00B2 _ 4C: 8B. 02
        add     rsp, 40                                 ; 00B5 _ 48: 83. C4, 28
; Note: Prefix bit or byte has no meaning in this context
        jmp     r8                                      ; 00B9 _ 49: FF. E0

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

__tcf_0:; Local function
        sub     rsp, 40                                 ; 00C0 _ 48: 83. EC, 28
        mov     rax, qword [rel ?_023]                  ; 00C4 _ 48: 8B. 05, 00000090(rel)
        lea     rcx, [rel ?_023]                        ; 00CB _ 48: 8D. 0D, 00000090(rel)
        call    near [rax]                              ; 00D2 _ FF. 10
        mov     rdx, qword [rel _ZN12_GLOBAL__N_111EvaluateKXKE]; 00D4 _ 48: 8B. 15, 00000080(rel)
        lea     rcx, [rel _ZN12_GLOBAL__N_111EvaluateKXKE]; 00DB _ 48: 8D. 0D, 00000080(rel)
        mov     r8, qword [rdx]                         ; 00E2 _ 4C: 8B. 02
        add     rsp, 40                                 ; 00E5 _ 48: 83. C4, 28
; Note: Prefix bit or byte has no meaning in this context
        jmp     r8                                      ; 00E9 _ 49: FF. E0

        nop                                             ; 00EC _ 90
        nop                                             ; 00ED _ 90
        nop                                             ; 00EE _ 90
        nop                                             ; 00EF _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=32 noexecute                      ; section number 3, bss

_ZN12_GLOBAL__N_19ScaleKPKPE:                           ; qword
        resq    1                                       ; 0000

?_001:  resd    1                                       ; 0008

?_002:  resd    1                                       ; 000C

?_003:  resq    1                                       ; 0010

?_004:  resd    1                                       ; 0018

?_005:  resd    1                                       ; 001C

_ZN12_GLOBAL__N_19ScaleKPsKE:                           ; qword
        resq    1                                       ; 0020

?_006:  resd    1                                       ; 0028

?_007:  resd    1                                       ; 002C

?_008:  resq    1                                       ; 0030

?_009:  resd    1                                       ; 0038

?_010:  resd    1                                       ; 003C

_ZN12_GLOBAL__N_111ScaleKQKRPsE:                        ; qword
        resq    1                                       ; 0040

?_011:  resd    1                                       ; 0048

?_012:  resd    1                                       ; 004C

?_013:  resq    1                                       ; 0050

?_014:  resd    1                                       ; 0058

?_015:  resd    1                                       ; 005C

_ZN12_GLOBAL__N_110ScaleKBPsKE:                         ; qword
        resq    1                                       ; 0060

?_016:  resd    1                                       ; 0068

?_017:  resd    1                                       ; 006C

?_018:  resq    1                                       ; 0070

?_019:  resd    1                                       ; 0078

?_020:  resd    1                                       ; 007C

_ZN12_GLOBAL__N_111EvaluateKXKE:                        ; qword
        resq    1                                       ; 0080

?_021:  resd    1                                       ; 0088

?_022:  resd    1                                       ; 008C

?_023:  resq    1                                       ; 0090

?_024:  resd    1                                       ; 0098

?_025:  resd    1                                       ; 009C


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_ZN8Material5probeERK8Position.cold.66:
        mov     rax, qword [rsi+108H]                   ; 0000 _ 48: 8B. 86, 00000108
        jmp     ?_059                                   ; 0007 _ E9, 000001C0(rel)

        mov     r15, qword [rsi+140H]                   ; 000C _ 4C: 8B. BE, 00000140
        mov     rdx, qword [rsi+148H]                   ; 0013 _ 48: 8B. 96, 00000148
        jmp     ?_058                                   ; 001A _ E9, 0000018F(rel)

        lea     rdx, [rsp+57H]                          ; 001F _ 48: 8D. 54 24, 57
        lea     rbp, [rsp+58H]                          ; 0024 _ 48: 8D. 6C 24, 58
        mov     qword [rsp+20H], rdx                    ; 0029 _ 48: 89. 54 24, 20
        mov     rdx, rax                                ; 002E _ 48: 89. C2
        lea     rcx, [rdi+0A8H]                         ; 0031 _ 48: 8D. 8F, 000000A8
        mov     qword [rsp+60H], rbp                    ; 0038 _ 48: 89. 6C 24, 60
        lea     r9, [rsp+60H]                           ; 003D _ 4C: 8D. 4C 24, 60
        lea     r8, [rel _ZStL19piecewise_construct]    ; 0042 _ 4C: 8D. 05, 00000198(rel)
        call    _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIRS1_EESK_IIEEEEESt17_Rb_tree_iteratorIS9_ESt23_Rb_tree_const_iteratorIS9_EDpOT_; 0049 _ E8, 00000000(rel)
        jmp     .text.hot+48AH                          ; 004E _ E9, 0000048A(rel)

        lea     r13, [r12+78H]                          ; 0053 _ 4D: 8D. 6C 24, 78
        mov     ecx, 48                                 ; 0058 _ B9, 00000030
        call    _Znwy                                   ; 005D _ E8, 00000000(rel)
        mov     qword [rax+20H], rbp                    ; 0062 _ 48: 89. 68, 20
        lea     r8, [rax+20H]                           ; 0066 _ 4C: 8D. 40, 20
        mov     r15, rax                                ; 006A _ 49: 89. C7
        cmp     qword [r12+0A0H], 0                     ; 006D _ 49: 83. BC 24, 000000A0, 00
        mov     qword [rax+28H], 0                      ; 0076 _ 48: C7. 40, 28, 00000000
        je      ?_032                                   ; 007E _ 0F 84, 000000E0
        mov     rax, qword [r12+98H]                    ; 0084 _ 49: 8B. 84 24, 00000098
        cmp     rbp, qword [rax+20H]                    ; 008C _ 48: 3B. 68, 20
        jbe     ?_032                                   ; 0090 _ 0F 86, 000000CE
?_026:  mov     r8, r15                                 ; 0096 _ 4D: 89. F8
        mov     r13, rax                                ; 0099 _ 49: 89. C5
?_027:  test    rdi, rdi                                ; 009C _ 48: 85. FF
        jne     ?_031                                   ; 009F _ 0F 85, 000000B4
        cmp     r13, r14                                ; 00A5 _ 4D: 39. F5
        je      ?_031                                   ; 00A8 _ 0F 84, 000000AB
        mov     rax, qword [r13+20H]                    ; 00AE _ 49: 8B. 45, 20
        cmp     qword [r15+20H], rax                    ; 00B2 _ 49: 39. 47, 20
        setb    r9b                                     ; 00B6 _ 41: 0F 92. C1
?_028:  movzx   ecx, r9b                                ; 00BA _ 41: 0F B6. C9
        mov     qword [rsp+30H], r8                     ; 00BE _ 4C: 89. 44 24, 30
        mov     r9, r14                                 ; 00C3 _ 4D: 89. F1
        mov     r8, r13                                 ; 00C6 _ 4D: 89. E8
        mov     rdx, r15                                ; 00C9 _ 4C: 89. FA
        call    _ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_; 00CC _ E8, 00000000(rel)
        mov     rcx, qword [rsp+30H]                    ; 00D1 _ 48: 8B. 4C 24, 30
        add     qword [r12+0A0H], 1                     ; 00D6 _ 49: 83. 84 24, 000000A0, 01
?_029:  mov     r13, rcx                                ; 00DF _ 49: 89. CD
        jmp     .text.hot+16AH                          ; 00E2 _ E9, 0000016A(rel)

; Note: No jump seems to point here
        lea     r10, [r12+78H]                          ; 00E7 _ 4D: 8D. 54 24, 78
        mov     ecx, 48                                 ; 00EC _ B9, 00000030
        mov     qword [rsp+30H], r10                    ; 00F1 _ 4C: 89. 54 24, 30
        call    _Znwy                                   ; 00F6 _ E8, 00000000(rel)
        mov     qword [rax+20H], rbp                    ; 00FB _ 48: 89. 68, 20
        cmp     rbp, qword [r13+20H]                    ; 00FF _ 49: 3B. 6D, 20
        mov     r15, rax                                ; 0103 _ 49: 89. C7
        mov     qword [rax+28H], 0                      ; 0106 _ 48: C7. 40, 28, 00000000
        lea     r11, [rax+20H]                          ; 010E _ 4C: 8D. 58, 20
        jnc     ?_038                                   ; 0112 _ 0F 83, 000000A7
        cmp     qword [r12+90H], r13                    ; 0118 _ 4D: 39. AC 24, 00000090
        mov     qword [rsp+38H], r11                    ; 0120 _ 4C: 89. 5C 24, 38
        je      ?_037                                   ; 0125 _ 0F 84, 0000008F
        mov     rcx, r13                                ; 012B _ 4C: 89. E9
        call    _ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base; 012E _ E8, 00000000(rel)
        mov     r8, qword [rsp+38H]                     ; 0133 _ 4C: 8B. 44 24, 38
        cmp     rbp, qword [rax+20H]                    ; 0138 _ 48: 3B. 68, 20
        jbe     ?_036                                   ; 013C _ 76, 61
        cmp     qword [rax+18H], 0                      ; 013E _ 48: 83. 78, 18, 00
        je      ?_026                                   ; 0143 _ 0F 84, FFFFFF4D
        mov     rdi, r13                                ; 0149 _ 4C: 89. EF
?_030:  test    r13, r13                                ; 014C _ 4D: 85. ED
        jz      ?_034                                   ; 014F _ 74, 2F
        mov     r8, r15                                 ; 0151 _ 4D: 89. F8
        jmp     ?_027                                   ; 0154 _ E9, FFFFFF43

?_031:  mov     r9d, 1                                  ; 0159 _ 41: B9, 00000001
        jmp     ?_028                                   ; 015F _ E9, FFFFFF56

?_032:  lea     rcx, [rsp+40H]                          ; 0164 _ 48: 8D. 4C 24, 40
        mov     rdx, r13                                ; 0169 _ 4C: 89. EA
        call    _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_; 016C _ E8, 00000000(rel)
        mov     rdi, qword [rsp+40H]                    ; 0171 _ 48: 8B. 7C 24, 40
        mov     r13, qword [rsp+48H]                    ; 0176 _ 4C: 8B. 6C 24, 48
        jmp     ?_030                                   ; 017B _ EB, CF

?_033:  mov     rdi, r13                                ; 017D _ 4C: 89. EF
?_034:  mov     rcx, qword [r15+28H]                    ; 0180 _ 49: 8B. 4F, 28
        test    rcx, rcx                                ; 0184 _ 48: 85. C9
        jz      ?_035                                   ; 0187 _ 74, 06
        mov     rdx, qword [rcx]                        ; 0189 _ 48: 8B. 11
        call    near [rdx+8H]                           ; 018C _ FF. 52, 08
?_035:  mov     rcx, r15                                ; 018F _ 4C: 89. F9
        call    _ZdlPv                                  ; 0192 _ E8, 00000000(rel)
        mov     rcx, rdi                                ; 0197 _ 48: 89. F9
        jmp     ?_029                                   ; 019A _ E9, FFFFFF40

?_036:  mov     rdx, qword [rsp+30H]                    ; 019F _ 48: 8B. 54 24, 30
        lea     rcx, [rsp+40H]                          ; 01A4 _ 48: 8D. 4C 24, 40
        call    _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_; 01A9 _ E8, 00000000(rel)
        mov     rdi, qword [rsp+40H]                    ; 01AE _ 48: 8B. 7C 24, 40
        mov     r13, qword [rsp+48H]                    ; 01B3 _ 4C: 8B. 6C 24, 48
        jmp     ?_030                                   ; 01B8 _ EB, 92

?_037:  mov     rdi, r13                                ; 01BA _ 4C: 89. EF
        jmp     ?_030                                   ; 01BD _ EB, 8D

?_038:  ; Local function
        jbe     ?_033                                   ; 01BF _ 76, BC
        cmp     qword [r12+98H], r13                    ; 01C1 _ 4D: 39. AC 24, 00000098
        mov     qword [rsp+38H], r11                    ; 01C9 _ 4C: 89. 5C 24, 38
        je      ?_030                                   ; 01CE _ 0F 84, FFFFFF78
        mov     rcx, r13                                ; 01D4 _ 4C: 89. E9
        call    _ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base; 01D7 _ E8, 00000000(rel)
        mov     r8, qword [rsp+38H]                     ; 01DC _ 4C: 8B. 44 24, 38
        cmp     rbp, qword [rax+20H]                    ; 01E1 _ 48: 3B. 68, 20
        jnc     ?_039                                   ; 01E5 _ 73, 13
        cmp     qword [r13+18H], 0                      ; 01E7 _ 49: 83. 7D, 18, 00
        je      ?_030                                   ; 01EC _ 0F 84, FFFFFF5A
        mov     rdi, rax                                ; 01F2 _ 48: 89. C7
        jmp     ?_026                                   ; 01F5 _ E9, FFFFFE9C

?_039:  ; Local function
        mov     rdx, qword [rsp+30H]                    ; 01FA _ 48: 8B. 54 24, 30
        lea     rcx, [rsp+40H]                          ; 01FF _ 48: 8D. 4C 24, 40
        call    _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_; 0204 _ E8, 00000000(rel)
        mov     rdi, qword [rsp+40H]                    ; 0209 _ 48: 8B. 7C 24, 40
        mov     r13, qword [rsp+48H]                    ; 020E _ 4C: 8B. 6C 24, 48
        jmp     ?_030                                   ; 0213 _ E9, FFFFFF34

        nop                                             ; 0218 _ 90
        nop                                             ; 0219 _ 90
        nop                                             ; 021A _ 90
        nop                                             ; 021B _ 90
        nop                                             ; 021C _ 90
        nop                                             ; 021D _ 90
        nop                                             ; 021E _ 90
        nop                                             ; 021F _ 90


SECTION .text.startup align=16 execute                  ; section number 5, code

.text.startup:; Local function
_GLOBAL__sub_I__ZN8Material5probeERK8Position:
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        lea     rax, [rel _ZTV7EndgameIL11EndgameType1E5ValueE+10H]; 0004 _ 48: 8D. 05, 00000010(rel)
        mov     dword [rel ?_021], 0                    ; 000B _ C7. 05, 00000084(rel), 00000000
        lea     rcx, [rel __tcf_0]                      ; 0015 _ 48: 8D. 0D, 000000C0(rel)
        mov     qword [rel _ZN12_GLOBAL__N_111EvaluateKXKE], rax; 001C _ 48: 89. 05, 00000080(rel)
        mov     dword [rel ?_022], 1                    ; 0023 _ C7. 05, 00000088(rel), 00000001
        mov     qword [rel ?_023], rax                  ; 002D _ 48: 89. 05, 00000090(rel)
        mov     dword [rel ?_024], 1                    ; 0034 _ C7. 05, 00000094(rel), 00000001
        mov     dword [rel ?_025], 0                    ; 003E _ C7. 05, 00000098(rel), 00000000
        call    atexit                                  ; 0048 _ E8, 00000000(rel)
        lea     rdx, [rel _ZTV7EndgameIL11EndgameType10E11ScaleFactorE+10H]; 004D _ 48: 8D. 15, 00000010(rel)
        mov     dword [rel ?_016], 0                    ; 0054 _ C7. 05, 00000064(rel), 00000000
        lea     rcx, [rel __tcf_1]                      ; 005E _ 48: 8D. 0D, 00000090(rel)
        mov     qword [rel _ZN12_GLOBAL__N_110ScaleKBPsKE], rdx; 0065 _ 48: 89. 15, 00000060(rel)
        mov     qword [rel ?_018], rdx                  ; 006C _ 48: 89. 15, 00000070(rel)
        mov     dword [rel ?_017], 1                    ; 0073 _ C7. 05, 00000068(rel), 00000001
        mov     dword [rel ?_019], 1                    ; 007D _ C7. 05, 00000074(rel), 00000001
        mov     dword [rel ?_020], 0                    ; 0087 _ C7. 05, 00000078(rel), 00000000
        call    atexit                                  ; 0091 _ E8, 00000000(rel)
        lea     rcx, [rel _ZTV7EndgameIL11EndgameType11E11ScaleFactorE+10H]; 0096 _ 48: 8D. 0D, 00000010(rel)
        mov     dword [rel ?_011], 0                    ; 009D _ C7. 05, 00000044(rel), 00000000
        mov     qword [rel _ZN12_GLOBAL__N_111ScaleKQKRPsE], rcx; 00A7 _ 48: 89. 0D, 00000040(rel)
        mov     qword [rel ?_013], rcx                  ; 00AE _ 48: 89. 0D, 00000050(rel)
        lea     rcx, [rel __tcf_2]                      ; 00B5 _ 48: 8D. 0D, 00000060(rel)
        mov     dword [rel ?_012], 1                    ; 00BC _ C7. 05, 00000048(rel), 00000001
        mov     dword [rel ?_014], 1                    ; 00C6 _ C7. 05, 00000054(rel), 00000001
        mov     dword [rel ?_015], 0                    ; 00D0 _ C7. 05, 00000058(rel), 00000000
        call    atexit                                  ; 00DA _ E8, 00000000(rel)
        lea     r8, [rel _ZTV7EndgameIL11EndgameType15E11ScaleFactorE+10H]; 00DF _ 4C: 8D. 05, 00000010(rel)
        mov     dword [rel ?_006], 0                    ; 00E6 _ C7. 05, 00000024(rel), 00000000
        lea     rcx, [rel __tcf_3]                      ; 00F0 _ 48: 8D. 0D, 00000030(rel)
        mov     qword [rel _ZN12_GLOBAL__N_19ScaleKPsKE], r8; 00F7 _ 4C: 89. 05, 00000020(rel)
        mov     qword [rel ?_008], r8                   ; 00FE _ 4C: 89. 05, 00000030(rel)
        mov     dword [rel ?_007], 1                    ; 0105 _ C7. 05, 00000028(rel), 00000001
        mov     dword [rel ?_009], 1                    ; 010F _ C7. 05, 00000034(rel), 00000001
        mov     dword [rel ?_010], 0                    ; 0119 _ C7. 05, 00000038(rel), 00000000
        call    atexit                                  ; 0123 _ E8, 00000000(rel)
        lea     r9, [rel _ZTV7EndgameIL11EndgameType21E11ScaleFactorE+10H]; 0128 _ 4C: 8D. 0D, 00000010(rel)
        mov     dword [rel ?_001], 0                    ; 012F _ C7. 05, 00000004(rel), 00000000
        lea     rcx, [rel __tcf_4]                      ; 0139 _ 48: 8D. 0D, 00000000(rel)
        mov     qword [rel _ZN12_GLOBAL__N_19ScaleKPKPE], r9; 0140 _ 4C: 89. 0D, 00000000(rel)
        mov     dword [rel ?_002], 1                    ; 0147 _ C7. 05, 00000008(rel), 00000001
        mov     qword [rel ?_003], r9                   ; 0151 _ 4C: 89. 0D, 00000010(rel)
        mov     dword [rel ?_004], 1                    ; 0158 _ C7. 05, 00000014(rel), 00000001
        mov     dword [rel ?_005], 0                    ; 0162 _ C7. 05, 00000018(rel), 00000000
        add     rsp, 40                                 ; 016C _ 48: 83. C4, 28
        jmp     atexit                                  ; 0170 _ E9, 00000000(rel)

        nop                                             ; 0175 _ 90
        nop                                             ; 0176 _ 90
        nop                                             ; 0177 _ 90
        nop                                             ; 0178 _ 90
        nop                                             ; 0179 _ 90
        nop                                             ; 017A _ 90
        nop                                             ; 017B _ 90
        nop                                             ; 017C _ 90
        nop                                             ; 017D _ 90
        nop                                             ; 017E _ 90
        nop                                             ; 017F _ 90


SECTION .xdata.startup align=4 noexecute                ; section number 6, const

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .ctors  align=8 noexecute                       ; section number 8, data

        dq _GLOBAL__sub_I__ZN8Material5probeERK8Position; 0000 _ 0000000000000000 (d)


SECTION .text.hot align=16 execute                      ; section number 9, code

.text.hot:; Local function

_ZN8Material5probeERK8Position:
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 168                                ; 000C _ 48: 81. EC, 000000A8
        mov     rax, qword [rcx+3B8H]                   ; 0013 _ 48: 8B. 81, 000003B8
        mov     rdx, qword [rcx+3B0H]                   ; 001A _ 48: 8B. 91, 000003B0
        mov     rbp, qword [rax+8H]                     ; 0021 _ 48: 8B. 68, 08
        mov     rbx, rbp                                ; 0025 _ 48: 89. EB
        and     ebx, 1FFFH                              ; 0028 _ 81. E3, 00001FFF
        lea     rbx, [rbx+rbx*2]                        ; 002E _ 48: 8D. 1C 5B
        shl     rbx, 4                                  ; 0032 _ 48: C1. E3, 04
        add     rbx, qword [rdx+60H]                    ; 0036 _ 48: 03. 5A, 60
        cmp     qword [rbx], rbp                        ; 003A _ 48: 39. 2B
        jnz     ?_041                                   ; 003D _ 75, 17
?_040:  mov     rax, rbx                                ; 003F _ 48: 89. D8
        add     rsp, 168                                ; 0042 _ 48: 81. C4, 000000A8
        pop     rbx                                     ; 0049 _ 5B
        pop     rsi                                     ; 004A _ 5E
        pop     rdi                                     ; 004B _ 5F
        pop     rbp                                     ; 004C _ 5D
        pop     r12                                     ; 004D _ 41: 5C
        pop     r13                                     ; 004F _ 41: 5D
        pop     r14                                     ; 0051 _ 41: 5E
        pop     r15                                     ; 0053 _ 41: 5F
        ret                                             ; 0055 _ C3

?_041:  ; Local function
        mov     rsi, rcx                                ; 0056 _ 48: 89. CE
        xor     eax, eax                                ; 0059 _ 31. C0
        mov     ecx, 6                                  ; 005B _ B9, 00000006
        mov     rdi, rbx                                ; 0060 _ 48: 89. DF
        rep stosq                                       ; 0063 _ F3 48: AB
        mov     qword [rbx], rbp                        ; 0066 _ 48: 89. 2B
        mov     rcx, rsi                                ; 0069 _ 48: 89. F1
        mov     byte [rbx+0BH], 64                      ; 006C _ C6. 43, 0B, 40
        mov     byte [rbx+0AH], 64                      ; 0070 _ C6. 43, 0A, 40
        call    _ZNK8Position10game_phaseEv             ; 0074 _ E8, 00000000(rel)
        mov     r12, qword [rsi+3B0H]                   ; 0079 _ 4C: 8B. A6, 000003B0
        mov     dword [rbx+28H], eax                    ; 0080 _ 89. 43, 28
        mov     rdi, qword [r12+88H]                    ; 0083 _ 49: 8B. BC 24, 00000088
        lea     r14, [r12+80H]                          ; 008B _ 4D: 8D. B4 24, 00000080
        test    rdi, rdi                                ; 0093 _ 48: 85. FF
        jz      ?_045                                   ; 0096 _ 74, 20
        mov     r8, r14                                 ; 0098 _ 4D: 89. F0
        mov     r9, rdi                                 ; 009B _ 49: 89. F9
        jmp     ?_044                                   ; 009E _ EB, 0C

?_042:  mov     r8, r9                                  ; 00A0 _ 4D: 89. C8
        mov     r9, qword [r9+10H]                      ; 00A3 _ 4D: 8B. 49, 10
?_043:  test    r9, r9                                  ; 00A7 _ 4D: 85. C9
        jz      ?_052                                   ; 00AA _ 74, 7D
?_044:  cmp     rbp, qword [r9+20H]                     ; 00AC _ 49: 3B. 69, 20
        jbe     ?_042                                   ; 00B0 _ 76, EE
        mov     r9, qword [r9+18H]                      ; 00B2 _ 4D: 8B. 49, 18
        jmp     ?_043                                   ; 00B6 _ EB, EF

?_045:  mov     qword [rbx+10H], 0                      ; 00B8 _ 48: C7. 43, 10, 00000000
?_046:  mov     rdx, qword [rsi+148H]                   ; 00C0 _ 48: 8B. 96, 00000148
        blsr    rax, rdx                                ; 00C7 _ C4 E2 F8: F3. CA
        test    rax, rax                                ; 00CC _ 48: 85. C0
        je      ?_099                                   ; 00CF _ 0F 84, 00000678
?_047:  mov     r15, qword [rsi+140H]                   ; 00D5 _ 4C: 8B. BE, 00000140
        blsr    r10, r15                                ; 00DC _ C4 C2 A8: F3. CF
        test    r10, r10                                ; 00E1 _ 4D: 85. D2
        je      ?_097                                   ; 00E4 _ 0F 84, 00000630
?_048:  mov     rdi, qword [rsi+3B0H]                   ; 00EA _ 48: 8B. BE, 000003B0
        mov     qword [rsp+58H], rbp                    ; 00F1 _ 48: 89. 6C 24, 58
        mov     r8, qword [rdi+0B8H]                    ; 00F6 _ 4C: 8B. 87, 000000B8
        lea     r13, [rdi+0B0H]                         ; 00FD _ 4C: 8D. AF, 000000B0
        mov     rcx, r13                                ; 0104 _ 4C: 89. E9
        test    r8, r8                                  ; 0107 _ 4D: 85. C0
        mov     rax, r8                                 ; 010A _ 4C: 89. C0
        jnz     ?_051                                   ; 010D _ 75, 0E
        jmp     ?_058                                   ; 010F _ EB, 7E

?_049:  mov     rcx, rax                                ; 0111 _ 48: 89. C1
        mov     rax, qword [rax+10H]                    ; 0114 _ 48: 8B. 40, 10
?_050:  test    rax, rax                                ; 0118 _ 48: 85. C0
        jz      ?_057                                   ; 011B _ 74, 63
?_051:  cmp     rbp, qword [rax+20H]                    ; 011D _ 48: 3B. 68, 20
        jbe     ?_049                                   ; 0121 _ 76, EE
        mov     rax, qword [rax+18H]                    ; 0123 _ 48: 8B. 40, 18
        jmp     ?_050                                   ; 0127 _ EB, EF

?_052:  cmp     r14, r8                                 ; 0129 _ 4D: 39. C6
        jz      ?_053                                   ; 012C _ 74, 06
        cmp     rbp, qword [r8+20H]                     ; 012E _ 49: 3B. 68, 20
        jnc     ?_054                                   ; 0132 _ 73, 0A
?_053:  mov     qword [rbx+10H], 0                      ; 0134 _ 48: C7. 43, 10, 00000000
        jmp     ?_046                                   ; 013C _ EB, 82

?_054:  mov     r13, r14                                ; 013E _ 4D: 89. F5
?_055:  cmp     rbp, qword [rdi+20H]                    ; 0141 _ 48: 3B. 6F, 20
        ja      ?_100                                   ; 0145 _ 0F 87, 00000618
        mov     r13, rdi                                ; 014B _ 49: 89. FD
        mov     rdi, qword [rdi+10H]                    ; 014E _ 48: 8B. 7F, 10
?_056:  test    rdi, rdi                                ; 0152 _ 48: 85. FF
        jnz     ?_055                                   ; 0155 _ 75, EA
        cmp     r14, r13                                ; 0157 _ 4D: 39. EE
        je      Unnamed_4_53                            ; 015A _ 0F 84, 00000053(rel)
        cmp     rbp, qword [r13+20H]                    ; 0160 _ 49: 3B. 6D, 20
        jc      ?_105                                   ; 0164 _ 0F 82, 000006D3
        mov     r12, qword [r13+28H]                    ; 016A _ 4D: 8B. 65, 28
        test    r12, r12                                ; 016E _ 4D: 85. E4
        mov     qword [rbx+10H], r12                    ; 0171 _ 4C: 89. 63, 10
        jne     ?_040                                   ; 0175 _ 0F 85, FFFFFEC4
        jmp     ?_046                                   ; 017B _ E9, FFFFFF40

?_057:  cmp     r13, rcx                                ; 0180 _ 49: 39. CD
        jz      ?_058                                   ; 0183 _ 74, 0A
        cmp     rbp, qword [rcx+20H]                    ; 0185 _ 48: 3B. 69, 20
        jnc     ?_075                                   ; 0189 _ 0F 83, 000002CF
?_058:  mov     r13, qword [rsi+3B8H]                   ; 018F _ 4C: 8B. AE, 000003B8
        mov     r9d, dword [r13+10H]                    ; 0196 _ 45: 8B. 4D, 10
        cmp     r9d, 836                                ; 019A _ 41: 81. F9, 00000344
        je      ?_081                                   ; 01A1 _ 0F 84, 000003B9
        mov     rax, qword [rsi+108H]                   ; 01A7 _ 48: 8B. 86, 00000108
        test    r15, rax                                ; 01AE _ 49: 85. C7
        jnz     ?_059                                   ; 01B1 _ 75, 0D
        cmp     r9d, 2521                               ; 01B3 _ 41: 81. F9, 000009D9
        je      ?_101                                   ; 01BA _ 0F 84, 000005AC
?_059:  mov     ebp, dword [r13+14H]                    ; 01C0 _ 41: 8B. 6D, 14
        cmp     ebp, 836                                ; 01C4 _ 81. FD, 00000344
        je      ?_079                                   ; 01CA _ 0F 84, 0000031E
        test    rdx, rax                                ; 01D0 _ 48: 85. C2
        jnz     ?_060                                   ; 01D3 _ 75, 0C
        cmp     ebp, 2521                               ; 01D5 _ 81. FD, 000009D9
        je      ?_103                                   ; 01DB _ 0F 84, 000005F0
?_060:  mov     edi, dword [r13+10H]                    ; 01E1 _ 41: 8B. 7D, 10
        mov     r11d, dword [r13+14H]                   ; 01E5 _ 45: 8B. 5D, 14
        mov     ebp, edi                                ; 01E9 _ 89. FD
        add     ebp, r11d                               ; 01EB _ 44: 01. DD
        je      ?_091                                   ; 01EE _ 0F 84, 000004A1
?_061:  test    r15, rax                                ; 01F4 _ 49: 85. C7
        je      ?_087                                   ; 01F7 _ 0F 84, 0000043A
        mov     r14, rax                                ; 01FD _ 49: 89. C6
?_062:  test    qword [rsi+148H], rax                   ; 0200 _ 48: 85. 86, 00000148
        je      ?_083                                   ; 0207 _ 0F 84, 000003A9
?_063:  mov     r10, rax                                ; 020D _ 49: 89. C2
        and     r10, qword [rsi+140H]                   ; 0210 _ 4C: 23. 96, 00000140
        popcnt  r8, r10                                 ; 0217 _ F3 4D: 0F B8. C2
        cmp     r8d, 1                                  ; 021C _ 41: 83. F8, 01
        je      ?_080                                   ; 0220 _ 0F 84, 00000305
        mov     rdx, qword [rsi+148H]                   ; 0226 _ 48: 8B. 96, 00000148
        and     rax, rdx                                ; 022D _ 48: 21. D0
        popcnt  r12, rax                                ; 0230 _ F3 4C: 0F B8. E0
?_064:  cmp     r12d, 1                                 ; 0235 _ 41: 83. FC, 01
        je      ?_078                                   ; 0239 _ 0F 84, 0000026E
        mov     r8, qword [rsi+140H]                    ; 023F _ 4C: 8B. 86, 00000140
        and     r14, r8                                 ; 0246 _ 4D: 21. C6
        popcnt  rbp, r14                                ; 0249 _ F3 49: 0F B8. EE
?_065:  mov     r10, qword [rsi+118H]                   ; 024E _ 4C: 8B. 96, 00000118
        xor     eax, eax                                ; 0255 _ 31. C0
        mov     r15, r8                                 ; 0257 _ 4D: 89. C7
        mov     r9, r8                                  ; 025A _ 4D: 89. C1
        lea     r13, [rsp+60H]                          ; 025D _ 4C: 8D. 6C 24, 60
        mov     ecx, 8                                  ; 0262 _ B9, 00000008
        mov     r11, qword [rsi+110H]                   ; 0267 _ 4C: 8B. 9E, 00000110
        mov     rdi, r13                                ; 026E _ 4C: 89. EF
        rep stosq                                       ; 0271 _ F3 48: AB
        mov     rcx, qword [rsi+120H]                   ; 0274 _ 48: 8B. 8E, 00000120
        mov     rax, r8                                 ; 027B _ 4C: 89. C0
        mov     dword [rsp+64H], ebp                    ; 027E _ 89. 6C 24, 64
        mov     rsi, qword [rsi+128H]                   ; 0282 _ 48: 8B. B6, 00000128
        and     r15, r10                                ; 0289 _ 4D: 21. D7
        mov     dword [rsp+84H], r12d                   ; 028C _ 44: 89. A4 24, 00000084
        popcnt  r14, r15                                ; 0294 _ F3 4D: 0F B8. F7
        xor     r15d, r15d                              ; 0299 _ 45: 31. FF
        cmp     r14d, 1                                 ; 029C _ 41: 83. FE, 01
        mov     r12, r11                                ; 02A0 _ 4D: 89. DC
        setg    r15b                                    ; 02A3 _ 41: 0F 9F. C7
        and     r9, r11                                 ; 02A7 _ 4D: 21. D9
        and     r10, rdx                                ; 02AA _ 49: 21. D2
        mov     dword [rsp+6CH], r14d                   ; 02AD _ 44: 89. 74 24, 6C
        and     rax, rcx                                ; 02B2 _ 48: 21. C8
        popcnt  rbp, r9                                 ; 02B5 _ F3 49: 0F B8. E9
        popcnt  r10, r10                                ; 02BA _ F3 4D: 0F B8. D2
        xor     r14d, r14d                              ; 02BF _ 45: 31. F6
        and     r8, rsi                                 ; 02C2 _ 49: 21. F0
        popcnt  rdi, rax                                ; 02C5 _ F3 48: 0F B8. F8
        mov     dword [rsp+68H], ebp                    ; 02CA _ 89. 6C 24, 68
        popcnt  r8, r8                                  ; 02CE _ F3 4D: 0F B8. C0
        cmp     r10d, 1                                 ; 02D3 _ 41: 83. FA, 01
        mov     dword [rsp+8CH], r10d                   ; 02D7 _ 44: 89. 94 24, 0000008C
        setg    r14b                                    ; 02DF _ 41: 0F 9F. C6
        and     r12, rdx                                ; 02E3 _ 49: 21. D4
        and     rcx, rdx                                ; 02E6 _ 48: 21. D1
        mov     dword [rsp+60H], r15d                   ; 02E9 _ 44: 89. 7C 24, 60
        and     rdx, rsi                                ; 02EE _ 48: 21. F2
        popcnt  r9, rcx                                 ; 02F1 _ F3 4C: 0F B8. C9
        mov     dword [rsp+70H], edi                    ; 02F6 _ 89. 7C 24, 70
        xor     r10d, r10d                              ; 02FA _ 45: 31. D2
        popcnt  r11, r12                                ; 02FD _ F3 4D: 0F B8. DC
        popcnt  rbp, rdx                                ; 0302 _ F3 48: 0F B8. EA
        mov     dword [rsp+74H], r8d                    ; 0307 _ 44: 89. 44 24, 74
        mov     dword [rsp+80H], r14d                   ; 030C _ 44: 89. B4 24, 00000080
        xor     r14d, r14d                              ; 0314 _ 45: 31. F6
        mov     dword [rsp+90H], r9d                    ; 0317 _ 44: 89. 8C 24, 00000090
        mov     r9d, r15d                               ; 031F _ 45: 89. F9
        mov     dword [rsp+88H], r11d                   ; 0322 _ 44: 89. 9C 24, 00000088
        mov     dword [rsp+94H], ebp                    ; 032A _ 89. AC 24, 00000094
?_066:  test    r9d, r9d                                ; 0331 _ 45: 85. C9
        mov     r8d, r10d                               ; 0334 _ 45: 89. D0
        jz      ?_069                                   ; 0337 _ 74, 5E
        lea     rcx, [rel _ZN12_GLOBAL__N_1L6LinearE]   ; 0339 _ 48: 8D. 0D, 00000180(rel)
        mov     ebp, r15d                               ; 0340 _ 44: 89. FD
        xor     edx, edx                                ; 0343 _ 31. D2
        mov     ecx, dword [rcx+r10*4]                  ; 0345 _ 42: 8B. 0C 91
        lea     rdi, [r10*8]                            ; 0349 _ 4A: 8D. 3C D5, 00000000
        lea     rsi, [rel _ZN12_GLOBAL__N_1L13QuadraticOursE]; 0351 _ 48: 8D. 35, 000000C0(rel)
        lea     r11, [rel _ZN12_GLOBAL__N_1L15QuadraticTheirsE]; 0358 _ 4C: 8D. 1D, 00000000(rel)
?_067:  mov     r12d, edx                               ; 035F _ 41: 89. D4
        add     edx, 1                                  ; 0362 _ 83. C2, 01
        lea     rax, [r12+rdi]                          ; 0365 _ 49: 8D. 04 3C
        imul    ebp, dword [rsi+rax*4]                  ; 0369 _ 0F AF. 2C 86
        mov     eax, dword [r11+rax*4]                  ; 036D _ 41: 8B. 04 83
        imul    eax, dword [rsp+r12*4+80H]              ; 0371 _ 42: 0F AF. 84 A4, 00000080
        add     eax, ebp                                ; 037A _ 01. E8
        add     ecx, eax                                ; 037C _ 01. C1
        cmp     edx, r8d                                ; 037E _ 44: 39. C2
        ja      ?_068                                   ; 0381 _ 77, 0D
        mov     ebp, edx                                ; 0383 _ 89. D5
        mov     ebp, dword [rsp+rbp*4+60H]              ; 0385 _ 8B. 6C AC, 60
        jmp     ?_067                                   ; 0389 _ EB, D4

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_068:  imul    ecx, r9d                                ; 0390 _ 41: 0F AF. C9
        add     r14d, ecx                               ; 0394 _ 41: 01. CE
?_069:  add     r10, 1                                  ; 0397 _ 49: 83. C2, 01
        cmp     r10, 6                                  ; 039B _ 49: 83. FA, 06
        jz      ?_070                                   ; 039F _ 74, 07
        mov     r9d, dword [r13+r10*4]                  ; 03A1 _ 47: 8B. 4C 95, 00
        jmp     ?_066                                   ; 03A6 _ EB, 89

?_070:  xor     r9d, r9d                                ; 03A8 _ 45: 31. C9
        mov     qword [rsp+38H], rbx                    ; 03AB _ 48: 89. 5C 24, 38
        xor     eax, eax                                ; 03B0 _ 31. C0
        mov     ebx, r9d                                ; 03B2 _ 44: 89. CB
?_071:  mov     r12d, dword [r13+rax*4+20H]             ; 03B5 _ 45: 8B. 64 85, 20
        mov     r10d, eax                               ; 03BA _ 41: 89. C2
        test    r12d, r12d                              ; 03BD _ 45: 85. E4
        jz      ?_074                                   ; 03C0 _ 74, 6A
        lea     r8, [rel _ZN12_GLOBAL__N_1L6LinearE]    ; 03C2 _ 4C: 8D. 05, 00000180(rel)
        mov     edx, r15d                               ; 03C9 _ 44: 89. FA
        xor     ecx, ecx                                ; 03CC _ 31. C9
        mov     qword [rsp+30H], rax                    ; 03CE _ 48: 89. 44 24, 30
        mov     r8d, dword [r8+rax*4]                   ; 03D3 _ 45: 8B. 04 80
        lea     rbp, [rax*8]                            ; 03D7 _ 48: 8D. 2C C5, 00000000
        lea     rdi, [rel _ZN12_GLOBAL__N_1L13QuadraticOursE]; 03DF _ 48: 8D. 3D, 000000C0(rel)
        lea     rsi, [rel _ZN12_GLOBAL__N_1L15QuadraticTheirsE]; 03E6 _ 48: 8D. 35, 00000000(rel)
?_072:  mov     r9d, ecx                                ; 03ED _ 41: 89. C9
        add     ecx, 1                                  ; 03F0 _ 83. C1, 01
        lea     rax, [rbp+r9]                           ; 03F3 _ 4A: 8D. 44 0D, 00
        imul    edx, dword [rsi+rax*4]                  ; 03F8 _ 0F AF. 14 86
        mov     r11d, dword [rdi+rax*4]                 ; 03FC _ 44: 8B. 1C 87
        imul    r11d, dword [rsp+r9*4+80H]              ; 0400 _ 46: 0F AF. 9C 8C, 00000080
        add     edx, r11d                               ; 0409 _ 44: 01. DA
        add     r8d, edx                                ; 040C _ 41: 01. D0
        cmp     ecx, r10d                               ; 040F _ 44: 39. D1
        ja      ?_073                                   ; 0412 _ 77, 0C
        mov     edx, ecx                                ; 0414 _ 89. CA
        mov     edx, dword [rsp+rdx*4+60H]              ; 0416 _ 8B. 54 94, 60
        jmp     ?_072                                   ; 041A _ EB, D1

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_073:  imul    r8d, r12d                               ; 0420 _ 45: 0F AF. C4
        mov     rax, qword [rsp+30H]                    ; 0424 _ 48: 8B. 44 24, 30
        add     ebx, r8d                                ; 0429 _ 44: 01. C3
?_074:  add     rax, 1                                  ; 042C _ 48: 83. C0, 01
        cmp     rax, 6                                  ; 0430 _ 48: 83. F8, 06
        jne     ?_071                                   ; 0434 _ 0F 85, FFFFFF7B
        mov     r13d, ebx                               ; 043A _ 41: 89. DD
        mov     rbx, qword [rsp+38H]                    ; 043D _ 48: 8B. 5C 24, 38
        sub     r14d, r13d                              ; 0442 _ 45: 29. EE
        lea     r15d, [r14+0FH]                         ; 0445 _ 45: 8D. 7E, 0F
        test    r14d, r14d                              ; 0449 _ 45: 85. F6
        cmovs   r14d, r15d                              ; 044C _ 45: 0F 48. F7
        sar     r14d, 4                                 ; 0450 _ 41: C1. FE, 04
        mov     word [rbx+8H], r14w                     ; 0454 _ 66 44: 89. 73, 08
        jmp     ?_040                                   ; 0459 _ E9, FFFFFBE1

?_075:  mov     rax, r13                                ; 045E _ 4C: 89. E8
?_076:  cmp     rbp, qword [r8+20H]                     ; 0461 _ 49: 3B. 68, 20
        ja      ?_095                                   ; 0465 _ 0F 87, 0000028B
        mov     rax, r8                                 ; 046B _ 4C: 89. C0
        mov     r8, qword [r8+10H]                      ; 046E _ 4D: 8B. 40, 10
?_077:  test    r8, r8                                  ; 0472 _ 4D: 85. C0
        jnz     ?_076                                   ; 0475 _ 75, EA
        cmp     r13, rax                                ; 0477 _ 49: 39. C5
        je      Unnamed_4_1F                            ; 047A _ 0F 84, 0000001F(rel)
        cmp     rbp, qword [rax+20H]                    ; 0480 _ 48: 3B. 68, 20
        jc      Unnamed_4_1F                            ; 0484 _ 0F 82, 0000001F(rel)
        mov     r12, qword [rax+28H]                    ; 048A _ 4C: 8B. 60, 28
        test    r12, r12                                ; 048E _ 4D: 85. E4
        je      Unnamed_4_C                             ; 0491 _ 0F 84, 0000000C(rel)
        mov     rsi, qword [r12]                        ; 0497 _ 49: 8B. 34 24
        mov     rcx, r12                                ; 049B _ 4C: 89. E1
        call    near [rsi+10H]                          ; 049E _ FF. 56, 10
        cdqe                                            ; 04A1 _ 48: 98
        mov     qword [rbx+rax*8+18H], r12              ; 04A3 _ 4C: 89. 64 C3, 18
        jmp     ?_040                                   ; 04A8 _ E9, FFFFFB92

?_078:  sub     r11d, edi                               ; 04AD _ 41: 29. FB
        cmp     r11d, 836                               ; 04B0 _ 41: 81. FB, 00000344
        jg      ?_102                                   ; 04B7 _ 0F 8F, 00000300
        mov     byte [rbx+0BH], 48                      ; 04BD _ C6. 43, 0B, 30
        mov     r12, qword [rsi+108H]                   ; 04C1 _ 4C: 8B. A6, 00000108
        mov     r8, qword [rsi+140H]                    ; 04C8 _ 4C: 8B. 86, 00000140
        mov     rdx, qword [rsi+148H]                   ; 04CF _ 48: 8B. 96, 00000148
        mov     rbp, r12                                ; 04D6 _ 4C: 89. E5
        and     rbp, r8                                 ; 04D9 _ 4C: 21. C5
        and     r12, rdx                                ; 04DC _ 49: 21. D4
        popcnt  rbp, rbp                                ; 04DF _ F3 48: 0F B8. ED
        popcnt  r12, r12                                ; 04E4 _ F3 4D: 0F B8. E4
        jmp     ?_065                                   ; 04E9 _ E9, FFFFFD60

?_079:  mov     rdi, rdx                                ; 04EE _ 48: 89. D7
        and     rdi, qword [rsi+118H]                   ; 04F1 _ 48: 23. BE, 00000118
        popcnt  r8, rdi                                 ; 04F8 _ F3 4C: 0F B8. C7
        sub     r8d, 1                                  ; 04FD _ 41: 83. E8, 01
        jne     ?_060                                   ; 0501 _ 0F 85, FFFFFCDA
        test    qword [rsi+108H], rdx                   ; 0507 _ 48: 85. 96, 00000108
        je      ?_060                                   ; 050E _ 0F 84, FFFFFCCD
        lea     rcx, [rel ?_018]                        ; 0514 _ 48: 8D. 0D, 00000070(rel)
        mov     qword [rbx+20H], rcx                    ; 051B _ 48: 89. 4B, 20
        mov     r13, qword [rsi+3B8H]                   ; 051F _ 4C: 8B. AE, 000003B8
        jmp     ?_060                                   ; 0526 _ E9, FFFFFCB6

?_080:  mov     r14d, edi                               ; 052B _ 41: 89. FE
        sub     r14d, r11d                              ; 052E _ 45: 29. DE
        cmp     r14d, 836                               ; 0531 _ 41: 81. FE, 00000344
        jg      ?_104                                   ; 0538 _ 0F 8F, 000002E5
        mov     byte [rbx+0AH], 48                      ; 053E _ C6. 43, 0A, 30
        mov     r14, qword [rsi+108H]                   ; 0542 _ 4C: 8B. B6, 00000108
        mov     rdx, qword [rsi+148H]                   ; 0549 _ 48: 8B. 96, 00000148
        mov     rcx, r14                                ; 0550 _ 4C: 89. F1
        and     rcx, rdx                                ; 0553 _ 48: 21. D1
        popcnt  r12, rcx                                ; 0556 _ F3 4C: 0F B8. E1
        jmp     ?_064                                   ; 055B _ E9, FFFFFCD5

?_081:  mov     r8, r15                                 ; 0560 _ 4D: 89. F8
        and     r8, qword [rsi+118H]                    ; 0563 _ 4C: 23. 86, 00000118
        popcnt  rax, r8                                 ; 056A _ F3 49: 0F B8. C0
        sub     eax, 1                                  ; 056F _ 83. E8, 01
        jne     _ZN8Material5probeERK8Position.cold.66  ; 0572 _ 0F 85, 00000000(rel)
        test    qword [rsi+108H], r15                   ; 0578 _ 4C: 85. BE, 00000108
        je      ?_086                                   ; 057F _ 0F 84, 000000A6
        lea     rcx, [rel _ZN12_GLOBAL__N_110ScaleKBPsKE]; 0585 _ 48: 8D. 0D, 00000060(rel)
        mov     rax, qword [rsi+108H]                   ; 058C _ 48: 8B. 86, 00000108
        mov     qword [rbx+18H], rcx                    ; 0593 _ 48: 89. 4B, 18
        mov     r13, qword [rsi+3B8H]                   ; 0597 _ 4C: 8B. AE, 000003B8
        jmp     ?_059                                   ; 059E _ E9, FFFFFC1D

?_082:  mov     r15d, edi                               ; 05A3 _ 41: 89. FF
        sub     r15d, r11d                              ; 05A6 _ 45: 29. DF
        cmp     r15d, 836                               ; 05A9 _ 41: 81. FF, 00000344
        jle     ?_088                                   ; 05B0 _ 0F 8E, 00000090
?_083:  mov     r10d, r11d                              ; 05B6 _ 45: 89. DA
        sub     r10d, edi                               ; 05B9 _ 41: 29. FA
        cmp     r10d, 836                               ; 05BC _ 41: 81. FA, 00000344
        jg      ?_085                                   ; 05C3 _ 7F, 35
        xor     r15d, r15d                              ; 05C5 _ 45: 31. FF
        cmp     r11d, 1269                              ; 05C8 _ 41: 81. FB, 000004F5
        jle     ?_084                                   ; 05CF _ 7E, 16
        cmp     edi, 837                                ; 05D1 _ 81. FF, 00000345
        mov     r9d, 14                                 ; 05D7 _ 41: B9, 0000000E
        mov     r15d, 4                                 ; 05DD _ 41: BF, 00000004
        cmovge  r15d, r9d                               ; 05E3 _ 45: 0F 4D. F9
?_084:  mov     byte [rbx+0BH], r15b                    ; 05E7 _ 44: 88. 7B, 0B
        mov     rax, qword [rsi+108H]                   ; 05EB _ 48: 8B. 86, 00000108
        mov     r14, rax                                ; 05F2 _ 49: 89. C6
        jmp     ?_063                                   ; 05F5 _ E9, FFFFFC13

?_085:  mov     r8, qword [rsi+140H]                    ; 05FA _ 4C: 8B. 86, 00000140
        mov     r13, rax                                ; 0601 _ 49: 89. C5
        and     r13, r8                                 ; 0604 _ 4D: 21. C5
        popcnt  rcx, r13                                ; 0607 _ F3 49: 0F B8. CD
        mov     ebp, ecx                                ; 060C _ 89. CD
        sub     ecx, 1                                  ; 060E _ 83. E9, 01
        je      ?_080                                   ; 0611 _ 0F 84, FFFFFF14
        mov     rdx, qword [rsi+148H]                   ; 0617 _ 48: 8B. 96, 00000148
        and     rax, rdx                                ; 061E _ 48: 21. D0
        popcnt  r12, rax                                ; 0621 _ F3 4C: 0F B8. E0
        jmp     ?_065                                   ; 0626 _ E9, FFFFFC23

?_086:  mov     rax, qword [rsi+108H]                   ; 062B _ 48: 8B. 86, 00000108
        jmp     ?_059                                   ; 0632 _ E9, FFFFFB89

?_087:  mov     r15d, edi                               ; 0637 _ 41: 89. FF
        sub     r15d, r11d                              ; 063A _ 45: 29. DF
        cmp     r15d, 836                               ; 063D _ 41: 81. FF, 00000344
        jg      ?_090                                   ; 0644 _ 7F, 30
?_088:  xor     eax, eax                                ; 0646 _ 31. C0
        cmp     edi, 1269                               ; 0648 _ 81. FF, 000004F5
        jle     ?_089                                   ; 064E _ 7E, 14
        cmp     r11d, 837                               ; 0650 _ 41: 81. FB, 00000345
        mov     edx, 14                                 ; 0657 _ BA, 0000000E
        mov     eax, 4                                  ; 065C _ B8, 00000004
        cmovge  eax, edx                                ; 0661 _ 0F 4D. C2
?_089:  mov     byte [rbx+0AH], al                      ; 0664 _ 88. 43, 0A
        mov     rax, qword [rsi+108H]                   ; 0667 _ 48: 8B. 86, 00000108
        mov     r14, rax                                ; 066E _ 49: 89. C6
        jmp     ?_062                                   ; 0671 _ E9, FFFFFB8A

?_090:  mov     r12, rax                                ; 0676 _ 49: 89. C4
        and     r12, rdx                                ; 0679 _ 49: 21. D4
        popcnt  r9, r12                                 ; 067C _ F3 4D: 0F B8. CC
        test    r9d, r9d                                ; 0681 _ 45: 85. C9
        mov     r12d, r9d                               ; 0684 _ 45: 89. CC
        je      ?_083                                   ; 0687 _ 0F 84, FFFFFF29
        mov     r14, rax                                ; 068D _ 49: 89. C6
        jmp     ?_064                                   ; 0690 _ E9, FFFFFBA0

?_091:  test    rax, rax                                ; 0695 _ 48: 85. C0
        je      ?_082                                   ; 0698 _ 0F 84, FFFFFF05
        mov     r12, rax                                ; 069E _ 49: 89. C4
        and     r12, qword [rsi+148H]                   ; 06A1 _ 4C: 23. A6, 00000148
        popcnt  r9, r12                                 ; 06A8 _ F3 4D: 0F B8. CC
        test    r9d, r9d                                ; 06AD _ 45: 85. C9
        jz      ?_094                                   ; 06B0 _ 74, 34
        mov     r14, r15                                ; 06B2 _ 4D: 89. FE
        and     r14, rax                                ; 06B5 _ 49: 21. C6
        popcnt  r10, r14                                ; 06B8 _ F3 4D: 0F B8. D6
        test    r10d, r10d                              ; 06BD _ 45: 85. D2
        jz      ?_093                                   ; 06C0 _ 74, 14
        sub     r10, 1                                  ; 06C2 _ 49: 83. EA, 01
        jnz     ?_092                                   ; 06C6 _ 75, 06
        sub     r9, 1                                   ; 06C8 _ 49: 83. E9, 01
        jz      ?_096                                   ; 06CC _ 74, 31
?_092:  mov     r14, rax                                ; 06CE _ 49: 89. C6
        jmp     ?_063                                   ; 06D1 _ E9, FFFFFB37

?_093:  lea     rcx, [rel ?_008]                        ; 06D6 _ 48: 8D. 0D, 00000030(rel)
        mov     qword [rbx+20H], rcx                    ; 06DD _ 48: 89. 4B, 20
        jmp     ?_061                                   ; 06E1 _ E9, FFFFFB0E

?_094:  lea     rbp, [rel _ZN12_GLOBAL__N_19ScaleKPsKE] ; 06E6 _ 48: 8D. 2D, 00000020(rel)
        mov     qword [rbx+18H], rbp                    ; 06ED _ 48: 89. 6B, 18
        jmp     ?_061                                   ; 06F1 _ E9, FFFFFAFE

?_095:  mov     r8, qword [r8+18H]                      ; 06F6 _ 4D: 8B. 40, 18
        jmp     ?_077                                   ; 06FA _ E9, FFFFFD73

?_096:  lea     r13, [rel _ZN12_GLOBAL__N_19ScaleKPKPE] ; 06FF _ 4C: 8D. 2D, 00000000(rel)
        lea     r8, [rel ?_003]                         ; 0706 _ 4C: 8D. 05, 00000010(rel)
        mov     qword [rbx+18H], r13                    ; 070D _ 4C: 89. 6B, 18
        mov     qword [rbx+20H], r8                     ; 0711 _ 4C: 89. 43, 20
        jmp     ?_061                                   ; 0715 _ E9, FFFFFADA

?_097:  mov     r11, qword [rsi+3B8H]                   ; 071A _ 4C: 8B. 9E, 000003B8
        cmp     dword [r11+14H], 1269                   ; 0721 _ 41: 81. 7B, 14, 000004F5
        jle     ?_048                                   ; 0729 _ 0F 8E, FFFFF9BB
        mov     eax, 1                                  ; 072F _ B8, 00000001
?_098:  lea     r10, [rel _ZN12_GLOBAL__N_111EvaluateKXKE]; 0734 _ 4C: 8D. 15, 00000080(rel)
        cdqe                                            ; 073B _ 48: 98
        shl     rax, 4                                  ; 073D _ 48: C1. E0, 04
        add     rax, r10                                ; 0741 _ 4C: 01. D0
        mov     qword [rbx+10H], rax                    ; 0744 _ 48: 89. 43, 10
        jmp     ?_040                                   ; 0748 _ E9, FFFFF8F2

?_099:  mov     r14, qword [rsi+3B8H]                   ; 074D _ 4C: 8B. B6, 000003B8
        cmp     dword [r14+10H], 1269                   ; 0754 _ 41: 81. 7E, 10, 000004F5
        jg      ?_098                                   ; 075C _ 7F, D6
        jmp     ?_047                                   ; 075E _ E9, FFFFF972

?_100:  mov     rdi, qword [rdi+18H]                    ; 0763 _ 48: 8B. 7F, 18
        jmp     ?_056                                   ; 0767 _ E9, FFFFF9E6

?_101:  mov     r14, r15                                ; 076C _ 4D: 89. FE
        and     r14, qword [rsi+128H]                   ; 076F _ 4C: 23. B6, 00000128
        popcnt  r10, r14                                ; 0776 _ F3 4D: 0F B8. D6
        sub     r10d, 1                                 ; 077B _ 41: 83. EA, 01
        jne     ?_059                                   ; 077F _ 0F 85, FFFFFA3B
        mov     r11, rdx                                ; 0785 _ 49: 89. D3
        and     r11, qword [rsi+120H]                   ; 0788 _ 4C: 23. 9E, 00000120
        popcnt  rdi, r11                                ; 078F _ F3 49: 0F B8. FB
        sub     edi, 1                                  ; 0794 _ 83. EF, 01
        jne     ?_059                                   ; 0797 _ 0F 85, FFFFFA23
        test    rdx, rax                                ; 079D _ 48: 85. C2
        je      ?_059                                   ; 07A0 _ 0F 84, FFFFFA1A
        lea     r13, [rel _ZN12_GLOBAL__N_111ScaleKQKRPsE]; 07A6 _ 4C: 8D. 2D, 00000040(rel)
        mov     qword [rbx+18H], r13                    ; 07AD _ 4C: 89. 6B, 18
        mov     r13, qword [rsi+3B8H]                   ; 07B1 _ 4C: 8B. AE, 000003B8
        jmp     ?_059                                   ; 07B8 _ E9, FFFFFA03

?_102:  mov     r8, qword [rsi+140H]                    ; 07BD _ 4C: 8B. 86, 00000140
        and     r14, r8                                 ; 07C4 _ 4D: 21. C6
        popcnt  rbp, r14                                ; 07C7 _ F3 49: 0F B8. EE
        jmp     ?_065                                   ; 07CC _ E9, FFFFFA7D

?_103:  mov     r12, rdx                                ; 07D1 _ 49: 89. D4
        and     r12, qword [rsi+128H]                   ; 07D4 _ 4C: 23. A6, 00000128
        popcnt  r9, r12                                 ; 07DB _ F3 4D: 0F B8. CC
        sub     r9d, 1                                  ; 07E0 _ 41: 83. E9, 01
        jne     ?_060                                   ; 07E4 _ 0F 85, FFFFF9F7
        mov     r14, r15                                ; 07EA _ 4D: 89. FE
        and     r14, qword [rsi+120H]                   ; 07ED _ 4C: 23. B6, 00000120
        popcnt  r10, r14                                ; 07F4 _ F3 4D: 0F B8. D6
        sub     r10d, 1                                 ; 07F9 _ 41: 83. EA, 01
        jne     ?_060                                   ; 07FD _ 0F 85, FFFFF9DE
        test    r15, rax                                ; 0803 _ 49: 85. C7
        je      ?_060                                   ; 0806 _ 0F 84, FFFFF9D5
        lea     r11, [rel ?_013]                        ; 080C _ 4C: 8D. 1D, 00000050(rel)
        mov     qword [rbx+20H], r11                    ; 0813 _ 4C: 89. 5B, 20
        mov     r13, qword [rsi+3B8H]                   ; 0817 _ 4C: 8B. AE, 000003B8
        jmp     ?_060                                   ; 081E _ E9, FFFFF9BE

?_104:  mov     rdx, qword [rsi+148H]                   ; 0823 _ 48: 8B. 96, 00000148
        mov     r13, rax                                ; 082A _ 49: 89. C5
        mov     r14, rax                                ; 082D _ 49: 89. C6
        and     r13, rdx                                ; 0830 _ 49: 21. D5
        popcnt  r12, r13                                ; 0833 _ F3 4D: 0F B8. E5
        jmp     ?_064                                   ; 0838 _ E9, FFFFF9F8

?_105:  ; Local function
        jmp     .text.unlikely+0E7H                     ; 083D _ E9, 000000E7(rel)

        nop                                             ; 0842 _ 90
        nop                                             ; 0843 _ 90
        nop                                             ; 0844 _ 90
        nop                                             ; 0845 _ 90
        nop                                             ; 0846 _ 90
        nop                                             ; 0847 _ 90
        nop                                             ; 0848 _ 90
        nop                                             ; 0849 _ 90
        nop                                             ; 084A _ 90
        nop                                             ; 084B _ 90
        nop                                             ; 084C _ 90
        nop                                             ; 084D _ 90
        nop                                             ; 084E _ 90
        nop                                             ; 084F _ 90


SECTION .xdata.hot align=4 noexecute                    ; section number 10, const

        db 01H, 13H, 0AH, 00H, 13H, 01H, 15H, 00H       ; 0000 _ ........
        db 0CH, 30H, 0BH, 60H, 0AH, 70H, 09H, 50H       ; 0008 _ .0.`.p.P
        db 08H, 0C0H, 06H, 0D0H, 04H, 0E0H, 02H, 0F0H   ; 0010 _ ........


SECTION .text$_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIRS1_EESK_IIEEEEESt17_Rb_tree_iteratorIS9_ESt23_Rb_tree_const_iteratorIS9_EDpOT_ align=16 execute ; section number 12, code
;  Communal section not supported by YASM

.weak._ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJRS1_EESK_IJEEEEESt17_Rb_tree_iteratorIS9_ESt23_Rb_tree_const_iteratorIS9_EDpOT_._ZN8Material5probeERK8Position:; Function begin

_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIRS1_EESK_IIEEEEESt17_Rb_tree_iteratorIS9_ESt23_Rb_tree_const_iteratorIS9_EDpOT_:
        push    r14                                     ; 0000 _ 41: 56
        push    r13                                     ; 0002 _ 41: 55
        push    r12                                     ; 0004 _ 41: 54
        push    rbp                                     ; 0006 _ 55
        push    rdi                                     ; 0007 _ 57
        push    rsi                                     ; 0008 _ 56
        push    rbx                                     ; 0009 _ 53
        sub     rsp, 48                                 ; 000A _ 48: 83. EC, 30
        mov     rdi, rcx                                ; 000E _ 48: 89. CF
        mov     ecx, 48                                 ; 0011 _ B9, 00000030
        mov     rsi, rdx                                ; 0016 _ 48: 89. D6
        lea     r13, [rdi+8H]                           ; 0019 _ 4C: 8D. 6F, 08
        mov     rbx, r9                                 ; 001D _ 4C: 89. CB
        call    _Znwy                                   ; 0020 _ E8, 00000000(rel)
        cmp     r13, rsi                                ; 0025 _ 49: 39. F5
        lea     r14, [rax+20H]                          ; 0028 _ 4C: 8D. 70, 20
        mov     r12, rax                                ; 002C _ 49: 89. C4
        mov     rax, qword [rbx]                        ; 002F _ 48: 8B. 03
        mov     rbx, rsi                                ; 0032 _ 48: 89. F3
        mov     rbp, qword [rax]                        ; 0035 _ 48: 8B. 28
        mov     qword [r12+28H], 0                      ; 0038 _ 49: C7. 44 24, 28, 00000000
        mov     qword [r12+20H], rbp                    ; 0041 _ 49: 89. 6C 24, 20
        jnz     ?_106                                   ; 0046 _ 75, 17
        cmp     qword [rdi+28H], 0                      ; 0048 _ 48: 83. 7F, 28, 00
        jz      ?_108                                   ; 004D _ 74, 63
        mov     rbx, qword [rdi+20H]                    ; 004F _ 48: 8B. 5F, 20
        cmp     qword [rbx+20H], rbp                    ; 0053 _ 48: 39. 6B, 20
        jc      ?_114                                   ; 0057 _ 0F 82, 000000B6
        jmp     ?_108                                   ; 005D _ EB, 53

?_106:  cmp     rbp, qword [rsi+20H]                    ; 005F _ 48: 3B. 6E, 20
        jnc     ?_107                                   ; 0063 _ 73, 28
        cmp     qword [rdi+18H], rsi                    ; 0065 _ 48: 39. 77, 18
        jz      ?_109                                   ; 0069 _ 74, 69
        mov     rcx, rsi                                ; 006B _ 48: 89. F1
        call    _ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base; 006E _ E8, 00000000(rel)
        cmp     rbp, qword [rax+20H]                    ; 0073 _ 48: 3B. 68, 20
        jbe     ?_108                                   ; 0077 _ 76, 39
        cmp     qword [rax+18H], 0                      ; 0079 _ 48: 83. 78, 18, 00
        mov     edx, 0                                  ; 007E _ BA, 00000000
        cmove   rbx, rax                                ; 0083 _ 48: 0F 44. D8
        cmove   rsi, rdx                                ; 0087 _ 48: 0F 44. F2
        jmp     ?_109                                   ; 008B _ EB, 47

?_107:  jbe     ?_113                                   ; 008D _ 76, 77
        cmp     qword [rdi+20H], rsi                    ; 008F _ 48: 39. 77, 20
        jz      ?_110                                   ; 0093 _ 74, 49
        mov     rcx, rsi                                ; 0095 _ 48: 89. F1
        call    _ZSt18_Rb_tree_incrementPSt18_Rb_tree_node_base; 0098 _ E8, 00000000(rel)
        cmp     rbp, qword [rax+20H]                    ; 009D _ 48: 3B. 68, 20
        mov     rsi, rax                                ; 00A1 _ 48: 89. C6
        jnc     ?_108                                   ; 00A4 _ 73, 0C
        cmp     qword [rbx+18H], 0                      ; 00A6 _ 48: 83. 7B, 18, 00
        jz      ?_110                                   ; 00AB _ 74, 31
        mov     rbx, rax                                ; 00AD _ 48: 89. C3
        jmp     ?_109                                   ; 00B0 _ EB, 22

?_108:  lea     rcx, [rsp+20H]                          ; 00B2 _ 48: 8D. 4C 24, 20
        mov     r8, r14                                 ; 00B7 _ 4D: 89. F0
        mov     rdx, rdi                                ; 00BA _ 48: 89. FA
        call    _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_; 00BD _ E8, 00000000(rel)
        mov     rcx, qword [rsp+28H]                    ; 00C2 _ 48: 8B. 4C 24, 28
        mov     rsi, qword [rsp+20H]                    ; 00C7 _ 48: 8B. 74 24, 20
        test    rcx, rcx                                ; 00CC _ 48: 85. C9
        mov     rbx, rcx                                ; 00CF _ 48: 89. CB
        jz      ?_113                                   ; 00D2 _ 74, 32
?_109:  test    rsi, rsi                                ; 00D4 _ 48: 85. F6
        jnz     ?_111                                   ; 00D7 _ 75, 0F
        cmp     rbx, r13                                ; 00D9 _ 4C: 39. EB
        jz      ?_111                                   ; 00DC _ 74, 0A
?_110:  cmp     rbp, qword [rbx+20H]                    ; 00DE _ 48: 3B. 6B, 20
        setb    r8b                                     ; 00E2 _ 41: 0F 92. C0
        jmp     ?_112                                   ; 00E6 _ EB, 03

?_111:  mov     r8b, 1                                  ; 00E8 _ 41: B0, 01
?_112:  movzx   ecx, r8b                                ; 00EB _ 41: 0F B6. C8
        mov     r9, r13                                 ; 00EF _ 4D: 89. E9
        mov     r8, rbx                                 ; 00F2 _ 49: 89. D8
        mov     rdx, r12                                ; 00F5 _ 4C: 89. E2
        call    _ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_; 00F8 _ E8, 00000000(rel)
        mov     rax, r12                                ; 00FD _ 4C: 89. E0
        inc     qword [rdi+28H]                         ; 0100 _ 48: FF. 47, 28
        jmp     ?_115                                   ; 0104 _ EB, 11

?_113:  mov     rcx, r12                                ; 0106 _ 4C: 89. E1
        call    _ZdlPv                                  ; 0109 _ E8, 00000000(rel)
        mov     rax, rsi                                ; 010E _ 48: 89. F0
        jmp     ?_115                                   ; 0111 _ EB, 04

?_114:  xor     esi, esi                                ; 0113 _ 31. F6
        jmp     ?_109                                   ; 0115 _ EB, BD
; .weak._ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE22_M_emplace_hint_uniqueIJRKSt21piecewise_construct_tSt5tupleIJRS1_EESK_IJEEEEESt17_Rb_tree_iteratorIS9_ESt23_Rb_tree_const_iteratorIS9_EDpOT_._ZN8Material5probeERK8Position End of function

?_115:  ; Local function
        add     rsp, 48                                 ; 0117 _ 48: 83. C4, 30
        pop     rbx                                     ; 011B _ 5B
        pop     rsi                                     ; 011C _ 5E
        pop     rdi                                     ; 011D _ 5F
        pop     rbp                                     ; 011E _ 5D
        pop     r12                                     ; 011F _ 41: 5C
        pop     r13                                     ; 0121 _ 41: 5D
        pop     r14                                     ; 0123 _ 41: 5E
        ret                                             ; 0125 _ C3

        nop                                             ; 0126 _ 90
        nop                                             ; 0127 _ 90
        nop                                             ; 0128 _ 90
        nop                                             ; 0129 _ 90
        nop                                             ; 012A _ 90
        nop                                             ; 012B _ 90
        nop                                             ; 012C _ 90
        nop                                             ; 012D _ 90
        nop                                             ; 012E _ 90
        nop                                             ; 012F _ 90


SECTION .xdata$_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE22_M_emplace_hint_uniqueIIRKSt21piecewise_construct_tSt5tupleIIRS1_EESK_IIEEEEESt17_Rb_tree_iteratorIS9_ESt23_Rb_tree_const_iteratorIS9_EDpOT_ align=4 noexecute ; section number 13, const
;  Communal section not supported by YASM

        db 01H, 0EH, 08H, 00H, 0EH, 52H, 0AH, 30H       ; 0000 _ .....R.0
        db 09H, 60H, 08H, 70H, 07H, 50H, 06H, 0C0H      ; 0008 _ .`.p.P..
        db 04H, 0D0H, 02H, 0E0H                         ; 0010 _ ....


SECTION .xdata  align=4 noexecute                       ; section number 15, const

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..
        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0008 _ .....B..
        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0010 _ .....B..
        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0018 _ .....B..
        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0020 _ .....B..


SECTION .text$_ZN7EndgameIL11EndgameType21E11ScaleFactorED1Ev align=16 execute ; section number 17, code
;  Communal section not supported by YASM

_ZN7EndgameIL11EndgameType21E11ScaleFactorED1Ev:; Function begin
        ret                                             ; 0000 _ C3
; _ZN7EndgameIL11EndgameType21E11ScaleFactorED1Ev End of function

        nop                                             ; 0001 _ 90
        nop                                             ; 0002 _ 90
        nop                                             ; 0003 _ 90
        nop                                             ; 0004 _ 90
        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZN7EndgameIL11EndgameType21E11ScaleFactorED1Ev align=4 noexecute ; section number 18, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZN7EndgameIL11EndgameType15E11ScaleFactorED1Ev align=16 execute ; section number 20, code
;  Communal section not supported by YASM

_ZN7EndgameIL11EndgameType15E11ScaleFactorED1Ev:; Function begin
        ret                                             ; 0000 _ C3
; _ZN7EndgameIL11EndgameType15E11ScaleFactorED1Ev End of function

        nop                                             ; 0001 _ 90
        nop                                             ; 0002 _ 90
        nop                                             ; 0003 _ 90
        nop                                             ; 0004 _ 90
        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZN7EndgameIL11EndgameType15E11ScaleFactorED1Ev align=4 noexecute ; section number 21, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZN7EndgameIL11EndgameType11E11ScaleFactorED1Ev align=16 execute ; section number 23, code
;  Communal section not supported by YASM

_ZN7EndgameIL11EndgameType11E11ScaleFactorED1Ev:; Function begin
        ret                                             ; 0000 _ C3
; _ZN7EndgameIL11EndgameType11E11ScaleFactorED1Ev End of function

        nop                                             ; 0001 _ 90
        nop                                             ; 0002 _ 90
        nop                                             ; 0003 _ 90
        nop                                             ; 0004 _ 90
        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZN7EndgameIL11EndgameType11E11ScaleFactorED1Ev align=4 noexecute ; section number 24, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZN7EndgameIL11EndgameType10E11ScaleFactorED1Ev align=16 execute ; section number 26, code
;  Communal section not supported by YASM

_ZN7EndgameIL11EndgameType10E11ScaleFactorED1Ev:; Function begin
        ret                                             ; 0000 _ C3
; _ZN7EndgameIL11EndgameType10E11ScaleFactorED1Ev End of function

        nop                                             ; 0001 _ 90
        nop                                             ; 0002 _ 90
        nop                                             ; 0003 _ 90
        nop                                             ; 0004 _ 90
        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZN7EndgameIL11EndgameType10E11ScaleFactorED1Ev align=4 noexecute ; section number 27, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZN7EndgameIL11EndgameType1E5ValueED1Ev align=16 execute ; section number 29, code
;  Communal section not supported by YASM

_ZN7EndgameIL11EndgameType1E5ValueED1Ev:; Function begin
        ret                                             ; 0000 _ C3
; _ZN7EndgameIL11EndgameType1E5ValueED1Ev End of function

        nop                                             ; 0001 _ 90
        nop                                             ; 0002 _ 90
        nop                                             ; 0003 _ 90
        nop                                             ; 0004 _ 90
        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZN7EndgameIL11EndgameType1E5ValueED1Ev align=4 noexecute ; section number 30, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZNK7EndgameIL11EndgameType10E11ScaleFactorE11strong_sideEv align=16 execute ; section number 32, code
;  Communal section not supported by YASM

_ZNK7EndgameIL11EndgameType10E11ScaleFactorE11strong_sideEv:; Function begin
        mov     eax, dword [rcx+8H]                     ; 0000 _ 8B. 41, 08
        ret                                             ; 0003 _ C3
; _ZNK7EndgameIL11EndgameType10E11ScaleFactorE11strong_sideEv End of function

        nop                                             ; 0004 _ 90
        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZNK7EndgameIL11EndgameType10E11ScaleFactorE11strong_sideEv align=4 noexecute ; section number 33, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZNK7EndgameIL11EndgameType1E5ValueE11strong_sideEv align=16 execute ; section number 35, code
;  Communal section not supported by YASM

_ZNK7EndgameIL11EndgameType1E5ValueE11strong_sideEv:; Function begin
        mov     eax, dword [rcx+8H]                     ; 0000 _ 8B. 41, 08
        ret                                             ; 0003 _ C3
; _ZNK7EndgameIL11EndgameType1E5ValueE11strong_sideEv End of function

        nop                                             ; 0004 _ 90
        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZNK7EndgameIL11EndgameType1E5ValueE11strong_sideEv align=4 noexecute ; section number 36, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZN7EndgameIL11EndgameType1E5ValueED0Ev align=16 execute ; section number 38, code
;  Communal section not supported by YASM

_ZN7EndgameIL11EndgameType1E5ValueED0Ev:; Function begin
        jmp     _ZdlPv                                  ; 0000 _ E9, 00000000(rel)
; _ZN7EndgameIL11EndgameType1E5ValueED0Ev End of function

        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZN7EndgameIL11EndgameType1E5ValueED0Ev align=4 noexecute ; section number 39, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZN7EndgameIL11EndgameType10E11ScaleFactorED0Ev align=16 execute ; section number 41, code
;  Communal section not supported by YASM

_ZN7EndgameIL11EndgameType10E11ScaleFactorED0Ev:; Function begin
        jmp     _ZdlPv                                  ; 0000 _ E9, 00000000(rel)
; _ZN7EndgameIL11EndgameType10E11ScaleFactorED0Ev End of function

        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZN7EndgameIL11EndgameType10E11ScaleFactorED0Ev align=4 noexecute ; section number 42, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZN7EndgameIL11EndgameType11E11ScaleFactorED0Ev align=16 execute ; section number 44, code
;  Communal section not supported by YASM

_ZN7EndgameIL11EndgameType11E11ScaleFactorED0Ev:; Function begin
        jmp     _ZdlPv                                  ; 0000 _ E9, 00000000(rel)
; _ZN7EndgameIL11EndgameType11E11ScaleFactorED0Ev End of function

        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZN7EndgameIL11EndgameType11E11ScaleFactorED0Ev align=4 noexecute ; section number 45, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZN7EndgameIL11EndgameType15E11ScaleFactorED0Ev align=16 execute ; section number 47, code
;  Communal section not supported by YASM

_ZN7EndgameIL11EndgameType15E11ScaleFactorED0Ev:; Function begin
        jmp     _ZdlPv                                  ; 0000 _ E9, 00000000(rel)
; _ZN7EndgameIL11EndgameType15E11ScaleFactorED0Ev End of function

        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZN7EndgameIL11EndgameType15E11ScaleFactorED0Ev align=4 noexecute ; section number 48, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZN7EndgameIL11EndgameType21E11ScaleFactorED0Ev align=16 execute ; section number 50, code
;  Communal section not supported by YASM

_ZN7EndgameIL11EndgameType21E11ScaleFactorED0Ev:; Function begin
        jmp     _ZdlPv                                  ; 0000 _ E9, 00000000(rel)
; _ZN7EndgameIL11EndgameType21E11ScaleFactorED0Ev End of function

        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZN7EndgameIL11EndgameType21E11ScaleFactorED0Ev align=4 noexecute ; section number 51, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_ align=16 execute ; section number 53, code
;  Communal section not supported by YASM

_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_:; Function begin
        push    rdi                                     ; 0000 _ 57
        push    rsi                                     ; 0001 _ 56
        push    rbx                                     ; 0002 _ 53
        sub     rsp, 32                                 ; 0003 _ 48: 83. EC, 20
        mov     r9b, 1                                  ; 0007 _ 41: B1, 01
        mov     rax, qword [rdx+10H]                    ; 000A _ 48: 8B. 42, 10
        lea     rsi, [rdx+8H]                           ; 000E _ 48: 8D. 72, 08
        mov     rbx, rcx                                ; 0012 _ 48: 89. CB
        mov     rdi, r8                                 ; 0015 _ 4C: 89. C7
?_116:  test    rax, rax                                ; 0018 _ 48: 85. C0
        jz      ?_119                                   ; 001B _ 74, 21
        mov     rcx, qword [rax+20H]                    ; 001D _ 48: 8B. 48, 20
        cmp     qword [rdi], rcx                        ; 0021 _ 48: 39. 0F
        jnc     ?_117                                   ; 0024 _ 73, 09
        mov     r8, qword [rax+10H]                     ; 0026 _ 4C: 8B. 40, 10
        mov     r9b, 1                                  ; 002A _ 41: B1, 01
        jmp     ?_118                                   ; 002D _ EB, 07

?_117:  mov     r8, qword [rax+18H]                     ; 002F _ 4C: 8B. 40, 18
        xor     r9d, r9d                                ; 0033 _ 45: 31. C9
?_118:  mov     rsi, rax                                ; 0036 _ 48: 89. C6
        mov     rax, r8                                 ; 0039 _ 4C: 89. C0
        jmp     ?_116                                   ; 003C _ EB, DA
; _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_ End of function

?_119:  ; Local function
        test    r9b, r9b                                ; 003E _ 45: 84. C9
        mov     rax, rsi                                ; 0041 _ 48: 89. F0
        jz      ?_120                                   ; 0044 _ 74, 0E
        cmp     rsi, qword [rdx+18H]                    ; 0046 _ 48: 3B. 72, 18
        jz      ?_121                                   ; 004A _ 74, 11
        mov     rcx, rsi                                ; 004C _ 48: 89. F1
        call    _ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base; 004F _ E8, 00000000(rel)
?_120:  mov     rdi, qword [rdi]                        ; 0054 _ 48: 8B. 3F
        cmp     qword [rax+20H], rdi                    ; 0057 _ 48: 39. 78, 20
        jnc     ?_122                                   ; 005B _ 73, 0D
?_121:  mov     qword [rbx], 0                          ; 005D _ 48: C7. 03, 00000000
        mov     qword [rbx+8H], rsi                     ; 0064 _ 48: 89. 73, 08
        jmp     ?_123                                   ; 0068 _ EB, 0B

?_122:  mov     qword [rbx], rax                        ; 006A _ 48: 89. 03
        mov     qword [rbx+8H], 0                       ; 006D _ 48: C7. 43, 08, 00000000
?_123:  mov     rax, rbx                                ; 0075 _ 48: 89. D8
        add     rsp, 32                                 ; 0078 _ 48: 83. C4, 20
        pop     rbx                                     ; 007C _ 5B
        pop     rsi                                     ; 007D _ 5E
        pop     rdi                                     ; 007E _ 5F
        ret                                             ; 007F _ C3


SECTION .xdata$_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_ align=4 noexecute ; section number 54, const
;  Communal section not supported by YASM

        db 01H, 07H, 04H, 00H, 07H, 32H, 03H, 30H       ; 0000 _ .....2.0
        db 02H, 60H, 01H, 70H                           ; 0008 _ .`.p


SECTION .text$_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_ align=16 execute ; section number 56, code
;  Communal section not supported by YASM

_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_:; Function begin
        push    rdi                                     ; 0000 _ 57
        push    rsi                                     ; 0001 _ 56
        push    rbx                                     ; 0002 _ 53
        sub     rsp, 32                                 ; 0003 _ 48: 83. EC, 20
        mov     r9b, 1                                  ; 0007 _ 41: B1, 01
        mov     rax, qword [rdx+10H]                    ; 000A _ 48: 8B. 42, 10
        lea     rsi, [rdx+8H]                           ; 000E _ 48: 8D. 72, 08
        mov     rbx, rcx                                ; 0012 _ 48: 89. CB
        mov     rdi, r8                                 ; 0015 _ 4C: 89. C7
?_124:  test    rax, rax                                ; 0018 _ 48: 85. C0
        jz      ?_127                                   ; 001B _ 74, 21
        mov     rcx, qword [rax+20H]                    ; 001D _ 48: 8B. 48, 20
        cmp     qword [rdi], rcx                        ; 0021 _ 48: 39. 0F
        jnc     ?_125                                   ; 0024 _ 73, 09
        mov     r8, qword [rax+10H]                     ; 0026 _ 4C: 8B. 40, 10
        mov     r9b, 1                                  ; 002A _ 41: B1, 01
        jmp     ?_126                                   ; 002D _ EB, 07

?_125:  mov     r8, qword [rax+18H]                     ; 002F _ 4C: 8B. 40, 18
        xor     r9d, r9d                                ; 0033 _ 45: 31. C9
?_126:  mov     rsi, rax                                ; 0036 _ 48: 89. C6
        mov     rax, r8                                 ; 0039 _ 4C: 89. C0
        jmp     ?_124                                   ; 003C _ EB, DA
; _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_ End of function

?_127:  ; Local function
        test    r9b, r9b                                ; 003E _ 45: 84. C9
        mov     rax, rsi                                ; 0041 _ 48: 89. F0
        jz      ?_128                                   ; 0044 _ 74, 0E
        cmp     rsi, qword [rdx+18H]                    ; 0046 _ 48: 3B. 72, 18
        jz      ?_129                                   ; 004A _ 74, 11
        mov     rcx, rsi                                ; 004C _ 48: 89. F1
        call    _ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base; 004F _ E8, 00000000(rel)
?_128:  mov     rdi, qword [rdi]                        ; 0054 _ 48: 8B. 3F
        cmp     qword [rax+20H], rdi                    ; 0057 _ 48: 39. 78, 20
        jnc     ?_130                                   ; 005B _ 73, 0D
?_129:  mov     qword [rbx], 0                          ; 005D _ 48: C7. 03, 00000000
        mov     qword [rbx+8H], rsi                     ; 0064 _ 48: 89. 73, 08
        jmp     ?_131                                   ; 0068 _ EB, 0B

?_130:  mov     qword [rbx], rax                        ; 006A _ 48: 89. 03
        mov     qword [rbx+8H], 0                       ; 006D _ 48: C7. 43, 08, 00000000
?_131:  mov     rax, rbx                                ; 0075 _ 48: 89. D8
        add     rsp, 32                                 ; 0078 _ 48: 83. C4, 20
        pop     rbx                                     ; 007C _ 5B
        pop     rsi                                     ; 007D _ 5E
        pop     rdi                                     ; 007E _ 5F
        ret                                             ; 007F _ C3


SECTION .xdata$_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE24_M_get_insert_unique_posERS1_ align=4 noexecute ; section number 57, const
;  Communal section not supported by YASM

        db 01H, 07H, 04H, 00H, 07H, 32H, 03H, 30H       ; 0000 _ .....2.0
        db 02H, 60H, 01H, 70H                           ; 0008 _ .`.p


SECTION .text$_ZNK7EndgameIL11EndgameType15E11ScaleFactorE11strong_sideEv align=16 execute ; section number 59, code
;  Communal section not supported by YASM

_ZNK7EndgameIL11EndgameType15E11ScaleFactorE11strong_sideEv:; Function begin
        mov     eax, dword [rcx+8H]                     ; 0000 _ 8B. 41, 08
        ret                                             ; 0003 _ C3
; _ZNK7EndgameIL11EndgameType15E11ScaleFactorE11strong_sideEv End of function

        nop                                             ; 0004 _ 90
        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZNK7EndgameIL11EndgameType15E11ScaleFactorE11strong_sideEv align=4 noexecute ; section number 60, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZNK7EndgameIL11EndgameType21E11ScaleFactorE11strong_sideEv align=16 execute ; section number 62, code
;  Communal section not supported by YASM

_ZNK7EndgameIL11EndgameType21E11ScaleFactorE11strong_sideEv:; Function begin
        mov     eax, dword [rcx+8H]                     ; 0000 _ 8B. 41, 08
        ret                                             ; 0003 _ C3
; _ZNK7EndgameIL11EndgameType21E11ScaleFactorE11strong_sideEv End of function

        nop                                             ; 0004 _ 90
        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZNK7EndgameIL11EndgameType21E11ScaleFactorE11strong_sideEv align=4 noexecute ; section number 63, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZNK7EndgameIL11EndgameType11E11ScaleFactorE11strong_sideEv align=16 execute ; section number 65, code
;  Communal section not supported by YASM

_ZNK7EndgameIL11EndgameType11E11ScaleFactorE11strong_sideEv:; Function begin
        mov     eax, dword [rcx+8H]                     ; 0000 _ 8B. 41, 08
        ret                                             ; 0003 _ C3
; _ZNK7EndgameIL11EndgameType11E11ScaleFactorE11strong_sideEv End of function

        nop                                             ; 0004 _ 90
        nop                                             ; 0005 _ 90
        nop                                             ; 0006 _ 90
        nop                                             ; 0007 _ 90
        nop                                             ; 0008 _ 90
        nop                                             ; 0009 _ 90
        nop                                             ; 000A _ 90
        nop                                             ; 000B _ 90
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata$_ZNK7EndgameIL11EndgameType11E11ScaleFactorE11strong_sideEv align=4 noexecute ; section number 66, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .rdata  align=64 noexecute                      ; section number 68, const

_ZN12_GLOBAL__N_1L15QuadraticTheirsE:                   ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0008 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0010 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........
        db 24H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0020 _ $.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0028 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........
        db 09H, 00H, 00H, 00H, 3FH, 00H, 00H, 00H       ; 0040 _ ....?...
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0048 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........
        db 3BH, 00H, 00H, 00H, 41H, 00H, 00H, 00H       ; 0060 _ ;...A...
        db 2AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0068 _ *.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0070 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........
        db 2EH, 00H, 00H, 00H, 27H, 00H, 00H, 00H       ; 0080 _ ....'...
        db 18H, 00H, 00H, 00H, 0E8H, 0FFH, 0FFH, 0FFH   ; 0088 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0090 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0098 _ ........
        db 65H, 00H, 00H, 00H, 64H, 00H, 00H, 00H       ; 00A0 _ e...d...
        db 0DBH, 0FFH, 0FFH, 0FFH, 8DH, 00H, 00H, 00H   ; 00A8 _ ........
        db 0CH, 01H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

_ZN12_GLOBAL__N_1L13QuadraticOursE:                     ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00C0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00C8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D8 _ ........
        db 28H, 00H, 00H, 00H, 02H, 00H, 00H, 00H       ; 00E0 _ (.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00E8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F8 _ ........
        db 20H, 00H, 00H, 00H, 0FFH, 00H, 00H, 00H      ; 0100 _  .......
        db 0FDH, 0FFH, 0FFH, 0FFH, 00H, 00H, 00H, 00H   ; 0108 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0110 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0118 _ ........
        db 00H, 00H, 00H, 00H, 68H, 00H, 00H, 00H       ; 0120 _ ....h...
        db 04H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0128 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0130 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0138 _ ........
        db 0E6H, 0FFH, 0FFH, 0FFH, 0FEH, 0FFH, 0FFH, 0FFH; 0140 _ ........
        db 2FH, 00H, 00H, 00H, 69H, 00H, 00H, 00H       ; 0148 _ /...i...
        db 6BH, 0FFH, 0FFH, 0FFH, 00H, 00H, 00H, 00H    ; 0150 _ k.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........
        db 47H, 0FFH, 0FFH, 0FFH, 18H, 00H, 00H, 00H    ; 0160 _ G.......
        db 7AH, 00H, 00H, 00H, 89H, 00H, 00H, 00H       ; 0168 _ z.......
        db 7AH, 0FFH, 0FFH, 0FFH, 00H, 00H, 00H, 00H    ; 0170 _ z.......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0178 _ ........

_ZN12_GLOBAL__N_1L6LinearE:                             ; byte
        db 83H, 06H, 00H, 00H, 58H, 0FFH, 0FFH, 0FFH    ; 0180 _ ....X...
        db 0FDH, 0FBH, 0FFH, 0FFH, 5AH, 0FFH, 0FFH, 0FFH; 0188 _ ....Z...
        db 0EEH, 00H, 00H, 00H, 76H, 0FFH, 0FFH, 0FFH   ; 0190 _ ....v...

_ZStL19piecewise_construct:                             ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0198 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01A0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01B8 _ ........


SECTION .rdata$_ZTV7EndgameIL11EndgameType1E5ValueE align=32 noexecute ; section number 69, const
;  Communal section not supported by YASM

_ZTV7EndgameIL11EndgameType1E5ValueE:                   ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0008 _ ........
        dq _ZN7EndgameIL11EndgameType1E5ValueED1Ev      ; 0010 _ 0000000000000000 (d)
        dq _ZN7EndgameIL11EndgameType1E5ValueED0Ev      ; 0018 _ 0000000000000000 (d)
        dq _ZNK7EndgameIL11EndgameType1E5ValueE11strong_sideEv; 0020 _ 0000000000000000 (d)
        dq _ZNK7EndgameIL11EndgameType1E5ValueEclERK8Position; 0028 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0030 _ 0000000000000000 
        dq 0000000000000000H                            ; 0038 _ 0000000000000000 


SECTION .rdata$_ZTV7EndgameIL11EndgameType10E11ScaleFactorE align=32 noexecute ; section number 70, const
;  Communal section not supported by YASM

_ZTV7EndgameIL11EndgameType10E11ScaleFactorE:           ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0008 _ ........
        dq _ZN7EndgameIL11EndgameType10E11ScaleFactorED1Ev; 0010 _ 0000000000000000 (d)
        dq _ZN7EndgameIL11EndgameType10E11ScaleFactorED0Ev; 0018 _ 0000000000000000 (d)
        dq _ZNK7EndgameIL11EndgameType10E11ScaleFactorE11strong_sideEv; 0020 _ 0000000000000000 (d)
        dq _ZNK7EndgameIL11EndgameType10E11ScaleFactorEclERK8Position; 0028 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0030 _ 0000000000000000 
        dq 0000000000000000H                            ; 0038 _ 0000000000000000 


SECTION .rdata$_ZTV7EndgameIL11EndgameType11E11ScaleFactorE align=32 noexecute ; section number 71, const
;  Communal section not supported by YASM

_ZTV7EndgameIL11EndgameType11E11ScaleFactorE:           ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0008 _ ........
        dq _ZN7EndgameIL11EndgameType11E11ScaleFactorED1Ev; 0010 _ 0000000000000000 (d)
        dq _ZN7EndgameIL11EndgameType11E11ScaleFactorED0Ev; 0018 _ 0000000000000000 (d)
        dq _ZNK7EndgameIL11EndgameType11E11ScaleFactorE11strong_sideEv; 0020 _ 0000000000000000 (d)
        dq _ZNK7EndgameIL11EndgameType11E11ScaleFactorEclERK8Position; 0028 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0030 _ 0000000000000000 
        dq 0000000000000000H                            ; 0038 _ 0000000000000000 


SECTION .rdata$_ZTV7EndgameIL11EndgameType15E11ScaleFactorE align=32 noexecute ; section number 72, const
;  Communal section not supported by YASM

_ZTV7EndgameIL11EndgameType15E11ScaleFactorE:           ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0008 _ ........
        dq _ZN7EndgameIL11EndgameType15E11ScaleFactorED1Ev; 0010 _ 0000000000000000 (d)
        dq _ZN7EndgameIL11EndgameType15E11ScaleFactorED0Ev; 0018 _ 0000000000000000 (d)
        dq _ZNK7EndgameIL11EndgameType15E11ScaleFactorE11strong_sideEv; 0020 _ 0000000000000000 (d)
        dq _ZNK7EndgameIL11EndgameType15E11ScaleFactorEclERK8Position; 0028 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0030 _ 0000000000000000 
        dq 0000000000000000H                            ; 0038 _ 0000000000000000 


SECTION .rdata$_ZTV7EndgameIL11EndgameType21E11ScaleFactorE align=32 noexecute ; section number 73, const
;  Communal section not supported by YASM

_ZTV7EndgameIL11EndgameType21E11ScaleFactorE:           ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0008 _ ........
        dq _ZN7EndgameIL11EndgameType21E11ScaleFactorED1Ev; 0010 _ 0000000000000000 (d)
        dq _ZN7EndgameIL11EndgameType21E11ScaleFactorED0Ev; 0018 _ 0000000000000000 (d)
        dq _ZNK7EndgameIL11EndgameType21E11ScaleFactorE11strong_sideEv; 0020 _ 0000000000000000 (d)
        dq _ZNK7EndgameIL11EndgameType21E11ScaleFactorEclERK8Position; 0028 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0030 _ 0000000000000000 
        dq 0000000000000000H                            ; 0038 _ 0000000000000000 


SECTION .rdata$zzz align=16 noexecute                   ; section number 74, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


