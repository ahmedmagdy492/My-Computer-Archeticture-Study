(IN)
	0   // the value of the end parameter
(RES)
	1
	@RES
	M=0
(LOOP)
	@IN
	D=M
	@END
	D;JLE
	@RES
	M=D+M
	D=D-1
	@IN
	M=D
	@LOOP
	0;JMP
(END)
	@END
	0;JMP