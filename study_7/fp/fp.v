module fp(clk,rst,out);
input clk,rst;
output [3:0] out;

jk     jk1(clk,rst,out[0]),
		 jk2(out[0],rst,out[1]),
		 jk3(out[1],rst,out[2]),
		 jk4(out[2],rst,out[3]);

endmodule