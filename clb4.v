module clb4(a,b,ci,c1,c2,c3,co); //carry look-ahead block
input [3:0]a,b;
input ci;
output c1,c2,c3,co;
wire [3:0] g,p;
wire w0_c1;
wire w0_c2, w1_c2;
wire w0_c3, w1_c3, w2_c3;
wire w0_co, w1_co, w2_co, w3_co;

_and2 U0_and2(a[0],b[0],g[0]);//g[0] = a[0]&b[0]
_and2 U1_and2(a[1],b[1],g[1]);//g[1] = a[1]&b[1]
_and2 U2_and2(a[2],b[2],g[2]);//g[2] = a[2]&b[2]
_and2 U3_and2(a[3],b[3],g[3]);//g[3] = a[3]&b[3]

_or2 U4_or2(a[0],b[0],p[0]);//p[0] = a[0]|b[0]
_or2 U5_or2(a[1],b[1],p[1]);//p[1] = a[1]|b[1]
_or2 U6_or2(a[2],b[2],p[2]);//p[2] = a[2]|b[2]
_or2 U7_or2(a[3],b[3],p[3]);//p[3] = a[3]|b[3]
//c1
_and2 U8_and2(p[0],ci,w0_c1);//p[0]&ci
_or2 U9_or2(g[0],w0_c1,c1);//all elements
//c2
_and2 U10_and2(p[1],g[0],w0_c2);//p[0]&g[0]
_and3 U11_and3(p[1],p[0],ci,w1_c2);//p[1]&p[0]&ci)
_or3 U12_or3(g[1],w0_c2,w1_c2,c2); //all elements
//c3
_and2 U13_and2(p[2],g[1],w0_c3);
_and3 U14_and3(p[2],p[1],g[0],w1_c3);
_and4 U15_and4(p[2],p[1],p[0],ci,w2_c3);
_or4 U16_or3(g[2],w0_c3,w1_c3,w2_c3,c3);
//co
_and2 U17_and2(p[3],g[2],w0_co);
_and3 U18_and3(p[3],p[2],g[1],w1_co);
_and4 U19_and4(p[3],p[2],p[1],g[0],w2_co);
_and5 U20_and5(p[3],p[2],p[1],p[0],ci,w3_co);
_or5 U21_or5(g[3],w0_co,w1_co,w2_co,w3_co,co);

endmodule//end