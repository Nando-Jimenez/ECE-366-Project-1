
module PPA(A, B, Cin, S, Cout);

    input [15:0] A, B;
    input Cin;
    output [15:0] S;
    output Cout;

    //Pre-computation
    wire [15:0] p, g;

    assign p = A | B;
    assign g = A & B;

    //Stage 1
    wire p_0_m1, g_0_m1;
    wire p_2_1, g_2_1;
    wire p_4_3, g_4_3;
    wire p_6_5, g_6_5;
    wire p_8_7, g_8_7;
    wire p_10_9, g_10_9;
    wire p_12_11, g_12_11;
    wire p_14_13, g_14_13;

    assign p_0_m1 = p[0];
    assign g_0_m1 = g[0] | (p[0] & Cin);
    assign p_2_1 = p[2] & p[1];
    assign g_2_1 = g[2] | (p[2] & g[1]);
    assign p_4_3 = p[4] & p[3];
    assign g_4_3 = g[4] | (p[4] & g[3]);
    assign p_6_5 = p[6] & p[5];
    assign g_6_5 = g[6] | (p[6] & g[5]);
    assign p_8_7 = p[8] & p[7];
    assign g_8_7 = g[8] | (p[8] & g[7]);
    assign p_10_9 = p[10] & p[9];
    assign g_10_9 = g[10] | (p[10] & g[9]);
    assign p_12_11 = p[12] & p[11];
    assign g_12_11 = g[12] | (p[12] & g[11]);
    assign p_14_13 = p[14] & p[13];
    assign g_14_13 = g[14] | (p[14] & g[13]);

    //Stage 2
    wire p_1_m1, g_1_m1;
    wire p_2_m1, g_2_m1;
    wire p_5_3, g_5_3;
    wire p_6_3, g_6_3;
    wire p_9_7, g_9_7;
    wire p_10_7, g_10_7;
    wire p_13_11, g_13_11;
    wire p_14_11, g_14_11;

    assign p_1_m1 = p[1] & p_0_m1;
    assign g_1_m1 = g[1] | (p[1] & g_0_m1);
    assign p_2_m1 = p_2_1 & p_0_m1;
    assign g_2_m1 = g_2_1 | (p_2_1 & g_0_m1);
    assign p_5_3 = p[5] & p_4_3;
    assign g_5_3 = g[5] | (p[5] & g_4_3);
    assign p_6_3 = p_6_5 & p_4_3;
    assign g_6_3 = g_6_5 | (p_6_5 & g_4_3);
    assign p_9_7 = p[9] & p_8_7;
    assign g_9_7 = g[9] | (p[9] & g_8_7);
    assign p_10_7 = p_10_9 & p_8_7;
    assign g_10_7 = g_10_9 | (p_10_9 & g_8_7);
    assign p_13_11 = p[13] & p_12_11;
    assign g_13_11 = g[13] | (p[13] & g_12_11);
    assign p_14_11 = p_14_13 & p_12_11;
    assign g_14_11 = g_14_13 | (p_14_13 & g_12_11);

    //Stage 3
    wire p_3_m1, g_3_m1;
    wire p_4_m1, g_4_m1;
    wire p_5_m1, g_5_m1;
    wire p_6_m1, g_6_m1;
    wire p_11_7, g_11_7;
    wire p_12_7, g_12_7;
    wire p_13_7, g_13_7;
    wire p_14_7, g_14_7;

    assign p_3_m1 = p[3] & p_2_m1;
    assign g_3_m1 = g[3] | (p[3] & g_2_m1);
    assign p_4_m1 = p_4_3 & p_2_m1;
    assign g_4_m1 = g_4_3 | (p_4_3 & g_2_m1);
    assign p_5_m1 = p_5_3 & p_2_m1;
    assign g_5_m1 = g_5_3 | (p_5_3 & g_2_m1);
    assign p_6_m1 = p_6_3 & p_2_m1;
    assign g_6_m1 = g_6_3 | (p_6_3 & g_2_m1);
    assign p_11_7 = p[11] & p_10_7;
    assign g_11_7 = g[11] | (p[11] & g_10_7);
    assign p_12_7 = p_12_11 & p_10_7;
    assign g_12_7 = g_12_11 | (p_12_11 & g_10_7);
    assign p_13_7 = p_13_11 & p_10_7;
    assign g_13_7 = g_13_11 | (p_13_11 & g_10_7);
    assign p_14_7 = p_14_11 & p_10_7;
    assign g_14_7 = g_14_11 | (p_14_11 & g_10_7);

    //Stage 4
    wire p_7_m1, g_7_m1;
    wire p_8_m1, g_8_m1;
    wire p_9_m1, g_9_m1;
    wire p_10_m1, g_10_m1;
    wire p_11_m1, g_11_m1;
    wire p_12_m1, g_12_m1;
    wire p_13_m1, g_13_m1;
    wire p_14_m1, g_14_m1;

    assign p_7_m1 = p[7] & p_6_m1;
    assign g_7_m1 = g[7] | (p[7] & g_6_m1);
    assign p_8_m1 = p_8_7 & p_6_m1;
    assign g_8_m1 = g_8_7 | (p_8_7 & g_6_m1);
    assign p_9_m1 = p_9_7 & p_6_m1;
    assign g_9_m1 = g_9_7 | (p_9_7 & g_6_m1);
    assign p_10_m1 = p_10_7 & p_6_m1;
    assign g_10_m1 = g_10_7 | (p_10_7 & g_6_m1);
    assign p_11_m1 = p_11_7 & p_6_m1;
    assign g_11_m1 = g_11_7 | (p_11_7 & g_6_m1);
    assign p_12_m1 = p_12_7 & p_6_m1;
    assign g_12_m1 = g_12_7 | (p_12_7 & g_6_m1);
    assign p_13_m1 = p_13_7 & p_6_m1;
    assign g_13_m1 = g_13_7 | (p_13_7 & g_6_m1);
    assign p_14_m1 = p_14_7 & p_6_m1;
    assign g_14_m1 = g_14_7 | (p_14_7 & g_6_m1);

    //Post-computation
    wire [15:0] C;

    assign C[0] = Cin;
    assign C[1] = g_0_m1;
    assign C[2] = g_1_m1;
    assign C[3] = g_2_m1;
    assign C[4] = g_3_m1;
    assign C[5] = g_4_m1;
    assign C[6] = g_5_m1;
    assign C[7] = g_6_m1;
    assign C[8] = g_7_m1;
    assign C[9] = g_8_m1;
    assign C[10] = g_9_m1;
    assign C[11] = g_10_m1;
    assign C[12] = g_11_m1;
    assign C[13] = g_12_m1;
    assign C[14] = g_13_m1;
    assign C[15] = g_14_m1;

    assign S = A ^ B ^ C;

    //Final carry-out
    assign Cout = g[15] | (p[15] & C[15]);

endmodule
