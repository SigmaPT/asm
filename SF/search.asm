; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\search.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: BMI etc., x64

default rel

global _ZN6Search4initEv: function
global _ZN6Search5clearEv: function
global _ZN10MainThread6searchEv: function
global _ZN6Thread6searchEv: function
global _ZN6Search8RootMove15insert_pv_in_ttER8Position: function
global _ZN3UCI8print_pvEPcRK8Position5Depth5ValueS5_: function
global _ZN10Tablebases5ScoreE
global _ZN10Tablebases10ProbeDepthE
global _ZN10Tablebases9UseRule50E
global _ZN10Tablebases8RootInTBE
global _ZN10Tablebases4HitsE
global _ZN10Tablebases11CardinalityE
global _ZN6Search11SetupStatesE
global _ZN6Search6LimitsE
global _ZN6Search7SignalsE
global _ZN6Search8RootMove22extract_ponder_from_ttER8Position: function
global _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_: function
global .weak._ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_._ZN6Search4initEv
global _ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_: function
global _ZNSt6vectorIN6Search8RootMoveESaIS1_EEaSERKS3_: function
global _ZSt4swapIN6Search8RootMoveEEvRT_S3_: function
global _ZN10ThreadPool4mainEv: function
global _ZSt4findIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEE4MoveET_SA_SA_RKT0_: function
global _ZSt9__find_ifIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops16_Iter_equals_valIK4MoveEEET_SE_SE_T0_St26random_access_iterator_tag: function
global _ZNSt6vectorI4MoveSaIS0_EE17_M_default_appendEy: function
global _ZSt21__inplace_stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_: function
global _ZSt22__stable_sort_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_xNS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_T2_: function
global _ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_: function
global _ZNSt20__copy_move_backwardILb1ELb0ESt26random_access_iterator_tagE13__copy_move_bIPN6Search8RootMoveES5_EET0_T_S7_S6_: function
global _ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops14_Val_less_iterEEvT_T0_: function
global _ZSt12__move_mergeIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_NS0_5__ops15_Iter_less_iterEET0_T_SC_SC_SC_SB_T1_: function
global _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_: function
global _ZSt16__merge_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExS4_NS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_SC_T2_: function
global _ZNSt6vectorI4MoveSaIS0_EE9push_backERKS0_: function
global _ZNKSt6vectorI4MoveSaIS0_EE12_M_check_lenEyPKc: function
global _ZN10MainThreadD0Ev: function
global _ZSt22__merge_without_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExNS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_: function
global _ZN10MainThreadD1Ev: function
global _ZNKSt6vectorIP6ThreadSaIS1_EE14_M_range_checkEy: function
global _ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_: function
global _ZN6Search5perftILb0EEEyR8Position5Depth: function
global _ZN6Search5perftILb1EEEyR8Position5Depth: function
global _ZSt8__rotateIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEEEvT_S9_S9_St26random_access_iterator_tag: function
global _ZTV10MainThread
global .refptr._ZSt7nothrow
global .refptr.PieceValue
global .refptr.SquareBB
global .refptr._ZN10Tablebases14MaxCardinalityE
global .refptr.Opt
global .refptr.Time
global .refptr.Threads
global .refptr.TT

extern TT                                               ; byte
extern Threads                                          ; byte
extern Time                                             ; byte
extern Opt                                              ; byte
extern _ZN10Tablebases14MaxCardinalityE                 ; byte
extern SquareBB                                         ; byte
extern PieceValue                                       ; byte
extern _ZSt7nothrow                                     ; byte
extern _ZSt24__throw_out_of_range_fmtPKcz               ; near
extern _ZN6ThreadD2Ev                                   ; near
extern _ZN10MovePickerC1ERK8Position4MoveRK5StatsI5ValueLb0EES5_ ; near
extern _ZN8Position14undo_null_moveEv                   ; near
extern _ZN8Position12do_null_moveER9StateInfo           ; near
extern _ZSt20__throw_length_errorPKc                    ; near
extern _ZNK18TranspositionTable8hashfullEv              ; near
extern _Z9print_intPcy                                  ; near
extern _ZdlPvRKSt9nothrow_t                             ; near
extern _ZnwyRKSt9nothrow_t                              ; near
extern _ZN10MovePickerC1ERK8Position4Move5DepthRK5StatsI5ValueLb0EE6Square ; near
extern _ZNK8Position13exclusion_keyEv                   ; near
extern _ZN10Tablebases9probe_wdlER8PositionPi           ; near
extern _ZN4Eval8evaluateERK8Position                    ; near
extern _ZNK8Position8see_signE4Move                     ; near
extern _ZNK8Position3seeE4Move                          ; near
extern _ZNK8Position5legalE4Movey                       ; near
extern _ZNK8Position9key_afterE4Move                    ; near
extern _ZN10MovePicker9next_moveEv                      ; near
extern _ZN10MovePickerC1ERK8Position4Move5DepthRK5StatsI5ValueLb0EERKS5_IS6_Lb1EESC_S3_PN6Search5StackE ; near
extern _ZNK8Position7is_drawEv                          ; near
extern _Z9print_intPci                                  ; near
extern _Z9print_intPcx                                  ; near
extern _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_  ; near
extern _ZN8Position9undo_moveE4Move                     ; near
extern _ZNK18TranspositionTable5probeEyRb               ; near
extern _ZN8Position7do_moveE4MoveR9StateInfob           ; near
extern _ZNK8Position11gives_checkE4MoveRK9CheckInfo     ; near
extern _ZN9CheckInfoC1ERK8Position                      ; near
extern _ZN10Tablebases14root_probe_wdlER8PositionRSt6vectorIN6Search8RootMoveESaIS4_EER5Value ; near
extern _ZN10Tablebases10root_probeER8PositionRSt6vectorIN6Search8RootMoveESaIS4_EER5Value ; near
extern _ZN10ThreadPool14nodes_searchedEv                ; near
extern _ZN6Thread4waitERVKb                             ; near
extern _ZN6Thread15start_searchingEb                    ; near
extern _ZN8PositionaSERKS_                              ; near
extern _ZN6Thread24wait_for_search_finishedEv           ; near
extern _ZN3UCI11print_valueEPc5Value                    ; near
extern _Z9write_outPcS_                                 ; near
extern _ZN3UCI10print_moveEPc4Moveb                     ; near
extern _Z12print_stringPcPKc                            ; near
extern _ZN14TimeManagement4initERN6Search10LimitsTypeE5Colori ; near
extern memmove                                          ; near
extern _ZdlPv                                           ; near
extern memset                                           ; near
extern _ZN18TranspositionTable5clearEv                  ; near
extern pow                                              ; near
extern round                                            ; near
extern log                                              ; near
extern _ZSt17__throw_bad_allocv                         ; near
extern _Znwy                                            ; near
extern _Z3nowv                                          ; near
extern atexit                                           ; near
extern ___chkstk_ms                                     ; near


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_ZN6Search4initEv:
        push    r14                                     ; 0000 _ 41: 56
        push    r13                                     ; 0002 _ 41: 55
        push    r12                                     ; 0004 _ 41: 54
        push    rbp                                     ; 0006 _ 55
        push    rdi                                     ; 0007 _ 57
        push    rsi                                     ; 0008 _ 56
        push    rbx                                     ; 0009 _ 53
        sub     rsp, 160                                ; 000A _ 48: 81. EC, 000000A0
        movaps  oword [rsp+20H], xmm6                   ; 0011 _ 0F 29. 74 24, 20
        movaps  oword [rsp+30H], xmm7                   ; 0016 _ 0F 29. 7C 24, 30
        movaps  oword [rsp+40H], xmm8                   ; 001B _ 44: 0F 29. 44 24, 40
        movaps  oword [rsp+50H], xmm9                   ; 0021 _ 44: 0F 29. 4C 24, 50
        movaps  oword [rsp+60H], xmm10                  ; 0027 _ 44: 0F 29. 54 24, 60
        movaps  oword [rsp+70H], xmm11                  ; 002D _ 44: 0F 29. 5C 24, 70
        movaps  oword [rsp+80H], xmm12                  ; 0033 _ 44: 0F 29. A4 24, 00000080
        movaps  oword [rsp+90H], xmm13                  ; 003C _ 44: 0F 29. AC 24, 00000090
        lea     r14, [rel _ZN12_GLOBAL__N_110ReductionsE]; 0045 _ 4C: 8D. 35, 00400300(rel)
        xor     r13d, r13d                              ; 004C _ 45: 31. ED
        xor     edi, edi                                ; 004F _ 31. FF
        movsd   xmm9, qword [rel ?_0354]                ; 0051 _ F2 44: 0F 10. 0D, 00000350(rel)
        movsd   xmm8, qword [rel ?_0355]                ; 005A _ F2 44: 0F 10. 05, 00000358(rel)
?_0001: mov     rax, r13                                ; 0063 _ 4C: 89. E8
        mov     ebp, r13d                               ; 0066 _ 44: 89. ED
        mov     r12d, 1                                 ; 0069 _ 41: BC, 00000001
        shl     rax, 14                                 ; 006F _ 48: C1. E0, 0E
        xor     ebp, 01H                                ; 0073 _ 83. F5, 01
        lea     rsi, [r14+rax+100H]                     ; 0076 _ 49: 8D. B4 06, 00000100
        and     ebp, 01H                                ; 007E _ 83. E5, 01
?_0002: pxor    xmm7, xmm7                              ; 0081 _ 66: 0F EF. FF
        cvtsi2sd xmm7, r12d                             ; 0085 _ F2 41: 0F 2A. FC
        xor     ebx, ebx                                ; 008A _ 31. DB
?_0003: movapd  xmm0, xmm7                              ; 008C _ 66: 0F 28. C7
        call    log                                     ; 0090 _ E8, 00000000(rel)
        lea     edx, [rbx+1H]                           ; 0095 _ 8D. 53, 01
        movapd  xmm6, xmm0                              ; 0098 _ 66: 0F 28. F0
        pxor    xmm0, xmm0                              ; 009C _ 66: 0F EF. C0
        cvtsi2sd xmm0, edx                              ; 00A0 _ F2: 0F 2A. C2
        call    log                                     ; 00A4 _ E8, 00000000(rel)
        mulsd   xmm6, xmm0                              ; 00A9 _ F2: 0F 59. F0
        movapd  xmm1, xmm6                              ; 00AD _ 66: 0F 28. CE
        mulsd   xmm1, xmm9                              ; 00B1 _ F2 41: 0F 59. C9
        ucomisd xmm8, xmm1                              ; 00B6 _ 66 44: 0F 2E. C1
        movapd  xmm0, xmm1                              ; 00BB _ 66: 0F 28. C1
        ja      ?_0004                                  ; 00BF _ 77, 3E
        call    round                                   ; 00C1 _ E8, 00000000(rel)
        lea     rcx, [rbx*4]                            ; 00C6 _ 48: 8D. 0C 9D, 00000000
        cvttsd2si r8d, xmm0                             ; 00CE _ F2 44: 0F 2C. C0
        lea     r9d, [r8-1H]                            ; 00D3 _ 45: 8D. 48, FF
        mov     dword [rsi+rcx+4H], r8d                 ; 00D7 _ 44: 89. 44 0E, 04
        test    r9d, r9d                                ; 00DC _ 45: 85. C9
        cmovs   r9d, edi                                ; 00DF _ 44: 0F 48. CF
        cmp     r8d, 1                                  ; 00E3 _ 41: 83. F8, 01
        mov     dword [rsi+rcx+8004H], r9d              ; 00E7 _ 44: 89. 8C 0E, 00008004
        jle     ?_0004                                  ; 00EF _ 7E, 0E
        test    bpl, bpl                                ; 00F1 _ 40: 84. ED
        jz      ?_0004                                  ; 00F4 _ 74, 09
        add     r8d, 1                                  ; 00F6 _ 41: 83. C0, 01
        mov     dword [rsi+rcx+4H], r8d                 ; 00FA _ 44: 89. 44 0E, 04
?_0004: add     rbx, 1                                  ; 00FF _ 48: 83. C3, 01
        cmp     rbx, 63                                 ; 0103 _ 48: 83. FB, 3F
        jnz     ?_0003                                  ; 0107 _ 75, 83
        add     r12d, 1                                 ; 0109 _ 41: 83. C4, 01
        add     rsi, 256                                ; 010D _ 48: 81. C6, 00000100
        cmp     r12d, 64                                ; 0114 _ 41: 83. FC, 40
        jne     ?_0002                                  ; 0118 _ 0F 85, FFFFFF63
        sub     r13, 1                                  ; 011E _ 49: 83. ED, 01
        jz      ?_0005                                  ; 0122 _ 74, 0B
        mov     r13d, 1                                 ; 0124 _ 41: BD, 00000001
        jmp     ?_0001                                  ; 012A _ E9, FFFFFF34

?_0005: ; Local function
        movsd   xmm6, qword [rel ?_0356]                ; 012F _ F2: 0F 10. 35, 00000360(rel)
        xor     r13d, r13d                              ; 0137 _ 45: 31. ED
        pxor    xmm13, xmm13                            ; 013A _ 66 45: 0F EF. ED
        movsd   xmm12, qword [rel ?_0357]               ; 013F _ F2 44: 0F 10. 25, 00000368(rel)
        lea     rsi, [rel _ZN12_GLOBAL__N_118FutilityMoveCountsE]; 0148 _ 48: 8D. 35, 00410300(rel)
        movsd   xmm11, qword [rel ?_0358]               ; 014F _ F2 44: 0F 10. 1D, 00000370(rel)
        lea     r12, [rel ?_0248]                       ; 0158 _ 4C: 8D. 25, 00410340(rel)
        movsd   xmm9, qword [rel ?_0359]                ; 015F _ F2 44: 0F 10. 0D, 00000378(rel)
        movsd   xmm8, qword [rel ?_0360]                ; 0168 _ F2 44: 0F 10. 05, 00000380(rel)
        movsd   xmm7, qword [rel ?_0361]                ; 0171 _ F2: 0F 10. 3D, 00000388(rel)
?_0006: pxor    xmm10, xmm10                            ; 0179 _ 66 45: 0F EF. D2
        cvtsi2sd xmm10, r13d                            ; 017E _ F2 45: 0F 2A. D5
        movapd  xmm1, xmm6                              ; 0183 _ 66: 0F 28. CE
        movapd  xmm0, xmm10                             ; 0187 _ 66 41: 0F 28. C2
        addsd   xmm0, xmm13                             ; 018C _ F2 41: 0F 58. C5
        call    pow                                     ; 0191 _ E8, 00000000(rel)
        movapd  xmm1, xmm6                              ; 0196 _ 66: 0F 28. CE
        mulsd   xmm0, xmm12                             ; 019A _ F2 41: 0F 59. C4
        addsd   xmm0, xmm11                             ; 019F _ F2 41: 0F 58. C3
        cvttsd2si r10d, xmm0                            ; 01A4 _ F2 44: 0F 2C. D0
        movapd  xmm0, xmm10                             ; 01A9 _ 66 41: 0F 28. C2
        addsd   xmm0, xmm9                              ; 01AE _ F2 41: 0F 58. C1
        mov     dword [rsi+r13*4], r10d                 ; 01B3 _ 46: 89. 14 AE
        call    pow                                     ; 01B7 _ E8, 00000000(rel)
        mulsd   xmm0, xmm8                              ; 01BC _ F2 41: 0F 59. C0
        addsd   xmm0, xmm7                              ; 01C1 _ F2: 0F 58. C7
        cvttsd2si r11d, xmm0                            ; 01C5 _ F2 44: 0F 2C. D8
        mov     dword [r12+r13*4], r11d                 ; 01CA _ 47: 89. 1C AC
        add     r13, 1                                  ; 01CE _ 49: 83. C5, 01
        cmp     r13, 16                                 ; 01D2 _ 49: 83. FD, 10
        jnz     ?_0006                                  ; 01D6 _ 75, A1
        movaps  xmm6, oword [rsp+20H]                   ; 01D8 _ 0F 28. 74 24, 20
        movaps  xmm7, oword [rsp+30H]                   ; 01DD _ 0F 28. 7C 24, 30
        movaps  xmm8, oword [rsp+40H]                   ; 01E2 _ 44: 0F 28. 44 24, 40
        movaps  xmm9, oword [rsp+50H]                   ; 01E8 _ 44: 0F 28. 4C 24, 50
        movaps  xmm10, oword [rsp+60H]                  ; 01EE _ 44: 0F 28. 54 24, 60
        movaps  xmm11, oword [rsp+70H]                  ; 01F4 _ 44: 0F 28. 5C 24, 70
        movaps  xmm12, oword [rsp+80H]                  ; 01FA _ 44: 0F 28. A4 24, 00000080
        movaps  xmm13, oword [rsp+90H]                  ; 0203 _ 44: 0F 28. AC 24, 00000090
        add     rsp, 160                                ; 020C _ 48: 81. C4, 000000A0
        pop     rbx                                     ; 0213 _ 5B
        pop     rsi                                     ; 0214 _ 5E
        pop     rdi                                     ; 0215 _ 5F
        pop     rbp                                     ; 0216 _ 5D
        pop     r12                                     ; 0217 _ 41: 5C
        pop     r13                                     ; 0219 _ 41: 5D
        pop     r14                                     ; 021B _ 41: 5E
        ret                                             ; 021D _ C3

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

_ZN6Search5clearEv:; Function begin
        push    rdi                                     ; 0220 _ 57
        push    rsi                                     ; 0221 _ 56
        push    rbx                                     ; 0222 _ 53
        sub     rsp, 32                                 ; 0223 _ 48: 83. EC, 20
        mov     rcx, qword [rel .refptr.TT]             ; 0227 _ 48: 8B. 0D, 00000000(rel)
        call    _ZN18TranspositionTable5clearEv         ; 022E _ E8, 00000000(rel)
        mov     r8d, 4194304                            ; 0233 _ 41: B8, 00400000
        xor     edx, edx                                ; 0239 _ 31. D2
        lea     rcx, [rel _ZN12_GLOBAL__N_118CounterMoveHistoryE]; 023B _ 48: 8D. 0D, 000000C0(rel)
        call    memset                                  ; 0242 _ E8, 00000000(rel)
        mov     rax, qword [rel .refptr.Threads]        ; 0247 _ 48: 8B. 05, 00000000(rel)
        mov     rdi, qword [rax+8H]                     ; 024E _ 48: 8B. 78, 08
        mov     rbx, qword [rax]                        ; 0252 _ 48: 8B. 18
?_0007: cmp     rdi, rbx                                ; 0255 _ 48: 39. DF
        jnz     ?_0008                                  ; 0258 _ 75, 1E
        mov     rcx, qword [rel .refptr.Threads]        ; 025A _ 48: 8B. 0D, 00000000(rel)
        call    _ZN10ThreadPool4mainEv                  ; 0261 _ E8, 00000000(rel)
        mov     dword [rax+24E8H], 32001                ; 0266 _ C7. 80, 000024E8, 00007D01
        add     rsp, 32                                 ; 0270 _ 48: 83. C4, 20
        pop     rbx                                     ; 0274 _ 5B
        pop     rsi                                     ; 0275 _ 5E
        pop     rdi                                     ; 0276 _ 5F
        ret                                             ; 0277 _ C3
; _ZN6Search5clearEv End of function

?_0008: ; Local function
        mov     rsi, qword [rbx]                        ; 0278 _ 48: 8B. 33
        mov     r8d, 4096                               ; 027B _ 41: B8, 00001000
        xor     edx, edx                                ; 0281 _ 31. D2
        add     rbx, 8                                  ; 0283 _ 48: 83. C3, 08
        lea     rcx, [rsi+4D4H]                         ; 0287 _ 48: 8D. 8E, 000004D4
        call    memset                                  ; 028E _ E8, 00000000(rel)
        lea     rcx, [rsi+14D4H]                        ; 0293 _ 48: 8D. 8E, 000014D4
        mov     r8d, 4096                               ; 029A _ 41: B8, 00001000
        xor     edx, edx                                ; 02A0 _ 31. D2
        call    memset                                  ; 02A2 _ E8, 00000000(rel)
        jmp     ?_0007                                  ; 02A7 _ EB, AC

        nop                                             ; 02A9 _ 90
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZN10MainThread6searchEv:; Function begin
        push    r15                                     ; 02B0 _ 41: 57
        push    r14                                     ; 02B2 _ 41: 56
        push    r13                                     ; 02B4 _ 41: 55
        push    r12                                     ; 02B6 _ 41: 54
        push    rbp                                     ; 02B8 _ 55
        push    rdi                                     ; 02B9 _ 57
        push    rsi                                     ; 02BA _ 56
        push    rbx                                     ; 02BB _ 53
        sub     rsp, 1048                               ; 02BC _ 48: 81. EC, 00000418
        lea     rdx, [rel _ZN6Search6LimitsE]           ; 02C3 _ 48: 8D. 15, 00000040(rel)
        movsxd  rbp, dword [rcx+49CH]                   ; 02CA _ 48: 63. A9, 0000049C
        mov     r9d, dword [rcx+498H]                   ; 02D1 _ 44: 8B. 89, 00000498
        mov     rbx, rcx                                ; 02D8 _ 48: 89. CB
        mov     rcx, qword [rel .refptr.Time]           ; 02DB _ 48: 8B. 0D, 00000000(rel)
        mov     r8d, ebp                                ; 02E2 _ 41: 89. E8
        mov     rsi, rbp                                ; 02E5 _ 48: 89. EE
        xor     esi, 01H                                ; 02E8 _ 83. F6, 01
        call    _ZN14TimeManagement4initERN6Search10LimitsTypeE5Colori; 02EB _ E8, 00000000(rel)
        mov     rdi, qword [rel .refptr.Opt]            ; 02F0 _ 48: 8B. 3D, 00000000(rel)
        movsxd  r10, esi                                ; 02F7 _ 4C: 63. D6
        mov     ecx, 100                                ; 02FA _ B9, 00000064
        mov     r14, qword [rel .refptr._ZN10Tablebases14MaxCardinalityE]; 02FF _ 4C: 8B. 35, 00000000(rel)
        lea     r8, [rel _ZN12_GLOBAL__N_19DrawValueE]  ; 0306 _ 4C: 8D. 05, 004000C0(rel)
        mov     qword [rel _ZN10Tablebases4HitsE], 0    ; 030D _ 48: C7. 05, 0000000C(rel), 00000000
        mov     byte [rel _ZN10Tablebases8RootInTBE], 0 ; 0318 _ C6. 05, 00000008(rel), 00
        imul    eax, dword [rdi+18H], 258               ; 031F _ 69. 47, 18, 00000102
        mov     r13d, dword [rdi+3CH]                   ; 0326 _ 44: 8B. 6F, 3C
        mov     r15d, dword [r14]                       ; 032A _ 45: 8B. 3E
        cdq                                             ; 032D _ 99
        movzx   r11d, byte [rdi+40H]                    ; 032E _ 44: 0F B6. 5F, 40
        idiv    ecx                                     ; 0333 _ F7. F9
        mov     r12d, dword [rdi+38H]                   ; 0335 _ 44: 8B. 67, 38
        mov     dword [rel _ZN10Tablebases11CardinalityE], r13d; 0339 _ 44: 89. 2D, 00000018(rel)
        mov     byte [rel _ZN10Tablebases9UseRule50E], r11b; 0340 _ 44: 88. 1D, 00000008(rel)
        mov     dword [rel _ZN10Tablebases10ProbeDepthE], r12d; 0347 _ 44: 89. 25, 00000004(rel)
        mov     r9d, eax                                ; 034E _ 41: 89. C1
        neg     r9d                                     ; 0351 _ 41: F7. D9
        cmp     r13d, r15d                              ; 0354 _ 45: 39. FD
        mov     dword [r8+rbp*4], r9d                   ; 0357 _ 45: 89. 0C A8
        mov     dword [r8+r10*4], eax                   ; 035B _ 43: 89. 04 90
        jle     ?_0009                                  ; 035F _ 7E, 11
        mov     dword [rel _ZN10Tablebases11CardinalityE], r15d; 0361 _ 44: 89. 3D, 00000018(rel)
        mov     dword [rel _ZN10Tablebases10ProbeDepthE], 0; 0368 _ C7. 05, 00000000(rel), 00000000
?_0009: mov     rsi, qword [rbx+4B8H]                   ; 0372 _ 48: 8B. B3, 000004B8
        cmp     qword [rbx+4C0H], rsi                   ; 0379 _ 48: 39. B3, 000004C0
        je      _ZN10MainThread6searchEv.cold.201       ; 0380 _ 0F 84, 0000000E(rel)
        mov     rax, qword [rbx+1F0H]                   ; 0386 _ 48: 8B. 83, 000001F0
        mov     rcx, rax                                ; 038D _ 48: 89. C1
        and     rax, qword [rbx+238H]                   ; 0390 _ 48: 23. 83, 00000238
        and     rcx, qword [rbx+230H]                   ; 0397 _ 48: 23. 8B, 00000230
        popcnt  r8, rax                                 ; 039E _ F3 4C: 0F B8. C0
        popcnt  rdx, rcx                                ; 03A3 _ F3 48: 0F B8. D1
        add     r8d, edx                                ; 03A8 _ 41: 01. D0
        cmp     r8d, dword [rel _ZN10Tablebases11CardinalityE]; 03AB _ 44: 3B. 05, 00000018(rel)
        jle     ?_0018                                  ; 03B2 _ 0F 8E, 000001CD
        mov     rsi, qword [rel .refptr.Threads]        ; 03B8 _ 48: 8B. 35, 00000000(rel)
        lea     r12, [rsp+40H]                          ; 03BF _ 4C: 8D. 64 24, 40
        lea     r8, [rbx+0F0H]                          ; 03C4 _ 4C: 8D. 83, 000000F0
        lea     rcx, [rbx+4B8H]                         ; 03CB _ 48: 8D. 8B, 000004B8
        mov     r15, qword [rsi+8H]                     ; 03D2 _ 4C: 8B. 7E, 08
        mov     r13, qword [rsi]                        ; 03D6 _ 4C: 8B. 2E
?_0010: cmp     r15, r13                                ; 03D9 _ 4D: 39. EF
        jne     ?_0014                                  ; 03DC _ 0F 85, 0000013D
        mov     rcx, rbx                                ; 03E2 _ 48: 89. D9
        call    _ZN6Thread6searchEv                     ; 03E5 _ E8, 000001A6
        cmp     dword [rel ?_0175], 0                   ; 03EA _ 83. 3D, 00000067(rel), 00
        jne     .text.unlikely+252H                     ; 03F1 _ 0F 85, 00000252(rel)
        movzx   eax, byte [rel _ZN6Search7SignalsE]     ; 03F7 _ 0F B6. 05, 00000098(rel)
        test    al, al                                  ; 03FE _ 84. C0
        jnz     ?_0011                                  ; 0400 _ 75, 1A
        cmp     dword [rel ?_0181], 0                   ; 0402 _ 83. 3D, 0000007F(rel), 00
        jne     .text.unlikely+237H                     ; 0409 _ 0F 85, 00000237(rel)
        cmp     dword [rel ?_0180], 0                   ; 040F _ 83. 3D, 0000007B(rel), 00
        jne     .text.unlikely+237H                     ; 0416 _ 0F 85, 00000237(rel)
?_0011: mov     r14, qword [rsi+8H]                     ; 041C _ 4C: 8B. 76, 08
        mov     byte [rel _ZN6Search7SignalsE], 1       ; 0420 _ C6. 05, 00000097(rel), 01
        mov     r15, qword [rsi]                        ; 0427 _ 4C: 8B. 3E
?_0012: cmp     r14, r15                                ; 042A _ 4D: 39. FE
        jne     ?_0016                                  ; 042D _ 0F 85, 00000138
        cmp     byte [rbx+24D9H], 0                     ; 0433 _ 80. BB, 000024D9, 00
        jne     .text.unlikely+21EH                     ; 043A _ 0F 85, 0000021E(rel)
        cmp     qword [rdi+10H], 1                      ; 0440 _ 48: 83. 7F, 10, 01
        jne     .text.unlikely+21EH                     ; 0445 _ 0F 85, 0000021E(rel)
        cmp     dword [rdi+1CH], 19                     ; 044B _ 83. 7F, 1C, 13
        jle     ?_0017                                  ; 044F _ 0F 8E, 0000012B
        mov     rdx, qword [rsi+8H]                     ; 0455 _ 48: 8B. 56, 08
        mov     r10, qword [rsi]                        ; 0459 _ 4C: 8B. 16
        mov     rsi, rbx                                ; 045C _ 48: 89. DE
?_0013: cmp     rdx, r10                                ; 045F _ 4C: 39. D2
        jne     ?_0015                                  ; 0462 _ 0F 85, 000000E3
        mov     r9, qword [rsi+4B8H]                    ; 0468 _ 4C: 8B. 8E, 000004B8
        cmp     rbx, rsi                                ; 046F _ 48: 39. F3
        mov     r11d, dword [r9]                        ; 0472 _ 45: 8B. 19
        mov     dword [rbx+24E8H], r11d                 ; 0475 _ 44: 89. 9B, 000024E8
        jne     .text.unlikely+1E6H                     ; 047C _ 0F 85, 000001E6(rel)
        lea     rdx, [rel ?_0329]                       ; 0482 _ 48: 8D. 15, 00000014(rel)
        mov     rcx, r12                                ; 0489 _ 4C: 89. E1
        call    _Z12print_stringPcPKc                   ; 048C _ E8, 00000000(rel)
        mov     r13, qword [rsi+4B8H]                   ; 0491 _ 4C: 8B. AE, 000004B8
        movzx   r8d, byte [rbx+4B0H]                    ; 0498 _ 44: 0F B6. 83, 000004B0
        mov     rcx, rax                                ; 04A0 _ 48: 89. C1
        mov     r15, qword [r13+8H]                     ; 04A3 _ 4D: 8B. 7D, 08
        mov     edx, dword [r15]                        ; 04A7 _ 41: 8B. 17
        call    _ZN3UCI10print_moveEPc4Moveb            ; 04AA _ E8, 00000000(rel)
        mov     rcx, qword [rsi+4B8H]                   ; 04AF _ 48: 8B. 8E, 000004B8
        mov     rdi, rax                                ; 04B6 _ 48: 89. C7
        mov     r14, qword [rcx+10H]                    ; 04B9 _ 4C: 8B. 71, 10
        sub     r14, qword [rcx+8H]                     ; 04BD _ 4C: 2B. 71, 08
        cmp     r14, 7                                  ; 04C1 _ 49: 83. FE, 07
        jbe     .text.unlikely+1CDH                     ; 04C5 _ 0F 86, 000001CD(rel)
        lea     rdx, [rel ?_0330]                       ; 04CB _ 48: 8D. 15, 0000001E(rel)
        mov     rcx, rdi                                ; 04D2 _ 48: 89. F9
        call    _Z12print_stringPcPKc                   ; 04D5 _ E8, 00000000(rel)
        mov     rbp, qword [rsi+4B8H]                   ; 04DA _ 48: 8B. AE, 000004B8
        movzx   r8d, byte [rbx+4B0H]                    ; 04E1 _ 44: 0F B6. 83, 000004B0
        mov     rcx, qword [rbp+8H]                     ; 04E9 _ 48: 8B. 4D, 08
        mov     edx, dword [rcx+4H]                     ; 04ED _ 8B. 51, 04
        mov     rcx, rax                                ; 04F0 _ 48: 89. C1
        call    _ZN3UCI10print_moveEPc4Moveb            ; 04F3 _ E8, 00000000(rel)
        mov     rdi, rax                                ; 04F8 _ 48: 89. C7
        mov     byte [rdi], 10                          ; 04FB _ C6. 07, 0A
        lea     rdx, [rdi+1H]                           ; 04FE _ 48: 8D. 57, 01
        mov     rcx, r12                                ; 0502 _ 4C: 89. E1
        call    _Z9write_outPcS_                        ; 0505 _ E8, 00000000(rel)
        nop                                             ; 050A _ 90
        add     rsp, 1048                               ; 050B _ 48: 81. C4, 00000418
        pop     rbx                                     ; 0512 _ 5B
        pop     rsi                                     ; 0513 _ 5E
        pop     rdi                                     ; 0514 _ 5F
        pop     rbp                                     ; 0515 _ 5D
        pop     r12                                     ; 0516 _ 41: 5C
        pop     r13                                     ; 0518 _ 41: 5D
        pop     r14                                     ; 051A _ 41: 5E
        pop     r15                                     ; 051C _ 41: 5F
        ret                                             ; 051E _ C3

?_0014: mov     r14, qword [r13]                        ; 051F _ 4D: 8B. 75, 00
        mov     dword [r14+0E8H], 0                     ; 0523 _ 41: C7. 86, 000000E8, 00000000
        cmp     rbx, r14                                ; 052E _ 4C: 39. F3
        mov     dword [r14+4D0H], 0                     ; 0531 _ 41: C7. 86, 000004D0, 00000000
        jne     .text.unlikely+174H                     ; 053C _ 0F 85, 00000174(rel)
        add     r13, 8                                  ; 0542 _ 49: 83. C5, 08
        jmp     ?_0010                                  ; 0546 _ E9, FFFFFE8E

?_0015: mov     rax, qword [r10]                        ; 054B _ 49: 8B. 02
        mov     r8d, dword [rsi+24D4H]                  ; 054E _ 44: 8B. 86, 000024D4
        cmp     dword [rax+24D4H], r8d                  ; 0555 _ 44: 39. 80, 000024D4
        jg      .text.unlikely+157H                     ; 055C _ 0F 8F, 00000157(rel)
        add     r10, 8                                  ; 0562 _ 49: 83. C2, 08
        jmp     ?_0013                                  ; 0566 _ E9, FFFFFEF4

?_0016: mov     rcx, qword [r15]                        ; 056B _ 49: 8B. 0F
        cmp     rbx, rcx                                ; 056E _ 48: 39. CB
        jne     .text.unlikely+14DH                     ; 0571 _ 0F 85, 0000014D(rel)
        add     r15, 8                                  ; 0577 _ 49: 83. C7, 08
        jmp     ?_0012                                  ; 057B _ E9, FFFFFEAA

?_0017: jmp     .text.unlikely+21EH                     ; 0580 _ E9, 0000021E(rel)
; _ZN10MainThread6searchEv End of function

?_0018: ; Local function
        jmp     .text.unlikely+27CH                     ; 0585 _ E9, 0000027C(rel)

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZN6Thread6searchEv:; Function begin
        push    r15                                     ; 0590 _ 41: 57
        mov     eax, 6216                               ; 0592 _ B8, 00001848
        push    r14                                     ; 0597 _ 41: 56
        push    r13                                     ; 0599 _ 41: 55
        push    r12                                     ; 059B _ 41: 54
        push    rbp                                     ; 059D _ 55
        push    rdi                                     ; 059E _ 57
        push    rsi                                     ; 059F _ 56
        push    rbx                                     ; 05A0 _ 53
        call    ___chkstk_ms                            ; 05A1 _ E8, 00000000(rel)
        sub     rsp, rax                                ; 05A6 _ 48: 29. C4
        movaps  oword [rsp+1820H], xmm6                 ; 05A9 _ 0F 29. B4 24, 00001820
        movaps  oword [rsp+1830H], xmm7                 ; 05B1 _ 0F 29. BC 24, 00001830
        lea     rdi, [rsp+380H]                         ; 05B9 _ 48: 8D. BC 24, 00000380
        mov     r12, rcx                                ; 05C1 _ 49: 89. CC
        mov     rcx, qword [rel .refptr.Threads]        ; 05C4 _ 48: 8B. 0D, 00000000(rel)
        call    _ZN10ThreadPool4mainEv                  ; 05CB _ E8, 00000000(rel)
        mov     qword [rsp+48H], rdi                    ; 05D0 _ 48: 89. 7C 24, 48
        cmp     rax, r12                                ; 05D5 _ 4C: 39. E0
        mov     r15, rax                                ; 05D8 _ 49: 89. C7
        jne     _ZN6Thread6searchEv.cold.202            ; 05DB _ 0F 85, 00000416(rel)
        mov     rdx, qword [r15+4A8H]                   ; 05E1 _ 49: 8B. 97, 000004A8
        xor     eax, eax                                ; 05E8 _ 31. C0
        mov     ecx, 50                                 ; 05EA _ B9, 00000032
        mov     dword [r15+24D4H], 0                    ; 05EF _ 41: C7. 87, 000024D4, 00000000
        rep stosd                                       ; 05FA _ F3: AB
        mov     rbx, qword [rel .refptr.TT]             ; 05FC _ 48: 8B. 1D, 00000000(rel)
        mov     dword [rel _ZN12_GLOBAL__N_18EasyMoveE], 0; 0603 _ C7. 05, 004000DC(rel), 00000000
        mov     dword [rel ?_0187], 0                   ; 060D _ C7. 05, 004000F0(rel), 00000000
        mov     dword [rel ?_0186], 0                   ; 0617 _ C7. 05, 004000EC(rel), 00000000
        mov     rsi, qword [rdx+30H]                    ; 0621 _ 48: 8B. 72, 30
        mov     byte [r15+24DAH], 0                     ; 0625 _ 41: C6. 87, 000024DA, 00
        cmp     qword [rel ?_0184], rsi                 ; 062D _ 48: 39. 35, 004000E8(rel)
        mov     byte [r15+24D9H], 0                     ; 0634 _ 41: C6. 87, 000024D9, 00
        cmove   eax, dword [rel ?_0188]                 ; 063C _ 0F 44. 05, 004000F8(rel)
        mov     qword [rel ?_0184], 0                   ; 0643 _ 48: C7. 05, 004000E4(rel), 00000000
        add     byte [rbx+18H], 4                       ; 064E _ 80. 43, 18, 04
        mov     dword [rel ?_0188], 0                   ; 0652 _ C7. 05, 004000F4(rel), 00000000
        mov     dword [rsp+54H], eax                    ; 065C _ 89. 44 24, 54
        mov     qword [r15+24E0H], 0                    ; 0660 _ 49: C7. 87, 000024E0, 00000000
        mov     rbp, qword [rel .refptr.Opt]            ; 066B _ 48: 8B. 2D, 00000000(rel)
        mov     dword [rsp+74H], 0                      ; 0672 _ C7. 44 24, 74, 00000000
        mov     r9d, dword [rbp+1CH]                    ; 067A _ 44: 8B. 4D, 1C
        mov     r8, qword [rbp+10H]                     ; 067E _ 4C: 8B. 45, 10
        cmp     r9d, 19                                 ; 0682 _ 41: 83. F9, 13
        mov     dword [rsp+70H], r9d                    ; 0686 _ 44: 89. 4C 24, 70
        jle     .text.unlikely+8BCH                     ; 068B _ 0F 8E, 000008BC(rel)
        mov     r11, qword [r12+4C0H]                   ; 0691 _ 4D: 8B. 9C 24, 000004C0
        mov     r13d, 32001                             ; 0699 _ 41: BD, 00007D01
        mov     qword [rsp+1890H], r12                  ; 069F _ 4C: 89. A4 24, 00001890
        mov     r14d, 4294935295                        ; 06A7 _ 41: BE, FFFF82FF
        sub     r11, qword [r12+4B8H]                   ; 06AD _ 4D: 2B. 9C 24, 000004B8
        mov     dword [rsp+50H], r14d                   ; 06B5 _ 44: 89. 74 24, 50
        mov     ebx, r14d                               ; 06BA _ 44: 89. F3
        mov     ecx, dword [r12+4D0H]                   ; 06BD _ 41: 8B. 8C 24, 000004D0
        mov     r12d, r13d                              ; 06C5 _ 45: 89. EC
        mov     r13, qword [rsp+1890H]                  ; 06C8 _ 4C: 8B. AC 24, 00001890
        lea     rdi, [rsp+0E0H]                         ; 06D0 _ 48: 8D. BC 24, 000000E0
        lea     rax, [rsp+130H]                         ; 06D8 _ 48: 8D. 84 24, 00000130
        mov     qword [rsp+60H], rdi                    ; 06E0 _ 48: 89. 7C 24, 60
        movsd   xmm6, qword [rel ?_0362]                ; 06E5 _ F2: 0F 10. 35, 00000390(rel)
        sar     r11, 5                                  ; 06ED _ 49: C1. FB, 05
        mov     qword [rsp+68H], rax                    ; 06F1 _ 48: 89. 44 24, 68
        cmp     r8, r11                                 ; 06F6 _ 4D: 39. D8
        cmovbe  r11, r8                                 ; 06F9 _ 4D: 0F 46. D8
        mov     qword [rsp+30H], r11                    ; 06FD _ 4C: 89. 5C 24, 30
        mov     qword [rsp+1890H], r13                  ; 0702 _ 4C: 89. AC 24, 00001890
        lea     rdx, [rsp+180H]                         ; 070A _ 48: 8D. 94 24, 00000180
        mov     r13d, r12d                              ; 0712 _ 45: 89. E5
        mov     r12, qword [rsp+1890H]                  ; 0715 _ 4C: 8B. A4 24, 00001890
        lea     rsi, [rsp+70H]                          ; 071D _ 48: 8D. 74 24, 70
        mov     qword [rsp+40H], rdx                    ; 0722 _ 48: 89. 54 24, 40
        mov     qword [rsp+58H], rsi                    ; 0727 _ 48: 89. 74 24, 58
?_0019: lea     ebp, [rcx+1H]                           ; 072C _ 8D. 69, 01
        cmp     ebp, 127                                ; 072F _ 83. FD, 7F
        mov     ecx, ebp                                ; 0732 _ 89. E9
        mov     dword [r12+4D0H], ebp                   ; 0734 _ 41: 89. AC 24, 000004D0
        jg      ?_0036                                  ; 073C _ 0F 8F, 0000034A
        movzx   r8d, byte [rel _ZN6Search7SignalsE]     ; 0742 _ 44: 0F B6. 05, 00000098(rel)
        test    r8b, r8b                                ; 074A _ 45: 84. C0
        jne     ?_0036                                  ; 074D _ 0F 85, 00000339
        mov     r9d, dword [rel ?_0177]                 ; 0753 _ 44: 8B. 0D, 00000070(rel)
        cmp     r9d, ebp                                ; 075A _ 41: 39. E9
        jge     ?_0020                                  ; 075D _ 7D, 09
        test    r9d, r9d                                ; 075F _ 45: 85. C9
        jne     ?_0036                                  ; 0762 _ 0F 85, 00000324
?_0020: test    r15, r15                                ; 0768 _ 4D: 85. FF
        je      ?_0041                                  ; 076B _ 0F 84, 0000039E
        movsd   xmm0, qword [r15+24E0H]                 ; 0771 _ F2 41: 0F 10. 87, 000024E0
        mov     byte [r15+24DAH], 0                     ; 077A _ 41: C6. 87, 000024DA, 00
        mulsd   xmm0, xmm6                              ; 0782 _ F2: 0F 59. C6
        movsd   qword [r15+24E0H], xmm0                 ; 0786 _ F2 41: 0F 11. 87, 000024E0
        mov     r10, qword [r12+4C0H]                   ; 078F _ 4D: 8B. 94 24, 000004C0
        mov     rsi, qword [r12+4B8H]                   ; 0797 _ 49: 8B. B4 24, 000004B8
        jmp     ?_0022                                  ; 079F _ EB, 09

?_0021: mov     edx, dword [rsi]                        ; 07A1 _ 8B. 16
        add     rsi, 32                                 ; 07A3 _ 48: 83. C6, 20
        mov     dword [rsi-1CH], edx                    ; 07A7 _ 89. 56, E4
?_0022: cmp     r10, rsi                                ; 07AA _ 49: 39. F2
        jnz     ?_0021                                  ; 07AD _ 75, F2
        mov     rcx, qword [rsp+48H]                    ; 07AF _ 48: 8B. 4C 24, 48
        lea     rbp, [r12+0F0H]                         ; 07B4 _ 49: 8D. AC 24, 000000F0
        mov     qword [r12+0E0H], 0                     ; 07BC _ 49: C7. 84 24, 000000E0, 00000000
        add     rcx, 80                                 ; 07C8 _ 48: 83. C1, 50
        mov     qword [rsp+38H], rcx                    ; 07CC _ 48: 89. 4C 24, 38
?_0023: mov     r8, qword [r12+0E0H]                    ; 07D1 _ 4D: 8B. 84 24, 000000E0
        cmp     r8, qword [rsp+30H]                     ; 07D9 _ 4C: 3B. 44 24, 30
        jc      ?_0027                                  ; 07DE _ 0F 82, 0000008D
?_0024: movzx   r10d, byte [rel _ZN6Search7SignalsE]    ; 07E4 _ 44: 0F B6. 15, 00000098(rel)
        test    r10b, r10b                              ; 07EC _ 45: 84. D2
        jnz     ?_0025                                  ; 07EF _ 75, 10
        mov     ebp, dword [r12+4D0H]                   ; 07F1 _ 41: 8B. AC 24, 000004D0
        mov     dword [r12+24D4H], ebp                  ; 07F9 _ 41: 89. AC 24, 000024D4
?_0025: test    r15, r15                                ; 0801 _ 4D: 85. FF
        je      .text.unlikely+882H                     ; 0804 _ 0F 84, 00000882(rel)
        mov     r11d, dword [rsp+70H]                   ; 080A _ 44: 8B. 5C 24, 70
        cmp     r11d, 19                                ; 080F _ 41: 83. FB, 13
        jle     ?_0040                                  ; 0813 _ 0F 8E, 000002F1
        cmp     ebx, 31743                              ; 0819 _ 81. FB, 00007BFF
        mov     eax, dword [rel ?_0179]                 ; 081F _ 8B. 05, 00000078(rel)
        jle     ?_0026                                  ; 0825 _ 7E, 18
        test    eax, eax                                ; 0827 _ 85. C0
        jz      ?_0026                                  ; 0829 _ 74, 14
        lea     r8d, [rax+rax]                          ; 082B _ 44: 8D. 04 00
        mov     edx, 32000                              ; 082F _ BA, 00007D00
        sub     edx, ebx                                ; 0834 _ 29. DA
        cmp     r8d, edx                                ; 0836 _ 41: 39. D0
        jge     .text.unlikely+876H                     ; 0839 _ 0F 8D, 00000876(rel)
?_0026: or      eax, dword [rel ?_0178]                 ; 083F _ 0B. 05, 00000074(rel)
        or      eax, dword [rel ?_0177]                 ; 0845 _ 0B. 05, 00000070(rel)
        movsxd  r9, dword [rel ?_0180]                  ; 084B _ 4C: 63. 0D, 0000007C(rel)
        or      r9, qword [rel ?_0182]                  ; 0852 _ 4C: 0B. 0D, 00000088(rel)
        cdqe                                            ; 0859 _ 48: 98
        or      r9, rax                                 ; 085B _ 49: 09. C1
        je      .text.unlikely+49EH                     ; 085E _ 0F 84, 0000049E(rel)
        mov     ecx, dword [r12+4D0H]                   ; 0864 _ 41: 8B. 8C 24, 000004D0
        jmp     ?_0019                                  ; 086C _ E9, FFFFFEBB

?_0027: movzx   r9d, byte [rel _ZN6Search7SignalsE]     ; 0871 _ 44: 0F B6. 0D, 00000098(rel)
        test    r9b, r9b                                ; 0879 _ 45: 84. C9
        jne     ?_0024                                  ; 087C _ 0F 85, FFFFFF62
        cmp     dword [r12+4D0H], 4                     ; 0882 _ 41: 83. BC 24, 000004D0, 04
        jle     ?_0028                                  ; 088B _ 7E, 44
        shl     r8, 5                                   ; 088D _ 49: C1. E0, 05
        add     r8, qword [r12+4B8H]                    ; 0891 _ 4D: 03. 84 24, 000004B8
        mov     r13d, 4294935295                        ; 0899 _ 41: BD, FFFF82FF
        mov     r14d, dword [r8+4H]                     ; 089F _ 45: 8B. 70, 04
        lea     ebx, [r14-12H]                          ; 08A3 _ 41: 8D. 5E, EE
        lea     r11d, [r14+12H]                         ; 08A7 _ 45: 8D. 5E, 12
        cmp     ebx, -32001                             ; 08AB _ 81. FB, FFFF82FF
        mov     r14d, 18                                ; 08B1 _ 41: BE, 00000012
        cmovge  r13d, ebx                               ; 08B7 _ 44: 0F 4D. EB
        cmp     r11d, 32001                             ; 08BB _ 41: 81. FB, 00007D01
        mov     dword [rsp+50H], r13d                   ; 08C2 _ 44: 89. 6C 24, 50
        mov     r13d, 32001                             ; 08C7 _ 41: BD, 00007D01
        cmovle  r13d, r11d                              ; 08CD _ 45: 0F 4E. EB
?_0028: mov     edi, dword [rsp+50H]                    ; 08D1 _ 8B. 7C 24, 50
        mov     esi, r13d                               ; 08D5 _ 44: 89. EE
?_0029: mov     rdx, qword [rsp+38H]                    ; 08D8 _ 48: 8B. 54 24, 38
        mov     r9d, esi                                ; 08DD _ 41: 89. F1
        mov     r8d, edi                                ; 08E0 _ 41: 89. F8
        mov     rcx, rbp                                ; 08E3 _ 48: 89. E9
        mov     dword [rsp+28H], 0                      ; 08E6 _ C7. 44 24, 28, 00000000
        mov     eax, dword [r12+4D0H]                   ; 08EE _ 41: 8B. 84 24, 000004D0
        xor     r13d, r13d                              ; 08F6 _ 45: 31. ED
        mov     dword [rsp+20H], eax                    ; 08F9 _ 89. 44 24, 20
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 08FD _ E8, 00000000(rel)
        mov     rdx, qword [r12+4C0H]                   ; 0902 _ 49: 8B. 94 24, 000004C0
        mov     ecx, 5                                  ; 090A _ B9, 00000005
        shlx    rcx, qword [r12+0E0H], rcx              ; 090F _ C4 C2 F1: F7. 8C 24, 000000E0
        add     rcx, qword [r12+4B8H]                   ; 0919 _ 49: 03. 8C 24, 000004B8
        mov     ebx, eax                                ; 0921 _ 89. C3
        call    _ZSt13__stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_.isra.177; 0923 _ E8, 000008E8
?_0030: mov     rcx, r13                                ; 0928 _ 4C: 89. E9
        mov     rdx, rbp                                ; 092B _ 48: 89. EA
        add     r13, 1                                  ; 092E _ 49: 83. C5, 01
        shl     rcx, 5                                  ; 0932 _ 48: C1. E1, 05
        add     rcx, qword [r12+4B8H]                   ; 0936 _ 49: 03. 8C 24, 000004B8
        call    _ZN6Search8RootMove15insert_pv_in_ttER8Position; 093E _ E8, 00000FED
        cmp     qword [r12+0E0H], r13                   ; 0943 _ 4D: 39. AC 24, 000000E0
        jnc     ?_0030                                  ; 094B _ 73, DB
        movzx   edx, byte [rel _ZN6Search7SignalsE]     ; 094D _ 0F B6. 15, 00000098(rel)
        test    dl, dl                                  ; 0954 _ 84. D2
        jne     .text.unlikely+86AH                     ; 0956 _ 0F 85, 0000086A(rel)
        test    r15, r15                                ; 095C _ 4D: 85. FF
        je      .text.unlikely+7E4H                     ; 095F _ 0F 84, 000007E4(rel)
        cmp     qword [rsp+30H], 1                      ; 0965 _ 48: 83. 7C 24, 30, 01
        jnz     ?_0032                                  ; 096B _ 75, 18
        cmp     ebx, esi                                ; 096D _ 39. F3
        jge     ?_0031                                  ; 096F _ 7D, 04
        cmp     ebx, edi                                ; 0971 _ 39. FB
        jg      ?_0033                                  ; 0973 _ 7F, 45
?_0031: call    _ZNK14TimeManagement7elapsedEv.isra.20.constprop.199; 0975 _ E8, 00001386
        cmp     eax, 3000                               ; 097A _ 3D, 00000BB8
        jg      ?_0039                                  ; 097F _ 0F 8F, 00000180
?_0032: cmp     edi, ebx                                ; 0985 _ 39. DF
        jl      ?_0033                                  ; 0987 _ 7C, 31
        lea     eax, [rdi+rsi]                          ; 0989 _ 8D. 04 37
        mov     r8d, 2                                  ; 098C _ 41: B8, 00000002
        sub     ebx, r14d                               ; 0992 _ 44: 29. F3
        cdq                                             ; 0995 _ 99
        mov     edi, 4294935295                         ; 0996 _ BF, FFFF82FF
        idiv    r8d                                     ; 099B _ 41: F7. F8
        cmp     ebx, -32001                             ; 099E _ 81. FB, FFFF82FF
        cmovge  edi, ebx                                ; 09A4 _ 0F 4D. FB
        mov     esi, eax                                ; 09A7 _ 89. C6
        mov     byte [r15+24DAH], 1                     ; 09A9 _ 41: C6. 87, 000024DA, 01
        mov     byte [rel ?_0183], 0                    ; 09B1 _ C6. 05, 00000098(rel), 00
        jmp     ?_0034                                  ; 09B8 _ EB, 29

?_0033: cmp     esi, ebx                                ; 09BA _ 39. DE
        jg      ?_0035                                  ; 09BC _ 7F, 3A
        lea     eax, [rdi+rsi]                          ; 09BE _ 8D. 04 37
        mov     r9d, 2                                  ; 09C1 _ 41: B9, 00000002
        add     ebx, r14d                               ; 09C7 _ 44: 01. F3
        cdq                                             ; 09CA _ 99
        mov     r10d, 32001                             ; 09CB _ 41: BA, 00007D01
        idiv    r9d                                     ; 09D1 _ 41: F7. F9
        cmp     ebx, 32001                              ; 09D4 _ 81. FB, 00007D01
        cmovle  r10d, ebx                               ; 09DA _ 44: 0F 4E. D3
        mov     esi, r10d                               ; 09DE _ 44: 89. D6
        mov     edi, eax                                ; 09E1 _ 89. C7
?_0034: mov     eax, r14d                               ; 09E3 _ 44: 89. F0
        mov     ebx, 4                                  ; 09E6 _ BB, 00000004
        cdq                                             ; 09EB _ 99
        idiv    ebx                                     ; 09EC _ F7. FB
        lea     r14d, [r14+rax+5H]                      ; 09EE _ 45: 8D. 74 06, 05
        jmp     ?_0029                                  ; 09F3 _ E9, FFFFFEE0

?_0035: mov     r13d, esi                               ; 09F8 _ 41: 89. F5
        mov     dword [rsp+50H], edi                    ; 09FB _ 89. 7C 24, 50
        mov     rcx, qword [r12+4B8H]                   ; 09FF _ 49: 8B. 8C 24, 000004B8
        mov     r8d, 5                                  ; 0A07 _ 41: B8, 00000005
        shlx    r9, qword [r12+0E0H], r8                ; 0A0D _ C4 42 B9: F7. 8C 24, 000000E0
        lea     rdx, [rcx+r9+20H]                       ; 0A17 _ 4A: 8D. 54 09, 20
        call    _ZSt13__stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_.isra.177; 0A1C _ E8, 000007EF
        test    r15, r15                                ; 0A21 _ 4D: 85. FF
        movzx   ecx, byte [rel _ZN6Search7SignalsE]     ; 0A24 _ 0F B6. 0D, 00000098(rel)
        je      .text.unlikely+6C0H                     ; 0A2B _ 0F 84, 000006C0(rel)
        test    cl, cl                                  ; 0A31 _ 84. C9
        jne     .text.unlikely+65DH                     ; 0A33 _ 0F 85, 0000065D(rel)
        mov     r10, qword [r12+0E0H]                   ; 0A39 _ 4D: 8B. 94 24, 000000E0
        add     r10, 1                                  ; 0A41 _ 49: 83. C2, 01
        cmp     r10, qword [rsp+30H]                    ; 0A45 _ 4C: 3B. 54 24, 30
        jne     ?_0038                                  ; 0A4A _ 0F 85, 000000B0
        mov     dword [rsp+20H], esi                    ; 0A50 _ 89. 74 24, 20
        mov     rsi, qword [rsp+40H]                    ; 0A54 _ 48: 8B. 74 24, 40
        mov     rdx, rbp                                ; 0A59 _ 48: 89. EA
        mov     r9d, edi                                ; 0A5C _ 41: 89. F9
        mov     r8d, dword [r12+4D0H]                   ; 0A5F _ 45: 8B. 84 24, 000004D0
        mov     rcx, rsi                                ; 0A67 _ 48: 89. F1
        call    _ZN3UCI8print_pvEPcRK8Position5Depth5ValueS5_; 0A6A _ E8, 00001001
        mov     rcx, rsi                                ; 0A6F _ 48: 89. F1
        mov     byte [rax], 10                          ; 0A72 _ C6. 00, 0A
        lea     rdx, [rax+1H]                           ; 0A75 _ 48: 8D. 50, 01
        call    _Z9write_outPcS_                        ; 0A79 _ E8, 00000000(rel)
        add     qword [r12+0E0H], 1                     ; 0A7E _ 49: 83. 84 24, 000000E0, 01
        jmp     ?_0023                                  ; 0A87 _ E9, FFFFFD45

?_0036: test    r15, r15                                ; 0A8C _ 4D: 85. FF
        jz      ?_0037                                  ; 0A8F _ 74, 4B
        cmp     dword [rel _ZN12_GLOBAL__N_18EasyMoveE], 5; 0A91 _ 83. 3D, 004000DF(rel), 05
        jg      .text.unlikely+48BH                     ; 0A98 _ 0F 8F, 0000048B(rel)
        mov     dword [rel _ZN12_GLOBAL__N_18EasyMoveE], 0; 0A9E _ C7. 05, 004000DC(rel), 00000000
        mov     qword [rel ?_0184], 0                   ; 0AA8 _ 48: C7. 05, 004000E4(rel), 00000000
        mov     dword [rel ?_0188], 0                   ; 0AB3 _ C7. 05, 004000F4(rel), 00000000
        mov     dword [rel ?_0187], 0                   ; 0ABD _ C7. 05, 004000F0(rel), 00000000
        mov     dword [rel ?_0186], 0                   ; 0AC7 _ C7. 05, 004000EC(rel), 00000000
        cmp     dword [rsp+70H], 19                     ; 0AD1 _ 83. 7C 24, 70, 13
        jle     .text.unlikely+43BH                     ; 0AD6 _ 0F 8E, 0000043B(rel)
?_0037: movaps  xmm6, oword [rsp+1820H]                 ; 0ADC _ 0F 28. B4 24, 00001820
        movaps  xmm7, oword [rsp+1830H]                 ; 0AE4 _ 0F 28. BC 24, 00001830
        add     rsp, 6216                               ; 0AEC _ 48: 81. C4, 00001848
        pop     rbx                                     ; 0AF3 _ 5B
        pop     rsi                                     ; 0AF4 _ 5E
        pop     rdi                                     ; 0AF5 _ 5F
        pop     rbp                                     ; 0AF6 _ 5D
        pop     r12                                     ; 0AF7 _ 41: 5C
        pop     r13                                     ; 0AF9 _ 41: 5D
        pop     r14                                     ; 0AFB _ 41: 5E
        pop     r15                                     ; 0AFD _ 41: 5F
        ret                                             ; 0AFF _ C3

?_0038: jmp     .text.unlikely+70EH                     ; 0B00 _ E9, 0000070E(rel)

?_0039: jmp     .text.unlikely+80FH                     ; 0B05 _ E9, 0000080F(rel)

?_0040: jmp     .text.unlikely+896H                     ; 0B0A _ E9, 00000896(rel)
; _ZN6Thread6searchEv End of function

?_0041: ; Local function
        jmp     .text.unlikely+8CFH                     ; 0B0F _ E9, 000008CF(rel)

; Filling space: 0CH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H
;       db 00H, 00H, 00H, 00H

ALIGN   16

_ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth:; Local function
        push    r15                                     ; 0B20 _ 41: 57
        push    r14                                     ; 0B22 _ 41: 56
        push    r13                                     ; 0B24 _ 41: 55
        push    r12                                     ; 0B26 _ 41: 54
        push    rbp                                     ; 0B28 _ 55
        push    rdi                                     ; 0B29 _ 57
        push    rsi                                     ; 0B2A _ 56
        push    rbx                                     ; 0B2B _ 53
        sub     rsp, 3016                               ; 0B2C _ 48: 81. EC, 00000BC8
        mov     r12d, dword [rsp+0C30H]                 ; 0B33 _ 44: 8B. A4 24, 00000C30
        mov     r14, rdx                                ; 0B3B _ 49: 89. D6
        mov     rsi, rcx                                ; 0B3E _ 48: 89. CE
        mov     dword [rsp+0C20H], r8d                  ; 0B41 _ 44: 89. 84 24, 00000C20
        lea     rax, [rsp+130H]                         ; 0B49 _ 48: 8D. 84 24, 00000130
        mov     ecx, dword [r14-20H]                    ; 0B51 _ 41: 8B. 4E, E0
        mov     dword [rsp+0C28H], r9d                  ; 0B55 _ 44: 89. 8C 24, 00000C28
        mov     qword [rdx+28H], rax                    ; 0B5D _ 48: 89. 42, 28
        mov     rdx, qword [rdx]                        ; 0B61 _ 48: 8B. 12
        add     ecx, 1                                  ; 0B64 _ 83. C1, 01
        mov     dword [rdx], 0                          ; 0B67 _ C7. 02, 00000000
        mov     dword [r14+8H], ecx                     ; 0B6D _ 41: 89. 4E, 08
        mov     rcx, rsi                                ; 0B71 _ 48: 89. F1
        mov     dword [r14+0CH], 0                      ; 0B74 _ 41: C7. 46, 0C, 00000000
        call    _ZNK8Position7is_drawEv                 ; 0B7C _ E8, 00000000(rel)
        test    al, al                                  ; 0B81 _ 84. C0
        jne     ?_0078                                  ; 0B83 _ 0F 85, 00000627
        cmp     dword [r14+8H], 127                     ; 0B89 _ 41: 83. 7E, 08, 7F
        jg      .text.unlikely+0C91H                    ; 0B8E _ 0F 8F, 00000C91(rel)
        mov     rbx, qword [rsi+3B8H]                   ; 0B94 _ 48: 8B. 9E, 000003B8
        lea     r8, [rsp+7FH]                           ; 0B9B _ 4C: 8D. 44 24, 7F
        mov     rcx, qword [rel .refptr.TT]             ; 0BA0 _ 48: 8B. 0D, 00000000(rel)
        mov     rdi, qword [rbx+30H]                    ; 0BA7 _ 48: 8B. 7B, 30
        mov     rdx, rdi                                ; 0BAB _ 48: 89. FA
        mov     qword [rsp+38H], rdi                    ; 0BAE _ 48: 89. 7C 24, 38
        call    _ZNK18TranspositionTable5probeEyRb      ; 0BB3 _ E8, 00000000(rel)
        cmp     byte [rsp+7FH], 0                       ; 0BB8 _ 80. 7C 24, 7F, 00
        mov     rdi, rax                                ; 0BBD _ 48: 89. C7
        je      ?_0062                                  ; 0BC0 _ 0F 84, 00000468
        movsx   ebp, word [rdi+4H]                      ; 0BC6 _ 0F BF. 6F, 04
        movzx   r8d, word [rdi+2H]                      ; 0BCA _ 44: 0F B7. 47, 02
        mov     r9d, dword [r14+8H]                     ; 0BCF _ 45: 8B. 4E, 08
        cmp     ebp, 32002                              ; 0BD3 _ 81. FD, 00007D02
        je      ?_0077                                  ; 0BD9 _ 0F 84, 000005B8
        cmp     ebp, 31743                              ; 0BDF _ 81. FD, 00007BFF
        jg      ?_0079                                  ; 0BE5 _ 0F 8F, 000005E1
        cmp     ebp, -31743                             ; 0BEB _ 81. FD, FFFF8401
        jl      .text.unlikely+0C80H                    ; 0BF1 _ 0F 8C, 00000C80(rel)
        movsx   ebx, word [rdi+6H]                      ; 0BF7 _ 0F BF. 5F, 06
        cmp     ebx, 32002                              ; 0BFB _ 81. FB, 00007D02
        mov     dword [r14+1CH], ebx                    ; 0C01 _ 41: 89. 5E, 1C
        je      ?_0081                                  ; 0C05 _ 0F 84, 000005ED
?_0042: movzx   r10d, byte [rdi+8H]                     ; 0C0B _ 44: 0F B6. 57, 08
        xor     r11d, r11d                              ; 0C10 _ 45: 31. DB
        cmp     ebp, ebx                                ; 0C13 _ 39. DD
        setg    r11b                                    ; 0C15 _ 41: 0F 9F. C3
        add     r11d, 1                                 ; 0C19 _ 41: 83. C3, 01
        test    r11d, r10d                              ; 0C1D _ 45: 85. D3
        cmovne  ebx, ebp                                ; 0C20 _ 0F 45. DD
?_0043: cmp     ebx, dword [rsp+0C28H]                  ; 0C23 _ 3B. 9C 24, 00000C28
        jge     ?_0061                                  ; 0C2A _ 0F 8D, 00000382
        mov     eax, dword [r14-1CH]                    ; 0C30 _ 41: 8B. 46, E4
        mov     r13d, r12d                              ; 0C34 _ 45: 89. E5
        mov     r15d, ebx                               ; 0C37 _ 41: 89. DF
        mov     r9d, r12d                               ; 0C3A _ 45: 89. E1
        lea     r12d, [r12-1H]                          ; 0C3D _ 45: 8D. 64 24, FF
        sar     r13d, 31                                ; 0C42 _ 41: C1. FD, 1F
        cmp     ebx, dword [rsp+0C20H]                  ; 0C46 _ 3B. 9C 24, 00000C20
        cmovl   r15d, dword [rsp+0C20H]                 ; 0C4D _ 44: 0F 4C. BC 24, 00000C20
        mov     dword [rsp+40H], r13d                   ; 0C56 _ 44: 89. 6C 24, 40
        and     eax, 3FH                                ; 0C5B _ 83. E0, 3F
        mov     dword [rsp+34H], r15d                   ; 0C5E _ 44: 89. 7C 24, 34
        mov     qword [rsp+28H], rax                    ; 0C63 _ 48: 89. 44 24, 28
        mov     rdx, qword [rsi+3B0H]                   ; 0C68 _ 48: 8B. 96, 000003B0
        lea     r13, [rsp+340H]                         ; 0C6F _ 4C: 8D. AC 24, 00000340
        lea     ebp, [rbx+80H]                          ; 0C77 _ 8D. AB, 00000080
        mov     rcx, r13                                ; 0C7D _ 4C: 89. E9
        add     rdx, 1236                               ; 0C80 _ 48: 81. C2, 000004D4
        mov     qword [rsp+20H], rdx                    ; 0C87 _ 48: 89. 54 24, 20
        mov     rdx, rsi                                ; 0C8C _ 48: 89. F2
        call    _ZN10MovePickerC1ERK8Position4Move5DepthRK5StatsI5ValueLb0EE6Square; 0C8F _ E8, 00000000(rel)
        lea     r8, [rsp+0D0H]                          ; 0C94 _ 4C: 8D. 84 24, 000000D0
        mov     rdx, rsi                                ; 0C9C _ 48: 89. F2
        mov     rcx, r8                                 ; 0C9F _ 4C: 89. C1
        mov     qword [rsp+68H], r8                     ; 0CA2 _ 4C: 89. 44 24, 68
        call    _ZN9CheckInfoC1ERK8Position             ; 0CA7 _ E8, 00000000(rel)
        lea     r10, [r14+28H]                          ; 0CAC _ 4D: 8D. 56, 28
        mov     r9d, dword [rsp+0C28H]                  ; 0CB0 _ 44: 8B. 8C 24, 00000C28
        mov     dword [rsp+44H], 0                      ; 0CB8 _ C7. 44 24, 44, 00000000
        lea     rcx, [rsp+80H]                          ; 0CC0 _ 48: 8D. 8C 24, 00000080
        mov     qword [rsp+50H], r10                    ; 0CC8 _ 4C: 89. 54 24, 50
        mov     qword [rsp+48H], rcx                    ; 0CCD _ 48: 89. 4C 24, 48
        mov     dword [rsp+5CH], r12d                   ; 0CD2 _ 44: 89. 64 24, 5C
        neg     r9d                                     ; 0CD7 _ 41: F7. D9
        mov     dword [rsp+58H], r9d                    ; 0CDA _ 44: 89. 4C 24, 58
?_0044: mov     rcx, r13                                ; 0CDF _ 4C: 89. E9
        call    _ZN10MovePicker9next_moveEv             ; 0CE2 _ E8, 00000000(rel)
        test    eax, eax                                ; 0CE7 _ 85. C0
        mov     r15d, eax                               ; 0CE9 _ 41: 89. C7
        je      ?_0057                                  ; 0CEC _ 0F 84, 0000021C
        mov     r9d, r15d                               ; 0CF2 _ 45: 89. F9
        and     r9d, 0C000H                             ; 0CF5 _ 41: 81. E1, 0000C000
        jne     ?_0073                                  ; 0CFC _ 0F 85, 00000425
        cmp     qword [rsp+0D0H], 0                     ; 0D02 _ 48: 83. BC 24, 000000D0, 00
        jne     ?_0076                                  ; 0D0B _ 0F 85, 00000460
        mov     ecx, r15d                               ; 0D11 _ 44: 89. F9
        mov     r10, qword [rel .refptr.SquareBB]       ; 0D14 _ 4C: 8B. 15, 00000000(rel)
        mov     edx, r15d                               ; 0D1B _ 44: 89. FA
        sar     ecx, 6                                  ; 0D1E _ C1. F9, 06
        and     edx, 3FH                                ; 0D21 _ 83. E2, 3F
        and     ecx, 3FH                                ; 0D24 _ 83. E1, 3F
        mov     eax, dword [rsi+rcx*4]                  ; 0D27 _ 8B. 04 8E
        and     eax, 07H                                ; 0D2A _ 83. E0, 07
        mov     r8, qword [rsp+rax*8+0E0H]              ; 0D2D _ 4C: 8B. 84 C4, 000000E0
        test    qword [r10+rdx*8], r8                   ; 0D35 _ 4D: 85. 04 D2
        jne     ?_0060                                  ; 0D39 _ 0F 85, 00000268
        xor     r12d, r12d                              ; 0D3F _ 45: 31. E4
        cmp     ebp, -9999                              ; 0D42 _ 81. FD, FFFFD8F1
        jl      ?_0049                                  ; 0D48 _ 7C, 55
?_0045: mov     r11d, r15d                              ; 0D4A _ 45: 89. FB
        sar     r11d, 6                                 ; 0D4D _ 41: C1. FB, 06
        and     r11d, 3FH                               ; 0D51 _ 41: 83. E3, 3F
        mov     ecx, dword [rsi+r11*4]                  ; 0D55 _ 42: 8B. 0C 9E
        and     ecx, 07H                                ; 0D59 _ 83. E1, 07
        sub     ecx, 1                                  ; 0D5C _ 83. E9, 01
        je      ?_0068                                  ; 0D5F _ 0F 84, 0000036D
?_0046: mov     edx, r15d                               ; 0D65 _ 44: 89. FA
        mov     r10, qword [rel .refptr.PieceValue]     ; 0D68 _ 4C: 8B. 15, 00000000(rel)
        and     edx, 3FH                                ; 0D6F _ 83. E2, 3F
        mov     r8d, dword [rsi+rdx*4]                  ; 0D72 _ 44: 8B. 04 96
        mov     r12d, dword [r10+r8*4+40H]              ; 0D76 _ 47: 8B. 64 82, 40
        add     r12d, ebp                               ; 0D7B _ 41: 01. EC
        cmp     dword [rsp+34H], r12d                   ; 0D7E _ 44: 39. 64 24, 34
        jge     ?_0067                                  ; 0D83 _ 0F 8D, 0000033D
        cmp     dword [rsp+34H], ebp                    ; 0D89 _ 39. 6C 24, 34
        jge     ?_0065                                  ; 0D8D _ 0F 8D, 000002FD
?_0047: xor     r12d, r12d                              ; 0D93 _ 45: 31. E4
?_0048: cmp     r9d, 16384                              ; 0D96 _ 41: 81. F9, 00004000
        jz      ?_0050                                  ; 0D9D _ 74, 13
?_0049: mov     edx, r15d                               ; 0D9F _ 44: 89. FA
        mov     rcx, rsi                                ; 0DA2 _ 48: 89. F1
        call    _ZNK8Position8see_signE4Move            ; 0DA5 _ E8, 00000000(rel)
        test    eax, eax                                ; 0DAA _ 85. C0
        js      ?_0044                                  ; 0DAC _ 0F 88, FFFFFF2D
?_0050: mov     edx, r15d                               ; 0DB2 _ 44: 89. FA
        mov     rcx, rsi                                ; 0DB5 _ 48: 89. F1
        call    _ZNK8Position9key_afterE4Move           ; 0DB8 _ E8, 00000000(rel)
        mov     r9, qword [rel .refptr.TT]              ; 0DBD _ 4C: 8B. 0D, 00000000(rel)
        mov     r8, qword [rel .refptr.TT]              ; 0DC4 _ 4C: 8B. 05, 00000000(rel)
        mov     rcx, qword [r9]                         ; 0DCB _ 49: 8B. 09
        lea     rdx, [rcx-1H]                           ; 0DCE _ 48: 8D. 51, FF
        mov     qword [rsp+60H], rcx                    ; 0DD2 _ 48: 89. 4C 24, 60
        mov     rcx, rsi                                ; 0DD7 _ 48: 89. F1
        and     rax, rdx                                ; 0DDA _ 48: 21. D0
        mov     edx, r15d                               ; 0DDD _ 44: 89. FA
        shl     rax, 5                                  ; 0DE0 _ 48: C1. E0, 05
        add     rax, qword [r8+8H]                      ; 0DE4 _ 49: 03. 40, 08
        mov     r8, qword [rsp+0D8H]                    ; 0DE8 _ 4C: 8B. 84 24, 000000D8
        prefetcht0 [rax]                                ; 0DF0 _ 0F 18. 08
        call    _ZNK8Position5legalE4Movey              ; 0DF3 _ E8, 00000000(rel)
        test    al, al                                  ; 0DF8 _ 84. C0
        je      ?_0044                                  ; 0DFA _ 0F 84, FFFFFEDF
        mov     r8, qword [rsp+48H]                     ; 0E00 _ 4C: 8B. 44 24, 48
        movzx   r9d, r12b                               ; 0E05 _ 45: 0F B6. CC
        mov     edx, r15d                               ; 0E09 _ 44: 89. FA
        mov     rcx, rsi                                ; 0E0C _ 48: 89. F1
        mov     dword [r14+0CH], r15d                   ; 0E0F _ 45: 89. 7E, 0C
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 0E13 _ E8, 00000000(rel)
        mov     r9d, dword [rsp+34H]                    ; 0E18 _ 44: 8B. 4C 24, 34
        mov     rcx, rsi                                ; 0E1D _ 48: 89. F1
        mov     eax, dword [rsp+5CH]                    ; 0E20 _ 8B. 44 24, 5C
        mov     r8d, dword [rsp+58H]                    ; 0E24 _ 44: 8B. 44 24, 58
        mov     rdx, qword [rsp+50H]                    ; 0E29 _ 48: 8B. 54 24, 50
        neg     r9d                                     ; 0E2E _ 41: F7. D9
        test    r12b, r12b                              ; 0E31 _ 45: 84. E4
        mov     dword [rsp+20H], eax                    ; 0E34 _ 89. 44 24, 20
        jne     ?_0066                                  ; 0E38 _ 0F 85, 00000279
        call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 0E3E _ E8, FFFFFCDD
        neg     eax                                     ; 0E43 _ F7. D8
        mov     r12d, eax                               ; 0E45 _ 41: 89. C4
?_0051: mov     edx, r15d                               ; 0E48 _ 44: 89. FA
        mov     rcx, rsi                                ; 0E4B _ 48: 89. F1
        call    _ZN8Position9undo_moveE4Move            ; 0E4E _ E8, 00000000(rel)
        cmp     r12d, ebx                               ; 0E53 _ 41: 39. DC
        jle     ?_0044                                  ; 0E56 _ 0F 8E, FFFFFE83
        cmp     dword [rsp+34H], r12d                   ; 0E5C _ 44: 39. 64 24, 34
        jge     ?_0069                                  ; 0E61 _ 0F 8D, 00000288
        mov     rbx, qword [r14]                        ; 0E67 _ 49: 8B. 1E
        mov     r8, qword [r14+28H]                     ; 0E6A _ 4D: 8B. 46, 28
        lea     rax, [rbx+4H]                           ; 0E6E _ 48: 8D. 43, 04
        mov     dword [rbx], r15d                       ; 0E72 _ 44: 89. 3B
?_0052: test    r8, r8                                  ; 0E75 _ 4D: 85. C0
        jz      ?_0053                                  ; 0E78 _ 74, 0C
        mov     r10d, dword [r8]                        ; 0E7A _ 45: 8B. 10
        test    r10d, r10d                              ; 0E7D _ 45: 85. D2
        jne     ?_0075                                  ; 0E80 _ 0F 85, 000002DA
?_0053: cmp     r12d, dword [rsp+0C28H]                 ; 0E86 _ 44: 3B. A4 24, 00000C28
        mov     dword [rax], 0                          ; 0E8E _ C7. 00, 00000000
        jl      ?_0072                                  ; 0E94 _ 0F 8C, 0000027B
        mov     r13, qword [rel .refptr.TT]             ; 0E9A _ 4C: 8B. 2D, 00000000(rel)
        cmp     r12d, 31743                             ; 0EA1 _ 41: 81. FC, 00007BFF
        mov     r11d, dword [r14+1CH]                   ; 0EA8 _ 45: 8B. 5E, 1C
        mov     esi, dword [r14+8H]                     ; 0EAC _ 41: 8B. 76, 08
        movzx   ebp, byte [r13+18H]                     ; 0EB0 _ 41: 0F B6. 6D, 18
        jg      ?_0080                                  ; 0EB5 _ 0F 8F, 00000335
        mov     r14d, r12d                              ; 0EBB _ 45: 89. E6
        sub     r14d, esi                               ; 0EBE _ 41: 29. F6
        cmp     r12d, -31744                            ; 0EC1 _ 41: 81. FC, FFFF8400
        mov     esi, r14d                               ; 0EC8 _ 44: 89. F6
        cmovg   esi, r12d                               ; 0ECB _ 41: 0F 4F. F4
?_0054: mov     word [rdi+2H], r15w                     ; 0ECF _ 66 44: 89. 7F, 02
        mov     r15, qword [rsp+38H]                    ; 0ED4 _ 4C: 8B. 7C 24, 38
        movzx   r9d, word [rdi]                         ; 0ED9 _ 44: 0F B7. 0F
        shr     r15, 48                                 ; 0EDD _ 49: C1. EF, 30
        cmp     r15, r9                                 ; 0EE1 _ 4D: 39. CF
        je      ?_0070                                  ; 0EE4 _ 0F 84, 0000020D
?_0055: movzx   edx, byte [rsp+40H]                     ; 0EEA _ 0F B6. 54 24, 40
        or      ebp, 02H                                ; 0EEF _ 83. CD, 02
        mov     word [rdi], r15w                        ; 0EF2 _ 66 44: 89. 3F
        mov     word [rdi+4H], si                       ; 0EF6 _ 66: 89. 77, 04
        mov     word [rdi+6H], r11w                     ; 0EFA _ 66 44: 89. 5F, 06
        mov     byte [rdi+8H], bpl                      ; 0EFF _ 40: 88. 6F, 08
        mov     byte [rdi+9H], dl                       ; 0F03 _ 88. 57, 09
?_0056: mov     eax, r12d                               ; 0F06 _ 44: 89. E0
        jmp     ?_0059                                  ; 0F09 _ E9, 00000085

?_0057: xor     r13d, r13d                              ; 0F0E _ 45: 31. ED
        cmp     dword [rsp+0C20H], ebx                  ; 0F11 _ 39. 9C 24, 00000C20
        mov     rsi, qword [rel .refptr.TT]             ; 0F18 _ 48: 8B. 35, 00000000(rel)
        mov     r11d, dword [r14+1CH]                   ; 0F1F _ 45: 8B. 5E, 1C
        mov     r14d, dword [r14+8H]                    ; 0F23 _ 45: 8B. 76, 08
        setl    r13b                                    ; 0F27 _ 41: 0F 9C. C5
        cmp     ebx, 31743                              ; 0F2B _ 81. FB, 00007BFF
        movzx   ebp, byte [rsi+18H]                     ; 0F31 _ 0F B6. 6E, 18
        lea     ecx, [r13+r13+1H]                       ; 0F35 _ 43: 8D. 4C 2D, 01
        jg      .text.unlikely+0C88H                    ; 0F3A _ 0F 8F, 00000C88(rel)
        mov     eax, ebx                                ; 0F40 _ 89. D8
        sub     eax, r14d                               ; 0F42 _ 44: 29. F0
        cmp     ebx, -31744                             ; 0F45 _ 81. FB, FFFF8400
        mov     edx, eax                                ; 0F4B _ 89. C2
        cmovg   edx, ebx                                ; 0F4D _ 0F 4F. D3
        mov     r9d, edx                                ; 0F50 _ 41: 89. D1
        cmp     dword [rsp+44H], 0                      ; 0F53 _ 83. 7C 24, 44, 00
        movzx   r8d, word [rdi]                         ; 0F58 _ 44: 0F B7. 07
        jne     ?_0063                                  ; 0F5C _ 0F 85, 000000ED
        mov     r10, qword [rsp+38H]                    ; 0F62 _ 4C: 8B. 54 24, 38
        shr     r10, 48                                 ; 0F67 _ 49: C1. EA, 30
        cmp     r10, r8                                 ; 0F6B _ 4D: 39. C2
        jne     ?_0063                                  ; 0F6E _ 0F 85, 000000DB
?_0058: cmp     ecx, 3                                  ; 0F74 _ 83. F9, 03
        je      ?_0071                                  ; 0F77 _ 0F 84, 00000190
        movsx   r15d, byte [rdi+9H]                     ; 0F7D _ 44: 0F BE. 7F, 09
        mov     eax, ebx                                ; 0F82 _ 89. D8
        sub     r15d, 1                                 ; 0F84 _ 41: 83. EF, 01
        cmp     r15d, dword [rsp+40H]                   ; 0F88 _ 44: 3B. 7C 24, 40
        jle     ?_0071                                  ; 0F8D _ 0F 8E, 0000017A
?_0059: add     rsp, 3016                               ; 0F93 _ 48: 81. C4, 00000BC8
        pop     rbx                                     ; 0F9A _ 5B
        pop     rsi                                     ; 0F9B _ 5E
        pop     rdi                                     ; 0F9C _ 5F
        pop     rbp                                     ; 0F9D _ 5D
        pop     r12                                     ; 0F9E _ 41: 5C
        pop     r13                                     ; 0FA0 _ 41: 5D
        pop     r14                                     ; 0FA2 _ 41: 5E
        pop     r15                                     ; 0FA4 _ 41: 5F
        ret                                             ; 0FA6 _ C3

?_0060: mov     r12d, 1                                 ; 0FA7 _ 41: BC, 00000001
        jmp     ?_0049                                  ; 0FAD _ E9, FFFFFDED

?_0061: cmp     byte [rsp+7FH], 0                       ; 0FB2 _ 80. 7C 24, 7F, 00
        mov     eax, ebx                                ; 0FB7 _ 89. D8
        jnz     ?_0059                                  ; 0FB9 _ 75, D8
        mov     r10, qword [rel .refptr.TT]             ; 0FBB _ 4C: 8B. 15, 00000000(rel)
        cmp     ebx, 31743                              ; 0FC2 _ 81. FB, 00007BFF
        mov     r15d, dword [r14+1CH]                   ; 0FC8 _ 45: 8B. 7E, 1C
        mov     r9d, dword [r14+8H]                     ; 0FCC _ 45: 8B. 4E, 08
        movzx   r11d, byte [r10+18H]                    ; 0FD0 _ 45: 0F B6. 5A, 18
        jg      .text.unlikely+0CBDH                    ; 0FD5 _ 0F 8F, 00000CBD(rel)
        mov     r14d, ebx                               ; 0FDB _ 41: 89. DE
        sub     r14d, r9d                               ; 0FDE _ 45: 29. CE
        cmp     ebx, -31744                             ; 0FE1 _ 81. FB, FFFF8400
        mov     r9d, r14d                               ; 0FE7 _ 45: 89. F1
        cmovg   r9d, ebx                                ; 0FEA _ 44: 0F 4F. CB
        mov     rsi, qword [rsi+3B8H]                   ; 0FEE _ 48: 8B. B6, 000003B8
        movzx   edx, word [rdi]                         ; 0FF5 _ 0F B7. 17
        movzx   ecx, word [rsi+36H]                     ; 0FF8 _ 0F B7. 4E, 36
        cmp     rcx, rdx                                ; 0FFC _ 48: 39. D1
        je      .text.unlikely+0CACH                    ; 0FFF _ 0F 84, 00000CAC(rel)
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [rdi+2H], 0                        ; 1005 _ 66: C7. 47, 02, 0000
        mov     r8d, r11d                               ; 100B _ 45: 89. D8
        mov     word [rdi], cx                          ; 100E _ 66: 89. 0F
        mov     eax, ebx                                ; 1011 _ 89. D8
        or      r8d, 02H                                ; 1013 _ 41: 83. C8, 02
        mov     word [rdi+4H], r9w                      ; 1017 _ 66 44: 89. 4F, 04
        mov     word [rdi+6H], r15w                     ; 101C _ 66 44: 89. 7F, 06
        mov     byte [rdi+8H], r8b                      ; 1021 _ 44: 88. 47, 08
        mov     byte [rdi+9H], -6                       ; 1025 _ C6. 47, 09, FA
        jmp     ?_0059                                  ; 1029 _ E9, FFFFFF65

?_0062: cmp     dword [r14-1CH], 65                     ; 102E _ 41: 83. 7E, E4, 41
        je      ?_0082                                  ; 1033 _ 0F 84, 000001C4
        mov     rcx, rsi                                ; 1039 _ 48: 89. F1
        call    _ZN4Eval8evaluateERK8Position           ; 103C _ E8, 00000000(rel)
        mov     ebx, eax                                ; 1041 _ 89. C3
        mov     dword [r14+1CH], ebx                    ; 1043 _ 41: 89. 5E, 1C
        xor     r8d, r8d                                ; 1047 _ 45: 31. C0
        jmp     ?_0043                                  ; 104A _ E9, FFFFFBD4

?_0063: mov     rsi, qword [rsp+38H]                    ; 104F _ 48: 8B. 74 24, 38
        movzx   r12d, word [rsp+44H]                    ; 1054 _ 44: 0F B7. 64 24, 44
        shr     rsi, 48                                 ; 105A _ 48: C1. EE, 30
        cmp     rsi, r8                                 ; 105E _ 4C: 39. C6
        mov     word [rdi+2H], r12w                     ; 1061 _ 66 44: 89. 67, 02
        je      ?_0058                                  ; 1066 _ 0F 84, FFFFFF08
?_0064: mov     word [rdi+6H], r11w                     ; 106C _ 66 44: 89. 5F, 06
        movzx   r11d, byte [rsp+40H]                    ; 1071 _ 44: 0F B6. 5C 24, 40
        or      ebp, ecx                                ; 1077 _ 09. CD
        mov     eax, ebx                                ; 1079 _ 89. D8
        mov     word [rdi], si                          ; 107B _ 66: 89. 37
        mov     word [rdi+4H], r9w                      ; 107E _ 66 44: 89. 4F, 04
        mov     byte [rdi+8H], bpl                      ; 1083 _ 40: 88. 6F, 08
        mov     byte [rdi+9H], r11b                     ; 1087 _ 44: 88. 5F, 09
        jmp     ?_0059                                  ; 108B _ E9, FFFFFF03

?_0065: mov     edx, r15d                               ; 1090 _ 44: 89. FA
        mov     rcx, rsi                                ; 1093 _ 48: 89. F1
        mov     dword [rsp+60H], r9d                    ; 1096 _ 44: 89. 4C 24, 60
        call    _ZNK8Position3seeE4Move                 ; 109B _ E8, 00000000(rel)
        mov     r9d, dword [rsp+60H]                    ; 10A0 _ 44: 8B. 4C 24, 60
        test    eax, eax                                ; 10A5 _ 85. C0
        jg      ?_0047                                  ; 10A7 _ 0F 8F, FFFFFCE6
        cmp     ebx, ebp                                ; 10AD _ 39. EB
        cmovl   ebx, ebp                                ; 10AF _ 0F 4C. DD
        jmp     ?_0044                                  ; 10B2 _ E9, FFFFFC28

?_0066: call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 10B7 _ E8, 00000CA4
        neg     eax                                     ; 10BC _ F7. D8
        mov     r12d, eax                               ; 10BE _ 41: 89. C4
        jmp     ?_0051                                  ; 10C1 _ E9, FFFFFD82

?_0067: cmp     ebx, r12d                               ; 10C6 _ 44: 39. E3
        cmovl   ebx, r12d                               ; 10C9 _ 41: 0F 4C. DC
        jmp     ?_0044                                  ; 10CD _ E9, FFFFFC0D

?_0068: imul    eax, dword [rsi+3ACH], 7                ; 10D2 _ 6B. 86, 000003AC, 07
        shr     r11, 3                                  ; 10D9 _ 49: C1. EB, 03
        xor     r11d, eax                               ; 10DD _ 41: 31. C3
        cmp     r11d, 3                                 ; 10E0 _ 41: 83. FB, 03
        jbe     ?_0046                                  ; 10E4 _ 0F 86, FFFFFC7B
        jmp     .text.unlikely+0CC5H                    ; 10EA _ E9, 00000CC5(rel)

?_0069: mov     ebx, r12d                               ; 10EF _ 44: 89. E3
        jmp     ?_0044                                  ; 10F2 _ E9, FFFFFBE8

?_0070: movsx   ecx, byte [rdi+9H]                      ; 10F7 _ 0F BE. 4F, 09
        sub     ecx, 1                                  ; 10FB _ 83. E9, 01
        cmp     ecx, dword [rsp+40H]                    ; 10FE _ 3B. 4C 24, 40
        jle     ?_0055                                  ; 1102 _ 0F 8E, FFFFFDE2
        jmp     ?_0056                                  ; 1108 _ E9, FFFFFDF9

?_0071: mov     rsi, r8                                 ; 110D _ 4C: 89. C6
        jmp     ?_0064                                  ; 1110 _ E9, FFFFFF57

?_0072: mov     ebx, r12d                               ; 1115 _ 44: 89. E3
        mov     dword [rsp+44H], r15d                   ; 1118 _ 44: 89. 7C 24, 44
        mov     dword [rsp+34H], r12d                   ; 111D _ 44: 89. 64 24, 34
        jmp     ?_0044                                  ; 1122 _ E9, FFFFFBB8

?_0073: mov     r8, qword [rsp+68H]                     ; 1127 _ 4C: 8B. 44 24, 68
        mov     edx, r15d                               ; 112C _ 44: 89. FA
        mov     rcx, rsi                                ; 112F _ 48: 89. F1
        mov     dword [rsp+60H], r9d                    ; 1132 _ 44: 89. 4C 24, 60
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 1137 _ E8, 00000000(rel)
        mov     r9d, dword [rsp+60H]                    ; 113C _ 44: 8B. 4C 24, 60
        test    al, al                                  ; 1141 _ 84. C0
        mov     r12d, eax                               ; 1143 _ 41: 89. C4
        jne     ?_0048                                  ; 1146 _ 0F 85, FFFFFC4A
?_0074: cmp     ebp, -9999                              ; 114C _ 81. FD, FFFFD8F1
        jge     ?_0045                                  ; 1152 _ 0F 8D, FFFFFBF2
        xor     r12d, r12d                              ; 1158 _ 45: 31. E4
        jmp     ?_0048                                  ; 115B _ E9, FFFFFC36

?_0075: add     rax, 4                                  ; 1160 _ 48: 83. C0, 04
        add     r8, 4                                   ; 1164 _ 49: 83. C0, 04
        mov     dword [rax-4H], r10d                    ; 1168 _ 44: 89. 50, FC
        jmp     ?_0052                                  ; 116C _ E9, FFFFFD04

?_0076: mov     r8, qword [rsp+68H]                     ; 1171 _ 4C: 8B. 44 24, 68
        mov     edx, r15d                               ; 1176 _ 44: 89. FA
        mov     rcx, rsi                                ; 1179 _ 48: 89. F1
        mov     dword [rsp+60H], r9d                    ; 117C _ 44: 89. 4C 24, 60
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 1181 _ E8, 00000000(rel)
        mov     r9d, dword [rsp+60H]                    ; 1186 _ 44: 8B. 4C 24, 60
        test    al, al                                  ; 118B _ 84. C0
        mov     r12d, eax                               ; 118D _ 41: 89. C4
        jz      ?_0074                                  ; 1190 _ 74, BA
        jmp     ?_0049                                  ; 1192 _ E9, FFFFFC08

?_0077: movsx   ebx, word [rdi+6H]                      ; 1197 _ 0F BF. 5F, 06
        cmp     ebx, 32002                              ; 119B _ 81. FB, 00007D02
        mov     dword [r14+1CH], ebx                    ; 11A1 _ 41: 89. 5E, 1C
        jne     ?_0043                                  ; 11A5 _ 0F 85, FFFFFA78
        jmp     _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth.cold.204; 11AB _ E9, 00000C63(rel)

?_0078: cmp     dword [r14+8H], 127                     ; 11B0 _ 41: 83. 7E, 08, 7F
        jg      ?_0083                                  ; 11B5 _ 7F, 4B
        mov     edi, dword [rsi+3ACH]                   ; 11B7 _ 8B. BE, 000003AC
        lea     rbx, [rel _ZN12_GLOBAL__N_19DrawValueE] ; 11BD _ 48: 8D. 1D, 004000C0(rel)
        mov     eax, dword [rbx+rdi*4]                  ; 11C4 _ 8B. 04 BB
        jmp     ?_0059                                  ; 11C7 _ E9, FFFFFDC7

?_0079: sub     ebp, r9d                                ; 11CC _ 44: 29. CD
        movsx   ebx, word [rdi+6H]                      ; 11CF _ 0F BF. 5F, 06
        cmp     ebx, 32002                              ; 11D3 _ 81. FB, 00007D02
        mov     dword [r14+1CH], ebx                    ; 11D9 _ 41: 89. 5E, 1C
        jz      ?_0084                                  ; 11DD _ 74, 28
        cmp     ebp, 32002                              ; 11DF _ 81. FD, 00007D02
        jne     ?_0042                                  ; 11E5 _ 0F 85, FFFFFA20
        jmp     ?_0043                                  ; 11EB _ E9, FFFFFA33

?_0080: add     esi, r12d                               ; 11F0 _ 44: 01. E6
        jmp     ?_0054                                  ; 11F3 _ E9, FFFFFCD7

?_0081: jmp     _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth.cold.204; 11F8 _ E9, 00000C63(rel)

?_0082: jmp     .text.unlikely+0C9EH                    ; 11FD _ E9, 00000C9E(rel)

?_0083: jmp     .text.unlikely+0C91H                    ; 1202 _ E9, 00000C91(rel)

?_0084: ; Local function
        jmp     _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth.cold.204; 1207 _ E9, 00000C63(rel)

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_ZSt13__stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_.isra.177:; Local function
        push    r13                                     ; 1210 _ 41: 55
        push    r12                                     ; 1212 _ 41: 54
        push    rbp                                     ; 1214 _ 55
        push    rdi                                     ; 1215 _ 57
        push    rsi                                     ; 1216 _ 56
        push    rbx                                     ; 1217 _ 53
        sub     rsp, 56                                 ; 1218 _ 48: 83. EC, 38
        mov     rsi, rdx                                ; 121C _ 48: 89. D6
        mov     r12, rcx                                ; 121F _ 49: 89. CC
        mov     rbp, rdx                                ; 1222 _ 48: 89. D5
        sub     rsi, rcx                                ; 1225 _ 48: 29. CE
        sar     rsi, 5                                  ; 1228 _ 48: C1. FE, 05
        test    rsi, rsi                                ; 122C _ 48: 85. F6
        jle     .text.unlikely+0F4BH                    ; 122F _ 0F 8E, 00000F4B(rel)
        mov     rdx, qword [rel .refptr._ZSt7nothrow]   ; 1235 _ 48: 8B. 15, 00000000(rel)
        mov     r13, rsi                                ; 123C _ 49: 89. F5
        shl     r13, 5                                  ; 123F _ 49: C1. E5, 05
        mov     rcx, r13                                ; 1243 _ 4C: 89. E9
        call    _ZnwyRKSt9nothrow_t                     ; 1246 _ E8, 00000000(rel)
        test    rax, rax                                ; 124B _ 48: 85. C0
        mov     rbx, rax                                ; 124E _ 48: 89. C3
        je      ?_0111                                  ; 1251 _ 0F 84, 000004E3
        mov     rdi, rax                                ; 1257 _ 48: 89. C7
        lea     rax, [rax+r13]                          ; 125A _ 4A: 8D. 04 28
        cmp     rax, rbx                                ; 125E _ 48: 39. D8
        je      ?_0098                                  ; 1261 _ 0F 84, 0000031D
        mov     edx, dword [r12]                        ; 1267 _ 41: 8B. 14 24
        mov     ecx, dword [r12+4H]                     ; 126B _ 41: 8B. 4C 24, 04
        mov     qword [rbx+10H], 0                      ; 1270 _ 48: C7. 43, 10, 00000000
        mov     qword [rbx+18H], 0                      ; 1278 _ 48: C7. 43, 18, 00000000
        mov     qword [rbx+8H], 0                       ; 1280 _ 48: C7. 43, 08, 00000000
        mov     r8, qword [r12+8H]                      ; 1288 _ 4D: 8B. 44 24, 08
        mov     dword [rbx], edx                        ; 128D _ 89. 13
        mov     dword [rbx+4H], ecx                     ; 128F _ 89. 4B, 04
        mov     qword [rbx+8H], r8                      ; 1292 _ 4C: 89. 43, 08
        mov     r10, qword [r12+10H]                    ; 1296 _ 4D: 8B. 54 24, 10
        mov     qword [r12+8H], 0                       ; 129B _ 49: C7. 44 24, 08, 00000000
        mov     r9, qword [rbx+10H]                     ; 12A4 _ 4C: 8B. 4B, 10
        mov     qword [rbx+10H], r10                    ; 12A8 _ 4C: 89. 53, 10
        mov     r13, qword [r12+18H]                    ; 12AC _ 4D: 8B. 6C 24, 18
        lea     r10, [rbx+20H]                          ; 12B1 _ 4C: 8D. 53, 20
        mov     qword [r12+10H], r9                     ; 12B5 _ 4D: 89. 4C 24, 10
        mov     r11, qword [rbx+18H]                    ; 12BA _ 4C: 8B. 5B, 18
        cmp     rax, r10                                ; 12BE _ 4C: 39. D0
        mov     qword [rbx+18H], r13                    ; 12C1 _ 4C: 89. 6B, 18
        mov     qword [r12+18H], r11                    ; 12C5 _ 4D: 89. 5C 24, 18
        je      ?_0108                                  ; 12CA _ 0F 84, 00000458
        mov     rdx, rax                                ; 12D0 _ 48: 89. C2
        sub     rdx, r10                                ; 12D3 _ 4C: 29. D2
        sub     rdx, 32                                 ; 12D6 _ 48: 83. EA, 20
        shr     rdx, 5                                  ; 12DA _ 48: C1. EA, 05
        and     edx, 03H                                ; 12DE _ 83. E2, 03
        test    r10, r10                                ; 12E1 _ 4D: 85. D2
        jz      ?_0085                                  ; 12E4 _ 74, 3F
        mov     r9, qword [r10-18H]                     ; 12E6 _ 4D: 8B. 4A, E8
        mov     qword [r10-18H], 0                      ; 12EA _ 49: C7. 42, E8, 00000000
        mov     r11, qword [r10-10H]                    ; 12F2 _ 4D: 8B. 5A, F0
        mov     qword [r10-10H], 0                      ; 12F6 _ 49: C7. 42, F0, 00000000
        mov     r13, qword [r10-8H]                     ; 12FE _ 4D: 8B. 6A, F8
        mov     qword [r10-8H], 0                       ; 1302 _ 49: C7. 42, F8, 00000000
        mov     ecx, dword [r10-20H]                    ; 130A _ 41: 8B. 4A, E0
        mov     r8d, dword [r10-1CH]                    ; 130E _ 45: 8B. 42, E4
        mov     qword [r10+8H], r9                      ; 1312 _ 4D: 89. 4A, 08
        mov     qword [r10+10H], r11                    ; 1316 _ 4D: 89. 5A, 10
        mov     qword [r10+18H], r13                    ; 131A _ 4D: 89. 6A, 18
        mov     dword [r10], ecx                        ; 131E _ 41: 89. 0A
        mov     dword [r10+4H], r8d                     ; 1321 _ 45: 89. 42, 04
?_0085: add     r10, 32                                 ; 1325 _ 49: 83. C2, 20
        cmp     rax, r10                                ; 1329 _ 4C: 39. D0
        je      ?_0096                                  ; 132C _ 0F 84, 00000226
        test    rdx, rdx                                ; 1332 _ 48: 85. D2
        je      ?_0091                                  ; 1335 _ 0F 84, 000000F1
        cmp     rdx, 1                                  ; 133B _ 48: 83. FA, 01
        je      ?_0089                                  ; 133F _ 0F 84, 00000096
        cmp     rdx, 2                                  ; 1345 _ 48: 83. FA, 02
        jz      ?_0087                                  ; 1349 _ 74, 48
        test    r10, r10                                ; 134B _ 4D: 85. D2
        jz      ?_0086                                  ; 134E _ 74, 3F
        mov     r8, qword [r10-18H]                     ; 1350 _ 4D: 8B. 42, E8
        mov     qword [r10-18H], 0                      ; 1354 _ 49: C7. 42, E8, 00000000
        mov     r9, qword [r10-10H]                     ; 135C _ 4D: 8B. 4A, F0
        mov     qword [r10-10H], 0                      ; 1360 _ 49: C7. 42, F0, 00000000
        mov     r11, qword [r10-8H]                     ; 1368 _ 4D: 8B. 5A, F8
        mov     qword [r10-8H], 0                       ; 136C _ 49: C7. 42, F8, 00000000
        mov     edx, dword [r10-20H]                    ; 1374 _ 41: 8B. 52, E0
        mov     ecx, dword [r10-1CH]                    ; 1378 _ 41: 8B. 4A, E4
        mov     qword [r10+8H], r8                      ; 137C _ 4D: 89. 42, 08
        mov     qword [r10+10H], r9                     ; 1380 _ 4D: 89. 4A, 10
        mov     qword [r10+18H], r11                    ; 1384 _ 4D: 89. 5A, 18
        mov     dword [r10], edx                        ; 1388 _ 41: 89. 12
        mov     dword [r10+4H], ecx                     ; 138B _ 41: 89. 4A, 04
?_0086: add     r10, 32                                 ; 138F _ 49: 83. C2, 20
?_0087: test    r10, r10                                ; 1393 _ 4D: 85. D2
        jz      ?_0088                                  ; 1396 _ 74, 3F
        mov     rcx, qword [r10-18H]                    ; 1398 _ 49: 8B. 4A, E8
        mov     qword [r10-18H], 0                      ; 139C _ 49: C7. 42, E8, 00000000
        mov     r8, qword [r10-10H]                     ; 13A4 _ 4D: 8B. 42, F0
        mov     qword [r10-10H], 0                      ; 13A8 _ 49: C7. 42, F0, 00000000
        mov     r9, qword [r10-8H]                      ; 13B0 _ 4D: 8B. 4A, F8
        mov     qword [r10-8H], 0                       ; 13B4 _ 49: C7. 42, F8, 00000000
        mov     r13d, dword [r10-20H]                   ; 13BC _ 45: 8B. 6A, E0
        mov     edx, dword [r10-1CH]                    ; 13C0 _ 41: 8B. 52, E4
        mov     qword [r10+8H], rcx                     ; 13C4 _ 49: 89. 4A, 08
        mov     qword [r10+10H], r8                     ; 13C8 _ 4D: 89. 42, 10
        mov     qword [r10+18H], r9                     ; 13CC _ 4D: 89. 4A, 18
        mov     dword [r10], r13d                       ; 13D0 _ 45: 89. 2A
        mov     dword [r10+4H], edx                     ; 13D3 _ 41: 89. 52, 04
?_0088: add     r10, 32                                 ; 13D7 _ 49: 83. C2, 20
?_0089: test    r10, r10                                ; 13DB _ 4D: 85. D2
        jz      ?_0090                                  ; 13DE _ 74, 3F
        mov     rdx, qword [r10-18H]                    ; 13E0 _ 49: 8B. 52, E8
        mov     qword [r10-18H], 0                      ; 13E4 _ 49: C7. 42, E8, 00000000
        mov     rcx, qword [r10-10H]                    ; 13EC _ 49: 8B. 4A, F0
        mov     qword [r10-10H], 0                      ; 13F0 _ 49: C7. 42, F0, 00000000
        mov     r8, qword [r10-8H]                      ; 13F8 _ 4D: 8B. 42, F8
        mov     qword [r10-8H], 0                       ; 13FC _ 49: C7. 42, F8, 00000000
        mov     r11d, dword [r10-20H]                   ; 1404 _ 45: 8B. 5A, E0
        mov     r13d, dword [r10-1CH]                   ; 1408 _ 45: 8B. 6A, E4
        mov     qword [r10+8H], rdx                     ; 140C _ 49: 89. 52, 08
        mov     qword [r10+10H], rcx                    ; 1410 _ 49: 89. 4A, 10
        mov     qword [r10+18H], r8                     ; 1414 _ 4D: 89. 42, 18
        mov     dword [r10], r11d                       ; 1418 _ 45: 89. 1A
        mov     dword [r10+4H], r13d                    ; 141B _ 45: 89. 6A, 04
?_0090: add     r10, 32                                 ; 141F _ 49: 83. C2, 20
        cmp     rax, r10                                ; 1423 _ 4C: 39. D0
        je      ?_0096                                  ; 1426 _ 0F 84, 0000012C
?_0091: test    r10, r10                                ; 142C _ 4D: 85. D2
        jz      ?_0092                                  ; 142F _ 74, 3F
        mov     r13, qword [r10-18H]                    ; 1431 _ 4D: 8B. 6A, E8
        mov     qword [r10-18H], 0                      ; 1435 _ 49: C7. 42, E8, 00000000
        mov     rdx, qword [r10-10H]                    ; 143D _ 49: 8B. 52, F0
        mov     qword [r10-10H], 0                      ; 1441 _ 49: C7. 42, F0, 00000000
        mov     rcx, qword [r10-8H]                     ; 1449 _ 49: 8B. 4A, F8
        mov     qword [r10-8H], 0                       ; 144D _ 49: C7. 42, F8, 00000000
        mov     r9d, dword [r10-20H]                    ; 1455 _ 45: 8B. 4A, E0
        mov     r11d, dword [r10-1CH]                   ; 1459 _ 45: 8B. 5A, E4
        mov     qword [r10+8H], r13                     ; 145D _ 4D: 89. 6A, 08
        mov     qword [r10+10H], rdx                    ; 1461 _ 49: 89. 52, 10
        mov     qword [r10+18H], rcx                    ; 1465 _ 49: 89. 4A, 18
        mov     dword [r10], r9d                        ; 1469 _ 45: 89. 0A
        mov     dword [r10+4H], r11d                    ; 146C _ 45: 89. 5A, 04
?_0092: mov     r8, r10                                 ; 1470 _ 4D: 89. D0
        add     r8, 32                                  ; 1473 _ 49: 83. C0, 20
        jz      ?_0093                                  ; 1477 _ 74, 40
        mov     r9d, dword [r8-20H]                     ; 1479 _ 45: 8B. 48, E0
        mov     r11, qword [r8-18H]                     ; 147D _ 4D: 8B. 58, E8
        mov     r13, qword [r8-10H]                     ; 1481 _ 4D: 8B. 68, F0
        mov     rdx, qword [r8-8H]                      ; 1485 _ 49: 8B. 50, F8
        mov     dword [r10+20H], r9d                    ; 1489 _ 45: 89. 4A, 20
        mov     r10d, dword [r8-1CH]                    ; 148D _ 45: 8B. 50, E4
        mov     qword [r8+8H], r11                      ; 1491 _ 4D: 89. 58, 08
        mov     qword [r8-18H], 0                       ; 1495 _ 49: C7. 40, E8, 00000000
        mov     qword [r8+10H], r13                     ; 149D _ 4D: 89. 68, 10
        mov     dword [r8+4H], r10d                     ; 14A1 _ 45: 89. 50, 04
        mov     qword [r8-10H], 0                       ; 14A5 _ 49: C7. 40, F0, 00000000
        mov     qword [r8+18H], rdx                     ; 14AD _ 49: 89. 50, 18
        mov     qword [r8-8H], 0                        ; 14B1 _ 49: C7. 40, F8, 00000000
?_0093: mov     rcx, r8                                 ; 14B9 _ 4C: 89. C1
        add     rcx, 32                                 ; 14BC _ 48: 83. C1, 20
        jz      ?_0094                                  ; 14C0 _ 74, 40
        mov     r9d, dword [rcx-20H]                    ; 14C2 _ 44: 8B. 49, E0
        mov     r11, qword [rcx-18H]                    ; 14C6 _ 4C: 8B. 59, E8
        mov     r13, qword [rcx-10H]                    ; 14CA _ 4C: 8B. 69, F0
        mov     rdx, qword [rcx-8H]                     ; 14CE _ 48: 8B. 51, F8
        mov     dword [r8+20H], r9d                     ; 14D2 _ 45: 89. 48, 20
        mov     r10d, dword [rcx-1CH]                   ; 14D6 _ 44: 8B. 51, E4
        mov     qword [rcx+8H], r11                     ; 14DA _ 4C: 89. 59, 08
        mov     qword [rcx-18H], 0                      ; 14DE _ 48: C7. 41, E8, 00000000
        mov     qword [rcx+10H], r13                    ; 14E6 _ 4C: 89. 69, 10
        mov     dword [rcx+4H], r10d                    ; 14EA _ 44: 89. 51, 04
        mov     qword [rcx-10H], 0                      ; 14EE _ 48: C7. 41, F0, 00000000
        mov     qword [rcx+18H], rdx                    ; 14F6 _ 48: 89. 51, 18
        mov     qword [rcx-8H], 0                       ; 14FA _ 48: C7. 41, F8, 00000000
?_0094: mov     rcx, r8                                 ; 1502 _ 4C: 89. C1
        add     rcx, 64                                 ; 1505 _ 48: 83. C1, 40
        jz      ?_0095                                  ; 1509 _ 74, 40
        mov     r9d, dword [rcx-20H]                    ; 150B _ 44: 8B. 49, E0
        mov     r11, qword [rcx-18H]                    ; 150F _ 4C: 8B. 59, E8
        mov     r13, qword [rcx-10H]                    ; 1513 _ 4C: 8B. 69, F0
        mov     rdx, qword [rcx-8H]                     ; 1517 _ 48: 8B. 51, F8
        mov     dword [r8+40H], r9d                     ; 151B _ 45: 89. 48, 40
        mov     r10d, dword [rcx-1CH]                   ; 151F _ 44: 8B. 51, E4
        mov     qword [rcx+8H], r11                     ; 1523 _ 4C: 89. 59, 08
        mov     qword [rcx-18H], 0                      ; 1527 _ 48: C7. 41, E8, 00000000
        mov     qword [rcx+10H], r13                    ; 152F _ 4C: 89. 69, 10
        mov     dword [rcx+4H], r10d                    ; 1533 _ 44: 89. 51, 04
        mov     qword [rcx-10H], 0                      ; 1537 _ 48: C7. 41, F0, 00000000
        mov     qword [rcx+18H], rdx                    ; 153F _ 48: 89. 51, 18
        mov     qword [rcx-8H], 0                       ; 1543 _ 48: C7. 41, F8, 00000000
?_0095: lea     r10, [r8+60H]                           ; 154B _ 4D: 8D. 50, 60
        cmp     rax, r10                                ; 154F _ 4C: 39. D0
        jne     ?_0091                                  ; 1552 _ 0F 85, FFFFFED4
?_0096: lea     r8, [rbx+40H]                           ; 1558 _ 4C: 8D. 43, 40
        sub     rax, r8                                 ; 155C _ 4C: 29. C0
        and     rax, 0FFFFFFFFFFFFFFE0H                 ; 155F _ 48: 83. E0, E0
        lea     rdx, [rbx+rax+20H]                      ; 1563 _ 48: 8D. 54 03, 20
?_0097: mov     eax, dword [rdx]                        ; 1568 _ 8B. 02
        add     rdx, 8                                  ; 156A _ 48: 83. C2, 08
        mov     ecx, dword [rdx-4H]                     ; 156E _ 8B. 4A, FC
        mov     dword [r12], eax                        ; 1571 _ 41: 89. 04 24
        mov     dword [r12+4H], ecx                     ; 1575 _ 41: 89. 4C 24, 04
        lea     rcx, [r12+8H]                           ; 157A _ 49: 8D. 4C 24, 08
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 157F _ E8, 000020F0(rel)
?_0098: mov     r9, rsi                                 ; 1584 _ 49: 89. F1
        shl     rsi, 5                                  ; 1587 _ 48: C1. E6, 05
        mov     byte [rsp+20H], 0                       ; 158B _ C6. 44 24, 20, 00
        mov     r8, rbx                                 ; 1590 _ 49: 89. D8
        mov     rdx, rbp                                ; 1593 _ 48: 89. EA
        mov     rcx, r12                                ; 1596 _ 4C: 89. E1
        add     rsi, rbx                                ; 1599 _ 48: 01. DE
        call    _ZSt22__stable_sort_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_xNS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_T2_; 159C _ E8, 00000000(rel)
        cmp     rbx, rsi                                ; 15A1 _ 48: 39. F3
        je      ?_0106                                  ; 15A4 _ 0F 84, 00000161
        mov     rbp, rsi                                ; 15AA _ 48: 89. F5
        mov     rcx, qword [rbx+8H]                     ; 15AD _ 48: 8B. 4B, 08
        sub     rbp, rbx                                ; 15B1 _ 48: 29. DD
        sub     rbp, 32                                 ; 15B4 _ 48: 83. ED, 20
        shr     rbp, 5                                  ; 15B8 _ 48: C1. ED, 05
        and     ebp, 07H                                ; 15BC _ 83. E5, 07
        test    rcx, rcx                                ; 15BF _ 48: 85. C9
        jne     ?_0110                                  ; 15C2 _ 0F 85, 0000016D
        add     rbx, 32                                 ; 15C8 _ 48: 83. C3, 20
        cmp     rsi, rbx                                ; 15CC _ 48: 39. DE
        je      ?_0106                                  ; 15CF _ 0F 84, 00000136
        test    rbp, rbp                                ; 15D5 _ 48: 85. ED
        je      ?_0105                                  ; 15D8 _ 0F 84, 000000A8
        cmp     rbp, 1                                  ; 15DE _ 48: 83. FD, 01
        je      ?_0104                                  ; 15E2 _ 0F 84, 00000084
        cmp     rbp, 2                                  ; 15E8 _ 48: 83. FD, 02
        jz      ?_0103                                  ; 15EC _ 74, 6D
        cmp     rbp, 3                                  ; 15EE _ 48: 83. FD, 03
        jz      ?_0102                                  ; 15F2 _ 74, 56
        cmp     rbp, 4                                  ; 15F4 _ 48: 83. FD, 04
        jz      ?_0101                                  ; 15F8 _ 74, 3F
        cmp     rbp, 5                                  ; 15FA _ 48: 83. FD, 05
        jz      ?_0100                                  ; 15FE _ 74, 28
        cmp     rbp, 6                                  ; 1600 _ 48: 83. FD, 06
        jz      ?_0099                                  ; 1604 _ 74, 11
        mov     rcx, qword [rbx+8H]                     ; 1606 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 160A _ 48: 85. C9
        jne     .text.unlikely+0F7EH                    ; 160D _ 0F 85, 00000F7E(rel)
        add     rbx, 32                                 ; 1613 _ 48: 83. C3, 20
?_0099: mov     rcx, qword [rbx+8H]                     ; 1617 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 161B _ 48: 85. C9
        jne     .text.unlikely+0F74H                    ; 161E _ 0F 85, 00000F74(rel)
        add     rbx, 32                                 ; 1624 _ 48: 83. C3, 20
?_0100: mov     rcx, qword [rbx+8H]                     ; 1628 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 162C _ 48: 85. C9
        jne     .text.unlikely+0F6AH                    ; 162F _ 0F 85, 00000F6A(rel)
        add     rbx, 32                                 ; 1635 _ 48: 83. C3, 20
?_0101: mov     rcx, qword [rbx+8H]                     ; 1639 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 163D _ 48: 85. C9
        jne     .text.unlikely+0F60H                    ; 1640 _ 0F 85, 00000F60(rel)
        add     rbx, 32                                 ; 1646 _ 48: 83. C3, 20
?_0102: mov     rcx, qword [rbx+8H]                     ; 164A _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 164E _ 48: 85. C9
        jne     .text.unlikely+0F92H                    ; 1651 _ 0F 85, 00000F92(rel)
        add     rbx, 32                                 ; 1657 _ 48: 83. C3, 20
?_0103: mov     rcx, qword [rbx+8H]                     ; 165B _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 165F _ 48: 85. C9
        jne     .text.unlikely+0F88H                    ; 1662 _ 0F 85, 00000F88(rel)
        add     rbx, 32                                 ; 1668 _ 48: 83. C3, 20
?_0104: mov     rcx, qword [rbx+8H]                     ; 166C _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 1670 _ 48: 85. C9
        jne     .text.unlikely+0F2FH                    ; 1673 _ 0F 85, 00000F2F(rel)
        add     rbx, 32                                 ; 1679 _ 48: 83. C3, 20
        cmp     rsi, rbx                                ; 167D _ 48: 39. DE
        je      ?_0107                                  ; 1680 _ 0F 84, 000000A0
?_0105: mov     rcx, qword [rbx+8H]                     ; 1686 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 168A _ 48: 85. C9
        jne     .text.unlikely+0EFDH                    ; 168D _ 0F 85, 00000EFD(rel)
        add     rbx, 32                                 ; 1693 _ 48: 83. C3, 20
        mov     rcx, qword [rbx+8H]                     ; 1697 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 169B _ 48: 85. C9
        jne     ?_0109                                  ; 169E _ 0F 85, 0000008C
        mov     rcx, qword [rbx+28H]                    ; 16A4 _ 48: 8B. 4B, 28
        test    rcx, rcx                                ; 16A8 _ 48: 85. C9
        jne     _ZSt13__stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_.isra.177.cold.207; 16AB _ 0F 85, 00000EE9(rel)
        mov     rcx, qword [rbx+48H]                    ; 16B1 _ 48: 8B. 4B, 48
        test    rcx, rcx                                ; 16B5 _ 48: 85. C9
        jne     .text.unlikely+0EF3H                    ; 16B8 _ 0F 85, 00000EF3(rel)
        mov     rcx, qword [rbx+68H]                    ; 16BE _ 48: 8B. 4B, 68
        test    rcx, rcx                                ; 16C2 _ 48: 85. C9
        jne     .text.unlikely+0F25H                    ; 16C5 _ 0F 85, 00000F25(rel)
        mov     rcx, qword [rbx+88H]                    ; 16CB _ 48: 8B. 8B, 00000088
        test    rcx, rcx                                ; 16D2 _ 48: 85. C9
        jne     .text.unlikely+0F1BH                    ; 16D5 _ 0F 85, 00000F1B(rel)
        mov     rcx, qword [rbx+0A8H]                   ; 16DB _ 48: 8B. 8B, 000000A8
        test    rcx, rcx                                ; 16E2 _ 48: 85. C9
        jne     .text.unlikely+0F11H                    ; 16E5 _ 0F 85, 00000F11(rel)
        mov     rcx, qword [rbx+0C8H]                   ; 16EB _ 48: 8B. 8B, 000000C8
        test    rcx, rcx                                ; 16F2 _ 48: 85. C9
        jne     .text.unlikely+0F07H                    ; 16F5 _ 0F 85, 00000F07(rel)
        add     rbx, 224                                ; 16FB _ 48: 81. C3, 000000E0
        cmp     rsi, rbx                                ; 1702 _ 48: 39. DE
        jne     ?_0105                                  ; 1705 _ 0F 85, FFFFFF7B
?_0106: mov     rdx, qword [rel .refptr._ZSt7nothrow]   ; 170B _ 48: 8B. 15, 00000000(rel)
        mov     rcx, rdi                                ; 1712 _ 48: 89. F9
        add     rsp, 56                                 ; 1715 _ 48: 83. C4, 38
        pop     rbx                                     ; 1719 _ 5B
        pop     rsi                                     ; 171A _ 5E
        pop     rdi                                     ; 171B _ 5F
        pop     rbp                                     ; 171C _ 5D
        pop     r12                                     ; 171D _ 41: 5C
        pop     r13                                     ; 171F _ 41: 5D
        jmp     _ZdlPvRKSt9nothrow_t                    ; 1721 _ E9, 00000000(rel)

?_0107: jmp     ?_0106                                  ; 1726 _ EB, E3

?_0108: mov     rdx, rbx                                ; 1728 _ 48: 89. DA
        jmp     ?_0097                                  ; 172B _ E9, FFFFFE38

?_0109: jmp     .text.unlikely+0F9CH                    ; 1730 _ E9, 00000F9C(rel)

?_0110: jmp     .text.unlikely+0F39H                    ; 1735 _ E9, 00000F39(rel)

?_0111: ; Local function
        jmp     .text.unlikely+0F43H                    ; 173A _ E9, 00000F43(rel)

        nop                                             ; 173F _ 90

ALIGN   16
_ZSt24__merge_sort_with_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_NS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_.isra.176:; Local function
        push    r15                                     ; 1740 _ 41: 57
        push    r14                                     ; 1742 _ 41: 56
        push    r13                                     ; 1744 _ 41: 55
        push    r12                                     ; 1746 _ 41: 54
        push    rbp                                     ; 1748 _ 55
        push    rdi                                     ; 1749 _ 57
        push    rsi                                     ; 174A _ 56
        push    rbx                                     ; 174B _ 53
        sub     rsp, 88                                 ; 174C _ 48: 83. EC, 58
        mov     rdi, rdx                                ; 1750 _ 48: 89. D7
        mov     rbp, rcx                                ; 1753 _ 48: 89. CD
        mov     rbx, rdx                                ; 1756 _ 48: 89. D3
        sub     rdi, rcx                                ; 1759 _ 48: 29. CF
        mov     r12, r8                                 ; 175C _ 4D: 89. C4
        mov     rsi, rcx                                ; 175F _ 48: 89. CE
        lea     rax, [r8+rdi]                           ; 1762 _ 49: 8D. 04 38
        mov     r14, rdi                                ; 1766 _ 49: 89. FE
        sar     r14, 5                                  ; 1769 _ 49: C1. FE, 05
        mov     qword [rsp+38H], rax                    ; 176D _ 48: 89. 44 24, 38
?_0112: mov     rdx, rbx                                ; 1772 _ 48: 89. DA
        mov     rcx, rsi                                ; 1775 _ 48: 89. F1
        xor     r8d, r8d                                ; 1778 _ 45: 31. C0
        sub     rdx, rsi                                ; 177B _ 48: 29. F2
        add     rsi, 224                                ; 177E _ 48: 81. C6, 000000E0
        cmp     rdx, 223                                ; 1785 _ 48: 81. FA, 000000DF
        jle     ?_0113                                  ; 178C _ 7E, 0A
        mov     rdx, rsi                                ; 178E _ 48: 89. F2
        call    _ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_; 1791 _ E8, 00000000(rel)
        jmp     ?_0112                                  ; 1796 _ EB, DA

?_0113: ; Local function
        mov     rdx, rbx                                ; 1798 _ 48: 89. DA
        mov     esi, 7                                  ; 179B _ BE, 00000007
        call    _ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_; 17A0 _ E8, 00000000(rel)
?_0114: cmp     r14, rsi                                ; 17A5 _ 49: 39. F6
        jg      ?_0115                                  ; 17A8 _ 7F, 11
        add     rsp, 88                                 ; 17AA _ 48: 83. C4, 58
        pop     rbx                                     ; 17AE _ 5B
        pop     rsi                                     ; 17AF _ 5E
        pop     rdi                                     ; 17B0 _ 5F
        pop     rbp                                     ; 17B1 _ 5D
        pop     r12                                     ; 17B2 _ 41: 5C
        pop     r13                                     ; 17B4 _ 41: 5D
        pop     r14                                     ; 17B6 _ 41: 5E
        pop     r15                                     ; 17B8 _ 41: 5F
        ret                                             ; 17BA _ C3

?_0115: ; Local function
        lea     rdi, [rsi+rsi]                          ; 17BB _ 48: 8D. 3C 36
        mov     r15, rsi                                ; 17BF _ 49: 89. F7
        mov     rcx, rbp                                ; 17C2 _ 48: 89. E9
        mov     r13, rdi                                ; 17C5 _ 49: 89. FD
        shl     r15, 5                                  ; 17C8 _ 49: C1. E7, 05
        mov     rax, r12                                ; 17CC _ 4C: 89. E0
        shl     r13, 5                                  ; 17CF _ 49: C1. E5, 05
        sub     r15, r13                                ; 17D3 _ 4D: 29. EF
        mov     qword [rsp+40H], r15                    ; 17D6 _ 4C: 89. 7C 24, 40
?_0116: mov     rdx, rbx                                ; 17DB _ 48: 89. DA
        sub     rdx, rcx                                ; 17DE _ 48: 29. CA
        sar     rdx, 5                                  ; 17E1 _ 48: C1. FA, 05
        cmp     rdi, rdx                                ; 17E5 _ 48: 39. D7
        jle     ?_0117                                  ; 17E8 _ 7E, 72
        lea     r15, [rdi+rdi]                          ; 17EA _ 4C: 8D. 3C 3F
        cmp     rdx, rsi                                ; 17EE _ 48: 39. F2
        mov     byte [rsp+28H], 0                       ; 17F1 _ C6. 44 24, 28, 00
        mov     r9, rbx                                 ; 17F6 _ 49: 89. D9
        cmovg   rdx, rsi                                ; 17F9 _ 48: 0F 4F. D6
        mov     qword [rsp+20H], rax                    ; 17FD _ 48: 89. 44 24, 20
        mov     rsi, r15                                ; 1802 _ 4C: 89. FE
        shl     rdx, 5                                  ; 1805 _ 48: C1. E2, 05
        add     rdx, rcx                                ; 1809 _ 48: 01. CA
        mov     r8, rdx                                 ; 180C _ 49: 89. D0
        call    _ZSt12__move_mergeIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_NS0_5__ops15_Iter_less_iterEET0_T_SC_SC_SC_SB_T1_; 180F _ E8, 00000000(rel)
        mov     r11, r15                                ; 1814 _ 4D: 89. FB
        mov     rax, rbp                                ; 1817 _ 48: 89. E8
        mov     rcx, r12                                ; 181A _ 4C: 89. E1
        shl     r11, 5                                  ; 181D _ 49: C1. E3, 05
        sub     r13, r11                                ; 1821 _ 4D: 29. DD
        mov     r9, qword [rsp+38H]                     ; 1824 _ 4C: 8B. 4C 24, 38
        mov     rdx, r9                                 ; 1829 _ 4C: 89. CA
        sub     rdx, rcx                                ; 182C _ 48: 29. CA
        sar     rdx, 5                                  ; 182F _ 48: C1. FA, 05
        cmp     r15, rdx                                ; 1833 _ 49: 39. D7
        jle     _ZSt24__merge_sort_with_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_NS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_.isra.176.cold.209; 1836 _ 0F 8E, 00000FAE(rel)
        cmp     rdx, rdi                                ; 183C _ 48: 39. FA
        mov     qword [rsp+20H], rax                    ; 183F _ 48: 89. 44 24, 20
        cmovg   rdx, rdi                                ; 1844 _ 48: 0F 4F. D7
        shl     rdx, 5                                  ; 1848 _ 48: C1. E2, 05
        add     rdx, rcx                                ; 184C _ 48: 01. CA
        mov     r8, rdx                                 ; 184F _ 49: 89. D0
        call    _ZSt12__move_mergeIPN6Search8RootMoveEN9__gnu_cxx17__normal_iteratorIS2_St6vectorIS1_SaIS1_EEEENS3_5__ops15_Iter_less_iterEET0_T_SC_SC_SC_SB_T1_.isra.175; 1852 _ E8, 00000039
        jmp     ?_0114                                  ; 1857 _ E9, FFFFFF49

?_0117: ; Local function
        mov     rdx, qword [rsp+40H]                    ; 185C _ 48: 8B. 54 24, 40
        lea     r15, [rcx+r13]                          ; 1861 _ 4E: 8D. 3C 29
        mov     byte [rsp+28H], 0                       ; 1865 _ C6. 44 24, 28, 00
        mov     qword [rsp+20H], rax                    ; 186A _ 48: 89. 44 24, 20
        mov     r9, r15                                 ; 186F _ 4D: 89. F9
        add     rdx, r15                                ; 1872 _ 4C: 01. FA
        mov     r8, rdx                                 ; 1875 _ 49: 89. D0
        call    _ZSt12__move_mergeIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_NS0_5__ops15_Iter_less_iterEET0_T_SC_SC_SC_SB_T1_; 1878 _ E8, 00000000(rel)
        mov     rcx, r15                                ; 187D _ 4C: 89. F9
        jmp     ?_0116                                  ; 1880 _ E9, FFFFFF56

; Filling space: 0BH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H

ALIGN   16

_ZSt12__move_mergeIPN6Search8RootMoveEN9__gnu_cxx17__normal_iteratorIS2_St6vectorIS1_SaIS1_EEEENS3_5__ops15_Iter_less_iterEET0_T_SC_SC_SC_SB_T1_.isra.175:; Local function
        push    r12                                     ; 1890 _ 41: 54
        push    rbp                                     ; 1892 _ 55
        push    rdi                                     ; 1893 _ 57
        push    rsi                                     ; 1894 _ 56
        push    rbx                                     ; 1895 _ 53
        sub     rsp, 32                                 ; 1896 _ 48: 83. EC, 20
        mov     rax, qword [rsp+70H]                    ; 189A _ 48: 8B. 44 24, 70
        mov     rsi, rcx                                ; 189F _ 48: 89. CE
        mov     r12, rdx                                ; 18A2 _ 49: 89. D4
        mov     rdi, r8                                 ; 18A5 _ 4C: 89. C7
        lea     rbx, [rax+8H]                           ; 18A8 _ 48: 8D. 58, 08
        mov     rbp, r9                                 ; 18AC _ 4C: 89. CD
        jmp     ?_0120                                  ; 18AF _ EB, 2C

?_0118: cmp     rsi, r12                                ; 18B1 _ 4C: 39. E6
        jz      ?_0121                                  ; 18B4 _ 74, 30
        mov     ecx, dword [rdi]                        ; 18B6 _ 8B. 0F
        mov     edx, dword [rsi]                        ; 18B8 _ 8B. 16
        cmp     ecx, edx                                ; 18BA _ 39. D1
        jg      ?_0122                                  ; 18BC _ 7F, 4C
        mov     dword [rbx-8H], edx                     ; 18BE _ 89. 53, F8
        mov     r8d, dword [rsi+4H]                     ; 18C1 _ 44: 8B. 46, 04
        lea     rdx, [rsi+8H]                           ; 18C5 _ 48: 8D. 56, 08
        mov     rcx, rbx                                ; 18C9 _ 48: 89. D9
        add     rsi, 32                                 ; 18CC _ 48: 83. C6, 20
        mov     dword [rbx-4H], r8d                     ; 18D0 _ 44: 89. 43, FC
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 18D4 _ E8, 000020F0(rel)
?_0119: add     rbx, 32                                 ; 18D9 _ 48: 83. C3, 20
?_0120: lea     r8, [rbx-8H]                            ; 18DD _ 4C: 8D. 43, F8
        cmp     rdi, rbp                                ; 18E1 _ 48: 39. EF
        jnz     ?_0118                                  ; 18E4 _ 75, CB
?_0121: mov     rdx, r12                                ; 18E6 _ 4C: 89. E2
        mov     rcx, rsi                                ; 18E9 _ 48: 89. F1
        call    _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_; 18EC _ E8, 00000000(rel)
        mov     rdx, rbp                                ; 18F1 _ 48: 89. EA
        mov     rcx, rdi                                ; 18F4 _ 48: 89. F9
        mov     r8, rax                                 ; 18F7 _ 49: 89. C0
        call    _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_; 18FA _ E8, 00000000(rel)
        add     rsp, 32                                 ; 18FF _ 48: 83. C4, 20
        pop     rbx                                     ; 1903 _ 5B
        pop     rsi                                     ; 1904 _ 5E
        pop     rdi                                     ; 1905 _ 5F
        pop     rbp                                     ; 1906 _ 5D
        pop     r12                                     ; 1907 _ 41: 5C
        ret                                             ; 1909 _ C3

?_0122: ; Local function
        mov     dword [rbx-8H], ecx                     ; 190A _ 89. 4B, F8
        mov     r9d, dword [rdi+4H]                     ; 190D _ 44: 8B. 4F, 04
        lea     rdx, [rdi+8H]                           ; 1911 _ 48: 8D. 57, 08
        mov     rcx, rbx                                ; 1915 _ 48: 89. D9
        add     rdi, 32                                 ; 1918 _ 48: 83. C7, 20
        mov     dword [rbx-4H], r9d                     ; 191C _ 44: 89. 4B, FC
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 1920 _ E8, 000020F0(rel)
        jmp     ?_0119                                  ; 1925 _ EB, B2

        nop                                             ; 1927 _ 90
; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZN6Search8RootMove15insert_pv_in_ttER8Position:; Function begin
        push    r15                                     ; 1930 _ 41: 57
        mov     eax, 10408                              ; 1932 _ B8, 000028A8
        push    r14                                     ; 1937 _ 41: 56
        push    r13                                     ; 1939 _ 41: 55
        push    r12                                     ; 193B _ 41: 54
        push    rbp                                     ; 193D _ 55
        push    rdi                                     ; 193E _ 57
        push    rsi                                     ; 193F _ 56
        push    rbx                                     ; 1940 _ 53
        call    ___chkstk_ms                            ; 1941 _ E8, 00000000(rel)
        sub     rsp, rax                                ; 1946 _ 48: 29. C4
        mov     r15, qword [rcx+10H]                    ; 1949 _ 4C: 8B. 79, 10
        mov     rsi, qword [rcx+8H]                     ; 194D _ 48: 8B. 71, 08
        lea     rbp, [rsp+0A0H]                         ; 1951 _ 48: 8D. AC 24, 000000A0
        mov     rbx, rdx                                ; 1959 _ 48: 89. D3
        mov     r13, rcx                                ; 195C _ 49: 89. CD
        lea     rdx, [rsp+3FH]                          ; 195F _ 48: 8D. 54 24, 3F
        mov     qword [rsp+28H], rdx                    ; 1964 _ 48: 89. 54 24, 28
        lea     r12, [rsp+40H]                          ; 1969 _ 4C: 8D. 64 24, 40
        jmp     ?_0125                                  ; 196E _ EB, 6B

?_0123: mov     r8, qword [rbx+3B8H]                    ; 1970 _ 4C: 8B. 83, 000003B8
        mov     rcx, qword [rel .refptr.TT]             ; 1977 _ 48: 8B. 0D, 00000000(rel)
        mov     edi, dword [rsi]                        ; 197E _ 8B. 3E
        mov     rdx, qword [r8+30H]                     ; 1980 _ 49: 8B. 50, 30
        mov     r8, qword [rsp+28H]                     ; 1984 _ 4C: 8B. 44 24, 28
        call    _ZNK18TranspositionTable5probeEyRb      ; 1989 _ E8, 00000000(rel)
        cmp     byte [rsp+3FH], 0                       ; 198E _ 80. 7C 24, 3F, 00
        je      ?_0128                                  ; 1993 _ 0F 84, 0000008E
        movzx   r9d, word [rax+2H]                      ; 1999 _ 44: 0F B7. 48, 02
        cmp     edi, r9d                                ; 199E _ 44: 39. CF
        jne     ?_0128                                  ; 19A1 _ 0F 85, 00000080
?_0124: mov     rdx, rbx                                ; 19A7 _ 48: 89. DA
        mov     rcx, r12                                ; 19AA _ 4C: 89. E1
        add     rsi, 4                                  ; 19AD _ 48: 83. C6, 04
        call    _ZN9CheckInfoC1ERK8Position             ; 19B1 _ E8, 00000000(rel)
        mov     r8, r12                                 ; 19B6 _ 4D: 89. E0
        mov     edx, edi                                ; 19B9 _ 89. FA
        mov     rcx, rbx                                ; 19BB _ 48: 89. D9
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 19BE _ E8, 00000000(rel)
        lea     r14, [rbp+50H]                          ; 19C3 _ 4C: 8D. 75, 50
        mov     r8, rbp                                 ; 19C7 _ 49: 89. E8
        mov     edx, edi                                ; 19CA _ 89. FA
        movzx   r9d, al                                 ; 19CC _ 44: 0F B6. C8
        mov     rcx, rbx                                ; 19D0 _ 48: 89. D9
        mov     rbp, r14                                ; 19D3 _ 4C: 89. F5
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 19D6 _ E8, 00000000(rel)
?_0125: cmp     r15, rsi                                ; 19DB _ 49: 39. F7
        jnz     ?_0123                                  ; 19DE _ 75, 90
        mov     rsi, qword [r13+10H]                    ; 19E0 _ 49: 8B. 75, 10
        sub     rsi, qword [r13+8H]                     ; 19E4 _ 49: 2B. 75, 08
        mov     rdi, rsi                                ; 19E8 _ 48: 89. F7
        sub     rsi, 4                                  ; 19EB _ 48: 83. EE, 04
        sar     rdi, 2                                  ; 19EF _ 48: C1. FF, 02
        jmp     ?_0127                                  ; 19F3 _ EB, 19

?_0126: mov     rcx, rsi                                ; 19F5 _ 48: 89. F1
        add     rcx, qword [r13+8H]                     ; 19F8 _ 49: 03. 4D, 08
        sub     rdi, 1                                  ; 19FC _ 48: 83. EF, 01
        sub     rsi, 4                                  ; 1A00 _ 48: 83. EE, 04
        mov     edx, dword [rcx]                        ; 1A04 _ 8B. 11
        mov     rcx, rbx                                ; 1A06 _ 48: 89. D9
        call    _ZN8Position9undo_moveE4Move            ; 1A09 _ E8, 00000000(rel)
?_0127: test    rdi, rdi                                ; 1A0E _ 48: 85. FF
        jnz     ?_0126                                  ; 1A11 _ 75, E2
        add     rsp, 10408                              ; 1A13 _ 48: 81. C4, 000028A8
        pop     rbx                                     ; 1A1A _ 5B
        pop     rsi                                     ; 1A1B _ 5E
        pop     rdi                                     ; 1A1C _ 5F
        pop     rbp                                     ; 1A1D _ 5D
        pop     r12                                     ; 1A1E _ 41: 5C
        pop     r13                                     ; 1A20 _ 41: 5D
        pop     r14                                     ; 1A22 _ 41: 5E
        pop     r15                                     ; 1A24 _ 41: 5F
        ret                                             ; 1A26 _ C3
; _ZN6Search8RootMove15insert_pv_in_ttER8Position End of function

?_0128: ; Local function
        mov     r10, qword [rel .refptr.TT]             ; 1A27 _ 4C: 8B. 15, 00000000(rel)
        test    edi, edi                                ; 1A2E _ 85. FF
        mov     r14, qword [rbx+3B8H]                   ; 1A30 _ 4C: 8B. B3, 000003B8
        movzx   ecx, word [rax]                         ; 1A37 _ 0F B7. 08
        movzx   r11d, byte [r10+18H]                    ; 1A3A _ 45: 0F B6. 5A, 18
        mov     rdx, qword [r14+30H]                    ; 1A3F _ 49: 8B. 56, 30
        je      _ZN6Search8RootMove15insert_pv_in_ttER8Position.cold.210; 1A43 _ 0F 84, 00000FE0(rel)
        shr     rdx, 48                                 ; 1A49 _ 48: C1. EA, 30
        mov     word [rax+2H], di                       ; 1A4D _ 66: 89. 78, 02
        cmp     rdx, rcx                                ; 1A51 _ 48: 39. CA
        jne     .text.unlikely+0FF8H                    ; 1A54 _ 0F 85, 00000FF8(rel)
        cmp     byte [rax+9H], -4                       ; 1A5A _ 80. 78, 09, FC
        jl      .text.unlikely+0FF5H                    ; 1A5E _ 0F 8C, 00000FF5(rel)
        jmp     ?_0124                                  ; 1A64 _ E9, FFFFFF3E

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8

_ZN3UCI8print_pvEPcRK8Position5Depth5ValueS5_:; Function begin
        push    r15                                     ; 1A70 _ 41: 57
        push    r14                                     ; 1A72 _ 41: 56
        push    r13                                     ; 1A74 _ 41: 55
        push    r12                                     ; 1A76 _ 41: 54
        push    rbp                                     ; 1A78 _ 55
        push    rdi                                     ; 1A79 _ 57
        push    rsi                                     ; 1A7A _ 56
        push    rbx                                     ; 1A7B _ 53
        sub     rsp, 72                                 ; 1A7C _ 48: 83. EC, 48
        mov     rbx, rdx                                ; 1A80 _ 48: 89. D3
        mov     qword [rsp+38H], rcx                    ; 1A83 _ 48: 89. 4C 24, 38
        mov     r14d, r8d                               ; 1A88 _ 45: 89. C6
        mov     dword [rsp+0A8H], r9d                   ; 1A8B _ 44: 89. 8C 24, 000000A8
        call    _ZNK14TimeManagement7elapsedEv.isra.20.constprop.199; 1A93 _ E8, 00000268
        mov     rbp, qword [rbx+3B0H]                   ; 1A98 _ 48: 8B. AB, 000003B0
        mov     rdx, qword [rel .refptr.Opt]            ; 1A9F _ 48: 8B. 15, 00000000(rel)
        lea     r12d, [rax+1H]                          ; 1AA6 _ 44: 8D. 60, 01
        movsxd  rsi, r12d                               ; 1AAA _ 49: 63. F4
        mov     rdi, qword [rbp+4C0H]                   ; 1AAD _ 48: 8B. BD, 000004C0
        sub     rdi, qword [rbp+4B8H]                   ; 1AB4 _ 48: 2B. BD, 000004B8
        mov     rcx, qword [rdx+10H]                    ; 1ABB _ 48: 8B. 4A, 10
        mov     r15, qword [rbp+0E0H]                   ; 1ABF _ 4C: 8B. BD, 000000E0
        mov     rax, rdi                                ; 1AC6 _ 48: 89. F8
        sar     rax, 5                                  ; 1AC9 _ 48: C1. F8, 05
        cmp     rax, rcx                                ; 1ACD _ 48: 39. C8
        cmovbe  rcx, rax                                ; 1AD0 _ 48: 0F 46. C8
        xor     edi, edi                                ; 1AD4 _ 31. FF
        mov     qword [rsp+20H], rcx                    ; 1AD6 _ 48: 89. 4C 24, 20
        mov     rcx, qword [rel .refptr.Threads]        ; 1ADB _ 48: 8B. 0D, 00000000(rel)
        call    _ZN10ThreadPool14nodes_searchedEv       ; 1AE2 _ E8, 00000000(rel)
        mov     qword [rsp+28H], rax                    ; 1AE7 _ 48: 89. 44 24, 28
        mov     edx, 1000                               ; 1AEC _ BA, 000003E8
        mul     rdx                                     ; 1AF1 _ 48: F7. E2
        div     rsi                                     ; 1AF4 _ 48: F7. F6
        mov     qword [rsp+30H], rax                    ; 1AF7 _ 48: 89. 44 24, 30
        mov     rax, qword [rsp+38H]                    ; 1AFC _ 48: 8B. 44 24, 38
?_0129: cmp     rdi, qword [rsp+20H]                    ; 1B01 _ 48: 3B. 7C 24, 20
        je      ?_0135                                  ; 1B06 _ 0F 84, 000001A8
        lea     r13, [rdi+1H]                           ; 1B0C _ 4C: 8D. 6F, 01
        cmp     rdi, r15                                ; 1B10 _ 4C: 39. FF
        setbe   r8b                                     ; 1B13 _ 41: 0F 96. C0
        cmp     r14d, 1                                 ; 1B17 _ 41: 83. FE, 01
        sete    r9b                                     ; 1B1B _ 41: 0F 94. C1
        cmp     r8b, r9b                                ; 1B1F _ 45: 38. C8
        jc      ?_0134                                  ; 1B22 _ 0F 82, 00000184
        test    r8b, r8b                                ; 1B28 _ 45: 84. C0
        je      .text.unlikely+10C0H                    ; 1B2B _ 0F 84, 000010C0(rel)
        mov     r13, rdi                                ; 1B31 _ 49: 89. FD
        shl     r13, 5                                  ; 1B34 _ 49: C1. E5, 05
        add     r13, qword [rbp+4B8H]                   ; 1B38 _ 4C: 03. AD, 000004B8
        mov     esi, dword [r13]                        ; 1B3F _ 41: 8B. 75, 00
        mov     r13d, r14d                              ; 1B43 _ 45: 89. F5
        cmp     byte [rel _ZN10Tablebases8RootInTBE], 0 ; 1B46 _ 80. 3D, 00000008(rel), 00
        jne     .text.unlikely+1028H                    ; 1B4D _ 0F 85, 00001028(rel)
        lea     rdx, [rel ?_0341]                       ; 1B53 _ 48: 8D. 15, 00000092(rel)
        mov     rcx, rax                                ; 1B5A _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 1B5D _ E8, 00000000(rel)
        mov     edx, r13d                               ; 1B62 _ 44: 89. EA
        lea     r13, [rdi+1H]                           ; 1B65 _ 4C: 8D. 6F, 01
        mov     rcx, rax                                ; 1B69 _ 48: 89. C1
        call    _Z9print_intPci                         ; 1B6C _ E8, 00000000(rel)
        lea     rdx, [rel ?_0342]                       ; 1B71 _ 48: 8D. 15, 0000009E(rel)
        mov     rcx, rax                                ; 1B78 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 1B7B _ E8, 00000000(rel)
        mov     r10, qword [rbx+3B0H]                   ; 1B80 _ 4C: 8B. 93, 000003B0
        mov     rcx, rax                                ; 1B87 _ 48: 89. C1
        mov     edx, dword [r10+0E8H]                   ; 1B8A _ 41: 8B. 92, 000000E8
        call    _Z9print_intPci                         ; 1B91 _ E8, 00000000(rel)
        lea     rdx, [rel ?_0343]                       ; 1B96 _ 48: 8D. 15, 000000A9(rel)
        mov     rcx, rax                                ; 1B9D _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 1BA0 _ E8, 00000000(rel)
        mov     rdx, r13                                ; 1BA5 _ 4C: 89. EA
        mov     rcx, rax                                ; 1BA8 _ 48: 89. C1
        call    _Z9print_intPcy                         ; 1BAB _ E8, 00000000(rel)
        lea     rdx, [rel ?_0344]                       ; 1BB0 _ 48: 8D. 15, 000000B3(rel)
        mov     rcx, rax                                ; 1BB7 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 1BBA _ E8, 00000000(rel)
        mov     edx, esi                                ; 1BBF _ 89. F2
        mov     rcx, rax                                ; 1BC1 _ 48: 89. C1
        call    _ZN3UCI11print_valueEPc5Value           ; 1BC4 _ E8, 00000000(rel)
        cmp     rdi, r15                                ; 1BC9 _ 4C: 39. FF
        jne     ?_0138                                  ; 1BCC _ 0F 85, 00000125
        cmp     esi, dword [rsp+0B0H]                   ; 1BD2 _ 3B. B4 24, 000000B0
        jge     _ZN3UCI8print_pvEPcRK8Position5Depth5ValueS5_.cold.211; 1BD9 _ 0F 8D, 00001014(rel)
        cmp     esi, dword [rsp+0A8H]                   ; 1BDF _ 3B. B4 24, 000000A8
        jle     ?_0137                                  ; 1BE6 _ 0F 8E, 00000106
?_0130: lea     rdx, [rel ?_0336]                       ; 1BEC _ 48: 8D. 15, 0000006C(rel)
        mov     rcx, rax                                ; 1BF3 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 1BF6 _ E8, 00000000(rel)
        mov     rdx, qword [rsp+28H]                    ; 1BFB _ 48: 8B. 54 24, 28
        mov     rcx, rax                                ; 1C00 _ 48: 89. C1
        call    _Z9print_intPcy                         ; 1C03 _ E8, 00000000(rel)
        lea     rdx, [rel ?_0337]                       ; 1C08 _ 48: 8D. 15, 00000074(rel)
        mov     rcx, rax                                ; 1C0F _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 1C12 _ E8, 00000000(rel)
        mov     rdx, qword [rsp+30H]                    ; 1C17 _ 48: 8B. 54 24, 30
        mov     rcx, rax                                ; 1C1C _ 48: 89. C1
        call    _Z9print_intPcy                         ; 1C1F _ E8, 00000000(rel)
        cmp     r12d, 2000                              ; 1C24 _ 41: 81. FC, 000007D0
        jg      ?_0136                                  ; 1C2B _ 0F 8F, 00000094
?_0131: lea     rdx, [rel ?_0339]                       ; 1C31 _ 48: 8D. 15, 00000085(rel)
        mov     rcx, rax                                ; 1C38 _ 48: 89. C1
        shl     rdi, 5                                  ; 1C3B _ 48: C1. E7, 05
        call    _Z12print_stringPcPKc                   ; 1C3F _ E8, 00000000(rel)
        mov     rdx, qword [rel _ZN10Tablebases4HitsE]  ; 1C44 _ 48: 8B. 15, 00000010(rel)
        mov     rcx, rax                                ; 1C4B _ 48: 89. C1
        call    _Z9print_intPcy                         ; 1C4E _ E8, 00000000(rel)
        lea     rdx, [rel ?_0332]                       ; 1C53 _ 48: 8D. 15, 00000033(rel)
        mov     rcx, rax                                ; 1C5A _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 1C5D _ E8, 00000000(rel)
        mov     edx, r12d                               ; 1C62 _ 44: 89. E2
        mov     rcx, rax                                ; 1C65 _ 48: 89. C1
        call    _Z9print_intPci                         ; 1C68 _ E8, 00000000(rel)
        lea     rdx, [rel ?_0340]                       ; 1C6D _ 48: 8D. 15, 0000008E(rel)
        mov     rcx, rax                                ; 1C74 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 1C77 _ E8, 00000000(rel)
        add     rdi, qword [rbp+4B8H]                   ; 1C7C _ 48: 03. BD, 000004B8
        mov     rsi, qword [rdi+10H]                    ; 1C83 _ 48: 8B. 77, 10
        mov     rdi, qword [rdi+8H]                     ; 1C87 _ 48: 8B. 7F, 08
        jmp     ?_0133                                  ; 1C8B _ EB, 1A

?_0132: mov     edx, dword [rdi]                        ; 1C8D _ 8B. 17
        mov     byte [rax], 32                          ; 1C8F _ C6. 00, 20
        lea     rcx, [rax+1H]                           ; 1C92 _ 48: 8D. 48, 01
        add     rdi, 4                                  ; 1C96 _ 48: 83. C7, 04
        movzx   r8d, byte [rbx+3C0H]                    ; 1C9A _ 44: 0F B6. 83, 000003C0
        call    _ZN3UCI10print_moveEPc4Moveb            ; 1CA2 _ E8, 00000000(rel)
?_0133: cmp     rsi, rdi                                ; 1CA7 _ 48: 39. FE
        jnz     ?_0132                                  ; 1CAA _ 75, E1
?_0134: mov     rdi, r13                                ; 1CAC _ 4C: 89. EF
        jmp     ?_0129                                  ; 1CAF _ E9, FFFFFE4D

?_0135: add     rsp, 72                                 ; 1CB4 _ 48: 83. C4, 48
        pop     rbx                                     ; 1CB8 _ 5B
        pop     rsi                                     ; 1CB9 _ 5E
        pop     rdi                                     ; 1CBA _ 5F
        pop     rbp                                     ; 1CBB _ 5D
        pop     r12                                     ; 1CBC _ 41: 5C
        pop     r13                                     ; 1CBE _ 41: 5D
        pop     r14                                     ; 1CC0 _ 41: 5E
        pop     r15                                     ; 1CC2 _ 41: 5F
        ret                                             ; 1CC4 _ C3

?_0136: lea     rdx, [rel ?_0338]                       ; 1CC5 _ 48: 8D. 15, 0000007A(rel)
        mov     rcx, rax                                ; 1CCC _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 1CCF _ E8, 00000000(rel)
        mov     rcx, qword [rel .refptr.TT]             ; 1CD4 _ 48: 8B. 0D, 00000000(rel)
        mov     rsi, rax                                ; 1CDB _ 48: 89. C6
        call    _ZNK18TranspositionTable8hashfullEv     ; 1CDE _ E8, 00000000(rel)
        mov     rcx, rsi                                ; 1CE3 _ 48: 89. F1
        mov     edx, eax                                ; 1CE6 _ 89. C2
        call    _Z9print_intPci                         ; 1CE8 _ E8, 00000000(rel)
        jmp     ?_0131                                  ; 1CED _ E9, FFFFFF3F

?_0137: jmp     .text.unlikely+10DBH                    ; 1CF2 _ E9, 000010DB(rel)
; _ZN3UCI8print_pvEPcRK8Position5Depth5ValueS5_ End of function

?_0138: ; Local function
        jmp     ?_0130                                  ; 1CF7 _ E9, FFFFFEF0

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_ZNK14TimeManagement7elapsedEv.isra.20.constprop.199:; Local function
        sub     rsp, 40                                 ; 1D00 _ 48: 83. EC, 28
        cmp     dword [rel ?_0175], 0                   ; 1D04 _ 83. 3D, 00000067(rel), 00
        jne     _ZNK14TimeManagement7elapsedEv.isra.20.constprop.199.cold.212; 1D0B _ 0F 85, 000010F0(rel)
        call    _Z3nowv                                 ; 1D11 _ E8, 00000000(rel)
        mov     rdx, qword [rel .refptr.Time]           ; 1D16 _ 48: 8B. 15, 00000000(rel)
        sub     eax, dword [rdx+8H]                     ; 1D1D _ 2B. 42, 08
        add     rsp, 40                                 ; 1D20 _ 48: 83. C4, 28
        ret                                             ; 1D24 _ C3

        nop                                             ; 1D25 _ 90
; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

_ZN9__gnu_cxx13new_allocatorI4MoveE8allocateEyPKv.isra.146:; Local function
        sub     rsp, 40                                 ; 1D30 _ 48: 83. EC, 28
        mov     rax, qword 3FFFFFFFFFFFFFFFH            ; 1D34 _ 48: B8, 3FFFFFFFFFFFFFFF
        cmp     rcx, rax                                ; 1D3E _ 48: 39. C1
        ja      _ZN9__gnu_cxx13new_allocatorI4MoveE8allocateEyPKv.isra.146.cold.213; 1D41 _ 0F 87, 00001102(rel)
        shl     rcx, 2                                  ; 1D47 _ 48: C1. E1, 02
        add     rsp, 40                                 ; 1D4B _ 48: 83. C4, 28
        jmp     _Znwy                                   ; 1D4F _ E9, 00000000(rel)

; Filling space: 0CH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H
;       db 00H, 00H, 00H, 00H

ALIGN   16

_ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth:; Local function
        push    r15                                     ; 1D60 _ 41: 57
        push    r14                                     ; 1D62 _ 41: 56
        push    r13                                     ; 1D64 _ 41: 55
        push    r12                                     ; 1D66 _ 41: 54
        push    rbp                                     ; 1D68 _ 55
        push    rdi                                     ; 1D69 _ 57
        push    rsi                                     ; 1D6A _ 56
        push    rbx                                     ; 1D6B _ 53
        sub     rsp, 3016                               ; 1D6C _ 48: 81. EC, 00000BC8
        mov     r12d, dword [rsp+0C30H]                 ; 1D73 _ 44: 8B. A4 24, 00000C30
        mov     rdi, rdx                                ; 1D7B _ 48: 89. D7
        mov     rsi, rcx                                ; 1D7E _ 48: 89. CE
        mov     dword [rsp+0C20H], r8d                  ; 1D81 _ 44: 89. 84 24, 00000C20
        lea     rax, [rsp+130H]                         ; 1D89 _ 48: 8D. 84 24, 00000130
        mov     ecx, dword [rdi-20H]                    ; 1D91 _ 8B. 4F, E0
        mov     dword [rsp+0C28H], r9d                  ; 1D94 _ 44: 89. 8C 24, 00000C28
        mov     qword [rdx+28H], rax                    ; 1D9C _ 48: 89. 42, 28
        mov     rdx, qword [rdx]                        ; 1DA0 _ 48: 8B. 12
        add     ecx, 1                                  ; 1DA3 _ 83. C1, 01
        mov     dword [rdx], 0                          ; 1DA6 _ C7. 02, 00000000
        mov     dword [rdi+8H], ecx                     ; 1DAC _ 89. 4F, 08
        mov     rcx, rsi                                ; 1DAF _ 48: 89. F1
        mov     dword [rdi+0CH], 0                      ; 1DB2 _ C7. 47, 0C, 00000000
        call    _ZNK8Position7is_drawEv                 ; 1DB9 _ E8, 00000000(rel)
        test    al, al                                  ; 1DBE _ 84. C0
        jne     ?_0162                                  ; 1DC0 _ 0F 85, 000003E0
        cmp     dword [rdi+8H], 127                     ; 1DC6 _ 83. 7F, 08, 7F
        jg      ?_0162                                  ; 1DCA _ 0F 8F, 000003D6
        mov     rbx, qword [rsi+3B8H]                   ; 1DD0 _ 48: 8B. 9E, 000003B8
        lea     r8, [rsp+7FH]                           ; 1DD7 _ 4C: 8D. 44 24, 7F
        mov     rcx, qword [rel .refptr.TT]             ; 1DDC _ 48: 8B. 0D, 00000000(rel)
        mov     rbp, qword [rbx+30H]                    ; 1DE3 _ 48: 8B. 6B, 30
        mov     rdx, rbp                                ; 1DE7 _ 48: 89. EA
        mov     qword [rsp+58H], rbp                    ; 1DEA _ 48: 89. 6C 24, 58
        call    _ZNK18TranspositionTable5probeEyRb      ; 1DEF _ E8, 00000000(rel)
        xor     r8d, r8d                                ; 1DF4 _ 45: 31. C0
        cmp     byte [rsp+7FH], 0                       ; 1DF7 _ 80. 7C 24, 7F, 00
        mov     rbp, rax                                ; 1DFC _ 48: 89. C5
        jz      ?_0139                                  ; 1DFF _ 74, 05
        movzx   r8d, word [rbp+2H]                      ; 1E01 _ 44: 0F B7. 45, 02
?_0139: mov     r9d, dword [rdi-1CH]                    ; 1E06 _ 44: 8B. 4F, E4
        mov     dword [rdi+1CH], 32002                  ; 1E0A _ C7. 47, 1C, 00007D02
        mov     rdx, rsi                                ; 1E11 _ 48: 89. F2
        mov     ebx, 4294935295                         ; 1E14 _ BB, FFFF82FF
        lea     r14, [rsp+340H]                         ; 1E19 _ 4C: 8D. B4 24, 00000340
        lea     r15, [rsp+80H]                          ; 1E21 _ 4C: 8D. BC 24, 00000080
        mov     rcx, r14                                ; 1E29 _ 4C: 89. F1
        and     r9d, 3FH                                ; 1E2C _ 41: 83. E1, 3F
        mov     qword [rsp+28H], r9                     ; 1E30 _ 4C: 89. 4C 24, 28
        mov     r10, qword [rsi+3B0H]                   ; 1E35 _ 4C: 8B. 96, 000003B0
        mov     r9d, r12d                               ; 1E3C _ 45: 89. E1
        lea     r12d, [r12-1H]                          ; 1E3F _ 45: 8D. 64 24, FF
        add     r10, 1236                               ; 1E44 _ 49: 81. C2, 000004D4
        mov     qword [rsp+20H], r10                    ; 1E4B _ 4C: 89. 54 24, 20
        call    _ZN10MovePickerC1ERK8Position4Move5DepthRK5StatsI5ValueLb0EE6Square; 1E50 _ E8, 00000000(rel)
        lea     r8, [rsp+0D0H]                          ; 1E55 _ 4C: 8D. 84 24, 000000D0
        mov     rdx, rsi                                ; 1E5D _ 48: 89. F2
        mov     rcx, r8                                 ; 1E60 _ 4C: 89. C1
        mov     qword [rsp+60H], r8                     ; 1E63 _ 4C: 89. 44 24, 60
        call    _ZN9CheckInfoC1ERK8Position             ; 1E68 _ E8, 00000000(rel)
        mov     eax, dword [rsp+0C28H]                  ; 1E6D _ 8B. 84 24, 00000C28
        lea     rdx, [rdi+28H]                          ; 1E74 _ 48: 8D. 57, 28
        mov     dword [rsp+68H], 0                      ; 1E78 _ C7. 44 24, 68, 00000000
        mov     r11d, dword [rsp+0C20H]                 ; 1E80 _ 44: 8B. 9C 24, 00000C20
        mov     qword [rsp+40H], r15                    ; 1E88 _ 4C: 89. 7C 24, 40
        mov     r13, qword [rel .refptr.TT]             ; 1E8D _ 4C: 8B. 2D, 00000000(rel)
        mov     qword [rsp+48H], rdx                    ; 1E94 _ 48: 89. 54 24, 48
        mov     dword [rsp+54H], r12d                   ; 1E99 _ 44: 89. 64 24, 54
        neg     eax                                     ; 1E9E _ F7. D8
        mov     dword [rsp+3CH], r11d                   ; 1EA0 _ 44: 89. 5C 24, 3C
        mov     dword [rsp+50H], eax                    ; 1EA5 _ 89. 44 24, 50
?_0140: mov     rcx, r14                                ; 1EA9 _ 4C: 89. F1
        call    _ZN10MovePicker9next_moveEv             ; 1EAC _ E8, 00000000(rel)
        test    eax, eax                                ; 1EB1 _ 85. C0
        mov     r15d, eax                               ; 1EB3 _ 41: 89. C7
        je      ?_0154                                  ; 1EB6 _ 0F 84, 00000208
        mov     r9d, r15d                               ; 1EBC _ 45: 89. F9
        and     r9d, 0C000H                             ; 1EBF _ 41: 81. E1, 0000C000
        jne     ?_0161                                  ; 1EC6 _ 0F 85, 000002B8
        cmp     qword [rsp+0D0H], 0                     ; 1ECC _ 48: 83. BC 24, 000000D0, 00
        jne     ?_0161                                  ; 1ED5 _ 0F 85, 000002A9
        mov     ecx, r15d                               ; 1EDB _ 44: 89. F9
        mov     rax, qword [rel .refptr.SquareBB]       ; 1EDE _ 48: 8B. 05, 00000000(rel)
        mov     r8d, r15d                               ; 1EE5 _ 45: 89. F8
        sar     ecx, 6                                  ; 1EE8 _ C1. F9, 06
        and     r8d, 3FH                                ; 1EEB _ 41: 83. E0, 3F
        and     ecx, 3FH                                ; 1EEF _ 83. E1, 3F
        mov     r10d, dword [rsi+rcx*4]                 ; 1EF2 _ 44: 8B. 14 8E
        and     r10d, 07H                               ; 1EF6 _ 41: 83. E2, 07
        mov     r11, qword [rsp+r10*8+0E0H]             ; 1EFA _ 4E: 8B. 9C D4, 000000E0
        test    qword [rax+r8*8], r11                   ; 1F02 _ 4E: 85. 1C C0
        setne   r12b                                    ; 1F06 _ 41: 0F 95. C4
?_0141: cmp     ebx, -31743                             ; 1F0A _ 81. FB, FFFF8401
        jge     ?_0149                                  ; 1F10 _ 0F 8D, 00000152
?_0142: mov     edx, r15d                               ; 1F16 _ 44: 89. FA
        mov     rcx, rsi                                ; 1F19 _ 48: 89. F1
        call    _ZNK8Position9key_afterE4Move           ; 1F1C _ E8, 00000000(rel)
        mov     r9, qword [r13]                         ; 1F21 _ 4D: 8B. 4D, 00
        mov     edx, r15d                               ; 1F25 _ 44: 89. FA
        mov     r8, qword [rsp+0D8H]                    ; 1F28 _ 4C: 8B. 84 24, 000000D8
        lea     rcx, [r9-1H]                            ; 1F30 _ 49: 8D. 49, FF
        and     rax, rcx                                ; 1F34 _ 48: 21. C8
        mov     rcx, rsi                                ; 1F37 _ 48: 89. F1
        shl     rax, 5                                  ; 1F3A _ 48: C1. E0, 05
        add     rax, qword [r13+8H]                     ; 1F3E _ 49: 03. 45, 08
        prefetcht0 [rax]                                ; 1F42 _ 0F 18. 08
        call    _ZNK8Position5legalE4Movey              ; 1F45 _ E8, 00000000(rel)
        test    al, al                                  ; 1F4A _ 84. C0
        je      ?_0140                                  ; 1F4C _ 0F 84, FFFFFF57
        mov     r8, qword [rsp+40H]                     ; 1F52 _ 4C: 8B. 44 24, 40
        movzx   r9d, r12b                               ; 1F57 _ 45: 0F B6. CC
        mov     edx, r15d                               ; 1F5B _ 44: 89. FA
        mov     rcx, rsi                                ; 1F5E _ 48: 89. F1
        mov     dword [rdi+0CH], r15d                   ; 1F61 _ 44: 89. 7F, 0C
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 1F65 _ E8, 00000000(rel)
        mov     r9d, dword [rsp+3CH]                    ; 1F6A _ 44: 8B. 4C 24, 3C
        mov     rcx, rsi                                ; 1F6F _ 48: 89. F1
        mov     r10d, dword [rsp+54H]                   ; 1F72 _ 44: 8B. 54 24, 54
        mov     r8d, dword [rsp+50H]                    ; 1F77 _ 44: 8B. 44 24, 50
        mov     rdx, qword [rsp+48H]                    ; 1F7C _ 48: 8B. 54 24, 48
        neg     r9d                                     ; 1F81 _ 41: F7. D9
        test    r12b, r12b                              ; 1F84 _ 45: 84. E4
        mov     dword [rsp+20H], r10d                   ; 1F87 _ 44: 89. 54 24, 20
        jne     ?_0163                                  ; 1F8C _ 0F 85, 0000022A
        call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 1F92 _ E8, FFFFEB89
        neg     eax                                     ; 1F97 _ F7. D8
        mov     r12d, eax                               ; 1F99 _ 41: 89. C4
?_0143: mov     edx, r15d                               ; 1F9C _ 44: 89. FA
        mov     rcx, rsi                                ; 1F9F _ 48: 89. F1
        call    _ZN8Position9undo_moveE4Move            ; 1FA2 _ E8, 00000000(rel)
        cmp     r12d, ebx                               ; 1FA7 _ 41: 39. DC
        jle     ?_0153                                  ; 1FAA _ 0F 8E, 0000010F
        cmp     r12d, dword [rsp+3CH]                   ; 1FB0 _ 44: 3B. 64 24, 3C
        jle     ?_0152                                  ; 1FB5 _ 0F 8E, 000000FC
        mov     rbx, qword [rdi]                        ; 1FBB _ 48: 8B. 1F
        mov     rax, qword [rdi+28H]                    ; 1FBE _ 48: 8B. 47, 28
        lea     rdx, [rbx+4H]                           ; 1FC2 _ 48: 8D. 53, 04
        mov     dword [rbx], r15d                       ; 1FC6 _ 44: 89. 3B
?_0144: test    rax, rax                                ; 1FC9 _ 48: 85. C0
        jz      ?_0145                                  ; 1FCC _ 74, 0C
        mov     r8d, dword [rax]                        ; 1FCE _ 44: 8B. 00
        test    r8d, r8d                                ; 1FD1 _ 45: 85. C0
        jne     ?_0160                                  ; 1FD4 _ 0F 85, 00000199
?_0145: cmp     r12d, dword [rsp+0C28H]                 ; 1FDA _ 44: 3B. A4 24, 00000C28
        mov     dword [rdx], 0                          ; 1FE2 _ C7. 02, 00000000
        jl      ?_0151                                  ; 1FE8 _ 0F 8C, 000000BF
        cmp     r12d, 31743                             ; 1FEE _ 41: 81. FC, 00007BFF
        mov     r14d, dword [rdi+1CH]                   ; 1FF5 _ 44: 8B. 77, 1C
        movzx   r13d, byte [r13+18H]                    ; 1FF9 _ 45: 0F B6. 6D, 18
        mov     edi, dword [rdi+8H]                     ; 1FFE _ 8B. 7F, 08
        jg      ?_0165                                  ; 2001 _ 0F 8F, 000001D1
        mov     esi, r12d                               ; 2007 _ 44: 89. E6
        sub     esi, edi                                ; 200A _ 29. FE
        cmp     r12d, -31744                            ; 200C _ 41: 81. FC, FFFF8400
        mov     edi, esi                                ; 2013 _ 89. F7
        cmovg   edi, r12d                               ; 2015 _ 41: 0F 4F. FC
        mov     word [rbp+2H], r15w                     ; 2019 _ 66 44: 89. 7D, 02
        mov     r15, qword [rsp+58H]                    ; 201E _ 4C: 8B. 7C 24, 58
        movzx   r11d, word [rbp]                        ; 2023 _ 44: 0F B7. 5D, 00
        shr     r15, 48                                 ; 2028 _ 49: C1. EF, 30
        cmp     r15, r11                                ; 202C _ 4D: 39. DF
        jnz     ?_0146                                  ; 202F _ 75, 06
        cmp     byte [rbp+9H], 1                        ; 2031 _ 80. 7D, 09, 01
        jg      ?_0147                                  ; 2035 _ 7F, 1A
?_0146: or      r13d, 02H                               ; 2037 _ 41: 83. CD, 02
        mov     word [rbp], r15w                        ; 203B _ 66 44: 89. 7D, 00
        mov     word [rbp+4H], di                       ; 2040 _ 66: 89. 7D, 04
        mov     word [rbp+6H], r14w                     ; 2044 _ 66 44: 89. 75, 06
        mov     byte [rbp+8H], r13b                     ; 2049 _ 44: 88. 6D, 08
        mov     byte [rbp+9H], 0                        ; 204D _ C6. 45, 09, 00
?_0147: mov     eax, r12d                               ; 2051 _ 44: 89. E0
?_0148: add     rsp, 3016                               ; 2054 _ 48: 81. C4, 00000BC8
        pop     rbx                                     ; 205B _ 5B
        pop     rsi                                     ; 205C _ 5E
        pop     rdi                                     ; 205D _ 5F
        pop     rbp                                     ; 205E _ 5D
        pop     r12                                     ; 205F _ 41: 5C
        pop     r13                                     ; 2061 _ 41: 5D
        pop     r14                                     ; 2063 _ 41: 5E
        pop     r15                                     ; 2065 _ 41: 5F
        ret                                             ; 2067 _ C3

?_0149: mov     edx, r15d                               ; 2068 _ 44: 89. FA
        and     edx, 3FH                                ; 206B _ 83. E2, 3F
        cmp     dword [rsi+rdx*4], 0                    ; 206E _ 83. 3C 96, 00
        jz      ?_0150                                  ; 2072 _ 74, 0D
        cmp     r9d, 49152                              ; 2074 _ 41: 81. F9, 0000C000
        jne     ?_0142                                  ; 207B _ 0F 85, FFFFFE95
?_0150: sub     r9d, 16384                              ; 2081 _ 41: 81. E9, 00004000
        and     r9d, 0FFFF8000H                         ; 2088 _ 41: 81. E1, FFFF8000
        je      ?_0142                                  ; 208F _ 0F 84, FFFFFE81
        mov     edx, r15d                               ; 2095 _ 44: 89. FA
        mov     rcx, rsi                                ; 2098 _ 48: 89. F1
        call    _ZNK8Position8see_signE4Move            ; 209B _ E8, 00000000(rel)
        test    eax, eax                                ; 20A0 _ 85. C0
        jns     ?_0142                                  ; 20A2 _ 0F 89, FFFFFE6E
        jmp     ?_0140                                  ; 20A8 _ E9, FFFFFDFC

?_0151: mov     dword [rsp+68H], r15d                   ; 20AD _ 44: 89. 7C 24, 68
        mov     dword [rsp+3CH], r12d                   ; 20B2 _ 44: 89. 64 24, 3C
?_0152: mov     ebx, r12d                               ; 20B7 _ 44: 89. E3
        jmp     ?_0140                                  ; 20BA _ E9, FFFFFDEA

?_0153: mov     r12d, ebx                               ; 20BF _ 41: 89. DC
        jmp     ?_0152                                  ; 20C2 _ EB, F3

?_0154: cmp     ebx, -32001                             ; 20C4 _ 81. FB, FFFF82FF
        je      ?_0164                                  ; 20CA _ 0F 84, 000000FB
        xor     ecx, ecx                                ; 20D0 _ 31. C9
        cmp     dword [rsp+0C20H], ebx                  ; 20D2 _ 39. 9C 24, 00000C20
        mov     r13, qword [rel .refptr.TT]             ; 20D9 _ 4C: 8B. 2D, 00000000(rel)
        mov     esi, dword [rdi+1CH]                    ; 20E0 _ 8B. 77, 1C
        mov     r10d, dword [rdi+8H]                    ; 20E3 _ 44: 8B. 57, 08
        setl    cl                                      ; 20E7 _ 0F 9C. C1
        cmp     ebx, 31743                              ; 20EA _ 81. FB, 00007BFF
        movzx   r14d, byte [r13+18H]                    ; 20F0 _ 45: 0F B6. 75, 18
        lea     r9d, [rcx+rcx+1H]                       ; 20F5 _ 44: 8D. 4C 09, 01
        jg      _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth.cold.216; 20FA _ 0F 8F, 000012F6(rel)
        mov     edi, ebx                                ; 2100 _ 89. DF
        sub     edi, r10d                               ; 2102 _ 44: 29. D7
        cmp     ebx, -31744                             ; 2105 _ 81. FB, FFFF8400
        mov     r10d, edi                               ; 210B _ 41: 89. FA
        cmovg   r10d, ebx                               ; 210E _ 44: 0F 4F. D3
        cmp     dword [rsp+68H], 0                      ; 2112 _ 83. 7C 24, 68, 00
        movzx   r8d, word [rbp]                         ; 2117 _ 44: 0F B7. 45, 00
        jnz     ?_0155                                  ; 211C _ 75, 0E
        mov     r11, qword [rsp+58H]                    ; 211E _ 4C: 8B. 5C 24, 58
        shr     r11, 48                                 ; 2123 _ 49: C1. EB, 30
        cmp     r11, r8                                 ; 2127 _ 4D: 39. C3
        jz      ?_0156                                  ; 212A _ 74, 17
?_0155: mov     rdx, qword [rsp+58H]                    ; 212C _ 48: 8B. 54 24, 58
        movzx   eax, word [rsp+68H]                     ; 2131 _ 0F B7. 44 24, 68
        shr     rdx, 48                                 ; 2136 _ 48: C1. EA, 30
        cmp     rdx, r8                                 ; 213A _ 4C: 39. C2
        mov     word [rbp+2H], ax                       ; 213D _ 66: 89. 45, 02
        jnz     ?_0159                                  ; 2141 _ 75, 16
?_0156: cmp     r9d, 3                                  ; 2143 _ 41: 83. F9, 03
        jz      ?_0158                                  ; 2147 _ 74, 0D
        cmp     byte [rbp+9H], 1                        ; 2149 _ 80. 7D, 09, 01
        jle     ?_0158                                  ; 214D _ 7E, 07
?_0157: mov     eax, ebx                                ; 214F _ 89. D8
        jmp     ?_0148                                  ; 2151 _ E9, FFFFFEFE

?_0158: mov     rdx, r8                                 ; 2156 _ 4C: 89. C2
?_0159: or      r9d, r14d                               ; 2159 _ 45: 09. F1
        mov     word [rbp], dx                          ; 215C _ 66: 89. 55, 00
        mov     word [rbp+4H], r10w                     ; 2160 _ 66 44: 89. 55, 04
        mov     word [rbp+6H], si                       ; 2165 _ 66: 89. 75, 06
        mov     byte [rbp+8H], r9b                      ; 2169 _ 44: 88. 4D, 08
        mov     byte [rbp+9H], 0                        ; 216D _ C6. 45, 09, 00
        jmp     ?_0157                                  ; 2171 _ EB, DC

?_0160: add     rdx, 4                                  ; 2173 _ 48: 83. C2, 04
        add     rax, 4                                  ; 2177 _ 48: 83. C0, 04
        mov     dword [rdx-4H], r8d                     ; 217B _ 44: 89. 42, FC
        jmp     ?_0144                                  ; 217F _ E9, FFFFFE45

?_0161: mov     r8, qword [rsp+60H]                     ; 2184 _ 4C: 8B. 44 24, 60
        mov     edx, r15d                               ; 2189 _ 44: 89. FA
        mov     rcx, rsi                                ; 218C _ 48: 89. F1
        mov     dword [rsp+6CH], r9d                    ; 218F _ 44: 89. 4C 24, 6C
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 2194 _ E8, 00000000(rel)
        mov     r9d, dword [rsp+6CH]                    ; 2199 _ 44: 8B. 4C 24, 6C
        mov     r12d, eax                               ; 219E _ 41: 89. C4
        jmp     ?_0141                                  ; 21A1 _ E9, FFFFFD64

?_0162: mov     ebp, dword [rsi+3ACH]                   ; 21A6 _ 8B. AE, 000003AC
        lea     r9, [rel _ZN12_GLOBAL__N_19DrawValueE]  ; 21AC _ 4C: 8D. 0D, 004000C0(rel)
        mov     eax, dword [r9+rbp*4]                   ; 21B3 _ 41: 8B. 04 A9
        jmp     ?_0148                                  ; 21B7 _ E9, FFFFFE98

?_0163: call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 21BC _ E8, FFFFFB9F
        neg     eax                                     ; 21C1 _ F7. D8
        mov     r12d, eax                               ; 21C3 _ 41: 89. C4
        jmp     ?_0143                                  ; 21C6 _ E9, FFFFFDD1

?_0164: mov     eax, dword [rdi+8H]                     ; 21CB _ 8B. 47, 08
        sub     eax, 32000                              ; 21CE _ 2D, 00007D00
        jmp     ?_0148                                  ; 21D3 _ E9, FFFFFE7C

?_0165: ; Local function
        jmp     .text.unlikely+12FEH                    ; 21D8 _ E9, 000012FE(rel)

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8

_ZN12_GLOBAL__N_110check_timeEv:; Local function
        sub     rsp, 40                                 ; 21E0 _ 48: 83. EC, 28
        call    _ZNK14TimeManagement7elapsedEv.isra.20.constprop.199; 21E4 _ E8, FFFFFB17
        cmp     dword [rel ?_0181], 0                   ; 21E9 _ 83. 3D, 0000007F(rel), 00
        jnz     ?_0166                                  ; 21F0 _ 75, 45
        mov     r9d, dword [rel ?_0178]                 ; 21F2 _ 44: 8B. 0D, 00000074(rel)
        mov     edx, dword [rel ?_0179]                 ; 21F9 _ 8B. 15, 00000078(rel)
        mov     r8, qword [rel ?_0182]                  ; 21FF _ 4C: 8B. 05, 00000088(rel)
        movsxd  rcx, dword [rel ?_0180]                 ; 2206 _ 48: 63. 0D, 0000007C(rel)
        or      edx, r9d                                ; 220D _ 44: 09. CA
        or      edx, dword [rel ?_0177]                 ; 2210 _ 0B. 15, 00000070(rel)
        or      rcx, r8                                 ; 2216 _ 4C: 09. C1
        movsxd  r10, edx                                ; 2219 _ 4C: 63. D2
        or      rcx, r10                                ; 221C _ 4C: 09. D1
        je      _ZN12_GLOBAL__N_110check_timeEv.cold.217; 221F _ 0F 84, 00001306(rel)
        cmp     eax, r9d                                ; 2225 _ 44: 39. C8
        jge     .text.unlikely+1328H                    ; 2228 _ 0F 8D, 00001328(rel)
        test    r8, r8                                  ; 222E _ 4D: 85. C0
        jne     .text.unlikely+1333H                    ; 2231 _ 0F 85, 00001333(rel)
?_0166: add     rsp, 40                                 ; 2237 _ 48: 83. C4, 28
        ret                                             ; 223B _ C3

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

__tcf_2:; Local function
        push    rsi                                     ; 2240 _ 56
        push    rbx                                     ; 2241 _ 53
        sub     rsp, 40                                 ; 2242 _ 48: 83. EC, 28
        lea     rsi, [rel ?_0245]                       ; 2246 _ 48: 8D. 35, 004002C8(rel)
        xor     ebx, ebx                                ; 224D _ 31. DB
?_0167: mov     rcx, qword [rsi+rbx]                    ; 224F _ 48: 8B. 0C 1E
        test    rcx, rcx                                ; 2253 _ 48: 85. C9
        jz      ?_0168                                  ; 2256 _ 74, 05
        call    _ZdlPv                                  ; 2258 _ E8, 00000000(rel)
?_0168: sub     rbx, 24                                 ; 225D _ 48: 83. EB, 18
        cmp     rbx, -480                               ; 2261 _ 48: 81. FB, FFFFFE20
        jnz     ?_0167                                  ; 2268 _ 75, E5
        add     rsp, 40                                 ; 226A _ 48: 83. C4, 28
        pop     rbx                                     ; 226E _ 5B
        pop     rsi                                     ; 226F _ 5E
        ret                                             ; 2270 _ C3

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 66H, 2EH, 0FH
;       db 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

__tcf_1:; Local function
        push    rdi                                     ; 2280 _ 57
        push    rsi                                     ; 2281 _ 56
        push    rbx                                     ; 2282 _ 53
        sub     rsp, 32                                 ; 2283 _ 48: 83. EC, 20
        mov     rbx, qword [rel _ZN6Search11SetupStatesE]; 2287 _ 48: 8B. 1D, 00000020(rel)
        test    rbx, rbx                                ; 228E _ 48: 85. DB
        jne     __tcf_1.cold.218                        ; 2291 _ 0F 85, 0000134E(rel)
        add     rsp, 32                                 ; 2297 _ 48: 83. C4, 20
        pop     rbx                                     ; 229B _ 5B
        pop     rsi                                     ; 229C _ 5E
        pop     rdi                                     ; 229D _ 5F
        ret                                             ; 229E _ C3

        nop                                             ; 229F _ 90

ALIGN   16
__tcf_0:; Local function
        mov     rcx, qword [rel _ZN6Search6LimitsE]     ; 22A0 _ 48: 8B. 0D, 00000040(rel)
        test    rcx, rcx                                ; 22A7 _ 48: 85. C9
        jne     __tcf_0.cold.219                        ; 22AA _ 0F 85, 0000138A(rel)
        ret                                             ; 22B0 _ C3

        nop                                             ; 22B1 _ 90
        nop                                             ; 22B2 _ 90
        nop                                             ; 22B3 _ 90
        nop                                             ; 22B4 _ 90
        nop                                             ; 22B5 _ 90
        nop                                             ; 22B6 _ 90
        nop                                             ; 22B7 _ 90
        nop                                             ; 22B8 _ 90
        nop                                             ; 22B9 _ 90
        nop                                             ; 22BA _ 90
        nop                                             ; 22BB _ 90
        nop                                             ; 22BC _ 90
        nop                                             ; 22BD _ 90
        nop                                             ; 22BE _ 90
        nop                                             ; 22BF _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=64 noexecute                      ; section number 3, bss

_ZN10Tablebases5ScoreE:                                 ; dword
        resd    1                                       ; 00000000

_ZN10Tablebases10ProbeDepthE:                           ; dword
        resd    1                                       ; 00000004

_ZN10Tablebases9UseRule50E:                             ; byte
        resb    1                                       ; 00000008

_ZN10Tablebases8RootInTBE:                              ; byte
        resb    7                                       ; 00000009

_ZN10Tablebases4HitsE:                                  ; qword
        resq    1                                       ; 00000010

_ZN10Tablebases11CardinalityE:                          ; dword
        resd    2                                       ; 00000018

_ZN6Search11SetupStatesE:                               ; qword
        resq    4                                       ; 00000020

_ZN6Search6LimitsE:                                     ; qword
        resq    1                                       ; 00000040

?_0169: resq    1                                       ; 00000048

?_0170: resq    1                                       ; 00000050

?_0171: resd    1                                       ; 00000058

?_0172: resd    1                                       ; 0000005C

?_0173: resd    1                                       ; 00000060

?_0174: resd    1                                       ; 00000064

?_0175: resd    1                                       ; 00000068

?_0176: resd    1                                       ; 0000006C

?_0177: resd    1                                       ; 00000070

?_0178: resd    1                                       ; 00000074

?_0179: resd    1                                       ; 00000078

?_0180: resd    1                                       ; 0000007C

?_0181: resd    2                                       ; 00000080

?_0182: resq    2                                       ; 00000088

_ZN6Search7SignalsE:                                    ; byte
        resb    1                                       ; 00000098

?_0183: resb    7                                       ; 00000099

_ZN12_GLOBAL__N_14srngE:                                ; qword
        resq    4                                       ; 000000A0

_ZN12_GLOBAL__N_118CounterMoveHistoryE:                 ; byte
        resb    4194304                                 ; 000000C0

_ZN12_GLOBAL__N_19DrawValueE:                           ; byte
        resb    32                                      ; 004000C0

_ZN12_GLOBAL__N_18EasyMoveE:                            ; dword
        resd    2                                       ; 004000E0

?_0184:                                                 ; qword
        resb    4                                       ; 004000E8

?_0185:                                                 ; byte
        resb    4                                       ; 004000EC

?_0186: resd    1                                       ; 004000F0

?_0187: resd    1                                       ; 004000F4

?_0188: resd    2                                       ; 004000F8

_ZN12_GLOBAL__N_1L11HalfDensityE:                       ; qword
        resq    1                                       ; 00400100

?_0189: resq    1                                       ; 00400108

?_0190: resq    1                                       ; 00400110

?_0191: resq    1                                       ; 00400118

?_0192: resq    1                                       ; 00400120

?_0193: resq    1                                       ; 00400128

?_0194: resq    1                                       ; 00400130

?_0195: resq    1                                       ; 00400138

?_0196: resq    1                                       ; 00400140

?_0197: resq    1                                       ; 00400148

?_0198: resq    1                                       ; 00400150

?_0199: resq    1                                       ; 00400158

?_0200: resq    1                                       ; 00400160

?_0201: resq    1                                       ; 00400168

?_0202: resq    1                                       ; 00400170

?_0203: resq    1                                       ; 00400178

?_0204: resq    1                                       ; 00400180

?_0205: resq    1                                       ; 00400188

?_0206: resq    1                                       ; 00400190

?_0207: resq    1                                       ; 00400198

?_0208: resq    1                                       ; 004001A0

?_0209: resq    1                                       ; 004001A8

?_0210: resq    1                                       ; 004001B0

?_0211: resq    1                                       ; 004001B8

?_0212: resq    1                                       ; 004001C0

?_0213: resq    1                                       ; 004001C8

?_0214: resq    1                                       ; 004001D0

?_0215: resq    1                                       ; 004001D8

?_0216: resq    1                                       ; 004001E0

?_0217: resq    1                                       ; 004001E8

?_0218: resq    1                                       ; 004001F0

?_0219: resq    1                                       ; 004001F8

?_0220: resq    1                                       ; 00400200

?_0221: resq    1                                       ; 00400208

?_0222: resq    1                                       ; 00400210

?_0223: resq    1                                       ; 00400218

?_0224: resq    1                                       ; 00400220

?_0225: resq    1                                       ; 00400228

?_0226: resq    1                                       ; 00400230

?_0227: resq    1                                       ; 00400238

?_0228: resq    1                                       ; 00400240

?_0229: resq    1                                       ; 00400248

?_0230: resq    1                                       ; 00400250

?_0231: resq    1                                       ; 00400258

?_0232: resq    1                                       ; 00400260

?_0233: resq    1                                       ; 00400268

?_0234: resq    1                                       ; 00400270

?_0235: resq    1                                       ; 00400278

?_0236: resq    1                                       ; 00400280

?_0237: resq    1                                       ; 00400288

?_0238: resq    1                                       ; 00400290

?_0239: resq    1                                       ; 00400298

?_0240: resq    1                                       ; 004002A0

?_0241: resq    1                                       ; 004002A8

?_0242: resq    1                                       ; 004002B0

?_0243: resq    1                                       ; 004002B8

?_0244: resq    1                                       ; 004002C0

?_0245: resq    1                                       ; 004002C8

?_0246: resq    1                                       ; 004002D0

?_0247: resq    5                                       ; 004002D8

_ZN12_GLOBAL__N_110ReductionsE:                         ; byte
        resb    65536                                   ; 00400300

_ZN12_GLOBAL__N_118FutilityMoveCountsE:                 ; byte
        resb    64                                      ; 00410300

?_0248:                                                 ; byte
        resb    64                                      ; 00410340


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195.cold.200:
        xor     eax, eax                                ; 0000 _ 31. C0
        jmp     .text.startup+5B2H                      ; 0002 _ E9, 000005B2(rel)

        call    _ZSt17__throw_bad_allocv                ; 0007 _ E8, 00000000(rel)
        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90

_ZN10MainThread6searchEv.cold.201:; Local function
        mov     ecx, 4                                  ; 000E _ B9, 00000004
        mov     dword [rsp+40H], -32001                 ; 0013 _ C7. 44 24, 40, FFFF82FF
        mov     dword [rsp+44H], -32001                 ; 001B _ C7. 44 24, 44, FFFF82FF
        mov     qword [rsp+48H], 0                      ; 0023 _ 48: C7. 44 24, 48, 00000000
        mov     qword [rsp+50H], 0                      ; 002C _ 48: C7. 44 24, 50, 00000000
        mov     qword [rsp+58H], 0                      ; 0035 _ 48: C7. 44 24, 58, 00000000
        call    _Znwy                                   ; 003E _ E8, 00000000(rel)
        mov     r9, qword [rbx+4C0H]                    ; 0043 _ 4C: 8B. 8B, 000004C0
        lea     rcx, [rbx+4B8H]                         ; 004A _ 48: 8D. 8B, 000004B8
        cmp     r9, qword [rbx+4C8H]                    ; 0051 _ 4C: 3B. 8B, 000004C8
        lea     rsi, [rax+4H]                           ; 0058 _ 48: 8D. 70, 04
        mov     qword [rsp+48H], rax                    ; 005C _ 48: 89. 44 24, 48
        mov     qword [rsp+58H], rsi                    ; 0061 _ 48: 89. 74 24, 58
        mov     dword [rax], 0                          ; 0066 _ C7. 00, 00000000
        mov     qword [rsp+50H], rsi                    ; 006C _ 48: 89. 74 24, 50
        je      ?_0252                                  ; 0071 _ 0F 84, 000000C7
        test    r9, r9                                  ; 0077 _ 4D: 85. C9
        jz      ?_0249                                  ; 007A _ 74, 5E
        mov     edx, dword [rsp+40H]                    ; 007C _ 8B. 54 24, 40
        mov     r12d, dword [rsp+44H]                   ; 0080 _ 44: 8B. 64 24, 44
        mov     qword [r9+8H], 0                        ; 0085 _ 49: C7. 41, 08, 00000000
        mov     qword [r9+10H], 0                       ; 008D _ 49: C7. 41, 10, 00000000
        mov     qword [r9+18H], 0                       ; 0095 _ 49: C7. 41, 18, 00000000
        mov     r10, qword [rsp+48H]                    ; 009D _ 4C: 8B. 54 24, 48
        mov     dword [r9], edx                         ; 00A2 _ 41: 89. 11
        mov     dword [r9+4H], r12d                     ; 00A5 _ 45: 89. 61, 04
        mov     qword [r9+8H], r10                      ; 00A9 _ 4D: 89. 51, 08
        mov     r11, qword [rsp+50H]                    ; 00AD _ 4C: 8B. 5C 24, 50
        mov     qword [rsp+48H], 0                      ; 00B2 _ 48: C7. 44 24, 48, 00000000
        mov     qword [r9+10H], r11                     ; 00BB _ 4D: 89. 59, 10
        mov     r13, qword [rsp+58H]                    ; 00BF _ 4C: 8B. 6C 24, 58
        mov     qword [rsp+50H], 0                      ; 00C4 _ 48: C7. 44 24, 50, 00000000
        mov     qword [r9+18H], r13                     ; 00CD _ 4D: 89. 69, 18
        mov     qword [rsp+58H], 0                      ; 00D1 _ 48: C7. 44 24, 58, 00000000
?_0249: add     qword [rbx+4C0H], 32                    ; 00DA _ 48: 83. 83, 000004C0, 20
        lea     r12, [rsp+40H]                          ; 00E2 _ 4C: 8D. 64 24, 40
?_0250: mov     rcx, qword [rsp+48H]                    ; 00E7 _ 48: 8B. 4C 24, 48
        test    rcx, rcx                                ; 00EC _ 48: 85. C9
        jz      ?_0251                                  ; 00EF _ 74, 05
        call    _ZdlPv                                  ; 00F1 _ E8, 00000000(rel)
?_0251: lea     rdx, [rel ?_0328]                       ; 00F6 _ 48: 8D. 15, 00000000(rel)
        mov     rcx, r12                                ; 00FD _ 4C: 89. E1
        call    _Z12print_stringPcPKc                   ; 0100 _ E8, 00000000(rel)
        mov     r15, qword [rbx+4A8H]                   ; 0105 _ 4C: 8B. BB, 000004A8
        mov     rcx, rax                                ; 010C _ 48: 89. C1
        cmp     qword [r15+38H], 1                      ; 010F _ 49: 83. 7F, 38, 01
        sbb     edx, edx                                ; 0114 _ 19. D2
        not     edx                                     ; 0116 _ F7. D2
        and     edx, 0FFFF8300H                         ; 0118 _ 81. E2, FFFF8300
        call    _ZN3UCI11print_valueEPc5Value           ; 011E _ E8, 00000000(rel)
        mov     rcx, r12                                ; 0123 _ 4C: 89. E1
        mov     byte [rax], 10                          ; 0126 _ C6. 00, 0A
        lea     rdx, [rax+1H]                           ; 0129 _ 48: 8D. 50, 01
        call    _Z9write_outPcS_                        ; 012D _ E8, 00000000(rel)
        mov     rsi, qword [rel .refptr.Threads]        ; 0132 _ 48: 8B. 35, 00000000(rel)
        jmp     .text+3EAH                              ; 0139 _ E9, 000003EA(rel)

?_0252: ; Local function
        lea     r12, [rsp+40H]                          ; 013E _ 4C: 8D. 64 24, 40
        mov     rdx, r12                                ; 0143 _ 4C: 89. E2
        call    _ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_; 0146 _ E8, 00000000(rel)
        jmp     ?_0250                                  ; 014B _ EB, 9A

        call    _ZN6Thread24wait_for_search_finishedEv  ; 014D _ E8, 00000000(rel)
        jmp     .text+577H                              ; 0152 _ E9, 00000577(rel)

        mov     r11, qword [rsi+4B8H]                   ; 0157 _ 4C: 8B. 9E, 000004B8
        mov     r9, qword [rax+4B8H]                    ; 015E _ 4C: 8B. 88, 000004B8
        mov     r13d, dword [r11]                       ; 0165 _ 45: 8B. 2B
        cmp     dword [r9], r13d                        ; 0168 _ 45: 39. 29
        cmovg   rsi, rax                                ; 016B _ 48: 0F 4F. F0
        jmp     .text+562H                              ; 016F _ E9, 00000562(rel)

        mov     rdx, r8                                 ; 0174 _ 4C: 89. C2
        mov     qword [rsp+30H], rcx                    ; 0177 _ 48: 89. 4C 24, 30
        mov     rcx, r12                                ; 017C _ 4C: 89. E1
        mov     qword [rsp+38H], r8                     ; 017F _ 4C: 89. 44 24, 38
        call    _ZN8PositionaSERKS_                     ; 0184 _ E8, 00000000(rel)
        lea     rcx, [r14+0F0H]                         ; 0189 _ 49: 8D. 8E, 000000F0
        mov     rdx, r12                                ; 0190 _ 4C: 89. E2
        mov     qword [rsp+3F0H], r14                   ; 0193 _ 4C: 89. B4 24, 000003F0
        call    _ZN8PositionaSERKS_                     ; 019B _ E8, 00000000(rel)
        mov     rax, qword [rsp+30H]                    ; 01A0 _ 48: 8B. 44 24, 30
        lea     rcx, [r14+4B8H]                         ; 01A5 _ 49: 8D. 8E, 000004B8
        mov     rdx, rax                                ; 01AC _ 48: 89. C2
        call    _ZNSt6vectorIN6Search8RootMoveESaIS1_EEaSERKS3_; 01AF _ E8, 00000000(rel)
        mov     rcx, r14                                ; 01B4 _ 4C: 89. F1
        xor     edx, edx                                ; 01B7 _ 31. D2
        call    _ZN6Thread15start_searchingEb           ; 01B9 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+30H]                    ; 01BE _ 48: 8B. 4C 24, 30
        mov     r8, qword [rsp+38H]                     ; 01C3 _ 4C: 8B. 44 24, 38
        jmp     .text+542H                              ; 01C8 _ E9, 00000542(rel)

        lea     rdx, [rbx+0F0H]                         ; 01CD _ 48: 8D. 93, 000000F0
        call    _ZN6Search8RootMove22extract_ponder_from_ttER8Position; 01D4 _ E8, 0000016B
        test    al, al                                  ; 01D9 _ 84. C0
        jne     .text+4CBH                              ; 01DB _ 0F 85, 000004CB(rel)
        jmp     .text+4FBH                              ; 01E1 _ E9, 000004FB(rel)

        mov     r8d, dword [rsi+24D4H]                  ; 01E6 _ 44: 8B. 86, 000024D4
        lea     rdx, [rsi+0F0H]                         ; 01ED _ 48: 8D. 96, 000000F0
        mov     rcx, r12                                ; 01F4 _ 4C: 89. E1
        mov     dword [rsp+20H], 32001                  ; 01F7 _ C7. 44 24, 20, 00007D01
        mov     r9d, 4294935295                         ; 01FF _ 41: B9, FFFF82FF
        call    _ZN3UCI8print_pvEPcRK8Position5Depth5ValueS5_; 0205 _ E8, 00001A70(rel)
        mov     rcx, r12                                ; 020A _ 4C: 89. E1
        lea     rdx, [rax+1H]                           ; 020D _ 48: 8D. 50, 01
        mov     byte [rax], 10                          ; 0211 _ C6. 00, 0A
        call    _Z9write_outPcS_                        ; 0214 _ E8, 00000000(rel)
        jmp     .text+482H                              ; 0219 _ E9, 00000482(rel)

        mov     rdi, qword [rbx+4B8H]                   ; 021E _ 48: 8B. BB, 000004B8
        mov     rsi, rbx                                ; 0225 _ 48: 89. DE
        mov     r8d, dword [rdi]                        ; 0228 _ 44: 8B. 07
        mov     dword [rbx+24E8H], r8d                  ; 022B _ 44: 89. 83, 000024E8
        jmp     .text+482H                              ; 0232 _ E9, 00000482(rel)

        lea     rdx, [rel _ZN6Search7SignalsE]          ; 0237 _ 48: 8D. 15, 00000098(rel)
        mov     rcx, rbx                                ; 023E _ 48: 89. D9
        mov     byte [rel ?_0183], 1                    ; 0241 _ C6. 05, 00000098(rel), 01
        call    _ZN6Thread4waitERVKb                    ; 0248 _ E8, 00000000(rel)
        jmp     ?_0011                                  ; 024D _ E9, 0000041C(rel)

        mov     rcx, qword [rel .refptr.Threads]        ; 0252 _ 48: 8B. 0D, 00000000(rel)
        lea     r14, [rel _ZN6Search6LimitsE]           ; 0259 _ 4C: 8D. 35, 00000040(rel)
        movsxd  rbp, dword [r14+rbp*4+20H]              ; 0260 _ 49: 63. 6C AE, 20
        call    _ZN10ThreadPool14nodes_searchedEv       ; 0265 _ E8, 00000000(rel)
        mov     rcx, qword [rel .refptr.Time]           ; 026A _ 48: 8B. 0D, 00000000(rel)
        sub     rbp, rax                                ; 0271 _ 48: 29. C5
        add     qword [rcx], rbp                        ; 0274 _ 48: 01. 29
        jmp     .text+3F7H                              ; 0277 _ E9, 000003F7(rel)

        mov     r9, qword [rbx+4A8H]                    ; 027C _ 4C: 8B. 8B, 000004A8
        test    byte [r9+18H], 0FH                      ; 0283 _ 41: F6. 41, 18, 0F
        jne     .text+3B8H                              ; 0288 _ 0F 85, 000003B8(rel)
        lea     r13, [rbx+4B8H]                         ; 028E _ 4C: 8D. AB, 000004B8
        lea     r12, [rbx+0F0H]                         ; 0295 _ 4C: 8D. A3, 000000F0
        mov     rdx, r13                                ; 029C _ 4C: 89. EA
        lea     r8, [rel _ZN10Tablebases5ScoreE]        ; 029F _ 4C: 8D. 05, 00000000(rel)
        mov     rcx, r12                                ; 02A6 _ 4C: 89. E1
        call    _ZN10Tablebases10root_probeER8PositionRSt6vectorIN6Search8RootMoveESaIS4_EER5Value; 02A9 _ E8, 00000000(rel)
        test    al, al                                  ; 02AE _ 84. C0
        mov     byte [rel _ZN10Tablebases8RootInTBE], al; 02B0 _ 88. 05, 00000009(rel)
        jz      ?_0256                                  ; 02B6 _ 74, 66
?_0253: mov     dword [rel _ZN10Tablebases11CardinalityE], 0; 02B8 _ C7. 05, 00000014(rel), 00000000
?_0254: cmp     byte [rel _ZN10Tablebases8RootInTBE], 0 ; 02C2 _ 80. 3D, 00000008(rel), 00
        je      .text+3B8H                              ; 02C9 _ 0F 84, 000003B8(rel)
        mov     r10, qword [rbx+4C0H]                   ; 02CF _ 4C: 8B. 93, 000004C0
        sub     r10, qword [rbx+4B8H]                   ; 02D6 _ 4C: 2B. 93, 000004B8
        sar     r10, 5                                  ; 02DD _ 49: C1. FA, 05
        cmp     byte [rel _ZN10Tablebases9UseRule50E], 0; 02E1 _ 80. 3D, 00000007(rel), 00
        mov     qword [rel _ZN10Tablebases4HitsE], r10  ; 02E8 _ 4C: 89. 15, 00000010(rel)
        jne     .text+3B8H                              ; 02EF _ 0F 85, 000003B8(rel)
        mov     r11d, dword [rel _ZN10Tablebases5ScoreE]; 02F5 _ 44: 8B. 1D, 00000000(rel)
        mov     r14d, 31871                             ; 02FC _ 41: BE, 00007C7F
        cmp     r11d, 0                                 ; 0302 _ 41: 83. FB, 00
        jg      ?_0255                                  ; 0306 _ 7F, 0A
        mov     r14d, 4294935425                        ; 0308 _ 41: BE, FFFF8381
        cmove   r14d, r11d                              ; 030E _ 45: 0F 44. F3
?_0255: mov     dword [rel _ZN10Tablebases5ScoreE], r14d; 0312 _ 44: 89. 35, 00000000(rel)
        jmp     .text+3B8H                              ; 0319 _ E9, 000003B8(rel)

?_0256: ; Local function
        lea     r8, [rel _ZN10Tablebases5ScoreE]        ; 031E _ 4C: 8D. 05, 00000000(rel)
        mov     rdx, r13                                ; 0325 _ 4C: 89. EA
        mov     rcx, r12                                ; 0328 _ 4C: 89. E1
        call    _ZN10Tablebases14root_probe_wdlER8PositionRSt6vectorIN6Search8RootMoveESaIS4_EER5Value; 032B _ E8, 00000000(rel)
        cmp     dword [rel _ZN10Tablebases5ScoreE], 0   ; 0330 _ 83. 3D, FFFFFFFF(rel), 00
        mov     byte [rel _ZN10Tablebases8RootInTBE], al; 0337 _ 88. 05, 00000009(rel)
        jg      ?_0254                                  ; 033D _ 7F, 83
        jmp     ?_0253                                  ; 033F _ E9, FFFFFF74

_ZN6Search8RootMove22extract_ponder_from_ttER8Position:; Function begin
        push    r12                                     ; 0344 _ 41: 54
        push    rbp                                     ; 0346 _ 55
        push    rdi                                     ; 0347 _ 57
        push    rsi                                     ; 0348 _ 56
        push    rbx                                     ; 0349 _ 53
        sub     rsp, 2192                               ; 034A _ 48: 81. EC, 00000890
        lea     rbx, [rsp+80H]                          ; 0351 _ 48: 8D. 9C 24, 00000080
        mov     rsi, rcx                                ; 0359 _ 48: 89. CE
        mov     rdi, rdx                                ; 035C _ 48: 89. D7
        mov     rcx, rbx                                ; 035F _ 48: 89. D9
        call    _ZN9CheckInfoC1ERK8Position             ; 0362 _ E8, 00000000(rel)
        mov     rax, qword [rsi+8H]                     ; 0367 _ 48: 8B. 46, 08
        mov     r8, rbx                                 ; 036B _ 49: 89. D8
        mov     rcx, rdi                                ; 036E _ 48: 89. F9
        mov     edx, dword [rax]                        ; 0371 _ 8B. 10
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 0373 _ E8, 00000000(rel)
        mov     rdx, qword [rsi+8H]                     ; 0378 _ 48: 8B. 56, 08
        lea     r8, [rsp+30H]                           ; 037C _ 4C: 8D. 44 24, 30
        mov     rcx, rdi                                ; 0381 _ 48: 89. F9
        movzx   r9d, al                                 ; 0384 _ 44: 0F B6. C8
        mov     edx, dword [rdx]                        ; 0388 _ 8B. 12
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 038A _ E8, 00000000(rel)
        mov     rcx, qword [rdi+3B8H]                   ; 038F _ 48: 8B. 8F, 000003B8
        lea     r8, [rsp+2BH]                           ; 0396 _ 4C: 8D. 44 24, 2B
        mov     rdx, qword [rcx+30H]                    ; 039B _ 48: 8B. 51, 30
        mov     rcx, qword [rel .refptr.TT]             ; 039F _ 48: 8B. 0D, 00000000(rel)
        call    _ZNK18TranspositionTable5probeEyRb      ; 03A6 _ E8, 00000000(rel)
        mov     rbp, qword [rsi+8H]                     ; 03AB _ 48: 8B. 6E, 08
        mov     rcx, rdi                                ; 03AF _ 48: 89. F9
        mov     r12, rax                                ; 03B2 _ 49: 89. C4
        mov     edx, dword [rbp]                        ; 03B5 _ 8B. 55, 00
        call    _ZN8Position9undo_moveE4Move            ; 03B8 _ E8, 00000000(rel)
        mov     bpl, byte [rsp+2BH]                     ; 03BD _ 40: 8A. 6C 24, 2B
        test    bpl, bpl                                ; 03C2 _ 40: 84. ED
        jz      ?_0260                                  ; 03C5 _ 74, 3E
        movzx   r12d, word [r12+2H]                     ; 03C7 _ 45: 0F B7. 64 24, 02
        mov     rdx, rbx                                ; 03CD _ 48: 89. DA
        mov     rcx, rdi                                ; 03D0 _ 48: 89. F9
        mov     dword [rsp+2CH], r12d                   ; 03D3 _ 44: 89. 64 24, 2C
        call    _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_; 03D8 _ E8, 00000000(rel)
?_0257: cmp     rax, rbx                                ; 03DD _ 48: 39. D8
        jz      ?_0258                                  ; 03E0 _ 74, 0C
        add     rbx, 8                                  ; 03E2 _ 48: 83. C3, 08
        cmp     r12d, dword [rbx-8H]                    ; 03E6 _ 44: 3B. 63, F8
        jnz     ?_0257                                  ; 03EA _ 75, F1
        jmp     ?_0259                                  ; 03EC _ EB, 04

?_0258: xor     ebp, ebp                                ; 03EE _ 31. ED
        jmp     ?_0260                                  ; 03F0 _ EB, 13

?_0259: test    bpl, bpl                                ; 03F2 _ 40: 84. ED
        jz      ?_0260                                  ; 03F5 _ 74, 0E
        lea     rdx, [rsp+2CH]                          ; 03F7 _ 48: 8D. 54 24, 2C
        lea     rcx, [rsi+8H]                           ; 03FC _ 48: 8D. 4E, 08
        call    _ZNSt6vectorI4MoveSaIS0_EE9push_backERKS0_; 0400 _ E8, 00000000(rel)
?_0260: mov     al, bpl                                 ; 0405 _ 40: 88. E8
        add     rsp, 2192                               ; 0408 _ 48: 81. C4, 00000890
        pop     rbx                                     ; 040F _ 5B
        pop     rsi                                     ; 0410 _ 5E
        pop     rdi                                     ; 0411 _ 5F
        pop     rbp                                     ; 0412 _ 5D
        pop     r12                                     ; 0413 _ 41: 5C
        ret                                             ; 0415 _ C3
; _ZN6Search8RootMove22extract_ponder_from_ttER8Position End of function

_ZN6Thread6searchEv.cold.202:; Local function
        mov     ecx, 50                                 ; 0416 _ B9, 00000032
        xor     eax, eax                                ; 041B _ 31. C0
        xor     r15d, r15d                              ; 041D _ 45: 31. FF
        mov     dword [rsp+54H], 0                      ; 0420 _ C7. 44 24, 54, 00000000
        rep stosd                                       ; 0428 _ F3: AB
        mov     dword [r12+24D4H], 0                    ; 042A _ 41: C7. 84 24, 000024D4, 00000000
        jmp     .text+66BH                              ; 0436 _ E9, 0000066B(rel)

        mov     eax, dword [rsp+74H]                    ; 043B _ 8B. 44 24, 74
        test    eax, eax                                ; 043F _ 85. C0
        jnz     ?_0261                                  ; 0441 _ 75, 0F
        mov     rdx, qword [rsp+30H]                    ; 0443 _ 48: 8B. 54 24, 30
        lea     rcx, [rsp+70H]                          ; 0448 _ 48: 8D. 4C 24, 70
        call    _ZN12_GLOBAL__N_15Skill9pick_bestEy     ; 044D _ E8, 000004DA
?_0261: mov     rdx, qword [r12+4C0H]                   ; 0452 _ 49: 8B. 94 24, 000004C0
        lea     r8, [rsp+0E0H]                          ; 045A _ 4C: 8D. 84 24, 000000E0
        mov     dword [rsp+0E0H], eax                   ; 0462 _ 89. 84 24, 000000E0
        mov     rcx, qword [r12+4B8H]                   ; 0469 _ 49: 8B. 8C 24, 000004B8
        call    _ZSt4findIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEE4MoveET_SA_SA_RKT0_; 0471 _ E8, 00000000(rel)
        mov     rcx, qword [r12+4B8H]                   ; 0476 _ 49: 8B. 8C 24, 000004B8
        mov     rdx, rax                                ; 047E _ 48: 89. C2
        call    _ZSt4swapIN6Search8RootMoveEEvRT_S3_    ; 0481 _ E8, 00000000(rel)
        jmp     ?_0037                                  ; 0486 _ E9, 00000ADC(rel)

        cmp     byte [r15+24D9H], 0                     ; 048B _ 41: 80. BF, 000024D9, 00
        je      .text+0AD1H                             ; 0493 _ 0F 84, 00000AD1(rel)
        jmp     .text+0A9EH                             ; 0499 _ E9, 00000A9E(rel)

        movzx   edi, byte [rel _ZN6Search7SignalsE]     ; 049E _ 0F B6. 3D, 00000098(rel)
        mov     r10, r12                                ; 04A5 _ 4D: 89. E2
        mov     r12d, r13d                              ; 04A8 _ 45: 89. EC
        mov     r13, r10                                ; 04AB _ 4D: 89. D5
        test    dil, dil                                ; 04AE _ 40: 84. FF
        jne     ?_0265                                  ; 04B1 _ 0F 85, 000000F4
        movzx   esi, byte [rel ?_0183]                  ; 04B7 _ 0F B6. 35, 00000099(rel)
        test    sil, sil                                ; 04BE _ 40: 84. F6
        jne     ?_0265                                  ; 04C1 _ 0F 85, 000000E4
        movzx   ecx, byte [r15+24DAH]                   ; 04C7 _ 41: 0F B6. 8F, 000024DA
        xor     r11d, r11d                              ; 04CF _ 45: 31. DB
        mov     r9, qword [r10+4B8H]                    ; 04D2 _ 4D: 8B. 8A, 000004B8
        mov     edi, dword [rsp+54H]                    ; 04D9 _ 8B. 7C 24, 54
        movsd   xmm1, qword [r15+24E0H]                 ; 04DD _ F2 41: 0F 10. 8F, 000024E0
        movsd   xmm7, qword [rel ?_0364]                ; 04E6 _ F2: 0F 10. 3D, 000003A0(rel)
        xor     ecx, 01H                                ; 04EE _ 83. F1, 01
        cmp     dword [r15+24E8H], ebx                  ; 04F1 _ 41: 39. 9F, 000024E8
        movzx   ebp, cl                                 ; 04F8 _ 0F B6. E9
        mov     r10, qword [r9+8H]                      ; 04FB _ 4D: 8B. 51, 08
        addsd   xmm7, xmm1                              ; 04FF _ F2: 0F 58. F9
        setle   r11b                                    ; 0503 _ 41: 0F 9E. C3
        imul    edx, ebp, -124                          ; 0507 _ 6B. D5, 84
        imul    eax, ebp, -160                          ; 050A _ 69. C5, FFFFFF60
        imul    r8d, r11d, -126                         ; 0510 _ 45: 6B. C3, 82
        imul    edx, r11d                               ; 0514 _ 41: 0F AF. D3
        lea     esi, [rax+r8+280H]                      ; 0518 _ 42: 8D. B4 00, 00000280
        add     esi, edx                                ; 0520 _ 01. D6
        cmp     edi, dword [r10]                        ; 0522 _ 41: 3B. 3A
        jnz     ?_0262                                  ; 0525 _ 75, 12
        movsd   xmm2, qword [rel ?_0365]                ; 0527 _ F2: 0F 10. 15, 000003A8(rel)
        ucomisd xmm2, xmm1                              ; 052F _ 66: 0F 2E. D1
        ja      ?_0270                                  ; 0533 _ 0F 87, 000001AE
?_0262: xor     edi, edi                                ; 0539 _ 31. FF
?_0263: mov     r8, qword [r13+4C0H]                    ; 053B _ 4D: 8B. 85, 000004C0
        sub     r8, qword [r13+4B8H]                    ; 0542 _ 4D: 2B. 85, 000004B8
        sar     r8, 5                                   ; 0549 _ 49: C1. F8, 05
        sub     r8, 1                                   ; 054D _ 49: 83. E8, 01
        jz      ?_0264                                  ; 0551 _ 74, 48
        call    _ZNK14TimeManagement7elapsedEv.isra.20.constprop.199; 0553 _ E8, 00001D00(rel)
        pxor    xmm4, xmm4                              ; 0558 _ 66: 0F EF. E4
        pxor    xmm5, xmm5                              ; 055C _ 66: 0F EF. ED
        mov     r9, qword [rel .refptr.Time]            ; 0560 _ 4C: 8B. 0D, 00000000(rel)
        cvtsi2sd xmm5, esi                              ; 0567 _ F2: 0F 2A. EE
        pxor    xmm3, xmm3                              ; 056B _ 66: 0F EF. DB
        cvtsi2sd xmm3, eax                              ; 056F _ F2: 0F 2A. D8
        cvtsi2sd xmm4, dword [r9+10H]                   ; 0573 _ F2 41: 0F 2A. 61, 10
        mulsd   xmm7, xmm4                              ; 0579 _ F2: 0F 59. FC
        mulsd   xmm5, xmm7                              ; 057D _ F2: 0F 59. EF
        divsd   xmm5, qword [rel ?_0363]                ; 0581 _ F2: 0F 5E. 2D, 00000398(rel)
        ucomisd xmm3, xmm5                              ; 0589 _ 66: 0F 2E. DD
        ja      ?_0264                                  ; 058D _ 77, 0C
        test    dil, dil                                ; 058F _ 40: 84. FF
        mov     byte [r15+24D9H], dil                   ; 0592 _ 41: 88. BF, 000024D9
        jz      ?_0265                                  ; 0599 _ 74, 10
?_0264: cmp     dword [rel ?_0181], 0                   ; 059B _ 83. 3D, 0000007F(rel), 00
        jz      ?_0266                                  ; 05A2 _ 74, 5E
        mov     byte [rel ?_0183], 1                    ; 05A4 _ C6. 05, 00000098(rel), 01
?_0265: mov     rbp, qword [r13+4B8H]                   ; 05AB _ 49: 8B. AD, 000004B8
        mov     rdx, qword [rbp+8H]                     ; 05B2 _ 48: 8B. 55, 08
        mov     rsi, qword [rbp+10H]                    ; 05B6 _ 48: 8B. 75, 10
        sub     rsi, rdx                                ; 05BA _ 48: 29. D6
        cmp     rsi, 11                                 ; 05BD _ 48: 83. FE, 0B
        ja      ?_0267                                  ; 05C1 _ 77, 48
        mov     dword [rel _ZN12_GLOBAL__N_18EasyMoveE], 0; 05C3 _ C7. 05, 004000DC(rel), 00000000
        mov     ecx, dword [r13+4D0H]                   ; 05CD _ 41: 8B. 8D, 000004D0
        mov     qword [rel ?_0184], 0                   ; 05D4 _ 48: C7. 05, 004000E4(rel), 00000000
        mov     dword [rel ?_0188], 0                   ; 05DF _ C7. 05, 004000F4(rel), 00000000
        mov     dword [rel ?_0187], 0                   ; 05E9 _ C7. 05, 004000F0(rel), 00000000
        mov     dword [rel ?_0186], 0                   ; 05F3 _ C7. 05, 004000EC(rel), 00000000
        jmp     .text+702H                              ; 05FD _ E9, 00000702(rel)

?_0266: mov     byte [rel _ZN6Search7SignalsE], 1       ; 0602 _ C6. 05, 00000097(rel), 01
        jmp     ?_0265                                  ; 0609 _ EB, A0

?_0267: xor     ecx, ecx                                ; 060B _ 31. C9
        mov     r10d, dword [rel ?_0188]                ; 060D _ 44: 8B. 15, 004000F8(rel)
        cmp     dword [rdx+8H], r10d                    ; 0614 _ 44: 39. 52, 08
        lea     rdi, [r13+0F0H]                         ; 0618 _ 49: 8D. BD, 000000F0
        jnz     ?_0268                                  ; 061F _ 75, 09
        mov     ecx, dword [rel _ZN12_GLOBAL__N_18EasyMoveE]; 0621 _ 8B. 0D, 004000E0(rel)
        add     ecx, 1                                  ; 0627 _ 83. C1, 01
?_0268: mov     dword [rel _ZN12_GLOBAL__N_18EasyMoveE], ecx; 062A _ 89. 0D, 004000E0(rel)
        xor     eax, eax                                ; 0630 _ 31. C0
        lea     r11, [rel ?_0185]                       ; 0632 _ 4C: 8D. 1D, 004000EC(rel)
?_0269: mov     r8d, dword [rdx+rax]                    ; 0639 _ 44: 8B. 04 02
        add     rax, 4                                  ; 063D _ 48: 83. C0, 04
        cmp     r8d, dword [r11+rax]                    ; 0641 _ 45: 3B. 04 03
        jne     ?_0271                                  ; 0645 _ 0F 85, 000000D8
        cmp     rax, 12                                 ; 064B _ 48: 83. F8, 0C
        jnz     ?_0269                                  ; 064F _ 75, E8
        mov     ecx, dword [r13+4D0H]                   ; 0651 _ 41: 8B. 8D, 000004D0
        jmp     .text+702H                              ; 0658 _ E9, 00000702(rel)

; Note: No jump seems to point here
        mov     rdi, qword [rsp+40H]                    ; 065D _ 48: 8B. 7C 24, 40
        lea     rdx, [rel ?_0331]                       ; 0662 _ 48: 8D. 15, 00000027(rel)
        mov     rcx, rdi                                ; 0669 _ 48: 89. F9
        call    _Z12print_stringPcPKc                   ; 066C _ E8, 00000000(rel)
        mov     rcx, qword [rel .refptr.Threads]        ; 0671 _ 48: 8B. 0D, 00000000(rel)
        mov     rsi, rax                                ; 0678 _ 48: 89. C6
        call    _ZN10ThreadPool14nodes_searchedEv       ; 067B _ E8, 00000000(rel)
        mov     rcx, rsi                                ; 0680 _ 48: 89. F1
        mov     rdx, rax                                ; 0683 _ 48: 89. C2
        call    _Z9print_intPcx                         ; 0686 _ E8, 00000000(rel)
        lea     rdx, [rel ?_0332]                       ; 068B _ 48: 8D. 15, 00000033(rel)
        mov     rcx, rax                                ; 0692 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 0695 _ E8, 00000000(rel)
        mov     rsi, rax                                ; 069A _ 48: 89. C6
        call    _ZNK14TimeManagement7elapsedEv.isra.20.constprop.199; 069D _ E8, 00001D00(rel)
        mov     rcx, rsi                                ; 06A2 _ 48: 89. F1
        mov     edx, eax                                ; 06A5 _ 89. C2
        call    _Z9print_intPci                         ; 06A7 _ E8, 00000000(rel)
        mov     rcx, rdi                                ; 06AC _ 48: 89. F9
        lea     rdx, [rax+1H]                           ; 06AF _ 48: 8D. 50, 01
        mov     byte [rax], 10                          ; 06B3 _ C6. 00, 0A
        call    _Z9write_outPcS_                        ; 06B6 _ E8, 00000000(rel)
        jmp     .text+0A7EH                             ; 06BB _ E9, 00000A7E(rel)

; Note: No jump seems to point here
        test    cl, cl                                  ; 06C0 _ 84. C9
        je      .text+7F1H                              ; 06C2 _ 0F 84, 000007F1(rel)
        mov     qword [rsp+1890H], r12                  ; 06C8 _ 4C: 89. A4 24, 00001890
        mov     r12d, r13d                              ; 06D0 _ 45: 89. EC
        mov     r13, qword [rsp+1890H]                  ; 06D3 _ 4C: 8B. AC 24, 00001890
        mov     ecx, dword [r13+4D0H]                   ; 06DB _ 41: 8B. 8D, 000004D0
        jmp     .text+702H                              ; 06E2 _ E9, 00000702(rel)

?_0270: call    _ZNK14TimeManagement7elapsedEv.isra.20.constprop.199; 06E7 _ E8, 00001D00(rel)
        mov     rcx, qword [rel .refptr.Time]           ; 06EC _ 48: 8B. 0D, 00000000(rel)
        mov     r11d, 204                               ; 06F3 _ 41: BB, 000000CC
        mov     ebp, eax                                ; 06F9 _ 89. C5
        imul    eax, dword [rcx+10H], 25                ; 06FB _ 6B. 41, 10, 19
        cdq                                             ; 06FF _ 99
        idiv    r11d                                    ; 0700 _ 41: F7. FB
        cmp     ebp, eax                                ; 0703 _ 39. C5
        setg    dil                                     ; 0705 _ 40: 0F 9F. C7
        jmp     ?_0263                                  ; 0709 _ E9, FFFFFE2D

; Note: No jump seems to point here
        call    _ZNK14TimeManagement7elapsedEv.isra.20.constprop.199; 070E _ E8, 00001D00(rel)
        cmp     eax, 3000                               ; 0713 _ 3D, 00000BB8
        jg      .text+0A50H                             ; 0718 _ 0F 8F, 00000A50(rel)
        jmp     .text+0A7EH                             ; 071E _ E9, 00000A7E(rel)

?_0271: ; Local function
        lea     rsi, [rsp+80H]                          ; 0723 _ 48: 8D. B4 24, 00000080
        mov     r8d, 12                                 ; 072B _ 41: B8, 0000000C
        lea     rcx, [rel ?_0186]                       ; 0731 _ 48: 8D. 0D, 004000F0(rel)
        call    memmove                                 ; 0738 _ E8, 00000000(rel)
        mov     rdx, rdi                                ; 073D _ 48: 89. FA
        mov     rcx, rsi                                ; 0740 _ 48: 89. F1
        call    _ZN9CheckInfoC1ERK8Position             ; 0743 _ E8, 00000000(rel)
        mov     rdx, qword [rbp+8H]                     ; 0748 _ 48: 8B. 55, 08
        mov     r8, rsi                                 ; 074C _ 49: 89. F0
        mov     rcx, rdi                                ; 074F _ 48: 89. F9
        mov     edx, dword [rdx]                        ; 0752 _ 8B. 12
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 0754 _ E8, 00000000(rel)
        mov     r10, qword [rbp+8H]                     ; 0759 _ 4C: 8B. 55, 08
        mov     rcx, rdi                                ; 075D _ 48: 89. F9
        mov     r8, qword [rsp+60H]                     ; 0760 _ 4C: 8B. 44 24, 60
        movzx   r9d, al                                 ; 0765 _ 44: 0F B6. C8
        mov     edx, dword [r10]                        ; 0769 _ 41: 8B. 12
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 076C _ E8, 00000000(rel)
        mov     rdx, rdi                                ; 0771 _ 48: 89. FA
        mov     rcx, rsi                                ; 0774 _ 48: 89. F1
        call    _ZN9CheckInfoC1ERK8Position             ; 0777 _ E8, 00000000(rel)
        mov     r9, qword [rbp+8H]                      ; 077C _ 4C: 8B. 4D, 08
        mov     r8, rsi                                 ; 0780 _ 49: 89. F0
        mov     rcx, rdi                                ; 0783 _ 48: 89. F9
        mov     edx, dword [r9+4H]                      ; 0786 _ 41: 8B. 51, 04
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 078A _ E8, 00000000(rel)
        mov     rcx, qword [rbp+8H]                     ; 078F _ 48: 8B. 4D, 08
        mov     r8, qword [rsp+68H]                     ; 0793 _ 4C: 8B. 44 24, 68
        movzx   r9d, al                                 ; 0798 _ 44: 0F B6. C8
        mov     edx, dword [rcx+4H]                     ; 079C _ 8B. 51, 04
        mov     rcx, rdi                                ; 079F _ 48: 89. F9
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 07A2 _ E8, 00000000(rel)
        mov     r8, qword [rbp+8H]                      ; 07A7 _ 4C: 8B. 45, 08
        mov     rcx, rdi                                ; 07AB _ 48: 89. F9
        mov     rax, qword [r13+4A8H]                   ; 07AE _ 49: 8B. 85, 000004A8
        mov     edx, dword [r8+4H]                      ; 07B5 _ 41: 8B. 50, 04
        mov     r11, qword [rax+30H]                    ; 07B9 _ 4C: 8B. 58, 30
        mov     qword [rel ?_0184], r11                 ; 07BD _ 4C: 89. 1D, 004000E8(rel)
        call    _ZN8Position9undo_moveE4Move            ; 07C4 _ E8, 00000000(rel)
        mov     rbp, qword [rbp+8H]                     ; 07C9 _ 48: 8B. 6D, 08
        mov     rcx, rdi                                ; 07CD _ 48: 89. F9
        mov     edx, dword [rbp]                        ; 07D0 _ 8B. 55, 00
        call    _ZN8Position9undo_moveE4Move            ; 07D3 _ E8, 00000000(rel)
        mov     ecx, dword [r13+4D0H]                   ; 07D8 _ 41: 8B. 8D, 000004D0
        jmp     .text+702H                              ; 07DF _ E9, 00000702(rel)

        cmp     edi, ebx                                ; 07E4 _ 39. DF
        jl      ?_0033                                  ; 07E6 _ 0F 8C, 000009BA(rel)
        lea     eax, [rdi+rsi]                          ; 07EC _ 8D. 04 37
        mov     edi, 2                                  ; 07EF _ BF, 00000002
        sub     ebx, r14d                               ; 07F4 _ 44: 29. F3
        cdq                                             ; 07F7 _ 99
        idiv    edi                                     ; 07F8 _ F7. FF
        cmp     ebx, -32001                             ; 07FA _ 81. FB, FFFF82FF
        mov     edi, 4294935295                         ; 0800 _ BF, FFFF82FF
        cmovge  edi, ebx                                ; 0805 _ 0F 4D. FB
        mov     esi, eax                                ; 0808 _ 89. C6
        jmp     ?_0034                                  ; 080A _ E9, 000009E3(rel)

        mov     r13, qword [rsp+40H]                    ; 080F _ 4C: 8B. 6C 24, 40
        mov     dword [rsp+20H], esi                    ; 0814 _ 89. 74 24, 20
        mov     r9d, edi                                ; 0818 _ 41: 89. F9
        mov     rdx, rbp                                ; 081B _ 48: 89. EA
        mov     r8d, dword [r12+4D0H]                   ; 081E _ 45: 8B. 84 24, 000004D0
        mov     rcx, r13                                ; 0826 _ 4C: 89. E9
        call    _ZN3UCI8print_pvEPcRK8Position5Depth5ValueS5_; 0829 _ E8, 00001A70(rel)
        mov     rcx, r13                                ; 082E _ 4C: 89. E9
        mov     byte [rax], 10                          ; 0831 _ C6. 00, 0A
        lea     rdx, [rax+1H]                           ; 0834 _ 48: 8D. 50, 01
        call    _Z9write_outPcS_                        ; 0838 _ E8, 00000000(rel)
        cmp     edi, ebx                                ; 083D _ 39. DF
        jl      ?_0033                                  ; 083F _ 0F 8C, 000009BA(rel)
        lea     eax, [rdi+rsi]                          ; 0845 _ 8D. 04 37
        mov     r11d, 2                                 ; 0848 _ 41: BB, 00000002
        sub     ebx, r14d                               ; 084E _ 44: 29. F3
        cdq                                             ; 0851 _ 99
        mov     edi, 4294935295                         ; 0852 _ BF, FFFF82FF
        idiv    r11d                                    ; 0857 _ 41: F7. FB
        cmp     ebx, -32001                             ; 085A _ 81. FB, FFFF82FF
        cmovge  edi, ebx                                ; 0860 _ 0F 4D. FB
        mov     esi, eax                                ; 0863 _ 89. C6
        jmp     .text+9A9H                              ; 0865 _ E9, 000009A9(rel)

        mov     r13d, esi                               ; 086A _ 41: 89. F5
        mov     dword [rsp+50H], edi                    ; 086D _ 89. 7C 24, 50
        jmp     .text+9FFH                              ; 0871 _ E9, 000009FF(rel)

        mov     byte [rel _ZN6Search7SignalsE], 1       ; 0876 _ C6. 05, 00000097(rel), 01
        jmp     ?_0026                                  ; 087D _ E9, 0000083F(rel)

        mov     rdi, r12                                ; 0882 _ 4C: 89. E7
        mov     r12d, r13d                              ; 0885 _ 45: 89. EC
        mov     ecx, dword [rdi+4D0H]                   ; 0888 _ 8B. 8F, 000004D0
        mov     r13, rdi                                ; 088E _ 49: 89. FD
        jmp     .text+702H                              ; 0891 _ E9, 00000702(rel)

        add     r11d, 1                                 ; 0896 _ 41: 83. C3, 01
        cmp     dword [r12+4D0H], r11d                  ; 089A _ 45: 39. 9C 24, 000004D0
        jne     .text+819H                              ; 08A2 _ 0F 85, 00000819(rel)
        mov     rdx, qword [rsp+30H]                    ; 08A8 _ 48: 8B. 54 24, 30
        mov     rcx, qword [rsp+58H]                    ; 08AD _ 48: 8B. 4C 24, 58
        call    _ZN12_GLOBAL__N_15Skill9pick_bestEy     ; 08B2 _ E8, 00000075
        jmp     .text+819H                              ; 08B7 _ E9, 00000819(rel)

        cmp     r8, 3                                   ; 08BC _ 49: 83. F8, 03
        mov     r10d, 4                                 ; 08C0 _ 41: BA, 00000004
        cmovbe  r8, r10                                 ; 08C6 _ 4D: 0F 46. C2
        jmp     .text+691H                              ; 08CA _ E9, 00000691(rel)

        mov     rax, qword [r12+0D8H]                   ; 08CF _ 49: 8B. 84 24, 000000D8
        xor     edx, edx                                ; 08D7 _ 31. D2
        mov     r10d, 20                                ; 08D9 _ 41: BA, 00000014
        lea     rdi, [rel _ZN12_GLOBAL__N_1L11HalfDensityE]; 08DF _ 48: 8D. 3D, 00400100(rel)
        sub     rax, 1                                  ; 08E6 _ 48: 83. E8, 01
        div     r10                                     ; 08EA _ 49: F7. F2
        imul    r11, rdx, 24                            ; 08ED _ 4C: 6B. DA, 18
        mov     eax, dword [r12+498H]                   ; 08F1 _ 41: 8B. 84 24, 00000498
        xor     edx, edx                                ; 08F9 _ 31. D2
        add     eax, ebp                                ; 08FB _ 01. E8
        add     r11, rdi                                ; 08FD _ 49: 01. FB
        cdqe                                            ; 0900 _ 48: 98
        mov     rsi, qword [r11]                        ; 0902 _ 49: 8B. 33
        mov     rbp, qword [r11+8H]                     ; 0905 _ 49: 8B. 6B, 08
        sub     rbp, rsi                                ; 0909 _ 48: 29. F5
        sar     rbp, 2                                  ; 090C _ 48: C1. FD, 02
        div     rbp                                     ; 0910 _ 48: F7. F5
        cmp     dword [rsi+rdx*4], 0                    ; 0913 _ 83. 3C 96, 00
        jnz     ?_0272                                  ; 0917 _ 75, 05
        jmp     .text+78FH                              ; 0919 _ E9, 0000078F(rel)

?_0272: ; Local function
        mov     r9, r12                                 ; 091E _ 4D: 89. E1
        mov     r12d, r13d                              ; 0921 _ 45: 89. EC
        mov     r13, r9                                 ; 0924 _ 4D: 89. CD
        jmp     .text+702H                              ; 0927 _ E9, 00000702(rel)

_ZN12_GLOBAL__N_15Skill9pick_bestEy:; Local function
        push    r14                                     ; 092C _ 41: 56
        push    r13                                     ; 092E _ 41: 55
        push    r12                                     ; 0930 _ 41: 54
        push    rbp                                     ; 0932 _ 55
        push    rdi                                     ; 0933 _ 57
        push    rsi                                     ; 0934 _ 56
        push    rbx                                     ; 0935 _ 53
        sub     rsp, 32                                 ; 0936 _ 48: 83. EC, 20
        mov     r12, qword 2545F4914F6CDD1DH            ; 093A _ 49: BC, 2545F4914F6CDD1D
        mov     rbx, rcx                                ; 0944 _ 48: 89. CB
        mov     rcx, qword [rel .refptr.Threads]        ; 0947 _ 48: 8B. 0D, 00000000(rel)
        mov     rbp, rdx                                ; 094E _ 48: 89. D5
        call    _ZN10ThreadPool4mainEv                  ; 0951 _ E8, 00000000(rel)
        mov     r11d, 198                               ; 0956 _ 41: BB, 000000C6
        mov     r10d, 60                                ; 095C _ 41: BA, 0000003C
        mov     r9, qword [rel _ZN12_GLOBAL__N_14srngE] ; 0962 _ 4C: 8B. 0D, 000000A0(rel)
        mov     r8, qword [rax+4B8H]                    ; 0969 _ 4C: 8B. 80, 000004B8
        lea     rax, [rbp-1H]                           ; 0970 _ 48: 8D. 45, FF
        shl     rax, 5                                  ; 0974 _ 48: C1. E0, 05
        mov     edi, dword [r8]                         ; 0978 _ 41: 8B. 38
        mov     esi, edi                                ; 097B _ 89. FE
        sub     esi, dword [r8+rax]                     ; 097D _ 41: 2B. 34 00
        cmp     esi, 198                                ; 0981 _ 81. FE, 000000C6
        cmovle  r11d, esi                               ; 0987 _ 44: 0F 4E. DE
        sub     r10d, dword [rbx]                       ; 098B _ 44: 2B. 13
        xor     ecx, ecx                                ; 098E _ 31. C9
        mov     esi, 4294935295                         ; 0990 _ BE, FFFF82FF
        add     r10d, r10d                              ; 0995 _ 45: 01. D2
?_0273: mov     r14, r9                                 ; 0998 _ 4D: 89. CE
        mov     r13d, dword [r8]                        ; 099B _ 45: 8B. 28
        shr     r14, 12                                 ; 099E _ 49: C1. EE, 0C
        xor     r9, r14                                 ; 09A2 _ 4D: 31. F1
        mov     r14d, edi                               ; 09A5 _ 41: 89. FE
        mov     rax, r9                                 ; 09A8 _ 4C: 89. C8
        shl     rax, 25                                 ; 09AB _ 48: C1. E0, 19
        sub     r14d, r13d                              ; 09AF _ 45: 29. EE
        xor     r9, rax                                 ; 09B2 _ 49: 31. C1
        imul    r14d, r10d                              ; 09B5 _ 45: 0F AF. F2
        mov     rdx, r9                                 ; 09B9 _ 4C: 89. CA
        shr     rdx, 27                                 ; 09BC _ 48: C1. EA, 1B
        xor     r9, rdx                                 ; 09C0 _ 49: 31. D1
        xor     edx, edx                                ; 09C3 _ 31. D2
        mov     eax, r9d                                ; 09C5 _ 44: 89. C8
        imul    eax, r12d                               ; 09C8 _ 41: 0F AF. C4
        div     r10d                                    ; 09CC _ 41: F7. F2
        mov     eax, edx                                ; 09CF _ 89. D0
        imul    eax, r11d                               ; 09D1 _ 41: 0F AF. C3
        add     eax, r14d                               ; 09D5 _ 44: 01. F0
        shr     eax, 7                                  ; 09D8 _ C1. E8, 07
        add     eax, r13d                               ; 09DB _ 44: 01. E8
        cmp     esi, eax                                ; 09DE _ 39. C6
        jge     ?_0274                                  ; 09E0 _ 7D, 0D
        mov     rsi, qword [r8+8H]                      ; 09E2 _ 49: 8B. 70, 08
        mov     r13d, dword [rsi]                       ; 09E6 _ 44: 8B. 2E
        mov     esi, eax                                ; 09E9 _ 89. C6
        mov     dword [rbx+4H], r13d                    ; 09EB _ 44: 89. 6B, 04
?_0274: inc     rcx                                     ; 09EF _ 48: FF. C1
        add     r8, 32                                  ; 09F2 _ 49: 83. C0, 20
        cmp     rbp, rcx                                ; 09F6 _ 48: 39. CD
        ja      ?_0273                                  ; 09F9 _ 77, 9D
        mov     eax, dword [rbx+4H]                     ; 09FB _ 8B. 43, 04
        mov     qword [rel _ZN12_GLOBAL__N_14srngE], r9 ; 09FE _ 4C: 89. 0D, 000000A0(rel)
        add     rsp, 32                                 ; 0A05 _ 48: 83. C4, 20
        pop     rbx                                     ; 0A09 _ 5B
        pop     rsi                                     ; 0A0A _ 5E
        pop     rdi                                     ; 0A0B _ 5F
        pop     rbp                                     ; 0A0C _ 5D
        pop     r12                                     ; 0A0D _ 41: 5C
        pop     r13                                     ; 0A0F _ 41: 5D
        pop     r14                                     ; 0A11 _ 41: 5E
        ret                                             ; 0A13 _ C3

_ZN12_GLOBAL__N_16searchILNS_8NodeTypeE1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb.cold.203:; Local function
        mov     r8d, dword [rdi+8H]                     ; 0A14 _ 44: 8B. 47, 08
        jmp     ?_0493                                  ; 0A18 _ E9, 000014EC(rel)

        mov     r9, qword [rbx+100H]                    ; 0A1D _ 4C: 8B. 8B, 00000100
        mov     rax, r9                                 ; 0A24 _ 4C: 89. C8
        and     r9, qword [rbx+148H]                    ; 0A27 _ 4C: 23. 8B, 00000148
        and     rax, qword [rbx+140H]                   ; 0A2E _ 48: 23. 83, 00000140
        popcnt  r11, r9                                 ; 0A35 _ F3 4D: 0F B8. D9
        popcnt  r10, rax                                ; 0A3A _ F3 4C: 0F B8. D0
        add     r11d, r10d                              ; 0A3F _ 45: 01. D3
        cmp     r8d, r11d                               ; 0A42 _ 45: 39. D8
        jl      ?_0392                                  ; 0A45 _ 0F 8C, 0000020C(rel)
        jg      ?_0275                                  ; 0A4B _ 7F, 0C
        cmp     dword [rel _ZN10Tablebases10ProbeDepthE], ebp; 0A4D _ 39. 2D, 00000004(rel)
        jg      ?_0392                                  ; 0A53 _ 0F 8F, 0000020C(rel)
?_0275: mov     rdx, qword [rbx+3B8H]                   ; 0A59 _ 48: 8B. 93, 000003B8
        cmp     dword [rdx+1CH], 0                      ; 0A60 _ 83. 7A, 1C, 00
        jne     ?_0392                                  ; 0A64 _ 0F 85, 0000020C(rel)
        test    byte [rdx+18H], 0FH                     ; 0A6A _ F6. 42, 18, 0F
        jne     ?_0392                                  ; 0A6E _ 0F 85, 0000020C(rel)
        lea     rdx, [rsp+4C0H]                         ; 0A74 _ 48: 8D. 94 24, 000004C0
        mov     rcx, rbx                                ; 0A7C _ 48: 89. D9
        call    _ZN10Tablebases9probe_wdlER8PositionPi  ; 0A7F _ E8, 00000000(rel)
        cmp     dword [rsp+4C0H], 0                     ; 0A84 _ 83. BC 24, 000004C0, 00
        mov     r8d, eax                                ; 0A8C _ 41: 89. C0
        je      ?_0392                                  ; 0A8F _ 0F 84, 0000020C(rel)
        movzx   eax, byte [rel _ZN10Tablebases9UseRule50E]; 0A95 _ 0F B6. 05, 00000008(rel)
        add     qword [rel _ZN10Tablebases4HitsE], 1    ; 0A9C _ 48: 83. 05, 0000000F(rel), 01
        mov     ebx, eax                                ; 0AA4 _ 89. C3
        neg     ebx                                     ; 0AA6 _ F7. DB
        cmp     r8d, ebx                                ; 0AA8 _ 41: 39. D8
        jge     ?_0280                                  ; 0AAB _ 0F 8D, 00000090
        mov     r15d, dword [rdi+8H]                    ; 0AB1 _ 44: 8B. 7F, 08
        lea     eax, [r15-7C80H]                        ; 0AB5 _ 41: 8D. 87, FFFF8380
?_0276: mov     rdi, qword [rel .refptr.TT]             ; 0ABC _ 48: 8B. 3D, 00000000(rel)
        add     ebp, 6                                  ; 0AC3 _ 83. C5, 06
        mov     r14d, 127                               ; 0AC6 _ 41: BE, 0000007F
        cmp     ebp, 127                                ; 0ACC _ 83. FD, 7F
        cmovge  ebp, r14d                               ; 0ACF _ 41: 0F 4D. EE
        cmp     eax, 31743                              ; 0AD3 _ 3D, 00007BFF
        movzx   r12d, byte [rdi+18H]                    ; 0AD8 _ 44: 0F B6. 67, 18
        jle     ?_0279                                  ; 0ADD _ 7E, 4F
        add     r15d, eax                               ; 0ADF _ 41: 01. C7
?_0277: mov     rcx, qword [rsp+0A8H]                   ; 0AE2 _ 48: 8B. 8C 24, 000000A8
        mov     r13, qword [rsp+0B8H]                   ; 0AEA _ 4C: 8B. AC 24, 000000B8
        movzx   r9d, word [rcx]                         ; 0AF2 _ 44: 0F B7. 09
        shr     r13, 48                                 ; 0AF6 _ 49: C1. ED, 30
        cmp     r13, r9                                 ; 0AFA _ 4D: 39. CD
        jz      ?_0278                                  ; 0AFD _ 74, 06
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [rcx+2H], 0                        ; 0AFF _ 66: C7. 41, 02, 0000
?_0278: mov     r10, qword [rsp+0A8H]                   ; 0B05 _ 4C: 8B. 94 24, 000000A8
        or      r12d, 03H                               ; 0B0D _ 41: 83. CC, 03
        mov     word [r10], r13w                        ; 0B11 _ 66 45: 89. 2A
        mov     word [r10+4H], r15w                     ; 0B15 _ 66 45: 89. 7A, 04
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [r10+6H], 32002                    ; 0B1A _ 66 41: C7. 42, 06, 7D02
        mov     byte [r10+8H], r12b                     ; 0B21 _ 45: 88. 62, 08
        mov     byte [r10+9H], bpl                      ; 0B25 _ 41: 88. 6A, 09
        jmp     ?_0395                                  ; 0B29 _ E9, 000002B5(rel)

?_0279: mov     esi, eax                                ; 0B2E _ 89. C6
        sub     esi, r15d                               ; 0B30 _ 44: 29. FE
        cmp     eax, 4294935552                         ; 0B33 _ 3D, FFFF8400
        mov     r15d, esi                               ; 0B38 _ 41: 89. F7
        cmovg   r15d, eax                               ; 0B3B _ 44: 0F 4F. F8
        jmp     ?_0277                                  ; 0B3F _ EB, A1

?_0280: ; Local function
        cmp     r8d, eax                                ; 0B41 _ 41: 39. C0
        jle     ?_0281                                  ; 0B44 _ 7E, 27
        mov     eax, 31872                              ; 0B46 _ B8, 00007C80
        mov     r15d, dword [rdi+8H]                    ; 0B4B _ 44: 8B. 7F, 08
        sub     eax, dword [rdi+8H]                     ; 0B4F _ 2B. 47, 08
        jmp     ?_0276                                  ; 0B52 _ E9, FFFFFF65

; Note: No jump seems to point here
        xor     eax, eax                                ; 0B57 _ 31. C0
        jmp     ?_0395                                  ; 0B59 _ E9, 000002B5(rel)

; Note: No jump seems to point here
        mov     eax, dword [rsp+0FCH]                   ; 0B5E _ 8B. 84 24, 000000FC
        xor     r8d, r8d                                ; 0B65 _ 45: 31. C0
        jmp     ?_0405                                  ; 0B68 _ E9, 000005BA(rel)

?_0281: ; Local function
        add     r8d, r8d                                ; 0B6D _ 45: 01. C0
        mov     r15d, dword [rdi+8H]                    ; 0B70 _ 44: 8B. 7F, 08
        imul    eax, r8d                                ; 0B74 _ 41: 0F AF. C0
        jmp     ?_0276                                  ; 0B78 _ E9, FFFFFF3F

        mov     edx, 1                                  ; 0B7D _ BA, 00000001
        mov     rcx, r12                                ; 0B82 _ 4C: 89. E1
        call    _ZNSt6vectorI4MoveSaIS0_EE17_M_default_appendEy; 0B85 _ E8, 00000000(rel)
        jmp     ?_0482                                  ; 0B8A _ E9, 000013EE(rel)

        mov     r8, qword [rsp+0A8H]                    ; 0B8F _ 4C: 8B. 84 24, 000000A8
        cmp     byte [r8+9H], -4                        ; 0B97 _ 41: 80. 78, 09, FC
        jge     ?_0394                                  ; 0B9C _ 0F 8D, 00000268(rel)
        jmp     .text.hot+137FH                         ; 0BA2 _ E9, 0000137F(rel)

        mov     ecx, 40                                 ; 0BA7 _ B9, 00000028
        sub     ecx, dword [rdi-0CH]                    ; 0BAC _ 2B. 4F, F4
        jmp     .text.hot+1348H                         ; 0BAF _ E9, 00001348(rel)

        mov     dword [rsp+0C0H], 0                     ; 0BB4 _ C7. 84 24, 000000C0, 00000000
        jmp     ?_0398                                  ; 0BBF _ E9, 000002DF(rel)

        jmp     ?_0399                                  ; 0BC4 _ E9, 00000451(rel)

        mov     eax, dword [rsp+0DA0H]                  ; 0BC9 _ 8B. 84 24, 00000DA0
        jmp     ?_0395                                  ; 0BD0 _ E9, 000002B5(rel)

        mov     edx, dword [rel ?_0188]                 ; 0BD5 _ 8B. 15, 004000F8(rel)
        test    edx, edx                                ; 0BDB _ 85. D2
        je      ?_0428                                  ; 0BDD _ 0F 84, 00000AE9(rel)
        cmp     esi, 1                                  ; 0BE3 _ 83. FE, 01
        jnz     ?_0282                                  ; 0BE6 _ 75, 0D
        cmp     dword [rsp+0FCH], edx                   ; 0BE8 _ 39. 94 24, 000000FC
        je      ?_0428                                  ; 0BEF _ 0F 84, 00000AE9(rel)
?_0282: mov     dword [rel _ZN12_GLOBAL__N_18EasyMoveE], 0; 0BF5 _ C7. 05, 004000DC(rel), 00000000
        mov     qword [rel ?_0184], 0                   ; 0BFF _ 48: C7. 05, 004000E4(rel), 00000000
        mov     dword [rel ?_0188], 0                   ; 0C0A _ C7. 05, 004000F4(rel), 00000000
        mov     dword [rel ?_0187], 0                   ; 0C14 _ C7. 05, 004000F0(rel), 00000000
        mov     dword [rel ?_0186], 0                   ; 0C1E _ C7. 05, 004000EC(rel), 00000000
        jmp     ?_0428                                  ; 0C28 _ E9, 00000AE9(rel)

        mov     rcx, rbx                                ; 0C2D _ 48: 89. D9
        call    _ZNK8Position13exclusion_keyEv          ; 0C30 _ E8, 00000000(rel)
        mov     qword [rsp+0B8H], rax                   ; 0C35 _ 48: 89. 84 24, 000000B8
        mov     rdx, rax                                ; 0C3D _ 48: 89. C2
        jmp     .text.hot+18EH                          ; 0C40 _ E9, 0000018E(rel)

        mov     r11d, dword [rdi+1CH]                   ; 0C45 _ 44: 8B. 5F, 1C
        lea     r8d, [r11+100H]                         ; 0C49 _ 45: 8D. 83, 00000100
        cmp     dword [rsp+0DA0H], r8d                  ; 0C50 _ 44: 39. 84 24, 00000DA0
        jge     ?_0466                                  ; 0C58 _ 0F 8D, 00001164(rel)
        jmp     ?_0423                                  ; 0C5E _ E9, 000009E0(rel)

_ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth.cold.204:; Local function
        mov     rcx, rsi                                ; 0C63 _ 48: 89. F1
        mov     dword [rsp+34H], r8d                    ; 0C66 _ 44: 89. 44 24, 34
        call    _ZN4Eval8evaluateERK8Position           ; 0C6B _ E8, 00000000(rel)
        mov     r8d, dword [rsp+34H]                    ; 0C70 _ 44: 8B. 44 24, 34
        mov     ebx, eax                                ; 0C75 _ 89. C3
        mov     dword [r14+1CH], eax                    ; 0C77 _ 41: 89. 46, 1C
        jmp     .text+11DFH                             ; 0C7B _ E9, 000011DF(rel)

        add     ebp, r9d                                ; 0C80 _ 44: 01. CD
        jmp     .text+11CFH                             ; 0C83 _ E9, 000011CF(rel)

        lea     r9d, [r14+rbx]                          ; 0C88 _ 45: 8D. 0C 1E
        jmp     .text+0F53H                             ; 0C8C _ E9, 00000F53(rel)

        mov     rcx, rsi                                ; 0C91 _ 48: 89. F1
        call    _ZN4Eval8evaluateERK8Position           ; 0C94 _ E8, 00000000(rel)
        jmp     ?_0059                                  ; 0C99 _ E9, 00000F93(rel)

        mov     ebx, 40                                 ; 0C9E _ BB, 00000028
        sub     ebx, dword [r14-0CH]                    ; 0CA3 _ 41: 2B. 5E, F4
        jmp     .text+1043H                             ; 0CA7 _ E9, 00001043(rel)

        cmp     byte [rdi+9H], -4                       ; 0CAC _ 80. 7F, 09, FC
        mov     eax, ebx                                ; 0CB0 _ 89. D8
        jge     ?_0059                                  ; 0CB2 _ 0F 8D, 00000F93(rel)
        jmp     .text+100BH                             ; 0CB8 _ E9, 0000100B(rel)

        add     r9d, ebx                                ; 0CBD _ 41: 01. D9
        jmp     .text+0FEEH                             ; 0CC0 _ E9, 00000FEE(rel)

        xor     r12d, r12d                              ; 0CC5 _ 45: 31. E4
        jmp     ?_0048                                  ; 0CC8 _ E9, 00000D96(rel)

_ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth.cold.205:; Local function
        mov     r8d, r13d                               ; 0CCD _ 45: 89. E8
        sub     r8d, edx                                ; 0CD0 _ 41: 29. D0
        mov     edx, r8d                                ; 0CD3 _ 44: 89. C2
        jmp     ?_0519                                  ; 0CD6 _ E9, 00001926(rel)

        mov     rcx, rbx                                ; 0CDB _ 48: 89. D9
        call    _ZN4Eval8evaluateERK8Position           ; 0CDE _ E8, 00000000(rel)
        jmp     ?_0524                                  ; 0CE3 _ E9, 000019D3(rel)

        mov     edi, esi                                ; 0CE8 _ 89. F7
        sub     edi, r12d                               ; 0CEA _ 44: 29. E7
        mov     r12d, edi                               ; 0CED _ 41: 89. FC
        jmp     .text.hot+1993H                         ; 0CF0 _ E9, 00001993(rel)

        add     r12d, esi                               ; 0CF5 _ 41: 01. F4
        jmp     .text.hot+1993H                         ; 0CF8 _ E9, 00001993(rel)

        mov     r9d, esi                                ; 0CFD _ 41: 89. F1
        sub     r9d, r12d                               ; 0D00 _ 45: 29. E1
        mov     r12d, r9d                               ; 0D03 _ 45: 89. CC
        jmp     .text.hot+1A46H                         ; 0D06 _ E9, 00001A46(rel)

        add     r12d, esi                               ; 0D0B _ 41: 01. F4
        jmp     .text.hot+1A46H                         ; 0D0E _ E9, 00001A46(rel)

_ZN12_GLOBAL__N_112update_statsERK8PositionPN6Search5StackE4Move5DepthPS6_i.cold.206:; Local function
        mov     esi, edi                                ; 0D13 _ 89. FE
        jmp     .text.hot+1EE7H                         ; 0D15 _ E9, 00001EE7(rel)

        test    sil, sil                                ; 0D1A _ 40: 84. F6
        jne     ?_0562                                  ; 0D1D _ 0F 85, 00001EF2(rel)
        xor     ebp, ebp                                ; 0D23 _ 31. ED
        mov     esi, 512                                ; 0D25 _ BE, 00000200
?_0283: mov     r9, qword [rsp+0A0H]                    ; 0D2A _ 4C: 8B. 8C 24, 000000A0
        mov     edx, dword [r9+rbp*4]                   ; 0D32 _ 41: 8B. 14 A9
        add     rbp, 1                                  ; 0D36 _ 48: 83. C5, 01
        mov     r9d, dword [rsp+20H]                    ; 0D3A _ 44: 8B. 4C 24, 20
        mov     eax, edx                                ; 0D3F _ 89. D0
        and     edx, 3FH                                ; 0D41 _ 83. E2, 3F
        sar     eax, 6                                  ; 0D44 _ C1. F8, 06
        and     eax, 3FH                                ; 0D47 _ 83. E0, 3F
        mov     edi, dword [rcx+rax*4]                  ; 0D4A _ 8B. 3C 81
        shl     rdi, 8                                  ; 0D4D _ 48: C1. E7, 08
        add     rdi, qword [rsp+8H]                     ; 0D51 _ 48: 03. 7C 24, 08
        lea     r10, [rdi+rdx*4]                        ; 0D56 _ 4C: 8D. 14 97
        mov     r8d, dword [r10]                        ; 0D5A _ 45: 8B. 02
        mov     eax, r8d                                ; 0D5D _ 44: 89. C0
        imul    eax, r13d                               ; 0D60 _ 41: 0F AF. C5
        cdq                                             ; 0D64 _ 99
        idiv    esi                                     ; 0D65 _ F7. FE
        sub     r8d, eax                                ; 0D67 _ 41: 29. C0
        add     r9d, r8d                                ; 0D6A _ 45: 01. C1
        cmp     dword [rsp+0A8H], ebp                   ; 0D6D _ 39. AC 24, 000000A8
        mov     dword [r10], r9d                        ; 0D74 _ 45: 89. 0A
        jg      ?_0283                                  ; 0D77 _ 7F, B1
        jmp     ?_0562                                  ; 0D79 _ E9, 00001EF2(rel)

        mov     ebp, dword [rbx-1CH]                    ; 0D7E _ 8B. 6B, E4
        mov     r8, qword [rsp+10H]                     ; 0D81 _ 4C: 8B. 44 24, 10
        mov     esi, ebp                                ; 0D86 _ 89. EE
        mov     r10d, ebp                               ; 0D88 _ 41: 89. EA
        lea     rbp, [r8+4D4H]                          ; 0D8B _ 49: 8D. A8, 000004D4
        sar     esi, 6                                  ; 0D92 _ C1. FE, 06
        and     r10d, 3FH                               ; 0D95 _ 41: 83. E2, 3F
        mov     edi, esi                                ; 0D99 _ 89. F7
        mov     qword [rsp+8H], r10                     ; 0D9B _ 4C: 89. 54 24, 08
        and     edi, 3FH                                ; 0DA0 _ 83. E7, 3F
        mov     qword [rsp+28H], rdi                    ; 0DA3 _ 48: 89. 7C 24, 28
        xor     edi, edi                                ; 0DA8 _ 31. FF
?_0284: mov     rax, qword [rsp+0A0H]                   ; 0DAA _ 48: 8B. 84 24, 000000A0
        mov     esi, 324                                ; 0DB2 _ BE, 00000144
        mov     r9d, dword [rax+rdi*4]                  ; 0DB7 _ 44: 8B. 0C B8
        mov     edx, r9d                                ; 0DBB _ 44: 89. CA
        and     r9d, 3FH                                ; 0DBE _ 41: 83. E1, 3F
        lea     r9, [r9*4]                              ; 0DC2 _ 4E: 8D. 0C 8D, 00000000
        sar     edx, 6                                  ; 0DCA _ C1. FA, 06
        and     edx, 3FH                                ; 0DCD _ 83. E2, 3F
        mov     r8d, dword [rcx+rdx*4]                  ; 0DD0 _ 44: 8B. 04 91
        shl     r8, 8                                   ; 0DD4 _ 49: C1. E0, 08
        lea     r10, [rbp+r8]                           ; 0DD8 _ 4E: 8D. 54 05, 00
        add     r10, r9                                 ; 0DDD _ 4D: 01. CA
        mov     eax, dword [r10]                        ; 0DE0 _ 41: 8B. 02
        imul    eax, r13d                               ; 0DE3 _ 41: 0F AF. C5
        cdq                                             ; 0DE7 _ 99
        idiv    esi                                     ; 0DE8 _ F7. FE
        mov     esi, dword [r10]                        ; 0DEA _ 41: 8B. 32
        sub     esi, eax                                ; 0DED _ 29. C6
        mov     eax, dword [rsp+24H]                    ; 0DEF _ 8B. 44 24, 24
        add     eax, esi                                ; 0DF3 _ 01. F0
        mov     dword [r10], eax                        ; 0DF5 _ 41: 89. 02
        mov     r10, qword [rsp+28H]                    ; 0DF8 _ 4C: 8B. 54 24, 28
        cmp     qword [rsp+8H], r10                     ; 0DFD _ 4C: 39. 54 24, 08
        jz      ?_0285                                  ; 0E02 _ 74, 27
        add     r8, qword [rsp]                         ; 0E04 _ 4C: 03. 04 24
        mov     esi, 512                                ; 0E08 _ BE, 00000200
        mov     r10d, dword [rsp+20H]                   ; 0E0D _ 44: 8B. 54 24, 20
        add     r9, r8                                  ; 0E12 _ 4D: 01. C1
        mov     r8d, dword [r9]                         ; 0E15 _ 45: 8B. 01
        mov     eax, r8d                                ; 0E18 _ 44: 89. C0
        imul    eax, r13d                               ; 0E1B _ 41: 0F AF. C5
        cdq                                             ; 0E1F _ 99
        idiv    esi                                     ; 0E20 _ F7. FE
        sub     r8d, eax                                ; 0E22 _ 41: 29. C0
        add     r10d, r8d                               ; 0E25 _ 45: 01. C2
        mov     dword [r9], r10d                        ; 0E28 _ 45: 89. 11
?_0285: add     rdi, 1                                  ; 0E2B _ 48: 83. C7, 01
        cmp     dword [rsp+0A8H], edi                   ; 0E2F _ 39. BC 24, 000000A8
        jg      ?_0284                                  ; 0E36 _ 0F 8F, FFFFFF6E
        jmp     ?_0562                                  ; 0E3C _ E9, 00001EF2(rel)

        sar     edi, 6                                  ; 0E41 _ C1. FF, 06
        mov     r12d, edi                               ; 0E44 _ 41: 89. FC
        and     r12d, 3FH                               ; 0E47 _ 41: 83. E4, 3F
        cmp     r12, r14                                ; 0E4B _ 4D: 39. F4
        sete    sil                                     ; 0E4E _ 40: 0F 94. C6
        jmp     .text.hot+1EE7H                         ; 0E52 _ E9, 00001EE7(rel)

?_0286: ; Local function
        mov     r9d, dword [r10]                        ; 0E57 _ 45: 8B. 0A
        mov     rdx, qword [rsp+10H]                    ; 0E5A _ 48: 8B. 54 24, 10
        mov     eax, r9d                                ; 0E5F _ 44: 89. C8
        and     r9d, 3FH                                ; 0E62 _ 41: 83. E1, 3F
        lea     r9, [r9*4]                              ; 0E66 _ 4E: 8D. 0C 8D, 00000000
        sar     eax, 6                                  ; 0E6E _ C1. F8, 06
        and     eax, 3FH                                ; 0E71 _ 83. E0, 3F
        mov     r8d, dword [rcx+rax*4]                  ; 0E74 _ 44: 8B. 04 81
        mov     eax, 424194301                          ; 0E78 _ B8, 1948B0FD
        shl     r8, 8                                   ; 0E7D _ 49: C1. E0, 08
        lea     rdi, [rdx+r8]                           ; 0E81 _ 4A: 8D. 3C 02
        add     rdi, r9                                 ; 0E85 _ 4C: 01. CF
        mov     esi, dword [rdi]                        ; 0E88 _ 8B. 37
        mov     ebp, esi                                ; 0E8A _ 89. F5
        imul    ebp, r13d                               ; 0E8C _ 41: 0F AF. ED
        imul    ebp                                     ; 0E90 _ F7. ED
        sar     ebp, 31                                 ; 0E92 _ C1. FD, 1F
        mov     eax, edx                                ; 0E95 _ 89. D0
        sar     eax, 5                                  ; 0E97 _ C1. F8, 05
        sub     eax, ebp                                ; 0E9A _ 29. E8
        mov     ebp, dword [rsp+24H]                    ; 0E9C _ 8B. 6C 24, 24
        sub     esi, eax                                ; 0EA0 _ 29. C6
        add     ebp, esi                                ; 0EA2 _ 01. F5
        mov     dword [rdi], ebp                        ; 0EA4 _ 89. 2F
        mov     rdi, qword [rsp+8H]                     ; 0EA6 _ 48: 8B. 7C 24, 08
        add     rdi, r8                                 ; 0EAB _ 4C: 01. C7
        add     rdi, r9                                 ; 0EAE _ 4C: 01. CF
        mov     esi, dword [rdi]                        ; 0EB1 _ 8B. 37
        mov     r9d, esi                                ; 0EB3 _ 41: 89. F1
        imul    r9d, r13d                               ; 0EB6 _ 45: 0F AF. CD
        lea     r8d, [r9+1FFH]                          ; 0EBA _ 45: 8D. 81, 000001FF
        test    r9d, r9d                                ; 0EC1 _ 45: 85. C9
        cmovns  r8d, r9d                                ; 0EC4 _ 45: 0F 49. C1
        add     r10, 4                                  ; 0EC8 _ 49: 83. C2, 04
        sar     r8d, 9                                  ; 0ECC _ 41: C1. F8, 09
        sub     esi, r8d                                ; 0ED0 _ 44: 29. C6
        add     esi, dword [rsp+20H]                    ; 0ED3 _ 03. 74 24, 20
        cmp     r10, qword [rsp+28H]                    ; 0ED7 _ 4C: 3B. 54 24, 28
        mov     dword [rdi], esi                        ; 0EDC _ 89. 37
        jne     ?_0286                                  ; 0EDE _ 0F 85, FFFFFF73
        jmp     ?_0562                                  ; 0EE4 _ E9, 00001EF2(rel)

_ZSt13__stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_.isra.177.cold.207:; Local function
        call    _ZdlPv                                  ; 0EE9 _ E8, 00000000(rel)
        jmp     .text+16B1H                             ; 0EEE _ E9, 000016B1(rel)

        call    _ZdlPv                                  ; 0EF3 _ E8, 00000000(rel)
        jmp     .text+16BEH                             ; 0EF8 _ E9, 000016BE(rel)

        call    _ZdlPv                                  ; 0EFD _ E8, 00000000(rel)
        jmp     .text+1693H                             ; 0F02 _ E9, 00001693(rel)

        call    _ZdlPv                                  ; 0F07 _ E8, 00000000(rel)
        jmp     .text+16FBH                             ; 0F0C _ E9, 000016FB(rel)

        call    _ZdlPv                                  ; 0F11 _ E8, 00000000(rel)
        jmp     .text+16EBH                             ; 0F16 _ E9, 000016EB(rel)

        call    _ZdlPv                                  ; 0F1B _ E8, 00000000(rel)
        jmp     .text+16DBH                             ; 0F20 _ E9, 000016DB(rel)

        call    _ZdlPv                                  ; 0F25 _ E8, 00000000(rel)
        jmp     .text+16CBH                             ; 0F2A _ E9, 000016CB(rel)

        call    _ZdlPv                                  ; 0F2F _ E8, 00000000(rel)
        jmp     .text+1679H                             ; 0F34 _ E9, 00001679(rel)

        call    _ZdlPv                                  ; 0F39 _ E8, 00000000(rel)
        jmp     .text+15C8H                             ; 0F3E _ E9, 000015C8(rel)

        sar     rsi, 1                                  ; 0F43 _ 48: D1. FE
        jmp     .text+122CH                             ; 0F46 _ E9, 0000122C(rel)

        xor     r8d, r8d                                ; 0F4B _ 45: 31. C0
        mov     rdx, rbp                                ; 0F4E _ 48: 89. EA
        mov     rcx, r12                                ; 0F51 _ 4C: 89. E1
        call    _ZSt21__inplace_stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_; 0F54 _ E8, 00000000(rel)
        xor     edi, edi                                ; 0F59 _ 31. FF
        jmp     ?_0106                                  ; 0F5B _ E9, 0000170B(rel)

        call    _ZdlPv                                  ; 0F60 _ E8, 00000000(rel)
        jmp     .text+1646H                             ; 0F65 _ E9, 00001646(rel)

        call    _ZdlPv                                  ; 0F6A _ E8, 00000000(rel)
        jmp     .text+1635H                             ; 0F6F _ E9, 00001635(rel)

        call    _ZdlPv                                  ; 0F74 _ E8, 00000000(rel)
        jmp     .text+1624H                             ; 0F79 _ E9, 00001624(rel)

        call    _ZdlPv                                  ; 0F7E _ E8, 00000000(rel)
        jmp     .text+1613H                             ; 0F83 _ E9, 00001613(rel)

        call    _ZdlPv                                  ; 0F88 _ E8, 00000000(rel)
        jmp     .text+1668H                             ; 0F8D _ E9, 00001668(rel)

        call    _ZdlPv                                  ; 0F92 _ E8, 00000000(rel)
        jmp     .text+1657H                             ; 0F97 _ E9, 00001657(rel)

        call    _ZdlPv                                  ; 0F9C _ E8, 00000000(rel)
        jmp     .text+16A4H                             ; 0FA1 _ E9, 000016A4(rel)

_ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121.cold.208:; Local function
        mov     rcx, rax                                ; 0FA6 _ 48: 89. C1
        jmp     _ZdlPv                                  ; 0FA9 _ E9, 00000000(rel)

_ZSt24__merge_sort_with_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_NS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_.isra.176.cold.209:; Local function
        lea     r10, [rcx+r11]                          ; 0FAE _ 4E: 8D. 14 19
        mov     qword [rsp+20H], rax                    ; 0FB2 _ 48: 89. 44 24, 20
        lea     rdx, [r10+r13]                          ; 0FB7 _ 4B: 8D. 14 2A
        mov     r9, r10                                 ; 0FBB _ 4D: 89. D1
        mov     qword [rsp+48H], r11                    ; 0FBE _ 4C: 89. 5C 24, 48
        mov     r8, rdx                                 ; 0FC3 _ 49: 89. D0
        mov     qword [rsp+40H], r10                    ; 0FC6 _ 4C: 89. 54 24, 40
        call    _ZSt12__move_mergeIPN6Search8RootMoveEN9__gnu_cxx17__normal_iteratorIS2_St6vectorIS1_SaIS1_EEEENS3_5__ops15_Iter_less_iterEET0_T_SC_SC_SC_SB_T1_.isra.175; 0FCB _ E8, 00001890(rel)
        mov     rcx, qword [rsp+40H]                    ; 0FD0 _ 48: 8B. 4C 24, 40
        mov     r11, qword [rsp+48H]                    ; 0FD5 _ 4C: 8B. 5C 24, 48
        jmp     .text+1824H                             ; 0FDA _ E9, 00001824(rel)

        nop                                             ; 0FDF _ 90

ALIGN   16
_ZN6Search8RootMove15insert_pv_in_ttER8Position.cold.210:; Local function
        mov     r8, rdx                                 ; 0FE0 _ 49: 89. D0
        shr     r8, 48                                  ; 0FE3 _ 49: C1. E8, 30
        cmp     r8, rcx                                 ; 0FE7 _ 49: 39. C8
        je      .text+1A5AH                             ; 0FEA _ 0F 84, 00001A5A(rel)
        jmp     .text+1A49H                             ; 0FF0 _ E9, 00001A49(rel)

        mov     rdx, rcx                                ; 0FF5 _ 48: 89. CA
        mov     word [rax], dx                          ; 0FF8 _ 66: 89. 10
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [rax+4H], 32002                    ; 0FFB _ 66: C7. 40, 04, 7D02
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [rax+6H], 32002                    ; 1001 _ 66: C7. 40, 06, 7D02
        mov     byte [rax+8H], r11b                     ; 1007 _ 44: 88. 58, 08
        mov     byte [rax+9H], -6                       ; 100B _ C6. 40, 09, FA
        jmp     ?_0124                                  ; 100F _ E9, 000019A7(rel)

_ZN3UCI8print_pvEPcRK8Position5Depth5ValueS5_.cold.211:; Local function
        lea     rdx, [rel ?_0334]                       ; 1014 _ 48: 8D. 15, 00000054(rel)
        mov     rcx, rax                                ; 101B _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 101E _ E8, 00000000(rel)
        jmp     ?_0130                                  ; 1023 _ E9, 00001BEC(rel)

        mov     edx, esi                                ; 1028 _ 89. F2
        sar     edx, 31                                 ; 102A _ C1. FA, 1F
        mov     ecx, edx                                ; 102D _ 89. D1
        xor     ecx, esi                                ; 102F _ 31. F1
        sub     ecx, edx                                ; 1031 _ 29. D1
        cmp     ecx, 31871                              ; 1033 _ 81. F9, 00007C7F
        jg      .text+1B53H                             ; 1039 _ 0F 8F, 00001B53(rel)
        lea     rdx, [rel ?_0341]                       ; 103F _ 48: 8D. 15, 00000092(rel)
        mov     rcx, rax                                ; 1046 _ 48: 89. C1
        mov     esi, dword [rel _ZN10Tablebases5ScoreE] ; 1049 _ 8B. 35, 00000000(rel)
        call    _Z12print_stringPcPKc                   ; 104F _ E8, 00000000(rel)
        mov     edx, r13d                               ; 1054 _ 44: 89. EA
        lea     r13, [rdi+1H]                           ; 1057 _ 4C: 8D. 6F, 01
        mov     rcx, rax                                ; 105B _ 48: 89. C1
        call    _Z9print_intPci                         ; 105E _ E8, 00000000(rel)
        lea     rdx, [rel ?_0342]                       ; 1063 _ 48: 8D. 15, 0000009E(rel)
        mov     rcx, rax                                ; 106A _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 106D _ E8, 00000000(rel)
        mov     r8, qword [rbx+3B0H]                    ; 1072 _ 4C: 8B. 83, 000003B0
        mov     rcx, rax                                ; 1079 _ 48: 89. C1
        mov     edx, dword [r8+0E8H]                    ; 107C _ 41: 8B. 90, 000000E8
        call    _Z9print_intPci                         ; 1083 _ E8, 00000000(rel)
        lea     rdx, [rel ?_0343]                       ; 1088 _ 48: 8D. 15, 000000A9(rel)
        mov     rcx, rax                                ; 108F _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 1092 _ E8, 00000000(rel)
        mov     rdx, r13                                ; 1097 _ 4C: 89. EA
        mov     rcx, rax                                ; 109A _ 48: 89. C1
        call    _Z9print_intPcy                         ; 109D _ E8, 00000000(rel)
        lea     rdx, [rel ?_0344]                       ; 10A2 _ 48: 8D. 15, 000000B3(rel)
        mov     rcx, rax                                ; 10A9 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 10AC _ E8, 00000000(rel)
        mov     edx, esi                                ; 10B1 _ 89. F2
        mov     rcx, rax                                ; 10B3 _ 48: 89. C1
        call    _ZN3UCI11print_valueEPc5Value           ; 10B6 _ E8, 00000000(rel)
        jmp     ?_0130                                  ; 10BB _ E9, 00001BEC(rel)

        lea     r13d, [r14-1H]                          ; 10C0 _ 45: 8D. 6E, FF
        mov     r11, rdi                                ; 10C4 _ 49: 89. FB
        shl     r11, 5                                  ; 10C7 _ 49: C1. E3, 05
        add     r11, qword [rbp+4B8H]                   ; 10CB _ 4C: 03. 9D, 000004B8
        mov     esi, dword [r11+4H]                     ; 10D2 _ 41: 8B. 73, 04
        jmp     .text+1B46H                             ; 10D6 _ E9, 00001B46(rel)

        lea     rdx, [rel ?_0335]                       ; 10DB _ 48: 8D. 15, 00000060(rel)
        mov     rcx, rax                                ; 10E2 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 10E5 _ E8, 00000000(rel)
        jmp     ?_0130                                  ; 10EA _ E9, 00001BEC(rel)

        nop                                             ; 10EF _ 90

ALIGN   16
_ZNK14TimeManagement7elapsedEv.isra.20.constprop.199.cold.212:; Local function
        mov     rcx, qword [rel .refptr.Threads]        ; 10F0 _ 48: 8B. 0D, 00000000(rel)
        call    _ZN10ThreadPool14nodes_searchedEv       ; 10F7 _ E8, 00000000(rel)
        jmp     .text+1D20H                             ; 10FC _ E9, 00001D20(rel)

        nop                                             ; 1101 _ 90

_ZN9__gnu_cxx13new_allocatorI4MoveE8allocateEyPKv.isra.146.cold.213:; Local function
        call    _ZSt17__throw_bad_allocv                ; 1102 _ E8, 00000000(rel)
        nop                                             ; 1107 _ 90
_ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb.cold.214:
        lea     r13, [rbx+4D4H]                         ; 1108 _ 4C: 8D. AB, 000004D4
        lea     r11, [rsp+2D0H]                         ; 110F _ 4C: 8D. 9C 24, 000002D0
        mov     qword [rsp+0B8H], r13                   ; 1117 _ 4C: 89. AC 24, 000000B8
        mov     qword [rsp+68H], r11                    ; 111F _ 4C: 89. 5C 24, 68
        jmp     ?_0588                                  ; 1124 _ E9, 00002696(rel)

        mov     dword [rsp+90H], 0                      ; 1129 _ C7. 84 24, 00000090, 00000000
        mov     r13d, r14d                              ; 1134 _ 45: 89. F5
        jmp     ?_0589                                  ; 1137 _ E9, 000026B8(rel)

        mov     r8d, dword [rsp+98H]                    ; 113C _ 44: 8B. 84 24, 00000098
        mov     rdx, rdi                                ; 1144 _ 48: 89. FA
        mov     dword [rsp+20H], 0                      ; 1147 _ C7. 44 24, 20, 00000000
        mov     rcx, rsi                                ; 114F _ 48: 89. F1
        mov     r9d, r8d                                ; 1152 _ 45: 89. C1
        lea     r8d, [r8-1H]                            ; 1155 _ 45: 8D. 40, FF
        call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 1159 _ E8, 00001620(rel)
        mov     edx, eax                                ; 115E _ 89. C2
        jmp     .text.hot+265DH                         ; 1160 _ E9, 0000265D(rel)

        sar     r9d, 6                                  ; 1165 _ 41: C1. F9, 06
        and     r9d, 3FH                                ; 1169 _ 41: 83. E1, 3F
        jmp     ?_0634                                  ; 116D _ E9, 00003351(rel)

        mov     r14d, dword [rdi+8H]                    ; 1172 _ 44: 8B. 77, 08
        jmp     ?_0605                                  ; 1176 _ E9, 00002C43(rel)

        mov     r10d, dword [rdi+1CH]                   ; 117B _ 44: 8B. 57, 1C
        add     r10d, 256                               ; 117F _ 41: 81. C2, 00000100
        cmp     r10d, dword [rsp+94H]                   ; 1186 _ 44: 3B. 94 24, 00000094
        jle     ?_0620                                  ; 118E _ 0F 8E, 00002F30(rel)
        jmp     .text.hot+2B0BH                         ; 1194 _ E9, 00002B0B(rel)

        mov     r9, qword [rsi+100H]                    ; 1199 _ 4C: 8B. 8E, 00000100
        mov     rcx, r9                                 ; 11A0 _ 4C: 89. C9
        and     r9, qword [rsi+148H]                    ; 11A3 _ 4C: 23. 8E, 00000148
        and     rcx, qword [rsi+140H]                   ; 11AA _ 48: 23. 8E, 00000140
        popcnt  r14, r9                                 ; 11B1 _ F3 4D: 0F B8. F1
        popcnt  r11, rcx                                ; 11B6 _ F3 4C: 0F B8. D9
        add     r14d, r11d                              ; 11BB _ 45: 01. DE
        cmp     eax, r14d                               ; 11BE _ 44: 39. F0
        jl      .text.hot+2393H                         ; 11C1 _ 0F 8C, 00002393(rel)
        jg      ?_0287                                  ; 11C7 _ 7F, 0C
        cmp     ebp, dword [rel _ZN10Tablebases10ProbeDepthE]; 11C9 _ 3B. 2D, 00000004(rel)
        jl      .text.hot+2393H                         ; 11CF _ 0F 8C, 00002393(rel)
?_0287: mov     r10, qword [rsi+3B8H]                   ; 11D5 _ 4C: 8B. 96, 000003B8
        cmp     dword [r10+1CH], 0                      ; 11DC _ 41: 83. 7A, 1C, 00
        jne     .text.hot+2393H                         ; 11E1 _ 0F 85, 00002393(rel)
        test    byte [r10+18H], 0FH                     ; 11E7 _ 41: F6. 42, 18, 0F
        jne     .text.hot+2393H                         ; 11EC _ 0F 85, 00002393(rel)
        lea     rdx, [rsp+2D0H]                         ; 11F2 _ 48: 8D. 94 24, 000002D0
        mov     rcx, rsi                                ; 11FA _ 48: 89. F1
        call    _ZN10Tablebases9probe_wdlER8PositionPi  ; 11FD _ E8, 00000000(rel)
        cmp     dword [rsp+2D0H], 0                     ; 1202 _ 83. BC 24, 000002D0, 00
        mov     edx, eax                                ; 120A _ 89. C2
        je      .text.hot+2393H                         ; 120C _ 0F 84, 00002393(rel)
        movzx   eax, byte [rel _ZN10Tablebases9UseRule50E]; 1212 _ 0F B6. 05, 00000008(rel)
        add     qword [rel _ZN10Tablebases4HitsE], 1    ; 1219 _ 48: 83. 05, 0000000F(rel), 01
        mov     r8d, eax                                ; 1221 _ 41: 89. C0
        neg     r8d                                     ; 1224 _ 41: F7. D8
        cmp     edx, r8d                                ; 1227 _ 44: 39. C2
        jge     ?_0292                                  ; 122A _ 7D, 7B
        mov     ecx, dword [rdi+8H]                     ; 122C _ 8B. 4F, 08
        lea     eax, [rcx-7C80H]                        ; 122F _ 8D. 81, FFFF8380
?_0288: mov     rsi, qword [rel .refptr.TT]             ; 1235 _ 48: 8B. 35, 00000000(rel)
        add     ebp, 6                                  ; 123C _ 83. C5, 06
        mov     r9d, 127                                ; 123F _ 41: B9, 0000007F
        cmp     ebp, 127                                ; 1245 _ 83. FD, 7F
        cmovge  ebp, r9d                                ; 1248 _ 41: 0F 4D. E9
        cmp     eax, 31743                              ; 124C _ 3D, 00007BFF
        movzx   r12d, byte [rsi+18H]                    ; 1251 _ 44: 0F B6. 66, 18
        jle     ?_0291                                  ; 1256 _ 7E, 3F
        add     ecx, eax                                ; 1258 _ 01. C1
?_0289: mov     r11, qword [rsp+0A0H]                   ; 125A _ 4C: 8B. 9C 24, 000000A0
        movzx   edx, word [r15]                         ; 1262 _ 41: 0F B7. 17
        shr     r11, 48                                 ; 1266 _ 49: C1. EB, 30
        cmp     r11, rdx                                ; 126A _ 49: 39. D3
        jz      ?_0290                                  ; 126D _ 74, 07
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [r15+2H], 0                        ; 126F _ 66 41: C7. 47, 02, 0000
?_0290: or      r12d, 03H                               ; 1276 _ 41: 83. CC, 03
        mov     word [r15], r11w                        ; 127A _ 66 45: 89. 1F
        mov     word [r15+4H], cx                       ; 127E _ 66 41: 89. 4F, 04
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [r15+6H], 32002                    ; 1283 _ 66 41: C7. 47, 06, 7D02
        mov     byte [r15+8H], r12b                     ; 128A _ 45: 88. 67, 08
        mov     byte [r15+9H], bpl                      ; 128E _ 41: 88. 6F, 09
        jmp     ?_0572                                  ; 1292 _ E9, 00002360(rel)

?_0291: mov     edi, eax                                ; 1297 _ 89. C7
        sub     edi, ecx                                ; 1299 _ 29. CF
        cmp     eax, 4294935552                         ; 129B _ 3D, FFFF8400
        mov     ecx, edi                                ; 12A0 _ 89. F9
        cmovg   ecx, eax                                ; 12A2 _ 0F 4F. C8
        jmp     ?_0289                                  ; 12A5 _ EB, B3

?_0292: ; Local function
        cmp     edx, eax                                ; 12A7 _ 39. C2
        jle     ?_0293                                  ; 12A9 _ 7E, 1C
        mov     eax, 31872                              ; 12AB _ B8, 00007C80
        mov     ecx, dword [rdi+8H]                     ; 12B0 _ 8B. 4F, 08
        sub     eax, dword [rdi+8H]                     ; 12B3 _ 2B. 47, 08
        jmp     ?_0288                                  ; 12B6 _ E9, FFFFFF7A

; Note: No jump seems to point here
        mov     eax, dword [rsp+94H]                    ; 12BB _ 8B. 84 24, 00000094
        jmp     ?_0572                                  ; 12C2 _ E9, 00002360(rel)

?_0293: ; Local function
        add     edx, edx                                ; 12C7 _ 01. D2
        mov     ecx, dword [rdi+8H]                     ; 12C9 _ 8B. 4F, 08
        imul    eax, edx                                ; 12CC _ 0F AF. C2
        jmp     ?_0288                                  ; 12CF _ E9, FFFFFF61

        xor     eax, eax                                ; 12D4 _ 31. C0
        jmp     ?_0572                                  ; 12D6 _ E9, 00002360(rel)

        mov     eax, r12d                               ; 12DB _ 44: 89. E0
        jmp     ?_0572                                  ; 12DE _ E9, 00002360(rel)

_ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth.cold.215:; Local function
        mov     ebx, r14d                               ; 12E3 _ 44: 89. F3
        sub     ebx, ebp                                ; 12E6 _ 29. EB
        mov     ebp, ebx                                ; 12E8 _ 89. DD
        jmp     ?_0680                                  ; 12EA _ E9, 00003A5A(rel)

        add     ebp, ebx                                ; 12EF _ 01. DD
        jmp     ?_0694                                  ; 12F1 _ E9, 00003C2E(rel)

_ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth.cold.216:; Local function
        add     r10d, ebx                               ; 12F6 _ 41: 01. DA
        jmp     .text+2112H                             ; 12F9 _ E9, 00002112(rel)

        add     edi, r12d                               ; 12FE _ 44: 01. E7
        jmp     .text+2019H                             ; 1301 _ E9, 00002019(rel)

_ZN12_GLOBAL__N_110check_timeEv.cold.217:; Local function
        mov     r11, qword [rel .refptr.Time]           ; 1306 _ 4C: 8B. 1D, 00000000(rel)
        mov     ecx, dword [r11+14H]                    ; 130D _ 41: 8B. 4B, 14
        sub     ecx, 9                                  ; 1311 _ 83. E9, 09
        cmp     eax, ecx                                ; 1314 _ 39. C8
        jl      .text+2225H                             ; 1316 _ 0F 8C, 00002225(rel)
?_0294: mov     byte [rel _ZN6Search7SignalsE], 1       ; 131C _ C6. 05, 00000097(rel), 01
        jmp     ?_0166                                  ; 1323 _ E9, 00002237(rel)

        test    r9d, r9d                                ; 1328 _ 45: 85. C9
        je      .text+222EH                             ; 132B _ 0F 84, 0000222E(rel)
        jmp     ?_0294                                  ; 1331 _ EB, E9

        mov     rcx, qword [rel .refptr.Threads]        ; 1333 _ 48: 8B. 0D, 00000000(rel)
        call    _ZN10ThreadPool14nodes_searchedEv       ; 133A _ E8, 00000000(rel)
        cmp     rax, qword [rel ?_0182]                 ; 133F _ 48: 3B. 05, 00000088(rel)
        jl      ?_0166                                  ; 1346 _ 0F 8C, 00002237(rel)
        jmp     ?_0294                                  ; 134C _ EB, CE

__tcf_1.cold.218:; Local function
        cmp     qword [rbx], 0                          ; 134E _ 48: 83. 3B, 00
        jz      ?_0297                                  ; 1352 _ 74, 27
        mov     rax, qword [rbx+48H]                    ; 1354 _ 48: 8B. 43, 48
        mov     rsi, qword [rbx+28H]                    ; 1358 _ 48: 8B. 73, 28
        lea     rdi, [rax+8H]                           ; 135C _ 48: 8D. 78, 08
?_0295: cmp     rdi, rsi                                ; 1360 _ 48: 39. F7
        jbe     ?_0296                                  ; 1363 _ 76, 0E
        mov     rcx, qword [rsi]                        ; 1365 _ 48: 8B. 0E
        add     rsi, 8                                  ; 1368 _ 48: 83. C6, 08
        call    _ZdlPv                                  ; 136C _ E8, 00000000(rel)
        jmp     ?_0295                                  ; 1371 _ EB, ED

?_0296: mov     rcx, qword [rbx]                        ; 1373 _ 48: 8B. 0B
        call    _ZdlPv                                  ; 1376 _ E8, 00000000(rel)
?_0297: mov     rcx, rbx                                ; 137B _ 48: 89. D9
        add     rsp, 32                                 ; 137E _ 48: 83. C4, 20
        pop     rbx                                     ; 1382 _ 5B
        pop     rsi                                     ; 1383 _ 5E
        pop     rdi                                     ; 1384 _ 5F
        jmp     _ZdlPv                                  ; 1385 _ E9, 00000000(rel)

__tcf_0.cold.219:; Local function
        jmp     _ZdlPv                                  ; 138A _ E9, 00000000(rel)

        nop                                             ; 138F _ 90


SECTION .text.startup align=16 execute                  ; section number 5, code

.text.startup:; Local function
_GLOBAL__sub_I__ZN6Search7SignalsE:
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        lea     rcx, [rel __tcf_0]                      ; 0004 _ 48: 8D. 0D, 000022A0(rel)
        mov     qword [rel _ZN6Search6LimitsE], 0       ; 000B _ 48: C7. 05, 0000003C(rel), 00000000
        mov     qword [rel ?_0169], 0                   ; 0016 _ 48: C7. 05, 00000044(rel), 00000000
        mov     qword [rel ?_0170], 0                   ; 0021 _ 48: C7. 05, 0000004C(rel), 00000000
        mov     dword [rel ?_0181], 0                   ; 002C _ C7. 05, 0000007C(rel), 00000000
        mov     dword [rel ?_0180], 0                   ; 0036 _ C7. 05, 00000078(rel), 00000000
        mov     dword [rel ?_0179], 0                   ; 0040 _ C7. 05, 00000074(rel), 00000000
        mov     dword [rel ?_0178], 0                   ; 004A _ C7. 05, 00000070(rel), 00000000
        mov     dword [rel ?_0177], 0                   ; 0054 _ C7. 05, 0000006C(rel), 00000000
        mov     dword [rel ?_0176], 0                   ; 005E _ C7. 05, 00000068(rel), 00000000
        mov     dword [rel ?_0175], 0                   ; 0068 _ C7. 05, 00000064(rel), 00000000
        mov     dword [rel ?_0174], 0                   ; 0072 _ C7. 05, 00000060(rel), 00000000
        mov     dword [rel ?_0173], 0                   ; 007C _ C7. 05, 0000005C(rel), 00000000
        mov     dword [rel ?_0172], 0                   ; 0086 _ C7. 05, 00000058(rel), 00000000
        mov     dword [rel ?_0171], 0                   ; 0090 _ C7. 05, 00000054(rel), 00000000
        mov     qword [rel ?_0182], 0                   ; 009A _ 48: C7. 05, 00000084(rel), 00000000
        call    atexit                                  ; 00A5 _ E8, 00000000(rel)
        lea     rcx, [rel __tcf_1]                      ; 00AA _ 48: 8D. 0D, 00002280(rel)
        call    atexit                                  ; 00B1 _ E8, 00000000(rel)
        lea     r8, [rel ?_0354]                        ; 00B6 _ 4C: 8D. 05, 00000350(rel)
        mov     qword [rel _ZN12_GLOBAL__N_1L11HalfDensityE], 0; 00BD _ 48: C7. 05, 004000FC(rel), 00000000
        lea     rdx, [rel ._418]                        ; 00C8 _ 48: 8D. 15, 00000348(rel)
        mov     qword [rel ?_0189], 0                   ; 00CF _ 48: C7. 05, 00400104(rel), 00000000
        lea     rcx, [rel _ZN12_GLOBAL__N_1L11HalfDensityE]; 00DA _ 48: 8D. 0D, 00400100(rel)
        mov     qword [rel ?_0190], 0                   ; 00E1 _ 48: C7. 05, 0040010C(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 00EC _ E8, 0000047F
        lea     r8, [rel ._418]                         ; 00F1 _ 4C: 8D. 05, 00000348(rel)
        mov     qword [rel ?_0191], 0                   ; 00F8 _ 48: C7. 05, 00400114(rel), 00000000
        lea     rdx, [rel ._419]                        ; 0103 _ 48: 8D. 15, 00000340(rel)
        mov     qword [rel ?_0192], 0                   ; 010A _ 48: C7. 05, 0040011C(rel), 00000000
        lea     rcx, [rel ?_0191]                       ; 0115 _ 48: 8D. 0D, 00400118(rel)
        mov     qword [rel ?_0193], 0                   ; 011C _ 48: C7. 05, 00400124(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 0127 _ E8, 00000444
        lea     r8, [rel ._419]                         ; 012C _ 4C: 8D. 05, 00000340(rel)
        mov     qword [rel ?_0194], 0                   ; 0133 _ 48: C7. 05, 0040012C(rel), 00000000
        lea     rdx, [rel ._420]                        ; 013E _ 48: 8D. 15, 00000330(rel)
        mov     qword [rel ?_0195], 0                   ; 0145 _ 48: C7. 05, 00400134(rel), 00000000
        lea     rcx, [rel ?_0194]                       ; 0150 _ 48: 8D. 0D, 00400130(rel)
        mov     qword [rel ?_0196], 0                   ; 0157 _ 48: C7. 05, 0040013C(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 0162 _ E8, 00000409
        lea     r8, [rel ._420]                         ; 0167 _ 4C: 8D. 05, 00000330(rel)
        mov     qword [rel ?_0197], 0                   ; 016E _ 48: C7. 05, 00400144(rel), 00000000
        lea     rdx, [rel ._421]                        ; 0179 _ 48: 8D. 15, 00000320(rel)
        mov     qword [rel ?_0198], 0                   ; 0180 _ 48: C7. 05, 0040014C(rel), 00000000
        lea     rcx, [rel ?_0197]                       ; 018B _ 48: 8D. 0D, 00400148(rel)
        mov     qword [rel ?_0199], 0                   ; 0192 _ 48: C7. 05, 00400154(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 019D _ E8, 000003CE
        lea     r8, [rel ._421]                         ; 01A2 _ 4C: 8D. 05, 00000320(rel)
        mov     qword [rel ?_0200], 0                   ; 01A9 _ 48: C7. 05, 0040015C(rel), 00000000
        lea     rdx, [rel ._422]                        ; 01B4 _ 48: 8D. 15, 00000310(rel)
        mov     qword [rel ?_0201], 0                   ; 01BB _ 48: C7. 05, 00400164(rel), 00000000
        lea     rcx, [rel ?_0200]                       ; 01C6 _ 48: 8D. 0D, 00400160(rel)
        mov     qword [rel ?_0202], 0                   ; 01CD _ 48: C7. 05, 0040016C(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 01D8 _ E8, 00000393
        lea     r8, [rel ._422]                         ; 01DD _ 4C: 8D. 05, 00000310(rel)
        mov     qword [rel ?_0203], 0                   ; 01E4 _ 48: C7. 05, 00400174(rel), 00000000
        lea     rdx, [rel ._423]                        ; 01EF _ 48: 8D. 15, 00000300(rel)
        mov     qword [rel ?_0204], 0                   ; 01F6 _ 48: C7. 05, 0040017C(rel), 00000000
        lea     rcx, [rel ?_0203]                       ; 0201 _ 48: 8D. 0D, 00400178(rel)
        mov     qword [rel ?_0205], 0                   ; 0208 _ 48: C7. 05, 00400184(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 0213 _ E8, 00000358
        lea     r8, [rel ?_0353]                        ; 0218 _ 4C: 8D. 05, 000002F8(rel)
        mov     qword [rel ?_0206], 0                   ; 021F _ 48: C7. 05, 0040018C(rel), 00000000
        lea     rdx, [rel ._424]                        ; 022A _ 48: 8D. 15, 000002E0(rel)
        mov     qword [rel ?_0207], 0                   ; 0231 _ 48: C7. 05, 00400194(rel), 00000000
        lea     rcx, [rel ?_0206]                       ; 023C _ 48: 8D. 0D, 00400190(rel)
        mov     qword [rel ?_0208], 0                   ; 0243 _ 48: C7. 05, 0040019C(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 024E _ E8, 0000031D
        lea     r8, [rel ?_0352]                        ; 0253 _ 4C: 8D. 05, 000002D8(rel)
        mov     qword [rel ?_0209], 0                   ; 025A _ 48: C7. 05, 004001A4(rel), 00000000
        lea     rdx, [rel ._425]                        ; 0265 _ 48: 8D. 15, 000002C0(rel)
        mov     qword [rel ?_0210], 0                   ; 026C _ 48: C7. 05, 004001AC(rel), 00000000
        lea     rcx, [rel ?_0209]                       ; 0277 _ 48: 8D. 0D, 004001A8(rel)
        mov     qword [rel ?_0211], 0                   ; 027E _ 48: C7. 05, 004001B4(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 0289 _ E8, 000002E2
        lea     r8, [rel ?_0351]                        ; 028E _ 4C: 8D. 05, 000002B8(rel)
        mov     qword [rel ?_0212], 0                   ; 0295 _ 48: C7. 05, 004001BC(rel), 00000000
        lea     rdx, [rel ._426]                        ; 02A0 _ 48: 8D. 15, 000002A0(rel)
        mov     qword [rel ?_0213], 0                   ; 02A7 _ 48: C7. 05, 004001C4(rel), 00000000
        lea     rcx, [rel ?_0212]                       ; 02B2 _ 48: 8D. 0D, 004001C0(rel)
        mov     qword [rel ?_0214], 0                   ; 02B9 _ 48: C7. 05, 004001CC(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 02C4 _ E8, 000002A7
        lea     r8, [rel ?_0350]                        ; 02C9 _ 4C: 8D. 05, 00000298(rel)
        mov     qword [rel ?_0215], 0                   ; 02D0 _ 48: C7. 05, 004001D4(rel), 00000000
        lea     rdx, [rel ._427]                        ; 02DB _ 48: 8D. 15, 00000280(rel)
        mov     qword [rel ?_0216], 0                   ; 02E2 _ 48: C7. 05, 004001DC(rel), 00000000
        lea     rcx, [rel ?_0215]                       ; 02ED _ 48: 8D. 0D, 004001D8(rel)
        mov     qword [rel ?_0217], 0                   ; 02F4 _ 48: C7. 05, 004001E4(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 02FF _ E8, 0000026C
        lea     r8, [rel ?_0349]                        ; 0304 _ 4C: 8D. 05, 00000278(rel)
        mov     qword [rel ?_0218], 0                   ; 030B _ 48: C7. 05, 004001EC(rel), 00000000
        lea     rdx, [rel ._428]                        ; 0316 _ 48: 8D. 15, 00000260(rel)
        mov     qword [rel ?_0219], 0                   ; 031D _ 48: C7. 05, 004001F4(rel), 00000000
        lea     rcx, [rel ?_0218]                       ; 0328 _ 48: 8D. 0D, 004001F0(rel)
        mov     qword [rel ?_0220], 0                   ; 032F _ 48: C7. 05, 004001FC(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 033A _ E8, 00000231
        lea     r8, [rel ?_0348]                        ; 033F _ 4C: 8D. 05, 00000258(rel)
        mov     qword [rel ?_0221], 0                   ; 0346 _ 48: C7. 05, 00400204(rel), 00000000
        lea     rdx, [rel ._429]                        ; 0351 _ 48: 8D. 15, 00000240(rel)
        mov     qword [rel ?_0222], 0                   ; 0358 _ 48: C7. 05, 0040020C(rel), 00000000
        lea     rcx, [rel ?_0221]                       ; 0363 _ 48: 8D. 0D, 00400208(rel)
        mov     qword [rel ?_0223], 0                   ; 036A _ 48: C7. 05, 00400214(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 0375 _ E8, 000001F6
        lea     r8, [rel ._429]                         ; 037A _ 4C: 8D. 05, 00000240(rel)
        mov     qword [rel ?_0224], 0                   ; 0381 _ 48: C7. 05, 0040021C(rel), 00000000
        lea     rdx, [rel ._430]                        ; 038C _ 48: 8D. 15, 00000220(rel)
        mov     qword [rel ?_0225], 0                   ; 0393 _ 48: C7. 05, 00400224(rel), 00000000
        lea     rcx, [rel ?_0224]                       ; 039E _ 48: 8D. 0D, 00400220(rel)
        mov     qword [rel ?_0226], 0                   ; 03A5 _ 48: C7. 05, 0040022C(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 03B0 _ E8, 000001BB
        lea     r8, [rel ._430]                         ; 03B5 _ 4C: 8D. 05, 00000220(rel)
        mov     qword [rel ?_0227], 0                   ; 03BC _ 48: C7. 05, 00400234(rel), 00000000
        lea     rdx, [rel ._431]                        ; 03C7 _ 48: 8D. 15, 00000200(rel)
        mov     qword [rel ?_0228], 0                   ; 03CE _ 48: C7. 05, 0040023C(rel), 00000000
        lea     rcx, [rel ?_0227]                       ; 03D9 _ 48: 8D. 0D, 00400238(rel)
        mov     qword [rel ?_0229], 0                   ; 03E0 _ 48: C7. 05, 00400244(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 03EB _ E8, 00000180
        lea     r8, [rel ._431]                         ; 03F0 _ 4C: 8D. 05, 00000200(rel)
        mov     qword [rel ?_0230], 0                   ; 03F7 _ 48: C7. 05, 0040024C(rel), 00000000
        lea     rdx, [rel ._432]                        ; 0402 _ 48: 8D. 15, 000001E0(rel)
        mov     qword [rel ?_0231], 0                   ; 0409 _ 48: C7. 05, 00400254(rel), 00000000
        lea     rcx, [rel ?_0230]                       ; 0414 _ 48: 8D. 0D, 00400250(rel)
        mov     qword [rel ?_0232], 0                   ; 041B _ 48: C7. 05, 0040025C(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 0426 _ E8, 00000145
        lea     r8, [rel ._432]                         ; 042B _ 4C: 8D. 05, 000001E0(rel)
        mov     qword [rel ?_0233], 0                   ; 0432 _ 48: C7. 05, 00400264(rel), 00000000
        lea     rdx, [rel ._433]                        ; 043D _ 48: 8D. 15, 000001C0(rel)
        mov     qword [rel ?_0234], 0                   ; 0444 _ 48: C7. 05, 0040026C(rel), 00000000
        lea     rcx, [rel ?_0233]                       ; 044F _ 48: 8D. 0D, 00400268(rel)
        mov     qword [rel ?_0235], 0                   ; 0456 _ 48: C7. 05, 00400274(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 0461 _ E8, 0000010A
        lea     r8, [rel ._433]                         ; 0466 _ 4C: 8D. 05, 000001C0(rel)
        mov     qword [rel ?_0236], 0                   ; 046D _ 48: C7. 05, 0040027C(rel), 00000000
        lea     rdx, [rel ._434]                        ; 0478 _ 48: 8D. 15, 000001A0(rel)
        mov     qword [rel ?_0237], 0                   ; 047F _ 48: C7. 05, 00400284(rel), 00000000
        lea     rcx, [rel ?_0236]                       ; 048A _ 48: 8D. 0D, 00400280(rel)
        mov     qword [rel ?_0238], 0                   ; 0491 _ 48: C7. 05, 0040028C(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 049C _ E8, 000000CF
        lea     r8, [rel ._434]                         ; 04A1 _ 4C: 8D. 05, 000001A0(rel)
        mov     qword [rel ?_0239], 0                   ; 04A8 _ 48: C7. 05, 00400294(rel), 00000000
        lea     rdx, [rel ._435]                        ; 04B3 _ 48: 8D. 15, 00000180(rel)
        mov     qword [rel ?_0240], 0                   ; 04BA _ 48: C7. 05, 0040029C(rel), 00000000
        lea     rcx, [rel ?_0239]                       ; 04C5 _ 48: 8D. 0D, 00400298(rel)
        mov     qword [rel ?_0241], 0                   ; 04CC _ 48: C7. 05, 004002A4(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 04D7 _ E8, 00000094
        lea     r8, [rel ._435]                         ; 04DC _ 4C: 8D. 05, 00000180(rel)
        mov     qword [rel ?_0242], 0                   ; 04E3 _ 48: C7. 05, 004002AC(rel), 00000000
        lea     rdx, [rel ._436]                        ; 04EE _ 48: 8D. 15, 00000160(rel)
        mov     qword [rel ?_0243], 0                   ; 04F5 _ 48: C7. 05, 004002B4(rel), 00000000
        lea     rcx, [rel ?_0242]                       ; 0500 _ 48: 8D. 0D, 004002B0(rel)
        mov     qword [rel ?_0244], 0                   ; 0507 _ 48: C7. 05, 004002BC(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 0512 _ E8, 00000059
        lea     r8, [rel ._436]                         ; 0517 _ 4C: 8D. 05, 00000160(rel)
        mov     qword [rel ?_0245], 0                   ; 051E _ 48: C7. 05, 004002C4(rel), 00000000
        lea     rdx, [rel ._437]                        ; 0529 _ 48: 8D. 15, 00000140(rel)
        mov     qword [rel ?_0246], 0                   ; 0530 _ 48: C7. 05, 004002CC(rel), 00000000
        lea     rcx, [rel ?_0245]                       ; 053B _ 48: 8D. 0D, 004002C8(rel)
        mov     qword [rel ?_0247], 0                   ; 0542 _ 48: C7. 05, 004002D4(rel), 00000000
        call    _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195; 054D _ E8, 0000001E
        lea     rcx, [rel __tcf_2]                      ; 0552 _ 48: 8D. 0D, 00002240(rel)
        call    atexit                                  ; 0559 _ E8, 00000000(rel)
        call    _Z3nowv                                 ; 055E _ E8, 00000000(rel)
        mov     qword [rel _ZN12_GLOBAL__N_14srngE], rax; 0563 _ 48: 89. 05, 000000A0(rel)
        add     rsp, 40                                 ; 056A _ 48: 83. C4, 28
        ret                                             ; 056E _ C3

        nop                                             ; 056F _ 90

ALIGN   16
_ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195:; Local function
        push    rbp                                     ; 0570 _ 55
        push    rdi                                     ; 0571 _ 57
        push    rsi                                     ; 0572 _ 56
        push    rbx                                     ; 0573 _ 53
        sub     rsp, 40                                 ; 0574 _ 48: 83. EC, 28
        mov     rsi, r8                                 ; 0578 _ 4C: 89. C6
        mov     rdi, rcx                                ; 057B _ 48: 89. CF
        mov     rbp, rdx                                ; 057E _ 48: 89. D5
        sub     rsi, rdx                                ; 0581 _ 48: 29. D6
        mov     rbx, r8                                 ; 0584 _ 4C: 89. C3
        mov     rax, rsi                                ; 0587 _ 48: 89. F0
        sar     rax, 2                                  ; 058A _ 48: C1. F8, 02
        test    rax, rax                                ; 058E _ 48: 85. C0
        je      _ZNSt6vectorIiSaIiEE19_M_range_initializeIPKiEEvT_S5_St20forward_iterator_tag.isra.131.constprop.195.cold.200; 0591 _ 0F 84, 00000000(rel)
        mov     rdx, qword 3FFFFFFFFFFFFFFFH            ; 0597 _ 48: BA, 3FFFFFFFFFFFFFFF
        cmp     rax, rdx                                ; 05A1 _ 48: 39. D0
        ja      Unnamed_4_7                             ; 05A4 _ 0F 87, 00000007(rel)
        mov     rcx, rsi                                ; 05AA _ 48: 89. F1
        call    _Znwy                                   ; 05AD _ E8, 00000000(rel)
        add     rsi, rax                                ; 05B2 _ 48: 01. C6
        mov     qword [rdi], rax                        ; 05B5 _ 48: 89. 07
        mov     r10, rax                                ; 05B8 _ 49: 89. C2
        mov     r9, rbp                                 ; 05BB _ 49: 89. E9
        mov     qword [rdi+10H], rsi                    ; 05BE _ 48: 89. 77, 10
        jmp     ?_0300                                  ; 05C2 _ EB, 13

?_0298: test    r10, r10                                ; 05C4 _ 4D: 85. D2
        mov     r8d, dword [r9]                         ; 05C7 _ 45: 8B. 01
        jz      ?_0299                                  ; 05CA _ 74, 03
        mov     dword [r10], r8d                        ; 05CC _ 45: 89. 02
?_0299: add     r9, 4                                   ; 05CF _ 49: 83. C1, 04
        add     r10, 4                                  ; 05D3 _ 49: 83. C2, 04
?_0300: cmp     rbx, r9                                 ; 05D7 _ 4C: 39. CB
        jnz     ?_0298                                  ; 05DA _ 75, E8
        sub     rbx, rbp                                ; 05DC _ 48: 29. EB
        and     rbx, 0FFFFFFFFFFFFFFFCH                 ; 05DF _ 48: 83. E3, FC
        add     rax, rbx                                ; 05E3 _ 48: 01. D8
        mov     qword [rdi+8H], rax                     ; 05E6 _ 48: 89. 47, 08
        add     rsp, 40                                 ; 05EA _ 48: 83. C4, 28
        pop     rbx                                     ; 05EE _ 5B
        pop     rsi                                     ; 05EF _ 5E
        pop     rdi                                     ; 05F0 _ 5F
        pop     rbp                                     ; 05F1 _ 5D
        ret                                             ; 05F2 _ C3

        nop                                             ; 05F3 _ 90
        nop                                             ; 05F4 _ 90
        nop                                             ; 05F5 _ 90
        nop                                             ; 05F6 _ 90
        nop                                             ; 05F7 _ 90
        nop                                             ; 05F8 _ 90
        nop                                             ; 05F9 _ 90
        nop                                             ; 05FA _ 90
        nop                                             ; 05FB _ 90
        nop                                             ; 05FC _ 90
        nop                                             ; 05FD _ 90
        nop                                             ; 05FE _ 90
        nop                                             ; 05FF _ 90


SECTION .xdata.startup align=4 noexecute                ; section number 6, const

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..
        db 01H, 08H, 05H, 00H, 08H, 42H, 04H, 30H       ; 0008 _ .....B.0
        db 03H, 60H, 02H, 70H, 01H, 50H, 00H, 00H       ; 0010 _ .`.p.P..


SECTION .ctors  align=8 noexecute                       ; section number 8, data

        dq _GLOBAL__sub_I__ZN6Search7SignalsE           ; 0000 _ 0000000000000000 (d)


SECTION .xdata  align=4 noexecute                       ; section number 9, const

        db 01H, 45H, 19H, 00H, 45H, 0D8H, 09H, 00H      ; 0000 _ .E..E...
        db 3CH, 0C8H, 08H, 00H, 33H, 0B8H, 07H, 00H     ; 0008 _ <...3...
        db 2DH, 0A8H, 06H, 00H, 27H, 98H, 05H, 00H      ; 0010 _ -...'...
        db 21H, 88H, 04H, 00H, 1BH, 78H, 03H, 00H       ; 0018 _ !....x..
        db 16H, 68H, 02H, 00H, 11H, 01H, 14H, 00H       ; 0020 _ .h......
        db 0AH, 30H, 09H, 60H, 08H, 70H, 07H, 50H       ; 0028 _ .0.`.p.P
        db 06H, 0C0H, 04H, 0D0H, 02H, 0E0H, 00H, 00H    ; 0030 _ ........
        db 01H, 07H, 04H, 00H, 07H, 32H, 03H, 30H       ; 0038 _ .....2.0
        db 02H, 60H, 01H, 70H, 01H, 13H, 0AH, 00H       ; 0040 _ .`.p....
        db 13H, 01H, 83H, 00H, 0CH, 30H, 0BH, 60H       ; 0048 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 0050 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 29H, 0EH, 00H     ; 0058 _ .....)..
        db 29H, 78H, 83H, 01H, 21H, 68H, 82H, 01H       ; 0060 _ )x..!h..
        db 19H, 01H, 09H, 03H, 11H, 30H, 10H, 60H       ; 0068 _ .....0.`
        db 0FH, 70H, 0EH, 50H, 0DH, 0C0H, 0BH, 0D0H     ; 0070 _ .p.P....
        db 09H, 0E0H, 02H, 0F0H, 01H, 13H, 0AH, 00H     ; 0078 _ ........
        db 13H, 01H, 79H, 01H, 0CH, 30H, 0BH, 60H       ; 0080 _ ..y..0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 0088 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 0CH, 07H, 00H     ; 0090 _ ........
        db 0CH, 62H, 08H, 30H, 07H, 60H, 06H, 70H       ; 0098 _ .b.0.`.p
        db 05H, 50H, 04H, 0C0H, 02H, 0D0H, 00H, 00H     ; 00A0 _ .P......
        db 01H, 10H, 09H, 00H, 10H, 0A2H, 0CH, 30H      ; 00A8 _ .......0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 00B0 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 00B8 _ ........
        db 01H, 0AH, 06H, 00H, 0AH, 32H, 06H, 30H       ; 00C0 _ .....2.0
        db 05H, 60H, 04H, 70H, 03H, 50H, 02H, 0C0H      ; 00C8 _ .`.p.P..
        db 01H, 19H, 0AH, 00H, 19H, 01H, 15H, 05H       ; 00D0 _ ........
        db 11H, 30H, 10H, 60H, 0FH, 70H, 0EH, 50H       ; 00D8 _ .0.`.p.P
        db 0DH, 0C0H, 0BH, 0D0H, 09H, 0E0H, 02H, 0F0H   ; 00E0 _ ........
        db 01H, 10H, 09H, 00H, 10H, 82H, 0CH, 30H       ; 00E8 _ .......0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 00F0 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 00F8 _ ........
        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0100 _ .....B..
        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0108 _ .....B..
        db 01H, 13H, 0AH, 00H, 13H, 01H, 79H, 01H       ; 0110 _ ......y.
        db 0CH, 30H, 0BH, 60H, 0AH, 70H, 09H, 50H       ; 0118 _ .0.`.p.P
        db 08H, 0C0H, 06H, 0D0H, 04H, 0E0H, 02H, 0F0H   ; 0120 _ ........
        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0128 _ .....B..
        db 01H, 06H, 03H, 00H, 06H, 42H, 02H, 30H       ; 0130 _ .....B.0
        db 01H, 60H, 00H, 00H, 01H, 07H, 04H, 00H       ; 0138 _ .`......
        db 07H, 32H, 03H, 30H, 02H, 60H, 01H, 70H       ; 0140 _ .2.0.`.p
        db 01H, 00H, 00H, 00H                           ; 0148 _ ....


SECTION .text$_ZNSt6vectorI4MoveSaIS0_EEaSERKS2_ align=16 execute ; section number 11, code
;  Communal section not supported by YASM

_ZNSt6vectorI4MoveSaIS0_EEaSERKS2_:; Function begin
        push    r12                                     ; 0000 _ 41: 54
        push    rbp                                     ; 0002 _ 55
        push    rdi                                     ; 0003 _ 57
        push    rsi                                     ; 0004 _ 56
        push    rbx                                     ; 0005 _ 53
        sub     rsp, 32                                 ; 0006 _ 48: 83. EC, 20
        cmp     rdx, rcx                                ; 000A _ 48: 39. CA
        mov     rbx, rcx                                ; 000D _ 48: 89. CB
        mov     rdi, rdx                                ; 0010 _ 48: 89. D7
        jz      ?_0302                                  ; 0013 _ 74, 46
        mov     rbp, qword [rdx+8H]                     ; 0015 _ 48: 8B. 6A, 08
        mov     r12, qword [rdx]                        ; 0019 _ 4C: 8B. 22
        mov     rcx, qword [rcx]                        ; 001C _ 48: 8B. 09
        mov     rax, qword [rbx+10H]                    ; 001F _ 48: 8B. 43, 10
        mov     rsi, rbp                                ; 0023 _ 48: 89. EE
        sub     rsi, r12                                ; 0026 _ 4C: 29. E6
        mov     r9, rsi                                 ; 0029 _ 49: 89. F1
        sub     rax, rcx                                ; 002C _ 48: 29. C8
        sar     r9, 2                                   ; 002F _ 49: C1. F9, 02
        sar     rax, 2                                  ; 0033 _ 48: C1. F8, 02
        cmp     r9, rax                                 ; 0037 _ 49: 39. C1
        ja      ?_0303                                  ; 003A _ 77, 2D
        mov     r8, qword [rbx+8H]                      ; 003C _ 4C: 8B. 43, 08
        sub     r8, rcx                                 ; 0040 _ 49: 29. C8
        mov     rdx, r8                                 ; 0043 _ 4C: 89. C2
        sar     rdx, 2                                  ; 0046 _ 48: C1. FA, 02
        cmp     r9, rdx                                 ; 004A _ 49: 39. D1
        ja      ?_0311                                  ; 004D _ 77, 72
        test    r9, r9                                  ; 004F _ 4D: 85. C9
        jnz     ?_0310                                  ; 0052 _ 75, 60
?_0301: add     rsi, qword [rbx]                        ; 0054 _ 48: 03. 33
        mov     qword [rbx+8H], rsi                     ; 0057 _ 48: 89. 73, 08
?_0302: mov     rax, rbx                                ; 005B _ 48: 89. D8
        add     rsp, 32                                 ; 005E _ 48: 83. C4, 20
        pop     rbx                                     ; 0062 _ 5B
        pop     rsi                                     ; 0063 _ 5E
        pop     rdi                                     ; 0064 _ 5F
        pop     rbp                                     ; 0065 _ 5D
        pop     r12                                     ; 0066 _ 41: 5C
        ret                                             ; 0068 _ C3

?_0303: test    r9, r9                                  ; 0069 _ 4D: 85. C9
        jz      ?_0309                                  ; 006C _ 74, 42
        mov     rcx, r9                                 ; 006E _ 4C: 89. C9
        call    _ZN9__gnu_cxx13new_allocatorI4MoveE8allocateEyPKv.isra.146; 0071 _ E8, 00001D30(rel)
        mov     rdi, rax                                ; 0076 _ 48: 89. C7
?_0304: mov     r11, rdi                                ; 0079 _ 49: 89. FB
?_0305: cmp     rbp, r12                                ; 007C _ 4C: 39. E5
        jz      ?_0307                                  ; 007F _ 74, 16
        test    r11, r11                                ; 0081 _ 4D: 85. DB
        mov     r9d, dword [r12]                        ; 0084 _ 45: 8B. 0C 24
        jz      ?_0306                                  ; 0088 _ 74, 03
        mov     dword [r11], r9d                        ; 008A _ 45: 89. 0B
?_0306: add     r11, 4                                  ; 008D _ 49: 83. C3, 04
        add     r12, 4                                  ; 0091 _ 49: 83. C4, 04
        jmp     ?_0305                                  ; 0095 _ EB, E5

?_0307: mov     rcx, qword [rbx]                        ; 0097 _ 48: 8B. 0B
        test    rcx, rcx                                ; 009A _ 48: 85. C9
        jz      ?_0308                                  ; 009D _ 74, 05
        call    _ZdlPv                                  ; 009F _ E8, 00000000(rel)
?_0308: mov     qword [rbx], rdi                        ; 00A4 _ 48: 89. 3B
        add     rdi, rsi                                ; 00A7 _ 48: 01. F7
        mov     qword [rbx+10H], rdi                    ; 00AA _ 48: 89. 7B, 10
        jmp     ?_0301                                  ; 00AE _ EB, A4

?_0309: xor     edi, edi                                ; 00B0 _ 31. FF
        jmp     ?_0304                                  ; 00B2 _ EB, C5

?_0310: mov     r8, rsi                                 ; 00B4 _ 49: 89. F0
        mov     rdx, r12                                ; 00B7 _ 4C: 89. E2
        call    memmove                                 ; 00BA _ E8, 00000000(rel)
        jmp     ?_0301                                  ; 00BF _ EB, 93
; _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_ End of function

?_0311: ; Local function
        test    rdx, rdx                                ; 00C1 _ 48: 85. D2
        jz      ?_0312                                  ; 00C4 _ 74, 08
        mov     rdx, r12                                ; 00C6 _ 4C: 89. E2
        call    memmove                                 ; 00C9 _ E8, 00000000(rel)
?_0312: mov     r10, qword [rbx+8H]                     ; 00CE _ 4C: 8B. 53, 08
        mov     rcx, qword [rdi+8H]                     ; 00D2 _ 48: 8B. 4F, 08
        mov     rbp, r10                                ; 00D6 _ 4C: 89. D5
        sub     rbp, qword [rbx]                        ; 00D9 _ 48: 2B. 2B
        add     rbp, qword [rdi]                        ; 00DC _ 48: 03. 2F
?_0313: cmp     rcx, rbp                                ; 00DF _ 48: 39. E9
        je      ?_0301                                  ; 00E2 _ 0F 84, FFFFFF6C
        test    r10, r10                                ; 00E8 _ 4D: 85. D2
        mov     r8d, dword [rbp]                        ; 00EB _ 44: 8B. 45, 00
        jz      ?_0314                                  ; 00EF _ 74, 03
        mov     dword [r10], r8d                        ; 00F1 _ 45: 89. 02
?_0314: add     rbp, 4                                  ; 00F4 _ 48: 83. C5, 04
        add     r10, 4                                  ; 00F8 _ 49: 83. C2, 04
        jmp     ?_0313                                  ; 00FC _ EB, E1

        nop                                             ; 00FE _ 90
        nop                                             ; 00FF _ 90


SECTION .xdata$_ZNSt6vectorI4MoveSaIS0_EEaSERKS2_ align=4 noexecute ; section number 12, const
;  Communal section not supported by YASM

        db 01H, 0AH, 06H, 00H, 0AH, 32H, 06H, 30H       ; 0000 _ .....2.0
        db 05H, 60H, 04H, 70H, 03H, 50H, 02H, 0C0H      ; 0008 _ .`.p.P..


SECTION .text$_ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_ align=16 execute ; section number 14, code
;  Communal section not supported by YASM

.weak._ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_._ZN6Search4initEv:; Function begin

_ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_:
        push    r13                                     ; 0000 _ 41: 55
        push    r12                                     ; 0002 _ 41: 54
        push    rbp                                     ; 0004 _ 55
        push    rdi                                     ; 0005 _ 57
        push    rsi                                     ; 0006 _ 56
        push    rbx                                     ; 0007 _ 53
        sub     rsp, 40                                 ; 0008 _ 48: 83. EC, 28
        mov     r8, qword [rcx+8H]                      ; 000C _ 4C: 8B. 41, 08
        mov     rbx, rdx                                ; 0010 _ 48: 89. D3
        mov     rdx, r8                                 ; 0013 _ 4C: 89. C2
        sub     rdx, qword [rcx]                        ; 0016 _ 48: 2B. 11
        mov     rdi, rcx                                ; 0019 _ 48: 89. CF
        sar     rdx, 5                                  ; 001C _ 48: C1. FA, 05
        test    rdx, rdx                                ; 0020 _ 48: 85. D2
        je      ?_0325                                  ; 0023 _ 0F 84, 0000015F
        lea     rsi, [rdx+rdx]                          ; 0029 _ 48: 8D. 34 12
        cmp     rdx, rsi                                ; 002D _ 48: 39. F2
        ja      ?_0326                                  ; 0030 _ 0F 87, 0000015C
        mov     rax, qword 7FFFFFFFFFFFFFFH             ; 0036 _ 48: B8, 07FFFFFFFFFFFFFF
        cmp     rsi, rax                                ; 0040 _ 48: 39. C6
        ja      ?_0326                                  ; 0043 _ 0F 87, 00000149
        xor     ebp, ebp                                ; 0049 _ 31. ED
        test    rsi, rsi                                ; 004B _ 48: 85. F6
        jz      ?_0316                                  ; 004E _ 74, 13
?_0315: mov     rcx, rsi                                ; 0050 _ 48: 89. F1
        shl     rcx, 5                                  ; 0053 _ 48: C1. E1, 05
        call    _Znwy                                   ; 0057 _ E8, 00000000(rel)
        mov     r8, qword [rdi+8H]                      ; 005C _ 4C: 8B. 47, 08
        mov     rbp, rax                                ; 0060 _ 48: 89. C5
?_0316: sub     r8, qword [rdi]                         ; 0063 _ 4C: 2B. 07
        add     r8, rbp                                 ; 0066 _ 49: 01. E8
        jz      ?_0317                                  ; 0069 _ 74, 55
        mov     ecx, dword [rbx]                        ; 006B _ 8B. 0B
        mov     r9d, dword [rbx+4H]                     ; 006D _ 44: 8B. 4B, 04
        mov     qword [r8+10H], 0                       ; 0071 _ 49: C7. 40, 10, 00000000
        mov     qword [r8+18H], 0                       ; 0079 _ 49: C7. 40, 18, 00000000
        mov     qword [r8+8H], 0                        ; 0081 _ 49: C7. 40, 08, 00000000
        mov     r10, qword [rbx+8H]                     ; 0089 _ 4C: 8B. 53, 08
        mov     dword [r8], ecx                         ; 008D _ 41: 89. 08
        mov     dword [r8+4H], r9d                      ; 0090 _ 45: 89. 48, 04
        mov     qword [r8+8H], r10                      ; 0094 _ 4D: 89. 50, 08
        mov     r12, qword [rbx+10H]                    ; 0098 _ 4C: 8B. 63, 10
        mov     qword [rbx+8H], 0                       ; 009C _ 48: C7. 43, 08, 00000000
        mov     r11, qword [r8+10H]                     ; 00A4 _ 4D: 8B. 58, 10
        mov     qword [r8+10H], r12                     ; 00A8 _ 4D: 89. 60, 10
        mov     rdx, qword [rbx+18H]                    ; 00AC _ 48: 8B. 53, 18
        mov     qword [rbx+10H], r11                    ; 00B0 _ 4C: 89. 5B, 10
        mov     r13, qword [r8+18H]                     ; 00B4 _ 4D: 8B. 68, 18
        mov     qword [r8+18H], rdx                     ; 00B8 _ 49: 89. 50, 18
        mov     qword [rbx+18H], r13                    ; 00BC _ 4C: 89. 6B, 18
?_0317: mov     rbx, qword [rdi]                        ; 00C0 _ 48: 8B. 1F
        mov     rdx, rbp                                ; 00C3 _ 48: 89. EA
        mov     r11, qword [rdi+8H]                     ; 00C6 _ 4C: 8B. 5F, 08
        mov     r8, rbx                                 ; 00CA _ 49: 89. D8
        jmp     ?_0320                                  ; 00CD _ EB, 61

?_0318: test    rdx, rdx                                ; 00CF _ 48: 85. D2
        jz      ?_0319                                  ; 00D2 _ 74, 54
        mov     eax, dword [r8]                         ; 00D4 _ 41: 8B. 00
        mov     dword [rdx], eax                        ; 00D7 _ 89. 02
        mov     ecx, dword [r8+4H]                      ; 00D9 _ 41: 8B. 48, 04
        mov     qword [rdx+10H], 0                      ; 00DD _ 48: C7. 42, 10, 00000000
        mov     qword [rdx+18H], 0                      ; 00E5 _ 48: C7. 42, 18, 00000000
        mov     qword [rdx+8H], 0                       ; 00ED _ 48: C7. 42, 08, 00000000
        mov     r9, qword [r8+8H]                       ; 00F5 _ 4D: 8B. 48, 08
        mov     dword [rdx+4H], ecx                     ; 00F9 _ 89. 4A, 04
        mov     qword [rdx+8H], r9                      ; 00FC _ 4C: 89. 4A, 08
        mov     r12, qword [r8+10H]                     ; 0100 _ 4D: 8B. 60, 10
        mov     qword [r8+8H], 0                        ; 0104 _ 49: C7. 40, 08, 00000000
        mov     r10, qword [rdx+10H]                    ; 010C _ 4C: 8B. 52, 10
        mov     qword [rdx+10H], r12                    ; 0110 _ 4C: 89. 62, 10
        mov     rax, qword [r8+18H]                     ; 0114 _ 49: 8B. 40, 18
        mov     qword [r8+10H], r10                     ; 0118 _ 4D: 89. 50, 10
        mov     r13, qword [rdx+18H]                    ; 011C _ 4C: 8B. 6A, 18
        mov     qword [rdx+18H], rax                    ; 0120 _ 48: 89. 42, 18
        mov     qword [r8+18H], r13                     ; 0124 _ 4D: 89. 68, 18
?_0319: add     rdx, 32                                 ; 0128 _ 48: 83. C2, 20
        add     r8, 32                                  ; 012C _ 49: 83. C0, 20
?_0320: cmp     r11, r8                                 ; 0130 _ 4D: 39. C3
        jnz     ?_0318                                  ; 0133 _ 75, 9A
        sub     r11, rbx                                ; 0135 _ 49: 29. DB
        mov     r12, qword [rdi+8H]                     ; 0138 _ 4C: 8B. 67, 08
        and     r11, 0FFFFFFFFFFFFFFE0H                 ; 013C _ 49: 83. E3, E0
        mov     rbx, qword [rdi]                        ; 0140 _ 48: 8B. 1F
        lea     r13, [rbp+r11+20H]                      ; 0143 _ 4E: 8D. 6C 1D, 20
        jmp     ?_0323                                  ; 0148 _ EB, 0D

?_0321: mov     rcx, qword [rbx+8H]                     ; 014A _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 014E _ 48: 85. C9
        jnz     ?_0327                                  ; 0151 _ 75, 4E
?_0322: add     rbx, 32                                 ; 0153 _ 48: 83. C3, 20
?_0323: cmp     r12, rbx                                ; 0157 _ 49: 39. DC
        jnz     ?_0321                                  ; 015A _ 75, EE
        mov     rcx, qword [rdi]                        ; 015C _ 48: 8B. 0F
        test    rcx, rcx                                ; 015F _ 48: 85. C9
        jz      ?_0324                                  ; 0162 _ 74, 05
        call    _ZdlPv                                  ; 0164 _ E8, 00000000(rel)
?_0324: shl     rsi, 5                                  ; 0169 _ 48: C1. E6, 05
        mov     qword [rdi], rbp                        ; 016D _ 48: 89. 2F
        add     rbp, rsi                                ; 0170 _ 48: 01. F5
        mov     qword [rdi+8H], r13                     ; 0173 _ 4C: 89. 6F, 08
        mov     qword [rdi+10H], rbp                    ; 0177 _ 48: 89. 6F, 10
        add     rsp, 40                                 ; 017B _ 48: 83. C4, 28
        pop     rbx                                     ; 017F _ 5B
        pop     rsi                                     ; 0180 _ 5E
        pop     rdi                                     ; 0181 _ 5F
        pop     rbp                                     ; 0182 _ 5D
        pop     r12                                     ; 0183 _ 41: 5C
        pop     r13                                     ; 0185 _ 41: 5D
        ret                                             ; 0187 _ C3

?_0325: mov     esi, 1                                  ; 0188 _ BE, 00000001
        jmp     ?_0315                                  ; 018D _ E9, FFFFFEBE

?_0326: mov     rsi, qword 7FFFFFFFFFFFFFFH             ; 0192 _ 48: BE, 07FFFFFFFFFFFFFF
        jmp     ?_0315                                  ; 019C _ E9, FFFFFEAF
; .weak._ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIJS1_EEEvDpOT_._ZN6Search4initEv End of function

?_0327: ; Local function
        call    _ZdlPv                                  ; 01A1 _ E8, 00000000(rel)
        jmp     ?_0322                                  ; 01A6 _ EB, AB

        nop                                             ; 01A8 _ 90
        nop                                             ; 01A9 _ 90
        nop                                             ; 01AA _ 90
        nop                                             ; 01AB _ 90
        nop                                             ; 01AC _ 90
        nop                                             ; 01AD _ 90
        nop                                             ; 01AE _ 90
        nop                                             ; 01AF _ 90


SECTION .xdata$_ZNSt6vectorIN6Search8RootMoveESaIS1_EE19_M_emplace_back_auxIIS1_EEEvDpOT_ align=4 noexecute ; section number 15, const
;  Communal section not supported by YASM

        db 01H, 0CH, 07H, 00H, 0CH, 42H, 08H, 30H       ; 0000 _ .....B.0
        db 07H, 60H, 06H, 70H, 05H, 50H, 04H, 0C0H      ; 0008 _ .`.p.P..
        db 02H, 0D0H, 00H, 00H                          ; 0010 _ ....


SECTION .rdata  align=32 noexecute                      ; section number 17, const

?_0328:                                                 ; byte
        db 69H, 6EH, 66H, 6FH, 20H, 64H, 65H, 70H       ; 0000 _ info dep
        db 74H, 68H, 20H, 30H, 20H, 73H, 63H, 6FH       ; 0008 _ th 0 sco
        db 72H, 65H, 20H, 00H                           ; 0010 _ re .

?_0329:                                                 ; byte
        db 62H, 65H, 73H, 74H, 6DH, 6FH, 76H, 65H       ; 0014 _ bestmove
        db 20H, 00H                                     ; 001C _  .

?_0330:                                                 ; byte
        db 20H, 70H, 6FH, 6EH, 64H, 65H, 72H, 20H       ; 001E _  ponder 
        db 00H                                          ; 0026 _ .

?_0331:                                                 ; byte
        db 69H, 6EH, 66H, 6FH, 20H, 6EH, 6FH, 64H       ; 0027 _ info nod
        db 65H, 73H, 20H, 00H                           ; 002F _ es .

?_0332:                                                 ; byte
        db 20H, 74H, 69H, 6DH, 65H, 20H, 00H            ; 0033 _  time .

?_0333:                                                 ; byte
        db 76H, 65H, 63H, 74H, 6FH, 72H, 3AH, 3AH       ; 003A _ vector::
        db 5FH, 4DH, 5FH, 64H, 65H, 66H, 61H, 75H       ; 0042 _ _M_defau
        db 6CH, 74H, 5FH, 61H, 70H, 70H, 65H, 6EH       ; 004A _ lt_appen
        db 64H, 00H                                     ; 0052 _ d.

?_0334:                                                 ; byte
        db 20H, 6CH, 6FH, 77H, 65H, 72H, 62H, 6FH       ; 0054 _  lowerbo
        db 75H, 6EH, 64H, 00H                           ; 005C _ und.

?_0335:                                                 ; byte
        db 20H, 75H, 70H, 70H, 65H, 72H, 62H, 6FH       ; 0060 _  upperbo
        db 75H, 6EH, 64H, 00H                           ; 0068 _ und.

?_0336:                                                 ; byte
        db 20H, 6EH, 6FH, 64H, 65H, 73H, 20H, 00H       ; 006C _  nodes .

?_0337:                                                 ; byte
        db 20H, 6EH, 70H, 73H, 20H, 00H                 ; 0074 _  nps .

?_0338:                                                 ; byte
        db 20H, 68H, 61H, 73H, 68H, 66H, 75H, 6CH       ; 007A _  hashful
        db 6CH, 20H, 00H                                ; 0082 _ l .

?_0339:                                                 ; byte
        db 20H, 74H, 62H, 68H, 69H, 74H, 73H, 20H       ; 0085 _  tbhits 
        db 00H                                          ; 008D _ .

?_0340:                                                 ; byte
        db 20H, 70H, 76H, 00H                           ; 008E _  pv.

?_0341:                                                 ; byte
        db 69H, 6EH, 66H, 6FH, 20H, 64H, 65H, 70H       ; 0092 _ info dep
        db 74H, 68H, 20H, 00H                           ; 009A _ th .

?_0342:                                                 ; byte
        db 20H, 73H, 65H, 6CH, 64H, 65H, 70H, 74H       ; 009E _  seldept
        db 68H, 20H, 00H                                ; 00A6 _ h .

?_0343:                                                 ; byte
        db 20H, 6DH, 75H, 6CH, 74H, 69H, 70H, 76H       ; 00A9 _  multipv
        db 20H, 00H                                     ; 00B1 _  .

?_0344:                                                 ; byte
        db 20H, 73H, 63H, 6FH, 72H, 65H, 20H, 00H       ; 00B3 _  score .

?_0345:                                                 ; byte
        db 76H, 65H, 63H, 74H, 6FH, 72H, 3AH, 3AH       ; 00BB _ vector::
        db 5FH, 4DH, 5FH, 65H, 6DH, 70H, 6CH, 61H       ; 00C3 _ _M_empla
        db 63H, 65H, 5FH, 62H, 61H, 63H, 6BH, 5FH       ; 00CB _ ce_back_
        db 61H, 75H, 78H, 00H, 00H                      ; 00D3 _ aux..

?_0346:                                                 ; byte
        db 76H, 65H, 63H, 74H, 6FH, 72H, 3AH, 3AH       ; 00D8 _ vector::
        db 5FH, 4DH, 5FH, 72H, 61H, 6EH, 67H, 65H       ; 00E0 _ _M_range
        db 5FH, 63H, 68H, 65H, 63H, 6BH, 3AH, 20H       ; 00E8 _ _check: 
        db 5FH, 5FH, 6EH, 20H, 28H, 77H, 68H, 69H       ; 00F0 _ __n (whi
        db 63H, 68H, 20H, 69H, 73H, 20H, 25H, 7AH       ; 00F8 _ ch is %z
        db 75H, 29H, 20H, 3EH, 3DH, 20H, 74H, 68H       ; 0100 _ u) >= th
        db 69H, 73H, 2DH, 3EH, 73H, 69H, 7AH, 65H       ; 0108 _ is->size
        db 28H, 29H, 20H, 28H, 77H, 68H, 69H, 63H       ; 0110 _ () (whic
        db 68H, 20H, 69H, 73H, 20H, 25H, 7AH, 75H       ; 0118 _ h is %zu
        db 29H, 00H                                     ; 0120 _ ).

?_0347:                                                 ; byte
        db 3AH, 20H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0122 _ : ......
        db 00H, 00H, 00H, 00H, 00H, 00H                 ; 012A _ ......

_ZN12_GLOBAL__N_1L12razor_marginE:                      ; byte
        db 0E3H, 01H, 00H, 00H, 3AH, 02H, 00H, 00H      ; 0130 _ ....:...
        db 5BH, 02H, 00H, 00H, 2AH, 02H, 00H, 00H       ; 0138 _ [...*...

._437:                                                  ; byte
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0140 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0148 _ ........
        db 00H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0150 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0158 _ ........

._436:                                                  ; byte
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0160 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0168 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0170 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0178 _ ........

._435:                                                  ; byte
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0180 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0188 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0190 _ ........
        db 00H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0198 _ ........

._434:                                                  ; byte
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 01A0 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 01A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01B8 _ ........

._433:                                                  ; byte
        db 00H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 01C0 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 01C8 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01D0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01D8 _ ........

._432:                                                  ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01E0 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 01E8 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 01F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01F8 _ ........

._431:                                                  ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0200 _ ........
        db 00H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0208 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0210 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0218 _ ........

._430:                                                  ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0220 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0228 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0230 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0238 _ ........

._429:                                                  ; byte
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0240 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0248 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0250 _ ........

?_0348:                                                 ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0258 _ ........

._428:                                                  ; byte
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0260 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0268 _ ........
        db 00H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0270 _ ........

?_0349:                                                 ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0278 _ ........

._427:                                                  ; byte
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0280 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0288 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0290 _ ........

?_0350:                                                 ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0298 _ ........

._426:                                                  ; byte
        db 00H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 02A0 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 02A8 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 02B0 _ ........

?_0351:                                                 ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 02B8 _ ........

._425:                                                  ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 02C0 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 02C8 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 02D0 _ ........

?_0352:                                                 ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 02D8 _ ........

._424:                                                  ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 02E0 _ ........
        db 00H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 02E8 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 02F0 _ ........

?_0353:                                                 ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 02F8 _ ........

._423:                                                  ; byte
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0300 _ ........
        db 00H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0308 _ ........

._422:                                                  ; byte
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0310 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0318 _ ........

._421:                                                  ; byte
        db 00H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0320 _ ........
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0328 _ ........

._420:                                                  ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0330 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0338 _ ........

._419:                                                  ; byte
        db 01H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0340 _ ........

._418:                                                  ; byte
        db 00H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0348 _ ........

?_0354: dq 3FE0000000000000H                            ; 0350 _ 0.5 

?_0355: dq 3FE999999999999AH                            ; 0358 _ 0.8 

?_0356: dq 3FFCCCCCCCCCCCCDH                            ; 0360 _ 1.8 

?_0357: dq 3FE8BC6A7EF9DB23H                            ; 0368 _ 0.773 

?_0358: dq 4003333333333333H                            ; 0370 _ 2.4 

?_0359: dq 3FDF5C28F5C28F5CH                            ; 0378 _ 0.49 

?_0360: dq 3FF0B851EB851EB8H                            ; 0380 _ 1.045 

?_0361: dq 4007333333333333H                            ; 0388 _ 2.9 

?_0362: dq 3FE028F5C28F5C29H                            ; 0390 _ 0.505 

?_0363: dq 4083D00000000000H                            ; 0398 _ 634.0 

?_0364: dq 3FF0000000000000H                            ; 03A0 _ 1.0 

?_0365: dq 3F9EB851EB851EB8H                            ; 03A8 _ 0.03 
        dq 0000000000000000H                            ; 03B0 _ 0.0 
        dq 0000000000000000H                            ; 03B8 _ 0.0 


SECTION .xdata.unlikely align=4 noexecute               ; section number 18, const

        db 01H, 0DH, 07H, 00H, 0DH, 01H, 12H, 01H       ; 0000 _ ........
        db 06H, 30H, 05H, 60H, 04H, 70H, 03H, 50H       ; 0008 _ .0.`.p.P
        db 02H, 0C0H, 00H, 00H, 01H, 0EH, 08H, 00H      ; 0010 _ ........
        db 0EH, 32H, 0AH, 30H, 09H, 60H, 08H, 70H       ; 0018 _ .2.0.`.p
        db 07H, 50H, 06H, 0C0H, 04H, 0D0H, 02H, 0E0H    ; 0020 _ .P......


SECTION .text$_ZNSt6vectorIN6Search8RootMoveESaIS1_EEaSERKS3_ align=16 execute ; section number 20, code
;  Communal section not supported by YASM

_ZNSt6vectorIN6Search8RootMoveESaIS1_EEaSERKS3_:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 56                                 ; 000C _ 48: 83. EC, 38
        cmp     rdx, rcx                                ; 0010 _ 48: 39. CA
        mov     rsi, rcx                                ; 0013 _ 48: 89. CE
        mov     r15, rdx                                ; 0016 _ 49: 89. D7
        je      ?_0386                                  ; 0019 _ 0F 84, 000001B5
        mov     r12, qword [rdx+8H]                     ; 001F _ 4C: 8B. 62, 08
        mov     rdi, qword [rdx]                        ; 0023 _ 48: 8B. 3A
        mov     r14, qword [rcx]                        ; 0026 _ 4C: 8B. 31
        mov     rax, qword [rcx+10H]                    ; 0029 _ 48: 8B. 41, 10
        mov     rbp, r12                                ; 002D _ 4C: 89. E5
        sub     rbp, rdi                                ; 0030 _ 48: 29. FD
        mov     rbx, rbp                                ; 0033 _ 48: 89. EB
        sub     rax, r14                                ; 0036 _ 4C: 29. F0
        sar     rbx, 5                                  ; 0039 _ 48: C1. FB, 05
        sar     rax, 5                                  ; 003D _ 48: C1. F8, 05
        cmp     rbx, rax                                ; 0041 _ 48: 39. C3
        jbe     ?_0376                                  ; 0044 _ 0F 86, 00000096
        test    rbx, rbx                                ; 004A _ 48: 85. DB
        jz      ?_0367                                  ; 004D _ 74, 21
        mov     rcx, qword 7FFFFFFFFFFFFFFH             ; 004F _ 48: B9, 07FFFFFFFFFFFFFF
        cmp     rbx, rcx                                ; 0059 _ 48: 39. CB
        jbe     ?_0366                                  ; 005C _ 76, 05
        call    _ZSt17__throw_bad_allocv                ; 005E _ E8, 00000000(rel)
?_0366: mov     rcx, rbp                                ; 0063 _ 48: 89. E9
        call    _Znwy                                   ; 0066 _ E8, 00000000(rel)
        mov     rbx, rax                                ; 006B _ 48: 89. C3
        jmp     ?_0368                                  ; 006E _ EB, 02

?_0367: xor     ebx, ebx                                ; 0070 _ 31. DB
?_0368: mov     r14, rbx                                ; 0072 _ 49: 89. DE
?_0369: cmp     r12, rdi                                ; 0075 _ 49: 39. FC
        jz      ?_0371                                  ; 0078 _ 74, 2A
        test    r14, r14                                ; 007A _ 4D: 85. F6
        jz      ?_0370                                  ; 007D _ 74, 1B
        mov     r8d, dword [rdi]                        ; 007F _ 44: 8B. 07
        lea     rdx, [rdi+8H]                           ; 0082 _ 48: 8D. 57, 08
        lea     rcx, [r14+8H]                           ; 0086 _ 49: 8D. 4E, 08
        mov     dword [r14], r8d                        ; 008A _ 45: 89. 06
        mov     r9d, dword [rdi+4H]                     ; 008D _ 44: 8B. 4F, 04
        mov     dword [r14+4H], r9d                     ; 0091 _ 45: 89. 4E, 04
        call    _ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_      ; 0095 _ E8, 00000000(rel)
?_0370: add     rdi, 32                                 ; 009A _ 48: 83. C7, 20
        add     r14, 32                                 ; 009E _ 49: 83. C6, 20
        jmp     ?_0369                                  ; 00A2 _ EB, D1

?_0371: mov     r13, qword [rsi+8H]                     ; 00A4 _ 4C: 8B. 6E, 08
        mov     rdi, qword [rsi]                        ; 00A8 _ 48: 8B. 3E
?_0372: cmp     r13, rdi                                ; 00AB _ 49: 39. FD
        jz      ?_0374                                  ; 00AE _ 74, 14
        mov     rcx, qword [rdi+8H]                     ; 00B0 _ 48: 8B. 4F, 08
        test    rcx, rcx                                ; 00B4 _ 48: 85. C9
        jz      ?_0373                                  ; 00B7 _ 74, 05
        call    _ZdlPv                                  ; 00B9 _ E8, 00000000(rel)
?_0373: add     rdi, 32                                 ; 00BE _ 48: 83. C7, 20
        jmp     ?_0372                                  ; 00C2 _ EB, E7

?_0374: mov     rcx, qword [rsi]                        ; 00C4 _ 48: 8B. 0E
        test    rcx, rcx                                ; 00C7 _ 48: 85. C9
        jz      ?_0375                                  ; 00CA _ 74, 05
        call    _ZdlPv                                  ; 00CC _ E8, 00000000(rel)
?_0375: mov     qword [rsi], rbx                        ; 00D1 _ 48: 89. 1E
        add     rbx, rbp                                ; 00D4 _ 48: 01. EB
        mov     qword [rsi+10H], rbx                    ; 00D7 _ 48: 89. 5E, 10
        jmp     ?_0385                                  ; 00DB _ E9, 000000ED

?_0376: mov     r12, qword [rcx+8H]                     ; 00E0 _ 4C: 8B. 61, 08
        lea     rdi, [rdi+8H]                           ; 00E4 _ 48: 8D. 7F, 08
        lea     r13, [r14+8H]                           ; 00E8 _ 4D: 8D. 6E, 08
        mov     r10, r12                                ; 00EC _ 4D: 89. E2
        sub     r10, r14                                ; 00EF _ 4D: 29. F2
        sar     r10, 5                                  ; 00F2 _ 49: C1. FA, 05
        cmp     rbx, r10                                ; 00F6 _ 4C: 39. D3
        ja      ?_0381                                  ; 00F9 _ 77, 5F
        mov     r15, rbx                                ; 00FB _ 49: 89. DF
?_0377: test    r15, r15                                ; 00FE _ 4D: 85. FF
        jle     ?_0378                                  ; 0101 _ 7E, 26
        mov     eax, dword [rdi-8H]                     ; 0103 _ 8B. 47, F8
        mov     rcx, r13                                ; 0106 _ 4C: 89. E9
        dec     r15                                     ; 0109 _ 49: FF. CF
        add     r13, 32                                 ; 010C _ 49: 83. C5, 20
        mov     dword [r13-28H], eax                    ; 0110 _ 41: 89. 45, D8
        mov     edx, dword [rdi-4H]                     ; 0114 _ 8B. 57, FC
        mov     dword [r13-24H], edx                    ; 0117 _ 41: 89. 55, DC
        mov     rdx, rdi                                ; 011B _ 48: 89. FA
        add     rdi, 32                                 ; 011E _ 48: 83. C7, 20
        call    _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_      ; 0122 _ E8, 00000000(rel)
        jmp     ?_0377                                  ; 0127 _ EB, D5

?_0378: test    rbx, rbx                                ; 0129 _ 48: 85. DB
        mov     r11d, 0                                 ; 012C _ 41: BB, 00000000
        cmovs   rbx, r11                                ; 0132 _ 49: 0F 48. DB
        shl     rbx, 5                                  ; 0136 _ 48: C1. E3, 05
        add     rbx, r14                                ; 013A _ 4C: 01. F3
?_0379: cmp     r12, rbx                                ; 013D _ 49: 39. DC
        je      ?_0385                                  ; 0140 _ 0F 84, 00000087
        mov     rcx, qword [rbx+8H]                     ; 0146 _ 48: 8B. 4B, 08
        test    rcx, rcx                                ; 014A _ 48: 85. C9
        jz      ?_0380                                  ; 014D _ 74, 05
        call    _ZdlPv                                  ; 014F _ E8, 00000000(rel)
?_0380: add     rbx, 32                                 ; 0154 _ 48: 83. C3, 20
        jmp     ?_0379                                  ; 0158 _ EB, E3

?_0381: test    r10, r10                                ; 015A _ 4D: 85. D2
        jle     ?_0382                                  ; 015D _ 7E, 32
        mov     r8d, dword [rdi-8H]                     ; 015F _ 44: 8B. 47, F8
        mov     rdx, rdi                                ; 0163 _ 48: 89. FA
        mov     rcx, r13                                ; 0166 _ 4C: 89. E9
        mov     qword [rsp+28H], r10                    ; 0169 _ 4C: 89. 54 24, 28
        add     r13, 32                                 ; 016E _ 49: 83. C5, 20
        add     rdi, 32                                 ; 0172 _ 48: 83. C7, 20
        mov     dword [r13-28H], r8d                    ; 0176 _ 45: 89. 45, D8
        mov     r9d, dword [rdi-24H]                    ; 017A _ 44: 8B. 4F, DC
        mov     dword [r13-24H], r9d                    ; 017E _ 45: 89. 4D, DC
        call    _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_      ; 0182 _ E8, 00000000(rel)
        mov     r10, qword [rsp+28H]                    ; 0187 _ 4C: 8B. 54 24, 28
        dec     r10                                     ; 018C _ 49: FF. CA
        jmp     ?_0381                                  ; 018F _ EB, C9

?_0382: mov     rdi, qword [rsi+8H]                     ; 0191 _ 48: 8B. 7E, 08
        mov     r12, qword [r15+8H]                     ; 0195 _ 4D: 8B. 67, 08
        mov     rbx, rdi                                ; 0199 _ 48: 89. FB
        sub     rbx, qword [rsi]                        ; 019C _ 48: 2B. 1E
        add     rbx, qword [r15]                        ; 019F _ 49: 03. 1F
?_0383: cmp     rbx, r12                                ; 01A2 _ 4C: 39. E3
        jz      ?_0385                                  ; 01A5 _ 74, 26
        test    rdi, rdi                                ; 01A7 _ 48: 85. FF
        jz      ?_0384                                  ; 01AA _ 74, 17
        mov     edx, dword [rbx]                        ; 01AC _ 8B. 13
        mov     dword [rdi], edx                        ; 01AE _ 89. 17
        mov     ecx, dword [rbx+4H]                     ; 01B0 _ 8B. 4B, 04
        lea     rdx, [rbx+8H]                           ; 01B3 _ 48: 8D. 53, 08
        mov     dword [rdi+4H], ecx                     ; 01B7 _ 89. 4F, 04
        lea     rcx, [rdi+8H]                           ; 01BA _ 48: 8D. 4F, 08
        call    _ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_      ; 01BE _ E8, 00000000(rel)
?_0384: add     rbx, 32                                 ; 01C3 _ 48: 83. C3, 20
        add     rdi, 32                                 ; 01C7 _ 48: 83. C7, 20
        jmp     ?_0383                                  ; 01CB _ EB, D5

?_0385: add     rbp, qword [rsi]                        ; 01CD _ 48: 03. 2E
        mov     qword [rsi+8H], rbp                     ; 01D0 _ 48: 89. 6E, 08
?_0386: mov     rax, rsi                                ; 01D4 _ 48: 89. F0
        add     rsp, 56                                 ; 01D7 _ 48: 83. C4, 38
        pop     rbx                                     ; 01DB _ 5B
        pop     rsi                                     ; 01DC _ 5E
        pop     rdi                                     ; 01DD _ 5F
        pop     rbp                                     ; 01DE _ 5D
        pop     r12                                     ; 01DF _ 41: 5C
        pop     r13                                     ; 01E1 _ 41: 5D
        pop     r14                                     ; 01E3 _ 41: 5E
        pop     r15                                     ; 01E5 _ 41: 5F
        ret                                             ; 01E7 _ C3
; _ZNSt6vectorIN6Search8RootMoveESaIS1_EEaSERKS3_ End of function

        nop                                             ; 01E8 _ 90
        nop                                             ; 01E9 _ 90
        nop                                             ; 01EA _ 90
        nop                                             ; 01EB _ 90
        nop                                             ; 01EC _ 90
        nop                                             ; 01ED _ 90
        nop                                             ; 01EE _ 90
        nop                                             ; 01EF _ 90


SECTION .xdata$_ZNSt6vectorIN6Search8RootMoveESaIS1_EEaSERKS3_ align=4 noexecute ; section number 21, const
;  Communal section not supported by YASM

        db 01H, 10H, 09H, 00H, 10H, 62H, 0CH, 30H       ; 0000 _ .....b.0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .text.hot align=16 execute                      ; section number 23, code

.text.hot:; Local function
_ZN12_GLOBAL__N_16searchILNS_8NodeTypeE1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb:
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 3400                               ; 000C _ 48: 81. EC, 00000D48
        mov     r10d, dword [rdx-20H]                   ; 0013 _ 44: 8B. 52, E0
        mov     rsi, qword [rcx+3B0H]                   ; 0017 _ 48: 8B. B1, 000003B0
        movsxd  rbp, dword [rsp+0DB0H]                  ; 001E _ 48: 63. AC 24, 00000DB0
        movzx   r12d, byte [rsp+0DB8H]                  ; 0026 _ 44: 0F B6. A4 24, 00000DB8
        mov     rdi, rdx                                ; 002F _ 48: 89. D7
        test    r10d, r10d                              ; 0032 _ 45: 85. D2
        mov     rdx, qword [rcx+3B8H]                   ; 0035 _ 48: 8B. 91, 000003B8
        mov     rbx, rcx                                ; 003C _ 48: 89. CB
        sete    r14b                                    ; 003F _ 41: 0F 94. C6
        movzx   ecx, byte [rsi+24D8H]                   ; 0043 _ 0F B6. 8E, 000024D8
        mov     dword [rsp+0DA0H], r8d                  ; 004A _ 44: 89. 84 24, 00000DA0
        mov     dword [rsp+0DA8H], r9d                  ; 0052 _ 44: 89. 8C 24, 00000DA8
        mov     qword [rsp+0B0H], rsi                   ; 005A _ 48: 89. B4 24, 000000B0
        cmp     qword [rdx+38H], 0                      ; 0062 _ 48: 83. 7A, 38, 00
        mov     dword [rdi+24H], 0                      ; 0067 _ C7. 47, 24, 00000000
        setne   byte [rsp+76H]                          ; 006E _ 0F 95. 44 24, 76
        add     r10d, 1                                 ; 0073 _ 41: 83. C2, 01
        test    cl, cl                                  ; 0077 _ 84. C9
        mov     dword [rdi+8H], r10d                    ; 0079 _ 44: 89. 57, 08
        jne     ?_0499                                  ; 007D _ 0F 85, 000014F6
        mov     r8d, dword [rsi+0ECH]                   ; 0083 _ 44: 8B. 86, 000000EC
        lea     r9d, [r8+1H]                            ; 008A _ 45: 8D. 48, 01
        mov     dword [rsp+58H], r8d                    ; 008E _ 44: 89. 44 24, 58
        cmp     r9d, 4096                               ; 0093 _ 41: 81. F9, 00001000
        mov     dword [rsi+0ECH], r9d                   ; 009A _ 44: 89. 8E, 000000EC
        jg      ?_0497                                  ; 00A1 _ 0F 8F, 000014B1
?_0387: mov     rsi, qword [rsp+0B0H]                   ; 00A7 _ 48: 8B. B4 24, 000000B0
        cmp     dword [rsi+0E8H], r10d                  ; 00AF _ 44: 39. 96, 000000E8
        jl      ?_0487                                  ; 00B6 _ 0F 8C, 000013C8
?_0388: test    r14b, r14b                              ; 00BC _ 45: 84. F6
        jne     ?_0389                                  ; 00BF _ 0F 85, 00000081
        movzx   edx, byte [rel _ZN6Search7SignalsE]     ; 00C5 _ 0F B6. 15, 00000098(rel)
        test    dl, dl                                  ; 00CC _ 84. D2
        jne     ?_0494                                  ; 00CE _ 0F 85, 00001456
        mov     rcx, rbx                                ; 00D4 _ 48: 89. D9
        call    _ZNK8Position7is_drawEv                 ; 00D7 _ E8, 00000000(rel)
        test    al, al                                  ; 00DC _ 84. C0
        jne     ?_0494                                  ; 00DE _ 0F 85, 00001446
        mov     ecx, dword [rdi+8H]                     ; 00E4 _ 8B. 4F, 08
        cmp     ecx, 127                                ; 00E7 _ 83. F9, 7F
        jg      ?_0494                                  ; 00EA _ 0F 8F, 0000143A
        lea     r8d, [rcx-7D00H]                        ; 00F0 _ 44: 8D. 81, FFFF8300
        mov     r9d, 31999                              ; 00F7 _ 41: B9, 00007CFF
        cmp     dword [rsp+0DA0H], r8d                  ; 00FD _ 44: 39. 84 24, 00000DA0
        cmovge  r8d, dword [rsp+0DA0H]                  ; 0105 _ 44: 0F 4D. 84 24, 00000DA0
        sub     r9d, ecx                                ; 010E _ 41: 29. C9
        cmp     dword [rsp+0DA8H], r9d                  ; 0111 _ 44: 39. 8C 24, 00000DA8
        cmovle  r9d, dword [rsp+0DA8H]                  ; 0119 _ 44: 0F 4E. 8C 24, 00000DA8
        mov     dword [rsp+0DA0H], r8d                  ; 0122 _ 44: 89. 84 24, 00000DA0
        mov     eax, dword [rsp+0DA0H]                  ; 012A _ 8B. 84 24, 00000DA0
        mov     dword [rsp+0DA8H], r9d                  ; 0131 _ 44: 89. 8C 24, 00000DA8
        cmp     dword [rsp+0DA8H], eax                  ; 0139 _ 39. 84 24, 00000DA8
        jle     ?_0506                                  ; 0140 _ 0F 8E, 000014A6
?_0389: mov     r10d, dword [rdi+10H]                   ; 0146 _ 44: 8B. 57, 10
        mov     dword [rdi+38H], 0                      ; 014A _ C7. 47, 38, 00000000
        mov     dword [rdi+0CH], 0                      ; 0151 _ C7. 47, 0C, 00000000
        mov     byte [rdi+48H], 0                       ; 0158 _ C6. 47, 48, 00
        mov     dword [rdi+68H], 0                      ; 015C _ C7. 47, 68, 00000000
        test    r10d, r10d                              ; 0163 _ 45: 85. D2
        mov     dword [rdi+64H], 0                      ; 0166 _ C7. 47, 64, 00000000
        mov     dword [rsp+70H], r10d                   ; 016D _ 44: 89. 54 24, 70
        jne     Unnamed_4_C2D                           ; 0172 _ 0F 85, 00000C2D(rel)
        mov     r11, qword [rbx+3B8H]                   ; 0178 _ 4C: 8B. 9B, 000003B8
        mov     r13, qword [r11+30H]                    ; 017F _ 4D: 8B. 6B, 30
        mov     qword [rsp+0B8H], r13                   ; 0183 _ 4C: 89. AC 24, 000000B8
        mov     rdx, r13                                ; 018B _ 4C: 89. EA
        mov     rcx, qword [rel .refptr.TT]             ; 018E _ 48: 8B. 0D, 00000000(rel)
        lea     rsi, [rsp+0FBH]                         ; 0195 _ 48: 8D. B4 24, 000000FB
        mov     r8, rsi                                 ; 019D _ 49: 89. F0
        call    _ZNK18TranspositionTable5probeEyRb      ; 01A0 _ E8, 00000000(rel)
        cmp     byte [rsp+0FBH], 0                      ; 01A5 _ 80. BC 24, 000000FB, 00
        mov     qword [rsp+0A8H], rax                   ; 01AD _ 48: 89. 84 24, 000000A8
        je      ?_0477                                  ; 01B5 _ 0F 84, 00001162
        movsx   r13d, word [rax+4H]                     ; 01BB _ 44: 0F BF. 68, 04
        mov     edx, dword [rdi+8H]                     ; 01C0 _ 8B. 57, 08
        cmp     r13d, 32002                             ; 01C3 _ 41: 81. FD, 00007D02
        jz      ?_0390                                  ; 01CA _ 74, 1A
        cmp     r13d, 31743                             ; 01CC _ 41: 81. FD, 00007BFF
        jg      ?_0501                                  ; 01D3 _ 0F 8F, 000013C7
        cmp     r13d, -31743                            ; 01D9 _ 41: 81. FD, FFFF8401
        jl      ?_0496                                  ; 01E0 _ 0F 8C, 0000136A
?_0390: test    r14b, r14b                              ; 01E6 _ 45: 84. F6
        jne     ?_0485                                  ; 01E9 _ 0F 85, 00001262
        mov     rcx, qword [rsp+0A8H]                   ; 01EF _ 48: 8B. 8C 24, 000000A8
        movzx   r15d, word [rcx+2H]                     ; 01F7 _ 44: 0F B7. 79, 02
?_0391: mov     r8d, dword [rel _ZN10Tablebases11CardinalityE]; 01FC _ 44: 8B. 05, 00000018(rel)
        test    r8d, r8d                                ; 0203 _ 45: 85. C0
        jne     ?_0504                                  ; 0206 _ 0F 85, 000013CE
?_0392: cmp     byte [rsp+76H], 0                       ; 020C _ 80. 7C 24, 76, 00
        jne     ?_0472                                  ; 0211 _ 0F 85, 00001010
        cmp     byte [rsp+0FBH], 0                      ; 0217 _ 80. BC 24, 000000FB, 00
        je      ?_0478                                  ; 021F _ 0F 84, 0000110F
        mov     rcx, qword [rsp+0A8H]                   ; 0225 _ 48: 8B. 8C 24, 000000A8
        movsx   ecx, word [rcx+6H]                      ; 022D _ 0F BF. 49, 06
        cmp     ecx, 32002                              ; 0231 _ 81. F9, 00007D02
        mov     dword [rdi+1CH], ecx                    ; 0237 _ 89. 4F, 1C
        je      ?_0502                                  ; 023A _ 0F 84, 00001368
?_0393: cmp     r13d, 32002                             ; 0240 _ 41: 81. FD, 00007D02
        jz      ?_0394                                  ; 0247 _ 74, 1F
        mov     r10, qword [rsp+0A8H]                   ; 0249 _ 4C: 8B. 94 24, 000000A8
        xor     edx, edx                                ; 0251 _ 31. D2
        cmp     ecx, r13d                               ; 0253 _ 44: 39. E9
        setl    dl                                      ; 0256 _ 0F 9C. C2
        add     edx, 1                                  ; 0259 _ 83. C2, 01
        movzx   r11d, byte [r10+8H]                     ; 025C _ 45: 0F B6. 5A, 08
        test    edx, r11d                               ; 0261 _ 44: 85. DA
        cmovne  ecx, r13d                               ; 0264 _ 41: 0F 45. CD
?_0394: cmp     byte [rdi+20H], 0                       ; 0268 _ 80. 7F, 20, 00
        jne     ?_0480                                  ; 026C _ 0F 85, 0000113D
        cmp     ebp, 6                                  ; 0272 _ 83. FD, 06
        setle   al                                      ; 0275 _ 0F 9E. C0
        cmp     r14b, al                                ; 0278 _ 41: 38. C6
        jnc     ?_0396                                  ; 027B _ 73, 4C
        imul    r8d, ebp, 200                           ; 027D _ 44: 69. C5, 000000C8
        mov     r9d, ecx                                ; 0284 _ 41: 89. C9
        sub     r9d, r8d                                ; 0287 _ 45: 29. C1
        cmp     r9d, dword [rsp+0DA8H]                  ; 028A _ 44: 3B. 8C 24, 00000DA8
        mov     eax, r9d                                ; 0292 _ 44: 89. C8
        jl      ?_0396                                  ; 0295 _ 7C, 32
        cmp     ecx, 9999                               ; 0297 _ 81. F9, 0000270F
        jg      ?_0396                                  ; 029D _ 7F, 2A
        mov     r10, qword [rbx+3B8H]                   ; 029F _ 4C: 8B. 93, 000003B8
        movsxd  rcx, dword [rbx+3ACH]                   ; 02A6 _ 48: 63. 8B, 000003AC
        cmp     dword [r10+rcx*4+10H], 0                ; 02AD _ 41: 83. 7C 8A, 10, 00
        jz      ?_0396                                  ; 02B3 _ 74, 14
?_0395: add     rsp, 3400                               ; 02B5 _ 48: 81. C4, 00000D48
        pop     rbx                                     ; 02BC _ 5B
        pop     rsi                                     ; 02BD _ 5E
        pop     rdi                                     ; 02BE _ 5F
        pop     rbp                                     ; 02BF _ 5D
        pop     r12                                     ; 02C0 _ 41: 5C
        pop     r13                                     ; 02C2 _ 41: 5D
        pop     r14                                     ; 02C4 _ 41: 5E
        pop     r15                                     ; 02C6 _ 41: 5F
        ret                                             ; 02C8 _ C3

?_0396: test    r15d, r15d                              ; 02C9 _ 45: 85. FF
        jnz     ?_0397                                  ; 02CC _ 75, 09
        cmp     ebp, 4                                  ; 02CE _ 83. FD, 04
        jg      ?_0475                                  ; 02D1 _ 0F 8F, 00000FC3
?_0397: mov     dword [rsp+0C0H], r15d                  ; 02D7 _ 44: 89. BC 24, 000000C0
?_0398: mov     edx, dword [rdi-1CH]                    ; 02DF _ 8B. 57, E4
        lea     r15, [rel _ZN12_GLOBAL__N_118CounterMoveHistoryE]; 02E2 _ 4C: 8D. 3D, 000000C0(rel)
        mov     eax, dword [rdi-44H]                    ; 02E9 _ 8B. 47, BC
        lea     rsi, [rsp+4C0H]                         ; 02EC _ 48: 8D. B4 24, 000004C0
        mov     qword [rsp+68H], rsi                    ; 02F4 _ 48: 89. 74 24, 68
        and     edx, 3FH                                ; 02F9 _ 83. E2, 3F
        lea     r9, [rdx*4]                             ; 02FC _ 4C: 8D. 0C 95, 00000000
        and     eax, 3FH                                ; 0304 _ 83. E0, 3F
        shl     rdx, 12                                 ; 0307 _ 48: C1. E2, 0C
        lea     r8, [rbx+r9]                            ; 030B _ 4E: 8D. 04 0B
        mov     qword [rsp+0D0H], r9                    ; 030F _ 4C: 89. 8C 24, 000000D0
        mov     ecx, dword [r8]                         ; 0317 _ 41: 8B. 08
        mov     qword [rsp+0D8H], r8                    ; 031A _ 4C: 89. 84 24, 000000D8
        mov     r8, qword [rsp+0B0H]                    ; 0322 _ 4C: 8B. 84 24, 000000B0
        mov     qword [rsp+40H], rdi                    ; 032A _ 48: 89. 7C 24, 40
        mov     r10, rcx                                ; 032F _ 49: 89. CA
        shl     rcx, 8                                  ; 0332 _ 48: C1. E1, 08
        lea     r9, [r8+r9+14D4H]                       ; 0336 _ 4F: 8D. 8C 08, 000014D4
        shl     r10, 18                                 ; 033E _ 49: C1. E2, 12
        mov     ecx, dword [r9+rcx]                     ; 0342 _ 41: 8B. 0C 09
        add     r10, r15                                ; 0346 _ 4D: 01. FA
        mov     r9d, ebp                                ; 0349 _ 41: 89. E9
        lea     r8, [r8+4D4H]                           ; 034C _ 4D: 8D. 80, 000004D4
        add     rdx, r10                                ; 0353 _ 4C: 01. D2
        mov     r10, rsi                                ; 0356 _ 49: 89. F2
        lea     rsi, [rel _ZN12_GLOBAL__N_118CounterMoveHistoryE]; 0359 _ 48: 8D. 35, 000000C0(rel)
        mov     r11, rdx                                ; 0360 _ 49: 89. D3
        mov     qword [rsp+0A0H], rdx                   ; 0363 _ 48: 89. 94 24, 000000A0
        mov     rdx, rbx                                ; 036B _ 48: 89. DA
        mov     qword [rsp+98H], r8                     ; 036E _ 4C: 89. 84 24, 00000098
        mov     dword [rsp+38H], ecx                    ; 0376 _ 89. 4C 24, 38
        mov     r15d, dword [rbx+rax*4]                 ; 037A _ 44: 8B. 3C 83
        shl     rax, 12                                 ; 037E _ 48: C1. E0, 0C
        mov     rcx, r10                                ; 0382 _ 4C: 89. D1
        mov     qword [rsp+28H], r11                    ; 0385 _ 4C: 89. 5C 24, 28
        mov     qword [rsp+20H], r8                     ; 038A _ 4C: 89. 44 24, 20
        shl     r15, 18                                 ; 038F _ 49: C1. E7, 12
        add     r15, rsi                                ; 0393 _ 49: 01. F7
        add     rax, r15                                ; 0396 _ 4C: 01. F8
        mov     r15d, dword [rsp+0C0H]                  ; 0399 _ 44: 8B. BC 24, 000000C0
        mov     qword [rsp+30H], rax                    ; 03A1 _ 48: 89. 44 24, 30
        mov     r8d, r15d                               ; 03A6 _ 45: 89. F8
        call    _ZN10MovePickerC1ERK8Position4Move5DepthRK5StatsI5ValueLb0EERKS5_IS6_Lb1EESC_S3_PN6Search5StackE; 03A9 _ E8, 00000000(rel)
        lea     r10, [rsp+150H]                         ; 03AE _ 4C: 8D. 94 24, 00000150
        mov     rdx, rbx                                ; 03B6 _ 48: 89. DA
        mov     rcx, r10                                ; 03B9 _ 4C: 89. D1
        mov     qword [rsp+0C8H], r10                   ; 03BC _ 4C: 89. 94 24, 000000C8
        call    _ZN9CheckInfoC1ERK8Position             ; 03C4 _ E8, 00000000(rel)
        mov     r9d, dword [rdi+1CH]                    ; 03C9 _ 44: 8B. 4F, 1C
        mov     r11d, r14d                              ; 03CD _ 45: 89. F3
        mov     edx, dword [rdi-34H]                    ; 03D0 _ 8B. 57, CC
        cmp     r9d, edx                                ; 03D3 _ 41: 39. D1
        setge   cl                                      ; 03D6 _ 0F 9D. C1
        cmp     r9d, 32002                              ; 03D9 _ 41: 81. F9, 00007D02
        sete    al                                      ; 03E0 _ 0F 94. C0
        or      eax, ecx                                ; 03E3 _ 09. C8
        cmp     edx, 32002                              ; 03E5 _ 81. FA, 00007D02
        sete    sil                                     ; 03EB _ 40: 0F 94. C6
        xor     r11d, 01H                               ; 03EF _ 41: 83. F3, 01
        or      eax, esi                                ; 03F3 _ 09. F0
        cmp     ebp, 7                                  ; 03F5 _ 83. FD, 07
        setg    r8b                                     ; 03F8 _ 41: 0F 9F. C0
        test    r11b, r8b                               ; 03FC _ 45: 84. C3
        je      ?_0479                                  ; 03FF _ 0F 84, 00000FA0
        test    r15d, r15d                              ; 0405 _ 45: 85. FF
        je      ?_0479                                  ; 0408 _ 0F 84, 00000F97
        cmp     dword [rsp+70H], 0                      ; 040E _ 83. 7C 24, 70, 00
        mov     byte [rsp+77H], 0                       ; 0413 _ C6. 44 24, 77, 00
        jne     Unnamed_4_BC4                           ; 0418 _ 0F 85, 00000BC4(rel)
        lea     r15d, [r13+270FH]                       ; 041E _ 45: 8D. BD, 0000270F
        cmp     r15d, 19998                             ; 0425 _ 41: 81. FF, 00004E1E
        ja      Unnamed_4_BC4                           ; 042C _ 0F 87, 00000BC4(rel)
        mov     r10, qword [rsp+0A8H]                   ; 0432 _ 4C: 8B. 94 24, 000000A8
        test    byte [r10+8H], 02H                      ; 043A _ 41: F6. 42, 08, 02
        jz      ?_0399                                  ; 043F _ 74, 10
        movsx   r9d, byte [r10+9H]                      ; 0441 _ 45: 0F BE. 4A, 09
        lea     edx, [rbp-3H]                           ; 0446 _ 8D. 55, FD
        cmp     r9d, edx                                ; 0449 _ 41: 39. D1
        setge   byte [rsp+77H]                          ; 044C _ 0F 9D. 44 24, 77
?_0399: and     eax, 01H                                ; 0451 _ 83. E0, 01
        mov     esi, ebp                                ; 0454 _ 89. EE
        mov     edx, 63                                 ; 0456 _ BA, 0000003F
        shr     esi, 31                                 ; 045B _ C1. EE, 1F
        mov     r11, rax                                ; 045E _ 49: 89. C3
        add     rax, 2                                  ; 0461 _ 48: 83. C0, 02
        mov     dword [rsp+90H], 0                      ; 0465 _ C7. 84 24, 00000090, 00000000
        lea     ecx, [rbp+rbp]                          ; 0470 _ 8D. 4C 2D, 00
        add     esi, ebp                                ; 0474 _ 01. EE
        shl     r11, 6                                  ; 0476 _ 49: C1. E3, 06
        mov     dword [rsp+94H], 0                      ; 047A _ C7. 84 24, 00000094, 00000000
        shl     rax, 14                                 ; 0485 _ 48: C1. E0, 0E
        sub     r13d, ecx                               ; 0489 _ 41: 29. CD
        sar     esi, 1                                  ; 048C _ D1. FE
        lea     r8, [rel _ZN12_GLOBAL__N_118FutilityMoveCountsE]; 048E _ 4C: 8D. 05, 00410300(rel)
        movsxd  r15, ebp                                ; 0495 _ 4C: 63. FD
        movzx   ecx, r12b                               ; 0498 _ 41: 0F B6. CC
        mov     dword [rsp+0E0H], r13d                  ; 049C _ 44: 89. AC 24, 000000E0
        lea     r13d, [r13-1H]                          ; 04A4 _ 45: 8D. 6D, FF
        add     r8, r11                                 ; 04A8 _ 4D: 01. D8
        mov     dword [rsp+0E8H], esi                   ; 04AB _ 89. B4 24, 000000E8
        lea     r9, [rel _ZN12_GLOBAL__N_110ReductionsE]; 04B2 _ 4C: 8D. 0D, 00400300(rel)
        mov     dword [rsp+0E4H], r13d                  ; 04B9 _ 44: 89. AC 24, 000000E4
        lea     r10, [r8+r15*4]                         ; 04C1 _ 4F: 8D. 14 B8
        add     rax, r9                                 ; 04C5 _ 4C: 01. C8
        cmp     ebp, 63                                 ; 04C8 _ 83. FD, 3F
        mov     dword [rsp+0ECH], ecx                   ; 04CB _ 89. 8C 24, 000000EC
        cmovle  rdx, rbp                                ; 04D2 _ 48: 0F 4E. D5
        xor     r12d, 01H                               ; 04D6 _ 41: 83. F4, 01
        mov     qword [rsp+78H], r10                    ; 04DA _ 4C: 89. 54 24, 78
        xor     r15d, r15d                              ; 04DF _ 45: 31. FF
        movzx   r12d, r12b                              ; 04E2 _ 45: 0F B6. E4
        shl     rdx, 8                                  ; 04E6 _ 48: C1. E2, 08
        mov     dword [rsp+0C4H], r12d                  ; 04EA _ 44: 89. A4 24, 000000C4
        add     rax, rdx                                ; 04F2 _ 48: 01. D0
        mov     qword [rsp+88H], rax                    ; 04F5 _ 48: 89. 84 24, 00000088
        mov     eax, 4294935295                         ; 04FD _ B8, FFFF82FF
        mov     dword [rsp+64H], eax                    ; 0502 _ 89. 44 24, 64
        mov     dword [rsp+60H], eax                    ; 0506 _ 89. 44 24, 60
        jmp     ?_0401                                  ; 050A _ EB, 07

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_0400: mov     r15d, esi                               ; 0510 _ 41: 89. F7
?_0401: mov     rcx, qword [rsp+68H]                    ; 0513 _ 48: 8B. 4C 24, 68
        call    _ZN10MovePicker9next_moveEv             ; 0518 _ E8, 00000000(rel)
        test    eax, eax                                ; 051D _ 85. C0
        mov     dword [rsp+0FCH], eax                   ; 051F _ 89. 84 24, 000000FC
        je      ?_0445                                  ; 0526 _ 0F 84, 00000821
        cmp     dword [rsp+70H], eax                    ; 052C _ 39. 44 24, 70
        jz      ?_0401                                  ; 0530 _ 74, E1
        test    r14b, r14b                              ; 0532 _ 45: 84. F6
        jne     ?_0449                                  ; 0535 _ 0F 85, 00000940
?_0402: lea     esi, [r15+1H]                           ; 053B _ 41: 8D. 77, 01
        mov     r8d, eax                                ; 053F _ 41: 89. C0
        mov     qword [rdi+28H], 0                      ; 0542 _ 48: C7. 47, 28, 00000000
        and     r8d, 0C000H                             ; 054A _ 41: 81. E0, 0000C000
        mov     dword [rdi+24H], esi                    ; 0551 _ 89. 77, 24
        jne     ?_0467                                  ; 0554 _ 0F 85, 00000C20
        mov     ecx, eax                                ; 055A _ 89. C1
        and     ecx, 3FH                                ; 055C _ 83. E1, 3F
        mov     r9d, dword [rbx+rcx*4]                  ; 055F _ 44: 8B. 0C 8B
        test    r9d, r9d                                ; 0563 _ 45: 85. C9
        setne   r13b                                    ; 0566 _ 41: 0F 95. C5
        cmp     qword [rsp+150H], 0                     ; 056A _ 48: 83. BC 24, 00000150, 00
        jne     ?_0468                                  ; 0573 _ 0F 85, 00000C0C
        mov     r10d, eax                               ; 0579 _ 41: 89. C2
        mov     r11, qword [rel .refptr.SquareBB]       ; 057C _ 4C: 8B. 1D, 00000000(rel)
        sar     r10d, 6                                 ; 0583 _ 41: C1. FA, 06
        and     r10d, 3FH                               ; 0587 _ 41: 83. E2, 3F
        mov     r12d, dword [rbx+r10*4]                 ; 058B _ 46: 8B. 24 93
        and     r12d, 07H                               ; 058F _ 41: 83. E4, 07
        mov     rdx, qword [rsp+r12*8+160H]             ; 0593 _ 4A: 8B. 94 E4, 00000160
        test    qword [r11+rcx*8], rdx                  ; 059B _ 49: 85. 14 CB
        setne   r12b                                    ; 059F _ 41: 0F 95. C4
?_0403: test    r12b, r12b                              ; 05A3 _ 45: 84. E4
        jne     ?_0448                                  ; 05A6 _ 0F 85, 000008AB
?_0404: cmp     byte [rsp+77H], 0                       ; 05AC _ 80. 7C 24, 77, 00
        jne     ?_0442                                  ; 05B1 _ 0F 85, 000006D9
        xor     r8d, r8d                                ; 05B7 _ 45: 31. C0
?_0405: lea     r11d, [r8+rbp-1H]                       ; 05BA _ 45: 8D. 5C 28, FF
        mov     ecx, r13d                               ; 05BF _ 44: 89. E9
        xor     ecx, 01H                                ; 05C2 _ 83. F1, 01
        mov     dword [rsp+58H], r11d                   ; 05C5 _ 44: 89. 5C 24, 58
        cmp     r14b, cl                                ; 05CA _ 41: 38. CE
        jnc     ?_0425                                  ; 05CD _ 0F 83, 0000047D
        mov     r11d, r12d                              ; 05D3 _ 45: 89. E3
        xor     r11d, 01H                               ; 05D6 _ 41: 83. F3, 01
        cmp     byte [rsp+76H], r11b                    ; 05DA _ 44: 38. 5C 24, 76
        jnc     ?_0408                                  ; 05DF _ 0F 83, 00000096
        mov     r9d, eax                                ; 05E5 _ 41: 89. C1
        sar     r9d, 6                                  ; 05E8 _ 41: C1. F9, 06
        and     r9d, 3FH                                ; 05EC _ 41: 83. E1, 3F
        mov     r8d, dword [rbx+r9*4]                   ; 05F0 _ 46: 8B. 04 8B
        mov     ecx, r8d                                ; 05F4 _ 44: 89. C1
        and     ecx, 07H                                ; 05F7 _ 83. E1, 07
        cmp     ecx, 1                                  ; 05FA _ 83. F9, 01
        je      ?_0422                                  ; 05FD _ 0F 84, 000003AD
?_0406: cmp     dword [rsp+64H], -31743                 ; 0603 _ 81. 7C 24, 64, FFFF8401
        jl      ?_0408                                  ; 060B _ 7C, 6E
        cmp     ebp, 15                                 ; 060D _ 83. FD, 0F
        jg      ?_0407                                  ; 0610 _ 7F, 17
        mov     r9, qword [rsp+78H]                     ; 0612 _ 4C: 8B. 4C 24, 78
        cmp     esi, dword [r9]                         ; 0617 _ 41: 3B. 31
        jge     ?_0400                                  ; 061A _ 0F 8D, FFFFFEF0
        cmp     ebp, 4                                  ; 0620 _ 83. FD, 04
        jle     ?_0424                                  ; 0623 _ 0F 8E, 000003D7
?_0407: cmp     esi, 63                                 ; 0629 _ 83. FE, 3F
        mov     edx, 63                                 ; 062C _ BA, 0000003F
        mov     r10, qword [rsp+88H]                    ; 0631 _ 4C: 8B. 94 24, 00000088
        cmovle  edx, esi                                ; 0639 _ 0F 4E. D6
        mov     ecx, dword [rsp+58H]                    ; 063C _ 8B. 4C 24, 58
        movsxd  r9, edx                                 ; 0640 _ 4C: 63. CA
        sub     ecx, dword [r10+r9*4]                   ; 0643 _ 43: 2B. 0C 8A
        js      ?_0507                                  ; 0647 _ 0F 88, 00000FA4
        cmp     ecx, 6                                  ; 064D _ 83. F9, 06
        jg      ?_0408                                  ; 0650 _ 7F, 29
        imul    r8d, ecx, 200                           ; 0652 _ 44: 69. C1, 000000C8
        add     r8d, dword [rdi+1CH]                    ; 0659 _ 44: 03. 47, 1C
        add     r8d, 256                                ; 065D _ 41: 81. C0, 00000100
        cmp     dword [rsp+0DA0H], r8d                  ; 0664 _ 44: 39. 84 24, 00000DA0
        jge     ?_0466                                  ; 066C _ 0F 8D, 00000AF2
        cmp     ecx, 3                                  ; 0672 _ 83. F9, 03
        jle     ?_0423                                  ; 0675 _ 0F 8E, 00000365
?_0408: mov     edx, eax                                ; 067B _ 89. C2
        mov     rcx, rbx                                ; 067D _ 48: 89. D9
        call    _ZNK8Position9key_afterE4Move           ; 0680 _ E8, 00000000(rel)
        mov     rdx, qword [rel .refptr.TT]             ; 0685 _ 48: 8B. 15, 00000000(rel)
        mov     rcx, qword [rel .refptr.TT]             ; 068C _ 48: 8B. 0D, 00000000(rel)
        mov     r9, qword [rdx]                         ; 0693 _ 4C: 8B. 0A
        lea     r10, [r9-1H]                            ; 0696 _ 4D: 8D. 51, FF
        mov     qword [rsp+80H], r9                     ; 069A _ 4C: 89. 8C 24, 00000080
        and     rax, r10                                ; 06A2 _ 4C: 21. D0
        shl     rax, 5                                  ; 06A5 _ 48: C1. E0, 05
        add     rax, qword [rcx+8H]                     ; 06A9 _ 48: 03. 41, 08
        prefetcht0 [rax]                                ; 06AD _ 0F 18. 08
?_0409: mov     r8, qword [rsp+158H]                    ; 06B0 _ 4C: 8B. 84 24, 00000158
        mov     rcx, rbx                                ; 06B8 _ 48: 89. D9
        mov     edx, dword [rsp+0FCH]                   ; 06BB _ 8B. 94 24, 000000FC
        call    _ZNK8Position5legalE4Movey              ; 06C2 _ E8, 00000000(rel)
        test    al, al                                  ; 06C7 _ 84. C0
        je      ?_0459                                  ; 06C9 _ 0F 84, 000009D3
?_0410: mov     edx, dword [rsp+0FCH]                   ; 06CF _ 8B. 94 24, 000000FC
        movzx   r9d, r12b                               ; 06D6 _ 45: 0F B6. CC
        mov     rcx, rbx                                ; 06DA _ 48: 89. D9
        lea     r8, [rsp+100H]                          ; 06DD _ 4C: 8D. 84 24, 00000100
        mov     dword [rdi+0CH], edx                    ; 06E5 _ 89. 57, 0C
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 06E8 _ E8, 00000000(rel)
        cmp     ebp, 2                                  ; 06ED _ 83. FD, 02
        jle     ?_0418                                  ; 06F0 _ 0F 8E, 0000023A
        cmp     esi, 1                                  ; 06F6 _ 83. FE, 01
        setg    al                                      ; 06F9 _ 0F 9F. C0
        cmp     al, r13b                                ; 06FC _ 44: 38. E8
        jbe     ?_0418                                  ; 06FF _ 0F 86, 0000022B
        mov     r9d, dword [rsp+0FCH]                   ; 0705 _ 44: 8B. 8C 24, 000000FC
        cmp     esi, 63                                 ; 070D _ 83. FE, 3F
        mov     eax, 63                                 ; 0710 _ B8, 0000003F
        cmovle  eax, esi                                ; 0715 _ 0F 4E. C6
        mov     r11, qword [rsp+88H]                    ; 0718 _ 4C: 8B. 9C 24, 00000088
        mov     rcx, qword [rsp+98H]                    ; 0720 _ 48: 8B. 8C 24, 00000098
        cdqe                                            ; 0728 _ 48: 98
        mov     r10d, r9d                               ; 072A _ 45: 89. CA
        and     r10d, 3FH                               ; 072D _ 41: 83. E2, 3F
        mov     r8d, dword [r11+rax*4]                  ; 0731 _ 45: 8B. 04 83
        movsxd  rdx, r10d                               ; 0735 _ 49: 63. D2
        mov     r15d, dword [rbx+rdx*4]                 ; 0738 _ 44: 8B. 3C 93
        shl     rdx, 2                                  ; 073C _ 48: C1. E2, 02
        add     rcx, rdx                                ; 0740 _ 48: 01. D1
        mov     r11, r15                                ; 0743 _ 4D: 89. FB
        shl     r15, 8                                  ; 0746 _ 49: C1. E7, 08
        mov     ecx, dword [rcx+r15]                    ; 074A _ 42: 8B. 0C 39
        add     r15, qword [rsp+0A0H]                   ; 074E _ 4C: 03. BC 24, 000000A0
        mov     eax, dword [r15+rdx]                    ; 0756 _ 41: 8B. 04 17
        test    eax, eax                                ; 075A _ 85. C0
        jg      ?_0411                                  ; 075C _ 7F, 0C
        mov     edx, ecx                                ; 075E _ 89. CA
        shr     edx, 31                                 ; 0760 _ C1. EA, 1F
        cmp     dl, 1                                   ; 0763 _ 80. FA, 01
        sbb     r8d, -1                                 ; 0766 _ 41: 83. D8, FF
?_0411: add     ecx, eax                                ; 076A _ 01. C1
        mov     r15d, 1174378241                        ; 076C _ 41: BF, 45FF9701
        mov     eax, ecx                                ; 0772 _ 89. C8
        sar     ecx, 31                                 ; 0774 _ C1. F9, 1F
        imul    r15d                                    ; 0777 _ 41: F7. EF
        mov     r15d, r8d                               ; 077A _ 45: 89. C7
        sar     edx, 12                                 ; 077D _ C1. FA, 0C
        sub     edx, ecx                                ; 0780 _ 29. CA
        sub     r15d, edx                               ; 0782 _ 41: 29. D7
        test    r15d, r15d                              ; 0785 _ 45: 85. FF
        jle     ?_0443                                  ; 0788 _ 0F 8E, 000005A2
        mov     r8d, r9d                                ; 078E _ 45: 89. C8
        and     r8d, 0C000H                             ; 0791 _ 41: 81. E0, 0000C000
        mov     dword [rsp+60H], r8d                    ; 0798 _ 44: 89. 44 24, 60
        jne     ?_0489                                  ; 079D _ 0F 85, 00000CFD
        and     r11d, 07H                               ; 07A3 _ 41: 83. E3, 07
        cmp     r11d, 1                                 ; 07A7 _ 41: 83. FB, 01
        je      ?_0444                                  ; 07AB _ 0F 84, 0000058F
        mov     edx, r9d                                ; 07B1 _ 44: 89. CA
        shl     r10d, 6                                 ; 07B4 _ 41: C1. E2, 06
        mov     rcx, rbx                                ; 07B8 _ 48: 89. D9
        sar     edx, 6                                  ; 07BB _ C1. FA, 06
        and     edx, 3FH                                ; 07BE _ 83. E2, 3F
        or      edx, r10d                               ; 07C1 _ 44: 09. D2
        call    _ZNK8Position3seeE4Move                 ; 07C4 _ E8, 00000000(rel)
        test    eax, eax                                ; 07C9 _ 85. C0
        js      ?_0464                                  ; 07CB _ 0F 88, 00000965
        mov     byte [rsp+80H], 1                       ; 07D1 _ C6. 84 24, 00000080, 01
?_0412: mov     r10d, dword [rsp+58H]                   ; 07D9 _ 44: 8B. 54 24, 58
        mov     r11d, 1                                 ; 07DE _ 41: BB, 00000001
        mov     dword [rsp+28H], 1                      ; 07E4 _ C7. 44 24, 28, 00000001
        mov     ecx, dword [rsp+0DA0H]                  ; 07EC _ 8B. 8C 24, 00000DA0
        sub     r10d, r15d                              ; 07F3 _ 45: 29. FA
        lea     r15, [rdi+28H]                          ; 07F6 _ 4C: 8D. 7F, 28
        test    r10d, r10d                              ; 07FA _ 45: 85. D2
        cmovle  r10d, r11d                              ; 07FD _ 45: 0F 4E. D3
        neg     ecx                                     ; 0801 _ F7. D9
        mov     rdx, r15                                ; 0803 _ 4C: 89. FA
        mov     r9d, ecx                                ; 0806 _ 41: 89. C9
        lea     r8d, [rcx-1H]                           ; 0809 _ 44: 8D. 41, FF
        mov     dword [rsp+20H], r10d                   ; 080D _ 44: 89. 54 24, 20
        mov     rcx, rbx                                ; 0812 _ 48: 89. D9
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 0815 _ E8, 00001936
        neg     eax                                     ; 081A _ F7. D8
        cmp     dword [rsp+0DA0H], eax                  ; 081C _ 39. 84 24, 00000DA0
        mov     dword [rsp+60H], eax                    ; 0823 _ 89. 44 24, 60
        jge     ?_0419                                  ; 0827 _ 0F 8D, 00000110
        cmp     byte [rsp+80H], 0                       ; 082D _ 80. BC 24, 00000080, 00
        je      ?_0419                                  ; 0835 _ 0F 84, 00000102
?_0413: mov     eax, dword [rsp+0DA0H]                  ; 083B _ 8B. 84 24, 00000DA0
        mov     edx, dword [rsp+58H]                    ; 0842 _ 8B. 54 24, 58
        neg     eax                                     ; 0846 _ F7. D8
        test    edx, edx                                ; 0848 _ 85. D2
        jle     ?_0461                                  ; 084A _ 0F 8E, 00000878
        mov     r8d, dword [rsp+0C4H]                   ; 0850 _ 44: 8B. 84 24, 000000C4
        mov     rdx, r15                                ; 0858 _ 4C: 89. FA
        mov     rcx, rbx                                ; 085B _ 48: 89. D9
        mov     r9d, dword [rsp+58H]                    ; 085E _ 44: 8B. 4C 24, 58
        mov     dword [rsp+28H], r8d                    ; 0863 _ 44: 89. 44 24, 28
        lea     r8d, [rax-1H]                           ; 0868 _ 44: 8D. 40, FF
        mov     dword [rsp+20H], r9d                    ; 086C _ 44: 89. 4C 24, 20
        mov     r9d, eax                                ; 0871 _ 41: 89. C1
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 0874 _ E8, 000018D7
        neg     eax                                     ; 0879 _ F7. D8
        cmp     esi, 1                                  ; 087B _ 83. FE, 01
        mov     dword [rsp+60H], eax                    ; 087E _ 89. 44 24, 60
        je      ?_0508                                  ; 0882 _ 0F 84, 00000D6E
; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_0414: mov     r15d, dword [rsp+60H]                   ; 0890 _ 44: 8B. 7C 24, 60
        cmp     dword [rsp+0DA0H], r15d                 ; 0895 _ 44: 39. BC 24, 00000DA0
        jl      ?_0469                                  ; 089D _ 0F 8C, 00000903
?_0415: mov     edx, dword [rsp+0FCH]                   ; 08A3 _ 8B. 94 24, 000000FC
        mov     rcx, rbx                                ; 08AA _ 48: 89. D9
        call    _ZN8Position9undo_moveE4Move            ; 08AD _ E8, 00000000(rel)
        movzx   r12d, byte [rel _ZN6Search7SignalsE]    ; 08B2 _ 44: 0F B6. 25, 00000098(rel)
        test    r12b, r12b                              ; 08BA _ 45: 84. E4
        jne     .text.unlikely+0B57H                    ; 08BD _ 0F 85, 00000B57(rel)
        test    r14b, r14b                              ; 08C3 _ 45: 84. F6
        jne     ?_0458                                  ; 08C6 _ 0F 85, 0000078C
?_0416: mov     r8d, dword [rsp+64H]                    ; 08CC _ 44: 8B. 44 24, 64
        cmp     dword [rsp+60H], r8d                    ; 08D1 _ 44: 39. 44 24, 60
        jg      ?_0426                                  ; 08D6 _ 0F 8F, 000001B7
?_0417: test    r13b, r13b                              ; 08DC _ 45: 84. ED
        jne     ?_0400                                  ; 08DF _ 0F 85, FFFFFC2B
        mov     r12d, dword [rsp+0FCH]                  ; 08E5 _ 44: 8B. A4 24, 000000FC
        cmp     dword [rsp+94H], r12d                   ; 08ED _ 44: 39. A4 24, 00000094
        je      ?_0400                                  ; 08F5 _ 0F 84, FFFFFC15
        mov     r9d, dword [rsp+90H]                    ; 08FB _ 44: 8B. 8C 24, 00000090
        cmp     r9d, 63                                 ; 0903 _ 41: 83. F9, 3F
        jg      ?_0400                                  ; 0907 _ 0F 8F, FFFFFC03
        lea     edx, [r9+1H]                            ; 090D _ 41: 8D. 51, 01
        movsxd  r8, r9d                                 ; 0911 _ 4D: 63. C1
        mov     dword [rsp+r8*4+1B0H], r12d             ; 0914 _ 46: 89. A4 84, 000001B0
        mov     dword [rsp+90H], edx                    ; 091C _ 89. 94 24, 00000090
        jmp     ?_0400                                  ; 0923 _ E9, FFFFFBE8

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_0418: lea     r15, [rdi+28H]                          ; 0930 _ 4C: 8D. 7F, 28
        cmp     esi, 1                                  ; 0934 _ 83. FE, 01
        jg      ?_0413                                  ; 0937 _ 0F 8F, FFFFFEFE
?_0419: cmp     esi, 1                                  ; 093D _ 83. FE, 01
        jne     ?_0414                                  ; 0940 _ 0F 85, FFFFFF4A
?_0420: mov     r8d, dword [rsp+58H]                    ; 0946 _ 44: 8B. 44 24, 58
        lea     rdx, [rsp+2B0H]                         ; 094B _ 48: 8D. 94 24, 000002B0
        mov     dword [rsp+2B0H], 0                     ; 0953 _ C7. 84 24, 000002B0, 00000000
        mov     qword [rdi+28H], rdx                    ; 095E _ 48: 89. 57, 28
        lea     r15, [rdi+28H]                          ; 0962 _ 4C: 8D. 7F, 28
        test    r8d, r8d                                ; 0966 _ 45: 85. C0
        jle     ?_0470                                  ; 0969 _ 0F 8E, 0000087F
?_0421: mov     r9d, dword [rsp+58H]                    ; 096F _ 44: 8B. 4C 24, 58
        mov     dword [rsp+28H], 0                      ; 0974 _ C7. 44 24, 28, 00000000
        mov     rdx, r15                                ; 097C _ 4C: 89. FA
        mov     rcx, rbx                                ; 097F _ 48: 89. D9
        mov     r8d, dword [rsp+0DA8H]                  ; 0982 _ 44: 8B. 84 24, 00000DA8
        mov     dword [rsp+20H], r9d                    ; 098A _ 44: 89. 4C 24, 20
        mov     r9d, dword [rsp+0DA0H]                  ; 098F _ 44: 8B. 8C 24, 00000DA0
        neg     r8d                                     ; 0997 _ 41: F7. D8
        neg     r9d                                     ; 099A _ 41: F7. D9
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 099D _ E8, FFFFF65E
        neg     eax                                     ; 09A2 _ F7. D8
        mov     dword [rsp+60H], eax                    ; 09A4 _ 89. 44 24, 60
        jmp     ?_0415                                  ; 09A8 _ E9, FFFFFEF6

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_0422: mov     r11d, dword [rbx+3ACH]                  ; 09B0 _ 44: 8B. 9B, 000003AC
        mov     r10, r9                                 ; 09B7 _ 4D: 89. CA
        shr     r10, 3                                  ; 09BA _ 49: C1. EA, 03
        lea     edx, [r11*8]                            ; 09BE _ 42: 8D. 14 DD, 00000000
        sub     edx, r11d                               ; 09C6 _ 44: 29. DA
        xor     edx, r10d                               ; 09C9 _ 44: 31. D2
        cmp     edx, 3                                  ; 09CC _ 83. FA, 03
        jbe     ?_0406                                  ; 09CF _ 0F 86, FFFFFC2E
        jmp     ?_0408                                  ; 09D5 _ E9, FFFFFCA1

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_0423: mov     edx, eax                                ; 09E0 _ 89. C2
        mov     rcx, rbx                                ; 09E2 _ 48: 89. D9
        call    _ZNK8Position8see_signE4Move            ; 09E5 _ E8, 00000000(rel)
        test    eax, eax                                ; 09EA _ 85. C0
        js      ?_0400                                  ; 09EC _ 0F 88, FFFFFB1E
        mov     eax, dword [rsp+0FCH]                   ; 09F2 _ 8B. 84 24, 000000FC
        jmp     ?_0408                                  ; 09F9 _ E9, FFFFFC7D

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_0424: cmp     dword [rdi+14H], eax                    ; 0A00 _ 39. 47, 14
        je      ?_0407                                  ; 0A03 _ 0F 84, FFFFFC20
        mov     rcx, qword [rsp+98H]                    ; 0A09 _ 48: 8B. 8C 24, 00000098
        mov     r10d, eax                               ; 0A11 _ 41: 89. C2
        shl     r8, 8                                   ; 0A14 _ 49: C1. E0, 08
        and     r10d, 3FH                               ; 0A18 _ 41: 83. E2, 3F
        shl     r10, 2                                  ; 0A1C _ 49: C1. E2, 02
        add     rcx, r10                                ; 0A20 _ 4C: 01. D1
        mov     r11d, dword [rcx+r8]                    ; 0A23 _ 46: 8B. 1C 01
        test    r11d, r11d                              ; 0A27 _ 45: 85. DB
        jns     ?_0407                                  ; 0A2A _ 0F 89, FFFFFBF9
        add     r8, qword [rsp+0A0H]                    ; 0A30 _ 4C: 03. 84 24, 000000A0
        mov     r8d, dword [r8+r10]                     ; 0A38 _ 47: 8B. 04 10
        test    r8d, r8d                                ; 0A3C _ 45: 85. C0
        jns     ?_0407                                  ; 0A3F _ 0F 89, FFFFFBE4
        jmp     ?_0400                                  ; 0A45 _ E9, FFFFFAC6

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_0425: mov     edx, eax                                ; 0A50 _ 89. C2
        mov     rcx, rbx                                ; 0A52 _ 48: 89. D9
        call    _ZNK8Position9key_afterE4Move           ; 0A55 _ E8, 00000000(rel)
        mov     r8, qword [rel .refptr.TT]              ; 0A5A _ 4C: 8B. 05, 00000000(rel)
        mov     rdx, qword [rel .refptr.TT]             ; 0A61 _ 48: 8B. 15, 00000000(rel)
        mov     r9, qword [r8]                          ; 0A68 _ 4D: 8B. 08
        lea     r10, [r9-1H]                            ; 0A6B _ 4D: 8D. 51, FF
        mov     qword [rsp+80H], r9                     ; 0A6F _ 4C: 89. 8C 24, 00000080
        and     rax, r10                                ; 0A77 _ 4C: 21. D0
        shl     rax, 5                                  ; 0A7A _ 48: C1. E0, 05
        add     rax, qword [rdx+8H]                     ; 0A7E _ 48: 03. 42, 08
        test    r14b, r14b                              ; 0A82 _ 45: 84. F6
        prefetcht0 [rax]                                ; 0A85 _ 0F 18. 08
        je      ?_0409                                  ; 0A88 _ 0F 84, FFFFFC22
        jmp     ?_0410                                  ; 0A8E _ E9, FFFFFC3C

?_0426: mov     r9d, dword [rsp+60H]                    ; 0A93 _ 44: 8B. 4C 24, 60
        cmp     r9d, dword [rsp+0DA0H]                  ; 0A98 _ 44: 3B. 8C 24, 00000DA0
        mov     dword [rsp+64H], r9d                    ; 0AA0 _ 44: 89. 4C 24, 64
        jle     ?_0417                                  ; 0AA5 _ 0F 8E, FFFFFE31
?_0427: mov     rcx, qword [rel .refptr.Threads]        ; 0AAB _ 48: 8B. 0D, 00000000(rel)
        xor     edx, edx                                ; 0AB2 _ 31. D2
        call    _ZNKSt6vectorIP6ThreadSaIS1_EE14_M_range_checkEy; 0AB4 _ E8, 00000000(rel)
        mov     r12, qword [rel .refptr.Threads]        ; 0AB9 _ 4C: 8B. 25, 00000000(rel)
        mov     r11, qword [rsp+0B0H]                   ; 0AC0 _ 4C: 8B. 9C 24, 000000B0
        mov     r10, qword [r12]                        ; 0AC8 _ 4D: 8B. 14 24
        cmp     r11, qword [r10]                        ; 0ACC _ 4D: 3B. 1A
        jnz     ?_0428                                  ; 0ACF _ 75, 18
        mov     r15, qword [rbx+3B8H]                   ; 0AD1 _ 4C: 8B. BB, 000003B8
        mov     rcx, qword [r15+30H]                    ; 0AD8 _ 49: 8B. 4F, 30
        cmp     qword [rel ?_0184], rcx                 ; 0ADC _ 48: 39. 0D, 004000E8(rel)
        je      Unnamed_4_BD5                           ; 0AE3 _ 0F 84, 00000BD5(rel)
?_0428: mov     eax, dword [rsp+0FCH]                   ; 0AE9 _ 8B. 84 24, 000000FC
        test    r14b, r14b                              ; 0AF0 _ 45: 84. F6
        mov     dword [rsp+94H], eax                    ; 0AF3 _ 89. 84 24, 00000094
        jnz     ?_0431                                  ; 0AFA _ 75, 3A
        mov     r9, qword [rdi+28H]                     ; 0AFC _ 4C: 8B. 4F, 28
        mov     r12, qword [rdi]                        ; 0B00 _ 4C: 8B. 27
        test    r9, r9                                  ; 0B03 _ 4D: 85. C9
        lea     r10, [r12+4H]                           ; 0B06 _ 4D: 8D. 54 24, 04
        mov     dword [r12], eax                        ; 0B0B _ 41: 89. 04 24
        jz      ?_0430                                  ; 0B0F _ 74, 1E
        mov     r11d, dword [r9]                        ; 0B11 _ 45: 8B. 19
        test    r11d, r11d                              ; 0B14 _ 45: 85. DB
        jz      ?_0430                                  ; 0B17 _ 74, 16
?_0429: add     r10, 4                                  ; 0B19 _ 49: 83. C2, 04
        add     r9, 4                                   ; 0B1D _ 49: 83. C1, 04
        mov     dword [r10-4H], r11d                    ; 0B21 _ 45: 89. 5A, FC
        jz      ?_0430                                  ; 0B25 _ 74, 08
        mov     r11d, dword [r9]                        ; 0B27 _ 45: 8B. 19
        test    r11d, r11d                              ; 0B2A _ 45: 85. DB
        jnz     ?_0429                                  ; 0B2D _ 75, EA
?_0430: mov     dword [r10], 0                          ; 0B2F _ 41: C7. 02, 00000000
?_0431: mov     r15d, dword [rsp+60H]                   ; 0B36 _ 44: 8B. 7C 24, 60
        cmp     r15d, dword [rsp+0DA8H]                 ; 0B3B _ 44: 3B. BC 24, 00000DA8
        jl      ?_0462                                  ; 0B43 _ 0F 8C, 000005CD
?_0432: mov     r14d, dword [rsp+94H]                   ; 0B49 _ 44: 8B. B4 24, 00000094
        test    r14d, r14d                              ; 0B51 _ 45: 85. F6
        je      ?_0446                                  ; 0B54 _ 0F 84, 00000216
        and     r14d, 0C000H                            ; 0B5A _ 41: 81. E6, 0000C000
        jne     ?_0488                                  ; 0B61 _ 0F 85, 00000929
        mov     r10d, dword [rsp+94H]                   ; 0B67 _ 44: 8B. 94 24, 00000094
        and     r10d, 3FH                               ; 0B6F _ 41: 83. E2, 3F
        cmp     dword [rbx+r10*4], 0                    ; 0B73 _ 42: 83. 3C 93, 00
        setne   r11b                                    ; 0B78 _ 41: 0F 95. C3
?_0433: test    r11b, r11b                              ; 0B7C _ 45: 84. DB
        jnz     ?_0434                                  ; 0B7F _ 75, 30
        mov     r15d, dword [rsp+90H]                   ; 0B81 _ 44: 8B. BC 24, 00000090
        mov     r9d, ebp                                ; 0B89 _ 41: 89. E9
        mov     rdx, rdi                                ; 0B8C _ 48: 89. FA
        mov     rcx, rbx                                ; 0B8F _ 48: 89. D9
        mov     r8d, dword [rsp+94H]                    ; 0B92 _ 44: 8B. 84 24, 00000094
        lea     r14, [rsp+1B0H]                         ; 0B9A _ 4C: 8D. B4 24, 000001B0
        mov     qword [rsp+20H], r14                    ; 0BA2 _ 4C: 89. 74 24, 20
        mov     dword [rsp+28H], r15d                   ; 0BA7 _ 44: 89. 7C 24, 28
        call    _ZN12_GLOBAL__N_112update_statsERK8PositionPN6Search5StackE4Move5DepthPS6_i; 0BAC _ E8, 0000114F
?_0434: mov     rax, qword [rel .refptr.TT]             ; 0BB1 _ 48: 8B. 05, 00000000(rel)
        mov     esi, dword [rsp+60H]                    ; 0BB8 _ 8B. 74 24, 60
        cmp     esi, dword [rsp+0DA8H]                  ; 0BBC _ 3B. B4 24, 00000DA8
        mov     r9d, dword [rdi+1CH]                    ; 0BC3 _ 44: 8B. 4F, 1C
        movzx   r12d, byte [rax+18H]                    ; 0BC7 _ 44: 0F B6. 60, 18
        jge     ?_0463                                  ; 0BCC _ 0F 8D, 00000556
        mov     r8d, dword [rdi+8H]                     ; 0BD2 _ 44: 8B. 47, 08
?_0435: mov     ebx, 3                                  ; 0BD6 _ BB, 00000003
; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_0436: cmp     dword [rsp+60H], 31743                  ; 0BE0 _ 81. 7C 24, 60, 00007BFF
        jg      ?_0491                                  ; 0BE8 _ 0F 8F, 000008CE
        cmp     dword [rsp+60H], -31743                 ; 0BEE _ 81. 7C 24, 60, FFFF8401
        jl      ?_0490                                  ; 0BF6 _ 0F 8C, 000008B1
        mov     r8d, dword [rsp+60H]                    ; 0BFC _ 44: 8B. 44 24, 60
?_0437: mov     ecx, dword [rsp+94H]                    ; 0C01 _ 8B. 8C 24, 00000094
        mov     rdx, qword [rsp+0A8H]                   ; 0C08 _ 48: 8B. 94 24, 000000A8
        test    ecx, ecx                                ; 0C10 _ 85. C9
        movzx   r13d, word [rdx]                        ; 0C12 _ 44: 0F B7. 2A
        je      ?_0460                                  ; 0C16 _ 0F 84, 00000492
?_0438: mov     rax, qword [rsp+0B8H]                   ; 0C1C _ 48: 8B. 84 24, 000000B8
        mov     r11, qword [rsp+0A8H]                   ; 0C24 _ 4C: 8B. 9C 24, 000000A8
        movzx   r15d, word [rsp+94H]                    ; 0C2C _ 44: 0F B7. BC 24, 00000094
        shr     rax, 48                                 ; 0C35 _ 48: C1. E8, 30
        cmp     rax, r13                                ; 0C39 _ 4C: 39. E8
        mov     word [r11+2H], r15w                     ; 0C3C _ 66 45: 89. 7B, 02
        jnz     ?_0441                                  ; 0C41 _ 75, 24
?_0439: cmp     ebx, 3                                  ; 0C43 _ 83. FB, 03
        jz      ?_0440                                  ; 0C46 _ 74, 1C
        mov     r14, qword [rsp+0A8H]                   ; 0C48 _ 4C: 8B. B4 24, 000000A8
        mov     eax, dword [rsp+60H]                    ; 0C50 _ 8B. 44 24, 60
        movsx   esi, byte [r14+9H]                      ; 0C54 _ 41: 0F BE. 76, 09
        sub     esi, 1                                  ; 0C59 _ 83. EE, 01
        cmp     ebp, esi                                ; 0C5C _ 39. F5
        jl      ?_0395                                  ; 0C5E _ 0F 8C, FFFFF651
?_0440: mov     rax, r13                                ; 0C64 _ 4C: 89. E8
?_0441: mov     rdi, qword [rsp+0A8H]                   ; 0C67 _ 48: 8B. BC 24, 000000A8
        or      ebx, r12d                               ; 0C6F _ 44: 09. E3
        mov     word [rdi], ax                          ; 0C72 _ 66: 89. 07
        mov     eax, dword [rsp+60H]                    ; 0C75 _ 8B. 44 24, 60
        mov     word [rdi+4H], r8w                      ; 0C79 _ 66 44: 89. 47, 04
        mov     word [rdi+6H], r9w                      ; 0C7E _ 66 44: 89. 4F, 06
        mov     byte [rdi+8H], bl                       ; 0C83 _ 88. 5F, 08
        mov     byte [rdi+9H], bpl                      ; 0C86 _ 40: 88. 6F, 09
        jmp     ?_0395                                  ; 0C8A _ E9, FFFFF626

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_0442: mov     ecx, dword [rsp+0C0H]                   ; 0C90 _ 8B. 8C 24, 000000C0
        cmp     ecx, eax                                ; 0C97 _ 39. C1
        jne     ?_0476                                  ; 0C99 _ 0F 85, 00000676
        mov     r8, qword [rsp+158H]                    ; 0C9F _ 4C: 8B. 84 24, 00000158
        mov     edx, ecx                                ; 0CA7 _ 89. CA
        mov     rcx, rbx                                ; 0CA9 _ 48: 89. D9
        call    _ZNK8Position5legalE4Movey              ; 0CAC _ E8, 00000000(rel)
        test    al, al                                  ; 0CB1 _ 84. C0
        je      .text.unlikely+0B5EH                    ; 0CB3 _ 0F 84, 00000B5E(rel)
        mov     r9d, dword [rsp+0ECH]                   ; 0CB9 _ 44: 8B. 8C 24, 000000EC
        mov     byte [rdi+20H], 1                       ; 0CC1 _ C6. 47, 20, 01
        mov     rdx, rdi                                ; 0CC5 _ 48: 89. FA
        mov     rcx, rbx                                ; 0CC8 _ 48: 89. D9
        mov     eax, dword [rsp+0FCH]                   ; 0CCB _ 8B. 84 24, 000000FC
        mov     r10d, dword [rsp+0E8H]                  ; 0CD2 _ 44: 8B. 94 24, 000000E8
        mov     r8d, dword [rsp+0E4H]                   ; 0CDA _ 44: 8B. 84 24, 000000E4
        mov     dword [rdi+10H], eax                    ; 0CE2 _ 89. 47, 10
        mov     dword [rsp+28H], r9d                    ; 0CE5 _ 44: 89. 4C 24, 28
        mov     r9d, dword [rsp+0E0H]                   ; 0CEA _ 44: 8B. 8C 24, 000000E0
        mov     dword [rsp+20H], r10d                   ; 0CF2 _ 44: 89. 54 24, 20
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 0CF7 _ E8, 00001454
        mov     edx, dword [rsp+0E0H]                   ; 0CFC _ 8B. 94 24, 000000E0
        xor     r8d, r8d                                ; 0D03 _ 45: 31. C0
        mov     byte [rdi+20H], 0                       ; 0D06 _ C6. 47, 20, 00
        mov     dword [rsp+60H], eax                    ; 0D0A _ 89. 44 24, 60
        mov     dword [rdi+10H], 0                      ; 0D0E _ C7. 47, 10, 00000000
        cmp     eax, edx                                ; 0D15 _ 39. D0
        mov     eax, dword [rsp+0FCH]                   ; 0D17 _ 8B. 84 24, 000000FC
        setl    r8b                                     ; 0D1E _ 41: 0F 9C. C0
        jmp     ?_0405                                  ; 0D22 _ E9, FFFFF893

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_0443: mov     byte [rsp+80H], 0                       ; 0D30 _ C6. 84 24, 00000080, 00
        xor     r15d, r15d                              ; 0D38 _ 45: 31. FF
        jmp     ?_0412                                  ; 0D3B _ E9, FFFFFA99

?_0444: mov     byte [rsp+80H], 1                       ; 0D40 _ C6. 84 24, 00000080, 01
        jmp     ?_0412                                  ; 0D48 _ E9, FFFFFA8C

?_0445: mov     r14d, dword [rsp+0DA0H]                 ; 0D4D _ 44: 8B. B4 24, 00000DA0
        test    r15d, r15d                              ; 0D55 _ 45: 85. FF
        mov     dword [rsp+60H], r14d                   ; 0D58 _ 44: 89. 74 24, 60
        je      ?_0492                                  ; 0D5D _ 0F 84, 00000763
        mov     esi, dword [rsp+64H]                    ; 0D63 _ 8B. 74 24, 64
        mov     dword [rsp+60H], esi                    ; 0D67 _ 89. 74 24, 60
        jmp     ?_0432                                  ; 0D6B _ E9, FFFFFDD9

?_0446: cmp     ebp, 2                                  ; 0D70 _ 83. FD, 02
        jle     ?_0447                                  ; 0D73 _ 0F 8E, 000000AF
        cmp     byte [rsp+76H], 0                       ; 0D79 _ 80. 7C 24, 76, 00
        jne     ?_0447                                  ; 0D7E _ 0F 85, 000000A4
        mov     rsi, qword [rbx+3B8H]                   ; 0D84 _ 48: 8B. B3, 000003B8
        cmp     dword [rsi+40H], 0                      ; 0D8B _ 83. 7E, 40, 00
        jne     ?_0447                                  ; 0D8F _ 0F 85, 00000093
        mov     r13d, dword [rdi-1CH]                   ; 0D95 _ 44: 8B. 6F, E4
        mov     ecx, r13d                               ; 0D99 _ 44: 89. E9
        and     r13d, 3FH                               ; 0D9C _ 41: 83. E5, 3F
        sar     ecx, 6                                  ; 0DA0 _ C1. F9, 06
        and     ecx, 3FH                                ; 0DA3 _ 83. E1, 3F
        cmp     rcx, r13                                ; 0DA6 _ 4C: 39. E9
        jz      ?_0447                                  ; 0DA9 _ 74, 7D
        mov     edx, dword [rdi-44H]                    ; 0DAB _ 8B. 57, BC
        mov     eax, edx                                ; 0DAE _ 89. D0
        sar     edx, 6                                  ; 0DB0 _ C1. FA, 06
        and     eax, 3FH                                ; 0DB3 _ 83. E0, 3F
        and     edx, 3FH                                ; 0DB6 _ 83. E2, 3F
        cmp     rdx, rax                                ; 0DB9 _ 48: 39. C2
        jz      ?_0447                                  ; 0DBC _ 74, 6A
        mov     r9d, dword [rbx+rax*4]                  ; 0DBE _ 44: 8B. 0C 83
        mov     r8d, ebp                                ; 0DC2 _ 41: 89. E8
        shl     rax, 12                                 ; 0DC5 _ 48: C1. E0, 0C
        imul    r8d, ebp                                ; 0DC9 _ 44: 0F AF. C5
        mov     r10, qword [rsp+0D8H]                   ; 0DCD _ 4C: 8B. 94 24, 000000D8
        lea     rbx, [rel _ZN12_GLOBAL__N_118CounterMoveHistoryE]; 0DD5 _ 48: 8D. 1D, 000000C0(rel)
        lea     r12d, [rbp+r8-1H]                       ; 0DDC _ 46: 8D. 64 05, FF
        shl     r9, 18                                  ; 0DE1 _ 49: C1. E1, 12
        add     r9, rbx                                 ; 0DE5 _ 49: 01. D9
        mov     r11d, dword [r10]                       ; 0DE8 _ 45: 8B. 1A
        add     rax, r9                                 ; 0DEB _ 4C: 01. C8
        cmp     r12d, 323                               ; 0DEE _ 41: 81. FC, 00000143
        jg      ?_0447                                  ; 0DF5 _ 7F, 31
        mov     r15, qword [rsp+0D0H]                   ; 0DF7 _ 4C: 8B. BC 24, 000000D0
        shl     r11, 8                                  ; 0DFF _ 49: C1. E3, 08
        mov     esi, 512                                ; 0E03 _ BE, 00000200
        add     rax, r11                                ; 0E08 _ 4C: 01. D8
        add     r15, rax                                ; 0E0B _ 49: 01. C7
        mov     eax, r12d                               ; 0E0E _ 44: 89. E0
        shl     r12d, 6                                 ; 0E11 _ 41: C1. E4, 06
        mov     r14d, dword [r15]                       ; 0E15 _ 45: 8B. 37
        imul    eax, r14d                               ; 0E18 _ 41: 0F AF. C6
        cdq                                             ; 0E1C _ 99
        idiv    esi                                     ; 0E1D _ F7. FE
        sub     r14d, eax                               ; 0E1F _ 41: 29. C6
        add     r14d, r12d                              ; 0E22 _ 45: 01. E6
        mov     dword [r15], r14d                       ; 0E25 _ 45: 89. 37
?_0447: mov     r13, qword [rel .refptr.TT]             ; 0E28 _ 4C: 8B. 2D, 00000000(rel)
        mov     ecx, dword [rsp+60H]                    ; 0E2F _ 8B. 4C 24, 60
        cmp     ecx, dword [rsp+0DA8H]                  ; 0E33 _ 3B. 8C 24, 00000DA8
        mov     r9d, dword [rdi+1CH]                    ; 0E3A _ 44: 8B. 4F, 1C
        movzx   r12d, byte [r13+18H]                    ; 0E3E _ 45: 0F B6. 65, 18
        jge     ?_0465                                  ; 0E43 _ 0F 8D, 0000030D
        mov     ebx, 1                                  ; 0E49 _ BB, 00000001
        mov     r8d, dword [rdi+8H]                     ; 0E4E _ 44: 8B. 47, 08
        jmp     ?_0436                                  ; 0E52 _ E9, FFFFFD89

?_0448: mov     edx, eax                                ; 0E57 _ 89. C2
        mov     rcx, rbx                                ; 0E59 _ 48: 89. D9
        call    _ZNK8Position8see_signE4Move            ; 0E5C _ E8, 00000000(rel)
        test    eax, eax                                ; 0E61 _ 85. C0
        mov     eax, dword [rsp+0FCH]                   ; 0E63 _ 8B. 84 24, 000000FC
        js      ?_0404                                  ; 0E6A _ 0F 88, FFFFF73C
        mov     r8d, 1                                  ; 0E70 _ 41: B8, 00000001
        jmp     ?_0405                                  ; 0E76 _ E9, FFFFF73F

?_0449: mov     r8, qword [rsp+0B0H]                    ; 0E7B _ 4C: 8B. 84 24, 000000B0
        mov     rdx, qword [r8+0E0H]                    ; 0E83 _ 49: 8B. 90, 000000E0
        mov     r9, qword [r8+4C0H]                     ; 0E8A _ 4D: 8B. 88, 000004C0
        mov     r12, rdx                                ; 0E91 _ 49: 89. D4
        mov     qword [rsp+58H], rdx                    ; 0E94 _ 48: 89. 54 24, 58
        shl     r12, 5                                  ; 0E99 _ 49: C1. E4, 05
        add     r12, qword [r8+4B8H]                    ; 0E9D _ 4D: 03. A0, 000004B8
        cmp     r9, r12                                 ; 0EA4 _ 4D: 39. E1
        je      ?_0486                                  ; 0EA7 _ 0F 84, 000005CF
        lea     rcx, [r12+20H]                          ; 0EAD _ 49: 8D. 4C 24, 20
        mov     r11, qword [r12+8H]                     ; 0EB2 _ 4D: 8B. 5C 24, 08
        lea     r8, [r12+28H]                           ; 0EB7 _ 4D: 8D. 44 24, 28
        sub     r9, rcx                                 ; 0EBC _ 49: 29. C9
        and     r9, 0FFFFFFFFFFFFFFE0H                  ; 0EBF _ 49: 83. E1, E0
        lea     rsi, [r12+r9+28H]                       ; 0EC3 _ 4B: 8D. 74 0C, 28
        shr     r9, 5                                   ; 0EC8 _ 49: C1. E9, 05
        mov     r13, r9                                 ; 0ECC _ 4D: 89. CD
        and     r13d, 07H                               ; 0ECF _ 41: 83. E5, 07
        cmp     dword [r11], eax                        ; 0ED3 _ 41: 39. 03
        sete    r10b                                    ; 0ED6 _ 41: 0F 94. C2
        cmp     r8, rsi                                 ; 0EDA _ 49: 39. F0
        movzx   edx, r10b                               ; 0EDD _ 41: 0F B6. D2
        je      ?_0457                                  ; 0EE1 _ 0F 84, 00000160
        test    r13, r13                                ; 0EE7 _ 4D: 85. ED
        je      ?_0456                                  ; 0EEA _ 0F 84, 000000C0
        cmp     r13, 1                                  ; 0EF0 _ 49: 83. FD, 01
        je      ?_0455                                  ; 0EF4 _ 0F 84, 00000090
        cmp     r13, 2                                  ; 0EFA _ 49: 83. FD, 02
        jz      ?_0454                                  ; 0EFE _ 74, 78
        cmp     r13, 3                                  ; 0F00 _ 49: 83. FD, 03
        jz      ?_0453                                  ; 0F04 _ 74, 5F
        cmp     r13, 4                                  ; 0F06 _ 49: 83. FD, 04
        jz      ?_0452                                  ; 0F0A _ 74, 46
        cmp     r13, 5                                  ; 0F0C _ 49: 83. FD, 05
        jz      ?_0451                                  ; 0F10 _ 74, 2E
        cmp     r13, 6                                  ; 0F12 _ 49: 83. FD, 06
        jz      ?_0450                                  ; 0F16 _ 74, 15
        mov     r12, qword [r12+28H]                    ; 0F18 _ 4D: 8B. 64 24, 28
        lea     r9, [rdx+1H]                            ; 0F1D _ 4C: 8D. 4A, 01
        cmp     dword [r12], eax                        ; 0F21 _ 41: 39. 04 24
        cmove   rdx, r9                                 ; 0F25 _ 49: 0F 44. D1
        add     r8, 32                                  ; 0F29 _ 49: 83. C0, 20
?_0450: mov     r13, qword [r8]                         ; 0F2D _ 4D: 8B. 28
        lea     rcx, [rdx+1H]                           ; 0F30 _ 48: 8D. 4A, 01
        cmp     dword [r13], eax                        ; 0F34 _ 41: 39. 45, 00
        cmove   rdx, rcx                                ; 0F38 _ 48: 0F 44. D1
        add     r8, 32                                  ; 0F3C _ 49: 83. C0, 20
?_0451: mov     r10, qword [r8]                         ; 0F40 _ 4D: 8B. 10
        lea     r11, [rdx+1H]                           ; 0F43 _ 4C: 8D. 5A, 01
        cmp     dword [r10], eax                        ; 0F47 _ 41: 39. 02
        cmove   rdx, r11                                ; 0F4A _ 49: 0F 44. D3
        add     r8, 32                                  ; 0F4E _ 49: 83. C0, 20
?_0452: mov     r12, qword [r8]                         ; 0F52 _ 4D: 8B. 20
        lea     r9, [rdx+1H]                            ; 0F55 _ 4C: 8D. 4A, 01
        cmp     dword [r12], eax                        ; 0F59 _ 41: 39. 04 24
        cmove   rdx, r9                                 ; 0F5D _ 49: 0F 44. D1
        add     r8, 32                                  ; 0F61 _ 49: 83. C0, 20
?_0453: mov     r13, qword [r8]                         ; 0F65 _ 4D: 8B. 28
        lea     rcx, [rdx+1H]                           ; 0F68 _ 48: 8D. 4A, 01
        cmp     dword [r13], eax                        ; 0F6C _ 41: 39. 45, 00
        cmove   rdx, rcx                                ; 0F70 _ 48: 0F 44. D1
        add     r8, 32                                  ; 0F74 _ 49: 83. C0, 20
?_0454: mov     r10, qword [r8]                         ; 0F78 _ 4D: 8B. 10
        lea     r11, [rdx+1H]                           ; 0F7B _ 4C: 8D. 5A, 01
        cmp     dword [r10], eax                        ; 0F7F _ 41: 39. 02
        cmove   rdx, r11                                ; 0F82 _ 49: 0F 44. D3
        add     r8, 32                                  ; 0F86 _ 49: 83. C0, 20
?_0455: mov     r12, qword [r8]                         ; 0F8A _ 4D: 8B. 20
        lea     r9, [rdx+1H]                            ; 0F8D _ 4C: 8D. 4A, 01
        cmp     dword [r12], eax                        ; 0F91 _ 41: 39. 04 24
        cmove   rdx, r9                                 ; 0F95 _ 49: 0F 44. D1
        add     r8, 32                                  ; 0F99 _ 49: 83. C0, 20
        cmp     r8, rsi                                 ; 0F9D _ 49: 39. F0
        je      ?_0457                                  ; 0FA0 _ 0F 84, 000000A1
; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_0456: mov     r13, qword [r8]                         ; 0FB0 _ 4D: 8B. 28
        lea     rcx, [rdx+1H]                           ; 0FB3 _ 48: 8D. 4A, 01
        mov     r10, qword [r8+20H]                     ; 0FB7 _ 4D: 8B. 50, 20
        mov     r12, qword [r8+40H]                     ; 0FBB _ 4D: 8B. 60, 40
        cmp     dword [r13], eax                        ; 0FBF _ 41: 39. 45, 00
        mov     r13, qword [r8+60H]                     ; 0FC3 _ 4D: 8B. 68, 60
        cmove   rdx, rcx                                ; 0FC7 _ 48: 0F 44. D1
        cmp     dword [r10], eax                        ; 0FCB _ 41: 39. 02
        mov     r10, qword [r8+0A0H]                    ; 0FCE _ 4D: 8B. 90, 000000A0
        lea     r11, [rdx+1H]                           ; 0FD5 _ 4C: 8D. 5A, 01
        cmove   rdx, r11                                ; 0FD9 _ 49: 0F 44. D3
        cmp     dword [r12], eax                        ; 0FDD _ 41: 39. 04 24
        mov     r11, qword [r8+80H]                     ; 0FE1 _ 4D: 8B. 98, 00000080
        lea     r9, [rdx+1H]                            ; 0FE8 _ 4C: 8D. 4A, 01
        cmove   rdx, r9                                 ; 0FEC _ 49: 0F 44. D1
        cmp     dword [r13], eax                        ; 0FF0 _ 41: 39. 45, 00
        mov     r13, qword [r8+0C0H]                    ; 0FF4 _ 4D: 8B. A8, 000000C0
        lea     rcx, [rdx+1H]                           ; 0FFB _ 48: 8D. 4A, 01
        cmovne  rcx, rdx                                ; 0FFF _ 48: 0F 45. CA
        cmp     dword [r11], eax                        ; 1003 _ 41: 39. 03
        mov     r11, qword [r8+0E0H]                    ; 1006 _ 4D: 8B. 98, 000000E0
        lea     rdx, [rcx+1H]                           ; 100D _ 48: 8D. 51, 01
        cmove   rcx, rdx                                ; 1011 _ 48: 0F 44. CA
        cmp     dword [r10], eax                        ; 1015 _ 41: 39. 02
        lea     r9, [rcx+1H]                            ; 1018 _ 4C: 8D. 49, 01
        cmove   rcx, r9                                 ; 101C _ 49: 0F 44. C9
        cmp     dword [r13], eax                        ; 1020 _ 41: 39. 45, 00
        lea     r12, [rcx+1H]                           ; 1024 _ 4C: 8D. 61, 01
        cmove   rcx, r12                                ; 1028 _ 49: 0F 44. CC
        cmp     dword [r11], eax                        ; 102C _ 41: 39. 03
        lea     rdx, [rcx+1H]                           ; 102F _ 48: 8D. 51, 01
        cmovne  rdx, rcx                                ; 1033 _ 48: 0F 45. D1
        add     r8, 256                                 ; 1037 _ 49: 81. C0, 00000100
        cmp     r8, rsi                                 ; 103E _ 49: 39. F0
        jne     ?_0456                                  ; 1041 _ 0F 85, FFFFFF69
?_0457: test    rdx, rdx                                ; 1047 _ 48: 85. D2
        jne     ?_0402                                  ; 104A _ 0F 85, FFFFF4EB
        mov     esi, r15d                               ; 1050 _ 44: 89. FE
        jmp     ?_0400                                  ; 1053 _ E9, FFFFF4B8

?_0458: mov     r10, qword [rsp+0B0H]                   ; 1058 _ 4C: 8B. 94 24, 000000B0
        lea     r8, [rsp+0FCH]                          ; 1060 _ 4C: 8D. 84 24, 000000FC
        mov     rdx, qword [r10+4C0H]                   ; 1068 _ 49: 8B. 92, 000004C0
        mov     rcx, qword [r10+4B8H]                   ; 106F _ 49: 8B. 8A, 000004B8
        call    _ZSt4findIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEE4MoveET_SA_SA_RKT0_; 1076 _ E8, 00000000(rel)
        cmp     esi, 1                                  ; 107B _ 83. FE, 01
        je      ?_0481                                  ; 107E _ 0F 84, 00000338
        mov     r11d, dword [rsp+60H]                   ; 1084 _ 44: 8B. 5C 24, 60
        cmp     r11d, dword [rsp+0DA0H]                 ; 1089 _ 44: 3B. 9C 24, 00000DA0
        jg      ?_0481                                  ; 1091 _ 0F 8F, 00000325
        mov     dword [rax], -32001                     ; 1097 _ C7. 00, FFFF82FF
        jmp     ?_0416                                  ; 109D _ E9, FFFFF82A

?_0459: mov     dword [rdi+24H], r15d                   ; 10A2 _ 44: 89. 7F, 24
        mov     esi, r15d                               ; 10A6 _ 44: 89. FE
        jmp     ?_0400                                  ; 10A9 _ E9, FFFFF462

?_0460: mov     r10, qword [rsp+0B8H]                   ; 10AE _ 4C: 8B. 94 24, 000000B8
        shr     r10, 48                                 ; 10B6 _ 49: C1. EA, 30
        cmp     r10, r13                                ; 10BA _ 4D: 39. EA
        je      ?_0439                                  ; 10BD _ 0F 84, FFFFFB80
        jmp     ?_0438                                  ; 10C3 _ E9, FFFFFB54

?_0461: test    r12b, r12b                              ; 10C8 _ 45: 84. E4
        mov     dword [rsp+20H], 0                      ; 10CB _ C7. 44 24, 20, 00000000
        mov     r9d, eax                                ; 10D3 _ 41: 89. C1
        mov     rdx, r15                                ; 10D6 _ 4C: 89. FA
        lea     r8d, [rax-1H]                           ; 10D9 _ 44: 8D. 40, FF
        mov     rcx, rbx                                ; 10DD _ 48: 89. D9
        jne     ?_0473                                  ; 10E0 _ 0F 85, 00000155
        call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 10E6 _ E8, 00000535
        neg     eax                                     ; 10EB _ F7. D8
        cmp     esi, 1                                  ; 10ED _ 83. FE, 01
        mov     dword [rsp+60H], eax                    ; 10F0 _ 89. 44 24, 60
        jne     ?_0414                                  ; 10F4 _ 0F 85, FFFFF796
        lea     r10, [rsp+2B0H]                         ; 10FA _ 4C: 8D. 94 24, 000002B0
        mov     dword [rsp+2B0H], 0                     ; 1102 _ C7. 84 24, 000002B0, 00000000
        mov     qword [rdi+28H], r10                    ; 110D _ 4C: 89. 57, 28
        jmp     ?_0471                                  ; 1111 _ E9, 000000DD

?_0462: mov     dword [rsp+64H], r15d                   ; 1116 _ 44: 89. 7C 24, 64
        mov     dword [rsp+0DA0H], r15d                 ; 111B _ 44: 89. BC 24, 00000DA0
        jmp     ?_0417                                  ; 1123 _ E9, FFFFF7B4

?_0463: mov     ebx, 2                                  ; 1128 _ BB, 00000002
        mov     r8d, dword [rdi+8H]                     ; 112D _ 44: 8B. 47, 08
        jmp     ?_0436                                  ; 1131 _ E9, FFFFFAAA

?_0464: sub     r15d, 1                                 ; 1136 _ 41: 83. EF, 01
        mov     r9d, r15d                               ; 113A _ 45: 89. F9
        mov     r15d, dword [rsp+60H]                   ; 113D _ 44: 8B. 7C 24, 60
        cmovns  r15d, r9d                               ; 1142 _ 45: 0F 49. F9
        test    r15d, r15d                              ; 1146 _ 45: 85. FF
        setne   byte [rsp+80H]                          ; 1149 _ 0F 95. 84 24, 00000080
        jmp     ?_0412                                  ; 1151 _ E9, FFFFF683

?_0465: mov     ebx, 2                                  ; 1156 _ BB, 00000002
        mov     r8d, dword [rdi+8H]                     ; 115B _ 44: 8B. 47, 08
        jmp     ?_0436                                  ; 115F _ E9, FFFFFA7C

?_0466: mov     r15d, dword [rsp+64H]                   ; 1164 _ 44: 8B. 7C 24, 64
        cmp     r15d, r8d                               ; 1169 _ 45: 39. C7
        cmovge  r8d, r15d                               ; 116C _ 45: 0F 4D. C7
        mov     dword [rsp+64H], r8d                    ; 1170 _ 44: 89. 44 24, 64
        jmp     ?_0400                                  ; 1175 _ E9, FFFFF396

?_0467: cmp     r8d, 49152                              ; 117A _ 41: 81. F8, 0000C000
        setne   r13b                                    ; 1181 _ 41: 0F 95. C5
?_0468: mov     r8, qword [rsp+0C8H]                    ; 1185 _ 4C: 8B. 84 24, 000000C8
        mov     edx, eax                                ; 118D _ 89. C2
        mov     rcx, rbx                                ; 118F _ 48: 89. D9
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 1192 _ E8, 00000000(rel)
        mov     r12d, eax                               ; 1197 _ 41: 89. C4
        mov     eax, dword [rsp+0FCH]                   ; 119A _ 8B. 84 24, 000000FC
        jmp     ?_0403                                  ; 11A1 _ E9, FFFFF3FD

?_0469: test    r14b, r14b                              ; 11A6 _ 45: 84. F6
        jne     ?_0420                                  ; 11A9 _ 0F 85, FFFFF797
        cmp     r15d, dword [rsp+0DA8H]                 ; 11AF _ 44: 3B. BC 24, 00000DA8
        jl      ?_0420                                  ; 11B7 _ 0F 8C, FFFFF789
        mov     edx, dword [rsp+0FCH]                   ; 11BD _ 8B. 94 24, 000000FC
        mov     rcx, rbx                                ; 11C4 _ 48: 89. D9
        call    _ZN8Position9undo_moveE4Move            ; 11C7 _ E8, 00000000(rel)
        movzx   ecx, byte [rel _ZN6Search7SignalsE]     ; 11CC _ 0F B6. 0D, 00000098(rel)
        test    cl, cl                                  ; 11D3 _ 84. C9
        jne     .text.unlikely+0B57H                    ; 11D5 _ 0F 85, 00000B57(rel)
        mov     eax, dword [rsp+64H]                    ; 11DB _ 8B. 44 24, 64
        cmp     dword [rsp+60H], eax                    ; 11DF _ 39. 44 24, 60
        jle     ?_0417                                  ; 11E3 _ 0F 8E, FFFFF6F3
        jmp     ?_0427                                  ; 11E9 _ E9, FFFFF8BD

?_0470: test    r12b, r12b                              ; 11EE _ 45: 84. E4
        jnz     ?_0474                                  ; 11F1 _ 75, 73
?_0471: mov     r9d, dword [rsp+0DA0H]                  ; 11F3 _ 44: 8B. 8C 24, 00000DA0
        mov     dword [rsp+20H], 0                      ; 11FB _ C7. 44 24, 20, 00000000
        mov     rdx, r15                                ; 1203 _ 4C: 89. FA
        mov     rcx, rbx                                ; 1206 _ 48: 89. D9
        mov     r8d, dword [rsp+0DA8H]                  ; 1209 _ 44: 8B. 84 24, 00000DA8
        neg     r9d                                     ; 1211 _ 41: F7. D9
        neg     r8d                                     ; 1214 _ 41: F7. D8
        call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 1217 _ E8, 00000B20(rel)
        neg     eax                                     ; 121C _ F7. D8
        mov     dword [rsp+60H], eax                    ; 121E _ 89. 44 24, 60
        jmp     ?_0415                                  ; 1222 _ E9, FFFFF67C

?_0472: mov     dword [rdi+1CH], 32002                  ; 1227 _ C7. 47, 1C, 00007D02
        mov     dword [rsp+0C0H], r15d                  ; 122E _ 44: 89. BC 24, 000000C0
        jmp     ?_0398                                  ; 1236 _ E9, FFFFF0A4

?_0473: call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 123B _ E8, 000025D0
        neg     eax                                     ; 1240 _ F7. D8
        cmp     esi, 1                                  ; 1242 _ 83. FE, 01
        mov     dword [rsp+60H], eax                    ; 1245 _ 89. 44 24, 60
        jne     ?_0414                                  ; 1249 _ 0F 85, FFFFF641
        lea     r11, [rsp+2B0H]                         ; 124F _ 4C: 8D. 9C 24, 000002B0
        mov     dword [rsp+2B0H], 0                     ; 1257 _ C7. 84 24, 000002B0, 00000000
        mov     qword [rdi+28H], r11                    ; 1262 _ 4C: 89. 5F, 28
?_0474: mov     r9d, dword [rsp+0DA0H]                  ; 1266 _ 44: 8B. 8C 24, 00000DA0
        mov     dword [rsp+20H], 0                      ; 126E _ C7. 44 24, 20, 00000000
        mov     rdx, r15                                ; 1276 _ 4C: 89. FA
        mov     rcx, rbx                                ; 1279 _ 48: 89. D9
        mov     r8d, dword [rsp+0DA8H]                  ; 127C _ 44: 8B. 84 24, 00000DA8
        neg     r9d                                     ; 1284 _ 41: F7. D9
        neg     r8d                                     ; 1287 _ 41: F7. D8
        call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE1ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 128A _ E8, 00001D60(rel)
        neg     eax                                     ; 128F _ F7. D8
        mov     dword [rsp+60H], eax                    ; 1291 _ 89. 44 24, 60
        jmp     ?_0415                                  ; 1295 _ E9, FFFFF609

?_0475: lea     r15d, [rbp-2H]                          ; 129A _ 44: 8D. 7D, FE
        mov     byte [rdi+20H], 1                       ; 129E _ C6. 47, 20, 01
        mov     rdx, rdi                                ; 12A2 _ 48: 89. FA
        mov     rcx, rbx                                ; 12A5 _ 48: 89. D9
        mov     r9d, dword [rsp+0DA8H]                  ; 12A8 _ 44: 8B. 8C 24, 00000DA8
        mov     dword [rsp+28H], 1                      ; 12B0 _ C7. 44 24, 28, 00000001
        mov     r8d, dword [rsp+0DA0H]                  ; 12B8 _ 44: 8B. 84 24, 00000DA0
        mov     dword [rsp+20H], r15d                   ; 12C0 _ 44: 89. 7C 24, 20
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 12C5 _ E8, FFFFED36
        mov     rdx, qword [rsp+0B8H]                   ; 12CA _ 48: 8B. 94 24, 000000B8
        mov     byte [rdi+20H], 0                       ; 12D2 _ C6. 47, 20, 00
        mov     r8, rsi                                 ; 12D6 _ 49: 89. F0
        mov     rcx, qword [rel .refptr.TT]             ; 12D9 _ 48: 8B. 0D, 00000000(rel)
        call    _ZNK18TranspositionTable5probeEyRb      ; 12E0 _ E8, 00000000(rel)
        cmp     byte [rsp+0FBH], 0                      ; 12E5 _ 80. BC 24, 000000FB, 00
        mov     qword [rsp+0A8H], rax                   ; 12ED _ 48: 89. 84 24, 000000A8
        je      Unnamed_4_BB4                           ; 12F5 _ 0F 84, 00000BB4(rel)
        mov     rsi, qword [rsp+0A8H]                   ; 12FB _ 48: 8B. B4 24, 000000A8
        movzx   r11d, word [rsi+2H]                     ; 1303 _ 44: 0F B7. 5E, 02
        mov     dword [rsp+0C0H], r11d                  ; 1308 _ 44: 89. 9C 24, 000000C0
        jmp     ?_0398                                  ; 1310 _ E9, FFFFEFCA

?_0476: xor     r8d, r8d                                ; 1315 _ 45: 31. C0
        jmp     ?_0405                                  ; 1318 _ E9, FFFFF29D

?_0477: test    r14b, r14b                              ; 131D _ 45: 84. F6
        mov     r13d, 32002                             ; 1320 _ 41: BD, 00007D02
        jne     ?_0485                                  ; 1326 _ 0F 85, 00000125
        xor     r15d, r15d                              ; 132C _ 45: 31. FF
        jmp     ?_0391                                  ; 132F _ E9, FFFFEEC8

?_0478: cmp     dword [rdi-1CH], 65                     ; 1334 _ 83. 7F, E4, 41
        je      Unnamed_4_BA7                           ; 1338 _ 0F 84, 00000BA7(rel)
        mov     rcx, rbx                                ; 133E _ 48: 89. D9
        call    _ZN4Eval8evaluateERK8Position           ; 1341 _ E8, 00000000(rel)
        mov     ecx, eax                                ; 1346 _ 89. C1
        mov     r11, qword [rsp+0A8H]                   ; 1348 _ 4C: 8B. 9C 24, 000000A8
        mov     dword [rdi+1CH], ecx                    ; 1350 _ 89. 4F, 1C
        mov     rdx, qword [rsp+0B8H]                   ; 1353 _ 48: 8B. 94 24, 000000B8
        mov     r9, qword [rel .refptr.TT]              ; 135B _ 4C: 8B. 0D, 00000000(rel)
        movzx   eax, word [r11]                         ; 1362 _ 41: 0F B7. 03
        shr     rdx, 48                                 ; 1366 _ 48: C1. EA, 30
        movzx   r10d, byte [r9+18H]                     ; 136A _ 45: 0F B6. 51, 18
        cmp     rdx, rax                                ; 136F _ 48: 39. C2
        je      Unnamed_4_B8F                           ; 1372 _ 0F 84, 00000B8F(rel)
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [r11+2H], 0                        ; 1378 _ 66 41: C7. 43, 02, 0000
        mov     r9, qword [rsp+0A8H]                    ; 137F _ 4C: 8B. 8C 24, 000000A8
        mov     word [r9], dx                           ; 1387 _ 66 41: 89. 11
; Note: Length-changing prefix causes delay on Intel processors
        mov     word [r9+4H], 32002                     ; 138B _ 66 41: C7. 41, 04, 7D02
        mov     word [r9+6H], cx                        ; 1392 _ 66 41: 89. 49, 06
        mov     byte [r9+8H], r10b                      ; 1397 _ 45: 88. 51, 08
        mov     byte [r9+9H], -6                        ; 139B _ 41: C6. 41, 09, FA
        jmp     ?_0394                                  ; 13A0 _ E9, FFFFEEC3

?_0479: mov     byte [rsp+77H], 0                       ; 13A5 _ C6. 44 24, 77, 00
        jmp     ?_0399                                  ; 13AA _ E9, FFFFF0A2

?_0480: mov     dword [rsp+0C0H], r15d                  ; 13AF _ 44: 89. BC 24, 000000C0
        jmp     ?_0398                                  ; 13B7 _ E9, FFFFEF23

?_0481: mov     rcx, qword [rax+8H]                     ; 13BC _ 48: 8B. 48, 08
        lea     r12, [rax+8H]                           ; 13C0 _ 4C: 8D. 60, 08
        mov     rdx, qword [rax+10H]                    ; 13C4 _ 48: 8B. 50, 10
        mov     r15d, dword [rsp+60H]                   ; 13C8 _ 44: 8B. 7C 24, 60
        sub     rdx, rcx                                ; 13CD _ 48: 29. CA
        sar     rdx, 2                                  ; 13D0 _ 48: C1. FA, 02
        mov     dword [rax], r15d                       ; 13D4 _ 44: 89. 38
        test    rdx, rdx                                ; 13D7 _ 48: 85. D2
        je      Unnamed_4_B7D                           ; 13DA _ 0F 84, 00000B7D(rel)
        cmp     rdx, 1                                  ; 13E0 _ 48: 83. FA, 01
        jbe     ?_0482                                  ; 13E4 _ 76, 08
        add     rcx, 4                                  ; 13E6 _ 48: 83. C1, 04
        mov     qword [rax+10H], rcx                    ; 13EA _ 48: 89. 48, 10
?_0482: mov     r15, qword [rdi+28H]                    ; 13EE _ 4C: 8B. 7F, 28
?_0483: cmp     dword [r15], 0                          ; 13F2 _ 41: 83. 3F, 00
        jz      ?_0484                                  ; 13F6 _ 74, 11
        mov     rdx, r15                                ; 13F8 _ 4C: 89. FA
        mov     rcx, r12                                ; 13FB _ 4C: 89. E1
        add     r15, 4                                  ; 13FE _ 49: 83. C7, 04
        call    _ZNSt6vectorI4MoveSaIS0_EE9push_backERKS0_; 1402 _ E8, 00000000(rel)
        jmp     ?_0483                                  ; 1407 _ EB, E9

?_0484: cmp     esi, 1                                  ; 1409 _ 83. FE, 01
        je      ?_0416                                  ; 140C _ 0F 84, FFFFF4BA
        mov     rcx, qword [rel .refptr.Threads]        ; 1412 _ 48: 8B. 0D, 00000000(rel)
        call    _ZN10ThreadPool4mainEv                  ; 1419 _ E8, 00000000(rel)
        cmp     qword [rsp+0B0H], rax                   ; 141E _ 48: 39. 84 24, 000000B0
        jne     ?_0416                                  ; 1426 _ 0F 85, FFFFF4A0
        mov     rax, qword [rsp+0B0H]                   ; 142C _ 48: 8B. 84 24, 000000B0
        movsd   xmm0, qword [rel ?_0364]                ; 1434 _ F2: 0F 10. 05, 000003A0(rel)
        addsd   xmm0, qword [rax+24E0H]                 ; 143C _ F2: 0F 58. 80, 000024E0
        movsd   qword [rax+24E0H], xmm0                 ; 1444 _ F2: 0F 11. 80, 000024E0
        jmp     ?_0416                                  ; 144C _ E9, FFFFF47B

?_0485: mov     rdx, qword [rsp+0B0H]                   ; 1451 _ 48: 8B. 94 24, 000000B0
        mov     r8, qword [rdx+0E0H]                    ; 1459 _ 4C: 8B. 82, 000000E0
        mov     qword [rsp+58H], r8                     ; 1460 _ 4C: 89. 44 24, 58
        shl     r8, 5                                   ; 1465 _ 49: C1. E0, 05
        add     r8, qword [rdx+4B8H]                    ; 1469 _ 4C: 03. 82, 000004B8
        mov     r15, qword [r8+8H]                      ; 1470 _ 4D: 8B. 78, 08
        mov     r15d, dword [r15]                       ; 1474 _ 45: 8B. 3F
        jmp     ?_0392                                  ; 1477 _ E9, FFFFED90

?_0486: mov     esi, r15d                               ; 147C _ 44: 89. FE
        jmp     ?_0400                                  ; 147F _ E9, FFFFF08C

?_0487: mov     dword [rsi+0E8H], r10d                  ; 1484 _ 44: 89. 96, 000000E8
        jmp     ?_0388                                  ; 148B _ E9, FFFFEC2C

?_0488: cmp     r14d, 49152                             ; 1490 _ 41: 81. FE, 0000C000
        setne   r11b                                    ; 1497 _ 41: 0F 95. C3
        jmp     ?_0433                                  ; 149B _ E9, FFFFF6DC

?_0489: mov     byte [rsp+80H], 1                       ; 14A0 _ C6. 84 24, 00000080, 01
        jmp     ?_0412                                  ; 14A8 _ E9, FFFFF32C

?_0490: mov     edi, dword [rsp+60H]                    ; 14AD _ 8B. 7C 24, 60
        sub     edi, r8d                                ; 14B1 _ 44: 29. C7
        mov     r8d, edi                                ; 14B4 _ 41: 89. F8
        jmp     ?_0437                                  ; 14B7 _ E9, FFFFF745

?_0491: add     r8d, dword [rsp+60H]                    ; 14BC _ 44: 03. 44 24, 60
        jmp     ?_0437                                  ; 14C1 _ E9, FFFFF73B

?_0492: cmp     dword [rsp+70H], 0                      ; 14C6 _ 83. 7C 24, 70, 00
        jne     _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb.cold.203; 14CB _ 0F 85, 00000A14(rel)
        cmp     byte [rsp+76H], 0                       ; 14D1 _ 80. 7C 24, 76, 00
        je      ?_0503                                  ; 14D6 _ 0F 84, 000000DE
        mov     r8d, dword [rdi+8H]                     ; 14DC _ 44: 8B. 47, 08
        lea     r15d, [r8-7D00H]                        ; 14E0 _ 45: 8D. B8, FFFF8300
        mov     dword [rsp+60H], r15d                   ; 14E7 _ 44: 89. 7C 24, 60
?_0493: mov     r10, qword [rel .refptr.TT]             ; 14EC _ 4C: 8B. 15, 00000000(rel)
        mov     ebx, 2                                  ; 14F3 _ BB, 00000002
        mov     r9d, dword [rdi+1CH]                    ; 14F8 _ 44: 8B. 4F, 1C
        mov     edi, dword [rsp+60H]                    ; 14FC _ 8B. 7C 24, 60
        cmp     edi, dword [rsp+0DA8H]                  ; 1500 _ 3B. BC 24, 00000DA8
        movzx   r12d, byte [r10+18H]                    ; 1507 _ 45: 0F B6. 62, 18
        jge     ?_0436                                  ; 150C _ 0F 8D, FFFFF6CE
        cmp     dword [rsp+94H], 0                      ; 1512 _ 83. BC 24, 00000094, 00
        mov     ebx, 1                                  ; 151A _ BB, 00000001
        je      ?_0436                                  ; 151F _ 0F 84, FFFFF6BB
        jmp     ?_0435                                  ; 1525 _ E9, FFFFF6AC

?_0494: cmp     dword [rdi+8H], 127                     ; 152A _ 83. 7F, 08, 7F
        jle     ?_0495                                  ; 152E _ 7E, 0B
        cmp     byte [rsp+76H], 0                       ; 1530 _ 80. 7C 24, 76, 00
        je      ?_0505                                  ; 1535 _ 0F 84, 000000A4
?_0495: mov     ebp, dword [rbx+3ACH]                   ; 153B _ 8B. AB, 000003AC
        lea     rbx, [rel _ZN12_GLOBAL__N_19DrawValueE] ; 1541 _ 48: 8D. 1D, 004000C0(rel)
        mov     eax, dword [rbx+rbp*4]                  ; 1548 _ 8B. 04 AB
        jmp     ?_0395                                  ; 154B _ E9, FFFFED65

?_0496: add     r13d, edx                               ; 1550 _ 41: 01. D5
        jmp     ?_0390                                  ; 1553 _ E9, FFFFEC8E

?_0497: mov     rax, qword [rel .refptr.Threads]        ; 1558 _ 48: 8B. 05, 00000000(rel)
        mov     r13, qword [rax+8H]                     ; 155F _ 4C: 8B. 68, 08
        mov     r11, qword [rax]                        ; 1563 _ 4C: 8B. 18
?_0498: cmp     r13, r11                                ; 1566 _ 4D: 39. DD
        jnz     ?_0500                                  ; 1569 _ 75, 24
        call    _ZN12_GLOBAL__N_110check_timeEv         ; 156B _ E8, 000021E0(rel)
        mov     r10d, dword [rdi+8H]                    ; 1570 _ 44: 8B. 57, 08
        jmp     ?_0387                                  ; 1574 _ E9, FFFFEB2E

?_0499: mov     byte [rsi+24D8H], 0                     ; 1579 _ C6. 86, 000024D8, 00
        mov     dword [rsi+0ECH], 1                     ; 1580 _ C7. 86, 000000EC, 00000001
        jmp     ?_0387                                  ; 158A _ E9, FFFFEB18

?_0500: mov     r15, qword [r11]                        ; 158F _ 4D: 8B. 3B
        add     r11, 8                                  ; 1592 _ 49: 83. C3, 08
        mov     byte [r15+24D8H], 1                     ; 1596 _ 41: C6. 87, 000024D8, 01
        jmp     ?_0498                                  ; 159E _ EB, C6

?_0501: sub     r13d, edx                               ; 15A0 _ 41: 29. D5
        jmp     ?_0390                                  ; 15A3 _ E9, FFFFEC3E

?_0502: mov     rcx, rbx                                ; 15A8 _ 48: 89. D9
        call    _ZN4Eval8evaluateERK8Position           ; 15AB _ E8, 00000000(rel)
        mov     ecx, eax                                ; 15B0 _ 89. C1
        mov     dword [rdi+1CH], eax                    ; 15B2 _ 89. 47, 1C
        jmp     ?_0393                                  ; 15B5 _ E9, FFFFEC86

?_0503: mov     ebx, dword [rbx+3ACH]                   ; 15BA _ 8B. 9B, 000003AC
        lea     r13, [rel _ZN12_GLOBAL__N_19DrawValueE] ; 15C0 _ 4C: 8D. 2D, 004000C0(rel)
        mov     r8d, dword [rdi+8H]                     ; 15C7 _ 44: 8B. 47, 08
        mov     r11d, dword [r13+rbx*4]                 ; 15CB _ 45: 8B. 5C 9D, 00
        mov     dword [rsp+60H], r11d                   ; 15D0 _ 44: 89. 5C 24, 60
        jmp     ?_0493                                  ; 15D5 _ E9, FFFFFF12

?_0504: jmp     Unnamed_4_A1D                           ; 15DA _ E9, 00000A1D(rel)

?_0505: mov     rcx, rbx                                ; 15DF _ 48: 89. D9
        call    _ZN4Eval8evaluateERK8Position           ; 15E2 _ E8, 00000000(rel)
        jmp     ?_0395                                  ; 15E7 _ E9, FFFFECC9

?_0506: jmp     Unnamed_4_BC9                           ; 15EC _ E9, 00000BC9(rel)

?_0507: jmp     Unnamed_4_C45                           ; 15F1 _ E9, 00000C45(rel)

?_0508: ; Local function
        lea     r12, [rsp+2B0H]                         ; 15F6 _ 4C: 8D. A4 24, 000002B0
        mov     dword [rsp+2B0H], 0                     ; 15FE _ C7. 84 24, 000002B0, 00000000
        mov     qword [rdi+28H], r12                    ; 1609 _ 4C: 89. 67, 28
        jmp     ?_0421                                  ; 160D _ E9, FFFFF35D

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH
;       db 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth:; Local function
        push    r15                                     ; 1620 _ 41: 57
        push    r14                                     ; 1622 _ 41: 56
        push    r13                                     ; 1624 _ 41: 55
        push    r12                                     ; 1626 _ 41: 54
        push    rbp                                     ; 1628 _ 55
        push    rdi                                     ; 1629 _ 57
        push    rsi                                     ; 162A _ 56
        push    rbx                                     ; 162B _ 53
        sub     rsp, 2488                               ; 162C _ 48: 81. EC, 000009B8
        mov     eax, dword [rdx-20H]                    ; 1633 _ 8B. 42, E0
        mov     r13d, dword [rsp+0A20H]                 ; 1636 _ 44: 8B. AC 24, 00000A20
        add     eax, 1                                  ; 163E _ 83. C0, 01
        mov     dword [rdx+0CH], 0                      ; 1641 _ C7. 42, 0C, 00000000
        mov     rbx, rcx                                ; 1648 _ 48: 89. CB
        mov     rdi, rdx                                ; 164B _ 48: 89. D7
        mov     dword [rdx+8H], eax                     ; 164E _ 89. 42, 08
        mov     r15d, r8d                               ; 1651 _ 45: 89. C7
        mov     r14d, r9d                               ; 1654 _ 45: 89. CE
        call    _ZNK8Position7is_drawEv                 ; 1657 _ E8, 00000000(rel)
        test    al, al                                  ; 165C _ 84. C0
        jne     ?_0549                                  ; 165E _ 0F 85, 0000061D
        cmp     dword [rdi+8H], 127                     ; 1664 _ 83. 7F, 08, 7F
        jg      Unnamed_4_CDB                           ; 1668 _ 0F 8F, 00000CDB(rel)
        mov     rcx, qword [rbx+3B8H]                   ; 166E _ 48: 8B. 8B, 000003B8
        lea     r8, [rsp+7FH]                           ; 1675 _ 4C: 8D. 44 24, 7F
        mov     edx, r13d                               ; 167A _ 44: 89. EA
        sar     edx, 31                                 ; 167D _ C1. FA, 1F
        mov     dword [rsp+50H], edx                    ; 1680 _ 89. 54 24, 50
        mov     rsi, qword [rcx+30H]                    ; 1684 _ 48: 8B. 71, 30
        mov     rcx, qword [rel .refptr.TT]             ; 1688 _ 48: 8B. 0D, 00000000(rel)
        mov     rdx, rsi                                ; 168F _ 48: 89. F2
        mov     qword [rsp+40H], rsi                    ; 1692 _ 48: 89. 74 24, 40
        call    _ZNK18TranspositionTable5probeEyRb      ; 1697 _ E8, 00000000(rel)
        cmp     byte [rsp+7FH], 0                       ; 169C _ 80. 7C 24, 7F, 00
        mov     rbp, rax                                ; 16A1 _ 48: 89. C5
        jne     ?_0529                                  ; 16A4 _ 0F 85, 000003E6
        cmp     dword [rdi-1CH], 65                     ; 16AA _ 83. 7F, E4, 41
        je      ?_0539                                  ; 16AE _ 0F 84, 000004DC
        mov     rcx, rbx                                ; 16B4 _ 48: 89. D9
        call    _ZN4Eval8evaluateERK8Position           ; 16B7 _ E8, 00000000(rel)
        mov     esi, eax                                ; 16BC _ 89. C6
?_0509: mov     dword [rdi+1CH], esi                    ; 16BE _ 89. 77, 1C
        mov     r11d, esi                               ; 16C1 _ 41: 89. F3
        xor     r8d, r8d                                ; 16C4 _ 45: 31. C0
?_0510: cmp     r14d, esi                               ; 16C7 _ 41: 39. F6
        jle     ?_0527                                  ; 16CA _ 0F 8E, 00000340
        mov     r9d, dword [rdi-1CH]                    ; 16D0 _ 44: 8B. 4F, E4
        lea     rdx, [rsp+130H]                         ; 16D4 _ 48: 8D. 94 24, 00000130
        neg     r14d                                    ; 16DC _ 41: F7. DE
        mov     qword [rsp+38H], rdx                    ; 16DF _ 48: 89. 54 24, 38
        lea     r12d, [rsi+80H]                         ; 16E4 _ 44: 8D. A6, 00000080
        mov     rcx, rdx                                ; 16EB _ 48: 89. D1
        mov     rdx, rbx                                ; 16EE _ 48: 89. DA
        and     r9d, 3FH                                ; 16F1 _ 41: 83. E1, 3F
        mov     qword [rsp+28H], r9                     ; 16F5 _ 4C: 89. 4C 24, 28
        mov     r11, qword [rbx+3B0H]                   ; 16FA _ 4C: 8B. 9B, 000003B0
        mov     r9d, r13d                               ; 1701 _ 45: 89. E9
        add     r11, 1236                               ; 1704 _ 49: 81. C3, 000004D4
        mov     qword [rsp+20H], r11                    ; 170B _ 4C: 89. 5C 24, 20
        call    _ZN10MovePickerC1ERK8Position4Move5DepthRK5StatsI5ValueLb0EE6Square; 1710 _ E8, 00000000(rel)
        lea     r8, [rsp+0D0H]                          ; 1715 _ 4C: 8D. 84 24, 000000D0
        mov     rdx, rbx                                ; 171D _ 48: 89. DA
        mov     rcx, r8                                 ; 1720 _ 4C: 89. C1
        mov     qword [rsp+68H], r8                     ; 1723 _ 4C: 89. 44 24, 68
        call    _ZN9CheckInfoC1ERK8Position             ; 1728 _ E8, 00000000(rel)
        mov     r10d, r15d                              ; 172D _ 45: 89. FA
        mov     dword [rsp+58H], r14d                   ; 1730 _ 44: 89. 74 24, 58
        lea     rcx, [rsp+80H]                          ; 1735 _ 48: 8D. 8C 24, 00000080
        neg     r10d                                    ; 173D _ 41: F7. DA
        lea     r14d, [r13-1H]                          ; 1740 _ 45: 8D. 75, FF
        mov     qword [rsp+48H], rcx                    ; 1744 _ 48: 89. 4C 24, 48
        mov     dword [rsp+54H], r10d                   ; 1749 _ 44: 89. 54 24, 54
        mov     dword [rsp+5CH], r14d                   ; 174E _ 44: 89. 74 24, 5C
?_0511: mov     rcx, qword [rsp+38H]                    ; 1753 _ 48: 8B. 4C 24, 38
        call    _ZN10MovePicker9next_moveEv             ; 1758 _ E8, 00000000(rel)
        test    eax, eax                                ; 175D _ 85. C0
        mov     r14d, eax                               ; 175F _ 41: 89. C6
        je      ?_0522                                  ; 1762 _ 0F 84, 000001FC
        mov     r10d, r14d                              ; 1768 _ 45: 89. F2
        and     r10d, 0C000H                            ; 176B _ 41: 81. E2, 0000C000
        jne     ?_0545                                  ; 1772 _ 0F 85, 000004A1
        cmp     qword [rsp+0D0H], 0                     ; 1778 _ 48: 83. BC 24, 000000D0, 00
        jne     ?_0547                                  ; 1781 _ 0F 85, 000004CC
        mov     ecx, r14d                               ; 1787 _ 44: 89. F1
        mov     r9, qword [rel .refptr.SquareBB]        ; 178A _ 4C: 8B. 0D, 00000000(rel)
        mov     edx, r14d                               ; 1791 _ 44: 89. F2
        sar     ecx, 6                                  ; 1794 _ C1. F9, 06
        and     edx, 3FH                                ; 1797 _ 83. E2, 3F
        and     ecx, 3FH                                ; 179A _ 83. E1, 3F
        mov     r13d, dword [rbx+rcx*4]                 ; 179D _ 44: 8B. 2C 8B
        and     r13d, 07H                               ; 17A1 _ 41: 83. E5, 07
        mov     rax, qword [rsp+r13*8+0E0H]             ; 17A5 _ 4A: 8B. 84 EC, 000000E0
        test    qword [r9+rdx*8], rax                   ; 17AD _ 49: 85. 04 D1
        jne     ?_0526                                  ; 17B1 _ 0F 85, 00000249
        cmp     r12d, -9999                             ; 17B7 _ 41: 81. FC, FFFFD8F1
        jl      ?_0551                                  ; 17BE _ 0F 8C, 000004E0
?_0512: mov     r11d, r14d                              ; 17C4 _ 45: 89. F3
        sar     r11d, 6                                 ; 17C7 _ 41: C1. FB, 06
        and     r11d, 3FH                               ; 17CB _ 41: 83. E3, 3F
        mov     r8d, dword [rbx+r11*4]                  ; 17CF _ 46: 8B. 04 9B
        and     r8d, 07H                                ; 17D3 _ 41: 83. E0, 07
        cmp     r8d, 1                                  ; 17D7 _ 41: 83. F8, 01
        je      ?_0537                                  ; 17DB _ 0F 84, 00000373
?_0513: mov     r9d, r14d                               ; 17E1 _ 45: 89. F1
        mov     r11, qword [rel .refptr.PieceValue]     ; 17E4 _ 4C: 8B. 1D, 00000000(rel)
        and     r9d, 3FH                                ; 17EB _ 41: 83. E1, 3F
        mov     r13d, dword [rbx+r9*4]                  ; 17EF _ 46: 8B. 2C 8B
        mov     r8d, dword [r11+r13*4+40H]              ; 17F3 _ 47: 8B. 44 AB, 40
        add     r8d, r12d                               ; 17F8 _ 45: 01. E0
        cmp     r15d, r8d                               ; 17FB _ 45: 39. C7
        mov     edx, r8d                                ; 17FE _ 44: 89. C2
        jge     ?_0525                                  ; 1801 _ 0F 8D, 000001E9
        cmp     r12d, r15d                              ; 1807 _ 45: 39. FC
        jg      ?_0514                                  ; 180A _ 7F, 1D
        mov     edx, r14d                               ; 180C _ 44: 89. F2
        mov     rcx, rbx                                ; 180F _ 48: 89. D9
        mov     dword [rsp+60H], r10d                   ; 1812 _ 44: 89. 54 24, 60
        call    _ZNK8Position3seeE4Move                 ; 1817 _ E8, 00000000(rel)
        mov     r10d, dword [rsp+60H]                   ; 181C _ 44: 8B. 54 24, 60
        test    eax, eax                                ; 1821 _ 85. C0
        jle     ?_0532                                  ; 1823 _ 0F 8E, 000002C7
?_0514: xor     r13d, r13d                              ; 1829 _ 45: 31. ED
?_0515: cmp     r10d, 16384                             ; 182C _ 41: 81. FA, 00004000
        jz      ?_0517                                  ; 1833 _ 74, 13
?_0516: mov     edx, r14d                               ; 1835 _ 44: 89. F2
        mov     rcx, rbx                                ; 1838 _ 48: 89. D9
        call    _ZNK8Position8see_signE4Move            ; 183B _ E8, 00000000(rel)
        test    eax, eax                                ; 1840 _ 85. C0
        js      ?_0511                                  ; 1842 _ 0F 88, FFFFFF0B
?_0517: mov     edx, r14d                               ; 1848 _ 44: 89. F2
        mov     rcx, rbx                                ; 184B _ 48: 89. D9
        call    _ZNK8Position9key_afterE4Move           ; 184E _ E8, 00000000(rel)
        mov     r10, qword [rel .refptr.TT]             ; 1853 _ 4C: 8B. 15, 00000000(rel)
        mov     edx, r14d                               ; 185A _ 44: 89. F2
        mov     r11, qword [rel .refptr.TT]             ; 185D _ 4C: 8B. 1D, 00000000(rel)
        mov     r8, qword [rsp+0D8H]                    ; 1864 _ 4C: 8B. 84 24, 000000D8
        mov     rcx, qword [r10]                        ; 186C _ 49: 8B. 0A
        lea     r9, [rcx-1H]                            ; 186F _ 4C: 8D. 49, FF
        mov     qword [rsp+60H], rcx                    ; 1873 _ 48: 89. 4C 24, 60
        mov     rcx, rbx                                ; 1878 _ 48: 89. D9
        and     rax, r9                                 ; 187B _ 4C: 21. C8
        shl     rax, 5                                  ; 187E _ 48: C1. E0, 05
        add     rax, qword [r11+8H]                     ; 1882 _ 49: 03. 43, 08
        prefetcht0 [rax]                                ; 1886 _ 0F 18. 08
        call    _ZNK8Position5legalE4Movey              ; 1889 _ E8, 00000000(rel)
        test    al, al                                  ; 188E _ 84. C0
        je      ?_0511                                  ; 1890 _ 0F 84, FFFFFEBD
        mov     r8, qword [rsp+48H]                     ; 1896 _ 4C: 8B. 44 24, 48
        movzx   r9d, r13b                               ; 189B _ 45: 0F B6. CD
        mov     edx, r14d                               ; 189F _ 44: 89. F2
        mov     rcx, rbx                                ; 18A2 _ 48: 89. D9
        mov     dword [rdi+0CH], r14d                   ; 18A5 _ 44: 89. 77, 0C
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 18A9 _ E8, 00000000(rel)
        mov     eax, dword [rsp+5CH]                    ; 18AE _ 8B. 44 24, 5C
        test    r13b, r13b                              ; 18B2 _ 45: 84. ED
        mov     rcx, rbx                                ; 18B5 _ 48: 89. D9
        lea     rdx, [rdi+28H]                          ; 18B8 _ 48: 8D. 57, 28
        mov     r9d, dword [rsp+54H]                    ; 18BC _ 44: 8B. 4C 24, 54
        mov     r8d, dword [rsp+58H]                    ; 18C1 _ 44: 8B. 44 24, 58
        mov     dword [rsp+20H], eax                    ; 18C6 _ 89. 44 24, 20
        jne     ?_0538                                  ; 18CA _ 0F 85, 000002B0
        call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 18D0 _ E8, FFFFFD4B
        neg     eax                                     ; 18D5 _ F7. D8
        mov     r13d, eax                               ; 18D7 _ 41: 89. C5
?_0518: mov     edx, r14d                               ; 18DA _ 44: 89. F2
        mov     rcx, rbx                                ; 18DD _ 48: 89. D9
        call    _ZN8Position9undo_moveE4Move            ; 18E0 _ E8, 00000000(rel)
        cmp     r13d, esi                               ; 18E5 _ 41: 39. F5
        jle     ?_0511                                  ; 18E8 _ 0F 8E, FFFFFE65
        cmp     r13d, r15d                              ; 18EE _ 45: 39. FD
        jle     ?_0533                                  ; 18F1 _ 0F 8E, 00000209
        mov     rsi, qword [rel .refptr.TT]             ; 18F7 _ 48: 8B. 35, 00000000(rel)
        cmp     r13d, 31743                             ; 18FE _ 41: 81. FD, 00007BFF
        mov     r12d, dword [rdi+1CH]                   ; 1905 _ 44: 8B. 67, 1C
        mov     edx, dword [rdi+8H]                     ; 1909 _ 8B. 57, 08
        movzx   ebx, byte [rsi+18H]                     ; 190C _ 0F B6. 5E, 18
        jg      ?_0548                                  ; 1910 _ 0F 8F, 00000363
        cmp     r13d, -31743                            ; 1916 _ 41: 81. FD, FFFF8401
        jl      _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth.cold.205; 191D _ 0F 8C, 00000CCD(rel)
        mov     edx, r13d                               ; 1923 _ 44: 89. EA
?_0519: mov     rdi, qword [rsp+40H]                    ; 1926 _ 48: 8B. 7C 24, 40
        mov     word [rbp+2H], r14w                     ; 192B _ 66 44: 89. 75, 02
        movzx   r14d, word [rbp]                        ; 1930 _ 44: 0F B7. 75, 00
        shr     rdi, 48                                 ; 1935 _ 48: C1. EF, 30
        cmp     rdi, r14                                ; 1939 _ 4C: 39. F7
        je      ?_0544                                  ; 193C _ 0F 84, 000002BE
?_0520: movzx   r10d, byte [rsp+50H]                    ; 1942 _ 44: 0F B6. 54 24, 50
        or      ebx, 02H                                ; 1948 _ 83. CB, 02
        mov     word [rbp], di                          ; 194B _ 66: 89. 7D, 00
        mov     word [rbp+4H], dx                       ; 194F _ 66: 89. 55, 04
        mov     word [rbp+6H], r12w                     ; 1953 _ 66 44: 89. 65, 06
        mov     byte [rbp+8H], bl                       ; 1958 _ 88. 5D, 08
        mov     byte [rbp+9H], r10b                     ; 195B _ 44: 88. 55, 09
?_0521: mov     eax, r13d                               ; 195F _ 44: 89. E8
        jmp     ?_0524                                  ; 1962 _ EB, 6F

?_0522: mov     rbx, qword [rel .refptr.TT]             ; 1964 _ 48: 8B. 1D, 00000000(rel)
        cmp     esi, 31743                              ; 196B _ 81. FE, 00007BFF
        mov     r13d, dword [rdi+1CH]                   ; 1971 _ 44: 8B. 6F, 1C
        mov     r12d, dword [rdi+8H]                    ; 1975 _ 44: 8B. 67, 08
        movzx   r15d, byte [rbx+18H]                    ; 1979 _ 44: 0F B6. 7B, 18
        jg      Unnamed_4_CF5                           ; 197E _ 0F 8F, 00000CF5(rel)
        cmp     esi, -31743                             ; 1984 _ 81. FE, FFFF8401
        jl      ?_0555                                  ; 198A _ 0F 8C, 00000352
        mov     r12d, esi                               ; 1990 _ 41: 89. F4
        mov     rax, qword [rsp+40H]                    ; 1993 _ 48: 8B. 44 24, 40
        movzx   edx, word [rbp]                         ; 1998 _ 0F B7. 55, 00
        shr     rax, 48                                 ; 199C _ 48: C1. E8, 30
        cmp     rax, rdx                                ; 19A0 _ 48: 39. D0
        je      ?_0540                                  ; 19A3 _ 0F 84, 000001F7
        xor     r11d, r11d                              ; 19A9 _ 45: 31. DB
        mov     word [rbp+2H], r11w                     ; 19AC _ 66 44: 89. 5D, 02
?_0523: movzx   r8d, byte [rsp+50H]                     ; 19B1 _ 44: 0F B6. 44 24, 50
        or      r15d, 01H                               ; 19B7 _ 41: 83. CF, 01
        mov     word [rbp], ax                          ; 19BB _ 66: 89. 45, 00
        mov     eax, esi                                ; 19BF _ 89. F0
        mov     word [rbp+4H], r12w                     ; 19C1 _ 66 44: 89. 65, 04
        mov     word [rbp+6H], r13w                     ; 19C6 _ 66 44: 89. 6D, 06
        mov     byte [rbp+8H], r15b                     ; 19CB _ 44: 88. 7D, 08
        mov     byte [rbp+9H], r8b                      ; 19CF _ 44: 88. 45, 09
?_0524: add     rsp, 2488                               ; 19D3 _ 48: 81. C4, 000009B8
        pop     rbx                                     ; 19DA _ 5B
        pop     rsi                                     ; 19DB _ 5E
        pop     rdi                                     ; 19DC _ 5F
        pop     rbp                                     ; 19DD _ 5D
        pop     r12                                     ; 19DE _ 41: 5C
        pop     r13                                     ; 19E0 _ 41: 5D
        pop     r14                                     ; 19E2 _ 41: 5E
        pop     r15                                     ; 19E4 _ 41: 5F
        ret                                             ; 19E6 _ C3

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_0525: cmp     esi, edx                                ; 19F0 _ 39. D6
        cmovl   esi, edx                                ; 19F2 _ 0F 4C. F2
        jmp     ?_0511                                  ; 19F5 _ E9, FFFFFD59

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_0526: mov     r13d, 1                                 ; 1A00 _ 41: BD, 00000001
        jmp     ?_0516                                  ; 1A06 _ E9, FFFFFE2A

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_0527: cmp     byte [rsp+7FH], 0                       ; 1A10 _ 80. 7C 24, 7F, 00
        jne     ?_0542                                  ; 1A15 _ 0F 85, 000001C5
        mov     rcx, qword [rel .refptr.TT]             ; 1A1B _ 48: 8B. 0D, 00000000(rel)
        cmp     esi, 31743                              ; 1A22 _ 81. FE, 00007BFF
        mov     r12d, dword [rdi+8H]                    ; 1A28 _ 44: 8B. 67, 08
        movzx   r13d, byte [rcx+18H]                    ; 1A2C _ 44: 0F B6. 69, 18
        jg      Unnamed_4_D0B                           ; 1A31 _ 0F 8F, 00000D0B(rel)
        cmp     esi, -31743                             ; 1A37 _ 81. FE, FFFF8401
        jl      ?_0556                                  ; 1A3D _ 0F 8C, 000002A4
        mov     r12d, esi                               ; 1A43 _ 41: 89. F4
        mov     rax, qword [rbx+3B8H]                   ; 1A46 _ 48: 8B. 83, 000003B8
        movzx   edx, word [rbp]                         ; 1A4D _ 0F B7. 55, 00
        movzx   ebx, word [rax+36H]                     ; 1A51 _ 0F B7. 58, 36
        cmp     rbx, rdx                                ; 1A55 _ 48: 39. D3
        je      ?_0554                                  ; 1A58 _ 0F 84, 00000273
        xor     r8d, r8d                                ; 1A5E _ 45: 31. C0
        mov     word [rbp+2H], r8w                      ; 1A61 _ 66 44: 89. 45, 02
?_0528: mov     word [rbp+6H], r11w                     ; 1A66 _ 66 44: 89. 5D, 06
        mov     r11d, r13d                              ; 1A6B _ 45: 89. EB
        mov     eax, esi                                ; 1A6E _ 89. F0
        or      r11d, 02H                               ; 1A70 _ 41: 83. CB, 02
        mov     word [rbp], bx                          ; 1A74 _ 66: 89. 5D, 00
        mov     word [rbp+4H], r12w                     ; 1A78 _ 66 44: 89. 65, 04
        mov     byte [rbp+8H], r11b                     ; 1A7D _ 44: 88. 5D, 08
        mov     byte [rbp+9H], -6                       ; 1A81 _ C6. 45, 09, FA
        jmp     ?_0524                                  ; 1A85 _ E9, FFFFFF49

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_0529: movsx   esi, word [rbp+4H]                      ; 1A90 _ 0F BF. 75, 04
        movzx   r8d, word [rbp+2H]                      ; 1A94 _ 44: 0F B7. 45, 02
        mov     r9d, dword [rdi+8H]                     ; 1A99 _ 44: 8B. 4F, 08
        cmp     esi, 32002                              ; 1A9D _ 81. FE, 00007D02
        je      ?_0541                                  ; 1AA3 _ 0F 84, 00000117
        cmp     esi, 31743                              ; 1AA9 _ 81. FE, 00007BFF
        jg      ?_0550                                  ; 1AAF _ 0F 8F, 000001E7
        cmp     esi, -31743                             ; 1AB5 _ 81. FE, FFFF8401
        jl      ?_0553                                  ; 1ABB _ 0F 8C, 00000208
?_0530: cmp     esi, 32002                              ; 1AC1 _ 81. FE, 00007D02
        jz      ?_0535                                  ; 1AC7 _ 74, 4D
        movsx   r10d, byte [rbp+9H]                     ; 1AC9 _ 44: 0F BE. 55, 09
        cmp     r10d, dword [rsp+50H]                   ; 1ACE _ 44: 3B. 54 24, 50
        jl      ?_0535                                  ; 1AD3 _ 7C, 41
        cmp     r14d, esi                               ; 1AD5 _ 41: 39. F6
        jg      ?_0534                                  ; 1AD8 _ 7F, 36
        test    byte [rbp+8H], 02H                      ; 1ADA _ F6. 45, 08, 02
        jz      ?_0535                                  ; 1ADE _ 74, 36
?_0531: mov     dword [rdi+0CH], r8d                    ; 1AE0 _ 44: 89. 47, 0C
        mov     eax, esi                                ; 1AE4 _ 89. F0
        jmp     ?_0524                                  ; 1AE6 _ E9, FFFFFEE8

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_0532: cmp     esi, r12d                               ; 1AF0 _ 44: 39. E6
        cmovl   esi, r12d                               ; 1AF3 _ 41: 0F 4C. F4
        jmp     ?_0511                                  ; 1AF7 _ E9, FFFFFC57

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_0533: mov     esi, r13d                               ; 1B00 _ 44: 89. EE
        jmp     ?_0511                                  ; 1B03 _ E9, FFFFFC4B

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_0534: test    byte [rbp+8H], 01H                      ; 1B10 _ F6. 45, 08, 01
        jnz     ?_0531                                  ; 1B14 _ 75, CA
?_0535: movsx   r11d, word [rbp+6H]                     ; 1B16 _ 44: 0F BF. 5D, 06
        cmp     r11d, 32002                             ; 1B1B _ 41: 81. FB, 00007D02
        mov     dword [rdi+1CH], r11d                   ; 1B22 _ 44: 89. 5F, 1C
        je      ?_0552                                  ; 1B26 _ 0F 84, 00000180
?_0536: cmp     esi, 32002                              ; 1B2C _ 81. FE, 00007D02
        je      ?_0543                                  ; 1B32 _ 0F 84, 000000B8
        movzx   r12d, byte [rbp+8H]                     ; 1B38 _ 44: 0F B6. 65, 08
        xor     eax, eax                                ; 1B3D _ 31. C0
        cmp     esi, r11d                               ; 1B3F _ 44: 39. DE
        setg    al                                      ; 1B42 _ 0F 9F. C0
        add     eax, 1                                  ; 1B45 _ 83. C0, 01
        test    eax, r12d                               ; 1B48 _ 44: 85. E0
        cmove   esi, r11d                               ; 1B4B _ 41: 0F 44. F3
        jmp     ?_0510                                  ; 1B4F _ E9, FFFFFB73

?_0537: mov     ecx, dword [rbx+3ACH]                   ; 1B54 _ 8B. 8B, 000003AC
        shr     r11, 3                                  ; 1B5A _ 49: C1. EB, 03
        lea     eax, [rcx*8]                            ; 1B5E _ 8D. 04 CD, 00000000
        sub     eax, ecx                                ; 1B65 _ 29. C8
        xor     eax, r11d                               ; 1B67 _ 44: 31. D8
        cmp     eax, 3                                  ; 1B6A _ 83. F8, 03
        jbe     ?_0513                                  ; 1B6D _ 0F 86, FFFFFC6E
        xor     r13d, r13d                              ; 1B73 _ 45: 31. ED
        jmp     ?_0515                                  ; 1B76 _ E9, FFFFFCB1

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_0538: call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 1B80 _ E8, 00001C8B
        neg     eax                                     ; 1B85 _ F7. D8
        mov     r13d, eax                               ; 1B87 _ 41: 89. C5
        jmp     ?_0518                                  ; 1B8A _ E9, FFFFFD4B

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_0539: mov     esi, 40                                 ; 1B90 _ BE, 00000028
        sub     esi, dword [rdi-0CH]                    ; 1B95 _ 2B. 77, F4
        jmp     ?_0509                                  ; 1B98 _ E9, FFFFFB21

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_0540: movsx   r9d, byte [rbp+9H]                      ; 1BA0 _ 44: 0F BE. 4D, 09
        sub     r9d, 1                                  ; 1BA5 _ 41: 83. E9, 01
        cmp     dword [rsp+50H], r9d                    ; 1BA9 _ 44: 39. 4C 24, 50
        jge     ?_0523                                  ; 1BAE _ 0F 8D, FFFFFDFD
        mov     eax, esi                                ; 1BB4 _ 89. F0
        jmp     ?_0524                                  ; 1BB6 _ E9, FFFFFE18

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_0541: movsx   esi, word [rbp+6H]                      ; 1BC0 _ 0F BF. 75, 06
        cmp     esi, 32002                              ; 1BC4 _ 81. FE, 00007D02
        mov     dword [rdi+1CH], esi                    ; 1BCA _ 89. 77, 1C
        je      ?_0552                                  ; 1BCD _ 0F 84, 000000D9
        mov     r11d, esi                               ; 1BD3 _ 41: 89. F3
        jmp     ?_0510                                  ; 1BD6 _ E9, FFFFFAEC

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_0542: mov     eax, esi                                ; 1BE0 _ 89. F0
        jmp     ?_0524                                  ; 1BE2 _ E9, FFFFFDEC

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_0543: mov     esi, r11d                               ; 1BF0 _ 44: 89. DE
        jmp     ?_0510                                  ; 1BF3 _ E9, FFFFFACF

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_0544: movsx   r15d, byte [rbp+9H]                     ; 1C00 _ 44: 0F BE. 7D, 09
        sub     r15d, 1                                 ; 1C05 _ 41: 83. EF, 01
        cmp     dword [rsp+50H], r15d                   ; 1C09 _ 44: 39. 7C 24, 50
        jge     ?_0520                                  ; 1C0E _ 0F 8D, FFFFFD2E
        jmp     ?_0521                                  ; 1C14 _ E9, FFFFFD46

?_0545: mov     r8, qword [rsp+68H]                     ; 1C19 _ 4C: 8B. 44 24, 68
        mov     edx, r14d                               ; 1C1E _ 44: 89. F2
        mov     rcx, rbx                                ; 1C21 _ 48: 89. D9
        mov     dword [rsp+60H], r10d                   ; 1C24 _ 44: 89. 54 24, 60
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 1C29 _ E8, 00000000(rel)
        mov     r10d, dword [rsp+60H]                   ; 1C2E _ 44: 8B. 54 24, 60
        test    al, al                                  ; 1C33 _ 84. C0
        mov     r13d, eax                               ; 1C35 _ 41: 89. C5
        jne     ?_0515                                  ; 1C38 _ 0F 85, FFFFFBEE
?_0546: cmp     r12d, -9999                             ; 1C3E _ 41: 81. FC, FFFFD8F1
        jge     ?_0512                                  ; 1C45 _ 0F 8D, FFFFFB79
        xor     r13d, r13d                              ; 1C4B _ 45: 31. ED
        jmp     ?_0515                                  ; 1C4E _ E9, FFFFFBD9

?_0547: mov     r8, qword [rsp+68H]                     ; 1C53 _ 4C: 8B. 44 24, 68
        mov     edx, r14d                               ; 1C58 _ 44: 89. F2
        mov     rcx, rbx                                ; 1C5B _ 48: 89. D9
        mov     dword [rsp+60H], r10d                   ; 1C5E _ 44: 89. 54 24, 60
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 1C63 _ E8, 00000000(rel)
        mov     r10d, dword [rsp+60H]                   ; 1C68 _ 44: 8B. 54 24, 60
        test    al, al                                  ; 1C6D _ 84. C0
        mov     r13d, eax                               ; 1C6F _ 41: 89. C5
        jz      ?_0546                                  ; 1C72 _ 74, CA
        jmp     ?_0516                                  ; 1C74 _ E9, FFFFFBBC

?_0548: add     edx, r13d                               ; 1C79 _ 44: 01. EA
        jmp     ?_0519                                  ; 1C7C _ E9, FFFFFCA5

?_0549: cmp     dword [rdi+8H], 127                     ; 1C81 _ 83. 7F, 08, 7F
        jg      ?_0557                                  ; 1C85 _ 7F, 65
        mov     ebp, dword [rbx+3ACH]                   ; 1C87 _ 8B. AB, 000003AC
        lea     rsi, [rel _ZN12_GLOBAL__N_19DrawValueE] ; 1C8D _ 48: 8D. 35, 004000C0(rel)
        mov     eax, dword [rsi+rbp*4]                  ; 1C94 _ 8B. 04 AE
        jmp     ?_0524                                  ; 1C97 _ E9, FFFFFD37

?_0550: sub     esi, r9d                                ; 1C9C _ 44: 29. CE
        jmp     ?_0530                                  ; 1C9F _ E9, FFFFFE1D

?_0551: xor     r13d, r13d                              ; 1CA4 _ 45: 31. ED
        jmp     ?_0516                                  ; 1CA7 _ E9, FFFFFB89

?_0552: mov     rcx, rbx                                ; 1CAC _ 48: 89. D9
        mov     dword [rsp+38H], r8d                    ; 1CAF _ 44: 89. 44 24, 38
        call    _ZN4Eval8evaluateERK8Position           ; 1CB4 _ E8, 00000000(rel)
        mov     r8d, dword [rsp+38H]                    ; 1CB9 _ 44: 8B. 44 24, 38
        mov     r11d, eax                               ; 1CBE _ 41: 89. C3
        mov     dword [rdi+1CH], eax                    ; 1CC1 _ 89. 47, 1C
        jmp     ?_0536                                  ; 1CC4 _ E9, FFFFFE63

?_0553: add     esi, r9d                                ; 1CC9 _ 44: 01. CE
        jmp     ?_0530                                  ; 1CCC _ E9, FFFFFDF0

?_0554: cmp     byte [rbp+9H], -4                       ; 1CD1 _ 80. 7D, 09, FC
        mov     eax, esi                                ; 1CD5 _ 89. F0
        jge     ?_0524                                  ; 1CD7 _ 0F 8D, FFFFFCF6
        jmp     ?_0528                                  ; 1CDD _ E9, FFFFFD84

?_0555: jmp     Unnamed_4_CE8                           ; 1CE2 _ E9, 00000CE8(rel)

?_0556: jmp     Unnamed_4_CFD                           ; 1CE7 _ E9, 00000CFD(rel)

?_0557: ; Local function
        jmp     Unnamed_4_CDB                           ; 1CEC _ E9, 00000CDB(rel)

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 66H, 2EH, 0FH
;       db 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZN12_GLOBAL__N_112update_statsERK8PositionPN6Search5StackE4Move5DepthPS6_i:; Local function
        push    r15                                     ; 1D00 _ 41: 57
        push    r14                                     ; 1D02 _ 41: 56
        push    r13                                     ; 1D04 _ 41: 55
        push    r12                                     ; 1D06 _ 41: 54
        push    rbp                                     ; 1D08 _ 55
        push    rdi                                     ; 1D09 _ 57
        push    rsi                                     ; 1D0A _ 56
        push    rbx                                     ; 1D0B _ 53
        sub     rsp, 56                                 ; 1D0C _ 48: 83. EC, 38
        mov     eax, dword [rdx+14H]                    ; 1D10 _ 8B. 42, 14
        cmp     eax, r8d                                ; 1D13 _ 44: 39. C0
        mov     rbx, rdx                                ; 1D16 _ 48: 89. D3
        mov     dword [rsp+98H], r9d                    ; 1D19 _ 44: 89. 8C 24, 00000098
        jz      ?_0558                                  ; 1D21 _ 74, 07
        mov     dword [rdx+18H], eax                    ; 1D23 _ 89. 42, 18
        mov     dword [rdx+14H], r8d                    ; 1D26 _ 44: 89. 42, 14
?_0558: mov     edx, dword [rsp+98H]                    ; 1D2A _ 8B. 94 24, 00000098
        lea     r9, [rel _ZN12_GLOBAL__N_118CounterMoveHistoryE]; 1D31 _ 4C: 8D. 0D, 000000C0(rel)
        mov     esi, dword [rbx-1CH]                    ; 1D38 _ 8B. 73, E4
        mov     edi, dword [rsp+98H]                    ; 1D3B _ 8B. BC 24, 00000098
        mov     rax, qword [rcx+3B0H]                   ; 1D42 _ 48: 8B. 81, 000003B0
        imul    edx, edx                                ; 1D49 _ 0F AF. D2
        mov     r15d, esi                               ; 1D4C _ 41: 89. F7
        mov     dword [rsp+20H], esi                    ; 1D4F _ 89. 74 24, 20
        mov     esi, r8d                                ; 1D53 _ 44: 89. C6
        and     r15d, 3FH                               ; 1D56 _ 41: 83. E7, 3F
        sar     esi, 6                                  ; 1D5A _ C1. FE, 06
        lea     r11d, [rdi+rdx-1H]                      ; 1D5D _ 44: 8D. 5C 17, FF
        mov     edi, dword [rbx-44H]                    ; 1D62 _ 8B. 7B, BC
        mov     r10, r15                                ; 1D65 _ 4D: 89. FA
        and     esi, 3FH                                ; 1D68 _ 83. E6, 3F
        mov     ebp, dword [rcx+r15*4]                  ; 1D6B _ 42: 8B. 2C B9
        shl     r10, 12                                 ; 1D6F _ 49: C1. E2, 0C
        mov     qword [rsp+10H], rax                    ; 1D73 _ 48: 89. 44 24, 10
        mov     r14d, edi                               ; 1D78 _ 41: 89. FE
        and     r14d, 3FH                               ; 1D7B _ 41: 83. E6, 3F
        mov     qword [rsp+18H], rbp                    ; 1D7F _ 48: 89. 6C 24, 18
        shl     rbp, 18                                 ; 1D84 _ 48: C1. E5, 12
        mov     r12d, dword [rcx+r14*4]                 ; 1D88 _ 46: 8B. 24 B1
        add     rbp, r9                                 ; 1D8C _ 4C: 01. CD
        mov     r13, r14                                ; 1D8F _ 4D: 89. F5
        add     rbp, r10                                ; 1D92 _ 4C: 01. D5
        shl     r13, 12                                 ; 1D95 _ 49: C1. E5, 0C
        mov     r10d, dword [rcx+rsi*4]                 ; 1D99 _ 44: 8B. 14 B1
        mov     qword [rsp], rbp                        ; 1D9D _ 48: 89. 2C 24
        mov     ebp, r11d                               ; 1DA1 _ 44: 89. DD
        sar     ebp, 31                                 ; 1DA4 _ C1. FD, 1F
        shl     r12, 18                                 ; 1DA7 _ 49: C1. E4, 12
        add     r12, r9                                 ; 1DAB _ 4D: 01. CC
        mov     r9d, ebp                                ; 1DAE _ 41: 89. E9
        xor     r9d, r11d                               ; 1DB1 _ 45: 31. D9
        add     r12, r13                                ; 1DB4 _ 4D: 01. EC
        mov     r13d, r8d                               ; 1DB7 _ 45: 89. C5
        sub     r9d, ebp                                ; 1DBA _ 41: 29. E9
        and     r13d, 3FH                               ; 1DBD _ 41: 83. E5, 3F
        mov     qword [rsp+8H], r12                     ; 1DC1 _ 4C: 89. 64 24, 08
        cmp     r9d, 323                                ; 1DC6 _ 41: 81. F9, 00000143
        jg      ?_0559                                  ; 1DCD _ 7F, 3E
        mov     r12d, r10d                              ; 1DCF _ 45: 89. D4
        mov     edx, 424194301                          ; 1DD2 _ BA, 1948B0FD
        shl     r12, 8                                  ; 1DD7 _ 49: C1. E4, 08
        lea     rax, [rax+r12+4D4H]                     ; 1DDB _ 4A: 8D. 84 20, 000004D4
        mov     r12d, r9d                               ; 1DE3 _ 45: 89. CC
        lea     rsi, [rax+r13*4]                        ; 1DE6 _ 4A: 8D. 34 A8
        mov     ebp, dword [rsi]                        ; 1DEA _ 8B. 2E
        imul    r12d, ebp                               ; 1DEC _ 44: 0F AF. E5
        mov     eax, r12d                               ; 1DF0 _ 44: 89. E0
        sar     r12d, 31                                ; 1DF3 _ 41: C1. FC, 1F
        imul    edx                                     ; 1DF7 _ F7. EA
        sar     edx, 5                                  ; 1DF9 _ C1. FA, 05
        sub     edx, r12d                               ; 1DFC _ 44: 29. E2
        mov     r12d, r11d                              ; 1DFF _ 45: 89. DC
        sub     ebp, edx                                ; 1E02 _ 29. D5
        shl     r12d, 5                                 ; 1E04 _ 41: C1. E4, 05
        add     ebp, r12d                               ; 1E08 _ 44: 01. E5
        mov     dword [rsi], ebp                        ; 1E0B _ 89. 2E
?_0559: mov     esi, dword [rsp+20H]                    ; 1E0D _ 8B. 74 24, 20
        sar     esi, 6                                  ; 1E11 _ C1. FE, 06
        and     esi, 3FH                                ; 1E14 _ 83. E6, 3F
        cmp     r15, rsi                                ; 1E17 _ 49: 39. F7
        jz      ?_0561                                  ; 1E1A _ 74, 6E
        mov     rbp, qword [rsp+18H]                    ; 1E1C _ 48: 8B. 6C 24, 18
        mov     rax, qword [rsp+10H]                    ; 1E21 _ 48: 8B. 44 24, 10
        shl     rbp, 8                                  ; 1E26 _ 48: C1. E5, 08
        lea     rdx, [rax+rbp+14D4H]                    ; 1E2A _ 48: 8D. 94 28, 000014D4
        lea     r12, [rdx+r15*4]                        ; 1E32 _ 4E: 8D. 24 BA
        cmp     r8d, dword [r12]                        ; 1E36 _ 45: 3B. 04 24
        jz      ?_0560                                  ; 1E3A _ 74, 0E
        mov     dword [r12], r8d                        ; 1E3C _ 45: 89. 04 24
        mov     edi, dword [rbx-44H]                    ; 1E40 _ 8B. 7B, BC
        mov     r14d, edi                               ; 1E43 _ 41: 89. FE
        and     r14d, 3FH                               ; 1E46 _ 41: 83. E6, 3F
?_0560: cmp     r9d, 323                                ; 1E4A _ 41: 81. F9, 00000143
        jg      Unnamed_4_E41                           ; 1E51 _ 0F 8F, 00000E41(rel)
        mov     r8d, r10d                               ; 1E57 _ 45: 89. D0
        mov     edx, r9d                                ; 1E5A _ 44: 89. CA
        mov     r12d, r11d                              ; 1E5D _ 45: 89. DC
        shl     r8, 8                                   ; 1E60 _ 49: C1. E0, 08
        add     r8, qword [rsp]                         ; 1E64 _ 4C: 03. 04 24
        lea     rsi, [r8+r13*4]                         ; 1E68 _ 4B: 8D. 34 A8
        mov     ebp, dword [rsi]                        ; 1E6C _ 8B. 2E
        imul    edx, ebp                                ; 1E6E _ 0F AF. D5
        lea     eax, [rdx+1FFH]                         ; 1E71 _ 8D. 82, 000001FF
        test    edx, edx                                ; 1E77 _ 85. D2
        cmovns  eax, edx                                ; 1E79 _ 0F 49. C2
        shl     r12d, 6                                 ; 1E7C _ 41: C1. E4, 06
        sar     eax, 9                                  ; 1E80 _ C1. F8, 09
        sub     ebp, eax                                ; 1E83 _ 29. C5
        add     ebp, r12d                               ; 1E85 _ 44: 01. E5
        mov     dword [rsi], ebp                        ; 1E88 _ 89. 2E
?_0561: sar     edi, 6                                  ; 1E8A _ C1. FF, 06
        mov     r12d, edi                               ; 1E8D _ 41: 89. FC
        and     r12d, 3FH                               ; 1E90 _ 41: 83. E4, 3F
        cmp     r12, r14                                ; 1E94 _ 4D: 39. F4
        sete    dil                                     ; 1E97 _ 40: 0F 94. C7
        cmp     r9d, 323                                ; 1E9B _ 41: 81. F9, 00000143
        setg    sil                                     ; 1EA2 _ 40: 0F 9F. C6
        or      sil, dil                                ; 1EA6 _ 40: 08. FE
        jne     _ZN12_GLOBAL__N_112update_statsERK8PositionPN6Search5StackE4Move5DepthPS6_i.cold.206; 1EA9 _ 0F 85, 00000D13(rel)
        shl     r10, 8                                  ; 1EAF _ 49: C1. E2, 08
        add     r10, qword [rsp+8H]                     ; 1EB3 _ 4C: 03. 54 24, 08
        lea     r13, [r10+r13*4]                        ; 1EB8 _ 4F: 8D. 2C AA
        mov     r8d, dword [r13]                        ; 1EBC _ 45: 8B. 45, 00
        imul    r9d, r8d                                ; 1EC0 _ 45: 0F AF. C8
        lea     r10d, [r9+1FFH]                         ; 1EC4 _ 45: 8D. 91, 000001FF
        test    r9d, r9d                                ; 1ECB _ 45: 85. C9
        cmovs   r9d, r10d                               ; 1ECE _ 45: 0F 48. CA
        sar     r9d, 9                                  ; 1ED2 _ 41: C1. F9, 09
        sub     r8d, r9d                                ; 1ED6 _ 45: 29. C8
        mov     r9d, r11d                               ; 1ED9 _ 45: 89. D9
        shl     r9d, 6                                  ; 1EDC _ 41: C1. E1, 06
        add     r8d, r9d                                ; 1EE0 _ 45: 01. C8
        mov     dword [r13], r8d                        ; 1EE3 _ 45: 89. 45, 00
        mov     ebp, dword [rsp+0A8H]                   ; 1EE7 _ 8B. AC 24, 000000A8
        test    ebp, ebp                                ; 1EEE _ 85. ED
        jg      ?_0564                                  ; 1EF0 _ 7F, 1E
?_0562: cmp     dword [rbx-4H], 1                       ; 1EF2 _ 83. 7B, FC, 01
        je      ?_0566                                  ; 1EF6 _ 0F 84, 00000154
?_0563: add     rsp, 56                                 ; 1EFC _ 48: 83. C4, 38
        pop     rbx                                     ; 1F00 _ 5B
        pop     rsi                                     ; 1F01 _ 5E
        pop     rdi                                     ; 1F02 _ 5F
        pop     rbp                                     ; 1F03 _ 5D
        pop     r12                                     ; 1F04 _ 41: 5C
        pop     r13                                     ; 1F06 _ 41: 5D
        pop     r14                                     ; 1F08 _ 41: 5E
        pop     r15                                     ; 1F0A _ 41: 5F
        ret                                             ; 1F0C _ C3

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_0564: mov     edx, r11d                               ; 1F10 _ 44: 89. DA
        neg     edx                                     ; 1F13 _ F7. DA
        mov     eax, edx                                ; 1F15 _ 89. D0
        mov     r10d, edx                               ; 1F17 _ 41: 89. D2
        sar     eax, 31                                 ; 1F1A _ C1. F8, 1F
        mov     edi, eax                                ; 1F1D _ 89. C7
        xor     edi, edx                                ; 1F1F _ 31. D7
        sub     edi, eax                                ; 1F21 _ 29. C7
        cmp     edi, 323                                ; 1F23 _ 81. FF, 00000143
        mov     r13d, edi                               ; 1F29 _ 41: 89. FD
        setg    r8b                                     ; 1F2C _ 41: 0F 9F. C0
        shl     r10d, 5                                 ; 1F30 _ 41: C1. E2, 05
        shl     edx, 6                                  ; 1F34 _ C1. E2, 06
        or      esi, r8d                                ; 1F37 _ 44: 09. C6
        test    r8b, r8b                                ; 1F3A _ 45: 84. C0
        mov     dword [rsp+24H], r10d                   ; 1F3D _ 44: 89. 54 24, 24
        mov     dword [rsp+20H], edx                    ; 1F42 _ 89. 54 24, 20
        jne     Unnamed_4_D1A                           ; 1F46 _ 0F 85, 00000D1A(rel)
        test    sil, sil                                ; 1F4C _ 40: 84. F6
        jne     Unnamed_4_D7E                           ; 1F4F _ 0F 85, 00000D7E(rel)
        mov     r9d, dword [rbx-1CH]                    ; 1F55 _ 44: 8B. 4B, E4
        mov     edi, dword [rsp+0A8H]                   ; 1F59 _ 8B. BC 24, 000000A8
        mov     rax, qword [rsp+10H]                    ; 1F60 _ 48: 8B. 44 24, 10
        mov     r10, qword [rsp+0A0H]                   ; 1F65 _ 4C: 8B. 94 24, 000000A0
        mov     r8d, r9d                                ; 1F6D _ 45: 89. C8
        and     r9d, 3FH                                ; 1F70 _ 41: 83. E1, 3F
        sar     r8d, 6                                  ; 1F74 _ 41: C1. F8, 06
        sub     edi, 1                                  ; 1F78 _ 83. EF, 01
        and     r8d, 3FH                                ; 1F7B _ 41: 83. E0, 3F
        add     rax, 1236                               ; 1F7F _ 48: 05, 000004D4
        lea     rbp, [r10+rdi*4+4H]                     ; 1F85 _ 49: 8D. 6C BA, 04
        cmp     r9, r8                                  ; 1F8A _ 4D: 39. C1
        mov     qword [rsp+10H], rax                    ; 1F8D _ 48: 89. 44 24, 10
        mov     qword [rsp+28H], rbp                    ; 1F92 _ 48: 89. 6C 24, 28
        je      ?_0567                                  ; 1F97 _ 0F 84, 0000014C
?_0565: mov     r9d, dword [r10]                        ; 1F9D _ 45: 8B. 0A
        mov     eax, 424194301                          ; 1FA0 _ B8, 1948B0FD
        mov     rdx, qword [rsp+10H]                    ; 1FA5 _ 48: 8B. 54 24, 10
        mov     esi, r9d                                ; 1FAA _ 44: 89. CE
        and     r9d, 3FH                                ; 1FAD _ 41: 83. E1, 3F
        sar     esi, 6                                  ; 1FB1 _ C1. FE, 06
        shl     r9, 2                                   ; 1FB4 _ 49: C1. E1, 02
        and     esi, 3FH                                ; 1FB8 _ 83. E6, 3F
        mov     r8d, dword [rcx+rsi*4]                  ; 1FBB _ 44: 8B. 04 B1
        shl     r8, 8                                   ; 1FBF _ 49: C1. E0, 08
        lea     rdi, [rdx+r8]                           ; 1FC3 _ 4A: 8D. 3C 02
        add     rdi, r9                                 ; 1FC7 _ 4C: 01. CF
        mov     esi, dword [rdi]                        ; 1FCA _ 8B. 37
        mov     ebp, esi                                ; 1FCC _ 89. F5
        imul    ebp, r13d                               ; 1FCE _ 41: 0F AF. ED
        imul    ebp                                     ; 1FD2 _ F7. ED
        sar     ebp, 31                                 ; 1FD4 _ C1. FD, 1F
        sar     edx, 5                                  ; 1FD7 _ C1. FA, 05
        sub     edx, ebp                                ; 1FDA _ 29. EA
        sub     esi, edx                                ; 1FDC _ 29. D6
        add     esi, dword [rsp+24H]                    ; 1FDE _ 03. 74 24, 24
        mov     dword [rdi], esi                        ; 1FE2 _ 89. 37
        mov     rdi, qword [rsp]                        ; 1FE4 _ 48: 8B. 3C 24
        lea     rsi, [rdi+r8]                           ; 1FE8 _ 4A: 8D. 34 07
        mov     edi, dword [rsp+20H]                    ; 1FEC _ 8B. 7C 24, 20
        add     rsi, r9                                 ; 1FF0 _ 4C: 01. CE
        mov     ebp, dword [rsi]                        ; 1FF3 _ 8B. 2E
        mov     eax, ebp                                ; 1FF5 _ 89. E8
        imul    eax, r13d                               ; 1FF7 _ 41: 0F AF. C5
        lea     edx, [rax+1FFH]                         ; 1FFB _ 8D. 90, 000001FF
        test    eax, eax                                ; 2001 _ 85. C0
        cmovns  edx, eax                                ; 2003 _ 0F 49. D0
        add     r8, qword [rsp+8H]                      ; 2006 _ 4C: 03. 44 24, 08
        sar     edx, 9                                  ; 200B _ C1. FA, 09
        sub     ebp, edx                                ; 200E _ 29. D5
        add     r9, r8                                  ; 2010 _ 4D: 01. C1
        add     ebp, edi                                ; 2013 _ 01. FD
        mov     dword [rsi], ebp                        ; 2015 _ 89. 2E
        mov     esi, dword [r9]                         ; 2017 _ 41: 8B. 31
        mov     r8d, esi                                ; 201A _ 41: 89. F0
        imul    r8d, r13d                               ; 201D _ 45: 0F AF. C5
        lea     ebp, [r8+1FFH]                          ; 2021 _ 41: 8D. A8, 000001FF
        test    r8d, r8d                                ; 2028 _ 45: 85. C0
        cmovns  ebp, r8d                                ; 202B _ 41: 0F 49. E8
        add     r10, 4                                  ; 202F _ 49: 83. C2, 04
        sar     ebp, 9                                  ; 2033 _ C1. FD, 09
        sub     esi, ebp                                ; 2036 _ 29. EE
        add     esi, edi                                ; 2038 _ 01. FE
        cmp     r10, qword [rsp+28H]                    ; 203A _ 4C: 3B. 54 24, 28
        mov     dword [r9], esi                         ; 203F _ 41: 89. 31
        je      ?_0562                                  ; 2042 _ 0F 84, FFFFFEAA
        jmp     ?_0565                                  ; 2048 _ E9, FFFFFF50

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_0566: cmp     r12, r14                                ; 2050 _ 4D: 39. F4
        je      ?_0563                                  ; 2053 _ 0F 84, FFFFFEA3
        mov     r12, qword [rcx+3B8H]                   ; 2059 _ 4C: 8B. A1, 000003B8
        mov     r13d, dword [r12+40H]                   ; 2060 _ 45: 8B. 6C 24, 40
        test    r13d, r13d                              ; 2065 _ 45: 85. ED
        jne     ?_0563                                  ; 2068 _ 0F 85, FFFFFE8E
        mov     ecx, dword [rcx+r14*4]                  ; 206E _ 42: 8B. 0C B1
        neg     r11d                                    ; 2072 _ 41: F7. DB
        shl     r14, 12                                 ; 2075 _ 49: C1. E6, 0C
        mov     r10d, dword [rsp+98H]                   ; 2079 _ 44: 8B. 94 24, 00000098
        lea     rbx, [rel _ZN12_GLOBAL__N_118CounterMoveHistoryE]; 2081 _ 48: 8D. 1D, 000000C0(rel)
        shl     rcx, 18                                 ; 2088 _ 48: C1. E1, 12
        lea     edx, [r10+r10+2H]                       ; 208C _ 43: 8D. 54 12, 02
        add     rcx, rbx                                ; 2091 _ 48: 01. D9
        sub     r11d, edx                               ; 2094 _ 41: 29. D3
        add     r14, rcx                                ; 2097 _ 49: 01. CE
        mov     ebp, r11d                               ; 209A _ 44: 89. DD
        sar     ebp, 31                                 ; 209D _ C1. FD, 1F
        mov     eax, ebp                                ; 20A0 _ 89. E8
        xor     eax, r11d                               ; 20A2 _ 44: 31. D8
        sub     eax, ebp                                ; 20A5 _ 29. E8
        cmp     eax, 323                                ; 20A7 _ 3D, 00000143
        jg      ?_0563                                  ; 20AC _ 0F 8F, FFFFFE4A
        mov     rdi, qword [rsp+18H]                    ; 20B2 _ 48: 8B. 7C 24, 18
        shl     rdi, 8                                  ; 20B7 _ 48: C1. E7, 08
        add     r14, rdi                                ; 20BB _ 49: 01. FE
        lea     r15, [r14+r15*4]                        ; 20BE _ 4F: 8D. 3C BE
        mov     esi, dword [r15]                        ; 20C2 _ 41: 8B. 37
        imul    eax, esi                                ; 20C5 _ 0F AF. C6
        lea     r9d, [rax+1FFH]                         ; 20C8 _ 44: 8D. 88, 000001FF
        test    eax, eax                                ; 20CF _ 85. C0
        cmovs   eax, r9d                                ; 20D1 _ 41: 0F 48. C1
        shl     r11d, 6                                 ; 20D5 _ 41: C1. E3, 06
        sar     eax, 9                                  ; 20D9 _ C1. F8, 09
        sub     esi, eax                                ; 20DC _ 29. C6
        add     esi, r11d                               ; 20DE _ 44: 01. DE
        mov     dword [r15], esi                        ; 20E1 _ 41: 89. 37
        jmp     ?_0563                                  ; 20E4 _ E9, FFFFFE13

?_0567: ; Local function
        jmp     ?_0286                                  ; 20E9 _ E9, 00000E57(rel)

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

_ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121:; Local function
        mov     rax, qword [rcx]                        ; 20F0 _ 48: 8B. 01
        mov     qword [rcx+8H], 0                       ; 20F3 _ 48: C7. 41, 08, 00000000
        test    rax, rax                                ; 20FB _ 48: 85. C0
        mov     qword [rcx+10H], 0                      ; 20FE _ 48: C7. 41, 10, 00000000
        mov     qword [rcx], 0                          ; 2106 _ 48: C7. 01, 00000000
        mov     r8, qword [rdx]                         ; 210D _ 4C: 8B. 02
        mov     qword [rcx], r8                         ; 2110 _ 4C: 89. 01
        mov     r9, qword [rdx+8H]                      ; 2113 _ 4C: 8B. 4A, 08
        mov     qword [rdx], 0                          ; 2117 _ 48: C7. 02, 00000000
        mov     r10, qword [rcx+8H]                     ; 211E _ 4C: 8B. 51, 08
        mov     qword [rcx+8H], r9                      ; 2122 _ 4C: 89. 49, 08
        mov     r8, qword [rdx+10H]                     ; 2126 _ 4C: 8B. 42, 10
        mov     qword [rdx+8H], r10                     ; 212A _ 4C: 89. 52, 08
        mov     r11, qword [rcx+10H]                    ; 212E _ 4C: 8B. 59, 10
        mov     qword [rcx+10H], r8                     ; 2132 _ 4C: 89. 41, 10
        mov     qword [rdx+10H], r11                    ; 2136 _ 4C: 89. 5A, 10
        jne     _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121.cold.208; 213A _ 0F 85, 00000FA6(rel)
        ret                                             ; 2140 _ C3

; Filling space: 0FH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 66H, 2EH, 0FH
;       db 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb:; Local function
        push    r15                                     ; 2150 _ 41: 57
        push    r14                                     ; 2152 _ 41: 56
        push    r13                                     ; 2154 _ 41: 55
        push    r12                                     ; 2156 _ 41: 54
        push    rbp                                     ; 2158 _ 55
        push    rdi                                     ; 2159 _ 57
        push    rsi                                     ; 215A _ 56
        push    rbx                                     ; 215B _ 53
        sub     rsp, 2904                               ; 215C _ 48: 81. EC, 00000B58
        mov     rax, qword [rcx+3B8H]                   ; 2163 _ 48: 8B. 81, 000003B8
        mov     rbx, qword [rcx+3B0H]                   ; 216A _ 48: 8B. 99, 000003B0
        mov     r13d, dword [rsp+0BC8H]                 ; 2171 _ 44: 8B. AC 24, 00000BC8
        movsxd  rbp, dword [rsp+0BC0H]                  ; 2179 _ 48: 63. AC 24, 00000BC0
        cmp     qword [rax+38H], 0                      ; 2181 _ 48: 83. 78, 38, 00
        mov     rdi, rdx                                ; 2186 _ 48: 89. D7
        mov     rsi, rcx                                ; 2189 _ 48: 89. CE
        mov     r14d, r8d                               ; 218C _ 45: 89. C6
        mov     dword [rdx+24H], 0                      ; 218F _ C7. 42, 24, 00000000
        movzx   ecx, byte [rbx+24D8H]                   ; 2196 _ 0F B6. 8B, 000024D8
        mov     r12d, r9d                               ; 219D _ 45: 89. CC
        mov     edx, dword [rdx-20H]                    ; 21A0 _ 8B. 52, E0
        mov     byte [rsp+0B3H], r13b                   ; 21A3 _ 44: 88. AC 24, 000000B3
        setne   byte [rsp+58H]                          ; 21AB _ 0F 95. 44 24, 58
        add     edx, 1                                  ; 21B0 _ 83. C2, 01
        test    cl, cl                                  ; 21B3 _ 84. C9
        mov     dword [rdi+8H], edx                     ; 21B5 _ 89. 57, 08
        jne     ?_0663                                  ; 21B8 _ 0F 85, 00001590
        mov     r8d, dword [rbx+0ECH]                   ; 21BE _ 44: 8B. 83, 000000EC
        add     r8d, 1                                  ; 21C5 _ 41: 83. C0, 01
        cmp     r8d, 4096                               ; 21C9 _ 41: 81. F8, 00001000
        mov     dword [rbx+0ECH], r8d                   ; 21D0 _ 44: 89. 83, 000000EC
        jg      ?_0665                                  ; 21D7 _ 0F 8F, 0000158F
?_0568: movzx   eax, byte [rel _ZN6Search7SignalsE]     ; 21DD _ 0F B6. 05, 00000098(rel)
        test    al, al                                  ; 21E4 _ 84. C0
        jne     ?_0655                                  ; 21E6 _ 0F 85, 000014DF
        mov     rcx, rsi                                ; 21EC _ 48: 89. F1
        call    _ZNK8Position7is_drawEv                 ; 21EF _ E8, 00000000(rel)
        test    al, al                                  ; 21F4 _ 84. C0
        jne     ?_0655                                  ; 21F6 _ 0F 85, 000014CF
        mov     edx, dword [rdi+8H]                     ; 21FC _ 8B. 57, 08
        cmp     edx, 127                                ; 21FF _ 83. FA, 7F
        jg      ?_0655                                  ; 2202 _ 0F 8F, 000014C3
        lea     ecx, [rdx-7D00H]                        ; 2208 _ 8D. 8A, FFFF8300
        mov     r8d, 31999                              ; 220E _ 41: B8, 00007CFF
        cmp     r14d, ecx                               ; 2214 _ 41: 39. CE
        cmovge  ecx, r14d                               ; 2217 _ 41: 0F 4D. CE
        sub     r8d, edx                                ; 221B _ 41: 29. D0
        cmp     r12d, r8d                               ; 221E _ 45: 39. C4
        cmovle  r8d, r12d                               ; 2221 _ 45: 0F 4E. C4
        mov     dword [rsp+94H], ecx                    ; 2225 _ 89. 8C 24, 00000094
        cmp     r8d, ecx                                ; 222C _ 41: 39. C8
        mov     dword [rsp+98H], r8d                    ; 222F _ 44: 89. 84 24, 00000098
        jle     ?_0675                                  ; 2237 _ 0F 8E, 000015C3
        mov     r9d, dword [rdi+10H]                    ; 223D _ 44: 8B. 4F, 10
        mov     dword [rdi+38H], 0                      ; 2241 _ C7. 47, 38, 00000000
        mov     dword [rdi+0CH], 0                      ; 2248 _ C7. 47, 0C, 00000000
        mov     byte [rdi+48H], 0                       ; 224F _ C6. 47, 48, 00
        mov     dword [rdi+68H], 0                      ; 2253 _ C7. 47, 68, 00000000
        test    r9d, r9d                                ; 225A _ 45: 85. C9
        mov     dword [rdi+64H], 0                      ; 225D _ C7. 47, 64, 00000000
        mov     dword [rsp+70H], r9d                    ; 2264 _ 44: 89. 4C 24, 70
        jne     ?_0650                                  ; 2269 _ 0F 85, 0000138E
        mov     r10, qword [rsi+3B8H]                   ; 226F _ 4C: 8B. 96, 000003B8
        mov     r11, qword [r10+30H]                    ; 2276 _ 4D: 8B. 5A, 30
        mov     qword [rsp+0A0H], r11                   ; 227A _ 4C: 89. 9C 24, 000000A0
        mov     rdx, r11                                ; 2282 _ 4C: 89. DA
?_0569: mov     rcx, qword [rel .refptr.TT]             ; 2285 _ 48: 8B. 0D, 00000000(rel)
        lea     r12, [rsp+11FH]                         ; 228C _ 4C: 8D. A4 24, 0000011F
        mov     r8, r12                                 ; 2294 _ 4D: 89. E0
        mov     qword [rsp+50H], r12                    ; 2297 _ 4C: 89. 64 24, 50
        call    _ZNK18TranspositionTable5probeEyRb      ; 229C _ E8, 00000000(rel)
        cmp     byte [rsp+11FH], 0                      ; 22A1 _ 80. BC 24, 0000011F, 00
        mov     r15, rax                                ; 22A9 _ 49: 89. C7
        je      ?_0573                                  ; 22AC _ 0F 84, 000000C2
        movsx   r12d, word [rax+4H]                     ; 22B2 _ 44: 0F BF. 60, 04
        mov     r14d, dword [rdi+8H]                    ; 22B7 _ 44: 8B. 77, 08
        cmp     r12d, 32002                             ; 22BB _ 41: 81. FC, 00007D02
        je      ?_0594                                  ; 22C2 _ 0F 84, 00000729
        cmp     r12d, 31743                             ; 22C8 _ 41: 81. FC, 00007BFF
        jg      ?_0654                                  ; 22CF _ 0F 8F, 000013EE
        cmp     r12d, -31743                            ; 22D5 _ 41: 81. FC, FFFF8401
        jl      ?_0664                                  ; 22DC _ 0F 8C, 00001482
?_0570: movzx   ecx, word [r15+2H]                      ; 22E2 _ 41: 0F B7. 4F, 02
        cmp     r12d, 32002                             ; 22E7 _ 41: 81. FC, 00007D02
        mov     edx, ecx                                ; 22EE _ 89. CA
        mov     dword [rsp+90H], ecx                    ; 22F0 _ 89. 8C 24, 00000090
        je      ?_0574                                  ; 22F7 _ 0F 84, 00000088
        movsx   r8d, byte [r15+9H]                      ; 22FD _ 45: 0F BE. 47, 09
        cmp     ebp, r8d                                ; 2302 _ 44: 39. C5
        jg      ?_0574                                  ; 2305 _ 7F, 7E
        cmp     dword [rsp+98H], r12d                   ; 2307 _ 44: 39. A4 24, 00000098
        jg      ?_0635                                  ; 230F _ 0F 8F, 000010E0
        test    byte [r15+8H], 02H                      ; 2315 _ 41: F6. 47, 08, 02
        je      ?_0644                                  ; 231A _ 0F 84, 0000127B
        test    ecx, ecx                                ; 2320 _ 85. C9
        mov     dword [rdi+0CH], ecx                    ; 2322 _ 89. 4F, 0C
        je      Unnamed_4_12DB                          ; 2325 _ 0F 84, 000012DB(rel)
        mov     ebx, edx                                ; 232B _ 89. D3
; Note: Length-changing prefix causes delay on Intel processors
        and     bx, 0C000H                              ; 232D _ 66: 81. E3, C000
        jne     ?_0649                                  ; 2332 _ 0F 85, 000012B1
        mov     r13, rdx                                ; 2338 _ 49: 89. D5
        and     r13d, 3FH                               ; 233B _ 41: 83. E5, 3F
        mov     r15d, dword [rsi+r13*4]                 ; 233F _ 46: 8B. 3C AE
        test    r15d, r15d                              ; 2343 _ 45: 85. FF
        setne   r9b                                     ; 2346 _ 41: 0F 95. C1
?_0571: test    r9b, r9b                                ; 234A _ 45: 84. C9
        mov     eax, r12d                               ; 234D _ 44: 89. E0
        je      ?_0629                                  ; 2350 _ 0F 84, 00000E18
; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_0572: add     rsp, 2904                               ; 2360 _ 48: 81. C4, 00000B58
        pop     rbx                                     ; 2367 _ 5B
        pop     rsi                                     ; 2368 _ 5E
        pop     rdi                                     ; 2369 _ 5F
        pop     rbp                                     ; 236A _ 5D
        pop     r12                                     ; 236B _ 41: 5C
        pop     r13                                     ; 236D _ 41: 5D
        pop     r14                                     ; 236F _ 41: 5E
        pop     r15                                     ; 2371 _ 41: 5F
        ret                                             ; 2373 _ C3

?_0573: mov     dword [rsp+90H], 0                      ; 2374 _ C7. 84 24, 00000090, 00000000
        mov     r12d, 32002                             ; 237F _ 41: BC, 00007D02
?_0574: mov     eax, dword [rel _ZN10Tablebases11CardinalityE]; 2385 _ 8B. 05, 00000018(rel)
        test    eax, eax                                ; 238B _ 85. C0
        jne     Unnamed_4_1199                          ; 238D _ 0F 85, 00001199(rel)
        cmp     byte [rsp+58H], 0                       ; 2393 _ 80. 7C 24, 58, 00
        jne     ?_0622                                  ; 2398 _ 0F 85, 00000BC2
        cmp     byte [rsp+11FH], 0                      ; 239E _ 80. BC 24, 0000011F, 00
        je      ?_0582                                  ; 23A6 _ 0F 84, 00000214
        movsx   r14d, word [r15+6H]                     ; 23AC _ 45: 0F BF. 77, 06
        cmp     r14d, 32002                             ; 23B1 _ 41: 81. FE, 00007D02
        mov     dword [rdi+1CH], r14d                   ; 23B8 _ 44: 89. 77, 1C
        je      ?_0669                                  ; 23BC _ 0F 84, 000013E8
?_0575: cmp     r12d, 32002                             ; 23C2 _ 41: 81. FC, 00007D02
        jz      ?_0576                                  ; 23C9 _ 74, 1A
        movzx   edx, byte [r15+8H]                      ; 23CB _ 41: 0F B6. 57, 08
        xor     r8d, r8d                                ; 23D0 _ 45: 31. C0
        cmp     r14d, r12d                              ; 23D3 _ 45: 39. E6
        setl    r8b                                     ; 23D6 _ 41: 0F 9C. C0
        add     r8d, 1                                  ; 23DA _ 41: 83. C0, 01
        test    r8d, edx                                ; 23DE _ 41: 85. D0
        cmovne  r14d, r12d                              ; 23E1 _ 45: 0F 45. F4
?_0576: cmp     byte [rdi+20H], 0                       ; 23E5 _ 80. 7F, 20, 00
        jne     ?_0643                                  ; 23E9 _ 0F 85, 00001184
        cmp     ebp, 3                                  ; 23EF _ 83. FD, 03
        jg      ?_0577                                  ; 23F2 _ 7F, 6E
        lea     rax, [rel _ZN12_GLOBAL__N_1L12razor_marginE]; 23F4 _ 48: 8D. 05, 00000130(rel)
        movsxd  r9, ebp                                 ; 23FB _ 4C: 63. CD
        mov     ecx, dword [rax+r9*4]                   ; 23FE _ 42: 8B. 0C 88
        lea     r11d, [r14+rcx]                         ; 2402 _ 45: 8D. 1C 0E
        cmp     r11d, dword [rsp+94H]                   ; 2406 _ 44: 3B. 9C 24, 00000094
        jg      ?_0578                                  ; 240E _ 7F, 57
        mov     r10d, dword [rsp+90H]                   ; 2410 _ 44: 8B. 94 24, 00000090
        test    r10d, r10d                              ; 2418 _ 45: 85. D2
        jnz     ?_0578                                  ; 241B _ 75, 4A
        cmp     ebp, 1                                  ; 241D _ 83. FD, 01
        jg      ?_0636                                  ; 2420 _ 0F 8F, 00000FE5
        lea     edx, [r14+22AH]                         ; 2426 _ 41: 8D. 96, 0000022A
        cmp     edx, dword [rsp+94H]                    ; 242D _ 3B. 94 24, 00000094
        jg      ?_0636                                  ; 2434 _ 0F 8F, 00000FD1
        mov     r9d, dword [rsp+98H]                    ; 243A _ 44: 8B. 8C 24, 00000098
        mov     dword [rsp+20H], 0                      ; 2442 _ C7. 44 24, 20, 00000000
        mov     rdx, rdi                                ; 244A _ 48: 89. FA
        mov     rcx, rsi                                ; 244D _ 48: 89. F1
        mov     r8d, dword [rsp+94H]                    ; 2450 _ 44: 8B. 84 24, 00000094
        call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 2458 _ E8, FFFFF1C3
        jmp     ?_0572                                  ; 245D _ E9, FFFFFEFE

?_0577: cmp     ebp, 6                                  ; 2462 _ 83. FD, 06
        jg      ?_0580                                  ; 2465 _ 7F, 45
?_0578: imul    r9d, ebp, 200                           ; 2467 _ 44: 69. CD, 000000C8
        mov     ecx, r14d                               ; 246E _ 44: 89. F1
        sub     ecx, r9d                                ; 2471 _ 44: 29. C9
        cmp     ecx, dword [rsp+98H]                    ; 2474 _ 3B. 8C 24, 00000098
        mov     eax, ecx                                ; 247B _ 89. C8
        jl      ?_0579                                  ; 247D _ 7C, 24
        cmp     r14d, 9999                              ; 247F _ 41: 81. FE, 0000270F
        jg      ?_0579                                  ; 2486 _ 7F, 1B
        mov     r11, qword [rsi+3B8H]                   ; 2488 _ 4C: 8B. 9E, 000003B8
        movsxd  r10, dword [rsi+3ACH]                   ; 248F _ 4C: 63. 96, 000003AC
        mov     edx, dword [r11+r10*4+10H]              ; 2496 _ 43: 8B. 54 93, 10
        test    edx, edx                                ; 249B _ 85. D2
        jne     ?_0572                                  ; 249D _ 0F 85, FFFFFEBD
?_0579: cmp     ebp, 1                                  ; 24A3 _ 83. FD, 01
        jle     ?_0587                                  ; 24A6 _ 0F 8E, 000001CE
?_0580: cmp     r14d, dword [rsp+98H]                   ; 24AC _ 44: 3B. B4 24, 00000098
        jl      ?_0586                                  ; 24B4 _ 0F 8C, 000001B7
        mov     rax, qword [rsi+3B8H]                   ; 24BA _ 48: 8B. 86, 000003B8
        movsxd  r8, dword [rsi+3ACH]                    ; 24C1 _ 4C: 63. 86, 000003AC
        mov     r9d, dword [rax+r8*4+10H]               ; 24C8 _ 46: 8B. 4C 80, 10
        test    r9d, r9d                                ; 24CD _ 45: 85. C9
        je      ?_0586                                  ; 24D0 _ 0F 84, 0000019B
        mov     r10d, 2776544515                        ; 24D6 _ 41: BA, A57EB503
        sub     r14d, dword [rsp+98H]                   ; 24DC _ 44: 2B. B4 24, 00000098
        imul    ecx, ebp, 67                            ; 24E4 _ 6B. CD, 43
        mov     dword [rdi+0CH], 65                     ; 24E7 _ C7. 47, 0C, 00000041
        add     ecx, 823                                ; 24EE _ 81. C1, 00000337
        mov     eax, r14d                               ; 24F4 _ 44: 89. F0
        sar     ecx, 8                                  ; 24F7 _ C1. F9, 08
        imul    r10d                                    ; 24FA _ 41: F7. EA
        lea     r8d, [rdx+r14]                          ; 24FD _ 46: 8D. 04 32
        sar     r14d, 31                                ; 2501 _ 41: C1. FE, 1F
        lea     rdx, [rsp+120H]                         ; 2505 _ 48: 8D. 94 24, 00000120
        sar     r8d, 7                                  ; 250D _ 41: C1. F8, 07
        sub     r8d, r14d                               ; 2511 _ 45: 29. F0
        mov     r14d, 3                                 ; 2514 _ 41: BE, 00000003
        cmp     r8d, 3                                  ; 251A _ 41: 83. F8, 03
        cmovg   r8d, r14d                               ; 251E _ 45: 0F 4F. C6
        lea     r14d, [rcx+r8]                          ; 2522 _ 46: 8D. 34 01
        mov     rcx, rsi                                ; 2526 _ 48: 89. F1
        call    _ZN8Position12do_null_moveER9StateInfo  ; 2529 _ E8, 00000000(rel)
        mov     r9d, ebp                                ; 252E _ 41: 89. E9
        mov     byte [rdi+48H], 1                       ; 2531 _ C6. 47, 48, 01
        sub     r9d, r14d                               ; 2535 _ 45: 29. F1
        test    r9d, r9d                                ; 2538 _ 45: 85. C9
        mov     r14d, r9d                               ; 253B _ 45: 89. CE
        jg      ?_0637                                  ; 253E _ 0F 8F, 00000F01
        mov     r11d, dword [rsp+98H]                   ; 2544 _ 44: 8B. 9C 24, 00000098
        lea     rdx, [rdi+28H]                          ; 254C _ 48: 8D. 57, 28
        mov     rcx, rsi                                ; 2550 _ 48: 89. F1
        mov     r9d, 1                                  ; 2553 _ 41: B9, 00000001
        mov     dword [rsp+20H], 0                      ; 2559 _ C7. 44 24, 20, 00000000
        mov     r8d, r11d                               ; 2561 _ 45: 89. D8
        sub     r9d, r11d                               ; 2564 _ 45: 29. D9
        neg     r8d                                     ; 2567 _ 41: F7. D8
        call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 256A _ E8, FFFFF0B1
        neg     eax                                     ; 256F _ F7. D8
        mov     r13d, eax                               ; 2571 _ 41: 89. C5
?_0581: mov     byte [rdi+48H], 0                       ; 2574 _ C6. 47, 48, 00
        mov     rcx, rsi                                ; 2578 _ 48: 89. F1
        call    _ZN8Position14undo_null_moveEv          ; 257B _ E8, 00000000(rel)
        mov     r10d, dword [rsp+98H]                   ; 2580 _ 44: 8B. 94 24, 00000098
        cmp     r13d, r10d                              ; 2588 _ 45: 39. D5
        jl      ?_0586                                  ; 258B _ 0F 8C, 000000E0
        cmp     r13d, 31744                             ; 2591 _ 41: 81. FD, 00007C00
        cmovge  r13d, r10d                              ; 2598 _ 45: 0F 4D. EA
        cmp     ebp, 11                                 ; 259C _ 83. FD, 0B
        jg      ?_0585                                  ; 259F _ 0F 8F, 00000083
        add     r10d, 9999                              ; 25A5 _ 41: 81. C2, 0000270F
        cmp     r10d, 19998                             ; 25AC _ 41: 81. FA, 00004E1E
        ja      ?_0585                                  ; 25B3 _ 77, 73
        mov     eax, r13d                               ; 25B5 _ 44: 89. E8
        jmp     ?_0572                                  ; 25B8 _ E9, FFFFFDA3

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_0582: cmp     dword [rdi-1CH], 65                     ; 25C0 _ 83. 7F, E4, 41
        je      ?_0648                                  ; 25C4 _ 0F 84, 00001010
        mov     rcx, rsi                                ; 25CA _ 48: 89. F1
        call    _ZN4Eval8evaluateERK8Position           ; 25CD _ E8, 00000000(rel)
        mov     r14d, eax                               ; 25D2 _ 41: 89. C6
?_0583: mov     rax, qword [rsp+0A0H]                   ; 25D5 _ 48: 8B. 84 24, 000000A0
        mov     dword [rdi+1CH], r14d                   ; 25DD _ 44: 89. 77, 1C
        movzx   ecx, word [r15]                         ; 25E1 _ 41: 0F B7. 0F
        mov     r8, qword [rel .refptr.TT]              ; 25E5 _ 4C: 8B. 05, 00000000(rel)
        shr     rax, 48                                 ; 25EC _ 48: C1. E8, 30
        cmp     rax, rcx                                ; 25F0 _ 48: 39. C8
        movzx   r9d, byte [r8+18H]                      ; 25F3 _ 45: 0F B6. 48, 18
        je      ?_0668                                  ; 25F8 _ 0F 84, 0000119C
        xor     r11d, r11d                              ; 25FE _ 45: 31. DB
        mov     word [r15+2H], r11w                     ; 2601 _ 66 45: 89. 5F, 02
?_0584: mov     r10d, 32002                             ; 2606 _ 41: BA, 00007D02
        mov     word [r15], ax                          ; 260C _ 66 41: 89. 07
        mov     word [r15+4H], r10w                     ; 2610 _ 66 45: 89. 57, 04
        mov     word [r15+6H], r14w                     ; 2615 _ 66 45: 89. 77, 06
        mov     byte [r15+8H], r9b                      ; 261A _ 45: 88. 4F, 08
        mov     byte [r15+9H], -6                       ; 261E _ 41: C6. 47, 09, FA
        jmp     ?_0576                                  ; 2623 _ E9, FFFFFDBD

?_0585: test    r14d, r14d                              ; 2628 _ 45: 85. F6
        mov     byte [rdi+20H], 1                       ; 262B _ C6. 47, 20, 01
        jle     ?_0672                                  ; 262F _ 0F 8E, 000011B4
        mov     eax, dword [rsp+98H]                    ; 2635 _ 8B. 84 24, 00000098
        mov     rdx, rdi                                ; 263C _ 48: 89. FA
        mov     dword [rsp+20H], r14d                   ; 263F _ 44: 89. 74 24, 20
        mov     rcx, rsi                                ; 2644 _ 48: 89. F1
        mov     dword [rsp+28H], 0                      ; 2647 _ C7. 44 24, 28, 00000000
        lea     r8d, [rax-1H]                           ; 264F _ 44: 8D. 40, FF
        mov     r9d, eax                                ; 2653 _ 41: 89. C1
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 2656 _ E8, FFFFFAF5
        mov     edx, eax                                ; 265B _ 89. C2
        cmp     edx, dword [rsp+98H]                    ; 265D _ 3B. 94 24, 00000098
        mov     byte [rdi+20H], 0                       ; 2664 _ C6. 47, 20, 00
        mov     eax, r13d                               ; 2668 _ 44: 89. E8
        jge     ?_0572                                  ; 266B _ 0F 8D, FFFFFCEF
?_0586: cmp     ebp, 4                                  ; 2671 _ 83. FD, 04
        jg      ?_0627                                  ; 2674 _ 0F 8F, 00000957
?_0587: lea     r9, [rbx+4D4H]                          ; 267A _ 4C: 8D. 8B, 000004D4
        lea     r14, [rsp+2D0H]                         ; 2681 _ 4C: 8D. B4 24, 000002D0
        mov     qword [rsp+0B8H], r9                    ; 2689 _ 4C: 89. 8C 24, 000000B8
        mov     qword [rsp+68H], r14                    ; 2691 _ 4C: 89. 74 24, 68
?_0588: mov     r14d, dword [rsp+90H]                   ; 2696 _ 44: 8B. B4 24, 00000090
        cmp     ebp, 7                                  ; 269E _ 83. FD, 07
        setg    r13b                                    ; 26A1 _ 41: 0F 9F. C5
        test    r14d, r14d                              ; 26A5 _ 45: 85. F6
        sete    r10b                                    ; 26A8 _ 41: 0F 94. C2
        and     r10b, r13b                              ; 26AC _ 45: 20. EA
        mov     r14d, r10d                              ; 26AF _ 45: 89. D6
        jne     ?_0651                                  ; 26B2 _ 0F 85, 00000F5D
?_0589: mov     r9d, dword [rdi-1CH]                    ; 26B8 _ 44: 8B. 4F, E4
        lea     r11, [rel _ZN12_GLOBAL__N_118CounterMoveHistoryE]; 26BC _ 4C: 8D. 1D, 000000C0(rel)
        mov     r14d, dword [rdi-44H]                   ; 26C3 _ 44: 8B. 77, BC
        and     r9d, 3FH                                ; 26C7 _ 41: 83. E1, 3F
        lea     rcx, [r9*4]                             ; 26CB _ 4A: 8D. 0C 8D, 00000000
        and     r14d, 3FH                               ; 26D3 _ 41: 83. E6, 3F
        shl     r9, 12                                  ; 26D7 _ 49: C1. E1, 0C
        mov     r10, rcx                                ; 26DB _ 49: 89. CA
        mov     qword [rsp+0F8H], rcx                   ; 26DE _ 48: 89. 8C 24, 000000F8
        add     rcx, rsi                                ; 26E6 _ 48: 01. F1
        mov     edx, dword [rcx]                        ; 26E9 _ 8B. 11
        lea     rbx, [rbx+r10+14D4H]                    ; 26EB _ 4A: 8D. 9C 13, 000014D4
        mov     qword [rsp+40H], rdi                    ; 26F3 _ 48: 89. 7C 24, 40
        mov     qword [rsp+0F0H], rcx                   ; 26F8 _ 48: 89. 8C 24, 000000F0
        mov     r8, rdx                                 ; 2700 _ 49: 89. D0
        shl     rdx, 8                                  ; 2703 _ 48: C1. E2, 08
        mov     ecx, dword [rbx+rdx]                    ; 2707 _ 8B. 0C 13
        lea     rdx, [rel _ZN12_GLOBAL__N_118CounterMoveHistoryE]; 270A _ 48: 8D. 15, 000000C0(rel)
        shl     r8, 18                                  ; 2711 _ 49: C1. E0, 12
        add     r8, r11                                 ; 2715 _ 4D: 01. D8
        mov     ebx, dword [rsp+90H]                    ; 2718 _ 8B. 9C 24, 00000090
        add     r9, r8                                  ; 271F _ 4D: 01. C1
        mov     r8, qword [rsp+0B8H]                    ; 2722 _ 4C: 8B. 84 24, 000000B8
        mov     rax, r9                                 ; 272A _ 4C: 89. C8
        mov     qword [rsp+0C8H], r9                    ; 272D _ 4C: 89. 8C 24, 000000C8
        mov     r9d, ebp                                ; 2735 _ 41: 89. E9
        mov     dword [rsp+38H], ecx                    ; 2738 _ 89. 4C 24, 38
        mov     r10d, dword [rsi+r14*4]                 ; 273C _ 46: 8B. 14 B6
        shl     r14, 12                                 ; 2740 _ 49: C1. E6, 0C
        mov     rcx, qword [rsp+68H]                    ; 2744 _ 48: 8B. 4C 24, 68
        mov     qword [rsp+28H], rax                    ; 2749 _ 48: 89. 44 24, 28
        mov     qword [rsp+20H], r8                     ; 274E _ 4C: 89. 44 24, 20
        mov     r8d, ebx                                ; 2753 _ 41: 89. D8
        shl     r10, 18                                 ; 2756 _ 49: C1. E2, 12
        add     r10, rdx                                ; 275A _ 49: 01. D2
        mov     rdx, rsi                                ; 275D _ 48: 89. F2
        add     r14, r10                                ; 2760 _ 4D: 01. D6
        mov     qword [rsp+30H], r14                    ; 2763 _ 4C: 89. 74 24, 30
        call    _ZN10MovePickerC1ERK8Position4Move5DepthRK5StatsI5ValueLb0EERKS5_IS6_Lb1EESC_S3_PN6Search5StackE; 2768 _ E8, 00000000(rel)
        lea     r11, [rsp+170H]                         ; 276D _ 4C: 8D. 9C 24, 00000170
        mov     rdx, rsi                                ; 2775 _ 48: 89. F2
        mov     rcx, r11                                ; 2778 _ 4C: 89. D9
        mov     qword [rsp+0E8H], r11                   ; 277B _ 4C: 89. 9C 24, 000000E8
        call    _ZN9CheckInfoC1ERK8Position             ; 2783 _ E8, 00000000(rel)
        mov     eax, dword [rdi+1CH]                    ; 2788 _ 8B. 47, 1C
        mov     r9d, dword [rdi-34H]                    ; 278B _ 44: 8B. 4F, CC
        cmp     eax, r9d                                ; 278F _ 44: 39. C8
        setge   cl                                      ; 2792 _ 0F 9D. C1
        cmp     eax, 32002                              ; 2795 _ 3D, 00007D02
        sete    r10b                                    ; 279A _ 41: 0F 94. C2
        or      r10d, ecx                               ; 279E _ 41: 09. CA
        cmp     r9d, 32002                              ; 27A1 _ 41: 81. F9, 00007D02
        sete    dl                                      ; 27A8 _ 0F 94. C2
        or      r10d, edx                               ; 27AB _ 41: 09. D2
        test    r13b, r13b                              ; 27AE _ 45: 84. ED
        je      ?_0639                                  ; 27B1 _ 0F 84, 00000CD3
        test    ebx, ebx                                ; 27B7 _ 85. DB
        je      ?_0639                                  ; 27B9 _ 0F 84, 00000CCB
        mov     r13d, dword [rsp+70H]                   ; 27BF _ 44: 8B. 6C 24, 70
        mov     byte [rsp+80H], 0                       ; 27C4 _ C6. 84 24, 00000080, 00
        test    r13d, r13d                              ; 27CC _ 45: 85. ED
        jnz     ?_0590                                  ; 27CF _ 75, 2F
        lea     r14d, [r12+270FH]                       ; 27D1 _ 45: 8D. B4 24, 0000270F
        cmp     r14d, 19998                             ; 27D9 _ 41: 81. FE, 00004E1E
        ja      ?_0590                                  ; 27E0 _ 77, 1E
        test    byte [r15+8H], 02H                      ; 27E2 _ 41: F6. 47, 08, 02
        jz      ?_0590                                  ; 27E7 _ 74, 17
        movsx   r8d, byte [r15+9H]                      ; 27E9 _ 45: 0F BE. 47, 09
        lea     ebx, [rbp-3H]                           ; 27EE _ 8D. 5D, FD
        cmp     r8d, ebx                                ; 27F1 _ 41: 39. D8
        setge   byte [rsp+80H]                          ; 27F4 _ 0F 9D. 84 24, 00000080
; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_0590: mov     eax, ebp                                ; 2800 _ 89. E8
        and     r10d, 01H                               ; 2802 _ 41: 83. E2, 01
        movsxd  rcx, ebp                                ; 2806 _ 48: 63. CD
        movzx   r8d, byte [rsp+0B3H]                    ; 2809 _ 44: 0F B6. 84 24, 000000B3
        shr     eax, 31                                 ; 2812 _ C1. E8, 1F
        mov     r9, r10                                 ; 2815 _ 4D: 89. D1
        shl     r10, 14                                 ; 2818 _ 49: C1. E2, 0E
        mov     dword [rsp+60H], -32001                 ; 281C _ C7. 44 24, 60, FFFF82FF
        add     eax, ebp                                ; 2824 _ 01. E8
        shl     r9, 6                                   ; 2826 _ 49: C1. E1, 06
        mov     dword [rsp+9CH], 0                      ; 282A _ C7. 84 24, 0000009C, 00000000
        lea     r11d, [rbp+rbp]                         ; 2835 _ 44: 8D. 5C 2D, 00
        sar     eax, 1                                  ; 283A _ D1. F8
        mov     qword [rsp+0D8H], r15                   ; 283C _ 4C: 89. BC 24, 000000D8
        mov     dword [rsp+108H], eax                   ; 2844 _ 89. 84 24, 00000108
        mov     eax, dword [rsp+94H]                    ; 284B _ 8B. 84 24, 00000094
        sub     r12d, r11d                              ; 2852 _ 45: 29. DC
        mov     ebx, r8d                                ; 2855 _ 44: 89. C3
        lea     rdx, [rel _ZN12_GLOBAL__N_118FutilityMoveCountsE]; 2858 _ 48: 8D. 15, 00410300(rel)
        mov     dword [rsp+100H], r12d                  ; 285F _ 44: 89. A4 24, 00000100
        lea     r12d, [r12-1H]                          ; 2867 _ 45: 8D. 64 24, FF
        add     rdx, r9                                 ; 286C _ 4C: 01. CA
        mov     dword [rsp+10CH], r8d                   ; 286F _ 44: 89. 84 24, 0000010C
        lea     r14, [rel _ZN12_GLOBAL__N_110ReductionsE]; 2877 _ 4C: 8D. 35, 00400300(rel)
        mov     dword [rsp+104H], r12d                  ; 287E _ 44: 89. A4 24, 00000104
        lea     r13, [rdx+rcx*4]                        ; 2886 _ 4C: 8D. 2C 8A
        add     r14, r10                                ; 288A _ 4D: 01. D6
        cmp     ebp, 63                                 ; 288D _ 83. FD, 3F
        mov     r10d, 63                                ; 2890 _ 41: BA, 0000003F
        mov     qword [rsp+88H], r13                    ; 2896 _ 4C: 89. AC 24, 00000088
        cmovle  r10, rbp                                ; 289E _ 4C: 0F 4E. D5
        neg     eax                                     ; 28A2 _ F7. D8
        xor     ebx, 01H                                ; 28A4 _ 83. F3, 01
        movzx   r11d, bl                                ; 28A7 _ 44: 0F B6. DB
        mov     dword [rsp+0B4H], eax                   ; 28AB _ 89. 84 24, 000000B4
        sub     eax, 1                                  ; 28B2 _ 83. E8, 01
        shl     r10, 8                                  ; 28B5 _ 49: C1. E2, 08
        xor     r13d, r13d                              ; 28B9 _ 45: 31. ED
        mov     dword [rsp+0D4H], r11d                  ; 28BC _ 44: 89. 9C 24, 000000D4
        add     r10, r14                                ; 28C4 _ 4D: 01. F2
        mov     dword [rsp+0D0H], eax                   ; 28C7 _ 89. 84 24, 000000D0
        mov     qword [rsp+0C0H], r10                   ; 28CE _ 4C: 89. 94 24, 000000C0
; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_0591: mov     rcx, qword [rsp+68H]                    ; 28E0 _ 48: 8B. 4C 24, 68
        call    _ZN10MovePicker9next_moveEv             ; 28E5 _ E8, 00000000(rel)
        test    eax, eax                                ; 28EA _ 85. C0
        mov     ebx, eax                                ; 28EC _ 89. C3
        je      ?_0618                                  ; 28EE _ 0F 84, 000005DC
        cmp     dword [rsp+70H], ebx                    ; 28F4 _ 39. 5C 24, 70
        jz      ?_0591                                  ; 28F8 _ 74, E6
        lea     r12d, [r13+1H]                          ; 28FA _ 45: 8D. 65, 01
        mov     r9d, ebx                                ; 28FE _ 41: 89. D9
        and     r9d, 0C000H                             ; 2901 _ 41: 81. E1, 0000C000
        mov     dword [rdi+24H], r12d                   ; 2908 _ 44: 89. 67, 24
        mov     dword [rsp+78H], r9d                    ; 290C _ 44: 89. 4C 24, 78
        jne     ?_0624                                  ; 2911 _ 0F 85, 00000685
        mov     r15d, ebx                               ; 2917 _ 41: 89. DF
        and     r15d, 3FH                               ; 291A _ 41: 83. E7, 3F
        mov     edx, dword [rsi+r15*4]                  ; 291E _ 42: 8B. 14 BE
        test    edx, edx                                ; 2922 _ 85. D2
        setne   r14b                                    ; 2924 _ 41: 0F 95. C6
        cmp     qword [rsp+170H], 0                     ; 2928 _ 48: 83. BC 24, 00000170, 00
        jne     ?_0625                                  ; 2931 _ 0F 85, 00000670
        mov     ecx, ebx                                ; 2937 _ 89. D9
        mov     r11, qword [rel .refptr.SquareBB]       ; 2939 _ 4C: 8B. 1D, 00000000(rel)
        sar     ecx, 6                                  ; 2940 _ C1. F9, 06
        and     ecx, 3FH                                ; 2943 _ 83. E1, 3F
        mov     r10d, dword [rsi+rcx*4]                 ; 2946 _ 44: 8B. 14 8E
        and     r10d, 07H                               ; 294A _ 41: 83. E2, 07
        mov     rax, qword [rsp+r10*8+180H]             ; 294E _ 4A: 8B. 84 D4, 00000180
        test    qword [r11+r15*8], rax                  ; 2956 _ 4B: 85. 04 FB
        setne   r15b                                    ; 295A _ 41: 0F 95. C7
?_0592: test    r15b, r15b                              ; 295E _ 45: 84. FF
        jne     ?_0595                                  ; 2961 _ 0F 85, 0000009A
?_0593: cmp     dword [rsp+90H], ebx                    ; 2967 _ 39. 9C 24, 00000090
        jne     ?_0638                                  ; 296E _ 0F 85, 00000B0F
        cmp     byte [rsp+80H], 0                       ; 2974 _ 80. BC 24, 00000080, 00
        je      ?_0638                                  ; 297C _ 0F 84, 00000B01
        mov     r8, qword [rsp+178H]                    ; 2982 _ 4C: 8B. 84 24, 00000178
        mov     edx, ebx                                ; 298A _ 89. DA
        mov     rcx, rsi                                ; 298C _ 48: 89. F1
        call    _ZNK8Position5legalE4Movey              ; 298F _ E8, 00000000(rel)
        test    al, al                                  ; 2994 _ 84. C0
        je      ?_0638                                  ; 2996 _ 0F 84, 00000AE7
        mov     r8d, dword [rsp+10CH]                   ; 299C _ 44: 8B. 84 24, 0000010C
        mov     dword [rdi+10H], ebx                    ; 29A4 _ 89. 5F, 10
        mov     rdx, rdi                                ; 29A7 _ 48: 89. FA
        mov     rcx, rsi                                ; 29AA _ 48: 89. F1
        mov     r9d, dword [rsp+108H]                   ; 29AD _ 44: 8B. 8C 24, 00000108
        mov     byte [rdi+20H], 1                       ; 29B5 _ C6. 47, 20, 01
        mov     dword [rsp+28H], r8d                    ; 29B9 _ 44: 89. 44 24, 28
        mov     r8d, dword [rsp+104H]                   ; 29BE _ 44: 8B. 84 24, 00000104
        mov     dword [rsp+20H], r9d                    ; 29C6 _ 44: 89. 4C 24, 20
        mov     r9d, dword [rsp+100H]                   ; 29CB _ 44: 8B. 8C 24, 00000100
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 29D3 _ E8, FFFFF778
        xor     edx, edx                                ; 29D8 _ 31. D2
        mov     byte [rdi+20H], 0                       ; 29DA _ C6. 47, 20, 00
        cmp     eax, dword [rsp+100H]                   ; 29DE _ 3B. 84 24, 00000100
        mov     dword [rdi+10H], 0                      ; 29E5 _ C7. 47, 10, 00000000
        setl    dl                                      ; 29EC _ 0F 9C. C2
        jmp     ?_0596                                  ; 29EF _ EB, 27

?_0594: movzx   eax, word [rax+2H]                      ; 29F1 _ 0F B7. 40, 02
        mov     dword [rsp+90H], eax                    ; 29F5 _ 89. 84 24, 00000090
        jmp     ?_0574                                  ; 29FC _ E9, FFFFF984

?_0595: mov     edx, ebx                                ; 2A01 _ 89. DA
        mov     rcx, rsi                                ; 2A03 _ 48: 89. F1
        call    _ZNK8Position8see_signE4Move            ; 2A06 _ E8, 00000000(rel)
        mov     edx, 1                                  ; 2A0B _ BA, 00000001
        test    eax, eax                                ; 2A10 _ 85. C0
        js      ?_0593                                  ; 2A12 _ 0F 88, FFFFFF4F
?_0596: movzx   r10d, byte [rsp+58H]                    ; 2A18 _ 44: 0F B6. 54 24, 58
        lea     ecx, [rdx+rbp-1H]                       ; 2A1E _ 8D. 4C 2A, FF
        mov     dword [rsp+50H], ecx                    ; 2A22 _ 89. 4C 24, 50
        xor     r10d, 01H                               ; 2A26 _ 41: 83. F2, 01
        cmp     r10b, r14b                              ; 2A2A _ 45: 38. F2
        jbe     ?_0601                                  ; 2A2D _ 0F 86, 000000EA
        test    r15b, r15b                              ; 2A33 _ 45: 84. FF
        jne     ?_0601                                  ; 2A36 _ 0F 85, 000000E1
        mov     eax, ebx                                ; 2A3C _ 89. D8
        sar     eax, 6                                  ; 2A3E _ C1. F8, 06
        and     eax, 3FH                                ; 2A41 _ 83. E0, 3F
        mov     r11d, dword [rsi+rax*4]                 ; 2A44 _ 44: 8B. 1C 86
        mov     r8d, r11d                               ; 2A48 _ 45: 89. D8
        and     r8d, 07H                                ; 2A4B _ 41: 83. E0, 07
        cmp     r8d, 1                                  ; 2A4F _ 41: 83. F8, 01
        je      ?_0611                                  ; 2A53 _ 0F 84, 000002B7
?_0597: cmp     dword [rsp+60H], -31743                 ; 2A59 _ 81. 7C 24, 60, FFFF8401
        jl      ?_0601                                  ; 2A61 _ 0F 8C, 000000B6
        cmp     ebp, 15                                 ; 2A67 _ 83. FD, 0F
        jg      ?_0600                                  ; 2A6A _ 7F, 51
        mov     r10, qword [rsp+88H]                    ; 2A6C _ 4C: 8B. 94 24, 00000088
        cmp     r12d, dword [r10]                       ; 2A74 _ 45: 3B. 22
        jl      ?_0599                                  ; 2A77 _ 7C, 08
?_0598: mov     r13d, r12d                              ; 2A79 _ 45: 89. E5
        jmp     ?_0591                                  ; 2A7C _ E9, FFFFFE5F

?_0599: cmp     ebp, 4                                  ; 2A81 _ 83. FD, 04
        jg      ?_0600                                  ; 2A84 _ 7F, 37
        cmp     dword [rdi+14H], ebx                    ; 2A86 _ 39. 5F, 14
        jz      ?_0600                                  ; 2A89 _ 74, 32
        mov     r8, qword [rsp+0B8H]                    ; 2A8B _ 4C: 8B. 84 24, 000000B8
        mov     eax, ebx                                ; 2A93 _ 89. D8
        shl     r11, 8                                  ; 2A95 _ 49: C1. E3, 08
        and     eax, 3FH                                ; 2A99 _ 83. E0, 3F
        shl     rax, 2                                  ; 2A9C _ 48: C1. E0, 02
        add     r8, rax                                 ; 2AA0 _ 49: 01. C0
        mov     r9d, dword [r8+r11]                     ; 2AA3 _ 47: 8B. 0C 18
        test    r9d, r9d                                ; 2AA7 _ 45: 85. C9
        jns     ?_0600                                  ; 2AAA _ 79, 11
        add     r11, qword [rsp+0C8H]                   ; 2AAC _ 4C: 03. 9C 24, 000000C8
        mov     r11d, dword [r11+rax]                   ; 2AB4 _ 45: 8B. 1C 03
        test    r11d, r11d                              ; 2AB8 _ 45: 85. DB
        js      ?_0598                                  ; 2ABB _ 78, BC
?_0600: cmp     r12d, 63                                ; 2ABD _ 41: 83. FC, 3F
        mov     eax, 63                                 ; 2AC1 _ B8, 0000003F
        mov     rcx, qword [rsp+0C0H]                   ; 2AC6 _ 48: 8B. 8C 24, 000000C0
        cmovle  eax, r12d                               ; 2ACE _ 41: 0F 4E. C4
        mov     edx, dword [rsp+50H]                    ; 2AD2 _ 8B. 54 24, 50
        cdqe                                            ; 2AD6 _ 48: 98
        sub     edx, dword [rcx+rax*4]                  ; 2AD8 _ 2B. 14 81
        js      ?_0674                                  ; 2ADB _ 0F 88, 00000D1A
        cmp     edx, 6                                  ; 2AE1 _ 83. FA, 06
        jg      ?_0601                                  ; 2AE4 _ 7F, 37
        imul    r10d, edx, 200                          ; 2AE6 _ 44: 69. D2, 000000C8
        add     r10d, dword [rdi+1CH]                   ; 2AED _ 44: 03. 57, 1C
        add     r10d, 256                               ; 2AF1 _ 41: 81. C2, 00000100
        cmp     r10d, dword [rsp+94H]                   ; 2AF8 _ 44: 3B. 94 24, 00000094
        jle     ?_0620                                  ; 2B00 _ 0F 8E, 0000042A
        cmp     edx, 3                                  ; 2B06 _ 83. FA, 03
        jg      ?_0601                                  ; 2B09 _ 7F, 12
        mov     edx, ebx                                ; 2B0B _ 89. DA
        mov     rcx, rsi                                ; 2B0D _ 48: 89. F1
        call    _ZNK8Position8see_signE4Move            ; 2B10 _ E8, 00000000(rel)
        test    eax, eax                                ; 2B15 _ 85. C0
        js      ?_0598                                  ; 2B17 _ 0F 88, FFFFFF5C
?_0601: mov     edx, ebx                                ; 2B1D _ 89. DA
        mov     rcx, rsi                                ; 2B1F _ 48: 89. F1
        call    _ZNK8Position9key_afterE4Move           ; 2B22 _ E8, 00000000(rel)
        mov     r8, qword [rel .refptr.TT]              ; 2B27 _ 4C: 8B. 05, 00000000(rel)
        mov     edx, ebx                                ; 2B2E _ 89. DA
        mov     rcx, qword [rel .refptr.TT]             ; 2B30 _ 48: 8B. 0D, 00000000(rel)
        mov     r9, qword [r8]                          ; 2B37 _ 4D: 8B. 08
        mov     r8, qword [rsp+178H]                    ; 2B3A _ 4C: 8B. 84 24, 00000178
        lea     r11, [r9-1H]                            ; 2B42 _ 4D: 8D. 59, FF
        mov     qword [rsp+0A8H], r9                    ; 2B46 _ 4C: 89. 8C 24, 000000A8
        and     rax, r11                                ; 2B4E _ 4C: 21. D8
        shl     rax, 5                                  ; 2B51 _ 48: C1. E0, 05
        add     rax, qword [rcx+8H]                     ; 2B55 _ 48: 03. 41, 08
        mov     rcx, rsi                                ; 2B59 _ 48: 89. F1
        prefetcht0 [rax]                                ; 2B5C _ 0F 18. 08
        call    _ZNK8Position5legalE4Movey              ; 2B5F _ E8, 00000000(rel)
        test    al, al                                  ; 2B64 _ 84. C0
        mov     byte [rsp+0A8H], al                     ; 2B66 _ 88. 84 24, 000000A8
        je      ?_0623                                  ; 2B6D _ 0F 84, 0000041D
        mov     edx, ebx                                ; 2B73 _ 89. DA
        mov     dword [rdi+0CH], ebx                    ; 2B75 _ 89. 5F, 0C
        movzx   r9d, r15b                               ; 2B78 _ 45: 0F B6. CF
        mov     rcx, rsi                                ; 2B7C _ 48: 89. F1
        lea     r8, [rsp+120H]                          ; 2B7F _ 4C: 8D. 84 24, 00000120
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 2B87 _ E8, 00000000(rel)
        lea     rdx, [rdi+28H]                          ; 2B8C _ 48: 8D. 57, 28
        cmp     ebp, 2                                  ; 2B90 _ 83. FD, 02
        jg      ?_0612                                  ; 2B93 _ 0F 8F, 0000019A
?_0602: mov     eax, dword [rsp+50H]                    ; 2B99 _ 8B. 44 24, 50
        test    eax, eax                                ; 2B9D _ 85. C0
        jle     ?_0616                                  ; 2B9F _ 0F 8E, 000002DB
        mov     r10d, dword [rsp+0D4H]                  ; 2BA5 _ 44: 8B. 94 24, 000000D4
        mov     rcx, rsi                                ; 2BAD _ 48: 89. F1
        mov     r15d, dword [rsp+50H]                   ; 2BB0 _ 44: 8B. 7C 24, 50
        mov     r9d, dword [rsp+0B4H]                   ; 2BB5 _ 44: 8B. 8C 24, 000000B4
        mov     r8d, dword [rsp+0D0H]                   ; 2BBD _ 44: 8B. 84 24, 000000D0
        mov     dword [rsp+28H], r10d                   ; 2BC5 _ 44: 89. 54 24, 28
        mov     dword [rsp+20H], r15d                   ; 2BCA _ 44: 89. 7C 24, 20
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 2BCF _ E8, FFFFF57C
        neg     eax                                     ; 2BD4 _ F7. D8
        mov     r13d, eax                               ; 2BD6 _ 41: 89. C5
?_0603: mov     edx, ebx                                ; 2BD9 _ 89. DA
        mov     rcx, rsi                                ; 2BDB _ 48: 89. F1
        call    _ZN8Position9undo_moveE4Move            ; 2BDE _ E8, 00000000(rel)
        movzx   r8d, byte [rel _ZN6Search7SignalsE]     ; 2BE3 _ 44: 0F B6. 05, 00000098(rel)
        test    r8b, r8b                                ; 2BEB _ 45: 84. C0
        jne     Unnamed_4_12D4                          ; 2BEE _ 0F 85, 000012D4(rel)
        cmp     r13d, dword [rsp+60H]                   ; 2BF4 _ 44: 3B. 6C 24, 60
        jle     ?_0610                                  ; 2BF9 _ 0F 8E, 000000D6
        cmp     r13d, dword [rsp+94H]                   ; 2BFF _ 44: 3B. AC 24, 00000094
        jle     ?_0609                                  ; 2C07 _ 0F 8E, 000000C3
        mov     r11d, dword [rsp+78H]                   ; 2C0D _ 44: 8B. 5C 24, 78
        mov     eax, r13d                               ; 2C12 _ 44: 89. E8
        mov     r15, qword [rsp+0D8H]                   ; 2C15 _ 4C: 8B. BC 24, 000000D8
        test    r11d, r11d                              ; 2C1D _ 45: 85. DB
        jne     ?_0647                                  ; 2C20 _ 0F 85, 000009A3
        mov     edx, ebx                                ; 2C26 _ 89. DA
        and     edx, 3FH                                ; 2C28 _ 83. E2, 3F
        mov     r10d, dword [rsi+rdx*4]                 ; 2C2B _ 44: 8B. 14 96
        test    r10d, r10d                              ; 2C2F _ 45: 85. D2
        setne   r13b                                    ; 2C32 _ 41: 0F 95. C5
?_0604: test    r13b, r13b                              ; 2C36 _ 45: 84. ED
        je      ?_0619                                  ; 2C39 _ 0F 84, 000002B4
        mov     r14d, dword [rdi+8H]                    ; 2C3F _ 44: 8B. 77, 08
?_0605: cmp     eax, dword [rsp+98H]                    ; 2C43 _ 3B. 84 24, 00000098
        mov     rsi, qword [rel .refptr.TT]             ; 2C4A _ 48: 8B. 35, 00000000(rel)
        mov     r12d, dword [rdi+1CH]                   ; 2C51 _ 44: 8B. 67, 1C
        setge   dil                                     ; 2C55 _ 40: 0F 9D. C7
        cmp     eax, 31743                              ; 2C59 _ 3D, 00007BFF
        movzx   r9d, byte [rsi+18H]                     ; 2C5E _ 44: 0F B6. 4E, 18
        lea     ecx, [rdi+1H]                           ; 2C63 _ 8D. 4F, 01
        jg      ?_0657                                  ; 2C66 _ 0F 8F, 00000A86
        cmp     eax, 4294935553                         ; 2C6C _ 3D, FFFF8401
        jl      ?_0658                                  ; 2C71 _ 0F 8C, 00000A83
        mov     r14d, eax                               ; 2C77 _ 41: 89. C6
?_0606: mov     rdx, qword [rsp+0A0H]                   ; 2C7A _ 48: 8B. 94 24, 000000A0
        movzx   r10d, word [r15]                        ; 2C82 _ 45: 0F B7. 17
        shr     rdx, 48                                 ; 2C86 _ 48: C1. EA, 30
        test    ebx, ebx                                ; 2C8A _ 85. DB
        je      ?_0617                                  ; 2C8C _ 0F 84, 00000221
        cmp     rdx, r10                                ; 2C92 _ 4C: 39. D2
        mov     word [r15+2H], bx                       ; 2C95 _ 66 41: 89. 5F, 02
        jne     ?_0642                                  ; 2C9A _ 0F 85, 000008CB
?_0607: movsx   r13d, byte [r15+9H]                     ; 2CA0 _ 45: 0F BE. 6F, 09
        sub     r13d, 1                                 ; 2CA5 _ 41: 83. ED, 01
        cmp     ebp, r13d                               ; 2CA9 _ 44: 39. ED
        jl      ?_0572                                  ; 2CAC _ 0F 8C, FFFFF6AE
?_0608: or      ecx, r9d                                ; 2CB2 _ 44: 09. C9
        mov     word [r15], r10w                        ; 2CB5 _ 66 45: 89. 17
        mov     word [r15+4H], r14w                     ; 2CB9 _ 66 45: 89. 77, 04
        mov     word [r15+6H], r12w                     ; 2CBE _ 66 45: 89. 67, 06
        mov     byte [r15+8H], cl                       ; 2CC3 _ 41: 88. 4F, 08
        mov     byte [r15+9H], bpl                      ; 2CC7 _ 41: 88. 6F, 09
        jmp     ?_0572                                  ; 2CCB _ E9, FFFFF690

?_0609: mov     dword [rsp+60H], r13d                   ; 2CD0 _ 44: 89. 6C 24, 60
?_0610: cmp     dword [rsp+9CH], 63                     ; 2CD5 _ 83. BC 24, 0000009C, 3F
        setle   r9b                                     ; 2CDD _ 41: 0F 9E. C1
        cmp     r14b, r9b                               ; 2CE1 _ 45: 38. CE
        jnc     ?_0598                                  ; 2CE4 _ 0F 83, FFFFFD8F
        mov     r14d, dword [rsp+9CH]                   ; 2CEA _ 44: 8B. B4 24, 0000009C
        movsxd  rcx, r14d                               ; 2CF2 _ 49: 63. CE
        mov     dword [rsp+rcx*4+1D0H], ebx             ; 2CF5 _ 89. 9C 8C, 000001D0
        mov     ebx, r14d                               ; 2CFC _ 44: 89. F3
        add     ebx, 1                                  ; 2CFF _ 83. C3, 01
        mov     dword [rsp+9CH], ebx                    ; 2D02 _ 89. 9C 24, 0000009C
        jmp     ?_0598                                  ; 2D09 _ E9, FFFFFD6B

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_0611: mov     edx, dword [rsi+3ACH]                   ; 2D10 _ 8B. 96, 000003AC
        shr     rax, 3                                  ; 2D16 _ 48: C1. E8, 03
        lea     ecx, [rdx*8]                            ; 2D1A _ 8D. 0C D5, 00000000
        sub     ecx, edx                                ; 2D21 _ 29. D1
        xor     ecx, eax                                ; 2D23 _ 31. C1
        cmp     ecx, 3                                  ; 2D25 _ 83. F9, 03
        jbe     ?_0597                                  ; 2D28 _ 0F 86, FFFFFD2B
        jmp     ?_0601                                  ; 2D2E _ E9, FFFFFDEA

?_0612: lea     rdx, [rdi+28H]                          ; 2D33 _ 48: 8D. 57, 28
        cmp     r12d, 1                                 ; 2D37 _ 41: 83. FC, 01
        setg    r13b                                    ; 2D3B _ 41: 0F 9F. C5
        cmp     r14b, r13b                              ; 2D3F _ 45: 38. EE
        jnc     ?_0602                                  ; 2D42 _ 0F 83, FFFFFE51
        cmp     r12d, 63                                ; 2D48 _ 41: 83. FC, 3F
        mov     eax, 63                                 ; 2D4C _ B8, 0000003F
        mov     r8d, ebx                                ; 2D51 _ 41: 89. D8
        mov     rcx, qword [rsp+0B8H]                   ; 2D54 _ 48: 8B. 8C 24, 000000B8
        cmovle  eax, r12d                               ; 2D5C _ 41: 0F 4E. C4
        and     r8d, 3FH                                ; 2D60 _ 41: 83. E0, 3F
        mov     rdx, qword [rsp+0C0H]                   ; 2D64 _ 48: 8B. 94 24, 000000C0
        movsxd  r11, r8d                                ; 2D6C _ 4D: 63. D8
        mov     r13d, dword [rsi+r11*4]                 ; 2D6F _ 46: 8B. 2C 9E
        shl     r11, 2                                  ; 2D73 _ 49: C1. E3, 02
        cdqe                                            ; 2D77 _ 48: 98
        add     rcx, r11                                ; 2D79 _ 4C: 01. D9
        mov     r10d, dword [rdx+rax*4]                 ; 2D7C _ 44: 8B. 14 82
        mov     r9, r13                                 ; 2D80 _ 4D: 89. E9
        shl     r13, 8                                  ; 2D83 _ 49: C1. E5, 08
        mov     ecx, dword [rcx+r13]                    ; 2D87 _ 42: 8B. 0C 29
        add     r13, qword [rsp+0C8H]                   ; 2D8B _ 4C: 03. AC 24, 000000C8
        cmp     byte [rsp+0B3H], 0                      ; 2D93 _ 80. BC 24, 000000B3, 00
        mov     eax, dword [r13+r11]                    ; 2D9B _ 43: 8B. 44 1D, 00
        jnz     ?_0613                                  ; 2DA0 _ 75, 0D
        test    eax, eax                                ; 2DA2 _ 85. C0
        jg      ?_0614                                  ; 2DA4 _ 7F, 0D
        mov     edx, ecx                                ; 2DA6 _ 89. CA
        shr     edx, 31                                 ; 2DA8 _ C1. EA, 1F
        test    dl, dl                                  ; 2DAB _ 84. D2
        jz      ?_0614                                  ; 2DAD _ 74, 04
?_0613: add     r10d, 1                                 ; 2DAF _ 41: 83. C2, 01
?_0614: add     ecx, eax                                ; 2DB3 _ 01. C1
        mov     r11d, 1174378241                        ; 2DB5 _ 41: BB, 45FF9701
        mov     eax, ecx                                ; 2DBB _ 89. C8
        sar     ecx, 31                                 ; 2DBD _ C1. F9, 1F
        imul    r11d                                    ; 2DC0 _ 41: F7. EB
        sar     edx, 12                                 ; 2DC3 _ C1. FA, 0C
        sub     edx, ecx                                ; 2DC6 _ 29. CA
        sub     r10d, edx                               ; 2DC8 _ 41: 29. D2
        test    r10d, r10d                              ; 2DCB _ 45: 85. D2
        mov     r13d, r10d                              ; 2DCE _ 45: 89. D5
        jle     ?_0626                                  ; 2DD1 _ 0F 8E, 000001EA
        mov     r10d, dword [rsp+78H]                   ; 2DD7 _ 44: 8B. 54 24, 78
        test    r10d, r10d                              ; 2DDC _ 45: 85. D2
        jnz     ?_0615                                  ; 2DDF _ 75, 29
        and     r9d, 07H                                ; 2DE1 _ 41: 83. E1, 07
        cmp     r9d, 1                                  ; 2DE5 _ 41: 83. F9, 01
        jz      ?_0615                                  ; 2DE9 _ 74, 1F
        mov     edx, ebx                                ; 2DEB _ 89. DA
        shl     r8d, 6                                  ; 2DED _ 41: C1. E0, 06
        mov     rcx, rsi                                ; 2DF1 _ 48: 89. F1
        sar     edx, 6                                  ; 2DF4 _ C1. FA, 06
        and     edx, 3FH                                ; 2DF7 _ 83. E2, 3F
        or      edx, r8d                                ; 2DFA _ 44: 09. C2
        call    _ZNK8Position3seeE4Move                 ; 2DFD _ E8, 00000000(rel)
        test    eax, eax                                ; 2E02 _ 85. C0
        js      ?_0646                                  ; 2E04 _ 0F 88, 0000079F
?_0615: mov     r9d, dword [rsp+50H]                    ; 2E0A _ 44: 8B. 4C 24, 50
        lea     r11, [rdi+28H]                          ; 2E0F _ 4C: 8D. 5F, 28
        mov     ecx, 1                                  ; 2E13 _ B9, 00000001
        mov     dword [rsp+28H], 1                      ; 2E18 _ C7. 44 24, 28, 00000001
        mov     r8d, dword [rsp+0D0H]                   ; 2E20 _ 44: 8B. 84 24, 000000D0
        mov     rdx, r11                                ; 2E28 _ 4C: 89. DA
        mov     qword [rsp+0E0H], r11                   ; 2E2B _ 4C: 89. 9C 24, 000000E0
        sub     r9d, r13d                               ; 2E33 _ 45: 29. E9
        test    r9d, r9d                                ; 2E36 _ 45: 85. C9
        cmovle  r9d, ecx                                ; 2E39 _ 44: 0F 4E. C9
        mov     rcx, rsi                                ; 2E3D _ 48: 89. F1
        mov     dword [rsp+20H], r9d                    ; 2E40 _ 44: 89. 4C 24, 20
        mov     r9d, dword [rsp+0B4H]                   ; 2E45 _ 44: 8B. 8C 24, 000000B4
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 2E4D _ E8, FFFFF2FE
        neg     eax                                     ; 2E52 _ F7. D8
        cmp     eax, dword [rsp+94H]                    ; 2E54 _ 3B. 84 24, 00000094
        mov     r13d, eax                               ; 2E5B _ 41: 89. C5
        jle     ?_0603                                  ; 2E5E _ 0F 8E, FFFFFD75
        cmp     byte [rsp+0A8H], 0                      ; 2E64 _ 80. BC 24, 000000A8, 00
        mov     rdx, qword [rsp+0E0H]                   ; 2E6C _ 48: 8B. 94 24, 000000E0
        jne     ?_0602                                  ; 2E74 _ 0F 85, FFFFFD1F
        jmp     ?_0603                                  ; 2E7A _ E9, FFFFFD5A

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_0616: test    r15b, r15b                              ; 2E80 _ 45: 84. FF
        mov     dword [rsp+20H], 0                      ; 2E83 _ C7. 44 24, 20, 00000000
        mov     rcx, rsi                                ; 2E8B _ 48: 89. F1
        mov     r9d, dword [rsp+0B4H]                   ; 2E8E _ 44: 8B. 8C 24, 000000B4
        mov     r8d, dword [rsp+0D0H]                   ; 2E96 _ 44: 8B. 84 24, 000000D0
        jne     ?_0641                                  ; 2E9E _ 0F 85, 000006B8
        call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 2EA4 _ E8, FFFFE777
        neg     eax                                     ; 2EA9 _ F7. D8
        mov     r13d, eax                               ; 2EAB _ 41: 89. C5
        jmp     ?_0603                                  ; 2EAE _ E9, FFFFFD26

?_0617: cmp     rdx, r10                                ; 2EB3 _ 4C: 39. D2
        je      ?_0607                                  ; 2EB6 _ 0F 84, FFFFFDE4
        xor     ebx, ebx                                ; 2EBC _ 31. DB
        mov     r10, rdx                                ; 2EBE _ 49: 89. D2
        mov     word [r15+2H], bx                       ; 2EC1 _ 66 41: 89. 5F, 02
        jmp     ?_0608                                  ; 2EC6 _ E9, FFFFFDE7

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_0618: test    r13d, r13d                              ; 2ED0 _ 45: 85. ED
        mov     r15, qword [rsp+0D8H]                   ; 2ED3 _ 4C: 8B. BC 24, 000000D8
        mov     eax, dword [rsp+60H]                    ; 2EDB _ 8B. 44 24, 60
        je      ?_0659                                  ; 2EDF _ 0F 84, 00000823
        cmp     ebp, 2                                  ; 2EE5 _ 83. FD, 02
        jg      ?_0621                                  ; 2EE8 _ 7F, 5B
        mov     r14d, dword [rdi+8H]                    ; 2EEA _ 44: 8B. 77, 08
        jmp     ?_0605                                  ; 2EEE _ E9, FFFFFD50

?_0619: mov     dword [rsp+50H], eax                    ; 2EF3 _ 89. 44 24, 50
        mov     r9d, ebp                                ; 2EF7 _ 41: 89. E9
        mov     rdx, rdi                                ; 2EFA _ 48: 89. FA
        mov     rcx, rsi                                ; 2EFD _ 48: 89. F1
        mov     eax, dword [rsp+9CH]                    ; 2F00 _ 8B. 84 24, 0000009C
        lea     r8, [rsp+1D0H]                          ; 2F07 _ 4C: 8D. 84 24, 000001D0
        mov     qword [rsp+20H], r8                     ; 2F0F _ 4C: 89. 44 24, 20
        mov     r8d, ebx                                ; 2F14 _ 41: 89. D8
        mov     dword [rsp+28H], eax                    ; 2F17 _ 89. 44 24, 28
        call    _ZN12_GLOBAL__N_112update_statsERK8PositionPN6Search5StackE4Move5DepthPS6_i; 2F1B _ E8, FFFFEDE0
        mov     r14d, dword [rdi+8H]                    ; 2F20 _ 44: 8B. 77, 08
        mov     eax, dword [rsp+50H]                    ; 2F24 _ 8B. 44 24, 50
        jmp     ?_0605                                  ; 2F28 _ E9, FFFFFD16

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_0620: mov     ebx, dword [rsp+60H]                    ; 2F30 _ 8B. 5C 24, 60
        cmp     ebx, r10d                               ; 2F34 _ 44: 39. D3
        cmovge  r10d, ebx                               ; 2F37 _ 44: 0F 4D. D3
        mov     dword [rsp+60H], r10d                   ; 2F3B _ 44: 89. 54 24, 60
        jmp     ?_0598                                  ; 2F40 _ E9, FFFFFB34

?_0621: cmp     byte [rsp+58H], 0                       ; 2F45 _ 80. 7C 24, 58, 00
        je      ?_0640                                  ; 2F4A _ 0F 84, 00000547
        mov     r14d, dword [rdi+8H]                    ; 2F50 _ 44: 8B. 77, 08
        jmp     ?_0605                                  ; 2F54 _ E9, FFFFFCEA

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_0622: cmp     ebp, 7                                  ; 2F60 _ 83. FD, 07
        mov     dword [rdi+1CH], 32002                  ; 2F63 _ C7. 47, 1C, 00007D02
        lea     r14, [rbx+4D4H]                         ; 2F6A _ 4C: 8D. B3, 000004D4
        setg    r13b                                    ; 2F71 _ 41: 0F 9F. C5
        lea     rax, [rsp+2D0H]                         ; 2F75 _ 48: 8D. 84 24, 000002D0
        mov     qword [rsp+0B8H], r14                   ; 2F7D _ 4C: 89. B4 24, 000000B8
        mov     qword [rsp+68H], rax                    ; 2F85 _ 48: 89. 44 24, 68
        jmp     ?_0589                                  ; 2F8A _ E9, FFFFF729

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_0623: mov     dword [rdi+24H], r13d                   ; 2F90 _ 44: 89. 6F, 24
        mov     r12d, r13d                              ; 2F94 _ 45: 89. EC
        jmp     ?_0598                                  ; 2F97 _ E9, FFFFFADD

?_0624: cmp     r9d, 49152                              ; 2F9C _ 41: 81. F9, 0000C000
        setne   r14b                                    ; 2FA3 _ 41: 0F 95. C6
?_0625: mov     r8, qword [rsp+0E8H]                    ; 2FA7 _ 4C: 8B. 84 24, 000000E8
        mov     edx, ebx                                ; 2FAF _ 89. DA
        mov     rcx, rsi                                ; 2FB1 _ 48: 89. F1
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 2FB4 _ E8, 00000000(rel)
        mov     r15d, eax                               ; 2FB9 _ 41: 89. C7
        jmp     ?_0592                                  ; 2FBC _ E9, FFFFF99D

?_0626: mov     byte [rsp+0A8H], 0                      ; 2FC1 _ C6. 84 24, 000000A8, 00
        xor     r13d, r13d                              ; 2FC9 _ 45: 31. ED
        jmp     ?_0615                                  ; 2FCC _ E9, FFFFFE39

?_0627: mov     ecx, dword [rsp+98H]                    ; 2FD1 _ 8B. 8C 24, 00000098
        add     ecx, 31743                              ; 2FD8 _ 81. C1, 00007BFF
        cmp     ecx, 63486                              ; 2FDE _ 81. F9, 0000F7FE
        ja      _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb.cold.214; 2FE4 _ 0F 87, 00001108(rel)
        mov     r13, qword [rsi+3B8H]                   ; 2FEA _ 4C: 8B. AE, 000003B8
        lea     eax, [rbp-4H]                           ; 2FF1 _ 8D. 45, FC
        mov     r14d, 32001                             ; 2FF4 _ 41: BE, 00007D01
        mov     r10d, dword [rsp+98H]                   ; 2FFA _ 44: 8B. 94 24, 00000098
        lea     r8, [rsp+2D0H]                          ; 3002 _ 4C: 8D. 84 24, 000002D0
        mov     dword [rsp+60H], eax                    ; 300A _ 89. 44 24, 60
        mov     qword [rsp+68H], r8                     ; 300E _ 4C: 89. 44 24, 68
        lea     rdx, [rbx+4D4H]                         ; 3013 _ 48: 8D. 93, 000004D4
        mov     rcx, r8                                 ; 301A _ 4C: 89. C1
        mov     r8d, dword [rsp+90H]                    ; 301D _ 44: 8B. 84 24, 00000090
        mov     r9, rdx                                 ; 3025 _ 49: 89. D1
        mov     qword [rsp+0B8H], rdx                   ; 3028 _ 48: 89. 94 24, 000000B8
        mov     rdx, rsi                                ; 3030 _ 48: 89. F2
        mov     r11d, dword [r13+40H]                   ; 3033 _ 45: 8B. 5D, 40
        add     r10d, 200                               ; 3037 _ 41: 81. C2, 000000C8
        cmp     r10d, 32001                             ; 303E _ 41: 81. FA, 00007D01
        cmovle  r14d, r10d                              ; 3045 _ 45: 0F 4E. F2
        mov     r10, qword [rel .refptr.PieceValue]     ; 3049 _ 4C: 8B. 15, 00000000(rel)
        mov     eax, dword [r10+r11*4]                  ; 3050 _ 43: 8B. 04 9A
        mov     dword [rsp+20H], eax                    ; 3054 _ 89. 44 24, 20
        call    _ZN10MovePickerC1ERK8Position4MoveRK5StatsI5ValueLb0EES5_; 3058 _ E8, 00000000(rel)
        lea     r9, [rsp+1D0H]                          ; 305D _ 4C: 8D. 8C 24, 000001D0
        mov     rdx, rsi                                ; 3065 _ 48: 89. F2
        mov     rcx, r9                                 ; 3068 _ 4C: 89. C9
        mov     qword [rsp+78H], r9                     ; 306B _ 4C: 89. 4C 24, 78
        call    _ZN9CheckInfoC1ERK8Position             ; 3070 _ E8, 00000000(rel)
        mov     edx, 1                                  ; 3075 _ BA, 00000001
        mov     r8d, r14d                               ; 307A _ 45: 89. F0
        movzx   r13d, byte [rsp+0B3H]                   ; 307D _ 44: 0F B6. AC 24, 000000B3
        lea     rcx, [rsp+120H]                         ; 3086 _ 48: 8D. 8C 24, 00000120
        sub     edx, r14d                               ; 308E _ 44: 29. F2
        neg     r8d                                     ; 3091 _ 41: F7. D8
        mov     qword [rsp+80H], rcx                    ; 3094 _ 48: 89. 8C 24, 00000080
        mov     dword [rsp+88H], edx                    ; 309C _ 89. 94 24, 00000088
        xor     r13d, 01H                               ; 30A3 _ 41: 83. F5, 01
        mov     dword [rsp+9CH], r8d                    ; 30A7 _ 44: 89. 84 24, 0000009C
        movzx   r11d, r13b                              ; 30AF _ 45: 0F B6. DD
        mov     dword [rsp+0A8H], r11d                  ; 30B3 _ 44: 89. 9C 24, 000000A8
?_0628: mov     rcx, qword [rsp+68H]                    ; 30BB _ 48: 8B. 4C 24, 68
        call    _ZN10MovePicker9next_moveEv             ; 30C0 _ E8, 00000000(rel)
        test    eax, eax                                ; 30C5 _ 85. C0
        mov     r13d, eax                               ; 30C7 _ 41: 89. C5
        je      ?_0588                                  ; 30CA _ 0F 84, FFFFF5C6
        mov     r8, qword [rsp+1D8H]                    ; 30D0 _ 4C: 8B. 84 24, 000001D8
        mov     edx, r13d                               ; 30D8 _ 44: 89. EA
        mov     rcx, rsi                                ; 30DB _ 48: 89. F1
        call    _ZNK8Position5legalE4Movey              ; 30DE _ E8, 00000000(rel)
        test    al, al                                  ; 30E3 _ 84. C0
        jz      ?_0628                                  ; 30E5 _ 74, D4
        mov     r8, qword [rsp+78H]                     ; 30E7 _ 4C: 8B. 44 24, 78
        mov     edx, r13d                               ; 30EC _ 44: 89. EA
        mov     rcx, rsi                                ; 30EF _ 48: 89. F1
        mov     dword [rdi+0CH], r13d                   ; 30F2 _ 44: 89. 6F, 0C
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 30F6 _ E8, 00000000(rel)
        mov     r8, qword [rsp+80H]                     ; 30FB _ 4C: 8B. 84 24, 00000080
        mov     edx, r13d                               ; 3103 _ 44: 89. EA
        mov     rcx, rsi                                ; 3106 _ 48: 89. F1
        movzx   r9d, al                                 ; 3109 _ 44: 0F B6. C8
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 310D _ E8, 00000000(rel)
        mov     r8d, dword [rsp+0A8H]                   ; 3112 _ 44: 8B. 84 24, 000000A8
        lea     rdx, [rdi+28H]                          ; 311A _ 48: 8D. 57, 28
        mov     rcx, rsi                                ; 311E _ 48: 89. F1
        mov     r11d, dword [rsp+60H]                   ; 3121 _ 44: 8B. 5C 24, 60
        mov     r9d, dword [rsp+88H]                    ; 3126 _ 44: 8B. 8C 24, 00000088
        mov     dword [rsp+28H], r8d                    ; 312E _ 44: 89. 44 24, 28
        mov     r8d, dword [rsp+9CH]                    ; 3133 _ 44: 8B. 84 24, 0000009C
        mov     dword [rsp+20H], r11d                   ; 313B _ 44: 89. 5C 24, 20
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 3140 _ E8, FFFFF00B
        mov     edx, r13d                               ; 3145 _ 44: 89. EA
        mov     rcx, rsi                                ; 3148 _ 48: 89. F1
        neg     eax                                     ; 314B _ F7. D8
        mov     dword [rsp+0B4H], eax                   ; 314D _ 89. 84 24, 000000B4
        call    _ZN8Position9undo_moveE4Move            ; 3154 _ E8, 00000000(rel)
        mov     eax, dword [rsp+0B4H]                   ; 3159 _ 8B. 84 24, 000000B4
        cmp     eax, r14d                               ; 3160 _ 44: 39. F0
        jge     ?_0572                                  ; 3163 _ 0F 8D, FFFFF1F7
        jmp     ?_0628                                  ; 3169 _ E9, FFFFFF4D

?_0629: mov     r11d, dword [rdi+14H]                   ; 316E _ 44: 8B. 5F, 14
        cmp     ecx, r11d                               ; 3172 _ 44: 39. D9
        jz      ?_0630                                  ; 3175 _ 74, 07
        mov     dword [rdi+18H], r11d                   ; 3177 _ 44: 89. 5F, 18
        mov     dword [rdi+14H], ecx                    ; 317B _ 89. 4F, 14
?_0630: mov     r10d, dword [rdi-1CH]                   ; 317E _ 44: 8B. 57, E4
        mov     r14d, ebp                               ; 3182 _ 41: 89. EE
        and     edx, 3FH                                ; 3185 _ 83. E2, 3F
        mov     r9d, dword [rdi-44H]                    ; 3188 _ 44: 8B. 4F, BC
        imul    r14d, ebp                               ; 318C _ 44: 0F AF. F5
        mov     qword [rsp+50H], rdx                    ; 3190 _ 48: 89. 54 24, 50
        lea     r13, [rel _ZN12_GLOBAL__N_118CounterMoveHistoryE]; 3195 _ 4C: 8D. 2D, 000000C0(rel)
        lea     r11d, [rbp+r14-1H]                      ; 319C _ 46: 8D. 5C 35, FF
        mov     r15d, r10d                              ; 31A1 _ 45: 89. D7
        and     r15d, 3FH                               ; 31A4 _ 41: 83. E7, 3F
        mov     ebx, r9d                                ; 31A8 _ 44: 89. CB
        mov     eax, dword [rsi+r15*4]                  ; 31AB _ 42: 8B. 04 BE
        and     ebx, 3FH                                ; 31AF _ 83. E3, 3F
        mov     r8, r15                                 ; 31B2 _ 4D: 89. F8
        mov     r14d, dword [rsi+rbx*4]                 ; 31B5 _ 44: 8B. 34 9E
        shl     r8, 12                                  ; 31B9 _ 49: C1. E0, 0C
        mov     qword [rsp+58H], rax                    ; 31BD _ 48: 89. 44 24, 58
        shl     rax, 18                                 ; 31C2 _ 48: C1. E0, 12
        add     rax, r13                                ; 31C6 _ 4C: 01. E8
        shl     r14, 18                                 ; 31C9 _ 49: C1. E6, 12
        add     rax, r8                                 ; 31CD _ 4C: 01. C0
        mov     r8d, ecx                                ; 31D0 _ 41: 89. C8
        add     r14, r13                                ; 31D3 _ 4D: 01. EE
        mov     r13, qword [rsi+3B0H]                   ; 31D6 _ 4C: 8B. AE, 000003B0
        sar     r8d, 6                                  ; 31DD _ 41: C1. F8, 06
        mov     qword [rsp+60H], rax                    ; 31E1 _ 48: 89. 44 24, 60
        mov     rax, rbx                                ; 31E6 _ 48: 89. D8
        shl     rax, 12                                 ; 31E9 _ 48: C1. E0, 0C
        and     r8d, 3FH                                ; 31ED _ 41: 83. E0, 3F
        add     r14, rax                                ; 31F1 _ 49: 01. C6
        mov     eax, dword [rsi+r8*4]                   ; 31F4 _ 42: 8B. 04 86
        mov     qword [rsp+68H], r14                    ; 31F8 _ 4C: 89. 74 24, 68
        mov     r14, r13                                ; 31FD _ 4D: 89. EE
        mov     qword [rsp+70H], r13                    ; 3200 _ 4C: 89. 6C 24, 70
        mov     dword [rsp+90H], eax                    ; 3205 _ 89. 84 24, 00000090
        mov     r13d, eax                               ; 320C _ 41: 89. C5
        mov     eax, r11d                               ; 320F _ 44: 89. D8
        sar     eax, 31                                 ; 3212 _ C1. F8, 1F
        mov     r8d, eax                                ; 3215 _ 41: 89. C0
        xor     r8d, r11d                               ; 3218 _ 45: 31. D8
        sub     r8d, eax                                ; 321B _ 41: 29. C0
        cmp     r8d, 323                                ; 321E _ 41: 81. F8, 00000143
        jg      ?_0631                                  ; 3225 _ 7F, 40
        mov     r13d, r13d                              ; 3227 _ 45: 89. ED
        shl     r13, 8                                  ; 322A _ 49: C1. E5, 08
        lea     r14, [r14+r13+4D4H]                     ; 322E _ 4F: 8D. B4 2E, 000004D4
        lea     r14, [r14+rdx*4]                        ; 3236 _ 4D: 8D. 34 96
        mov     edx, 424194301                          ; 323A _ BA, 1948B0FD
        mov     r13d, dword [r14]                       ; 323F _ 45: 8B. 2E
        imul    r13d, r8d                               ; 3242 _ 45: 0F AF. E8
        mov     eax, r13d                               ; 3246 _ 44: 89. E8
        sar     r13d, 31                                ; 3249 _ 41: C1. FD, 1F
        imul    edx                                     ; 324D _ F7. EA
        mov     eax, r11d                               ; 324F _ 44: 89. D8
        shl     eax, 5                                  ; 3252 _ C1. E0, 05
        sar     edx, 5                                  ; 3255 _ C1. FA, 05
        sub     edx, r13d                               ; 3258 _ 44: 29. EA
        mov     r13d, dword [r14]                       ; 325B _ 45: 8B. 2E
        sub     r13d, edx                               ; 325E _ 41: 29. D5
        add     r13d, eax                               ; 3261 _ 41: 01. C5
        mov     dword [r14], r13d                       ; 3264 _ 45: 89. 2E
?_0631: sar     r10d, 6                                 ; 3267 _ 41: C1. FA, 06
        and     r10d, 3FH                               ; 326B _ 41: 83. E2, 3F
        cmp     r15, r10                                ; 326F _ 4D: 39. D7
        je      ?_0633                                  ; 3272 _ 0F 84, 00000080
        mov     r10, qword [rsp+58H]                    ; 3278 _ 4C: 8B. 54 24, 58
        mov     r14, qword [rsp+70H]                    ; 327D _ 4C: 8B. 74 24, 70
        shl     r10, 8                                  ; 3282 _ 49: C1. E2, 08
        lea     rdx, [r14+r10+14D4H]                    ; 3286 _ 4B: 8D. 94 16, 000014D4
        lea     r13, [rdx+r15*4]                        ; 328E _ 4E: 8D. 2C BA
        cmp     ecx, dword [r13]                        ; 3292 _ 41: 3B. 4D, 00
        jz      ?_0632                                  ; 3296 _ 74, 0E
        mov     dword [r13], ecx                        ; 3298 _ 41: 89. 4D, 00
        mov     r9d, dword [rdi-44H]                    ; 329C _ 44: 8B. 4F, BC
        mov     ebx, r9d                                ; 32A0 _ 44: 89. CB
        and     ebx, 3FH                                ; 32A3 _ 83. E3, 3F
?_0632: cmp     r8d, 323                                ; 32A6 _ 41: 81. F8, 00000143
        jg      Unnamed_4_1165                          ; 32AD _ 0F 8F, 00001165(rel)
        mov     eax, dword [rsp+90H]                    ; 32B3 _ 8B. 84 24, 00000090
        mov     edx, r8d                                ; 32BA _ 44: 89. C2
        mov     rcx, qword [rsp+50H]                    ; 32BD _ 48: 8B. 4C 24, 50
        shl     rax, 8                                  ; 32C2 _ 48: C1. E0, 08
        add     rax, qword [rsp+60H]                    ; 32C6 _ 48: 03. 44 24, 60
        lea     r14, [rax+rcx*4]                        ; 32CB _ 4C: 8D. 34 88
        mov     ecx, r11d                               ; 32CF _ 44: 89. D9
        mov     r10d, dword [r14]                       ; 32D2 _ 45: 8B. 16
        imul    edx, r10d                               ; 32D5 _ 41: 0F AF. D2
        lea     r13d, [rdx+1FFH]                        ; 32D9 _ 44: 8D. AA, 000001FF
        test    edx, edx                                ; 32E0 _ 85. D2
        cmovns  r13d, edx                               ; 32E2 _ 44: 0F 49. EA
        shl     ecx, 6                                  ; 32E6 _ C1. E1, 06
        sar     r13d, 9                                 ; 32E9 _ 41: C1. FD, 09
        sub     r10d, r13d                              ; 32ED _ 45: 29. EA
        mov     eax, r10d                               ; 32F0 _ 44: 89. D0
        add     eax, ecx                                ; 32F3 _ 01. C8
        mov     dword [r14], eax                        ; 32F5 _ 41: 89. 06
?_0633: sar     r9d, 6                                  ; 32F8 _ 41: C1. F9, 06
        and     r9d, 3FH                                ; 32FC _ 41: 83. E1, 3F
        cmp     r9, rbx                                 ; 3300 _ 49: 39. D9
        jz      ?_0634                                  ; 3303 _ 74, 4C
        cmp     r8d, 323                                ; 3305 _ 41: 81. F8, 00000143
        jg      ?_0634                                  ; 330C _ 7F, 43
        mov     r14d, dword [rsp+90H]                   ; 330E _ 44: 8B. B4 24, 00000090
        mov     ecx, r11d                               ; 3316 _ 44: 89. D9
        mov     r10, qword [rsp+50H]                    ; 3319 _ 4C: 8B. 54 24, 50
        shl     r14, 8                                  ; 331E _ 49: C1. E6, 08
        add     r14, qword [rsp+68H]                    ; 3322 _ 4C: 03. 74 24, 68
        lea     r13, [r14+r10*4]                        ; 3327 _ 4F: 8D. 2C 96
        mov     edx, dword [r13]                        ; 332B _ 41: 8B. 55, 00
        imul    r8d, edx                                ; 332F _ 44: 0F AF. C2
        lea     eax, [r8+1FFH]                          ; 3333 _ 41: 8D. 80, 000001FF
        test    r8d, r8d                                ; 333A _ 45: 85. C0
        cmovs   r8d, eax                                ; 333D _ 44: 0F 48. C0
        shl     ecx, 6                                  ; 3341 _ C1. E1, 06
        sar     r8d, 9                                  ; 3344 _ 41: C1. F8, 09
        sub     edx, r8d                                ; 3348 _ 44: 29. C2
        add     edx, ecx                                ; 334B _ 01. CA
        mov     dword [r13], edx                        ; 334D _ 41: 89. 55, 00
?_0634: cmp     dword [rdi-4H], 1                       ; 3351 _ 83. 7F, FC, 01
        mov     eax, r12d                               ; 3355 _ 44: 89. E0
        jne     ?_0572                                  ; 3358 _ 0F 85, FFFFF002
        cmp     r9, rbx                                 ; 335E _ 49: 39. D9
        je      ?_0661                                  ; 3361 _ 0F 84, 000003D6
        mov     rdi, qword [rsi+3B8H]                   ; 3367 _ 48: 8B. BE, 000003B8
        mov     r9d, dword [rdi+40H]                    ; 336E _ 44: 8B. 4F, 40
        test    r9d, r9d                                ; 3372 _ 45: 85. C9
        jne     ?_0661                                  ; 3375 _ 0F 85, 000003C2
        lea     ebp, [rbp+rbp+2H]                       ; 337B _ 8D. 6C 2D, 02
        neg     r11d                                    ; 337F _ 41: F7. DB
        mov     esi, dword [rsi+rbx*4]                  ; 3382 _ 8B. 34 9E
        shl     rbx, 12                                 ; 3385 _ 48: C1. E3, 0C
        lea     r12, [rel _ZN12_GLOBAL__N_118CounterMoveHistoryE]; 3389 _ 4C: 8D. 25, 000000C0(rel)
        sub     r11d, ebp                               ; 3390 _ 41: 29. EB
        mov     r14d, r11d                              ; 3393 _ 45: 89. DE
        sar     r14d, 31                                ; 3396 _ 41: C1. FE, 1F
        mov     r13d, r14d                              ; 339A _ 45: 89. F5
        shl     rsi, 18                                 ; 339D _ 48: C1. E6, 12
        xor     r13d, r11d                              ; 33A1 _ 45: 31. DD
        add     rsi, r12                                ; 33A4 _ 4C: 01. E6
        sub     r13d, r14d                              ; 33A7 _ 45: 29. F5
        add     rbx, rsi                                ; 33AA _ 48: 01. F3
        cmp     r13d, 323                               ; 33AD _ 41: 81. FD, 00000143
        jg      ?_0572                                  ; 33B4 _ 0F 8F, FFFFEFA6
        mov     r10, qword [rsp+58H]                    ; 33BA _ 4C: 8B. 54 24, 58
        shl     r10, 8                                  ; 33BF _ 49: C1. E2, 08
        add     rbx, r10                                ; 33C3 _ 4C: 01. D3
        lea     r15, [rbx+r15*4]                        ; 33C6 _ 4E: 8D. 3C BB
        mov     edx, dword [r15]                        ; 33CA _ 41: 8B. 17
        imul    r13d, edx                               ; 33CD _ 44: 0F AF. EA
        lea     r8d, [r13+1FFH]                         ; 33D1 _ 45: 8D. 85, 000001FF
        test    r13d, r13d                              ; 33D8 _ 45: 85. ED
        cmovs   r13d, r8d                               ; 33DB _ 45: 0F 48. E8
        shl     r11d, 6                                 ; 33DF _ 41: C1. E3, 06
        sar     r13d, 9                                 ; 33E3 _ 41: C1. FD, 09
        sub     edx, r13d                               ; 33E7 _ 44: 29. EA
        add     edx, r11d                               ; 33EA _ 44: 01. DA
        mov     dword [r15], edx                        ; 33ED _ 41: 89. 17
        jmp     ?_0572                                  ; 33F0 _ E9, FFFFEF6B

?_0635: test    byte [r15+8H], 01H                      ; 33F5 _ 41: F6. 47, 08, 01
        je      ?_0574                                  ; 33FA _ 0F 84, FFFFEF85
        mov     dword [rdi+0CH], ecx                    ; 3400 _ 89. 4F, 0C
        mov     eax, r12d                               ; 3403 _ 44: 89. E0
        jmp     ?_0572                                  ; 3406 _ E9, FFFFEF55

?_0636: mov     eax, dword [rsp+94H]                    ; 340B _ 8B. 84 24, 00000094
        mov     dword [rsp+20H], 0                      ; 3412 _ C7. 44 24, 20, 00000000
        mov     rdx, rdi                                ; 341A _ 48: 89. FA
        sub     eax, ecx                                ; 341D _ 29. C8
        mov     rcx, rsi                                ; 341F _ 48: 89. F1
        lea     r9d, [rax+1H]                           ; 3422 _ 44: 8D. 48, 01
        mov     r8d, eax                                ; 3426 _ 41: 89. C0
        mov     dword [rsp+60H], eax                    ; 3429 _ 89. 44 24, 60
        call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 342D _ E8, FFFFE1EE
        mov     r8d, dword [rsp+60H]                    ; 3432 _ 44: 8B. 44 24, 60
        cmp     eax, r8d                                ; 3437 _ 44: 39. C0
        jle     ?_0572                                  ; 343A _ 0F 8E, FFFFEF20
        jmp     ?_0578                                  ; 3440 _ E9, FFFFF022

?_0637: mov     ecx, dword [rsp+98H]                    ; 3445 _ 8B. 8C 24, 00000098
        xor     r13d, 01H                               ; 344C _ 41: 83. F5, 01
        mov     r9d, 1                                  ; 3450 _ 41: B9, 00000001
        mov     dword [rsp+20H], r14d                   ; 3456 _ 44: 89. 74 24, 20
        lea     rdx, [rdi+28H]                          ; 345B _ 48: 8D. 57, 28
        movzx   r13d, r13b                              ; 345F _ 45: 0F B6. ED
        mov     dword [rsp+28H], r13d                   ; 3463 _ 44: 89. 6C 24, 28
        mov     r8d, ecx                                ; 3468 _ 41: 89. C8
        sub     r9d, ecx                                ; 346B _ 41: 29. C9
        mov     rcx, rsi                                ; 346E _ 48: 89. F1
        neg     r8d                                     ; 3471 _ 41: F7. D8
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 3474 _ E8, FFFFECD7
        neg     eax                                     ; 3479 _ F7. D8
        mov     r13d, eax                               ; 347B _ 41: 89. C5
        jmp     ?_0581                                  ; 347E _ E9, FFFFF0F1

?_0638: xor     edx, edx                                ; 3483 _ 31. D2
        jmp     ?_0596                                  ; 3485 _ E9, FFFFF58E

?_0639: mov     byte [rsp+80H], 0                       ; 348A _ C6. 84 24, 00000080, 00
        jmp     ?_0590                                  ; 3492 _ E9, FFFFF369

?_0640: mov     r12, qword [rsi+3B8H]                   ; 3497 _ 4C: 8B. A6, 000003B8
        mov     r9d, dword [r12+40H]                    ; 349E _ 45: 8B. 4C 24, 40
        test    r9d, r9d                                ; 34A3 _ 45: 85. C9
        jne     ?_0645                                  ; 34A6 _ 0F 85, 000000F4
        mov     edx, dword [rdi-1CH]                    ; 34AC _ 8B. 57, E4
        mov     ecx, edx                                ; 34AF _ 89. D1
        and     edx, 3FH                                ; 34B1 _ 83. E2, 3F
        sar     ecx, 6                                  ; 34B4 _ C1. F9, 06
        and     ecx, 3FH                                ; 34B7 _ 83. E1, 3F
        cmp     rcx, rdx                                ; 34BA _ 48: 39. D1
        je      ?_0652                                  ; 34BD _ 0F 84, 000001E4
        mov     r13d, dword [rdi-44H]                   ; 34C3 _ 44: 8B. 6F, BC
        mov     r14d, r13d                              ; 34C7 _ 45: 89. EE
        sar     r13d, 6                                 ; 34CA _ 41: C1. FD, 06
        and     r14d, 3FH                               ; 34CE _ 41: 83. E6, 3F
        and     r13d, 3FH                               ; 34D2 _ 41: 83. E5, 3F
        cmp     r13, r14                                ; 34D6 _ 4D: 39. F5
        je      ?_0662                                  ; 34D9 _ 0F 84, 00000266
        mov     r8d, dword [rsi+r14*4]                  ; 34DF _ 46: 8B. 04 B6
        mov     r10d, ebp                               ; 34E3 _ 41: 89. EA
        shl     r14, 12                                 ; 34E6 _ 49: C1. E6, 0C
        imul    r10d, ebp                               ; 34EA _ 44: 0F AF. D5
        mov     r12, qword [rsp+0F0H]                   ; 34EE _ 4C: 8B. A4 24, 000000F0
        lea     rsi, [rel _ZN12_GLOBAL__N_118CounterMoveHistoryE]; 34F6 _ 48: 8D. 35, 000000C0(rel)
        lea     r11d, [rbp+r10-1H]                      ; 34FD _ 46: 8D. 5C 15, FF
        shl     r8, 18                                  ; 3502 _ 49: C1. E0, 12
        add     r8, rsi                                 ; 3506 _ 49: 01. F0
        mov     r9d, dword [r12]                        ; 3509 _ 45: 8B. 0C 24
        add     r14, r8                                 ; 350D _ 4D: 01. C6
        cmp     r11d, 323                               ; 3510 _ 41: 81. FB, 00000143
        jg      Unnamed_4_1172                          ; 3517 _ 0F 8F, 00001172(rel)
        shl     r9, 8                                   ; 351D _ 49: C1. E1, 08
        mov     ecx, r11d                               ; 3521 _ 44: 89. D9
        add     r14, r9                                 ; 3524 _ 4D: 01. CE
        add     r14, qword [rsp+0F8H]                   ; 3527 _ 4C: 03. B4 24, 000000F8
        mov     edx, dword [r14]                        ; 352F _ 41: 8B. 16
        imul    ecx, edx                                ; 3532 _ 0F AF. CA
        lea     r13d, [rcx+1FFH]                        ; 3535 _ 44: 8D. A9, 000001FF
        test    ecx, ecx                                ; 353C _ 85. C9
        cmovns  r13d, ecx                               ; 353E _ 44: 0F 49. E9
        shl     r11d, 6                                 ; 3542 _ 41: C1. E3, 06
        sar     r13d, 9                                 ; 3546 _ 41: C1. FD, 09
        sub     edx, r13d                               ; 354A _ 44: 29. EA
        add     edx, r11d                               ; 354D _ 44: 01. DA
        mov     dword [r14], edx                        ; 3550 _ 41: 89. 16
        mov     r14d, dword [rdi+8H]                    ; 3553 _ 44: 8B. 77, 08
        jmp     ?_0605                                  ; 3557 _ E9, FFFFF6E7

?_0641: call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 355C _ E8, 000002AF
        neg     eax                                     ; 3561 _ F7. D8
        mov     r13d, eax                               ; 3563 _ 41: 89. C5
        jmp     ?_0603                                  ; 3566 _ E9, FFFFF66E

?_0642: mov     r10, rdx                                ; 356B _ 49: 89. D2
        jmp     ?_0608                                  ; 356E _ E9, FFFFF73F

?_0643: lea     rdx, [rbx+4D4H]                         ; 3573 _ 48: 8D. 93, 000004D4
        cmp     ebp, 7                                  ; 357A _ 83. FD, 07
        lea     r10, [rsp+2D0H]                         ; 357D _ 4C: 8D. 94 24, 000002D0
        setg    r13b                                    ; 3585 _ 41: 0F 9F. C5
        mov     qword [rsp+0B8H], rdx                   ; 3589 _ 48: 89. 94 24, 000000B8
        mov     qword [rsp+68H], r10                    ; 3591 _ 4C: 89. 54 24, 68
        jmp     ?_0589                                  ; 3596 _ E9, FFFFF11D

?_0644: jmp     ?_0574                                  ; 359B _ E9, FFFFEDE5

?_0645: mov     r14d, dword [rdi+8H]                    ; 35A0 _ 44: 8B. 77, 08
        jmp     ?_0605                                  ; 35A4 _ E9, FFFFF69A

?_0646: mov     r8d, r13d                               ; 35A9 _ 45: 89. E8
        sub     r8d, 1                                  ; 35AC _ 41: 83. E8, 01
        cmovs   r8d, dword [rsp+78H]                    ; 35B0 _ 44: 0F 48. 44 24, 78
        test    r8d, r8d                                ; 35B6 _ 45: 85. C0
        mov     r13d, r8d                               ; 35B9 _ 45: 89. C5
        setne   byte [rsp+0A8H]                         ; 35BC _ 0F 95. 84 24, 000000A8
        jmp     ?_0615                                  ; 35C4 _ E9, FFFFF841

?_0647: cmp     dword [rsp+78H], 49152                  ; 35C9 _ 81. 7C 24, 78, 0000C000
        setne   r13b                                    ; 35D1 _ 41: 0F 95. C5
        jmp     ?_0604                                  ; 35D5 _ E9, FFFFF65C

?_0648: mov     r14d, 40                                ; 35DA _ 41: BE, 00000028
        sub     r14d, dword [rdi-0CH]                   ; 35E0 _ 44: 2B. 77, F4
        jmp     ?_0583                                  ; 35E4 _ E9, FFFFEFEC

?_0649: movzx   r10d, bx                                ; 35E9 _ 44: 0F B7. D3
        cmp     r10d, 49152                             ; 35ED _ 41: 81. FA, 0000C000
        setne   r9b                                     ; 35F4 _ 41: 0F 95. C1
        jmp     ?_0571                                  ; 35F8 _ E9, FFFFED4D

?_0650: mov     rcx, rsi                                ; 35FD _ 48: 89. F1
        call    _ZNK8Position13exclusion_keyEv          ; 3600 _ E8, 00000000(rel)
        mov     qword [rsp+0A0H], rax                   ; 3605 _ 48: 89. 84 24, 000000A0
        mov     rdx, rax                                ; 360D _ 48: 89. C2
        jmp     ?_0569                                  ; 3610 _ E9, FFFFEC70

?_0651: mov     eax, dword [rdi+1CH]                    ; 3615 _ 8B. 47, 1C
        add     eax, 256                                ; 3618 _ 05, 00000100
        cmp     eax, dword [rsp+98H]                    ; 361D _ 3B. 84 24, 00000098
        jl      ?_0653                                  ; 3624 _ 0F 8C, 00000086
        mov     r9d, ebp                                ; 362A _ 41: 89. E9
        mov     byte [rdi+20H], 1                       ; 362D _ C6. 47, 20, 01
        mov     rdx, rdi                                ; 3631 _ 48: 89. FA
        mov     rcx, rsi                                ; 3634 _ 48: 89. F1
        lea     r15d, [rbp-2H]                          ; 3637 _ 44: 8D. 7D, FE
        sar     r9d, 2                                  ; 363B _ 41: C1. F9, 02
        mov     r8d, dword [rsp+94H]                    ; 363F _ 44: 8B. 84 24, 00000094
        mov     dword [rsp+28H], 1                      ; 3647 _ C7. 44 24, 28, 00000001
        sub     r15d, r9d                               ; 364F _ 45: 29. CF
        mov     r9d, dword [rsp+98H]                    ; 3652 _ 44: 8B. 8C 24, 00000098
        mov     dword [rsp+20H], r15d                   ; 365A _ 44: 89. 7C 24, 20
        call    _ZN12_GLOBAL__N_16searchILNS_8NodeTypeE0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depthb; 365F _ E8, FFFFEAEC
        mov     r8, qword [rsp+50H]                     ; 3664 _ 4C: 8B. 44 24, 50
        mov     byte [rdi+20H], 0                       ; 3669 _ C6. 47, 20, 00
        mov     rdx, qword [rsp+0A0H]                   ; 366D _ 48: 8B. 94 24, 000000A0
        mov     rcx, qword [rel .refptr.TT]             ; 3675 _ 48: 8B. 0D, 00000000(rel)
        call    _ZNK18TranspositionTable5probeEyRb      ; 367C _ E8, 00000000(rel)
        movzx   r13d, byte [rsp+11FH]                   ; 3681 _ 44: 0F B6. AC 24, 0000011F
        mov     r15, rax                                ; 368A _ 49: 89. C7
        test    r13b, r13b                              ; 368D _ 45: 84. ED
        je      Unnamed_4_1129                          ; 3690 _ 0F 84, 00001129(rel)
        movzx   ecx, word [r15+2H]                      ; 3696 _ 41: 0F B7. 4F, 02
        mov     dword [rsp+90H], ecx                    ; 369B _ 89. 8C 24, 00000090
        jmp     ?_0589                                  ; 36A2 _ E9, FFFFF011

?_0652: mov     r14d, dword [rdi+8H]                    ; 36A7 _ 44: 8B. 77, 08
        jmp     ?_0605                                  ; 36AB _ E9, FFFFF593

?_0653: mov     dword [rsp+90H], 0                      ; 36B0 _ C7. 84 24, 00000090, 00000000
        mov     r13d, r10d                              ; 36BB _ 45: 89. D5
        jmp     ?_0589                                  ; 36BE _ E9, FFFFEFF5

?_0654: sub     r12d, r14d                              ; 36C3 _ 45: 29. F4
        jmp     ?_0570                                  ; 36C6 _ E9, FFFFEC17

?_0655: cmp     dword [rdi+8H], 127                     ; 36CB _ 83. 7F, 08, 7F
        jle     ?_0656                                  ; 36CF _ 7E, 0B
        cmp     byte [rsp+58H], 0                       ; 36D1 _ 80. 7C 24, 58, 00
        je      ?_0673                                  ; 36D6 _ 0F 84, 00000112
?_0656: mov     ebp, dword [rsi+3ACH]                   ; 36DC _ 8B. AE, 000003AC
        lea     r15, [rel _ZN12_GLOBAL__N_19DrawValueE] ; 36E2 _ 4C: 8D. 3D, 004000C0(rel)
        mov     eax, dword [r15+rbp*4]                  ; 36E9 _ 41: 8B. 04 AF
        jmp     ?_0572                                  ; 36ED _ E9, FFFFEC6E

?_0657: add     r14d, eax                               ; 36F2 _ 41: 01. C6
        jmp     ?_0606                                  ; 36F5 _ E9, FFFFF580

?_0658: mov     r11d, eax                               ; 36FA _ 41: 89. C3
        sub     r11d, r14d                              ; 36FD _ 45: 29. F3
        mov     r14d, r11d                              ; 3700 _ 45: 89. DE
        jmp     ?_0606                                  ; 3703 _ E9, FFFFF572

?_0659: cmp     dword [rsp+70H], 0                      ; 3708 _ 83. 7C 24, 70, 00
        jne     ?_0671                                  ; 370D _ 0F 85, 000000CD
        cmp     byte [rsp+58H], 0                       ; 3713 _ 80. 7C 24, 58, 00
        je      ?_0670                                  ; 3718 _ 0F 84, 0000009F
        mov     r14d, dword [rdi+8H]                    ; 371E _ 44: 8B. 77, 08
        lea     r8d, [r14-7D00H]                        ; 3722 _ 45: 8D. 86, FFFF8300
        mov     dword [rsp+94H], r8d                    ; 3729 _ 44: 89. 84 24, 00000094
?_0660: mov     eax, dword [rsp+94H]                    ; 3731 _ 8B. 84 24, 00000094
        jmp     ?_0605                                  ; 3738 _ E9, FFFFF506

?_0661: mov     eax, r12d                               ; 373D _ 44: 89. E0
        jmp     ?_0572                                  ; 3740 _ E9, FFFFEC1B

?_0662: mov     r14d, dword [rdi+8H]                    ; 3745 _ 44: 8B. 77, 08
        jmp     ?_0605                                  ; 3749 _ E9, FFFFF4F5

?_0663: mov     byte [rbx+24D8H], 0                     ; 374E _ C6. 83, 000024D8, 00
        mov     dword [rbx+0ECH], 1                     ; 3755 _ C7. 83, 000000EC, 00000001
        jmp     ?_0568                                  ; 375F _ E9, FFFFEA79

?_0664: add     r12d, r14d                              ; 3764 _ 45: 01. F4
        jmp     ?_0570                                  ; 3767 _ E9, FFFFEB76

?_0665: mov     r9, qword [rel .refptr.Threads]         ; 376C _ 4C: 8B. 0D, 00000000(rel)
        mov     r11, qword [r9+8H]                      ; 3773 _ 4D: 8B. 59, 08
        mov     r10, qword [r9]                         ; 3777 _ 4D: 8B. 11
?_0666: cmp     r11, r10                                ; 377A _ 4D: 39. D3
        jnz     ?_0667                                  ; 377D _ 75, 0A
        call    _ZN12_GLOBAL__N_110check_timeEv         ; 377F _ E8, 000021E0(rel)
        jmp     ?_0568                                  ; 3784 _ E9, FFFFEA54

?_0667: mov     r15, qword [r10]                        ; 3789 _ 4D: 8B. 3A
        add     r10, 8                                  ; 378C _ 49: 83. C2, 08
        mov     byte [r15+24D8H], 1                     ; 3790 _ 41: C6. 87, 000024D8, 01
        jmp     ?_0666                                  ; 3798 _ EB, E0

?_0668: cmp     byte [r15+9H], -4                       ; 379A _ 41: 80. 7F, 09, FC
        jge     ?_0576                                  ; 379F _ 0F 8D, FFFFEC40
        jmp     ?_0584                                  ; 37A5 _ E9, FFFFEE5C

?_0669: mov     rcx, rsi                                ; 37AA _ 48: 89. F1
        call    _ZN4Eval8evaluateERK8Position           ; 37AD _ E8, 00000000(rel)
        mov     r14d, eax                               ; 37B2 _ 41: 89. C6
        mov     dword [rdi+1CH], eax                    ; 37B5 _ 89. 47, 1C
        jmp     ?_0575                                  ; 37B8 _ E9, FFFFEC05

?_0670: mov     r10d, dword [rsi+3ACH]                  ; 37BD _ 44: 8B. 96, 000003AC
        lea     rax, [rel _ZN12_GLOBAL__N_19DrawValueE] ; 37C4 _ 48: 8D. 05, 004000C0(rel)
        mov     r14d, dword [rdi+8H]                    ; 37CB _ 44: 8B. 77, 08
        mov     r11d, dword [rax+r10*4]                 ; 37CF _ 46: 8B. 1C 90
        mov     dword [rsp+94H], r11d                   ; 37D3 _ 44: 89. 9C 24, 00000094
        jmp     ?_0660                                  ; 37DB _ E9, FFFFFF51

?_0671: mov     r14d, dword [rdi+8H]                    ; 37E0 _ 44: 8B. 77, 08
        jmp     ?_0660                                  ; 37E4 _ E9, FFFFFF48

?_0672: jmp     Unnamed_4_113C                          ; 37E9 _ E9, 0000113C(rel)

?_0673: mov     rcx, rsi                                ; 37EE _ 48: 89. F1
        call    _ZN4Eval8evaluateERK8Position           ; 37F1 _ E8, 00000000(rel)
        jmp     ?_0572                                  ; 37F6 _ E9, FFFFEB65

?_0674: jmp     Unnamed_4_117B                          ; 37FB _ E9, 0000117B(rel)

?_0675: ; Local function
        jmp     .text.unlikely+12BBH                    ; 3800 _ E9, 000012BB(rel)

; Filling space: 0BH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H
;       db 00H, 00H, 00H

ALIGN   16

_ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth:; Local function
        push    r15                                     ; 3810 _ 41: 57
        push    r14                                     ; 3812 _ 41: 56
        push    r13                                     ; 3814 _ 41: 55
        push    r12                                     ; 3816 _ 41: 54
        push    rbp                                     ; 3818 _ 55
        push    rdi                                     ; 3819 _ 57
        push    rsi                                     ; 381A _ 56
        push    rbx                                     ; 381B _ 53
        sub     rsp, 2472                               ; 381C _ 48: 81. EC, 000009A8
        mov     eax, dword [rdx-20H]                    ; 3823 _ 8B. 42, E0
        mov     esi, dword [rsp+0A10H]                  ; 3826 _ 8B. B4 24, 00000A10
        add     eax, 1                                  ; 382D _ 83. C0, 01
        mov     dword [rdx+0CH], 0                      ; 3830 _ C7. 42, 0C, 00000000
        mov     rdi, rcx                                ; 3837 _ 48: 89. CF
        mov     rbp, rdx                                ; 383A _ 48: 89. D5
        mov     dword [rdx+8H], eax                     ; 383D _ 89. 42, 08
        mov     dword [rsp+0A00H], r8d                  ; 3840 _ 44: 89. 84 24, 00000A00
        mov     dword [rsp+0A08H], r9d                  ; 3848 _ 44: 89. 8C 24, 00000A08
        call    _ZNK8Position7is_drawEv                 ; 3850 _ E8, 00000000(rel)
        test    al, al                                  ; 3855 _ 84. C0
        jne     ?_0704                                  ; 3857 _ 0F 85, 0000049D
        cmp     dword [rbp+8H], 127                     ; 385D _ 83. 7D, 08, 7F
        jg      ?_0704                                  ; 3861 _ 0F 8F, 00000493
        mov     rdx, qword [rdi+3B8H]                   ; 3867 _ 48: 8B. 97, 000003B8
        lea     r8, [rsp+6FH]                           ; 386E _ 4C: 8D. 44 24, 6F
        mov     rcx, qword [rdx+30H]                    ; 3873 _ 48: 8B. 4A, 30
        mov     qword [rsp+40H], rcx                    ; 3877 _ 48: 89. 4C 24, 40
        mov     rdx, rcx                                ; 387C _ 48: 89. CA
        mov     rcx, qword [rel .refptr.TT]             ; 387F _ 48: 8B. 0D, 00000000(rel)
        call    _ZNK18TranspositionTable5probeEyRb      ; 3886 _ E8, 00000000(rel)
        cmp     byte [rsp+6FH], 0                       ; 388B _ 80. 7C 24, 6F, 00
        mov     r12, rax                                ; 3890 _ 49: 89. C4
        jne     ?_0689                                  ; 3893 _ 0F 85, 000002F7
        xor     r8d, r8d                                ; 3899 _ 45: 31. C0
?_0676: mov     r9d, dword [rbp-1CH]                    ; 389C _ 44: 8B. 4D, E4
        lea     r14, [rsp+70H]                          ; 38A0 _ 4C: 8D. 74 24, 70
        mov     rdx, rdi                                ; 38A5 _ 48: 89. FA
        mov     ebx, 4294935295                         ; 38A8 _ BB, FFFF82FF
        mov     dword [rbp+1CH], 32002                  ; 38AD _ C7. 45, 1C, 00007D02
        lea     r15, [rsp+120H]                         ; 38B4 _ 4C: 8D. BC 24, 00000120
        mov     rcx, r15                                ; 38BC _ 4C: 89. F9
        and     r9d, 3FH                                ; 38BF _ 41: 83. E1, 3F
        mov     qword [rsp+28H], r9                     ; 38C3 _ 4C: 89. 4C 24, 28
        mov     r10, qword [rdi+3B0H]                   ; 38C8 _ 4C: 8B. 97, 000003B0
        mov     r9d, esi                                ; 38CF _ 41: 89. F1
        lea     esi, [rsi-1H]                           ; 38D2 _ 8D. 76, FF
        add     r10, 1236                               ; 38D5 _ 49: 81. C2, 000004D4
        mov     qword [rsp+20H], r10                    ; 38DC _ 4C: 89. 54 24, 20
        call    _ZN10MovePickerC1ERK8Position4Move5DepthRK5StatsI5ValueLb0EE6Square; 38E1 _ E8, 00000000(rel)
        lea     r8, [rsp+0C0H]                          ; 38E6 _ 4C: 8D. 84 24, 000000C0
        mov     rdx, rdi                                ; 38EE _ 48: 89. FA
        mov     rcx, r8                                 ; 38F1 _ 4C: 89. C1
        mov     qword [rsp+50H], r8                     ; 38F4 _ 4C: 89. 44 24, 50
        call    _ZN9CheckInfoC1ERK8Position             ; 38F9 _ E8, 00000000(rel)
        mov     eax, dword [rsp+0A00H]                  ; 38FE _ 8B. 84 24, 00000A00
        mov     qword [rsp+30H], r14                    ; 3905 _ 4C: 89. 74 24, 30
        mov     r11, qword [rel .refptr.SquareBB]       ; 390A _ 4C: 8B. 1D, 00000000(rel)
        mov     dword [rsp+58H], esi                    ; 3911 _ 89. 74 24, 58
        mov     r13, qword [rel .refptr.TT]             ; 3915 _ 4C: 8B. 2D, 00000000(rel)
        neg     eax                                     ; 391C _ F7. D8
        mov     qword [rsp+48H], r11                    ; 391E _ 4C: 89. 5C 24, 48
        mov     dword [rsp+3CH], eax                    ; 3923 _ 89. 44 24, 3C
?_0677: cmp     ebx, -31743                             ; 3927 _ 81. FB, FFFF8401
        jge     ?_0687                                  ; 392D _ 0F 8D, 000001DD
        mov     rcx, r15                                ; 3933 _ 4C: 89. F9
        call    _ZN10MovePicker9next_moveEv             ; 3936 _ E8, 00000000(rel)
        test    eax, eax                                ; 393B _ 85. C0
        mov     esi, eax                                ; 393D _ 89. C6
        je      ?_0692                                  ; 393F _ 0F 84, 000002BB
        test    ah, 0FFFFFFC0H                          ; 3945 _ F6. C4, C0
        jne     ?_0700                                  ; 3948 _ 0F 85, 00000368
        cmp     qword [rsp+0C0H], 0                     ; 394E _ 48: 83. BC 24, 000000C0, 00
        jne     ?_0700                                  ; 3957 _ 0F 85, 00000359
        mov     r8d, eax                                ; 395D _ 41: 89. C0
        mov     rdx, qword [rsp+48H]                    ; 3960 _ 48: 8B. 54 24, 48
        mov     r14d, eax                               ; 3965 _ 41: 89. C6
        sar     r8d, 6                                  ; 3968 _ 41: C1. F8, 06
        and     r14d, 3FH                               ; 396C _ 41: 83. E6, 3F
        and     r8d, 3FH                                ; 3970 _ 41: 83. E0, 3F
        mov     r11d, dword [rdi+r8*4]                  ; 3974 _ 46: 8B. 1C 87
        and     r11d, 07H                               ; 3978 _ 41: 83. E3, 07
        mov     rax, qword [rsp+r11*8+0D0H]             ; 397C _ 4A: 8B. 84 DC, 000000D0
        test    qword [rdx+r14*8], rax                  ; 3984 _ 4A: 85. 04 F2
        setne   r14b                                    ; 3988 _ 41: 0F 95. C6
?_0678: mov     edx, esi                                ; 398C _ 89. F2
        mov     rcx, rdi                                ; 398E _ 48: 89. F9
        call    _ZNK8Position9key_afterE4Move           ; 3991 _ E8, 00000000(rel)
        mov     rcx, qword [r13]                        ; 3996 _ 49: 8B. 4D, 00
        mov     edx, esi                                ; 399A _ 89. F2
        mov     r8, qword [rsp+0C8H]                    ; 399C _ 4C: 8B. 84 24, 000000C8
        lea     r9, [rcx-1H]                            ; 39A4 _ 4C: 8D. 49, FF
        mov     rcx, rdi                                ; 39A8 _ 48: 89. F9
        and     rax, r9                                 ; 39AB _ 4C: 21. C8
        shl     rax, 5                                  ; 39AE _ 48: C1. E0, 05
        add     rax, qword [r13+8H]                     ; 39B2 _ 49: 03. 45, 08
        prefetcht0 [rax]                                ; 39B6 _ 0F 18. 08
        call    _ZNK8Position5legalE4Movey              ; 39B9 _ E8, 00000000(rel)
        test    al, al                                  ; 39BE _ 84. C0
        je      ?_0677                                  ; 39C0 _ 0F 84, FFFFFF61
        mov     r8, qword [rsp+30H]                     ; 39C6 _ 4C: 8B. 44 24, 30
        movzx   r9d, r14b                               ; 39CB _ 45: 0F B6. CE
        mov     edx, esi                                ; 39CF _ 89. F2
        mov     rcx, rdi                                ; 39D1 _ 48: 89. F9
        mov     dword [rbp+0CH], esi                    ; 39D4 _ 89. 75, 0C
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 39D7 _ E8, 00000000(rel)
        mov     r8d, dword [rsp+0A08H]                  ; 39DC _ 44: 8B. 84 24, 00000A08
        lea     rdx, [rbp+28H]                          ; 39E4 _ 48: 8D. 55, 28
        mov     rcx, rdi                                ; 39E8 _ 48: 89. F9
        mov     r10d, dword [rsp+58H]                   ; 39EB _ 44: 8B. 54 24, 58
        mov     r9d, dword [rsp+3CH]                    ; 39F0 _ 44: 8B. 4C 24, 3C
        neg     r8d                                     ; 39F5 _ 41: F7. D8
        test    r14b, r14b                              ; 39F8 _ 45: 84. F6
        mov     dword [rsp+20H], r10d                   ; 39FB _ 44: 89. 54 24, 20
        jne     ?_0701                                  ; 3A00 _ 0F 85, 000002C7
        call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb0EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 3A06 _ E8, FFFFDC15
        neg     eax                                     ; 3A0B _ F7. D8
        mov     r14d, eax                               ; 3A0D _ 41: 89. C6
?_0679: mov     edx, esi                                ; 3A10 _ 89. F2
        mov     rcx, rdi                                ; 3A12 _ 48: 89. F9
        call    _ZN8Position9undo_moveE4Move            ; 3A15 _ E8, 00000000(rel)
        cmp     r14d, ebx                               ; 3A1A _ 41: 39. DE
        jle     ?_0677                                  ; 3A1D _ 0F 8E, FFFFFF04
        cmp     r14d, dword [rsp+0A00H]                 ; 3A23 _ 44: 3B. B4 24, 00000A00
        jle     ?_0688                                  ; 3A2B _ 0F 8E, 0000014F
        cmp     r14d, 31743                             ; 3A31 _ 41: 81. FE, 00007BFF
        movzx   edi, byte [r13+18H]                     ; 3A38 _ 41: 0F B6. 7D, 18
        mov     r13d, dword [rbp+1CH]                   ; 3A3D _ 44: 8B. 6D, 1C
        mov     ebp, dword [rbp+8H]                     ; 3A41 _ 8B. 6D, 08
        jg      ?_0708                                  ; 3A44 _ 0F 8F, 000002E3
        cmp     r14d, -31743                            ; 3A4A _ 41: 81. FE, FFFF8401
        jl      _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth.cold.215; 3A51 _ 0F 8C, 000012E3(rel)
        mov     ebp, r14d                               ; 3A57 _ 44: 89. F5
?_0680: mov     word [r12+2H], si                       ; 3A5A _ 66 41: 89. 74 24, 02
        mov     rsi, qword [rsp+40H]                    ; 3A60 _ 48: 8B. 74 24, 40
        movzx   r15d, word [r12]                        ; 3A65 _ 45: 0F B7. 3C 24
        shr     rsi, 48                                 ; 3A6A _ 48: C1. EE, 30
        cmp     rsi, r15                                ; 3A6E _ 4C: 39. FE
        je      ?_0699                                  ; 3A71 _ 0F 84, 0000022E
?_0681: or      edi, 02H                                ; 3A77 _ 83. CF, 02
        mov     word [r12], si                          ; 3A7A _ 66 41: 89. 34 24
        mov     word [r12+4H], bp                       ; 3A7F _ 66 41: 89. 6C 24, 04
        mov     word [r12+6H], r13w                     ; 3A85 _ 66 45: 89. 6C 24, 06
        mov     byte [r12+8H], dil                      ; 3A8B _ 41: 88. 7C 24, 08
        mov     byte [r12+9H], 0                        ; 3A90 _ 41: C6. 44 24, 09, 00
?_0682: mov     eax, r14d                               ; 3A96 _ 44: 89. F0
?_0683: add     rsp, 2472                               ; 3A99 _ 48: 81. C4, 000009A8
        pop     rbx                                     ; 3AA0 _ 5B
        pop     rsi                                     ; 3AA1 _ 5E
        pop     rdi                                     ; 3AA2 _ 5F
        pop     rbp                                     ; 3AA3 _ 5D
        pop     r12                                     ; 3AA4 _ 41: 5C
        pop     r13                                     ; 3AA6 _ 41: 5D
        pop     r14                                     ; 3AA8 _ 41: 5E
        pop     r15                                     ; 3AAA _ 41: 5F
        ret                                             ; 3AAC _ C3

?_0684: mov     r8, qword [rsp+50H]                     ; 3AAD _ 4C: 8B. 44 24, 50
        mov     dword [rsp+5CH], edx                    ; 3AB2 _ 89. 54 24, 5C
        mov     rcx, rdi                                ; 3AB6 _ 48: 89. F9
        mov     edx, esi                                ; 3AB9 _ 89. F2
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 3ABB _ E8, 00000000(rel)
        mov     ecx, esi                                ; 3AC0 _ 89. F1
        mov     r9d, dword [rsp+5CH]                    ; 3AC2 _ 44: 8B. 4C 24, 5C
        and     ecx, 3FH                                ; 3AC7 _ 83. E1, 3F
        mov     r14d, eax                               ; 3ACA _ 41: 89. C6
        cmp     dword [rdi+rcx*4], 0                    ; 3ACD _ 83. 3C 8F, 00
        jz      ?_0685                                  ; 3AD1 _ 74, 0D
        cmp     r9d, 49152                              ; 3AD3 _ 41: 81. F9, 0000C000
        jne     ?_0678                                  ; 3ADA _ 0F 85, FFFFFEAC
?_0685: sub     r9d, 16384                              ; 3AE0 _ 41: 81. E9, 00004000
        and     r9d, 0FFFF8000H                         ; 3AE7 _ 41: 81. E1, FFFF8000
        je      ?_0678                                  ; 3AEE _ 0F 84, FFFFFE98
?_0686: mov     edx, esi                                ; 3AF4 _ 89. F2
        mov     rcx, rdi                                ; 3AF6 _ 48: 89. F9
        call    _ZNK8Position8see_signE4Move            ; 3AF9 _ E8, 00000000(rel)
        test    eax, eax                                ; 3AFE _ 85. C0
        jns     ?_0678                                  ; 3B00 _ 0F 89, FFFFFE86
; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_0687: mov     rcx, r15                                ; 3B10 _ 4C: 89. F9
        call    _ZN10MovePicker9next_moveEv             ; 3B13 _ E8, 00000000(rel)
        test    eax, eax                                ; 3B18 _ 85. C0
        mov     esi, eax                                ; 3B1A _ 89. C6
        je      ?_0697                                  ; 3B1C _ 0F 84, 00000152
        mov     edx, esi                                ; 3B22 _ 89. F2
        and     edx, 0C000H                             ; 3B24 _ 81. E2, 0000C000
        jnz     ?_0684                                  ; 3B2A _ 75, 81
        cmp     qword [rsp+0C0H], 0                     ; 3B2C _ 48: 83. BC 24, 000000C0, 00
        jne     ?_0684                                  ; 3B35 _ 0F 85, FFFFFF72
        mov     r10d, esi                               ; 3B3B _ 41: 89. F2
        mov     rax, qword [rel .refptr.SquareBB]       ; 3B3E _ 48: 8B. 05, 00000000(rel)
        mov     r11d, esi                               ; 3B45 _ 41: 89. F3
        sar     r10d, 6                                 ; 3B48 _ 41: C1. FA, 06
        and     r11d, 3FH                               ; 3B4C _ 41: 83. E3, 3F
        and     r10d, 3FH                               ; 3B50 _ 41: 83. E2, 3F
        mov     edx, dword [rdi+r11*4]                  ; 3B54 _ 42: 8B. 14 9F
        mov     r8d, dword [rdi+r10*4]                  ; 3B58 _ 46: 8B. 04 97
        and     r8d, 07H                                ; 3B5C _ 41: 83. E0, 07
        mov     r14, qword [rsp+r8*8+0D0H]              ; 3B60 _ 4E: 8B. B4 C4, 000000D0
        test    qword [rax+r11*8], r14                  ; 3B68 _ 4E: 85. 34 D8
        setne   r14b                                    ; 3B6C _ 41: 0F 95. C6
        test    edx, edx                                ; 3B70 _ 85. D2
        jne     ?_0678                                  ; 3B72 _ 0F 85, FFFFFE14
        jmp     ?_0686                                  ; 3B78 _ E9, FFFFFF77

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_0688: mov     ebx, r14d                               ; 3B80 _ 44: 89. F3
        jmp     ?_0677                                  ; 3B83 _ E9, FFFFFD9F

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_0689: movsx   eax, word [r12+4H]                      ; 3B90 _ 41: 0F BF. 44 24, 04
        movzx   r8d, word [r12+2H]                      ; 3B96 _ 45: 0F B7. 44 24, 02
        mov     ebx, dword [rbp+8H]                     ; 3B9C _ 8B. 5D, 08
        cmp     eax, 32002                              ; 3B9F _ 3D, 00007D02
        je      ?_0676                                  ; 3BA4 _ 0F 84, FFFFFCF2
        cmp     eax, 31743                              ; 3BAA _ 3D, 00007BFF
        jg      ?_0707                                  ; 3BAF _ 0F 8F, 00000171
        cmp     eax, 4294935553                         ; 3BB5 _ 3D, FFFF8401
        jl      ?_0706                                  ; 3BBA _ 0F 8C, 0000015F
?_0690: cmp     eax, 32002                              ; 3BC0 _ 3D, 00007D02
        je      ?_0676                                  ; 3BC5 _ 0F 84, FFFFFCD1
        test    byte [r12+9H], 0FFFFFF80H               ; 3BCB _ 41: F6. 44 24, 09, 80
        jne     ?_0676                                  ; 3BD1 _ 0F 85, FFFFFCC5
        cmp     dword [rsp+0A08H], eax                  ; 3BD7 _ 39. 84 24, 00000A08
        jg      ?_0698                                  ; 3BDE _ 0F 8F, 000000B0
        test    byte [r12+8H], 02H                      ; 3BE4 _ 41: F6. 44 24, 08, 02
        je      ?_0676                                  ; 3BEA _ 0F 84, FFFFFCAC
?_0691: mov     dword [rbp+0CH], r8d                    ; 3BF0 _ 44: 89. 45, 0C
        jmp     ?_0683                                  ; 3BF4 _ E9, FFFFFEA0

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_0692: cmp     ebx, -32001                             ; 3C00 _ 81. FB, FFFF82FF
        je      ?_0703                                  ; 3C06 _ 0F 84, 000000E1
        mov     rdi, qword [rel .refptr.TT]             ; 3C0C _ 48: 8B. 3D, 00000000(rel)
        mov     r13d, dword [rbp+1CH]                   ; 3C13 _ 44: 8B. 6D, 1C
        mov     ebp, dword [rbp+8H]                     ; 3C17 _ 8B. 6D, 08
        movzx   esi, byte [rdi+18H]                     ; 3C1A _ 0F B6. 77, 18
; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_0693: cmp     ebx, -31743                             ; 3C20 _ 81. FB, FFFF8401
        jl      ?_0705                                  ; 3C26 _ 0F 8C, 000000E5
        mov     ebp, ebx                                ; 3C2C _ 89. DD
?_0694: mov     rcx, qword [rsp+40H]                    ; 3C2E _ 48: 8B. 4C 24, 40
        movzx   r9d, word [r12]                         ; 3C33 _ 45: 0F B7. 0C 24
        shr     rcx, 48                                 ; 3C38 _ 48: C1. E9, 30
        cmp     rcx, r9                                 ; 3C3C _ 4C: 39. C9
        je      ?_0702                                  ; 3C3F _ 0F 84, 00000097
        xor     r10d, r10d                              ; 3C45 _ 45: 31. D2
        mov     word [r12+2H], r10w                     ; 3C48 _ 66 45: 89. 54 24, 02
?_0695: or      esi, 01H                                ; 3C4E _ 83. CE, 01
        mov     word [r12], cx                          ; 3C51 _ 66 41: 89. 0C 24
        mov     word [r12+4H], bp                       ; 3C56 _ 66 41: 89. 6C 24, 04
        mov     word [r12+6H], r13w                     ; 3C5C _ 66 45: 89. 6C 24, 06
        mov     byte [r12+8H], sil                      ; 3C62 _ 41: 88. 74 24, 08
        mov     byte [r12+9H], 0                        ; 3C67 _ 41: C6. 44 24, 09, 00
?_0696: mov     eax, ebx                                ; 3C6D _ 89. D8
        jmp     ?_0683                                  ; 3C6F _ E9, FFFFFE25

?_0697: mov     r13, qword [rel .refptr.TT]             ; 3C74 _ 4C: 8B. 2D, 00000000(rel)
        cmp     ebx, 31743                              ; 3C7B _ 81. FB, 00007BFF
        movzx   esi, byte [r13+18H]                     ; 3C81 _ 41: 0F B6. 75, 18
        mov     r13d, dword [rbp+1CH]                   ; 3C86 _ 44: 8B. 6D, 1C
        mov     ebp, dword [rbp+8H]                     ; 3C8A _ 8B. 6D, 08
        jle     ?_0693                                  ; 3C8D _ 7E, 91
        jmp     Unnamed_4_12EF                          ; 3C8F _ E9, 000012EF(rel)

?_0698: test    byte [r12+8H], 01H                      ; 3C94 _ 41: F6. 44 24, 08, 01
        je      ?_0676                                  ; 3C9A _ 0F 84, FFFFFBFC
        jmp     ?_0691                                  ; 3CA0 _ E9, FFFFFF4B

?_0699: cmp     byte [r12+9H], 1                        ; 3CA5 _ 41: 80. 7C 24, 09, 01
        jle     ?_0681                                  ; 3CAB _ 0F 8E, FFFFFDC6
        jmp     ?_0682                                  ; 3CB1 _ E9, FFFFFDE0

?_0700: mov     r8, qword [rsp+50H]                     ; 3CB6 _ 4C: 8B. 44 24, 50
        mov     edx, esi                                ; 3CBB _ 89. F2
        mov     rcx, rdi                                ; 3CBD _ 48: 89. F9
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 3CC0 _ E8, 00000000(rel)
        mov     r14d, eax                               ; 3CC5 _ 41: 89. C6
        jmp     ?_0678                                  ; 3CC8 _ E9, FFFFFCBF

?_0701: call    _ZN12_GLOBAL__N_17qsearchILNS_8NodeTypeE0ELb1EEE5ValueR8PositionPN6Search5StackES2_S2_5Depth; 3CCD _ E8, FFFFFB3E
        neg     eax                                     ; 3CD2 _ F7. D8
        mov     r14d, eax                               ; 3CD4 _ 41: 89. C6
        jmp     ?_0679                                  ; 3CD7 _ E9, FFFFFD34

?_0702: cmp     byte [r12+9H], 1                        ; 3CDC _ 41: 80. 7C 24, 09, 01
        jle     ?_0695                                  ; 3CE2 _ 0F 8E, FFFFFF66
; Note: Immediate operand could be made smaller by sign extension
        jmp     ?_0696                                  ; 3CE8 _ E9, FFFFFF80

?_0703: mov     eax, dword [rbp+8H]                     ; 3CED _ 8B. 45, 08
        sub     eax, 32000                              ; 3CF0 _ 2D, 00007D00
        jmp     ?_0683                                  ; 3CF5 _ E9, FFFFFD9F

?_0704: mov     r12d, dword [rdi+3ACH]                  ; 3CFA _ 44: 8B. A7, 000003AC
        lea     r8, [rel _ZN12_GLOBAL__N_19DrawValueE]  ; 3D01 _ 4C: 8D. 05, 004000C0(rel)
        mov     eax, dword [r8+r12*4]                   ; 3D08 _ 43: 8B. 04 A0
        jmp     ?_0683                                  ; 3D0C _ E9, FFFFFD88

?_0705: mov     r15d, ebx                               ; 3D11 _ 41: 89. DF
        sub     r15d, ebp                               ; 3D14 _ 41: 29. EF
        mov     ebp, r15d                               ; 3D17 _ 44: 89. FD
        jmp     ?_0694                                  ; 3D1A _ E9, FFFFFF0F

?_0706: add     eax, ebx                                ; 3D1F _ 01. D8
        jmp     ?_0690                                  ; 3D21 _ E9, FFFFFE9A

?_0707: sub     eax, ebx                                ; 3D26 _ 29. D8
        jmp     ?_0690                                  ; 3D28 _ E9, FFFFFE93

?_0708: ; Local function
        add     ebp, r14d                               ; 3D2D _ 44: 01. F5
        jmp     ?_0680                                  ; 3D30 _ E9, FFFFFD25

        nop                                             ; 3D35 _ 90
        nop                                             ; 3D36 _ 90
        nop                                             ; 3D37 _ 90
        nop                                             ; 3D38 _ 90
        nop                                             ; 3D39 _ 90
        nop                                             ; 3D3A _ 90
        nop                                             ; 3D3B _ 90
        nop                                             ; 3D3C _ 90
        nop                                             ; 3D3D _ 90
        nop                                             ; 3D3E _ 90
        nop                                             ; 3D3F _ 90


SECTION .xdata.hot align=4 noexecute                    ; section number 24, const

        db 01H, 13H, 0AH, 00H, 13H, 01H, 0A9H, 01H      ; 0000 _ ........
        db 0CH, 30H, 0BH, 60H, 0AH, 70H, 09H, 50H       ; 0008 _ .0.`.p.P
        db 08H, 0C0H, 06H, 0D0H, 04H, 0E0H, 02H, 0F0H   ; 0010 _ ........
        db 01H, 13H, 0AH, 00H, 13H, 01H, 37H, 01H       ; 0018 _ ......7.
        db 0CH, 30H, 0BH, 60H, 0AH, 70H, 09H, 50H       ; 0020 _ .0.`.p.P
        db 08H, 0C0H, 06H, 0D0H, 04H, 0E0H, 02H, 0F0H   ; 0028 _ ........
        db 01H, 10H, 09H, 00H, 10H, 62H, 0CH, 30H       ; 0030 _ .....b.0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0038 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0040 _ ........
        db 01H, 00H, 00H, 00H, 01H, 13H, 0AH, 00H       ; 0048 _ ........
        db 13H, 01H, 6BH, 01H, 0CH, 30H, 0BH, 60H       ; 0050 _ ..k..0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 0058 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 13H, 0AH, 00H     ; 0060 _ ........
        db 13H, 01H, 35H, 01H, 0CH, 30H, 0BH, 60H       ; 0068 _ ..5..0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 0070 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H                         ; 0078 _ ....


SECTION .text$_ZSt4swapIN6Search8RootMoveEEvRT_S3_ align=16 execute ; section number 26, code
;  Communal section not supported by YASM

_ZSt4swapIN6Search8RootMoveEEvRT_S3_:; Function begin
        push    rsi                                     ; 0000 _ 56
        push    rbx                                     ; 0001 _ 53
        sub     rsp, 72                                 ; 0002 _ 48: 83. EC, 48
        mov     rsi, qword [rcx+8H]                     ; 0006 _ 48: 8B. 71, 08
        mov     eax, dword [rcx+4H]                     ; 000A _ 8B. 41, 04
        mov     r8, qword [rcx+10H]                     ; 000D _ 4C: 8B. 41, 10
        mov     r9, qword [rcx+18H]                     ; 0011 _ 4C: 8B. 49, 18
        mov     rbx, rdx                                ; 0015 _ 48: 89. D3
        mov     edx, dword [rcx]                        ; 0018 _ 8B. 11
        mov     qword [rsp+28H], rsi                    ; 001A _ 48: 89. 74 24, 28
        add     rcx, 8                                  ; 001F _ 48: 83. C1, 08
        mov     r10d, dword [rbx]                       ; 0023 _ 44: 8B. 13
        lea     rsi, [rbx+8H]                           ; 0026 _ 48: 8D. 73, 08
        mov     qword [rcx], 0                          ; 002A _ 48: C7. 01, 00000000
        mov     r11d, dword [rbx+4H]                    ; 0031 _ 44: 8B. 5B, 04
        mov     qword [rcx+8H], 0                       ; 0035 _ 48: C7. 41, 08, 00000000
        mov     qword [rcx+10H], 0                      ; 003D _ 48: C7. 41, 10, 00000000
        mov     dword [rsp+20H], edx                    ; 0045 _ 89. 54 24, 20
        mov     rdx, rsi                                ; 0049 _ 48: 89. F2
        mov     dword [rcx-8H], r10d                    ; 004C _ 44: 89. 51, F8
        mov     dword [rcx-4H], r11d                    ; 0050 _ 44: 89. 59, FC
        mov     dword [rsp+24H], eax                    ; 0054 _ 89. 44 24, 24
        mov     qword [rsp+30H], r8                     ; 0058 _ 4C: 89. 44 24, 30
        mov     qword [rsp+38H], r9                     ; 005D _ 4C: 89. 4C 24, 38
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 0062 _ E8, 000020F0(rel)
        mov     ecx, dword [rsp+20H]                    ; 0067 _ 8B. 4C 24, 20
        mov     edx, dword [rsp+24H]                    ; 006B _ 8B. 54 24, 24
        mov     dword [rbx], ecx                        ; 006F _ 89. 0B
        mov     rcx, rsi                                ; 0071 _ 48: 89. F1
        mov     dword [rbx+4H], edx                     ; 0074 _ 89. 53, 04
        lea     rdx, [rsp+28H]                          ; 0077 _ 48: 8D. 54 24, 28
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 007C _ E8, 000020F0(rel)
        mov     rcx, qword [rsp+28H]                    ; 0081 _ 48: 8B. 4C 24, 28
        test    rcx, rcx                                ; 0086 _ 48: 85. C9
        jz      ?_0709                                  ; 0089 _ 74, 06
        call    _ZdlPv                                  ; 008B _ E8, 00000000(rel)
        nop                                             ; 0090 _ 90
?_0709: add     rsp, 72                                 ; 0091 _ 48: 83. C4, 48
        pop     rbx                                     ; 0095 _ 5B
        pop     rsi                                     ; 0096 _ 5E
        ret                                             ; 0097 _ C3
; _ZSt4swapIN6Search8RootMoveEEvRT_S3_ End of function

        nop                                             ; 0098 _ 90
        nop                                             ; 0099 _ 90
        nop                                             ; 009A _ 90
        nop                                             ; 009B _ 90
        nop                                             ; 009C _ 90
        nop                                             ; 009D _ 90
        nop                                             ; 009E _ 90
        nop                                             ; 009F _ 90


SECTION .xdata$_ZSt4swapIN6Search8RootMoveEEvRT_S3_ align=4 noexecute ; section number 27, const
;  Communal section not supported by YASM

        db 01H, 06H, 03H, 00H, 06H, 82H, 02H, 30H       ; 0000 _ .......0
        db 01H, 60H, 00H, 00H                           ; 0008 _ .`..


SECTION .text$_ZN10ThreadPool4mainEv align=16 execute   ; section number 29, code
;  Communal section not supported by YASM

_ZN10ThreadPool4mainEv:; Function begin
        push    rbx                                     ; 0000 _ 53
        sub     rsp, 32                                 ; 0001 _ 48: 83. EC, 20
        xor     edx, edx                                ; 0005 _ 31. D2
        mov     rbx, rcx                                ; 0007 _ 48: 89. CB
        call    _ZNKSt6vectorIP6ThreadSaIS1_EE14_M_range_checkEy; 000A _ E8, 00000000(rel)
        mov     rax, qword [rbx]                        ; 000F _ 48: 8B. 03
        mov     rax, qword [rax]                        ; 0012 _ 48: 8B. 00
        add     rsp, 32                                 ; 0015 _ 48: 83. C4, 20
        pop     rbx                                     ; 0019 _ 5B
        ret                                             ; 001A _ C3
; _ZN10ThreadPool4mainEv End of function

        nop                                             ; 001B _ 90
        nop                                             ; 001C _ 90
        nop                                             ; 001D _ 90
        nop                                             ; 001E _ 90
        nop                                             ; 001F _ 90


SECTION .xdata$_ZN10ThreadPool4mainEv align=4 noexecute ; section number 30, const
;  Communal section not supported by YASM

        db 01H, 05H, 02H, 00H, 05H, 32H, 01H, 30H       ; 0000 _ .....2.0


SECTION .text$_ZSt4findIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEE4MoveET_SA_SA_RKT0_ align=16 execute ; section number 32, code
;  Communal section not supported by YASM

_ZSt4findIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEE4MoveET_SA_SA_RKT0_:; Function begin
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        xor     r9d, r9d                                ; 0004 _ 45: 31. C9
        call    _ZSt9__find_ifIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops16_Iter_equals_valIK4MoveEEET_SE_SE_T0_St26random_access_iterator_tag; 0007 _ E8, 00000000(rel)
        add     rsp, 40                                 ; 000C _ 48: 83. C4, 28
        ret                                             ; 0010 _ C3
; _ZSt4findIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEE4MoveET_SA_SA_RKT0_ End of function

        nop                                             ; 0011 _ 90
        nop                                             ; 0012 _ 90
        nop                                             ; 0013 _ 90
        nop                                             ; 0014 _ 90
        nop                                             ; 0015 _ 90
        nop                                             ; 0016 _ 90
        nop                                             ; 0017 _ 90
        nop                                             ; 0018 _ 90
        nop                                             ; 0019 _ 90
        nop                                             ; 001A _ 90
        nop                                             ; 001B _ 90
        nop                                             ; 001C _ 90
        nop                                             ; 001D _ 90
        nop                                             ; 001E _ 90
        nop                                             ; 001F _ 90


SECTION .xdata$_ZSt4findIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEE4MoveET_SA_SA_RKT0_ align=4 noexecute ; section number 33, const
;  Communal section not supported by YASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .text$_ZSt9__find_ifIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops16_Iter_equals_valIK4MoveEEET_SE_SE_T0_St26random_access_iterator_tag align=16 execute ; section number 35, code
;  Communal section not supported by YASM

_ZSt9__find_ifIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops16_Iter_equals_valIK4MoveEEET_SE_SE_T0_St26random_access_iterator_tag:; Function begin
        mov     r10, rdx                                ; 0000 _ 49: 89. D2
        mov     rax, rcx                                ; 0003 _ 48: 89. C8
        sub     r10, rcx                                ; 0006 _ 49: 29. CA
        sar     r10, 7                                  ; 0009 _ 49: C1. FA, 07
        test    r10, r10                                ; 000D _ 4D: 85. D2
        jle     ?_0716                                  ; 0010 _ 0F 8E, 00000088
        mov     r11, qword [rcx+8H]                     ; 0016 _ 4C: 8B. 59, 08
        mov     r9d, dword [r8]                         ; 001A _ 45: 8B. 08
        cmp     r9d, dword [r11]                        ; 001D _ 45: 3B. 0B
        jz      ?_0712                                  ; 0020 _ 74, 63
        mov     rax, qword [rcx+28H]                    ; 0022 _ 48: 8B. 41, 28
        cmp     r9d, dword [rax]                        ; 0026 _ 44: 3B. 08
        je      ?_0720                                  ; 0029 _ 0F 84, 0000009C
        mov     r11, qword [rcx+48H]                    ; 002F _ 4C: 8B. 59, 48
        cmp     r9d, dword [r11]                        ; 0033 _ 45: 3B. 0B
        je      ?_0722                                  ; 0036 _ 0F 84, 00000099
        mov     rax, qword [rcx+68H]                    ; 003C _ 48: 8B. 41, 68
        cmp     r9d, dword [rax]                        ; 0040 _ 44: 3B. 08
        je      ?_0721                                  ; 0043 _ 0F 84, 00000087
        shl     r10, 7                                  ; 0049 _ 49: C1. E2, 07
        add     r10, rcx                                ; 004D _ 49: 01. CA
        jmp     ?_0711                                  ; 0050 _ EB, 1E

?_0710: mov     r11, qword [rax+28H]                    ; 0052 _ 4C: 8B. 58, 28
        cmp     dword [r11], r9d                        ; 0056 _ 45: 39. 0B
        jz      ?_0713                                  ; 0059 _ 74, 2B
        mov     r11, qword [rax+48H]                    ; 005B _ 4C: 8B. 58, 48
        cmp     dword [r11], r9d                        ; 005F _ 45: 39. 0B
        jz      ?_0715                                  ; 0062 _ 74, 32
        mov     r11, qword [rax+68H]                    ; 0064 _ 4C: 8B. 58, 68
        cmp     dword [r11], r9d                        ; 0068 _ 45: 39. 0B
        jz      ?_0714                                  ; 006B _ 74, 21
        mov     rcx, rax                                ; 006D _ 48: 89. C1
?_0711: lea     rax, [rcx+80H]                          ; 0070 _ 48: 8D. 81, 00000080
        cmp     rax, r10                                ; 0077 _ 4C: 39. D0
        jz      ?_0716                                  ; 007A _ 74, 22
        mov     r11, qword [rax+8H]                     ; 007C _ 4C: 8B. 58, 08
        cmp     dword [r11], r9d                        ; 0080 _ 45: 39. 0B
        jnz     ?_0710                                  ; 0083 _ 75, CD
?_0712: ret                                             ; 0085 _ C3

?_0713: lea     rax, [rcx+0A0H]                         ; 0086 _ 48: 8D. 81, 000000A0
        ret                                             ; 008D _ C3

?_0714: lea     rax, [rcx+0E0H]                         ; 008E _ 48: 8D. 81, 000000E0
        ret                                             ; 0095 _ C3

?_0715: lea     rax, [rcx+0C0H]                         ; 0096 _ 48: 8D. 81, 000000C0
        ret                                             ; 009D _ C3

?_0716: mov     rcx, rdx                                ; 009E _ 48: 89. D1
        sub     rcx, rax                                ; 00A1 _ 48: 29. C1
        sar     rcx, 5                                  ; 00A4 _ 48: C1. F9, 05
        cmp     rcx, 2                                  ; 00A8 _ 48: 83. F9, 02
        jnz     ?_0723                                  ; 00AC _ 75, 2C
        mov     r10d, dword [r8]                        ; 00AE _ 45: 8B. 10
?_0717: mov     r8, qword [rax+8H]                      ; 00B1 _ 4C: 8B. 40, 08
        cmp     r10d, dword [r8]                        ; 00B5 _ 45: 3B. 10
        jz      ?_0712                                  ; 00B8 _ 74, CB
        add     rax, 32                                 ; 00BA _ 48: 83. C0, 20
?_0718: mov     r11, qword [rax+8H]                     ; 00BE _ 4C: 8B. 58, 08
        cmp     r10d, dword [r11]                       ; 00C2 _ 45: 3B. 13
        jz      ?_0712                                  ; 00C5 _ 74, BE
?_0719: mov     rax, rdx                                ; 00C7 _ 48: 89. D0
        ret                                             ; 00CA _ C3

?_0720: lea     rax, [rcx+20H]                          ; 00CB _ 48: 8D. 41, 20
        ret                                             ; 00CF _ C3

?_0721: lea     rax, [rcx+60H]                          ; 00D0 _ 48: 8D. 41, 60
        ret                                             ; 00D4 _ C3

?_0722: lea     rax, [rcx+40H]                          ; 00D5 _ 48: 8D. 41, 40
        ret                                             ; 00D9 _ C3
; _ZSt9__find_ifIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops16_Iter_equals_valIK4MoveEEET_SE_SE_T0_St26random_access_iterator_tag End of function

?_0723: ; Local function
        cmp     rcx, 3                                  ; 00DA _ 48: 83. F9, 03
        jnz     ?_0724                                  ; 00DE _ 75, 12
        mov     r9, qword [rax+8H]                      ; 00E0 _ 4C: 8B. 48, 08
        mov     r10d, dword [r8]                        ; 00E4 _ 45: 8B. 10
        cmp     r10d, dword [r9]                        ; 00E7 _ 45: 3B. 11
        jz      ?_0712                                  ; 00EA _ 74, 99
        add     rax, 32                                 ; 00EC _ 48: 83. C0, 20
        jmp     ?_0717                                  ; 00F0 _ EB, BF

?_0724: ; Local function
        sub     rcx, 1                                  ; 00F2 _ 48: 83. E9, 01
        jnz     ?_0719                                  ; 00F6 _ 75, CF
        mov     r10d, dword [r8]                        ; 00F8 _ 45: 8B. 10
        jmp     ?_0718                                  ; 00FB _ EB, C1

        nop                                             ; 00FD _ 90
        nop                                             ; 00FE _ 90
        nop                                             ; 00FF _ 90


SECTION .xdata$_ZSt9__find_ifIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops16_Iter_equals_valIK4MoveEEET_SE_SE_T0_St26random_access_iterator_tag align=4 noexecute ; section number 36, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZNSt6vectorI4MoveSaIS0_EE17_M_default_appendEy align=16 execute ; section number 38, code
;  Communal section not supported by YASM

_ZNSt6vectorI4MoveSaIS0_EE17_M_default_appendEy:; Function begin
        push    rbp                                     ; 0000 _ 55
        push    rdi                                     ; 0001 _ 57
        push    rsi                                     ; 0002 _ 56
        push    rbx                                     ; 0003 _ 53
        sub     rsp, 40                                 ; 0004 _ 48: 83. EC, 28
        test    rdx, rdx                                ; 0008 _ 48: 85. D2
        je      ?_0733                                  ; 000B _ 0F 84, 000000BA
        mov     r8, qword [rcx+8H]                      ; 0011 _ 4C: 8B. 41, 08
        mov     rax, qword [rcx+10H]                    ; 0015 _ 48: 8B. 41, 10
        sub     rax, r8                                 ; 0019 _ 4C: 29. C0
        sar     rax, 2                                  ; 001C _ 48: C1. F8, 02
        cmp     rax, rdx                                ; 0020 _ 48: 39. D0
        jc      ?_0726                                  ; 0023 _ 72, 1F
        xor     eax, eax                                ; 0025 _ 31. C0
?_0725: mov     dword [r8+rax*4], 0                     ; 0027 _ 41: C7. 04 80, 00000000
        inc     rax                                     ; 002F _ 48: FF. C0
        cmp     rax, rdx                                ; 0032 _ 48: 39. D0
        jnz     ?_0725                                  ; 0035 _ 75, F0
        lea     rdx, [r8+rax*4]                         ; 0037 _ 49: 8D. 14 80
        mov     qword [rcx+8H], rdx                     ; 003B _ 48: 89. 51, 08
        jmp     ?_0733                                  ; 003F _ E9, 00000087

?_0726: lea     r8, [rel ?_0333]                        ; 0044 _ 4C: 8D. 05, 0000003A(rel)
        mov     rsi, rdx                                ; 004B _ 48: 89. D6
        mov     rbx, rcx                                ; 004E _ 48: 89. CB
        call    _ZNKSt6vectorI4MoveSaIS0_EE12_M_check_lenEyPKc; 0051 _ E8, 00000000(rel)
        xor     edi, edi                                ; 0056 _ 31. FF
        test    rax, rax                                ; 0058 _ 48: 85. C0
        mov     rbp, rax                                ; 005B _ 48: 89. C5
        jz      ?_0727                                  ; 005E _ 74, 0B
        mov     rcx, rax                                ; 0060 _ 48: 89. C1
        call    _ZN9__gnu_cxx13new_allocatorI4MoveE8allocateEyPKv.isra.146; 0063 _ E8, 00001D30(rel)
        mov     rdi, rax                                ; 0068 _ 48: 89. C7
?_0727: mov     rcx, qword [rbx]                        ; 006B _ 48: 8B. 0B
        mov     r10, rdi                                ; 006E _ 49: 89. FA
        mov     r8, qword [rbx+8H]                      ; 0071 _ 4C: 8B. 43, 08
        mov     r11, rcx                                ; 0075 _ 49: 89. CB
?_0728: cmp     r8, r11                                 ; 0078 _ 4D: 39. D8
        jz      ?_0730                                  ; 007B _ 74, 15
        test    r10, r10                                ; 007D _ 4D: 85. D2
        mov     r9d, dword [r11]                        ; 0080 _ 45: 8B. 0B
        jz      ?_0729                                  ; 0083 _ 74, 03
        mov     dword [r10], r9d                        ; 0085 _ 45: 89. 0A
?_0729: add     r10, 4                                  ; 0088 _ 49: 83. C2, 04
        add     r11, 4                                  ; 008C _ 49: 83. C3, 04
        jmp     ?_0728                                  ; 0090 _ EB, E6

?_0730: sub     r8, rcx                                 ; 0092 _ 49: 29. C8
        xor     edx, edx                                ; 0095 _ 31. D2
        and     r8, 0FFFFFFFFFFFFFFFCH                  ; 0097 _ 49: 83. E0, FC
        add     r8, rdi                                 ; 009B _ 49: 01. F8
?_0731: mov     dword [r8+rdx*4], 0                     ; 009E _ 41: C7. 04 90, 00000000
        inc     rdx                                     ; 00A6 _ 48: FF. C2
        cmp     rdx, rsi                                ; 00A9 _ 48: 39. F2
        jnz     ?_0731                                  ; 00AC _ 75, F0
        lea     rsi, [r8+rdx*4]                         ; 00AE _ 49: 8D. 34 90
        test    rcx, rcx                                ; 00B2 _ 48: 85. C9
        jz      ?_0732                                  ; 00B5 _ 74, 05
        call    _ZdlPv                                  ; 00B7 _ E8, 00000000(rel)
?_0732: lea     rcx, [rdi+rbp*4]                        ; 00BC _ 48: 8D. 0C AF
        mov     qword [rbx], rdi                        ; 00C0 _ 48: 89. 3B
        mov     qword [rbx+8H], rsi                     ; 00C3 _ 48: 89. 73, 08
        mov     qword [rbx+10H], rcx                    ; 00C7 _ 48: 89. 4B, 10
?_0733: add     rsp, 40                                 ; 00CB _ 48: 83. C4, 28
        pop     rbx                                     ; 00CF _ 5B
        pop     rsi                                     ; 00D0 _ 5E
        pop     rdi                                     ; 00D1 _ 5F
        pop     rbp                                     ; 00D2 _ 5D
        ret                                             ; 00D3 _ C3
; _ZNSt6vectorI4MoveSaIS0_EE17_M_default_appendEy End of function

        nop                                             ; 00D4 _ 90
        nop                                             ; 00D5 _ 90
        nop                                             ; 00D6 _ 90
        nop                                             ; 00D7 _ 90
        nop                                             ; 00D8 _ 90
        nop                                             ; 00D9 _ 90
        nop                                             ; 00DA _ 90
        nop                                             ; 00DB _ 90
        nop                                             ; 00DC _ 90
        nop                                             ; 00DD _ 90
        nop                                             ; 00DE _ 90
        nop                                             ; 00DF _ 90


SECTION .xdata$_ZNSt6vectorI4MoveSaIS0_EE17_M_default_appendEy align=4 noexecute ; section number 39, const
;  Communal section not supported by YASM

        db 01H, 08H, 05H, 00H, 08H, 42H, 04H, 30H       ; 0000 _ .....B.0
        db 03H, 60H, 02H, 70H, 01H, 50H, 00H, 00H       ; 0008 _ .`.p.P..


SECTION .text$_ZSt21__inplace_stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_ align=16 execute ; section number 41, code
;  Communal section not supported by YASM

_ZSt21__inplace_stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_:; Function begin
        push    rbp                                     ; 0000 _ 55
        push    rdi                                     ; 0001 _ 57
        push    rsi                                     ; 0002 _ 56
        push    rbx                                     ; 0003 _ 53
        sub     rsp, 56                                 ; 0004 _ 48: 83. EC, 38
        mov     rbx, rdx                                ; 0008 _ 48: 89. D3
        mov     rsi, rcx                                ; 000B _ 48: 89. CE
        mov     rdi, rdx                                ; 000E _ 48: 89. D7
        sub     rbx, rcx                                ; 0011 _ 48: 29. CB
        cmp     rbx, 479                                ; 0014 _ 48: 81. FB, 000001DF
        jg      ?_0734                                  ; 001B _ 7F, 0A
        xor     r8d, r8d                                ; 001D _ 45: 31. C0
        call    _ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_; 0020 _ E8, 00000000(rel)
        jmp     ?_0735                                  ; 0025 _ EB, 4F

?_0734: sar     rbx, 6                                  ; 0027 _ 48: C1. FB, 06
        xor     r8d, r8d                                ; 002B _ 45: 31. C0
        shl     rbx, 5                                  ; 002E _ 48: C1. E3, 05
        lea     rbp, [rcx+rbx]                          ; 0032 _ 48: 8D. 2C 19
        sar     rbx, 5                                  ; 0036 _ 48: C1. FB, 05
        mov     rdx, rbp                                ; 003A _ 48: 89. EA
        call    _ZSt21__inplace_stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_; 003D _ E8, FFFFFFBE
        xor     r8d, r8d                                ; 0042 _ 45: 31. C0
        mov     rdx, rdi                                ; 0045 _ 48: 89. FA
        mov     rcx, rbp                                ; 0048 _ 48: 89. E9
        call    _ZSt21__inplace_stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_; 004B _ E8, FFFFFFB0
        mov     rax, rdi                                ; 0050 _ 48: 89. F8
        mov     byte [rsp+28H], 0                       ; 0053 _ C6. 44 24, 28, 00
        mov     r9, rbx                                 ; 0058 _ 49: 89. D9
        sub     rax, rbp                                ; 005B _ 48: 29. E8
        mov     r8, rdi                                 ; 005E _ 49: 89. F8
        mov     rdx, rbp                                ; 0061 _ 48: 89. EA
        sar     rax, 5                                  ; 0064 _ 48: C1. F8, 05
        mov     rcx, rsi                                ; 0068 _ 48: 89. F1
        mov     qword [rsp+20H], rax                    ; 006B _ 48: 89. 44 24, 20
        call    _ZSt22__merge_without_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExNS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_; 0070 _ E8, 00000000(rel)
        nop                                             ; 0075 _ 90
?_0735: add     rsp, 56                                 ; 0076 _ 48: 83. C4, 38
        pop     rbx                                     ; 007A _ 5B
        pop     rsi                                     ; 007B _ 5E
        pop     rdi                                     ; 007C _ 5F
        pop     rbp                                     ; 007D _ 5D
        ret                                             ; 007E _ C3
; _ZSt21__inplace_stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_ End of function

        nop                                             ; 007F _ 90


SECTION .xdata$_ZSt21__inplace_stable_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_ align=4 noexecute ; section number 42, const
;  Communal section not supported by YASM

        db 01H, 08H, 05H, 00H, 08H, 62H, 04H, 30H       ; 0000 _ .....b.0
        db 03H, 60H, 02H, 70H, 01H, 50H, 00H, 00H       ; 0008 _ .`.p.P..


SECTION .text$_ZSt22__stable_sort_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_xNS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_T2_ align=16 execute ; section number 44, code
;  Communal section not supported by YASM

_ZSt22__stable_sort_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_xNS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_T2_:; Function begin
        push    r13                                     ; 0000 _ 41: 55
        push    r12                                     ; 0002 _ 41: 54
        push    rbp                                     ; 0004 _ 55
        push    rdi                                     ; 0005 _ 57
        push    rsi                                     ; 0006 _ 56
        push    rbx                                     ; 0007 _ 53
        sub     rsp, 72                                 ; 0008 _ 48: 83. EC, 48
        mov     rax, rdx                                ; 000C _ 48: 89. D0
        mov     rsi, rcx                                ; 000F _ 48: 89. CE
        mov     rdi, rdx                                ; 0012 _ 48: 89. D7
        sub     rax, rcx                                ; 0015 _ 48: 29. C8
        mov     ecx, 2                                  ; 0018 _ B9, 00000002
        mov     rbp, r8                                 ; 001D _ 4C: 89. C5
        sar     rax, 5                                  ; 0020 _ 48: C1. F8, 05
        mov     r12, r9                                 ; 0024 _ 4D: 89. CC
        add     rax, 1                                  ; 0027 _ 48: 83. C0, 01
        cqo                                             ; 002B _ 48: 99
        idiv    rcx                                     ; 002D _ 48: F7. F9
        mov     r13, rax                                ; 0030 _ 49: 89. C5
        shl     r13, 5                                  ; 0033 _ 49: C1. E5, 05
        cmp     rax, r9                                 ; 0037 _ 4C: 39. C8
        lea     rbx, [rsi+r13]                          ; 003A _ 4A: 8D. 1C 2E
        jg      ?_0737                                  ; 003E _ 7F, 5A
        mov     rdx, rbx                                ; 0040 _ 48: 89. DA
        mov     rcx, rsi                                ; 0043 _ 48: 89. F1
        call    _ZSt24__merge_sort_with_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_NS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_.isra.176; 0046 _ E8, 00001740(rel)
        mov     r8, rbp                                 ; 004B _ 49: 89. E8
        mov     rdx, rdi                                ; 004E _ 48: 89. FA
        mov     rcx, rbx                                ; 0051 _ 48: 89. D9
        call    _ZSt24__merge_sort_with_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_NS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_.isra.176; 0054 _ E8, 00001740(rel)
?_0736: mov     r8, rdi                                 ; 0059 _ 49: 89. F8
        mov     r9, r13                                 ; 005C _ 4D: 89. E9
        mov     byte [rsp+38H], 0                       ; 005F _ C6. 44 24, 38, 00
        mov     rdx, rbx                                ; 0064 _ 48: 89. DA
        sub     r8, rbx                                 ; 0067 _ 49: 29. D8
        mov     qword [rsp+30H], r12                    ; 006A _ 4C: 89. 64 24, 30
        sar     r9, 5                                   ; 006F _ 49: C1. F9, 05
        mov     rcx, rsi                                ; 0073 _ 48: 89. F1
        sar     r8, 5                                   ; 0076 _ 49: C1. F8, 05
        mov     qword [rsp+28H], rbp                    ; 007A _ 48: 89. 6C 24, 28
        mov     qword [rsp+20H], r8                     ; 007F _ 4C: 89. 44 24, 20
        mov     r8, rdi                                 ; 0084 _ 49: 89. F8
        call    _ZSt16__merge_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExS4_NS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_SC_T2_; 0087 _ E8, 00000000(rel)
        nop                                             ; 008C _ 90
        add     rsp, 72                                 ; 008D _ 48: 83. C4, 48
        pop     rbx                                     ; 0091 _ 5B
        pop     rsi                                     ; 0092 _ 5E
        pop     rdi                                     ; 0093 _ 5F
        pop     rbp                                     ; 0094 _ 5D
        pop     r12                                     ; 0095 _ 41: 5C
        pop     r13                                     ; 0097 _ 41: 5D
        ret                                             ; 0099 _ C3
; _ZSt22__stable_sort_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_xNS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_T2_ End of function

?_0737: ; Local function
        mov     rdx, rbx                                ; 009A _ 48: 89. DA
        mov     rcx, rsi                                ; 009D _ 48: 89. F1
        mov     byte [rsp+20H], 0                       ; 00A0 _ C6. 44 24, 20, 00
        call    _ZSt22__stable_sort_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_xNS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_T2_; 00A5 _ E8, FFFFFF56
        mov     byte [rsp+20H], 0                       ; 00AA _ C6. 44 24, 20, 00
        mov     r9, r12                                 ; 00AF _ 4D: 89. E1
        mov     r8, rbp                                 ; 00B2 _ 49: 89. E8
        mov     rdx, rdi                                ; 00B5 _ 48: 89. FA
        mov     rcx, rbx                                ; 00B8 _ 48: 89. D9
        call    _ZSt22__stable_sort_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_xNS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_T2_; 00BB _ E8, FFFFFF40
        jmp     ?_0736                                  ; 00C0 _ EB, 97

        nop                                             ; 00C2 _ 90
        nop                                             ; 00C3 _ 90
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


SECTION .xdata$_ZSt22__stable_sort_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_xNS0_5__ops15_Iter_less_iterEEvT_SB_T0_T1_T2_ align=4 noexecute ; section number 45, const
;  Communal section not supported by YASM

        db 01H, 0CH, 07H, 00H, 0CH, 82H, 08H, 30H       ; 0000 _ .......0
        db 07H, 60H, 06H, 70H, 05H, 50H, 04H, 0C0H      ; 0008 _ .`.p.P..
        db 02H, 0D0H, 00H, 00H                          ; 0010 _ ....


SECTION .text$_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_ align=16 execute ; section number 47, code
;  Communal section not supported by YASM

_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_:; Function begin
        push    r13                                     ; 0000 _ 41: 55
        push    r12                                     ; 0002 _ 41: 54
        push    rbp                                     ; 0004 _ 55
        push    rdi                                     ; 0005 _ 57
        push    rsi                                     ; 0006 _ 56
        push    rbx                                     ; 0007 _ 53
        sub     rsp, 72                                 ; 0008 _ 48: 83. EC, 48
        cmp     rdx, rcx                                ; 000C _ 48: 39. CA
        jz      ?_0740                                  ; 000F _ 74, 34
        lea     rbx, [rcx+20H]                          ; 0011 _ 48: 8D. 59, 20
        cmp     rbx, rdx                                ; 0015 _ 48: 39. D3
        jz      ?_0740                                  ; 0018 _ 74, 2B
        lea     r13, [rsp+28H]                          ; 001A _ 4C: 8D. 6C 24, 28
        mov     rbp, rdx                                ; 001F _ 48: 89. D5
        mov     rsi, rcx                                ; 0022 _ 48: 89. CE
        lea     r12, [rcx+8H]                           ; 0025 _ 4C: 8D. 61, 08
?_0738: mov     eax, dword [rbx]                        ; 0029 _ 8B. 03
        cmp     eax, dword [rsi]                        ; 002B _ 3B. 06
        jg      ?_0741                                  ; 002D _ 7F, 23
        lea     rdi, [rbx+20H]                          ; 002F _ 48: 8D. 7B, 20
        xor     edx, edx                                ; 0033 _ 31. D2
        mov     rcx, rbx                                ; 0035 _ 48: 89. D9
        call    _ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops14_Val_less_iterEEvT_T0_; 0038 _ E8, 00000000(rel)
?_0739: cmp     rbp, rdi                                ; 003D _ 48: 39. FD
        mov     rbx, rdi                                ; 0040 _ 48: 89. FB
        jnz     ?_0738                                  ; 0043 _ 75, E4
?_0740: add     rsp, 72                                 ; 0045 _ 48: 83. C4, 48
        pop     rbx                                     ; 0049 _ 5B
        pop     rsi                                     ; 004A _ 5E
        pop     rdi                                     ; 004B _ 5F
        pop     rbp                                     ; 004C _ 5D
        pop     r12                                     ; 004D _ 41: 5C
        pop     r13                                     ; 004F _ 41: 5D
        ret                                             ; 0051 _ C3
; _ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_ End of function

?_0741: ; Local function
        mov     rcx, qword [rbx+8H]                     ; 0052 _ 48: 8B. 4B, 08
        lea     rdi, [rbx+20H]                          ; 0056 _ 48: 8D. 7B, 20
        mov     qword [rbx+8H], 0                       ; 005A _ 48: C7. 43, 08, 00000000
        mov     r8, qword [rbx+10H]                     ; 0062 _ 4C: 8B. 43, 10
        mov     qword [rbx+10H], 0                      ; 0066 _ 48: C7. 43, 10, 00000000
        mov     edx, dword [rbx+4H]                     ; 006E _ 8B. 53, 04
        mov     dword [rsp+20H], eax                    ; 0071 _ 89. 44 24, 20
        mov     r9, qword [rbx+18H]                     ; 0075 _ 4C: 8B. 4B, 18
        mov     qword [rbx+18H], 0                      ; 0079 _ 48: C7. 43, 18, 00000000
        mov     qword [rsp+28H], rcx                    ; 0081 _ 48: 89. 4C 24, 28
        mov     rcx, rsi                                ; 0086 _ 48: 89. F1
        mov     qword [rsp+30H], r8                     ; 0089 _ 4C: 89. 44 24, 30
        mov     r8, rdi                                 ; 008E _ 49: 89. F8
        mov     dword [rsp+24H], edx                    ; 0091 _ 89. 54 24, 24
        mov     rdx, rbx                                ; 0095 _ 48: 89. DA
        mov     qword [rsp+38H], r9                     ; 0098 _ 4C: 89. 4C 24, 38
        call    _ZNSt20__copy_move_backwardILb1ELb0ESt26random_access_iterator_tagE13__copy_move_bIPN6Search8RootMoveES5_EET0_T_S7_S6_; 009D _ E8, 00000000(rel)
        mov     ebx, dword [rsp+20H]                    ; 00A2 _ 8B. 5C 24, 20
        mov     rcx, r12                                ; 00A6 _ 4C: 89. E1
        mov     rdx, r13                                ; 00A9 _ 4C: 89. EA
        mov     r10d, dword [rsp+24H]                   ; 00AC _ 44: 8B. 54 24, 24
        mov     dword [rsi], ebx                        ; 00B1 _ 89. 1E
        mov     dword [rsi+4H], r10d                    ; 00B3 _ 44: 89. 56, 04
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 00B7 _ E8, 000020F0(rel)
        mov     rcx, qword [rsp+28H]                    ; 00BC _ 48: 8B. 4C 24, 28
        test    rcx, rcx                                ; 00C1 _ 48: 85. C9
        je      ?_0739                                  ; 00C4 _ 0F 84, FFFFFF73
        call    _ZdlPv                                  ; 00CA _ E8, 00000000(rel)
        jmp     ?_0739                                  ; 00CF _ E9, FFFFFF69

        nop                                             ; 00D4 _ 90
        nop                                             ; 00D5 _ 90
        nop                                             ; 00D6 _ 90
        nop                                             ; 00D7 _ 90
        nop                                             ; 00D8 _ 90
        nop                                             ; 00D9 _ 90
        nop                                             ; 00DA _ 90
        nop                                             ; 00DB _ 90
        nop                                             ; 00DC _ 90
        nop                                             ; 00DD _ 90
        nop                                             ; 00DE _ 90
        nop                                             ; 00DF _ 90


SECTION .xdata$_ZSt16__insertion_sortIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops15_Iter_less_iterEEvT_SB_T0_ align=4 noexecute ; section number 48, const
;  Communal section not supported by YASM

        db 01H, 0CH, 07H, 00H, 0CH, 82H, 08H, 30H       ; 0000 _ .......0
        db 07H, 60H, 06H, 70H, 05H, 50H, 04H, 0C0H      ; 0008 _ .`.p.P..
        db 02H, 0D0H, 00H, 00H                          ; 0010 _ ....


SECTION .text$_ZNSt20__copy_move_backwardILb1ELb0ESt26random_access_iterator_tagE13__copy_move_bIPN6Search8RootMoveES5_EET0_T_S7_S6_ align=16 execute ; section number 50, code
;  Communal section not supported by YASM

_ZNSt20__copy_move_backwardILb1ELb0ESt26random_access_iterator_tagE13__copy_move_bIPN6Search8RootMoveES5_EET0_T_S7_S6_:; Function begin
        push    r12                                     ; 0000 _ 41: 54
        push    rbp                                     ; 0002 _ 55
        push    rdi                                     ; 0003 _ 57
        push    rsi                                     ; 0004 _ 56
        push    rbx                                     ; 0005 _ 53
        sub     rsp, 32                                 ; 0006 _ 48: 83. EC, 20
        lea     rsi, [r8-18H]                           ; 000A _ 49: 8D. 70, E8
        mov     rdi, rdx                                ; 000E _ 48: 89. D7
        mov     r12, r8                                 ; 0011 _ 4D: 89. C4
        lea     rbx, [rdx-18H]                          ; 0014 _ 48: 8D. 5A, E8
        sub     rdi, rcx                                ; 0018 _ 48: 29. CF
        sar     rdi, 5                                  ; 001B _ 48: C1. FF, 05
        mov     rbp, rdi                                ; 001F _ 48: 89. FD
?_0742: test    rbp, rbp                                ; 0022 _ 48: 85. ED
        jle     ?_0743                                  ; 0025 _ 7E, 25
        mov     edx, dword [rbx-8H]                     ; 0027 _ 8B. 53, F8
        sub     rbp, 1                                  ; 002A _ 48: 83. ED, 01
        mov     dword [rsi-8H], edx                     ; 002E _ 89. 56, F8
        mov     ecx, dword [rbx-4H]                     ; 0031 _ 8B. 4B, FC
        mov     rdx, rbx                                ; 0034 _ 48: 89. DA
        sub     rbx, 32                                 ; 0037 _ 48: 83. EB, 20
        mov     dword [rsi-4H], ecx                     ; 003B _ 89. 4E, FC
        mov     rcx, rsi                                ; 003E _ 48: 89. F1
        sub     rsi, 32                                 ; 0041 _ 48: 83. EE, 20
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 0045 _ E8, 000020F0(rel)
        jmp     ?_0742                                  ; 004A _ EB, D6
; _ZNSt20__copy_move_backwardILb1ELb0ESt26random_access_iterator_tagE13__copy_move_bIPN6Search8RootMoveES5_EET0_T_S7_S6_ End of function

?_0743: ; Local function
        test    rdi, rdi                                ; 004C _ 48: 85. FF
        mov     eax, 0                                  ; 004F _ B8, 00000000
        cmovs   rdi, rax                                ; 0054 _ 48: 0F 48. F8
        imul    rdi, rdi, -32                           ; 0058 _ 48: 6B. FF, E0
        lea     rax, [r12+rdi]                          ; 005C _ 49: 8D. 04 3C
        add     rsp, 32                                 ; 0060 _ 48: 83. C4, 20
        pop     rbx                                     ; 0064 _ 5B
        pop     rsi                                     ; 0065 _ 5E
        pop     rdi                                     ; 0066 _ 5F
        pop     rbp                                     ; 0067 _ 5D
        pop     r12                                     ; 0068 _ 41: 5C
        ret                                             ; 006A _ C3

        nop                                             ; 006B _ 90
        nop                                             ; 006C _ 90
        nop                                             ; 006D _ 90
        nop                                             ; 006E _ 90
        nop                                             ; 006F _ 90


SECTION .xdata$_ZNSt20__copy_move_backwardILb1ELb0ESt26random_access_iterator_tagE13__copy_move_bIPN6Search8RootMoveES5_EET0_T_S7_S6_ align=4 noexecute ; section number 51, const
;  Communal section not supported by YASM

        db 01H, 0AH, 06H, 00H, 0AH, 32H, 06H, 30H       ; 0000 _ .....2.0
        db 05H, 60H, 04H, 70H, 03H, 50H, 02H, 0C0H      ; 0008 _ .`.p.P..


SECTION .text$_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops14_Val_less_iterEEvT_T0_ align=16 execute ; section number 53, code
;  Communal section not supported by YASM

_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops14_Val_less_iterEEvT_T0_:; Function begin
        push    rbx                                     ; 0000 _ 53
        sub     rsp, 64                                 ; 0001 _ 48: 83. EC, 40
        mov     rbx, qword [rcx+8H]                     ; 0005 _ 48: 8B. 59, 08
        mov     r8, qword [rcx+10H]                     ; 0009 _ 4C: 8B. 41, 10
        mov     r9, qword [rcx+18H]                     ; 000D _ 4C: 8B. 49, 18
        mov     eax, dword [rcx]                        ; 0011 _ 8B. 01
        mov     edx, dword [rcx+4H]                     ; 0013 _ 8B. 51, 04
        mov     qword [rsp+28H], rbx                    ; 0016 _ 48: 89. 5C 24, 28
        mov     rbx, rcx                                ; 001B _ 48: 89. CB
        mov     qword [rcx+8H], 0                       ; 001E _ 48: C7. 41, 08, 00000000
        mov     qword [rsp+30H], r8                     ; 0026 _ 4C: 89. 44 24, 30
        mov     dword [rsp+20H], eax                    ; 002B _ 89. 44 24, 20
        mov     dword [rsp+24H], edx                    ; 002F _ 89. 54 24, 24
        mov     qword [rcx+10H], 0                      ; 0033 _ 48: C7. 41, 10, 00000000
        mov     qword [rsp+38H], r9                     ; 003B _ 4C: 89. 4C 24, 38
        mov     qword [rcx+18H], 0                      ; 0040 _ 48: C7. 41, 18, 00000000
?_0744: mov     ecx, dword [rsp+20H]                    ; 0048 _ 8B. 4C 24, 20
        mov     r10d, dword [rbx-20H]                   ; 004C _ 44: 8B. 53, E0
        cmp     ecx, r10d                               ; 0050 _ 44: 39. D1
        jg      ?_0746                                  ; 0053 _ 7F, 29
        mov     r11d, dword [rsp+24H]                   ; 0055 _ 44: 8B. 5C 24, 24
        mov     dword [rbx], ecx                        ; 005A _ 89. 0B
        lea     rdx, [rsp+28H]                          ; 005C _ 48: 8D. 54 24, 28
        lea     rcx, [rbx+8H]                           ; 0061 _ 48: 8D. 4B, 08
        mov     dword [rbx+4H], r11d                    ; 0065 _ 44: 89. 5B, 04
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 0069 _ E8, 000020F0(rel)
        mov     rcx, qword [rsp+28H]                    ; 006E _ 48: 8B. 4C 24, 28
        test    rcx, rcx                                ; 0073 _ 48: 85. C9
        jnz     ?_0747                                  ; 0076 _ 75, 22
?_0745: add     rsp, 64                                 ; 0078 _ 48: 83. C4, 40
        pop     rbx                                     ; 007C _ 5B
        ret                                             ; 007D _ C3

?_0746: mov     eax, dword [rbx-1CH]                    ; 007E _ 8B. 43, E4
        mov     dword [rbx], r10d                       ; 0081 _ 44: 89. 13
        lea     rdx, [rbx-18H]                          ; 0084 _ 48: 8D. 53, E8
        lea     rcx, [rbx+8H]                           ; 0088 _ 48: 8D. 4B, 08
        sub     rbx, 32                                 ; 008C _ 48: 83. EB, 20
        mov     dword [rbx+24H], eax                    ; 0090 _ 89. 43, 24
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 0093 _ E8, 000020F0(rel)
        jmp     ?_0744                                  ; 0098 _ EB, AE
; _ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops14_Val_less_iterEEvT_T0_ End of function

?_0747: ; Local function
        call    _ZdlPv                                  ; 009A _ E8, 00000000(rel)
        jmp     ?_0745                                  ; 009F _ EB, D7

        nop                                             ; 00A1 _ 90
        nop                                             ; 00A2 _ 90
        nop                                             ; 00A3 _ 90
        nop                                             ; 00A4 _ 90
        nop                                             ; 00A5 _ 90
        nop                                             ; 00A6 _ 90
        nop                                             ; 00A7 _ 90
        nop                                             ; 00A8 _ 90
        nop                                             ; 00A9 _ 90
        nop                                             ; 00AA _ 90
        nop                                             ; 00AB _ 90
        nop                                             ; 00AC _ 90
        nop                                             ; 00AD _ 90
        nop                                             ; 00AE _ 90
        nop                                             ; 00AF _ 90


SECTION .xdata$_ZSt25__unguarded_linear_insertIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEENS0_5__ops14_Val_less_iterEEvT_T0_ align=4 noexecute ; section number 54, const
;  Communal section not supported by YASM

        db 01H, 05H, 02H, 00H, 05H, 72H, 01H, 30H       ; 0000 _ .....r.0


SECTION .text$_ZSt12__move_mergeIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_NS0_5__ops15_Iter_less_iterEET0_T_SC_SC_SC_SB_T1_ align=16 execute ; section number 56, code
;  Communal section not supported by YASM

_ZSt12__move_mergeIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_NS0_5__ops15_Iter_less_iterEET0_T_SC_SC_SC_SB_T1_:; Function begin
        push    r12                                     ; 0000 _ 41: 54
        push    rbp                                     ; 0002 _ 55
        push    rdi                                     ; 0003 _ 57
        push    rsi                                     ; 0004 _ 56
        push    rbx                                     ; 0005 _ 53
        sub     rsp, 32                                 ; 0006 _ 48: 83. EC, 20
        mov     rax, qword [rsp+70H]                    ; 000A _ 48: 8B. 44 24, 70
        mov     rdi, rdx                                ; 000F _ 48: 89. D7
        mov     r12, r9                                 ; 0012 _ 4D: 89. CC
        mov     rbx, rcx                                ; 0015 _ 48: 89. CB
        lea     rsi, [rax+8H]                           ; 0018 _ 48: 8D. 70, 08
        mov     rbp, r8                                 ; 001C _ 4C: 89. C5
        jmp     ?_0750                                  ; 001F _ EB, 2D

?_0748: cmp     rbp, r12                                ; 0021 _ 4C: 39. E5
        jz      ?_0751                                  ; 0024 _ 74, 37
        mov     ecx, dword [rbp]                        ; 0026 _ 8B. 4D, 00
        mov     edx, dword [rbx]                        ; 0029 _ 8B. 13
        cmp     ecx, edx                                ; 002B _ 39. D1
        jg      ?_0752                                  ; 002D _ 7F, 4E
        mov     dword [rsi-8H], edx                     ; 002F _ 89. 56, F8
        mov     r8d, dword [rbx+4H]                     ; 0032 _ 44: 8B. 43, 04
        lea     rdx, [rbx+8H]                           ; 0036 _ 48: 8D. 53, 08
        mov     rcx, rsi                                ; 003A _ 48: 89. F1
        add     rbx, 32                                 ; 003D _ 48: 83. C3, 20
        mov     dword [rsi-4H], r8d                     ; 0041 _ 44: 89. 46, FC
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 0045 _ E8, 000020F0(rel)
?_0749: add     rsi, 32                                 ; 004A _ 48: 83. C6, 20
?_0750: lea     r8, [rsi-8H]                            ; 004E _ 4C: 8D. 46, F8
        cmp     rdi, rbx                                ; 0052 _ 48: 39. DF
        mov     rdx, rdi                                ; 0055 _ 48: 89. FA
        jnz     ?_0748                                  ; 0058 _ 75, C7
        mov     rdx, rbx                                ; 005A _ 48: 89. DA
?_0751: mov     rcx, rbx                                ; 005D _ 48: 89. D9
        call    _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_; 0060 _ E8, 00000000(rel)
        mov     rdx, r12                                ; 0065 _ 4C: 89. E2
        mov     rcx, rbp                                ; 0068 _ 48: 89. E9
        mov     r8, rax                                 ; 006B _ 49: 89. C0
        add     rsp, 32                                 ; 006E _ 48: 83. C4, 20
        pop     rbx                                     ; 0072 _ 5B
        pop     rsi                                     ; 0073 _ 5E
        pop     rdi                                     ; 0074 _ 5F
        pop     rbp                                     ; 0075 _ 5D
        pop     r12                                     ; 0076 _ 41: 5C
        jmp     _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_; 0078 _ E9, 00000000(rel)
; _ZSt12__move_mergeIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_NS0_5__ops15_Iter_less_iterEET0_T_SC_SC_SC_SB_T1_ End of function

?_0752: ; Local function
        mov     dword [rsi-8H], ecx                     ; 007D _ 89. 4E, F8
        mov     r9d, dword [rbp+4H]                     ; 0080 _ 44: 8B. 4D, 04
        lea     rdx, [rbp+8H]                           ; 0084 _ 48: 8D. 55, 08
        mov     rcx, rsi                                ; 0088 _ 48: 89. F1
        add     rbp, 32                                 ; 008B _ 48: 83. C5, 20
        mov     dword [rsi-4H], r9d                     ; 008F _ 44: 89. 4E, FC
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 0093 _ E8, 000020F0(rel)
        jmp     ?_0749                                  ; 0098 _ EB, B0

        nop                                             ; 009A _ 90
        nop                                             ; 009B _ 90
        nop                                             ; 009C _ 90
        nop                                             ; 009D _ 90
        nop                                             ; 009E _ 90
        nop                                             ; 009F _ 90


SECTION .xdata$_ZSt12__move_mergeIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEES4_NS0_5__ops15_Iter_less_iterEET0_T_SC_SC_SC_SB_T1_ align=4 noexecute ; section number 57, const
;  Communal section not supported by YASM

        db 01H, 0AH, 06H, 00H, 0AH, 32H, 06H, 30H       ; 0000 _ .....2.0
        db 05H, 60H, 04H, 70H, 03H, 50H, 02H, 0C0H      ; 0008 _ .`.p.P..


SECTION .text$_ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_ align=16 execute ; section number 59, code
;  Communal section not supported by YASM

_ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_:; Function begin
        push    r12                                     ; 0000 _ 41: 54
        push    rbp                                     ; 0002 _ 55
        push    rdi                                     ; 0003 _ 57
        push    rsi                                     ; 0004 _ 56
        push    rbx                                     ; 0005 _ 53
        sub     rsp, 48                                 ; 0006 _ 48: 83. EC, 30
        mov     r12, rdx                                ; 000A _ 49: 89. D4
        mov     rbx, rcx                                ; 000D _ 48: 89. CB
        sub     r12, rcx                                ; 0010 _ 49: 29. CC
        cmp     r12, 31                                 ; 0013 _ 49: 83. FC, 1F
        jle     ?_0759                                  ; 0017 _ 0F 8E, 000001CE
        mov     ecx, dword [rcx]                        ; 001D _ 8B. 09
        lea     rax, [r12-20H]                          ; 001F _ 49: 8D. 44 24, E0
        shr     rax, 5                                  ; 0024 _ 48: C1. E8, 05
        and     eax, 01H                                ; 0028 _ 83. E0, 01
        mov     rdi, rax                                ; 002B _ 48: 89. C7
        mov     dword [r8], ecx                         ; 002E _ 41: 89. 08
        mov     rcx, qword [r8+8H]                      ; 0031 _ 49: 8B. 48, 08
        mov     esi, dword [rbx+4H]                     ; 0035 _ 8B. 73, 04
        mov     qword [r8+10H], 0                       ; 0038 _ 49: C7. 40, 10, 00000000
        mov     qword [r8+18H], 0                       ; 0040 _ 49: C7. 40, 18, 00000000
        mov     qword [r8+8H], 0                        ; 0048 _ 49: C7. 40, 08, 00000000
        mov     r9, qword [rbx+8H]                      ; 0050 _ 4C: 8B. 4B, 08
        test    rcx, rcx                                ; 0054 _ 48: 85. C9
        mov     dword [r8+4H], esi                      ; 0057 _ 41: 89. 70, 04
        mov     qword [r8+8H], r9                       ; 005B _ 4D: 89. 48, 08
        mov     r10, qword [rbx+10H]                    ; 005F _ 4C: 8B. 53, 10
        mov     qword [rbx+8H], 0                       ; 0063 _ 48: C7. 43, 08, 00000000
        mov     rbp, qword [r8+10H]                     ; 006B _ 49: 8B. 68, 10
        mov     qword [r8+10H], r10                     ; 006F _ 4D: 89. 50, 10
        mov     rax, qword [rbx+18H]                    ; 0073 _ 48: 8B. 43, 18
        mov     qword [rbx+10H], rbp                    ; 0077 _ 48: 89. 6B, 10
        mov     r11, qword [r8+18H]                     ; 007B _ 4D: 8B. 58, 18
        mov     qword [r8+18H], rax                     ; 007F _ 49: 89. 40, 18
        mov     qword [rbx+18H], r11                    ; 0083 _ 4C: 89. 5B, 18
        jne     ?_0760                                  ; 0087 _ 0F 85, 0000016C
?_0753: lea     rsi, [r8+20H]                           ; 008D _ 49: 8D. 70, 20
        add     rbx, 32                                 ; 0091 _ 48: 83. C3, 20
        cmp     rbx, rdx                                ; 0095 _ 48: 39. D3
        je      ?_0758                                  ; 0098 _ 0F 84, 0000014A
        test    rdi, rdi                                ; 009E _ 48: 85. FF
        jz      ?_0755                                  ; 00A1 _ 74, 70
        mov     edi, dword [rbx]                        ; 00A3 _ 8B. 3B
        mov     dword [rsi], edi                        ; 00A5 _ 89. 3E
        mov     ecx, dword [rbx+4H]                     ; 00A7 _ 8B. 4B, 04
        mov     qword [rsi+10H], 0                      ; 00AA _ 48: C7. 46, 10, 00000000
        mov     qword [rsi+18H], 0                      ; 00B2 _ 48: C7. 46, 18, 00000000
        mov     dword [rsi+4H], ecx                     ; 00BA _ 89. 4E, 04
        mov     rcx, qword [rsi+8H]                     ; 00BD _ 48: 8B. 4E, 08
        mov     qword [rsi+8H], 0                       ; 00C1 _ 48: C7. 46, 08, 00000000
        mov     r9, qword [rbx+8H]                      ; 00C9 _ 4C: 8B. 4B, 08
        test    rcx, rcx                                ; 00CD _ 48: 85. C9
        mov     qword [rsi+8H], r9                      ; 00D0 _ 4C: 89. 4E, 08
        mov     r10, qword [rbx+10H]                    ; 00D4 _ 4C: 8B. 53, 10
        mov     qword [rbx+8H], 0                       ; 00D8 _ 48: C7. 43, 08, 00000000
        mov     rbp, qword [rsi+10H]                    ; 00E0 _ 48: 8B. 6E, 10
        mov     qword [rsi+10H], r10                    ; 00E4 _ 4C: 89. 56, 10
        mov     rax, qword [rbx+18H]                    ; 00E8 _ 48: 8B. 43, 18
        mov     qword [rbx+10H], rbp                    ; 00EC _ 48: 89. 6B, 10
        mov     r11, qword [rsi+18H]                    ; 00F0 _ 4C: 8B. 5E, 18
        mov     qword [rsi+18H], rax                    ; 00F4 _ 48: 89. 46, 18
        mov     qword [rbx+18H], r11                    ; 00F8 _ 4C: 89. 5B, 18
        jne     ?_0763                                  ; 00FC _ 0F 85, 0000014E
?_0754: add     rbx, 32                                 ; 0102 _ 48: 83. C3, 20
        add     rsi, 32                                 ; 0106 _ 48: 83. C6, 20
        cmp     rbx, rdx                                ; 010A _ 48: 39. D3
        je      ?_0758                                  ; 010D _ 0F 84, 000000D5
?_0755: mov     edi, dword [rbx]                        ; 0113 _ 8B. 3B
        mov     dword [rsi], edi                        ; 0115 _ 89. 3E
        mov     ecx, dword [rbx+4H]                     ; 0117 _ 8B. 4B, 04
        mov     qword [rsi+10H], 0                      ; 011A _ 48: C7. 46, 10, 00000000
        mov     qword [rsi+18H], 0                      ; 0122 _ 48: C7. 46, 18, 00000000
        mov     dword [rsi+4H], ecx                     ; 012A _ 89. 4E, 04
        mov     rcx, qword [rsi+8H]                     ; 012D _ 48: 8B. 4E, 08
        mov     qword [rsi+8H], 0                       ; 0131 _ 48: C7. 46, 08, 00000000
        mov     r9, qword [rbx+8H]                      ; 0139 _ 4C: 8B. 4B, 08
        test    rcx, rcx                                ; 013D _ 48: 85. C9
        mov     qword [rsi+8H], r9                      ; 0140 _ 4C: 89. 4E, 08
        mov     r10, qword [rbx+10H]                    ; 0144 _ 4C: 8B. 53, 10
        mov     qword [rbx+8H], 0                       ; 0148 _ 48: C7. 43, 08, 00000000
        mov     rbp, qword [rsi+10H]                    ; 0150 _ 48: 8B. 6E, 10
        mov     qword [rsi+10H], r10                    ; 0154 _ 4C: 89. 56, 10
        mov     rax, qword [rbx+18H]                    ; 0158 _ 48: 8B. 43, 18
        mov     qword [rbx+10H], rbp                    ; 015C _ 48: 89. 6B, 10
        mov     r11, qword [rsi+18H]                    ; 0160 _ 4C: 8B. 5E, 18
        mov     qword [rsi+18H], rax                    ; 0164 _ 48: 89. 46, 18
        mov     qword [rbx+18H], r11                    ; 0168 _ 4C: 89. 5B, 18
        jne     ?_0762                                  ; 016C _ 0F 85, 000000C0
?_0756: lea     rbp, [rbx+20H]                          ; 0172 _ 48: 8D. 6B, 20
        mov     ebx, dword [rbx+20H]                    ; 0176 _ 8B. 5B, 20
        lea     rdi, [rsi+20H]                          ; 0179 _ 48: 8D. 7E, 20
        mov     rcx, qword [rdi+8H]                     ; 017D _ 48: 8B. 4F, 08
        mov     dword [rsi+20H], ebx                    ; 0181 _ 89. 5E, 20
        mov     esi, dword [rbp+4H]                     ; 0184 _ 8B. 75, 04
        mov     qword [rdi+10H], 0                      ; 0187 _ 48: C7. 47, 10, 00000000
        test    rcx, rcx                                ; 018F _ 48: 85. C9
        mov     qword [rdi+18H], 0                      ; 0192 _ 48: C7. 47, 18, 00000000
        mov     qword [rdi+8H], 0                       ; 019A _ 48: C7. 47, 08, 00000000
        mov     r9, qword [rbp+8H]                      ; 01A2 _ 4C: 8B. 4D, 08
        mov     dword [rdi+4H], esi                     ; 01A6 _ 89. 77, 04
        mov     qword [rdi+8H], r9                      ; 01A9 _ 4C: 89. 4F, 08
        mov     r11, qword [rbp+10H]                    ; 01AD _ 4C: 8B. 5D, 10
        mov     qword [rbp+8H], 0                       ; 01B1 _ 48: C7. 45, 08, 00000000
        mov     r10, qword [rdi+10H]                    ; 01B9 _ 4C: 8B. 57, 10
        mov     qword [rdi+10H], r11                    ; 01BD _ 4C: 89. 5F, 10
        mov     rbx, qword [rbp+18H]                    ; 01C1 _ 48: 8B. 5D, 18
        mov     qword [rbp+10H], r10                    ; 01C5 _ 4C: 89. 55, 10
        mov     rax, qword [rdi+18H]                    ; 01C9 _ 48: 8B. 47, 18
        mov     qword [rdi+18H], rbx                    ; 01CD _ 48: 89. 5F, 18
        mov     qword [rbp+18H], rax                    ; 01D1 _ 48: 89. 45, 18
        jnz     ?_0761                                  ; 01D5 _ 75, 40
?_0757: lea     rbx, [rbp+20H]                          ; 01D7 _ 48: 8D. 5D, 20
        lea     rsi, [rdi+20H]                          ; 01DB _ 48: 8D. 77, 20
        cmp     rbx, rdx                                ; 01DF _ 48: 39. D3
        jne     ?_0755                                  ; 01E2 _ 0F 85, FFFFFF2B
?_0758: add     r8, r12                                 ; 01E8 _ 4D: 01. E0
?_0759: mov     rax, r8                                 ; 01EB _ 4C: 89. C0
        add     rsp, 48                                 ; 01EE _ 48: 83. C4, 30
        pop     rbx                                     ; 01F2 _ 5B
        pop     rsi                                     ; 01F3 _ 5E
        pop     rdi                                     ; 01F4 _ 5F
        pop     rbp                                     ; 01F5 _ 5D
        pop     r12                                     ; 01F6 _ 41: 5C
        ret                                             ; 01F8 _ C3

?_0760: mov     qword [rsp+28H], r8                     ; 01F9 _ 4C: 89. 44 24, 28
        mov     qword [rsp+20H], rdx                    ; 01FE _ 48: 89. 54 24, 20
        call    _ZdlPv                                  ; 0203 _ E8, 00000000(rel)
        mov     r8, qword [rsp+28H]                     ; 0208 _ 4C: 8B. 44 24, 28
        mov     rdx, qword [rsp+20H]                    ; 020D _ 48: 8B. 54 24, 20
        jmp     ?_0753                                  ; 0212 _ E9, FFFFFE76

?_0761: mov     qword [rsp+28H], r8                     ; 0217 _ 4C: 89. 44 24, 28
        mov     qword [rsp+20H], rdx                    ; 021C _ 48: 89. 54 24, 20
        call    _ZdlPv                                  ; 0221 _ E8, 00000000(rel)
        mov     r8, qword [rsp+28H]                     ; 0226 _ 4C: 8B. 44 24, 28
        mov     rdx, qword [rsp+20H]                    ; 022B _ 48: 8B. 54 24, 20
        jmp     ?_0757                                  ; 0230 _ EB, A5

?_0762: mov     qword [rsp+28H], r8                     ; 0232 _ 4C: 89. 44 24, 28
        mov     qword [rsp+20H], rdx                    ; 0237 _ 48: 89. 54 24, 20
        call    _ZdlPv                                  ; 023C _ E8, 00000000(rel)
        mov     r8, qword [rsp+28H]                     ; 0241 _ 4C: 8B. 44 24, 28
        mov     rdx, qword [rsp+20H]                    ; 0246 _ 48: 8B. 54 24, 20
        jmp     ?_0756                                  ; 024B _ E9, FFFFFF22
; _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_ End of function

?_0763: ; Local function
        mov     qword [rsp+28H], r8                     ; 0250 _ 4C: 89. 44 24, 28
        mov     qword [rsp+20H], rdx                    ; 0255 _ 48: 89. 54 24, 20
        call    _ZdlPv                                  ; 025A _ E8, 00000000(rel)
        mov     r8, qword [rsp+28H]                     ; 025F _ 4C: 8B. 44 24, 28
        mov     rdx, qword [rsp+20H]                    ; 0264 _ 48: 8B. 54 24, 20
        jmp     ?_0754                                  ; 0269 _ E9, FFFFFE94

        nop                                             ; 026E _ 90
        nop                                             ; 026F _ 90


SECTION .xdata$_ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_ align=4 noexecute ; section number 60, const
;  Communal section not supported by YASM

        db 01H, 0AH, 06H, 00H, 0AH, 52H, 06H, 30H       ; 0000 _ .....R.0
        db 05H, 60H, 04H, 70H, 03H, 50H, 02H, 0C0H      ; 0008 _ .`.p.P..


SECTION .text$_ZSt16__merge_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExS4_NS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_SC_T2_ align=16 execute ; section number 62, code
;  Communal section not supported by YASM

_ZSt16__merge_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExS4_NS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_SC_T2_:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 104                                ; 000C _ 48: 83. EC, 68
        mov     r10, qword [rsp+0E0H]                   ; 0010 _ 4C: 8B. 94 24, 000000E0
        mov     r12, qword [rsp+0D0H]                   ; 0018 _ 4C: 8B. A4 24, 000000D0
        mov     rbx, qword [rsp+0D8H]                   ; 0020 _ 48: 8B. 9C 24, 000000D8
        cmp     r9, r10                                 ; 0028 _ 4D: 39. D1
        mov     rsi, rcx                                ; 002B _ 48: 89. CE
        mov     rbp, rdx                                ; 002E _ 48: 89. D5
        mov     rdi, r8                                 ; 0031 _ 4C: 89. C7
        mov     r13, rcx                                ; 0034 _ 49: 89. CD
        mov     r14, rdx                                ; 0037 _ 49: 89. D6
        mov     r15, r8                                 ; 003A _ 4D: 89. C7
        jg      ?_0768                                  ; 003D _ 7F, 67
        cmp     r9, r12                                 ; 003F _ 4D: 39. E1
        jg      ?_0768                                  ; 0042 _ 7F, 62
        mov     rdx, rbp                                ; 0044 _ 48: 89. EA
        mov     r8, rbx                                 ; 0047 _ 49: 89. D8
        add     rsi, 8                                  ; 004A _ 48: 83. C6, 08
        call    _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_; 004E _ E8, 00000000(rel)
        mov     rbp, rax                                ; 0053 _ 48: 89. C5
        jmp     ?_0766                                  ; 0056 _ EB, 34

?_0764: cmp     r14, rdi                                ; 0058 _ 49: 39. FE
        je      ?_0779                                  ; 005B _ 0F 84, 00000176
        mov     r8d, dword [r14]                        ; 0061 _ 45: 8B. 06
        mov     ecx, dword [rbx]                        ; 0064 _ 8B. 0B
        cmp     r8d, ecx                                ; 0066 _ 41: 39. C8
        jg      ?_0773                                  ; 0069 _ 0F 8F, 000000CB
        mov     dword [rsi-8H], ecx                     ; 006F _ 89. 4E, F8
        mov     eax, dword [rbx+4H]                     ; 0072 _ 8B. 43, 04
        lea     rdx, [rbx+8H]                           ; 0075 _ 48: 8D. 53, 08
        mov     rcx, rsi                                ; 0079 _ 48: 89. F1
        add     rbx, 32                                 ; 007C _ 48: 83. C3, 20
        mov     dword [rsi-4H], eax                     ; 0080 _ 89. 46, FC
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 0083 _ E8, 000020F0(rel)
?_0765: add     rsi, 32                                 ; 0088 _ 48: 83. C6, 20
?_0766: lea     r8, [rsi-8H]                            ; 008C _ 4C: 8D. 46, F8
        cmp     rbp, rbx                                ; 0090 _ 48: 39. DD
        jnz     ?_0764                                  ; 0093 _ 75, C3
?_0767: add     rsp, 104                                ; 0095 _ 48: 83. C4, 68
        pop     rbx                                     ; 0099 _ 5B
        pop     rsi                                     ; 009A _ 5E
        pop     rdi                                     ; 009B _ 5F
        pop     rbp                                     ; 009C _ 5D
        pop     r12                                     ; 009D _ 41: 5C
        pop     r13                                     ; 009F _ 41: 5D
        pop     r14                                     ; 00A1 _ 41: 5E
        pop     r15                                     ; 00A3 _ 41: 5F
        ret                                             ; 00A5 _ C3

?_0768: cmp     r12, r10                                ; 00A6 _ 4D: 39. D4
        jg      ?_0777                                  ; 00A9 _ 0F 8F, 000000D2
        mov     r8, rbx                                 ; 00AF _ 49: 89. D8
        mov     rdx, rdi                                ; 00B2 _ 48: 89. FA
        mov     rcx, rbp                                ; 00B5 _ 48: 89. E9
        call    _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_; 00B8 _ E8, 00000000(rel)
        cmp     rbp, rsi                                ; 00BD _ 48: 39. F5
        je      ?_0776                                  ; 00C0 _ 0F 84, 000000B3
        cmp     rbx, rax                                ; 00C6 _ 48: 39. C3
        jz      ?_0767                                  ; 00C9 _ 74, CA
        lea     r13, [rax-20H]                          ; 00CB _ 4C: 8D. 68, E0
        sub     rbp, 32                                 ; 00CF _ 48: 83. ED, 20
?_0769: mov     r12, r15                                ; 00D3 _ 4D: 89. FC
        jmp     ?_0771                                  ; 00D6 _ EB, 04

?_0770: sub     r13, 32                                 ; 00D8 _ 49: 83. ED, 20
?_0771: mov     r14d, dword [r13]                       ; 00DC _ 45: 8B. 75, 00
        mov     edx, dword [rbp]                        ; 00E0 _ 8B. 55, 00
        cmp     r14d, edx                               ; 00E3 _ 41: 39. D6
        jg      ?_0772                                  ; 00E6 _ 7F, 27
        mov     dword [r12-20H], r14d                   ; 00E8 _ 45: 89. 74 24, E0
        sub     r12, 32                                 ; 00ED _ 49: 83. EC, 20
        mov     r9d, dword [r13+4H]                     ; 00F1 _ 45: 8B. 4D, 04
        lea     rdx, [r13+8H]                           ; 00F5 _ 49: 8D. 55, 08
        lea     rcx, [r12+8H]                           ; 00F9 _ 49: 8D. 4C 24, 08
        mov     dword [r12+4H], r9d                     ; 00FE _ 45: 89. 4C 24, 04
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 0103 _ E8, 000020F0(rel)
        cmp     rbx, r13                                ; 0108 _ 4C: 39. EB
        jnz     ?_0770                                  ; 010B _ 75, CB
        jmp     ?_0767                                  ; 010D _ EB, 86

?_0772: mov     dword [r12-20H], edx                    ; 010F _ 41: 89. 54 24, E0
        mov     r8d, dword [rbp+4H]                     ; 0114 _ 44: 8B. 45, 04
        lea     r15, [r12-20H]                          ; 0118 _ 4D: 8D. 7C 24, E0
        lea     rdx, [rbp+8H]                           ; 011D _ 48: 8D. 55, 08
        lea     rcx, [r15+8H]                           ; 0121 _ 49: 8D. 4F, 08
        mov     dword [r12-1CH], r8d                    ; 0125 _ 45: 89. 44 24, E4
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 012A _ E8, 000020F0(rel)
        cmp     rbp, rsi                                ; 012F _ 48: 39. F5
        jz      ?_0774                                  ; 0132 _ 74, 26
        sub     rbp, 32                                 ; 0134 _ 48: 83. ED, 20
        jmp     ?_0769                                  ; 0138 _ EB, 99

?_0773: mov     dword [rsi-8H], r8d                     ; 013A _ 44: 89. 46, F8
        mov     edx, dword [r14+4H]                     ; 013E _ 41: 8B. 56, 04
        mov     rcx, rsi                                ; 0142 _ 48: 89. F1
        mov     dword [rsi-4H], edx                     ; 0145 _ 89. 56, FC
        lea     rdx, [r14+8H]                           ; 0148 _ 49: 8D. 56, 08
        add     r14, 32                                 ; 014C _ 49: 83. C6, 20
        call    _ZNSt6vectorI4MoveSaIS0_EE14_M_move_assignEOS2_St17integral_constantIbLb1EE.isra.121; 0150 _ E8, 000020F0(rel)
        jmp     ?_0765                                  ; 0155 _ E9, FFFFFF2E

?_0774: lea     rdx, [r13+20H]                          ; 015A _ 49: 8D. 55, 20
        mov     r8, r15                                 ; 015E _ 4D: 89. F8
?_0775: mov     rcx, rbx                                ; 0161 _ 48: 89. D9
        add     rsp, 104                                ; 0164 _ 48: 83. C4, 68
        pop     rbx                                     ; 0168 _ 5B
        pop     rsi                                     ; 0169 _ 5E
        pop     rdi                                     ; 016A _ 5F
        pop     rbp                                     ; 016B _ 5D
        pop     r12                                     ; 016C _ 41: 5C
        pop     r13                                     ; 016E _ 41: 5D
        pop     r14                                     ; 0170 _ 41: 5E
        pop     r15                                     ; 0172 _ 41: 5F
        jmp     _ZNSt20__copy_move_backwardILb1ELb0ESt26random_access_iterator_tagE13__copy_move_bIPN6Search8RootMoveES5_EET0_T_S7_S6_; 0174 _ E9, 00000000(rel)

?_0776: mov     r8, rdi                                 ; 0179 _ 49: 89. F8
        mov     rdx, rax                                ; 017C _ 48: 89. C2
        jmp     ?_0775                                  ; 017F _ EB, E0

?_0777: cmp     r9, r12                                 ; 0181 _ 4D: 39. E1
        mov     r11d, 2                                 ; 0184 _ 41: BB, 00000002
        jle     ?_0785                                  ; 018A _ 0F 8E, 0000019F
        mov     rax, r9                                 ; 0190 _ 4C: 89. C8
        mov     r14, rbp                                ; 0193 _ 49: 89. EE
        cqo                                             ; 0196 _ 48: 99
        idiv    r11                                     ; 0198 _ 49: F7. FB
        mov     qword [rsp+40H], rax                    ; 019B _ 48: 89. 44 24, 40
        shl     rax, 5                                  ; 01A0 _ 48: C1. E0, 05
        mov     r13, rax                                ; 01A4 _ 49: 89. C5
        mov     rax, rdi                                ; 01A7 _ 48: 89. F8
        sub     rax, rbp                                ; 01AA _ 48: 29. E8
        add     r13, rsi                                ; 01AD _ 49: 01. F5
        sar     rax, 5                                  ; 01B0 _ 48: C1. F8, 05
?_0778: test    rax, rax                                ; 01B4 _ 48: 85. C0
        jle     ?_0781                                  ; 01B7 _ 7E, 46
        mov     r15, rax                                ; 01B9 _ 49: 89. C7
        mov     r11d, dword [r13]                       ; 01BC _ 45: 8B. 5D, 00
        sar     r15, 1                                  ; 01C0 _ 49: D1. FF
        mov     rcx, r15                                ; 01C3 _ 4C: 89. F9
        shl     rcx, 5                                  ; 01C6 _ 48: C1. E1, 05
        add     rcx, r14                                ; 01CA _ 4C: 01. F1
        cmp     dword [rcx], r11d                       ; 01CD _ 44: 39. 19
        jg      ?_0780                                  ; 01D0 _ 7F, 20
        mov     rax, r15                                ; 01D2 _ 4C: 89. F8
        jmp     ?_0778                                  ; 01D5 _ EB, DD

?_0779: mov     rdx, rbp                                ; 01D7 _ 48: 89. EA
        mov     rcx, rbx                                ; 01DA _ 48: 89. D9
        add     rsp, 104                                ; 01DD _ 48: 83. C4, 68
        pop     rbx                                     ; 01E1 _ 5B
        pop     rsi                                     ; 01E2 _ 5E
        pop     rdi                                     ; 01E3 _ 5F
        pop     rbp                                     ; 01E4 _ 5D
        pop     r12                                     ; 01E5 _ 41: 5C
        pop     r13                                     ; 01E7 _ 41: 5D
        pop     r14                                     ; 01E9 _ 41: 5E
        pop     r15                                     ; 01EB _ 41: 5F
        jmp     _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_; 01ED _ E9, 00000000(rel)

?_0780: lea     r14, [rcx+20H]                          ; 01F2 _ 4C: 8D. 71, 20
        sub     rax, r15                                ; 01F6 _ 4C: 29. F8
        sub     rax, 1                                  ; 01F9 _ 48: 83. E8, 01
        jmp     ?_0778                                  ; 01FD _ EB, B5

?_0781: mov     r15, r14                                ; 01FF _ 4D: 89. F7
        sub     r15, rbp                                ; 0202 _ 49: 29. EF
        sar     r15, 5                                  ; 0205 _ 49: C1. FF, 05
?_0782: sub     r9, qword [rsp+40H]                     ; 0209 _ 4C: 2B. 4C 24, 40
        cmp     r15, r9                                 ; 020E _ 4D: 39. CF
        mov     qword [rsp+48H], r9                     ; 0211 _ 4C: 89. 4C 24, 48
        jge     ?_0784                                  ; 0216 _ 0F 8D, 000000B9
        cmp     r15, r10                                ; 021C _ 4D: 39. D7
        jg      ?_0784                                  ; 021F _ 0F 8F, 000000B0
        test    r15, r15                                ; 0225 _ 4D: 85. FF
        mov     rax, r13                                ; 0228 _ 4C: 89. E8
        jz      ?_0783                                  ; 022B _ 74, 3B
        mov     r8, rbx                                 ; 022D _ 49: 89. D8
        mov     rdx, r14                                ; 0230 _ 4C: 89. F2
        mov     rcx, rbp                                ; 0233 _ 48: 89. E9
        mov     qword [rsp+58H], r10                    ; 0236 _ 4C: 89. 54 24, 58
        call    _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_; 023B _ E8, 00000000(rel)
        mov     r8, r14                                 ; 0240 _ 4D: 89. F0
        mov     rdx, rbp                                ; 0243 _ 48: 89. EA
        mov     rcx, r13                                ; 0246 _ 4C: 89. E9
        mov     qword [rsp+50H], rax                    ; 0249 _ 48: 89. 44 24, 50
        call    _ZNSt20__copy_move_backwardILb1ELb0ESt26random_access_iterator_tagE13__copy_move_bIPN6Search8RootMoveES5_EET0_T_S7_S6_; 024E _ E8, 00000000(rel)
        mov     rdx, qword [rsp+50H]                    ; 0253 _ 48: 8B. 54 24, 50
        mov     r8, r13                                 ; 0258 _ 4D: 89. E8
        mov     rcx, rbx                                ; 025B _ 48: 89. D9
        call    _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_; 025E _ E8, 00000000(rel)
        mov     r10, qword [rsp+58H]                    ; 0263 _ 4C: 8B. 54 24, 58
?_0783: mov     r9, qword [rsp+40H]                     ; 0268 _ 4C: 8B. 4C 24, 40
        mov     qword [rsp+28H], rbx                    ; 026D _ 48: 89. 5C 24, 28
        mov     r8, rax                                 ; 0272 _ 49: 89. C0
        mov     rdx, r13                                ; 0275 _ 4C: 89. EA
        mov     rcx, rsi                                ; 0278 _ 48: 89. F1
        mov     byte [rsp+38H], 0                       ; 027B _ C6. 44 24, 38, 00
        mov     qword [rsp+30H], r10                    ; 0280 _ 4C: 89. 54 24, 30
        mov     qword [rsp+20H], r15                    ; 0285 _ 4C: 89. 7C 24, 20
        mov     qword [rsp+50H], r10                    ; 028A _ 4C: 89. 54 24, 50
        mov     qword [rsp+40H], rax                    ; 028F _ 48: 89. 44 24, 40
        call    _ZSt16__merge_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExS4_NS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_SC_T2_; 0294 _ E8, FFFFFD67
        mov     rsi, qword [rsp+50H]                    ; 0299 _ 48: 8B. 74 24, 50
        mov     r8, rdi                                 ; 029E _ 49: 89. F8
        mov     rdx, r14                                ; 02A1 _ 4C: 89. F2
        mov     rdi, qword [rsp+40H]                    ; 02A4 _ 48: 8B. 7C 24, 40
        mov     qword [rsp+28H], rbx                    ; 02A9 _ 48: 89. 5C 24, 28
        mov     rbx, r12                                ; 02AE _ 4C: 89. E3
        mov     r9, qword [rsp+48H]                     ; 02B1 _ 4C: 8B. 4C 24, 48
        sub     rbx, r15                                ; 02B6 _ 4C: 29. FB
        mov     byte [rsp+38H], 0                       ; 02B9 _ C6. 44 24, 38, 00
        mov     qword [rsp+20H], rbx                    ; 02BE _ 48: 89. 5C 24, 20
        mov     qword [rsp+30H], rsi                    ; 02C3 _ 48: 89. 74 24, 30
        mov     rcx, rdi                                ; 02C8 _ 48: 89. F9
        call    _ZSt16__merge_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExS4_NS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_SC_T2_; 02CB _ E8, FFFFFD30
        jmp     ?_0767                                  ; 02D0 _ E9, FFFFFDC0

?_0784: mov     r9, qword [rsp+48H]                     ; 02D5 _ 4C: 8B. 4C 24, 48
        cmp     r10, r9                                 ; 02DA _ 4D: 39. CA
        jl      ?_0787                                  ; 02DD _ 0F 8C, 0000008D
        test    r9, r9                                  ; 02E3 _ 4D: 85. C9
        mov     rax, r14                                ; 02E6 _ 4C: 89. F0
        je      ?_0783                                  ; 02E9 _ 0F 84, FFFFFF79
        mov     r8, rbx                                 ; 02EF _ 49: 89. D8
        mov     rdx, rbp                                ; 02F2 _ 48: 89. EA
        mov     rcx, r13                                ; 02F5 _ 4C: 89. E9
        mov     qword [rsp+58H], r10                    ; 02F8 _ 4C: 89. 54 24, 58
        call    _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_; 02FD _ E8, 00000000(rel)
        mov     r8, r13                                 ; 0302 _ 4D: 89. E8
        mov     rdx, r14                                ; 0305 _ 4C: 89. F2
        mov     rcx, rbp                                ; 0308 _ 48: 89. E9
        mov     qword [rsp+50H], rax                    ; 030B _ 48: 89. 44 24, 50
        call    _ZNSt11__copy_moveILb1ELb0ESt26random_access_iterator_tagE8__copy_mIPN6Search8RootMoveES5_EET0_T_S7_S6_; 0310 _ E8, 00000000(rel)
        mov     rdx, qword [rsp+50H]                    ; 0315 _ 48: 8B. 54 24, 50
        mov     r8, r14                                 ; 031A _ 4D: 89. F0
        mov     rcx, rbx                                ; 031D _ 48: 89. D9
        call    _ZNSt20__copy_move_backwardILb1ELb0ESt26random_access_iterator_tagE13__copy_move_bIPN6Search8RootMoveES5_EET0_T_S7_S6_; 0320 _ E8, 00000000(rel)
        mov     r10, qword [rsp+58H]                    ; 0325 _ 4C: 8B. 54 24, 58
        jmp     ?_0783                                  ; 032A _ E9, FFFFFF39

?_0785: mov     rax, r12                                ; 032F _ 4C: 89. E0
        cqo                                             ; 0332 _ 48: 99
        idiv    r11                                     ; 0334 _ 49: F7. FB
        mov     r14, rax                                ; 0337 _ 49: 89. C6
        mov     r15, rax                                ; 033A _ 49: 89. C7
        mov     rax, rbp                                ; 033D _ 48: 89. E8
        shl     r14, 5                                  ; 0340 _ 49: C1. E6, 05
        sub     rax, rsi                                ; 0344 _ 48: 29. F0
        add     r14, rbp                                ; 0347 _ 49: 01. EE
        sar     rax, 5                                  ; 034A _ 48: C1. F8, 05
?_0786: test    rax, rax                                ; 034E _ 48: 85. C0
        jle     ?_0789                                  ; 0351 _ 7E, 53
        mov     rcx, rax                                ; 0353 _ 48: 89. C1
        sar     rcx, 1                                  ; 0356 _ 48: D1. F9
        mov     rdx, rcx                                ; 0359 _ 48: 89. CA
        shl     rdx, 5                                  ; 035C _ 48: C1. E2, 05
        add     rdx, r13                                ; 0360 _ 4C: 01. EA
        mov     r11d, dword [rdx]                       ; 0363 _ 44: 8B. 1A
        cmp     dword [r14], r11d                       ; 0366 _ 45: 39. 1E
        jle     ?_0788                                  ; 0369 _ 7E, 2E
        mov     rax, rcx                                ; 036B _ 48: 89. C8
        jmp     ?_0786                                  ; 036E _ EB, DE

?_0787: xor     r9d, r9d                                ; 0370 _ 45: 31. C9
        mov     r8, r14                                 ; 0373 _ 4D: 89. F0
        mov     rdx, rbp                                ; 0376 _ 48: 89. EA
        mov     qword [rsp+50H], r10                    ; 0379 _ 4C: 89. 54 24, 50
        mov     rcx, r13                                ; 037E _ 4C: 89. E9
        call    _ZSt8__rotateIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEEEvT_S9_S9_St26random_access_iterator_tag; 0381 _ E8, 00000000(rel)
        mov     rax, r14                                ; 0386 _ 4C: 89. F0
        mov     r10, qword [rsp+50H]                    ; 0389 _ 4C: 8B. 54 24, 50
        sub     rax, rbp                                ; 038E _ 48: 29. E8
        add     rax, r13                                ; 0391 _ 4C: 01. E8
        jmp     ?_0783                                  ; 0394 _ E9, FFFFFECF

?_0788: lea     r13, [rdx+20H]                          ; 0399 _ 4C: 8D. 6A, 20
        sub     rax, rcx                                ; 039D _ 48: 29. C8
        sub     rax, 1                                  ; 03A0 _ 48: 83. E8, 01
        jmp     ?_0786                                  ; 03A4 _ EB, A8
; _ZSt16__merge_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExS4_NS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_SC_T2_ End of function

?_0789: ; Local function
        mov     r8, r13                                 ; 03A6 _ 4D: 89. E8
        sub     r8, rsi                                 ; 03A9 _ 49: 29. F0
        sar     r8, 5                                   ; 03AC _ 49: C1. F8, 05
        mov     qword [rsp+40H], r8                     ; 03B0 _ 4C: 89. 44 24, 40
        jmp     ?_0782                                  ; 03B5 _ E9, FFFFFE4F

        nop                                             ; 03BA _ 90
        nop                                             ; 03BB _ 90
        nop                                             ; 03BC _ 90
        nop                                             ; 03BD _ 90
        nop                                             ; 03BE _ 90
        nop                                             ; 03BF _ 90


SECTION .xdata$_ZSt16__merge_adaptiveIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExS4_NS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_SC_T2_ align=4 noexecute ; section number 63, const
;  Communal section not supported by YASM

        db 01H, 10H, 09H, 00H, 10H, 0C2H, 0CH, 30H      ; 0000 _ .......0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .text$_ZNSt6vectorI4MoveSaIS0_EE9push_backERKS0_ align=16 execute ; section number 65, code
;  Communal section not supported by YASM

_ZNSt6vectorI4MoveSaIS0_EE9push_backERKS0_:; Function begin
        push    rbp                                     ; 0000 _ 55
        push    rdi                                     ; 0001 _ 57
        push    rsi                                     ; 0002 _ 56
        push    rbx                                     ; 0003 _ 53
        sub     rsp, 40                                 ; 0004 _ 48: 83. EC, 28
        mov     rax, qword [rcx+8H]                     ; 0008 _ 48: 8B. 41, 08
        cmp     rax, qword [rcx+10H]                    ; 000C _ 48: 3B. 41, 10
        jz      ?_0792                                  ; 0010 _ 74, 1C
        test    rax, rax                                ; 0012 _ 48: 85. C0
        mov     r8d, dword [rdx]                        ; 0015 _ 44: 8B. 02
        jz      ?_0790                                  ; 0018 _ 74, 03
        mov     dword [rax], r8d                        ; 001A _ 44: 89. 00
?_0790: add     rax, 4                                  ; 001D _ 48: 83. C0, 04
        mov     qword [rcx+8H], rax                     ; 0021 _ 48: 89. 41, 08
?_0791: add     rsp, 40                                 ; 0025 _ 48: 83. C4, 28
        pop     rbx                                     ; 0029 _ 5B
        pop     rsi                                     ; 002A _ 5E
        pop     rdi                                     ; 002B _ 5F
        pop     rbp                                     ; 002C _ 5D
        ret                                             ; 002D _ C3
; _ZNSt6vectorI4MoveSaIS0_EE9push_backERKS0_ End of function

?_0792: ; Local function
        mov     rsi, rdx                                ; 002E _ 48: 89. D6
        mov     edx, 1                                  ; 0031 _ BA, 00000001
        mov     rbx, rcx                                ; 0036 _ 48: 89. CB
        lea     r8, [rel ?_0345]                        ; 0039 _ 4C: 8D. 05, 000000BB(rel)
        xor     ebp, ebp                                ; 0040 _ 31. ED
        call    _ZNKSt6vectorI4MoveSaIS0_EE12_M_check_lenEyPKc; 0042 _ E8, 00000000(rel)
        test    rax, rax                                ; 0047 _ 48: 85. C0
        mov     rdi, rax                                ; 004A _ 48: 89. C7
        jz      ?_0793                                  ; 004D _ 74, 0B
        mov     rcx, rax                                ; 004F _ 48: 89. C1
        call    _ZN9__gnu_cxx13new_allocatorI4MoveE8allocateEyPKv.isra.146; 0052 _ E8, 00001D30(rel)
        mov     rbp, rax                                ; 0057 _ 48: 89. C5
?_0793: mov     r9, qword [rbx+8H]                      ; 005A _ 4C: 8B. 4B, 08
        mov     rcx, qword [rbx]                        ; 005E _ 48: 8B. 0B
        mov     edx, dword [rsi]                        ; 0061 _ 8B. 16
        mov     r8, r9                                  ; 0063 _ 4D: 89. C8
        sub     r8, rcx                                 ; 0066 _ 49: 29. C8
        add     r8, rbp                                 ; 0069 _ 49: 01. E8
        jz      ?_0794                                  ; 006C _ 74, 03
        mov     dword [r8], edx                         ; 006E _ 41: 89. 10
?_0794: mov     r11, rcx                                ; 0071 _ 49: 89. CB
        mov     rax, rbp                                ; 0074 _ 48: 89. E8
        jmp     ?_0797                                  ; 0077 _ EB, 13

?_0795: test    rax, rax                                ; 0079 _ 48: 85. C0
        mov     r10d, dword [r11]                       ; 007C _ 45: 8B. 13
        jz      ?_0796                                  ; 007F _ 74, 03
        mov     dword [rax], r10d                       ; 0081 _ 44: 89. 10
?_0796: add     rax, 4                                  ; 0084 _ 48: 83. C0, 04
        add     r11, 4                                  ; 0088 _ 49: 83. C3, 04
?_0797: cmp     r9, r11                                 ; 008C _ 4D: 39. D9
        jnz     ?_0795                                  ; 008F _ 75, E8
        sub     r9, rcx                                 ; 0091 _ 49: 29. C9
        and     r9, 0FFFFFFFFFFFFFFFCH                  ; 0094 _ 49: 83. E1, FC
        test    rcx, rcx                                ; 0098 _ 48: 85. C9
        lea     rsi, [rbp+r9+4H]                        ; 009B _ 4A: 8D. 74 0D, 04
        jz      ?_0798                                  ; 00A0 _ 74, 05
        call    _ZdlPv                                  ; 00A2 _ E8, 00000000(rel)
?_0798: lea     rcx, [rbp+rdi*4]                        ; 00A7 _ 48: 8D. 4C BD, 00
        mov     qword [rbx], rbp                        ; 00AC _ 48: 89. 2B
        mov     qword [rbx+8H], rsi                     ; 00AF _ 48: 89. 73, 08
        mov     qword [rbx+10H], rcx                    ; 00B3 _ 48: 89. 4B, 10
        jmp     ?_0791                                  ; 00B7 _ E9, FFFFFF69

        nop                                             ; 00BC _ 90
        nop                                             ; 00BD _ 90
        nop                                             ; 00BE _ 90
        nop                                             ; 00BF _ 90


SECTION .xdata$_ZNSt6vectorI4MoveSaIS0_EE9push_backERKS0_ align=4 noexecute ; section number 66, const
;  Communal section not supported by YASM

        db 01H, 08H, 05H, 00H, 08H, 42H, 04H, 30H       ; 0000 _ .....B.0
        db 03H, 60H, 02H, 70H, 01H, 50H, 00H, 00H       ; 0008 _ .`.p.P..


SECTION .text$_ZNKSt6vectorI4MoveSaIS0_EE12_M_check_lenEyPKc align=16 execute ; section number 68, code
;  Communal section not supported by YASM

_ZNKSt6vectorI4MoveSaIS0_EE12_M_check_lenEyPKc:; Function begin
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     r10, qword 3FFFFFFFFFFFFFFFH            ; 0004 _ 49: BA, 3FFFFFFFFFFFFFFF
        mov     rax, r10                                ; 000E _ 4C: 89. D0
        mov     r9, qword [rcx+8H]                      ; 0011 _ 4C: 8B. 49, 08
        sub     r9, qword [rcx]                         ; 0015 _ 4C: 2B. 09
        mov     rcx, r9                                 ; 0018 _ 4C: 89. C9
        sar     rcx, 2                                  ; 001B _ 48: C1. F9, 02
        sub     rax, rcx                                ; 001F _ 48: 29. C8
        cmp     rax, rdx                                ; 0022 _ 48: 39. D0
        jc      ?_0800                                  ; 0025 _ 72, 19
        cmp     rcx, rdx                                ; 0027 _ 48: 39. D1
        mov     rax, rdx                                ; 002A _ 48: 89. D0
        cmovnc  rax, rcx                                ; 002D _ 48: 0F 43. C1
        add     rax, rcx                                ; 0031 _ 48: 01. C8
        jc      ?_0801                                  ; 0034 _ 72, 12
        cmp     rax, r10                                ; 0036 _ 4C: 39. D0
        ja      ?_0801                                  ; 0039 _ 77, 0D
?_0799: add     rsp, 40                                 ; 003B _ 48: 83. C4, 28
        ret                                             ; 003F _ C3

?_0800: mov     rcx, r8                                 ; 0040 _ 4C: 89. C1
        call    _ZSt20__throw_length_errorPKc           ; 0043 _ E8, 00000000(rel)
?_0801: mov     rax, qword 3FFFFFFFFFFFFFFFH            ; 0048 _ 48: B8, 3FFFFFFFFFFFFFFF
        jmp     ?_0799                                  ; 0052 _ EB, E7
; _ZNKSt6vectorI4MoveSaIS0_EE12_M_check_lenEyPKc End of function

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


SECTION .xdata$_ZNKSt6vectorI4MoveSaIS0_EE12_M_check_lenEyPKc align=4 noexecute ; section number 69, const
;  Communal section not supported by YASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .text$_ZN10MainThreadD0Ev align=16 execute      ; section number 71, code
;  Communal section not supported by YASM

_ZN10MainThreadD0Ev:; Function begin
        push    rbx                                     ; 0000 _ 53
        sub     rsp, 32                                 ; 0001 _ 48: 83. EC, 20
        lea     rax, [rel _ZTV10MainThread+10H]         ; 0005 _ 48: 8D. 05, 00000010(rel)
        mov     rbx, rcx                                ; 000C _ 48: 89. CB
        mov     qword [rcx], rax                        ; 000F _ 48: 89. 01
        call    _ZN6ThreadD2Ev                          ; 0012 _ E8, 00000000(rel)
        mov     rcx, rbx                                ; 0017 _ 48: 89. D9
        add     rsp, 32                                 ; 001A _ 48: 83. C4, 20
        pop     rbx                                     ; 001E _ 5B
        jmp     _ZdlPv                                  ; 001F _ E9, 00000000(rel)
; _ZN10MainThreadD0Ev End of function

        nop                                             ; 0024 _ 90
        nop                                             ; 0025 _ 90
        nop                                             ; 0026 _ 90
        nop                                             ; 0027 _ 90
        nop                                             ; 0028 _ 90
        nop                                             ; 0029 _ 90
        nop                                             ; 002A _ 90
        nop                                             ; 002B _ 90
        nop                                             ; 002C _ 90
        nop                                             ; 002D _ 90
        nop                                             ; 002E _ 90
        nop                                             ; 002F _ 90


SECTION .xdata$_ZN10MainThreadD0Ev align=4 noexecute    ; section number 72, const
;  Communal section not supported by YASM

        db 01H, 05H, 02H, 00H, 05H, 32H, 01H, 30H       ; 0000 _ .....2.0


SECTION .text$_ZSt22__merge_without_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExNS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_ align=16 execute ; section number 74, code
;  Communal section not supported by YASM

_ZSt22__merge_without_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExNS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 72                                 ; 000C _ 48: 83. EC, 48
        mov     rbp, qword [rsp+0B0H]                   ; 0010 _ 48: 8B. AC 24, 000000B0
        test    r9, r9                                  ; 0018 _ 4D: 85. C9
        mov     r10, rdx                                ; 001B _ 49: 89. D2
        mov     rsi, rcx                                ; 001E _ 48: 89. CE
        je      ?_0811                                  ; 0021 _ 0F 84, 0000015D
        test    rbp, rbp                                ; 0027 _ 48: 85. ED
        je      ?_0811                                  ; 002A _ 0F 84, 00000154
        lea     rax, [r9+rbp]                           ; 0030 _ 49: 8D. 04 29
        cmp     rax, 2                                  ; 0034 _ 48: 83. F8, 02
        jnz     ?_0802                                  ; 0038 _ 75, 21
        mov     r9d, dword [rcx]                        ; 003A _ 44: 8B. 09
        cmp     dword [rdx], r9d                        ; 003D _ 44: 39. 0A
        jle     ?_0811                                  ; 0040 _ 0F 8E, 0000013E
        add     rsp, 72                                 ; 0046 _ 48: 83. C4, 48
        pop     rbx                                     ; 004A _ 5B
        pop     rsi                                     ; 004B _ 5E
        pop     rdi                                     ; 004C _ 5F
        pop     rbp                                     ; 004D _ 5D
        pop     r12                                     ; 004E _ 41: 5C
        pop     r13                                     ; 0050 _ 41: 5D
        pop     r14                                     ; 0052 _ 41: 5E
        pop     r15                                     ; 0054 _ 41: 5F
        jmp     _ZSt4swapIN6Search8RootMoveEEvRT_S3_    ; 0056 _ E9, 00000000(rel)

?_0802: cmp     r9, rbp                                 ; 005B _ 49: 39. E9
        mov     ebx, 2                                  ; 005E _ BB, 00000002
        jle     ?_0806                                  ; 0063 _ 7E, 5B
        mov     rax, r9                                 ; 0065 _ 4C: 89. C8
        cqo                                             ; 0068 _ 48: 99
        idiv    rbx                                     ; 006A _ 48: F7. FB
        mov     rdx, r8                                 ; 006D _ 4C: 89. C2
        mov     rsi, rax                                ; 0070 _ 48: 89. C6
        mov     r13, rax                                ; 0073 _ 49: 89. C5
        shl     rsi, 5                                  ; 0076 _ 48: C1. E6, 05
        sub     rdx, r10                                ; 007A _ 4C: 29. D2
        mov     rbx, r10                                ; 007D _ 4C: 89. D3
        add     rsi, rcx                                ; 0080 _ 48: 01. CE
        sar     rdx, 5                                  ; 0083 _ 48: C1. FA, 05
?_0803: test    rdx, rdx                                ; 0087 _ 48: 85. D2
        jle     ?_0805                                  ; 008A _ 7E, 28
        mov     r15, rdx                                ; 008C _ 49: 89. D7
        mov     eax, dword [rsi]                        ; 008F _ 8B. 06
        sar     r15, 1                                  ; 0091 _ 49: D1. FF
        mov     r11, r15                                ; 0094 _ 4D: 89. FB
        shl     r11, 5                                  ; 0097 _ 49: C1. E3, 05
        add     r11, rbx                                ; 009B _ 49: 01. DB
        cmp     dword [r11], eax                        ; 009E _ 41: 39. 03
        jle     ?_0804                                  ; 00A1 _ 7E, 0C
        lea     rbx, [r11+20H]                          ; 00A3 _ 49: 8D. 5B, 20
        sub     rdx, r15                                ; 00A7 _ 4C: 29. FA
        dec     rdx                                     ; 00AA _ 48: FF. CA
        jmp     ?_0803                                  ; 00AD _ EB, D8

?_0804: mov     rdx, r15                                ; 00AF _ 4C: 89. FA
        jmp     ?_0803                                  ; 00B2 _ EB, D3

?_0805: mov     r15, rbx                                ; 00B4 _ 49: 89. DF
        sub     r15, r10                                ; 00B7 _ 4D: 29. D7
        sar     r15, 5                                  ; 00BA _ 49: C1. FF, 05
        jmp     ?_0810                                  ; 00BE _ EB, 57

?_0806: mov     rax, rbp                                ; 00C0 _ 48: 89. E8
        mov     r12, r10                                ; 00C3 _ 4D: 89. D4
        cqo                                             ; 00C6 _ 48: 99
        sub     r12, rcx                                ; 00C8 _ 49: 29. CC
        idiv    rbx                                     ; 00CB _ 48: F7. FB
        mov     rbx, rax                                ; 00CE _ 48: 89. C3
        mov     r15, rax                                ; 00D1 _ 49: 89. C7
        sar     r12, 5                                  ; 00D4 _ 49: C1. FC, 05
        shl     rbx, 5                                  ; 00D8 _ 48: C1. E3, 05
        add     rbx, r10                                ; 00DC _ 4C: 01. D3
?_0807: test    r12, r12                                ; 00DF _ 4D: 85. E4
        jle     ?_0809                                  ; 00E2 _ 7E, 29
        mov     rdi, r12                                ; 00E4 _ 4C: 89. E7
        sar     rdi, 1                                  ; 00E7 _ 48: D1. FF
        mov     r11, rdi                                ; 00EA _ 49: 89. FB
        shl     r11, 5                                  ; 00ED _ 49: C1. E3, 05
        add     r11, rsi                                ; 00F1 _ 49: 01. F3
        mov     r14d, dword [r11]                       ; 00F4 _ 45: 8B. 33
        cmp     dword [rbx], r14d                       ; 00F7 _ 44: 39. 33
        jg      ?_0808                                  ; 00FA _ 7F, 0C
        lea     rsi, [r11+20H]                          ; 00FC _ 49: 8D. 73, 20
        sub     r12, rdi                                ; 0100 _ 49: 29. FC
        dec     r12                                     ; 0103 _ 49: FF. CC
        jmp     ?_0807                                  ; 0106 _ EB, D7

?_0808: mov     r12, rdi                                ; 0108 _ 49: 89. FC
        jmp     ?_0807                                  ; 010B _ EB, D2

?_0809: mov     r13, rsi                                ; 010D _ 49: 89. F5
        sub     r13, rcx                                ; 0110 _ 49: 29. CD
        sar     r13, 5                                  ; 0113 _ 49: C1. FD, 05
?_0810: mov     rdx, r10                                ; 0117 _ 4C: 89. D2
        mov     r12, r9                                 ; 011A _ 4D: 89. CC
        mov     r14, r8                                 ; 011D _ 4D: 89. C6
        mov     qword [rsp+38H], rcx                    ; 0120 _ 48: 89. 4C 24, 38
        xor     r9d, r9d                                ; 0125 _ 45: 31. C9
        mov     r8, rbx                                 ; 0128 _ 49: 89. D8
        mov     rcx, rsi                                ; 012B _ 48: 89. F1
        mov     rdi, r10                                ; 012E _ 4C: 89. D7
        call    _ZSt8__rotateIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEEEvT_S9_S9_St26random_access_iterator_tag; 0131 _ E8, 00000000(rel)
        mov     rcx, rbx                                ; 0136 _ 48: 89. D9
        mov     r9, r13                                 ; 0139 _ 4D: 89. E9
        mov     rdx, rsi                                ; 013C _ 48: 89. F2
        sub     rcx, rdi                                ; 013F _ 48: 29. F9
        mov     byte [rsp+28H], 0                       ; 0142 _ C6. 44 24, 28, 00
        mov     rdi, rcx                                ; 0147 _ 48: 89. CF
        mov     rcx, qword [rsp+38H]                    ; 014A _ 48: 8B. 4C 24, 38
        mov     qword [rsp+20H], r15                    ; 014F _ 4C: 89. 7C 24, 20
        add     rdi, rsi                                ; 0154 _ 48: 01. F7
        mov     r8, rdi                                 ; 0157 _ 49: 89. F8
        call    _ZSt22__merge_without_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExNS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_; 015A _ E8, FFFFFEA1
        mov     r8, rbp                                 ; 015F _ 49: 89. E8
        mov     r9, r12                                 ; 0162 _ 4D: 89. E1
        mov     byte [rsp+28H], 0                       ; 0165 _ C6. 44 24, 28, 00
        sub     r8, r15                                 ; 016A _ 4D: 29. F8
        sub     r9, r13                                 ; 016D _ 4D: 29. E9
        mov     rdx, rbx                                ; 0170 _ 48: 89. DA
        mov     qword [rsp+20H], r8                     ; 0173 _ 4C: 89. 44 24, 20
        mov     rcx, rdi                                ; 0178 _ 48: 89. F9
        mov     r8, r14                                 ; 017B _ 4D: 89. F0
        call    _ZSt22__merge_without_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExNS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_; 017E _ E8, FFFFFE7D
        nop                                             ; 0183 _ 90
?_0811: add     rsp, 72                                 ; 0184 _ 48: 83. C4, 48
        pop     rbx                                     ; 0188 _ 5B
        pop     rsi                                     ; 0189 _ 5E
        pop     rdi                                     ; 018A _ 5F
        pop     rbp                                     ; 018B _ 5D
        pop     r12                                     ; 018C _ 41: 5C
        pop     r13                                     ; 018E _ 41: 5D
        pop     r14                                     ; 0190 _ 41: 5E
        pop     r15                                     ; 0192 _ 41: 5F
        ret                                             ; 0194 _ C3
; _ZSt22__merge_without_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExNS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_ End of function

        nop                                             ; 0195 _ 90
        nop                                             ; 0196 _ 90
        nop                                             ; 0197 _ 90
        nop                                             ; 0198 _ 90
        nop                                             ; 0199 _ 90
        nop                                             ; 019A _ 90
        nop                                             ; 019B _ 90
        nop                                             ; 019C _ 90
        nop                                             ; 019D _ 90
        nop                                             ; 019E _ 90
        nop                                             ; 019F _ 90


SECTION .xdata$_ZSt22__merge_without_bufferIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEExNS0_5__ops15_Iter_less_iterEEvT_SB_SB_T0_SC_T1_ align=4 noexecute ; section number 75, const
;  Communal section not supported by YASM

        db 01H, 10H, 09H, 00H, 10H, 82H, 0CH, 30H       ; 0000 _ .......0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .text$_ZN10MainThreadD1Ev align=16 execute      ; section number 77, code
;  Communal section not supported by YASM

_ZN10MainThreadD1Ev:; Function begin
        lea     rax, [rel _ZTV10MainThread+10H]         ; 0000 _ 48: 8D. 05, 00000010(rel)
        mov     qword [rcx], rax                        ; 0007 _ 48: 89. 01
        jmp     _ZN6ThreadD2Ev                          ; 000A _ E9, 00000000(rel)
; _ZN10MainThreadD1Ev End of function

        nop                                             ; 000F _ 90


SECTION .xdata$_ZN10MainThreadD1Ev align=4 noexecute    ; section number 78, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZNKSt6vectorIP6ThreadSaIS1_EE14_M_range_checkEy align=16 execute ; section number 80, code
;  Communal section not supported by YASM

_ZNKSt6vectorIP6ThreadSaIS1_EE14_M_range_checkEy:; Function begin
        sub     rsp, 40                                 ; 0000 _ 48: 83. EC, 28
        mov     r8, qword [rcx+8H]                      ; 0004 _ 4C: 8B. 41, 08
        sub     r8, qword [rcx]                         ; 0008 _ 4C: 2B. 01
        sar     r8, 3                                   ; 000B _ 49: C1. F8, 03
        cmp     rdx, r8                                 ; 000F _ 4C: 39. C2
        jc      ?_0812                                  ; 0012 _ 72, 0D
        lea     rcx, [rel ?_0346]                       ; 0014 _ 48: 8D. 0D, 000000D8(rel)
        call    _ZSt24__throw_out_of_range_fmtPKcz      ; 001B _ E8, 00000000(rel)
        nop                                             ; 0020 _ 90
?_0812: add     rsp, 40                                 ; 0021 _ 48: 83. C4, 28
        ret                                             ; 0025 _ C3
; _ZNKSt6vectorIP6ThreadSaIS1_EE14_M_range_checkEy End of function

        nop                                             ; 0026 _ 90
        nop                                             ; 0027 _ 90
        nop                                             ; 0028 _ 90
        nop                                             ; 0029 _ 90
        nop                                             ; 002A _ 90
        nop                                             ; 002B _ 90
        nop                                             ; 002C _ 90
        nop                                             ; 002D _ 90
        nop                                             ; 002E _ 90
        nop                                             ; 002F _ 90


SECTION .xdata$_ZNKSt6vectorIP6ThreadSaIS1_EE14_M_range_checkEy align=4 noexecute ; section number 81, const
;  Communal section not supported by YASM

        db 01H, 04H, 01H, 00H, 04H, 42H, 00H, 00H       ; 0000 _ .....B..


SECTION .text$_ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_ align=16 execute ; section number 83, code
;  Communal section not supported by YASM

_ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_:; Function begin
        push    rdi                                     ; 0000 _ 57
        push    rsi                                     ; 0001 _ 56
        push    rbx                                     ; 0002 _ 53
        sub     rsp, 32                                 ; 0003 _ 48: 83. EC, 20
        xor     eax, eax                                ; 0007 _ 31. C0
        mov     rsi, qword [rdx+8H]                     ; 0009 _ 48: 8B. 72, 08
        sub     rsi, qword [rdx]                        ; 000D _ 48: 2B. 32
        mov     rbx, rcx                                ; 0010 _ 48: 89. CB
        mov     qword [rcx], 0                          ; 0013 _ 48: C7. 01, 00000000
        mov     rdi, rdx                                ; 001A _ 48: 89. D7
        mov     qword [rcx+8H], 0                       ; 001D _ 48: C7. 41, 08, 00000000
        mov     qword [rcx+10H], 0                      ; 0025 _ 48: C7. 41, 10, 00000000
        mov     rcx, rsi                                ; 002D _ 48: 89. F1
        sar     rcx, 2                                  ; 0030 _ 48: C1. F9, 02
        jz      ?_0813                                  ; 0034 _ 74, 05
        call    _ZN9__gnu_cxx13new_allocatorI4MoveE8allocateEyPKv.isra.146; 0036 _ E8, 00001D30(rel)
?_0813: add     rsi, rax                                ; 003B _ 48: 01. C6
        mov     qword [rbx], rax                        ; 003E _ 48: 89. 03
        mov     rdx, rax                                ; 0041 _ 48: 89. C2
        mov     qword [rbx+8H], rax                     ; 0044 _ 48: 89. 43, 08
        mov     qword [rbx+10H], rsi                    ; 0048 _ 48: 89. 73, 10
        mov     r9, qword [rdi]                         ; 004C _ 4C: 8B. 0F
        mov     r8, qword [rdi+8H]                      ; 004F _ 4C: 8B. 47, 08
        mov     rcx, r9                                 ; 0053 _ 4C: 89. C9
?_0814: cmp     r8, rcx                                 ; 0056 _ 49: 39. C8
        jz      ?_0816                                  ; 0059 _ 74, 15
        test    rdx, rdx                                ; 005B _ 48: 85. D2
        mov     r10d, dword [rcx]                       ; 005E _ 44: 8B. 11
        jz      ?_0815                                  ; 0061 _ 74, 03
        mov     dword [rdx], r10d                       ; 0063 _ 44: 89. 12
?_0815: add     rdx, 4                                  ; 0066 _ 48: 83. C2, 04
        add     rcx, 4                                  ; 006A _ 48: 83. C1, 04
        jmp     ?_0814                                  ; 006E _ EB, E6
; _ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_ End of function

?_0816: ; Local function
        sub     r8, r9                                  ; 0070 _ 4D: 29. C8
        and     r8, 0FFFFFFFFFFFFFFFCH                  ; 0073 _ 49: 83. E0, FC
        add     rax, r8                                 ; 0077 _ 4C: 01. C0
        mov     qword [rbx+8H], rax                     ; 007A _ 48: 89. 43, 08
        add     rsp, 32                                 ; 007E _ 48: 83. C4, 20
        pop     rbx                                     ; 0082 _ 5B
        pop     rsi                                     ; 0083 _ 5E
        pop     rdi                                     ; 0084 _ 5F
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


SECTION .xdata$_ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_ align=4 noexecute ; section number 84, const
;  Communal section not supported by YASM

        db 01H, 07H, 04H, 00H, 07H, 32H, 03H, 30H       ; 0000 _ .....2.0
        db 02H, 60H, 01H, 70H                           ; 0008 _ .`.p


SECTION .text$_ZN6Search5perftILb0EEEyR8Position5Depth align=16 execute ; section number 86, code
;  Communal section not supported by YASM

_ZN6Search5perftILb0EEEyR8Position5Depth:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        mov     eax, 4360                               ; 0002 _ B8, 00001108
        push    r14                                     ; 0007 _ 41: 56
        push    r13                                     ; 0009 _ 41: 55
        push    r12                                     ; 000B _ 41: 54
        push    rbp                                     ; 000D _ 55
        push    rdi                                     ; 000E _ 57
        push    rsi                                     ; 000F _ 56
        push    rbx                                     ; 0010 _ 53
        call    ___chkstk_ms                            ; 0011 _ E8, 00000000(rel)
        sub     rsp, rax                                ; 0016 _ 48: 29. C4
        xor     edi, edi                                ; 0019 _ 31. FF
        lea     r14, [rsp+80H]                          ; 001B _ 4C: 8D. B4 24, 00000080
        mov     rsi, rcx                                ; 0023 _ 48: 89. CE
        mov     r12d, edx                               ; 0026 _ 41: 89. D4
        lea     rbx, [rsp+0E0H]                         ; 0029 _ 48: 8D. 9C 24, 000000E0
        mov     rdx, rcx                                ; 0031 _ 48: 89. CA
        mov     rcx, r14                                ; 0034 _ 4C: 89. F1
        call    _ZN9CheckInfoC1ERK8Position             ; 0037 _ E8, 00000000(rel)
        mov     rdx, rbx                                ; 003C _ 48: 89. DA
        mov     rcx, rsi                                ; 003F _ 48: 89. F1
        call    _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_; 0042 _ E8, 00000000(rel)
        lea     edx, [r12-1H]                           ; 0047 _ 41: 8D. 54 24, FF
        mov     qword [rsp+8E0H], rax                   ; 004C _ 48: 89. 84 24, 000008E0
        lea     r15, [rsp+30H]                          ; 0054 _ 4C: 8D. 7C 24, 30
        mov     r13, rax                                ; 0059 _ 49: 89. C5
        mov     dword [rsp+2CH], edx                    ; 005C _ 89. 54 24, 2C
        lea     rbp, [rsp+8F0H]                         ; 0060 _ 48: 8D. AC 24, 000008F0
?_0817: cmp     rbx, r13                                ; 0068 _ 4C: 39. EB
        jz      ?_0820                                  ; 006B _ 74, 57
        mov     edx, dword [rbx]                        ; 006D _ 8B. 13
        mov     r8, r14                                 ; 006F _ 4D: 89. F0
        mov     rcx, rsi                                ; 0072 _ 48: 89. F1
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 0075 _ E8, 00000000(rel)
        mov     edx, dword [rbx]                        ; 007A _ 8B. 13
        mov     r8, r15                                 ; 007C _ 4D: 89. F8
        mov     rcx, rsi                                ; 007F _ 48: 89. F1
        movzx   r9d, al                                 ; 0082 _ 44: 0F B6. C8
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 0086 _ E8, 00000000(rel)
        cmp     r12d, 2                                 ; 008B _ 41: 83. FC, 02
        jnz     ?_0818                                  ; 008F _ 75, 14
        mov     rdx, rbp                                ; 0091 _ 48: 89. EA
        mov     rcx, rsi                                ; 0094 _ 48: 89. F1
        call    _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_; 0097 _ E8, 00000000(rel)
        sub     rax, rbp                                ; 009C _ 48: 29. E8
        sar     rax, 3                                  ; 009F _ 48: C1. F8, 03
        jmp     ?_0819                                  ; 00A3 _ EB, 0C

?_0818: mov     edx, dword [rsp+2CH]                    ; 00A5 _ 8B. 54 24, 2C
        mov     rcx, rsi                                ; 00A9 _ 48: 89. F1
        call    _ZN6Search5perftILb0EEEyR8Position5Depth; 00AC _ E8, FFFFFF4F
?_0819: mov     edx, dword [rbx]                        ; 00B1 _ 8B. 13
        mov     rcx, rsi                                ; 00B3 _ 48: 89. F1
        add     rdi, rax                                ; 00B6 _ 48: 01. C7
        add     rbx, 8                                  ; 00B9 _ 48: 83. C3, 08
        call    _ZN8Position9undo_moveE4Move            ; 00BD _ E8, 00000000(rel)
        jmp     ?_0817                                  ; 00C2 _ EB, A4
; _ZN6Search5perftILb0EEEyR8Position5Depth End of function

?_0820: ; Local function
        mov     rax, rdi                                ; 00C4 _ 48: 89. F8
        add     rsp, 4360                               ; 00C7 _ 48: 81. C4, 00001108
        pop     rbx                                     ; 00CE _ 5B
        pop     rsi                                     ; 00CF _ 5E
        pop     rdi                                     ; 00D0 _ 5F
        pop     rbp                                     ; 00D1 _ 5D
        pop     r12                                     ; 00D2 _ 41: 5C
        pop     r13                                     ; 00D4 _ 41: 5D
        pop     r14                                     ; 00D6 _ 41: 5E
        pop     r15                                     ; 00D8 _ 41: 5F
        ret                                             ; 00DA _ C3

        nop                                             ; 00DB _ 90
        nop                                             ; 00DC _ 90
        nop                                             ; 00DD _ 90
        nop                                             ; 00DE _ 90
        nop                                             ; 00DF _ 90


SECTION .xdata$_ZN6Search5perftILb0EEEyR8Position5Depth align=4 noexecute ; section number 87, const
;  Communal section not supported by YASM

        db 01H, 19H, 0AH, 00H, 19H, 01H, 21H, 02H       ; 0000 _ ......!.
        db 11H, 30H, 10H, 60H, 0FH, 70H, 0EH, 50H       ; 0008 _ .0.`.p.P
        db 0DH, 0C0H, 0BH, 0D0H, 09H, 0E0H, 02H, 0F0H   ; 0010 _ ........


SECTION .text$_ZN6Search5perftILb1EEEyR8Position5Depth align=16 execute ; section number 89, code
;  Communal section not supported by YASM

_ZN6Search5perftILb1EEEyR8Position5Depth:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        mov     eax, 4360                               ; 0002 _ B8, 00001108
        push    r14                                     ; 0007 _ 41: 56
        push    r13                                     ; 0009 _ 41: 55
        push    r12                                     ; 000B _ 41: 54
        push    rbp                                     ; 000D _ 55
        push    rdi                                     ; 000E _ 57
        push    rsi                                     ; 000F _ 56
        push    rbx                                     ; 0010 _ 53
        call    ___chkstk_ms                            ; 0011 _ E8, 00000000(rel)
        sub     rsp, rax                                ; 0016 _ 48: 29. C4
        xor     edi, edi                                ; 0019 _ 31. FF
        lea     r14, [rsp+80H]                          ; 001B _ 4C: 8D. B4 24, 00000080
        mov     rsi, rcx                                ; 0023 _ 48: 89. CE
        mov     r12d, edx                               ; 0026 _ 41: 89. D4
        lea     rbx, [rsp+0E0H]                         ; 0029 _ 48: 8D. 9C 24, 000000E0
        mov     rdx, rcx                                ; 0031 _ 48: 89. CA
        mov     rcx, r14                                ; 0034 _ 4C: 89. F1
        call    _ZN9CheckInfoC1ERK8Position             ; 0037 _ E8, 00000000(rel)
        mov     rdx, rbx                                ; 003C _ 48: 89. DA
        mov     rcx, rsi                                ; 003F _ 48: 89. F1
        call    _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_; 0042 _ E8, 00000000(rel)
        lea     rdx, [rsp+30H]                          ; 0047 _ 48: 8D. 54 24, 30
        lea     ecx, [r12-1H]                           ; 004C _ 41: 8D. 4C 24, FF
        mov     r13, rax                                ; 0051 _ 49: 89. C5
        mov     qword [rsp+8E0H], rax                   ; 0054 _ 48: 89. 84 24, 000008E0
        lea     rbp, [rsp+8F0H]                         ; 005C _ 48: 8D. AC 24, 000008F0
        mov     qword [rsp+20H], rdx                    ; 0064 _ 48: 89. 54 24, 20
        mov     dword [rsp+2CH], ecx                    ; 0069 _ 89. 4C 24, 2C
?_0821: cmp     rbx, r13                                ; 006D _ 4C: 39. EB
        je      ?_0826                                  ; 0070 _ 0F 84, 000000AF
        cmp     r12d, 1                                 ; 0076 _ 41: 83. FC, 01
        jg      ?_0822                                  ; 007A _ 7F, 0B
        inc     rdi                                     ; 007C _ 48: FF. C7
        mov     r15d, 1                                 ; 007F _ 41: BF, 00000001
        jmp     ?_0825                                  ; 0085 _ EB, 59

?_0822: mov     edx, dword [rbx]                        ; 0087 _ 8B. 13
        mov     r8, r14                                 ; 0089 _ 4D: 89. F0
        mov     rcx, rsi                                ; 008C _ 48: 89. F1
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 008F _ E8, 00000000(rel)
        mov     r8, qword [rsp+20H]                     ; 0094 _ 4C: 8B. 44 24, 20
        mov     rcx, rsi                                ; 0099 _ 48: 89. F1
        mov     edx, dword [rbx]                        ; 009C _ 8B. 13
        movzx   r9d, al                                 ; 009E _ 44: 0F B6. C8
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 00A2 _ E8, 00000000(rel)
        cmp     r12d, 2                                 ; 00A7 _ 41: 83. FC, 02
        jnz     ?_0823                                  ; 00AB _ 75, 17
        mov     rdx, rbp                                ; 00AD _ 48: 89. EA
        mov     rcx, rsi                                ; 00B0 _ 48: 89. F1
        call    _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_; 00B3 _ E8, 00000000(rel)
        sub     rax, rbp                                ; 00B8 _ 48: 29. E8
        sar     rax, 3                                  ; 00BB _ 48: C1. F8, 03
        mov     r15, rax                                ; 00BF _ 49: 89. C7
        jmp     ?_0824                                  ; 00C2 _ EB, 0F

?_0823: mov     edx, dword [rsp+2CH]                    ; 00C4 _ 8B. 54 24, 2C
        mov     rcx, rsi                                ; 00C8 _ 48: 89. F1
        call    _ZN6Search5perftILb0EEEyR8Position5Depth; 00CB _ E8, 00000000(rel)
        mov     r15, rax                                ; 00D0 _ 49: 89. C7
?_0824: mov     edx, dword [rbx]                        ; 00D3 _ 8B. 13
        mov     rcx, rsi                                ; 00D5 _ 48: 89. F1
        add     rdi, r15                                ; 00D8 _ 4C: 01. FF
        call    _ZN8Position9undo_moveE4Move            ; 00DB _ E8, 00000000(rel)
?_0825: movzx   r8d, byte [rsi+3C0H]                    ; 00E0 _ 44: 0F B6. 86, 000003C0
        mov     rcx, rbp                                ; 00E8 _ 48: 89. E9
        add     rbx, 8                                  ; 00EB _ 48: 83. C3, 08
        mov     edx, dword [rbx-8H]                     ; 00EF _ 8B. 53, F8
        call    _ZN3UCI10print_moveEPc4Moveb            ; 00F2 _ E8, 00000000(rel)
        lea     rdx, [rel ?_0347]                       ; 00F7 _ 48: 8D. 15, 00000122(rel)
        mov     rcx, rax                                ; 00FE _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 0101 _ E8, 00000000(rel)
        mov     rdx, r15                                ; 0106 _ 4C: 89. FA
        mov     rcx, rax                                ; 0109 _ 48: 89. C1
        call    _Z9print_intPcy                         ; 010C _ E8, 00000000(rel)
        mov     rcx, rbp                                ; 0111 _ 48: 89. E9
        mov     byte [rax], 10                          ; 0114 _ C6. 00, 0A
        lea     rdx, [rax+1H]                           ; 0117 _ 48: 8D. 50, 01
        call    _Z9write_outPcS_                        ; 011B _ E8, 00000000(rel)
        jmp     ?_0821                                  ; 0120 _ E9, FFFFFF48
; _ZN6Search5perftILb1EEEyR8Position5Depth End of function

?_0826: ; Local function
        mov     rax, rdi                                ; 0125 _ 48: 89. F8
        add     rsp, 4360                               ; 0128 _ 48: 81. C4, 00001108
        pop     rbx                                     ; 012F _ 5B
        pop     rsi                                     ; 0130 _ 5E
        pop     rdi                                     ; 0131 _ 5F
        pop     rbp                                     ; 0132 _ 5D
        pop     r12                                     ; 0133 _ 41: 5C
        pop     r13                                     ; 0135 _ 41: 5D
        pop     r14                                     ; 0137 _ 41: 5E
        pop     r15                                     ; 0139 _ 41: 5F
        ret                                             ; 013B _ C3

        nop                                             ; 013C _ 90
        nop                                             ; 013D _ 90
        nop                                             ; 013E _ 90
        nop                                             ; 013F _ 90


SECTION .xdata$_ZN6Search5perftILb1EEEyR8Position5Depth align=4 noexecute ; section number 90, const
;  Communal section not supported by YASM

        db 01H, 19H, 0AH, 00H, 19H, 01H, 21H, 02H       ; 0000 _ ......!.
        db 11H, 30H, 10H, 60H, 0FH, 70H, 0EH, 50H       ; 0008 _ .0.`.p.P
        db 0DH, 0C0H, 0BH, 0D0H, 09H, 0E0H, 02H, 0F0H   ; 0010 _ ........


SECTION .text$_ZSt8__rotateIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEEEvT_S9_S9_St26random_access_iterator_tag align=16 execute ; section number 92, code
;  Communal section not supported by YASM

_ZSt8__rotateIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEEEvT_S9_S9_St26random_access_iterator_tag:; Function begin
        push    r14                                     ; 0000 _ 41: 56
        push    r13                                     ; 0002 _ 41: 55
        push    r12                                     ; 0004 _ 41: 54
        push    rbp                                     ; 0006 _ 55
        push    rdi                                     ; 0007 _ 57
        push    rsi                                     ; 0008 _ 56
        push    rbx                                     ; 0009 _ 53
        sub     rsp, 32                                 ; 000A _ 48: 83. EC, 20
        cmp     rdx, rcx                                ; 000E _ 48: 39. CA
        mov     rbp, rcx                                ; 0011 _ 48: 89. CD
        je      ?_0836                                  ; 0014 _ 0F 84, 00000118
        cmp     r8, rdx                                 ; 001A _ 49: 39. D0
        je      ?_0836                                  ; 001D _ 0F 84, 0000010F
        sub     r8, rcx                                 ; 0023 _ 49: 29. C8
        mov     rbx, rdx                                ; 0026 _ 48: 89. D3
        mov     rdi, rdx                                ; 0029 _ 48: 89. D7
        mov     rsi, r8                                 ; 002C _ 4C: 89. C6
        sub     rbx, rcx                                ; 002F _ 48: 29. CB
        sar     rsi, 5                                  ; 0032 _ 48: C1. FE, 05
        sar     rbx, 5                                  ; 0036 _ 48: C1. FB, 05
        mov     rax, rsi                                ; 003A _ 48: 89. F0
        sub     rax, rbx                                ; 003D _ 48: 29. D8
        cmp     rax, rbx                                ; 0040 _ 48: 39. D8
        je      ?_0834                                  ; 0043 _ 0F 84, 000000C9
?_0827: mov     rdi, rsi                                ; 0049 _ 48: 89. F7
        sub     rdi, rbx                                ; 004C _ 48: 29. DF
        cmp     rdi, rbx                                ; 004F _ 48: 39. DF
        jle     ?_0831                                  ; 0052 _ 7E, 5D
        mov     r12, rbx                                ; 0054 _ 49: 89. DC
        mov     r14, rbp                                ; 0057 _ 49: 89. EE
        xor     r13d, r13d                              ; 005A _ 45: 31. ED
        shl     r12, 5                                  ; 005D _ 49: C1. E4, 05
        add     r12, rbp                                ; 0061 _ 49: 01. EC
?_0828: cmp     r13, rdi                                ; 0064 _ 49: 39. FD
        jge     ?_0829                                  ; 0067 _ 7D, 18
        mov     rdx, r12                                ; 0069 _ 4C: 89. E2
        mov     rcx, r14                                ; 006C _ 4C: 89. F1
        add     r12, 32                                 ; 006F _ 49: 83. C4, 20
        call    _ZSt4swapIN6Search8RootMoveEEvRT_S3_    ; 0073 _ E8, 00000000(rel)
        add     r14, 32                                 ; 0078 _ 49: 83. C6, 20
        inc     r13                                     ; 007C _ 49: FF. C5
        jmp     ?_0828                                  ; 007F _ EB, E3

?_0829: test    rdi, rdi                                ; 0081 _ 48: 85. FF
        mov     r10d, 0                                 ; 0084 _ 41: BA, 00000000
        mov     rax, rsi                                ; 008A _ 48: 89. F0
        cmovs   rdi, r10                                ; 008D _ 49: 0F 48. FA
        cqo                                             ; 0091 _ 48: 99
        idiv    rbx                                     ; 0093 _ 48: F7. FB
        shl     rdi, 5                                  ; 0096 _ 48: C1. E7, 05
        add     rbp, rdi                                ; 009A _ 48: 01. FD
        test    rdx, rdx                                ; 009D _ 48: 85. D2
        je      ?_0836                                  ; 00A0 _ 0F 84, 0000008C
        mov     rdi, rbx                                ; 00A6 _ 48: 89. DF
        sub     rbx, rdx                                ; 00A9 _ 48: 29. D3
?_0830: mov     rsi, rdi                                ; 00AC _ 48: 89. FE
        jmp     ?_0827                                  ; 00AF _ EB, 98

?_0831: mov     rdx, rsi                                ; 00B1 _ 48: 89. F2
        mov     rcx, rdi                                ; 00B4 _ 48: 89. F9
        xor     r12d, r12d                              ; 00B7 _ 45: 31. E4
        shl     rdx, 5                                  ; 00BA _ 48: C1. E2, 05
        shl     rcx, 5                                  ; 00BE _ 48: C1. E1, 05
        add     rbp, rdx                                ; 00C2 _ 48: 01. D5
        mov     r14, rbp                                ; 00C5 _ 49: 89. EE
        sub     r14, rcx                                ; 00C8 _ 49: 29. CE
        mov     r13, r14                                ; 00CB _ 4D: 89. F5
?_0832: cmp     rbx, r12                                ; 00CE _ 4C: 39. E3
        jle     ?_0833                                  ; 00D1 _ 7E, 18
        sub     r13, 32                                 ; 00D3 _ 49: 83. ED, 20
        sub     rbp, 32                                 ; 00D7 _ 48: 83. ED, 20
        inc     r12                                     ; 00DB _ 49: FF. C4
        mov     rdx, rbp                                ; 00DE _ 48: 89. EA
        mov     rcx, r13                                ; 00E1 _ 4C: 89. E9
        call    _ZSt4swapIN6Search8RootMoveEEvRT_S3_    ; 00E4 _ E8, 00000000(rel)
        jmp     ?_0832                                  ; 00E9 _ EB, E3

?_0833: test    rbx, rbx                                ; 00EB _ 48: 85. DB
        mov     r8d, 0                                  ; 00EE _ 41: B8, 00000000
        mov     rax, rsi                                ; 00F4 _ 48: 89. F0
        cmovs   rbx, r8                                 ; 00F7 _ 49: 0F 48. D8
        cqo                                             ; 00FB _ 48: 99
        idiv    rdi                                     ; 00FD _ 48: F7. FF
        imul    r9, rbx, -32                            ; 0100 _ 4C: 6B. CB, E0
        test    rdx, rdx                                ; 0104 _ 48: 85. D2
        mov     rbx, rdx                                ; 0107 _ 48: 89. D3
        lea     rbp, [r14+r9]                           ; 010A _ 4B: 8D. 2C 0E
        jnz     ?_0830                                  ; 010E _ 75, 9C
        jmp     ?_0836                                  ; 0110 _ EB, 20

?_0834: mov     rbp, rcx                                ; 0112 _ 48: 89. CD
        mov     rsi, rdx                                ; 0115 _ 48: 89. D6
?_0835: cmp     rbp, rdi                                ; 0118 _ 48: 39. FD
        jz      ?_0836                                  ; 011B _ 74, 15
        mov     rdx, rsi                                ; 011D _ 48: 89. F2
        mov     rcx, rbp                                ; 0120 _ 48: 89. E9
        add     rsi, 32                                 ; 0123 _ 48: 83. C6, 20
        call    _ZSt4swapIN6Search8RootMoveEEvRT_S3_    ; 0127 _ E8, 00000000(rel)
        add     rbp, 32                                 ; 012C _ 48: 83. C5, 20
        jmp     ?_0835                                  ; 0130 _ EB, E6
; _ZSt8__rotateIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEEEvT_S9_S9_St26random_access_iterator_tag End of function

?_0836: ; Local function
        add     rsp, 32                                 ; 0132 _ 48: 83. C4, 20
        pop     rbx                                     ; 0136 _ 5B
        pop     rsi                                     ; 0137 _ 5E
        pop     rdi                                     ; 0138 _ 5F
        pop     rbp                                     ; 0139 _ 5D
        pop     r12                                     ; 013A _ 41: 5C
        pop     r13                                     ; 013C _ 41: 5D
        pop     r14                                     ; 013E _ 41: 5E
        ret                                             ; 0140 _ C3

        nop                                             ; 0141 _ 90
        nop                                             ; 0142 _ 90
        nop                                             ; 0143 _ 90
        nop                                             ; 0144 _ 90
        nop                                             ; 0145 _ 90
        nop                                             ; 0146 _ 90
        nop                                             ; 0147 _ 90
        nop                                             ; 0148 _ 90
        nop                                             ; 0149 _ 90
        nop                                             ; 014A _ 90
        nop                                             ; 014B _ 90
        nop                                             ; 014C _ 90
        nop                                             ; 014D _ 90
        nop                                             ; 014E _ 90
        nop                                             ; 014F _ 90


SECTION .xdata$_ZSt8__rotateIN9__gnu_cxx17__normal_iteratorIPN6Search8RootMoveESt6vectorIS3_SaIS3_EEEEEvT_S9_S9_St26random_access_iterator_tag align=4 noexecute ; section number 93, const
;  Communal section not supported by YASM

        db 01H, 0EH, 08H, 00H, 0EH, 32H, 0AH, 30H       ; 0000 _ .....2.0
        db 09H, 60H, 08H, 70H, 07H, 50H, 06H, 0C0H      ; 0008 _ .`.p.P..
        db 04H, 0D0H, 02H, 0E0H                         ; 0010 _ ....


SECTION .rdata$_ZTV10MainThread align=32 noexecute      ; section number 95, const
;  Communal section not supported by YASM

_ZTV10MainThread:                                       ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0000 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0008 _ ........
        dq _ZN10MainThreadD1Ev                          ; 0010 _ 0000000000000000 (d)
        dq _ZN10MainThreadD0Ev                          ; 0018 _ 0000000000000000 (d)
        dq _ZN10MainThread6searchEv                     ; 0020 _ 00000000000002B0 (d)
        dq 0000000000000000H                            ; 0028 _ 0000000000000000 
        dq 0000000000000000H                            ; 0030 _ 0000000000000000 
        dq 0000000000000000H                            ; 0038 _ 0000000000000000 


SECTION .rdata$zzz align=16 noexecute                   ; section number 96, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr._ZSt7nothrow align=16 noexecute  ; section number 97, const
;  Communal section not supported by YASM

.refptr._ZSt7nothrow:                                   ; qword
        dq _ZSt7nothrow                                 ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.PieceValue align=16 noexecute    ; section number 98, const
;  Communal section not supported by YASM

.refptr.PieceValue:                                     ; qword
        dq PieceValue                                   ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.SquareBB align=16 noexecute      ; section number 99, const
;  Communal section not supported by YASM

.refptr.SquareBB:                                       ; qword
        dq SquareBB                                     ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr._ZN10Tablebases14MaxCardinalityE align=16 noexecute ; section number 100, const
;  Communal section not supported by YASM

.refptr._ZN10Tablebases14MaxCardinalityE:               ; qword
        dq _ZN10Tablebases14MaxCardinalityE             ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.Opt align=16 noexecute           ; section number 101, const
;  Communal section not supported by YASM

.refptr.Opt:                                            ; qword
        dq Opt                                          ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.Time align=16 noexecute          ; section number 102, const
;  Communal section not supported by YASM

.refptr.Time:                                           ; qword
        dq Time                                         ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.Threads align=16 noexecute       ; section number 103, const
;  Communal section not supported by YASM

.refptr.Threads:                                        ; qword
        dq Threads                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.TT align=16 noexecute            ; section number 104, const
;  Communal section not supported by YASM

.refptr.TT:                                             ; qword
        dq TT                                           ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


