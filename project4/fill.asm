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
//     n = 512
//     (CLEAR_LOOP)
//         if(KBD!=0) goto WRITE
//         screen[n] = 0
//         n = n-1
//         goto CLEAR_LOOP
//
// (WRITE)
//     n = 512
//     (WRITE_LOOP)
//         if(KBD==0) goto CLEAR
//         screen[n] = -1
//         n = n-1
//         goto LOOP

(MAIN)
    (CLEAR)
    // m = 512
    @512
    D=A
    @m
    M=D

    (CLEAR_LOOP)
    // if KBD!=0 goto WRITE
    @KBD
    D=M
    @WRITE
    D;JNE

    @SCREEN
    M=0

    (WRITE)
    // m = 512
    @512
    D=A
    @m
    M=D
    (WRITE_LOOP)
    // if KBD==0 goto CLEAR
    @KBD
    D=M
    @CLEAR
    D;JEQ
    // screen[n] = 0
    @SCREEN
    D=M
    @n
    D=D+M
    @D
    M=-1

    // n=n-1
    @n
    M=M-1

    // goto CLEAR_LOOP
    @CLEAR_LOOP
    0;JMP
