`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/19 15:01:17
// Design Name: 
// Module Name: sitcp_test
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


module sitcp_test(
        input               CLK_200M,
        input               CLK_125M,
     
        input               rst_n,
        input               SFP_RXP,
        input               SFP_RXN,
        output              SFP_TXP,
        output              SFP_TXN,
    
        output              TX_DISABLE,
        //output  [7:0]       LED,
    
        // RBCP port
        /*output  [31:0]      RBCP_ADDR,
        output  [7:0]       RBCP_WD,
        output              RBCP_WE,
        output              RBCP_RE,
        input   [7:0]       RBCP_RD,
        input               RBCP_ACK,*/
    
        // TCP port
        input   [15:0]      TCP_RX_WC,    
        output              TCP_RX_WR,    
        output  [7:0]       TCP_RX_DATA,
        output              TCP_TX_FULL,
        input               TCP_TX_WR,    
        input   [7:0]       TCP_TX_DATA,
        output              TCP_OPEN_ACK,
        input               SFP_CLK0_P,
        input               SFP_CLK0_N
    );
    
    wire        GMII_TX_CLK;
    wire        GMII_RX_CLK;
    wire        GMII_TX_EN;
    wire[7:0]    GMII_TXD;
    wire        GMII_TX_ER;
    
    wire            GMII_RX_DV;        // in : Rx data valid
    wire    [ 7:0]    GMII_RXD;        // in : Rx data[7:0]
    wire            GMII_RX_ER;        // in : Rx error
    wire    [15:0]    STATUS_VECTOR;    // out: Core status.[15:0]    
    
    wire			TCP_CLOSE_REQ;
    
    
    WRAP_SiTCP_GMII_XCKU_32K WRAP_SiTCP_GMII_XCKU_32K_inst(
        .CLK (CLK_200M)                   ,    // in    : System Clock >129MHz
        .RST  (~rst_n)                  ,    // in    : System reset
    // Configuration parameters
        .FORCE_DEFAULTn (1'b0)       ,    // in    : Load default parameters
        .EXT_IP_ADDR   (32'h0000_0000)         ,    // in    : IP address[31:0]
        .EXT_TCP_PORT (16'h0000)       ,    // in    : TCP port #[15:0]
        .EXT_RBCP_PORT  (16'h0000)      ,    // in    : RBCP port #[15:0]
        .PHY_ADDR   (5'b0_0111)         ,    // in    : PHY-device MIF address[4:0]
    // EEPROM
        .EEPROM_CS()            ,    // out    : Chip select
        .EEPROM_SK()            ,    // out    : Serial data clock
        .EEPROM_DI()            ,    // out    : Serial write data
        .EEPROM_DO()            ,    // in    : Serial read data
        // user data, intialial values are stored in the EEPROM, 0xFFFF_FC3C-3F
        .USR_REG_X3C()            ,    // out    : Stored at 0xFFFF_FF3C
        .USR_REG_X3D()            ,    // out    : Stored at 0xFFFF_FF3D
        .USR_REG_X3E()            ,    // out    : Stored at 0xFFFF_FF3E
        .USR_REG_X3F()            ,    // out    : Stored at 0xFFFF_FF3F
    // MII interface
        .GMII_RSTn()            ,    // out    : PHY reset
        .GMII_1000M(1'b1)            ,    // in    : GMII mode (0:MII, 1:GMII)
        // TX
        .GMII_TX_CLK(GMII_TX_CLK)            ,    // in    : Tx clock
        .GMII_TX_EN(GMII_TX_EN)            ,    // out    : Tx enable
        .GMII_TXD(GMII_TXD[7:0])            ,    // out    : Tx data[7:0]
        .GMII_TX_ER(GMII_TX_ER)            ,    // out    : TX error
        // RX
        .GMII_RX_CLK(GMII_RX_CLK)            ,    // in    : Rx clock
        .GMII_RX_DV(GMII_RX_DV)            ,    // in    : Rx data valid
        .GMII_RXD (GMII_RXD[7:0])           ,    // in    : Rx data[7:0]
        .GMII_RX_ER(GMII_RX_ER)            ,    // in    : Rx error
        .GMII_CRS(1'b0)            ,    // in    : Carrier sense
        .GMII_COL(1'b0)            ,    // in    : Collision detected
        // Management IF
        .GMII_MDC()            ,    // out    : Clock for MDIO
        .GMII_MDIO_IN(1'b1)        ,    // in    : Data
        .GMII_MDIO_OUT()        ,    // out    : Data
        .GMII_MDIO_OE()        ,    // out    : MDIO output enable
    // User I/F
        .SiTCP_RST()            ,    // out    : Reset for SiTCP and related circuits
        // TCP connection control
        .TCP_OPEN_REQ(1'b0)        ,    // in    : Reserved input, shoud be 0
        .TCP_OPEN_ACK(TCP_OPEN_ACK)        ,    // out    : Acknowledge for open (=Socket busy)
        .TCP_ERROR()            ,    // out    : TCP error, its active period is equal to MSL
        .TCP_CLOSE_REQ(TCP_CLOSE_REQ)        ,    // out    : Connection close request
        .TCP_CLOSE_ACK(TCP_CLOSE_REQ)        ,    // in    : Acknowledge for closing
        // FIFO I/F
        .TCP_RX_WC(16'b0)            ,    // in    : Rx FIFO write count[15:0] (Unused bits should be set 1)
        .TCP_RX_WR(TCP_RX_WR)            ,    // out    : Write enable
        .TCP_RX_DATA(TCP_RX_DATA[7:0])            ,    // out    : Write data[7:0]
        .TCP_TX_FULL(TCP_TX_FULL)            ,    // out    : Almost full flag
        .TCP_TX_WR(TCP_TX_WR)            ,    // in    : Write enable
        .TCP_TX_DATA(TCP_TX_DATA[7:0])                // in    : Write data[7:0]
        // RBCP
        /*
        .RBCP_ACT()            ,    // out    : RBCP active
        .RBCP_ADDR()            ,    // out    : Address[31:0]
        .RBCP_WD()                ,    // out    : Data[7:0]
        .RBCP_WE()                ,    // out    : Write enable
        .RBCP_RE()                ,    // out    : Read enable
        .RBCP_ACK()            ,    // in    : Access acknowledge
        .RBCP_RD()                    // in    : Read data[7:0]*/
    );
    


    gig_ethernet_pcs_pma_0 gig_ethernet_pcs_pma_0_inst (
  .gtrefclk_p(SFP_CLK0_P),                          // input wire gtrefclk_p
  .gtrefclk_n(SFP_CLK0_N),                          // input wire gtrefclk_n
  //.gtrefclk_out(gtrefclk_out),                      // output wire gtrefclk_out
  .txn(SFP_TXN),                                        // output wire txn
  .txp(SFP_TXP),                                        // output wire txp
  .rxn(SFP_RXN),                                        // input wire rxn
  .rxp(SFP_RXP),                                        // input wire rxp
  .independent_clock_bufg(CLK_200M),  // input wire independent_clock_bufg
  .userclk_out(GMII_TX_CLK),                        // output wire userclk_out
  //.userclk2_out(userclk2_out),                      // output wire userclk2_out
  .rxuserclk_out(GMII_RX_CLK),                    // output wire rxuserclk_out
  //.rxuserclk2_out(rxuserclk2_out),                  // output wire rxuserclk2_out
  //.gtpowergood(gtpowergood),                        // output wire gtpowergood
  //.resetdone(resetdone),                            // output wire resetdone
  //.pma_reset_out(pma_reset_out),                    // output wire pma_reset_out
  //.mmcm_locked_out(mmcm_locked_out),                // output wire mmcm_locked_out
  .gmii_txd(GMII_TXD[7:0]),                              // input wire [7 : 0] gmii_txd
  .gmii_tx_en(GMII_TX_EN),                          // input wire gmii_tx_en
  .gmii_tx_er(GMII_TX_ER),                          // input wire gmii_tx_er
  .gmii_rxd(GMII_RXD[7:0]),                              // output wire [7 : 0] gmii_rxd
  .gmii_rx_dv(GMII_RX_DV),                          // output wire gmii_rx_dv
  .gmii_rx_er(GMII_RX_ER),                          // output wire gmii_rx_er
  //.gmii_isolate(gmii_isolate),                      // output wire gmii_isolate
  .configuration_vector(5'b00000),      // input wire [4 : 0] configuration_vector
  .status_vector(STATUS_VECTOR[15:0]),                    // output wire [15 : 0] status_vector
  .reset(~rst_n),                                    // input wire reset
  .signal_detect(1'b1)                    // input wire signal_detect
);
    
endmodule
