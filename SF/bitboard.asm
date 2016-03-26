; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\bitboard.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: BMI etc., x64

default rel

global _ZN9Bitboards4initEv: function
global PseudoAttacks
global PawnAttackSpan
global PassedPawnMask
global ForwardBB
global DistanceRingBB
global LineBB
global BetweenBB
global StepAttacksBB
global InFrontBB
global AdjacentFilesBB
global RankBB
global FileBB
global SquareBB
global BishopShifts
global BishopAttacks
global BishopMagics
global BishopMasks
global RookShifts
global RookAttacks
global RookMagics
global RookMasks
global SquareDistance
global _Z10attacks_bb5Piece6Squarey: function


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_ZN9Bitboards4initEv:
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 424                                ; 000C _ 48: 81. EC, 000001A8
        xor     edx, edx                                ; 0013 _ 31. D2
        mov     r8d, 1                                  ; 0015 _ 41: B8, 00000001
        mov     rcx, qword 3F79D71B4CB0A89H             ; 001B _ 48: B9, 03F79D71B4CB0A89
        lea     rbp, [rel SquareBB]                     ; 0025 _ 48: 8D. 2D, 00014D40(rel)
        lea     r9, [rel _ZN12_GLOBAL__N_18BSFTableE]   ; 002C _ 4C: 8D. 0D, 000EC140(rel)
?_001:  shlx    rax, r8, rdx                            ; 0033 _ C4 C2 E9: F7. C0
        blsmsk  rbx, rax                                ; 0038 _ C4 E2 E0: F3. D0
        imul    rbx, rcx                                ; 003D _ 48: 0F AF. D9
        mov     qword [rbp+rdx*8], rax                  ; 0041 _ 48: 89. 44 D5, 00
        shr     rbx, 58                                 ; 0046 _ 48: C1. EB, 3A
        mov     qword [r9+rbx*8], rdx                   ; 004A _ 49: 89. 14 D9
        add     rdx, 1                                  ; 004E _ 48: 83. C2, 01
        cmp     rdx, 64                                 ; 0052 _ 48: 83. FA, 40
        jnz     ?_001                                   ; 0056 _ 75, DB
        lea     rsi, [rel _ZN12_GLOBAL__N_18MSBTableE]  ; 0058 _ 48: 8D. 35, 000EC340(rel)
        mov     eax, 2                                  ; 005F _ B8, 00000002
        lea     rdi, [rel ?_041]                        ; 0064 _ 48: 8D. 3D, 000EC33C(rel)
?_002:  blsr    r10, rax                                ; 006B _ C4 E2 A8: F3. C8
        test    r10, r10                                ; 0070 _ 4D: 85. D2
        sete    r11b                                    ; 0073 _ 41: 0F 94. C3
        movzx   r12d, r11b                              ; 0077 _ 45: 0F B6. E3
        add     r12d, dword [rdi+rax*4]                 ; 007B _ 44: 03. 24 87
        mov     dword [rsi+rax*4], r12d                 ; 007F _ 44: 89. 24 86
        add     rax, 1                                  ; 0083 _ 48: 83. C0, 01
        cmp     rax, 256                                ; 0087 _ 48: 3D, 00000100
        jnz     ?_002                                   ; 008D _ 75, DC
        lea     r9, [rel FileBB]                        ; 008F _ 4C: 8D. 0D, 00014D00(rel)
; Note: Length-changing prefix causes delay on Intel processors
        mov     ax, 1                                   ; 0096 _ 66: B8, 0001
        mov     r8, r9                                  ; 009A _ 4D: 89. C8
        jmp     ?_005                                   ; 009D _ EB, 1A

?_003:  lea     r14d, [rax-2H]                          ; 009F _ 44: 8D. 70, FE
        mov     r15, qword [r9+r14*8]                   ; 00A3 _ 4F: 8B. 3C F1
        add     r15, r15                                ; 00A7 _ 4D: 01. FF
        cmp     eax, 8                                  ; 00AA _ 83. F8, 08
        mov     qword [r8], r15                         ; 00AD _ 4D: 89. 38
        jz      ?_006                                   ; 00B0 _ 74, 1B
?_004:  add     eax, 1                                  ; 00B2 _ 83. C0, 01
        add     r8, 8                                   ; 00B5 _ 49: 83. C0, 08
?_005:  cmp     eax, 1                                  ; 00B9 _ 83. F8, 01
        jnz     ?_003                                   ; 00BC _ 75, E1
        mov     r13, qword 101010101010101H             ; 00BE _ 49: BD, 0101010101010101
        mov     qword [r8], r13                         ; 00C8 _ 4D: 89. 28
        jmp     ?_004                                   ; 00CB _ EB, E5

?_006:  ; Local function
        lea     rcx, [rel RankBB]                       ; 00CD _ 48: 8D. 0D, 00014CC0(rel)
        mov     al, 1                                   ; 00D4 _ B0, 01
        mov     rdx, rcx                                ; 00D6 _ 48: 89. CA
        jmp     ?_009                                   ; 00D9 _ EB, 1B

?_007:  lea     r8d, [rax-2H]                           ; 00DB _ 44: 8D. 40, FE
        mov     rbx, qword [rcx+r8*8]                   ; 00DF _ 4A: 8B. 1C C1
        shl     rbx, 8                                  ; 00E3 _ 48: C1. E3, 08
        cmp     eax, 8                                  ; 00E7 _ 83. F8, 08
        mov     qword [rdx], rbx                        ; 00EA _ 48: 89. 1A
        jz      ?_010                                   ; 00ED _ 74, 15
?_008:  add     eax, 1                                  ; 00EF _ 83. C0, 01
        add     rdx, 8                                  ; 00F2 _ 48: 83. C2, 08
?_009:  cmp     eax, 1                                  ; 00F6 _ 83. F8, 01
        jnz     ?_007                                   ; 00F9 _ 75, E0
        mov     qword [rdx], 255                        ; 00FB _ 48: C7. 02, 000000FF
        jmp     ?_008                                   ; 0102 _ EB, EB

?_010:  ; Local function
        lea     r11, [rel AdjacentFilesBB]              ; 0104 _ 4C: 8D. 1D, 00014C80(rel)
        xor     eax, eax                                ; 010B _ 31. C0
?_011:  test    rax, rax                                ; 010D _ 48: 85. C0
        je      ?_036                                   ; 0110 _ 0F 84, 00000527
        lea     esi, [rax-1H]                           ; 0116 _ 8D. 70, FF
        cmp     eax, 7                                  ; 0119 _ 83. F8, 07
        mov     rdx, qword [r9+rsi*8]                   ; 011C _ 49: 8B. 14 F1
        je      ?_035                                   ; 0120 _ 0F 84, 0000050B
