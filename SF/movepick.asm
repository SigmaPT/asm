; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\movepick.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: Pentium Pro, x64

default rel

global _ZN10MovePicker5scoreIL7GenType0EEEvv: function
global _ZN10MovePicker5scoreIL7GenType1EEEvv: function
global _ZN10MovePickerC1ERK8Position4Move5DepthRK5StatsI5ValueLb0EERKS5_IS6_Lb1EESC_S3_PN6Search5StackE: function
global _ZN10MovePickerC2ERK8Position4Move5DepthRK5StatsI5ValueLb0EERKS5_IS6_Lb1EESC_S3_PN6Search5StackE: function
global _ZN10MovePicker9next_moveEv: function
global _ZN10MovePickerC1ERK8Position4Move5DepthRK5StatsI5ValueLb0EE6Square: function
global _ZN10MovePickerC2ERK8Position4Move5DepthRK5StatsI5ValueLb0EE6Square: function
global _ZN10MovePicker19generate_next_stageEv: function
global _ZN10MovePicker5scoreIL7GenType3EEEvv: function
global _ZN10MovePickerC1ERK8Position4MoveRK5StatsI5ValueLb0EES5_: function
global _ZN10MovePickerC2ERK8Position4MoveRK5StatsI5ValueLb0EES5_: function
global .refptr.PieceValue

extern PieceValue                                       ; byte
extern _Z8generateIL7GenType1EEP7ExtMoveRK8PositionS2_  ; near
extern _Z8generateIL7GenType3EEP7ExtMoveRK8PositionS2_  ; near
extern _Z8generateIL7GenType2EEP7ExtMoveRK8PositionS2_  ; near
extern _Z8generateIL7GenType0EEP7ExtMoveRK8PositionS2_  ; near
extern _ZNK8Position3seeE4Move                          ; near
extern _ZNK8Position8see_signE4Move                     ; near
extern _ZNK8Position12pseudo_legalE4Move                ; near


SECTION .text   align=16 execute                        ; section number 1, code


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=16 noexecute                      ; section number 3, bss


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_ZN10MovePicker9next_moveEv.cold.11:
        mov     r9, rax                                 ; 0000 _ 49: 89. C1
        jmp     ?_035                                   ; 0003 _ E9, 000003E0(rel)

        mov     r9, rax                                 ; 0008 _ 49: 89. C1
        jmp     ?_015                                   ; 000B _ E9, 00000168(rel)

?_001:  ; Local function
        mov     rax, qword [rbx+870H]                   ; 0010 _ 48: 8B. 83, 00000870
        jmp     .text.hot+0E6H                          ; 0017 _ E9, 000000E6(rel)

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_ZN10MovePicker5scoreIL7GenType0EEEvv:; Function begin
        mov     r9, qword [rel .refptr.PieceValue]      ; 0020 _ 4C: 8B. 0D, 00000000(rel)
        mov     r10, qword [rcx+878H]                   ; 0027 _ 4C: 8B. 91, 00000878
        lea     rdx, [rcx+70H]                          ; 002E _ 48: 8D. 51, 70
?_002:  cmp     rdx, r10                                ; 0032 _ 4C: 39. D2
        jz      ?_003                                   ; 0035 _ 74, 32
        mov     eax, dword [rdx]                        ; 0037 _ 8B. 02
        add     rdx, 8                                  ; 0039 _ 48: 83. C2, 08
        mov     r8, qword [rcx]                         ; 003D _ 4C: 8B. 01
        and     eax, 3FH                                ; 0040 _ 83. E0, 3F
        mov     r11d, dword [r8+rax*4]                  ; 0043 _ 45: 8B. 1C 80
        shr     rax, 3                                  ; 0047 _ 48: C1. E8, 03
        imul    r8d, dword [r8+3ACH], 7                 ; 004B _ 45: 6B. 80, 000003AC, 07
        mov     r11d, dword [r9+r11*4]                  ; 0053 _ 47: 8B. 1C 99
        xor     eax, r8d                                ; 0057 _ 44: 31. C0
        imul    eax, eax, 200                           ; 005A _ 69. C0, 000000C8
        sub     r11d, eax                               ; 0060 _ 41: 29. C3
        mov     dword [rdx-4H], r11d                    ; 0063 _ 44: 89. 5A, FC
        jmp     ?_002                                   ; 0067 _ EB, C9
; _ZN10MovePicker5scoreIL7GenType0EEEvv End of function

?_003:  ; Local function
        ret                                             ; 0069 _ C3

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZN10MovePicker5scoreIL7GenType1EEEvv:; Function begin
        mov     r9, qword [rcx+878H]                    ; 0070 _ 4C: 8B. 89, 00000878
        lea     r8, [rcx+70H]                           ; 0077 _ 4C: 8D. 41, 70
        jmp     ?_005                                   ; 007B _ EB, 42

?_004:  mov     eax, dword [r8]                         ; 007D _ 41: 8B. 00
        add     r8, 8                                   ; 0080 _ 49: 83. C0, 08
        mov     r10, qword [rcx]                        ; 0084 _ 4C: 8B. 11
        mov     edx, eax                                ; 0087 _ 89. C2
        and     eax, 3FH                                ; 0089 _ 83. E0, 3F
        sar     edx, 6                                  ; 008C _ C1. FA, 06
        shl     rax, 2                                  ; 008F _ 48: C1. E0, 02
        and     edx, 3FH                                ; 0093 _ 83. E2, 3F
        mov     edx, dword [r10+rdx*4]                  ; 0096 _ 41: 8B. 14 92
        shl     rdx, 8                                  ; 009A _ 48: C1. E2, 08
        mov     r10, rdx                                ; 009E _ 49: 89. D2
        mov     r11, rdx                                ; 00A1 _ 49: 89. D3
        add     r10, qword [rcx+18H]                    ; 00A4 _ 4C: 03. 51, 18
        add     r11, qword [rcx+10H]                    ; 00A8 _ 4C: 03. 59, 10
        add     rdx, qword [rcx+8H]                     ; 00AC _ 48: 03. 51, 08
        mov     edx, dword [rdx+rax]                    ; 00B0 _ 8B. 14 02
        add     edx, dword [r11+rax]                    ; 00B3 _ 41: 03. 14 03
        add     edx, dword [r10+rax]                    ; 00B7 _ 41: 03. 14 02
        mov     dword [r8-4H], edx                      ; 00BB _ 41: 89. 50, FC
?_005:  cmp     r8, r9                                  ; 00BF _ 4D: 39. C8
        jnz     ?_004                                   ; 00C2 _ 75, B9
        ret                                             ; 00C4 _ C3
; _ZN10MovePicker5scoreIL7GenType1EEEvv End of function

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


SECTION .text.hot align=16 execute                      ; section number 5, code

.text.hot:; Local function

_ZN10MovePickerC1ERK8Position4Move5DepthRK5StatsI5ValueLb0EERKS5_IS6_Lb1EESC_S3_PN6Search5StackE:

_ZN10MovePickerC2ERK8Position4Move5DepthRK5StatsI5ValueLb0EERKS5_IS6_Lb1EESC_S3_PN6Search5StackE:
        push    rbx                                     ; 0000 _ 53
        sub     rsp, 48                                 ; 0001 _ 48: 83. EC, 30
        mov     r11, qword [rsp+80H]                    ; 0005 _ 4C: 8B. 9C 24, 00000080
        mov     rax, qword [rsp+60H]                    ; 000D _ 48: 8B. 44 24, 60
        mov     r10, qword [rsp+70H]                    ; 0012 _ 4C: 8B. 54 24, 70
        mov     rbx, rcx                                ; 0017 _ 48: 89. CB
        mov     rcx, rdx                                ; 001A _ 48: 89. D1
        mov     qword [rbx], rdx                        ; 001D _ 48: 89. 13
        mov     rdx, qword [rsp+68H]                    ; 0020 _ 48: 8B. 54 24, 68
        mov     qword [rbx+20H], r11                    ; 0025 _ 4C: 89. 5B, 20
        lea     r11, [rbx+70H]                          ; 0029 _ 4C: 8D. 5B, 70
        mov     dword [rbx+2CH], r9d                    ; 002D _ 44: 89. 4B, 2C
        lea     r9, [rbx+868H]                          ; 0031 _ 4C: 8D. 8B, 00000868
        mov     qword [rbx+8H], rax                     ; 0038 _ 48: 89. 43, 08
        mov     eax, dword [rsp+78H]                    ; 003C _ 8B. 44 24, 78
        mov     qword [rbx+18H], r10                    ; 0040 _ 4C: 89. 53, 18
        mov     qword [rbx+10H], rdx                    ; 0044 _ 48: 89. 53, 10
        mov     qword [rbx+68H], r9                     ; 0048 _ 4C: 89. 4B, 68
        mov     qword [rbx+870H], r11                   ; 004C _ 4C: 89. 9B, 00000870
        mov     qword [rbx+878H], r11                   ; 0053 _ 4C: 89. 9B, 00000878
        mov     rdx, qword [rcx+3B8H]                   ; 005A _ 48: 8B. 91, 000003B8
        mov     dword [rbx+28H], eax                    ; 0061 _ 89. 43, 28
        cmp     qword [rdx+38H], 1                      ; 0064 _ 48: 83. 7A, 38, 01
        sbb     r10d, r10d                              ; 0069 _ 45: 19. D2
        not     r10d                                    ; 006C _ 41: F7. D2
        and     r10d, 06H                               ; 006F _ 41: 83. E2, 06
        test    r8d, r8d                                ; 0073 _ 45: 85. C0
        mov     dword [rbx+5CH], r10d                   ; 0076 _ 44: 89. 53, 5C
        jnz     ?_008                                   ; 007A _ 75, 19
?_006:  xor     r8d, r8d                                ; 007C _ 45: 31. C0
        xor     ecx, ecx                                ; 007F _ 31. C9
?_007:  add     r11, rcx                                ; 0081 _ 49: 01. CB
        mov     dword [rbx+30H], r8d                    ; 0084 _ 44: 89. 43, 30
        mov     qword [rbx+878H], r11                   ; 0088 _ 4C: 89. 9B, 00000878
        add     rsp, 48                                 ; 008F _ 48: 83. C4, 30
        pop     rbx                                     ; 0093 _ 5B
        ret                                             ; 0094 _ C3

?_008:  ; Local function
        mov     edx, r8d                                ; 0095 _ 44: 89. C2
        mov     dword [rsp+2CH], r8d                    ; 0098 _ 44: 89. 44 24, 2C
        call    _ZNK8Position12pseudo_legalE4Move       ; 009D _ E8, 00000000(rel)
        mov     r8d, dword [rsp+2CH]                    ; 00A2 _ 44: 8B. 44 24, 2C
        test    al, al                                  ; 00A7 _ 84. C0
        mov     r11, qword [rbx+878H]                   ; 00A9 _ 4C: 8B. 9B, 00000878
        jz      ?_006                                   ; 00B0 _ 74, CA
        mov     ecx, 8                                  ; 00B2 _ B9, 00000008
        jmp     ?_007                                   ; 00B7 _ EB, C8

        nop                                             ; 00B9 _ 90
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8

