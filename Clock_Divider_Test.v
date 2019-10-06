`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University
// Engineer: Tingyi Zhang
// 
// Create Date: 09/28/2019 03:46:53 PM
// Design Name: 
// Module Name: Clock_Divider_Test
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


module Clock_Divider_Test(

    );
    reg clk;
    reg rst;
    wire outclk;
    initial clk=0;
    always #5 clk=~clk;
    Clock_Divider C(.clk(clk),.rst(rst),.outclk(outclk));
    initial
    begin
    rst=1;
    #1 rst=0;
    end
    
endmodule
