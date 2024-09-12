// a stack
// wk 10 lab period

.global _start
_start:
//initialize stack pointer
    mov     sp, #4
    lsl     sp, sp, #24 //put toward right end of number line
    mov     r8, #20

1:
    bl      sub1
    sub     r8, r8, #1
    cmp     r8, #0
    bne     1b
2:
    bal     2b

sub1:
    push    {r8}
    mov     r8, #129
    add     r8, r9, r10
    pop     {r8}
    mov     pc, lr
