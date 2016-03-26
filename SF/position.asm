; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\position.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: BMI etc., x64

default rel

global _ZN8Position4initEv: function
global _ZN8Position9parse_setEPKcbP6Thread: function
global _ZN8Position18set_castling_rightE5Color6Square: function
global _ZNK8Position9set_stateEP9StateInfo: function
global _ZN8PositionaSERKS_: function
global _ZNK8Position9print_fenEPc: function
global _Z9print_posPcRK8Position: function
global _ZN8Position4flipEv: function
global PieceValue
global _ZN7Zobrist9exclusionE
global _ZN7Zobrist4sideE
global _ZN7Zobrist8castlingE
global _ZN7Zobrist9enpassantE
global _ZN7Zobrist3psqE
global _ZNK8Position9pos_is_okEPi: function
global _ZN8Position5clearEv: function
global _ZNK8Position12attackers_toE6Squarey: function
global _ZNK8Position14check_blockersE5ColorS0_: function
global _ZNK8Position10game_phaseEv: function
global _ZNK8Position12pseudo_legalE4Move: function
global _ZN9CheckInfoC1ERK8Position: function
global _ZN9CheckInfoC2ERK8Position: function
global _ZNK8Position9key_afterE4Move: function
global _ZN8Position7do_moveE4MoveR9StateInfob: function
global _ZNK8Position7is_drawEv: function
global _ZN8Position9undo_moveE4Move: function
global _ZNK8Position11gives_checkE4MoveRK9CheckInfo: function
global _ZNK8Position5legalE4Movey: function
global _ZNK8Position8see_signE4Move: function
global _ZNK8Position3seeE4Move: function
global _ZN8Position12do_null_moveER9StateInfo: function
global _ZN8Position14undo_null_moveEv: function
global _ZNK8Position13exclusion_keyEv: function
global .refptr.TT
global .refptr.LineBB
global .refptr.BetweenBB
global .refptr.PseudoAttacks
global .refptr.BishopAttacks
global .refptr.RookAttacks
global .refptr.StepAttacksBB
global .refptr.BishopMasks
global .refptr.RookMasks
global .refptr._ZN4PSQT3psqE
global .refptr.SquareBB

extern LineBB                                           ; byte
extern SquareBB                                         ; byte
extern _ZN4PSQT3psqE                                    ; byte
extern RookMasks                                        ; byte
extern BishopMasks                                      ; byte
extern StepAttacksBB                                    ; byte
extern RookAttacks                                      ; byte
extern BishopAttacks                                    ; byte
extern PseudoAttacks                                    ; byte
extern BetweenBB                                        ; byte
extern TT                                               ; byte
extern _Z12print_stringPcPKc                            ; near
extern _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_  ; near
extern memcpy                                           ; near
extern _Z9parse_intPKcRi                                ; near
extern memset                                           ; near


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_ZN8Position4initEv:
        push    rsi                                     ; 0000 _ 56
        push    rbx                                     ; 0001 _ 53
        lea     rbx, [rel _ZN7Zobrist3psqE]             ; 0002 _ 48: 8D. 1D, 00000100(rel)
        xor     esi, esi                                ; 0009 _ 31. F6
        mov     eax, 1070372                            ; 000B _ B8, 00105524
        mov     r9, qword 2545F4914F6CDD1DH             ; 0010 _ 49: B9, 2545F4914F6CDD1D
?_001:  lea     r11, [rsi+200H]                         ; 001A _ 4C: 8D. 9E, 00000200
        xor     r10d, r10d                              ; 0021 _ 45: 31. D2
?_002:  lea     r8, [r11+r10]                           ; 0024 _ 4F: 8D. 04 13
        xor     ecx, ecx                                ; 0028 _ 31. C9
        add     r8, rbx                                 ; 002A _ 49: 01. D8
?_003:  mov     rdx, rax                                ; 002D _ 48: 89. C2
        shr     rdx, 12                                 ; 0030 _ 48: C1. EA, 0C
        xor     rax, rdx                                ; 0034 _ 48: 31. D0
        mov     rdx, rax                                ; 0037 _ 48: 89. C2
        shl     rdx, 25                                 ; 003A _ 48: C1. E2, 19
        xor     rax, rdx                                ; 003E _ 48: 31. D0
        mov     rdx, rax                                ; 0041 _ 48: 89. C2
        shr     rdx, 27                                 ; 0044 _ 48: C1. EA, 1B
        xor     rax, rdx                                ; 0048 _ 48: 31. D0
        mov     rdx, rax                                ; 004B _ 48: 89. C2
        imul    rdx, r9                                 ; 004E _ 49: 0F AF. D1
        mov     qword [r8+rcx*8], rdx                   ; 0052 _ 49: 89. 14 C8
        add     rcx, 1                                  ; 0056 _ 48: 83. C1, 01
        cmp     rcx, 64                                 ; 005A _ 48: 83. F9, 40
        jnz     ?_003                                   ; 005E _ 75, CD
        add     r10, 512                                ; 0060 _ 49: 81. C2, 00000200
        cmp     r10, 3072                               ; 0067 _ 49: 81. FA, 00000C00
        jnz     ?_002                                   ; 006E _ 75, B4
        add     rsi, 4096                               ; 0070 _ 48: 81. C6, 00001000
        cmp     rsi, 8192                               ; 0077 _ 48: 81. FE, 00002000
        jnz     ?_001                                   ; 007E _ 75, 9A
        lea     r11, [rel _ZN7Zobrist9enpassantE]       ; 0080 _ 4C: 8D. 1D, 000000C0(rel)
        xor     r10d, r10d                              ; 0087 _ 45: 31. D2
        mov     rcx, qword 2545F4914F6CDD1DH            ; 008A _ 48: B9, 2545F4914F6CDD1D
?_004:  mov     r8, rax                                 ; 0094 _ 49: 89. C0
        shr     r8, 12                                  ; 0097 _ 49: C1. E8, 0C
        xor     rax, r8                                 ; 009B _ 4C: 31. C0
        mov     rbx, rax                                ; 009E _ 48: 89. C3
        shl     rbx, 25                                 ; 00A1 _ 48: C1. E3, 19
        xor     rax, rbx                                ; 00A5 _ 48: 31. D8
        mov     rsi, rax                                ; 00A8 _ 48: 89. C6
        shr     rsi, 27                                 ; 00AB _ 48: C1. EE, 1B
        xor     rax, rsi                                ; 00AF _ 48: 31. F0
        mov     r9, rax                                 ; 00B2 _ 49: 89. C1
        imul    r9, rcx                                 ; 00B5 _ 4C: 0F AF. C9
        mov     qword [r11+r10], r9                     ; 00B9 _ 4F: 89. 0C 13
        add     r10, 8                                  ; 00BD _ 49: 83. C2, 08
        cmp     r10, 64                                 ; 00C1 _ 49: 83. FA, 40
        jnz     ?_004                                   ; 00C5 _ 75, CD
        lea     rcx, [rel _ZN7Zobrist8castlingE]        ; 00C7 _ 48: 8D. 0D, 00000040(rel)
        xor     esi, esi                                ; 00CE _ 31. F6
        mov     r11d, 1                                 ; 00D0 _ 41: BB, 00000001
        mov     rbx, qword 2545F4914F6CDD1DH            ; 00D6 _ 48: BB, 2545F4914F6CDD1D
?_005:  lea     r10, [rsi*8]                            ; 00E0 _ 4C: 8D. 14 F5, 00000000
        mov     qword [rcx+rsi*8], 0                    ; 00E8 _ 48: C7. 04 F1, 00000000
        mov     rdx, rsi                                ; 00F0 _ 48: 89. F2
?_006:  test    rdx, rdx                                ; 00F3 _ 48: 85. D2
        jz      ?_008                                   ; 00F6 _ 74, 1D
        bsf     r8, rdx                                 ; 00F8 _ 4C: 0F BC. C2
        shlx    r9, r11, r8                             ; 00FC _ C4 42 B9: F7. CB
        mov     r9, qword [rcx+r9*8]                    ; 0101 _ 4E: 8B. 0C C9
        blsr    rdx, rdx                                ; 0105 _ C4 E2 E8: F3. CA
        test    r9, r9                                  ; 010A _ 4D: 85. C9
        jz      ?_009                                   ; 010D _ 74, 72
?_007:  xor     qword [rcx+r10], r9                     ; 010F _ 4E: 31. 0C 11
        jmp     ?_006                                   ; 0113 _ EB, DE

?_008:  add     rsi, 1                                  ; 0115 _ 48: 83. C6, 01
        cmp     rsi, 16                                 ; 0119 _ 48: 83. FE, 10
        jnz     ?_005                                   ; 011D _ 75, C1
        mov     r8, qword 2545F4914F6CDD1DH             ; 011F _ 49: B8, 2545F4914F6CDD1D
        mov     rdx, rax                                ; 0129 _ 48: 89. C2
        shr     rdx, 12                                 ; 012C _ 48: C1. EA, 0C
        xor     rax, rdx                                ; 0130 _ 48: 31. D0
        mov     r10, rax                                ; 0133 _ 49: 89. C2
        shl     r10, 25                                 ; 0136 _ 49: C1. E2, 19
        xor     rax, r10                                ; 013A _ 4C: 31. D0
        mov     r11, rax                                ; 013D _ 49: 89. C3
        shr     r11, 27                                 ; 0140 _ 49: C1. EB, 1B
        xor     rax, r11                                ; 0144 _ 4C: 31. D8
        mov     rbx, rax                                ; 0147 _ 48: 89. C3
        mov     rcx, rax                                ; 014A _ 48: 89. C1
        imul    rcx, r8                                 ; 014D _ 49: 0F AF. C8
        shr     rbx, 12                                 ; 0151 _ 48: C1. EB, 0C
        xor     rax, rbx                                ; 0155 _ 48: 31. D8
        mov     rsi, rax                                ; 0158 _ 48: 89. C6
        shl     rsi, 25                                 ; 015B _ 48: C1. E6, 19
        xor     rax, rsi                                ; 015F _ 48: 31. F0
        mov     r9, rax                                 ; 0162 _ 49: 89. C1
        mov     qword [rel _ZN7Zobrist4sideE], rcx      ; 0165 _ 48: 89. 0D, 00000008(rel)
        shr     r9, 27                                  ; 016C _ 49: C1. E9, 1B
        xor     rax, r9                                 ; 0170 _ 4C: 31. C8
        imul    rax, r8                                 ; 0173 _ 49: 0F AF. C0
        mov     qword [rel _ZN7Zobrist9exclusionE], rax ; 0177 _ 48: 89. 05, 00000000(rel)
        pop     rbx                                     ; 017E _ 5B
        pop     rsi                                     ; 017F _ 5E
        ret                                             ; 0180 _ C3

?_009:  ; Local function
        mov     r8, rax                                 ; 0181 _ 49: 89. C0
        shr     r8, 12                                  ; 0184 _ 49: C1. E8, 0C
        xor     rax, r8                                 ; 0188 _ 4C: 31. C0
        mov     r9, rax                                 ; 018B _ 49: 89. C1
        shl     r9, 25                                  ; 018E _ 49: C1. E1, 19
        xor     rax, r9                                 ; 0192 _ 4C: 31. C8
        mov     r8, rax                                 ; 0195 _ 49: 89. C0
        shr     r8, 27                                  ; 0198 _ 49: C1. E8, 1B
        xor     rax, r8                                 ; 019C _ 4C: 31. C0
        mov     r9, rax                                 ; 019F _ 49: 89. C1
        imul    r9, rbx                                 ; 01A2 _ 4C: 0F AF. CB
        jmp     ?_007                                   ; 01A6 _ E9, FFFFFF64

        nop                                             ; 01AB _ 90
; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_ZN8Position9parse_setEPKcbP6Thread:; Function begin
        push    r12                                     ; 01B0 _ 41: 54
        push    rbp                                     ; 01B2 _ 55
        push    rdi                                     ; 01B3 _ 57
        push    rsi                                     ; 01B4 _ 56
        push    rbx                                     ; 01B5 _ 53
        sub     rsp, 32                                 ; 01B6 _ 48: 83. EC, 20
        mov     rbp, rcx                                ; 01BA _ 48: 89. CD
        mov     r12, rdx                                ; 01BD _ 49: 89. D4
        mov     esi, r8d                                ; 01C0 _ 44: 89. C6
        xor     edx, edx                                ; 01C3 _ 31. D2
        mov     r8d, 968                                ; 01C5 _ 41: B8, 000003C8
        mov     rdi, r9                                 ; 01CB _ 4C: 89. CF
        call    memset                                  ; 01CE _ E8, 00000000(rel)
        lea     rax, [rbp+350H]                         ; 01D3 _ 48: 8D. 85, 00000350
        mov     qword [rbp+378H], 64                    ; 01DA _ 48: C7. 85, 00000378, 00000040
        mov     qword [rbp+3B8H], rax                   ; 01E5 _ 48: 89. 85, 000003B8
        cmp     byte [r12], 32                          ; 01EC _ 41: 80. 3C 24, 20
        je      .text.unlikely+26H                      ; 01F1 _ 0F 84, 00000026(rel)
        mov     r9, qword [rel .refptr.SquareBB]        ; 01F7 _ 4C: 8B. 0D, 00000000(rel)
        mov     edx, 56                                 ; 01FE _ BA, 00000038
?_010:  add     r12, 1                                  ; 0203 _ 49: 83. C4, 01
        movzx   r11d, byte [r12-1H]                     ; 0207 _ 45: 0F B6. 5C 24, FF
        cmp     r11b, 32                                ; 020D _ 41: 80. FB, 20
        jbe     ?_015                                   ; 0211 _ 0F 86, 00000090
        lea     r10d, [r11-30H]                         ; 0217 _ 45: 8D. 53, D0
        cmp     r10b, 8                                 ; 021B _ 41: 80. FA, 08
        jbe     ?_013                                   ; 021F _ 76, 6E
        cmp     r11b, 47                                ; 0221 _ 41: 80. FB, 2F
        jz      ?_014                                   ; 0225 _ 74, 75
        lea     rbx, [rel _ZN12_GLOBAL__N_1L11PieceToCharE]; 0227 _ 48: 8D. 1D, 00000060(rel)
        mov     eax, 1                                  ; 022E _ B8, 00000001
        jmp     ?_012                                   ; 0233 _ EB, 0A

?_011:  add     rax, 1                                  ; 0235 _ 48: 83. C0, 01
        cmp     rax, 15                                 ; 0239 _ 48: 83. F8, 0F
        jz      ?_010                                   ; 023D _ 74, C4
?_012:  movsx   ecx, byte [rbx+rax]                     ; 023F _ 0F BE. 0C 03
        cmp     r11d, ecx                               ; 0243 _ 41: 39. CB
        jnz     ?_011                                   ; 0246 _ 75, ED
        mov     ecx, eax                                ; 0248 _ 89. C1
        mov     r8d, eax                                ; 024A _ 41: 89. C0
        shr     ecx, 3                                  ; 024D _ C1. E9, 03
        and     r8d, 07H                                ; 0250 _ 41: 83. E0, 07
        lea     r10d, [rcx*8]                           ; 0254 _ 44: 8D. 14 CD, 00000000
        or      r10d, r8d                               ; 025C _ 45: 09. C2
        mov     dword [rbp+rdx*4], r10d                 ; 025F _ 44: 89. 54 95, 00
        mov     r10, qword [r9+rdx*8]                   ; 0264 _ 4D: 8B. 14 D1
        or      qword [rbp+100H], r10                   ; 0268 _ 4C: 09. 95, 00000100
        mov     r10, qword [r9+rdx*8]                   ; 026F _ 4D: 8B. 14 D1
        or      qword [rbp+r8*8+100H], r10              ; 0273 _ 4E: 09. 94 C5, 00000100
        mov     r8, qword [r9+rdx*8]                    ; 027B _ 4D: 8B. 04 D1
        add     edx, 1                                  ; 027F _ 83. C2, 01
        or      qword [rbp+rcx*8+140H], r8              ; 0282 _ 4C: 09. 84 CD, 00000140
        movsxd  rdx, edx                                ; 028A _ 48: 63. D2
        jmp     ?_011                                   ; 028D _ EB, A6

?_013:  lea     r11d, [r11+rdx-30H]                     ; 028F _ 45: 8D. 5C 13, D0
        movsxd  rdx, r11d                               ; 0294 _ 49: 63. D3
        jmp     ?_010                                   ; 0297 _ E9, FFFFFF67

?_014:  sub     edx, 16                                 ; 029C _ 83. EA, 10
        movsxd  rdx, edx                                ; 029F _ 48: 63. D2
        jmp     ?_010                                   ; 02A2 _ E9, FFFFFF5C
; _ZN8Position9parse_setEPKcbP6Thread End of function

?_015:  ; Local function
        movzx   edx, byte [r12]                         ; 02A7 _ 41: 0F B6. 14 24
        add     r12, 1                                  ; 02AC _ 49: 83. C4, 01
        cmp     dl, 32                                  ; 02B0 _ 80. FA, 20
        je      .text.unlikely+21H                      ; 02B3 _ 0F 84, 00000021(rel)
        cmp     dl, 119                                 ; 02B9 _ 80. FA, 77
        setne   cl                                      ; 02BC _ 0F 95. C1
        movzx   ebx, cl                                 ; 02BF _ 0F B6. D9
        mov     dword [rbp+3ACH], ebx                   ; 02C2 _ 89. 9D, 000003AC
?_016:  cmp     byte [r12], 32                          ; 02C8 _ 41: 80. 3C 24, 20
        jnz     ?_019                                   ; 02CD _ 75, 20
        add     r12, 1                                  ; 02CF _ 49: 83. C4, 01
        jmp     ?_016                                   ; 02D3 _ EB, F3

?_017:  imul    r9d, edx, 56                            ; 02D5 _ 44: 6B. CA, 38
        movsxd  r8, r9d                                 ; 02D9 _ 4D: 63. C1
        cmp     dword [rbp+r8*4], ecx                   ; 02DC _ 42: 39. 4C 85, 00
        jne     ?_029                                   ; 02E1 _ 0F 85, 00000195
?_018:  mov     rcx, rbp                                ; 02E7 _ 48: 89. E9
        call    _ZN8Position18set_castling_rightE5Color6Square; 02EA _ E8, 000001B1
?_019:  add     r12, 1                                  ; 02EF _ 49: 83. C4, 01
        movzx   r9d, byte [r12-1H]                      ; 02F3 _ 45: 0F B6. 4C 24, FF
        cmp     r9b, 32                                 ; 02F9 _ 41: 80. F9, 20
        jbe     ?_021                                   ; 02FD _ 76, 46
        lea     eax, [r9-61H]                           ; 02FF _ 41: 8D. 41, 9F
        xor     edx, edx                                ; 0303 _ 31. D2
        cmp     al, 25                                  ; 0305 _ 3C, 19
        jbe     ?_027                                   ; 0307 _ 0F 86, 00000149
?_020:  lea     ecx, [rdx*8]                            ; 030D _ 8D. 0C D5, 00000000
        or      ecx, 04H                                ; 0314 _ 83. C9, 04
        cmp     r9b, 75                                 ; 0317 _ 41: 80. F9, 4B
        je      ?_028                                   ; 031B _ 0F 84, 00000140
        cmp     r9b, 81                                 ; 0321 _ 41: 80. F9, 51
        jz      ?_017                                   ; 0325 _ 74, AE
        lea     r11d, [r9-41H]                          ; 0327 _ 45: 8D. 59, BF
        cmp     r11b, 7                                 ; 032B _ 41: 80. FB, 07
        ja      ?_019                                   ; 032F _ 77, BE
        imul    r8d, edx, 7                             ; 0331 _ 44: 6B. C2, 07
        movzx   ebx, r9b                                ; 0335 _ 41: 0F B6. D9
        sub     ebx, 65                                 ; 0339 _ 83. EB, 41
        shl     r8d, 3                                  ; 033C _ 41: C1. E0, 03
        or      r8d, ebx                                ; 0340 _ 41: 09. D8
        jmp     ?_018                                   ; 0343 _ EB, A2

?_021:  movzx   r8d, byte [r12]                         ; 0345 _ 45: 0F B6. 04 24
        cmp     r8b, 32                                 ; 034A _ 41: 80. F8, 20
        je      .text.unlikely+18H                      ; 034E _ 0F 84, 00000018(rel)
        lea     r10d, [r8-61H]                          ; 0354 _ 45: 8D. 50, 9F
        cmp     r10b, 7                                 ; 0358 _ 41: 80. FA, 07
        ja      ?_030                                   ; 035C _ 0F 87, 0000011F
        movzx   eax, byte [r12+1H]                      ; 0362 _ 41: 0F B6. 44 24, 01
        lea     rbx, [r12+2H]                           ; 0368 _ 49: 8D. 5C 24, 02
        mov     r12, qword [rbp+3B8H]                   ; 036D _ 4C: 8B. A5, 000003B8
        test    al, al                                  ; 0374 _ 84. C0
        jz      ?_023                                   ; 0376 _ 74, 4E
        cmp     al, 54                                  ; 0378 _ 3C, 36
        jz      ?_022                                   ; 037A _ 74, 04
        cmp     al, 51                                  ; 037C _ 3C, 33
        jnz     ?_023                                   ; 037E _ 75, 46
?_022:  lea     edx, [rax*8-188H]                       ; 0380 _ 8D. 14 C5, FFFFFE78
        sub     r8d, 97                                 ; 0387 _ 41: 83. E8, 61
        mov     rcx, rbp                                ; 038B _ 48: 89. E9
        or      edx, r8d                                ; 038E _ 44: 09. C2
        mov     r8, qword [rbp+100H]                    ; 0391 _ 4C: 8B. 85, 00000100
        mov     qword [r12+28H], rdx                    ; 0398 _ 49: 89. 54 24, 28
        call    _ZNK8Position12attackers_toE6Squarey    ; 039D _ E8, 00000000(rel)
        movsxd  r11, dword [rbp+3ACH]                   ; 03A2 _ 4C: 63. 9D, 000003AC
        mov     rdx, qword [rbp+r11*8+140H]             ; 03A9 _ 4A: 8B. 94 DD, 00000140
        and     rdx, qword [rbp+108H]                   ; 03B1 _ 48: 23. 95, 00000108
        test    rdx, rax                                ; 03B8 _ 48: 85. C2
        jnz     ?_023                                   ; 03BB _ 75, 09
        mov     qword [r12+28H], 64                     ; 03BD _ 49: C7. 44 24, 28, 00000040
?_023:  cmp     byte [rbx], 32                          ; 03C6 _ 80. 3B, 20
        jz      ?_025                                   ; 03C9 _ 74, 18
        lea     rdx, [r12+1CH]                          ; 03CB _ 49: 8D. 54 24, 1C
        mov     rcx, rbx                                ; 03D0 _ 48: 89. D9
        call    _Z9parse_intPKcRi                       ; 03D3 _ E8, 00000000(rel)
?_024:  cmp     byte [rax], 32                          ; 03D8 _ 80. 38, 20
        jnz     ?_026                                   ; 03DB _ 75, 0C
        add     rax, 1                                  ; 03DD _ 48: 83. C0, 01
        jmp     ?_024                                   ; 03E1 _ EB, F5

?_025:  add     rbx, 1                                  ; 03E3 _ 48: 83. C3, 01
        jmp     ?_023                                   ; 03E7 _ EB, DD

?_026:  lea     rdx, [rbp+3A8H]                         ; 03E9 _ 48: 8D. 95, 000003A8
        mov     rcx, rax                                ; 03F0 _ 48: 89. C1
        call    _Z9parse_intPKcRi                       ; 03F3 _ E8, 00000000(rel)
        mov     ecx, dword [rbp+3A8H]                   ; 03F8 _ 8B. 8D, 000003A8
        xor     r9d, r9d                                ; 03FE _ 45: 31. C9
        mov     r10d, 0                                 ; 0401 _ 41: BA, 00000000
        cmp     dword [rbp+3ACH], 1                     ; 0407 _ 83. BD, 000003AC, 01
        mov     rbx, rax                                ; 040E _ 48: 89. C3
        mov     byte [rbp+3C0H], sil                    ; 0411 _ 40: 88. B5, 000003C0
        mov     rdx, qword [rbp+3B8H]                   ; 0418 _ 48: 8B. 95, 000003B8
        mov     qword [rbp+3B0H], rdi                   ; 041F _ 48: 89. BD, 000003B0
        lea     r8d, [rcx+rcx-2H]                       ; 0426 _ 44: 8D. 44 09, FE
        mov     rcx, rbp                                ; 042B _ 48: 89. E9
        sete    r9b                                     ; 042E _ 41: 0F 94. C1
        test    r8d, r8d                                ; 0432 _ 45: 85. C0
        cmovs   r8d, r10d                               ; 0435 _ 45: 0F 48. C2
        add     r8d, r9d                                ; 0439 _ 45: 01. C8
        mov     dword [rbp+3A8H], r8d                   ; 043C _ 44: 89. 85, 000003A8
        call    _ZNK8Position9set_stateEP9StateInfo     ; 0443 _ E8, 00000168
        mov     rax, rbx                                ; 0448 _ 48: 89. D8
        add     rsp, 32                                 ; 044B _ 48: 83. C4, 20
        pop     rbx                                     ; 044F _ 5B
        pop     rsi                                     ; 0450 _ 5E
        pop     rdi                                     ; 0451 _ 5F
        pop     rbp                                     ; 0452 _ 5D
        pop     r12                                     ; 0453 _ 41: 5C
        ret                                             ; 0455 _ C3

?_027:  sub     r9d, 32                                 ; 0456 _ 41: 83. E9, 20
        mov     dl, 1                                   ; 045A _ B2, 01
        jmp     ?_020                                   ; 045C _ E9, FFFFFEAC

?_028:  imul    r8d, edx, 56                            ; 0461 _ 44: 6B. C2, 38
        xor     r8d, 07H                                ; 0465 _ 41: 83. F0, 07
        movsxd  r8, r8d                                 ; 0469 _ 4D: 63. C0
        cmp     dword [rbp+r8*4], ecx                   ; 046C _ 42: 39. 4C 85, 00
        je      ?_018                                   ; 0471 _ 0F 84, FFFFFE70
        jmp     .text.unlikely+0CH                      ; 0477 _ E9, 0000000C(rel)

?_029:  jmp     _ZN8Position9parse_setEPKcbP6Thread.cold.19; 047C _ E9, 00000000(rel)

?_030:  ; Local function
        lea     rbx, [r12+1H]                           ; 0481 _ 49: 8D. 5C 24, 01
        mov     r12, qword [rbp+3B8H]                   ; 0486 _ 4C: 8B. A5, 000003B8
        jmp     ?_023                                   ; 048D _ E9, FFFFFF34

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH
;       db 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZN8Position18set_castling_rightE5Color6Square:; Function begin
        push    rbx                                     ; 04A0 _ 53
        mov     eax, edx                                ; 04A1 _ 89. D0
        mov     r9, qword [rcx+rax*8+140H]              ; 04A3 _ 4C: 8B. 8C C1, 00000140
        mov     eax, 1                                  ; 04AB _ B8, 00000001
        and     r9, qword [rcx+130H]                    ; 04B0 _ 4C: 23. 89, 00000130
        bsf     r9, r9                                  ; 04B7 _ 4D: 0F BC. C9
        cmp     r8, r9                                  ; 04BB _ 4D: 39. C8
        setbe   r10b                                    ; 04BE _ 41: 0F 96. C2
        movzx   ebx, r10b                               ; 04C2 _ 41: 0F B6. DA
        lea     r11d, [rbx+rdx*2]                       ; 04C6 _ 44: 8D. 1C 53
        mov     rbx, qword [rcx+3B8H]                   ; 04CA _ 48: 8B. 99, 000003B8
; Note: Prefix bit or byte has no meaning in this context
        shlx    eax, eax, r11d                          ; 04D1 _ C4 E2 21: F7. C0
        or      dword [rbx+18H], eax                    ; 04D6 _ 09. 43, 18
        or      dword [rcx+r9*4+150H], eax              ; 04D9 _ 42: 09. 84 89, 00000150
        or      dword [rcx+r8*4+150H], eax              ; 04E1 _ 42: 09. 84 81, 00000150
        cdqe                                            ; 04E9 _ 48: 98
        test    r10b, r10b                              ; 04EB _ 45: 84. D2
        lea     r11, [rcx+rax*8]                        ; 04EE _ 4C: 8D. 1C C1
        mov     qword [r11+250H], r8                    ; 04F2 _ 4D: 89. 83, 00000250
        jne     ?_038                                   ; 04F9 _ 0F 85, 00000090
        imul    r10d, edx, 56                           ; 04FF _ 44: 6B. D2, 38
        mov     eax, 5                                  ; 0503 _ B8, 00000005
        movsxd  rcx, r10d                               ; 0508 _ 49: 63. CA
        xor     r10d, 06H                               ; 050B _ 41: 83. F2, 06
        movsxd  rdx, r10d                               ; 050F _ 49: 63. D2
?_031:  xor     rcx, rax                                ; 0512 _ 48: 31. C1
        mov     rbx, qword [rel .refptr.SquareBB]       ; 0515 _ 48: 8B. 1D, 00000000(rel)
        mov     rax, r8                                 ; 051C _ 4C: 89. C0
        cmp     rcx, r8                                 ; 051F _ 4C: 39. C1
        cmovbe  rax, rcx                                ; 0522 _ 48: 0F 46. C1
?_032:  cmp     rcx, r8                                 ; 0526 _ 4C: 39. C1
        mov     r10, r8                                 ; 0529 _ 4D: 89. C2
        cmovnc  r10, rcx                                ; 052C _ 4C: 0F 43. D1
        cmp     rax, r10                                ; 0530 _ 4C: 39. D0
        ja      ?_034                                   ; 0533 _ 77, 1C
        cmp     rax, r9                                 ; 0535 _ 4C: 39. C8
        jz      ?_033                                   ; 0538 _ 74, 10
        cmp     rax, r8                                 ; 053A _ 4C: 39. C0
        jz      ?_033                                   ; 053D _ 74, 0B
        mov     r10, qword [rbx+rax*8]                  ; 053F _ 4C: 8B. 14 C3
        or      qword [r11+2D0H], r10                   ; 0543 _ 4D: 09. 93, 000002D0
