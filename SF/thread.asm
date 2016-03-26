; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\thread.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro, x64

default rel

global _ZN10ThreadPool4initEv: function
global _ZN6ThreadC1Ev: function
global _ZN6ThreadC2Ev: function
global start_routine: function
global _ZN6Thread9idle_loopEv: function
global _ZN10ThreadPool16read_uci_optionsEv: function
global _ZN10ThreadPool14start_thinkingERK8PositionRKN6Search10LimitsTypeERSt10unique_ptrISt5stackI9StateInfoSt5dequeIS9_SaIS9_EEESt14default_deleteISD_EE: function
global _ZN6Thread24wait_for_search_finishedEv: function
global _ZN6Thread15start_searchingEb: function
global _ZN10ThreadPool14nodes_searchedEv: function
global _ZN10ThreadPool4exitEv: function
global _ZN6ThreadD1Ev: function
global _ZN6ThreadD2Ev: function
global Threads
global _ZN6ThreadD0Ev: function
global _ZN6Thread4waitERVKb: function
global _ZSt10__fill_n_aIPN5Pawns5EntryEyS1_EN9__gnu_cxx11__enable_ifIXntsrSt11__is_scalarIT1_E7__valueET_E6__typeES8_T0_RKS6_: function
global _ZN17ConditionVariable4waitER5Mutex: function
global .weak._ZNSt6vectorIP6ThreadSaIS1_EE12emplace_backIJS1_EEEvDpOT_._ZN10ThreadPool4initEv
global _ZNSt6vectorIP6ThreadSaIS1_EE12emplace_backIIS1_EEEvDpOT_: function
global .weak._ZNSt6vectorIP6ThreadSaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_._ZN10ThreadPool4initEv
global _ZNSt6vectorIP6ThreadSaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_: function
global _ZN10ThreadPool4mainEv: function
global _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_: function
global .weak._ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_._ZN10ThreadPool4initEv
global _ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_: function
global _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E: function
global _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E: function
global _ZTV6Thread
global .refptr._ZN6Search11SetupStatesE
global .refptr._ZN6Search6LimitsE
global .refptr._ZN6Search7SignalsE
global .refptr.Opt
global .refptr._ZTV10MainThread

extern _ZTV10MainThread                                 ; byte
extern Opt                                              ; byte
extern _ZN6Search7SignalsE                              ; byte
extern _ZN6Search6LimitsE                               ; byte
extern _ZN6Search11SetupStatesE                         ; byte
extern _ZN6Thread6searchEv                              ; near
extern _ZSt17__throw_bad_allocv                         ; near
extern memmove                                          ; near
extern _ZSt24__throw_out_of_range_fmtPKcz               ; near
extern _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_  ; near
extern _ZN8PositionaSERKS_                              ; near
extern _ZdlPv                                           ; near
extern memset                                           ; near
extern _ZN8EndgamesC1Ev                                 ; near
extern _Znwy                                            ; near
extern atexit                                           ; near
extern __imp_DeleteCriticalSection                      ; qword
extern __imp_CloseHandle                                ; qword
extern __imp_SetEvent                                   ; qword
extern __imp_WaitForSingleObject                        ; qword
extern __imp_LeaveCriticalSection                       ; qword
extern __imp_CreateThread                               ; qword
extern __imp_EnterCriticalSection                       ; qword
extern __imp_CreateEventA                               ; qword
extern __imp_InitializeCriticalSection                  ; qword


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_ZN10ThreadPool4initEv:
        push    rsi                                     ; 0000 _ 56
        push    rbx                                     ; 0001 _ 53
        sub     rsp, 56                                 ; 0002 _ 48: 83. EC, 38
        mov     rsi, rcx                                ; 0006 _ 48: 89. CE
        mov     ecx, 9456                               ; 0009 _ B9, 000024F0
        call    _Znwy                                   ; 000E _ E8, 00000000(rel)
        mov     rcx, rax                                ; 0013 _ 48: 89. C1
        mov     rbx, rax                                ; 0016 _ 48: 89. C3
        call    _ZN6ThreadC2Ev                          ; 0019 _ E8, 00000032
        mov     rax, qword [rel .refptr._ZTV10MainThread]; 001E _ 48: 8B. 05, 00000000(rel)
        lea     rdx, [rsp+28H]                          ; 0025 _ 48: 8D. 54 24, 28
        mov     rcx, rsi                                ; 002A _ 48: 89. F1
        add     rax, 16                                 ; 002D _ 48: 83. C0, 10
        mov     qword [rbx], rax                        ; 0031 _ 48: 89. 03
        mov     qword [rsp+28H], rbx                    ; 0034 _ 48: 89. 5C 24, 28
        call    _ZNSt6vectorIP6ThreadSaIS1_EE12emplace_backIIS1_EEEvDpOT_; 0039 _ E8, 00000000(rel)
        mov     rcx, rsi                                ; 003E _ 48: 89. F1
        call    _ZN10ThreadPool16read_uci_optionsEv     ; 0041 _ E8, 000002CA
        nop                                             ; 0046 _ 90
        add     rsp, 56                                 ; 0047 _ 48: 83. C4, 38
        pop     rbx                                     ; 004B _ 5B
        pop     rsi                                     ; 004C _ 5E
        ret                                             ; 004D _ C3

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

_ZN6ThreadC1Ev:; Function begin

_ZN6ThreadC2Ev:
        push    r12                                     ; 0050 _ 41: 54
        push    rbp                                     ; 0052 _ 55
        push    rdi                                     ; 0053 _ 57
        push    rsi                                     ; 0054 _ 56
        push    rbx                                     ; 0055 _ 53
        sub     rsp, 192                                ; 0056 _ 48: 81. EC, 000000C0
        lea     rax, [rel _ZTV6Thread+10H]              ; 005D _ 48: 8D. 05, 00000010(rel)
        xor     esi, esi                                ; 0064 _ 31. F6
        lea     rbp, [rcx+10H]                          ; 0066 _ 48: 8D. 69, 10
        mov     r12, rcx                                ; 006A _ 49: 89. CC
        mov     qword [rcx], rax                        ; 006D _ 48: 89. 01
        lea     rbx, [rsp+30H]                          ; 0070 _ 48: 8D. 5C 24, 30
        mov     rcx, rbp                                ; 0075 _ 48: 89. E9
        call    near [rel __imp_InitializeCriticalSection]; 0078 _ FF. 15, 00000000(rel)
        xor     r9d, r9d                                ; 007E _ 45: 31. C9
        xor     r8d, r8d                                ; 0081 _ 45: 31. C0
        xor     edx, edx                                ; 0084 _ 31. D2
        xor     ecx, ecx                                ; 0086 _ 31. C9
        mov     rdi, rbx                                ; 0088 _ 48: 89. DF
        call    near [rel __imp_CreateEventA]           ; 008B _ FF. 15, 00000000(rel)
        mov     ecx, 2228224                            ; 0091 _ B9, 00220000
        mov     qword [r12+48H], 0                      ; 0096 _ 49: C7. 44 24, 48, 00000000
        mov     qword [r12+38H], rax                    ; 009F _ 49: 89. 44 24, 38
        mov     qword [r12+50H], 0                      ; 00A4 _ 49: C7. 44 24, 50, 00000000
        mov     qword [r12+58H], 0                      ; 00AD _ 49: C7. 44 24, 58, 00000000
        call    _Znwy                                   ; 00B6 _ E8, 00000000(rel)
        mov     ecx, 34                                 ; 00BB _ B9, 00000022
        mov     r8, rbx                                 ; 00C0 _ 49: 89. D8
        lea     rdx, [rax+220000H]                      ; 00C3 _ 48: 8D. 90, 00220000
        mov     r9, rax                                 ; 00CA _ 49: 89. C1
        mov     qword [r12+48H], rax                    ; 00CD _ 49: 89. 44 24, 48
        mov     qword [r12+50H], rax                    ; 00D2 _ 49: 89. 44 24, 50
        mov     eax, esi                                ; 00D7 _ 89. F0
        rep stosd                                       ; 00D9 _ F3: AB
        mov     qword [r12+58H], rdx                    ; 00DB _ 49: 89. 54 24, 58
        mov     rcx, r9                                 ; 00E0 _ 4C: 89. C9
        mov     edx, 16384                              ; 00E3 _ BA, 00004000
        call    _ZSt10__fill_n_aIPN5Pawns5EntryEyS1_EN9__gnu_cxx11__enable_ifIXntsrSt11__is_scalarIT1_E7__valueET_E6__typeES8_T0_RKS6_; 00E8 _ E8, 00000000(rel)
        mov     r8, qword [r12+58H]                     ; 00ED _ 4D: 8B. 44 24, 58
        mov     ecx, 393216                             ; 00F2 _ B9, 00060000
        mov     rdi, rbx                                ; 00F7 _ 48: 89. DF
        mov     qword [r12+60H], 0                      ; 00FA _ 49: C7. 44 24, 60, 00000000
        mov     qword [r12+68H], 0                      ; 0103 _ 49: C7. 44 24, 68, 00000000
        mov     qword [r12+70H], 0                      ; 010C _ 49: C7. 44 24, 70, 00000000
        mov     qword [r12+50H], r8                     ; 0115 _ 4D: 89. 44 24, 50
        call    _Znwy                                   ; 011A _ E8, 00000000(rel)
        mov     ecx, 12                                 ; 011F _ B9, 0000000C
        xor     r8d, r8d                                ; 0124 _ 45: 31. C0
        mov     r11d, 12                                ; 0127 _ 41: BB, 0000000C
        lea     r10, [rax+60000H]                       ; 012D _ 4C: 8D. 90, 00060000
        mov     r9, rax                                 ; 0134 _ 49: 89. C1
        mov     qword [r12+60H], rax                    ; 0137 _ 49: 89. 44 24, 60
        mov     qword [r12+68H], rax                    ; 013C _ 49: 89. 44 24, 68
        mov     eax, esi                                ; 0141 _ 89. F0
        rep stosd                                       ; 0143 _ F3: AB
        mov     qword [r12+70H], r10                    ; 0145 _ 4D: 89. 54 24, 70
?_001:  lea     rdx, [r9+r8]                            ; 014A _ 4B: 8D. 14 01
        add     r8, 48                                  ; 014E _ 49: 83. C0, 30
        mov     rsi, rbx                                ; 0152 _ 48: 89. DE
        cmp     r8, 393216                              ; 0155 _ 49: 81. F8, 00060000
        mov     rdi, rdx                                ; 015C _ 48: 89. D7
        mov     rcx, r11                                ; 015F _ 4C: 89. D9
        rep movsd                                       ; 0162 _ F3: A5
        jnz     ?_001                                   ; 0164 _ 75, E4
        mov     rbx, qword [r12+70H]                    ; 0166 _ 49: 8B. 5C 24, 70
        lea     rcx, [r12+78H]                          ; 016B _ 49: 8D. 4C 24, 78
        lea     rdi, [r12+38H]                          ; 0170 _ 49: 8D. 7C 24, 38
        mov     qword [r12+68H], rbx                    ; 0175 _ 49: 89. 5C 24, 68
        call    _ZN8EndgamesC1Ev                        ; 017A _ E8, 00000000(rel)
        lea     rcx, [r12+4D4H]                         ; 017F _ 49: 8D. 8C 24, 000004D4
        xor     edx, edx                                ; 0187 _ 31. D2
        mov     r8d, 4096                               ; 0189 _ 41: B8, 00001000
        mov     qword [r12+4B8H], 0                     ; 018F _ 49: C7. 84 24, 000004B8, 00000000
        mov     qword [r12+4C0H], 0                     ; 019B _ 49: C7. 84 24, 000004C0, 00000000
        mov     qword [r12+4C8H], 0                     ; 01A7 _ 49: C7. 84 24, 000004C8, 00000000
        mov     byte [r12+40H], 0                       ; 01B3 _ 41: C6. 44 24, 40, 00
        mov     byte [r12+24D8H], 0                     ; 01B9 _ 41: C6. 84 24, 000024D8, 00
        mov     dword [r12+0ECH], 0                     ; 01C2 _ 41: C7. 84 24, 000000EC, 00000000
        mov     dword [r12+0E8H], 0                     ; 01CE _ 41: C7. 84 24, 000000E8, 00000000
        call    memset                                  ; 01DA _ E8, 00000000(rel)
        mov     r8d, 4096                               ; 01DF _ 41: B8, 00001000
        xor     edx, edx                                ; 01E5 _ 31. D2
        lea     rcx, [r12+14D4H]                        ; 01E7 _ 49: 8D. 8C 24, 000014D4
        call    memset                                  ; 01EF _ E8, 00000000(rel)
        mov     r9, qword [rel ?_031]                   ; 01F4 _ 4C: 8B. 0D, 00000008(rel)
        mov     rcx, rbp                                ; 01FB _ 48: 89. E9
        sub     r9, qword [rel Threads]                 ; 01FE _ 4C: 2B. 0D, 00000000(rel)
        sar     r9, 3                                   ; 0205 _ 49: C1. F9, 03
        mov     qword [r12+0D8H], r9                    ; 0209 _ 4D: 89. 8C 24, 000000D8
        call    near [rel __imp_EnterCriticalSection]   ; 0211 _ FF. 15, 00000000(rel)
        mov     byte [r12+41H], 1                       ; 0217 _ 41: C6. 44 24, 41, 01
        mov     r9, r12                                 ; 021D _ 4D: 89. E1
        xor     edx, edx                                ; 0220 _ 31. D2
        mov     qword [rsp+28H], 0                      ; 0222 _ 48: C7. 44 24, 28, 00000000
        lea     r8, [rel start_routine]                 ; 022B _ 4C: 8D. 05, 0000004E(rel)
        xor     ecx, ecx                                ; 0232 _ 31. C9
        mov     dword [rsp+20H], 0                      ; 0234 _ C7. 44 24, 20, 00000000
        call    near [rel __imp_CreateThread]           ; 023C _ FF. 15, 00000000(rel)
        mov     qword [r12+8H], rax                     ; 0242 _ 49: 89. 44 24, 08
?_002:  cmp     byte [r12+41H], 0                       ; 0247 _ 41: 80. 7C 24, 41, 00
        jnz     ?_003                                   ; 024D _ 75, 18
        mov     rcx, rbp                                ; 024F _ 48: 89. E9
        call    near [rel __imp_LeaveCriticalSection]   ; 0252 _ FF. 15, 00000000(rel)
        nop                                             ; 0258 _ 90
        add     rsp, 192                                ; 0259 _ 48: 81. C4, 000000C0
        pop     rbx                                     ; 0260 _ 5B
        pop     rsi                                     ; 0261 _ 5E
        pop     rdi                                     ; 0262 _ 5F
        pop     rbp                                     ; 0263 _ 5D
        pop     r12                                     ; 0264 _ 41: 5C
        ret                                             ; 0266 _ C3
; _ZN6ThreadC1Ev End of function

?_003:  ; Local function
        mov     rdx, rbp                                ; 0267 _ 48: 89. EA
        mov     rcx, rdi                                ; 026A _ 48: 89. F9
        call    _ZN17ConditionVariable4waitER5Mutex     ; 026D _ E8, 00000000(rel)
        jmp     ?_002                                   ; 0272 _ EB, D3

; Filling space: 0CH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H
;       db 00H, 00H, 00H, 00H

ALIGN   16

start_routine:; Function begin
        sub     rsp, 40                                 ; 0280 _ 48: 83. EC, 28
        call    _ZN6Thread9idle_loopEv                  ; 0284 _ E8, 00000007
        xor     eax, eax                                ; 0289 _ 31. C0
        add     rsp, 40                                 ; 028B _ 48: 83. C4, 28
        ret                                             ; 028F _ C3
; start_routine End of function

