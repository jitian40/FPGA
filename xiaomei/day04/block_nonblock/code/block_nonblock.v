module block_nonblock(clk,rst,a,b,c,cout);
	input clk;
	input rst;
	input a,b,c;
	output [1:0]cout;
	
	reg [1:0] cout;
	reg [1:0] d;//中间变量
	//cout=a+b+c;
	//d=a+b
	//cout = d+c;
	always @(posedge clk or negedge rst)begin
	 if(!rst) cout <=2'b0;
	 else begin
		d <= a+b;
		cout <= d+c;
	 end
		end
endmodule