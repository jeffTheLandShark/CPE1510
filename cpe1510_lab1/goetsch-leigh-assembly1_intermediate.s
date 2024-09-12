// ***** cpe1510 L1 Intermediate Lab Exercise *****
// Grade Level: B
// Author: Leigh Goetsch
// Description:
//    - Display an ASCII message on the UART display
//    - Wait for the push button
//    - Retrieve the value of the toggle switch
//    - Display the first six characters of message on 7-segment display
// *******************************

.global _start
_start:
    .equ uart_ptr, 0xff201000
    .equ seg_ptr, 0xff200020
    .equ seg_ptr_top, 0xff200030
    .equ pb_ptr, 0xff200050
    .equ sw_ptr, 0xff200040

    ldr     r12, =uart_ptr      //load address of UART
    ldr     r0, =uartmessage    //load address of message
    bl      uart_printstring    //call subroutine to print message
    // ** new code for intermediate lab **
    //wait for push button
    ldr     r12, =pb_ptr //point to pb_ptr
    bl      waitpb
    //retrieve value of toggle switch
    ldr     r12, =sw_ptr        //point to sw_ptr
    ldr     r0, [r12]           //read sw_ptr (num)
    //display first six characters of message on 7-segment display
    bl      seg7_display
    bal     wait

// SUBROUTINES AND FUNCTIONS
// - void uart_printString(stringPointer)
// - void wait()
// ** new code for intermediate lab **
// - void waitpb(pb_ptr)
// - void seg7_display(sw_ptr)
// - void seg7_char(seg_ptr, char, int offset, dseg7)
// ************************

uart_printstring:
    mov     r1, #0 //set offset to 0
1:
    ldrb    r2, [r0, r1]         //load string ptr [0] + offset
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

waitpb:
1:
    ldr     r1, [r12]           //read pb_ptr
    and     r1, r1, #8          //mask pb3
    cmp     r1, #0              //is pb0 pressed?
    bne     1b                  //if yes, do again
2:
    ldr     r1, [r12]           //read pb_ptr
    and     r1, r1, #8          //mask pb3
    cmp     r1, #0              //is pb0 pressed?
    beq     2b                  //if not, do again
3:
    ldr     r1, [r12]           //read pb_ptr
    and     r1, r1, #8          //mask pb0
    cmp     r1, #0              //is pb0 pressed?
    bne     3b                  //if yes, do again
    mov     pc, lr              //return

seg7_display:
    ldr     r12, =dseg7 //load address of dseg7
    // case 1, 2, 3, 4 determine which message to display
    ldr     r2, =seg_ptr_top 
    mov     r3, lr //save lr
    cmp     r0, #1              //compare to 1
    beq     1f                  //if equal, display message 1
    cmp     r0, #2              //compare to 2
    beq     2f                  //if equal, display message 2
    cmp     r0, #3              //compare to 3
    beq     3f                  //if equal, display message 3
    cmp     r0, #4              //compare to 4
    beq     4f                  //if equal, display message 4
    b       5f                  //if not, do nothing
