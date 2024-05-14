@10
D=A
@n
M=D  // n = 10

@100
D=A
@arr
M=D  // arr = 100 (internal pointer variable)

@i
M=0
(LOOP)
  @i
  D=M
  @n
  D=D-M
  @END
  D;JEQ   // if D == 0: jmp to end
  
  @arr
  D=M
  @i
  A=D+M  // arr[base_address + i] = -1
  M=-1
  
  @i
  D=M+1
  M=D
  
  @LOOP
  0;JMP
(END)
  @END
  0;JMP
  
  
  


