vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../adc_8channel_zyw_1.srcs/sources_1/ip/ila_7_3/hdl/verilog" "+incdir+../../../../adc_8channel_zyw_1.srcs/sources_1/ip/ila_7_3/hdl/verilog" \
"F:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"F:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"F:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../adc_8channel_zyw_1.srcs/sources_1/ip/ila_7_3/hdl/verilog" "+incdir+../../../../adc_8channel_zyw_1.srcs/sources_1/ip/ila_7_3/hdl/verilog" \
"../../../../adc_8channel_zyw_1.srcs/sources_1/ip/ila_7_3/sim/ila_7.v" \

vlog -work xil_defaultlib \
"glbl.v"

