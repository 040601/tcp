
 add_fsm_encoding \
       {SYNCHRONISE.STATE} \
       { }  \
       {{0000 0000} {0001 0001} {0010 0010} {0011 0011} {0100 0100} {0101 0101} {0110 0110} {0111 0111} {1000 1001} {1001 1000} {1010 1011} {1011 1010} {1100 1100} }

 add_fsm_encoding \
       {GPCS_PMA_GEN.USE_ROCKET_IO.RX_RST_SM_TXOUTCLK.RX_RST_SM} \
       { }  \
       {{0000 000000000000001} {0001 000000000000010} {0010 000000000000100} {0011 000000000001000} {0100 000000000010000} {0101 000000000100000} {0110 000000001000000} {0111 000000010000000} {1000 000000100000000} {1001 000001000000000} {1010 000010000000000} {1011 000100000000000} {1100 001000000000000} {1101 010000000000000} {1110 100000000000000} }

 add_fsm_encoding \
       {GPCS_PMA_GEN.USE_ROCKET_IO.TX_RST_SM} \
       { }  \
       {{0000 000000000000001} {0001 000000000000010} {0010 000000000000100} {0011 000000000001000} {0100 000000000010000} {0101 000000000100000} {0110 000000001000000} {0111 000000010000000} {1000 000000100000000} {1001 000001000000000} {1010 000010000000000} {1011 000100000000000} {1100 001000000000000} {1101 010000000000000} {1110 100000000000000} }

 add_fsm_encoding \
       {gtwizard_ultrascale_v1_7_2_gtwiz_reset.sm_reset_tx} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} {110 110} }

 add_fsm_encoding \
       {gtwizard_ultrascale_v1_7_2_gtwiz_reset.sm_reset_rx} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} {110 110} {111 111} }

 add_fsm_encoding \
       {gtwizard_ultrascale_v1_7_2_gtwiz_reset.sm_reset_all} \
       { }  \
       {{000 111} {001 000} {010 001} {011 010} {100 011} {101 100} {110 101} {111 110} }
