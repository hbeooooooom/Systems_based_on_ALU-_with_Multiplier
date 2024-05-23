module cla64(a,b,ci,s,co); //64bit cla module
input[63:0] a,b;
input ci; //carry in
output [63:0] s; //sum
output co; //carry out

wire c1, c2, c3, c4, c5, c6, c7;

cla8 U0_cla8(a[7:0], b[7:0], ci, s[7:0], c1); //instance cla8 * 8
cla8 U1_cla8(a[15:8], b[15:8], c1, s[15:8], c2);
cla8 U2_cla8(a[23:16], b[23:16], c2, s[23:16], c3);
cla8 U3_cla8(a[31:24], b[31:24], c3, s[31:24], c4);
cla8 U4_cla8(a[39:32], b[39:32], c4, s[39:32], c5);
cla8 U5_cla8(a[47:40], b[47:40], c5, s[47:40], c6);
cla8 U6_cla8(a[55:48], b[55:48], c6, s[55:48], c7);
cla8 U7_cla8(a[63:56], b[63:56], c7, s[63:56], co);

endmodule