?_012:  lea     rdi, [rel ?_040]                        ; 0126 _ 48: 8D. 3D, 00014D08(rel)
        or      rdx, qword [rdi+rax*8]                  ; 012D _ 48: 0B. 14 C7
        mov     qword [r11+rax*8], rdx                  ; 0131 _ 49: 89. 14 C3
        add     rax, 1                                  ; 0135 _ 48: 83. C0, 01
        cmp     rax, 8                                  ; 0139 _ 48: 83. F8, 08
        jnz     ?_011                                   ; 013D _ 75, CE
?_013:  lea     r10, [rel ?_037]                        ; 013F _ 4C: 8D. 15, 00014C40(rel)
        xor     r12d, r12d                              ; 0146 _ 45: 31. E4
        lea     r13, [rel ?_038]                        ; 0149 _ 4C: 8D. 2D, 00014C48(rel)
        lea     rbx, [rel InFrontBB]                    ; 0150 _ 48: 8D. 1D, 00014C00(rel)
?_014:  mov     r14, qword [rcx+r12]                    ; 0157 _ 4E: 8B. 34 21
        or      r14, qword [r10+r12]                    ; 015B _ 4F: 0B. 34 22
        mov     qword [r13+r12], r14                    ; 015F _ 4F: 89. 74 25, 00
        not     r14                                     ; 0164 _ 49: F7. D6
        mov     qword [rbx+r12], r14                    ; 0167 _ 4E: 89. 34 23
        add     r12, 8                                  ; 016B _ 49: 83. C4, 08
        cmp     r12, 56                                 ; 016F _ 49: 83. FC, 38
        jnz     ?_014                                   ; 0173 _ 75, E2
        xor     r13d, r13d                              ; 0175 _ 45: 31. ED
        xor     r14d, r14d                              ; 0178 _ 45: 31. F6
?_015:  lea     rcx, [rel ForwardBB]                    ; 017B _ 48: 8D. 0D, 00001800(rel)
        movsxd  r10, r14d                               ; 0182 _ 4D: 63. D6
        xor     r8d, r8d                                ; 0185 _ 45: 31. C0
        lea     r15, [rel PawnAttackSpan]               ; 0188 _ 4C: 8D. 3D, 00001000(rel)
        shl     r10, 3                                  ; 018F _ 49: C1. E2, 03
        lea     rax, [rel PassedPawnMask]               ; 0193 _ 48: 8D. 05, 00001400(rel)
        lea     r12, [rcx+r13]                          ; 019A _ 4E: 8D. 24 29
        lea     rdi, [r15+r13]                          ; 019E _ 4B: 8D. 3C 2F
        lea     rsi, [rax+r13]                          ; 01A2 _ 4A: 8D. 34 28
?_016:  mov     rdx, r8                                 ; 01A6 _ 4C: 89. C2
        shr     rdx, 3                                  ; 01A9 _ 48: C1. EA, 03
        mov     ecx, edx                                ; 01AD _ 89. D1
        add     rcx, r10                                ; 01AF _ 4C: 01. D1
        mov     rax, qword [rbx+rcx*8]                  ; 01B2 _ 48: 8B. 04 CB
        mov     rcx, r8                                 ; 01B6 _ 4C: 89. C1
        and     ecx, 07H                                ; 01B9 _ 83. E1, 07
        mov     rdx, qword [r9+rcx*8]                   ; 01BC _ 49: 8B. 14 C9
        mov     rcx, qword [r11+rcx*8]                  ; 01C0 _ 49: 8B. 0C CB
        mov     r15, rdx                                ; 01C4 _ 49: 89. D7
        and     r15, rax                                ; 01C7 _ 49: 21. C7
        or      rdx, rcx                                ; 01CA _ 48: 09. CA
        mov     qword [r12+r8*8], r15                   ; 01CD _ 4F: 89. 3C C4
        mov     r15, rcx                                ; 01D1 _ 49: 89. CF
        and     r15, rax                                ; 01D4 _ 49: 21. C7
        and     rax, rdx                                ; 01D7 _ 48: 21. D0
        mov     qword [rdi+r8*8], r15                   ; 01DA _ 4E: 89. 3C C7
        mov     qword [rsi+r8*8], rax                   ; 01DE _ 4A: 89. 04 C6
        add     r8, 1                                   ; 01E2 _ 49: 83. C0, 01
        cmp     r8, 64                                  ; 01E6 _ 49: 83. F8, 40
        jnz     ?_016                                   ; 01EA _ 75, BA
        add     r13, 512                                ; 01EC _ 49: 81. C5, 00000200
        sub     r14d, 1                                 ; 01F3 _ 41: 83. EE, 01
        jne     ?_027                                   ; 01F7 _ 0F 85, 0000020F
        lea     r11, [rel SquareDistance]               ; 01FD _ 4C: 8D. 1D, 00015D40(rel)
        xor     r10d, r10d                              ; 0204 _ 45: 31. D2
?_017:  mov     r9, r10                                 ; 0207 _ 4D: 89. D1
        mov     rbx, r10                                ; 020A _ 4C: 89. D3
        mov     r8d, r10d                               ; 020D _ 45: 89. D0
        shr     r9, 3                                   ; 0210 _ 49: C1. E9, 03
        shl     rbx, 8                                  ; 0214 _ 48: C1. E3, 08
        xor     edi, edi                                ; 0218 _ 31. FF
        mov     r14d, r9d                               ; 021A _ 45: 89. CE
        add     rbx, r11                                ; 021D _ 4C: 01. DB
        and     r8d, 07H                                ; 0220 _ 41: 83. E0, 07
        lea     rsi, [r10*8]                            ; 0224 _ 4A: 8D. 34 D5, 00000000
