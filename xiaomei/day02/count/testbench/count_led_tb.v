`timescale 1ns/1ns
`define clock_period 20
module count_led_tb;
	reg clk;
	reg rst;
	wire led;
	count_led counter0(
	.Clk_50M(clk),
	.rst(rst),
	.Led(led)
	);
	
	initial clk=1;
	always #(`clock_period/2) clk = ~clk;
	
	initial 
	begin
		rst = 1'b0;
		#(`clock_period*20);
		rst =1'b1;
		#(`clock_period*100000000);
		$stop;
	end
	
	endmodule