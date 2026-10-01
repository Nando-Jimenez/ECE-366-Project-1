module one_bit_full_adder(A, B, Cin, S, Cout);

input A, B, Cin;
output reg S, Cout;

always @(*) begin
    {Cout, S} = A + B + Cin;
end

endmodule

module four_bit_RCA_RCS(A, B, Cin, S, Cout);
  
input [3:0] A, B;
input Cin;
output [3:0] S;
output Cout;
  
wire C1, C2, C3;
wire [3:0] B_sub;
  
assign B_sub = B ^ {4{Cin}};
  
one_bit_full_adder FA0(A[0], B_sub[0], Cin, S[0], C1);
one_bit_full_adder FA1(A[1], B_sub[1], C1,  S[1], C2);
one_bit_full_adder FA2(A[2], B_sub[2], C2,  S[2], C3);
one_bit_full_adder FA3(A[3], B_sub[3], C3,  S[3], Cout);

endmodule