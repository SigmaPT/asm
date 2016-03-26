; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\pawns.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: BMI etc., x64

default rel

global _ZN5Pawns4initEv: function
global _ZN5Pawns5probeERK8Position: function
global _ZN5Pawns5Entry14do_king_safetyIL5Color1EEE5ScoreRK8Position6Square: function
global _ZN5Pawns5Entry13shelter_stormIL5Color1EEE5ValueRK8Position6Square: function
global _ZN5Pawns5Entry14do_king_safetyIL5Color0EEE5ScoreRK8Position6Square: function
global _ZN5Pawns5Entry13shelter_stormIL5Color0EEE5ValueRK8Position6Square: function
global .refptr.FileBB
global .refptr.InFrontBB
global .refptr.DistanceRingBB
global .refptr.SquareBB
global .refptr.RankBB
global .refptr.StepAttacksBB
global .refptr.PassedPawnMask
global .refptr.ForwardBB
global .refptr.AdjacentFilesBB
global .refptr.PawnAttackSpan

extern PawnAttackSpan                                   ; byte
extern AdjacentFilesBB                                  ; byte
extern ForwardBB                                        ; byte
extern PassedPawnMask                                   ; byte
extern StepAttacksBB                                    ; byte
extern RankBB                                           ; byte
extern SquareBB                                         ; byte
extern DistanceRingBB                                   ; byte
extern InFrontBB                                        ; byte
extern FileBB                                           ; byte


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_ZN5Pawns4initEv:
        push    r14                                     ; 0000 _ 41: 56
        push    r13                                     ; 0002 _ 41: 55
        push    r12                                     ; 0004 _ 41: 54
        push    rbp                                     ; 0006 _ 55
        push    rdi                                     ; 0007 _ 57
        push    rsi                                     ; 0008 _ 56
        push    rbx                                     ; 0009 _ 53
        xor     r14d, r14d                              ; 000A _ 45: 31. F6
        mov     r10d, 2                                 ; 000D _ 41: BA, 00000002
        mov     r9d, 8                                  ; 0013 _ 41: B9, 00000008
        lea     rbp, [rel ?_199]                        ; 0019 _ 48: 8D. 2D, 00000004(rel)
        lea     r13, [rel _ZN12_GLOBAL__N_19ConnectedE] ; 0020 _ 4C: 8D. 2D, 00000040(rel)
?_001:  lea     r12, [r14*4]                            ; 0027 _ 4E: 8D. 24 B5, 00000000
        mov     edi, r14d                               ; 002F _ 44: 89. F7
        xor     esi, esi                                ; 0032 _ 31. F6
?_002:  xor     ebx, ebx                                ; 0034 _ 31. DB
?_003:  lea     r11, [r12+rbx]                          ; 0036 _ 4D: 8D. 1C 1C
        xor     r8d, r8d                                ; 003A _ 45: 31. C0
        shl     r11, 5                                  ; 003D _ 49: C1. E3, 05
        add     r11, r13                                ; 0041 _ 4D: 01. EB
?_004:  xor     eax, eax                                ; 0044 _ 31. C0
        test    esi, esi                                ; 0046 _ 85. F6
        mov     ecx, dword [rbp+r8]                     ; 0048 _ 42: 8B. 4C 05, 00
        jz      ?_005                                   ; 004D _ 74, 11
        lea     rax, [rel ?_200]                        ; 004F _ 48: 8D. 05, 00000008(rel)
        mov     eax, dword [rax+r8]                     ; 0056 _ 42: 8B. 04 00
        sub     eax, ecx                                ; 005A _ 29. C8
        cdq                                             ; 005C _ 99
        idiv    r10d                                    ; 005D _ 41: F7. FA
?_005:  add     ecx, eax                                ; 0060 _ 01. C1
        xor     eax, eax                                ; 0062 _ 31. C0
        test    rbx, rbx                                ; 0064 _ 48: 85. DB
        sarx    ecx, ecx, edi                           ; 0067 _ C4 E2 42: F7. C9
        jz      ?_006                                   ; 006C _ 74, 06
        mov     eax, ecx                                ; 006E _ 89. C8
        cdq                                             ; 0070 _ 99
        idiv    r10d                                    ; 0071 _ 41: F7. FA
?_006:  add     ecx, eax                                ; 0074 _ 01. C1
        lea     eax, [rcx+rcx*4]                        ; 0076 _ 8D. 04 89
        shl     ecx, 16                                 ; 0079 _ C1. E1, 10
        cdq                                             ; 007C _ 99
        idiv    r9d                                     ; 007D _ 41: F7. F9
        add     eax, ecx                                ; 0080 _ 01. C8
        mov     dword [r11+r8+4H], eax                  ; 0082 _ 43: 89. 44 03, 04
        add     r8, 4                                   ; 0087 _ 49: 83. C0, 04
        cmp     r8, 24                                  ; 008B _ 49: 83. F8, 18
        jnz     ?_004                                   ; 008F _ 75, B3
        sub     rbx, 1                                  ; 0091 _ 48: 83. EB, 01
        jz      ?_007                                   ; 0095 _ 74, 07
        mov     ebx, 1                                  ; 0097 _ BB, 00000001
        jmp     ?_003                                   ; 009C _ EB, 98

?_007:  ; Local function
        add     r12, 2                                  ; 009E _ 49: 83. C4, 02
        sub     esi, 1                                  ; 00A2 _ 83. EE, 01
        jz      ?_008                                   ; 00A5 _ 74, 07
        mov     esi, 1                                  ; 00A7 _ BE, 00000001
        jmp     ?_002                                   ; 00AC _ EB, 86

?_008:  ; Local function
        sub     r14, 1                                  ; 00AE _ 49: 83. EE, 01
        jz      ?_009                                   ; 00B2 _ 74, 0B
        mov     r14d, 1                                 ; 00B4 _ 41: BE, 00000001
        jmp     ?_001                                   ; 00BA _ E9, FFFFFF68

?_009:  ; Local function
        pop     rbx                                     ; 00BF _ 5B
        pop     rsi                                     ; 00C0 _ 5E
        pop     rdi                                     ; 00C1 _ 5F
        pop     rbp                                     ; 00C2 _ 5D
        pop     r12                                     ; 00C3 _ 41: 5C
        pop     r13                                     ; 00C5 _ 41: 5D
        pop     r14                                     ; 00C7 _ 41: 5E
        ret                                             ; 00C9 _ C3

        nop                                             ; 00CA _ 90
        nop                                             ; 00CB _ 90
        nop                                             ; 00CC _ 90
        nop                                             ; 00CD _ 90
        nop                                             ; 00CE _ 90
        nop                                             ; 00CF _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=64 noexecute                      ; section number 3, bss

ALIGN   16
_ZN12_GLOBAL__N_1L5LeverE:                              ; oword
        resd    4                                       ; 0000

?_010:                                                  ; oword
        resd    4                                       ; 0010

_ZN12_GLOBAL__N_1L7DoubledE:                            ; oword
        resd    4                                       ; 0020

?_011:                                                  ; oword
        resd    4                                       ; 0030

_ZN12_GLOBAL__N_19ConnectedE:                           ; byte
        resb    256                                     ; 0040

_ZN12_GLOBAL__N_1L11UnsupportedE:                       ; dword
        resd    1                                       ; 0140

?_012:  resd    1                                       ; 0144

_ZN12_GLOBAL__N_1L8BackwardE:                           ; dword
        resd    1                                       ; 0148

?_013:  resd    13                                      ; 014C

ALIGN   16
_ZN12_GLOBAL__N_1L8IsolatedE:                           ; oword
        resd    4                                       ; 0180

?_014:                                                  ; oword
        resd    4                                       ; 0190

?_015:                                                  ; oword
        resd    4                                       ; 01A0

?_016:                                                  ; oword
        resd    4                                       ; 01B0


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_ZN5Pawns5probeERK8Position.cold.6:
        mov     r12d, r10d                              ; 0000 _ 45: 89. D4
        sub     r12d, r9d                               ; 0003 _ 45: 29. CC
        mov     r9d, r12d                               ; 0006 _ 45: 89. E1
        jmp     .text.hot+749H                          ; 0009 _ E9, 00000749(rel)

        mov     eax, dword [rsp+48H]                    ; 000E _ 8B. 44 24, 48
        sub     eax, r8d                                ; 0012 _ 44: 29. C0
        mov     r8d, eax                                ; 0015 _ 41: 89. C0
        jmp     .text.hot+7E9H                          ; 0018 _ E9, 000007E9(rel)

        nop                                             ; 001D _ 90
        nop                                             ; 001E _ 90
        nop                                             ; 001F _ 90


SECTION .text.startup align=16 execute                  ; section number 5, code

.text.startup:; Local function
_GLOBAL__sub_I__ZN5Pawns4initEv:
        movdqa  xmm1, oword [rel ?_205]                 ; 0000 _ 66: 0F 6F. 0D, 000002D0(rel)
        mov     dword [rel _ZN12_GLOBAL__N_1L8BackwardE], 3670049; 0008 _ C7. 05, 00000144(rel), 00380021
        movdqa  xmm0, oword [rel ?_204]                 ; 0012 _ 66: 0F 6F. 05, 000002C0(rel)
        mov     dword [rel ?_013], 2686995              ; 001A _ C7. 05, 00000148(rel), 00290013
        movaps  oword [rel ?_014], xmm1                 ; 0024 _ 0F 29. 0D, 00000190(rel)
        movdqa  xmm2, oword [rel ?_206]                 ; 002B _ 66: 0F 6F. 15, 000002E0(rel)
        movdqa  xmm3, oword [rel ?_207]                 ; 0033 _ 66: 0F 6F. 1D, 000002F0(rel)
        movaps  oword [rel _ZN12_GLOBAL__N_1L8IsolatedE], xmm0; 003B _ 0F 29. 05, 00000180(rel)
        pxor    xmm0, xmm0                              ; 0042 _ 66: 0F EF. C0
        movdqa  xmm4, oword [rel ?_208]                 ; 0046 _ 66: 0F 6F. 25, 00000300(rel)
        movaps  oword [rel ?_015], xmm2                 ; 004E _ 0F 29. 15, 000001A0(rel)
        movdqa  xmm5, oword [rel ?_209]                 ; 0055 _ 66: 0F 6F. 2D, 00000310(rel)
        movaps  oword [rel ?_016], xmm3                 ; 005D _ 0F 29. 1D, 000001B0(rel)
        movdqa  xmm1, oword [rel ?_210]                 ; 0064 _ 66: 0F 6F. 0D, 00000320(rel)
        movaps  oword [rel _ZN12_GLOBAL__N_1L7DoubledE], xmm4; 006C _ 0F 29. 25, 00000020(rel)
        mov     dword [rel _ZN12_GLOBAL__N_1L11UnsupportedE], 1114120; 0073 _ C7. 05, 0000013C(rel), 00110008
        mov     dword [rel ?_012], 1376268              ; 007D _ C7. 05, 00000140(rel), 0015000C
        movaps  oword [rel ?_011], xmm5                 ; 0087 _ 0F 29. 2D, 00000030(rel)
        movaps  oword [rel _ZN12_GLOBAL__N_1L5LeverE], xmm0; 008E _ 0F 29. 05, 00000000(rel)
        movaps  oword [rel ?_010], xmm1                 ; 0095 _ 0F 29. 0D, 00000010(rel)
        ret                                             ; 009C _ C3

        nop                                             ; 009D _ 90
        nop                                             ; 009E _ 90
        nop                                             ; 009F _ 90


SECTION .xdata.startup align=4 noexecute                ; section number 6, const

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .ctors  align=8 noexecute                       ; section number 8, data

        dq _GLOBAL__sub_I__ZN5Pawns4initEv              ; 0000 _ 0000000000000000 (d)


