.global _start
_start:
    mov r4, #0          //sum = 0
    mov r12, #0         // i=0; loop counter
loop:
    cmp r12, #11   // done?
    beq wait            // yes, goto wait loop
    add r4, r4, r12     // sum = sum + 1
    add r12, r12, #1    // i ++
    bal loop            // go back to while loop

wait:
    bal wait
