`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2026 09:27:55 PM
// Design Name: 
// Module Name: master
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


module master(
    input logic clk, //--> 40 MHz clock from clk_wiz
    input logic rst,
    input logic  locked, //--> detects when PLL from clk wiz has stabilized
    //pullup resistor for SDA and SCL lines
    (* PULLUP = "TRUE" *) inout wire sda, scl
    
    );
    
    logic scl_out;
    typedef enum {IDLE, START, DATA, STOP, RESET} states;
    states state; 
    
    //counter for SCL line, 40 MHz --> 400 kHz
    logic [5:0] count = 6'b0; //counter to count to 4 to toggle SCL clock 
    always_ff @(posedge clk) begin
        if (rst) begin
            count <= 6'b0;
            scl_out <= 1'b0;
        end else if (count == 6'd49) begin
            count <= 6'b0;
            scl_out <= ~scl_out;
        end else begin
            count += 6'b1;
        end
    end
    
    
    
    
    
    assign scl = scl_out ? 1'bz : 1'b0;
    //assign scl = scl_out;

endmodule
