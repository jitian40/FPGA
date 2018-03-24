 module decoder(A,B,C,rst,out);
input A,B,C;//输入信号A,B,C

input rst;//复位信号

output [7:0] out;//输出信号

reg [7:0] out;
always@(*) begin
if(rst) out <= 8'b0;
else 
	case ({A,B,C})
		3'b000: out <= 8'b0000_0001;
		3'b001: out <= 8'b0000_0010;
		3'b010: out <= 8'b0000_0100;
		3'b011: out <= 8'b0000_1000;
		3'b100: out <= 8'b0001_0000;
		3'b101: out <= 8'b0010_0000;
		3'b110: out <= 8'b0100_0000;
		3'b111: out <= 8'b1000_0000;
		default: out <= 8'b0;
	endcase
end
endmodule
		