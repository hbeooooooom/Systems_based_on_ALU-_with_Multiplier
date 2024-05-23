
module tb_Top;
	reg clk,reset_n,M_req,M_wr;
	reg [7:0] M_addr;
	reg [31:0] M_dout;
	wire M_grant;
	wire [31:0] M_din;
	
	Top tb_Top(clk, reset_n, M_req, M_wr, M_addr, M_dout, M_grant, M_din);
	
	always #5 clk = ~clk;
	
	initial begin
		#7 clk = 1'b0; reset_n = 1'b0; M_req = 1'b0; M_wr = 1'b0;
		#10 reset_n = 1'b1; M_req = 1'b1; M_wr = 1'b1;
		#10 M_addr = 8'h00; M_dout = 32'h00000002;
		#10 M_addr = 8'h01; M_dout = 32'h00000003;
		#10 M_wr = 1'b0; M_addr = 8'h00;
		#10 M_addr = 8'h01;
		#10 M_wr = 1'b1; M_addr = 8'h30; M_dout = 32'h00000005;
		#10 M_addr = 8'h31; M_dout = 32'h00000016;
		#10 M_addr = 8'h32; M_dout = 32'h0000000D;
		#10 M_addr = 8'h33; M_dout = 32'h00000001;
		#10 M_wr = 1'b0; M_addr = 8'h34;
		#10 M_wr = 1'b0; M_addr = 8'h36;
		#600 M_addr = 8'h36;
		#10 $stop;
	end
endmodule