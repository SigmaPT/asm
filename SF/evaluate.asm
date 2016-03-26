; Disassembly of file: C:\Users\pc\Dropbox\asm\SF\evaluate.o
; Sat Mar 26 14:18:14 2016
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: BMI etc., x64

default rel

global _ZN4Eval4initEv: function
global _ZN4Eval8evaluateERK8Position: function
global .refptr.PassedPawnMask
global .refptr.ForwardBB
global .refptr.SquareDistance
global .refptr.PseudoAttacks
global .refptr.RookAttacks
global .refptr.RookMasks
global .refptr.BishopAttacks
global .refptr.BishopMasks
global .refptr.LineBB
global .refptr.SquareBB
global .refptr.StepAttacksBB

extern LineBB                                           ; byte
extern StepAttacksBB                                    ; byte
extern SquareBB                                         ; byte
extern BishopMasks                                      ; byte
extern BishopAttacks                                    ; byte
extern RookMasks                                        ; byte
extern RookAttacks                                      ; byte
extern PseudoAttacks                                    ; byte
extern SquareDistance                                   ; byte
extern ForwardBB                                        ; byte
extern PassedPawnMask                                   ; byte
extern _ZN5Pawns5Entry14do_king_safetyIL5Color0EEE5ScoreRK8Position6Square ; near
extern _ZN5Pawns5Entry14do_king_safetyIL5Color1EEE5ScoreRK8Position6Square ; near
extern _ZNK8Position14check_blockersE5ColorS0_          ; near
extern _ZN5Pawns5probeERK8Position                      ; near
extern _ZN8Material5probeERK8Position                   ; near


SECTION .text   align=16 execute                        ; section number 1, code

.text:  ; Local function

_ZN4Eval4initEv:
        xor     r8d, r8d                                ; 0000 _ 45: 31. C0
        mov     ecx, 4294967280                         ; 0003 _ B9, FFFFFFF0
        mov     r9d, 7700                               ; 0008 _ 41: B9, 00001E14
        lea     r10, [rel _ZN12_GLOBAL__N_110KingDangerE]; 000E _ 4C: 8D. 15, 00000000(rel)
        mov     r11d, 47410                             ; 0015 _ 41: BB, 0000B932
        jmp     ?_002                                   ; 001B _ EB, 1F

?_001:  imul    eax, eax                                ; 001D _ 0F AF. C0
        add     ecx, 322                                ; 0020 _ 81. C1, 00000142
        lea     edx, [rax-10H]                          ; 0026 _ 8D. 50, F0
        cmp     edx, ecx                                ; 0029 _ 39. CA
        cmovle  ecx, edx                                ; 002B _ 0F 4E. CA
        cmp     ecx, 47410                              ; 002E _ 81. F9, 0000B932
        cmovge  ecx, r11d                               ; 0034 _ 41: 0F 4D. CB
        add     r8, 1                                   ; 0038 _ 49: 83. C0, 01
?_002:  imul    eax, ecx, 268                           ; 003C _ 69. C1, 0000010C
        cdq                                             ; 0042 _ 99
        idiv    r9d                                     ; 0043 _ 41: F7. F9
        shl     eax, 16                                 ; 0046 _ C1. E0, 10
        cmp     r8, 399                                 ; 0049 _ 49: 81. F8, 0000018F
        mov     dword [r10+r8*4], eax                   ; 0050 _ 43: 89. 04 82
        lea     eax, [r8+1H]                            ; 0054 _ 41: 8D. 40, 01
        jnz     ?_001                                   ; 0058 _ 75, C3
        ret                                             ; 005A _ C3

        nop                                             ; 005B _ 90
        nop                                             ; 005C _ 90
        nop                                             ; 005D _ 90
        nop                                             ; 005E _ 90
        nop                                             ; 005F _ 90


SECTION .data   align=16 noexecute                      ; section number 2, data


SECTION .bss    align=64 noexecute                      ; section number 3, bss

_ZN12_GLOBAL__N_110KingDangerE:                         ; byte
        resb    2048                                    ; 0000

_ZN12_GLOBAL__N_1L17TrappedBishopA1H1E:                 ; dword
        resd    1                                       ; 0800

_ZN12_GLOBAL__N_1L11UnstoppableE:                       ; dword
        resd    1                                       ; 0804

_ZN12_GLOBAL__N_1L16ThreatByPawnPushE:                  ; dword
        resd    1                                       ; 0808

_ZN12_GLOBAL__N_1L7HangingE:                            ; dword
        resd    1                                       ; 080C

_ZN12_GLOBAL__N_1L19ThreatByHangingPawnE:               ; dword
        resd    1                                       ; 0810

_ZN12_GLOBAL__N_1L7CheckedE:                            ; dword
        resd    1                                       ; 0814

_ZN12_GLOBAL__N_1L11TrappedRookE:                       ; dword
        resd    1                                       ; 0818

_ZN12_GLOBAL__N_1L10RookOnPawnE:                        ; dword
        resd    1                                       ; 081C

_ZN12_GLOBAL__N_1L11BishopPawnsE:                       ; dword
        resd    1                                       ; 0820

_ZN12_GLOBAL__N_1L15MinorBehindPawnE:                   ; dword
        resd    7                                       ; 0824

ALIGN   16
_ZN12_GLOBAL__N_1L10PassedFileE:                        ; oword
        resd    4                                       ; 0840

?_003:                                                  ; oword
        resd    4                                       ; 0850

_ZN12_GLOBAL__N_1L12ThreatByKingE:                      ; dword
        resd    1                                       ; 0860

?_004:  resd    7                                       ; 0864

_ZN12_GLOBAL__N_1L6ThreatE:                             ; dword
        resd    1                                       ; 0880

?_005:  resd    1                                       ; 0884

?_006:  resd    1                                       ; 0888

?_007:  resd    1                                       ; 088C

?_008:  resd    1                                       ; 0890

?_009:  resd    3                                       ; 0894

?_010:  resd    1                                       ; 08A0

?_011:  resd    1                                       ; 08A4

?_012:  resd    1                                       ; 08A8

?_013:  resd    1                                       ; 08AC

?_014:  resd    1                                       ; 08B0

?_015:  resd    3                                       ; 08B4

_ZN12_GLOBAL__N_1L16ThreatBySafePawnE:                  ; dword
        resd    1                                       ; 08C0

?_016:  resd    1                                       ; 08C4

?_017:  resd    1                                       ; 08C8

?_018:  resd    1                                       ; 08CC

?_019:  resd    1                                       ; 08D0

?_020:  resd    3                                       ; 08D4

_ZN12_GLOBAL__N_1L10RookOnFileE:                        ; dword
        resd    1                                       ; 08E0

?_021:  resd    3                                       ; 08E4

ALIGN   16
_ZN12_GLOBAL__N_1L16ReachableOutpostE:                  ; oword
        resd    4                                       ; 08F0

_ZN12_GLOBAL__N_1L7OutpostE:                            ; oword
        resd    16                                      ; 0900

_ZN12_GLOBAL__N_1L13MobilityBonusE:                     ; byte
        resb    256                                     ; 0940

?_022:  resd    1                                       ; 0A40

?_023:  resd    1                                       ; 0A44

?_024:  resd    1                                       ; 0A48

?_025:  resd    1                                       ; 0A4C

?_026:  resd    1                                       ; 0A50

?_027:  resd    1                                       ; 0A54

?_028:  resd    1                                       ; 0A58

?_029:  resd    1                                       ; 0A5C

?_030:  resd    24                                      ; 0A60

?_031:  resd    1                                       ; 0AC0

?_032:  resd    1                                       ; 0AC4

?_033:  resd    1                                       ; 0AC8

?_034:  resd    1                                       ; 0ACC

?_035:  resd    1                                       ; 0AD0

?_036:  resd    1                                       ; 0AD4

?_037:  resd    1                                       ; 0AD8

?_038:  resd    1                                       ; 0ADC

?_039:  resd    1                                       ; 0AE0

?_040:  resd    1                                       ; 0AE4

?_041:  resd    1                                       ; 0AE8

?_042:  resd    1                                       ; 0AEC

?_043:  resd    1                                       ; 0AF0

?_044:  resd    19                                      ; 0AF4

?_045:  resd    1                                       ; 0B40

?_046:  resd    1                                       ; 0B44

?_047:  resd    1                                       ; 0B48

?_048:  resd    1                                       ; 0B4C

?_049:  resd    1                                       ; 0B50

?_050:  resd    1                                       ; 0B54

?_051:  resd    1                                       ; 0B58

?_052:  resd    1                                       ; 0B5C

?_053:  resd    1                                       ; 0B60

?_054:  resd    1                                       ; 0B64

?_055:  resd    1                                       ; 0B68

?_056:  resd    1                                       ; 0B6C

?_057:  resd    1                                       ; 0B70

?_058:  resd    1                                       ; 0B74

?_059:  resd    18                                      ; 0B78

?_060:  resd    1                                       ; 0BC0

?_061:  resd    1                                       ; 0BC4

?_062:  resd    1                                       ; 0BC8

?_063:  resd    1                                       ; 0BCC

?_064:  resd    1                                       ; 0BD0

?_065:  resd    1                                       ; 0BD4

?_066:  resd    1                                       ; 0BD8

?_067:  resd    1                                       ; 0BDC

?_068:  resd    1                                       ; 0BE0

?_069:  resd    1                                       ; 0BE4

?_070:  resd    1                                       ; 0BE8

?_071:  resd    1                                       ; 0BEC

?_072:  resd    1                                       ; 0BF0

?_073:  resd    1                                       ; 0BF4

?_074:  resd    1                                       ; 0BF8

?_075:  resd    1                                       ; 0BFC

?_076:  resd    1                                       ; 0C00

?_077:  resd    1                                       ; 0C04

?_078:  resd    1                                       ; 0C08

?_079:  resd    1                                       ; 0C0C

?_080:  resd    1                                       ; 0C10

?_081:  resd    1                                       ; 0C14

?_082:  resd    1                                       ; 0C18

?_083:  resd    1                                       ; 0C1C

?_084:  resd    1                                       ; 0C20

?_085:  resd    1                                       ; 0C24

?_086:  resd    1                                       ; 0C28

?_087:  resd    5                                       ; 0C2C


SECTION .text.unlikely align=16 execute                 ; section number 4, code

.text.unlikely:; Local function
_ZN4Eval8evaluateERK8Position.cold.21:
        cmp     r9, 56                                  ; 0000 _ 49: 83. F9, 38
        mov     eax, dword [rsp+168H]                   ; 0004 _ 8B. 84 24, 00000168
        mov     esi, edx                                ; 000B _ 89. D6
        jz      ?_088                                   ; 000D _ 74, 0A
        cmp     r9, 63                                  ; 000F _ 49: 83. F9, 3F
        jne     .text.hot+532H                          ; 0013 _ 0F 85, 00000532(rel)
?_088:  mov     r10d, r9d                               ; 0019 _ 45: 89. CA
        mov     r8d, r14d                               ; 001C _ 45: 89. F0
        and     r10d, 07H                               ; 001F _ 41: 83. E2, 07
        cmp     r10d, 1                                 ; 0023 _ 41: 83. FA, 01
        sbb     rdx, rdx                                ; 0027 _ 48: 19. D2
        and     edx, 02H                                ; 002A _ 83. E2, 02
        sub     rdx, 1                                  ; 002D _ 48: 83. EA, 01
        sub     edx, 8                                  ; 0031 _ 83. EA, 08
        add     r9d, edx                                ; 0034 _ 41: 01. D1
        movsxd  r11, r9d                                ; 0037 _ 4D: 63. D9
        cmp     dword [rbx+r11*4], 9                    ; 003A _ 42: 83. 3C 9B, 09
        jz      ?_092                                   ; 003F _ 74, 4D
?_089:  mov     edx, esi                                ; 0041 _ 89. F2
        mov     r14d, r8d                               ; 0043 _ 45: 89. C6
        jmp     .text.hot+532H                          ; 0046 _ E9, 00000532(rel)

; Note: No jump seems to point here
        test    r10, r10                                ; 004B _ 4D: 85. D2
        mov     edi, eax                                ; 004E _ 89. C7
        mov     dword [rsp+104H], r12d                  ; 0050 _ 44: 89. A4 24, 00000104
        jz      ?_090                                   ; 0058 _ 74, 0A
        cmp     r10, 7                                  ; 005A _ 49: 83. FA, 07
        jne     .text.hot+4ABH                          ; 005E _ 0F 85, 000004AB(rel)
?_090:  mov     eax, r10d                               ; 0064 _ 44: 89. D0
        and     eax, 07H                                ; 0067 _ 83. E0, 07
        cmp     eax, 1                                  ; 006A _ 83. F8, 01
        sbb     rsi, rsi                                ; 006D _ 48: 19. F6
        and     esi, 02H                                ; 0070 _ 83. E6, 02
        sub     rsi, 1                                  ; 0073 _ 48: 83. EE, 01
        add     esi, 8                                  ; 0077 _ 83. C6, 08
        add     r10d, esi                               ; 007A _ 41: 01. F2
        movsxd  r12, r10d                               ; 007D _ 4D: 63. E2
        cmp     dword [rbx+r12*4], 1                    ; 0080 _ 42: 83. 3C A3, 01
        jz      ?_094                                   ; 0085 _ 74, 44
?_091:  mov     eax, edi                                ; 0087 _ 89. F8
        jmp     .text.hot+4ABH                          ; 0089 _ E9, 000004AB(rel)

?_092:  lea     r8d, [r9-8H]                            ; 008E _ 45: 8D. 41, F8
        mov     r10d, dword [rsp+190H]                  ; 0092 _ 44: 8B. 94 24, 00000190
        movsxd  r11, r8d                                ; 009A _ 4D: 63. D8
        cmp     dword [rbx+r11*4], 0                    ; 009D _ 42: 83. 3C 9B, 00
        jnz     ?_093                                   ; 00A2 _ 75, 1C
        add     edx, r9d                                ; 00A4 _ 44: 01. CA
        mov     r10d, dword [rsp+188H]                  ; 00A7 _ 44: 8B. 94 24, 00000188
        movsxd  r9, edx                                 ; 00AF _ 4C: 63. CA
        cmp     dword [rbx+r9*4], 9                     ; 00B2 _ 42: 83. 3C 8B, 09
        cmovne  r10d, dword [rsp+194H]                  ; 00B7 _ 44: 0F 45. 94 24, 00000194
?_093:  sub     r14d, r10d                              ; 00C0 _ 45: 29. D6
        mov     r8d, r14d                               ; 00C3 _ 45: 89. F0
        jmp     ?_089                                   ; 00C6 _ E9, FFFFFF76

?_094:  ; Local function
        lea     eax, [r10+8H]                           ; 00CB _ 41: 8D. 42, 08
        mov     r14d, dword [rsp+190H]                  ; 00CF _ 44: 8B. B4 24, 00000190
        cdqe                                            ; 00D7 _ 48: 98
        cmp     dword [rbx+rax*4], 0                    ; 00D9 _ 83. 3C 83, 00
        jnz     ?_095                                   ; 00DD _ 75, 17
        add     r10d, esi                               ; 00DF _ 41: 01. F2
        mov     r14d, dword [rsp+188H]                  ; 00E2 _ 44: 8B. B4 24, 00000188
        movsxd  r8, r10d                                ; 00EA _ 4D: 63. C2
        cmp     dword [rbx+r8*4], 1                     ; 00ED _ 42: 83. 3C 83, 01
        cmovne  r14d, r11d                              ; 00F2 _ 45: 0F 45. F3
?_095:  sub     dword [rsp+104H], r14d                  ; 00F6 _ 44: 29. B4 24, 00000104
        jmp     ?_091                                   ; 00FE _ EB, 87


SECTION .text.startup align=16 execute                  ; section number 5, code

.text.startup:; Local function
_GLOBAL__sub_I__ZN4Eval8evaluateERK8Position:
        mov     dword [rel ?_022], -4915276             ; 0000 _ C7. 05, 00000A3C(rel), FFB4FFB4
        mov     dword [rel ?_023], -3670070             ; 000A _ C7. 05, 00000A40(rel), FFC7FFCA
        mov     dword [rel ?_024], -589850              ; 0014 _ C7. 05, 00000A44(rel), FFF6FFE6
        mov     dword [rel ?_025], -131082              ; 001E _ C7. 05, 00000A48(rel), FFFDFFF6
        mov     dword [rel ?_026], 393221               ; 0028 _ C7. 05, 00000A4C(rel), 00060005
        mov     dword [rel ?_027], 983051               ; 0032 _ C7. 05, 00000A50(rel), 000F000B
        mov     dword [rel ?_028], 1441818              ; 003C _ C7. 05, 00000A54(rel), 0016001A
        mov     dword [rel ?_029], 1966108              ; 0046 _ C7. 05, 00000A58(rel), 001E001C
        mov     dword [rel ?_030], 2359325              ; 0050 _ C7. 05, 00000A5C(rel), 0024001D
        mov     dword [rel ?_031], -3145786             ; 005A _ C7. 05, 00000ABC(rel), FFCFFFC6
        mov     dword [rel ?_032], -1376275             ; 0064 _ C7. 05, 00000AC0(rel), FFEAFFED
        mov     dword [rel ?_033], 1048574              ; 006E _ C7. 05, 00000AC4(rel), 000FFFFE
        mov     dword [rel ?_034], 1703948              ; 0078 _ C7. 05, 00000AC8(rel), 001A000C
        mov     dword [rel ?_035], 2424854              ; 0082 _ C7. 05, 00000ACC(rel), 00250016
        mov     dword [rel ?_036], 3342378              ; 008C _ C7. 05, 00000AD0(rel), 0033002A
        mov     dword [rel ?_037], 3538998              ; 0096 _ C7. 05, 00000AD4(rel), 00360036
        mov     dword [rel ?_038], 4128826              ; 00A0 _ C7. 05, 00000AD8(rel), 003F003A
        mov     dword [rel ?_039], 4259903              ; 00AA _ C7. 05, 00000ADC(rel), 0041003F
        mov     dword [rel ?_040], 4653126              ; 00B4 _ C7. 05, 00000AE0(rel), 00470046
        mov     dword [rel ?_041], 5177418              ; 00BE _ C7. 05, 00000AE4(rel), 004F004A
        mov     dword [rel ?_042], 5308502              ; 00C8 _ C7. 05, 00000AE8(rel), 00510056
        mov     dword [rel ?_043], 6029402              ; 00D2 _ C7. 05, 00000AEC(rel), 005C005A
        mov     dword [rel ?_044], 6357086              ; 00DC _ C7. 05, 00000AF0(rel), 0061005E
        mov     dword [rel ?_045], -3670094             ; 00E6 _ C7. 05, 00000B3C(rel), FFC7FFB2
        mov     dword [rel ?_046], -1638418             ; 00F0 _ C7. 05, 00000B40(rel), FFE6FFEE
        mov     dword [rel ?_047], -720870              ; 00FA _ C7. 05, 00000B44(rel), FFF5001A
        mov     dword [rel ?_048], -327625              ; 0104 _ C7. 05, 00000B48(rel), FFFB0037
        mov     dword [rel ?_049], -262074              ; 010E _ C7. 05, 00000B4C(rel), FFFC0046
        mov     dword [rel ?_050], -65455               ; 0118 _ C7. 05, 00000B50(rel), FFFF0051
        mov     dword [rel ?_051], 524397               ; 0122 _ C7. 05, 00000B54(rel), 0008006D
        mov     dword [rel ?_052], 917624               ; 012C _ C7. 05, 00000B58(rel), 000E0078
        mov     dword [rel ?_053], 1376384              ; 0136 _ C7. 05, 00000B5C(rel), 00150080
        mov     dword [rel ?_054], 1507471              ; 0140 _ C7. 05, 00000B60(rel), 0017008F
        mov     dword [rel ?_055], 2031770              ; 014A _ C7. 05, 00000B64(rel), 001F009A
        movdqa  xmm0, oword [rel ?_292]                 ; 0154 _ 66: 0F 6F. 05, 00000040(rel)
        mov     dword [rel ?_056], 2097312              ; 015C _ C7. 05, 00000B68(rel), 002000A0
        mov     dword [rel ?_057], 2818213              ; 0166 _ C7. 05, 00000B6C(rel), 002B00A5
        mov     dword [rel ?_058], 3211432              ; 0170 _ C7. 05, 00000B70(rel), 003100A8
        mov     dword [rel ?_059], 3866793              ; 017A _ C7. 05, 00000B74(rel), 003B00A9
        mov     dword [rel ?_060], -2621475             ; 0184 _ C7. 05, 00000BBC(rel), FFD7FFDD
        mov     dword [rel ?_061], -1638412             ; 018E _ C7. 05, 00000BC0(rel), FFE6FFF4
        mov     dword [rel ?_062], 131079               ; 0198 _ C7. 05, 00000BC4(rel), 00020007
        mov     dword [rel ?_063], 262163               ; 01A2 _ C7. 05, 00000BC8(rel), 00040013
        mov     dword [rel ?_064], 917541               ; 01AC _ C7. 05, 00000BCC(rel), 000E0025
        mov     dword [rel ?_065], 1572919              ; 01B6 _ C7. 05, 00000BD0(rel), 00180037
        mov     dword [rel ?_066], 1638462              ; 01C0 _ C7. 05, 00000BD4(rel), 0019003E
        mov     dword [rel ?_067], 2621516              ; 01CA _ C7. 05, 00000BD8(rel), 0028004C
        mov     dword [rel ?_068], 2818127              ; 01D4 _ C7. 05, 00000BDC(rel), 002B004F
        mov     dword [rel ?_069], 3080279              ; 01DE _ C7. 05, 00000BE0(rel), 002F0057
        mov     dword [rel ?_070], 3539038              ; 01E8 _ C7. 05, 00000BE4(rel), 0036005E
        mov     dword [rel ?_071], 3670118              ; 01F2 _ C7. 05, 00000BE8(rel), 00380066
        mov     dword [rel ?_072], 3932271              ; 01FC _ C7. 05, 00000BEC(rel), 003C006F
        mov     dword [rel ?_073], 4587636              ; 0206 _ C7. 05, 00000BF0(rel), 00460074
        mov     dword [rel ?_074], 4718710              ; 0210 _ C7. 05, 00000BF4(rel), 00480076
        mov     dword [rel ?_075], 4784250              ; 021A _ C7. 05, 00000BF8(rel), 0049007A
        mov     dword [rel ?_076], 4915328              ; 0224 _ C7. 05, 00000BFC(rel), 004B0080
        mov     dword [rel ?_077], 5046402              ; 022E _ C7. 05, 00000C00(rel), 004D0082
        mov     dword [rel ?_078], 5570693              ; 0238 _ C7. 05, 00000C04(rel), 00550085
        mov     dword [rel ?_079], 6160520              ; 0242 _ C7. 05, 00000C08(rel), 005E0088
        mov     dword [rel ?_080], 6488204              ; 024C _ C7. 05, 00000C0C(rel), 0063008C
        mov     dword [rel ?_081], 7078045              ; 0256 _ C7. 05, 00000C10(rel), 006C009D
        mov     dword [rel ?_082], 7340190              ; 0260 _ C7. 05, 00000C14(rel), 0070009E
        mov     dword [rel ?_083], 7405729              ; 026A _ C7. 05, 00000C18(rel), 007100A1
        mov     dword [rel ?_084], 7733422              ; 0274 _ C7. 05, 00000C1C(rel), 007600AE
        mov     dword [rel ?_085], 7798961              ; 027E _ C7. 05, 00000C20(rel), 007700B1
        mov     dword [rel ?_086], 8061119              ; 0288 _ C7. 05, 00000C24(rel), 007B00BF
        mov     dword [rel ?_087], 8388807              ; 0292 _ C7. 05, 00000C28(rel), 008000C7
        movaps  oword [rel _ZN12_GLOBAL__N_1L7OutpostE], xmm0; 029C _ 0F 29. 05, 00000900(rel)
        movdqa  xmm1, oword [rel ?_293]                 ; 02A3 _ 66: 0F 6F. 0D, 00000050(rel)
        movdqa  xmm2, oword [rel ?_294]                 ; 02AB _ 66: 0F 6F. 15, 00000060(rel)
        mov     dword [rel _ZN12_GLOBAL__N_1L10RookOnFileE], 1245194; 02B3 _ C7. 05, 000008DC(rel), 0013000A
        movdqa  xmm3, oword [rel ?_295]                 ; 02BD _ 66: 0F 6F. 1D, 00000070(rel)
        movaps  oword [rel _ZN12_GLOBAL__N_1L16ReachableOutpostE], xmm1; 02C5 _ 0F 29. 0D, 000008F0(rel)
        mov     dword [rel ?_021], 2818069              ; 02CC _ C7. 05, 000008E0(rel), 002B0015
        mov     dword [rel _ZN12_GLOBAL__N_1L16ThreatBySafePawnE], 0; 02D6 _ C7. 05, 000008BC(rel), 00000000
        mov     dword [rel ?_016], 0                    ; 02E0 _ C7. 05, 000008C0(rel), 00000000
        mov     dword [rel ?_017], 11534475             ; 02EA _ C7. 05, 000008C4(rel), 00B0008B
        mov     dword [rel ?_018], 8585343              ; 02F4 _ C7. 05, 000008C8(rel), 0083007F
        mov     dword [rel ?_019], 14221530             ; 02FE _ C7. 05, 000008CC(rel), 00D900DA
        mov     dword [rel ?_020], 13304023             ; 0308 _ C7. 05, 000008D0(rel), 00CB00D7
        mov     dword [rel _ZN12_GLOBAL__N_1L6ThreatE], 0; 0312 _ C7. 05, 0000087C(rel), 00000000
        mov     dword [rel ?_005], 33                   ; 031C _ C7. 05, 00000880(rel), 00000021
        mov     dword [rel ?_006], 2949163              ; 0326 _ C7. 05, 00000884(rel), 002D002B
        mov     dword [rel ?_007], 3014703              ; 0330 _ C7. 05, 00000888(rel), 002E002F
        mov     dword [rel ?_008], 4718699              ; 033A _ C7. 05, 0000088C(rel), 0048006B
        mov     dword [rel ?_009], 3145846              ; 0344 _ C7. 05, 00000890(rel), 00300076
        mov     dword [rel ?_010], 0                    ; 034E _ C7. 05, 0000089C(rel), 00000000
        mov     dword [rel ?_011], 25                   ; 0358 _ C7. 05, 000008A0(rel), 00000019
        mov     dword [rel ?_012], 2621502              ; 0362 _ C7. 05, 000008A4(rel), 0028003E
        mov     dword [rel ?_013], 2621499              ; 036C _ C7. 05, 000008A8(rel), 0028003B
        mov     dword [rel ?_014], 34                   ; 0376 _ C7. 05, 000008AC(rel), 00000022
        mov     dword [rel ?_015], 2293808              ; 0380 _ C7. 05, 000008B0(rel), 00230030
        mov     dword [rel _ZN12_GLOBAL__N_1L12ThreatByKingE], 196670; 038A _ C7. 05, 0000085C(rel), 0003003E
        mov     dword [rel ?_004], 589962               ; 0394 _ C7. 05, 00000860(rel), 0009008A
        movaps  oword [rel _ZN12_GLOBAL__N_1L10PassedFileE], xmm2; 039E _ 0F 29. 15, 00000840(rel)
        movaps  oword [rel ?_003], xmm3                 ; 03A5 _ 0F 29. 1D, 00000850(rel)
        mov     dword [rel _ZN12_GLOBAL__N_1L15MinorBehindPawnE], 1048576; 03AC _ C7. 05, 00000820(rel), 00100000
        mov     dword [rel _ZN12_GLOBAL__N_1L11BishopPawnsE], 524300; 03B6 _ C7. 05, 0000081C(rel), 0008000C
        mov     dword [rel _ZN12_GLOBAL__N_1L10RookOnPawnE], 458779; 03C0 _ C7. 05, 00000818(rel), 0007001B
        mov     dword [rel _ZN12_GLOBAL__N_1L11TrappedRookE], 6029312; 03CA _ C7. 05, 00000814(rel), 005C0000
        mov     dword [rel _ZN12_GLOBAL__N_1L7CheckedE], 1310740; 03D4 _ C7. 05, 00000810(rel), 00140014
        mov     dword [rel _ZN12_GLOBAL__N_1L19ThreatByHangingPawnE], 4587583; 03DE _ C7. 05, 0000080C(rel), 0046003F
        mov     dword [rel _ZN12_GLOBAL__N_1L7HangingE], 3145756; 03E8 _ C7. 05, 00000808(rel), 0030001C
        mov     dword [rel _ZN12_GLOBAL__N_1L16ThreatByPawnPushE], 2031635; 03F2 _ C7. 05, 00000804(rel), 001F0013
        mov     dword [rel _ZN12_GLOBAL__N_1L11UnstoppableE], 20; 03FC _ C7. 05, 00000800(rel), 00000014
        mov     dword [rel _ZN12_GLOBAL__N_1L17TrappedBishopA1H1E], 3276850; 0406 _ C7. 05, 000007FC(rel), 00320032
        ret                                             ; 0410 _ C3

        nop                                             ; 0411 _ 90
        nop                                             ; 0412 _ 90
        nop                                             ; 0413 _ 90
        nop                                             ; 0414 _ 90
        nop                                             ; 0415 _ 90
        nop                                             ; 0416 _ 90
        nop                                             ; 0417 _ 90
        nop                                             ; 0418 _ 90
        nop                                             ; 0419 _ 90
        nop                                             ; 041A _ 90
        nop                                             ; 041B _ 90
        nop                                             ; 041C _ 90
        nop                                             ; 041D _ 90
        nop                                             ; 041E _ 90
        nop                                             ; 041F _ 90


