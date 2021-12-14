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

// Put your code here.

(BEGIN)
// size of a screen memory in words (16 bits)
// 256 * 512 / 16
@8192
D=A
@size
M=D

@SCREEN
D=A
// counter for iteration
@cnt
M=0

// if key is pressed
@pressed
M=0
@KBD
D=M
@PRESS
D;JGT

(LOOP)
    @cnt
    D=M
    @size
    D=M-D
    @BEGIN
    D;JEQ
    @pressed
    D=M
    @FILL
    D;JGT
    @CLEAR
    D;JEQ


    (FILL)
    @SCREEN
    D=A
    @cnt
    D=D+M // screen memory with offset 
    M=M+1 // increase counter by 1
    A=D // target address
    M=-1
    @LOOP
    0;JMP

    (CLEAR)
    @SCREEN
    D=A
    @cnt
    D=D+M // screen memory with offset 
    M=M+1 // increase counter by 1
    A=D // target address
    M=0
    @LOOP
    0;JMP

(PRESS)
    @pressed
    M=1
    @LOOP
    0;JMP // jump to drawing