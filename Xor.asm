// Step 1: Calculate A AND (NOT B)
@B           // Load address of B
M=!M         // Invert B (NOT B)
@A           // Load address of A
D=M          // D = A
D=D&M        // D = A AND (NOT B) (Result of first part of XOR)

// Step 2: Calculate (NOT A) AND B
@A           // Load address of A
M=!M         // Invert A (NOT A)
@B           // Load address of B
D=D&M        // D = (NOT A) AND B (Result of second part of XOR)

// Step 3: Combine the two results using OR to get the final XOR result
@RESULT      // Load address of RESULT
M=D|M        // Store (A AND (NOT B)) OR ((NOT A) AND B) in RESULT





