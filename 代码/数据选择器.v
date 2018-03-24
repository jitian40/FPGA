module Selector(A,D0,D1,D2,D3,D4,D5,D6,D7,y);
input D0,D1,D2,D3,D4,D5,D6,D7;
input [2:0] A;
output [7:0] out;
reg [7:0] out;

always @(*)
	begin
		case (A):
			3'b00:Y=D0;
			3'b00:Y=D1;
			3'b00:Y=D2;
			3'b00:Y=D3;
			3'b00:Y=D4;
			3'b00:Y=D5;
			3'b00:Y=D6;
			3'b00:Y=D7;
			default:1'b0;
	end
endmodule