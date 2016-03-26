; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\movegen.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: BMI etc., x64

default rel

global _Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_: function
global _Z8generateIL7GenType2EEP7ExtMoveRK8PositionS2_: function
global _Z8generateIL7GenType3EEP7ExtMoveRK8PositionS2_: function
global _Z8generateIL7GenType4EEP7ExtMoveRK8PositionS2_: function
global _Z8generateIL7GenType0EEP7ExtMoveRK8PositionS2_: function
global _Z8generateIL7GenType1EEP7ExtMoveRK8PositionS2_: function
global _Z10attacks_bb5Piece6Squarey: function
global .refptr.BetweenBB
global .refptr.LineBB
global .refptr.SquareBB
global .refptr.FileBB
global .refptr.PseudoAttacks
global .refptr.RookAttacks
global .refptr.RookMasks
global .refptr.BishopAttacks
global .refptr.BishopMasks
global .refptr.StepAttacksBB

extern LineBB                                           ; byte
extern StepAttacksBB                                    ; byte
extern BishopMasks                                      ; byte
extern BishopAttacks                                    ; byte
extern RookMasks                                        ; byte
extern RookAttacks                                      ; byte
extern PseudoAttacks                                    ; byte
extern FileBB                                           ; byte
extern SquareBB                                         ; byte
extern BetweenBB                                        ; byte
extern _ZNK8Position11gives_checkE4MoveRK9CheckInfo     ; near
extern _ZN9CheckInfoC1ERK8Position                      ; near
extern _ZNK8Position12attackers_toE6Squarey             ; near
extern _ZNK8Position5legalE4Movey                       ; near
extern _ZNK8Position14check_blockersE5ColorS0_          ; near


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function
_ZN12_GLOBAL__N_112generate_allIL5Color1EL7GenType4EEEP7ExtMoveRK8PositionS4_yPK9CheckInfo.isra.59:
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 40                                 ; 000C _ 48: 83. EC, 28
        mov     r11, qword 0FF0000000000H               ; 0010 _ 49: BB, 0000FF0000000000
        mov     rax, qword [rcx+148H]                   ; 001A _ 48: 8B. 81, 00000148
        mov     rbp, qword [rcx+140H]                   ; 0021 _ 48: 8B. A9, 00000140
        mov     rdi, rax                                ; 0028 _ 48: 89. C7
        and     rdi, qword [rcx+108H]                   ; 002B _ 48: 23. B9, 00000108
        mov     rsi, rcx                                ; 0032 _ 48: 89. CE
        mov     rbx, rdx                                ; 0035 _ 48: 89. D3
        mov     rcx, qword [rcx+100H]                   ; 0038 _ 48: 8B. 89, 00000100
        mov     r13, rdi                                ; 003F _ 49: 89. FD
        mov     r12, rdi                                ; 0042 _ 49: 89. FC
        and     r13, 0FFFFFFFFFFFF00FFH                 ; 0045 _ 49: 81. E5, FFFF00FF
        mov     r14, rcx                                ; 004C _ 49: 89. CE
        and     r12d, 0FF00H                            ; 004F _ 41: 81. E4, 0000FF00
        mov     r10, r13                                ; 0056 _ 4D: 89. EA
        not     r14                                     ; 0059 _ 49: F7. D6
        shr     r10, 8                                  ; 005C _ 49: C1. EA, 08
        and     r10, r14                                ; 0060 _ 4D: 21. F2
        and     r11, r10                                ; 0063 _ 4D: 21. D3
        shr     r11, 8                                  ; 0066 _ 49: C1. EB, 08
        and     r11, r14                                ; 006A _ 4D: 21. F3
        test    r10, r10                                ; 006D _ 4D: 85. D2
        jz      ?_002                                   ; 0070 _ 74, 20
?_001:  bsf     rdx, r10                                ; 0072 _ 49: 0F BC. D2
        lea     r9d, [rdx+8H]                           ; 0076 _ 44: 8D. 4A, 08
        add     rbx, 8                                  ; 007A _ 48: 83. C3, 08
        blsr    r10, r10                                ; 007E _ C4 C2 A8: F3. CA
        shl     r9d, 6                                  ; 0083 _ 41: C1. E1, 06
        or      edx, r9d                                ; 0087 _ 44: 09. CA
        test    r10, r10                                ; 008A _ 4D: 85. D2
        mov     dword [rbx-8H], edx                     ; 008D _ 89. 53, F8
        jnz     ?_001                                   ; 0090 _ 75, E0
?_002:  test    r11, r11                                ; 0092 _ 4D: 85. DB
        jz      ?_004                                   ; 0095 _ 74, 20
?_003:  bsf     r15, r11                                ; 0097 _ 4D: 0F BC. FB
        lea     edx, [r15+10H]                          ; 009B _ 41: 8D. 57, 10
        add     rbx, 8                                  ; 009F _ 48: 83. C3, 08
        blsr    r11, r11                                ; 00A3 _ C4 C2 A0: F3. CB
        shl     edx, 6                                  ; 00A8 _ C1. E2, 06
        or      r15d, edx                               ; 00AB _ 41: 09. D7
        test    r11, r11                                ; 00AE _ 4D: 85. DB
        mov     dword [rbx-8H], r15d                    ; 00B1 _ 44: 89. 7B, F8
        jnz     ?_003                                   ; 00B5 _ 75, E0
?_004:  test    r12, r12                                ; 00B7 _ 4D: 85. E4
        jne     ?_036                                   ; 00BA _ 0F 85, 000002DE
?_005:  mov     rdx, qword 0FEFEFEFEFEFE00FEH           ; 00C0 _ 48: BA, FEFEFEFEFEFE00FE
        mov     r14, qword 7F7F7F7F7F7F007FH            ; 00CA _ 49: BE, 7F7F7F7F7F7F007F
        and     rdx, rdi                                ; 00D4 _ 48: 21. FA
        and     rdi, r14                                ; 00D7 _ 4C: 21. F7
        shr     rdx, 9                                  ; 00DA _ 48: C1. EA, 09
        shr     rdi, 7                                  ; 00DE _ 48: C1. EF, 07
        and     rdx, rbp                                ; 00E2 _ 48: 21. EA
        and     rdi, rbp                                ; 00E5 _ 48: 21. EF
?_006:  test    rdx, rdx                                ; 00E8 _ 48: 85. D2
        jne     ?_042                                   ; 00EB _ 0F 85, 0000039B
?_007:  test    rdi, rdi                                ; 00F1 _ 48: 85. FF
        jne     ?_043                                   ; 00F4 _ 0F 85, 000003B3
        mov     r12, qword [rsi+3B8H]                   ; 00FA _ 4C: 8B. A6, 000003B8
        mov     r9, qword [rel .refptr.StepAttacksBB]   ; 0101 _ 4C: 8B. 0D, 00000000(rel)
        mov     rdx, qword [r12+28H]                    ; 0108 _ 49: 8B. 54 24, 28
        cmp     rdx, 64                                 ; 010D _ 48: 83. FA, 40
        jne     ?_045                                   ; 0111 _ 0F 85, 0000040A
?_008:  mov     r15, rax                                ; 0117 _ 49: 89. C7
        and     r15, qword [rsi+110H]                   ; 011A _ 4C: 23. BE, 00000110
        jne     ?_022                                   ; 0121 _ 0F 85, 0000010C
?_009:  mov     rdx, rax                                ; 0127 _ 48: 89. C2
        and     rdx, qword [rsi+118H]                   ; 012A _ 48: 23. 96, 00000118
        jne     ?_027                                   ; 0131 _ 0F 85, 0000017C
?_010:  mov     r10, rax                                ; 0137 _ 49: 89. C2
        and     r10, qword [rsi+120H]                   ; 013A _ 4C: 23. 96, 00000120
        jz      ?_013                                   ; 0141 _ 74, 39
        mov     r13, qword [rel .refptr.RookMasks]      ; 0143 _ 4C: 8B. 2D, 00000000(rel)
        mov     rdi, qword [rel .refptr.RookAttacks]    ; 014A _ 48: 8B. 3D, 00000000(rel)
?_011:  bsf     r11, r10                                ; 0151 _ 4D: 0F BC. DA
        mov     r14, qword [rdi+r11*8]                  ; 0155 _ 4E: 8B. 34 DF
        pext    rdx, rcx, qword [r13+r11*8]             ; 0159 _ C4 82 F2: F5. 54 DD, 00
        mov     edx, edx                                ; 0160 _ 89. D2
        blsr    r10, r10                                ; 0162 _ C4 C2 A8: F3. CA
        mov     r15, r8                                 ; 0167 _ 4D: 89. C7
        and     r15, qword [r14+rdx*8]                  ; 016A _ 4D: 23. 3C D6
        mov     rdx, r15                                ; 016E _ 4C: 89. FA
        jne     ?_023                                   ; 0171 _ 0F 85, 000000D4
?_012:  test    r10, r10                                ; 0177 _ 4D: 85. D2
        jnz     ?_011                                   ; 017A _ 75, D5
?_013:  mov     rdi, rax                                ; 017C _ 48: 89. C7
        and     rdi, qword [rsi+128H]                   ; 017F _ 48: 23. BE, 00000128
        jne     ?_031                                   ; 0186 _ 0F 85, 00000180
?_014:  and     rax, qword [rsi+130H]                   ; 018C _ 48: 23. 86, 00000130
        bsf     r15, rax                                ; 0193 _ 4C: 0F BC. F8
        and     r8, qword [r9+r15*8+0C00H]              ; 0197 _ 4F: 23. 84 F9, 00000C00
        jz      ?_016                                   ; 019F _ 74, 20
        mov     r9d, r15d                               ; 01A1 _ 45: 89. F9
        shl     r9d, 6                                  ; 01A4 _ 41: C1. E1, 06
?_015:  bsf     r14, r8                                 ; 01A8 _ 4D: 0F BC. F0
        add     rbx, 8                                  ; 01AC _ 48: 83. C3, 08
        or      r14d, r9d                               ; 01B0 _ 45: 09. CE
        blsr    r8, r8                                  ; 01B3 _ C4 C2 B8: F3. C8
        test    r8, r8                                  ; 01B8 _ 4D: 85. C0
        mov     dword [rbx-8H], r14d                    ; 01BB _ 44: 89. 73, F8
        jnz     ?_015                                   ; 01BF _ 75, E7
?_016:  mov     r8d, dword [r12+18H]                    ; 01C1 _ 45: 8B. 44 24, 18
        test    r8b, 0CH                                ; 01C6 _ 41: F6. C0, 0C
        jz      ?_018                                   ; 01CA _ 74, 2E
        cmp     byte [rsi+3C0H], 0                      ; 01CC _ 80. BE, 000003C0, 00
        jne     _ZN12_GLOBAL__N_112generate_allIL5Color1EL7GenType4EEEP7ExtMoveRK8PositionS4_yPK9CheckInfo.isra.59.cold.106; 01D3 _ 0F 85, 000005E5(rel)
        test    qword [rsi+2F0H], rcx                   ; 01D9 _ 48: 85. 8E, 000002F0
        je      ?_025                                   ; 01E0 _ 0F 84, 00000088
?_017:  mov     rax, qword [rsi+310H]                   ; 01E6 _ 48: 8B. 86, 00000310
        test    qword [rsi+100H], rax                   ; 01ED _ 48: 85. 86, 00000100
        je      ?_040                                   ; 01F4 _ 0F 84, 00000231
?_018:  mov     rax, rbx                                ; 01FA _ 48: 89. D8
        add     rsp, 40                                 ; 01FD _ 48: 83. C4, 28
        pop     rbx                                     ; 0201 _ 5B
        pop     rsi                                     ; 0202 _ 5E
        pop     rdi                                     ; 0203 _ 5F
        pop     rbp                                     ; 0204 _ 5D
        pop     r12                                     ; 0205 _ 41: 5C
        pop     r13                                     ; 0207 _ 41: 5D
        pop     r14                                     ; 0209 _ 41: 5E
        pop     r15                                     ; 020B _ 41: 5F
        ret                                             ; 020D _ C3

?_019:  shl     r13d, 6                                 ; 020E _ 41: C1. E5, 06
?_020:  bsf     rdi, r10                                ; 0212 _ 49: 0F BC. FA
        add     rbx, 8                                  ; 0216 _ 48: 83. C3, 08
        or      edi, r13d                               ; 021A _ 44: 09. EF
        blsr    r10, r10                                ; 021D _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 0222 _ 4D: 85. D2
        mov     dword [rbx-8H], edi                     ; 0225 _ 89. 7B, F8
        jnz     ?_020                                   ; 0228 _ 75, E8
?_021:  test    r15, r15                                ; 022A _ 4D: 85. FF
        je      ?_009                                   ; 022D _ 0F 84, FFFFFEF4
?_022:  bsf     r13, r15                                ; 0233 _ 4D: 0F BC. EF
        mov     r10, r8                                 ; 0237 _ 4D: 89. C2
        blsr    r15, r15                                ; 023A _ C4 C2 80: F3. CF
        and     r10, qword [r9+r13*8+400H]              ; 023F _ 4F: 23. 94 E9, 00000400
        jz      ?_021                                   ; 0247 _ 74, E1
        jmp     ?_019                                   ; 0249 _ EB, C3

?_023:  shl     r11d, 6                                 ; 024B _ 41: C1. E3, 06
?_024:  bsf     r14, rdx                                ; 024F _ 4C: 0F BC. F2
        add     rbx, 8                                  ; 0253 _ 48: 83. C3, 08
        or      r14d, r11d                              ; 0257 _ 45: 09. DE
        blsr    rdx, rdx                                ; 025A _ C4 E2 E8: F3. CA
        test    rdx, rdx                                ; 025F _ 48: 85. D2
        mov     dword [rbx-8H], r14d                    ; 0262 _ 44: 89. 73, F8
        je      ?_012                                   ; 0266 _ 0F 84, FFFFFF0B
        jmp     ?_024                                   ; 026C _ EB, E1

?_025:  and     r8b, 04H                                ; 026E _ 41: 80. E0, 04
        je      ?_017                                   ; 0272 _ 0F 84, FFFFFF6E
        mov     r13, qword [rsi+270H]                   ; 0278 _ 4C: 8B. AE, 00000270
        mov     r12d, 62                                ; 027F _ 41: BC, 0000003E
        bsf     rdi, rax                                ; 0285 _ 48: 0F BC. F8
?_026:  cmp     r12, rdi                                ; 0289 _ 49: 39. FC
        je      ?_035                                   ; 028C _ 0F 84, 000000F1
        mov     r8, qword [rsi+100H]                    ; 0292 _ 4C: 8B. 86, 00000100
        mov     rdx, r12                                ; 0299 _ 4C: 89. E2
        mov     rcx, rsi                                ; 029C _ 48: 89. F1
        call    _ZNK8Position12attackers_toE6Squarey    ; 029F _ E8, 00000000(rel)
        test    rax, rbp                                ; 02A4 _ 48: 85. E8
        jne     ?_017                                   ; 02A7 _ 0F 85, FFFFFF39
        sub     r12, 1                                  ; 02AD _ 49: 83. EC, 01
        jmp     ?_026                                   ; 02B1 _ EB, D6

?_027:  mov     r13, qword [rel .refptr.BishopMasks]    ; 02B3 _ 4C: 8B. 2D, 00000000(rel)
        mov     rdi, qword [rel .refptr.BishopAttacks]  ; 02BA _ 48: 8B. 3D, 00000000(rel)
?_028:  bsf     r11, rdx                                ; 02C1 _ 4C: 0F BC. DA
        pext    r14, rcx, qword [r13+r11*8]             ; 02C5 _ C4 02 F2: F5. 74 DD, 00
        mov     r10d, r14d                              ; 02CC _ 45: 89. F2
        mov     r14, qword [rdi+r11*8]                  ; 02CF _ 4E: 8B. 34 DF
        mov     r15, r8                                 ; 02D3 _ 4D: 89. C7
        blsr    rdx, rdx                                ; 02D6 _ C4 E2 E8: F3. CA
        and     r15, qword [r14+r10*8]                  ; 02DB _ 4F: 23. 3C D6
        mov     r10, r15                                ; 02DF _ 4D: 89. FA
        jz      ?_030                                   ; 02E2 _ 74, 1D
        shl     r11d, 6                                 ; 02E4 _ 41: C1. E3, 06
?_029:  bsf     r14, r10                                ; 02E8 _ 4D: 0F BC. F2
        add     rbx, 8                                  ; 02EC _ 48: 83. C3, 08
        or      r14d, r11d                              ; 02F0 _ 45: 09. DE
        blsr    r10, r10                                ; 02F3 _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 02F8 _ 4D: 85. D2
        mov     dword [rbx-8H], r14d                    ; 02FB _ 44: 89. 73, F8
        jnz     ?_029                                   ; 02FF _ 75, E7
?_030:  test    rdx, rdx                                ; 0301 _ 48: 85. D2
        je      ?_010                                   ; 0304 _ 0F 84, FFFFFE2D
        jmp     ?_028                                   ; 030A _ EB, B5

?_031:  mov     r15, qword [rel .refptr.BishopMasks]    ; 030C _ 4C: 8B. 3D, 00000000(rel)
        mov     r14, qword [rel .refptr.BishopAttacks]  ; 0313 _ 4C: 8B. 35, 00000000(rel)
?_032:  mov     r13, qword [rel .refptr.RookMasks]      ; 031A _ 4C: 8B. 2D, 00000000(rel)
        bsf     rdx, rdi                                ; 0321 _ 48: 0F BC. D7
        pext    r11, rcx, qword [r15+rdx*8]             ; 0325 _ C4 42 F2: F5. 1C D7
        mov     r11d, r11d                              ; 032B _ 45: 89. DB
        blsr    rdi, rdi                                ; 032E _ C4 E2 C0: F3. CF
        pext    r10, rcx, qword [r13+rdx*8]             ; 0333 _ C4 42 F2: F5. 54 D5, 00
        mov     r13, qword [r14+rdx*8]                  ; 033A _ 4D: 8B. 2C D6
        mov     r10d, r10d                              ; 033E _ 45: 89. D2
        mov     r11, qword [r13+r11*8]                  ; 0341 _ 4F: 8B. 5C DD, 00
        mov     r13, qword [rel .refptr.RookAttacks]    ; 0346 _ 4C: 8B. 2D, 00000000(rel)
        mov     r13, qword [r13+rdx*8]                  ; 034D _ 4D: 8B. 6C D5, 00
        or      r11, qword [r13+r10*8]                  ; 0352 _ 4F: 0B. 5C D5, 00
        and     r11, r8                                 ; 0357 _ 4D: 21. C3
        jz      ?_034                                   ; 035A _ 74, 1C
        shl     edx, 6                                  ; 035C _ C1. E2, 06
?_033:  bsf     r10, r11                                ; 035F _ 4D: 0F BC. D3
        add     rbx, 8                                  ; 0363 _ 48: 83. C3, 08
        or      r10d, edx                               ; 0367 _ 41: 09. D2
        blsr    r11, r11                                ; 036A _ C4 C2 A0: F3. CB
        test    r11, r11                                ; 036F _ 4D: 85. DB
        mov     dword [rbx-8H], r10d                    ; 0372 _ 44: 89. 53, F8
        jnz     ?_033                                   ; 0376 _ 75, E7
?_034:  test    rdi, rdi                                ; 0378 _ 48: 85. FF
        je      ?_014                                   ; 037B _ 0F 84, FFFFFE0B
        jmp     ?_032                                   ; 0381 _ EB, 97

?_035:  or      r13d, 0C000H                            ; 0383 _ 41: 81. CD, 0000C000
        shl     r12d, 6                                 ; 038A _ 41: C1. E4, 06
        add     rbx, 8                                  ; 038E _ 48: 83. C3, 08
        or      r12d, r13d                              ; 0392 _ 45: 09. EC
        mov     dword [rbx-8H], r12d                    ; 0395 _ 44: 89. 63, F8
        jmp     ?_017                                   ; 0399 _ E9, FFFFFE48

?_036:  mov     r9, rdi                                 ; 039E _ 49: 89. F9
        mov     rdx, rdi                                ; 03A1 _ 48: 89. FA
        shr     r12, 8                                  ; 03A4 _ 49: C1. EC, 08
        and     r9d, 0FE00H                             ; 03A8 _ 41: 81. E1, 0000FE00
        and     edx, 7F00H                              ; 03AF _ 81. E2, 00007F00
        and     r14, r12                                ; 03B5 _ 4D: 21. E6
        shr     r9, 9                                   ; 03B8 _ 49: C1. E9, 09
        shr     rdx, 7                                  ; 03BC _ 48: C1. EA, 07
        and     r9, rbp                                 ; 03C0 _ 49: 21. E9
        and     rdx, rbp                                ; 03C3 _ 48: 21. EA
?_037:  test    r9, r9                                  ; 03C6 _ 4D: 85. C9
        jne     ?_048                                   ; 03C9 _ 0F 85, 0000019B
?_038:  test    rdx, rdx                                ; 03CF _ 48: 85. D2
        jne     ?_044                                   ; 03D2 _ 0F 85, 000000F6
?_039:  test    r14, r14                                ; 03D8 _ 4D: 85. F6
        je      ?_005                                   ; 03DB _ 0F 84, FFFFFCDF
        bsf     r12, r14                                ; 03E1 _ 4D: 0F BC. E6
        lea     edx, [r12+8H]                           ; 03E5 _ 41: 8D. 54 24, 08
        add     rbx, 32                                 ; 03EA _ 48: 83. C3, 20
        blsr    r14, r14                                ; 03EE _ C4 C2 88: F3. CE
        shl     edx, 6                                  ; 03F3 _ C1. E2, 06
        or      edx, r12d                               ; 03F6 _ 44: 09. E2
        mov     r10d, edx                               ; 03F9 _ 41: 89. D2
        mov     r11d, edx                               ; 03FC _ 41: 89. D3
        mov     r15d, edx                               ; 03FF _ 41: 89. D7
        or      r10d, 7000H                             ; 0402 _ 41: 81. CA, 00007000
        or      r11d, 6000H                             ; 0409 _ 41: 81. CB, 00006000
        or      r15d, 5000H                             ; 0410 _ 41: 81. CF, 00005000
        mov     dword [rbx-20H], r10d                   ; 0417 _ 44: 89. 53, E0
        or      dh, 40H                                 ; 041B _ 80. CE, 40
        mov     dword [rbx-18H], r11d                   ; 041E _ 44: 89. 5B, E8
        mov     dword [rbx-10H], r15d                   ; 0422 _ 44: 89. 7B, F0
        mov     dword [rbx-8H], edx                     ; 0426 _ 89. 53, F8
        jmp     ?_039                                   ; 0429 _ EB, AD

?_040:  mov     rcx, qword [rsi+3B8H]                   ; 042B _ 48: 8B. 8E, 000003B8
        test    byte [rcx+18H], 08H                     ; 0432 _ F6. 41, 18, 08
        je      ?_018                                   ; 0436 _ 0F 84, FFFFFDBE
        mov     r14, qword [rsi+290H]                   ; 043C _ 4C: 8B. B6, 00000290
        mov     r13d, 58                                ; 0443 _ 41: BD, 0000003A
        mov     rdi, qword [rsi+140H]                   ; 0449 _ 48: 8B. BE, 00000140
        mov     rbp, qword [rsi+130H]                   ; 0450 _ 48: 8B. AE, 00000130
        and     rbp, qword [rsi+148H]                   ; 0457 _ 48: 23. AE, 00000148
        bsf     r15, rbp                                ; 045E _ 4C: 0F BC. FD
?_041:  cmp     r13, r15                                ; 0462 _ 4D: 39. FD
        je      ?_047                                   ; 0465 _ 0F 84, 000000E4
        mov     r8, qword [rsi+100H]                    ; 046B _ 4C: 8B. 86, 00000100
        mov     rdx, r13                                ; 0472 _ 4C: 89. EA
        mov     rcx, rsi                                ; 0475 _ 48: 89. F1
        call    _ZNK8Position12attackers_toE6Squarey    ; 0478 _ E8, 00000000(rel)
        test    rax, rdi                                ; 047D _ 48: 85. F8
        jne     ?_018                                   ; 0480 _ 0F 85, FFFFFD74
        add     r13, 1                                  ; 0486 _ 49: 83. C5, 01
        jmp     ?_041                                   ; 048A _ EB, D6

?_042:  bsf     r14, rdx                                ; 048C _ 4C: 0F BC. F2
        lea     r9d, [r14+9H]                           ; 0490 _ 45: 8D. 4E, 09
        add     rbx, 8                                  ; 0494 _ 48: 83. C3, 08
        blsr    rdx, rdx                                ; 0498 _ C4 E2 E8: F3. CA
        shl     r9d, 6                                  ; 049D _ 41: C1. E1, 06
        or      r14d, r9d                               ; 04A1 _ 45: 09. CE
        mov     dword [rbx-8H], r14d                    ; 04A4 _ 44: 89. 73, F8
        jmp     ?_006                                   ; 04A8 _ E9, FFFFFC3B

?_043:  bsf     r11, rdi                                ; 04AD _ 4C: 0F BC. DF
        lea     r15d, [r11+7H]                          ; 04B1 _ 45: 8D. 7B, 07
        add     rbx, 8                                  ; 04B5 _ 48: 83. C3, 08
        blsr    rdi, rdi                                ; 04B9 _ C4 E2 C0: F3. CF
        shl     r15d, 6                                 ; 04BE _ 41: C1. E7, 06
        or      r11d, r15d                              ; 04C2 _ 45: 09. FB
        mov     dword [rbx-8H], r11d                    ; 04C5 _ 44: 89. 5B, F8
        jmp     ?_007                                   ; 04C9 _ E9, FFFFFC23

?_044:  bsf     r12, rdx                                ; 04CE _ 4C: 0F BC. E2
        lea     r9d, [r12+7H]                           ; 04D2 _ 45: 8D. 4C 24, 07
        add     rbx, 32                                 ; 04D7 _ 48: 83. C3, 20
        blsr    rdx, rdx                                ; 04DB _ C4 E2 E8: F3. CA
        shl     r9d, 6                                  ; 04E0 _ 41: C1. E1, 06
        or      r9d, r12d                               ; 04E4 _ 45: 09. E1
        mov     r10d, r9d                               ; 04E7 _ 45: 89. CA
        mov     r11d, r9d                               ; 04EA _ 45: 89. CB
        mov     r15d, r9d                               ; 04ED _ 45: 89. CF
        or      r10d, 7000H                             ; 04F0 _ 41: 81. CA, 00007000
        or      r11d, 6000H                             ; 04F7 _ 41: 81. CB, 00006000
        or      r15d, 5000H                             ; 04FE _ 41: 81. CF, 00005000
        mov     dword [rbx-20H], r10d                   ; 0505 _ 44: 89. 53, E0
        or      r9d, 4000H                              ; 0509 _ 41: 81. C9, 00004000
        mov     dword [rbx-18H], r11d                   ; 0510 _ 44: 89. 5B, E8
        mov     dword [rbx-10H], r15d                   ; 0514 _ 44: 89. 7B, F0
        mov     dword [rbx-8H], r9d                     ; 0518 _ 44: 89. 4B, F8
        jmp     ?_038                                   ; 051C _ E9, FFFFFEAE

?_045:  and     r13, qword [r9+rdx*8+200H]              ; 0521 _ 4D: 23. AC D1, 00000200
        or      dh, 0FFFFFF80H                          ; 0529 _ 80. CE, 80
?_046:  test    r13, r13                                ; 052C _ 4D: 85. ED
        je      ?_008                                   ; 052F _ 0F 84, FFFFFBE2
        bsf     r10, r13                                ; 0535 _ 4D: 0F BC. D5
        shl     r10d, 6                                 ; 0539 _ 41: C1. E2, 06
        add     rbx, 8                                  ; 053D _ 48: 83. C3, 08
        blsr    r13, r13                                ; 0541 _ C4 C2 90: F3. CD
        or      r10d, edx                               ; 0546 _ 41: 09. D2
        mov     dword [rbx-8H], r10d                    ; 0549 _ 44: 89. 53, F8
        jmp     ?_046                                   ; 054D _ EB, DD

?_047:  or      r14d, 0C000H                            ; 054F _ 41: 81. CE, 0000C000
        shl     r13d, 6                                 ; 0556 _ 41: C1. E5, 06
        add     rbx, 8                                  ; 055A _ 48: 83. C3, 08
        or      r13d, r14d                              ; 055E _ 45: 09. F5
        mov     dword [rbx-8H], r13d                    ; 0561 _ 44: 89. 6B, F8
        jmp     ?_018                                   ; 0565 _ E9, FFFFFC90

?_048:  ; Local function
        bsf     r12, r9                                 ; 056A _ 4D: 0F BC. E1
        lea     r10d, [r12+9H]                          ; 056E _ 45: 8D. 54 24, 09
        add     rbx, 32                                 ; 0573 _ 48: 83. C3, 20
        blsr    r9, r9                                  ; 0577 _ C4 C2 B0: F3. C9
        shl     r10d, 6                                 ; 057C _ 41: C1. E2, 06
        or      r12d, r10d                              ; 0580 _ 45: 09. D4
        mov     r11d, r12d                              ; 0583 _ 45: 89. E3
        mov     r15d, r12d                              ; 0586 _ 45: 89. E7
        mov     r10d, r12d                              ; 0589 _ 45: 89. E2
        or      r11d, 7000H                             ; 058C _ 41: 81. CB, 00007000
        or      r15d, 6000H                             ; 0593 _ 41: 81. CF, 00006000
        or      r10d, 5000H                             ; 059A _ 41: 81. CA, 00005000
        mov     dword [rbx-20H], r11d                   ; 05A1 _ 44: 89. 5B, E0
        or      r12d, 4000H                             ; 05A5 _ 41: 81. CC, 00004000
        mov     dword [rbx-18H], r15d                   ; 05AC _ 44: 89. 7B, E8
        mov     dword [rbx-10H], r10d                   ; 05B0 _ 44: 89. 53, F0
        mov     dword [rbx-8H], r12d                    ; 05B4 _ 44: 89. 63, F8
        jmp     ?_037                                   ; 05B8 _ E9, FFFFFE09

        nop                                             ; 05BD _ 90
        nop                                             ; 05BE _ 90
        nop                                             ; 05BF _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=16 noexecute                      ; section number 3, bss


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_ZN12_GLOBAL__N_112generate_allIL5Color0EL7GenType4EEEP7ExtMoveRK8PositionS4_yPK9CheckInfo.isra.54.cold.104:
        mov     rdx, rbx                                ; 0000 _ 48: 89. DA
        mov     rcx, rsi                                ; 0003 _ 48: 89. F1
        call    _ZN12_GLOBAL__N_117generate_castlingIL13CastlingRight1ELb0ELb1EEEP7ExtMoveRK8PositionS3_5ColorPK9CheckInfo.isra.22.constprop.97; 0006 _ E8, 000003E4
        mov     rcx, rsi                                ; 000B _ 48: 89. F1
        mov     rdx, rax                                ; 000E _ 48: 89. C2
        add     rsp, 40                                 ; 0011 _ 48: 83. C4, 28
        pop     rbx                                     ; 0015 _ 5B
        pop     rsi                                     ; 0016 _ 5E
        pop     rdi                                     ; 0017 _ 5F
        pop     rbp                                     ; 0018 _ 5D
        pop     r12                                     ; 0019 _ 41: 5C
        pop     r13                                     ; 001B _ 41: 5D
        pop     r14                                     ; 001D _ 41: 5E
        pop     r15                                     ; 001F _ 41: 5F
        jmp     _ZN12_GLOBAL__N_117generate_castlingIL13CastlingRight2ELb0ELb1EEEP7ExtMoveRK8PositionS3_5ColorPK9CheckInfo.isra.23.constprop.101; 0021 _ E9, 000004C4

_Z8generateIL7GenType2EEP7ExtMoveRK8PositionS2_.cold.105:; Local function
        test    qword [rbx+2D8H], rbp                   ; 0026 _ 48: 85. AB, 000002D8
        jne     ?_058                                   ; 002D _ 0F 85, 00000297
        test    al, 01H                                 ; 0033 _ A8, 01
        je      ?_058                                   ; 0035 _ 0F 84, 0000028F
        mov     r14, qword [rbx+258H]                   ; 003B _ 4C: 8B. B3, 00000258
        mov     r12d, 6                                 ; 0042 _ 41: BC, 00000006
        and     r9, qword [rbx+130H]                    ; 0048 _ 4C: 23. 8B, 00000130
        bsf     rsi, r9                                 ; 004F _ 49: 0F BC. F1
        cmp     rsi, 6                                  ; 0053 _ 48: 83. FE, 06
        sbb     r13, r13                                ; 0057 _ 4D: 19. ED
        or      r13, 01H                                ; 005A _ 49: 83. CD, 01
?_049:  cmp     rsi, r12                                ; 005E _ 4C: 39. E6
        je      ?_057                                   ; 0061 _ 0F 84, 0000021B
        mov     r8, qword [rbx+100H]                    ; 0067 _ 4C: 8B. 83, 00000100
        mov     rdx, r12                                ; 006E _ 4C: 89. E2
        mov     rcx, rbx                                ; 0071 _ 48: 89. D9
        call    _ZNK8Position12attackers_toE6Squarey    ; 0074 _ E8, 00000000(rel)
        test    qword [rsp+30H], rax                    ; 0079 _ 48: 85. 44 24, 30
        jne     ?_058                                   ; 007E _ 0F 85, 00000246
        add     r12d, r13d                              ; 0084 _ 45: 01. EC
        movsxd  r12, r12d                               ; 0087 _ 4D: 63. E4
        jmp     ?_049                                   ; 008A _ EB, D2

; Note: No jump seems to point here
        test    qword [rbx+2F0H], rbp                   ; 008C _ 48: 85. AB, 000002F0
        jne     ?_052                                   ; 0093 _ 0F 85, 000000BD
        and     r14b, 04H                               ; 0099 _ 41: 80. E6, 04
        je      ?_052                                   ; 009D _ 0F 84, 000000B3
        mov     rsi, qword [rbx+270H]                   ; 00A3 _ 48: 8B. B3, 00000270
        mov     r12d, 62                                ; 00AA _ 41: BC, 0000003E
        and     rax, qword [rbx+130H]                   ; 00B0 _ 48: 23. 83, 00000130
        bsf     r14, rax                                ; 00B7 _ 4C: 0F BC. F0
        cmp     r14, 62                                 ; 00BB _ 49: 83. FE, 3E
        sbb     r13, r13                                ; 00BF _ 4D: 19. ED
        or      r13, 01H                                ; 00C2 _ 49: 83. CD, 01
?_050:  cmp     r14, r12                                ; 00C6 _ 4D: 39. E6
        jz      ?_051                                   ; 00C9 _ 74, 3D
        mov     r8, qword [rbx+100H]                    ; 00CB _ 4C: 8B. 83, 00000100
        mov     rdx, r12                                ; 00D2 _ 4C: 89. E2
        mov     rcx, rbx                                ; 00D5 _ 48: 89. D9
        call    _ZNK8Position12attackers_toE6Squarey    ; 00D8 _ E8, 00000000(rel)
        test    qword [rsp+30H], rax                    ; 00DD _ 48: 85. 44 24, 30
        jnz     ?_052                                   ; 00E2 _ 75, 72
        add     r12d, r13d                              ; 00E4 _ 45: 01. EC
        movsxd  r12, r12d                               ; 00E7 _ 4D: 63. E4
        jmp     ?_050                                   ; 00EA _ EB, DA

; Note: No jump seems to point here
        bsf     rcx, r12                                ; 00EC _ 49: 0F BC. CC
        blsr    r12, r12                                ; 00F0 _ C4 C2 98: F3. CC
        test    qword [r10+rcx*8+400H], r11             ; 00F5 _ 4D: 85. 9C CA, 00000400
        jne     ?_271                                   ; 00FD _ 0F 85, 0000180C(rel)
        jmp     .text.hot+17D3H                         ; 0103 _ E9, 000017D3(rel)

?_051:  mov     r8, qword [rel .refptr.SquareBB]        ; 0108 _ 4C: 8B. 05, 00000000(rel)
        mov     rbp, qword [rel .refptr.RookAttacks]    ; 010F _ 48: 8B. 2D, 00000000(rel)
        mov     r10, qword [rbx+100H]                   ; 0116 _ 4C: 8B. 93, 00000100
        mov     rdx, qword [rel .refptr.RookMasks]      ; 011D _ 48: 8B. 15, 00000000(rel)
        xor     r10, qword [r8+rsi*8]                   ; 0124 _ 4D: 33. 14 F0
        mov     rax, qword [rbp+1F0H]                   ; 0128 _ 48: 8B. 85, 000001F0
        mov     r11, qword [rbx+128H]                   ; 012F _ 4C: 8B. 9B, 00000128
        or      r11, qword [rbx+120H]                   ; 0136 _ 4C: 0B. 9B, 00000120
        pext    rcx, r10, qword [rdx+1F0H]              ; 013D _ C4 E2 AA: F5. 8A, 000001F0
        mov     r9d, ecx                                ; 0146 _ 41: 89. C9
        and     r11, qword [rbx+140H]                   ; 0149 _ 4C: 23. 9B, 00000140
        test    qword [rax+r9*8], r11                   ; 0150 _ 4E: 85. 1C C8
        jz      ?_054                                   ; 0154 _ 74, 79
?_052:  mov     r14, qword [rbx+310H]                   ; 0156 _ 4C: 8B. B3, 00000310
        test    qword [rbx+100H], r14                   ; 015D _ 4C: 85. B3, 00000100
        jne     ?_168                                   ; 0164 _ 0F 85, 00000ADC(rel)
        mov     rsi, qword [rbx+3B8H]                   ; 016A _ 48: 8B. B3, 000003B8
        test    byte [rsi+18H], 08H                     ; 0171 _ F6. 46, 18, 08
        je      ?_168                                   ; 0175 _ 0F 84, 00000ADC(rel)
        mov     r12, qword [rbx+290H]                   ; 017B _ 4C: 8B. A3, 00000290
        mov     ebp, 58                                 ; 0182 _ BD, 0000003A
        mov     r14, qword [rbx+140H]                   ; 0187 _ 4C: 8B. B3, 00000140
        mov     r13, qword [rbx+130H]                   ; 018E _ 4C: 8B. AB, 00000130
        and     r13, qword [rbx+148H]                   ; 0195 _ 4C: 23. AB, 00000148
        bsf     rsi, r13                                ; 019C _ 49: 0F BC. F5
        cmp     rsi, 58                                 ; 01A0 _ 48: 83. FE, 3A
        sbb     r13, r13                                ; 01A4 _ 4D: 19. ED
        or      r13, 01H                                ; 01A7 _ 49: 83. CD, 01
?_053:  cmp     rsi, rbp                                ; 01AB _ 48: 39. EE
        jz      ?_056                                   ; 01AE _ 74, 53
        mov     r8, qword [rbx+100H]                    ; 01B0 _ 4C: 8B. 83, 00000100
        mov     rdx, rbp                                ; 01B7 _ 48: 89. EA
        mov     rcx, rbx                                ; 01BA _ 48: 89. D9
        call    _ZNK8Position12attackers_toE6Squarey    ; 01BD _ E8, 00000000(rel)
        test    rax, r14                                ; 01C2 _ 4C: 85. F0
        jnz     ?_055                                   ; 01C5 _ 75, 37
        add     ebp, r13d                               ; 01C7 _ 44: 01. ED
        movsxd  rbp, ebp                                ; 01CA _ 48: 63. ED
        jmp     ?_053                                   ; 01CD _ EB, DC

?_054:  or      esi, 0C000H                             ; 01CF _ 81. CE, 0000C000
        shl     r14d, 6                                 ; 01D5 _ 41: C1. E6, 06
        mov     r8, r15                                 ; 01D9 _ 4D: 89. F8
        or      r14d, esi                               ; 01DC _ 41: 09. F6
        mov     rcx, rbx                                ; 01DF _ 48: 89. D9
        mov     edx, r14d                               ; 01E2 _ 44: 89. F2
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 01E5 _ E8, 00000000(rel)
        test    al, al                                  ; 01EA _ 84. C0
        je      ?_052                                   ; 01EC _ 0F 84, FFFFFF64
        mov     dword [rdi], r14d                       ; 01F2 _ 44: 89. 37
        add     rdi, 8                                  ; 01F5 _ 48: 83. C7, 08
        jmp     ?_052                                   ; 01F9 _ E9, FFFFFF58

?_055:  jmp     ?_168                                   ; 01FE _ E9, 00000ADC(rel)

?_056:  mov     r8, qword [rel .refptr.SquareBB]        ; 0203 _ 4C: 8B. 05, 00000000(rel)
        mov     rax, qword [rel .refptr.RookAttacks]    ; 020A _ 48: 8B. 05, 00000000(rel)
        mov     r10, qword [rbx+100H]                   ; 0211 _ 4C: 8B. 93, 00000100
        mov     rdx, qword [rel .refptr.RookMasks]      ; 0218 _ 48: 8B. 15, 00000000(rel)
        xor     r10, qword [r8+r12*8]                   ; 021F _ 4F: 33. 14 E0
        mov     r14, qword [rax+1D0H]                   ; 0223 _ 4C: 8B. B0, 000001D0
        mov     r11, qword [rbx+128H]                   ; 022A _ 4C: 8B. 9B, 00000128
        or      r11, qword [rbx+120H]                   ; 0231 _ 4C: 0B. 9B, 00000120
        pext    rcx, r10, qword [rdx+1D0H]              ; 0238 _ C4 E2 AA: F5. 8A, 000001D0
        mov     r9d, ecx                                ; 0241 _ 41: 89. C9
        and     r11, qword [rbx+140H]                   ; 0244 _ 4C: 23. 9B, 00000140
        test    qword [r14+r9*8], r11                   ; 024B _ 4F: 85. 1C CE
        jne     ?_168                                   ; 024F _ 0F 85, 00000ADC(rel)
        or      r12d, 0C000H                            ; 0255 _ 41: 81. CC, 0000C000
        shl     esi, 6                                  ; 025C _ C1. E6, 06
        mov     r8, r15                                 ; 025F _ 4D: 89. F8
        or      esi, r12d                               ; 0262 _ 44: 09. E6
        mov     rcx, rbx                                ; 0265 _ 48: 89. D9
        mov     edx, esi                                ; 0268 _ 89. F2
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 026A _ E8, 00000000(rel)
        test    al, al                                  ; 026F _ 84. C0
        je      ?_168                                   ; 0271 _ 0F 84, 00000ADC(rel)
        mov     dword [rdi], esi                        ; 0277 _ 89. 37
        add     rdi, 8                                  ; 0279 _ 48: 83. C7, 08
        jmp     ?_168                                   ; 027D _ E9, 00000ADC(rel)

?_057:  mov     rdx, qword [rel .refptr.SquareBB]       ; 0282 _ 48: 8B. 15, 00000000(rel)
        mov     rbp, qword [rel .refptr.RookAttacks]    ; 0289 _ 48: 8B. 2D, 00000000(rel)
        mov     r8, qword [rbx+100H]                    ; 0290 _ 4C: 8B. 83, 00000100
        mov     r10, qword [rel .refptr.RookMasks]      ; 0297 _ 4C: 8B. 15, 00000000(rel)
        xor     r8, qword [rdx+r14*8]                   ; 029E _ 4E: 33. 04 F2
        mov     rax, qword [rbp+30H]                    ; 02A2 _ 48: 8B. 45, 30
        mov     r9, qword [rbx+128H]                    ; 02A6 _ 4C: 8B. 8B, 00000128
        or      r9, qword [rbx+120H]                    ; 02AD _ 4C: 0B. 8B, 00000120
        pext    rcx, r8, qword [r10+30H]                ; 02B4 _ C4 C2 BA: F5. 4A, 30
        mov     r11d, ecx                               ; 02BA _ 41: 89. CB
        and     r9, qword [rbx+148H]                    ; 02BD _ 4C: 23. 8B, 00000148
        test    qword [rax+r11*8], r9                   ; 02C4 _ 4E: 85. 0C D8
        jz      ?_060                                   ; 02C8 _ 74, 7A
?_058:  mov     rsi, qword [rbx+2E0H]                   ; 02CA _ 48: 8B. B3, 000002E0
        test    qword [rbx+100H], rsi                   ; 02D1 _ 48: 85. B3, 00000100
        jne     ?_168                                   ; 02D8 _ 0F 85, 00000ADC(rel)
        mov     r14, qword [rbx+3B8H]                   ; 02DE _ 4C: 8B. B3, 000003B8
        test    byte [r14+18H], 02H                     ; 02E5 _ 41: F6. 46, 18, 02
        je      ?_168                                   ; 02EA _ 0F 84, 00000ADC(rel)
        mov     r12, qword [rbx+260H]                   ; 02F0 _ 4C: 8B. A3, 00000260
        mov     ebp, 2                                  ; 02F7 _ BD, 00000002
        mov     r14, qword [rbx+148H]                   ; 02FC _ 4C: 8B. B3, 00000148
        mov     r13, qword [rbx+130H]                   ; 0303 _ 4C: 8B. AB, 00000130
        and     r13, qword [rbx+140H]                   ; 030A _ 4C: 23. AB, 00000140
        bsf     rsi, r13                                ; 0311 _ 49: 0F BC. F5
        cmp     rsi, 2                                  ; 0315 _ 48: 83. FE, 02
        sbb     r13, r13                                ; 0319 _ 4D: 19. ED
        or      r13, 01H                                ; 031C _ 49: 83. CD, 01
?_059:  cmp     rsi, rbp                                ; 0320 _ 48: 39. EE
        jz      ?_062                                   ; 0323 _ 74, 51
        mov     r8, qword [rbx+100H]                    ; 0325 _ 4C: 8B. 83, 00000100
        mov     rdx, rbp                                ; 032C _ 48: 89. EA
        mov     rcx, rbx                                ; 032F _ 48: 89. D9
        call    _ZNK8Position12attackers_toE6Squarey    ; 0332 _ E8, 00000000(rel)
        test    rax, r14                                ; 0337 _ 4C: 85. F0
        jnz     ?_061                                   ; 033A _ 75, 35
        add     ebp, r13d                               ; 033C _ 44: 01. ED
        movsxd  rbp, ebp                                ; 033F _ 48: 63. ED
        jmp     ?_059                                   ; 0342 _ EB, DC

?_060:  or      r14d, 0C000H                            ; 0344 _ 41: 81. CE, 0000C000
        shl     esi, 6                                  ; 034B _ C1. E6, 06
        mov     r8, r15                                 ; 034E _ 4D: 89. F8
        or      esi, r14d                               ; 0351 _ 44: 09. F6
        mov     rcx, rbx                                ; 0354 _ 48: 89. D9
        mov     edx, esi                                ; 0357 _ 89. F2
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 0359 _ E8, 00000000(rel)
        test    al, al                                  ; 035E _ 84. C0
        je      ?_058                                   ; 0360 _ 0F 84, FFFFFF64
        mov     dword [rdi], esi                        ; 0366 _ 89. 37
        add     rdi, 8                                  ; 0368 _ 48: 83. C7, 08
        jmp     ?_058                                   ; 036C _ E9, FFFFFF59

?_061:  jmp     ?_168                                   ; 0371 _ E9, 00000ADC(rel)

?_062:  ; Local function
        mov     rdx, qword [rel .refptr.SquareBB]       ; 0376 _ 48: 8B. 15, 00000000(rel)
        mov     rax, qword [rel .refptr.RookAttacks]    ; 037D _ 48: 8B. 05, 00000000(rel)
        mov     r8, qword [rbx+100H]                    ; 0384 _ 4C: 8B. 83, 00000100
        mov     r10, qword [rel .refptr.RookMasks]      ; 038B _ 4C: 8B. 15, 00000000(rel)
        xor     r8, qword [rdx+r12*8]                   ; 0392 _ 4E: 33. 04 E2
        mov     r14, qword [rax+10H]                    ; 0396 _ 4C: 8B. 70, 10
        mov     r9, qword [rbx+128H]                    ; 039A _ 4C: 8B. 8B, 00000128
        or      r9, qword [rbx+120H]                    ; 03A1 _ 4C: 0B. 8B, 00000120
        pext    rcx, r8, qword [r10+10H]                ; 03A8 _ C4 C2 BA: F5. 4A, 10
        mov     r11d, ecx                               ; 03AE _ 41: 89. CB
        and     r9, qword [rbx+148H]                    ; 03B1 _ 4C: 23. 8B, 00000148
        test    qword [r14+r11*8], r9                   ; 03B8 _ 4F: 85. 0C DE
        jne     ?_168                                   ; 03BC _ 0F 85, 00000ADC(rel)
        or      r12d, 0C000H                            ; 03C2 _ 41: 81. CC, 0000C000
        shl     esi, 6                                  ; 03C9 _ C1. E6, 06
        mov     r8, r15                                 ; 03CC _ 4D: 89. F8
        or      esi, r12d                               ; 03CF _ 44: 09. E6
        mov     rcx, rbx                                ; 03D2 _ 48: 89. D9
        mov     edx, esi                                ; 03D5 _ 89. F2
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 03D7 _ E8, 00000000(rel)
        test    al, al                                  ; 03DC _ 84. C0
        je      ?_168                                   ; 03DE _ 0F 84, 00000ADC(rel)
        mov     dword [rdi], esi                        ; 03E4 _ 89. 37
        add     rdi, 8                                  ; 03E6 _ 48: 83. C7, 08
        jmp     ?_168                                   ; 03EA _ E9, 00000ADC(rel)

_ZN12_GLOBAL__N_117generate_castlingIL13CastlingRight1ELb0ELb1EEEP7ExtMoveRK8PositionS3_5ColorPK9CheckInfo.isra.22.constprop.97:; Local function
        push    r14                                     ; 03EF _ 41: 56
        push    r13                                     ; 03F1 _ 41: 55
        push    r12                                     ; 03F3 _ 41: 54
        push    rbp                                     ; 03F5 _ 55
        push    rdi                                     ; 03F6 _ 57
        push    rsi                                     ; 03F7 _ 56
        push    rbx                                     ; 03F8 _ 53
        sub     rsp, 32                                 ; 03F9 _ 48: 83. EC, 20
        mov     rax, qword [rcx+2D8H]                   ; 03FD _ 48: 8B. 81, 000002D8
        test    qword [rcx+100H], rax                   ; 0404 _ 48: 85. 81, 00000100
        mov     rbx, rcx                                ; 040B _ 48: 89. CB
        mov     rdi, rdx                                ; 040E _ 48: 89. D7
        jz      ?_064                                   ; 0411 _ 74, 08
?_063:  mov     rax, rdi                                ; 0413 _ 48: 89. F8
        jmp     ?_067                                   ; 0416 _ E9, 000000C0

?_064:  mov     rdx, qword [rcx+3B8H]                   ; 041B _ 48: 8B. 91, 000003B8
        test    byte [rdx+18H], 01H                     ; 0422 _ F6. 42, 18, 01
        jz      ?_063                                   ; 0426 _ 74, EB
        mov     r12, qword [rcx+258H]                   ; 0428 _ 4C: 8B. A1, 00000258
        mov     ebp, 6                                  ; 042F _ BD, 00000006
        mov     r14, qword [rcx+148H]                   ; 0434 _ 4C: 8B. B1, 00000148
        mov     rsi, qword [rcx+130H]                   ; 043B _ 48: 8B. B1, 00000130
        and     rsi, qword [rcx+140H]                   ; 0442 _ 48: 23. B1, 00000140
        bsf     rsi, rsi                                ; 0449 _ 48: 0F BC. F6
        cmp     rsi, 6                                  ; 044D _ 48: 83. FE, 06
        sbb     r13, r13                                ; 0451 _ 4D: 19. ED
        or      r13, 01H                                ; 0454 _ 49: 83. CD, 01
?_065:  cmp     rsi, rbp                                ; 0458 _ 48: 39. EE
        jz      ?_066                                   ; 045B _ 74, 1F
        mov     r8, qword [rbx+100H]                    ; 045D _ 4C: 8B. 83, 00000100
        mov     rdx, rbp                                ; 0464 _ 48: 89. EA
        mov     rcx, rbx                                ; 0467 _ 48: 89. D9
        call    _ZNK8Position12attackers_toE6Squarey    ; 046A _ E8, 00000000(rel)
        test    rax, r14                                ; 046F _ 4C: 85. F0
        jnz     ?_063                                   ; 0472 _ 75, 9F
        add     ebp, r13d                               ; 0474 _ 44: 01. ED
        movsxd  rbp, ebp                                ; 0477 _ 48: 63. ED
        jmp     ?_065                                   ; 047A _ EB, DC

?_066:  mov     r8, qword [rel .refptr.SquareBB]        ; 047C _ 4C: 8B. 05, 00000000(rel)
        mov     rax, qword [rel .refptr.RookAttacks]    ; 0483 _ 48: 8B. 05, 00000000(rel)
        mov     rcx, qword [rbx+100H]                   ; 048A _ 48: 8B. 8B, 00000100
        mov     r9, qword [rel .refptr.RookMasks]       ; 0491 _ 4C: 8B. 0D, 00000000(rel)
        xor     rcx, qword [r8+r12*8]                   ; 0498 _ 4B: 33. 0C E0
        mov     rdx, qword [rax+30H]                    ; 049C _ 48: 8B. 50, 30
        mov     r11, qword [rbx+128H]                   ; 04A0 _ 4C: 8B. 9B, 00000128
        or      r11, qword [rbx+120H]                   ; 04A7 _ 4C: 0B. 9B, 00000120
        pext    r10, rcx, qword [r9+30H]                ; 04AE _ C4 42 F2: F5. 51, 30
        and     r11, qword [rbx+148H]                   ; 04B4 _ 4C: 23. 9B, 00000148
        mov     ebx, r10d                               ; 04BB _ 44: 89. D3
        test    qword [rdx+rbx*8], r11                  ; 04BE _ 4C: 85. 1C DA
        jne     ?_063                                   ; 04C2 _ 0F 85, FFFFFF4B
        lea     rax, [rdi+8H]                           ; 04C8 _ 48: 8D. 47, 08
        or      r12d, 0C000H                            ; 04CC _ 41: 81. CC, 0000C000
        shl     esi, 6                                  ; 04D3 _ C1. E6, 06
        or      esi, r12d                               ; 04D6 _ 44: 09. E6
        mov     dword [rdi], esi                        ; 04D9 _ 89. 37
?_067:  add     rsp, 32                                 ; 04DB _ 48: 83. C4, 20
        pop     rbx                                     ; 04DF _ 5B
        pop     rsi                                     ; 04E0 _ 5E
        pop     rdi                                     ; 04E1 _ 5F
        pop     rbp                                     ; 04E2 _ 5D
        pop     r12                                     ; 04E3 _ 41: 5C
        pop     r13                                     ; 04E5 _ 41: 5D
        pop     r14                                     ; 04E7 _ 41: 5E
        ret                                             ; 04E9 _ C3

_ZN12_GLOBAL__N_117generate_castlingIL13CastlingRight2ELb0ELb1EEEP7ExtMoveRK8PositionS3_5ColorPK9CheckInfo.isra.23.constprop.101:; Local function
        push    r14                                     ; 04EA _ 41: 56
        push    r13                                     ; 04EC _ 41: 55
        push    r12                                     ; 04EE _ 41: 54
        push    rbp                                     ; 04F0 _ 55
        push    rdi                                     ; 04F1 _ 57
        push    rsi                                     ; 04F2 _ 56
        push    rbx                                     ; 04F3 _ 53
        sub     rsp, 32                                 ; 04F4 _ 48: 83. EC, 20
        mov     rax, qword [rcx+2E0H]                   ; 04F8 _ 48: 8B. 81, 000002E0
        test    qword [rcx+100H], rax                   ; 04FF _ 48: 85. 81, 00000100
        mov     rbx, rcx                                ; 0506 _ 48: 89. CB
        mov     rdi, rdx                                ; 0509 _ 48: 89. D7
        jz      ?_069                                   ; 050C _ 74, 08
?_068:  mov     rax, rdi                                ; 050E _ 48: 89. F8
        jmp     ?_072                                   ; 0511 _ E9, 000000C0

?_069:  mov     rdx, qword [rcx+3B8H]                   ; 0516 _ 48: 8B. 91, 000003B8
        test    byte [rdx+18H], 02H                     ; 051D _ F6. 42, 18, 02
        jz      ?_068                                   ; 0521 _ 74, EB
        mov     r12, qword [rcx+260H]                   ; 0523 _ 4C: 8B. A1, 00000260
        mov     ebp, 2                                  ; 052A _ BD, 00000002
        mov     r14, qword [rcx+148H]                   ; 052F _ 4C: 8B. B1, 00000148
        mov     rsi, qword [rcx+130H]                   ; 0536 _ 48: 8B. B1, 00000130
        and     rsi, qword [rcx+140H]                   ; 053D _ 48: 23. B1, 00000140
        bsf     rsi, rsi                                ; 0544 _ 48: 0F BC. F6
        cmp     rsi, 2                                  ; 0548 _ 48: 83. FE, 02
        sbb     r13, r13                                ; 054C _ 4D: 19. ED
        or      r13, 01H                                ; 054F _ 49: 83. CD, 01
?_070:  cmp     rsi, rbp                                ; 0553 _ 48: 39. EE
        jz      ?_071                                   ; 0556 _ 74, 1F
        mov     r8, qword [rbx+100H]                    ; 0558 _ 4C: 8B. 83, 00000100
        mov     rdx, rbp                                ; 055F _ 48: 89. EA
        mov     rcx, rbx                                ; 0562 _ 48: 89. D9
        call    _ZNK8Position12attackers_toE6Squarey    ; 0565 _ E8, 00000000(rel)
        test    rax, r14                                ; 056A _ 4C: 85. F0
        jnz     ?_068                                   ; 056D _ 75, 9F
        add     ebp, r13d                               ; 056F _ 44: 01. ED
        movsxd  rbp, ebp                                ; 0572 _ 48: 63. ED
        jmp     ?_070                                   ; 0575 _ EB, DC

?_071:  mov     r8, qword [rel .refptr.SquareBB]        ; 0577 _ 4C: 8B. 05, 00000000(rel)
        mov     rax, qword [rel .refptr.RookAttacks]    ; 057E _ 48: 8B. 05, 00000000(rel)
        mov     rcx, qword [rbx+100H]                   ; 0585 _ 48: 8B. 8B, 00000100
        mov     r9, qword [rel .refptr.RookMasks]       ; 058C _ 4C: 8B. 0D, 00000000(rel)
        xor     rcx, qword [r8+r12*8]                   ; 0593 _ 4B: 33. 0C E0
        mov     rdx, qword [rax+10H]                    ; 0597 _ 48: 8B. 50, 10
        mov     r11, qword [rbx+128H]                   ; 059B _ 4C: 8B. 9B, 00000128
        or      r11, qword [rbx+120H]                   ; 05A2 _ 4C: 0B. 9B, 00000120
        pext    r10, rcx, qword [r9+10H]                ; 05A9 _ C4 42 F2: F5. 51, 10
        and     r11, qword [rbx+148H]                   ; 05AF _ 4C: 23. 9B, 00000148
        mov     ebx, r10d                               ; 05B6 _ 44: 89. D3
        test    qword [rdx+rbx*8], r11                  ; 05B9 _ 4C: 85. 1C DA
        jne     ?_068                                   ; 05BD _ 0F 85, FFFFFF4B
        lea     rax, [rdi+8H]                           ; 05C3 _ 48: 8D. 47, 08
        or      r12d, 0C000H                            ; 05C7 _ 41: 81. CC, 0000C000
        shl     esi, 6                                  ; 05CE _ C1. E6, 06
        or      esi, r12d                               ; 05D1 _ 44: 09. E6
        mov     dword [rdi], esi                        ; 05D4 _ 89. 37
?_072:  add     rsp, 32                                 ; 05D6 _ 48: 83. C4, 20
        pop     rbx                                     ; 05DA _ 5B
        pop     rsi                                     ; 05DB _ 5E
        pop     rdi                                     ; 05DC _ 5F
        pop     rbp                                     ; 05DD _ 5D
        pop     r12                                     ; 05DE _ 41: 5C
        pop     r13                                     ; 05E0 _ 41: 5D
        pop     r14                                     ; 05E2 _ 41: 5E
        ret                                             ; 05E4 _ C3

_ZN12_GLOBAL__N_112generate_allIL5Color1EL7GenType4EEEP7ExtMoveRK8PositionS4_yPK9CheckInfo.isra.59.cold.106:; Local function
        mov     rdx, rbx                                ; 05E5 _ 48: 89. DA
        mov     rcx, rsi                                ; 05E8 _ 48: 89. F1
        call    _ZN12_GLOBAL__N_117generate_castlingIL13CastlingRight4ELb0ELb1EEEP7ExtMoveRK8PositionS3_5ColorPK9CheckInfo.isra.26.constprop.94; 05EB _ E8, 00000119
        mov     rcx, rsi                                ; 05F0 _ 48: 89. F1
        mov     rdx, rax                                ; 05F3 _ 48: 89. C2
        add     rsp, 40                                 ; 05F6 _ 48: 83. C4, 28
        pop     rbx                                     ; 05FA _ 5B
        pop     rsi                                     ; 05FB _ 5E
        pop     rdi                                     ; 05FC _ 5F
        pop     rbp                                     ; 05FD _ 5D
        pop     r12                                     ; 05FE _ 41: 5C
        pop     r13                                     ; 0600 _ 41: 5D
        pop     r14                                     ; 0602 _ 41: 5E
        pop     r15                                     ; 0604 _ 41: 5F
        jmp     _ZN12_GLOBAL__N_117generate_castlingIL13CastlingRight8ELb0ELb1EEEP7ExtMoveRK8PositionS3_5ColorPK9CheckInfo.isra.27.constprop.93; 0606 _ EB, 00

_ZN12_GLOBAL__N_117generate_castlingIL13CastlingRight8ELb0ELb1EEEP7ExtMoveRK8PositionS3_5ColorPK9CheckInfo.isra.27.constprop.93:; Local function
        push    r14                                     ; 0608 _ 41: 56
        push    r13                                     ; 060A _ 41: 55
        push    r12                                     ; 060C _ 41: 54
        push    rbp                                     ; 060E _ 55
        push    rdi                                     ; 060F _ 57
        push    rsi                                     ; 0610 _ 56
        push    rbx                                     ; 0611 _ 53
        sub     rsp, 32                                 ; 0612 _ 48: 83. EC, 20
        mov     rax, qword [rcx+310H]                   ; 0616 _ 48: 8B. 81, 00000310
        test    qword [rcx+100H], rax                   ; 061D _ 48: 85. 81, 00000100
        mov     rbx, rcx                                ; 0624 _ 48: 89. CB
        mov     rdi, rdx                                ; 0627 _ 48: 89. D7
        jz      ?_074                                   ; 062A _ 74, 08
?_073:  mov     rax, rdi                                ; 062C _ 48: 89. F8
        jmp     ?_077                                   ; 062F _ E9, 000000C6

?_074:  mov     rdx, qword [rcx+3B8H]                   ; 0634 _ 48: 8B. 91, 000003B8
        test    byte [rdx+18H], 08H                     ; 063B _ F6. 42, 18, 08
        jz      ?_073                                   ; 063F _ 74, EB
        mov     r12, qword [rcx+290H]                   ; 0641 _ 4C: 8B. A1, 00000290
        mov     ebp, 58                                 ; 0648 _ BD, 0000003A
        mov     r14, qword [rcx+140H]                   ; 064D _ 4C: 8B. B1, 00000140
        mov     rsi, qword [rcx+130H]                   ; 0654 _ 48: 8B. B1, 00000130
        and     rsi, qword [rcx+148H]                   ; 065B _ 48: 23. B1, 00000148
        bsf     rsi, rsi                                ; 0662 _ 48: 0F BC. F6
        cmp     rsi, 58                                 ; 0666 _ 48: 83. FE, 3A
        sbb     r13, r13                                ; 066A _ 4D: 19. ED
        or      r13, 01H                                ; 066D _ 49: 83. CD, 01
?_075:  cmp     rsi, rbp                                ; 0671 _ 48: 39. EE
        jz      ?_076                                   ; 0674 _ 74, 1F
        mov     r8, qword [rbx+100H]                    ; 0676 _ 4C: 8B. 83, 00000100
        mov     rdx, rbp                                ; 067D _ 48: 89. EA
        mov     rcx, rbx                                ; 0680 _ 48: 89. D9
        call    _ZNK8Position12attackers_toE6Squarey    ; 0683 _ E8, 00000000(rel)
        test    rax, r14                                ; 0688 _ 4C: 85. F0
        jnz     ?_073                                   ; 068B _ 75, 9F
        add     ebp, r13d                               ; 068D _ 44: 01. ED
        movsxd  rbp, ebp                                ; 0690 _ 48: 63. ED
        jmp     ?_075                                   ; 0693 _ EB, DC

?_076:  mov     r8, qword [rel .refptr.SquareBB]        ; 0695 _ 4C: 8B. 05, 00000000(rel)
        mov     rax, qword [rel .refptr.RookAttacks]    ; 069C _ 48: 8B. 05, 00000000(rel)
        mov     rcx, qword [rbx+100H]                   ; 06A3 _ 48: 8B. 8B, 00000100
        mov     r9, qword [rel .refptr.RookMasks]       ; 06AA _ 4C: 8B. 0D, 00000000(rel)
        xor     rcx, qword [r8+r12*8]                   ; 06B1 _ 4B: 33. 0C E0
        mov     rdx, qword [rax+1D0H]                   ; 06B5 _ 48: 8B. 90, 000001D0
        mov     r11, qword [rbx+128H]                   ; 06BC _ 4C: 8B. 9B, 00000128
        or      r11, qword [rbx+120H]                   ; 06C3 _ 4C: 0B. 9B, 00000120
        pext    r10, rcx, qword [r9+1D0H]               ; 06CA _ C4 42 F2: F5. 91, 000001D0
        and     r11, qword [rbx+140H]                   ; 06D3 _ 4C: 23. 9B, 00000140
        mov     ebx, r10d                               ; 06DA _ 44: 89. D3
        test    qword [rdx+rbx*8], r11                  ; 06DD _ 4C: 85. 1C DA
        jne     ?_073                                   ; 06E1 _ 0F 85, FFFFFF45
        lea     rax, [rdi+8H]                           ; 06E7 _ 48: 8D. 47, 08
        or      r12d, 0C000H                            ; 06EB _ 41: 81. CC, 0000C000
        shl     esi, 6                                  ; 06F2 _ C1. E6, 06
        or      esi, r12d                               ; 06F5 _ 44: 09. E6
        mov     dword [rdi], esi                        ; 06F8 _ 89. 37
?_077:  add     rsp, 32                                 ; 06FA _ 48: 83. C4, 20
        pop     rbx                                     ; 06FE _ 5B
        pop     rsi                                     ; 06FF _ 5E
        pop     rdi                                     ; 0700 _ 5F
        pop     rbp                                     ; 0701 _ 5D
        pop     r12                                     ; 0702 _ 41: 5C
        pop     r13                                     ; 0704 _ 41: 5D
        pop     r14                                     ; 0706 _ 41: 5E
        ret                                             ; 0708 _ C3

_ZN12_GLOBAL__N_117generate_castlingIL13CastlingRight4ELb0ELb1EEEP7ExtMoveRK8PositionS3_5ColorPK9CheckInfo.isra.26.constprop.94:; Local function
        push    r14                                     ; 0709 _ 41: 56
        push    r13                                     ; 070B _ 41: 55
        push    r12                                     ; 070D _ 41: 54
        push    rbp                                     ; 070F _ 55
        push    rdi                                     ; 0710 _ 57
        push    rsi                                     ; 0711 _ 56
        push    rbx                                     ; 0712 _ 53
        sub     rsp, 32                                 ; 0713 _ 48: 83. EC, 20
        mov     rax, qword [rcx+2F0H]                   ; 0717 _ 48: 8B. 81, 000002F0
        test    qword [rcx+100H], rax                   ; 071E _ 48: 85. 81, 00000100
        mov     rbx, rcx                                ; 0725 _ 48: 89. CB
        mov     rdi, rdx                                ; 0728 _ 48: 89. D7
        jz      ?_079                                   ; 072B _ 74, 08
?_078:  mov     rax, rdi                                ; 072D _ 48: 89. F8
        jmp     ?_082                                   ; 0730 _ E9, 000000C6

?_079:  mov     rdx, qword [rcx+3B8H]                   ; 0735 _ 48: 8B. 91, 000003B8
        test    byte [rdx+18H], 04H                     ; 073C _ F6. 42, 18, 04
        jz      ?_078                                   ; 0740 _ 74, EB
        mov     r12, qword [rcx+270H]                   ; 0742 _ 4C: 8B. A1, 00000270
        mov     ebp, 62                                 ; 0749 _ BD, 0000003E
        mov     r14, qword [rcx+140H]                   ; 074E _ 4C: 8B. B1, 00000140
        mov     rsi, qword [rcx+130H]                   ; 0755 _ 48: 8B. B1, 00000130
        and     rsi, qword [rcx+148H]                   ; 075C _ 48: 23. B1, 00000148
        bsf     rsi, rsi                                ; 0763 _ 48: 0F BC. F6
        cmp     rsi, 62                                 ; 0767 _ 48: 83. FE, 3E
        sbb     r13, r13                                ; 076B _ 4D: 19. ED
        or      r13, 01H                                ; 076E _ 49: 83. CD, 01
?_080:  cmp     rsi, rbp                                ; 0772 _ 48: 39. EE
        jz      ?_081                                   ; 0775 _ 74, 1F
        mov     r8, qword [rbx+100H]                    ; 0777 _ 4C: 8B. 83, 00000100
        mov     rdx, rbp                                ; 077E _ 48: 89. EA
        mov     rcx, rbx                                ; 0781 _ 48: 89. D9
        call    _ZNK8Position12attackers_toE6Squarey    ; 0784 _ E8, 00000000(rel)
        test    rax, r14                                ; 0789 _ 4C: 85. F0
        jnz     ?_078                                   ; 078C _ 75, 9F
        add     ebp, r13d                               ; 078E _ 44: 01. ED
        movsxd  rbp, ebp                                ; 0791 _ 48: 63. ED
        jmp     ?_080                                   ; 0794 _ EB, DC

?_081:  mov     r8, qword [rel .refptr.SquareBB]        ; 0796 _ 4C: 8B. 05, 00000000(rel)
        mov     rax, qword [rel .refptr.RookAttacks]    ; 079D _ 48: 8B. 05, 00000000(rel)
        mov     rcx, qword [rbx+100H]                   ; 07A4 _ 48: 8B. 8B, 00000100
        mov     r9, qword [rel .refptr.RookMasks]       ; 07AB _ 4C: 8B. 0D, 00000000(rel)
        xor     rcx, qword [r8+r12*8]                   ; 07B2 _ 4B: 33. 0C E0
        mov     rdx, qword [rax+1F0H]                   ; 07B6 _ 48: 8B. 90, 000001F0
        mov     r11, qword [rbx+128H]                   ; 07BD _ 4C: 8B. 9B, 00000128
        or      r11, qword [rbx+120H]                   ; 07C4 _ 4C: 0B. 9B, 00000120
        pext    r10, rcx, qword [r9+1F0H]               ; 07CB _ C4 42 F2: F5. 91, 000001F0
        and     r11, qword [rbx+140H]                   ; 07D4 _ 4C: 23. 9B, 00000140
        mov     ebx, r10d                               ; 07DB _ 44: 89. D3
        test    qword [rdx+rbx*8], r11                  ; 07DE _ 4C: 85. 1C DA
        jne     ?_078                                   ; 07E2 _ 0F 85, FFFFFF45
        lea     rax, [rdi+8H]                           ; 07E8 _ 48: 8D. 47, 08
        or      r12d, 0C000H                            ; 07EC _ 41: 81. CC, 0000C000
        shl     esi, 6                                  ; 07F3 _ C1. E6, 06
        or      esi, r12d                               ; 07F6 _ 44: 09. E6
        mov     dword [rdi], esi                        ; 07F9 _ 89. 37
?_082:  add     rsp, 32                                 ; 07FB _ 48: 83. C4, 20
        pop     rbx                                     ; 07FF _ 5B
        pop     rsi                                     ; 0800 _ 5E
        pop     rdi                                     ; 0801 _ 5F
        pop     rbp                                     ; 0802 _ 5D
        pop     r12                                     ; 0803 _ 41: 5C
        pop     r13                                     ; 0805 _ 41: 5D
        pop     r14                                     ; 0807 _ 41: 5E
        ret                                             ; 0809 _ C3

        nop                                             ; 080A _ 90
        nop                                             ; 080B _ 90
        nop                                             ; 080C _ 90
        nop                                             ; 080D _ 90
        nop                                             ; 080E _ 90
        nop                                             ; 080F _ 90


SECTION .text.hot align=16 execute                      ; section number 5, code

.text.hot:; Local function

_Z8generateIL7GenType5EEP7ExtMoveRK8PositionS2_:
        push    r13                                     ; 0000 _ 41: 55
        push    r12                                     ; 0002 _ 41: 54
        push    rbp                                     ; 0004 _ 55
        push    rdi                                     ; 0005 _ 57
        push    rsi                                     ; 0006 _ 56
        push    rbx                                     ; 0007 _ 53
        sub     rsp, 40                                 ; 0008 _ 48: 83. EC, 28
        mov     rbx, rdx                                ; 000C _ 48: 89. D3
        mov     edx, dword [rcx+3ACH]                   ; 000F _ 8B. 91, 000003AC
        mov     r12, rcx                                ; 0015 _ 49: 89. CC
        mov     r8d, edx                                ; 0018 _ 41: 89. D0
        call    _ZNK8Position14check_blockersE5ColorS0_ ; 001B _ E8, 00000000(rel)
        mov     edx, dword [r12+3ACH]                   ; 0020 _ 41: 8B. 94 24, 000003AC
        mov     rcx, qword [r12+3B8H]                   ; 0028 _ 49: 8B. 8C 24, 000003B8
        mov     r13, rax                                ; 0030 _ 49: 89. C5
        mov     rdi, qword [r12+rdx*8+140H]             ; 0033 _ 49: 8B. BC D4, 00000140
        mov     rax, rdx                                ; 003B _ 48: 89. D0
        and     rdi, qword [r12+130H]                   ; 003E _ 49: 23. BC 24, 00000130
        bsf     rdi, rdi                                ; 0046 _ 48: 0F BC. FF
        cmp     qword [rcx+38H], 0                      ; 004A _ 48: 83. 79, 38, 00
        jne     ?_108                                   ; 004F _ 0F 85, 00000320
        movsxd  rsi, edx                                ; 0055 _ 48: 63. F2
        test    eax, eax                                ; 0058 _ 85. C0
        mov     rdx, rbx                                ; 005A _ 48: 89. DA
        mov     r8, qword [r12+rsi*8+140H]              ; 005D _ 4D: 8B. 84 F4, 00000140
        mov     rcx, r12                                ; 0065 _ 4C: 89. E1
        not     r8                                      ; 0068 _ 49: F7. D0
        jne     ?_107                                   ; 006B _ 0F 85, 000002F7
        call    _ZN12_GLOBAL__N_112generate_allIL5Color0EL7GenType4EEEP7ExtMoveRK8PositionS4_yPK9CheckInfo.isra.54; 0071 _ E8, 0000031A
        mov     rbp, rax                                ; 0076 _ 48: 89. C5
?_083:  cmp     rbp, rbx                                ; 0079 _ 48: 39. DD
        je      ?_102                                   ; 007C _ 0F 84, 0000025E
        test    r13, r13                                ; 0082 _ 4D: 85. ED
        jne     ?_098                                   ; 0085 _ 0F 85, 000001EE
        mov     edx, dword [rbx]                        ; 008B _ 8B. 13
        mov     rsi, rbp                                ; 008D _ 48: 89. EE
        sub     rsi, rbx                                ; 0090 _ 48: 29. DE
        sub     rsi, 8                                  ; 0093 _ 48: 83. EE, 08
        shr     rsi, 3                                  ; 0097 _ 48: C1. EE, 03
        mov     r8d, edx                                ; 009B _ 41: 89. D0
        and     esi, 03H                                ; 009E _ 83. E6, 03
        sar     r8d, 6                                  ; 00A1 _ 41: C1. F8, 06
        and     r8d, 3FH                                ; 00A5 _ 41: 83. E0, 3F
        cmp     rdi, r8                                 ; 00A9 _ 4C: 39. C7
        je      ?_103                                   ; 00AC _ 0F 84, 0000023E
        mov     r9d, edx                                ; 00B2 _ 41: 89. D1
        and     r9d, 0C000H                             ; 00B5 _ 41: 81. E1, 0000C000
        cmp     r9d, 32768                              ; 00BC _ 41: 81. F9, 00008000
        je      ?_103                                   ; 00C3 _ 0F 84, 00000227
?_084:  add     rbx, 8                                  ; 00C9 _ 48: 83. C3, 08
        cmp     rbp, rbx                                ; 00CD _ 48: 39. DD
        je      ?_102                                   ; 00D0 _ 0F 84, 0000020A
        test    rsi, rsi                                ; 00D6 _ 48: 85. F6
        je      ?_094                                   ; 00D9 _ 0F 84, 00000158
        cmp     rsi, 1                                  ; 00DF _ 48: 83. FE, 01
        jz      ?_088                                   ; 00E3 _ 74, 62
        cmp     rsi, 2                                  ; 00E5 _ 48: 83. FE, 02
        jz      ?_086                                   ; 00E9 _ 74, 31
        mov     edx, dword [rbx]                        ; 00EB _ 8B. 13
        mov     r10d, edx                               ; 00ED _ 41: 89. D2
        sar     r10d, 6                                 ; 00F0 _ 41: C1. FA, 06
        and     r10d, 3FH                               ; 00F4 _ 41: 83. E2, 3F
        cmp     rdi, r10                                ; 00F8 _ 4C: 39. D7
        je      ?_104                                   ; 00FB _ 0F 84, 0000020F
        mov     r11d, edx                               ; 0101 _ 41: 89. D3
        and     r11d, 0C000H                            ; 0104 _ 41: 81. E3, 0000C000
        cmp     r11d, 32768                             ; 010B _ 41: 81. FB, 00008000
        je      ?_104                                   ; 0112 _ 0F 84, 000001F8
?_085:  add     rbx, 8                                  ; 0118 _ 48: 83. C3, 08
?_086:  mov     edx, dword [rbx]                        ; 011C _ 8B. 13
        mov     eax, edx                                ; 011E _ 89. D0
        sar     eax, 6                                  ; 0120 _ C1. F8, 06
        and     eax, 3FH                                ; 0123 _ 83. E0, 3F
        cmp     rdi, rax                                ; 0126 _ 48: 39. C7
        je      ?_105                                   ; 0129 _ 0F 84, 00000201
        mov     ecx, edx                                ; 012F _ 89. D1
        and     ecx, 0C000H                             ; 0131 _ 81. E1, 0000C000
        cmp     ecx, 32768                              ; 0137 _ 81. F9, 00008000
        je      ?_105                                   ; 013D _ 0F 84, 000001ED
?_087:  add     rbx, 8                                  ; 0143 _ 48: 83. C3, 08
?_088:  mov     edx, dword [rbx]                        ; 0147 _ 8B. 13
        mov     esi, edx                                ; 0149 _ 89. D6
        sar     esi, 6                                  ; 014B _ C1. FE, 06
        and     esi, 3FH                                ; 014E _ 83. E6, 3F
        cmp     rdi, rsi                                ; 0151 _ 48: 39. F7
        je      ?_106                                   ; 0154 _ 0F 84, 000001F6
        mov     r8d, edx                                ; 015A _ 41: 89. D0
        and     r8d, 0C000H                             ; 015D _ 41: 81. E0, 0000C000
        cmp     r8d, 32768                              ; 0164 _ 41: 81. F8, 00008000
        je      ?_106                                   ; 016B _ 0F 84, 000001DF
?_089:  add     rbx, 8                                  ; 0171 _ 48: 83. C3, 08
        cmp     rbp, rbx                                ; 0175 _ 48: 39. DD
        jne     ?_094                                   ; 0178 _ 0F 85, 000000B9
        jmp     ?_102                                   ; 017E _ E9, 0000015D

?_090:  mov     r10d, edx                               ; 0183 _ 41: 89. D2
        and     r10d, 0C000H                            ; 0186 _ 41: 81. E2, 0000C000
        cmp     r10d, 32768                             ; 018D _ 41: 81. FA, 00008000
        je      ?_095                                   ; 0194 _ 0F 84, 000000B3
?_091:  lea     rsi, [rbx+8H]                           ; 019A _ 48: 8D. 73, 08
        mov     edx, dword [rsi]                        ; 019E _ 8B. 16
        mov     rbx, rsi                                ; 01A0 _ 48: 89. F3
        mov     r11d, edx                               ; 01A3 _ 41: 89. D3
        sar     r11d, 6                                 ; 01A6 _ 41: C1. FB, 06
        and     r11d, 3FH                               ; 01AA _ 41: 83. E3, 3F
        cmp     rdi, r11                                ; 01AE _ 4C: 39. DF
        je      ?_099                                   ; 01B1 _ 0F 84, 000000D9
        mov     eax, edx                                ; 01B7 _ 89. D0
        and     eax, 0C000H                             ; 01B9 _ 25, 0000C000
        cmp     eax, 32768                              ; 01BE _ 3D, 00008000
        je      ?_099                                   ; 01C3 _ 0F 84, 000000C7
?_092:  mov     edx, dword [rsi+8H]                     ; 01C9 _ 8B. 56, 08
        lea     rbx, [rsi+8H]                           ; 01CC _ 48: 8D. 5E, 08
        mov     ecx, edx                                ; 01D0 _ 89. D1
        sar     ecx, 6                                  ; 01D2 _ C1. F9, 06
        and     ecx, 3FH                                ; 01D5 _ 83. E1, 3F
        cmp     rdi, rcx                                ; 01D8 _ 48: 39. CF
        je      ?_100                                   ; 01DB _ 0F 84, 000000C4
        mov     r8d, edx                                ; 01E1 _ 41: 89. D0
        and     r8d, 0C000H                             ; 01E4 _ 41: 81. E0, 0000C000
        cmp     r8d, 32768                              ; 01EB _ 41: 81. F8, 00008000
        je      ?_100                                   ; 01F2 _ 0F 84, 000000AD
?_093:  mov     edx, dword [rsi+10H]                    ; 01F8 _ 8B. 56, 10
        lea     rbx, [rsi+10H]                          ; 01FB _ 48: 8D. 5E, 10
        mov     r9d, edx                                ; 01FF _ 41: 89. D1
        sar     r9d, 6                                  ; 0202 _ 41: C1. F9, 06
        and     r9d, 3FH                                ; 0206 _ 41: 83. E1, 3F
        cmp     rdi, r9                                 ; 020A _ 4C: 39. CF
        je      ?_101                                   ; 020D _ 0F 84, 000000AD
        mov     r10d, edx                               ; 0213 _ 41: 89. D2
        and     r10d, 0C000H                            ; 0216 _ 41: 81. E2, 0000C000
        cmp     r10d, 32768                             ; 021D _ 41: 81. FA, 00008000
        je      ?_101                                   ; 0224 _ 0F 84, 00000096
        lea     rbx, [rsi+18H]                          ; 022A _ 48: 8D. 5E, 18
        cmp     rbp, rbx                                ; 022E _ 48: 39. DD
        je      ?_102                                   ; 0231 _ 0F 84, 000000A9
?_094:  mov     edx, dword [rbx]                        ; 0237 _ 8B. 13
        mov     r9d, edx                                ; 0239 _ 41: 89. D1
        sar     r9d, 6                                  ; 023C _ 41: C1. F9, 06
        and     r9d, 3FH                                ; 0240 _ 41: 83. E1, 3F
        cmp     rdi, r9                                 ; 0244 _ 4C: 39. CF
        jne     ?_090                                   ; 0247 _ 0F 85, FFFFFF36
?_095:  xor     r8d, r8d                                ; 024D _ 45: 31. C0
        mov     rcx, r12                                ; 0250 _ 4C: 89. E1
        call    _ZNK8Position5legalE4Movey              ; 0253 _ E8, 00000000(rel)
        test    al, al                                  ; 0258 _ 84. C0
        jne     ?_091                                   ; 025A _ 0F 85, FFFFFF3A
?_096:  sub     rbp, 8                                  ; 0260 _ 48: 83. ED, 08
        mov     edx, dword [rbp]                        ; 0264 _ 8B. 55, 00
        mov     dword [rbx], edx                        ; 0267 _ 89. 13
        jmp     ?_083                                   ; 0269 _ E9, FFFFFE0B

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_097:  add     rbx, 8                                  ; 0270 _ 48: 83. C3, 08
        cmp     rbp, rbx                                ; 0274 _ 48: 39. DD
        jz      ?_102                                   ; 0277 _ 74, 67
?_098:  mov     edx, dword [rbx]                        ; 0279 _ 8B. 13
        mov     r8, r13                                 ; 027B _ 4D: 89. E8
        mov     rcx, r12                                ; 027E _ 4C: 89. E1
        call    _ZNK8Position5legalE4Movey              ; 0281 _ E8, 00000000(rel)
        test    al, al                                  ; 0286 _ 84. C0
        jnz     ?_097                                   ; 0288 _ 75, E6
        jmp     ?_096                                   ; 028A _ EB, D4

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_099:  xor     r8d, r8d                                ; 0290 _ 45: 31. C0
        mov     rcx, r12                                ; 0293 _ 4C: 89. E1
        call    _ZNK8Position5legalE4Movey              ; 0296 _ E8, 00000000(rel)
        test    al, al                                  ; 029B _ 84. C0
        jne     ?_092                                   ; 029D _ 0F 85, FFFFFF26
        jmp     ?_096                                   ; 02A3 _ EB, BB

?_100:  xor     r8d, r8d                                ; 02A5 _ 45: 31. C0
        mov     rcx, r12                                ; 02A8 _ 4C: 89. E1
        call    _ZNK8Position5legalE4Movey              ; 02AB _ E8, 00000000(rel)
        test    al, al                                  ; 02B0 _ 84. C0
        jne     ?_093                                   ; 02B2 _ 0F 85, FFFFFF40
        jmp     ?_096                                   ; 02B8 _ EB, A6

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_101:  xor     r8d, r8d                                ; 02C0 _ 45: 31. C0
        mov     rcx, r12                                ; 02C3 _ 4C: 89. E1
        call    _ZNK8Position5legalE4Movey              ; 02C6 _ E8, 00000000(rel)
        test    al, al                                  ; 02CB _ 84. C0
        jz      ?_096                                   ; 02CD _ 74, 91
        lea     rbx, [rsi+18H]                          ; 02CF _ 48: 8D. 5E, 18
        cmp     rbp, rbx                                ; 02D3 _ 48: 39. DD
        jne     ?_094                                   ; 02D6 _ 0F 85, FFFFFF5B
; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_102:  mov     rax, rbx                                ; 02E0 _ 48: 89. D8
        add     rsp, 40                                 ; 02E3 _ 48: 83. C4, 28
        pop     rbx                                     ; 02E7 _ 5B
        pop     rsi                                     ; 02E8 _ 5E
        pop     rdi                                     ; 02E9 _ 5F
        pop     rbp                                     ; 02EA _ 5D
        pop     r12                                     ; 02EB _ 41: 5C
        pop     r13                                     ; 02ED _ 41: 5D
        ret                                             ; 02EF _ C3

?_103:  xor     r8d, r8d                                ; 02F0 _ 45: 31. C0
        mov     rcx, r12                                ; 02F3 _ 4C: 89. E1
        call    _ZNK8Position5legalE4Movey              ; 02F6 _ E8, 00000000(rel)
        test    al, al                                  ; 02FB _ 84. C0
        jne     ?_084                                   ; 02FD _ 0F 85, FFFFFDC6
        jmp     ?_096                                   ; 0303 _ E9, FFFFFF58

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_104:  xor     r8d, r8d                                ; 0310 _ 45: 31. C0
        mov     rcx, r12                                ; 0313 _ 4C: 89. E1
        call    _ZNK8Position5legalE4Movey              ; 0316 _ E8, 00000000(rel)
        test    al, al                                  ; 031B _ 84. C0
        jne     ?_085                                   ; 031D _ 0F 85, FFFFFDF5
        jmp     ?_096                                   ; 0323 _ E9, FFFFFF38

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_105:  xor     r8d, r8d                                ; 0330 _ 45: 31. C0
        mov     rcx, r12                                ; 0333 _ 4C: 89. E1
        call    _ZNK8Position5legalE4Movey              ; 0336 _ E8, 00000000(rel)
        test    al, al                                  ; 033B _ 84. C0
        jne     ?_087                                   ; 033D _ 0F 85, FFFFFE00
        jmp     ?_096                                   ; 0343 _ E9, FFFFFF18

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_106:  xor     r8d, r8d                                ; 0350 _ 45: 31. C0
        mov     rcx, r12                                ; 0353 _ 4C: 89. E1
        call    _ZNK8Position5legalE4Movey              ; 0356 _ E8, 00000000(rel)
        test    al, al                                  ; 035B _ 84. C0
        jne     ?_089                                   ; 035D _ 0F 85, FFFFFE0E
        jmp     ?_096                                   ; 0363 _ E9, FFFFFEF8

?_107:  call    _ZN12_GLOBAL__N_112generate_allIL5Color1EL7GenType4EEEP7ExtMoveRK8PositionS4_yPK9CheckInfo.isra.59; 0368 _ E8, 00000000(rel)
        mov     rbp, rax                                ; 036D _ 48: 89. C5
        jmp     ?_083                                   ; 0370 _ E9, FFFFFD04

?_108:  ; Local function
        mov     rdx, rbx                                ; 0375 _ 48: 89. DA
        mov     rcx, r12                                ; 0378 _ 4C: 89. E1
        call    _Z8generateIL7GenType3EEP7ExtMoveRK8PositionS2_; 037B _ E8, 000014B0
        mov     rbp, rax                                ; 0380 _ 48: 89. C5
        jmp     ?_083                                   ; 0383 _ E9, FFFFFCF1

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZN12_GLOBAL__N_112generate_allIL5Color0EL7GenType4EEEP7ExtMoveRK8PositionS4_yPK9CheckInfo.isra.54:; Local function
        push    r15                                     ; 0390 _ 41: 57
        push    r14                                     ; 0392 _ 41: 56
        push    r13                                     ; 0394 _ 41: 55
        push    r12                                     ; 0396 _ 41: 54
        push    rbp                                     ; 0398 _ 55
        push    rdi                                     ; 0399 _ 57
        push    rsi                                     ; 039A _ 56
        push    rbx                                     ; 039B _ 53
        sub     rsp, 40                                 ; 039C _ 48: 83. EC, 28
        mov     r13, qword 0FF00FFFFFFFFFFFFH           ; 03A0 _ 49: BD, FF00FFFFFFFFFFFF
        mov     rbp, qword 0FF000000000000H             ; 03AA _ 48: BD, 00FF000000000000
        mov     rax, qword [rcx+140H]                   ; 03B4 _ 48: 8B. 81, 00000140
        mov     rdi, qword [rcx+148H]                   ; 03BB _ 48: 8B. B9, 00000148
        mov     r12, rax                                ; 03C2 _ 49: 89. C4
        and     r12, qword [rcx+108H]                   ; 03C5 _ 4C: 23. A1, 00000108
        mov     rsi, rcx                                ; 03CC _ 48: 89. CE
        mov     rbx, rdx                                ; 03CF _ 48: 89. D3
        mov     rcx, qword [rcx+100H]                   ; 03D2 _ 48: 8B. 89, 00000100
        and     r13, r12                                ; 03D9 _ 4D: 21. E5
        and     rbp, r12                                ; 03DC _ 4C: 21. E5
        mov     r14, rcx                                ; 03DF _ 49: 89. CE
        mov     r10, r13                                ; 03E2 _ 4D: 89. EA
        not     r14                                     ; 03E5 _ 49: F7. D6
        shl     r10, 8                                  ; 03E8 _ 49: C1. E2, 08
        and     r10, r14                                ; 03EC _ 4D: 21. F2
        mov     r11, r10                                ; 03EF _ 4D: 89. D3
        and     r11d, 0FF0000H                          ; 03F2 _ 41: 81. E3, 00FF0000
        shl     r11, 8                                  ; 03F9 _ 49: C1. E3, 08
        and     r11, r14                                ; 03FD _ 4D: 21. F3
        test    r10, r10                                ; 0400 _ 4D: 85. D2
        jz      ?_110                                   ; 0403 _ 74, 20
?_109:  bsf     rdx, r10                                ; 0405 _ 49: 0F BC. D2
        lea     r9d, [rdx-8H]                           ; 0409 _ 44: 8D. 4A, F8
        add     rbx, 8                                  ; 040D _ 48: 83. C3, 08
        blsr    r10, r10                                ; 0411 _ C4 C2 A8: F3. CA
        shl     r9d, 6                                  ; 0416 _ 41: C1. E1, 06
        or      edx, r9d                                ; 041A _ 44: 09. CA
        test    r10, r10                                ; 041D _ 4D: 85. D2
        mov     dword [rbx-8H], edx                     ; 0420 _ 89. 53, F8
        jnz     ?_109                                   ; 0423 _ 75, E0
?_110:  test    r11, r11                                ; 0425 _ 4D: 85. DB
        jz      ?_112                                   ; 0428 _ 74, 20
?_111:  bsf     r15, r11                                ; 042A _ 4D: 0F BC. FB
        lea     edx, [r15-10H]                          ; 042E _ 41: 8D. 57, F0
        add     rbx, 8                                  ; 0432 _ 48: 83. C3, 08
        blsr    r11, r11                                ; 0436 _ C4 C2 A0: F3. CB
        shl     edx, 6                                  ; 043B _ C1. E2, 06
        or      r15d, edx                               ; 043E _ 41: 09. D7
        test    r11, r11                                ; 0441 _ 4D: 85. DB
        mov     dword [rbx-8H], r15d                    ; 0444 _ 44: 89. 7B, F8
        jnz     ?_111                                   ; 0448 _ 75, E0
?_112:  test    rbp, rbp                                ; 044A _ 48: 85. ED
        jne     ?_136                                   ; 044D _ 0F 85, 000001EA
?_113:  mov     r14, qword 7F007F7F7F7F7F7FH            ; 0453 _ 49: BE, 7F007F7F7F7F7F7F
        mov     r11, qword 0FE00FEFEFEFEFEFEH           ; 045D _ 49: BB, FE00FEFEFEFEFEFE
        and     r14, r12                                ; 0467 _ 4D: 21. E6
        and     r12, r11                                ; 046A _ 4D: 21. DC
        shl     r12, 7                                  ; 046D _ 49: C1. E4, 07
        shl     r14, 9                                  ; 0471 _ 49: C1. E6, 09
        and     r12, rdi                                ; 0475 _ 49: 21. FC
        and     r14, rdi                                ; 0478 _ 49: 21. FE
        jne     ?_150                                   ; 047B _ 0F 85, 000003D9
?_114:  test    r12, r12                                ; 0481 _ 4D: 85. E4
        jne     ?_149                                   ; 0484 _ 0F 85, 000003A9
?_115:  mov     r12, qword [rsi+3B8H]                   ; 048A _ 4C: 8B. A6, 000003B8
        mov     r9, qword [rel .refptr.StepAttacksBB]   ; 0491 _ 4C: 8B. 0D, 00000000(rel)
        mov     rdx, qword [r12+28H]                    ; 0498 _ 49: 8B. 54 24, 28
        cmp     rdx, 64                                 ; 049D _ 48: 83. FA, 40
        jne     ?_152                                   ; 04A1 _ 0F 85, 000003F1
?_116:  mov     r15, rax                                ; 04A7 _ 49: 89. C7
        and     r15, qword [rsi+110H]                   ; 04AA _ 4C: 23. BE, 00000110
        jne     ?_129                                   ; 04B1 _ 0F 85, 000000EB
?_117:  mov     rdx, rax                                ; 04B7 _ 48: 89. C2
        and     rdx, qword [rsi+118H]                   ; 04BA _ 48: 23. 96, 00000118
        jne     ?_132                                   ; 04C1 _ 0F 85, 0000011C
?_118:  mov     r10, rax                                ; 04C7 _ 49: 89. C2
        and     r10, qword [rsi+120H]                   ; 04CA _ 4C: 23. 96, 00000120
        jz      ?_121                                   ; 04D1 _ 74, 3A
        mov     r13, qword [rel .refptr.RookMasks]      ; 04D3 _ 4C: 8B. 2D, 00000000(rel)
        mov     rbp, qword [rel .refptr.RookAttacks]    ; 04DA _ 48: 8B. 2D, 00000000(rel)
?_119:  bsf     r11, r10                                ; 04E1 _ 4D: 0F BC. DA
        mov     r14, qword [rbp+r11*8]                  ; 04E5 _ 4E: 8B. 74 DD, 00
        pext    rdx, rcx, qword [r13+r11*8]             ; 04EA _ C4 82 F2: F5. 54 DD, 00
        mov     edx, edx                                ; 04F1 _ 89. D2
        blsr    r10, r10                                ; 04F3 _ C4 C2 A8: F3. CA
        mov     r15, r8                                 ; 04F8 _ 4D: 89. C7
        and     r15, qword [r14+rdx*8]                  ; 04FB _ 4D: 23. 3C D6
        mov     rdx, r15                                ; 04FF _ 4C: 89. FA
        jne     ?_130                                   ; 0502 _ 0F 85, 000000B8
?_120:  test    r10, r10                                ; 0508 _ 4D: 85. D2
        jnz     ?_119                                   ; 050B _ 75, D4
?_121:  mov     rbp, rax                                ; 050D _ 48: 89. C5
        and     rbp, qword [rsi+128H]                   ; 0510 _ 48: 23. AE, 00000128
        jne     ?_145                                   ; 0517 _ 0F 85, 0000029F
?_122:  and     rax, qword [rsi+130H]                   ; 051D _ 48: 23. 86, 00000130
        bsf     r15, rax                                ; 0524 _ 4C: 0F BC. F8
        and     r8, qword [r9+r15*8+0C00H]              ; 0528 _ 4F: 23. 84 F9, 00000C00
        jz      ?_124                                   ; 0530 _ 74, 27
        mov     r9d, r15d                               ; 0532 _ 45: 89. F9
        shl     r9d, 6                                  ; 0535 _ 41: C1. E1, 06
; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_123:  bsf     r14, r8                                 ; 0540 _ 4D: 0F BC. F0
        add     rbx, 8                                  ; 0544 _ 48: 83. C3, 08
        or      r14d, r9d                               ; 0548 _ 45: 09. CE
        blsr    r8, r8                                  ; 054B _ C4 C2 B8: F3. C8
        test    r8, r8                                  ; 0550 _ 4D: 85. C0
        mov     dword [rbx-8H], r14d                    ; 0553 _ 44: 89. 73, F8
        jnz     ?_123                                   ; 0557 _ 75, E7
?_124:  mov     r8d, dword [r12+18H]                    ; 0559 _ 45: 8B. 44 24, 18
        test    r8b, 03H                                ; 055E _ 41: F6. C0, 03
        jne     ?_140                                   ; 0562 _ 0F 85, 0000016F
?_125:  mov     rax, rbx                                ; 0568 _ 48: 89. D8
        add     rsp, 40                                 ; 056B _ 48: 83. C4, 28
        pop     rbx                                     ; 056F _ 5B
        pop     rsi                                     ; 0570 _ 5E
        pop     rdi                                     ; 0571 _ 5F
        pop     rbp                                     ; 0572 _ 5D
        pop     r12                                     ; 0573 _ 41: 5C
        pop     r13                                     ; 0575 _ 41: 5D
        pop     r14                                     ; 0577 _ 41: 5E
        pop     r15                                     ; 0579 _ 41: 5F
        ret                                             ; 057B _ C3

?_126:  shl     r13d, 6                                 ; 057C _ 41: C1. E5, 06
?_127:  bsf     r11, rbp                                ; 0580 _ 4C: 0F BC. DD
        add     rbx, 8                                  ; 0584 _ 48: 83. C3, 08
        or      r11d, r13d                              ; 0588 _ 45: 09. EB
        blsr    rbp, rbp                                ; 058B _ C4 E2 D0: F3. CD
        test    rbp, rbp                                ; 0590 _ 48: 85. ED
        mov     dword [rbx-8H], r11d                    ; 0593 _ 44: 89. 5B, F8
        jnz     ?_127                                   ; 0597 _ 75, E7
?_128:  test    r15, r15                                ; 0599 _ 4D: 85. FF
        je      ?_117                                   ; 059C _ 0F 84, FFFFFF15
?_129:  bsf     r13, r15                                ; 05A2 _ 4D: 0F BC. EF
        mov     rbp, r8                                 ; 05A6 _ 4C: 89. C5
        blsr    r15, r15                                ; 05A9 _ C4 C2 80: F3. CF
        and     rbp, qword [r9+r13*8+400H]              ; 05AE _ 4B: 23. AC E9, 00000400
        jz      ?_128                                   ; 05B6 _ 74, E1
        jmp     ?_126                                   ; 05B8 _ EB, C2

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_130:  shl     r11d, 6                                 ; 05C0 _ 41: C1. E3, 06
?_131:  bsf     r14, rdx                                ; 05C4 _ 4C: 0F BC. F2
        add     rbx, 8                                  ; 05C8 _ 48: 83. C3, 08
        or      r14d, r11d                              ; 05CC _ 45: 09. DE
        blsr    rdx, rdx                                ; 05CF _ C4 E2 E8: F3. CA
        test    rdx, rdx                                ; 05D4 _ 48: 85. D2
        mov     dword [rbx-8H], r14d                    ; 05D7 _ 44: 89. 73, F8
        je      ?_120                                   ; 05DB _ 0F 84, FFFFFF27
        jmp     ?_131                                   ; 05E1 _ EB, E1

?_132:  mov     r13, qword [rel .refptr.BishopMasks]    ; 05E3 _ 4C: 8B. 2D, 00000000(rel)
        mov     rbp, qword [rel .refptr.BishopAttacks]  ; 05EA _ 48: 8B. 2D, 00000000(rel)
?_133:  bsf     r11, rdx                                ; 05F1 _ 4C: 0F BC. DA
        pext    r14, rcx, qword [r13+r11*8]             ; 05F5 _ C4 02 F2: F5. 74 DD, 00
        mov     r10d, r14d                              ; 05FC _ 45: 89. F2
        mov     r14, qword [rbp+r11*8]                  ; 05FF _ 4E: 8B. 74 DD, 00
        mov     r15, r8                                 ; 0604 _ 4D: 89. C7
        blsr    rdx, rdx                                ; 0607 _ C4 E2 E8: F3. CA
        and     r15, qword [r14+r10*8]                  ; 060C _ 4F: 23. 3C D6
        mov     r10, r15                                ; 0610 _ 4D: 89. FA
        jz      ?_135                                   ; 0613 _ 74, 1D
        shl     r11d, 6                                 ; 0615 _ 41: C1. E3, 06
?_134:  bsf     r14, r10                                ; 0619 _ 4D: 0F BC. F2
        add     rbx, 8                                  ; 061D _ 48: 83. C3, 08
        or      r14d, r11d                              ; 0621 _ 45: 09. DE
        blsr    r10, r10                                ; 0624 _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 0629 _ 4D: 85. D2
        mov     dword [rbx-8H], r14d                    ; 062C _ 44: 89. 73, F8
        jnz     ?_134                                   ; 0630 _ 75, E7
?_135:  test    rdx, rdx                                ; 0632 _ 48: 85. D2
        je      ?_118                                   ; 0635 _ 0F 84, FFFFFE8C
        jmp     ?_133                                   ; 063B _ EB, B4

?_136:  mov     rdx, qword 7F000000000000H              ; 063D _ 48: BA, 007F000000000000
        shl     rbp, 8                                  ; 0647 _ 48: C1. E5, 08
        mov     r15, qword 0FE000000000000H             ; 064B _ 49: BF, 00FE000000000000
        and     rdx, r12                                ; 0655 _ 4C: 21. E2
        and     r15, r12                                ; 0658 _ 4D: 21. E7
        and     r14, rbp                                ; 065B _ 49: 21. EE
        shl     rdx, 9                                  ; 065E _ 48: C1. E2, 09
        shl     r15, 7                                  ; 0662 _ 49: C1. E7, 07
        and     rdx, rdi                                ; 0666 _ 48: 21. FA
        and     r15, rdi                                ; 0669 _ 49: 21. FF
?_137:  test    rdx, rdx                                ; 066C _ 48: 85. D2
        jne     ?_155                                   ; 066F _ 0F 85, 0000029A
?_138:  test    r15, r15                                ; 0675 _ 4D: 85. FF
        jne     ?_154                                   ; 0678 _ 0F 85, 00000248
        test    r14, r14                                ; 067E _ 4D: 85. F6
        je      ?_113                                   ; 0681 _ 0F 84, FFFFFDCC
?_139:  bsf     rbp, r14                                ; 0687 _ 49: 0F BC. EE
        lea     edx, [rbp-8H]                           ; 068B _ 8D. 55, F8
        add     rbx, 32                                 ; 068E _ 48: 83. C3, 20
        blsr    r14, r14                                ; 0692 _ C4 C2 88: F3. CE
        shl     edx, 6                                  ; 0697 _ C1. E2, 06
        or      edx, ebp                                ; 069A _ 09. EA
        mov     r10d, edx                               ; 069C _ 41: 89. D2
        mov     r9d, edx                                ; 069F _ 41: 89. D1
        mov     r15d, edx                               ; 06A2 _ 41: 89. D7
        or      r10d, 7000H                             ; 06A5 _ 41: 81. CA, 00007000
        or      r9d, 6000H                              ; 06AC _ 41: 81. C9, 00006000
        or      r15d, 5000H                             ; 06B3 _ 41: 81. CF, 00005000
        mov     dword [rbx-20H], r10d                   ; 06BA _ 44: 89. 53, E0
        or      dh, 40H                                 ; 06BE _ 80. CE, 40
        mov     dword [rbx-18H], r9d                    ; 06C1 _ 44: 89. 4B, E8
        mov     dword [rbx-10H], r15d                   ; 06C5 _ 44: 89. 7B, F0
        test    r14, r14                                ; 06C9 _ 4D: 85. F6
        mov     dword [rbx-8H], edx                     ; 06CC _ 89. 53, F8
        je      ?_113                                   ; 06CF _ 0F 84, FFFFFD7E
        jmp     ?_139                                   ; 06D5 _ EB, B0

?_140:  cmp     byte [rsi+3C0H], 0                      ; 06D7 _ 80. BE, 000003C0, 00
        jne     _ZN12_GLOBAL__N_112generate_allIL5Color0EL7GenType4EEEP7ExtMoveRK8PositionS4_yPK9CheckInfo.isra.54.cold.104; 06DE _ 0F 85, 00000000(rel)
        test    qword [rsi+2D8H], rcx                   ; 06E4 _ 48: 85. 8E, 000002D8
        jnz     ?_143                                   ; 06EB _ 75, 5A
        and     r8b, 01H                                ; 06ED _ 41: 80. E0, 01
        jz      ?_143                                   ; 06F1 _ 74, 54
        bsf     rbp, rax                                ; 06F3 _ 48: 0F BC. E8
        cmp     rbp, 6                                  ; 06F7 _ 48: 83. FD, 06
        mov     r13, qword [rsi+258H]                   ; 06FB _ 4C: 8B. AE, 00000258
        mov     r12d, 6                                 ; 0702 _ 41: BC, 00000006
        jz      ?_142                                   ; 0708 _ 74, 27
?_141:  mov     r8, qword [rsi+100H]                    ; 070A _ 4C: 8B. 86, 00000100
        mov     rdx, r12                                ; 0711 _ 4C: 89. E2
        mov     rcx, rsi                                ; 0714 _ 48: 89. F1
        call    _ZNK8Position12attackers_toE6Squarey    ; 0717 _ E8, 00000000(rel)
        test    rax, rdi                                ; 071C _ 48: 85. F8
        jnz     ?_143                                   ; 071F _ 75, 26
        lea     eax, [r12-1H]                           ; 0721 _ 41: 8D. 44 24, FF
        sub     r12, 1                                  ; 0726 _ 49: 83. EC, 01
        cdqe                                            ; 072A _ 48: 98
        cmp     rbp, rax                                ; 072C _ 48: 39. C5
        jnz     ?_141                                   ; 072F _ 75, D9
?_142:  mov     ecx, ebp                                ; 0731 _ 89. E9
        or      r13d, 0C000H                            ; 0733 _ 41: 81. CD, 0000C000
        add     rbx, 8                                  ; 073A _ 48: 83. C3, 08
        shl     ecx, 6                                  ; 073E _ C1. E1, 06
        or      ecx, r13d                               ; 0741 _ 44: 09. E9
        mov     dword [rbx-8H], ecx                     ; 0744 _ 89. 4B, F8
?_143:  mov     rdi, qword [rsi+2E0H]                   ; 0747 _ 48: 8B. BE, 000002E0
        test    qword [rsi+100H], rdi                   ; 074E _ 48: 85. BE, 00000100
        jne     ?_125                                   ; 0755 _ 0F 85, FFFFFE0D
        mov     rdx, qword [rsi+3B8H]                   ; 075B _ 48: 8B. 96, 000003B8
        test    byte [rdx+18H], 02H                     ; 0762 _ F6. 42, 18, 02
        je      ?_125                                   ; 0766 _ 0F 84, FFFFFDFC
        mov     r14, qword [rsi+260H]                   ; 076C _ 4C: 8B. B6, 00000260
        mov     r13d, 2                                 ; 0773 _ 41: BD, 00000002
        mov     rbp, qword [rsi+148H]                   ; 0779 _ 48: 8B. AE, 00000148
        mov     r10, qword [rsi+130H]                   ; 0780 _ 4C: 8B. 96, 00000130
        and     r10, qword [rsi+140H]                   ; 0787 _ 4C: 23. 96, 00000140
        bsf     r15, r10                                ; 078E _ 4D: 0F BC. FA
?_144:  cmp     r13, r15                                ; 0792 _ 4D: 39. FD
        je      ?_151                                   ; 0795 _ 0F 84, 000000E2
        mov     r8, qword [rsi+100H]                    ; 079B _ 4C: 8B. 86, 00000100
        mov     rdx, r13                                ; 07A2 _ 4C: 89. EA
        mov     rcx, rsi                                ; 07A5 _ 48: 89. F1
        call    _ZNK8Position12attackers_toE6Squarey    ; 07A8 _ E8, 00000000(rel)
        test    rax, rbp                                ; 07AD _ 48: 85. E8
        jne     ?_125                                   ; 07B0 _ 0F 85, FFFFFDB2
        add     r13, 1                                  ; 07B6 _ 49: 83. C5, 01
        jmp     ?_144                                   ; 07BA _ EB, D6

?_145:  mov     r15, qword [rel .refptr.BishopMasks]    ; 07BC _ 4C: 8B. 3D, 00000000(rel)
        mov     r14, qword [rel .refptr.BishopAttacks]  ; 07C3 _ 4C: 8B. 35, 00000000(rel)
?_146:  mov     r13, qword [rel .refptr.RookMasks]      ; 07CA _ 4C: 8B. 2D, 00000000(rel)
        bsf     rdx, rbp                                ; 07D1 _ 48: 0F BC. D5
        pext    r11, rcx, qword [r15+rdx*8]             ; 07D5 _ C4 42 F2: F5. 1C D7
        mov     r11d, r11d                              ; 07DB _ 45: 89. DB
        blsr    rbp, rbp                                ; 07DE _ C4 E2 D0: F3. CD
        pext    r10, rcx, qword [r13+rdx*8]             ; 07E3 _ C4 42 F2: F5. 54 D5, 00
        mov     r13, qword [r14+rdx*8]                  ; 07EA _ 4D: 8B. 2C D6
        mov     r10d, r10d                              ; 07EE _ 45: 89. D2
        mov     r11, qword [r13+r11*8]                  ; 07F1 _ 4F: 8B. 5C DD, 00
        mov     r13, qword [rel .refptr.RookAttacks]    ; 07F6 _ 4C: 8B. 2D, 00000000(rel)
        mov     r13, qword [r13+rdx*8]                  ; 07FD _ 4D: 8B. 6C D5, 00
        or      r11, qword [r13+r10*8]                  ; 0802 _ 4F: 0B. 5C D5, 00
        and     r11, r8                                 ; 0807 _ 4D: 21. C3
        jz      ?_148                                   ; 080A _ 74, 1C
        shl     edx, 6                                  ; 080C _ C1. E2, 06
?_147:  bsf     r10, r11                                ; 080F _ 4D: 0F BC. D3
        add     rbx, 8                                  ; 0813 _ 48: 83. C3, 08
        or      r10d, edx                               ; 0817 _ 41: 09. D2
        blsr    r11, r11                                ; 081A _ C4 C2 A0: F3. CB
        test    r11, r11                                ; 081F _ 4D: 85. DB
        mov     dword [rbx-8H], r10d                    ; 0822 _ 44: 89. 53, F8
        jnz     ?_147                                   ; 0826 _ 75, E7
?_148:  test    rbp, rbp                                ; 0828 _ 48: 85. ED
        je      ?_122                                   ; 082B _ 0F 84, FFFFFCEC
        jmp     ?_146                                   ; 0831 _ EB, 97

?_149:  bsf     r10, r12                                ; 0833 _ 4D: 0F BC. D4
        lea     r9d, [r10-7H]                           ; 0837 _ 45: 8D. 4A, F9
        add     rbx, 8                                  ; 083B _ 48: 83. C3, 08
        blsr    r12, r12                                ; 083F _ C4 C2 98: F3. CC
        shl     r9d, 6                                  ; 0844 _ 41: C1. E1, 06
        or      r10d, r9d                               ; 0848 _ 45: 09. CA
        test    r12, r12                                ; 084B _ 4D: 85. E4
        mov     dword [rbx-8H], r10d                    ; 084E _ 44: 89. 53, F8
        je      ?_115                                   ; 0852 _ 0F 84, FFFFFC32
        jmp     ?_149                                   ; 0858 _ EB, D9

?_150:  bsf     rbp, r14                                ; 085A _ 49: 0F BC. EE
        lea     edx, [rbp-9H]                           ; 085E _ 8D. 55, F7
        add     rbx, 8                                  ; 0861 _ 48: 83. C3, 08
        blsr    r14, r14                                ; 0865 _ C4 C2 88: F3. CE
        shl     edx, 6                                  ; 086A _ C1. E2, 06
        or      ebp, edx                                ; 086D _ 09. D5
        test    r14, r14                                ; 086F _ 4D: 85. F6
        mov     dword [rbx-8H], ebp                     ; 0872 _ 89. 6B, F8
        je      ?_114                                   ; 0875 _ 0F 84, FFFFFC06
        jmp     ?_150                                   ; 087B _ EB, DD

?_151:  or      r14d, 0C000H                            ; 087D _ 41: 81. CE, 0000C000
        shl     r13d, 6                                 ; 0884 _ 41: C1. E5, 06
        add     rbx, 8                                  ; 0888 _ 48: 83. C3, 08
        or      r13d, r14d                              ; 088C _ 45: 09. F5
        mov     dword [rbx-8H], r13d                    ; 088F _ 44: 89. 6B, F8
        jmp     ?_125                                   ; 0893 _ E9, FFFFFCD0

?_152:  and     r13, qword [r9+rdx*8+1200H]             ; 0898 _ 4D: 23. AC D1, 00001200
        or      dh, 0FFFFFF80H                          ; 08A0 _ 80. CE, 80
?_153:  test    r13, r13                                ; 08A3 _ 4D: 85. ED
        je      ?_116                                   ; 08A6 _ 0F 84, FFFFFBFB
        bsf     r11, r13                                ; 08AC _ 4D: 0F BC. DD
        shl     r11d, 6                                 ; 08B0 _ 41: C1. E3, 06
        add     rbx, 8                                  ; 08B4 _ 48: 83. C3, 08
        blsr    r13, r13                                ; 08B8 _ C4 C2 90: F3. CD
        or      r11d, edx                               ; 08BD _ 41: 09. D3
        mov     dword [rbx-8H], r11d                    ; 08C0 _ 44: 89. 5B, F8
        jmp     ?_153                                   ; 08C4 _ EB, DD

?_154:  bsf     r10, r15                                ; 08C6 _ 4D: 0F BC. D7
        lea     ebp, [r10-7H]                           ; 08CA _ 41: 8D. 6A, F9
        add     rbx, 32                                 ; 08CE _ 48: 83. C3, 20
        blsr    r15, r15                                ; 08D2 _ C4 C2 80: F3. CF
        shl     ebp, 6                                  ; 08D7 _ C1. E5, 06
        or      ebp, r10d                               ; 08DA _ 44: 09. D5
        mov     edx, ebp                                ; 08DD _ 89. EA
        mov     r9d, ebp                                ; 08DF _ 41: 89. E9
        mov     r11d, ebp                               ; 08E2 _ 41: 89. EB
        or      dh, 70H                                 ; 08E5 _ 80. CE, 70
        or      r9d, 6000H                              ; 08E8 _ 41: 81. C9, 00006000
        or      r11d, 5000H                             ; 08EF _ 41: 81. CB, 00005000
        mov     dword [rbx-20H], edx                    ; 08F6 _ 89. 53, E0
        or      ebp, 4000H                              ; 08F9 _ 81. CD, 00004000
        mov     dword [rbx-18H], r9d                    ; 08FF _ 44: 89. 4B, E8
        mov     dword [rbx-10H], r11d                   ; 0903 _ 44: 89. 5B, F0
        mov     dword [rbx-8H], ebp                     ; 0907 _ 89. 6B, F8
        jmp     ?_138                                   ; 090A _ E9, FFFFFD66

?_155:  ; Local function
        bsf     r10, rdx                                ; 090F _ 4C: 0F BC. D2
        lea     ebp, [r10-9H]                           ; 0913 _ 41: 8D. 6A, F7
        add     rbx, 32                                 ; 0917 _ 48: 83. C3, 20
        blsr    rdx, rdx                                ; 091B _ C4 E2 E8: F3. CA
        shl     ebp, 6                                  ; 0920 _ C1. E5, 06
        or      r10d, ebp                               ; 0923 _ 41: 09. EA
        mov     r9d, r10d                               ; 0926 _ 45: 89. D1
        mov     r11d, r10d                              ; 0929 _ 45: 89. D3
        mov     ebp, r10d                               ; 092C _ 44: 89. D5
        or      r9d, 7000H                              ; 092F _ 41: 81. C9, 00007000
        or      r11d, 6000H                             ; 0936 _ 41: 81. CB, 00006000
        or      ebp, 5000H                              ; 093D _ 81. CD, 00005000
        mov     dword [rbx-20H], r9d                    ; 0943 _ 44: 89. 4B, E0
        or      r10d, 4000H                             ; 0947 _ 41: 81. CA, 00004000
        mov     dword [rbx-18H], r11d                   ; 094E _ 44: 89. 5B, E8
        mov     dword [rbx-10H], ebp                    ; 0952 _ 89. 6B, F0
        mov     dword [rbx-8H], r10d                    ; 0955 _ 44: 89. 53, F8
        jmp     ?_137                                   ; 0959 _ E9, FFFFFD0E

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8

_Z8generateIL7GenType2EEP7ExtMoveRK8PositionS2_:; Function begin
        push    r15                                     ; 0960 _ 41: 57
        push    r14                                     ; 0962 _ 41: 56
        push    r13                                     ; 0964 _ 41: 55
        push    r12                                     ; 0966 _ 41: 54
        push    rbp                                     ; 0968 _ 55
        push    rdi                                     ; 0969 _ 57
        push    rsi                                     ; 096A _ 56
        push    rbx                                     ; 096B _ 53
        sub     rsp, 168                                ; 096C _ 48: 81. EC, 000000A8
        mov     r12d, dword [rcx+3ACH]                  ; 0973 _ 44: 8B. A1, 000003AC
        lea     r15, [rsp+40H]                          ; 097A _ 4C: 8D. 7C 24, 40
        mov     rbx, rcx                                ; 097F _ 48: 89. CB
        mov     rdi, rdx                                ; 0982 _ 48: 89. D7
        mov     rdx, rcx                                ; 0985 _ 48: 89. CA
        mov     rcx, r15                                ; 0988 _ 4C: 89. F9
        call    _ZN9CheckInfoC1ERK8Position             ; 098B _ E8, 00000000(rel)
        mov     rsi, qword [rsp+40H]                    ; 0990 _ 48: 8B. 74 24, 40
        test    rsi, rsi                                ; 0995 _ 48: 85. F6
        jne     ?_239                                   ; 0998 _ 0F 85, 00000A50
        mov     rbp, qword [rbx+100H]                   ; 099E _ 48: 8B. AB, 00000100
?_156:  mov     rdx, rbp                                ; 09A5 _ 48: 89. EA
        test    r12d, r12d                              ; 09A8 _ 45: 85. E4
        mov     qword [rsp+28H], rbp                    ; 09AB _ 48: 89. 6C 24, 28
        not     rdx                                     ; 09B0 _ 48: F7. D2
        jne     ?_175                                   ; 09B3 _ 0F 85, 000001A7
        mov     r9, qword [rbx+140H]                    ; 09B9 _ 4C: 8B. 8B, 00000140
        mov     rax, qword 0FF00FFFFFFFFFFFFH           ; 09C0 _ 48: B8, FF00FFFFFFFFFFFF
        mov     r8, qword 0FF000000000000H              ; 09CA _ 49: B8, 00FF000000000000
        mov     r13, qword [rsp+90H]                    ; 09D4 _ 4C: 8B. AC 24, 00000090
        mov     r10, qword [rel .refptr.StepAttacksBB]  ; 09DC _ 4C: 8B. 15, 00000000(rel)
        mov     r12, qword [rbx+148H]                   ; 09E3 _ 4C: 8B. A3, 00000148
        mov     r11, r9                                 ; 09EA _ 4D: 89. CB
        and     r11, qword [rbx+108H]                   ; 09ED _ 4C: 23. 9B, 00000108
        mov     rcx, qword [r10+r13*8+1200H]            ; 09F4 _ 4B: 8B. 8C EA, 00001200
        mov     qword [rsp+30H], r12                    ; 09FC _ 4C: 89. 64 24, 30
        and     rax, r11                                ; 0A01 _ 4C: 21. D8
        and     r8, r11                                 ; 0A04 _ 4D: 21. D8
        mov     r14, rax                                ; 0A07 _ 49: 89. C6
        shl     r14, 8                                  ; 0A0A _ 49: C1. E6, 08
        and     r14, rdx                                ; 0A0E _ 49: 21. D6
        mov     r12, r14                                ; 0A11 _ 4D: 89. F4
        and     r14d, 0FF0000H                          ; 0A14 _ 41: 81. E6, 00FF0000
        and     r12, rcx                                ; 0A1B _ 49: 21. CC
        shl     r14, 8                                  ; 0A1E _ 49: C1. E6, 08
        and     rcx, rdx                                ; 0A22 _ 48: 21. D1
        and     rcx, r14                                ; 0A25 _ 4C: 21. F1
        and     rax, rsi                                ; 0A28 _ 48: 21. F0
        mov     qword [rsp+38H], rax                    ; 0A2B _ 48: 89. 44 24, 38
        jne     ?_252                                   ; 0A30 _ 0F 85, 00000B41
?_157:  test    r12, r12                                ; 0A36 _ 4D: 85. E4
        jne     ?_226                                   ; 0A39 _ 0F 85, 000007EA
?_158:  test    rcx, rcx                                ; 0A3F _ 48: 85. C9
        jne     ?_260                                   ; 0A42 _ 0F 85, 00000C23
?_159:  test    r8, r8                                  ; 0A48 _ 4D: 85. C0
        jne     ?_233                                   ; 0A4B _ 0F 85, 000008EF
?_160:  mov     r14, r9                                 ; 0A51 _ 4D: 89. CE
        mov     r8, rdx                                 ; 0A54 _ 49: 89. D0
        and     r14, qword [rbx+110H]                   ; 0A57 _ 4C: 23. B3, 00000110
        and     r8, qword [rsp+60H]                     ; 0A5E _ 4C: 23. 44 24, 60
?_161:  test    r14, r14                                ; 0A63 _ 4D: 85. F6
        jne     ?_172                                   ; 0A66 _ 0F 85, 000000C4
?_162:  mov     rax, r9                                 ; 0A6C _ 4C: 89. C8
        and     rax, qword [rbx+118H]                   ; 0A6F _ 48: 23. 83, 00000118
        jnz     ?_169                                   ; 0A76 _ 75, 7B
?_163:  mov     rax, r9                                 ; 0A78 _ 4C: 89. C8
        and     rax, qword [rbx+120H]                   ; 0A7B _ 48: 23. 83, 00000120
        jz      ?_166                                   ; 0A82 _ 74, 36
        mov     r10, rdx                                ; 0A84 _ 49: 89. D2
        mov     r12, qword [rel .refptr.PseudoAttacks]  ; 0A87 _ 4C: 8B. 25, 00000000(rel)
        and     r10, qword [rsp+70H]                    ; 0A8E _ 4C: 23. 54 24, 70
?_164:  bsf     r13, rax                                ; 0A93 _ 4C: 0F BC. E8
        lea     r14, [r13+100H]                         ; 0A97 _ 4D: 8D. B5, 00000100
        blsr    rax, rax                                ; 0A9E _ C4 E2 F8: F3. C8
        test    qword [r12+r14*8], r10                  ; 0AA3 _ 4F: 85. 14 F4
        lea     r8, [r14*8]                             ; 0AA7 _ 4E: 8D. 04 F5, 00000000
        jne     ?_195                                   ; 0AAF _ 0F 85, 00000300
?_165:  test    rax, rax                                ; 0AB5 _ 48: 85. C0
        jnz     ?_164                                   ; 0AB8 _ 75, D9
?_166:  mov     rax, r9                                 ; 0ABA _ 4C: 89. C8
        and     rax, qword [rbx+128H]                   ; 0ABD _ 48: 23. 83, 00000128
        jne     ?_198                                   ; 0AC4 _ 0F 85, 0000034A
?_167:  mov     rsi, qword [rbx+3B8H]                   ; 0ACA _ 48: 8B. B3, 000003B8
        mov     eax, dword [rsi+18H]                    ; 0AD1 _ 8B. 46, 18
        test    al, 03H                                 ; 0AD4 _ A8, 03
        jne     ?_203                                   ; 0AD6 _ 0F 85, 000003F4
?_168:  mov     rax, rdi                                ; 0ADC _ 48: 89. F8
        add     rsp, 168                                ; 0ADF _ 48: 81. C4, 000000A8
        pop     rbx                                     ; 0AE6 _ 5B
        pop     rsi                                     ; 0AE7 _ 5E
        pop     rdi                                     ; 0AE8 _ 5F
        pop     rbp                                     ; 0AE9 _ 5D
        pop     r12                                     ; 0AEA _ 41: 5C
        pop     r13                                     ; 0AEC _ 41: 5D
        pop     r14                                     ; 0AEE _ 41: 5E
        pop     r15                                     ; 0AF0 _ 41: 5F
        ret                                             ; 0AF2 _ C3

?_169:  mov     r10, rdx                                ; 0AF3 _ 49: 89. D2
        mov     r11, qword [rel .refptr.PseudoAttacks]  ; 0AF6 _ 4C: 8B. 1D, 00000000(rel)
        and     r10, qword [rsp+68H]                    ; 0AFD _ 4C: 23. 54 24, 68
?_170:  bsf     r13, rax                                ; 0B02 _ 4C: 0F BC. E8
        lea     r14, [r13+0C0H]                         ; 0B06 _ 4D: 8D. B5, 000000C0
        blsr    rax, rax                                ; 0B0D _ C4 E2 F8: F3. C8
        test    qword [r11+r14*8], r10                  ; 0B12 _ 4F: 85. 14 F3
        lea     r12, [r14*8]                            ; 0B16 _ 4E: 8D. 24 F5, 00000000
        jne     ?_217                                   ; 0B1E _ 0F 85, 000005FC
?_171:  test    rax, rax                                ; 0B24 _ 48: 85. C0
        je      ?_163                                   ; 0B27 _ 0F 84, FFFFFF4B
        jmp     ?_170                                   ; 0B2D _ EB, D3

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_172:  bsf     r13, r14                                ; 0B30 _ 4D: 0F BC. EE
        blsr    r14, r14                                ; 0B34 _ C4 C2 88: F3. CE
        test    rsi, rsi                                ; 0B39 _ 48: 85. F6
        jne     ?_244                                   ; 0B3C _ 0F 85, 0000093E
?_173:  mov     rax, r8                                 ; 0B42 _ 4C: 89. C0
        and     rax, qword [r10+r13*8+400H]             ; 0B45 _ 4B: 23. 84 EA, 00000400
        jne     ?_223                                   ; 0B4D _ 0F 85, 0000068D
?_174:  test    r14, r14                                ; 0B53 _ 4D: 85. F6
        je      ?_162                                   ; 0B56 _ 0F 84, FFFFFF10
        jmp     ?_172                                   ; 0B5C _ EB, D2

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_175:  mov     rax, qword [rbx+148H]                   ; 0B60 _ 48: 8B. 83, 00000148
        mov     r13, qword [rbx+140H]                   ; 0B67 _ 4C: 8B. AB, 00000140
        mov     rcx, qword [rel .refptr.StepAttacksBB]  ; 0B6E _ 48: 8B. 0D, 00000000(rel)
        mov     r12, qword [rsp+90H]                    ; 0B75 _ 4C: 8B. A4 24, 00000090
        mov     r9, rax                                 ; 0B7D _ 49: 89. C1
        and     r9, qword [rbx+108H]                    ; 0B80 _ 4C: 23. 8B, 00000108
        mov     qword [rsp+30H], r13                    ; 0B87 _ 4C: 89. 6C 24, 30
        mov     r13, qword [rcx+r12*8+200H]             ; 0B8C _ 4E: 8B. AC E1, 00000200
        mov     r8, r9                                  ; 0B94 _ 4D: 89. C8
        mov     r11, r9                                 ; 0B97 _ 4D: 89. CB
        and     r8, 0FFFFFFFFFFFF00FFH                  ; 0B9A _ 49: 81. E0, FFFF00FF
        and     r11d, 0FF00H                            ; 0BA1 _ 41: 81. E3, 0000FF00
        mov     r14, r8                                 ; 0BA8 _ 4D: 89. C6
        shr     r14, 8                                  ; 0BAB _ 49: C1. EE, 08
        and     r14, rdx                                ; 0BAF _ 49: 21. D6
        mov     r10, r14                                ; 0BB2 _ 4D: 89. F2
        mov     rcx, r14                                ; 0BB5 _ 4C: 89. F1
        mov     r14, qword 0FF0000000000H               ; 0BB8 _ 49: BE, 0000FF0000000000
        and     rcx, r14                                ; 0BC2 _ 4C: 21. F1
        and     r10, r13                                ; 0BC5 _ 4D: 21. EA
        and     r13, rdx                                ; 0BC8 _ 49: 21. D5
        shr     rcx, 8                                  ; 0BCB _ 48: C1. E9, 08
        and     rcx, r13                                ; 0BCF _ 4C: 21. E9
        and     r8, rsi                                 ; 0BD2 _ 49: 21. F0
        jne     ?_242                                   ; 0BD5 _ 0F 85, 00000851
?_176:  test    r10, r10                                ; 0BDB _ 4D: 85. D2
        jne     ?_225                                   ; 0BDE _ 0F 85, 0000061E
?_177:  test    rcx, rcx                                ; 0BE4 _ 48: 85. C9
        jne     ?_261                                   ; 0BE7 _ 0F 85, 00000AA4
?_178:  test    r11, r11                                ; 0BED _ 4D: 85. DB
        jne     ?_248                                   ; 0BF0 _ 0F 85, 000008E2
?_179:  mov     r8, rax                                 ; 0BF6 _ 49: 89. C0
        mov     r9, rdx                                 ; 0BF9 _ 49: 89. D1
        and     r8, qword [rbx+110H]                    ; 0BFC _ 4C: 23. 83, 00000110
        and     r9, qword [rsp+60H]                     ; 0C03 _ 4C: 23. 4C 24, 60
?_180:  test    r8, r8                                  ; 0C08 _ 4D: 85. C0
        jne     ?_192                                   ; 0C0B _ 0F 85, 0000016F
?_181:  mov     rcx, rax                                ; 0C11 _ 48: 89. C1
        and     rcx, qword [rbx+118H]                   ; 0C14 _ 48: 23. 8B, 00000118
        jz      ?_184                                   ; 0C1B _ 74, 36
        mov     r10, rdx                                ; 0C1D _ 49: 89. D2
        mov     r11, qword [rel .refptr.PseudoAttacks]  ; 0C20 _ 4C: 8B. 1D, 00000000(rel)
        and     r10, qword [rsp+68H]                    ; 0C27 _ 4C: 23. 54 24, 68
?_182:  bsf     r13, rcx                                ; 0C2C _ 4C: 0F BC. E9
        lea     r8, [r13+0C0H]                          ; 0C30 _ 4D: 8D. 85, 000000C0
        blsr    rcx, rcx                                ; 0C37 _ C4 E2 F0: F3. C9
        test    qword [r11+r8*8], r10                   ; 0C3C _ 4F: 85. 14 C3
        lea     r12, [r8*8]                             ; 0C40 _ 4E: 8D. 24 C5, 00000000
        jne     ?_220                                   ; 0C48 _ 0F 85, 00000532
?_183:  test    rcx, rcx                                ; 0C4E _ 48: 85. C9
        jnz     ?_182                                   ; 0C51 _ 75, D9
?_184:  mov     rcx, rax                                ; 0C53 _ 48: 89. C1
        and     rcx, qword [rbx+120H]                   ; 0C56 _ 48: 23. 8B, 00000120
        jz      ?_187                                   ; 0C5D _ 74, 36
        mov     r10, rdx                                ; 0C5F _ 49: 89. D2
        mov     r12, qword [rel .refptr.PseudoAttacks]  ; 0C62 _ 4C: 8B. 25, 00000000(rel)
        and     r10, qword [rsp+70H]                    ; 0C69 _ 4C: 23. 54 24, 70
?_185:  bsf     r13, rcx                                ; 0C6E _ 4C: 0F BC. E9
        lea     r8, [r13+100H]                          ; 0C72 _ 4D: 8D. 85, 00000100
        blsr    rcx, rcx                                ; 0C79 _ C4 E2 F0: F3. C9
        test    qword [r12+r8*8], r10                   ; 0C7E _ 4F: 85. 14 C4
        lea     r9, [r8*8]                              ; 0C82 _ 4E: 8D. 0C C5, 00000000
        jne     ?_209                                   ; 0C8A _ 0F 85, 00000375
?_186:  test    rcx, rcx                                ; 0C90 _ 48: 85. C9
        jnz     ?_185                                   ; 0C93 _ 75, D9
?_187:  mov     rcx, rax                                ; 0C95 _ 48: 89. C1
        and     rcx, qword [rbx+128H]                   ; 0C98 _ 48: 23. 8B, 00000128
        jne     ?_212                                   ; 0C9F _ 0F 85, 000003BF
?_188:  mov     r9, qword [rbx+3B8H]                    ; 0CA5 _ 4C: 8B. 8B, 000003B8
        mov     r14d, dword [r9+18H]                    ; 0CAC _ 45: 8B. 71, 18
        test    r14b, 0CH                               ; 0CB0 _ 41: F6. C6, 0C
        je      ?_168                                   ; 0CB4 _ 0F 84, FFFFFE22
        cmp     byte [rbx+3C0H], 0                      ; 0CBA _ 80. BB, 000003C0, 00
        jne     .text.unlikely+8CH                      ; 0CC1 _ 0F 85, 0000008C(rel)
        test    qword [rbx+2F0H], rbp                   ; 0CC7 _ 48: 85. AB, 000002F0
        je      ?_230                                   ; 0CCE _ 0F 84, 000005DC
?_189:  mov     rcx, qword [rsp+28H]                    ; 0CD4 _ 48: 8B. 4C 24, 28
        test    qword [rbx+310H], rcx                   ; 0CD9 _ 48: 85. 8B, 00000310
        jne     ?_168                                   ; 0CE0 _ 0F 85, FFFFFDF6
        mov     r11, qword [rbx+3B8H]                   ; 0CE6 _ 4C: 8B. 9B, 000003B8
        test    byte [r11+18H], 08H                     ; 0CED _ 41: F6. 43, 18, 08
        je      ?_168                                   ; 0CF2 _ 0F 84, FFFFFDE4
        mov     r9, qword [rbx+130H]                    ; 0CF8 _ 4C: 8B. 8B, 00000130
        mov     ebp, 58                                 ; 0CFF _ BD, 0000003A
        and     r9, qword [rbx+148H]                    ; 0D04 _ 4C: 23. 8B, 00000148
        bsf     r14, r9                                 ; 0D0B _ 4D: 0F BC. F1
        cmp     r14, 58                                 ; 0D0F _ 49: 83. FE, 3A
        mov     rsi, qword [rbx+290H]                   ; 0D13 _ 48: 8B. B3, 00000290
        mov     r12, qword [rbx+140H]                   ; 0D1A _ 4C: 8B. A3, 00000140
        jz      ?_191                                   ; 0D21 _ 74, 29
?_190:  mov     r8, qword [rbx+100H]                    ; 0D23 _ 4C: 8B. 83, 00000100
        mov     rdx, rbp                                ; 0D2A _ 48: 89. EA
        mov     rcx, rbx                                ; 0D2D _ 48: 89. D9
        call    _ZNK8Position12attackers_toE6Squarey    ; 0D30 _ E8, 00000000(rel)
        test    rax, r12                                ; 0D35 _ 4C: 85. E0
        jne     ?_168                                   ; 0D38 _ 0F 85, FFFFFD9E
        lea     eax, [rbp+1H]                           ; 0D3E _ 8D. 45, 01
        add     rbp, 1                                  ; 0D41 _ 48: 83. C5, 01
        cdqe                                            ; 0D45 _ 48: 98
        cmp     r14, rax                                ; 0D47 _ 49: 39. C6
        jnz     ?_190                                   ; 0D4A _ 75, D7
?_191:  or      esi, 0C000H                             ; 0D4C _ 81. CE, 0000C000
        shl     r14d, 6                                 ; 0D52 _ 41: C1. E6, 06
        mov     r8, r15                                 ; 0D56 _ 4D: 89. F8
        or      r14d, esi                               ; 0D59 _ 41: 09. F6
        mov     rcx, rbx                                ; 0D5C _ 48: 89. D9
        mov     edx, r14d                               ; 0D5F _ 44: 89. F2
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 0D62 _ E8, 00000000(rel)
        test    al, al                                  ; 0D67 _ 84. C0
        je      ?_168                                   ; 0D69 _ 0F 84, FFFFFD6D
        mov     dword [rdi], r14d                       ; 0D6F _ 44: 89. 37
        add     rdi, 8                                  ; 0D72 _ 48: 83. C7, 08
        jmp     ?_168                                   ; 0D76 _ E9, FFFFFD61

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_192:  bsf     r12, r8                                 ; 0D80 _ 4D: 0F BC. E0
        blsr    r8, r8                                  ; 0D84 _ C4 C2 B8: F3. C8
        test    rsi, rsi                                ; 0D89 _ 48: 85. F6
        jne     ?_246                                   ; 0D8C _ 0F 85, 0000071A
?_193:  mov     r13, qword [rel .refptr.StepAttacksBB]  ; 0D92 _ 4C: 8B. 2D, 00000000(rel)
        mov     rcx, r9                                 ; 0D99 _ 4C: 89. C9
        and     rcx, qword [r13+r12*8+400H]             ; 0D9C _ 4B: 23. 8C E5, 00000400
        jne     ?_227                                   ; 0DA4 _ 0F 85, 000004A6
?_194:  test    r8, r8                                  ; 0DAA _ 4D: 85. C0
        je      ?_181                                   ; 0DAD _ 0F 84, FFFFFE5E
        jmp     ?_192                                   ; 0DB3 _ EB, CB

?_195:  test    rsi, rsi                                ; 0DB5 _ 48: 85. F6
        jne     ?_243                                   ; 0DB8 _ 0F 85, 000006AC
?_196:  mov     rcx, qword [rel .refptr.RookMasks]      ; 0DBE _ 48: 8B. 0D, 00000000(rel)
        mov     r11, qword [rel .refptr.RookAttacks]    ; 0DC5 _ 4C: 8B. 1D, 00000000(rel)
        pext    r14, rbp, qword [r8+rcx-800H]           ; 0DCC _ C4 42 D2: F5. B4 08, FFFFF800
        mov     ecx, r14d                               ; 0DD6 _ 44: 89. F1
        mov     r14, r10                                ; 0DD9 _ 4D: 89. D6
        mov     r8, qword [r8+r11-800H]                 ; 0DDC _ 4F: 8B. 84 18, FFFFF800
        and     r14, qword [r8+rcx*8]                   ; 0DE4 _ 4D: 23. 34 C8
        mov     rcx, r14                                ; 0DE8 _ 4C: 89. F1
        je      ?_165                                   ; 0DEB _ 0F 84, FFFFFCC4
        shl     r13d, 6                                 ; 0DF1 _ 41: C1. E5, 06
?_197:  bsf     r11, rcx                                ; 0DF5 _ 4C: 0F BC. D9
        add     rdi, 8                                  ; 0DF9 _ 48: 83. C7, 08
        or      r11d, r13d                              ; 0DFD _ 45: 09. EB
        blsr    rcx, rcx                                ; 0E00 _ C4 E2 F0: F3. C9
        test    rcx, rcx                                ; 0E05 _ 48: 85. C9
        mov     dword [rdi-8H], r11d                    ; 0E08 _ 44: 89. 5F, F8
        je      ?_165                                   ; 0E0C _ 0F 84, FFFFFCA3
        jmp     ?_197                                   ; 0E12 _ EB, E1

?_198:  and     rdx, qword [rsp+78H]                    ; 0E14 _ 48: 23. 54 24, 78
        mov     r12, qword [rel .refptr.PseudoAttacks]  ; 0E19 _ 4C: 8B. 25, 00000000(rel)
?_199:  bsf     r8, rax                                 ; 0E20 _ 4C: 0F BC. C0
        lea     r13, [r8+140H]                          ; 0E24 _ 4D: 8D. A8, 00000140
        blsr    rax, rax                                ; 0E2B _ C4 E2 F8: F3. C8
        test    qword [r12+r13*8], rdx                  ; 0E30 _ 4B: 85. 14 EC
        lea     rcx, [r13*8]                            ; 0E34 _ 4A: 8D. 0C ED, 00000000
        jz      ?_202                                   ; 0E3C _ 74, 7A
        test    rsi, rsi                                ; 0E3E _ 48: 85. F6
        jne     ?_247                                   ; 0E41 _ 0F 85, 0000067B
?_200:  mov     r10, qword [rel .refptr.RookMasks]      ; 0E47 _ 4C: 8B. 15, 00000000(rel)
        mov     r11, qword [rel .refptr.BishopMasks]    ; 0E4E _ 4C: 8B. 1D, 00000000(rel)
        pext    r13, rbp, qword [rcx+r10-0A00H]         ; 0E55 _ C4 22 D2: F5. AC 11, FFFFF600
        mov     r10, qword [rel .refptr.BishopAttacks]  ; 0E5F _ 4C: 8B. 15, 00000000(rel)
        pext    r14, rbp, qword [rcx+r11-0A00H]         ; 0E66 _ C4 22 D2: F5. B4 19, FFFFF600
        mov     r11d, r14d                              ; 0E70 _ 45: 89. F3
        mov     r14, qword [rcx+r10-0A00H]              ; 0E73 _ 4E: 8B. B4 11, FFFFF600
        mov     r10d, r13d                              ; 0E7B _ 45: 89. EA
        mov     r13, qword [rel .refptr.RookAttacks]    ; 0E7E _ 4C: 8B. 2D, 00000000(rel)
        mov     r13, qword [rcx+r13-0A00H]              ; 0E85 _ 4E: 8B. AC 29, FFFFF600
        mov     rcx, qword [r14+r11*8]                  ; 0E8D _ 4B: 8B. 0C DE
        or      rcx, qword [r13+r10*8]                  ; 0E91 _ 4B: 0B. 4C D5, 00
        and     rcx, rdx                                ; 0E96 _ 48: 21. D1
        jz      ?_202                                   ; 0E99 _ 74, 1D
        shl     r8d, 6                                  ; 0E9B _ 41: C1. E0, 06
?_201:  bsf     r11, rcx                                ; 0E9F _ 4C: 0F BC. D9
        add     rdi, 8                                  ; 0EA3 _ 48: 83. C7, 08
        or      r11d, r8d                               ; 0EA7 _ 45: 09. C3
        blsr    rcx, rcx                                ; 0EAA _ C4 E2 F0: F3. C9
        test    rcx, rcx                                ; 0EAF _ 48: 85. C9
        mov     dword [rdi-8H], r11d                    ; 0EB2 _ 44: 89. 5F, F8
        jnz     ?_201                                   ; 0EB6 _ 75, E7
?_202:  test    rax, rax                                ; 0EB8 _ 48: 85. C0
        je      ?_167                                   ; 0EBB _ 0F 84, FFFFFC09
        jmp     ?_199                                   ; 0EC1 _ E9, FFFFFF5A

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_203:  cmp     byte [rbx+3C0H], 0                      ; 0ED0 _ 80. BB, 000003C0, 00
        jne     _Z8generateIL7GenType2EEP7ExtMoveRK8PositionS2_.cold.105; 0ED7 _ 0F 85, 00000026(rel)
        test    qword [rbx+2D8H], rbp                   ; 0EDD _ 48: 85. AB, 000002D8
        jnz     ?_206                                   ; 0EE4 _ 75, 7A
        test    al, 01H                                 ; 0EE6 _ A8, 01
        jz      ?_206                                   ; 0EE8 _ 74, 76
        and     r9, qword [rbx+130H]                    ; 0EEA _ 4C: 23. 8B, 00000130
        bsf     r14, r9                                 ; 0EF1 _ 4D: 0F BC. F1
        cmp     r14, 6                                  ; 0EF5 _ 49: 83. FE, 06
        mov     r12, qword [rbx+258H]                   ; 0EF9 _ 4C: 8B. A3, 00000258
        je      ?_229                                   ; 0F00 _ 0F 84, 0000036D
        mov     r8, qword [rsp+28H]                     ; 0F06 _ 4C: 8B. 44 24, 28
        mov     ebp, 6                                  ; 0F0B _ BD, 00000006
        mov     rcx, rbx                                ; 0F10 _ 48: 89. D9
        mov     r13, qword [rsp+30H]                    ; 0F13 _ 4C: 8B. 6C 24, 30
        mov     rdx, rbp                                ; 0F18 _ 48: 89. EA
        call    _ZNK8Position12attackers_toE6Squarey    ; 0F1B _ E8, 00000000(rel)
        test    rax, r13                                ; 0F20 _ 4C: 85. E8
        jnz     ?_205                                   ; 0F23 _ 75, 29
?_204:  lea     eax, [rbp-1H]                           ; 0F25 _ 8D. 45, FF
        sub     rbp, 1                                  ; 0F28 _ 48: 83. ED, 01
        cdqe                                            ; 0F2C _ 48: 98
        cmp     r14, rax                                ; 0F2E _ 49: 39. C6
        je      ?_229                                   ; 0F31 _ 0F 84, 0000033C
        mov     r8, qword [rbx+100H]                    ; 0F37 _ 4C: 8B. 83, 00000100
        mov     rdx, rbp                                ; 0F3E _ 48: 89. EA
        mov     rcx, rbx                                ; 0F41 _ 48: 89. D9
        call    _ZNK8Position12attackers_toE6Squarey    ; 0F44 _ E8, 00000000(rel)
        test    rax, r13                                ; 0F49 _ 4C: 85. E8
        jz      ?_204                                   ; 0F4C _ 74, D7
?_205:  mov     r10, qword [rbx+100H]                   ; 0F4E _ 4C: 8B. 93, 00000100
        mov     qword [rsp+28H], r10                    ; 0F55 _ 4C: 89. 54 24, 28
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_206:  mov     rcx, qword [rsp+28H]                    ; 0F60 _ 48: 8B. 4C 24, 28
        test    qword [rbx+2E0H], rcx                   ; 0F65 _ 48: 85. 8B, 000002E0
        jne     ?_168                                   ; 0F6C _ 0F 85, FFFFFB6A
        mov     r9, qword [rbx+3B8H]                    ; 0F72 _ 4C: 8B. 8B, 000003B8
        test    byte [r9+18H], 02H                      ; 0F79 _ 41: F6. 41, 18, 02
        je      ?_168                                   ; 0F7E _ 0F 84, FFFFFB58
        mov     r11, qword [rbx+130H]                   ; 0F84 _ 4C: 8B. 9B, 00000130
        mov     ebp, 2                                  ; 0F8B _ BD, 00000002
        and     r11, qword [rbx+140H]                   ; 0F90 _ 4C: 23. 9B, 00000140
        bsf     rsi, r11                                ; 0F97 _ 49: 0F BC. F3
        cmp     rsi, 2                                  ; 0F9B _ 48: 83. FE, 02
        mov     r14, qword [rbx+260H]                   ; 0F9F _ 4C: 8B. B3, 00000260
        mov     r12, qword [rbx+148H]                   ; 0FA6 _ 4C: 8B. A3, 00000148
        jz      ?_208                                   ; 0FAD _ 74, 29
?_207:  mov     r8, qword [rbx+100H]                    ; 0FAF _ 4C: 8B. 83, 00000100
        mov     rdx, rbp                                ; 0FB6 _ 48: 89. EA
        mov     rcx, rbx                                ; 0FB9 _ 48: 89. D9
        call    _ZNK8Position12attackers_toE6Squarey    ; 0FBC _ E8, 00000000(rel)
        test    rax, r12                                ; 0FC1 _ 4C: 85. E0
        jne     ?_168                                   ; 0FC4 _ 0F 85, FFFFFB12
        lea     eax, [rbp+1H]                           ; 0FCA _ 8D. 45, 01
        add     rbp, 1                                  ; 0FCD _ 48: 83. C5, 01
        cdqe                                            ; 0FD1 _ 48: 98
        cmp     rsi, rax                                ; 0FD3 _ 48: 39. C6
        jnz     ?_207                                   ; 0FD6 _ 75, D7
?_208:  or      r14d, 0C000H                            ; 0FD8 _ 41: 81. CE, 0000C000
        shl     esi, 6                                  ; 0FDF _ C1. E6, 06
        mov     r8, r15                                 ; 0FE2 _ 4D: 89. F8
        or      esi, r14d                               ; 0FE5 _ 44: 09. F6
        mov     rcx, rbx                                ; 0FE8 _ 48: 89. D9
        mov     edx, esi                                ; 0FEB _ 89. F2
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 0FED _ E8, 00000000(rel)
        test    al, al                                  ; 0FF2 _ 84. C0
        je      ?_168                                   ; 0FF4 _ 0F 84, FFFFFAE2
        mov     dword [rdi], esi                        ; 0FFA _ 89. 37
        add     rdi, 8                                  ; 0FFC _ 48: 83. C7, 08
        jmp     ?_168                                   ; 1000 _ E9, FFFFFAD7

?_209:  test    rsi, rsi                                ; 1005 _ 48: 85. F6
        jne     ?_245                                   ; 1008 _ 0F 85, 00000488
?_210:  mov     r14, qword [rel .refptr.RookMasks]      ; 100E _ 4C: 8B. 35, 00000000(rel)
        mov     r11, qword [rel .refptr.RookAttacks]    ; 1015 _ 4C: 8B. 1D, 00000000(rel)
        pext    r8, rbp, qword [r9+r14-800H]            ; 101C _ C4 02 D2: F5. 84 31, FFFFF800
        mov     r8d, r8d                                ; 1026 _ 45: 89. C0
        mov     r14, r10                                ; 1029 _ 4D: 89. D6
        mov     r9, qword [r9+r11-800H]                 ; 102C _ 4F: 8B. 8C 19, FFFFF800
        and     r14, qword [r9+r8*8]                    ; 1034 _ 4F: 23. 34 C1
        mov     r8, r14                                 ; 1038 _ 4D: 89. F0
        je      ?_186                                   ; 103B _ 0F 84, FFFFFC4F
        shl     r13d, 6                                 ; 1041 _ 41: C1. E5, 06
?_211:  bsf     r11, r8                                 ; 1045 _ 4D: 0F BC. D8
        add     rdi, 8                                  ; 1049 _ 48: 83. C7, 08
        or      r11d, r13d                              ; 104D _ 45: 09. EB
        blsr    r8, r8                                  ; 1050 _ C4 C2 B8: F3. C8
        test    r8, r8                                  ; 1055 _ 4D: 85. C0
        mov     dword [rdi-8H], r11d                    ; 1058 _ 44: 89. 5F, F8
        je      ?_186                                   ; 105C _ 0F 84, FFFFFC2E
        jmp     ?_211                                   ; 1062 _ EB, E1

?_212:  and     rdx, qword [rsp+78H]                    ; 1064 _ 48: 23. 54 24, 78
        mov     r12, qword [rel .refptr.PseudoAttacks]  ; 1069 _ 4C: 8B. 25, 00000000(rel)
?_213:  bsf     r9, rcx                                 ; 1070 _ 4C: 0F BC. C9
        lea     r13, [r9+140H]                          ; 1074 _ 4D: 8D. A9, 00000140
        blsr    rcx, rcx                                ; 107B _ C4 E2 F0: F3. C9
        test    qword [r12+r13*8], rdx                  ; 1080 _ 4B: 85. 14 EC
        lea     r8, [r13*8]                             ; 1084 _ 4E: 8D. 04 ED, 00000000
        jz      ?_216                                   ; 108C _ 74, 7A
        test    rsi, rsi                                ; 108E _ 48: 85. F6
        jne     ?_253                                   ; 1091 _ 0F 85, 0000051C
?_214:  mov     r10, qword [rel .refptr.RookMasks]      ; 1097 _ 4C: 8B. 15, 00000000(rel)
        mov     r11, qword [rel .refptr.BishopMasks]    ; 109E _ 4C: 8B. 1D, 00000000(rel)
        pext    r13, rbp, qword [r8+r10-0A00H]          ; 10A5 _ C4 02 D2: F5. AC 10, FFFFF600
        mov     r10, qword [rel .refptr.BishopAttacks]  ; 10AF _ 4C: 8B. 15, 00000000(rel)
        pext    r14, rbp, qword [r8+r11-0A00H]          ; 10B6 _ C4 02 D2: F5. B4 18, FFFFF600
        mov     r11d, r14d                              ; 10C0 _ 45: 89. F3
        mov     r14, qword [r8+r10-0A00H]               ; 10C3 _ 4F: 8B. B4 10, FFFFF600
        mov     r10d, r13d                              ; 10CB _ 45: 89. EA
        mov     r13, qword [rel .refptr.RookAttacks]    ; 10CE _ 4C: 8B. 2D, 00000000(rel)
        mov     r13, qword [r8+r13-0A00H]               ; 10D5 _ 4F: 8B. AC 28, FFFFF600
        mov     r8, qword [r14+r11*8]                   ; 10DD _ 4F: 8B. 04 DE
        or      r8, qword [r13+r10*8]                   ; 10E1 _ 4F: 0B. 44 D5, 00
        and     r8, rdx                                 ; 10E6 _ 49: 21. D0
        jz      ?_216                                   ; 10E9 _ 74, 1D
        shl     r9d, 6                                  ; 10EB _ 41: C1. E1, 06
?_215:  bsf     r11, r8                                 ; 10EF _ 4D: 0F BC. D8
        add     rdi, 8                                  ; 10F3 _ 48: 83. C7, 08
        or      r11d, r9d                               ; 10F7 _ 45: 09. CB
        blsr    r8, r8                                  ; 10FA _ C4 C2 B8: F3. C8
        test    r8, r8                                  ; 10FF _ 4D: 85. C0
        mov     dword [rdi-8H], r11d                    ; 1102 _ 44: 89. 5F, F8
        jnz     ?_215                                   ; 1106 _ 75, E7
?_216:  test    rcx, rcx                                ; 1108 _ 48: 85. C9
        je      ?_188                                   ; 110B _ 0F 84, FFFFFB94
        jmp     ?_213                                   ; 1111 _ E9, FFFFFF5A

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_217:  test    rsi, rsi                                ; 1120 _ 48: 85. F6
        jne     ?_257                                   ; 1123 _ 0F 85, 00000505
?_218:  mov     rcx, qword [rel .refptr.BishopMasks]    ; 1129 _ 48: 8B. 0D, 00000000(rel)
        pext    r14, rbp, qword [r12+rcx-600H]          ; 1130 _ C4 42 D2: F5. B4 0C, FFFFFA00
        mov     r8d, r14d                               ; 113A _ 45: 89. F0
        mov     r14, r10                                ; 113D _ 4D: 89. D6
        mov     rcx, qword [rel .refptr.BishopAttacks]  ; 1140 _ 48: 8B. 0D, 00000000(rel)
        mov     r12, qword [r12+rcx-600H]               ; 1147 _ 4D: 8B. A4 0C, FFFFFA00
        and     r14, qword [r12+r8*8]                   ; 114F _ 4F: 23. 34 C4
        mov     r8, r14                                 ; 1153 _ 4D: 89. F0
        je      ?_171                                   ; 1156 _ 0F 84, FFFFF9C8
        shl     r13d, 6                                 ; 115C _ 41: C1. E5, 06
?_219:  bsf     rcx, r8                                 ; 1160 _ 49: 0F BC. C8
        add     rdi, 8                                  ; 1164 _ 48: 83. C7, 08
        or      ecx, r13d                               ; 1168 _ 44: 09. E9
        blsr    r8, r8                                  ; 116B _ C4 C2 B8: F3. C8
        test    r8, r8                                  ; 1170 _ 4D: 85. C0
        mov     dword [rdi-8H], ecx                     ; 1173 _ 89. 4F, F8
        je      ?_171                                   ; 1176 _ 0F 84, FFFFF9A8
        jmp     ?_219                                   ; 117C _ EB, E2

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_220:  test    rsi, rsi                                ; 1180 _ 48: 85. F6
        jne     ?_258                                   ; 1183 _ 0F 85, 000004BB
?_221:  mov     r14, qword [rel .refptr.BishopMasks]    ; 1189 _ 4C: 8B. 35, 00000000(rel)
        pext    r8, rbp, qword [r12+r14-600H]           ; 1190 _ C4 02 D2: F5. 84 34, FFFFFA00
        mov     r9d, r8d                                ; 119A _ 45: 89. C1
        mov     r8, r10                                 ; 119D _ 4D: 89. D0
        mov     r14, qword [rel .refptr.BishopAttacks]  ; 11A0 _ 4C: 8B. 35, 00000000(rel)
        mov     r12, qword [r12+r14-600H]               ; 11A7 _ 4F: 8B. A4 34, FFFFFA00
        and     r8, qword [r12+r9*8]                    ; 11AF _ 4F: 23. 04 CC
        mov     r9, r8                                  ; 11B3 _ 4D: 89. C1
        je      ?_183                                   ; 11B6 _ 0F 84, FFFFFA92
        shl     r13d, 6                                 ; 11BC _ 41: C1. E5, 06
?_222:  bsf     r14, r9                                 ; 11C0 _ 4D: 0F BC. F1
        add     rdi, 8                                  ; 11C4 _ 48: 83. C7, 08
        or      r14d, r13d                              ; 11C8 _ 45: 09. EE
        blsr    r9, r9                                  ; 11CB _ C4 C2 B0: F3. C9
        test    r9, r9                                  ; 11D0 _ 4D: 85. C9
        mov     dword [rdi-8H], r14d                    ; 11D3 _ 44: 89. 77, F8
        je      ?_183                                   ; 11D7 _ 0F 84, FFFFFA71
        jmp     ?_222                                   ; 11DD _ EB, E1

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_223:  shl     r13d, 6                                 ; 11E0 _ 41: C1. E5, 06
?_224:  bsf     rcx, rax                                ; 11E4 _ 48: 0F BC. C8
        add     rdi, 8                                  ; 11E8 _ 48: 83. C7, 08
        or      ecx, r13d                               ; 11EC _ 44: 09. E9
        blsr    rax, rax                                ; 11EF _ C4 E2 F8: F3. C8
        test    rax, rax                                ; 11F4 _ 48: 85. C0
        mov     dword [rdi-8H], ecx                     ; 11F7 _ 89. 4F, F8
        je      ?_174                                   ; 11FA _ 0F 84, FFFFF953
        jmp     ?_224                                   ; 1200 _ EB, E2

?_225:  bsf     r14, r10                                ; 1202 _ 4D: 0F BC. F2
        lea     r8d, [r14+8H]                           ; 1206 _ 45: 8D. 46, 08
        add     rdi, 8                                  ; 120A _ 48: 83. C7, 08
        blsr    r10, r10                                ; 120E _ C4 C2 A8: F3. CA
        shl     r8d, 6                                  ; 1213 _ 41: C1. E0, 06
        or      r14d, r8d                               ; 1217 _ 45: 09. C6
        test    r10, r10                                ; 121A _ 4D: 85. D2
        mov     dword [rdi-8H], r14d                    ; 121D _ 44: 89. 77, F8
        je      ?_177                                   ; 1221 _ 0F 84, FFFFF9BD
        jmp     ?_225                                   ; 1227 _ EB, D9

?_226:  bsf     rax, r12                                ; 1229 _ 49: 0F BC. C4
        lea     r14d, [rax-8H]                          ; 122D _ 44: 8D. 70, F8
        add     rdi, 8                                  ; 1231 _ 48: 83. C7, 08
        blsr    r12, r12                                ; 1235 _ C4 C2 98: F3. CC
        shl     r14d, 6                                 ; 123A _ 41: C1. E6, 06
        or      eax, r14d                               ; 123E _ 44: 09. F0
        test    r12, r12                                ; 1241 _ 4D: 85. E4
        mov     dword [rdi-8H], eax                     ; 1244 _ 89. 47, F8
        je      ?_158                                   ; 1247 _ 0F 84, FFFFF7F2
        jmp     ?_226                                   ; 124D _ EB, DA

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_227:  shl     r12d, 6                                 ; 1250 _ 41: C1. E4, 06
?_228:  bsf     r14, rcx                                ; 1254 _ 4C: 0F BC. F1
        add     rdi, 8                                  ; 1258 _ 48: 83. C7, 08
        or      r14d, r12d                              ; 125C _ 45: 09. E6
        blsr    rcx, rcx                                ; 125F _ C4 E2 F0: F3. C9
        test    rcx, rcx                                ; 1264 _ 48: 85. C9
        mov     dword [rdi-8H], r14d                    ; 1267 _ 44: 89. 77, F8
        je      ?_194                                   ; 126B _ 0F 84, FFFFFB39
        jmp     ?_228                                   ; 1271 _ EB, E1

?_229:  or      r12d, 0C000H                            ; 1273 _ 41: 81. CC, 0000C000
        shl     r14d, 6                                 ; 127A _ 41: C1. E6, 06
        mov     r8, r15                                 ; 127E _ 4D: 89. F8
        or      r14d, r12d                              ; 1281 _ 45: 09. E6
        mov     rcx, rbx                                ; 1284 _ 48: 89. D9
        mov     edx, r14d                               ; 1287 _ 44: 89. F2
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 128A _ E8, 00000000(rel)
        test    al, al                                  ; 128F _ 84. C0
        jne     ?_269                                   ; 1291 _ 0F 85, 00000546
        mov     r8, qword [rbx+100H]                    ; 1297 _ 4C: 8B. 83, 00000100
        mov     qword [rsp+28H], r8                     ; 129E _ 4C: 89. 44 24, 28
        jmp     ?_206                                   ; 12A3 _ E9, FFFFFCB8

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_230:  and     r14d, 04H                               ; 12B0 _ 41: 83. E6, 04
        je      ?_189                                   ; 12B4 _ 0F 84, FFFFFA1A
        and     rax, qword [rbx+130H]                   ; 12BA _ 48: 23. 83, 00000130
        mov     ebp, 62                                 ; 12C1 _ BD, 0000003E
        bsf     rsi, rax                                ; 12C6 _ 48: 0F BC. F0
        cmp     rsi, 62                                 ; 12CA _ 48: 83. FE, 3E
        mov     r12, qword [rbx+270H]                   ; 12CE _ 4C: 8B. A3, 00000270
        jz      ?_232                                   ; 12D5 _ 74, 2E
        mov     r13, qword [rsp+30H]                    ; 12D7 _ 4C: 8B. 6C 24, 30
?_231:  mov     r8, qword [rbx+100H]                    ; 12DC _ 4C: 8B. 83, 00000100
        mov     rdx, rbp                                ; 12E3 _ 48: 89. EA
        mov     rcx, rbx                                ; 12E6 _ 48: 89. D9
        call    _ZNK8Position12attackers_toE6Squarey    ; 12E9 _ E8, 00000000(rel)
        test    rax, r13                                ; 12EE _ 4C: 85. E8
        jne     ?_259                                   ; 12F1 _ 0F 85, 00000363
        lea     eax, [rbp-1H]                           ; 12F7 _ 8D. 45, FF
        sub     rbp, 1                                  ; 12FA _ 48: 83. ED, 01
        cdqe                                            ; 12FE _ 48: 98
        cmp     rsi, rax                                ; 1300 _ 48: 39. C6
        jnz     ?_231                                   ; 1303 _ 75, D7
?_232:  or      r12d, 0C000H                            ; 1305 _ 41: 81. CC, 0000C000
        shl     esi, 6                                  ; 130C _ C1. E6, 06
        mov     r8, r15                                 ; 130F _ 4D: 89. F8
        or      esi, r12d                               ; 1312 _ 44: 09. E6
        mov     rcx, rbx                                ; 1315 _ 48: 89. D9
        mov     edx, esi                                ; 1318 _ 89. F2
        call    _ZNK8Position11gives_checkE4MoveRK9CheckInfo; 131A _ E8, 00000000(rel)
        test    al, al                                  ; 131F _ 84. C0
        jne     ?_270                                   ; 1321 _ 0F 85, 000004CE
        mov     r8, qword [rbx+100H]                    ; 1327 _ 4C: 8B. 83, 00000100
        mov     qword [rsp+28H], r8                     ; 132E _ 4C: 89. 44 24, 28
        jmp     ?_189                                   ; 1333 _ E9, FFFFF99C

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_233:  mov     r14, qword [rsp+30H]                    ; 1340 _ 4C: 8B. 74 24, 30
        shl     r8, 8                                   ; 1345 _ 49: C1. E0, 08
        mov     r12, qword 0FE000000000000H             ; 1349 _ 49: BC, 00FE000000000000
        mov     rcx, qword 7F000000000000H              ; 1353 _ 48: B9, 007F000000000000
        and     rcx, r11                                ; 135D _ 4C: 21. D9
        and     r11, r12                                ; 1360 _ 4D: 21. E3
        mov     rax, r8                                 ; 1363 _ 4C: 89. C0
        shl     r11, 7                                  ; 1366 _ 49: C1. E3, 07
        shl     rcx, 9                                  ; 136A _ 48: C1. E1, 09
        and     rax, rdx                                ; 136E _ 48: 21. D0
        and     r11, r14                                ; 1371 _ 4D: 21. F3
        and     rcx, r14                                ; 1374 _ 4C: 21. F1
        mov     r12, r11                                ; 1377 _ 4D: 89. DC
?_234:  test    rcx, rcx                                ; 137A _ 48: 85. C9
        jne     ?_265                                   ; 137D _ 0F 85, 000003D6
?_235:  test    r12, r12                                ; 1383 _ 4D: 85. E4
        jne     ?_268                                   ; 1386 _ 0F 85, 00000429
?_236:  test    rax, rax                                ; 138C _ 48: 85. C0
        je      ?_160                                   ; 138F _ 0F 84, FFFFF6BC
        mov     rcx, qword [rel .refptr.SquareBB]       ; 1395 _ 48: 8B. 0D, 00000000(rel)
        bsf     r14, rax                                ; 139C _ 4C: 0F BC. F0
        blsr    rax, rax                                ; 13A0 _ C4 E2 F8: F3. C8
        mov     r12, qword [rcx+r13*8]                  ; 13A5 _ 4E: 8B. 24 E9
        test    qword [r10+r14*8+400H], r12             ; 13A9 _ 4F: 85. A4 F2, 00000400
        jnz     ?_238                                   ; 13B1 _ 75, 1C
?_237:  test    rax, rax                                ; 13B3 _ 48: 85. C0
        je      ?_160                                   ; 13B6 _ 0F 84, FFFFF695
        bsf     r14, rax                                ; 13BC _ 4C: 0F BC. F0
        blsr    rax, rax                                ; 13C0 _ C4 E2 F8: F3. C8
        test    qword [r10+r14*8+400H], r12             ; 13C5 _ 4F: 85. A4 F2, 00000400
        jz      ?_237                                   ; 13CD _ 74, E4
?_238:  mov     r12d, r14d                              ; 13CF _ 45: 89. F4
        sub     r14d, 8                                 ; 13D2 _ 41: 83. EE, 08
        add     rdi, 8                                  ; 13D6 _ 48: 83. C7, 08
        or      r12d, 4000H                             ; 13DA _ 41: 81. CC, 00004000
        shl     r14d, 6                                 ; 13E1 _ 41: C1. E6, 06
        or      r14d, r12d                              ; 13E5 _ 45: 09. E6
        mov     dword [rdi-8H], r14d                    ; 13E8 _ 44: 89. 77, F8
        jmp     ?_236                                   ; 13EC _ EB, 9E

?_239:  mov     rbp, qword [rbx+100H]                   ; 13EE _ 48: 8B. AB, 00000100
        mov     r13, rsi                                ; 13F5 _ 49: 89. F5
        mov     r10, qword [rsp+90H]                    ; 13F8 _ 4C: 8B. 94 24, 00000090
        mov     r9, rbp                                 ; 1400 _ 49: 89. E9
        not     r9                                      ; 1403 _ 49: F7. D1
?_240:  bsf     r11, r13                                ; 1406 _ 4D: 0F BC. DD
        mov     r14d, dword [rbx+r11*4]                 ; 140A _ 46: 8B. 34 9B
        blsr    r13, r13                                ; 140E _ C4 C2 90: F3. CD
        and     r14d, 07H                               ; 1413 _ 41: 83. E6, 07
        cmp     r14d, 1                                 ; 1417 _ 41: 83. FE, 01
        jne     ?_254                                   ; 141B _ 0F 85, 000001A8
?_241:  test    r13, r13                                ; 1421 _ 4D: 85. ED
        je      ?_156                                   ; 1424 _ 0F 84, FFFFF57B
        jmp     ?_240                                   ; 142A _ EB, DA

?_242:  mov     r13, qword [rel .refptr.FileBB]         ; 142C _ 4C: 8B. 2D, 00000000(rel)
        mov     r14, r12                                ; 1433 _ 4D: 89. E6
        shr     r8, 8                                   ; 1436 _ 49: C1. E8, 08
        and     r14d, 07H                               ; 143A _ 41: 83. E6, 07
        mov     r14, qword [r13+r14*8]                  ; 143E _ 4F: 8B. 74 F5, 00
        mov     r13, qword 0FF0000000000H               ; 1443 _ 49: BD, 0000FF0000000000
        andn    r8, r14, r8                             ; 144D _ C4 42 88: F2. C0
        and     r8, rdx                                 ; 1452 _ 49: 21. D0
        and     r13, r8                                 ; 1455 _ 4D: 21. C5
        or      r10, r8                                 ; 1458 _ 4D: 09. C2
        shr     r13, 8                                  ; 145B _ 49: C1. ED, 08
        and     r13, rdx                                ; 145F _ 49: 21. D5
        or      rcx, r13                                ; 1462 _ 4C: 09. E9
        jmp     ?_176                                   ; 1465 _ E9, FFFFF771

?_243:  mov     r11, qword [rel .refptr.SquareBB]       ; 146A _ 4C: 8B. 1D, 00000000(rel)
        test    qword [r11+r13*8], rsi                  ; 1471 _ 4B: 85. 34 EB
        je      ?_196                                   ; 1475 _ 0F 84, FFFFF943
        jmp     ?_165                                   ; 147B _ E9, FFFFF635

?_244:  mov     r11, qword [rel .refptr.SquareBB]       ; 1480 _ 4C: 8B. 1D, 00000000(rel)
        test    qword [r11+r13*8], rsi                  ; 1487 _ 4B: 85. 34 EB
        je      ?_173                                   ; 148B _ 0F 84, FFFFF6B1
        jmp     ?_161                                   ; 1491 _ E9, FFFFF5CD

?_245:  mov     r11, qword [rel .refptr.SquareBB]       ; 1496 _ 4C: 8B. 1D, 00000000(rel)
        test    qword [r11+r13*8], rsi                  ; 149D _ 4B: 85. 34 EB
        je      ?_210                                   ; 14A1 _ 0F 84, FFFFFB67
        jmp     ?_186                                   ; 14A7 _ E9, FFFFF7E4

?_246:  mov     r11, qword [rel .refptr.SquareBB]       ; 14AC _ 4C: 8B. 1D, 00000000(rel)
        test    qword [r11+r12*8], rsi                  ; 14B3 _ 4B: 85. 34 E3
        je      ?_193                                   ; 14B7 _ 0F 84, FFFFF8D5
        jmp     ?_180                                   ; 14BD _ E9, FFFFF746

?_247:  mov     r14, qword [rel .refptr.SquareBB]       ; 14C2 _ 4C: 8B. 35, 00000000(rel)
        test    qword [r14+r8*8], rsi                   ; 14C9 _ 4B: 85. 34 C6
        je      ?_200                                   ; 14CD _ 0F 84, FFFFF974
        jmp     ?_202                                   ; 14D3 _ E9, FFFFF9E0

?_248:  mov     r10, qword [rsp+30H]                    ; 14D8 _ 4C: 8B. 54 24, 30
        mov     r8, r9                                  ; 14DD _ 4D: 89. C8
        mov     rcx, r11                                ; 14E0 _ 4C: 89. D9
        and     r9d, 7F00H                              ; 14E3 _ 41: 81. E1, 00007F00
        mov     r11, qword [rel .refptr.SquareBB]       ; 14EA _ 4C: 8B. 1D, 00000000(rel)
        and     r8d, 0FE00H                             ; 14F1 _ 41: 81. E0, 0000FE00
        mov     r13, r9                                 ; 14F8 _ 4D: 89. CD
        shr     rcx, 8                                  ; 14FB _ 48: C1. E9, 08
        shr     r8, 9                                   ; 14FF _ 49: C1. E8, 09
        shr     r13, 7                                  ; 1503 _ 49: C1. ED, 07
        and     rcx, rdx                                ; 1507 _ 48: 21. D1
        and     r8, r10                                 ; 150A _ 4D: 21. D0
        and     r13, r10                                ; 150D _ 4D: 21. D5
?_249:  test    r8, r8                                  ; 1510 _ 4D: 85. C0
        jne     ?_264                                   ; 1513 _ 0F 85, 000001FC
        mov     r14, qword [rel .refptr.SquareBB]       ; 1519 _ 4C: 8B. 35, 00000000(rel)
?_250:  test    r13, r13                                ; 1520 _ 4D: 85. ED
        jne     ?_263                                   ; 1523 _ 0F 85, 000001A8
        mov     r13, qword [rel .refptr.SquareBB]       ; 1529 _ 4C: 8B. 2D, 00000000(rel)
?_251:  test    rcx, rcx                                ; 1530 _ 48: 85. C9
        je      ?_179                                   ; 1533 _ 0F 84, FFFFF6BD
        mov     r10, qword [rel .refptr.StepAttacksBB]  ; 1539 _ 4C: 8B. 15, 00000000(rel)
        bsf     r8, rcx                                 ; 1540 _ 4C: 0F BC. C1
        blsr    rcx, rcx                                ; 1544 _ C4 E2 F0: F3. C9
        mov     r11, qword [r10+r8*8+400H]              ; 1549 _ 4F: 8B. 9C C2, 00000400
        test    qword [r13+r12*8], r11                  ; 1551 _ 4F: 85. 5C E5, 00
        jz      ?_251                                   ; 1556 _ 74, D8
        mov     r9d, r8d                                ; 1558 _ 45: 89. C1
        add     r8d, 8                                  ; 155B _ 41: 83. C0, 08
        add     rdi, 8                                  ; 155F _ 48: 83. C7, 08
        or      r9d, 4000H                              ; 1563 _ 41: 81. C9, 00004000
        shl     r8d, 6                                  ; 156A _ 41: C1. E0, 06
        or      r8d, r9d                                ; 156E _ 45: 09. C8
        mov     dword [rdi-8H], r8d                     ; 1571 _ 44: 89. 47, F8
        jmp     ?_251                                   ; 1575 _ EB, B9

?_252:  mov     rax, qword [rel .refptr.FileBB]         ; 1577 _ 48: 8B. 05, 00000000(rel)
        mov     r14, r13                                ; 157E _ 4D: 89. EE
        and     r14d, 07H                               ; 1581 _ 41: 83. E6, 07
        mov     r14, qword [rax+r14*8]                  ; 1585 _ 4E: 8B. 34 F0
        mov     rax, qword [rsp+38H]                    ; 1589 _ 48: 8B. 44 24, 38
        shl     rax, 8                                  ; 158E _ 48: C1. E0, 08
        andn    r14, r14, rax                           ; 1592 _ C4 62 88: F2. F0
        and     r14, rdx                                ; 1597 _ 49: 21. D6
        or      r12, r14                                ; 159A _ 4D: 09. F4
        and     r14d, 0FF0000H                          ; 159D _ 41: 81. E6, 00FF0000
        shl     r14, 8                                  ; 15A4 _ 49: C1. E6, 08
        and     r14, rdx                                ; 15A8 _ 49: 21. D6
        or      rcx, r14                                ; 15AB _ 4C: 09. F1
        jmp     ?_157                                   ; 15AE _ E9, FFFFF483

?_253:  mov     r14, qword [rel .refptr.SquareBB]       ; 15B3 _ 4C: 8B. 35, 00000000(rel)
        test    qword [r14+r9*8], rsi                   ; 15BA _ 4B: 85. 34 CE
        je      ?_214                                   ; 15BE _ 0F 84, FFFFFAD3
        jmp     ?_216                                   ; 15C4 _ E9, FFFFFB3F

?_254:  mov     ecx, r14d                               ; 15C9 _ 44: 89. F1
        mov     r8, rbp                                 ; 15CC _ 49: 89. E8
        mov     rdx, r11                                ; 15CF _ 4C: 89. DA
        mov     qword [rsp+38H], r9                     ; 15D2 _ 4C: 89. 4C 24, 38
        mov     qword [rsp+30H], r10                    ; 15D7 _ 4C: 89. 54 24, 30
        mov     qword [rsp+28H], r11                    ; 15DC _ 4C: 89. 5C 24, 28
        call    _Z10attacks_bb5Piece6Squarey            ; 15E1 _ E8, 00000000(rel)
        mov     r9, qword [rsp+38H]                     ; 15E6 _ 4C: 8B. 4C 24, 38
        mov     rcx, qword [rsp+28H]                    ; 15EB _ 48: 8B. 4C 24, 28
        mov     r10, qword [rsp+30H]                    ; 15F0 _ 4C: 8B. 54 24, 30
        and     rax, r9                                 ; 15F5 _ 4C: 21. C8
        cmp     r14d, 6                                 ; 15F8 _ 41: 83. FE, 06
        je      ?_262                                   ; 15FC _ 0F 84, 000000B6
?_255:  test    rax, rax                                ; 1602 _ 48: 85. C0
        je      ?_241                                   ; 1605 _ 0F 84, FFFFFE16
        shl     ecx, 6                                  ; 160B _ C1. E1, 06
; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_256:  bsf     r11, rax                                ; 1610 _ 4C: 0F BC. D8
        add     rdi, 8                                  ; 1614 _ 48: 83. C7, 08
        or      r11d, ecx                               ; 1618 _ 41: 09. CB
        blsr    rax, rax                                ; 161B _ C4 E2 F8: F3. C8
        test    rax, rax                                ; 1620 _ 48: 85. C0
        mov     dword [rdi-8H], r11d                    ; 1623 _ 44: 89. 5F, F8
        jnz     ?_256                                   ; 1627 _ 75, E7
        jmp     ?_241                                   ; 1629 _ E9, FFFFFDF3

?_257:  mov     r8, qword [rel .refptr.SquareBB]        ; 162E _ 4C: 8B. 05, 00000000(rel)
        test    qword [r8+r13*8], rsi                   ; 1635 _ 4B: 85. 34 E8
        je      ?_218                                   ; 1639 _ 0F 84, FFFFFAEA
        jmp     ?_171                                   ; 163F _ E9, FFFFF4E0

?_258:  mov     r9, qword [rel .refptr.SquareBB]        ; 1644 _ 4C: 8B. 0D, 00000000(rel)
        test    qword [r9+r13*8], rsi                   ; 164B _ 4B: 85. 34 E9
        je      ?_221                                   ; 164F _ 0F 84, FFFFFB34
        jmp     ?_183                                   ; 1655 _ E9, FFFFF5F4

?_259:  mov     rdx, qword [rbx+100H]                   ; 165A _ 48: 8B. 93, 00000100
        mov     qword [rsp+28H], rdx                    ; 1661 _ 48: 89. 54 24, 28
        jmp     ?_189                                   ; 1666 _ E9, FFFFF669

?_260:  bsf     rax, rcx                                ; 166B _ 48: 0F BC. C1
        lea     r12d, [rax-10H]                         ; 166F _ 44: 8D. 60, F0
        add     rdi, 8                                  ; 1673 _ 48: 83. C7, 08
        blsr    rcx, rcx                                ; 1677 _ C4 E2 F0: F3. C9
        shl     r12d, 6                                 ; 167C _ 41: C1. E4, 06
        or      eax, r12d                               ; 1680 _ 44: 09. E0
        test    rcx, rcx                                ; 1683 _ 48: 85. C9
        mov     dword [rdi-8H], eax                     ; 1686 _ 89. 47, F8
        je      ?_159                                   ; 1689 _ 0F 84, FFFFF3B9
        jmp     ?_260                                   ; 168F _ EB, DA

?_261:  bsf     r13, rcx                                ; 1691 _ 4C: 0F BC. E9
        lea     r14d, [r13+10H]                         ; 1695 _ 45: 8D. 75, 10
        add     rdi, 8                                  ; 1699 _ 48: 83. C7, 08
        blsr    rcx, rcx                                ; 169D _ C4 E2 F0: F3. C9
        shl     r14d, 6                                 ; 16A2 _ 41: C1. E6, 06
        or      r13d, r14d                              ; 16A6 _ 45: 09. F5
        test    rcx, rcx                                ; 16A9 _ 48: 85. C9
        mov     dword [rdi-8H], r13d                    ; 16AC _ 44: 89. 6F, F8
        je      ?_178                                   ; 16B0 _ 0F 84, FFFFF537
        jmp     ?_261                                   ; 16B6 _ EB, D9

?_262:  mov     rdx, qword [rel .refptr.PseudoAttacks]  ; 16B8 _ 48: 8B. 15, 00000000(rel)
        mov     r8, qword [rdx+r10*8+0A00H]             ; 16BF _ 4E: 8B. 84 D2, 00000A00
        andn    rax, r8, rax                            ; 16C7 _ C4 E2 B8: F2. C0
        jmp     ?_255                                   ; 16CC _ E9, FFFFFF31

?_263:  mov     r10, qword [rel .refptr.StepAttacksBB]  ; 16D1 _ 4C: 8B. 15, 00000000(rel)
        bsf     r8, r13                                 ; 16D8 _ 4D: 0F BC. C5
        blsr    r13, r13                                ; 16DC _ C4 C2 90: F3. CD
        mov     r11, qword [r10+r8*8+400H]              ; 16E1 _ 4F: 8B. 9C C2, 00000400
        test    qword [r14+r12*8], r11                  ; 16E9 _ 4F: 85. 1C E6
        je      ?_250                                   ; 16ED _ 0F 84, FFFFFE2D
        mov     r9d, r8d                                ; 16F3 _ 45: 89. C1
        add     r8d, 7                                  ; 16F6 _ 41: 83. C0, 07
        add     rdi, 8                                  ; 16FA _ 48: 83. C7, 08
        or      r9d, 4000H                              ; 16FE _ 41: 81. C9, 00004000
        shl     r8d, 6                                  ; 1705 _ 41: C1. E0, 06
        or      r8d, r9d                                ; 1709 _ 45: 09. C8
        mov     dword [rdi-8H], r8d                     ; 170C _ 44: 89. 47, F8
        jmp     ?_250                                   ; 1710 _ E9, FFFFFE0B

?_264:  mov     r14, qword [rel .refptr.StepAttacksBB]  ; 1715 _ 4C: 8B. 35, 00000000(rel)
        bsf     r9, r8                                  ; 171C _ 4D: 0F BC. C8
        blsr    r8, r8                                  ; 1720 _ C4 C2 B8: F3. C8
        mov     r10, qword [r14+r9*8+400H]              ; 1725 _ 4F: 8B. 94 CE, 00000400
        test    qword [r11+r12*8], r10                  ; 172D _ 4F: 85. 14 E3
        je      ?_249                                   ; 1731 _ 0F 84, FFFFFDD9
        mov     r14d, r9d                               ; 1737 _ 45: 89. CE
        add     r9d, 9                                  ; 173A _ 41: 83. C1, 09
        add     rdi, 8                                  ; 173E _ 48: 83. C7, 08
        or      r14d, 4000H                             ; 1742 _ 41: 81. CE, 00004000
        shl     r9d, 6                                  ; 1749 _ 41: C1. E1, 06
        or      r9d, r14d                               ; 174D _ 45: 09. F1
        mov     dword [rdi-8H], r9d                     ; 1750 _ 44: 89. 4F, F8
        jmp     ?_249                                   ; 1754 _ E9, FFFFFDB7

?_265:  mov     r11, qword [rel .refptr.SquareBB]       ; 1759 _ 4C: 8B. 1D, 00000000(rel)
        bsf     r8, rcx                                 ; 1760 _ 4C: 0F BC. C1
        blsr    rcx, rcx                                ; 1764 _ C4 E2 F0: F3. C9
        mov     r14, qword [r11+r13*8]                  ; 1769 _ 4F: 8B. 34 EB
        test    qword [r10+r8*8+400H], r14              ; 176D _ 4F: 85. B4 C2, 00000400
        jnz     ?_267                                   ; 1775 _ 75, 1C
?_266:  test    rcx, rcx                                ; 1777 _ 48: 85. C9
        je      ?_235                                   ; 177A _ 0F 84, FFFFFC03
        bsf     r8, rcx                                 ; 1780 _ 4C: 0F BC. C1
        blsr    rcx, rcx                                ; 1784 _ C4 E2 F0: F3. C9
        test    qword [r10+r8*8+400H], r14              ; 1789 _ 4F: 85. B4 C2, 00000400
        jz      ?_266                                   ; 1791 _ 74, E4
?_267:  mov     r11d, r8d                               ; 1793 _ 45: 89. C3
        sub     r8d, 9                                  ; 1796 _ 41: 83. E8, 09
        add     rdi, 8                                  ; 179A _ 48: 83. C7, 08
        or      r11d, 4000H                             ; 179E _ 41: 81. CB, 00004000
        shl     r8d, 6                                  ; 17A5 _ 41: C1. E0, 06
        or      r8d, r11d                               ; 17A9 _ 45: 09. D8
        mov     dword [rdi-8H], r8d                     ; 17AC _ 44: 89. 47, F8
        jmp     ?_234                                   ; 17B0 _ E9, FFFFFBC5

?_268:  mov     r8, qword [rel .refptr.SquareBB]        ; 17B5 _ 4C: 8B. 05, 00000000(rel)
        bsf     rcx, r12                                ; 17BC _ 49: 0F BC. CC
        blsr    r12, r12                                ; 17C0 _ C4 C2 98: F3. CC
        mov     r11, qword [r8+r13*8]                   ; 17C5 _ 4F: 8B. 1C E8
        test    qword [r10+rcx*8+400H], r11             ; 17C9 _ 4D: 85. 9C CA, 00000400
        jnz     ?_271                                   ; 17D1 _ 75, 39
        test    r12, r12                                ; 17D3 _ 4D: 85. E4
        jnz     ?_272                                   ; 17D6 _ 75, 53
        jmp     ?_236                                   ; 17D8 _ E9, FFFFFBAF

?_269:  mov     rdx, qword [rbx+100H]                   ; 17DD _ 48: 8B. 93, 00000100
        mov     dword [rdi], r14d                       ; 17E4 _ 44: 89. 37
        add     rdi, 8                                  ; 17E7 _ 48: 83. C7, 08
        mov     qword [rsp+28H], rdx                    ; 17EB _ 48: 89. 54 24, 28
        jmp     ?_206                                   ; 17F0 _ E9, FFFFF76B

?_270:  mov     r10, qword [rbx+100H]                   ; 17F5 _ 4C: 8B. 93, 00000100
        mov     dword [rdi], esi                        ; 17FC _ 89. 37
        add     rdi, 8                                  ; 17FE _ 48: 83. C7, 08
        mov     qword [rsp+28H], r10                    ; 1802 _ 4C: 89. 54 24, 28
        jmp     ?_189                                   ; 1807 _ E9, FFFFF4C8

?_271:  mov     r8d, ecx                                ; 180C _ 41: 89. C8
        sub     ecx, 7                                  ; 180F _ 83. E9, 07
        add     rdi, 8                                  ; 1812 _ 48: 83. C7, 08
        or      r8d, 4000H                              ; 1816 _ 41: 81. C8, 00004000
        shl     ecx, 6                                  ; 181D _ C1. E1, 06
        or      ecx, r8d                                ; 1820 _ 44: 09. C1
        mov     dword [rdi-8H], ecx                     ; 1823 _ 89. 4F, F8
        jmp     ?_235                                   ; 1826 _ E9, FFFFFB58
; _Z8generateIL7GenType2EEP7ExtMoveRK8PositionS2_ End of function

?_272:  ; Local function
        jmp     .text.unlikely+0ECH                     ; 182B _ E9, 000000EC(rel)

_Z8generateIL7GenType3EEP7ExtMoveRK8PositionS2_:; Function begin
        push    r15                                     ; 1830 _ 41: 57
        push    r14                                     ; 1832 _ 41: 56
        push    r13                                     ; 1834 _ 41: 55
        push    r12                                     ; 1836 _ 41: 54
        push    rbp                                     ; 1838 _ 55
        push    rdi                                     ; 1839 _ 57
        push    rsi                                     ; 183A _ 56
        push    rbx                                     ; 183B _ 53
        sub     rsp, 24                                 ; 183C _ 48: 83. EC, 18
        mov     r14, -1                                 ; 1840 _ 49: C7. C6, FFFFFFFF
        mov     rdi, qword [rcx+3B8H]                   ; 1847 _ 48: 8B. B9, 000003B8
        mov     r10, qword [rcx+108H]                   ; 184E _ 4C: 8B. 91, 00000108
        mov     r8, qword [rcx+110H]                    ; 1855 _ 4C: 8B. 81, 00000110
        mov     rax, rdx                                ; 185C _ 48: 89. D0
        mov     rbp, qword [rdi+38H]                    ; 185F _ 48: 8B. 6F, 38
        mov     edx, dword [rcx+3ACH]                   ; 1863 _ 8B. 91, 000003AC
        mov     rsi, r10                                ; 1869 _ 4C: 89. D6
        or      rsi, r8                                 ; 186C _ 4C: 09. C6
        mov     r11, qword [rcx+rdx*8+140H]             ; 186F _ 4C: 8B. 9C D1, 00000140
        mov     rbx, rdx                                ; 1877 _ 48: 89. D3
        andn    rdx, rsi, rbp                           ; 187A _ C4 E2 C8: F2. D5
        and     r11, qword [rcx+130H]                   ; 187F _ 4C: 23. 99, 00000130
        bsf     r11, r11                                ; 1886 _ 4D: 0F BC. DB
        test    rdx, rdx                                ; 188A _ 48: 85. D2
        jne     ?_297                                   ; 188D _ 0F 85, 000002D1
?_273:  movsxd  r13, ebx                                ; 1893 _ 4C: 63. EB
        mov     r15, qword [rel .refptr.StepAttacksBB]  ; 1896 _ 4C: 8B. 3D, 00000000(rel)
        mov     r9, qword [rcx+r13*8+140H]              ; 189D _ 4E: 8B. 8C E9, 00000140
        andn    rdx, r9, qword [r15+r11*8+0C00H]        ; 18A5 _ C4 82 B0: F2. 94 DF, 00000C00
        and     rdx, r14                                ; 18AF _ 4C: 21. F2
        jz      ?_275                                   ; 18B2 _ 74, 1F
        mov     r12d, r11d                              ; 18B4 _ 45: 89. DC
        shl     r12d, 6                                 ; 18B7 _ 41: C1. E4, 06
?_274:  bsf     rsi, rdx                                ; 18BB _ 48: 0F BC. F2
        add     rax, 8                                  ; 18BF _ 48: 83. C0, 08
        or      esi, r12d                               ; 18C3 _ 44: 09. E6
        blsr    rdx, rdx                                ; 18C6 _ C4 E2 E8: F3. CA
        test    rdx, rdx                                ; 18CB _ 48: 85. D2
        mov     dword [rax-8H], esi                     ; 18CE _ 89. 70, F8
        jnz     ?_274                                   ; 18D1 _ 75, E8
?_275:  blsr    r14, rbp                                ; 18D3 _ C4 E2 88: F3. CD
        test    r14, r14                                ; 18D8 _ 4D: 85. F6
        jne     ?_285                                   ; 18DB _ 0F 85, 0000014E
        mov     r9, qword [rel .refptr.SquareBB]        ; 18E1 _ 4C: 8B. 0D, 00000000(rel)
        mov     r12, qword [rel .refptr.BetweenBB]      ; 18E8 _ 4C: 8B. 25, 00000000(rel)
        bsf     rbp, rbp                                ; 18EF _ 48: 0F BC. ED
        mov     r13, rbp                                ; 18F3 _ 49: 89. ED
        shl     r13, 6                                  ; 18F6 _ 49: C1. E5, 06
        mov     rdx, qword [r9+rbp*8]                   ; 18FA _ 49: 8B. 14 E9
        add     r11, r13                                ; 18FE _ 4D: 01. EB
        or      rdx, qword [r12+r11*8]                  ; 1901 _ 4B: 0B. 14 DC
        test    ebx, ebx                                ; 1905 _ 85. DB
        je      ?_301                                   ; 1907 _ 0F 84, 000002C3
        mov     r9, qword [rcx+148H]                    ; 190D _ 4C: 8B. 89, 00000148
        mov     rbp, rdx                                ; 1914 _ 48: 89. D5
        mov     r11, qword 0FF0000000000H               ; 1917 _ 49: BB, 0000FF0000000000
        mov     rsi, qword [rcx+100H]                   ; 1921 _ 48: 8B. B1, 00000100
        and     rbp, qword [rcx+140H]                   ; 1928 _ 48: 23. A9, 00000140
        and     r10, r9                                 ; 192F _ 4D: 21. CA
        mov     r14, r10                                ; 1932 _ 4D: 89. D6
        mov     r12, rsi                                ; 1935 _ 49: 89. F4
        mov     r13, r10                                ; 1938 _ 4D: 89. D5
        and     r14, 0FFFFFFFFFFFF00FFH                 ; 193B _ 49: 81. E6, FFFF00FF
        not     r12                                     ; 1942 _ 49: F7. D4
        and     r13d, 0FF00H                            ; 1945 _ 41: 81. E5, 0000FF00
        mov     rbx, r14                                ; 194C _ 4C: 89. F3
        shr     rbx, 8                                  ; 194F _ 48: C1. EB, 08
        and     rbx, r12                                ; 1953 _ 4C: 21. E3
        and     r11, rbx                                ; 1956 _ 49: 21. DB
        shr     r11, 8                                  ; 1959 _ 49: C1. EB, 08
        and     r11, r12                                ; 195D _ 4D: 21. E3
        and     r11, rdx                                ; 1960 _ 49: 21. D3
        and     rbx, rdx                                ; 1963 _ 48: 21. D3
        jne     ?_329                                   ; 1966 _ 0F 85, 000005D4
?_276:  test    r11, r11                                ; 196C _ 4D: 85. DB
        jne     ?_339                                   ; 196F _ 0F 85, 0000071B
        test    r13, r13                                ; 1975 _ 4D: 85. ED
        jne     ?_334                                   ; 1978 _ 0F 85, 00000650
?_277:  mov     r11, qword 0FEFEFEFEFEFE00FEH           ; 197E _ 49: BB, FEFEFEFEFEFE00FE
        mov     r12, qword 7F7F7F7F7F7F007FH            ; 1988 _ 49: BC, 7F7F7F7F7F7F007F
        and     r11, r10                                ; 1992 _ 4D: 21. D3
        and     r10, r12                                ; 1995 _ 4D: 21. E2
        shr     r10, 7                                  ; 1998 _ 49: C1. EA, 07
        shr     r11, 9                                  ; 199C _ 49: C1. EB, 09
        and     r10, rbp                                ; 19A0 _ 49: 21. EA
        and     rbp, r11                                ; 19A3 _ 4C: 21. DD
        jne     ?_323                                   ; 19A6 _ 0F 85, 00000490
?_278:  test    r10, r10                                ; 19AC _ 4D: 85. D2
        jne     ?_333                                   ; 19AF _ 0F 85, 000005F9
        mov     r11, qword [rdi+28H]                    ; 19B5 _ 4C: 8B. 5F, 28
        cmp     r11, 64                                 ; 19B9 _ 49: 83. FB, 40
        jne     ?_341                                   ; 19BD _ 0F 85, 00000711
?_279:  and     r8, r9                                  ; 19C3 _ 4D: 21. C8
        jne     ?_288                                   ; 19C6 _ 0F 85, 00000097
?_280:  mov     r14, r9                                 ; 19CC _ 4D: 89. CE
        and     r14, qword [rcx+118H]                   ; 19CF _ 4C: 23. B1, 00000118
        jne     ?_289                                   ; 19D6 _ 0F 85, 000000A8
        mov     r11, r9                                 ; 19DC _ 4D: 89. CB
        and     r11, qword [rcx+120H]                   ; 19DF _ 4C: 23. 99, 00000120
        jz      ?_284                                   ; 19E6 _ 74, 3A
?_281:  mov     r12, qword [rel .refptr.RookMasks]      ; 19E8 _ 4C: 8B. 25, 00000000(rel)
        mov     rdi, qword [rel .refptr.RookAttacks]    ; 19EF _ 48: 8B. 3D, 00000000(rel)
?_282:  bsf     r14, r11                                ; 19F6 _ 4D: 0F BC. F3
        mov     rbp, qword [rdi+r14*8]                  ; 19FA _ 4A: 8B. 2C F7
        pext    r15, rsi, qword [r12+r14*8]             ; 19FE _ C4 02 CA: F5. 3C F4
        mov     r13d, r15d                              ; 1A04 _ 45: 89. FD
        blsr    r11, r11                                ; 1A07 _ C4 C2 A0: F3. CB
        mov     r8, rdx                                 ; 1A0C _ 49: 89. D0
        and     r8, qword [rbp+r13*8]                   ; 1A0F _ 4E: 23. 44 ED, 00
        mov     r10, r8                                 ; 1A14 _ 4D: 89. C2
        jne     ?_299                                   ; 1A17 _ 0F 85, 00000187
?_283:  test    r11, r11                                ; 1A1D _ 4D: 85. DB
        jnz     ?_282                                   ; 1A20 _ 75, D4
?_284:  and     r9, qword [rcx+128H]                    ; 1A22 _ 4C: 23. 89, 00000128
        jne     ?_293                                   ; 1A29 _ 0F 85, 000000C1
?_285:  add     rsp, 24                                 ; 1A2F _ 48: 83. C4, 18
        pop     rbx                                     ; 1A33 _ 5B
        pop     rsi                                     ; 1A34 _ 5E
        pop     rdi                                     ; 1A35 _ 5F
        pop     rbp                                     ; 1A36 _ 5D
        pop     r12                                     ; 1A37 _ 41: 5C
        pop     r13                                     ; 1A39 _ 41: 5D
        pop     r14                                     ; 1A3B _ 41: 5E
        pop     r15                                     ; 1A3D _ 41: 5F
        ret                                             ; 1A3F _ C3

?_286:  shl     ebp, 6                                  ; 1A40 _ C1. E5, 06
?_287:  bsf     rbx, r10                                ; 1A43 _ 49: 0F BC. DA
        add     rax, 8                                  ; 1A47 _ 48: 83. C0, 08
        or      ebx, ebp                                ; 1A4B _ 09. EB
        blsr    r10, r10                                ; 1A4D _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 1A52 _ 4D: 85. D2
        mov     dword [rax-8H], ebx                     ; 1A55 _ 89. 58, F8
        jnz     ?_287                                   ; 1A58 _ 75, E9
        test    r8, r8                                  ; 1A5A _ 4D: 85. C0
        je      ?_280                                   ; 1A5D _ 0F 84, FFFFFF69
?_288:  bsf     rbp, r8                                 ; 1A63 _ 49: 0F BC. E8
        mov     r10, rdx                                ; 1A67 _ 49: 89. D2
        blsr    r8, r8                                  ; 1A6A _ C4 C2 B8: F3. C8
        and     r10, qword [r15+rbp*8+400H]             ; 1A6F _ 4D: 23. 94 EF, 00000400
        jnz     ?_286                                   ; 1A77 _ 75, C7
        test    r8, r8                                  ; 1A79 _ 4D: 85. C0
        je      ?_280                                   ; 1A7C _ 0F 84, FFFFFF4A
        jmp     ?_288                                   ; 1A82 _ EB, DF

?_289:  mov     r12, qword [rel .refptr.BishopMasks]    ; 1A84 _ 4C: 8B. 25, 00000000(rel)
        mov     rdi, qword [rel .refptr.BishopAttacks]  ; 1A8B _ 48: 8B. 3D, 00000000(rel)
?_290:  bsf     r11, r14                                ; 1A92 _ 4D: 0F BC. DE
        mov     rbp, qword [rdi+r11*8]                  ; 1A96 _ 4A: 8B. 2C DF
        pext    r15, rsi, qword [r12+r11*8]             ; 1A9A _ C4 02 CA: F5. 3C DC
        mov     r13d, r15d                              ; 1AA0 _ 45: 89. FD
        blsr    r14, r14                                ; 1AA3 _ C4 C2 88: F3. CE
        mov     r8, rdx                                 ; 1AA8 _ 49: 89. D0
        and     r8, qword [rbp+r13*8]                   ; 1AAB _ 4E: 23. 44 ED, 00
        mov     r10, r8                                 ; 1AB0 _ 4D: 89. C2
        jz      ?_292                                   ; 1AB3 _ 74, 1C
        shl     r11d, 6                                 ; 1AB5 _ 41: C1. E3, 06
?_291:  bsf     rbx, r10                                ; 1AB9 _ 49: 0F BC. DA
        add     rax, 8                                  ; 1ABD _ 48: 83. C0, 08
        or      ebx, r11d                               ; 1AC1 _ 44: 09. DB
        blsr    r10, r10                                ; 1AC4 _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 1AC9 _ 4D: 85. D2
        mov     dword [rax-8H], ebx                     ; 1ACC _ 89. 58, F8
        jnz     ?_291                                   ; 1ACF _ 75, E8
?_292:  test    r14, r14                                ; 1AD1 _ 4D: 85. F6
        jnz     ?_290                                   ; 1AD4 _ 75, BC
        mov     r11, r9                                 ; 1AD6 _ 4D: 89. CB
        and     r11, qword [rcx+120H]                   ; 1AD9 _ 4C: 23. 99, 00000120
        jne     ?_281                                   ; 1AE0 _ 0F 85, FFFFFF02
        jmp     ?_284                                   ; 1AE6 _ E9, FFFFFF37

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_293:  mov     r14, qword [rel .refptr.BishopMasks]    ; 1AF0 _ 4C: 8B. 35, 00000000(rel)
        mov     rdi, qword [rel .refptr.BishopAttacks]  ; 1AF7 _ 48: 8B. 3D, 00000000(rel)
        mov     r15, qword [rel .refptr.RookMasks]      ; 1AFE _ 4C: 8B. 3D, 00000000(rel)
        mov     r11, qword [rel .refptr.RookAttacks]    ; 1B05 _ 4C: 8B. 1D, 00000000(rel)
?_294:  bsf     rbp, r9                                 ; 1B0C _ 49: 0F BC. E9
        mov     r13, qword [rdi+rbp*8]                  ; 1B10 _ 4C: 8B. 2C EF
        pext    rcx, rsi, qword [r14+rbp*8]             ; 1B14 _ C4 C2 CA: F5. 0C EE
        pext    r12, rsi, qword [r15+rbp*8]             ; 1B1A _ C4 42 CA: F5. 24 EF
        mov     r8d, ecx                                ; 1B20 _ 41: 89. C8
        mov     r10, qword [r11+rbp*8]                  ; 1B23 _ 4D: 8B. 14 EB
        mov     ebx, r12d                               ; 1B27 _ 44: 89. E3
        blsr    r9, r9                                  ; 1B2A _ C4 C2 B0: F3. C9
        mov     rcx, qword [r13+r8*8]                   ; 1B2F _ 4B: 8B. 4C C5, 00
        or      rcx, qword [r10+rbx*8]                  ; 1B34 _ 49: 0B. 0C DA
        and     rcx, rdx                                ; 1B38 _ 48: 21. D1
        jz      ?_296                                   ; 1B3B _ 74, 1C
        shl     ebp, 6                                  ; 1B3D _ C1. E5, 06
?_295:  bsf     r12, rcx                                ; 1B40 _ 4C: 0F BC. E1
        add     rax, 8                                  ; 1B44 _ 48: 83. C0, 08
        or      r12d, ebp                               ; 1B48 _ 41: 09. EC
        blsr    rcx, rcx                                ; 1B4B _ C4 E2 F0: F3. C9
        test    rcx, rcx                                ; 1B50 _ 48: 85. C9
        mov     dword [rax-8H], r12d                    ; 1B53 _ 44: 89. 60, F8
        jnz     ?_295                                   ; 1B57 _ 75, E7
?_296:  test    r9, r9                                  ; 1B59 _ 4D: 85. C9
        je      ?_285                                   ; 1B5C _ 0F 84, FFFFFECD
        jmp     ?_294                                   ; 1B62 _ EB, A8

?_297:  mov     r14, qword [rel .refptr.SquareBB]       ; 1B64 _ 4C: 8B. 35, 00000000(rel)
        xor     r15d, r15d                              ; 1B6B _ 45: 31. FF
        mov     r13, qword [rel .refptr.LineBB]         ; 1B6E _ 4C: 8B. 2D, 00000000(rel)
?_298:  bsf     r9, rdx                                 ; 1B75 _ 4C: 0F BC. CA
        mov     r12, r9                                 ; 1B79 _ 4D: 89. CC
        mov     rsi, qword [r14+r9*8]                   ; 1B7C _ 4B: 8B. 34 CE
        blsr    rdx, rdx                                ; 1B80 _ C4 E2 E8: F3. CA
        shl     r12, 6                                  ; 1B85 _ 49: C1. E4, 06
        add     r12, r11                                ; 1B89 _ 4D: 01. DC
        xor     rsi, qword [r13+r12*8]                  ; 1B8C _ 4B: 33. 74 E5, 00
        or      r15, rsi                                ; 1B91 _ 49: 09. F7
        test    rdx, rdx                                ; 1B94 _ 48: 85. D2
        jnz     ?_298                                   ; 1B97 _ 75, DC
        not     r15                                     ; 1B99 _ 49: F7. D7
        mov     r14, r15                                ; 1B9C _ 4D: 89. FE
        jmp     ?_273                                   ; 1B9F _ E9, FFFFFCEF

?_299:  shl     r14d, 6                                 ; 1BA4 _ 41: C1. E6, 06
?_300:  bsf     rbx, r10                                ; 1BA8 _ 49: 0F BC. DA
        add     rax, 8                                  ; 1BAC _ 48: 83. C0, 08
        or      ebx, r14d                               ; 1BB0 _ 44: 09. F3
        blsr    r10, r10                                ; 1BB3 _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 1BB8 _ 4D: 85. D2
        mov     dword [rax-8H], ebx                     ; 1BBB _ 89. 58, F8
        je      ?_283                                   ; 1BBE _ 0F 84, FFFFFE59
        jmp     ?_300                                   ; 1BC4 _ EB, E2

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_301:  mov     r9, qword [rcx+140H]                    ; 1BD0 _ 4C: 8B. 89, 00000140
        mov     r12, rdx                                ; 1BD7 _ 49: 89. D4
        mov     rsi, qword 0FF00FFFFFFFFFFFFH           ; 1BDA _ 48: BE, FF00FFFFFFFFFFFF
        mov     rbp, qword 0FF000000000000H             ; 1BE4 _ 48: BD, 00FF000000000000
        mov     r14, rsi                                ; 1BEE _ 49: 89. F6
        mov     rsi, qword [rcx+100H]                   ; 1BF1 _ 48: 8B. B1, 00000100
        and     r12, qword [rcx+148H]                   ; 1BF8 _ 4C: 23. A1, 00000148
        and     r10, r9                                 ; 1BFF _ 4D: 21. CA
        and     r14, r10                                ; 1C02 _ 4D: 21. D6
        mov     r13, rsi                                ; 1C05 _ 49: 89. F5
        and     rbp, r10                                ; 1C08 _ 4C: 21. D5
        mov     rbx, r14                                ; 1C0B _ 4C: 89. F3
        not     r13                                     ; 1C0E _ 49: F7. D5
        shl     rbx, 8                                  ; 1C11 _ 48: C1. E3, 08
        and     rbx, r13                                ; 1C15 _ 4C: 21. EB
        mov     r11, rbx                                ; 1C18 _ 49: 89. DB
        and     r11d, 0FF0000H                          ; 1C1B _ 41: 81. E3, 00FF0000
        shl     r11, 8                                  ; 1C22 _ 49: C1. E3, 08
        and     r11, r13                                ; 1C26 _ 4D: 21. EB
        and     r11, rdx                                ; 1C29 _ 49: 21. D3
        and     rbx, rdx                                ; 1C2C _ 48: 21. D3
        jne     ?_331                                   ; 1C2F _ 0F 85, 00000342
?_302:  test    r11, r11                                ; 1C35 _ 4D: 85. DB
        jne     ?_340                                   ; 1C38 _ 0F 85, 00000474
        test    rbp, rbp                                ; 1C3E _ 48: 85. ED
        jne     ?_325                                   ; 1C41 _ 0F 85, 00000249
?_303:  mov     rbp, qword 7F007F7F7F7F7F7FH            ; 1C47 _ 48: BD, 7F007F7F7F7F7F7F
        mov     rbx, qword 0FE00FEFEFEFEFEFEH           ; 1C51 _ 48: BB, FE00FEFEFEFEFEFE
        and     rbp, r10                                ; 1C5B _ 4C: 21. D5
        and     r10, rbx                                ; 1C5E _ 49: 21. DA
        shl     r10, 7                                  ; 1C61 _ 49: C1. E2, 07
        shl     rbp, 9                                  ; 1C65 _ 48: C1. E5, 09
        and     r10, r12                                ; 1C69 _ 4D: 21. E2
        and     r12, rbp                                ; 1C6C _ 49: 21. EC
        jne     ?_324                                   ; 1C6F _ 0F 85, 000001ED
?_304:  test    r10, r10                                ; 1C75 _ 4D: 85. D2
        jne     ?_338                                   ; 1C78 _ 0F 85, 000003F2
        mov     r11, qword [rdi+28H]                    ; 1C7E _ 4C: 8B. 5F, 28
        cmp     r11, 64                                 ; 1C82 _ 49: 83. FB, 40
        jne     ?_343                                   ; 1C86 _ 0F 85, 00000495
?_305:  and     r8, r9                                  ; 1C8C _ 4D: 21. C8
        jne     ?_316                                   ; 1C8F _ 0F 85, 00000101
?_306:  mov     r8, r9                                  ; 1C95 _ 4D: 89. C8
        and     r8, qword [rcx+118H]                    ; 1C98 _ 4C: 23. 81, 00000118
        jne     ?_319                                   ; 1C9F _ 0F 85, 0000013E
?_307:  mov     r11, r9                                 ; 1CA5 _ 4D: 89. CB
        and     r11, qword [rcx+120H]                   ; 1CA8 _ 4C: 23. 99, 00000120
        jz      ?_310                                   ; 1CAF _ 74, 3A
        mov     rbp, qword [rel .refptr.RookMasks]      ; 1CB1 _ 48: 8B. 2D, 00000000(rel)
        mov     rdi, qword [rel .refptr.RookAttacks]    ; 1CB8 _ 48: 8B. 3D, 00000000(rel)
?_308:  bsf     r15, r11                                ; 1CBF _ 4D: 0F BC. FB
        mov     rbx, qword [rdi+r15*8]                  ; 1CC3 _ 4A: 8B. 1C FF
        pext    r8, rsi, qword [rbp+r15*8]              ; 1CC7 _ C4 22 CA: F5. 44 FD, 00
        mov     r12d, r8d                               ; 1CCE _ 45: 89. C4
        blsr    r11, r11                                ; 1CD1 _ C4 C2 A0: F3. CB
        mov     r14, rdx                                ; 1CD6 _ 49: 89. D6
        and     r14, qword [rbx+r12*8]                  ; 1CD9 _ 4E: 23. 34 E3
        mov     r10, r14                                ; 1CDD _ 4D: 89. F2
        jne     ?_317                                   ; 1CE0 _ 0F 85, 000000DA
?_309:  test    r11, r11                                ; 1CE6 _ 4D: 85. DB
        jnz     ?_308                                   ; 1CE9 _ 75, D4
?_310:  and     r9, qword [rcx+128H]                    ; 1CEB _ 4C: 23. 89, 00000128
        je      ?_285                                   ; 1CF2 _ 0F 84, FFFFFD37
        mov     rbp, qword [rel .refptr.BishopMasks]    ; 1CF8 _ 48: 8B. 2D, 00000000(rel)
        mov     rdi, qword [rel .refptr.BishopAttacks]  ; 1CFF _ 48: 8B. 3D, 00000000(rel)
        mov     r15, qword [rel .refptr.RookMasks]      ; 1D06 _ 4C: 8B. 3D, 00000000(rel)
        mov     r11, qword [rel .refptr.RookAttacks]    ; 1D0D _ 4C: 8B. 1D, 00000000(rel)
?_311:  bsf     r8, r9                                  ; 1D14 _ 4D: 0F BC. C1
        mov     r14, qword [rdi+r8*8]                   ; 1D18 _ 4E: 8B. 34 C7
        pext    r12, rsi, qword [r15+r8*8]              ; 1D1C _ C4 02 CA: F5. 24 C7
        mov     r13d, r12d                              ; 1D22 _ 45: 89. E5
        pext    rcx, rsi, qword [rbp+r8*8]              ; 1D25 _ C4 A2 CA: F5. 4C C5, 00
        mov     r10, qword [r11+r8*8]                   ; 1D2C _ 4F: 8B. 14 C3
        mov     ebx, ecx                                ; 1D30 _ 89. CB
        blsr    r9, r9                                  ; 1D32 _ C4 C2 B0: F3. C9
        mov     rcx, qword [r14+rbx*8]                  ; 1D37 _ 49: 8B. 0C DE
        or      rcx, qword [r10+r13*8]                  ; 1D3B _ 4B: 0B. 0C EA
        and     rcx, rdx                                ; 1D3F _ 48: 21. D1
        jz      ?_313                                   ; 1D42 _ 74, 1D
        shl     r8d, 6                                  ; 1D44 _ 41: C1. E0, 06
?_312:  bsf     r12, rcx                                ; 1D48 _ 4C: 0F BC. E1
        add     rax, 8                                  ; 1D4C _ 48: 83. C0, 08
        or      r12d, r8d                               ; 1D50 _ 45: 09. C4
        blsr    rcx, rcx                                ; 1D53 _ C4 E2 F0: F3. C9
        test    rcx, rcx                                ; 1D58 _ 48: 85. C9
        mov     dword [rax-8H], r12d                    ; 1D5B _ 44: 89. 60, F8
        jnz     ?_312                                   ; 1D5F _ 75, E7
?_313:  test    r9, r9                                  ; 1D61 _ 4D: 85. C9
        je      ?_285                                   ; 1D64 _ 0F 84, FFFFFCC5
        jmp     ?_311                                   ; 1D6A _ EB, A8

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_314:  shl     r12d, 6                                 ; 1D70 _ 41: C1. E4, 06
?_315:  bsf     r13, r10                                ; 1D74 _ 4D: 0F BC. EA
        add     rax, 8                                  ; 1D78 _ 48: 83. C0, 08
        or      r13d, r12d                              ; 1D7C _ 45: 09. E5
        blsr    r10, r10                                ; 1D7F _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 1D84 _ 4D: 85. D2
        mov     dword [rax-8H], r13d                    ; 1D87 _ 44: 89. 68, F8
        jnz     ?_315                                   ; 1D8B _ 75, E7
        test    r8, r8                                  ; 1D8D _ 4D: 85. C0
        je      ?_306                                   ; 1D90 _ 0F 84, FFFFFEFF
?_316:  bsf     r12, r8                                 ; 1D96 _ 4D: 0F BC. E0
        mov     r10, rdx                                ; 1D9A _ 49: 89. D2
        blsr    r8, r8                                  ; 1D9D _ C4 C2 B8: F3. C8
        and     r10, qword [r15+r12*8+400H]             ; 1DA2 _ 4F: 23. 94 E7, 00000400
        jnz     ?_314                                   ; 1DAA _ 75, C4
        test    r8, r8                                  ; 1DAC _ 4D: 85. C0
        je      ?_306                                   ; 1DAF _ 0F 84, FFFFFEE0
        jmp     ?_316                                   ; 1DB5 _ EB, DF

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_317:  shl     r15d, 6                                 ; 1DC0 _ 41: C1. E7, 06
?_318:  bsf     r13, r10                                ; 1DC4 _ 4D: 0F BC. EA
        add     rax, 8                                  ; 1DC8 _ 48: 83. C0, 08
        or      r13d, r15d                              ; 1DCC _ 45: 09. FD
        blsr    r10, r10                                ; 1DCF _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 1DD4 _ 4D: 85. D2
        mov     dword [rax-8H], r13d                    ; 1DD7 _ 44: 89. 68, F8
        je      ?_309                                   ; 1DDB _ 0F 84, FFFFFF05
        jmp     ?_318                                   ; 1DE1 _ EB, E1

?_319:  mov     rbp, qword [rel .refptr.BishopMasks]    ; 1DE3 _ 48: 8B. 2D, 00000000(rel)
        mov     rdi, qword [rel .refptr.BishopAttacks]  ; 1DEA _ 48: 8B. 3D, 00000000(rel)
?_320:  bsf     r11, r8                                 ; 1DF1 _ 4D: 0F BC. D8
        mov     rbx, qword [rdi+r11*8]                  ; 1DF5 _ 4A: 8B. 1C DF
        pext    r15, rsi, qword [rbp+r11*8]             ; 1DF9 _ C4 22 CA: F5. 7C DD, 00
        mov     r14d, r15d                              ; 1E00 _ 45: 89. FE
        blsr    r8, r8                                  ; 1E03 _ C4 C2 B8: F3. C8
        mov     r12, rdx                                ; 1E08 _ 49: 89. D4
        and     r12, qword [rbx+r14*8]                  ; 1E0B _ 4E: 23. 24 F3
        mov     r10, r12                                ; 1E0F _ 4D: 89. E2
        jz      ?_322                                   ; 1E12 _ 74, 1D
        shl     r11d, 6                                 ; 1E14 _ 41: C1. E3, 06
?_321:  bsf     r13, r10                                ; 1E18 _ 4D: 0F BC. EA
        add     rax, 8                                  ; 1E1C _ 48: 83. C0, 08
        or      r13d, r11d                              ; 1E20 _ 45: 09. DD
        blsr    r10, r10                                ; 1E23 _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 1E28 _ 4D: 85. D2
        mov     dword [rax-8H], r13d                    ; 1E2B _ 44: 89. 68, F8
        jnz     ?_321                                   ; 1E2F _ 75, E7
?_322:  test    r8, r8                                  ; 1E31 _ 4D: 85. C0
        je      ?_307                                   ; 1E34 _ 0F 84, FFFFFE6B
        jmp     ?_320                                   ; 1E3A _ EB, B5

?_323:  bsf     r13, rbp                                ; 1E3C _ 4C: 0F BC. ED
        lea     ebx, [r13+9H]                           ; 1E40 _ 41: 8D. 5D, 09
        add     rax, 8                                  ; 1E44 _ 48: 83. C0, 08
        blsr    rbp, rbp                                ; 1E48 _ C4 E2 D0: F3. CD
        shl     ebx, 6                                  ; 1E4D _ C1. E3, 06
        or      r13d, ebx                               ; 1E50 _ 41: 09. DD
        test    rbp, rbp                                ; 1E53 _ 48: 85. ED
        mov     dword [rax-8H], r13d                    ; 1E56 _ 44: 89. 68, F8
        je      ?_278                                   ; 1E5A _ 0F 84, FFFFFB4C
        jmp     ?_323                                   ; 1E60 _ EB, DA

?_324:  bsf     r11, r12                                ; 1E62 _ 4D: 0F BC. DC
        lea     r13d, [r11-9H]                          ; 1E66 _ 45: 8D. 6B, F7
        add     rax, 8                                  ; 1E6A _ 48: 83. C0, 08
        blsr    r12, r12                                ; 1E6E _ C4 C2 98: F3. CC
        shl     r13d, 6                                 ; 1E73 _ 41: C1. E5, 06
        or      r11d, r13d                              ; 1E77 _ 45: 09. EB
        test    r12, r12                                ; 1E7A _ 4D: 85. E4
        mov     dword [rax-8H], r11d                    ; 1E7D _ 44: 89. 58, F8
        je      ?_304                                   ; 1E81 _ 0F 84, FFFFFDEE
        jmp     ?_324                                   ; 1E87 _ EB, D9

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_325:  mov     r11, qword 0FF00000000000000H           ; 1E90 _ 49: BB, FF00000000000000
        test    rdx, r11                                ; 1E9A _ 4C: 85. DA
        je      ?_303                                   ; 1E9D _ 0F 84, FFFFFDA4
        mov     rbx, qword 7F000000000000H              ; 1EA3 _ 48: BB, 007F000000000000
        shl     rbp, 8                                  ; 1EAD _ 48: C1. E5, 08
        mov     r11, qword 0FE000000000000H             ; 1EB1 _ 49: BB, 00FE000000000000
        and     rbx, r10                                ; 1EBB _ 4C: 21. D3
        and     r11, r10                                ; 1EBE _ 4D: 21. D3
        and     rbp, r13                                ; 1EC1 _ 4C: 21. ED
        shl     rbx, 9                                  ; 1EC4 _ 48: C1. E3, 09
        shl     r11, 7                                  ; 1EC8 _ 49: C1. E3, 07
        and     rbp, rdx                                ; 1ECC _ 48: 21. D5
        and     rbx, r12                                ; 1ECF _ 4C: 21. E3
        and     r11, r12                                ; 1ED2 _ 4D: 21. E3
        mov     qword [rsp], rbp                        ; 1ED5 _ 48: 89. 2C 24
?_326:  test    rbx, rbx                                ; 1ED9 _ 48: 85. DB
        jne     ?_348                                   ; 1EDC _ 0F 85, 00000370
?_327:  test    r11, r11                                ; 1EE2 _ 4D: 85. DB
        jne     ?_347                                   ; 1EE5 _ 0F 85, 00000321
        mov     r13, qword [rsp]                        ; 1EEB _ 4C: 8B. 2C 24
?_328:  test    r13, r13                                ; 1EEF _ 4D: 85. ED
        je      ?_303                                   ; 1EF2 _ 0F 84, FFFFFD4F
        bsf     rbx, r13                                ; 1EF8 _ 49: 0F BC. DD
        lea     r11d, [rbx-8H]                          ; 1EFC _ 44: 8D. 5B, F8
        add     rax, 32                                 ; 1F00 _ 48: 83. C0, 20
        blsr    r13, r13                                ; 1F04 _ C4 C2 90: F3. CD
        shl     r11d, 6                                 ; 1F09 _ 41: C1. E3, 06
        or      r11d, ebx                               ; 1F0D _ 41: 09. DB
        mov     ebp, r11d                               ; 1F10 _ 44: 89. DD
        mov     ebx, r11d                               ; 1F13 _ 44: 89. DB
        or      ebp, 7000H                              ; 1F16 _ 81. CD, 00007000
        or      bh, 60H                                 ; 1F1C _ 80. CF, 60
        mov     dword [rax-20H], ebp                    ; 1F1F _ 89. 68, E0
        mov     ebp, r11d                               ; 1F22 _ 44: 89. DD
        or      r11d, 4000H                             ; 1F25 _ 41: 81. CB, 00004000
        or      ebp, 5000H                              ; 1F2C _ 81. CD, 00005000
        mov     dword [rax-18H], ebx                    ; 1F32 _ 89. 58, E8
        mov     dword [rax-10H], ebp                    ; 1F35 _ 89. 68, F0
        mov     dword [rax-8H], r11d                    ; 1F38 _ 44: 89. 58, F8
        jmp     ?_328                                   ; 1F3C _ EB, B1

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_329:  mov     qword [rsp], rdi                        ; 1F40 _ 48: 89. 3C 24
        mov     qword [rsp+8H], r9                      ; 1F44 _ 4C: 89. 4C 24, 08
?_330:  bsf     r9, rbx                                 ; 1F49 _ 4C: 0F BC. CB
        lea     edi, [r9+8H]                            ; 1F4D _ 41: 8D. 79, 08
        add     rax, 8                                  ; 1F51 _ 48: 83. C0, 08
        blsr    rbx, rbx                                ; 1F55 _ C4 E2 E0: F3. CB
        shl     edi, 6                                  ; 1F5A _ C1. E7, 06
        or      r9d, edi                                ; 1F5D _ 41: 09. F9
        test    rbx, rbx                                ; 1F60 _ 48: 85. DB
        mov     dword [rax-8H], r9d                     ; 1F63 _ 44: 89. 48, F8
        jnz     ?_330                                   ; 1F67 _ 75, E0
        mov     rdi, qword [rsp]                        ; 1F69 _ 48: 8B. 3C 24
        mov     r9, qword [rsp+8H]                      ; 1F6D _ 4C: 8B. 4C 24, 08
        jmp     ?_276                                   ; 1F72 _ E9, FFFFF9F5

?_331:  mov     qword [rsp+8H], rdx                     ; 1F77 _ 48: 89. 54 24, 08
        mov     rdx, rbx                                ; 1F7C _ 48: 89. DA
        mov     qword [rsp], rdi                        ; 1F7F _ 48: 89. 3C 24
?_332:  bsf     rbx, rdx                                ; 1F83 _ 48: 0F BC. DA
        lea     edi, [rbx-8H]                           ; 1F87 _ 8D. 7B, F8
        add     rax, 8                                  ; 1F8A _ 48: 83. C0, 08
        blsr    rdx, rdx                                ; 1F8E _ C4 E2 E8: F3. CA
        shl     edi, 6                                  ; 1F93 _ C1. E7, 06
        or      ebx, edi                                ; 1F96 _ 09. FB
        test    rdx, rdx                                ; 1F98 _ 48: 85. D2
        mov     dword [rax-8H], ebx                     ; 1F9B _ 89. 58, F8
        jnz     ?_332                                   ; 1F9E _ 75, E3
        mov     rdi, qword [rsp]                        ; 1FA0 _ 48: 8B. 3C 24
        mov     rdx, qword [rsp+8H]                     ; 1FA4 _ 48: 8B. 54 24, 08
        jmp     ?_302                                   ; 1FA9 _ E9, FFFFFC87

?_333:  bsf     r11, r10                                ; 1FAE _ 4D: 0F BC. DA
        lea     ebp, [r11+7H]                           ; 1FB2 _ 41: 8D. 6B, 07
        add     rax, 8                                  ; 1FB6 _ 48: 83. C0, 08
        blsr    r10, r10                                ; 1FBA _ C4 C2 A8: F3. CA
        shl     ebp, 6                                  ; 1FBF _ C1. E5, 06
        or      r11d, ebp                               ; 1FC2 _ 41: 09. EB
        mov     dword [rax-8H], r11d                    ; 1FC5 _ 44: 89. 58, F8
        jmp     ?_278                                   ; 1FC9 _ E9, FFFFF9DE

?_334:  test    dl, dl                                  ; 1FCE _ 84. D2
        je      ?_277                                   ; 1FD0 _ 0F 84, FFFFF9A8
        mov     rbx, r10                                ; 1FD6 _ 4C: 89. D3
        mov     r11, r10                                ; 1FD9 _ 4D: 89. D3
        shr     r13, 8                                  ; 1FDC _ 49: C1. ED, 08
        and     ebx, 0FE00H                             ; 1FE0 _ 81. E3, 0000FE00
        and     r11d, 7F00H                             ; 1FE6 _ 41: 81. E3, 00007F00
        and     r13, r12                                ; 1FED _ 4D: 21. E5
        shr     rbx, 9                                  ; 1FF0 _ 48: C1. EB, 09
        shr     r11, 7                                  ; 1FF4 _ 49: C1. EB, 07
        and     r13, rdx                                ; 1FF8 _ 49: 21. D5
        and     rbx, rbp                                ; 1FFB _ 48: 21. EB
        and     r11, rbp                                ; 1FFE _ 49: 21. EB
        mov     qword [rsp], r13                        ; 2001 _ 4C: 89. 2C 24
?_335:  test    rbx, rbx                                ; 2005 _ 48: 85. DB
        jne     ?_346                                   ; 2008 _ 0F 85, 000001AC
?_336:  test    r11, r11                                ; 200E _ 4D: 85. DB
        jne     ?_345                                   ; 2011 _ 0F 85, 00000157
        mov     r13, qword [rsp]                        ; 2017 _ 4C: 8B. 2C 24
?_337:  test    r13, r13                                ; 201B _ 4D: 85. ED
        je      ?_277                                   ; 201E _ 0F 84, FFFFF95A
        bsf     rbx, r13                                ; 2024 _ 49: 0F BC. DD
        lea     r11d, [rbx+8H]                          ; 2028 _ 44: 8D. 5B, 08
        add     rax, 32                                 ; 202C _ 48: 83. C0, 20
        blsr    r13, r13                                ; 2030 _ C4 C2 90: F3. CD
        shl     r11d, 6                                 ; 2035 _ 41: C1. E3, 06
        or      r11d, ebx                               ; 2039 _ 41: 09. DB
        mov     r12d, r11d                              ; 203C _ 45: 89. DC
        mov     ebx, r11d                               ; 203F _ 44: 89. DB
        or      r12d, 7000H                             ; 2042 _ 41: 81. CC, 00007000
        or      bh, 60H                                 ; 2049 _ 80. CF, 60
        mov     dword [rax-20H], r12d                   ; 204C _ 44: 89. 60, E0
        mov     r12d, r11d                              ; 2050 _ 45: 89. DC
        or      r11d, 4000H                             ; 2053 _ 41: 81. CB, 00004000
        or      r12d, 5000H                             ; 205A _ 41: 81. CC, 00005000
        mov     dword [rax-18H], ebx                    ; 2061 _ 89. 58, E8
        mov     dword [rax-10H], r12d                   ; 2064 _ 44: 89. 60, F0
        mov     dword [rax-8H], r11d                    ; 2068 _ 44: 89. 58, F8
        jmp     ?_337                                   ; 206C _ EB, AD

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_338:  bsf     rbp, r10                                ; 2070 _ 49: 0F BC. EA
        lea     r11d, [rbp-7H]                          ; 2074 _ 44: 8D. 5D, F9
        add     rax, 8                                  ; 2078 _ 48: 83. C0, 08
        blsr    r10, r10                                ; 207C _ C4 C2 A8: F3. CA
        shl     r11d, 6                                 ; 2081 _ 41: C1. E3, 06
        or      ebp, r11d                               ; 2085 _ 44: 09. DD
        mov     dword [rax-8H], ebp                     ; 2088 _ 89. 68, F8
        jmp     ?_304                                   ; 208B _ E9, FFFFFBE5

?_339:  bsf     rbx, r11                                ; 2090 _ 49: 0F BC. DB
        mov     qword [rsp], rbx                        ; 2094 _ 48: 89. 1C 24
        add     ebx, 16                                 ; 2098 _ 83. C3, 10
        add     rax, 8                                  ; 209B _ 48: 83. C0, 08
        blsr    r11, r11                                ; 209F _ C4 C2 A0: F3. CB
        shl     ebx, 6                                  ; 20A4 _ C1. E3, 06
        or      ebx, dword [rsp]                        ; 20A7 _ 0B. 1C 24
        mov     dword [rax-8H], ebx                     ; 20AA _ 89. 58, F8
        jmp     ?_276                                   ; 20AD _ E9, FFFFF8BA

?_340:  bsf     rbx, r11                                ; 20B2 _ 49: 0F BC. DB
        mov     qword [rsp], rbx                        ; 20B6 _ 48: 89. 1C 24
        sub     ebx, 16                                 ; 20BA _ 83. EB, 10
        add     rax, 8                                  ; 20BD _ 48: 83. C0, 08
        blsr    r11, r11                                ; 20C1 _ C4 C2 A0: F3. CB
        shl     ebx, 6                                  ; 20C6 _ C1. E3, 06
        or      ebx, dword [rsp]                        ; 20C9 _ 0B. 1C 24
        mov     dword [rax-8H], ebx                     ; 20CC _ 89. 58, F8
        jmp     ?_302                                   ; 20CF _ E9, FFFFFB61

?_341:  mov     rdi, qword [rel .refptr.SquareBB]       ; 20D4 _ 48: 8B. 3D, 00000000(rel)
        lea     r10d, [r11+8H]                          ; 20DB _ 45: 8D. 53, 08
        movsxd  r12, r10d                               ; 20DF _ 4D: 63. E2
        test    qword [rdi+r12*8], rdx                  ; 20E2 _ 4A: 85. 14 E7
        je      ?_279                                   ; 20E6 _ 0F 84, FFFFF8D7
        and     r14, qword [r15+r11*8+200H]             ; 20EC _ 4F: 23. B4 DF, 00000200
        or      r11d, 8000H                             ; 20F4 _ 41: 81. CB, 00008000
        mov     r13, r14                                ; 20FB _ 4D: 89. F5
?_342:  test    r13, r13                                ; 20FE _ 4D: 85. ED
        je      ?_279                                   ; 2101 _ 0F 84, FFFFF8BC
        bsf     r14, r13                                ; 2107 _ 4D: 0F BC. F5
        shl     r14d, 6                                 ; 210B _ 41: C1. E6, 06
        add     rax, 8                                  ; 210F _ 48: 83. C0, 08
        blsr    r13, r13                                ; 2113 _ C4 C2 90: F3. CD
        or      r14d, r11d                              ; 2118 _ 45: 09. DE
        mov     dword [rax-8H], r14d                    ; 211B _ 44: 89. 70, F8
        jmp     ?_342                                   ; 211F _ EB, DD

?_343:  mov     rdi, qword [rel .refptr.SquareBB]       ; 2121 _ 48: 8B. 3D, 00000000(rel)
        lea     r10d, [r11-8H]                          ; 2128 _ 45: 8D. 53, F8
        movsxd  rbp, r10d                               ; 212C _ 49: 63. EA
        test    qword [rdi+rbp*8], rdx                  ; 212F _ 48: 85. 14 EF
        je      ?_305                                   ; 2133 _ 0F 84, FFFFFB53
        and     r14, qword [r15+r11*8+1200H]            ; 2139 _ 4F: 23. B4 DF, 00001200
        or      r11d, 8000H                             ; 2141 _ 41: 81. CB, 00008000
        mov     rbx, r14                                ; 2148 _ 4C: 89. F3
?_344:  test    rbx, rbx                                ; 214B _ 48: 85. DB
        je      ?_305                                   ; 214E _ 0F 84, FFFFFB38
        bsf     r14, rbx                                ; 2154 _ 4C: 0F BC. F3
        shl     r14d, 6                                 ; 2158 _ 41: C1. E6, 06
        add     rax, 8                                  ; 215C _ 48: 83. C0, 08
        blsr    rbx, rbx                                ; 2160 _ C4 E2 E0: F3. CB
        or      r14d, r11d                              ; 2165 _ 45: 09. DE
        mov     dword [rax-8H], r14d                    ; 2168 _ 44: 89. 70, F8
        jmp     ?_344                                   ; 216C _ EB, DD

?_345:  bsf     r13, r11                                ; 216E _ 4D: 0F BC. EB
        lea     ebx, [r13+7H]                           ; 2172 _ 41: 8D. 5D, 07
        add     rax, 32                                 ; 2176 _ 48: 83. C0, 20
        blsr    r11, r11                                ; 217A _ C4 C2 A0: F3. CB
        shl     ebx, 6                                  ; 217F _ C1. E3, 06
        or      ebx, r13d                               ; 2182 _ 44: 09. EB
        mov     r12d, ebx                               ; 2185 _ 41: 89. DC
        mov     r13d, ebx                               ; 2188 _ 41: 89. DD
        or      r12d, 7000H                             ; 218B _ 41: 81. CC, 00007000
        or      r13d, 6000H                             ; 2192 _ 41: 81. CD, 00006000
        mov     dword [rax-20H], r12d                   ; 2199 _ 44: 89. 60, E0
        mov     r12d, ebx                               ; 219D _ 41: 89. DC
        or      bh, 40H                                 ; 21A0 _ 80. CF, 40
        or      r12d, 5000H                             ; 21A3 _ 41: 81. CC, 00005000
        mov     dword [rax-18H], r13d                   ; 21AA _ 44: 89. 68, E8
        mov     dword [rax-10H], r12d                   ; 21AE _ 44: 89. 60, F0
        mov     dword [rax-8H], ebx                     ; 21B2 _ 89. 58, F8
        jmp     ?_336                                   ; 21B5 _ E9, FFFFFE54

?_346:  bsf     r13, rbx                                ; 21BA _ 4C: 0F BC. EB
        lea     r12d, [r13+9H]                          ; 21BE _ 45: 8D. 65, 09
        add     rax, 32                                 ; 21C2 _ 48: 83. C0, 20
        blsr    rbx, rbx                                ; 21C6 _ C4 E2 E0: F3. CB
        shl     r12d, 6                                 ; 21CB _ 41: C1. E4, 06
        or      r12d, r13d                              ; 21CF _ 45: 09. EC
        mov     r13d, r12d                              ; 21D2 _ 45: 89. E5
        or      r13d, 7000H                             ; 21D5 _ 41: 81. CD, 00007000
        mov     dword [rax-20H], r13d                   ; 21DC _ 44: 89. 68, E0
        mov     r13d, r12d                              ; 21E0 _ 45: 89. E5
        or      r13d, 6000H                             ; 21E3 _ 41: 81. CD, 00006000
        mov     dword [rax-18H], r13d                   ; 21EA _ 44: 89. 68, E8
        mov     r13d, r12d                              ; 21EE _ 45: 89. E5
        or      r12d, 4000H                             ; 21F1 _ 41: 81. CC, 00004000
        or      r13d, 5000H                             ; 21F8 _ 41: 81. CD, 00005000
        mov     dword [rax-10H], r13d                   ; 21FF _ 44: 89. 68, F0
        mov     dword [rax-8H], r12d                    ; 2203 _ 44: 89. 60, F8
        jmp     ?_335                                   ; 2207 _ E9, FFFFFDF9

?_347:  bsf     r13, r11                                ; 220C _ 4D: 0F BC. EB
        lea     ebx, [r13-7H]                           ; 2210 _ 41: 8D. 5D, F9
        add     rax, 32                                 ; 2214 _ 48: 83. C0, 20
        blsr    r11, r11                                ; 2218 _ C4 C2 A0: F3. CB
        shl     ebx, 6                                  ; 221D _ C1. E3, 06
        or      ebx, r13d                               ; 2220 _ 44: 09. EB
        mov     ebp, ebx                                ; 2223 _ 89. DD
        mov     r13d, ebx                               ; 2225 _ 41: 89. DD
        or      ebp, 7000H                              ; 2228 _ 81. CD, 00007000
        or      r13d, 6000H                             ; 222E _ 41: 81. CD, 00006000
        mov     dword [rax-20H], ebp                    ; 2235 _ 89. 68, E0
        mov     ebp, ebx                                ; 2238 _ 89. DD
        or      bh, 40H                                 ; 223A _ 80. CF, 40
        or      ebp, 5000H                              ; 223D _ 81. CD, 00005000
        mov     dword [rax-18H], r13d                   ; 2243 _ 44: 89. 68, E8
        mov     dword [rax-10H], ebp                    ; 2247 _ 89. 68, F0
        mov     dword [rax-8H], ebx                     ; 224A _ 89. 58, F8
        jmp     ?_327                                   ; 224D _ E9, FFFFFC90
; _Z8generateIL7GenType3EEP7ExtMoveRK8PositionS2_ End of function

?_348:  ; Local function
        bsf     r13, rbx                                ; 2252 _ 4C: 0F BC. EB
        lea     ebp, [r13-9H]                           ; 2256 _ 41: 8D. 6D, F7
        add     rax, 32                                 ; 225A _ 48: 83. C0, 20
        blsr    rbx, rbx                                ; 225E _ C4 E2 E0: F3. CB
        shl     ebp, 6                                  ; 2263 _ C1. E5, 06
        or      ebp, r13d                               ; 2266 _ 44: 09. ED
        mov     r13d, ebp                               ; 2269 _ 41: 89. ED
        or      r13d, 7000H                             ; 226C _ 41: 81. CD, 00007000
        mov     dword [rax-20H], r13d                   ; 2273 _ 44: 89. 68, E0
        mov     r13d, ebp                               ; 2277 _ 41: 89. ED
        or      r13d, 6000H                             ; 227A _ 41: 81. CD, 00006000
        mov     dword [rax-18H], r13d                   ; 2281 _ 44: 89. 68, E8
        mov     r13d, ebp                               ; 2285 _ 41: 89. ED
        or      ebp, 4000H                              ; 2288 _ 81. CD, 00004000
        or      r13d, 5000H                             ; 228E _ 41: 81. CD, 00005000
        mov     dword [rax-10H], r13d                   ; 2295 _ 44: 89. 68, F0
        mov     dword [rax-8H], ebp                     ; 2299 _ 89. 68, F8
        jmp     ?_326                                   ; 229C _ E9, FFFFFC38

        nop                                             ; 22A1 _ 90
        nop                                             ; 22A2 _ 90
        nop                                             ; 22A3 _ 90
        nop                                             ; 22A4 _ 90
        nop                                             ; 22A5 _ 90
        nop                                             ; 22A6 _ 90
        nop                                             ; 22A7 _ 90
        nop                                             ; 22A8 _ 90
        nop                                             ; 22A9 _ 90
        nop                                             ; 22AA _ 90
        nop                                             ; 22AB _ 90
        nop                                             ; 22AC _ 90
        nop                                             ; 22AD _ 90
        nop                                             ; 22AE _ 90
        nop                                             ; 22AF _ 90


SECTION .xdata.hot align=4 noexecute                    ; section number 6, const

        db 01H, 0CH, 07H, 00H, 0CH, 42H, 08H, 30H       ; 0000 _ .....B.0
        db 07H, 60H, 06H, 70H, 05H, 50H, 04H, 0C0H      ; 0008 _ .`.p.P..
        db 02H, 0D0H, 00H, 00H, 01H, 10H, 09H, 00H      ; 0010 _ ........
        db 10H, 42H, 0CH, 30H, 0BH, 60H, 0AH, 70H       ; 0018 _ .B.0.`.p
        db 09H, 50H, 08H, 0C0H, 06H, 0D0H, 04H, 0E0H    ; 0020 _ .P......
        db 02H, 0F0H, 00H, 00H, 01H, 13H, 0AH, 00H      ; 0028 _ ........
        db 13H, 01H, 15H, 00H, 0CH, 30H, 0BH, 60H       ; 0030 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 0038 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H, 01H, 10H, 09H, 00H     ; 0040 _ ........
        db 10H, 22H, 0CH, 30H, 0BH, 60H, 0AH, 70H       ; 0048 _ .".0.`.p
        db 09H, 50H, 08H, 0C0H, 06H, 0D0H, 04H, 0E0H    ; 0050 _ .P......
        db 02H, 0F0H, 00H, 00H                          ; 0058 _ ....


SECTION .text$_Z8generateIL7GenType4EEP7ExtMoveRK8PositionS2_ align=16 execute ; section number 8, code
;  Communal section not supported by YASM

_Z8generateIL7GenType4EEP7ExtMoveRK8PositionS2_:; Function begin
        movsxd  r8, dword [rcx+3ACH]                    ; 0000 _ 4C: 63. 81, 000003AC
        mov     rax, r8                                 ; 0007 _ 4C: 89. C0
        mov     r8, qword [rcx+r8*8+140H]               ; 000A _ 4E: 8B. 84 C1, 00000140
        test    eax, eax                                ; 0012 _ 85. C0
        not     r8                                      ; 0014 _ 49: F7. D0
        jnz     ?_349                                   ; 0017 _ 75, 05
        jmp     _ZN12_GLOBAL__N_112generate_allIL5Color0EL7GenType4EEEP7ExtMoveRK8PositionS4_yPK9CheckInfo.isra.54; 0019 _ E9, 00000390(rel)
; _Z8generateIL7GenType4EEP7ExtMoveRK8PositionS2_ End of function

?_349:  ; Local function
        jmp     _ZN12_GLOBAL__N_112generate_allIL5Color1EL7GenType4EEEP7ExtMoveRK8PositionS4_yPK9CheckInfo.isra.59; 001E _ E9, 00000000(rel)

        nop                                             ; 0023 _ 90
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


SECTION .xdata$_Z8generateIL7GenType4EEP7ExtMoveRK8PositionS2_ align=4 noexecute ; section number 9, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text$_Z8generateIL7GenType0EEP7ExtMoveRK8PositionS2_ align=16 execute ; section number 11, code
;  Communal section not supported by YASM

_Z8generateIL7GenType0EEP7ExtMoveRK8PositionS2_:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        mov     r9d, dword [rcx+3ACH]                   ; 000C _ 44: 8B. 89, 000003AC
        mov     rax, rdx                                ; 0013 _ 48: 89. D0
        mov     edx, r9d                                ; 0016 _ 44: 89. CA
        xor     edx, 01H                                ; 0019 _ 83. F2, 01
        test    r9d, r9d                                ; 001C _ 45: 85. C9
        movsxd  rbx, edx                                ; 001F _ 48: 63. DA
        mov     r8, qword [rcx+rbx*8+140H]              ; 0022 _ 4C: 8B. 84 D9, 00000140
        jne     ?_367                                   ; 002A _ 0F 85, 000001E0
        mov     rdx, qword [rcx+140H]                   ; 0030 _ 48: 8B. 91, 00000140
        mov     rdi, qword 0FF000000000000H             ; 0037 _ 48: BF, 00FF000000000000
        mov     r11, rdx                                ; 0041 _ 49: 89. D3
        and     r11, qword [rcx+108H]                   ; 0044 _ 4C: 23. 99, 00000108
        and     rdi, r11                                ; 004B _ 4C: 21. DF
        jne     ?_402                                   ; 004E _ 0F 85, 0000058D
?_350:  mov     r10, qword 7F007F7F7F7F7F7FH            ; 0054 _ 49: BA, 7F007F7F7F7F7F7F
        mov     r12, qword 0FE00FEFEFEFEFEFEH           ; 005E _ 49: BC, FE00FEFEFEFEFEFE
        and     r10, r11                                ; 0068 _ 4D: 21. DA
        and     r12, r11                                ; 006B _ 4D: 21. DC
        shl     r12, 7                                  ; 006E _ 49: C1. E4, 07
        shl     r10, 9                                  ; 0072 _ 49: C1. E2, 09
        and     r12, r8                                 ; 0076 _ 4D: 21. C4
        and     r10, r8                                 ; 0079 _ 4D: 21. C2
        jne     ?_392                                   ; 007C _ 0F 85, 0000041E
?_351:  test    r12, r12                                ; 0082 _ 4D: 85. E4
        jne     ?_399                                   ; 0085 _ 0F 85, 00000516
        mov     r9, qword [rcx+3B8H]                    ; 008B _ 4C: 8B. 89, 000003B8
        mov     rdi, qword [r9+28H]                     ; 0092 _ 49: 8B. 79, 28
        mov     r9, qword [rel .refptr.StepAttacksBB]   ; 0096 _ 4C: 8B. 0D, 00000000(rel)
        cmp     rdi, 64                                 ; 009D _ 48: 83. FF, 40
        jne     ?_410                                   ; 00A1 _ 0F 85, 00000679
?_352:  mov     r14, rdx                                ; 00A7 _ 49: 89. D6
        and     r14, qword [rcx+110H]                   ; 00AA _ 4C: 23. B1, 00000110
        jne     ?_364                                   ; 00B1 _ 0F 85, 00000109
        mov     r14, rdx                                ; 00B7 _ 49: 89. D6
        and     r14, qword [rcx+118H]                   ; 00BA _ 4C: 23. B1, 00000118
        jne     ?_360                                   ; 00C1 _ 0F 85, 00000089
?_353:  mov     rbx, rdx                                ; 00C7 _ 48: 89. D3
        and     rbx, qword [rcx+120H]                   ; 00CA _ 48: 23. 99, 00000120
        jz      ?_357                                   ; 00D1 _ 74, 41
?_354:  mov     r13, qword [rcx+100H]                   ; 00D3 _ 4C: 8B. A9, 00000100
        mov     rbp, qword [rel .refptr.RookMasks]      ; 00DA _ 48: 8B. 2D, 00000000(rel)
        mov     rdi, qword [rel .refptr.RookAttacks]    ; 00E1 _ 48: 8B. 3D, 00000000(rel)
?_355:  bsf     r12, rbx                                ; 00E8 _ 4C: 0F BC. E3
        mov     rsi, qword [rdi+r12*8]                  ; 00EC _ 4A: 8B. 34 E7
        pext    r14, r13, qword [rbp+r12*8]             ; 00F0 _ C4 22 92: F5. 74 E5, 00
        mov     r15d, r14d                              ; 00F7 _ 45: 89. F7
        blsr    rbx, rbx                                ; 00FA _ C4 E2 E0: F3. CB
        mov     r11, r8                                 ; 00FF _ 4D: 89. C3
        and     r11, qword [rsi+r15*8]                  ; 0102 _ 4E: 23. 1C FE
        mov     r10, r11                                ; 0106 _ 4D: 89. DA
        jne     ?_384                                   ; 0109 _ 0F 85, 000002C6
?_356:  test    rbx, rbx                                ; 010F _ 48: 85. DB
        jnz     ?_355                                   ; 0112 _ 75, D4
?_357:  mov     r11, rdx                                ; 0114 _ 49: 89. D3
        and     r11, qword [rcx+128H]                   ; 0117 _ 4C: 23. 99, 00000128
        jne     ?_388                                   ; 011E _ 0F 85, 000002FE
?_358:  and     rdx, qword [rcx+130H]                   ; 0124 _ 48: 23. 91, 00000130
        bsf     rdx, rdx                                ; 012B _ 48: 0F BC. D2
        and     r8, qword [r9+rdx*8+0C00H]              ; 012F _ 4D: 23. 84 D1, 00000C00
        jne     ?_400                                   ; 0137 _ 0F 85, 00000484
?_359:  pop     rbx                                     ; 013D _ 5B
        pop     rsi                                     ; 013E _ 5E
        pop     rdi                                     ; 013F _ 5F
        pop     rbp                                     ; 0140 _ 5D
        pop     r12                                     ; 0141 _ 41: 5C
        pop     r13                                     ; 0143 _ 41: 5D
        pop     r14                                     ; 0145 _ 41: 5E
        pop     r15                                     ; 0147 _ 41: 5F
        ret                                             ; 0149 _ C3

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_360:  mov     r13, qword [rcx+100H]                   ; 0150 _ 4C: 8B. A9, 00000100
        mov     rbp, qword [rel .refptr.BishopMasks]    ; 0157 _ 48: 8B. 2D, 00000000(rel)
        mov     rdi, qword [rel .refptr.BishopAttacks]  ; 015E _ 48: 8B. 3D, 00000000(rel)
?_361:  bsf     rbx, r14                                ; 0165 _ 49: 0F BC. DE
        mov     rsi, qword [rdi+rbx*8]                  ; 0169 _ 48: 8B. 34 DF
        pext    r10, r13, qword [rbp+rbx*8]             ; 016D _ C4 62 92: F5. 54 DD, 00
        mov     r12d, r10d                              ; 0174 _ 45: 89. D4
        blsr    r14, r14                                ; 0177 _ C4 C2 88: F3. CE
        mov     r15, r8                                 ; 017C _ 4D: 89. C7
        and     r15, qword [rsi+r12*8]                  ; 017F _ 4E: 23. 3C E6
        mov     r10, r15                                ; 0183 _ 4D: 89. FA
        jz      ?_363                                   ; 0186 _ 74, 1C
        shl     ebx, 6                                  ; 0188 _ C1. E3, 06
?_362:  bsf     r11, r10                                ; 018B _ 4D: 0F BC. DA
        add     rax, 8                                  ; 018F _ 48: 83. C0, 08
        or      r11d, ebx                               ; 0193 _ 41: 09. DB
        blsr    r10, r10                                ; 0196 _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 019B _ 4D: 85. D2
        mov     dword [rax-8H], r11d                    ; 019E _ 44: 89. 58, F8
        jnz     ?_362                                   ; 01A2 _ 75, E7
?_363:  test    r14, r14                                ; 01A4 _ 4D: 85. F6
        jnz     ?_361                                   ; 01A7 _ 75, BC
        mov     rbx, rdx                                ; 01A9 _ 48: 89. D3
        and     rbx, qword [rcx+120H]                   ; 01AC _ 48: 23. 99, 00000120
        jne     ?_354                                   ; 01B3 _ 0F 85, FFFFFF1A
        jmp     ?_357                                   ; 01B9 _ E9, FFFFFF56

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_364:  bsf     rdi, r14                                ; 01C0 _ 49: 0F BC. FE
        mov     r11, r8                                 ; 01C4 _ 4D: 89. C3
        blsr    r14, r14                                ; 01C7 _ C4 C2 88: F3. CE
        and     r11, qword [r9+rdi*8+400H]              ; 01CC _ 4D: 23. 9C F9, 00000400
        jz      ?_366                                   ; 01D4 _ 74, 1C
        shl     edi, 6                                  ; 01D6 _ C1. E7, 06
?_365:  bsf     r12, r11                                ; 01D9 _ 4D: 0F BC. E3
        add     rax, 8                                  ; 01DD _ 48: 83. C0, 08
        or      r12d, edi                               ; 01E1 _ 41: 09. FC
        blsr    r11, r11                                ; 01E4 _ C4 C2 A0: F3. CB
        test    r11, r11                                ; 01E9 _ 4D: 85. DB
        mov     dword [rax-8H], r12d                    ; 01EC _ 44: 89. 60, F8
        jnz     ?_365                                   ; 01F0 _ 75, E7
?_366:  test    r14, r14                                ; 01F2 _ 4D: 85. F6
        jnz     ?_364                                   ; 01F5 _ 75, C9
        mov     r14, rdx                                ; 01F7 _ 49: 89. D6
        and     r14, qword [rcx+118H]                   ; 01FA _ 4C: 23. B1, 00000118
        je      ?_353                                   ; 0201 _ 0F 84, FFFFFEC0
        jmp     ?_360                                   ; 0207 _ E9, FFFFFF44

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_367:  mov     rdx, qword [rcx+148H]                   ; 0210 _ 48: 8B. 91, 00000148
        mov     r11, rdx                                ; 0217 _ 49: 89. D3
        and     r11, qword [rcx+108H]                   ; 021A _ 4C: 23. 99, 00000108
        mov     rdi, r11                                ; 0221 _ 4C: 89. DF
        and     edi, 0FF00H                             ; 0224 _ 81. E7, 0000FF00
        jne     ?_405                                   ; 022A _ 0F 85, 0000042E
?_368:  mov     r14, qword 0FEFEFEFEFEFE00FEH           ; 0230 _ 49: BE, FEFEFEFEFEFE00FE
        mov     r12, qword 7F7F7F7F7F7F007FH            ; 023A _ 49: BC, 7F7F7F7F7F7F007F
        and     r14, r11                                ; 0244 _ 4D: 21. DE
        and     r12, r11                                ; 0247 _ 4D: 21. DC
        shr     r12, 7                                  ; 024A _ 49: C1. EC, 07
        shr     r14, 9                                  ; 024E _ 49: C1. EE, 09
        and     r12, r8                                 ; 0252 _ 4D: 21. C4
        and     r14, r8                                 ; 0255 _ 4D: 21. C6
        jne     ?_393                                   ; 0258 _ 0F 85, 00000272
?_369:  test    r12, r12                                ; 025E _ 4D: 85. E4
        jne     ?_398                                   ; 0261 _ 0F 85, 00000319
        mov     r9, qword [rcx+3B8H]                    ; 0267 _ 4C: 8B. 89, 000003B8
        mov     rbx, qword [r9+28H]                     ; 026E _ 49: 8B. 59, 28
        mov     r9, qword [rel .refptr.StepAttacksBB]   ; 0272 _ 4C: 8B. 0D, 00000000(rel)
        cmp     rbx, 64                                 ; 0279 _ 48: 83. FB, 40
        jne     ?_412                                   ; 027D _ 0F 85, 000004DB
?_370:  mov     rdi, rdx                                ; 0283 _ 48: 89. D7
        and     rdi, qword [rcx+110H]                   ; 0286 _ 48: 23. B9, 00000110
        jne     ?_383                                   ; 028D _ 0F 85, 00000121
?_371:  mov     r10, rdx                                ; 0293 _ 49: 89. D2
        and     r10, qword [rcx+118H]                   ; 0296 _ 4C: 23. 91, 00000118
        jz      ?_375                                   ; 029D _ 74, 5B
        mov     r12, qword [rcx+100H]                   ; 029F _ 4C: 8B. A1, 00000100
        mov     rbp, qword [rel .refptr.BishopMasks]    ; 02A6 _ 48: 8B. 2D, 00000000(rel)
        mov     r13, qword [rel .refptr.BishopAttacks]  ; 02AD _ 4C: 8B. 2D, 00000000(rel)
?_372:  bsf     r15, r10                                ; 02B4 _ 4D: 0F BC. FA
        mov     rdi, qword [r13+r15*8]                  ; 02B8 _ 4B: 8B. 7C FD, 00
        pext    r14, r12, qword [rbp+r15*8]             ; 02BD _ C4 22 9A: F5. 74 FD, 00
        mov     ebx, r14d                               ; 02C4 _ 44: 89. F3
        blsr    r10, r10                                ; 02C7 _ C4 C2 A8: F3. CA
        mov     rsi, r8                                 ; 02CC _ 4C: 89. C6
        and     rsi, qword [rdi+rbx*8]                  ; 02CF _ 48: 23. 34 DF
        mov     r11, rsi                                ; 02D3 _ 49: 89. F3
        jz      ?_374                                   ; 02D6 _ 74, 1D
        shl     r15d, 6                                 ; 02D8 _ 41: C1. E7, 06
?_373:  bsf     r14, r11                                ; 02DC _ 4D: 0F BC. F3
        add     rax, 8                                  ; 02E0 _ 48: 83. C0, 08
        or      r14d, r15d                              ; 02E4 _ 45: 09. FE
        blsr    r11, r11                                ; 02E7 _ C4 C2 A0: F3. CB
        test    r11, r11                                ; 02EC _ 4D: 85. DB
        mov     dword [rax-8H], r14d                    ; 02EF _ 44: 89. 70, F8
        jnz     ?_373                                   ; 02F3 _ 75, E7
?_374:  test    r10, r10                                ; 02F5 _ 4D: 85. D2
        jnz     ?_372                                   ; 02F8 _ 75, BA
?_375:  mov     rbx, rdx                                ; 02FA _ 48: 89. D3
        and     rbx, qword [rcx+120H]                   ; 02FD _ 48: 23. 99, 00000120
        jz      ?_378                                   ; 0304 _ 74, 42
        mov     r12, qword [rcx+100H]                   ; 0306 _ 4C: 8B. A1, 00000100
        mov     rbp, qword [rel .refptr.RookMasks]      ; 030D _ 48: 8B. 2D, 00000000(rel)
        mov     r13, qword [rel .refptr.RookAttacks]    ; 0314 _ 4C: 8B. 2D, 00000000(rel)
?_376:  bsf     rdi, rbx                                ; 031B _ 48: 0F BC. FB
        mov     rsi, qword [r13+rdi*8]                  ; 031F _ 49: 8B. 74 FD, 00
        pext    r15, r12, qword [rbp+rdi*8]             ; 0324 _ C4 62 9A: F5. 7C FD, 00
        mov     r10d, r15d                              ; 032B _ 45: 89. FA
        blsr    rbx, rbx                                ; 032E _ C4 E2 E0: F3. CB
        mov     r14, r8                                 ; 0333 _ 4D: 89. C6
        and     r14, qword [rsi+r10*8]                  ; 0336 _ 4E: 23. 34 D6
        mov     r15, r14                                ; 033A _ 4D: 89. F7
        jne     ?_386                                   ; 033D _ 0F 85, 000000BD
?_377:  test    rbx, rbx                                ; 0343 _ 48: 85. DB
        jnz     ?_376                                   ; 0346 _ 75, D3
?_378:  mov     r11, rdx                                ; 0348 _ 49: 89. D3
        and     r11, qword [rcx+128H]                   ; 034B _ 4C: 23. 99, 00000128
        jne     ?_394                                   ; 0352 _ 0F 85, 000001A8
?_379:  and     rdx, qword [rcx+130H]                   ; 0358 _ 48: 23. 91, 00000130
        bsf     rdx, rdx                                ; 035F _ 48: 0F BC. D2
        and     r8, qword [r9+rdx*8+0C00H]              ; 0363 _ 4D: 23. 84 D1, 00000C00
        je      ?_359                                   ; 036B _ 0F 84, FFFFFDCC
        shl     edx, 6                                  ; 0371 _ C1. E2, 06
?_380:  bsf     rcx, r8                                 ; 0374 _ 49: 0F BC. C8
        add     rax, 8                                  ; 0378 _ 48: 83. C0, 08
        or      ecx, edx                                ; 037C _ 09. D1
        blsr    r8, r8                                  ; 037E _ C4 C2 B8: F3. C8
        test    r8, r8                                  ; 0383 _ 4D: 85. C0
        mov     dword [rax-8H], ecx                     ; 0386 _ 89. 48, F8
        je      ?_359                                   ; 0389 _ 0F 84, FFFFFDAE
        jmp     ?_380                                   ; 038F _ EB, E3

?_381:  shl     ebx, 6                                  ; 0391 _ C1. E3, 06
?_382:  bsf     rsi, r11                                ; 0394 _ 49: 0F BC. F3
        add     rax, 8                                  ; 0398 _ 48: 83. C0, 08
        or      esi, ebx                                ; 039C _ 09. DE
        blsr    r11, r11                                ; 039E _ C4 C2 A0: F3. CB
        test    r11, r11                                ; 03A3 _ 4D: 85. DB
        mov     dword [rax-8H], esi                     ; 03A6 _ 89. 70, F8
        jnz     ?_382                                   ; 03A9 _ 75, E9
        test    rdi, rdi                                ; 03AB _ 48: 85. FF
        je      ?_371                                   ; 03AE _ 0F 84, FFFFFEDF
?_383:  bsf     rbx, rdi                                ; 03B4 _ 48: 0F BC. DF
        mov     r11, r8                                 ; 03B8 _ 4D: 89. C3
        blsr    rdi, rdi                                ; 03BB _ C4 E2 C0: F3. CF
        and     r11, qword [r9+rbx*8+400H]              ; 03C0 _ 4D: 23. 9C D9, 00000400
        jnz     ?_381                                   ; 03C8 _ 75, C7
        test    rdi, rdi                                ; 03CA _ 48: 85. FF
        je      ?_371                                   ; 03CD _ 0F 84, FFFFFEC0
        jmp     ?_383                                   ; 03D3 _ EB, DF

?_384:  shl     r12d, 6                                 ; 03D5 _ 41: C1. E4, 06
?_385:  bsf     r14, r10                                ; 03D9 _ 4D: 0F BC. F2
        add     rax, 8                                  ; 03DD _ 48: 83. C0, 08
        or      r14d, r12d                              ; 03E1 _ 45: 09. E6
        blsr    r10, r10                                ; 03E4 _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 03E9 _ 4D: 85. D2
        mov     dword [rax-8H], r14d                    ; 03EC _ 44: 89. 70, F8
        je      ?_356                                   ; 03F0 _ 0F 84, FFFFFD19
        jmp     ?_385                                   ; 03F6 _ EB, E1

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_386:  shl     edi, 6                                  ; 0400 _ C1. E7, 06
?_387:  bsf     r11, r15                                ; 0403 _ 4D: 0F BC. DF
        add     rax, 8                                  ; 0407 _ 48: 83. C0, 08
        or      r11d, edi                               ; 040B _ 41: 09. FB
        blsr    r15, r15                                ; 040E _ C4 C2 80: F3. CF
        test    r15, r15                                ; 0413 _ 4D: 85. FF
        mov     dword [rax-8H], r11d                    ; 0416 _ 44: 89. 58, F8
        je      ?_377                                   ; 041A _ 0F 84, FFFFFF23
        jmp     ?_387                                   ; 0420 _ EB, E1

?_388:  mov     rdi, qword [rcx+100H]                   ; 0422 _ 48: 8B. B9, 00000100
        mov     r14, qword [rel .refptr.BishopMasks]    ; 0429 _ 4C: 8B. 35, 00000000(rel)
        mov     r13, qword [rel .refptr.BishopAttacks]  ; 0430 _ 4C: 8B. 2D, 00000000(rel)
        mov     r12, qword [rel .refptr.RookMasks]      ; 0437 _ 4C: 8B. 25, 00000000(rel)
        mov     rbp, qword [rel .refptr.RookAttacks]    ; 043E _ 48: 8B. 2D, 00000000(rel)
?_389:  bsf     r10, r11                                ; 0445 _ 4D: 0F BC. D3
        pext    r15, rdi, qword [r14+r10*8]             ; 0449 _ C4 02 C2: F5. 3C D6
        mov     esi, r15d                               ; 044F _ 44: 89. FE
        mov     r15, qword [r13+r10*8]                  ; 0452 _ 4F: 8B. 7C D5, 00
        pext    rbx, rdi, qword [r12+r10*8]             ; 0457 _ C4 82 C2: F5. 1C D4
        mov     ebx, ebx                                ; 045D _ 89. DB
        blsr    r11, r11                                ; 045F _ C4 C2 A0: F3. CB
        mov     rsi, qword [r15+rsi*8]                  ; 0464 _ 49: 8B. 34 F7
        mov     r15, qword [rbp+r10*8]                  ; 0468 _ 4E: 8B. 7C D5, 00
        or      rsi, qword [r15+rbx*8]                  ; 046D _ 49: 0B. 34 DF
        mov     rbx, rsi                                ; 0471 _ 48: 89. F3
        and     rbx, r8                                 ; 0474 _ 4C: 21. C3
        jz      ?_391                                   ; 0477 _ 74, 1C
        shl     r10d, 6                                 ; 0479 _ 41: C1. E2, 06
?_390:  bsf     rsi, rbx                                ; 047D _ 48: 0F BC. F3
        add     rax, 8                                  ; 0481 _ 48: 83. C0, 08
        or      esi, r10d                               ; 0485 _ 44: 09. D6
        blsr    rbx, rbx                                ; 0488 _ C4 E2 E0: F3. CB
        test    rbx, rbx                                ; 048D _ 48: 85. DB
        mov     dword [rax-8H], esi                     ; 0490 _ 89. 70, F8
        jnz     ?_390                                   ; 0493 _ 75, E8
?_391:  test    r11, r11                                ; 0495 _ 4D: 85. DB
        je      ?_358                                   ; 0498 _ 0F 84, FFFFFC86
        jmp     ?_389                                   ; 049E _ EB, A5

?_392:  bsf     rbp, r10                                ; 04A0 _ 49: 0F BC. EA
        lea     r15d, [rbp-9H]                          ; 04A4 _ 44: 8D. 7D, F7
        add     rax, 8                                  ; 04A8 _ 48: 83. C0, 08
        blsr    r10, r10                                ; 04AC _ C4 C2 A8: F3. CA
        shl     r15d, 6                                 ; 04B1 _ 41: C1. E7, 06
        or      ebp, r15d                               ; 04B5 _ 44: 09. FD
        test    r10, r10                                ; 04B8 _ 4D: 85. D2
        mov     dword [rax-8H], ebp                     ; 04BB _ 89. 68, F8
        je      ?_351                                   ; 04BE _ 0F 84, FFFFFBBE
        jmp     ?_392                                   ; 04C4 _ EB, DA

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_393:  bsf     r13, r14                                ; 04D0 _ 4D: 0F BC. EE
        lea     r15d, [r13+9H]                          ; 04D4 _ 45: 8D. 7D, 09
        add     rax, 8                                  ; 04D8 _ 48: 83. C0, 08
        blsr    r14, r14                                ; 04DC _ C4 C2 88: F3. CE
        shl     r15d, 6                                 ; 04E1 _ 41: C1. E7, 06
        or      r13d, r15d                              ; 04E5 _ 45: 09. FD
        test    r14, r14                                ; 04E8 _ 4D: 85. F6
        mov     dword [rax-8H], r13d                    ; 04EB _ 44: 89. 68, F8
        je      ?_369                                   ; 04EF _ 0F 84, FFFFFD69
        jmp     ?_393                                   ; 04F5 _ EB, D9

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_394:  mov     rdi, qword [rcx+100H]                   ; 0500 _ 48: 8B. B9, 00000100
        mov     r15, qword [rel .refptr.BishopMasks]    ; 0507 _ 4C: 8B. 3D, 00000000(rel)
        mov     r14, qword [rel .refptr.BishopAttacks]  ; 050E _ 4C: 8B. 35, 00000000(rel)
        mov     r13, qword [rel .refptr.RookMasks]      ; 0515 _ 4C: 8B. 2D, 00000000(rel)
        mov     r12, qword [rel .refptr.RookAttacks]    ; 051C _ 4C: 8B. 25, 00000000(rel)
?_395:  bsf     r10, r11                                ; 0523 _ 4D: 0F BC. D3
        pext    rbp, rdi, qword [r15+r10*8]             ; 0527 _ C4 82 C2: F5. 2C D7
        mov     esi, ebp                                ; 052D _ 89. EE
        mov     rbp, qword [r14+r10*8]                  ; 052F _ 4B: 8B. 2C D6
        blsr    r11, r11                                ; 0533 _ C4 C2 A0: F3. CB
        pext    rbx, rdi, qword [r13+r10*8]             ; 0538 _ C4 82 C2: F5. 5C D5, 00
        mov     ebx, ebx                                ; 053F _ 89. DB
        mov     rsi, qword [rbp+rsi*8]                  ; 0541 _ 48: 8B. 74 F5, 00
        mov     rbp, qword [r12+r10*8]                  ; 0546 _ 4B: 8B. 2C D4
        or      rsi, qword [rbp+rbx*8]                  ; 054A _ 48: 0B. 74 DD, 00
        mov     rbx, rsi                                ; 054F _ 48: 89. F3
        and     rbx, r8                                 ; 0552 _ 4C: 21. C3
        jz      ?_397                                   ; 0555 _ 74, 1C
        shl     r10d, 6                                 ; 0557 _ 41: C1. E2, 06
?_396:  bsf     rsi, rbx                                ; 055B _ 48: 0F BC. F3
        add     rax, 8                                  ; 055F _ 48: 83. C0, 08
        or      esi, r10d                               ; 0563 _ 44: 09. D6
        blsr    rbx, rbx                                ; 0566 _ C4 E2 E0: F3. CB
        test    rbx, rbx                                ; 056B _ 48: 85. DB
        mov     dword [rax-8H], esi                     ; 056E _ 89. 70, F8
        jnz     ?_396                                   ; 0571 _ 75, E8
?_397:  test    r11, r11                                ; 0573 _ 4D: 85. DB
        je      ?_379                                   ; 0576 _ 0F 84, FFFFFDDC
        jmp     ?_395                                   ; 057C _ EB, A5

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_398:  bsf     r14, r12                                ; 0580 _ 4D: 0F BC. F4
        lea     r13d, [r14+7H]                          ; 0584 _ 45: 8D. 6E, 07
        add     rax, 8                                  ; 0588 _ 48: 83. C0, 08
        blsr    r12, r12                                ; 058C _ C4 C2 98: F3. CC
        shl     r13d, 6                                 ; 0591 _ 41: C1. E5, 06
        or      r14d, r13d                              ; 0595 _ 45: 09. EE
        mov     dword [rax-8H], r14d                    ; 0598 _ 44: 89. 70, F8
        jmp     ?_369                                   ; 059C _ E9, FFFFFCBD

?_399:  bsf     r13, r12                                ; 05A1 _ 4D: 0F BC. EC
        lea     ebp, [r13-7H]                           ; 05A5 _ 41: 8D. 6D, F9
        add     rax, 8                                  ; 05A9 _ 48: 83. C0, 08
        blsr    r12, r12                                ; 05AD _ C4 C2 98: F3. CC
        shl     ebp, 6                                  ; 05B2 _ C1. E5, 06
        or      r13d, ebp                               ; 05B5 _ 41: 09. ED
        mov     dword [rax-8H], r13d                    ; 05B8 _ 44: 89. 68, F8
        jmp     ?_351                                   ; 05BC _ E9, FFFFFAC1

?_400:  shl     edx, 6                                  ; 05C1 _ C1. E2, 06
?_401:  bsf     rcx, r8                                 ; 05C4 _ 49: 0F BC. C8
        add     rax, 8                                  ; 05C8 _ 48: 83. C0, 08
        or      ecx, edx                                ; 05CC _ 09. D1
        blsr    r8, r8                                  ; 05CE _ C4 C2 B8: F3. C8
        test    r8, r8                                  ; 05D3 _ 4D: 85. C0
        mov     dword [rax-8H], ecx                     ; 05D6 _ 89. 48, F8
        je      ?_359                                   ; 05D9 _ 0F 84, FFFFFB5E
        jmp     ?_401                                   ; 05DF _ EB, E3

?_402:  mov     r14, qword [rcx+100H]                   ; 05E1 _ 4C: 8B. B1, 00000100
        shl     rdi, 8                                  ; 05E8 _ 48: C1. E7, 08
        mov     r13, qword 7F000000000000H              ; 05EC _ 49: BD, 007F000000000000
        mov     rbp, qword 0FE000000000000H             ; 05F6 _ 48: BD, 00FE000000000000
        and     r13, r11                                ; 0600 _ 4D: 21. DD
        and     rbp, r11                                ; 0603 _ 4C: 21. DD
        shl     rbp, 7                                  ; 0606 _ 48: C1. E5, 07
        shl     r13, 9                                  ; 060A _ 49: C1. E5, 09
        and     rbp, r8                                 ; 060E _ 4C: 21. C5
        andn    r15, r14, rdi                           ; 0611 _ C4 62 88: F2. FF
        and     r13, r8                                 ; 0616 _ 4D: 21. C5
        jne     ?_414                                   ; 0619 _ 0F 85, 00000174
?_403:  test    rbp, rbp                                ; 061F _ 48: 85. ED
        jne     ?_408                                   ; 0622 _ 0F 85, 000000A9
        test    r15, r15                                ; 0628 _ 4D: 85. FF
        je      ?_350                                   ; 062B _ 0F 84, FFFFFA23
?_404:  bsf     r10, r15                                ; 0631 _ 4D: 0F BC. D7
        mov     ebx, r10d                               ; 0635 _ 44: 89. D3
        sub     r10d, 8                                 ; 0638 _ 41: 83. EA, 08
        add     rax, 8                                  ; 063C _ 48: 83. C0, 08
        blsr    r15, r15                                ; 0640 _ C4 C2 80: F3. CF
        or      bh, 70H                                 ; 0645 _ 80. CF, 70
        shl     r10d, 6                                 ; 0648 _ 41: C1. E2, 06
        or      r10d, ebx                               ; 064C _ 41: 09. DA
        test    r15, r15                                ; 064F _ 4D: 85. FF
        mov     dword [rax-8H], r10d                    ; 0652 _ 44: 89. 50, F8
        je      ?_350                                   ; 0656 _ 0F 84, FFFFF9F8
        jmp     ?_404                                   ; 065C _ EB, D3

?_405:  mov     rsi, qword [rcx+100H]                   ; 065E _ 48: 8B. B1, 00000100
        mov     r10, r11                                ; 0665 _ 4D: 89. DA
        mov     r15, r11                                ; 0668 _ 4D: 89. DF
        shr     rdi, 8                                  ; 066B _ 48: C1. EF, 08
        and     r10d, 0FE00H                            ; 066F _ 41: 81. E2, 0000FE00
        and     r15d, 7F00H                             ; 0676 _ 41: 81. E7, 00007F00
        shr     r15, 7                                  ; 067D _ 49: C1. EF, 07
        shr     r10, 9                                  ; 0681 _ 49: C1. EA, 09
        and     r15, r8                                 ; 0685 _ 4D: 21. C7
        andn    r9, rsi, rdi                            ; 0688 _ C4 62 C8: F2. CF
        and     r10, r8                                 ; 068D _ 4D: 21. C2
        jne     ?_415                                   ; 0690 _ 0F 85, 0000012A
?_406:  test    r15, r15                                ; 0696 _ 4D: 85. FF
        jnz     ?_409                                   ; 0699 _ 75, 60
        test    r9, r9                                  ; 069B _ 4D: 85. C9
        je      ?_368                                   ; 069E _ 0F 84, FFFFFB8C
?_407:  bsf     r10, r9                                 ; 06A4 _ 4D: 0F BC. D1
        mov     ebx, r10d                               ; 06A8 _ 44: 89. D3
        add     r10d, 8                                 ; 06AB _ 41: 83. C2, 08
        add     rax, 8                                  ; 06AF _ 48: 83. C0, 08
        blsr    r9, r9                                  ; 06B3 _ C4 C2 B0: F3. C9
        or      bh, 70H                                 ; 06B8 _ 80. CF, 70
        shl     r10d, 6                                 ; 06BB _ 41: C1. E2, 06
        or      r10d, ebx                               ; 06BF _ 41: 09. DA
        test    r9, r9                                  ; 06C2 _ 4D: 85. C9
        mov     dword [rax-8H], r10d                    ; 06C5 _ 44: 89. 50, F8
        je      ?_368                                   ; 06C9 _ 0F 84, FFFFFB61
        jmp     ?_407                                   ; 06CF _ EB, D3

?_408:  bsf     r9, rbp                                 ; 06D1 _ 4C: 0F BC. CD
        mov     esi, r9d                                ; 06D5 _ 44: 89. CE
        sub     r9d, 7                                  ; 06D8 _ 41: 83. E9, 07
        add     rax, 8                                  ; 06DC _ 48: 83. C0, 08
        blsr    rbp, rbp                                ; 06E0 _ C4 E2 D0: F3. CD
        or      esi, 7000H                              ; 06E5 _ 81. CE, 00007000
        shl     r9d, 6                                  ; 06EB _ 41: C1. E1, 06
        or      r9d, esi                                ; 06EF _ 41: 09. F1
        mov     dword [rax-8H], r9d                     ; 06F2 _ 44: 89. 48, F8
        jmp     ?_403                                   ; 06F6 _ E9, FFFFFF24

?_409:  bsf     rbp, r15                                ; 06FB _ 49: 0F BC. EF
        mov     esi, ebp                                ; 06FF _ 89. EE
        add     ebp, 7                                  ; 0701 _ 83. C5, 07
        add     rax, 8                                  ; 0704 _ 48: 83. C0, 08
        blsr    r15, r15                                ; 0708 _ C4 C2 80: F3. CF
        or      esi, 7000H                              ; 070D _ 81. CE, 00007000
        shl     ebp, 6                                  ; 0713 _ C1. E5, 06
        or      ebp, esi                                ; 0716 _ 09. F5
        mov     dword [rax-8H], ebp                     ; 0718 _ 89. 68, F8
        jmp     ?_406                                   ; 071B _ E9, FFFFFF76

?_410:  and     r11, qword [r9+rdi*8+1200H]             ; 0720 _ 4D: 23. 9C F9, 00001200
        or      edi, 8000H                              ; 0728 _ 81. CF, 00008000
        mov     rsi, qword 0FF00FFFFFFFFFFFFH           ; 072E _ 48: BE, FF00FFFFFFFFFFFF
        and     r11, rsi                                ; 0738 _ 49: 21. F3
?_411:  test    r11, r11                                ; 073B _ 4D: 85. DB
        je      ?_352                                   ; 073E _ 0F 84, FFFFF963
        bsf     r14, r11                                ; 0744 _ 4D: 0F BC. F3
        shl     r14d, 6                                 ; 0748 _ 41: C1. E6, 06
        add     rax, 8                                  ; 074C _ 48: 83. C0, 08
        blsr    r11, r11                                ; 0750 _ C4 C2 A0: F3. CB
        or      r14d, edi                               ; 0755 _ 41: 09. FE
        mov     dword [rax-8H], r14d                    ; 0758 _ 44: 89. 70, F8
        jmp     ?_411                                   ; 075C _ EB, DD

?_412:  and     r11, qword [r9+rbx*8+200H]              ; 075E _ 4D: 23. 9C D9, 00000200
        or      bh, 0FFFFFF80H                          ; 0766 _ 80. CF, 80
        mov     r15, r11                                ; 0769 _ 4D: 89. DF
        and     r15, 0FFFFFFFFFFFF00FFH                 ; 076C _ 49: 81. E7, FFFF00FF
?_413:  test    r15, r15                                ; 0773 _ 4D: 85. FF
        je      ?_370                                   ; 0776 _ 0F 84, FFFFFB07
        bsf     rdi, r15                                ; 077C _ 49: 0F BC. FF
        shl     edi, 6                                  ; 0780 _ C1. E7, 06
        add     rax, 8                                  ; 0783 _ 48: 83. C0, 08
        blsr    r15, r15                                ; 0787 _ C4 C2 80: F3. CF
        or      edi, ebx                                ; 078C _ 09. DF
        mov     dword [rax-8H], edi                     ; 078E _ 89. 78, F8
        jmp     ?_413                                   ; 0791 _ EB, E0

?_414:  bsf     r12, r13                                ; 0793 _ 4D: 0F BC. E5
        mov     ebx, r12d                               ; 0797 _ 44: 89. E3
        sub     r12d, 9                                 ; 079A _ 41: 83. EC, 09
        add     rax, 8                                  ; 079E _ 48: 83. C0, 08
        blsr    r13, r13                                ; 07A2 _ C4 C2 90: F3. CD
        or      bh, 70H                                 ; 07A7 _ 80. CF, 70
        shl     r12d, 6                                 ; 07AA _ 41: C1. E4, 06
        or      r12d, ebx                               ; 07AE _ 41: 09. DC
        test    r13, r13                                ; 07B1 _ 4D: 85. ED
        mov     dword [rax-8H], r12d                    ; 07B4 _ 44: 89. 60, F8
        je      ?_403                                   ; 07B8 _ 0F 84, FFFFFE61
        jmp     ?_414                                   ; 07BE _ EB, D3
; _Z8generateIL7GenType0EEP7ExtMoveRK8PositionS2_ End of function

?_415:  ; Local function
        bsf     rbp, r10                                ; 07C0 _ 49: 0F BC. EA
        mov     r12d, ebp                               ; 07C4 _ 41: 89. EC
        add     ebp, 9                                  ; 07C7 _ 83. C5, 09
        add     rax, 8                                  ; 07CA _ 48: 83. C0, 08
        blsr    r10, r10                                ; 07CE _ C4 C2 A8: F3. CA
        or      r12d, 7000H                             ; 07D3 _ 41: 81. CC, 00007000
        shl     ebp, 6                                  ; 07DA _ C1. E5, 06
        or      ebp, r12d                               ; 07DD _ 44: 09. E5
        test    r10, r10                                ; 07E0 _ 4D: 85. D2
        mov     dword [rax-8H], ebp                     ; 07E3 _ 89. 68, F8
        je      ?_406                                   ; 07E6 _ 0F 84, FFFFFEAA
        jmp     ?_415                                   ; 07EC _ EB, D2

        nop                                             ; 07EE _ 90
        nop                                             ; 07EF _ 90


SECTION .xdata$_Z8generateIL7GenType0EEP7ExtMoveRK8PositionS2_ align=4 noexecute ; section number 12, const
;  Communal section not supported by YASM

        db 01H, 0CH, 08H, 00H, 0CH, 30H, 0BH, 60H       ; 0000 _ .....0.`
        db 0AH, 70H, 09H, 50H, 08H, 0C0H, 06H, 0D0H     ; 0008 _ .p.P....
        db 04H, 0E0H, 02H, 0F0H                         ; 0010 _ ....


SECTION .text$_Z8generateIL7GenType1EEP7ExtMoveRK8PositionS2_ align=16 execute ; section number 14, code
;  Communal section not supported by YASM

_Z8generateIL7GenType1EEP7ExtMoveRK8PositionS2_:; Function begin
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 40                                 ; 000C _ 48: 83. EC, 28
        mov     rsi, rcx                                ; 0010 _ 48: 89. CE
        mov     rbx, rdx                                ; 0013 _ 48: 89. D3
        mov     rcx, qword [rcx+100H]                   ; 0016 _ 48: 8B. 89, 00000100
        mov     edx, dword [rsi+3ACH]                   ; 001D _ 8B. 96, 000003AC
        mov     rax, rcx                                ; 0023 _ 48: 89. C8
        test    edx, edx                                ; 0026 _ 85. D2
        not     rax                                     ; 0028 _ 48: F7. D0
        jne     ?_437                                   ; 002B _ 0F 85, 0000022F
        mov     rdx, qword [rsi+140H]                   ; 0031 _ 48: 8B. 96, 00000140
        mov     r15, qword 0FF00FFFFFFFFFFFFH           ; 0038 _ 49: BF, FF00FFFFFFFFFFFF
        mov     r10, qword 0FF000000000000H             ; 0042 _ 49: BA, 00FF000000000000
        mov     rbp, qword [rsi+148H]                   ; 004C _ 48: 8B. AE, 00000148
        mov     r12, rdx                                ; 0053 _ 49: 89. D4
        and     r12, qword [rsi+108H]                   ; 0056 _ 4C: 23. A6, 00000108
        and     r15, r12                                ; 005D _ 4D: 21. E7
        and     r10, r12                                ; 0060 _ 4D: 21. E2
        shl     r15, 8                                  ; 0063 _ 49: C1. E7, 08
        and     r15, rax                                ; 0067 _ 49: 21. C7
        mov     r11, r15                                ; 006A _ 4D: 89. FB
        and     r11d, 0FF0000H                          ; 006D _ 41: 81. E3, 00FF0000
        shl     r11, 8                                  ; 0074 _ 49: C1. E3, 08
        and     r11, rax                                ; 0078 _ 49: 21. C3
        test    r15, r15                                ; 007B _ 4D: 85. FF
        jz      ?_417                                   ; 007E _ 74, 21
?_416:  bsf     r8, r15                                 ; 0080 _ 4D: 0F BC. C7
        lea     r13d, [r8-8H]                           ; 0084 _ 45: 8D. 68, F8
        add     rbx, 8                                  ; 0088 _ 48: 83. C3, 08
        blsr    r15, r15                                ; 008C _ C4 C2 80: F3. CF
        shl     r13d, 6                                 ; 0091 _ 41: C1. E5, 06
        or      r8d, r13d                               ; 0095 _ 45: 09. E8
        test    r15, r15                                ; 0098 _ 4D: 85. FF
        mov     dword [rbx-8H], r8d                     ; 009B _ 44: 89. 43, F8
        jnz     ?_416                                   ; 009F _ 75, DF
?_417:  test    r11, r11                                ; 00A1 _ 4D: 85. DB
        jz      ?_419                                   ; 00A4 _ 74, 21
?_418:  bsf     r8, r11                                 ; 00A6 _ 4D: 0F BC. C3
        lea     r15d, [r8-10H]                          ; 00AA _ 45: 8D. 78, F0
        add     rbx, 8                                  ; 00AE _ 48: 83. C3, 08
        blsr    r11, r11                                ; 00B2 _ C4 C2 A0: F3. CB
        shl     r15d, 6                                 ; 00B7 _ 41: C1. E7, 06
        or      r8d, r15d                               ; 00BB _ 45: 09. F8
        test    r11, r11                                ; 00BE _ 4D: 85. DB
        mov     dword [rbx-8H], r8d                     ; 00C1 _ 44: 89. 43, F8
        jnz     ?_418                                   ; 00C5 _ 75, DF
?_419:  test    r10, r10                                ; 00C7 _ 4D: 85. D2
        jne     ?_477                                   ; 00CA _ 0F 85, 00000655
?_420:  mov     r11, rdx                                ; 00D0 _ 49: 89. D3
        and     r11, qword [rsi+110H]                   ; 00D3 _ 4C: 23. 9E, 00000110
        mov     r8, qword [rel .refptr.StepAttacksBB]   ; 00DA _ 4C: 8B. 05, 00000000(rel)
        jne     ?_434                                   ; 00E1 _ 0F 85, 00000129
        mov     r9, rdx                                 ; 00E7 _ 49: 89. D1
        and     r9, qword [rsi+118H]                    ; 00EA _ 4C: 23. 8E, 00000118
        jne     ?_430                                   ; 00F1 _ 0F 85, 000000AE
?_421:  mov     r11, rdx                                ; 00F7 _ 49: 89. D3
        and     r11, qword [rsi+120H]                   ; 00FA _ 4C: 23. 9E, 00000120
        jz      ?_425                                   ; 0101 _ 74, 3A
?_422:  mov     r12, qword [rel .refptr.RookMasks]      ; 0103 _ 4C: 8B. 25, 00000000(rel)
        mov     r15, qword [rel .refptr.RookAttacks]    ; 010A _ 4C: 8B. 3D, 00000000(rel)
?_423:  bsf     r10, r11                                ; 0111 _ 4D: 0F BC. D3
        mov     r13, qword [r15+r10*8]                  ; 0115 _ 4F: 8B. 2C D7
        pext    r14, rcx, qword [r12+r10*8]             ; 0119 _ C4 02 F2: F5. 34 D4
        mov     r9d, r14d                               ; 011F _ 45: 89. F1
        blsr    r11, r11                                ; 0122 _ C4 C2 A0: F3. CB
        mov     rdi, rax                                ; 0127 _ 48: 89. C7
        and     rdi, qword [r13+r9*8]                   ; 012A _ 4B: 23. 7C CD, 00
        mov     r9, rdi                                 ; 012F _ 49: 89. F9
        jne     ?_459                                   ; 0132 _ 0F 85, 000003A8
?_424:  test    r11, r11                                ; 0138 _ 4D: 85. DB
        jnz     ?_423                                   ; 013B _ 75, D4
?_425:  mov     r10, rdx                                ; 013D _ 49: 89. D2
        and     r10, qword [rsi+128H]                   ; 0140 _ 4C: 23. 96, 00000128
        jne     ?_463                                   ; 0147 _ 0F 85, 000003E3
?_426:  and     rdx, qword [rsi+130H]                   ; 014D _ 48: 23. 96, 00000130
        bsf     r15, rdx                                ; 0154 _ 4C: 0F BC. FA
        and     rax, qword [r8+r15*8+0C00H]             ; 0158 _ 4B: 23. 84 F8, 00000C00
        jz      ?_428                                   ; 0160 _ 74, 1D
        shl     r15d, 6                                 ; 0162 _ 41: C1. E7, 06
?_427:  bsf     r8, rax                                 ; 0166 _ 4C: 0F BC. C0
        add     rbx, 8                                  ; 016A _ 48: 83. C3, 08
        or      r8d, r15d                               ; 016E _ 45: 09. F8
        blsr    rax, rax                                ; 0171 _ C4 E2 F8: F3. C8
        test    rax, rax                                ; 0176 _ 48: 85. C0
        mov     dword [rbx-8H], r8d                     ; 0179 _ 44: 89. 43, F8
        jnz     ?_427                                   ; 017D _ 75, E7
?_428:  mov     rax, qword [rsi+3B8H]                   ; 017F _ 48: 8B. 86, 000003B8
        mov     eax, dword [rax+18H]                    ; 0186 _ 8B. 40, 18
        test    al, 03H                                 ; 0189 _ A8, 03
        jne     ?_467                                   ; 018B _ 0F 85, 00000414
?_429:  mov     rax, rbx                                ; 0191 _ 48: 89. D8
        add     rsp, 40                                 ; 0194 _ 48: 83. C4, 28
        pop     rbx                                     ; 0198 _ 5B
        pop     rsi                                     ; 0199 _ 5E
        pop     rdi                                     ; 019A _ 5F
        pop     rbp                                     ; 019B _ 5D
        pop     r12                                     ; 019C _ 41: 5C
        pop     r13                                     ; 019E _ 41: 5D
        pop     r14                                     ; 01A0 _ 41: 5E
        pop     r15                                     ; 01A2 _ 41: 5F
        ret                                             ; 01A4 _ C3

?_430:  mov     r14, qword [rel .refptr.BishopMasks]    ; 01A5 _ 4C: 8B. 35, 00000000(rel)
        mov     r12, qword [rel .refptr.BishopAttacks]  ; 01AC _ 4C: 8B. 25, 00000000(rel)
?_431:  bsf     r11, r9                                 ; 01B3 _ 4D: 0F BC. D9
        mov     r13, qword [r12+r11*8]                  ; 01B7 _ 4F: 8B. 2C DC
        pext    r15, rcx, qword [r14+r11*8]             ; 01BB _ C4 02 F2: F5. 3C DE
        mov     edi, r15d                               ; 01C1 _ 44: 89. FF
        blsr    r9, r9                                  ; 01C4 _ C4 C2 B0: F3. C9
        mov     r10, rax                                ; 01C9 _ 49: 89. C2
        and     r10, qword [r13+rdi*8]                  ; 01CC _ 4D: 23. 54 FD, 00
        mov     rdi, r10                                ; 01D1 _ 4C: 89. D7
        jz      ?_433                                   ; 01D4 _ 74, 1D
        shl     r11d, 6                                 ; 01D6 _ 41: C1. E3, 06
?_432:  bsf     r15, rdi                                ; 01DA _ 4C: 0F BC. FF
        add     rbx, 8                                  ; 01DE _ 48: 83. C3, 08
        or      r15d, r11d                              ; 01E2 _ 45: 09. DF
        blsr    rdi, rdi                                ; 01E5 _ C4 E2 C0: F3. CF
        test    rdi, rdi                                ; 01EA _ 48: 85. FF
        mov     dword [rbx-8H], r15d                    ; 01ED _ 44: 89. 7B, F8
        jnz     ?_432                                   ; 01F1 _ 75, E7
?_433:  test    r9, r9                                  ; 01F3 _ 4D: 85. C9
        jnz     ?_431                                   ; 01F6 _ 75, BB
        mov     r11, rdx                                ; 01F8 _ 49: 89. D3
        and     r11, qword [rsi+120H]                   ; 01FB _ 4C: 23. 9E, 00000120
        jne     ?_422                                   ; 0202 _ 0F 85, FFFFFEFB
        jmp     ?_425                                   ; 0208 _ E9, FFFFFF30

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_434:  bsf     r12, r11                                ; 0210 _ 4D: 0F BC. E3
        mov     r10, rax                                ; 0214 _ 49: 89. C2
        blsr    r11, r11                                ; 0217 _ C4 C2 A0: F3. CB
        and     r10, qword [r8+r12*8+400H]              ; 021C _ 4F: 23. 94 E0, 00000400
        jz      ?_436                                   ; 0224 _ 74, 1C
        shl     r12d, 6                                 ; 0226 _ 41: C1. E4, 06
?_435:  bsf     rdi, r10                                ; 022A _ 49: 0F BC. FA
        add     rbx, 8                                  ; 022E _ 48: 83. C3, 08
        or      edi, r12d                               ; 0232 _ 44: 09. E7
        blsr    r10, r10                                ; 0235 _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 023A _ 4D: 85. D2
        mov     dword [rbx-8H], edi                     ; 023D _ 89. 7B, F8
        jnz     ?_435                                   ; 0240 _ 75, E8
?_436:  test    r11, r11                                ; 0242 _ 4D: 85. DB
        jnz     ?_434                                   ; 0245 _ 75, C9
        mov     r9, rdx                                 ; 0247 _ 49: 89. D1
        and     r9, qword [rsi+118H]                    ; 024A _ 4C: 23. 8E, 00000118
        je      ?_421                                   ; 0251 _ 0F 84, FFFFFEA0
        jmp     ?_430                                   ; 0257 _ E9, FFFFFF49

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_437:  mov     rdx, qword [rsi+148H]                   ; 0260 _ 48: 8B. 96, 00000148
        mov     r10, qword 0FF0000000000H               ; 0267 _ 49: BA, 0000FF0000000000
        mov     rbp, qword [rsi+140H]                   ; 0271 _ 48: 8B. AE, 00000140
        mov     r14, rdx                                ; 0278 _ 49: 89. D6
        and     r14, qword [rsi+108H]                   ; 027B _ 4C: 23. B6, 00000108
        mov     r12, r14                                ; 0282 _ 4D: 89. F4
        mov     r13, r14                                ; 0285 _ 4D: 89. F5
        and     r12, 0FFFFFFFFFFFF00FFH                 ; 0288 _ 49: 81. E4, FFFF00FF
        and     r13d, 0FF00H                            ; 028F _ 41: 81. E5, 0000FF00
        shr     r12, 8                                  ; 0296 _ 49: C1. EC, 08
        and     r12, rax                                ; 029A _ 49: 21. C4
        and     r10, r12                                ; 029D _ 4D: 21. E2
        shr     r10, 8                                  ; 02A0 _ 49: C1. EA, 08
        and     r10, rax                                ; 02A4 _ 49: 21. C2
        test    r12, r12                                ; 02A7 _ 4D: 85. E4
        jz      ?_439                                   ; 02AA _ 74, 21
?_438:  bsf     r8, r12                                 ; 02AC _ 4D: 0F BC. C4
        lea     r9d, [r8+8H]                            ; 02B0 _ 45: 8D. 48, 08
        add     rbx, 8                                  ; 02B4 _ 48: 83. C3, 08
        blsr    r12, r12                                ; 02B8 _ C4 C2 98: F3. CC
        shl     r9d, 6                                  ; 02BD _ 41: C1. E1, 06
        or      r8d, r9d                                ; 02C1 _ 45: 09. C8
        test    r12, r12                                ; 02C4 _ 4D: 85. E4
        mov     dword [rbx-8H], r8d                     ; 02C7 _ 44: 89. 43, F8
        jnz     ?_438                                   ; 02CB _ 75, DF
?_439:  test    r10, r10                                ; 02CD _ 4D: 85. D2
        jz      ?_441                                   ; 02D0 _ 74, 21
?_440:  bsf     r11, r10                                ; 02D2 _ 4D: 0F BC. DA
        lea     r9d, [r11+10H]                          ; 02D6 _ 45: 8D. 4B, 10
        add     rbx, 8                                  ; 02DA _ 48: 83. C3, 08
        blsr    r10, r10                                ; 02DE _ C4 C2 A8: F3. CA
        shl     r9d, 6                                  ; 02E3 _ 41: C1. E1, 06
        or      r11d, r9d                               ; 02E7 _ 45: 09. CB
        test    r10, r10                                ; 02EA _ 4D: 85. D2
        mov     dword [rbx-8H], r11d                    ; 02ED _ 44: 89. 5B, F8
        jnz     ?_440                                   ; 02F1 _ 75, DF
?_441:  test    r13, r13                                ; 02F3 _ 4D: 85. ED
        jne     ?_484                                   ; 02F6 _ 0F 85, 00000526
?_442:  mov     r13, rdx                                ; 02FC _ 49: 89. D5
        and     r13, qword [rsi+110H]                   ; 02FF _ 4C: 23. AE, 00000110
        mov     r8, qword [rel .refptr.StepAttacksBB]   ; 0306 _ 4C: 8B. 05, 00000000(rel)
        jne     ?_458                                   ; 030D _ 0F 85, 000001A7
?_443:  mov     r9, rdx                                 ; 0313 _ 49: 89. D1
        and     r9, qword [rsi+118H]                    ; 0316 _ 4C: 23. 8E, 00000118
        jz      ?_447                                   ; 031D _ 74, 53
        mov     r15, qword [rel .refptr.BishopMasks]    ; 031F _ 4C: 8B. 3D, 00000000(rel)
        mov     r12, qword [rel .refptr.BishopAttacks]  ; 0326 _ 4C: 8B. 25, 00000000(rel)
?_444:  bsf     r11, r9                                 ; 032D _ 4D: 0F BC. D9
        mov     r13, qword [r12+r11*8]                  ; 0331 _ 4F: 8B. 2C DC
        pext    r14, rcx, qword [r15+r11*8]             ; 0335 _ C4 02 F2: F5. 34 DF
        mov     edi, r14d                               ; 033B _ 44: 89. F7
        blsr    r9, r9                                  ; 033E _ C4 C2 B0: F3. C9
        mov     r10, rax                                ; 0343 _ 49: 89. C2
        and     r10, qword [r13+rdi*8]                  ; 0346 _ 4D: 23. 54 FD, 00
        mov     rdi, r10                                ; 034B _ 4C: 89. D7
        jz      ?_446                                   ; 034E _ 74, 1D
        shl     r11d, 6                                 ; 0350 _ 41: C1. E3, 06
?_445:  bsf     r14, rdi                                ; 0354 _ 4C: 0F BC. F7
        add     rbx, 8                                  ; 0358 _ 48: 83. C3, 08
        or      r14d, r11d                              ; 035C _ 45: 09. DE
        blsr    rdi, rdi                                ; 035F _ C4 E2 C0: F3. CF
        test    rdi, rdi                                ; 0364 _ 48: 85. FF
        mov     dword [rbx-8H], r14d                    ; 0367 _ 44: 89. 73, F8
        jnz     ?_445                                   ; 036B _ 75, E7
?_446:  test    r9, r9                                  ; 036D _ 4D: 85. C9
        jnz     ?_444                                   ; 0370 _ 75, BB
?_447:  mov     r9, rdx                                 ; 0372 _ 49: 89. D1
        and     r9, qword [rsi+120H]                    ; 0375 _ 4C: 23. 8E, 00000120
        jz      ?_450                                   ; 037C _ 74, 3A
        mov     r12, qword [rel .refptr.RookMasks]      ; 037E _ 4C: 8B. 25, 00000000(rel)
        mov     r14, qword [rel .refptr.RookAttacks]    ; 0385 _ 4C: 8B. 35, 00000000(rel)
?_448:  bsf     r11, r9                                 ; 038C _ 4D: 0F BC. D9
        mov     r13, qword [r14+r11*8]                  ; 0390 _ 4F: 8B. 2C DE
        pext    r15, rcx, qword [r12+r11*8]             ; 0394 _ C4 02 F2: F5. 3C DC
        mov     r10d, r15d                              ; 039A _ 45: 89. FA
        blsr    r9, r9                                  ; 039D _ C4 C2 B0: F3. C9
        mov     rdi, rax                                ; 03A2 _ 48: 89. C7
        and     rdi, qword [r13+r10*8]                  ; 03A5 _ 4B: 23. 7C D5, 00
        mov     r10, rdi                                ; 03AA _ 49: 89. FA
        jne     ?_461                                   ; 03AD _ 0F 85, 00000150
?_449:  test    r9, r9                                  ; 03B3 _ 4D: 85. C9
        jnz     ?_448                                   ; 03B6 _ 75, D4
?_450:  mov     r10, rdx                                ; 03B8 _ 49: 89. D2
        and     r10, qword [rsi+128H]                   ; 03BB _ 4C: 23. 96, 00000128
        jne     ?_473                                   ; 03C2 _ 0F 85, 000002E8
?_451:  and     rdx, qword [rsi+130H]                   ; 03C8 _ 48: 23. 96, 00000130
        bsf     r15, rdx                                ; 03CF _ 4C: 0F BC. FA
        and     rax, qword [r8+r15*8+0C00H]             ; 03D3 _ 4B: 23. 84 F8, 00000C00
        jz      ?_453                                   ; 03DB _ 74, 1D
        shl     r15d, 6                                 ; 03DD _ 41: C1. E7, 06
?_452:  bsf     r8, rax                                 ; 03E1 _ 4C: 0F BC. C0
        add     rbx, 8                                  ; 03E5 _ 48: 83. C3, 08
        or      r8d, r15d                               ; 03E9 _ 45: 09. F8
        blsr    rax, rax                                ; 03EC _ C4 E2 F8: F3. C8
        test    rax, rax                                ; 03F1 _ 48: 85. C0
        mov     dword [rbx-8H], r8d                     ; 03F4 _ 44: 89. 43, F8
        jnz     ?_452                                   ; 03F8 _ 75, E7
?_453:  mov     r14, qword [rsi+3B8H]                   ; 03FA _ 4C: 8B. B6, 000003B8
        mov     eax, dword [r14+18H]                    ; 0401 _ 41: 8B. 46, 18
        test    al, 0CH                                 ; 0405 _ A8, 0C
        je      ?_429                                   ; 0407 _ 0F 84, FFFFFD84
        cmp     byte [rsi+3C0H], 0                      ; 040D _ 80. BE, 000003C0, 00
        jne     ?_494                                   ; 0414 _ 0F 85, 000005B7
        test    qword [rsi+2F0H], rcx                   ; 041A _ 48: 85. 8E, 000002F0
        je      ?_481                                   ; 0421 _ 0F 84, 0000038F
?_454:  test    qword [rsi+310H], rcx                   ; 0427 _ 48: 85. 8E, 00000310
        jne     ?_429                                   ; 042E _ 0F 85, FFFFFD5D
        mov     rbp, qword [rsi+3B8H]                   ; 0434 _ 48: 8B. AE, 000003B8
        test    byte [rbp+18H], 08H                     ; 043B _ F6. 45, 18, 08
        je      ?_429                                   ; 043F _ 0F 84, FFFFFD4C
        mov     r14, qword [rsi+290H]                   ; 0445 _ 4C: 8B. B6, 00000290
        mov     r13d, 58                                ; 044C _ 41: BD, 0000003A
        mov     rdi, qword [rsi+140H]                   ; 0452 _ 48: 8B. BE, 00000140
        mov     rdx, qword [rsi+130H]                   ; 0459 _ 48: 8B. 96, 00000130
        and     rdx, qword [rsi+148H]                   ; 0460 _ 48: 23. 96, 00000148
        bsf     r15, rdx                                ; 0467 _ 4C: 0F BC. FA
?_455:  cmp     r13, r15                                ; 046B _ 4D: 39. FD
        je      ?_488                                   ; 046E _ 0F 84, 0000042F
        mov     r8, qword [rsi+100H]                    ; 0474 _ 4C: 8B. 86, 00000100
        mov     rdx, r13                                ; 047B _ 4C: 89. EA
        mov     rcx, rsi                                ; 047E _ 48: 89. F1
        call    _ZNK8Position12attackers_toE6Squarey    ; 0481 _ E8, 00000000(rel)
        test    rax, rdi                                ; 0486 _ 48: 85. F8
        jne     ?_429                                   ; 0489 _ 0F 85, FFFFFD02
        add     r13, 1                                  ; 048F _ 49: 83. C5, 01
        jmp     ?_455                                   ; 0493 _ EB, D6

?_456:  shl     r11d, 6                                 ; 0495 _ 41: C1. E3, 06
?_457:  bsf     rdi, r10                                ; 0499 _ 49: 0F BC. FA
        add     rbx, 8                                  ; 049D _ 48: 83. C3, 08
        or      edi, r11d                               ; 04A1 _ 44: 09. DF
        blsr    r10, r10                                ; 04A4 _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 04A9 _ 4D: 85. D2
        mov     dword [rbx-8H], edi                     ; 04AC _ 89. 7B, F8
        jnz     ?_457                                   ; 04AF _ 75, E8
        test    r13, r13                                ; 04B1 _ 4D: 85. ED
        je      ?_443                                   ; 04B4 _ 0F 84, FFFFFE59
?_458:  bsf     r11, r13                                ; 04BA _ 4D: 0F BC. DD
        mov     r10, rax                                ; 04BE _ 49: 89. C2
        blsr    r13, r13                                ; 04C1 _ C4 C2 90: F3. CD
        and     r10, qword [r8+r11*8+400H]              ; 04C6 _ 4F: 23. 94 D8, 00000400
        jnz     ?_456                                   ; 04CE _ 75, C5
        test    r13, r13                                ; 04D0 _ 4D: 85. ED
        je      ?_443                                   ; 04D3 _ 0F 84, FFFFFE3A
        jmp     ?_458                                   ; 04D9 _ EB, DF

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_459:  shl     r10d, 6                                 ; 04E0 _ 41: C1. E2, 06
?_460:  bsf     r14, r9                                 ; 04E4 _ 4D: 0F BC. F1
        add     rbx, 8                                  ; 04E8 _ 48: 83. C3, 08
        or      r14d, r10d                              ; 04EC _ 45: 09. D6
        blsr    r9, r9                                  ; 04EF _ C4 C2 B0: F3. C9
        test    r9, r9                                  ; 04F4 _ 4D: 85. C9
        mov     dword [rbx-8H], r14d                    ; 04F7 _ 44: 89. 73, F8
        je      ?_424                                   ; 04FB _ 0F 84, FFFFFC37
        jmp     ?_460                                   ; 0501 _ EB, E1

?_461:  shl     r11d, 6                                 ; 0503 _ 41: C1. E3, 06
?_462:  bsf     r15, r10                                ; 0507 _ 4D: 0F BC. FA
        add     rbx, 8                                  ; 050B _ 48: 83. C3, 08
        or      r15d, r11d                              ; 050F _ 45: 09. DF
        blsr    r10, r10                                ; 0512 _ C4 C2 A8: F3. CA
        test    r10, r10                                ; 0517 _ 4D: 85. D2
        mov     dword [rbx-8H], r15d                    ; 051A _ 44: 89. 7B, F8
        je      ?_449                                   ; 051E _ 0F 84, FFFFFE8F
        jmp     ?_462                                   ; 0524 _ EB, E1

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_463:  mov     r15, qword [rel .refptr.BishopMasks]    ; 0530 _ 4C: 8B. 3D, 00000000(rel)
        mov     r14, qword [rel .refptr.BishopAttacks]  ; 0537 _ 4C: 8B. 35, 00000000(rel)
        mov     r13, qword [rel .refptr.RookMasks]      ; 053E _ 4C: 8B. 2D, 00000000(rel)
?_464:  bsf     r9, r10                                 ; 0545 _ 4D: 0F BC. CA
        pext    r12, rcx, qword [r13+r9*8]              ; 0549 _ C4 02 F2: F5. 64 CD, 00
        pext    r11, rcx, qword [r15+r9*8]              ; 0550 _ C4 02 F2: F5. 1C CF
        mov     edi, r11d                               ; 0556 _ 44: 89. DF
        mov     r11d, r12d                              ; 0559 _ 45: 89. E3
        mov     r12, qword [r14+r9*8]                   ; 055C _ 4F: 8B. 24 CE
        blsr    r10, r10                                ; 0560 _ C4 C2 A8: F3. CA
        mov     rdi, qword [r12+rdi*8]                  ; 0565 _ 49: 8B. 3C FC
        mov     r12, qword [rel .refptr.RookAttacks]    ; 0569 _ 4C: 8B. 25, 00000000(rel)
        mov     r12, qword [r12+r9*8]                   ; 0570 _ 4F: 8B. 24 CC
        or      rdi, qword [r12+r11*8]                  ; 0574 _ 4B: 0B. 3C DC
        and     rdi, rax                                ; 0578 _ 48: 21. C7
        jz      ?_466                                   ; 057B _ 74, 1D
        shl     r9d, 6                                  ; 057D _ 41: C1. E1, 06
?_465:  bsf     r11, rdi                                ; 0581 _ 4C: 0F BC. DF
        add     rbx, 8                                  ; 0585 _ 48: 83. C3, 08
        or      r11d, r9d                               ; 0589 _ 45: 09. CB
        blsr    rdi, rdi                                ; 058C _ C4 E2 C0: F3. CF
        test    rdi, rdi                                ; 0591 _ 48: 85. FF
        mov     dword [rbx-8H], r11d                    ; 0594 _ 44: 89. 5B, F8
        jnz     ?_465                                   ; 0598 _ 75, E7
?_466:  test    r10, r10                                ; 059A _ 4D: 85. D2
        je      ?_426                                   ; 059D _ 0F 84, FFFFFBAA
        jmp     ?_464                                   ; 05A3 _ EB, A0

?_467:  cmp     byte [rsi+3C0H], 0                      ; 05A5 _ 80. BE, 000003C0, 00
        jne     ?_495                                   ; 05AC _ 0F 85, 00000445
        test    qword [rsi+2D8H], rcx                   ; 05B2 _ 48: 85. 8E, 000002D8
        jnz     ?_470                                   ; 05B9 _ 75, 59
        test    al, 01H                                 ; 05BB _ A8, 01
        jz      ?_470                                   ; 05BD _ 74, 55
        bsf     r14, rdx                                ; 05BF _ 4C: 0F BC. F2
        cmp     r14, 6                                  ; 05C3 _ 49: 83. FE, 06
        mov     r13, qword [rsi+258H]                   ; 05C7 _ 4C: 8B. AE, 00000258
        mov     r12d, 6                                 ; 05CE _ 41: BC, 00000006
        jz      ?_469                                   ; 05D4 _ 74, 27
?_468:  mov     r8, qword [rsi+100H]                    ; 05D6 _ 4C: 8B. 86, 00000100
        mov     rdx, r12                                ; 05DD _ 4C: 89. E2
        mov     rcx, rsi                                ; 05E0 _ 48: 89. F1
        call    _ZNK8Position12attackers_toE6Squarey    ; 05E3 _ E8, 00000000(rel)
        test    rax, rbp                                ; 05E8 _ 48: 85. E8
        jnz     ?_470                                   ; 05EB _ 75, 27
        lea     eax, [r12-1H]                           ; 05ED _ 41: 8D. 44 24, FF
        sub     r12, 1                                  ; 05F2 _ 49: 83. EC, 01
        cdqe                                            ; 05F6 _ 48: 98
        cmp     r14, rax                                ; 05F8 _ 49: 39. C6
        jnz     ?_468                                   ; 05FB _ 75, D9
?_469:  mov     ecx, r14d                               ; 05FD _ 44: 89. F1
        or      r13d, 0C000H                            ; 0600 _ 41: 81. CD, 0000C000
        add     rbx, 8                                  ; 0607 _ 48: 83. C3, 08
        shl     ecx, 6                                  ; 060B _ C1. E1, 06
        or      ecx, r13d                               ; 060E _ 44: 09. E9
        mov     dword [rbx-8H], ecx                     ; 0611 _ 89. 4B, F8
?_470:  mov     rdx, qword [rsi+2E0H]                   ; 0614 _ 48: 8B. 96, 000002E0
        test    qword [rsi+100H], rdx                   ; 061B _ 48: 85. 96, 00000100
        jne     ?_429                                   ; 0622 _ 0F 85, FFFFFB69
        mov     rbp, qword [rsi+3B8H]                   ; 0628 _ 48: 8B. AE, 000003B8
        test    byte [rbp+18H], 02H                     ; 062F _ F6. 45, 18, 02
        je      ?_429                                   ; 0633 _ 0F 84, FFFFFB58
        mov     r9, qword [rsi+130H]                    ; 0639 _ 4C: 8B. 8E, 00000130
        mov     r13d, 2                                 ; 0640 _ 41: BD, 00000002
        and     r9, qword [rsi+140H]                    ; 0646 _ 4C: 23. 8E, 00000140
        bsf     rdi, r9                                 ; 064D _ 49: 0F BC. F9
        cmp     rdi, 2                                  ; 0651 _ 48: 83. FF, 02
        mov     r15, qword [rsi+260H]                   ; 0655 _ 4C: 8B. BE, 00000260
        mov     r14, qword [rsi+148H]                   ; 065C _ 4C: 8B. B6, 00000148
        jz      ?_472                                   ; 0663 _ 74, 2A
?_471:  mov     r8, qword [rsi+100H]                    ; 0665 _ 4C: 8B. 86, 00000100
        mov     rdx, r13                                ; 066C _ 4C: 89. EA
        mov     rcx, rsi                                ; 066F _ 48: 89. F1
        call    _ZNK8Position12attackers_toE6Squarey    ; 0672 _ E8, 00000000(rel)
        test    rax, r14                                ; 0677 _ 4C: 85. F0
        jne     ?_429                                   ; 067A _ 0F 85, FFFFFB11
        lea     eax, [r13+1H]                           ; 0680 _ 41: 8D. 45, 01
        add     r13, 1                                  ; 0684 _ 49: 83. C5, 01
        cdqe                                            ; 0688 _ 48: 98
        cmp     rdi, rax                                ; 068A _ 48: 39. C7
        jnz     ?_471                                   ; 068D _ 75, D6
?_472:  or      r15d, 0C000H                            ; 068F _ 41: 81. CF, 0000C000
        shl     edi, 6                                  ; 0696 _ C1. E7, 06
        add     rbx, 8                                  ; 0699 _ 48: 83. C3, 08
        or      edi, r15d                               ; 069D _ 44: 09. FF
        mov     dword [rbx-8H], edi                     ; 06A0 _ 89. 7B, F8
        jmp     ?_429                                   ; 06A3 _ E9, FFFFFAE9

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_473:  mov     r15, qword [rel .refptr.BishopMasks]    ; 06B0 _ 4C: 8B. 3D, 00000000(rel)
        mov     r14, qword [rel .refptr.BishopAttacks]  ; 06B7 _ 4C: 8B. 35, 00000000(rel)
        mov     r13, qword [rel .refptr.RookMasks]      ; 06BE _ 4C: 8B. 2D, 00000000(rel)
?_474:  bsf     r9, r10                                 ; 06C5 _ 4D: 0F BC. CA
        pext    r12, rcx, qword [r13+r9*8]              ; 06C9 _ C4 02 F2: F5. 64 CD, 00
        pext    r11, rcx, qword [r15+r9*8]              ; 06D0 _ C4 02 F2: F5. 1C CF
        mov     edi, r11d                               ; 06D6 _ 44: 89. DF
        mov     r11d, r12d                              ; 06D9 _ 45: 89. E3
        mov     r12, qword [r14+r9*8]                   ; 06DC _ 4F: 8B. 24 CE
        blsr    r10, r10                                ; 06E0 _ C4 C2 A8: F3. CA
        mov     rdi, qword [r12+rdi*8]                  ; 06E5 _ 49: 8B. 3C FC
        mov     r12, qword [rel .refptr.RookAttacks]    ; 06E9 _ 4C: 8B. 25, 00000000(rel)
        mov     r12, qword [r12+r9*8]                   ; 06F0 _ 4F: 8B. 24 CC
        or      rdi, qword [r12+r11*8]                  ; 06F4 _ 4B: 0B. 3C DC
        and     rdi, rax                                ; 06F8 _ 48: 21. C7
        jz      ?_476                                   ; 06FB _ 74, 1D
        shl     r9d, 6                                  ; 06FD _ 41: C1. E1, 06
?_475:  bsf     r11, rdi                                ; 0701 _ 4C: 0F BC. DF
        add     rbx, 8                                  ; 0705 _ 48: 83. C3, 08
        or      r11d, r9d                               ; 0709 _ 45: 09. CB
        blsr    rdi, rdi                                ; 070C _ C4 E2 C0: F3. CF
        test    rdi, rdi                                ; 0711 _ 48: 85. FF
        mov     dword [rbx-8H], r11d                    ; 0714 _ 44: 89. 5B, F8
        jnz     ?_475                                   ; 0718 _ 75, E7
?_476:  test    r10, r10                                ; 071A _ 4D: 85. D2
        je      ?_451                                   ; 071D _ 0F 84, FFFFFCA5
        jmp     ?_474                                   ; 0723 _ EB, A0

?_477:  mov     r9, qword 7F000000000000H               ; 0725 _ 49: B9, 007F000000000000
        shl     r10, 8                                  ; 072F _ 49: C1. E2, 08
        mov     r14, qword 0FE000000000000H             ; 0733 _ 49: BE, 00FE000000000000
        and     r9, r12                                 ; 073D _ 4D: 21. E1
        and     r12, r14                                ; 0740 _ 4D: 21. F4
        and     r10, rax                                ; 0743 _ 49: 21. C2
        shl     r12, 7                                  ; 0746 _ 49: C1. E4, 07
        shl     r9, 9                                   ; 074A _ 49: C1. E1, 09
        mov     r8, r10                                 ; 074E _ 4D: 89. D0
        mov     r15, r12                                ; 0751 _ 4D: 89. E7
        and     r9, rbp                                 ; 0754 _ 49: 21. E9
        and     r15, rbp                                ; 0757 _ 49: 21. EF
?_478:  test    r9, r9                                  ; 075A _ 4D: 85. C9
        jne     ?_493                                   ; 075D _ 0F 85, 0000022C
?_479:  test    r15, r15                                ; 0763 _ 4D: 85. FF
        jne     ?_492                                   ; 0766 _ 0F 85, 000001E1
?_480:  test    r8, r8                                  ; 076C _ 4D: 85. C0
        je      ?_420                                   ; 076F _ 0F 84, FFFFF95B
        bsf     r10, r8                                 ; 0775 _ 4D: 0F BC. D0
        lea     r11d, [r10-8H]                          ; 0779 _ 45: 8D. 5A, F8
        add     rbx, 24                                 ; 077D _ 48: 83. C3, 18
        blsr    r8, r8                                  ; 0781 _ C4 C2 B8: F3. C8
        shl     r11d, 6                                 ; 0786 _ 41: C1. E3, 06
        or      r11d, r10d                              ; 078A _ 45: 09. D3
        mov     r12d, r11d                              ; 078D _ 45: 89. DC
        mov     r9d, r11d                               ; 0790 _ 45: 89. D9
        or      r11d, 4000H                             ; 0793 _ 41: 81. CB, 00004000
        or      r12d, 6000H                             ; 079A _ 41: 81. CC, 00006000
        or      r9d, 5000H                              ; 07A1 _ 41: 81. C9, 00005000
        mov     dword [rbx-18H], r12d                   ; 07A8 _ 44: 89. 63, E8
        mov     dword [rbx-10H], r9d                    ; 07AC _ 44: 89. 4B, F0
        mov     dword [rbx-8H], r11d                    ; 07B0 _ 44: 89. 5B, F8
        jmp     ?_480                                   ; 07B4 _ EB, B6

?_481:  test    al, 04H                                 ; 07B6 _ A8, 04
        je      ?_454                                   ; 07B8 _ 0F 84, FFFFFC69
        bsf     rdi, rdx                                ; 07BE _ 48: 0F BC. FA
        cmp     rdi, 62                                 ; 07C2 _ 48: 83. FF, 3E
        mov     r13, qword [rsi+270H]                   ; 07C6 _ 4C: 8B. AE, 00000270
        mov     r12d, 62                                ; 07CD _ 41: BC, 0000003E
        jz      ?_483                                   ; 07D3 _ 74, 2B
?_482:  mov     r8, qword [rsi+100H]                    ; 07D5 _ 4C: 8B. 86, 00000100
        mov     rdx, r12                                ; 07DC _ 4C: 89. E2
        mov     rcx, rsi                                ; 07DF _ 48: 89. F1
        call    _ZNK8Position12attackers_toE6Squarey    ; 07E2 _ E8, 00000000(rel)
        test    rax, rbp                                ; 07E7 _ 48: 85. E8
        jne     ?_489                                   ; 07EA _ 0F 85, 000000CC
        lea     eax, [r12-1H]                           ; 07F0 _ 41: 8D. 44 24, FF
        sub     r12, 1                                  ; 07F5 _ 49: 83. EC, 01
        cdqe                                            ; 07F9 _ 48: 98
        cmp     rdi, rax                                ; 07FB _ 48: 39. C7
        jnz     ?_482                                   ; 07FE _ 75, D5
?_483:  mov     ecx, edi                                ; 0800 _ 89. F9
        or      r13d, 0C000H                            ; 0802 _ 41: 81. CD, 0000C000
        add     rbx, 8                                  ; 0809 _ 48: 83. C3, 08
        shl     ecx, 6                                  ; 080D _ C1. E1, 06
        or      ecx, r13d                               ; 0810 _ 44: 09. E9
        mov     dword [rbx-8H], ecx                     ; 0813 _ 89. 4B, F8
        mov     rcx, qword [rsi+100H]                   ; 0816 _ 48: 8B. 8E, 00000100
        jmp     ?_454                                   ; 081D _ E9, FFFFFC05

?_484:  mov     r8, r14                                 ; 0822 _ 4D: 89. F0
        shr     r13, 8                                  ; 0825 _ 49: C1. ED, 08
        and     r14d, 7F00H                             ; 0829 _ 41: 81. E6, 00007F00
        and     r8d, 0FE00H                             ; 0830 _ 41: 81. E0, 0000FE00
        shr     r14, 7                                  ; 0837 _ 49: C1. EE, 07
        mov     r9, r13                                 ; 083B _ 4D: 89. E9
        shr     r8, 9                                   ; 083E _ 49: C1. E8, 09
        and     r14, rbp                                ; 0842 _ 49: 21. EE
        and     r9, rax                                 ; 0845 _ 49: 21. C1
        and     r8, rbp                                 ; 0848 _ 49: 21. E8
?_485:  test    r8, r8                                  ; 084B _ 4D: 85. C0
        jne     ?_491                                   ; 084E _ 0F 85, 000000B7
?_486:  test    r14, r14                                ; 0854 _ 4D: 85. F6
        jnz     ?_490                                   ; 0857 _ 75, 6F
?_487:  test    r9, r9                                  ; 0859 _ 4D: 85. C9
        je      ?_442                                   ; 085C _ 0F 84, FFFFFA9A
        bsf     r11, r9                                 ; 0862 _ 4D: 0F BC. D9
        lea     r10d, [r11+8H]                          ; 0866 _ 45: 8D. 53, 08
        add     rbx, 24                                 ; 086A _ 48: 83. C3, 18
        blsr    r9, r9                                  ; 086E _ C4 C2 B0: F3. C9
        shl     r10d, 6                                 ; 0873 _ 41: C1. E2, 06
        or      r11d, r10d                              ; 0877 _ 45: 09. D3
        mov     r8d, r11d                               ; 087A _ 45: 89. D8
        mov     r12d, r11d                              ; 087D _ 45: 89. DC
        or      r11d, 4000H                             ; 0880 _ 41: 81. CB, 00004000
        or      r8d, 6000H                              ; 0887 _ 41: 81. C8, 00006000
        or      r12d, 5000H                             ; 088E _ 41: 81. CC, 00005000
        mov     dword [rbx-18H], r8d                    ; 0895 _ 44: 89. 43, E8
        mov     dword [rbx-10H], r12d                   ; 0899 _ 44: 89. 63, F0
        mov     dword [rbx-8H], r11d                    ; 089D _ 44: 89. 5B, F8
        jmp     ?_487                                   ; 08A1 _ EB, B6

?_488:  mov     eax, r14d                               ; 08A3 _ 44: 89. F0
        shl     r13d, 6                                 ; 08A6 _ 41: C1. E5, 06
        add     rbx, 8                                  ; 08AA _ 48: 83. C3, 08
        or      ah, 0FFFFFFC0H                          ; 08AE _ 80. CC, C0
        or      eax, r13d                               ; 08B1 _ 44: 09. E8
        mov     dword [rbx-8H], eax                     ; 08B4 _ 89. 43, F8
        jmp     ?_429                                   ; 08B7 _ E9, FFFFF8D5

?_489:  mov     rcx, qword [rsi+100H]                   ; 08BC _ 48: 8B. 8E, 00000100
        jmp     ?_454                                   ; 08C3 _ E9, FFFFFB5F

?_490:  bsf     r15, r14                                ; 08C8 _ 4D: 0F BC. FE
        lea     edi, [r15+7H]                           ; 08CC _ 41: 8D. 7F, 07
        add     rbx, 24                                 ; 08D0 _ 48: 83. C3, 18
        blsr    r14, r14                                ; 08D4 _ C4 C2 88: F3. CE
        shl     edi, 6                                  ; 08D9 _ C1. E7, 06
        or      r15d, edi                               ; 08DC _ 41: 09. FF
        mov     r13d, r15d                              ; 08DF _ 45: 89. FD
        mov     r11d, r15d                              ; 08E2 _ 45: 89. FB
        or      r15d, 4000H                             ; 08E5 _ 41: 81. CF, 00004000
        or      r13d, 6000H                             ; 08EC _ 41: 81. CD, 00006000
        or      r11d, 5000H                             ; 08F3 _ 41: 81. CB, 00005000
        mov     dword [rbx-18H], r13d                   ; 08FA _ 44: 89. 6B, E8
        mov     dword [rbx-10H], r11d                   ; 08FE _ 44: 89. 5B, F0
        mov     dword [rbx-8H], r15d                    ; 0902 _ 44: 89. 7B, F8
        jmp     ?_486                                   ; 0906 _ E9, FFFFFF49

?_491:  bsf     r10, r8                                 ; 090B _ 4D: 0F BC. D0
        lea     r12d, [r10+9H]                          ; 090F _ 45: 8D. 62, 09
        add     rbx, 24                                 ; 0913 _ 48: 83. C3, 18
        blsr    r8, r8                                  ; 0917 _ C4 C2 B8: F3. C8
        shl     r12d, 6                                 ; 091C _ 41: C1. E4, 06
        or      r10d, r12d                              ; 0920 _ 45: 09. E2
        mov     r15d, r10d                              ; 0923 _ 45: 89. D7
        mov     edi, r10d                               ; 0926 _ 44: 89. D7
        or      r10d, 4000H                             ; 0929 _ 41: 81. CA, 00004000
        or      r15d, 6000H                             ; 0930 _ 41: 81. CF, 00006000
        or      edi, 5000H                              ; 0937 _ 81. CF, 00005000
        mov     dword [rbx-18H], r15d                   ; 093D _ 44: 89. 7B, E8
        mov     dword [rbx-10H], edi                    ; 0941 _ 89. 7B, F0
        mov     dword [rbx-8H], r10d                    ; 0944 _ 44: 89. 53, F8
        jmp     ?_485                                   ; 0948 _ E9, FFFFFEFE

?_492:  bsf     rdi, r15                                ; 094D _ 49: 0F BC. FF
        lea     r14d, [rdi-7H]                          ; 0951 _ 44: 8D. 77, F9
        add     rbx, 24                                 ; 0955 _ 48: 83. C3, 18
        blsr    r15, r15                                ; 0959 _ C4 C2 80: F3. CF
        shl     r14d, 6                                 ; 095E _ 41: C1. E6, 06
        or      edi, r14d                               ; 0962 _ 44: 09. F7
        mov     r13d, edi                               ; 0965 _ 41: 89. FD
        mov     r10d, edi                               ; 0968 _ 41: 89. FA
        or      edi, 4000H                              ; 096B _ 81. CF, 00004000
        or      r13d, 6000H                             ; 0971 _ 41: 81. CD, 00006000
        or      r10d, 5000H                             ; 0978 _ 41: 81. CA, 00005000
        mov     dword [rbx-18H], r13d                   ; 097F _ 44: 89. 6B, E8
        mov     dword [rbx-10H], r10d                   ; 0983 _ 44: 89. 53, F0
        mov     dword [rbx-8H], edi                     ; 0987 _ 89. 7B, F8
        jmp     ?_479                                   ; 098A _ E9, FFFFFDD4

?_493:  bsf     r11, r9                                 ; 098F _ 4D: 0F BC. D9
        lea     r12d, [r11-9H]                          ; 0993 _ 45: 8D. 63, F7
        add     rbx, 24                                 ; 0997 _ 48: 83. C3, 18
        blsr    r9, r9                                  ; 099B _ C4 C2 B0: F3. C9
        shl     r12d, 6                                 ; 09A0 _ 41: C1. E4, 06
        or      r11d, r12d                              ; 09A4 _ 45: 09. E3
        mov     edi, r11d                               ; 09A7 _ 44: 89. DF
        mov     r14d, r11d                              ; 09AA _ 45: 89. DE
        or      r11d, 4000H                             ; 09AD _ 41: 81. CB, 00004000
        or      edi, 6000H                              ; 09B4 _ 81. CF, 00006000
        or      r14d, 5000H                             ; 09BA _ 41: 81. CE, 00005000
        mov     dword [rbx-18H], edi                    ; 09C1 _ 89. 7B, E8
        mov     dword [rbx-10H], r14d                   ; 09C4 _ 44: 89. 73, F0
        mov     dword [rbx-8H], r11d                    ; 09C8 _ 44: 89. 5B, F8
        jmp     ?_478                                   ; 09CC _ E9, FFFFFD89

?_494:  mov     rdx, rbx                                ; 09D1 _ 48: 89. DA
        mov     rcx, rsi                                ; 09D4 _ 48: 89. F1
        call    _ZN12_GLOBAL__N_117generate_castlingIL13CastlingRight4ELb0ELb1EEEP7ExtMoveRK8PositionS3_5ColorPK9CheckInfo.isra.26.constprop.94; 09D7 _ E8, 00000709(rel)
        mov     rcx, rsi                                ; 09DC _ 48: 89. F1
        mov     rdx, rax                                ; 09DF _ 48: 89. C2
        add     rsp, 40                                 ; 09E2 _ 48: 83. C4, 28
        pop     rbx                                     ; 09E6 _ 5B
        pop     rsi                                     ; 09E7 _ 5E
        pop     rdi                                     ; 09E8 _ 5F
        pop     rbp                                     ; 09E9 _ 5D
        pop     r12                                     ; 09EA _ 41: 5C
        pop     r13                                     ; 09EC _ 41: 5D
        pop     r14                                     ; 09EE _ 41: 5E
        pop     r15                                     ; 09F0 _ 41: 5F
        jmp     _ZN12_GLOBAL__N_117generate_castlingIL13CastlingRight8ELb0ELb1EEEP7ExtMoveRK8PositionS3_5ColorPK9CheckInfo.isra.27.constprop.93; 09F2 _ E9, 00000608(rel)
; _Z8generateIL7GenType1EEP7ExtMoveRK8PositionS2_ End of function

?_495:  ; Local function
        mov     rdx, rbx                                ; 09F7 _ 48: 89. DA
        mov     rcx, rsi                                ; 09FA _ 48: 89. F1
        call    _ZN12_GLOBAL__N_117generate_castlingIL13CastlingRight1ELb0ELb1EEEP7ExtMoveRK8PositionS3_5ColorPK9CheckInfo.isra.22.constprop.97; 09FD _ E8, 000003EF(rel)
        mov     rcx, rsi                                ; 0A02 _ 48: 89. F1
        mov     rdx, rax                                ; 0A05 _ 48: 89. C2
        add     rsp, 40                                 ; 0A08 _ 48: 83. C4, 28
        pop     rbx                                     ; 0A0C _ 5B
        pop     rsi                                     ; 0A0D _ 5E
        pop     rdi                                     ; 0A0E _ 5F
        pop     rbp                                     ; 0A0F _ 5D
        pop     r12                                     ; 0A10 _ 41: 5C
        pop     r13                                     ; 0A12 _ 41: 5D
        pop     r14                                     ; 0A14 _ 41: 5E
        pop     r15                                     ; 0A16 _ 41: 5F
        jmp     _ZN12_GLOBAL__N_117generate_castlingIL13CastlingRight2ELb0ELb1EEEP7ExtMoveRK8PositionS3_5ColorPK9CheckInfo.isra.23.constprop.101; 0A18 _ E9, 000004EA(rel)

        nop                                             ; 0A1D _ 90
        nop                                             ; 0A1E _ 90
        nop                                             ; 0A1F _ 90


SECTION .xdata$_Z8generateIL7GenType1EEP7ExtMoveRK8PositionS2_ align=4 noexecute ; section number 15, const
;  Communal section not supported by YASM

        db 01H, 10H, 09H, 00H, 10H, 42H, 0CH, 30H       ; 0000 _ .....B.0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .xdata.unlikely align=4 noexecute               ; section number 17, const

        db 01H, 0EH, 08H, 00H, 0EH, 32H, 0AH, 30H       ; 0000 _ .....2.0
        db 09H, 60H, 08H, 70H, 07H, 50H, 06H, 0C0H      ; 0008 _ .`.p.P..
        db 04H, 0D0H, 02H, 0E0H, 01H, 0EH, 08H, 00H     ; 0010 _ ........
        db 0EH, 32H, 0AH, 30H, 09H, 60H, 08H, 70H       ; 0018 _ .2.0.`.p
        db 07H, 50H, 06H, 0C0H, 04H, 0D0H, 02H, 0E0H    ; 0020 _ .P......
        db 01H, 0EH, 08H, 00H, 0EH, 32H, 0AH, 30H       ; 0028 _ .....2.0
        db 09H, 60H, 08H, 70H, 07H, 50H, 06H, 0C0H      ; 0030 _ .`.p.P..
        db 04H, 0D0H, 02H, 0E0H, 01H, 0EH, 08H, 00H     ; 0038 _ ........
        db 0EH, 32H, 0AH, 30H, 09H, 60H, 08H, 70H       ; 0040 _ .2.0.`.p
        db 07H, 50H, 06H, 0C0H, 04H, 0D0H, 02H, 0E0H    ; 0048 _ .P......


SECTION .xdata  align=4 noexecute                       ; section number 19, const

        db 01H, 10H, 09H, 00H, 10H, 42H, 0CH, 30H       ; 0000 _ .....B.0
        db 0BH, 60H, 0AH, 70H, 09H, 50H, 08H, 0C0H      ; 0008 _ .`.p.P..
        db 06H, 0D0H, 04H, 0E0H, 02H, 0F0H, 00H, 00H    ; 0010 _ ........


SECTION .text$_Z10attacks_bb5Piece6Squarey align=16 execute ; section number 21, code
;  Communal section not supported by YASM

_Z10attacks_bb5Piece6Squarey:; Function begin
        mov     eax, ecx                                ; 0000 _ 89. C8
        and     eax, 07H                                ; 0002 _ 83. E0, 07
        cmp     eax, 4                                  ; 0005 _ 83. F8, 04
        jz      ?_497                                   ; 0008 _ 74, 3F
        cmp     eax, 5                                  ; 000A _ 83. F8, 05
        jz      ?_498                                   ; 000D _ 74, 5A
        cmp     eax, 3                                  ; 000F _ 83. F8, 03
        jz      ?_496                                   ; 0012 _ 74, 15
        mov     ecx, ecx                                ; 0014 _ 89. C9
        shl     rcx, 6                                  ; 0016 _ 48: C1. E1, 06
        add     rcx, rdx                                ; 001A _ 48: 01. D1
        mov     rdx, qword [rel .refptr.StepAttacksBB]  ; 001D _ 48: 8B. 15, 00000000(rel)
        mov     rax, qword [rdx+rcx*8]                  ; 0024 _ 48: 8B. 04 CA
        ret                                             ; 0028 _ C3

?_496:  mov     r11, qword [rel .refptr.BishopAttacks]  ; 0029 _ 4C: 8B. 1D, 00000000(rel)
        mov     r9, qword [rel .refptr.BishopMasks]     ; 0030 _ 4C: 8B. 0D, 00000000(rel)
        mov     rax, qword [r11+rdx*8]                  ; 0037 _ 49: 8B. 04 D3
        pext    r8, r8, qword [r9+rdx*8]                ; 003B _ C4 42 BA: F5. 04 D1
        mov     r10d, r8d                               ; 0041 _ 45: 89. C2
        mov     rax, qword [rax+r10*8]                  ; 0044 _ 4A: 8B. 04 D0
        ret                                             ; 0048 _ C3

?_497:  mov     rax, qword [rel .refptr.RookAttacks]    ; 0049 _ 48: 8B. 05, 00000000(rel)
        mov     r11, qword [rel .refptr.RookMasks]      ; 0050 _ 4C: 8B. 1D, 00000000(rel)
        mov     rcx, qword [rax+rdx*8]                  ; 0057 _ 48: 8B. 0C D0
        pext    r8, r8, qword [r11+rdx*8]               ; 005B _ C4 42 BA: F5. 04 D3
        mov     r10d, r8d                               ; 0061 _ 45: 89. C2
        mov     rax, qword [rcx+r10*8]                  ; 0064 _ 4A: 8B. 04 D1
        ret                                             ; 0068 _ C3
; _Z10attacks_bb5Piece6Squarey End of function

?_498:  ; Local function
        mov     rcx, qword [rel .refptr.BishopMasks]    ; 0069 _ 48: 8B. 0D, 00000000(rel)
        mov     r10, qword [rel .refptr.RookMasks]      ; 0070 _ 4C: 8B. 15, 00000000(rel)
        mov     rax, qword [rel .refptr.RookAttacks]    ; 0077 _ 48: 8B. 05, 00000000(rel)
        pext    r9, r8, qword [rcx+rdx*8]               ; 007E _ C4 62 BA: F5. 0C D1
        mov     ecx, r9d                                ; 0084 _ 44: 89. C9
        mov     r9, qword [rel .refptr.BishopAttacks]   ; 0087 _ 4C: 8B. 0D, 00000000(rel)
        pext    r8, r8, qword [r10+rdx*8]               ; 008E _ C4 42 BA: F5. 04 D2
        mov     r11d, r8d                               ; 0094 _ 45: 89. C3
        mov     r10, qword [rax+rdx*8]                  ; 0097 _ 4C: 8B. 14 D0
        mov     rdx, qword [r9+rdx*8]                   ; 009B _ 49: 8B. 14 D1
        mov     rax, qword [r10+r11*8]                  ; 009F _ 4B: 8B. 04 DA
        or      rax, qword [rdx+rcx*8]                  ; 00A3 _ 48: 0B. 04 CA
        ret                                             ; 00A7 _ C3

        nop                                             ; 00A8 _ 90
        nop                                             ; 00A9 _ 90
        nop                                             ; 00AA _ 90
        nop                                             ; 00AB _ 90
        nop                                             ; 00AC _ 90
        nop                                             ; 00AD _ 90
        nop                                             ; 00AE _ 90
        nop                                             ; 00AF _ 90


SECTION .xdata$_Z10attacks_bb5Piece6Squarey align=4 noexecute ; section number 22, const
;  Communal section not supported by YASM

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .rdata$zzz align=16 noexecute                   ; section number 24, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr.BetweenBB align=16 noexecute     ; section number 25, const
;  Communal section not supported by YASM

.refptr.BetweenBB:                                      ; qword
        dq BetweenBB                                    ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.LineBB align=16 noexecute        ; section number 26, const
;  Communal section not supported by YASM

.refptr.LineBB:                                         ; qword
        dq LineBB                                       ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.SquareBB align=16 noexecute      ; section number 27, const
;  Communal section not supported by YASM

.refptr.SquareBB:                                       ; qword
        dq SquareBB                                     ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.FileBB align=16 noexecute        ; section number 28, const
;  Communal section not supported by YASM

.refptr.FileBB:                                         ; qword
        dq FileBB                                       ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.PseudoAttacks align=16 noexecute ; section number 29, const
;  Communal section not supported by YASM

.refptr.PseudoAttacks:                                  ; qword
        dq PseudoAttacks                                ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.RookAttacks align=16 noexecute   ; section number 30, const
;  Communal section not supported by YASM

.refptr.RookAttacks:                                    ; qword
        dq RookAttacks                                  ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.RookMasks align=16 noexecute     ; section number 31, const
;  Communal section not supported by YASM

.refptr.RookMasks:                                      ; qword
        dq RookMasks                                    ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.BishopAttacks align=16 noexecute ; section number 32, const
;  Communal section not supported by YASM

.refptr.BishopAttacks:                                  ; qword
        dq BishopAttacks                                ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.BishopMasks align=16 noexecute   ; section number 33, const
;  Communal section not supported by YASM

.refptr.BishopMasks:                                    ; qword
        dq BishopMasks                                  ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.StepAttacksBB align=16 noexecute ; section number 34, const
;  Communal section not supported by YASM

.refptr.StepAttacksBB:                                  ; qword
        dq StepAttacksBB                                ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


