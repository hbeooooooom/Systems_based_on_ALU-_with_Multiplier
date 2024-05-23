`timescale 1ns/100ps
module tb_ALUwMul;
reg clk, reset_n, S_sel, S_wr;
reg [7:0]S_addr;
reg [31:0]S_din;

wire [31:0] S_dout;

ALUwMul U0(clk, reset_n, S_sel, S_wr, S_addr, S_din, S_dout);
   always begin//clock pulse 4ns
      clk = 1; #2;
      clk = 0; #2;
   end
   
   initial begin
   #0; reset_n = 0; S_sel = 0; S_wr = 0; 
   #3; reset_n = 1; S_sel = 1; S_wr = 1; S_addr = 8'h30; S_din = 32'b11; 
	#4;										 	  S_addr = 8'h31; S_din = 32'b10;
	#4;
	#4;											  S_addr = 8'h32; S_din = 32'b00; //opcode is  NOT A
	#4;											  S_addr = 8'h33; S_din = 32'b01; //opstart
	#8;								 S_wr = 0; S_addr = 8'h36;
	#4; 											  S_addr = 8'h30; S_din = 32'h0000_0002;
	#4;											  S_addr = 8'h31; S_din = 32'h0000_0001;
	#4;								S_wr = 1;  S_addr = 8'h35; S_din = 32'b1;   
	#4;								 			  S_addr = 8'h35; S_din = 32'b0; 	
	#4; 								 S_wr = 1; S_addr = 8'h30; S_din = 32'b111;
	#4;											  S_addr = 8'h31; S_din = 32'b101;
	#4;											  S_addr = 8'h32; S_din = 32'b1101; //opcode is  addition
	#4;										     S_addr = 8'h33; S_din = 32'b1;
	#300; 								 S_wr = 0; S_addr = 8'h36;
	#4; 								 S_wr = 0; S_addr = 8'h37;

	
   #10; $stop;
   end
endmodule 