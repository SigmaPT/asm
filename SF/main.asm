; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\main.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64

default rel

global _Z4test6Square: function
global main: function
global .refptr.SquareBB
global .refptr.TT
global .refptr.Opt
global .refptr.Threads

extern Threads                                          ; byte
extern Opt                                              ; byte
extern TT                                               ; byte
extern SquareBB                                         ; byte
extern _ZN10ThreadPool4exitEv                           ; near
extern _ZN3UCI4loopEiPPc                                ; near
extern _ZN18TranspositionTable6resizeEy                 ; near
extern _ZN10Tablebases4initEPKc                         ; near
extern _ZN10ThreadPool4initEv                           ; near
extern _ZN5Pawns4initEv                                 ; near
extern _ZN4Eval4initEv                                  ; near
extern _ZN6Search4initEv                                ; near
extern _ZN8Bitbases4initEv                              ; near
extern _ZN8Position4initEv                              ; near
extern _ZN9Bitboards4initEv                             ; near
extern _ZN4PSQT4initEv                                  ; near
extern _Z8MiscInitv                                     ; near
extern __main                                           ; near


SECTION .text   align=16 execute                        ; section number 1, code


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=16 noexecute                      ; section number 3, bss


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function

_Z4test6Square:
        mov     rax, qword [rel .refptr.SquareBB]       ; 0000 _ 48: 8B. 05, 00000000(rel)
        mov     rax, qword [rax+rcx*8]                  ; 0007 _ 48: 8B. 04 C8
        ret                                             ; 000B _ C3

        nop                                             ; 000C _ 90
        nop                                             ; 000D _ 90
        nop                                             ; 000E _ 90
        nop                                             ; 000F _ 90


SECTION .text.startup align=16 execute                  ; section number 5, code

.text.startup:; Local function

main:
        push    rdi                                     ; 0000 _ 57
        push    rsi                                     ; 0001 _ 56
        push    rbx                                     ; 0002 _ 53
        sub     rsp, 32                                 ; 0003 _ 48: 83. EC, 20
        mov     rdi, rdx                                ; 0007 _ 48: 89. D7
        mov     esi, ecx                                ; 000A _ 89. CE
        call    __main                                  ; 000C _ E8, 00000000(rel)
        call    _Z8MiscInitv                            ; 0011 _ E8, 00000000(rel)
        call    _ZN4PSQT4initEv                         ; 0016 _ E8, 00000000(rel)
        call    _ZN9Bitboards4initEv                    ; 001B _ E8, 00000000(rel)
        call    _ZN8Position4initEv                     ; 0020 _ E8, 00000000(rel)
        call    _ZN8Bitbases4initEv                     ; 0025 _ E8, 00000000(rel)
        call    _ZN6Search4initEv                       ; 002A _ E8, 00000000(rel)
        call    _ZN4Eval4initEv                         ; 002F _ E8, 00000000(rel)
        call    _ZN5Pawns4initEv                        ; 0034 _ E8, 00000000(rel)
        mov     rcx, qword [rel .refptr.Threads]        ; 0039 _ 48: 8B. 0D, 00000000(rel)
        call    _ZN10ThreadPool4initEv                  ; 0040 _ E8, 00000000(rel)
        mov     rbx, qword [rel .refptr.Opt]            ; 0045 _ 48: 8B. 1D, 00000000(rel)
        mov     rcx, qword [rbx+30H]                    ; 004C _ 48: 8B. 4B, 30
        call    _ZN10Tablebases4initEPKc                ; 0050 _ E8, 00000000(rel)
        mov     rdx, qword [rbx+8H]                     ; 0055 _ 48: 8B. 53, 08
        mov     rcx, qword [rel .refptr.TT]             ; 0059 _ 48: 8B. 0D, 00000000(rel)
        call    _ZN18TranspositionTable6resizeEy        ; 0060 _ E8, 00000000(rel)
        mov     rdx, rdi                                ; 0065 _ 48: 89. FA
        mov     ecx, esi                                ; 0068 _ 89. F1
        call    _ZN3UCI4loopEiPPc                       ; 006A _ E8, 00000000(rel)
        mov     rcx, qword [rel .refptr.Threads]        ; 006F _ 48: 8B. 0D, 00000000(rel)
        call    _ZN10ThreadPool4exitEv                  ; 0076 _ E8, 00000000(rel)
        xor     eax, eax                                ; 007B _ 31. C0
        add     rsp, 32                                 ; 007D _ 48: 83. C4, 20
        pop     rbx                                     ; 0081 _ 5B
        pop     rsi                                     ; 0082 _ 5E
        pop     rdi                                     ; 0083 _ 5F
        ret                                             ; 0084 _ C3

        nop                                             ; 0085 _ 90
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


SECTION .xdata.startup align=4 noexecute                ; section number 6, const

        db 01H, 07H, 04H, 00H, 07H, 32H, 03H, 30H       ; 0000 _ .....2.0
        db 02H, 60H, 01H, 70H                           ; 0008 _ .`.p


SECTION .xdata.unlikely align=4 noexecute               ; section number 8, const

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .rdata$zzz align=16 noexecute                   ; section number 10, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr.SquareBB align=16 noexecute      ; section number 11, const
;  Communal section not supported by YASM

.refptr.SquareBB:                                       ; qword
        dq SquareBB                                     ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.TT align=16 noexecute            ; section number 12, const
;  Communal section not supported by YASM

.refptr.TT:                                             ; qword
        dq TT                                           ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.Opt align=16 noexecute           ; section number 13, const
;  Communal section not supported by YASM

.refptr.Opt:                                            ; qword
        dq Opt                                          ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.Threads align=16 noexecute       ; section number 14, const
;  Communal section not supported by YASM

.refptr.Threads:                                        ; qword
        dq Threads                                      ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


