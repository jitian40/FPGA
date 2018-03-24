module Bcdcounter_top(
clk,cin,rst,cout,q
);
 input clk;
 input cin;
 input rst;
 output cout;
 output [11:0] q;
 
 wire cout0;
 wire cout1;
 wire [3:0] q0,q1,q2;
 
 assign q={q0,q1,q2};
 Bcdcounter counter0(
	.clk(clk),
	.rst(rst),
	.cin(cin),
	.cout(cout0),
	.q(q2)
 );
  Bcdcounter counter1(
	.clk(clk),
	.rst(rst),
	.cin(cout0),
	.cout(cout1),
	.q(q1)
 );
  Bcdcounter counter2(
	.clk(clk),
	.rst(rst),
	.cin(cout1),
	.cout(cout),
	.q(q0)
 );
 
 
 endmodule 
 