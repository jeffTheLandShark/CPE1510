// interval time delay using DE1-SOC Interval Counter Device (100MHz clock)
// this is an isolated program to test the interval counter device
// author:  Leigh Goetsch

.global _start
_start:
    .equ seg_ptr, 0xff200020
    .equ timer_ptr, 0xff202000
//clear 7-segment display
    mov     r0, #0
    ldr     r12, =seg_ptr
    str     r0, [r12]
    ldr     r4, =dseg7
    bal     seg7_scroll

// ** SUBROUTINES **
// - void seg7_scroll(void)
// - void delay(void)

// scroll through the 7-segment display ascii characters
seg7_scroll:
    mov     r3, #6 //set offset to 6
1:
    ldrb    r1, [r4, r3]
    cmp     r1, #1             //compare to 1
    bne     2f                 //if not equal, do nothing
    mov     r3, #0             //set offset to 0
    b       1b
2:
    lsl     r0, r0, #8          //shift word one byte
    add     r0, r0, r1          //add offset word to char
    ldr     r12, =seg_ptr
    str     r0, [r12]           //store r0 to seg_ptr
    add     r3, r3, #1          //increment offset
    bl      delay
    bal     1b

// delay using DE1-SOC Interval Counter Device (100MHz clock)
delay:
//blocked - r3, r2, r0
//unblocked - r12, r1
    ldr     r12, =timer_ptr
//clocks = n x freq
//1 sec, 100MHz, so 100,000,000 clocks
// timer status reg = 0
    mov     r1, #0              //load 0 for timer status reg
    str     r1, [r12]           //store 0 to timer status reg\
// timer period regs = c
// c = 100,000,000 = 0x 05F5 E100
    mov     r1, #0xE100         //load 0xE100 for bottom 16 bits
    str     r1, [r12, #8]       //store 0xE100 to timer period reg 1
    @ mov     r1, #0x05F5         //load 0x05F5 for top 16 bits
    //the above line does not work because the assembler does not support 32-bit immediate values
    mov     r1, #0x05           //load 0x05 for top 16 bits
    lsl     r1, r1, #8         //shift left
    add     r1, r1, #0xF5       //add 0xF5
    str     r1, [r12, #12]      //store 0x05F5 to timer period reg 2
// timer start bit = 1
    mov     r1, #4              //0100 for timer start bit
    str     r1, [r12, #4]       //store 0100 to timer control reg
1:
// read timer status reg
    ldr     r1, [r12]           //load timer status reg
    and     r1, r1, #1          //mask timer status reg
    cmp     r1, #1              //time out bit = 1?
    bne     1b                  //no, loop
// timer status reg = 0
    mov     r1, #0              //load 0 for timer status reg
    str     r1, [r12]           //store 0 to timer status reg
    mov     pc, lr              //return

dseg7:
// trimmed blanks to be able to scroll thru printed characters

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
    .byte 0x01 //" " (terminator for scrolling loop)
