always @(posedge clk or negedge rst) begin
	if (!rst) begin
		// reset
		cnt1 <= 0;
	end
	else if (add_cnt1) begin
		 if (end_cnt1) begin
		 	cnt1 <= 0;
		 end
		 else begin
		 	cnt1 <= cnt1+1;
		 end
	end
end

assign  add_cnt1 = cout==1;
assign  end_cnt1 = add_cnt1 && cnt1 ==3-1;

always @(posedge clk or negedge rst) begin
	if (!rst) begin
		// reset
		cnt2 < =0;
	end
	else if (add_cnt2) begin
		 if (end_cnt2) begin
		 	cnt2 <= 0;
		 end
		 else begin
		 	cnt2 <= cnt2+1;
		 end
	end
end

assign add_cnt2 = end_cnt2;
assign end_cnt2 = add_cnt2&&cnt2 == 3-1;

always @(posedge clk or negedge rst) begin
	if (!rst) begin
		// reset
		cout <=0 ;
	end
	else if (en==1) begin
		cout <=1;
	end
	else if (end_cnt2) begin
		cout <= 0;
	end
end

always @(posedge clk or negedge rst) begin
	if (!rst) begin
		// reset
		dout <=0;
	end
	else if (add_cnt1 && cnt1 ==1-1) begin
		dout <=1;
	end
	else if (end_cnt1) begin
		dout <=0;
	end
end