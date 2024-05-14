// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(BEGIN)
	@KBD
	D=M
	@DRAW
	D;JGT
	@R0
	M=0
		
	@FILL_SCREEN
	0;JMP
	
	(DRAW)
		@R0
		M=-1
		@FILL_SCREEN
		0;JMP
	
(FILL_SCREEN)
	@r
	M=0     // r = 0
	
	@32
	D=A
	@rowlen
	M=D     // rowlen = 32
	
	@256
	D=A
	@rowscount
	M=D     // rowscount = 256
	
	@SCREEN
	D=A
	@base
	M=D
	
	@c
	M=0
	
	(INNER_LOOP)
		@rowlen
		D=M
		@c
		D=M-D
		@OUTER_LOOP
		D;JEQ        // if c == rowlen -> goto outer_loop
		
		@c
		D=M
		@base
		D=M+D        // SCREEN = SCREEN + c
		@temp
		M=D
		@R0
		D=M
		@temp
		A=M
		M=D
		
		@c
		M=M+1         // c++
		@INNER_LOOP
		0;JMP
	
	(OUTER_LOOP)
		@c
		M=0
		
		@32
		D=A
		@base
		M=M+D
		
		@r
		M=M+1       // r++
		
		@rowscount
		D=M
		@r
		D=M-D
		@GOTO_BEGIN
		D;JEQ        // if r > rowscount -> goto end
		@INNER_LOOP
		0;JMP
	
	(GOTO_BEGIN)
		@BEGIN
		0;JMP