// input
	@100
	D=A
	@n
	M=D
	D=M

	@sum    // will hold the result
	M=0     // sum = 0

(LOOP)
	D=M-D   // D = sum - n

	@END
	D;JGT

	@n
	D=M
	@sum
	M=M+D  // sum = sum + n

	D=D-1  // n = n - 1
	@n
	M=D

	@LOOP
	0;JMP

(END)
	@END
	0;JMP