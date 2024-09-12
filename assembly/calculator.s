.global _start
_start:

infinite:
    mov r6, #0 //result = 0
    //get user input
    ldr r12, =0xff200040    //toggle switch pointer
    ldr r5, [r12]           // n = switch value
    //separate op, x, y
    mov r12, #15 //mask = 1111
    and r2, r12, r5 //y = mask & n
    and r1, r12, r5, lsr#4 //x= mask & n lsr 4
    and r0, r12, r5, lsr#8 //op=mask & n lsr 8
    //call doMath
    bl  domath
    //store result
    mov r6, r0 //result = retVal
    //display result
    ldr r12, =0xff200000 //led pointer
    //store result to led
    str r6, [r12]
    bal infinite

// ************************
// SUBROUTINES AND FUNCTIONS
// - int doMath(int op, int x, int y)
// - int divide(int x, int y)
// ************************

domath:
    cmp r0, #0 // op = 0, add
    beq 1f
    cmp r0, #1 // op = 1, sub
    beq 2f
    cmp r0, #2 // op = 2, mul
    beq 3f
    mov r3, lr // clone LR
    bl  divide // call divide
    mov lr, r3 // restore LR
    //return
    bal 4f // branch always end
1: //retVal = x + y
    add r0, r1, r2
    bal 4f
2: //retVal = x - y
    sub r0, r1, r2
    bal 4f
3: //retVal = x * y
    mul r0, r1, r2
    bal 4f
4: //return
    mov pc, lr

divide:
    ldr r0, =0
    cmp r2, #0
    beq 2f
1:
    cmp r1, r2 // check if x < y
    blt 2f // if x < y, return
    sub r1, r1, r2 // x = x - y
    add r0, r0, #1 // result = result + 1
    bal 1b
2:
    mov pc, lr // return
