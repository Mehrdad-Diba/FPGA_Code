`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:08:41 05/04/2025 
// Design Name: 
// Module Name:    HA_verilog 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module HA_verilog(
    input  a,
    input  b,
    output s,
    output c
    );
assign c = a & b;
assign s = a ^ b;
endmodule
