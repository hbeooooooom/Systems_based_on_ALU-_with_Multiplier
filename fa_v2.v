module fa_v2(a,b,ci,s); //fa_v2 module
input a, b, ci;
output s;
wire w0;

_xor2 U0_xor2(a,b,w0);//load xor2
_xor2 U1_xor2(w0,ci,s);//load xor2
endmodule//end