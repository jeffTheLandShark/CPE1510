.global _start
_start:
    ldr r12, =0xff200040 // r12 = switch pointer
    ldr r4, [r12]       // r4 = N
1:
    cmp r4, #0          // done?
    beq wait            // goto infinite loop
    bl  bleft           // bounce left
    bl  bright          // bounce right
    sub r4, r4, #1      // N--
    bal lb
wait:
    bal wait

// SUBROUTINES AND FUNCTIONS
// - void delay(void)
// - void bleft(void)
// - void bright(void)
// ************************

delay:
    mov r12, #1
    lsl r12, r12, #20 // form N = big number
1:
    sub r12, r12, #1    // N--
    cmp r12, #0         // done?
    bne 1b              // nope, do again
    mov pc, lr          // return

bleft:
    mov r0, lr          // branch sub: clone LR
    mov r1, #1          // ledval = 1
1:
    ldr r2, =0xff200000 // led pointer
    str r1, [r2]        // leds = ledval
    bl  delay           // LR overwrite! call delay
    lsl r1, r1, #1      // ledval << 1
    cmp r1, #1024       // done?
    bne 1b
    mov lr, r0         // restore LR to clone
    mov pc, lr         // return

bright:
    mov r0, lr          // branch sub: clone LR
    mov r1, #512          // ledval = 512
1:
    ldr r2, =0xff200000 // led pointer
    str r1, [r2]        // leds = ledval
    bl  delay           // LR overwrite! call delay
    lsr r1, r1, #1      // ledval >> 1
    cmp r1, #0       // done?
    bne 1b
    mov lr, r0         // restore LR to clone
    mov pc, lr         // return