?_033:  add     eax, 1                                  ; 054A _ 83. C0, 01
        cdqe                                            ; 054D _ 48: 98
        jmp     ?_032                                   ; 054F _ EB, D5

?_034:  mov     r10, qword [rel .refptr.SquareBB]       ; 0551 _ 4C: 8B. 15, 00000000(rel)
        cmp     rdx, r9                                 ; 0558 _ 4C: 39. CA
        mov     rax, r9                                 ; 055B _ 4C: 89. C8
        cmovbe  rax, rdx                                ; 055E _ 48: 0F 46. C2
?_035:  cmp     rdx, r9                                 ; 0562 _ 4C: 39. CA
        mov     rbx, r9                                 ; 0565 _ 4C: 89. CB
        cmovnc  rbx, rdx                                ; 0568 _ 48: 0F 43. DA
        cmp     rbx, rax                                ; 056C _ 48: 39. C3
        jc      ?_037                                   ; 056F _ 72, 1C
        cmp     r9, rax                                 ; 0571 _ 49: 39. C1
        jz      ?_036                                   ; 0574 _ 74, 10
        cmp     r8, rax                                 ; 0576 _ 49: 39. C0
        jz      ?_036                                   ; 0579 _ 74, 0B
        mov     rcx, qword [r10+rax*8]                  ; 057B _ 49: 8B. 0C C2
        or      qword [r11+2D0H], rcx                   ; 057F _ 49: 09. 8B, 000002D0
?_036:  add     eax, 1                                  ; 0586 _ 83. C0, 01
        cdqe                                            ; 0589 _ 48: 98
        jmp     ?_035                                   ; 058B _ EB, D5

?_037:  pop     rbx                                     ; 058D _ 5B
        ret                                             ; 058E _ C3
; _ZN8Position18set_castling_rightE5Color6Square End of function

?_038:  ; Local function
        imul    edx, edx, 56                            ; 058F _ 6B. D2, 38
        mov     eax, 3                                  ; 0592 _ B8, 00000003
        movsxd  rcx, edx                                ; 0597 _ 48: 63. CA
        xor     edx, 02H                                ; 059A _ 83. F2, 02
        movsxd  rdx, edx                                ; 059D _ 48: 63. D2
        jmp     ?_031                                   ; 05A0 _ E9, FFFFFF6D

        nop                                             ; 05A5 _ 90
; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

_ZNK8Position9set_stateEP9StateInfo:; Function begin
        push    rbp                                     ; 05B0 _ 55
        push    rdi                                     ; 05B1 _ 57
        push    rsi                                     ; 05B2 _ 56
        push    rbx                                     ; 05B3 _ 53
        sub     rsp, 40                                 ; 05B4 _ 48: 83. EC, 28
        mov     eax, dword [rcx+3ACH]                   ; 05B8 _ 8B. 81, 000003AC
        mov     r8, qword [rcx+100H]                    ; 05BE _ 4C: 8B. 81, 00000100
        mov     qword [rdx], 0                          ; 05C5 _ 48: C7. 02, 00000000
        mov     rdi, rax                                ; 05CC _ 48: 89. C7
        mov     rsi, rcx                                ; 05CF _ 48: 89. CE
        mov     rbx, rdx                                ; 05D2 _ 48: 89. D3
        mov     qword [rdx+8H], 0                       ; 05D5 _ 48: C7. 42, 08, 00000000
        mov     qword [rdx+30H], 0                      ; 05DD _ 48: C7. 42, 30, 00000000
        mov     dword [rdx+14H], 0                      ; 05E5 _ C7. 42, 14, 00000000
        mov     dword [rdx+10H], 0                      ; 05EC _ C7. 42, 10, 00000000
        mov     dword [rdx+24H], 0                      ; 05F3 _ C7. 42, 24, 00000000
        mov     rdx, qword [rcx+rax*8+140H]             ; 05FA _ 48: 8B. 94 C1, 00000140
        and     rdx, qword [rcx+130H]                   ; 0602 _ 48: 23. 91, 00000130
        bsf     rdx, rdx                                ; 0609 _ 48: 0F BC. D2
        call    _ZNK8Position12attackers_toE6Squarey    ; 060D _ E8, 00000000(rel)
        mov     ecx, edi                                ; 0612 _ 89. F9
        mov     r11, qword [rel .refptr._ZN4PSQT3psqE]  ; 0614 _ 4C: 8B. 1D, 00000000(rel)
        xor     ecx, 01H                                ; 061B _ 83. F1, 01
        movsxd  rbp, ecx                                ; 061E _ 48: 63. E9
        and     rax, qword [rsi+rbp*8+140H]             ; 0621 _ 48: 23. 84 EE, 00000140
        lea     rcx, [rel _ZN7Zobrist3psqE]             ; 0629 _ 48: 8D. 0D, 00000100(rel)
        mov     qword [rbx+38H], rax                    ; 0630 _ 48: 89. 43, 38
        mov     r10, qword [rsi+100H]                   ; 0634 _ 4C: 8B. 96, 00000100
        jmp     ?_040                                   ; 063B _ EB, 35

?_039:  bsf     rbp, r10                                ; 063D _ 49: 0F BC. EA
        mov     r8d, dword [rsi+rbp*4]                  ; 0641 _ 44: 8B. 04 AE
        blsr    r10, r10                                ; 0645 _ C4 C2 A8: F3. CA
        mov     edx, r8d                                ; 064A _ 44: 89. C2
        and     r8d, 07H                                ; 064D _ 41: 83. E0, 07
        shr     edx, 3                                  ; 0651 _ C1. EA, 03
        movsxd  rax, edx                                ; 0654 _ 48: 63. C2
        lea     r9, [r8+rax*8]                          ; 0657 _ 4D: 8D. 0C C0
        shl     r9, 6                                   ; 065B _ 49: C1. E1, 06
        add     r9, rbp                                 ; 065F _ 49: 01. E9
        mov     rbp, qword [rcx+r9*8]                   ; 0662 _ 4A: 8B. 2C C9
        mov     r8d, dword [r11+r9*4]                   ; 0666 _ 47: 8B. 04 8B
        xor     qword [rbx+30H], rbp                    ; 066A _ 48: 31. 6B, 30
        add     dword [rbx+24H], r8d                    ; 066E _ 44: 01. 43, 24
?_040:  test    r10, r10                                ; 0672 _ 4D: 85. D2
        jnz     ?_039                                   ; 0675 _ 75, C6
        mov     r8, qword [rbx+28H]                     ; 0677 _ 4C: 8B. 43, 28
        cmp     r8, 64                                  ; 067B _ 49: 83. F8, 40
        jne     _ZNK8Position9set_stateEP9StateInfo.cold.20; 067F _ 0F 85, 00000030(rel)
        sub     edi, 1                                  ; 0685 _ 83. EF, 01
        je      ?_050                                   ; 0688 _ 0F 84, 000000EB
?_041:  movsxd  r11, dword [rbx+18H]                    ; 068E _ 4C: 63. 5B, 18
        lea     rax, [rel _ZN7Zobrist8castlingE]        ; 0692 _ 48: 8D. 05, 00000040(rel)
        mov     rdx, qword [rax+r11*8]                  ; 0699 _ 4A: 8B. 14 D8
        xor     qword [rbx+30H], rdx                    ; 069D _ 48: 31. 53, 30
        mov     rdx, qword [rsi+108H]                   ; 06A1 _ 48: 8B. 96, 00000108
        jmp     ?_043                                   ; 06A8 _ EB, 26

?_042:  bsf     r8, rdx                                 ; 06AA _ 4C: 0F BC. C2
        mov     eax, 3                                  ; 06AE _ B8, 00000003
        shrx    eax, dword [rsi+r8*4], eax              ; 06B3 _ C4 A2 7B: F7. 04 86
        cdqe                                            ; 06B9 _ 48: 98
        blsr    rdx, rdx                                ; 06BB _ C4 E2 E8: F3. CA
        shl     rax, 9                                  ; 06C0 _ 48: C1. E0, 09
        lea     rdi, [r8+rax+40H]                       ; 06C4 _ 49: 8D. 7C 00, 40
        mov     r9, qword [rcx+rdi*8]                   ; 06C9 _ 4C: 8B. 0C F9
        xor     qword [rbx], r9                         ; 06CD _ 4C: 31. 0B
?_043:  test    rdx, rdx                                ; 06D0 _ 48: 85. D2
        jnz     ?_042                                   ; 06D3 _ 75, D5
        xor     ebp, ebp                                ; 06D5 _ 31. ED
?_044:  mov     rdi, qword [rsi+rbp+140H]               ; 06D7 _ 48: 8B. BC 2E, 00000140
        xor     r9d, r9d                                ; 06DF _ 45: 31. C9
        lea     r11, [rbp*8+8H]                         ; 06E2 _ 4C: 8D. 1C ED, 00000008
?_045:  lea     rdx, [r11+r9]                           ; 06EA _ 4B: 8D. 14 0B
        mov     r8, rdi                                 ; 06EE _ 49: 89. F8
        and     r8, qword [rsi+r9+108H]                 ; 06F1 _ 4E: 23. 84 0E, 00000108
        xor     eax, eax                                ; 06F9 _ 31. C0
        shl     rdx, 6                                  ; 06FB _ 48: C1. E2, 06
        add     rdx, rcx                                ; 06FF _ 48: 01. CA
        popcnt  r8, r8                                  ; 0702 _ F3 4D: 0F B8. C0
?_046:  cmp     r8d, eax                                ; 0707 _ 41: 39. C0
        jle     ?_047                                   ; 070A _ 7E, 0E
        mov     r10, qword [rdx+rax*8]                  ; 070C _ 4C: 8B. 14 C2
        add     rax, 1                                  ; 0710 _ 48: 83. C0, 01
        xor     qword [rbx+8H], r10                     ; 0714 _ 4C: 31. 53, 08
        jmp     ?_046                                   ; 0718 _ EB, ED

?_047:  add     r9, 8                                   ; 071A _ 49: 83. C1, 08
        cmp     r9, 48                                  ; 071E _ 49: 83. F9, 30
        jnz     ?_045                                   ; 0722 _ 75, C6
        add     rbp, 8                                  ; 0724 _ 48: 83. C5, 08
        cmp     rbp, 16                                 ; 0728 _ 48: 83. FD, 10
        jnz     ?_044                                   ; 072C _ 75, A9
        lea     rdi, [rel ?_065]                        ; 072E _ 48: 8D. 3D, 00000008(rel)
        xor     ecx, ecx                                ; 0735 _ 31. C9
?_048:  mov     rbp, qword [rsi+rcx*2+140H]             ; 0737 _ 48: 8B. AC 4E, 00000140
        xor     r10d, r10d                              ; 073F _ 45: 31. D2
?_049:  mov     r9, rbp                                 ; 0742 _ 49: 89. E9
        and     r9, qword [rsi+r10*2+110H]              ; 0745 _ 4E: 23. 8C 56, 00000110
        popcnt  r11, r9                                 ; 074D _ F3 4D: 0F B8. D9
        imul    r11d, dword [rdi+r10]                   ; 0752 _ 46: 0F AF. 1C 17
        add     r10, 4                                  ; 0757 _ 49: 83. C2, 04
        add     dword [rbx+rcx+10H], r11d               ; 075B _ 44: 01. 5C 0B, 10
        cmp     r10, 16                                 ; 0760 _ 49: 83. FA, 10
        jnz     ?_049                                   ; 0764 _ 75, DC
        add     rcx, 4                                  ; 0766 _ 48: 83. C1, 04
        cmp     rcx, 8                                  ; 076A _ 48: 83. F9, 08
        jnz     ?_048                                   ; 076E _ 75, C7
        add     rsp, 40                                 ; 0770 _ 48: 83. C4, 28
        pop     rbx                                     ; 0774 _ 5B
        pop     rsi                                     ; 0775 _ 5E
        pop     rdi                                     ; 0776 _ 5F
        pop     rbp                                     ; 0777 _ 5D
        ret                                             ; 0778 _ C3
; _ZNK8Position9set_stateEP9StateInfo End of function

?_050:  ; Local function
        mov     rdi, qword [rel _ZN7Zobrist4sideE]      ; 0779 _ 48: 8B. 3D, 00000008(rel)
        xor     qword [rbx+30H], rdi                    ; 0780 _ 48: 31. 7B, 30
        jmp     ?_041                                   ; 0784 _ E9, FFFFFF05

        nop                                             ; 0789 _ 90
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZN8PositionaSERKS_:; Function begin
        push    rdi                                     ; 0790 _ 57
        push    rsi                                     ; 0791 _ 56
        sub     rsp, 40                                 ; 0792 _ 48: 83. EC, 28
        mov     r8d, 968                                ; 0796 _ 41: B8, 000003C8
        call    memcpy                                  ; 079C _ E8, 00000000(rel)
        mov     ecx, 20                                 ; 07A1 _ B9, 00000014
        mov     rdx, rax                                ; 07A6 _ 48: 89. C2
        lea     rax, [rax+350H]                         ; 07A9 _ 48: 8D. 80, 00000350
        mov     rsi, qword [rdx+3B8H]                   ; 07B0 _ 48: 8B. B2, 000003B8
        mov     rdi, rax                                ; 07B7 _ 48: 89. C7
        rep movsd                                       ; 07BA _ F3: A5
        mov     qword [rdx+3B8H], rax                   ; 07BC _ 48: 89. 82, 000003B8
        mov     rax, rdx                                ; 07C3 _ 48: 89. D0
        mov     qword [rdx+3A0H], 0                     ; 07C6 _ 48: C7. 82, 000003A0, 00000000
        add     rsp, 40                                 ; 07D1 _ 48: 83. C4, 28
        pop     rsi                                     ; 07D5 _ 5E
        pop     rdi                                     ; 07D6 _ 5F
        ret                                             ; 07D7 _ C3
; _ZN8PositionaSERKS_ End of function

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZNK8Position9print_fenEPc:; Function begin
        push    rbx                                     ; 07E0 _ 53
        lea     r11, [rel _ZN12_GLOBAL__N_1L11PieceToCharE]; 07E1 _ 4C: 8D. 1D, 00000060(rel)
        mov     r9d, 7                                  ; 07E8 _ 41: B9, 00000007
?_051:  lea     r10d, [r9*8]                            ; 07EE _ 46: 8D. 14 CD, 00000000
        xor     eax, eax                                ; 07F6 _ 31. C0
        jmp     ?_056                                   ; 07F8 _ EB, 35

?_052:  test    r8d, r8d                                ; 07FA _ 45: 85. C0
        jz      ?_054                                   ; 07FD _ 74, 0C
?_053:  add     r8d, 48                                 ; 07FF _ 41: 83. C0, 30
        add     rdx, 1                                  ; 0803 _ 48: 83. C2, 01
        mov     byte [rdx-1H], r8b                      ; 0807 _ 44: 88. 42, FF
?_054:  cmp     eax, 7                                  ; 080B _ 83. F8, 07
        ja      ?_055                                   ; 080E _ 77, 17
        mov     r8d, r10d                               ; 0810 _ 45: 89. D0
        add     rdx, 1                                  ; 0813 _ 48: 83. C2, 01
        or      r8d, eax                                ; 0817 _ 41: 09. C0
        mov     ebx, dword [rcx+r8*4]                   ; 081A _ 42: 8B. 1C 81
        movzx   r8d, byte [r11+rbx]                     ; 081E _ 45: 0F B6. 04 1B
        mov     byte [rdx-1H], r8b                      ; 0823 _ 44: 88. 42, FF
?_055:  add     eax, 1                                  ; 0827 _ 83. C0, 01
        cmp     eax, 7                                  ; 082A _ 83. F8, 07
        ja      ?_058                                   ; 082D _ 77, 1C
?_056:  xor     r8d, r8d                                ; 082F _ 45: 31. C0
?_057:  mov     ebx, r10d                               ; 0832 _ 44: 89. D3
        or      ebx, eax                                ; 0835 _ 09. C3
        cmp     dword [rcx+rbx*4], 0                    ; 0837 _ 83. 3C 99, 00
        jnz     ?_052                                   ; 083B _ 75, BD
        add     eax, 1                                  ; 083D _ 83. C0, 01
        add     r8d, 1                                  ; 0840 _ 41: 83. C0, 01
        cmp     eax, 7                                  ; 0844 _ 83. F8, 07
        jbe     ?_057                                   ; 0847 _ 76, E9
        jmp     ?_053                                   ; 0849 _ EB, B4
; _ZNK8Position9print_fenEPc End of function

?_058:  ; Local function
        test    r9d, r9d                                ; 084B _ 45: 85. C9
        mov     rax, rdx                                ; 084E _ 48: 89. D0
        jz      ?_059                                   ; 0851 _ 74, 07
        add     rdx, 1                                  ; 0853 _ 48: 83. C2, 01
        mov     byte [rax], 47                          ; 0857 _ C6. 00, 2F
?_059:  sub     r9d, 1                                  ; 085A _ 41: 83. E9, 01
        jmp     ?_051                                   ; 085E _ EB, 8E

_Z9print_posPcRK8Position:; Function begin
        push    r12                                     ; 0860 _ 41: 54
        push    rbp                                     ; 0862 _ 55
        push    rdi                                     ; 0863 _ 57
        push    rsi                                     ; 0864 _ 56
        push    rbx                                     ; 0865 _ 53
        sub     rsp, 32                                 ; 0866 _ 48: 83. EC, 20
        lea     rdi, [rel _ZN12_GLOBAL__N_1L11PieceToCharE]; 086A _ 48: 8D. 3D, 00000060(rel)
        mov     esi, 7                                  ; 0871 _ BE, 00000007
        mov     rbp, rdx                                ; 0876 _ 48: 89. D5
        lea     rdx, [rel ?_191]                        ; 0879 _ 48: 8D. 15, 00000000(rel)
        call    _Z12print_stringPcPKc                   ; 0880 _ E8, 00000000(rel)
        mov     rcx, rax                                ; 0885 _ 48: 89. C1
?_060:  lea     r12d, [rsi*8]                           ; 0888 _ 44: 8D. 24 F5, 00000000
        xor     ebx, ebx                                ; 0890 _ 31. DB
?_061:  lea     rdx, [rel ?_192]                        ; 0892 _ 48: 8D. 15, 00000025(rel)
        call    _Z12print_stringPcPKc                   ; 0899 _ E8, 00000000(rel)
        mov     edx, ebx                                ; 089E _ 89. DA
        add     ebx, 1                                  ; 08A0 _ 83. C3, 01
        lea     rcx, [rax+1H]                           ; 08A3 _ 48: 8D. 48, 01
        or      edx, r12d                               ; 08A7 _ 44: 09. E2
        cmp     ebx, 8                                  ; 08AA _ 83. FB, 08
        mov     r8d, dword [rbp+rdx*4]                  ; 08AD _ 44: 8B. 44 95, 00
        movzx   r9d, byte [rdi+r8]                      ; 08B2 _ 46: 0F B6. 0C 07
        mov     byte [rax], r9b                         ; 08B7 _ 44: 88. 08
        jnz     ?_061                                   ; 08BA _ 75, D6
        lea     rdx, [rel ?_193]                        ; 08BC _ 48: 8D. 15, 00000030(rel)
        sub     esi, 1                                  ; 08C3 _ 83. EE, 01
        call    _Z12print_stringPcPKc                   ; 08C6 _ E8, 00000000(rel)
        mov     rcx, rax                                ; 08CB _ 48: 89. C1
        jmp     ?_060                                   ; 08CE _ EB, B8
; _Z9print_posPcRK8Position End of function

_ZN8Position4flipEv:; Function begin
        push    rdi                                     ; 08D0 _ 57
        push    rsi                                     ; 08D1 _ 56
        push    rbx                                     ; 08D2 _ 53
        mov     edx, 3                                  ; 08D3 _ BA, 00000003
        mov     r11d, 7                                 ; 08D8 _ 41: BB, 00000007
?_062:  lea     ebx, [rdx*8]                            ; 08DE _ 8D. 1C D5, 00000000
        mov     r8d, r11d                               ; 08E5 _ 45: 89. D8
        xor     eax, eax                                ; 08E8 _ 31. C0
        sub     r8d, edx                                ; 08EA _ 41: 29. D0
        shl     r8d, 3                                  ; 08ED _ 41: C1. E0, 03
?_063:  mov     r9d, eax                                ; 08F1 _ 41: 89. C1
        mov     edi, eax                                ; 08F4 _ 89. C7
        add     eax, 1                                  ; 08F6 _ 83. C0, 01
        or      r9d, ebx                                ; 08F9 _ 41: 09. D9
        or      edi, r8d                                ; 08FC _ 44: 09. C7
        cmp     eax, 8                                  ; 08FF _ 83. F8, 08
        lea     r10, [rcx+r9*4]                         ; 0902 _ 4E: 8D. 14 89
        lea     r9, [rcx+rdi*4]                         ; 0906 _ 4C: 8D. 0C B9
        mov     esi, dword [r10]                        ; 090A _ 41: 8B. 32
        mov     edi, dword [r9]                         ; 090D _ 41: 8B. 39
        mov     dword [r10], edi                        ; 0910 _ 41: 89. 3A
        mov     dword [r9], esi                         ; 0913 _ 41: 89. 31
        jnz     ?_063                                   ; 0916 _ 75, D9
        sub     edx, 1                                  ; 0918 _ 83. EA, 01
        jmp     ?_062                                   ; 091B _ EB, C1
; _ZN8Position4flipEv End of function

        nop                                             ; 091D _ 90
        nop                                             ; 091E _ 90
        nop                                             ; 091F _ 90


SECTION .data   align=64 noexecute                      ; section number 2, data

PieceValue:                                             ; byte
        db 00H, 00H, 00H, 00H                           ; 0000 _ ....

?_064:  dd 000000C6H                                    ; 0004 _ 198 

?_065:                                                  ; byte
        db 31H, 03H, 00H, 00H, 44H, 03H, 00H, 00H       ; 0008 _ 1...D...
        db 0F6H, 04H, 00H, 00H, 0D9H, 09H, 00H, 00H     ; 0010 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0020 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0028 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........
        db 00H, 00H, 00H, 00H, 02H, 01H, 00H, 00H       ; 0040 _ ........
        db 4EH, 03H, 00H, 00H, 59H, 03H, 00H, 00H       ; 0048 _ N...Y...
        db 01H, 05H, 00H, 00H, 0FEH, 09H, 00H, 00H      ; 0050 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0060 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0068 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0070 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........


SECTION .bss    align=64 noexecute                      ; section number 3, bss

_ZN7Zobrist9exclusionE:                                 ; qword
        resq    1                                       ; 0000

_ZN7Zobrist4sideE:                                      ; qword
        resq    7                                       ; 0008

_ZN7Zobrist8castlingE:                                  ; byte
        resb    128                                     ; 0040

_ZN7Zobrist9enpassantE:                                 ; byte
        resb    64                                      ; 00C0

_ZN7Zobrist3psqE:                                       ; byte
        resb    8192                                    ; 0100


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_ZN8Position9parse_setEPKcbP6Thread.cold.19:
        add     r8d, 1                                  ; 0000 _ 41: 83. C0, 01
        movsxd  r8, r8d                                 ; 0004 _ 4D: 63. C0
        jmp     .text+2DCH                              ; 0007 _ E9, 000002DC(rel)

        sub     r8d, 1                                  ; 000C _ 41: 83. E8, 01
        movsxd  r8, r8d                                 ; 0010 _ 4D: 63. C0
        jmp     .text+46CH                              ; 0013 _ E9, 0000046C(rel)

        add     r12, 1                                  ; 0018 _ 49: 83. C4, 01
        jmp     ?_021                                   ; 001C _ E9, 00000345(rel)

        jmp     ?_015                                   ; 0021 _ E9, 000002A7(rel)

        add     r12, 1                                  ; 0026 _ 49: 83. C4, 01
        jmp     .text+1ECH                              ; 002A _ E9, 000001EC(rel)

        nop                                             ; 002F _ 90

ALIGN   16
_ZNK8Position9set_stateEP9StateInfo.cold.20:; Local function
        lea     r9, [rel _ZN7Zobrist9enpassantE]        ; 0030 _ 4C: 8D. 0D, 000000C0(rel)
        and     r8d, 07H                                ; 0037 _ 41: 83. E0, 07
        mov     r10, qword [r9+r8*8]                    ; 003B _ 4F: 8B. 14 C1
        xor     qword [rbx+30H], r10                    ; 003F _ 4C: 31. 53, 30
        jmp     .text+685H                              ; 0043 _ E9, 00000685(rel)

_ZNK8Position9pos_is_okEPi:; Function begin
        test    rdx, rdx                                ; 0048 _ 48: 85. D2
        jz      ?_066                                   ; 004B _ 74, 06
        mov     dword [rdx], 0                          ; 004D _ C7. 02, 00000000
?_066:  mov     r9d, dword [rcx+3ACH]                   ; 0053 _ 44: 8B. 89, 000003AC
        xor     eax, eax                                ; 005A _ 31. C0
        cmp     r9d, 1                                  ; 005C _ 41: 83. F9, 01
        ja      ?_067                                   ; 0060 _ 77, 52
        mov     r8, qword [rcx+130H]                    ; 0062 _ 4C: 8B. 81, 00000130
        mov     rdx, r8                                 ; 0069 _ 4C: 89. C2
        and     rdx, qword [rcx+140H]                   ; 006C _ 48: 23. 91, 00000140
        bsf     r10, rdx                                ; 0073 _ 4C: 0F BC. D2
        cmp     dword [rcx+r10*4], 6                    ; 0077 _ 42: 83. 3C 91, 06
        jnz     ?_067                                   ; 007C _ 75, 36
        and     r8, qword [rcx+148H]                    ; 007E _ 4C: 23. 81, 00000148
        bsf     r11, r8                                 ; 0085 _ 4D: 0F BC. D8
        cmp     dword [rcx+r11*4], 14                   ; 0089 _ 42: 83. 3C 99, 0E
        jnz     ?_067                                   ; 008E _ 75, 24
        mov     rax, qword [rcx+3B8H]                   ; 0090 _ 48: 8B. 81, 000003B8
        mov     rcx, qword [rax+28H]                    ; 0097 _ 48: 8B. 48, 28
        mov     al, 1                                   ; 009B _ B0, 01
        cmp     rcx, 64                                 ; 009D _ 48: 83. F9, 40
        jz      ?_067                                   ; 00A1 _ 74, 11
        imul    r9d, r9d, 7                             ; 00A3 _ 45: 6B. C9, 07
        shr     rcx, 3                                  ; 00A7 _ 48: C1. E9, 03
        xor     ecx, r9d                                ; 00AB _ 44: 31. C9
        cmp     ecx, 5                                  ; 00AE _ 83. F9, 05
        sete    al                                      ; 00B1 _ 0F 94. C0
?_067:  ret                                             ; 00B4 _ C3
; _ZNK8Position9pos_is_okEPi End of function

        nop                                             ; 00B5 _ 90

_ZN8Position5clearEv:; Function begin
        push    rdi                                     ; 00B6 _ 57
        xor     eax, eax                                ; 00B7 _ 31. C0
        mov     rdx, rcx                                ; 00B9 _ 48: 89. CA
        mov     ecx, 242                                ; 00BC _ B9, 000000F2
        lea     r8, [rdx+350H]                          ; 00C1 _ 4C: 8D. 82, 00000350
        mov     rdi, rdx                                ; 00C8 _ 48: 89. D7
        rep stosd                                       ; 00CB _ F3: AB
        mov     qword [rdx+3B8H], r8                    ; 00CD _ 4C: 89. 82, 000003B8
        mov     qword [rdx+378H], 64                    ; 00D4 _ 48: C7. 82, 00000378, 00000040
        pop     rdi                                     ; 00DF _ 5F
        ret                                             ; 00E0 _ C3
; _ZN8Position5clearEv End of function

        nop                                             ; 00E1 _ 90
        nop                                             ; 00E2 _ 90
        nop                                             ; 00E3 _ 90
        nop                                             ; 00E4 _ 90
        nop                                             ; 00E5 _ 90
        nop                                             ; 00E6 _ 90
        nop                                             ; 00E7 _ 90
        nop                                             ; 00E8 _ 90
        nop                                             ; 00E9 _ 90
        nop                                             ; 00EA _ 90
        nop                                             ; 00EB _ 90
        nop                                             ; 00EC _ 90
        nop                                             ; 00ED _ 90
        nop                                             ; 00EE _ 90
        nop                                             ; 00EF _ 90


SECTION .xdata  align=4 noexecute                       ; section number 5, const

        db 01H, 02H, 02H, 00H, 02H, 30H, 01H, 60H       ; 0000 _ .....0.`
        db 01H, 0AH, 06H, 00H, 0AH, 32H, 06H, 30H       ; 0008 _ .....2.0
        db 05H, 60H, 04H, 70H, 03H, 50H, 02H, 0C0H      ; 0010 _ .`.p.P..
        db 01H, 01H, 01H, 00H, 01H, 30H, 00H, 00H       ; 0018 _ .....0..
        db 01H, 08H, 05H, 00H, 08H, 42H, 04H, 30H       ; 0020 _ .....B.0
        db 03H, 60H, 02H, 70H, 01H, 50H, 00H, 00H       ; 0028 _ .`.p.P..
        db 01H, 06H, 03H, 00H, 06H, 42H, 02H, 60H       ; 0030 _ .....B.`
        db 01H, 70H, 00H, 00H, 01H, 01H, 01H, 00H       ; 0038 _ .p......
        db 01H, 30H, 00H, 00H, 01H, 0AH, 06H, 00H       ; 0040 _ .0......
        db 0AH, 32H, 06H, 30H, 05H, 60H, 04H, 70H       ; 0048 _ .2.0.`.p
        db 03H, 50H, 02H, 0C0H, 01H, 03H, 03H, 00H      ; 0050 _ .P......
        db 03H, 30H, 02H, 60H, 01H, 70H, 00H, 00H       ; 0058 _ .0.`.p..


SECTION .text.hot align=16 execute                      ; section number 7, code

.text.hot:; Local function

