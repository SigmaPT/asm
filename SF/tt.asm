; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\tt.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: BMI etc., x64

default rel

global _ZN18TranspositionTable6resizeEy: function
global _ZN18TranspositionTable5clearEv: function
global _ZNK18TranspositionTable8hashfullEv: function
global TT
global _ZNK18TranspositionTable5probeEyRb: function

extern memset                                           ; near
extern exit                                             ; near
extern _Z11write_errorPcS_                              ; near
extern _Z9print_intPcy                                  ; near
extern _Z12print_stringPcPKc                            ; near
extern _Z7v_allocy                                      ; near
extern _Z6v_freePv                                      ; near
extern atexit                                           ; near


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_ZN18TranspositionTable6resizeEy:
        push    rsi                                     ; 0000 _ 56
        push    rbx                                     ; 0001 _ 53
        sub     rsp, 168                                ; 0002 _ 48: 81. EC, 000000A8
        mov     r8d, 1                                  ; 0009 _ 41: B8, 00000001
        mov     rax, rdx                                ; 000F _ 48: 89. D0
        shl     rax, 20                                 ; 0012 _ 48: C1. E0, 14
        shr     rax, 5                                  ; 0016 _ 48: C1. E8, 05
        bsr     rbx, rax                                ; 001A _ 48: 0F BD. D8
        shlx    r9, r8, rbx                             ; 001E _ C4 42 E1: F7. C8
        cmp     qword [rcx], r9                         ; 0023 _ 4C: 39. 09
        jz      ?_001                                   ; 0026 _ 74, 3E
        mov     rbx, rcx                                ; 0028 _ 48: 89. CB
        mov     qword [rcx], r9                         ; 002B _ 4C: 89. 09
        mov     rcx, qword [rcx+10H]                    ; 002E _ 48: 8B. 49, 10
        mov     rsi, rdx                                ; 0032 _ 48: 89. D6
        call    _Z6v_freePv                             ; 0035 _ E8, 00000000(rel)
        mov     edx, 5                                  ; 003A _ BA, 00000005
        shlx    rcx, qword [rbx], rdx                   ; 003F _ C4 E2 E9: F7. 0B
        add     rcx, 63                                 ; 0044 _ 48: 83. C1, 3F
        call    _Z7v_allocy                             ; 0048 _ E8, 00000000(rel)
        test    rax, rax                                ; 004D _ 48: 85. C0
        mov     qword [rbx+10H], rax                    ; 0050 _ 48: 89. 43, 10
        je      _ZN18TranspositionTable6resizeEy.cold.3 ; 0054 _ 0F 84, 00000000(rel)
        add     rax, 63                                 ; 005A _ 48: 83. C0, 3F
        and     rax, 0FFFFFFFFFFFFFFC0H                 ; 005E _ 48: 83. E0, C0
        mov     qword [rbx+8H], rax                     ; 0062 _ 48: 89. 43, 08
?_001:  add     rsp, 168                                ; 0066 _ 48: 81. C4, 000000A8
        pop     rbx                                     ; 006D _ 5B
        pop     rsi                                     ; 006E _ 5E
        ret                                             ; 006F _ C3

_ZN18TranspositionTable5clearEv:; Function begin
        xor     edx, edx                                ; 0070 _ 31. D2
        mov     r8, qword [rcx]                         ; 0072 _ 4C: 8B. 01
        mov     rcx, qword [rcx+8H]                     ; 0075 _ 48: 8B. 49, 08
        shl     r8, 5                                   ; 0079 _ 49: C1. E0, 05
        jmp     memset                                  ; 007D _ E9, 00000000(rel)
; _ZN18TranspositionTable5clearEv End of function

; Filling space: 0EH
; Filler type: Multi-byte NOP
;       db 66H, 66H, 66H, 66H, 66H, 2EH, 0FH, 1FH
;       db 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16

_ZNK18TranspositionTable8hashfullEv:; Function begin
        xor     eax, eax                                ; 0090 _ 31. C0
        mov     r8, qword [rcx+8H]                      ; 0092 _ 4C: 8B. 41, 08
        movzx   r10d, byte [rcx+18H]                    ; 0096 _ 44: 0F B6. 51, 18
        lea     r11, [r8+29A0H]                         ; 009B _ 4D: 8D. 98, 000029A0
