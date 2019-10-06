`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University
// Engineer: Tingyi Zhang, tingyi97@bu.edu
// 
// Create Date: 09/26/2019 04:15:10 PM
// Design Name: 
// Module Name: fCounter
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


module Counter(
input clk,
input rst,
input direction,
input pause,
input [7:0] max,
output reg [7:0] counter
);
wire [1:0]code={pause,direction};
always@(posedge clk or posedge pause)
begin
if(rst == 1)
    counter <= 0;
else
if(pause == 1)
    counter <= counter;
else
case(code)
    2'b00: counter <= (counter>0) ? counter-1 : max;
    2'b01: counter <= (counter<max) ? counter+1 : 0;
    2'b10: counter <= counter;
    2'b11: counter <= counter;  
endcase
end

endmodule







