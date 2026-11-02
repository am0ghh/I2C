//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
//Date        : Sun Oct 11 11:28:32 2026
//Host        : ThinkPad running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (addr_0,
    reset_0,
    rst_0,
    rw_0,
    sys_clk,
    tx_data_0);
  input [6:0]addr_0;
  input reset_0;
  input rst_0;
  input rw_0;
  input sys_clk;
  input [7:0]tx_data_0;

  wire [6:0]addr_0;
  wire reset_0;
  wire rst_0;
  wire rw_0;
  wire sys_clk;
  wire [7:0]tx_data_0;

  design_1 design_1_i
       (.addr_0(addr_0),
        .reset_0(reset_0),
        .rst_0(rst_0),
        .rw_0(rw_0),
        .sys_clk(sys_clk),
        .tx_data_0(tx_data_0));
endmodule
