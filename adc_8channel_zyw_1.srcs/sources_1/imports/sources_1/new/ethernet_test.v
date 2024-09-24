`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/05 09:57:18
// Design Name: 
// Module Name: ethernet_test
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
`timescale 1ns / 1ps  
module ethernet_test
(
 input          rst_n,
 input          sys_clk,   
 input          sys_clk2,
// output [3:0]   led,
 output         e_mdc,
 inout          e_mdio,
 
 output [3:0]   rgmii_txd,
 output         rgmii_txctl,
 output         rgmii_txc,
 input  [3:0]   rgmii_rxd,
 input          rgmii_rxctl,
 input          rgmii_rxc,
 
 input         active,
 input [3:0]   data,
 input [15:0]  length,
 output        rd_en5,
 input        empty5
);
//mask1
reg [3:0] test_txd;
always@(posedge sys_clk2)
begin
   test_txd <= rgmii_txd;
end
(* MARK_DEBUG="true" *)wire   [ 7:0]   gmii_txd     ;
(* MARK_DEBUG="true" *)wire            gmii_tx_en   ;
wire            gmii_tx_er   ;
wire            gmii_tx_clk  ;
wire            gmii_crs     ;
wire            gmii_col     ;
wire   [ 7:0]   gmii_rxd     ;
wire            gmii_rx_dv   ;
wire            gmii_rx_er   ;
wire            gmii_rx_clk  ;

wire  [31:0]    pack_total_len ;
wire            duplex_mode;     // 1 full, 0 half

assign duplex_mode = 1'b1;//make the message send from twice

wire [1:0]      speed      ;
wire            link       ;
(* MARK_DEBUG="true" *)wire            e_rx_dv    ;
(* MARK_DEBUG="true" *)wire [7:0]      e_rxd      ;
wire            e_tx_en    ;
wire [7:0]      e_txd      ;
wire            e_rst_n    ;



//speed arbitration
gmii_arbi arbi_inst
(
 .clk                (gmii_tx_clk      ),
 .rst_n              (rst_n            ),
 .speed              (speed            ),  
 .link               (link             ), 
 .pack_total_len     (pack_total_len   ), 
 .e_rst_n            (e_rst_n          ),
 .gmii_rx_dv         (gmii_rx_dv       ),
 .gmii_rxd           (gmii_rxd         ),
 .gmii_tx_en         (gmii_tx_en       ),
 .gmii_txd           (gmii_txd         ), 
 .e_rx_dv            (e_rx_dv          ),
 .e_rxd              (e_rxd            ),
 .e_tx_en            (e_tx_en          ),
 .e_txd              (e_txd            )

 
);



smi_config  smi_config_inst
       (
        .clk         (sys_clk  ),
        .rst_n       (rst_n    ),		 
        .mdc         (e_mdc    ),
        .mdio        (e_mdio   ),
        .speed       (speed    ),
        .link        (link     )
       );
	
util_gmii_to_rgmii util_gmii_to_rgmii_m0
(
 .reset                  (~rst_n           ),
 
 .rgmii_td               (rgmii_txd       ),
 .rgmii_tx_ctl           (rgmii_txctl     ),
 .rgmii_txc              (rgmii_txc       ),
 .rgmii_rd               (rgmii_rxd       ),
 .rgmii_rx_ctl           (rgmii_rxctl     ),
 .rgmii_rxc              (rgmii_rxc       ),
                                          
 .gmii_txd               (e_txd           ),
 .gmii_tx_en             (e_tx_en         ),
 .gmii_tx_er             (1'b0            ),
 .gmii_tx_clk            (gmii_tx_clk     ),
 .gmii_crs               (gmii_crs        ),
 .gmii_col               (gmii_col        ),
 .gmii_rxd               (gmii_rxd        ),
 .gmii_rx_dv             (gmii_rx_dv      ),
 .gmii_rx_er             (gmii_rx_er      ),
 .gmii_rx_clk            (gmii_rx_clk     ),
 .duplex_mode            (duplex_mode     )
);

	
mac_test mac_test0
(
 .gmii_tx_clk            (gmii_tx_clk     ),
 .gmii_rx_clk            (gmii_rx_clk     ),
 .rst_n                  (e_rst_n         ),

 .pack_total_len         (32'd2500  ),
 .gmii_rx_dv             (e_rx_dv         ),
 .gmii_rxd               (e_rxd           ),
 .gmii_tx_en             (gmii_tx_en      ),
 .gmii_txd               (gmii_txd        ),
 
 .length                 (length),
 .active                 (active),
 .data                   (data),
 .rd_en                  (rd_en5),
 .empty5                 (empty5)
); 

//wire rd_en;
//reg pre_req;
//reg cur_req;
//always @ ( posedge sys_clk2 or negedge rst_n)
//begin
//  if(~rst_n)
//    begin
//       pre_req <= 0;
//       cur_req <= 0;
//       rd_fifo5 <=0;
//    end
//  else
//  begin
//    cur_req = sd_sec_write_data_req;
//    if(cur_req&&(~pre_req))
//      begin
//    rd_fifo4 <= 1;
//     end
////    else if(sd_wr_start)
////     begin
////    rd_fifo4<=1;
////     end
//    else
//     begin
//    rd_fifo4 <= 0;
//     end
//    pre_req = cur_req;
//  end  
// end
	 
//	 error:partially routed nets
/*
wire [3:0] rgmii_txd_check;
wire fifo_full;
wire fifo_empty;
wire fifo_wr_busy;
wire fifo_rd_busy;


fifo_ether fifo_ether_inst (
  .clk(rgmii_txc),                  // input wire clk
  .srst(rst_n),                // input wire srst
  .din(rgmii_txd),                  // input wire [3 : 0] din
  .wr_en(1'b1),              // input wire wr_en
  .rd_en(1'b1),              // input wire rd_en
  .dout(rgmii_txd_check),                // output wire [3 : 0] dout
  .full(fifo_full),                // output wire full
  .empty(fifo_empty),              // output wire empty
  .wr_rst_busy(fifo_wr_busy),  // output wire wr_rst_busy
  .rd_rst_busy(fifo_rd_busy)  // output wire rd_rst_busy
);*/

//ila_7 ether_ila (
//	.clk(sys_clk2), // input wire clk


//	.probe0(test_txd) // input wire [3:0] probe0
//);
    
endmodule