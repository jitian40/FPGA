module jk (clk1,rst1,out1);
input clk1;
input rst1;
output out1;
reg out1;
always@(posedge clk1 or posedge rst1) begin
	if(rst1) out1 <= 0;
	else out1 <= ~out1;
end
endmodule