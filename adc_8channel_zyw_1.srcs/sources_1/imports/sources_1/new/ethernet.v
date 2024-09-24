`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/08/14 09:50:50
// Design Name: 
// Module Name: ethernet
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


module ethernet(
		input          		clk_50m,
		input               clk_125m,
		input          		rst_n,

		output         		e_mdc,
		inout          		e_mdio,
		output		reg		e_reset,
				
		output [3:0]   		rgmii_txd,
		output         		rgmii_txctl,
		output         		rgmii_txc,
		input  [3:0]   		rgmii_rxd,
		input          		rgmii_rxctl,
		input          		rgmii_rxc,

        input               active,
        input               locked,
        input [3:0]         data,
        input [15:0]        length,             
        output              rd_en ,
        input               empty5
    );


//wire sys_clk;
//wire locked ;
reg  [4:0]rst_delay;
//assign e_reset = 1'b1 ;

//while the first author didn't include the negedge rst_n part
always@(posedge clk_50m or negedge rst_n)
begin
  if(!rst_n)
    rst_delay<=5'd0;
  else 
    rst_delay<=rst_delay+5'd1;
end

always@(posedge clk_50m or negedge rst_n)
begin
  if(!rst_n)
    e_reset<= 1'd0;
  else if(rst_delay==5'd19) 
    e_reset<= 1'd1;
  else
    e_reset<= e_reset;
end

      
// ethernet_test#
// (
//	 .MAC_ADDR (48'h00_0a_35_01_fe_c2),
//	 .IP_ADDR  (32'hc0a80007)
// )
ethernet_test eth2
 (
  .rst_n         (locked      ),
  .sys_clk 	     (clk_50m 	  ),
  .sys_clk2      (clk_125m    ),
  .e_mdc         (e_mdc      ),
  .e_mdio        (e_mdio     ),
  .rgmii_txd     (rgmii_txd  ),
  .rgmii_txctl   (rgmii_txctl),
  .rgmii_txc     (rgmii_txc  ),
  .rgmii_rxd     (rgmii_rxd  ),
  .rgmii_rxctl   (rgmii_rxctl),
  .rgmii_rxc     (rgmii_rxc  ),
  
  
  .active        (active),
  .data          (data),
  .length        (length),
  .rd_en5         (rd_en),
  .empty5         (empty5)
  
  
 );


 
 
 
 
endmodule

