module adderandsubtractor (
    input [3:0] A,      // 4-bit input A
    input [3:0] B,      // 4-bit input B
    input mode,         // mode = 0 → add, mode = 1 → subtract
    output [3:0] result, // 4-bit result
    output carry         // carry/borrow output
);

wire [3:0] B_comp;  // to store complement of B when subtracting
wire c_out;

// XOR each bit of B with mode to perform subtraction (2’s complement)
assign B_comp = B ^ {4{mode}};

// Perform addition using the mode as carry-in for subtraction
assign {carry, result} = A + B_comp + mode;

endmodule