SECTION .xdata  align=4 noexecute                       ; section number 9, const

        db 01H, 0AH, 07H, 00H, 0AH, 30H, 09H, 60H       ; 0000 _ .....0.`
        db 08H, 70H, 07H, 50H, 06H, 0C0H, 04H, 0D0H     ; 0008 _ .p.P....
        db 02H, 0E0H, 00H, 00H                          ; 0010 _ ....


SECTION .text.hot align=16 execute                      ; section number 11, code

.text.hot:; Local function

_ZN5Pawns5probeERK8Position:
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 104                                ; 000C _ 48: 83. EC, 68
        mov     rax, qword [rcx+3B8H]                   ; 0010 _ 48: 8B. 81, 000003B8
        mov     rbx, qword [rax]                        ; 0017 _ 48: 8B. 18
        mov     r14, rcx                                ; 001A _ 49: 89. CE
        mov     rcx, qword [rcx+3B0H]                   ; 001D _ 48: 8B. 89, 000003B0
        mov     rdx, rbx                                ; 0024 _ 48: 89. DA
        and     edx, 3FFFH                              ; 0027 _ 81. E2, 00003FFF
        mov     r8, rdx                                 ; 002D _ 49: 89. D0
        shl     r8, 7                                   ; 0030 _ 49: C1. E0, 07
        lea     rsi, [r8+rdx*8]                         ; 0034 _ 49: 8D. 34 D0
        add     rsi, qword [rcx+48H]                    ; 0038 _ 48: 03. 71, 48
        cmp     qword [rsi], rbx                        ; 003C _ 48: 39. 1E
        mov     r13, rsi                                ; 003F _ 49: 89. F5
        jnz     ?_018                                   ; 0042 _ 75, 1C
?_017:  mov     rax, r13                                ; 0044 _ 4C: 89. E8
        add     rsp, 104                                ; 0047 _ 48: 83. C4, 68
        pop     rbx                                     ; 004B _ 5B
        pop     rsi                                     ; 004C _ 5E
        pop     rdi                                     ; 004D _ 5F
        pop     rbp                                     ; 004E _ 5D
        pop     r12                                     ; 004F _ 41: 5C
        pop     r13                                     ; 0051 _ 41: 5D
        pop     r14                                     ; 0053 _ 41: 5E
        pop     r15                                     ; 0055 _ 41: 5F
        ret                                             ; 0057 _ C3

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_018:  mov     rdi, qword [r14+108H]                   ; 0060 _ 49: 8B. BE, 00000108
        mov     qword [rsi], rbx                        ; 0067 _ 48: 89. 1E
        mov     r11, qword 0FEFEFEFEFEFEFEFEH           ; 006A _ 49: BB, FEFEFEFEFEFEFEFE
        mov     r9, qword 7F7F7F7F7F7F7F7FH             ; 0074 _ 49: B9, 7F7F7F7F7F7F7F7F
        mov     rax, qword 0AA55AA55AA55AA55H           ; 007E _ 48: B8, AA55AA55AA55AA55
        mov     qword [rsp+20H], r13                    ; 0088 _ 4C: 89. 6C 24, 20
        mov     qword [rsp+0B0H], r14                   ; 008D _ 4C: 89. B4 24, 000000B0
        mov     dword [rsp+14H], 255                    ; 0095 _ C7. 44 24, 14, 000000FF
        mov     r12, rdi                                ; 009D _ 49: 89. FC
        and     r12, qword [r14+148H]                   ; 00A0 _ 4D: 23. A6, 00000148
        and     rdi, qword [r14+140H]                   ; 00A7 _ 49: 23. BE, 00000140
        mov     qword [rsi+38H], 0                      ; 00AE _ 48: C7. 46, 38, 00000000
        mov     qword [rsi+18H], 0                      ; 00B6 _ 48: C7. 46, 18, 00000000
        mov     qword [rsi+48H], 64                     ; 00BE _ 48: C7. 46, 48, 00000040
        and     r11, r12                                ; 00C6 _ 4D: 21. E3
        and     r9, r12                                 ; 00C9 _ 4D: 21. E1
        and     rax, r12                                ; 00CC _ 4C: 21. E0
        popcnt  rcx, r12                                ; 00CF _ F3 49: 0F B8. CC
        mov     r15, r11                                ; 00D4 _ 4D: 89. DF
        mov     rbp, rdi                                ; 00D7 _ 48: 89. FD
        shr     r9, 7                                   ; 00DA _ 49: C1. E9, 07
        mov     dword [rsi+64H], 255                    ; 00DE _ C7. 46, 64, 000000FF
        shr     r15, 9                                  ; 00E5 _ 49: C1. EF, 09
        mov     edx, ecx                                ; 00E9 _ 89. CA
        mov     r10, rbp                                ; 00EB _ 49: 89. EA
        popcnt  rbx, rax                                ; 00EE _ F3 48: 0F B8. D8
        or      r15, r9                                 ; 00F3 _ 4D: 09. CF
        mov     dword [rsi+7CH], ebx                    ; 00F6 _ 89. 5E, 7C
        sub     edx, ebx                                ; 00F9 _ 29. DA
        xor     r9d, r9d                                ; 00FB _ 45: 31. C9
        mov     qword [rsi+28H], r15                    ; 00FE _ 4C: 89. 7E, 28
        or      r10, r12                                ; 0102 _ 4D: 09. E2
        xor     esi, esi                                ; 0105 _ 31. F6
        mov     rdi, r12                                ; 0107 _ 4C: 89. E7
        mov     dword [r13+78H], edx                    ; 010A _ 41: 89. 55, 78
        mov     r11d, esi                               ; 010E _ 41: 89. F3
        mov     r13, rbp                                ; 0111 _ 49: 89. ED
        mov     r14, r9                                 ; 0114 _ 4D: 89. CE
        mov     qword [rsp+50H], r10                    ; 0117 _ 4C: 89. 54 24, 50
        mov     qword [rsp+38H], r12                    ; 011C _ 4C: 89. 64 24, 38
?_019:  test    rdi, rdi                                ; 0121 _ 48: 85. FF
        je      ?_048                                   ; 0124 _ 0F 84, 0000072C
        mov     dword [rsp+34H], r11d                   ; 012A _ 44: 89. 5C 24, 34
?_020:  mov     rbx, qword [rel .refptr.PawnAttackSpan] ; 012F _ 48: 8B. 1D, 00000000(rel)
        mov     ebp, 1                                  ; 0136 _ BD, 00000001
        bsf     rax, rdi                                ; 013B _ 48: 0F BC. C7
        lea     r8, [rax+40H]                           ; 013F _ 4C: 8D. 40, 40
        mov     r12d, eax                               ; 0143 _ 41: 89. C4
        mov     rcx, qword [rsp+20H]                    ; 0146 _ 48: 8B. 4C 24, 20
        blsr    rdi, rdi                                ; 014B _ C4 E2 C0: F3. CF
        and     r12d, 07H                               ; 0150 _ 41: 83. E4, 07
        mov     rsi, qword [rel .refptr.AdjacentFilesBB]; 0154 _ 48: 8B. 35, 00000000(rel)
; Note: Prefix bit or byte has no meaning in this context
        shlx    r11d, ebp, r12d                         ; 015B _ C4 62 19: F7. DD
        mov     r9d, r12d                               ; 0160 _ 45: 89. E1
        or      r14, qword [rbx+r8*8]                   ; 0163 _ 4E: 0B. 34 C3
        andn    r15d, r11d, dword [rsp+14H]             ; 0167 _ C4 62 20: F2. 7C 24, 14
        mov     r12, qword [rel .refptr.ForwardBB]      ; 016E _ 4C: 8B. 25, 00000000(rel)
        mov     dword [rsp+14H], r15d                   ; 0175 _ 44: 89. 7C 24, 14
        mov     r10, qword [rsp+38H]                    ; 017A _ 4C: 8B. 54 24, 38
        mov     qword [rsp+40H], r9                     ; 017F _ 4C: 89. 4C 24, 40
        mov     r11, qword [rel .refptr.PassedPawnMask] ; 0184 _ 4C: 8B. 1D, 00000000(rel)
        mov     qword [rcx+38H], r14                    ; 018B _ 4C: 89. 71, 38
        mov     r15, qword [rel .refptr.StepAttacksBB]  ; 018F _ 4C: 8B. 3D, 00000000(rel)
        mov     rbp, qword [r12+r8*8]                   ; 0196 _ 4B: 8B. 2C C4
        lea     r12d, [rax+8H]                          ; 019A _ 44: 8D. 60, 08
        mov     rdx, r10                                ; 019E _ 4C: 89. D2
        and     rdx, qword [rsi+r9*8]                   ; 01A1 _ 4A: 23. 14 CE
        mov     r9, rax                                 ; 01A5 _ 49: 89. C1
        mov     rcx, qword [rel .refptr.RankBB]         ; 01A8 _ 48: 8B. 0D, 00000000(rel)
        and     r10, rbp                                ; 01AF _ 49: 21. EA
        test    rbp, r13                                ; 01B2 _ 4C: 85. ED
        setne   byte [rsp]                              ; 01B5 _ 0F 95. 04 24
        test    qword [r11+r8*8], r13                   ; 01B9 _ 4F: 85. 2C C3
        sete    byte [rsp+13H]                          ; 01BD _ 0F 94. 44 24, 13
        test    qword [r15+rax*8+1200H], r13            ; 01C2 _ 4D: 85. AC C7, 00001200
        movsxd  r15, r12d                               ; 01CA _ 4D: 63. FC
        movzx   ebp, byte [rsp+13H]                     ; 01CD _ 0F B6. 6C 24, 13
        setne   r11b                                    ; 01D2 _ 41: 0F 95. C3
        shr     r9, 3                                   ; 01D6 _ 49: C1. E9, 03
        mov     ebx, r9d                                ; 01DA _ 44: 89. CB
        shr     r15, 3                                  ; 01DD _ 49: C1. EF, 03
        mov     dword [rsp+48H], r9d                    ; 01E1 _ 44: 89. 4C 24, 48
        mov     rsi, qword [rcx+rbx*8]                  ; 01E6 _ 48: 8B. 34 D9
        mov     ecx, r15d                               ; 01EA _ 44: 89. F9
        mov     r15d, r11d                              ; 01ED _ 45: 89. DF
        mov     rbx, qword [rel .refptr.RankBB]         ; 01F0 _ 48: 8B. 1D, 00000000(rel)
        mov     qword [rsp+18H], rsi                    ; 01F7 _ 48: 89. 74 24, 18
        mov     r12, qword [rbx+rcx*8]                  ; 01FC _ 4C: 8B. 24 CB
        mov     rcx, r12                                ; 0200 _ 4C: 89. E1
        or      r12, rsi                                ; 0203 _ 49: 09. F4
        and     rcx, rdx                                ; 0206 _ 48: 21. D1
        test    r12, rdx                                ; 0209 _ 49: 85. D4
        setne   sil                                     ; 020C _ 40: 0F 95. C6
        test    rdx, rdx                                ; 0210 _ 48: 85. D2
        sete    bl                                      ; 0213 _ 0F 94. C3
        or      r15d, ebx                               ; 0216 _ 41: 09. DF
        mov     r12d, r15d                              ; 0219 _ 45: 89. FC
        mov     r15d, 0                                 ; 021C _ 41: BF, 00000000
        or      r12b, bpl                               ; 0222 _ 41: 08. EC
        jnz     ?_021                                   ; 0225 _ 75, 09
        test    sil, sil                                ; 0227 _ 40: 84. F6
        je      ?_036                                   ; 022A _ 0F 84, 000003E0
?_021:  test    r10, r10                                ; 0230 _ 4D: 85. D2
        jnz     ?_022                                   ; 0233 _ 75, 0B
        cmp     byte [rsp+13H], 0                       ; 0235 _ 80. 7C 24, 13, 00
        jne     ?_047                                   ; 023A _ 0F 85, 000005FD
?_022:  test    bl, bl                                  ; 0240 _ 84. DB
        jne     ?_037                                   ; 0242 _ 0F 85, 00000438
        test    r15b, r15b                              ; 0248 _ 45: 84. FF
        jne     ?_051                                   ; 024B _ 0F 85, 0000064C
        test    rcx, rcx                                ; 0251 _ 48: 85. C9
        jnz     ?_023                                   ; 0254 _ 75, 37
        sub     eax, 8                                  ; 0256 _ 83. E8, 08
        mov     r15, qword [rel .refptr.RankBB]         ; 0259 _ 4C: 8B. 3D, 00000000(rel)
        mov     rbx, rdx                                ; 0260 _ 48: 89. D3
        xor     ebp, ebp                                ; 0263 _ 31. ED
        cdqe                                            ; 0265 _ 48: 98
        shr     rax, 3                                  ; 0267 _ 48: C1. E8, 03
        mov     eax, eax                                ; 026B _ 89. C0
        and     rbx, qword [r15+rax*8]                  ; 026D _ 49: 23. 1C C7
        lea     rax, [rel _ZN12_GLOBAL__N_1L11UnsupportedE]; 0271 _ 48: 8D. 05, 00000140(rel)
        blsr    r12, rbx                                ; 0278 _ C4 E2 98: F3. CB
        test    r12, r12                                ; 027D _ 4D: 85. E4
        setne   bpl                                     ; 0280 _ 40: 0F 95. C5
        mov     r15d, dword [rax+rbp*4]                 ; 0284 _ 44: 8B. 3C A8
        sub     dword [rsp+34H], r15d                   ; 0288 _ 44: 29. 7C 24, 34
?_023:  test    sil, sil                                ; 028D _ 40: 84. F6
        jz      ?_024                                   ; 0290 _ 74, 47
        mov     r12, qword [rsp]                        ; 0292 _ 4C: 8B. 24 24
        blsr    rcx, rcx                                ; 0296 _ C4 E2 F0: F3. C9
        xor     esi, esi                                ; 029B _ 31. F6
        test    rcx, rcx                                ; 029D _ 48: 85. C9
        lea     rcx, [rel _ZN12_GLOBAL__N_19ConnectedE] ; 02A0 _ 48: 8D. 0D, 00000040(rel)
        setne   sil                                     ; 02A7 _ 40: 0F 95. C6
        mov     ebx, r9d                                ; 02AB _ 44: 89. CB
        and     r12d, 01H                               ; 02AE _ 41: 83. E4, 01
        test    qword [rsp+18H], rdx                    ; 02B2 _ 48: 85. 54 24, 18
        setne   dl                                      ; 02B7 _ 0F 95. C2
        xor     ebx, 07H                                ; 02BA _ 83. F3, 07
        movzx   ebp, dl                                 ; 02BD _ 0F B6. EA
        lea     rax, [rbp+r12*2]                        ; 02C0 _ 4A: 8D. 44 65, 00
        lea     r15, [rsi+rax*2]                        ; 02C5 _ 4C: 8D. 3C 46
        shl     r15, 5                                  ; 02C9 _ 49: C1. E7, 05
        lea     r8, [r15+rbx*4]                         ; 02CD _ 4D: 8D. 04 9F
        mov     esi, dword [rcx+r8]                     ; 02D1 _ 42: 8B. 34 01
        add     dword [rsp+34H], esi                    ; 02D5 _ 01. 74 24, 34
?_024:  test    r10, r10                                ; 02D9 _ 4D: 85. D2
        jne     ?_042                                   ; 02DC _ 0F 85, 00000453
?_025:  test    r11b, r11b                              ; 02E2 _ 45: 84. DB
        jne     ?_044                                   ; 02E5 _ 0F 85, 000004B9
        test    rdi, rdi                                ; 02EB _ 48: 85. FF
        jne     ?_020                                   ; 02EE _ 0F 85, FFFFFE3B
        mov     r13, qword [rsp+20H]                    ; 02F4 _ 4C: 8B. 6C 24, 20
        mov     eax, dword [rsp+14H]                    ; 02F9 _ 8B. 44 24, 14
        mov     r14, qword [rsp+0B0H]                   ; 02FD _ 4C: 8B. B4 24, 000000B0
        mov     dword [r13+64H], eax                    ; 0305 _ 41: 89. 45, 64
?_026:  xor     al, 0FFFFFFFFH                          ; 0309 _ 34, FF
        cdqe                                            ; 030B _ 48: 98
        test    rax, rax                                ; 030D _ 48: 85. C0
        je      ?_054                                   ; 0310 _ 0F 84, 000005B3
        bsf     r11, rax                                ; 0316 _ 4C: 0F BC. D8
        bsr     rdi, rax                                ; 031A _ 48: 0F BD. F8
        sub     edi, r11d                               ; 031E _ 44: 29. DF
?_027:  mov     r9, qword [r14+108H]                    ; 0321 _ 4D: 8B. 8E, 00000108
        xor     r11d, r11d                              ; 0328 _ 45: 31. DB
        xor     r12d, r12d                              ; 032B _ 45: 31. E4
        mov     rbp, qword 7F7F7F7F7F7F7F7FH            ; 032E _ 48: BD, 7F7F7F7F7F7F7F7F
        mov     rcx, qword 0FEFEFEFEFEFEFEFEH           ; 0338 _ 48: B9, FEFEFEFEFEFEFEFE
        mov     r15, rbp                                ; 0342 _ 49: 89. EF
        mov     dword [r13+6CH], edi                    ; 0345 _ 41: 89. 7D, 6C
        mov     rbx, qword 0AA55AA55AA55AA55H           ; 0349 _ 48: BB, AA55AA55AA55AA55
        mov     qword [rsp+38H], r13                    ; 0353 _ 4C: 89. 6C 24, 38
        mov     rsi, r9                                 ; 0358 _ 4C: 89. CE
        and     rsi, qword [r14+140H]                   ; 035B _ 49: 23. B6, 00000140
        and     r9, qword [r14+148H]                    ; 0362 _ 4D: 23. 8E, 00000148
        mov     qword [r13+30H], 0                      ; 0369 _ 49: C7. 45, 30, 00000000
        mov     qword [r13+10H], 0                      ; 0371 _ 49: C7. 45, 10, 00000000
        mov     qword [r13+40H], 64                     ; 0379 _ 49: C7. 45, 40, 00000040
        and     rcx, rsi                                ; 0381 _ 48: 21. F1
        and     r15, rsi                                ; 0384 _ 49: 21. F7
        and     rbx, rsi                                ; 0387 _ 48: 21. F3
        popcnt  rdx, rsi                                ; 038A _ F3 48: 0F B8. D6
        shl     rcx, 7                                  ; 038F _ 48: C1. E1, 07
        mov     r14d, edx                               ; 0393 _ 41: 89. D6
        popcnt  r8, rbx                                 ; 0396 _ F3 4C: 0F B8. C3
        shl     r15, 9                                  ; 039B _ 49: C1. E7, 09
        or      r15, rcx                                ; 039F _ 49: 09. CF
        mov     r10, r9                                 ; 03A2 _ 4D: 89. CA
        sub     r14d, r8d                               ; 03A5 _ 45: 29. C6
        mov     dword [r13+74H], r8d                    ; 03A8 _ 45: 89. 45, 74
        or      r9, rsi                                 ; 03AC _ 49: 09. F1
        mov     ecx, 255                                ; 03AF _ B9, 000000FF
        mov     qword [r13+20H], r15                    ; 03B4 _ 4D: 89. 7D, 20
        mov     r15, r11                                ; 03B8 _ 4D: 89. DF
        mov     dword [r13+60H], 255                    ; 03BB _ 41: C7. 45, 60, 000000FF
        mov     r8d, ecx                                ; 03C3 _ 41: 89. C8
        mov     dword [r13+70H], r14d                   ; 03C6 _ 45: 89. 75, 70
        mov     r13, rsi                                ; 03CA _ 49: 89. F5
        mov     qword [rsp+58H], r9                     ; 03CD _ 4C: 89. 4C 24, 58
        mov     r9, r10                                 ; 03D2 _ 4D: 89. D1
        mov     qword [rsp+40H], rsi                    ; 03D5 _ 48: 89. 74 24, 40
?_028:  test    r13, r13                                ; 03DA _ 4D: 85. ED
        je      ?_049                                   ; 03DD _ 0F 84, 0000048E
        mov     dword [rsp+18H], r12d                   ; 03E3 _ 44: 89. 64 24, 18
        mov     dword [rsp], r8d                        ; 03E8 _ 44: 89. 04 24
        jmp     ?_035                                   ; 03EC _ E9, 000000C0

?_029:  xor     r12d, r12d                              ; 03F1 _ 45: 31. E4
?_030:  test    r8, r8                                  ; 03F4 _ 4D: 85. C0
        jnz     ?_031                                   ; 03F7 _ 75, 0B
        cmp     byte [rsp+13H], 0                       ; 03F9 _ 80. 7C 24, 13, 00
        jne     ?_046                                   ; 03FE _ 0F 85, 00000420
?_031:  test    r11b, r11b                              ; 0404 _ 45: 84. DB
        jne     ?_038                                   ; 0407 _ 0F 85, 000002A3
        test    r12b, r12b                              ; 040D _ 45: 84. E4
        jne     ?_050                                   ; 0410 _ 0F 85, 00000468
        test    rcx, rcx                                ; 0416 _ 48: 85. C9
        jnz     ?_032                                   ; 0419 _ 75, 38
        add     eax, 8                                  ; 041B _ 83. C0, 08
        mov     r12, qword [rel .refptr.RankBB]         ; 041E _ 4C: 8B. 25, 00000000(rel)
        mov     r11, rdx                                ; 0425 _ 49: 89. D3
        cdqe                                            ; 0428 _ 48: 98
        shr     rax, 3                                  ; 042A _ 48: C1. E8, 03
        mov     eax, eax                                ; 042E _ 89. C0
        and     r11, qword [r12+rax*8]                  ; 0430 _ 4D: 23. 1C C4
        lea     rax, [rel _ZN12_GLOBAL__N_1L11UnsupportedE]; 0434 _ 48: 8D. 05, 00000140(rel)
        xor     r12d, r12d                              ; 043B _ 45: 31. E4
        blsr    rbp, r11                                ; 043E _ C4 C2 D0: F3. CB
        test    rbp, rbp                                ; 0443 _ 48: 85. ED
        setne   r12b                                    ; 0446 _ 41: 0F 95. C4
        mov     r11d, dword [rax+r12*4]                 ; 044A _ 46: 8B. 1C A0
        sub     dword [rsp+18H], r11d                   ; 044E _ 44: 29. 5C 24, 18
?_032:  test    sil, sil                                ; 0453 _ 40: 84. F6
        jz      ?_033                                   ; 0456 _ 74, 3E
        mov     rax, qword [rsp+20H]                    ; 0458 _ 48: 8B. 44 24, 20
        blsr    rcx, rcx                                ; 045D _ C4 E2 F0: F3. C9
        xor     esi, esi                                ; 0462 _ 31. F6
        test    rcx, rcx                                ; 0464 _ 48: 85. C9
        lea     r12, [rel _ZN12_GLOBAL__N_19ConnectedE] ; 0467 _ 4C: 8D. 25, 00000040(rel)
        setne   sil                                     ; 046E _ 40: 0F 95. C6
        and     eax, 01H                                ; 0472 _ 83. E0, 01
        test    rdx, rbx                                ; 0475 _ 48: 85. DA
        setne   dl                                      ; 0478 _ 0F 95. C2
        movzx   ebx, dl                                 ; 047B _ 0F B6. DA
        lea     r11, [rbx+rax*2]                        ; 047E _ 4C: 8D. 1C 43
        lea     r14, [rsi+r11*2]                        ; 0482 _ 4E: 8D. 34 5E
        shl     r14, 5                                  ; 0486 _ 49: C1. E6, 05
        lea     rbp, [r14+r10*4]                        ; 048A _ 4B: 8D. 2C 96
        mov     ecx, dword [r12+rbp]                    ; 048E _ 41: 8B. 0C 2C
        add     dword [rsp+18H], ecx                    ; 0492 _ 01. 4C 24, 18
?_033:  test    r8, r8                                  ; 0496 _ 4D: 85. C0
        jne     ?_045                                   ; 0499 _ 0F 85, 00000331
?_034:  test    dil, dil                                ; 049F _ 40: 84. FF
        jne     ?_043                                   ; 04A2 _ 0F 85, 000002DA
        test    r13, r13                                ; 04A8 _ 4D: 85. ED
        je      ?_039                                   ; 04AB _ 0F 84, 0000022F
?_035:  mov     rbx, qword [rel .refptr.PawnAttackSpan] ; 04B1 _ 48: 8B. 1D, 00000000(rel)
        mov     r10d, 1                                 ; 04B8 _ 41: BA, 00000001
        bsf     rax, r13                                ; 04BE _ 49: 0F BC. C5
        mov     r8, qword [rsp+38H]                     ; 04C2 _ 4C: 8B. 44 24, 38
        mov     esi, eax                                ; 04C7 _ 89. C6
        blsr    r13, r13                                ; 04C9 _ C4 C2 90: F3. CD
        mov     r11, qword [rel .refptr.ForwardBB]      ; 04CE _ 4C: 8B. 1D, 00000000(rel)
        and     esi, 07H                                ; 04D5 _ 83. E6, 07
        or      r15, qword [rbx+rax*8]                  ; 04D8 _ 4C: 0B. 3C C3
; Note: Prefix bit or byte has no meaning in this context
; Note: Bogus length-changing prefix causes delay on Intel processors here
        shlx    r12d, r10d, esi                         ; 04DC _ C4 42 49: F7. E2
        mov     r14d, esi                               ; 04E1 _ 41: 89. F6
        andn    ebp, r12d, dword [rsp]                  ; 04E4 _ C4 E2 18: F2. 2C 24
        mov     rdi, qword [rel .refptr.AdjacentFilesBB]; 04EA _ 48: 8B. 3D, 00000000(rel)
        mov     qword [rsp+50H], r14                    ; 04F1 _ 4C: 89. 74 24, 50
        mov     r12, rax                                ; 04F6 _ 49: 89. C4
        mov     rsi, qword [rel .refptr.PassedPawnMask] ; 04F9 _ 48: 8B. 35, 00000000(rel)
        mov     dword [rsp], ebp                        ; 0500 _ 89. 2C 24
        mov     r10, qword [rel .refptr.StepAttacksBB]  ; 0503 _ 4C: 8B. 15, 00000000(rel)
        mov     qword [r8+30H], r15                     ; 050A _ 4D: 89. 78, 30
        mov     r8, qword [rsp+40H]                     ; 050E _ 4C: 8B. 44 24, 40
        mov     rcx, qword [r11+rax*8]                  ; 0513 _ 49: 8B. 0C C3
        mov     rbx, qword [rel .refptr.RankBB]         ; 0517 _ 48: 8B. 1D, 00000000(rel)
        mov     rdx, r8                                 ; 051E _ 4C: 89. C2
        and     rdx, qword [rdi+r14*8]                  ; 0521 _ 4A: 23. 14 F7
        and     r8, rcx                                 ; 0525 _ 49: 21. C8
        test    rcx, r9                                 ; 0528 _ 4C: 85. C9
        setne   byte [rsp+20H]                          ; 052B _ 0F 95. 44 24, 20
        test    qword [rsi+rax*8], r9                   ; 0530 _ 4C: 85. 0C C6
        mov     rsi, qword [rel .refptr.RankBB]         ; 0534 _ 48: 8B. 35, 00000000(rel)
        lea     r14d, [rax-8H]                          ; 053B _ 44: 8D. 70, F8
        movsxd  r11, r14d                               ; 053F _ 4D: 63. DE
        sete    byte [rsp+13H]                          ; 0542 _ 0F 94. 44 24, 13
        test    qword [r10+rax*8+200H], r9              ; 0547 _ 4D: 85. 8C C2, 00000200
        movzx   ebp, byte [rsp+13H]                     ; 054F _ 0F B6. 6C 24, 13
        setne   dil                                     ; 0554 _ 40: 0F 95. C7
        shr     r12, 3                                  ; 0558 _ 49: C1. EC, 03
        shr     r11, 3                                  ; 055C _ 49: C1. EB, 03
        mov     r10d, r12d                              ; 0560 _ 45: 89. E2
        mov     qword [rsp+48H], r12                    ; 0563 _ 4C: 89. 64 24, 48
        mov     r14d, edi                               ; 0568 _ 41: 89. FE
        mov     ecx, r11d                               ; 056B _ 44: 89. D9
        mov     rbx, qword [rbx+r10*8]                  ; 056E _ 4A: 8B. 1C D3
        mov     r12, qword [rsi+rcx*8]                  ; 0572 _ 4C: 8B. 24 CE
        mov     rcx, r12                                ; 0576 _ 4C: 89. E1
        or      r12, rbx                                ; 0579 _ 49: 09. DC
        and     rcx, rdx                                ; 057C _ 48: 21. D1
        test    r12, rdx                                ; 057F _ 49: 85. D4
        setne   sil                                     ; 0582 _ 40: 0F 95. C6
        test    rdx, rdx                                ; 0586 _ 48: 85. D2
        sete    r11b                                    ; 0589 _ 41: 0F 94. C3
        or      r14d, r11d                              ; 058D _ 45: 09. DE
        or      r14b, bpl                               ; 0590 _ 41: 08. EE
        jne     ?_029                                   ; 0593 _ 0F 85, FFFFFE58
        test    sil, sil                                ; 0599 _ 40: 84. F6
        jne     ?_029                                   ; 059C _ 0F 85, FFFFFE4F
        mov     r14, qword [rel .refptr.PawnAttackSpan] ; 05A2 _ 4C: 8B. 35, 00000000(rel)
        mov     r12, qword [rsp+40H]                    ; 05A9 _ 4C: 8B. 64 24, 40
        test    qword [r14+rax*8+200H], r12             ; 05AE _ 4D: 85. A4 C6, 00000200
        jne     ?_052                                   ; 05B6 _ 0F 85, 000002FD
        cmp     dword [rsp+48H], 3                      ; 05BC _ 83. 7C 24, 48, 03
        ja      ?_052                                   ; 05C1 _ 0F 87, 000002F2
        mov     rbp, qword [rel .refptr.PawnAttackSpan] ; 05C7 _ 48: 8B. 2D, 00000000(rel)
        mov     r14, qword [rbp+rax*8]                  ; 05CE _ 4C: 8B. 74 C5, 00
        mov     r12, r14                                ; 05D3 _ 4D: 89. F4
        and     r12, qword [rsp+58H]                    ; 05D6 _ 4C: 23. 64 24, 58
        bsf     rbp, r12                                ; 05DB _ 49: 0F BC. EC
        shr     rbp, 3                                  ; 05DF _ 48: C1. ED, 03
        mov     r12d, ebp                               ; 05E3 _ 41: 89. EC
        mov     rbp, qword [rel .refptr.RankBB]         ; 05E6 _ 48: 8B. 2D, 00000000(rel)
        and     r14, qword [rbp+r12*8]                  ; 05ED _ 4E: 23. 74 E5, 00
        mov     r12, r14                                ; 05F2 _ 4D: 89. F4
        shl     r14, 8                                  ; 05F5 _ 49: C1. E6, 08
        or      r12, r14                                ; 05F9 _ 4D: 09. F4
        test    r12, r9                                 ; 05FC _ 4D: 85. CC
        setne   r12b                                    ; 05FF _ 41: 0F 95. C4
        jmp     ?_030                                   ; 0603 _ E9, FFFFFDEC

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_036:  mov     r12, qword [rel .refptr.PawnAttackSpan] ; 0610 _ 4C: 8B. 25, 00000000(rel)
        mov     rbp, qword [rsp+38H]                    ; 0617 _ 48: 8B. 6C 24, 38
        test    qword [r12+rax*8], rbp                  ; 061C _ 49: 85. 2C C4
        jne     ?_021                                   ; 0620 _ 0F 85, FFFFFC0A
        mov     r15d, r9d                               ; 0626 _ 45: 89. CF
        xor     r15d, 07H                               ; 0629 _ 41: 83. F7, 07
        cmp     r15d, 3                                 ; 062D _ 41: 83. FF, 03
        ja      ?_053                                   ; 0631 _ 0F 87, 0000028A
        mov     r12, qword [rel .refptr.PawnAttackSpan] ; 0637 _ 4C: 8B. 25, 00000000(rel)
        mov     rbp, qword [rsp+50H]                    ; 063E _ 48: 8B. 6C 24, 50
        mov     r8, qword [r12+r8*8]                    ; 0643 _ 4F: 8B. 04 C4
        and     rbp, r8                                 ; 0647 _ 4C: 21. C5
        bsr     r15, rbp                                ; 064A _ 4C: 0F BD. FD
        mov     rbp, qword [rel .refptr.RankBB]         ; 064E _ 48: 8B. 2D, 00000000(rel)
        shr     r15, 3                                  ; 0655 _ 49: C1. EF, 03
        mov     r12d, r15d                              ; 0659 _ 45: 89. FC
        and     r8, qword [rbp+r12*8]                   ; 065C _ 4E: 23. 44 E5, 00
        mov     r15, r8                                 ; 0661 _ 4D: 89. C7
        shr     r15, 8                                  ; 0664 _ 49: C1. EF, 08
        or      r8, r15                                 ; 0668 _ 4D: 09. F8
        test    r8, r13                                 ; 066B _ 4D: 85. E8
        setne   r15b                                    ; 066E _ 41: 0F 95. C7
        jmp     ?_021                                   ; 0672 _ E9, FFFFFBB9

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_037:  mov     rbp, qword [rsp]                        ; 0680 _ 48: 8B. 2C 24
        lea     rbx, [rel _ZN12_GLOBAL__N_1L8IsolatedE] ; 0684 _ 48: 8D. 1D, 00000180(rel)
        mov     rax, qword [rsp+40H]                    ; 068B _ 48: 8B. 44 24, 40
        and     ebp, 01H                                ; 0690 _ 83. E5, 01
        shl     rbp, 5                                  ; 0693 _ 48: C1. E5, 05
        lea     r15, [rbp+rax*4]                        ; 0697 _ 4C: 8D. 7C 85, 00
        mov     r8d, dword [rbx+r15]                    ; 069C _ 46: 8B. 04 3B
        sub     dword [rsp+34H], r8d                    ; 06A0 _ 44: 29. 44 24, 34
        jmp     ?_023                                   ; 06A5 _ E9, FFFFFBE3

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_038:  mov     rax, qword [rsp+20H]                    ; 06B0 _ 48: 8B. 44 24, 20
        lea     rbp, [rel _ZN12_GLOBAL__N_1L8IsolatedE] ; 06B5 _ 48: 8D. 2D, 00000180(rel)
        mov     r11, qword [rsp+50H]                    ; 06BC _ 4C: 8B. 5C 24, 50
        and     eax, 01H                                ; 06C1 _ 83. E0, 01
        shl     rax, 5                                  ; 06C4 _ 48: C1. E0, 05
        lea     r14, [rax+r11*4]                        ; 06C8 _ 4E: 8D. 34 98
        mov     r12d, dword [rbp+r14]                   ; 06CC _ 46: 8B. 64 35, 00
        sub     dword [rsp+18H], r12d                   ; 06D1 _ 44: 29. 64 24, 18
        jmp     ?_032                                   ; 06D6 _ E9, FFFFFD78

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_039:  mov     r13, qword [rsp+38H]                    ; 06E0 _ 4C: 8B. 6C 24, 38
        mov     r9d, dword [rsp]                        ; 06E5 _ 44: 8B. 0C 24
        mov     r12d, dword [rsp+18H]                   ; 06E9 _ 44: 8B. 64 24, 18
        mov     dword [r13+60H], r9d                    ; 06EE _ 45: 89. 4D, 60
?_040:  mov     r10d, r9d                               ; 06F2 _ 45: 89. CA
        xor     r10b, 0FFFFFFFFH                        ; 06F5 _ 41: 80. F2, FF
        test    r10d, r10d                              ; 06F9 _ 45: 85. D2
        movsxd  r15, r10d                               ; 06FC _ 4D: 63. FA
        jz      ?_041                                   ; 06FF _ 74, 0B
        bsf     rdi, r15                                ; 0701 _ 49: 0F BC. FF
        bsr     r10, r15                                ; 0705 _ 4D: 0F BD. D7
        sub     r10d, edi                               ; 0709 _ 41: 29. FA
?_041:  mov     eax, dword [rsp+14H]                    ; 070C _ 8B. 44 24, 14
        mov     ecx, r12d                               ; 0710 _ 44: 89. E1
        mov     dword [r13+68H], r10d                   ; 0713 _ 45: 89. 55, 68
        sub     ecx, dword [rsp+34H]                    ; 0717 _ 2B. 4C 24, 34
        xor     eax, r9d                                ; 071B _ 44: 31. C8
        cdqe                                            ; 071E _ 48: 98
        mov     dword [r13+8H], ecx                     ; 0720 _ 41: 89. 4D, 08
        popcnt  rsi, rax                                ; 0724 _ F3 48: 0F B8. F0
        mov     dword [r13+80H], esi                    ; 0729 _ 41: 89. B5, 00000080
        jmp     ?_017                                   ; 0730 _ E9, FFFFF90F

?_042:  bsf     r10, r10                                ; 0735 _ 4D: 0F BC. D2
        shr     r10, 3                                  ; 0739 _ 49: C1. EA, 03
        cmp     r9d, r10d                               ; 073D _ 45: 39. D1
        jc      _ZN5Pawns5probeERK8Position.cold.6      ; 0740 _ 0F 82, 00000000(rel)
        sub     r9d, r10d                               ; 0746 _ 45: 29. D1
        mov     rbp, qword [rsp+40H]                    ; 0749 _ 48: 8B. 6C 24, 40
        lea     rdx, [rel _ZN12_GLOBAL__N_1L7DoubledE]  ; 074E _ 48: 8D. 15, 00000020(rel)
        mov     r15d, dword [rdx+rbp*4]                 ; 0755 _ 44: 8B. 3C AA
        lea     r8d, [r15+8000H]                        ; 0759 _ 45: 8D. 87, 00008000
        movsx   eax, r15w                               ; 0760 _ 41: 0F BF. C7
        cdq                                             ; 0764 _ 99
        idiv    r9d                                     ; 0765 _ 41: F7. F9
        mov     ebx, eax                                ; 0768 _ 89. C3
        mov     eax, r8d                                ; 076A _ 44: 89. C0
        sar     eax, 16                                 ; 076D _ C1. F8, 10
        cdq                                             ; 0770 _ 99
        idiv    r9d                                     ; 0771 _ 41: F7. F9
        shl     eax, 16                                 ; 0774 _ C1. E0, 10
        add     ebx, eax                                ; 0777 _ 01. C3
        sub     dword [rsp+34H], ebx                    ; 0779 _ 29. 5C 24, 34
        jmp     ?_025                                   ; 077D _ E9, FFFFFB60

?_043:  mov     r8d, dword [rsp]                        ; 0782 _ 44: 8B. 04 24
        lea     r14, [rel _ZN12_GLOBAL__N_1L5LeverE]    ; 0786 _ 4C: 8D. 35, 00000000(rel)
        mov     rbx, qword [rsp+38H]                    ; 078D _ 48: 8B. 5C 24, 38
        mov     r12d, dword [rsp+18H]                   ; 0792 _ 44: 8B. 64 24, 18
        add     r12d, dword [r14+r10*4]                 ; 0797 _ 47: 03. 24 96
        mov     dword [rbx+60H], r8d                    ; 079B _ 44: 89. 43, 60
        jmp     ?_028                                   ; 079F _ E9, FFFFFC36

?_044:  mov     r12d, dword [rsp+48H]                   ; 07A4 _ 44: 8B. 64 24, 48
        lea     r9, [rel _ZN12_GLOBAL__N_1L5LeverE]     ; 07A9 _ 4C: 8D. 0D, 00000000(rel)
        mov     rbp, qword [rsp+20H]                    ; 07B0 _ 48: 8B. 6C 24, 20
        mov     edx, dword [rsp+14H]                    ; 07B5 _ 8B. 54 24, 14
        mov     r11d, dword [rsp+34H]                   ; 07B9 _ 44: 8B. 5C 24, 34
        xor     r12d, 07H                               ; 07BE _ 41: 83. F4, 07
        add     r11d, dword [r9+r12*4]                  ; 07C2 _ 47: 03. 1C A1
        mov     dword [rbp+64H], edx                    ; 07C6 _ 89. 55, 64
        jmp     ?_019                                   ; 07C9 _ E9, FFFFF953

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_045:  mov     rsi, qword [rsp+48H]                    ; 07D0 _ 48: 8B. 74 24, 48
        bsr     r8, r8                                  ; 07D5 _ 4D: 0F BD. C0
        shr     r8, 3                                   ; 07D9 _ 49: C1. E8, 03
        cmp     esi, r8d                                ; 07DD _ 44: 39. C6
        jnc     Unnamed_4_E                             ; 07E0 _ 0F 83, 0000000E(rel)
        sub     r8d, esi                                ; 07E6 _ 41: 29. F0
        mov     rbx, qword [rsp+50H]                    ; 07E9 _ 48: 8B. 5C 24, 50
        lea     rdx, [rel _ZN12_GLOBAL__N_1L7DoubledE]  ; 07EE _ 48: 8D. 15, 00000020(rel)
        mov     r14d, dword [rdx+rbx*4]                 ; 07F5 _ 44: 8B. 34 9A
        lea     ebp, [r14+8000H]                        ; 07F9 _ 41: 8D. AE, 00008000
        movsx   eax, r14w                               ; 0800 _ 41: 0F BF. C6
        cdq                                             ; 0804 _ 99
        idiv    r8d                                     ; 0805 _ 41: F7. F8
        mov     r11d, eax                               ; 0808 _ 41: 89. C3
        mov     eax, ebp                                ; 080B _ 89. E8
        sar     eax, 16                                 ; 080D _ C1. F8, 10
        cdq                                             ; 0810 _ 99
        idiv    r8d                                     ; 0811 _ 41: F7. F8
        shl     eax, 16                                 ; 0814 _ C1. E0, 10
        add     r11d, eax                               ; 0817 _ 41: 01. C3
        sub     dword [rsp+18H], r11d                   ; 081A _ 44: 29. 5C 24, 18
        jmp     ?_034                                   ; 081F _ E9, FFFFFC7B

?_046:  mov     r14, qword [rel .refptr.SquareBB]       ; 0824 _ 4C: 8B. 35, 00000000(rel)
        mov     rbp, qword [rsp+38H]                    ; 082B _ 48: 8B. 6C 24, 38
        mov     r14, qword [r14+rax*8]                  ; 0830 _ 4D: 8B. 34 C6
        or      qword [rbp+10H], r14                    ; 0834 _ 4C: 09. 75, 10
        jmp     ?_031                                   ; 0838 _ E9, FFFFFBC7

?_047:  mov     r8, qword [rel .refptr.SquareBB]        ; 083D _ 4C: 8B. 05, 00000000(rel)
        mov     rbp, qword [rsp+20H]                    ; 0844 _ 48: 8B. 6C 24, 20
        mov     r12, qword [r8+rax*8]                   ; 0849 _ 4D: 8B. 24 C0
        or      qword [rbp+18H], r12                    ; 084D _ 4C: 09. 65, 18
        jmp     ?_022                                   ; 0851 _ E9, FFFFF9EA

?_048:  mov     r13, qword [rsp+20H]                    ; 0856 _ 4C: 8B. 6C 24, 20
        mov     dword [rsp+34H], r11d                   ; 085B _ 44: 89. 5C 24, 34
        mov     r14, qword [rsp+0B0H]                   ; 0860 _ 4C: 8B. B4 24, 000000B0
        mov     eax, dword [rsp+14H]                    ; 0868 _ 8B. 44 24, 14
        jmp     ?_026                                   ; 086C _ E9, FFFFFA98

?_049:  mov     r13, qword [rsp+38H]                    ; 0871 _ 4C: 8B. 6C 24, 38
        mov     r9d, r8d                                ; 0876 _ 45: 89. C1
        jmp     ?_040                                   ; 0879 _ E9, FFFFFE74

?_050:  mov     r14, qword [rsp+20H]                    ; 087E _ 4C: 8B. 74 24, 20
        lea     rbp, [rel _ZN12_GLOBAL__N_1L8BackwardE] ; 0883 _ 48: 8D. 2D, 00000148(rel)
        and     r14d, 01H                               ; 088A _ 41: 83. E6, 01
        mov     r12d, dword [rbp+r14*4]                 ; 088E _ 46: 8B. 64 B5, 00
        sub     dword [rsp+18H], r12d                   ; 0893 _ 44: 29. 64 24, 18
        jmp     ?_032                                   ; 0898 _ E9, FFFFFBB6

?_051:  mov     rbx, qword [rsp]                        ; 089D _ 48: 8B. 1C 24
        lea     r8, [rel _ZN12_GLOBAL__N_1L8BackwardE]  ; 08A1 _ 4C: 8D. 05, 00000148(rel)
        and     ebx, 01H                                ; 08A8 _ 83. E3, 01
        mov     r12d, dword [r8+rbx*4]                  ; 08AB _ 45: 8B. 24 98
        sub     dword [rsp+34H], r12d                   ; 08AF _ 44: 29. 64 24, 34
        jmp     ?_023                                   ; 08B4 _ E9, FFFFF9D4

?_052:  xor     r12d, r12d                              ; 08B9 _ 45: 31. E4
        jmp     ?_030                                   ; 08BC _ E9, FFFFFB33

?_053:  mov     r15d, esi                               ; 08C1 _ 41: 89. F7
        jmp     ?_021                                   ; 08C4 _ E9, FFFFF967

?_054:  ; Local function
        xor     edi, edi                                ; 08C9 _ 31. FF
        jmp     ?_027                                   ; 08CB _ E9, FFFFFA51


SECTION .xdata.hot align=4 noexecute                    ; section number 12, const

        db 01H, 10H, 09H, 00H, 10H, 0C2H, 0CH, 30H      ; 0000 _ .......0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .text$_ZN5Pawns5Entry14do_king_safetyIL5Color1EEE5ScoreRK8Position6Square align=16 execute ; section number 14, code
;  Communal section not supported by YASM

_ZN5Pawns5Entry14do_king_safetyIL5Color1EEE5ScoreRK8Position6Square:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 56                                 ; 000C _ 48: 83. EC, 38
        mov     rax, qword [rdx+3B8H]                   ; 0010 _ 48: 8B. 82, 000003B8
        mov     r12, qword [rdx+108H]                   ; 0017 _ 4C: 8B. A2, 00000108
        mov     rbp, qword [rdx+148H]                   ; 001E _ 48: 8B. AA, 00000148
        mov     edi, dword [rax+18H]                    ; 0025 _ 8B. 78, 18
        mov     qword [rcx+48H], r8                     ; 0028 _ 4C: 89. 41, 48
        mov     r10, r12                                ; 002C _ 4D: 89. E2
        mov     ebx, edi                                ; 002F _ 89. FB
        and     ebx, 0CH                                ; 0031 _ 83. E3, 0C
        and     r10, rbp                                ; 0034 _ 49: 21. EA
        mov     dword [rcx+5CH], ebx                    ; 0037 _ 89. 59, 5C
        je      ?_076                                   ; 003A _ 0F 84, 0000022C
        mov     rsi, r8                                 ; 0040 _ 4C: 89. C6
        xor     ebx, ebx                                ; 0043 _ 31. DB
        shl     rsi, 6                                  ; 0045 _ 48: C1. E6, 06
        add     rsi, qword [rel .refptr.DistanceRingBB] ; 0049 _ 48: 03. 35, 00000000(rel)
?_055:  mov     r9, r10                                 ; 0050 _ 4D: 89. D1
        and     r9, qword [rsi]                         ; 0053 _ 4C: 23. 0E
        add     ebx, 1                                  ; 0056 _ 83. C3, 01
        add     rsi, 8                                  ; 0059 _ 48: 83. C6, 08
        test    r9, r9                                  ; 005D _ 4D: 85. C9
        jz      ?_055                                   ; 0060 _ 74, EE
?_056:  mov     r11, r8                                 ; 0062 _ 4D: 89. C3
        shr     r11, 3                                  ; 0065 _ 49: C1. EB, 03
        xor     r11d, 07H                               ; 0069 _ 41: 83. F3, 07
        cmp     r11d, 3                                 ; 006D _ 41: 83. FB, 03
        ja      ?_071                                   ; 0071 _ 0F 87, 000001C3
        mov     rsi, rdx                                ; 0077 _ 48: 89. D6
        call    _ZN5Pawns5Entry13shelter_stormIL5Color1EEE5ValueRK8Position6Square; 007A _ E8, 00000000(rel)
        test    dil, 04H                                ; 007F _ 40: F6. C7, 04
        jnz     ?_060                                   ; 0083 _ 75, 2B
?_057:  and     edi, 08H                                ; 0085 _ 83. E7, 08
        jne     ?_080                                   ; 0088 _ 0F 85, 00000211
?_058:  shl     ebx, 4                                  ; 008E _ C1. E3, 04
        shl     eax, 16                                 ; 0091 _ C1. E0, 10
        sub     eax, ebx                                ; 0094 _ 29. D8
?_059:  add     rsp, 56                                 ; 0096 _ 48: 83. C4, 38
        pop     rbx                                     ; 009A _ 5B
        pop     rsi                                     ; 009B _ 5E
        pop     rdi                                     ; 009C _ 5F
        pop     rbp                                     ; 009D _ 5D
        pop     r12                                     ; 009E _ 41: 5C
        pop     r13                                     ; 00A0 _ 41: 5D
        pop     r14                                     ; 00A2 _ 41: 5E
        pop     r15                                     ; 00A4 _ 41: 5F
        ret                                             ; 00A6 _ C3

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_060:  mov     rdx, qword [rel .refptr.RankBB]         ; 00B0 _ 48: 8B. 15, 00000000(rel)
        mov     r8, qword [rel .refptr.InFrontBB]       ; 00B7 _ 4C: 8B. 05, 00000000(rel)
        mov     r11, qword [rel .refptr.FileBB]         ; 00BE _ 4C: 8B. 1D, 00000000(rel)
        mov     rcx, qword [rdx+38H]                    ; 00C5 _ 48: 8B. 4A, 38
        or      rcx, qword [r8+78H]                     ; 00C9 _ 49: 0B. 48, 78
        mov     r14, qword [r11+28H]                    ; 00CD _ 4D: 8B. 73, 28
        and     rcx, r12                                ; 00D1 _ 4C: 21. E1
        mov     rdx, rcx                                ; 00D4 _ 48: 89. CA
        and     rcx, qword [rsi+140H]                   ; 00D7 _ 48: 23. 8E, 00000140
        and     rdx, rbp                                ; 00DE _ 48: 21. EA
        mov     r13, rdx                                ; 00E1 _ 49: 89. D5
        and     r13, r14                                ; 00E4 _ 4D: 21. F5
        je      ?_070                                   ; 00E7 _ 0F 84, 00000142
        bsr     r10, r13                                ; 00ED _ 4D: 0F BD. D5
        shr     r10, 3                                  ; 00F1 _ 49: C1. EA, 03
        xor     r10d, 07H                               ; 00F5 _ 41: 83. F2, 07
        mov     r13d, r10d                              ; 00F9 _ 45: 89. D5
?_061:  and     r14, rcx                                ; 00FC _ 49: 21. CE
        je      ?_075                                   ; 00FF _ 0F 84, 0000015C
        bsr     r9, r14                                 ; 0105 _ 4D: 0F BD. CE
        shr     r9, 3                                   ; 0109 _ 49: C1. E9, 03
        xor     r9d, 07H                                ; 010D _ 41: 83. F1, 07
        mov     r15d, r9d                               ; 0111 _ 45: 89. CF
?_062:  lea     r14, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 0114 _ 4C: 8D. 35, 00000040(rel)
        test    r10d, r10d                              ; 011B _ 45: 85. D2
        jz      ?_063                                   ; 011E _ 74, 19
        lea     r8, [rel ?_202]                         ; 0120 _ 4C: 8D. 05, 00000140(rel)
        add     r10d, 1                                 ; 0127 _ 41: 83. C2, 01
        lea     r14, [rel ?_201]                        ; 012B _ 4C: 8D. 35, 000000C0(rel)
        cmp     r9d, r10d                               ; 0132 _ 45: 39. D1
        cmove   r14, r8                                 ; 0135 _ 4D: 0F 44. F0
?_063:  mov     r8, qword [r11+30H]                     ; 0139 _ 4D: 8B. 43, 30
        lea     r10, [rel _ZN12_GLOBAL__N_1L15ShelterWeaknessE]; 013D _ 4C: 8D. 15, 00000240(rel)
        mov     r13d, dword [r10+r13*4+40H]             ; 0144 _ 47: 8B. 6C AA, 40
        add     r13d, dword [r14+r15*4+40H]             ; 0149 _ 47: 03. 6C BE, 40
        mov     r15d, 258                               ; 014E _ 41: BF, 00000102
        mov     r9, r8                                  ; 0154 _ 4D: 89. C1
        sub     r15d, r13d                              ; 0157 _ 45: 29. EF
        and     r9, rdx                                 ; 015A _ 49: 21. D1
        mov     dword [rsp+2CH], r15d                   ; 015D _ 44: 89. 7C 24, 2C
        je      ?_073                                   ; 0162 _ 0F 84, 000000E1
        bsr     r9, r9                                  ; 0168 _ 4D: 0F BD. C9
        shr     r9, 3                                   ; 016C _ 49: C1. E9, 03
        xor     r9d, 07H                                ; 0170 _ 41: 83. F1, 07
        and     r8, rcx                                 ; 0174 _ 49: 21. C8
        mov     r15d, r9d                               ; 0177 _ 45: 89. CF
        je      ?_077                                   ; 017A _ 0F 84, 000000F3
?_064:  bsr     r8, r8                                  ; 0180 _ 4D: 0F BD. C0
        shr     r8, 3                                   ; 0184 _ 49: C1. E8, 03
        xor     r8d, 07H                                ; 0188 _ 41: 83. F0, 07
        cmp     r8d, 1                                  ; 018C _ 41: 83. F8, 01
        mov     r14d, r8d                               ; 0190 _ 45: 89. C6
        je      ?_079                                   ; 0193 _ 0F 84, 000000F4
?_065:  lea     r13, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 0199 _ 4C: 8D. 2D, 00000040(rel)
        test    r9d, r9d                                ; 01A0 _ 45: 85. C9
        jz      ?_066                                   ; 01A3 _ 74, 19
        lea     r13, [rel ?_201]                        ; 01A5 _ 4C: 8D. 2D, 000000C0(rel)
        add     r9d, 1                                  ; 01AC _ 41: 83. C1, 01
        cmp     r8d, r9d                                ; 01B0 _ 45: 39. C8
        lea     r9, [rel ?_202]                         ; 01B3 _ 4C: 8D. 0D, 00000140(rel)
        cmove   r13, r9                                 ; 01BA _ 4D: 0F 44. E9
?_066:  mov     r8d, dword [rsp+2CH]                    ; 01BE _ 44: 8B. 44 24, 2C
        sub     r8d, dword [r13+r14*4+20H]              ; 01C3 _ 47: 2B. 44 B5, 20
        sub     r8d, dword [r10+r15*4+20H]              ; 01C8 _ 47: 2B. 44 BA, 20
        mov     r15, qword [r11+38H]                    ; 01CD _ 4D: 8B. 7B, 38
        and     rdx, r15                                ; 01D1 _ 4C: 21. FA
        jz      ?_072                                   ; 01D4 _ 74, 6C
        bsr     rdx, rdx                                ; 01D6 _ 48: 0F BD. D2
        shr     rdx, 3                                  ; 01DA _ 48: C1. EA, 03
        xor     edx, 07H                                ; 01DE _ 83. F2, 07
        mov     r11d, edx                               ; 01E1 _ 41: 89. D3
?_067:  and     rcx, r15                                ; 01E4 _ 4C: 21. F9
        jz      ?_074                                   ; 01E7 _ 74, 70
        bsr     r13, rcx                                ; 01E9 _ 4C: 0F BD. E9
        shr     r13, 3                                  ; 01ED _ 49: C1. ED, 03
        xor     r13d, 07H                               ; 01F1 _ 41: 83. F5, 07
        mov     r14d, r13d                              ; 01F5 _ 45: 89. EE
?_068:  lea     rcx, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 01F8 _ 48: 8D. 0D, 00000040(rel)
        test    edx, edx                                ; 01FF _ 85. D2
        jz      ?_069                                   ; 0201 _ 74, 18
        lea     rcx, [rel ?_202]                        ; 0203 _ 48: 8D. 0D, 00000140(rel)
        add     edx, 1                                  ; 020A _ 83. C2, 01
        lea     r9, [rel ?_201]                         ; 020D _ 4C: 8D. 0D, 000000C0(rel)
        cmp     r13d, edx                               ; 0214 _ 41: 39. D5
        cmovne  rcx, r9                                 ; 0217 _ 49: 0F 45. C9
?_069:  sub     r8d, dword [rcx+r14*4]                  ; 021B _ 46: 2B. 04 B1
        sub     r8d, dword [r10+r11*4]                  ; 021F _ 47: 2B. 04 9A
        cmp     eax, r8d                                ; 0223 _ 44: 39. C0
        cmovl   eax, r8d                                ; 0226 _ 41: 0F 4C. C0
        jmp     ?_057                                   ; 022A _ E9, FFFFFE56

?_070:  xor     r13d, r13d                              ; 022F _ 45: 31. ED
        xor     r10d, r10d                              ; 0232 _ 45: 31. D2
        jmp     ?_061                                   ; 0235 _ E9, FFFFFEC2

?_071:  imul    eax, ebx, -16                           ; 023A _ 6B. C3, F0
        jmp     ?_059                                   ; 023D _ E9, FFFFFE54

?_072:  xor     r11d, r11d                              ; 0242 _ 45: 31. DB
        xor     edx, edx                                ; 0245 _ 31. D2
        jmp     ?_067                                   ; 0247 _ EB, 9B

?_073:  xor     r15d, r15d                              ; 0249 _ 45: 31. FF
        and     r8, rcx                                 ; 024C _ 49: 21. C8
        jz      ?_078                                   ; 024F _ 74, 2D
        xor     r9d, r9d                                ; 0251 _ 45: 31. C9
        jmp     ?_064                                   ; 0254 _ E9, FFFFFF27

?_074:  xor     r14d, r14d                              ; 0259 _ 45: 31. F6
        xor     r13d, r13d                              ; 025C _ 45: 31. ED
        jmp     ?_068                                   ; 025F _ EB, 97

?_075:  xor     r15d, r15d                              ; 0261 _ 45: 31. FF
        xor     r9d, r9d                                ; 0264 _ 45: 31. C9
        jmp     ?_062                                   ; 0267 _ E9, FFFFFEA8

?_076:  xor     ebx, ebx                                ; 026C _ 31. DB
        jmp     ?_056                                   ; 026E _ E9, FFFFFDEF

?_077:  xor     r14d, r14d                              ; 0273 _ 45: 31. F6
        xor     r8d, r8d                                ; 0276 _ 45: 31. C0
        jmp     ?_065                                   ; 0279 _ E9, FFFFFF1B

?_078:  lea     r13, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 027E _ 4C: 8D. 2D, 00000040(rel)
        xor     r14d, r14d                              ; 0285 _ 45: 31. F6
        jmp     ?_066                                   ; 0288 _ E9, FFFFFF31

?_079:  lea     r13, [rel ?_203]                        ; 028D _ 4C: 8D. 2D, 000001C0(rel)
        mov     r14d, 1                                 ; 0294 _ 41: BE, 00000001
        jmp     ?_066                                   ; 029A _ E9, FFFFFF1F
; _ZN5Pawns5Entry14do_king_safetyIL5Color1EEE5ScoreRK8Position6Square End of function

?_080:  ; Local function
        mov     r10, qword [rel .refptr.RankBB]         ; 029F _ 4C: 8B. 15, 00000000(rel)
        mov     r11, qword [rel .refptr.InFrontBB]      ; 02A6 _ 4C: 8B. 1D, 00000000(rel)
        mov     r14, qword [rel .refptr.FileBB]         ; 02AD _ 4C: 8B. 35, 00000000(rel)
        mov     r15, qword [r10+38H]                    ; 02B4 _ 4D: 8B. 7A, 38
        or      r15, qword [r11+78H]                    ; 02B8 _ 4D: 0B. 7B, 78
        mov     rdx, qword [r14+8H]                     ; 02BC _ 49: 8B. 56, 08
        and     r15, r12                                ; 02C0 _ 4D: 21. E7
        and     rbp, r15                                ; 02C3 _ 4C: 21. FD
        and     r15, qword [rsi+140H]                   ; 02C6 _ 4C: 23. BE, 00000140
        mov     r13, rbp                                ; 02CD _ 49: 89. ED
        and     r13, rdx                                ; 02D0 _ 49: 21. D5
        je      ?_096                                   ; 02D3 _ 0F 84, 0000017B
        bsr     r12, r13                                ; 02D9 _ 4D: 0F BD. E5
        shr     r12, 3                                  ; 02DD _ 49: C1. EC, 03
        xor     r12d, 07H                               ; 02E1 _ 41: 83. F4, 07
        mov     edi, r12d                               ; 02E5 _ 44: 89. E7
?_081:  and     rdx, r15                                ; 02E8 _ 4C: 21. FA
        je      ?_095                                   ; 02EB _ 0F 84, 0000015A
        bsr     rcx, rdx                                ; 02F1 _ 48: 0F BD. CA
        shr     rcx, 3                                  ; 02F5 _ 48: C1. E9, 03
        xor     ecx, 07H                                ; 02F9 _ 83. F1, 07
        mov     esi, ecx                                ; 02FC _ 89. CE
?_082:  lea     r8, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 02FE _ 4C: 8D. 05, 00000040(rel)
        test    r12d, r12d                              ; 0305 _ 45: 85. E4
        jz      ?_083                                   ; 0308 _ 74, 19
        lea     r8, [rel ?_202]                         ; 030A _ 4C: 8D. 05, 00000140(rel)
        add     r12d, 1                                 ; 0311 _ 41: 83. C4, 01
        lea     r9, [rel ?_201]                         ; 0315 _ 4C: 8D. 0D, 000000C0(rel)
        cmp     ecx, r12d                               ; 031C _ 44: 39. E1
        cmovne  r8, r9                                  ; 031F _ 4D: 0F 45. C1
?_083:  mov     rdx, qword [r14+10H]                    ; 0323 _ 49: 8B. 56, 10
        lea     r9, [rel _ZN12_GLOBAL__N_1L15ShelterWeaknessE]; 0327 _ 4C: 8D. 0D, 00000240(rel)
        mov     r10d, dword [r9+rdi*4+20H]              ; 032E _ 45: 8B. 54 B9, 20
        add     r10d, dword [r8+rsi*4+20H]              ; 0333 _ 45: 03. 54 B0, 20
        mov     esi, 258                                ; 0338 _ BE, 00000102
        mov     r11, rdx                                ; 033D _ 49: 89. D3
        sub     esi, r10d                               ; 0340 _ 44: 29. D6
        and     r11, rbp                                ; 0343 _ 49: 21. EB
        je      ?_094                                   ; 0346 _ 0F 84, 000000F0
        bsr     rcx, r11                                ; 034C _ 49: 0F BD. CB
        shr     rcx, 3                                  ; 0350 _ 48: C1. E9, 03
        xor     ecx, 07H                                ; 0354 _ 83. F1, 07
        and     rdx, r15                                ; 0357 _ 4C: 21. FA
        mov     r13d, ecx                               ; 035A _ 41: 89. CD
        je      ?_093                                   ; 035D _ 0F 84, 000000CF
?_084:  bsr     r8, rdx                                 ; 0363 _ 4C: 0F BD. C2
        shr     r8, 3                                   ; 0367 _ 49: C1. E8, 03
        xor     r8d, 07H                                ; 036B _ 41: 83. F0, 07
        cmp     r8d, 1                                  ; 036F _ 41: 83. F8, 01
        mov     edi, r8d                                ; 0373 _ 44: 89. C7
        je      ?_092                                   ; 0376 _ 0F 84, 000000A5
?_085:  lea     r12, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 037C _ 4C: 8D. 25, 00000040(rel)
        test    ecx, ecx                                ; 0383 _ 85. C9
        jz      ?_086                                   ; 0385 _ 74, 18
        lea     r12, [rel ?_202]                        ; 0387 _ 4C: 8D. 25, 00000140(rel)
        add     ecx, 1                                  ; 038E _ 83. C1, 01
        lea     r10, [rel ?_201]                        ; 0391 _ 4C: 8D. 15, 000000C0(rel)
        cmp     r8d, ecx                                ; 0398 _ 41: 39. C8
        cmovne  r12, r10                                ; 039B _ 4D: 0F 45. E2
?_086:  sub     esi, dword [r12+rdi*4+40H]              ; 039F _ 41: 2B. 74 BC, 40
        mov     r14, qword [r14+18H]                    ; 03A4 _ 4D: 8B. 76, 18
        mov     edi, esi                                ; 03A8 _ 89. F7
        sub     edi, dword [r9+r13*4+40H]               ; 03AA _ 43: 2B. 7C A9, 40
        and     rbp, r14                                ; 03AF _ 4C: 21. F5
        jz      ?_091                                   ; 03B2 _ 74, 66
        bsr     r11, rbp                                ; 03B4 _ 4C: 0F BD. DD
        shr     r11, 3                                  ; 03B8 _ 49: C1. EB, 03
        xor     r11d, 07H                               ; 03BC _ 41: 83. F3, 07
        mov     ebp, r11d                               ; 03C0 _ 44: 89. DD
?_087:  and     r14, r15                                ; 03C3 _ 4D: 21. FE
        jz      ?_090                                   ; 03C6 _ 74, 4A
        bsr     r13, r14                                ; 03C8 _ 4D: 0F BD. EE
        shr     r13, 3                                  ; 03CC _ 49: C1. ED, 03
        xor     r13d, 07H                               ; 03D0 _ 41: 83. F5, 07
        mov     r15d, r13d                              ; 03D4 _ 45: 89. EF
?_088:  lea     r12, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 03D7 _ 4C: 8D. 25, 00000040(rel)
        test    r11d, r11d                              ; 03DE _ 45: 85. DB
        jz      ?_089                                   ; 03E1 _ 74, 19
        lea     r12, [rel ?_202]                        ; 03E3 _ 4C: 8D. 25, 00000140(rel)
        add     r11d, 1                                 ; 03EA _ 41: 83. C3, 01
        lea     rdx, [rel ?_201]                        ; 03EE _ 48: 8D. 15, 000000C0(rel)
        cmp     r13d, r11d                              ; 03F5 _ 45: 39. DD
        cmovne  r12, rdx                                ; 03F8 _ 4C: 0F 45. E2
?_089:  mov     esi, edi                                ; 03FC _ 89. FE
        sub     esi, dword [r12+r15*4+60H]              ; 03FE _ 43: 2B. 74 BC, 60
        sub     esi, dword [r9+rbp*4+60H]               ; 0403 _ 41: 2B. 74 A9, 60
        cmp     eax, esi                                ; 0408 _ 39. F0
        cmovl   eax, esi                                ; 040A _ 0F 4C. C6
        jmp     ?_058                                   ; 040D _ E9, FFFFFC7C

?_090:  xor     r15d, r15d                              ; 0412 _ 45: 31. FF
        xor     r13d, r13d                              ; 0415 _ 45: 31. ED
        jmp     ?_088                                   ; 0418 _ EB, BD

?_091:  xor     ebp, ebp                                ; 041A _ 31. ED
        xor     r11d, r11d                              ; 041C _ 45: 31. DB
        jmp     ?_087                                   ; 041F _ EB, A2

?_092:  lea     r12, [rel ?_203]                        ; 0421 _ 4C: 8D. 25, 000001C0(rel)
        mov     edi, 1                                  ; 0428 _ BF, 00000001
        jmp     ?_086                                   ; 042D _ E9, FFFFFF6D

?_093:  xor     edi, edi                                ; 0432 _ 31. FF
        xor     r8d, r8d                                ; 0434 _ 45: 31. C0
        jmp     ?_085                                   ; 0437 _ E9, FFFFFF40

?_094:  and     rdx, r15                                ; 043C _ 4C: 21. FA
        jz      ?_097                                   ; 043F _ 74, 1D
        xor     ecx, ecx                                ; 0441 _ 31. C9
        xor     r13d, r13d                              ; 0443 _ 45: 31. ED
        jmp     ?_084                                   ; 0446 _ E9, FFFFFF18

?_095:  xor     esi, esi                                ; 044B _ 31. F6
        xor     ecx, ecx                                ; 044D _ 31. C9
        jmp     ?_082                                   ; 044F _ E9, FFFFFEAA

?_096:  xor     edi, edi                                ; 0454 _ 31. FF
        xor     r12d, r12d                              ; 0456 _ 45: 31. E4
        jmp     ?_081                                   ; 0459 _ E9, FFFFFE8A

?_097:  ; Local function
        lea     r12, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 045E _ 4C: 8D. 25, 00000040(rel)
        xor     r13d, r13d                              ; 0465 _ 45: 31. ED
        xor     edi, edi                                ; 0468 _ 31. FF
        jmp     ?_086                                   ; 046A _ E9, FFFFFF30

        nop                                             ; 046F _ 90


SECTION .xdata$_ZN5Pawns5Entry14do_king_safetyIL5Color1EEE5ScoreRK8Position6Square align=4 noexecute ; section number 15, const
;  Communal section not supported by YASM

        db 01H, 10H, 09H, 00H, 10H, 62H, 0CH, 30H       ; 0000 _ .....b.0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .text$_ZN5Pawns5Entry13shelter_stormIL5Color1EEE5ValueRK8Position6Square align=16 execute ; section number 17, code
;  Communal section not supported by YASM

_ZN5Pawns5Entry13shelter_stormIL5Color1EEE5ValueRK8Position6Square:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 40                                 ; 000C _ 48: 83. EC, 28
        mov     rcx, qword [rel .refptr.RankBB]         ; 0010 _ 48: 8B. 0D, 00000000(rel)
        mov     r10, qword [rel .refptr.InFrontBB]      ; 0017 _ 4C: 8B. 15, 00000000(rel)
        mov     rax, r8                                 ; 001E _ 4C: 89. C0
        and     r8d, 07H                                ; 0021 _ 41: 83. E0, 07
        mov     dword [rsp+14H], 6                      ; 0025 _ C7. 44 24, 14, 00000006
        shr     rax, 3                                  ; 002D _ 48: C1. E8, 03
        mov     dword [rsp+18H], r8d                    ; 0031 _ 44: 89. 44 24, 18
        mov     ebx, eax                                ; 0036 _ 89. C3
        mov     r9d, eax                                ; 0038 _ 41: 89. C1
        mov     rcx, qword [rcx+rbx*8]                  ; 003B _ 48: 8B. 0C D9
        or      rcx, qword [r10+rbx*8+40H]              ; 003F _ 49: 0B. 4C DA, 40
        and     rcx, qword [rdx+108H]                   ; 0044 _ 48: 23. 8A, 00000108
        mov     r11, rcx                                ; 004B _ 49: 89. CB
        and     rcx, qword [rdx+140H]                   ; 004E _ 48: 23. 8A, 00000140
        and     r11, qword [rdx+148H]                   ; 0055 _ 4C: 23. 9A, 00000148
        cmp     r8d, 5                                  ; 005C _ 41: 83. F8, 05
        ja      ?_116                                   ; 0060 _ 0F 87, 000002CE
        cmp     r8d, 1                                  ; 0066 _ 41: 83. F8, 01
        mov     dword [rsp+1CH], 1                      ; 006A _ C7. 44 24, 1C, 00000001
        jbe     ?_126                                   ; 0072 _ 0F 86, 00000370
        lea     edx, [r8-1H]                            ; 0078 _ 41: 8D. 50, FF
        mov     eax, 258                                ; 007C _ B8, 00000102
        lea     esi, [r8+1H]                            ; 0081 _ 41: 8D. 70, 01
        cmp     edx, esi                                ; 0085 _ 39. F2
        ja      ?_112                                   ; 0087 _ 0F 87, 00000263
?_098:  mov     r12, qword [rel .refptr.FileBB]         ; 008D _ 4C: 8B. 25, 00000000(rel)
        mov     r14d, edx                               ; 0094 _ 41: 89. D6
        mov     ebx, esi                                ; 0097 _ 89. F3
        xor     r9d, 07H                                ; 0099 _ 41: 83. F1, 07
        lea     ebp, [r9+1H]                            ; 009D _ 41: 8D. 69, 01
        sub     ebx, edx                                ; 00A1 _ 29. D3
        mov     dword [rsp+0CH], ebp                    ; 00A3 _ 89. 6C 24, 0C
        and     ebx, 01H                                ; 00A7 _ 83. E3, 01
        mov     ebp, 7                                  ; 00AA _ BD, 00000007
        lea     rdi, [rel _ZN12_GLOBAL__N_1L15ShelterWeaknessE]; 00AF _ 48: 8D. 3D, 00000240(rel)
        mov     rax, qword [r12+r14*8]                  ; 00B6 _ 4B: 8B. 04 F4
        lea     r13, [rel ?_202]                        ; 00BA _ 4C: 8D. 2D, 00000140(rel)
        mov     r15, rax                                ; 00C1 _ 49: 89. C7
        and     r15, r11                                ; 00C4 _ 4D: 21. DF
        je      ?_113                                   ; 00C7 _ 0F 84, 00000234
        bsr     r9, r15                                 ; 00CD _ 4D: 0F BD. CF
        shr     r9, 3                                   ; 00D1 _ 49: C1. E9, 03
        xor     r9d, 07H                                ; 00D5 _ 41: 83. F1, 07
        and     rax, rcx                                ; 00D9 _ 48: 21. C8
        mov     r15d, r9d                               ; 00DC _ 45: 89. CF
        je      ?_114                                   ; 00DF _ 0F 84, 0000022B
?_099:  bsr     rax, rax                                ; 00E5 _ 48: 0F BD. C0
        shr     rax, 3                                  ; 00E9 _ 48: C1. E8, 03
        xor     eax, 07H                                ; 00ED _ 83. F0, 07
        cmp     edx, r8d                                ; 00F0 _ 44: 39. C2
        mov     r10d, eax                               ; 00F3 _ 41: 89. C2
        je      ?_115                                   ; 00F6 _ 0F 84, 00000222
?_100:  lea     r14, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 00FC _ 4C: 8D. 35, 00000040(rel)
        test    r9d, r9d                                ; 0103 _ 45: 85. C9
        jz      ?_101                                   ; 0106 _ 74, 12
        lea     r14, [rel ?_201]                        ; 0108 _ 4C: 8D. 35, 000000C0(rel)
        add     r9d, 1                                  ; 010F _ 41: 83. C1, 01
        cmp     eax, r9d                                ; 0113 _ 44: 39. C8
        cmove   r14, r13                                ; 0116 _ 4D: 0F 44. F5
?_101:  mov     r9d, ebp                                ; 011A _ 41: 89. E9
        mov     eax, 258                                ; 011D _ B8, 00000102
        sub     r9d, edx                                ; 0122 _ 41: 29. D1
        cmp     edx, r9d                                ; 0125 _ 44: 39. CA
        cmovbe  r9, rdx                                 ; 0128 _ 4C: 0F 46. CA
        add     edx, 1                                  ; 012C _ 83. C2, 01
        shl     r9, 3                                   ; 012F _ 49: C1. E1, 03
        add     r10, r9                                 ; 0133 _ 4D: 01. CA
        add     r15, r9                                 ; 0136 _ 4D: 01. CF
        sub     eax, dword [r14+r10*4]                  ; 0139 _ 43: 2B. 04 96
        sub     eax, dword [rdi+r15*4]                  ; 013D _ 42: 2B. 04 BF
        cmp     edx, esi                                ; 0141 _ 39. F2
        ja      ?_112                                   ; 0143 _ 0F 87, 000001A7
        test    ebx, ebx                                ; 0149 _ 85. DB
        je      ?_105                                   ; 014B _ 0F 84, 0000008A
        mov     ebx, edx                                ; 0151 _ 89. D3
        mov     r14, qword [r12+rbx*8]                  ; 0153 _ 4D: 8B. 34 DC
        mov     r15, r14                                ; 0157 _ 4D: 89. F7
        and     r15, r11                                ; 015A _ 4D: 21. DF
        je      ?_123                                   ; 015D _ 0F 84, 00000251
        bsr     r10, r15                                ; 0163 _ 4D: 0F BD. D7
        shr     r10, 3                                  ; 0167 _ 49: C1. EA, 03
        xor     r10d, 07H                               ; 016B _ 41: 83. F2, 07
        and     r14, rcx                                ; 016F _ 49: 21. CE
        mov     r15d, r10d                              ; 0172 _ 45: 89. D7
        je      ?_124                                   ; 0175 _ 0F 84, 00000248
?_102:  bsr     r9, r14                                 ; 017B _ 4D: 0F BD. CE
        shr     r9, 3                                   ; 017F _ 49: C1. E9, 03
        xor     r9d, 07H                                ; 0183 _ 41: 83. F1, 07
        cmp     edx, r8d                                ; 0187 _ 44: 39. C2
        mov     ebx, r9d                                ; 018A _ 44: 89. CB
        je      ?_125                                   ; 018D _ 0F 84, 0000023E
?_103:  lea     r14, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 0193 _ 4C: 8D. 35, 00000040(rel)
        test    r10d, r10d                              ; 019A _ 45: 85. D2
        jz      ?_104                                   ; 019D _ 74, 12
        lea     r14, [rel ?_201]                        ; 019F _ 4C: 8D. 35, 000000C0(rel)
        add     r10d, 1                                 ; 01A6 _ 41: 83. C2, 01
        cmp     r9d, r10d                               ; 01AA _ 45: 39. D1
        cmove   r14, r13                                ; 01AD _ 4D: 0F 44. F5
?_104:  mov     r10d, ebp                               ; 01B1 _ 41: 89. EA
        sub     r10d, edx                               ; 01B4 _ 41: 29. D2
        cmp     edx, r10d                               ; 01B7 _ 44: 39. D2
        cmovbe  r10, rdx                                ; 01BA _ 4C: 0F 46. D2
        add     edx, 1                                  ; 01BE _ 83. C2, 01
        shl     r10, 3                                  ; 01C1 _ 49: C1. E2, 03
        add     rbx, r10                                ; 01C5 _ 4C: 01. D3
        add     r15, r10                                ; 01C8 _ 4D: 01. D7
        sub     eax, dword [r14+rbx*4]                  ; 01CB _ 41: 2B. 04 9E
        sub     eax, dword [rdi+r15*4]                  ; 01CF _ 42: 2B. 04 BF
        cmp     edx, esi                                ; 01D3 _ 39. F2
        ja      ?_112                                   ; 01D5 _ 0F 87, 00000115
?_105:  mov     r15d, edx                               ; 01DB _ 41: 89. D7
        mov     r9, qword [r12+r15*8]                   ; 01DE _ 4F: 8B. 0C FC
        mov     rbx, r9                                 ; 01E2 _ 4C: 89. CB
        and     rbx, r11                                ; 01E5 _ 4C: 21. DB
        je      ?_120                                   ; 01E8 _ 0F 84, 00000192
        bsr     r10, rbx                                ; 01EE _ 4C: 0F BD. D3
        shr     r10, 3                                  ; 01F2 _ 49: C1. EA, 03
        xor     r10d, 07H                               ; 01F6 _ 41: 83. F2, 07
        and     r9, rcx                                 ; 01FA _ 49: 21. C9
        mov     r15d, r10d                              ; 01FD _ 45: 89. D7
        je      ?_121                                   ; 0200 _ 0F 84, 00000189
?_106:  bsr     r9, r9                                  ; 0206 _ 4D: 0F BD. C9
        shr     r9, 3                                   ; 020A _ 49: C1. E9, 03
        xor     r9d, 07H                                ; 020E _ 41: 83. F1, 07
        cmp     edx, r8d                                ; 0212 _ 44: 39. C2
        mov     ebx, r9d                                ; 0215 _ 44: 89. CB
        je      ?_122                                   ; 0218 _ 0F 84, 0000017F
?_107:  lea     r14, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 021E _ 4C: 8D. 35, 00000040(rel)
        test    r10d, r10d                              ; 0225 _ 45: 85. D2
        jz      ?_108                                   ; 0228 _ 74, 12
        lea     r14, [rel ?_201]                        ; 022A _ 4C: 8D. 35, 000000C0(rel)
        add     r10d, 1                                 ; 0231 _ 41: 83. C2, 01
        cmp     r9d, r10d                               ; 0235 _ 45: 39. D1
        cmove   r14, r13                                ; 0238 _ 4D: 0F 44. F5
?_108:  mov     r10d, ebp                               ; 023C _ 41: 89. EA
        sub     r10d, edx                               ; 023F _ 41: 29. D2
        cmp     edx, r10d                               ; 0242 _ 44: 39. D2
        cmovbe  r10d, edx                               ; 0245 _ 44: 0F 46. D2
        mov     r9d, r10d                               ; 0249 _ 45: 89. D1
        shl     r9, 3                                   ; 024C _ 49: C1. E1, 03
        add     rbx, r9                                 ; 0250 _ 4C: 01. CB
        add     r9, r15                                 ; 0253 _ 4D: 01. F9
        lea     r15d, [rdx+1H]                          ; 0256 _ 44: 8D. 7A, 01
        sub     eax, dword [r14+rbx*4]                  ; 025A _ 41: 2B. 04 9E
        mov     rbx, qword [r12+r15*8]                  ; 025E _ 4B: 8B. 1C FC
        mov     rdx, r15                                ; 0262 _ 4C: 89. FA
        sub     eax, dword [rdi+r9*4]                   ; 0265 _ 42: 2B. 04 8F
        mov     r14, rbx                                ; 0269 _ 49: 89. DE
        and     r14, r11                                ; 026C _ 4D: 21. DE
        je      ?_117                                   ; 026F _ 0F 84, 000000CE
        bsr     r10, r14                                ; 0275 _ 4D: 0F BD. D6
        shr     r10, 3                                  ; 0279 _ 49: C1. EA, 03
        xor     r10d, 07H                               ; 027D _ 41: 83. F2, 07
        and     rbx, rcx                                ; 0281 _ 48: 21. CB
        mov     r15d, r10d                              ; 0284 _ 45: 89. D7
        je      ?_118                                   ; 0287 _ 0F 84, 000000C5
?_109:  bsr     r9, rbx                                 ; 028D _ 4C: 0F BD. CB
        shr     r9, 3                                   ; 0291 _ 49: C1. E9, 03
        xor     r9d, 07H                                ; 0295 _ 41: 83. F1, 07
        cmp     edx, r8d                                ; 0299 _ 44: 39. C2
        mov     ebx, r9d                                ; 029C _ 44: 89. CB
        je      ?_119                                   ; 029F _ 0F 84, 000000BB
?_110:  lea     r14, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 02A5 _ 4C: 8D. 35, 00000040(rel)
        test    r10d, r10d                              ; 02AC _ 45: 85. D2
        jz      ?_111                                   ; 02AF _ 74, 12
        lea     r14, [rel ?_201]                        ; 02B1 _ 4C: 8D. 35, 000000C0(rel)
        add     r10d, 1                                 ; 02B8 _ 41: 83. C2, 01
        cmp     r9d, r10d                               ; 02BC _ 45: 39. D1
        cmove   r14, r13                                ; 02BF _ 4D: 0F 44. F5
?_111:  mov     r10d, ebp                               ; 02C3 _ 41: 89. EA
        sub     r10d, edx                               ; 02C6 _ 41: 29. D2
        cmp     edx, r10d                               ; 02C9 _ 44: 39. D2
        cmovbe  r10d, edx                               ; 02CC _ 44: 0F 46. D2
        add     edx, 1                                  ; 02D0 _ 83. C2, 01
        mov     r9d, r10d                               ; 02D3 _ 45: 89. D1
        shl     r9, 3                                   ; 02D6 _ 49: C1. E1, 03
        add     rbx, r9                                 ; 02DA _ 4C: 01. CB
        add     r9, r15                                 ; 02DD _ 4D: 01. F9
        sub     eax, dword [r14+rbx*4]                  ; 02E0 _ 41: 2B. 04 9E
        sub     eax, dword [rdi+r9*4]                   ; 02E4 _ 42: 2B. 04 8F
        cmp     edx, esi                                ; 02E8 _ 39. F2
        jbe     ?_105                                   ; 02EA _ 0F 86, FFFFFEEB
?_112:  add     rsp, 40                                 ; 02F0 _ 48: 83. C4, 28
        pop     rbx                                     ; 02F4 _ 5B
        pop     rsi                                     ; 02F5 _ 5E
        pop     rdi                                     ; 02F6 _ 5F
        pop     rbp                                     ; 02F7 _ 5D
        pop     r12                                     ; 02F8 _ 41: 5C
        pop     r13                                     ; 02FA _ 41: 5D
        pop     r14                                     ; 02FC _ 41: 5E
        pop     r15                                     ; 02FE _ 41: 5F
        ret                                             ; 0300 _ C3

?_113:  xor     r15d, r15d                              ; 0301 _ 45: 31. FF
        xor     r9d, r9d                                ; 0304 _ 45: 31. C9
        and     rax, rcx                                ; 0307 _ 48: 21. C8
        jne     ?_099                                   ; 030A _ 0F 85, FFFFFDD5
?_114:  xor     r10d, r10d                              ; 0310 _ 45: 31. D2
        xor     eax, eax                                ; 0313 _ 31. C0
        cmp     edx, r8d                                ; 0315 _ 44: 39. C2
        jne     ?_100                                   ; 0318 _ 0F 85, FFFFFDDE
?_115:  cmp     eax, dword [rsp+0CH]                    ; 031E _ 3B. 44 24, 0C
        jne     ?_100                                   ; 0322 _ 0F 85, FFFFFDD4
        lea     r14, [rel ?_203]                        ; 0328 _ 4C: 8D. 35, 000001C0(rel)
        jmp     ?_101                                   ; 032F _ E9, FFFFFDE6

?_116:  mov     edx, 5                                  ; 0334 _ BA, 00000005
        mov     esi, 7                                  ; 0339 _ BE, 00000007
        jmp     ?_098                                   ; 033E _ E9, FFFFFD4A

?_117:  xor     r15d, r15d                              ; 0343 _ 45: 31. FF
        xor     r10d, r10d                              ; 0346 _ 45: 31. D2
        and     rbx, rcx                                ; 0349 _ 48: 21. CB
        jne     ?_109                                   ; 034C _ 0F 85, FFFFFF3B
?_118:  xor     ebx, ebx                                ; 0352 _ 31. DB
        xor     r9d, r9d                                ; 0354 _ 45: 31. C9
        cmp     edx, r8d                                ; 0357 _ 44: 39. C2
        jne     ?_110                                   ; 035A _ 0F 85, FFFFFF45
?_119:  cmp     r9d, dword [rsp+0CH]                    ; 0360 _ 44: 3B. 4C 24, 0C
        jne     ?_110                                   ; 0365 _ 0F 85, FFFFFF3A
        lea     r14, [rel ?_203]                        ; 036B _ 4C: 8D. 35, 000001C0(rel)
        jmp     ?_111                                   ; 0372 _ E9, FFFFFF4C

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_120:  xor     r15d, r15d                              ; 0380 _ 45: 31. FF
        xor     r10d, r10d                              ; 0383 _ 45: 31. D2
        and     r9, rcx                                 ; 0386 _ 49: 21. C9
        jne     ?_106                                   ; 0389 _ 0F 85, FFFFFE77
?_121:  xor     ebx, ebx                                ; 038F _ 31. DB
        xor     r9d, r9d                                ; 0391 _ 45: 31. C9
        cmp     edx, r8d                                ; 0394 _ 44: 39. C2
        jne     ?_107                                   ; 0397 _ 0F 85, FFFFFE81
?_122:  cmp     r9d, dword [rsp+0CH]                    ; 039D _ 44: 3B. 4C 24, 0C
        jne     ?_107                                   ; 03A2 _ 0F 85, FFFFFE76
        lea     r14, [rel ?_203]                        ; 03A8 _ 4C: 8D. 35, 000001C0(rel)
        jmp     ?_108                                   ; 03AF _ E9, FFFFFE88

?_123:  xor     r15d, r15d                              ; 03B4 _ 45: 31. FF
        xor     r10d, r10d                              ; 03B7 _ 45: 31. D2
        and     r14, rcx                                ; 03BA _ 49: 21. CE
        jne     ?_102                                   ; 03BD _ 0F 85, FFFFFDB8
?_124:  xor     ebx, ebx                                ; 03C3 _ 31. DB
        xor     r9d, r9d                                ; 03C5 _ 45: 31. C9
        cmp     edx, r8d                                ; 03C8 _ 44: 39. C2
        jne     ?_103                                   ; 03CB _ 0F 85, FFFFFDC2
?_125:  cmp     r9d, dword [rsp+0CH]                    ; 03D1 _ 44: 3B. 4C 24, 0C
        jne     ?_103                                   ; 03D6 _ 0F 85, FFFFFDB7
        lea     r14, [rel ?_203]                        ; 03DC _ 4C: 8D. 35, 000001C0(rel)
        jmp     ?_104                                   ; 03E3 _ E9, FFFFFDC9
; _ZN5Pawns5Entry13shelter_stormIL5Color1EEE5ValueRK8Position6Square End of function

?_126:  ; Local function
        mov     esi, 2                                  ; 03E8 _ BE, 00000002
        xor     edx, edx                                ; 03ED _ 31. D2
        jmp     ?_098                                   ; 03EF _ E9, FFFFFC99

        nop                                             ; 03F4 _ 90
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


SECTION .xdata$_ZN5Pawns5Entry13shelter_stormIL5Color1EEE5ValueRK8Position6Square align=4 noexecute ; section number 18, const
;  Communal section not supported by YASM

        db 01H, 10H, 09H, 00H, 10H, 42H, 0CH, 30H       ; 0000 _ .....B.0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .text$_ZN5Pawns5Entry14do_king_safetyIL5Color0EEE5ScoreRK8Position6Square align=16 execute ; section number 20, code
;  Communal section not supported by YASM

_ZN5Pawns5Entry14do_king_safetyIL5Color0EEE5ScoreRK8Position6Square:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 56                                 ; 000C _ 48: 83. EC, 38
        mov     rax, qword [rdx+3B8H]                   ; 0010 _ 48: 8B. 82, 000003B8
        mov     r12, qword [rdx+108H]                   ; 0017 _ 4C: 8B. A2, 00000108
        mov     rbp, qword [rdx+140H]                   ; 001E _ 48: 8B. AA, 00000140
        mov     edi, dword [rax+18H]                    ; 0025 _ 8B. 78, 18
        mov     qword [rcx+40H], r8                     ; 0028 _ 4C: 89. 41, 40
        mov     r10, r12                                ; 002C _ 4D: 89. E2
        mov     ebx, edi                                ; 002F _ 89. FB
        and     ebx, 03H                                ; 0031 _ 83. E3, 03
        and     r10, rbp                                ; 0034 _ 49: 21. EA
        mov     dword [rcx+58H], ebx                    ; 0037 _ 89. 59, 58
        je      ?_148                                   ; 003A _ 0F 84, 00000233
        mov     rsi, r8                                 ; 0040 _ 4C: 89. C6
        xor     ebx, ebx                                ; 0043 _ 31. DB
        shl     rsi, 6                                  ; 0045 _ 48: C1. E6, 06
        add     rsi, qword [rel .refptr.DistanceRingBB] ; 0049 _ 48: 03. 35, 00000000(rel)
?_127:  mov     r9, r10                                 ; 0050 _ 4D: 89. D1
        and     r9, qword [rsi]                         ; 0053 _ 4C: 23. 0E
        add     ebx, 1                                  ; 0056 _ 83. C3, 01
        add     rsi, 8                                  ; 0059 _ 48: 83. C6, 08
        test    r9, r9                                  ; 005D _ 4D: 85. C9
        jz      ?_127                                   ; 0060 _ 74, EE
?_128:  mov     r11, r8                                 ; 0062 _ 4D: 89. C3
        shr     r11, 3                                  ; 0065 _ 49: C1. EB, 03
        cmp     r11d, 3                                 ; 0069 _ 41: 83. FB, 03
        ja      ?_141                                   ; 006D _ 0F 87, 000001A5
        mov     rsi, rdx                                ; 0073 _ 48: 89. D6
        call    _ZN5Pawns5Entry13shelter_stormIL5Color0EEE5ValueRK8Position6Square; 0076 _ E8, 00000000(rel)
        test    dil, 01H                                ; 007B _ 40: F6. C7, 01
        jnz     ?_132                                   ; 007F _ 75, 22
?_129:  and     edi, 02H                                ; 0081 _ 83. E7, 02
        jne     ?_152                                   ; 0084 _ 0F 85, 00000220
?_130:  shl     ebx, 4                                  ; 008A _ C1. E3, 04
        shl     eax, 16                                 ; 008D _ C1. E0, 10
        sub     eax, ebx                                ; 0090 _ 29. D8
?_131:  add     rsp, 56                                 ; 0092 _ 48: 83. C4, 38
        pop     rbx                                     ; 0096 _ 5B
        pop     rsi                                     ; 0097 _ 5E
        pop     rdi                                     ; 0098 _ 5F
        pop     rbp                                     ; 0099 _ 5D
        pop     r12                                     ; 009A _ 41: 5C
        pop     r13                                     ; 009C _ 41: 5D
        pop     r14                                     ; 009E _ 41: 5E
        pop     r15                                     ; 00A0 _ 41: 5F
        ret                                             ; 00A2 _ C3

?_132:  mov     rcx, qword [rel .refptr.InFrontBB]      ; 00A3 _ 48: 8B. 0D, 00000000(rel)
        mov     rdx, qword [rel .refptr.RankBB]         ; 00AA _ 48: 8B. 15, 00000000(rel)
        mov     r14, qword [rel .refptr.FileBB]         ; 00B1 _ 4C: 8B. 35, 00000000(rel)
        mov     rdx, qword [rdx]                        ; 00B8 _ 48: 8B. 12
        or      rdx, qword [rcx]                        ; 00BB _ 48: 0B. 11
        mov     r8, qword [r14+28H]                     ; 00BE _ 4D: 8B. 46, 28
        and     rdx, r12                                ; 00C2 _ 4C: 21. E2
        mov     rcx, rdx                                ; 00C5 _ 48: 89. D1
        and     rdx, qword [rsi+148H]                   ; 00C8 _ 48: 23. 96, 00000148
        and     rcx, rbp                                ; 00CF _ 48: 21. E9
        mov     r13, rcx                                ; 00D2 _ 49: 89. CD
        and     r13, r8                                 ; 00D5 _ 4D: 21. C5
        je      ?_144                                   ; 00D8 _ 0F 84, 0000015D
        bsf     r9, r13                                 ; 00DE _ 4D: 0F BC. CD
        shr     r9, 3                                   ; 00E2 _ 49: C1. E9, 03
        mov     r10d, r9d                               ; 00E6 _ 45: 89. CA
        mov     r15d, r9d                               ; 00E9 _ 45: 89. CF
?_133:  and     r8, rdx                                 ; 00EC _ 49: 21. D0
        je      ?_143                                   ; 00EF _ 0F 84, 0000013B
        bsf     r11, r8                                 ; 00F5 _ 4D: 0F BC. D8
        shr     r11, 3                                  ; 00F9 _ 49: C1. EB, 03
        mov     r13d, r11d                              ; 00FD _ 45: 89. DD
        mov     r8d, r11d                               ; 0100 _ 45: 89. D8
?_134:  lea     r11, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 0103 _ 4C: 8D. 1D, 00000040(rel)
        test    r10d, r10d                              ; 010A _ 45: 85. D2
        jz      ?_135                                   ; 010D _ 74, 19
        lea     r11, [rel ?_201]                        ; 010F _ 4C: 8D. 1D, 000000C0(rel)
        add     r10d, 1                                 ; 0116 _ 41: 83. C2, 01
        cmp     r13d, r10d                              ; 011A _ 45: 39. D5
        lea     r10, [rel ?_202]                        ; 011D _ 4C: 8D. 15, 00000140(rel)
        cmove   r11, r10                                ; 0124 _ 4D: 0F 44. DA
?_135:  mov     r9, qword [r14+30H]                     ; 0128 _ 4D: 8B. 4E, 30
        lea     r13, [rel _ZN12_GLOBAL__N_1L15ShelterWeaknessE]; 012C _ 4C: 8D. 2D, 00000240(rel)
        mov     r15d, dword [r13+r15*4+40H]             ; 0133 _ 47: 8B. 7C BD, 40
        add     r15d, dword [r11+r8*4+40H]              ; 0138 _ 47: 03. 7C 83, 40
        mov     r8d, 258                                ; 013D _ 41: B8, 00000102
        mov     r10, r9                                 ; 0143 _ 4D: 89. CA
        sub     r8d, r15d                               ; 0146 _ 45: 29. F8
        and     r10, rcx                                ; 0149 _ 49: 21. CA
        je      ?_145                                   ; 014C _ 0F 84, 000000F4
        bsf     r10, r10                                ; 0152 _ 4D: 0F BC. D2
        shr     r10, 3                                  ; 0156 _ 49: C1. EA, 03
        and     r9, rdx                                 ; 015A _ 49: 21. D1
        mov     r15d, r10d                              ; 015D _ 45: 89. D7
        mov     r10d, r10d                              ; 0160 _ 45: 89. D2
        je      ?_142                                   ; 0163 _ 0F 84, 000000B7
?_136:  bsf     r11, r9                                 ; 0169 _ 4D: 0F BC. D9
        shr     r11, 3                                  ; 016D _ 49: C1. EB, 03
        cmp     r11d, 1                                 ; 0171 _ 41: 83. FB, 01
        mov     dword [rsp+2CH], r11d                   ; 0175 _ 44: 89. 5C 24, 2C
        je      ?_151                                   ; 017A _ 0F 84, 00000118
        mov     r9d, r11d                               ; 0180 _ 45: 89. D9
?_137:  lea     r11, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 0183 _ 4C: 8D. 1D, 00000040(rel)
        test    r15d, r15d                              ; 018A _ 45: 85. FF
        jz      ?_138                                   ; 018D _ 74, 1B
        lea     r11, [rel ?_202]                        ; 018F _ 4C: 8D. 1D, 00000140(rel)
        add     r15d, 1                                 ; 0196 _ 41: 83. C7, 01
        cmp     dword [rsp+2CH], r15d                   ; 019A _ 44: 39. 7C 24, 2C
        lea     r15, [rel ?_201]                        ; 019F _ 4C: 8D. 3D, 000000C0(rel)
        cmovne  r11, r15                                ; 01A6 _ 4D: 0F 45. DF
?_138:  mov     r14, qword [r14+38H]                    ; 01AA _ 4D: 8B. 76, 38
        sub     r8d, dword [r11+r9*4+20H]               ; 01AE _ 47: 2B. 44 8B, 20
        sub     r8d, dword [r13+r10*4+20H]              ; 01B3 _ 47: 2B. 44 95, 20
        and     rcx, r14                                ; 01B8 _ 4C: 21. F1
        je      ?_146                                   ; 01BB _ 0F 84, 00000095
        bsf     r11, rcx                                ; 01C1 _ 4C: 0F BC. D9
        shr     r11, 3                                  ; 01C5 _ 49: C1. EB, 03
        and     rdx, r14                                ; 01C9 _ 4C: 21. F2
        mov     r10d, r11d                              ; 01CC _ 45: 89. DA
        mov     ecx, r11d                               ; 01CF _ 44: 89. D9
        jne     ?_147                                   ; 01D2 _ 0F 85, 00000088
        xor     r9d, r9d                                ; 01D8 _ 45: 31. C9
        xor     r14d, r14d                              ; 01DB _ 45: 31. F6
?_139:  lea     rdx, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 01DE _ 48: 8D. 15, 00000040(rel)
        test    r10d, r10d                              ; 01E5 _ 45: 85. D2
        jz      ?_140                                   ; 01E8 _ 74, 19
        lea     rdx, [rel ?_201]                        ; 01EA _ 48: 8D. 15, 000000C0(rel)
        add     r10d, 1                                 ; 01F1 _ 41: 83. C2, 01
        cmp     r14d, r10d                              ; 01F5 _ 45: 39. D6
        lea     r10, [rel ?_202]                        ; 01F8 _ 4C: 8D. 15, 00000140(rel)
        cmove   rdx, r10                                ; 01FF _ 49: 0F 44. D2
?_140:  sub     r8d, dword [rdx+r9*4]                   ; 0203 _ 46: 2B. 04 8A
        sub     r8d, dword [r13+rcx*4]                  ; 0207 _ 45: 2B. 44 8D, 00
        cmp     eax, r8d                                ; 020C _ 44: 39. C0
        cmovl   eax, r8d                                ; 020F _ 41: 0F 4C. C0
        jmp     ?_129                                   ; 0213 _ E9, FFFFFE69

?_141:  imul    eax, ebx, -16                           ; 0218 _ 6B. C3, F0
        jmp     ?_131                                   ; 021B _ E9, FFFFFE72

?_142:  xor     r9d, r9d                                ; 0220 _ 45: 31. C9
        mov     dword [rsp+2CH], 0                      ; 0223 _ C7. 44 24, 2C, 00000000
        jmp     ?_137                                   ; 022B _ E9, FFFFFF53

?_143:  xor     r8d, r8d                                ; 0230 _ 45: 31. C0
        xor     r13d, r13d                              ; 0233 _ 45: 31. ED
        jmp     ?_134                                   ; 0236 _ E9, FFFFFEC8

?_144:  xor     r15d, r15d                              ; 023B _ 45: 31. FF
        xor     r10d, r10d                              ; 023E _ 45: 31. D2
        jmp     ?_133                                   ; 0241 _ E9, FFFFFEA6

?_145:  xor     r10d, r10d                              ; 0246 _ 45: 31. D2
        and     r9, rdx                                 ; 0249 _ 49: 21. D1
        jz      ?_150                                   ; 024C _ 74, 3B
        xor     r15d, r15d                              ; 024E _ 45: 31. FF
        jmp     ?_136                                   ; 0251 _ E9, FFFFFF13

?_146:  xor     ecx, ecx                                ; 0256 _ 31. C9
        xor     r10d, r10d                              ; 0258 _ 45: 31. D2
        and     rdx, r14                                ; 025B _ 4C: 21. F2
        jz      ?_149                                   ; 025E _ 74, 1A
?_147:  bsf     r15, rdx                                ; 0260 _ 4C: 0F BC. FA
        shr     r15, 3                                  ; 0264 _ 49: C1. EF, 03
        mov     r14d, r15d                              ; 0268 _ 45: 89. FE
        mov     r9d, r15d                               ; 026B _ 45: 89. F9
        jmp     ?_139                                   ; 026E _ E9, FFFFFF6B

?_148:  xor     ebx, ebx                                ; 0273 _ 31. DB
        jmp     ?_128                                   ; 0275 _ E9, FFFFFDE8

?_149:  lea     rdx, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 027A _ 48: 8D. 15, 00000040(rel)
        xor     r9d, r9d                                ; 0281 _ 45: 31. C9
        jmp     ?_140                                   ; 0284 _ E9, FFFFFF7A

?_150:  lea     r11, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 0289 _ 4C: 8D. 1D, 00000040(rel)
        xor     r9d, r9d                                ; 0290 _ 45: 31. C9
        jmp     ?_138                                   ; 0293 _ E9, FFFFFF12

?_151:  lea     r11, [rel ?_203]                        ; 0298 _ 4C: 8D. 1D, 000001C0(rel)
        mov     r9d, 1                                  ; 029F _ 41: B9, 00000001
        jmp     ?_138                                   ; 02A5 _ E9, FFFFFF00
; _ZN5Pawns5Entry14do_king_safetyIL5Color0EEE5ScoreRK8Position6Square End of function

?_152:  ; Local function
        mov     rdi, qword [rel .refptr.RankBB]         ; 02AA _ 48: 8B. 3D, 00000000(rel)
        mov     r13, qword [rel .refptr.InFrontBB]      ; 02B1 _ 4C: 8B. 2D, 00000000(rel)
        mov     r9, qword [rel .refptr.FileBB]          ; 02B8 _ 4C: 8B. 0D, 00000000(rel)
        mov     r8, qword [rdi]                         ; 02BF _ 4C: 8B. 07
        or      r8, qword [r13]                         ; 02C2 _ 4D: 0B. 45, 00
        and     r8, r12                                 ; 02C6 _ 4D: 21. E0
        and     rbp, r8                                 ; 02C9 _ 4C: 21. C5
        and     r8, qword [rsi+148H]                    ; 02CC _ 4C: 23. 86, 00000148
        mov     rsi, qword [r9+8H]                      ; 02D3 _ 49: 8B. 71, 08
        mov     r12, rbp                                ; 02D7 _ 49: 89. EC
        mov     rcx, r8                                 ; 02DA _ 4C: 89. C1
        and     r12, rsi                                ; 02DD _ 49: 21. F4
        je      ?_168                                   ; 02E0 _ 0F 84, 00000185
        bsf     rdx, r12                                ; 02E6 _ 49: 0F BC. D4
        shr     rdx, 3                                  ; 02EA _ 48: C1. EA, 03
        mov     r11d, edx                               ; 02EE _ 41: 89. D3
        mov     r15d, edx                               ; 02F1 _ 41: 89. D7
?_153:  and     rsi, rcx                                ; 02F4 _ 48: 21. CE
        je      ?_167                                   ; 02F7 _ 0F 84, 00000163
        bsf     rdi, rsi                                ; 02FD _ 48: 0F BC. FE
        shr     rdi, 3                                  ; 0301 _ 48: C1. EF, 03
        mov     r10d, edi                               ; 0305 _ 41: 89. FA
        mov     r14d, edi                               ; 0308 _ 41: 89. FE
?_154:  lea     r13, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 030B _ 4C: 8D. 2D, 00000040(rel)
        test    r11d, r11d                              ; 0312 _ 45: 85. DB
        jz      ?_155                                   ; 0315 _ 74, 19
        lea     r13, [rel ?_202]                        ; 0317 _ 4C: 8D. 2D, 00000140(rel)
        add     r11d, 1                                 ; 031E _ 41: 83. C3, 01
        lea     r8, [rel ?_201]                         ; 0322 _ 4C: 8D. 05, 000000C0(rel)
        cmp     r10d, r11d                              ; 0329 _ 45: 39. DA
        cmovne  r13, r8                                 ; 032C _ 4D: 0F 45. E8
?_155:  mov     r10d, 258                               ; 0330 _ 41: BA, 00000102
        lea     r8, [rel _ZN12_GLOBAL__N_1L15ShelterWeaknessE]; 0336 _ 4C: 8D. 05, 00000240(rel)
        mov     esi, dword [r8+r15*4+20H]               ; 033D _ 43: 8B. 74 B8, 20
        add     esi, dword [r13+r14*4+20H]              ; 0342 _ 43: 03. 74 B5, 20
        mov     r13, qword [r9+10H]                     ; 0347 _ 4D: 8B. 69, 10
        sub     r10d, esi                               ; 034B _ 41: 29. F2
        mov     r15, r13                                ; 034E _ 4D: 89. EF
        and     r15, rbp                                ; 0351 _ 49: 21. EF
        je      ?_166                                   ; 0354 _ 0F 84, 000000F7
        bsf     rsi, r15                                ; 035A _ 49: 0F BC. F7
        shr     rsi, 3                                  ; 035E _ 48: C1. EE, 03
        and     r13, rcx                                ; 0362 _ 49: 21. CD
        mov     edi, esi                                ; 0365 _ 89. F7
        mov     r11d, esi                               ; 0367 _ 41: 89. F3
        je      ?_165                                   ; 036A _ 0F 84, 000000D7
?_156:  bsf     r15, r13                                ; 0370 _ 4D: 0F BC. FD
        shr     r15, 3                                  ; 0374 _ 49: C1. EF, 03
        cmp     r15d, 1                                 ; 0378 _ 41: 83. FF, 01
        mov     r12d, r15d                              ; 037C _ 45: 89. FC
        je      ?_164                                   ; 037F _ 0F 84, 000000B1
        mov     edx, r15d                               ; 0385 _ 44: 89. FA
?_157:  lea     r14, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 0388 _ 4C: 8D. 35, 00000040(rel)
        test    edi, edi                                ; 038F _ 85. FF
        jz      ?_158                                   ; 0391 _ 74, 18
        lea     r13, [rel ?_202]                        ; 0393 _ 4C: 8D. 2D, 00000140(rel)
        add     edi, 1                                  ; 039A _ 83. C7, 01
        lea     r14, [rel ?_201]                        ; 039D _ 4C: 8D. 35, 000000C0(rel)
        cmp     r12d, edi                               ; 03A4 _ 41: 39. FC
        cmove   r14, r13                                ; 03A7 _ 4D: 0F 44. F5
?_158:  sub     r10d, dword [r14+rdx*4+40H]             ; 03AB _ 45: 2B. 54 96, 40
        mov     rdx, qword [r9+18H]                     ; 03B0 _ 49: 8B. 51, 18
        sub     r10d, dword [r8+r11*4+40H]              ; 03B4 _ 47: 2B. 54 98, 40
        and     rbp, rdx                                ; 03B9 _ 48: 21. D5
        jz      ?_163                                   ; 03BC _ 74, 62
        bsf     r14, rbp                                ; 03BE _ 4C: 0F BC. F5
        shr     r14, 3                                  ; 03C2 _ 49: C1. EE, 03
        and     rdx, rcx                                ; 03C6 _ 48: 21. CA
        mov     r11d, r14d                              ; 03C9 _ 45: 89. F3
        mov     ebp, r14d                               ; 03CC _ 44: 89. F5
        jz      ?_162                                   ; 03CF _ 74, 48
?_159:  bsf     rdi, rdx                                ; 03D1 _ 48: 0F BC. FA
        shr     rdi, 3                                  ; 03D5 _ 48: C1. EF, 03
        mov     esi, edi                                ; 03D9 _ 89. FE
        mov     r9d, edi                                ; 03DB _ 41: 89. F9
?_160:  lea     rcx, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 03DE _ 48: 8D. 0D, 00000040(rel)
        test    r11d, r11d                              ; 03E5 _ 45: 85. DB
        jz      ?_161                                   ; 03E8 _ 74, 19
        lea     r15, [rel ?_202]                        ; 03EA _ 4C: 8D. 3D, 00000140(rel)
        add     r11d, 1                                 ; 03F1 _ 41: 83. C3, 01
        lea     rcx, [rel ?_201]                        ; 03F5 _ 48: 8D. 0D, 000000C0(rel)
        cmp     esi, r11d                               ; 03FC _ 44: 39. DE
        cmove   rcx, r15                                ; 03FF _ 49: 0F 44. CF
?_161:  sub     r10d, dword [rcx+r9*4+60H]              ; 0403 _ 46: 2B. 54 89, 60
        sub     r10d, dword [r8+rbp*4+60H]              ; 0408 _ 45: 2B. 54 A8, 60
        cmp     eax, r10d                               ; 040D _ 44: 39. D0
        cmovl   eax, r10d                               ; 0410 _ 41: 0F 4C. C2
        jmp     ?_130                                   ; 0414 _ E9, FFFFFC71

?_162:  xor     r9d, r9d                                ; 0419 _ 45: 31. C9
        xor     esi, esi                                ; 041C _ 31. F6
        jmp     ?_160                                   ; 041E _ EB, BE

?_163:  xor     ebp, ebp                                ; 0420 _ 31. ED
        xor     r11d, r11d                              ; 0422 _ 45: 31. DB
        and     rdx, rcx                                ; 0425 _ 48: 21. CA
        jnz     ?_159                                   ; 0428 _ 75, A7
        lea     rcx, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 042A _ 48: 8D. 0D, 00000040(rel)
        xor     r9d, r9d                                ; 0431 _ 45: 31. C9
        jmp     ?_161                                   ; 0434 _ EB, CD

?_164:  lea     r14, [rel ?_203]                        ; 0436 _ 4C: 8D. 35, 000001C0(rel)
        mov     edx, 1                                  ; 043D _ BA, 00000001
        jmp     ?_158                                   ; 0442 _ E9, FFFFFF64

?_165:  xor     edx, edx                                ; 0447 _ 31. D2
        xor     r12d, r12d                              ; 0449 _ 45: 31. E4
        jmp     ?_157                                   ; 044C _ E9, FFFFFF37

?_166:  and     r13, rcx                                ; 0451 _ 49: 21. CD
        jz      ?_169                                   ; 0454 _ 74, 20
        xor     edi, edi                                ; 0456 _ 31. FF
        xor     r11d, r11d                              ; 0458 _ 45: 31. DB
        jmp     ?_156                                   ; 045B _ E9, FFFFFF10

?_167:  xor     r14d, r14d                              ; 0460 _ 45: 31. F6
        xor     r10d, r10d                              ; 0463 _ 45: 31. D2
        jmp     ?_154                                   ; 0466 _ E9, FFFFFEA0

?_168:  xor     r15d, r15d                              ; 046B _ 45: 31. FF
        xor     r11d, r11d                              ; 046E _ 45: 31. DB
        jmp     ?_153                                   ; 0471 _ E9, FFFFFE7E

?_169:  ; Local function
        lea     r14, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 0476 _ 4C: 8D. 35, 00000040(rel)
        xor     r11d, r11d                              ; 047D _ 45: 31. DB
        xor     edx, edx                                ; 0480 _ 31. D2
        jmp     ?_158                                   ; 0482 _ E9, FFFFFF24

        nop                                             ; 0487 _ 90
        nop                                             ; 0488 _ 90
        nop                                             ; 0489 _ 90
        nop                                             ; 048A _ 90
        nop                                             ; 048B _ 90
        nop                                             ; 048C _ 90
        nop                                             ; 048D _ 90
        nop                                             ; 048E _ 90
        nop                                             ; 048F _ 90


SECTION .xdata$_ZN5Pawns5Entry14do_king_safetyIL5Color0EEE5ScoreRK8Position6Square align=4 noexecute ; section number 21, const
;  Communal section not supported by YASM

        db 01H, 10H, 09H, 00H, 10H, 62H, 0CH, 30H       ; 0000 _ .....b.0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .text$_ZN5Pawns5Entry13shelter_stormIL5Color0EEE5ValueRK8Position6Square align=16 execute ; section number 23, code
;  Communal section not supported by YASM

_ZN5Pawns5Entry13shelter_stormIL5Color0EEE5ValueRK8Position6Square:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 40                                 ; 000C _ 48: 83. EC, 28
        mov     r9, qword [rel .refptr.RankBB]          ; 0010 _ 4C: 8B. 0D, 00000000(rel)
        mov     r10, qword [rel .refptr.InFrontBB]      ; 0017 _ 4C: 8B. 15, 00000000(rel)
        mov     rax, r8                                 ; 001E _ 4C: 89. C0
        and     r8d, 07H                                ; 0021 _ 41: 83. E0, 07
        mov     dword [rsp+14H], 6                      ; 0025 _ C7. 44 24, 14, 00000006
        shr     rax, 3                                  ; 002D _ 48: C1. E8, 03
        mov     dword [rsp+18H], r8d                    ; 0031 _ 44: 89. 44 24, 18
        mov     ebx, eax                                ; 0036 _ 89. C3
        mov     ecx, eax                                ; 0038 _ 89. C1
        mov     r9, qword [r9+rbx*8]                    ; 003A _ 4D: 8B. 0C D9
        or      r9, qword [r10+rbx*8]                   ; 003E _ 4D: 0B. 0C DA
        and     r9, qword [rdx+108H]                    ; 0042 _ 4C: 23. 8A, 00000108
        mov     r11, r9                                 ; 0049 _ 4D: 89. CB
        and     r9, qword [rdx+148H]                    ; 004C _ 4C: 23. 8A, 00000148
        and     r11, qword [rdx+140H]                   ; 0053 _ 4C: 23. 9A, 00000140
        cmp     r8d, 5                                  ; 005A _ 41: 83. F8, 05
        ja      ?_188                                   ; 005E _ 0F 87, 000002CF
        cmp     r8d, 1                                  ; 0064 _ 41: 83. F8, 01
        mov     dword [rsp+1CH], 1                      ; 0068 _ C7. 44 24, 1C, 00000001
        jbe     ?_198                                   ; 0070 _ 0F 86, 0000036A
        lea     edx, [r8-1H]                            ; 0076 _ 41: 8D. 50, FF
        mov     eax, 258                                ; 007A _ B8, 00000102
        lea     ebx, [r8+1H]                            ; 007F _ 41: 8D. 58, 01
        cmp     edx, ebx                                ; 0083 _ 39. DA
        ja      ?_184                                   ; 0085 _ 0F 87, 0000025D
?_170:  mov     rbp, qword [rel .refptr.FileBB]         ; 008B _ 48: 8B. 2D, 00000000(rel)
        lea     edi, [rcx+1H]                           ; 0092 _ 8D. 79, 01
        mov     r14d, edx                               ; 0095 _ 41: 89. D6
        mov     r13d, ebx                               ; 0098 _ 41: 89. DD
        mov     dword [rsp+0CH], edi                    ; 009B _ 89. 7C 24, 0C
        sub     r13d, edx                               ; 009F _ 41: 29. D5
        mov     edi, 7                                  ; 00A2 _ BF, 00000007
        lea     rsi, [rel _ZN12_GLOBAL__N_1L15ShelterWeaknessE]; 00A7 _ 48: 8D. 35, 00000240(rel)
        and     r13d, 01H                               ; 00AE _ 41: 83. E5, 01
        lea     r12, [rel ?_202]                        ; 00B2 _ 4C: 8D. 25, 00000140(rel)
        mov     r15, qword [rbp+r14*8]                  ; 00B9 _ 4E: 8B. 7C F5, 00
        mov     rax, r15                                ; 00BE _ 4C: 89. F8
        and     rax, r11                                ; 00C1 _ 4C: 21. D8
        je      ?_185                                   ; 00C4 _ 0F 84, 00000236
        bsf     rcx, rax                                ; 00CA _ 48: 0F BC. C8
        shr     rcx, 3                                  ; 00CE _ 48: C1. E9, 03
        and     r15, r9                                 ; 00D2 _ 4D: 21. CF
        mov     r10d, ecx                               ; 00D5 _ 41: 89. CA
        mov     ecx, ecx                                ; 00D8 _ 89. C9
        je      ?_186                                   ; 00DA _ 0F 84, 0000022E
?_171:  bsf     r14, r15                                ; 00E0 _ 4D: 0F BC. F7
        shr     r14, 3                                  ; 00E4 _ 49: C1. EE, 03
        cmp     edx, r8d                                ; 00E8 _ 44: 39. C2
        mov     r15d, r14d                              ; 00EB _ 45: 89. F7
        mov     eax, r14d                               ; 00EE _ 44: 89. F0
        je      ?_187                                   ; 00F1 _ 0F 84, 00000225
?_172:  lea     r14, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 00F7 _ 4C: 8D. 35, 00000040(rel)
        test    r10d, r10d                              ; 00FE _ 45: 85. D2
        jz      ?_173                                   ; 0101 _ 74, 12
        lea     r14, [rel ?_201]                        ; 0103 _ 4C: 8D. 35, 000000C0(rel)
        add     r10d, 1                                 ; 010A _ 41: 83. C2, 01
        cmp     r15d, r10d                              ; 010E _ 45: 39. D7
        cmove   r14, r12                                ; 0111 _ 4D: 0F 44. F4
?_173:  mov     r10d, edi                               ; 0115 _ 41: 89. FA
        sub     r10d, edx                               ; 0118 _ 41: 29. D2
        cmp     edx, r10d                               ; 011B _ 44: 39. D2
        cmovbe  r10, rdx                                ; 011E _ 4C: 0F 46. D2
        add     edx, 1                                  ; 0122 _ 83. C2, 01
        shl     r10, 3                                  ; 0125 _ 49: C1. E2, 03
        lea     r15, [rax+r10]                          ; 0129 _ 4E: 8D. 3C 10
        add     rcx, r10                                ; 012D _ 4C: 01. D1
        mov     eax, 258                                ; 0130 _ B8, 00000102
        sub     eax, dword [r14+r15*4]                  ; 0135 _ 43: 2B. 04 BE
        sub     eax, dword [rsi+rcx*4]                  ; 0139 _ 2B. 04 8E
        cmp     edx, ebx                                ; 013C _ 39. DA
        ja      ?_184                                   ; 013E _ 0F 87, 000001A4
        test    r13d, r13d                              ; 0144 _ 45: 85. ED
        je      ?_177                                   ; 0147 _ 0F 84, 00000089
        mov     r13d, edx                               ; 014D _ 41: 89. D5
        mov     rcx, qword [rbp+r13*8]                  ; 0150 _ 4A: 8B. 4C ED, 00
        mov     r14, rcx                                ; 0155 _ 49: 89. CE
        and     r14, r11                                ; 0158 _ 4D: 21. DE
        je      ?_197                                   ; 015B _ 0F 84, 00000274
        bsf     r10, r14                                ; 0161 _ 4D: 0F BC. D6
        shr     r10, 3                                  ; 0165 _ 49: C1. EA, 03
        mov     r13d, r10d                              ; 0169 _ 45: 89. D5
        mov     r10d, r10d                              ; 016C _ 45: 89. D2
?_174:  and     rcx, r9                                 ; 016F _ 4C: 21. C9
        je      ?_195                                   ; 0172 _ 0F 84, 00000238
        bsf     rcx, rcx                                ; 0178 _ 48: 0F BC. C9
        shr     rcx, 3                                  ; 017C _ 48: C1. E9, 03
        cmp     edx, r8d                                ; 0180 _ 44: 39. C2
        mov     r15d, ecx                               ; 0183 _ 41: 89. CF
        mov     ecx, ecx                                ; 0186 _ 89. C9
        je      ?_196                                   ; 0188 _ 0F 84, 00000230
?_175:  lea     r14, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 018E _ 4C: 8D. 35, 00000040(rel)
        test    r13d, r13d                              ; 0195 _ 45: 85. ED
        jz      ?_176                                   ; 0198 _ 74, 12
        lea     r14, [rel ?_201]                        ; 019A _ 4C: 8D. 35, 000000C0(rel)
        add     r13d, 1                                 ; 01A1 _ 41: 83. C5, 01
        cmp     r15d, r13d                              ; 01A5 _ 45: 39. EF
        cmove   r14, r12                                ; 01A8 _ 4D: 0F 44. F4
?_176:  mov     r13d, edi                               ; 01AC _ 41: 89. FD
        sub     r13d, edx                               ; 01AF _ 41: 29. D5
        cmp     edx, r13d                               ; 01B2 _ 44: 39. EA
        cmovbe  r13, rdx                                ; 01B5 _ 4C: 0F 46. EA
        add     edx, 1                                  ; 01B9 _ 83. C2, 01
        shl     r13, 3                                  ; 01BC _ 49: C1. E5, 03
        add     rcx, r13                                ; 01C0 _ 4C: 01. E9
        add     r10, r13                                ; 01C3 _ 4D: 01. EA
        sub     eax, dword [r14+rcx*4]                  ; 01C6 _ 41: 2B. 04 8E
        sub     eax, dword [rsi+r10*4]                  ; 01CA _ 42: 2B. 04 96
        cmp     edx, ebx                                ; 01CE _ 39. DA
        ja      ?_184                                   ; 01D0 _ 0F 87, 00000112
?_177:  mov     r14d, edx                               ; 01D6 _ 41: 89. D6
        mov     rcx, qword [rbp+r14*8]                  ; 01D9 _ 4A: 8B. 4C F5, 00
        mov     r10, rcx                                ; 01DE _ 49: 89. CA
        and     r10, r11                                ; 01E1 _ 4D: 21. DA
        je      ?_193                                   ; 01E4 _ 0F 84, 000001AB
        bsf     r14, r10                                ; 01EA _ 4D: 0F BC. F2
        shr     r14, 3                                  ; 01EE _ 49: C1. EE, 03
        mov     r13d, r14d                              ; 01F2 _ 45: 89. F5
        mov     r15d, r14d                              ; 01F5 _ 45: 89. F7
?_178:  and     rcx, r9                                 ; 01F8 _ 4C: 21. C9
        je      ?_191                                   ; 01FB _ 0F 84, 0000016F
        bsf     r14, rcx                                ; 0201 _ 4C: 0F BC. F1
        shr     r14, 3                                  ; 0205 _ 49: C1. EE, 03
        cmp     edx, r8d                                ; 0209 _ 44: 39. C2
        mov     r10d, r14d                              ; 020C _ 45: 89. F2
        mov     ecx, r14d                               ; 020F _ 44: 89. F1
        je      ?_192                                   ; 0212 _ 0F 84, 00000166
?_179:  lea     r14, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 0218 _ 4C: 8D. 35, 00000040(rel)
        test    r13d, r13d                              ; 021F _ 45: 85. ED
        jz      ?_180                                   ; 0222 _ 74, 12
        lea     r14, [rel ?_201]                        ; 0224 _ 4C: 8D. 35, 000000C0(rel)
        add     r13d, 1                                 ; 022B _ 41: 83. C5, 01
        cmp     r10d, r13d                              ; 022F _ 45: 39. EA
        cmove   r14, r12                                ; 0232 _ 4D: 0F 44. F4
?_180:  mov     r13d, edi                               ; 0236 _ 41: 89. FD
        sub     r13d, edx                               ; 0239 _ 41: 29. D5
        cmp     edx, r13d                               ; 023C _ 44: 39. EA
        mov     r10d, r13d                              ; 023F _ 45: 89. EA
        cmovbe  r10, rdx                                ; 0242 _ 4C: 0F 46. D2
        shl     r10, 3                                  ; 0246 _ 49: C1. E2, 03
        add     rcx, r10                                ; 024A _ 4C: 01. D1
        add     r10, r15                                ; 024D _ 4D: 01. FA
        lea     r15d, [rdx+1H]                          ; 0250 _ 44: 8D. 7A, 01
        sub     eax, dword [r14+rcx*4]                  ; 0254 _ 41: 2B. 04 8E
        mov     rcx, qword [rbp+r15*8]                  ; 0258 _ 4A: 8B. 4C FD, 00
        mov     rdx, r15                                ; 025D _ 4C: 89. FA
        sub     eax, dword [rsi+r10*4]                  ; 0260 _ 42: 2B. 04 96
        mov     r14, rcx                                ; 0264 _ 49: 89. CE
        and     r14, r11                                ; 0267 _ 4D: 21. DE
        je      ?_194                                   ; 026A _ 0F 84, 00000130
        bsf     r10, r14                                ; 0270 _ 4D: 0F BC. D6
        shr     r10, 3                                  ; 0274 _ 49: C1. EA, 03
        mov     r13d, r10d                              ; 0278 _ 45: 89. D5
        mov     r15d, r10d                              ; 027B _ 45: 89. D7
?_181:  and     rcx, r9                                 ; 027E _ 4C: 21. C9
        je      ?_189                                   ; 0281 _ 0F 84, 000000BB
        bsf     rcx, rcx                                ; 0287 _ 48: 0F BC. C9
        shr     rcx, 3                                  ; 028B _ 48: C1. E9, 03
        cmp     edx, r8d                                ; 028F _ 44: 39. C2
        mov     r10d, ecx                               ; 0292 _ 41: 89. CA
        mov     ecx, ecx                                ; 0295 _ 89. C9
        je      ?_190                                   ; 0297 _ 0F 84, 000000B3
?_182:  lea     r14, [rel _ZN12_GLOBAL__N_1L11StormDangerE]; 029D _ 4C: 8D. 35, 00000040(rel)
        test    r13d, r13d                              ; 02A4 _ 45: 85. ED
        jz      ?_183                                   ; 02A7 _ 74, 12
        lea     r14, [rel ?_201]                        ; 02A9 _ 4C: 8D. 35, 000000C0(rel)
        add     r13d, 1                                 ; 02B0 _ 41: 83. C5, 01
        cmp     r10d, r13d                              ; 02B4 _ 45: 39. EA
        cmove   r14, r12                                ; 02B7 _ 4D: 0F 44. F4
?_183:  mov     r13d, edi                               ; 02BB _ 41: 89. FD
        sub     r13d, edx                               ; 02BE _ 41: 29. D5
        cmp     edx, r13d                               ; 02C1 _ 44: 39. EA
        mov     r10d, r13d                              ; 02C4 _ 45: 89. EA
        cmovbe  r10, rdx                                ; 02C7 _ 4C: 0F 46. D2
        add     edx, 1                                  ; 02CB _ 83. C2, 01
        shl     r10, 3                                  ; 02CE _ 49: C1. E2, 03
        add     rcx, r10                                ; 02D2 _ 4C: 01. D1
        add     r10, r15                                ; 02D5 _ 4D: 01. FA
        sub     eax, dword [r14+rcx*4]                  ; 02D8 _ 41: 2B. 04 8E
        sub     eax, dword [rsi+r10*4]                  ; 02DC _ 42: 2B. 04 96
        cmp     edx, ebx                                ; 02E0 _ 39. DA
        jbe     ?_177                                   ; 02E2 _ 0F 86, FFFFFEEE
?_184:  add     rsp, 40                                 ; 02E8 _ 48: 83. C4, 28
        pop     rbx                                     ; 02EC _ 5B
        pop     rsi                                     ; 02ED _ 5E
        pop     rdi                                     ; 02EE _ 5F
        pop     rbp                                     ; 02EF _ 5D
        pop     r12                                     ; 02F0 _ 41: 5C
        pop     r13                                     ; 02F2 _ 41: 5D
        pop     r14                                     ; 02F4 _ 41: 5E
        pop     r15                                     ; 02F6 _ 41: 5F
        ret                                             ; 02F8 _ C3

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_185:  xor     ecx, ecx                                ; 0300 _ 31. C9
        xor     r10d, r10d                              ; 0302 _ 45: 31. D2
        and     r15, r9                                 ; 0305 _ 4D: 21. CF
        jne     ?_171                                   ; 0308 _ 0F 85, FFFFFDD2
?_186:  xor     eax, eax                                ; 030E _ 31. C0
        xor     r15d, r15d                              ; 0310 _ 45: 31. FF
        cmp     edx, r8d                                ; 0313 _ 44: 39. C2
        jne     ?_172                                   ; 0316 _ 0F 85, FFFFFDDB
?_187:  cmp     r15d, dword [rsp+0CH]                   ; 031C _ 44: 3B. 7C 24, 0C
        jne     ?_172                                   ; 0321 _ 0F 85, FFFFFDD0
        lea     r14, [rel ?_203]                        ; 0327 _ 4C: 8D. 35, 000001C0(rel)
        jmp     ?_173                                   ; 032E _ E9, FFFFFDE2

?_188:  mov     edx, 5                                  ; 0333 _ BA, 00000005
        mov     ebx, 7                                  ; 0338 _ BB, 00000007
        jmp     ?_170                                   ; 033D _ E9, FFFFFD49

?_189:  xor     ecx, ecx                                ; 0342 _ 31. C9
        xor     r10d, r10d                              ; 0344 _ 45: 31. D2
        cmp     edx, r8d                                ; 0347 _ 44: 39. C2
        jne     ?_182                                   ; 034A _ 0F 85, FFFFFF4D
?_190:  cmp     r10d, dword [rsp+0CH]                   ; 0350 _ 44: 3B. 54 24, 0C
        jne     ?_182                                   ; 0355 _ 0F 85, FFFFFF42
        lea     r14, [rel ?_203]                        ; 035B _ 4C: 8D. 35, 000001C0(rel)
        jmp     ?_183                                   ; 0362 _ E9, FFFFFF54

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_191:  xor     ecx, ecx                                ; 0370 _ 31. C9
        xor     r10d, r10d                              ; 0372 _ 45: 31. D2
        cmp     edx, r8d                                ; 0375 _ 44: 39. C2
        jne     ?_179                                   ; 0378 _ 0F 85, FFFFFE9A
?_192:  cmp     r10d, dword [rsp+0CH]                   ; 037E _ 44: 3B. 54 24, 0C
        jne     ?_179                                   ; 0383 _ 0F 85, FFFFFE8F
        lea     r14, [rel ?_203]                        ; 0389 _ 4C: 8D. 35, 000001C0(rel)
        jmp     ?_180                                   ; 0390 _ E9, FFFFFEA1

?_193:  xor     r15d, r15d                              ; 0395 _ 45: 31. FF
        xor     r13d, r13d                              ; 0398 _ 45: 31. ED
        jmp     ?_178                                   ; 039B _ E9, FFFFFE58

?_194:  xor     r15d, r15d                              ; 03A0 _ 45: 31. FF
        xor     r13d, r13d                              ; 03A3 _ 45: 31. ED
        jmp     ?_181                                   ; 03A6 _ E9, FFFFFED3

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_195:  xor     ecx, ecx                                ; 03B0 _ 31. C9
        xor     r15d, r15d                              ; 03B2 _ 45: 31. FF
        cmp     edx, r8d                                ; 03B5 _ 44: 39. C2
        jne     ?_175                                   ; 03B8 _ 0F 85, FFFFFDD0
?_196:  cmp     r15d, dword [rsp+0CH]                   ; 03BE _ 44: 3B. 7C 24, 0C
        jne     ?_175                                   ; 03C3 _ 0F 85, FFFFFDC5
        lea     r14, [rel ?_203]                        ; 03C9 _ 4C: 8D. 35, 000001C0(rel)
        jmp     ?_176                                   ; 03D0 _ E9, FFFFFDD7

?_197:  xor     r10d, r10d                              ; 03D5 _ 45: 31. D2
        xor     r13d, r13d                              ; 03D8 _ 45: 31. ED
        jmp     ?_174                                   ; 03DB _ E9, FFFFFD8F
; _ZN5Pawns5Entry13shelter_stormIL5Color0EEE5ValueRK8Position6Square End of function

?_198:  ; Local function
        mov     ebx, 2                                  ; 03E0 _ BB, 00000002
        xor     edx, edx                                ; 03E5 _ 31. D2
        jmp     ?_170                                   ; 03E7 _ E9, FFFFFC9F

        nop                                             ; 03EC _ 90
        nop                                             ; 03ED _ 90
        nop                                             ; 03EE _ 90
        nop                                             ; 03EF _ 90


SECTION .xdata$_ZN5Pawns5Entry13shelter_stormIL5Color0EEE5ValueRK8Position6Square align=4 noexecute ; section number 24, const
;  Communal section not supported by YASM

        db 01H, 10H, 09H, 00H, 10H, 42H, 0CH, 30H       ; 0000 _ .....B.0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .rdata  align=64 noexecute                      ; section number 26, const

_ZZN5Pawns4initEvE4Seed:                                ; byte
        db 00H, 00H, 00H, 00H                           ; 0000 _ ....

?_199:                                                  ; byte
        db 08H, 00H, 00H, 00H                           ; 0004 _ ....

?_200:                                                  ; byte
        db 13H, 00H, 00H, 00H, 0DH, 00H, 00H, 00H       ; 0008 _ ........
        db 47H, 00H, 00H, 00H, 5EH, 00H, 00H, 00H       ; 0010 _ G...^...
        db 0A9H, 00H, 00H, 00H, 44H, 01H, 00H, 00H      ; 0018 _ ....D...
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0020 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0028 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........

_ZN12_GLOBAL__N_1L11StormDangerE:                       ; byte
        db 00H, 00H, 00H, 00H, 43H, 00H, 00H, 00H       ; 0040 _ ....C...
        db 86H, 00H, 00H, 00H, 26H, 00H, 00H, 00H       ; 0048 _ ....&...
        db 20H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0050 _  .......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........
        db 00H, 00H, 00H, 00H, 39H, 00H, 00H, 00H       ; 0060 _ ....9...
        db 8BH, 00H, 00H, 00H, 25H, 00H, 00H, 00H       ; 0068 _ ....%...
        db 16H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0070 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........
        db 00H, 00H, 00H, 00H, 2BH, 00H, 00H, 00H       ; 0080 _ ....+...
        db 73H, 00H, 00H, 00H, 2BH, 00H, 00H, 00H       ; 0088 _ s...+...
        db 1BH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0090 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0098 _ ........
        db 00H, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 00A0 _ ....D...
        db 7CH, 00H, 00H, 00H, 39H, 00H, 00H, 00H       ; 00A8 _ |...9...
        db 20H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B0 _  .......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00B8 _ ........

?_201:                                                  ; byte
        db 14H, 00H, 00H, 00H, 2BH, 00H, 00H, 00H       ; 00C0 _ ....+...
        db 64H, 00H, 00H, 00H, 38H, 00H, 00H, 00H       ; 00C8 _ d...8...
        db 14H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00D8 _ ........
        db 17H, 00H, 00H, 00H, 14H, 00H, 00H, 00H       ; 00E0 _ ........
        db 62H, 00H, 00H, 00H, 28H, 00H, 00H, 00H       ; 00E8 _ b...(...
        db 0FH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 00F8 _ ........
        db 17H, 00H, 00H, 00H, 27H, 00H, 00H, 00H       ; 0100 _ ....'...
        db 67H, 00H, 00H, 00H, 24H, 00H, 00H, 00H       ; 0108 _ g...$...
        db 12H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0110 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0118 _ ........
        db 1CH, 00H, 00H, 00H, 13H, 00H, 00H, 00H       ; 0120 _ ........
        db 6CH, 00H, 00H, 00H, 2AH, 00H, 00H, 00H       ; 0128 _ l...*...
        db 1AH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0130 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0138 _ ........

?_202:                                                  ; byte
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0140 _ ........
        db 4BH, 00H, 00H, 00H, 0EH, 00H, 00H, 00H       ; 0148 _ K.......
        db 02H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0150 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0158 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0160 _ ........
        db 96H, 00H, 00H, 00H, 1EH, 00H, 00H, 00H       ; 0168 _ ........
        db 04H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0170 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0178 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0180 _ ........
        db 0A0H, 00H, 00H, 00H, 16H, 00H, 00H, 00H      ; 0188 _ ........
        db 05H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0190 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0198 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01A0 _ ........
        db 0A6H, 00H, 00H, 00H, 18H, 00H, 00H, 00H      ; 01A8 _ ........
        db 0DH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01B0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01B8 _ ........

?_203:                                                  ; byte
        db 00H, 00H, 00H, 00H, 0E5H, 0FEH, 0FFH, 0FFH   ; 01C0 _ ........
        db 0E7H, 0FEH, 0FFH, 0FFH, 39H, 00H, 00H, 00H   ; 01C8 _ ....9...
        db 1FH, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01D0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01D8 _ ........
        db 00H, 00H, 00H, 00H, 3AH, 00H, 00H, 00H       ; 01E0 _ ....:...
        db 8DH, 00H, 00H, 00H, 27H, 00H, 00H, 00H       ; 01E8 _ ....'...
        db 12H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01F0 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 01F8 _ ........
        db 00H, 00H, 00H, 00H, 41H, 00H, 00H, 00H       ; 0200 _ ....A...
        db 8EH, 00H, 00H, 00H, 30H, 00H, 00H, 00H       ; 0208 _ ....0...
        db 20H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0210 _  .......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0218 _ ........
        db 00H, 00H, 00H, 00H, 3CH, 00H, 00H, 00H       ; 0220 _ ....<...
        db 7EH, 00H, 00H, 00H, 33H, 00H, 00H, 00H       ; 0228 _ ~...3...
        db 13H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0230 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0238 _ ........

_ZN12_GLOBAL__N_1L15ShelterWeaknessE:                   ; byte
        db 61H, 00H, 00H, 00H, 15H, 00H, 00H, 00H       ; 0240 _ a.......
        db 1AH, 00H, 00H, 00H, 33H, 00H, 00H, 00H       ; 0248 _ ....3...
        db 57H, 00H, 00H, 00H, 59H, 00H, 00H, 00H       ; 0250 _ W...Y...
        db 63H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0258 _ c.......
        db 78H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0260 _ x.......
        db 1CH, 00H, 00H, 00H, 4CH, 00H, 00H, 00H       ; 0268 _ ....L...
        db 58H, 00H, 00H, 00H, 67H, 00H, 00H, 00H       ; 0270 _ X...g...
        db 68H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0278 _ h.......
        db 65H, 00H, 00H, 00H, 07H, 00H, 00H, 00H       ; 0280 _ e.......
        db 36H, 00H, 00H, 00H, 4EH, 00H, 00H, 00H       ; 0288 _ 6...N...
        db 4DH, 00H, 00H, 00H, 5CH, 00H, 00H, 00H       ; 0290 _ M...\...
        db 65H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0298 _ e.......
        db 50H, 00H, 00H, 00H, 0BH, 00H, 00H, 00H       ; 02A0 _ P.......
        db 2CH, 00H, 00H, 00H, 44H, 00H, 00H, 00H       ; 02A8 _ ,...D...
        db 57H, 00H, 00H, 00H, 5AH, 00H, 00H, 00H       ; 02B0 _ W...Z...
        db 77H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 02B8 _ w.......

ALIGN   16
?_204:                                                  ; oword
        dq 002D0029001F0024H                            ; 02C0 _ 002D0029001F0024 
        dq 0032002900320029H                            ; 02C8 _ 0032002900320029 

?_205:                                                  ; oword
        dq 0032002900320029H                            ; 02D0 _ 0032002900320029 
        dq 001F0024002D0029H                            ; 02D8 _ 001F0024002D0029 

?_206:                                                  ; oword
        dq 001E001C00150018H                            ; 02E0 _ 001E001C00150018 
        dq 0021001C0021001CH                            ; 02E8 _ 0021001C0021001C 

?_207:                                                  ; oword
        dq 0021001C0021001CH                            ; 02F0 _ 0021001C0021001C 
        dq 00150018001E001CH                            ; 02F8 _ 00150018001E001C 

?_208:                                                  ; oword
        dq 00110026000B0022H                            ; 0300 _ 00110026000B0022 
        dq 0013002600130026H                            ; 0308 _ 0013002600130026 

?_209:                                                  ; oword
        dq 0013002600130026H                            ; 0310 _ 0013002600130026 
        dq 000B002200110026H                            ; 0318 _ 000B002200110026 

?_210:                                                  ; oword
        dq 0021002000110010H                            ; 0320 _ 0021002000110010 
        dq 0000000000000000H                            ; 0328 _ 0000000000000000 
        dq 0000000000000000H                            ; 0330 _ 0000000000000000 
        dq 0000000000000000H                            ; 0338 _ 0000000000000000 


SECTION .rdata$zzz align=16 noexecute                   ; section number 27, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr.FileBB align=16 noexecute        ; section number 28, const
;  Communal section not supported by YASM

.refptr.FileBB:                                         ; qword
        dq FileBB                                       ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.InFrontBB align=16 noexecute     ; section number 29, const
;  Communal section not supported by YASM

.refptr.InFrontBB:                                      ; qword
        dq InFrontBB                                    ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.DistanceRingBB align=16 noexecute ; section number 30, const
;  Communal section not supported by YASM

.refptr.DistanceRingBB:                                 ; qword
        dq DistanceRingBB                               ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.SquareBB align=16 noexecute      ; section number 31, const
;  Communal section not supported by YASM

.refptr.SquareBB:                                       ; qword
        dq SquareBB                                     ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.RankBB align=16 noexecute        ; section number 32, const
;  Communal section not supported by YASM

.refptr.RankBB:                                         ; qword
        dq RankBB                                       ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.StepAttacksBB align=16 noexecute ; section number 33, const
;  Communal section not supported by YASM

.refptr.StepAttacksBB:                                  ; qword
        dq StepAttacksBB                                ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.PassedPawnMask align=16 noexecute ; section number 34, const
;  Communal section not supported by YASM

.refptr.PassedPawnMask:                                 ; qword
        dq PassedPawnMask                               ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.ForwardBB align=16 noexecute     ; section number 35, const
;  Communal section not supported by YASM

.refptr.ForwardBB:                                      ; qword
        dq ForwardBB                                    ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.AdjacentFilesBB align=16 noexecute ; section number 36, const
;  Communal section not supported by YASM

.refptr.AdjacentFilesBB:                                ; qword
        dq AdjacentFilesBB                              ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.PawnAttackSpan align=16 noexecute ; section number 37, const
;  Communal section not supported by YASM

.refptr.PawnAttackSpan:                                 ; qword
        dq PawnAttackSpan                               ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


