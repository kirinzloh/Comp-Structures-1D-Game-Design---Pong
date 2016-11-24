`define NO_LED 64  //total no of led 
`define SIZE 8     //8x8 led matrix
`define ADDRESS 3  //?register addr

module Main(
	input btnLeft,    //btn input for paddle to go left
	input btnStart,   //btn input to start the game
	input btnRight,   //btn input for paddle to go right
	output [(`SIZE - 1):0]row, //led output (led matrix row)
	output [(`SIZE - 1):0]col, //led output (led matrix column)
	output [7:0] LED);  // Mojo led output
	
	wire osc_clk;  
	wire clkMain;
	wire [(`NO_LED - 1):0] mat;
	wire [2:0]ballX;
	wire [2:0]ballY;
	wire [2:0]padA;
	wire [2:0]padB;
	wire playing;
	wire [3:0]scoreA;
	wire [3:0]scoreB;
	
	assign LED[3:0] = ~scoreA;
	assign LED[7:4] = ~scoreB;

	OSCC OSCC_1 (.OSC(osc_clk));
	MainClock mainClock1(osc_clk, clkMain);  //set the main clock, osc_clk as input and clkMain as output
	Matrix matrix1(osc_clk, mat, row, col);  //?osc_clk and led matrix as input
	Drawing drawing1(clkMain, ballX, ballY, padA, padB, playing, mat);  //Turns on the display for the ball and the paddles
	Logic logic1(clkMain, btnLeft, btnRight, btnStart, ballX, ballY, padA, padB, playing, scoreA, scoreB); //actual mechanics of the game
endmodule