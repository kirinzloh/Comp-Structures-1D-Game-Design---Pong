module PadA(
	input clk,  
	input playing,  
	input [2:0]ballX,
	input [2:0]ballY,
	output reg [2:0]padA);
	
	reg ai;
	
	always @(posedge clk)
	begin
		if (playing == 0) //game not started
		begin
			padA <= 1;  
			ai <= 1; 
		end
		else
		begin
			if(ai == 1)  
			begin
				if (ballX < padA && padA > 1)  //if ball is on left side of paddle and paddle is not on extreme left of matrix
				begin
					padA <= padA - 1;  //paddle moves left
				end
				else if (ballX > padA && padA < 6) //if ball is on right side of paddle and paddle is not on extreme right of matrix
				begin
					padA <= padA + 1;  //paddle moves right
				end
			end
			
			ai <= !ai;
		end
	end

endmodule