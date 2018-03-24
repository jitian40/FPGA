`timescale 1ns/1ns
`define clock_period 20

module state_tb;
	reg clk;//50MHz
	reg rst;//低电平复位
	reg [7:0] cin;
	wire cout;
	
state il(
	.clk(clk),
	.rst(rst),
	.cin(cin),
	.cout(cout));
	
initial clk=1'b1;

always #(`clock_period/2) clk = ~clk;

initial begin
    rst=0;
	 cin=0;
	 #(`clock_period*200) rst=1;
	 #(`clock_period*200)
	 forever begin
	 cin = "I";
	 #(`clock_period) cin= "I";
	 #(`clock_period) cin= "A";
	 #(`clock_period) cin= "M";
	 #(`clock_period) cin= "X";
	 #(`clock_period) cin= "I";
	 #(`clock_period) cin= "M";
	 #(`clock_period) cin= "I";
	 #(`clock_period) cin= "N";
	 #(`clock_period) cin= "G";
	 
	 #(`clock_period) cin= "H";
	 #(`clock_period) cin= "e";
	 #(`clock_period) cin= "l";
	 #(`clock_period) cin= "l";
	 #(`clock_period) cin= "o";
	 #(`clock_period) cin= "o";
	 #(`clock_period) cin= "l";
	 #(`clock_period) cin= "l";
	 #(`clock_period) cin= "H";
	 end
	 
end

endmodule