?_018:  cmp     rdi, r10                                ; 022C _ 4C: 39. D7
        jz      ?_019                                   ; 022F _ 74, 55
        mov     r13, rdi                                ; 0231 _ 49: 89. FD
        mov     eax, r9d                                ; 0234 _ 44: 89. C8
        mov     ecx, edi                                ; 0237 _ 89. F9
        lea     r15, [rel DistanceRingBB]               ; 0239 _ 4C: 8D. 3D, 00001C00(rel)
        shr     r13, 3                                  ; 0240 _ 49: C1. ED, 03
        mov     edx, r8d                                ; 0244 _ 44: 89. C2
        mov     r12d, r13d                              ; 0247 _ 45: 89. EC
        sub     eax, r13d                               ; 024A _ 44: 29. E8
        sub     r12d, r9d                               ; 024D _ 45: 29. CC
        cmp     r14d, r13d                              ; 0250 _ 45: 39. EE
        cmovnc  r12d, eax                               ; 0253 _ 44: 0F 43. E0
        and     ecx, 07H                                ; 0257 _ 83. E1, 07
        mov     eax, ecx                                ; 025A _ 89. C8
        sub     edx, ecx                                ; 025C _ 29. CA
        sub     eax, r8d                                ; 025E _ 44: 29. C0
        cmp     ecx, r8d                                ; 0261 _ 44: 39. C1
        cmovbe  eax, edx                                ; 0264 _ 0F 46. C2
        cmp     eax, r12d                               ; 0267 _ 44: 39. E0
        cmovl   eax, r12d                               ; 026A _ 41: 0F 4C. C4
        mov     dword [rbx+rdi*4], eax                  ; 026E _ 89. 04 BB
        sub     eax, 1                                  ; 0271 _ 83. E8, 01
        cdqe                                            ; 0274 _ 48: 98
        add     rax, rsi                                ; 0276 _ 48: 01. F0
        mov     r13, qword [r15+rax*8]                  ; 0279 _ 4D: 8B. 2C C7
        or      r13, qword [rbp+rdi*8]                  ; 027D _ 4C: 0B. 6C FD, 00
        mov     qword [r15+rax*8], r13                  ; 0282 _ 4D: 89. 2C C7
?_019:  add     rdi, 1                                  ; 0286 _ 48: 83. C7, 01
        cmp     rdi, 64                                 ; 028A _ 48: 83. FF, 40
        jnz     ?_018                                   ; 028E _ 75, 9C
        add     r10, 1                                  ; 0290 _ 49: 83. C2, 01
        cmp     r10, 64                                 ; 0294 _ 49: 83. FA, 40
        jne     ?_017                                   ; 0298 _ 0F 85, FFFFFF69
        lea     r12, [rsp+0A0H]                         ; 029E _ 4C: 8D. A4 24, 000000A0
        mov     ecx, 63                                 ; 02A6 _ B9, 0000003F
        xor     eax, eax                                ; 02AB _ 31. C0
        lea     r13, [rel StepAttacksBB]                ; 02AD _ 4C: 8D. 2D, 00012C00(rel)
        mov     rdi, r12                                ; 02B4 _ 4C: 89. E7
        xor     esi, esi                                ; 02B7 _ 31. F6
        rep stosd                                       ; 02B9 _ F3: AB
        mov     dword [rsp+0C4H], 7                     ; 02BB _ C7. 84 24, 000000C4, 00000007
        mov     dword [rsp+0C8H], 9                     ; 02C6 _ C7. 84 24, 000000C8, 00000009
        mov     dword [rsp+0E8H], 17                    ; 02D1 _ C7. 84 24, 000000E8, 00000011
        mov     dword [rsp+0ECH], 15                    ; 02DC _ C7. 84 24, 000000EC, 0000000F
        mov     dword [rsp+0F0H], 10                    ; 02E7 _ C7. 84 24, 000000F0, 0000000A
        mov     dword [rsp+0F4H], 6                     ; 02F2 _ C7. 84 24, 000000F4, 00000006
        mov     dword [rsp+0F8H], -6                    ; 02FD _ C7. 84 24, 000000F8, FFFFFFFA
        mov     dword [rsp+0FCH], -10                   ; 0308 _ C7. 84 24, 000000FC, FFFFFFF6
        mov     dword [rsp+100H], -15                   ; 0313 _ C7. 84 24, 00000100, FFFFFFF1
        mov     dword [rsp+104H], -17                   ; 031E _ C7. 84 24, 00000104, FFFFFFEF
        mov     dword [rsp+178H], 9                     ; 0329 _ C7. 84 24, 00000178, 00000009
        mov     dword [rsp+17CH], 7                     ; 0334 _ C7. 84 24, 0000017C, 00000007
        mov     dword [rsp+180H], -7                    ; 033F _ C7. 84 24, 00000180, FFFFFFF9
        mov     dword [rsp+184H], -9                    ; 034A _ C7. 84 24, 00000184, FFFFFFF7
        mov     dword [rsp+188H], 8                     ; 0355 _ C7. 84 24, 00000188, 00000008
        mov     dword [rsp+18CH], 1                     ; 0360 _ C7. 84 24, 0000018C, 00000001
        mov     dword [rsp+190H], -1                    ; 036B _ C7. 84 24, 00000190, FFFFFFFF
        mov     dword [rsp+194H], -8                    ; 0376 _ C7. 84 24, 00000194, FFFFFFF8
?_020:  lea     r14d, [rsi*8]                           ; 0381 _ 44: 8D. 34 F5, 00000000
        mov     edi, 1                                  ; 0389 _ BF, 00000001
        lea     r10, [r12+24H]                          ; 038E _ 4D: 8D. 54 24, 24
?_021:  mov     r9d, edi                                ; 0393 _ 41: 89. F9
        xor     ecx, ecx                                ; 0396 _ 31. C9
        or      r9d, r14d                               ; 0398 _ 45: 09. F1
        shl     r9, 9                                   ; 039B _ 49: C1. E1, 09
        add     r9, r13                                 ; 039F _ 4D: 01. E9
?_022:  lea     r8, [rcx*8]                             ; 03A2 _ 4C: 8D. 04 CD, 00000000
        mov     rbx, rcx                                ; 03AA _ 48: 89. CB
        xor     edx, edx                                ; 03AD _ 31. D2
        shl     rbx, 6                                  ; 03AF _ 48: C1. E3, 06
?_023:  movsxd  rax, dword [r10+rdx]                    ; 03B3 _ 49: 63. 04 12
        test    eax, eax                                ; 03B7 _ 85. C0
        jz      ?_026                                   ; 03B9 _ 74, 2C
        test    esi, esi                                ; 03BB _ 85. F6
        jz      ?_024                                   ; 03BD _ 74, 04
        neg     eax                                     ; 03BF _ F7. D8
        cdqe                                            ; 03C1 _ 48: 98
?_024:  add     eax, ecx                                ; 03C3 _ 01. C8
        cdqe                                            ; 03C5 _ 48: 98
        cmp     rax, 63                                 ; 03C7 _ 48: 83. F8, 3F
        ja      ?_025                                   ; 03CB _ 77, 14
        lea     r15, [rbx+rax]                          ; 03CD _ 4C: 8D. 3C 03
        cmp     dword [r11+r15*4], 2                    ; 03D1 _ 43: 83. 3C BB, 02
        jg      ?_025                                   ; 03D6 _ 7F, 09
        mov     rax, qword [rbp+rax*8]                  ; 03D8 _ 48: 8B. 44 C5, 00
        or      qword [r9+r8], rax                      ; 03DD _ 4B: 09. 04 01
