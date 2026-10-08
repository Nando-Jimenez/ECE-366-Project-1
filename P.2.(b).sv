
module testbench;

reg [31:0] A, B;
reg Cin;

wire [31:0] S;
wire Cout;

CLA u0(A, B, Cin, S, Cout);

initial begin

    $dumpfile("CLA32.vcd");
    $dumpvars(0, testbench);

    $monitor("Time=%0t A=%h B=%h Cin=%b S=%h Cout=%b",
             $time, A, B, Cin, S, Cout);

    // Unsigned addition: 3 + 4 = 7
    A = 32'd3;
    B = 32'd4;
    Cin = 0;
    #10;

    // Unsigned subtraction: 7 - 2 = 5
    A = 32'd7;
    B = ~32'd2;
    Cin = 1;
    #10;

    // Signed addition with negative operand:
    A = 32'hFFFFFFFD;
    B = 32'd2;
    Cin = 0;
    #10;

    // Signed subtraction with negative operand:
    A = 32'd3;
    B = ~32'hFFFFFFFE;
    Cin = 1;
    #10;

    // Addition producing carry-out
    A = 32'hFFFFFFFF;
    B = 32'd1;
    Cin = 0;
    #10;

    // Carry propagation across multiple 4-bit blocks
    A = 32'h0000FFFF;
    B = 32'd1;
    Cin = 0;
    #10;

    $finish;

end

endmodule