_ZN6Thread9idle_loopEv:; Function begin
        push    r13                                     ; 0290 _ 41: 55
        push    r12                                     ; 0292 _ 41: 54
        push    rbp                                     ; 0294 _ 55
        push    rdi                                     ; 0295 _ 57
        push    rsi                                     ; 0296 _ 56
        push    rbx                                     ; 0297 _ 53
        sub     rsp, 40                                 ; 0298 _ 48: 83. EC, 28
        mov     r13, qword [rel __imp_EnterCriticalSection]; 029C _ 4C: 8B. 2D, 00000000(rel)
        mov     r12, qword [rel __imp_SetEvent]         ; 02A3 _ 4C: 8B. 25, 00000000(rel)
        mov     rbp, qword [rel __imp_LeaveCriticalSection]; 02AA _ 48: 8B. 2D, 00000000(rel)
        mov     rbx, rcx                                ; 02B1 _ 48: 89. CB
        jmp     ?_007                                   ; 02B4 _ EB, 44

?_004:  lea     rsi, [rbx+10H]                          ; 02B6 _ 48: 8D. 73, 10
        lea     rdi, [rbx+38H]                          ; 02BA _ 48: 8D. 7B, 38
        mov     rcx, rsi                                ; 02BE _ 48: 89. F1
        call    r13                                     ; 02C1 _ 41: FF. D5
        mov     byte [rbx+41H], 0                       ; 02C4 _ C6. 43, 41, 00
?_005:  cmp     byte [rbx+40H], 0                       ; 02C8 _ 80. 7B, 40, 00
        jnz     ?_006                                   ; 02CC _ 75, 18
        mov     rcx, qword [rbx+38H]                    ; 02CE _ 48: 8B. 4B, 38
        call    r12                                     ; 02D2 _ 41: FF. D4
        mov     rdx, rsi                                ; 02D5 _ 48: 89. F2
        mov     rcx, rdi                                ; 02D8 _ 48: 89. F9
        call    _ZN17ConditionVariable4waitER5Mutex     ; 02DB _ E8, 00000000(rel)
        cmp     byte [rbx+41H], 0                       ; 02E0 _ 80. 7B, 41, 00
        jz      ?_005                                   ; 02E4 _ 74, E2
?_006:  mov     rcx, rsi                                ; 02E6 _ 48: 89. F1
        call    rbp                                     ; 02E9 _ FF. D5
        cmp     byte [rbx+40H], 0                       ; 02EB _ 80. 7B, 40, 00
        jnz     ?_007                                   ; 02EF _ 75, 09
        mov     rax, qword [rbx]                        ; 02F1 _ 48: 8B. 03
        mov     rcx, rbx                                ; 02F4 _ 48: 89. D9
        call    near [rax+10H]                          ; 02F7 _ FF. 50, 10
?_007:  cmp     byte [rbx+40H], 0                       ; 02FA _ 80. 7B, 40, 00
        jz      ?_004                                   ; 02FE _ 74, B6
        add     rsp, 40                                 ; 0300 _ 48: 83. C4, 28
        pop     rbx                                     ; 0304 _ 5B
        pop     rsi                                     ; 0305 _ 5E
        pop     rdi                                     ; 0306 _ 5F
        pop     rbp                                     ; 0307 _ 5D
        pop     r12                                     ; 0308 _ 41: 5C
        pop     r13                                     ; 030A _ 41: 5D
        ret                                             ; 030C _ C3
; _ZN6Thread9idle_loopEv End of function

        nop                                             ; 030D _ 90
; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

_ZN10ThreadPool16read_uci_optionsEv:; Function begin
        push    rbp                                     ; 0310 _ 55
        push    rdi                                     ; 0311 _ 57
        push    rsi                                     ; 0312 _ 56
        push    rbx                                     ; 0313 _ 53
        sub     rsp, 56                                 ; 0314 _ 48: 83. EC, 38
        mov     rax, qword [rel .refptr.Opt]            ; 0318 _ 48: 8B. 05, 00000000(rel)
        mov     rsi, qword [rax]                        ; 031F _ 48: 8B. 30
        lea     rdi, [rsp+28H]                          ; 0322 _ 48: 8D. 7C 24, 28
        mov     rbx, rcx                                ; 0327 _ 48: 89. CB
        mov     rcx, qword [rbx+8H]                     ; 032A _ 48: 8B. 4B, 08
        mov     rdx, rcx                                ; 032E _ 48: 89. CA
        sub     rdx, qword [rbx]                        ; 0331 _ 48: 2B. 13
        sar     rdx, 3                                  ; 0334 _ 48: C1. FA, 03
        cmp     rsi, rdx                                ; 0338 _ 48: 39. D6
        ja      ?_008                                   ; 033B _ 77, 1C
        mov     rdi, rcx                                ; 033D _ 48: 89. CF
        sub     rdi, qword [rbx]                        ; 0340 _ 48: 2B. 3B
        sar     rdi, 3                                  ; 0343 _ 48: C1. FF, 03
        cmp     rsi, rdi                                ; 0347 _ 48: 39. FE
        jc      _ZN10ThreadPool16read_uci_optionsEv.cold.185; 034A _ 0F 82, 00000000(rel)
        add     rsp, 56                                 ; 0350 _ 48: 83. C4, 38
        pop     rbx                                     ; 0354 _ 5B
        pop     rsi                                     ; 0355 _ 5E
        pop     rdi                                     ; 0356 _ 5F
        pop     rbp                                     ; 0357 _ 5D
        ret                                             ; 0358 _ C3
; _ZN10ThreadPool16read_uci_optionsEv End of function

?_008:  ; Local function
        jmp     .text.unlikely+1DH                      ; 0359 _ E9, 0000001D(rel)

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

_ZN10ThreadPool14start_thinkingERK8PositionRKN6Search10LimitsTypeERSt10unique_ptrISt5stackI9StateInfoSt5dequeIS9_SaIS9_EEESt14default_deleteISD_EE:; Function begin
        push    r15                                     ; 0360 _ 41: 57
        push    r14                                     ; 0362 _ 41: 56
        push    r13                                     ; 0364 _ 41: 55
        push    r12                                     ; 0366 _ 41: 54
        push    rbp                                     ; 0368 _ 55
        push    rdi                                     ; 0369 _ 57
        push    rsi                                     ; 036A _ 56
        push    rbx                                     ; 036B _ 53
        sub     rsp, 2136                               ; 036C _ 48: 81. EC, 00000858
        mov     rdi, rcx                                ; 0373 _ 48: 89. CF
        mov     r13, rdx                                ; 0376 _ 49: 89. D5
        mov     rsi, r8                                 ; 0379 _ 4C: 89. C6
        mov     r15, r9                                 ; 037C _ 4D: 89. CF
        call    _ZN10ThreadPool4mainEv                  ; 037F _ E8, 00000000(rel)
        mov     rcx, rax                                ; 0384 _ 48: 89. C1
        call    _ZN6Thread24wait_for_search_finishedEv  ; 0387 _ E8, 00000234
        mov     rax, qword [rel .refptr._ZN6Search7SignalsE]; 038C _ 48: 8B. 05, 00000000(rel)
        mov     rcx, rdi                                ; 0393 _ 48: 89. F9
        mov     byte [rax], 0                           ; 0396 _ C6. 00, 00
        mov     byte [rax+1H], 0                        ; 0399 _ C6. 40, 01, 00
        call    _ZN10ThreadPool4mainEv                  ; 039D _ E8, 00000000(rel)
        mov     r14, qword [rax+4B8H]                   ; 03A2 _ 4C: 8B. B0, 000004B8
        mov     r12, rax                                ; 03A9 _ 49: 89. C4
        mov     rbp, qword [rax+4C0H]                   ; 03AC _ 48: 8B. A8, 000004C0
        mov     rbx, r14                                ; 03B3 _ 4C: 89. F3
        jmp     ?_011                                   ; 03B6 _ EB, 12

?_009:  mov     rcx, qword [rbx+8H]                     ; 03B8 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 03BC _ 48: 85. C9
        jz      ?_010                                   ; 03BF _ 74, 05
        call    _ZdlPv                                  ; 03C1 _ E8, 00000000(rel)
?_010:  add     rbx, 32                                 ; 03C6 _ 48: 83. C3, 20
?_011:  cmp     rbp, rbx                                ; 03CA _ 48: 39. DD
        jnz     ?_009                                   ; 03CD _ 75, E9
        mov     qword [r12+4C0H], r14                   ; 03CF _ 4D: 89. B4 24, 000004C0
        mov     rcx, rdi                                ; 03D7 _ 48: 89. F9
        call    _ZN10ThreadPool4mainEv                  ; 03DA _ E8, 00000000(rel)
        mov     rdx, r13                                ; 03DF _ 4C: 89. EA
        lea     rcx, [rax+0F0H]                         ; 03E2 _ 48: 8D. 88, 000000F0
        call    _ZN8PositionaSERKS_                     ; 03E9 _ E8, 00000000(rel)
        mov     rcx, qword [rel .refptr._ZN6Search6LimitsE]; 03EE _ 48: 8B. 0D, 00000000(rel)
        mov     rdx, rsi                                ; 03F5 _ 48: 89. F2
        call    _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_      ; 03F8 _ E8, 00000000(rel)
        mov     rcx, qword [rel .refptr._ZN6Search6LimitsE]; 03FD _ 48: 8B. 0D, 00000000(rel)
        mov     rdx, qword [rsi+18H]                    ; 0404 _ 48: 8B. 56, 18
        mov     rbx, qword [rsi+20H]                    ; 0408 _ 48: 8B. 5E, 20
        mov     ebp, dword [rsi+28H]                    ; 040C _ 8B. 6E, 28
        mov     r8d, dword [rsi+2CH]                    ; 040F _ 44: 8B. 46, 2C
        mov     r9d, dword [rsi+30H]                    ; 0413 _ 44: 8B. 4E, 30
        mov     qword [rcx+18H], rdx                    ; 0417 _ 48: 89. 51, 18
        mov     r10d, dword [rsi+34H]                   ; 041B _ 44: 8B. 56, 34
        mov     qword [rcx+20H], rbx                    ; 041F _ 48: 89. 59, 20
        mov     r11d, dword [rsi+38H]                   ; 0423 _ 44: 8B. 5E, 38
        mov     dword [rcx+28H], ebp                    ; 0427 _ 89. 69, 28
        mov     r12d, dword [rsi+3CH]                   ; 042A _ 44: 8B. 66, 3C
        mov     dword [rcx+2CH], r8d                    ; 042E _ 44: 89. 41, 2C
        mov     r14d, dword [rsi+40H]                   ; 0432 _ 44: 8B. 76, 40
        mov     dword [rcx+30H], r9d                    ; 0436 _ 44: 89. 49, 30
        mov     rax, qword [rsi+48H]                    ; 043A _ 48: 8B. 46, 48
        mov     dword [rcx+34H], r10d                   ; 043E _ 44: 89. 51, 34
        mov     rdx, qword [rsi+50H]                    ; 0442 _ 48: 8B. 56, 50
        mov     dword [rcx+38H], r11d                   ; 0446 _ 44: 89. 59, 38
        mov     dword [rcx+3CH], r12d                   ; 044A _ 44: 89. 61, 3C
        mov     dword [rcx+40H], r14d                   ; 044E _ 44: 89. 71, 40
        mov     qword [rcx+48H], rax                    ; 0452 _ 48: 89. 41, 48
        mov     qword [rcx+50H], rdx                    ; 0456 _ 48: 89. 51, 50
        mov     rcx, qword [r15]                        ; 045A _ 49: 8B. 0F
        test    rcx, rcx                                ; 045D _ 48: 85. C9
        jne     .text.unlikely+6DH                      ; 0460 _ 0F 85, 0000006D(rel)
        lea     rbx, [rsp+40H]                          ; 0466 _ 48: 8D. 5C 24, 40
        mov     rcx, r13                                ; 046B _ 4C: 89. E9
        lea     r12, [rsp+20H]                          ; 046E _ 4C: 8D. 64 24, 20
        mov     rdx, rbx                                ; 0473 _ 48: 89. DA
        call    _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_; 0476 _ E8, 00000000(rel)
        mov     r15, rax                                ; 047B _ 49: 89. C7
        mov     qword [rsp+840H], rax                   ; 047E _ 48: 89. 84 24, 00000840
        jmp     ?_015                                   ; 0486 _ E9, 000000F4

?_012:  mov     r9, qword [rsi+8H]                      ; 048B _ 4C: 8B. 4E, 08
        mov     r10, qword [rsi]                        ; 048F _ 4C: 8B. 16
        mov     r13d, dword [rbx]                       ; 0492 _ 44: 8B. 2B
        cmp     r9, r10                                 ; 0495 _ 4D: 39. D1
        jne     _ZN10ThreadPool14start_thinkingERK8PositionRKN6Search10LimitsTypeERSt10unique_ptrISt5stackI9StateInfoSt5dequeIS9_SaIS9_EEESt14default_deleteISD_EE.cold.186; 0498 _ 0F 85, 00000048(rel)
        mov     ecx, 4                                  ; 049E _ B9, 00000004
        mov     dword [rsp+20H], -32001                 ; 04A3 _ C7. 44 24, 20, FFFF82FF
        mov     dword [rsp+24H], -32001                 ; 04AB _ C7. 44 24, 24, FFFF82FF
        mov     qword [rsp+28H], 0                      ; 04B3 _ 48: C7. 44 24, 28, 00000000
        mov     qword [rsp+30H], 0                      ; 04BC _ 48: C7. 44 24, 30, 00000000
        mov     qword [rsp+38H], 0                      ; 04C5 _ 48: C7. 44 24, 38, 00000000
        call    _Znwy                                   ; 04CE _ E8, 00000000(rel)
        mov     rcx, rdi                                ; 04D3 _ 48: 89. F9
        lea     r14, [rax+4H]                           ; 04D6 _ 4C: 8D. 70, 04
        mov     qword [rsp+28H], rax                    ; 04DA _ 48: 89. 44 24, 28
        mov     qword [rsp+38H], r14                    ; 04DF _ 4C: 89. 74 24, 38
        mov     dword [rax], r13d                       ; 04E4 _ 44: 89. 28
        mov     qword [rsp+30H], r14                    ; 04E7 _ 4C: 89. 74 24, 30
        call    _ZN10ThreadPool4mainEv                  ; 04EC _ E8, 00000000(rel)
        mov     rcx, qword [rax+4C0H]                   ; 04F1 _ 48: 8B. 88, 000004C0
        cmp     rcx, qword [rax+4C8H]                   ; 04F8 _ 48: 3B. 88, 000004C8
        je      ?_016                                   ; 04FF _ 0F 84, 000000AA
        test    rcx, rcx                                ; 0505 _ 48: 85. C9
        jz      ?_013                                   ; 0508 _ 74, 5B
        mov     qword [rcx+8H], 0                       ; 050A _ 48: C7. 41, 08, 00000000
        mov     r9, qword [rsp+28H]                     ; 0512 _ 4C: 8B. 4C 24, 28
        mov     qword [rcx+10H], 0                      ; 0517 _ 48: C7. 41, 10, 00000000
        mov     edx, dword [rsp+20H]                    ; 051F _ 8B. 54 24, 20
        mov     qword [rcx+18H], 0                      ; 0523 _ 48: C7. 41, 18, 00000000
        mov     ebp, dword [rsp+24H]                    ; 052B _ 8B. 6C 24, 24
        mov     qword [rcx+8H], r9                      ; 052F _ 4C: 89. 49, 08
        mov     r10, qword [rsp+30H]                    ; 0533 _ 4C: 8B. 54 24, 30
        mov     dword [rcx], edx                        ; 0538 _ 89. 11
        mov     dword [rcx+4H], ebp                     ; 053A _ 89. 69, 04
        mov     qword [rsp+28H], 0                      ; 053D _ 48: C7. 44 24, 28, 00000000
        mov     qword [rcx+10H], r10                    ; 0546 _ 4C: 89. 51, 10
        mov     r13, qword [rsp+38H]                    ; 054A _ 4C: 8B. 6C 24, 38
        mov     qword [rsp+30H], 0                      ; 054F _ 48: C7. 44 24, 30, 00000000
        mov     qword [rcx+18H], r13                    ; 0558 _ 4C: 89. 69, 18
        mov     qword [rsp+38H], 0                      ; 055C _ 48: C7. 44 24, 38, 00000000
