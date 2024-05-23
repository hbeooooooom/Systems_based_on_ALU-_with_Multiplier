module _inv(a,y); //invert
input a;
output y; 
assign y=~a; // invert a
endmodule

module _nand2(a,b,y);//NAND
input a,b; 
output y; 
assign y=~(a&b); // NAND a,b
endmodule

module _and2(a,b,y); //two input AND
input a,b; 
output y; 
assign y=a&b;
endmodule

module _or2(a,b,y); //two input OR
input a,b; 
output y; 
assign y=a|b;
endmodule

module _xor2(a,b,y); //two input XOR
input a, b; 
output y; 
wire inv_a, inv_b; //y= (a AND ~b) OR (~a And b)
wire w0, w1; 
_inv U0_inv(.a(a), .y(inv_a)); 
_inv U1_inv(.a(b), .y(inv_b)); 
_and2 U2_and2(.a(inv_a), .b(b), .y(w0)); 
_and2 U3_and2(.a(a),.b(inv_b), .y(w1)); 
_or2 U4_or2(.a(w0), .b(w1),.y(y)); 
endmodule

module _and3(a,b,c,y); //three input and
input a,b,c; 
output y; 
assign y=a&b&c;
endmodule

module _and4(a,b,c,d,y); //four input and
input a,b,c,d; 
output y; 
assign y=a&b&c&d;
endmodule

module _and5(a,b,c,d,e,y); //five input and
input a,b,c,d,e; 
output y; 
assign y=a&b&c&d&e;
endmodule

module _or3(a,b,c,y); //three input or
input a,b,c; 
output y; 
assign y=a|b|c;
endmodule

module _or4(a,b,c,d,y); //four input or
input a,b,c,d; 
output y; 
assign y=a|b|c|d;
endmodule

module _or5(a,b,c,d,e,y); //five input or
input a,b,c,d,e; 
output y; 
assign y=a|b|c|d|e;
endmodule

module _inv_4bits(a,y); //4bit inverter
input [3:0] a;
output [3:0] y;
assign y=~a;
endmodule

module _and2_4bits(a,b,y);//4bit 2 input and
input[3:0] a,b;
output[3:0] y;
assign y=a&b;
endmodule

module _or2_4bits(a,b,y);//4bit 2input or
input[3:0] a,b;
output[3:0] y;
assign y=a|b;
endmodule

module _xor2_4bits(a,b,y);//4bit 2 input xor
input [3:0] a,b;
output[3:0] y;
_xor2 U0_xor2(a[0], b[0], y[0]);
_xor2 U1_xor2(a[1], b[1], y[1]);
_xor2 U2_xor2(a[2], b[2], y[2]);
_xor2 U3_xor2(a[3], b[3], y[3]);
endmodule

module _xnor2_4bits(a,b,y); //4bit 2input xnor
input [3:0] a,b;
output[3:0] y;
wire[3:0] w0;
_xor2_4bits U0_xor2(a, b, w0);
_inv_4bits U1_inv_4bit(w0,y);
endmodule

module _inv_32bits(a,y);//invert 32bits module
input[31:0] a;
output[31:0] y;
assign y=~a;
endmodule

module _and2_32bits(a,b,y);//32bits and module
input [31:0] a,b;
output [31:0] y;
assign y=a&b;
endmodule

module _or2_32bits(a,b,y);//32bit or module
input[31:0] a,b;
output[31:0] y;
assign y=a|b;
endmodule

module _xor2_32bits(a,b,y); //32bits xor module
input [31:0] a,b;
output[31:0] y;
_xor2_4bits U0_xor2_4bits(a[3:0], b[3:0],y[3:0]);
_xor2_4bits U1_xor2_4bits(a[7:4], b[7:4],y[7:4]);
_xor2_4bits U2_xor2_4bits(a[11:8], b[11:8],y[11:8]);
_xor2_4bits U3_xor2_4bits(a[15:12], b[15:12],y[15:12]);
_xor2_4bits U4_xor2_4bits(a[19:16], b[19:16],y[19:16]);
_xor2_4bits U5_xor2_4bits(a[23:20], b[23:20],y[23:20]);
_xor2_4bits U6_xor2_4bits(a[27:24], b[27:24],y[27:24]);
_xor2_4bits U7_xor2_4bits(a[31:28], b[31:28],y[31:28]);
endmodule