_ZN10MovePicker9next_moveEv:; Function begin
        push    rdi                                     ; 00C0 _ 57
        push    rsi                                     ; 00C1 _ 56
        push    rbx                                     ; 00C2 _ 53
        sub     rsp, 32                                 ; 00C3 _ 48: 83. EC, 20
        lea     rdi, [rel ?_100]                        ; 00C7 _ 48: 8D. 3D, 00000000(rel)
        mov     r10, qword [rcx+870H]                   ; 00CE _ 4C: 8B. 91, 00000870
        mov     r8d, dword [rcx+5CH]                    ; 00D5 _ 44: 8B. 41, 5C
        mov     rbx, rcx                                ; 00D9 _ 48: 89. CB
        mov     rcx, qword [rcx+878H]                   ; 00DC _ 48: 8B. 89, 00000878
?_009:  mov     rax, r10                                ; 00E3 _ 4C: 89. D0
        cmp     rax, rcx                                ; 00E6 _ 48: 39. C8
        je      ?_016                                   ; 00E9 _ 0F 84, 000000A1
?_010:  cmp     r8d, 17                                 ; 00EF _ 41: 83. F8, 11
        ja      ?_001                                   ; 00F3 _ 0F 87, 00000010(rel)
        mov     edx, r8d                                ; 00F9 _ 44: 89. C2
        movsxd  rsi, dword [rdi+rdx*4]                  ; 00FC _ 48: 63. 34 97
        add     rsi, rdi                                ; 0100 _ 48: 01. FE
        jmp     rsi                                     ; 0103 _ FF. E6

?_011:  lea     r10, [rax+8H]                           ; 0105 _ 4C: 8D. 50, 08
        mov     eax, dword [rax]                        ; 0109 _ 8B. 00
        cmp     eax, dword [rbx+30H]                    ; 010B _ 3B. 43, 30
        mov     qword [rbx+870H], r10                   ; 010E _ 4C: 89. 93, 00000870
        jz      ?_009                                   ; 0115 _ 74, CC
        cmp     eax, dword [rbx+34H]                    ; 0117 _ 3B. 43, 34
        jz      ?_009                                   ; 011A _ 74, C7
        cmp     eax, dword [rbx+3CH]                    ; 011C _ 3B. 43, 3C
        jz      ?_009                                   ; 011F _ 74, C2
        cmp     eax, dword [rbx+44H]                    ; 0121 _ 3B. 43, 44
        jz      ?_009                                   ; 0124 _ 74, BD
?_012:  add     rsp, 32                                 ; 0126 _ 48: 83. C4, 20
        pop     rbx                                     ; 012A _ 5B
        pop     rsi                                     ; 012B _ 5E
        pop     rdi                                     ; 012C _ 5F
        ret                                             ; 012D _ C3

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_013:  lea     r10, [rax+8H]                           ; 0130 _ 4C: 8D. 50, 08
        cmp     rax, rcx                                ; 0134 _ 48: 39. C8
        mov     r9, rax                                 ; 0137 _ 49: 89. C1
        mov     qword [rbx+870H], r10                   ; 013A _ 4C: 89. 93, 00000870
        je      Unnamed_4_8                             ; 0141 _ 0F 84, 00000008(rel)
        mov     r11, rax                                ; 0147 _ 49: 89. C3
        add     r11, 8                                  ; 014A _ 49: 83. C3, 08
        cmp     r11, rcx                                ; 014E _ 49: 39. CB
        jz      ?_015                                   ; 0151 _ 74, 15
?_014:  mov     edx, dword [r11+4H]                     ; 0153 _ 41: 8B. 53, 04
        cmp     dword [r9+4H], edx                      ; 0157 _ 41: 39. 51, 04
        cmovl   r9, r11                                 ; 015B _ 4D: 0F 4C. CB
        add     r11, 8                                  ; 015F _ 49: 83. C3, 08
        cmp     r11, rcx                                ; 0163 _ 49: 39. CB
        jnz     ?_014                                   ; 0166 _ 75, EB
?_015:  mov     r11d, dword [rax]                       ; 0168 _ 44: 8B. 18
        mov     edx, dword [rax+4H]                     ; 016B _ 8B. 50, 04
        mov     rsi, qword [r9]                         ; 016E _ 49: 8B. 31
        mov     qword [rax], rsi                        ; 0171 _ 48: 89. 30
        mov     dword [r9], r11d                        ; 0174 _ 45: 89. 19
        mov     dword [r9+4H], edx                      ; 0177 _ 41: 89. 51, 04
        mov     eax, dword [rax]                        ; 017B _ 8B. 00
        cmp     dword [rbx+30H], eax                    ; 017D _ 39. 43, 30
        jnz     ?_012                                   ; 0180 _ 75, A4
        jmp     ?_009                                   ; 0182 _ E9, FFFFFF5C

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_016:  cmp     r8d, 17                                 ; 0190 _ 41: 83. F8, 11
        je      ?_024                                   ; 0194 _ 0F 84, 00000135
?_017:  mov     rcx, rbx                                ; 019A _ 48: 89. D9
        call    _ZN10MovePicker19generate_next_stageEv  ; 019D _ E8, 0000037E
        mov     rax, qword [rbx+870H]                   ; 01A2 _ 48: 8B. 83, 00000870
        mov     rcx, qword [rbx+878H]                   ; 01A9 _ 48: 8B. 8B, 00000878
        cmp     rax, rcx                                ; 01B0 _ 48: 39. C8
        je      ?_023                                   ; 01B3 _ 0F 84, 0000010C
        mov     r8d, dword [rbx+5CH]                    ; 01B9 _ 44: 8B. 43, 5C
        jmp     ?_010                                   ; 01BD _ E9, FFFFFF2D

?_018:  lea     r10, [rax+8H]                           ; 01C2 _ 4C: 8D. 50, 08
        cmp     rcx, rax                                ; 01C6 _ 48: 39. C1
        mov     r9, rax                                 ; 01C9 _ 49: 89. C1
        mov     qword [rbx+870H], r10                   ; 01CC _ 4C: 89. 93, 00000870
        jz      ?_020                                   ; 01D3 _ 74, 20
        mov     r11, rax                                ; 01D5 _ 49: 89. C3
        add     r11, 8                                  ; 01D8 _ 49: 83. C3, 08
        cmp     r11, rcx                                ; 01DC _ 49: 39. CB
        jz      ?_020                                   ; 01DF _ 74, 14
?_019:  mov     edx, dword [r11+4H]                     ; 01E1 _ 41: 8B. 53, 04
        cmp     dword [rax+4H], edx                     ; 01E5 _ 39. 50, 04
        cmovl   rax, r11                                ; 01E8 _ 49: 0F 4C. C3
        add     r11, 8                                  ; 01EC _ 49: 83. C3, 08
        cmp     r11, rcx                                ; 01F0 _ 49: 39. CB
        jnz     ?_019                                   ; 01F3 _ 75, EC
?_020:  mov     rsi, qword [rax]                        ; 01F5 _ 48: 8B. 30
        mov     r11d, dword [r9]                        ; 01F8 _ 45: 8B. 19
        mov     edx, dword [r9+4H]                      ; 01FB _ 41: 8B. 51, 04
        mov     qword [r9], rsi                         ; 01FF _ 49: 89. 31
        mov     dword [rax], r11d                       ; 0202 _ 44: 89. 18
        mov     dword [rax+4H], edx                     ; 0205 _ 89. 50, 04
        mov     esi, dword [r9]                         ; 0208 _ 41: 8B. 31
        cmp     dword [rbx+30H], esi                    ; 020B _ 39. 73, 30
        je      ?_009                                   ; 020E _ 0F 84, FFFFFECF
        mov     rcx, qword [rbx]                        ; 0214 _ 48: 8B. 0B
        mov     edx, esi                                ; 0217 _ 89. F2
        call    _ZNK8Position8see_signE4Move            ; 0219 _ E8, 00000000(rel)
        test    eax, eax                                ; 021E _ 85. C0
        jns     ?_025                                   ; 0220 _ 0F 89, 000000BA
        mov     rcx, qword [rbx+68H]                    ; 0226 _ 48: 8B. 4B, 68
        mov     r10, qword [rbx+870H]                   ; 022A _ 4C: 8B. 93, 00000870
        mov     r8d, dword [rbx+5CH]                    ; 0231 _ 44: 8B. 43, 5C
        lea     rax, [rcx-8H]                           ; 0235 _ 48: 8D. 41, F8
        mov     qword [rbx+68H], rax                    ; 0239 _ 48: 89. 43, 68
        mov     dword [rcx], esi                        ; 023D _ 89. 31
        mov     rcx, qword [rbx+878H]                   ; 023F _ 48: 8B. 8B, 00000878
        jmp     ?_009                                   ; 0246 _ E9, FFFFFE98

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_021:  xor     eax, eax                                ; 0250 _ 31. C0
        jmp     ?_012                                   ; 0252 _ E9, FFFFFECF

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_022:  mov     esi, dword [rax]                        ; 0260 _ 8B. 30
        lea     r10, [rax+8H]                           ; 0262 _ 4C: 8D. 50, 08
        mov     qword [rbx+870H], r10                   ; 0266 _ 4C: 89. 93, 00000870
        test    esi, esi                                ; 026D _ 85. F6
        je      ?_009                                   ; 026F _ 0F 84, FFFFFE6E
        cmp     esi, dword [rbx+30H]                    ; 0275 _ 3B. 73, 30
        je      ?_009                                   ; 0278 _ 0F 84, FFFFFE65
        mov     rcx, qword [rbx]                        ; 027E _ 48: 8B. 0B
        mov     edx, esi                                ; 0281 _ 89. F2
        call    _ZNK8Position12pseudo_legalE4Move       ; 0283 _ E8, 00000000(rel)
        test    al, al                                  ; 0288 _ 84. C0
        je      ?_036                                   ; 028A _ 0F 84, 00000180
        mov     rax, qword [rbx]                        ; 0290 _ 48: 8B. 03
        mov     r8d, esi                                ; 0293 _ 41: 89. F0
        mov     r9d, esi                                ; 0296 _ 41: 89. F1
        and     r8d, 3FH                                ; 0299 _ 41: 83. E0, 3F
        mov     r10d, dword [rax+r8*4]                  ; 029D _ 46: 8B. 14 80
        test    r10d, r10d                              ; 02A1 _ 45: 85. D2
        jne     ?_038                                   ; 02A4 _ 0F 85, 00000184
        and     r9d, 0C000H                             ; 02AA _ 41: 81. E1, 0000C000
        cmp     r9d, 32768                              ; 02B1 _ 41: 81. F9, 00008000
        je      ?_039                                   ; 02B8 _ 0F 84, 00000187
        mov     eax, esi                                ; 02BE _ 89. F0
        jmp     ?_012                                   ; 02C0 _ E9, FFFFFE61