?_013:  add     qword [rax+4C0H], 32                    ; 0565 _ 48: 83. 80, 000004C0, 20
?_014:  mov     rcx, qword [rsp+28H]                    ; 056D _ 48: 8B. 4C 24, 28
        test    rcx, rcx                                ; 0572 _ 48: 85. C9
        jne     .text.unlikely+0AFH                     ; 0575 _ 0F 85, 000000AF(rel)
        add     rbx, 8                                  ; 057B _ 48: 83. C3, 08
?_015:  cmp     rbx, r15                                ; 057F _ 4C: 39. FB
        jne     ?_012                                   ; 0582 _ 0F 85, FFFFFF03
        mov     rcx, rdi                                ; 0588 _ 48: 89. F9
        call    _ZN10ThreadPool4mainEv                  ; 058B _ E8, 00000000(rel)
        xor     edx, edx                                ; 0590 _ 31. D2
        mov     rcx, rax                                ; 0592 _ 48: 89. C1
        call    _ZN6Thread15start_searchingEb           ; 0595 _ E8, 00000076
        nop                                             ; 059A _ 90
        add     rsp, 2136                               ; 059B _ 48: 81. C4, 00000858
        pop     rbx                                     ; 05A2 _ 5B
        pop     rsi                                     ; 05A3 _ 5E
        pop     rdi                                     ; 05A4 _ 5F
        pop     rbp                                     ; 05A5 _ 5D
        pop     r12                                     ; 05A6 _ 41: 5C
        pop     r13                                     ; 05A8 _ 41: 5D
        pop     r14                                     ; 05AA _ 41: 5E
        pop     r15                                     ; 05AC _ 41: 5F
        ret                                             ; 05AE _ C3
; _ZN10ThreadPool14start_thinkingERK8PositionRKN6Search10LimitsTypeERSt10unique_ptrISt5stackI9StateInfoSt5dequeIS9_SaIS9_EEESt14default_deleteISD_EE End of function

?_016:  ; Local function
        lea     rcx, [rax+4B8H]                         ; 05AF _ 48: 8D. 88, 000004B8
        mov     rdx, r12                                ; 05B6 _ 4C: 89. E2
        call    _ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_; 05B9 _ E8, 00000000(rel)
        jmp     ?_014                                   ; 05BE _ EB, AD

_ZN6Thread24wait_for_search_finishedEv:; Function begin
        push    rdi                                     ; 05C0 _ 57
        push    rsi                                     ; 05C1 _ 56
        push    rbx                                     ; 05C2 _ 53
        sub     rsp, 32                                 ; 05C3 _ 48: 83. EC, 20
        lea     rsi, [rcx+10H]                          ; 05C7 _ 48: 8D. 71, 10
        mov     rbx, rcx                                ; 05CB _ 48: 89. CB
        lea     rdi, [rbx+38H]                          ; 05CE _ 48: 8D. 7B, 38
        mov     rcx, rsi                                ; 05D2 _ 48: 89. F1
        call    near [rel __imp_EnterCriticalSection]   ; 05D5 _ FF. 15, 00000000(rel)
?_017:  cmp     byte [rbx+41H], 0                       ; 05DB _ 80. 7B, 41, 00
        jnz     ?_018                                   ; 05DF _ 75, 14
        mov     rax, qword [rel __imp_LeaveCriticalSection]; 05E1 _ 48: 8B. 05, 00000000(rel)
        mov     rcx, rsi                                ; 05E8 _ 48: 89. F1
        add     rsp, 32                                 ; 05EB _ 48: 83. C4, 20
        pop     rbx                                     ; 05EF _ 5B
        pop     rsi                                     ; 05F0 _ 5E
        pop     rdi                                     ; 05F1 _ 5F
; Note: Prefix valid but unnecessary
; Note: Prefix bit or byte has no meaning in this context
        jmp     rax                                     ; 05F2 _ 48: FF. E0
; _ZN6Thread24wait_for_search_finishedEv End of function

?_018:  ; Local function
        mov     rdx, rsi                                ; 05F5 _ 48: 89. F2
        mov     rcx, rdi                                ; 05F8 _ 48: 89. F9
        call    _ZN17ConditionVariable4waitER5Mutex     ; 05FB _ E8, 00000000(rel)
        jmp     ?_017                                   ; 0600 _ EB, D9

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH
;       db 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZN6Thread15start_searchingEb:; Function begin
        push    rdi                                     ; 0610 _ 57
        push    rsi                                     ; 0611 _ 56
        push    rbx                                     ; 0612 _ 53
        sub     rsp, 32                                 ; 0613 _ 48: 83. EC, 20
        lea     rsi, [rcx+10H]                          ; 0617 _ 48: 8D. 71, 10
        mov     edi, edx                                ; 061B _ 89. D7
        mov     rbx, rcx                                ; 061D _ 48: 89. CB
        mov     rcx, rsi                                ; 0620 _ 48: 89. F1
        call    near [rel __imp_EnterCriticalSection]   ; 0623 _ FF. 15, 00000000(rel)
        test    dil, dil                                ; 0629 _ 40: 84. FF
        jnz     ?_019                                   ; 062C _ 75, 04
        mov     byte [rbx+41H], 1                       ; 062E _ C6. 43, 41, 01
?_019:  mov     rcx, qword [rbx+38H]                    ; 0632 _ 48: 8B. 4B, 38
        call    near [rel __imp_SetEvent]               ; 0636 _ FF. 15, 00000000(rel)
        mov     rax, qword [rel __imp_LeaveCriticalSection]; 063C _ 48: 8B. 05, 00000000(rel)
        mov     rcx, rsi                                ; 0643 _ 48: 89. F1
        add     rsp, 32                                 ; 0646 _ 48: 83. C4, 20
        pop     rbx                                     ; 064A _ 5B
        pop     rsi                                     ; 064B _ 5E
        pop     rdi                                     ; 064C _ 5F
; Note: Prefix valid but unnecessary
; Note: Prefix bit or byte has no meaning in this context
        jmp     rax                                     ; 064D _ 48: FF. E0
; _ZN6Thread15start_searchingEb End of function

_ZN10ThreadPool14nodes_searchedEv:; Function begin
        xor     eax, eax                                ; 0650 _ 31. C0
        mov     r8, qword [rcx+8H]                      ; 0652 _ 4C: 8B. 41, 08
        mov     rdx, qword [rcx]                        ; 0656 _ 48: 8B. 11
?_020:  cmp     r8, rdx                                 ; 0659 _ 49: 39. D0
        jnz     ?_021                                   ; 065C _ 75, 01
        ret                                             ; 065E _ C3
; _ZN10ThreadPool14nodes_searchedEv End of function

?_021:  ; Local function
        mov     rcx, qword [rdx]                        ; 065F _ 48: 8B. 0A
        add     rdx, 8                                  ; 0662 _ 48: 83. C2, 08
        add     rax, qword [rcx+490H]                   ; 0666 _ 48: 03. 81, 00000490
        jmp     ?_020                                   ; 066D _ EB, EA

        nop                                             ; 066F _ 90

ALIGN   16
_ZN10ThreadPool4exitEv:; Function begin
        push    rbx                                     ; 0670 _ 53
        sub     rsp, 32                                 ; 0671 _ 48: 83. EC, 20
        mov     rbx, rcx                                ; 0675 _ 48: 89. CB
?_022:  mov     rdx, qword [rbx+8H]                     ; 0678 _ 48: 8B. 53, 08
        mov     rax, rdx                                ; 067C _ 48: 89. D0
        sub     rax, qword [rbx]                        ; 067F _ 48: 2B. 03
        sar     rax, 3                                  ; 0682 _ 48: C1. F8, 03
        test    rax, rax                                ; 0686 _ 48: 85. C0
        jnz     ?_023                                   ; 0689 _ 75, 06
        add     rsp, 32                                 ; 068B _ 48: 83. C4, 20
        pop     rbx                                     ; 068F _ 5B
        ret                                             ; 0690 _ C3
; _ZN10ThreadPool4exitEv End of function

?_023:  ; Local function
        mov     rcx, qword [rdx-8H]                     ; 0691 _ 48: 8B. 4A, F8
        test    rcx, rcx                                ; 0695 _ 48: 85. C9
        jz      ?_024                                   ; 0698 _ 74, 07
        mov     r8, qword [rcx]                         ; 069A _ 4C: 8B. 01
        call    near [r8+8H]                            ; 069D _ 41: FF. 50, 08
?_024:  sub     qword [rbx+8H], 8                       ; 06A1 _ 48: 83. 6B, 08, 08
        jmp     ?_022                                   ; 06A6 _ EB, D0

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZN6ThreadD1Ev:; Function begin

_ZN6ThreadD2Ev:
        push    r12                                     ; 06B0 _ 41: 54
        push    rbp                                     ; 06B2 _ 55
        push    rdi                                     ; 06B3 _ 57
        push    rsi                                     ; 06B4 _ 56
        push    rbx                                     ; 06B5 _ 53
        sub     rsp, 32                                 ; 06B6 _ 48: 83. EC, 20
        lea     rax, [rel _ZTV6Thread+10H]              ; 06BA _ 48: 8D. 05, 00000010(rel)
        lea     rbp, [rcx+10H]                          ; 06C1 _ 48: 8D. 69, 10
        mov     rsi, rcx                                ; 06C5 _ 48: 89. CE
        mov     qword [rcx], rax                        ; 06C8 _ 48: 89. 01
        mov     rcx, rbp                                ; 06CB _ 48: 89. E9
        call    near [rel __imp_EnterCriticalSection]   ; 06CE _ FF. 15, 00000000(rel)
        mov     rcx, qword [rsi+38H]                    ; 06D4 _ 48: 8B. 4E, 38
        mov     byte [rsi+40H], 1                       ; 06D8 _ C6. 46, 40, 01
        call    near [rel __imp_SetEvent]               ; 06DC _ FF. 15, 00000000(rel)
        mov     rcx, rbp                                ; 06E2 _ 48: 89. E9
        call    near [rel __imp_LeaveCriticalSection]   ; 06E5 _ FF. 15, 00000000(rel)
        mov     rcx, qword [rsi+8H]                     ; 06EB _ 48: 8B. 4E, 08
        or      edx, 0FFFFFFFFH                         ; 06EF _ 83. CA, FF
        call    near [rel __imp_WaitForSingleObject]    ; 06F2 _ FF. 15, 00000000(rel)
        mov     rcx, qword [rsi+8H]                     ; 06F8 _ 48: 8B. 4E, 08
        mov     r12, qword [rel __imp_CloseHandle]      ; 06FC _ 4C: 8B. 25, 00000000(rel)
        call    r12                                     ; 0703 _ 41: FF. D4
        mov     rdi, qword [rsi+4C0H]                   ; 0706 _ 48: 8B. BE, 000004C0
        mov     rbx, qword [rsi+4B8H]                   ; 070D _ 48: 8B. 9E, 000004B8
        jmp     ?_027                                   ; 0714 _ EB, 12

?_025:  mov     rcx, qword [rbx+8H]                     ; 0716 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 071A _ 48: 85. C9
        jz      ?_026                                   ; 071D _ 74, 05
        call    _ZdlPv                                  ; 071F _ E8, 00000000(rel)
?_026:  add     rbx, 32                                 ; 0724 _ 48: 83. C3, 20
?_027:  cmp     rdi, rbx                                ; 0728 _ 48: 39. DF
        jnz     ?_025                                   ; 072B _ 75, E9
        mov     rcx, qword [rsi+4B8H]                   ; 072D _ 48: 8B. 8E, 000004B8
        test    rcx, rcx                                ; 0734 _ 48: 85. C9
        jz      ?_028                                   ; 0737 _ 74, 05
        call    _ZdlPv                                  ; 0739 _ E8, 00000000(rel)
?_028:  mov     rdx, qword [rsi+0B8H]                   ; 073E _ 48: 8B. 96, 000000B8
        lea     rcx, [rsi+0A8H]                         ; 0745 _ 48: 8D. 8E, 000000A8
        call    _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E; 074C _ E8, 00000000(rel)
        mov     rdx, qword [rsi+88H]                    ; 0751 _ 48: 8B. 96, 00000088
        lea     rcx, [rsi+78H]                          ; 0758 _ 48: 8D. 4E, 78
        call    _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E; 075C _ E8, 00000000(rel)
        mov     rcx, qword [rsi+60H]                    ; 0761 _ 48: 8B. 4E, 60
        test    rcx, rcx                                ; 0765 _ 48: 85. C9
        jz      ?_029                                   ; 0768 _ 74, 05
        call    _ZdlPv                                  ; 076A _ E8, 00000000(rel)
?_029:  mov     rcx, qword [rsi+48H]                    ; 076F _ 48: 8B. 4E, 48
        test    rcx, rcx                                ; 0773 _ 48: 85. C9
        jz      ?_030                                   ; 0776 _ 74, 05
        call    _ZdlPv                                  ; 0778 _ E8, 00000000(rel)
?_030:  mov     rcx, qword [rsi+38H]                    ; 077D _ 48: 8B. 4E, 38
        call    r12                                     ; 0781 _ 41: FF. D4
        mov     rdx, qword [rel __imp_DeleteCriticalSection]; 0784 _ 48: 8B. 15, 00000000(rel)
        mov     rcx, rbp                                ; 078B _ 48: 89. E9
        add     rsp, 32                                 ; 078E _ 48: 83. C4, 20
        pop     rbx                                     ; 0792 _ 5B
        pop     rsi                                     ; 0793 _ 5E
        pop     rdi                                     ; 0794 _ 5F
        pop     rbp                                     ; 0795 _ 5D
        pop     r12                                     ; 0796 _ 41: 5C
; Note: Prefix valid but unnecessary
; Note: Prefix bit or byte has no meaning in this context
        jmp     rdx                                     ; 0798 _ 48: FF. E2
; _ZN6ThreadD1Ev End of function

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

__tcf_0:; Local function
        mov     rcx, qword [rel Threads]                ; 07A0 _ 48: 8B. 0D, 00000000(rel)
        test    rcx, rcx                                ; 07A7 _ 48: 85. C9
        je      __tcf_0.cold.187                        ; 07AA _ 0F 84, 000000CE(rel)
        jmp     _ZdlPv                                  ; 07B0 _ E9, 00000000(rel)

        nop                                             ; 07B5 _ 90
        nop                                             ; 07B6 _ 90
        nop                                             ; 07B7 _ 90
        nop                                             ; 07B8 _ 90
        nop                                             ; 07B9 _ 90
        nop                                             ; 07BA _ 90
        nop                                             ; 07BB _ 90
        nop                                             ; 07BC _ 90
        nop                                             ; 07BD _ 90
        nop                                             ; 07BE _ 90
        nop                                             ; 07BF _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=16 noexecute                      ; section number 3, bss

Threads:                                                ; qword
        resq    1                                       ; 0000

?_031:  resq    1                                       ; 0008

?_032:  resq    2                                       ; 0010


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_ZN10ThreadPool16read_uci_optionsEv.cold.185:
        mov     rcx, qword [rcx-8H]                     ; 0000 _ 48: 8B. 49, F8
        test    rcx, rcx                                ; 0004 _ 48: 85. C9
        jz      ?_033                                   ; 0007 _ 74, 06
        mov     rbp, qword [rcx]                        ; 0009 _ 48: 8B. 29
        call    near [rbp+8H]                           ; 000C _ FF. 55, 08
?_033:  sub     qword [rbx+8H], 8                       ; 000F _ 48: 83. 6B, 08, 08
        mov     rcx, qword [rbx+8H]                     ; 0014 _ 48: 8B. 4B, 08
        jmp     .text+33DH                              ; 0018 _ E9, 0000033D(rel)

        mov     ecx, 9440                               ; 001D _ B9, 000024E0
        call    _Znwy                                   ; 0022 _ E8, 00000000(rel)
        mov     rcx, rax                                ; 0027 _ 48: 89. C1
        mov     rbp, rax                                ; 002A _ 48: 89. C5
        call    _ZN6ThreadC2Ev                          ; 002D _ E8, 00000050(rel)
        mov     rdx, rdi                                ; 0032 _ 48: 89. FA
        mov     rcx, rbx                                ; 0035 _ 48: 89. D9
        mov     qword [rsp+28H], rbp                    ; 0038 _ 48: 89. 6C 24, 28
        call    _ZNSt6vectorIP6ThreadSaIS1_EE12emplace_backIIS1_EEEvDpOT_; 003D _ E8, 00000000(rel)
        jmp     .text+32AH                              ; 0042 _ E9, 0000032A(rel)

        nop                                             ; 0047 _ 90

