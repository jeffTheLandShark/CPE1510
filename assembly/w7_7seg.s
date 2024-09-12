// ***** cpe1510 w7 in class practice *****
// written for de-1

.global _start
_start:
        .equ seg_ptr, 0xff200020
        .equ pb_ptr, 0xff200050
        .equ sw_ptr, 0xff200040
        .equ led_ptr, 0xff200000
1:
    ldr r12, =seg_ptr
    ldr r0, =msg1               //point to msg1
    ldr r0, [r0]                //get data bytes
    str r0, [r12]               //print "set"
    bl  delay2                  //delay2
    ldr r0, =msg2               //point to msg2
    ldr r0, [r0]                //get data bytes
    str r0, [r12]               //print "num"
    bl  delay2                  //delay2
    ldr r0, =msg3               //point to msg3
    ldr r0, [r0]                //get data bytes
    str r0, [r12]               //print "push"
    bl  delay2                  //delay2
    ldr r0, =msg4               //point to msg4
    ldr r0, [r0]                //get data bytes
    str r0, [r12]               //print "pb0"
    bl  delay2                  //delay2
    bl  waitpb                  //waitpb
    ldr r12, =sw_ptr            //point to sw_ptr
    ldr r0, [r12]               //read sw_ptr (num)
    bl  count                   //count
    b   1b                      //back to 1

// SUBROUTINES AND FUNCTIONS
// - void delay2(void)
// - void waitpb(void)
// - void count(void)
// - void delay1(void)
// ************************

delay1:
    mov r1, #1 // make big num
    lsl r1, r1, #20 //make big num
1:
    sub r1, r1, #1 //num--
    cmp r1, #1 //done?
    bne 1b                        //if not, do again
    mov pc, lr                    //return

delay2:
    mov r1, #2 // make big num x2
    lsl r1, r1, #20 //make big num
1:
    sub r1, r1, #1 //num--
    cmp r1, #1 //done?
    bne 1b //if not, do again
    mov pc, lr //return

waitpb:
    ldr r12, =pb_ptr //point to pb_ptr
1:
    ldr r1, [r12]//read pb_ptr
    and r1, r1, #1 //mask pb0
    cmp r1, #0 //is pb0 pressed?
    bne 1b //if yes, do again
2:
    ldr r1, [r12]//read pb_ptr
    and r1, r1, #1 //mask pb0
    cmp r1, #1 //is pb0 pressed?
    bne 2b //if not, do again
3:
    ldr r1, [r12]//read pb_ptr
    and r1, r1, #1 //mask pb0
    cmp r1, #0 //is pb0 pressed?
    bne 3b //if yes, do again
    mov pc, lr //return

count:
    mov r3, lr //save lr
    ldr r12, =led_ptr //point to led_ptr
1:
    str r0, [r12]//print num
    bl  delay1 //delay1
    sub r0, r0, #1 //num--
    cmp r0, #0 //done?
    bne 1b //if not, do again
    str r0, [r12] //print num
    mov lr, r3 //restore lr
    mov pc, lr //return

// DATA
.data                    // start data
msg1:   .word   0x6D7978 // "set"
msg2:   .word   0x541C37 //"num"
msg3:   .word   0x731C6C74 // "push"
msg4:   .word   0x737C3F // "pb0"
