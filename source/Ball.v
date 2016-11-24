module Ball(
	input clkSpeed,  //the clk to account for the speed and direction of the ball
	input clkMove,   //the clk to account for the movement of the ball
	input playing,   //determines whether the game is playing or stopped
	input [2:0]padA,  //paddle A 
	input [2:0]padB,  //paddle B
	output reg [2:0]ballX,  //Position of ball w.r.t X coordinates
	output reg [2:0]ballY); //Position of ball w.r.t Y coordinates

	integer speedX;  //speed of ball in x-direction
	integer speedY;  //speed of ball in y-direction
	
	always @(posedge clkSpeed)
	begin
		if (playing == 0)  //Game not started
		begin
			speedX <= 1;  //Speed set to 1 (1 implies that the ball moves 1 bit each time)
			speedY <= 1;
		end
		else
		begin
			if((ballY + speedY) == 0)  //the ball hits the top of the screen where paddle A is
			begin
				if (ballX == (padA - 1))  //ball hits left of paddle  
				begin
					speedX <= -1;  //ball goes left
					speedY <= speedY * (-1);  //change direction in y-axis (goes down towards paddle B)
				end
				else if (ballX == (padA))  //ball hits center of paddle
				begin
					speedY <= speedY * (-1);  //change dir in y-axis, no change in x-axis (remains as it is)
				end
				else if (ballX == (padA + 1))  //ball hits right of paddle
				begin
					speedX <= 1;  // ball goes right
					speedY <= speedY * (-1);  //ball goes down
				end
			end
			else if((ballY + speedY) == 7)  //the ball hits the bottom of the screen where paddle B is
			begin
				if (ballX == (padB - 1)) 
				begin
					speedX <= -1;
					speedY <= speedY * (-1);
				end
				else if (ballX == (padB))
				begin
					speedY <= speedY * (-1);
				end
				else if (ballX == (padB + 1))
				begin
					speedX <= 1;
					speedY <= speedY * (-1);
				end
			end
			
			fork
				if ((ballX + speedX) > 7 || (ballX + speedX) < 0)  //ball hits the left or right side of matrix
				begin
					speedX <= speedX * (-1);  // change x-direction
				end
				
				if ((ballY + speedY) > 7 || (ballY + speedY) < 0)  //ball hits the top or bottom of the screen
				begin
					speedY <= speedY * (-1);  // change y-direction
				end
			join  // must complete process within before continue
		end
	end
	
	always @(posedge clkMove)
	begin
		if (playing == 0)
		begin
			ballX <= 4;  //Starting position of the ball (somewhere in the middle)
			ballY <= 3;  //Coordinates of (4,3) in a matrix of 8x8
		end
		else
		begin
			ballX <= ballX + speedX; //increments speed of ball in x-direction
			ballY <= ballY + speedY; //increments speed of ball in y-direction
		end
	end
endmodule