?_025:  add     rdx, 4                                  ; 03E1 _ 48: 83. C2, 04
        jmp     ?_023                                   ; 03E5 _ EB, CC

?_026:  add     rcx, 1                                  ; 03E7 _ 48: 83. C1, 01
        cmp     rcx, 64                                 ; 03EB _ 48: 83. F9, 40
        jnz     ?_022                                   ; 03EF _ 75, B1
        add     edi, 1                                  ; 03F1 _ 83. C7, 01
        add     r10, 36                                 ; 03F4 _ 49: 83. C2, 24
        cmp     edi, 7                                  ; 03F8 _ 83. FF, 07
        jnz     ?_021                                   ; 03FB _ 75, 96
        sub     esi, 1                                  ; 03FD _ 83. EE, 01
        jz      ?_028                                   ; 0400 _ 74, 15
        mov     esi, 1                                  ; 0402 _ BE, 00000001
        jmp     ?_020                                   ; 0407 _ E9, FFFFFF75

?_027:  mov     r14d, 1                                 ; 040C _ 41: BE, 00000001
        jmp     ?_015                                   ; 0412 _ E9, FFFFFD64

?_028:  movdqa  xmm0, oword [rel ?_054]                 ; 0417 _ 66: 0F 6F. 05, 00000000(rel)
        lea     r11, [rsp+60H]                          ; 041F _ 4C: 8D. 5C 24, 60
        xor     r15d, r15d                              ; 0424 _ 45: 31. FF
        movdqa  xmm1, oword [rel ?_055]                 ; 0427 _ 66: 0F 6F. 0D, 00000010(rel)
        mov     qword [rsp+20H], r11                    ; 042F _ 4C: 89. 5C 24, 20
        lea     r9, [rel RookShifts]                    ; 0434 _ 4C: 8D. 0D, 00015640(rel)
        movdqa  xmm2, oword [rel ?_056]                 ; 043B _ 66: 0F 6F. 15, 00000020(rel)
        lea     r8, [rel RookMasks]                     ; 0443 _ 4C: 8D. 05, 00015B40(rel)
        movaps  oword [rsp+60H], xmm0                   ; 044A _ 0F 29. 44 24, 60
        movdqa  xmm3, oword [rel ?_057]                 ; 044F _ 66: 0F 6F. 1D, 00000030(rel)
        lea     rdx, [rel RookAttacks]                  ; 0457 _ 48: 8D. 15, 00015740(rel)
        movaps  oword [rsp+70H], xmm1                   ; 045E _ 0F 29. 4C 24, 70
        lea     rcx, [rel _ZN12_GLOBAL__N_19RookTableE] ; 0463 _ 48: 8D. 0D, 00024140(rel)
        movaps  oword [rsp+80H], xmm2                   ; 046A _ 0F 29. 94 24, 00000080
        lea     rsi, [rsp+80H]                          ; 0472 _ 48: 8D. B4 24, 00000080
        movaps  oword [rsp+90H], xmm3                   ; 047A _ 0F 29. 9C 24, 00000090
        call    _ZN12_GLOBAL__N_111init_magicsEPyPS0_S0_S0_PjP6SquarePFjS3_yE.isra.0; 0482 _ E8, 00000000(rel)
        lea     r12, [rel PseudoAttacks]                ; 0487 _ 4C: 8D. 25, 00000000(rel)
        mov     qword [rsp+20H], rsi                    ; 048E _ 48: 89. 74 24, 20
        lea     r9, [rel BishopShifts]                  ; 0493 _ 4C: 8D. 0D, 00014F40(rel)
        lea     r8, [rel BishopMasks]                   ; 049A _ 4C: 8D. 05, 00015440(rel)
        lea     rdx, [rel BishopAttacks]                ; 04A1 _ 48: 8D. 15, 00015040(rel)
        lea     rcx, [rel _ZN12_GLOBAL__N_111BishopTableE]; 04A8 _ 48: 8D. 0D, 00019D40(rel)
        call    _ZN12_GLOBAL__N_111init_magicsEPyPS0_S0_S0_PjP6SquarePFjS3_yE.isra.0; 04AF _ E8, 00000000(rel)
        mov     qword [rsp+58H], r12                    ; 04B4 _ 4C: 89. 64 24, 58
?_029:  lea     rcx, [rel BishopAttacks]                ; 04B9 _ 48: 8D. 0D, 00015040(rel)
        xor     r10d, r10d                              ; 04C0 _ 45: 31. D2
        mov     r11, qword [rsp+58H]                    ; 04C3 _ 4C: 8B. 5C 24, 58
        xor     ebx, ebx                                ; 04C8 _ 31. DB
        mov     r8, qword [rcx+r15*8]                   ; 04CA _ 4E: 8B. 04 F9
        lea     r13, [r15*8]                            ; 04CE _ 4E: 8D. 2C FD, 00000000
        lea     r14, [rel BishopMasks]                  ; 04D6 _ 4C: 8D. 35, 00015440(rel)
        mov     qword [rsp+38H], r13                    ; 04DD _ 4C: 89. 6C 24, 38
        pext    rdi, r10, qword [r14+r15*8]             ; 04E2 _ C4 82 AA: F5. 3C FE
        lea     r13, [rel RookAttacks]                  ; 04E8 _ 4C: 8D. 2D, 00015740(rel)
        mov     r9d, edi                                ; 04EF _ 41: 89. F9
        mov     rdi, r15                                ; 04F2 _ 4C: 89. FF
        mov     r14, qword [r13+r15*8]                  ; 04F5 _ 4F: 8B. 74 FD, 00
        lea     rdx, [rel RookMasks]                    ; 04FA _ 48: 8D. 15, 00015B40(rel)
        shl     rdi, 9                                  ; 0501 _ 48: C1. E7, 09
        mov     qword [rsp+50H], r11                    ; 0505 _ 4C: 89. 5C 24, 50
        mov     rax, qword [r8+r9*8]                    ; 050A _ 4B: 8B. 04 C8
        pext    rsi, rbx, qword [rdx+r15*8]             ; 050E _ C4 A2 E2: F5. 34 FA
        mov     r12d, esi                               ; 0514 _ 41: 89. F4
        lea     r9, [rel LineBB]                        ; 0517 _ 4C: 8D. 0D, 00002C00(rel)
        lea     rcx, [rel BetweenBB]                    ; 051E _ 48: 8D. 0D, 0000AC00(rel)
        add     r9, rdi                                 ; 0525 _ 49: 01. F9
        add     rcx, rdi                                ; 0528 _ 48: 01. F9
        mov     qword [rsp+48H], r9                     ; 052B _ 4C: 89. 4C 24, 48
        mov     edi, 3                                  ; 0530 _ BF, 00000003
        mov     qword [r11+0A00H], rax                  ; 0535 _ 49: 89. 83, 00000A00
        mov     qword [r11+600H], rax                   ; 053C _ 49: 89. 83, 00000600
        mov     r10, qword [r14+r12*8]                  ; 0543 _ 4F: 8B. 14 E6
        mov     qword [rsp+40H], rcx                    ; 0547 _ 48: 89. 4C 24, 40
        or      rax, r10                                ; 054C _ 4C: 09. D0
        mov     qword [r11+800H], r10                   ; 054F _ 4D: 89. 93, 00000800
        mov     qword [r11+0A00H], rax                  ; 0556 _ 49: 89. 83, 00000A00
