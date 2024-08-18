// Program: Multiply
// Multiplies the valuse in R0 and R1 and stores the result in R2
// Usage: Load values into R0 and R1
//        R1 > 0 and R2 > 0
//        R0 * R1 < 32768

// Strategy
// Two loops
//  1. WRITE - loops over SCREEN and sets every bit
//  2. CLEAR - loops over SCREEN and clears every bit
// Go to WRITE if KBD register is not zero
// Go to CLEAR if KBD register is zero

// Pseudo Code
//
// (CLEAR)
//     n = 8192
//     (CLEAR_LOOP)
//         n = n-1
//         if(KBD!=0) goto WRITE
//         SCREENscreen[n] = 0
//         goto CLEAR_LOOP
//
// (WRITE)
//     n = 8192
//     (WRITE_LOOP)
//         if(KBD==0) goto CLEAR
//         n = n-1
//         SCREEN[n] = -1
//         goto LOOP

@8192
D=A
@n
M=D

(LOOP)
    // n=n-1
    @n
    M=M-1

    // set next block
    @SCREEN
    D=A
    @n
    A=D+M
    M=-1

    // if(n==0) goto STOP
    @n
    D=M
    @STOP
    D;JEQ

    // goto LOOP
    @LOOP
    0;JMP

(STOP)

// infinite while
(END)
    @END
    0;JMP
