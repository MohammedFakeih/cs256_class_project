`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2023 09:53:08 PM
// Design Name: 
// Module Name: vga_out_new
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


module vga_out_new(
    input clk,
    input r0, r1, r2, r3, g0, g1, g2, g3, b0, b1, b2, b3,
    output [3:0] pix_r, pix_g, pix_b,
    output hsync, vsync, output reg [10:0] curr_x, output reg [9:0] curr_y
    );

reg [10:0] hcount; reg [9:0] vcount;
wire [3:0] red, green, blue;
// wire pixclk;

//clk_wiz_0 instance_name
//   (
//    // Clock out ports
//    .clk_out1(clk),     // output clk_out1
//   // Clock in ports
//    .clk_in1(pixclk));      // input clk_in1

assign red[3] = r3, red[2] = r2, red[1] = r1, red[0] = r0;
assign green[3] = g3, green[2] = g2, green[1] = g1, green[0] = g0;
assign blue[3] = b3, blue[2] = b2, blue[1] = b1, blue[0] = b0;

always@(posedge clk)
begin
//    if(rst) begin
//        hcount <= 0;
//        vcount <= 0;
//        curr_x <= 0;
//        curr_y <= 0; end
        hcount <= hcount + 1;
        if(hcount == 11'b11010001111) begin // 11010001111 = 1679
            if(vcount == 10'b1100111011) begin // 1100111011 = 827
                vcount <= 0;
                hcount <= 0; end
            else begin
                vcount <= vcount + 1;
                hcount <= 0; end end
    if(hcount > 11'd335 && hcount < 11'd1616 && vcount > 10'd26 && vcount < 10'd827) begin
        curr_x <= curr_x + 1;
        if(curr_x == 11'd1279) begin
            if(curr_y == 10'd799) begin
                curr_x <= 0;
                curr_y <= 0; end
            else begin
                curr_x <= 0;
                curr_y <= curr_y + 1; end end end
end

//always@*
//begin
//    h_count = hcount;
//    v_count = vcount;
//end

// hsync = 0  when hcount is between 0 - 135
// vsync = 1 when vcount is between 0 - 2
assign hsync = hcount > 11'd135 ? 1'b1: 1'b0;
assign vsync = vcount < 10'd3 ? 1'b1: 1'b0;

// assign pixels with assign statements to depend on inputs
assign pix_r = (hcount < 11'd1616 && hcount > 11'd335 && vcount > 10'd26 && vcount < 10'd827) ? red: 4'b0000;
assign pix_g = (hcount < 11'd1616 && hcount > 11'd335 && vcount > 10'd26 && vcount < 10'd827) ? green: 4'b0000;
assign pix_b = (hcount < 11'd1616 && hcount > 11'd335 && vcount > 10'd26 && vcount < 10'd827) ? blue: 4'b0000;

endmodule