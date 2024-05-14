(DRAWPIXEL)
	@4
	D=M // r
	@0
	M=D
	@32
	D=A
	@1
	M=D
	@DRAWPIXELCONT
	D=A
	@2
	M=D
	@MUL
	0;JMP
(DRAWPIXELCONT)
	@3
	D=M
	@SCREEN
	D=D+A
	@D
	M=1
(END)
	@END
	0;JMP


// expecting ram[0] to have the 1st value
// expecting ram[1] to have the 2nd value
// expecting ram[2] to be the return address
// ram[3] will be the output
(MUL)
	@0
	D=M
	@MULOP
	D;JGT
(MULEND)
	@2
	@M
	0;JMP
(MULOP)
	@1
	D=M
	@3
	M=D+M
	@0
	D=M-1
	M=D
	@MUL
	0;JMP