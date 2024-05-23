module tb_cla32;
reg [31:0] a,b;
reg ci;
wire [31:0] s;
wire co;

cla32 u(a,~b,ci,s,co);
initial
begin
a = 32'h3; b = 32'h1; ci = 1; #4;
a = 32'h3; b = 32'h1; ci = 1; #4;
end
endmodule