// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

@i
M=0    // i = 0

@sum
M=0    // sum = 0

@R0
D=M
@n
M=D    // n = R0

@R2
M=0    // R2 = 0

(LOOP)
   @i
   D=M
   @n
   D=D-M
   @END
   D;JEQ    // if i - n == 0 then goto end
   
   @R1
   D=M
   @sum
   M=M+D    // sum = sum + R1
   
   @i
   M=M+1
   
   @sum
   D=M
   @R2
   M=D      // R2 = sum
   
   
   @LOOP
   0;JMP
   
(END)
	@END
	0;JMP