SECTION .xdata.startup align=4 noexecute                ; section number 6, const

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .ctors  align=8 noexecute                       ; section number 8, data

        dq _GLOBAL__sub_I__ZN4Eval8evaluateERK8Position ; 0000 _ 0000000000000000 (d)


SECTION .xdata  align=4 noexecute                       ; section number 9, const

        db 01H, 00H, 00H, 00H                           ; 0000 _ ....


SECTION .text.hot align=16 execute                      ; section number 11, code

.text.hot:; Local function

_ZN4Eval8evaluateERK8Position:
        push    r15                                     ; 0000 _ 41: 57
        push    r14                                     ; 0002 _ 41: 56
        push    r13                                     ; 0004 _ 41: 55
        push    r12                                     ; 0006 _ 41: 54
        push    rbp                                     ; 0008 _ 55
        push    rdi                                     ; 0009 _ 57
        push    rsi                                     ; 000A _ 56
        push    rbx                                     ; 000B _ 53
        sub     rsp, 440                                ; 000C _ 48: 81. EC, 000001B8
        mov     rax, qword [rcx+3B8H]                   ; 0013 _ 48: 8B. 81, 000003B8
        mov     rbx, rcx                                ; 001A _ 48: 89. CB
        mov     r14d, dword [rax+24H]                   ; 001D _ 44: 8B. 70, 24
        call    _ZN8Material5probeERK8Position          ; 0021 _ E8, 00000000(rel)
        movsx   ecx, word [rax+8H]                      ; 0026 _ 0F BF. 48, 08
        mov     qword [rsp+0C8H], rax                   ; 002A _ 48: 89. 84 24, 000000C8
        mov     esi, ecx                                ; 0032 _ 89. CE
        shl     esi, 16                                 ; 0034 _ C1. E6, 10
        lea     ebp, [rcx+rsi]                          ; 0037 _ 8D. 2C 31
        mov     rcx, qword [rax+10H]                    ; 003A _ 48: 8B. 48, 10
        add     r14d, ebp                               ; 003E _ 41: 01. EE
        test    rcx, rcx                                ; 0041 _ 48: 85. C9
        jne     ?_290                                   ; 0044 _ 0F 85, 000027CE
        mov     rcx, rbx                                ; 004A _ 48: 89. D9
        call    _ZN5Pawns5probeERK8Position             ; 004D _ E8, 00000000(rel)
        xor     r8d, r8d                                ; 0052 _ 45: 31. C0
        xor     edx, edx                                ; 0055 _ 31. D2
        mov     rcx, rbx                                ; 0057 _ 48: 89. D9
        add     r14d, dword [rax+8H]                    ; 005A _ 44: 03. 70, 08
        mov     r13, rax                                ; 005E _ 49: 89. C5
        mov     dword [rsp+154H], r14d                  ; 0061 _ 44: 89. B4 24, 00000154
        call    _ZNK8Position14check_blockersE5ColorS0_ ; 0069 _ E8, 00000000(rel)
        mov     r11, qword [rel .refptr.StepAttacksBB]  ; 006E _ 4C: 8B. 1D, 00000000(rel)
        mov     rdi, qword [rbx+3B8H]                   ; 0075 _ 48: 8B. BB, 000003B8
        mov     qword [rsp+68H], rax                    ; 007C _ 48: 89. 44 24, 68
        mov     r9, qword [rbx+130H]                    ; 0081 _ 4C: 8B. 8B, 00000130
        mov     rax, qword [r13+20H]                    ; 0088 _ 49: 8B. 45, 20
        and     r9, qword [rbx+148H]                    ; 008C _ 4C: 23. 8B, 00000148
        bsf     r10, r9                                 ; 0093 _ 4D: 0F BC. D1
        cmp     dword [rdi+10H], 2520                   ; 0097 _ 81. 7F, 10, 000009D8
        mov     r12, qword [r11+r10*8+0C00H]            ; 009E _ 4F: 8B. A4 D3, 00000C00
        mov     qword [rsp+38H], rax                    ; 00A6 _ 48: 89. 44 24, 38
        mov     qword [rsp+0B0H], r12                   ; 00AB _ 4C: 89. A4 24, 000000B0
        jle     ?_238                                   ; 00B3 _ 0F 8E, 00002137
        mov     rdx, r12                                ; 00B9 _ 4C: 89. E2
        mov     rcx, r12                                ; 00BC _ 4C: 89. E1
        mov     dword [rsp+0F0H], 0                     ; 00BF _ C7. 84 24, 000000F0, 00000000
        shr     rdx, 8                                  ; 00CA _ 48: C1. EA, 08
        or      rdx, r12                                ; 00CE _ 4C: 09. E2
        and     rcx, rax                                ; 00D1 _ 48: 21. C1
        mov     qword [rsp+88H], rdx                    ; 00D4 _ 48: 89. 94 24, 00000088
        jne     ?_254                                   ; 00DC _ 0F 85, 0000239E
?_096:  mov     r8d, 1                                  ; 00E2 _ 41: B8, 00000001
        mov     edx, 1                                  ; 00E8 _ BA, 00000001
        mov     rcx, rbx                                ; 00ED _ 48: 89. D9
        call    _ZNK8Position14check_blockersE5ColorS0_ ; 00F0 _ E8, 00000000(rel)
        mov     r8, qword [rbx+140H]                    ; 00F5 _ 4C: 8B. 83, 00000140
        mov     r10, qword [rbx+130H]                   ; 00FC _ 4C: 8B. 93, 00000130
        mov     qword [rsp+60H], rax                    ; 0103 _ 48: 89. 44 24, 60
        mov     r12, qword [rel .refptr.StepAttacksBB]  ; 0108 _ 4C: 8B. 25, 00000000(rel)
        mov     r14, qword [r13+28H]                    ; 010F _ 4D: 8B. 75, 28
        mov     rcx, qword [rbx+3B8H]                   ; 0113 _ 48: 8B. 8B, 000003B8
        mov     qword [rsp+78H], r8                     ; 011A _ 4C: 89. 44 24, 78
        mov     qword [rsp+110H], r10                   ; 011F _ 4C: 89. 94 24, 00000110
        mov     rdx, qword [rsp+0B0H]                   ; 0127 _ 48: 8B. 94 24, 000000B0
        and     r10, r8                                 ; 012F _ 4D: 21. C2
        bsf     r11, r10                                ; 0132 _ 4D: 0F BC. DA
        mov     r15, qword [r12+r11*8+0C00H]            ; 0136 _ 4F: 8B. BC DC, 00000C00
        mov     qword [rsp+48H], r10                    ; 013E _ 4C: 89. 54 24, 48
        mov     qword [rsp+40H], r14                    ; 0143 _ 4C: 89. 74 24, 40
        or      rdx, r14                                ; 0148 _ 4C: 09. F2
        mov     qword [rsp+158H], rcx                   ; 014B _ 48: 89. 8C 24, 00000158
        mov     qword [rsp+148H], rdx                   ; 0153 _ 48: 89. 94 24, 00000148
        mov     rax, r15                                ; 015B _ 4C: 89. F8
        or      rax, qword [rsp+38H]                    ; 015E _ 48: 0B. 44 24, 38
        mov     qword [rsp+0E8H], r15                   ; 0163 _ 4C: 89. BC 24, 000000E8
        cmp     dword [rcx+14H], 2520                   ; 016B _ 81. 79, 14, 000009D8
        mov     qword [rsp+140H], rax                   ; 0172 _ 48: 89. 84 24, 00000140
        jle     ?_235                                   ; 017A _ 0F 8E, 00002020
        mov     dword [rsp+0D0H], 0                     ; 0180 _ C7. 84 24, 000000D0, 00000000
        mov     rsi, r15                                ; 018B _ 4C: 89. FE
        shl     r15, 8                                  ; 018E _ 49: C1. E7, 08
        mov     rbp, rsi                                ; 0192 _ 48: 89. F5
        or      r15, rsi                                ; 0195 _ 49: 09. F7
        and     rbp, r14                                ; 0198 _ 4C: 21. F5
        mov     qword [rsp+80H], r15                    ; 019B _ 4C: 89. BC 24, 00000080
        jne     ?_252                                   ; 01A3 _ 0F 85, 0000229C
?_097:  mov     rax, qword [rbx+100H]                   ; 01A9 _ 48: 8B. 83, 00000100
        mov     dword [rsp+11CH], 0                     ; 01B0 _ C7. 84 24, 0000011C, 00000000
        mov     r11, qword [rsp+78H]                    ; 01BB _ 4C: 8B. 5C 24, 78
        mov     dword [rsp+108H], 0                     ; 01C0 _ C7. 84 24, 00000108, 00000000
        mov     r15, qword [rbx+108H]                   ; 01CB _ 4C: 8B. BB, 00000108
        mov     qword [rsp+98H], 0                      ; 01D2 _ 48: C7. 84 24, 00000098, 00000000
        mov     rbp, qword [rbx+148H]                   ; 01DE _ 48: 8B. AB, 00000148
        mov     dword [rsp+118H], 0                     ; 01E5 _ C7. 84 24, 00000118, 00000000
        mov     r8, rax                                 ; 01F0 _ 49: 89. C0
        mov     rcx, rax                                ; 01F3 _ 48: 89. C1
        mov     r9, qword [rel .refptr.SquareBB]        ; 01F6 _ 4C: 8B. 0D, 00000000(rel)
        mov     qword [rsp+70H], rax                    ; 01FD _ 48: 89. 44 24, 70
        mov     r10, r11                                ; 0202 _ 4D: 89. DA
        shr     r8, 8                                   ; 0205 _ 49: C1. E8, 08
        mov     rdi, qword [rel .refptr.SquareBB]       ; 0209 _ 48: 8B. 3D, 00000000(rel)
        mov     rax, qword 0FFFF0000000000H             ; 0210 _ 48: B8, 00FFFF0000000000
        and     r10, r15                                ; 021A _ 4D: 21. FA
        or      r8, 0FFFF00H                            ; 021D _ 49: 81. C8, 00FFFF00
        shl     rcx, 8                                  ; 0224 _ 48: C1. E1, 08
        mov     r12, r10                                ; 0228 _ 4D: 89. D4
        mov     r14, rbp                                ; 022B _ 49: 89. EE
        or      rax, rcx                                ; 022E _ 48: 09. C8
        mov     qword [rsp+178H], r10                   ; 0231 _ 4C: 89. 94 24, 00000178
        and     r8, r12                                 ; 0239 _ 4D: 21. E0
        mov     r12, qword [rsp+110H]                   ; 023C _ 4C: 8B. A4 24, 00000110
        and     r14, r15                                ; 0244 _ 4D: 21. FE
        mov     rsi, r14                                ; 0247 _ 4C: 89. F6
        mov     r10, qword [rsp+48H]                    ; 024A _ 4C: 8B. 54 24, 48
        mov     qword [rsp+180H], r14                   ; 024F _ 4C: 89. B4 24, 00000180
        bsf     rdx, r10                                ; 0257 _ 49: 0F BC. D2
        and     rax, rsi                                ; 025B _ 48: 21. F0
        or      r8, qword [rsp+40H]                     ; 025E _ 4C: 0B. 44 24, 40
        or      r8, qword [r9+rdx*8]                    ; 0263 _ 4D: 0B. 04 D1
        and     r12, rbp                                ; 0267 _ 49: 21. EC
        mov     rsi, rax                                ; 026A _ 48: 89. C6
        bsf     r14, r12                                ; 026D _ 4D: 0F BC. F4
        or      rsi, qword [rsp+38H]                    ; 0271 _ 48: 0B. 74 24, 38
        mov     qword [rsp+90H], r12                    ; 0276 _ 4C: 89. A4 24, 00000090
        xor     eax, eax                                ; 027E _ 31. C0
        or      rsi, qword [rdi+r14*8]                  ; 0280 _ 4A: 0B. 34 F7
        mov     edx, dword [rel _ZN12_GLOBAL__N_1L15MinorBehindPawnE]; 0284 _ 8B. 15, 00000824(rel)
        not     r8                                      ; 028A _ 49: F7. D0
        mov     r9, qword [rbx+110H]                    ; 028D _ 4C: 8B. 8B, 00000110
        mov     qword [rsp+0A8H], r8                    ; 0294 _ 4C: 89. 84 24, 000000A8
        mov     r8, r11                                 ; 029C _ 4D: 89. D8
        mov     r12, qword [rsp+140H]                   ; 029F _ 4C: 8B. A4 24, 00000140
        not     rsi                                     ; 02A7 _ 48: F7. D6
        mov     dword [rsp+10CH], edx                   ; 02AA _ 89. 94 24, 0000010C
        mov     rdx, r11                                ; 02B1 _ 4C: 89. DA
        bsf     r14, r10                                ; 02B4 _ 4D: 0F BC. F2
        shl     r14, 6                                  ; 02B8 _ 49: C1. E6, 06
        and     r8, r9                                  ; 02BC _ 4D: 21. C8
        mov     qword [rsp+30H], r12                    ; 02BF _ 4C: 89. 64 24, 30
        not     rdx                                     ; 02C4 _ 48: F7. D2
        mov     qword [rsp+0A0H], rsi                   ; 02C7 _ 48: 89. B4 24, 000000A0
        mov     qword [rsp+50H], r14                    ; 02CF _ 4C: 89. 74 24, 50
?_098:  test    r8, r8                                  ; 02D4 _ 4D: 85. C0
        je      ?_104                                   ; 02D7 _ 0F 84, 000000D1
        mov     rcx, qword [r13+38H]                    ; 02DD _ 49: 8B. 4D, 38
        lea     rdi, [rel _ZN12_GLOBAL__N_1L13MobilityBonusE]; 02E1 _ 48: 8D. 3D, 00000940(rel)
        mov     qword [rsp+58H], rdx                    ; 02E8 _ 48: 89. 54 24, 58
        mov     r14, qword [rsp+98H]                    ; 02ED _ 4C: 8B. B4 24, 00000098
        andn    r11, rcx, qword [rel ?_296]             ; 02F5 _ C4 62 F0: F2. 1D, 00000080(rel)
        mov     rsi, r11                                ; 02FE _ 4C: 89. DE
        and     rsi, rdx                                ; 0301 _ 48: 21. D6
        mov     qword [rsp+28H], rsi                    ; 0304 _ 48: 89. 74 24, 28
?_099:  mov     r12, qword [rel .refptr.SquareBB]       ; 0309 _ 4C: 8B. 25, 00000000(rel)
        bsf     rcx, r8                                 ; 0310 _ 49: 0F BC. C8
        mov     rdx, qword [rel .refptr.StepAttacksBB]  ; 0314 _ 48: 8B. 15, 00000000(rel)
        blsr    r8, r8                                  ; 031B _ C4 C2 B8: F3. C8
        mov     rsi, qword [r12+rcx*8]                  ; 0320 _ 49: 8B. 34 CC
        test    qword [rsp+68H], rsi                    ; 0324 _ 48: 85. 74 24, 68
        mov     rdx, qword [rdx+rcx*8+400H]             ; 0329 _ 48: 8B. 94 CA, 00000400
        jne     ?_282                                   ; 0331 _ 0F 85, 00002428
?_100:  or      r14, rdx                                ; 0337 _ 49: 09. D6
        or      qword [rsp+30H], r14                    ; 033A _ 4C: 09. 74 24, 30
        test    qword [rsp+88H], rdx                    ; 033F _ 48: 85. 94 24, 00000088
        jne     ?_203                                   ; 0347 _ 0F 85, 00001793
?_101:  mov     r10, qword [rsp+0A8H]                   ; 034D _ 4C: 8B. 94 24, 000000A8
        and     r10, rdx                                ; 0355 _ 49: 21. D2
        popcnt  r12, r10                                ; 0358 _ F3 4D: 0F B8. E2
        add     eax, dword [rdi+r12*4+100H]             ; 035D _ 42: 03. 84 A7, 00000100
        test    rsi, r11                                ; 0365 _ 4C: 85. DE
        jne     ?_232                                   ; 0368 _ 0F 85, 00001DA2
        and     rdx, qword [rsp+28H]                    ; 036E _ 48: 23. 54 24, 28
        jne     ?_164                                   ; 0373 _ 0F 85, 00000F67
?_102:  mov     r10, rcx                                ; 0379 _ 49: 89. CA
        shr     r10, 3                                  ; 037C _ 49: C1. EA, 03
        cmp     r10d, 3                                 ; 0380 _ 41: 83. FA, 03
        ja      ?_103                                   ; 0384 _ 77, 17
        mov     r12, qword [rel .refptr.SquareBB]       ; 0386 _ 4C: 8B. 25, 00000000(rel)
        add     ecx, 8                                  ; 038D _ 83. C1, 08
        movsxd  rcx, ecx                                ; 0390 _ 48: 63. C9
        test    qword [r12+rcx*8], r15                  ; 0393 _ 4D: 85. 3C CC
        jne     ?_246                                   ; 0397 _ 0F 85, 00001FB3
?_103:  test    r8, r8                                  ; 039D _ 4D: 85. C0
        jne     ?_099                                   ; 03A0 _ 0F 85, FFFFFF63
        mov     qword [rsp+98H], r14                    ; 03A6 _ 4C: 89. B4 24, 00000098
?_104:  mov     r11, qword [rsp+148H]                   ; 03AE _ 4C: 8B. 9C 24, 00000148
        mov     rcx, rbp                                ; 03B6 _ 48: 89. E9
        and     r9, rbp                                 ; 03B9 _ 49: 21. E9
        xor     edx, edx                                ; 03BC _ 31. D2
        bsf     rdi, qword [rsp+90H]                    ; 03BE _ 48: 0F BC. BC 24, 00000090
        shl     rdi, 6                                  ; 03C7 _ 48: C1. E7, 06
        not     rcx                                     ; 03CB _ 48: F7. D1
        mov     dword [rsp+150H], 0                     ; 03CE _ C7. 84 24, 00000150, 00000000
        mov     dword [rsp+130H], 0                     ; 03D9 _ C7. 84 24, 00000130, 00000000
        mov     qword [rsp+28H], r11                    ; 03E4 _ 4C: 89. 5C 24, 28
        mov     qword [rsp+0B8H], 0                     ; 03E9 _ 48: C7. 84 24, 000000B8, 00000000
        mov     dword [rsp+134H], 0                     ; 03F5 _ C7. 84 24, 00000134, 00000000
        mov     qword [rsp+58H], rdi                    ; 0400 _ 48: 89. 7C 24, 58
?_105:  test    r9, r9                                  ; 0405 _ 4D: 85. C9
        jne     ?_173                                   ; 0408 _ 0F 85, 00001082
?_106:  mov     r11d, dword [rel _ZN12_GLOBAL__N_1L11BishopPawnsE]; 040E _ 44: 8B. 1D, 00000820(rel)
        mov     qword [rsp+58H], 0                      ; 0415 _ 48: C7. 44 24, 58, 00000000
        mov     r8, qword [rbx+128H]                    ; 041E _ 4C: 8B. 83, 00000128
        mov     dword [rsp+104H], 0                     ; 0425 _ C7. 84 24, 00000104, 00000000
        mov     r14, qword [rsp+78H]                    ; 0430 _ 4C: 8B. 74 24, 78
        mov     r12, qword [rsp+70H]                    ; 0435 _ 4C: 8B. 64 24, 70
        mov     dword [rsp+0E0H], r11d                  ; 043A _ 44: 89. 9C 24, 000000E0
        mov     r11d, dword [rel _ZN12_GLOBAL__N_1L17TrappedBishopA1H1E]; 0442 _ 44: 8B. 1D, 00000800(rel)
        mov     rcx, qword [rbx+118H]                   ; 0449 _ 48: 8B. 8B, 00000118
        mov     r10, r8                                 ; 0450 _ 4D: 89. C2
        mov     qword [rsp+0C0H], r8                    ; 0453 _ 4C: 89. 84 24, 000000C0
        and     r10, r14                                ; 045B _ 4D: 21. F2
        mov     r9, r14                                 ; 045E _ 4D: 89. F1
        not     r14                                     ; 0461 _ 49: F7. D6
        xor     r12, r10                                ; 0464 _ 4D: 31. D4
        mov     qword [rsp+138H], r14                   ; 0467 _ 4C: 89. B4 24, 00000138
        lea     edi, [r11*4]                            ; 046F _ 42: 8D. 3C 9D, 00000000
        mov     qword [rsp+50H], r12                    ; 0477 _ 4C: 89. 64 24, 50
        mov     dword [rsp+190H], edi                   ; 047C _ 89. BC 24, 00000190
        lea     esi, [r11+r11]                          ; 0483 _ 43: 8D. 34 1B
        and     r9, rcx                                 ; 0487 _ 49: 21. C9
        bsf     rdi, qword [rsp+48H]                    ; 048A _ 48: 0F BC. 7C 24, 48
        shl     rdi, 6                                  ; 0490 _ 48: C1. E7, 06
        mov     dword [rsp+188H], esi                   ; 0494 _ 89. B4 24, 00000188
        mov     qword [rsp+170H], rdi                   ; 049B _ 48: 89. BC 24, 00000170
        mov     qword [rsp+160H], r10                   ; 04A3 _ 4C: 89. 94 24, 00000160
        test    r9, r9                                  ; 04AB _ 4D: 85. C9
        jne     ?_158                                   ; 04AE _ 0F 85, 00000CAD
        mov     r9, qword [rsp+0C0H]                    ; 04B4 _ 4C: 8B. 8C 24, 000000C0
        and     r9, qword [rsp+78H]                     ; 04BC _ 4C: 23. 4C 24, 78
        mov     qword [rsp+128H], r9                    ; 04C1 _ 4C: 89. 8C 24, 00000128
?_107:  mov     rdi, qword [rsp+70H]                    ; 04C9 _ 48: 8B. 7C 24, 70
        mov     rsi, rbp                                ; 04CE _ 48: 89. EE
        and     rcx, rbp                                ; 04D1 _ 48: 21. E9
        xor     r14d, r14d                              ; 04D4 _ 45: 31. F6
        lea     r10d, [r11+r11]                         ; 04D7 _ 47: 8D. 14 1B
        not     rsi                                     ; 04DB _ 48: F7. D6
        mov     qword [rsp+50H], 0                      ; 04DE _ 48: C7. 44 24, 50, 00000000
        lea     r12d, [r11*4]                           ; 04E7 _ 46: 8D. 24 9D, 00000000
        mov     dword [rsp+188H], r10d                  ; 04EF _ 44: 89. 94 24, 00000188
        mov     dword [rsp+190H], r12d                  ; 04F7 _ 44: 89. A4 24, 00000190
        mov     r12, qword [rsp+0C0H]                   ; 04FF _ 4C: 8B. A4 24, 000000C0
        bsf     r8, qword [rsp+90H]                     ; 0507 _ 4C: 0F BC. 84 24, 00000090
        shl     r8, 6                                   ; 0510 _ 49: C1. E0, 06
        mov     qword [rsp+138H], rsi                   ; 0514 _ 48: 89. B4 24, 00000138
        mov     qword [rsp+170H], r8                    ; 051C _ 4C: 89. 84 24, 00000170
        and     r12, rbp                                ; 0524 _ 49: 21. EC
        mov     dword [rsp+194H], r11d                  ; 0527 _ 44: 89. 9C 24, 00000194
        xor     rdi, r12                                ; 052F _ 4C: 31. E7
        test    rcx, rcx                                ; 0532 _ 48: 85. C9
        jne     ?_167                                   ; 0535 _ 0F 85, 00000E05
        mov     r15, qword [rsp+0C0H]                   ; 053B _ 4C: 8B. BC 24, 000000C0
        and     r15, rbp                                ; 0543 _ 49: 21. EF
        mov     qword [rsp+120H], r15                   ; 0546 _ 4C: 89. BC 24, 00000120
?_108:  mov     rdi, qword [rsp+78H]                    ; 054E _ 48: 8B. 7C 24, 78
        mov     rcx, qword [rbx+120H]                   ; 0553 _ 48: 8B. 8B, 00000120
        mov     r10, rdi                                ; 055A _ 49: 89. FA
        and     r10, rcx                                ; 055D _ 49: 21. CA
        je      ?_181                                   ; 0560 _ 0F 84, 0000103A
        mov     r12, qword [rsp+0C0H]                   ; 0566 _ 4C: 8B. A4 24, 000000C0
        mov     dword [rsp+160H], edx                   ; 056E _ 89. 94 24, 00000160
        lea     r11, [rel _ZN12_GLOBAL__N_1L13MobilityBonusE]; 0575 _ 4C: 8D. 1D, 00000940(rel)
        mov     esi, dword [rel _ZN12_GLOBAL__N_1L10RookOnPawnE]; 057C _ 8B. 35, 0000081C(rel)
        mov     dword [rsp+10CH], 0                     ; 0582 _ C7. 84 24, 0000010C, 00000000
        mov     r9d, dword [rel _ZN12_GLOBAL__N_1L11TrappedRookE]; 058D _ 44: 8B. 0D, 00000818(rel)
        mov     qword [rsp+168H], rcx                   ; 0594 _ 48: 89. 8C 24, 00000168
        mov     r15d, dword [r13+60H]                   ; 059C _ 45: 8B. 7D, 60
        mov     qword [rsp+170H], rbx                   ; 05A0 _ 48: 89. 9C 24, 00000170
        or      r12, rcx                                ; 05A8 _ 49: 09. CC
        and     r12, rdi                                ; 05AB _ 49: 21. FC
        xor     r12, qword [rsp+70H]                    ; 05AE _ 4C: 33. 64 24, 70
        mov     dword [rsp+1A8H], esi                   ; 05B3 _ 89. B4 24, 000001A8
        mov     dword [rsp+198H], r9d                   ; 05BA _ 44: 89. 8C 24, 00000198
        mov     rsi, qword [rsp+48H]                    ; 05C2 _ 48: 8B. 74 24, 48
        bsf     r9, rsi                                 ; 05C7 _ 4C: 0F BC. CE
        bsf     rdi, rsi                                ; 05CB _ 48: 0F BC. FE
        mov     qword [rsp+138H], r12                   ; 05CF _ 4C: 89. A4 24, 00000138
        shl     rdi, 6                                  ; 05D7 _ 48: C1. E7, 06
        mov     r12, qword [rel .refptr.RookAttacks]    ; 05DB _ 4C: 8B. 25, 00000000(rel)
        mov     qword [rsp+188H], r9                    ; 05E2 _ 4C: 89. 8C 24, 00000188
        and     r9d, 07H                                ; 05EA _ 41: 83. E1, 07
        mov     qword [rsp+1A0H], rdi                   ; 05EE _ 48: 89. BC 24, 000001A0
        lea     esi, [r9+1H]                            ; 05F6 _ 41: 8D. 71, 01
        mov     edi, 1                                  ; 05FA _ BF, 00000001
        mov     dword [rsp+0E0H], r15d                  ; 05FF _ 44: 89. BC 24, 000000E0
