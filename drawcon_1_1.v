`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2023 01:24:11 PM
// Design Name: 
// Module Name: drawcon
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


module drawcon(
    input [9:0] arrow1_y, arrow2_y, arrow3_y, arrow4_y, arrow5_y, arrow6_y, arrow7_y, arrow8_y, arrow9_y, arrow10_y,
arrow11_y, arrow12_y, arrow13_y, arrow14_y, arrow15_y, arrow16_y, arrow17_y, arrow18_y, arrow19_y, arrow20_y,
    input [10:0] draw_x,
    input [9:0] draw_y,
    input clk,
    input [2:0] sprite_word,
    output reg [3:0] draw_r,
    output reg [3:0] draw_g,
    output reg [3:0] draw_b
    );
    
    reg [3:0] bg_r, bg_g, bg_b;
    
     // Background color assignment
    always @ *
    begin
        bg_r = 4'b1111;
        bg_g = 4'b1111;
        bg_b = 4'b1111;
    end
    
    reg [10:0] future_x;
    reg [9:0] future_y;
    
    always @ *
    begin
        if (draw_x + 'd2 > 'd1279)
        begin
            future_x = draw_x + 2 - 1279;
            if (draw_y == 10'd799)
                future_y = 0;
            else
                future_y = draw_y + 1;
        end
        else
            future_x = draw_x + 2;
    end
    
    reg [10:0] sprite_x;
    reg [9:0] sprite_y;
    reg [10:0] word_sprite_x;
    reg [9:0] word_sprite_y;
    reg [1:0] rotation;
    wire [11:0] sprite_addr;
    wire [11:0] arrow_color;
    wire [11:0] placeholder_color;
    wire [14:0] word_sprite_addr;
    wire [11:0] miss_color;
    wire [11:0] bad_color;
    wire [11:0] good_color;
    wire [11:0] great_color;
    wire [11:0] perfect_color;
    wire [10:0] corrected_x;
    wire [9:0] corrected_y;
    
    always @ *
    begin
        sprite_x = 11'd0;
        sprite_y = 10'd0;
        word_sprite_x = 11'd0;
        word_sprite_y = 10'd0;
        rotation = 0;
        
        // left arrow lane:
        if (future_x >= 11'd200 && future_x <= 11'd263)
        begin
            rotation = 3;
            if (future_y >= arrow1_y && future_y <= arrow1_y + 10'd63)
            begin
                sprite_x = future_x - 11'd200;
                sprite_y = future_y - arrow1_y;
            end
            else if (future_y >= arrow2_y && future_y <= arrow2_y + 10'd63)
            begin
                sprite_x = future_x - 11'd200;
                sprite_y = future_y - arrow2_y;
            end
            else if (future_y >= arrow3_y && future_y <= arrow3_y + 10'd63)
            begin
                sprite_x = future_x - 11'd200;
                sprite_y = future_y - arrow3_y;
            end
            else if (future_y >= arrow4_y && future_y <= arrow4_y + 10'd63)
            begin
                sprite_x = future_x - 11'd200;
                sprite_y = future_y - arrow4_y;
            end
            else if (future_y >= arrow5_y && future_y <= arrow5_y + 10'd63)
            begin
                sprite_x = future_x - 11'd200;
                sprite_y = future_y - arrow5_y;
            end
            else if (future_y >= 'd70 && future_y <= 'd133)
            begin
                sprite_x = future_x - 11'd200;
                sprite_y = future_y - 11'd70;
            end
        end
        
        // up arrow lane:
        else if (future_x >= 11'd283 && future_x <= 11'd346)
        begin
            rotation = 0;
            if (future_y >= arrow6_y && future_y <= arrow6_y + 10'd63)
            begin
                sprite_x = future_x - 11'd283;
                sprite_y = future_y - arrow6_y;
            end
            else if (future_y >= arrow7_y && future_y <= arrow7_y + 10'd63)
            begin
                sprite_x = future_x - 11'd283;
                sprite_y = future_y - arrow7_y;
            end
            else if (future_y >= arrow8_y && future_y <= arrow8_y + 10'd63)
            begin
                sprite_x = future_x - 11'd283;
                sprite_y = future_y - arrow8_y;
            end
            else if (future_y >= arrow9_y && future_y <= arrow9_y + 10'd63)
            begin
                sprite_x = future_x - 11'd283;
                sprite_y = future_y - arrow9_y;
            end
            else if (future_y >= arrow10_y && future_y <= arrow10_y + 10'd63)
            begin
                sprite_x = future_x - 11'd283;
                sprite_y = future_y - arrow10_y;
            end
            else if (future_y >= 'd70 && future_y <= 'd133)
            begin
                sprite_x = future_x - 11'd283;
                sprite_y = future_y - 11'd70;
            end
        end
        
        // down arrow lane:
        else if (future_x >= 11'd366 && future_x <= 11'd429)
        begin
            rotation = 2;
            if (future_y >= arrow11_y && future_y <= arrow11_y + 10'd63)
            begin
                sprite_x = future_x - 11'd366;
                sprite_y = future_y - arrow11_y;
            end
            else if (future_y >= arrow12_y && future_y <= arrow12_y + 10'd63)
            begin
                sprite_x = future_x - 11'd366;
                sprite_y = future_y - arrow12_y;
            end
            else if (future_y >= arrow13_y && future_y <= arrow13_y + 10'd63)
            begin
                sprite_x = future_x - 11'd366;
                sprite_y = future_y - arrow13_y;
            end
            else if (future_y >= arrow14_y && future_y <= arrow14_y + 10'd63)
            begin
                sprite_x = future_x - 11'd366;
                sprite_y = future_y - arrow14_y;
            end
            else if (future_y >= arrow15_y && future_y <= arrow15_y + 10'd63)
            begin
                sprite_x = future_x - 11'd366;
                sprite_y = future_y - arrow15_y;
            end
            else if (future_y >= 'd70 && future_y <= 'd133)
            begin
                sprite_x = future_x - 11'd366;
                sprite_y = future_y - 11'd70;
            end
        end
        
        // right arrow lane:
        else if (future_x >= 11'd449 && future_x <= 11'd512)
        begin
            rotation = 1;
            if (future_y >= arrow16_y && future_y <= arrow16_y + 10'd63)
            begin
                sprite_x = future_x - 11'd449;
                sprite_y = future_y - arrow16_y;
            end
            else if (future_y >= arrow17_y && future_y <= arrow17_y + 10'd63)
            begin
                sprite_x = future_x - 11'd449;
                sprite_y = future_y - arrow17_y;
            end
            else if (future_y >= arrow18_y && future_y <= arrow18_y + 10'd63)
            begin
                sprite_x = future_x - 11'd449;
                sprite_y = future_y - arrow18_y;
            end
            else if (future_y >= arrow19_y && future_y <= arrow19_y + 10'd63)
            begin
                sprite_x = future_x - 11'd449;
                sprite_y = future_y - arrow19_y;
            end
            else if (future_y >= arrow20_y && future_y <= arrow20_y + 10'd63)
            begin
                sprite_x = future_x - 11'd449;
                sprite_y = future_y - arrow20_y;
            end
            else if (future_y >= 'd70 && future_y <= 'd133)
            begin
                sprite_x = future_x - 11'd449;
                sprite_y = future_y - 11'd70;
            end
        end
        
        // sprite word area
        else if (future_x >= 11'd600 && future_x <= 11'd899 &&
                 future_y >= 10'd399 && future_y <= 10'd462)
        begin
            word_sprite_x = future_x - 11'd600;
            word_sprite_y = future_y - 10'd399;
        end
    end
    
    
    sprite_rotator sl (.rotation(rotation), .relative_x(sprite_x), .relative_y(sprite_y), .corrected_x(corrected_x), 
    .corrected_y(corrected_y));
    
    assign sprite_addr = corrected_x + corrected_y * 64;
    assign word_sprite_addr = word_sprite_x + word_sprite_y * 300;
    
    // Arrow sprites
    arrow_sprite arrow1 (.clka(clk), .addra(sprite_addr), .douta(arrow_color));
    placeholder_sprite arrow_place (.clka(clk), .addra(sprite_addr), .douta(placeholder_color));
    
    // Word sprites
    miss_sprite miss (.clka(clk), .addra(word_sprite_addr), .douta(miss_color));
    bad_sprite bad (.clka(clk), .addra(word_sprite_addr), .douta(bad_color));
    good_sprite good (.clka(clk), .addra(word_sprite_addr), .douta(good_color));
    great_sprite great (.clka(clk), .addra(word_sprite_addr), .douta(great_color));
    perfect_sprite perfect (.clka(clk), .addra(word_sprite_addr), .douta(perfect_color));
    
    always @ *
    begin
    
    // left arrow lane:
    if (draw_x >= 11'd200 && draw_x <= 11'd263)
        begin
            if (draw_y >= arrow1_y && draw_y <= arrow1_y + 10'd63 ||
                draw_y >= arrow2_y && draw_y <= arrow2_y + 10'd63 ||
                draw_y >= arrow3_y && draw_y <= arrow3_y + 10'd63 ||
                draw_y >= arrow4_y && draw_y <= arrow4_y + 10'd63 ||
                draw_y >= arrow5_y && draw_y <= arrow5_y + 10'd63)
            begin
                if (arrow_color == 12'b000011110000)
                begin
                    if (draw_y >= 'd70 && draw_y <= 'd133)
                    begin
                        if(placeholder_color == 12'b000011110000) begin
                            draw_r = bg_r;
                            draw_g = bg_g;
                            draw_b = bg_b; end
                        else begin
                        draw_r = placeholder_color[11:8];
                        draw_g = placeholder_color[7:4];
                        draw_b = placeholder_color[3:0]; end
                    end
                    else
                    begin
                        draw_r = bg_r;
                        draw_g = bg_g;
                        draw_b = bg_b;
                    end
                end
                else
                begin
                    draw_r = arrow_color[11:8];
                    draw_g = arrow_color[7:4];
                    draw_b = arrow_color[3:0];
                end
            end
            else if (draw_y >= 'd70 && draw_y <= 'd133)
            begin
                if (placeholder_color == 12'b000011110000)
                begin
                    draw_r = bg_r;
                    draw_g = bg_g;
                    draw_b = bg_b;
                end
                else
                begin
                    draw_r = placeholder_color[11:8];
                    draw_g = placeholder_color[7:4];
                    draw_b = placeholder_color[3:0];
                end
            end
            else
            begin
                draw_r = bg_r;
                draw_g = bg_g;
                draw_b = bg_b;
            end
        end
    
    // up arrow lane:
    else if (draw_x >= 11'd283 && draw_x <= 11'd346)
        begin
            if (draw_y >= arrow6_y && draw_y <= arrow6_y + 10'd63 ||
                draw_y >= arrow7_y && draw_y <= arrow7_y + 10'd63 ||
                draw_y >= arrow8_y && draw_y <= arrow8_y + 10'd63 ||
                draw_y >= arrow9_y && draw_y <= arrow9_y + 10'd63 ||
                draw_y >= arrow10_y && draw_y <= arrow10_y + 10'd63)
            begin
                if (arrow_color == 12'b000011110000)
                begin
                    if (draw_y >= 'd70 && draw_y <= 'd133)
                    begin
                    if(placeholder_color == 12'b000011110000) begin
                            draw_r = bg_r;
                            draw_g = bg_g;
                            draw_b = bg_b; end
                        else begin
                        draw_r = placeholder_color[11:8];
                        draw_g = placeholder_color[7:4];
                        draw_b = placeholder_color[3:0]; end
                    end
                    else
                    begin
                        draw_r = bg_r;
                        draw_g = bg_g;
                        draw_b = bg_b;
                    end
                end
                else
                begin
                    draw_r = arrow_color[11:8];
                    draw_g = arrow_color[7:4];
                    draw_b = arrow_color[3:0];
                end
            end
            else if (draw_y >= 'd70 && draw_y <= 'd133)
            begin
                if (placeholder_color == 12'b000011110000)
                begin
                    draw_r = bg_r;
                    draw_g = bg_g;
                    draw_b = bg_b;
                end
                else
                begin
                    draw_r = placeholder_color[11:8];
                    draw_g = placeholder_color[7:4];
                    draw_b = placeholder_color[3:0];
                end
            end
            else
            begin
                draw_r = bg_r;
                draw_g = bg_g;
                draw_b = bg_b;
            end
        end
        
        // down arrow lane:
    else if (draw_x >= 11'd366 && draw_x <= 11'd429)
        begin
            if (draw_y >= arrow11_y && draw_y <= arrow11_y + 10'd63 ||
                draw_y >= arrow12_y && draw_y <= arrow12_y + 10'd63 ||
                draw_y >= arrow13_y && draw_y <= arrow13_y + 10'd63 ||
                draw_y >= arrow14_y && draw_y <= arrow14_y + 10'd63 ||
                draw_y >= arrow15_y && draw_y <= arrow15_y + 10'd63)
            begin
                if (arrow_color == 12'b000011110000)
                begin
                    if (draw_y >= 'd70 && draw_y <= 'd133)
                    begin
                    if(placeholder_color == 12'b000011110000) begin
                            draw_r = bg_r;
                            draw_g = bg_g;
                            draw_b = bg_b; end
                        else begin
                        draw_r = placeholder_color[11:8];
                        draw_g = placeholder_color[7:4];
                        draw_b = placeholder_color[3:0]; end
                    end
                    else
                    begin
                        draw_r = bg_r;
                        draw_g = bg_g;
                        draw_b = bg_b;
                    end
                end
                else
                begin
                    draw_r = arrow_color[11:8];
                    draw_g = arrow_color[7:4];
                    draw_b = arrow_color[3:0];
                end
            end
            else if (draw_y >= 'd70 && draw_y <= 'd133)
            begin
                if (placeholder_color == 12'b000011110000)
                begin
                    draw_r = bg_r;
                    draw_g = bg_g;
                    draw_b = bg_b;
                end
                else
                begin
                    draw_r = placeholder_color[11:8];
                    draw_g = placeholder_color[7:4];
                    draw_b = placeholder_color[3:0];
                end
            end
            else
            begin
                draw_r = bg_r;
                draw_g = bg_g;
                draw_b = bg_b;
            end
        end
        
        // right arrow lane:
    else if (draw_x >= 11'd449 && draw_x <= 11'd512)
        begin
            if (draw_y >= arrow16_y && draw_y <= arrow16_y + 10'd63 ||
                draw_y >= arrow17_y && draw_y <= arrow17_y + 10'd63 ||
                draw_y >= arrow18_y && draw_y <= arrow18_y + 10'd63 ||
                draw_y >= arrow19_y && draw_y <= arrow19_y + 10'd63 ||
                draw_y >= arrow20_y && draw_y <= arrow20_y + 10'd63)
            begin
                if (arrow_color == 12'b000011110000)
                begin
                    if (draw_y >= 'd70 && draw_y <= 'd133)
                    begin
                    if(placeholder_color == 12'b000011110000) begin
                            draw_r = bg_r;
                            draw_g = bg_g;
                            draw_b = bg_b; end
                        else begin
                        draw_r = placeholder_color[11:8];
                        draw_g = placeholder_color[7:4];
                        draw_b = placeholder_color[3:0]; end
                    end
                    else
                    begin
                        draw_r = bg_r;
                        draw_g = bg_g;
                        draw_b = bg_b;
                    end
                end
                else
                begin
                    draw_r = arrow_color[11:8];
                    draw_g = arrow_color[7:4];
                    draw_b = arrow_color[3:0];
                end
            end
            else if (draw_y >= 'd70 && draw_y <= 'd133)
            begin
                if (placeholder_color == 12'b000011110000)
                begin
                    draw_r = bg_r;
                    draw_g = bg_g;
                    draw_b = bg_b;
                end
                else
                begin
                    draw_r = placeholder_color[11:8];
                    draw_g = placeholder_color[7:4];
                    draw_b = placeholder_color[3:0];
                end
            end
            else
            begin
                draw_r = bg_r;
                draw_g = bg_g;
                draw_b = bg_b;
            end
        end
    else if (draw_x >= 11'd600 && draw_x <= 11'd899 &&
             draw_y >= 10'd399 && draw_y <= 10'd462)
    begin
        if (sprite_word == 1 && miss_color != 12'b000011110000)
        begin
            draw_r = miss_color[11:8];
            draw_g = miss_color[7:4];
            draw_b = miss_color[3:0];
        end
        else if (sprite_word == 2 && bad_color != 12'b000011110000)
        begin
            draw_r = bad_color[11:8];
            draw_g = bad_color[7:4];
            draw_b = bad_color[3:0];
        end
        else if (sprite_word == 3 && good_color != 12'b000011110000)
        begin
            draw_r = good_color[11:8];
            draw_g = good_color[7:4];
            draw_b = good_color[3:0];
        end
        else if (sprite_word == 4 && great_color != 12'b000011110000)
        begin
            draw_r = great_color[11:8];
            draw_g = great_color[7:4];
            draw_b = great_color[3:0];
        end
        else if (sprite_word == 5 && perfect_color != 12'b000011110000)
        begin
            draw_r = perfect_color[11:8];
            draw_g = perfect_color[7:4];
            draw_b = perfect_color[3:0];
        end
        else
        begin
            draw_r = bg_r;
            draw_g = bg_g;
            draw_b = bg_b;
        end
    end
    else
        begin
            draw_r = bg_r;
            draw_g = bg_g;
            draw_b = bg_b;
        end
    end
    
endmodule
