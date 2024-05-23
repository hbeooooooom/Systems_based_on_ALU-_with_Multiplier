module mux3_32bit(d0, d1, d2, s, y); //mux2 module
	input[31:0] d0, d1, d2;
   input [1:0]s;
   output[31:0] y;

	assign y =(s==2'b10)?d0:((s==2'b01)?d1:d2);
endmodule