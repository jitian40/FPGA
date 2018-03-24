//LED 灯控制 输入A,B,按键

module led_control(A,B,Key_in,out);

input A,B;

input Key_in;

output out;
assign out=(Key_in==0)? A:B;

endmodule