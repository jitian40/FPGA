module saler(half,one,clk,rst,out);
input half,one,clk,rst,out;
reg [2:0] state;
reg out;
parameter idle=0,half=1,one=2,one-half=3,two=4;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		out<=0;
		state<=idle;
	end
	else case(state)
		idle:
			begin
			out<=0;
			if (half) state<=half;
			else if(one) state<=one;
			else state<=idle;
			end
		half:
			begin
			out<=0;
			if(half) state<=one;
			else if(one) state<=one-half;
			else state<=half;
			end
		one:
			begin
			if(half) state<=one-half;
			else if (one) begin
				out<=1;
				state<=two;
			end
			else 
				state<=one;
			end
		one-half:
			begin
			if(half) begin
				out<=1;
				state<=two;
			end
			else if (one) begin
				out<=1;
				state<=two;
			end
			else state<=one-half;
			end
		two:
			begin
				out<=0;
				state<=idle;
			end
		default:
			begin
				out<=0;
				state<=idle;
			end
		endcase
end

endmodule