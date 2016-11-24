module Drawing(
	input clk,
	input [2:0]ballX,  
	input [2:0]ballY,
	input [2:0]padA,
	input [2:0]padB,
	input playing,
	output reg [(`NO_LED - 1):0] mat);
	
	always @(negedge clk)
	begin
		if (playing == 1)  //game start
		begin
			mat <= 64'd0;  //turns off all the led
			
			// Ball display
			mat[CoordToMatrix(ballX,ballY)] <= 1;  
			
			// Paddle A display
			mat[CoordToMatrix(padA - 1,0)] <= 1;  
			mat[CoordToMatrix(padA,0)] <= 1;
			mat[CoordToMatrix(padA + 1,0)] <= 1;
				
			// Paddle B display
			mat[CoordToMatrix(padB - 1,7)] <= 1;
			mat[CoordToMatrix(padB,7)] <= 1;
			mat[CoordToMatrix(padB + 1,7)] <= 1;
		end
		else
		begin
			mat <= ~64'd0;
		end
	end
	
	function [5:0]CoordToMatrix;  //changes coordinates to matrix so that it corresponds to the led matrix display
			input [2:0]x;
			input [2:0]y;
			
			begin
				CoordToMatrix = x + y * `SIZE;
			end
	endfunction
endmodule
	