module ram(clk, cen, wen, S_addr, S_din, S_dout);//ram module
input clk;
input cen, wen;
input [4:0] S_addr;
input [31:0] S_din;
output reg [31:0] S_dout;

reg [31:0] mem [0:31];
integer i;

initial
begin
	for( i = 0 ; i<32 ; i = i+1)
		mem[i] = 32'b0; //initialization
end

always @(posedge clk)
begin
	if(cen == 1 && wen == 1)// if cen = 1, wen = 1
	begin
		mem[S_addr] <= S_din;
		S_dout <= 32'b0;
	end
	else if(cen == 1 && wen ==0) //if cen = 1, wen = 0
	begin
		S_dout <= mem[S_addr];
	end
	else if(cen == 0) //if cen = 0
	begin
		S_dout <= 32'b0;
	end
end

endmodule