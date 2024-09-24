`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/07/13 14:51:37
// Design Name: 
// Module Name: data_package
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module data_package(
     input clk_125m,
     input rst_n,
     input [11:0]adc_data,
     input rd_fifo1,
     input rd_fifo3,
     input fifo23_start,
     output [3:0] data_fifo3_out,
     output [12:0] data_cnt_fifo3,
     output reg fifo23_end,
     output full,
     
     input fifo2_clear
    );
    
    
       reg [5:0] wr_fifo1_adr;
       reg [5:0] rd_fifo1_adr;
       reg [11:0] fifo1 [63:0];       
       wire wr_fifo2;
       assign wr_fifo2 = rd_fifo1;
       reg rd_fifo2;
       wire [11:0]  data_fifo2_out;
       wire [10:0] data_cnt_fifo2;
       reg [10:0] data_cnt_fifo2_use;
       reg wr_fifo3;
       reg [3:0]  data_fifo3_in;
       
       always @(posedge clk_125m or negedge rst_n)
       begin
         if(~rst_n)
         begin
           wr_fifo1_adr <= 0;
           rd_fifo1_adr <= 1;
         end
         else 
         begin
           wr_fifo1_adr <= wr_fifo1_adr +1;
           rd_fifo1_adr <= rd_fifo1_adr +1;
         end
       end
       
       always @(posedge clk_125m or negedge rst_n)
       begin
          if(~rst_n)
          begin
            fifo1[0] <=0;
            fifo1[1] <=0;
            fifo1[2] <=0;
            fifo1[3] <=0;
            fifo1[4] <=0;
            fifo1[5] <=0;
            fifo1[6] <=0;
            fifo1[7] <=0;
            fifo1[8] <=0;
            fifo1[9] <=0;
            fifo1[10] <=0;
            fifo1[11] <=0;
            fifo1[12] <=0;
            fifo1[13] <=0;
            fifo1[14] <=0;
            fifo1[15] <=0;  
            fifo1[16] <=0;  
            fifo1[17] <=0;  
            fifo1[18] <=0;  
            fifo1[19] <=0;  
            fifo1[20] <=0;  
            fifo1[21] <=0;  
            fifo1[22] <=0;  
            fifo1[23] <=0;  
            fifo1[24] <=0;  
            fifo1[25] <=0;  
            fifo1[26] <=0;  
            fifo1[27] <=0;  
            fifo1[28] <=0;  
            fifo1[29] <=0;  
            fifo1[30] <=0;  
            fifo1[31] <=0;  
            fifo1[32] <=0;  
            fifo1[33] <=0;  
            fifo1[34] <=0;  
            fifo1[35] <=0;  
            fifo1[36] <=0;  
            fifo1[37] <=0;  
            fifo1[38] <=0;  
            fifo1[39] <=0;  
            fifo1[40] <=0;  
            fifo1[41] <=0;  
            fifo1[42] <=0;  
            fifo1[43] <=0;  
            fifo1[44] <=0;  
            fifo1[45] <=0;  
            fifo1[46] <=0;  
            fifo1[47] <=0;  
            fifo1[48] <=0;  
            fifo1[49] <=0;  
            fifo1[50] <=0;  
            fifo1[51] <=0;  
            fifo1[52] <=0;  
            fifo1[53] <=0;  
            fifo1[54] <=0;  
            fifo1[55] <=0;  
            fifo1[56] <=0;  
            fifo1[57] <=0;  
            fifo1[58] <=0;  
            fifo1[59] <=0;  
            fifo1[60] <=0;  
            fifo1[61] <=0;  
            fifo1[62] <=0;  
            fifo1[63] <=0;  
            fifo1[64] <=0;  
            
            
          end
          else
          begin
            fifo1[wr_fifo1_adr] <= adc_data;
          end
       end
       
       
     // wire full;
      wire empty;
      wire wr_rst_busy;
      wire rd_rst_busy;
      
    reg rst_n0;
    wire rst_n1;
    assign rst_n1 = rst_n&&rst_n0;
    reg [3:0] cnt_full;
    always@(posedge clk_125m or negedge rst_n)
    begin
    if(rst_n==0)
      begin
        rst_n0<=0;
      end
    else if(full&&cnt_full == 0)
        rst_n0<=0;
    else 
        rst_n0<=1;
    end  
   always@(posedge clk_125m or negedge rst_n)
    begin
    if(rst_n==0)
      begin
        cnt_full<=0;
      end
    else if(full)
        cnt_full<=cnt_full+1;
    end  
      
       
    fifo2 adc_fifo2 (
         .clk(clk_125m),                  // input wire clk
         .rst(~rst_n1 || fifo2_clear),                  // input wire rst changed
         .din(fifo1[rd_fifo1_adr]),                  // input wire [11 : 0] din
         .wr_en(wr_fifo2),              // input wire wr_en
         .rd_en(rd_fifo2),              // input wire rd_en
         .dout(data_fifo2_out),                // output wire [11 : 0] dout
         .full(full),                // output wire full
         .empty(empty),              // output wire empty
         .data_count(data_cnt_fifo2),    // output wire [7 : 0] data_count
         .wr_rst_busy(wr_rst_busy),  // output wire wr_rst_busy
         .rd_rst_busy(rd_rst_busy)  // output wire rd_rst_busy
       );
     
       


wire full3;
wire empty3;

localparam IDLE23 = 0;
localparam START23 =1;
localparam SEND23 = 2;       
localparam END23 = 3;
reg [3:0] state23;       
reg [3:0] next_state23;  
reg [11:0] cnt23;
reg [1:0] cnt_data_state;
 always @ (posedge clk_125m or negedge rst_n)
 begin
     if(~rst_n)
     begin
     state23 <= IDLE23;
     end
     else
     begin
     state23 <= next_state23;
     end
 end     

always @(*)
begin
  case (state23)
  IDLE23:
    begin
    if(fifo23_start == 1)
    next_state23 <= START23;
    else
    next_state23 <= IDLE23;
    end
  START23:
    begin
    next_state23 <= SEND23;
    end
  SEND23:
    begin
    if(cnt23 == data_cnt_fifo2_use)
    next_state23 <= END23;
    else
    next_state23 <= SEND23;
    end
  END23:
    begin
     next_state23 <=IDLE23;
    end
  endcase
end
       
 always @ (posedge clk_125m or negedge rst_n)
 begin
     if(~rst_n)
     begin
       data_cnt_fifo2_use  <= 0;
     end
     else if(state23 == START23)
     begin
//       data_cnt_fifo2_use <=(full) ?11'b11111_111111: data_cnt_fifo2;
        data_cnt_fifo2_use <= data_cnt_fifo2;
     end
     else if(state23 == IDLE23 ||state23 == END23)
     begin
       data_cnt_fifo2_use <= 0;
     end
 end
 always @ (posedge clk_125m or negedge rst_n)
 begin
     if(~rst_n)
     begin
       cnt_data_state  <= 0;
       cnt23 <= 0;
     end
     else if(state23 == SEND23)
      begin
        cnt_data_state = cnt_data_state +1; 
        if(cnt_data_state == 3)
        begin
        cnt_data_state = 0;
        cnt23 <=cnt23+1;
        end
      end
     else 
      begin
        cnt_data_state <= 0;
        cnt23 <= 0;
      end
 end
 always @ (posedge clk_125m or negedge rst_n)
  begin
      if(~rst_n)
      begin
        rd_fifo2 <=0;
        data_fifo3_in <= 0;
      end
      /*else if (state23 == START23&&state23 == next_state23)
      begin
        rd_fifo2 <=1;
        data_fifo3_in <= 0;
      end*/
      //case0 is set as rd_fifo2=1 instead of case2 now, see if it can fix the misplacement
      else if (state23 == SEND23)
      begin
         case (cnt_data_state)
         0:
         begin
           rd_fifo2 <=1;
           data_fifo3_in <= data_fifo2_out[11:8];
         end
         1:
         begin
           rd_fifo2 <=0;
           data_fifo3_in <= data_fifo2_out[7:4];
         end
         2:
         begin
           rd_fifo2 <=0;
           data_fifo3_in <= data_fifo2_out[3:0];
         end
         default:
         begin
            rd_fifo2 <=0;
            data_fifo3_in <= 0;
         end
         endcase
      end
      else
      begin
         rd_fifo2 <=0;
         data_fifo3_in <= 0;
      end
  end
   always @ (posedge clk_125m or negedge rst_n)
   begin
       if(~rst_n)
       begin
         wr_fifo3<=0;
       end
       else if (state23 == SEND23&&state23 == next_state23)//(next_state23 == SEND23)
       begin
         wr_fifo3<=1;
       end
       else 
       begin
         wr_fifo3<=0;
       end
   end
 always @ (posedge clk_125m or negedge rst_n)
   begin
       if(~rst_n)
       begin
         fifo23_end<=0;
       end
       else if (state23 == END23|| (state23 == IDLE23&& state23 == next_state23))//(next_state23 == SEND23)
       begin
         fifo23_end<=1;
       end
       else 
       begin
         fifo23_end<=0;
       end
   end
       
fifo3 adc_fifo3 (
   .clk(clk_125m),                  // input wire clk
   .rst(~rst_n || fifo2_clear),                  // input wire rst
   .din(data_fifo3_in),                  // input wire [3 : 0] din
   .wr_en(wr_fifo3),              // input wire wr_en
   .rd_en(rd_fifo3),              // input wire rd_en
   .dout(data_fifo3_out),                // output wire [3 : 0] dout
   .full(full3),                // output wire full
   .empty(empty3),              // output wire empty
   .data_count(data_cnt_fifo3),    // output wire [12 : 0] data_count
   .wr_rst_busy(),  // output wire wr_rst_busy
   .rd_rst_busy()  // output wire rd_rst_busy
 );
       
 ila_2 uut_3(
 .clk(clk_125m),
 .probe0(state23),
 .probe1(next_state23),
 .probe2(adc_data),//12
 .probe3(fifo1[rd_fifo1_adr]),//12
 .probe4(data_fifo2_out),//12
 .probe5(data_fifo3_in),//4
 .probe6(rd_fifo2),//1
 .probe7(data_cnt_fifo2),//11
 .probe8(data_cnt_fifo2_use),//11
 .probe9(cnt23),//12
 .probe10(rd_fifo1),
 .probe11(wr_fifo2),
 .probe12(clk_125m),
 .probe13(full),
 .probe14(empty),
 .probe15(wr_rst_busy),
 .probe16(rd_rst_busy),
 .probe17(wr_fifo3),
 .probe18(fifo23_end),
 .probe19(rd_fifo3),
 .probe20(data_cnt_fifo3),//13
 .probe21(data_fifo3_out),//4
 .probe22(full3),
 .probe23(empty3),
 .probe24(cnt_data_state),
 .probe25(fifo2_clear)
 );
       
       
 
       
       
// always @ (posedge clk_125m or negedge rst_n)
// begin
//     if(~rst_n)
//     begin
//     end
//     else
//     begin
//     end
// end

endmodule
