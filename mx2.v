module mx2(d0, d1, s, y);//1bit 2-to-1 multiplexer
input d0, d1;
input s;
output y;
wire sb, w0, w1;
_inv U0_inv(s,sb);//load inv s and get value into sb
_nand2 U1_nand2(d0, sb, w0);//if s=0 ~(d0&sb) = 0
_nand2 U2_nand2(d1, s, w1);//if s=1 ~(d1&s)=0
_nand2 U3_nand2(w0, w1, y);
endmodule
