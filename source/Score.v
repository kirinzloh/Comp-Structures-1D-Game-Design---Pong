module Score(
	input clk,
	input playing,
	input [2:0]ballX,
	input [2:0]ballY,
	output reg [3:0]scoreA,
	output reg [3:0]scoreB);
	
	always @(posedge clk)
	begin
		if (playing == 0)  //game not started
		begin
			scoreA <= 0;  //Initialize both players' score to 0
			scoreB <= 0;  
		end
		else
		begin
			if (ballY == 0)  //ball hits top of screen
			begin
				scoreB <= scoreB + 1;  //player B scores 1 point
			end
			else if (ballY == 7) //ball hits bottom of screen
			begin
				scoreA <= scoreA + 1;  //player A scores 1 point
			end
		end
	end
	
endmodule