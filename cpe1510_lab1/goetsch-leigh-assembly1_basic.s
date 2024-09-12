// ***** cpe1510 L1 Basic Lab Exercise *****
// Grade Level: C
// Author: Leigh Goetsch
// Description: Display an ASCII message on the UART display
// *******************************

.global _start
_start:
    .equ uart_ptr, 0xff201000

    ldr     r12, =uart_ptr      //load address of UART
    ldr     r0, =uartMessage    //load address of message
    bl      uart_printString    //call subroutine to print message
    bal     wait

// SUBROUTINES AND FUNCTIONS
// - void uart_printString(stringPointer)
// ************************

uart_printString:
    mov     r1, #0 //load string ptr [0]
1:
    ldrb    r2, [r0, r1]         //load char
    cmp     r2, #0               // =0?
    beq     2f                   //yes, return
    ldr     r3, [r12, #4]        //load buffer space; pointer offset is base + 4
    cmp     r3, #0 //=0?
    beq     1b                   //yes, wait / loop
    strb    r2, [r12, #0]        //store char
    add     r1, r1, #1           //increment ptr
    bal     1b                   //loop
2:
    mov     pc, lr //return

wait:
    bal     wait //infinite loop

// DATA
.data
uartMessage:
    .ascii "CPE1510 Sports Ticker\n"
    .ascii "-------------------------------------\n"
    .ascii "1: MSOE Raiders Win! \n"
    .ascii "2: Brewers beat the Cubs! \n"
    .ascii "3: Bucks in ten! \n"
    .ascii "4: Packers heading to the Super Bowl!\n"
    .ascii "\n"
    .ascii "Set toggle switch to desired message.\n"
    .ascii "Then push PB3.\n"