_ZNK8Position12attackers_toE6Squarey:
        push    rbp                                     ; 0000 _ 55
        push    rdi                                     ; 0001 _ 57
        push    rsi                                     ; 0002 _ 56
        push    rbx                                     ; 0003 _ 53
        mov     rax, qword [rel .refptr.RookMasks]      ; 0004 _ 48: 8B. 05, 00000000(rel)
        mov     rdi, qword [rel .refptr.BishopMasks]    ; 000B _ 48: 8B. 3D, 00000000(rel)
        mov     r10, qword [rcx+108H]                   ; 0012 _ 4C: 8B. 91, 00000108
        mov     r9, qword [rcx+128H]                    ; 0019 _ 4C: 8B. 89, 00000128
        lea     rbp, [rdx+80H]                          ; 0020 _ 48: 8D. AA, 00000080
        mov     r11, r10                                ; 0027 _ 4D: 89. D3
        and     r11, qword [rcx+140H]                   ; 002A _ 4C: 23. 99, 00000140
        lea     rbx, [rbp*8]                            ; 0031 _ 48: 8D. 1C ED, 00000000
        pext    rsi, r8, qword [rbx+rax-400H]           ; 0039 _ C4 E2 BA: F5. B4 03, FFFFFC00
        mov     rax, r10                                ; 0043 _ 4C: 89. D0
        pext    r8, r8, qword [rbx+rdi-400H]            ; 0046 _ C4 62 BA: F5. 84 3B, FFFFFC00
        mov     r8d, r8d                                ; 0050 _ 45: 89. C0
        mov     rdi, qword [rel .refptr.StepAttacksBB]  ; 0053 _ 48: 8B. 3D, 00000000(rel)
        and     rax, qword [rcx+148H]                   ; 005A _ 48: 23. 81, 00000148
        and     r11, qword [rdi+rdx*8+1200H]            ; 0061 _ 4C: 23. 9C D7, 00001200
        and     rax, qword [rdi+rdx*8+200H]             ; 0069 _ 48: 23. 84 D7, 00000200
        mov     r10, qword [rbx+rdi+800H]               ; 0071 _ 4C: 8B. 94 3B, 00000800
        and     r10, qword [rcx+130H]                   ; 0079 _ 4C: 23. 91, 00000130
        mov     rdx, r11                                ; 0080 _ 4C: 89. DA
        mov     r11, r9                                 ; 0083 _ 4D: 89. CB
        or      r11, qword [rcx+120H]                   ; 0086 _ 4C: 0B. 99, 00000120
        or      rdx, rax                                ; 008D _ 48: 09. C2
        mov     rax, qword [rdi+rbp*8]                  ; 0090 _ 48: 8B. 04 EF
        mov     ebp, esi                                ; 0094 _ 89. F5
        and     rax, qword [rcx+110H]                   ; 0096 _ 48: 23. 81, 00000110
        mov     rsi, qword [rel .refptr.RookAttacks]    ; 009D _ 48: 8B. 35, 00000000(rel)
        or      r9, qword [rcx+118H]                    ; 00A4 _ 4C: 0B. 89, 00000118
        or      rax, rdx                                ; 00AB _ 48: 09. D0
        mov     rdx, qword [rel .refptr.BishopAttacks]  ; 00AE _ 48: 8B. 15, 00000000(rel)
        mov     rdi, qword [rbx+rsi-400H]               ; 00B5 _ 48: 8B. BC 33, FFFFFC00
        or      rax, r10                                ; 00BD _ 4C: 09. D0
        mov     rbx, qword [rbx+rdx-400H]               ; 00C0 _ 48: 8B. 9C 13, FFFFFC00
        and     r11, qword [rdi+rbp*8]                  ; 00C8 _ 4C: 23. 1C EF
        and     r9, qword [rbx+r8*8]                    ; 00CC _ 4E: 23. 0C C3
        or      rax, r11                                ; 00D0 _ 4C: 09. D8
        or      rax, r9                                 ; 00D3 _ 4C: 09. C8
        pop     rbx                                     ; 00D6 _ 5B
        pop     rsi                                     ; 00D7 _ 5E
        pop     rdi                                     ; 00D8 _ 5F
        pop     rbp                                     ; 00D9 _ 5D
        ret                                             ; 00DA _ C3

        nop                                             ; 00DB _ 90
; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_ZNK8Position14check_blockersE5ColorS0_:; Function begin
        push    rsi                                     ; 00E0 _ 56
        push    rbx                                     ; 00E1 _ 53
        mov     r11, qword [rel .refptr.PseudoAttacks]  ; 00E2 _ 4C: 8B. 1D, 00000000(rel)
        mov     rbx, qword [rcx+128H]                   ; 00E9 _ 48: 8B. 99, 00000128
        mov     eax, r8d                                ; 00F0 _ 44: 89. C0
        mov     r9, rbx                                 ; 00F3 _ 49: 89. D9
        or      rbx, qword [rcx+120H]                   ; 00F6 _ 48: 0B. 99, 00000120
        xor     r8d, 01H                                ; 00FD _ 41: 83. F0, 01
        mov     r10, qword [rcx+rax*8+140H]             ; 0101 _ 4C: 8B. 94 C1, 00000140
        movsxd  r8, r8d                                 ; 0109 _ 4D: 63. C0
        xor     eax, eax                                ; 010C _ 31. C0
        and     r10, qword [rcx+130H]                   ; 010E _ 4C: 23. 91, 00000130
        or      r9, qword [rcx+118H]                    ; 0115 _ 4C: 0B. 89, 00000118
        bsf     r10, r10                                ; 011C _ 4D: 0F BC. D2
        and     r9, qword [r11+r10*8+600H]              ; 0120 _ 4F: 23. 8C D3, 00000600
        and     rbx, qword [r11+r10*8+800H]             ; 0128 _ 4B: 23. 9C D3, 00000800
        or      r9, rbx                                 ; 0130 _ 49: 09. D9
        and     r9, qword [rcx+r8*8+140H]               ; 0133 _ 4E: 23. 8C C1, 00000140
        jnz     ?_068                                   ; 013B _ 75, 03
        pop     rbx                                     ; 013D _ 5B
        pop     rsi                                     ; 013E _ 5E
        ret                                             ; 013F _ C3
; _ZNK8Position14check_blockersE5ColorS0_ End of function

?_068:  ; Local function
        mov     rsi, qword [rcx+100H]                   ; 0140 _ 48: 8B. B1, 00000100
        shl     r10, 6                                  ; 0147 _ 49: C1. E2, 06
        movsxd  rdx, edx                                ; 014B _ 48: 63. D2
        mov     rbx, qword [rel .refptr.BetweenBB]      ; 014E _ 48: 8B. 1D, 00000000(rel)
?_069:  bsf     r8, r9                                  ; 0155 _ 4D: 0F BC. C1
        add     r8, r10                                 ; 0159 _ 4D: 01. D0
        mov     r11, rsi                                ; 015C _ 49: 89. F3
        blsr    r9, r9                                  ; 015F _ C4 C2 B0: F3. C9
        and     r11, qword [rbx+r8*8]                   ; 0164 _ 4E: 23. 1C C3
        mov     r8, r11                                 ; 0168 _ 4D: 89. D8
        blsr    r11, r11                                ; 016B _ C4 C2 A0: F3. CB
        test    r11, r11                                ; 0170 _ 4D: 85. DB
        jnz     ?_070                                   ; 0173 _ 75, 0B
        and     r8, qword [rcx+rdx*8+140H]              ; 0175 _ 4C: 23. 84 D1, 00000140
        or      rax, r8                                 ; 017D _ 4C: 09. C0
?_070:  test    r9, r9                                  ; 0180 _ 4D: 85. C9
        jnz     ?_069                                   ; 0183 _ 75, D0
        pop     rbx                                     ; 0185 _ 5B
        pop     rsi                                     ; 0186 _ 5E
        ret                                             ; 0187 _ C3

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZNK8Position10game_phaseEv:; Function begin
        sub     rsp, 24                                 ; 0190 _ 48: 83. EC, 18
        mov     rdx, qword [rcx+3B8H]                   ; 0194 _ 48: 8B. 91, 000003B8
        mov     eax, dword [rdx+10H]                    ; 019B _ 8B. 42, 10
        mov     dword [rsp+8H], 15581                   ; 019E _ C7. 44 24, 08, 00003CDD
        add     eax, dword [rdx+14H]                    ; 01A6 _ 03. 42, 14
        cmp     eax, 15581                              ; 01A9 _ 3D, 00003CDD
        mov     dword [rsp+4H], eax                     ; 01AE _ 89. 44 24, 04
        jg      ?_072                                   ; 01B2 _ 7F, 35
        lea     rcx, [rsp+4H]                           ; 01B4 _ 48: 8D. 4C 24, 04
?_071:  cmp     dword [rcx], 3998                       ; 01B9 _ 81. 39, 00000F9E
        lea     r8, [rsp+0CH]                           ; 01BF _ 4C: 8D. 44 24, 0C
        mov     dword [rsp+0CH], 3998                   ; 01C4 _ C7. 44 24, 0C, 00000F9E
        mov     r9d, 11583                              ; 01CC _ 41: B9, 00002D3F
        cmovle  rcx, r8                                 ; 01D2 _ 49: 0F 4E. C8
        mov     eax, dword [rcx]                        ; 01D6 _ 8B. 01
        sub     eax, 3998                               ; 01D8 _ 2D, 00000F9E
        shl     eax, 7                                  ; 01DD _ C1. E0, 07
        cdq                                             ; 01E0 _ 99
        idiv    r9d                                     ; 01E1 _ 41: F7. F9
        add     rsp, 24                                 ; 01E4 _ 48: 83. C4, 18
        ret                                             ; 01E8 _ C3
; _ZNK8Position10game_phaseEv End of function

?_072:  ; Local function
        lea     rcx, [rsp+8H]                           ; 01E9 _ 48: 8D. 4C 24, 08
        jmp     ?_071                                   ; 01EE _ EB, C9

_ZNK8Position12pseudo_legalE4Move:; Function begin
        push    r13                                     ; 01F0 _ 41: 55
        push    r12                                     ; 01F2 _ 41: 54
        push    rbp                                     ; 01F4 _ 55
        push    rdi                                     ; 01F5 _ 57
        push    rsi                                     ; 01F6 _ 56
        push    rbx                                     ; 01F7 _ 53
        sub     rsp, 2104                               ; 01F8 _ 48: 81. EC, 00000838
        mov     edi, dword [rcx+3ACH]                   ; 01FF _ 8B. B9, 000003AC
        mov     rsi, rcx                                ; 0205 _ 48: 89. CE
        mov     ecx, edx                                ; 0208 _ 89. D1
        mov     ebx, edx                                ; 020A _ 89. D3
        sar     ecx, 6                                  ; 020C _ C1. F9, 06
        mov     ebp, edx                                ; 020F _ 89. D5
        and     ecx, 3FH                                ; 0211 _ 83. E1, 3F
        and     ebp, 3FH                                ; 0214 _ 83. E5, 3F
        test    bh, 0FFFFFFC0H                          ; 0217 _ F6. C7, C0
        movsxd  r11, ecx                                ; 021A _ 4C: 63. D9
        movsxd  rdx, ebp                                ; 021D _ 48: 63. D5
        mov     r9d, dword [rsi+r11*4]                  ; 0220 _ 46: 8B. 0C 9E
        jne     ?_087                                   ; 0224 _ 0F 85, 000002EF
        and     bh, 30H                                 ; 022A _ 80. E7, 30
        setne   r8b                                     ; 022D _ 41: 0F 95. C0
        test    r9d, r9d                                ; 0231 _ 45: 85. C9
        sete    al                                      ; 0234 _ 0F 94. C0
        or      al, r8b                                 ; 0237 _ 44: 08. C0
        jne     ?_080                                   ; 023A _ 0F 85, 00000194
        mov     r10d, r9d                               ; 0240 _ 45: 89. CA
        shr     r10d, 3                                 ; 0243 _ 41: C1. EA, 03
        cmp     edi, r10d                               ; 0247 _ 44: 39. D7
        jnz     ?_075                                   ; 024A _ 75, 7A
        mov     r12, qword [rel .refptr.SquareBB]       ; 024C _ 4C: 8B. 25, 00000000(rel)
        movsxd  r13, edi                                ; 0253 _ 4C: 63. EF
        mov     rbx, qword [r12+rdx*8]                  ; 0256 _ 49: 8B. 1C D4
        test    qword [rsi+r13*8+140H], rbx             ; 025A _ 4A: 85. 9C EE, 00000140
        jnz     ?_075                                   ; 0262 _ 75, 62
        mov     r10d, r9d                               ; 0264 _ 45: 89. CA
        and     r10d, 07H                               ; 0267 _ 41: 83. E2, 07
        cmp     r10d, 1                                 ; 026B _ 41: 83. FA, 01
        jz      ?_076                                   ; 026F _ 74, 6F
        cmp     r10d, 4                                 ; 0271 _ 41: 83. FA, 04
        mov     r8, qword [rsi+100H]                    ; 0275 _ 4C: 8B. 86, 00000100
        je      ?_079                                   ; 027C _ 0F 84, 0000012E
        cmp     r10d, 5                                 ; 0282 _ 41: 83. FA, 05
        je      ?_081                                   ; 0286 _ 0F 84, 00000164
        cmp     r10d, 3                                 ; 028C _ 41: 83. FA, 03
        je      ?_082                                   ; 0290 _ 0F 84, 000001AA
        mov     rcx, qword [rel .refptr.StepAttacksBB]  ; 0296 _ 48: 8B. 0D, 00000000(rel)
        shl     r9, 6                                   ; 029D _ 49: C1. E1, 06
        add     r9, r11                                 ; 02A1 _ 4D: 01. D9
        mov     r13, qword [rcx+r9*8]                   ; 02A4 _ 4E: 8B. 2C C9
?_073:  test    r13, rbx                                ; 02A8 _ 49: 85. DD
        jz      ?_075                                   ; 02AB _ 74, 19
        mov     r13, qword [rsi+3B8H]                   ; 02AD _ 4C: 8B. AE, 000003B8
        mov     r13, qword [r13+38H]                    ; 02B4 _ 4D: 8B. 6D, 38
        test    r13, r13                                ; 02B8 _ 4D: 85. ED
        jne     ?_083                                   ; 02BB _ 0F 85, 000001AF
?_074:  mov     eax, 1                                  ; 02C1 _ B8, 00000001
?_075:  add     rsp, 2104                               ; 02C6 _ 48: 81. C4, 00000838
        pop     rbx                                     ; 02CD _ 5B
        pop     rsi                                     ; 02CE _ 5E
        pop     rdi                                     ; 02CF _ 5F
        pop     rbp                                     ; 02D0 _ 5D
        pop     r12                                     ; 02D1 _ 41: 5C
        pop     r13                                     ; 02D3 _ 41: 5D
        ret                                             ; 02D5 _ C3

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_076:  lea     r8d, [rdi*8]                            ; 02E0 _ 44: 8D. 04 FD, 00000000
        mov     r9, rdx                                 ; 02E8 _ 49: 89. D1
        mov     r10d, r8d                               ; 02EB _ 45: 89. C2
        shr     r9, 3                                   ; 02EE _ 49: C1. E9, 03
        sub     r10d, edi                               ; 02F2 _ 41: 29. FA
        mov     r12d, r10d                              ; 02F5 _ 45: 89. D4
        xor     r12d, 07H                               ; 02F8 _ 41: 83. F4, 07
        cmp     r12d, r9d                               ; 02FC _ 45: 39. CC
        jz      ?_075                                   ; 02FF _ 74, C5
        mov     r13d, edi                               ; 0301 _ 41: 89. FD
        mov     r12, rbx                                ; 0304 _ 49: 89. DC
        or      r8d, 01H                                ; 0307 _ 41: 83. C8, 01
        xor     r13d, 01H                               ; 030B _ 41: 83. F5, 01
        shl     r8, 6                                   ; 030F _ 49: C1. E0, 06
        movsxd  r9, r13d                                ; 0313 _ 4D: 63. CD
        add     r8, r11                                 ; 0316 _ 4D: 01. D8
        and     r12, qword [rsi+r9*8+140H]              ; 0319 _ 4E: 23. A4 CE, 00000140
        mov     r9, qword [rel .refptr.StepAttacksBB]   ; 0321 _ 4C: 8B. 0D, 00000000(rel)
        test    qword [r9+r8*8], r12                    ; 0328 _ 4F: 85. 24 C1
        jnz     ?_077                                   ; 032C _ 75, 25
        test    edi, edi                                ; 032E _ 85. FF
        jne     ?_084                                   ; 0330 _ 0F 85, 0000016A
        lea     r8d, [rcx+8H]                           ; 0336 _ 44: 8D. 41, 08
        movsxd  r12, r8d                                ; 033A _ 4D: 63. E0
        cmp     rdx, r12                                ; 033D _ 4C: 39. E2
        jne     ?_094                                   ; 0340 _ 0F 85, 000002ED
        mov     r13d, dword [rsi+rdx*4]                 ; 0346 _ 44: 8B. 2C 96
        test    r13d, r13d                              ; 034A _ 45: 85. ED
        jne     ?_094                                   ; 034D _ 0F 85, 000002E0
?_077:  mov     r8, qword [rsi+3B8H]                    ; 0353 _ 4C: 8B. 86, 000003B8
        mov     r13, qword [r8+38H]                     ; 035A _ 4D: 8B. 68, 38
        test    r13, r13                                ; 035E _ 4D: 85. ED
        je      ?_074                                   ; 0361 _ 0F 84, FFFFFF5A
?_078:  blsr    r12, r13                                ; 0367 _ C4 C2 98: F3. CD
        test    r12, r12                                ; 036C _ 4D: 85. E4
        jne     ?_075                                   ; 036F _ 0F 85, FFFFFF51
        mov     rcx, qword [rel .refptr.BetweenBB]      ; 0375 _ 48: 8B. 0D, 00000000(rel)
        mov     rax, qword [rsi+rdi*8+140H]             ; 037C _ 48: 8B. 84 FE, 00000140
        bsf     rdi, r13                                ; 0384 _ 49: 0F BC. FD
        shl     rdi, 6                                  ; 0388 _ 48: C1. E7, 06
        and     rax, qword [rsi+130H]                   ; 038C _ 48: 23. 86, 00000130
        bsf     rsi, rax                                ; 0393 _ 48: 0F BC. F0
        add     rdi, rsi                                ; 0397 _ 48: 01. F7
        or      r13, qword [rcx+rdi*8]                  ; 039A _ 4C: 0B. 2C F9
        test    r13, rbx                                ; 039E _ 49: 85. DD
        setne   al                                      ; 03A1 _ 0F 95. C0
        jmp     ?_075                                   ; 03A4 _ E9, FFFFFF1D

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_079:  mov     rcx, qword [rel .refptr.RookMasks]      ; 03B0 _ 48: 8B. 0D, 00000000(rel)
        mov     r9, qword [rel .refptr.RookAttacks]     ; 03B7 _ 4C: 8B. 0D, 00000000(rel)
        pext    r13, r8, qword [rcx+r11*8]              ; 03BE _ C4 22 BA: F5. 2C D9
        mov     ebp, r13d                               ; 03C4 _ 44: 89. ED
        mov     rcx, qword [r9+r11*8]                   ; 03C7 _ 4B: 8B. 0C D9
        mov     r13, qword [rcx+rbp*8]                  ; 03CB _ 4C: 8B. 2C E9
        jmp     ?_073                                   ; 03CF _ E9, FFFFFED4

?_080:  xor     eax, eax                                ; 03D4 _ 31. C0
        add     rsp, 2104                               ; 03D6 _ 48: 81. C4, 00000838
        pop     rbx                                     ; 03DD _ 5B
        pop     rsi                                     ; 03DE _ 5E
        pop     rdi                                     ; 03DF _ 5F
        pop     rbp                                     ; 03E0 _ 5D
        pop     r12                                     ; 03E1 _ 41: 5C
        pop     r13                                     ; 03E3 _ 41: 5D
        ret                                             ; 03E5 _ C3

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_081:  mov     rcx, qword [rel .refptr.RookMasks]      ; 03F0 _ 48: 8B. 0D, 00000000(rel)
        mov     rbp, qword [rel .refptr.RookAttacks]    ; 03F7 _ 48: 8B. 2D, 00000000(rel)
        mov     r9, qword [rel .refptr.BishopMasks]     ; 03FE _ 4C: 8B. 0D, 00000000(rel)
        pext    r13, r8, qword [rcx+r11*8]              ; 0405 _ C4 22 BA: F5. 2C D9
        mov     ecx, r13d                               ; 040B _ 44: 89. E9
        mov     r13, qword [rbp+r11*8]                  ; 040E _ 4E: 8B. 6C DD, 00
        mov     rbp, qword [rel .refptr.BishopAttacks]  ; 0413 _ 48: 8B. 2D, 00000000(rel)
        pext    r9, r8, qword [r9+r11*8]                ; 041A _ C4 02 BA: F5. 0C D9
        mov     r9d, r9d                                ; 0420 _ 45: 89. C9
        mov     r13, qword [r13+rcx*8]                  ; 0423 _ 4D: 8B. 6C CD, 00
        mov     rbp, qword [rbp+r11*8]                  ; 0428 _ 4A: 8B. 6C DD, 00
        or      r13, qword [rbp+r9*8]                   ; 042D _ 4E: 0B. 6C CD, 00
        jmp     ?_073                                   ; 0432 _ E9, FFFFFE71

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_082:  mov     rbp, qword [rel .refptr.BishopMasks]    ; 0440 _ 48: 8B. 2D, 00000000(rel)
        mov     r13, qword [rel .refptr.BishopAttacks]  ; 0447 _ 4C: 8B. 2D, 00000000(rel)
        pext    r9, r8, qword [rbp+r11*8]               ; 044E _ C4 22 BA: F5. 4C DD, 00
        mov     ecx, r9d                                ; 0455 _ 44: 89. C9
        mov     rbp, qword [r13+r11*8]                  ; 0458 _ 4B: 8B. 6C DD, 00
        mov     r13, qword [rbp+rcx*8]                  ; 045D _ 4C: 8B. 6C CD, 00
        jmp     ?_073                                   ; 0462 _ E9, FFFFFE41

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_083:  cmp     r10d, 6                                 ; 0470 _ 41: 83. FA, 06
        jne     ?_078                                   ; 0474 _ 0F 85, FFFFFEED
        xor     r8, qword [r12+r11*8]                   ; 047A _ 4F: 33. 04 DC
        xor     edi, 01H                                ; 047E _ 83. F7, 01
        mov     rcx, rsi                                ; 0481 _ 48: 89. F1
        call    _ZNK8Position12attackers_toE6Squarey    ; 0484 _ E8, FFFFFB77
        movsxd  rdx, edi                                ; 0489 _ 48: 63. D7
        test    qword [rsi+rdx*8+140H], rax             ; 048C _ 48: 85. 84 D6, 00000140
        sete    al                                      ; 0494 _ 0F 94. C0
        jmp     ?_075                                   ; 0497 _ E9, FFFFFE2A

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_084:  lea     r8d, [rcx-8H]                           ; 04A0 _ 44: 8D. 41, F8
        movsxd  r12, r8d                                ; 04A4 _ 4D: 63. E0
        cmp     rdx, r12                                ; 04A7 _ 4C: 39. E2
        jnz     ?_085                                   ; 04AA _ 75, 14
        mov     r13d, dword [rsi+rdx*4]                 ; 04AC _ 44: 8B. 2C 96
        test    r13d, r13d                              ; 04B0 _ 45: 85. ED
        je      ?_077                                   ; 04B3 _ 0F 84, FFFFFE9A
; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_085:  mov     r9, -8                                  ; 04C0 _ 49: C7. C1, FFFFFFF8
?_086:  lea     ecx, [rcx+r9*2]                         ; 04C7 _ 42: 8D. 0C 49
        movsxd  r9, ecx                                 ; 04CB _ 4C: 63. C9
        cmp     rdx, r9                                 ; 04CE _ 4C: 39. CA
        jne     ?_075                                   ; 04D1 _ 0F 85, FFFFFDEF
        shr     r11, 3                                  ; 04D7 _ 49: C1. EB, 03
        xor     r10d, 01H                               ; 04DB _ 41: 83. F2, 01
        cmp     r10d, r11d                              ; 04DF _ 45: 39. DA
        jne     ?_075                                   ; 04E2 _ 0F 85, FFFFFDDE
        mov     r11d, dword [rsi+rdx*4]                 ; 04E8 _ 44: 8B. 1C 96
        test    r11d, r11d                              ; 04EC _ 45: 85. DB
        jne     ?_075                                   ; 04EF _ 0F 85, FFFFFDD1
        cmp     edi, 1                                  ; 04F5 _ 83. FF, 01
        sbb     rdx, rdx                                ; 04F8 _ 48: 19. D2
        and     edx, 10H                                ; 04FB _ 83. E2, 10
        sub     rdx, 8                                  ; 04FE _ 48: 83. EA, 08
        sub     ebp, edx                                ; 0502 _ 29. D5
        movsxd  rbp, ebp                                ; 0504 _ 48: 63. ED
        mov     r10d, dword [rsi+rbp*4]                 ; 0507 _ 44: 8B. 14 AE
        test    r10d, r10d                              ; 050B _ 45: 85. D2
        je      ?_077                                   ; 050E _ 0F 84, FFFFFE3F
        jmp     ?_075                                   ; 0514 _ E9, FFFFFDAD

?_087:  lea     rbp, [rsp+20H]                          ; 0519 _ 48: 8D. 6C 24, 20
        mov     rcx, rsi                                ; 051E _ 48: 89. F1
        mov     rdx, rbp                                ; 0521 _ 48: 89. EA
        call    _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_; 0524 _ E8, 00000000(rel)
        cmp     rax, rbp                                ; 0529 _ 48: 39. E8
        je      ?_080                                   ; 052C _ 0F 84, FFFFFEA2
        cmp     ebx, dword [rsp+20H]                    ; 0532 _ 3B. 5C 24, 20
        je      ?_074                                   ; 0536 _ 0F 84, FFFFFD85
        mov     r11, rax                                ; 053C _ 49: 89. C3
        mov     r9, rbp                                 ; 053F _ 49: 89. E9
        sub     r11, rbp                                ; 0542 _ 49: 29. EB
        sub     r11, 8                                  ; 0545 _ 49: 83. EB, 08
        shr     r11, 3                                  ; 0549 _ 49: C1. EB, 03
        and     r11d, 07H                               ; 054D _ 41: 83. E3, 07
        jz      ?_093                                   ; 0551 _ 74, 7F
        add     r9, 8                                   ; 0553 _ 49: 83. C1, 08
        cmp     ebx, dword [r9]                         ; 0557 _ 41: 3B. 19
        je      ?_074                                   ; 055A _ 0F 84, FFFFFD61
        cmp     r11, 1                                  ; 0560 _ 49: 83. FB, 01
        jz      ?_093                                   ; 0564 _ 74, 6C
        cmp     r11, 2                                  ; 0566 _ 49: 83. FB, 02
        jz      ?_092                                   ; 056A _ 74, 59
        cmp     r11, 3                                  ; 056C _ 49: 83. FB, 03
        jz      ?_091                                   ; 0570 _ 74, 46
        cmp     r11, 4                                  ; 0572 _ 49: 83. FB, 04
        jz      ?_090                                   ; 0576 _ 74, 33
        cmp     r11, 5                                  ; 0578 _ 49: 83. FB, 05
        jz      ?_089                                   ; 057C _ 74, 20
        cmp     r11, 6                                  ; 057E _ 49: 83. FB, 06
        jz      ?_088                                   ; 0582 _ 74, 0D
        add     r9, 8                                   ; 0584 _ 49: 83. C1, 08
        cmp     ebx, dword [r9]                         ; 0588 _ 41: 3B. 19
        je      ?_074                                   ; 058B _ 0F 84, FFFFFD30
?_088:  add     r9, 8                                   ; 0591 _ 49: 83. C1, 08
        cmp     ebx, dword [r9]                         ; 0595 _ 41: 3B. 19
        je      ?_074                                   ; 0598 _ 0F 84, FFFFFD23
?_089:  add     r9, 8                                   ; 059E _ 49: 83. C1, 08
        cmp     ebx, dword [r9]                         ; 05A2 _ 41: 3B. 19
        je      ?_074                                   ; 05A5 _ 0F 84, FFFFFD16
?_090:  add     r9, 8                                   ; 05AB _ 49: 83. C1, 08
        cmp     ebx, dword [r9]                         ; 05AF _ 41: 3B. 19
        je      ?_074                                   ; 05B2 _ 0F 84, FFFFFD09
?_091:  add     r9, 8                                   ; 05B8 _ 49: 83. C1, 08
        cmp     ebx, dword [r9]                         ; 05BC _ 41: 3B. 19
        je      ?_074                                   ; 05BF _ 0F 84, FFFFFCFC
?_092:  add     r9, 8                                   ; 05C5 _ 49: 83. C1, 08
        cmp     ebx, dword [r9]                         ; 05C9 _ 41: 3B. 19
        je      ?_074                                   ; 05CC _ 0F 84, FFFFFCEF
?_093:  lea     rdx, [r9+8H]                            ; 05D2 _ 49: 8D. 51, 08
        cmp     rax, rdx                                ; 05D6 _ 48: 39. D0
        je      ?_080                                   ; 05D9 _ 0F 84, FFFFFDF5
        cmp     ebx, dword [r9+8H]                      ; 05DF _ 41: 3B. 59, 08
        je      ?_074                                   ; 05E3 _ 0F 84, FFFFFCD8
        cmp     ebx, dword [r9+10H]                     ; 05E9 _ 41: 3B. 59, 10
        je      ?_074                                   ; 05ED _ 0F 84, FFFFFCCE
        cmp     ebx, dword [r9+18H]                     ; 05F3 _ 41: 3B. 59, 18
        je      ?_074                                   ; 05F7 _ 0F 84, FFFFFCC4
        cmp     ebx, dword [r9+20H]                     ; 05FD _ 41: 3B. 59, 20
        je      ?_074                                   ; 0601 _ 0F 84, FFFFFCBA
        cmp     ebx, dword [r9+28H]                     ; 0607 _ 41: 3B. 59, 28
        je      ?_074                                   ; 060B _ 0F 84, FFFFFCB0
        cmp     ebx, dword [r9+30H]                     ; 0611 _ 41: 3B. 59, 30
        je      ?_074                                   ; 0615 _ 0F 84, FFFFFCA6
        cmp     ebx, dword [r9+38H]                     ; 061B _ 41: 3B. 59, 38
        je      ?_074                                   ; 061F _ 0F 84, FFFFFC9C
        add     r9, 64                                  ; 0625 _ 49: 83. C1, 40
        cmp     ebx, dword [r9]                         ; 0629 _ 41: 3B. 19
        jnz     ?_093                                   ; 062C _ 75, A4
        jmp     ?_074                                   ; 062E _ E9, FFFFFC8E
