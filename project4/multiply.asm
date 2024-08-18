// Program: Multiply
// Multiplies the valuse in R0 and R1 and stores the result in R2
// Usage: Load values into R0 and R1
//        R1 > 0 and R2 > 0
//        R0 * R1 < 32768

// Strategy
// Add R0 to itself R1 times
//
// Pseudo code
//
// sum = 0
// n = R1
// (LOOP)
// if(n==0) goto STOP
// sum=sum+R0
// n = n-1
// goto LOOP
// (STOP)
// R2 = sum


// sum = 0
@sum
M=0

// n = R1
@R1
D=M
@n
M=D
(LOOP)
    // if(n==0) goto STOP
    @n
    D=M
    @STOP
    D;JEQ
    // sum=sum+R0
    @sum
    D=M
    @R0
    D=D+M
    @sum
    M=D

    // n=n-1
    @n
    M=M-1

    // goto LOOP
    @LOOP
    0;JMP

(STOP)
    // R2 = sum
    @sum
    D=M
    @R2
    M=D

// infinite while
(END)
    @END
    0;JMP