?_030:  mov     r8, qword [rsp+50H]                     ; 055D _ 4C: 8B. 44 24, 50
        xor     ebx, ebx                                ; 0562 _ 31. DB
        mov     r12, qword [r8+600H]                    ; 0564 _ 4D: 8B. A0, 00000600
        jmp     ?_032                                   ; 056B _ EB, 0A

?_031:  add     rbx, 1                                  ; 056D _ 48: 83. C3, 01
        cmp     rbx, 64                                 ; 0571 _ 48: 83. FB, 40
        jz      ?_033                                   ; 0575 _ 74, 7A
?_032:  mov     r14, qword [rbp+rbx*8]                  ; 0577 _ 4C: 8B. 74 DD, 00
        test    r14, r12                                ; 057C _ 4D: 85. E6
        jz      ?_031                                   ; 057F _ 74, EC
        xor     r8d, r8d                                ; 0581 _ 45: 31. C0
        mov     rdx, r15                                ; 0584 _ 4C: 89. FA
        mov     ecx, edi                                ; 0587 _ 89. F9
        call    _Z10attacks_bb5Piece6Squarey            ; 0589 _ E8, 00000000(rel)
        xor     r8d, r8d                                ; 058E _ 45: 31. C0
        mov     rdx, rbx                                ; 0591 _ 48: 89. DA
        mov     ecx, edi                                ; 0594 _ 89. F9
        mov     rsi, rax                                ; 0596 _ 48: 89. C6
        call    _Z10attacks_bb5Piece6Squarey            ; 0599 _ E8, 00000000(rel)
        mov     rdx, qword [rsp+38H]                    ; 059E _ 48: 8B. 54 24, 38
        mov     r10, r14                                ; 05A3 _ 4D: 89. F2
        mov     r8, r14                                 ; 05A6 _ 4D: 89. F0
        lea     r11, [rel SquareBB]                     ; 05A9 _ 4C: 8D. 1D, 00014D40(rel)
        and     rsi, rax                                ; 05B0 _ 48: 21. C6
        mov     rax, qword [rsp+48H]                    ; 05B3 _ 48: 8B. 44 24, 48
        mov     ecx, edi                                ; 05B8 _ 89. F9
        mov     r13, qword [r11+rdx]                    ; 05BA _ 4D: 8B. 2C 13
        mov     rdx, r15                                ; 05BE _ 4C: 89. FA
        or      r10, r13                                ; 05C1 _ 4D: 09. EA
        or      rsi, r10                                ; 05C4 _ 4C: 09. D6
        mov     qword [rax+rbx*8], rsi                  ; 05C7 _ 48: 89. 34 D8
        call    _Z10attacks_bb5Piece6Squarey            ; 05CB _ E8, 00000000(rel)
        mov     r8, r13                                 ; 05D0 _ 4D: 89. E8
        mov     rdx, rbx                                ; 05D3 _ 48: 89. DA
        mov     ecx, edi                                ; 05D6 _ 89. F9
        mov     r14, rax                                ; 05D8 _ 49: 89. C6
        call    _Z10attacks_bb5Piece6Squarey            ; 05DB _ E8, 00000000(rel)
        mov     r9, qword [rsp+40H]                     ; 05E0 _ 4C: 8B. 4C 24, 40
        and     r14, rax                                ; 05E5 _ 49: 21. C6
        mov     qword [r9+rbx*8], r14                   ; 05E8 _ 4D: 89. 34 D9
        jmp     ?_031                                   ; 05EC _ E9, FFFFFF7C

?_033:  add     qword [rsp+50H], 512                    ; 05F1 _ 48: 81. 44 24, 50, 00000200
        cmp     edi, 4                                  ; 05FA _ 83. FF, 04
        jz      ?_034                                   ; 05FD _ 74, 0A
        mov     edi, 4                                  ; 05FF _ BF, 00000004
        jmp     ?_030                                   ; 0604 _ E9, FFFFFF54

?_034:  add     qword [rsp+58H], 8                      ; 0609 _ 48: 83. 44 24, 58, 08
        add     r15, 1                                  ; 060F _ 49: 83. C7, 01
        cmp     r15, 64                                 ; 0613 _ 49: 83. FF, 40
        jne     ?_029                                   ; 0617 _ 0F 85, FFFFFE9C
        add     rsp, 424                                ; 061D _ 48: 81. C4, 000001A8
        pop     rbx                                     ; 0624 _ 5B
        pop     rsi                                     ; 0625 _ 5E
        pop     rdi                                     ; 0626 _ 5F
        pop     rbp                                     ; 0627 _ 5D
        pop     r12                                     ; 0628 _ 41: 5C
        pop     r13                                     ; 062A _ 41: 5D
        pop     r14                                     ; 062C _ 41: 5E
        pop     r15                                     ; 062E _ 41: 5F
        ret                                             ; 0630 _ C3

?_035:  mov     qword [rel ?_039], rdx                  ; 0631 _ 48: 89. 15, 00014CB8(rel)
        jmp     ?_013                                   ; 0638 _ E9, FFFFFB02

?_036:  ; Local function
        xor     edx, edx                                ; 063D _ 31. D2
        jmp     ?_012                                   ; 063F _ E9, FFFFFAE2

        nop                                             ; 0644 _ 90
        nop                                             ; 0645 _ 90
        nop                                             ; 0646 _ 90
        nop                                             ; 0647 _ 90
        nop                                             ; 0648 _ 90
        nop                                             ; 0649 _ 90
        nop                                             ; 064A _ 90
        nop                                             ; 064B _ 90
        nop                                             ; 064C _ 90
        nop                                             ; 064D _ 90
        nop                                             ; 064E _ 90
        nop                                             ; 064F _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=64 noexecute                      ; section number 3, bss