_ZN10ThreadPool14start_thinkingERK8PositionRKN6Search10LimitsTypeERSt10unique_ptrISt5stackI9StateInfoSt5dequeIS9_SaIS9_EEESt14default_deleteISD_EE.cold.186:; Local function
        xor     r11d, r11d                              ; 0048 _ 45: 31. DB
?_034:  cmp     dword [r10], r13d                       ; 004B _ 45: 39. 2A
        lea     r8, [r11+1H]                            ; 004E _ 4D: 8D. 43, 01
        cmove   r11, r8                                 ; 0052 _ 4D: 0F 44. D8
        add     r10, 4                                  ; 0056 _ 49: 83. C2, 04
        cmp     r9, r10                                 ; 005A _ 4D: 39. D1
        jnz     ?_034                                   ; 005D _ 75, EC
        test    r11, r11                                ; 005F _ 4D: 85. DB
        jne     .text+49EH                              ; 0062 _ 0F 85, 0000049E(rel)
        jmp     .text+57BH                              ; 0068 _ E9, 0000057B(rel)

        mov     qword [r15], 0                          ; 006D _ 49: C7. 07, 00000000
        mov     r15, qword [rel .refptr._ZN6Search11SetupStatesE]; 0074 _ 4C: 8B. 3D, 00000000(rel)
        mov     r14, qword [r15]                        ; 007B _ 4D: 8B. 37
        mov     qword [r15], rcx                        ; 007E _ 49: 89. 0F
        test    r14, r14                                ; 0081 _ 4D: 85. F6
        je      .text+466H                              ; 0084 _ 0F 84, 00000466(rel)
        cmp     qword [r14], 0                          ; 008A _ 49: 83. 3E, 00
        jz      ?_037                                   ; 008E _ 74, 31
        mov     rbp, qword [r14+48H]                    ; 0090 _ 49: 8B. 6E, 48
        mov     rbx, qword [r14+28H]                    ; 0094 _ 49: 8B. 5E, 28
        lea     r15, [rbp+8H]                           ; 0098 _ 4C: 8D. 7D, 08
?_035:  cmp     r15, rbx                                ; 009C _ 49: 39. DF
        jbe     ?_036                                   ; 009F _ 76, 18
        mov     rcx, qword [rbx]                        ; 00A1 _ 48: 8B. 0B
        add     rbx, 8                                  ; 00A4 _ 48: 83. C3, 08
        call    _ZdlPv                                  ; 00A8 _ E8, 00000000(rel)
        jmp     ?_035                                   ; 00AD _ EB, ED

; Note: No jump seems to point here
        call    _ZdlPv                                  ; 00AF _ E8, 00000000(rel)
        jmp     .text+57BH                              ; 00B4 _ E9, 0000057B(rel)

?_036:  mov     rcx, qword [r14]                        ; 00B9 _ 49: 8B. 0E
        call    _ZdlPv                                  ; 00BC _ E8, 00000000(rel)
?_037:  mov     rcx, r14                                ; 00C1 _ 4C: 89. F1
        call    _ZdlPv                                  ; 00C4 _ E8, 00000000(rel)
        jmp     .text+466H                              ; 00C9 _ E9, 00000466(rel)

__tcf_0.cold.187:; Local function
        ret                                             ; 00CE _ C3

        nop                                             ; 00CF _ 90

ALIGN   16
_ZN6ThreadD0Ev:; Function begin
        push    rbx                                     ; 00D0 _ 53
        sub     rsp, 32                                 ; 00D1 _ 48: 83. EC, 20
        mov     rbx, rcx                                ; 00D5 _ 48: 89. CB
        call    _ZN6ThreadD2Ev                          ; 00D8 _ E8, 000006B0(rel)
        mov     rcx, rbx                                ; 00DD _ 48: 89. D9
        add     rsp, 32                                 ; 00E0 _ 48: 83. C4, 20
        pop     rbx                                     ; 00E4 _ 5B
        jmp     _ZdlPv                                  ; 00E5 _ E9, 00000000(rel)
; _ZN6ThreadD0Ev End of function

_ZN6Thread4waitERVKb:; Function begin
        push    rdi                                     ; 00EA _ 57
        push    rsi                                     ; 00EB _ 56
        push    rbx                                     ; 00EC _ 53
        sub     rsp, 32                                 ; 00ED _ 48: 83. EC, 20
        lea     rsi, [rcx+10H]                          ; 00F1 _ 48: 8D. 71, 10
        mov     rbx, rcx                                ; 00F5 _ 48: 89. CB
        mov     rdi, rdx                                ; 00F8 _ 48: 89. D7
        mov     rcx, rsi                                ; 00FB _ 48: 89. F1
        add     rbx, 56                                 ; 00FE _ 48: 83. C3, 38
        call    near [rel __imp_EnterCriticalSection]   ; 0102 _ FF. 15, 00000000(rel)
?_038:  mov     al, byte [rdi]                          ; 0108 _ 8A. 07
        test    al, al                                  ; 010A _ 84. C0
        jnz     ?_039                                   ; 010C _ 75, 0D
        mov     rdx, rsi                                ; 010E _ 48: 89. F2
        mov     rcx, rbx                                ; 0111 _ 48: 89. D9
        call    _ZN17ConditionVariable4waitER5Mutex     ; 0114 _ E8, 00000000(rel)
        jmp     ?_038                                   ; 0119 _ EB, ED
; _ZN6Thread4waitERVKb End of function

?_039:  ; Local function
        mov     rdx, qword [rel __imp_LeaveCriticalSection]; 011B _ 48: 8B. 15, 00000000(rel)
        mov     rcx, rsi                                ; 0122 _ 48: 89. F1
        add     rsp, 32                                 ; 0125 _ 48: 83. C4, 20
        pop     rbx                                     ; 0129 _ 5B
        pop     rsi                                     ; 012A _ 5E
        pop     rdi                                     ; 012B _ 5F
; Note: Prefix valid but unnecessary
; Note: Prefix bit or byte has no meaning in this context
        jmp     rdx                                     ; 012C _ 48: FF. E2

        nop                                             ; 012F _ 90


SECTION .text.startup align=16 execute                  ; section number 5, code

.text.startup:; Local function
_GLOBAL__sub_I_Threads:
        lea     rcx, [rel __tcf_0]                      ; 0000 _ 48: 8D. 0D, 000007A0(rel)
        mov     qword [rel Threads], 0                  ; 0007 _ 48: C7. 05, FFFFFFFC(rel), 00000000
        mov     qword [rel ?_031], 0                    ; 0012 _ 48: C7. 05, 00000004(rel), 00000000
        mov     qword [rel ?_032], 0                    ; 001D _ 48: C7. 05, 0000000C(rel), 00000000
        jmp     atexit                                  ; 0028 _ E9, 00000000(rel)

        nop                                             ; 002D _ 90
        nop                                             ; 002E _ 90
        nop                                             ; 002F _ 90


SECTION .xdata.startup align=4 noexecute                ; section number 6, const

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .ctors  align=8 noexecute                       ; section number 8, data

        dq _GLOBAL__sub_I_Threads                       ; 0000 _ 0000000000000000 (d)


SECTION .xdata  align=4 noexecute                       ; section number 9, const

        db 01H, 06H, 03H, 00H, 06H, 62H, 02H, 30H       ; 0000 _ .....b.0
        db 01H, 60H, 00H, 00H, 01H, 0DH, 07H, 00H       ; 0008 _ .`......
        db 0DH, 01H, 18H, 00H, 06H, 30H, 05H, 60H       ; 0010 _ .....0.`
        db 04H, 70H, 03H, 50H, 02H, 0C0H, 00H, 00H      ; 0018 _ .p.P....
        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0020 _ .....B..
        db 01H, 0CH, 07H, 00H, 0CH, 42H, 08H, 30H       ; 0028 _ .....B.0
        db 07H, 60H, 06H, 70H, 05H, 50H, 04H, 0C0H      ; 0030 _ .`.p.P..
        db 02H, 0D0H, 00H, 00H, 01H, 08H, 05H, 00H      ; 0038 _ ........
        db 08H, 62H, 04H, 30H, 03H, 60H, 02H, 70H       ; 0040 _ .b.0.`.p
        db 01H, 50H, 00H, 00H, 01H, 13H, 0AH, 00H       ; 0048 _ .P......
        db 13H, 01H, 0BH, 01H, 0CH, 30H, 0BH, 60H       ; 0050 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 0058 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 07H, 04H, 00H     ; 0060 _ ........
        db 07H, 32H, 03H, 30H, 02H, 60H, 01H, 70H       ; 0068 _ .2.0.`.p
        db 01H, 07H, 04H, 00H, 07H, 32H, 03H, 30H       ; 0070 _ .....2.0
        db 02H, 60H, 01H, 70H, 01H, 00H, 00H, 00H       ; 0078 _ .`.p....
        db 01H, 05H, 02H, 00H, 05H, 32H, 01H, 30H       ; 0080 _ .....2.0
        db 01H, 0AH, 06H, 00H, 0AH, 32H, 06H, 30H       ; 0088 _ .....2.0
        db 05H, 60H, 04H, 70H, 03H, 50H, 02H, 0C0H      ; 0090 _ .`.p.P..
        db 01H, 00H, 00H, 00H                           ; 0098 _ ....


SECTION .text$_ZSt10__fill_n_aIPN5Pawns5EntryEyS1_EN9__gnu_cxx11__enable_ifIXntsrSt11__is_scalarIT1_E7__valueET_E6__typeES8_T0_RKS6_ align=16 execute ; section number 11, code
;  Communal section not supported by YASM

_ZSt10__fill_n_aIPN5Pawns5EntryEyS1_EN9__gnu_cxx11__enable_ifIXntsrSt11__is_scalarIT1_E7__valueET_E6__typeES8_T0_RKS6_:; Function begin
        push    rdi                                     ; 0000 _ 57
        push    rsi                                     ; 0001 _ 56
        mov     r10d, 34                                ; 0002 _ 41: BA, 00000022
        mov     r11, rcx                                ; 0008 _ 49: 89. CB
        mov     r9, rdx                                 ; 000B _ 49: 89. D1
        mov     rax, rcx                                ; 000E _ 48: 89. C8
        jmp     ?_041                                   ; 0011 _ EB, 15

?_040:  mov     rdi, rax                                ; 0013 _ 48: 89. C7
        mov     rsi, r8                                 ; 0016 _ 4C: 89. C6
        mov     rcx, r10                                ; 0019 _ 4C: 89. D1
        rep movsd                                       ; 001C _ F3: A5
        sub     r9, 1                                   ; 001E _ 49: 83. E9, 01
        add     rax, 136                                ; 0022 _ 48: 05, 00000088
?_041:  test    r9, r9                                  ; 0028 _ 4D: 85. C9
        jnz     ?_040                                   ; 002B _ 75, E6
        imul    rdx, rdx, 136                           ; 002D _ 48: 69. D2, 00000088
        lea     rax, [r11+rdx]                          ; 0034 _ 49: 8D. 04 13
        pop     rsi                                     ; 0038 _ 5E
        pop     rdi                                     ; 0039 _ 5F
        ret                                             ; 003A _ C3
; _ZSt10__fill_n_aIPN5Pawns5EntryEyS1_EN9__gnu_cxx11__enable_ifIXntsrSt11__is_scalarIT1_E7__valueET_E6__typeES8_T0_RKS6_ End of function

        nop                                             ; 003B _ 90
        nop                                             ; 003C _ 90
        nop                                             ; 003D _ 90
        nop                                             ; 003E _ 90
        nop                                             ; 003F _ 90


SECTION .xdata$_ZSt10__fill_n_aIPN5Pawns5EntryEyS1_EN9__gnu_cxx11__enable_ifIXntsrSt11__is_scalarIT1_E7__valueET_E6__typeES8_T0_RKS6_ align=4 noexecute ; section number 12, const
;  Communal section not supported by YASM

        db 01H, 02H, 02H, 00H, 02H, 60H, 01H, 70H       ; 0000 _ .....`.p


SECTION .text$_ZN17ConditionVariable4waitER5Mutex align=16 execute ; section number 14, code
;  Communal section not supported by YASM

_ZN17ConditionVariable4waitER5Mutex:; Function begin
        push    rsi                                     ; 0000 _ 56
        push    rbx                                     ; 0001 _ 53
        sub     rsp, 40                                 ; 0002 _ 48: 83. EC, 28
        mov     rsi, rcx                                ; 0006 _ 48: 89. CE
        mov     rbx, rdx                                ; 0009 _ 48: 89. D3
        mov     rcx, rdx                                ; 000C _ 48: 89. D1
        call    near [rel __imp_LeaveCriticalSection]   ; 000F _ FF. 15, 00000000(rel)
        mov     rcx, qword [rsi]                        ; 0015 _ 48: 8B. 0E
        or      edx, 0FFFFFFFFH                         ; 0018 _ 83. CA, FF
        call    near [rel __imp_WaitForSingleObject]    ; 001B _ FF. 15, 00000000(rel)
        mov     rax, qword [rel __imp_EnterCriticalSection]; 0021 _ 48: 8B. 05, 00000000(rel)
        mov     rcx, rbx                                ; 0028 _ 48: 89. D9
        add     rsp, 40                                 ; 002B _ 48: 83. C4, 28
        pop     rbx                                     ; 002F _ 5B
        pop     rsi                                     ; 0030 _ 5E
; Note: Prefix valid but unnecessary
; Note: Prefix bit or byte has no meaning in this context
        jmp     rax                                     ; 0031 _ 48: FF. E0
; _ZN17ConditionVariable4waitER5Mutex End of function

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


