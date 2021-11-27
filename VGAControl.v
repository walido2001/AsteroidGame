//Code is a modified version of the code shown and explained in the video link below:
// https://www.youtube.com/watch?v=4enWoVHCykI

module VGAControl(
	input clk,
	input clk2,
	
	input switch,
	
	output HSync,
	output VSync,
	
	output [3:0] Red,
	output [3:0] Green,
	output [3:0] Blue
);
	
	//Pin Assignments
	//R3 -> PIN_Y1
	//R2 -> PIN_Y2
	//R1 -> PIN_V1
	//R0 -> PIN_AA1
	
	//G3 -> PIN_R1
	//G2 -> PIN_R2
	//G1 -> PIN_T2
	//G0 -> PIN_W1
	
	//B3 -> PIN_N2
	//B2 -> PIN_P4
	//B1 -> PIN_T1
	//B0 -> PIN_P1
	
	//HSync -> PIN_N3
	//VSync -> PIN_N1
	
	//CLK -> PIN_P11
	//CLK2 -> PIN_N14
	
	//SWITCH -> 
	
	wire [9:0] HCounter;
	wire [9:0] VCounter;
	wire clkOut;
	wire clk50;
	wire drawSquare;
	//wire result2; 
	wire drawDefenseRed;
	wire drawDefenseGreen;
	wire drawDefenseBlue;
	wire drawPlanetRed;
	wire drawPlanetGreen;
	wire drawPlanetBlue;
	
	ClockDivider clkDiv (clk, clkOut);
	ClockDividerSixty clockTwo(clk2, clk50);
	HorizentalVerticalControl 	HVControl (clkOut, HCounter, VCounter);
	
	assign HSync = (HCounter <= 95 && HCounter >= 0) ? 1 : 0;
	assign VSync = (VCounter <= 1 && VCounter >= 0) ? 1 : 0;
	
	DrawDefense dDefense (HCounter, VCounter, drawDefenseRed, drawDefenseGreen, drawDefenseBlue);
	DrawPlanet dPlanet (HCounter, VCounter, drawPlanetRed, drawPlanetGreen, drawPlanetBlue);
	//groundTarget planet(HCounter, VCounter, clk50, result2);
	movingSquare squareMoving(HCounter, VCounter, clk50, switch, drawSquare);
	
	assign Red = (drawDefenseRed || drawPlanetRed || drawSquare) ? 4'hF : 4'h0;
	assign Green = (drawDefenseGreen || drawPlanetGreen || drawSquare) ? 4'hF : 4'h0;
	assign Blue = (drawDefenseBlue || drawPlanetBlue || drawSquare) ? 4'hF : 4'h0;
	
	//	assign Red = (HCounter <= 783 && HCounter >= 144 && VCounter <= 515 && VCounter >= 36) ? 4'hF : 4'h0;
//	assign Green = (HCounter <= 783 && HCounter >= 144 && VCounter <= 515 && VCounter >= 36) ? 4'hF : 4'h0;
//	assign Blue = (HCounter <= 783 && HCounter >= 144 && VCounter <= 515 && VCounter >= 36) ? 4'hF : 4'h0;
endmodule
