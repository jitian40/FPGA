/*异步寄存器*/

module sys_afifo(rst,wr_en,rd_en,wclk,rclk,din,full,afull,empty,aempty,dout);

input wr_en,wclk; //写控制信号
input rd_en,rclk; //读控制信号
input rst;        //重置信号
input [7:0] din;  //输入8位数据
output full,afull;//输入数据数量记录
output empty,aempty;//寄存器是否为空
output [7:0] dout;//数据输出
