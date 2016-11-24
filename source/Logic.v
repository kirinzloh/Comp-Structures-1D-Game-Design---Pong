module Logic(
	input clk,
	input btnLeft,
	input btnRight,
	input btnStart,
	output [2:0]ballX,
	output [2:0]ballY,
	output [2:0]padA,
	output [2:0]padB,
	output reg playing,
	output [3:0]scoreA,
	output [3:0]scoreB);
	
	wire clkBallSpeed = (state == 0);
	wire clkBallMove = (state == 1);
	wire clkPadA = (state == 2);
	wire clkPadB = (state == 2);
	wire clkScore = (state == 2);
	
	reg [1:0]state;
	
	always @(posedge clk)
	begin
		state <= state + 1;  //change state
		
		playing <= (playing == 1 && scoreA < 7 && scoreB < 7) || (playing == 0 && btnStart == 0); 
    // as long as both players' scores are less than 7 and still playing, continue playing
    // as long as the players are not playing and game has not started yet, playing = 0 (game not started)
	end
	
	Ball ball1(clkBallSpeed, clkBallMove, playing, padA, padB, ballX, ballY);  
	PadA padA1(clkPadA, playing, ballX, ballY, padA);
	PadB padB1(clkPadB, playing, btnLeft, btnRight, padB);
	Score score1(clkScore, playing, ballX, ballY, scoreA, scoreB);
endmodule