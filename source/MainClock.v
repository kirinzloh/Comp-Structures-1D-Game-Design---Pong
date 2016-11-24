module MainClock(
	input osc_clk,
	output reg outClk);
	
	integer c_delay ;
	
	always @(posedge osc_clk)
	begin
		c_delay <= c_delay + 1 ; //clock delay counter increments by 1
		
		if(c_delay >= 500000)  //when clock delay reaches 500000, begin:
		begin
			outClk <= !outClk;  //?output outClk  
			c_delay <= 0;       //reset clock delay
		end
	end
	
endmodule