; Note: Prefix bit or byte has no meaning in this context
        shlx    r8d, edi, esi                           ; 0607 _ C4 62 49: F7. C7
        xor     r15d, r15d                              ; 060C _ 45: 31. FF
        neg     r8d                                     ; 060F _ 41: F7. D8
        mov     dword [rsp+190H], r9d                   ; 0612 _ 44: 89. 8C 24, 00000190
        mov     rdx, r15                                ; 061A _ 4C: 89. FA
        mov     dword [rsp+194H], r8d                   ; 061D _ 44: 89. 84 24, 00000194
?_109:  mov     rbx, qword [rel .refptr.RookMasks]      ; 0625 _ 48: 8B. 1D, 00000000(rel)
        mov     rcx, qword [rsp+138H]                   ; 062C _ 48: 8B. 8C 24, 00000138
        bsf     r8, r10                                 ; 0634 _ 4D: 0F BC. C2
        mov     rsi, qword [r12+r8*8]                   ; 0638 _ 4B: 8B. 34 C4
        blsr    r10, r10                                ; 063C _ C4 C2 A8: F3. CA
        lea     r15, [r8*8]                             ; 0641 _ 4E: 8D. 3C C5, 00000000
        pext    r9, rcx, qword [rbx+r8*8]               ; 0649 _ C4 22 F2: F5. 0C C3
        mov     ebx, r9d                                ; 064F _ 44: 89. CB
        mov     rcx, qword [rsp+68H]                    ; 0652 _ 48: 8B. 4C 24, 68
        mov     r9, qword [rsi+rbx*8]                   ; 0657 _ 4C: 8B. 0C DE
        mov     rbx, qword [rel .refptr.SquareBB]       ; 065B _ 48: 8B. 1D, 00000000(rel)
        test    qword [rbx+r8*8], rcx                   ; 0662 _ 4A: 85. 0C C3
        jne     ?_287                                   ; 0666 _ 0F 85, 00002172
?_110:  or      rdx, r9                                 ; 066C _ 4C: 09. CA
        or      qword [rsp+30H], rdx                    ; 066F _ 48: 09. 54 24, 30
        test    qword [rsp+88H], r9                     ; 0674 _ 4C: 85. 8C 24, 00000088
        jne     ?_233                                   ; 067C _ 0F 85, 00001AB1
?_111:  and     r9, qword [rsp+0A8H]                    ; 0682 _ 4C: 23. 8C 24, 000000A8
        mov     rsi, r8                                 ; 068A _ 4C: 89. C6
        shr     rsi, 3                                  ; 068D _ 48: C1. EE, 03
        popcnt  r9, r9                                  ; 0691 _ F3 4D: 0F B8. C9
        add     eax, dword [r11+r9*4+200H]              ; 0696 _ 43: 03. 84 8B, 00000200
        cmp     esi, 3                                  ; 069E _ 83. FE, 03
        ja      ?_250                                   ; 06A1 _ 0F 87, 00001D3B
?_112:  and     r8d, 07H                                ; 06A7 _ 41: 83. E0, 07
; Note: Prefix bit or byte has no meaning in this context
        shlx    ecx, edi, r8d                           ; 06AB _ C4 E2 39: F7. CF
        test    dword [rsp+0E0H], ecx                   ; 06B0 _ 85. 8C 24, 000000E0
        jne     ?_165                                   ; 06B7 _ 0F 85, 00000C46
        cmp     r9d, 3                                  ; 06BD _ 41: 83. F9, 03
        jle     ?_200                                   ; 06C1 _ 0F 8E, 0000137A
?_113:  test    r10, r10                                ; 06C7 _ 4D: 85. D2
        jne     ?_109                                   ; 06CA _ 0F 85, FFFFFF55
        mov     qword [rsp+0E0H], rdx                   ; 06D0 _ 48: 89. 94 24, 000000E0
        mov     rcx, qword [rsp+168H]                   ; 06D8 _ 48: 8B. 8C 24, 00000168
        mov     edx, dword [rsp+160H]                   ; 06E0 _ 8B. 94 24, 00000160
        mov     rbx, qword [rsp+170H]                   ; 06E7 _ 48: 8B. 9C 24, 00000170
?_114:  mov     r10, rcx                                ; 06EF _ 49: 89. CA
        and     r10, rbp                                ; 06F2 _ 49: 21. EA
        je      ?_182                                   ; 06F5 _ 0F 84, 00000EC5
        mov     r11d, dword [r13+64H]                   ; 06FB _ 45: 8B. 5D, 64
        mov     edi, 1                                  ; 06FF _ BF, 00000001
        xor     r9d, r9d                                ; 0704 _ 45: 31. C9
        xor     r15d, r15d                              ; 0707 _ 45: 31. FF
        or      rcx, qword [rsp+0C0H]                   ; 070A _ 48: 0B. 8C 24, 000000C0
        mov     qword [rsp+168H], rbx                   ; 0712 _ 48: 89. 9C 24, 00000168
        mov     rbx, r9                                 ; 071A _ 4C: 89. CB
        mov     r12d, dword [rel _ZN12_GLOBAL__N_1L11TrappedRookE]; 071D _ 44: 8B. 25, 00000818(rel)
        mov     dword [rsp+0C0H], eax                   ; 0724 _ 89. 84 24, 000000C0
        mov     rsi, qword [rsp+90H]                    ; 072B _ 48: 8B. B4 24, 00000090
        mov     dword [rsp+160H], r14d                  ; 0733 _ 44: 89. B4 24, 00000160
        mov     dword [rsp+138H], r11d                  ; 073B _ 44: 89. 9C 24, 00000138
        and     rcx, rbp                                ; 0743 _ 48: 21. E9
        mov     ebp, dword [rel _ZN12_GLOBAL__N_1L10RookOnPawnE]; 0746 _ 8B. 2D, 0000081C(rel)
        bsf     r11, rsi                                ; 074C _ 4C: 0F BC. DE
        mov     dword [rsp+188H], r12d                  ; 0750 _ 44: 89. A4 24, 00000188
        xor     rcx, qword [rsp+70H]                    ; 0758 _ 48: 33. 4C 24, 70
        mov     qword [rsp+180H], r11                   ; 075D _ 4C: 89. 9C 24, 00000180
        mov     r12, qword [rel .refptr.RookAttacks]    ; 0765 _ 4C: 8B. 25, 00000000(rel)
        and     r11d, 07H                               ; 076C _ 41: 83. E3, 07
        bsf     r8, rsi                                 ; 0770 _ 4C: 0F BC. C6
        lea     esi, [r11+1H]                           ; 0774 _ 41: 8D. 73, 01
        shl     r8, 6                                   ; 0778 _ 49: C1. E0, 06
        mov     dword [rsp+194H], ebp                   ; 077C _ 89. AC 24, 00000194
        mov     qword [rsp+198H], r8                    ; 0783 _ 4C: 89. 84 24, 00000198
; Note: Prefix bit or byte has no meaning in this context
        shlx    r8d, edi, esi                           ; 078B _ C4 62 49: F7. C7
        neg     r8d                                     ; 0790 _ 41: F7. D8
        lea     rbp, [rel _ZN12_GLOBAL__N_1L13MobilityBonusE]; 0793 _ 48: 8D. 2D, 00000940(rel)
        mov     dword [rsp+170H], r11d                  ; 079A _ 44: 89. 9C 24, 00000170
        mov     dword [rsp+190H], r8d                   ; 07A2 _ 44: 89. 84 24, 00000190
?_115:  mov     r9, qword [rel .refptr.RookMasks]       ; 07AA _ 4C: 8B. 0D, 00000000(rel)
        bsf     rax, r10                                ; 07B1 _ 49: 0F BC. C2
        blsr    r10, r10                                ; 07B5 _ C4 C2 A8: F3. CA
        mov     r8, qword [r12+rax*8]                   ; 07BA _ 4D: 8B. 04 C4
        lea     r14, [rax*8]                            ; 07BE _ 4C: 8D. 34 C5, 00000000
        pext    r11, rcx, qword [r9+rax*8]              ; 07C6 _ C4 42 F2: F5. 1C C1
        mov     esi, r11d                               ; 07CC _ 44: 89. DE
        mov     r9, qword [rsp+60H]                     ; 07CF _ 4C: 8B. 4C 24, 60
        mov     r11, qword [rel .refptr.SquareBB]       ; 07D4 _ 4C: 8B. 1D, 00000000(rel)
        mov     r8, qword [r8+rsi*8]                    ; 07DB _ 4D: 8B. 04 F0
        test    qword [r11+rax*8], r9                   ; 07DF _ 4D: 85. 0C C3
        jne     ?_286                                   ; 07E3 _ 0F 85, 00001FD9
?_116:  or      rbx, r8                                 ; 07E9 _ 4C: 09. C3
        or      qword [rsp+28H], rbx                    ; 07EC _ 48: 09. 5C 24, 28
        test    qword [rsp+80H], r8                     ; 07F1 _ 4C: 85. 84 24, 00000080
        jne     ?_239                                   ; 07F9 _ 0F 85, 00001A11
?_117:  and     r8, qword [rsp+0A0H]                    ; 07FF _ 4C: 23. 84 24, 000000A0
        mov     r9, rax                                 ; 0807 _ 49: 89. C1
        shr     r9, 3                                   ; 080A _ 49: C1. E9, 03
        mov     esi, r9d                                ; 080E _ 44: 89. CE
        xor     esi, 07H                                ; 0811 _ 83. F6, 07
        popcnt  r8, r8                                  ; 0814 _ F3 4D: 0F B8. C0
        add     edx, dword [rbp+r8*4+200H]              ; 0819 _ 42: 03. 94 85, 00000200
        cmp     esi, 3                                  ; 0821 _ 83. FE, 03
        ja      ?_240                                   ; 0824 _ 0F 87, 00001A19
?_118:  and     eax, 07H                                ; 082A _ 83. E0, 07
; Note: Prefix bit or byte has no meaning in this context
        shlx    r14d, edi, eax                          ; 082D _ C4 62 79: F7. F7
        test    dword [rsp+138H], r14d                  ; 0832 _ 44: 85. B4 24, 00000138
        jne     ?_166                                   ; 083A _ 0F 85, 00000AE4
        cmp     r8d, 3                                  ; 0840 _ 41: 83. F8, 03
        jle     ?_183                                   ; 0844 _ 0F 8E, 00000D8A
?_119:  test    r10, r10                                ; 084A _ 4D: 85. D2
        jne     ?_115                                   ; 084D _ 0F 85, FFFFFF57
        mov     eax, dword [rsp+0C0H]                   ; 0853 _ 8B. 84 24, 000000C0
        mov     qword [rsp+0C0H], rbx                   ; 085A _ 48: 89. 9C 24, 000000C0
        mov     r14d, dword [rsp+160H]                  ; 0862 _ 44: 8B. B4 24, 00000160
        mov     rbx, qword [rsp+168H]                   ; 086A _ 48: 8B. 9C 24, 00000168
?_120:  xor     edi, edi                                ; 0872 _ 31. FF
        cmp     qword [rsp+128H], 0                     ; 0874 _ 48: 83. BC 24, 00000128, 00
        jne     ?_192                                   ; 087D _ 0F 85, 00000F2D
?_121:  xor     esi, esi                                ; 0883 _ 31. F6
        cmp     qword [rsp+120H], 0                     ; 0885 _ 48: 83. BC 24, 00000120, 00
        jne     ?_188                                   ; 088E _ 0F 85, 00000E2E
?_122:  sub     eax, edx                                ; 0894 _ 29. D0
        mov     edx, dword [rsp+10CH]                   ; 0896 _ 8B. 94 24, 0000010C
        mov     ebp, dword [rsp+134H]                   ; 089D _ 8B. AC 24, 00000134
        mov     r10d, dword [rsp+118H]                  ; 08A4 _ 44: 8B. 94 24, 00000118
        sub     edx, r15d                               ; 08AC _ 44: 29. FA
        sub     r14d, edx                               ; 08AF _ 41: 29. D6
        mov     r15d, r14d                              ; 08B2 _ 45: 89. F7
        mov     r14d, dword [rsp+104H]                  ; 08B5 _ 44: 8B. B4 24, 00000104
        sub     r14d, r15d                              ; 08BD _ 45: 29. FE
        sub     ebp, r14d                               ; 08C0 _ 44: 29. F5
        sub     r10d, ebp                               ; 08C3 _ 41: 29. EA
        add     r10d, dword [rsp+154H]                  ; 08C6 _ 44: 03. 94 24, 00000154
        bsf     r14, qword [rsp+90H]                    ; 08CE _ 4C: 0F BC. B4 24, 00000090
        add     eax, r10d                               ; 08D7 _ 44: 01. D0
        cmp     qword [r13+48H], r14                    ; 08DA _ 4D: 39. 75, 48
        mov     dword [rsp+80H], eax                    ; 08DE _ 89. 84 24, 00000080
        jne     ?_198                                   ; 08E5 _ 0F 85, 000010F5
        mov     rax, qword [rsp+158H]                   ; 08EB _ 48: 8B. 84 24, 00000158
        mov     r8d, dword [rax+18H]                    ; 08F3 _ 44: 8B. 40, 18
        and     r8d, 0CH                                ; 08F7 _ 41: 83. E0, 0C
        cmp     dword [r13+5CH], r8d                    ; 08FB _ 45: 39. 45, 5C
        jne     ?_198                                   ; 08FF _ 0F 85, 000010DB
        mov     rcx, qword [rsp+110H]                   ; 0905 _ 48: 8B. 8C 24, 00000110
        mov     ebp, dword [r13+54H]                    ; 090D _ 41: 8B. 6D, 54
        mov     r15, qword [rsp+78H]                    ; 0911 _ 4C: 8B. 7C 24, 78
        mov     qword [rsp+88H], rcx                    ; 0916 _ 48: 89. 8C 24, 00000088
?_123:  mov     r12d, dword [rsp+0F0H]                  ; 091E _ 44: 8B. A4 24, 000000F0
        test    r12d, r12d                              ; 0926 _ 45: 85. E4
        je      ?_129                                   ; 0929 _ 0F 84, 00000196
        mov     r11d, dword [rsp+108H]                  ; 092F _ 44: 8B. 9C 24, 00000108
        mov     r8d, 72                                 ; 0937 _ 41: B8, 00000048
        mov     r10, qword [rsp+0B8H]                   ; 093D _ 4C: 8B. 94 24, 000000B8
        or      r10, qword [rsp+40H]                    ; 0945 _ 4C: 0B. 54 24, 40
        or      r10, qword [rsp+50H]                    ; 094A _ 4C: 0B. 54 24, 50
        or      r10, qword [rsp+0C0H]                   ; 094F _ 4C: 0B. 94 24, 000000C0
        imul    r11d, r12d                              ; 0957 _ 45: 0F AF. DC
        mov     r9, qword [rsp+30H]                     ; 095B _ 4C: 8B. 4C 24, 30
        and     r9, qword [rsp+0B0H]                    ; 0960 _ 4C: 23. 8C 24, 000000B0
        mov     ecx, dword [rsp+11CH]                   ; 0968 _ 8B. 8C 24, 0000011C
        or      r10, rsi                                ; 096F _ 49: 09. F2
        andn    rax, r10, r9                            ; 0972 _ C4 C2 A8: F2. C1
        cmp     r11d, 72                                ; 0977 _ 41: 83. FB, 48
        cmovge  r11d, r8d                               ; 097B _ 45: 0F 4D. D8
        popcnt  r12, rax                                ; 097F _ F3 4C: 0F B8. E0
        lea     edx, [rcx+rcx*8]                        ; 0984 _ 8D. 14 C9
        lea     r9d, [r12+r12*2]                        ; 0987 _ 47: 8D. 0C 64
        add     r11d, edx                               ; 098B _ 41: 01. D3
        lea     r10d, [r9+r9*8]                         ; 098E _ 47: 8D. 14 C9
        lea     r9d, [rbp+8000H]                        ; 0992 _ 44: 8D. 8D, 00008000
        add     r10d, r11d                              ; 0999 _ 45: 01. DA
        cmp     qword [rsp+60H], 1                      ; 099C _ 48: 83. 7C 24, 60, 01
        mov     r11, r15                                ; 09A2 _ 4D: 89. FB
        sbb     edx, edx                                ; 09A5 _ 19. D2
        and     r11, qword [rbx+128H]                   ; 09A7 _ 4C: 23. 9B, 00000128
        not     edx                                     ; 09AE _ F7. D2
        and     edx, 0BH                                ; 09B0 _ 83. E2, 0B
        add     edx, r10d                               ; 09B3 _ 44: 01. D2
        popcnt  r8, r11                                 ; 09B6 _ F3 4D: 0F B8. C3
        cmp     r8d, 1                                  ; 09BB _ 41: 83. F8, 01
        sbb     r12d, r12d                              ; 09BF _ 45: 19. E4
        sar     r9d, 16                                 ; 09C2 _ 41: C1. F9, 10
        lea     ecx, [r9+7H]                            ; 09C6 _ 41: 8D. 49, 07
        and     r12d, 40H                               ; 09CA _ 41: 83. E4, 40
        sub     edx, r12d                               ; 09CE _ 44: 29. E2
        test    r9d, r9d                                ; 09D1 _ 45: 85. C9
        cmovns  ecx, r9d                                ; 09D4 _ 41: 0F 49. C9
        and     rax, rdi                                ; 09D8 _ 48: 21. F8
        andn    rax, r15, rax                           ; 09DB _ C4 E2 80: F2. C0
        sar     ecx, 3                                  ; 09E0 _ C1. F9, 03
        sub     edx, ecx                                ; 09E3 _ 29. CA
        test    rax, rax                                ; 09E5 _ 48: 85. C0
        jne     ?_223                                   ; 09E8 _ 0F 85, 000014D5
?_124:  mov     r12, qword [rbx+100H]                   ; 09EE _ 4C: 8B. A3, 00000100
        lea     r9, [r14*8]                             ; 09F5 _ 4E: 8D. 0C F5, 00000000
        mov     rcx, qword [rel .refptr.RookMasks]      ; 09FD _ 48: 8B. 0D, 00000000(rel)
        mov     r8, qword [rel .refptr.RookAttacks]     ; 0A04 _ 4C: 8B. 05, 00000000(rel)
        mov     rax, qword [rsp+28H]                    ; 0A0B _ 48: 8B. 44 24, 28
        pext    r10, r12, qword [rcx+r14*8]             ; 0A10 _ C4 22 9A: F5. 14 F1
        mov     r11d, r10d                              ; 0A16 _ 45: 89. D3
        mov     r10, qword [rel .refptr.BishopMasks]    ; 0A19 _ 4C: 8B. 15, 00000000(rel)
        mov     rcx, qword [r8+r14*8]                   ; 0A20 _ 4B: 8B. 0C F0
        or      rax, r15                                ; 0A24 _ 4C: 09. F8
        not     rax                                     ; 0A27 _ 48: F7. D0
        pext    r12, r12, qword [r10+r14*8]             ; 0A2A _ C4 02 9A: F5. 24 F2
        mov     r10, qword [rel .refptr.BishopAttacks]  ; 0A30 _ 4C: 8B. 15, 00000000(rel)
        mov     r8, qword [rcx+r11*8]                   ; 0A37 _ 4E: 8B. 04 D9
        mov     ecx, r12d                               ; 0A3B _ 44: 89. E1
        mov     r11, qword [rsp+0E0H]                   ; 0A3E _ 4C: 8B. 9C 24, 000000E0
        mov     r14, qword [r10+r14*8]                  ; 0A46 _ 4F: 8B. 34 F2
        mov     r10, qword [rsp+58H]                    ; 0A4A _ 4C: 8B. 54 24, 58
        and     r11, rax                                ; 0A4F _ 49: 21. C3
        mov     rcx, qword [r14+rcx*8]                  ; 0A52 _ 49: 8B. 0C CE
        mov     r14, rax                                ; 0A56 _ 49: 89. C6
        and     r14, rdi                                ; 0A59 _ 49: 21. FE
        and     r10, rax                                ; 0A5C _ 49: 21. C2
        mov     r12, rcx                                ; 0A5F _ 49: 89. CC
        or      r12, r8                                 ; 0A62 _ 4D: 09. C4
        test    r14, r12                                ; 0A65 _ 4D: 85. E6
        jne     ?_236                                   ; 0A68 _ 0F 85, 00001752
?_125:  test    r11, r8                                 ; 0A6E _ 4D: 85. C3
        jne     ?_265                                   ; 0A71 _ 0F 85, 00001B09
?_126:  test    r10, rcx                                ; 0A77 _ 49: 85. CA
        jne     ?_264                                   ; 0A7A _ 0F 85, 00001AF1
?_127:  mov     r8, qword [rel .refptr.StepAttacksBB]   ; 0A80 _ 4C: 8B. 05, 00000000(rel)
        mov     r11, qword [rsp+98H]                    ; 0A87 _ 4C: 8B. 9C 24, 00000098
        and     r11, qword [r9+r8+400H]                 ; 0A8F _ 4F: 23. 9C 01, 00000400
        test    r11, rax                                ; 0A97 _ 49: 85. C3
        jne     ?_260                                   ; 0A9A _ 0F 85, 00001A83
?_128:  lea     r9, [rel _ZN12_GLOBAL__N_110KingDangerE]; 0AA0 _ 4C: 8D. 0D, 00000000(rel)
        test    edx, edx                                ; 0AA7 _ 85. D2
        mov     eax, 0                                  ; 0AA9 _ B8, 00000000
        cmovs   edx, eax                                ; 0AAE _ 0F 48. D0
; Note: Length-changing prefix causes delay on Intel processors
        mov     ax, 399                                 ; 0AB1 _ 66: B8, 018F
        cmp     edx, 399                                ; 0AB5 _ 81. FA, 0000018F
        cmovg   edx, eax                                ; 0ABB _ 0F 4F. D0
        movsxd  rdx, edx                                ; 0ABE _ 48: 63. D2
        sub     ebp, dword [r9+rdx*4]                   ; 0AC1 _ 41: 2B. 2C 91
?_129:  bsf     r12, qword [rsp+48H]                    ; 0AC5 _ 4C: 0F BC. 64 24, 48
        cmp     qword [r13+40H], r12                    ; 0ACB _ 4D: 39. 65, 40
        jne     ?_217                                   ; 0ACF _ 0F 85, 000012EB
        mov     rcx, qword [rbx+3B8H]                   ; 0AD5 _ 48: 8B. 8B, 000003B8
        mov     r10d, dword [rcx+18H]                   ; 0ADC _ 44: 8B. 51, 18
        mov     qword [rsp+70H], rcx                    ; 0AE0 _ 48: 89. 4C 24, 70
        mov     dword [rsp+60H], r10d                   ; 0AE5 _ 44: 89. 54 24, 60
        and     r10d, 03H                               ; 0AEA _ 41: 83. E2, 03
        cmp     dword [r13+58H], r10d                   ; 0AEE _ 45: 39. 55, 58
        jne     ?_217                                   ; 0AF2 _ 0F 85, 000012C8
        mov     r9d, dword [r13+50H]                    ; 0AF8 _ 45: 8B. 4D, 50
?_130:  mov     r8d, dword [rsp+0D0H]                   ; 0AFC _ 44: 8B. 84 24, 000000D0
        test    r8d, r8d                                ; 0B04 _ 45: 85. C0
        je      ?_186                                   ; 0B07 _ 0F 84, 00000B63
        mov     r11, qword [rsp+98H]                    ; 0B0D _ 4C: 8B. 9C 24, 00000098
        mov     edx, 72                                 ; 0B15 _ BA, 00000048
        or      r11, qword [rsp+38H]                    ; 0B1A _ 4C: 0B. 5C 24, 38
        or      r11, qword [rsp+58H]                    ; 0B1F _ 4C: 0B. 5C 24, 58
        or      r11, qword [rsp+0E0H]                   ; 0B24 _ 4C: 0B. 9C 24, 000000E0
        mov     eax, dword [rsp+130H]                   ; 0B2C _ 8B. 84 24, 00000130
        imul    eax, dword [rsp+0D0H]                   ; 0B33 _ 0F AF. 84 24, 000000D0
        mov     ecx, dword [rsp+150H]                   ; 0B3B _ 8B. 8C 24, 00000150
        or      rdi, r11                                ; 0B42 _ 4C: 09. DF
        andn    r10, rdi, qword [rsp+0E8H]              ; 0B45 _ C4 62 C0: F2. 94 24, 000000E8
        and     r10, qword [rsp+28H]                    ; 0B4F _ 4C: 23. 54 24, 28
        cmp     eax, 72                                 ; 0B54 _ 83. F8, 48
        cmovge  eax, edx                                ; 0B57 _ 0F 4D. C2
        mov     rdx, qword [rbx+148H]                   ; 0B5A _ 48: 8B. 93, 00000148
        lea     r8d, [rcx+rcx*8]                        ; 0B61 _ 44: 8D. 04 C9
        popcnt  r14, r10                                ; 0B65 _ F3 4D: 0F B8. F2
        lea     edi, [r14+r14*2]                        ; 0B6A _ 43: 8D. 3C 76
        add     eax, r8d                                ; 0B6E _ 44: 01. C0
        lea     r11d, [rdi+rdi*8]                       ; 0B71 _ 44: 8D. 1C FF
        lea     edi, [r9+8000H]                         ; 0B75 _ 41: 8D. B9, 00008000
        add     eax, r11d                               ; 0B7C _ 44: 01. D8
        cmp     qword [rsp+68H], 1                      ; 0B7F _ 48: 83. 7C 24, 68, 01
        sbb     ecx, ecx                                ; 0B85 _ 19. C9
        not     ecx                                     ; 0B87 _ F7. D1
        and     ecx, 0BH                                ; 0B89 _ 83. E1, 0B
        add     ecx, eax                                ; 0B8C _ 01. C1
        mov     rax, rdx                                ; 0B8E _ 48: 89. D0
        and     rax, qword [rbx+128H]                   ; 0B91 _ 48: 23. 83, 00000128
        popcnt  r14, rax                                ; 0B98 _ F3 4C: 0F B8. F0
        cmp     r14d, 1                                 ; 0B9D _ 41: 83. FE, 01
        sbb     r8d, r8d                                ; 0BA1 _ 45: 19. C0
        sar     edi, 16                                 ; 0BA4 _ C1. FF, 10
        lea     r11d, [rdi+7H]                          ; 0BA7 _ 44: 8D. 5F, 07
        and     r8d, 40H                                ; 0BAB _ 41: 83. E0, 40
        sub     ecx, r8d                                ; 0BAF _ 44: 29. C1
        test    edi, edi                                ; 0BB2 _ 85. FF
        cmovns  r11d, edi                               ; 0BB4 _ 44: 0F 49. DF
        andn    rax, rdx, rsi                           ; 0BB8 _ C4 E2 E8: F2. C6
        sar     r11d, 3                                 ; 0BBD _ 41: C1. FB, 03
        sub     ecx, r11d                               ; 0BC1 _ 44: 29. D9
        and     r10, rax                                ; 0BC4 _ 49: 21. C2
        jne     ?_242                                   ; 0BC7 _ 0F 85, 000016C3
