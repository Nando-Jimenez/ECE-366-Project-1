module testbench;

reg [15:0] A, B;
reg Cin;

wire [15:0] S;
wire Cout;

PPA u0(A, B, Cin, S, Cout);

initial begin

    $dumpfile("PPA16.vcd");
    $dumpvars(0, testbench);

    $monitor("Time=%0t A=%h B=%h Cin=%b S=%h Cout=%b",  			$time, A, B, Cin, S, Cout);

    // Unsigned addition: 3 + 4 = 7
    A = 16'd3;
    B = 16'd4;
    Cin = 0;
    #10;

    // Unsigned subtraction: 7 - 2 = 5
    A = 16'd7;
    B = ~16'd2;
    Cin = 1;
    #10;

    // Signed addition: -3 + 2 = -1
    A = 16'hFFFD;
    B = 16'd2;
    Cin = 0;
    #10;

    // Signed subtraction: 3 - (-2) = 5
    A = 16'd3;
    B = ~16'hFFFE;
    Cin = 1;
    #10;

    // Addition producing carry-out
    A = 16'hFFFF;
    B = 16'd1;
    Cin = 0;
    #10;

    // Carry propagation across multiple bits
    A = 16'h0FFF;
    B = 16'd1;
    Cin = 0;
    #10;

    // Carry propagation through all 16 bits
    A = 16'hFFFF;
    B = 16'd0;
    Cin = 1;
    #10;
  
    $finish;

end

endmodule