; _ZNK8Position12pseudo_legalE4Move End of function

?_094:  ; Local function
        mov     r9d, 8                                  ; 0633 _ 41: B9, 00000008
        jmp     ?_086                                   ; 0639 _ E9, FFFFFE89

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

_ZN9CheckInfoC1ERK8Position:; Function begin

_ZN9CheckInfoC2ERK8Position:
        push    r15                                     ; 0640 _ 41: 57
        push    r14                                     ; 0642 _ 41: 56
        push    r13                                     ; 0644 _ 41: 55
        push    r12                                     ; 0646 _ 41: 54
        push    rbp                                     ; 0648 _ 55
        push    rdi                                     ; 0649 _ 57
        push    rsi                                     ; 064A _ 56
        push    rbx                                     ; 064B _ 53
        sub     rsp, 24                                 ; 064C _ 48: 83. EC, 18
        mov     ebp, dword [rdx+3ACH]                   ; 0650 _ 8B. AA, 000003AC
        mov     r9, qword [rdx+130H]                    ; 0656 _ 4C: 8B. 8A, 00000130
        mov     r10, qword [rdx+128H]                   ; 065D _ 4C: 8B. 92, 00000128
        mov     eax, ebp                                ; 0664 _ 89. E8
        mov     edi, ebp                                ; 0666 _ 89. EF
        xor     eax, 01H                                ; 0668 _ 83. F0, 01
        mov     rsi, r9                                 ; 066B _ 4C: 89. CE
        and     r9, qword [rdx+rdi*8+140H]              ; 066E _ 4C: 23. 8C FA, 00000140
        mov     r8d, eax                                ; 0676 _ 41: 89. C0
        mov     rdi, qword [rel .refptr.PseudoAttacks]  ; 0679 _ 48: 8B. 3D, 00000000(rel)
        movsxd  r13, eax                                ; 0680 _ 4C: 63. E8
        and     rsi, qword [rdx+r8*8+140H]              ; 0683 _ 4A: 23. B4 C2, 00000140
        mov     r8, r10                                 ; 068B _ 4D: 89. D0
        or      r10, qword [rdx+118H]                   ; 068E _ 4C: 0B. 92, 00000118
        or      r8, qword [rdx+120H]                    ; 0695 _ 4C: 0B. 82, 00000120
        bsf     r9, r9                                  ; 069C _ 4D: 0F BC. C9
        bsf     rbx, rsi                                ; 06A0 _ 48: 0F BC. DE
        mov     r12, r10                                ; 06A4 _ 4D: 89. D4
        and     r12, qword [rdi+r9*8+600H]              ; 06A7 _ 4E: 23. A4 CF, 00000600
        mov     qword [rcx+50H], rbx                    ; 06AF _ 48: 89. 59, 50
        mov     r11, r8                                 ; 06B3 _ 4D: 89. C3
        and     r11, qword [rdi+r9*8+800H]              ; 06B6 _ 4E: 23. 9C CF, 00000800
        or      r11, r12                                ; 06BE _ 4D: 09. E3
        and     r11, qword [rdx+r13*8+140H]             ; 06C1 _ 4E: 23. 9C EA, 00000140
        jne     ?_097                                   ; 06C9 _ 0F 85, 000000F1
        movsxd  r11, ebp                                ; 06CF _ 4C: 63. DD
        xor     r12d, r12d                              ; 06D2 _ 45: 31. E4
        mov     rbp, qword [rdx+r11*8+140H]             ; 06D5 _ 4A: 8B. AC DA, 00000140
?_095:  bsf     rsi, rsi                                ; 06DD _ 48: 0F BC. F6
        mov     qword [rcx+8H], r12                     ; 06E1 _ 4C: 89. 61, 08
        and     r10, qword [rdi+rsi*8+600H]             ; 06E5 _ 4C: 23. 94 F7, 00000600
        xor     r9d, r9d                                ; 06ED _ 45: 31. C9
        and     r8, qword [rdi+rsi*8+800H]              ; 06F0 _ 4C: 23. 84 F7, 00000800
        or      r8, r10                                 ; 06F8 _ 4D: 09. D0
        and     r8, rbp                                 ; 06FB _ 49: 21. E8
        jne     ?_100                                   ; 06FE _ 0F 85, 0000011C
?_096:  mov     rbp, qword [rel .refptr.StepAttacksBB]  ; 0704 _ 48: 8B. 2D, 00000000(rel)
        lea     r13d, [rax*8+1H]                        ; 070B _ 44: 8D. 2C C5, 00000001
        mov     qword [rcx], r9                         ; 0713 _ 4C: 89. 09
        shl     r13, 6                                  ; 0716 _ 49: C1. E5, 06
        mov     r8, qword [rel .refptr.BishopAttacks]   ; 071A _ 4C: 8B. 05, 00000000(rel)
        add     r13, rbx                                ; 0721 _ 49: 01. DD
        sub     rbx, -128                               ; 0724 _ 48: 83. EB, 80
        mov     rdi, qword [rel .refptr.BishopMasks]    ; 0728 _ 48: 8B. 3D, 00000000(rel)
        lea     rsi, [rbx*8]                            ; 072F _ 48: 8D. 34 DD, 00000000
        mov     rax, qword [rbp+r13*8]                  ; 0737 _ 4A: 8B. 44 ED, 00
        mov     r15, qword [rsi+r8-400H]                ; 073C _ 4E: 8B. BC 06, FFFFFC00
        mov     qword [rcx+18H], rax                    ; 0744 _ 48: 89. 41, 18
        mov     rbx, qword [rbp+rbx*8]                  ; 0748 _ 48: 8B. 5C DD, 00
        mov     rax, qword [rel .refptr.RookAttacks]    ; 074D _ 48: 8B. 05, 00000000(rel)
        mov     qword [rcx+20H], rbx                    ; 0754 _ 48: 89. 59, 20
        mov     r9, qword [rdx+100H]                    ; 0758 _ 4C: 8B. 8A, 00000100
        pext    r11, r9, qword [rsi+rdi-400H]           ; 075F _ C4 62 B2: F5. 9C 3E, FFFFFC00
        mov     r10d, r11d                              ; 0769 _ 45: 89. DA
        mov     r14, qword [r15+r10*8]                  ; 076C _ 4F: 8B. 34 D7
        mov     qword [rcx+28H], r14                    ; 0770 _ 4C: 89. 71, 28
        mov     r12, qword [rdx+100H]                   ; 0774 _ 4C: 8B. A2, 00000100
        mov     rdx, qword [rel .refptr.RookMasks]      ; 077B _ 48: 8B. 15, 00000000(rel)
        pext    rbp, r12, qword [rsi+rdx-400H]          ; 0782 _ C4 E2 9A: F5. AC 16, FFFFFC00
        mov     r13d, ebp                               ; 078C _ 41: 89. ED
        mov     rsi, qword [rsi+rax-400H]               ; 078F _ 48: 8B. B4 06, FFFFFC00
        mov     rbx, qword [rsi+r13*8]                  ; 0797 _ 4A: 8B. 1C EE
        mov     qword [rcx+40H], 0                      ; 079B _ 48: C7. 41, 40, 00000000
        or      r14, rbx                                ; 07A3 _ 49: 09. DE
        mov     qword [rcx+30H], rbx                    ; 07A6 _ 48: 89. 59, 30
        mov     qword [rcx+38H], r14                    ; 07AA _ 4C: 89. 71, 38
        add     rsp, 24                                 ; 07AE _ 48: 83. C4, 18
        pop     rbx                                     ; 07B2 _ 5B
        pop     rsi                                     ; 07B3 _ 5E
        pop     rdi                                     ; 07B4 _ 5F
        pop     rbp                                     ; 07B5 _ 5D
        pop     r12                                     ; 07B6 _ 41: 5C
        pop     r13                                     ; 07B8 _ 41: 5D
        pop     r14                                     ; 07BA _ 41: 5E
        pop     r15                                     ; 07BC _ 41: 5F
        ret                                             ; 07BE _ C3

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_097:  movsxd  r14, ebp                                ; 07C0 _ 4C: 63. F5
        xor     r12d, r12d                              ; 07C3 _ 45: 31. E4
        shl     r9, 6                                   ; 07C6 _ 49: C1. E1, 06
        mov     dword [rsp+0CH], eax                    ; 07CA _ 89. 44 24, 0C
        mov     r15, qword [rdx+100H]                   ; 07CE _ 4C: 8B. BA, 00000100
        mov     rbp, qword [rdx+r14*8+140H]             ; 07D5 _ 4A: 8B. AC F2, 00000140
?_098:  mov     rax, qword [rel .refptr.BetweenBB]      ; 07DD _ 48: 8B. 05, 00000000(rel)
        mov     r14, r15                                ; 07E4 _ 4D: 89. FE
        bsf     r13, r11                                ; 07E7 _ 4D: 0F BC. EB
        add     r13, r9                                 ; 07EB _ 4D: 01. CD
        blsr    r11, r11                                ; 07EE _ C4 C2 A0: F3. CB
        and     r14, qword [rax+r13*8]                  ; 07F3 _ 4E: 23. 34 E8
        blsr    rax, r14                                ; 07F7 _ C4 C2 F8: F3. CE
        test    rax, rax                                ; 07FC _ 48: 85. C0
        mov     r13, r14                                ; 07FF _ 4D: 89. F5
        jnz     ?_099                                   ; 0802 _ 75, 06
        and     r13, rbp                                ; 0804 _ 49: 21. ED
        or      r12, r13                                ; 0807 _ 4D: 09. EC
?_099:  test    r11, r11                                ; 080A _ 4D: 85. DB
        jnz     ?_098                                   ; 080D _ 75, CE
        mov     eax, dword [rsp+0CH]                    ; 080F _ 8B. 44 24, 0C
        jmp     ?_095                                   ; 0813 _ E9, FFFFFEC5

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_100:  mov     rdi, qword [rdx+100H]                   ; 0820 _ 48: 8B. BA, 00000100
        shl     rsi, 6                                  ; 0827 _ 48: C1. E6, 06
        mov     r11, qword [rel .refptr.BetweenBB]      ; 082B _ 4C: 8B. 1D, 00000000(rel)
?_101:  bsf     r10, r8                                 ; 0832 _ 4D: 0F BC. D0
        add     r10, rsi                                ; 0836 _ 49: 01. F2
        mov     r15, rdi                                ; 0839 _ 49: 89. FF
        blsr    r8, r8                                  ; 083C _ C4 C2 B8: F3. C8
        and     r15, qword [r11+r10*8]                  ; 0841 _ 4F: 23. 3C D3
        blsr    r12, r15                                ; 0845 _ C4 C2 98: F3. CF
        test    r12, r12                                ; 084A _ 4D: 85. E4
        mov     r14, r15                                ; 084D _ 4D: 89. FE
        jnz     ?_102                                   ; 0850 _ 75, 06
        and     r14, rbp                                ; 0852 _ 49: 21. EE
        or      r9, r14                                 ; 0855 _ 4D: 09. F1
?_102:  test    r8, r8                                  ; 0858 _ 4D: 85. C0
        je      ?_096                                   ; 085B _ 0F 84, FFFFFEA3
        jmp     ?_101                                   ; 0861 _ EB, CF
; _ZN9CheckInfoC1ERK8Position End of function

        nop                                             ; 0863 _ 90
; Filling space: 0CH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 2EH, 0FH, 1FH, 84H, 00H
;       db 00H, 00H, 00H, 00H

ALIGN   16

_ZNK8Position9key_afterE4Move:; Function begin
        push    rsi                                     ; 0870 _ 56
        push    rbx                                     ; 0871 _ 53
        mov     r9, qword [rel _ZN7Zobrist4sideE]       ; 0872 _ 4C: 8B. 0D, 00000008(rel)
        lea     rbx, [rel _ZN7Zobrist3psqE]             ; 0879 _ 48: 8D. 1D, 00000100(rel)
        mov     r11d, dword [rcx+3ACH]                  ; 0880 _ 44: 8B. 99, 000003AC
        mov     esi, edx                                ; 0887 _ 89. D6
        and     edx, 3FH                                ; 0889 _ 83. E2, 3F
        sar     esi, 6                                  ; 088C _ C1. FE, 06
        mov     r8d, dword [rcx+rdx*4]                  ; 088F _ 44: 8B. 04 91
        and     esi, 3FH                                ; 0893 _ 83. E6, 3F
        mov     r10d, dword [rcx+rsi*4]                 ; 0896 _ 44: 8B. 14 B1
        mov     rcx, qword [rcx+3B8H]                   ; 089A _ 48: 8B. 89, 000003B8
        and     r10d, 07H                               ; 08A1 _ 41: 83. E2, 07
        xor     r9, qword [rcx+30H]                     ; 08A5 _ 4C: 33. 49, 30
        and     r8d, 07H                                ; 08A9 _ 41: 83. E0, 07
        jz      ?_103                                   ; 08AD _ 74, 1A
        mov     eax, r11d                               ; 08AF _ 44: 89. D8
        mov     r8d, r8d                                ; 08B2 _ 45: 89. C0
        xor     eax, 01H                                ; 08B5 _ 83. F0, 01
        cdqe                                            ; 08B8 _ 48: 98
        lea     rcx, [r8+rax*8]                         ; 08BA _ 49: 8D. 0C C0
        shl     rcx, 6                                  ; 08BE _ 48: C1. E1, 06
        add     rcx, rdx                                ; 08C2 _ 48: 01. D1
        xor     r9, qword [rbx+rcx*8]                   ; 08C5 _ 4C: 33. 0C CB
?_103:  mov     r10d, r10d                              ; 08C9 _ 45: 89. D2
        movsxd  r11, r11d                               ; 08CC _ 4D: 63. DB
        lea     r8, [r10+r11*8]                         ; 08CF _ 4F: 8D. 04 DA
        shl     r8, 6                                   ; 08D3 _ 49: C1. E0, 06
        lea     rsi, [r8+rsi]                           ; 08D7 _ 49: 8D. 34 30
        add     rdx, r8                                 ; 08DB _ 4C: 01. C2
        mov     rax, qword [rbx+rsi*8]                  ; 08DE _ 48: 8B. 04 F3
        xor     rax, qword [rbx+rdx*8]                  ; 08E2 _ 48: 33. 04 D3
        xor     rax, r9                                 ; 08E6 _ 4C: 31. C8
        pop     rbx                                     ; 08E9 _ 5B
        pop     rsi                                     ; 08EA _ 5E
        ret                                             ; 08EB _ C3
; _ZNK8Position9key_afterE4Move End of function

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_ZN8Position7do_moveE4MoveR9StateInfob:; Function begin
        push    r15                                     ; 08F0 _ 41: 57
        push    r14                                     ; 08F2 _ 41: 56
        push    r13                                     ; 08F4 _ 41: 55
        push    r12                                     ; 08F6 _ 41: 54
        push    rbp                                     ; 08F8 _ 55
        push    rdi                                     ; 08F9 _ 57
        push    rsi                                     ; 08FA _ 56
        push    rbx                                     ; 08FB _ 53
        sub     rsp, 104                                ; 08FC _ 48: 83. EC, 68
        mov     r13, qword [rel _ZN7Zobrist4sideE]      ; 0900 _ 4C: 8B. 2D, 00000008(rel)
        mov     rax, qword [rcx+3B8H]                   ; 0907 _ 48: 8B. 81, 000003B8
        add     qword [rcx+3A0H], 1                     ; 090E _ 48: 83. 81, 000003A0, 01
        mov     rsi, rcx                                ; 0916 _ 48: 89. CE
        mov     rcx, qword [rax]                        ; 0919 _ 48: 8B. 08
        mov     rbx, r8                                 ; 091C _ 4C: 89. C3
        mov     dword [rsp+44H], r9d                    ; 091F _ 44: 89. 4C 24, 44
        xor     r13, qword [rax+30H]                    ; 0924 _ 4C: 33. 68, 30
        mov     r14d, edx                               ; 0928 _ 41: 89. D6
        mov     r15d, edx                               ; 092B _ 41: 89. D7
        sar     r14d, 6                                 ; 092E _ 41: C1. FE, 06
        and     r15d, 3FH                               ; 0932 _ 41: 83. E7, 3F
        and     r14d, 3FH                               ; 0936 _ 41: 83. E6, 3F
        mov     qword [r8], rcx                         ; 093A _ 49: 89. 08
        mov     rdi, qword [rax+8H]                     ; 093D _ 48: 8B. 78, 08
        movsxd  rcx, r15d                               ; 0941 _ 49: 63. CF
        mov     dword [rsp+48H], r14d                   ; 0944 _ 44: 89. 74 24, 48
        mov     qword [r8+8H], rdi                      ; 0949 _ 49: 89. 78, 08
        mov     rbp, qword [rax+10H]                    ; 094D _ 48: 8B. 68, 10
        mov     qword [r8+10H], rbp                     ; 0951 _ 49: 89. 68, 10
        mov     r8, qword [rax+18H]                     ; 0955 _ 4C: 8B. 40, 18
        mov     ebp, edx                                ; 0959 _ 89. D5
        and     ebp, 0C000H                             ; 095B _ 81. E5, 0000C000
        mov     qword [rbx+18H], r8                     ; 0961 _ 4C: 89. 43, 18
        mov     r9, qword [rax+20H]                     ; 0965 _ 4C: 8B. 48, 20
        mov     qword [rbx+20H], r9                     ; 0969 _ 4C: 89. 4B, 20
        mov     r10, qword [rax+28H]                    ; 096D _ 4C: 8B. 50, 28
        movsxd  r9, r14d                                ; 0971 _ 4D: 63. CE
        lea     rax, [rsi+r9*4]                         ; 0974 _ 4A: 8D. 04 8E
        mov     qword [rbx+28H], r10                    ; 0978 _ 4C: 89. 53, 28
        mov     r11, qword [rsi+3B8H]                   ; 097C _ 4C: 8B. 9E, 000003B8
        mov     r12d, dword [rsi+3ACH]                  ; 0983 _ 44: 8B. A6, 000003AC
        mov     qword [rbx+48H], r11                    ; 098A _ 4C: 89. 5B, 48
        add     dword [rsi+3A8H], 1                     ; 098E _ 83. 86, 000003A8, 01
        mov     qword [rsi+3B8H], rbx                   ; 0995 _ 48: 89. 9E, 000003B8
        add     dword [rbx+1CH], 1                      ; 099C _ 83. 43, 1C, 01
        mov     dword [rsp+28H], r12d                   ; 09A0 _ 44: 89. 64 24, 28
        xor     r12d, 01H                               ; 09A5 _ 41: 83. F4, 01
        add     dword [rbx+20H], 1                      ; 09A9 _ 83. 43, 20, 01
        mov     edi, dword [rax]                        ; 09AD _ 8B. 38
        mov     dword [rsp+40H], r12d                   ; 09AF _ 44: 89. 64 24, 40
        and     edi, 07H                                ; 09B4 _ 83. E7, 07
        cmp     ebp, 32768                              ; 09B7 _ 81. FD, 00008000
        mov     dword [rsp+20H], edi                    ; 09BD _ 89. 7C 24, 20
        mov     dword [rsp+30H], ebp                    ; 09C1 _ 89. 6C 24, 30
        je      ?_124                                   ; 09C5 _ 0F 84, 000006A7
        lea     r10, [rsi+rcx*4]                        ; 09CB _ 4C: 8D. 14 8E
        mov     r8d, dword [r10]                        ; 09CF _ 45: 8B. 02
        and     r8d, 07H                                ; 09D2 _ 41: 83. E0, 07
        cmp     ebp, 49152                              ; 09D6 _ 81. FD, 0000C000
        je      ?_121                                   ; 09DC _ 0F 84, 000004FE
        test    r8d, r8d                                ; 09E2 _ 45: 85. C0
        jne     ?_110                                   ; 09E5 _ 0F 85, 000000F8
        mov     r15d, dword [rbx+24H]                   ; 09EB _ 44: 8B. 7B, 24
        lea     r11, [rel _ZN7Zobrist3psqE]             ; 09EF _ 4C: 8D. 1D, 00000100(rel)
        movsxd  rdi, dword [rsp+28H]                    ; 09F6 _ 48: 63. 7C 24, 28
        mov     rbp, qword [rel .refptr._ZN4PSQT3psqE]  ; 09FB _ 48: 8B. 2D, 00000000(rel)
?_104:  mov     r10d, dword [rsp+20H]                   ; 0A02 _ 44: 8B. 54 24, 20
        lea     r12, [r10+rdi*8]                        ; 0A07 _ 4D: 8D. 24 FA
        shl     r12, 6                                  ; 0A0B _ 49: C1. E4, 06
        lea     r14, [r12+r9]                           ; 0A0F _ 4F: 8D. 34 0C
        add     r12, rcx                                ; 0A13 _ 49: 01. CC
        xor     r13, qword [r11+r14*8]                  ; 0A16 _ 4F: 33. 2C F3
        xor     r13, qword [r11+r12*8]                  ; 0A1A _ 4F: 33. 2C E3
        mov     r12, qword [rbx+28H]                    ; 0A1E _ 4C: 8B. 63, 28
        mov     qword [rsp+38H], r13                    ; 0A22 _ 4C: 89. 6C 24, 38
        cmp     r12, 64                                 ; 0A27 _ 49: 83. FC, 40
        jne     ?_123                                   ; 0A2B _ 0F 85, 0000061F
?_105:  mov     r12d, dword [rbx+18H]                   ; 0A31 _ 44: 8B. 63, 18
        test    r12d, r12d                              ; 0A35 _ 45: 85. E4
        jne     ?_118                                   ; 0A38 _ 0F 85, 00000266
?_106:  cmp     dword [rsp+30H], 49152                  ; 0A3E _ 81. 7C 24, 30, 0000C000
        jz      ?_107                                   ; 0A46 _ 74, 3A
        mov     r14, qword [rel .refptr.SquareBB]       ; 0A48 _ 4C: 8B. 35, 00000000(rel)
        mov     r13, qword [r14+rcx*8]                  ; 0A4F _ 4D: 8B. 2C CE
        xor     r13, qword [r14+r9*8]                   ; 0A53 _ 4F: 33. 2C CE
        xor     qword [rsi+100H], r13                   ; 0A57 _ 4C: 31. AE, 00000100
        xor     qword [rsi+r10*8+100H], r13             ; 0A5E _ 4E: 31. AC D6, 00000100
        xor     qword [rsi+rdi*8+140H], r13             ; 0A66 _ 4C: 31. AC FE, 00000140
        mov     dword [rax], 0                          ; 0A6E _ C7. 00, 00000000
        mov     eax, dword [rsp+28H]                    ; 0A74 _ 8B. 44 24, 28
        shl     eax, 3                                  ; 0A78 _ C1. E0, 03
        or      eax, dword [rsp+20H]                    ; 0A7B _ 0B. 44 24, 20
        mov     dword [rsi+rcx*4], eax                  ; 0A7F _ 89. 04 8E
?_107:  cmp     dword [rsp+20H], 1                      ; 0A82 _ 83. 7C 24, 20, 01
        je      ?_114                                   ; 0A87 _ 0F 84, 00000173
?_108:  lea     r10, [r10+rdi*8]                        ; 0A8D _ 4D: 8D. 14 FA
        xor     eax, eax                                ; 0A91 _ 31. C0
        shl     r10, 6                                  ; 0A93 _ 49: C1. E2, 06
        add     rcx, r10                                ; 0A97 _ 4C: 01. D1
        add     r9, r10                                 ; 0A9A _ 4D: 01. D1
        mov     ecx, dword [rbp+rcx*4]                  ; 0A9D _ 8B. 4C 8D, 00
        add     ecx, r15d                               ; 0AA1 _ 44: 01. F9
        sub     ecx, dword [rbp+r9*4]                   ; 0AA4 _ 42: 2B. 4C 8D, 00
        mov     dword [rbx+40H], r8d                    ; 0AA9 _ 44: 89. 43, 40
        mov     rbp, qword [rsp+38H]                    ; 0AAD _ 48: 8B. 6C 24, 38
        cmp     byte [rsp+44H], 0                       ; 0AB2 _ 80. 7C 24, 44, 00
        mov     dword [rbx+24H], ecx                    ; 0AB7 _ 89. 4B, 24
        mov     qword [rbx+30H], rbp                    ; 0ABA _ 48: 89. 6B, 30
        jne     ?_117                                   ; 0ABE _ 0F 85, 000001AC
?_109:  mov     qword [rbx+38H], rax                    ; 0AC4 _ 48: 89. 43, 38
        mov     ebx, dword [rsp+40H]                    ; 0AC8 _ 8B. 5C 24, 40
        mov     dword [rsi+3ACH], ebx                   ; 0ACC _ 89. 9E, 000003AC
        add     rsp, 104                                ; 0AD2 _ 48: 83. C4, 68
        pop     rbx                                     ; 0AD6 _ 5B
        pop     rsi                                     ; 0AD7 _ 5E
        pop     rdi                                     ; 0AD8 _ 5F
        pop     rbp                                     ; 0AD9 _ 5D
        pop     r12                                     ; 0ADA _ 41: 5C
        pop     r13                                     ; 0ADC _ 41: 5D
        pop     r14                                     ; 0ADE _ 41: 5E
        pop     r15                                     ; 0AE0 _ 41: 5F
        ret                                             ; 0AE2 _ C3

?_110:  cmp     r8d, 1                                  ; 0AE3 _ 41: 83. F8, 01
        je      ?_112                                   ; 0AE7 _ 0F 84, 000000D3
        movsxd  r12, dword [rsp+40H]                    ; 0AED _ 4C: 63. 64 24, 40
        lea     r11, [rel PieceValue]                   ; 0AF2 _ 4C: 8D. 1D, 00000000(rel)
        mov     ebp, r8d                                ; 0AF9 _ 44: 89. C5
        mov     r10, rcx                                ; 0AFC _ 49: 89. CA
        mov     r14d, dword [r11+rbp*4]                 ; 0AFF _ 45: 8B. 34 AB
        lea     r11, [rel _ZN7Zobrist3psqE]             ; 0B03 _ 4C: 8D. 1D, 00000100(rel)
        sub     dword [rbx+r12*4+10H], r14d             ; 0B0A _ 46: 29. 74 A3, 10
?_111:  mov     r14, qword [rel .refptr.SquareBB]       ; 0B0F _ 4C: 8B. 35, 00000000(rel)
        shl     r12, 3                                  ; 0B16 _ 49: C1. E4, 03
        mov     r15, qword [r14+r10*8]                  ; 0B1A _ 4F: 8B. 3C D6
        xor     qword [rsi+100H], r15                   ; 0B1E _ 4C: 31. BE, 00000100
        lea     r15, [rsi+rbp*8]                        ; 0B25 _ 4C: 8D. 3C EE
        add     rbp, r12                                ; 0B29 _ 4C: 01. E5
        mov     rdi, qword [r14+r10*8]                  ; 0B2C _ 4B: 8B. 3C D6
        shl     rbp, 6                                  ; 0B30 _ 48: C1. E5, 06
        xor     rdi, qword [r15+100H]                   ; 0B34 _ 49: 33. BF, 00000100
        mov     qword [r15+100H], rdi                   ; 0B3B _ 49: 89. BF, 00000100
        lea     r15, [rsi+r12]                          ; 0B42 _ 4E: 8D. 3C 26
        mov     r14, qword [r14+r10*8]                  ; 0B46 _ 4F: 8B. 34 D6
        add     r10, rbp                                ; 0B4A _ 49: 01. EA
        xor     r14, qword [r15+140H]                   ; 0B4D _ 4D: 33. B7, 00000140
        and     rdi, r14                                ; 0B54 _ 4C: 21. F7
        mov     qword [r15+140H], r14                   ; 0B57 _ 4D: 89. B7, 00000140
        xor     r13, qword [r11+r10*8]                  ; 0B5E _ 4F: 33. 2C D3
        popcnt  r12, rdi                                ; 0B62 _ F3 4C: 0F B8. E7
        add     rbp, r12                                ; 0B67 _ 4C: 01. E5
        mov     r14d, dword [rbx+24H]                   ; 0B6A _ 44: 8B. 73, 24
        mov     rdi, qword [r11+rbp*8]                  ; 0B6E _ 49: 8B. 3C EB
        xor     rdi, qword [rbx+8H]                     ; 0B72 _ 48: 33. 7B, 08
        mov     rbp, qword [rsi+3B0H]                   ; 0B76 _ 48: 8B. AE, 000003B0
        mov     qword [rbx+8H], rdi                     ; 0B7D _ 48: 89. 7B, 08
        and     edi, 1FFFH                              ; 0B81 _ 81. E7, 00001FFF
        lea     r15, [rdi+rdi*2]                        ; 0B87 _ 4C: 8D. 3C 7F
        movsxd  rdi, dword [rsp+28H]                    ; 0B8B _ 48: 63. 7C 24, 28
        shl     r15, 4                                  ; 0B90 _ 49: C1. E7, 04
        add     r15, qword [rbp+60H]                    ; 0B94 _ 4C: 03. 7D, 60
        mov     rbp, qword [rel .refptr._ZN4PSQT3psqE]  ; 0B98 _ 48: 8B. 2D, 00000000(rel)
        prefetcht0 [r15]                                ; 0B9F _ 41: 0F 18. 0F
        sub     r14d, dword [rbp+r10*4]                 ; 0BA3 _ 46: 2B. 74 95, 00
        mov     dword [rbx+1CH], 0                      ; 0BA8 _ C7. 43, 1C, 00000000
        mov     r15d, r14d                              ; 0BAF _ 45: 89. F7
        mov     dword [rbx+24H], r14d                   ; 0BB2 _ 44: 89. 73, 24
        jmp     ?_104                                   ; 0BB6 _ E9, FFFFFE47

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_112:  cmp     dword [rsp+30H], 32768                  ; 0BC0 _ 81. 7C 24, 30, 00008000
        je      ?_124                                   ; 0BC8 _ 0F 84, 000004A4
        mov     r10, rcx                                ; 0BCE _ 49: 89. CA