module _xnor2_32bits(a, b, y); //32bits xnor module
input [31:0] a, b; 
output [31:0] y;
_xnor2_4bits U0_xnor2_4bits(a[3:0],  b[3:0],     y[3:0]);
_xnor2_4bits U1_xnor2_4bits(a[7:4],  b[7:4],     y[7:4]);
_xnor2_4bits U2_xnor2_4bits(a[11:8], b[11:8],  y[11:8]);
_xnor2_4bits U3_xnor2_4bits(a[15:12], b[15:12],  y[15:12]);
_xnor2_4bits U4_xnor2_4bits(a[19:16], b[19:16],  y[19:16]);
_xnor2_4bits U5_xnor2_4bits(a[23:20], b[23:20],  y[23:20]);
_xnor2_4bits U6_xnor2_4bits(a[27:24], b[27:24],  y[27:24]);
_xnor2_4bits U7_xnor2_4bits(a[31:28], b[31:28],  y[31:28]);
endmodule

module slt(a, b, y); //32bits set less than
input[31:0] a,b;
output [31:0] y;

wire signed [31:0] result;
cla32 U0_cla32(a,~b,1'b0,result);
assign y = (result < 0) ? 1:0;
endmodule
	
	
module sgt(a, b, y); //32bits set greater than
input [31:0] a,b;
output[31:0] y;
wire co;
wire signed [31:0] result;
cla32 U0_cla32(a, ~b, 1'b0, result);
assign y = (result > 0)? 1 : 0;	
endmodule 


module lsl(d_in, shamt, d_out); //32bit shift left module
   input [31:0] d_in;
	input [1:0] shamt;
   output [31:0] d_out;
   
	mux4 U0_mux4(d_in[0], 1'b0,1'b0, 1'b0,shamt, d_out[0]);//instance 4 to 1 mux * 32
	mux4 U1_mux4(d_in[1], d_in[0], 1'b0, 1'b0,shamt, d_out[1]);
	mux4 U2_mux4(d_in[2], d_in[1], d_in[0], 1'b0,shamt, d_out[2]);
	mux4 U3_mux4(d_in[3], d_in[2], d_in[1], d_in[0], shamt, d_out[3]);
	mux4 U4_mux4(d_in[4], d_in[3], d_in[2], d_in[1], shamt, d_out[4]);
	mux4 U5_mux4(d_in[5], d_in[4], d_in[3], d_in[2], shamt, d_out[5]);	
	mux4 U6_mux4(d_in[6], d_in[5], d_in[4], d_in[3], shamt, d_out[6]);
	mux4 U7_mux4(d_in[7], d_in[6], d_in[5], d_in[4], shamt, d_out[7]);
	mux4 U8_mux4(d_in[8], d_in[7], d_in[6], d_in[5], shamt, d_out[8]);
	mux4 U9_mux4(d_in[9], d_in[8], d_in[7], d_in[6], shamt, d_out[9]);
	mux4 U10_mux4(d_in[10], d_in[9], d_in[8], d_in[7], shamt, d_out[10]);
	mux4 U11_mux4(d_in[11], d_in[10], d_in[9], d_in[8], shamt, d_out[11]);
	mux4 U12_mux4(d_in[12], d_in[11], d_in[10], d_in[9], shamt, d_out[12]);
	mux4 U13_mux4(d_in[13], d_in[12], d_in[11], d_in[10], shamt, d_out[13]);	
	mux4 U14_mux4(d_in[14], d_in[13], d_in[12], d_in[11], shamt, d_out[14]);
	mux4 U15_mux4(d_in[15], d_in[14], d_in[13], d_in[12], shamt, d_out[15]);
	mux4 U16_mux4(d_in[16], d_in[15], d_in[14], d_in[13], shamt, d_out[16]);
	mux4 U17_mux4(d_in[17], d_in[16], d_in[15], d_in[14], shamt, d_out[17]);
	mux4 U18_mux4(d_in[18], d_in[17], d_in[16], d_in[15], shamt, d_out[18]);
	mux4 U19_mux4(d_in[19], d_in[18], d_in[17], d_in[16], shamt, d_out[19]);
	mux4 U20_mux4(d_in[20], d_in[19], d_in[18], d_in[17], shamt, d_out[20]);
	mux4 U21_mux4(d_in[21], d_in[20], d_in[19], d_in[18], shamt, d_out[21]);	
	mux4 U22_mux4(d_in[22], d_in[21], d_in[20], d_in[19], shamt, d_out[22]);
	mux4 U23_mux4(d_in[23], d_in[22], d_in[21], d_in[20], shamt, d_out[23]);
	mux4 U24_mux4(d_in[24], d_in[23], d_in[22], d_in[21], shamt, d_out[24]);
	mux4 U25_mux4(d_in[25], d_in[24], d_in[23], d_in[22], shamt, d_out[25]);
	mux4 U26_mux4(d_in[26], d_in[25], d_in[24], d_in[23], shamt, d_out[26]);
	mux4 U27_mux4(d_in[27], d_in[26], d_in[25], d_in[24], shamt, d_out[27]);
	mux4 U28_mux4(d_in[28], d_in[27], d_in[26], d_in[25], shamt, d_out[28]);
	mux4 U29_mux4(d_in[29], d_in[28], d_in[27], d_in[26], shamt, d_out[29]);	
	mux4 U30_mux4(d_in[30], d_in[29], d_in[28], d_in[27], shamt, d_out[30]);
	mux4 U31_mux4(d_in[31], d_in[30], d_in[29], d_in[28], shamt, d_out[31]);
   
endmodule
	
module lsr(d_in, shamt, d_out); //32bit shift right module
   input [31:0] d_in;
	input [1:0] shamt;
   output [31:0] d_out;
   
 	mux4 U0_mux4(d_in[0], d_in[1], d_in[2], d_in[3], shamt, d_out[0]);//instance 4 to 1 mux * 32
	mux4 U1_mux4(d_in[1], d_in[2], d_in[3], d_in[4], shamt, d_out[1]);
	mux4 U2_mux4(d_in[2], d_in[3], d_in[4], d_in[5], shamt, d_out[2]);
	mux4 U3_mux4(d_in[3], d_in[4], d_in[5], d_in[6], shamt, d_out[3]);
	mux4 U4_mux4(d_in[4], d_in[5], d_in[6], d_in[7], shamt, d_out[4]);
	mux4 U5_mux4(d_in[5], d_in[6], d_in[7], d_in[8], shamt, d_out[5]);	
	mux4 U6_mux4(d_in[6], d_in[7], d_in[8], d_in[9], shamt, d_out[6]);
	mux4 U7_mux4(d_in[7], d_in[8], d_in[9], d_in[10], shamt, d_out[7]);
	mux4 U8_mux4(d_in[8], d_in[9], d_in[10], d_in[11], shamt, d_out[8]);
	mux4 U9_mux4(d_in[9], d_in[10], d_in[11], d_in[12], shamt, d_out[9]);
	mux4 U10_mux4(d_in[10], d_in[11], d_in[12], d_in[13], shamt, d_out[10]);
	mux4 U11_mux4(d_in[11], d_in[12], d_in[13], d_in[14], shamt, d_out[11]);
	mux4 U12_mux4(d_in[12], d_in[13], d_in[14], d_in[15], shamt, d_out[12]);
	mux4 U13_mux4(d_in[13], d_in[14], d_in[15], d_in[16], shamt, d_out[13]);	
	mux4 U14_mux4(d_in[14], d_in[15], d_in[16], d_in[17], shamt, d_out[14]);
	mux4 U15_mux4(d_in[15], d_in[16], d_in[17], d_in[18], shamt, d_out[15]);
	mux4 U16_mux4(d_in[16], d_in[17], d_in[18], d_in[19], shamt, d_out[16]);
	mux4 U17_mux4(d_in[17], d_in[18], d_in[19], d_in[20], shamt, d_out[17]);
	mux4 U18_mux4(d_in[18], d_in[19], d_in[20], d_in[21], shamt, d_out[18]);
	mux4 U19_mux4(d_in[19], d_in[20], d_in[21], d_in[22], shamt, d_out[19]);
	mux4 U20_mux4(d_in[20], d_in[21], d_in[22], d_in[23], shamt, d_out[20]);
	mux4 U21_mux4(d_in[21], d_in[22], d_in[23], d_in[24], shamt, d_out[21]);	
	mux4 U22_mux4(d_in[22], d_in[23], d_in[24], d_in[25], shamt, d_out[22]);
	mux4 U23_mux4(d_in[23], d_in[24], d_in[25], d_in[26], shamt, d_out[23]);
	mux4 U24_mux4(d_in[24], d_in[25], d_in[26], d_in[27], shamt, d_out[24]);
	mux4 U25_mux4(d_in[25], d_in[26], d_in[27], d_in[28], shamt, d_out[25]);
	mux4 U26_mux4(d_in[26], d_in[27], d_in[28], d_in[29], shamt, d_out[26]);
	mux4 U27_mux4(d_in[27], d_in[28], d_in[29], d_in[30], shamt, d_out[27]);
	mux4 U28_mux4(d_in[28], d_in[29], d_in[30], d_in[31], shamt, d_out[28]);
	mux4 U29_mux4(d_in[29], d_in[30], d_in[31], 1'b0, shamt, d_out[29]);	
	mux4 U30_mux4(d_in[30], d_in[31], 1'b0, 1'b0, shamt, d_out[30]);
	mux4 U31_mux4(d_in[31], 1'b0, 1'b0, 1'b0, shamt, d_out[31]);
endmodule



module asr(d_in, shamt, d_out); //shift right arithmetic module
   input [31:0] d_in;
	input [1:0] shamt;
   output [31:0] d_out;
   
	mux4 U0_mux4(d_in[0], d_in[1], d_in[2], d_in[3], shamt, d_out[0]);//instance 4 to 1 mux * 32
	mux4 U1_mux4(d_in[1], d_in[2], d_in[3], d_in[4], shamt, d_out[1]);
	mux4 U2_mux4(d_in[2], d_in[3], d_in[4], d_in[5], shamt, d_out[2]);
	mux4 U3_mux4(d_in[3], d_in[4], d_in[5], d_in[6], shamt, d_out[3]);
	mux4 U4_mux4(d_in[4], d_in[5], d_in[6], d_in[7], shamt, d_out[4]);
	mux4 U5_mux4(d_in[5], d_in[6], d_in[7], d_in[8], shamt, d_out[5]);	
	mux4 U6_mux4(d_in[6], d_in[7], d_in[8], d_in[9], shamt, d_out[6]);
	mux4 U7_mux4(d_in[7], d_in[8], d_in[9], d_in[10], shamt, d_out[7]);
	mux4 U8_mux4(d_in[8], d_in[9], d_in[10], d_in[11], shamt, d_out[8]);
	mux4 U9_mux4(d_in[9], d_in[10], d_in[11], d_in[12], shamt, d_out[9]);
	mux4 U10_mux4(d_in[10], d_in[11], d_in[12], d_in[13], shamt, d_out[10]);
	mux4 U11_mux4(d_in[11], d_in[12], d_in[13], d_in[14], shamt, d_out[11]);
	mux4 U12_mux4(d_in[12], d_in[13], d_in[14], d_in[15], shamt, d_out[12]);
	mux4 U13_mux4(d_in[13], d_in[14], d_in[15], d_in[16], shamt, d_out[13]);	
	mux4 U14_mux4(d_in[14], d_in[15], d_in[16], d_in[17], shamt, d_out[14]);
	mux4 U15_mux4(d_in[15], d_in[16], d_in[17], d_in[18], shamt, d_out[15]);
	mux4 U16_mux4(d_in[16], d_in[17], d_in[18], d_in[19], shamt, d_out[16]);
	mux4 U17_mux4(d_in[17], d_in[18], d_in[19], d_in[20], shamt, d_out[17]);
	mux4 U18_mux4(d_in[18], d_in[19], d_in[20], d_in[21], shamt, d_out[18]);
	mux4 U19_mux4(d_in[19], d_in[20], d_in[21], d_in[22], shamt, d_out[19]);
	mux4 U20_mux4(d_in[20], d_in[21], d_in[22], d_in[23], shamt, d_out[20]);
	mux4 U21_mux4(d_in[21], d_in[22], d_in[23], d_in[24], shamt, d_out[21]);	
	mux4 U22_mux4(d_in[22], d_in[23], d_in[24], d_in[25], shamt, d_out[22]);
	mux4 U23_mux4(d_in[23], d_in[24], d_in[25], d_in[26], shamt, d_out[23]);
	mux4 U24_mux4(d_in[24], d_in[25], d_in[26], d_in[27], shamt, d_out[24]);
	mux4 U25_mux4(d_in[25], d_in[26], d_in[27], d_in[28], shamt, d_out[25]);
	mux4 U26_mux4(d_in[26], d_in[27], d_in[28], d_in[29], shamt, d_out[26]);
	mux4 U27_mux4(d_in[27], d_in[28], d_in[29], d_in[30], shamt, d_out[27]);
	mux4 U28_mux4(d_in[28], d_in[29], d_in[30], d_in[31], shamt, d_out[28]);
	mux4 U29_mux4(d_in[29], d_in[30], d_in[31], d_in[31], shamt, d_out[29]);	
	mux4 U30_mux4(d_in[30], d_in[31], d_in[31], d_in[31], shamt, d_out[30]);
	mux4 U31_mux4(d_in[31], d_in[31], d_in[31], d_in[31], shamt, d_out[31]);
endmodule