?_131:  mov     rdi, qword [rbx+100H]                   ; 0BCD _ 48: 8B. BB, 00000100
        lea     r11, [r12*8]                            ; 0BD4 _ 4E: 8D. 1C E5, 00000000
        mov     r10, qword [rel .refptr.RookMasks]      ; 0BDC _ 4C: 8B. 15, 00000000(rel)
        mov     rax, qword [rsp+30H]                    ; 0BE3 _ 48: 8B. 44 24, 30
        mov     r14, rdi                                ; 0BE8 _ 49: 89. FE
        mov     qword [rsp+68H], rdi                    ; 0BEB _ 48: 89. 7C 24, 68
        pext    r8, rdi, qword [r10+r12*8]              ; 0BF0 _ C4 02 C2: F5. 04 E2
        mov     r10, qword [rel .refptr.RookAttacks]    ; 0BF6 _ 4C: 8B. 15, 00000000(rel)
        mov     edi, r8d                                ; 0BFD _ 44: 89. C7
        or      rax, rdx                                ; 0C00 _ 48: 09. D0
        not     rax                                     ; 0C03 _ 48: F7. D0
        and     rsi, rax                                ; 0C06 _ 48: 21. C6
        mov     r8, qword [r10+r12*8]                   ; 0C09 _ 4F: 8B. 04 E2
        mov     r10, qword [r8+rdi*8]                   ; 0C0D _ 4D: 8B. 14 F8
        mov     r8, qword [rel .refptr.BishopMasks]     ; 0C11 _ 4C: 8B. 05, 00000000(rel)
        mov     rdi, qword [rsp+0C0H]                   ; 0C18 _ 48: 8B. BC 24, 000000C0
        pext    r14, r14, qword [r8+r12*8]              ; 0C20 _ C4 02 8A: F5. 34 E0
        mov     r8d, r14d                               ; 0C26 _ 45: 89. F0
        mov     r14, qword [rel .refptr.BishopAttacks]  ; 0C29 _ 4C: 8B. 35, 00000000(rel)
        and     rdi, rax                                ; 0C30 _ 48: 21. C7
        mov     r12, qword [r14+r12*8]                  ; 0C33 _ 4F: 8B. 24 E6
        mov     r8, qword [r12+r8*8]                    ; 0C37 _ 4F: 8B. 04 C4
        mov     r12, qword [rsp+50H]                    ; 0C3B _ 4C: 8B. 64 24, 50
        mov     r14, r8                                 ; 0C40 _ 4D: 89. C6
        or      r14, r10                                ; 0C43 _ 4D: 09. D6
        and     r12, rax                                ; 0C46 _ 49: 21. C4
        test    r14, rsi                                ; 0C49 _ 49: 85. F6
        jne     ?_241                                   ; 0C4C _ 0F 85, 0000162E
?_132:  test    rdi, r10                                ; 0C52 _ 4C: 85. D7
        jne     ?_270                                   ; 0C55 _ 0F 85, 000019E0
?_133:  test    r12, r8                                 ; 0C5B _ 4D: 85. C4
        jne     ?_271                                   ; 0C5E _ 0F 85, 000019E6
?_134:  mov     rsi, qword [rel .refptr.StepAttacksBB]  ; 0C64 _ 48: 8B. 35, 00000000(rel)
        and     rax, qword [rsp+0B8H]                   ; 0C6B _ 48: 23. 84 24, 000000B8
        test    qword [r11+rsi+400H], rax               ; 0C73 _ 49: 85. 84 33, 00000400
        jne     ?_278                                   ; 0C7B _ 0F 85, 00001A84
?_135:  lea     r11, [rel _ZN12_GLOBAL__N_110KingDangerE]; 0C81 _ 4C: 8D. 1D, 00000000(rel)
        test    ecx, ecx                                ; 0C88 _ 85. C9
        mov     eax, 0                                  ; 0C8A _ B8, 00000000
        cmovs   ecx, eax                                ; 0C8F _ 0F 48. C8
; Note: Length-changing prefix causes delay on Intel processors
        mov     ax, 399                                 ; 0C92 _ 66: B8, 018F
        cmp     ecx, 399                                ; 0C96 _ 81. F9, 0000018F
        cmovg   ecx, eax                                ; 0C9C _ 0F 4F. C8
        movsxd  rcx, ecx                                ; 0C9F _ 48: 63. C9
        sub     r9d, dword [r11+rcx*4]                  ; 0CA2 _ 45: 2B. 0C 8B
?_136:  sub     r9d, ebp                                ; 0CA6 _ 41: 29. E9
        mov     rbp, qword [rbx+108H]                   ; 0CA9 _ 48: 8B. AB, 00000108
        mov     rax, r15                                ; 0CB0 _ 4C: 89. F8
        mov     r14d, dword [rsp+80H]                   ; 0CB3 _ 44: 8B. B4 24, 00000080
        mov     r10, qword [rsp+40H]                    ; 0CBB _ 4C: 8B. 54 24, 40
        and     rax, rbp                                ; 0CC0 _ 48: 21. E8
        mov     qword [rsp+60H], rax                    ; 0CC3 _ 48: 89. 44 24, 60
        xor     rax, r15                                ; 0CC8 _ 4C: 31. F8
        add     r14d, r9d                               ; 0CCB _ 45: 01. CE
        and     r10, rax                                ; 0CCE _ 49: 21. C2
        jne     ?_243                                   ; 0CD1 _ 0F 85, 000015F9
        mov     rdi, qword [rsp+30H]                    ; 0CD7 _ 48: 8B. 7C 24, 30
        and     rbp, rdx                                ; 0CDC _ 48: 21. D5
        xor     r11d, r11d                              ; 0CDF _ 45: 31. DB
        mov     r9, qword [rsp+28H]                     ; 0CE2 _ 4C: 8B. 4C 24, 28
        mov     r12, rbp                                ; 0CE7 _ 49: 89. EC
        not     rdi                                     ; 0CEA _ 48: F7. D7
        or      r9, rdi                                 ; 0CED _ 49: 09. F9
        mov     qword [rsp+80H], r9                     ; 0CF0 _ 4C: 89. 8C 24, 00000080
?_137:  mov     r8, qword [rsp+38H]                     ; 0CF8 _ 4C: 8B. 44 24, 38
        mov     rbp, qword [rsp+28H]                    ; 0CFD _ 48: 8B. 6C 24, 28
        mov     r10, r8                                 ; 0D02 _ 4D: 89. C2
        and     rax, r8                                 ; 0D05 _ 4C: 21. C0
        not     r10                                     ; 0D08 _ 49: F7. D2
        and     rbp, r10                                ; 0D0B _ 4C: 21. D5
        and     rbp, r15                                ; 0D0E _ 4C: 21. FD
        or      rax, rbp                                ; 0D11 _ 48: 09. E8
        jz      ?_141                                   ; 0D14 _ 74, 53
        mov     rsi, qword [rsp+50H]                    ; 0D16 _ 48: 8B. 74 24, 50
        or      rsi, qword [rsp+0B8H]                   ; 0D1B _ 48: 0B. B4 24, 000000B8
        and     rax, rsi                                ; 0D23 _ 48: 21. F0
        jne     ?_179                                   ; 0D26 _ 0F 85, 00000844
?_138:  mov     rax, r15                                ; 0D2C _ 4C: 89. F8
        and     rax, qword [rbx+128H]                   ; 0D2F _ 48: 23. 83, 00000128
        or      rax, rbp                                ; 0D36 _ 48: 09. E8
        and     rax, qword [rsp+0C0H]                   ; 0D39 _ 48: 23. 84 24, 000000C0
        jne     ?_206                                   ; 0D41 _ 0F 85, 00000DF9
?_139:  and     rdi, rbp                                ; 0D47 _ 48: 21. EF
        jz      ?_140                                   ; 0D4A _ 74, 0F
        popcnt  rdi, rdi                                ; 0D4C _ F3 48: 0F B8. FF
        imul    edi, dword [rel _ZN12_GLOBAL__N_1L7HangingE]; 0D51 _ 0F AF. 3D, 0000080C(rel)
        add     r11d, edi                               ; 0D58 _ 41: 01. FB
?_140:  and     rbp, qword [rsp+0B0H]                   ; 0D5B _ 48: 23. AC 24, 000000B0
        jne     ?_255                                   ; 0D63 _ 0F 85, 00001729
?_141:  mov     r9, qword [rsp+68H]                     ; 0D69 _ 4C: 8B. 4C 24, 68
        mov     rdi, r12                                ; 0D6E _ 4C: 89. E7
        mov     rax, qword 0FF000000000000H             ; 0D71 _ 48: B8, 00FF000000000000
        mov     rcx, qword 0FEFEFEFEFEFEFEFEH           ; 0D7B _ 48: B9, FEFEFEFEFEFEFEFE
        and     rax, r12                                ; 0D85 _ 4C: 21. E0
        and     rdi, 0FFFFFFFFFFFF00FFH                 ; 0D88 _ 48: 81. E7, FFFF00FF
        shr     rax, 8                                  ; 0D8F _ 48: C1. E8, 08
        mov     rsi, r9                                 ; 0D93 _ 4C: 89. CE
        mov     rbp, r9                                 ; 0D96 _ 4C: 89. CD
        or      rbp, qword [rsp+38H]                    ; 0D99 _ 48: 0B. 6C 24, 38
        not     rsi                                     ; 0D9E _ 48: F7. D6
        and     rax, rsi                                ; 0DA1 _ 48: 21. F0
        or      rax, rdi                                ; 0DA4 _ 48: 09. F8
        mov     rdi, qword 7F7F7F7F7F7F7F7FH            ; 0DA7 _ 48: BF, 7F7F7F7F7F7F7F7F
        andn    r8, rbp, qword [rsp+80H]                ; 0DB1 _ C4 62 D0: F2. 84 24, 00000080
        shr     rax, 8                                  ; 0DBB _ 48: C1. E8, 08
        mov     rbp, r15                                ; 0DBF _ 4C: 89. FD
        and     r8, rax                                 ; 0DC2 _ 49: 21. C0
        mov     rax, r8                                 ; 0DC5 _ 4C: 89. C0
        and     rcx, r8                                 ; 0DC8 _ 4C: 21. C1
        and     rax, rdi                                ; 0DCB _ 48: 21. F8
        shr     rcx, 9                                  ; 0DCE _ 48: C1. E9, 09
        shr     rax, 7                                  ; 0DD2 _ 48: C1. E8, 07
        or      rax, rcx                                ; 0DD6 _ 48: 09. C8
        mov     rcx, qword [rsp+40H]                    ; 0DD9 _ 48: 8B. 4C 24, 40
        not     rcx                                     ; 0DDE _ 48: F7. D1
        and     rbp, rcx                                ; 0DE1 _ 48: 21. CD
        and     rax, rbp                                ; 0DE4 _ 48: 21. E8
        jne     ?_216                                   ; 0DE7 _ 0F 85, 00000FB5
?_142:  mov     r9, qword [rsp+28H]                     ; 0DED _ 4C: 8B. 4C 24, 28
        mov     r8, r12                                 ; 0DF2 _ 4D: 89. E0
        mov     rbp, qword [rsp+38H]                    ; 0DF5 _ 48: 8B. 6C 24, 38
        xor     r8, rdx                                 ; 0DFA _ 49: 31. D0
        mov     rax, qword [rsp+30H]                    ; 0DFD _ 48: 8B. 44 24, 30
        not     r9                                      ; 0E02 _ 49: F7. D1
        or      rax, r9                                 ; 0E05 _ 4C: 09. C8
        and     rbp, r8                                 ; 0E08 _ 4C: 21. C5
        mov     qword [rsp+78H], rax                    ; 0E0B _ 48: 89. 44 24, 78
        jne     ?_247                                   ; 0E10 _ 0F 85, 0000155A
        xor     eax, eax                                ; 0E16 _ 31. C0
?_143:  and     rcx, qword [rsp+30H]                    ; 0E18 _ 48: 23. 4C 24, 30
        and     r8, qword [rsp+40H]                     ; 0E1D _ 4C: 23. 44 24, 40
        and     rcx, rdx                                ; 0E22 _ 48: 21. D1
        or      r8, rcx                                 ; 0E25 _ 49: 09. C8
        jz      ?_148                                   ; 0E28 _ 74, 6F
        mov     rdi, qword [rsp+58H]                    ; 0E2A _ 48: 8B. 7C 24, 58
        or      rdi, qword [rsp+98H]                    ; 0E2F _ 48: 0B. BC 24, 00000098
        and     r8, rdi                                 ; 0E37 _ 49: 21. F8
        jz      ?_145                                   ; 0E3A _ 74, 1F
        lea     rbp, [rel _ZN12_GLOBAL__N_1L6ThreatE]   ; 0E3C _ 48: 8D. 2D, 00000880(rel)
?_144:  bsf     rdi, r8                                 ; 0E43 _ 49: 0F BC. F8
        mov     edi, dword [rbx+rdi*4]                  ; 0E47 _ 8B. 3C BB
        blsr    r8, r8                                  ; 0E4A _ C4 C2 B8: F3. C8
        and     edi, 07H                                ; 0E4F _ 83. E7, 07
        add     eax, dword [rbp+rdi*4]                  ; 0E52 _ 03. 44 BD, 00
        test    r8, r8                                  ; 0E56 _ 4D: 85. C0
        jnz     ?_144                                   ; 0E59 _ 75, E8
?_145:  mov     r8, rdx                                 ; 0E5B _ 49: 89. D0
        and     r8, qword [rbx+128H]                    ; 0E5E _ 4C: 23. 83, 00000128
        or      r8, rcx                                 ; 0E65 _ 49: 09. C8
        and     r8, qword [rsp+0E0H]                    ; 0E68 _ 4C: 23. 84 24, 000000E0
        jne     ?_204                                   ; 0E70 _ 0F 85, 00000C9D
?_146:  and     r9, rcx                                 ; 0E76 _ 49: 21. C9
        jz      ?_147                                   ; 0E79 _ 74, 10
        popcnt  r9, r9                                  ; 0E7B _ F3 4D: 0F B8. C9
        imul    r9d, dword [rel _ZN12_GLOBAL__N_1L7HangingE]; 0E80 _ 44: 0F AF. 0D, 0000080C(rel)
        add     eax, r9d                                ; 0E88 _ 44: 01. C8
?_147:  and     rcx, qword [rsp+0E8H]                   ; 0E8B _ 48: 23. 8C 24, 000000E8
        jne     ?_259                                   ; 0E93 _ 0F 85, 0000166C
?_148:  mov     rdi, qword [rsp+60H]                    ; 0E99 _ 48: 8B. 7C 24, 60
        and     r10, rdx                                ; 0E9E _ 49: 21. D2
        mov     rcx, qword 0FF00FFFFFFFFFFFFH           ; 0EA1 _ 48: B9, FF00FFFFFFFFFFFF
        mov     r8, qword 7F7F7F7F7F7F7F7FH             ; 0EAB _ 49: B8, 7F7F7F7F7F7F7F7F
        mov     rbp, qword [rsp+68H]                    ; 0EB5 _ 48: 8B. 6C 24, 68
        or      rbp, qword [rsp+40H]                    ; 0EBA _ 48: 0B. 6C 24, 40
        mov     r9, rdi                                 ; 0EBF _ 49: 89. F9
        and     rcx, rdi                                ; 0EC2 _ 48: 21. F9
        mov     rdi, qword 0FEFEFEFEFEFEFEFEH           ; 0EC5 _ 48: BF, FEFEFEFEFEFEFEFE
        and     r9d, 0FF00H                             ; 0ECF _ 41: 81. E1, 0000FF00
        shl     r9, 8                                   ; 0ED6 _ 49: C1. E1, 08
        and     rsi, r9                                 ; 0EDA _ 4C: 21. CE
        or      rsi, rcx                                ; 0EDD _ 48: 09. CE
        shl     rsi, 8                                  ; 0EE0 _ 48: C1. E6, 08
        andn    rsi, rbp, rsi                           ; 0EE4 _ C4 E2 D0: F2. F6
        and     rsi, qword [rsp+78H]                    ; 0EE9 _ 48: 23. 74 24, 78
        and     r8, rsi                                 ; 0EEE _ 49: 21. F0
        and     rdi, rsi                                ; 0EF1 _ 48: 21. F7
        shl     r8, 9                                   ; 0EF4 _ 49: C1. E0, 09
        shl     rdi, 7                                  ; 0EF8 _ 48: C1. E7, 07
        or      rdi, r8                                 ; 0EFC _ 4C: 09. C7
        and     rdi, r10                                ; 0EFF _ 4C: 21. D7
        jne     ?_221                                   ; 0F02 _ 0F 85, 00000F6B
?_149:  sub     eax, r11d                               ; 0F08 _ 44: 29. D8
        add     eax, r14d                               ; 0F0B _ 44: 01. F0
        mov     r14, qword [r13+18H]                    ; 0F0E _ 4D: 8B. 75, 18
        mov     dword [rsp+90H], eax                    ; 0F12 _ 89. 84 24, 00000090
        test    r14, r14                                ; 0F19 _ 4D: 85. F6
        mov     qword [rsp+98H], r14                    ; 0F1C _ 4C: 89. B4 24, 00000098
        jne     ?_224                                   ; 0F24 _ 0F 85, 00000FD6
        mov     r9, qword [rsp+88H]                     ; 0F2A _ 4C: 8B. 8C 24, 00000088
        popcnt  r11, qword [rsp+60H]                    ; 0F32 _ F3 4C: 0F B8. 5C 24, 60
        popcnt  rax, r12                                ; 0F39 _ F3 49: 0F B8. C4
        mov     qword [rsp+50H], r11                    ; 0F3E _ 4C: 89. 5C 24, 50
        mov     qword [rsp+58H], rax                    ; 0F43 _ 48: 89. 44 24, 58
        xor     r14d, r14d                              ; 0F48 _ 45: 31. F6
        and     r9, rdx                                 ; 0F4B _ 49: 21. D1
        mov     qword [rsp+88H], r9                     ; 0F4E _ 4C: 89. 8C 24, 00000088
?_150:  mov     r10, qword [r13+10H]                    ; 0F56 _ 4D: 8B. 55, 10
        xor     eax, eax                                ; 0F5A _ 31. C0
        test    r10, r10                                ; 0F5C _ 4D: 85. D2
        jne     ?_208                                   ; 0F5F _ 0F 85, 00000C0B
?_151:  sub     eax, r14d                               ; 0F65 _ 44: 29. F0
        mov     r14d, dword [rsp+90H]                   ; 0F68 _ 44: 8B. B4 24, 00000090
        add     r14d, eax                               ; 0F70 _ 41: 01. C6
        mov     rax, qword [rsp+70H]                    ; 0F73 _ 48: 8B. 44 24, 70
        mov     r11d, dword [rax+10H]                   ; 0F78 _ 44: 8B. 58, 10
        test    r11d, r11d                              ; 0F7C _ 45: 85. DB
        je      ?_272                                   ; 0F7F _ 0F 84, 000016D4
?_152:  mov     rbp, qword [rsp+70H]                    ; 0F85 _ 48: 8B. 6C 24, 70
        add     r11d, dword [rbp+14H]                   ; 0F8A _ 44: 03. 5D, 14
        cmp     r11d, 12221                             ; 0F8E _ 41: 81. FB, 00002FBD
        jg      ?_197                                   ; 0F95 _ 0F 8F, 00000948
?_153:  mov     r10, qword [rsp+88H]                    ; 0F9B _ 4C: 8B. 94 24, 00000088
        movsx   r11d, r14w                              ; 0FA3 _ 45: 0F BF. DE
        bsf     rdi, r10                                ; 0FA7 _ 49: 0F BC. FA
        mov     rbp, qword [rsp+48H]                    ; 0FAB _ 48: 8B. 6C 24, 48
        and     edi, 07H                                ; 0FB0 _ 83. E7, 07
        bsf     r12, rbp                                ; 0FB3 _ 4C: 0F BC. E5
        and     r12d, 07H                               ; 0FB7 _ 41: 83. E4, 07
        mov     eax, edi                                ; 0FBB _ 89. F8
        mov     edx, r12d                               ; 0FBD _ 44: 89. E2
        sub     eax, r12d                               ; 0FC0 _ 44: 29. E0
        sub     edx, edi                                ; 0FC3 _ 29. FA
        cmp     edi, r12d                               ; 0FC5 _ 44: 39. E7
        mov     edi, dword [rsp+50H]                    ; 0FC8 _ 8B. 7C 24, 50
        mov     r12d, r11d                              ; 0FCC _ 45: 89. DC
        cmovbe  eax, edx                                ; 0FCF _ 0F 46. C2
        bsf     r8, r10                                 ; 0FD2 _ 4D: 0F BC. C2
        shr     r8, 3                                   ; 0FD6 _ 49: C1. E8, 03
        bsf     r15, rbp                                ; 0FDA _ 4C: 0F BC. FD
        mov     r10d, r8d                               ; 0FDE _ 45: 89. C2
        shr     r15, 3                                  ; 0FE1 _ 49: C1. EF, 03
        sub     r10d, r15d                              ; 0FE5 _ 45: 29. FA
        mov     r9d, r15d                               ; 0FE8 _ 45: 89. F9
        sub     r9d, r8d                                ; 0FEB _ 45: 29. C1
        mov     esi, r10d                               ; 0FEE _ 44: 89. D6
        cmp     r8d, r15d                               ; 0FF1 _ 45: 39. F8
        cmovbe  esi, r9d                                ; 0FF4 _ 41: 0F 46. F1
        add     edi, dword [rsp+58H]                    ; 0FF8 _ 03. 7C 24, 58
        shr     r12d, 31                                ; 0FFC _ 41: C1. EC, 1F
        mov     r9, qword [rsp+0C8H]                    ; 1000 _ 4C: 8B. 8C 24, 000000C8
        sub     eax, esi                                ; 1008 _ 29. F0
        add     eax, dword [r13+80H]                    ; 100A _ 41: 03. 85, 00000080
        lea     ebp, [rdi+rdi*2]                        ; 1011 _ 8D. 2C 7F
        shl     ebp, 2                                  ; 1014 _ C1. E5, 02
        lea     ecx, [rbp+rax*8-78H]                    ; 1017 _ 8D. 4C C5, 88
        lea     eax, [r12+r11]                          ; 101B _ 43: 8D. 04 1C
        mov     edx, eax                                ; 101F _ 89. C2
        sar     eax, 31                                 ; 1021 _ C1. F8, 1F
        sar     edx, 1                                  ; 1024 _ D1. FA
        xor     edx, eax                                ; 1026 _ 31. C2
        sub     eax, edx                                ; 1028 _ 29. D0
        cmp     ecx, eax                                ; 102A _ 39. C1
        cmovl   ecx, eax                                ; 102C _ 0F 4C. C8
        xor     r8d, r8d                                ; 102F _ 45: 31. C0
        test    r11d, r11d                              ; 1032 _ 45: 85. DB
        setg    r8b                                     ; 1035 _ 41: 0F 9F. C0
        sub     r8d, r12d                               ; 1039 _ 45: 29. E0
        mov     r15d, ecx                               ; 103C _ 41: 89. CF
        imul    r15d, r8d                               ; 103F _ 45: 0F AF. F8
        add     r14d, r15d                              ; 1043 _ 45: 01. FE
        movsx   esi, r14w                               ; 1046 _ 41: 0F BF. F6
        test    esi, esi                                ; 104A _ 85. F6
        setle   bpl                                     ; 104C _ 40: 0F 9E. C5
        movzx   r10d, bpl                               ; 1050 _ 44: 0F B6. D5
        movzx   edi, bpl                                ; 1054 _ 40: 0F B6. FD
        lea     r12, [r9+r10*8]                         ; 1058 _ 4F: 8D. 24 D1
        mov     rcx, qword [r12+18H]                    ; 105C _ 49: 8B. 4C 24, 18
        test    rcx, rcx                                ; 1061 _ 48: 85. C9
        jne     ?_277                                   ; 1064 _ 0F 85, 00001668
?_154:  mov     rdx, qword [rsp+0C8H]                   ; 106A _ 48: 8B. 94 24, 000000C8
        movsxd  r8, edi                                 ; 1072 _ 4C: 63. C7
        movzx   r9d, byte [rdx+r8+0AH]                  ; 1075 _ 46: 0F B6. 4C 02, 0A
        mov     rcx, rdx                                ; 107B _ 48: 89. D1
?_155:  mov     eax, dword [rcx+28H]                    ; 107E _ 8B. 41, 28
        cmp     eax, 127                                ; 1081 _ 83. F8, 7F
        jg      ?_157                                   ; 1084 _ 7F, 6F
        lea     r11d, [r9-30H]                          ; 1086 _ 45: 8D. 59, D0
        and     r11d, 0FFFFFFEFH                        ; 108A _ 41: 83. E3, EF
        jnz     ?_157                                   ; 108E _ 75, 65
        mov     r10, qword [rbx+118H]                   ; 1090 _ 4C: 8B. 93, 00000118
        mov     r15, qword [rbx+148H]                   ; 1097 _ 4C: 8B. BB, 00000148
        mov     r12, r10                                ; 109E _ 4D: 89. D4
        and     r12, qword [rbx+140H]                   ; 10A1 _ 4C: 23. A3, 00000140
        blsr    rcx, r12                                ; 10A8 _ C4 C2 F0: F3. CC
        test    rcx, rcx                                ; 10AD _ 48: 85. C9
        jnz     ?_156                                   ; 10B0 _ 75, 20
        and     r15, r10                                ; 10B2 _ 4D: 21. D7
        blsr    r8, r15                                 ; 10B5 _ C4 C2 B8: F3. CF
        test    r8, r8                                  ; 10BA _ 4D: 85. C0
        jnz     ?_156                                   ; 10BD _ 75, 13
        mov     rdx, qword 0AA55AA55AA55AA55H           ; 10BF _ 48: BA, AA55AA55AA55AA55
        test    r10, rdx                                ; 10C9 _ 49: 85. D2
        jne     ?_218                                   ; 10CC _ 0F 85, 00000D32
?_156:  lea     r10d, [rsi+359H]                        ; 10D2 _ 44: 8D. 96, 00000359
        cmp     r10d, 1714                              ; 10D9 _ 41: 81. FA, 000006B2
        ja      ?_157                                   ; 10E0 _ 77, 13
        lea     r12, [rdi+18H]                          ; 10E2 _ 4C: 8D. 67, 18
        mov     r13d, dword [r13+r12*4+8H]              ; 10E6 _ 47: 8B. 6C A5, 08
        cmp     r13d, 1                                 ; 10EB _ 41: 83. FD, 01
        jle     ?_267                                   ; 10EF _ 0F 8E, 000014BB
?_157:  mov     ecx, dword [rbx+3ACH]                   ; 10F5 _ 8B. 8B, 000003AC
        xor     r8d, r8d                                ; 10FB _ 45: 31. C0
        mov     edi, 128                                ; 10FE _ BF, 00000080
        test    ecx, ecx                                ; 1103 _ 85. C9
        setne   r8b                                     ; 1105 _ 41: 0F 95. C0
        sub     edi, eax                                ; 1109 _ 29. C7
        imul    edi, esi                                ; 110B _ 0F AF. FE
        mov     r11d, r8d                               ; 110E _ 45: 89. C3
        imul    edi, r9d                                ; 1111 _ 41: 0F AF. F9
        lea     ebp, [rdi+3FH]                          ; 1115 _ 8D. 6F, 3F
        test    edi, edi                                ; 1118 _ 85. FF
        cmovs   edi, ebp                                ; 111A _ 0F 48. FD
        add     r14d, 32768                             ; 111D _ 41: 81. C6, 00008000
        sar     r14d, 16                                ; 1124 _ 41: C1. FE, 10
        imul    r14d, eax                               ; 1128 _ 44: 0F AF. F0
        sar     edi, 6                                  ; 112C _ C1. FF, 06
        lea     r9d, [rdi+r14]                          ; 112F _ 46: 8D. 0C 37
        lea     edx, [r9+7FH]                           ; 1133 _ 41: 8D. 51, 7F
        test    r9d, r9d                                ; 1137 _ 45: 85. C9
        cmovs   r9d, edx                                ; 113A _ 44: 0F 48. CA
        neg     r11d                                    ; 113E _ 41: F7. DB
        sar     r9d, 7                                  ; 1141 _ 41: C1. F9, 07
        xor     r9d, r11d                               ; 1145 _ 45: 31. D9
        lea     eax, [r8+r9+14H]                        ; 1148 _ 43: 8D. 44 08, 14
        add     rsp, 440                                ; 114D _ 48: 81. C4, 000001B8
        pop     rbx                                     ; 1154 _ 5B
        pop     rsi                                     ; 1155 _ 5E
        pop     rdi                                     ; 1156 _ 5F
        pop     rbp                                     ; 1157 _ 5D
        pop     r12                                     ; 1158 _ 41: 5C
        pop     r13                                     ; 115A _ 41: 5D
        pop     r14                                     ; 115C _ 41: 5E
        pop     r15                                     ; 115E _ 41: 5F
        ret                                             ; 1160 _ C3

?_158:  mov     r14, qword [r13+38H]                    ; 1161 _ 4D: 8B. 75, 38
        movzx   r8d, byte [rbx+3C0H]                    ; 1165 _ 44: 0F B6. 83, 000003C0
        mov     r12d, dword [rsp+104H]                  ; 116D _ 44: 8B. A4 24, 00000104
        andn    rsi, r14, qword [rel ?_296]             ; 1175 _ C4 E2 88: F2. 35, 00000080(rel)
        mov     qword [rsp+120H], rsi                   ; 117E _ 48: 89. B4 24, 00000120
        and     rsi, qword [rsp+138H]                   ; 1186 _ 48: 23. B4 24, 00000138
        mov     byte [rsp+128H], r8b                    ; 118E _ 44: 88. 84 24, 00000128
        mov     qword [rsp+168H], rsi                   ; 1196 _ 48: 89. B4 24, 00000168