?_023:  cmp     dword [rbx+5CH], 17                     ; 02C5 _ 83. 7B, 5C, 11
        jne     ?_017                                   ; 02C9 _ 0F 85, FFFFFECB
?_024:  xor     eax, eax                                ; 02CF _ 31. C0
        jmp     ?_012                                   ; 02D1 _ E9, FFFFFE50

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
?_025:  mov     eax, esi                                ; 02E0 _ 89. F0
        jmp     ?_012                                   ; 02E2 _ E9, FFFFFE3F

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_026:  lea     r10, [rax+8H]                           ; 02F0 _ 4C: 8D. 50, 08
        mov     eax, dword [rax]                        ; 02F4 _ 8B. 00
        cmp     eax, dword [rbx+30H]                    ; 02F6 _ 3B. 43, 30
        mov     qword [rbx+870H], r10                   ; 02F9 _ 4C: 89. 93, 00000870
        jne     ?_012                                   ; 0300 _ 0F 85, FFFFFE20
        jmp     ?_009                                   ; 0306 _ E9, FFFFFDD8

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_027:  lea     rcx, [rax-8H]                           ; 0310 _ 48: 8D. 48, F8
        mov     eax, dword [rax]                        ; 0314 _ 8B. 00
        mov     qword [rbx+870H], rcx                   ; 0316 _ 48: 89. 8B, 00000870
        jmp     ?_012                                   ; 031D _ E9, FFFFFE04

?_028:  add     rax, 8                                  ; 0322 _ 48: 83. C0, 08
        mov     qword [rbx+870H], rax                   ; 0326 _ 48: 89. 83, 00000870
        mov     eax, dword [rbx+30H]                    ; 032D _ 8B. 43, 30
        jmp     ?_012                                   ; 0330 _ E9, FFFFFDF1

?_029:  lea     r10, [rax+8H]                           ; 0335 _ 4C: 8D. 50, 08
        cmp     rax, rcx                                ; 0339 _ 48: 39. C8
        mov     r9, rcx                                 ; 033C _ 49: 89. C9
        mov     qword [rbx+870H], r10                   ; 033F _ 4C: 89. 93, 00000870
        jz      ?_031                                   ; 0346 _ 74, 1D
        cmp     r10, rcx                                ; 0348 _ 49: 39. CA
        mov     r9, rax                                 ; 034B _ 49: 89. C1
        jz      ?_031                                   ; 034E _ 74, 15
?_030:  mov     r11d, dword [r10+4H]                    ; 0350 _ 45: 8B. 5A, 04
        cmp     dword [r9+4H], r11d                     ; 0354 _ 45: 39. 59, 04
        cmovl   r9, r10                                 ; 0358 _ 4D: 0F 4C. CA
        add     r10, 8                                  ; 035C _ 49: 83. C2, 08
        cmp     r10, rcx                                ; 0360 _ 49: 39. CA
        jnz     ?_030                                   ; 0363 _ 75, EB
?_031:  mov     esi, dword [rax]                        ; 0365 _ 8B. 30
        mov     edx, dword [rax+4H]                     ; 0367 _ 8B. 50, 04
        mov     r10, qword [r9]                         ; 036A _ 4D: 8B. 11
        mov     qword [rax], r10                        ; 036D _ 4C: 89. 10
        mov     dword [r9], esi                         ; 0370 _ 41: 89. 31
        mov     dword [r9+4H], edx                      ; 0373 _ 41: 89. 51, 04
        mov     esi, dword [rax]                        ; 0377 _ 8B. 30
        cmp     dword [rbx+30H], esi                    ; 0379 _ 39. 73, 30
        jz      ?_032                                   ; 037C _ 74, 1E
        mov     rcx, qword [rbx]                        ; 037E _ 48: 8B. 0B
        mov     edx, esi                                ; 0381 _ 89. F2
        call    _ZNK8Position3seeE4Move                 ; 0383 _ E8, 00000000(rel)
        cmp     eax, dword [rbx+58H]                    ; 0388 _ 3B. 43, 58
        jg      ?_037                                   ; 038B _ 0F 8F, 00000096
        mov     r8d, dword [rbx+5CH]                    ; 0391 _ 44: 8B. 43, 5C
        mov     rcx, qword [rbx+878H]                   ; 0395 _ 48: 8B. 8B, 00000878
?_032:  mov     r10, qword [rbx+870H]                   ; 039C _ 4C: 8B. 93, 00000870
        jmp     ?_009                                   ; 03A3 _ E9, FFFFFD3B

?_033:  lea     r10, [rax+8H]                           ; 03A8 _ 4C: 8D. 50, 08
        cmp     rax, rcx                                ; 03AC _ 48: 39. C8
        mov     r9, rax                                 ; 03AF _ 49: 89. C1
        mov     qword [rbx+870H], r10                   ; 03B2 _ 4C: 89. 93, 00000870
        je      _ZN10MovePicker9next_moveEv.cold.11     ; 03B9 _ 0F 84, 00000000(rel)
        mov     r11, rax                                ; 03BF _ 49: 89. C3
        add     r11, 8                                  ; 03C2 _ 49: 83. C3, 08
        cmp     r11, rcx                                ; 03C6 _ 49: 39. CB
        jz      ?_035                                   ; 03C9 _ 74, 15
?_034:  mov     edx, dword [r11+4H]                     ; 03CB _ 41: 8B. 53, 04
        cmp     dword [r9+4H], edx                      ; 03CF _ 41: 39. 51, 04
        cmovl   r9, r11                                 ; 03D3 _ 4D: 0F 4C. CB
        add     r11, 8                                  ; 03D7 _ 49: 83. C3, 08
        cmp     r11, rcx                                ; 03DB _ 49: 39. CB
        jnz     ?_034                                   ; 03DE _ 75, EB
?_035:  mov     r11d, dword [rax]                       ; 03E0 _ 44: 8B. 18
        mov     edx, dword [rax+4H]                     ; 03E3 _ 8B. 50, 04
        mov     rsi, qword [r9]                         ; 03E6 _ 49: 8B. 31
        mov     qword [rax], rsi                        ; 03E9 _ 48: 89. 30
        mov     dword [r9], r11d                        ; 03EC _ 45: 89. 19
        mov     dword [r9+4H], edx                      ; 03EF _ 41: 89. 51, 04
        mov     eax, dword [rax]                        ; 03F3 _ 8B. 00
        mov     r9d, eax                                ; 03F5 _ 41: 89. C1
        and     r9d, 3FH                                ; 03F8 _ 41: 83. E1, 3F
        cmp     qword [rbx+50H], r9                     ; 03FC _ 4C: 39. 4B, 50
        jne     ?_009                                   ; 0400 _ 0F 85, FFFFFCDD
        jmp     ?_012                                   ; 0406 _ E9, FFFFFD1B

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_036:  mov     r10, qword [rbx+870H]                   ; 0410 _ 4C: 8B. 93, 00000870
        mov     r8d, dword [rbx+5CH]                    ; 0417 _ 44: 8B. 43, 5C
        mov     rcx, qword [rbx+878H]                   ; 041B _ 48: 8B. 8B, 00000878
        jmp     ?_009                                   ; 0422 _ E9, FFFFFCBC

?_037:  mov     eax, esi                                ; 0427 _ 89. F0
        jmp     ?_012                                   ; 0429 _ E9, FFFFFCF8

?_038:  and     r9d, 0C000H                             ; 042E _ 41: 81. E1, 0000C000
        cmp     r9d, 49152                              ; 0435 _ 41: 81. F9, 0000C000
        jnz     ?_039                                   ; 043C _ 75, 07
        mov     eax, esi                                ; 043E _ 89. F0
        jmp     ?_012                                   ; 0440 _ E9, FFFFFCE1

?_039:  mov     r10, qword [rbx+870H]                   ; 0445 _ 4C: 8B. 93, 00000870
        mov     r8d, dword [rbx+5CH]                    ; 044C _ 44: 8B. 43, 5C
        mov     rcx, qword [rbx+878H]                   ; 0450 _ 48: 8B. 8B, 00000878
        jmp     ?_009                                   ; 0457 _ E9, FFFFFC87

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

_ZN10MovePickerC1ERK8Position4Move5DepthRK5StatsI5ValueLb0EE6Square:

_ZN10MovePickerC2ERK8Position4Move5DepthRK5StatsI5ValueLb0EE6Square:
        push    rbx                                     ; 0460 _ 53
        sub     rsp, 48                                 ; 0461 _ 48: 83. EC, 30
        mov     rax, qword [rsp+60H]                    ; 0465 _ 48: 8B. 44 24, 60
        mov     rbx, rcx                                ; 046A _ 48: 89. CB
        mov     rcx, rdx                                ; 046D _ 48: 89. D1
        mov     qword [rbx], rdx                        ; 0470 _ 48: 89. 13
        lea     r11, [rbx+70H]                          ; 0473 _ 4C: 8D. 5B, 70
        lea     rdx, [rbx+868H]                         ; 0477 _ 48: 8D. 93, 00000868
        mov     qword [rbx+8H], rax                     ; 047E _ 48: 89. 43, 08
        mov     qword [rbx+68H], rdx                    ; 0482 _ 48: 89. 53, 68
        mov     qword [rbx+870H], r11                   ; 0486 _ 4C: 89. 9B, 00000870
        mov     qword [rbx+878H], r11                   ; 048D _ 4C: 89. 9B, 00000878
        mov     r10, qword [rcx+3B8H]                   ; 0494 _ 4C: 8B. 91, 000003B8
        cmp     qword [r10+38H], 0                      ; 049B _ 49: 83. 7A, 38, 00
        jnz     ?_044                                   ; 04A0 _ 75, 3E
        test    r9d, r9d                                ; 04A2 _ 45: 85. C9
        js      ?_043                                   ; 04A5 _ 78, 29
        mov     dword [rbx+5CH], 8                      ; 04A7 _ C7. 43, 5C, 00000008
?_040:  test    r8d, r8d                                ; 04AE _ 45: 85. C0
        jnz     ?_045                                   ; 04B1 _ 75, 36
?_041:  xor     r8d, r8d                                ; 04B3 _ 45: 31. C0
        xor     r9d, r9d                                ; 04B6 _ 45: 31. C9
