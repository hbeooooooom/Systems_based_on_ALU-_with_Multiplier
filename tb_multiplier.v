`timescale 1ns/100ps // set the time of simulation 

module tb_multiplier; 
reg tb_clk, tb_reset_n;
reg [31:0] tb_multiplier; 
reg [31:0] tb_multiplicand; 
reg tb_op_start, tb_op_clear;

wire [5:0] cycle_counter;
wire tb_op_done;
wire [31:0] result1, result2;
//store multiplier
multiplier U0_multiplier(tb_clk, tb_reset_n, tb_multiplier, tb_multiplicand, tb_op_start, tb_op_clear, tb_op_done, result1, result2, cycle_counter);
	
always #7 tb_clk = ~tb_clk; 

initial begin
tb_clk = 1'b0; tb_reset_n = 1'b0; tb_op_start = 1'b0; tb_op_clear = 1'b0;
tb_multiplier = 32'b0000100000000000000111111111111; tb_multiplicand = 32'b0000010000000000000111111111111; // Add 1 for 2's complement
#10 tb_reset_n = 1'b1; tb_op_start = 1'b1; // If reset_n == 1 and op_start == 1, booth multiplication is performed
#600
$stop; 
end

endmodule // end of module
