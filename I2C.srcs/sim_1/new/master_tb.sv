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
    logic start = 0;
    //logic Din = 0;
    logic rw = 0;
    wire sda;
    wire scl;
    reg [6:0] addr;
 
    master uut(
        .clk(clk),
        .rst(rst),
        .sda(sda),
        .scl(scl),
        .locked(locked),
        .addr(addr),
        .start(start),
        .rw(RW)
        
        
        //.Din(Din)
    );
    
    //providing an input clock signal of 40 MHz
    always begin
        #12.5 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        rst = 1;
        start = 0;
        
        #4000 rst = 0;
        
        #4000;
        addr  = 6'b101010;
        start = 1'b1;
        rw = 1'b1;
        //Din = 0;
        
    end
    
    
    
    
endmodule