?_042:  add     r11, r9                                 ; 04B9 _ 4D: 01. CB
        mov     dword [rbx+30H], r8d                    ; 04BC _ 44: 89. 43, 30
        mov     qword [rbx+878H], r11                   ; 04C0 _ 4C: 89. 9B, 00000878
        add     rsp, 48                                 ; 04C7 _ 48: 83. C4, 30
        pop     rbx                                     ; 04CB _ 5B
        ret                                             ; 04CC _ C3

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_043:  cmp     r9d, -4                                 ; 04D0 _ 41: 83. F9, FC
        jl      ?_046                                   ; 04D4 _ 7C, 38
        mov     dword [rbx+5CH], 11                     ; 04D6 _ C7. 43, 5C, 0000000B
        jmp     ?_040                                   ; 04DD _ EB, CF

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_044:  mov     dword [rbx+5CH], 6                      ; 04E0 _ C7. 43, 5C, 00000006
        jmp     ?_040                                   ; 04E7 _ EB, C5

?_045:  mov     edx, r8d                                ; 04E9 _ 44: 89. C2
        mov     dword [rsp+2CH], r8d                    ; 04EC _ 44: 89. 44 24, 2C
        call    _ZNK8Position12pseudo_legalE4Move       ; 04F1 _ E8, 00000000(rel)
        mov     r8d, dword [rsp+2CH]                    ; 04F6 _ 44: 8B. 44 24, 2C
        test    al, al                                  ; 04FB _ 84. C0
        mov     r11, qword [rbx+878H]                   ; 04FD _ 4C: 8B. 9B, 00000878
        jz      ?_041                                   ; 0504 _ 74, AD
        mov     r9d, 8                                  ; 0506 _ 41: B9, 00000008
        jmp     ?_042                                   ; 050C _ EB, AB

?_046:  mov     rcx, qword [rsp+68H]                    ; 050E _ 48: 8B. 4C 24, 68
; Warning: Label out of phase with instruction. Possibly spurious
; ?_047; Misplaced symbol at address 00000518
        mov     dword [rbx+5CH], 15                     ; 0513 _ C7. 43, 5C, 0000000F
        mov     qword [rbx+50H], rcx                    ; 051A _ 48: 89. 4B, 50
; Warning: Label out of phase with instruction. Possibly spurious
; ?_048; Misplaced symbol at address 0000051F
        jmp     ?_041                                   ; 051E _ EB, 93

_ZN10MovePicker19generate_next_stageEv:
        push    r13                                     ; 0520 _ 41: 55
        push    r12                                     ; 0522 _ 41: 54
        push    rbp                                     ; 0524 _ 55
        push    rdi                                     ; 0525 _ 57
        push    rsi                                     ; 0526 _ 56
        push    rbx                                     ; 0527 _ 53
        sub     rsp, 40                                 ; 0528 _ 48: 83. EC, 28
?_049:  mov     eax, dword [rcx+5CH]                    ; 052C _ 8B. 41, 5C
        lea     rbx, [rcx+70H]                          ; 052F _ 48: 8D. 59, 70
        add     eax, 1                                  ; 0533 _ 83. C0, 01
        cmp     eax, 17                                 ; 0536 _ 83. F8, 11
        mov     qword [rcx+870H], rbx                   ; 0539 _ 48: 89. 99, 00000870
        mov     dword [rcx+5CH], eax                    ; 0540 _ 89. 41, 5C
        ja      ?_050                                   ; 0543 _ 77, 22
        lea     rdx, [rel ?_101]                        ; 0545 _ 48: 8D. 15, 00000048(rel)
        mov     rsi, rcx                                ; 054C _ 48: 89. CE
        movsxd  rcx, dword [rdx+rax*4]                  ; 054F _ 48: 63. 0C 82
        add     rdx, rcx                                ; 0553 _ 48: 01. CA
        jmp     rdx                                     ; 0556 _ FF. E2

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
; Note: No jump seems to point here
        mov     dword [rsi+5CH], 17                     ; 0560 _ C7. 46, 5C, 00000011
?_050:  add     rsp, 40                                 ; 0567 _ 48: 83. C4, 28
        pop     rbx                                     ; 056B _ 5B
        pop     rsi                                     ; 056C _ 5E
        pop     rdi                                     ; 056D _ 5F
        pop     rbp                                     ; 056E _ 5D
        pop     r12                                     ; 056F _ 41: 5C
        pop     r13                                     ; 0571 _ 41: 5D
        ret                                             ; 0573 _ C3

; Note: No jump seems to point here
        mov     rcx, qword [rsi]                        ; 0574 _ 48: 8B. 0E
        mov     rdx, rbx                                ; 0577 _ 48: 89. DA
        call    _Z8generateIL7GenType0EEP7ExtMoveRK8PositionS2_; 057A _ E8, 00000000(rel)
        cmp     rbx, rax                                ; 057F _ 48: 39. C3
        mov     qword [rsi+878H], rax                   ; 0582 _ 48: 89. 86, 00000878
        jz      ?_050                                   ; 0589 _ 74, DC
        mov     rsi, qword [rsi]                        ; 058B _ 48: 8B. 36
        mov     r9, qword [rel .refptr.PieceValue]      ; 058E _ 4C: 8B. 0D, 00000000(rel)
; Warning: Label out of phase with instruction. Possibly spurious
; ?_051; Misplaced symbol at address 00000598
        mov     edi, dword [rsi+3ACH]                   ; 0595 _ 8B. BE, 000003AC
        lea     ebp, [rdi*8]                            ; 059B _ 8D. 2C FD, 00000000
        sub     ebp, edi                                ; 05A2 _ 29. FD
?_052:  mov     r8d, dword [rbx]                        ; 05A4 _ 44: 8B. 03
        add     rbx, 8                                  ; 05A7 _ 48: 83. C3, 08
        and     r8d, 3FH                                ; 05AB _ 41: 83. E0, 3F
        mov     edx, dword [rsi+r8*4]                   ; 05AF _ 42: 8B. 14 86
        shr     r8, 3                                   ; 05B3 _ 49: C1. E8, 03
; Warning: Label out of phase with instruction. Possibly spurious
; ?_053; Misplaced symbol at address 000005B8
        xor     r8d, ebp                                ; 05B7 _ 41: 31. E8
        imul    r13d, r8d, 200                          ; 05BA _ 45: 69. E8, 000000C8
        mov     r10d, dword [r9+rdx*4]                  ; 05C1 _ 45: 8B. 14 91
        sub     r10d, r13d                              ; 05C5 _ 45: 29. EA
        mov     dword [rbx-4H], r10d                    ; 05C8 _ 44: 89. 53, FC
        cmp     rax, rbx                                ; 05CC _ 48: 39. D8
        jnz     ?_052                                   ; 05CF _ 75, D3
        add     rsp, 40                                 ; 05D1 _ 48: 83. C4, 28
        pop     rbx                                     ; 05D5 _ 5B
        pop     rsi                                     ; 05D6 _ 5E
        pop     rdi                                     ; 05D7 _ 5F
        pop     rbp                                     ; 05D8 _ 5D
        pop     r12                                     ; 05D9 _ 41: 5C
        pop     r13                                     ; 05DB _ 41: 5D
        ret                                             ; 05DD _ C3

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
; Note: No jump seems to point here
        mov     rcx, qword [rsi]                        ; 05E0 _ 48: 8B. 0E
        mov     rdx, rbx                                ; 05E3 _ 48: 89. DA
        call    _Z8generateIL7GenType2EEP7ExtMoveRK8PositionS2_; 05E6 _ E8, 00000000(rel)
?_054:  mov     qword [rsi+878H], rax                   ; 05EB _ 48: 89. 86, 00000878
        jmp     ?_050                                   ; 05F2 _ E9, FFFFFF70

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
; Note: No jump seems to point here
        mov     rcx, qword [rsi]                        ; 0600 _ 48: 8B. 0E
        mov     rdx, rbx                                ; 0603 _ 48: 89. DA
        call    _Z8generateIL7GenType3EEP7ExtMoveRK8PositionS2_; 0606 _ E8, 00000000(rel)
        mov     qword [rsi+878H], rax                   ; 060B _ 48: 89. 86, 00000878
        sub     rax, rbx                                ; 0612 _ 48: 29. D8
        cmp     rax, 15                                 ; 0615 _ 48: 83. F8, 0F
        jle     ?_050                                   ; 0619 _ 0F 8E, FFFFFF48
        mov     rcx, rsi                                ; 061F _ 48: 89. F1
        add     rsp, 40                                 ; 0622 _ 48: 83. C4, 28
        pop     rbx                                     ; 0626 _ 5B
        pop     rsi                                     ; 0627 _ 5E
        pop     rdi                                     ; 0628 _ 5F
        pop     rbp                                     ; 0629 _ 5D
        pop     r12                                     ; 062A _ 41: 5C
        pop     r13                                     ; 062C _ 41: 5D
        jmp     _ZN10MovePicker5scoreIL7GenType3EEEvv   ; 062E _ E9, 0000031D

; Note: No jump seems to point here
        mov     rbp, qword [rsi+20H]                    ; 0633 _ 48: 8B. 6E, 20
; Warning: Label out of phase with instruction. Possibly spurious
; ?_055; Misplaced symbol at address 0000063A
        lea     r10, [rsi+34H]                          ; 0637 _ 4C: 8D. 56, 34
        mov     r13d, dword [rsi+28H]                   ; 063B _ 44: 8B. 6E, 28
        mov     r9d, dword [rbp+14H]                    ; 063F _ 44: 8B. 4D, 14
        mov     r8d, dword [rbp+18H]                    ; 0643 _ 44: 8B. 45, 18
        mov     dword [rsi+44H], r13d                   ; 0647 _ 44: 89. 6E, 44
        mov     qword [rsi+870H], r10                   ; 064B _ 4C: 89. 96, 00000870
        cmp     r9d, r13d                               ; 0652 _ 45: 39. E9
        mov     dword [rsi+34H], r9d                    ; 0655 _ 44: 89. 4E, 34
        setne   bl                                      ; 0659 _ 0F 95. C3
        cmp     r8d, r13d                               ; 065C _ 45: 39. E8
        mov     dword [rsi+3CH], r8d                    ; 065F _ 44: 89. 46, 3C
        setne   r12b                                    ; 0663 _ 41: 0F 95. C4
        movzx   ecx, r12b                               ; 0667 _ 41: 0F B6. CC
        and     rbx, rcx                                ; 066B _ 48: 21. CB
        add     rbx, 2                                  ; 066E _ 48: 83. C3, 02
        lea     r11, [r10+rbx*8]                        ; 0672 _ 4D: 8D. 1C DA
        mov     qword [rsi+878H], r11                   ; 0676 _ 4C: 89. 9E, 00000878
        jmp     ?_050                                   ; 067D _ E9, FFFFFEE5

