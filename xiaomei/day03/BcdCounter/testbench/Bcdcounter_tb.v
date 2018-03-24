`timescale 1ns/1ns
`define clock_period 20
 module Bcdcounter_tb;

	reg clk;
	reg rst;
	reg cin;
	wire cout;
	wire [3:0] q;
	
	Bcdcounter i1(
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
	repeat(300) begin
	cin=1'b1;
	#(`clock_period)  ;
	cin=1'b0;
	#(`clock_period*5) ;
	end
	
	#(`clock_period*20);
	$stop;
	end
	endmodule