
module CLA(A, B, Cin, S, Cout);

    input [31:0] A, B;
    input Cin;
    output [31:0] S;
    output Cout;

    wire [8:0] C;

    assign C[0] = Cin;
    assign Cout = C[8];

    CLA4 U0(A[3:0],   B[3:0],   C[0], S[3:0],   C[1]);
    CLA4 U1(A[7:4],   B[7:4],   C[1], S[7:4],   C[2]);
    CLA4 U2(A[11:8],  B[11:8],  C[2], S[11:8],  C[3]);
    CLA4 U3(A[15:12], B[15:12], C[3], S[15:12], C[4]);
    CLA4 U4(A[19:16], B[19:16], C[4], S[19:16], C[5]);
    CLA4 U5(A[23:20], B[23:20], C[5], S[23:20], C[6]);
    CLA4 U6(A[27:24], B[27:24], C[6], S[27:24], C[7]);
    CLA4 U7(A[31:28], B[31:28], C[7], S[31:28], C[8]);

endmodule


module CLA4(A, B, Cin, S, Cout);

    input [3:0] A, B;
    input Cin;
    output [3:0] S;
    output Cout;

    wire [3:0] P, G;
    wire p01, p23, Pgroup;
    wire t1, t2, t3, g10, g210, Ggroup;
    wire carry_term;
    wire unused_rca_cout;

    // 4-bit RCA calculates the sum.
    four_bit_RCA_RCS SUM(
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(unused_rca_cout)
    );

    // Bit propagate: Pi = Ai OR Bi from Lec. 2
    or P0(P[0], A[0], B[0]);
    or P1(P[1], A[1], B[1]);
    or P2(P[2], A[2], B[2]);
    or P3(P[3], A[3], B[3]);

    // Bit generate: Gi = Ai AND Bi from Lec. 2
    and G0(G[0], A[0], B[0]);
    and G1(G[1], A[1], B[1]);
    and G2(G[2], A[2], B[2]);
    and G3(G[3], A[3], B[3]);

    // Group propagate
    and PG0(p01, P[0], P[1]);
    and PG1(p23, P[2], P[3]);
    and PG2(Pgroup, p01, p23);

    // Group generate
    and GG0(t1, P[1], G[0]);
    or  GG1(g10, G[1], t1);

    and GG2(t2, P[2], g10);
    or  GG3(g210, G[2], t2);

    and GG4(t3, P[3], g210);
    or  GG5(Ggroup, G[3], t3);

    // Block carry-out
    and CG0(carry_term, Pgroup, Cin);
    or  CG1(Cout, Ggroup, carry_term);

endmodule


// Problem 1: One-bit full adder
module one_bit_full_adder(A, B, Cin, S, Cout);

    input A, B, Cin;
    output reg S, Cout;

    always @(*) begin
        {Cout, S} = A + B + Cin;
    end

endmodule


// Problem 1: Four-bit RCA
module four_bit_RCA_RCS(A, B, Cin, S, Cout);

    input [3:0] A, B;
    input Cin;
    output [3:0] S;
    output Cout;

    wire C1, C2, C3;

    one_bit_full_adder FA0(A[0], B[0], Cin, S[0], C1);
    one_bit_full_adder FA1(A[1], B[1], C1, S[1], C2);
    one_bit_full_adder FA2(A[2], B[2], C2, S[2], C3);
    one_bit_full_adder FA3(A[3], B[3], C3, S[3], Cout);

endmodule
