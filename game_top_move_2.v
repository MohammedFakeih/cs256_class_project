`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2023 02:43:04 PM
// Design Name: 
// Module Name: game_top
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


module game_top_move(
    input clk,
    input r0,
    input r1,
    input r2,
    input r3,
    input g0,
    input g1,
    input g2,
    input g3,
    input b0,
    input b1,
    input b2,
    input b3,
    input rst, up, down, right, left,
    output [7:0] anode,
    output [6:0] cathode,
    output [3:0] pix_r,
    output [3:0] pix_g,
    output [3:0] pix_b,
    output hsync,
    output vsync
    );
    
    wire pixclk;
    wire slower_clk;
    wire [10:0] curr_x;
    wire [9:0] curr_y;
    
    reg [16:0] clk_count, clk_count2;
    reg slowest_clk, display_clk;
    
    wire [3:0] draw_r;
    wire [3:0] draw_g;
    wire [3:0] draw_b;
    
    clk_wiz_0 cwiz
   (
    // Clock out ports
    .clk_out1(pixclk),     // output clk_out1
   // Clock in ports
    .clk_in1(clk));
    
    clk_wiz_1 cwiz1
   (
    // Clock out ports
    .clk_out1(slower_clk),     // output clk_out1
   // Clock in ports
    .clk_in1(pixclk));
    
    always @ (posedge slower_clk)
    begin
        begin
            if (clk_count == 17'd49999)
            begin
                clk_count <= 17'd0;
                slowest_clk <= ~slowest_clk;
            end
            else
                clk_count <= clk_count + 1;
            if(clk_count2 == 17'd499)
            begin
                clk_count2 <= 0;
                display_clk <= ~display_clk;
            end
            else
                clk_count2 <= clk_count2 + 1;
        end
        
    end


wire [9:0] arrow1_y, arrow2_y, arrow3_y, arrow4_y, arrow5_y, arrow6_y, arrow7_y, arrow8_y, arrow9_y, arrow10_y,
arrow11_y, arrow12_y, arrow13_y, arrow14_y, arrow15_y, arrow16_y, arrow17_y, arrow18_y, arrow19_y, arrow20_y;

wire [3:0] score_0, score_1, score_2, score_3, score_4, score_5, score_6, score_7;

wire [2:0] sprite_word;

assign score_4 = 'd0;
assign score_5 = 'd0;
assign score_6 = 'd0;
    
    // drawcon instantiation - r, g, b outputs are sent to vga_out
    //                       - draw_x, draw_y come from vga_out outputs
drawcon draw (.clk(pixclk), .arrow1_y(arrow1_y), .arrow2_y(arrow2_y), .arrow3_y(arrow3_y), .arrow4_y(arrow4_y), .arrow5_y(arrow5_y), 
.arrow6_y(arrow6_y), .arrow7_y(arrow7_y), .arrow8_y(arrow8_y), .arrow9_y(arrow9_y), .arrow10_y(arrow10_y),
.arrow11_y(arrow11_y), .arrow12_y(arrow12_y), .arrow13_y(arrow13_y), .arrow14_y(arrow14_y), .arrow15_y(arrow15_y),
.arrow16_y(arrow16_y), .arrow17_y(arrow17_y), .arrow18_y(arrow18_y), .arrow19_y(arrow19_y), .arrow20_y(arrow20_y),
.draw_x(curr_x), .draw_y(curr_y), .draw_r(draw_r), .draw_g(draw_g), .draw_b(draw_b), .sprite_word(sprite_word));
    
    // vga_out instantiation
vga_out_new vga (.clk(pixclk),
.r0(draw_r[0]), .r1(draw_r[1]), .r2(draw_r[2]), .r3(draw_r[3]), .g0(draw_g[0]), .g1(draw_g[1]), .g2(draw_g[2]), 
.g3(draw_g[3]), .b0(draw_b[0]), .b1(draw_b[1]), .b2(draw_b[2]), .b3(draw_b[3]), 
.pix_r(pix_r), .pix_g(pix_g), .pix_b(pix_b), .hsync(hsync), .vsync(vsync), .curr_x(curr_x), .curr_y(curr_y));

// game logic instantiation
game_logic logic (.clk(slowest_clk), .rst(rst), .up(up), .down(down), .right(right), .left(left),
.arrow1_y(arrow1_y), .arrow2_y(arrow2_y), .arrow3_y(arrow3_y), .arrow4_y(arrow4_y), .arrow5_y(arrow5_y),
.arrow6_y(arrow6_y), .arrow7_y(arrow7_y), .arrow8_y(arrow8_y), .arrow9_y(arrow9_y), .arrow10_y(arrow10_y),
.arrow11_y(arrow11_y), .arrow12_y(arrow12_y), .arrow13_y(arrow13_y), .arrow14_y(arrow14_y), .arrow15_y(arrow15_y),
.arrow16_y(arrow16_y), .arrow17_y(arrow17_y), .arrow18_y(arrow18_y), .arrow19_y(arrow19_y), .arrow20_y(arrow20_y), 
.score_1(score_0), .score_10(score_1), .score_100(score_2), .score_1000(score_3), .score_letter(score_7),
.sprite_word(sprite_word));

// LED display
LED_display LED (.clk(display_clk), .dig0(score_0), .dig1(score_1), .dig2(score_2), .dig3(score_3), .dig4(score_4),
.dig5(score_5), .dig6(score_6), .dig7(score_7), .anode(anode), .cathode(cathode));
    
    
endmodule