; Note: No jump seems to point here
        mov     rcx, qword [rsi]                        ; 0682 _ 48: 8B. 0E
        mov     rdx, rbx                                ; 0685 _ 48: 89. DA
        call    _Z8generateIL7GenType1EEP7ExtMoveRK8PositionS2_; 0688 _ E8, 00000000(rel)
        cmp     rbx, rax                                ; 068D _ 48: 39. C3
        mov     qword [rsi+878H], rax                   ; 0690 _ 48: 89. 86, 00000878
        mov     qword [rsi+60H], rax                    ; 0697 _ 48: 89. 46, 60
        je      ?_057                                   ; 069B _ 0F 84, 00000124
        lea     rdx, [rsi+78H]                          ; 06A1 _ 48: 8D. 56, 78
        mov     r12, rax                                ; 06A5 _ 49: 89. C4
        mov     rdi, qword [rsi]                        ; 06A8 _ 48: 8B. 3E
        sub     r12, rdx                                ; 06AB _ 49: 29. D4
        mov     edx, dword [rbx]                        ; 06AE _ 8B. 13
        mov     r11, qword [rsi+18H]                    ; 06B0 _ 4C: 8B. 5E, 18
        shr     r12, 3                                  ; 06B4 _ 49: C1. EC, 03
        mov     r10, qword [rsi+10H]                    ; 06B8 _ 4C: 8B. 56, 10
        lea     rbp, [rbx+r12*8+8H]                     ; 06BC _ 4A: 8D. 6C E3, 08
        and     r12d, 01H                               ; 06C1 _ 41: 83. E4, 01
        mov     r9, qword [rsi+8H]                      ; 06C5 _ 4C: 8B. 4E, 08
        mov     ecx, edx                                ; 06C9 _ 89. D1
        and     edx, 3FH                                ; 06CB _ 83. E2, 3F
        sar     ecx, 6                                  ; 06CE _ C1. F9, 06
        shl     rdx, 2                                  ; 06D1 _ 48: C1. E2, 02
        and     ecx, 3FH                                ; 06D5 _ 83. E1, 3F
        mov     ecx, dword [rdi+rcx*4]                  ; 06D8 _ 8B. 0C 8F
        shl     rcx, 8                                  ; 06DB _ 48: C1. E1, 08
        lea     r8, [r11+rcx]                           ; 06DF _ 4D: 8D. 04 0B
        lea     r13, [r10+rcx]                          ; 06E3 _ 4D: 8D. 2C 0A
        add     rcx, r9                                 ; 06E7 _ 4C: 01. C9
        mov     ecx, dword [rcx+rdx]                    ; 06EA _ 8B. 0C 11
        add     ecx, dword [r13+rdx]                    ; 06ED _ 41: 03. 4C 15, 00
        add     ecx, dword [r8+rdx]                     ; 06F2 _ 41: 03. 0C 10
        lea     r8, [rbx+8H]                            ; 06F6 _ 4C: 8D. 43, 08
        cmp     r8, rbp                                 ; 06FA _ 49: 39. E8
        mov     dword [rbx+4H], ecx                     ; 06FD _ 89. 4B, 04
        je      ?_057                                   ; 0700 _ 0F 84, 000000BF
        test    r12, r12                                ; 0706 _ 4D: 85. E4
        jz      ?_056                                   ; 0709 _ 74, 45
        mov     edx, dword [r8]                         ; 070B _ 41: 8B. 10
        mov     r12d, edx                               ; 070E _ 41: 89. D4
        and     edx, 3FH                                ; 0711 _ 83. E2, 3F
        sar     r12d, 6                                 ; 0714 _ 41: C1. FC, 06
        shl     rdx, 2                                  ; 0718 _ 48: C1. E2, 02
        and     r12d, 3FH                               ; 071C _ 41: 83. E4, 3F
        mov     ecx, dword [rdi+r12*4]                  ; 0720 _ 42: 8B. 0C A7
        shl     rcx, 8                                  ; 0724 _ 48: C1. E1, 08
        lea     r12, [r11+rcx]                          ; 0728 _ 4D: 8D. 24 0B
        lea     r13, [r10+rcx]                          ; 072C _ 4D: 8D. 2C 0A
        add     rcx, r9                                 ; 0730 _ 4C: 01. C9
        mov     ecx, dword [rcx+rdx]                    ; 0733 _ 8B. 0C 11
        add     ecx, dword [r13+rdx]                    ; 0736 _ 41: 03. 4C 15, 00
        add     ecx, dword [r12+rdx]                    ; 073B _ 41: 03. 0C 14
        mov     dword [r8+4H], ecx                      ; 073F _ 41: 89. 48, 04
        lea     r8, [rbx+10H]                           ; 0743 _ 4C: 8D. 43, 10
        cmp     r8, rbp                                 ; 0747 _ 49: 39. E8
        jz      ?_057                                   ; 074A _ 74, 79
; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_056:  mov     r13d, dword [r8]                        ; 0750 _ 45: 8B. 28
        add     r8, 16                                  ; 0753 _ 49: 83. C0, 10
        mov     ebx, r13d                               ; 0757 _ 44: 89. EB
        and     r13d, 3FH                               ; 075A _ 41: 83. E5, 3F
        sar     ebx, 6                                  ; 075E _ C1. FB, 06
        shl     r13, 2                                  ; 0761 _ 49: C1. E5, 02
        and     ebx, 3FH                                ; 0765 _ 83. E3, 3F
        mov     ecx, dword [rdi+rbx*4]                  ; 0768 _ 8B. 0C 9F
        shl     rcx, 8                                  ; 076B _ 48: C1. E1, 08
        lea     rdx, [r11+rcx]                          ; 076F _ 49: 8D. 14 0B
        lea     r12, [r10+rcx]                          ; 0773 _ 4D: 8D. 24 0A
        add     rcx, r9                                 ; 0777 _ 4C: 01. C9
        mov     ebx, dword [rcx+r13]                    ; 077A _ 42: 8B. 1C 29
        add     ebx, dword [r12+r13]                    ; 077E _ 43: 03. 1C 2C
        add     ebx, dword [rdx+r13]                    ; 0782 _ 42: 03. 1C 2A
        mov     edx, dword [r8-8H]                      ; 0786 _ 41: 8B. 50, F8
        mov     dword [r8-0CH], ebx                     ; 078A _ 41: 89. 58, F4
        mov     ecx, edx                                ; 078E _ 89. D1
        and     edx, 3FH                                ; 0790 _ 83. E2, 3F
        sar     ecx, 6                                  ; 0793 _ C1. F9, 06
        shl     rdx, 2                                  ; 0796 _ 48: C1. E2, 02
        and     ecx, 3FH                                ; 079A _ 83. E1, 3F
        mov     r13d, dword [rdi+rcx*4]                 ; 079D _ 44: 8B. 2C 8F
        shl     r13, 8                                  ; 07A1 _ 49: C1. E5, 08
        lea     rbx, [r11+r13]                          ; 07A5 _ 4B: 8D. 1C 2B
        lea     r12, [r10+r13]                          ; 07A9 _ 4F: 8D. 24 2A
        add     r13, r9                                 ; 07AD _ 4D: 01. CD
        mov     ecx, dword [r13+rdx]                    ; 07B0 _ 41: 8B. 4C 15, 00
        add     ecx, dword [r12+rdx]                    ; 07B5 _ 41: 03. 0C 14
        add     ecx, dword [rbx+rdx]                    ; 07B9 _ 03. 0C 13
        mov     dword [r8-4H], ecx                      ; 07BC _ 41: 89. 48, FC
        cmp     r8, rbp                                 ; 07C0 _ 49: 39. E8
        jnz     ?_056                                   ; 07C3 _ 75, 8B
?_057:  mov     r9, qword [rsi+870H]                    ; 07C5 _ 4C: 8B. 8E, 00000870
        lea     rcx, [r9+8H]                            ; 07CC _ 49: 8D. 49, 08
        cmp     rax, r9                                 ; 07D0 _ 4C: 39. C8
        mov     rdi, rcx                                ; 07D3 _ 48: 89. CF
        je      ?_071                                   ; 07D6 _ 0F 84, 00000152
; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_058:  mov     r8d, dword [rdi-4H]                     ; 07E0 _ 44: 8B. 47, FC
        lea     r12, [rdi-8H]                           ; 07E4 _ 4C: 8D. 67, F8
        mov     rbp, rdi                                ; 07E8 _ 48: 89. FD
        test    r8d, r8d                                ; 07EB _ 45: 85. C0
        jg      ?_061                                   ; 07EE _ 7F, 37
        lea     r11, [rax-8H]                           ; 07F0 _ 4C: 8D. 58, F8
        cmp     r11, r12                                ; 07F4 _ 4D: 39. E3
        jz      ?_062                                   ; 07F7 _ 74, 3A
        mov     eax, dword [rax-4H]                     ; 07F9 _ 8B. 40, FC
        test    eax, eax                                ; 07FC _ 85. C0
        mov     rax, r11                                ; 07FE _ 4C: 89. D8
        jg      ?_060                                   ; 0801 _ 7F, 12
?_059:  sub     rax, 8                                  ; 0803 _ 48: 83. E8, 08
        cmp     rax, r12                                ; 0807 _ 4C: 39. E0
        jz      ?_062                                   ; 080A _ 74, 27
        mov     r13d, dword [rax+4H]                    ; 080C _ 44: 8B. 68, 04
        test    r13d, r13d                              ; 0810 _ 45: 85. ED
        jle     ?_059                                   ; 0813 _ 7E, EE
?_060:  mov     r10d, dword [rdi-8H]                    ; 0815 _ 44: 8B. 57, F8
        mov     rbx, qword [rax]                        ; 0819 _ 48: 8B. 18
        mov     qword [rdi-8H], rbx                     ; 081C _ 48: 89. 5F, F8
        mov     dword [rax], r10d                       ; 0820 _ 44: 89. 10
        mov     dword [rax+4H], r8d                     ; 0823 _ 44: 89. 40, 04
?_061:  add     rdi, 8                                  ; 0827 _ 48: 83. C7, 08
        cmp     rbp, rax                                ; 082B _ 48: 39. C5
        jnz     ?_058                                   ; 082E _ 75, B0
        mov     r12, rbp                                ; 0830 _ 49: 89. EC
?_062:  cmp     r12, rcx                                ; 0833 _ 49: 39. CC
        mov     qword [rsi+878H], r12                   ; 0836 _ 4C: 89. A6, 00000878
        jbe     ?_050                                   ; 083D _ 0F 86, FFFFFD24
