module traffic_light_control(clk,ret,red1,red2,yellow1,yellow2,green1,green2);

input clk;
input ret;
output red1,yellow1,green1;
reg red1,yellow1,green1;
output red2,yellow2,green2;
reg red2,yellow2,green2;
reg [11:0] count;
parameter Y1Y2=0,R1Y2=1,G1R2=2,Y1R2=3,R1G2=4;
parameter TimeR1Y2=250,TimeG1R2=2500,TimeY1R2=250,TimeR1G2=2250;
reg [2:0] state;
always@(posedge clk or posedge ret) begin
    if(ret) begin
	    state<=Y1Y2;
	    red1<=1'b0;red2<=1'b0;yellow1<=1'b1;yellow2<=1'b1;green1<=1'b0;green2<=1'b0;
	    count<=1'b0;
	    end
    else case(state)
		Y1Y2:if(count==TimeR1Y2) begin state<=R1Y2;count<=0;
					 end
		R1Y2:if(count==TimeR1Y2) begin state<=G1R2;count<=1;
					       red1<=1'b0;red2<=1'b1;yellow1<=1'b0;yellow2<=1'b0;green1<=1'b1;green2<=1'b0;
					       end
		     else                begin 
					 state<=R1Y2;
					 count<=count+1'b1;
				         red1<=1'b1;red2<=1'b0;yellow1<=1'b0;yellow2<=1'b1;green1<=1'b0;green2<=1'b0;
			                 end
		     end
		G1R2:if(count==TimeG1R2) begin state<=Y1R2;count<=1;
					       red1<=1'b0;red2<=1'b1;yellow1<=1'b1;yellow2<=1'b0;green1<=1'b0;green2<=1'b0;
					       end
		     else                begin 
					 state<=G1R2;
					 count<=count+1'b1;
				         red1<=1'b0;red2<=1'b1;yellow1<=1'b0;yellow2<=1'b0;green1<=1'b1;green2<=1'b0;
			                 end
		     end
		Y1R2:if(count==TimeY1R2) begin state<=R1G2;count<=1;
					       red1<=1'b1;red2<=1'b0;yellow1<=1'b0;yellow2<=1'b0;green1<=1'b0;green2<=1'b1;
					       end
		     else                begin 
					 state<=Y1R2;
					 count<=count+1'b1;
				         red1<=1'b0;red2<=1'b1;yellow1<=1'b1;yellow2<=1'b0;green1<=1'b0;green2<=1'b0;
			                 end
		     end
		R1G2:if(count==TimeR1G2) begin state<=Y1Y2;count<=1;
					       red1<=1'b0;red2<=1'b0;yellow1<=1'b1;yellow2<=1'b1;green1<=1'b0;green2<=1'b0;
					       end
		     else                begin 
					 state<=R1G2;
					 count<=count+1'b1;
				         red1<=1'b1;red2<=1'b0;yellow1<=1'b0;yellow2<=1'b0;green1<=1'b0;green2<=1'b1;
			                 end
		     end
	        default:begin state<=Y1Y2;count<=0;end
	 endcase
		
    
end


endmodule