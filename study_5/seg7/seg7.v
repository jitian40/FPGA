module seg7(clk,rst,out);

input clk,rst;
output [6:0] out;
reg [6:0] out;
reg [3:0] pre_state,nx_state;
parameter zero=0,one=1,two=2,three=3,four=4,five=5,six=6,seven=7,eight=8,nine=9;
parameter s0=7'b0111111,s1=7'b0000110,s2=7'b1011011,
		  s3=7'b1001111,s4=7'b1100110,s5=7'b1101101,
		  s6=7'b1111101,s7=7'b0000111,s8=7'b1111111,
		  s9=7'b1100111;

always @(posedge clk or posedge rst) begin
	if(rst)	pre_state<=zero;
	else pre_state<=nx_state;
end
always @(pre_state) 
	case(pre_state)
	zero:begin
		nx_state<=one;
		out<=s0;
	end
	one:begin
		nx_state<=two;
		out<=s1;
	end
	two:begin
		nx_state<=three;
		out<=s2;
	end
	three:begin
		nx_state<=four;
		out<=s3;
	end
	four:begin
		nx_state<=five;
		out<=s4;
	end
	five:begin
		nx_state<=six;
		out<=s5;
	end
	six:begin
		nx_state<=seven;
		out<=s6;
	end
	seven:begin
		nx_state<=eight;
		out<=s7;
	end
	eight:begin
		nx_state<=nine;
		out<=s8;
	end
	nine:begin
		nx_state<=zero;
		out<=s9;
	end
	default:begin
		nx_state<=0;
		out<=zero;
	end
	endcase


endmodule

 