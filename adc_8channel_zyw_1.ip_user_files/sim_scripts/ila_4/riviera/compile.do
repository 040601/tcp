vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../adc_8channel_zyw_1.srcs/sources_1/ip/ila_4/hdl/verilog" "+incdir+../../../../adc_8channel_zyw_1.srcs/sources_1/ip/ila_4/hdl/verilog" \
"E:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"E:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"E:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../adc_8channel_zyw_1.srcs/sources_1/ip/ila_4/hdl/verilog" "+incdir+../../../../adc_8channel_zyw_1.srcs/sources_1/ip/ila_4/hdl/verilog" \
"../../../../adc_8channel_zyw_1.srcs/sources_1/ip/ila_4/sim/ila_4.v" \

vlog -work xil_defaultlib \
"glbl.v"