?_113:  movsxd  r12, dword [rsp+40H]                    ; 0BD1 _ 4C: 63. 64 24, 40
        lea     r11, [rel _ZN7Zobrist3psqE]             ; 0BD6 _ 4C: 8D. 1D, 00000100(rel)
        mov     r8d, 1                                  ; 0BDD _ 41: B8, 00000001
        mov     r15, r12                                ; 0BE3 _ 4D: 89. E7
        shl     r15, 9                                  ; 0BE6 _ 49: C1. E7, 09
        lea     rdi, [r10+r15+40H]                      ; 0BEA _ 4B: 8D. 7C 3A, 40
        mov     rbp, qword [r11+rdi*8]                  ; 0BEF _ 49: 8B. 2C FB
        xor     qword [rbx], rbp                        ; 0BF3 _ 48: 31. 2B
        mov     ebp, 1                                  ; 0BF6 _ BD, 00000001
        jmp     ?_111                                   ; 0BFB _ E9, FFFFFF0F

?_114:  mov     r14d, dword [rsp+48H]                   ; 0C00 _ 44: 8B. 74 24, 48
        xor     r14d, ecx                               ; 0C05 _ 41: 31. CE
        cmp     r14d, 16                                ; 0C08 _ 41: 83. FE, 10
        je      ?_119                                   ; 0C0C _ 0F 84, 000000DE
?_115:  cmp     dword [rsp+30H], 16384                  ; 0C12 _ 81. 7C 24, 30, 00004000
        je      ?_120                                   ; 0C1A _ 0F 84, 0000015C
        mov     rdx, qword [rbx]                        ; 0C20 _ 48: 8B. 13
?_116:  mov     r13, rdi                                ; 0C23 _ 49: 89. FD
        shl     r13, 9                                  ; 0C26 _ 49: C1. E5, 09
        lea     r14, [rcx+r13+40H]                      ; 0C2A _ 4E: 8D. 74 29, 40
        lea     r12, [r9+r13+40H]                       ; 0C2F _ 4F: 8D. 64 29, 40
        mov     rax, qword [r11+r14*8]                  ; 0C34 _ 4B: 8B. 04 F3
        xor     rax, qword [r11+r12*8]                  ; 0C38 _ 4B: 33. 04 E3
        mov     r11, qword [rsi+3B0H]                   ; 0C3C _ 4C: 8B. 9E, 000003B0
        xor     rdx, rax                                ; 0C43 _ 48: 31. C2
        mov     qword [rbx], rdx                        ; 0C46 _ 48: 89. 13
        and     edx, 3FFFH                              ; 0C49 _ 81. E2, 00003FFF
        mov     r13, rdx                                ; 0C4F _ 49: 89. D5
        shl     r13, 7                                  ; 0C52 _ 49: C1. E5, 07
        lea     rdx, [r13+rdx*8]                        ; 0C56 _ 49: 8D. 54 D5, 00
        add     rdx, qword [r11+48H]                    ; 0C5B _ 49: 03. 53, 48
        prefetcht0 [rdx]                                ; 0C5F _ 0F 18. 0A
        mov     dword [rbx+1CH], 0                      ; 0C62 _ C7. 43, 1C, 00000000
        jmp     ?_108                                   ; 0C69 _ E9, FFFFFE1F

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_117:  mov     r8d, dword [rsp+40H]                    ; 0C70 _ 44: 8B. 44 24, 40
        mov     rcx, rsi                                ; 0C75 _ 48: 89. F1
        mov     r9, qword [rsi+r8*8+140H]               ; 0C78 _ 4E: 8B. 8C C6, 00000140
        mov     r8, qword [rsi+100H]                    ; 0C80 _ 4C: 8B. 86, 00000100
        and     r9, qword [rsi+130H]                    ; 0C87 _ 4C: 23. 8E, 00000130
        bsf     rdx, r9                                 ; 0C8E _ 49: 0F BC. D1
        call    _ZNK8Position12attackers_toE6Squarey    ; 0C92 _ E8, FFFFF369
        and     rax, qword [rsi+rdi*8+140H]             ; 0C97 _ 48: 23. 84 FE, 00000140
        jmp     ?_109                                   ; 0C9F _ E9, FFFFFE20

?_118:  mov     r13d, dword [rsi+rcx*4+150H]            ; 0CA4 _ 44: 8B. AC 8E, 00000150
        or      r13d, dword [rax+150H]                  ; 0CAC _ 44: 0B. A8, 00000150
        mov     dword [rsp+50H], r13d                   ; 0CB3 _ 44: 89. 6C 24, 50
        je      ?_106                                   ; 0CB8 _ 0F 84, FFFFFD80
        mov     r14d, r13d                              ; 0CBE _ 45: 89. EE
        lea     r13, [rel _ZN7Zobrist8castlingE]        ; 0CC1 _ 4C: 8D. 2D, 00000040(rel)
        and     r14d, r12d                              ; 0CC8 _ 45: 21. E6
        movsxd  r14, r14d                               ; 0CCB _ 4D: 63. F6
        mov     r14, qword [r13+r14*8]                  ; 0CCE _ 4F: 8B. 74 F5, 00
        mov     r13d, dword [rsp+50H]                   ; 0CD3 _ 44: 8B. 6C 24, 50
        xor     qword [rsp+38H], r14                    ; 0CD8 _ 4C: 31. 74 24, 38
        andn    r12d, r13d, r12d                        ; 0CDD _ C4 42 10: F2. E4
        mov     dword [rbx+18H], r12d                   ; 0CE2 _ 44: 89. 63, 18
        jmp     ?_106                                   ; 0CE6 _ E9, FFFFFD53

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_119:  movsxd  rax, dword [rsp+40H]                    ; 0CF0 _ 48: 63. 44 24, 40
        cmp     dword [rsp+28H], 1                      ; 0CF5 _ 83. 7C 24, 28, 01
        mov     r14, qword [rsi+rax*8+140H]             ; 0CFA _ 4C: 8B. B4 C6, 00000140
        mov     eax, dword [rsp+28H]                    ; 0D02 _ 8B. 44 24, 28
        sbb     r12d, r12d                              ; 0D06 _ 45: 19. E4
        and     r12d, 10H                               ; 0D09 _ 41: 83. E4, 10
        and     r14, qword [rsi+108H]                   ; 0D0D _ 4C: 23. B6, 00000108
        lea     r12d, [r12-8H]                          ; 0D14 _ 45: 8D. 64 24, F8
        lea     eax, [rax*8+1H]                         ; 0D19 _ 8D. 04 C5, 00000001
        mov     qword [rsp+20H], rax                    ; 0D20 _ 48: 89. 44 24, 20
        mov     eax, ecx                                ; 0D25 _ 89. C8
        sub     eax, r12d                               ; 0D27 _ 44: 29. E0
        movsxd  r12, eax                                ; 0D2A _ 4C: 63. E0
        mov     rax, qword [rsp+20H]                    ; 0D2D _ 48: 8B. 44 24, 20
        shl     rax, 6                                  ; 0D32 _ 48: C1. E0, 06
        add     rax, r12                                ; 0D36 _ 4C: 01. E0
        mov     r12, qword [rel .refptr.StepAttacksBB]  ; 0D39 _ 4C: 8B. 25, 00000000(rel)
        test    qword [r12+rax*8], r14                  ; 0D40 _ 4D: 85. 34 C4
        je      ?_115                                   ; 0D44 _ 0F 84, FFFFFEC8
        mov     eax, dword [rsp+48H]                    ; 0D4A _ 8B. 44 24, 48
        mov     r13d, 2                                 ; 0D4E _ 41: BD, 00000002
        lea     r12, [rel _ZN7Zobrist9enpassantE]       ; 0D54 _ 4C: 8D. 25, 000000C0(rel)
        add     eax, ecx                                ; 0D5B _ 01. C8
        cdq                                             ; 0D5D _ 99
        idiv    r13d                                    ; 0D5E _ 41: F7. FD
        mov     rdx, qword [rbx]                        ; 0D61 _ 48: 8B. 13
        movsxd  r14, eax                                ; 0D64 _ 4C: 63. F0
        and     eax, 07H                                ; 0D67 _ 83. E0, 07
        mov     rax, qword [r12+rax*8]                  ; 0D6A _ 49: 8B. 04 C4
        mov     qword [rbx+28H], r14                    ; 0D6E _ 4C: 89. 73, 28
        xor     qword [rsp+38H], rax                    ; 0D72 _ 48: 31. 44 24, 38
        jmp     ?_116                                   ; 0D77 _ E9, FFFFFEA7

?_120:  mov     rax, qword [rel .refptr.SquareBB]       ; 0D7C _ 48: 8B. 05, 00000000(rel)
        sar     edx, 12                                 ; 0D83 _ C1. FA, 0C
        and     edx, 03H                                ; 0D86 _ 83. E2, 03
        lea     r13d, [rdx+2H]                          ; 0D89 _ 44: 8D. 6A, 02
        lea     rdx, [rdi*8]                            ; 0D8D _ 48: 8D. 14 FD, 00000000
        mov     dword [rsp+20H], r13d                   ; 0D95 _ 44: 89. 6C 24, 20
        mov     r14, qword [rax+rcx*8]                  ; 0D9A _ 4C: 8B. 34 C8
        mov     qword [rsp+30H], rdx                    ; 0D9E _ 48: 89. 54 24, 30
        xor     r14, qword [rsi+100H]                   ; 0DA3 _ 4C: 33. B6, 00000100
        mov     qword [rsi+100H], r14                   ; 0DAA _ 4C: 89. B6, 00000100
        mov     r12, qword [rax+rcx*8]                  ; 0DB1 _ 4C: 8B. 24 C8
        mov     r13, r14                                ; 0DB5 _ 4D: 89. F5
        xor     qword [rsi+108H], r12                   ; 0DB8 _ 4C: 31. A6, 00000108
        lea     r12, [rsi+rdx]                          ; 0DBF _ 4C: 8D. 24 16
        mov     edx, dword [rsp+28H]                    ; 0DC3 _ 8B. 54 24, 28
        mov     r14, qword [rax+rcx*8]                  ; 0DC7 _ 4C: 8B. 34 C8
        xor     r14, qword [r12+140H]                   ; 0DCB _ 4D: 33. B4 24, 00000140
        shl     edx, 3                                  ; 0DD3 _ C1. E2, 03
        or      edx, dword [rsp+20H]                    ; 0DD6 _ 0B. 54 24, 20
        mov     qword [r12+140H], r14                   ; 0DDA _ 4D: 89. B4 24, 00000140
        or      r13, qword [rax+rcx*8]                  ; 0DE2 _ 4C: 0B. 2C C8
        mov     dword [rsi+rcx*4], edx                  ; 0DE6 _ 89. 14 8E
        mov     edx, dword [rsp+20H]                    ; 0DE9 _ 8B. 54 24, 20
        mov     qword [rsi+100H], r13                   ; 0DED _ 4C: 89. AE, 00000100
        mov     r13, qword [rax+rcx*8]                  ; 0DF4 _ 4C: 8B. 2C C8
        mov     qword [rsp+20H], rdx                    ; 0DF8 _ 48: 89. 54 24, 20
        lea     rdx, [rsi+rdx*8]                        ; 0DFD _ 48: 8D. 14 D6
        or      r13, qword [rdx+100H]                   ; 0E01 _ 4C: 0B. AA, 00000100
        mov     qword [rdx+100H], r13                   ; 0E08 _ 4C: 89. AA, 00000100
        or      r14, qword [rax+rcx*8]                  ; 0E0F _ 4C: 0B. 34 C8
        mov     qword [rsp+28H], r13                    ; 0E13 _ 4C: 89. 6C 24, 28
        mov     qword [r12+140H], r14                   ; 0E18 _ 4D: 89. B4 24, 00000140
        mov     r12, rdi                                ; 0E20 _ 49: 89. FC
        mov     r13, r14                                ; 0E23 _ 4D: 89. F5
        shl     r12, 9                                  ; 0E26 _ 49: C1. E4, 09
        lea     rax, [rcx+r12+40H]                      ; 0E2A _ 4A: 8D. 44 21, 40
        mov     rdx, qword [r11+rax*8]                  ; 0E2F _ 49: 8B. 14 C3
        mov     qword [rsp+48H], rax                    ; 0E33 _ 48: 89. 44 24, 48
        mov     rax, qword [rsp+30H]                    ; 0E38 _ 48: 8B. 44 24, 30
        add     rax, qword [rsp+20H]                    ; 0E3D _ 48: 03. 44 24, 20
        mov     r14, rdx                                ; 0E42 _ 49: 89. D6
        shl     rax, 6                                  ; 0E45 _ 48: C1. E0, 06
        mov     qword [rsp+30H], rax                    ; 0E49 _ 48: 89. 44 24, 30
        add     rax, rcx                                ; 0E4E _ 48: 01. C8
        xor     r14, qword [r11+rax*8]                  ; 0E51 _ 4D: 33. 34 C3
        mov     qword [rsp+50H], rax                    ; 0E55 _ 48: 89. 44 24, 50
        xor     qword [rsp+38H], r14                    ; 0E5A _ 4C: 31. 74 24, 38
        mov     r14, qword [rsp+28H]                    ; 0E5F _ 4C: 8B. 74 24, 28
        xor     rdx, qword [rbx]                        ; 0E64 _ 48: 33. 13
        and     r14, r13                                ; 0E67 _ 4D: 21. EE
        and     r13, qword [rsi+108H]                   ; 0E6A _ 4C: 23. AE, 00000108
        popcnt  rax, r14                                ; 0E71 _ F3 49: 0F B8. C6
        mov     qword [rsp+28H], rax                    ; 0E76 _ 48: 89. 44 24, 28
        mov     r14d, dword [rsp+28H]                   ; 0E7B _ 44: 8B. 74 24, 28
        mov     qword [rbx], rdx                        ; 0E80 _ 48: 89. 13
        popcnt  rax, r13                                ; 0E83 _ F3 49: 0F B8. C5
        lea     r12, [r12+rax+40H]                      ; 0E88 _ 4D: 8D. 64 04, 40
        lea     eax, [r14-1H]                           ; 0E8D _ 41: 8D. 46, FF
        mov     r13, qword [r11+r12*8]                  ; 0E91 _ 4F: 8B. 2C E3
        mov     r12, qword [rsp+50H]                    ; 0E95 _ 4C: 8B. 64 24, 50
        cdqe                                            ; 0E9A _ 48: 98
        add     rax, qword [rsp+30H]                    ; 0E9C _ 48: 03. 44 24, 30
        lea     r14, [rel PieceValue]                   ; 0EA1 _ 4C: 8D. 35, 00000000(rel)
        xor     r13, qword [rbx+8H]                     ; 0EA8 _ 4C: 33. 6B, 08
        xor     r13, qword [r11+rax*8]                  ; 0EAC _ 4D: 33. 2C C3
        mov     rax, qword [rsp+20H]                    ; 0EB0 _ 48: 8B. 44 24, 20
        mov     qword [rbx+8H], r13                     ; 0EB5 _ 4C: 89. 6B, 08
        mov     r13d, dword [rbp+r12*4]                 ; 0EB9 _ 46: 8B. 6C A5, 00
        mov     r12d, dword [r14+rax*4]                 ; 0EBE _ 45: 8B. 24 86
        add     r13d, r15d                              ; 0EC2 _ 45: 01. FD
        mov     r15, qword [rsp+48H]                    ; 0EC5 _ 4C: 8B. 7C 24, 48
        sub     r13d, dword [rbp+r15*4]                 ; 0ECA _ 46: 2B. 6C BD, 00
        mov     dword [rbx+24H], r13d                   ; 0ECF _ 44: 89. 6B, 24
        mov     r15d, r13d                              ; 0ED3 _ 45: 89. EF
        add     dword [rbx+rdi*4+10H], r12d             ; 0ED6 _ 44: 01. 64 BB, 10
        jmp     ?_116                                   ; 0EDB _ E9, FFFFFD43

?_121:  cmp     r9, rcx                                 ; 0EE0 _ 49: 39. C9
        jnc     ?_125                                   ; 0EE3 _ 0F 83, 000001AC
        imul    r12d, dword [rsp+28H], 56               ; 0EE9 _ 44: 6B. 64 24, 28, 38
        mov     edi, 6                                  ; 0EEF _ BF, 00000006
        movsxd  r11, r12d                               ; 0EF4 _ 4D: 63. DC
        xor     r12d, 05H                               ; 0EF7 _ 41: 83. F4, 05
        movsxd  r14, r12d                               ; 0EFB _ 4D: 63. F4
?_122:  xor     r11, rdi                                ; 0EFE _ 49: 31. FB
        movsxd  rdi, dword [rsp+28H]                    ; 0F01 _ 48: 63. 7C 24, 28
        mov     r12, r11                                ; 0F06 _ 4D: 89. DC
        mov     r11, qword [rel .refptr.SquareBB]       ; 0F09 _ 4C: 8B. 1D, 00000000(rel)
        lea     r15, [rsi+rdi*8]                        ; 0F10 _ 4C: 8D. 3C FE
        mov     r8, qword [r11+r9*8]                    ; 0F14 _ 4F: 8B. 04 CB
        xor     r8, qword [rsi+100H]                    ; 0F18 _ 4C: 33. 86, 00000100
        mov     qword [rsi+100H], r8                    ; 0F1F _ 4C: 89. 86, 00000100
        mov     rbp, qword [r11+r9*8]                   ; 0F26 _ 4B: 8B. 2C CB
        xor     rbp, qword [rsi+130H]                   ; 0F2A _ 48: 33. AE, 00000130
        mov     qword [rsi+130H], rbp                   ; 0F31 _ 48: 89. AE, 00000130
        mov     qword [rsp+38H], rbp                    ; 0F38 _ 48: 89. 6C 24, 38
        mov     rbp, qword [r11+r9*8]                   ; 0F3D _ 4B: 8B. 2C CB
        xor     rbp, qword [r15+140H]                   ; 0F41 _ 49: 33. AF, 00000140
        mov     qword [r15+140H], rbp                   ; 0F48 _ 49: 89. AF, 00000140
        xor     r8, qword [r11+rcx*8]                   ; 0F4F _ 4D: 33. 04 CB
        mov     qword [rsp+50H], rbp                    ; 0F53 _ 48: 89. 6C 24, 50
        mov     qword [rsi+100H], r8                    ; 0F58 _ 4C: 89. 86, 00000100
        mov     rbp, qword [r11+rcx*8]                  ; 0F5F _ 49: 8B. 2C CB
        xor     rbp, qword [rsi+120H]                   ; 0F63 _ 48: 33. AE, 00000120
        mov     qword [rsi+120H], rbp                   ; 0F6A _ 48: 89. AE, 00000120
        mov     qword [rsp+58H], rbp                    ; 0F71 _ 48: 89. 6C 24, 58
        mov     rbp, qword [rsp+50H]                    ; 0F76 _ 48: 8B. 6C 24, 50
        xor     rbp, qword [r11+rcx*8]                  ; 0F7B _ 49: 33. 2C CB
        mov     qword [r15+140H], rbp                   ; 0F7F _ 49: 89. AF, 00000140
        mov     dword [r10], 0                          ; 0F86 _ 41: C7. 02, 00000000
        mov     r10d, dword [rsp+28H]                   ; 0F8D _ 44: 8B. 54 24, 28
        mov     dword [rax], 0                          ; 0F92 _ C7. 00, 00000000
        shl     r10d, 3                                 ; 0F98 _ 41: C1. E2, 03
        mov     dword [rsp+50H], r10d                   ; 0F9C _ 44: 89. 54 24, 50
        or      r10d, 06H                               ; 0FA1 _ 41: 83. CA, 06
        mov     dword [rsi+r12*4], r10d                 ; 0FA5 _ 46: 89. 14 A6
        mov     r10, r8                                 ; 0FA9 _ 4D: 89. C2
        or      r10, qword [r11+r12*8]                  ; 0FAC _ 4F: 0B. 14 E3
        mov     r8, qword [rsp+38H]                     ; 0FB0 _ 4C: 8B. 44 24, 38
        mov     qword [rsi+100H], r10                   ; 0FB5 _ 4C: 89. 96, 00000100
        or      r8, qword [r11+r12*8]                   ; 0FBC _ 4F: 0B. 04 E3
        mov     qword [rsi+130H], r8                    ; 0FC0 _ 4C: 89. 86, 00000130
        or      rbp, qword [r11+r12*8]                  ; 0FC7 _ 4B: 0B. 2C E3
        mov     qword [r15+140H], rbp                   ; 0FCB _ 49: 89. AF, 00000140
        mov     r8d, dword [rsp+50H]                    ; 0FD2 _ 44: 8B. 44 24, 50
        or      r10, qword [r11+r14*8]                  ; 0FD7 _ 4F: 0B. 14 F3
        or      r8d, 04H                                ; 0FDB _ 41: 83. C8, 04
        mov     dword [rsi+r14*4], r8d                  ; 0FDF _ 46: 89. 04 B6
        mov     r8, qword [rsp+58H]                     ; 0FE3 _ 4C: 8B. 44 24, 58
        mov     qword [rsi+100H], r10                   ; 0FE8 _ 4C: 89. 96, 00000100
        or      r8, qword [r11+r14*8]                   ; 0FEF _ 4F: 0B. 04 F3
        mov     qword [rsi+120H], r8                    ; 0FF3 _ 4C: 89. 86, 00000120
        or      rbp, qword [r11+r14*8]                  ; 0FFA _ 4B: 0B. 2C F3
        mov     r11, rdi                                ; 0FFE _ 49: 89. FB
        xor     r8d, r8d                                ; 1001 _ 45: 31. C0
        shl     r11, 9                                  ; 1004 _ 49: C1. E3, 09
        lea     r10, [rcx+r11+100H]                     ; 1008 _ 4E: 8D. 94 19, 00000100
        lea     r14, [r14+r11+100H]                     ; 1010 _ 4F: 8D. B4 1E, 00000100
        mov     qword [r15+140H], rbp                   ; 1018 _ 49: 89. AF, 00000140
        mov     rbp, qword [rel .refptr._ZN4PSQT3psqE]  ; 101F _ 48: 8B. 2D, 00000000(rel)
        lea     r11, [rel _ZN7Zobrist3psqE]             ; 1026 _ 4C: 8D. 1D, 00000100(rel)
        xor     r13, qword [r11+r10*8]                  ; 102D _ 4F: 33. 2C D3
        xor     r13, qword [r11+r14*8]                  ; 1031 _ 4F: 33. 2C F3
        mov     ecx, dword [rbp+r14*4]                  ; 1035 _ 42: 8B. 4C B5, 00
        sub     ecx, dword [rbp+r10*4]                  ; 103A _ 42: 2B. 4C 95, 00
        add     ecx, dword [rbx+24H]                    ; 103F _ 03. 4B, 24
        mov     r15d, ecx                               ; 1042 _ 41: 89. CF
        mov     dword [rbx+24H], ecx                    ; 1045 _ 89. 4B, 24
        mov     rcx, r12                                ; 1048 _ 4C: 89. E1
        jmp     ?_104                                   ; 104B _ E9, FFFFF9B2

?_123:  lea     r13, [rel _ZN7Zobrist9enpassantE]       ; 1050 _ 4C: 8D. 2D, 000000C0(rel)
        and     r12d, 07H                               ; 1057 _ 41: 83. E4, 07
        mov     r14, qword [r13+r12*8]                  ; 105B _ 4F: 8B. 74 E5, 00
        mov     qword [rbx+28H], 64                     ; 1060 _ 48: C7. 43, 28, 00000040
        xor     qword [rsp+38H], r14                    ; 1068 _ 4C: 31. 74 24, 38
        jmp     ?_105                                   ; 106D _ E9, FFFFF9BF

?_124:  cmp     dword [rsp+28H], 1                      ; 1072 _ 83. 7C 24, 28, 01
        sbb     r8, r8                                  ; 1077 _ 4D: 19. C0
        and     r8d, 10H                                ; 107A _ 41: 83. E0, 10
        sub     r8, 8                                   ; 107E _ 49: 83. E8, 08
        sub     r15d, r8d                               ; 1082 _ 45: 29. C7
        movsxd  r10, r15d                               ; 1085 _ 4D: 63. D7
        mov     dword [rsi+r10*4], 0                    ; 1088 _ 42: C7. 04 96, 00000000
        jmp     ?_113                                   ; 1090 _ E9, FFFFFB3C
; _ZN8Position7do_moveE4MoveR9StateInfob End of function

?_125:  ; Local function
        imul    r8d, dword [rsp+28H], 56                ; 1095 _ 44: 6B. 44 24, 28, 38
        mov     edi, 2                                  ; 109B _ BF, 00000002
        movsxd  r11, r8d                                ; 10A0 _ 4D: 63. D8
        xor     r8d, 03H                                ; 10A3 _ 41: 83. F0, 03
        movsxd  r14, r8d                                ; 10A7 _ 4D: 63. F0
        jmp     ?_122                                   ; 10AA _ E9, FFFFFE4F

        nop                                             ; 10AF _ 90

ALIGN   16
_ZNK8Position7is_drawEv:; Function begin
        push    rsi                                     ; 10B0 _ 56
        push    rbx                                     ; 10B1 _ 53
        sub     rsp, 2104                               ; 10B2 _ 48: 81. EC, 00000838
        mov     rdx, qword [rcx+3B8H]                   ; 10B9 _ 48: 8B. 91, 000003B8
        cmp     dword [rdx+1CH], 99                     ; 10C0 _ 83. 7A, 1C, 63
        jg      ?_131                                   ; 10C4 _ 7F, 51
        xor     eax, eax                                ; 10C6 _ 31. C0
?_126:  mov     ecx, dword [rdx+20H]                    ; 10C8 _ 8B. 4A, 20
        cmp     dword [rdx+1CH], ecx                    ; 10CB _ 39. 4A, 1C
        cmovle  ecx, dword [rdx+1CH]                    ; 10CE _ 0F 4E. 4A, 1C
        cmp     ecx, 1                                  ; 10D2 _ 83. F9, 01
        jg      ?_128                                   ; 10D5 _ 7F, 0A
?_127:  add     rsp, 2104                               ; 10D7 _ 48: 81. C4, 00000838
        pop     rbx                                     ; 10DE _ 5B
        pop     rsi                                     ; 10DF _ 5E
        ret                                             ; 10E0 _ C3

?_128:  mov     r8, qword [rdx+48H]                     ; 10E1 _ 4C: 8B. 42, 48
        mov     r9, qword [rdx+30H]                     ; 10E5 _ 4C: 8B. 4A, 30
        mov     r10, qword [r8+48H]                     ; 10E9 _ 4D: 8B. 50, 48
        cmp     qword [r10+30H], r9                     ; 10ED _ 4D: 39. 4A, 30
        jz      ?_130                                   ; 10F1 _ 74, 1D
        mov     r11d, 2                                 ; 10F3 _ 41: BB, 00000002
?_129:  add     r11d, 2                                 ; 10F9 _ 41: 83. C3, 02
        cmp     r11d, ecx                               ; 10FD _ 41: 39. CB
        jg      ?_127                                   ; 1100 _ 7F, D5
        mov     rdx, qword [r10+48H]                    ; 1102 _ 49: 8B. 52, 48
        mov     r10, qword [rdx+48H]                    ; 1106 _ 4C: 8B. 52, 48
        cmp     r9, qword [r10+30H]                     ; 110A _ 4D: 3B. 4A, 30
        jnz     ?_129                                   ; 110E _ 75, E9
?_130:  mov     eax, 1                                  ; 1110 _ B8, 00000001
        jmp     ?_127                                   ; 1115 _ EB, C0
; _ZNK8Position7is_drawEv End of function

?_131:  ; Local function
        cmp     qword [rdx+38H], 0                      ; 1117 _ 48: 83. 7A, 38, 00
        mov     eax, 1                                  ; 111C _ B8, 00000001
        jz      ?_127                                   ; 1121 _ 74, B4
        lea     rsi, [rsp+20H]                          ; 1123 _ 48: 8D. 74 24, 20
        mov     rbx, rcx                                ; 1128 _ 48: 89. CB
        mov     rdx, rsi                                ; 112B _ 48: 89. F2
        call    _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_; 112E _ E8, 00000000(rel)
        sub     rax, rsi                                ; 1133 _ 48: 29. F0
        sar     rax, 3                                  ; 1136 _ 48: C1. F8, 03
        test    rax, rax                                ; 113A _ 48: 85. C0
        setne   al                                      ; 113D _ 0F 95. C0
        jnz     ?_127                                   ; 1140 _ 75, 95
        mov     rdx, qword [rbx+3B8H]                   ; 1142 _ 48: 8B. 93, 000003B8
        jmp     ?_126                                   ; 1149 _ E9, FFFFFF7A

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

_ZN8Position9undo_moveE4Move:; Function begin
        push    r15                                     ; 1150 _ 41: 57
        push    r14                                     ; 1152 _ 41: 56
        push    r13                                     ; 1154 _ 41: 55
        push    r12                                     ; 1156 _ 41: 54
        push    rbp                                     ; 1158 _ 55
        push    rdi                                     ; 1159 _ 57
        push    rsi                                     ; 115A _ 56
        push    rbx                                     ; 115B _ 53
        mov     ebx, dword [rcx+3ACH]                   ; 115C _ 8B. 99, 000003AC
        mov     r12d, edx                               ; 1162 _ 41: 89. D4
        mov     esi, ebx                                ; 1165 _ 89. DE
        mov     r10d, edx                               ; 1167 _ 41: 89. D2
        and     r12d, 3FH                               ; 116A _ 41: 83. E4, 3F
        xor     esi, 01H                                ; 116E _ 83. F6, 01
        sar     r10d, 6                                 ; 1171 _ 41: C1. FA, 06
        movsxd  r11, r12d                               ; 1175 _ 4D: 63. DC
        mov     dword [rcx+3ACH], esi                   ; 1178 _ 89. B1, 000003AC
        and     edx, 0C000H                             ; 117E _ 81. E2, 0000C000
        and     r10d, 3FH                               ; 1184 _ 41: 83. E2, 3F
        lea     rbp, [rcx+r11*4]                        ; 1188 _ 4A: 8D. 2C 99
        mov     r9d, dword [rbp]                        ; 118C _ 44: 8B. 4D, 00
        and     r9d, 07H                                ; 1190 _ 41: 83. E1, 07
        cmp     edx, 16384                              ; 1194 _ 81. FA, 00004000
        je      ?_136                                   ; 119A _ 0F 84, 000000D2
        cmp     edx, 49152                              ; 11A0 _ 81. FA, 0000C000
        je      ?_137                                   ; 11A6 _ 0F 84, 00000130
        movsxd  r14, esi                                ; 11AC _ 4C: 63. F6
        mov     r8, qword [rcx+100H]                    ; 11AF _ 4C: 8B. 81, 00000100
        mov     r15, qword [rcx+r14*8+140H]             ; 11B6 _ 4E: 8B. BC F1, 00000140
        mov     rdi, qword [rel .refptr.SquareBB]       ; 11BE _ 48: 8B. 3D, 00000000(rel)
