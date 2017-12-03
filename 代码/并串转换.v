module p2s(clk,rst,dinp,en,load,dout);

input [7:0] dinp;//输入串行数据
input clk,rst,en,load;
output dout;
reg [7:0] shifter;//队列先入先出
always @(posedge clk) begin
	if (rst) shifter<=0;//重置，清空队列
	else if (en&load) shifter<=dinp;//将数据存到队列里
	else if (en)  shifter[7:0]<={shifter[6:0],1'b0};
	assign dout<=shifter[7];
end