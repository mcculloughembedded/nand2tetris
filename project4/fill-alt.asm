// Program: fill-alt
// Writes the screen black when any key is pressed
// Clears the screen when no key is pressed
// This is arguably a better solution than fill.asm, since it has less repeated code
// fill.asm looks better, because it always starts from the bottom.
// This starts wherever the loop happens to be

// A further improvement could be to not clear/write the screen if the whole
// screen is written or cleared. Since writing and clearing the screen is
// the only task for this program, this is not a necessary improvement.

// Strategy
// Continuously loop over the screen memory
// Set the current memory to -1 if key is pressed
// Set the current memory to 0 if no key is pressed

// Pseudo Code
//
// (START)
// n=8192 // size of screen memory
// (LOOP)
//     n=n-1
//
//     if(KBD==0) goto CLEAR
//     if(KBD!=0) goto WRITE
//
//     (CLEAR)
//     SCREEN[n] = 0
//     // don't write what we just cleared
//     goto END
//     (WRITE)
//     SCREEN[n] = -1

//     (END)
//
//     At the end of the screen memory, so go back to the start
//     if(n==0) goto START
//     Otherwise still somewhere in the middle, so go to the next location
//     goto LOOP


// The screen writes/clears from the current memory location

(START)
@8192
D=A
@n
M=D

(LOOP)
    // n=n-1
    @n
    M=M-1

    // If no key is pressed go to clear
    @KBD
    D=M
    @CLEAR
    D;JEQ

    // If key is pressed go to write
    @KBD
    D=M
    @WRITE
    D;JNE

    // set next block
    // SCREEN[n] = -1
    (WRITE)
    @SCREEN
    D=A
    @n
    A=D+M
    M=-1
    // goto LOOP
    @END
    0;JMP

    // clear next block
    // SCREEN[n] = 0
    (CLEAR)
    @SCREEN
    D=A
    @n
    A=D+M
    M=0

    (END)

    // Reset loop if whole screen is clear
    // if(n==0) goto CLEAR
    @n
    D=M
    @START
    D;JEQ

    // goto LOOP
    @LOOP
    0;JMP