PseudoAttacks:                                          ; byte
        resb    4096                                    ; 00000000

PawnAttackSpan:                                         ; byte
        resb    1024                                    ; 00001000

PassedPawnMask:                                         ; byte
        resb    1024                                    ; 00001400

ForwardBB:                                              ; byte
        resb    1024                                    ; 00001800

DistanceRingBB:                                         ; byte
        resb    4096                                    ; 00001C00

LineBB:                                                 ; byte
        resb    32768                                   ; 00002C00

BetweenBB:                                              ; byte
        resb    32768                                   ; 0000AC00

StepAttacksBB:                                          ; byte
        resb    8192                                    ; 00012C00

InFrontBB:                                              ; byte
        resb    64                                      ; 00014C00

?_037:                                                  ; byte
        resb    8                                       ; 00014C40

?_038:                                                  ; byte
        resb    56                                      ; 00014C48

AdjacentFilesBB:                                        ; byte
        resb    56                                      ; 00014C80

?_039:  resq    1                                       ; 00014CB8

RankBB:                                                 ; byte
        resb    64                                      ; 00014CC0

FileBB:                                                 ; byte
        resb    8                                       ; 00014D00

?_040:                                                  ; byte
        resb    56                                      ; 00014D08

SquareBB:                                               ; byte
        resb    512                                     ; 00014D40

BishopShifts:                                           ; byte
        resb    256                                     ; 00014F40

BishopAttacks:                                          ; byte
        resb    512                                     ; 00015040

BishopMagics:                                           ; byte
        resb    512                                     ; 00015240

BishopMasks:                                            ; byte
        resb    512                                     ; 00015440

RookShifts:                                             ; byte
        resb    256                                     ; 00015640

RookAttacks:                                            ; byte
        resb    512                                     ; 00015740

RookMagics:                                             ; byte
        resb    512                                     ; 00015940

RookMasks:                                              ; byte
        resb    512                                     ; 00015B40

SquareDistance:                                         ; byte
        resb    16384                                   ; 00015D40

_ZN12_GLOBAL__N_111BishopTableE:                        ; byte
        resb    41984                                   ; 00019D40

_ZN12_GLOBAL__N_19RookTableE:                           ; byte
        resb    819200                                  ; 00024140

_ZN12_GLOBAL__N_18BSFTableE:                            ; byte
        resb    508                                     ; 000EC140

?_041:                                                  ; byte
        resb    4                                       ; 000EC33C

_ZN12_GLOBAL__N_18MSBTableE:                            ; byte
        resb    1024                                    ; 000EC340


SECTION .text.unlikely align=16 execute                 ; section number 4, code


