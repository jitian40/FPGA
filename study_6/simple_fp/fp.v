module fp(clk,rst,clk2,clk4,clk8);

input clk,rst;
output clk2,clk4,clk8;
reg clk2,clk4,clk8;

reg [4:0] count;

always @ (posedge clk or posedge rst)begin
	if(rst) begin
		count=0;
	end 
	else begin
		count<=(count==8)?0:count+1'b1;
	end
end

always @(count)begin
	if(count[0]==1) clk2=1'b1;
	else clk2=1'b0;
	if(count[1]==1) clk4=1'b1;
	else clk4=1'b0;
	if(count[2]==1) clk8=1'b1;
	else clk8=1'b0;
end

endmodule