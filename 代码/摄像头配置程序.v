
always @(posedge clk or negedge rst) begin
	if (!rst) begin
		// reset
		cnt<=0;
	end
	else if (add_cnt) begin
		 if (end_cnt) begin
		 	cnt<=0;
		 end
		 else begin
		 	cnt <= cnt+1;
		 end
	end
end

assign add_cnt = flag;
assign end_cnt = add_cnt && cnt ==100-1;


always @(posedge clk or negedge rst) begin
	if (!rst) begin
		// reset
		cnt_flag =0 ;
	end
	else if (add_cnt_flag) begin
		if (end_cnt_flag) begin
			cnt_flag <= 0;
		end
		else begin
			cnt_flag <= cnt_flag +1;
		end
	end
end

assign add_cnt_flag = end_cnt;
assign end_cnt_flag =add_cnt_flag && cnt_flag ==30-1 ;


//时钟flag
always @(posedge clk or negedge rst) begin
	if (!rst) begin
		// reset
		flag <= 0;
	end
	else if (en==1) begin
		flag <= 1;
	end
	else if (end_cnt_flag) begin
		flag <= 0;
	end
end
//输出波形
always @(posedge clk_100 or negedge rst) begin
	if (rst) begin
		// reset
		sio_c <= 1;
	end
	else if (add_cnt && cnt ==1-1) begin
		sio_c <= 0;
	end
	else if (add_cnt && cnt ==50-1) begin
		sio_c <= 1;
	end
end

//数据输出
assign tx_data ={data1,data2,data3,data4,data5} ;
always @(posedge clk or negedge rst) begin
	if (!rst) begin
		// reset
		dout <= 0;
	end
	else if (add_cnt & cnt==25-1) begin
		dout <= tx_data[29-cnt];
	end
end