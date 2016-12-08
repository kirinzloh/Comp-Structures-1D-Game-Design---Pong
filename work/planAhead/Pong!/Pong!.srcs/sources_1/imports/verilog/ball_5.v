/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module ball_5 (
    input clk,
    input rst,
    input [1:0] playing,
    input [3:0] padA,
    input [3:0] padB,
    output reg [3:0] ballX,
    output reg [3:0] ballY
  );
  
  
  
  localparam GAMEON_state = 1'd0;
  localparam GAMESTART_state = 1'd1;
  
  reg M_state_d, M_state_q = GAMESTART_state;
  reg [22:0] M_counter_d, M_counter_q = 1'h0;
  reg [7:0] M_hitcounter_d, M_hitcounter_q = 1'h0;
  reg [22:0] M_ballspeed_d, M_ballspeed_q = 1'h0;
  reg [3:0] M_ballXtemp_d, M_ballXtemp_q = 1'h0;
  reg [3:0] M_ballYtemp_d, M_ballYtemp_q = 1'h0;
  reg M_directionX_d, M_directionX_q = 1'h0;
  reg M_directionY_d, M_directionY_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_hitcounter_d = M_hitcounter_q;
    M_ballXtemp_d = M_ballXtemp_q;
    M_ballspeed_d = M_ballspeed_q;
    M_counter_d = M_counter_q;
    M_directionY_d = M_directionY_q;
    M_directionX_d = M_directionX_q;
    M_ballYtemp_d = M_ballYtemp_q;
    
    ballX = M_ballXtemp_q;
    ballY = M_ballYtemp_q;
    
    case (M_state_q)
      GAMESTART_state: begin
        M_ballspeed_d = 23'h7a1200;
        M_hitcounter_d = 1'h0;
        M_ballXtemp_d = 4'h8;
        M_ballYtemp_d = 3'h7;
        M_directionX_d = 1'h1;
        M_directionY_d = 1'h1;
        ballX = M_ballXtemp_q;
        ballY = M_ballYtemp_q;
        M_state_d = GAMEON_state;
      end
      GAMEON_state: begin
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q >= M_ballspeed_q) begin
          if (playing == 1'h1) begin
            if ((M_ballXtemp_q + 1'h1) == 4'hf && (M_ballYtemp_q < 4'he || M_ballYtemp_q > 1'h1)) begin
              M_directionX_d = 1'h0;
            end
            if ((M_ballXtemp_q - 1'h1) == 1'h0 && (M_ballYtemp_q < 4'he || M_ballYtemp_q > 1'h1)) begin
              M_directionX_d = 1'h1;
            end
            if ((M_ballYtemp_q + 1'h1) == 4'hf) begin
              M_directionY_d = 1'h0;
              M_hitcounter_d = 1'h0;
            end
            if ((M_ballYtemp_q - 1'h1) == 1'h0) begin
              M_directionY_d = 1'h1;
              M_hitcounter_d = 1'h0;
            end
            if ((M_ballYtemp_q - 1'h1) == 1'h1) begin
              if (M_directionX_q == 1'h1) begin
                if ((M_ballXtemp_q + 1'h1) == (padA - 2'h2) && (padA - 2'h2) >= 1'h0) begin
                  M_directionX_d = 1'h0;
                  M_directionY_d = 1'h1;
                  M_hitcounter_d = M_hitcounter_q + 1'h1;
                end else begin
                  if ((M_ballXtemp_q + 1'h1) >= (padA - 1'h1) && (M_ballXtemp_q + 1'h1) <= (padA + 1'h1)) begin
                    M_directionY_d = 1'h1;
                    M_hitcounter_d = M_hitcounter_q + 1'h1;
                  end
                end
              end else begin
                if (M_directionX_q == 1'h0) begin
                  if ((M_ballXtemp_q - 1'h1) >= (padA - 1'h1) && (M_ballXtemp_q - 1'h1) <= (padA + 1'h1)) begin
                    M_directionY_d = 1'h1;
                    M_hitcounter_d = M_hitcounter_q + 1'h1;
                  end else begin
                    if ((M_ballXtemp_q - 1'h1) == (padA + 2'h2) && (padA + 2'h2) <= 4'hf) begin
                      M_directionX_d = 1'h1;
                      M_directionY_d = 1'h1;
                      M_hitcounter_d = M_hitcounter_q + 1'h1;
                    end
                  end
                end
              end
            end else begin
              if ((M_ballYtemp_q + 1'h1) == 4'he) begin
                if (M_directionX_q == 1'h1) begin
                  if ((M_ballXtemp_q + 1'h1) == (padB - 2'h2) && (padB - 2'h2) >= 1'h0) begin
                    M_directionX_d = 1'h0;
                    M_directionY_d = 1'h0;
                    M_hitcounter_d = M_hitcounter_q + 1'h1;
                  end else begin
                    if ((M_ballXtemp_q + 1'h1) >= (padB - 1'h1) && (M_ballXtemp_q + 1'h1) <= (padB + 1'h1)) begin
                      M_directionY_d = 1'h0;
                      M_hitcounter_d = M_hitcounter_q + 1'h1;
                    end
                  end
                end else begin
                  if (M_directionX_q == 1'h0) begin
                    if ((M_ballXtemp_q - 1'h1) >= (padB - 1'h1) && (M_ballXtemp_q - 1'h1) <= (padB + 1'h1)) begin
                      M_directionY_d = 1'h0;
                      M_hitcounter_d = M_hitcounter_q + 1'h1;
                    end else begin
                      if ((M_ballXtemp_q - 1'h1) == (padB + 2'h2) && (padB + 2'h2) <= 4'hf) begin
                        M_directionX_d = 1'h1;
                        M_directionY_d = 1'h0;
                        M_hitcounter_d = M_hitcounter_q + 1'h1;
                      end
                    end
                  end
                end
              end
            end
            if (M_directionX_q == 1'h1) begin
              M_ballXtemp_d = M_ballXtemp_q + 1'h1;
            end else begin
              if (M_directionX_q == 1'h0) begin
                M_ballXtemp_d = M_ballXtemp_q - 1'h1;
              end
            end
            if (M_directionY_q == 1'h1) begin
              M_ballYtemp_d = M_ballYtemp_q + 1'h1;
            end else begin
              if (M_directionY_q == 1'h0) begin
                M_ballYtemp_d = M_ballYtemp_q - 1'h1;
              end
            end
            if (M_hitcounter_q == 1'h0) begin
              M_ballspeed_d = 23'h7a1200;
            end else begin
              if (M_hitcounter_q == 2'h2) begin
                M_ballspeed_d = 22'h3d0900;
              end else begin
                if (M_hitcounter_q >= 3'h4) begin
                  M_ballspeed_d = 22'h2dc6c0;
                end
              end
            end
            ballX = M_ballXtemp_q;
            ballY = M_ballYtemp_q;
            M_counter_d = 1'h0;
          end else begin
            if (playing == 1'h0) begin
              M_state_d = GAMESTART_state;
            end
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
      M_hitcounter_q <= 1'h0;
      M_ballspeed_q <= 1'h0;
      M_ballXtemp_q <= 1'h0;
      M_ballYtemp_q <= 1'h0;
      M_directionX_q <= 1'h0;
      M_directionY_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
      M_hitcounter_q <= M_hitcounter_d;
      M_ballspeed_q <= M_ballspeed_d;
      M_ballXtemp_q <= M_ballXtemp_d;
      M_ballYtemp_q <= M_ballYtemp_d;
      M_directionX_q <= M_directionX_d;
      M_directionY_q <= M_directionY_d;
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