SECTION .xdata$_ZN17ConditionVariable4waitER5Mutex align=4 noexecute ; section number 15, const
;  Communal section not supported by YASM

        db 01H, 06H, 03H, 00H, 06H, 42H, 02H, 30H       ; 0000 _ .....B.0
        db 01H, 60H, 00H, 00H                           ; 0008 _ .`..


SECTION .text$_ZNSt6vectorIP6ThreadSaIS1_EE12emplace_backIIS1_EEEvDpOT_ align=16 execute ; section number 17, code
;  Communal section not supported by YASM

.weak._ZNSt6vectorIP6ThreadSaIS1_EE12emplace_backIJS1_EEEvDpOT_._ZN10ThreadPool4initEv:; Function begin

_ZNSt6vectorIP6ThreadSaIS1_EE12emplace_backIIS1_EEEvDpOT_:
        mov     rax, qword [rcx+8H]                     ; 0000 _ 48: 8B. 41, 08
        cmp     rax, qword [rcx+10H]                    ; 0004 _ 48: 3B. 41, 10
        jnz     ?_042                                   ; 0008 _ 75, 05
        jmp     _ZNSt6vectorIP6ThreadSaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_; 000A _ E9, 00000000(rel)
; .weak._ZNSt6vectorIP6ThreadSaIS1_EE12emplace_backIJS1_EEEvDpOT_._ZN10ThreadPool4initEv End of function

?_042:  ; Local function
        test    rax, rax                                ; 000F _ 48: 85. C0
        mov     rdx, qword [rdx]                        ; 0012 _ 48: 8B. 12
        jz      ?_043                                   ; 0015 _ 74, 03
        mov     qword [rax], rdx                        ; 0017 _ 48: 89. 10
?_043:  add     qword [rcx+8H], 8                       ; 001A _ 48: 83. 41, 08, 08
        ret                                             ; 001F _ C3


SECTION .xdata$_ZNSt6vectorIP6ThreadSaIS1_EE12emplace_backIIS1_EEEvDpOT_ align=4 noexecute ; section number 18, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZNSt6vectorIP6ThreadSaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_ align=16 execute ; section number 20, code
;  Communal section not supported by YASM

.weak._ZNSt6vectorIP6ThreadSaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_._ZN10ThreadPool4initEv:; Function begin

_ZNSt6vectorIP6ThreadSaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_:
        push    rdi                                     ; 0000 _ 57
        push    rsi                                     ; 0001 _ 56
        push    rbx                                     ; 0002 _ 53
        sub     rsp, 48                                 ; 0003 _ 48: 83. EC, 30
        mov     esi, 1                                  ; 0007 _ BE, 00000001
        mov     rbx, rcx                                ; 000C _ 48: 89. CB
        mov     rcx, qword [rcx+8H]                     ; 000F _ 48: 8B. 49, 08
        mov     rdi, rdx                                ; 0013 _ 48: 89. D7
        mov     rax, rcx                                ; 0016 _ 48: 89. C8
        sub     rax, qword [rbx]                        ; 0019 _ 48: 2B. 03
        sar     rax, 3                                  ; 001C _ 48: C1. F8, 03
        test    rax, rax                                ; 0020 _ 48: 85. C0
        jnz     ?_049                                   ; 0023 _ 75, 5C
?_044:  lea     rcx, [rsi*8]                            ; 0025 _ 48: 8D. 0C F5, 00000000
        call    _Znwy                                   ; 002D _ E8, 00000000(rel)
        mov     rcx, qword [rbx+8H]                     ; 0032 _ 48: 8B. 4B, 08
?_045:  sub     rcx, qword [rbx]                        ; 0036 _ 48: 2B. 0B
        mov     r8, qword [rdi]                         ; 0039 _ 4C: 8B. 07
        add     rcx, rax                                ; 003C _ 48: 01. C1
        jz      ?_046                                   ; 003F _ 74, 03
        mov     qword [rcx], r8                         ; 0041 _ 4C: 89. 01
?_046:  mov     rcx, qword [rbx]                        ; 0044 _ 48: 8B. 0B
        mov     r8, rax                                 ; 0047 _ 49: 89. C0
        mov     r11, qword [rbx+8H]                     ; 004A _ 4C: 8B. 5B, 08
        mov     rdx, rcx                                ; 004E _ 48: 89. CA
?_047:  cmp     r11, rdx                                ; 0051 _ 49: 39. D3
        jnz     ?_051                                   ; 0054 _ 75, 60
        sub     r11, rcx                                ; 0056 _ 49: 29. CB
        mov     rcx, qword [rbx]                        ; 0059 _ 48: 8B. 0B
        and     r11, 0FFFFFFFFFFFFFFF8H                 ; 005C _ 49: 83. E3, F8
        lea     rdi, [rax+r11+8H]                       ; 0060 _ 4A: 8D. 7C 18, 08
        test    rcx, rcx                                ; 0065 _ 48: 85. C9
        jnz     ?_050                                   ; 0068 _ 75, 3B
?_048:  lea     r9, [rax+rsi*8]                         ; 006A _ 4C: 8D. 0C F0
        mov     qword [rbx], rax                        ; 006E _ 48: 89. 03
        mov     qword [rbx+8H], rdi                     ; 0071 _ 48: 89. 7B, 08
        mov     qword [rbx+10H], r9                     ; 0075 _ 4C: 89. 4B, 10
        add     rsp, 48                                 ; 0079 _ 48: 83. C4, 30
        pop     rbx                                     ; 007D _ 5B
        pop     rsi                                     ; 007E _ 5E
        pop     rdi                                     ; 007F _ 5F
        ret                                             ; 0080 _ C3

?_049:  lea     rdx, [rax+rax]                          ; 0081 _ 48: 8D. 14 00
        mov     rsi, qword 1FFFFFFFFFFFFFFFH            ; 0085 _ 48: BE, 1FFFFFFFFFFFFFFF
        cmp     rax, rdx                                ; 008F _ 48: 39. D0
        ja      ?_044                                   ; 0092 _ 77, 91
        cmp     rdx, rsi                                ; 0094 _ 48: 39. F2
        ja      ?_044                                   ; 0097 _ 77, 8C
        xor     eax, eax                                ; 0099 _ 31. C0
        test    rdx, rdx                                ; 009B _ 48: 85. D2
        mov     rsi, rdx                                ; 009E _ 48: 89. D6
        jnz     ?_044                                   ; 00A1 _ 75, 82
        jmp     ?_045                                   ; 00A3 _ EB, 91

?_050:  mov     qword [rsp+28H], rax                    ; 00A5 _ 48: 89. 44 24, 28
        call    _ZdlPv                                  ; 00AA _ E8, 00000000(rel)
        mov     rax, qword [rsp+28H]                    ; 00AF _ 48: 8B. 44 24, 28
        jmp     ?_048                                   ; 00B4 _ EB, B4
; .weak._ZNSt6vectorIP6ThreadSaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_._ZN10ThreadPool4initEv End of function

?_051:  ; Local function
        test    r8, r8                                  ; 00B6 _ 4D: 85. C0
        mov     r10, qword [rdx]                        ; 00B9 _ 4C: 8B. 12
        jz      ?_052                                   ; 00BC _ 74, 03
        mov     qword [r8], r10                         ; 00BE _ 4D: 89. 10
?_052:  add     r8, 8                                   ; 00C1 _ 49: 83. C0, 08
        add     rdx, 8                                  ; 00C5 _ 48: 83. C2, 08
        jmp     ?_047                                   ; 00C9 _ EB, 86

        nop                                             ; 00CB _ 90
        nop                                             ; 00CC _ 90
        nop                                             ; 00CD _ 90
        nop                                             ; 00CE _ 90
        nop                                             ; 00CF _ 90


SECTION .xdata$_ZNSt6vectorIP6ThreadSaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_ align=4 noexecute ; section number 21, const
;  Communal section not supported by YASM

        db 01H, 07H, 04H, 00H, 07H, 52H, 03H, 30H       ; 0000 _ .....R.0
        db 02H, 60H, 01H, 70H                           ; 0008 _ .`.p


SECTION .rdata  align=16 noexecute                      ; section number 23, const

?_053:                                                  ; byte
        db 76H, 65H, 63H, 74H, 6FH, 72H, 3AH, 3AH       ; 0000 _ vector::
        db 5FH, 4DH, 5FH, 72H, 61H, 6EH, 67H, 65H       ; 0008 _ _M_range
        db 5FH, 63H, 68H, 65H, 63H, 6BH, 3AH, 20H       ; 0010 _ _check: 
        db 5FH, 5FH, 6EH, 20H, 28H, 77H, 68H, 69H       ; 0018 _ __n (whi
        db 63H, 68H, 20H, 69H, 73H, 20H, 25H, 7AH       ; 0020 _ ch is %z
        db 75H, 29H, 20H, 3EH, 3DH, 20H, 74H, 68H       ; 0028 _ u) >= th
        db 69H, 73H, 2DH, 3EH, 73H, 69H, 7AH, 65H       ; 0030 _ is->size
        db 28H, 29H, 20H, 28H, 77H, 68H, 69H, 63H       ; 0038 _ () (whic
        db 68H, 20H, 69H, 73H, 20H, 25H, 7AH, 75H       ; 0040 _ h is %zu
        db 29H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0048 _ ).......


SECTION .text$_ZN10ThreadPool4mainEv align=16 execute   ; section number 24, code
;  Communal section not supported by YASM

_ZN10ThreadPool4mainEv:; Function begin
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     rdx, qword [rcx]                        ; 0004 _ 48: 8B. 11
        mov     rax, qword [rcx+8H]                     ; 0007 _ 48: 8B. 41, 08
        sub     rax, rdx                                ; 000B _ 48: 29. D0
        sar     rax, 3                                  ; 000E _ 48: C1. F8, 03
        test    rax, rax                                ; 0012 _ 48: 85. C0
        jz      ?_054                                   ; 0015 _ 74, 08
        mov     rax, qword [rdx]                        ; 0017 _ 48: 8B. 02
        add     rsp, 40                                 ; 001A _ 48: 83. C4, 28
        ret                                             ; 001E _ C3
; _ZN10ThreadPool4mainEv End of function

?_054:  ; Local function
        lea     rcx, [rel ?_053]                        ; 001F _ 48: 8D. 0D, 00000000(rel)
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


SECTION .xdata$_ZN10ThreadPool4mainEv align=4 noexecute ; section number 25, const
;  Communal section not supported by YASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .text$_ZNSt6vectorI4MoveSaIS0_EEaSERKS2_ align=16 execute ; section number 27, code
;  Communal section not supported by YASM

_ZNSt6vectorI4MoveSaIS0_EEaSERKS2_:; Function begin
        push    r12                                     ; 0000 _ 41: 54
        push    rbp                                     ; 0002 _ 55
        push    rdi                                     ; 0003 _ 57
        push    rsi                                     ; 0004 _ 56
        push    rbx                                     ; 0005 _ 53
        sub     rsp, 32                                 ; 0006 _ 48: 83. EC, 20
        cmp     rdx, rcx                                ; 000A _ 48: 39. CA
        mov     rdi, rcx                                ; 000D _ 48: 89. CF
        mov     rsi, rdx                                ; 0010 _ 48: 89. D6
        je      ?_082                                   ; 0013 _ 0F 84, 000001D7
        mov     rbp, qword [rdx+8H]                     ; 0019 _ 48: 8B. 6A, 08
        mov     r12, qword [rdx]                        ; 001D _ 4C: 8B. 22
        mov     rcx, qword [rcx]                        ; 0020 _ 48: 8B. 09
        mov     rdx, qword [rdi+10H]                    ; 0023 _ 48: 8B. 57, 10
        mov     rbx, rbp                                ; 0027 _ 48: 89. EB
        sub     rbx, r12                                ; 002A _ 4C: 29. E3
        mov     rax, rbx                                ; 002D _ 48: 89. D8
        sub     rdx, rcx                                ; 0030 _ 48: 29. CA
        sar     rax, 2                                  ; 0033 _ 48: C1. F8, 02
        sar     rdx, 2                                  ; 0037 _ 48: C1. FA, 02
        cmp     rax, rdx                                ; 003B _ 48: 39. D0
        ja      ?_083                                   ; 003E _ 0F 87, 000001BC
        mov     r9, qword [rdi+8H]                      ; 0044 _ 4C: 8B. 4F, 08
        mov     r8, r9                                  ; 0048 _ 4D: 89. C8
        sub     r8, rcx                                 ; 004B _ 49: 29. C8
        mov     r10, r8                                 ; 004E _ 4D: 89. C2
        sar     r10, 2                                  ; 0051 _ 49: C1. FA, 02
        cmp     rax, r10                                ; 0055 _ 4C: 39. D0
        jbe     ?_079                                   ; 0058 _ 0F 86, 00000182
        test    r10, r10                                ; 005E _ 4D: 85. D2
        mov     rdx, r12                                ; 0061 _ 4C: 89. E2
        jne     ?_110                                   ; 0064 _ 0F 85, 00000348
?_055:  add     rdx, r8                                 ; 006A _ 4C: 01. C2
        cmp     rdx, rbp                                ; 006D _ 48: 39. EA
        je      ?_080                                   ; 0070 _ 0F 84, 00000173
        mov     r8, rbp                                 ; 0076 _ 49: 89. E8
        mov     r11d, dword [rdx]                       ; 0079 _ 44: 8B. 1A
        sub     r8, rdx                                 ; 007C _ 49: 29. D0
        sub     r8, 4                                   ; 007F _ 49: 83. E8, 04
        shr     r8, 2                                   ; 0083 _ 49: C1. E8, 02
        and     r8d, 07H                                ; 0087 _ 41: 83. E0, 07
        test    r9, r9                                  ; 008B _ 4D: 85. C9
        jz      ?_056                                   ; 008E _ 74, 03
        mov     dword [r9], r11d                        ; 0090 _ 45: 89. 19
?_056:  add     rdx, 4                                  ; 0093 _ 48: 83. C2, 04
        add     r9, 4                                   ; 0097 _ 49: 83. C1, 04
        cmp     rbp, rdx                                ; 009B _ 48: 39. D5
        je      ?_080                                   ; 009E _ 0F 84, 00000145
        test    r8, r8                                  ; 00A4 _ 4D: 85. C0
        je      ?_070                                   ; 00A7 _ 0F 84, 000000B3
        cmp     r8, 1                                   ; 00AD _ 49: 83. F8, 01
        je      ?_068                                   ; 00B1 _ 0F 84, 0000008E
        cmp     r8, 2                                   ; 00B7 _ 49: 83. F8, 02
        jz      ?_066                                   ; 00BB _ 74, 75
        cmp     r8, 3                                   ; 00BD _ 49: 83. F8, 03
        jz      ?_064                                   ; 00C1 _ 74, 5C
        cmp     r8, 4                                   ; 00C3 _ 49: 83. F8, 04
        jz      ?_062                                   ; 00C7 _ 74, 43
        cmp     r8, 5                                   ; 00C9 _ 49: 83. F8, 05
        jz      ?_060                                   ; 00CD _ 74, 2B
        cmp     r8, 6                                   ; 00CF _ 49: 83. F8, 06
        jz      ?_058                                   ; 00D3 _ 74, 12
        test    r9, r9                                  ; 00D5 _ 4D: 85. C9
        mov     esi, dword [rdx]                        ; 00D8 _ 8B. 32
        jz      ?_057                                   ; 00DA _ 74, 03
        mov     dword [r9], esi                         ; 00DC _ 41: 89. 31
?_057:  add     rdx, 4                                  ; 00DF _ 48: 83. C2, 04
        add     r9, 4                                   ; 00E3 _ 49: 83. C1, 04
?_058:  test    r9, r9                                  ; 00E7 _ 4D: 85. C9
        mov     r12d, dword [rdx]                       ; 00EA _ 44: 8B. 22
        jz      ?_059                                   ; 00ED _ 74, 03
        mov     dword [r9], r12d                        ; 00EF _ 45: 89. 21
?_059:  add     rdx, 4                                  ; 00F2 _ 48: 83. C2, 04
        add     r9, 4                                   ; 00F6 _ 49: 83. C1, 04
?_060:  test    r9, r9                                  ; 00FA _ 4D: 85. C9
        mov     eax, dword [rdx]                        ; 00FD _ 8B. 02
        jz      ?_061                                   ; 00FF _ 74, 03
        mov     dword [r9], eax                         ; 0101 _ 41: 89. 01
?_061:  add     rdx, 4                                  ; 0104 _ 48: 83. C2, 04
        add     r9, 4                                   ; 0108 _ 49: 83. C1, 04
?_062:  test    r9, r9                                  ; 010C _ 4D: 85. C9
        mov     r10d, dword [rdx]                       ; 010F _ 44: 8B. 12
        jz      ?_063                                   ; 0112 _ 74, 03
        mov     dword [r9], r10d                        ; 0114 _ 45: 89. 11
?_063:  add     rdx, 4                                  ; 0117 _ 48: 83. C2, 04
        add     r9, 4                                   ; 011B _ 49: 83. C1, 04
?_064:  test    r9, r9                                  ; 011F _ 4D: 85. C9
        mov     r8d, dword [rdx]                        ; 0122 _ 44: 8B. 02
        jz      ?_065                                   ; 0125 _ 74, 03
        mov     dword [r9], r8d                         ; 0127 _ 45: 89. 01
?_065:  add     rdx, 4                                  ; 012A _ 48: 83. C2, 04
        add     r9, 4                                   ; 012E _ 49: 83. C1, 04
?_066:  test    r9, r9                                  ; 0132 _ 4D: 85. C9
        mov     r11d, dword [rdx]                       ; 0135 _ 44: 8B. 1A
        jz      ?_067                                   ; 0138 _ 74, 03
        mov     dword [r9], r11d                        ; 013A _ 45: 89. 19
?_067:  add     rdx, 4                                  ; 013D _ 48: 83. C2, 04
        add     r9, 4                                   ; 0141 _ 49: 83. C1, 04
?_068:  test    r9, r9                                  ; 0145 _ 4D: 85. C9
        mov     esi, dword [rdx]                        ; 0148 _ 8B. 32
        jz      ?_069                                   ; 014A _ 74, 03
        mov     dword [r9], esi                         ; 014C _ 41: 89. 31
