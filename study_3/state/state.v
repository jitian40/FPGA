module state (clk,ret,din,dout);

input clk;
input ret;
input din;
output dout;

reg dout;
reg [2:0] pr_state,nx_state;
parameter zero=3'd0,one=3'd1,two=3'd2,three=3'd3,four=3'd4;
always@(posedge clk or posedge ret)
	if(ret) pr_state<=zero;
	else pr_state<=nx_state;

always @(din,pr_state) begin
	case(pr_state)
	zero:begin
		  dout=0;
		  if(din==0) nx_state=zero;
		  else nx_state=one;
		  end
	one :begin
		  dout=0;
		  if(din==0) nx_state=zero;
		  else nx_state=two;
		  end
	two :begin
		  dout=0;
		  if(din==0) nx_state=zero;
		  else nx_state=three;
		  end
	three :begin
		  dout=0;
		  if(din==0) nx_state=zero;
		  else nx_state=four;
		  end
	four :begin
		  dout=1;
		  if(din==0) nx_state=zero;
		  else nx_state=four;
		  end
	default:begin
		  dout=0;
		  nx_state=zero;
		  end
	endcase
end

endmodule