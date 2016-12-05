/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module ball_5 (
    input clk,
    input rst,
    input playing,
    input [3:0] padA,
    input [3:0] padB,
    output reg [3:0] ballX,
    output reg [3:0] ballY
  );
  
  
  
  localparam GAMEON_state = 1'd0;
  localparam GAMESTART_state = 1'd1;
  
  reg M_state_d, M_state_q = GAMESTART_state;
  reg [22:0] M_counter_d, M_counter_q = 1'h0;
  reg [3:0] M_ballXtemp_d, M_ballXtemp_q = 1'h0;
  reg [3:0] M_ballYtemp_d, M_ballYtemp_q = 1'h0;
  reg M_speedX_d, M_speedX_q = 1'h0;
  reg M_speedY_d, M_speedY_q = 1'h0;
  
  always @* begin
    M_state_d = M_state_q;
    M_speedX_d = M_speedX_q;
    M_speedY_d = M_speedY_q;
    M_ballXtemp_d = M_ballXtemp_q;
    M_counter_d = M_counter_q;
    M_ballYtemp_d = M_ballYtemp_q;
    
    ballX = M_ballXtemp_q;
    ballY = M_ballYtemp_q;
    
    case (M_state_q)
      GAMESTART_state: begin
        M_ballXtemp_d = 4'h8;
        M_ballYtemp_d = 3'h7;
        M_speedX_d = 1'h1;
        M_speedY_d = 1'h1;
        ballX = M_ballXtemp_q;
        ballY = M_ballYtemp_q;
        M_state_d = GAMEON_state;
      end
      GAMEON_state: begin
        M_counter_d = M_counter_q + 1'h1;
        if (M_counter_q >= 23'h7a1200) begin
          if (playing == 1'h1) begin
            if ((M_ballYtemp_q - 1'h1) == 1'h0) begin
              if (M_ballXtemp_q == (padA - 1'h1)) begin
                M_speedX_d = 1'h0;
                M_speedY_d = 1'h0;
              end else begin
                if (M_ballXtemp_q == (padA)) begin
                  M_speedY_d = 1'h0;
                end else begin
                  if (M_ballXtemp_q == (padA + 1'h1)) begin
                    M_speedX_d = 1'h1;
                    M_speedY_d = 1'h0;
                  end
                end
              end
            end else begin
              if ((M_ballYtemp_q + 1'h1) == 4'hf) begin
                if (M_ballXtemp_q == (padB - 1'h1)) begin
                  M_speedX_d = 1'h0;
                  M_speedY_d = 1'h0;
                end else begin
                  if (M_ballXtemp_q == (padB)) begin
                    M_speedY_d = 1'h0;
                  end else begin
                    if (M_ballXtemp_q == (padB + 1'h1)) begin
                      M_speedX_d = 1'h1;
                      M_speedY_d = 1'h0;
                    end
                  end
                end
              end else begin
                if ((M_ballXtemp_q + 1'h1) > 4'hf || (M_ballXtemp_q - 1'h1) < 1'h0) begin
                  M_speedX_d = 1'h0;
                end else begin
                  if ((M_ballYtemp_q + 1'h1) > 4'hf || (M_ballYtemp_q - 1'h1) < 1'h0) begin
                    M_speedY_d = 1'h0;
                  end
                end
              end
            end
            if (M_speedX_q == 1'h1) begin
              M_ballXtemp_d = M_ballXtemp_q + 1'h1;
            end else begin
              if (M_speedX_q == 1'h0) begin
                M_ballXtemp_d = M_ballXtemp_q - 1'h1;
              end
            end
            if (M_speedY_q == 1'h1) begin
              M_ballYtemp_d = M_ballYtemp_q + 1'h1;
            end else begin
              if (M_speedY_q == 1'h0) begin
                M_ballYtemp_d = M_ballYtemp_q - 1'h1;
              end
            end
            ballX = M_ballXtemp_q;
            ballY = M_ballYtemp_q;
            M_counter_d = 1'h0;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
      M_ballXtemp_q <= 1'h0;
      M_ballYtemp_q <= 1'h0;
      M_speedX_q <= 1'h0;
      M_speedY_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
      M_ballXtemp_q <= M_ballXtemp_d;
      M_ballYtemp_q <= M_ballYtemp_d;
      M_speedX_q <= M_speedX_d;
      M_speedY_q <= M_speedY_d;
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