?_069:  add     rdx, 4                                  ; 014F _ 48: 83. C2, 04
        add     r9, 4                                   ; 0153 _ 49: 83. C1, 04
        cmp     rbp, rdx                                ; 0157 _ 48: 39. D5
        je      ?_080                                   ; 015A _ 0F 84, 00000089
?_070:  test    r9, r9                                  ; 0160 _ 4D: 85. C9
        mov     r12d, dword [rdx]                       ; 0163 _ 44: 8B. 22
        jz      ?_071                                   ; 0166 _ 74, 03
        mov     dword [r9], r12d                        ; 0168 _ 45: 89. 21
?_071:  lea     rax, [rdx+4H]                           ; 016B _ 48: 8D. 42, 04
        mov     r10, r9                                 ; 016F _ 4D: 89. CA
        mov     edx, dword [rdx+4H]                     ; 0172 _ 8B. 52, 04
        add     r10, 4                                  ; 0175 _ 49: 83. C2, 04
        jz      ?_072                                   ; 0179 _ 74, 04
        mov     dword [r9+4H], edx                      ; 017B _ 41: 89. 51, 04
?_072:  cmp     r10, -4                                 ; 017F _ 49: 83. FA, FC
        mov     r9d, dword [rax+4H]                     ; 0183 _ 44: 8B. 48, 04
        jz      ?_073                                   ; 0187 _ 74, 04
        mov     dword [r10+4H], r9d                     ; 0189 _ 45: 89. 4A, 04
?_073:  cmp     r10, -8                                 ; 018D _ 49: 83. FA, F8
        mov     r8d, dword [rax+8H]                     ; 0191 _ 44: 8B. 40, 08
        jz      ?_074                                   ; 0195 _ 74, 04
        mov     dword [r10+8H], r8d                     ; 0197 _ 45: 89. 42, 08
?_074:  cmp     r10, -12                                ; 019B _ 49: 83. FA, F4
        mov     r11d, dword [rax+0CH]                   ; 019F _ 44: 8B. 58, 0C
        jz      ?_075                                   ; 01A3 _ 74, 04
        mov     dword [r10+0CH], r11d                   ; 01A5 _ 45: 89. 5A, 0C
?_075:  cmp     r10, -16                                ; 01A9 _ 49: 83. FA, F0
        mov     esi, dword [rax+10H]                    ; 01AD _ 8B. 70, 10
        jz      ?_076                                   ; 01B0 _ 74, 04
        mov     dword [r10+10H], esi                    ; 01B2 _ 41: 89. 72, 10
?_076:  cmp     r10, -20                                ; 01B6 _ 49: 83. FA, EC
        mov     r12d, dword [rax+14H]                   ; 01BA _ 44: 8B. 60, 14
        jz      ?_077                                   ; 01BE _ 74, 04
        mov     dword [r10+14H], r12d                   ; 01C0 _ 45: 89. 62, 14
?_077:  cmp     r10, -24                                ; 01C4 _ 49: 83. FA, E8
        mov     edx, dword [rax+18H]                    ; 01C8 _ 8B. 50, 18
        jz      ?_078                                   ; 01CB _ 74, 04
        mov     dword [r10+18H], edx                    ; 01CD _ 41: 89. 52, 18
?_078:  lea     rdx, [rax+1CH]                          ; 01D1 _ 48: 8D. 50, 1C
        lea     r9, [r10+1CH]                           ; 01D5 _ 4D: 8D. 4A, 1C
        cmp     rbp, rdx                                ; 01D9 _ 48: 39. D5
        jnz     ?_070                                   ; 01DC _ 75, 82
        jmp     ?_080                                   ; 01DE _ EB, 09

?_079:  test    rax, rax                                ; 01E0 _ 48: 85. C0
        jne     ?_111                                   ; 01E3 _ 0F 85, 000001E7
?_080:  add     rbx, rcx                                ; 01E9 _ 48: 01. CB
?_081:  mov     qword [rdi+8H], rbx                     ; 01EC _ 48: 89. 5F, 08
?_082:  mov     rax, rdi                                ; 01F0 _ 48: 89. F8
        add     rsp, 32                                 ; 01F3 _ 48: 83. C4, 20
        pop     rbx                                     ; 01F7 _ 5B
        pop     rsi                                     ; 01F8 _ 5E
        pop     rdi                                     ; 01F9 _ 5F
        pop     rbp                                     ; 01FA _ 5D
        pop     r12                                     ; 01FB _ 41: 5C
        ret                                             ; 01FD _ C3

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_083:  xor     esi, esi                                ; 0200 _ 31. F6
        test    rax, rax                                ; 0202 _ 48: 85. C0
        jz      ?_084                                   ; 0205 _ 74, 21
        mov     rcx, qword 3FFFFFFFFFFFFFFFH            ; 0207 _ 48: B9, 3FFFFFFFFFFFFFFF
        cmp     rax, rcx                                ; 0211 _ 48: 39. C8
        ja      ?_112                                   ; 0214 _ 0F 87, 000001C9
        mov     rcx, rbx                                ; 021A _ 48: 89. D9
        call    _Znwy                                   ; 021D _ E8, 00000000(rel)
        mov     rcx, qword [rdi]                        ; 0222 _ 48: 8B. 0F
        mov     rsi, rax                                ; 0225 _ 48: 89. C6
?_084:  cmp     r12, rbp                                ; 0228 _ 49: 39. EC
        je      ?_108                                   ; 022B _ 0F 84, 00000168
        mov     r10, rbp                                ; 0231 _ 49: 89. EA
        mov     eax, dword [r12]                        ; 0234 _ 41: 8B. 04 24
        sub     r10, r12                                ; 0238 _ 4D: 29. E2
        sub     r10, 4                                  ; 023B _ 49: 83. EA, 04
        shr     r10, 2                                  ; 023F _ 49: C1. EA, 02
        and     r10d, 07H                               ; 0243 _ 41: 83. E2, 07
        test    rsi, rsi                                ; 0247 _ 48: 85. F6
        jz      ?_085                                   ; 024A _ 74, 02
        mov     dword [rsi], eax                        ; 024C _ 89. 06
?_085:  lea     rdx, [r12+4H]                           ; 024E _ 49: 8D. 54 24, 04
        lea     r9, [rsi+4H]                            ; 0253 _ 4C: 8D. 4E, 04
        cmp     rbp, rdx                                ; 0257 _ 48: 39. D5
        je      ?_108                                   ; 025A _ 0F 84, 00000139
        test    r10, r10                                ; 0260 _ 4D: 85. D2
        je      ?_099                                   ; 0263 _ 0F 84, 000000B1
        cmp     r10, 1                                  ; 0269 _ 49: 83. FA, 01
        je      ?_097                                   ; 026D _ 0F 84, 0000008F
        cmp     r10, 2                                  ; 0273 _ 49: 83. FA, 02
        jz      ?_095                                   ; 0277 _ 74, 76
        cmp     r10, 3                                  ; 0279 _ 49: 83. FA, 03
        jz      ?_093                                   ; 027D _ 74, 5E
        cmp     r10, 4                                  ; 027F _ 49: 83. FA, 04
        jz      ?_091                                   ; 0283 _ 74, 45
        cmp     r10, 5                                  ; 0285 _ 49: 83. FA, 05
        jz      ?_089                                   ; 0289 _ 74, 2C
        cmp     r10, 6                                  ; 028B _ 49: 83. FA, 06
        jz      ?_087                                   ; 028F _ 74, 13
        test    r9, r9                                  ; 0291 _ 4D: 85. C9
        mov     r8d, dword [rdx]                        ; 0294 _ 44: 8B. 02
        jz      ?_086                                   ; 0297 _ 74, 03
        mov     dword [r9], r8d                         ; 0299 _ 45: 89. 01
?_086:  add     r9, 4                                   ; 029C _ 49: 83. C1, 04
        add     rdx, 4                                  ; 02A0 _ 48: 83. C2, 04
?_087:  test    r9, r9                                  ; 02A4 _ 4D: 85. C9
        mov     r11d, dword [rdx]                       ; 02A7 _ 44: 8B. 1A
        jz      ?_088                                   ; 02AA _ 74, 03
        mov     dword [r9], r11d                        ; 02AC _ 45: 89. 19
?_088:  add     r9, 4                                   ; 02AF _ 49: 83. C1, 04
        add     rdx, 4                                  ; 02B3 _ 48: 83. C2, 04
?_089:  test    r9, r9                                  ; 02B7 _ 4D: 85. C9
        mov     r12d, dword [rdx]                       ; 02BA _ 44: 8B. 22
        jz      ?_090                                   ; 02BD _ 74, 03
        mov     dword [r9], r12d                        ; 02BF _ 45: 89. 21
?_090:  add     r9, 4                                   ; 02C2 _ 49: 83. C1, 04
        add     rdx, 4                                  ; 02C6 _ 48: 83. C2, 04
?_091:  test    r9, r9                                  ; 02CA _ 4D: 85. C9
        mov     r10d, dword [rdx]                       ; 02CD _ 44: 8B. 12
        jz      ?_092                                   ; 02D0 _ 74, 03
        mov     dword [r9], r10d                        ; 02D2 _ 45: 89. 11
?_092:  add     r9, 4                                   ; 02D5 _ 49: 83. C1, 04
        add     rdx, 4                                  ; 02D9 _ 48: 83. C2, 04
?_093:  test    r9, r9                                  ; 02DD _ 4D: 85. C9
        mov     eax, dword [rdx]                        ; 02E0 _ 8B. 02
        jz      ?_094                                   ; 02E2 _ 74, 03
        mov     dword [r9], eax                         ; 02E4 _ 41: 89. 01
?_094:  add     r9, 4                                   ; 02E7 _ 49: 83. C1, 04
        add     rdx, 4                                  ; 02EB _ 48: 83. C2, 04
?_095:  test    r9, r9                                  ; 02EF _ 4D: 85. C9
        mov     r8d, dword [rdx]                        ; 02F2 _ 44: 8B. 02
        jz      ?_096                                   ; 02F5 _ 74, 03
        mov     dword [r9], r8d                         ; 02F7 _ 45: 89. 01
?_096:  add     r9, 4                                   ; 02FA _ 49: 83. C1, 04
        add     rdx, 4                                  ; 02FE _ 48: 83. C2, 04
?_097:  test    r9, r9                                  ; 0302 _ 4D: 85. C9
        mov     r11d, dword [rdx]                       ; 0305 _ 44: 8B. 1A
        jz      ?_098                                   ; 0308 _ 74, 03
        mov     dword [r9], r11d                        ; 030A _ 45: 89. 19
?_098:  add     rdx, 4                                  ; 030D _ 48: 83. C2, 04
        add     r9, 4                                   ; 0311 _ 49: 83. C1, 04
        cmp     rbp, rdx                                ; 0315 _ 48: 39. D5
        jz      ?_108                                   ; 0318 _ 74, 7F
?_099:  test    r9, r9                                  ; 031A _ 4D: 85. C9
        mov     r12d, dword [rdx]                       ; 031D _ 44: 8B. 22
        jz      ?_100                                   ; 0320 _ 74, 03
        mov     dword [r9], r12d                        ; 0322 _ 45: 89. 21
?_100:  lea     r10, [rdx+4H]                           ; 0325 _ 4C: 8D. 52, 04
        mov     eax, dword [rdx+4H]                     ; 0329 _ 8B. 42, 04
        mov     rdx, r9                                 ; 032C _ 4C: 89. CA
        add     rdx, 4                                  ; 032F _ 48: 83. C2, 04
        jz      ?_101                                   ; 0333 _ 74, 04
        mov     dword [r9+4H], eax                      ; 0335 _ 41: 89. 41, 04
?_101:  cmp     rdx, -4                                 ; 0339 _ 48: 83. FA, FC
        mov     r9d, dword [r10+4H]                     ; 033D _ 45: 8B. 4A, 04
        jz      ?_102                                   ; 0341 _ 74, 04
        mov     dword [rdx+4H], r9d                     ; 0343 _ 44: 89. 4A, 04
?_102:  cmp     rdx, -8                                 ; 0347 _ 48: 83. FA, F8
        mov     r8d, dword [r10+8H]                     ; 034B _ 45: 8B. 42, 08
        jz      ?_103                                   ; 034F _ 74, 04
        mov     dword [rdx+8H], r8d                     ; 0351 _ 44: 89. 42, 08
?_103:  cmp     rdx, -12                                ; 0355 _ 48: 83. FA, F4
        mov     r11d, dword [r10+0CH]                   ; 0359 _ 45: 8B. 5A, 0C
        jz      ?_104                                   ; 035D _ 74, 04
        mov     dword [rdx+0CH], r11d                   ; 035F _ 44: 89. 5A, 0C
?_104:  cmp     rdx, -16                                ; 0363 _ 48: 83. FA, F0
        mov     r12d, dword [r10+10H]                   ; 0367 _ 45: 8B. 62, 10
        jz      ?_105                                   ; 036B _ 74, 04
        mov     dword [rdx+10H], r12d                   ; 036D _ 44: 89. 62, 10
?_105:  cmp     rdx, -20                                ; 0371 _ 48: 83. FA, EC
        mov     eax, dword [r10+14H]                    ; 0375 _ 41: 8B. 42, 14
        jz      ?_106                                   ; 0379 _ 74, 03
        mov     dword [rdx+14H], eax                    ; 037B _ 89. 42, 14
?_106:  cmp     rdx, -24                                ; 037E _ 48: 83. FA, E8
        mov     r9d, dword [r10+18H]                    ; 0382 _ 45: 8B. 4A, 18
        jz      ?_107                                   ; 0386 _ 74, 04
        mov     dword [rdx+18H], r9d                    ; 0388 _ 44: 89. 4A, 18
?_107:  lea     r9, [rdx+1CH]                           ; 038C _ 4C: 8D. 4A, 1C
        lea     rdx, [r10+1CH]                          ; 0390 _ 49: 8D. 52, 1C
        cmp     rbp, rdx                                ; 0394 _ 48: 39. D5
        jnz     ?_099                                   ; 0397 _ 75, 81
?_108:  test    rcx, rcx                                ; 0399 _ 48: 85. C9
        jz      ?_109                                   ; 039C _ 74, 05
        call    _ZdlPv                                  ; 039E _ E8, 00000000(rel)
?_109:  add     rbx, rsi                                ; 03A3 _ 48: 01. F3
        mov     qword [rdi], rsi                        ; 03A6 _ 48: 89. 37
        mov     qword [rdi+10H], rbx                    ; 03A9 _ 48: 89. 5F, 10
        jmp     ?_081                                   ; 03AD _ E9, FFFFFE3A

?_110:  call    memmove                                 ; 03B2 _ E8, 00000000(rel)
        mov     r9, qword [rdi+8H]                      ; 03B7 _ 4C: 8B. 4F, 08
        mov     rcx, qword [rdi]                        ; 03BB _ 48: 8B. 0F
        mov     rbp, qword [rsi+8H]                     ; 03BE _ 48: 8B. 6E, 08
        mov     rdx, qword [rsi]                        ; 03C2 _ 48: 8B. 16
        mov     r8, r9                                  ; 03C5 _ 4D: 89. C8
        sub     r8, rcx                                 ; 03C8 _ 49: 29. C8
        jmp     ?_055                                   ; 03CB _ E9, FFFFFC9A

?_111:  mov     r8, rbx                                 ; 03D0 _ 49: 89. D8
        mov     rdx, r12                                ; 03D3 _ 4C: 89. E2
        call    memmove                                 ; 03D6 _ E8, 00000000(rel)
        add     rbx, qword [rdi]                        ; 03DB _ 48: 03. 1F
        jmp     ?_081                                   ; 03DE _ E9, FFFFFE09
; _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_ End of function

?_112:  ; Local function
        call    _ZSt17__throw_bad_allocv                ; 03E3 _ E8, 00000000(rel)
        nop                                             ; 03E8 _ 90
        nop                                             ; 03E9 _ 90
        nop                                             ; 03EA _ 90
        nop                                             ; 03EB _ 90
        nop                                             ; 03EC _ 90
        nop                                             ; 03ED _ 90
        nop                                             ; 03EE _ 90
        nop                                             ; 03EF _ 90


