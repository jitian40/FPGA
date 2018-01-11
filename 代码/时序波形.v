always @(posedge clk or negedge rst) begin
	if (rst==1'b0) begin
		// reset
		cnt <= 0;
	end
	else if (add_cnt) begin
		if (end_cnt) begin
			cnt< = 0;
		end
		else begin
			cnt <= cnt+1
		end
	end
end

assign add_cnt = dout==1;
assign end_cnt = add_cnt && cnt ==10-1 ;

always @(posedge clk or negedge rst) begin
	if (!rst) begin
		// reset
		cout <=0;
	end
    else if (en==1) begin
		cout <=1;
	end
	else if (end_cnt) begin
		cout <= 0;
	end
end