?_063:  cmp     r9, rcx                                 ; 0843 _ 49: 39. C9
; Warning: Label out of phase with instruction. Possibly spurious
; ?_064; Misplaced symbol at address 00000848
        mov     r11d, dword [rcx]                       ; 0846 _ 44: 8B. 19
        mov     edi, dword [rcx+4H]                     ; 0849 _ 8B. 79, 04
        je      ?_072                                   ; 084C _ 0F 84, 000000E8
        cmp     dword [rcx-4H], edi                     ; 0852 _ 39. 79, FC
        mov     rax, rcx                                ; 0855 _ 48: 89. C8
        jge     ?_066                                   ; 0858 _ 7D, 1C
; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_065:  mov     rdx, qword [rax-8H]                     ; 0860 _ 48: 8B. 50, F8
        sub     rax, 8                                  ; 0864 _ 48: 83. E8, 08
        mov     qword [rax+8H], rdx                     ; 0868 _ 48: 89. 50, 08
        cmp     r9, rax                                 ; 086C _ 49: 39. C1
        jz      ?_066                                   ; 086F _ 74, 05
        cmp     edi, dword [rax-4H]                     ; 0871 _ 3B. 78, FC
        jg      ?_065                                   ; 0874 _ 7F, EA
?_066:  add     rcx, 8                                  ; 0876 _ 48: 83. C1, 08
        mov     dword [rax], r11d                       ; 087A _ 44: 89. 18
        cmp     r12, rcx                                ; 087D _ 49: 39. CC
        mov     dword [rax+4H], edi                     ; 0880 _ 89. 78, 04
        ja      ?_063                                   ; 0883 _ 77, BE
        jmp     ?_050                                   ; 0885 _ E9, FFFFFCDD

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
; Note: No jump seems to point here
        mov     r9, qword [rsi+878H]                    ; 0890 _ 4C: 8B. 8E, 00000878
        mov     r11, qword [rsi+60H]                    ; 0897 _ 4C: 8B. 5E, 60
        cmp     dword [rsi+2CH], 2                      ; 089B _ 83. 7E, 2C, 02
        mov     qword [rsi+870H], r9                    ; 089F _ 4C: 89. 8E, 00000870
        mov     qword [rsi+878H], r11                   ; 08A6 _ 4C: 89. 9E, 00000878
        jle     ?_050                                   ; 08AD _ 0F 8E, FFFFFCB4
        lea     r8, [r9+8H]                             ; 08B3 _ 4D: 8D. 41, 08
        cmp     r8, r11                                 ; 08B7 _ 4D: 39. D8
        jnc     ?_050                                   ; 08BA _ 0F 83, FFFFFCA7
?_067:  cmp     r9, r8                                  ; 08C0 _ 4D: 39. C1
        mov     r10d, dword [r8]                        ; 08C3 _ 45: 8B. 10
; Warning: Label out of phase with instruction. Possibly spurious
; ?_068; Misplaced symbol at address 000008C8
        mov     esi, dword [r8+4H]                      ; 08C6 _ 41: 8B. 70, 04
        jz      ?_073                                   ; 08CA _ 74, 76
        cmp     esi, dword [r8-4H]                      ; 08CC _ 41: 3B. 70, FC
        mov     r12, r8                                 ; 08D0 _ 4D: 89. C4
        jle     ?_070                                   ; 08D3 _ 7E, 1A
?_069:  mov     r13, qword [r12-8H]                     ; 08D5 _ 4D: 8B. 6C 24, F8
        sub     r12, 8                                  ; 08DA _ 49: 83. EC, 08
        mov     qword [r12+8H], r13                     ; 08DE _ 4D: 89. 6C 24, 08
        cmp     r9, r12                                 ; 08E3 _ 4D: 39. E1
        jz      ?_070                                   ; 08E6 _ 74, 07
        cmp     esi, dword [r12-4H]                     ; 08E8 _ 41: 3B. 74 24, FC
        jg      ?_069                                   ; 08ED _ 7F, E6
?_070:  add     r8, 8                                   ; 08EF _ 49: 83. C0, 08
        mov     dword [r12], r10d                       ; 08F3 _ 45: 89. 14 24
        cmp     r11, r8                                 ; 08F7 _ 4D: 39. C3
        mov     dword [r12+4H], esi                     ; 08FA _ 41: 89. 74 24, 04
        ja      ?_067                                   ; 08FF _ 77, BF
        jmp     ?_050                                   ; 0901 _ E9, FFFFFC61

; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16
; Note: No jump seems to point here
        mov     rbp, qword [rsi+68H]                    ; 0910 _ 48: 8B. 6E, 68
        lea     rdi, [rsi+868H]                         ; 0914 _ 48: 8D. BE, 00000868
        mov     qword [rsi+870H], rdi                   ; 091B _ 48: 89. BE, 00000870
        mov     qword [rsi+878H], rbp                   ; 0922 _ 48: 89. AE, 00000878
        jmp     ?_050                                   ; 0929 _ E9, FFFFFC39

?_071:  lea     rcx, [r9+8H]                            ; 092E _ 49: 8D. 49, 08
        mov     r12, r9                                 ; 0932 _ 4D: 89. CC
        jmp     ?_062                                   ; 0935 _ E9, FFFFFEF9

?_072:  mov     rax, r9                                 ; 093A _ 4C: 89. C8
        jmp     ?_066                                   ; 093D _ E9, FFFFFF34
; _ZN10MovePicker9next_moveEv End of function

?_073:  ; Local function
        mov     r12, r9                                 ; 0942 _ 4D: 89. CC
        jmp     ?_070                                   ; 0945 _ EB, A8

        nop                                             ; 0947 _ 90
; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZN10MovePicker5scoreIL7GenType3EEEvv:; Function begin
        push    rbp                                     ; 0950 _ 55
        push    rdi                                     ; 0951 _ 57
        push    rsi                                     ; 0952 _ 56
        push    rbx                                     ; 0953 _ 53
        sub     rsp, 40                                 ; 0954 _ 48: 83. EC, 28
        mov     rdi, qword [rcx+878H]                   ; 0958 _ 48: 8B. B9, 00000878
        lea     rbx, [rcx+70H]                          ; 095F _ 48: 8D. 59, 70
        cmp     rdi, rbx                                ; 0963 _ 48: 39. DF
        je      ?_083                                   ; 0966 _ 0F 84, 000001BA
        mov     rsi, rcx                                ; 096C _ 48: 89. CE
        mov     edx, dword [rbx]                        ; 096F _ 8B. 13
        mov     rbp, rdi                                ; 0971 _ 48: 89. FD
        mov     rcx, qword [rcx]                        ; 0974 _ 48: 8B. 09
        sub     rbp, rbx                                ; 0977 _ 48: 29. DD
        sub     rbp, 8                                  ; 097A _ 48: 83. ED, 08
        shr     rbp, 3                                  ; 097E _ 48: C1. ED, 03
        and     ebp, 01H                                ; 0982 _ 83. E5, 01
        call    _ZNK8Position8see_signE4Move            ; 0985 _ E8, 00000000(rel)
        test    eax, eax                                ; 098A _ 85. C0
        js      ?_094                                   ; 098C _ 0F 88, 000002B9
        mov     eax, dword [rbx]                        ; 0992 _ 8B. 03
        mov     rcx, qword [rsi]                        ; 0994 _ 48: 8B. 0E
        mov     edx, eax                                ; 0997 _ 89. C2
        and     edx, 3FH                                ; 0999 _ 83. E2, 3F
        mov     r8d, dword [rcx+rdx*4]                  ; 099C _ 44: 8B. 04 91
        test    r8d, r8d                                ; 09A0 _ 45: 85. C0
        jne     ?_088                                   ; 09A3 _ 0F 85, 00000207
        mov     r9d, eax                                ; 09A9 _ 41: 89. C1
        and     r9d, 0C000H                             ; 09AC _ 41: 81. E1, 0000C000
        cmp     r9d, 32768                              ; 09B3 _ 41: 81. F9, 00008000
        je      ?_089                                   ; 09BA _ 0F 84, 00000207
?_074:  sar     eax, 6                                  ; 09C0 _ C1. F8, 06
        and     eax, 3FH                                ; 09C3 _ 83. E0, 3F
        mov     r11d, dword [rcx+rax*4]                 ; 09C6 _ 44: 8B. 1C 81
        mov     rcx, qword [rsi+8H]                     ; 09CA _ 48: 8B. 4E, 08
        shl     r11, 8                                  ; 09CE _ 49: C1. E3, 08
        lea     rax, [rcx+rdx*4]                        ; 09D2 _ 48: 8D. 04 91
        mov     edx, dword [rax+r11]                    ; 09D6 _ 42: 8B. 14 18
        mov     dword [rbx+4H], edx                     ; 09DA _ 89. 53, 04
?_075:  add     rbx, 8                                  ; 09DD _ 48: 83. C3, 08
        cmp     rdi, rbx                                ; 09E1 _ 48: 39. DF
        je      ?_083                                   ; 09E4 _ 0F 84, 0000013C
        test    rbp, rbp                                ; 09EA _ 48: 85. ED
        jz      ?_078                                   ; 09ED _ 74, 64
        mov     edx, dword [rbx]                        ; 09EF _ 8B. 13
        mov     rcx, qword [rsi]                        ; 09F1 _ 48: 8B. 0E
        call    _ZNK8Position8see_signE4Move            ; 09F4 _ E8, 00000000(rel)
        test    eax, eax                                ; 09F9 _ 85. C0
        js      ?_095                                   ; 09FB _ 0F 88, 00000257
        mov     ecx, dword [rbx]                        ; 0A01 _ 8B. 0B
        mov     r11, qword [rsi]                        ; 0A03 _ 4C: 8B. 1E
        mov     edx, ecx                                ; 0A06 _ 89. CA
        and     edx, 3FH                                ; 0A08 _ 83. E2, 3F
        mov     ebp, dword [r11+rdx*4]                  ; 0A0B _ 41: 8B. 2C 93
        test    ebp, ebp                                ; 0A0F _ 85. ED
        jne     ?_092                                   ; 0A11 _ 0F 85, 000001F6
        mov     eax, ecx                                ; 0A17 _ 89. C8
        and     eax, 0C000H                             ; 0A19 _ 25, 0000C000
        cmp     eax, 32768                              ; 0A1E _ 3D, 00008000
        je      ?_093                                   ; 0A23 _ 0F 84, 000001FB
?_076:  sar     ecx, 6                                  ; 0A29 _ C1. F9, 06
        mov     r8, qword [rsi+8H]                      ; 0A2C _ 4C: 8B. 46, 08
        and     ecx, 3FH                                ; 0A30 _ 83. E1, 3F
        mov     r10d, dword [r11+rcx*4]                 ; 0A33 _ 45: 8B. 14 8B
        lea     r11, [r8+rdx*4]                         ; 0A37 _ 4D: 8D. 1C 90
        shl     r10, 8                                  ; 0A3B _ 49: C1. E2, 08
        mov     ecx, dword [r11+r10]                    ; 0A3F _ 43: 8B. 0C 13
        mov     dword [rbx+4H], ecx                     ; 0A43 _ 89. 4B, 04
