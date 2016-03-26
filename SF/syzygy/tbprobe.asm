; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\syzygy\tbprobe.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: BMI etc., x64

default rel

global _ZN10Tablebases4initEPKc: function
global _ZN10Tablebases14MaxCardinalityE
global _Z10ReadUshortPh: function
global _Z10ReadUint32Ph: function
global _Z14load_dtz_tablePcyy: function
global _Z16is_little_endianv: function
global _ZN10Tablebases9probe_wdlER8PositionPi: function
global _ZN10Tablebases9probe_dtzER8PositionPi: function
global _ZN10Tablebases14root_probe_wdlER8PositionRSt6vectorIN6Search8RootMoveESaIS4_EER5Value: function
global _ZN10Tablebases10root_probeER8PositionRSt6vectorIN6Search8RootMoveESaIS4_EER5Value: function
global _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_: function
global _ZNSt12_Vector_baseI4MoveSaIS0_EE17_M_create_storageEy: function
global _ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_: function
global _ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPN6Search8RootMoveEyS3_EEvT_T0_RKT1_: function
global _ZNSt20__uninitialized_copyILb0EE13__uninit_copyISt13move_iteratorIPN6Search8RootMoveEES5_EET0_T_S8_S7_: function
global _ZNSt6vectorIN6Search8RootMoveESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEyRKS1_: function
global _ZNSt6vectorIN6Search8RootMoveESaIS1_EE6resizeEyRKS1_: function
global .refptr._ZN7Zobrist3psqE

extern _ZN7Zobrist3psqE                                 ; byte
extern _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_  ; near
extern _ZSt20__throw_length_errorPKc                    ; near
extern memmove                                          ; near
extern _ZdlPv                                           ; near
extern _Znwy                                            ; near
extern _ZSt17__throw_bad_allocv                         ; near
extern _Z8generateIL7GenType4EEP7ExtMoveRK8PositionS2_  ; near
extern _Z8generateIL7GenType1EEP7ExtMoveRK8PositionS2_  ; near
extern _ZN8Position9undo_moveE4Move                     ; near
extern _ZN8Position7do_moveE4MoveR9StateInfob           ; near
extern _ZNK8Position11gives_checkE4MoveRK9CheckInfo     ; near
extern _ZNK8Position5legalE4Movey                       ; near
extern _ZN9CheckInfoC1ERK8Position                      ; near
extern _Z8generateIL7GenType3EEP7ExtMoveRK8PositionS2_  ; near
extern _Z8generateIL7GenType0EEP7ExtMoveRK8PositionS2_  ; near
extern __mingw_vprintf                                  ; near
extern strcat                                           ; near
extern strcpy                                           ; near
extern exit                                             ; near
extern __mingw_vsprintf                                 ; near
extern memcpy                                           ; near
extern malloc                                           ; near
extern free                                             ; near
extern strcmp                                           ; near
extern __imp_ReleaseMutex                               ; qword
extern __imp_WaitForSingleObject                        ; qword
extern __imp_GetLastError                               ; qword
extern __imp_MapViewOfFile                              ; qword
extern __imp_CreateFileMappingA                         ; qword
extern __imp_GetFileSize                                ; qword
extern ___chkstk_ms                                     ; near
extern __imp_CreateFileA                                ; qword
extern __imp_UnmapViewOfFile                            ; qword
extern __imp_CloseHandle                                ; qword
extern __imp_CreateMutexA                               ; qword


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_ZN10Tablebases4initEPKc:
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 88                                 ; 000C _ 48: 83. EC, 58
        cmp     byte [rel _ZL11initialized], 0          ; 0010 _ 80. 3D, 000344EB(rel), 00
        mov     rbx, rcx                                ; 0017 _ 48: 89. CB
        jne     _ZN10Tablebases4initEPKc.cold.81        ; 001A _ 0F 85, 00000000(rel)
        lea     rdi, [rel _ZL8binomial]                 ; 0020 _ 48: 8D. 3D, 000002C0(rel)
        xor     r12d, r12d                              ; 0027 _ 45: 31. E4
        mov     r14, rdi                                ; 002A _ 49: 89. FE
?_001:  xor     r9d, r9d                                ; 002D _ 45: 31. C9
?_002:  mov     eax, r9d                                ; 0030 _ 44: 89. C8
        mov     r10d, 1                                 ; 0033 _ 41: BA, 00000001
        mov     r8d, 1                                  ; 0039 _ 41: B8, 00000001
?_003:  cmp     r8d, r12d                               ; 003F _ 45: 39. E0
        jg      ?_004                                   ; 0042 _ 7F, 13
        mov     ecx, r9d                                ; 0044 _ 44: 89. C9
        sub     ecx, r8d                                ; 0047 _ 44: 29. C1
        add     r8d, 1                                  ; 004A _ 41: 83. C0, 01
        imul    eax, ecx                                ; 004E _ 0F AF. C1
        imul    r10d, r8d                               ; 0051 _ 45: 0F AF. D0
        jmp     ?_003                                   ; 0055 _ EB, E8

?_004:  ; Local function
        cdq                                             ; 0057 _ 99
        idiv    r10d                                    ; 0058 _ 41: F7. FA
        mov     dword [r14+r9*4], eax                   ; 005B _ 43: 89. 04 8E
        add     r9, 1                                   ; 005F _ 49: 83. C1, 01
        cmp     r9, 64                                  ; 0063 _ 49: 83. F9, 40
        jnz     ?_002                                   ; 0067 _ 75, C7
        add     r12d, 1                                 ; 0069 _ 41: 83. C4, 01
        add     r14, 256                                ; 006D _ 49: 81. C6, 00000100
        cmp     r12d, 5                                 ; 0074 _ 41: 83. FC, 05
        jnz     ?_001                                   ; 0078 _ 75, B3
        lea     r11, [rel _ZL7pfactor]                  ; 007A _ 4C: 8D. 1D, 00000040(rel)
        or      r15d, 0FFFFFFFFH                        ; 0081 _ 41: 83. CF, FF
        xor     r14d, r14d                              ; 0085 _ 45: 31. F6
        lea     rcx, [rel _ZL7pawnidx]                  ; 0088 _ 48: 8D. 0D, 000000C0(rel)
?_005:  movsxd  rbp, r15d                               ; 008F _ 49: 63. EF
        xor     r12d, r12d                              ; 0092 _ 45: 31. E4
        xor     r13d, r13d                              ; 0095 _ 45: 31. ED
        shl     rbp, 6                                  ; 0098 _ 48: C1. E5, 06
        jmp     ?_008                                   ; 009C _ EB, 2C

?_006:  lea     r9, [rel _ZL7invflap]                   ; 009E _ 4C: 8D. 0D, 00000690(rel)
        movzx   eax, byte [r9+r12]                      ; 00A5 _ 43: 0F B6. 04 21
        lea     r10, [rel _ZL6ptwist]                   ; 00AA _ 4C: 8D. 15, 000006C0(rel)
        movzx   r8d, byte [r10+rax]                     ; 00B1 _ 45: 0F B6. 04 02
        add     r8, rbp                                 ; 00B6 _ 49: 01. E8
        mov     esi, dword [rdi+r8*4]                   ; 00B9 _ 42: 8B. 34 87
?_007:  add     r12, 1                                  ; 00BD _ 49: 83. C4, 01
        add     r13d, esi                               ; 00C1 _ 41: 01. F5
        cmp     r12, 6                                  ; 00C4 _ 49: 83. FC, 06
        jz      ?_009                                   ; 00C8 _ 74, 10
?_008:  test    r14d, r14d                              ; 00CA _ 45: 85. F6
        mov     dword [rcx+r12*4], r13d                 ; 00CD _ 46: 89. 2C A1
        jnz     ?_006                                   ; 00D1 _ 75, CB
        mov     esi, 1                                  ; 00D3 _ BE, 00000001
        jmp     ?_007                                   ; 00D8 _ EB, E3

?_009:  ; Local function
        mov     dword [r11], r13d                       ; 00DA _ 45: 89. 2B
        movsxd  r13, r15d                               ; 00DD _ 4D: 63. EF
        xor     r12b, r12b                              ; 00E0 _ 45: 30. E4
        xor     edx, edx                                ; 00E3 _ 31. D2
        shl     r13, 6                                  ; 00E5 _ 49: C1. E5, 06
        jmp     ?_012                                   ; 00E9 _ EB, 2B

?_010:  lea     rsi, [rel ?_501]                        ; 00EB _ 48: 8D. 35, 00000696(rel)
        movzx   r9d, byte [rsi+r12]                     ; 00F2 _ 46: 0F B6. 0C 26
        lea     rax, [rel _ZL6ptwist]                   ; 00F7 _ 48: 8D. 05, 000006C0(rel)
        movzx   r10d, byte [rax+r9]                     ; 00FE _ 46: 0F B6. 14 08
        add     r10, r13                                ; 0103 _ 4D: 01. EA
        mov     ebp, dword [rdi+r10*4]                  ; 0106 _ 42: 8B. 2C 97
?_011:  add     r12, 1                                  ; 010A _ 49: 83. C4, 01
        add     edx, ebp                                ; 010E _ 01. EA
        cmp     r12, 6                                  ; 0110 _ 49: 83. FC, 06
        jz      ?_013                                   ; 0114 _ 74, 11
?_012:  test    r14d, r14d                              ; 0116 _ 45: 85. F6
        mov     dword [rcx+r12*4+18H], edx              ; 0119 _ 42: 89. 54 A1, 18
        jnz     ?_010                                   ; 011E _ 75, CB
        mov     ebp, 1                                  ; 0120 _ BD, 00000001
        jmp     ?_011                                   ; 0125 _ EB, E3

?_013:  ; Local function
        mov     dword [r11+4H], edx                     ; 0127 _ 41: 89. 53, 04
        movsxd  rdx, r15d                               ; 012B _ 49: 63. D7
        xor     r12b, r12b                              ; 012E _ 45: 30. E4
        xor     r8d, r8d                                ; 0131 _ 45: 31. C0
        shl     rdx, 6                                  ; 0134 _ 48: C1. E2, 06
        jmp     ?_016                                   ; 0138 _ EB, 2D

?_014:  lea     rbp, [rel ?_502]                        ; 013A _ 48: 8D. 2D, 0000069C(rel)
        movzx   r9d, byte [rbp+r12]                     ; 0141 _ 46: 0F B6. 4C 25, 00
        lea     rsi, [rel _ZL6ptwist]                   ; 0147 _ 48: 8D. 35, 000006C0(rel)
        movzx   eax, byte [rsi+r9]                      ; 014E _ 42: 0F B6. 04 0E
        add     rax, rdx                                ; 0153 _ 48: 01. D0
        mov     r13d, dword [rdi+rax*4]                 ; 0156 _ 44: 8B. 2C 87
?_015:  add     r12, 1                                  ; 015A _ 49: 83. C4, 01
        add     r8d, r13d                               ; 015E _ 45: 01. E8
        cmp     r12, 6                                  ; 0161 _ 49: 83. FC, 06
        jz      ?_017                                   ; 0165 _ 74, 12
?_016:  test    r14d, r14d                              ; 0167 _ 45: 85. F6
        mov     dword [rcx+r12*4+30H], r8d              ; 016A _ 46: 89. 44 A1, 30
        jnz     ?_014                                   ; 016F _ 75, C9
        mov     r13d, 1                                 ; 0171 _ 41: BD, 00000001
        jmp     ?_015                                   ; 0177 _ EB, E1

?_017:  ; Local function
        mov     dword [r11+8H], r8d                     ; 0179 _ 45: 89. 43, 08
        movsxd  r8, r15d                                ; 017D _ 4D: 63. C7
        xor     r12b, r12b                              ; 0180 _ 45: 30. E4
        xor     r10d, r10d                              ; 0183 _ 45: 31. D2
        shl     r8, 6                                   ; 0186 _ 49: C1. E0, 06
        jmp     ?_020                                   ; 018A _ EB, 2C

?_018:  lea     r13, [rel ?_503]                        ; 018C _ 4C: 8D. 2D, 000006A2(rel)
        movzx   ebp, byte [r13+r12]                     ; 0193 _ 43: 0F B6. 6C 25, 00
        lea     r9, [rel _ZL6ptwist]                    ; 0199 _ 4C: 8D. 0D, 000006C0(rel)
        movzx   esi, byte [r9+rbp]                      ; 01A0 _ 41: 0F B6. 34 29
        add     rsi, r8                                 ; 01A5 _ 4C: 01. C6
        mov     edx, dword [rdi+rsi*4]                  ; 01A8 _ 8B. 14 B7
?_019:  add     r12, 1                                  ; 01AB _ 49: 83. C4, 01
        add     r10d, edx                               ; 01AF _ 41: 01. D2
        cmp     r12, 6                                  ; 01B2 _ 49: 83. FC, 06
        jz      ?_021                                   ; 01B6 _ 74, 11
?_020:  test    r14d, r14d                              ; 01B8 _ 45: 85. F6
        mov     dword [rcx+r12*4+48H], r10d             ; 01BB _ 46: 89. 54 A1, 48
        jnz     ?_018                                   ; 01C0 _ 75, CA
        mov     edx, 1                                  ; 01C2 _ BA, 00000001
        jmp     ?_019                                   ; 01C7 _ EB, E2

?_021:  ; Local function
        add     r14d, 1                                 ; 01C9 _ 41: 83. C6, 01
        mov     dword [r11+0CH], r10d                   ; 01CD _ 45: 89. 53, 0C
        add     rcx, 96                                 ; 01D1 _ 48: 83. C1, 60
        add     r11, 16                                 ; 01D5 _ 49: 83. C3, 10
        add     r15d, 1                                 ; 01D9 _ 41: 83. C7, 01
        cmp     r14d, 5                                 ; 01DD _ 41: 83. FE, 05
        jne     ?_005                                   ; 01E1 _ 0F 85, FFFFFEA8
        mov     byte [rel _ZL11initialized], 1          ; 01E7 _ C6. 05, 000344EB(rel), 01
        cmp     byte [rbx], 0                           ; 01EE _ 80. 3B, 00
        jz      ?_022                                   ; 01F1 _ 74, 17
        lea     rdx, [rel ?_481]                        ; 01F3 _ 48: 8D. 15, 00000000(rel)
        mov     rcx, rbx                                ; 01FA _ 48: 89. D9
        call    strcmp                                  ; 01FD _ E8, 00000000(rel)
        test    eax, eax                                ; 0202 _ 85. C0
        jne     .text.unlikely+3DH                      ; 0204 _ 0F 85, 0000003D(rel)
?_022:  add     rsp, 88                                 ; 020A _ 48: 83. C4, 58
        pop     rbx                                     ; 020E _ 5B
        pop     rsi                                     ; 020F _ 5E
        pop     rdi                                     ; 0210 _ 5F
        pop     rbp                                     ; 0211 _ 5D
        pop     r12                                     ; 0212 _ 41: 5C
        pop     r13                                     ; 0214 _ 41: 5D
        pop     r14                                     ; 0216 _ 41: 5E
        pop     r15                                     ; 0218 _ 41: 5F
        ret                                             ; 021A _ C3

        nop                                             ; 021B _ 90
        nop                                             ; 021C _ 90
        nop                                             ; 021D _ 90
        nop                                             ; 021E _ 90
        nop                                             ; 021F _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=64 noexecute                      ; section number 3, bss

_ZN10Tablebases14MaxCardinalityE:                       ; dword
        resd    4                                       ; 00000000

_ZL12wdl_to_Value:                                      ; dword
        resd    1                                       ; 00000010

?_023:  resd    2                                       ; 00000014

?_024:  resd    1                                       ; 0000001C

?_025:  resd    8                                       ; 00000020

_ZL7pfactor:                                            ; byte
        resb    128                                     ; 00000040

_ZL7pawnidx:                                            ; byte
        resb    512                                     ; 000000C0

_ZL8binomial:                                           ; byte
        resb    1280                                    ; 000002C0

_ZL9DTZ_table:                                          ; qword
        resq    1                                       ; 000007C0

?_026:  resq    1                                       ; 000007C8

?_027:  resq    184                                     ; 000007D0

?_028:                                                  ; byte
        resb    24                                      ; 00000D90

?_029:                                                  ; byte
        resb    16                                      ; 00000DA8

?_030:  resq    1                                       ; 00000DB8

_ZL7TB_hash:                                            ; byte
        resb    81920                                   ; 00000DC0

_ZL7TB_pawn:                                            ; byte
        resb    98304                                   ; 00014DC0

_ZL8TB_piece:                                           ; byte
        resb    30480                                   ; 0002CDC0

_ZL10TBnum_pawn:                                        ; dword
        resd    1                                       ; 000344D0

_ZL11TBnum_piece:                                       ; dword
        resd    1                                       ; 000344D4

_ZL5paths:                                              ; qword
        resq    1                                       ; 000344D8

_ZL11path_string:                                       ; qword
        resq    1                                       ; 000344E0

_ZL9num_paths:                                          ; dword
        resd    1                                       ; 000344E8

_ZL11initialized:                                       ; byte
        resb    4                                       ; 000344EC

_ZL8TB_mutex:                                           ; qword
        resq    2                                       ; 000344F0


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_ZN10Tablebases4initEPKc.cold.81:
        mov     rcx, qword [rel _ZL11path_string]       ; 0000 _ 48: 8B. 0D, 000344E0(rel)
        lea     r13, [rel _ZL8TB_piece]                 ; 0007 _ 4C: 8D. 2D, 0002CDC0(rel)
        xor     r12d, r12d                              ; 000E _ 45: 31. E4
        call    free                                    ; 0011 _ E8, 00000000(rel)
        mov     rcx, qword [rel _ZL5paths]              ; 0016 _ 48: 8B. 0D, 000344D8(rel)
        call    free                                    ; 001D _ E8, 00000000(rel)
?_031:  cmp     r12d, dword [rel _ZL11TBnum_piece]      ; 0022 _ 44: 3B. 25, 000344D4(rel)
        jge     ?_034                                   ; 0029 _ 7D, 75
        mov     rcx, r13                                ; 002B _ 4C: 89. E9
        add     r12d, 1                                 ; 002E _ 41: 83. C4, 01
        add     r13, 120                                ; 0032 _ 49: 83. C5, 78
        call    _ZL14free_wdl_entryP7TBEntry            ; 0036 _ E8, 0000076B
        jmp     ?_031                                   ; 003B _ EB, E5

; Note: No jump seems to point here
        mov     rdi, rbx                                ; 003D _ 48: 89. DF
        xor     eax, eax                                ; 0040 _ 31. C0
        or      rcx, 0FFFFFFFFFFFFFFFFH                 ; 0042 _ 48: 83. C9, FF
        repne scasb                                     ; 0046 _ F2: AE
        xor     ebp, ebp                                ; 0048 _ 31. ED
        mov     r13, rcx                                ; 004A _ 49: 89. CD
        not     r13                                     ; 004D _ 49: F7. D5
        mov     rcx, r13                                ; 0050 _ 4C: 89. E9
        call    malloc                                  ; 0053 _ E8, 00000000(rel)
        mov     rdx, rbx                                ; 0058 _ 48: 89. DA
        mov     r8, r13                                 ; 005B _ 4D: 89. E8
        xor     ebx, ebx                                ; 005E _ 31. DB
        mov     rcx, rax                                ; 0060 _ 48: 89. C1
        mov     rdi, rax                                ; 0063 _ 48: 89. C7
        mov     qword [rel _ZL11path_string], rax       ; 0066 _ 48: 89. 05, 000344E0(rel)
        call    memcpy                                  ; 006D _ E8, 00000000(rel)
?_032:  movsxd  rdx, ebp                                ; 0072 _ 48: 63. D5
        xor     r11d, r11d                              ; 0075 _ 45: 31. DB
        add     rdx, rdi                                ; 0078 _ 48: 01. FA
        cmp     byte [rdx], 59                          ; 007B _ 80. 3A, 3B
        setne   r11b                                    ; 007E _ 41: 0F 95. C3
        add     ebx, r11d                               ; 0082 _ 44: 01. DB
?_033:  movzx   r8d, byte [rdx]                         ; 0085 _ 44: 0F B6. 02
        mov     r10, rdx                                ; 0089 _ 49: 89. D2
        add     rdx, 1                                  ; 008C _ 48: 83. C2, 01
        cmp     r8b, 59                                 ; 0090 _ 41: 80. F8, 3B
        jz      ?_036                                   ; 0094 _ 74, 2F
        test    r8b, r8b                                ; 0096 _ 45: 84. C0
        jz      ?_036                                   ; 0099 _ 74, 2A
        add     ebp, 1                                  ; 009B _ 83. C5, 01
        jmp     ?_033                                   ; 009E _ EB, E5

?_034:  lea     rbp, [rel _ZL7TB_pawn]                  ; 00A0 _ 48: 8D. 2D, 00014DC0(rel)
        xor     esi, esi                                ; 00A7 _ 31. F6
?_035:  cmp     esi, dword [rel _ZL10TBnum_pawn]        ; 00A9 _ 3B. 35, 000344D0(rel)
        jge     ?_037                                   ; 00AF _ 7D, 22
        mov     rcx, rbp                                ; 00B1 _ 48: 89. E9
        add     esi, 1                                  ; 00B4 _ 83. C6, 01
        add     rbp, 384                                ; 00B7 _ 48: 81. C5, 00000180
        call    _ZL14free_wdl_entryP7TBEntry            ; 00BE _ E8, 000006E3
        jmp     ?_035                                   ; 00C3 _ EB, E4

?_036:  test    r8b, r8b                                ; 00C5 _ 45: 84. C0
        jz      ?_040                                   ; 00C8 _ 74, 33
        mov     byte [r10], 0                           ; 00CA _ 41: C6. 02, 00
        add     ebp, 1                                  ; 00CE _ 83. C5, 01
        jmp     ?_032                                   ; 00D1 _ EB, 9F

?_037:  lea     rdi, [rel ?_027]                        ; 00D3 _ 48: 8D. 3D, 000007D0(rel)
        xor     r15d, r15d                              ; 00DA _ 45: 31. FF
?_038:  mov     rcx, qword [rdi+r15]                    ; 00DD _ 4A: 8B. 0C 3F
        test    rcx, rcx                                ; 00E1 _ 48: 85. C9
        jz      ?_039                                   ; 00E4 _ 74, 05
        call    _ZL14free_dtz_entryP7TBEntry            ; 00E6 _ E8, 00000733
?_039:  add     r15, 24                                 ; 00EB _ 49: 83. C7, 18
        cmp     r15, 1536                               ; 00EF _ 49: 81. FF, 00000600
        jnz     ?_038                                   ; 00F6 _ 75, E5
        jmp     .text+1EEH                              ; 00F8 _ E9, 000001EE(rel)

?_040:  ; Local function
        movsxd  rcx, ebx                                ; 00FD _ 48: 63. CB
        mov     dword [rel _ZL9num_paths], ebx          ; 0100 _ 89. 1D, 000344E8(rel)
        xor     r14d, r14d                              ; 0106 _ 45: 31. F6
        xor     r15d, r15d                              ; 0109 _ 45: 31. FF
        shl     rcx, 3                                  ; 010C _ 48: C1. E1, 03
        call    malloc                                  ; 0110 _ E8, 00000000(rel)
        mov     qword [rel _ZL5paths], rax              ; 0115 _ 48: 89. 05, 000344D8(rel)
?_041:  cmp     ebx, r14d                               ; 011C _ 44: 39. F3
        jle     ?_045                                   ; 011F _ 7E, 3F
        movsxd  rsi, r15d                               ; 0121 _ 49: 63. F7
        add     rsi, rdi                                ; 0124 _ 48: 01. FE
?_042:  mov     rbp, rsi                                ; 0127 _ 48: 89. F5
        add     rsi, 1                                  ; 012A _ 48: 83. C6, 01
        cmp     byte [rsi-1H], 0                        ; 012E _ 80. 7E, FF, 00
        jnz     ?_043                                   ; 0132 _ 75, 06
        add     r15d, 1                                 ; 0134 _ 41: 83. C7, 01
        jmp     ?_042                                   ; 0138 _ EB, ED

?_043:  movsxd  r9, r15d                                ; 013A _ 4D: 63. CF
        mov     qword [rax+r14*8], rbp                  ; 013D _ 4A: 89. 2C F0
        xor     r12d, r12d                              ; 0141 _ 45: 31. E4
        add     r9, rdi                                 ; 0144 _ 49: 01. F9
?_044:  lea     r13d, [r15+r12]                         ; 0147 _ 47: 8D. 2C 27
        add     r12, 1                                  ; 014B _ 49: 83. C4, 01
        cmp     byte [r9+r12-1H], 0                     ; 014F _ 43: 80. 7C 21, FF, 00
        jnz     ?_044                                   ; 0155 _ 75, F0
        mov     r15d, r13d                              ; 0157 _ 45: 89. EF
        add     r14, 1                                  ; 015A _ 49: 83. C6, 01
        jmp     ?_041                                   ; 015E _ EB, BC

?_045:  ; Local function
        xor     r8d, r8d                                ; 0160 _ 45: 31. C0
        xor     edx, edx                                ; 0163 _ 31. D2
        xor     ecx, ecx                                ; 0165 _ 31. C9
        call    near [rel __imp_CreateMutexA]           ; 0167 _ FF. 15, 00000000(rel)
        lea     rsi, [rel _ZL7TB_pawn]                  ; 016D _ 48: 8D. 35, 00014DC0(rel)
        mov     dword [rel _ZL10TBnum_pawn], 0          ; 0174 _ C7. 05, 000344CC(rel), 00000000
        mov     qword [rel _ZL8TB_mutex], rax           ; 017E _ 48: 89. 05, 000344F0(rel)
        lea     r9, [rel _ZL7TB_hash]                   ; 0185 _ 4C: 8D. 0D, 00000DC0(rel)
        mov     dword [rel _ZL11TBnum_piece], 0         ; 018C _ C7. 05, 000344D0(rel), 00000000
        mov     dword [rel _ZN10Tablebases14MaxCardinalityE], 0; 0196 _ C7. 05, FFFFFFFC(rel), 00000000
?_046:  xor     ebx, ebx                                ; 01A0 _ 31. DB
?_047:  mov     qword [r9+rbx], 0                       ; 01A2 _ 49: C7. 04 19, 00000000
        mov     qword [r9+rbx+8H], 0                    ; 01AA _ 49: C7. 44 19, 08, 00000000
        add     rbx, 16                                 ; 01B3 _ 48: 83. C3, 10
        cmp     rbx, 80                                 ; 01B7 _ 48: 83. FB, 50
        jnz     ?_047                                   ; 01BB _ 75, E5
        add     r9, 80                                  ; 01BD _ 49: 83. C1, 50
        cmp     r9, rsi                                 ; 01C1 _ 49: 39. F1
        jnz     ?_046                                   ; 01C4 _ 75, DA
        lea     r14, [rel ?_027]                        ; 01C6 _ 4C: 8D. 35, 000007D0(rel)
        xor     r12d, r12d                              ; 01CD _ 45: 31. E4
?_048:  mov     qword [r14+r12], 0                      ; 01D0 _ 4B: C7. 04 26, 00000000
        add     r12, 24                                 ; 01D8 _ 49: 83. C4, 18
        cmp     r12, 1536                               ; 01DC _ 49: 81. FC, 00000600
        jnz     ?_048                                   ; 01E3 _ 75, EB
        lea     rdi, [rel ?_504]                        ; 01E5 _ 48: 8D. 3D, 000008B5(rel)
        xor     r15d, r15d                              ; 01EC _ 45: 31. FF
        lea     rbx, [rsp+40H]                          ; 01EF _ 48: 8D. 5C 24, 40
?_049:  movsx   r8d, byte [rdi+r15]                     ; 01F4 _ 46: 0F BE. 04 3F
        lea     rdx, [rel ?_482]                        ; 01F9 _ 48: 8D. 15, 00000008(rel)
        mov     rcx, rbx                                ; 0200 _ 48: 89. D9
        add     r15, 1                                  ; 0203 _ 49: 83. C7, 01
        call    _ZL7sprintfPcPKcz                       ; 0207 _ E8, 0000030D
        mov     rcx, rbx                                ; 020C _ 48: 89. D9
        call    _ZL7init_tbPc                           ; 020F _ E8, 00000327
        cmp     r15, 5                                  ; 0214 _ 49: 83. FF, 05
        jnz     ?_049                                   ; 0218 _ 75, DA
        lea     rsi, [rel _ZL4pchr]                     ; 021A _ 48: 8D. 35, 000008B4(rel)
        xor     ebp, ebp                                ; 0221 _ 31. ED
?_050:  movsx   r13d, byte [rdi+rbp]                    ; 0223 _ 44: 0F BE. 2C 2F
        lea     r12d, [rbp+1H]                          ; 0228 _ 44: 8D. 65, 01
?_051:  movsxd  rax, r12d                               ; 022C _ 49: 63. C4
        mov     r8d, r13d                               ; 022F _ 45: 89. E8
        mov     rcx, rbx                                ; 0232 _ 48: 89. D9
        movsx   r9d, byte [rsi+rax]                     ; 0235 _ 44: 0F BE. 0C 06
        lea     rdx, [rel ?_483]                        ; 023A _ 48: 8D. 15, 0000000E(rel)
        add     r12d, 1                                 ; 0241 _ 41: 83. C4, 01
        call    _ZL7sprintfPcPKcz                       ; 0245 _ E8, 000002CF
        mov     rcx, rbx                                ; 024A _ 48: 89. D9
        call    _ZL7init_tbPc                           ; 024D _ E8, 000002E9
        cmp     r12d, 6                                 ; 0252 _ 41: 83. FC, 06
        jnz     ?_051                                   ; 0256 _ 75, D4
        add     rbp, 1                                  ; 0258 _ 48: 83. C5, 01
        cmp     rbp, 5                                  ; 025C _ 48: 83. FD, 05
        jnz     ?_050                                   ; 0260 _ 75, C1
        xor     r14d, r14d                              ; 0262 _ 45: 31. F6
?_052:  movsx   r12d, byte [rdi+r14]                    ; 0265 _ 46: 0F BE. 24 37
        lea     r15d, [r14+1H]                          ; 026A _ 45: 8D. 7E, 01
?_053:  lea     rdx, [rel ?_484]                        ; 026E _ 48: 8D. 15, 00000016(rel)
        movsxd  rcx, r15d                               ; 0275 _ 49: 63. CF
        mov     r8d, r12d                               ; 0278 _ 45: 89. E0
        movsx   r9d, byte [rsi+rcx]                     ; 027B _ 44: 0F BE. 0C 0E
        mov     rcx, rbx                                ; 0280 _ 48: 89. D9
        add     r15d, 1                                 ; 0283 _ 41: 83. C7, 01
        call    _ZL7sprintfPcPKcz                       ; 0287 _ E8, 0000028D
        mov     rcx, rbx                                ; 028C _ 48: 89. D9
        call    _ZL7init_tbPc                           ; 028F _ E8, 000002A7
        cmp     r15d, 6                                 ; 0294 _ 41: 83. FF, 06
        jnz     ?_053                                   ; 0298 _ 75, D4
        add     r14, 1                                  ; 029A _ 49: 83. C6, 01
        cmp     r14, 5                                  ; 029E _ 49: 83. FE, 05
        jnz     ?_052                                   ; 02A2 _ 75, C1
        xor     ebp, ebp                                ; 02A4 _ 31. ED
?_054:  movsx   r14d, byte [rdi+rbp]                    ; 02A6 _ 44: 0F BE. 34 2F
        lea     r12d, [rbp+1H]                          ; 02AB _ 44: 8D. 65, 01
?_055:  movsxd  r11, r12d                               ; 02AF _ 4D: 63. DC
        xor     r13d, r13d                              ; 02B2 _ 45: 31. ED
        movsx   r15d, byte [rsi+r11]                    ; 02B5 _ 46: 0F BE. 3C 1E
?_056:  movsx   r10d, byte [rdi+r13]                    ; 02BA _ 46: 0F BE. 14 2F
        mov     r9d, r15d                               ; 02BF _ 45: 89. F9
        mov     r8d, r14d                               ; 02C2 _ 45: 89. F0
        mov     rcx, rbx                                ; 02C5 _ 48: 89. D9
        lea     rdx, [rel ?_485]                        ; 02C8 _ 48: 8D. 15, 0000001E(rel)
        add     r13, 1                                  ; 02CF _ 49: 83. C5, 01
        mov     dword [rsp+20H], r10d                   ; 02D3 _ 44: 89. 54 24, 20
        call    _ZL7sprintfPcPKcz                       ; 02D8 _ E8, 0000023C
        mov     rcx, rbx                                ; 02DD _ 48: 89. D9
        call    _ZL7init_tbPc                           ; 02E0 _ E8, 00000256
        cmp     r13, 5                                  ; 02E5 _ 49: 83. FD, 05
        jnz     ?_056                                   ; 02E9 _ 75, CF
        add     r12d, 1                                 ; 02EB _ 41: 83. C4, 01
        cmp     r12d, 6                                 ; 02EF _ 41: 83. FC, 06
        jnz     ?_055                                   ; 02F3 _ 75, BA
        add     rbp, 1                                  ; 02F5 _ 48: 83. C5, 01
        cmp     rbp, 5                                  ; 02F9 _ 48: 83. FD, 05
        jnz     ?_054                                   ; 02FD _ 75, A7
        xor     ebp, ebp                                ; 02FF _ 31. ED
?_057:  movsx   r14d, byte [rdi+rbp]                    ; 0301 _ 44: 0F BE. 34 2F
        lea     r12d, [rbp+1H]                          ; 0306 _ 44: 8D. 65, 01
?_058:  movsxd  r8, r12d                                ; 030A _ 4D: 63. C4
        mov     r13d, r12d                              ; 030D _ 45: 89. E5
        movsx   r15d, byte [rsi+r8]                     ; 0310 _ 46: 0F BE. 3C 06
?_059:  movsxd  rdx, r13d                               ; 0315 _ 49: 63. D5
        mov     r8d, r14d                               ; 0318 _ 45: 89. F0
        mov     rcx, rbx                                ; 031B _ 48: 89. D9
        movsx   r9d, byte [rsi+rdx]                     ; 031E _ 44: 0F BE. 0C 16
        lea     rdx, [rel ?_486]                        ; 0323 _ 48: 8D. 15, 00000028(rel)
        add     r13d, 1                                 ; 032A _ 41: 83. C5, 01
        mov     dword [rsp+20H], r9d                    ; 032E _ 44: 89. 4C 24, 20
        mov     r9d, r15d                               ; 0333 _ 45: 89. F9
        call    _ZL7sprintfPcPKcz                       ; 0336 _ E8, 000001DE
        mov     rcx, rbx                                ; 033B _ 48: 89. D9
        call    _ZL7init_tbPc                           ; 033E _ E8, 000001F8
        cmp     r13d, 6                                 ; 0343 _ 41: 83. FD, 06
        jnz     ?_059                                   ; 0347 _ 75, CC
        add     r12d, 1                                 ; 0349 _ 41: 83. C4, 01
        cmp     r12d, 6                                 ; 034D _ 41: 83. FC, 06
        jnz     ?_058                                   ; 0351 _ 75, B7
        add     rbp, 1                                  ; 0353 _ 48: 83. C5, 01
        cmp     rbp, 5                                  ; 0357 _ 48: 83. FD, 05
        jnz     ?_057                                   ; 035B _ 75, A4
        xor     r13d, r13d                              ; 035D _ 45: 31. ED
?_060:  lea     r15d, [r13+1H]                          ; 0360 _ 45: 8D. 7D, 01
        mov     ebp, r15d                               ; 0364 _ 44: 89. FD
?_061:  mov     r12d, r15d                              ; 0367 _ 45: 89. FC
        mov     r14d, ebp                               ; 036A _ 41: 89. EE
        movsxd  rax, ebp                                ; 036D _ 48: 63. C5
?_062:  movsxd  r11, r12d                               ; 0370 _ 4D: 63. DC
?_063:  cmp     r14d, 5                                 ; 0373 _ 41: 83. FE, 05
        jg      ?_064                                   ; 0377 _ 7F, 4F
        movsxd  rdx, r14d                               ; 0379 _ 49: 63. D6
        movsx   ecx, byte [rsi+r11]                     ; 037C _ 42: 0F BE. 0C 1E
        mov     qword [rsp+38H], rax                    ; 0381 _ 48: 89. 44 24, 38
        add     r14d, 1                                 ; 0386 _ 41: 83. C6, 01
        movsx   r9d, byte [rsi+rax]                     ; 038A _ 44: 0F BE. 0C 06
        mov     qword [rsp+30H], r11                    ; 038F _ 4C: 89. 5C 24, 30
        movsx   eax, byte [rsi+rdx]                     ; 0394 _ 0F BE. 04 16
        lea     rdx, [rel ?_487]                        ; 0398 _ 48: 8D. 15, 00000032(rel)
        movsx   r8d, byte [rdi+r13]                     ; 039F _ 46: 0F BE. 04 2F
        mov     dword [rsp+20H], ecx                    ; 03A4 _ 89. 4C 24, 20
        mov     rcx, rbx                                ; 03A8 _ 48: 89. D9
        mov     dword [rsp+28H], eax                    ; 03AB _ 89. 44 24, 28
        call    _ZL7sprintfPcPKcz                       ; 03AF _ E8, 00000165
        mov     rcx, rbx                                ; 03B4 _ 48: 89. D9
        call    _ZL7init_tbPc                           ; 03B7 _ E8, 0000017F
        mov     rax, qword [rsp+38H]                    ; 03BC _ 48: 8B. 44 24, 38
        mov     r11, qword [rsp+30H]                    ; 03C1 _ 4C: 8B. 5C 24, 30
        jmp     ?_063                                   ; 03C6 _ EB, AB

?_064:  ; Local function
        add     r12d, 1                                 ; 03C8 _ 41: 83. C4, 01
        cmp     r12d, 6                                 ; 03CC _ 41: 83. FC, 06
        jz      ?_065                                   ; 03D0 _ 74, 0C
        cmp     r12d, r15d                              ; 03D2 _ 45: 39. FC
        mov     r14d, r12d                              ; 03D5 _ 45: 89. E6
        cmove   r14d, ebp                               ; 03D8 _ 44: 0F 44. F5
        jmp     ?_062                                   ; 03DC _ EB, 92

?_065:  ; Local function
        add     ebp, 1                                  ; 03DE _ 83. C5, 01
        cmp     ebp, 6                                  ; 03E1 _ 83. FD, 06
        jnz     ?_061                                   ; 03E4 _ 75, 81
        add     r13, 1                                  ; 03E6 _ 49: 83. C5, 01
        cmp     r13, 5                                  ; 03EA _ 49: 83. FD, 05
        jne     ?_060                                   ; 03EE _ 0F 85, FFFFFF6C
        xor     ebp, ebp                                ; 03F4 _ 31. ED
?_066:  movsx   ecx, byte [rdi+rbp]                     ; 03F6 _ 0F BE. 0C 2F
        lea     r12d, [rbp+1H]                          ; 03FA _ 44: 8D. 65, 01
        mov     dword [rsp+38H], ecx                    ; 03FE _ 89. 4C 24, 38
?_067:  movsxd  r11, r12d                               ; 0402 _ 4D: 63. DC
        mov     r13d, r12d                              ; 0405 _ 45: 89. E5
        movsx   r10d, byte [rsi+r11]                    ; 0408 _ 46: 0F BE. 14 1E
        mov     dword [rsp+30H], r10d                   ; 040D _ 44: 89. 54 24, 30
?_068:  movsxd  r8, r13d                                ; 0412 _ 4D: 63. C5
        xor     r15d, r15d                              ; 0415 _ 45: 31. FF
        movsx   r14d, byte [rsi+r8]                     ; 0418 _ 46: 0F BE. 34 06
?_069:  movsx   edx, byte [rdi+r15]                     ; 041D _ 42: 0F BE. 14 3F
        mov     rcx, rbx                                ; 0422 _ 48: 89. D9
        mov     dword [rsp+20H], r14d                   ; 0425 _ 44: 89. 74 24, 20
        add     r15, 1                                  ; 042A _ 49: 83. C7, 01
        mov     r9d, dword [rsp+30H]                    ; 042E _ 44: 8B. 4C 24, 30
        mov     r8d, dword [rsp+38H]                    ; 0433 _ 44: 8B. 44 24, 38
        mov     dword [rsp+28H], edx                    ; 0438 _ 89. 54 24, 28
        lea     rdx, [rel ?_488]                        ; 043C _ 48: 8D. 15, 0000003E(rel)
        call    _ZL7sprintfPcPKcz                       ; 0443 _ E8, 000000D1
        mov     rcx, rbx                                ; 0448 _ 48: 89. D9
        call    _ZL7init_tbPc                           ; 044B _ E8, 000000EB
        cmp     r15, 5                                  ; 0450 _ 49: 83. FF, 05
        jnz     ?_069                                   ; 0454 _ 75, C7
        add     r13d, 1                                 ; 0456 _ 41: 83. C5, 01
        cmp     r13d, 6                                 ; 045A _ 41: 83. FD, 06
        jnz     ?_068                                   ; 045E _ 75, B2
        add     r12d, 1                                 ; 0460 _ 41: 83. C4, 01
        cmp     r12d, 6                                 ; 0464 _ 41: 83. FC, 06
        jnz     ?_067                                   ; 0468 _ 75, 98
        add     rbp, 1                                  ; 046A _ 48: 83. C5, 01
        cmp     rbp, 5                                  ; 046E _ 48: 83. FD, 05
        jnz     ?_066                                   ; 0472 _ 75, 82
        xor     ebp, ebp                                ; 0474 _ 31. ED
?_070:  movsx   r9d, byte [rdi+rbp]                     ; 0476 _ 44: 0F BE. 0C 2F
        lea     r12d, [rbp+1H]                          ; 047B _ 44: 8D. 65, 01
        mov     dword [rsp+38H], r9d                    ; 047F _ 44: 89. 4C 24, 38
?_071:  movsxd  rax, r12d                               ; 0484 _ 49: 63. C4
        mov     r13d, r12d                              ; 0487 _ 45: 89. E5
        movsx   ecx, byte [rsi+rax]                     ; 048A _ 0F BE. 0C 06
        mov     dword [rsp+30H], ecx                    ; 048E _ 89. 4C 24, 30
?_072:  movsxd  r11, r13d                               ; 0492 _ 4D: 63. DD
        mov     r15d, r13d                              ; 0495 _ 45: 89. EF
        movsx   r14d, byte [rsi+r11]                    ; 0498 _ 46: 0F BE. 34 1E
?_073:  movsxd  r10, r15d                               ; 049D _ 4D: 63. D7
        mov     r9d, dword [rsp+30H]                    ; 04A0 _ 44: 8B. 4C 24, 30
        mov     rcx, rbx                                ; 04A5 _ 48: 89. D9
        mov     dword [rsp+20H], r14d                   ; 04A8 _ 44: 89. 74 24, 20
        movsx   r8d, byte [rsi+r10]                     ; 04AD _ 46: 0F BE. 04 16
        lea     rdx, [rel ?_489]                        ; 04B2 _ 48: 8D. 15, 0000004A(rel)
        add     r15d, 1                                 ; 04B9 _ 41: 83. C7, 01
        mov     dword [rsp+28H], r8d                    ; 04BD _ 44: 89. 44 24, 28
        mov     r8d, dword [rsp+38H]                    ; 04C2 _ 44: 8B. 44 24, 38
        call    _ZL7sprintfPcPKcz                       ; 04C7 _ E8, 0000004D
        mov     rcx, rbx                                ; 04CC _ 48: 89. D9
        call    _ZL7init_tbPc                           ; 04CF _ E8, 00000067
        cmp     r15d, 6                                 ; 04D4 _ 41: 83. FF, 06
        jnz     ?_073                                   ; 04D8 _ 75, C3
        add     r13d, 1                                 ; 04DA _ 41: 83. C5, 01
        cmp     r13d, 6                                 ; 04DE _ 41: 83. FD, 06
        jnz     ?_072                                   ; 04E2 _ 75, AE
        add     r12d, 1                                 ; 04E4 _ 41: 83. C4, 01
        cmp     r12d, 6                                 ; 04E8 _ 41: 83. FC, 06
        jnz     ?_071                                   ; 04EC _ 75, 96
        add     rbp, 1                                  ; 04EE _ 48: 83. C5, 01
        cmp     rbp, 5                                  ; 04F2 _ 48: 83. FD, 05
        jne     ?_070                                   ; 04F6 _ 0F 85, FFFFFF7A
        mov     edx, dword [rel _ZL10TBnum_pawn]        ; 04FC _ 8B. 15, 000344D0(rel)
        lea     rcx, [rel ?_490]                        ; 0502 _ 48: 8D. 0D, 00000058(rel)
        add     edx, dword [rel _ZL11TBnum_piece]       ; 0509 _ 03. 15, 000344D4(rel)
        call    _ZL6printfPKcz                          ; 050F _ E8, 0000048E
        jmp     ?_022                                   ; 0514 _ E9, 0000020A(rel)

_ZL7sprintfPcPKcz:; Local function
        sub     rsp, 56                                 ; 0519 _ 48: 83. EC, 38
        mov     qword [rsp+50H], r8                     ; 051D _ 4C: 89. 44 24, 50
        lea     r8, [rsp+50H]                           ; 0522 _ 4C: 8D. 44 24, 50
        mov     qword [rsp+58H], r9                     ; 0527 _ 4C: 89. 4C 24, 58
        mov     qword [rsp+28H], r8                     ; 052C _ 4C: 89. 44 24, 28
        call    __mingw_vsprintf                        ; 0531 _ E8, 00000000(rel)
        add     rsp, 56                                 ; 0536 _ 48: 83. C4, 38
        ret                                             ; 053A _ C3

_ZL7init_tbPc:; Local function
        push    rbp                                     ; 053B _ 55
        push    rdi                                     ; 053C _ 57
        push    rsi                                     ; 053D _ 56
        push    rbx                                     ; 053E _ 53
        sub     rsp, 104                                ; 053F _ 48: 83. EC, 68
        lea     rdx, [rel ?_491]                        ; 0543 _ 48: 8D. 15, 0000007A(rel)
        mov     rbx, rcx                                ; 054A _ 48: 89. CB
        call    _ZL7open_tbPKcS0_                       ; 054D _ E8, 00000328
        cmp     rax, -1                                 ; 0552 _ 48: 83. F8, FF
        je      ?_098                                   ; 0556 _ 0F 84, 00000241
        lea     rsi, [rsp+20H]                          ; 055C _ 48: 8D. 74 24, 20
        mov     rcx, rax                                ; 0561 _ 48: 89. C1
        xor     edi, edi                                ; 0564 _ 31. FF
        call    near [rel __imp_CloseHandle]            ; 0566 _ FF. 15, 00000000(rel)
?_074:  mov     dword [rdi+rsi], 0                      ; 056C _ C7. 04 37, 00000000
        add     rdi, 4                                  ; 0573 _ 48: 83. C7, 04
        cmp     rdi, 64                                 ; 0577 _ 48: 83. FF, 40
        jnz     ?_074                                   ; 057B _ 75, EF
        xor     dil, dil                                ; 057D _ 40: 30. FF
        mov     ebp, 8                                  ; 0580 _ BD, 00000008
?_075:  mov     dl, byte [rbx]                          ; 0585 _ 8A. 13
        test    dl, dl                                  ; 0587 _ 84. D2
        je      ?_083                                   ; 0589 _ 0F 84, 00000089
        cmp     dl, 80                                  ; 058F _ 80. FA, 50
        jz      ?_077                                   ; 0592 _ 74, 30
        jg      ?_076                                   ; 0594 _ 7F, 1F
        cmp     dl, 75                                  ; 0596 _ 80. FA, 4B
        jz      ?_081                                   ; 0599 _ 74, 66
        cmp     dl, 78                                  ; 059B _ 80. FA, 4E
        jz      ?_078                                   ; 059E _ 74, 35
        cmp     dl, 66                                  ; 05A0 _ 80. FA, 42
        jnz     ?_082                                   ; 05A3 _ 75, 6B
        mov     r8d, edi                                ; 05A5 _ 41: 89. F8
        or      r8d, 03H                                ; 05A8 _ 41: 83. C8, 03
        movsxd  rax, r8d                                ; 05AC _ 49: 63. C0
        inc     dword [rsp+rax*4+20H]                   ; 05AF _ FF. 44 84, 20
        jmp     ?_082                                   ; 05B3 _ EB, 5B

?_076:  cmp     dl, 82                                  ; 05B5 _ 80. FA, 52
        jz      ?_079                                   ; 05B8 _ 74, 2A
        jl      ?_080                                   ; 05BA _ 7C, 36
        cmp     dl, 118                                 ; 05BC _ 80. FA, 76
        cmove   edi, ebp                                ; 05BF _ 0F 44. FD
        jmp     ?_082                                   ; 05C2 _ EB, 4C

?_077:  mov     r10d, edi                               ; 05C4 _ 41: 89. FA
        or      r10d, 01H                               ; 05C7 _ 41: 83. CA, 01
        movsxd  r11, r10d                               ; 05CB _ 4D: 63. DA
        inc     dword [rsp+r11*4+20H]                   ; 05CE _ 42: FF. 44 9C, 20
        jmp     ?_082                                   ; 05D3 _ EB, 3B

?_078:  mov     ecx, edi                                ; 05D5 _ 89. F9
        or      ecx, 02H                                ; 05D7 _ 83. C9, 02
        movsxd  r10, ecx                                ; 05DA _ 4C: 63. D1
        inc     dword [rsp+r10*4+20H]                   ; 05DD _ 42: FF. 44 94, 20
        jmp     ?_082                                   ; 05E2 _ EB, 2C

?_079:  mov     eax, edi                                ; 05E4 _ 89. F8
        or      eax, 04H                                ; 05E6 _ 83. C8, 04
        movsxd  rcx, eax                                ; 05E9 _ 48: 63. C8
        inc     dword [rsp+rcx*4+20H]                   ; 05EC _ FF. 44 8C, 20
        jmp     ?_082                                   ; 05F0 _ EB, 1E

?_080:  mov     edx, edi                                ; 05F2 _ 89. FA
        or      edx, 05H                                ; 05F4 _ 83. CA, 05
        movsxd  r8, edx                                 ; 05F7 _ 4C: 63. C2
        inc     dword [rsp+r8*4+20H]                    ; 05FA _ 42: FF. 44 84, 20
        jmp     ?_082                                   ; 05FF _ EB, 0F

?_081:  mov     r11d, edi                               ; 0601 _ 41: 89. FB
        or      r11d, 06H                               ; 0604 _ 41: 83. CB, 06
        movsxd  r9, r11d                                ; 0608 _ 4D: 63. CB
        inc     dword [rsp+r9*4+20H]                    ; 060B _ 42: FF. 44 8C, 20
?_082:  inc     rbx                                     ; 0610 _ 48: FF. C3
        jmp     ?_075                                   ; 0613 _ E9, FFFFFF6D

?_083:  xor     edx, edx                                ; 0618 _ 31. D2
        mov     rcx, rsi                                ; 061A _ 48: 89. F1
        call    _ZL17calc_key_from_pcsPii               ; 061D _ E8, 00000652
        mov     rcx, rsi                                ; 0622 _ 48: 89. F1
        mov     edx, 1                                  ; 0625 _ BA, 00000001
        mov     rdi, rax                                ; 062A _ 48: 89. C7
        call    _ZL17calc_key_from_pcsPii               ; 062D _ E8, 00000642
        mov     ecx, dword [rsp+24H]                    ; 0632 _ 8B. 4C 24, 24
        mov     rbp, rax                                ; 0636 _ 48: 89. C5
        mov     eax, dword [rsp+44H]                    ; 0639 _ 8B. 44 24, 44
        mov     r9d, ecx                                ; 063D _ 41: 89. C9
        add     r9d, eax                                ; 0640 _ 41: 01. C1
        jnz     ?_085                                   ; 0643 _ 75, 40
        movsxd  r11, dword [rel _ZL11TBnum_piece]       ; 0645 _ 4C: 63. 1D, 000344D4(rel)
        cmp     r11d, 254                               ; 064C _ 41: 81. FB, 000000FE
        jnz     ?_084                                   ; 0653 _ 75, 16
        lea     rcx, [rel ?_492]                        ; 0655 _ 48: 8D. 0D, 00000080(rel)
        call    _ZL6printfPKcz                          ; 065C _ E8, 00000341
        mov     ecx, 1                                  ; 0661 _ B9, 00000001
        call    exit                                    ; 0666 _ E8, 00000000(rel)
?_084:  imul    rbx, r11, 120                           ; 066B _ 49: 6B. DB, 78
        lea     edx, [r11+1H]                           ; 066F _ 41: 8D. 53, 01
        lea     r8, [rel _ZL8TB_piece]                  ; 0673 _ 4C: 8D. 05, 0002CDC0(rel)
        mov     dword [rel _ZL11TBnum_piece], edx       ; 067A _ 89. 15, 000344D4(rel)
        add     rbx, r8                                 ; 0680 _ 4C: 01. C3
        jmp     ?_087                                   ; 0683 _ EB, 41

?_085:  movsxd  rbx, dword [rel _ZL10TBnum_pawn]        ; 0685 _ 48: 63. 1D, 000344D0(rel)
        cmp     ebx, 256                                ; 068C _ 81. FB, 00000100
        jnz     ?_086                                   ; 0692 _ 75, 16
        lea     rcx, [rel ?_493]                        ; 0694 _ 48: 8D. 0D, 0000009C(rel)
        call    _ZL6printfPKcz                          ; 069B _ E8, 00000302
        mov     ecx, 1                                  ; 06A0 _ B9, 00000001
        call    exit                                    ; 06A5 _ E8, 00000000(rel)
?_086:  lea     r8d, [rbx+1H]                           ; 06AA _ 44: 8D. 43, 01
        imul    rbx, rbx, 384                           ; 06AE _ 48: 69. DB, 00000180
        mov     dword [rel _ZL10TBnum_pawn], r8d        ; 06B5 _ 44: 89. 05, 000344D0(rel)
        lea     r10, [rel _ZL7TB_pawn]                  ; 06BC _ 4C: 8D. 15, 00014DC0(rel)
        add     rbx, r10                                ; 06C3 _ 4C: 01. D3
?_087:  mov     qword [rbx+8H], rdi                     ; 06C6 _ 48: 89. 7B, 08
        xor     r10d, r10d                              ; 06CA _ 45: 31. D2
        xor     r11d, r11d                              ; 06CD _ 45: 31. DB
        mov     byte [rbx+18H], 0                       ; 06D0 _ C6. 43, 18, 00
?_088:  add     r11d, dword [rsi+r10]                   ; 06D4 _ 46: 03. 1C 16
        add     r10, 4                                  ; 06D8 _ 49: 83. C2, 04
        cmp     r10, 64                                 ; 06DC _ 49: 83. FA, 40
        jnz     ?_088                                   ; 06E0 _ 75, F2
        cmp     rdi, rbp                                ; 06E2 _ 48: 39. EF
        movzx   edx, r11b                               ; 06E5 _ 41: 0F B6. D3
        mov     byte [rbx+19H], r11b                    ; 06E9 _ 44: 88. 5B, 19
        sete    byte [rbx+1AH]                          ; 06ED _ 0F 94. 43, 1A
        test    r9d, r9d                                ; 06F1 _ 45: 85. C9
        setg    r9b                                     ; 06F4 _ 41: 0F 9F. C1
        cmp     edx, dword [rel _ZN10Tablebases14MaxCardinalityE]; 06F8 _ 3B. 15, 00000000(rel)
        mov     byte [rbx+1BH], r9b                     ; 06FE _ 44: 88. 4B, 1B
        jle     ?_089                                   ; 0702 _ 7E, 06
        mov     dword [rel _ZN10Tablebases14MaxCardinalityE], edx; 0704 _ 89. 15, 00000000(rel)
?_089:  test    r9b, r9b                                ; 070A _ 45: 84. C9
        jz      ?_091                                   ; 070D _ 74, 1A
        test    eax, eax                                ; 070F _ 85. C0
        mov     byte [rbx+1CH], cl                      ; 0711 _ 88. 4B, 1C
        mov     byte [rbx+1DH], al                      ; 0714 _ 88. 43, 1D
        jle     ?_097                                   ; 0717 _ 7E, 68
        test    ecx, ecx                                ; 0719 _ 85. C9
        jz      ?_090                                   ; 071B _ 74, 04
        cmp     ecx, eax                                ; 071D _ 39. C1
        jle     ?_097                                   ; 071F _ 7E, 60
?_090:  mov     byte [rbx+1CH], al                      ; 0721 _ 88. 43, 1C
        mov     byte [rbx+1DH], cl                      ; 0724 _ 88. 4B, 1D
        jmp     ?_097                                   ; 0727 _ EB, 58

?_091:  xor     r8d, r8d                                ; 0729 _ 45: 31. C0
        xor     eax, eax                                ; 072C _ 31. C0
?_092:  cmp     dword [rsi+r8], 1                       ; 072E _ 42: 83. 3C 06, 01
        lea     ecx, [rax+1H]                           ; 0733 _ 8D. 48, 01
        cmove   eax, ecx                                ; 0736 _ 0F 44. C1
        add     r8, 4                                   ; 0739 _ 49: 83. C0, 04
        cmp     r8, 64                                  ; 073D _ 49: 83. F8, 40
        jnz     ?_092                                   ; 0741 _ 75, EB
        cmp     eax, 2                                  ; 0743 _ 83. F8, 02
        jle     ?_093                                   ; 0746 _ 7E, 06
        mov     byte [rbx+1CH], 0                       ; 0748 _ C6. 43, 1C, 00
        jmp     ?_097                                   ; 074C _ EB, 33

?_093:  jnz     ?_094                                   ; 074E _ 75, 06
        mov     byte [rbx+1CH], 2                       ; 0750 _ C6. 43, 1C, 02
        jmp     ?_097                                   ; 0754 _ EB, 2B

?_094:  xor     r10d, r10d                              ; 0756 _ 45: 31. D2
        mov     r11d, 16                                ; 0759 _ 41: BB, 00000010
?_095:  mov     r9d, dword [rsi+r10]                    ; 075F _ 46: 8B. 0C 16
        cmp     r9d, r11d                               ; 0763 _ 45: 39. D9
        jge     ?_096                                   ; 0766 _ 7D, 08
        cmp     r9d, 1                                  ; 0768 _ 41: 83. F9, 01
        cmovg   r11d, r9d                               ; 076C _ 45: 0F 4F. D9
?_096:  add     r10, 4                                  ; 0770 _ 49: 83. C2, 04
        lea     edx, [r11+1H]                           ; 0774 _ 41: 8D. 53, 01
        cmp     r10, 64                                 ; 0778 _ 49: 83. FA, 40
        jnz     ?_095                                   ; 077C _ 75, E1
        mov     byte [rbx+1CH], dl                      ; 077E _ 88. 53, 1C
?_097:  mov     rdx, rdi                                ; 0781 _ 48: 89. FA
        mov     rcx, rbx                                ; 0784 _ 48: 89. D9
        call    _ZL11add_to_hashP7TBEntryy              ; 0787 _ E8, 000001AA
        cmp     rbp, rdi                                ; 078C _ 48: 39. FD
        jz      ?_098                                   ; 078F _ 74, 0C
        mov     rdx, rbp                                ; 0791 _ 48: 89. EA
        mov     rcx, rbx                                ; 0794 _ 48: 89. D9
        call    _ZL11add_to_hashP7TBEntryy              ; 0797 _ E8, 0000019A
        nop                                             ; 079C _ 90
?_098:  add     rsp, 104                                ; 079D _ 48: 83. C4, 68
        pop     rbx                                     ; 07A1 _ 5B
        pop     rsi                                     ; 07A2 _ 5E
        pop     rdi                                     ; 07A3 _ 5F
        pop     rbp                                     ; 07A4 _ 5D
        ret                                             ; 07A5 _ C3

_ZL14free_wdl_entryP7TBEntry:; Local function
        push    rsi                                     ; 07A6 _ 56
        push    rbx                                     ; 07A7 _ 53
        sub     rsp, 40                                 ; 07A8 _ 48: 83. EC, 28
        mov     rsi, qword [rcx+10H]                    ; 07AC _ 48: 8B. 71, 10
        mov     rbx, rcx                                ; 07B0 _ 48: 89. CB
        mov     rcx, qword [rcx]                        ; 07B3 _ 48: 8B. 09
        test    rcx, rcx                                ; 07B6 _ 48: 85. C9
        jz      ?_099                                   ; 07B9 _ 74, 0F
        call    near [rel __imp_UnmapViewOfFile]        ; 07BB _ FF. 15, 00000000(rel)
        mov     rcx, rsi                                ; 07C1 _ 48: 89. F1
        call    near [rel __imp_CloseHandle]            ; 07C4 _ FF. 15, 00000000(rel)
?_099:  xor     esi, esi                                ; 07CA _ 31. F6
        cmp     byte [rbx+1BH], 0                       ; 07CC _ 80. 7B, 1B, 00
        jnz     ?_101                                   ; 07D0 _ 75, 2A
        mov     rcx, qword [rbx+20H]                    ; 07D2 _ 48: 8B. 4B, 20
        call    free                                    ; 07D6 _ E8, 00000000(rel)
        mov     rcx, qword [rbx+28H]                    ; 07DB _ 48: 8B. 4B, 28
        test    rcx, rcx                                ; 07DF _ 48: 85. C9
        jz      ?_102                                   ; 07E2 _ 74, 33
        add     rsp, 40                                 ; 07E4 _ 48: 83. C4, 28
        pop     rbx                                     ; 07E8 _ 5B
        pop     rsi                                     ; 07E9 _ 5E
        jmp     free                                    ; 07EA _ E9, 00000000(rel)

?_100:  add     rsi, 88                                 ; 07EF _ 48: 83. C6, 58
        cmp     rsi, 352                                ; 07F3 _ 48: 81. FE, 00000160
        jz      ?_102                                   ; 07FA _ 74, 1B
?_101:  mov     rcx, qword [rbx+rsi+20H]                ; 07FC _ 48: 8B. 4C 33, 20
        call    free                                    ; 0801 _ E8, 00000000(rel)
        mov     rcx, qword [rbx+rsi+28H]                ; 0806 _ 48: 8B. 4C 33, 28
        test    rcx, rcx                                ; 080B _ 48: 85. C9
        jz      ?_100                                   ; 080E _ 74, DF
        call    free                                    ; 0810 _ E8, 00000000(rel)
        jmp     ?_100                                   ; 0815 _ EB, D8

?_102:  ; Local function
        add     rsp, 40                                 ; 0817 _ 48: 83. C4, 28
        pop     rbx                                     ; 081B _ 5B
        pop     rsi                                     ; 081C _ 5E
        ret                                             ; 081D _ C3

_ZL14free_dtz_entryP7TBEntry:; Local function
        push    rsi                                     ; 081E _ 56
        push    rbx                                     ; 081F _ 53
        sub     rsp, 40                                 ; 0820 _ 48: 83. EC, 28
        mov     rsi, qword [rcx+10H]                    ; 0824 _ 48: 8B. 71, 10
        mov     rbx, rcx                                ; 0828 _ 48: 89. CB
        mov     rcx, qword [rcx]                        ; 082B _ 48: 8B. 09
        test    rcx, rcx                                ; 082E _ 48: 85. C9
        jz      ?_103                                   ; 0831 _ 74, 0F
        call    near [rel __imp_UnmapViewOfFile]        ; 0833 _ FF. 15, 00000000(rel)
        mov     rcx, rsi                                ; 0839 _ 48: 89. F1
        call    near [rel __imp_CloseHandle]            ; 083C _ FF. 15, 00000000(rel)
?_103:  xor     esi, esi                                ; 0842 _ 31. F6
        cmp     byte [rbx+1BH], 0                       ; 0844 _ 80. 7B, 1B, 00
        jnz     ?_104                                   ; 0848 _ 75, 0B
        mov     rcx, qword [rbx+20H]                    ; 084A _ 48: 8B. 4B, 20
        call    free                                    ; 084E _ E8, 00000000(rel)
        jmp     ?_105                                   ; 0853 _ EB, 17

?_104:  mov     rcx, qword [rbx+rsi+20H]                ; 0855 _ 48: 8B. 4C 33, 20
        add     rsi, 48                                 ; 085A _ 48: 83. C6, 30
        call    free                                    ; 085E _ E8, 00000000(rel)
        cmp     rsi, 192                                ; 0863 _ 48: 81. FE, 000000C0
        jnz     ?_104                                   ; 086A _ 75, E9
?_105:  mov     rcx, rbx                                ; 086C _ 48: 89. D9
        add     rsp, 40                                 ; 086F _ 48: 83. C4, 28
        pop     rbx                                     ; 0873 _ 5B
        pop     rsi                                     ; 0874 _ 5E
        jmp     free                                    ; 0875 _ E9, 00000000(rel)

_ZL7open_tbPKcS0_:; Local function
        push    r13                                     ; 087A _ 41: 55
        push    r12                                     ; 087C _ 41: 54
        push    rbp                                     ; 087E _ 55
        push    rdi                                     ; 087F _ 57
        push    rsi                                     ; 0880 _ 56
        push    rbx                                     ; 0881 _ 53
        sub     rsp, 328                                ; 0882 _ 48: 81. EC, 00000148
        xor     r13d, r13d                              ; 0889 _ 45: 31. ED
        or      rsi, 0FFFFFFFFFFFFFFFFH                 ; 088C _ 48: 83. CE, FF
        lea     rbx, [rsp+40H]                          ; 0890 _ 48: 8D. 5C 24, 40
        mov     r12, rcx                                ; 0895 _ 49: 89. CC
        mov     rbp, rdx                                ; 0898 _ 48: 89. D5
?_106:  cmp     dword [rel _ZL9num_paths], r13d         ; 089B _ 44: 39. 2D, 000344E8(rel)
        jle     ?_107                                   ; 08A2 _ 7E, 7E
        mov     rax, qword [rel _ZL5paths]              ; 08A4 _ 48: 8B. 05, 000344D8(rel)
        mov     rcx, rbx                                ; 08AB _ 48: 89. D9
        mov     rdi, rbx                                ; 08AE _ 48: 89. DF
        mov     rdx, qword [rax+r13*8]                  ; 08B1 _ 4A: 8B. 14 E8
        inc     r13                                     ; 08B5 _ 49: FF. C5
        call    strcpy                                  ; 08B8 _ E8, 00000000(rel)
        xor     eax, eax                                ; 08BD _ 31. C0
        mov     rcx, rsi                                ; 08BF _ 48: 89. F1
        repne scasb                                     ; 08C2 _ F2: AE
        mov     rdx, rcx                                ; 08C4 _ 48: 89. CA
        not     rdx                                     ; 08C7 _ 48: F7. D2
        lea     rcx, [rbx+rdx]                          ; 08CA _ 48: 8D. 0C 13
        mov     byte [rbx+rdx-1H], 47                   ; 08CE _ C6. 44 13, FF, 2F
        mov     rdx, r12                                ; 08D3 _ 4C: 89. E2
        call    strcpy                                  ; 08D6 _ E8, 00000000(rel)
        mov     rdx, rbp                                ; 08DB _ 48: 89. EA
        mov     rcx, rbx                                ; 08DE _ 48: 89. D9
        call    strcat                                  ; 08E1 _ E8, 00000000(rel)
        xor     r9d, r9d                                ; 08E6 _ 45: 31. C9
        mov     edx, 2147483648                         ; 08E9 _ BA, 80000000
        mov     rcx, rbx                                ; 08EE _ 48: 89. D9
        mov     qword [rsp+30H], 0                      ; 08F1 _ 48: C7. 44 24, 30, 00000000
        mov     r8d, 1                                  ; 08FA _ 41: B8, 00000001
        mov     dword [rsp+28H], 128                    ; 0900 _ C7. 44 24, 28, 00000080
        mov     dword [rsp+20H], 3                      ; 0908 _ C7. 44 24, 20, 00000003
        call    near [rel __imp_CreateFileA]            ; 0910 _ FF. 15, 00000000(rel)
        cmp     rax, -1                                 ; 0916 _ 48: 83. F8, FF
        je      ?_106                                   ; 091A _ 0F 84, FFFFFF7B
        jmp     ?_108                                   ; 0920 _ EB, 04

?_107:  or      rax, 0FFFFFFFFFFFFFFFFH                 ; 0922 _ 48: 83. C8, FF
?_108:  add     rsp, 328                                ; 0926 _ 48: 81. C4, 00000148
        pop     rbx                                     ; 092D _ 5B
        pop     rsi                                     ; 092E _ 5E
        pop     rdi                                     ; 092F _ 5F
        pop     rbp                                     ; 0930 _ 5D
        pop     r12                                     ; 0931 _ 41: 5C
        pop     r13                                     ; 0933 _ 41: 5D
        ret                                             ; 0935 _ C3

_ZL11add_to_hashP7TBEntryy:; Local function
        push    rbx                                     ; 0936 _ 53
        sub     rsp, 32                                 ; 0937 _ 48: 83. EC, 20
        lea     rax, [rel _ZL7TB_hash]                  ; 093B _ 48: 8D. 05, 00000DC0(rel)
        xor     r9d, r9d                                ; 0942 _ 45: 31. C9
        mov     r10, rax                                ; 0945 _ 49: 89. C2
        mov     r11, rdx                                ; 0948 _ 49: 89. D3
        shr     r11, 54                                 ; 094B _ 49: C1. EB, 36
        imul    rbx, r11, 80                            ; 094F _ 49: 6B. DB, 50
        add     rbx, rax                                ; 0953 _ 48: 01. C3
?_109:  mov     rax, r9                                 ; 0956 _ 4C: 89. C8
        movsxd  r8, r9d                                 ; 0959 _ 4D: 63. C1
        shl     rax, 4                                  ; 095C _ 48: C1. E0, 04
        cmp     qword [rbx+rax+8H], 0                   ; 0960 _ 48: 83. 7C 03, 08, 00
        jz      ?_110                                   ; 0966 _ 74, 1F
        inc     r9                                      ; 0968 _ 49: FF. C1
        cmp     r9, 5                                   ; 096B _ 49: 83. F9, 05
        jnz     ?_109                                   ; 096F _ 75, E5
        lea     rcx, [rel ?_494]                        ; 0971 _ 48: 8D. 0D, 000000B7(rel)
        call    _ZL6printfPKcz                          ; 0978 _ E8, 00000025
        mov     ecx, 1                                  ; 097D _ B9, 00000001
        call    exit                                    ; 0982 _ E8, 00000000(rel)
?_110:  lea     rbx, [r11+r11*4]                        ; 0987 _ 4B: 8D. 1C 9B
        add     rbx, r8                                 ; 098B _ 4C: 01. C3
        shl     rbx, 4                                  ; 098E _ 48: C1. E3, 04
        add     rbx, r10                                ; 0992 _ 4C: 01. D3
        mov     qword [rbx], rdx                        ; 0995 _ 48: 89. 13
        mov     qword [rbx+8H], rcx                     ; 0998 _ 48: 89. 4B, 08
        add     rsp, 32                                 ; 099C _ 48: 83. C4, 20
        pop     rbx                                     ; 09A0 _ 5B
        ret                                             ; 09A1 _ C3

_ZL6printfPKcz:; Local function
        sub     rsp, 56                                 ; 09A2 _ 48: 83. EC, 38
        mov     qword [rsp+48H], rdx                    ; 09A6 _ 48: 89. 54 24, 48
        lea     rdx, [rsp+48H]                          ; 09AB _ 48: 8D. 54 24, 48
        mov     qword [rsp+50H], r8                     ; 09B0 _ 4C: 89. 44 24, 50
        mov     qword [rsp+58H], r9                     ; 09B5 _ 4C: 89. 4C 24, 58
        mov     qword [rsp+28H], rdx                    ; 09BA _ 48: 89. 54 24, 28
        call    __mingw_vprintf                         ; 09BF _ E8, 00000000(rel)
        add     rsp, 56                                 ; 09C4 _ 48: 83. C4, 38
        ret                                             ; 09C8 _ C3

_ZL11setup_pairsPhyPyPS_S_i:; Local function
        push    r15                                     ; 09C9 _ 41: 57
        mov     eax, 4184                               ; 09CB _ B8, 00001058
        push    r14                                     ; 09D0 _ 41: 56
        push    r13                                     ; 09D2 _ 41: 55
        push    r12                                     ; 09D4 _ 41: 54
        push    rbp                                     ; 09D6 _ 55
        push    rdi                                     ; 09D7 _ 57
        push    rsi                                     ; 09D8 _ 56
        push    rbx                                     ; 09D9 _ 53
        call    ___chkstk_ms                            ; 09DA _ E8, 00000000(rel)
        sub     rsp, rax                                ; 09DF _ 48: 29. C4
        mov     rsi, rcx                                ; 09E2 _ 48: 89. CE
        mov     qword [rsp+10A8H], rdx                  ; 09E5 _ 48: 89. 94 24, 000010A8
        mov     dl, byte [rcx]                          ; 09ED _ 8A. 11
        mov     rcx, qword [rsp+10C0H]                  ; 09EF _ 48: 8B. 8C 24, 000010C0
        mov     qword [rsp+10B8H], r9                   ; 09F7 _ 4C: 89. 8C 24, 000010B8
        mov     byte [rcx], dl                          ; 09FF _ 88. 11
        cmp     byte [rsi], 0                           ; 0A01 _ 80. 3E, 00
        jns     ?_112                                   ; 0A04 _ 79, 5D
        mov     ecx, 72                                 ; 0A06 _ B9, 00000048
        mov     qword [rsp+28H], r8                     ; 0A0B _ 4C: 89. 44 24, 28
        xor     r12d, r12d                              ; 0A10 _ 45: 31. E4
        call    malloc                                  ; 0A13 _ E8, 00000000(rel)
        cmp     dword [rsp+10C8H], 0                    ; 0A18 _ 83. BC 24, 000010C8, 00
        mov     dword [rax+34H], 0                      ; 0A20 _ C7. 40, 34, 00000000
        mov     rbx, qword [rsp+28H]                    ; 0A27 _ 48: 8B. 5C 24, 28
        jz      ?_111                                   ; 0A2C _ 74, 05
        movzx   r12d, byte [rsi+1H]                     ; 0A2E _ 44: 0F B6. 66, 01
?_111:  mov     rbp, qword [rsp+10B8H]                  ; 0A33 _ 48: 8B. AC 24, 000010B8
        add     rsi, 2                                  ; 0A3B _ 48: 83. C6, 02
        mov     dword [rax+38H], r12d                   ; 0A3F _ 44: 89. 60, 38
        mov     qword [rbp], rsi                        ; 0A43 _ 48: 89. 75, 00
        mov     qword [rbx+10H], 0                      ; 0A47 _ 48: C7. 43, 10, 00000000
        mov     qword [rbx+8H], 0                       ; 0A4F _ 48: C7. 43, 08, 00000000
        mov     qword [rbx], 0                          ; 0A57 _ 48: C7. 03, 00000000
        jmp     ?_122                                   ; 0A5E _ E9, 000001FD

?_112:  movzx   edi, byte [rsi+5H]                      ; 0A63 _ 0F B6. 7E, 05
        mov     qword [rsp+48H], r8                     ; 0A67 _ 4C: 89. 44 24, 48
        movzx   r8d, byte [rsi+6H]                      ; 0A6C _ 44: 0F B6. 46, 06
        movzx   r9d, byte [rsi+4H]                      ; 0A71 _ 44: 0F B6. 4E, 04
        movzx   r11d, byte [rsi+7H]                     ; 0A76 _ 44: 0F B6. 5E, 07
        movzx   r13d, byte [rsi+3H]                     ; 0A7B _ 44: 0F B6. 6E, 03
        shl     edi, 8                                  ; 0A80 _ C1. E7, 08
        shl     r8d, 16                                 ; 0A83 _ 41: C1. E0, 10
        movzx   r12d, byte [rsi+8H]                     ; 0A87 _ 44: 0F B6. 66, 08
        or      r8d, edi                                ; 0A8C _ 41: 09. F8
        movzx   r10d, byte [rsi+1H]                     ; 0A8F _ 44: 0F B6. 56, 01
        or      r8d, r9d                                ; 0A94 _ 45: 09. C8
        shl     r11d, 24                                ; 0A97 _ 41: C1. E3, 18
        movzx   ebx, byte [rsi+2H]                      ; 0A9B _ 0F B6. 5E, 02
        or      r8d, r11d                               ; 0A9F _ 45: 09. D8
        add     r13d, r8d                               ; 0AA2 _ 45: 01. C5
        mov     dword [rsp+3CH], r8d                    ; 0AA5 _ 44: 89. 44 24, 3C
        mov     dword [rsp+28H], r13d                   ; 0AAA _ 44: 89. 6C 24, 28
        movzx   r13d, byte [rsi+9H]                     ; 0AAF _ 44: 0F B6. 6E, 09
        mov     dword [rsp+44H], r10d                   ; 0AB4 _ 44: 89. 54 24, 44
        mov     dword [rsp+40H], ebx                    ; 0AB9 _ 89. 5C 24, 40
        sub     r12d, r13d                              ; 0ABD _ 45: 29. EC
        lea     ebp, [r12+r12+0CH]                      ; 0AC0 _ 43: 8D. 6C 24, 0C
        movsxd  r14, ebp                                ; 0AC5 _ 4C: 63. F5
        add     r14, rsi                                ; 0AC8 _ 49: 01. F6
        movzx   edi, byte [r14+1H]                      ; 0ACB _ 41: 0F B6. 7E, 01
        movzx   r15d, byte [r14]                        ; 0AD0 _ 45: 0F B6. 3E
        shl     edi, 8                                  ; 0AD4 _ C1. E7, 08
        or      edi, r15d                               ; 0AD7 _ 44: 09. FF
        movsxd  r15, r12d                               ; 0ADA _ 4D: 63. FC
        lea     rax, [r15*8+48H]                        ; 0ADD _ 4A: 8D. 04 FD, 00000048
        movzx   ecx, di                                 ; 0AE5 _ 0F B7. CF
        movzx   r14d, di                                ; 0AE8 _ 44: 0F B7. F7
        add     rcx, rax                                ; 0AEC _ 48: 01. C1
        mov     qword [rsp+30H], rax                    ; 0AEF _ 48: 89. 44 24, 30
        and     edi, 01H                                ; 0AF4 _ 83. E7, 01
        call    malloc                                  ; 0AF7 _ E8, 00000000(rel)
        mov     r8, qword [rsp+30H]                     ; 0AFC _ 4C: 8B. 44 24, 30
        lea     r9d, [rbp+2H]                           ; 0B01 _ 44: 8D. 4D, 02
        mov     edx, dword [rsp+40H]                    ; 0B05 _ 8B. 54 24, 40
        movsxd  rbp, r9d                                ; 0B09 _ 49: 63. E9
        mov     rbx, rax                                ; 0B0C _ 48: 89. C3
        mov     dword [rax+38H], r13d                   ; 0B0F _ 44: 89. 68, 38
        mov     r10d, dword [rsp+44H]                   ; 0B13 _ 44: 8B. 54 24, 44
        lea     rcx, [rsi+0AH]                          ; 0B18 _ 48: 8D. 4E, 0A
        lea     r11, [rsi+rbp]                          ; 0B1C _ 4C: 8D. 1C 2E
        mov     qword [rax+18H], rcx                    ; 0B20 _ 48: 89. 48, 18
        add     r8, rax                                 ; 0B24 _ 49: 01. C0
        mov     qword [rax+28H], r11                    ; 0B27 _ 4C: 89. 58, 28
        mov     dword [rax+34H], edx                    ; 0B2B _ 89. 50, 34
        mov     dword [rax+30H], r10d                   ; 0B2E _ 44: 89. 50, 30
        mov     qword [rax+20H], r8                     ; 0B32 _ 4C: 89. 40, 20
        lea     eax, [r14+r14*2]                        ; 0B36 _ 43: 8D. 04 76
        mov     r8, qword [rsp+10A8H]                   ; 0B3A _ 4C: 8B. 84 24, 000010A8
        add     eax, r9d                                ; 0B42 _ 44: 01. C8
        add     eax, edi                                ; 0B45 _ 01. F8
        mov     rdi, qword [rsp+10B8H]                  ; 0B47 _ 48: 8B. BC 24, 000010B8
        cdqe                                            ; 0B4F _ 48: 98
        add     rsi, rax                                ; 0B51 _ 48: 01. C6
        movsxd  rax, dword [rsp+28H]                    ; 0B54 _ 48: 63. 44 24, 28
        mov     qword [rdi], rsi                        ; 0B59 _ 48: 89. 37
        mov     esi, 1                                  ; 0B5C _ BE, 00000001
        mov     rdi, qword [rsp+48H]                    ; 0B61 _ 48: 8B. 7C 24, 48
        shlx    rcx, rsi, rdx                           ; 0B66 _ C4 E2 E9: F7. CE
        lea     r9, [r8+rcx-1H]                         ; 0B6B _ 4D: 8D. 4C 08, FF
        movsxd  rsi, dword [rsp+3CH]                    ; 0B70 _ 48: 63. 74 24, 3C
        shrx    rdx, r9, rdx                            ; 0B75 _ C4 C2 EB: F7. D1
        imul    r11, rdx, 6                             ; 0B7A _ 4C: 6B. DA, 06
        add     rax, rax                                ; 0B7E _ 48: 01. C0
        xor     r9d, r9d                                ; 0B81 _ 45: 31. C9
        mov     qword [rdi+8H], rax                     ; 0B84 _ 48: 89. 47, 08
        shlx    r10, rsi, r10                           ; 0B88 _ C4 62 A9: F7. D6
        mov     qword [rdi+10H], r10                    ; 0B8D _ 4C: 89. 57, 10
        mov     qword [rdi], r11                        ; 0B91 _ 4C: 89. 1F
?_113:  cmp     r14d, r9d                               ; 0B94 _ 45: 39. CE
        jle     ?_114                                   ; 0B97 _ 7E, 0B
        mov     byte [rsp+r9+50H], 0                    ; 0B99 _ 42: C6. 44 0C, 50, 00
        inc     r9                                      ; 0B9F _ 49: FF. C1
        jmp     ?_113                                   ; 0BA2 _ EB, F0

?_114:  lea     rdi, [rsp+50H]                          ; 0BA4 _ 48: 8D. 7C 24, 50
        xor     esi, esi                                ; 0BA9 _ 31. F6
?_115:  cmp     esi, r14d                               ; 0BAB _ 44: 39. F6
        jge     ?_117                                   ; 0BAE _ 7D, 18
        cmp     byte [rsi+rdi], 0                       ; 0BB0 _ 80. 3C 3E, 00
        jnz     ?_116                                   ; 0BB4 _ 75, 0D
        mov     r8, rdi                                 ; 0BB6 _ 49: 89. F8
        mov     edx, esi                                ; 0BB9 _ 89. F2
        mov     rcx, rbx                                ; 0BBB _ 48: 89. D9
        call    _ZL11calc_symlenP9PairsDataiPc          ; 0BBE _ E8, 00000140
?_116:  inc     rsi                                     ; 0BC3 _ 48: FF. C6
        jmp     ?_115                                   ; 0BC6 _ EB, E3

?_117:  mov     qword [rbx+r15*8+40H], 0                ; 0BC8 _ 4A: C7. 44 FB, 40, 00000000
        lea     r14d, [r12-1H]                          ; 0BD1 _ 45: 8D. 74 24, FF
        sub     rbp, 16                                 ; 0BD6 _ 48: 83. ED, 10
?_118:  test    r14d, r14d                              ; 0BDA _ 45: 85. F6
        js      ?_119                                   ; 0BDD _ 78, 57
        mov     r15, qword [rbx+18H]                    ; 0BDF _ 4C: 8B. 7B, 18
        lea     edi, [r14+1H]                           ; 0BE3 _ 41: 8D. 7E, 01
        movsxd  rax, edi                                ; 0BE7 _ 48: 63. C7
        lea     r8, [r15+rbp]                           ; 0BEA _ 4D: 8D. 04 2F
        movzx   r9d, byte [r8+1H]                       ; 0BEE _ 45: 0F B6. 48, 01
        lea     rsi, [r15+rbp+2H]                       ; 0BF3 _ 49: 8D. 74 2F, 02
        movsxd  r15, r14d                               ; 0BF8 _ 4D: 63. FE
        sub     rbp, 2                                  ; 0BFB _ 48: 83. ED, 02
        movzx   edx, byte [r8]                          ; 0BFF _ 41: 0F B6. 10
        dec     r14d                                    ; 0C03 _ 41: FF. CE
        movzx   r10d, byte [rsi+1H]                     ; 0C06 _ 44: 0F B6. 56, 01
        movzx   ecx, byte [rsi]                         ; 0C0B _ 0F B6. 0E
        shl     r9d, 8                                  ; 0C0E _ 41: C1. E1, 08
        or      r9d, edx                                ; 0C12 _ 41: 09. D1
        movzx   r11d, r9w                               ; 0C15 _ 45: 0F B7. D9
        add     r11, qword [rbx+rax*8+40H]              ; 0C19 _ 4C: 03. 5C C3, 40
        shl     r10d, 8                                 ; 0C1E _ 41: C1. E2, 08
        or      r10d, ecx                               ; 0C22 _ 41: 09. CA
        movzx   r8d, r10w                               ; 0C25 _ 45: 0F B7. C2
        sub     r11, r8                                 ; 0C29 _ 4D: 29. C3
        shr     r11, 1                                  ; 0C2C _ 49: D1. EB
        mov     qword [rbx+r15*8+40H], r11              ; 0C2F _ 4E: 89. 5C FB, 40
        jmp     ?_118                                   ; 0C34 _ EB, A4

?_119:  mov     ecx, 64                                 ; 0C36 _ B9, 00000040
        sub     ecx, r13d                               ; 0C3B _ 44: 29. E9
        xor     r13d, r13d                              ; 0C3E _ 45: 31. ED
?_120:  cmp     r12d, r13d                              ; 0C41 _ 45: 39. EC
        jl      ?_121                                   ; 0C44 _ 7C, 0C
        shl     qword [rbx+r13*8+40H], cl               ; 0C46 _ 4A: D3. 64 EB, 40
        inc     r13                                     ; 0C4B _ 49: FF. C5
        dec     ecx                                     ; 0C4E _ FF. C9
        jmp     ?_120                                   ; 0C50 _ EB, EF

?_121:  movsxd  r12, dword [rbx+38H]                    ; 0C52 _ 4C: 63. 63, 38
        mov     rax, rbx                                ; 0C56 _ 48: 89. D8
        add     r12, r12                                ; 0C59 _ 4D: 01. E4
        sub     qword [rbx+18H], r12                    ; 0C5C _ 4C: 29. 63, 18
?_122:  add     rsp, 4184                               ; 0C60 _ 48: 81. C4, 00001058
        pop     rbx                                     ; 0C67 _ 5B
        pop     rsi                                     ; 0C68 _ 5E
        pop     rdi                                     ; 0C69 _ 5F
        pop     rbp                                     ; 0C6A _ 5D
        pop     r12                                     ; 0C6B _ 41: 5C
        pop     r13                                     ; 0C6D _ 41: 5D
        pop     r14                                     ; 0C6F _ 41: 5E
        pop     r15                                     ; 0C71 _ 41: 5F
        ret                                             ; 0C73 _ C3

_ZL17calc_key_from_pcsPii:; Local function
        push    rsi                                     ; 0C74 _ 56
        push    rbx                                     ; 0C75 _ 53
        mov     r11, qword [rel .refptr._ZN7Zobrist3psqE]; 0C76 _ 4C: 8B. 1D, 00000000(rel)
        cmp     edx, 1                                  ; 0C7D _ 83. FA, 01
        sbb     edx, edx                                ; 0C80 _ 19. D2
        xor     r8d, r8d                                ; 0C82 _ 45: 31. C0
        xor     eax, eax                                ; 0C85 _ 31. C0
        not     edx                                     ; 0C87 _ F7. D2
        and     edx, 08H                                ; 0C89 _ 83. E2, 08
        lea     r10d, [rdx+1H]                          ; 0C8C _ 44: 8D. 52, 01
?_123:  mov     r9d, r10d                               ; 0C90 _ 45: 89. D1
        add     r8, 512                                 ; 0C93 _ 49: 81. C0, 00000200
        mov     esi, dword [rcx+r9*4]                   ; 0C9A _ 42: 8B. 34 89
        lea     rbx, [r11+r8]                           ; 0C9E _ 4B: 8D. 1C 03
        xor     r9d, r9d                                ; 0CA2 _ 45: 31. C9
?_124:  cmp     esi, r9d                                ; 0CA5 _ 44: 39. CE
        jle     ?_125                                   ; 0CA8 _ 7E, 09
        xor     rax, qword [rbx+r9*8]                   ; 0CAA _ 4A: 33. 04 CB
        inc     r9                                      ; 0CAE _ 49: FF. C1
        jmp     ?_124                                   ; 0CB1 _ EB, F2

?_125:  ; Local function
        inc     r10d                                    ; 0CB3 _ 41: FF. C2
        cmp     r8, 3072                                ; 0CB6 _ 49: 81. F8, 00000C00
        jnz     ?_123                                   ; 0CBD _ 75, D1
        mov     r10, qword [rel .refptr._ZN7Zobrist3psqE]; 0CBF _ 4C: 8B. 15, 00000000(rel)
        xor     edx, 08H                                ; 0CC6 _ 83. F2, 08
        xor     r8d, r8d                                ; 0CC9 _ 45: 31. C0
        inc     edx                                     ; 0CCC _ FF. C2
?_126:  mov     r11d, edx                               ; 0CCE _ 41: 89. D3
        add     r8, 512                                 ; 0CD1 _ 49: 81. C0, 00000200
        xor     r9d, r9d                                ; 0CD8 _ 45: 31. C9
        mov     esi, dword [rcx+r11*4]                  ; 0CDB _ 42: 8B. 34 99
        lea     rbx, [r10+r8]                           ; 0CDF _ 4B: 8D. 1C 02
?_127:  cmp     esi, r9d                                ; 0CE3 _ 44: 39. CE
        jle     ?_128                                   ; 0CE6 _ 7E, 0D
        xor     rax, qword [rbx+r9*8+1000H]             ; 0CE8 _ 4A: 33. 84 CB, 00001000
        inc     r9                                      ; 0CF0 _ 49: FF. C1
        jmp     ?_127                                   ; 0CF3 _ EB, EE

?_128:  ; Local function
        inc     edx                                     ; 0CF5 _ FF. C2
        cmp     r8, 3072                                ; 0CF7 _ 49: 81. F8, 00000C00
        jnz     ?_126                                   ; 0CFE _ 75, CE
        pop     rbx                                     ; 0D00 _ 5B
        pop     rsi                                     ; 0D01 _ 5E
        ret                                             ; 0D02 _ C3

_ZL11calc_symlenP9PairsDataiPc:; Local function
        push    r13                                     ; 0D03 _ 41: 55
        push    r12                                     ; 0D05 _ 41: 54
        push    rbp                                     ; 0D07 _ 55
        push    rdi                                     ; 0D08 _ 57
        push    rsi                                     ; 0D09 _ 56
        push    rbx                                     ; 0D0A _ 53
        sub     rsp, 40                                 ; 0D0B _ 48: 83. EC, 28
        lea     eax, [rdx+rdx*2]                        ; 0D0F _ 8D. 04 52
        mov     rbp, rcx                                ; 0D12 _ 48: 89. CD
        mov     rdi, r8                                 ; 0D15 _ 4C: 89. C7
        cdqe                                            ; 0D18 _ 48: 98
        add     rax, qword [rcx+28H]                    ; 0D1A _ 48: 03. 41, 28
        movsxd  rsi, edx                                ; 0D1E _ 48: 63. F2
        movzx   ebx, byte [rax+1H]                      ; 0D21 _ 0F B6. 58, 01
        mov     ecx, ebx                                ; 0D25 _ 89. D9
        mov     r9d, ebx                                ; 0D27 _ 41: 89. D9
        movzx   ebx, byte [rax+2H]                      ; 0D2A _ 0F B6. 58, 02
        sar     ecx, 4                                  ; 0D2E _ C1. F9, 04
        shl     ebx, 4                                  ; 0D31 _ C1. E3, 04
        or      ebx, ecx                                ; 0D34 _ 09. CB
        cmp     ebx, 4095                               ; 0D36 _ 81. FB, 00000FFF
        jnz     ?_129                                   ; 0D3C _ 75, 0B
        mov     rbp, qword [rbp+20H]                    ; 0D3E _ 48: 8B. 6D, 20
        mov     byte [rbp+rsi], 0                       ; 0D42 _ C6. 44 35, 00, 00
        jmp     ?_132                                   ; 0D47 _ EB, 4C

?_129:  movzx   edx, byte [rax]                         ; 0D49 _ 0F B6. 10
        and     r9d, 0FH                                ; 0D4C _ 41: 83. E1, 0F
        shl     r9d, 8                                  ; 0D50 _ 41: C1. E1, 08
        or      edx, r9d                                ; 0D54 _ 44: 09. CA
        movsxd  r12, edx                                ; 0D57 _ 4C: 63. E2
        cmp     byte [r8+r12], 0                        ; 0D5A _ 43: 80. 3C 20, 00
        jnz     ?_130                                   ; 0D5F _ 75, 08
        mov     rcx, rbp                                ; 0D61 _ 48: 89. E9
        call    _ZL11calc_symlenP9PairsDataiPc          ; 0D64 _ E8, FFFFFF9A
?_130:  movsxd  r13, ebx                                ; 0D69 _ 4C: 63. EB
        cmp     byte [rdi+r13], 0                       ; 0D6C _ 42: 80. 3C 2F, 00
        jnz     ?_131                                   ; 0D71 _ 75, 0D
        mov     r8, rdi                                 ; 0D73 _ 49: 89. F8
        mov     edx, ebx                                ; 0D76 _ 89. DA
        mov     rcx, rbp                                ; 0D78 _ 48: 89. E9
        call    _ZL11calc_symlenP9PairsDataiPc          ; 0D7B _ E8, FFFFFF83
?_131:  mov     r8, qword [rbp+20H]                     ; 0D80 _ 4C: 8B. 45, 20
        mov     dl, byte [r8+r13]                       ; 0D84 _ 43: 8A. 14 28
        mov     r10b, byte [r8+r12]                     ; 0D88 _ 47: 8A. 14 20
        lea     r11d, [rdx+r10+1H]                      ; 0D8C _ 46: 8D. 5C 12, 01
        mov     byte [r8+rsi], r11b                     ; 0D91 _ 45: 88. 1C 30
?_132:  mov     byte [rdi+rsi], 1                       ; 0D95 _ C6. 04 37, 01
        add     rsp, 40                                 ; 0D99 _ 48: 83. C4, 28
        pop     rbx                                     ; 0D9D _ 5B
        pop     rsi                                     ; 0D9E _ 5E
        pop     rdi                                     ; 0D9F _ 5F
        pop     rbp                                     ; 0DA0 _ 5D
        pop     r12                                     ; 0DA1 _ 41: 5C
        pop     r13                                     ; 0DA3 _ 41: 5D
        ret                                             ; 0DA5 _ C3

_ZL13set_norm_pawnP12TBEntry_pawnPhS1_:; Local function
        push    rdi                                     ; 0DA6 _ 57
        push    rsi                                     ; 0DA7 _ 56
        push    rbx                                     ; 0DA8 _ 53
        xor     eax, eax                                ; 0DA9 _ 31. C0
?_133:  movzx   r9d, byte [rcx+19H]                     ; 0DAB _ 44: 0F B6. 49, 19
        cmp     r9d, eax                                ; 0DB0 _ 41: 39. C1
        jle     ?_134                                   ; 0DB3 _ 7E, 09
        mov     byte [rdx+rax], 0                       ; 0DB5 _ C6. 04 02, 00
        inc     rax                                     ; 0DB9 _ 48: FF. C0
        jmp     ?_133                                   ; 0DBC _ EB, ED

?_134:  ; Local function
        mov     al, byte [rcx+1CH]                      ; 0DBE _ 8A. 41, 1C
        mov     byte [rdx], al                          ; 0DC1 _ 88. 02
        mov     bl, byte [rcx+1DH]                      ; 0DC3 _ 8A. 59, 1D
        test    bl, bl                                  ; 0DC6 _ 84. DB
        jz      ?_135                                   ; 0DC8 _ 74, 07
        movzx   esi, byte [rcx+1CH]                     ; 0DCA _ 0F B6. 71, 1C
        mov     byte [rdx+rsi], bl                      ; 0DCE _ 88. 1C 32
?_135:  movzx   edi, byte [rcx+1CH]                     ; 0DD1 _ 0F B6. 79, 1C
        movzx   eax, byte [rcx+1DH]                     ; 0DD5 _ 0F B6. 41, 1D
        add     eax, edi                                ; 0DD9 _ 01. F8
?_136:  movzx   r10d, byte [rcx+19H]                    ; 0DDB _ 44: 0F B6. 51, 19
        cmp     r10d, eax                               ; 0DE0 _ 41: 39. C2
        jle     ?_139                                   ; 0DE3 _ 7E, 35
        movsxd  r10, eax                                ; 0DE5 _ 4C: 63. D0
        xor     r9d, r9d                                ; 0DE8 _ 45: 31. C9
        lea     rbx, [r8+r10]                           ; 0DEB _ 4B: 8D. 1C 10
        lea     r11, [rdx+r10]                          ; 0DEF _ 4E: 8D. 1C 12
?_137:  movzx   edi, byte [rcx+19H]                     ; 0DF3 _ 0F B6. 79, 19
        lea     esi, [rax+r9]                           ; 0DF7 _ 42: 8D. 34 08
        cmp     edi, esi                                ; 0DFB _ 39. F7
        jle     ?_138                                   ; 0DFD _ 7E, 11
        mov     dil, byte [rbx+r9]                      ; 0DFF _ 42: 8A. 3C 0B
        inc     r9                                      ; 0E03 _ 49: FF. C1
        cmp     dil, byte [rbx]                         ; 0E06 _ 40: 3A. 3B
        jnz     ?_138                                   ; 0E09 _ 75, 05
        inc     byte [r11]                              ; 0E0B _ 41: FE. 03
        jmp     ?_137                                   ; 0E0E _ EB, E3

?_138:  movzx   r9d, byte [rdx+r10]                     ; 0E10 _ 46: 0F B6. 0C 12
        add     eax, r9d                                ; 0E15 _ 44: 01. C8
        jmp     ?_136                                   ; 0E18 _ EB, C1

?_139:  ; Local function
        pop     rbx                                     ; 0E1A _ 5B
        pop     rsi                                     ; 0E1B _ 5E
        pop     rdi                                     ; 0E1C _ 5F
        ret                                             ; 0E1D _ C3

_ZL8map_filePKcS0_Py:; Local function
        push    rbp                                     ; 0E1E _ 55
        push    rdi                                     ; 0E1F _ 57
        push    rsi                                     ; 0E20 _ 56
        push    rbx                                     ; 0E21 _ 53
        sub     rsp, 72                                 ; 0E22 _ 48: 83. EC, 48
        mov     rdi, rcx                                ; 0E26 _ 48: 89. CF
        mov     rbp, rdx                                ; 0E29 _ 48: 89. D5
        mov     rbx, r8                                 ; 0E2C _ 4C: 89. C3
        call    _ZL7open_tbPKcS0_                       ; 0E2F _ E8, FFFFFA46
        cmp     rax, -1                                 ; 0E34 _ 48: 83. F8, FF
        mov     rsi, rax                                ; 0E38 _ 48: 89. C6
        je      ?_142                                   ; 0E3B _ 0F 84, 000000A7
        lea     rdx, [rsp+3CH]                          ; 0E41 _ 48: 8D. 54 24, 3C
        mov     rcx, rax                                ; 0E46 _ 48: 89. C1
        call    near [rel __imp_GetFileSize]            ; 0E49 _ FF. 15, 00000000(rel)
        xor     edx, edx                                ; 0E4F _ 31. D2
        mov     r9d, dword [rsp+3CH]                    ; 0E51 _ 44: 8B. 4C 24, 3C
        mov     rcx, rsi                                ; 0E56 _ 48: 89. F1
        mov     qword [rsp+28H], 0                      ; 0E59 _ 48: C7. 44 24, 28, 00000000
        mov     r8d, 2                                  ; 0E62 _ 41: B8, 00000002
        mov     dword [rsp+20H], eax                    ; 0E68 _ 89. 44 24, 20
        call    near [rel __imp_CreateFileMappingA]     ; 0E6C _ FF. 15, 00000000(rel)
        test    rax, rax                                ; 0E72 _ 48: 85. C0
        jnz     ?_140                                   ; 0E75 _ 75, 16
        lea     rcx, [rel ?_495]                        ; 0E77 _ 48: 8D. 0D, 000000C8(rel)
        call    _ZL6printfPKcz                          ; 0E7E _ E8, FFFFFB1F
        mov     ecx, 1                                  ; 0E83 _ B9, 00000001
        call    exit                                    ; 0E88 _ E8, 00000000(rel)
?_140:  mov     qword [rbx], rax                        ; 0E8D _ 48: 89. 03
        xor     r9d, r9d                                ; 0E90 _ 45: 31. C9
        xor     r8d, r8d                                ; 0E93 _ 45: 31. C0
        mov     edx, 4                                  ; 0E96 _ BA, 00000004
        mov     qword [rsp+20H], 0                      ; 0E9B _ 48: C7. 44 24, 20, 00000000
        mov     rcx, rax                                ; 0EA4 _ 48: 89. C1
        call    near [rel __imp_MapViewOfFile]          ; 0EA7 _ FF. 15, 00000000(rel)
        test    rax, rax                                ; 0EAD _ 48: 85. C0
        mov     rbx, rax                                ; 0EB0 _ 48: 89. C3
        jnz     ?_141                                   ; 0EB3 _ 75, 25
        call    near [rel __imp_GetLastError]           ; 0EB5 _ FF. 15, 00000000(rel)
        lea     rcx, [rel ?_496]                        ; 0EBB _ 48: 8D. 0D, 000000E8(rel)
        mov     r8, rbp                                 ; 0EC2 _ 49: 89. E8
        mov     rdx, rdi                                ; 0EC5 _ 48: 89. FA
        mov     r9d, eax                                ; 0EC8 _ 41: 89. C1
        call    _ZL6printfPKcz                          ; 0ECB _ E8, FFFFFAD2
        mov     ecx, 1                                  ; 0ED0 _ B9, 00000001
        call    exit                                    ; 0ED5 _ E8, 00000000(rel)
?_141:  mov     rcx, rsi                                ; 0EDA _ 48: 89. F1
        call    near [rel __imp_CloseHandle]            ; 0EDD _ FF. 15, 00000000(rel)
        mov     rax, rbx                                ; 0EE3 _ 48: 89. D8
        jmp     ?_143                                   ; 0EE6 _ EB, 02

?_142:  xor     eax, eax                                ; 0EE8 _ 31. C0
?_143:  add     rsp, 72                                 ; 0EEA _ 48: 83. C4, 48
        pop     rbx                                     ; 0EEE _ 5B
        pop     rsi                                     ; 0EEF _ 5E
        pop     rdi                                     ; 0EF0 _ 5F
        pop     rbp                                     ; 0EF1 _ 5D
        ret                                             ; 0EF2 _ C3

_ZL8calc_keyR8Positioni:; Local function
        push    rsi                                     ; 0EF3 _ 56
        push    rbx                                     ; 0EF4 _ 53
        test    edx, edx                                ; 0EF5 _ 85. D2
        setne   dl                                      ; 0EF7 _ 0F 95. C2
        xor     r9d, r9d                                ; 0EFA _ 45: 31. C9
        mov     rax, rdx                                ; 0EFD _ 48: 89. D0
        and     eax, 01H                                ; 0F00 _ 83. E0, 01
        add     rax, 40                                 ; 0F03 _ 48: 83. C0, 28
        mov     rbx, qword [rcx+rax*8]                  ; 0F07 _ 48: 8B. 1C C1
        xor     eax, eax                                ; 0F0B _ 31. C0
?_144:  lea     r10d, [r9+1H]                           ; 0F0D _ 45: 8D. 51, 01
        mov     r8, rbx                                 ; 0F11 _ 49: 89. D8
        and     r8, qword [rcx+r9*8+108H]               ; 0F14 _ 4E: 23. 84 C9, 00000108
        shl     r10, 6                                  ; 0F1C _ 49: C1. E2, 06
        popcnt  r8, r8                                  ; 0F20 _ F3 4D: 0F B8. C0
?_145:  test    r8d, r8d                                ; 0F25 _ 45: 85. C0
        jz      ?_146                                   ; 0F28 _ 74, 16
        mov     rsi, qword [rel .refptr._ZN7Zobrist3psqE]; 0F2A _ 48: 8B. 35, 00000000(rel)
        dec     r8d                                     ; 0F31 _ 41: FF. C8
        movsxd  r11, r8d                                ; 0F34 _ 4D: 63. D8
        add     r11, r10                                ; 0F37 _ 4D: 01. D3
        xor     rax, qword [rsi+r11*8]                  ; 0F3A _ 4A: 33. 04 DE
        jmp     ?_145                                   ; 0F3E _ EB, E5

?_146:  ; Local function
        inc     r9                                      ; 0F40 _ 49: FF. C1
        cmp     r9, 6                                   ; 0F43 _ 49: 83. F9, 06
        jnz     ?_144                                   ; 0F47 _ 75, C4
        xor     edx, 01H                                ; 0F49 _ 83. F2, 01
        mov     r10, qword [rel .refptr._ZN7Zobrist3psqE]; 0F4C _ 4C: 8B. 15, 00000000(rel)
        xor     r8d, r8d                                ; 0F53 _ 45: 31. C0
        and     edx, 01H                                ; 0F56 _ 83. E2, 01
        add     rdx, 40                                 ; 0F59 _ 48: 83. C2, 28
        mov     r11, qword [rcx+rdx*8]                  ; 0F5D _ 4C: 8B. 1C D1
?_147:  lea     r9d, [r8+1H]                            ; 0F61 _ 45: 8D. 48, 01
        mov     rdx, r11                                ; 0F65 _ 4C: 89. DA
        and     rdx, qword [rcx+r8*8+108H]              ; 0F68 _ 4A: 23. 94 C1, 00000108
        shl     r9, 6                                   ; 0F70 _ 49: C1. E1, 06
        popcnt  rsi, rdx                                ; 0F74 _ F3 48: 0F B8. F2
?_148:  test    esi, esi                                ; 0F79 _ 85. F6
        jz      ?_149                                   ; 0F7B _ 74, 13
        dec     esi                                     ; 0F7D _ FF. CE
        movsxd  rbx, esi                                ; 0F7F _ 48: 63. DE
        lea     rdx, [rbx+r9+200H]                      ; 0F82 _ 4A: 8D. 94 0B, 00000200
        xor     rax, qword [r10+rdx*8]                  ; 0F8A _ 49: 33. 04 D2
        jmp     ?_148                                   ; 0F8E _ EB, E9

?_149:  ; Local function
        inc     r8                                      ; 0F90 _ 49: FF. C0
        cmp     r8, 6                                   ; 0F93 _ 49: 83. F8, 06
        jnz     ?_147                                   ; 0F97 _ 75, C8
        pop     rbx                                     ; 0F99 _ 5B
        pop     rsi                                     ; 0F9A _ 5E
        ret                                             ; 0F9B _ C3

_ZL7prt_strR8PositionPci:; Local function
        push    rbx                                     ; 0F9C _ 53
        test    r8d, r8d                                ; 0F9D _ 45: 85. C0
        setne   al                                      ; 0FA0 _ 0F 95. C0
        xor     r8d, r8d                                ; 0FA3 _ 45: 31. C0
        mov     r11, rax                                ; 0FA6 _ 49: 89. C3
        and     r11d, 01H                               ; 0FA9 _ 41: 83. E3, 01
?_150:  imul    r10, r8, -8                             ; 0FAD _ 4D: 6B. D0, F8
        lea     r9, [r11+28H]                           ; 0FB1 _ 4D: 8D. 4B, 28
        mov     rbx, qword [rcx+r10+130H]               ; 0FB5 _ 4A: 8B. 9C 11, 00000130
        and     rbx, qword [rcx+r9*8]                   ; 0FBD _ 4A: 23. 1C C9
        xor     r9d, r9d                                ; 0FC1 _ 45: 31. C9
        popcnt  r10, rbx                                ; 0FC4 _ F3 4C: 0F B8. D3
?_151:  cmp     r9, r10                                 ; 0FC9 _ 4D: 39. D1
        jz      ?_152                                   ; 0FCC _ 74, 14
        lea     rbx, [rel _ZL4pchr]                     ; 0FCE _ 48: 8D. 1D, 000008B4(rel)
        mov     bl, byte [rbx+r8]                       ; 0FD5 _ 42: 8A. 1C 03
        mov     byte [rdx+r9], bl                       ; 0FD9 _ 42: 88. 1C 0A
        inc     r9                                      ; 0FDD _ 49: FF. C1
        jmp     ?_151                                   ; 0FE0 _ EB, E7

?_152:  ; Local function
        inc     r8                                      ; 0FE2 _ 49: FF. C0
        add     rdx, r9                                 ; 0FE5 _ 4C: 01. CA
        cmp     r8, 6                                   ; 0FE8 _ 49: 83. F8, 06
        jnz     ?_150                                   ; 0FEC _ 75, BF
        lea     r10, [rdx+1H]                           ; 0FEE _ 4C: 8D. 52, 01
        xor     eax, 01H                                ; 0FF2 _ 83. F0, 01
        mov     byte [rdx], 118                         ; 0FF5 _ C6. 02, 76
        xor     edx, edx                                ; 0FF8 _ 31. D2
        and     eax, 01H                                ; 0FFA _ 83. E0, 01
?_153:  imul    r11, rdx, -8                            ; 0FFD _ 4C: 6B. DA, F8
        xor     ebx, ebx                                ; 1001 _ 31. DB
        lea     r8, [rax+28H]                           ; 1003 _ 4C: 8D. 40, 28
        mov     r9, qword [rcx+r11+130H]                ; 1007 _ 4E: 8B. 8C 19, 00000130
        and     r9, qword [rcx+r8*8]                    ; 100F _ 4E: 23. 0C C1
        popcnt  r8, r9                                  ; 1013 _ F3 4D: 0F B8. C1
?_154:  cmp     rbx, r8                                 ; 1018 _ 4C: 39. C3
        jz      ?_155                                   ; 101B _ 74, 14
        lea     r11, [rel _ZL4pchr]                     ; 101D _ 4C: 8D. 1D, 000008B4(rel)
        mov     r9b, byte [r11+rdx]                     ; 1024 _ 45: 8A. 0C 13
        mov     byte [r10+rbx], r9b                     ; 1028 _ 45: 88. 0C 1A
        inc     rbx                                     ; 102C _ 48: FF. C3
        jmp     ?_154                                   ; 102F _ EB, E7

?_155:  ; Local function
        inc     rdx                                     ; 1031 _ 48: FF. C2
        add     r10, rbx                                ; 1034 _ 49: 01. DA
        cmp     rdx, 6                                  ; 1037 _ 48: 83. FA, 06
        jnz     ?_153                                   ; 103B _ 75, C0
        mov     byte [r10], 0                           ; 103D _ 41: C6. 02, 00
        pop     rbx                                     ; 1041 _ 5B
        ret                                             ; 1042 _ C3

_Z16decompress_pairsILb1EEhP9PairsDatay:; Local function
        push    r15                                     ; 1043 _ 41: 57
        push    r14                                     ; 1045 _ 41: 56
        push    r13                                     ; 1047 _ 41: 55
        push    r12                                     ; 1049 _ 41: 54
        push    rbp                                     ; 104B _ 55
        push    rdi                                     ; 104C _ 57
        push    rsi                                     ; 104D _ 56
        push    rbx                                     ; 104E _ 53
        mov     r8d, dword [rcx+34H]                    ; 104F _ 44: 8B. 41, 34
        test    r8d, r8d                                ; 1053 _ 45: 85. C0
        jnz     ?_156                                   ; 1056 _ 75, 08
        mov     al, byte [rcx+38H]                      ; 1058 _ 8A. 41, 38
        jmp     ?_166                                   ; 105B _ E9, 00000170

?_156:  mov     rsi, qword [rcx]                        ; 1060 _ 48: 8B. 31
        lea     r10d, [r8-1H]                           ; 1063 _ 45: 8D. 50, FF
        mov     eax, 1                                  ; 1067 _ B8, 00000001
        shlx    r9, rax, r8                             ; 106C _ C4 62 B9: F7. C8
        dec     r9d                                     ; 1071 _ 41: FF. C9
        shlx    rbx, rax, r10                           ; 1074 _ C4 E2 A9: F7. D8
        mov     r13, qword [rcx+8H]                     ; 1079 _ 4C: 8B. 69, 08
        and     r9d, edx                                ; 107D _ 41: 21. D1
        shrx    rdx, rdx, r8                            ; 1080 _ C4 E2 BB: F7. D2
        imul    edi, edx, 6                             ; 1085 _ 6B. FA, 06
        sub     r9d, ebx                                ; 1088 _ 41: 29. D9
        movzx   edx, word [rsi+rdi+4H]                  ; 108B _ 0F B7. 54 3E, 04
        mov     r12d, dword [rsi+rdi]                   ; 1090 _ 44: 8B. 24 3E
        add     edx, r9d                                ; 1094 _ 44: 01. CA
        jns     ?_158                                   ; 1097 _ 79, 19
?_157:  lea     r14d, [r12-1H]                          ; 1099 _ 45: 8D. 74 24, FF
        movzx   r15d, word [r13+r14*2]                  ; 109E _ 47: 0F B7. 7C 75, 00
        mov     r12, r14                                ; 10A4 _ 4D: 89. F4
        lea     edx, [rdx+r15+1H]                       ; 10A7 _ 42: 8D. 54 3A, 01
        test    edx, edx                                ; 10AC _ 85. D2
        js      ?_157                                   ; 10AE _ 78, E9
        jmp     ?_159                                   ; 10B0 _ EB, 19

?_158:  mov     ebp, r12d                               ; 10B2 _ 44: 89. E5
        movzx   r11d, word [r13+rbp*2]                  ; 10B5 _ 45: 0F B7. 5C 6D, 00
        cmp     r11d, edx                               ; 10BB _ 41: 39. D3
        jge     ?_159                                   ; 10BE _ 7D, 0B
        inc     r11d                                    ; 10C0 _ 41: FF. C3
        inc     r12d                                    ; 10C3 _ 41: FF. C4
        sub     edx, r11d                               ; 10C6 _ 44: 29. DA
        jmp     ?_158                                   ; 10C9 _ EB, E7

?_159:  mov     r8d, dword [rcx+30H]                    ; 10CB _ 44: 8B. 41, 30
        lea     rbx, [rcx+40H]                          ; 10CF _ 48: 8D. 59, 40
        xor     r10d, r10d                              ; 10D3 _ 45: 31. D2
        movsxd  rsi, dword [rcx+38H]                    ; 10D6 _ 48: 63. 71, 38
        mov     rbp, qword [rcx+18H]                    ; 10DA _ 48: 8B. 69, 18
        mov     r11, qword [rcx+20H]                    ; 10DE _ 4C: 8B. 59, 20
; Note: Prefix bit or byte has no meaning in this context
        shlx    eax, r12d, r8d                          ; 10E2 _ C4 C2 39: F7. C4
        add     rax, qword [rcx+10H]                    ; 10E7 _ 48: 03. 41, 10
        mov     rdi, rsi                                ; 10EB _ 48: 89. F7
        lea     r12, [rsi*8]                            ; 10EE _ 4C: 8D. 24 F5, 00000000
        sub     rbx, r12                                ; 10F6 _ 4C: 29. E3
        mov     r12d, 64                                ; 10F9 _ 41: BC, 00000040
        mov     r9, qword [rax]                         ; 10FF _ 4C: 8B. 08
        lea     r8, [rax+8H]                            ; 1102 _ 4C: 8D. 40, 08
        bswap   r9                                      ; 1106 _ 49: 0F C9
?_160:  mov     rax, rsi                                ; 1109 _ 48: 89. F0
        mov     r13d, edi                               ; 110C _ 41: 89. FD
?_161:  lea     r15, [rax+1H]                           ; 110F _ 4C: 8D. 78, 01
        mov     r14, qword [rbx+r15*8-8H]               ; 1113 _ 4E: 8B. 74 FB, F8
        cmp     r14, r9                                 ; 1118 _ 4D: 39. CE
        jbe     ?_162                                   ; 111B _ 76, 08
        inc     r13d                                    ; 111D _ 41: FF. C5
        mov     rax, r15                                ; 1120 _ 4C: 89. F8
        jmp     ?_161                                   ; 1123 _ EB, EA

?_162:  movzx   r15d, word [rbp+rax*2]                  ; 1125 _ 44: 0F B7. 7C 45, 00
        mov     rax, r9                                 ; 112B _ 4C: 89. C8
        sub     rax, r14                                ; 112E _ 4C: 29. F0
        mov     r14, rax                                ; 1131 _ 49: 89. C6
        mov     eax, r12d                               ; 1134 _ 44: 89. E0
        sub     eax, r13d                               ; 1137 _ 44: 29. E8
        shrx    rax, r14, rax                           ; 113A _ C4 C2 FB: F7. C6
        add     eax, r15d                               ; 113F _ 44: 01. F8
        movsxd  r15, eax                                ; 1142 _ 4C: 63. F8
        movzx   r14d, byte [r11+r15]                    ; 1145 _ 47: 0F B6. 34 3B
        cmp     r14d, edx                               ; 114A _ 41: 39. D6
        jge     ?_163                                   ; 114D _ 7D, 2F
        not     r14d                                    ; 114F _ 41: F7. D6
        add     r10d, r13d                              ; 1152 _ 45: 01. EA
        shlx    r9, r9, r13                             ; 1155 _ C4 42 91: F7. C9
        add     edx, r14d                               ; 115A _ 44: 01. F2
        cmp     r10d, 31                                ; 115D _ 41: 83. FA, 1F
        jle     ?_160                                   ; 1161 _ 7E, A6
        mov     r13d, dword [r8]                        ; 1163 _ 45: 8B. 28
        sub     r10d, 32                                ; 1166 _ 41: 83. EA, 20
        add     r8, 4                                   ; 116A _ 49: 83. C0, 04
        bswap   r13d                                    ; 116E _ 41: 0F CD
        mov     eax, r13d                               ; 1171 _ 44: 89. E8
        shlx    r15, rax, r10                           ; 1174 _ C4 62 A9: F7. F8
        or      r9, r15                                 ; 1179 _ 4D: 09. F9
        jmp     ?_160                                   ; 117C _ EB, 8B

?_163:  mov     r10, qword [rcx+28H]                    ; 117E _ 4C: 8B. 51, 28
?_164:  movsxd  rcx, eax                                ; 1182 _ 48: 63. C8
        cmp     byte [r11+rcx], 0                       ; 1185 _ 41: 80. 3C 0B, 00
        jz      ?_165                                   ; 118A _ 74, 3B
        lea     ebx, [rax+rax*2]                        ; 118C _ 8D. 1C 40
        movsxd  rsi, ebx                                ; 118F _ 48: 63. F3
        add     rsi, r10                                ; 1192 _ 4C: 01. D6
        movzx   edi, byte [rsi+1H]                      ; 1195 _ 0F B6. 7E, 01
        movzx   ebp, byte [rsi]                         ; 1199 _ 0F B6. 2E
        mov     eax, edi                                ; 119C _ 89. F8
        and     eax, 0FH                                ; 119E _ 83. E0, 0F
        shl     eax, 8                                  ; 11A1 _ C1. E0, 08
        or      eax, ebp                                ; 11A4 _ 09. E8
        movsxd  r8, eax                                 ; 11A6 _ 4C: 63. C0
        movzx   r12d, byte [r11+r8]                     ; 11A9 _ 47: 0F B6. 24 03
        cmp     r12d, edx                               ; 11AE _ 41: 39. D4
        jge     ?_164                                   ; 11B1 _ 7D, CF
        movzx   eax, byte [rsi+2H]                      ; 11B3 _ 0F B6. 46, 02
        not     r12d                                    ; 11B7 _ 41: F7. D4
        sar     edi, 4                                  ; 11BA _ C1. FF, 04
        add     edx, r12d                               ; 11BD _ 44: 01. E2
        shl     eax, 4                                  ; 11C0 _ C1. E0, 04
        or      eax, edi                                ; 11C3 _ 09. F8
        jmp     ?_164                                   ; 11C5 _ EB, BB

?_165:  lea     eax, [rax+rax*2]                        ; 11C7 _ 8D. 04 40
        cdqe                                            ; 11CA _ 48: 98
        mov     al, byte [r10+rax]                      ; 11CC _ 41: 8A. 04 02
?_166:  pop     rbx                                     ; 11D0 _ 5B
        pop     rsi                                     ; 11D1 _ 5E
        pop     rdi                                     ; 11D2 _ 5F
        pop     rbp                                     ; 11D3 _ 5D
        pop     r12                                     ; 11D4 _ 41: 5C
        pop     r13                                     ; 11D6 _ 41: 5D
        pop     r14                                     ; 11D8 _ 41: 5E
        pop     r15                                     ; 11DA _ 41: 5F
        ret                                             ; 11DC _ C3

_ZL12encode_pieceP13TBEntry_piecePhPiS2_.isra.0:; Local function
        push    r15                                     ; 11DD _ 41: 57
        push    r14                                     ; 11DF _ 41: 56
        push    r13                                     ; 11E1 _ 41: 55
        push    r12                                     ; 11E3 _ 41: 54
        push    rbp                                     ; 11E5 _ 55
        push    rdi                                     ; 11E6 _ 57
        push    rsi                                     ; 11E7 _ 56
        push    rbx                                     ; 11E8 _ 53
        test    byte [r9], 04H                          ; 11E9 _ 41: F6. 01, 04
        mov     r10, qword [rsp+68H]                    ; 11ED _ 4C: 8B. 54 24, 68
        movzx   ecx, cl                                 ; 11F2 _ 0F B6. C9
        jnz     ?_168                                   ; 11F5 _ 75, 08
?_167:  test    byte [r9], 20H                          ; 11F7 _ 41: F6. 01, 20
        jnz     ?_171                                   ; 11FB _ 75, 17
        jmp     ?_170                                   ; 11FD _ EB, 10

?_168:  xor     eax, eax                                ; 11FF _ 31. C0
?_169:  cmp     ecx, eax                                ; 1201 _ 39. C1
        jle     ?_167                                   ; 1203 _ 7E, F2
        xor     dword [r9+rax*4], 07H                   ; 1205 _ 41: 83. 34 81, 07
        inc     rax                                     ; 120A _ 48: FF. C0
        jmp     ?_169                                   ; 120D _ EB, F2

?_170:  xor     r11d, r11d                              ; 120F _ 45: 31. DB
        jmp     ?_174                                   ; 1212 _ EB, 24

?_171:  xor     ebx, ebx                                ; 1214 _ 31. DB
?_172:  cmp     ecx, ebx                                ; 1216 _ 39. D9
        jle     ?_170                                   ; 1218 _ 7E, F5
        xor     dword [r9+rbx*4], 38H                   ; 121A _ 41: 83. 34 99, 38
        inc     rbx                                     ; 121F _ 48: FF. C3
        jmp     ?_172                                   ; 1222 _ EB, F2

?_173:  movsxd  rbp, dword [r9+r11*4]                   ; 1224 _ 4B: 63. 2C 99
        lea     rsi, [rel _ZL7offdiag]                  ; 1228 _ 48: 8D. 35, 00000840(rel)
        inc     r11                                     ; 122F _ 49: FF. C3
        cmp     byte [rsi+rbp], 0                       ; 1232 _ 80. 3C 2E, 00
        jnz     ?_175                                   ; 1236 _ 75, 08
?_174:  cmp     ecx, r11d                               ; 1238 _ 44: 39. D9
        movsxd  rdi, r11d                               ; 123B _ 49: 63. FB
        jg      ?_173                                   ; 123E _ 7F, E4
?_175:  cmp     byte [rdx], 0                           ; 1240 _ 80. 3A, 00
        jz      ?_177                                   ; 1243 _ 74, 2D
        cmp     edi, 1                                  ; 1245 _ 83. FF, 01
        jle     ?_178                                   ; 1248 _ 7E, 2D
?_176:  mov     dl, byte [rdx]                          ; 124A _ 8A. 12
        test    dl, dl                                  ; 124C _ 84. D2
        jz      ?_180                                   ; 124E _ 74, 59
        movsxd  r14, dword [r9]                         ; 1250 _ 4D: 63. 31
        dec     dl                                      ; 1253 _ FE. CA
        mov     r15d, dword [r9+4H]                     ; 1255 _ 45: 8B. 79, 04
        lea     rbx, [rel _ZL8triangle]                 ; 1259 _ 48: 8D. 1D, 00000800(rel)
        lea     rdi, [rel _ZL6KK_idx]                   ; 1260 _ 48: 8D. 3D, 00000180(rel)
        je      ?_184                                   ; 1267 _ 0F 84, 00000153
        jmp     ?_186                                   ; 126D _ E9, 000001D2

?_177:  cmp     edi, 2                                  ; 1272 _ 83. FF, 02
        jg      ?_180                                   ; 1275 _ 7F, 32
?_178:  movsxd  r12, dword [r9+rdi*4]                   ; 1277 _ 4D: 63. 24 B9
        lea     r13, [rel _ZL7offdiag]                  ; 127B _ 4C: 8D. 2D, 00000840(rel)
        xor     eax, eax                                ; 1282 _ 31. C0
        cmp     byte [r13+r12], 0                       ; 1284 _ 43: 80. 7C 25, 00, 00
        jle     ?_176                                   ; 128A _ 7E, BE
?_179:  cmp     ecx, eax                                ; 128C _ 39. C1
        jle     ?_176                                   ; 128E _ 7E, BA
        movsxd  rsi, dword [r9+rax*4]                   ; 1290 _ 49: 63. 34 81
        lea     rdi, [rel _ZL8flipdiag]                 ; 1294 _ 48: 8D. 3D, 000007C0(rel)
        movzx   r14d, byte [rdi+rsi]                    ; 129B _ 44: 0F B6. 34 37
        mov     dword [r9+rax*4], r14d                  ; 12A0 _ 45: 89. 34 81
        inc     rax                                     ; 12A4 _ 48: FF. C0
        jmp     ?_179                                   ; 12A7 _ EB, E3

?_180:  movsxd  r13, dword [r9]                         ; 12A9 _ 4D: 63. 29
        lea     rbx, [rel _ZL7offdiag]                  ; 12AC _ 48: 8D. 1D, 00000840(rel)
        xor     r14d, r14d                              ; 12B3 _ 45: 31. F6
        movsxd  r12, dword [r9+4H]                      ; 12B6 _ 4D: 63. 61, 04
        movsxd  rax, dword [r9+8H]                      ; 12BA _ 49: 63. 41, 08
        cmp     r12d, r13d                              ; 12BE _ 45: 39. EC
        setg    r14b                                    ; 12C1 _ 41: 0F 9F. C6
        xor     edx, edx                                ; 12C5 _ 31. D2
        cmp     r13d, eax                               ; 12C7 _ 41: 39. C5
        setl    dl                                      ; 12CA _ 0F 9C. C2
        xor     r15d, r15d                              ; 12CD _ 45: 31. FF
        cmp     r12d, eax                               ; 12D0 _ 41: 39. C4
        setl    r15b                                    ; 12D3 _ 41: 0F 9C. C7
        add     r15d, edx                               ; 12D7 _ 41: 01. D7
        cmp     byte [rbx+r13], 0                       ; 12DA _ 42: 80. 3C 2B, 00
        jz      ?_181                                   ; 12DF _ 74, 2F
        lea     rbx, [rel _ZL8triangle]                 ; 12E1 _ 48: 8D. 1D, 00000800(rel)
        sub     r12d, r14d                              ; 12E8 _ 45: 29. F4
        sub     eax, r15d                               ; 12EB _ 44: 29. F8
        movzx   edi, byte [rbx+r13]                     ; 12EE _ 42: 0F B6. 3C 2B
        imul    r14d, r12d, 62                          ; 12F3 _ 45: 6B. F4, 3E
        mov     edx, 3                                  ; 12F7 _ BA, 00000003
        imul    r11d, edi, 3906                         ; 12FC _ 44: 69. DF, 00000F42
        add     r14d, r11d                              ; 1303 _ 45: 01. DE
        add     eax, r14d                               ; 1306 _ 44: 01. F0
        cdqe                                            ; 1309 _ 48: 98
        jmp     ?_187                                   ; 130B _ E9, 0000014D

?_181:  cmp     byte [rbx+r12], 0                       ; 1310 _ 42: 80. 3C 23, 00
        lea     rdi, [rel _ZL4diag]                     ; 1315 _ 48: 8D. 3D, 00000740(rel)
        jz      ?_182                                   ; 131C _ 74, 35
        lea     rsi, [rel _ZL5lower]                    ; 131E _ 48: 8D. 35, 00000780(rel)
        movzx   r11d, byte [rdi+r13]                    ; 1325 _ 46: 0F B6. 1C 2F
        movzx   r12d, byte [rsi+r12]                    ; 132A _ 46: 0F B6. 24 26
        imul    ebp, r11d, 1736                         ; 132F _ 41: 69. EB, 000006C8
        imul    r13d, r12d, 62                          ; 1336 _ 45: 6B. EC, 3E
        lea     edx, [rbp+r13+5B8CH]                    ; 133A _ 42: 8D. 94 2D, 00005B8C
        add     eax, edx                                ; 1342 _ 01. D0
        mov     edx, 3                                  ; 1344 _ BA, 00000003
        sub     eax, r15d                               ; 1349 _ 44: 29. F8
        cdqe                                            ; 134C _ 48: 98
        jmp     ?_187                                   ; 134E _ E9, 0000010A

?_182:  cmp     byte [rbx+rax], 0                       ; 1353 _ 80. 3C 03, 00
        movzx   r11d, byte [rdi+r13]                    ; 1357 _ 46: 0F B6. 1C 2F
        jz      ?_183                                   ; 135C _ 74, 34
        movzx   edx, byte [rdi+r12]                     ; 135E _ 42: 0F B6. 14 27
        lea     rdi, [rel _ZL5lower]                    ; 1363 _ 48: 8D. 3D, 00000780(rel)
        imul    r15d, r11d, 196                         ; 136A _ 45: 69. FB, 000000C4
        movzx   eax, byte [rdi+rax]                     ; 1371 _ 0F B6. 04 07
        sub     edx, r14d                               ; 1375 _ 44: 29. F2
        imul    r14d, edx, 28                           ; 1378 _ 44: 6B. F2, 1C
        mov     edx, 3                                  ; 137C _ BA, 00000003
        lea     ebx, [r15+r14+76ACH]                    ; 1381 _ 43: 8D. 9C 37, 000076AC
        add     eax, ebx                                ; 1389 _ 01. D8
        cdqe                                            ; 138B _ 48: 98
        jmp     ?_187                                   ; 138D _ E9, 000000CB

?_183:  movzx   esi, byte [rdi+r12]                     ; 1392 _ 42: 0F B6. 34 27
        imul    ebp, r11d, 42                           ; 1397 _ 41: 6B. EB, 2A
        mov     edx, 3                                  ; 139B _ BA, 00000003
        movzx   eax, byte [rdi+rax]                     ; 13A0 _ 0F B6. 04 07
        sub     esi, r14d                               ; 13A4 _ 44: 29. F6
        imul    r12d, esi, 6                            ; 13A7 _ 44: 6B. E6, 06
        sub     eax, r15d                               ; 13AB _ 44: 29. F8
        lea     r13d, [rbp+r12+79BCH]                   ; 13AE _ 46: 8D. AC 25, 000079BC
        add     eax, r13d                               ; 13B6 _ 44: 01. E8
        cdqe                                            ; 13B9 _ 48: 98
        jmp     ?_187                                   ; 13BB _ E9, 0000009D

?_184:  mov     ebp, dword [r9+8H]                      ; 13C0 _ 41: 8B. 69, 08
        xor     esi, esi                                ; 13C4 _ 31. F6
        movsxd  r13, r15d                               ; 13C6 _ 4D: 63. EF
        movzx   edx, byte [rbx+r14]                     ; 13C9 _ 42: 0F B6. 14 33
        cmp     ebp, r14d                               ; 13CE _ 44: 39. F5
        setg    sil                                     ; 13D1 _ 40: 0F 9F. C6
        xor     r12d, r12d                              ; 13D5 _ 45: 31. E4
        cmp     ebp, r15d                               ; 13D8 _ 44: 39. FD
        setg    r12b                                    ; 13DB _ 41: 0F 9F. C4
        shl     rdx, 6                                  ; 13DF _ 48: C1. E2, 06
        add     rdx, r13                                ; 13E3 _ 4C: 01. EA
        add     esi, r12d                               ; 13E6 _ 44: 01. E6
        movsx   r14, word [rdi+rdx*2]                   ; 13E9 _ 4C: 0F BF. 34 57
        cmp     r14, 440                                ; 13EE _ 49: 81. FE, 000001B8
        ja      ?_185                                   ; 13F5 _ 77, 14
        sub     ebp, esi                                ; 13F7 _ 29. F5
        mov     edx, 3                                  ; 13F9 _ BA, 00000003
        imul    eax, ebp, 441                           ; 13FE _ 69. C5, 000001B9
        cdqe                                            ; 1404 _ 48: 98
        add     rax, r14                                ; 1406 _ 4C: 01. F0
        jmp     ?_187                                   ; 1409 _ EB, 52

?_185:  lea     rbx, [rel _ZL5lower]                    ; 140B _ 48: 8D. 1D, 00000780(rel)
        movsxd  r15, ebp                                ; 1412 _ 4C: 63. FD
        mov     edx, 3                                  ; 1415 _ BA, 00000003
        movzx   edi, byte [rbx+r15]                     ; 141A _ 42: 0F B6. 3C 3B
        lea     r11, [rel _ZL7offdiag]                  ; 141F _ 4C: 8D. 1D, 00000840(rel)
        imul    rax, rdi, 21                            ; 1426 _ 48: 6B. C7, 15
        cmp     byte [r11+r15], 0                       ; 142A _ 43: 80. 3C 3B, 00
        lea     rax, [r14+rax+6915H]                    ; 142F _ 49: 8D. 84 06, 00006915
        jnz     ?_187                                   ; 1437 _ 75, 24
        imul    ebp, esi, 21                            ; 1439 _ 6B. EE, 15
        movsxd  rsi, ebp                                ; 143C _ 48: 63. F5
        sub     rax, rsi                                ; 143F _ 48: 29. F0
        jmp     ?_187                                   ; 1442 _ EB, 19

?_186:  movzx   r11d, byte [rbx+r14]                    ; 1444 _ 46: 0F B6. 1C 33
        movsxd  rax, r15d                               ; 1449 _ 49: 63. C7
        mov     edx, 2                                  ; 144C _ BA, 00000002
        shl     r11, 6                                  ; 1451 _ 49: C1. E3, 06
        add     r11, rax                                ; 1455 _ 49: 01. C3
        movsx   rax, word [rdi+r11*2]                   ; 1458 _ 4A: 0F BF. 04 5F
?_187:  movsxd  r15, dword [r10]                        ; 145D _ 4D: 63. 3A
        imul    rax, r15                                ; 1460 _ 49: 0F AF. C7
?_188:  cmp     ecx, edx                                ; 1464 _ 39. D1
        jle     ?_197                                   ; 1466 _ 0F 8E, 000000B0
        movsxd  rbp, edx                                ; 146C _ 48: 63. EA
        mov     ebx, edx                                ; 146F _ 89. D3
        movzx   esi, byte [r8+rbp]                      ; 1471 _ 41: 0F B6. 34 28
        lea     rdi, [rbp*4+4H]                         ; 1476 _ 48: 8D. 3C AD, 00000004
        lea     r15, [r9+rdi]                           ; 147E _ 4D: 8D. 3C 39
        add     esi, edx                                ; 1482 _ 01. D6
?_189:  cmp     ebx, esi                                ; 1484 _ 39. F3
        jge     ?_193                                   ; 1486 _ 7D, 2D
        xor     ebp, ebp                                ; 1488 _ 31. ED
        inc     ebx                                     ; 148A _ FF. C3
?_190:  lea     r12d, [rbx+rbp]                         ; 148C _ 44: 8D. 24 2B
        cmp     r12d, esi                               ; 1490 _ 41: 39. F4
        jge     ?_192                                   ; 1493 _ 7D, 1A
        mov     r11d, dword [r15-4H]                    ; 1495 _ 45: 8B. 5F, FC
        mov     r13d, dword [r15+rbp*4]                 ; 1499 _ 45: 8B. 2C AF
        cmp     r11d, r13d                              ; 149D _ 45: 39. EB
        jle     ?_191                                   ; 14A0 _ 7E, 08
        mov     dword [r15-4H], r13d                    ; 14A2 _ 45: 89. 6F, FC
        mov     dword [r15+rbp*4], r11d                 ; 14A6 _ 45: 89. 1C AF
?_191:  inc     rbp                                     ; 14AA _ 48: FF. C5
        jmp     ?_190                                   ; 14AD _ EB, DD

?_192:  add     r15, 4                                  ; 14AF _ 49: 83. C7, 04
        jmp     ?_189                                   ; 14B3 _ EB, CF

?_193:  lea     r13, [r9+rdi-4H]                        ; 14B5 _ 4D: 8D. 6C 39, FC
        xor     r12d, r12d                              ; 14BA _ 45: 31. E4
        xor     ebp, ebp                                ; 14BD _ 31. ED
?_194:  lea     ebx, [rdx+r12]                          ; 14BF _ 42: 8D. 1C 22
        cmp     esi, ebx                                ; 14C3 _ 39. DE
        jle     ?_196                                   ; 14C5 _ 7E, 3F
        mov     r11d, dword [r13+r12*4]                 ; 14C7 _ 47: 8B. 5C A5, 00
        xor     ebx, ebx                                ; 14CC _ 31. DB
        xor     r14d, r14d                              ; 14CE _ 45: 31. F6
?_195:  xor     r15d, r15d                              ; 14D1 _ 45: 31. FF
        cmp     r11d, dword [r9+rbx*4]                  ; 14D4 _ 45: 3B. 1C 99
        setg    r15b                                    ; 14D8 _ 41: 0F 9F. C7
        inc     rbx                                     ; 14DC _ 48: FF. C3
        add     r14d, r15d                              ; 14DF _ 45: 01. FE
        cmp     edx, ebx                                ; 14E2 _ 39. DA
        jg      ?_195                                   ; 14E4 _ 7F, EB
        sub     r11d, r14d                              ; 14E6 _ 45: 29. F3
        lea     r14, [rel _ZL8binomial]                 ; 14E9 _ 4C: 8D. 35, 000002C0(rel)
        movsxd  rbx, r11d                               ; 14F0 _ 49: 63. DB
        movsxd  r11, r12d                               ; 14F3 _ 4D: 63. DC
        shl     r11, 6                                  ; 14F6 _ 49: C1. E3, 06
        inc     r12                                     ; 14FA _ 49: FF. C4
        add     r11, rbx                                ; 14FD _ 49: 01. DB
        add     ebp, dword [r14+r11*4]                  ; 1500 _ 43: 03. 2C 9E
        jmp     ?_194                                   ; 1504 _ EB, B9

?_196:  movsxd  r13, dword [r10+rdi-4H]                 ; 1506 _ 4D: 63. 6C 3A, FC
        movsxd  r12, ebp                                ; 150B _ 4C: 63. E5
        mov     edx, esi                                ; 150E _ 89. F2
        imul    r12, r13                                ; 1510 _ 4D: 0F AF. E5
        add     rax, r12                                ; 1514 _ 4C: 01. E0
        jmp     ?_188                                   ; 1517 _ E9, FFFFFF48

?_197:  ; Local function
        pop     rbx                                     ; 151C _ 5B
        pop     rsi                                     ; 151D _ 5E
        pop     rdi                                     ; 151E _ 5F
        pop     rbp                                     ; 151F _ 5D
        pop     r12                                     ; 1520 _ 41: 5C
        pop     r13                                     ; 1522 _ 41: 5D
        pop     r14                                     ; 1524 _ 41: 5E
        pop     r15                                     ; 1526 _ 41: 5F
        ret                                             ; 1528 _ C3

_ZL11encode_pawnP12TBEntry_pawnPhPiS2_:; Local function
        push    r15                                     ; 1529 _ 41: 57
        push    r14                                     ; 152B _ 41: 56
        push    r13                                     ; 152D _ 41: 55
        push    r12                                     ; 152F _ 41: 54
        push    rbp                                     ; 1531 _ 55
        push    rdi                                     ; 1532 _ 57
        push    rsi                                     ; 1533 _ 56
        push    rbx                                     ; 1534 _ 53
        test    byte [r8], 04H                          ; 1535 _ 41: F6. 00, 04
        movzx   r12d, byte [rcx+19H]                    ; 1539 _ 44: 0F B6. 61, 19
        jz      ?_199                                   ; 153E _ 74, 11
        xor     eax, eax                                ; 1540 _ 31. C0
?_198:  cmp     r12d, eax                               ; 1542 _ 41: 39. C4
        jle     ?_199                                   ; 1545 _ 7E, 0A
        xor     dword [r8+rax*4], 07H                   ; 1547 _ 41: 83. 34 80, 07
        inc     rax                                     ; 154C _ 48: FF. C0
        jmp     ?_198                                   ; 154F _ EB, F1

?_199:  ; Local function
        lea     r11, [r8+8H]                            ; 1551 _ 4D: 8D. 58, 08
        mov     r14d, 1                                 ; 1555 _ 41: BE, 00000001
?_200:  movzx   r10d, byte [rcx+1CH]                    ; 155B _ 44: 0F B6. 51, 1C
        cmp     r10d, r14d                              ; 1560 _ 45: 39. F2
        mov     rbp, r10                                ; 1563 _ 4C: 89. D5
        jle     ?_204                                   ; 1566 _ 7E, 3F
        xor     eax, eax                                ; 1568 _ 31. C0
        inc     r14d                                    ; 156A _ 41: FF. C6
?_201:  movzx   r10d, byte [rcx+1CH]                    ; 156D _ 44: 0F B6. 51, 1C
        lea     ebp, [r14+rax]                          ; 1572 _ 41: 8D. 2C 06
        cmp     r10d, ebp                               ; 1576 _ 41: 39. EA
        jle     ?_203                                   ; 1579 _ 7E, 26
        movsxd  r13, dword [r11-4H]                     ; 157B _ 4D: 63. 6B, FC
        lea     rdi, [rel _ZL6ptwist]                   ; 157F _ 48: 8D. 3D, 000006C0(rel)
        movsxd  r15, dword [r11+rax*4]                  ; 1586 _ 4D: 63. 3C 83
        mov     r10b, byte [rdi+r15]                    ; 158A _ 46: 8A. 14 3F
        cmp     byte [rdi+r13], r10b                    ; 158E _ 46: 38. 14 2F
        jnc     ?_202                                   ; 1592 _ 73, 08
        mov     dword [r11-4H], r15d                    ; 1594 _ 45: 89. 7B, FC
        mov     dword [r11+rax*4], r13d                 ; 1598 _ 45: 89. 2C 83
?_202:  inc     rax                                     ; 159C _ 48: FF. C0
        jmp     ?_201                                   ; 159F _ EB, CC

?_203:  add     r11, 4                                  ; 15A1 _ 49: 83. C3, 04
        jmp     ?_200                                   ; 15A5 _ EB, B4

?_204:  ; Local function
        movsxd  rsi, dword [r8]                         ; 15A7 _ 49: 63. 30
        lea     ebx, [r10-1H]                           ; 15AA _ 41: 8D. 5A, FF
        lea     rdi, [rel _ZL4flap]                     ; 15AE _ 48: 8D. 3D, 00000700(rel)
        movsxd  r15, ebx                                ; 15B5 _ 4C: 63. FB
        imul    rax, r15, 24                            ; 15B8 _ 49: 6B. C7, 18
        lea     r11, [rel _ZL7pawnidx]                  ; 15BC _ 4C: 8D. 1D, 000000C0(rel)
        movzx   r13d, byte [rdi+rsi]                    ; 15C3 _ 44: 0F B6. 2C 37
        add     r13, rax                                ; 15C8 _ 49: 01. C5
        movsxd  rax, dword [r11+r13*4]                  ; 15CB _ 4B: 63. 04 AB
        lea     r13, [r8+r15*4]                         ; 15CF _ 4F: 8D. 2C B8
        xor     r11d, r11d                              ; 15D3 _ 45: 31. DB
?_205:  test    ebx, ebx                                ; 15D6 _ 85. DB
        jle     ?_206                                   ; 15D8 _ 7E, 34
        imul    rdi, r11, -4                            ; 15DA _ 49: 6B. FB, FC
        dec     ebx                                     ; 15DE _ FF. CB
        lea     r15, [rel _ZL6ptwist]                   ; 15E0 _ 4C: 8D. 3D, 000006C0(rel)
        movsxd  rsi, dword [r13+rdi]                    ; 15E7 _ 49: 63. 74 3D, 00
        lea     rdi, [rel _ZL8binomial]                 ; 15EC _ 48: 8D. 3D, 000002C0(rel)
        movzx   r14d, byte [r15+rsi]                    ; 15F3 _ 45: 0F B6. 34 37
        movsxd  rsi, r11d                               ; 15F8 _ 49: 63. F3
        inc     r11                                     ; 15FB _ 49: FF. C3
        shl     rsi, 6                                  ; 15FE _ 48: C1. E6, 06
        add     rsi, r14                                ; 1602 _ 4C: 01. F6
        movsxd  r15, dword [rdi+rsi*4]                  ; 1605 _ 4C: 63. 3C B7
        add     rax, r15                                ; 1609 _ 4C: 01. F8
        jmp     ?_205                                   ; 160C _ EB, C8

?_206:  ; Local function
        movsxd  rbx, dword [r9]                         ; 160E _ 49: 63. 19
        imul    rax, rbx                                ; 1611 _ 48: 0F AF. C3
        movzx   ebx, byte [rcx+1DH]                     ; 1615 _ 0F B6. 59, 1D
        add     ebx, r10d                               ; 1619 _ 44: 01. D3
        cmp     ebx, r10d                               ; 161C _ 44: 39. D3
        jle     ?_217                                   ; 161F _ 0F 8E, 000000C0
        movsxd  rcx, r10d                               ; 1625 _ 49: 63. CA
        lea     rdi, [rcx*4+4H]                         ; 1628 _ 48: 8D. 3C 8D, 00000004
        mov     ecx, r10d                               ; 1630 _ 44: 89. D1
        lea     r11, [r8+rdi]                           ; 1633 _ 4D: 8D. 1C 38
?_207:  cmp     ecx, ebx                                ; 1637 _ 39. D9
        jz      ?_211                                   ; 1639 _ 74, 2D
        xor     esi, esi                                ; 163B _ 31. F6
        inc     ecx                                     ; 163D _ FF. C1
?_208:  lea     r13d, [rcx+rsi]                         ; 163F _ 44: 8D. 2C 31
        cmp     r13d, ebx                               ; 1643 _ 41: 39. DD
        jge     ?_210                                   ; 1646 _ 7D, 1A
        mov     r15d, dword [r11-4H]                    ; 1648 _ 45: 8B. 7B, FC
        mov     r14d, dword [r11+rsi*4]                 ; 164C _ 45: 8B. 34 B3
        cmp     r15d, r14d                              ; 1650 _ 45: 39. F7
        jle     ?_209                                   ; 1653 _ 7E, 08
        mov     dword [r11-4H], r14d                    ; 1655 _ 45: 89. 73, FC
        mov     dword [r11+rsi*4], r15d                 ; 1659 _ 45: 89. 3C B3
?_209:  inc     rsi                                     ; 165D _ 48: FF. C6
        jmp     ?_208                                   ; 1660 _ EB, DD

?_210:  add     r11, 4                                  ; 1662 _ 49: 83. C3, 04
        jmp     ?_207                                   ; 1666 _ EB, CF

?_211:  lea     r13, [r8+rdi-4H]                        ; 1668 _ 4D: 8D. 6C 38, FC
        xor     esi, esi                                ; 166D _ 31. F6
        xor     edi, edi                                ; 166F _ 31. FF
?_212:  lea     r14d, [r10+rdi]                         ; 1671 _ 45: 8D. 34 3A
        cmp     r14d, ebx                               ; 1675 _ 41: 39. DE
        jge     ?_215                                   ; 1678 _ 7D, 46
        mov     ecx, dword [r13+rdi*4]                  ; 167A _ 41: 8B. 4C BD, 00
        xor     r11d, r11d                              ; 167F _ 45: 31. DB
        xor     r14d, r14d                              ; 1682 _ 45: 31. F6
?_213:  cmp     r10d, r11d                              ; 1685 _ 45: 39. DA
        jle     ?_214                                   ; 1688 _ 7E, 13
        xor     r15d, r15d                              ; 168A _ 45: 31. FF
        cmp     dword [r8+r11*4], ecx                   ; 168D _ 43: 39. 0C 98
        setl    r15b                                    ; 1691 _ 41: 0F 9C. C7
        inc     r11                                     ; 1695 _ 49: FF. C3
        add     r14d, r15d                              ; 1698 _ 45: 01. FE
        jmp     ?_213                                   ; 169B _ EB, E8

?_214:  lea     r11, [rel _ZL8binomial]                 ; 169D _ 4C: 8D. 1D, 000002C0(rel)
        sub     ecx, r14d                               ; 16A4 _ 44: 29. F1
        sub     ecx, 8                                  ; 16A7 _ 83. E9, 08
        movsxd  r15, ecx                                ; 16AA _ 4C: 63. F9
        movsxd  rcx, edi                                ; 16AD _ 48: 63. CF
        inc     rdi                                     ; 16B0 _ 48: FF. C7
        shl     rcx, 6                                  ; 16B3 _ 48: C1. E1, 06
        add     rcx, r15                                ; 16B7 _ 4C: 01. F9
        add     esi, dword [r11+rcx*4]                  ; 16BA _ 41: 03. 34 8B
        jmp     ?_212                                   ; 16BE _ EB, B1

?_215:  movsxd  rbp, dword [r9+rbp*4]                   ; 16C0 _ 49: 63. 2C A9
        movsxd  r10, esi                                ; 16C4 _ 4C: 63. D6
        imul    r10, rbp                                ; 16C7 _ 4C: 0F AF. D5
        add     rax, r10                                ; 16CB _ 4C: 01. D0
        mov     r10d, ebx                               ; 16CE _ 41: 89. DA
        jmp     ?_217                                   ; 16D1 _ EB, 12

?_216:  movsxd  r13, dword [r9+rsi-4H]                  ; 16D3 _ 4D: 63. 6C 31, FC
        movsxd  rdi, edi                                ; 16D8 _ 48: 63. FF
        mov     r10d, ebx                               ; 16DB _ 41: 89. DA
        imul    rdi, r13                                ; 16DE _ 49: 0F AF. FD
        add     rax, rdi                                ; 16E2 _ 48: 01. F8
?_217:  cmp     r10d, r12d                              ; 16E5 _ 45: 39. E2
        jge     ?_226                                   ; 16E8 _ 0F 8D, 0000009D
        movsxd  rsi, r10d                               ; 16EE _ 49: 63. F2
        mov     ecx, r10d                               ; 16F1 _ 44: 89. D1
        movzx   ebx, byte [rdx+rsi]                     ; 16F4 _ 0F B6. 1C 32
        lea     rsi, [rsi*4+4H]                         ; 16F8 _ 48: 8D. 34 B5, 00000004
        lea     r11, [r8+rsi]                           ; 1700 _ 4D: 8D. 1C 30
        add     ebx, r10d                               ; 1704 _ 44: 01. D3
?_218:  cmp     ebx, ecx                                ; 1707 _ 39. CB
        jle     ?_222                                   ; 1709 _ 7E, 2B
        xor     edi, edi                                ; 170B _ 31. FF
        inc     ecx                                     ; 170D _ FF. C1
?_219:  lea     ebp, [rcx+rdi]                          ; 170F _ 8D. 2C 39
        cmp     ebp, ebx                                ; 1712 _ 39. DD
        jge     ?_221                                   ; 1714 _ 7D, 1A
        mov     r14d, dword [r11-4H]                    ; 1716 _ 45: 8B. 73, FC
        mov     r13d, dword [r11+rdi*4]                 ; 171A _ 45: 8B. 2C BB
        cmp     r14d, r13d                              ; 171E _ 45: 39. EE
        jle     ?_220                                   ; 1721 _ 7E, 08
        mov     dword [r11-4H], r13d                    ; 1723 _ 45: 89. 6B, FC
        mov     dword [r11+rdi*4], r14d                 ; 1727 _ 45: 89. 34 BB
?_220:  inc     rdi                                     ; 172B _ 48: FF. C7
        jmp     ?_219                                   ; 172E _ EB, DF

?_221:  add     r11, 4                                  ; 1730 _ 49: 83. C3, 04
        jmp     ?_218                                   ; 1734 _ EB, D1

?_222:  lea     r13, [r8+rsi-4H]                        ; 1736 _ 4D: 8D. 6C 30, FC
        xor     ebp, ebp                                ; 173B _ 31. ED
        xor     edi, edi                                ; 173D _ 31. FF
?_223:  lea     r15d, [r10+rbp]                         ; 173F _ 45: 8D. 3C 2A
        cmp     r15d, ebx                               ; 1743 _ 41: 39. DF
        jge     ?_216                                   ; 1746 _ 7D, 8B
        mov     ecx, dword [r13+rbp*4]                  ; 1748 _ 41: 8B. 4C AD, 00
        xor     r11d, r11d                              ; 174D _ 45: 31. DB
        xor     r14d, r14d                              ; 1750 _ 45: 31. F6
?_224:  cmp     r10d, r11d                              ; 1753 _ 45: 39. DA
        jle     ?_225                                   ; 1756 _ 7E, 13
        xor     r15d, r15d                              ; 1758 _ 45: 31. FF
        cmp     dword [r8+r11*4], ecx                   ; 175B _ 43: 39. 0C 98
        setl    r15b                                    ; 175F _ 41: 0F 9C. C7
        inc     r11                                     ; 1763 _ 49: FF. C3
        add     r14d, r15d                              ; 1766 _ 45: 01. FE
        jmp     ?_224                                   ; 1769 _ EB, E8

?_225:  sub     ecx, r14d                               ; 176B _ 44: 29. F1
        lea     r14, [rel _ZL8binomial]                 ; 176E _ 4C: 8D. 35, 000002C0(rel)
        movsxd  r11, ecx                                ; 1775 _ 4C: 63. D9
        movsxd  rcx, ebp                                ; 1778 _ 48: 63. CD
        shl     rcx, 6                                  ; 177B _ 48: C1. E1, 06
        inc     rbp                                     ; 177F _ 48: FF. C5
        add     rcx, r11                                ; 1782 _ 4C: 01. D9
        add     edi, dword [r14+rcx*4]                  ; 1785 _ 41: 03. 3C 8E
        jmp     ?_223                                   ; 1789 _ EB, B4

?_226:  ; Local function
        pop     rbx                                     ; 178B _ 5B
        pop     rsi                                     ; 178C _ 5E
        pop     rdi                                     ; 178D _ 5F
        pop     rbp                                     ; 178E _ 5D
        pop     r12                                     ; 178F _ 41: 5C
        pop     r13                                     ; 1791 _ 41: 5D
        pop     r14                                     ; 1793 _ 41: 5E
        pop     r15                                     ; 1795 _ 41: 5F
        ret                                             ; 1797 _ C3

_ZL8probe_abR8PositioniiPi:; Local function
        push    r15                                     ; 1798 _ 41: 57
        push    r14                                     ; 179A _ 41: 56
        push    r13                                     ; 179C _ 41: 55
        push    r12                                     ; 179E _ 41: 54
        push    rbp                                     ; 17A0 _ 55
        push    rdi                                     ; 17A1 _ 57
        push    rsi                                     ; 17A2 _ 56
        push    rbx                                     ; 17A3 _ 53
        sub     rsp, 1080                               ; 17A4 _ 48: 81. EC, 00000438
        mov     rax, qword [rcx+3B8H]                   ; 17AB _ 48: 8B. 81, 000003B8
        cmp     qword [rax+38H], 0                      ; 17B2 _ 48: 83. 78, 38, 00
        mov     rsi, rcx                                ; 17B7 _ 48: 89. CE
        mov     r12d, r8d                               ; 17BA _ 45: 89. C4
        mov     rdi, r9                                 ; 17BD _ 4C: 89. CF
        mov     dword [rsp+488H], edx                   ; 17C0 _ 89. 94 24, 00000488
        lea     rbp, [rsp+230H]                         ; 17C7 _ 48: 8D. AC 24, 00000230
        mov     rdx, rbp                                ; 17CF _ 48: 89. EA
        jnz     ?_229                                   ; 17D2 _ 75, 3E
        call    _Z8generateIL7GenType0EEP7ExtMoveRK8PositionS2_; 17D4 _ E8, 00000000(rel)
        mov     rdx, rbp                                ; 17D9 _ 48: 89. EA
        mov     r14, rax                                ; 17DC _ 49: 89. C6
?_227:  cmp     rdx, rax                                ; 17DF _ 48: 39. C2
        jnc     ?_230                                   ; 17E2 _ 73, 36
        mov     r9d, dword [rdx]                        ; 17E4 _ 44: 8B. 0A
        mov     r8d, r9d                                ; 17E7 _ 45: 89. C8
        and     r8d, 0C000H                             ; 17EA _ 41: 81. E0, 0000C000
        cmp     r8d, 16384                              ; 17F1 _ 41: 81. F8, 00004000
        jnz     ?_228                                   ; 17F8 _ 75, 12
        mov     r11d, r9d                               ; 17FA _ 45: 89. CB
        and     r11d, 3FH                               ; 17FD _ 41: 83. E3, 3F
        cmp     dword [rsi+r11*4], 0                    ; 1801 _ 42: 83. 3C 9E, 00
        jne     ?_241                                   ; 1806 _ 0F 85, 0000014A
?_228:  add     rdx, 8                                  ; 180C _ 48: 83. C2, 08
        jmp     ?_227                                   ; 1810 _ EB, CD

?_229:  call    _Z8generateIL7GenType3EEP7ExtMoveRK8PositionS2_; 1812 _ E8, 00000000(rel)
        mov     r14, rax                                ; 1817 _ 49: 89. C6
?_230:  lea     r13, [rsp+110H]                         ; 181A _ 4C: 8D. AC 24, 00000110
        mov     rdx, rsi                                ; 1822 _ 48: 89. F2
        mov     rcx, r13                                ; 1825 _ 4C: 89. E9
        call    _ZN9CheckInfoC1ERK8Position             ; 1828 _ E8, 00000000(rel)
        lea     rdx, [rsp+0C0H]                         ; 182D _ 48: 8D. 94 24, 000000C0
        mov     ecx, r12d                               ; 1835 _ 44: 89. E1
        neg     ecx                                     ; 1838 _ F7. D9
        mov     qword [rsp+30H], rdx                    ; 183A _ 48: 89. 54 24, 30
        mov     dword [rsp+38H], ecx                    ; 183F _ 89. 4C 24, 38
?_231:  cmp     rbp, r14                                ; 1843 _ 4C: 39. F5
        jnc     ?_235                                   ; 1846 _ 73, 64
        mov     ebx, dword [rbp]                        ; 1848 _ 8B. 5D, 00
        mov     eax, ebx                                ; 184B _ 89. D8
        and     eax, 3FH                                ; 184D _ 83. E0, 3F
        cmp     dword [rsi+rax*4], 0                    ; 1850 _ 83. 3C 86, 00
        jz      ?_232                                   ; 1854 _ 74, 10
        mov     ecx, ebx                                ; 1856 _ 89. D9
        and     ecx, 0C000H                             ; 1858 _ 81. E1, 0000C000
        cmp     ecx, 49152                              ; 185E _ 81. F9, 0000C000
        jnz     ?_233                                   ; 1864 _ 75, 13
?_232:  mov     r10d, ebx                               ; 1866 _ 41: 89. DA
        and     r10d, 0C000H                            ; 1869 _ 41: 81. E2, 0000C000
        cmp     r10d, 32768                             ; 1870 _ 41: 81. FA, 00008000
        jnz     ?_234                                   ; 1877 _ 75, 2D
?_233:  mov     r15d, ebx                               ; 1879 _ 41: 89. DF
        and     r15d, 0C000H                            ; 187C _ 41: 81. E7, 0000C000
        cmp     r15d, 32768                             ; 1883 _ 41: 81. FF, 00008000
        jz      ?_234                                   ; 188A _ 74, 1A
        mov     r8, qword [rsp+118H]                    ; 188C _ 4C: 8B. 84 24, 00000118
        mov     edx, ebx                                ; 1894 _ 89. DA
        mov     rcx, rsi                                ; 1896 _ 48: 89. F1
        call    _ZNK8Position5legalE4Movey              ; 1899 _ E8, 00000000(rel)
        test    al, al                                  ; 189E _ 84. C0
        jne     ?_242                                   ; 18A0 _ 0F 85, 000000DA
?_234:  add     rbp, 8                                  ; 18A6 _ 48: 83. C5, 08
        jmp     ?_231                                   ; 18AA _ EB, 97

?_235:  mov     rbx, qword [rsi+3B8H]                   ; 18AC _ 48: 8B. 9E, 000003B8
        xor     r15d, r15d                              ; 18B3 _ 45: 31. FF
        mov     r8, qword [rel .refptr._ZN7Zobrist3psqE]; 18B6 _ 4C: 8B. 05, 00000000(rel)
        mov     rbp, qword [rbx+8H]                     ; 18BD _ 48: 8B. 6B, 08
        mov     r9, qword [r8+1C00H]                    ; 18C1 _ 4D: 8B. 88, 00001C00
        xor     r9, qword [r8+0C00H]                    ; 18C8 _ 4D: 33. 88, 00000C00
        mov     qword [rsp+30H], rbp                    ; 18CF _ 48: 89. 6C 24, 30
        cmp     r9, qword [rsp+30H]                     ; 18D4 _ 4C: 3B. 4C 24, 30
        jz      ?_237                                   ; 18D9 _ 74, 3B
        mov     r10, qword [rsp+30H]                    ; 18DB _ 4C: 8B. 54 24, 30
        lea     r14, [rel _ZL7TB_hash]                  ; 18E0 _ 4C: 8D. 35, 00000DC0(rel)
        shr     r10, 54                                 ; 18E7 _ 49: C1. EA, 36
        imul    r11, r10, 80                            ; 18EB _ 4D: 6B. DA, 50
        add     r14, r11                                ; 18EF _ 4D: 01. DE
        lea     r12, [r14+50H]                          ; 18F2 _ 4D: 8D. 66, 50
?_236:  mov     r13, qword [rsp+30H]                    ; 18F6 _ 4C: 8B. 6C 24, 30
        cmp     qword [r14], r13                        ; 18FB _ 4D: 39. 2E
        je      ?_244                                   ; 18FE _ 0F 84, 000000F9
        add     r14, 16                                 ; 1904 _ 49: 83. C6, 10
        cmp     r14, r12                                ; 1908 _ 4D: 39. E6
        jnz     ?_236                                   ; 190B _ 75, E9
        mov     dword [rdi], 0                          ; 190D _ C7. 07, 00000000
        xor     r15d, r15d                              ; 1913 _ 45: 31. FF
?_237:  cmp     dword [rdi], 0                          ; 1916 _ 83. 3F, 00
        jnz     ?_239                                   ; 1919 _ 75, 08
?_238:  xor     r15d, r15d                              ; 191B _ 45: 31. FF
        jmp     ?_293                                   ; 191E _ E9, 0000092D

?_239:  cmp     dword [rsp+488H], r15d                  ; 1923 _ 44: 39. BC 24, 00000488
        jl      ?_240                                   ; 192B _ 7C, 1E
        xor     ebx, ebx                                ; 192D _ 31. DB
        cmp     dword [rsp+488H], 0                     ; 192F _ 83. BC 24, 00000488, 00
        mov     r15d, dword [rsp+488H]                  ; 1937 _ 44: 8B. BC 24, 00000488
        setg    bl                                      ; 193F _ 0F 9F. C3
        inc     ebx                                     ; 1942 _ FF. C3
        mov     dword [rdi], ebx                        ; 1944 _ 89. 1F
        jmp     ?_293                                   ; 1946 _ E9, 00000905

?_240:  mov     dword [rdi], 1                          ; 194B _ C7. 07, 00000001
        jmp     ?_293                                   ; 1951 _ E9, 000008FA

?_241:  lea     ebx, [r9-1000H]                         ; 1956 _ 41: 8D. 99, FFFFF000
        add     r14, 24                                 ; 195D _ 49: 83. C6, 18
        lea     ecx, [r9-2000H]                         ; 1961 _ 41: 8D. 89, FFFFE000
        sub     r9d, 12288                              ; 1968 _ 41: 81. E9, 00003000
        mov     dword [r14-18H], ebx                    ; 196F _ 41: 89. 5E, E8
        mov     dword [r14-10H], ecx                    ; 1973 _ 41: 89. 4E, F0
        mov     dword [r14-8H], r9d                     ; 1977 _ 45: 89. 4E, F8
        jmp     ?_228                                   ; 197B _ E9, FFFFFE8C

?_242:  mov     r8, r13                                 ; 1980 _ 4D: 89. E8
        mov     edx, ebx                                ; 1983 _ 89. DA
        mov     rcx, rsi                                ; 1985 _ 48: 89. F1
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 1988 _ E8, 00000000(rel)
        mov     r8, qword [rsp+30H]                     ; 198D _ 4C: 8B. 44 24, 30
        mov     edx, ebx                                ; 1992 _ 89. DA
        mov     rcx, rsi                                ; 1994 _ 48: 89. F1
        movzx   r9d, al                                 ; 1997 _ 44: 0F B6. C8
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 199B _ E8, 00000000(rel)
        mov     edx, dword [rsp+38H]                    ; 19A0 _ 8B. 54 24, 38
        mov     r9, rdi                                 ; 19A4 _ 49: 89. F9
        mov     rcx, rsi                                ; 19A7 _ 48: 89. F1
        mov     r8d, dword [rsp+488H]                   ; 19AA _ 44: 8B. 84 24, 00000488
        neg     r8d                                     ; 19B2 _ 41: F7. D8
        call    _ZL8probe_abR8PositioniiPi              ; 19B5 _ E8, FFFFFDDE
        mov     edx, ebx                                ; 19BA _ 89. DA
        mov     rcx, rsi                                ; 19BC _ 48: 89. F1
        neg     eax                                     ; 19BF _ F7. D8
        mov     r15d, eax                               ; 19C1 _ 41: 89. C7
        call    _ZN8Position9undo_moveE4Move            ; 19C4 _ E8, 00000000(rel)
        cmp     dword [rdi], 0                          ; 19C9 _ 83. 3F, 00
        je      ?_238                                   ; 19CC _ 0F 84, FFFFFF49
        cmp     r15d, dword [rsp+488H]                  ; 19D2 _ 44: 3B. BC 24, 00000488
        jle     ?_234                                   ; 19DA _ 0F 8E, FFFFFEC6
        cmp     r15d, r12d                              ; 19E0 _ 45: 39. E7
        jl      ?_243                                   ; 19E3 _ 7C, 0B
        mov     dword [rdi], 2                          ; 19E5 _ C7. 07, 00000002
        jmp     ?_293                                   ; 19EB _ E9, 00000860

?_243:  mov     dword [rsp+488H], r15d                  ; 19F0 _ 44: 89. BC 24, 00000488
        jmp     ?_234                                   ; 19F8 _ E9, FFFFFEA9

?_244:  mov     rbx, qword [r14+8H]                     ; 19FD _ 49: 8B. 5E, 08
        cmp     byte [rbx+18H], 0                       ; 1A01 _ 80. 7B, 18, 00
        jne     ?_277                                   ; 1A05 _ 0F 85, 000005EB
        or      edx, 0FFFFFFFFH                         ; 1A0B _ 83. CA, FF
        mov     rcx, qword [rel _ZL8TB_mutex]           ; 1A0E _ 48: 8B. 0D, 000344F0(rel)
        call    near [rel __imp_WaitForSingleObject]    ; 1A15 _ FF. 15, 00000000(rel)
        cmp     byte [rbx+18H], 0                       ; 1A1B _ 80. 7B, 18, 00
        jne     ?_276                                   ; 1A1F _ 0F 85, 000005C4
        mov     rax, qword [rsp+30H]                    ; 1A25 _ 48: 8B. 44 24, 30
        lea     rbp, [rsp+70H]                          ; 1A2A _ 48: 8D. 6C 24, 70
        xor     r8d, r8d                                ; 1A2F _ 45: 31. C0
        mov     rcx, rsi                                ; 1A32 _ 48: 89. F1
        cmp     qword [rbx+8H], rax                     ; 1A35 _ 48: 39. 43, 08
        mov     rdx, rbp                                ; 1A39 _ 48: 89. EA
        setne   r8b                                     ; 1A3C _ 41: 0F 95. C0
        call    _ZL7prt_strR8PositionPci                ; 1A40 _ E8, FFFFF557
        lea     r8, [rbx+10H]                           ; 1A45 _ 4C: 8D. 43, 10
        mov     rcx, rbp                                ; 1A49 _ 48: 89. E9
        lea     rdx, [rel ?_491]                        ; 1A4C _ 48: 8D. 15, 0000007A(rel)
        call    _ZL8map_filePKcS0_Py                    ; 1A53 _ E8, FFFFF3C6
        test    rax, rax                                ; 1A58 _ 48: 85. C0
        mov     r12, rax                                ; 1A5B _ 49: 89. C4
        mov     qword [rbx], rax                        ; 1A5E _ 48: 89. 03
        jnz     ?_245                                   ; 1A61 _ 75, 17
        lea     rcx, [rel ?_497]                        ; 1A63 _ 48: 8D. 0D, 0000011B(rel)
        mov     rdx, rbp                                ; 1A6A _ 48: 89. EA
        xor     r15d, r15d                              ; 1A6D _ 45: 31. FF
        call    _ZL6printfPKcz                          ; 1A70 _ E8, FFFFEF2D
        jmp     ?_274                                   ; 1A75 _ E9, 0000054C

?_245:  cmp     byte [rax], 113                         ; 1A7A _ 80. 38, 71
        jnz     ?_246                                   ; 1A7D _ 75, 12
        cmp     byte [rax+1H], -24                      ; 1A7F _ 80. 78, 01, E8
        jnz     ?_246                                   ; 1A83 _ 75, 0C
        cmp     byte [rax+2H], 35                       ; 1A85 _ 80. 78, 02, 23
        jnz     ?_246                                   ; 1A89 _ 75, 06
        cmp     byte [rax+3H], 93                       ; 1A8B _ 80. 78, 03, 5D
        jz      ?_248                                   ; 1A8F _ 74, 36
?_246:  lea     rcx, [rel ?_498]                        ; 1A91 _ 48: 8D. 0D, 00000132(rel)
        call    _ZL6printfPKcz                          ; 1A98 _ E8, FFFFEF05
        mov     rcx, qword [rbx]                        ; 1A9D _ 48: 8B. 0B
        mov     rsi, qword [rbx+10H]                    ; 1AA0 _ 48: 8B. 73, 10
        test    rcx, rcx                                ; 1AA4 _ 48: 85. C9
        jz      ?_247                                   ; 1AA7 _ 74, 0F
        call    near [rel __imp_UnmapViewOfFile]        ; 1AA9 _ FF. 15, 00000000(rel)
        mov     rcx, rsi                                ; 1AAF _ 48: 89. F1
        call    near [rel __imp_CloseHandle]            ; 1AB2 _ FF. 15, 00000000(rel)
?_247:  mov     qword [rbx], 0                          ; 1AB8 _ 48: C7. 03, 00000000
        xor     r15d, r15d                              ; 1ABF _ 45: 31. FF
        jmp     ?_274                                   ; 1AC2 _ E9, 000004FF

?_248:  mov     dl, byte [rax+4H]                       ; 1AC7 _ 8A. 50, 04
        lea     r13, [rax+5H]                           ; 1ACA _ 4C: 8D. 68, 05
        mov     bpl, dl                                 ; 1ACE _ 40: 88. D5
        and     edx, 02H                                ; 1AD1 _ 83. E2, 02
        and     ebp, 01H                                ; 1AD4 _ 83. E5, 01
        cmp     dl, 1                                   ; 1AD7 _ 80. FA, 01
        sbb     ecx, ecx                                ; 1ADA _ 19. C9
        and     ecx, 0FFFFFFFDH                         ; 1ADC _ 83. E1, FD
        add     ecx, 4                                  ; 1ADF _ 83. C1, 04
        cmp     byte [rbx+1BH], 0                       ; 1AE2 _ 80. 7B, 1B, 00
        mov     dword [rsp+38H], ecx                    ; 1AE6 _ 89. 4C 24, 38
        jne     ?_257                                   ; 1AEA _ 0F 85, 000001E9
        movzx   r9d, byte [rbx+19H]                     ; 1AF0 _ 44: 0F B6. 4B, 19
        xor     r8d, r8d                                ; 1AF5 _ 45: 31. C0
?_249:  cmp     r9d, r8d                                ; 1AF8 _ 45: 39. C1
        jle     ?_250                                   ; 1AFB _ 7E, 13
        mov     r11b, byte [r12+r8+6H]                  ; 1AFD _ 47: 8A. 5C 04, 06
        and     r11d, 0FH                               ; 1B02 _ 41: 83. E3, 0F
        mov     byte [rbx+r8+60H], r11b                 ; 1B06 _ 46: 88. 5C 03, 60
        inc     r8                                      ; 1B0B _ 49: FF. C0
        jmp     ?_249                                   ; 1B0E _ EB, E8

?_250:  mov     r10b, byte [r12+5H]                     ; 1B10 _ 45: 8A. 54 24, 05
        lea     r14, [rbx+6CH]                          ; 1B15 _ 4C: 8D. 73, 6C
        lea     rcx, [rbx+1CH]                          ; 1B19 _ 48: 8D. 4B, 1C
        mov     r8, r14                                 ; 1B1D _ 4D: 89. F0
        lea     r9, [rbx+60H]                           ; 1B20 _ 4C: 8D. 4B, 60
        mov     rdx, rcx                                ; 1B24 _ 48: 89. CA
        mov     qword [rsp+40H], rcx                    ; 1B27 _ 48: 89. 4C 24, 40
        mov     r15d, r10d                              ; 1B2C _ 45: 89. D7
        and     r15d, 0FH                               ; 1B2F _ 41: 83. E7, 0F
        mov     dword [rsp+38H], r15d                   ; 1B33 _ 44: 89. 7C 24, 38
        lea     r15, [rbx+19H]                          ; 1B38 _ 4C: 8D. 7B, 19
        mov     rcx, r15                                ; 1B3C _ 4C: 89. F9
        call    _ZL14set_norm_pieceP13TBEntry_piecePhS1_.isra.2; 1B3F _ E8, 00001F98
        movzx   edx, byte [rbx+19H]                     ; 1B44 _ 0F B6. 53, 19
        lea     rcx, [rbx+30H]                          ; 1B48 _ 48: 8D. 4B, 30
        mov     r9, r14                                 ; 1B4C _ 4D: 89. F1
        movzx   r11d, byte [rbx+1CH]                    ; 1B4F _ 44: 0F B6. 5B, 1C
        mov     r8d, dword [rsp+38H]                    ; 1B54 _ 44: 8B. 44 24, 38
        mov     dword [rsp+20H], r11d                   ; 1B59 _ 44: 89. 5C 24, 20
        call    _ZL18calc_factors_piecePiiiPhh          ; 1B5E _ E8, 0000081D
        movzx   ecx, byte [rbx+19H]                     ; 1B63 _ 0F B6. 4B, 19
        mov     r10, qword [rsp+40H]                    ; 1B67 _ 4C: 8B. 54 24, 40
        mov     r14, rax                                ; 1B6C _ 49: 89. C6
        mov     qword [rsp+80H], rax                    ; 1B6F _ 48: 89. 84 24, 00000080
        xor     eax, eax                                ; 1B77 _ 31. C0
?_251:  cmp     ecx, eax                                ; 1B79 _ 39. C1
        jle     ?_252                                   ; 1B7B _ 7E, 12
        movzx   edx, byte [r12+rax+6H]                  ; 1B7D _ 41: 0F B6. 54 04, 06
        sar     edx, 4                                  ; 1B83 _ C1. FA, 04
        mov     byte [rbx+rax+66H], dl                  ; 1B86 _ 88. 54 03, 66
        inc     rax                                     ; 1B8A _ 48: FF. C0
        jmp     ?_251                                   ; 1B8D _ EB, EA

?_252:  movzx   r12d, byte [r12+5H]                     ; 1B8F _ 45: 0F B6. 64 24, 05
        lea     r9, [rbx+66H]                           ; 1B95 _ 4C: 8D. 4B, 66
        mov     rdx, r10                                ; 1B99 _ 4C: 89. D2
        mov     rcx, r15                                ; 1B9C _ 4C: 89. F9
        lea     r15, [rsp+68H]                          ; 1B9F _ 4C: 8D. 7C 24, 68
        sar     r12d, 4                                 ; 1BA4 _ 41: C1. FC, 04
        mov     dword [rsp+38H], r12d                   ; 1BA8 _ 44: 89. 64 24, 38
        lea     r12, [rbx+72H]                          ; 1BAD _ 4C: 8D. 63, 72
        mov     r8, r12                                 ; 1BB1 _ 4D: 89. E0
        call    _ZL14set_norm_pieceP13TBEntry_piecePhS1_.isra.2; 1BB4 _ E8, 00001F23
        movzx   eax, byte [rbx+1CH]                     ; 1BB9 _ 0F B6. 43, 1C
        lea     rcx, [rbx+48H]                          ; 1BBD _ 48: 8D. 4B, 48
        mov     r9, r12                                 ; 1BC1 _ 4D: 89. E1
        movzx   edx, byte [rbx+19H]                     ; 1BC4 _ 0F B6. 53, 19
        mov     r8d, dword [rsp+38H]                    ; 1BC8 _ 44: 8B. 44 24, 38
        mov     dword [rsp+20H], eax                    ; 1BCD _ 89. 44 24, 20
        call    _ZL18calc_factors_piecePiiiPhh          ; 1BD1 _ E8, 000007AA
        movzx   edx, byte [rbx+19H]                     ; 1BD6 _ 0F B6. 53, 19
        lea     r8, [rsp+67H]                           ; 1BDA _ 4C: 8D. 44 24, 67
        mov     dword [rsp+28H], 1                      ; 1BDF _ C7. 44 24, 28, 00000001
        mov     qword [rsp+20H], r8                     ; 1BE7 _ 4C: 89. 44 24, 20
        mov     r12, rax                                ; 1BEC _ 49: 89. C4
        mov     qword [rsp+38H], r8                     ; 1BEF _ 4C: 89. 44 24, 38
        mov     qword [rsp+88H], rax                    ; 1BF4 _ 48: 89. 84 24, 00000088
        lea     rcx, [r13+rdx+1H]                       ; 1BFC _ 49: 8D. 4C 15, 01
        mov     rdx, r14                                ; 1C01 _ 4C: 89. F2
        lea     r13, [rsp+170H]                         ; 1C04 _ 4C: 8D. AC 24, 00000170
        mov     r9, rcx                                 ; 1C0C _ 49: 89. C9
        and     r9d, 01H                                ; 1C0F _ 41: 83. E1, 01
        mov     r8, r13                                 ; 1C13 _ 4D: 89. E8
        add     rcx, r9                                 ; 1C16 _ 4C: 01. C9
        mov     r9, r15                                 ; 1C19 _ 4D: 89. F9
        call    _ZL11setup_pairsPhyPyPS_S_i             ; 1C1C _ E8, FFFFEDA8
        test    bpl, bpl                                ; 1C21 _ 40: 84. ED
        mov     rcx, qword [rsp+68H]                    ; 1C24 _ 48: 8B. 4C 24, 68
        mov     qword [rbx+20H], rax                    ; 1C29 _ 48: 89. 43, 20
        mov     r10, qword [rsp+38H]                    ; 1C2D _ 4C: 8B. 54 24, 38
        jz      ?_253                                   ; 1C32 _ 74, 27
        mov     qword [rsp+20H], r10                    ; 1C34 _ 4C: 89. 54 24, 20
        lea     r8, [r13+18H]                           ; 1C39 _ 4D: 8D. 45, 18
        mov     r9, r15                                 ; 1C3D _ 4D: 89. F9
        mov     rdx, r12                                ; 1C40 _ 4C: 89. E2
        mov     dword [rsp+28H], 1                      ; 1C43 _ C7. 44 24, 28, 00000001
        call    _ZL11setup_pairsPhyPyPS_S_i             ; 1C4B _ E8, FFFFED79
        mov     rcx, qword [rsp+68H]                    ; 1C50 _ 48: 8B. 4C 24, 68
        mov     qword [rbx+28H], rax                    ; 1C55 _ 48: 89. 43, 28
        jmp     ?_254                                   ; 1C59 _ EB, 08

?_253:  mov     qword [rbx+28H], 0                      ; 1C5B _ 48: C7. 43, 28, 00000000
?_254:  mov     r14, qword [rbx+20H]                    ; 1C63 _ 4C: 8B. 73, 20
        mov     qword [r14], rcx                        ; 1C67 _ 49: 89. 0E
        add     rcx, qword [rsp+170H]                   ; 1C6A _ 48: 03. 8C 24, 00000170
        test    bpl, bpl                                ; 1C72 _ 40: 84. ED
        jz      ?_255                                   ; 1C75 _ 74, 0F
        mov     r11, qword [rbx+28H]                    ; 1C77 _ 4C: 8B. 5B, 28
        mov     qword [r11], rcx                        ; 1C7B _ 49: 89. 0B
        add     rcx, qword [rsp+188H]                   ; 1C7E _ 48: 03. 8C 24, 00000188
?_255:  mov     qword [r14+8H], rcx                     ; 1C86 _ 49: 89. 4E, 08
        add     rcx, qword [rsp+178H]                   ; 1C8A _ 48: 03. 8C 24, 00000178
        test    bpl, bpl                                ; 1C92 _ 40: 84. ED
        jz      ?_256                                   ; 1C95 _ 74, 10
        mov     rax, qword [rbx+28H]                    ; 1C97 _ 48: 8B. 43, 28
        mov     qword [rax+8H], rcx                     ; 1C9B _ 48: 89. 48, 08
        add     rcx, qword [rsp+190H]                   ; 1C9F _ 48: 03. 8C 24, 00000190
?_256:  add     rcx, 63                                 ; 1CA7 _ 48: 83. C1, 3F
        and     rcx, 0FFFFFFFFFFFFFFC0H                 ; 1CAB _ 48: 83. E1, C0
        mov     qword [r14+10H], rcx                    ; 1CAF _ 49: 89. 4E, 10
        add     rcx, qword [rsp+180H]                   ; 1CB3 _ 48: 03. 8C 24, 00000180
        test    bpl, bpl                                ; 1CBB _ 40: 84. ED
        je      ?_275                                   ; 1CBE _ 0F 84, 00000321
        mov     rbp, qword [rbx+28H]                    ; 1CC4 _ 48: 8B. 6B, 28
        add     rcx, 63                                 ; 1CC8 _ 48: 83. C1, 3F
        and     rcx, 0FFFFFFFFFFFFFFC0H                 ; 1CCC _ 48: 83. E1, C0
        mov     qword [rbp+10H], rcx                    ; 1CD0 _ 48: 89. 4D, 10
        jmp     ?_275                                   ; 1CD4 _ E9, 0000030C

?_257:  cmp     byte [rbx+1DH], 1                       ; 1CD9 _ 80. 7B, 1D, 01
        lea     r9, [rsp+80H]                           ; 1CDD _ 4C: 8D. 8C 24, 00000080
        mov     r12, rbx                                ; 1CE5 _ 49: 89. DC
        mov     qword [rsp+480H], rsi                   ; 1CE8 _ 48: 89. B4 24, 00000480
        mov     qword [rsp+498H], rdi                   ; 1CF0 _ 48: 89. BC 24, 00000498
        mov     rdi, r9                                 ; 1CF8 _ 4C: 89. CF
        mov     qword [rsp+40H], r9                     ; 1CFB _ 4C: 89. 4C 24, 40
        sbb     r8d, r8d                                ; 1D00 _ 45: 19. C0
        xor     r11d, r11d                              ; 1D03 _ 45: 31. DB
        add     r8d, 2                                  ; 1D06 _ 41: 83. C0, 02
        mov     esi, r11d                               ; 1D0A _ 44: 89. DE
        mov     dword [rsp+50H], r8d                    ; 1D0D _ 44: 89. 44 24, 50
?_258:  mov     al, byte [rbx+1DH]                      ; 1D12 _ 8A. 43, 1D
        mov     r9d, 15                                 ; 1D15 _ 41: B9, 0000000F
        mov     r15b, byte [r13]                        ; 1D1B _ 45: 8A. 7D, 00
        cmp     al, 1                                   ; 1D1F _ 3C, 01
        sbb     r14d, r14d                              ; 1D21 _ 45: 19. F6
        mov     edx, r15d                               ; 1D24 _ 44: 89. FA
        and     edx, 0FH                                ; 1D27 _ 83. E2, 0F
        add     r14d, 2                                 ; 1D2A _ 41: 83. C6, 02
        test    al, al                                  ; 1D2E _ 84. C0
        mov     dword [rsp+48H], edx                    ; 1D30 _ 89. 54 24, 48
        jz      ?_259                                   ; 1D34 _ 74, 08
        mov     r9b, byte [r13+1H]                      ; 1D36 _ 45: 8A. 4D, 01
        and     r9d, 0FH                                ; 1D3A _ 41: 83. E1, 0F
?_259:  movzx   eax, byte [rbx+19H]                     ; 1D3E _ 0F B6. 43, 19
        movsxd  rdx, r14d                               ; 1D42 _ 49: 63. D6
        xor     r11d, r11d                              ; 1D45 _ 45: 31. DB
        add     rdx, r13                                ; 1D48 _ 4C: 01. EA
?_260:  cmp     eax, r11d                               ; 1D4B _ 44: 39. D8
        jle     ?_261                                   ; 1D4E _ 7E, 12
        mov     r8b, byte [rdx+r11]                     ; 1D50 _ 46: 8A. 04 1A
        and     r8d, 0FH                                ; 1D54 _ 41: 83. E0, 0F
        mov     byte [r12+r11+60H], r8b                 ; 1D58 _ 47: 88. 44 1C, 60
        inc     r11                                     ; 1D5D _ 49: FF. C3
        jmp     ?_260                                   ; 1D60 _ EB, E9

?_261:  lea     r15, [r12+6CH]                          ; 1D62 _ 4D: 8D. 7C 24, 6C
        mov     rcx, rbx                                ; 1D67 _ 48: 89. D9
        mov     dword [rsp+58H], r9d                    ; 1D6A _ 44: 89. 4C 24, 58
        lea     r8, [r12+60H]                           ; 1D6F _ 4D: 8D. 44 24, 60
        mov     rdx, r15                                ; 1D74 _ 4C: 89. FA
        call    _ZL13set_norm_pawnP12TBEntry_pawnPhS1_  ; 1D77 _ E8, FFFFF02A
        movzx   edx, byte [rbx+19H]                     ; 1D7C _ 0F B6. 53, 19
        lea     rcx, [r12+30H]                          ; 1D80 _ 49: 8D. 4C 24, 30
        mov     qword [rsp+20H], r15                    ; 1D85 _ 4C: 89. 7C 24, 20
        mov     r9d, dword [rsp+58H]                    ; 1D8A _ 44: 8B. 4C 24, 58
        mov     dword [rsp+28H], esi                    ; 1D8F _ 89. 74 24, 28
        mov     r8d, dword [rsp+48H]                    ; 1D93 _ 44: 8B. 44 24, 48
        call    _ZL17calc_factors_pawnPiiiiPhi          ; 1D98 _ E8, 000004CA
        movzx   r15d, byte [r13]                        ; 1D9D _ 45: 0F B6. 7D, 00
        mov     r9d, 15                                 ; 1DA2 _ 41: B9, 0000000F
        mov     qword [rdi], rax                        ; 1DA8 _ 48: 89. 07
        sar     r15d, 4                                 ; 1DAB _ 41: C1. FF, 04
        cmp     byte [rbx+1DH], 0                       ; 1DAF _ 80. 7B, 1D, 00
        jz      ?_262                                   ; 1DB3 _ 74, 09
        movzx   r9d, byte [r13+1H]                      ; 1DB5 _ 45: 0F B6. 4D, 01
        sar     r9d, 4                                  ; 1DBA _ 41: C1. F9, 04
?_262:  movzx   eax, byte [rbx+19H]                     ; 1DBE _ 0F B6. 43, 19
        movsxd  r10, r14d                               ; 1DC2 _ 4D: 63. D6
        xor     r11d, r11d                              ; 1DC5 _ 45: 31. DB
        add     r10, r13                                ; 1DC8 _ 4D: 01. EA
?_263:  cmp     eax, r11d                               ; 1DCB _ 44: 39. D8
        jle     ?_264                                   ; 1DCE _ 7E, 12
        movzx   ecx, byte [r10+r11]                     ; 1DD0 _ 43: 0F B6. 0C 1A
        sar     ecx, 4                                  ; 1DD5 _ C1. F9, 04
        mov     byte [r12+r11+66H], cl                  ; 1DD8 _ 43: 88. 4C 1C, 66
        inc     r11                                     ; 1DDD _ 49: FF. C3
        jmp     ?_263                                   ; 1DE0 _ EB, E9

?_264:  lea     r14, [r12+72H]                          ; 1DE2 _ 4D: 8D. 74 24, 72
        mov     rcx, rbx                                ; 1DE7 _ 48: 89. D9
        mov     dword [rsp+48H], r9d                    ; 1DEA _ 44: 89. 4C 24, 48
        add     rdi, 16                                 ; 1DEF _ 48: 83. C7, 10
        lea     r8, [r12+66H]                           ; 1DF3 _ 4D: 8D. 44 24, 66
        mov     rdx, r14                                ; 1DF8 _ 4C: 89. F2
        call    _ZL13set_norm_pawnP12TBEntry_pawnPhS1_  ; 1DFB _ E8, FFFFEFA6
        movzx   edx, byte [rbx+19H]                     ; 1E00 _ 0F B6. 53, 19
        lea     rcx, [r12+48H]                          ; 1E04 _ 49: 8D. 4C 24, 48
        mov     r8d, r15d                               ; 1E09 _ 45: 89. F8
        mov     r9d, dword [rsp+48H]                    ; 1E0C _ 44: 8B. 4C 24, 48
        mov     dword [rsp+28H], esi                    ; 1E11 _ 89. 74 24, 28
        inc     esi                                     ; 1E15 _ FF. C6
        add     r12, 88                                 ; 1E17 _ 49: 83. C4, 58
        mov     qword [rsp+20H], r14                    ; 1E1B _ 4C: 89. 74 24, 20
        call    _ZL17calc_factors_pawnPiiiiPhi          ; 1E20 _ E8, 00000442
        mov     qword [rdi-8H], rax                     ; 1E25 _ 48: 89. 47, F8
        movzx   eax, byte [rbx+19H]                     ; 1E29 _ 0F B6. 43, 19
        add     eax, dword [rsp+50H]                    ; 1E2D _ 03. 44 24, 50
        cdqe                                            ; 1E31 _ 48: 98
        add     r13, rax                                ; 1E33 _ 49: 01. C5
        cmp     esi, 4                                  ; 1E36 _ 83. FE, 04
        jne     ?_258                                   ; 1E39 _ 0F 85, FFFFFED3
        mov     rsi, qword [rsp+480H]                   ; 1E3F _ 48: 8B. B4 24, 00000480
        lea     r14, [rbx+28H]                          ; 1E47 _ 4C: 8D. 73, 28
        mov     rcx, r13                                ; 1E4B _ 4C: 89. E9
        mov     qword [rsp+58H], rbx                    ; 1E4E _ 48: 89. 5C 24, 58
        lea     rdi, [rsp+68H]                          ; 1E53 _ 48: 8D. 7C 24, 68
        and     ecx, 01H                                ; 1E58 _ 83. E1, 01
        mov     rbx, qword [rsp+40H]                    ; 1E5B _ 48: 8B. 5C 24, 40
        mov     qword [rsp+48H], rdi                    ; 1E60 _ 48: 89. 7C 24, 48
        lea     r12, [rsp+170H]                         ; 1E65 _ 4C: 8D. A4 24, 00000170
        add     rcx, r13                                ; 1E6D _ 4C: 01. E9
        xor     r13d, r13d                              ; 1E70 _ 45: 31. ED
        lea     r8, [rsp+67H]                           ; 1E73 _ 4C: 8D. 44 24, 67
        mov     r15, r12                                ; 1E78 _ 4D: 89. E7
        mov     rdi, rsi                                ; 1E7B _ 48: 89. F7
        mov     esi, r13d                               ; 1E7E _ 44: 89. EE
        mov     r13, qword [rsp+498H]                   ; 1E81 _ 4C: 8B. AC 24, 00000498
        mov     qword [rsp+50H], r8                     ; 1E89 _ 4C: 89. 44 24, 50
?_265:  mov     r9, qword [rsp+50H]                     ; 1E8E _ 4C: 8B. 4C 24, 50
        mov     dword [rsp+28H], 1                      ; 1E93 _ C7. 44 24, 28, 00000001
        mov     r8, r15                                 ; 1E9B _ 4D: 89. F8
        mov     qword [rsp+20H], r9                     ; 1E9E _ 4C: 89. 4C 24, 20
        mov     r9, qword [rsp+48H]                     ; 1EA3 _ 4C: 8B. 4C 24, 48
        mov     rdx, qword [rbx]                        ; 1EA8 _ 48: 8B. 13
        call    _ZL11setup_pairsPhyPyPS_S_i             ; 1EAB _ E8, FFFFEB19
        test    bpl, bpl                                ; 1EB0 _ 40: 84. ED
        mov     qword [r14-8H], rax                     ; 1EB3 _ 49: 89. 46, F8
        mov     rcx, qword [rsp+68H]                    ; 1EB7 _ 48: 8B. 4C 24, 68
        jz      ?_266                                   ; 1EBC _ 74, 2E
        mov     r10, qword [rsp+50H]                    ; 1EBE _ 4C: 8B. 54 24, 50
        lea     r8, [r15+18H]                           ; 1EC3 _ 4D: 8D. 47, 18
        mov     rdx, qword [rbx+8H]                     ; 1EC7 _ 48: 8B. 53, 08
        mov     dword [rsp+28H], 1                      ; 1ECB _ C7. 44 24, 28, 00000001
        mov     r9, qword [rsp+48H]                     ; 1ED3 _ 4C: 8B. 4C 24, 48
        mov     qword [rsp+20H], r10                    ; 1ED8 _ 4C: 89. 54 24, 20
        call    _ZL11setup_pairsPhyPyPS_S_i             ; 1EDD _ E8, FFFFEAE7
        mov     qword [r14], rax                        ; 1EE2 _ 49: 89. 06
        mov     rcx, qword [rsp+68H]                    ; 1EE5 _ 48: 8B. 4C 24, 68
        jmp     ?_267                                   ; 1EEA _ EB, 07

?_266:  mov     qword [r14], 0                          ; 1EEC _ 49: C7. 06, 00000000
?_267:  inc     esi                                     ; 1EF3 _ FF. C6
        add     rbx, 16                                 ; 1EF5 _ 48: 83. C3, 10
        add     r15, 48                                 ; 1EF9 _ 49: 83. C7, 30
        add     r14, 88                                 ; 1EFD _ 49: 83. C6, 58
        cmp     esi, dword [rsp+38H]                    ; 1F01 _ 3B. 74 24, 38
        jnz     ?_265                                   ; 1F05 _ 75, 87
        mov     rbx, qword [rsp+58H]                    ; 1F07 _ 48: 8B. 5C 24, 58
        mov     rsi, rdi                                ; 1F0C _ 48: 89. FE
        mov     rax, r12                                ; 1F0F _ 4C: 89. E0
        mov     rdi, r13                                ; 1F12 _ 4C: 89. EF
        xor     r14d, r14d                              ; 1F15 _ 45: 31. F6
        lea     r11, [rbx+20H]                          ; 1F18 _ 4C: 8D. 5B, 20
        mov     rdx, r11                                ; 1F1C _ 4C: 89. DA
?_268:  mov     r15, qword [rdx]                        ; 1F1F _ 4C: 8B. 3A
        mov     qword [r15], rcx                        ; 1F22 _ 49: 89. 0F
        add     rcx, qword [rax]                        ; 1F25 _ 48: 03. 08
        test    bpl, bpl                                ; 1F28 _ 40: 84. ED
        jz      ?_269                                   ; 1F2B _ 74, 0B
        mov     r8, qword [rdx+8H]                      ; 1F2D _ 4C: 8B. 42, 08
        mov     qword [r8], rcx                         ; 1F31 _ 49: 89. 08
        add     rcx, qword [rax+18H]                    ; 1F34 _ 48: 03. 48, 18
?_269:  inc     r14d                                    ; 1F38 _ 41: FF. C6
        add     rdx, 88                                 ; 1F3B _ 48: 83. C2, 58
        add     rax, 48                                 ; 1F3F _ 48: 83. C0, 30
        cmp     r14d, dword [rsp+38H]                   ; 1F43 _ 44: 3B. 74 24, 38
        jnz     ?_268                                   ; 1F48 _ 75, D5
        mov     r13, r12                                ; 1F4A _ 4D: 89. E5
        mov     rax, r11                                ; 1F4D _ 4C: 89. D8
        xor     r9d, r9d                                ; 1F50 _ 45: 31. C9
?_270:  mov     r10, qword [rax]                        ; 1F53 _ 4C: 8B. 10
        mov     qword [r10+8H], rcx                     ; 1F56 _ 49: 89. 4A, 08
        add     rcx, qword [r13+8H]                     ; 1F5A _ 49: 03. 4D, 08
        test    bpl, bpl                                ; 1F5E _ 40: 84. ED
        jz      ?_271                                   ; 1F61 _ 74, 0C
        mov     rdx, qword [rax+8H]                     ; 1F63 _ 48: 8B. 50, 08
        mov     qword [rdx+8H], rcx                     ; 1F67 _ 48: 89. 4A, 08
        add     rcx, qword [r13+20H]                    ; 1F6B _ 49: 03. 4D, 20
?_271:  inc     r9d                                     ; 1F6F _ 41: FF. C1
        add     rax, 88                                 ; 1F72 _ 48: 83. C0, 58
        add     r13, 48                                 ; 1F76 _ 49: 83. C5, 30
        cmp     r9d, dword [rsp+38H]                    ; 1F7A _ 44: 3B. 4C 24, 38
        jnz     ?_270                                   ; 1F7F _ 75, D2
        xor     r14d, r14d                              ; 1F81 _ 45: 31. F6
?_272:  mov     r15, qword [r11]                        ; 1F84 _ 4D: 8B. 3B
        add     rcx, 63                                 ; 1F87 _ 48: 83. C1, 3F
        and     rcx, 0FFFFFFFFFFFFFFC0H                 ; 1F8B _ 48: 83. E1, C0
        mov     qword [r15+10H], rcx                    ; 1F8F _ 49: 89. 4F, 10
        add     rcx, qword [r12+10H]                    ; 1F93 _ 49: 03. 4C 24, 10
        test    bpl, bpl                                ; 1F98 _ 40: 84. ED
        jz      ?_273                                   ; 1F9B _ 74, 15
        mov     r8, qword [r11+8H]                      ; 1F9D _ 4D: 8B. 43, 08
        add     rcx, 63                                 ; 1FA1 _ 48: 83. C1, 3F
        and     rcx, 0FFFFFFFFFFFFFFC0H                 ; 1FA5 _ 48: 83. E1, C0
        mov     qword [r8+10H], rcx                     ; 1FA9 _ 49: 89. 48, 10
        add     rcx, qword [r12+28H]                    ; 1FAD _ 49: 03. 4C 24, 28
?_273:  inc     r14d                                    ; 1FB2 _ 41: FF. C6
        add     r11, 88                                 ; 1FB5 _ 49: 83. C3, 58
        add     r12, 48                                 ; 1FB9 _ 49: 83. C4, 30
        cmp     r14d, dword [rsp+38H]                   ; 1FBD _ 44: 3B. 74 24, 38
        jnz     ?_272                                   ; 1FC2 _ 75, C0
        jmp     ?_275                                   ; 1FC4 _ EB, 1F

?_274:  mov     qword [r14], 0                          ; 1FC6 _ 49: C7. 06, 00000000
        mov     rcx, qword [rel _ZL8TB_mutex]           ; 1FCD _ 48: 8B. 0D, 000344F0(rel)
        mov     dword [rdi], 0                          ; 1FD4 _ C7. 07, 00000000
        call    near [rel __imp_ReleaseMutex]           ; 1FDA _ FF. 15, 00000000(rel)
        jmp     ?_237                                   ; 1FE0 _ E9, FFFFF931

?_275:  mov     byte [rbx+18H], 1                       ; 1FE5 _ C6. 43, 18, 01
?_276:  mov     rcx, qword [rel _ZL8TB_mutex]           ; 1FE9 _ 48: 8B. 0D, 000344F0(rel)
        call    near [rel __imp_ReleaseMutex]           ; 1FF0 _ FF. 15, 00000000(rel)
?_277:  cmp     byte [rbx+1AH], 0                       ; 1FF6 _ 80. 7B, 1A, 00
        jnz     ?_279                                   ; 1FFA _ 75, 35
        mov     rcx, qword [rsp+30H]                    ; 1FFC _ 48: 8B. 4C 24, 30
        cmp     qword [rbx+8H], rcx                     ; 2001 _ 48: 39. 4B, 08
        jz      ?_278                                   ; 2005 _ 74, 18
        xor     eax, eax                                ; 2007 _ 31. C0
        cmp     dword [rsi+3ACH], 0                     ; 2009 _ 83. BE, 000003AC, 00
        mov     edx, 8                                  ; 2010 _ BA, 00000008
        mov     ecx, 56                                 ; 2015 _ B9, 00000038
        sete    al                                      ; 201A _ 0F 94. C0
        jmp     ?_280                                   ; 201D _ EB, 30

?_278:  xor     eax, eax                                ; 201F _ 31. C0
        cmp     dword [rsi+3ACH], 0                     ; 2021 _ 83. BE, 000003AC, 00
        setne   al                                      ; 2028 _ 0F 95. C0
        xor     edx, edx                                ; 202B _ 31. D2
        xor     ecx, ecx                                ; 202D _ 31. C9
        jmp     ?_280                                   ; 202F _ EB, 1E

?_279:  cmp     dword [rsi+3ACH], 1                     ; 2031 _ 83. BE, 000003AC, 01
        sbb     edx, edx                                ; 2038 _ 19. D2
        not     edx                                     ; 203A _ F7. D2
        and     edx, 08H                                ; 203C _ 83. E2, 08
        cmp     dword [rsi+3ACH], 1                     ; 203F _ 83. BE, 000003AC, 01
        sbb     ecx, ecx                                ; 2046 _ 19. C9
        xor     eax, eax                                ; 2048 _ 31. C0
        not     ecx                                     ; 204A _ F7. D1
        and     ecx, 38H                                ; 204C _ 83. E1, 38
?_280:  cmp     byte [rbx+1BH], 0                       ; 204F _ 80. 7B, 1B, 00
        jne     ?_284                                   ; 2053 _ 0F 85, 0000009F
        movsxd  r14, eax                                ; 2059 _ 4C: 63. F0
        movzx   r13d, byte [rbx+19H]                    ; 205C _ 44: 0F B6. 6B, 19
        xor     eax, eax                                ; 2061 _ 31. C0
        imul    r8, r14, 6                              ; 2063 _ 4D: 6B. C6, 06
        mov     ecx, r13d                               ; 2067 _ 44: 89. E9
        lea     rbp, [rbx+r8+60H]                       ; 206A _ 4A: 8D. 6C 03, 60
?_281:  cmp     r13d, eax                               ; 206F _ 41: 39. C5
        jle     ?_283                                   ; 2072 _ 7E, 47
        movsxd  r11, eax                                ; 2074 _ 4C: 63. D8
        movzx   r12d, byte [rbp+r11]                    ; 2077 _ 46: 0F B6. 64 1D, 00
        mov     r15d, r12d                              ; 207D _ 45: 89. E7
        xor     r12d, edx                               ; 2080 _ 41: 31. D4
        sar     r12d, 3                                 ; 2083 _ 41: C1. FC, 03
        and     r15d, 07H                               ; 2087 _ 41: 83. E7, 07
        movsxd  r8, r12d                                ; 208B _ 4D: 63. C4
        mov     r10, qword [rsi+r8*8+140H]              ; 208E _ 4E: 8B. 94 C6, 00000140
        and     r10, qword [rsi+r15*8+100H]             ; 2096 _ 4E: 23. 94 FE, 00000100
?_282:  bsf     r9, r10                                 ; 209E _ 4D: 0F BC. CA
        movsxd  r11, eax                                ; 20A2 _ 4C: 63. D8
        blsr    r10, r10                                ; 20A5 _ C4 C2 A8: F3. CA
        inc     eax                                     ; 20AA _ FF. C0
        test    r10, r10                                ; 20AC _ 4D: 85. D2
        mov     dword [rsp+r11*4+170H], r9d             ; 20AF _ 46: 89. 8C 9C, 00000170
        jnz     ?_282                                   ; 20B7 _ 75, E5
        jmp     ?_281                                   ; 20B9 _ EB, B4

?_283:  imul    r9, r14, 24                             ; 20BB _ 4D: 6B. CE, 18
        imul    rsi, r14, 6                             ; 20BF _ 49: 6B. F6, 06
        add     r14, 4                                  ; 20C3 _ 49: 83. C6, 04
        lea     rdx, [rbx+1CH]                          ; 20C7 _ 48: 8D. 53, 1C
        lea     r10, [rbx+r9+30H]                       ; 20CB _ 4E: 8D. 54 0B, 30
        mov     qword [rsp+20H], r10                    ; 20D0 _ 4C: 89. 54 24, 20
        lea     r9, [rsp+170H]                          ; 20D5 _ 4C: 8D. 8C 24, 00000170
        lea     r8, [rbx+rsi+6CH]                       ; 20DD _ 4C: 8D. 44 33, 6C
        call    _ZL12encode_pieceP13TBEntry_piecePhPiS2_.isra.0; 20E2 _ E8, FFFFF0F6
        mov     rcx, qword [rbx+r14*8]                  ; 20E7 _ 4A: 8B. 0C F3
        mov     rdx, rax                                ; 20EB _ 48: 89. C2
        call    _Z16decompress_pairsILb1EEhP9PairsDatay ; 20EE _ E8, FFFFEF50
        jmp     ?_292                                   ; 20F3 _ E9, 0000014C

?_284:  movzx   r12d, byte [rbx+60H]                    ; 20F8 _ 44: 0F B6. 63, 60
        lea     r8, [rsp+170H]                          ; 20FD _ 4C: 8D. 84 24, 00000170
        xor     r13d, r13d                              ; 2105 _ 45: 31. ED
        xor     r12d, edx                               ; 2108 _ 41: 31. D4
        mov     r9d, r12d                               ; 210B _ 45: 89. E1
        sar     r12d, 3                                 ; 210E _ 41: C1. FC, 03
        and     r9d, 07H                                ; 2112 _ 41: 83. E1, 07
        movsxd  r15, r12d                               ; 2116 _ 4D: 63. FC
        mov     r10, qword [rsi+r9*8+100H]              ; 2119 _ 4E: 8B. 94 CE, 00000100
        and     r10, qword [rsi+r15*8+140H]             ; 2121 _ 4E: 23. 94 FE, 00000140
?_285:  bsf     r14, r10                                ; 2129 _ 4D: 0F BC. F2
        lea     r9d, [r13+1H]                           ; 212D _ 45: 8D. 4D, 01
        xor     r14d, ecx                               ; 2131 _ 41: 31. CE
        blsr    r10, r10                                ; 2134 _ C4 C2 A8: F3. CA
        mov     dword [r8+r13*4], r14d                  ; 2139 _ 47: 89. 34 A8
        inc     r13                                     ; 213D _ 49: FF. C5
        test    r10, r10                                ; 2140 _ 4D: 85. D2
        jnz     ?_285                                   ; 2143 _ 75, E4
        movzx   r14d, byte [rbx+1CH]                    ; 2145 _ 44: 0F B6. 73, 1C
        xor     r11d, r11d                              ; 214A _ 45: 31. DB
?_286:  lea     ebp, [r11+1H]                           ; 214D _ 41: 8D. 6B, 01
        mov     r10d, dword [rsp+170H]                  ; 2151 _ 44: 8B. 94 24, 00000170
        cmp     ebp, r14d                               ; 2159 _ 44: 39. F5
        jge     ?_288                                   ; 215C _ 7D, 36
        movsxd  r15, dword [rsp+r11*4+174H]             ; 215E _ 4E: 63. BC 9C, 00000174
        lea     r13, [rel _ZL4flap]                     ; 2166 _ 4C: 8D. 2D, 00000700(rel)
        movsxd  rbp, r10d                               ; 216D _ 49: 63. EA
        mov     r12, r15                                ; 2170 _ 4D: 89. FC
        mov     r15b, byte [r13+r15]                    ; 2173 _ 47: 8A. 7C 3D, 00
        cmp     byte [r13+rbp], r15b                    ; 2178 _ 45: 38. 7C 2D, 00
        jbe     ?_287                                   ; 217D _ 76, 10
        mov     dword [rsp+170H], r12d                  ; 217F _ 44: 89. A4 24, 00000170
        mov     dword [rsp+r11*4+174H], r10d            ; 2187 _ 46: 89. 94 9C, 00000174
?_287:  inc     r11                                     ; 218F _ 49: FF. C3
        jmp     ?_286                                   ; 2192 _ EB, B9

?_288:  and     r10d, 07H                               ; 2194 _ 41: 83. E2, 07
        movsxd  r12, eax                                ; 2198 _ 4C: 63. E0
        lea     rax, [rel _ZL12file_to_file]            ; 219B _ 48: 8D. 05, 00000680(rel)
        movzx   ebp, byte [rax+r10]                     ; 21A2 _ 42: 0F B6. 2C 10
        imul    r11, r12, 6                             ; 21A7 _ 4D: 6B. DC, 06
        imul    r15, rbp, 88                            ; 21AB _ 4C: 6B. FD, 58
        lea     r10, [r11+r15+60H]                      ; 21AF _ 4F: 8D. 54 3B, 60
        movzx   r11d, byte [rbx+19H]                    ; 21B4 _ 44: 0F B6. 5B, 19
        add     r10, rbx                                ; 21B9 _ 49: 01. DA
?_289:  cmp     r11d, r9d                               ; 21BC _ 45: 39. CB
        jle     ?_291                                   ; 21BF _ 7E, 47
        movsxd  r14, r9d                                ; 21C1 _ 4D: 63. F1
        movzx   eax, byte [r10+r14]                     ; 21C4 _ 43: 0F B6. 04 32
        mov     r15d, eax                               ; 21C9 _ 41: 89. C7
        xor     eax, edx                                ; 21CC _ 31. D0
        sar     eax, 3                                  ; 21CE _ C1. F8, 03
        and     r15d, 07H                               ; 21D1 _ 41: 83. E7, 07
        cdqe                                            ; 21D5 _ 48: 98
        mov     rax, qword [rsi+rax*8+140H]             ; 21D7 _ 48: 8B. 84 C6, 00000140
        and     rax, qword [rsi+r15*8+100H]             ; 21DF _ 4A: 23. 84 FE, 00000100
?_290:  bsf     r13, rax                                ; 21E7 _ 4C: 0F BC. E8
        movsxd  r14, r9d                                ; 21EB _ 4D: 63. F1
        xor     r13d, ecx                               ; 21EE _ 41: 31. CD
        blsr    rax, rax                                ; 21F1 _ C4 E2 F8: F3. C8
        inc     r9d                                     ; 21F6 _ 41: FF. C1
        test    rax, rax                                ; 21F9 _ 48: 85. C0
        mov     dword [rsp+r14*4+170H], r13d            ; 21FC _ 46: 89. AC B4, 00000170
        jnz     ?_290                                   ; 2204 _ 75, E1
        jmp     ?_289                                   ; 2206 _ EB, B4

?_291:  imul    r9, rbp, 88                             ; 2208 _ 4C: 6B. CD, 58
        imul    rdx, r12, 6                             ; 220C _ 49: 6B. D4, 06
        imul    rsi, r12, 24                            ; 2210 _ 49: 6B. F4, 18
        lea     r13, [r9+rdx+60H]                       ; 2214 _ 4D: 8D. 6C 11, 60
        lea     rcx, [rsi+r9+30H]                       ; 2219 _ 4A: 8D. 4C 0E, 30
        lea     rdx, [rbx+r13+0CH]                      ; 221E _ 4A: 8D. 54 2B, 0C
        lea     r9, [rbx+rcx]                           ; 2223 _ 4C: 8D. 0C 0B
        mov     rcx, rbx                                ; 2227 _ 48: 89. D9
        call    _ZL11encode_pawnP12TBEntry_pawnPhPiS2_  ; 222A _ E8, FFFFF2FA
        imul    r8, rbp, 11                             ; 222F _ 4C: 6B. C5, 0B
        mov     rdx, rax                                ; 2233 _ 48: 89. C2
        lea     r12, [r12+r8+4H]                        ; 2236 _ 4F: 8D. 64 04, 04
        mov     rcx, qword [rbx+r12*8]                  ; 223B _ 4A: 8B. 0C E3
        call    _Z16decompress_pairsILb1EEhP9PairsDatay ; 223F _ E8, FFFFEDFF
?_292:  movzx   ebx, al                                 ; 2244 _ 0F B6. D8
        lea     r15d, [rbx-2H]                          ; 2247 _ 44: 8D. 7B, FE
        jmp     ?_237                                   ; 224B _ E9, FFFFF6C6

?_293:  ; Local function
        mov     eax, r15d                               ; 2250 _ 44: 89. F8
        add     rsp, 1080                               ; 2253 _ 48: 81. C4, 00000438
        pop     rbx                                     ; 225A _ 5B
        pop     rsi                                     ; 225B _ 5E
        pop     rdi                                     ; 225C _ 5F
        pop     rbp                                     ; 225D _ 5D
        pop     r12                                     ; 225E _ 41: 5C
        pop     r13                                     ; 2260 _ 41: 5D
        pop     r14                                     ; 2262 _ 41: 5E
        pop     r15                                     ; 2264 _ 41: 5F
        ret                                             ; 2266 _ C3

_ZL17calc_factors_pawnPiiiiPhi:; Local function
        push    r15                                     ; 2267 _ 41: 57
        push    r14                                     ; 2269 _ 41: 56
        push    r13                                     ; 226B _ 41: 55
        push    r12                                     ; 226D _ 41: 54
        push    rbp                                     ; 226F _ 55
        push    rdi                                     ; 2270 _ 57
        push    rsi                                     ; 2271 _ 56
        push    rbx                                     ; 2272 _ 53
        mov     rbx, qword [rsp+68H]                    ; 2273 _ 48: 8B. 5C 24, 68
        cmp     r9d, 14                                 ; 2278 _ 41: 83. F9, 0E
        mov     r13d, edx                               ; 227C _ 41: 89. D5
        movzx   r11d, byte [rbx]                        ; 227F _ 44: 0F B6. 1B
        jg      ?_294                                   ; 2283 _ 7F, 08
        movzx   edx, byte [rbx+r11]                     ; 2285 _ 42: 0F B6. 14 1B
        add     r11d, edx                               ; 228A _ 41: 01. D3
?_294:  movsxd  r15, dword [rsp+70H]                    ; 228D _ 4C: 63. 7C 24, 70
        mov     esi, 64                                 ; 2292 _ BE, 00000040
        mov     r10d, 1                                 ; 2297 _ 41: BA, 00000001
        xor     edi, edi                                ; 229D _ 31. FF
        sub     esi, r11d                               ; 229F _ 44: 29. DE
?_295:  cmp     edi, r8d                                ; 22A2 _ 44: 39. C7
        jnz     ?_298                                   ; 22A5 _ 75, 32
        mov     dword [rcx], r10d                       ; 22A7 _ 44: 89. 11
        movzx   eax, byte [rbx]                         ; 22AA _ 0F B6. 03
        lea     rbp, [rel _ZL7pfactor]                  ; 22AD _ 48: 8D. 2D, 00000040(rel)
        dec     eax                                     ; 22B4 _ FF. C8
        cdqe                                            ; 22B6 _ 48: 98
        lea     rdx, [r15+rax*4]                        ; 22B8 _ 49: 8D. 14 87
        movsxd  r12, dword [rbp+rdx*4]                  ; 22BC _ 4C: 63. 64 95, 00
        imul    r10, r12                                ; 22C1 _ 4D: 0F AF. D4
        jmp     ?_297                                   ; 22C5 _ EB, 0E

?_296:  cdq                                             ; 22C7 _ 99
        mov     rcx, qword [rsp+48H]                    ; 22C8 _ 48: 8B. 4C 24, 48
        idiv    ebp                                     ; 22CD _ F7. FD
        cdqe                                            ; 22CF _ 48: 98
        imul    r10, rax                                ; 22D1 _ 4C: 0F AF. D0
?_297:  inc     edi                                     ; 22D5 _ FF. C7
        jmp     ?_295                                   ; 22D7 _ EB, C9

?_298:  ; Local function
        cmp     r11d, r13d                              ; 22D9 _ 45: 39. EB
        jge     ?_304                                   ; 22DC _ 0F 8D, 00000085
        cmp     edi, r9d                                ; 22E2 _ 44: 39. CF
        jnz     ?_301                                   ; 22E5 _ 75, 3E
?_299:  movzx   eax, byte [rbx]                         ; 22E7 _ 0F B6. 03
        mov     r12d, 48                                ; 22EA _ 41: BC, 00000030
        mov     ebp, 1                                  ; 22F0 _ BD, 00000001
        mov     qword [rsp+48H], rcx                    ; 22F5 _ 48: 89. 4C 24, 48
        mov     dword [rcx+rax*4], r10d                 ; 22FA _ 44: 89. 14 81
        movzx   edx, byte [rbx]                         ; 22FE _ 0F B6. 13
        sub     r12d, edx                               ; 2301 _ 41: 29. D4
        movzx   r14d, byte [rbx+rdx]                    ; 2304 _ 44: 0F B6. 34 13
        mov     edx, 1                                  ; 2309 _ BA, 00000001
        mov     eax, r12d                               ; 230E _ 44: 89. E0
?_300:  cmp     r14d, edx                               ; 2311 _ 41: 39. D6
        jle     ?_296                                   ; 2314 _ 7E, B1
        mov     ecx, r12d                               ; 2316 _ 44: 89. E1
        sub     ecx, edx                                ; 2319 _ 29. D1
        inc     edx                                     ; 231B _ FF. C2
        imul    eax, ecx                                ; 231D _ 0F AF. C1
        imul    ebp, edx                                ; 2320 _ 0F AF. EA
        jmp     ?_300                                   ; 2323 _ EB, EC

?_301:  movsxd  rbp, r11d                               ; 2325 _ 49: 63. EB
        mov     eax, esi                                ; 2328 _ 89. F0
        mov     r12d, 1                                 ; 232A _ 41: BC, 00000001
        mov     dword [rcx+rbp*4], r10d                 ; 2330 _ 44: 89. 14 A9
        movzx   ebp, byte [rbx+rbp]                     ; 2334 _ 0F B6. 2C 2B
        mov     edx, 1                                  ; 2338 _ BA, 00000001
?_302:  cmp     ebp, edx                                ; 233D _ 39. D5
        jle     ?_303                                   ; 233F _ 7E, 12
        mov     r14d, esi                               ; 2341 _ 41: 89. F6
        sub     r14d, edx                               ; 2344 _ 41: 29. D6
        inc     edx                                     ; 2347 _ FF. C2
        imul    eax, r14d                               ; 2349 _ 41: 0F AF. C6
        imul    r12d, edx                               ; 234D _ 44: 0F AF. E2
        jmp     ?_302                                   ; 2351 _ EB, EA

?_303:  cdq                                             ; 2353 _ 99
        sub     esi, ebp                                ; 2354 _ 29. EE
        add     r11d, ebp                               ; 2356 _ 41: 01. EB
        idiv    r12d                                    ; 2359 _ 41: F7. FC
        cdqe                                            ; 235C _ 48: 98
        imul    r10, rax                                ; 235E _ 4C: 0F AF. D0
        jmp     ?_297                                   ; 2362 _ E9, FFFFFF6E

?_304:  ; Local function
        cmp     edi, r9d                                ; 2367 _ 44: 39. CF
        je      ?_299                                   ; 236A _ 0F 84, FFFFFF77
        mov     rax, r10                                ; 2370 _ 4C: 89. D0
        pop     rbx                                     ; 2373 _ 5B
        pop     rsi                                     ; 2374 _ 5E
        pop     rdi                                     ; 2375 _ 5F
        pop     rbp                                     ; 2376 _ 5D
        pop     r12                                     ; 2377 _ 41: 5C
        pop     r13                                     ; 2379 _ 41: 5D
        pop     r14                                     ; 237B _ 41: 5E
        pop     r15                                     ; 237D _ 41: 5F
        ret                                             ; 237F _ C3

_ZL18calc_factors_piecePiiiPhh:; Local function
        push    r14                                     ; 2380 _ 41: 56
        push    r13                                     ; 2382 _ 41: 55
        push    r12                                     ; 2384 _ 41: 54
        push    rbp                                     ; 2386 _ 55
        push    rdi                                     ; 2387 _ 57
        push    rsi                                     ; 2388 _ 56
        push    rbx                                     ; 2389 _ 53
        mov     ebx, 64                                 ; 238A _ BB, 00000040
        mov     r11d, 1                                 ; 238F _ 41: BB, 00000001
        xor     edi, edi                                ; 2395 _ 31. FF
        movzx   esi, byte [r9]                          ; 2397 _ 41: 0F B6. 31
        movzx   r13d, byte [rsp+60H]                    ; 239B _ 44: 0F B6. 6C 24, 60
        mov     r12d, edx                               ; 23A1 _ 41: 89. D4
        sub     ebx, esi                                ; 23A4 _ 29. F3
?_305:  cmp     edi, r8d                                ; 23A6 _ 44: 39. C7
        jnz     ?_308                                   ; 23A9 _ 75, 2A
        lea     rax, [rel _ZZL18calc_factors_piecePiiiPhhE6pivfac]; 23AB _ 48: 8D. 05, 00000164(rel)
        mov     dword [rcx], r11d                       ; 23B2 _ 44: 89. 19
        movsxd  rbp, dword [rax+r13*4]                  ; 23B5 _ 4A: 63. 2C A8
        imul    r11, rbp                                ; 23B9 _ 4C: 0F AF. DD
        jmp     ?_307                                   ; 23BD _ EB, 12

?_306:  mov     eax, r10d                               ; 23BF _ 44: 89. D0
        sub     ebx, ebp                                ; 23C2 _ 29. EB
        add     esi, ebp                                ; 23C4 _ 01. EE
        cdq                                             ; 23C6 _ 99
        idiv    r14d                                    ; 23C7 _ 41: F7. FE
        movsxd  r10, eax                                ; 23CA _ 4C: 63. D0
        imul    r11, r10                                ; 23CD _ 4D: 0F AF. DA
?_307:  inc     edi                                     ; 23D1 _ FF. C7
        jmp     ?_305                                   ; 23D3 _ EB, D1

?_308:  ; Local function
        cmp     esi, r12d                               ; 23D5 _ 44: 39. E6
        jge     ?_310                                   ; 23D8 _ 7D, 2E
        movsxd  rax, esi                                ; 23DA _ 48: 63. C6
        mov     r10d, ebx                               ; 23DD _ 41: 89. DA
        mov     r14d, 1                                 ; 23E0 _ 41: BE, 00000001
        mov     dword [rcx+rax*4], r11d                 ; 23E6 _ 44: 89. 1C 81
        movzx   ebp, byte [r9+rax]                      ; 23EA _ 41: 0F B6. 2C 01
        mov     eax, 1                                  ; 23EF _ B8, 00000001
?_309:  cmp     ebp, eax                                ; 23F4 _ 39. C5
        jle     ?_306                                   ; 23F6 _ 7E, C7
        mov     edx, ebx                                ; 23F8 _ 89. DA
        sub     edx, eax                                ; 23FA _ 29. C2
        inc     eax                                     ; 23FC _ FF. C0
        imul    r10d, edx                               ; 23FE _ 44: 0F AF. D2
        imul    r14d, eax                               ; 2402 _ 44: 0F AF. F0
        jmp     ?_309                                   ; 2406 _ EB, EC

?_310:  ; Local function
        mov     rax, r11                                ; 2408 _ 4C: 89. D8
        pop     rbx                                     ; 240B _ 5B
        pop     rsi                                     ; 240C _ 5E
        pop     rdi                                     ; 240D _ 5F
        pop     rbp                                     ; 240E _ 5D
        pop     r12                                     ; 240F _ 41: 5C
        pop     r13                                     ; 2411 _ 41: 5D
        pop     r14                                     ; 2413 _ 41: 5E
        ret                                             ; 2415 _ C3

_Z10ReadUshortPh:; Function begin
        movzx   eax, byte [rcx+1H]                      ; 2416 _ 0F B6. 41, 01
        movzx   edx, byte [rcx]                         ; 241A _ 0F B6. 11
        shl     eax, 8                                  ; 241D _ C1. E0, 08
        or      eax, edx                                ; 2420 _ 09. D0
        ret                                             ; 2422 _ C3
; _Z10ReadUshortPh End of function

_Z10ReadUint32Ph:; Function begin
        movzx   eax, byte [rcx+1H]                      ; 2423 _ 0F B6. 41, 01
        movzx   r8d, byte [rcx]                         ; 2427 _ 44: 0F B6. 01
        shl     eax, 8                                  ; 242B _ C1. E0, 08
        mov     edx, eax                                ; 242E _ 89. C2
        movzx   eax, byte [rcx+2H]                      ; 2430 _ 0F B6. 41, 02
        movzx   ecx, byte [rcx+3H]                      ; 2434 _ 0F B6. 49, 03
        shl     eax, 16                                 ; 2438 _ C1. E0, 10
        or      eax, edx                                ; 243B _ 09. D0
        shl     ecx, 24                                 ; 243D _ C1. E1, 18
        or      eax, r8d                                ; 2440 _ 44: 09. C0
        or      eax, ecx                                ; 2443 _ 09. C8
        ret                                             ; 2445 _ C3
; _Z10ReadUint32Ph End of function

_Z14load_dtz_tablePcyy:; Function begin
        push    r15                                     ; 2446 _ 41: 57
        push    r14                                     ; 2448 _ 41: 56
        push    r13                                     ; 244A _ 41: 55
        push    r12                                     ; 244C _ 41: 54
        push    rbp                                     ; 244E _ 55
        push    rdi                                     ; 244F _ 57
        push    rsi                                     ; 2450 _ 56
        push    rbx                                     ; 2451 _ 53
        sub     rsp, 232                                ; 2452 _ 48: 81. EC, 000000E8
        lea     rbx, [rel _ZL7TB_hash]                  ; 2459 _ 48: 8D. 1D, 00000DC0(rel)
        mov     qword [rel ?_027], 0                    ; 2460 _ 48: C7. 05, 000007CC(rel), 00000000
        mov     rax, rdx                                ; 246B _ 48: 89. D0
        mov     qword [rel ?_026], r8                   ; 246E _ 4C: 89. 05, 000007C8(rel)
        shr     rax, 54                                 ; 2475 _ 48: C1. E8, 36
        mov     qword [rel _ZL9DTZ_table], rdx          ; 2479 _ 48: 89. 15, 000007C0(rel)
        imul    r8, rax, 80                             ; 2480 _ 4C: 6B. C0, 50
        add     rbx, r8                                 ; 2484 _ 4C: 01. C3
        lea     rsi, [rbx+50H]                          ; 2487 _ 48: 8D. 73, 50
?_311:  cmp     qword [rbx], rdx                        ; 248B _ 48: 39. 13
        jz      ?_312                                   ; 248E _ 74, 0E
        add     rbx, 16                                 ; 2490 _ 48: 83. C3, 10
        cmp     rbx, rsi                                ; 2494 _ 48: 39. F3
        jnz     ?_311                                   ; 2497 _ 75, F2
        jmp     ?_335                                   ; 2499 _ E9, 000003D1

?_312:  mov     rbp, qword [rbx+8H]                     ; 249E _ 48: 8B. 6B, 08
        mov     rdi, rcx                                ; 24A2 _ 48: 89. CF
        cmp     byte [rbp+1BH], 1                       ; 24A5 _ 80. 7D, 1B, 01
        sbb     rdx, rdx                                ; 24A9 _ 48: 19. D2
        and     dl, 50H                                 ; 24AC _ 80. E2, 50
        lea     rcx, [rdx+110H]                         ; 24AF _ 48: 8D. 8A, 00000110
        call    malloc                                  ; 24B6 _ E8, 00000000(rel)
        lea     rdx, [rel ?_499]                        ; 24BB _ 48: 8D. 15, 00000144(rel)
        mov     rcx, rdi                                ; 24C2 _ 48: 89. F9
        lea     r8, [rax+10H]                           ; 24C5 _ 4C: 8D. 40, 10
        mov     rbx, rax                                ; 24C9 _ 48: 89. C3
        call    _ZL8map_filePKcS0_Py                    ; 24CC _ E8, FFFFE94D
        mov     r11b, byte [rbp+1BH]                    ; 24D1 _ 44: 8A. 5D, 1B
        mov     rcx, qword [rbp+8H]                     ; 24D5 _ 48: 8B. 4D, 08
        mov     qword [rbx], rax                        ; 24D9 _ 48: 89. 03
        mov     r9b, byte [rbp+19H]                     ; 24DC _ 44: 8A. 4D, 19
        mov     r10b, byte [rbp+1AH]                    ; 24E0 _ 44: 8A. 55, 1A
        test    r11b, r11b                              ; 24E4 _ 45: 84. DB
        mov     byte [rbx+1BH], r11b                    ; 24E7 _ 44: 88. 5B, 1B
        mov     qword [rbx+8H], rcx                     ; 24EB _ 48: 89. 4B, 08
        mov     byte [rbx+19H], r9b                     ; 24EF _ 44: 88. 4B, 19
        mov     byte [rbx+1AH], r10b                    ; 24F3 _ 44: 88. 53, 1A
        jz      ?_313                                   ; 24F7 _ 74, 12
        mov     r13b, byte [rbp+1CH]                    ; 24F9 _ 44: 8A. 6D, 1C
        mov     byte [rbx+1CH], r13b                    ; 24FD _ 44: 88. 6B, 1C
        mov     r14b, byte [rbp+1DH]                    ; 2501 _ 44: 8A. 75, 1D
        mov     byte [rbx+1DH], r14b                    ; 2505 _ 44: 88. 73, 1D
        jmp     ?_314                                   ; 2509 _ EB, 08

?_313:  mov     r12b, byte [rbp+1CH]                    ; 250B _ 44: 8A. 65, 1C
        mov     byte [rbx+1CH], r12b                    ; 250F _ 44: 88. 63, 1C
?_314:  test    rax, rax                                ; 2513 _ 48: 85. C0
        je      ?_333                                   ; 2516 _ 0F 84, 00000331
        cmp     byte [rax], -41                         ; 251C _ 80. 38, D7
        jnz     ?_315                                   ; 251F _ 75, 12
        cmp     byte [rax+1H], 102                      ; 2521 _ 80. 78, 01, 66
        jnz     ?_315                                   ; 2525 _ 75, 0C
        cmp     byte [rax+2H], 12                       ; 2527 _ 80. 78, 02, 0C
        jnz     ?_315                                   ; 252B _ 75, 06
        cmp     byte [rax+3H], -91                      ; 252D _ 80. 78, 03, A5
        jz      ?_316                                   ; 2531 _ 74, 11
?_315:  lea     rcx, [rel ?_498]                        ; 2533 _ 48: 8D. 0D, 00000132(rel)
        call    _ZL6printfPKcz                          ; 253A _ E8, FFFFE463
        jmp     ?_333                                   ; 253F _ E9, 00000309

?_316:  mov     r15b, byte [rax+4H]                     ; 2544 _ 44: 8A. 78, 04
        lea     rdi, [rax+5H]                           ; 2548 _ 48: 8D. 78, 05
        and     r15d, 02H                               ; 254C _ 41: 83. E7, 02
        cmp     r15b, 1                                 ; 2550 _ 41: 80. FF, 01
        sbb     esi, esi                                ; 2554 _ 19. F6
        and     esi, 0FFFFFFFDH                         ; 2556 _ 83. E6, FD
        add     esi, 4                                  ; 2559 _ 83. C6, 04
        cmp     byte [rbx+1BH], 0                       ; 255C _ 80. 7B, 1B, 00
        jne     ?_321                                   ; 2560 _ 0F 85, 000000FE
        movzx   r8d, byte [rbx+19H]                     ; 2566 _ 44: 0F B6. 43, 19
        xor     r15d, r15d                              ; 256B _ 45: 31. FF
?_317:  cmp     r8d, r15d                               ; 256E _ 45: 39. F8
        jle     ?_318                                   ; 2571 _ 7E, 12
        mov     sil, byte [rax+r15+6H]                  ; 2573 _ 42: 8A. 74 38, 06
        and     esi, 0FH                                ; 2578 _ 83. E6, 0F
        mov     byte [rbx+r15+40H], sil                 ; 257B _ 42: 88. 74 3B, 40
        inc     r15                                     ; 2580 _ 49: FF. C7
        jmp     ?_317                                   ; 2583 _ EB, E9

?_318:  lea     rbp, [rbx+46H]                          ; 2585 _ 48: 8D. 6B, 46
        mov     sil, byte [rax+5H]                      ; 2589 _ 40: 8A. 70, 05
        lea     rdx, [rbx+1CH]                          ; 258D _ 48: 8D. 53, 1C
        mov     r8, rbp                                 ; 2591 _ 49: 89. E8
        lea     rcx, [rbx+19H]                          ; 2594 _ 48: 8D. 4B, 19
        lea     r9, [rbx+40H]                           ; 2598 _ 4C: 8D. 4B, 40
        call    _ZL14set_norm_pieceP13TBEntry_piecePhS1_.isra.2; 259C _ E8, 0000153B
        movzx   r10d, byte [rbx+1CH]                    ; 25A1 _ 44: 0F B6. 53, 1C
        and     esi, 0FH                                ; 25A6 _ 83. E6, 0F
        mov     r9, rbp                                 ; 25A9 _ 49: 89. E9
        movzx   edx, byte [rbx+19H]                     ; 25AC _ 0F B6. 53, 19
        lea     rcx, [rbx+28H]                          ; 25B0 _ 48: 8D. 4B, 28
        mov     r8d, esi                                ; 25B4 _ 41: 89. F0
        mov     dword [rsp+20H], r10d                   ; 25B7 _ 44: 89. 54 24, 20
        call    _ZL18calc_factors_piecePiiiPhh          ; 25BC _ E8, FFFFFDBF
        movzx   edx, byte [rbx+19H]                     ; 25C1 _ 0F B6. 53, 19
        lea     r8, [rsp+80H]                           ; 25C5 _ 4C: 8D. 84 24, 00000080
        mov     dword [rsp+28H], 0                      ; 25CD _ C7. 44 24, 28, 00000000
        lea     r9, [rdi+rdx+1H]                        ; 25D5 _ 4C: 8D. 4C 17, 01
        mov     rdx, rax                                ; 25DA _ 48: 89. C2
        lea     rdi, [rbx+4CH]                          ; 25DD _ 48: 8D. 7B, 4C
        mov     rcx, r9                                 ; 25E1 _ 4C: 89. C9
        and     ecx, 01H                                ; 25E4 _ 83. E1, 01
        mov     qword [rsp+20H], rdi                    ; 25E7 _ 48: 89. 7C 24, 20
        add     rcx, r9                                 ; 25EC _ 4C: 01. C9
        lea     r9, [rsp+58H]                           ; 25EF _ 4C: 8D. 4C 24, 58
        call    _ZL11setup_pairsPhyPyPS_S_i             ; 25F4 _ E8, FFFFE3D0
        mov     r14, qword [rsp+58H]                    ; 25F9 _ 4C: 8B. 74 24, 58
        test    byte [rbx+4CH], 02H                     ; 25FE _ F6. 43, 4C, 02
        mov     qword [rbx+20H], rax                    ; 2602 _ 48: 89. 43, 20
        mov     qword [rbx+58H], r14                    ; 2606 _ 4C: 89. 73, 58
        jz      ?_320                                   ; 260A _ 74, 30
        mov     rcx, r14                                ; 260C _ 4C: 89. F1
        xor     r11d, r11d                              ; 260F _ 45: 31. DB
?_319:  lea     r12, [rcx+1H]                           ; 2612 _ 4C: 8D. 61, 01
        sub     r12, r14                                ; 2616 _ 4D: 29. F4
        mov     word [rbx+r11+4EH], r12w                ; 2619 _ 66 46: 89. 64 1B, 4E
        movzx   r13d, byte [rcx]                        ; 261F _ 44: 0F B6. 29
        add     r11, 2                                  ; 2623 _ 49: 83. C3, 02
        cmp     r11, 8                                  ; 2627 _ 49: 83. FB, 08
        lea     rcx, [rcx+r13+1H]                       ; 262B _ 4A: 8D. 4C 29, 01
        jnz     ?_319                                   ; 2630 _ 75, E0
        mov     r14, rcx                                ; 2632 _ 49: 89. CE
        and     r14d, 01H                               ; 2635 _ 41: 83. E6, 01
        add     r14, rcx                                ; 2639 _ 49: 01. CE
?_320:  mov     qword [rax], r14                        ; 263C _ 4C: 89. 30
        add     r14, qword [rsp+80H]                    ; 263F _ 4C: 03. B4 24, 00000080
        mov     qword [rax+8H], r14                     ; 2647 _ 4C: 89. 70, 08
        add     r14, qword [rsp+88H]                    ; 264B _ 4C: 03. B4 24, 00000088
        add     r14, 63                                 ; 2653 _ 49: 83. C6, 3F
        and     r14, 0FFFFFFFFFFFFFFC0H                 ; 2657 _ 49: 83. E6, C0
        mov     qword [rax+10H], r14                    ; 265B _ 4C: 89. 70, 10
        jmp     ?_334                                   ; 265F _ E9, 00000204

?_321:  cmp     byte [rbx+1DH], 1                       ; 2664 _ 80. 7B, 1D, 01
        lea     r15, [rsp+60H]                          ; 2668 _ 4C: 8D. 7C 24, 60
        mov     r14, rbx                                ; 266D _ 49: 89. DE
        mov     rbp, rbx                                ; 2670 _ 48: 89. DD
        sbb     eax, eax                                ; 2673 _ 19. C0
        xor     r12d, r12d                              ; 2675 _ 45: 31. E4
        add     eax, 2                                  ; 2678 _ 83. C0, 02
        mov     dword [rsp+48H], eax                    ; 267B _ 89. 44 24, 48
?_322:  mov     r8b, byte [rbx+1DH]                     ; 267F _ 44: 8A. 43, 1D
        mov     r11d, r12d                              ; 2683 _ 45: 89. E3
        mov     r13d, 15                                ; 2686 _ 41: BD, 0000000F
        mov     dl, byte [rdi]                          ; 268C _ 8A. 17
        cmp     r8b, 1                                  ; 268E _ 41: 80. F8, 01
        sbb     eax, eax                                ; 2692 _ 19. C0
        and     edx, 0FH                                ; 2694 _ 83. E2, 0F
        add     eax, 2                                  ; 2697 _ 83. C0, 02
        test    r8b, r8b                                ; 269A _ 45: 84. C0
        mov     dword [rsp+3CH], edx                    ; 269D _ 89. 54 24, 3C
        jz      ?_323                                   ; 26A1 _ 74, 08
        mov     r13b, byte [rdi+1H]                     ; 26A3 _ 44: 8A. 6F, 01
        and     r13d, 0FH                               ; 26A7 _ 41: 83. E5, 0F
?_323:  movzx   ecx, byte [rbx+19H]                     ; 26AB _ 0F B6. 4B, 19
        cdqe                                            ; 26AF _ 48: 98
        xor     r9d, r9d                                ; 26B1 _ 45: 31. C9
        add     rax, rdi                                ; 26B4 _ 48: 01. F8
?_324:  cmp     ecx, r9d                                ; 26B7 _ 44: 39. C9
        jle     ?_325                                   ; 26BA _ 7E, 12
        mov     r8b, byte [rax+r9]                      ; 26BC _ 46: 8A. 04 08
        and     r8d, 0FH                                ; 26C0 _ 41: 83. E0, 0F
        mov     byte [rbp+r9+40H], r8b                  ; 26C4 _ 46: 88. 44 0D, 40
        inc     r9                                      ; 26C9 _ 49: FF. C1
        jmp     ?_324                                   ; 26CC _ EB, E9

?_325:  lea     rcx, [rbp+46H]                          ; 26CE _ 48: 8D. 4D, 46
        mov     dword [rsp+4CH], r11d                   ; 26D2 _ 44: 89. 5C 24, 4C
        lea     r8, [rbp+40H]                           ; 26D7 _ 4C: 8D. 45, 40
        mov     rdx, rcx                                ; 26DB _ 48: 89. CA
        mov     qword [rsp+40H], rcx                    ; 26DE _ 48: 89. 4C 24, 40
        mov     rcx, rbx                                ; 26E3 _ 48: 89. D9
        call    _ZL13set_norm_pawnP12TBEntry_pawnPhS1_  ; 26E6 _ E8, FFFFE6BB
        mov     r9d, dword [rsp+4CH]                    ; 26EB _ 44: 8B. 4C 24, 4C
        lea     rcx, [rbp+28H]                          ; 26F0 _ 48: 8D. 4D, 28
        add     rbp, 48                                 ; 26F4 _ 48: 83. C5, 30
        mov     r10, qword [rsp+40H]                    ; 26F8 _ 4C: 8B. 54 24, 40
        movzx   edx, byte [rbx+19H]                     ; 26FD _ 0F B6. 53, 19
        mov     r8d, dword [rsp+3CH]                    ; 2701 _ 44: 8B. 44 24, 3C
        mov     dword [rsp+28H], r9d                    ; 2706 _ 44: 89. 4C 24, 28
        mov     r9d, r13d                               ; 270B _ 45: 89. E9
        mov     qword [rsp+20H], r10                    ; 270E _ 4C: 89. 54 24, 20
        call    _ZL17calc_factors_pawnPiiiiPhi          ; 2713 _ E8, FFFFFB4F
        mov     qword [r15+r12*8], rax                  ; 2718 _ 4B: 89. 04 E7
        movzx   eax, byte [rbx+19H]                     ; 271C _ 0F B6. 43, 19
        inc     r12                                     ; 2720 _ 49: FF. C4
        add     eax, dword [rsp+48H]                    ; 2723 _ 03. 44 24, 48
        cdqe                                            ; 2727 _ 48: 98
        add     rdi, rax                                ; 2729 _ 48: 01. C7
        cmp     r12, 4                                  ; 272C _ 49: 83. FC, 04
        jne     ?_322                                   ; 2730 _ 0F 85, FFFFFF49
        lea     r13, [rsp+80H]                          ; 2736 _ 4C: 8D. AC 24, 00000080
        mov     rcx, rdi                                ; 273E _ 48: 89. F9
        lea     r12, [rsp+58H]                          ; 2741 _ 4C: 8D. 64 24, 58
        and     ecx, 01H                                ; 2746 _ 83. E1, 01
        mov     rbp, r13                                ; 2749 _ 4C: 89. ED
        add     rcx, rdi                                ; 274C _ 48: 01. F9
        xor     edi, edi                                ; 274F _ 31. FF
?_326:  mov     rdx, qword [r15+rdi*8]                  ; 2751 _ 49: 8B. 14 FF
        lea     r11, [rbx+rdi+0E0H]                     ; 2755 _ 4C: 8D. 9C 3B, 000000E0
        mov     r8, r13                                 ; 275D _ 4D: 89. E8
        mov     dword [rsp+28H], 0                      ; 2760 _ C7. 44 24, 28, 00000000
        mov     qword [rsp+20H], r11                    ; 2768 _ 4C: 89. 5C 24, 20
        mov     r9, r12                                 ; 276D _ 4D: 89. E1
        add     r13, 24                                 ; 2770 _ 49: 83. C5, 18
        call    _ZL11setup_pairsPhyPyPS_S_i             ; 2774 _ E8, FFFFE250
        imul    r8, rdi, 48                             ; 2779 _ 4C: 6B. C7, 30
        inc     rdi                                     ; 277D _ 48: FF. C7
        mov     rcx, qword [rsp+58H]                    ; 2780 _ 48: 8B. 4C 24, 58
        cmp     esi, edi                                ; 2785 _ 39. FE
        mov     qword [rbx+r8+20H], rax                 ; 2787 _ 4A: 89. 44 03, 20
        jg      ?_326                                   ; 278C _ 7F, C3
        mov     r15, rcx                                ; 278E _ 49: 89. CF
        mov     qword [rbx+108H], rcx                   ; 2791 _ 48: 89. 8B, 00000108
        xor     r9d, r9d                                ; 2798 _ 45: 31. C9
?_327:  test    byte [rbx+r9+0E0H], 02H                 ; 279B _ 42: F6. 84 0B, 000000E0, 02
        jz      ?_329                                   ; 27A4 _ 74, 24
        xor     edx, edx                                ; 27A6 _ 31. D2
?_328:  lea     r10, [rcx+1H]                           ; 27A8 _ 4C: 8D. 51, 01
        sub     r10, r15                                ; 27AC _ 4D: 29. FA
        mov     word [r14+rdx+0E4H], r10w               ; 27AF _ 66 45: 89. 94 16, 000000E4
        movzx   eax, byte [rcx]                         ; 27B8 _ 0F B6. 01
        add     rdx, 2                                  ; 27BB _ 48: 83. C2, 02
        cmp     rdx, 8                                  ; 27BF _ 48: 83. FA, 08
        lea     rcx, [rcx+rax+1H]                       ; 27C3 _ 48: 8D. 4C 01, 01
        jnz     ?_328                                   ; 27C8 _ 75, DE
?_329:  inc     r9                                      ; 27CA _ 49: FF. C1
        add     r14, 8                                  ; 27CD _ 49: 83. C6, 08
        cmp     esi, r9d                                ; 27D1 _ 44: 39. CE
        jg      ?_327                                   ; 27D4 _ 7F, C5
        mov     r14, rcx                                ; 27D6 _ 49: 89. CE
        xor     r13d, r13d                              ; 27D9 _ 45: 31. ED
        xor     edi, edi                                ; 27DC _ 31. FF
        and     r14d, 01H                               ; 27DE _ 41: 83. E6, 01
        add     rcx, r14                                ; 27E2 _ 4C: 01. F1
?_330:  mov     r12, qword [rbx+r13*2+20H]              ; 27E5 _ 4E: 8B. 64 6B, 20
        inc     edi                                     ; 27EA _ FF. C7
        mov     qword [r12], rcx                        ; 27EC _ 49: 89. 0C 24
        add     rcx, qword [rbp+r13]                    ; 27F0 _ 4A: 03. 4C 2D, 00
        add     r13, 24                                 ; 27F5 _ 49: 83. C5, 18
        cmp     edi, esi                                ; 27F9 _ 39. F7
        jnz     ?_330                                   ; 27FB _ 75, E8
        lea     r8, [rbp+8H]                            ; 27FD _ 4C: 8D. 45, 08
        xor     r11d, r11d                              ; 2801 _ 45: 31. DB
        xor     r15d, r15d                              ; 2804 _ 45: 31. FF
?_331:  mov     r9, qword [rbx+r11*2+20H]               ; 2807 _ 4E: 8B. 4C 5B, 20
        inc     r15d                                    ; 280C _ 41: FF. C7
        mov     qword [r9+8H], rcx                      ; 280F _ 49: 89. 49, 08
        add     rcx, qword [r8+r11]                     ; 2813 _ 4B: 03. 0C 18
        add     r11, 24                                 ; 2817 _ 49: 83. C3, 18
        cmp     r15d, esi                               ; 281B _ 41: 39. F7
        jnz     ?_331                                   ; 281E _ 75, E7
        lea     rbp, [rbp+10H]                          ; 2820 _ 48: 8D. 6D, 10
        xor     edx, edx                                ; 2824 _ 31. D2
        xor     r10d, r10d                              ; 2826 _ 45: 31. D2
?_332:  mov     rax, qword [rbx+rdx*2+20H]              ; 2829 _ 48: 8B. 44 53, 20
        add     rcx, 63                                 ; 282E _ 48: 83. C1, 3F
        inc     r10d                                    ; 2832 _ 41: FF. C2
        and     rcx, 0FFFFFFFFFFFFFFC0H                 ; 2835 _ 48: 83. E1, C0
        mov     qword [rax+10H], rcx                    ; 2839 _ 48: 89. 48, 10
        add     rcx, qword [rbp+rdx]                    ; 283D _ 48: 03. 4C 15, 00
        add     rdx, 24                                 ; 2842 _ 48: 83. C2, 18
        cmp     r10d, esi                               ; 2846 _ 41: 39. F2
        jnz     ?_332                                   ; 2849 _ 75, DE
        jmp     ?_334                                   ; 284B _ EB, 1B

?_333:  mov     rcx, rbx                                ; 284D _ 48: 89. D9
        add     rsp, 232                                ; 2850 _ 48: 81. C4, 000000E8
        pop     rbx                                     ; 2857 _ 5B
        pop     rsi                                     ; 2858 _ 5E
        pop     rdi                                     ; 2859 _ 5F
        pop     rbp                                     ; 285A _ 5D
        pop     r12                                     ; 285B _ 41: 5C
        pop     r13                                     ; 285D _ 41: 5D
        pop     r14                                     ; 285F _ 41: 5E
        pop     r15                                     ; 2861 _ 41: 5F
        jmp     free                                    ; 2863 _ E9, 00000000(rel)

?_334:  mov     qword [rel ?_027], rbx                  ; 2868 _ 48: 89. 1D, 000007D0(rel)
?_335:  add     rsp, 232                                ; 286F _ 48: 81. C4, 000000E8
        pop     rbx                                     ; 2876 _ 5B
        pop     rsi                                     ; 2877 _ 5E
        pop     rdi                                     ; 2878 _ 5F
        pop     rbp                                     ; 2879 _ 5D
        pop     r12                                     ; 287A _ 41: 5C
        pop     r13                                     ; 287C _ 41: 5D
        pop     r14                                     ; 287E _ 41: 5E
        pop     r15                                     ; 2880 _ 41: 5F
        ret                                             ; 2882 _ C3
; _Z14load_dtz_tablePcyy End of function

_Z16is_little_endianv:; Function begin
        mov     al, 1                                   ; 2883 _ B0, 01
        ret                                             ; 2885 _ C3
; _Z16is_little_endianv End of function

_ZN10Tablebases9probe_wdlER8PositionPi:; Function begin
        push    r15                                     ; 2886 _ 41: 57
        push    r14                                     ; 2888 _ 41: 56
        push    r13                                     ; 288A _ 41: 55
        push    r12                                     ; 288C _ 41: 54
        push    rbp                                     ; 288E _ 55
        push    rdi                                     ; 288F _ 57
        push    rsi                                     ; 2890 _ 56
        push    rbx                                     ; 2891 _ 53
        sub     rsp, 1784                               ; 2892 _ 48: 81. EC, 000006F8
        mov     r8d, 2                                  ; 2899 _ 41: B8, 00000002
        mov     rbx, rcx                                ; 289F _ 48: 89. CB
        mov     dword [rdx], 1                          ; 28A2 _ C7. 02, 00000001
        mov     r9, rdx                                 ; 28A8 _ 49: 89. D1
        mov     r13, rdx                                ; 28AB _ 49: 89. D5
        mov     edx, 4294967294                         ; 28AE _ BA, FFFFFFFE
        call    _ZL8probe_abR8PositioniiPi              ; 28B3 _ E8, FFFFEEE0
        mov     rdx, qword [rbx+3B8H]                   ; 28B8 _ 48: 8B. 93, 000003B8
        mov     r12d, eax                               ; 28BF _ 41: 89. C4
        cmp     qword [rdx+28H], 64                     ; 28C2 _ 48: 83. 7A, 28, 40
        je      ?_352                                   ; 28C7 _ 0F 84, 000001AF
        cmp     dword [r13], 0                          ; 28CD _ 41: 83. 7D, 00, 00
        jnz     ?_337                                   ; 28D2 _ 75, 07
?_336:  xor     eax, eax                                ; 28D4 _ 31. C0
        jmp     ?_352                                   ; 28D6 _ E9, 000001A1

?_337:  cmp     qword [rdx+38H], 0                      ; 28DB _ 48: 83. 7A, 38, 00
        lea     rsi, [rsp+0F0H]                         ; 28E0 _ 48: 8D. B4 24, 000000F0
        mov     rcx, rbx                                ; 28E8 _ 48: 89. D9
        mov     rdx, rsi                                ; 28EB _ 48: 89. F2
        jnz     ?_338                                   ; 28EE _ 75, 0A
        call    _Z8generateIL7GenType0EEP7ExtMoveRK8PositionS2_; 28F0 _ E8, 00000000(rel)
        mov     rdi, rax                                ; 28F5 _ 48: 89. C7
        jmp     ?_339                                   ; 28F8 _ EB, 08

?_338:  call    _Z8generateIL7GenType3EEP7ExtMoveRK8PositionS2_; 28FA _ E8, 00000000(rel)
        mov     rdi, rax                                ; 28FF _ 48: 89. C7
?_339:  lea     rax, [rsp+90H]                          ; 2902 _ 48: 8D. 84 24, 00000090
        mov     rdx, rbx                                ; 290A _ 48: 89. DA
        mov     r15, rsi                                ; 290D _ 49: 89. F7
        mov     rcx, rax                                ; 2910 _ 48: 89. C1
        mov     qword [rsp+28H], rax                    ; 2913 _ 48: 89. 44 24, 28
        mov     ebp, 4294967293                         ; 2918 _ BD, FFFFFFFD
        call    _ZN9CheckInfoC1ERK8Position             ; 291D _ E8, 00000000(rel)
        lea     rcx, [rsp+40H]                          ; 2922 _ 48: 8D. 4C 24, 40
        mov     qword [rsp+30H], rcx                    ; 2927 _ 48: 89. 4C 24, 30
?_340:  cmp     r15, rdi                                ; 292C _ 49: 39. FF
        jnc     ?_342                                   ; 292F _ 0F 83, 00000098
        mov     r14d, dword [r15]                       ; 2935 _ 45: 8B. 37
        mov     r10d, r14d                              ; 2938 _ 45: 89. F2
        and     r10d, 0C000H                            ; 293B _ 41: 81. E2, 0000C000
        cmp     r10d, 32768                             ; 2942 _ 41: 81. FA, 00008000
        jnz     ?_341                                   ; 2949 _ 75, 79
        mov     r8, qword [rsp+98H]                     ; 294B _ 4C: 8B. 84 24, 00000098
        mov     edx, r14d                               ; 2953 _ 44: 89. F2
        mov     rcx, rbx                                ; 2956 _ 48: 89. D9
        call    _ZNK8Position5legalE4Movey              ; 2959 _ E8, 00000000(rel)
        test    al, al                                  ; 295E _ 84. C0
        jz      ?_341                                   ; 2960 _ 74, 62
        mov     r8, qword [rsp+28H]                     ; 2962 _ 4C: 8B. 44 24, 28
        mov     edx, r14d                               ; 2967 _ 44: 89. F2
        mov     rcx, rbx                                ; 296A _ 48: 89. D9
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 296D _ E8, 00000000(rel)
        mov     r8, qword [rsp+30H]                     ; 2972 _ 4C: 8B. 44 24, 30
        mov     edx, r14d                               ; 2977 _ 44: 89. F2
        mov     rcx, rbx                                ; 297A _ 48: 89. D9
        movzx   r9d, al                                 ; 297D _ 44: 0F B6. C8
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 2981 _ E8, 00000000(rel)
        mov     r9, r13                                 ; 2986 _ 4D: 89. E9
        mov     edx, 4294967294                         ; 2989 _ BA, FFFFFFFE
        mov     rcx, rbx                                ; 298E _ 48: 89. D9
        mov     r8d, 2                                  ; 2991 _ 41: B8, 00000002
        call    _ZL8probe_abR8PositioniiPi              ; 2997 _ E8, FFFFEDFC
        mov     edx, r14d                               ; 299C _ 44: 89. F2
        mov     rcx, rbx                                ; 299F _ 48: 89. D9
        neg     eax                                     ; 29A2 _ F7. D8
        mov     dword [rsp+3CH], eax                    ; 29A4 _ 89. 44 24, 3C
        call    _ZN8Position9undo_moveE4Move            ; 29A8 _ E8, 00000000(rel)
        cmp     dword [r13], 0                          ; 29AD _ 41: 83. 7D, 00, 00
        mov     r11d, dword [rsp+3CH]                   ; 29B2 _ 44: 8B. 5C 24, 3C
        je      ?_336                                   ; 29B7 _ 0F 84, FFFFFF17
        cmp     ebp, r11d                               ; 29BD _ 44: 39. DD
        cmovl   ebp, r11d                               ; 29C0 _ 41: 0F 4C. EB
?_341:  add     r15, 8                                  ; 29C4 _ 49: 83. C7, 08
        jmp     ?_340                                   ; 29C8 _ E9, FFFFFF5F

?_342:  cmp     ebp, -3                                 ; 29CD _ 83. FD, FD
        mov     eax, r12d                               ; 29D0 _ 44: 89. E0
        je      ?_352                                   ; 29D3 _ 0F 84, 000000A3
        cmp     ebp, r12d                               ; 29D9 _ 44: 39. E5
        mov     eax, ebp                                ; 29DC _ 89. E8
        jge     ?_352                                   ; 29DE _ 0F 8D, 00000098
        test    r12d, r12d                              ; 29E4 _ 45: 85. E4
        mov     eax, r12d                               ; 29E7 _ 44: 89. E0
        jne     ?_352                                   ; 29EA _ 0F 85, 0000008C
?_343:  cmp     rsi, rdi                                ; 29F0 _ 48: 39. FE
        jnc     ?_344                                   ; 29F3 _ 73, 29
        mov     edx, dword [rsi]                        ; 29F5 _ 8B. 16
        mov     r8d, edx                                ; 29F7 _ 41: 89. D0
        and     r8d, 0C000H                             ; 29FA _ 41: 81. E0, 0000C000
        cmp     r8d, 32768                              ; 2A01 _ 41: 81. F8, 00008000
        jz      ?_345                                   ; 2A08 _ 74, 1E
        mov     r8, qword [rsp+98H]                     ; 2A0A _ 4C: 8B. 84 24, 00000098
        mov     rcx, rbx                                ; 2A12 _ 48: 89. D9
        call    _ZNK8Position5legalE4Movey              ; 2A15 _ E8, 00000000(rel)
        test    al, al                                  ; 2A1A _ 84. C0
        jz      ?_345                                   ; 2A1C _ 74, 0A
?_344:  cmp     rsi, rdi                                ; 2A1E _ 48: 39. FE
        mov     r12, rsi                                ; 2A21 _ 49: 89. F4
        jnz     ?_350                                   ; 2A24 _ 75, 3B
        jmp     ?_346                                   ; 2A26 _ EB, 06

?_345:  add     rsi, 8                                  ; 2A28 _ 48: 83. C6, 08
        jmp     ?_343                                   ; 2A2C _ EB, C2

?_346:  mov     r9, qword [rbx+3B8H]                    ; 2A2E _ 4C: 8B. 8B, 000003B8
        cmp     qword [r9+38H], 0                       ; 2A35 _ 49: 83. 79, 38, 00
        jz      ?_351                                   ; 2A3A _ 74, 30
?_347:  mov     eax, ebp                                ; 2A3C _ 89. E8
        jmp     ?_352                                   ; 2A3E _ EB, 3C

?_348:  mov     r8, qword [rsp+98H]                     ; 2A40 _ 4C: 8B. 84 24, 00000098
        mov     rcx, rbx                                ; 2A48 _ 48: 89. D9
        mov     edx, dword [r12]                        ; 2A4B _ 41: 8B. 14 24
        call    _ZNK8Position5legalE4Movey              ; 2A4F _ E8, 00000000(rel)
        test    al, al                                  ; 2A54 _ 84. C0
        jnz     ?_350                                   ; 2A56 _ 75, 09
        add     r12, 8                                  ; 2A58 _ 49: 83. C4, 08
?_349:  cmp     r12, rdi                                ; 2A5C _ 49: 39. FC
        jc      ?_348                                   ; 2A5F _ 72, DF
?_350:  cmp     r12, rdi                                ; 2A61 _ 49: 39. FC
        jne     ?_336                                   ; 2A64 _ 0F 85, FFFFFE6A
        jmp     ?_347                                   ; 2A6A _ EB, D0

?_351:  mov     rdx, rdi                                ; 2A6C _ 48: 89. FA
        mov     rcx, rbx                                ; 2A6F _ 48: 89. D9
        call    _Z8generateIL7GenType1EEP7ExtMoveRK8PositionS2_; 2A72 _ E8, 00000000(rel)
        mov     rdi, rax                                ; 2A77 _ 48: 89. C7
        jmp     ?_349                                   ; 2A7A _ EB, E0
; _ZN10Tablebases9probe_wdlER8PositionPi End of function

?_352:  ; Local function
        add     rsp, 1784                               ; 2A7C _ 48: 81. C4, 000006F8
        pop     rbx                                     ; 2A83 _ 5B
        pop     rsi                                     ; 2A84 _ 5E
        pop     rdi                                     ; 2A85 _ 5F
        pop     rbp                                     ; 2A86 _ 5D
        pop     r12                                     ; 2A87 _ 41: 5C
        pop     r13                                     ; 2A89 _ 41: 5D
        pop     r14                                     ; 2A8B _ 41: 5E
        pop     r15                                     ; 2A8D _ 41: 5F
        ret                                             ; 2A8F _ C3

_ZN10Tablebases9probe_dtzER8PositionPi:; Function begin
        push    r15                                     ; 2A90 _ 41: 57
        push    r14                                     ; 2A92 _ 41: 56
        push    r13                                     ; 2A94 _ 41: 55
        push    r12                                     ; 2A96 _ 41: 54
        push    rbp                                     ; 2A98 _ 55
        push    rdi                                     ; 2A99 _ 57
        push    rsi                                     ; 2A9A _ 56
        push    rbx                                     ; 2A9B _ 53
        sub     rsp, 1832                               ; 2A9C _ 48: 81. EC, 00000728
        mov     r8d, 2                                  ; 2AA3 _ 41: B8, 00000002
        mov     r15, rdx                                ; 2AA9 _ 49: 89. D7
        mov     dword [rdx], 1                          ; 2AAC _ C7. 02, 00000001
        mov     r9, rdx                                 ; 2AB2 _ 49: 89. D1
        mov     rbx, rcx                                ; 2AB5 _ 48: 89. CB
        mov     edx, 4294967294                         ; 2AB8 _ BA, FFFFFFFE
        call    _ZL8probe_abR8PositioniiPi              ; 2ABD _ E8, FFFFECD6
        mov     r14d, eax                               ; 2AC2 _ 41: 89. C6
        mov     eax, dword [r15]                        ; 2AC5 _ 41: 8B. 07
        test    r14d, r14d                              ; 2AC8 _ 45: 85. F6
        jz      ?_353                                   ; 2ACB _ 74, 04
        test    eax, eax                                ; 2ACD _ 85. C0
        jnz     ?_354                                   ; 2ACF _ 75, 07
?_353:  xor     esi, esi                                ; 2AD1 _ 31. F6
        jmp     ?_399                                   ; 2AD3 _ E9, 0000069F

?_354:  cmp     eax, 2                                  ; 2AD8 _ 83. F8, 02
        jnz     ?_356                                   ; 2ADB _ 75, 19
?_355:  cmp     r14d, 2                                 ; 2ADD _ 41: 83. FE, 02
        mov     esi, 1                                  ; 2AE1 _ BE, 00000001
        je      ?_399                                   ; 2AE6 _ 0F 84, 0000068B
        mov     esi, 101                                ; 2AEC _ BE, 00000065
        jmp     ?_399                                   ; 2AF1 _ E9, 00000681

?_356:  lea     rcx, [rsp+0C0H]                         ; 2AF6 _ 48: 8D. 8C 24, 000000C0
        mov     rdx, rbx                                ; 2AFE _ 48: 89. DA
        mov     qword [rsp+40H], rcx                    ; 2B01 _ 48: 89. 4C 24, 40
        call    _ZN9CheckInfoC1ERK8Position             ; 2B06 _ E8, 00000000(rel)
        test    r14d, r14d                              ; 2B0B _ 45: 85. F6
        jle     ?_362                                   ; 2B0E _ 0F 8E, 0000010C
        mov     rdx, qword [rbx+3B8H]                   ; 2B14 _ 48: 8B. 93, 000003B8
        lea     r12, [rsp+120H]                         ; 2B1B _ 4C: 8D. A4 24, 00000120
        mov     rcx, rbx                                ; 2B23 _ 48: 89. D9
        cmp     qword [rdx+38H], 0                      ; 2B26 _ 48: 83. 7A, 38, 00
        mov     rdx, r12                                ; 2B2B _ 4C: 89. E2
        jnz     ?_357                                   ; 2B2E _ 75, 0C
        call    _Z8generateIL7GenType4EEP7ExtMoveRK8PositionS2_; 2B30 _ E8, 00000000(rel)
        mov     qword [rsp+38H], rax                    ; 2B35 _ 48: 89. 44 24, 38
        jmp     ?_358                                   ; 2B3A _ EB, 0A

?_357:  call    _Z8generateIL7GenType3EEP7ExtMoveRK8PositionS2_; 2B3C _ E8, 00000000(rel)
        mov     qword [rsp+38H], rax                    ; 2B41 _ 48: 89. 44 24, 38
?_358:  lea     rbp, [rsp+70H]                          ; 2B46 _ 48: 8D. 6C 24, 70
        mov     esi, 1                                  ; 2B4B _ BE, 00000001
        sub     esi, r14d                               ; 2B50 _ 44: 29. F6
?_359:  cmp     r12, qword [rsp+38H]                    ; 2B53 _ 4C: 3B. 64 24, 38
        jnc     ?_363                                   ; 2B58 _ 0F 83, 000000CB
        mov     edi, dword [r12]                        ; 2B5E _ 41: 8B. 3C 24
        mov     edx, edi                                ; 2B62 _ 89. FA
        sar     edx, 6                                  ; 2B64 _ C1. FA, 06
        and     edx, 3FH                                ; 2B67 _ 83. E2, 3F
        mov     r9d, dword [rbx+rdx*4]                  ; 2B6A _ 44: 8B. 0C 93
        and     r9d, 07H                                ; 2B6E _ 41: 83. E1, 07
        dec     r9d                                     ; 2B72 _ 41: FF. C9
        jne     ?_361                                   ; 2B75 _ 0F 85, 0000009C
        mov     r10d, edi                               ; 2B7B _ 41: 89. FA
        and     r10d, 3FH                               ; 2B7E _ 41: 83. E2, 3F
        cmp     dword [rbx+r10*4], 0                    ; 2B82 _ 42: 83. 3C 93, 00
        jz      ?_360                                   ; 2B87 _ 74, 13
        mov     r11d, edi                               ; 2B89 _ 41: 89. FB
        and     r11d, 0C000H                            ; 2B8C _ 41: 81. E3, 0000C000
        cmp     r11d, 49152                             ; 2B93 _ 41: 81. FB, 0000C000
        jnz     ?_361                                   ; 2B9A _ 75, 7B
?_360:  mov     ecx, edi                                ; 2B9C _ 89. F9
        and     ecx, 0C000H                             ; 2B9E _ 81. E1, 0000C000
        cmp     ecx, 32768                              ; 2BA4 _ 81. F9, 00008000
        jz      ?_361                                   ; 2BAA _ 74, 6B
        mov     r8, qword [rsp+0C8H]                    ; 2BAC _ 4C: 8B. 84 24, 000000C8
        mov     edx, edi                                ; 2BB4 _ 89. FA
        mov     rcx, rbx                                ; 2BB6 _ 48: 89. D9
        call    _ZNK8Position5legalE4Movey              ; 2BB9 _ E8, 00000000(rel)
        test    al, al                                  ; 2BBE _ 84. C0
        jz      ?_361                                   ; 2BC0 _ 74, 55
        mov     r8, qword [rsp+40H]                     ; 2BC2 _ 4C: 8B. 44 24, 40
        mov     edx, edi                                ; 2BC7 _ 89. FA
        mov     rcx, rbx                                ; 2BC9 _ 48: 89. D9
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 2BCC _ E8, 00000000(rel)
        mov     r8, rbp                                 ; 2BD1 _ 49: 89. E8
        mov     edx, edi                                ; 2BD4 _ 89. FA
        mov     rcx, rbx                                ; 2BD6 _ 48: 89. D9
        movzx   r9d, al                                 ; 2BD9 _ 44: 0F B6. C8
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 2BDD _ E8, 00000000(rel)
        mov     r9, r15                                 ; 2BE2 _ 4D: 89. F9
        mov     r8d, esi                                ; 2BE5 _ 41: 89. F0
        mov     edx, 4294967294                         ; 2BE8 _ BA, FFFFFFFE
        mov     rcx, rbx                                ; 2BED _ 48: 89. D9
        call    _ZL8probe_abR8PositioniiPi              ; 2BF0 _ E8, FFFFEBA3
        mov     edx, edi                                ; 2BF5 _ 89. FA
        mov     rcx, rbx                                ; 2BF7 _ 48: 89. D9
        neg     eax                                     ; 2BFA _ F7. D8
        mov     r13d, eax                               ; 2BFC _ 41: 89. C5
        call    _ZN8Position9undo_moveE4Move            ; 2BFF _ E8, 00000000(rel)
        cmp     dword [r15], 0                          ; 2C04 _ 41: 83. 3F, 00
        je      ?_353                                   ; 2C08 _ 0F 84, FFFFFEC3
        cmp     r13d, r14d                              ; 2C0E _ 45: 39. F5
        je      ?_355                                   ; 2C11 _ 0F 84, FFFFFEC6
?_361:  add     r12, 8                                  ; 2C17 _ 49: 83. C4, 08
        jmp     ?_359                                   ; 2C1B _ E9, FFFFFF33

?_362:  mov     qword [rsp+38H], 0                      ; 2C20 _ 48: C7. 44 24, 38, 00000000
?_363:  mov     rsi, qword [rbx+3B8H]                   ; 2C29 _ 48: 8B. B3, 000003B8
        lea     r13, [rel _ZL9DTZ_table]                ; 2C30 _ 4C: 8D. 2D, 000007C0(rel)
        mov     rbp, qword [rsi+8H]                     ; 2C37 _ 48: 8B. 6E, 08
        cmp     qword [rel _ZL9DTZ_table], rbp          ; 2C3B _ 48: 39. 2D, 000007C0(rel)
        je      ?_368                                   ; 2C42 _ 0F 84, 000000AD
        cmp     qword [rel ?_026], rbp                  ; 2C48 _ 48: 39. 2D, 000007C8(rel)
        je      ?_368                                   ; 2C4F _ 0F 84, 000000A0
        mov     rdi, r13                                ; 2C55 _ 4C: 89. EF
        mov     eax, 1                                  ; 2C58 _ B8, 00000001
?_364:  cmp     qword [rdi+18H], rbp                    ; 2C5D _ 48: 39. 6F, 18
        jz      ?_366                                   ; 2C61 _ 74, 3B
        inc     eax                                     ; 2C63 _ FF. C0
        add     rdi, 24                                 ; 2C65 _ 48: 83. C7, 18
        cmp     eax, 64                                 ; 2C69 _ 83. F8, 40
        jnz     ?_364                                   ; 2C6C _ 75, EF
        lea     r10, [rel _ZL7TB_hash]                  ; 2C6E _ 4C: 8D. 15, 00000DC0(rel)
        mov     r8, rbp                                 ; 2C75 _ 49: 89. E8
        shr     r8, 54                                  ; 2C78 _ 49: C1. E8, 36
        imul    r9, r8, 80                              ; 2C7C _ 4D: 6B. C8, 50
        add     r10, r9                                 ; 2C80 _ 4D: 01. CA
        lea     r11, [r10+50H]                          ; 2C83 _ 4D: 8D. 5A, 50
?_365:  cmp     qword [r10], rbp                        ; 2C87 _ 49: 39. 2A
        je      ?_420                                   ; 2C8A _ 0F 84, 000006EE
        add     r10, 16                                 ; 2C90 _ 49: 83. C2, 10
        cmp     r10, r11                                ; 2C94 _ 4D: 39. DA
        jnz     ?_365                                   ; 2C97 _ 75, EE
        jmp     ?_419                                   ; 2C99 _ E9, 000006D2

?_366:  movsxd  r11, eax                                ; 2C9E _ 4C: 63. D8
        mov     r8d, 6                                  ; 2CA1 _ 41: B8, 00000006
        imul    r9, r11, 24                             ; 2CA7 _ 4D: 6B. CB, 18
        add     r9, r13                                 ; 2CAB _ 4D: 01. E9
        mov     rdx, qword [r9]                         ; 2CAE _ 49: 8B. 11
        mov     r12, qword [r9+8H]                      ; 2CB1 _ 4D: 8B. 61, 08
        mov     r10, qword [r9+10H]                     ; 2CB5 _ 4D: 8B. 51, 10
?_367:  lea     r11d, [rax-1H]                          ; 2CB9 _ 44: 8D. 58, FF
        cdqe                                            ; 2CBD _ 48: 98
        mov     rcx, r8                                 ; 2CBF _ 4C: 89. C1
        imul    rax, rax, 24                            ; 2CC2 _ 48: 6B. C0, 18
        movsxd  rsi, r11d                               ; 2CC6 _ 49: 63. F3
        imul    rsi, rsi, 24                            ; 2CC9 _ 48: 6B. F6, 18
        add     rax, r13                                ; 2CCD _ 4C: 01. E8
        add     rsi, r13                                ; 2CD0 _ 4C: 01. EE
        test    r11d, r11d                              ; 2CD3 _ 45: 85. DB
        mov     rdi, rax                                ; 2CD6 _ 48: 89. C7
        rep movsd                                       ; 2CD9 _ F3: A5
        mov     eax, r11d                               ; 2CDB _ 44: 89. D8
        jnz     ?_367                                   ; 2CDE _ 75, D9
        mov     qword [rel _ZL9DTZ_table], rdx          ; 2CE0 _ 48: 89. 15, 000007C0(rel)
        mov     qword [rel ?_026], r12                  ; 2CE7 _ 4C: 89. 25, 000007C8(rel)
        mov     qword [rel ?_027], r10                  ; 2CEE _ 4C: 89. 15, 000007D0(rel)
?_368:  mov     rsi, qword [rel ?_027]                  ; 2CF5 _ 48: 8B. 35, 000007D0(rel)
        test    rsi, rsi                                ; 2CFC _ 48: 85. F6
        je      ?_419                                   ; 2CFF _ 0F 84, 0000066B
        mov     r13b, byte [rsi+1AH]                    ; 2D05 _ 44: 8A. 6E, 1A
        test    r13b, r13b                              ; 2D09 _ 45: 84. ED
        jnz     ?_370                                   ; 2D0C _ 75, 34
        cmp     qword [rsi+8H], rbp                     ; 2D0E _ 48: 39. 6E, 08
        jz      ?_369                                   ; 2D12 _ 74, 1A
        xor     r10d, r10d                              ; 2D14 _ 45: 31. D2
        cmp     dword [rbx+3ACH], 0                     ; 2D17 _ 83. BB, 000003AC, 00
        mov     eax, 8                                  ; 2D1E _ B8, 00000008
        mov     edx, 56                                 ; 2D23 _ BA, 00000038
        sete    r10b                                    ; 2D28 _ 41: 0F 94. C2
        jmp     ?_371                                   ; 2D2C _ EB, 33

?_369:  xor     r10d, r10d                              ; 2D2E _ 45: 31. D2
        cmp     dword [rbx+3ACH], 0                     ; 2D31 _ 83. BB, 000003AC, 00
        setne   r10b                                    ; 2D38 _ 41: 0F 95. C2
        xor     eax, eax                                ; 2D3C _ 31. C0
        xor     edx, edx                                ; 2D3E _ 31. D2
        jmp     ?_371                                   ; 2D40 _ EB, 1F

?_370:  cmp     dword [rbx+3ACH], 1                     ; 2D42 _ 83. BB, 000003AC, 01
        sbb     eax, eax                                ; 2D49 _ 19. C0
        not     eax                                     ; 2D4B _ F7. D0
        and     eax, 08H                                ; 2D4D _ 83. E0, 08
        cmp     dword [rbx+3ACH], 1                     ; 2D50 _ 83. BB, 000003AC, 01
        sbb     edx, edx                                ; 2D57 _ 19. D2
        xor     r10d, r10d                              ; 2D59 _ 45: 31. D2
        not     edx                                     ; 2D5C _ F7. D2
        and     edx, 38H                                ; 2D5E _ 83. E2, 38
?_371:  cmp     byte [rsi+1BH], 0                       ; 2D61 _ 80. 7E, 1B, 00
        jne     ?_377                                   ; 2D65 _ 0F 85, 000000D5
        mov     dl, byte [rsi+4CH]                      ; 2D6B _ 8A. 56, 4C
        and     edx, 01H                                ; 2D6E _ 83. E2, 01
        cmp     edx, r10d                               ; 2D71 _ 44: 39. D2
        jz      ?_373                                   ; 2D74 _ 74, 13
        test    r13b, r13b                              ; 2D76 _ 45: 84. ED
        jnz     ?_373                                   ; 2D79 _ 75, 0E
?_372:  mov     dword [r15], -1                         ; 2D7B _ 41: C7. 07, FFFFFFFF
        xor     ecx, ecx                                ; 2D82 _ 31. C9
        jmp     ?_387                                   ; 2D84 _ E9, 00000242

?_373:  movzx   r12d, byte [rsi+19H]                    ; 2D89 _ 44: 0F B6. 66, 19
        lea     r8, [rsi+40H]                           ; 2D8E _ 4C: 8D. 46, 40
        xor     r13d, r13d                              ; 2D92 _ 45: 31. ED
        mov     ecx, r12d                               ; 2D95 _ 44: 89. E1
?_374:  cmp     r12d, r13d                              ; 2D98 _ 45: 39. EC
        jle     ?_376                                   ; 2D9B _ 7E, 42
        movsxd  r11, r13d                               ; 2D9D _ 4D: 63. DD
        movzx   edx, byte [r8+r11]                      ; 2DA0 _ 43: 0F B6. 14 18
        mov     r9d, edx                                ; 2DA5 _ 41: 89. D1
        xor     edx, eax                                ; 2DA8 _ 31. C2
        sar     edx, 3                                  ; 2DAA _ C1. FA, 03
        and     r9d, 07H                                ; 2DAD _ 41: 83. E1, 07
        movsxd  r10, edx                                ; 2DB1 _ 4C: 63. D2
        mov     rbp, qword [rbx+r10*8+140H]             ; 2DB4 _ 4A: 8B. AC D3, 00000140
        and     rbp, qword [rbx+r9*8+100H]              ; 2DBC _ 4A: 23. AC CB, 00000100
?_375:  bsf     rdi, rbp                                ; 2DC4 _ 48: 0F BC. FD
        movsxd  r11, r13d                               ; 2DC8 _ 4D: 63. DD
        blsr    rbp, rbp                                ; 2DCB _ C4 E2 D0: F3. CD
        inc     r13d                                    ; 2DD0 _ 41: FF. C5
        test    rbp, rbp                                ; 2DD3 _ 48: 85. ED
        mov     dword [rsp+r11*4+50H], edi              ; 2DD6 _ 42: 89. 7C 9C, 50
        jnz     ?_375                                   ; 2DDB _ 75, E7
        jmp     ?_374                                   ; 2DDD _ EB, B9

?_376:  lea     rax, [rsi+28H]                          ; 2DDF _ 48: 8D. 46, 28
        lea     rdx, [rsi+1CH]                          ; 2DE3 _ 48: 8D. 56, 1C
        mov     qword [rsp+20H], rax                    ; 2DE7 _ 48: 89. 44 24, 20
        lea     r9, [rsp+50H]                           ; 2DEC _ 4C: 8D. 4C 24, 50
        lea     r8, [rsi+46H]                           ; 2DF1 _ 4C: 8D. 46, 46
        call    _ZL12encode_pieceP13TBEntry_piecePhPiS2_.isra.0; 2DF5 _ E8, FFFFE3E3
        mov     rcx, qword [rsi+20H]                    ; 2DFA _ 48: 8B. 4E, 20
        mov     rdx, rax                                ; 2DFE _ 48: 89. C2
        call    _Z16decompress_pairsILb1EEhP9PairsDatay ; 2E01 _ E8, FFFFE23D
        mov     r13b, byte [rsi+4CH]                    ; 2E06 _ 44: 8A. 6E, 4C
        lea     ecx, [r14+2H]                           ; 2E0A _ 41: 8D. 4E, 02
        movzx   eax, al                                 ; 2E0E _ 0F B6. C0
        test    r13b, 02H                               ; 2E11 _ 41: F6. C5, 02
        je      ?_385                                   ; 2E15 _ 0F 84, 00000194
        lea     r9, [rel _ZL10wdl_to_map]               ; 2E1B _ 4C: 8D. 0D, 000008A0(rel)
        movsxd  r8, ecx                                 ; 2E22 _ 4C: 63. C1
        movsxd  r10, dword [r9+r8*4]                    ; 2E25 _ 4F: 63. 14 81
        movzx   edi, word [rsi+r10*2+4EH]               ; 2E29 _ 42: 0F B7. 7C 56, 4E
        mov     rsi, qword [rsi+58H]                    ; 2E2F _ 48: 8B. 76, 58
        add     eax, edi                                ; 2E33 _ 01. F8
        cdqe                                            ; 2E35 _ 48: 98
        movzx   eax, byte [rsi+rax]                     ; 2E37 _ 0F B6. 04 06
        jmp     ?_385                                   ; 2E3B _ E9, 0000016F

?_377:  movzx   ebp, byte [rsi+40H]                     ; 2E40 _ 0F B6. 6E, 40
        lea     r13, [rsp+50H]                          ; 2E44 _ 4C: 8D. 6C 24, 50
        xor     edi, edi                                ; 2E49 _ 31. FF
        xor     ebp, eax                                ; 2E4B _ 31. C5
        mov     r9d, ebp                                ; 2E4D _ 41: 89. E9
        sar     ebp, 3                                  ; 2E50 _ C1. FD, 03
        and     r9d, 07H                                ; 2E53 _ 41: 83. E1, 07
        movsxd  r12, ebp                                ; 2E57 _ 4C: 63. E5
        mov     r8, qword [rbx+r9*8+100H]               ; 2E5A _ 4E: 8B. 84 CB, 00000100
        and     r8, qword [rbx+r12*8+140H]              ; 2E62 _ 4E: 23. 84 E3, 00000140
?_378:  bsf     r11, r8                                 ; 2E6A _ 4D: 0F BC. D8
        lea     ecx, [rdi+1H]                           ; 2E6E _ 8D. 4F, 01
        xor     r11d, edx                               ; 2E71 _ 41: 31. D3
        blsr    r8, r8                                  ; 2E74 _ C4 C2 B8: F3. C8
        mov     dword [r13+rdi*4], r11d                 ; 2E79 _ 45: 89. 5C BD, 00
        inc     rdi                                     ; 2E7E _ 48: FF. C7
        test    r8, r8                                  ; 2E81 _ 4D: 85. C0
        jnz     ?_378                                   ; 2E84 _ 75, E4
        movzx   ebp, byte [rsi+1CH]                     ; 2E86 _ 0F B6. 6E, 1C
        xor     r9d, r9d                                ; 2E8A _ 45: 31. C9
        mov     dword [rsp+48H], ebp                    ; 2E8D _ 89. 6C 24, 48
?_379:  lea     r12d, [r9+1H]                           ; 2E91 _ 45: 8D. 61, 01
        cmp     r12d, dword [rsp+48H]                   ; 2E95 _ 44: 3B. 64 24, 48
        mov     r8d, dword [rsp+50H]                    ; 2E9A _ 44: 8B. 44 24, 50
        jge     ?_381                                   ; 2E9F _ 7D, 2C
        movsxd  r12, dword [rsp+r9*4+54H]               ; 2EA1 _ 4E: 63. 64 8C, 54
        lea     rbp, [rel _ZL4flap]                     ; 2EA6 _ 48: 8D. 2D, 00000700(rel)
        movsxd  r11, r8d                                ; 2EAD _ 4D: 63. D8
        mov     rdi, r12                                ; 2EB0 _ 4C: 89. E7
        mov     r12b, byte [rbp+r12]                    ; 2EB3 _ 46: 8A. 64 25, 00
        cmp     byte [rbp+r11], r12b                    ; 2EB8 _ 46: 38. 64 1D, 00
        jbe     ?_380                                   ; 2EBD _ 76, 09
        mov     dword [rsp+50H], edi                    ; 2EBF _ 89. 7C 24, 50
        mov     dword [rsp+r9*4+54H], r8d               ; 2EC3 _ 46: 89. 44 8C, 54
?_380:  inc     r9                                      ; 2EC8 _ 49: FF. C1
        jmp     ?_379                                   ; 2ECB _ EB, C4

?_381:  lea     r9, [rel _ZL12file_to_file]             ; 2ECD _ 4C: 8D. 0D, 00000680(rel)
        and     r8d, 07H                                ; 2ED4 _ 41: 83. E0, 07
        movzx   edi, byte [r9+r8]                       ; 2ED8 _ 43: 0F B6. 3C 01
        mov     r11b, byte [rsi+rdi+0E0H]               ; 2EDD _ 44: 8A. 9C 3E, 000000E0
        and     r11d, 01H                               ; 2EE5 _ 41: 83. E3, 01
        cmp     r11d, r10d                              ; 2EE9 _ 45: 39. D3
        jne     ?_372                                   ; 2EEC _ 0F 85, FFFFFE89
        imul    r10, rdi, 48                            ; 2EF2 _ 4C: 6B. D7, 30
        lea     r11, [rsi+r10+40H]                      ; 2EF6 _ 4E: 8D. 5C 16, 40
        movzx   r10d, byte [rsi+19H]                    ; 2EFB _ 44: 0F B6. 56, 19
?_382:  cmp     r10d, ecx                               ; 2F00 _ 41: 39. CA
        jle     ?_384                                   ; 2F03 _ 7E, 46
        movsxd  rbp, ecx                                ; 2F05 _ 48: 63. E9
        movzx   r12d, byte [r11+rbp]                    ; 2F08 _ 45: 0F B6. 24 2B
        mov     r9d, r12d                               ; 2F0D _ 45: 89. E1
        xor     r12d, eax                               ; 2F10 _ 41: 31. C4
        sar     r12d, 3                                 ; 2F13 _ 41: C1. FC, 03
        and     r9d, 07H                                ; 2F17 _ 41: 83. E1, 07
        movsxd  r8, r12d                                ; 2F1B _ 4D: 63. C4
        mov     r8, qword [rbx+r8*8+140H]               ; 2F1E _ 4E: 8B. 84 C3, 00000140
        and     r8, qword [rbx+r9*8+100H]               ; 2F26 _ 4E: 23. 84 CB, 00000100
?_383:  bsf     r12, r8                                 ; 2F2E _ 4D: 0F BC. E0
        movsxd  rbp, ecx                                ; 2F32 _ 48: 63. E9
        xor     r12d, edx                               ; 2F35 _ 41: 31. D4
        blsr    r8, r8                                  ; 2F38 _ C4 C2 B8: F3. C8
        inc     ecx                                     ; 2F3D _ FF. C1
        test    r8, r8                                  ; 2F3F _ 4D: 85. C0
        mov     dword [rsp+rbp*4+50H], r12d             ; 2F42 _ 44: 89. 64 AC, 50
        jnz     ?_383                                   ; 2F47 _ 75, E5
        jmp     ?_382                                   ; 2F49 _ EB, B5

?_384:  imul    rbp, rdi, 48                            ; 2F4B _ 48: 6B. EF, 30
        mov     r8, r13                                 ; 2F4F _ 4D: 89. E8
        mov     rcx, rsi                                ; 2F52 _ 48: 89. F1
        lea     rdx, [rsi+rbp+46H]                      ; 2F55 _ 48: 8D. 54 2E, 46
        lea     r9, [rsi+rbp+28H]                       ; 2F5A _ 4C: 8D. 4C 2E, 28
        call    _ZL11encode_pawnP12TBEntry_pawnPhPiS2_  ; 2F5F _ E8, FFFFE5C5
        mov     rcx, qword [rsi+rbp+20H]                ; 2F64 _ 48: 8B. 4C 2E, 20
        mov     rdx, rax                                ; 2F69 _ 48: 89. C2
        call    _Z16decompress_pairsILb1EEhP9PairsDatay ; 2F6C _ E8, FFFFE0D2
        mov     r13b, byte [rsi+rdi+0E0H]               ; 2F71 _ 44: 8A. AC 3E, 000000E0
        lea     ecx, [r14+2H]                           ; 2F79 _ 41: 8D. 4E, 02
        movzx   eax, al                                 ; 2F7D _ 0F B6. C0
        test    r13b, 02H                               ; 2F80 _ 41: F6. C5, 02
        jz      ?_385                                   ; 2F84 _ 74, 29
        lea     r12, [rel _ZL10wdl_to_map]              ; 2F86 _ 4C: 8D. 25, 000008A0(rel)
        movsxd  rdx, ecx                                ; 2F8D _ 48: 63. D1
        movsxd  r8, dword [r12+rdx*4]                   ; 2F90 _ 4D: 63. 04 94
        lea     rdi, [r8+rdi*4+70H]                     ; 2F94 _ 49: 8D. 7C B8, 70
        movzx   r9d, word [rsi+rdi*2+4H]                ; 2F99 _ 44: 0F B7. 4C 7E, 04
        mov     rsi, qword [rsi+108H]                   ; 2F9F _ 48: 8B. B6, 00000108
        add     eax, r9d                                ; 2FA6 _ 44: 01. C8
        cdqe                                            ; 2FA9 _ 48: 98
        movzx   eax, byte [rsi+rax]                     ; 2FAB _ 0F B6. 04 06
?_385:  lea     rbp, [rel _ZL8pa_flags]                 ; 2FAF _ 48: 8D. 2D, 00000894(rel)
        movsxd  rcx, ecx                                ; 2FB6 _ 48: 63. C9
        test    byte [rbp+rcx], r13b                    ; 2FB9 _ 44: 84. 6C 0D, 00
        jz      ?_386                                   ; 2FBE _ 74, 08
        test    r14b, 01H                               ; 2FC0 _ 41: F6. C6, 01
        mov     ecx, eax                                ; 2FC4 _ 89. C1
        jz      ?_387                                   ; 2FC6 _ 74, 03
?_386:  lea     ecx, [rax+rax]                          ; 2FC8 _ 8D. 0C 00
?_387:  cmp     dword [r15], 0                          ; 2FCB _ 41: 83. 3F, 00
        js      ?_388                                   ; 2FCF _ 78, 24
        lea     esi, [rcx+1H]                           ; 2FD1 _ 8D. 71, 01
        mov     edi, r14d                               ; 2FD4 _ 44: 89. F7
        add     ecx, 101                                ; 2FD7 _ 83. C1, 65
        test    r14b, 01H                               ; 2FDA _ 41: F6. C6, 01
        cmove   ecx, esi                                ; 2FDE _ 0F 44. CE
        shr     edi, 31                                 ; 2FE1 _ C1. EF, 1F
        mov     r12d, edi                               ; 2FE4 _ 41: 89. FC
        neg     r12d                                    ; 2FE7 _ 41: F7. DC
        xor     ecx, r12d                               ; 2FEA _ 44: 31. E1
        lea     esi, [rcx+rdi]                          ; 2FED _ 8D. 34 39
        jmp     ?_399                                   ; 2FF0 _ E9, 00000182

?_388:  lea     rdi, [rsp+120H]                         ; 2FF5 _ 48: 8D. BC 24, 00000120
        test    r14d, r14d                              ; 2FFD _ 45: 85. F6
        jle     ?_392                                   ; 3000 _ 0F 8E, 00000086
        lea     r12, [rsp+70H]                          ; 3006 _ 4C: 8D. 64 24, 70
        mov     esi, 65535                              ; 300B _ BE, 0000FFFF
        mov     ebp, 1                                  ; 3010 _ BD, 00000001
?_389:  cmp     rdi, qword [rsp+38H]                    ; 3015 _ 48: 3B. 7C 24, 38
        jnc     ?_399                                   ; 301A _ 0F 83, 00000157
        mov     r13d, dword [rdi]                       ; 3020 _ 44: 8B. 2F
        mov     edx, r13d                               ; 3023 _ 44: 89. EA
        and     edx, 3FH                                ; 3026 _ 83. E2, 3F
        cmp     dword [rbx+rdx*4], 0                    ; 3029 _ 83. 3C 93, 00
        jz      ?_390                                   ; 302D _ 74, 13
        mov     r9d, r13d                               ; 302F _ 45: 89. E9
        and     r9d, 0C000H                             ; 3032 _ 41: 81. E1, 0000C000
        cmp     r9d, 49152                              ; 3039 _ 41: 81. F9, 0000C000
        jnz     ?_391                                   ; 3040 _ 75, 44
?_390:  mov     r10d, r13d                              ; 3042 _ 45: 89. EA
        and     r10d, 0C000H                            ; 3045 _ 41: 81. E2, 0000C000
        cmp     r10d, 32768                             ; 304C _ 41: 81. FA, 00008000
        jz      ?_391                                   ; 3053 _ 74, 31
        mov     r11d, r13d                              ; 3055 _ 45: 89. EB
        sar     r11d, 6                                 ; 3058 _ 41: C1. FB, 06
        and     r11d, 3FH                               ; 305C _ 41: 83. E3, 3F
        mov     ecx, dword [rbx+r11*4]                  ; 3060 _ 42: 8B. 0C 9B
        and     ecx, 07H                                ; 3064 _ 83. E1, 07
        dec     ecx                                     ; 3067 _ FF. C9
        jz      ?_391                                   ; 3069 _ 74, 1B
        mov     r8, qword [rsp+0C8H]                    ; 306B _ 4C: 8B. 84 24, 000000C8
        mov     edx, r13d                               ; 3073 _ 44: 89. EA
        mov     rcx, rbx                                ; 3076 _ 48: 89. D9
        call    _ZNK8Position5legalE4Movey              ; 3079 _ E8, 00000000(rel)
        test    al, al                                  ; 307E _ 84. C0
        jne     ?_423                                   ; 3080 _ 0F 85, 00000397
?_391:  add     rdi, 8                                  ; 3086 _ 48: 83. C7, 08
        jmp     ?_389                                   ; 308A _ EB, 89

?_392:  mov     rax, qword [rbx+3B8H]                   ; 308C _ 48: 8B. 83, 000003B8
        mov     rdx, rdi                                ; 3093 _ 48: 89. FA
        mov     rcx, rbx                                ; 3096 _ 48: 89. D9
        cmp     qword [rax+38H], 0                      ; 3099 _ 48: 83. 78, 38, 00
        jnz     ?_393                                   ; 309E _ 75, 0A
        call    _Z8generateIL7GenType4EEP7ExtMoveRK8PositionS2_; 30A0 _ E8, 00000000(rel)
        mov     r12, rax                                ; 30A5 _ 49: 89. C4
        jmp     ?_394                                   ; 30A8 _ EB, 08

?_393:  call    _Z8generateIL7GenType3EEP7ExtMoveRK8PositionS2_; 30AA _ E8, 00000000(rel)
        mov     r12, rax                                ; 30AF _ 49: 89. C4
?_394:  lea     r13, [rsp+70H]                          ; 30B2 _ 4C: 8D. 6C 24, 70
        or      esi, 0FFFFFFFFH                         ; 30B7 _ 83. CE, FF
        mov     qword [rsp+38H], r13                    ; 30BA _ 4C: 89. 6C 24, 38
?_395:  cmp     rdi, r12                                ; 30BF _ 4C: 39. E7
        jnc     ?_399                                   ; 30C2 _ 0F 83, 000000AF
        mov     r13d, dword [rdi]                       ; 30C8 _ 44: 8B. 2F
        mov     rcx, rbx                                ; 30CB _ 48: 89. D9
        mov     r8, qword [rsp+0C8H]                    ; 30CE _ 4C: 8B. 84 24, 000000C8
        mov     edx, r13d                               ; 30D6 _ 44: 89. EA
        call    _ZNK8Position5legalE4Movey              ; 30D9 _ E8, 00000000(rel)
        test    al, al                                  ; 30DE _ 84. C0
        je      ?_398                                   ; 30E0 _ 0F 84, 00000088
        mov     r8, qword [rsp+40H]                     ; 30E6 _ 4C: 8B. 44 24, 40
        mov     edx, r13d                               ; 30EB _ 44: 89. EA
        mov     rcx, rbx                                ; 30EE _ 48: 89. D9
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 30F1 _ E8, 00000000(rel)
        mov     r8, qword [rsp+38H]                     ; 30F6 _ 4C: 8B. 44 24, 38
        mov     edx, r13d                               ; 30FB _ 44: 89. EA
        mov     rcx, rbx                                ; 30FE _ 48: 89. D9
        movzx   r9d, al                                 ; 3101 _ 44: 0F B6. C8
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 3105 _ E8, 00000000(rel)
        cmp     dword [rsp+8CH], 0                      ; 310A _ 83. BC 24, 0000008C, 00
        jnz     ?_396                                   ; 3112 _ 75, 31
        or      ebp, 0FFFFFFFFH                         ; 3114 _ 83. CD, FF
        cmp     r14d, -2                                ; 3117 _ 41: 83. FE, FE
        jz      ?_397                                   ; 311B _ 74, 37
        mov     r8d, 2                                  ; 311D _ 41: B8, 00000002
        mov     r9, r15                                 ; 3123 _ 4D: 89. F9
        mov     edx, 1                                  ; 3126 _ BA, 00000001
        mov     rcx, rbx                                ; 312B _ 48: 89. D9
        mov     bpl, -101                               ; 312E _ 40: B5, 9B
        call    _ZL8probe_abR8PositioniiPi              ; 3131 _ E8, FFFFE662
        mov     r8d, 0                                  ; 3136 _ 41: B8, 00000000
        cmp     eax, 2                                  ; 313C _ 83. F8, 02
        cmove   ebp, r8d                                ; 313F _ 41: 0F 44. E8
        jmp     ?_397                                   ; 3143 _ EB, 0F

?_396:  mov     rdx, r15                                ; 3145 _ 4C: 89. FA
        mov     rcx, rbx                                ; 3148 _ 48: 89. D9
        call    _ZN10Tablebases9probe_dtzER8PositionPi  ; 314B _ E8, FFFFF940
        not     eax                                     ; 3150 _ F7. D0
        mov     ebp, eax                                ; 3152 _ 89. C5
?_397:  mov     edx, r13d                               ; 3154 _ 44: 89. EA
        mov     rcx, rbx                                ; 3157 _ 48: 89. D9
        call    _ZN8Position9undo_moveE4Move            ; 315A _ E8, 00000000(rel)
        cmp     dword [r15], 0                          ; 315F _ 41: 83. 3F, 00
        je      ?_353                                   ; 3163 _ 0F 84, FFFFF968
        cmp     esi, ebp                                ; 3169 _ 39. EE
        cmovg   esi, ebp                                ; 316B _ 0F 4F. F5
?_398:  add     rdi, 8                                  ; 316E _ 48: 83. C7, 08
        jmp     ?_395                                   ; 3172 _ E9, FFFFFF48

?_399:  mov     r14, qword [rbx+3B8H]                   ; 3177 _ 4C: 8B. B3, 000003B8
        cmp     qword [r14+28H], 64                     ; 317E _ 49: 83. 7E, 28, 40
        je      ?_425                                   ; 3183 _ 0F 84, 00000312
        cmp     dword [r15], 0                          ; 3189 _ 41: 83. 3F, 00
        jnz     ?_401                                   ; 318D _ 75, 07
?_400:  xor     esi, esi                                ; 318F _ 31. F6
        jmp     ?_425                                   ; 3191 _ E9, 00000305

?_401:  cmp     qword [r14+38H], 0                      ; 3196 _ 49: 83. 7E, 38, 00
        lea     rdi, [rsp+120H]                         ; 319B _ 48: 8D. BC 24, 00000120
        mov     rcx, rbx                                ; 31A3 _ 48: 89. D9
        mov     rdx, rdi                                ; 31A6 _ 48: 89. FA
        jnz     ?_402                                   ; 31A9 _ 75, 0A
        call    _Z8generateIL7GenType0EEP7ExtMoveRK8PositionS2_; 31AB _ E8, 00000000(rel)
        mov     r12, rax                                ; 31B0 _ 49: 89. C4
        jmp     ?_403                                   ; 31B3 _ EB, 08

?_402:  call    _Z8generateIL7GenType3EEP7ExtMoveRK8PositionS2_; 31B5 _ E8, 00000000(rel)
        mov     r12, rax                                ; 31BA _ 49: 89. C4
?_403:  lea     r8, [rsp+0C0H]                          ; 31BD _ 4C: 8D. 84 24, 000000C0
        mov     rdx, rbx                                ; 31C5 _ 48: 89. DA
        mov     r13, rdi                                ; 31C8 _ 49: 89. FD
        mov     rcx, r8                                 ; 31CB _ 4C: 89. C1
        mov     qword [rsp+38H], r8                     ; 31CE _ 4C: 89. 44 24, 38
        mov     r14, r13                                ; 31D3 _ 4D: 89. EE
        call    _ZN9CheckInfoC1ERK8Position             ; 31D6 _ E8, 00000000(rel)
        mov     edx, 4294967293                         ; 31DB _ BA, FFFFFFFD
        mov     dword [rsp+48H], esi                    ; 31E0 _ 89. 74 24, 48
        lea     rax, [rsp+70H]                          ; 31E4 _ 48: 8D. 44 24, 70
        mov     edi, edx                                ; 31E9 _ 89. D7
        mov     qword [rsp+40H], rax                    ; 31EB _ 48: 89. 44 24, 40
?_404:  cmp     r14, r12                                ; 31F0 _ 4D: 39. E6
        jnc     ?_406                                   ; 31F3 _ 0F 83, 0000008A
        mov     ebp, dword [r14]                        ; 31F9 _ 41: 8B. 2E
        mov     r8d, ebp                                ; 31FC _ 41: 89. E8
        and     r8d, 0C000H                             ; 31FF _ 41: 81. E0, 0000C000
        cmp     r8d, 32768                              ; 3206 _ 41: 81. F8, 00008000
        jnz     ?_405                                   ; 320D _ 75, 6B
        mov     r8, qword [rsp+0C8H]                    ; 320F _ 4C: 8B. 84 24, 000000C8
        mov     edx, ebp                                ; 3217 _ 89. EA
        mov     rcx, rbx                                ; 3219 _ 48: 89. D9
        call    _ZNK8Position5legalE4Movey              ; 321C _ E8, 00000000(rel)
        test    al, al                                  ; 3221 _ 84. C0
        jz      ?_405                                   ; 3223 _ 74, 55
        mov     r8, qword [rsp+38H]                     ; 3225 _ 4C: 8B. 44 24, 38
        mov     edx, ebp                                ; 322A _ 89. EA
        mov     rcx, rbx                                ; 322C _ 48: 89. D9
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 322F _ E8, 00000000(rel)
        mov     r8, qword [rsp+40H]                     ; 3234 _ 4C: 8B. 44 24, 40
        mov     edx, ebp                                ; 3239 _ 89. EA
        mov     rcx, rbx                                ; 323B _ 48: 89. D9
        movzx   r9d, al                                 ; 323E _ 44: 0F B6. C8
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 3242 _ E8, 00000000(rel)
        mov     r9, r15                                 ; 3247 _ 4D: 89. F9
        mov     edx, 4294967294                         ; 324A _ BA, FFFFFFFE
        mov     rcx, rbx                                ; 324F _ 48: 89. D9
        mov     r8d, 2                                  ; 3252 _ 41: B8, 00000002
        call    _ZL8probe_abR8PositioniiPi              ; 3258 _ E8, FFFFE53B
        mov     edx, ebp                                ; 325D _ 89. EA
        mov     rcx, rbx                                ; 325F _ 48: 89. D9
        neg     eax                                     ; 3262 _ F7. D8
        mov     esi, eax                                ; 3264 _ 89. C6
        call    _ZN8Position9undo_moveE4Move            ; 3266 _ E8, 00000000(rel)
        cmp     dword [r15], 0                          ; 326B _ 41: 83. 3F, 00
        je      ?_400                                   ; 326F _ 0F 84, FFFFFF1A
        cmp     edi, esi                                ; 3275 _ 39. F7
        cmovl   edi, esi                                ; 3277 _ 0F 4C. FE
?_405:  add     r14, 8                                  ; 327A _ 49: 83. C6, 08
        jmp     ?_404                                   ; 327E _ E9, FFFFFF6D

?_406:  cmp     edi, -3                                 ; 3283 _ 83. FF, FD
        mov     esi, dword [rsp+48H]                    ; 3286 _ 8B. 74 24, 48
        je      ?_425                                   ; 328A _ 0F 84, 0000020B
        lea     r10d, [rdi+2H]                          ; 3290 _ 44: 8D. 57, 02
        cmp     esi, -100                               ; 3294 _ 83. FE, 9C
        lea     rcx, [rel _ZL10wdl_to_dtz]              ; 3297 _ 48: 8D. 0D, 00000880(rel)
        movsxd  r11, r10d                               ; 329E _ 4D: 63. DA
        mov     ebp, dword [rcx+r11*4]                  ; 32A1 _ 42: 8B. 2C 99
        jge     ?_407                                   ; 32A5 _ 7D, 0A
        test    ebp, ebp                                ; 32A7 _ 85. ED
        cmovns  esi, ebp                                ; 32A9 _ 0F 49. F5
        jmp     ?_425                                   ; 32AC _ E9, 000001EA

?_407:  test    esi, esi                                ; 32B1 _ 85. F6
        jns     ?_408                                   ; 32B3 _ 79, 0B
        cmp     ebp, -100                               ; 32B5 _ 83. FD, 9C
        cmovc   esi, ebp                                ; 32B8 _ 0F 42. F5
        jmp     ?_425                                   ; 32BB _ E9, 000001DB

?_408:  cmp     esi, 100                                ; 32C0 _ 83. FE, 64
        jle     ?_409                                   ; 32C3 _ 7E, 0A
        test    ebp, ebp                                ; 32C5 _ 85. ED
        cmovg   esi, ebp                                ; 32C7 _ 0F 4F. F5
        jmp     ?_425                                   ; 32CA _ E9, 000001CC

?_409:  test    esi, esi                                ; 32CF _ 85. F6
        jz      ?_410                                   ; 32D1 _ 74, 11
        dec     ebp                                     ; 32D3 _ FF. CD
        mov     r14d, 1                                 ; 32D5 _ 41: BE, 00000001
        cmove   esi, r14d                               ; 32DB _ 41: 0F 44. F6
        jmp     ?_425                                   ; 32DF _ E9, 000001B7

?_410:  test    ebp, ebp                                ; 32E4 _ 85. ED
        mov     esi, ebp                                ; 32E6 _ 89. EE
        jns     ?_425                                   ; 32E8 _ 0F 89, 000001AD
        mov     rsi, r13                                ; 32EE _ 4C: 89. EE
?_411:  cmp     rsi, r12                                ; 32F1 _ 4C: 39. E6
        jnc     ?_412                                   ; 32F4 _ 73, 29
        mov     edx, dword [rsi]                        ; 32F6 _ 8B. 16
        mov     r13d, edx                               ; 32F8 _ 41: 89. D5
        and     r13d, 0C000H                            ; 32FB _ 41: 81. E5, 0000C000
        cmp     r13d, 32768                             ; 3302 _ 41: 81. FD, 00008000
        jz      ?_413                                   ; 3309 _ 74, 1B
        mov     r8, qword [rsp+0C8H]                    ; 330B _ 4C: 8B. 84 24, 000000C8
        mov     rcx, rbx                                ; 3313 _ 48: 89. D9
        call    _ZNK8Position5legalE4Movey              ; 3316 _ E8, 00000000(rel)
        test    al, al                                  ; 331B _ 84. C0
        jz      ?_413                                   ; 331D _ 74, 07
?_412:  cmp     rsi, r12                                ; 331F _ 4C: 39. E6
        jnz     ?_417                                   ; 3322 _ 75, 3C
        jmp     ?_414                                   ; 3324 _ EB, 06

?_413:  add     rsi, 8                                  ; 3326 _ 48: 83. C6, 08
        jmp     ?_411                                   ; 332A _ EB, C5

?_414:  mov     r12, qword [rbx+3B8H]                   ; 332C _ 4C: 8B. A3, 000003B8
        cmp     qword [r12+38H], 0                      ; 3333 _ 49: 83. 7C 24, 38, 00
        je      ?_424                                   ; 3339 _ 0F 84, 00000149
        jmp     ?_418                                   ; 333F _ EB, 28

?_415:  mov     r8, qword [rsp+0C8H]                    ; 3341 _ 4C: 8B. 84 24, 000000C8
        mov     rcx, rbx                                ; 3349 _ 48: 89. D9
        mov     edx, dword [rsi]                        ; 334C _ 8B. 16
        call    _ZNK8Position5legalE4Movey              ; 334E _ E8, 00000000(rel)
        test    al, al                                  ; 3353 _ 84. C0
        jnz     ?_417                                   ; 3355 _ 75, 09
        add     rsi, 8                                  ; 3357 _ 48: 83. C6, 08
?_416:  cmp     rsi, r12                                ; 335B _ 4C: 39. E6
        jc      ?_415                                   ; 335E _ 72, E1
?_417:  cmp     rsi, r12                                ; 3360 _ 4C: 39. E6
        jne     ?_400                                   ; 3363 _ 0F 85, FFFFFE26
?_418:  mov     esi, ebp                                ; 3369 _ 89. EE
        jmp     ?_425                                   ; 336B _ E9, 0000012B

?_419:  mov     dword [r15], 0                          ; 3370 _ 41: C7. 07, 00000000
        xor     ecx, ecx                                ; 3377 _ 31. C9
        jmp     ?_387                                   ; 3379 _ E9, FFFFFC4D

?_420:  mov     r12, qword [r10+8H]                     ; 337E _ 4D: 8B. 62, 08
        lea     rcx, [rsp+50H]                          ; 3382 _ 48: 8D. 4C 24, 50
        mov     qword [rsp+48H], rcx                    ; 3387 _ 48: 89. 4C 24, 48
        mov     rdx, rcx                                ; 338C _ 48: 89. CA
        mov     rcx, rbx                                ; 338F _ 48: 89. D9
        cmp     qword [r12+8H], rbp                     ; 3392 _ 49: 39. 6C 24, 08
        setne   r12b                                    ; 3397 _ 41: 0F 95. C4
        movzx   r13d, r12b                              ; 339B _ 45: 0F B6. EC
        mov     r8d, r13d                               ; 339F _ 45: 89. E8
        call    _ZL7prt_strR8PositionPci                ; 33A2 _ E8, FFFFDBF5
        mov     rcx, qword [rel ?_030]                  ; 33A7 _ 48: 8B. 0D, 00000DB8(rel)
        test    rcx, rcx                                ; 33AE _ 48: 85. C9
        jz      ?_421                                   ; 33B1 _ 74, 05
        call    _ZL14free_dtz_entryP7TBEntry            ; 33B3 _ E8, FFFFD466
?_421:  lea     r9, [rel ?_029]                         ; 33B8 _ 4C: 8D. 0D, 00000DA8(rel)
        xor     eax, eax                                ; 33BF _ 31. C0
        mov     r10d, 6                                 ; 33C1 _ 41: BA, 00000006
        lea     r8, [rel ?_028]                         ; 33C7 _ 4C: 8D. 05, 00000D90(rel)
?_422:  lea     rdx, [r9+rax]                           ; 33CE _ 49: 8D. 14 01
        mov     rcx, r10                                ; 33D2 _ 4C: 89. D1
        lea     rsi, [r8+rax]                           ; 33D5 _ 49: 8D. 34 00
        sub     rax, 24                                 ; 33D9 _ 48: 83. E8, 18
        mov     rdi, rdx                                ; 33DD _ 48: 89. D7
        rep movsd                                       ; 33E0 _ F3: A5
        cmp     rax, -1512                              ; 33E2 _ 48: 3D, FFFFFA18
        jnz     ?_422                                   ; 33E8 _ 75, E4
        xor     r12d, 01H                               ; 33EA _ 41: 83. F4, 01
        mov     rcx, rbx                                ; 33EE _ 48: 89. D9
        movzx   edx, r12b                               ; 33F1 _ 41: 0F B6. D4
        call    _ZL8calc_keyR8Positioni                 ; 33F5 _ E8, FFFFDAF9
        mov     edx, r13d                               ; 33FA _ 44: 89. EA
        mov     rcx, rbx                                ; 33FD _ 48: 89. D9
        mov     r12, rax                                ; 3400 _ 49: 89. C4
        call    _ZL8calc_keyR8Positioni                 ; 3403 _ E8, FFFFDAEB
        mov     rcx, qword [rsp+48H]                    ; 3408 _ 48: 8B. 4C 24, 48
        mov     r8, r12                                 ; 340D _ 4D: 89. E0
        mov     rdx, rax                                ; 3410 _ 48: 89. C2
        call    _Z14load_dtz_tablePcyy                  ; 3413 _ E8, FFFFF02E
        jmp     ?_368                                   ; 3418 _ E9, FFFFF8D8

?_423:  mov     r8, qword [rsp+40H]                     ; 341D _ 4C: 8B. 44 24, 40
        mov     edx, r13d                               ; 3422 _ 44: 89. EA
        mov     rcx, rbx                                ; 3425 _ 48: 89. D9
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 3428 _ E8, 00000000(rel)
        mov     r8, r12                                 ; 342D _ 4D: 89. E0
        mov     edx, r13d                               ; 3430 _ 44: 89. EA
        mov     rcx, rbx                                ; 3433 _ 48: 89. D9
        movzx   r9d, al                                 ; 3436 _ 44: 0F B6. C8
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 343A _ E8, 00000000(rel)
        mov     rdx, r15                                ; 343F _ 4C: 89. FA
        mov     rcx, rbx                                ; 3442 _ 48: 89. D9
        call    _ZN10Tablebases9probe_dtzER8PositionPi  ; 3445 _ E8, FFFFF646
        mov     edx, r13d                               ; 344A _ 44: 89. EA
        mov     rcx, rbx                                ; 344D _ 48: 89. D9
        mov     r14d, eax                               ; 3450 _ 41: 89. C6
        mov     dword [rsp+48H], eax                    ; 3453 _ 89. 44 24, 48
        call    _ZN8Position9undo_moveE4Move            ; 3457 _ E8, 00000000(rel)
        neg     r14d                                    ; 345C _ 41: F7. DE
        cmp     dword [r15], 0                          ; 345F _ 41: 83. 3F, 00
        je      ?_353                                   ; 3463 _ 0F 84, FFFFF668
        test    r14d, r14d                              ; 3469 _ 45: 85. F6
        jle     ?_391                                   ; 346C _ 0F 8E, FFFFFC14
        mov     eax, dword [rsp+48H]                    ; 3472 _ 8B. 44 24, 48
        mov     r8d, ebp                                ; 3476 _ 41: 89. E8
        sub     r8d, eax                                ; 3479 _ 41: 29. C0
        cmp     esi, r8d                                ; 347C _ 44: 39. C6
        cmovg   esi, r8d                                ; 347F _ 41: 0F 4F. F0
        jmp     ?_391                                   ; 3483 _ E9, FFFFFBFE

?_424:  mov     rdx, rsi                                ; 3488 _ 48: 89. F2
        mov     rcx, rbx                                ; 348B _ 48: 89. D9
        call    _Z8generateIL7GenType1EEP7ExtMoveRK8PositionS2_; 348E _ E8, 00000000(rel)
        mov     r12, rax                                ; 3493 _ 49: 89. C4
        jmp     ?_416                                   ; 3496 _ E9, FFFFFEC0
; _ZN10Tablebases9probe_dtzER8PositionPi End of function

?_425:  ; Local function
        mov     eax, esi                                ; 349B _ 89. F0
        add     rsp, 1832                               ; 349D _ 48: 81. C4, 00000728
        pop     rbx                                     ; 34A4 _ 5B
        pop     rsi                                     ; 34A5 _ 5E
        pop     rdi                                     ; 34A6 _ 5F
        pop     rbp                                     ; 34A7 _ 5D
        pop     r12                                     ; 34A8 _ 41: 5C
        pop     r13                                     ; 34AA _ 41: 5D
        pop     r14                                     ; 34AC _ 41: 5E
        pop     r15                                     ; 34AE _ 41: 5F
        ret                                             ; 34B0 _ C3

_ZN10Tablebases14root_probe_wdlER8PositionRSt6vectorIN6Search8RootMoveESaIS4_EER5Value:; Function begin
        push    r15                                     ; 34B1 _ 41: 57
        push    r14                                     ; 34B3 _ 41: 56
        push    r13                                     ; 34B5 _ 41: 55
        push    r12                                     ; 34B7 _ 41: 54
        push    rbp                                     ; 34B9 _ 55
        push    rdi                                     ; 34BA _ 57
        push    rsi                                     ; 34BB _ 56
        push    rbx                                     ; 34BC _ 53
        sub     rsp, 280                                ; 34BD _ 48: 81. EC, 00000118
        lea     rdi, [rsp+3CH]                          ; 34C4 _ 48: 8D. 7C 24, 3C
        mov     rsi, rdx                                ; 34C9 _ 48: 89. D6
        mov     rbx, rcx                                ; 34CC _ 48: 89. CB
        mov     rdx, rdi                                ; 34CF _ 48: 89. FA
        mov     rbp, r8                                 ; 34D2 _ 4C: 89. C5
        call    _ZN10Tablebases9probe_wdlER8PositionPi  ; 34D5 _ E8, FFFFF3AC
        cmp     dword [rsp+3CH], 0                      ; 34DA _ 83. 7C 24, 3C, 00
        jnz     ?_427                                   ; 34DF _ 75, 07
?_426:  xor     eax, eax                                ; 34E1 _ 31. C0
        jmp     ?_434                                   ; 34E3 _ E9, 00000185

?_427:  lea     rdx, [rel _ZL12wdl_to_Value]            ; 34E8 _ 48: 8D. 15, 00000010(rel)
        add     eax, 2                                  ; 34EF _ 83. C0, 02
        xor     r14d, r14d                              ; 34F2 _ 45: 31. F6
        lea     r12, [rsp+0B0H]                         ; 34F5 _ 4C: 8D. A4 24, 000000B0
        cdqe                                            ; 34FD _ 48: 98
        mov     eax, dword [rdx+rax*4]                  ; 34FF _ 8B. 04 82
        mov     rcx, r12                                ; 3502 _ 4C: 89. E1
        mov     rdx, rbx                                ; 3505 _ 48: 89. DA
        mov     dword [rbp], eax                        ; 3508 _ 89. 45, 00
        mov     ebp, 4294967294                         ; 350B _ BD, FFFFFFFE
        call    _ZN9CheckInfoC1ERK8Position             ; 3510 _ E8, 00000000(rel)
        lea     rcx, [rsp+60H]                          ; 3515 _ 48: 8D. 4C 24, 60
        mov     qword [rsp+20H], rcx                    ; 351A _ 48: 89. 4C 24, 20
?_428:  mov     r8, qword [rsi]                         ; 351F _ 4C: 8B. 06
        mov     r9, qword [rsi+8H]                      ; 3522 _ 4C: 8B. 4E, 08
        sub     r9, r8                                  ; 3526 _ 4D: 29. C1
        sar     r9, 5                                   ; 3529 _ 49: C1. F9, 05
        cmp     r14, r9                                 ; 352D _ 4D: 39. CE
        jnc     ?_429                                   ; 3530 _ 73, 77
        mov     rcx, r14                                ; 3532 _ 4C: 89. F1
        shl     rcx, 5                                  ; 3535 _ 48: C1. E1, 05
        mov     rax, qword [r8+rcx+8H]                  ; 3539 _ 49: 8B. 44 08, 08
        mov     qword [rsp+28H], rcx                    ; 353E _ 48: 89. 4C 24, 28
        mov     r8, r12                                 ; 3543 _ 4D: 89. E0
        mov     rcx, rbx                                ; 3546 _ 48: 89. D9
        mov     r15d, dword [rax]                       ; 3549 _ 44: 8B. 38
        mov     edx, r15d                               ; 354C _ 44: 89. FA
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 354F _ E8, 00000000(rel)
        mov     r8, qword [rsp+20H]                     ; 3554 _ 4C: 8B. 44 24, 20
        mov     edx, r15d                               ; 3559 _ 44: 89. FA
        mov     rcx, rbx                                ; 355C _ 48: 89. D9
        movzx   r9d, al                                 ; 355F _ 44: 0F B6. C8
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 3563 _ E8, 00000000(rel)
        mov     rdx, rdi                                ; 3568 _ 48: 89. FA
        mov     rcx, rbx                                ; 356B _ 48: 89. D9
        call    _ZN10Tablebases9probe_wdlER8PositionPi  ; 356E _ E8, FFFFF313
        mov     edx, r15d                               ; 3573 _ 44: 89. FA
        mov     rcx, rbx                                ; 3576 _ 48: 89. D9
        neg     eax                                     ; 3579 _ F7. D8
        mov     r13d, eax                               ; 357B _ 41: 89. C5
        call    _ZN8Position9undo_moveE4Move            ; 357E _ E8, 00000000(rel)
        cmp     dword [rsp+3CH], 0                      ; 3583 _ 83. 7C 24, 3C, 00
        je      ?_426                                   ; 3588 _ 0F 84, FFFFFF53
        mov     r8, qword [rsi]                         ; 358E _ 4C: 8B. 06
        cmp     ebp, r13d                               ; 3591 _ 44: 39. ED
        cmovl   ebp, r13d                               ; 3594 _ 41: 0F 4C. ED
        mov     r9, qword [rsp+28H]                     ; 3598 _ 4C: 8B. 4C 24, 28
        inc     r14                                     ; 359D _ 49: FF. C6
        mov     dword [r8+r9], r13d                     ; 35A0 _ 47: 89. 2C 08
        jmp     ?_428                                   ; 35A4 _ E9, FFFFFF76

?_429:  xor     r14d, r14d                              ; 35A9 _ 45: 31. F6
        xor     ebx, ebx                                ; 35AC _ 31. DB
?_430:  mov     r10, qword [rsi]                        ; 35AE _ 4C: 8B. 16
        mov     rdi, qword [rsi+8H]                     ; 35B1 _ 48: 8B. 7E, 08
        sub     rdi, r10                                ; 35B5 _ 4C: 29. D7
        sar     rdi, 5                                  ; 35B8 _ 48: C1. FF, 05
        cmp     r14, rdi                                ; 35BC _ 49: 39. FE
        jnc     ?_432                                   ; 35BF _ 73, 38
        mov     r15, r14                                ; 35C1 _ 4D: 89. F7
        shl     r15, 5                                  ; 35C4 _ 49: C1. E7, 05
        add     r15, r10                                ; 35C8 _ 4D: 01. D7
        cmp     ebp, dword [r15]                        ; 35CB _ 41: 3B. 2F
        jnz     ?_431                                   ; 35CE _ 75, 24
        mov     edx, dword [r15+4H]                     ; 35D0 _ 41: 8B. 57, 04
        lea     rdi, [rbx+1H]                           ; 35D4 _ 48: 8D. 7B, 01
        shl     rbx, 5                                  ; 35D8 _ 48: C1. E3, 05
        add     rbx, r10                                ; 35DC _ 4C: 01. D3
        mov     dword [rbx], ebp                        ; 35DF _ 89. 2B
        lea     rcx, [rbx+8H]                           ; 35E1 _ 48: 8D. 4B, 08
        mov     dword [rbx+4H], edx                     ; 35E5 _ 89. 53, 04
        lea     rdx, [r15+8H]                           ; 35E8 _ 49: 8D. 57, 08
        mov     rbx, rdi                                ; 35EC _ 48: 89. FB
        call    _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_      ; 35EF _ E8, 00000000(rel)
?_431:  inc     r14                                     ; 35F4 _ 49: FF. C6
        jmp     ?_430                                   ; 35F7 _ EB, B5

?_432:  lea     rcx, [rsp+48H]                          ; 35F9 _ 48: 8D. 4C 24, 48
        mov     edx, 1                                  ; 35FE _ BA, 00000001
        mov     dword [rsp+40H], -32001                 ; 3603 _ C7. 44 24, 40, FFFF82FF
        mov     dword [rsp+44H], -32001                 ; 360B _ C7. 44 24, 44, FFFF82FF
        lea     r12, [rsp+40H]                          ; 3613 _ 4C: 8D. 64 24, 40
        mov     qword [rsp+48H], 0                      ; 3618 _ 48: C7. 44 24, 48, 00000000
        mov     qword [rsp+50H], 0                      ; 3621 _ 48: C7. 44 24, 50, 00000000
        mov     qword [rsp+58H], 0                      ; 362A _ 48: C7. 44 24, 58, 00000000
        call    _ZNSt12_Vector_baseI4MoveSaIS0_EE17_M_create_storageEy; 3633 _ E8, 00000000(rel)
        mov     r11, qword [rsp+48H]                    ; 3638 _ 4C: 8B. 5C 24, 48
        mov     rcx, rsi                                ; 363D _ 48: 89. F1
        mov     r8, r12                                 ; 3640 _ 4D: 89. E0
        mov     r13, qword [rsp+58H]                    ; 3643 _ 4C: 8B. 6C 24, 58
        mov     rdx, rbx                                ; 3648 _ 48: 89. DA
        mov     dword [r11], 0                          ; 364B _ 41: C7. 03, 00000000
        mov     qword [rsp+50H], r13                    ; 3652 _ 4C: 89. 6C 24, 50
        call    _ZNSt6vectorIN6Search8RootMoveESaIS1_EE6resizeEyRKS1_; 3657 _ E8, 00000000(rel)
        mov     rcx, qword [rsp+48H]                    ; 365C _ 48: 8B. 4C 24, 48
        test    rcx, rcx                                ; 3661 _ 48: 85. C9
        jz      ?_433                                   ; 3664 _ 74, 05
        call    _ZdlPv                                  ; 3666 _ E8, 00000000(rel)
?_433:  mov     al, 1                                   ; 366B _ B0, 01
?_434:  add     rsp, 280                                ; 366D _ 48: 81. C4, 00000118
        pop     rbx                                     ; 3674 _ 5B
        pop     rsi                                     ; 3675 _ 5E
        pop     rdi                                     ; 3676 _ 5F
        pop     rbp                                     ; 3677 _ 5D
        pop     r12                                     ; 3678 _ 41: 5C
        pop     r13                                     ; 367A _ 41: 5D
        pop     r14                                     ; 367C _ 41: 5E
        pop     r15                                     ; 367E _ 41: 5F
        ret                                             ; 3680 _ C3
; _ZN10Tablebases14root_probe_wdlER8PositionRSt6vectorIN6Search8RootMoveESaIS4_EER5Value End of function

_ZN10Tablebases10root_probeER8PositionRSt6vectorIN6Search8RootMoveESaIS4_EER5Value:; Function begin
        push    r15                                     ; 3681 _ 41: 57
        push    r14                                     ; 3683 _ 41: 56
        push    r13                                     ; 3685 _ 41: 55
        push    r12                                     ; 3687 _ 41: 54
        push    rbp                                     ; 3689 _ 55
        push    rdi                                     ; 368A _ 57
        push    rsi                                     ; 368B _ 56
        push    rbx                                     ; 368C _ 53
        sub     rsp, 1832                               ; 368D _ 48: 81. EC, 00000728
        lea     r14, [rsp+4CH]                          ; 3694 _ 4C: 8D. 74 24, 4C
        mov     rbx, rdx                                ; 3699 _ 48: 89. D3
        mov     rdi, rcx                                ; 369C _ 48: 89. CF
        mov     rdx, r14                                ; 369F _ 4C: 89. F2
        mov     r13, r8                                 ; 36A2 _ 4D: 89. C5
        call    _ZN10Tablebases9probe_dtzER8PositionPi  ; 36A5 _ E8, FFFFF3E6
        cmp     dword [rsp+4CH], 0                      ; 36AA _ 83. 7C 24, 4C, 00
        mov     esi, eax                                ; 36AF _ 89. C6
        jnz     ?_436                                   ; 36B1 _ 75, 07
?_435:  xor     eax, eax                                ; 36B3 _ 31. C0
        jmp     ?_471                                   ; 36B5 _ E9, 0000040E

?_436:  lea     rax, [rsp+0C0H]                         ; 36BA _ 48: 8D. 84 24, 000000C0
        mov     rdx, rdi                                ; 36C2 _ 48: 89. FA
        xor     ebp, ebp                                ; 36C5 _ 31. ED
        mov     rcx, rax                                ; 36C7 _ 48: 89. C1
        mov     qword [rsp+20H], rax                    ; 36CA _ 48: 89. 44 24, 20
        call    _ZN9CheckInfoC1ERK8Position             ; 36CF _ E8, 00000000(rel)
        lea     rdx, [rsp+70H]                          ; 36D4 _ 48: 8D. 54 24, 70
        lea     rcx, [rsp+120H]                         ; 36D9 _ 48: 8D. 8C 24, 00000120
        mov     qword [rsp+30H], rdx                    ; 36E1 _ 48: 89. 54 24, 30
        mov     qword [rsp+28H], rcx                    ; 36E6 _ 48: 89. 4C 24, 28
?_437:  mov     r8, qword [rbx]                         ; 36EB _ 4C: 8B. 03
        mov     r12, qword [rbx+8H]                     ; 36EE _ 4C: 8B. 63, 08
        sub     r12, r8                                 ; 36F2 _ 4D: 29. C4
        sar     r12, 5                                  ; 36F5 _ 49: C1. FC, 05
        cmp     rbp, r12                                ; 36F9 _ 4C: 39. E5
        jnc     ?_442                                   ; 36FC _ 0F 83, 000000C3
        mov     r12, rbp                                ; 3702 _ 49: 89. EC
        mov     rcx, rdi                                ; 3705 _ 48: 89. F9
        shl     r12, 5                                  ; 3708 _ 49: C1. E4, 05
        mov     r8, qword [r8+r12+8H]                   ; 370C _ 4F: 8B. 44 20, 08
        mov     r15d, dword [r8]                        ; 3711 _ 45: 8B. 38
        mov     r8, qword [rsp+20H]                     ; 3714 _ 4C: 8B. 44 24, 20
        mov     edx, r15d                               ; 3719 _ 44: 89. FA
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 371C _ E8, 00000000(rel)
        mov     r8, qword [rsp+30H]                     ; 3721 _ 4C: 8B. 44 24, 30
        mov     edx, r15d                               ; 3726 _ 44: 89. FA
        mov     rcx, rdi                                ; 3729 _ 48: 89. F9
        movzx   r9d, al                                 ; 372C _ 44: 0F B6. C8
        call    _ZN8Position7do_moveE4MoveR9StateInfob  ; 3730 _ E8, 00000000(rel)
        test    esi, esi                                ; 3735 _ 85. F6
        jle     ?_438                                   ; 3737 _ 7E, 12
        mov     r10, qword [rdi+3B8H]                   ; 3739 _ 4C: 8B. 97, 000003B8
        cmp     qword [r10+38H], 0                      ; 3740 _ 49: 83. 7A, 38, 00
        jne     ?_470                                   ; 3745 _ 0F 85, 0000035B
?_438:  cmp     dword [rsp+8CH], 0                      ; 374B _ 83. BC 24, 0000008C, 00
        mov     rdx, r14                                ; 3753 _ 4C: 89. F2
        mov     rcx, rdi                                ; 3756 _ 48: 89. F9
        jz      ?_440                                   ; 3759 _ 74, 20
        call    _ZN10Tablebases9probe_dtzER8PositionPi  ; 375B _ E8, FFFFF330
        mov     edx, eax                                ; 3760 _ 89. C2
        neg     edx                                     ; 3762 _ F7. DA
        cmp     edx, 0                                  ; 3764 _ 83. FA, 00
        jle     ?_439                                   ; 3767 _ 7E, 0B
        mov     ecx, 1                                  ; 3769 _ B9, 00000001
        sub     ecx, eax                                ; 376E _ 29. C1
        mov     eax, ecx                                ; 3770 _ 89. C8
        jmp     ?_441                                   ; 3772 _ EB, 23

?_439:  not     eax                                     ; 3774 _ F7. D0
        cmove   eax, edx                                ; 3776 _ 0F 44. C2
        jmp     ?_441                                   ; 3779 _ EB, 1C

?_440:  call    _ZN10Tablebases9probe_wdlER8PositionPi  ; 377B _ E8, FFFFF106
        mov     r9d, 2                                  ; 3780 _ 41: B9, 00000002
        sub     r9d, eax                                ; 3786 _ 41: 29. C1
        lea     rax, [rel _ZL10wdl_to_dtz]              ; 3789 _ 48: 8D. 05, 00000880(rel)
        movsxd  r11, r9d                                ; 3790 _ 4D: 63. D9
        mov     eax, dword [rax+r11*4]                  ; 3793 _ 42: 8B. 04 98
?_441:  mov     edx, r15d                               ; 3797 _ 44: 89. FA
        mov     rcx, rdi                                ; 379A _ 48: 89. F9
        mov     dword [rsp+3CH], eax                    ; 379D _ 89. 44 24, 3C
        call    _ZN8Position9undo_moveE4Move            ; 37A1 _ E8, 00000000(rel)
        cmp     dword [rsp+4CH], 0                      ; 37A6 _ 83. 7C 24, 4C, 00
        je      ?_435                                   ; 37AB _ 0F 84, FFFFFF02
        add     r12, qword [rbx]                        ; 37B1 _ 4C: 03. 23
        inc     rbp                                     ; 37B4 _ 48: FF. C5
        mov     r8d, dword [rsp+3CH]                    ; 37B7 _ 44: 8B. 44 24, 3C
        mov     dword [r12], r8d                        ; 37BC _ 45: 89. 04 24
        jmp     ?_437                                   ; 37C0 _ E9, FFFFFF26

?_442:  mov     r10, qword [rsp+0B8H]                   ; 37C5 _ 4C: 8B. 94 24, 000000B8
        cmp     esi, 0                                  ; 37CD _ 83. FE, 00
        mov     r9d, dword [r10+1CH]                    ; 37D0 _ 45: 8B. 4A, 1C
        jle     ?_443                                   ; 37D4 _ 7E, 15
        lea     r11d, [rsi+r9]                          ; 37D6 _ 46: 8D. 1C 0E
        cmp     r11d, 101                               ; 37DA _ 41: 83. FB, 65
        setl    r15b                                    ; 37DE _ 41: 0F 9C. C7
        movzx   r14d, r15b                              ; 37E2 _ 45: 0F B6. F7
        inc     r14d                                    ; 37E6 _ 41: FF. C6
        jmp     ?_444                                   ; 37E9 _ EB, 1C

?_443:  mov     r14d, 0                                 ; 37EB _ 41: BE, 00000000
        jz      ?_444                                   ; 37F1 _ 74, 14
        mov     edi, r9d                                ; 37F3 _ 44: 89. CF
        sub     edi, esi                                ; 37F6 _ 29. F7
        cmp     edi, 101                                ; 37F8 _ 83. FF, 65
        setge   bpl                                     ; 37FB _ 40: 0F 9D. C5
        movzx   r14d, bpl                               ; 37FF _ 44: 0F B6. F5
        sub     r14d, 2                                 ; 3803 _ 41: 83. EE, 02
?_444:  lea     eax, [r14+2H]                           ; 3807 _ 41: 8D. 46, 02
        cmp     r14d, 1                                 ; 380B _ 41: 83. FE, 01
        lea     rcx, [rel _ZL12wdl_to_Value]            ; 380F _ 48: 8D. 0D, 00000010(rel)
        movsxd  rdx, eax                                ; 3816 _ 48: 63. D0
        mov     edi, dword [rcx+rdx*4]                  ; 3819 _ 8B. 3C 91
        jnz     ?_445                                   ; 381C _ 75, 23
        cmp     esi, 100                                ; 381E _ 83. FE, 64
        jg      ?_445                                   ; 3821 _ 7F, 1E
        mov     ebp, 200                                ; 3823 _ BD, 000000C8
        mov     r14d, ebp                               ; 3828 _ 41: 89. EE
        sub     r14d, esi                               ; 382B _ 41: 29. F6
        sub     r14d, r9d                               ; 382E _ 45: 29. CE
        imul    eax, r14d, 258                          ; 3831 _ 41: 69. C6, 00000102
        cdq                                             ; 3838 _ 99
        idiv    ebp                                     ; 3839 _ F7. FD
        mov     dword [r13], eax                        ; 383B _ 41: 89. 45, 00
        jmp     ?_448                                   ; 383F _ EB, 31

?_445:  inc     r14d                                    ; 3841 _ 41: FF. C6
        jnz     ?_446                                   ; 3844 _ 75, 05
        cmp     esi, -100                               ; 3846 _ 83. FE, 9C
        jge     ?_447                                   ; 3849 _ 7D, 06
?_446:  mov     dword [r13], edi                        ; 384B _ 41: 89. 7D, 00
        jmp     ?_448                                   ; 384F _ EB, 21

?_447:  lea     r11d, [rsi+0C8H]                        ; 3851 _ 44: 8D. 9E, 000000C8
        mov     r15d, 200                               ; 3858 _ 41: BF, 000000C8
        sub     r11d, r9d                               ; 385E _ 45: 29. CB
        imul    eax, r11d, 258                          ; 3861 _ 41: 69. C3, 00000102
        cdq                                             ; 3868 _ 99
        idiv    r15d                                    ; 3869 _ 41: F7. FF
        neg     eax                                     ; 386C _ F7. D8
        mov     dword [r13], eax                        ; 386E _ 41: 89. 45, 00
?_448:  cmp     esi, 0                                  ; 3872 _ 83. FE, 00
        jle     ?_459                                   ; 3875 _ 0F 8E, 000000D7
        xor     r13d, r13d                              ; 387B _ 45: 31. ED
        mov     esi, 65535                              ; 387E _ BE, 0000FFFF
?_449:  cmp     r13, r12                                ; 3883 _ 4D: 39. E5
        jz      ?_452                                   ; 3886 _ 74, 1C
        mov     rdx, r13                                ; 3888 _ 4C: 89. EA
        shl     rdx, 5                                  ; 388B _ 48: C1. E2, 05
        mov     ecx, dword [r8+rdx]                     ; 388F _ 41: 8B. 0C 10
        cmp     ecx, esi                                ; 3893 _ 39. F1
        jge     ?_450                                   ; 3895 _ 7D, 04
        test    ecx, ecx                                ; 3897 _ 85. C9
        jg      ?_451                                   ; 3899 _ 7F, 02
?_450:  mov     ecx, esi                                ; 389B _ 89. F1
?_451:  inc     r13                                     ; 389D _ 49: FF. C5
        mov     esi, ecx                                ; 38A0 _ 89. CE
        jmp     ?_449                                   ; 38A2 _ EB, DF

?_452:  mov     r13d, esi                               ; 38A4 _ 41: 89. F5
?_453:  mov     r12d, dword [r10+20H]                   ; 38A7 _ 45: 8B. 62, 20
        cmp     dword [r10+1CH], r12d                   ; 38AB _ 45: 39. 62, 1C
        cmovle  r12d, dword [r10+1CH]                   ; 38AF _ 45: 0F 4E. 62, 1C
        cmp     r12d, 3                                 ; 38B4 _ 41: 83. FC, 03
        jle     ?_455                                   ; 38B8 _ 7E, 2C
        mov     r14, qword [r10+48H]                    ; 38BA _ 4D: 8B. 72, 48
        mov     ecx, 4                                  ; 38BE _ B9, 00000004
        mov     r10, qword [r10+30H]                    ; 38C3 _ 4D: 8B. 52, 30
        mov     rbp, qword [r14+48H]                    ; 38C7 _ 49: 8B. 6E, 48
?_454:  mov     r8, qword [rbp+48H]                     ; 38CB _ 4C: 8B. 45, 48
        mov     rbp, qword [r8+48H]                     ; 38CF _ 49: 8B. 68, 48
        cmp     qword [rbp+30H], r10                    ; 38D3 _ 4C: 39. 55, 30
        jz      ?_456                                   ; 38D7 _ 74, 1E
        add     ecx, 2                                  ; 38D9 _ 83. C1, 02
        cmp     ecx, r12d                               ; 38DC _ 44: 39. E1
        jle     ?_454                                   ; 38DF _ 7E, EA
        mov     r10, r14                                ; 38E1 _ 4D: 89. F2
        jmp     ?_453                                   ; 38E4 _ EB, C1

?_455:  add     esi, r9d                                ; 38E6 _ 44: 01. CE
        cmp     esi, 99                                 ; 38E9 _ 83. FE, 63
        jg      ?_456                                   ; 38EC _ 7F, 09
        mov     r13d, 99                                ; 38EE _ 41: BD, 00000063
        sub     r13d, r9d                               ; 38F4 _ 45: 29. CD
?_456:  xor     esi, esi                                ; 38F7 _ 31. F6
        xor     r14d, r14d                              ; 38F9 _ 45: 31. F6
?_457:  mov     rcx, qword [rbx]                        ; 38FC _ 48: 8B. 0B
        mov     r9, qword [rbx+8H]                      ; 38FF _ 4C: 8B. 4B, 08
        sub     r9, rcx                                 ; 3903 _ 49: 29. C9
        sar     r9, 5                                   ; 3906 _ 49: C1. F9, 05
        cmp     rsi, r9                                 ; 390A _ 4C: 39. CE
        jnc     ?_468                                   ; 390D _ 0F 83, 0000011E
        mov     rdx, rsi                                ; 3913 _ 48: 89. F2
        shl     rdx, 5                                  ; 3916 _ 48: C1. E2, 05
        add     rdx, rcx                                ; 391A _ 48: 01. CA
        mov     eax, dword [rdx]                        ; 391D _ 8B. 02
        cmp     eax, r13d                               ; 391F _ 44: 39. E8
        jg      ?_458                                   ; 3922 _ 7F, 29
        test    eax, eax                                ; 3924 _ 85. C0
        jle     ?_458                                   ; 3926 _ 7E, 25
        lea     r12, [r14+1H]                           ; 3928 _ 4D: 8D. 66, 01
        shl     r14, 5                                  ; 392C _ 49: C1. E6, 05
        add     rdx, 8                                  ; 3930 _ 48: 83. C2, 08
        add     rcx, r14                                ; 3934 _ 4C: 01. F1
        mov     r14d, dword [rdx-4H]                    ; 3937 _ 44: 8B. 72, FC
        mov     dword [rcx], eax                        ; 393B _ 89. 01
        add     rcx, 8                                  ; 393D _ 48: 83. C1, 08
        mov     dword [rcx-4H], r14d                    ; 3941 _ 44: 89. 71, FC
        mov     r14, r12                                ; 3945 _ 4D: 89. E6
        call    _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_      ; 3948 _ E8, 00000000(rel)
?_458:  inc     rsi                                     ; 394D _ 48: FF. C6
        jmp     ?_457                                   ; 3950 _ EB, AA

?_459:  jnz     ?_460                                   ; 3952 _ 75, 0B
        xor     r13d, r13d                              ; 3954 _ 45: 31. ED
        xor     r14d, r14d                              ; 3957 _ 45: 31. F6
        jmp     ?_467                                   ; 395A _ E9, 000000BF

?_460:  xor     ecx, ecx                                ; 395F _ 31. C9
        xor     ebp, ebp                                ; 3961 _ 31. ED
?_461:  cmp     rcx, r12                                ; 3963 _ 4C: 39. E1
        jz      ?_462                                   ; 3966 _ 74, 15
        mov     rax, rcx                                ; 3968 _ 48: 89. C8
        shl     rax, 5                                  ; 396B _ 48: C1. E0, 05
        mov     edx, dword [r8+rax]                     ; 396F _ 41: 8B. 14 00
        cmp     ebp, edx                                ; 3973 _ 39. D5
        cmovg   ebp, edx                                ; 3975 _ 0F 4F. EA
        inc     rcx                                     ; 3978 _ 48: FF. C1
        jmp     ?_461                                   ; 397B _ EB, E6

?_462:  imul    r8d, ebp, -2                            ; 397D _ 44: 6B. C5, FE
        mov     al, 1                                   ; 3981 _ B0, 01
        add     r9d, r8d                                ; 3983 _ 45: 01. C1
        cmp     r9d, 99                                 ; 3986 _ 41: 83. F9, 63
        jle     ?_471                                   ; 398A _ 0F 8E, 00000138
        xor     r15d, r15d                              ; 3990 _ 45: 31. FF
        xor     r14d, r14d                              ; 3993 _ 45: 31. F6
?_463:  mov     rcx, qword [rbx]                        ; 3996 _ 48: 8B. 0B
        mov     r9, qword [rbx+8H]                      ; 3999 _ 4C: 8B. 4B, 08
        sub     r9, rcx                                 ; 399D _ 49: 29. C9
        sar     r9, 5                                   ; 39A0 _ 49: C1. F9, 05
        cmp     r15, r9                                 ; 39A4 _ 4D: 39. CF
        jnc     ?_468                                   ; 39A7 _ 0F 83, 00000084
        mov     rdx, r15                                ; 39AD _ 4C: 89. FA
        shl     rdx, 5                                  ; 39B0 _ 48: C1. E2, 05
        add     rdx, rcx                                ; 39B4 _ 48: 01. CA
        cmp     ebp, dword [rdx]                        ; 39B7 _ 3B. 2A
        jnz     ?_464                                   ; 39B9 _ 75, 25
        mov     r11d, dword [rdx+4H]                    ; 39BB _ 44: 8B. 5A, 04
        lea     rdi, [r14+1H]                           ; 39BF _ 49: 8D. 7E, 01
        shl     r14, 5                                  ; 39C3 _ 49: C1. E6, 05
        add     rdx, 8                                  ; 39C7 _ 48: 83. C2, 08
        add     rcx, r14                                ; 39CB _ 4C: 01. F1
        mov     r14, rdi                                ; 39CE _ 49: 89. FE
        mov     dword [rcx], ebp                        ; 39D1 _ 89. 29
        add     rcx, 8                                  ; 39D3 _ 48: 83. C1, 08
        mov     dword [rcx-4H], r11d                    ; 39D7 _ 44: 89. 59, FC
        call    _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_      ; 39DB _ E8, 00000000(rel)
?_464:  inc     r15                                     ; 39E0 _ 49: FF. C7
        jmp     ?_463                                   ; 39E3 _ EB, B1

?_465:  mov     rdx, r13                                ; 39E5 _ 4C: 89. EA
        shl     rdx, 5                                  ; 39E8 _ 48: C1. E2, 05
        add     rdx, rcx                                ; 39EC _ 48: 01. CA
        cmp     dword [rdx], 0                          ; 39EF _ 83. 3A, 00
        jnz     ?_466                                   ; 39F2 _ 75, 27
        mov     esi, dword [rdx+4H]                     ; 39F4 _ 8B. 72, 04
        lea     r12, [r14+1H]                           ; 39F7 _ 4D: 8D. 66, 01
        shl     r14, 5                                  ; 39FB _ 49: C1. E6, 05
        add     rdx, 8                                  ; 39FF _ 48: 83. C2, 08
        add     rcx, r14                                ; 3A03 _ 4C: 01. F1
        mov     r14, r12                                ; 3A06 _ 4D: 89. E6
        mov     dword [rcx], 0                          ; 3A09 _ C7. 01, 00000000
        add     rcx, 8                                  ; 3A0F _ 48: 83. C1, 08
        mov     dword [rcx-4H], esi                     ; 3A13 _ 89. 71, FC
        call    _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_      ; 3A16 _ E8, 00000000(rel)
?_466:  inc     r13                                     ; 3A1B _ 49: FF. C5
?_467:  mov     rcx, qword [rbx]                        ; 3A1E _ 48: 8B. 0B
        mov     r10, qword [rbx+8H]                     ; 3A21 _ 4C: 8B. 53, 08
        sub     r10, rcx                                ; 3A25 _ 49: 29. CA
        sar     r10, 5                                  ; 3A28 _ 49: C1. FA, 05
        cmp     r13, r10                                ; 3A2C _ 4D: 39. D5
        jc      ?_465                                   ; 3A2F _ 72, B4
?_468:  lea     rcx, [rsp+58H]                          ; 3A31 _ 48: 8D. 4C 24, 58
        mov     edx, 1                                  ; 3A36 _ BA, 00000001
        mov     dword [rsp+50H], -32001                 ; 3A3B _ C7. 44 24, 50, FFFF82FF
        mov     dword [rsp+54H], -32001                 ; 3A43 _ C7. 44 24, 54, FFFF82FF
        lea     r15, [rsp+50H]                          ; 3A4B _ 4C: 8D. 7C 24, 50
        mov     qword [rsp+58H], 0                      ; 3A50 _ 48: C7. 44 24, 58, 00000000
        mov     qword [rsp+60H], 0                      ; 3A59 _ 48: C7. 44 24, 60, 00000000
        mov     qword [rsp+68H], 0                      ; 3A62 _ 48: C7. 44 24, 68, 00000000
        call    _ZNSt12_Vector_baseI4MoveSaIS0_EE17_M_create_storageEy; 3A6B _ E8, 00000000(rel)
        mov     rdi, qword [rsp+58H]                    ; 3A70 _ 48: 8B. 7C 24, 58
        mov     rcx, rbx                                ; 3A75 _ 48: 89. D9
        mov     r8, r15                                 ; 3A78 _ 4D: 89. F8
        mov     r11, qword [rsp+68H]                    ; 3A7B _ 4C: 8B. 5C 24, 68
        mov     rdx, r14                                ; 3A80 _ 4C: 89. F2
        mov     dword [rdi], 0                          ; 3A83 _ C7. 07, 00000000
        mov     qword [rsp+60H], r11                    ; 3A89 _ 4C: 89. 5C 24, 60
        call    _ZNSt6vectorIN6Search8RootMoveESaIS1_EE6resizeEyRKS1_; 3A8E _ E8, 00000000(rel)
        mov     rcx, qword [rsp+58H]                    ; 3A93 _ 48: 8B. 4C 24, 58
        test    rcx, rcx                                ; 3A98 _ 48: 85. C9
        jz      ?_469                                   ; 3A9B _ 74, 05
        call    _ZdlPv                                  ; 3A9D _ E8, 00000000(rel)
?_469:  mov     al, 1                                   ; 3AA2 _ B0, 01
        jmp     ?_471                                   ; 3AA4 _ EB, 22

?_470:  mov     rdx, qword [rsp+28H]                    ; 3AA6 _ 48: 8B. 54 24, 28
        mov     rcx, rdi                                ; 3AAB _ 48: 89. F9
        call    _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_; 3AAE _ E8, 00000000(rel)
        cmp     rax, qword [rsp+28H]                    ; 3AB3 _ 48: 3B. 44 24, 28
        jne     ?_438                                   ; 3AB8 _ 0F 85, FFFFFC8D
        mov     eax, 1                                  ; 3ABE _ B8, 00000001
        jmp     ?_441                                   ; 3AC3 _ E9, FFFFFCCF
; _ZN10Tablebases10root_probeER8PositionRSt6vectorIN6Search8RootMoveESaIS4_EER5Value End of function

?_471:  ; Local function
        add     rsp, 1832                               ; 3AC8 _ 48: 81. C4, 00000728
        pop     rbx                                     ; 3ACF _ 5B
        pop     rsi                                     ; 3AD0 _ 5E
        pop     rdi                                     ; 3AD1 _ 5F
        pop     rbp                                     ; 3AD2 _ 5D
        pop     r12                                     ; 3AD3 _ 41: 5C
        pop     r13                                     ; 3AD5 _ 41: 5D
        pop     r14                                     ; 3AD7 _ 41: 5E
        pop     r15                                     ; 3AD9 _ 41: 5F
        ret                                             ; 3ADB _ C3

_ZL14set_norm_pieceP13TBEntry_piecePhS1_.isra.2:; Local function
        push    rdi                                     ; 3ADC _ 57
        push    rsi                                     ; 3ADD _ 56
        push    rbx                                     ; 3ADE _ 53
        xor     eax, eax                                ; 3ADF _ 31. C0
?_472:  movzx   r10d, byte [rcx]                        ; 3AE1 _ 44: 0F B6. 11
        cmp     r10d, eax                               ; 3AE5 _ 41: 39. C2
        jle     ?_473                                   ; 3AE8 _ 7E, 0A
        mov     byte [r8+rax], 0                        ; 3AEA _ 41: C6. 04 00, 00
        inc     rax                                     ; 3AEF _ 48: FF. C0
        jmp     ?_472                                   ; 3AF2 _ EB, ED

?_473:  ; Local function
        mov     al, byte [rdx]                          ; 3AF4 _ 8A. 02
        test    al, al                                  ; 3AF6 _ 84. C0
        jz      ?_474                                   ; 3AF8 _ 74, 0A
        cmp     al, 2                                   ; 3AFA _ 3C, 02
        jnz     ?_475                                   ; 3AFC _ 75, 0C
        mov     byte [r8], 2                            ; 3AFE _ 41: C6. 00, 02
        jmp     ?_476                                   ; 3B02 _ EB, 0B

?_474:  mov     byte [r8], 3                            ; 3B04 _ 41: C6. 00, 03
        jmp     ?_476                                   ; 3B08 _ EB, 05

?_475:  dec     eax                                     ; 3B0A _ FF. C8
        mov     byte [r8], al                           ; 3B0C _ 41: 88. 00
?_476:  movzx   eax, byte [r8]                          ; 3B0F _ 41: 0F B6. 00
?_477:  movzx   edx, byte [rcx]                         ; 3B13 _ 0F B6. 11
        cmp     eax, edx                                ; 3B16 _ 39. D0
        jge     ?_480                                   ; 3B18 _ 7D, 31
        movsxd  r10, eax                                ; 3B1A _ 4C: 63. D0
        xor     edx, edx                                ; 3B1D _ 31. D2
        lea     rbx, [r9+r10]                           ; 3B1F _ 4B: 8D. 1C 11
        lea     r11, [r8+r10]                           ; 3B23 _ 4F: 8D. 1C 10
?_478:  movzx   esi, byte [rcx]                         ; 3B27 _ 0F B6. 31
        lea     edi, [rax+rdx]                          ; 3B2A _ 8D. 3C 10
        cmp     edi, esi                                ; 3B2D _ 39. F7
        jge     ?_479                                   ; 3B2F _ 7D, 11
        mov     dil, byte [rbx+rdx]                     ; 3B31 _ 40: 8A. 3C 13
        inc     rdx                                     ; 3B35 _ 48: FF. C2
        cmp     dil, byte [rbx]                         ; 3B38 _ 40: 3A. 3B
        jnz     ?_479                                   ; 3B3B _ 75, 05
        inc     byte [r11]                              ; 3B3D _ 41: FE. 03
        jmp     ?_478                                   ; 3B40 _ EB, E5

?_479:  movzx   edx, byte [r8+r10]                      ; 3B42 _ 43: 0F B6. 14 10
        add     eax, edx                                ; 3B47 _ 01. D0
        jmp     ?_477                                   ; 3B49 _ EB, C8

?_480:  ; Local function
        pop     rbx                                     ; 3B4B _ 5B
        pop     rsi                                     ; 3B4C _ 5E
        pop     rdi                                     ; 3B4D _ 5F
        ret                                             ; 3B4E _ C3

        nop                                             ; 3B4F _ 90


SECTION .text.startup align=16 execute                  ; section number 5, code

.text.startup:; Local function
_GLOBAL__sub_I__ZN10Tablebases4initEPKc:
        mov     dword [rel _ZL12wdl_to_Value], -31871   ; 0000 _ C7. 05, 0000000C(rel), FFFF8381
        mov     dword [rel ?_023], -2                   ; 000A _ C7. 05, 00000010(rel), FFFFFFFE
        mov     dword [rel ?_024], 2                    ; 0014 _ C7. 05, 00000018(rel), 00000002
        mov     dword [rel ?_025], 31871                ; 001E _ C7. 05, 0000001C(rel), 00007C7F
        ret                                             ; 0028 _ C3

        nop                                             ; 0029 _ 90
        nop                                             ; 002A _ 90
        nop                                             ; 002B _ 90
        nop                                             ; 002C _ 90
        nop                                             ; 002D _ 90
        nop                                             ; 002E _ 90
        nop                                             ; 002F _ 90


SECTION .xdata.startup align=4 noexecute                ; section number 6, const

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .ctors  align=8 noexecute                       ; section number 8, data

        dq _GLOBAL__sub_I__ZN10Tablebases4initEPKc      ; 0000 _ 0000000000000000 (d)


SECTION .rdata  align=64 noexecute                      ; section number 9, const

?_481:                                                  ; byte
        db 3CH, 65H, 6DH, 70H, 74H, 79H, 3EH, 00H       ; 0000 _ <empty>.

?_482:                                                  ; byte
        db 4BH, 25H, 63H, 76H, 4BH, 00H                 ; 0008 _ K%cvK.

?_483:                                                  ; byte
        db 4BH, 25H, 63H, 76H, 4BH, 25H, 63H, 00H       ; 000E _ K%cvK%c.

?_484:                                                  ; byte
        db 4BH, 25H, 63H, 25H, 63H, 76H, 4BH, 00H       ; 0016 _ K%c%cvK.

?_485:                                                  ; byte
        db 4BH, 25H, 63H, 25H, 63H, 76H, 4BH, 25H       ; 001E _ K%c%cvK%
        db 63H, 00H                                     ; 0026 _ c.

?_486:                                                  ; byte
        db 4BH, 25H, 63H, 25H, 63H, 25H, 63H, 76H       ; 0028 _ K%c%c%cv
        db 4BH, 00H                                     ; 0030 _ K.

?_487:                                                  ; byte
        db 4BH, 25H, 63H, 25H, 63H, 76H, 4BH, 25H       ; 0032 _ K%c%cvK%
        db 63H, 25H, 63H, 00H                           ; 003A _ c%c.

?_488:                                                  ; byte
        db 4BH, 25H, 63H, 25H, 63H, 25H, 63H, 76H       ; 003E _ K%c%c%cv
        db 4BH, 25H, 63H, 00H                           ; 0046 _ K%c.

?_489:                                                  ; byte
        db 4BH, 25H, 63H, 25H, 63H, 25H, 63H, 25H       ; 004A _ K%c%c%c%
        db 63H, 76H, 4BH, 00H, 00H, 00H                 ; 0052 _ cvK...

?_490:                                                  ; byte
        db 69H, 6EH, 66H, 6FH, 20H, 73H, 74H, 72H       ; 0058 _ info str
        db 69H, 6EH, 67H, 20H, 46H, 6FH, 75H, 6EH       ; 0060 _ ing Foun
        db 64H, 20H, 25H, 64H, 20H, 74H, 61H, 62H       ; 0068 _ d %d tab
        db 6CH, 65H, 62H, 61H, 73H, 65H, 73H, 2EH       ; 0070 _ lebases.
        db 0AH, 00H                                     ; 0078 _ ..

?_491:                                                  ; byte
        db 2EH, 72H, 74H, 62H, 77H, 00H                 ; 007A _ .rtbw.

?_492:                                                  ; byte
        db 54H, 42H, 4DH, 41H, 58H, 5FH, 50H, 49H       ; 0080 _ TBMAX_PI
        db 45H, 43H, 45H, 20H, 6CH, 69H, 6DH, 69H       ; 0088 _ ECE limi
        db 74H, 20H, 74H, 6FH, 6FH, 20H, 6CH, 6FH       ; 0090 _ t too lo
        db 77H, 21H, 0AH, 00H                           ; 0098 _ w!..

?_493:                                                  ; byte
        db 54H, 42H, 4DH, 41H, 58H, 5FH, 50H, 41H       ; 009C _ TBMAX_PA
        db 57H, 4EH, 20H, 6CH, 69H, 6DH, 69H, 74H       ; 00A4 _ WN limit
        db 20H, 74H, 6FH, 6FH, 20H, 6CH, 6FH, 77H       ; 00AC _  too low
        db 21H, 0AH, 00H                                ; 00B4 _ !..

?_494:                                                  ; byte
        db 48H, 53H, 48H, 4DH, 41H, 58H, 20H, 74H       ; 00B7 _ HSHMAX t
        db 6FH, 6FH, 20H, 6CH, 6FH, 77H, 21H, 0AH       ; 00BF _ oo low!.
        db 00H                                          ; 00C7 _ .

?_495:                                                  ; byte
        db 43H, 72H, 65H, 61H, 74H, 65H, 46H, 69H       ; 00C8 _ CreateFi
        db 6CH, 65H, 4DH, 61H, 70H, 70H, 69H, 6EH       ; 00D0 _ leMappin
        db 67H, 28H, 29H, 20H, 66H, 61H, 69H, 6CH       ; 00D8 _ g() fail
        db 65H, 64H, 2EH, 0AH, 00H, 00H, 00H, 00H       ; 00E0 _ ed......

?_496:                                                  ; byte
        db 4DH, 61H, 70H, 56H, 69H, 65H, 77H, 4FH       ; 00E8 _ MapViewO
        db 66H, 46H, 69H, 6CH, 65H, 28H, 29H, 20H       ; 00F0 _ fFile() 
        db 66H, 61H, 69H, 6CH, 65H, 64H, 2CH, 20H       ; 00F8 _ failed, 
        db 6EH, 61H, 6DH, 65H, 20H, 3DH, 20H, 25H       ; 0100 _ name = %
        db 73H, 25H, 73H, 2CH, 20H, 65H, 72H, 72H       ; 0108 _ s%s, err
        db 6FH, 72H, 20H, 3DH, 20H, 25H, 6CH, 75H       ; 0110 _ or = %lu
        db 2EH, 0AH, 00H                                ; 0118 _ ...

?_497:                                                  ; byte
        db 43H, 6FH, 75H, 6CH, 64H, 20H, 6EH, 6FH       ; 011B _ Could no
        db 74H, 20H, 66H, 69H, 6EH, 64H, 20H, 25H       ; 0123 _ t find %
        db 73H, 2EH, 72H, 74H, 62H, 77H, 00H            ; 012B _ s.rtbw.

?_498:                                                  ; byte
        db 43H, 6FH, 72H, 72H, 75H, 70H, 74H, 65H       ; 0132 _ Corrupte
        db 64H, 20H, 74H, 61H, 62H, 6CH, 65H, 2EH       ; 013A _ d table.
        db 0AH, 00H                                     ; 0142 _ ..

?_499:                                                  ; byte
        db 2EH, 72H, 74H, 62H, 7AH, 00H                 ; 0144 _ .rtbz.

?_500:                                                  ; byte
        db 76H, 65H, 63H, 74H, 6FH, 72H, 3AH, 3AH       ; 014A _ vector::
        db 5FH, 4DH, 5FH, 66H, 69H, 6CH, 6CH, 5FH       ; 0152 _ _M_fill_
        db 69H, 6EH, 73H, 65H, 72H, 74H, 00H, 00H       ; 015A _ insert..
        db 00H, 00H                                     ; 0162 _ ..

_ZZL18calc_factors_piecePiiiPhhE6pivfac:                ; byte
        db 64H, 7AH, 00H, 00H, 98H, 6DH, 00H, 00H       ; 0164 _ dz...m..
        db 0CEH, 01H, 00H, 00H, 00H, 00H, 00H, 00H      ; 016C _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0174 _ ........
        db 00H, 00H, 00H, 00H                           ; 017C _ ....

_ZL6KK_idx:                                             ; byte
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 00H, 00H ; 0180 _ ........
        db 01H, 00H, 02H, 00H, 03H, 00H, 04H, 00H       ; 0188 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 05H, 00H ; 0190 _ ........
        db 06H, 00H, 07H, 00H, 08H, 00H, 09H, 00H       ; 0198 _ ........
        db 0AH, 00H, 0BH, 00H, 0CH, 00H, 0DH, 00H       ; 01A0 _ ........
        db 0EH, 00H, 0FH, 00H, 10H, 00H, 11H, 00H       ; 01A8 _ ........
        db 12H, 00H, 13H, 00H, 14H, 00H, 15H, 00H       ; 01B0 _ ........
        db 16H, 00H, 17H, 00H, 18H, 00H, 19H, 00H       ; 01B8 _ ........
        db 1AH, 00H, 1BH, 00H, 1CH, 00H, 1DH, 00H       ; 01C0 _ ........
        db 1EH, 00H, 1FH, 00H, 20H, 00H, 21H, 00H       ; 01C8 _ .... .!.
        db 22H, 00H, 23H, 00H, 24H, 00H, 25H, 00H       ; 01D0 _ ".#.$.%.
        db 26H, 00H, 27H, 00H, 28H, 00H, 29H, 00H       ; 01D8 _ &.'.(.).
        db 2AH, 00H, 2BH, 00H, 2CH, 00H, 2DH, 00H       ; 01E0 _ *.+.,.-.
        db 2EH, 00H, 2FH, 00H, 30H, 00H, 31H, 00H       ; 01E8 _ ../.0.1.
        db 32H, 00H, 33H, 00H, 34H, 00H, 35H, 00H       ; 01F0 _ 2.3.4.5.
        db 36H, 00H, 37H, 00H, 38H, 00H, 39H, 00H       ; 01F8 _ 6.7.8.9.
        db 3AH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0200 _ :.......
        db 3BH, 00H, 3CH, 00H, 3DH, 00H, 3EH, 00H       ; 0208 _ ;.<.=.>.
        db 3FH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0210 _ ?.......
        db 40H, 00H, 41H, 00H, 42H, 00H, 43H, 00H       ; 0218 _ @.A.B.C.
        db 44H, 00H, 45H, 00H, 46H, 00H, 47H, 00H       ; 0220 _ D.E.F.G.
        db 48H, 00H, 49H, 00H, 4AH, 00H, 4BH, 00H       ; 0228 _ H.I.J.K.
        db 4CH, 00H, 4DH, 00H, 4EH, 00H, 4FH, 00H       ; 0230 _ L.M.N.O.
        db 50H, 00H, 51H, 00H, 52H, 00H, 53H, 00H       ; 0238 _ P.Q.R.S.
        db 54H, 00H, 55H, 00H, 56H, 00H, 57H, 00H       ; 0240 _ T.U.V.W.
        db 58H, 00H, 59H, 00H, 5AH, 00H, 5BH, 00H       ; 0248 _ X.Y.Z.[.
        db 5CH, 00H, 5DH, 00H, 5EH, 00H, 5FH, 00H       ; 0250 _ \.].^._.
        db 60H, 00H, 61H, 00H, 62H, 00H, 63H, 00H       ; 0258 _ `.a.b.c.
        db 64H, 00H, 65H, 00H, 66H, 00H, 67H, 00H       ; 0260 _ d.e.f.g.
        db 68H, 00H, 69H, 00H, 6AH, 00H, 6BH, 00H       ; 0268 _ h.i.j.k.
        db 6CH, 00H, 6DH, 00H, 6EH, 00H, 6FH, 00H       ; 0270 _ l.m.n.o.
        db 70H, 00H, 71H, 00H, 72H, 00H, 73H, 00H       ; 0278 _ p.q.r.s.
        db 74H, 00H, 75H, 00H, 0FFH, 0FFH, 0FFH, 0FFH   ; 0280 _ t.u.....
        db 0FFH, 0FFH, 76H, 00H, 77H, 00H, 78H, 00H     ; 0288 _ ..v.w.x.
        db 79H, 00H, 7AH, 00H, 0FFH, 0FFH, 0FFH, 0FFH   ; 0290 _ y.z.....
        db 0FFH, 0FFH, 7BH, 00H, 7CH, 00H, 7DH, 00H     ; 0298 _ ..{.|.}.
        db 7EH, 00H, 7FH, 00H, 80H, 00H, 81H, 00H       ; 02A0 _ ~.......
        db 82H, 00H, 83H, 00H, 84H, 00H, 85H, 00H       ; 02A8 _ ........
        db 86H, 00H, 87H, 00H, 88H, 00H, 89H, 00H       ; 02B0 _ ........
        db 8AH, 00H, 8BH, 00H, 8CH, 00H, 8DH, 00H       ; 02B8 _ ........
        db 8EH, 00H, 8FH, 00H, 90H, 00H, 91H, 00H       ; 02C0 _ ........
        db 92H, 00H, 93H, 00H, 94H, 00H, 95H, 00H       ; 02C8 _ ........
        db 96H, 00H, 97H, 00H, 98H, 00H, 99H, 00H       ; 02D0 _ ........
        db 9AH, 00H, 9BH, 00H, 9CH, 00H, 9DH, 00H       ; 02D8 _ ........
        db 9EH, 00H, 9FH, 00H, 0A0H, 00H, 0A1H, 00H     ; 02E0 _ ........
        db 0A2H, 00H, 0A3H, 00H, 0A4H, 00H, 0A5H, 00H   ; 02E8 _ ........
        db 0A6H, 00H, 0A7H, 00H, 0A8H, 00H, 0A9H, 00H   ; 02F0 _ ........
        db 0AAH, 00H, 0ABH, 00H, 0ACH, 00H, 0ADH, 00H   ; 02F8 _ ........
        db 0AEH, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0300 _ ........
        db 0AFH, 00H, 0B0H, 00H, 0B1H, 00H, 0B2H, 00H   ; 0308 _ ........
        db 0B3H, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0310 _ ........
        db 0B4H, 00H, 0B5H, 00H, 0B6H, 00H, 0B7H, 00H   ; 0318 _ ........
        db 0B8H, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0320 _ ........
        db 0B9H, 00H, 0BAH, 00H, 0BBH, 00H, 0BCH, 00H   ; 0328 _ ........
        db 0BDH, 00H, 0BEH, 00H, 0BFH, 00H, 0C0H, 00H   ; 0330 _ ........
        db 0C1H, 00H, 0C2H, 00H, 0C3H, 00H, 0C4H, 00H   ; 0338 _ ........
        db 0C5H, 00H, 0C6H, 00H, 0C7H, 00H, 0C8H, 00H   ; 0340 _ ........
        db 0C9H, 00H, 0CAH, 00H, 0CBH, 00H, 0CCH, 00H   ; 0348 _ ........
        db 0CDH, 00H, 0CEH, 00H, 0CFH, 00H, 0D0H, 00H   ; 0350 _ ........
        db 0D1H, 00H, 0D2H, 00H, 0D3H, 00H, 0D4H, 00H   ; 0358 _ ........
        db 0D5H, 00H, 0D6H, 00H, 0D7H, 00H, 0D8H, 00H   ; 0360 _ ........
        db 0D9H, 00H, 0DAH, 00H, 0DBH, 00H, 0DCH, 00H   ; 0368 _ ........
        db 0DDH, 00H, 0DEH, 00H, 0DFH, 00H, 0E0H, 00H   ; 0370 _ ........
        db 0E1H, 00H, 0E2H, 00H, 0E3H, 00H, 0E4H, 00H   ; 0378 _ ........
        db 0E5H, 00H, 0E6H, 00H, 0FFH, 0FFH, 0FFH, 0FFH ; 0380 _ ........
        db 0FFH, 0FFH, 0E7H, 00H, 0E8H, 00H, 0E9H, 00H  ; 0388 _ ........
        db 0EAH, 00H, 0EBH, 00H, 0FFH, 0FFH, 0FFH, 0FFH ; 0390 _ ........
        db 0FFH, 0FFH, 0ECH, 00H, 0EDH, 00H, 0EEH, 00H  ; 0398 _ ........
        db 0EFH, 00H, 0F0H, 00H, 0FFH, 0FFH, 0FFH, 0FFH ; 03A0 _ ........
        db 0FFH, 0FFH, 0F1H, 00H, 0F2H, 00H, 0F3H, 00H  ; 03A8 _ ........
        db 0F4H, 00H, 0F5H, 00H, 0F6H, 00H, 0F7H, 00H   ; 03B0 _ ........
        db 0F8H, 00H, 0F9H, 00H, 0FAH, 00H, 0FBH, 00H   ; 03B8 _ ........
        db 0FCH, 00H, 0FDH, 00H, 0FEH, 00H, 0FFH, 00H   ; 03C0 _ ........
        db 00H, 01H, 01H, 01H, 02H, 01H, 03H, 01H       ; 03C8 _ ........
        db 04H, 01H, 05H, 01H, 06H, 01H, 07H, 01H       ; 03D0 _ ........
        db 08H, 01H, 09H, 01H, 0AH, 01H, 0BH, 01H       ; 03D8 _ ........
        db 0CH, 01H, 0DH, 01H, 0EH, 01H, 0FH, 01H       ; 03E0 _ ........
        db 10H, 01H, 11H, 01H, 12H, 01H, 13H, 01H       ; 03E8 _ ........
        db 14H, 01H, 15H, 01H, 16H, 01H, 17H, 01H       ; 03F0 _ ........
        db 18H, 01H, 19H, 01H, 1AH, 01H, 1BH, 01H       ; 03F8 _ ........
        db 1CH, 01H, 1DH, 01H, 1EH, 01H, 1FH, 01H       ; 0400 _ ........
        db 20H, 01H, 21H, 01H, 22H, 01H, 23H, 01H       ; 0408 _  .!.".#.
        db 24H, 01H, 25H, 01H, 0FFH, 0FFH, 0FFH, 0FFH   ; 0410 _ $.%.....
        db 0FFH, 0FFH, 26H, 01H, 27H, 01H, 28H, 01H     ; 0418 _ ..&.'.(.
        db 29H, 01H, 2AH, 01H, 0FFH, 0FFH, 0FFH, 0FFH   ; 0420 _ ).*.....
        db 0FFH, 0FFH, 2BH, 01H, 2CH, 01H, 2DH, 01H     ; 0428 _ ..+.,.-.
        db 2EH, 01H, 2FH, 01H, 0FFH, 0FFH, 0FFH, 0FFH   ; 0430 _ ../.....
        db 0FFH, 0FFH, 30H, 01H, 31H, 01H, 32H, 01H     ; 0438 _ ..0.1.2.
        db 33H, 01H, 34H, 01H, 35H, 01H, 36H, 01H       ; 0440 _ 3.4.5.6.
        db 37H, 01H, 38H, 01H, 39H, 01H, 3AH, 01H       ; 0448 _ 7.8.9.:.
        db 3BH, 01H, 3CH, 01H, 3DH, 01H, 3EH, 01H       ; 0450 _ ;.<.=.>.
        db 3FH, 01H, 40H, 01H, 41H, 01H, 42H, 01H       ; 0458 _ ?.@.A.B.
        db 43H, 01H, 44H, 01H, 45H, 01H, 46H, 01H       ; 0460 _ C.D.E.F.
        db 47H, 01H, 48H, 01H, 49H, 01H, 4AH, 01H       ; 0468 _ G.H.I.J.
        db 4BH, 01H, 4CH, 01H, 4DH, 01H, 4EH, 01H       ; 0470 _ K.L.M.N.
        db 4FH, 01H, 50H, 01H, 51H, 01H, 52H, 01H       ; 0478 _ O.P.Q.R.
        db 0FFH, 0FFH, 0FFH, 0FFH, 53H, 01H, 54H, 01H   ; 0480 _ ....S.T.
        db 55H, 01H, 56H, 01H, 57H, 01H, 58H, 01H       ; 0488 _ U.V.W.X.
        db 0FFH, 0FFH, 0FFH, 0FFH, 59H, 01H, 5AH, 01H   ; 0490 _ ....Y.Z.
        db 5BH, 01H, 5CH, 01H, 5DH, 01H, 5EH, 01H       ; 0498 _ [.\.].^.
        db 0FFH, 0FFH, 0FFH, 0FFH, 0B9H, 01H, 5FH, 01H  ; 04A0 _ ......_.
        db 60H, 01H, 61H, 01H, 62H, 01H, 63H, 01H       ; 04A8 _ `.a.b.c.
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0BAH, 01H; 04B0 _ ........
        db 64H, 01H, 65H, 01H, 66H, 01H, 67H, 01H       ; 04B8 _ d.e.f.g.
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 04C0 _ ........
        db 0BBH, 01H, 68H, 01H, 69H, 01H, 6AH, 01H      ; 04C8 _ ..h.i.j.
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 04D0 _ ........
        db 0FFH, 0FFH, 0BCH, 01H, 6BH, 01H, 6CH, 01H    ; 04D8 _ ....k.l.
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 04E0 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0BDH, 01H, 6DH, 01H  ; 04E8 _ ......m.
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 04F0 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0BEH, 01H; 04F8 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 6EH, 01H ; 0500 _ ......n.
        db 6FH, 01H, 70H, 01H, 71H, 01H, 72H, 01H       ; 0508 _ o.p.q.r.
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 73H, 01H ; 0510 _ ......s.
        db 74H, 01H, 75H, 01H, 76H, 01H, 77H, 01H       ; 0518 _ t.u.v.w.
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 78H, 01H ; 0520 _ ......x.
        db 79H, 01H, 7AH, 01H, 7BH, 01H, 7CH, 01H       ; 0528 _ y.z.{.|.
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0BFH, 01H; 0530 _ ........
        db 7DH, 01H, 7EH, 01H, 7FH, 01H, 80H, 01H       ; 0538 _ }.~.....
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0540 _ ........
        db 0C0H, 01H, 81H, 01H, 82H, 01H, 83H, 01H      ; 0548 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0550 _ ........
        db 0FFH, 0FFH, 0C1H, 01H, 84H, 01H, 85H, 01H    ; 0558 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0560 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0C2H, 01H, 86H, 01H  ; 0568 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0570 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0C3H, 01H; 0578 _ ........
        db 0C4H, 01H, 87H, 01H, 88H, 01H, 89H, 01H      ; 0580 _ ........
        db 8AH, 01H, 8BH, 01H, 8CH, 01H, 8DH, 01H       ; 0588 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0590 _ ........
        db 8EH, 01H, 8FH, 01H, 90H, 01H, 91H, 01H       ; 0598 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 05A0 _ ........
        db 92H, 01H, 93H, 01H, 94H, 01H, 95H, 01H       ; 05A8 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 05B0 _ ........
        db 96H, 01H, 97H, 01H, 98H, 01H, 99H, 01H       ; 05B8 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 05C0 _ ........
        db 0C5H, 01H, 9AH, 01H, 9BH, 01H, 9CH, 01H      ; 05C8 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 05D0 _ ........
        db 0FFH, 0FFH, 0C6H, 01H, 9DH, 01H, 9EH, 01H    ; 05D8 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 05E0 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0C7H, 01H, 9FH, 01H  ; 05E8 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 05F0 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0C8H, 01H; 05F8 _ ........
        db 0C9H, 01H, 0A0H, 01H, 0A1H, 01H, 0A2H, 01H   ; 0600 _ ........
        db 0A3H, 01H, 0A4H, 01H, 0A5H, 01H, 0A6H, 01H   ; 0608 _ ........
        db 0FFH, 0FFH, 0CAH, 01H, 0A7H, 01H, 0A8H, 01H  ; 0610 _ ........
        db 0A9H, 01H, 0AAH, 01H, 0ABH, 01H, 0ACH, 01H   ; 0618 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0620 _ ........
        db 0FFH, 0FFH, 0ADH, 01H, 0AEH, 01H, 0AFH, 01H  ; 0628 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0630 _ ........
        db 0FFH, 0FFH, 0B0H, 01H, 0B1H, 01H, 0B2H, 01H  ; 0638 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0640 _ ........
        db 0FFH, 0FFH, 0B3H, 01H, 0B4H, 01H, 0B5H, 01H  ; 0648 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0650 _ ........
        db 0FFH, 0FFH, 0CBH, 01H, 0B6H, 01H, 0B7H, 01H  ; 0658 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0660 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0CCH, 01H, 0B8H, 01H ; 0668 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0670 _ ........
        db 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0CDH, 01H; 0678 _ ........

_ZL12file_to_file:                                      ; byte
        db 00H, 01H, 02H, 03H, 03H, 02H, 01H, 00H       ; 0680 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0688 _ ........

_ZL7invflap:                                            ; byte
        db 08H, 10H, 18H, 20H, 28H, 30H                 ; 0690 _ ... (0

?_501:                                                  ; byte
        db 09H, 11H, 19H, 21H, 29H, 31H                 ; 0696 _ ...!)1

?_502:                                                  ; byte
        db 0AH, 12H, 1AH, 22H, 2AH, 32H                 ; 069C _ ..."*2

?_503:                                                  ; byte
        db 0BH, 13H, 1BH, 23H, 2BH, 33H, 00H, 00H       ; 06A2 _ ...#+3..
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 06AA _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 06B2 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H                 ; 06BA _ ......

_ZL6ptwist:                                             ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 06C0 _ ........
        db 2FH, 23H, 17H, 0BH, 0AH, 16H, 22H, 2EH       ; 06C8 _ /#....".
        db 2DH, 21H, 15H, 09H, 08H, 14H, 20H, 2CH       ; 06D0 _ -!.... ,
        db 2BH, 1FH, 13H, 07H, 06H, 12H, 1EH, 2AH       ; 06D8 _ +......*
        db 29H, 1DH, 11H, 05H, 04H, 10H, 1CH, 28H       ; 06E0 _ )......(
        db 27H, 1BH, 0FH, 03H, 02H, 0EH, 1AH, 26H       ; 06E8 _ '......&
        db 25H, 19H, 0DH, 01H, 00H, 0CH, 18H, 24H       ; 06F0 _ %......$
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 06F8 _ ........

_ZL4flap:                                               ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0700 _ ........
        db 00H, 06H, 0CH, 12H, 12H, 0CH, 06H, 00H       ; 0708 _ ........
        db 01H, 07H, 0DH, 13H, 13H, 0DH, 07H, 01H       ; 0710 _ ........
        db 02H, 08H, 0EH, 14H, 14H, 0EH, 08H, 02H       ; 0718 _ ........
        db 03H, 09H, 0FH, 15H, 15H, 0FH, 09H, 03H       ; 0720 _ ........
        db 04H, 0AH, 10H, 16H, 16H, 10H, 0AH, 04H       ; 0728 _ ........
        db 05H, 0BH, 11H, 17H, 17H, 11H, 0BH, 05H       ; 0730 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0738 _ ........

_ZL4diag:                                               ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 08H       ; 0740 _ ........
        db 00H, 01H, 00H, 00H, 00H, 00H, 09H, 00H       ; 0748 _ ........
        db 00H, 00H, 02H, 00H, 00H, 0AH, 00H, 00H       ; 0750 _ ........
        db 00H, 00H, 00H, 03H, 0BH, 00H, 00H, 00H       ; 0758 _ ........
        db 00H, 00H, 00H, 0CH, 04H, 00H, 00H, 00H       ; 0760 _ ........
        db 00H, 00H, 0DH, 00H, 00H, 05H, 00H, 00H       ; 0768 _ ........
        db 00H, 0EH, 00H, 00H, 00H, 00H, 06H, 00H       ; 0770 _ ........
        db 0FH, 00H, 00H, 00H, 00H, 00H, 00H, 07H       ; 0778 _ ........

_ZL5lower:                                              ; byte
        db 1CH, 00H, 01H, 02H, 03H, 04H, 05H, 06H       ; 0780 _ ........
        db 00H, 1DH, 07H, 08H, 09H, 0AH, 0BH, 0CH       ; 0788 _ ........
        db 01H, 07H, 1EH, 0DH, 0EH, 0FH, 10H, 11H       ; 0790 _ ........
        db 02H, 08H, 0DH, 1FH, 12H, 13H, 14H, 15H       ; 0798 _ ........
        db 03H, 09H, 0EH, 12H, 20H, 16H, 17H, 18H       ; 07A0 _ .... ...
        db 04H, 0AH, 0FH, 13H, 16H, 21H, 19H, 1AH       ; 07A8 _ .....!..
        db 05H, 0BH, 10H, 14H, 17H, 19H, 22H, 1BH       ; 07B0 _ ......".
        db 06H, 0CH, 11H, 15H, 18H, 1AH, 1BH, 23H       ; 07B8 _ .......#

_ZL8flipdiag:                                           ; byte
        db 00H, 08H, 10H, 18H, 20H, 28H, 30H, 38H       ; 07C0 _ .... (08
        db 01H, 09H, 11H, 19H, 21H, 29H, 31H, 39H       ; 07C8 _ ....!)19
        db 02H, 0AH, 12H, 1AH, 22H, 2AH, 32H, 3AH       ; 07D0 _ ...."*2:
        db 03H, 0BH, 13H, 1BH, 23H, 2BH, 33H, 3BH       ; 07D8 _ ....#+3;
        db 04H, 0CH, 14H, 1CH, 24H, 2CH, 34H, 3CH       ; 07E0 _ ....$,4<
        db 05H, 0DH, 15H, 1DH, 25H, 2DH, 35H, 3DH       ; 07E8 _ ....%-5=
        db 06H, 0EH, 16H, 1EH, 26H, 2EH, 36H, 3EH       ; 07F0 _ ....&.6>
        db 07H, 0FH, 17H, 1FH, 27H, 2FH, 37H, 3FH       ; 07F8 _ ....'/7?

_ZL8triangle:                                           ; byte
        db 06H, 00H, 01H, 02H, 02H, 01H, 00H, 06H       ; 0800 _ ........
        db 00H, 07H, 03H, 04H, 04H, 03H, 07H, 00H       ; 0808 _ ........
        db 01H, 03H, 08H, 05H, 05H, 08H, 03H, 01H       ; 0810 _ ........
        db 02H, 04H, 05H, 09H, 09H, 05H, 04H, 02H       ; 0818 _ ........
        db 02H, 04H, 05H, 09H, 09H, 05H, 04H, 02H       ; 0820 _ ........
        db 01H, 03H, 08H, 05H, 05H, 08H, 03H, 01H       ; 0828 _ ........
        db 00H, 07H, 03H, 04H, 04H, 03H, 07H, 00H       ; 0830 _ ........
        db 06H, 00H, 01H, 02H, 02H, 01H, 00H, 06H       ; 0838 _ ........

_ZL7offdiag:                                            ; byte
        db 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH; 0840 _ ........
        db 01H, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH ; 0848 _ ........
        db 01H, 01H, 00H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH  ; 0850 _ ........
        db 01H, 01H, 01H, 00H, 0FFH, 0FFH, 0FFH, 0FFH   ; 0858 _ ........
        db 01H, 01H, 01H, 01H, 00H, 0FFH, 0FFH, 0FFH    ; 0860 _ ........
        db 01H, 01H, 01H, 01H, 01H, 00H, 0FFH, 0FFH     ; 0868 _ ........
        db 01H, 01H, 01H, 01H, 01H, 01H, 00H, 0FFH      ; 0870 _ ........
        db 01H, 01H, 01H, 01H, 01H, 01H, 01H, 00H       ; 0878 _ ........

_ZL10wdl_to_dtz:                                        ; byte
        db 0FFH, 0FFH, 0FFH, 0FFH, 9BH, 0FFH, 0FFH, 0FFH; 0880 _ ........
        db 00H, 00H, 00H, 00H, 65H, 00H, 00H, 00H       ; 0888 _ ....e...
        db 01H, 00H, 00H, 00H                           ; 0890 _ ....

_ZL8pa_flags:                                           ; byte
        db 08H, 00H, 00H, 00H, 04H, 00H, 00H, 00H       ; 0894 _ ........
        db 00H, 00H, 00H, 00H                           ; 089C _ ....

_ZL10wdl_to_map:                                        ; byte
        db 01H, 00H, 00H, 00H, 03H, 00H, 00H, 00H       ; 08A0 _ ........
        db 00H, 00H, 00H, 00H, 02H, 00H, 00H, 00H       ; 08A8 _ ........
        db 00H, 00H, 00H, 00H                           ; 08B0 _ ....

_ZL4pchr:                                               ; byte
        db 4BH                                          ; 08B4 _ K

?_504:                                                  ; byte
        db 51H, 52H, 42H, 4EH, 50H, 00H, 00H, 00H       ; 08B5 _ QRBNP...
        db 00H, 00H, 00H                                ; 08BD _ ...


SECTION .xdata  align=4 noexecute                       ; section number 10, const

        db 01H, 10H, 09H, 00H, 10H, 0A2H, 0CH, 30H      ; 0000 _ .......0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .xdata.unlikely align=4 noexecute               ; section number 12, const

        db 01H, 04H, 01H, 00H, 04H, 62H, 00H, 00H       ; 0000 _ .....b..
        db 01H, 08H, 05H, 00H, 08H, 0C2H, 04H, 30H      ; 0008 _ .......0
        db 03H, 60H, 02H, 70H, 01H, 50H, 00H, 00H       ; 0010 _ .`.p.P..
        db 01H, 06H, 03H, 00H, 06H, 42H, 02H, 30H       ; 0018 _ .....B.0
        db 01H, 60H, 00H, 00H, 01H, 06H, 03H, 00H       ; 0020 _ .`......
        db 06H, 42H, 02H, 30H, 01H, 60H, 00H, 00H       ; 0028 _ .B.0.`..
        db 01H, 0FH, 08H, 00H, 0FH, 01H, 29H, 00H       ; 0030 _ ......).
        db 08H, 30H, 07H, 60H, 06H, 70H, 05H, 50H       ; 0038 _ .0.`.p.P
        db 04H, 0C0H, 02H, 0D0H, 01H, 05H, 02H, 00H     ; 0040 _ ........
        db 05H, 32H, 01H, 30H, 01H, 04H, 01H, 00H       ; 0048 _ .2.0....
        db 04H, 62H, 00H, 00H, 01H, 19H, 0AH, 00H       ; 0050 _ .b......
        db 19H, 01H, 0BH, 02H, 11H, 30H, 10H, 60H       ; 0058 _ .....0.`
        db 0FH, 70H, 0EH, 50H, 0DH, 0C0H, 0BH, 0D0H     ; 0060 _ .p.P....
        db 09H, 0E0H, 02H, 0F0H, 01H, 02H, 02H, 00H     ; 0068 _ ........
        db 02H, 30H, 01H, 60H, 01H, 0CH, 07H, 00H       ; 0070 _ .0.`....
        db 0CH, 42H, 08H, 30H, 07H, 60H, 06H, 70H       ; 0078 _ .B.0.`.p
        db 05H, 50H, 04H, 0C0H, 02H, 0D0H, 00H, 00H     ; 0080 _ .P......
        db 01H, 03H, 03H, 00H, 03H, 30H, 02H, 60H       ; 0088 _ .....0.`
        db 01H, 70H, 00H, 00H, 01H, 08H, 05H, 00H       ; 0090 _ .p......
        db 08H, 82H, 04H, 30H, 03H, 60H, 02H, 70H       ; 0098 _ ...0.`.p
        db 01H, 50H, 00H, 00H, 01H, 02H, 02H, 00H       ; 00A0 _ .P......
        db 02H, 30H, 01H, 60H, 01H, 01H, 01H, 00H       ; 00A8 _ .0.`....
        db 01H, 30H, 00H, 00H, 01H, 0CH, 08H, 00H       ; 00B0 _ .0......
        db 0CH, 30H, 0BH, 60H, 0AH, 70H, 09H, 50H       ; 00B8 _ .0.`.p.P
        db 08H, 0C0H, 06H, 0D0H, 04H, 0E0H, 02H, 0F0H   ; 00C0 _ ........
        db 01H, 0CH, 08H, 00H, 0CH, 30H, 0BH, 60H       ; 00C8 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 00D0 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 0CH, 08H, 00H     ; 00D8 _ ........
        db 0CH, 30H, 0BH, 60H, 0AH, 70H, 09H, 50H       ; 00E0 _ .0.`.p.P
        db 08H, 0C0H, 06H, 0D0H, 04H, 0E0H, 02H, 0F0H   ; 00E8 _ ........
        db 01H, 13H, 0AH, 00H, 13H, 01H, 87H, 00H       ; 00F0 _ ........
        db 0CH, 30H, 0BH, 60H, 0AH, 70H, 09H, 50H       ; 00F8 _ .0.`.p.P
        db 08H, 0C0H, 06H, 0D0H, 04H, 0E0H, 02H, 0F0H   ; 0100 _ ........
        db 01H, 0CH, 08H, 00H, 0CH, 30H, 0BH, 60H       ; 0108 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 0110 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 0AH, 07H, 00H     ; 0118 _ ........
        db 0AH, 30H, 09H, 60H, 08H, 70H, 07H, 50H       ; 0120 _ .0.`.p.P
        db 06H, 0C0H, 04H, 0D0H, 02H, 0E0H, 00H, 00H    ; 0128 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0130 _ ........
        db 01H, 13H, 0AH, 00H, 13H, 01H, 1DH, 00H       ; 0138 _ ........
        db 0CH, 30H, 0BH, 60H, 0AH, 70H, 09H, 50H       ; 0140 _ .0.`.p.P
        db 08H, 0C0H, 06H, 0D0H, 04H, 0E0H, 02H, 0F0H   ; 0148 _ ........
        db 01H, 00H, 00H, 00H, 01H, 13H, 0AH, 00H       ; 0150 _ ........
        db 13H, 01H, 0DFH, 00H, 0CH, 30H, 0BH, 60H      ; 0158 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 0160 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 13H, 0AH, 00H     ; 0168 _ ........
        db 13H, 01H, 0E5H, 00H, 0CH, 30H, 0BH, 60H      ; 0170 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 0178 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 13H, 0AH, 00H     ; 0180 _ ........
        db 13H, 01H, 23H, 00H, 0CH, 30H, 0BH, 60H       ; 0188 _ ..#..0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 0190 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 13H, 0AH, 00H     ; 0198 _ ........
        db 13H, 01H, 0E5H, 00H, 0CH, 30H, 0BH, 60H      ; 01A0 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 01A8 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 03H, 03H, 00H     ; 01B0 _ ........
        db 03H, 30H, 02H, 60H, 01H, 70H, 00H, 00H       ; 01B8 _ .0.`.p..


SECTION .text$_ZNSt6vectorI4MoveSaIS0_EEaSERKS2_ align=16 execute ; section number 14, code
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
        mov     rbp, rdx                                ; 0010 _ 48: 89. D5
        je      ?_518                                   ; 0013 _ 0F 84, 000000EA
        mov     r12, qword [rdx+8H]                     ; 0019 _ 4C: 8B. 62, 08
        mov     rsi, qword [rdx]                        ; 001D _ 48: 8B. 32
        mov     rcx, qword [rcx]                        ; 0020 _ 48: 8B. 09
        mov     r8, qword [rbx+10H]                     ; 0023 _ 4C: 8B. 43, 10
        mov     rdi, r12                                ; 0027 _ 4C: 89. E7
        sub     rdi, rsi                                ; 002A _ 48: 29. F7
        mov     rax, rdi                                ; 002D _ 48: 89. F8
        sub     r8, rcx                                 ; 0030 _ 49: 29. C8
        sar     rax, 2                                  ; 0033 _ 48: C1. F8, 02
        sar     r8, 2                                   ; 0037 _ 49: C1. F8, 02
        cmp     rax, r8                                 ; 003B _ 4C: 39. C0
        jbe     ?_512                                   ; 003E _ 76, 5E
        test    rax, rax                                ; 0040 _ 48: 85. C0
        jz      ?_506                                   ; 0043 _ 74, 21
        mov     r11, qword 3FFFFFFFFFFFFFFFH            ; 0045 _ 49: BB, 3FFFFFFFFFFFFFFF
        cmp     rax, r11                                ; 004F _ 4C: 39. D8
        jbe     ?_505                                   ; 0052 _ 76, 05
        call    _ZSt17__throw_bad_allocv                ; 0054 _ E8, 00000000(rel)
?_505:  mov     rcx, rdi                                ; 0059 _ 48: 89. F9
        call    _Znwy                                   ; 005C _ E8, 00000000(rel)
        mov     rbp, rax                                ; 0061 _ 48: 89. C5
        jmp     ?_507                                   ; 0064 _ EB, 02

?_506:  xor     ebp, ebp                                ; 0066 _ 31. ED
?_507:  mov     rax, rbp                                ; 0068 _ 48: 89. E8
?_508:  cmp     r12, rsi                                ; 006B _ 49: 39. F4
        jz      ?_510                                   ; 006E _ 74, 15
        test    rax, rax                                ; 0070 _ 48: 85. C0
        mov     r8d, dword [rsi]                        ; 0073 _ 44: 8B. 06
        jz      ?_509                                   ; 0076 _ 74, 03
        mov     dword [rax], r8d                        ; 0078 _ 44: 89. 00
?_509:  add     rax, 4                                  ; 007B _ 48: 83. C0, 04
        add     rsi, 4                                  ; 007F _ 48: 83. C6, 04
        jmp     ?_508                                   ; 0083 _ EB, E6

?_510:  mov     rcx, qword [rbx]                        ; 0085 _ 48: 8B. 0B
        test    rcx, rcx                                ; 0088 _ 48: 85. C9
        jz      ?_511                                   ; 008B _ 74, 05
        call    _ZdlPv                                  ; 008D _ E8, 00000000(rel)
?_511:  mov     qword [rbx], rbp                        ; 0092 _ 48: 89. 2B
        add     rbp, rdi                                ; 0095 _ 48: 01. FD
        mov     qword [rbx+10H], rbp                    ; 0098 _ 48: 89. 6B, 10
        jmp     ?_517                                   ; 009C _ EB, 5E

?_512:  mov     r8, qword [rbx+8H]                      ; 009E _ 4C: 8B. 43, 08
        sub     r8, rcx                                 ; 00A2 _ 49: 29. C8
        mov     rdx, r8                                 ; 00A5 _ 4C: 89. C2
        sar     rdx, 2                                  ; 00A8 _ 48: C1. FA, 02
        cmp     rax, rdx                                ; 00AC _ 48: 39. D0
        ja      ?_513                                   ; 00AF _ 77, 12
        test    rax, rax                                ; 00B1 _ 48: 85. C0
        jz      ?_517                                   ; 00B4 _ 74, 46
        mov     r8, rdi                                 ; 00B6 _ 49: 89. F8
        mov     rdx, rsi                                ; 00B9 _ 48: 89. F2
        call    memmove                                 ; 00BC _ E8, 00000000(rel)
        jmp     ?_517                                   ; 00C1 _ EB, 39

?_513:  test    rdx, rdx                                ; 00C3 _ 48: 85. D2
        jz      ?_514                                   ; 00C6 _ 74, 08
        mov     rdx, rsi                                ; 00C8 _ 48: 89. F2
        call    memmove                                 ; 00CB _ E8, 00000000(rel)
?_514:  mov     rcx, qword [rbx+8H]                     ; 00D0 _ 48: 8B. 4B, 08
        mov     r9, qword [rbp+8H]                      ; 00D4 _ 4C: 8B. 4D, 08
        mov     rsi, rcx                                ; 00D8 _ 48: 89. CE
        sub     rsi, qword [rbx]                        ; 00DB _ 48: 2B. 33
        add     rsi, qword [rbp]                        ; 00DE _ 48: 03. 75, 00
?_515:  cmp     r9, rsi                                 ; 00E2 _ 49: 39. F1
        jz      ?_517                                   ; 00E5 _ 74, 15
        test    rcx, rcx                                ; 00E7 _ 48: 85. C9
        mov     r10d, dword [rsi]                       ; 00EA _ 44: 8B. 16
        jz      ?_516                                   ; 00ED _ 74, 03
        mov     dword [rcx], r10d                       ; 00EF _ 44: 89. 11
?_516:  add     rsi, 4                                  ; 00F2 _ 48: 83. C6, 04
        add     rcx, 4                                  ; 00F6 _ 48: 83. C1, 04
        jmp     ?_515                                   ; 00FA _ EB, E6

?_517:  add     rdi, qword [rbx]                        ; 00FC _ 48: 03. 3B
        mov     qword [rbx+8H], rdi                     ; 00FF _ 48: 89. 7B, 08
?_518:  mov     rax, rbx                                ; 0103 _ 48: 89. D8
        add     rsp, 32                                 ; 0106 _ 48: 83. C4, 20
        pop     rbx                                     ; 010A _ 5B
        pop     rsi                                     ; 010B _ 5E
        pop     rdi                                     ; 010C _ 5F
        pop     rbp                                     ; 010D _ 5D
        pop     r12                                     ; 010E _ 41: 5C
        ret                                             ; 0110 _ C3
; _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_ End of function

        nop                                             ; 0111 _ 90
        nop                                             ; 0112 _ 90
        nop                                             ; 0113 _ 90
        nop                                             ; 0114 _ 90
        nop                                             ; 0115 _ 90
        nop                                             ; 0116 _ 90
        nop                                             ; 0117 _ 90
        nop                                             ; 0118 _ 90
        nop                                             ; 0119 _ 90
        nop                                             ; 011A _ 90
        nop                                             ; 011B _ 90
        nop                                             ; 011C _ 90
        nop                                             ; 011D _ 90
        nop                                             ; 011E _ 90
        nop                                             ; 011F _ 90


SECTION .xdata$_ZNSt6vectorI4MoveSaIS0_EEaSERKS2_ align=4 noexecute ; section number 15, const
;  Communal section not supported by YASM

        db 01H, 0AH, 06H, 00H, 0AH, 32H, 06H, 30H       ; 0000 _ .....2.0
        db 05H, 60H, 04H, 70H, 03H, 50H, 02H, 0C0H      ; 0008 _ .`.p.P..


SECTION .text$_ZNSt12_Vector_baseI4MoveSaIS0_EE17_M_create_storageEy align=16 execute ; section number 17, code
;  Communal section not supported by YASM

_ZNSt12_Vector_baseI4MoveSaIS0_EE17_M_create_storageEy:; Function begin
        push    rsi                                     ; 0000 _ 56
        push    rbx                                     ; 0001 _ 53
        sub     rsp, 40                                 ; 0002 _ 48: 83. EC, 28
        xor     eax, eax                                ; 0006 _ 31. C0
        test    rdx, rdx                                ; 0008 _ 48: 85. D2
        mov     rsi, rcx                                ; 000B _ 48: 89. CE
        mov     rbx, rdx                                ; 000E _ 48: 89. D3
        jz      ?_520                                   ; 0011 _ 74, 21
        mov     rax, qword 3FFFFFFFFFFFFFFFH            ; 0013 _ 48: B8, 3FFFFFFFFFFFFFFF
        cmp     rdx, rax                                ; 001D _ 48: 39. C2
        jbe     ?_519                                   ; 0020 _ 76, 05
        call    _ZSt17__throw_bad_allocv                ; 0022 _ E8, 00000000(rel)
?_519:  lea     rcx, [rdx*4]                            ; 0027 _ 48: 8D. 0C 95, 00000000
        call    _Znwy                                   ; 002F _ E8, 00000000(rel)
?_520:  lea     rdx, [rax+rbx*4]                        ; 0034 _ 48: 8D. 14 98
        mov     qword [rsi], rax                        ; 0038 _ 48: 89. 06
        mov     qword [rsi+8H], rax                     ; 003B _ 48: 89. 46, 08
        mov     qword [rsi+10H], rdx                    ; 003F _ 48: 89. 56, 10
        add     rsp, 40                                 ; 0043 _ 48: 83. C4, 28
        pop     rbx                                     ; 0047 _ 5B
        pop     rsi                                     ; 0048 _ 5E
        ret                                             ; 0049 _ C3
; _ZNSt12_Vector_baseI4MoveSaIS0_EE17_M_create_storageEy End of function

        nop                                             ; 004A _ 90
        nop                                             ; 004B _ 90
        nop                                             ; 004C _ 90
        nop                                             ; 004D _ 90
        nop                                             ; 004E _ 90
        nop                                             ; 004F _ 90


SECTION .xdata$_ZNSt12_Vector_baseI4MoveSaIS0_EE17_M_create_storageEy align=4 noexecute ; section number 18, const
;  Communal section not supported by YASM

        db 01H, 06H, 03H, 00H, 06H, 42H, 02H, 30H       ; 0000 _ .....B.0
        db 01H, 60H, 00H, 00H                           ; 0008 _ .`..


SECTION .text$_ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_ align=16 execute ; section number 20, code
;  Communal section not supported by YASM

_ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_:; Function begin
        push    rsi                                     ; 0000 _ 56
        push    rbx                                     ; 0001 _ 53
        sub     rsp, 40                                 ; 0002 _ 48: 83. EC, 28
        mov     rax, qword [rdx+8H]                     ; 0006 _ 48: 8B. 42, 08
        sub     rax, qword [rdx]                        ; 000A _ 48: 2B. 02
        mov     rbx, rcx                                ; 000D _ 48: 89. CB
        mov     rsi, rdx                                ; 0010 _ 48: 89. D6
        mov     qword [rcx], 0                          ; 0013 _ 48: C7. 01, 00000000
        sar     rax, 2                                  ; 001A _ 48: C1. F8, 02
        mov     qword [rcx+8H], 0                       ; 001E _ 48: C7. 41, 08, 00000000
        mov     rdx, rax                                ; 0026 _ 48: 89. C2
        mov     qword [rcx+10H], 0                      ; 0029 _ 48: C7. 41, 10, 00000000
        call    _ZNSt12_Vector_baseI4MoveSaIS0_EE17_M_create_storageEy; 0031 _ E8, 00000000(rel)
        mov     r8, qword [rbx]                         ; 0036 _ 4C: 8B. 03
        mov     r9, qword [rsi]                         ; 0039 _ 4C: 8B. 0E
        mov     r11, qword [rsi+8H]                     ; 003C _ 4C: 8B. 5E, 08
        mov     rdx, r8                                 ; 0040 _ 4C: 89. C2
        mov     rcx, r9                                 ; 0043 _ 4C: 89. C9
?_521:  cmp     r11, rcx                                ; 0046 _ 49: 39. CB
        jz      ?_523                                   ; 0049 _ 74, 15
        test    rdx, rdx                                ; 004B _ 48: 85. D2
        mov     r10d, dword [rcx]                       ; 004E _ 44: 8B. 11
        jz      ?_522                                   ; 0051 _ 74, 03
        mov     dword [rdx], r10d                       ; 0053 _ 44: 89. 12
?_522:  add     rdx, 4                                  ; 0056 _ 48: 83. C2, 04
        add     rcx, 4                                  ; 005A _ 48: 83. C1, 04
        jmp     ?_521                                   ; 005E _ EB, E6
; _ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_ End of function

?_523:  ; Local function
        sub     r11, r9                                 ; 0060 _ 4D: 29. CB
        and     r11, 0FFFFFFFFFFFFFFFCH                 ; 0063 _ 49: 83. E3, FC
        add     r11, r8                                 ; 0067 _ 4D: 01. C3
        mov     qword [rbx+8H], r11                     ; 006A _ 4C: 89. 5B, 08
        add     rsp, 40                                 ; 006E _ 48: 83. C4, 28
        pop     rbx                                     ; 0072 _ 5B
        pop     rsi                                     ; 0073 _ 5E
        ret                                             ; 0074 _ C3

        nop                                             ; 0075 _ 90
        nop                                             ; 0076 _ 90
        nop                                             ; 0077 _ 90
        nop                                             ; 0078 _ 90
        nop                                             ; 0079 _ 90
        nop                                             ; 007A _ 90
        nop                                             ; 007B _ 90
        nop                                             ; 007C _ 90
        nop                                             ; 007D _ 90
        nop                                             ; 007E _ 90
        nop                                             ; 007F _ 90


SECTION .xdata$_ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_ align=4 noexecute ; section number 21, const
;  Communal section not supported by YASM

        db 01H, 06H, 03H, 00H, 06H, 42H, 02H, 30H       ; 0000 _ .....B.0
        db 01H, 60H, 00H, 00H                           ; 0008 _ .`..


SECTION .text$_ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPN6Search8RootMoveEyS3_EEvT_T0_RKT1_ align=16 execute ; section number 23, code
;  Communal section not supported by YASM

_ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPN6Search8RootMoveEyS3_EEvT_T0_RKT1_:; Function begin
        push    rbp                                     ; 0000 _ 55
        push    rdi                                     ; 0001 _ 57
        push    rsi                                     ; 0002 _ 56
        push    rbx                                     ; 0003 _ 53
        sub     rsp, 40                                 ; 0004 _ 48: 83. EC, 28
        mov     rbx, rcx                                ; 0008 _ 48: 89. CB
        mov     rdi, rdx                                ; 000B _ 48: 89. D7
        mov     rsi, r8                                 ; 000E _ 4C: 89. C6
        lea     rbp, [r8+8H]                            ; 0011 _ 49: 8D. 68, 08
?_524:  test    rdi, rdi                                ; 0015 _ 48: 85. FF
        jz      ?_526                                   ; 0018 _ 74, 24
        test    rbx, rbx                                ; 001A _ 48: 85. DB
        jz      ?_525                                   ; 001D _ 74, 16
        mov     eax, dword [rsi]                        ; 001F _ 8B. 06
        lea     rcx, [rbx+8H]                           ; 0021 _ 48: 8D. 4B, 08
        mov     dword [rbx], eax                        ; 0025 _ 89. 03
        mov     edx, dword [rsi+4H]                     ; 0027 _ 8B. 56, 04
        mov     dword [rbx+4H], edx                     ; 002A _ 89. 53, 04
        mov     rdx, rbp                                ; 002D _ 48: 89. EA
        call    _ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_      ; 0030 _ E8, 00000000(rel)
?_525:  dec     rdi                                     ; 0035 _ 48: FF. CF
        add     rbx, 32                                 ; 0038 _ 48: 83. C3, 20
        jmp     ?_524                                   ; 003C _ EB, D7
; _ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPN6Search8RootMoveEyS3_EEvT_T0_RKT1_ End of function

?_526:  ; Local function
        add     rsp, 40                                 ; 003E _ 48: 83. C4, 28
        pop     rbx                                     ; 0042 _ 5B
        pop     rsi                                     ; 0043 _ 5E
        pop     rdi                                     ; 0044 _ 5F
        pop     rbp                                     ; 0045 _ 5D
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


SECTION .xdata$_ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPN6Search8RootMoveEyS3_EEvT_T0_RKT1_ align=4 noexecute ; section number 24, const
;  Communal section not supported by YASM

        db 01H, 08H, 05H, 00H, 08H, 42H, 04H, 30H       ; 0000 _ .....B.0
        db 03H, 60H, 02H, 70H, 01H, 50H, 00H, 00H       ; 0008 _ .`.p.P..


SECTION .text$_ZNSt20__uninitialized_copyILb0EE13__uninit_copyISt13move_iteratorIPN6Search8RootMoveEES5_EET0_T_S8_S7_ align=16 execute ; section number 26, code
;  Communal section not supported by YASM

_ZNSt20__uninitialized_copyILb0EE13__uninit_copyISt13move_iteratorIPN6Search8RootMoveEES5_EET0_T_S8_S7_:; Function begin
        mov     r10, rcx                                ; 0000 _ 49: 89. CA
        mov     r9, r8                                  ; 0003 _ 4D: 89. C1
?_527:  cmp     rdx, r10                                ; 0006 _ 4C: 39. D2
        jz      ?_529                                   ; 0009 _ 74, 65
        test    r9, r9                                  ; 000B _ 4D: 85. C9
        jz      ?_528                                   ; 000E _ 74, 56
        mov     eax, dword [r10]                        ; 0010 _ 41: 8B. 02
        mov     dword [r9], eax                         ; 0013 _ 41: 89. 01
        mov     r11d, dword [r10+4H]                    ; 0016 _ 45: 8B. 5A, 04
        mov     qword [r9+10H], 0                       ; 001A _ 49: C7. 41, 10, 00000000
        mov     qword [r9+18H], 0                       ; 0022 _ 49: C7. 41, 18, 00000000
        mov     qword [r9+8H], 0                        ; 002A _ 49: C7. 41, 08, 00000000
        mov     rax, qword [r10+8H]                     ; 0032 _ 49: 8B. 42, 08
        mov     dword [r9+4H], r11d                     ; 0036 _ 45: 89. 59, 04
        mov     qword [r9+8H], rax                      ; 003A _ 49: 89. 41, 08
        mov     r11, qword [r10+10H]                    ; 003E _ 4D: 8B. 5A, 10
        mov     qword [r10+8H], 0                       ; 0042 _ 49: C7. 42, 08, 00000000
        mov     rax, qword [r9+10H]                     ; 004A _ 49: 8B. 41, 10
        mov     qword [r9+10H], r11                     ; 004E _ 4D: 89. 59, 10
        mov     r11, qword [r10+18H]                    ; 0052 _ 4D: 8B. 5A, 18
        mov     qword [r10+10H], rax                    ; 0056 _ 49: 89. 42, 10
        mov     rax, qword [r9+18H]                     ; 005A _ 49: 8B. 41, 18
        mov     qword [r9+18H], r11                     ; 005E _ 4D: 89. 59, 18
        mov     qword [r10+18H], rax                    ; 0062 _ 49: 89. 42, 18
?_528:  add     r9, 32                                  ; 0066 _ 49: 83. C1, 20
        add     r10, 32                                 ; 006A _ 49: 83. C2, 20
        jmp     ?_527                                   ; 006E _ EB, 96
; _ZNSt20__uninitialized_copyILb0EE13__uninit_copyISt13move_iteratorIPN6Search8RootMoveEES5_EET0_T_S8_S7_ End of function

?_529:  ; Local function
        sub     rdx, rcx                                ; 0070 _ 48: 29. CA
        and     rdx, 0FFFFFFFFFFFFFFE0H                 ; 0073 _ 48: 83. E2, E0
        lea     rax, [r8+rdx]                           ; 0077 _ 49: 8D. 04 10
        ret                                             ; 007B _ C3

        nop                                             ; 007C _ 90
        nop                                             ; 007D _ 90
        nop                                             ; 007E _ 90
        nop                                             ; 007F _ 90


SECTION .xdata$_ZNSt20__uninitialized_copyILb0EE13__uninit_copyISt13move_iteratorIPN6Search8RootMoveEES5_EET0_T_S8_S7_ align=4 noexecute ; section number 27, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_ZNSt6vectorIN6Search8RootMoveESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEyRKS1_ align=16 execute ; section number 29, code
;  Communal section not supported by YASM

_ZNSt6vectorIN6Search8RootMoveESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEyRKS1_:; Function begin
        push    r14                                     ; 0000 _ 41: 56
        push    r13                                     ; 0002 _ 41: 55
        push    r12                                     ; 0004 _ 41: 54
        push    rbp                                     ; 0006 _ 55
        push    rdi                                     ; 0007 _ 57
        push    rsi                                     ; 0008 _ 56
        push    rbx                                     ; 0009 _ 53
        sub     rsp, 64                                 ; 000A _ 48: 83. EC, 40
        test    r8, r8                                  ; 000E _ 4D: 85. C0
        je      ?_546                                   ; 0011 _ 0F 84, 0000028B
        mov     rdi, qword [rcx+8H]                     ; 0017 _ 48: 8B. 79, 08
        mov     r12, r9                                 ; 001B _ 4D: 89. CC
        mov     rbx, r8                                 ; 001E _ 4C: 89. C3
        mov     rsi, rdx                                ; 0021 _ 48: 89. D6
        mov     rax, qword [rcx+10H]                    ; 0024 _ 48: 8B. 41, 10
        mov     rbp, rcx                                ; 0028 _ 48: 89. CD
        sub     rax, rdi                                ; 002B _ 48: 29. F8
        sar     rax, 5                                  ; 002E _ 48: C1. F8, 05
        cmp     rax, r8                                 ; 0032 _ 4C: 39. C0
        jc      ?_537                                   ; 0035 _ 0F 82, 00000185
        mov     r10d, dword [r9]                        ; 003B _ 45: 8B. 11
        lea     r13, [rsp+20H]                          ; 003E _ 4C: 8D. 6C 24, 20
        mov     r11d, dword [r9+4H]                     ; 0043 _ 45: 8B. 59, 04
        lea     rdi, [r13+8H]                           ; 0047 _ 49: 8D. 7D, 08
        lea     rdx, [r9+8H]                            ; 004B _ 49: 8D. 51, 08
        mov     rcx, rdi                                ; 004F _ 48: 89. F9
        mov     dword [rsp+20H], r10d                   ; 0052 _ 44: 89. 54 24, 20
        mov     dword [rsp+24H], r11d                   ; 0057 _ 44: 89. 5C 24, 24
        call    _ZNSt6vectorI4MoveSaIS0_EEC1ERKS2_      ; 005C _ E8, 00000000(rel)
        mov     r12, qword [rbp+8H]                     ; 0061 _ 4C: 8B. 65, 08
        mov     r14, r12                                ; 0065 _ 4D: 89. E6
        sub     r14, rsi                                ; 0068 _ 49: 29. F6
        mov     rax, r14                                ; 006B _ 4C: 89. F0
        sar     rax, 5                                  ; 006E _ 48: C1. F8, 05
        cmp     rax, rbx                                ; 0072 _ 48: 39. D8
        jbe     ?_535                                   ; 0075 _ 0F 86, 000000F2
        shl     rbx, 5                                  ; 007B _ 48: C1. E3, 05
        mov     r14, r12                                ; 007F _ 4D: 89. E6
        mov     r8, r12                                 ; 0082 _ 4D: 89. E0
        sub     r14, rbx                                ; 0085 _ 49: 29. DE
        mov     rdx, r12                                ; 0088 _ 4C: 89. E2
        mov     rcx, r14                                ; 008B _ 4C: 89. F1
        call    _ZNSt20__uninitialized_copyILb0EE13__uninit_copyISt13move_iteratorIPN6Search8RootMoveEES5_EET0_T_S8_S7_; 008E _ E8, 00000000(rel)
        add     qword [rbp+8H], rbx                     ; 0093 _ 48: 01. 5D, 08
        mov     rbp, r14                                ; 0097 _ 4C: 89. F5
        sub     rbp, rsi                                ; 009A _ 48: 29. F5
        sar     rbp, 5                                  ; 009D _ 48: C1. FD, 05
?_530:  test    rbp, rbp                                ; 00A1 _ 48: 85. ED
        jle     ?_532                                   ; 00A4 _ 7E, 7F
        sub     r14, 32                                 ; 00A6 _ 49: 83. EE, 20
        mov     r10d, dword [r14]                       ; 00AA _ 45: 8B. 16
        sub     r12, 32                                 ; 00AD _ 49: 83. EC, 20
        mov     rcx, qword [r12+8H]                     ; 00B1 _ 49: 8B. 4C 24, 08
        mov     dword [r12], r10d                       ; 00B6 _ 45: 89. 14 24
        mov     r11d, dword [r14+4H]                    ; 00BA _ 45: 8B. 5E, 04
        mov     qword [r12+10H], 0                      ; 00BE _ 49: C7. 44 24, 10, 00000000
        test    rcx, rcx                                ; 00C7 _ 48: 85. C9
        mov     qword [r12+18H], 0                      ; 00CA _ 49: C7. 44 24, 18, 00000000
        mov     qword [r12+8H], 0                       ; 00D3 _ 49: C7. 44 24, 08, 00000000
        mov     rax, qword [r14+8H]                     ; 00DC _ 49: 8B. 46, 08
        mov     dword [r12+4H], r11d                    ; 00E0 _ 45: 89. 5C 24, 04
        mov     qword [r12+8H], rax                     ; 00E5 _ 49: 89. 44 24, 08
        mov     rdx, qword [r14+10H]                    ; 00EA _ 49: 8B. 56, 10
        mov     qword [r14+8H], 0                       ; 00EE _ 49: C7. 46, 08, 00000000
        mov     rdi, qword [r12+10H]                    ; 00F6 _ 49: 8B. 7C 24, 10
        mov     qword [r12+10H], rdx                    ; 00FB _ 49: 89. 54 24, 10
        mov     r9, qword [r14+18H]                     ; 0100 _ 4D: 8B. 4E, 18
        mov     qword [r14+10H], rdi                    ; 0104 _ 49: 89. 7E, 10
        mov     r8, qword [r12+18H]                     ; 0108 _ 4D: 8B. 44 24, 18
        mov     qword [r12+18H], r9                     ; 010D _ 4D: 89. 4C 24, 18
        mov     qword [r14+18H], r8                     ; 0112 _ 4D: 89. 46, 18
        jz      ?_531                                   ; 0116 _ 74, 05
        call    _ZdlPv                                  ; 0118 _ E8, 00000000(rel)
?_531:  dec     rbp                                     ; 011D _ 48: FF. CD
        jmp     ?_530                                   ; 0120 _ E9, FFFFFF7C

?_532:  add     rbx, rsi                                ; 0125 _ 48: 01. F3
        add     r13, 8                                  ; 0128 _ 49: 83. C5, 08
?_533:  cmp     rbx, rsi                                ; 012C _ 48: 39. F3
        jz      ?_534                                   ; 012F _ 74, 24
        mov     r8d, dword [rsp+20H]                    ; 0131 _ 44: 8B. 44 24, 20
        lea     rcx, [rsi+8H]                           ; 0136 _ 48: 8D. 4E, 08
        mov     rdx, r13                                ; 013A _ 4C: 89. EA
        add     rsi, 32                                 ; 013D _ 48: 83. C6, 20
        mov     dword [rsi-20H], r8d                    ; 0141 _ 44: 89. 46, E0
        mov     r9d, dword [rsp+24H]                    ; 0145 _ 44: 8B. 4C 24, 24
        mov     dword [rsi-1CH], r9d                    ; 014A _ 44: 89. 4E, E4
        call    _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_      ; 014E _ E8, 00000000(rel)
        jmp     ?_533                                   ; 0153 _ EB, D7

?_534:  mov     rcx, qword [rsp+28H]                    ; 0155 _ 48: 8B. 4C 24, 28
        test    rcx, rcx                                ; 015A _ 48: 85. C9
        je      ?_546                                   ; 015D _ 0F 84, 0000013F
        call    _ZdlPv                                  ; 0163 _ E8, 00000000(rel)
        jmp     ?_546                                   ; 0168 _ E9, 00000135

?_535:  sub     rbx, rax                                ; 016D _ 48: 29. C3
        mov     r8, r13                                 ; 0170 _ 4D: 89. E8
        mov     rcx, r12                                ; 0173 _ 4C: 89. E1
        mov     rdx, rbx                                ; 0176 _ 48: 89. DA
        shl     rbx, 5                                  ; 0179 _ 48: C1. E3, 05
        call    _ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPN6Search8RootMoveEyS3_EEvT_T0_RKT1_; 017D _ E8, 00000000(rel)
        add     rbx, qword [rbp+8H]                     ; 0182 _ 48: 03. 5D, 08
        mov     rdx, r12                                ; 0186 _ 4C: 89. E2
        mov     rcx, rsi                                ; 0189 _ 48: 89. F1
        mov     r8, rbx                                 ; 018C _ 49: 89. D8
        mov     qword [rbp+8H], rbx                     ; 018F _ 48: 89. 5D, 08
        call    _ZNSt20__uninitialized_copyILb0EE13__uninit_copyISt13move_iteratorIPN6Search8RootMoveEES5_EET0_T_S8_S7_; 0193 _ E8, 00000000(rel)
        add     qword [rbp+8H], r14                     ; 0198 _ 4C: 01. 75, 08
?_536:  cmp     r12, rsi                                ; 019C _ 49: 39. F4
        jz      ?_534                                   ; 019F _ 74, B4
        mov     edx, dword [rsp+20H]                    ; 01A1 _ 8B. 54 24, 20
        mov     dword [rsi], edx                        ; 01A5 _ 89. 16
        mov     ecx, dword [rsp+24H]                    ; 01A7 _ 8B. 4C 24, 24
        mov     rdx, rdi                                ; 01AB _ 48: 89. FA
        mov     dword [rsi+4H], ecx                     ; 01AE _ 89. 4E, 04
        lea     rcx, [rsi+8H]                           ; 01B1 _ 48: 8D. 4E, 08
        add     rsi, 32                                 ; 01B5 _ 48: 83. C6, 20
        call    _ZNSt6vectorI4MoveSaIS0_EEaSERKS2_      ; 01B9 _ E8, 00000000(rel)
        jmp     ?_536                                   ; 01BE _ EB, DC

?_537:  mov     rdx, qword [rcx]                        ; 01C0 _ 48: 8B. 11
        mov     rcx, qword 7FFFFFFFFFFFFFFH             ; 01C3 _ 48: B9, 07FFFFFFFFFFFFFF
        mov     r8, rcx                                 ; 01CD _ 49: 89. C8
        sub     rdi, rdx                                ; 01D0 _ 48: 29. D7
        sar     rdi, 5                                  ; 01D3 _ 48: C1. FF, 05
        sub     r8, rdi                                 ; 01D7 _ 49: 29. F8
        cmp     r8, rbx                                 ; 01DA _ 49: 39. D8
        jnc     ?_538                                   ; 01DD _ 73, 0C
        lea     rcx, [rel ?_500]                        ; 01DF _ 48: 8D. 0D, 0000014A(rel)
        call    _ZSt20__throw_length_errorPKc           ; 01E6 _ E8, 00000000(rel)
?_538:  cmp     rdi, rbx                                ; 01EB _ 48: 39. DF
        mov     r9, rbx                                 ; 01EE _ 49: 89. D9
        cmovnc  r9, rdi                                 ; 01F1 _ 4C: 0F 43. CF
        add     rdi, r9                                 ; 01F5 _ 4C: 01. CF
        jc      ?_539                                   ; 01F8 _ 72, 05
        cmp     rdi, rcx                                ; 01FA _ 48: 39. CF
        jbe     ?_540                                   ; 01FD _ 76, 0A
?_539:  mov     rdi, qword 7FFFFFFFFFFFFFFH             ; 01FF _ 48: BF, 07FFFFFFFFFFFFFF
?_540:  mov     r14, rsi                                ; 0209 _ 49: 89. F6
        xor     r13d, r13d                              ; 020C _ 45: 31. ED
        sub     r14, rdx                                ; 020F _ 49: 29. D6
        test    rdi, rdi                                ; 0212 _ 48: 85. FF
        jz      ?_541                                   ; 0215 _ 74, 0F
        mov     rcx, rdi                                ; 0217 _ 48: 89. F9
        shl     rcx, 5                                  ; 021A _ 48: C1. E1, 05
        call    _Znwy                                   ; 021E _ E8, 00000000(rel)
        mov     r13, rax                                ; 0223 _ 49: 89. C5
?_541:  lea     rcx, [r13+r14]                          ; 0226 _ 4B: 8D. 4C 35, 00
        mov     r8, r12                                 ; 022B _ 4D: 89. E0
        mov     rdx, rbx                                ; 022E _ 48: 89. DA
        call    _ZNSt22__uninitialized_fill_nILb0EE15__uninit_fill_nIPN6Search8RootMoveEyS3_EEvT_T0_RKT1_; 0231 _ E8, 00000000(rel)
        mov     rcx, qword [rbp]                        ; 0236 _ 48: 8B. 4D, 00
        mov     rdx, rsi                                ; 023A _ 48: 89. F2
        mov     r8, r13                                 ; 023D _ 4D: 89. E8
        shl     rbx, 5                                  ; 0240 _ 48: C1. E3, 05
        call    _ZNSt20__uninitialized_copyILb0EE13__uninit_copyISt13move_iteratorIPN6Search8RootMoveEES5_EET0_T_S8_S7_; 0244 _ E8, 00000000(rel)
        mov     rdx, qword [rbp+8H]                     ; 0249 _ 48: 8B. 55, 08
        mov     r8, rbx                                 ; 024D _ 49: 89. D8
        mov     rcx, rsi                                ; 0250 _ 48: 89. F1
        add     r8, rax                                 ; 0253 _ 49: 01. C0
        call    _ZNSt20__uninitialized_copyILb0EE13__uninit_copyISt13move_iteratorIPN6Search8RootMoveEES5_EET0_T_S8_S7_; 0256 _ E8, 00000000(rel)
        mov     r12, qword [rbp+8H]                     ; 025B _ 4C: 8B. 65, 08
        mov     r14, qword [rbp]                        ; 025F _ 4C: 8B. 75, 00
        mov     rsi, rax                                ; 0263 _ 48: 89. C6
?_542:  cmp     r12, r14                                ; 0266 _ 4D: 39. F4
        jz      ?_544                                   ; 0269 _ 74, 14
        mov     rcx, qword [r14+8H]                     ; 026B _ 49: 8B. 4E, 08
        test    rcx, rcx                                ; 026F _ 48: 85. C9
        jz      ?_543                                   ; 0272 _ 74, 05
        call    _ZdlPv                                  ; 0274 _ E8, 00000000(rel)
?_543:  add     r14, 32                                 ; 0279 _ 49: 83. C6, 20
        jmp     ?_542                                   ; 027D _ EB, E7

?_544:  mov     rcx, qword [rbp]                        ; 027F _ 48: 8B. 4D, 00
        test    rcx, rcx                                ; 0283 _ 48: 85. C9
        jz      ?_545                                   ; 0286 _ 74, 05
        call    _ZdlPv                                  ; 0288 _ E8, 00000000(rel)
?_545:  shl     rdi, 5                                  ; 028D _ 48: C1. E7, 05
        mov     qword [rbp], r13                        ; 0291 _ 4C: 89. 6D, 00
        lea     rbx, [r13+rdi]                          ; 0295 _ 49: 8D. 5C 3D, 00
        mov     qword [rbp+8H], rsi                     ; 029A _ 48: 89. 75, 08
        mov     qword [rbp+10H], rbx                    ; 029E _ 48: 89. 5D, 10
?_546:  add     rsp, 64                                 ; 02A2 _ 48: 83. C4, 40
        pop     rbx                                     ; 02A6 _ 5B
        pop     rsi                                     ; 02A7 _ 5E
        pop     rdi                                     ; 02A8 _ 5F
        pop     rbp                                     ; 02A9 _ 5D
        pop     r12                                     ; 02AA _ 41: 5C
        pop     r13                                     ; 02AC _ 41: 5D
        pop     r14                                     ; 02AE _ 41: 5E
        ret                                             ; 02B0 _ C3
; _ZNSt6vectorIN6Search8RootMoveESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEyRKS1_ End of function

        nop                                             ; 02B1 _ 90
        nop                                             ; 02B2 _ 90
        nop                                             ; 02B3 _ 90
        nop                                             ; 02B4 _ 90
        nop                                             ; 02B5 _ 90
        nop                                             ; 02B6 _ 90
        nop                                             ; 02B7 _ 90
        nop                                             ; 02B8 _ 90
        nop                                             ; 02B9 _ 90
        nop                                             ; 02BA _ 90
        nop                                             ; 02BB _ 90
        nop                                             ; 02BC _ 90
        nop                                             ; 02BD _ 90
        nop                                             ; 02BE _ 90
        nop                                             ; 02BF _ 90


SECTION .xdata$_ZNSt6vectorIN6Search8RootMoveESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEyRKS1_ align=4 noexecute ; section number 30, const
;  Communal section not supported by YASM

        db 01H, 0EH, 08H, 00H, 0EH, 72H, 0AH, 30H       ; 0000 _ .....r.0
        db 09H, 60H, 08H, 70H, 07H, 50H, 06H, 0C0H      ; 0008 _ .`.p.P..
        db 04H, 0D0H, 02H, 0E0H                         ; 0010 _ ....


SECTION .text$_ZNSt6vectorIN6Search8RootMoveESaIS1_EE6resizeEyRKS1_ align=16 execute ; section number 32, code
;  Communal section not supported by YASM

_ZNSt6vectorIN6Search8RootMoveESaIS1_EE6resizeEyRKS1_:; Function begin
        push    rbp                                     ; 0000 _ 55
        push    rdi                                     ; 0001 _ 57
        push    rsi                                     ; 0002 _ 56
        push    rbx                                     ; 0003 _ 53
        sub     rsp, 40                                 ; 0004 _ 48: 83. EC, 28
        mov     rbp, qword [rcx+8H]                     ; 0008 _ 48: 8B. 69, 08
        mov     rbx, qword [rcx]                        ; 000C _ 48: 8B. 19
        mov     rsi, rcx                                ; 000F _ 48: 89. CE
        mov     rcx, rbp                                ; 0012 _ 48: 89. E9
        sub     rcx, rbx                                ; 0015 _ 48: 29. D9
        sar     rcx, 5                                  ; 0018 _ 48: C1. F9, 05
        cmp     rdx, rcx                                ; 001C _ 48: 39. CA
        jbe     ?_547                                   ; 001F _ 76, 16
        sub     rdx, rcx                                ; 0021 _ 48: 29. CA
        mov     r9, r8                                  ; 0024 _ 4D: 89. C1
        mov     rcx, rsi                                ; 0027 _ 48: 89. F1
        mov     r8, rdx                                 ; 002A _ 49: 89. D0
        mov     rdx, rbp                                ; 002D _ 48: 89. EA
        call    _ZNSt6vectorIN6Search8RootMoveESaIS1_EE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPS1_S3_EEyRKS1_; 0030 _ E8, 00000000(rel)
        jmp     ?_551                                   ; 0035 _ EB, 2C

?_547:  jnc     ?_551                                   ; 0037 _ 73, 2A
        mov     rax, rdx                                ; 0039 _ 48: 89. D0
        shl     rax, 5                                  ; 003C _ 48: C1. E0, 05
        add     rbx, rax                                ; 0040 _ 48: 01. C3
        mov     rdi, rbx                                ; 0043 _ 48: 89. DF
?_548:  cmp     rbp, rdi                                ; 0046 _ 48: 39. FD
        jz      ?_550                                   ; 0049 _ 74, 14
        mov     rcx, qword [rdi+8H]                     ; 004B _ 48: 8B. 4F, 08
        test    rcx, rcx                                ; 004F _ 48: 85. C9
        jz      ?_549                                   ; 0052 _ 74, 05
        call    _ZdlPv                                  ; 0054 _ E8, 00000000(rel)
?_549:  add     rdi, 32                                 ; 0059 _ 48: 83. C7, 20
        jmp     ?_548                                   ; 005D _ EB, E7

?_550:  mov     qword [rsi+8H], rbx                     ; 005F _ 48: 89. 5E, 08
?_551:  add     rsp, 40                                 ; 0063 _ 48: 83. C4, 28
        pop     rbx                                     ; 0067 _ 5B
        pop     rsi                                     ; 0068 _ 5E
        pop     rdi                                     ; 0069 _ 5F
        pop     rbp                                     ; 006A _ 5D
        ret                                             ; 006B _ C3
; _ZNSt6vectorIN6Search8RootMoveESaIS1_EE6resizeEyRKS1_ End of function

        nop                                             ; 006C _ 90
        nop                                             ; 006D _ 90
        nop                                             ; 006E _ 90
        nop                                             ; 006F _ 90


SECTION .xdata$_ZNSt6vectorIN6Search8RootMoveESaIS1_EE6resizeEyRKS1_ align=4 noexecute ; section number 33, const
;  Communal section not supported by YASM

        db 01H, 08H, 05H, 00H, 08H, 42H, 04H, 30H       ; 0000 _ .....B.0
        db 03H, 60H, 02H, 70H, 01H, 50H, 00H, 00H       ; 0008 _ .`.p.P..


SECTION .rdata$zzz align=16 noexecute                   ; section number 35, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr._ZN7Zobrist3psqE align=16 noexecute ; section number 36, const
;  Communal section not supported by YASM

.refptr._ZN7Zobrist3psqE:                               ; qword
        dq _ZN7Zobrist3psqE                             ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


