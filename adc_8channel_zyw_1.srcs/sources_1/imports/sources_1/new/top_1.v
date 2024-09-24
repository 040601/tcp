`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/04 15:00:49
// Design Name: 
// Module Name: top
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


module top(
//for all
input sys_clk_p,
input sys_clk_n,
input rst_n,
output fan_pwm,
//test
output  [3:0]led,//led for which channel is working
//for adc board1
    output                    board1_adc1_clk_ref,//clk to first AD9627
	output                    board1_adc2_clk_ref,//clk to second AD9627
	
	output                    board1_adc1_spi_ce, //adc1 chip spi select
	output                    board1_adc1_spi_sclk,//adc1 spi clk
	inout                     board1_adc1_spi_io,  //spi data
	input                     board1_adc1_clk_p,  //adc1 clk from ad9627
	input                     board1_adc1_clk_n,	
	input[11:0]               board1_adc1_data_p, //adc1 data
	input[11:0]               board1_adc1_data_n,

	output                    board1_adc2_spi_ce,//adc2 chip spi select
	output                    board1_adc2_spi_sclk,//adc2 spi clk
	inout                     board1_adc2_spi_io,//spi data
	input                     board1_adc2_clk_p,//adc2 clk from ad9627
	input                     board1_adc2_clk_n,
	input[11:0]               board1_adc2_data_p,//adc2 data
	input[11:0]               board1_adc2_data_n,
//for adc board1
    output                    board2_adc1_clk_ref,//clk to first AD9627
    output                    board2_adc2_clk_ref,//clk to second AD9627
        
    output                    board2_adc1_spi_ce, //adc1 chip spi select
    output                    board2_adc1_spi_sclk,//adc1 spi clk
    inout                     board2_adc1_spi_io,  //spi data
    input                     board2_adc1_clk_p,  //adc1 clk from ad9627
    input                     board2_adc1_clk_n,    
    input[11:0]               board2_adc1_data_p, //adc1 data
    input[11:0]               board2_adc1_data_n,
    
    output                    board2_adc2_spi_ce,//adc2 chip spi select
    output                    board2_adc2_spi_sclk,//adc2 spi clk
    inout                     board2_adc2_spi_io,//spi data
    input                     board2_adc2_clk_p,//adc2 clk from ad9627
    input                     board2_adc2_clk_n,
    input[11:0]               board2_adc2_data_p,//adc2 data
    input[11:0]               board2_adc2_data_n,
    
    output                    sd_ncs,
    output                    sd_dclk,
    output                    sd_mosi,
    input                     sd_miso,
    
    //for ethernet2
     output                   e_mdc,
     inout                    e_mdio,
     output                   e_reset,
                   
     output [3:0]             rgmii_txd,
     output                   rgmii_txctl,
     output                   rgmii_txc, 
     input  [3:0]             rgmii_rxd,
     input                    rgmii_rxctl,
     input                    rgmii_rxc,
     
     
     output                   e_mdc_2,
          inout                    e_mdio_2,
          output                   e_reset_2,
                        
          output [3:0]             rgmii_txd_2,
          output                   rgmii_txctl_2,
          output                   rgmii_txc_2, 
          input  [3:0]             rgmii_rxd_2,
          input                    rgmii_rxctl_2,
          input                    rgmii_rxc_2,
          //input                           uart_rx,//串口接收
          //output                          uart_tx//串口发送
          
      //for tcp
      output SFP1_TX_P,
      output SFP1_TX_N,
      input SFP1_RX_P,
      input SFP1_RX_N,
      output SFP1_TX_DIS,    
      output    SFP1_LOSS,
      input    SFP_CLK0_P,
      input    SFP_CLK0_N
          
      
    );
    wire clk_50m;
    wire clk_125m;
    wire clk_200m;
    wire locked;
   // wire [3:0] adc_numbering;
    assign fan_pwm=1'b1;

    assign board1_adc1_clk_ref = clk_125m;
    assign board1_adc2_clk_ref = clk_125m;
    assign board2_adc1_clk_ref = clk_125m;
    assign board2_adc2_clk_ref = clk_125m;
    
    wire [11:0] board1_adc1_a;
    wire [11:0] board1_adc1_b;
    wire [11:0] board1_adc2_a;
    wire [11:0] board1_adc2_b;
    wire [11:0] board2_adc1_a;
    wire [11:0] board2_adc1_b;
    wire [11:0] board2_adc2_a;
    wire [11:0] board2_adc2_b;
    wire rd_en_fifo4;
    wire rd_en_fifo5;
    
    wire empty5;
    wire [3:0] data_fifo4_out;
    wire [3:0] data_fifo5_out;
    //assign led = adc_numbering;
    //unuseful
   wire [15:0] data_fifo4_cnt;
   wire [15:0] data_fifo5_cnt;
   wire sd_wr_start;
   wire eth_wr_start;
   
   //second ethernet
    wire rd_en_fifo6;
    wire empty6;
    wire [3:0] data_fifo6_out;
    wire [15:0] data_fifo6_cnt;
    wire eth2_wr_start;
    
adc_board adc_board1(
    .rst_n(rst_n),
    
    .clk_50m(clk_50m),
    .clk_125m(clk_125m),
    
	.adc1_spi_ce(board1_adc1_spi_ce),//chip select
	.adc1_spi_sclk(board1_adc1_spi_sclk),//clk for spi
	.adc1_spi_io(board1_adc1_spi_io),  //spi data
	
	.adc1_clk_p(board1_adc1_clk_p),  //adc1 clk from ad9627
	.adc1_clk_n(board1_adc1_clk_n),	
	.adc1_data_p(board1_adc1_data_p), //adc1 data
	.adc1_data_n(board1_adc1_data_n),

	.adc2_spi_ce(board1_adc2_spi_ce),//chip select
    .adc2_spi_sclk(board1_adc2_spi_sclk),//clk for spi
    .adc2_spi_io(board1_adc2_spi_io),  //spi data
        
    .adc2_clk_p(board1_adc2_clk_p),  //adc2 clk from ad9627
    .adc2_clk_n(board1_adc2_clk_n),    
    .adc2_data_p(board1_adc2_data_p), //adc2 data
    .adc2_data_n(board1_adc2_data_n),
    
    .adc1_data_a(board1_adc1_a),
    .adc1_data_b(board1_adc1_b),
    .adc2_data_a(board1_adc2_a),
    .adc2_data_b(board1_adc2_b),
    
    .locked(locked)
);

adc_board adc_board2(
    .rst_n(rst_n),
    
    .clk_50m(clk_50m),
    .clk_125m(clk_125m),
    
	.adc1_spi_ce(board2_adc1_spi_ce),//chip select
	.adc1_spi_sclk(board2_adc1_spi_sclk),//clk for spi
	.adc1_spi_io(board2_adc1_spi_io),  //spi data
	
	.adc1_clk_p(board2_adc1_clk_p),  //adc1 clk from ad9627
	.adc1_clk_n(board2_adc1_clk_n),	
	.adc1_data_p(board2_adc1_data_p), //adc1 data
	.adc1_data_n(board2_adc1_data_n),

	.adc2_spi_ce(board2_adc2_spi_ce),//chip select
    .adc2_spi_sclk(board2_adc2_spi_sclk),//clk for spi
    .adc2_spi_io(board2_adc2_spi_io),  //spi data
        
    .adc2_clk_p(board2_adc2_clk_p),  //adc2 clk from ad9627
    .adc2_clk_n(board2_adc2_clk_n),    
    .adc2_data_p(board2_adc2_data_p), //adc2 data
    .adc2_data_n(board2_adc2_data_n),
    
    .adc1_data_a(board2_adc1_a),
    .adc1_data_b(board2_adc1_b),
    .adc2_data_a(board2_adc2_a),
    .adc2_data_b(board2_adc2_b),
    
    .locked(locked)
);
wire [7:0] TCP_TX_DATA;
wire fifo_tcp_empty;
wire fifo_tcp_rden;
wire TCP_TX_FULL;
wire TCP_TX_WR;

assign fifo_tcp_rden = (~fifo_tcp_empty)&(~TCP_TX_FULL);

data_processing data(
   .clk_125m(clk_125m),
   .rd_clk(rgmii_rxc),
   .rd_clk_2(rgmii_rxc_2),
   .rst_n(rst_n),

   .board1_adc1_a(board1_adc1_a),
   .board1_adc1_b(board1_adc1_b),
   .board1_adc2_a(board1_adc2_a),
   .board1_adc2_b(board1_adc2_b),
   .board2_adc1_a(board2_adc1_a),
   .board2_adc1_b(board2_adc1_b),
   .board2_adc2_a(board2_adc2_a),
   .board2_adc2_b(board2_adc2_b),
   .rd_en_fifo4(rd_en_fifo4),
   .rd_en_fifo5(rd_en_fifo5),
   .data_fifo4_out(data_fifo4_out),
   .data_fifo5_out(data_fifo5_out),
   .data_length(data_fifo4_cnt),
   .data_length_fifo5(data_fifo5_cnt),
   .sd_wr_start(sd_wr_start),
   .eth_wr_start(eth_wr_start),
   .led(led),
   .empty5(empty5),
   //second ether
   .rd_en_fifo6(rd_en_fifo6),
   .data_fifo6_out(data_fifo6_out),
   .data_length_fifo6(data_fifo6_cnt),
   .eth2_wr_start(eth2_wr_start),
   .empty6(empty6),
   
   .clk_200m(clk_200m),
   .data_tcp(TCP_TX_DATA),
   .fifo_tcp_empty(fifo_tcp_empty),
   .fifo_tcp_rden(fifo_tcp_rden),
   .tcp_wr_en(TCP_TX_WR)
   
);
sd_card_test   wr_sd(
      .sys_clk(clk_50m),
      .sys_clk2(clk_125m),
      .rst_n(rst_n),
//sd卡接口
      .sd_ncs(sd_ncs),
      .sd_dclk(sd_dclk),
      .sd_mosi(sd_mosi),
      .sd_miso(sd_miso),
//
       .sd_wr_start(sd_wr_start),
       .sd_wr_data(data_fifo4_out),
       .rd_fifo4(rd_en_fifo4),
       .data_length( data_fifo4_cnt)
);
//wire [3:0] rgmii_txd;
ethernet ethernet2(
    .clk_50m(clk_50m),
    .clk_125m(clk_125m),
    .rst_n(rst_n),
    
    .e_mdc(e_mdc),
    .e_mdio(e_mdio),
    .e_reset(e_reset),
                    
    .rgmii_txd(rgmii_txd),
    .rgmii_txctl(rgmii_txctl),
    .rgmii_txc(rgmii_txc),
    .rgmii_rxd(rgmii_rxd),
    .rgmii_rxctl(rgmii_rxctl),
    .rgmii_rxc(rgmii_rxc),
    
    .active(eth_wr_start),
    .locked(locked),
    .data(data_fifo5_out),
    .length(data_fifo5_cnt),
    .rd_en(rd_en_fifo5),
    .empty5(empty5)
);

ethernet ethernet2_2(
    .clk_50m(clk_50m),
    .clk_125m(clk_125m),
    .rst_n(rst_n),
    
    .e_mdc(e_mdc_2),
    .e_mdio(e_mdio_2),
    .e_reset(e_reset_2),
                    
    .rgmii_txd(rgmii_txd_2),
    .rgmii_txctl(rgmii_txctl_2),
    .rgmii_txc(rgmii_txc_2),
    .rgmii_rxd(rgmii_rxd_2),
    .rgmii_rxctl(rgmii_rxctl_2),
    .rgmii_rxc(rgmii_rxc_2),
    
    .active(eth2_wr_start),
    .locked(locked),
    .data(data_fifo6_out),
    .length(data_fifo6_cnt),
    .rd_en(rd_en_fifo6),
    .empty5(empty6)
);

sitcp_test  sitcp_test_inst (
        // input //
        .CLK_200M            ( clk_200m            ),
        .CLK_125M            (clk_125m),
        //.SGMII_CLK_P         ( SGMII_CLK_P         ),
        //.SGMII_CLK_N         ( SGMII_CLK_N         ),
        .rst_n               ( rst_n ),
        .SFP_RXP             ( SFP1_RX_P             ),
        .SFP_RXN             ( SFP1_RX_N             ),
        //.RBCP_RD             ( RBCP_RD      [7:0]  ),
        //.RBCP_ACK            ( RBCP_ACK            ),
        //.TCP_RX_WC           ( TCP_RX_WC    [15:0] ),
        .TCP_TX_WR           ( TCP_TX_WR           ),
        .TCP_TX_DATA         ( TCP_TX_DATA  [7:0]  ),
        // output //
        .SFP_TXP             ( SFP1_TX_P             ),
        .SFP_TXN             ( SFP1_TX_N             ),
        .TX_DISABLE          (  ),
        //.LED                 (   ),
        //.RBCP_ADDR           ( RBCP_ADDR    [31:0] ),
        //.RBCP_WD             ( RBCP_WD      [7:0]  ),
        //.RBCP_WE             ( RBCP_WE             ),
        //.RBCP_RE             ( RBCP_RE             ),
        .TCP_RX_WR           (    ),
        .TCP_RX_DATA         (   ),
        .TCP_TX_FULL         ( TCP_TX_FULL         ),
        .TCP_OPEN_ACK        (     ),
        .SFP_CLK0_P(SFP_CLK0_P),
        .SFP_CLK0_N(SFP_CLK0_N)

        //.IIC_SCL             (IIC_SCL),
        //.IIC_SDA             (IIC_SDA)
    );





sys_clk_mmcm clk_for_all(
  // Clock out ports
   .clk_out1(clk_50m),     // output clk_out1
   .clk_out2(clk_125m),     // output clk_out2
   .clk_out3(clk_200m),
   // Status and control signals
   .resetn(rst_n), // input resetn
   .locked(locked),       // output locked
  // Clock in ports
  .clk_in1_p(sys_clk_p),    // input clk_in1_p
  .clk_in1_n(sys_clk_n)
);




endmodule
