module MatrixClk(
	input osc_clk,
	output reg clkUs);
	
	reg [12:0]c_delay ;
	
	always @(posedge osc_clk)
	begin
		c_delay <= c_delay + 1 ;
		
		if(c_delay >= 5000)
		begin
			clkUs <= !clkUs;
			c_delay <= 0;
		end
	end
	
endmodule