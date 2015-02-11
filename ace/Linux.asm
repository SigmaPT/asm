
SYS_futex   equ 202

FUTEX_WAIT_PRIVATE    equ 128
FUTEX_WAKE_PRIVATE    equ 129
FUTEX_REQUEUE_PRIVATE equ 131

LOCK_CONTEND          equ 0x0101



mutex_init:
        xor     eax, eax
        mov     dword [rdi], eax
        ret

mutex_destroy:
        xor     eax, eax
        ret

mutex_lock:
        mov     ecx, 100
; Spin a bit to try to get lock
.1:     mov     dl, 1
        xchg    dl, byte [rdi]
        test    dl, dl
        jz      .4
        sub     ecx, 1
        jnz     .1
; Set up syscall details
        mov     edx, LOCK_CONTEND
        mov     esi, FUTEX_WAIT_PRIVATE
        xor     r10, r10
        jmp     .3
; Wait loop
.2:     mov     eax, SYS_futex
        syscall
.3:     mov     eax, edx
        xchg    eax, dword [rdi]
        test    eax, 1
        jnz     .2
.4:     xor     eax, eax
        ret

mutex_unlock:
        cmp     dword [rdi], 1
        jne     .1
        mov     eax, 1
        xor     ecx, ecx
        lock cmpxchg  %ecx, (%rdi)
        jz      .3
.1:     mov     byte [rdi], 0
; Spin, and hope someone takes the lock
        mov     ecx, 200
.2:     test    byte [rdi], 1
        jnz     .3
        sub     ecx, 1
        jnz     .2
; Wake up someone
        mov     byte [rdi+1], 0
        mov     eax, SYS_futex
        mov     esi, FUTEX_WAKE_PRIVATE
        mov     edx, 1
        syscall
.3:     xor     eax, eax
        ret

mutex_trylock:
        mov     eax, 1
        mov     edx, EBUSY
        xchg    al, byte [rdi]
        test    al, al
        cmovnz  eax, edx
        ret


cond_init:
        xor     eax, eax
        mov     qword [rdi], rax
        mov     qword [rdi+8], rax
        ret


cond_destroy:
        xor     eax, eax
        ret

cond_signal:
        lock add dword [rdi], 1
        mov     eax, SYS_futex
        mov     esi, FUTEX_WAKE_PRIVATE
        mov     edx, 1
        syscall
        xor     eax, eax
        ret 

cond_broadcast:
        mov     r8, qword [rdi+8]
        cmp     r8, 0
        je      .1
        lock add  dword [rdi], 1
        mov     eax, SYS_futex
        mov     esi, FUTEX_REQUEUE_PRIVATE
        mov     edx, 1
        mov     r10, INT_MAX
        syscall
.1:     xor     eax, eax
        ret 

cond_wait:
        cmp     rsi, qword [rdi+8]
        jne     .4

; Hack, save seq into r8 since unlock doesn't touch it
.1:
        mov     r8d, dword [rdi]

; Hack, save mutex into r9 (we can be awoken after cond is destroyed)
        mov     r9, rsi

; Unlock
        push    rbp
        mov     rbp, rdi
        mov     rdi, rsi
        call    mutex_unlock
        mov     rdi, rbp
        pop     rbp

; Setup for wait on seq
        mov     edx, r8d
        mov     eax, SYS_futex
        xor     r10, r10
        mov     esi, FUTEX_WAIT_PRIVATE
        syscall
        
; Set up for wait on mutex
        mov     rdi, r9
        mov     edx, LOCK_CONTEND
        jmp     .3
        
; Wait loop
.2:      mov     eax, SYS_futex
        syscall
.3:      mov     eax, edx
        xchg    eax, dword [rdi]
        test    eax, 1
        jnz     .2
        
        xor     eax, eax
        ret
        
.4:     xor     eax, eax
        lock cmpxchgq %rsi, 8(%rdi)
        jz              .1
        cmp     rsi, qword [rdi+8]
        je      .1
.5:     mov     eax, EINVAL
        ret     


