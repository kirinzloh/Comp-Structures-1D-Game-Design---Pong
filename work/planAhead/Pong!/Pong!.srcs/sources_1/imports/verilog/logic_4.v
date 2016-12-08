/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module logic_4 (
    input clk,
    input rst,
    input btnStart,
    input [7:0] scoreA,
    input [7:0] scoreB,
    output reg [1:0] playing
  );
  
  
  
  wire [1-1:0] M_start_out;
  reg [1-1:0] M_start_in;
  edge_detector_12 start (
    .clk(clk),
    .in(M_start_in),
    .out(M_start_out)
  );
  wire [1-1:0] M_button_cond_out;
  reg [1-1:0] M_button_cond_in;
  button_conditioner_13 button_cond (
    .clk(clk),
    .in(M_button_cond_in),
    .out(M_button_cond_out)
  );
  localparam MAINSCREEN_state = 1'd0;
  localparam GAMEON_state = 1'd1;
  
  reg M_state_d, M_state_q = MAINSCREEN_state;
  reg [1:0] M_playingtemp_d, M_playingtemp_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_playingtemp_d = M_playingtemp_q;
    
    M_button_cond_in = btnStart;
    M_start_in = M_button_cond_out;
    playing = M_playingtemp_q;
    
    case (M_state_q)
      MAINSCREEN_state: begin
        M_playingtemp_d = 1'h0;
        if (M_start_out == 1'h1 && scoreA < 3'h7 && scoreB < 3'h7) begin
          M_playingtemp_d = 1'h1;
          playing = M_playingtemp_q;
          M_state_d = GAMEON_state;
        end
      end
      GAMEON_state: begin
        if (M_start_out == 1'h1) begin
          M_playingtemp_d = 1'h0;
          playing = M_playingtemp_q;
          M_state_d = MAINSCREEN_state;
        end
        if (scoreA > 3'h7) begin
          M_playingtemp_d = 2'h2;
          playing = M_playingtemp_q;
        end else begin
          if (scoreB > 3'h7) begin
            M_playingtemp_d = 2'h3;
            playing = M_playingtemp_q;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_playingtemp_q <= 1'h0;
    end else begin
      M_playingtemp_q <= M_playingtemp_d;
    end
  end
  
endmodule