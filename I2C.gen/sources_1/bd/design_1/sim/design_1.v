//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2026.1 (win64) Build 6511674 Tue Jun 16 11:02:23 MDT 2026
//Date        : Sun Oct 11 11:28:32 2026
//Host        : ThinkPad running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (addr_0,
    reset_0,
    rst_0,
    rw_0,
    sys_clk,
    tx_data_0);
  input [6:0]addr_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input rst_0;
  input rw_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLK, CLK_DOMAIN design_1_sys_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input sys_clk;
  input [7:0]tx_data_0;

  wire [6:0]addr_0;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_locked;
  wire reset_0;
  wire rst_0;
  wire rw_0;
  wire sys_clk;
  wire [7:0]tx_data_0;

  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(sys_clk),
        .clk_out1(clk_wiz_0_clk_out1),
        .locked(clk_wiz_0_locked),
        .reset(reset_0));
  design_1_master_0_0 master_0
       (.addr(addr_0),
        .clk(clk_wiz_0_clk_out1),
        .locked(clk_wiz_0_locked),
        .rst(rst_0),
        .rw(rw_0),
        .tx_data(tx_data_0));
endmodule
