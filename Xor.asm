// AbsoluteValue.asm
// Computes z = |x|, where x is stored in R0.
// Stores the result z in R1.
// Sets R2 to 1 if x is negative, otherwise 0.
// Sets R3 to 1 if the absolute value cannot be computed, otherwise 0.

@R0
D=M          // Load R0 into D (D = x)

@POSITIVE
D;JGE        // If x >= 0, jump to POSITIVE

// Handle negative case
@R2
M=1          // Set R2 = 1 (x is negative)

@R0
D=M          // Reload R0 into D (D = x)

@MIN_VALUE
D;JEQ        // If x == -32768, jump to MIN_VALUE (special case)

@R0
D=M          // Reload R0 into D (D = x)
D=-D         // Negate D (D = -x)

@STORE_RESULT
0;JMP        // Jump to STORE_RESULT

(POSITIVE)
@R2
M=0          // Set R2 = 0 (x is positive or zero)

@R0
D=M          // Reload R0 into D (D = x)

@STORE_RESULT
0;JMP        // Jump to STORE_RESULT

(MIN_VALUE)
@R3
M=1          // Set R3 = 1 (error: absolute value cannot be computed)

@R0
D=M          // Reload R0 into D (D = x)

@STORE_RESULT
0;JMP        // Jump to STORE_RESULT

(STORE_RESULT)
@R1
M=D          // Store D (result or original value) in R1

(END)
@END
0;JMP        // Infinite loop to end program
// Load values into registers
@A
D=M
@B
D=D+M
@C
D=D-M
@result
M=D
@A
D=M
@B
D=D+M
@result
M=D
// Check for overflow
@32767
D=A
@result
D=D-M
@NO_OVERFLOW
D;JGT
@OVERFLOW
0;JMP
{NO_OVERFLOW}
// Continue with no overflow
{OVERFLOW}
// Handle overflow




