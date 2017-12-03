module bcd_cnt(
	clk,reset,count
);

input clk;
input reset;

output [3:0] count;
reg  [3:0] count;
parameter zero=0,one=1,two=2,three=3,four=4,
			 five=5,six=6,seven=7,eight=8,nine=9;

reg [3:0] pr_state,nx_state;

always @(posedge clk)
		if (reset)
			pr_state<=zero;
		else 
			pr_state=nx_state;	

always@(pr_state)
	case (pr_state)
	zero: begin nx_state=one; count=4'b0000; end
	one: begin nx_state=two; count=4'b0001; end
	two: begin nx_state=three; count=4'b0010; end
	three: begin nx_state=four; count=4'b0011; end
	four: begin nx_state=five; count=4'b0100; end
	five: begin nx_state=six; count=4'b0101; end
	six: begin nx_state=seven; count=4'b0110; end
	seven: begin nx_state=eight; count=4'b0111; end
	eight: begin nx_state=nine; count=4'b1000; end
	nine: begin nx_state=zero; count=4'b1001; end
	default: nx_state=0;
	endcase
	
endmodule