// filename: feb26.s
// author: goetschm@msoe.edu
// provides: a practice problem for class

.global _start
_start:
    ldr r12, =0xff200040    // switch ptr
    ldr r12, [r12]          // get the value of the switch
    and r4, r12, #0x0f      // r4=x
    lsl r12, r12, #8        // align
    and r5, r12, #0x03      // r5=op
    cmp r5, #0              // if r5 == 0
    beq 1f                // go do op=0
    cmp r5, #1            // else if r5 == 1
    beq 2f                // go do op=1
    cmp r5, #2            // if r5 == 2
    beq 3f                // go do op = 2
    mul r0, r4, r4          // else r0 = r4^2
    mul r0, r0, r0          // else r0 = r4^4
4:
    bl  flash // go display result
    bl  delay5 // go delay 5s

1:
    mov r0, r4              // r0 = x
    bal 4b                  // rejoin
2:
    mul r0, r4, r4          // r0 = x^2
    bal 4b                  // rejoin
3:
    mul r0, r4, r4          // r0 = x^2
    mul r0, r0, r4          // r0 = x^3
    bal 4b                  // rejoin

// ************************
// SUBROUTINES AND FUNCTIONS
// - void flash(int result)
// - void delay1()
// - void delay5()
// ************************

flash:
    mov r3, lr             // r3 = clone lr
    mov r1, #3             // j = 3
1:
    mov r12, #0           // tempVal=0
    ldr r2, =0xff200000   // led ptr
    str r12, [r2]         // led = 0
    bl  delay1            // call sub delay1
    str r0, [r2]          // leds=r2
    bl  delay1            // call sub delay1
    sub r1, r1, #1        // j--
    cmp r1, #0            // if j >= 0
    bge 1b                // then do again
    mov lr, r3            // lr = r3
    mov pc, lr            // return

delay1:
    mov r12, #1 // make big num
    lsl r12, r12, #20 //make big num
1:
    sub r12, r12, #1 //num--
    cmp r12, r12, #1 //done?
    bne 1b                        //if not, do again
    mov pc, lr                    //return

delay5:
    mov r12, #1 // make bigger num
    lsl r12, r12, #23
1:
    sub r12, r12, #1 //num--
    cmp r12, r12, #1 //done?
    bne 1b //if not, do again
    mov pc, lr //return