?_132:  mov     r13, qword [rdi+r11*8]                  ; 11C5 _ 4E: 8B. 2C DF
        mov     rax, r13                                ; 11C9 _ 4C: 89. E8
        xor     rax, qword [rdi+r10*8]                  ; 11CC _ 4A: 33. 04 D7
        xor     r8, rax                                 ; 11D0 _ 49: 31. C0
        mov     qword [rcx+100H], r8                    ; 11D3 _ 4C: 89. 81, 00000100
        mov     r8d, r9d                                ; 11DA _ 45: 89. C8
        xor     qword [rcx+r8*8+100H], rax              ; 11DD _ 4A: 31. 84 C1, 00000100
        xor     rax, r15                                ; 11E5 _ 4C: 31. F8
        mov     qword [rcx+r14*8+140H], rax             ; 11E8 _ 4A: 89. 84 F1, 00000140
        mov     dword [rbp], 0                          ; 11F0 _ C7. 45, 00, 00000000
        lea     ebp, [rsi*8]                            ; 11F7 _ 8D. 2C F5, 00000000
        or      r9d, ebp                                ; 11FE _ 41: 09. E9
        mov     dword [rcx+r10*4], r9d                  ; 1201 _ 46: 89. 0C 91
        mov     r10, qword [rcx+3B8H]                   ; 1205 _ 4C: 8B. 91, 000003B8
        mov     r14d, dword [r10+40H]                   ; 120C _ 45: 8B. 72, 40
        test    r14d, r14d                              ; 1210 _ 45: 85. F6
        jnz     ?_134                                   ; 1213 _ 75, 1F
?_133:  mov     r9, qword [r10+48H]                     ; 1215 _ 4D: 8B. 4A, 48
        sub     dword [rcx+3A8H], 1                     ; 1219 _ 83. A9, 000003A8, 01
        mov     qword [rcx+3B8H], r9                    ; 1220 _ 4C: 89. 89, 000003B8
        pop     rbx                                     ; 1227 _ 5B
        pop     rsi                                     ; 1228 _ 5E
        pop     rdi                                     ; 1229 _ 5F
        pop     rbp                                     ; 122A _ 5D
        pop     r12                                     ; 122B _ 41: 5C
        pop     r13                                     ; 122D _ 41: 5D
        pop     r14                                     ; 122F _ 41: 5E
        pop     r15                                     ; 1231 _ 41: 5F
        ret                                             ; 1233 _ C3

?_134:  cmp     edx, 32768                              ; 1234 _ 81. FA, 00008000
        je      ?_139                                   ; 123A _ 0F 84, 00000196
?_135:  lea     edx, [rbx*8]                            ; 1240 _ 8D. 14 DD, 00000000
        movsxd  rbx, ebx                                ; 1247 _ 48: 63. DB
        or      edx, r14d                               ; 124A _ 44: 09. F2
        mov     dword [rcx+r11*4], edx                  ; 124D _ 42: 89. 14 99
        or      qword [rcx+100H], r13                   ; 1251 _ 4C: 09. A9, 00000100
        mov     r12, qword [rdi+r11*8]                  ; 1258 _ 4E: 8B. 24 DF
        or      qword [rcx+r14*8+100H], r12             ; 125C _ 4E: 09. A4 F1, 00000100
        mov     rdi, qword [rdi+r11*8]                  ; 1264 _ 4A: 8B. 3C DF
        or      qword [rcx+rbx*8+140H], rdi             ; 1268 _ 48: 09. BC D9, 00000140
        jmp     ?_133                                   ; 1270 _ EB, A3

?_136:  mov     rdi, qword [rel .refptr.SquareBB]       ; 1272 _ 48: 8B. 3D, 00000000(rel)
        mov     r14, qword [rdi+r11*8]                  ; 1279 _ 4E: 8B. 34 DF
        xor     qword [rcx+100H], r14                   ; 127D _ 4C: 31. B1, 00000100
        movsxd  r14, esi                                ; 1284 _ 4C: 63. F6
        mov     r13, qword [rdi+r11*8]                  ; 1287 _ 4E: 8B. 2C DF
        xor     qword [rcx+r9*8+100H], r13              ; 128B _ 4E: 31. AC C9, 00000100
        lea     r9, [rcx+r14*8]                         ; 1293 _ 4E: 8D. 0C F1
        mov     r15, qword [rdi+r11*8]                  ; 1297 _ 4E: 8B. 3C DF
        xor     r15, qword [r9+140H]                    ; 129B _ 4D: 33. B9, 00000140
        mov     qword [r9+140H], r15                    ; 12A2 _ 4D: 89. B9, 00000140
        mov     r8, qword [rdi+r11*8]                   ; 12A9 _ 4E: 8B. 04 DF
        or      r8, qword [rcx+100H]                    ; 12AD _ 4C: 0B. 81, 00000100
        mov     qword [rcx+100H], r8                    ; 12B4 _ 4C: 89. 81, 00000100
        mov     rax, qword [rdi+r11*8]                  ; 12BB _ 4A: 8B. 04 DF
        or      qword [rcx+108H], rax                   ; 12BF _ 48: 09. 81, 00000108
        or      r15, qword [rdi+r11*8]                  ; 12C6 _ 4E: 0B. 3C DF
        mov     qword [r9+140H], r15                    ; 12CA _ 4D: 89. B9, 00000140
        mov     r9d, 1                                  ; 12D1 _ 41: B9, 00000001
        jmp     ?_132                                   ; 12D7 _ E9, FFFFFEE9

?_137:  cmp     r10, r11                                ; 12DC _ 4D: 39. DA
        jnc     ?_140                                   ; 12DF _ 0F 83, 00000110
        imul    eax, esi, 56                            ; 12E5 _ 6B. C6, 38
        mov     edx, 6                                  ; 12E8 _ BA, 00000006
        movsxd  r8, eax                                 ; 12ED _ 4C: 63. C0
        xor     eax, 05H                                ; 12F0 _ 83. F0, 05
        cdqe                                            ; 12F3 _ 48: 98
?_138:  mov     rbx, qword [rel .refptr.SquareBB]       ; 12F5 _ 48: 8B. 1D, 00000000(rel)
        xor     r8, rdx                                 ; 12FC _ 49: 31. D0
        movsxd  r12, esi                                ; 12FF _ 4C: 63. E6
        shl     esi, 3                                  ; 1302 _ C1. E6, 03
        lea     r15, [rcx+r12*8]                        ; 1305 _ 4E: 8D. 3C E1
        mov     r14, qword [rbx+r8*8]                   ; 1309 _ 4E: 8B. 34 C3
        xor     r14, qword [rcx+100H]                   ; 130D _ 4C: 33. B1, 00000100
        mov     qword [rcx+100H], r14                   ; 1314 _ 4C: 89. B1, 00000100
        mov     r13, qword [rbx+r8*8]                   ; 131B _ 4E: 8B. 2C C3
        xor     r13, qword [rcx+130H]                   ; 131F _ 4C: 33. A9, 00000130
        mov     qword [rcx+130H], r13                   ; 1326 _ 4C: 89. A9, 00000130
        mov     r9, qword [rbx+r8*8]                    ; 132D _ 4E: 8B. 0C C3
        xor     r9, qword [r15+140H]                    ; 1331 _ 4D: 33. 8F, 00000140
        mov     qword [r15+140H], r9                    ; 1338 _ 4D: 89. 8F, 00000140
        xor     r14, qword [rbx+rax*8]                  ; 133F _ 4C: 33. 34 C3
        mov     qword [rcx+100H], r14                   ; 1343 _ 4C: 89. B1, 00000100
        mov     rdi, qword [rbx+rax*8]                  ; 134A _ 48: 8B. 3C C3
        xor     rdi, qword [rcx+120H]                   ; 134E _ 48: 33. B9, 00000120
        mov     qword [rcx+120H], rdi                   ; 1355 _ 48: 89. B9, 00000120
        xor     r9, qword [rbx+rax*8]                   ; 135C _ 4C: 33. 0C C3
        mov     qword [r15+140H], r9                    ; 1360 _ 4D: 89. 8F, 00000140
        or      r14, qword [rbx+r10*8]                  ; 1367 _ 4E: 0B. 34 D3
        mov     dword [rcx+rax*4], 0                    ; 136B _ C7. 04 81, 00000000
        mov     eax, esi                                ; 1372 _ 89. F0
        or      esi, 04H                                ; 1374 _ 83. CE, 04
        or      eax, 06H                                ; 1377 _ 83. C8, 06
        mov     dword [rcx+r8*4], 0                     ; 137A _ 42: C7. 04 81, 00000000
        mov     r8, r9                                  ; 1382 _ 4D: 89. C8
        mov     dword [rcx+r10*4], eax                  ; 1385 _ 42: 89. 04 91
        mov     qword [rcx+100H], r14                   ; 1389 _ 4C: 89. B1, 00000100
        or      r13, qword [rbx+r10*8]                  ; 1390 _ 4E: 0B. 2C D3
        mov     qword [rcx+130H], r13                   ; 1394 _ 4C: 89. A9, 00000130
        or      r8, qword [rbx+r10*8]                   ; 139B _ 4E: 0B. 04 D3
        mov     qword [r15+140H], r8                    ; 139F _ 4D: 89. 87, 00000140
        or      r14, qword [rbx+r11*8]                  ; 13A6 _ 4E: 0B. 34 DB
        mov     dword [rbp], esi                        ; 13AA _ 89. 75, 00
        mov     qword [rcx+100H], r14                   ; 13AD _ 4C: 89. B1, 00000100
        or      rdi, qword [rbx+r11*8]                  ; 13B4 _ 4A: 0B. 3C DB
        mov     qword [rcx+120H], rdi                   ; 13B8 _ 48: 89. B9, 00000120
        or      r8, qword [rbx+r11*8]                   ; 13BF _ 4E: 0B. 04 DB
        mov     qword [r15+140H], r8                    ; 13C3 _ 4D: 89. 87, 00000140
        mov     r10, qword [rcx+3B8H]                   ; 13CA _ 4C: 8B. 91, 000003B8
        jmp     ?_133                                   ; 13D1 _ E9, FFFFFE3F

?_139:  cmp     esi, 1                                  ; 13D6 _ 83. FE, 01
        mov     r11d, r12d                              ; 13D9 _ 45: 89. E3
        sbb     rsi, rsi                                ; 13DC _ 48: 19. F6
        and     esi, 10H                                ; 13DF _ 83. E6, 10
        sub     rsi, 8                                  ; 13E2 _ 48: 83. EE, 08
        sub     r11d, esi                               ; 13E6 _ 41: 29. F3
        movsxd  r11, r11d                               ; 13E9 _ 4D: 63. DB
        mov     r13, qword [rdi+r11*8]                  ; 13EC _ 4E: 8B. 2C DF
        jmp     ?_135                                   ; 13F0 _ E9, FFFFFE4B
; _ZN8Position9undo_moveE4Move End of function

?_140:  ; Local function
        imul    eax, esi, 56                            ; 13F5 _ 6B. C6, 38
        mov     edx, 2                                  ; 13F8 _ BA, 00000002
        movsxd  r8, eax                                 ; 13FD _ 4C: 63. C0
        xor     eax, 03H                                ; 1400 _ 83. F0, 03
        cdqe                                            ; 1403 _ 48: 98
        jmp     ?_138                                   ; 1405 _ E9, FFFFFEEB

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZNK8Position11gives_checkE4MoveRK9CheckInfo:; Function begin
        push    r14                                     ; 1410 _ 41: 56
        push    rdi                                     ; 1412 _ 57
        push    rsi                                     ; 1413 _ 56
        push    rbx                                     ; 1414 _ 53
        mov     r11, qword [rel .refptr.SquareBB]       ; 1415 _ 4C: 8B. 1D, 00000000(rel)
        mov     eax, edx                                ; 141C _ 89. D0
        mov     r9d, edx                                ; 141E _ 41: 89. D1
        sar     eax, 6                                  ; 1421 _ C1. F8, 06
        and     r9d, 3FH                                ; 1424 _ 41: 83. E1, 3F
        mov     r10d, eax                               ; 1428 _ 41: 89. C2
        movsxd  rbx, r9d                                ; 142B _ 49: 63. D9
        and     r10d, 3FH                               ; 142E _ 41: 83. E2, 3F
        mov     rsi, qword [r11+rbx*8]                  ; 1432 _ 49: 8B. 34 DB
        mov     edi, dword [rcx+r10*4]                  ; 1436 _ 42: 8B. 3C 91
        and     edi, 07H                                ; 143A _ 83. E7, 07
        test    qword [r8+rdi*8+10H], rsi               ; 143D _ 49: 85. 74 F8, 10
        jne     ?_149                                   ; 1442 _ 0F 85, 0000014A
        mov     r14, qword [r8]                         ; 1448 _ 4D: 8B. 30
        test    r14, r14                                ; 144B _ 4D: 85. F6
        jnz     ?_143                                   ; 144E _ 75, 30
?_141:  mov     eax, edx                                ; 1450 _ 89. D0
        and     eax, 0C000H                             ; 1452 _ 25, 0000C000
        cmp     eax, 32768                              ; 1457 _ 3D, 00008000
        je      ?_153                                   ; 145C _ 0F 84, 000001C4
        cmp     eax, 49152                              ; 1462 _ 3D, 0000C000
        je      ?_146                                   ; 1467 _ 0F 84, 00000096
        cmp     eax, 16384                              ; 146D _ 3D, 00004000
        jz      ?_144                                   ; 1472 _ 74, 3C
        xor     eax, eax                                ; 1474 _ 31. C0
?_142:  pop     rbx                                     ; 1476 _ 5B
        pop     rsi                                     ; 1477 _ 5E
        pop     rdi                                     ; 1478 _ 5F
        pop     r14                                     ; 1479 _ 41: 5E
        ret                                             ; 147B _ C3

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_143:  test    qword [r11+r10*8], r14                  ; 1480 _ 4F: 85. 34 D3
        jz      ?_141                                   ; 1484 _ 74, CA
        mov     rdi, qword [rel .refptr.LineBB]         ; 1486 _ 48: 8B. 3D, 00000000(rel)
        mov     rax, r10                                ; 148D _ 4C: 89. D0
        mov     r14, qword [r8+50H]                     ; 1490 _ 4D: 8B. 70, 50
        shl     rax, 6                                  ; 1494 _ 48: C1. E0, 06
        add     rax, rbx                                ; 1498 _ 48: 01. D8
        mov     rdi, qword [rdi+rax*8]                  ; 149B _ 48: 8B. 3C C7
        mov     eax, 1                                  ; 149F _ B8, 00000001
        test    qword [r11+r14*8], rdi                  ; 14A4 _ 4B: 85. 3C F3
        jz      ?_142                                   ; 14A8 _ 74, CC
        jmp     ?_141                                   ; 14AA _ EB, A4

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_144:  sar     edx, 12                                 ; 14B0 _ C1. FA, 0C
        mov     r10, qword [r11+r10*8]                  ; 14B3 _ 4F: 8B. 14 D3
        and     edx, 03H                                ; 14B7 _ 83. E2, 03
        xor     r10, qword [rcx+100H]                   ; 14BA _ 4C: 33. 91, 00000100
        add     edx, 2                                  ; 14C1 _ 83. C2, 02
        mov     r8, qword [r8+50H]                      ; 14C4 _ 4D: 8B. 40, 50
        cmp     edx, 4                                  ; 14C8 _ 83. FA, 04
        je      ?_152                                   ; 14CB _ 0F 84, 00000131
        cmp     edx, 5                                  ; 14D1 _ 83. FA, 05
        je      ?_150                                   ; 14D4 _ 0F 84, 000000C2
        cmp     edx, 3                                  ; 14DA _ 83. FA, 03
        je      ?_151                                   ; 14DD _ 0F 84, 000000FB
        shl     rdx, 6                                  ; 14E3 _ 48: C1. E2, 06
        lea     rcx, [rdx+rbx]                          ; 14E7 _ 48: 8D. 0C 1A
        mov     rdx, qword [rel .refptr.StepAttacksBB]  ; 14EB _ 48: 8B. 15, 00000000(rel)
        mov     r9, qword [rdx+rcx*8]                   ; 14F2 _ 4C: 8B. 0C CA
?_145:  test    qword [r11+r8*8], r9                    ; 14F6 _ 4F: 85. 0C C3
        setne   al                                      ; 14FA _ 0F 95. C0
        pop     rbx                                     ; 14FD _ 5B
        pop     rsi                                     ; 14FE _ 5E
        pop     rdi                                     ; 14FF _ 5F
        pop     r14                                     ; 1500 _ 41: 5E
        ret                                             ; 1502 _ C3

?_146:  cmp     r10, rbx                                ; 1503 _ 49: 39. DA
        jnc     ?_148                                   ; 1506 _ 73, 71
        imul    ebx, dword [rcx+3ACH], 56               ; 1508 _ 6B. 99, 000003AC, 38
        mov     eax, 5                                  ; 150F _ B8, 00000005
        movsxd  r9, ebx                                 ; 1514 _ 4C: 63. CB
        xor     ebx, 06H                                ; 1517 _ 83. F3, 06
        movsxd  rdx, ebx                                ; 151A _ 48: 63. D3
?_147:  mov     r8, qword [r8+50H]                      ; 151D _ 4D: 8B. 40, 50
        xor     r9, rax                                 ; 1521 _ 49: 31. C1
        xor     eax, eax                                ; 1524 _ 31. C0
        mov     r14, qword [rel .refptr.PseudoAttacks]  ; 1526 _ 4C: 8B. 35, 00000000(rel)
        mov     rdi, qword [r11+r8*8]                   ; 152D _ 4B: 8B. 3C C3
        test    qword [r14+r9*8+800H], rdi              ; 1531 _ 4B: 85. BC CE, 00000800
        je      ?_142                                   ; 1539 _ 0F 84, FFFFFF37
        xor     rsi, qword [rcx+100H]                   ; 153F _ 48: 33. B1, 00000100
        xor     rsi, qword [r11+r10*8]                  ; 1546 _ 4B: 33. 34 D3
        or      rsi, qword [r11+rdx*8]                  ; 154A _ 49: 0B. 34 D3
        mov     rdx, qword [rel .refptr.RookAttacks]    ; 154E _ 48: 8B. 15, 00000000(rel)
        or      rsi, qword [r11+r9*8]                   ; 1555 _ 4B: 0B. 34 CB
        mov     r11, qword [rel .refptr.RookMasks]      ; 1559 _ 4C: 8B. 1D, 00000000(rel)
        pext    rcx, rsi, qword [r11+r9*8]              ; 1560 _ C4 82 CA: F5. 0C CB
        mov     r9, qword [rdx+r9*8]                    ; 1566 _ 4E: 8B. 0C CA
        mov     r10d, ecx                               ; 156A _ 41: 89. CA
        test    qword [r9+r10*8], rdi                   ; 156D _ 4B: 85. 3C D1
        setne   al                                      ; 1571 _ 0F 95. C0
        jmp     ?_142                                   ; 1574 _ E9, FFFFFEFD

?_148:  imul    r14d, dword [rcx+3ACH], 56              ; 1579 _ 44: 6B. B1, 000003AC, 38
        mov     eax, 3                                  ; 1581 _ B8, 00000003
        movsxd  r9, r14d                                ; 1586 _ 4D: 63. CE
        xor     r14d, 02H                               ; 1589 _ 41: 83. F6, 02
        movsxd  rdx, r14d                               ; 158D _ 49: 63. D6
        jmp     ?_147                                   ; 1590 _ EB, 8B

?_149:  mov     eax, 1                                  ; 1592 _ B8, 00000001
        jmp     ?_142                                   ; 1597 _ E9, FFFFFEDA

?_150:  mov     rcx, qword [rel .refptr.BishopMasks]    ; 159C _ 48: 8B. 0D, 00000000(rel)
        mov     r9, qword [rel .refptr.RookMasks]       ; 15A3 _ 4C: 8B. 0D, 00000000(rel)
        mov     rdi, qword [rel .refptr.RookAttacks]    ; 15AA _ 48: 8B. 3D, 00000000(rel)
        pext    rdx, r10, qword [rcx+rbx*8]             ; 15B1 _ C4 E2 AA: F5. 14 D9
        mov     rcx, qword [rel .refptr.BishopAttacks]  ; 15B7 _ 48: 8B. 0D, 00000000(rel)
        mov     eax, edx                                ; 15BE _ 89. D0
        pext    r10, r10, qword [r9+rbx*8]              ; 15C0 _ C4 42 AA: F5. 14 D9
        mov     esi, r10d                               ; 15C6 _ 44: 89. D6
        mov     r14, qword [rdi+rbx*8]                  ; 15C9 _ 4C: 8B. 34 DF
        mov     rbx, qword [rcx+rbx*8]                  ; 15CD _ 48: 8B. 1C D9
        mov     r9, qword [r14+rsi*8]                   ; 15D1 _ 4D: 8B. 0C F6
        or      r9, qword [rbx+rax*8]                   ; 15D5 _ 4C: 0B. 0C C3
        jmp     ?_145                                   ; 15D9 _ E9, FFFFFF18

?_151:  mov     rsi, qword [rel .refptr.BishopMasks]    ; 15DE _ 48: 8B. 35, 00000000(rel)
        mov     rax, qword [rel .refptr.BishopAttacks]  ; 15E5 _ 48: 8B. 05, 00000000(rel)
        pext    rdi, r10, qword [rsi+rbx*8]             ; 15EC _ C4 E2 AA: F5. 3C DE
        mov     r14d, edi                               ; 15F2 _ 41: 89. FE
        mov     rbx, qword [rax+rbx*8]                  ; 15F5 _ 48: 8B. 1C D8
        mov     r9, qword [rbx+r14*8]                   ; 15F9 _ 4E: 8B. 0C F3
        jmp     ?_145                                   ; 15FD _ E9, FFFFFEF4

?_152:  mov     rsi, qword [rel .refptr.RookAttacks]    ; 1602 _ 48: 8B. 35, 00000000(rel)
        mov     rdx, qword [rel .refptr.RookMasks]      ; 1609 _ 48: 8B. 15, 00000000(rel)
        mov     rdi, qword [rsi+rbx*8]                  ; 1610 _ 48: 8B. 3C DE
        pext    r9, r10, qword [rdx+rbx*8]              ; 1614 _ C4 62 AA: F5. 0C DA
        mov     r10d, r9d                               ; 161A _ 45: 89. CA
        mov     r9, qword [rdi+r10*8]                   ; 161D _ 4E: 8B. 0C D7
        jmp     ?_145                                   ; 1621 _ E9, FFFFFED0
; _ZNK8Position11gives_checkE4MoveRK9CheckInfo End of function

?_153:  ; Local function
        mov     rbx, r10                                ; 1626 _ 4C: 89. D3
        and     r9d, 07H                                ; 1629 _ 41: 83. E1, 07
        mov     rax, qword [r11+r10*8]                  ; 162D _ 4B: 8B. 04 D3
        shr     rbx, 3                                  ; 1631 _ 48: C1. EB, 03
        xor     rax, qword [rcx+100H]                   ; 1635 _ 48: 33. 81, 00000100
        shl     ebx, 3                                  ; 163C _ C1. E3, 03
        mov     rdx, qword [rcx+128H]                   ; 163F _ 48: 8B. 91, 00000128
        or      r9d, ebx                                ; 1646 _ 41: 09. D9
        mov     r14, qword [r8+50H]                     ; 1649 _ 4D: 8B. 70, 50
        mov     edi, r9d                                ; 164D _ 44: 89. CF
        mov     r8, qword [rel .refptr.RookMasks]       ; 1650 _ 4C: 8B. 05, 00000000(rel)
        xor     rax, qword [r11+rdi*8]                  ; 1657 _ 49: 33. 04 FB
        movsxd  r11, dword [rcx+3ACH]                   ; 165B _ 4C: 63. 99, 000003AC
        mov     rdi, rdx                                ; 1662 _ 48: 89. D7
        mov     rbx, qword [rel .refptr.BishopAttacks]  ; 1665 _ 48: 8B. 1D, 00000000(rel)
        or      rdi, qword [rcx+118H]                   ; 166C _ 48: 0B. B9, 00000118
        or      rsi, rax                                ; 1673 _ 48: 09. C6
        or      rdx, qword [rcx+120H]                   ; 1676 _ 48: 0B. 91, 00000120
        mov     r9, qword [rcx+r11*8+140H]              ; 167D _ 4E: 8B. 8C D9, 00000140
        pext    r10, rsi, qword [r8+r14*8]              ; 1685 _ C4 02 CA: F5. 14 F0
        mov     r10d, r10d                              ; 168B _ 45: 89. D2
        mov     rax, qword [rel .refptr.BishopMasks]    ; 168E _ 48: 8B. 05, 00000000(rel)
        mov     rcx, qword [rel .refptr.RookAttacks]    ; 1695 _ 48: 8B. 0D, 00000000(rel)
        mov     r11, qword [rbx+r14*8]                  ; 169C _ 4E: 8B. 1C F3
        and     rdi, r9                                 ; 16A0 _ 4C: 21. CF
        and     r9, rdx                                 ; 16A3 _ 49: 21. D1
        pext    rsi, rsi, qword [rax+r14*8]             ; 16A6 _ C4 A2 CA: F5. 34 F0
        mov     r8d, esi                                ; 16AC _ 41: 89. F0
        mov     r14, qword [rcx+r14*8]                  ; 16AF _ 4E: 8B. 34 F1
        and     rdi, qword [r11+r8*8]                   ; 16B3 _ 4B: 23. 3C C3
        and     r9, qword [r14+r10*8]                   ; 16B7 _ 4F: 23. 0C D6
        or      rdi, r9                                 ; 16BB _ 4C: 09. CF
        setne   al                                      ; 16BE _ 0F 95. C0
        jmp     ?_142                                   ; 16C1 _ E9, FFFFFDB0

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

_ZNK8Position5legalE4Movey:; Function begin
        push    r12                                     ; 16D0 _ 41: 54
        push    rbp                                     ; 16D2 _ 55
        push    rdi                                     ; 16D3 _ 57
        push    rsi                                     ; 16D4 _ 56
        push    rbx                                     ; 16D5 _ 53
        mov     r11d, dword [rcx+3ACH]                  ; 16D6 _ 44: 8B. 99, 000003AC
        mov     r9d, edx                                ; 16DD _ 41: 89. D1
        mov     r10d, edx                               ; 16E0 _ 41: 89. D2
        sar     r9d, 6                                  ; 16E3 _ 41: C1. F9, 06
        and     r10d, 0C000H                            ; 16E7 _ 41: 81. E2, 0000C000
        and     r9d, 3FH                                ; 16EE _ 41: 83. E1, 3F
        cmp     r10d, 32768                             ; 16F2 _ 41: 81. FA, 00008000
        je      ?_158                                   ; 16F9 _ 0F 84, 00000171
        mov     eax, dword [rcx+r9*4]                   ; 16FF _ 42: 8B. 04 89
        and     eax, 07H                                ; 1703 _ 83. E0, 07
        cmp     eax, 6                                  ; 1706 _ 83. F8, 06
        jz      ?_155                                   ; 1709 _ 74, 15
        test    r8, r8                                  ; 170B _ 4D: 85. C0
        mov     eax, 1                                  ; 170E _ B8, 00000001
        jne     ?_156                                   ; 1713 _ 0F 85, 00000107
?_154:  pop     rbx                                     ; 1719 _ 5B
        pop     rsi                                     ; 171A _ 5E
        pop     rdi                                     ; 171B _ 5F
        pop     rbp                                     ; 171C _ 5D
        pop     r12                                     ; 171D _ 41: 5C
        ret                                             ; 171F _ C3

