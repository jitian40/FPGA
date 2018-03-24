//输入50MHz时钟，led灯每500ms闪烁一次
module count_led(Clk_50M,rst,Led);

input Clk_50M,rst;

output  Led;
reg Led;
reg [24:0] count;

always @(posedge Clk_50M or negedge rst) begin
	if(!rst)
		count <= 25'b0;
	else  begin
				if(count == 25'd25_000_000-1)
					count <= 25'b0;
				else 
					count <= count + 1'b1;
			end
end


always @(posedge Clk_50M or negedge rst) begin
	if(!rst)
		Led <= 1'b1;
	else  if(count == 25'd25_000_000-1)
				Led <= ~Led;
			else 
				Led <= Led;
end
endmodule