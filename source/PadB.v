module PadB(
	input clk,
	input playing,
	input btnLeft,
	input btnRight,
	output reg [2:0]padB);
	
	always @(posedge clk)
	begin
		if (playing == 0)  //game not started
		begin
			padB <= 6;  //paddle start on right side of matrix
		end
		else
		begin
			if (btnLeft == 0 && padB > 1)  //btn left is pressed and paddle is not on extreme left
			begin
				padB <= padB - 1;  //paddle moves left
			end
			else if (btnRight == 0 && padB < 6) //btn right is pressed and paddle is not on extreme right
			begin
				padB <= padB + 1;  //paddle moves right
			end
		end
	end
endmodule