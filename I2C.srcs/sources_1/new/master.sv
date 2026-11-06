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
    input logic start, 
    input logic [6:0] addr, //7-bit address
    //input logic Din,
    input logic [7:0] tx_data,
    output logic [7:0] rx_data, 
    input logic rw, //--> (0 = write, 1 = read)
    //pullup resistor for SDA and SCL lines
    (* PULLUP = "TRUE" *) inout wire sda, scl
    );
    
    logic sda_out;
    logic scl_out;
    //reg Din;
    typedef enum {IDLE, START, ADDR, RW, ACK1, DATA, STOP, RESET} states;
    states state; 
    logic [2:0] bit_count;
    //buffer register for address 
    logic [6:0] addr_buf;
    
    //counter for SCL line, 40 MHz --> 400 kHz for I2C fast mode
    logic [5:0] count = 6'b0; //counter to count to 4 to toggle SCL clock 
    //logic [5:0] count1 = 6'b0; //counter for shift reg
    always_ff @(posedge clk) begin
        if (rst) begin
            count <= 6'b0;
            scl_out <= 1'b1;
            sda_out <= 1'b1;
            state <= IDLE;
            addr_buf <= 7'b0;
            bit_count <= 3'b0;
            
        end else if ((state != IDLE)) begin
            if (count == 6'd49) begin
                count <= 6'b0;
                scl_out <= ~scl_out;
           
            //count += 6'b1;
            end else begin
                count += 6'b1;
            end
        end
    end
    
    //state machine
    always @(posedge clk) begin
        //sda_out <= ~sda_out;
        if (!rst) begin
            if (state == IDLE) begin
                //sda_out <= 1'b1;
                if (start) begin
                    state <= START;
                end
                //sda_out <= 1'b0; //--> pulling SDA line low to initiate communication
                /*if ((scl_out) && (!sda_out)) begin
                    state <= START;
                end */
            end else if (state == START) begin
                sda_out <= 1'b0;
                if ((scl_out) && (!sda_out) && (count == 6'd25)) begin
                    //count <= 6'd0;
                    scl_out <= 1'b0;
                    addr_buf <= addr[6:0];
                    state <= ADDR;
                end
                //state <= ADDR;
            end else if (state == ADDR) begin
                //addr_buf <= {addr[5:0], 1'b0};
                sda_out <= addr_buf[6];
                //if (scl_out) begin sda_out <= addr_buf[6]; end
                if ((!scl_out) && (count == 6'd25) && (bit_count  < 7)) begin
                    addr_buf <= addr_buf << 1'b1;
                    bit_count <= bit_count + 1'b1;
                end else if (bit_count == 7) begin
                    state <= RW;
                    bit_count <= 0;
                end
            end else if (state == RW) begin
                if ((!scl_out) && (count == 6'd25) && (bit_count == 0)) begin
                    sda_out <= RW;
                    bit_count <= 1'b1;
                end else begin
                    sda_out <= 1'b1;
                    state <= ACK1;
                end
            end else if (state == ACK1) begin
                //implement later
            end
        end

    end
    
    
    assign sda = sda_out ? 1'bz : 1'b0;
    assign scl = scl_out ? 1'bz : 1'b0;
    //assign addr_buf = addr;
    
    //assign scl = scl_out;

endmodule
