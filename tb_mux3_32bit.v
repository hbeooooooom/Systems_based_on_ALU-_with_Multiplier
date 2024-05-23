`timescale 1ns/100ps
module tb_mux3_32bit;
reg [31:0] d0, d1, d2;
reg [1:0] s;
wire [31:0] y;

mux3_32bit U0(d0,d1,d2,s,y);
 initial begin 
 d0 = 32'h0000_0000; d1 = 32'h0000_0001; d2 = 32'h0000_0002;  #5;
 s = 2'b00; #5;
 s = 2'b01; #5;
 s = 2'b10; #5;
 end
 endmodule
 