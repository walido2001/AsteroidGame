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
	
	wire [9:0] HCounter;
	wire [9:0] VCounter;
	wire clkOut;
	wire clk50;
	wire desClk;
	wire [32:0] dH1;
	wire [32:0] dV1;
	wire destroyed1;
	wire startDes;
	wire drawSquare;
	wire drawDestroyed;
	wire drawDefenseRed;
	wire drawDefenseGreen;
	wire drawDefenseBlue;
	wire drawPlanetRed;
	wire drawPlanetGreen;
	wire drawPlanetBlue;
	wire drawDestroyRed;
	
	wire drawRed;
	wire drawGreen;
	wire drawBlue;
	
	ClockDivider clkDiv (clk, clkOut);
	ClockDividerSixty clockTwo(clk, clk50);
	DesClockDivider desClock (clk, startDes, desClk);
	HorizentalVerticalControl 	HVControl (clkOut, HCounter, VCounter);
	
	assign HSync = (HCounter <= 95 && HCounter >= 0) ? 1 : 0;
	assign VSync = (VCounter <= 1 && VCounter >= 0) ? 1 : 0;
	
	DrawDefense dDefense (HCounter, VCounter, drawDefenseRed, drawDefenseGreen, drawDefenseBlue);
	DrawPlanet dPlanet (HCounter, VCounter, drawPlanetRed, drawPlanetGreen, drawPlanetBlue);
	movingSquare squareMoving1 (HCounter, VCounter, clk50, switch, desClk, startDes, drawSquare, destroyed1, dH1, dV1);
	destroyAnimation destroy1 (HCounter, VCounter, destroyed1, dH1, dV1, desClk, drawDestroyRed, drawDestroyGreen);
	
	assign drawRed = drawDestroyRed || (!drawDestroyRed && drawDefenseRed) || (!drawDestroyRed && !drawDefenseRed && drawSquare) || (!drawDestroyRed && !drawDefenseRed && !drawSquare && drawPlanetRed);
	assign drawGreen = (!drawDestroyRed && drawDefenseGreen) || (!drawDestroyRed && !drawDefenseGreen && drawSquare) || (!drawDestroyRed && !drawDefenseGreen && !drawSquare && drawPlanetGreen);
	assign drawBlue = (!drawDestroyRed && drawDefenseBlue) || (!drawDestroyRed && !drawDefenseBlue && drawSquare) || (!drawDestroyRed && !drawDefenseBlue && !drawSquare && drawPlanetBlue);
	
	assign Red = (drawRed) ? 4'hF : 4'h0;
	assign Green = (drawGreen) ? 4'hF : 4'h0;
	assign Blue = (drawBlue) ? 4'hF : 4'h0;
	
	//	assign Red = (HCounter <= 783 && HCounter >= 144 && VCounter <= 515 && VCounter >= 36) ? 4'hF : 4'h0;
//	assign Green = (HCounter <= 783 && HCounter >= 144 && VCounter <= 515 && VCounter >= 36) ? 4'hF : 4'h0;
//	assign Blue = (HCounter <= 783 && HCounter >= 144 && VCounter <= 515 && VCounter >= 36) ? 4'hF : 4'h0;
endmodule
