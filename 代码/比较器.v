module Digital(A,B,Y);

input [2:0] A;
input [2:0] B;
output [2:0] Y;

reg [2:0] Y;

always @(*)
begin
	if(A>B)
		Y <= 3'b100;
	else if (A=B)
		Y <=3'b010;
	else
		Y <=3'b001;
end

endmodule