?_155:  cmp     r10d, 49152                             ; 1720 _ 41: 81. FA, 0000C000
        je      ?_157                                   ; 1727 _ 0F 84, 00000139
        mov     rbp, qword [rel .refptr.StepAttacksBB]  ; 172D _ 48: 8B. 2D, 00000000(rel)
        and     edx, 3FH                                ; 1734 _ 83. E2, 3F
        xor     r11d, 01H                               ; 1737 _ 41: 83. F3, 01
        mov     r9, qword [rcx+100H]                    ; 173B _ 4C: 8B. 89, 00000100
        lea     r12, [rdx+80H]                          ; 1742 _ 4C: 8D. A2, 00000080
        movsxd  r11, r11d                               ; 1749 _ 4D: 63. DB
        mov     r8, qword [rcx+108H]                    ; 174C _ 4C: 8B. 81, 00000108
        lea     rsi, [r12*8]                            ; 1753 _ 4A: 8D. 34 E5, 00000000
        mov     r10, qword [rel .refptr.RookMasks]      ; 175B _ 4C: 8B. 15, 00000000(rel)
        mov     rax, qword [rel .refptr.BishopMasks]    ; 1762 _ 48: 8B. 05, 00000000(rel)
        mov     r12, qword [rbp+r12*8]                  ; 1769 _ 4E: 8B. 64 E5, 00
        and     r12, qword [rcx+110H]                   ; 176E _ 4C: 23. A1, 00000110
        pext    rdi, r9, qword [rsi+r10-400H]           ; 1775 _ C4 A2 B2: F5. BC 16, FFFFFC00
        mov     edi, edi                                ; 177F _ 89. FF
        mov     r10, qword [rcx+128H]                   ; 1781 _ 4C: 8B. 91, 00000128
        pext    rbx, r9, qword [rsi+rax-400H]           ; 1788 _ C4 E2 B2: F5. 9C 06, FFFFFC00
        mov     r9, r8                                  ; 1792 _ 4D: 89. C1
        mov     ebx, ebx                                ; 1795 _ 89. DB
        and     r9, qword [rcx+148H]                    ; 1797 _ 4C: 23. 89, 00000148
        and     r8, qword [rcx+140H]                    ; 179E _ 4C: 23. 81, 00000140
        and     r9, qword [rbp+rdx*8+200H]              ; 17A5 _ 4C: 23. 8C D5, 00000200
        and     r8, qword [rbp+rdx*8+1200H]             ; 17AD _ 4C: 23. 84 D5, 00001200
        mov     rdx, qword [rsi+rbp+800H]               ; 17B5 _ 48: 8B. 94 2E, 00000800
        mov     rbp, qword [rel .refptr.BishopAttacks]  ; 17BD _ 48: 8B. 2D, 00000000(rel)
        and     rdx, qword [rcx+130H]                   ; 17C4 _ 48: 23. 91, 00000130
        or      r8, r9                                  ; 17CB _ 4D: 09. C8
        mov     r9, r10                                 ; 17CE _ 4D: 89. D1
        or      r9, qword [rcx+120H]                    ; 17D1 _ 4C: 0B. 89, 00000120
        or      r12, r8                                 ; 17D8 _ 4D: 09. C4
        mov     r8, qword [rel .refptr.RookAttacks]     ; 17DB _ 4C: 8B. 05, 00000000(rel)
        or      r10, qword [rcx+118H]                   ; 17E2 _ 4C: 0B. 91, 00000118
        or      r12, rdx                                ; 17E9 _ 49: 09. D4
        mov     rax, qword [rsi+r8-400H]                ; 17EC _ 4A: 8B. 84 06, FFFFFC00
        mov     rsi, qword [rsi+rbp-400H]               ; 17F4 _ 48: 8B. B4 2E, FFFFFC00
        and     r9, qword [rax+rdi*8]                   ; 17FC _ 4C: 23. 0C F8
        and     r10, qword [rsi+rbx*8]                  ; 1800 _ 4C: 23. 14 DE
        or      r12, r9                                 ; 1804 _ 4D: 09. CC
        or      r12, r10                                ; 1807 _ 4D: 09. D4
        test    qword [rcx+r11*8+140H], r12             ; 180A _ 4E: 85. A4 D9, 00000140
        sete    al                                      ; 1812 _ 0F 94. C0
        pop     rbx                                     ; 1815 _ 5B
        pop     rsi                                     ; 1816 _ 5E
        pop     rdi                                     ; 1817 _ 5F
        pop     rbp                                     ; 1818 _ 5D
        pop     r12                                     ; 1819 _ 41: 5C
        ret                                             ; 181B _ C3

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_156:  mov     rbx, qword [rel .refptr.SquareBB]       ; 1820 _ 48: 8B. 1D, 00000000(rel)
        test    qword [rbx+r9*8], r8                    ; 1827 _ 4E: 85. 04 CB
        je      ?_154                                   ; 182B _ 0F 84, FFFFFEE8
        and     edx, 3FH                                ; 1831 _ 83. E2, 3F
        shl     r9, 6                                   ; 1834 _ 49: C1. E1, 06
        mov     rsi, qword [rcx+r11*8+140H]             ; 1838 _ 4A: 8B. B4 D9, 00000140
        lea     rbp, [r9+rdx]                           ; 1840 _ 49: 8D. 2C 11
        mov     rdx, qword [rel .refptr.LineBB]         ; 1844 _ 48: 8B. 15, 00000000(rel)
        and     rsi, qword [rcx+130H]                   ; 184B _ 48: 23. B1, 00000130
        bsf     rdi, rsi                                ; 1852 _ 48: 0F BC. FE
        mov     r8, qword [rbx+rdi*8]                   ; 1856 _ 4C: 8B. 04 FB
        test    qword [rdx+rbp*8], r8                   ; 185A _ 4C: 85. 04 EA
        setne   al                                      ; 185E _ 0F 95. C0
        jmp     ?_154                                   ; 1861 _ E9, FFFFFEB3

?_157:  mov     eax, 1                                  ; 1866 _ B8, 00000001
        jmp     ?_154                                   ; 186B _ E9, FFFFFEA9
; _ZNK8Position5legalE4Movey End of function

?_158:  ; Local function
        mov     rbx, qword [rel .refptr.SquareBB]       ; 1870 _ 48: 8B. 1D, 00000000(rel)
        mov     r12d, r11d                              ; 1877 _ 45: 89. DC
        and     edx, 3FH                                ; 187A _ 83. E2, 3F
        mov     rdi, qword [rcx+r12*8+140H]             ; 187D _ 4A: 8B. BC E1, 00000140
        movsxd  rbp, edx                                ; 1885 _ 48: 63. EA
        and     rdi, qword [rcx+130H]                   ; 1888 _ 48: 23. B9, 00000130
        bsf     r8, rdi                                 ; 188F _ 4C: 0F BC. C7
        cmp     r11d, 1                                 ; 1893 _ 41: 83. FB, 01
        mov     rax, qword [rbx+r9*8]                   ; 1897 _ 4A: 8B. 04 CB
        sbb     rsi, rsi                                ; 189B _ 48: 19. F6
        xor     rax, qword [rcx+100H]                   ; 189E _ 48: 33. 81, 00000100
        xor     r11d, 01H                               ; 18A5 _ 41: 83. F3, 01
        and     esi, 10H                                ; 18A9 _ 83. E6, 10
        mov     r10, qword [rel .refptr.RookMasks]      ; 18AC _ 4C: 8B. 15, 00000000(rel)
        sub     rsi, 8                                  ; 18B3 _ 48: 83. EE, 08
        sub     edx, esi                                ; 18B7 _ 29. F2
        movsxd  rdx, edx                                ; 18B9 _ 48: 63. D2
        mov     r9, rax                                 ; 18BC _ 49: 89. C1
        xor     r9, qword [rbx+rdx*8]                   ; 18BF _ 4C: 33. 0C D3
        mov     rdx, qword [rcx+128H]                   ; 18C3 _ 48: 8B. 91, 00000128
        mov     r12, r9                                 ; 18CA _ 4D: 89. CC
        or      r12, qword [rbx+rbp*8]                  ; 18CD _ 4C: 0B. 24 EB
        movsxd  rbp, r11d                               ; 18D1 _ 49: 63. EB
        mov     rbx, qword [rel .refptr.RookAttacks]    ; 18D4 _ 48: 8B. 1D, 00000000(rel)
        mov     rax, rdx                                ; 18DB _ 48: 89. D0
        mov     rsi, qword [rcx+rbp*8+140H]             ; 18DE _ 48: 8B. B4 E9, 00000140
        or      rax, qword [rcx+120H]                   ; 18E6 _ 48: 0B. 81, 00000120
        pext    rdi, r12, qword [r10+r8*8]              ; 18ED _ C4 82 9A: F5. 3C C2
        mov     r9d, edi                                ; 18F3 _ 41: 89. F9
        mov     r10, qword [rbx+r8*8]                   ; 18F6 _ 4E: 8B. 14 C3
        and     rax, rsi                                ; 18FA _ 48: 21. F0
        test    qword [r10+r9*8], rax                   ; 18FD _ 4B: 85. 04 CA
        jnz     ?_159                                   ; 1901 _ 75, 31
        or      rdx, qword [rcx+118H]                   ; 1903 _ 48: 0B. 91, 00000118
        mov     rdi, qword [rel .refptr.BishopMasks]    ; 190A _ 48: 8B. 3D, 00000000(rel)
        mov     rcx, qword [rel .refptr.BishopAttacks]  ; 1911 _ 48: 8B. 0D, 00000000(rel)
        and     rdx, rsi                                ; 1918 _ 48: 21. F2
        pext    r12, r12, qword [rdi+r8*8]              ; 191B _ C4 22 9A: F5. 24 C7
        mov     r11d, r12d                              ; 1921 _ 45: 89. E3
        mov     r8, qword [rcx+r8*8]                    ; 1924 _ 4E: 8B. 04 C1
        test    qword [r8+r11*8], rdx                   ; 1928 _ 4B: 85. 14 D8
        sete    al                                      ; 192C _ 0F 94. C0
        jmp     ?_154                                   ; 192F _ E9, FFFFFDE5

?_159:  ; Local function
        xor     eax, eax                                ; 1934 _ 31. C0
        jmp     ?_154                                   ; 1936 _ E9, FFFFFDDE

        nop                                             ; 193B _ 90
; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_ZNK8Position8see_signE4Move:; Function begin
        push    r15                                     ; 1940 _ 41: 57
        push    r14                                     ; 1942 _ 41: 56
        push    r13                                     ; 1944 _ 41: 55
        push    r12                                     ; 1946 _ 41: 54
        push    rbp                                     ; 1948 _ 55
        push    rdi                                     ; 1949 _ 57
        push    rsi                                     ; 194A _ 56
        push    rbx                                     ; 194B _ 53
        sub     rsp, 216                                ; 194C _ 48: 81. EC, 000000D8
        lea     rbx, [rel PieceValue]                   ; 1953 _ 48: 8D. 1D, 00000000(rel)
        mov     r9d, edx                                ; 195A _ 41: 89. D1
        mov     esi, edx                                ; 195D _ 89. D6
        sar     r9d, 6                                  ; 195F _ 41: C1. F9, 06
        and     esi, 3FH                                ; 1963 _ 83. E6, 3F
        and     r9d, 3FH                                ; 1966 _ 41: 83. E1, 3F
        movsxd  r11, esi                                ; 196A _ 4C: 63. DE
        mov     r10d, dword [rcx+r9*4]                  ; 196D _ 46: 8B. 14 89
        mov     eax, dword [rcx+r11*4]                  ; 1971 _ 42: 8B. 04 99
        mov     r8, r10                                 ; 1975 _ 4D: 89. D0
        mov     eax, dword [rbx+rax*4]                  ; 1978 _ 8B. 04 83
        cmp     dword [rbx+r10*4], eax                  ; 197B _ 42: 39. 04 93
        jle     ?_167                                   ; 197F _ 0F 8E, 0000028C
        mov     rdi, qword [rel .refptr.SquareBB]       ; 1985 _ 48: 8B. 3D, 00000000(rel)
        and     edx, 0C000H                             ; 198C _ 81. E2, 0000C000
        shr     r10d, 3                                 ; 1992 _ 41: C1. EA, 03
        mov     dword [rsp+50H], eax                    ; 1996 _ 89. 44 24, 50
        mov     r9, qword [rdi+r9*8]                    ; 199A _ 4E: 8B. 0C CF
        xor     r9, qword [rcx+100H]                    ; 199E _ 4C: 33. 89, 00000100
        cmp     edx, 49152                              ; 19A5 _ 81. FA, 0000C000
        je      ?_174                                   ; 19AB _ 0F 84, 00000361
        cmp     edx, 32768                              ; 19B1 _ 81. FA, 00008000
        je      ?_173                                   ; 19B7 _ 0F 84, 0000032F
?_160:  mov     rsi, qword [rel .refptr.RookMasks]      ; 19BD _ 48: 8B. 35, 00000000(rel)
        lea     r15, [r11+80H]                          ; 19C4 _ 4D: 8D. BB, 00000080
        xor     r10d, 01H                               ; 19CB _ 41: 83. F2, 01
        lea     rdx, [r15*8]                            ; 19CF _ 4A: 8D. 14 FD, 00000000
        mov     r13, qword [rel .refptr.RookAttacks]    ; 19D7 _ 4C: 8B. 2D, 00000000(rel)
        mov     r12, qword [rcx+110H]                   ; 19DE _ 4C: 8B. A1, 00000110
        mov     rbp, qword [rcx+108H]                   ; 19E5 _ 48: 8B. A9, 00000108
        mov     rdi, qword [rdx+rsi-400H]               ; 19EC _ 48: 8B. BC 32, FFFFFC00
        mov     r14, qword [rdx+r13-400H]               ; 19F4 _ 4E: 8B. B4 2A, FFFFFC00
        mov     qword [rsp], r12                        ; 19FC _ 4C: 89. 24 24
        mov     r12, qword [rcx+120H]                   ; 1A00 _ 4C: 8B. A1, 00000120
        mov     rsi, qword [rel .refptr.BishopAttacks]  ; 1A07 _ 48: 8B. 35, 00000000(rel)
        mov     qword [rsp+40H], rdi                    ; 1A0E _ 48: 89. 7C 24, 40
        pext    r13, r9, rdi                            ; 1A13 _ C4 62 B2: F5. EF
        mov     r13d, r13d                              ; 1A18 _ 45: 89. ED
        mov     rdi, qword [rcx+128H]                   ; 1A1B _ 48: 8B. B9, 00000128
        mov     qword [rsp+18H], r14                    ; 1A22 _ 4C: 89. 74 24, 18
        mov     qword [rsp+38H], r12                    ; 1A27 _ 4C: 89. 64 24, 38
        mov     r14, rdi                                ; 1A2C _ 49: 89. FE
        mov     qword [rsp+48H], rdi                    ; 1A2F _ 48: 89. 7C 24, 48
        or      r14, r12                                ; 1A34 _ 4D: 09. E6
        mov     r12, qword [rdx+rsi-400H]               ; 1A37 _ 4C: 8B. A4 32, FFFFFC00
        mov     qword [rsp+20H], r14                    ; 1A3F _ 4C: 89. 74 24, 20
        mov     r14, qword [rel .refptr.BishopMasks]    ; 1A44 _ 4C: 8B. 35, 00000000(rel)
        mov     qword [rsp+8H], r12                     ; 1A4B _ 4C: 89. 64 24, 08
        mov     rsi, qword [rdx+r14-400H]               ; 1A50 _ 4A: 8B. B4 32, FFFFFC00
        mov     r14, qword [rcx+118H]                   ; 1A58 _ 4C: 8B. B1, 00000118
        mov     qword [rsp+30H], rsi                    ; 1A5F _ 48: 89. 74 24, 30
        pext    r12, r9, rsi                            ; 1A64 _ C4 62 B2: F5. E6
        mov     rsi, rbp                                ; 1A69 _ 48: 89. EE
        mov     r12d, r12d                              ; 1A6C _ 45: 89. E4
        mov     qword [rsp+28H], r14                    ; 1A6F _ 4C: 89. 74 24, 28
        or      r14, rdi                                ; 1A74 _ 49: 09. FE
        mov     rdi, qword [rel .refptr.StepAttacksBB]  ; 1A77 _ 48: 8B. 3D, 00000000(rel)
        and     rsi, qword [rcx+140H]                   ; 1A7E _ 48: 23. B1, 00000140
        mov     qword [rsp+10H], r14                    ; 1A85 _ 4C: 89. 74 24, 10
        mov     r14, rbp                                ; 1A8A _ 49: 89. EE
        and     r14, qword [rcx+148H]                   ; 1A8D _ 4C: 23. B1, 00000148
        and     rsi, qword [rdi+r11*8+1200H]            ; 1A94 _ 4A: 23. B4 DF, 00001200
        and     r14, qword [rdi+r11*8+200H]             ; 1A9C _ 4E: 23. B4 DF, 00000200
        mov     r11, qword [rsp]                        ; 1AA4 _ 4C: 8B. 1C 24
        and     r11, qword [rdi+r15*8]                  ; 1AA8 _ 4E: 23. 1C FF
        mov     rdx, qword [rdx+rdi+800H]               ; 1AAC _ 48: 8B. 94 3A, 00000800
        or      rsi, r14                                ; 1AB4 _ 4C: 09. F6
        mov     rdi, qword [rsp+18H]                    ; 1AB7 _ 48: 8B. 7C 24, 18
        and     rdx, qword [rcx+130H]                   ; 1ABC _ 48: 23. 91, 00000130
        or      rsi, r11                                ; 1AC3 _ 4C: 09. DE
        mov     r14, qword [rsp+20H]                    ; 1AC6 _ 4C: 8B. 74 24, 20
        mov     r11, qword [rsp+8H]                     ; 1ACB _ 4C: 8B. 5C 24, 08
        and     r14, qword [rdi+r13*8]                  ; 1AD0 _ 4E: 23. 34 EF
        mov     r15, qword [rsp+10H]                    ; 1AD4 _ 4C: 8B. 7C 24, 10
        or      rsi, rdx                                ; 1AD9 _ 48: 09. D6
        movsxd  rdx, r10d                               ; 1ADC _ 49: 63. D2
        and     r15, qword [r11+r12*8]                  ; 1ADF _ 4F: 23. 3C E3
        or      rsi, r14                                ; 1AE3 _ 4C: 09. F6
        or      rsi, r15                                ; 1AE6 _ 4C: 09. FE
        and     rsi, r9                                 ; 1AE9 _ 4C: 21. CE
        mov     r13, rsi                                ; 1AEC _ 49: 89. F5
        and     r13, qword [rcx+rdx*8+140H]             ; 1AEF _ 4C: 23. AC D1, 00000140
        mov     rdx, r13                                ; 1AF7 _ 4C: 89. EA
        je      ?_166                                   ; 1AFA _ 0F 84, 000000FD
        mov     r14d, dword [rsp+50H]                   ; 1B00 _ 44: 8B. 74 24, 50
        and     r8d, 07H                                ; 1B05 _ 41: 83. E0, 07
        mov     eax, 1                                  ; 1B09 _ B8, 00000001
        lea     rdi, [rsp+50H]                          ; 1B0E _ 48: 8D. 7C 24, 50
?_161:  mov     r8d, dword [rbx+r8*4]                   ; 1B13 _ 46: 8B. 04 83
        mov     r12, rdx                                ; 1B17 _ 49: 89. D4
        sub     r8d, r14d                               ; 1B1A _ 45: 29. F0
        and     r12, rbp                                ; 1B1D _ 49: 21. EC
        mov     r14d, r8d                               ; 1B20 _ 45: 89. C6
        mov     dword [rdi+4H], r8d                     ; 1B23 _ 44: 89. 47, 04
        jne     ?_169                                   ; 1B27 _ 0F 85, 00000124
        mov     r11, qword [rsp]                        ; 1B2D _ 4C: 8B. 1C 24
        and     r11, rdx                                ; 1B31 _ 49: 21. D3
        jne     ?_170                                   ; 1B34 _ 0F 85, 00000149
        mov     r13, qword [rsp+28H]                    ; 1B3A _ 4C: 8B. 6C 24, 28
        and     r13, rdx                                ; 1B3F _ 49: 21. D5
        jne     ?_171                                   ; 1B42 _ 0F 85, 00000158
        mov     r12, qword [rsp+38H]                    ; 1B48 _ 4C: 8B. 64 24, 38
        and     r12, rdx                                ; 1B4D _ 49: 21. D4
        jne     ?_168                                   ; 1B50 _ 0F 85, 000000CA
        and     rdx, qword [rsp+48H]                    ; 1B56 _ 48: 23. 54 24, 48
        je      ?_172                                   ; 1B5B _ 0F 84, 00000170
        blsi    rdx, rdx                                ; 1B61 _ C4 E2 E8: F3. DA
        xor     r9, rdx                                 ; 1B66 _ 49: 31. D1
        mov     r15, qword [rsp+8H]                     ; 1B69 _ 4C: 8B. 7C 24, 08
        pext    r11, r9, qword [rsp+30H]                ; 1B6E _ C4 62 B2: F5. 5C 24, 30
        pext    r13, r9, qword [rsp+40H]                ; 1B75 _ C4 62 B2: F5. 6C 24, 40
        mov     r8d, r11d                               ; 1B7C _ 45: 89. D8
        mov     r11d, r13d                              ; 1B7F _ 45: 89. EB
        mov     r13, qword [rsp+18H]                    ; 1B82 _ 4C: 8B. 6C 24, 18
        mov     r12, qword [rsp+10H]                    ; 1B87 _ 4C: 8B. 64 24, 10
        mov     rdx, qword [rsp+20H]                    ; 1B8C _ 48: 8B. 54 24, 20
        and     r12, qword [r15+r8*8]                   ; 1B91 _ 4F: 23. 24 C7
        mov     r8d, 5                                  ; 1B95 _ 41: B8, 00000005
        and     rdx, qword [r13+r11*8]                  ; 1B9B _ 4B: 23. 54 DD, 00
        or      rdx, r12                                ; 1BA0 _ 4C: 09. E2
        or      rsi, rdx                                ; 1BA3 _ 48: 09. D6
        and     rsi, r9                                 ; 1BA6 _ 4C: 21. CE
?_162:  xor     r10d, 01H                               ; 1BA9 _ 41: 83. F2, 01
        add     eax, 1                                  ; 1BAD _ 83. C0, 01
        add     rdi, 4                                  ; 1BB0 _ 48: 83. C7, 04
        movsxd  r12, r10d                               ; 1BB4 _ 4D: 63. E2
        mov     r15, rsi                                ; 1BB7 _ 49: 89. F7
        and     r15, qword [rcx+r12*8+140H]             ; 1BBA _ 4E: 23. BC E1, 00000140
        mov     rdx, r15                                ; 1BC2 _ 4C: 89. FA
        jne     ?_161                                   ; 1BC5 _ 0F 85, FFFFFF48
?_163:  cmp     eax, 1                                  ; 1BCB _ 83. F8, 01
        jz      ?_165                                   ; 1BCE _ 74, 29
        movsxd  rcx, eax                                ; 1BD0 _ 48: 63. C8
        sub     eax, 2                                  ; 1BD3 _ 83. E8, 02
        mov     r10d, dword [rsp+rcx*4+4CH]             ; 1BD6 _ 44: 8B. 54 8C, 4C
?_164:  movsxd  r9, eax                                 ; 1BDB _ 4C: 63. C8
        neg     r10d                                    ; 1BDE _ 41: F7. DA
        cmp     dword [rsp+r9*4+50H], r10d              ; 1BE1 _ 46: 39. 54 8C, 50
        cmovle  r10d, dword [rsp+r9*4+50H]              ; 1BE6 _ 46: 0F 4E. 54 8C, 50
        sub     eax, 1                                  ; 1BEC _ 83. E8, 01
        cmp     eax, -1                                 ; 1BEF _ 83. F8, FF
        mov     dword [rsp+r9*4+50H], r10d              ; 1BF2 _ 46: 89. 54 8C, 50
        jnz     ?_164                                   ; 1BF7 _ 75, E2
?_165:  mov     eax, dword [rsp+50H]                    ; 1BF9 _ 8B. 44 24, 50
?_166:  add     rsp, 216                                ; 1BFD _ 48: 81. C4, 000000D8
        pop     rbx                                     ; 1C04 _ 5B
        pop     rsi                                     ; 1C05 _ 5E
        pop     rdi                                     ; 1C06 _ 5F
        pop     rbp                                     ; 1C07 _ 5D
        pop     r12                                     ; 1C08 _ 41: 5C
        pop     r13                                     ; 1C0A _ 41: 5D
        pop     r14                                     ; 1C0C _ 41: 5E
        pop     r15                                     ; 1C0E _ 41: 5F
        ret                                             ; 1C10 _ C3

?_167:  mov     eax, 10000                              ; 1C11 _ B8, 00002710
        jmp     ?_166                                   ; 1C16 _ EB, E5

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_168:  mov     r8, qword [rsp+18H]                     ; 1C20 _ 4C: 8B. 44 24, 18
        blsi    rdx, r12                                ; 1C25 _ C4 C2 E8: F3. DC
        xor     r9, rdx                                 ; 1C2A _ 49: 31. D1
        pext    r11, r9, qword [rsp+40H]                ; 1C2D _ C4 62 B2: F5. 5C 24, 40
        mov     r13d, r11d                              ; 1C34 _ 45: 89. DD
        mov     r15, qword [rsp+20H]                    ; 1C37 _ 4C: 8B. 7C 24, 20
        and     r15, qword [r8+r13*8]                   ; 1C3C _ 4F: 23. 3C E8
        mov     r8d, 4                                  ; 1C40 _ 41: B8, 00000004
        or      rsi, r15                                ; 1C46 _ 4C: 09. FE
        and     rsi, r9                                 ; 1C49 _ 4C: 21. CE
        jmp     ?_162                                   ; 1C4C _ E9, FFFFFF58

?_169:  mov     r13, qword [rsp+8H]                     ; 1C51 _ 4C: 8B. 6C 24, 08
        blsi    r11, r12                                ; 1C56 _ C4 C2 A0: F3. DC
        xor     r9, r11                                 ; 1C5B _ 4D: 31. D9
        pext    r15, r9, qword [rsp+30H]                ; 1C5E _ C4 62 B2: F5. 7C 24, 30
        mov     edx, r15d                               ; 1C65 _ 44: 89. FA
        mov     r8, qword [rsp+10H]                     ; 1C68 _ 4C: 8B. 44 24, 10
        and     r8, qword [r13+rdx*8]                   ; 1C6D _ 4D: 23. 44 D5, 00
        or      rsi, r8                                 ; 1C72 _ 4C: 09. C6
        mov     r8d, 1                                  ; 1C75 _ 41: B8, 00000001
        and     rsi, r9                                 ; 1C7B _ 4C: 21. CE
        jmp     ?_162                                   ; 1C7E _ E9, FFFFFF26

?_170:  blsi    r15, r11                                ; 1C83 _ C4 C2 80: F3. DB
        xor     r9, r15                                 ; 1C88 _ 4D: 31. F9
        mov     r8d, 2                                  ; 1C8B _ 41: B8, 00000002
        and     rsi, r9                                 ; 1C91 _ 4C: 21. CE
        jmp     ?_162                                   ; 1C94 _ E9, FFFFFF10

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_171:  mov     r8, qword [rsp+8H]                      ; 1CA0 _ 4C: 8B. 44 24, 08
        blsi    rdx, r13                                ; 1CA5 _ C4 C2 E8: F3. DD
        xor     r9, rdx                                 ; 1CAA _ 49: 31. D1
        pext    r12, r9, qword [rsp+30H]                ; 1CAD _ C4 62 B2: F5. 64 24, 30
        mov     r11d, r12d                              ; 1CB4 _ 45: 89. E3
        mov     r15, qword [rsp+10H]                    ; 1CB7 _ 4C: 8B. 7C 24, 10
        and     r15, qword [r8+r11*8]                   ; 1CBC _ 4F: 23. 3C D8
        mov     r8d, 3                                  ; 1CC0 _ 41: B8, 00000003
        or      rsi, r15                                ; 1CC6 _ 4C: 09. FE
        and     rsi, r9                                 ; 1CC9 _ 4C: 21. CE
        jmp     ?_162                                   ; 1CCC _ E9, FFFFFED8

?_172:  xor     r10d, 01H                               ; 1CD1 _ 41: 83. F2, 01
        movsxd  rbx, r10d                               ; 1CD5 _ 49: 63. DA
        and     rsi, qword [rcx+rbx*8+140H]             ; 1CD8 _ 48: 23. B4 D9, 00000140
        cmp     rsi, 1                                  ; 1CE0 _ 48: 83. FE, 01
        adc     eax, 0                                  ; 1CE4 _ 83. D0, 00
        jmp     ?_163                                   ; 1CE7 _ E9, FFFFFEDF

?_173:  cmp     r10d, 1                                 ; 1CEC _ 41: 83. FA, 01
        mov     eax, dword [rel ?_064]                  ; 1CF0 _ 8B. 05, 00000004(rel)
        sbb     rdx, rdx                                ; 1CF6 _ 48: 19. D2
        and     edx, 10H                                ; 1CF9 _ 83. E2, 10
        sub     rdx, 8                                  ; 1CFC _ 48: 83. EA, 08
        sub     esi, edx                                ; 1D00 _ 29. D6
        mov     dword [rsp+50H], eax                    ; 1D02 _ 89. 44 24, 50
        movsxd  rbp, esi                                ; 1D06 _ 48: 63. EE
        xor     r9, qword [rdi+rbp*8]                   ; 1D09 _ 4C: 33. 0C EF
        jmp     ?_160                                   ; 1D0D _ E9, FFFFFCAB
; _ZNK8Position8see_signE4Move End of function

?_174:  ; Local function
        xor     eax, eax                                ; 1D12 _ 31. C0
        jmp     ?_166                                   ; 1D14 _ E9, FFFFFEE4

        nop                                             ; 1D19 _ 90
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZNK8Position3seeE4Move:; Function begin
        push    r15                                     ; 1D20 _ 41: 57
        push    r14                                     ; 1D22 _ 41: 56
        push    r13                                     ; 1D24 _ 41: 55
        push    r12                                     ; 1D26 _ 41: 54
        push    rbp                                     ; 1D28 _ 55
        push    rdi                                     ; 1D29 _ 57
        push    rsi                                     ; 1D2A _ 56
        push    rbx                                     ; 1D2B _ 53
        sub     rsp, 216                                ; 1D2C _ 48: 81. EC, 000000D8
        lea     r15, [rel PieceValue]                   ; 1D33 _ 4C: 8D. 3D, 00000000(rel)
        mov     rbx, qword [rel .refptr.SquareBB]       ; 1D3A _ 48: 8B. 1D, 00000000(rel)
        mov     r11d, edx                               ; 1D41 _ 41: 89. D3
        mov     r8d, edx                                ; 1D44 _ 41: 89. D0
        and     edx, 0C000H                             ; 1D47 _ 81. E2, 0000C000
        and     r11d, 3FH                               ; 1D4D _ 41: 83. E3, 3F
        sar     r8d, 6                                  ; 1D51 _ 41: C1. F8, 06
        movsxd  rsi, r11d                               ; 1D55 _ 49: 63. F3
        and     r8d, 3FH                                ; 1D58 _ 41: 83. E0, 3F
        mov     eax, dword [rcx+rsi*4]                  ; 1D5C _ 8B. 04 B1
        mov     r10d, dword [rcx+r8*4]                  ; 1D5F _ 46: 8B. 14 81
        mov     r8, qword [rbx+r8*8]                    ; 1D63 _ 4E: 8B. 04 C3
        xor     r8, qword [rcx+100H]                    ; 1D67 _ 4C: 33. 81, 00000100
        mov     eax, dword [r15+rax*4]                  ; 1D6E _ 41: 8B. 04 87
        mov     r9d, r10d                               ; 1D72 _ 45: 89. D1
        shr     r9d, 3                                  ; 1D75 _ 41: C1. E9, 03
        cmp     edx, 49152                              ; 1D79 _ 81. FA, 0000C000
        mov     dword [rsp+50H], eax                    ; 1D7F _ 89. 44 24, 50
        je      ?_188                                   ; 1D83 _ 0F 84, 0000034F
        cmp     edx, 32768                              ; 1D89 _ 81. FA, 00008000
        je      ?_187                                   ; 1D8F _ 0F 84, 0000031C
