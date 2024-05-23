module register32_r_en(clk, reset_n, en, d_in, d_out);//32bits resettable d flip flop module
input clk, reset_n, en;
input [31:0] d_in;
output [31:0] d_out;

assign d_out = (reset_n == 0)?32'b0:((en==1)? d_in:d_out);

endmodule