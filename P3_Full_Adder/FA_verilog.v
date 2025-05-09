`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:31:43 05/04/2025 
// Design Name: 
// Module Name:    FA_verilog 
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
module FA_verilog(
    input  ai,
    input  bi,
    input  ci,
    output so,
    output co
    );
	 
// signal:--------------
	wire s1, s2, s3;
//-------------------
	HA_verilog u1 (
		.a(ai),
		.b(bi),
		.s(s1),
		.c(s2)
	);
	
	HA_verilog u2(
		.a(s1),
		.b(ci),
		.s(so),
		.c(s3)
	);

assign co = s2 | s3;


endmodule
