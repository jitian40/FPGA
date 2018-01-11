/*二进制码与格雷码的转换*/

module bin2gray(gray,bin);

parameter SIZE=4;
input  [SIZE-1:0] bin;
output [SIZE-1:0] gray;

assign gray <=(bin>>1)^bin;

endmodule