`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2023 03:48:27 PM
// Design Name: 
// Module Name: sprite_loader
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


module sprite_rotator #(parameter SPR_HEIGHT = 64,
                       parameter SPR_WIDTH = 64)
    (
    input [10:0] relative_x,
    input [9:0] relative_y,
    input [1:0] rotation,
    output reg [10:0] corrected_x,
    output reg [9:0] corrected_y
    );
    
    always @ *
    begin
        case (rotation)
        'd0: begin
                corrected_x = relative_x;
                corrected_y = relative_y;
             end
        'd1: begin
                corrected_x = relative_y;
                corrected_y = SPR_HEIGHT - 1 - relative_x;
             end
        'd2: begin
                corrected_x = SPR_WIDTH - 1 - relative_x;
                corrected_y = SPR_HEIGHT - 1 - relative_y;
             end
        'd3: begin
                corrected_x = SPR_WIDTH - 1 - relative_y;
                corrected_y = relative_x;
             end
        endcase
    end 
endmodule
