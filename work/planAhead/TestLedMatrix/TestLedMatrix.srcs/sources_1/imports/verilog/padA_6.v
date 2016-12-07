/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module paddleA_6 (
    input clk,
    input rst,
    input playing,
    input btnLeft,
    input btnRight,
    output reg [3:0] padA
  );
  
  
  
  wire [1-1:0] M_edge_detector_left_out;
  reg [1-1:0] M_edge_detector_left_in;
  edge_detector_12 edge_detector_left (
    .clk(clk),
    .in(M_edge_detector_left_in),
    .out(M_edge_detector_left_out)
  );
  wire [1-1:0] M_edge_detector_right_out;
  reg [1-1:0] M_edge_detector_right_in;
  edge_detector_12 edge_detector_right (
    .clk(clk),
    .in(M_edge_detector_right_in),
    .out(M_edge_detector_right_out)
  );
  wire [1-1:0] M_button_cond_left_out;
  reg [1-1:0] M_button_cond_left_in;
  button_conditioner_14 button_cond_left (
    .clk(clk),
    .in(M_button_cond_left_in),
    .out(M_button_cond_left_out)
  );
  wire [1-1:0] M_button_cond_right_out;
  reg [1-1:0] M_button_cond_right_in;
  button_conditioner_14 button_cond_right (
    .clk(clk),
    .in(M_button_cond_right_in),
    .out(M_button_cond_right_out)
  );
  localparam GAMEON_state = 2'd0;
  localparam GAMESTART_state = 2'd1;
  localparam LEFTBTNWAIT_state = 2'd2;
  localparam RIGHTBTNWAIT_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = GAMESTART_state;
  reg [3:0] M_padAtemp_d, M_padAtemp_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_padAtemp_d = M_padAtemp_q;
    
    padA = M_padAtemp_q;
    M_button_cond_left_in = btnLeft;
    M_edge_detector_left_in = M_button_cond_left_out;
    M_button_cond_right_in = btnRight;
    M_edge_detector_right_in = M_button_cond_right_out;
    
    case (M_state_q)
      GAMESTART_state: begin
        M_padAtemp_d = 1'h0;
        M_state_d = GAMEON_state;
      end
      GAMEON_state: begin
        if (playing == 1'h1) begin
          if (M_edge_detector_left_out == 1'h1 && M_padAtemp_q > 1'h1) begin
            M_padAtemp_d = M_padAtemp_q - 1'h1;
            padA = M_padAtemp_q;
            M_state_d = LEFTBTNWAIT_state;
          end
          if (M_edge_detector_right_out == 1'h1 && M_padAtemp_q < 4'he) begin
            M_padAtemp_d = M_padAtemp_q + 1'h1;
            padA = M_padAtemp_q;
            M_state_d = RIGHTBTNWAIT_state;
          end
        end
      end
      LEFTBTNWAIT_state: begin
        if (playing == 1'h1) begin
          if (M_edge_detector_left_out == 1'h0) begin
            M_state_d = GAMEON_state;
          end
        end
      end
      RIGHTBTNWAIT_state: begin
        if (playing == 1'h1) begin
          if (M_edge_detector_right_out == 1'h0) begin
            M_state_d = GAMEON_state;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_padAtemp_q <= 1'h0;
    end else begin
      M_padAtemp_q <= M_padAtemp_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h1;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
