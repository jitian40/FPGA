
//时钟

//计数器 p秒级
always @(posedge clk or negedge rst) begin
	if (rst==1'b0) begin
		// reset
		cnt <= 0;
	end
	else if (add_cnt) begin
		if (end_cnt) begin
			cnt <= 0;
		end
		else begin
			cnt <= cnt +1;
		end
	end
end

assign add_cnt = 1;
assign end_cnt = add_cnt && cnt ==10000000-1;

//计数器秒级 个位

always @(posedge clk or negedge rst) begin
	if (rst==1'b0) begin
		// reset
		miao_g <=0;
	end
	else if (add_miao_g) begin
		 if (end_miao_g) begin
		 	miao_g <= 0;
		 end
		 else begin
		 	miao_g <= miao_g+1;
		 end
	end
end

assign add_miao_g = end_cnt;
assign end_miao_g = add_miao_g&&miao_g==10-1;

// 计数器秒 十位

always @(posedge clk or negedge rst) begin
	if (rst==1'b0) begin
		// reset
		miao_s <= 0;
	end
	else if (add_miao_s) begin
		 if (end_miao_s) begin
		 	miao_s<=0;
		 end
		 else begin
		 	miao_s <= miao_s +1;
		 end
	end
end

assign add_miao_s = end_miao_g;
assign end_miao_s = add_miao_s&&miao_s==6-1;

// 计数器 分 个位

always @(posedge clk or negedge rst) begin
	if (rst==1'b0) begin
		// reset
		fen_g <= 0;
	end
	else if (add_fen_g) begin
		if (end_fen_g) begin
			fen_g < = 0
		end
		else begin
			fen_g <= fen_g+1;
		end
	end
end

assign add_fen_g = end_miao_s;
assign end_fen_g = add_fen_g && fen_g == 10-1;

//计数器 分 十位

always @(posedge clk or negedge rst) begin
	if (rst==1'b0) begin
		// reset
		fen_s <=0;
	end
	else if (add_fen_s) begin
		if (end_fen_s) begin
			fen_s <=0;
		end
		else begin
			fen_s <= fen_s+1;
		end
	end
end

assign add_fen_s = end_fen_g;
assign end_fen_s = add_fen_s && fen_s == 6-1 ;

// 计数器 时 个位

always @(posedge clk or negedge rst) begin
	if (rst==1'b0) begin
		// reset
		shi_g <= 0;
	end
	else if (add_shi_g) begin
		if (end_shi_g) begin
			shi_g <= 0;
		end
		else begin
			shi_g <= shi_g +1;
		end
	end
end

assign add_shi_g = end_fen_s;
assign end_shi_g = add_shi_g && shi_g ==x-1;

// 时钟 时 十位;

always @(posedge clk or negedge rst) begin
	if (rst==1'b0) begin
		// reset
		shi_s <= 0;
	end
	else if (add_shi_s) begin
		if (end_shi_s) begin
			shi_s <= 0;
		end
		else begin
			shi_s <= shi_s +1;
		end
	end
end

assign  add_shi_s = end_shi_g ;
assign  end_shi_s = add_shi_s&&shi_s == 3-1;

always @(shi_s) begin
	if(shi_s ==2)
	   x=4;
	else begin
		x=10;   	
	   end
end