?_175:  mov     r12, qword [rel .refptr.RookAttacks]    ; 1D95 _ 4C: 8B. 25, 00000000(rel)
        lea     r14, [rsi+80H]                          ; 1D9C _ 4C: 8D. B6, 00000080
        xor     r9d, 01H                                ; 1DA3 _ 41: 83. F1, 01
        lea     rdx, [r14*8]                            ; 1DA7 _ 4A: 8D. 14 F5, 00000000
        mov     rbp, qword [rcx+110H]                   ; 1DAF _ 48: 8B. A9, 00000110
        mov     r11, qword [rel .refptr.RookMasks]      ; 1DB6 _ 4C: 8B. 1D, 00000000(rel)
        mov     rdi, qword [rcx+108H]                   ; 1DBD _ 48: 8B. B9, 00000108
        mov     r13, qword [rdx+r12-400H]               ; 1DC4 _ 4E: 8B. AC 22, FFFFFC00
        mov     qword [rsp], rbp                        ; 1DCC _ 48: 89. 2C 24
        mov     rbp, qword [rcx+120H]                   ; 1DD0 _ 48: 8B. A9, 00000120
        mov     rbx, qword [rdx+r11-400H]               ; 1DD7 _ 4A: 8B. 9C 1A, FFFFFC00
        mov     qword [rsp+18H], r13                    ; 1DDF _ 4C: 89. 6C 24, 18
        mov     r13, qword [rcx+128H]                   ; 1DE4 _ 4C: 8B. A9, 00000128
        mov     qword [rsp+38H], rbp                    ; 1DEB _ 48: 89. 6C 24, 38
        mov     qword [rsp+40H], rbx                    ; 1DF0 _ 48: 89. 5C 24, 40
        pext    r12, r8, rbx                            ; 1DF5 _ C4 62 BA: F5. E3
        mov     r12d, r12d                              ; 1DFA _ 45: 89. E4
        mov     rbx, qword [rel .refptr.BishopAttacks]  ; 1DFD _ 48: 8B. 1D, 00000000(rel)
        mov     r11, r13                                ; 1E04 _ 4D: 89. EB
        mov     qword [rsp+48H], r13                    ; 1E07 _ 4C: 89. 6C 24, 48
        or      r11, rbp                                ; 1E0C _ 49: 09. EB
        mov     qword [rsp+20H], r11                    ; 1E0F _ 4C: 89. 5C 24, 20
        mov     r11, qword [rel .refptr.BishopMasks]    ; 1E14 _ 4C: 8B. 1D, 00000000(rel)
        mov     rbp, qword [rdx+rbx-400H]               ; 1E1B _ 48: 8B. AC 1A, FFFFFC00
        mov     rbx, qword [rdx+r11-400H]               ; 1E23 _ 4A: 8B. 9C 1A, FFFFFC00
        mov     r11, qword [rcx+118H]                   ; 1E2B _ 4C: 8B. 99, 00000118
        mov     qword [rsp+8H], rbp                     ; 1E32 _ 48: 89. 6C 24, 08
        mov     qword [rsp+30H], rbx                    ; 1E37 _ 48: 89. 5C 24, 30
        pext    rbp, r8, rbx                            ; 1E3C _ C4 E2 BA: F5. EB
        mov     ebp, ebp                                ; 1E41 _ 89. ED
        mov     rbx, qword [rel .refptr.StepAttacksBB]  ; 1E43 _ 48: 8B. 1D, 00000000(rel)
        mov     qword [rsp+28H], r11                    ; 1E4A _ 4C: 89. 5C 24, 28
        or      r11, r13                                ; 1E4F _ 4D: 09. EB
        mov     r13, rdi                                ; 1E52 _ 49: 89. FD
        and     r13, qword [rcx+148H]                   ; 1E55 _ 4C: 23. A9, 00000148
        mov     qword [rsp+10H], r11                    ; 1E5C _ 4C: 89. 5C 24, 10
        mov     r11, rdi                                ; 1E61 _ 49: 89. FB
        and     r11, qword [rcx+140H]                   ; 1E64 _ 4C: 23. 99, 00000140
        and     r13, qword [rbx+rsi*8+200H]             ; 1E6B _ 4C: 23. AC F3, 00000200
        and     r11, qword [rbx+rsi*8+1200H]            ; 1E73 _ 4C: 23. 9C F3, 00001200
        mov     rsi, qword [rsp]                        ; 1E7B _ 48: 8B. 34 24
        and     rsi, qword [rbx+r14*8]                  ; 1E7F _ 4A: 23. 34 F3
        mov     rdx, qword [rdx+rbx+800H]               ; 1E83 _ 48: 8B. 94 1A, 00000800
        or      r11, r13                                ; 1E8B _ 4D: 09. EB
        mov     rbx, qword [rsp+18H]                    ; 1E8E _ 48: 8B. 5C 24, 18
        and     rdx, qword [rcx+130H]                   ; 1E93 _ 48: 23. 91, 00000130
        or      r11, rsi                                ; 1E9A _ 49: 09. F3
        mov     r13, qword [rsp+20H]                    ; 1E9D _ 4C: 8B. 6C 24, 20
        mov     rsi, qword [rsp+8H]                     ; 1EA2 _ 48: 8B. 74 24, 08
        and     r13, qword [rbx+r12*8]                  ; 1EA7 _ 4E: 23. 2C E3
        mov     r14, qword [rsp+10H]                    ; 1EAB _ 4C: 8B. 74 24, 10
        or      r11, rdx                                ; 1EB0 _ 49: 09. D3
        movsxd  rdx, r9d                                ; 1EB3 _ 49: 63. D1
        and     r14, qword [rsi+rbp*8]                  ; 1EB6 _ 4C: 23. 34 EE
        or      r11, r13                                ; 1EBA _ 4D: 09. EB
        or      r11, r14                                ; 1EBD _ 4D: 09. F3
        and     r11, r8                                 ; 1EC0 _ 4D: 21. C3
        mov     r12, r11                                ; 1EC3 _ 4D: 89. DC
        and     r12, qword [rcx+rdx*8+140H]             ; 1EC6 _ 4C: 23. A4 D1, 00000140
        mov     rdx, r12                                ; 1ECE _ 4C: 89. E2
        je      ?_182                                   ; 1ED1 _ 0F 84, 00000129
        mov     ebx, dword [rsp+50H]                    ; 1ED7 _ 8B. 5C 24, 50
        and     r10d, 07H                               ; 1EDB _ 41: 83. E2, 07
        mov     eax, 1                                  ; 1EDF _ B8, 00000001
        lea     r13, [rsp+50H]                          ; 1EE4 _ 4C: 8D. 6C 24, 50
?_176:  mov     r10d, dword [r15+r10*4]                 ; 1EE9 _ 47: 8B. 14 97
        mov     rbp, rdx                                ; 1EED _ 48: 89. D5
        sub     r10d, ebx                               ; 1EF0 _ 41: 29. DA
        and     rbp, rdi                                ; 1EF3 _ 48: 21. FD
        mov     ebx, r10d                               ; 1EF6 _ 44: 89. D3
        mov     dword [r13+4H], r10d                    ; 1EF9 _ 45: 89. 55, 04
; Note: Immediate operand could be made smaller by sign extension
        jne     ?_177                                   ; 1EFD _ 0F 85, 0000007D
        mov     rsi, qword [rsp]                        ; 1F03 _ 48: 8B. 34 24
        and     rsi, rdx                                ; 1F07 _ 48: 21. D6
        jne     ?_185                                   ; 1F0A _ 0F 85, 00000150
        mov     r12, qword [rsp+28H]                    ; 1F10 _ 4C: 8B. 64 24, 28
        and     r12, rdx                                ; 1F15 _ 49: 21. D4
        jne     ?_183                                   ; 1F18 _ 0F 85, 000000F6
        mov     rbp, qword [rsp+38H]                    ; 1F1E _ 48: 8B. 6C 24, 38
        and     rbp, rdx                                ; 1F23 _ 48: 21. D5
        jne     ?_186                                   ; 1F26 _ 0F 85, 00000154
        and     rdx, qword [rsp+48H]                    ; 1F2C _ 48: 23. 54 24, 48
        je      ?_184                                   ; 1F31 _ 0F 84, 0000010D
        blsi    rdx, rdx                                ; 1F37 _ C4 E2 E8: F3. DA
        xor     r8, rdx                                 ; 1F3C _ 49: 31. D0
        mov     r14, qword [rsp+8H]                     ; 1F3F _ 4C: 8B. 74 24, 08
        pext    rsi, r8, qword [rsp+30H]                ; 1F44 _ C4 E2 BA: F5. 74 24, 30
        pext    r12, r8, qword [rsp+40H]                ; 1F4B _ C4 62 BA: F5. 64 24, 40
        mov     r10d, esi                               ; 1F52 _ 41: 89. F2
        mov     esi, r12d                               ; 1F55 _ 44: 89. E6
        mov     r12, qword [rsp+18H]                    ; 1F58 _ 4C: 8B. 64 24, 18
        mov     rbp, qword [rsp+10H]                    ; 1F5D _ 48: 8B. 6C 24, 10
        mov     rdx, qword [rsp+20H]                    ; 1F62 _ 48: 8B. 54 24, 20
        and     rbp, qword [r14+r10*8]                  ; 1F67 _ 4B: 23. 2C D6
        mov     r10d, 5                                 ; 1F6B _ 41: BA, 00000005
        and     rdx, qword [r12+rsi*8]                  ; 1F71 _ 49: 23. 14 F4
        or      rdx, rbp                                ; 1F75 _ 48: 09. EA
        or      r11, rdx                                ; 1F78 _ 49: 09. D3
        and     r11, r8                                 ; 1F7B _ 4D: 21. C3
        jmp     ?_178                                   ; 1F7E _ EB, 2C

?_177:  mov     r12, qword [rsp+8H]                     ; 1F80 _ 4C: 8B. 64 24, 08
        blsi    rsi, rbp                                ; 1F85 _ C4 E2 C8: F3. DD
        xor     r8, rsi                                 ; 1F8A _ 49: 31. F0
        pext    r14, r8, qword [rsp+30H]                ; 1F8D _ C4 62 BA: F5. 74 24, 30
        mov     edx, r14d                               ; 1F94 _ 44: 89. F2
        mov     r10, qword [rsp+10H]                    ; 1F97 _ 4C: 8B. 54 24, 10
        and     r10, qword [r12+rdx*8]                  ; 1F9C _ 4D: 23. 14 D4
        or      r11, r10                                ; 1FA0 _ 4D: 09. D3
        mov     r10d, 1                                 ; 1FA3 _ 41: BA, 00000001
        and     r11, r8                                 ; 1FA9 _ 4D: 21. C3
?_178:  xor     r9d, 01H                                ; 1FAC _ 41: 83. F1, 01
        add     eax, 1                                  ; 1FB0 _ 83. C0, 01
        add     r13, 4                                  ; 1FB3 _ 49: 83. C5, 04
        movsxd  rbp, r9d                                ; 1FB7 _ 49: 63. E9
        mov     r14, r11                                ; 1FBA _ 4D: 89. DE
        and     r14, qword [rcx+rbp*8+140H]             ; 1FBD _ 4C: 23. B4 E9, 00000140
        mov     rdx, r14                                ; 1FC5 _ 4C: 89. F2
        jne     ?_176                                   ; 1FC8 _ 0F 85, FFFFFF1B
?_179:  cmp     eax, 1                                  ; 1FCE _ 83. F8, 01
        jz      ?_181                                   ; 1FD1 _ 74, 29
        movsxd  rcx, eax                                ; 1FD3 _ 48: 63. C8
        sub     eax, 2                                  ; 1FD6 _ 83. E8, 02
        mov     r9d, dword [rsp+rcx*4+4CH]              ; 1FD9 _ 44: 8B. 4C 8C, 4C
?_180:  movsxd  r8, eax                                 ; 1FDE _ 4C: 63. C0
        neg     r9d                                     ; 1FE1 _ 41: F7. D9
        cmp     dword [rsp+r8*4+50H], r9d               ; 1FE4 _ 46: 39. 4C 84, 50
        cmovle  r9d, dword [rsp+r8*4+50H]               ; 1FE9 _ 46: 0F 4E. 4C 84, 50
        sub     eax, 1                                  ; 1FEF _ 83. E8, 01
        cmp     eax, -1                                 ; 1FF2 _ 83. F8, FF
        mov     dword [rsp+r8*4+50H], r9d               ; 1FF5 _ 46: 89. 4C 84, 50
        jnz     ?_180                                   ; 1FFA _ 75, E2
?_181:  mov     eax, dword [rsp+50H]                    ; 1FFC _ 8B. 44 24, 50
?_182:  add     rsp, 216                                ; 2000 _ 48: 81. C4, 000000D8
        pop     rbx                                     ; 2007 _ 5B
        pop     rsi                                     ; 2008 _ 5E
        pop     rdi                                     ; 2009 _ 5F
        pop     rbp                                     ; 200A _ 5D
        pop     r12                                     ; 200B _ 41: 5C
        pop     r13                                     ; 200D _ 41: 5D
        pop     r14                                     ; 200F _ 41: 5E
        pop     r15                                     ; 2011 _ 41: 5F
        ret                                             ; 2013 _ C3

?_183:  mov     r10, qword [rsp+8H]                     ; 2014 _ 4C: 8B. 54 24, 08
        blsi    rdx, r12                                ; 2019 _ C4 C2 E8: F3. DC
        xor     r8, rdx                                 ; 201E _ 49: 31. D0
        pext    rbp, r8, qword [rsp+30H]                ; 2021 _ C4 E2 BA: F5. 6C 24, 30
        mov     esi, ebp                                ; 2028 _ 89. EE
        mov     r14, qword [rsp+10H]                    ; 202A _ 4C: 8B. 74 24, 10
        and     r14, qword [r10+rsi*8]                  ; 202F _ 4D: 23. 34 F2
        mov     r10d, 3                                 ; 2033 _ 41: BA, 00000003
        or      r11, r14                                ; 2039 _ 4D: 09. F3
        and     r11, r8                                 ; 203C _ 4D: 21. C3
        jmp     ?_178                                   ; 203F _ E9, FFFFFF68

?_184:  xor     r9d, 01H                                ; 2044 _ 41: 83. F1, 01
        movsxd  r15, r9d                                ; 2048 _ 4D: 63. F9
        and     r11, qword [rcx+r15*8+140H]             ; 204B _ 4E: 23. 9C F9, 00000140
        cmp     r11, 1                                  ; 2053 _ 49: 83. FB, 01
        adc     eax, 0                                  ; 2057 _ 83. D0, 00
        jmp     ?_179                                   ; 205A _ E9, FFFFFF6F

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_185:  blsi    r14, rsi                                ; 2060 _ C4 E2 88: F3. DE
        xor     r8, r14                                 ; 2065 _ 4D: 31. F0
        mov     r10d, 2                                 ; 2068 _ 41: BA, 00000002
        and     r11, r8                                 ; 206E _ 4D: 21. C3
        jmp     ?_178                                   ; 2071 _ E9, FFFFFF36

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_186:  mov     r10, qword [rsp+18H]                    ; 2080 _ 4C: 8B. 54 24, 18
        blsi    rdx, rbp                                ; 2085 _ C4 E2 E8: F3. DD
        xor     r8, rdx                                 ; 208A _ 49: 31. D0
        pext    rsi, r8, qword [rsp+40H]                ; 208D _ C4 E2 BA: F5. 74 24, 40
        mov     r12d, esi                               ; 2094 _ 41: 89. F4
        mov     r14, qword [rsp+20H]                    ; 2097 _ 4C: 8B. 74 24, 20
        and     r14, qword [r10+r12*8]                  ; 209C _ 4F: 23. 34 E2
        mov     r10d, 4                                 ; 20A0 _ 41: BA, 00000004
        or      r11, r14                                ; 20A6 _ 4D: 09. F3
        and     r11, r8                                 ; 20A9 _ 4D: 21. C3
        jmp     ?_178                                   ; 20AC _ E9, FFFFFEFB

?_187:  cmp     r9d, 1                                  ; 20B1 _ 41: 83. F9, 01
        mov     eax, dword [rel ?_064]                  ; 20B5 _ 8B. 05, 00000004(rel)
        sbb     rdx, rdx                                ; 20BB _ 48: 19. D2
        and     edx, 10H                                ; 20BE _ 83. E2, 10
        sub     rdx, 8                                  ; 20C1 _ 48: 83. EA, 08
        sub     r11d, edx                               ; 20C5 _ 41: 29. D3
        mov     dword [rsp+50H], eax                    ; 20C8 _ 89. 44 24, 50
        movsxd  rdi, r11d                               ; 20CC _ 49: 63. FB
        xor     r8, qword [rbx+rdi*8]                   ; 20CF _ 4C: 33. 04 FB
        jmp     ?_175                                   ; 20D3 _ E9, FFFFFCBD
; _ZNK8Position3seeE4Move End of function

?_188:  ; Local function
        xor     eax, eax                                ; 20D8 _ 31. C0
        jmp     ?_182                                   ; 20DA _ E9, FFFFFF21

        nop                                             ; 20DF _ 90

ALIGN   16
_ZN8Position12do_null_moveER9StateInfo:; Function begin
        mov     rax, qword [rcx+3B8H]                   ; 20E0 _ 48: 8B. 81, 000003B8
        mov     r8, qword [rax]                         ; 20E7 _ 4C: 8B. 00
        mov     qword [rdx], r8                         ; 20EA _ 4C: 89. 02
        mov     r9, qword [rax+8H]                      ; 20ED _ 4C: 8B. 48, 08
        mov     qword [rdx+8H], r9                      ; 20F1 _ 4C: 89. 4A, 08
        mov     r10, qword [rax+10H]                    ; 20F5 _ 4C: 8B. 50, 10
        mov     qword [rdx+10H], r10                    ; 20F9 _ 4C: 89. 52, 10
        mov     r11, qword [rax+18H]                    ; 20FD _ 4C: 8B. 58, 18
        mov     qword [rdx+18H], r11                    ; 2101 _ 4C: 89. 5A, 18
        mov     r8, qword [rax+20H]                     ; 2105 _ 4C: 8B. 40, 20
        mov     qword [rdx+20H], r8                     ; 2109 _ 4C: 89. 42, 20
        mov     r9, qword [rax+28H]                     ; 210D _ 4C: 8B. 48, 28
        mov     qword [rdx+28H], r9                     ; 2111 _ 4C: 89. 4A, 28
        mov     r10, qword [rax+30H]                    ; 2115 _ 4C: 8B. 50, 30
        mov     qword [rdx+30H], r10                    ; 2119 _ 4C: 89. 52, 30
        mov     r11, qword [rax+38H]                    ; 211D _ 4C: 8B. 58, 38
        mov     r10, qword [rdx+28H]                    ; 2121 _ 4C: 8B. 52, 28
        mov     qword [rdx+38H], r11                    ; 2125 _ 4C: 89. 5A, 38
        mov     r8, qword [rax+40H]                     ; 2129 _ 4C: 8B. 40, 40
        cmp     r10, 64                                 ; 212D _ 49: 83. FA, 40
        mov     qword [rdx+40H], r8                     ; 2131 _ 4C: 89. 42, 40
        mov     rax, qword [rax+48H]                    ; 2135 _ 48: 8B. 40, 48
        mov     qword [rdx+48H], rax                    ; 2139 _ 48: 89. 42, 48
        mov     r9, qword [rcx+3B8H]                    ; 213D _ 4C: 8B. 89, 000003B8
        mov     qword [rdx+48H], r9                     ; 2144 _ 4C: 89. 4A, 48
        mov     qword [rcx+3B8H], rdx                   ; 2148 _ 48: 89. 91, 000003B8
        jnz     ?_190                                   ; 214F _ 75, 3E
?_189:  mov     r9, qword [rel .refptr.TT]              ; 2151 _ 4C: 8B. 0D, 00000000(rel)
        mov     rax, qword [rel _ZN7Zobrist4sideE]      ; 2158 _ 48: 8B. 05, 00000008(rel)
        xor     rax, qword [rdx+30H]                    ; 215F _ 48: 33. 42, 30
        mov     r10, qword [r9]                         ; 2163 _ 4D: 8B. 11
        mov     qword [rdx+30H], rax                    ; 2166 _ 48: 89. 42, 30
        lea     r11, [r10-1H]                           ; 216A _ 4D: 8D. 5A, FF
        and     rax, r11                                ; 216E _ 4C: 21. D8
        shl     rax, 5                                  ; 2171 _ 48: C1. E0, 05
        add     rax, qword [r9+8H]                      ; 2175 _ 49: 03. 41, 08
        prefetcht0 [rax]                                ; 2179 _ 0F 18. 08
        add     dword [rdx+1CH], 1                      ; 217C _ 83. 42, 1C, 01
        mov     dword [rdx+20H], 0                      ; 2180 _ C7. 42, 20, 00000000
        xor     dword [rcx+3ACH], 01H                   ; 2187 _ 83. B1, 000003AC, 01
        ret                                             ; 218E _ C3
; _ZN8Position12do_null_moveER9StateInfo End of function

?_190:  ; Local function
        lea     r11, [rel _ZN7Zobrist9enpassantE]       ; 218F _ 4C: 8D. 1D, 000000C0(rel)
        and     r10d, 07H                               ; 2196 _ 41: 83. E2, 07
        mov     r8, qword [r11+r10*8]                   ; 219A _ 4F: 8B. 04 D3
        mov     qword [rdx+28H], 64                     ; 219E _ 48: C7. 42, 28, 00000040
        xor     qword [rdx+30H], r8                     ; 21A6 _ 4C: 31. 42, 30
        jmp     ?_189                                   ; 21AA _ EB, A5

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_ZN8Position14undo_null_moveEv:; Function begin
        mov     rax, qword [rcx+3B8H]                   ; 21B0 _ 48: 8B. 81, 000003B8
        mov     rdx, qword [rax+48H]                    ; 21B7 _ 48: 8B. 50, 48
        xor     dword [rcx+3ACH], 01H                   ; 21BB _ 83. B1, 000003AC, 01
        mov     qword [rcx+3B8H], rdx                   ; 21C2 _ 48: 89. 91, 000003B8
        ret                                             ; 21C9 _ C3
; _ZN8Position14undo_null_moveEv End of function

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZNK8Position13exclusion_keyEv:; Function begin
        mov     rax, qword [rel _ZN7Zobrist9exclusionE] ; 21D0 _ 48: 8B. 05, 00000000(rel)
        mov     rdx, qword [rcx+3B8H]                   ; 21D7 _ 48: 8B. 91, 000003B8
        xor     rax, qword [rdx+30H]                    ; 21DE _ 48: 33. 42, 30
        ret                                             ; 21E2 _ C3
; _ZNK8Position13exclusion_keyEv End of function

        nop                                             ; 21E3 _ 90
        nop                                             ; 21E4 _ 90
        nop                                             ; 21E5 _ 90
        nop                                             ; 21E6 _ 90
        nop                                             ; 21E7 _ 90
        nop                                             ; 21E8 _ 90
        nop                                             ; 21E9 _ 90
        nop                                             ; 21EA _ 90
        nop                                             ; 21EB _ 90
        nop                                             ; 21EC _ 90
        nop                                             ; 21ED _ 90
        nop                                             ; 21EE _ 90
        nop                                             ; 21EF _ 90


SECTION .xdata.hot align=4 noexecute                    ; section number 8, const

        db 01H, 04H, 04H, 00H, 04H, 30H, 03H, 60H       ; 0000 _ .....0.`
        db 02H, 70H, 01H, 50H, 01H, 02H, 02H, 00H       ; 0008 _ .p.P....
        db 02H, 30H, 01H, 60H, 01H, 04H, 01H, 00H       ; 0010 _ .0.`....
        db 04H, 22H, 00H, 00H, 01H, 0FH, 08H, 00H       ; 0018 _ ."......
        db 0FH, 01H, 07H, 01H, 08H, 30H, 07H, 60H       ; 0020 _ .....0.`
        db 06H, 70H, 05H, 50H, 04H, 0C0H, 02H, 0D0H     ; 0028 _ .p.P....
        db 01H, 10H, 09H, 00H, 10H, 22H, 0CH, 30H       ; 0030 _ .....".0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0038 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0040 _ ........
        db 01H, 02H, 02H, 00H, 02H, 30H, 01H, 60H       ; 0048 _ .....0.`
        db 01H, 10H, 09H, 00H, 10H, 0C2H, 0CH, 30H      ; 0050 _ .......0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0058 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0060 _ ........
        db 01H, 09H, 04H, 00H, 09H, 01H, 07H, 01H       ; 0068 _ ........
        db 02H, 30H, 01H, 60H, 01H, 0CH, 08H, 00H       ; 0070 _ .0.`....
        db 0CH, 30H, 0BH, 60H, 0AH, 70H, 09H, 50H       ; 0078 _ .0.`.p.P
        db 08H, 0C0H, 06H, 0D0H, 04H, 0E0H, 02H, 0F0H   ; 0080 _ ........
        db 01H, 05H, 04H, 00H, 05H, 30H, 04H, 60H       ; 0088 _ .....0.`
        db 03H, 70H, 02H, 0E0H, 01H, 06H, 05H, 00H      ; 0090 _ .p......
        db 06H, 30H, 05H, 60H, 04H, 70H, 03H, 50H       ; 0098 _ .0.`.p.P
        db 02H, 0C0H, 00H, 00H, 01H, 13H, 0AH, 00H      ; 00A0 _ ........
        db 13H, 01H, 1BH, 00H, 0CH, 30H, 0BH, 60H       ; 00A8 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 00B0 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 13H, 0AH, 00H     ; 00B8 _ ........
        db 13H, 01H, 1BH, 00H, 0CH, 30H, 0BH, 60H       ; 00C0 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 00C8 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 00H, 00H, 00H     ; 00D0 _ ........
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 00D8 _ ........


SECTION .xdata.unlikely align=4 noexecute               ; section number 10, const

        db 01H, 00H, 00H, 00H, 01H, 01H, 01H, 00H       ; 0000 _ ........
        db 01H, 70H, 00H, 00H                           ; 0008 _ .p..


SECTION .rdata  align=16 noexecute                      ; section number 12, const

?_191:                                                  ; byte
        db 0AH, 20H, 2BH, 2DH, 2DH, 2DH, 2BH, 2DH       ; 0000 _ . +---+-
        db 2DH, 2DH, 2BH, 2DH, 2DH, 2DH, 2BH, 2DH       ; 0008 _ --+---+-
        db 2DH, 2DH, 2BH, 2DH, 2DH, 2DH, 2BH, 2DH       ; 0010 _ --+---+-
        db 2DH, 2DH, 2BH, 2DH, 2DH, 2DH, 2BH, 2DH       ; 0018 _ --+---+-
        db 2DH, 2DH, 2BH, 0AH, 00H                      ; 0020 _ --+..

?_192:                                                  ; byte
        db 20H, 7CH, 20H, 00H, 00H, 00H, 00H, 00H       ; 0025 _  | .....
        db 00H, 00H, 00H                                ; 002D _ ...

?_193:                                                  ; byte
        db 7CH, 0AH, 20H, 2BH, 2DH, 2DH, 2DH, 2BH       ; 0030 _ |. +---+
        db 2DH, 2DH, 2DH, 2BH, 2DH, 2DH, 2DH, 2BH       ; 0038 _ ---+---+
        db 2DH, 2DH, 2DH, 2BH, 2DH, 2DH, 2DH, 2BH       ; 0040 _ ---+---+
        db 2DH, 2DH, 2DH, 2BH, 2DH, 2DH, 2DH, 2BH       ; 0048 _ ---+---+
        db 2DH, 2DH, 2DH, 2BH, 0AH, 00H, 00H, 00H       ; 0050 _ ---+....
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0058 _ ........

_ZN12_GLOBAL__N_1L11PieceToCharE:                       ; byte
        db 20H, 50H, 4EH, 42H, 52H, 51H, 4BH, 20H       ; 0060 _  PNBRQK 
        db 20H, 70H, 6EH, 62H, 72H, 71H, 6BH, 20H       ; 0068 _  pnbrqk 
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0070 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0078 _ ........


SECTION .rdata$zzz align=16 noexecute                   ; section number 13, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr.TT align=16 noexecute            ; section number 14, const
;  Communal section not supported by YASM

.refptr.TT:                                             ; qword
        dq TT                                           ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.LineBB align=16 noexecute        ; section number 15, const
;  Communal section not supported by YASM

.refptr.LineBB:                                         ; qword
        dq LineBB                                       ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.BetweenBB align=16 noexecute     ; section number 16, const
;  Communal section not supported by YASM

.refptr.BetweenBB:                                      ; qword
        dq BetweenBB                                    ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.PseudoAttacks align=16 noexecute ; section number 17, const
;  Communal section not supported by YASM

.refptr.PseudoAttacks:                                  ; qword
        dq PseudoAttacks                                ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.BishopAttacks align=16 noexecute ; section number 18, const
;  Communal section not supported by YASM

.refptr.BishopAttacks:                                  ; qword
        dq BishopAttacks                                ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.RookAttacks align=16 noexecute   ; section number 19, const
;  Communal section not supported by YASM

.refptr.RookAttacks:                                    ; qword
        dq RookAttacks                                  ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.StepAttacksBB align=16 noexecute ; section number 20, const
;  Communal section not supported by YASM

.refptr.StepAttacksBB:                                  ; qword
        dq StepAttacksBB                                ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.BishopMasks align=16 noexecute   ; section number 21, const
;  Communal section not supported by YASM

.refptr.BishopMasks:                                    ; qword
        dq BishopMasks                                  ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.RookMasks align=16 noexecute     ; section number 22, const
;  Communal section not supported by YASM

.refptr.RookMasks:                                      ; qword
        dq RookMasks                                    ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr._ZN4PSQT3psqE align=16 noexecute ; section number 23, const
;  Communal section not supported by YASM

.refptr._ZN4PSQT3psqE:                                  ; qword
        dq _ZN4PSQT3psqE                                ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.SquareBB align=16 noexecute      ; section number 24, const
;  Communal section not supported by YASM

.refptr.SquareBB:                                       ; qword
        dq SquareBB                                     ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


