module ns_logic(clk, reset_n, op_start, op_clear, op_done, state, counter);//next state module

input clk, reset_n;
input op_start, op_clear, op_done;

output [1:0] state;
output [5:0] counter;

parameter start_state = 2'b00;//set parameter
parameter multiple_state = 2'b01;
parameter clear_state = 2'b10;

reg [1:0] state, next_state;
reg [5:0] counter, next_counter;
reg [5:0] temp;

wire [5:0] temp_counter;
wire co;

cla8 U0_cla8({2'b00,next_counter}, 8'b00000001, 1'b0, temp_counter, co);

always@(posedge clk or negedge reset_n)//if clk, reset_n change
begin
	if(reset_n == 1'b0)
		begin
			temp = 5'b0;
			state <=start_state;
			counter <= 6'b0;
		end
	else
		begin
			temp = temp_counter[5:0];
			state <= next_state;
			counter <=next_counter;
		end
end

always @(op_start, op_clear, state, counter, temp)
	begin
		if(op_clear == 1'b1)
			begin
				next_state<= start_state;
				next_counter <= 6'b0;
			end
		else
			begin
				case(state)
					start_state: 
						begin
							if(op_start == 1'b1 && op_clear == 1'b0 && op_done == 1'b0)// if first start module and op_start
								begin
									next_state <=multiple_state;
									next_counter <=counter;
								end
							else
								begin
									next_state <=start_state;
									next_counter <= counter;
								end
						end
					multiple_state:
						begin
							if(counter == 6'b100000)
								begin
									next_state <=clear_state;
									next_counter <= counter;
								end
							else if(op_clear == 1'b1)
								begin
									next_state <= start_state;
									next_counter <= 6'b0;
								end
							else
								begin
									next_state <= multiple_state;
									next_counter <= temp;
								end
						end
						
					clear_state:
						begin
							if(op_clear == 1'b1) //if op clear is 1
								begin
									next_state <= start_state;
									next_counter <= counter;
								end
							else
								begin
									next_state <= 2'bx;
									next_counter <= 6'bx;
								end
						end
				endcase
			end
	end
endmodule
				
						
									