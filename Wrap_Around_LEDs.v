`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Boston University
// Engineer: Tingyi Zhang
// 
// Create Date: 09/28/2019 06:37:49 PM
// Design Name: 
// Module Name: Wrap_Around_LEDs
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


module Wrap_Around_LEDs(
    input clk,
    input s0,
    input s1,
    input pause,
    input rst,
    input [7:0] max,
    output reg l0, l1, l2, l3

    );
    reg [2:0]state = 0;
    wire clk_out;
Clock_Divider CD(.clk(clk),.outclk(clk_out),.rst(pause));
    wire [7:0] counter_out;
    reg direction;
    reg turn;
Counter Count(.max(max),.clk(clk_out),.pause(pause|~(s1^s0)),.rst(rst),.counter(counter_out),.direction(1));


always@(posedge clk_out  or posedge pause or posedge rst) begin
if(rst!=0) begin
    state <= 3'b0;
end else
if(pause) begin
    state <= state;
end
else
if(counter_out == 0) begin
    if (s1 == 1 && s0 == 0 && pause == 0)
        case(state)
        3'b0: state <= 3'b1;
        3'b1: state <= 3'b010;
        3'b010: state <= 3'b011;
        3'b011: state <= 3'b100;
        3'b100: state <= 3'b0;
        endcase
    else
    if (s1 == 0 && s0 == 1 && pause == 0)
        case(state)
        3'b0: state <= 3'b100;
        3'b1: state <= 3'b0;
        3'b010: state <= 3'b001;
        3'b011: state <= 3'b010;
        3'b100: state <= 3'b011;
        endcase
    else
        state <= 3'b0;
        end
        
case(state)
3'b0: {l3,l2,l1,l0} = 4'b1111;
3'b1: {l3,l2,l1,l0} = 4'b0001;
3'b010: {l3,l2,l1,l0} = 4'b0010;
3'b011: {l3,l2,l1,l0} = 4'b0100;
3'b100: {l3,l2,l1,l0} = 4'b1000;
endcase
end


endmodule