?_077:  add     rbx, 8                                  ; 0A46 _ 48: 83. C3, 08
        cmp     rdi, rbx                                ; 0A4A _ 48: 39. DF
        je      ?_083                                   ; 0A4D _ 0F 84, 000000D3
?_078:  mov     edx, dword [rbx]                        ; 0A53 _ 8B. 13
        mov     rcx, qword [rsi]                        ; 0A55 _ 48: 8B. 0E
        call    _ZNK8Position8see_signE4Move            ; 0A58 _ E8, 00000000(rel)
        test    eax, eax                                ; 0A5D _ 85. C0
        js      ?_091                                   ; 0A5F _ 0F 88, 0000019B
        mov     r11d, dword [rbx]                       ; 0A65 _ 44: 8B. 1B
        mov     r10, qword [rsi]                        ; 0A68 _ 4C: 8B. 16
        mov     ecx, r11d                               ; 0A6B _ 44: 89. D9
        mov     r9d, r11d                               ; 0A6E _ 45: 89. D9
        and     ecx, 3FH                                ; 0A71 _ 83. E1, 3F
        and     r9d, 0C000H                             ; 0A74 _ 41: 81. E1, 0000C000
        mov     r8d, dword [r10+rcx*4]                  ; 0A7B _ 45: 8B. 04 8A
        test    r8d, r8d                                ; 0A7F _ 45: 85. C0
        jne     ?_084                                   ; 0A82 _ 0F 85, 000000A8
        cmp     r9d, 32768                              ; 0A88 _ 41: 81. F9, 00008000
        je      ?_085                                   ; 0A8F _ 0F 84, 000000A8
?_079:  sar     r11d, 6                                 ; 0A95 _ 41: C1. FB, 06
        mov     rdx, qword [rsi+8H]                     ; 0A99 _ 48: 8B. 56, 08
        and     r11d, 3FH                               ; 0A9D _ 41: 83. E3, 3F
        mov     eax, dword [r10+r11*4]                  ; 0AA1 _ 43: 8B. 04 9A
        lea     rbp, [rdx+rcx*4]                        ; 0AA5 _ 48: 8D. 2C 8A
        shl     rax, 8                                  ; 0AA9 _ 48: C1. E0, 08
        mov     r10d, dword [rbp+rax]                   ; 0AAD _ 44: 8B. 54 05, 00
        mov     dword [rbx+4H], r10d                    ; 0AB2 _ 44: 89. 53, 04
?_080:  mov     edx, dword [rbx+8H]                     ; 0AB6 _ 8B. 53, 08
        lea     rbp, [rbx+8H]                           ; 0AB9 _ 48: 8D. 6B, 08
        mov     rcx, qword [rsi]                        ; 0ABD _ 48: 8B. 0E
        call    _ZNK8Position8see_signE4Move            ; 0AC0 _ E8, 00000000(rel)
        test    eax, eax                                ; 0AC5 _ 85. C0
        js      ?_090                                   ; 0AC7 _ 0F 88, 00000126
        mov     ebx, dword [rbx+8H]                     ; 0ACD _ 8B. 5B, 08
        mov     r10, qword [rsi]                        ; 0AD0 _ 4C: 8B. 16
        mov     edx, ebx                                ; 0AD3 _ 89. DA
        and     edx, 3FH                                ; 0AD5 _ 83. E2, 3F
        mov     r11d, dword [r10+rdx*4]                 ; 0AD8 _ 45: 8B. 1C 92
        test    r11d, r11d                              ; 0ADC _ 45: 85. DB
        jne     ?_086                                   ; 0ADF _ 0F 85, 0000008B
        mov     r9d, ebx                                ; 0AE5 _ 41: 89. D9
        and     r9d, 0C000H                             ; 0AE8 _ 41: 81. E1, 0000C000
        cmp     r9d, 32768                              ; 0AEF _ 41: 81. F9, 00008000
        je      ?_087                                   ; 0AF6 _ 0F 84, 00000086
?_081:  sar     ebx, 6                                  ; 0AFC _ C1. FB, 06
        mov     rcx, qword [rsi+8H]                     ; 0AFF _ 48: 8B. 4E, 08
        and     ebx, 3FH                                ; 0B03 _ 83. E3, 3F
        mov     r8d, dword [r10+rbx*4]                  ; 0B06 _ 45: 8B. 04 9A
        lea     r10, [rcx+rdx*4]                        ; 0B0A _ 4C: 8D. 14 91
        shl     r8, 8                                   ; 0B0E _ 49: C1. E0, 08
        mov     ebx, dword [r10+r8]                     ; 0B12 _ 43: 8B. 1C 02
        mov     dword [rbp+4H], ebx                     ; 0B16 _ 89. 5D, 04
?_082:  lea     rbx, [rbp+8H]                           ; 0B19 _ 48: 8D. 5D, 08
        cmp     rdi, rbx                                ; 0B1D _ 48: 39. DF
        jne     ?_078                                   ; 0B20 _ 0F 85, FFFFFF2D
?_083:  add     rsp, 40                                 ; 0B26 _ 48: 83. C4, 28
        pop     rbx                                     ; 0B2A _ 5B
        pop     rsi                                     ; 0B2B _ 5E
        pop     rdi                                     ; 0B2C _ 5F
        pop     rbp                                     ; 0B2D _ 5D
        ret                                             ; 0B2E _ C3

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_084:  cmp     r9d, 49152                              ; 0B30 _ 41: 81. F9, 0000C000
        je      ?_079                                   ; 0B37 _ 0F 84, FFFFFF58
?_085:  mov     rcx, qword [rel .refptr.PieceValue]     ; 0B3D _ 48: 8B. 0D, 00000000(rel)
        sar     r11d, 6                                 ; 0B44 _ 41: C1. FB, 06
        and     r11d, 3FH                               ; 0B48 _ 41: 83. E3, 3F
        mov     r11d, dword [r10+r11*4]                 ; 0B4C _ 47: 8B. 1C 9A
        mov     r8d, dword [rcx+r8*4]                   ; 0B50 _ 46: 8B. 04 81
        and     r11d, 07H                               ; 0B54 _ 41: 83. E3, 07
        sub     r8d, r11d                               ; 0B58 _ 45: 29. D8
        add     r8d, 268435456                          ; 0B5B _ 41: 81. C0, 10000000
        mov     dword [rbx+4H], r8d                     ; 0B62 _ 44: 89. 43, 04
        jmp     ?_080                                   ; 0B66 _ E9, FFFFFF4B

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_086:  mov     eax, ebx                                ; 0B70 _ 89. D8
        and     eax, 0C000H                             ; 0B72 _ 25, 0000C000
        cmp     eax, 49152                              ; 0B77 _ 3D, 0000C000
        je      ?_081                                   ; 0B7C _ 0F 84, FFFFFF7A
?_087:  mov     r9, qword [rel .refptr.PieceValue]      ; 0B82 _ 4C: 8B. 0D, 00000000(rel)
        sar     ebx, 6                                  ; 0B89 _ C1. FB, 06
        and     ebx, 3FH                                ; 0B8C _ 83. E3, 3F
        mov     edx, dword [r10+rbx*4]                  ; 0B8F _ 41: 8B. 14 9A
        mov     r11d, dword [r9+r11*4]                  ; 0B93 _ 47: 8B. 1C 99
        and     edx, 07H                                ; 0B97 _ 83. E2, 07
        sub     r11d, edx                               ; 0B9A _ 41: 29. D3
        add     r11d, 268435456                         ; 0B9D _ 41: 81. C3, 10000000
        mov     dword [rbp+4H], r11d                    ; 0BA4 _ 44: 89. 5D, 04
        jmp     ?_082                                   ; 0BA8 _ E9, FFFFFF6C

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_088:  mov     r10d, eax                               ; 0BB0 _ 41: 89. C2
        and     r10d, 0C000H                            ; 0BB3 _ 41: 81. E2, 0000C000
        cmp     r10d, 49152                             ; 0BBA _ 41: 81. FA, 0000C000
        je      ?_074                                   ; 0BC1 _ 0F 84, FFFFFDF9
?_089:  mov     r10, qword [rel .refptr.PieceValue]     ; 0BC7 _ 4C: 8B. 15, 00000000(rel)
        sar     eax, 6                                  ; 0BCE _ C1. F8, 06
        and     eax, 3FH                                ; 0BD1 _ 83. E0, 3F
        mov     r9d, dword [rcx+rax*4]                  ; 0BD4 _ 44: 8B. 0C 81
        mov     r8d, dword [r10+r8*4]                   ; 0BD8 _ 47: 8B. 04 82
        and     r9d, 07H                                ; 0BDC _ 41: 83. E1, 07
        sub     r8d, r9d                                ; 0BE0 _ 45: 29. C8
        add     r8d, 268435456                          ; 0BE3 _ 41: 81. C0, 10000000
        mov     dword [rbx+4H], r8d                     ; 0BEA _ 44: 89. 43, 04
        jmp     ?_075                                   ; 0BEE _ E9, FFFFFDEA

?_090:  sub     eax, 268435456                          ; 0BF3 _ 2D, 10000000
        mov     dword [rbp+4H], eax                     ; 0BF8 _ 89. 45, 04
        jmp     ?_082                                   ; 0BFB _ E9, FFFFFF19

?_091:  sub     eax, 268435456                          ; 0C00 _ 2D, 10000000
        mov     dword [rbx+4H], eax                     ; 0C05 _ 89. 43, 04
        jmp     ?_080                                   ; 0C08 _ E9, FFFFFEA9

?_092:  mov     r9d, ecx                                ; 0C0D _ 41: 89. C9
        and     r9d, 0C000H                             ; 0C10 _ 41: 81. E1, 0000C000
        cmp     r9d, 49152                              ; 0C17 _ 41: 81. F9, 0000C000
        je      ?_076                                   ; 0C1E _ 0F 84, FFFFFE05
?_093:  mov     rax, qword [rel .refptr.PieceValue]     ; 0C24 _ 48: 8B. 05, 00000000(rel)
        sar     ecx, 6                                  ; 0C2B _ C1. F9, 06
        and     ecx, 3FH                                ; 0C2E _ 83. E1, 3F
        mov     edx, dword [r11+rcx*4]                  ; 0C31 _ 41: 8B. 14 8B
        mov     ebp, dword [rax+rbp*4]                  ; 0C35 _ 8B. 2C A8
        and     edx, 07H                                ; 0C38 _ 83. E2, 07
        sub     ebp, edx                                ; 0C3B _ 29. D5
        add     ebp, 268435456                          ; 0C3D _ 81. C5, 10000000
        mov     dword [rbx+4H], ebp                     ; 0C43 _ 89. 6B, 04
        jmp     ?_077                                   ; 0C46 _ E9, FFFFFDFB

