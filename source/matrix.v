module Matrix(
	input osc_clk,
	input [63:0]data,
	output reg [(`SIZE - 1):0]row,
	output reg [(`SIZE - 1):0]col);
	
	wire clk;
	
	reg [(`ADDRESS - 1):0] rowIndex = 0;  //?
	
	always @(posedge clk)
	begin
		fork    
			row[rowIndex] = 0;  
			col = 0;
		join  //waits for completion of process within the fork-join statement before it continues
		
		rowIndex = rowIndex + 1;  //increment row index by 1
		
		fork
			row[rowIndex] = 1;  
			col = data[(rowIndex * `SIZE)+:`SIZE];  //?
		join
	end
	
	MatrixClk matrixClk1(osc_clk, clk);
	
endmodule