SECTION .xdata$_ZNSt6vectorI4MoveSaIS0_EEaSERKS2_ align=4 noexecute ; section number 28, const
;  Communal section not supported by YASM

        db 01H, 0AH, 06H, 00H, 0AH, 32H, 06H, 30H       ; 0000 _ .....2.0
        db 05H, 60H, 04H, 70H, 03H, 50H, 02H, 0C0H      ; 0008 _ .`.p.P..


SECTION .text$_ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_ align=16 execute ; section number 30, code
;  Communal section not supported by YASM

.weak._ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_._ZN10ThreadPool4initEv:; Function begin

_ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_:
        push    r14                                     ; 0000 _ 41: 56
        push    r13                                     ; 0002 _ 41: 55
        push    r12                                     ; 0004 _ 41: 54
        push    rbp                                     ; 0006 _ 55
        push    rdi                                     ; 0007 _ 57
        push    rsi                                     ; 0008 _ 56
        push    rbx                                     ; 0009 _ 53
        sub     rsp, 32                                 ; 000A _ 48: 83. EC, 20
        mov     rsi, qword [rcx+8H]                     ; 000E _ 48: 8B. 71, 08
        mov     rax, qword [rcx]                        ; 0012 _ 48: 8B. 01
        mov     rbp, rcx                                ; 0015 _ 48: 89. CD
        mov     rcx, rsi                                ; 0018 _ 48: 89. F1
        mov     rbx, rdx                                ; 001B _ 48: 89. D3
        sub     rcx, rax                                ; 001E _ 48: 29. C1
        mov     r12, rcx                                ; 0021 _ 49: 89. CC
        sar     r12, 5                                  ; 0024 _ 49: C1. FC, 05
        test    r12, r12                                ; 0028 _ 4D: 85. E4
        je      ?_149                                   ; 002B _ 0F 84, 00000414
        lea     rdx, [r12+r12]                          ; 0031 _ 4B: 8D. 14 24
        cmp     r12, rdx                                ; 0035 _ 49: 39. D4
        jbe     ?_150                                   ; 0038 _ 0F 86, 00000412
?_113:  mov     r12, -32                                ; 003E _ 49: C7. C4, FFFFFFE0
?_114:  mov     rcx, r12                                ; 0045 _ 4C: 89. E1
        call    _Znwy                                   ; 0048 _ E8, 00000000(rel)
        mov     rsi, qword [rbp+8H]                     ; 004D _ 48: 8B. 75, 08
        mov     rdi, rax                                ; 0051 _ 48: 89. C7
        mov     rax, qword [rbp]                        ; 0054 _ 48: 8B. 45, 00
        lea     r13, [rdi+20H]                          ; 0058 _ 4C: 8D. 6F, 20
        mov     rcx, rsi                                ; 005C _ 48: 89. F1
        sub     rcx, rax                                ; 005F _ 48: 29. C1
?_115:  add     rcx, rdi                                ; 0062 _ 48: 01. F9
        jz      ?_116                                   ; 0065 _ 74, 5A
        mov     eax, dword [rbx]                        ; 0067 _ 8B. 03
        mov     esi, dword [rbx+4H]                     ; 0069 _ 8B. 73, 04
        mov     qword [rcx+10H], 0                      ; 006C _ 48: C7. 41, 10, 00000000
        mov     qword [rcx+18H], 0                      ; 0074 _ 48: C7. 41, 18, 00000000
        mov     qword [rcx+8H], 0                       ; 007C _ 48: C7. 41, 08, 00000000
        mov     r9, qword [rbx+8H]                      ; 0084 _ 4C: 8B. 4B, 08
        mov     dword [rcx], eax                        ; 0088 _ 89. 01
        mov     dword [rcx+4H], esi                     ; 008A _ 89. 71, 04
        mov     qword [rcx+8H], r9                      ; 008D _ 4C: 89. 49, 08
        mov     r11, qword [rbx+10H]                    ; 0091 _ 4C: 8B. 5B, 10
        mov     qword [rbx+8H], 0                       ; 0095 _ 48: C7. 43, 08, 00000000
        mov     r10, qword [rcx+10H]                    ; 009D _ 4C: 8B. 51, 10
        mov     qword [rcx+10H], r11                    ; 00A1 _ 4C: 89. 59, 10
        mov     rdx, qword [rbx+18H]                    ; 00A5 _ 48: 8B. 53, 18
        mov     qword [rbx+10H], r10                    ; 00A9 _ 4C: 89. 53, 10
        mov     r14, qword [rcx+18H]                    ; 00AD _ 4C: 8B. 71, 18
        mov     qword [rcx+18H], rdx                    ; 00B1 _ 48: 89. 51, 18
        mov     qword [rbx+18H], r14                    ; 00B5 _ 4C: 89. 73, 18
        mov     rsi, qword [rbp+8H]                     ; 00B9 _ 48: 8B. 75, 08
        mov     rax, qword [rbp]                        ; 00BD _ 48: 8B. 45, 00
?_116:  cmp     rax, rsi                                ; 00C1 _ 48: 39. F0
        je      ?_147                                   ; 00C4 _ 0F 84, 00000350
        mov     r13, rsi                                ; 00CA _ 49: 89. F5
        sub     r13, rax                                ; 00CD _ 49: 29. C5
        sub     r13, 32                                 ; 00D0 _ 49: 83. ED, 20
        shr     r13, 5                                  ; 00D4 _ 49: C1. ED, 05
        and     r13d, 01H                               ; 00D8 _ 41: 83. E5, 01
        test    rdi, rdi                                ; 00DC _ 48: 85. FF
        jz      ?_117                                   ; 00DF _ 74, 52
        mov     ebx, dword [rax]                        ; 00E1 _ 8B. 18
        mov     dword [rdi], ebx                        ; 00E3 _ 89. 1F
        mov     ecx, dword [rax+4H]                     ; 00E5 _ 8B. 48, 04
        mov     qword [rdi+10H], 0                      ; 00E8 _ 48: C7. 47, 10, 00000000
        mov     qword [rdi+18H], 0                      ; 00F0 _ 48: C7. 47, 18, 00000000
        mov     qword [rdi+8H], 0                       ; 00F8 _ 48: C7. 47, 08, 00000000
        mov     r8, qword [rax+8H]                      ; 0100 _ 4C: 8B. 40, 08
        mov     dword [rdi+4H], ecx                     ; 0104 _ 89. 4F, 04
        mov     qword [rdi+8H], r8                      ; 0107 _ 4C: 89. 47, 08
        mov     r10, qword [rax+10H]                    ; 010B _ 4C: 8B. 50, 10
        mov     qword [rax+8H], 0                       ; 010F _ 48: C7. 40, 08, 00000000
        mov     r9, qword [rdi+10H]                     ; 0117 _ 4C: 8B. 4F, 10
        mov     qword [rdi+10H], r10                    ; 011B _ 4C: 89. 57, 10
        mov     r14, qword [rax+18H]                    ; 011F _ 4C: 8B. 70, 18
        mov     qword [rax+10H], r9                     ; 0123 _ 4C: 89. 48, 10
        mov     r11, qword [rdi+18H]                    ; 0127 _ 4C: 8B. 5F, 18
        mov     qword [rdi+18H], r14                    ; 012B _ 4C: 89. 77, 18
        mov     qword [rax+18H], r11                    ; 012F _ 4C: 89. 58, 18
?_117:  lea     r8, [rax+20H]                           ; 0133 _ 4C: 8D. 40, 20
        lea     rdx, [rdi+20H]                          ; 0137 _ 48: 8D. 57, 20
        cmp     r8, rsi                                 ; 013B _ 49: 39. F0
        je      ?_122                                   ; 013E _ 0F 84, 0000013F
        test    r13, r13                                ; 0144 _ 4D: 85. ED
        jz      ?_119                                   ; 0147 _ 74, 6B
        test    rdx, rdx                                ; 0149 _ 48: 85. D2
        jz      ?_118                                   ; 014C _ 74, 55
        mov     r13d, dword [r8]                        ; 014E _ 45: 8B. 28
        mov     dword [rdx], r13d                       ; 0151 _ 44: 89. 2A
        mov     ebx, dword [r8+4H]                      ; 0154 _ 41: 8B. 58, 04
        mov     qword [rdx+10H], 0                      ; 0158 _ 48: C7. 42, 10, 00000000
        mov     qword [rdx+18H], 0                      ; 0160 _ 48: C7. 42, 18, 00000000
        mov     qword [rdx+8H], 0                       ; 0168 _ 48: C7. 42, 08, 00000000
        mov     rcx, qword [r8+8H]                      ; 0170 _ 49: 8B. 48, 08
        mov     dword [rdx+4H], ebx                     ; 0174 _ 89. 5A, 04
        mov     qword [rdx+8H], rcx                     ; 0177 _ 48: 89. 4A, 08
        mov     r9, qword [r8+10H]                      ; 017B _ 4D: 8B. 48, 10
        mov     qword [r8+8H], 0                        ; 017F _ 49: C7. 40, 08, 00000000
        mov     r10, qword [rdx+10H]                    ; 0187 _ 4C: 8B. 52, 10
        mov     qword [rdx+10H], r9                     ; 018B _ 4C: 89. 4A, 10
        mov     r14, qword [r8+18H]                     ; 018F _ 4D: 8B. 70, 18
        mov     qword [r8+10H], r10                     ; 0193 _ 4D: 89. 50, 10
        mov     r11, qword [rdx+18H]                    ; 0197 _ 4C: 8B. 5A, 18
        mov     qword [rdx+18H], r14                    ; 019B _ 4C: 89. 72, 18
        mov     qword [r8+18H], r11                     ; 019F _ 4D: 89. 58, 18
?_118:  add     r8, 32                                  ; 01A3 _ 49: 83. C0, 20
        add     rdx, 32                                 ; 01A7 _ 48: 83. C2, 20
        cmp     r8, rsi                                 ; 01AB _ 49: 39. F0
        je      ?_122                                   ; 01AE _ 0F 84, 000000CF
?_119:  test    rdx, rdx                                ; 01B4 _ 48: 85. D2
        jz      ?_120                                   ; 01B7 _ 74, 55
        mov     r13d, dword [r8]                        ; 01B9 _ 45: 8B. 28
        mov     dword [rdx], r13d                       ; 01BC _ 44: 89. 2A
        mov     ebx, dword [r8+4H]                      ; 01BF _ 41: 8B. 58, 04
        mov     qword [rdx+10H], 0                      ; 01C3 _ 48: C7. 42, 10, 00000000
        mov     qword [rdx+18H], 0                      ; 01CB _ 48: C7. 42, 18, 00000000
        mov     qword [rdx+8H], 0                       ; 01D3 _ 48: C7. 42, 08, 00000000
        mov     rcx, qword [r8+8H]                      ; 01DB _ 49: 8B. 48, 08
        mov     dword [rdx+4H], ebx                     ; 01DF _ 89. 5A, 04
        mov     qword [rdx+8H], rcx                     ; 01E2 _ 48: 89. 4A, 08
        mov     r9, qword [r8+10H]                      ; 01E6 _ 4D: 8B. 48, 10
        mov     qword [r8+8H], 0                        ; 01EA _ 49: C7. 40, 08, 00000000
        mov     r10, qword [rdx+10H]                    ; 01F2 _ 4C: 8B. 52, 10
        mov     qword [rdx+10H], r9                     ; 01F6 _ 4C: 89. 4A, 10
        mov     r14, qword [r8+18H]                     ; 01FA _ 4D: 8B. 70, 18
        mov     qword [r8+10H], r10                     ; 01FE _ 4D: 89. 50, 10
        mov     r11, qword [rdx+18H]                    ; 0202 _ 4C: 8B. 5A, 18
        mov     qword [rdx+18H], r14                    ; 0206 _ 4C: 89. 72, 18
        mov     qword [r8+18H], r11                     ; 020A _ 4D: 89. 58, 18
?_120:  lea     r13, [r8+20H]                           ; 020E _ 4D: 8D. 68, 20
        mov     rbx, rdx                                ; 0212 _ 48: 89. D3
        add     rbx, 32                                 ; 0215 _ 48: 83. C3, 20
        jz      ?_121                                   ; 0219 _ 74, 57
        mov     r8d, dword [r8+20H]                     ; 021B _ 45: 8B. 40, 20
        mov     dword [rdx+20H], r8d                    ; 021F _ 44: 89. 42, 20
        mov     edx, dword [r13+4H]                     ; 0223 _ 41: 8B. 55, 04
        mov     qword [rbx+10H], 0                      ; 0227 _ 48: C7. 43, 10, 00000000
        mov     qword [rbx+18H], 0                      ; 022F _ 48: C7. 43, 18, 00000000
        mov     qword [rbx+8H], 0                       ; 0237 _ 48: C7. 43, 08, 00000000
        mov     rcx, qword [r13+8H]                     ; 023F _ 49: 8B. 4D, 08
        mov     dword [rbx+4H], edx                     ; 0243 _ 89. 53, 04
        mov     qword [rbx+8H], rcx                     ; 0246 _ 48: 89. 4B, 08
        mov     r9, qword [r13+10H]                     ; 024A _ 4D: 8B. 4D, 10
        mov     qword [r13+8H], 0                       ; 024E _ 49: C7. 45, 08, 00000000
        mov     r10, qword [rbx+10H]                    ; 0256 _ 4C: 8B. 53, 10
        mov     qword [rbx+10H], r9                     ; 025A _ 4C: 89. 4B, 10
        mov     r14, qword [r13+18H]                    ; 025E _ 4D: 8B. 75, 18
        mov     qword [r13+10H], r10                    ; 0262 _ 4D: 89. 55, 10
        mov     r11, qword [rbx+18H]                    ; 0266 _ 4C: 8B. 5B, 18
        mov     qword [rbx+18H], r14                    ; 026A _ 4C: 89. 73, 18
        mov     qword [r13+18H], r11                    ; 026E _ 4D: 89. 5D, 18
?_121:  lea     r8, [r13+20H]                           ; 0272 _ 4D: 8D. 45, 20
        lea     rdx, [rbx+20H]                          ; 0276 _ 48: 8D. 53, 20
        cmp     r8, rsi                                 ; 027A _ 49: 39. F0
        jne     ?_119                                   ; 027D _ 0F 85, FFFFFF31
?_122:  add     rax, 32                                 ; 0283 _ 48: 83. C0, 20
        mov     rbx, qword [rbp]                        ; 0287 _ 48: 8B. 5D, 00
        sub     rsi, rax                                ; 028B _ 48: 29. C6
        and     rsi, 0FFFFFFFFFFFFFFE0H                 ; 028E _ 48: 83. E6, E0
        lea     r13, [rdi+rsi+40H]                      ; 0292 _ 4C: 8D. 6C 37, 40
        mov     rsi, qword [rbp+8H]                     ; 0297 _ 48: 8B. 75, 08
        cmp     rsi, rbx                                ; 029B _ 48: 39. DE
        je      ?_147                                   ; 029E _ 0F 84, 00000176
        mov     r14, rsi                                ; 02A4 _ 49: 89. F6
        mov     rcx, qword [rbx+8H]                     ; 02A7 _ 48: 8B. 4B, 08
        sub     r14, rbx                                ; 02AB _ 49: 29. DE
        sub     r14, 32                                 ; 02AE _ 49: 83. EE, 20
        shr     r14, 5                                  ; 02B2 _ 49: C1. EE, 05
        and     r14d, 07H                               ; 02B6 _ 41: 83. E6, 07
        test    rcx, rcx                                ; 02BA _ 48: 85. C9
        jz      ?_123                                   ; 02BD _ 74, 05
        call    _ZdlPv                                  ; 02BF _ E8, 00000000(rel)
?_123:  add     rbx, 32                                 ; 02C4 _ 48: 83. C3, 20
        cmp     rsi, rbx                                ; 02C8 _ 48: 39. DE
        je      ?_146                                   ; 02CB _ 0F 84, 00000145
        test    r14, r14                                ; 02D1 _ 4D: 85. F6
        je      ?_137                                   ; 02D4 _ 0F 84, 000000AF
        cmp     r14, 1                                  ; 02DA _ 49: 83. FE, 01
        je      ?_135                                   ; 02DE _ 0F 84, 0000008A
        cmp     r14, 2                                  ; 02E4 _ 49: 83. FE, 02
        jz      ?_133                                   ; 02E8 _ 74, 72
        cmp     r14, 3                                  ; 02EA _ 49: 83. FE, 03
        jz      ?_131                                   ; 02EE _ 74, 5A
        cmp     r14, 4                                  ; 02F0 _ 49: 83. FE, 04
        jz      ?_129                                   ; 02F4 _ 74, 42
        cmp     r14, 5                                  ; 02F6 _ 49: 83. FE, 05
        jz      ?_127                                   ; 02FA _ 74, 2A
        cmp     r14, 6                                  ; 02FC _ 49: 83. FE, 06
        jz      ?_125                                   ; 0300 _ 74, 12
        mov     rcx, qword [rbx+8H]                     ; 0302 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 0306 _ 48: 85. C9
        jz      ?_124                                   ; 0309 _ 74, 05
        call    _ZdlPv                                  ; 030B _ E8, 00000000(rel)
?_124:  add     rbx, 32                                 ; 0310 _ 48: 83. C3, 20
?_125:  mov     rcx, qword [rbx+8H]                     ; 0314 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 0318 _ 48: 85. C9
        jz      ?_126                                   ; 031B _ 74, 05
        call    _ZdlPv                                  ; 031D _ E8, 00000000(rel)
?_126:  add     rbx, 32                                 ; 0322 _ 48: 83. C3, 20
?_127:  mov     rcx, qword [rbx+8H]                     ; 0326 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 032A _ 48: 85. C9
        jz      ?_128                                   ; 032D _ 74, 05
        call    _ZdlPv                                  ; 032F _ E8, 00000000(rel)
?_128:  add     rbx, 32                                 ; 0334 _ 48: 83. C3, 20
?_129:  mov     rcx, qword [rbx+8H]                     ; 0338 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 033C _ 48: 85. C9
        jz      ?_130                                   ; 033F _ 74, 05
        call    _ZdlPv                                  ; 0341 _ E8, 00000000(rel)
?_130:  add     rbx, 32                                 ; 0346 _ 48: 83. C3, 20
?_131:  mov     rcx, qword [rbx+8H]                     ; 034A _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 034E _ 48: 85. C9
        jz      ?_132                                   ; 0351 _ 74, 05
        call    _ZdlPv                                  ; 0353 _ E8, 00000000(rel)
?_132:  add     rbx, 32                                 ; 0358 _ 48: 83. C3, 20
?_133:  mov     rcx, qword [rbx+8H]                     ; 035C _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 0360 _ 48: 85. C9
        jz      ?_134                                   ; 0363 _ 74, 05
        call    _ZdlPv                                  ; 0365 _ E8, 00000000(rel)
?_134:  add     rbx, 32                                 ; 036A _ 48: 83. C3, 20
?_135:  mov     rcx, qword [rbx+8H]                     ; 036E _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 0372 _ 48: 85. C9
        jz      ?_136                                   ; 0375 _ 74, 05
        call    _ZdlPv                                  ; 0377 _ E8, 00000000(rel)
?_136:  add     rbx, 32                                 ; 037C _ 48: 83. C3, 20
        cmp     rsi, rbx                                ; 0380 _ 48: 39. DE
        je      ?_146                                   ; 0383 _ 0F 84, 0000008D
?_137:  mov     rcx, qword [rbx+8H]                     ; 0389 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 038D _ 48: 85. C9
        jz      ?_138                                   ; 0390 _ 74, 05
        call    _ZdlPv                                  ; 0392 _ E8, 00000000(rel)
?_138:  add     rbx, 32                                 ; 0397 _ 48: 83. C3, 20
        mov     rcx, qword [rbx+8H]                     ; 039B _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 039F _ 48: 85. C9
        jz      ?_139                                   ; 03A2 _ 74, 05
        call    _ZdlPv                                  ; 03A4 _ E8, 00000000(rel)
?_139:  mov     rcx, qword [rbx+28H]                    ; 03A9 _ 48: 8B. 4B, 28
        test    rcx, rcx                                ; 03AD _ 48: 85. C9
        jz      ?_140                                   ; 03B0 _ 74, 05
        call    _ZdlPv                                  ; 03B2 _ E8, 00000000(rel)
?_140:  mov     rcx, qword [rbx+48H]                    ; 03B7 _ 48: 8B. 4B, 48
        test    rcx, rcx                                ; 03BB _ 48: 85. C9
        jz      ?_141                                   ; 03BE _ 74, 05
        call    _ZdlPv                                  ; 03C0 _ E8, 00000000(rel)
?_141:  mov     rcx, qword [rbx+68H]                    ; 03C5 _ 48: 8B. 4B, 68
        test    rcx, rcx                                ; 03C9 _ 48: 85. C9
        jz      ?_142                                   ; 03CC _ 74, 05
        call    _ZdlPv                                  ; 03CE _ E8, 00000000(rel)
?_142:  mov     rcx, qword [rbx+88H]                    ; 03D3 _ 48: 8B. 8B, 00000088
        test    rcx, rcx                                ; 03DA _ 48: 85. C9
        jz      ?_143                                   ; 03DD _ 74, 05
        call    _ZdlPv                                  ; 03DF _ E8, 00000000(rel)
?_143:  mov     rcx, qword [rbx+0A8H]                   ; 03E4 _ 48: 8B. 8B, 000000A8
        test    rcx, rcx                                ; 03EB _ 48: 85. C9
        jz      ?_144                                   ; 03EE _ 74, 05
        call    _ZdlPv                                  ; 03F0 _ E8, 00000000(rel)
?_144:  mov     rcx, qword [rbx+0C8H]                   ; 03F5 _ 48: 8B. 8B, 000000C8
        test    rcx, rcx                                ; 03FC _ 48: 85. C9
        jz      ?_145                                   ; 03FF _ 74, 05
        call    _ZdlPv                                  ; 0401 _ E8, 00000000(rel)
?_145:  add     rbx, 224                                ; 0406 _ 48: 81. C3, 000000E0
        cmp     rsi, rbx                                ; 040D _ 48: 39. DE
        jne     ?_137                                   ; 0410 _ 0F 85, FFFFFF73
?_146:  mov     rsi, qword [rbp]                        ; 0416 _ 48: 8B. 75, 00
?_147:  test    rsi, rsi                                ; 041A _ 48: 85. F6
        jz      ?_148                                   ; 041D _ 74, 08
        mov     rcx, rsi                                ; 041F _ 48: 89. F1
        call    _ZdlPv                                  ; 0422 _ E8, 00000000(rel)
?_148:  mov     qword [rbp], rdi                        ; 0427 _ 48: 89. 7D, 00
        add     rdi, r12                                ; 042B _ 4C: 01. E7
        mov     qword [rbp+8H], r13                     ; 042E _ 4C: 89. 6D, 08
        mov     qword [rbp+10H], rdi                    ; 0432 _ 48: 89. 7D, 10
        add     rsp, 32                                 ; 0436 _ 48: 83. C4, 20
        pop     rbx                                     ; 043A _ 5B
        pop     rsi                                     ; 043B _ 5E
        pop     rdi                                     ; 043C _ 5F
        pop     rbp                                     ; 043D _ 5D
        pop     r12                                     ; 043E _ 41: 5C
        pop     r13                                     ; 0440 _ 41: 5D
        pop     r14                                     ; 0442 _ 41: 5E
        ret                                             ; 0444 _ C3

?_149:  mov     r12d, 32                                ; 0445 _ 41: BC, 00000020
        jmp     ?_114                                   ; 044B _ E9, FFFFFBF5
; .weak._ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_._ZN10ThreadPool4initEv End of function

?_150:  ; Local function
        mov     r8, qword 7FFFFFFFFFFFFFFH              ; 0450 _ 49: B8, 07FFFFFFFFFFFFFF
        cmp     rdx, r8                                 ; 045A _ 4C: 39. C2
        ja      ?_113                                   ; 045D _ 0F 87, FFFFFBDB
        shl     r12, 6                                  ; 0463 _ 49: C1. E4, 06
        test    rdx, rdx                                ; 0467 _ 48: 85. D2
        jne     ?_114                                   ; 046A _ 0F 85, FFFFFBD5
        mov     r13d, 32                                ; 0470 _ 41: BD, 00000020
        xor     edi, edi                                ; 0476 _ 31. FF
        jmp     ?_115                                   ; 0478 _ E9, FFFFFBE5

        nop                                             ; 047D _ 90
        nop                                             ; 047E _ 90
        nop                                             ; 047F _ 90


SECTION .xdata$_ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_ align=4 noexecute ; section number 31, const
;  Communal section not supported by YASM

        db 01H, 0EH, 08H, 00H, 0EH, 32H, 0AH, 30H       ; 0000 _ .....2.0
        db 09H, 60H, 08H, 70H, 07H, 50H, 06H, 0C0H      ; 0008 _ .`.p.P..
        db 04H, 0D0H, 02H, 0E0H                         ; 0010 _ ....


