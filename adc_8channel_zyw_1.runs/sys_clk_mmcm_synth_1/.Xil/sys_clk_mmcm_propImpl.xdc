set_property SRC_FILE_INFO {cfile:e:/vivadoprojects/adcether/adc_8channel_zyw_3/adc_8channel_zyw_1.srcs/sources_1/ip/sys_clk_mmcm/sys_clk_mmcm.xdc rfile:../../../adc_8channel_zyw_1.srcs/sources_1/ip/sys_clk_mmcm/sys_clk_mmcm.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1_p]] 0.05
