module one_bit_full_adder(A, B, Cin, S, Cout);

input A, B, Cin;
output S, Cout;

wire w1;
wire w2, w3, w4;

xor (w1, A, B);
xor (S, w1, Cin);

and (w2, A, Cin);
and (w3, B, Cin);
and (w4, A, B);

or (Cout, w2, w3, w4);

endmodule