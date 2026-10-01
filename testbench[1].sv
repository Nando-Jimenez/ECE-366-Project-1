module testbench;

reg [3:0] A, B;
reg Cin;

wire [3:0] S;
wire Cout;

four_bit_RCA_RCS u0(A, B, Cin, S, Cout);

  initial begin

    $dumpfile("fbRCAS.vcd");
    $dumpvars(0, testbench);

    $monitor("Time=%0t A=%b B=%b Cin=%b S=%b Cout=%b", 
             $time, A, B, Cin, S, Cout);

    // Unsigned addition: 3 + 4 = 7
    A = 4'b0011;
    B = 4'b0100;
    Cin = 0;
    #10;

    // Unsigned subtraction: 7 - 2 = 5
    A = 4'b0111;
    B = 4'b0010;
    Cin = 1;
    #10;

    // Signed addition with negative operand: -3 + 2 = -1
    A = 4'b1101;
    B = 4'b0010;
    Cin = 0;
    #10;

    // Signed subtraction with negative operand: 3 - (-2) = 5
    A = 4'b0011;
    B = 4'b1110;
    Cin = 1;
    #10;

    //Addition producing carry-out: 15 + 1 = 16
    A = 4'b1111;
    B = 4'b0001;
    Cin = 0;
    #10;

    $finish;

end

endmodule