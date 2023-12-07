`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2023 05:13:24 PM
// Design Name: 
// Module Name: game_logic
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


module game_logic (input clk, rst, up, right, left, down,
output reg [9:0] arrow1_y, arrow2_y, arrow3_y, arrow4_y, arrow5_y, arrow6_y, arrow7_y, arrow8_y, arrow9_y, arrow10_y,
arrow11_y, arrow12_y, arrow13_y, arrow14_y, arrow15_y, arrow16_y, arrow17_y, arrow18_y, arrow19_y, arrow20_y,
output reg [3:0] score_1, score_10, score_100, score_1000, score_letter, output reg [2:0] sprite_word);

reg [12:0] arrow1, arrow2, arrow3, arrow4, arrow5, arrow6, arrow7, arrow8, arrow9, arrow10,
arrow11, arrow12, arrow13, arrow14, arrow15, arrow16, arrow17, arrow18, arrow19, arrow20;
reg [12:0] frame_count = 0;

reg [2:0] current_sprite_word, last_sprite_word;
reg [6:0] sprite_counter;

always @(posedge clk)
begin
    if(!rst && frame_count == 0) begin
        arrow1 <= 900; // just need to exceed number of frames in the game
        arrow2 <= 900;
        arrow3 <= 900;
        arrow4 <= 900;
        arrow5 <= 900;
        frame_count <= 0; end
    else begin
        frame_count <= frame_count + 1;
        
        // start frame = 331
        // max frame = ~ 4900
        
        // frames to display arrows at:
        
     // 331, 351, 371, 413, 433, 453, 497, 511, 525, 543, 557, 612, 622, 632, 664, 686, 696, 706, 738, 760, 780, 800, 
  // 820, 840, 860, 938, 958, 978, 1010, 1030, 1050, 1094, 1108, 1122, 1140, 1154, 1211, 1221, 1231, 1263, 1285, 1295,
  // 1305, 1337, 1359, 1379, 1399, 1419, 1439, 1459, 1519, 1539, 1559, 1579, 1599, 1619, 1639, 1659, 1679,
  // 1699, 1719, 1739, 1759, 1779, 1799, 1819, 1839, 1859, 1879, 1899, 1919, 1939, 1959, 1979, 1999, 2019,
  // 2039, 2059, 2079, 2099, 2119, 2169, 2185, 2201, 2217, 2233, 2249, 2265, 2315, 2331, 2347, 2363, 2379,
  // 2395, 2411, 2461, 2477, 2493, 2509, 2525, 2541, 2557, 2607, 2627, 2647, 2667, 2687, 2707, 2727, 2747, 
  // 2767, 2787, 2807, 2827, 2847, 2867, 2887, 2907, 2927, 2947, 2967, 2987, 3007, 3027, 3047, 3067, 3087,
  // 3107, 3127, 3147, 3167, 3187, 3207, 3233, 3253, 3273, 3373, 3413, 3453, 3473, 3519, 3533, 3547, 3565,
  // 3579, 3632, 3642, 3652, 3684, 3706, 3716, 3726, 3758, 3780, 3800, 3820, 3840, 3860, 3880 3956, 3996,
  // 4036, 4056, 4102, 4120, 4136, 4156, 4172, 4217, 4227, 4237, 4269, 4291, 4301, 4311, 4343, 4365, 4385,
  // 4405, 4425, 4445, 4465, 4525, 4535, 4545, 4577, 4599, 4609, 4619, 4651, 4673, 4693, 4713, 4733, 4753, 
  // 4773, 4833 (lab 197)



       
        
        // left arrows
        if (frame_count == 331 || frame_count == 371 || frame_count == 511 || frame_count == 525 || frame_count == 612 
        || frame_count == 738 || frame_count == 760 || frame_count == 938 || frame_count == 978 || frame_count == 1094
        || frame_count == 1140 || frame_count == 1154 || frame_count == 1211 || frame_count == 1337 || frame_count == 1379
        || frame_count == 1439 || frame_count == 1459 || frame_count == 1519 || frame_count == 1639 || frame_count == 1759
        || frame_count == 1779 || frame_count == 1859 || frame_count == 1919 || frame_count == 1959 || frame_count == 1979
        || frame_count == 1999 || frame_count == 2169 || frame_count == 2249 || frame_count == 2347 || frame_count == 2557
        || frame_count == 2607 || frame_count == 2647 || frame_count == 2727 || frame_count == 2807 || frame_count == 2867
        || frame_count == 2907 || frame_count == 3007 || frame_count == 3047 || frame_count == 3167 || frame_count == 3207
        || frame_count == 3373 || frame_count == 3473 || frame_count == 3533 || frame_count == 3547 || frame_count == 3632
        || frame_count == 3758 || frame_count == 3780 || frame_count == 3956 || frame_count == 4056 || frame_count == 4102
        || frame_count == 4156 || frame_count == 4172 || frame_count == 4217 || frame_count == 4343 || frame_count == 4385
        || frame_count == 4445 || frame_count == 4465 || frame_count == 4545 || frame_count == 4651 || frame_count == 4673
        || frame_count == 4833) 
        begin
            arrow1 <= frame_count;
            arrow2 <= arrow1;
            arrow3 <= arrow2;
            arrow4 <= arrow3;
            arrow5 <= arrow4; end
        
        // up arrows
        if (frame_count == 351 || frame_count == 497 || frame_count == 525 || frame_count == 622 || frame_count == 706 
        || frame_count == 738 || frame_count == 800 || frame_count == 958 || frame_count == 1108 || frame_count == 1140
        || frame_count == 1221 || frame_count == 1305 || frame_count == 1337 || frame_count == 1419 || frame_count == 1539
        || frame_count == 1599 || frame_count == 1719 || frame_count == 1819 || frame_count == 2019 || frame_count == 2079
        || frame_count == 2185 || frame_count == 2233 || frame_count == 2265 || frame_count == 2363 || frame_count == 2461
        || frame_count == 2493 || frame_count == 2525 || frame_count == 2687 || frame_count == 2747 || frame_count == 2847
        || frame_count == 2887 || frame_count == 2947 || frame_count == 2967 || frame_count == 3047 || frame_count == 3147
        || frame_count == 3187 || frame_count == 3233 || frame_count == 3273 || frame_count == 3373 || frame_count == 3453
        || frame_count == 3519 || frame_count == 3547 || frame_count == 3642 || frame_count == 3726 || frame_count == 3758
         || frame_count == 3820 || frame_count == 3956 || frame_count == 4036 || frame_count == 4120 || frame_count == 4156
         || frame_count == 4227 || frame_count == 4311 || frame_count == 4343 || frame_count == 4425 || frame_count == 4525
         || frame_count == 4609 || frame_count == 4713 || frame_count == 4773) 
        begin
            arrow6 <= frame_count;
            arrow7 <= arrow6;
            arrow8 <= arrow7;
            arrow9 <= arrow8;
            arrow10 <= arrow9; end
        
        // down arrows     
        if (frame_count == 433 || frame_count == 497 || frame_count == 543 || frame_count == 632 || frame_count == 664 
        || frame_count == 696 || frame_count == 820 || frame_count == 1030 || frame_count == 1108 || frame_count == 1122
        || frame_count == 1231 || frame_count == 1263 || frame_count == 1295 || frame_count == 1399 || frame_count == 1559
        || frame_count == 1619 || frame_count == 1739 || frame_count == 1799 || frame_count == 2039 || frame_count == 2099
        || frame_count == 2217 || frame_count == 2331 || frame_count == 2379 || frame_count == 2411 || frame_count == 2477
        || frame_count == 2509 || frame_count == 2541 || frame_count == 2667 || frame_count == 2767 || frame_count == 2827
        || frame_count == 2887 || frame_count == 2967 || frame_count == 3027 || frame_count == 3067 || frame_count == 3107
        || frame_count == 3127 || frame_count == 3253 || frame_count == 3273 || frame_count == 3413 || frame_count == 3453
        || frame_count == 3519 || frame_count == 3565 || frame_count == 3652 || frame_count == 3684 || frame_count == 3716
        || frame_count == 3840 || frame_count == 3996 || frame_count == 4036 || frame_count == 4120 || frame_count == 4136
        || frame_count == 4237 || frame_count == 4269 || frame_count == 4301 || frame_count == 4405 || frame_count == 4535
        || frame_count == 4599 || frame_count == 4733 || frame_count == 4753) 
        begin
            arrow11 <= frame_count;
            arrow12 <= arrow11;
            arrow13 <= arrow12;
            arrow14 <= arrow13;
            arrow15 <= arrow14; end 
        
        // right arrows   
        if (frame_count == 413 || frame_count == 453 || frame_count == 511 || frame_count == 543 || frame_count == 557 || 
        frame_count == 664 || frame_count == 686 || frame_count == 780 || frame_count == 840 || frame_count == 860 || 
        frame_count == 1010 || frame_count == 1050 || frame_count == 1094 || frame_count == 1122 || frame_count == 1263 || 
        frame_count == 1285 || frame_count == 1359 || frame_count == 1579 || frame_count == 1659 || frame_count == 1679
        || frame_count == 1699 || frame_count == 1839 || frame_count == 1879 || frame_count == 1899 || frame_count == 1939
        || frame_count == 2059 || frame_count == 2119 || frame_count == 2201 || frame_count == 2315 || frame_count == 2395
        || frame_count == 2627 || frame_count == 2747 || frame_count == 2727 || frame_count == 2787 || frame_count == 2807
        || frame_count == 2927 || frame_count == 2987 || frame_count == 3087 || frame_count == 3127 || frame_count == 3207
        || frame_count == 3413 || frame_count == 3473 || frame_count == 3533 || frame_count == 3565 || frame_count == 3579
        || frame_count == 3684 || frame_count == 3706 || frame_count == 3800 || frame_count == 3860 || frame_count == 3880
        || frame_count == 3996 || frame_count == 4056 || frame_count == 4102 || frame_count == 4136 || frame_count == 4291
        || frame_count == 4269 || frame_count == 4291 || frame_count == 4365 || frame_count == 4577 || frame_count == 4619
        || frame_count == 4693 || frame_count == 4833) 
        begin
            arrow16 <= frame_count;
            arrow17 <= arrow16;
            arrow18 <= arrow17;
            arrow19 <= arrow18;
            arrow20 <= arrow19; end
        end
    
    // sensing for left arrows
    
    // arrow 5 sensing:
    if(arrow5_y != 10'd900 && arrow5_y <= 'd133 && arrow5_y >= 'd6) begin // sensing begin
        if(left == 'd1 && ((arrow5_y <= 'd133 && arrow5_y > 'd117)||(arrow5_y <= 'd22 && arrow5_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow5 <= 900; // remove arrow
            current_sprite_word <= 'd2; end // 'bad' sprite
        else if(left == 'd1 && ((arrow5_y <= 'd117 && arrow5_y > 'd101)||(arrow5_y <= 'd38 && arrow5_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow5 <= 900; // remove arrow
    current_sprite_word <= 'd3; end// 'good' sprite
        else if(left == 'd1 && ((arrow5_y <= 'd101 && arrow5_y > 'd85)||(arrow5_y <= 'd54 && arrow5_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow5 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(left == 'd1 && (arrow5_y <= 'd85 && arrow5_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow5 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite
            
    // arrow4 sensing:
    else if(arrow4_y != 10'd900 && arrow4_y <= 'd133 && arrow4_y >= 'd6) begin // sensing begin
        if(left == 'd1 && ((arrow4_y <= 'd133 && arrow4_y > 'd117)||(arrow4_y <= 'd22 && arrow4_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow4 <= 900; // remove arrow
            current_sprite_word <= 'd2; end // 'bad' sprite
        else if(left == 'd1 && ((arrow4_y <= 'd117 && arrow4_y > 'd101)||(arrow4_y <= 'd38 && arrow4_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow4 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(left == 'd1 && ((arrow4_y <= 'd101 && arrow4_y > 'd85)||(arrow4_y <= 'd54 && arrow4_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow4 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(left == 'd1 && (arrow4_y <= 'd85 && arrow4_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow4 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite  
          
    // arrow3 sensing:
    else if(arrow3_y != 10'd900 && arrow3_y <= 'd133 && arrow3_y >= 'd6) begin // sensing begin
        if(left == 'd1 && ((arrow3_y <= 'd133 && arrow3_y > 'd117)||(arrow3_y <= 'd22 && arrow3_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow3 <= 900; // remove arrow
            current_sprite_word <= 'd2; end// 'bad' sprite
        else if(left == 'd1 && ((arrow3_y <= 'd117 && arrow3_y > 'd101)||(arrow3_y <= 'd38 && arrow3_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow3 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(left == 'd1 && ((arrow3_y <= 'd101 && arrow3_y > 'd85)||(arrow3_y <= 'd54 && arrow3_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow3 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(left == 'd1 && (arrow3_y <= 'd85 && arrow3_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow3 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite  
            
    // arrow2 sensing:
    else if(arrow2_y != 10'd900 && arrow2_y <= 'd133 && arrow2_y >= 'd6) begin // sensing begin
        if(left == 'd1 && ((arrow2_y <= 'd133 && arrow2_y > 'd117)||(arrow2_y <= 'd22 && arrow2_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow2 <= 900; // remove arrow
            current_sprite_word <= 'd2; end// 'bad' sprite
        else if(left == 'd1 && ((arrow2_y <= 'd117 && arrow2_y > 'd101)||(arrow2_y <= 'd38 && arrow2_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow2 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(left == 'd1 && ((arrow2_y <= 'd101 && arrow2_y > 'd85)||(arrow2_y <= 'd54 && arrow2_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow2 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(left == 'd1 && (arrow2_y <= 'd85 && arrow2_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow2 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite  
                
    // arrow1 sensing:
    else if(arrow1_y != 10'd900 && arrow1_y <= 'd133 && arrow1_y >= 'd6) begin // sensing begin
        if(left == 'd1 && ((arrow1_y <= 'd133 && arrow1_y > 'd117)||(arrow1_y <= 'd22 && arrow1_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow1 <= 900; // remove arrow
            current_sprite_word <= 'd2; end// 'bad' sprite
        else if(left == 'd1 && ((arrow1_y <= 'd117 && arrow1_y > 'd101)||(arrow1_y <= 'd38 && arrow1_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow1 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(left == 'd1 && ((arrow1_y <= 'd101 && arrow1_y > 'd85)||(arrow1_y <= 'd54 && arrow1_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow1 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(left == 'd1 && (arrow1_y <= 'd85 && arrow1_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow1 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end // 'perfect' sprite
    
    // missed arrows:
    if(arrow5_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
//    if(arrow5_y < 'd0)
//        arrow5 <= 900; // remove arrow at top of screen
    if(arrow4_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
//    if(arrow4_y < 'd0)
//        arrow4 <= 900; // remove arrow at top of screen
    if(arrow3_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
//    if(arrow3_y < 'd0)
//        arrow3 <= 900; // remove arrow at top of screen
    if(arrow2_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
//    if(arrow2_y < 'd0)
//        arrow2 <= 900; // remove arrow at top of screen
    if(arrow1_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
//    if(arrow1_y < 'd0)
//        arrow1 <= 900; // remove arrow at top of screen
    
    // sensing for up arrows
    
    // arrow 10 sensing:
    if(arrow10_y != 10'd900 && arrow10_y <= 'd133 && arrow10_y >= 'd6) begin // sensing begin
        if(up == 'd1 && ((arrow10_y <= 'd133 && arrow10_y > 'd117)||(arrow10_y <= 'd22 && arrow10_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow10 <= 900; // remove arrow
            current_sprite_word <= 'd2; end // 'bad' sprite
        else if(up == 'd1 && ((arrow10_y <= 'd117 && arrow10_y > 'd101)||(arrow10_y <= 'd38 && arrow10_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow10 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(up == 'd1 && ((arrow10_y <= 'd101 && arrow10_y > 'd85)||(arrow10_y <= 'd54 && arrow10_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow10 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(up == 'd1 && (arrow10_y <= 'd85 && arrow10_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow10 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite
            
    // arrow9 sensing:
    else if(arrow9_y != 10'd900 && arrow9_y <= 'd133 && arrow9_y >= 'd6) begin // sensing begin
        if(up == 'd1 && ((arrow9_y <= 'd133 && arrow9_y > 'd117)||(arrow9_y <= 'd22 && arrow9_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow9 <= 900; // remove arrow
            current_sprite_word <= 'd2; end // 'bad' sprite
        else if(up == 'd1 && ((arrow9_y <= 'd117 && arrow9_y > 'd101)||(arrow9_y <= 'd38 && arrow9_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow9 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(up == 'd1 && ((arrow9_y <= 'd101 && arrow9_y > 'd85)||(arrow9_y <= 'd54 && arrow9_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow9 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(up == 'd1 && (arrow9_y <= 'd85 && arrow9_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow9 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite  
          
    // arrow8 sensing:
    else if(arrow8_y != 10'd900 && arrow8_y <= 'd133 && arrow8_y >= 'd6) begin // sensing begin
        if(up == 'd1 && ((arrow8_y <= 'd133 && arrow8_y > 'd117)||(arrow8_y <= 'd22 && arrow8_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow8 <= 900; // remove arrow
            current_sprite_word <= 'd2; end// 'bad' sprite
        else if(up == 'd1 && ((arrow8_y <= 'd117 && arrow8_y > 'd101)||(arrow8_y <= 'd38 && arrow8_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow8 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(up == 'd1 && ((arrow8_y <= 'd101 && arrow8_y > 'd85)||(arrow8_y <= 'd54 && arrow8_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow8 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(up == 'd1 && (arrow8_y <= 'd85 && arrow8_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow8 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite  
            
    // arrow7 sensing:
    else if(arrow7_y != 10'd900 && arrow7_y <= 'd133 && arrow7_y >= 'd6) begin // sensing begin
        if(up == 'd1 && ((arrow7_y <= 'd133 && arrow7_y > 'd117)||(arrow7_y <= 'd22 && arrow7_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow7 <= 900; // remove arrow
            current_sprite_word <= 'd2; end// 'bad' sprite
        else if(up == 'd1 && ((arrow7_y <= 'd117 && arrow7_y > 'd101)||(arrow7_y <= 'd38 && arrow7_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow7 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(up == 'd1 && ((arrow7_y <= 'd101 && arrow7_y > 'd85)||(arrow7_y <= 'd54 && arrow7_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow7 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(up == 'd1 && (arrow7_y <= 'd85 && arrow7_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow7 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite  
                
    // arrow6 sensing:
    else if(arrow6_y != 10'd900 && arrow6_y <= 'd133 && arrow6_y >= 'd6) begin // sensing begin
        if(up == 'd1 && ((arrow6_y <= 'd133 && arrow6_y > 'd117)||(arrow6_y <= 'd22 && arrow6_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow6 <= 900; // remove arrow
            current_sprite_word <= 'd2; end// 'bad' sprite
        else if(up == 'd1 && ((arrow6_y <= 'd117 && arrow6_y > 'd101)||(arrow6_y <= 'd38 && arrow6_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow6 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(up == 'd1 && ((arrow6_y <= 'd101 && arrow6_y > 'd85)||(arrow6_y <= 'd54 && arrow6_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow6 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(up == 'd1 && (arrow6_y <= 'd85 && arrow6_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow6 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end // 'perfect' sprite
    
    // missed arrows:
    if(arrow10_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow10_y < 'd0)
        arrow10 <= 900; // remove arrow at top of screen
    if(arrow9_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow9_y < 'd0)
        arrow9 <= 900; // remove arrow at top of screen
    if(arrow8_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow8_y < 'd0)
        arrow8 <= 900; // remove arrow at top of screen
    if(arrow7_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow7_y < 'd0)
        arrow7 <= 900; // remove arrow at top of screen
    if(arrow6_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow6_y < 'd0)
        arrow6 <= 900; // remove arrow at top of screen
    
    // sensing for down arrows
    
    // arrow 15 sensing:
    if(arrow15_y != 10'd900 && arrow15_y <= 'd133 && arrow15_y >= 'd6) begin // sensing begin
        if(down == 'd1 && ((arrow15_y <= 'd133 && arrow15_y > 'd117)||(arrow15_y <= 'd22 && arrow15_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow15 <= 900; // remove arrow
            current_sprite_word <= 'd2; end // 'bad' sprite
        else if(down == 'd1 && ((arrow15_y <= 'd117 && arrow15_y > 'd101)||(arrow15_y <= 'd38 && arrow15_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow15 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(down == 'd1 && ((arrow15_y <= 'd101 && arrow15_y > 'd85)||(arrow15_y <= 'd54 && arrow15_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow15 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(down == 'd1 && (arrow15_y <= 'd85 && arrow15_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow15 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite
            
    // arrow14 sensing:
    else if(arrow14_y != 10'd900 && arrow14_y <= 'd133 && arrow14_y >= 'd6) begin // sensing begin
        if(down == 'd1 && ((arrow14_y <= 'd133 && arrow14_y > 'd117)||(arrow14_y <= 'd22 && arrow14_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow14 <= 900; // remove arrow
            current_sprite_word <= 'd2; end // 'bad' sprite
        else if(down == 'd1 && ((arrow14_y <= 'd117 && arrow14_y > 'd101)||(arrow14_y <= 'd38 && arrow14_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow14 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(down == 'd1 && ((arrow14_y <= 'd101 && arrow14_y > 'd85)||(arrow14_y <= 'd54 && arrow14_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow14 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(down == 'd1 && (arrow14_y <= 'd85 && arrow14_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow14 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite  
          
    // arrow13 sensing:
    else if(arrow13_y != 10'd900 && arrow13_y <= 'd133 && arrow13_y >= 'd6) begin // sensing begin
        if(down == 'd1 && ((arrow13_y <= 'd133 && arrow13_y > 'd117)||(arrow13_y <= 'd22 && arrow13_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow13 <= 900; // remove arrow
            current_sprite_word <= 'd2; end// 'bad' sprite
        else if(down == 'd1 && ((arrow13_y <= 'd117 && arrow13_y > 'd101)||(arrow13_y <= 'd38 && arrow13_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow13 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(down == 'd1 && ((arrow13_y <= 'd101 && arrow13_y > 'd85)||(arrow13_y <= 'd54 && arrow13_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow13 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(down == 'd1 && (arrow13_y <= 'd85 && arrow13_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow13 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite  
            
    // arrow12 sensing:
    else if(arrow12_y != 10'd900 && arrow12_y <= 'd133 && arrow12_y >= 'd6) begin // sensing begin
        if(down == 'd1 && ((arrow12_y <= 'd133 && arrow12_y > 'd117)||(arrow12_y <= 'd22 && arrow12_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow12 <= 900; // remove arrow
            current_sprite_word <= 'd2; end// 'bad' sprite
        else if(down == 'd1 && ((arrow12_y <= 'd117 && arrow12_y > 'd101)||(arrow12_y <= 'd38 && arrow12_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow12 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(down == 'd1 && ((arrow12_y <= 'd101 && arrow12_y > 'd85)||(arrow12_y <= 'd54 && arrow12_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow12 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(down == 'd1 && (arrow12_y <= 'd85 && arrow12_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow12 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite  
                
    // arrow11 sensing:
    else if(arrow11_y != 10'd900 && arrow11_y <= 'd133 && arrow11_y >= 'd6) begin // sensing begin
        if(down == 'd1 && ((arrow11_y <= 'd133 && arrow11_y > 'd117)||(arrow11_y <= 'd22 && arrow11_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow11 <= 900; // remove arrow
            current_sprite_word <= 'd2; end// 'bad' sprite
        else if(down == 'd1 && ((arrow11_y <= 'd117 && arrow11_y > 'd101)||(arrow11_y <= 'd38 && arrow11_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow11 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(down == 'd1 && ((arrow11_y <= 'd101 && arrow11_y > 'd85)||(arrow11_y <= 'd54 && arrow11_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow11 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(down == 'd1 && (arrow11_y <= 'd85 && arrow11_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow11 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end // 'perfect' sprite
    
    // missed arrows:
    if(arrow15_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow15_y < 'd0)
        arrow15 <= 900; // remove arrow at top of screen
    if(arrow14_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow14_y < 'd0)
        arrow14 <= 900; // remove arrow at top of screen
    if(arrow13_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow13_y < 'd0)
        arrow13 <= 900; // remove arrow at top of screen
    if(arrow12_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow12_y < 'd0)
        arrow12 <= 900; // remove arrow at top of screen
    if(arrow11_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow11_y < 'd0)
        arrow11 <= 900; // remove arrow at top of screen
    
    // sensing for right arrows
    
    // arrow 20 sensing:
    if(arrow20_y != 10'd900 && arrow20_y <= 'd133 && arrow20_y >= 'd6) begin // sensing begin
        if(right == 'd1 && ((arrow20_y <= 'd133 && arrow20_y > 'd117)||(arrow20_y <= 'd22 && arrow20_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow15 <= 900; // remove arrow
            current_sprite_word <= 'd2; end // 'bad' sprite
        else if(down == 'd1 && ((arrow15_y <= 'd117 && arrow15_y > 'd101)||(arrow15_y <= 'd38 && arrow15_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow20 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(right == 'd1 && ((arrow20_y <= 'd101 && arrow20_y > 'd85)||(arrow20_y <= 'd54 && arrow20_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow20 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(right == 'd1 && (arrow20_y <= 'd85 && arrow20_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow20 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite
            
    // arrow19 sensing:
    else if(arrow19_y != 10'd900 && arrow19_y <= 'd133 && arrow19_y >= 'd6) begin // sensing begin
        if(right == 'd1 && ((arrow19_y <= 'd133 && arrow19_y > 'd117)||(arrow19_y <= 'd22 && arrow19_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow19 <= 900; // remove arrow
            current_sprite_word <= 'd2; end // 'bad' sprite
        else if(right == 'd1 && ((arrow19_y <= 'd117 && arrow19_y > 'd101)||(arrow19_y <= 'd38 && arrow19_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow19 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(right == 'd1 && ((arrow19_y <= 'd101 && arrow19_y > 'd85)||(arrow19_y <= 'd54 && arrow19_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow19 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(right == 'd1 && (arrow19_y <= 'd85 && arrow19_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow19 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite  
          
    // arrow18 sensing:
    else if(arrow18_y != 10'd900 && arrow18_y <= 'd133 && arrow18_y >= 'd6) begin // sensing begin
        if(right == 'd1 && ((arrow18_y <= 'd133 && arrow18_y > 'd117)||(arrow18_y <= 'd22 && arrow18_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow18 <= 900; // remove arrow
            current_sprite_word <= 'd2; end// 'bad' sprite
        else if(right == 'd1 && ((arrow18_y <= 'd117 && arrow18_y > 'd101)||(arrow18_y <= 'd38 && arrow18_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow18 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(right == 'd1 && ((arrow18_y <= 'd101 && arrow18_y > 'd85)||(arrow18_y <= 'd54 && arrow18_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow18 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(right == 'd1 && (arrow18_y <= 'd85 && arrow18_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow18 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite  
            
    // arrow17 sensing:
    else if(arrow17_y != 10'd900 && arrow17_y <= 'd133 && arrow17_y >= 'd6) begin // sensing begin
        if(right == 'd1 && ((arrow17_y <= 'd133 && arrow17_y > 'd117)||(arrow17_y <= 'd22 && arrow17_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow17 <= 900; // remove arrow
            current_sprite_word <= 'd2; end// 'bad' sprite
        else if(right == 'd1 && ((arrow17_y <= 'd117 && arrow17_y > 'd101)||(arrow17_y <= 'd38 && arrow17_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow17 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(right == 'd1 && ((arrow17_y <= 'd101 && arrow17_y > 'd85)||(arrow17_y <= 'd54 && arrow17_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow17 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(right == 'd1 && (arrow17_y <= 'd85 && arrow17_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow17 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end// 'perfect' sprite  
                
    // arrow16 sensing:
    else if(arrow16_y != 10'd900 && arrow16_y <= 'd133 && arrow16_y >= 'd6) begin // sensing begin
        if(right == 'd1 && ((arrow16_y <= 'd133 && arrow16_y > 'd117)||(arrow16_y <= 'd22 && arrow16_y > 'd6))) begin
            if(score_1 + 2 > 'd9) begin // sensed bad 
                score_1 = (score_1 + 2) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 2; 
            end
            // LED display
            arrow16 <= 900; // remove arrow
            current_sprite_word <= 'd2; end// 'bad' sprite
        else if(right == 'd1 && ((arrow16_y <= 'd117 && arrow16_y > 'd101)||(arrow16_y <= 'd38 && arrow16_y > 'd22))) begin
            if(score_1 + 4 > 'd9) begin // sensed good 
                score_1 = (score_1 + 4) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 4; 
            end
            // LED display
            arrow16 <= 900; // remove arrow
            current_sprite_word <= 'd3; end// 'good' sprite
        else if(right == 'd1 && ((arrow16_y <= 'd101 && arrow16_y > 'd85)||(arrow16_y <= 'd54 && arrow16_y > 'd38))) begin
            if(score_1 + 6 > 'd9) begin // sensed great 
                score_1 = (score_1 + 6) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 6; 
            end
            // LED display
            arrow16 <= 900; // remove arrow
            current_sprite_word <= 'd4; end// 'great' sprite
        else if(right == 'd1 && (arrow16_y <= 'd85 && arrow16_y > 'd54)) begin
            if(score_1 + 8 > 'd9) begin // sensed perfect 
                score_1 = (score_1 + 8) - 10;
                if(score_10 + 'd1 > 'd9) begin
                    score_10 <= 0;
                    if(score_100 + 'd1 > 'd9)
                    begin
                        score_100 <= 0;
                        score_1000 <= score_1000 + 1; 
                    end
                    else begin
                        score_100 <= score_100 + 1; end end
                else 
                begin
                score_10 = score_10 + 1; 
                end end
            else
            begin
                score_1 <= score_1 + 8; 
            end
            // LED display
            arrow16 <= 900; // remove arrow
            current_sprite_word <= 'd5; end end // 'perfect' sprite
    
    // missed arrows:
    if(arrow20_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow20_y < 'd0)
        arrow20 <= 900; // remove arrow at top of screen
    if(arrow19_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow19_y < 'd0)
        arrow19 <= 900; // remove arrow at top of screen
    if(arrow18_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow18_y < 'd0)
        arrow18 <= 900; // remove arrow at top of screen
    if(arrow17_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow17_y < 'd0)
        arrow17 <= 900; // remove arrow at top of screen
    if(arrow16_y < 'd6)
        current_sprite_word <= 'd1;// miss sprite
    if(arrow16_y < 'd0)
        arrow16 <= 900; // remove arrow at top of screen
        
    // final letter score:
    if(frame_count == 'd5100) begin
        if(((score_1000 * 1000) + (score_100 * 100) + (score_10 * 10) + score_1) >= 'd1452)
            score_letter <= 'd5;
        else if(((score_1000 * 1000) + (score_100 * 100) + (score_10 * 10) + score_1) >= 'd1252)
            score_letter <= 'd10;
        else if(((score_1000 * 1000) + (score_100 * 100) + (score_10 * 10) + score_1) >= 'd1100)
            score_letter <= 'd11;
        else if(((score_1000 * 1000) + (score_100 * 100) + (score_10 * 10) + score_1) >= 'd950)
            score_letter <= 'd12;
        else if(((score_1000 * 1000) + (score_100 * 100) + (score_10 * 10) + score_1) >= 'd760)
            score_letter <= 'd13;
        else
            score_letter <= 'd15; end
      
      // sprite word timer (2 seconds)
    if (current_sprite_word == 0)
        sprite_word <= 0;
    else if (current_sprite_word != 6)
    begin
        sprite_word <= current_sprite_word;
        last_sprite_word <= current_sprite_word;
        current_sprite_word <= 6;
        sprite_counter <= 120;
    end
    else
    begin
       if (sprite_counter == 0)
       begin
           sprite_word <= 0;
           current_sprite_word <= 0;
           last_sprite_word <= 0; 
       end
       else
       begin
           sprite_word <= last_sprite_word;
           sprite_counter <= sprite_counter - 1;
       end
    end
end

always@*
begin
    
    // left arrows
    if(arrow1 == 900 || ((frame_count - arrow1) * 8) > 'd863)
        arrow1_y = 10'd900;
    else
       arrow1_y = 10'd799 - ((frame_count - arrow1) * 8);
    if(arrow2 == 900 || ((frame_count - arrow2) * 8) > 'd863)
        arrow2_y = 10'd900;
    else
        arrow2_y = 10'd799 - ((frame_count - arrow2) * 8);
    if(arrow3 == 900 || ((frame_count - arrow3) * 8) > 'd863)
        arrow3_y = 10'd900;
    else
        arrow3_y = 10'd799 - ((frame_count - arrow3) * 8);
    if(arrow4 == 900 || ((frame_count - arrow4) * 8) > 'd863)
        arrow4_y = 10'd900;
    else
        arrow4_y = 10'd799 - ((frame_count - arrow4) * 8);
    if(arrow5 == 900 || ((frame_count - arrow5) * 8) > 'd863)
        arrow5_y = 10'd900;
    else
        arrow5_y = 10'd799 - ((frame_count - arrow5) * 8); 
    
    // up arrows
    if(arrow6 == 900 || ((frame_count - arrow6) * 8) > 'd831)
        arrow6_y = 10'd900;
    else
       arrow6_y = 10'd799 - ((frame_count - arrow6) * 8);
    if(arrow7 == 900 || ((frame_count - arrow7) * 8) > 'd831)
        arrow7_y = 10'd900;
    else
        arrow7_y = 10'd799 - ((frame_count - arrow7) * 8);
    if(arrow8 == 900 || ((frame_count - arrow8) * 8) > 'd831)
        arrow8_y = 10'd900;
    else
        arrow8_y = 10'd799 - ((frame_count - arrow8) * 8);
    if(arrow9 == 900 || ((frame_count - arrow9) * 8) > 'd831)
        arrow9_y = 10'd900;
    else
        arrow9_y = 10'd799 - ((frame_count - arrow9) * 8);
    if(arrow10 == 900 || ((frame_count - arrow10) * 8) > 'd831)
        arrow10_y = 10'd900;
    else
        arrow10_y = 10'd799 - ((frame_count - arrow10) * 8); 
    
    // down arrows
    if(arrow11 == 900 || ((frame_count - arrow11) * 8) > 'd831)
        arrow11_y = 10'd900;
    else
       arrow11_y = 10'd799 - ((frame_count - arrow11) * 8);
    if(arrow12 == 900 || ((frame_count - arrow12) * 8) > 'd831)
        arrow12_y = 10'd900;
    else
        arrow12_y = 10'd799 - ((frame_count - arrow12) * 8);
    if(arrow13 == 900 || ((frame_count - arrow13) * 8) > 'd831)
        arrow13_y = 10'd900;
    else
        arrow13_y = 10'd799 - ((frame_count - arrow13) * 8);
    if(arrow14 == 900 || ((frame_count - arrow14) * 8) > 'd831)
        arrow14_y = 10'd900;
    else
        arrow14_y = 10'd799 - ((frame_count - arrow14) * 8);
    if(arrow15 == 900 || ((frame_count - arrow15) * 8) > 'd831)
        arrow15_y = 10'd900;
    else
        arrow15_y = 10'd799 - ((frame_count - arrow15) * 8);
        
    // right arrows
    if(arrow16 == 900 || ((frame_count - arrow16) * 8) > 'd831)
        arrow16_y = 10'd900;
    else
       arrow16_y = 10'd799 - ((frame_count - arrow16) * 8);
    if(arrow17 == 900 || ((frame_count - arrow17) * 8) > 'd831)
        arrow17_y = 10'd900;
    else
        arrow17_y = 10'd799 - ((frame_count - arrow17) * 8);
    if(arrow18 == 900 || ((frame_count - arrow18) * 8) > 'd831)
        arrow18_y = 10'd900;
    else
        arrow18_y = 10'd799 - ((frame_count - arrow18) * 8);
    if(arrow19 == 900 || ((frame_count - arrow19) * 8) > 'd831)
        arrow19_y = 10'd900;
    else
        arrow19_y = 10'd799 - ((frame_count - arrow19) * 8);
    if(arrow20 == 900 || ((frame_count - arrow20) * 8) > 'd831)
        arrow20_y = 10'd900;
    else
        arrow20_y = 10'd799 - ((frame_count - arrow20) * 8);
end

endmodule