?_002:  xor     edx, edx                                ; 00A2 _ 31. D2
?_003:  movzx   ecx, byte [r8+rdx+8H]                   ; 00A4 _ 41: 0F B6. 4C 10, 08
        lea     r9d, [rax+1H]                           ; 00AA _ 44: 8D. 48, 01
        and     ecx, 0FFFFFFFCH                         ; 00AE _ 83. E1, FC
        cmp     r10b, cl                                ; 00B1 _ 41: 38. CA
        cmove   eax, r9d                                ; 00B4 _ 41: 0F 44. C1
        add     rdx, 10                                 ; 00B8 _ 48: 83. C2, 0A
        cmp     rdx, 30                                 ; 00BC _ 48: 83. FA, 1E
        jnz     ?_003                                   ; 00C0 _ 75, E2
        add     r8, 32                                  ; 00C2 _ 49: 83. C0, 20
        cmp     r8, r11                                 ; 00C6 _ 4D: 39. D8
        jnz     ?_002                                   ; 00C9 _ 75, D7
        ret                                             ; 00CB _ C3
; _ZNK18TranspositionTable8hashfullEv End of function

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8

__tcf_0:; Local function
        mov     rcx, qword [rel ?_004]                  ; 00D0 _ 48: 8B. 0D, 00000010(rel)
        jmp     _Z6v_freePv                             ; 00D7 _ E9, 00000000(rel)

        nop                                             ; 00DC _ 90
        nop                                             ; 00DD _ 90
        nop                                             ; 00DE _ 90
        nop                                             ; 00DF _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=32 noexecute                      ; section number 3, bss

TT:                                                     ; byte
        resb    16                                      ; 0000

?_004:  resq    2                                       ; 0010


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_ZN18TranspositionTable6resizeEy.cold.3:
        lea     rbx, [rsp+20H]                          ; 0000 _ 48: 8D. 5C 24, 20
        lea     rdx, [rel ?_005]                        ; 0005 _ 48: 8D. 15, 00000000(rel)
        mov     rcx, rbx                                ; 000C _ 48: 89. D9
        call    _Z12print_stringPcPKc                   ; 000F _ E8, 00000000(rel)
        mov     rdx, rsi                                ; 0014 _ 48: 89. F2
        mov     rcx, rax                                ; 0017 _ 48: 89. C1
        call    _Z9print_intPcy                         ; 001A _ E8, 00000000(rel)
        lea     rdx, [rel ?_006]                        ; 001F _ 48: 8D. 15, 00000014(rel)
        mov     rcx, rax                                ; 0026 _ 48: 89. C1
        call    _Z12print_stringPcPKc                   ; 0029 _ E8, 00000000(rel)
        mov     rcx, rbx                                ; 002E _ 48: 89. D9
        mov     rdx, rax                                ; 0031 _ 48: 89. C2
        call    _Z11write_errorPcS_                     ; 0034 _ E8, 00000000(rel)
        mov     ecx, 1                                  ; 0039 _ B9, 00000001
        call    exit                                    ; 003E _ E8, 00000000(rel)
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


SECTION .text.startup align=16 execute                  ; section number 5, code

.text.startup:; Local function
_GLOBAL__sub_I_TT:
        lea     rcx, [rel __tcf_0]                      ; 0000 _ 48: 8D. 0D, 000000D0(rel)
        jmp     atexit                                  ; 0007 _ E9, 00000000(rel)

        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .xdata.startup align=4 noexecute                ; section number 6, const

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .ctors  align=8 noexecute                       ; section number 8, data

        dq _GLOBAL__sub_I_TT                            ; 0000 _ 0000000000000000 (d)


SECTION .rdata  align=16 noexecute                      ; section number 9, const

?_005:                                                  ; byte
        db 46H, 61H, 69H, 6CH, 65H, 64H, 20H, 74H       ; 0000 _ Failed t
        db 6FH, 20H, 61H, 6CH, 6CH, 6FH, 63H, 61H       ; 0008 _ o alloca
        db 74H, 65H, 20H, 00H                           ; 0010 _ te .

?_006:                                                  ; byte
        db 4DH, 42H, 20H, 66H, 6FH, 72H, 20H, 74H       ; 0014 _ MB for t
        db 72H, 61H, 6EH, 73H, 70H, 6FH, 73H, 69H       ; 001C _ ransposi
        db 74H, 69H, 6FH, 6EH, 20H, 74H, 61H, 62H       ; 0024 _ tion tab
        db 6CH, 65H, 2EH, 0AH, 00H, 00H, 00H, 00H       ; 002C _ le......
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0034 _ ........
        db 00H, 00H, 00H, 00H                           ; 003C _ ....


