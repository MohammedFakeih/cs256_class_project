`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2023 02:46:46 PM
// Design Name: 
// Module Name: LED_display
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


module LED_display(input clk, input [3:0] dig0, dig1, dig2, dig3, dig4, dig5, dig6, dig7, 
output reg [7:0] anode = 0, output reg [6:0] cathode = 0);

reg [2:0] refresh_counter = 0;
reg [3:0] passed_digit = 0;

always@(posedge clk)
begin
    refresh_counter <= refresh_counter + 1;
end

always@*
begin 
    case(refresh_counter)
        3'b000: begin
            anode = 8'b11111110; // digit 0 ON // fix values for anodes
            passed_digit = dig0; end // digit 0 value 
        3'b001: begin
            anode = 8'b11111101; // digit 1 ON
            passed_digit = dig1; end // digit 1 value
        3'b010: begin
            anode = 8'b11111011; // digit 2 ON
            passed_digit = dig2; end // digit 2 value
        3'b011: begin
            anode = 8'b11110111; // digit 3 ON
            passed_digit = dig3; end // digit 3 value
        3'b100: begin
            anode = 8'b11101111; // digit 4 ON
            passed_digit = dig4; end // digit 4 value
        3'b101: begin
            anode = 8'b11011111; // digit 5 ON
            passed_digit = dig5; end // digit 5 value
        3'b110: begin
            anode = 8'b10111111; // digit 6 ON
            passed_digit = dig6; end // digit 6 value
        3'b111: begin
            anode = 8'b01111111; // digit 7 ON
            passed_digit = dig7; end // digit 7 value
        endcase
        
    case(passed_digit)
        4'd0:
            cathode = 7'b1000000; // zero
        4'd1:
            cathode = 7'b1111001; // one
        4'd2:
            cathode = 7'b0100100; // two
        4'd3:
            cathode = 7'b0110000; // three
        4'd4:
            cathode = 7'b0011001; // four
        4'd5:
            cathode = 7'b0010010; // five
        4'd6:
            cathode = 7'b0000010; // six
        4'd7:
            cathode = 7'b1111000; // seven
        4'd8:
            cathode = 7'b0000000; // eight
        4'd9:
            cathode = 7'b0010000; // nine
        4'd10:
            cathode = 7'b0001000; // A
        4'd11:
            cathode = 7'b0000011; // b
        4'd12:
            cathode = 7'b1000110; // C
        4'd13:
            cathode = 7'b0100001; // d
        4'd14:
            cathode = 7'b0000110; // E
        4'd15:
            cathode = 7'b0001110; // F
   endcase
        
end

endmodule
