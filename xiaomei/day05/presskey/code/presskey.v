//按键消抖
//原理：延时消抖

module presskey(cin,rst,clk,key_flag,key_state);

input rst;
input clk;
input cin;
output key_flag,key_state;


reg key_flag;//高电平表示有按键状态被触发
reg key_state;//按键状态，高电平按下，低电平释放

 localparam 
	IDEL    = 4'b0001,
	FILTER0 = 4'b0010,
	DOWN    = 4'b0100,
	FILTER1 = 4'b1000;
	
reg [3:0] state;//状态寄存器
reg reg0;
reg reg1;
 //计数器设置，延时20ms
 reg [19:0] count;
 reg en;//使能计数器
 reg cnt_full;
 //计数器
wire pedge,nedge;//上升沿，下降沿		
always @(posedge clk or negedge rst)//数据寄存器
	if(!rst) begin
		reg0 <=0;
		reg1 <=0;
	end
	else begin
	   reg0 <= cin;
		reg1 <= reg0;
	end
assign nedge = !reg0 & reg1;  //下降沿，reg0=0，reg1=1；
assign pedge = reg0 &(!reg1); //上升沿，reg0=1，reg1=0；

always @(posedge clk or negedge rst)if(!rst) begin 
		en <= 1'b1;
		state <= IDEL;
		key_state <= 1'b0;
		key_flag <= 1'b0;
	end
	else case(state)
	IDEL:    begin					
				key_flag <= 1'b0;  
				if(nedge)  //检测到下降沿，计数器开始计数，延时20ms再次检测
				begin 
				state <= FILTER0; //跳转到检波器
				en <= 1'b1;
				end
				else state <= IDEL;
			end
	FILTER0: if(cnt_full) begin  //延时20ms后，确认按键按下
				 en <= 1'b0;
				 state <= DOWN;     
				 key_state <= 1'b1;
				 key_flag <= 1'b1;
				 end
				 else if(pedge) begin
						state <= IDEL;
						en <= 1'b0;
				 end
				 else
				 state <= FILTER0;//自循环
	DOWN:		begin
				key_flag <= 1'b0;
				if(pedge) begin
				state <= FILTER1;
				en <= 1'b1;
				end
				else
				state <= DOWN;
				end
	FILTER1:begin
				if(cnt_full) begin
				 state <= IDEL;
				 key_state <= 1'b0;
				 key_flag <= 1'b0;
				end
				else if(nedge) begin
					en <= 1'b0;
					state <= DOWN;
				end
				else
					state <= FILTER1;
			end
	default:begin
			en <= 1'b0;
			key_flag <= 1'b0;
			key_flag <= 1'b0;
			state <= IDEL;
		  end
	endcase
 

 always @ (posedge clk or negedge rst) 
 if(!rst) count <= 20'b0;
 else if(en)
			count <= count+20'd1;
		else
			count <= 20'd0;
			
 always @ (posedge clk or negedge rst) 
 if(!rst) cnt_full <= 0;
 else if(count == 999_999)
			cnt_full <= 1'b1;
		else
			cnt_full <= 1'b0;

endmodule
