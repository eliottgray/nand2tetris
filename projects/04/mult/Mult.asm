// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

@R2 // Product
M=0
@loopcount
M=0

(LOOPSTART)

// Since we are adding R0, R1 shall be used as the required number of loops.
@loopcount
D=M
@R1
D=M-D // Current loops = Required Loops - Loopcount.
@LOOPEND
D;JEQ

// Add R0 to product.
@R0
D=M
@R2
M=D+M

// Track exit condition.
@loopcount
M=M+1

// Back to the start of the loop.
@LOOPSTART
0;JMP

(LOOPEND)