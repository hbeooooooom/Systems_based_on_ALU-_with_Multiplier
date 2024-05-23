module mux4(d0, d1, d2, d3, s, y); //1bit 4 to 1 mux module
input d0, d1, d2, d3;
input [1:0]s;
output y;
wire w0, w1;
//instance mux2
mx2 U0_mx2(d0, d1, s[0], w0);
mx2 U1_mx2(d2, d3, s[0], w1);
mx2 U2_mx2(w0, w1, s[1], y);
endmodule