SECTION .xdata  align=4 noexecute                       ; section number 10, const

        db 01H, 09H, 04H, 00H, 09H, 01H, 15H, 00H       ; 0000 _ ........
        db 02H, 30H, 01H, 60H, 01H, 00H, 00H, 00H       ; 0008 _ .0.`....
        db 01H, 00H, 00H, 00H, 01H, 00H, 00H, 00H       ; 0010 _ ........


SECTION .text.hot align=16 execute                      ; section number 12, code

.text.hot:; Local function

_ZNK18TranspositionTable5probeEyRb:
        push    r12                                     ; 0000 _ 41: 54
        push    rbp                                     ; 0002 _ 55
        push    rdi                                     ; 0003 _ 57
        push    rsi                                     ; 0004 _ 56
        push    rbx                                     ; 0005 _ 53
        mov     rax, qword [rcx]                        ; 0006 _ 48: 8B. 01
        lea     r9, [rax-1H]                            ; 0009 _ 4C: 8D. 48, FF
        and     r9, rdx                                 ; 000D _ 49: 21. D1
        shr     rdx, 48                                 ; 0010 _ 48: C1. EA, 30
        shl     r9, 5                                   ; 0014 _ 49: C1. E1, 05
        add     r9, qword [rcx+8H]                      ; 0018 _ 4C: 03. 49, 08
        movzx   r10d, word [r9]                         ; 001C _ 45: 0F B7. 11
        test    r10w, r10w                              ; 0020 _ 66 45: 85. D2
        je      ?_013                                   ; 0024 _ 0F 84, 00000103
        cmp     dx, r10w                                ; 002A _ 66 44: 39. D2
        je      ?_010                                   ; 002E _ 0F 84, 000000EC
        movzx   r10d, word [r9+0AH]                     ; 0034 _ 45: 0F B7. 51, 0A
        lea     rax, [r9+0AH]                           ; 0039 _ 49: 8D. 41, 0A
        test    r10w, r10w                              ; 003D _ 66 45: 85. D2
        je      ?_012                                   ; 0041 _ 0F 84, 000000E1
        cmp     dx, r10w                                ; 0047 _ 66 44: 39. D2
        je      ?_008                                   ; 004B _ 0F 84, 000000AB
        movzx   r10d, word [r9+14H]                     ; 0051 _ 45: 0F B7. 51, 14
        lea     r11, [r9+14H]                           ; 0056 _ 4D: 8D. 59, 14
        test    r10w, r10w                              ; 005A _ 66 45: 85. D2
        je      ?_011                                   ; 005E _ 0F 84, 000000C1
        cmp     dx, r10w                                ; 0064 _ 66 44: 39. D2
        je      ?_007                                   ; 0068 _ 0F 84, 0000008B
        movzx   edx, byte [rcx+18H]                     ; 006E _ 0F B6. 51, 18
        movzx   ebp, byte [r9+8H]                       ; 0072 _ 41: 0F B6. 69, 08
        movzx   edi, byte [r9+12H]                      ; 0077 _ 41: 0F B6. 79, 12
        movsx   r10d, byte [r9+9H]                      ; 007C _ 45: 0F BE. 51, 09
        add     edx, 259                                ; 0081 _ 81. C2, 00000103
        movsx   ebx, byte [r9+13H]                      ; 0087 _ 41: 0F BE. 59, 13
        mov     ecx, edx                                ; 008C _ 89. D1
        mov     esi, edx                                ; 008E _ 89. D6
        sub     ecx, ebp                                ; 0090 _ 29. E9
        sub     esi, edi                                ; 0092 _ 29. FE
        and     ecx, 0FCH                               ; 0094 _ 81. E1, 000000FC
        and     esi, 0FCH                               ; 009A _ 81. E6, 000000FC
        mov     r12d, r10d                              ; 00A0 _ 45: 89. D4
        add     ecx, ecx                                ; 00A3 _ 01. C9
        add     esi, esi                                ; 00A5 _ 01. F6
        sub     r10d, ecx                               ; 00A7 _ 41: 29. CA
        mov     ecx, ebx                                ; 00AA _ 89. D9
        sub     ebx, esi                                ; 00AC _ 29. F3
        cmp     ebx, r10d                               ; 00AE _ 44: 39. D3
        mov     r10d, edx                               ; 00B1 _ 41: 89. D2
        cmovge  rax, r9                                 ; 00B4 _ 49: 0F 4D. C1
        cmovge  ecx, r12d                               ; 00B8 _ 41: 0F 4D. CC
        movsx   r12d, byte [r9+1DH]                     ; 00BC _ 45: 0F BE. 61, 1D
        cmovge  edi, ebp                                ; 00C1 _ 0F 4D. FD
        movzx   r9d, byte [r9+1CH]                      ; 00C4 _ 45: 0F B6. 49, 1C
        mov     byte [r8], 0                            ; 00C9 _ 41: C6. 00, 00
        sub     r10d, edi                               ; 00CD _ 41: 29. FA
        and     r10d, 0FCH                              ; 00D0 _ 41: 81. E2, 000000FC
        sub     edx, r9d                                ; 00D7 _ 44: 29. CA
        add     r10d, r10d                              ; 00DA _ 45: 01. D2
        and     edx, 0FCH                               ; 00DD _ 81. E2, 000000FC
        sub     ecx, r10d                               ; 00E3 _ 44: 29. D1
        add     edx, edx                                ; 00E6 _ 01. D2
        sub     r12d, edx                               ; 00E8 _ 41: 29. D4
        cmp     ecx, r12d                               ; 00EB _ 44: 39. E1
        cmovg   rax, r11                                ; 00EE _ 49: 0F 4F. C3
        pop     rbx                                     ; 00F2 _ 5B
        pop     rsi                                     ; 00F3 _ 5E
        pop     rdi                                     ; 00F4 _ 5F
        pop     rbp                                     ; 00F5 _ 5D
        pop     r12                                     ; 00F6 _ 41: 5C
        ret                                             ; 00F8 _ C3

?_007:  mov     rax, r11                                ; 00F9 _ 4C: 89. D8
?_008:  movzx   r11d, byte [rax+8H]                     ; 00FC _ 44: 0F B6. 58, 08
        movzx   ebp, byte [rcx+18H]                     ; 0101 _ 0F B6. 69, 18
        mov     ebx, r11d                               ; 0105 _ 44: 89. DB
        and     ebx, 0FFFFFFFCH                         ; 0108 _ 83. E3, FC
        cmp     bpl, bl                                 ; 010B _ 40: 38. DD
        jnz     ?_014                                   ; 010E _ 75, 22
?_009:  test    r10w, r10w                              ; 0110 _ 66 45: 85. D2
        setne   byte [r8]                               ; 0114 _ 41: 0F 95. 00
        pop     rbx                                     ; 0118 _ 5B
        pop     rsi                                     ; 0119 _ 5E
        pop     rdi                                     ; 011A _ 5F
        pop     rbp                                     ; 011B _ 5D
        pop     r12                                     ; 011C _ 41: 5C
        ret                                             ; 011E _ C3

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_010:  mov     rax, r9                                 ; 0120 _ 4C: 89. C8
        jmp     ?_008                                   ; 0123 _ EB, D7

?_011:  mov     rax, r11                                ; 0125 _ 4C: 89. D8
?_012:  xor     r10d, r10d                              ; 0128 _ 45: 31. D2
        jmp     ?_009                                   ; 012B _ EB, E3

?_013:  mov     rax, r9                                 ; 012D _ 4C: 89. C8
        jmp     ?_012                                   ; 0130 _ EB, F6

?_014:  ; Local function
        and     r11d, 03H                               ; 0132 _ 41: 83. E3, 03
        or      r11d, ebp                               ; 0136 _ 41: 09. EB
        mov     byte [rax+8H], r11b                     ; 0139 _ 44: 88. 58, 08
        jmp     ?_009                                   ; 013D _ EB, D1

        nop                                             ; 013F _ 90


SECTION .xdata.hot align=4 noexecute                    ; section number 13, const

        db 01H, 06H, 05H, 00H, 06H, 30H, 05H, 60H       ; 0000 _ .....0.`
        db 04H, 70H, 03H, 50H, 02H, 0C0H, 00H, 00H      ; 0008 _ .p.P....


SECTION .rdata$zzz align=16 noexecute                   ; section number 15, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


