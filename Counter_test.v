`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2019 08:14:40 PM
// Design Name: 
// Module Name: Counter_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Counter_test(

    );
    reg direction;
    reg rst;
    reg pause;
    reg [7:0]max;
    wire [7:0]counter;
    reg clk;
    initial clk=0;
    always #1 clk=~clk;
Counter C1(.clk(clk),.max(max),.rst(rst),.direction(direction),.pause(pause),.counter(counter));
initial
begin
#1 rst = 1; pause = 0; max = 8'b10000000;
#10 rst = 0; direction = 1;
#350 direction = 0;
#50 pause = 1;
#100 pause = 0;
#250 rst = 1;
#20 max = 8'b00001000; direction = 1; rst = 0;
#100 direction = 0;
#100 $finish;

end


endmodule
