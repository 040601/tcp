-makelib ies_lib/xil_defaultlib -sv \
  "E:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "E:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "E:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/gtwizard_ultrascale_v1_7_2 \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_bit_sync.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gte4_drp_arb.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_delay_powergood.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_delay_powergood.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe3_cpll_cal.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe3_cal_freqcnt.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_rx.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_cpll_cal_tx.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gthe4_cal_freqcnt.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_rx.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_cpll_cal_tx.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtye4_cal_freqcnt.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_rx.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_buffbypass_tx.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_reset.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_rx.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_userclk_tx.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_rx.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_gtwiz_userdata_tx.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_reset_sync.v" \
  "../../../ipstatic/hdl/gtwizard_ultrascale_v1_7_reset_inv_sync.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/ip_0/sim/gtwizard_ultrascale_v1_7_gthe3_channel.v" \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/ip_0/sim/gig_ethernet_pcs_pma_0_gt_gthe3_channel_wrapper.v" \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/ip_0/sim/gig_ethernet_pcs_pma_0_gt_gtwizard_gthe3.v" \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/ip_0/sim/gig_ethernet_pcs_pma_0_gt_gtwizard_top.v" \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/ip_0/sim/gig_ethernet_pcs_pma_0_gt.v" \
-endlib
-makelib ies_lib/gig_ethernet_pcs_pma_v16_1_2 \
  "../../../ipstatic/hdl/gig_ethernet_pcs_pma_v16_1_rfs.vhd" \
-endlib
-makelib ies_lib/gig_ethernet_pcs_pma_v16_1_2 \
  "../../../ipstatic/hdl/gig_ethernet_pcs_pma_v16_1_rfs.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/synth/gig_ethernet_pcs_pma_0_resets.v" \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/synth/gig_ethernet_pcs_pma_0_clocking.v" \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/synth/gig_ethernet_pcs_pma_0_support.v" \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/synth/gig_ethernet_pcs_pma_0_reset_sync.v" \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/synth/gig_ethernet_pcs_pma_0_sync_block.v" \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/synth/transceiver/gig_ethernet_pcs_pma_0_transceiver.v" \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/synth/gig_ethernet_pcs_pma_0_block.v" \
  "../../../../adc_8channel_zyw_1.srcs/sources_1/ip/gig_ethernet_pcs_pma_0/synth/gig_ethernet_pcs_pma_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

