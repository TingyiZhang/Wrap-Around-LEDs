`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University
// Engineer: Tingyi Zhang
// 
// Create Date: 09/30/2019 07:27:02 PM
// Design Name: 
// Module Name: Wrap_Around_LEDs_Test
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


module Wrap_Around_LEDs_Test(

    );
    reg clk;
    initial clk=0;
    always #0.05 clk=~clk;
    reg s1;
    reg s0;
    reg rst;
    reg [7:0] max;
    reg pause;
    wire l0,l1,l2,l3;
    Wrap_Around_LEDs WAL(.clk(clk),.s1(s1),.s0(s0),.rst(rst),.pause(pause),.max(max),.l0(l0),.l1(l1),.l2(l2),.l3(l3));
    initial
    begin
    #1 rst=1; pause=1;
    #10 rst=0;max=0;pause=0;s1=1;s0=0;
    #40000000 s1=0; s0=1;
    #40000000 pause=1;
    #10000000 pause=0;
    #10000000 rst=1;
    #10000000 rst=0;
    end
    
    
endmodule
