module Bcdcounter(clk,cin,rst,cout,q);
 input clk;
 input cin;
 input rst;
 output cout;
 output [4:0] q;
 reg [4:0] cnt;
 
 always @ (posedge clk or negedge rst) begin
	if(!rst) cnt<=4'd0;
   else if(cin==1'b1) begin
		if(cnt==4'd9) cnt <= 4'd0;
		else
			cnt <= cnt+1'b1;
	end
	else cnt <= cnt;
 end
	assign cout=(cin == 1'b1 && cnt ==4'd9);
	assign q = cnt;
endmodule