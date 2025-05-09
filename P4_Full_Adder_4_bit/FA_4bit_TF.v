`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:42:49 05/04/2025
// Design Name:   FA_4bit_verilog
// Module Name:   E:/FPGA_Projekt/P4_Full_Adder_4_bit/FA_4bit_TF.v
// Project Name:  P4_Full_Adder_4_bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA_4bit_verilog
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FA_4bit_TF;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [3:0] s;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	FA_4bit_verilog uut (
		.a(a), 
		.b(b), 
		.s(s), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
      a = 8;
		b = 12;
		
		#100;
		
      a = 4;
		b = 10;
		
		#100;
		
      a = 15;
		b = 15;
		
	end
      
endmodule

