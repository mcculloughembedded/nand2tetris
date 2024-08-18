// Program: fill
// Writes the screen black when any key is pressed
// Clears the screen when no key is pressed

// Strategy
// Two loops
//  1. WRITE - loops over SCREEN and sets every bit
//  2. CLEAR - loops over SCREEN and clears every bit
// Go to WRITE if KBD register is not zero
// Go to CLEAR if KBD register is zero

// Pseudo Code
//
// (CLEAR)
//     n = 8192 // size of screen memory
//     (CLEAR_LOOP)
//         if(KBD!=0) goto WRITE
//         n = n-1
//         SCREEN[n] = 0
//         if(n==0) goto CLEAR
//         goto CLEAR_LOOP
//
// (WRITE)
//     n = 8192 // size of screen memory
//     (WRITE_LOOP)
//         if(KBD==0) goto CLEAR
//         n = n-1
//         SCREEN[n] = -1
//         if(n==0) goto CLEAR
//         goto LOOP

// The screen writes/clears starting from the bottom right and ending
// in the top left

(CLEAR)
@8192
D=A
@n
M=D

(CLEAR_LOOP)
    // If key is pressed go to write
    @KBD
    D=M
    @WRITE
    D;JNE

    // n=n-1
    @n
    M=M-1

    // clear next block
    // SCREEN[n] = 0
    @SCREEN
    D=A
    @n
    A=D+M
    M=0

    // Default is to clear the screen
    // if(n==0) goto CLEAR
    @n
    D=M
    @CLEAR
    D;JEQ

    // goto LOOP
    @CLEAR_LOOP
    0;JMP


(WRITE)
@8192
D=A
@n
M=D

(WRITE_LOOP)
    // If no key is pressed go to clear
    @KBD
    D=M
    @CLEAR
    D;JEQ

    // n=n-1
    @n
    M=M-1

    // set next block
    // SCREEN[n] = -1
    @SCREEN
    D=A
    @n
    A=D+M
    M=-1

    // Default is to clear the screen
    // if(n==0) goto CLEAR
    @n
    D=M
    @CLEAR
    D;JEQ

    // goto LOOP
    @WRITE_LOOP
    0;JMP

// infinite while
// safety - should never get here
(END)
    @END
    0;JMP
