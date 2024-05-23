`timescale 1ns/100ps //1ns time unit/100ps time precision

module tb_ram; //ram testbench module
   reg tb_clk, tb_cen, tb_wen;
   reg [4:0] tb_S_addr;
   reg [31:0] tb_S_din;
   wire [31:0] tb_S_dout;
   
   //Ram module instance
   ram U0_ram(.clk(tb_clk), .cen(tb_cen), .wen(tb_wen), .S_addr(tb_S_addr), .S_din(tb_S_din), .S_dout(tb_S_dout));
   
   always begin//clock pulse 4ns
      tb_clk = 0; #2;
      tb_clk = 1; #2;
   end //End phrase
   
   initial begin
   #0;   tb_S_din = 32'h0; tb_S_addr = 0; tb_cen = 0; tb_wen = 0;
   #4;   tb_cen = 1; tb_wen = 1; tb_S_din = 32'h0000000A; tb_S_addr = 5'b00000;
	#4;   tb_S_din = 32'h0000000B; tb_S_addr = 5'b00010;
	#4;   tb_S_din = 32'h0000000C; tb_S_addr = 5'b00011;
	#4;   tb_S_din = 32'h0000000D; tb_S_addr = 5'b00100;
   #4;   tb_wen = 0;   
   #4;   tb_S_din = 32'h00000000; tb_S_addr = 5'b00001;
	#4;   tb_S_din = 32'h00000000; tb_S_addr = 5'b00010;
	#4;   tb_S_din = 32'h00000000; tb_S_addr = 5'b00011;
	#4;   tb_S_din = 32'h00000000; tb_S_addr = 5'b00100;
   #4;   tb_cen = 0;
   #12;   $stop;
   end
endmodule //End module