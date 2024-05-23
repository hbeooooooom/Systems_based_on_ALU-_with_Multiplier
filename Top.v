module Top(clk, reset_n, M_req, M_wr, M_addr, M_dout, M_grant, M_din);//Top module
input clk, reset_n, M_req, M_wr;
input [7:0]M_addr;
input [31:0]M_dout;
output M_grant;
output [31:0]M_din;

wire S0_sel, S1_sel, S_wr;
wire [7:0] S_addr; 
wire [31:0] S_din, S0_dout, S1_dout;

BUS U0_BUS(clk, reset_n, M_req, M_wr, M_addr, M_dout,  M_grant, M_din, S0_sel, S1_sel, S_addr, S_din, S_wr, S0_dout, S1_dout);
ram U1_ram(clk, S0_sel, S_wr, S_addr[4:0],S_din, S0_dout);
ALUwMul U2_ALUwMul(clk, reset_n, S1_sel, S_wr, S_addr, S_din, S1_dout);


endmodule
