`timescale 1ns/1ns
`define clk_period 20

module presskey_tb;
	reg cin;
	reg clk;
	reg rst;
	wire key_flag;
	wire key_state;
presskey   i1(
		.cin(cin),
		.rst(rst),
		.clk(clk),
		.key_flag(key_flag),
		.key_state(key_state));
		
initial clk =1;
always #(`clk_period/2) clk = ~clk;

initial begin
	rst = 1'b0;
	cin = 1'b1;
	#(`clk_period*1000) rst= 1'b1;
	#(`clk_period*10+1)
	cin = 0;#1000;
	cin = 1;#2000;
	cin = 0;#2000;
	cin = 1;#2000;
	cin = 0;#20000100;
	cin = 1;
	#10000;
	cin = 1;#1000;
	cin = 0;#1000;
	cin = 1;#2000;
	cin = 0;#2000;
	cin = 1;#2000;
	cin = 0;#2000;
	cin = 1;#20000100;
	cin = 0;
	
	#10000;
	cin = 0;#1000;
	cin = 1;#2000;
	cin = 0;#2000;
	cin = 1;#2000;
	cin = 0;#20000100;
	cin = 1;
	#10000;
	cin = 1;#1000;
	cin = 0;#1000;
	cin = 1;#2000;
	cin = 0;#2000;
	cin = 1;#2000;
	cin = 0;#2000;
	cin = 1;#20000100;
	cin = 0;
	#10000;
	cin = 0;#1000;
	cin = 1;#2000;
	cin = 0;#2000;
	cin = 1;#2000;
	cin = 0;#20000100;
	cin = 1;
	#10000;
	cin = 1;#1000;
	cin = 0;#1000;
	cin = 1;#2000;
	cin = 0;#2000;
	cin = 1;#2000;
	cin = 0;#2000;
	cin = 1;#20000100;
	cin = 0;
	#10000;
	cin = 0;#1000;
	cin = 1;#2000;
	cin = 0;#2000;
	cin = 1;#2000;
	cin = 0;#20000100;
	cin = 1;
	#10000;
	cin = 1;#1000;
	cin = 0;#1000;
	cin = 1;#2000;
	cin = 0;#2000;
	cin = 1;#2000;
	cin = 0;#2000;
	cin = 1;#20000100;
	cin = 0;
	#(`clk_period*200)
	$stop;
end

endmodule