?_159:  mov     rdi, qword [rel .refptr.BishopMasks]    ; 119E _ 48: 8B. 3D, 00000000(rel)
        mov     r14, qword [rsp+50H]                    ; 11A5 _ 4C: 8B. 74 24, 50
        bsf     r10, r9                                 ; 11AA _ 4D: 0F BC. D1
        blsr    r9, r9                                  ; 11AE _ C4 C2 B0: F3. C9
        pext    rsi, r14, qword [rdi+r10*8]             ; 11B3 _ C4 A2 8A: F5. 34 D7
        mov     rdi, qword [rel .refptr.BishopAttacks]  ; 11B9 _ 48: 8B. 3D, 00000000(rel)
        mov     r8d, esi                                ; 11C0 _ 41: 89. F0
        mov     rsi, qword [rel .refptr.SquareBB]       ; 11C3 _ 48: 8B. 35, 00000000(rel)
        mov     r14, qword [rdi+r10*8]                  ; 11CA _ 4E: 8B. 34 D7
        mov     rsi, qword [rsi+r10*8]                  ; 11CE _ 4A: 8B. 34 D6
        test    qword [rsp+68H], rsi                    ; 11D2 _ 48: 85. 74 24, 68
        mov     r8, qword [r14+r8*8]                    ; 11D7 _ 4F: 8B. 04 C6
        jne     ?_285                                   ; 11DB _ 0F 85, 000015C6
?_160:  or      qword [rsp+58H], r8                     ; 11E1 _ 4C: 09. 44 24, 58
        mov     rdi, qword [rsp+58H]                    ; 11E6 _ 48: 8B. 7C 24, 58
        or      qword [rsp+30H], rdi                    ; 11EB _ 48: 09. 7C 24, 30
        test    qword [rsp+88H], r8                     ; 11F0 _ 4C: 85. 84 24, 00000088
        jne     ?_187                                   ; 11F8 _ 0F 85, 00000492
?_161:  mov     r14, qword [rsp+0A8H]                   ; 11FE _ 4C: 8B. B4 24, 000000A8
        and     r14, r8                                 ; 1206 _ 4D: 21. C6
        popcnt  rdi, r14                                ; 1209 _ F3 49: 0F B8. FE
        lea     r14, [rel _ZN12_GLOBAL__N_1L13MobilityBonusE]; 120E _ 4C: 8D. 35, 00000940(rel)
        add     eax, dword [r14+rdi*4+180H]             ; 1215 _ 41: 03. 84 BE, 00000180
        test    qword [rsp+120H], rsi                   ; 121D _ 48: 85. B4 24, 00000120
        jne     ?_237                                   ; 1225 _ 0F 85, 00000FA5
        and     r8, qword [rsp+168H]                    ; 122B _ 4C: 23. 84 24, 00000168
        jz      ?_162                                   ; 1233 _ 74, 1C
        test    qword [rsp+38H], r8                     ; 1235 _ 4C: 85. 44 24, 38
        lea     rdi, [rel _ZN12_GLOBAL__N_1L16ReachableOutpostE]; 123A _ 48: 8D. 3D, 000008F0(rel)
        setne   r8b                                     ; 1241 _ 41: 0F 95. C0
        movzx   r14d, r8b                               ; 1245 _ 45: 0F B6. F0
        add     r14, 2                                  ; 1249 _ 49: 83. C6, 02
        add     r12d, dword [rdi+r14*4]                 ; 124D _ 46: 03. 24 B7
?_162:  mov     rdi, r10                                ; 1251 _ 4C: 89. D7
        shr     rdi, 3                                  ; 1254 _ 48: C1. EF, 03
        cmp     edi, 3                                  ; 1258 _ 83. FF, 03
        ja      ?_163                                   ; 125B _ 77, 20
        mov     edi, dword [rsp+10CH]                   ; 125D _ 8B. BC 24, 0000010C
        lea     r8d, [r10+8H]                           ; 1264 _ 45: 8D. 42, 08
        mov     r14, qword [rel .refptr.SquareBB]       ; 1268 _ 4C: 8B. 35, 00000000(rel)
        movsxd  r8, r8d                                 ; 126F _ 4D: 63. C0
        add     edi, r12d                               ; 1272 _ 44: 01. E7
        test    qword [r14+r8*8], r15                   ; 1275 _ 4F: 85. 3C C6
        cmovne  r12d, edi                               ; 1279 _ 44: 0F 45. E7
?_163:  mov     rdi, qword 0AA55AA55AA55AA55H           ; 127D _ 48: BF, AA55AA55AA55AA55
        xor     r8d, r8d                                ; 1287 _ 45: 31. C0
        test    rsi, rdi                                ; 128A _ 48: 85. FE
        mov     esi, dword [rsp+0E0H]                   ; 128D _ 8B. B4 24, 000000E0
        setne   r8b                                     ; 1294 _ 41: 0F 95. C0
        add     r8, 28                                  ; 1298 _ 49: 83. C0, 1C
        imul    esi, dword [r13+r8*4]                   ; 129C _ 43: 0F AF. 74 85, 00
        sub     r12d, esi                               ; 12A2 _ 41: 29. F4
        cmp     byte [rsp+128H], 0                      ; 12A5 _ 80. BC 24, 00000128, 00
        jne     .text.unlikely+4BH                      ; 12AD _ 0F 85, 0000004B(rel)
        test    r9, r9                                  ; 12B3 _ 4D: 85. C9
        jne     ?_159                                   ; 12B6 _ 0F 85, FFFFFEE2
        mov     r9, qword [rsp+160H]                    ; 12BC _ 4C: 8B. 8C 24, 00000160
        mov     dword [rsp+104H], r12d                  ; 12C4 _ 44: 89. A4 24, 00000104
        mov     qword [rsp+128H], r9                    ; 12CC _ 4C: 89. 8C 24, 00000128
        jmp     ?_107                                   ; 12D4 _ E9, FFFFF1F0

; Filling space: 7H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 80H, 00H, 00H, 00H, 00H

ALIGN   8
?_164:  xor     esi, esi                                ; 12E0 _ 31. F6
        test    qword [rsp+38H], rdx                    ; 12E2 _ 48: 85. 54 24, 38
        lea     rdx, [rel _ZN12_GLOBAL__N_1L16ReachableOutpostE]; 12E7 _ 48: 8D. 15, 000008F0(rel)
        setne   sil                                     ; 12EE _ 40: 0F 95. C6
        mov     r10d, dword [rdx+rsi*4]                 ; 12F2 _ 44: 8B. 14 B2
        add     dword [rsp+118H], r10d                  ; 12F6 _ 44: 01. 94 24, 00000118
        jmp     ?_102                                   ; 12FE _ E9, FFFFF076

?_165:  xor     ebx, ebx                                ; 1303 _ 31. DB
        test    dword [r13+64H], ecx                    ; 1305 _ 41: 85. 4D, 64
        lea     rcx, [rel _ZN12_GLOBAL__N_1L10RookOnFileE]; 1309 _ 48: 8D. 0D, 000008E0(rel)
        setne   bl                                      ; 1310 _ 0F 95. C3
        mov     r15d, dword [rcx+rbx*4]                 ; 1313 _ 44: 8B. 3C 99
        add     dword [rsp+10CH], r15d                  ; 1317 _ 44: 01. BC 24, 0000010C
        jmp     ?_113                                   ; 131F _ E9, FFFFF3A3

?_166:  lea     rax, [rel _ZN12_GLOBAL__N_1L10RookOnFileE]; 1324 _ 48: 8D. 05, 000008E0(rel)
        xor     esi, esi                                ; 132B _ 31. F6
        test    dword [r13+60H], r14d                   ; 132D _ 45: 85. 75, 60
        setne   sil                                     ; 1331 _ 40: 0F 95. C6
        add     r15d, dword [rax+rsi*4]                 ; 1335 _ 44: 03. 3C B0
        jmp     ?_119                                   ; 1339 _ E9, FFFFF50C

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_167:  mov     r11, qword [r13+30H]                    ; 1340 _ 4D: 8B. 5D, 30
        mov     dword [rsp+168H], eax                   ; 1344 _ 89. 84 24, 00000168
        mov     r10, qword [rsp+138H]                   ; 134B _ 4C: 8B. 94 24, 00000138
        movzx   r9d, byte [rbx+3C0H]                    ; 1353 _ 44: 0F B6. 8B, 000003C0
        andn    rsi, r11, qword [rel ?_297]             ; 135B _ C4 E2 A0: F2. 35, 00000088(rel)
        and     r10, rsi                                ; 1364 _ 49: 21. F2
        mov     byte [rsp+120H], r9b                    ; 1367 _ 44: 88. 8C 24, 00000120
        mov     qword [rsp+160H], r10                   ; 136F _ 4C: 89. 94 24, 00000160
?_168:  mov     r11, qword [rel .refptr.BishopAttacks]  ; 1377 _ 4C: 8B. 1D, 00000000(rel)
        mov     rax, qword [rel .refptr.BishopMasks]    ; 137E _ 48: 8B. 05, 00000000(rel)
        bsf     r9, rcx                                 ; 1385 _ 4C: 0F BC. C9
        blsr    rcx, rcx                                ; 1389 _ C4 E2 F0: F3. C9
        mov     r10, qword [r11+r9*8]                   ; 138E _ 4F: 8B. 14 CB
        pext    r8, rdi, qword [rax+r9*8]               ; 1392 _ C4 22 C2: F5. 04 C8
        mov     eax, r8d                                ; 1398 _ 44: 89. C0
        mov     r8, qword [r10+rax*8]                   ; 139B _ 4D: 8B. 04 C2
        mov     rax, qword [rel .refptr.SquareBB]       ; 139F _ 48: 8B. 05, 00000000(rel)
        mov     r10, qword [rax+r9*8]                   ; 13A6 _ 4E: 8B. 14 C8
        test    qword [rsp+60H], r10                    ; 13AA _ 4C: 85. 54 24, 60
        jne     ?_281                                   ; 13AF _ 0F 85, 0000138E
?_169:  or      qword [rsp+50H], r8                     ; 13B5 _ 4C: 09. 44 24, 50
        mov     r11, qword [rsp+50H]                    ; 13BA _ 4C: 8B. 5C 24, 50
        or      qword [rsp+28H], r11                    ; 13BF _ 4C: 09. 5C 24, 28
        test    qword [rsp+80H], r8                     ; 13C4 _ 4C: 85. 84 24, 00000080
        jne     ?_196                                   ; 13CC _ 0F 85, 000004DE
?_170:  mov     rax, qword [rsp+0A0H]                   ; 13D2 _ 48: 8B. 84 24, 000000A0
        and     rax, r8                                 ; 13DA _ 4C: 21. C0
        popcnt  r11, rax                                ; 13DD _ F3 4C: 0F B8. D8
        lea     rax, [rel _ZN12_GLOBAL__N_1L13MobilityBonusE]; 13E2 _ 48: 8D. 05, 00000940(rel)
        add     edx, dword [rax+r11*4+180H]             ; 13E9 _ 42: 03. 94 98, 00000180
        test    r10, rsi                                ; 13F1 _ 49: 85. F2
        jne     ?_253                                   ; 13F4 _ 0F 85, 00001066
        and     r8, qword [rsp+160H]                    ; 13FA _ 4C: 23. 84 24, 00000160
        jne     ?_199                                   ; 1402 _ 0F 85, 00000618
?_171:  mov     r11, r9                                 ; 1408 _ 4D: 89. CB
        shr     r11, 3                                  ; 140B _ 49: C1. EB, 03
        xor     r11d, 07H                               ; 140F _ 41: 83. F3, 07
        cmp     r11d, 3                                 ; 1413 _ 41: 83. FB, 03
        ja      ?_172                                   ; 1417 _ 77, 21
        mov     eax, dword [rsp+10CH]                   ; 1419 _ 8B. 84 24, 0000010C
        lea     r8d, [r9-8H]                            ; 1420 _ 45: 8D. 41, F8
        movsxd  r8, r8d                                 ; 1424 _ 4D: 63. C0
        lea     r11d, [r14+rax]                         ; 1427 _ 45: 8D. 1C 06
        mov     rax, qword [rel .refptr.SquareBB]       ; 142B _ 48: 8B. 05, 00000000(rel)
        test    qword [rax+r8*8], r15                   ; 1432 _ 4E: 85. 3C C0
        cmovne  r14d, r11d                              ; 1436 _ 45: 0F 45. F3
?_172:  mov     r11, qword 0AA55AA55AA55AA55H           ; 143A _ 49: BB, AA55AA55AA55AA55
        xor     r8d, r8d                                ; 1444 _ 45: 31. C0
        test    r10, r11                                ; 1447 _ 4D: 85. DA
        mov     r10d, dword [rsp+0E0H]                  ; 144A _ 44: 8B. 94 24, 000000E0
        setne   r8b                                     ; 1452 _ 41: 0F 95. C0
        add     r8, 30                                  ; 1456 _ 49: 83. C0, 1E
        imul    r10d, dword [r13+r8*4]                  ; 145A _ 47: 0F AF. 54 85, 00
        sub     r14d, r10d                              ; 1460 _ 45: 29. D6
        cmp     byte [rsp+120H], 0                      ; 1463 _ 80. BC 24, 00000120, 00
        jne     _ZN4Eval8evaluateERK8Position.cold.21   ; 146B _ 0F 85, 00000000(rel)
        test    rcx, rcx                                ; 1471 _ 48: 85. C9
        jne     ?_168                                   ; 1474 _ 0F 85, FFFFFEFD
        mov     eax, dword [rsp+168H]                   ; 147A _ 8B. 84 24, 00000168
        mov     qword [rsp+120H], r12                   ; 1481 _ 4C: 89. A4 24, 00000120
        jmp     ?_108                                   ; 1489 _ E9, FFFFF0C0

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_173:  mov     r8, qword [r13+30H]                     ; 1490 _ 4D: 8B. 45, 30
        lea     rdi, [rel _ZN12_GLOBAL__N_1L13MobilityBonusE]; 1494 _ 48: 8D. 3D, 00000940(rel)
        mov     qword [rsp+0C0H], rcx                   ; 149B _ 48: 89. 8C 24, 000000C0
        mov     r14, qword [rsp+0B8H]                   ; 14A3 _ 4C: 8B. B4 24, 000000B8
        andn    r11, r8, qword [rel ?_297]              ; 14AB _ C4 62 B8: F2. 1D, 00000088(rel)
        mov     rsi, r11                                ; 14B4 _ 4C: 89. DE
        and     rsi, rcx                                ; 14B7 _ 48: 21. CE
        mov     qword [rsp+50H], rsi                    ; 14BA _ 48: 89. 74 24, 50
?_174:  mov     r12, qword [rel .refptr.SquareBB]       ; 14BF _ 4C: 8B. 25, 00000000(rel)
        bsf     rcx, r9                                 ; 14C6 _ 49: 0F BC. C9
        mov     r10, qword [rel .refptr.StepAttacksBB]  ; 14CA _ 4C: 8B. 15, 00000000(rel)
        blsr    r9, r9                                  ; 14D1 _ C4 C2 B0: F3. C9
        mov     rsi, qword [r12+rcx*8]                  ; 14D6 _ 49: 8B. 34 CC
        test    qword [rsp+60H], rsi                    ; 14DA _ 48: 85. 74 24, 60
        mov     r8, qword [r10+rcx*8+400H]              ; 14DF _ 4D: 8B. 84 CA, 00000400
        jne     ?_279                                   ; 14E7 _ 0F 85, 00001227
?_175:  or      r14, r8                                 ; 14ED _ 4D: 09. C6
        or      qword [rsp+28H], r14                    ; 14F0 _ 4C: 09. 74 24, 28
        test    qword [rsp+80H], r8                     ; 14F5 _ 4C: 85. 84 24, 00000080
        jne     ?_234                                   ; 14FD _ 0F 85, 00000C62
?_176:  mov     r10, qword [rsp+0A0H]                   ; 1503 _ 4C: 8B. 94 24, 000000A0
        and     r10, r8                                 ; 150B _ 4D: 21. C2
        popcnt  r12, r10                                ; 150E _ F3 4D: 0F B8. E2
        add     edx, dword [rdi+r12*4+100H]             ; 1513 _ 42: 03. 94 A7, 00000100
        test    rsi, r11                                ; 151B _ 4C: 85. DE
        jne     ?_258                                   ; 151E _ 0F 85, 00000FBD
        and     r8, qword [rsp+50H]                     ; 1524 _ 4C: 23. 44 24, 50
        jne     ?_220                                   ; 1529 _ 0F 85, 00000921
?_177:  mov     r10, rcx                                ; 152F _ 49: 89. CA
        shr     r10, 3                                  ; 1532 _ 49: C1. EA, 03
        xor     r10d, 07H                               ; 1536 _ 41: 83. F2, 07
        cmp     r10d, 3                                 ; 153A _ 41: 83. FA, 03
        ja      ?_178                                   ; 153E _ 77, 17
        mov     r12, qword [rel .refptr.SquareBB]       ; 1540 _ 4C: 8B. 25, 00000000(rel)
        sub     ecx, 8                                  ; 1547 _ 83. E9, 08
        movsxd  rcx, ecx                                ; 154A _ 48: 63. C9
        test    qword [r12+rcx*8], r15                  ; 154D _ 4D: 85. 3C CC
        jne     ?_251                                   ; 1551 _ 0F 85, 00000EC9
?_178:  test    r9, r9                                  ; 1557 _ 4D: 85. C9
        jne     ?_174                                   ; 155A _ 0F 85, FFFFFF5F
        mov     qword [rsp+0B8H], r14                   ; 1560 _ 4C: 89. B4 24, 000000B8
        jmp     ?_106                                   ; 1568 _ E9, FFFFEEA1

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_179:  lea     rcx, [rel _ZN12_GLOBAL__N_1L6ThreatE]   ; 1570 _ 48: 8D. 0D, 00000880(rel)
?_180:  bsf     r9, rax                                 ; 1577 _ 4C: 0F BC. C8
        mov     r8d, dword [rbx+r9*4]                   ; 157B _ 46: 8B. 04 8B
        blsr    rax, rax                                ; 157F _ C4 E2 F8: F3. C8
        and     r8d, 07H                                ; 1584 _ 41: 83. E0, 07
        add     r11d, dword [rcx+r8*4]                  ; 1588 _ 46: 03. 1C 81
        test    rax, rax                                ; 158C _ 48: 85. C0
        je      ?_138                                   ; 158F _ 0F 84, FFFFF797
        jmp     ?_180                                   ; 1595 _ EB, E0

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_181:  mov     qword [rsp+0E0H], 0                     ; 15A0 _ 48: C7. 84 24, 000000E0, 00000000
        mov     dword [rsp+10CH], 0                     ; 15AC _ C7. 84 24, 0000010C, 00000000
        jmp     ?_114                                   ; 15B7 _ E9, FFFFF133

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_182:  mov     qword [rsp+0C0H], 0                     ; 15C0 _ 48: C7. 84 24, 000000C0, 00000000
        xor     r15d, r15d                              ; 15CC _ 45: 31. FF
        jmp     ?_120                                   ; 15CF _ E9, FFFFF29E

?_183:  mov     r11d, dword [rsp+170H]                  ; 15D4 _ 44: 8B. 9C 24, 00000170
        cmp     eax, r11d                               ; 15DC _ 44: 39. D8
        setb    al                                      ; 15DF _ 0F 92. C0
        cmp     r11d, 3                                 ; 15E2 _ 41: 83. FB, 03
        seta    sil                                     ; 15E6 _ 40: 0F 97. C6
        cmp     sil, al                                 ; 15EA _ 40: 38. C6
        je      ?_119                                   ; 15ED _ 0F 84, FFFFF257
        mov     r14, qword [rsp+180H]                   ; 15F3 _ 4C: 8B. B4 24, 00000180
        shr     r14, 3                                  ; 15FB _ 49: C1. EE, 03
        cmp     r9d, r14d                               ; 15FF _ 45: 39. F1
        jz      ?_184                                   ; 1602 _ 74, 0A
        cmp     r14d, 7                                 ; 1604 _ 41: 83. FE, 07
        jne     ?_119                                   ; 1608 _ 0F 85, FFFFF23C
?_184:  test    al, al                                  ; 160E _ 84. C0
        mov     r11d, dword [rsp+190H]                  ; 1610 _ 44: 8B. 9C 24, 00000190
        jne     ?_280                                   ; 1618 _ 0F 85, 0000110E
?_185:  test    dword [rsp+138H], r11d                  ; 161E _ 44: 85. 9C 24, 00000138
        jne     ?_119                                   ; 1626 _ 0F 85, FFFFF21E
        mov     rax, qword [rsp+158H]                   ; 162C _ 48: 8B. 84 24, 00000158
        mov     r9d, dword [rsp+188H]                   ; 1634 _ 44: 8B. 8C 24, 00000188
        mov     esi, dword [rax+18H]                    ; 163C _ 8B. 70, 18
        mov     dword [rsp+1A8H], esi                   ; 163F _ 89. B4 24, 000001A8
        and     esi, 0CH                                ; 1646 _ 83. E6, 0C
        cmp     esi, 1                                  ; 1649 _ 83. FE, 01
        sbb     r14d, r14d                              ; 164C _ 45: 19. F6
        imul    r8d, r8d, 22                            ; 164F _ 45: 6B. C0, 16
        not     r14d                                    ; 1653 _ 41: F7. D6
        add     r14d, 2                                 ; 1656 _ 41: 83. C6, 02
        shl     r8d, 16                                 ; 165A _ 41: C1. E0, 10
        sub     r9d, r8d                                ; 165E _ 45: 29. C1
        imul    r14d, r9d                               ; 1661 _ 45: 0F AF. F1
        sub     r15d, r14d                              ; 1665 _ 45: 29. F7
        jmp     ?_119                                   ; 1668 _ E9, FFFFF1DD

; Filling space: 3H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 00H

ALIGN   8
?_186:  mov     rdi, qword [rbx+100H]                   ; 1670 _ 48: 8B. BB, 00000100
        mov     rdx, qword [rbx+148H]                   ; 1677 _ 48: 8B. 93, 00000148
        mov     qword [rsp+68H], rdi                    ; 167E _ 48: 89. 7C 24, 68
        jmp     ?_136                                   ; 1683 _ E9, FFFFF61E

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_187:  mov     r14, qword [rsp+0B0H]                   ; 1690 _ 4C: 8B. B4 24, 000000B0
        add     dword [rsp+0F0H], 1                     ; 1698 _ 83. 84 24, 000000F0, 01
        add     dword [rsp+108H], 5                     ; 16A0 _ 83. 84 24, 00000108, 05
        and     r14, r8                                 ; 16A8 _ 4D: 21. C6
        je      ?_161                                   ; 16AB _ 0F 84, FFFFFB4D
        popcnt  rdi, r14                                ; 16B1 _ F3 49: 0F B8. FE
        add     dword [rsp+11CH], edi                   ; 16B6 _ 01. BC 24, 0000011C
        jmp     ?_161                                   ; 16BD _ E9, FFFFFB3C

?_188:  mov     r9, qword [rsp+58H]                     ; 16C2 _ 4C: 8B. 4C 24, 58
        lea     r12, [rel _ZN12_GLOBAL__N_1L13MobilityBonusE]; 16C7 _ 4C: 8D. 25, 00000940(rel)
        or      r9, qword [rsp+98H]                     ; 16CE _ 4C: 0B. 8C 24, 00000098
        or      r9, qword [rsp+0E0H]                    ; 16D6 _ 4C: 0B. 8C 24, 000000E0
        mov     rbp, qword [rel .refptr.BishopAttacks]  ; 16DE _ 48: 8B. 2D, 00000000(rel)
        bsf     r11, qword [rsp+90H]                    ; 16E5 _ 4C: 0F BC. 9C 24, 00000090
        shl     r11, 6                                  ; 16EE _ 49: C1. E3, 06
        andn    r10, r9, qword [rsp+0A0H]               ; 16F2 _ C4 62 B0: F2. 94 24, 000000A0
        mov     r9, qword [rsp+120H]                    ; 16FC _ 4C: 8B. 8C 24, 00000120
        mov     qword [rsp+0A0H], r11                   ; 1704 _ 4C: 89. 9C 24, 000000A0
        mov     qword [rsp+88H], r10                    ; 170C _ 4C: 89. 94 24, 00000088
?_189:  mov     rcx, qword [rsp+70H]                    ; 1714 _ 48: 8B. 4C 24, 70
        mov     r11, qword [rel .refptr.BishopMasks]    ; 1719 _ 4C: 8B. 1D, 00000000(rel)
        mov     r10, qword [rel .refptr.RookMasks]      ; 1720 _ 4C: 8B. 15, 00000000(rel)
        bsf     r8, r9                                  ; 1727 _ 4D: 0F BC. C1
        blsr    r9, r9                                  ; 172B _ C4 C2 B0: F3. C9
        pext    r10, rcx, qword [r10+r8*8]              ; 1730 _ C4 02 F2: F5. 14 C2
        pext    rcx, rcx, qword [r11+r8*8]              ; 1736 _ C4 82 F2: F5. 0C C3
        mov     ecx, ecx                                ; 173C _ 89. C9
        mov     r11, qword [rbp+r8*8]                   ; 173E _ 4E: 8B. 5C C5, 00
        mov     r10d, r10d                              ; 1743 _ 45: 89. D2
        mov     rcx, qword [r11+rcx*8]                  ; 1746 _ 49: 8B. 0C CB
        mov     r11, qword [rel .refptr.RookAttacks]    ; 174A _ 4C: 8B. 1D, 00000000(rel)
        mov     r11, qword [r11+r8*8]                   ; 1751 _ 4F: 8B. 1C C3
        or      rcx, qword [r11+r10*8]                  ; 1755 _ 4B: 0B. 0C D3
        mov     r10, qword [rel .refptr.SquareBB]       ; 1759 _ 4C: 8B. 15, 00000000(rel)
        mov     r11, qword [rsp+60H]                    ; 1760 _ 4C: 8B. 5C 24, 60
        test    qword [r10+r8*8], r11                   ; 1765 _ 4F: 85. 1C C2
        jne     ?_284                                   ; 1769 _ 0F 85, 00001020
?_190:  or      rsi, rcx                                ; 176F _ 48: 09. CE
        or      qword [rsp+28H], rsi                    ; 1772 _ 48: 09. 74 24, 28
        test    qword [rsp+80H], rcx                    ; 1777 _ 48: 85. 8C 24, 00000080
        jne     ?_222                                   ; 177F _ 0F 85, 0000070B
?_191:  and     rcx, qword [rsp+88H]                    ; 1785 _ 48: 23. 8C 24, 00000088
        popcnt  rcx, rcx                                ; 178D _ F3 48: 0F B8. C9
        add     edx, dword [r12+rcx*4+280H]             ; 1792 _ 41: 03. 94 8C, 00000280
        test    r9, r9                                  ; 179A _ 4D: 85. C9
        je      ?_122                                   ; 179D _ 0F 84, FFFFF0F1
        jmp     ?_189                                   ; 17A3 _ E9, FFFFFF6C

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_192:  mov     rcx, qword [rsp+50H]                    ; 17B0 _ 48: 8B. 4C 24, 50
        lea     rbp, [rel _ZN12_GLOBAL__N_1L13MobilityBonusE]; 17B5 _ 48: 8D. 2D, 00000940(rel)
        or      rcx, qword [rsp+0B8H]                   ; 17BC _ 48: 0B. 8C 24, 000000B8
        or      rcx, qword [rsp+0C0H]                   ; 17C4 _ 48: 0B. 8C 24, 000000C0
        mov     rsi, qword [rel .refptr.BishopAttacks]  ; 17CC _ 48: 8B. 35, 00000000(rel)
        mov     r10, qword [rsp+128H]                   ; 17D3 _ 4C: 8B. 94 24, 00000128
        bsf     r12, qword [rsp+48H]                    ; 17DB _ 4C: 0F BC. 64 24, 48
        andn    r9, rcx, qword [rsp+0A8H]               ; 17E1 _ C4 62 F0: F2. 8C 24, 000000A8
        shl     r12, 6                                  ; 17EB _ 49: C1. E4, 06
        mov     qword [rsp+0A8H], r12                   ; 17EF _ 4C: 89. A4 24, 000000A8