1:
    ldrb    r0, [r12, #0x4D]//load "M"
    ldrb    r1, [r12, #0x53]//load "S"
    bl      seg7_char
    ldr     r2, =seg_ptr 
    ldrb    r1, [r12, #0x4F]//load "O"
    bl      seg7_char
    ldrb    r1, [r12, #0x45]//load "E"
    bl      seg7_char
    ldrb    r1, [r12, #0x00]//load " "
    bl      seg7_char
    ldrb    r1, [r12, #0x52]//load "R"
    bl      seg7_char
    b       5f
2:
    ldrb    r0, [r12, #0x42]//load "B"
    ldrb    r1, [r12, #0x52]//load "R"
    bl      seg7_char
    ldr     r2, =seg_ptr 
    ldrb    r1, [r12, #0x45]//load "E"
    bl      seg7_char
    ldrb    r1, [r12, #0x57]//load "W"
    bl      seg7_char
    ldrb    r1, [r12, #0x45]//load "E"
    bl      seg7_char
    ldrb    r1, [r12, #0x52]//load "R"
    bl      seg7_char
    b       5f
3:
    ldrb    r0, [r12, #0x42]//load "B"
    ldrb    r1, [r12, #0x55]//load "U"
    bl      seg7_char
    ldr     r2, =seg_ptr 
    ldrb    r1, [r12, #0x43]//load "C"
    bl      seg7_char
    ldrb    r1, [r12, #0x4B]//load "K"
    bl      seg7_char
    ldrb    r1, [r12, #0x53]//load "S"
    bl      seg7_char
    ldrb    r1, [r12, #0x00]//load " "
    bl      seg7_char
    b       5f
4:
    ldrb    r0, [r12, #0x50]//load "P"
    ldrb    r1, [r12, #0x41]//load "A"
    bl      seg7_char
    ldr     r2, =seg_ptr 
    ldrb    r1, [r12, #0x43]//load "C"
    bl      seg7_char
    ldrb    r1, [r12, #0x4B]//load "K"
    bl      seg7_char
    ldrb    r1, [r12, #0x45]//load "E"
    bl      seg7_char
    ldrb    r1, [r12, #0x52]//load "R"
    bl      seg7_char
5:
    ldr     r12, =seg_ptr //load address of seg_ptr
    str     r0, [r12]//store r1 to seg_ptr
    mov     lr, r3 //restore lr
    mov     pc, lr //return

seg7_char:
//r0 = word
//r1 = char
//r2  = offset
//r3 = lr
    lsl     r0, r0, #8 //shift offset
    add     r0, r0, r1 //add offset char to seg7 word
    str     r0, [r2]//store r1 to seg_ptr
    @ add     r2, #8 //increment offset
    mov     pc, lr //return

wait:
    bal     wait //infinite loop

// DATA
.data
uartmessage:
    .ascii "CPE1510 Sports Ticker\n"
    .ascii "-------------------------------------\n"
    .ascii "1: MSOE Raiders Win! \n"
    .ascii "2: Brewers beat the Cubs! \n"
    .ascii "3: Bucks in ten! \n"
    .ascii "4: Packers heading to the Super Bowl!\n"
    .ascii "\n"
    .ascii "Set toggle switch to desired message.\n"
    .ascii "Then push PB3.\n"

dseg7:
    .byte 0x00  // ascii 0x00
    .byte 0x00  // ascii 0x01
    .byte 0x00  // ascii 0x02
    .byte 0x00  // ascii 0x03
    .byte 0x00  // ascii 0x04
    .byte 0x00  // ascii 0x05
    .byte 0x00  // ascii 0x06
    .byte 0x00  // ascii 0x07
    .byte 0x00  // ascii 0x08
    .byte 0x00  // ascii 0x09
    .byte 0x00  // ascii 0x0A
    .byte 0x00  // ascii 0x0B
    .byte 0x00  // ascii 0x0C
    .byte 0x00  // ascii 0x0D
    .byte 0x00  // ascii 0x0E
    .byte 0x00  // ascii 0x0F
    .byte 0x00  // ascii 0x10
    .byte 0x00  // ascii 0x11
    .byte 0x00  // ascii 0x12
    .byte 0x00  // ascii 0x13
    .byte 0x00  // ascii 0x14
    .byte 0x00  // ascii 0x15
    .byte 0x00  // ascii 0x16
    .byte 0x00  // ascii 0x17
    .byte 0x00  // ascii 0x18
    .byte 0x00  // ascii 0x19
    .byte 0x00  // ascii 0x1A
    .byte 0x00  // ascii 0x1B
    .byte 0x00  // ascii 0x1C
    .byte 0x00  // ascii 0x1D
    .byte 0x00  // ascii 0x1E
    .byte 0x00  // ascii 0x1F
    .byte 0x00  // ascii 0x20
    .byte 0x00  // ascii 0x21
    .byte 0x00  // ascii 0x22
    .byte 0x00  // ascii 0x23
    .byte 0x00  // ascii 0x24
    .byte 0x00  // ascii 0x25
    .byte 0x00  // ascii 0x26
    .byte 0x00  // ascii 0x27
    .byte 0x00  // ascii 0x28
    .byte 0x00  // ascii 0x29
    .byte 0x00  // ascii 0x2A
    .byte 0x00  // ascii 0x2B
    .byte 0x00  // ascii 0x2C
    .byte 0x40  //ascii 0x2D "-"
    .byte 0x00  // ascii 0x2E "." but decimal pt is not used
    .byte 0x00  // ascii 0x2F
    .byte 0x3F  // ascii 0x30 "0"
    .byte 0x06  // ascii 0x31 "1"
    .byte 0x5B  // ascii 0x32 "2"
    .byte 0x4F  // ascii 0x33 "3"
    .byte 0x66  // ascii 0x34 "4"
    .byte 0x6D  // ascii 0x35 "5"
    .byte 0x7D  // ascii 0x36 "6"
    .byte 0x07  // ascii 0x37 "7"
    .byte 0x7F  // ascii 0x38 "8"
    .byte 0x6F  // ascii 0x39 "9"
    .byte 0x00  // ascii 0x3A
    .byte 0x00  // ascii 0x3B
    .byte 0x00  // ascii 0x3C
    .byte 0x00  // ascii 0x3D
    .byte 0x00  // ascii 0x3E
    .byte 0x00  // ascii 0x3F
    .byte 0x00  // ascii 0x40
    .byte 0x77  // ascii 0x41 "A"
    .byte 0x7C  // ascii 0x42 "B"
    .byte 0x58  // ascii 0x43 "C"
    .byte 0x5E  // ascii 0x44 "D"
    .byte 0x79  // ascii 0x45 "E"
    .byte 0x71  // ascii 0x46 "F"
    .byte 0x3D  // ascii 0x47 "G"
    .byte 0x74  // ascii 0x48 "H"
    .byte 0x04  // ascii 0x49 "I"
    .byte 0x1E  // ascii 0x4A "J"
    .byte 0xF5  // ascii 0x4B "K"
    .byte 0x38  // ascii 0x4C "L"
    .byte 0x37  // ascii 0x4D "M"
    .byte 0x54  // ascii 0x4E "N"
    .byte 0x5C  // ascii 0x4F "O"
    .byte 0x73  // ascii 0x50 "P"
    .byte 0x67  // ascii 0x51 "Q"
    .byte 0x50  // ascii 0x52 "R"
    .byte 0x6C  // ascii 0x53 "S"
    .byte 0x78  // ascii 0x54 "T"
    .byte 0x1C  // ascii 0x55 "U"
    .byte 0x3E  // ascii 0x56 "V"
    .byte 0x7E  // ascii 0x57 "W"
    .byte 0x76  // ascii 0x58 "X"
    .byte 0x6E  // ascii 0x59 "Y"
    .byte 0x9B  // ascii 0x5A "Z"
    .byte 0x00  // ascii 0x5B
    .byte 0x00  // ascii 0x5C
    .byte 0x00  // ascii 0x5D
    .byte 0x00  // ascii 0x5E
    .byte 0x08  // ascii 0x5F "_"
    .byte 0x00  // ascii 0x60
    .byte 0x77  // ascii 0x61 "a"
    .byte 0x7C  // ascii 0x62 "b"
    .byte 0x58  // ascii 0x63 "c"
    .byte 0x5E  // ascii 0x64 "d"
    .byte 0x79  // ascii 0x65 "e"
    .byte 0x71  // ascii 0x66 "f"
    .byte 0x3D  // ascii 0x67 "g"
    .byte 0x74  // ascii 0x68 "h"
    .byte 0x04  // ascii 0x69 "i"
    .byte 0x1E  // ascii 0x6A "j"
    .byte 0xF5  // ascii 0x6B "k"
    .byte 0x38  // ascii 0x6C "l"
    .byte 0x37  // ascii 0x6D "m"
    .byte 0x54  // ascii 0x6E "n"
    .byte 0x5C  // ascii 0x6F "o"
    .byte 0x73  // ascii 0x70 "p"
    .byte 0x67  // ascii 0x71 "q"
    .byte 0x50  // ascii 0x72 "r"
    .byte 0x6C  // ascii 0x73 "s"
    .byte 0x78  // ascii 0x74 "t"
    .byte 0x1C  // ascii 0x75 "u"
    .byte 0x3E  // ascii 0x76 "v"
    .byte 0x7E  // ascii 0x77 "w"
    .byte 0x76  // ascii 0x78 "x"
    .byte 0x6E  // ascii 0x79 "y"
    .byte 0x9B  // ascii 0x7A "z"
