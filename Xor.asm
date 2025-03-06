// Loop over all 16 bits (0 to 15)
@16 
D=A
@counter
M=D
(LOOP)
  // Get the bit from R0
@R0
A=M
D=M 
@R0bit
M=D
  // Get the bit from R1
@R1
A=M
D=M
@R1bit
M=D
  // XOR computation: (R0bit & !R1bit) | (!R0bit & R1bit)
  // First part: R0bit AND !R1bit
@R0bit
D=M
@R1bit
D=D&M
@result
M=D
// Second part: !R0bit AND R1bit
@R0bit
D=M
@R1bit
D=D&M
@R2
D&!M
@end



