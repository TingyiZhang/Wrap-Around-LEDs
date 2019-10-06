`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University   
// Engineer: Tingyi Zhang, tingyi97@bu.edu
// 
// Create Date: 09/28/2019 03:25:07 PM
// Design Name: 
// Module Name: Clock_Divider
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


module Clock_Divider(
input clk,
input rst,
output reg outclk
    );
reg [31:0]count;
//100MHZ / 1HZ = 100M
//100M/2=50M=50000000 
always@(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 0;
       end
    else if (count == 50000000 - 1) begin
        count <= 0;
    end 
    else begin
        count <= count + 1;
    end
end

always@(posedge clk or posedge rst) begin
    if (rst) begin
        outclk <= 0;
     end
     else if (count == 50000000 - 1) begin
        outclk <= ~outclk;
     end
end
endmodule
