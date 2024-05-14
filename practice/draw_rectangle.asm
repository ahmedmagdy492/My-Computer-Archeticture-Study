@16
D=A
@w
M=D  // w = 16

@R0
D=M
@h
M=D  // h = R0

@i
M=0
@SCREEN
D=A
@addr
M=D
(LOOP)
  @i
  D=M
  @R0
  D=D-M
  @END
  D;JEQ   // if i == R0 -> terminate the program
  
  @addr
  D=M
  A=D
  M=-1    // RAM[addr] = -1
  D=A
  @32
  D=D+A
  @addr
  M=D

  @i
  D=M+1
  M=D
  @LOOP
  0;JMP
(END)
  @END
  0;JMP