SECTION .xdata  align=4 noexecute                       ; section number 5, const

        db 01H, 13H, 0AH, 00H, 13H, 01H, 35H, 00H       ; 0000 _ ......5.
        db 0CH, 30H, 0BH, 60H, 0AH, 70H, 09H, 50H       ; 0008 _ .0.`.p.P
        db 08H, 0C0H, 06H, 0D0H, 04H, 0E0H, 02H, 0F0H   ; 0010 _ ........


SECTION .text.hot align=16 execute                      ; section number 7, code

.text.hot:; Local function
_ZN12_GLOBAL__N_111init_magicsEPyPS0_S0_S0_PjP6SquarePFjS3_yE.isra.0:
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 24                                 ; 000C _ 48: 83. EC, 18
        xor     r15d, r15d                              ; 0010 _ 45: 31. FF
        mov     qword [rsp+68H], rdx                    ; 0013 _ 48: 89. 54 24, 68
        mov     qword [rdx], rcx                        ; 0018 _ 48: 89. 0A
        mov     rdx, qword [rsp+80H]                    ; 001B _ 48: 8B. 94 24, 00000080
        mov     qword [rsp+70H], r8                     ; 0023 _ 4C: 89. 44 24, 70
        mov     qword [rsp+78H], r9                     ; 0028 _ 4C: 89. 4C 24, 78
        lea     r12, [rdx+20H]                          ; 002D _ 4C: 8D. 62, 20
?_042:  mov     rbx, r15                                ; 0031 _ 4C: 89. FB
        mov     rdi, r15                                ; 0034 _ 4C: 89. FF
        xor     r13d, r13d                              ; 0037 _ 45: 31. ED
        and     ebx, 07H                                ; 003A _ 83. E3, 07
        shr     rdi, 3                                  ; 003D _ 48: C1. EF, 03
        xor     r14d, r14d                              ; 0041 _ 45: 31. F6
        lea     rcx, [rel FileBB]                       ; 0044 _ 48: 8D. 0D, 00014D00(rel)
        mov     ebp, edi                                ; 004B _ 89. FD
        mov     r9, qword [rcx+rbx*8]                   ; 004D _ 4C: 8B. 0C D9
        lea     r8, [rel RankBB]                        ; 0051 _ 4C: 8D. 05, 00014CC0(rel)
        mov     r10, qword [r8+rbp*8]                   ; 0058 _ 4D: 8B. 14 E8
        andn    rsi, r9, qword [rel ?_058]              ; 005C _ C4 E2 B0: F2. 35, 00000040(rel)
        mov     r9, qword [rsp+80H]                     ; 0065 _ 4C: 8B. 8C 24, 00000080
        andn    r11, r10, qword [rel ?_059]             ; 006D _ C4 62 A8: F2. 1D, 00000048(rel)
        or      rsi, r11                                ; 0076 _ 4C: 09. DE
?_043:  mov     rax, qword [r9+r13]                     ; 0079 _ 4B: 8B. 04 29
        mov     ebp, r15d                               ; 007D _ 44: 89. FD
        mov     edi, eax                                ; 0080 _ 89. C7
        add     eax, r15d                               ; 0082 _ 44: 01. F8
        cdqe                                            ; 0085 _ 48: 98
?_044:  cmp     rax, 63                                 ; 0087 _ 48: 83. F8, 3F
        ja      ?_045                                   ; 008B _ 77, 31
        lea     r10, [rel SquareDistance]               ; 008D _ 4C: 8D. 15, 00015D40(rel)
        mov     edx, eax                                ; 0094 _ 89. C2
        mov     rbx, rax                                ; 0096 _ 48: 89. C3
        sub     edx, edi                                ; 0099 _ 29. FA
        shl     rbx, 6                                  ; 009B _ 48: C1. E3, 06
        movsxd  r8, edx                                 ; 009F _ 4C: 63. C2
        add     r8, rbx                                 ; 00A2 _ 49: 01. D8
        cmp     dword [r10+r8*4], 1                     ; 00A5 _ 43: 83. 3C 82, 01
        jnz     ?_045                                   ; 00AA _ 75, 12
        lea     rbx, [rel SquareBB]                     ; 00AC _ 48: 8D. 1D, 00014D40(rel)
        or      r14, qword [rbx+rax*8]                  ; 00B3 _ 4C: 0B. 34 C3
        lea     eax, [rdi+rax]                          ; 00B7 _ 8D. 04 07
        cdqe                                            ; 00BA _ 48: 98
        jmp     ?_044                                   ; 00BC _ EB, C9

?_045:  ; Local function
        add     r13, 8                                  ; 00BE _ 49: 83. C5, 08
        cmp     r13, 32                                 ; 00C2 _ 49: 83. FD, 20
        jnz     ?_043                                   ; 00C6 _ 75, B1
        mov     r9, qword [rsp+68H]                     ; 00C8 _ 4C: 8B. 4C 24, 68
        andn    rdi, rsi, r14                           ; 00CD _ C4 C2 C8: F2. FE
        xor     r10d, r10d                              ; 00D2 _ 45: 31. D2
        movsxd  r13, ebp                                ; 00D5 _ 4C: 63. ED
        mov     r14, qword [rsp+78H]                    ; 00D8 _ 4C: 8B. 74 24, 78
        mov     r11d, 64                                ; 00DD _ 41: BB, 00000040
        popcnt  rsi, rdi                                ; 00E3 _ F3 48: 0F B8. F7
        mov     rax, qword [rsp+70H]                    ; 00E8 _ 48: 8B. 44 24, 70
        sub     r11d, esi                               ; 00ED _ 41: 29. F3
        mov     rcx, qword [r9+r15*8]                   ; 00F0 _ 4B: 8B. 0C F9
        mov     qword [rax+r15*8], rdi                  ; 00F4 _ 4A: 89. 3C F8
        mov     dword [r14+r15*4], r11d                 ; 00F8 _ 47: 89. 1C BE
        xor     r14d, r14d                              ; 00FC _ 45: 31. F6
        mov     qword [rsp+8H], rcx                     ; 00FF _ 48: 89. 4C 24, 08
?_046:  mov     r8, qword [rsp+80H]                     ; 0104 _ 4C: 8B. 84 24, 00000080
        xor     r9d, r9d                                ; 010C _ 45: 31. C9
?_047:  mov     rax, qword [r8]                         ; 010F _ 49: 8B. 00
        mov     ebx, eax                                ; 0112 _ 89. C3
        add     eax, ebp                                ; 0114 _ 01. E8
        cdqe                                            ; 0116 _ 48: 98
        cmp     rax, 63                                 ; 0118 _ 48: 83. F8, 3F
        ja      ?_049                                   ; 011C _ 77, 47
        lea     rcx, [rel SquareDistance]               ; 011E _ 48: 8D. 0D, 00015D40(rel)
        mov     rdx, rax                                ; 0125 _ 48: 89. C2
        shl     rdx, 6                                  ; 0128 _ 48: C1. E2, 06
        add     rdx, r13                                ; 012C _ 4C: 01. EA
        cmp     dword [rcx+rdx*4], 1                    ; 012F _ 83. 3C 91, 01
        jnz     ?_049                                   ; 0133 _ 75, 30
        lea     r11, [rel SquareBB]                     ; 0135 _ 4C: 8D. 1D, 00014D40(rel)
?_048:  mov     rsi, qword [r11+rax*8]                  ; 013C _ 49: 8B. 34 C3
        or      r9, rsi                                 ; 0140 _ 49: 09. F1
        test    rsi, r10                                ; 0143 _ 4C: 85. D6
        jnz     ?_049                                   ; 0146 _ 75, 1D
        movsxd  rdx, eax                                ; 0148 _ 48: 63. D0
        add     eax, ebx                                ; 014B _ 01. D8
        cdqe                                            ; 014D _ 48: 98
        cmp     rax, 63                                 ; 014F _ 48: 83. F8, 3F
        ja      ?_049                                   ; 0153 _ 77, 10
        mov     rsi, rax                                ; 0155 _ 48: 89. C6
        shl     rsi, 6                                  ; 0158 _ 48: C1. E6, 06
        add     rdx, rsi                                ; 015C _ 48: 01. F2
        cmp     dword [rcx+rdx*4], 1                    ; 015F _ 83. 3C 91, 01
        jz      ?_048                                   ; 0163 _ 74, D7
?_049:  add     r8, 8                                   ; 0165 _ 49: 83. C0, 08
        cmp     r8, r12                                 ; 0169 _ 4D: 39. E0
        jnz     ?_047                                   ; 016C _ 75, A1
        mov     r8, qword [rsp+8H]                      ; 016E _ 4C: 8B. 44 24, 08
        pext    rdi, r10, rdi                           ; 0173 _ C4 E2 AA: F5. FF
        add     r14d, 1                                 ; 0178 _ 41: 83. C6, 01
        mov     qword [r8+rdi*8], r9                    ; 017C _ 4D: 89. 0C F8
        mov     r9, qword [rsp+70H]                     ; 0180 _ 4C: 8B. 4C 24, 70
        mov     rdi, qword [r9+r15*8]                   ; 0185 _ 4B: 8B. 3C F9
        sub     r10, rdi                                ; 0189 _ 49: 29. FA
        and     r10, rdi                                ; 018C _ 49: 21. FA
        jne     ?_046                                   ; 018F _ 0F 85, FFFFFF6F
        cmp     r15, 63                                 ; 0195 _ 49: 83. FF, 3F
        jz      ?_050                                   ; 0199 _ 74, 1F
        movsxd  rbp, r14d                               ; 019B _ 49: 63. EE
        mov     r14, qword [rsp+8H]                     ; 019E _ 4C: 8B. 74 24, 08
        mov     r13, qword [rsp+68H]                    ; 01A3 _ 4C: 8B. 6C 24, 68
        lea     r10, [r14+rbp*8]                        ; 01A8 _ 4D: 8D. 14 EE
        mov     qword [r13+r15*8+8H], r10               ; 01AC _ 4F: 89. 54 FD, 08
        add     r15, 1                                  ; 01B1 _ 49: 83. C7, 01
        jmp     ?_042                                   ; 01B5 _ E9, FFFFFE77

?_050:  ; Local function
        add     rsp, 24                                 ; 01BA _ 48: 83. C4, 18
        pop     rbx                                     ; 01BE _ 5B
        pop     rsi                                     ; 01BF _ 5E
        pop     rdi                                     ; 01C0 _ 5F
        pop     rbp                                     ; 01C1 _ 5D
        pop     r12                                     ; 01C2 _ 41: 5C
        pop     r13                                     ; 01C4 _ 41: 5D
        pop     r14                                     ; 01C6 _ 41: 5E
        pop     r15                                     ; 01C8 _ 41: 5F
        ret                                             ; 01CA _ C3

        nop                                             ; 01CB _ 90
        nop                                             ; 01CC _ 90
        nop                                             ; 01CD _ 90
        nop                                             ; 01CE _ 90
        nop                                             ; 01CF _ 90


SECTION .xdata.hot align=4 noexecute                    ; section number 8, const

        db 01H, 10H, 09H, 00H, 10H, 22H, 0CH, 30H       ; 0000 _ .....".0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .text$_Z10attacks_bb5Piece6Squarey align=16 execute ; section number 10, code
;  Communal section not supported by YASM

_Z10attacks_bb5Piece6Squarey:; Function begin
        mov     eax, ecx                                ; 0000 _ 89. C8
        and     eax, 07H                                ; 0002 _ 83. E0, 07
        cmp     eax, 4                                  ; 0005 _ 83. F8, 04
        jnz     ?_051                                   ; 0008 _ 75, 20
        lea     rax, [rel RookAttacks]                  ; 000A _ 48: 8D. 05, 00015740(rel)
        mov     rcx, qword [rax+rdx*8]                  ; 0011 _ 48: 8B. 0C D0
        lea     r11, [rel RookMasks]                    ; 0015 _ 4C: 8D. 1D, 00015B40(rel)
        pext    r8, r8, qword [r11+rdx*8]               ; 001C _ C4 42 BA: F5. 04 D3
        mov     r10d, r8d                               ; 0022 _ 45: 89. C2
        mov     rax, qword [rcx+r10*8]                  ; 0025 _ 4A: 8B. 04 D1
        ret                                             ; 0029 _ C3
; _Z10attacks_bb5Piece6Squarey End of function

?_051:  ; Local function
        cmp     eax, 5                                  ; 002A _ 83. F8, 05
        jz      ?_052                                   ; 002D _ 74, 25
        cmp     eax, 3                                  ; 002F _ 83. F8, 03
        jnz     ?_053                                   ; 0032 _ 75, 5F
        lea     r9, [rel BishopMasks]                   ; 0034 _ 4C: 8D. 0D, 00015440(rel)
        lea     rax, [rel BishopAttacks]                ; 003B _ 48: 8D. 05, 00015040(rel)
        pext    r10, r8, qword [r9+rdx*8]               ; 0042 _ C4 42 BA: F5. 14 D1
        mov     r11d, r10d                              ; 0048 _ 45: 89. D3
        mov     rdx, qword [rax+rdx*8]                  ; 004B _ 48: 8B. 14 D0
        mov     rax, qword [rdx+r11*8]                  ; 004F _ 4A: 8B. 04 DA
        ret                                             ; 0053 _ C3

?_052:  lea     rcx, [rel BishopMasks]                  ; 0054 _ 48: 8D. 0D, 00015440(rel)
        pext    r9, r8, qword [rcx+rdx*8]               ; 005B _ C4 62 BA: F5. 0C D1
        lea     r10, [rel RookMasks]                    ; 0061 _ 4C: 8D. 15, 00015B40(rel)
        mov     ecx, r9d                                ; 0068 _ 44: 89. C9
        lea     rax, [rel RookAttacks]                  ; 006B _ 48: 8D. 05, 00015740(rel)
        pext    r8, r8, qword [r10+rdx*8]               ; 0072 _ C4 42 BA: F5. 04 D2
        mov     r11d, r8d                               ; 0078 _ 45: 89. C3
        lea     r9, [rel BishopAttacks]                 ; 007B _ 4C: 8D. 0D, 00015040(rel)
        mov     r10, qword [rax+rdx*8]                  ; 0082 _ 4C: 8B. 14 D0
        mov     rdx, qword [r9+rdx*8]                   ; 0086 _ 49: 8B. 14 D1
        mov     rax, qword [r10+r11*8]                  ; 008A _ 4B: 8B. 04 DA
        or      rax, qword [rdx+rcx*8]                  ; 008E _ 48: 0B. 04 CA
        ret                                             ; 0092 _ C3

?_053:  ; Local function
        lea     r8, [rel StepAttacksBB]                 ; 0093 _ 4C: 8D. 05, 00012C00(rel)
        mov     ecx, ecx                                ; 009A _ 89. C9
        shl     rcx, 6                                  ; 009C _ 48: C1. E1, 06
        add     rdx, rcx                                ; 00A0 _ 48: 01. CA
        mov     rax, qword [r8+rdx*8]                   ; 00A3 _ 49: 8B. 04 D0
        ret                                             ; 00A7 _ C3

        nop                                             ; 00A8 _ 90
        nop                                             ; 00A9 _ 90
        nop                                             ; 00AA _ 90
        nop                                             ; 00AB _ 90
        nop                                             ; 00AC _ 90
        nop                                             ; 00AD _ 90
        nop                                             ; 00AE _ 90
        nop                                             ; 00AF _ 90


SECTION .xdata$_Z10attacks_bb5Piece6Squarey align=4 noexecute ; section number 11, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .rdata  align=16 noexecute                      ; section number 13, const

ALIGN   16
?_054:                                                  ; oword
        dq 0000000000000008H                            ; 0000 _ 0000000000000008 
        dq 0000000000000001H                            ; 0008 _ 0000000000000001 

?_055:                                                  ; oword
        dq 0FFFFFFFFFFFFFFF8H                           ; 0010 _ FFFFFFFFFFFFFFF8 
        dq 0FFFFFFFFFFFFFFFFH                           ; 0018 _ FFFFFFFFFFFFFFFF 

?_056:                                                  ; oword
        dq 0000000000000009H                            ; 0020 _ 0000000000000009 
        dq 0FFFFFFFFFFFFFFF9H                           ; 0028 _ FFFFFFFFFFFFFFF9 

?_057:                                                  ; oword
        dq 0FFFFFFFFFFFFFFF7H                           ; 0030 _ FFFFFFFFFFFFFFF7 
        dq 0000000000000007H                            ; 0038 _ 0000000000000007 

?_058:  dq 8181818181818181H                            ; 0040 _ 8181818181818181 

?_059:  dq 0FF000000000000FFH                           ; 0048 _ FF000000000000FF 


SECTION .rdata$zzz align=16 noexecute                   ; section number 14, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


