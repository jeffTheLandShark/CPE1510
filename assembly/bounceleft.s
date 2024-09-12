.global _start
_start:
again:
    mov r4, #3              // start value
    ldr r12, =0xff200000    // led memory address (pointer)
loop:
    str r4, [r12]           // put value on led
    lsl r4, r4, #1          // move value left
    mov r5, #1
    lsl r5, r5, #20
bwait: 
    sub r5, r5, #1
    cmp r5, #0
    bne bwait
    cmp r4, #768            // done?
    blt loop                // nope, not done
    bal again
