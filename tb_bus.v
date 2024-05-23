`timescale 1ns/100ps //1ns time unit/100ps time precision

module tb_bus;
   reg tb_clk, tb_reset_n, tb_M_req, tb_M_wr;
   reg [7:0] tb_M_addr;
   reg [31:0] tb_M_dout, tb_S0_dout, tb_S1_dout;
   wire tb_M_grant, tb_S_wr, tb_S0_sel, tb_S1_sel;
   wire [7:0] tb_S_addr;
   wire [31:0] tb_M_din, tb_S_din;
   
   //BUS module instance
   BUS U0_bus(.clk(tb_clk), .reset_n(tb_reset_n), .M_req(tb_M_req), .M_wr(tb_M_wr), .M_addr(tb_M_addr), .M_dout(tb_M_dout), .S0_dout(tb_S0_dout), .S1_dout(tb_S1_dout), .M_grant(tb_M_grant), 
   .M_din(tb_M_din), .S0_sel(tb_S0_sel), .S1_sel(tb_S1_sel), .S_addr(tb_S_addr), .S_wr(tb_S_wr), .S_din(tb_S_din));
               
   always begin //clock pulse 4ns
      tb_clk = 0; #2;
      tb_clk = 1; #2;
   end //End phrase
   
   initial begin //Initial & Begin phrase
   #0; tb_reset_n = 0; tb_M_req = 0; tb_M_wr = 0; tb_M_addr = 8'h0; tb_M_dout = 32'h0; tb_S0_dout = 32'h0; tb_S1_dout = 32'h0;
   #3; tb_reset_n = 1; tb_M_req = 1; tb_S0_dout = 32'h00000001; tb_S1_dout = 32'h00000002;
   #4; tb_M_wr = 1;
   #4; tb_M_addr = 8'h00; tb_M_dout = 32'h0000000A;
   #4; tb_M_addr = 8'h0A; tb_M_dout = 32'h0000000B;
   #4; tb_M_addr = 8'h0F; tb_M_dout = 32'h0000000C;
   #4; tb_M_addr = 8'h30; tb_M_dout = 32'h0000000D;
   #4; tb_M_addr = 8'h3A; tb_M_dout = 32'h0000000E;
   #4; tb_M_addr = 8'h3F; tb_M_dout = 32'h0000000F;
	
	#4; tb_M_addr = 8'h21; tb_M_dout = 32'h00000003;
	#4; tb_M_addr = 8'h2F; tb_M_dout = 32'h00000004;
	
	#4; tb_M_addr = 8'h30; tb_M_dout = 32'h0000000F;
   #4; $stop; //Stop
   end
endmodule //End module