?_193:  mov     r11, qword [rel .refptr.RookMasks]      ; 17F7 _ 4C: 8B. 1D, 00000000(rel)
        mov     rcx, qword [rsp+70H]                    ; 17FE _ 48: 8B. 4C 24, 70
        bsf     r8, r10                                 ; 1803 _ 4D: 0F BC. C2
        blsr    r10, r10                                ; 1807 _ C4 C2 A8: F3. CA
        pext    r12, rcx, qword [r11+r8*8]              ; 180C _ C4 02 F2: F5. 24 C3
        mov     r11, qword [rel .refptr.BishopMasks]    ; 1812 _ 4C: 8B. 1D, 00000000(rel)
        mov     r12d, r12d                              ; 1819 _ 45: 89. E4
        pext    rcx, rcx, qword [r11+r8*8]              ; 181C _ C4 82 F2: F5. 0C C3
        mov     r11, qword [rsi+r8*8]                   ; 1822 _ 4E: 8B. 1C C6
        mov     ecx, ecx                                ; 1826 _ 89. C9
        mov     rcx, qword [r11+rcx*8]                  ; 1828 _ 49: 8B. 0C CB
        mov     r11, qword [rel .refptr.RookAttacks]    ; 182C _ 4C: 8B. 1D, 00000000(rel)
        mov     r11, qword [r11+r8*8]                   ; 1833 _ 4F: 8B. 1C C3
        or      rcx, qword [r11+r12*8]                  ; 1837 _ 4B: 0B. 0C E3
        mov     r11, qword [rel .refptr.SquareBB]       ; 183B _ 4C: 8B. 1D, 00000000(rel)
        mov     r12, qword [rsp+68H]                    ; 1842 _ 4C: 8B. 64 24, 68
        test    qword [r11+r8*8], r12                   ; 1847 _ 4F: 85. 24 C3
        jne     ?_283                                   ; 184B _ 0F 85, 00000F26
?_194:  or      rdi, rcx                                ; 1851 _ 48: 09. CF
        or      qword [rsp+30H], rdi                    ; 1854 _ 48: 09. 7C 24, 30
        test    qword [rsp+88H], rcx                    ; 1859 _ 48: 85. 8C 24, 00000088
        jz      ?_195                                   ; 1861 _ 74, 2A
        mov     r8, qword [rsp+0B0H]                    ; 1863 _ 4C: 8B. 84 24, 000000B0
        add     dword [rsp+0F0H], 1                     ; 186B _ 83. 84 24, 000000F0, 01
        add     dword [rsp+108H], 1                     ; 1873 _ 83. 84 24, 00000108, 01
        and     r8, rcx                                 ; 187B _ 49: 21. C8
        jz      ?_195                                   ; 187E _ 74, 0D
        popcnt  r12, r8                                 ; 1880 _ F3 4D: 0F B8. E0
        add     dword [rsp+11CH], r12d                  ; 1885 _ 44: 01. A4 24, 0000011C
?_195:  and     rcx, r9                                 ; 188D _ 4C: 21. C9
        popcnt  rcx, rcx                                ; 1890 _ F3 48: 0F B8. C9
        add     eax, dword [rbp+rcx*4+280H]             ; 1895 _ 03. 84 8D, 00000280
        test    r10, r10                                ; 189C _ 4D: 85. D2
        je      ?_121                                   ; 189F _ 0F 84, FFFFEFDE
        jmp     ?_193                                   ; 18A5 _ E9, FFFFFF4D

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_196:  mov     rax, qword [rsp+0E8H]                   ; 18B0 _ 48: 8B. 84 24, 000000E8
        add     dword [rsp+0D0H], 1                     ; 18B8 _ 83. 84 24, 000000D0, 01
        add     dword [rsp+130H], 5                     ; 18C0 _ 83. 84 24, 00000130, 05
        and     rax, r8                                 ; 18C8 _ 4C: 21. C0
        je      ?_170                                   ; 18CB _ 0F 84, FFFFFB01
        popcnt  r11, rax                                ; 18D1 _ F3 4C: 0F B8. D8
        add     dword [rsp+150H], r11d                  ; 18D6 _ 44: 01. 9C 24, 00000150
        jmp     ?_170                                   ; 18DE _ E9, FFFFFAEF

?_197:  mov     r9, r12                                 ; 18E3 _ 4D: 89. E1
        mov     r8, qword [rsp+38H]                     ; 18E6 _ 4C: 8B. 44 24, 38
        mov     rax, rdx                                ; 18EB _ 48: 89. D0
        mov     rsi, qword 3C3C3C00000000H              ; 18EE _ 48: BE, 003C3C3C00000000
        shl     r9, 8                                   ; 18F8 _ 49: C1. E1, 08
        and     rsi, qword [rsp+80H]                    ; 18FC _ 48: 23. B4 24, 00000080
        or      r9, r12                                 ; 1904 _ 4D: 09. E1
        mov     r11, qword [rbx+110H]                   ; 1907 _ 4C: 8B. 9B, 00000110
        mov     r10, r9                                 ; 190E _ 4D: 89. CA
        mov     rbp, qword [rbx+118H]                   ; 1911 _ 48: 8B. AB, 00000118
        or      r8, r12                                 ; 1918 _ 4D: 09. E0
        shl     r10, 16                                 ; 191B _ 49: C1. E2, 10
        andn    rdi, r8, rsi                            ; 191F _ C4 E2 B8: F2. FE
        or      r9, r10                                 ; 1924 _ 4D: 09. D1
        mov     rsi, qword [rsp+60H]                    ; 1927 _ 48: 8B. 74 24, 60
        mov     r10, qword [rsp+40H]                    ; 192C _ 4C: 8B. 54 24, 40
        and     r9, rdi                                 ; 1931 _ 49: 21. F9
        shr     rdi, 32                                 ; 1934 _ 48: C1. EF, 20
        and     rax, r11                                ; 1938 _ 4C: 21. D8
        or      rdi, r9                                 ; 193B _ 4C: 09. CF
        and     r11, r15                                ; 193E _ 4D: 21. FB
        and     rdx, rbp                                ; 1941 _ 48: 21. EA
        popcnt  rcx, rax                                ; 1944 _ F3 48: 0F B8. C8
        popcnt  r12, rdi                                ; 1949 _ F3 4C: 0F B8. E7
        popcnt  r8, r11                                 ; 194E _ F3 4D: 0F B8. C3
        popcnt  rdx, rdx                                ; 1953 _ F3 48: 0F B8. D2
        and     r15, rbp                                ; 1958 _ 49: 21. EF
        lea     r9d, [rdx+rcx]                          ; 195B _ 44: 8D. 0C 0A
        mov     rdi, rsi                                ; 195F _ 48: 89. F7
        popcnt  r15, r15                                ; 1962 _ F3 4D: 0F B8. FF
        or      r10, rsi                                ; 1967 _ 49: 09. F2
        shr     rdi, 8                                  ; 196A _ 48: C1. EF, 08
        add     r9d, r8d                                ; 196E _ 45: 01. C1
        not     r10                                     ; 1971 _ 49: F7. D2
        or      rdi, rsi                                ; 1974 _ 48: 09. F7
        add     r9d, r15d                               ; 1977 _ 45: 01. F9
        and     r10d, 3C3C3C00H                         ; 197A _ 41: 81. E2, 3C3C3C00
        and     r10, qword [rsp+78H]                    ; 1981 _ 4C: 23. 54 24, 78
        mov     r11, rdi                                ; 1986 _ 49: 89. FB
        add     r15d, r8d                               ; 1989 _ 45: 01. C7
        shr     r11, 16                                 ; 198C _ 49: C1. EB, 10
        or      rdi, r11                                ; 1990 _ 4C: 09. DF
        and     rdi, r10                                ; 1993 _ 4C: 21. D7
        shl     r10, 32                                 ; 1996 _ 49: C1. E2, 20
        or      r10, rdi                                ; 199A _ 49: 09. FA
        popcnt  rax, r10                                ; 199D _ F3 49: 0F B8. C2
        add     ecx, r15d                               ; 19A2 _ 44: 01. F9
        imul    r12d, r9d                               ; 19A5 _ 45: 0F AF. E1
        add     edx, ecx                                ; 19A9 _ 01. CA
        mov     ecx, 780903145                          ; 19AB _ B9, 2E8BA2E9
        imul    eax, edx                                ; 19B0 _ 0F AF. C2
        imul    r12d, r9d                               ; 19B3 _ 45: 0F AF. E1
        imul    edx, eax                                ; 19B7 _ 0F AF. D0
        add     r12d, r12d                              ; 19BA _ 45: 01. E4
        add     edx, edx                                ; 19BD _ 01. D2
        mov     eax, edx                                ; 19BF _ 89. D0
        imul    ecx                                     ; 19C1 _ F7. E9
        mov     eax, r12d                               ; 19C3 _ 44: 89. E0
        shr     edx, 1                                  ; 19C6 _ D1. EA
        mov     ebp, edx                                ; 19C8 _ 89. D5
        imul    ecx                                     ; 19CA _ F7. E9
        shr     edx, 1                                  ; 19CC _ D1. EA
        sub     ebp, edx                                ; 19CE _ 29. D5
        shl     ebp, 16                                 ; 19D0 _ C1. E5, 10
        add     r14d, ebp                               ; 19D3 _ 41: 01. EE
        jmp     ?_153                                   ; 19D6 _ E9, FFFFF5C0

; Filling space: 5H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_198:  mov     r8, r14                                 ; 19E0 _ 4D: 89. F0
        mov     rdx, rbx                                ; 19E3 _ 48: 89. DA
        mov     rcx, r13                                ; 19E6 _ 4C: 89. E9
        call    _ZN5Pawns5Entry14do_king_safetyIL5Color1EEE5ScoreRK8Position6Square; 19E9 _ E8, 00000000(rel)
        mov     r11, qword [rbx+130H]                   ; 19EE _ 4C: 8B. 9B, 00000130
        mov     r15, qword [rbx+140H]                   ; 19F5 _ 4C: 8B. BB, 00000140
        mov     ebp, eax                                ; 19FC _ 89. C5
        mov     dword [r13+54H], eax                    ; 19FE _ 41: 89. 45, 54
        mov     qword [rsp+88H], r11                    ; 1A02 _ 4C: 89. 9C 24, 00000088
        and     r11, r15                                ; 1A0A _ 4D: 21. FB
        mov     qword [rsp+48H], r11                    ; 1A0D _ 4C: 89. 5C 24, 48
        jmp     ?_123                                   ; 1A12 _ E9, FFFFEF07

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_199:  test    qword [rsp+40H], r8                     ; 1A20 _ 4C: 85. 44 24, 40
        lea     r11, [rel _ZN12_GLOBAL__N_1L16ReachableOutpostE]; 1A25 _ 4C: 8D. 1D, 000008F0(rel)
        setne   r8b                                     ; 1A2C _ 41: 0F 95. C0
        movzx   eax, r8b                                ; 1A30 _ 41: 0F B6. C0
        add     rax, 2                                  ; 1A34 _ 48: 83. C0, 02
        add     r14d, dword [r11+rax*4]                 ; 1A38 _ 45: 03. 34 83
        jmp     ?_171                                   ; 1A3C _ E9, FFFFF9C7

?_200:  mov     r15d, dword [rsp+190H]                  ; 1A41 _ 44: 8B. BC 24, 00000190
        cmp     r8d, r15d                               ; 1A49 _ 45: 39. F8
        setb    r8b                                     ; 1A4C _ 41: 0F 92. C0
        cmp     r15d, 3                                 ; 1A50 _ 41: 83. FF, 03
        seta    bl                                      ; 1A54 _ 0F 97. C3
        cmp     bl, r8b                                 ; 1A57 _ 44: 38. C3
        je      ?_113                                   ; 1A5A _ 0F 84, FFFFEC67
        mov     rcx, qword [rsp+188H]                   ; 1A60 _ 48: 8B. 8C 24, 00000188
        shr     rcx, 3                                  ; 1A68 _ 48: C1. E9, 03
        cmp     esi, ecx                                ; 1A6C _ 39. CE
        jz      ?_201                                   ; 1A6E _ 74, 08
        test    ecx, ecx                                ; 1A70 _ 85. C9
        jne     ?_113                                   ; 1A72 _ 0F 85, FFFFEC4F
?_201:  test    r8b, r8b                                ; 1A78 _ 45: 84. C0
        mov     r15d, dword [rsp+194H]                  ; 1A7B _ 44: 8B. BC 24, 00000194
        jne     ?_289                                   ; 1A83 _ 0F 85, 00000D79
?_202:  test    dword [rsp+0E0H], r15d                  ; 1A89 _ 44: 85. BC 24, 000000E0
        jne     ?_113                                   ; 1A91 _ 0F 85, FFFFEC30
        mov     r8, qword [rsp+158H]                    ; 1A97 _ 4C: 8B. 84 24, 00000158
        mov     esi, dword [rsp+198H]                   ; 1A9F _ 8B. B4 24, 00000198
        mov     ebx, dword [r8+18H]                     ; 1AA6 _ 41: 8B. 58, 18
        mov     ecx, ebx                                ; 1AAA _ 89. D9
        mov     dword [rsp+1ACH], ebx                   ; 1AAC _ 89. 9C 24, 000001AC
        and     ecx, 03H                                ; 1AB3 _ 83. E1, 03
        cmp     ecx, 1                                  ; 1AB6 _ 83. F9, 01
        sbb     r15d, r15d                              ; 1AB9 _ 45: 19. FF
        imul    r9d, r9d, 22                            ; 1ABC _ 45: 6B. C9, 16
        not     r15d                                    ; 1AC0 _ 41: F7. D7
        add     r15d, 2                                 ; 1AC3 _ 41: 83. C7, 02
        shl     r9d, 16                                 ; 1AC7 _ 41: C1. E1, 10
        sub     esi, r9d                                ; 1ACB _ 44: 29. CE
        imul    r15d, esi                               ; 1ACE _ 44: 0F AF. FE
        sub     dword [rsp+10CH], r15d                  ; 1AD2 _ 44: 29. BC 24, 0000010C
        jmp     ?_113                                   ; 1ADA _ E9, FFFFEBE8

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_203:  mov     r10, qword [rsp+0B0H]                   ; 1AE0 _ 4C: 8B. 94 24, 000000B0
        add     dword [rsp+0F0H], 1                     ; 1AE8 _ 83. 84 24, 000000F0, 01
        add     dword [rsp+108H], 7                     ; 1AF0 _ 83. 84 24, 00000108, 07
        and     r10, rdx                                ; 1AF8 _ 49: 21. D2
        je      ?_101                                   ; 1AFB _ 0F 84, FFFFE84C
        popcnt  r12, r10                                ; 1B01 _ F3 4D: 0F B8. E2
        add     dword [rsp+11CH], r12d                  ; 1B06 _ 44: 01. A4 24, 0000011C
        jmp     ?_101                                   ; 1B0E _ E9, FFFFE83A

?_204:  lea     rbp, [rel _ZN12_GLOBAL__N_1L6ThreatE]   ; 1B13 _ 48: 8D. 2D, 00000880(rel)
?_205:  bsf     rdi, r8                                 ; 1B1A _ 49: 0F BC. F8
        mov     edi, dword [rbx+rdi*4]                  ; 1B1E _ 8B. 3C BB
        blsr    r8, r8                                  ; 1B21 _ C4 C2 B8: F3. C8
        and     edi, 07H                                ; 1B26 _ 83. E7, 07
        add     eax, dword [rbp+rdi*4+20H]              ; 1B29 _ 03. 44 BD, 20
        test    r8, r8                                  ; 1B2D _ 4D: 85. C0
        je      ?_146                                   ; 1B30 _ 0F 84, FFFFF340
        jmp     ?_205                                   ; 1B36 _ EB, E2

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_206:  lea     rsi, [rel _ZN12_GLOBAL__N_1L6ThreatE]   ; 1B40 _ 48: 8D. 35, 00000880(rel)
?_207:  bsf     rcx, rax                                ; 1B47 _ 48: 0F BC. C8
        mov     r9d, dword [rbx+rcx*4]                  ; 1B4B _ 44: 8B. 0C 8B
        blsr    rax, rax                                ; 1B4F _ C4 E2 F8: F3. C8
        and     r9d, 07H                                ; 1B54 _ 41: 83. E1, 07
        add     r11d, dword [rsi+r9*4+20H]              ; 1B58 _ 46: 03. 5C 8E, 20
        test    rax, rax                                ; 1B5D _ 48: 85. C0
        je      ?_139                                   ; 1B60 _ 0F 84, FFFFF1E1
        jmp     ?_207                                   ; 1B66 _ EB, DF

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_208:  mov     r9, qword [rsp+48H]                     ; 1B70 _ 4C: 8B. 4C 24, 48
        mov     edi, r14d                               ; 1B75 _ 44: 89. F7
        mov     r11, r10                                ; 1B78 _ 4D: 89. D3
        mov     r14, r13                                ; 1B7B _ 4D: 89. EE
        bsf     rbp, qword [rsp+88H]                    ; 1B7E _ 48: 0F BC. AC 24, 00000088
        bsf     rcx, r9                                 ; 1B87 _ 49: 0F BC. C9
        shl     rbp, 6                                  ; 1B8B _ 48: C1. E5, 06
        shl     rcx, 6                                  ; 1B8F _ 48: C1. E1, 06
        mov     qword [rsp+0A8H], r10                   ; 1B93 _ 4C: 89. 94 24, 000000A8
        bsf     rsi, r9                                 ; 1B9B _ 49: 0F BC. F1
        shl     rsi, 6                                  ; 1B9F _ 48: C1. E6, 06
        mov     qword [rsp+0C0H], rbp                   ; 1BA3 _ 48: 89. AC 24, 000000C0
        mov     qword [rsp+0E0H], rcx                   ; 1BAB _ 48: 89. 8C 24, 000000E0
        mov     qword [rsp+0D0H], rsi                   ; 1BB3 _ 48: 89. B4 24, 000000D0
        mov     qword [rsp+0B0H], r12                   ; 1BBB _ 4C: 89. A4 24, 000000B0
        mov     dword [rsp+0A0H], edi                   ; 1BC3 _ 89. BC 24, 000000A0
?_209:  bsf     r9, r11                                 ; 1BCA _ 4D: 0F BC. CB
        lea     r10, [rel _ZN12_GLOBAL__N_1L6PassedE]   ; 1BCE _ 4C: 8D. 15, 00000000(rel)
        mov     r8, r9                                  ; 1BD5 _ 4D: 89. C8
        blsr    r11, r11                                ; 1BD8 _ C4 C2 A0: F3. CB
        shr     r8, 3                                   ; 1BDD _ 49: C1. E8, 03
        lea     esi, [r8-1H]                            ; 1BE1 _ 41: 8D. 70, FF
        sub     r8d, 2                                  ; 1BE5 _ 41: 83. E8, 02
        imul    r8d, esi                                ; 1BE9 _ 44: 0F AF. C6
        movsxd  r13, esi                                ; 1BED _ 4C: 63. EE
        mov     r12d, dword [r10+r13*4]                 ; 1BF0 _ 47: 8B. 24 AA
        mov     ecx, dword [r10+r13*4+20H]              ; 1BF4 _ 43: 8B. 4C AA, 20
        test    r8d, r8d                                ; 1BF9 _ 45: 85. C0
        je      ?_214                                   ; 1BFC _ 0F 84, 0000014C
        mov     rdi, qword [rsp+0C0H]                   ; 1C02 _ 48: 8B. BC 24, 000000C0
        lea     ebp, [r9+8H]                            ; 1C0A _ 41: 8D. 69, 08
        mov     r13, qword [rel .refptr.SquareDistance] ; 1C0E _ 4C: 8B. 2D, 00000000(rel)
        movsxd  r10, ebp                                ; 1C15 _ 4C: 63. D5
        add     rdi, r10                                ; 1C18 _ 4C: 01. D7
        mov     ebp, dword [r13+rdi*4]                  ; 1C1B _ 41: 8B. 6C BD, 00
        mov     rdi, qword [rsp+0E0H]                   ; 1C20 _ 48: 8B. BC 24, 000000E0
        mov     r13, qword [rel .refptr.SquareDistance] ; 1C28 _ 4C: 8B. 2D, 00000000(rel)
        lea     ebp, [rbp+rbp*4]                        ; 1C2F _ 8D. 6C AD, 00
        add     rdi, r10                                ; 1C33 _ 4C: 01. D7
        mov     edi, dword [r13+rdi*4]                  ; 1C36 _ 41: 8B. 7C BD, 00
        neg     edi                                     ; 1C3B _ F7. DF
        lea     ebp, [rbp+rdi*2]                        ; 1C3D _ 8D. 6C 7D, 00
        mov     rdi, r10                                ; 1C41 _ 4C: 89. D7
        imul    ebp, r8d                                ; 1C44 _ 41: 0F AF. E8
        shr     rdi, 3                                  ; 1C48 _ 48: C1. EF, 03
        add     ecx, ebp                                ; 1C4C _ 01. E9
        cmp     edi, 7                                  ; 1C4E _ 83. FF, 07
        jz      ?_210                                   ; 1C51 _ 74, 1B
        lea     ebp, [r9+10H]                           ; 1C53 _ 41: 8D. 69, 10
        movsxd  rdi, ebp                                ; 1C57 _ 48: 63. FD
        add     rdi, qword [rsp+0D0H]                   ; 1C5A _ 48: 03. BC 24, 000000D0
        mov     r13d, dword [r13+rdi*4]                 ; 1C62 _ 45: 8B. 6C BD, 00
        imul    r13d, r8d                               ; 1C67 _ 45: 0F AF. E8
        sub     ecx, r13d                               ; 1C6B _ 44: 29. E9
?_210:  mov     edi, dword [rbx+r10*4]                  ; 1C6E _ 42: 8B. 3C 93
        test    edi, edi                                ; 1C72 _ 85. FF
        jne     ?_263                                   ; 1C74 _ 0F 85, 000008D6
        mov     r13, qword [rsp+68H]                    ; 1C7A _ 4C: 8B. 6C 24, 68
        mov     rdi, qword [rel .refptr.RookMasks]      ; 1C7F _ 48: 8B. 3D, 00000000(rel)
        mov     rsi, qword [rel .refptr.ForwardBB]      ; 1C86 _ 48: 8B. 35, 00000000(rel)
        pext    rdi, r13, qword [rdi+r9*8]              ; 1C8D _ C4 A2 92: F5. 3C CF
        mov     r13, qword [rel .refptr.ForwardBB]      ; 1C93 _ 4C: 8B. 2D, 00000000(rel)
        mov     edi, edi                                ; 1C9A _ 89. FF
        mov     rbp, qword [rsi+r9*8]                   ; 1C9C _ 4A: 8B. 2C CE
        mov     rsi, qword [rbx+128H]                   ; 1CA0 _ 48: 8B. B3, 00000128
        or      rsi, qword [rbx+120H]                   ; 1CA7 _ 48: 0B. B3, 00000120
        and     rsi, qword [r13+r9*8+200H]              ; 1CAE _ 4B: 23. B4 CD, 00000200
        mov     r13, qword [rel .refptr.RookAttacks]    ; 1CB6 _ 4C: 8B. 2D, 00000000(rel)
        mov     r13, qword [r13+r9*8]                   ; 1CBD _ 4F: 8B. 6C CD, 00
        and     rsi, qword [r13+rdi*8]                  ; 1CC2 _ 49: 23. 74 FD, 00
        mov     rdi, qword [rsp+30H]                    ; 1CC7 _ 48: 8B. 7C 24, 30
        and     rdi, rbp                                ; 1CCC _ 48: 21. EF
        test    rsi, r15                                ; 1CCF _ 4C: 85. FE
        cmovne  rdi, rbp                                ; 1CD2 _ 48: 0F 45. FD
        test    rsi, rdx                                ; 1CD6 _ 48: 85. D6
        mov     qword [rsp+0B8H], rdi                   ; 1CD9 _ 48: 89. BC 24, 000000B8
        jne     ?_275                                   ; 1CE1 _ 0F 85, 000009CF
        mov     rsi, qword [rsp+28H]                    ; 1CE7 _ 48: 8B. 74 24, 28
        or      rsi, rdx                                ; 1CEC _ 48: 09. D6
        and     rsi, rbp                                ; 1CEF _ 48: 21. EE
?_211:  test    rsi, rsi                                ; 1CF2 _ 48: 85. F6
        je      ?_256                                   ; 1CF5 _ 0F 84, 000007B7
        mov     r13, qword [rel .refptr.SquareBB]       ; 1CFB _ 4C: 8B. 2D, 00000000(rel)
        and     rsi, qword [r13+r10*8]                  ; 1D02 _ 4B: 23. 74 D5, 00
        cmp     rsi, 1                                  ; 1D07 _ 48: 83. FE, 01
        sbb     edi, edi                                ; 1D0B _ 19. FF
        and     edi, 08H                                ; 1D0D _ 83. E7, 08
        lea     r13d, [rdi+6H]                          ; 1D10 _ 44: 8D. 6F, 06
        lea     esi, [rdi+4H]                           ; 1D14 _ 8D. 77, 04
        mov     dword [rsp+0E8H], r13d                  ; 1D17 _ 44: 89. AC 24, 000000E8
?_212:  cmp     rbp, qword [rsp+0B8H]                   ; 1D1F _ 48: 3B. AC 24, 000000B8
        je      ?_262                                   ; 1D27 _ 0F 84, 00000816
        mov     r13, qword [rel .refptr.SquareBB]       ; 1D2D _ 4C: 8B. 2D, 00000000(rel)
        mov     rbp, qword [rsp+0B8H]                   ; 1D34 _ 48: 8B. AC 24, 000000B8
        test    qword [r13+r10*8], rbp                  ; 1D3C _ 4B: 85. 6C D5, 00
        cmove   esi, edi                                ; 1D41 _ 0F 44. F7
?_213:  imul    r8d, esi                                ; 1D44 _ 44: 0F AF. C6
        add     r12d, r8d                               ; 1D48 _ 45: 01. C4
        add     ecx, r8d                                ; 1D4B _ 44: 01. C1
?_214:  mov     r10d, dword [rsp+58H]                   ; 1D4E _ 44: 8B. 54 24, 58
        cmp     dword [rsp+50H], r10d                   ; 1D53 _ 44: 39. 54 24, 50
        jl      ?_268                                   ; 1D58 _ 0F 8C, 000008B2
?_215:  lea     rdi, [rel _ZN12_GLOBAL__N_1L10PassedFileE]; 1D5E _ 48: 8D. 3D, 00000840(rel)
        and     r9d, 07H                                ; 1D65 _ 41: 83. E1, 07
        shl     r12d, 16                                ; 1D69 _ 41: C1. E4, 10
        add     ecx, r12d                               ; 1D6D _ 44: 01. E1
        add     ecx, dword [rdi+r9*4]                   ; 1D70 _ 42: 03. 0C 8F
        add     eax, ecx                                ; 1D74 _ 01. C8
        test    r11, r11                                ; 1D76 _ 4D: 85. DB
        jne     ?_209                                   ; 1D79 _ 0F 85, FFFFFE4B
        mov     r9d, dword [rsp+0A0H]                   ; 1D7F _ 44: 8B. 8C 24, 000000A0
        mov     r13, r14                                ; 1D87 _ 4D: 89. F5
        mov     r10, qword [rsp+0A8H]                   ; 1D8A _ 4C: 8B. 94 24, 000000A8
        mov     r12, qword [rsp+0B0H]                   ; 1D92 _ 4C: 8B. A4 24, 000000B0
        mov     r14d, r9d                               ; 1D9A _ 45: 89. CE
        jmp     ?_151                                   ; 1D9D _ E9, FFFFF1C3

