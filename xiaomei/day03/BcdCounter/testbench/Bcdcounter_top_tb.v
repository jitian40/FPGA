`timescale 1ns/1ns
`define clock_period 20
 module Bcdcounter_top_tb;

	reg clk;
	reg rst;
	reg cin;
	wire cout;
	wire [11:0] q;
	
	Bcdcounter_top i1(
	.clk(clk),
	.rst(rst),
	.cin(cin),
	.cout(cout),
	.q(q)
	);
	
	initial clk=1;
	always #(`clock_period/2) clk=~clk;
	
	initial begin
	rst=1'b0;
	cin=1'b0;
	#(`clock_period*200);
	rst=1'b1;
	#(`clock_period*20);
	cin=1'b1;
	#(`clock_period*5000);
	$stop;
	end
	endmodule