?_094:  sub     eax, 268435456                          ; 0C4B _ 2D, 10000000
        mov     dword [rbx+4H], eax                     ; 0C50 _ 89. 43, 04
        jmp     ?_075                                   ; 0C53 _ E9, FFFFFD85
; _ZN10MovePicker5scoreIL7GenType3EEEvv End of function

?_095:  ; Local function
        sub     eax, 268435456                          ; 0C58 _ 2D, 10000000
        mov     dword [rbx+4H], eax                     ; 0C5D _ 89. 43, 04
        jmp     ?_077                                   ; 0C60 _ E9, FFFFFDE1

        nop                                             ; 0C65 _ 90
; Filling space: 0AH
; Filler type: Multi-byte NOP
;       db 66H, 2EH, 0FH, 1FH, 84H, 00H, 00H, 00H
;       db 00H, 00H

ALIGN   16

_ZN10MovePickerC1ERK8Position4MoveRK5StatsI5ValueLb0EES5_:; Function begin

_ZN10MovePickerC2ERK8Position4MoveRK5StatsI5ValueLb0EES5_:
        push    rsi                                     ; 0C70 _ 56
        push    rbx                                     ; 0C71 _ 53
        sub     rsp, 40                                 ; 0C72 _ 48: 83. EC, 28
        mov     eax, dword [rsp+60H]                    ; 0C76 _ 8B. 44 24, 60
        mov     rbx, rcx                                ; 0C7A _ 48: 89. CB
        mov     esi, r8d                                ; 0C7D _ 44: 89. C6
        mov     rcx, rdx                                ; 0C80 _ 48: 89. D1
        lea     r8, [rbx+70H]                           ; 0C83 _ 4C: 8D. 43, 70
        mov     qword [rbx], rdx                        ; 0C87 _ 48: 89. 13
        test    esi, esi                                ; 0C8A _ 85. F6
        lea     rdx, [rbx+868H]                         ; 0C8C _ 48: 8D. 93, 00000868
        mov     qword [rbx+8H], r9                      ; 0C93 _ 4C: 89. 4B, 08
        mov     dword [rbx+58H], eax                    ; 0C97 _ 89. 43, 58
        mov     qword [rbx+68H], rdx                    ; 0C9A _ 48: 89. 53, 68
        mov     qword [rbx+870H], r8                    ; 0C9E _ 4C: 89. 83, 00000870
        mov     qword [rbx+878H], r8                    ; 0CA5 _ 4C: 89. 83, 00000878
        mov     dword [rbx+5CH], 13                     ; 0CAC _ C7. 43, 5C, 0000000D
        jz      ?_099                                   ; 0CB3 _ 74, 6D
        mov     edx, esi                                ; 0CB5 _ 89. F2
        call    _ZNK8Position12pseudo_legalE4Move       ; 0CB7 _ E8, 00000000(rel)
        test    al, al                                  ; 0CBC _ 84. C0
        jz      ?_099                                   ; 0CBE _ 74, 62
        mov     rcx, qword [rbx]                        ; 0CC0 _ 48: 8B. 0B
        mov     r9d, esi                                ; 0CC3 _ 41: 89. F1
        mov     r11d, esi                               ; 0CC6 _ 41: 89. F3
        and     r9d, 3FH                                ; 0CC9 _ 41: 83. E1, 3F
        mov     r10d, dword [rcx+r9*4]                  ; 0CCD _ 46: 8B. 14 89
        test    r10d, r10d                              ; 0CD1 _ 45: 85. D2
        jz      ?_098                                   ; 0CD4 _ 74, 3C
        and     r11d, 0C000H                            ; 0CD6 _ 41: 81. E3, 0000C000
        cmp     r11d, 49152                             ; 0CDD _ 41: 81. FB, 0000C000
        jz      ?_099                                   ; 0CE4 _ 74, 3C
?_096:  mov     edx, esi                                ; 0CE6 _ 89. F2
        call    _ZNK8Position3seeE4Move                 ; 0CE8 _ E8, 00000000(rel)
        cmp     eax, dword [rbx+58H]                    ; 0CED _ 3B. 43, 58
        jle     ?_099                                   ; 0CF0 _ 7E, 30
        mov     rcx, qword [rbx+878H]                   ; 0CF2 _ 48: 8B. 8B, 00000878
        mov     dword [rbx+30H], esi                    ; 0CF9 _ 89. 73, 30
        mov     esi, 8                                  ; 0CFC _ BE, 00000008
?_097:  add     rsi, rcx                                ; 0D01 _ 48: 01. CE
        mov     qword [rbx+878H], rsi                   ; 0D04 _ 48: 89. B3, 00000878
        add     rsp, 40                                 ; 0D0B _ 48: 83. C4, 28
        pop     rbx                                     ; 0D0F _ 5B
        pop     rsi                                     ; 0D10 _ 5E
        ret                                             ; 0D11 _ C3

?_098:  and     r11d, 0C000H                            ; 0D12 _ 41: 81. E3, 0000C000
        cmp     r11d, 32768                             ; 0D19 _ 41: 81. FB, 00008000
        jz      ?_096                                   ; 0D20 _ 74, C4
?_099:  mov     dword [rbx+30H], 0                      ; 0D22 _ C7. 43, 30, 00000000
        mov     rcx, qword [rbx+878H]                   ; 0D29 _ 48: 8B. 8B, 00000878
        xor     esi, esi                                ; 0D30 _ 31. F6
        jmp     ?_097                                   ; 0D32 _ EB, CD
; _ZN10MovePickerC1ERK8Position4MoveRK5StatsI5ValueLb0EES5_ End of function

        nop                                             ; 0D34 _ 90
        nop                                             ; 0D35 _ 90
        nop                                             ; 0D36 _ 90
        nop                                             ; 0D37 _ 90
        nop                                             ; 0D38 _ 90
        nop                                             ; 0D39 _ 90
        nop                                             ; 0D3A _ 90
        nop                                             ; 0D3B _ 90
        nop                                             ; 0D3C _ 90
        nop                                             ; 0D3D _ 90
        nop                                             ; 0D3E _ 90
        nop                                             ; 0D3F _ 90


SECTION .xdata.hot align=4 noexecute                    ; section number 6, const

        db 01H, 05H, 02H, 00H, 05H, 52H, 01H, 30H       ; 0000 _ .....R.0
        db 01H, 07H, 04H, 00H, 07H, 32H, 03H, 30H       ; 0008 _ .....2.0
        db 02H, 60H, 01H, 70H, 01H, 05H, 02H, 00H       ; 0010 _ .`.p....
        db 05H, 52H, 01H, 30H, 01H, 0CH, 07H, 00H       ; 0018 _ .R.0....
        db 0CH, 42H, 08H, 30H, 07H, 60H, 06H, 70H       ; 0020 _ .B.0.`.p
        db 05H, 50H, 04H, 0C0H, 02H, 0D0H, 00H, 00H     ; 0028 _ .P......
        db 01H, 08H, 05H, 00H, 08H, 42H, 04H, 30H       ; 0030 _ .....B.0
        db 03H, 60H, 02H, 70H, 01H, 50H, 00H, 00H       ; 0038 _ .`.p.P..
        db 01H, 06H, 03H, 00H, 06H, 42H, 02H, 30H       ; 0040 _ .....B.0
        db 01H, 60H, 00H, 00H                           ; 0048 _ .`..


SECTION .rdata  align=16 noexecute                      ; section number 8, const

?_100:                                                  ; switch/case jump table
        dd ?_028-$                                      ; 0000 _ 00000326 (rel)
        dd ?_018-$+4H                                   ; 0004 _ 000001CA (rel)
        dd ?_022-$+8H                                   ; 0008 _ 0000026C (rel)
        dd ?_011-$+0CH                                  ; 000C _ 00000115 (rel)
        dd ?_011-$+10H                                  ; 0010 _ 00000119 (rel)
        dd ?_027-$+14H                                  ; 0014 _ 00000328 (rel)
        dd ?_028-$+18H                                  ; 0018 _ 0000033E (rel)
        dd ?_013-$+1CH                                  ; 001C _ 00000150 (rel)
        dd ?_028-$+20H                                  ; 0020 _ 00000346 (rel)
        dd ?_013-$+24H                                  ; 0024 _ 00000158 (rel)
        dd ?_026-$+28H                                  ; 0028 _ 0000031C (rel)
        dd ?_028-$+2CH                                  ; 002C _ 00000352 (rel)
        dd ?_013-$+30H                                  ; 0030 _ 00000164 (rel)
        dd ?_028-$+34H                                  ; 0034 _ 0000035A (rel)
        dd ?_029-$+38H                                  ; 0038 _ 00000371 (rel)
        dd ?_001-$+3CH                                  ; 003C _ 00000050 (rel)
        dd ?_033-$+40H                                  ; 0040 _ 000003EC (rel)
        dd ?_021-$+44H                                  ; 0044 _ 00000298 (rel)

?_101:                                                  ; switch/case jump table
        dd ?_050-$                                      ; 0048 _ 0000056B (rel)
        dd .text.hot-$+574H                             ; 004C _ 0000057C (rel)
        dd .text.hot-$+633H                             ; 0050 _ 0000063F (rel)
        dd .text.hot-$+682H                             ; 0054 _ 00000692 (rel)
        dd .text.hot-$+890H                             ; 0058 _ 000008A4 (rel)
        dd .text.hot-$+910H                             ; 005C _ 00000928 (rel)
        dd .text.hot-$+560H                             ; 0060 _ 0000057C (rel)
        dd .text.hot-$+600H                             ; 0064 _ 00000620 (rel)
        dd .text.hot-$+560H                             ; 0068 _ 00000584 (rel)
        dd .text.hot-$+574H                             ; 006C _ 0000059C (rel)
        dd .text.hot-$+5E0H                             ; 0070 _ 0000060C (rel)
        dd .text.hot-$+560H                             ; 0074 _ 00000590 (rel)
        dd .text.hot-$+574H                             ; 0078 _ 000005A8 (rel)
        dd .text.hot-$+560H                             ; 007C _ 00000598 (rel)
        dd .text.hot-$+574H                             ; 0080 _ 000005B0 (rel)
        dd .text.hot-$+560H                             ; 0084 _ 000005A0 (rel)
        dd .text.hot-$+574H                             ; 0088 _ 000005B8 (rel)
        dd .text.hot-$+560H                             ; 008C _ 000005A8 (rel)


SECTION .xdata.unlikely align=4 noexecute               ; section number 9, const

        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0000 _ ........


SECTION .rdata$zzz align=16 noexecute                   ; section number 11, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr.PieceValue align=16 noexecute    ; section number 12, const
;  Communal section not supported by YASM

.refptr.PieceValue:                                     ; qword
        dq PieceValue                                   ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


