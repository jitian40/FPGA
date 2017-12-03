module count4(clk,ret,cout);

input clk;
input ret;
output [3:0] cout;

reg [3:0] cnt;
reg [3:0] cout;

always@(posedge clk or negedge ret) begin
	if(!ret) cout=1'b0;
	else if(cout==4'b1111) cout<=1'd0;
	else
		cout<=cout+1'b1;
		
end
endmodule