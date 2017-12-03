module fp_verilog(
		 clk,rst_n,
		 fm
);

input clk;
input rst_n;
output fm;

reg[5:0] cnt;

always @ (posedge clk or negedge rst_n)
	if(!rst_n) cnt<=6'd0;
	else if(cnt<6'd49) cnt<=cnt+1'b1;
	else cnt <= 6'd0;
	
assign fm=(cnt<=6'd24)? 1'b0:1'b1;

endmodule	