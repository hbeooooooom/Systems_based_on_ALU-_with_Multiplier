module mux13_32bit(w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_slt, w_sgt, w_lsl, w_lsr, w_asr, w_add, w_sub, op, result);
	input [31:0]w_not_a, w_not_b, w_and, w_or, w_xor, w_xnor, w_slt, w_sgt, w_lsl, w_lsr, w_asr, w_add, w_sub;
	input [3:0] op;
	output reg[31:0] result;
	
	always@(op or w_not_a or w_not_b or w_and or w_or or w_xor or w_xnor or w_slt or w_sgt or w_lsl or w_lsr or w_asr or w_add or w_sub)
	begin
		case(op)
		4'b0000 : result <= w_not_a;
		4'b0001 : result <= w_not_b;
		4'b0010 : result <= w_and;
		4'b0011 : result <= w_or;
		4'b0100 : result <= w_xor;
		4'b0101 : result <= w_xnor;
		4'b0110 : result <= w_slt;
		4'b0111 : result <= w_sgt;
		4'b1000 : result <= w_lsl;
		4'b1001 : result <= w_lsr;
		4'b1010 : result <= w_asr;
		4'b1011 : result <= w_add;
		4'b1100 : result <= w_sub;
		default : result <= 32'bx;
		endcase
	end
endmodule
			