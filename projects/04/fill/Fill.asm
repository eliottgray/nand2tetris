// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

@RESTART
0;JMP

(MAIN)

@SCREENCOLOR
M=0
@KBD
D=M
@SETBLACK
D;JNE // If Keyboard is not "0", set screencolor to black.

(SETSCREEN)

// If We've completed the whole screen, reset back to main.
@SCREENWORD
D=M
@24576
D=D-A
@RESTART
D;JGE

// Since we haven't completed the whole screen, blacken the current word
@SCREENCOLOR
D=M
@SCREENWORD
A=M // A register is now pointing at the VALUE of SCREENWORD not the INDEX of it.
M=D // Memory[SCREENWORD] = 65535

// Increment the updated word.
@SCREENWORD
M=M+1

// Continue the Setscreen loop.
@SETSCREEN
0;JMP

(SETBLACK)

@SCREENCOLOR
M=!M // Because we pre-set SCREENCOLOR=0, we can just flip the bits from all-0 to all-1, which equals -1.
@SETSCREEN
0;JMP

(RESTART)

// Start by explicitly zero-ing out all variables.
// Then go to the "Main" section.

@SCREENCOLOR
M=0
@SCREEN
D=A
@SCREENWORD
M=D
@MAIN
0;JMP