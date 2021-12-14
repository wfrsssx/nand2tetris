// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// sum = 0
// i = 0
// while i < R1 
//  sum = sum + sum
//  i = i + 1
// 

@i
M=0
@prod
M=0
(WHILE)
    @i
    D=M
    @R1
    D=M-D
    @END
    D;JEQ // id i - R1 > 0 then go to END
    @prod
    D=M
    @R0
    D=D+M
    @prod
    M=D
    @i
    M=M+1
    @WHILE
    0;JMP

(END)
    @prod
    D=M
    @R2
    M=D
    @END
    0;JMP

