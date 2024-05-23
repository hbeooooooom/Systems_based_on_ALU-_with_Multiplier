module multiplier(clk, reset_n, multiplier, multiplicand, op_start,op_clear, op_done, result1, result2, cycle_counter);
input clk, reset_n;
input[31:0] multiplier, multiplicand;
input op_start, op_clear;
output reg[31:0]result1, result2;
output op_done;
wire [63:0] result;

wire[1:0] state;
output [5:0] cycle_counter;

ns_logic U0_ns_logic(clk, reset_n, op_start, op_clear, op_done, state, cycle_counter);
o_logic U1_o_logic(clk, reset_n, multiplier, multiplicand, cycle_counter, state,  op_done, result);

always@(op_done)
begin
if(op_done == 1)begin
result2 <= result[63:32];
result1 <= result[31:0];
end
end

endmodule