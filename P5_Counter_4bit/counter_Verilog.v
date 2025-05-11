`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:52:50 05/10/2025 
// Design Name: 
// Module Name:    counter_Verilog 
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
module counter_Verilog(
    input clk,
    input rst_i,
    output reg [3:0] q
    );

reg [3:0] s1;
wire [3:0] s2;
wire q0, q1, q2, q3; // Wires for FDCE outputs
wire rst;

FA_4bit_verilog u1(
    .a(s1),
    .b(4'b0001),
    .s(s2)
);

assign rst = rst_i; // Use input reset

FDCE #(
    .INIT(1'b0)
) FDCE_inst0 (
    .Q(q0),
    .C(clk),
    .CE(1'b1), // Enable clock
    .CLR(rst),
    .D(s2[0])
);

FDCE #(
    .INIT(1'b0)
) FDCE_inst1 (
    .Q(q1),
    .C(clk),
    .CE(1'b1), // Enable clock
    .CLR(rst),
    .D(s2[1])
);

FDCE #(
    .INIT(1'b0)
) FDCE_inst2 (
    .Q(q2),
    .C(clk),
    .CE(1'b1), // Enable clock
    .CLR(rst),
    .D(s2[2])
);

FDCE #(
    .INIT(1'b0)
) FDCE_inst3 (
    .Q(q3),
    .C(clk),
    .CE(1'b1), // Enable clock
    .CLR(rst),
    .D(s2[3])
);

always @(posedge clk or negedge rst_i) begin
    if (rst_i) begin
        s1 <= 4'b0000;
    end else begin
        s1[0] <= q0;
        s1[1] <= q1;
        s1[2] <= q2;
        s1[3] <= q3;
    end
end

always @(posedge clk) begin
    q <= s1;
end

endmodule