SECTION .text$_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E align=16 execute ; section number 33, code
;  Communal section not supported by YASM

_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E:; Function begin
        push    rdi                                     ; 0000 _ 57
        push    rsi                                     ; 0001 _ 56
        push    rbx                                     ; 0002 _ 53
        sub     rsp, 32                                 ; 0003 _ 48: 83. EC, 20
        mov     rsi, rcx                                ; 0007 _ 48: 89. CE
        mov     rbx, rdx                                ; 000A _ 48: 89. D3
?_151:  test    rbx, rbx                                ; 000D _ 48: 85. DB
        jnz     ?_152                                   ; 0010 _ 75, 08
        add     rsp, 32                                 ; 0012 _ 48: 83. C4, 20
        pop     rbx                                     ; 0016 _ 5B
        pop     rsi                                     ; 0017 _ 5E
        pop     rdi                                     ; 0018 _ 5F
        ret                                             ; 0019 _ C3
; _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E End of function

?_152:  ; Local function
        mov     rdx, qword [rbx+18H]                    ; 001A _ 48: 8B. 53, 18
        mov     rcx, rsi                                ; 001E _ 48: 89. F1
        call    _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E; 0021 _ E8, FFFFFFDA
        mov     rcx, qword [rbx+28H]                    ; 0026 _ 48: 8B. 4B, 28
        mov     rdi, qword [rbx+10H]                    ; 002A _ 48: 8B. 7B, 10
        test    rcx, rcx                                ; 002E _ 48: 85. C9
        jz      ?_153                                   ; 0031 _ 74, 06
        mov     rdx, qword [rcx]                        ; 0033 _ 48: 8B. 11
        call    near [rdx+8H]                           ; 0036 _ FF. 52, 08
?_153:  mov     rcx, rbx                                ; 0039 _ 48: 89. D9
        mov     rbx, rdi                                ; 003C _ 48: 89. FB
        call    _ZdlPv                                  ; 003F _ E8, 00000000(rel)
        jmp     ?_151                                   ; 0044 _ EB, C7

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


SECTION .xdata$_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI11ScaleFactorESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E align=4 noexecute ; section number 34, const
;  Communal section not supported by YASM

        db 01H, 07H, 04H, 00H, 07H, 32H, 03H, 30H       ; 0000 _ .....2.0
        db 02H, 60H, 01H, 70H                           ; 0008 _ .`.p


SECTION .text$_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E align=16 execute ; section number 36, code
;  Communal section not supported by YASM

_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E:; Function begin
        push    rdi                                     ; 0000 _ 57
        push    rsi                                     ; 0001 _ 56
        push    rbx                                     ; 0002 _ 53
        sub     rsp, 32                                 ; 0003 _ 48: 83. EC, 20
        mov     rsi, rcx                                ; 0007 _ 48: 89. CE
        mov     rbx, rdx                                ; 000A _ 48: 89. D3
?_154:  test    rbx, rbx                                ; 000D _ 48: 85. DB
        jnz     ?_155                                   ; 0010 _ 75, 08
        add     rsp, 32                                 ; 0012 _ 48: 83. C4, 20
        pop     rbx                                     ; 0016 _ 5B
        pop     rsi                                     ; 0017 _ 5E
        pop     rdi                                     ; 0018 _ 5F
        ret                                             ; 0019 _ C3
; _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E End of function

?_155:  ; Local function
        mov     rdx, qword [rbx+18H]                    ; 001A _ 48: 8B. 53, 18
        mov     rcx, rsi                                ; 001E _ 48: 89. F1
        call    _ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E; 0021 _ E8, FFFFFFDA
        mov     rcx, qword [rbx+28H]                    ; 0026 _ 48: 8B. 4B, 28
        mov     rdi, qword [rbx+10H]                    ; 002A _ 48: 8B. 7B, 10
        test    rcx, rcx                                ; 002E _ 48: 85. C9
        jz      ?_156                                   ; 0031 _ 74, 06
        mov     rdx, qword [rcx]                        ; 0033 _ 48: 8B. 11
        call    near [rdx+8H]                           ; 0036 _ FF. 52, 08
?_156:  mov     rcx, rbx                                ; 0039 _ 48: 89. D9
        mov     rbx, rdi                                ; 003C _ 48: 89. FB
        call    _ZdlPv                                  ; 003F _ E8, 00000000(rel)
        jmp     ?_154                                   ; 0044 _ EB, C7

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


SECTION .xdata$_ZNSt8_Rb_treeIySt4pairIKySt10unique_ptrI11EndgameBaseI5ValueESt14default_deleteIS5_EEESt10_Select1stIS9_ESt4lessIyESaIS9_EE8_M_eraseEPSt13_Rb_tree_nodeIS9_E align=4 noexecute ; section number 37, const
;  Communal section not supported by YASM

        db 01H, 07H, 04H, 00H, 07H, 32H, 03H, 30H       ; 0000 _ .....2.0
        db 02H, 60H, 01H, 70H                           ; 0008 _ .`.p


SECTION .xdata.unlikely align=4 noexecute               ; section number 39, const

        db 01H, 05H, 02H, 00H, 05H, 32H, 01H, 30H       ; 0000 _ .....2.0
        db 01H, 07H, 04H, 00H, 07H, 32H, 03H, 30H       ; 0008 _ .....2.0
        db 02H, 60H, 01H, 70H                           ; 0010 _ .`.p


SECTION .rdata$_ZTV6Thread align=32 noexecute           ; section number 41, const
;  Communal section not supported by YASM

_ZTV6Thread:                                            ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0008 _ ........
        dq _ZN6ThreadD2Ev                               ; 0010 _ 00000000000006B0 (d)
        dq _ZN6ThreadD0Ev                               ; 0018 _ 00000000000000D0 (d)
        dq _ZN6Thread6searchEv                          ; 0020 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0028 _ 0000000000000000 
        dq 0000000000000000H                            ; 0030 _ 0000000000000000 
        dq 0000000000000000H                            ; 0038 _ 0000000000000000 


SECTION .rdata$zzz align=16 noexecute                   ; section number 42, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr._ZN6Search11SetupStatesE align=16 noexecute ; section number 43, const
;  Communal section not supported by YASM

.refptr._ZN6Search11SetupStatesE:                       ; qword
        dq _ZN6Search11SetupStatesE                     ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr._ZN6Search6LimitsE align=16 noexecute ; section number 44, const
;  Communal section not supported by YASM

.refptr._ZN6Search6LimitsE:                             ; qword
        dq _ZN6Search6LimitsE                           ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr._ZN6Search7SignalsE align=16 noexecute ; section number 45, const
;  Communal section not supported by YASM

.refptr._ZN6Search7SignalsE:                            ; qword
        dq _ZN6Search7SignalsE                          ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.Opt align=16 noexecute           ; section number 46, const
;  Communal section not supported by YASM

.refptr.Opt:                                            ; qword
        dq Opt                                          ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr._ZTV10MainThread align=16 noexecute ; section number 47, const
;  Communal section not supported by YASM

.refptr._ZTV10MainThread:                               ; qword
        dq _ZTV10MainThread                             ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


