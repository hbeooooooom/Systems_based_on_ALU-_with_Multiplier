module tb_alu32;
reg [31:0]a,b;
reg [3:0] op;
wire [31:0] result, opdone;

alu32 U(a,b,op,result,opdone);
initial
begin
		a = 32'h5; b = 32'h16;  op = 4'h0;
#4;									 op = 4'h1;
#4;									 op = 4'h2;
#4;									 op = 4'h3;
#4;									 op = 4'h4;
#4;									 op = 4'h5;
#4;									 op = 4'h6;
#4;									 op = 4'h7;
#4;									 op = 4'h8;
#4;									 op = 4'h9;
#4;									 op = 4'b1011;
#4;									 op = 4'b1100;
#4;									 op = 4'h12;
#4;

end			
endmodule