?_216:  popcnt  r8, rax                                 ; 1DA2 _ F3 4C: 0F B8. C0
        imul    r8d, dword [rel _ZN12_GLOBAL__N_1L16ThreatByPawnPushE]; 1DA7 _ 44: 0F AF. 05, 00000808(rel)
        add     r11d, r8d                               ; 1DAF _ 45: 01. C3
        jmp     ?_142                                   ; 1DB2 _ E9, FFFFF036

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_217:  mov     r8, r12                                 ; 1DC0 _ 4D: 89. E0
        mov     rdx, rbx                                ; 1DC3 _ 48: 89. DA
        mov     rcx, r13                                ; 1DC6 _ 4C: 89. E9
        call    _ZN5Pawns5Entry14do_king_safetyIL5Color0EEE5ScoreRK8Position6Square; 1DC9 _ E8, 00000000(rel)
        mov     r15, qword [rbx+3B8H]                   ; 1DCE _ 4C: 8B. BB, 000003B8
        mov     r14, qword [rbx+130H]                   ; 1DD5 _ 4C: 8B. B3, 00000130
        mov     r9d, eax                                ; 1DDC _ 41: 89. C1
        mov     dword [r13+50H], eax                    ; 1DDF _ 41: 89. 45, 50
        mov     qword [rsp+70H], r15                    ; 1DE3 _ 4C: 89. 7C 24, 70
        mov     r15, qword [rbx+140H]                   ; 1DE8 _ 4C: 8B. BB, 00000140
        mov     qword [rsp+88H], r14                    ; 1DEF _ 4C: 89. B4 24, 00000088
        and     r14, r15                                ; 1DF7 _ 4D: 21. FE
        mov     qword [rsp+48H], r14                    ; 1DFA _ 4C: 89. 74 24, 48
        jmp     ?_130                                   ; 1DFF _ E9, FFFFECF8

?_218:  mov     r11, qword 55AA55AA55AA55AAH            ; 1E04 _ 49: BB, 55AA55AA55AA55AA
        test    r10, r11                                ; 1E0E _ 4D: 85. DA
        je      ?_156                                   ; 1E11 _ 0F 84, FFFFF2BB
        mov     r11, qword [rbx+3B8H]                   ; 1E17 _ 4C: 8B. 9B, 000003B8
        cmp     dword [r11+10H], 836                    ; 1E1E _ 41: 81. 7B, 10, 00000344
        je      ?_291                                   ; 1E26 _ 0F 84, 00000A0C
?_219:  imul    r10d, r9d, 46                           ; 1E2C _ 45: 6B. D1, 2E
        lea     r12d, [r10+3FH]                         ; 1E30 _ 45: 8D. 62, 3F
        test    r10d, r10d                              ; 1E34 _ 45: 85. D2
        cmovs   r10d, r12d                              ; 1E37 _ 45: 0F 48. D4
        sar     r10d, 6                                 ; 1E3B _ 41: C1. FA, 06
        mov     r9d, r10d                               ; 1E3F _ 45: 89. D1
        jmp     ?_157                                   ; 1E42 _ E9, FFFFF2AE

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_220:  xor     esi, esi                                ; 1E50 _ 31. F6
        test    qword [rsp+40H], r8                     ; 1E52 _ 4C: 85. 44 24, 40
        lea     r8, [rel _ZN12_GLOBAL__N_1L16ReachableOutpostE]; 1E57 _ 4C: 8D. 05, 000008F0(rel)
        setne   sil                                     ; 1E5E _ 40: 0F 95. C6
        mov     r10d, dword [r8+rsi*4]                  ; 1E62 _ 45: 8B. 14 B0
        add     dword [rsp+134H], r10d                  ; 1E66 _ 44: 01. 94 24, 00000134
        jmp     ?_177                                   ; 1E6E _ E9, FFFFF6BC

?_221:  popcnt  r10, rdi                                ; 1E73 _ F3 4C: 0F B8. D7
        imul    r10d, dword [rel _ZN12_GLOBAL__N_1L16ThreatByPawnPushE]; 1E78 _ 44: 0F AF. 15, 00000808(rel)
        add     eax, r10d                               ; 1E80 _ 44: 01. D0
        jmp     ?_149                                   ; 1E83 _ E9, FFFFF080

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_222:  mov     r8, qword [rsp+0E8H]                    ; 1E90 _ 4C: 8B. 84 24, 000000E8
        add     dword [rsp+0D0H], 1                     ; 1E98 _ 83. 84 24, 000000D0, 01
        add     dword [rsp+130H], 1                     ; 1EA0 _ 83. 84 24, 00000130, 01
        and     r8, rcx                                 ; 1EA8 _ 49: 21. C8
        je      ?_191                                   ; 1EAB _ 0F 84, FFFFF8D4
        popcnt  r11, r8                                 ; 1EB1 _ F3 4D: 0F B8. D8
        add     dword [rsp+150H], r11d                  ; 1EB6 _ 44: 01. 9C 24, 00000150
        jmp     ?_191                                   ; 1EBE _ E9, FFFFF8C2

?_223:  mov     r10, qword [rsp+140H]                   ; 1EC3 _ 4C: 8B. 94 24, 00000140
        or      r10, qword [rsp+98H]                    ; 1ECB _ 4C: 0B. 94 24, 00000098
        or      r10, qword [rsp+58H]                    ; 1ED3 _ 4C: 0B. 54 24, 58
        or      r10, qword [rsp+0E0H]                   ; 1ED8 _ 4C: 0B. 94 24, 000000E0
        and     rax, r10                                ; 1EE0 _ 4C: 21. D0
        je      ?_124                                   ; 1EE3 _ 0F 84, FFFFEB05
        popcnt  r11, rax                                ; 1EE9 _ F3 4C: 0F B8. D8
        imul    r8d, r11d, 89                           ; 1EEE _ 45: 6B. C3, 59
        add     edx, r8d                                ; 1EF2 _ 44: 01. C2
        jmp     ?_124                                   ; 1EF5 _ E9, FFFFEAF4

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_224:  mov     r8, qword [rsp+88H]                     ; 1F00 _ 4C: 8B. 84 24, 00000088
        mov     rbp, r14                                ; 1F08 _ 4C: 89. F5
        xor     r14d, r14d                              ; 1F0B _ 45: 31. F6
        popcnt  rcx, qword [rsp+60H]                    ; 1F0E _ F3 48: 0F B8. 4C 24, 60
        bsf     r10, qword [rsp+48H]                    ; 1F15 _ 4C: 0F BC. 54 24, 48
        shl     r10, 6                                  ; 1F1B _ 49: C1. E2, 06
        popcnt  rsi, r12                                ; 1F1F _ F3 49: 0F B8. F4
        mov     qword [rsp+50H], rcx                    ; 1F24 _ 48: 89. 4C 24, 50
        mov     qword [rsp+58H], rsi                    ; 1F29 _ 48: 89. 74 24, 58
        and     r8, rdx                                 ; 1F2E _ 49: 21. D0
        mov     qword [rsp+0A8H], r10                   ; 1F31 _ 4C: 89. 94 24, 000000A8
        bsf     r11, r8                                 ; 1F39 _ 4D: 0F BC. D8
        bsf     r9, r8                                  ; 1F3D _ 4D: 0F BC. C8
        shl     r11, 6                                  ; 1F41 _ 49: C1. E3, 06
        shl     r9, 6                                   ; 1F45 _ 49: C1. E1, 06
        mov     qword [rsp+88H], r8                     ; 1F49 _ 4C: 89. 84 24, 00000088
        mov     qword [rsp+0B0H], r11                   ; 1F51 _ 4C: 89. 9C 24, 000000B0
        mov     qword [rsp+0B8H], r9                    ; 1F59 _ 4C: 89. 8C 24, 000000B8
        mov     qword [rsp+0A0H], r12                   ; 1F61 _ 4C: 89. A4 24, 000000A0
?_225:  bsf     r8, rbp                                 ; 1F69 _ 4C: 0F BC. C5
        lea     rcx, [rel _ZN12_GLOBAL__N_1L6PassedE]   ; 1F6D _ 48: 8D. 0D, 00000000(rel)
        mov     rax, r8                                 ; 1F74 _ 4C: 89. C0
        blsr    rbp, rbp                                ; 1F77 _ C4 E2 D0: F3. CD
        lea     rsi, [rel _ZN12_GLOBAL__N_1L6PassedE]   ; 1F7C _ 48: 8D. 35, 00000000(rel)
        shr     rax, 3                                  ; 1F83 _ 48: C1. E8, 03
        xor     eax, 07H                                ; 1F87 _ 83. F0, 07
        lea     r10d, [rax-1H]                          ; 1F8A _ 44: 8D. 50, FF
        sub     eax, 2                                  ; 1F8E _ 83. E8, 02
        imul    eax, r10d                               ; 1F91 _ 41: 0F AF. C2
        movsxd  r12, r10d                               ; 1F95 _ 4D: 63. E2
        mov     edi, dword [rcx+r12*4]                  ; 1F98 _ 42: 8B. 3C A1
        mov     ecx, dword [rsi+r12*4+20H]              ; 1F9C _ 42: 8B. 4C A6, 20
        test    eax, eax                                ; 1FA1 _ 85. C0
        je      ?_230                                   ; 1FA3 _ 0F 84, 00000128
        mov     r12, qword [rsp+0A8H]                   ; 1FA9 _ 4C: 8B. A4 24, 000000A8
        lea     r11d, [r8-8H]                           ; 1FB1 _ 45: 8D. 58, F8
        mov     rsi, qword [rel .refptr.SquareDistance] ; 1FB5 _ 48: 8B. 35, 00000000(rel)
        movsxd  r9, r11d                                ; 1FBC _ 4D: 63. CB
        lea     r11, [r12+r9]                           ; 1FBF _ 4F: 8D. 1C 0C
        mov     r12d, dword [rsi+r11*4]                 ; 1FC3 _ 46: 8B. 24 9E
        mov     r11, qword [rsp+0B0H]                   ; 1FC7 _ 4C: 8B. 9C 24, 000000B0
        lea     esi, [r12+r12*4]                        ; 1FCF _ 43: 8D. 34 A4
        mov     r12, qword [rel .refptr.SquareDistance] ; 1FD3 _ 4C: 8B. 25, 00000000(rel)
        add     r11, r9                                 ; 1FDA _ 4D: 01. CB
        mov     r11d, dword [r12+r11*4]                 ; 1FDD _ 47: 8B. 1C 9C
        neg     r11d                                    ; 1FE1 _ 41: F7. DB
        lea     esi, [rsi+r11*2]                        ; 1FE4 _ 42: 8D. 34 5E
        mov     r11, r9                                 ; 1FE8 _ 4D: 89. CB
        imul    esi, eax                                ; 1FEB _ 0F AF. F0
        shr     r11, 3                                  ; 1FEE _ 49: C1. EB, 03
        add     ecx, esi                                ; 1FF2 _ 01. F1
        test    r11d, r11d                              ; 1FF4 _ 45: 85. DB
        jz      ?_226                                   ; 1FF7 _ 74, 1A
        lea     esi, [r8-10H]                           ; 1FF9 _ 41: 8D. 70, F0
        movsxd  r11, esi                                ; 1FFD _ 4C: 63. DE
        add     r11, qword [rsp+0B8H]                   ; 2000 _ 4C: 03. 9C 24, 000000B8
        mov     r12d, dword [r12+r11*4]                 ; 2008 _ 47: 8B. 24 9C
        imul    r12d, eax                               ; 200C _ 44: 0F AF. E0
        sub     ecx, r12d                               ; 2010 _ 44: 29. E1
?_226:  mov     r11d, dword [rbx+r9*4]                  ; 2013 _ 46: 8B. 1C 8B
        test    r11d, r11d                              ; 2017 _ 45: 85. DB
        jne     ?_266                                   ; 201A _ 0F 85, 00000570
        mov     r12, qword [rsp+68H]                    ; 2020 _ 4C: 8B. 64 24, 68
        mov     rsi, qword [rel .refptr.RookMasks]      ; 2025 _ 48: 8B. 35, 00000000(rel)
        mov     r10, qword [rel .refptr.ForwardBB]      ; 202C _ 4C: 8B. 15, 00000000(rel)
        pext    rsi, r12, qword [rsi+r8*8]              ; 2033 _ C4 A2 9A: F5. 34 C6
        mov     r12, qword [rel .refptr.ForwardBB]      ; 2039 _ 4C: 8B. 25, 00000000(rel)
        mov     esi, esi                                ; 2040 _ 89. F6
        mov     r11, qword [r10+r8*8+200H]              ; 2042 _ 4F: 8B. 9C C2, 00000200
        mov     r10, qword [rbx+128H]                   ; 204A _ 4C: 8B. 93, 00000128
        or      r10, qword [rbx+120H]                   ; 2051 _ 4C: 0B. 93, 00000120
        and     r10, qword [r12+r8*8]                   ; 2058 _ 4F: 23. 14 C4
        mov     r12, qword [rel .refptr.RookAttacks]    ; 205C _ 4C: 8B. 25, 00000000(rel)
        mov     r12, qword [r12+r8*8]                   ; 2063 _ 4F: 8B. 24 C4
        and     r10, qword [r12+rsi*8]                  ; 2067 _ 4D: 23. 14 F4
        mov     rsi, qword [rsp+28H]                    ; 206B _ 48: 8B. 74 24, 28
        and     rsi, r11                                ; 2070 _ 4C: 21. DE
        test    r10, rdx                                ; 2073 _ 49: 85. D2
        cmovne  rsi, r11                                ; 2076 _ 49: 0F 45. F3
        test    r10, r15                                ; 207A _ 4D: 85. FA
        jne     ?_288                                   ; 207D _ 0F 85, 00000777
        mov     r10, qword [rsp+30H]                    ; 2083 _ 4C: 8B. 54 24, 30
        or      r10, r15                                ; 2088 _ 4D: 09. FA
        and     r10, r11                                ; 208B _ 4D: 21. DA
?_227:  test    r10, r10                                ; 208E _ 4D: 85. D2
        je      ?_257                                   ; 2091 _ 0F 84, 00000439
        mov     r12, qword [rel .refptr.SquareBB]       ; 2097 _ 4C: 8B. 25, 00000000(rel)
        and     r10, qword [r12+r9*8]                   ; 209E _ 4F: 23. 14 CC
        cmp     r10, 1                                  ; 20A2 _ 49: 83. FA, 01
        sbb     r10d, r10d                              ; 20A6 _ 45: 19. D2
        and     r10d, 08H                               ; 20A9 _ 41: 83. E2, 08
        lea     r12d, [r10+4H]                          ; 20AD _ 45: 8D. 62, 04
?_228:  cmp     r11, rsi                                ; 20B1 _ 49: 39. F3
        je      ?_274                                   ; 20B4 _ 0F 84, 000005F3
        mov     r11, qword [rel .refptr.SquareBB]       ; 20BA _ 4C: 8B. 1D, 00000000(rel)
        test    qword [r11+r9*8], rsi                   ; 20C1 _ 4B: 85. 34 CB
        cmovne  r10d, r12d                              ; 20C5 _ 45: 0F 45. D4
?_229:  imul    eax, r10d                               ; 20C9 _ 41: 0F AF. C2
        add     edi, eax                                ; 20CD _ 01. C7
        add     ecx, eax                                ; 20CF _ 01. C1
?_230:  mov     eax, dword [rsp+58H]                    ; 20D1 _ 8B. 44 24, 58
        cmp     dword [rsp+50H], eax                    ; 20D5 _ 39. 44 24, 50
        jg      ?_261                                   ; 20D9 _ 0F 8F, 00000452
?_231:  lea     r10, [rel _ZN12_GLOBAL__N_1L10PassedFileE]; 20DF _ 4C: 8D. 15, 00000840(rel)
        and     r8d, 07H                                ; 20E6 _ 41: 83. E0, 07
        shl     edi, 16                                 ; 20EA _ C1. E7, 10
        add     ecx, edi                                ; 20ED _ 01. F9
        add     ecx, dword [r10+r8*4]                   ; 20EF _ 43: 03. 0C 82
        add     r14d, ecx                               ; 20F3 _ 41: 01. CE
        test    rbp, rbp                                ; 20F6 _ 48: 85. ED
        jne     ?_225                                   ; 20F9 _ 0F 85, FFFFFE6A
        mov     r12, qword [rsp+0A0H]                   ; 20FF _ 4C: 8B. A4 24, 000000A0
        jmp     ?_150                                   ; 2107 _ E9, FFFFEE4A

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_232:  xor     r12d, r12d                              ; 2110 _ 45: 31. E4
        test    qword [rsp+38H], rsi                    ; 2113 _ 48: 85. 74 24, 38
        lea     rsi, [rel _ZN12_GLOBAL__N_1L7OutpostE]  ; 2118 _ 48: 8D. 35, 00000900(rel)
        setne   r12b                                    ; 211F _ 41: 0F 95. C4
        mov     edx, dword [rsi+r12*4]                  ; 2123 _ 42: 8B. 14 A6
        add     dword [rsp+118H], edx                   ; 2127 _ 01. 94 24, 00000118
        jmp     ?_102                                   ; 212E _ E9, FFFFE246

?_233:  mov     rsi, qword [rsp+0B0H]                   ; 2133 _ 48: 8B. B4 24, 000000B0
        add     dword [rsp+0F0H], 1                     ; 213B _ 83. 84 24, 000000F0, 01
        add     dword [rsp+108H], 4                     ; 2143 _ 83. 84 24, 00000108, 04
        and     rsi, r9                                 ; 214B _ 4C: 21. CE
        je      ?_111                                   ; 214E _ 0F 84, FFFFE52E
        popcnt  rcx, rsi                                ; 2154 _ F3 48: 0F B8. CE
        add     dword [rsp+11CH], ecx                   ; 2159 _ 01. 8C 24, 0000011C
        jmp     ?_111                                   ; 2160 _ E9, FFFFE51D

?_234:  mov     r10, qword [rsp+0E8H]                   ; 2165 _ 4C: 8B. 94 24, 000000E8
        add     dword [rsp+0D0H], 1                     ; 216D _ 83. 84 24, 000000D0, 01
        add     dword [rsp+130H], 7                     ; 2175 _ 83. 84 24, 00000130, 07
        and     r10, r8                                 ; 217D _ 4D: 21. C2
        je      ?_176                                   ; 2180 _ 0F 84, FFFFF37D
        popcnt  r12, r10                                ; 2186 _ F3 4D: 0F B8. E2
        add     dword [rsp+150H], r12d                  ; 218B _ 44: 01. A4 24, 00000150
        jmp     ?_176                                   ; 2193 _ E9, FFFFF36B

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_235:  mov     dword [rsp+0D0H], 0                     ; 21A0 _ C7. 84 24, 000000D0, 00000000
        mov     qword [rsp+80H], 0                      ; 21AB _ 48: C7. 84 24, 00000080, 00000000
        jmp     ?_097                                   ; 21B7 _ E9, FFFFDFED

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_236:  add     edx, 50                                 ; 21C0 _ 83. C2, 32
        sub     ebp, dword [rel _ZN12_GLOBAL__N_1L7CheckedE]; 21C3 _ 2B. 2D, 00000814(rel)
        jmp     ?_125                                   ; 21C9 _ E9, FFFFE8A0

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_237:  lea     r14, [rel _ZN12_GLOBAL__N_1L7OutpostE]  ; 21D0 _ 4C: 8D. 35, 00000900(rel)
        xor     r8d, r8d                                ; 21D7 _ 45: 31. C0
        test    qword [rsp+38H], rsi                    ; 21DA _ 48: 85. 74 24, 38
        setne   r8b                                     ; 21DF _ 41: 0F 95. C0
        add     r8, 2                                   ; 21E3 _ 49: 83. C0, 02
        add     r12d, dword [r14+r8*4]                  ; 21E7 _ 47: 03. 24 86
        jmp     ?_162                                   ; 21EB _ E9, FFFFF061

?_238:  mov     dword [rsp+0F0H], 0                     ; 21F0 _ C7. 84 24, 000000F0, 00000000
        mov     qword [rsp+88H], 0                      ; 21FB _ 48: C7. 84 24, 00000088, 00000000
        jmp     ?_096                                   ; 2207 _ E9, FFFFDED6

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_239:  mov     rsi, qword [rsp+0E8H]                   ; 2210 _ 48: 8B. B4 24, 000000E8
        add     dword [rsp+0D0H], 1                     ; 2218 _ 83. 84 24, 000000D0, 01
        add     dword [rsp+130H], 4                     ; 2220 _ 83. 84 24, 00000130, 04
        and     rsi, r8                                 ; 2228 _ 4C: 21. C6
        je      ?_117                                   ; 222B _ 0F 84, FFFFE5CE
        popcnt  r11, rsi                                ; 2231 _ F3 4C: 0F B8. DE
        add     dword [rsp+150H], r11d                  ; 2236 _ 44: 01. 9C 24, 00000150
        jmp     ?_117                                   ; 223E _ E9, FFFFE5BC

?_240:  mov     rsi, r14                                ; 2243 _ 4C: 89. F6
        mov     r14, qword [rel .refptr.PseudoAttacks]  ; 2246 _ 4C: 8B. 35, 00000000(rel)
        mov     r11, qword [rsp+178H]                   ; 224D _ 4C: 8B. 9C 24, 00000178
        and     r11, qword [rsi+r14+800H]               ; 2255 _ 4E: 23. 9C 36, 00000800
        je      ?_118                                   ; 225D _ 0F 84, FFFFE5C7
        popcnt  rsi, r11                                ; 2263 _ F3 49: 0F B8. F3
        imul    esi, dword [rsp+194H]                   ; 2268 _ 0F AF. B4 24, 00000194
        add     r15d, esi                               ; 2270 _ 41: 01. F7
        jmp     ?_118                                   ; 2273 _ E9, FFFFE5B2

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_241:  add     ecx, 50                                 ; 2280 _ 83. C1, 32
        sub     r9d, dword [rel _ZN12_GLOBAL__N_1L7CheckedE]; 2283 _ 44: 2B. 0D, 00000814(rel)
        jmp     ?_132                                   ; 228A _ E9, FFFFE9C3

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_242:  mov     r14, qword [rsp+148H]                   ; 2290 _ 4C: 8B. B4 24, 00000148
        or      r14, qword [rsp+0B8H]                   ; 2298 _ 4C: 0B. B4 24, 000000B8
        or      r14, qword [rsp+50H]                    ; 22A0 _ 4C: 0B. 74 24, 50
        or      r14, qword [rsp+0C0H]                   ; 22A5 _ 4C: 0B. B4 24, 000000C0
        and     r10, r14                                ; 22AD _ 4D: 21. F2
        je      ?_131                                   ; 22B0 _ 0F 84, FFFFE917
        popcnt  r10, r10                                ; 22B6 _ F3 4D: 0F B8. D2
        imul    r8d, r10d, 89                           ; 22BB _ 45: 6B. C2, 59
        add     ecx, r8d                                ; 22BF _ 44: 01. C1
        jmp     ?_131                                   ; 22C2 _ E9, FFFFE906

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_243:  mov     rdi, qword [rsp+30H]                    ; 22D0 _ 48: 8B. 7C 24, 30
        and     rbp, rdx                                ; 22D5 _ 48: 21. D5
        mov     rcx, qword 7F7F7F7F7F7F7F7FH            ; 22D8 _ 48: B9, 7F7F7F7F7F7F7F7F
        mov     r11, qword 0FEFEFEFEFEFEFEFEH           ; 22E2 _ 49: BB, FEFEFEFEFEFEFEFE
        mov     r8, qword [rsp+28H]                     ; 22EC _ 4C: 8B. 44 24, 28
        mov     r12, rbp                                ; 22F1 _ 49: 89. EC
        not     rdi                                     ; 22F4 _ 48: F7. D7
        or      r8, rdi                                 ; 22F7 _ 49: 09. F8
        mov     rsi, r8                                 ; 22FA _ 4C: 89. C6
        mov     qword [rsp+80H], r8                     ; 22FD _ 4C: 89. 84 24, 00000080
        and     rsi, rbp                                ; 2305 _ 48: 21. EE
        and     rcx, rsi                                ; 2308 _ 48: 21. F1
        and     r11, rsi                                ; 230B _ 49: 21. F3
        shr     r11, 9                                  ; 230E _ 49: C1. EB, 09
        shr     rcx, 7                                  ; 2312 _ 48: C1. E9, 07
        or      rcx, r11                                ; 2316 _ 4C: 09. D9
        xor     r11d, r11d                              ; 2319 _ 45: 31. DB
        and     rcx, r10                                ; 231C _ 4C: 21. D1
        cmp     r10, rcx                                ; 231F _ 49: 39. CA
        jne     ?_269                                   ; 2322 _ 0F 85, 000002FE
?_244:  lea     rbp, [rel _ZN12_GLOBAL__N_1L16ThreatBySafePawnE]; 2328 _ 48: 8D. 2D, 000008C0(rel)
?_245:  bsf     r10, rcx                                ; 232F _ 4C: 0F BC. D1
        mov     r9d, dword [rbx+r10*4]                  ; 2333 _ 46: 8B. 0C 93
        blsr    rcx, rcx                                ; 2337 _ C4 E2 F0: F3. C9
        and     r9d, 07H                                ; 233C _ 41: 83. E1, 07
        add     r11d, dword [rbp+r9*4]                  ; 2340 _ 46: 03. 5C 8D, 00
        test    rcx, rcx                                ; 2345 _ 48: 85. C9
        je      ?_137                                   ; 2348 _ 0F 84, FFFFE9AA
        jmp     ?_245                                   ; 234E _ EB, DF

?_246:  mov     edi, dword [rsp+10CH]                   ; 2350 _ 8B. BC 24, 0000010C
        mov     qword [rsp+98H], r14                    ; 2357 _ 4C: 89. B4 24, 00000098
        mov     rdx, qword [rsp+58H]                    ; 235F _ 48: 8B. 54 24, 58
        add     dword [rsp+118H], edi                   ; 2364 _ 01. BC 24, 00000118
        jmp     ?_098                                   ; 236B _ E9, FFFFDF64

?_247:  mov     rdi, qword [rsp+60H]                    ; 2370 _ 48: 8B. 7C 24, 60
        and     rdi, rax                                ; 2375 _ 48: 21. C7
        mov     rax, qword 0FEFEFEFEFEFEFEFEH           ; 2378 _ 48: B8, FEFEFEFEFEFEFEFE
        and     rax, rdi                                ; 2382 _ 48: 21. F8
        shl     rax, 7                                  ; 2385 _ 48: C1. E0, 07
        mov     qword [rsp+50H], rax                    ; 2389 _ 48: 89. 44 24, 50
        mov     rax, qword 7F7F7F7F7F7F7F7FH            ; 238E _ 48: B8, 7F7F7F7F7F7F7F7F
        and     rax, rdi                                ; 2398 _ 48: 21. F8
        shl     rax, 9                                  ; 239B _ 48: C1. E0, 09
        or      rax, qword [rsp+50H]                    ; 239F _ 48: 0B. 44 24, 50
        and     rax, rbp                                ; 23A4 _ 48: 21. E8
        mov     rdi, rax                                ; 23A7 _ 48: 89. C7
        xor     eax, eax                                ; 23AA _ 31. C0
        cmp     rbp, rdi                                ; 23AC _ 48: 39. FD
        jne     ?_276                                   ; 23AF _ 0F 85, 00000309
?_248:  mov     qword [rsp+50H], rdx                    ; 23B5 _ 48: 89. 54 24, 50
?_249:  bsf     rdx, rdi                                ; 23BA _ 48: 0F BC. D7
        mov     ebp, dword [rbx+rdx*4]                  ; 23BE _ 8B. 2C 93
        lea     rdx, [rel _ZN12_GLOBAL__N_1L16ThreatBySafePawnE]; 23C1 _ 48: 8D. 15, 000008C0(rel)
        blsr    rdi, rdi                                ; 23C8 _ C4 E2 C0: F3. CF
        and     ebp, 07H                                ; 23CD _ 83. E5, 07
        add     eax, dword [rdx+rbp*4]                  ; 23D0 _ 03. 04 AA
        test    rdi, rdi                                ; 23D3 _ 48: 85. FF
        jnz     ?_249                                   ; 23D6 _ 75, E2
        mov     rdx, qword [rsp+50H]                    ; 23D8 _ 48: 8B. 54 24, 50
        jmp     ?_143                                   ; 23DD _ E9, FFFFEA36

