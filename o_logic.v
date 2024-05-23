module o_logic(clk, reset_n, multiplier, multiplicand, counter, state, op_done, result); //dicision ouput logic
input clk, reset_n;
input [31:0] multiplier, multiplicand;
input [5:0] counter;
input [1:0] state;

output reg op_done;
output reg [63:0] result;

reg [63:0] next_result;
reg [63:0] temp;
reg [31:0] addition_store, subtraction_store;
reg last_result;

wire [31:0] addition, subtraction;

parameter start_state = 2'b00; //set parameter value
parameter multiple_state = 2'b01; 
parameter clear_state = 2'b10; 


always@(posedge clk or negedge reset_n)
begin
	if(reset_n == 1'b0)
		begin
			addition_store = 32'b0;
			subtraction_store = 32'b0;
			result= 64'b0;
		end
	else
		begin
			addition_store <= addition;
			subtraction_store = subtraction;
			result <= next_result;
		end
end


always@(multiplier, multiplicand, counter, state, result, next_result, last_result, temp, addition_store, subtraction_store)
begin
	case(state)
		start_state:
		begin
			next_result[63:32] = 32'b0;
			next_result[31:0] = multiplier;
			op_done = 1'b0;
			last_result = 1'b0;
			temp = 64'b0;
		end
		
		multiple_state:
		begin
			if(counter == 6'b100000) //if cycle is 64
			begin
				op_done = 1'b1;
				next_result = result;
				last_result = 1'b0;
				temp = 64'b0;
			end
			else
			begin
					op_done = 1'b0;
					if(result[0] == 1'b0 && last_result == 1'b0) // if 00 is shift
					begin
						temp = result;
						last_result = result[0];
						next_result[63] = result[63];
						next_result[62:0] = result[63:1]; // mathmatical right shift
						//next_result = {result[63], result[63:1]};
					end
					else if(result[0] == 1'b0 && last_result == 1'b1) // if 01 is addition
					begin
						temp[63:32] = addition_store;
						temp[31:0] = result[31:0];
						last_result = result[0];
						next_result[63] <= temp[63];
						next_result[62:0] <= temp[63:1];
						//next_result = {temp[63], temp[63:1]}; //right shift
					end
					else if(result[0] == 1'b1 && last_result == 1'b0) // if 10 is subtraction
					begin
						temp[63:32] = subtraction_store;
						temp[31:0] = result[31:0];
						last_result = result[0];
						next_result[63] <= temp[63];
						next_result[62:0] <= temp[63:1];
						//next_result = {temp[63], temp[63:1]}; //right shift
					end
					else if(result[0] == 1'b1 && last_result == 1'b1) // if 11 is shift
					begin
						temp = result;
						last_result = result[0];
						next_result[63] <= result[63];
						next_result[62:0] <= result[63:1];
						//next_result = {result[63], result[63:1]}; // mathmatical right shift
					end
					else // 
					begin
						temp = result;
						next_result = 64'b0;
						op_done = 1'b0;
						last_result = 1'b0;
					end
				end
			end
			
			
			clear_state: // bits are 10
			begin
				next_result = result;
				op_done = 1'b1;
				last_result = 1'b0;
				temp = 64'b0;
			end
			default:
			begin
				next_result = 64'bx;
				op_done = 1'bx;
				last_result = 1'bx;
				temp = 64'bx;
			end
		endcase // end of case
	end
	
	cla32 U0_cla32(next_result[63:32],multiplicand[31:0],1'b0,addition);
	cla32 U1_cla32(next_result[63:32],~multiplicand[31:0],1'b1,subtraction);
		
endmodule // end of module 
