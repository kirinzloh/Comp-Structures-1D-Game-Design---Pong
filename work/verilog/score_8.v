/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module score_8 (
    input clk,
    input rst,
    input [1:0] playing,
    input [3:0] ballY,
    output reg [7:0] scoreA,
    output reg [7:0] scoreB
  );
  
  
  
  localparam GAMEON_state = 1'd0;
  localparam GAMESTART_state = 1'd1;
  
  reg M_state_d, M_state_q = GAMESTART_state;
  reg [7:0] M_scoreAtemp_d, M_scoreAtemp_q = 1'h0;
  reg [7:0] M_scoreBtemp_d, M_scoreBtemp_q = 1'h0;
  
  reg [7:0] alu_output;
  
  wire [1-1:0] M_alu_sub_overflow;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  wire [8-1:0] M_alu_alu_output;
  reg [6-1:0] M_alu_alufn;
  reg [8-1:0] M_alu_a;
  reg [8-1:0] M_alu_b;
  alu_18 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .sub_overflow(M_alu_sub_overflow),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n),
    .alu_output(M_alu_alu_output)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_scoreAtemp_d = M_scoreAtemp_q;
    M_scoreBtemp_d = M_scoreBtemp_q;
    
    scoreA = M_scoreAtemp_q;
    scoreB = M_scoreBtemp_q;
    M_alu_alufn = 6'h00;
    M_alu_a = M_scoreAtemp_q;
    M_alu_b = 8'h01;
    alu_output = M_alu_alu_output;
    
    case (M_state_q)
      GAMESTART_state: begin
        M_scoreAtemp_d = 8'h00;
        M_scoreBtemp_d = 8'h00;
        M_state_d = GAMEON_state;
      end
      GAMEON_state: begin
        if (playing == 1'h1) begin
          if (ballY == 1'h0) begin
            M_alu_alufn = 6'h00;
            M_alu_a = M_scoreBtemp_q;
            M_alu_b = 8'h01;
            alu_output = M_alu_alu_output;
            M_scoreBtemp_d = alu_output;
            scoreB = M_scoreBtemp_q;
          end else begin
            if (ballY == 4'hf) begin
              M_alu_alufn = 6'h00;
              M_alu_a = M_scoreAtemp_q;
              M_alu_b = 8'h01;
              alu_output = M_alu_alu_output;
              M_scoreAtemp_d = alu_output;
              scoreA = M_scoreAtemp_q;
            end
          end
        end else begin
          if (playing == 1'h0) begin
            M_state_d = GAMESTART_state;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_scoreAtemp_q <= 1'h0;
      M_scoreBtemp_q <= 1'h0;
    end else begin
      M_scoreAtemp_q <= M_scoreAtemp_d;
      M_scoreBtemp_q <= M_scoreBtemp_d;
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