?_250:  mov     rbx, qword [rel .refptr.PseudoAttacks]  ; 23E2 _ 48: 8B. 1D, 00000000(rel)
        mov     rcx, qword [rsp+180H]                   ; 23E9 _ 48: 8B. 8C 24, 00000180
        and     rcx, qword [r15+rbx+800H]               ; 23F1 _ 49: 23. 8C 1F, 00000800
        je      ?_112                                   ; 23F9 _ 0F 84, FFFFE2A8
        popcnt  rbx, rcx                                ; 23FF _ F3 48: 0F B8. D9
        imul    ebx, dword [rsp+1A8H]                   ; 2404 _ 0F AF. 9C 24, 000001A8
        add     dword [rsp+10CH], ebx                   ; 240C _ 01. 9C 24, 0000010C
        jmp     ?_112                                   ; 2413 _ E9, FFFFE28F

; Filling space: 8H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 84H, 00H, 00H, 00H, 00H, 00H

ALIGN   16
?_251:  mov     r10d, dword [rsp+10CH]                  ; 2420 _ 44: 8B. 94 24, 0000010C
        mov     qword [rsp+0B8H], r14                   ; 2428 _ 4C: 89. B4 24, 000000B8
        mov     rcx, qword [rsp+0C0H]                   ; 2430 _ 48: 8B. 8C 24, 000000C0
        add     dword [rsp+134H], r10d                  ; 2438 _ 44: 01. 94 24, 00000134
        jmp     ?_105                                   ; 2440 _ E9, FFFFDFC0

?_252:  popcnt  r9, rbp                                 ; 2445 _ F3 4C: 0F B8. CD
        mov     qword [rsp+0D0H], r9                    ; 244A _ 4C: 89. 8C 24, 000000D0
        jmp     ?_097                                   ; 2452 _ E9, FFFFDD52

; Filling space: 9H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 84H, 00H, 00H, 00H, 00H
;       db 00H

ALIGN   16
?_253:  lea     rax, [rel _ZN12_GLOBAL__N_1L7OutpostE]  ; 2460 _ 48: 8D. 05, 00000900(rel)
        xor     r8d, r8d                                ; 2467 _ 45: 31. C0
        test    qword [rsp+40H], r10                    ; 246A _ 4C: 85. 54 24, 40
        setne   r8b                                     ; 246F _ 41: 0F 95. C0
        add     r8, 2                                   ; 2473 _ 49: 83. C0, 02
        add     r14d, dword [rax+r8*4]                  ; 2477 _ 46: 03. 34 80
        jmp     ?_171                                   ; 247B _ E9, FFFFEF88

?_254:  popcnt  rbp, rcx                                ; 2480 _ F3 48: 0F B8. E9
        mov     qword [rsp+0F0H], rbp                   ; 2485 _ 48: 89. AC 24, 000000F0
        jmp     ?_096                                   ; 248D _ E9, FFFFDC50

?_255:  blsr    rbp, rbp                                ; 2492 _ C4 E2 D0: F3. CD
        lea     rcx, [rel _ZN12_GLOBAL__N_1L12ThreatByKingE]; 2497 _ 48: 8D. 0D, 00000860(rel)
        test    rbp, rbp                                ; 249E _ 48: 85. ED
        setne   r8b                                     ; 24A1 _ 41: 0F 95. C0
        movzx   esi, r8b                                ; 24A5 _ 41: 0F B6. F0
        add     r11d, dword [rcx+rsi*4]                 ; 24A9 _ 44: 03. 1C B1
        jmp     ?_141                                   ; 24AD _ E9, FFFFE8B7

?_256:  mov     esi, 22                                 ; 24B2 _ BE, 00000016
        mov     edi, 18                                 ; 24B7 _ BF, 00000012
        mov     dword [rsp+0E8H], 24                    ; 24BC _ C7. 84 24, 000000E8, 00000018
        jmp     ?_212                                   ; 24C7 _ E9, FFFFF853

; Filling space: 4H
; Filler type: Multi-byte NOP
;       db 0FH, 1FH, 40H, 00H

ALIGN   8
?_257:  mov     r12d, 22                                ; 24D0 _ 41: BC, 00000016
        mov     r10d, 18                                ; 24D6 _ 41: BA, 00000012
        jmp     ?_228                                   ; 24DC _ E9, FFFFFBD0

?_258:  xor     r12d, r12d                              ; 24E1 _ 45: 31. E4
        test    qword [rsp+40H], rsi                    ; 24E4 _ 48: 85. 74 24, 40
        lea     rsi, [rel _ZN12_GLOBAL__N_1L7OutpostE]  ; 24E9 _ 48: 8D. 35, 00000900(rel)
        setne   r12b                                    ; 24F0 _ 41: 0F 95. C4
        mov     r8d, dword [rsi+r12*4]                  ; 24F4 _ 46: 8B. 04 A6
        add     dword [rsp+134H], r8d                   ; 24F8 _ 44: 01. 84 24, 00000134
        jmp     ?_177                                   ; 2500 _ E9, FFFFF02A

?_259:  blsr    rcx, rcx                                ; 2505 _ C4 E2 F0: F3. C9
        lea     r8, [rel _ZN12_GLOBAL__N_1L12ThreatByKingE]; 250A _ 4C: 8D. 05, 00000860(rel)
        xor     ebp, ebp                                ; 2511 _ 31. ED
        test    rcx, rcx                                ; 2513 _ 48: 85. C9
        setne   bpl                                     ; 2516 _ 40: 0F 95. C5
        add     eax, dword [r8+rbp*4]                   ; 251A _ 41: 03. 04 A8
        jmp     ?_148                                   ; 251E _ E9, FFFFE976

?_260:  add     edx, 14                                 ; 2523 _ 83. C2, 0E
        sub     ebp, dword [rel _ZN12_GLOBAL__N_1L7CheckedE]; 2526 _ 2B. 2D, 00000814(rel)
        jmp     ?_128                                   ; 252C _ E9, FFFFE56F

?_261:  lea     esi, [rcx+3H]                           ; 2531 _ 8D. 71, 03
        test    ecx, ecx                                ; 2534 _ 85. C9
        cmovns  esi, ecx                                ; 2536 _ 0F 49. F1
        sar     esi, 2                                  ; 2539 _ C1. FE, 02
        add     ecx, esi                                ; 253C _ 01. F1
        jmp     ?_231                                   ; 253E _ E9, FFFFFB9C

?_262:  mov     esi, dword [rsp+0E8H]                   ; 2543 _ 8B. B4 24, 000000E8
        jmp     ?_213                                   ; 254A _ E9, FFFFF7F5

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_263:  mov     r13, qword [rel .refptr.SquareBB]       ; 2550 _ 4C: 8B. 2D, 00000000(rel)
        test    qword [r13+r10*8], r15                  ; 2557 _ 4F: 85. 7C D5, 00
        je      ?_214                                   ; 255C _ 0F 84, FFFFF7EC
        lea     r8d, [r8+rsi*2]                         ; 2562 _ 45: 8D. 04 70
        add     r12d, r8d                               ; 2566 _ 45: 01. C4
        add     ecx, r8d                                ; 2569 _ 44: 01. C1
        jmp     ?_214                                   ; 256C _ E9, FFFFF7DD

?_264:  add     edx, 6                                  ; 2571 _ 83. C2, 06
        sub     ebp, dword [rel _ZN12_GLOBAL__N_1L7CheckedE]; 2574 _ 2B. 2D, 00000814(rel)
        jmp     ?_127                                   ; 257A _ E9, FFFFE501

; Filling space: 1H
; Filler type: NOP
;       db 90H

ALIGN   8
?_265:  add     edx, 45                                 ; 2580 _ 83. C2, 2D
        sub     ebp, dword [rel _ZN12_GLOBAL__N_1L7CheckedE]; 2583 _ 2B. 2D, 00000814(rel)
        jmp     ?_126                                   ; 2589 _ E9, FFFFE4E9

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_266:  mov     r12, qword [rel .refptr.SquareBB]       ; 2590 _ 4C: 8B. 25, 00000000(rel)
        test    qword [r12+r9*8], rdx                   ; 2597 _ 4B: 85. 14 CC
        je      ?_230                                   ; 259B _ 0F 84, FFFFFB30
        lea     eax, [rax+r10*2]                        ; 25A1 _ 42: 8D. 04 50
        add     edi, eax                                ; 25A5 _ 01. C7
        add     ecx, eax                                ; 25A7 _ 01. C1
        jmp     ?_230                                   ; 25A9 _ E9, FFFFFB23

; Filling space: 2H
; Filler type: NOP with prefixes
;       db 66H, 90H

ALIGN   8
?_267:  xor     ebp, 01H                                ; 25B0 _ 83. F5, 01
        mov     rdx, qword [rel .refptr.PassedPawnMask] ; 25B3 _ 48: 8B. 15, 00000000(rel)
        add     rdi, 40                                 ; 25BA _ 48: 83. C7, 28
        movzx   r15d, bpl                               ; 25BE _ 44: 0F B6. FD
        and     ebp, 01H                                ; 25C2 _ 83. E5, 01
        mov     rdi, qword [rbx+rdi*8]                  ; 25C5 _ 48: 8B. 3C FB
        add     r15, 40                                 ; 25C9 _ 49: 83. C7, 28
        shl     rbp, 6                                  ; 25CD _ 48: C1. E5, 06
        and     rdi, qword [rbx+108H]                   ; 25D1 _ 48: 23. BB, 00000108
        mov     rcx, qword [rbx+r15*8]                  ; 25D8 _ 4A: 8B. 0C FB
        and     rcx, qword [rbx+130H]                   ; 25DC _ 48: 23. 8B, 00000130
        bsf     r8, rcx                                 ; 25E3 _ 4C: 0F BC. C1
        lea     rbp, [rbp+r8]                           ; 25E7 _ 4A: 8D. 6C 05, 00
        test    qword [rdx+rbp*8], rdi                  ; 25EC _ 48: 85. 3C EA
        je      ?_157                                   ; 25F0 _ 0F 84, FFFFEAFF
        cmp     r13d, 1                                 ; 25F6 _ 41: 83. FD, 01
        sbb     r9d, r9d                                ; 25FA _ 45: 19. C9
        and     r9d, 0FFFFFFF2H                         ; 25FD _ 41: 83. E1, F2
        lea     r9d, [r9+33H]                           ; 2601 _ 45: 8D. 49, 33
        jmp     ?_157                                   ; 2605 _ E9, FFFFEAEB

; Filling space: 6H
; Filler type: Multi-byte NOP
;       db 66H, 0FH, 1FH, 44H, 00H, 00H

ALIGN   8
?_268:  lea     r8d, [rcx+3H]                           ; 2610 _ 44: 8D. 41, 03
        test    ecx, ecx                                ; 2614 _ 85. C9
        cmovns  r8d, ecx                                ; 2616 _ 44: 0F 49. C1
        sar     r8d, 2                                  ; 261A _ 41: C1. F8, 02
        add     ecx, r8d                                ; 261E _ 44: 01. C1
        jmp     ?_215                                   ; 2621 _ E9, FFFFF738

?_269:  test    rcx, rcx                                ; 2626 _ 48: 85. C9
        mov     r11d, dword [rel _ZN12_GLOBAL__N_1L19ThreatByHangingPawnE]; 2629 _ 44: 8B. 1D, 00000810(rel)
        je      ?_137                                   ; 2630 _ 0F 84, FFFFE6C2
        jmp     ?_244                                   ; 2636 _ E9, FFFFFCED

?_270:  add     ecx, 45                                 ; 263B _ 83. C1, 2D
        sub     r9d, dword [rel _ZN12_GLOBAL__N_1L7CheckedE]; 263E _ 44: 2B. 0D, 00000814(rel)
        jmp     ?_133                                   ; 2645 _ E9, FFFFE611

?_271:  add     ecx, 6                                  ; 264A _ 83. C1, 06
        sub     r9d, dword [rel _ZN12_GLOBAL__N_1L7CheckedE]; 264D _ 44: 2B. 0D, 00000814(rel)
        jmp     ?_134                                   ; 2654 _ E9, FFFFE60B

?_272:  mov     rcx, qword [rsp+70H]                    ; 2659 _ 48: 8B. 4C 24, 70
        cmp     dword [rcx+14H], 0                      ; 265E _ 83. 79, 14, 00
        jne     ?_152                                   ; 2662 _ 0F 85, FFFFE91D
        test    r10, r10                                ; 2668 _ 4D: 85. D2
        jz      ?_273                                   ; 266B _ 74, 13
        bsr     r8, r10                                 ; 266D _ 4D: 0F BD. C2
        shr     r8, 3                                   ; 2671 _ 49: C1. E8, 03
        imul    r8d, dword [rel _ZN12_GLOBAL__N_1L11UnstoppableE]; 2675 _ 44: 0F AF. 05, 00000804(rel)
        add     r14d, r8d                               ; 267D _ 45: 01. C6
?_273:  mov     r15, qword [rsp+98H]                    ; 2680 _ 4C: 8B. BC 24, 00000098
        test    r15, r15                                ; 2688 _ 4D: 85. FF
        je      ?_153                                   ; 268B _ 0F 84, FFFFE90A
        bsf     r9, r15                                 ; 2691 _ 4D: 0F BC. CF
        shr     r9, 3                                   ; 2695 _ 49: C1. E9, 03
        xor     r9d, 07H                                ; 2699 _ 41: 83. F1, 07
        imul    r9d, dword [rel _ZN12_GLOBAL__N_1L11UnstoppableE]; 269D _ 44: 0F AF. 0D, 00000804(rel)
        sub     r14d, r9d                               ; 26A5 _ 45: 29. CE
        jmp     ?_153                                   ; 26A8 _ E9, FFFFE8EE

?_274:  add     r10d, 6                                 ; 26AD _ 41: 83. C2, 06
        jmp     ?_229                                   ; 26B1 _ E9, FFFFFA13

?_275:  mov     rsi, rbp                                ; 26B6 _ 48: 89. EE
        jmp     ?_211                                   ; 26B9 _ E9, FFFFF634

?_276:  test    rdi, rdi                                ; 26BE _ 48: 85. FF
        mov     eax, dword [rel _ZN12_GLOBAL__N_1L19ThreatByHangingPawnE]; 26C1 _ 8B. 05, 00000810(rel)
        je      ?_143                                   ; 26C7 _ 0F 84, FFFFE74B
        jmp     ?_248                                   ; 26CD _ E9, FFFFFCE3

?_277:  mov     rax, qword [rcx]                        ; 26D2 _ 48: 8B. 01
        mov     rdx, rbx                                ; 26D5 _ 48: 89. DA
        call    near [rax+18H]                          ; 26D8 _ FF. 50, 18
        cmp     eax, 255                                ; 26DB _ 3D, 000000FF
        je      ?_154                                   ; 26E0 _ 0F 84, FFFFE984
        mov     rcx, qword [r12+18H]                    ; 26E6 _ 49: 8B. 4C 24, 18
        mov     rdx, rbx                                ; 26EB _ 48: 89. DA
        mov     r15, qword [rcx]                        ; 26EE _ 4C: 8B. 39
        call    near [r15+18H]                          ; 26F1 _ 41: FF. 57, 18
        mov     rcx, qword [rsp+0C8H]                   ; 26F5 _ 48: 8B. 8C 24, 000000C8
        mov     r9d, eax                                ; 26FD _ 41: 89. C1
        jmp     ?_155                                   ; 2700 _ E9, FFFFE979

?_278:  add     ecx, 14                                 ; 2705 _ 83. C1, 0E
        sub     r9d, dword [rel _ZN12_GLOBAL__N_1L7CheckedE]; 2708 _ 44: 2B. 0D, 00000814(rel)
        jmp     ?_135                                   ; 270F _ E9, FFFFE56D

?_279:  mov     r10, qword [rsp+58H]                    ; 2714 _ 4C: 8B. 54 24, 58
        mov     r12, qword [rel .refptr.LineBB]         ; 2719 _ 4C: 8B. 25, 00000000(rel)
        add     r10, rcx                                ; 2720 _ 49: 01. CA
        and     r8, qword [r12+r10*8]                   ; 2723 _ 4F: 23. 04 D4
        jmp     ?_175                                   ; 2727 _ E9, FFFFEDC1

?_280:  movzx   r9d, byte [rsp+170H]                    ; 272C _ 44: 0F B6. 8C 24, 00000170
; Note: Prefix bit or byte has no meaning in this context
        shlx    r11d, edi, r9d                          ; 2735 _ C4 62 31: F7. DF
        sub     r11d, 1                                 ; 273A _ 41: 83. EB, 01
        jmp     ?_185                                   ; 273E _ E9, FFFFEEDB

?_281:  mov     r11, qword [rsp+170H]                   ; 2743 _ 4C: 8B. 9C 24, 00000170
        mov     rax, qword [rel .refptr.LineBB]         ; 274B _ 48: 8B. 05, 00000000(rel)
        lea     r11, [r11+r9]                           ; 2752 _ 4F: 8D. 1C 0B
        and     r8, qword [rax+r11*8]                   ; 2756 _ 4E: 23. 04 D8
        jmp     ?_169                                   ; 275A _ E9, FFFFEC56

?_282:  mov     r10, qword [rsp+50H]                    ; 275F _ 4C: 8B. 54 24, 50
        mov     r12, qword [rel .refptr.LineBB]         ; 2764 _ 4C: 8B. 25, 00000000(rel)
        add     r10, rcx                                ; 276B _ 49: 01. CA
        and     rdx, qword [r12+r10*8]                  ; 276E _ 4B: 23. 14 D4
        jmp     ?_100                                   ; 2772 _ E9, FFFFDBC0

?_283:  add     r8, qword [rsp+0A8H]                    ; 2777 _ 4C: 03. 84 24, 000000A8
        mov     r11, qword [rel .refptr.LineBB]         ; 277F _ 4C: 8B. 1D, 00000000(rel)
        and     rcx, qword [r11+r8*8]                   ; 2786 _ 4B: 23. 0C C3
        jmp     ?_194                                   ; 278A _ E9, FFFFF0C2

?_284:  add     r8, qword [rsp+0A0H]                    ; 278F _ 4C: 03. 84 24, 000000A0
        mov     r10, qword [rel .refptr.LineBB]         ; 2797 _ 4C: 8B. 15, 00000000(rel)
        and     rcx, qword [r10+r8*8]                   ; 279E _ 4B: 23. 0C C2
        jmp     ?_190                                   ; 27A2 _ E9, FFFFEFC8

?_285:  mov     rdi, qword [rsp+170H]                   ; 27A7 _ 48: 8B. BC 24, 00000170
        mov     r14, qword [rel .refptr.LineBB]         ; 27AF _ 4C: 8B. 35, 00000000(rel)
        add     rdi, r10                                ; 27B6 _ 4C: 01. D7
        and     r8, qword [r14+rdi*8]                   ; 27B9 _ 4D: 23. 04 FE
        jmp     ?_160                                   ; 27BD _ E9, FFFFEA1F

?_286:  mov     rsi, qword [rsp+198H]                   ; 27C2 _ 48: 8B. B4 24, 00000198
        mov     r9, qword [rel .refptr.LineBB]          ; 27CA _ 4C: 8B. 0D, 00000000(rel)
        lea     r11, [rsi+rax]                          ; 27D1 _ 4C: 8D. 1C 06
        and     r8, qword [r9+r11*8]                    ; 27D5 _ 4F: 23. 04 D9
        jmp     ?_116                                   ; 27D9 _ E9, FFFFE00B

?_287:  mov     rsi, qword [rsp+1A0H]                   ; 27DE _ 48: 8B. B4 24, 000001A0
        mov     rbx, qword [rel .refptr.LineBB]         ; 27E6 _ 48: 8B. 1D, 00000000(rel)
        lea     rcx, [rsi+r8]                           ; 27ED _ 4A: 8D. 0C 06
        and     r9, qword [rbx+rcx*8]                   ; 27F1 _ 4C: 23. 0C CB
        jmp     ?_110                                   ; 27F5 _ E9, FFFFDE72

?_288:  mov     r10, r11                                ; 27FA _ 4D: 89. DA
        jmp     ?_227                                   ; 27FD _ E9, FFFFF88C

?_289:  movzx   esi, byte [rsp+190H]                    ; 2802 _ 0F B6. B4 24, 00000190
; Note: Prefix bit or byte has no meaning in this context
        shlx    r15d, edi, esi                          ; 280A _ C4 62 49: F7. FF
        sub     r15d, 1                                 ; 280F _ 41: 83. EF, 01
        jmp     ?_202                                   ; 2813 _ E9, FFFFF271

?_290:  mov     r13, qword [rcx]                        ; 2818 _ 4C: 8B. 29
        mov     rdx, rbx                                ; 281B _ 48: 89. DA
        mov     rax, qword [r13+18H]                    ; 281E _ 49: 8B. 45, 18
        add     rsp, 440                                ; 2822 _ 48: 81. C4, 000001B8
        pop     rbx                                     ; 2829 _ 5B
        pop     rsi                                     ; 282A _ 5E
        pop     rdi                                     ; 282B _ 5F
        pop     rbp                                     ; 282C _ 5D
        pop     r12                                     ; 282D _ 41: 5C
        pop     r13                                     ; 282F _ 41: 5D
        pop     r14                                     ; 2831 _ 41: 5E
        pop     r15                                     ; 2833 _ 41: 5F
; Note: Prefix valid but unnecessary
; Note: Prefix bit or byte has no meaning in this context
        jmp     rax                                     ; 2835 _ 48: FF. E0

?_291:  ; Local function
        cmp     dword [r11+14H], 836                    ; 2838 _ 41: 81. 7B, 14, 00000344
        jne     ?_219                                   ; 2840 _ 0F 85, FFFFF5E6
        blsr    r13, qword [rbx+108H]                   ; 2846 _ C4 E2 90: F3. 8B, 00000108
        cmp     r13, 1                                  ; 284F _ 49: 83. FD, 01
        sbb     r15d, r15d                              ; 2853 _ 45: 19. FF
        and     r15d, 0FFFFFFEAH                        ; 2856 _ 41: 83. E7, EA
        lea     r9d, [r15+1FH]                          ; 285A _ 45: 8D. 4F, 1F
        jmp     ?_157                                   ; 285E _ E9, FFFFE892

        nop                                             ; 2863 _ 90
        nop                                             ; 2864 _ 90
        nop                                             ; 2865 _ 90
        nop                                             ; 2866 _ 90
        nop                                             ; 2867 _ 90
        nop                                             ; 2868 _ 90
        nop                                             ; 2869 _ 90
        nop                                             ; 286A _ 90
        nop                                             ; 286B _ 90
        nop                                             ; 286C _ 90
        nop                                             ; 286D _ 90
        nop                                             ; 286E _ 90
        nop                                             ; 286F _ 90


SECTION .xdata.hot align=4 noexecute                    ; section number 12, const

        db 01H, 13H, 0AH, 00H, 13H, 01H, 37H, 00H       ; 0000 _ ......7.
        db 0CH, 30H, 0BH, 60H, 0AH, 70H, 09H, 50H       ; 0008 _ .0.`.p.P
        db 08H, 0C0H, 06H, 0D0H, 04H, 0E0H, 02H, 0F0H   ; 0010 _ ........


SECTION .rdata  align=64 noexecute                      ; section number 14, const

_ZN12_GLOBAL__N_1L6PassedE:                             ; byte
        db 05H, 00H, 00H, 00H, 05H, 00H, 00H, 00H       ; 0000 _ ........
        db 1FH, 00H, 00H, 00H, 49H, 00H, 00H, 00H       ; 0008 _ ....I...
        db 0A6H, 00H, 00H, 00H, 0FCH, 00H, 00H, 00H     ; 0010 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0018 _ ........
        db 07H, 00H, 00H, 00H, 0EH, 00H, 00H, 00H       ; 0020 _ ........
        db 26H, 00H, 00H, 00H, 40H, 00H, 00H, 00H       ; 0028 _ &...@...
        db 89H, 00H, 00H, 00H, 0C1H, 00H, 00H, 00H      ; 0030 _ ........
        db 00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H       ; 0038 _ ........

ALIGN   16
?_292:                                                  ; oword
        dq 003F0011002A000BH                            ; 0040 _ 003F0011002A000B 
        dq 001B000800120005H                            ; 0048 _ 001B000800120005 

?_293:                                                  ; oword
        dq 001F000800150005H                            ; 0050 _ 001F000800150005 
        dq 000D000400080002H                            ; 0058 _ 000D000400080002 

?_294:                                                  ; oword
        dq 0002000A0009000AH                            ; 0060 _ 0002000A0009000A 
        dq 0FFEBFFF40000FFF8H                           ; 0068 _ FFEBFFF40000FFF8 

?_295:                                                  ; oword
        dq 0000FFF8FFEBFFF4H                            ; 0070 _ 0000FFF8FFEBFFF4 
        dq 0009000A0002000AH                            ; 0078 _ 0009000A0002000A 

?_296:  dq 0000FFFFFF000000H                            ; 0080 _ 0000FFFFFF000000 

?_297:  dq 000000FFFFFF0000H                            ; 0088 _ 000000FFFFFF0000 
        dq 0000000000000000H                            ; 0090 _ 0000000000000000 
        dq 0000000000000000H                            ; 0098 _ 0000000000000000 
        dq 0000000000000000H                            ; 00A0 _ 0000000000000000 
        dq 0000000000000000H                            ; 00A8 _ 0000000000000000 
        dq 0000000000000000H                            ; 00B0 _ 0000000000000000 
        dq 0000000000000000H                            ; 00B8 _ 0000000000000000 


SECTION .rdata$zzz align=16 noexecute                   ; section number 15, const

        db 47H, 43H, 43H, 3AH, 20H, 28H, 78H, 38H       ; 0000 _ GCC: (x8
        db 36H, 5FH, 36H, 34H, 2DH, 70H, 6FH, 73H       ; 0008 _ 6_64-pos
        db 69H, 78H, 2DH, 73H, 65H, 68H, 2DH, 72H       ; 0010 _ ix-seh-r
        db 65H, 76H, 31H, 2CH, 20H, 42H, 75H, 69H       ; 0018 _ ev1, Bui
        db 6CH, 74H, 20H, 62H, 79H, 20H, 4DH, 69H       ; 0020 _ lt by Mi
        db 6EH, 47H, 57H, 2DH, 57H, 36H, 34H, 20H       ; 0028 _ nGW-W64 
        db 70H, 72H, 6FH, 6AH, 65H, 63H, 74H, 29H       ; 0030 _ project)
        db 20H, 34H, 2EH, 39H, 2EH, 32H, 00H, 00H       ; 0038 _  4.9.2..


SECTION .rdata$.refptr.PassedPawnMask align=16 noexecute ; section number 16, const
;  Communal section not supported by YASM

.refptr.PassedPawnMask:                                 ; qword
        dq PassedPawnMask                               ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.ForwardBB align=16 noexecute     ; section number 17, const
;  Communal section not supported by YASM

.refptr.ForwardBB:                                      ; qword
        dq ForwardBB                                    ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.SquareDistance align=16 noexecute ; section number 18, const
;  Communal section not supported by YASM

.refptr.SquareDistance:                                 ; qword
        dq SquareDistance                               ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.PseudoAttacks align=16 noexecute ; section number 19, const
;  Communal section not supported by YASM

.refptr.PseudoAttacks:                                  ; qword
        dq PseudoAttacks                                ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.RookAttacks align=16 noexecute   ; section number 20, const
;  Communal section not supported by YASM

.refptr.RookAttacks:                                    ; qword
        dq RookAttacks                                  ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.RookMasks align=16 noexecute     ; section number 21, const
;  Communal section not supported by YASM

.refptr.RookMasks:                                      ; qword
        dq RookMasks                                    ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.BishopAttacks align=16 noexecute ; section number 22, const
;  Communal section not supported by YASM

.refptr.BishopAttacks:                                  ; qword
        dq BishopAttacks                                ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.BishopMasks align=16 noexecute   ; section number 23, const
;  Communal section not supported by YASM

.refptr.BishopMasks:                                    ; qword
        dq BishopMasks                                  ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.LineBB align=16 noexecute        ; section number 24, const
;  Communal section not supported by YASM

.refptr.LineBB:                                         ; qword
        dq LineBB                                       ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.SquareBB align=16 noexecute      ; section number 25, const
;  Communal section not supported by YASM

.refptr.SquareBB:                                       ; qword
        dq SquareBB                                     ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


SECTION .rdata$.refptr.StepAttacksBB align=16 noexecute ; section number 26, const
;  Communal section not supported by YASM

.refptr.StepAttacksBB:                                  ; qword
        dq StepAttacksBB                                ; 0000 _ 0000000000000000 (d)
        dq 0000000000000000H                            ; 0008 _ 0000000000000000 


