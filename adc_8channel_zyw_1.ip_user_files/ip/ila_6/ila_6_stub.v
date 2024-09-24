// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Thu Aug 29 13:33:47 2024
// Host        : DESKTOP-3JDODKJ running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/DELL/Desktop/CW4.team/adc_8channel_zyw/adc_8channel_zyw_1/adc_8channel_zyw_1.srcs/sources_1/ip/ila_6/ila_6_stub.v
// Design      : ila_6
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2017.4" *)
module ila_6(clk, probe0, probe1, probe2, probe3)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[5:0],probe1[0:0],probe2[0:0],probe3[7:0]" */;
  input clk;
  input [5:0]probe0;
  input [0:0]probe1;
  input [0:0]probe2;
  input [7:0]probe3;
endmodule
