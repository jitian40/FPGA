module fifo(clk,rst,wr_en,rd_en,cnt,din,full,empty,afull,aempty,dout);
  /*先入先出寄存器，输入段包含时钟信号，复位信号，读信号，写信号，数据，输出信息包含，输出字段，寄存器的状态，寄存器的剩余空间*/
	input clk,rst,wr_en,rd_en;
	input [7:0] din;
	output full,afull,empty,aempty;
	output [7:0] dout;
	reg [7:0] dout;
	output [4:0] cnt;
	reg [4:0] cnt;
	reg [7:0] fifo_ram[15:0];
	reg [4:0] wr_pointer,rd_pointer;
	wire empty,aempty;
	wire full,afull;
	always @(posedge clk) begin
		if(wr_en)
		fifo_ram[wr_pointer]<=din;
	end
	always @(posedge clk)begin
		if(rd_en)
		dout<=fifo_ram[rd_pointer];
	end
	always @ (posedge clk)begin
		if(rst)
		wr_pointer<=0;
		else begin
			wr_pointer<=(wr_en&!full)?wr_pointer+1:wr_pointer;
		end
	end
	always @(posedge clk) begin
		if (rst) begin
			// reset
			rd_pointer<=0;
		end
		else
		   rd_pointer<=(rd_en&!empty)?rd_pointer+1:rd_pointer;
	end
	always @(posedge clk) begin//计数
		if (rst) begin
			// reset
			cnt<=0;
		end
		else
		case({wr_en,rd_en})
		2'b00,2'b11:cnt<=cnt;
		2'b01:cnt<=(cnt==0)?0:cnt-1;
		2'b10:cnt<=(cnt==16)?16:cnt+1;
		endcase
	end
	assign afull=(cnt==15)?1:0;//将满
	assign aempty=(cnt==1)?1:0;//将空
	assign empty=(cnt==0)?1:0;//已空
	assign full=(cnt==16)?1:0;//已满
endmodule