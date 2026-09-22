`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2026 03:24:34 PM
// Design Name: 
// Module Name: master_tb
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


module master_tb;
    logic clk = 0;
    logic rst = 0;
    logic locked = 0;
    wire sda;
    wire scl;
    
 
    master uut(
        .clk(clk),
        .rst(rst),
        .sda(sda),
        .scl(scl),
        .locked(locked)
        
    );
    
    //providing an input clock signal of 40 MHz
    always begin
        #12.5 clk = ~clk;
    end
    
    
    initial begin
        clk = 0;
        rst = 0;
        
        #40 rst = 1;
        #40 rst = 0; 
    end
    
    
    
    
endmodule
