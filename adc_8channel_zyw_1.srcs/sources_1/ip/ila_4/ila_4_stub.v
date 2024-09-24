// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed Sep 11 21:22:01 2024
// Host        : LAPTOP-ENQIT77Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/vivadoprojects/adcether/adc_8channel_zyw_1/adc_8channel_zyw_1.srcs/sources_1/ip/ila_4/ila_4_stub.v
// Design      : ila_4
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku040-ffva1156-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2017.4" *)
module ila_4(clk, probe0, probe1, probe2, probe3, probe4, probe5, 
  probe6, probe7, probe8, probe9, probe10)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[3:0],probe2[0:0],probe3[0:0],probe4[31:0],probe5[7:0],probe6[0:0],probe7[0:0],probe8[0:0],probe9[0:0],probe10[0:0]" */;
  input clk;
  input [0:0]probe0;
  input [3:0]probe1;
  input [0:0]probe2;
  input [0:0]probe3;
  input [31:0]probe4;
  input [7:0]probe5;
  input [0:0]probe6;
  input [0:0]probe7;
  input [0:0]probe8;
  input [0:0]probe9;
  input [0:0]probe10;
endmodule
