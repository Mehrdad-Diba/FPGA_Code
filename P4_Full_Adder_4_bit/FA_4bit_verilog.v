`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:29:19 05/04/2025 
// Design Name: 
// Module Name:    FA_4bit_verilog 
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
module FA_4bit_verilog(
    input  [3:0] a,  // a : input STD_LOGIC_VECTOR (3 downto 0),
    input  [3:0] b,
    output [3:0] s,
    output 		  c
    );
//---signal-------
wire s1,s2,s3;
//----------------
FA_verilog u1 (
		.ai(a[0]),
		.bi(b[0]),
		.ci(1'b0),
		.so(s[0]),
		.co(s1)
);

FA_verilog u2 (
		.ai(a[1]),
      .bi(b[1]),
      .ci(s1),
      .so(s[1]),
      .co(s2)
);

FA_verilog u3 (
		.ai(a[2]),
      .bi(b[2]),
      .ci(s2),
      .so(s[2]),
      .co(s3)
);

FA_verilog u4 (
		.ai(a[3]),
      .bi(b[3]),
      .ci(s3),
      .so(s[3]),
      .co(c)
);

endmodule
