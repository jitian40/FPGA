module state(clk,rst,cin,cout);
	input clk;//50MHz
	input rst;//低电平复位
	input [7:0] cin;
	output reg cout;
	
	reg [2:0] pr_state;
	reg [2:0] nx_state;
	
	parameter idle=0,first=1,second=2,third=3,four=4;
	always @(posedge clk or negedge rst)
	if(!rst) begin
	pr_state <= idle;
	end
	else begin
		pr_state <= nx_state;
	end
	
	
	always @(cin,pr_state)
	if(!rst) cout <= 1'b0;
	else
	case(pr_state)
	idle:begin
		if(cin=="H") nx_state <= first;
		else
		   nx_state <= idle;
	end
	first:begin
		if(cin=="e") nx_state <= second;
		else
		   nx_state <= idle;
	end
	second:begin
		if(cin=="l") nx_state <= third;
		else
		   nx_state <= idle;
	end
	third:begin
		if(cin=="l") nx_state <= four;
		else
		   nx_state <= idle;
	end
	four:begin
		if(cin=="o") begin
		nx_state <= idle;
		cout <= ~cout;
		end
		else
		   nx_state <= idle;
	end
	default: begin
	nx_state <= idle;
	cout <= 1'b0;
	end
	endcase
endmodule