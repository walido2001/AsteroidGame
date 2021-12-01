//Code is a modified version of the code shown and explained in the video link below:
// https://www.youtube.com/watch?v=4enWoVHCykI

module VGAControl(
	input clk,
	input clk2,
	
	input switch1,
	input switch2,
	input switch3,
	input switch4,
	input switch5,
	
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
	
	//Switch1 -> PIN_A12
	//Switch2 -> PIN_C12
	//Switch3 -> PIN_D12
	//Switch4 -> PIN_C11
	//Switch5 -> PIN_C10
	
	wire [9:0] HCounter;
	wire [9:0] VCounter;
	wire clkOut;
	wire clk50;
	
	wire desClk1;
	wire desClk2;
	wire desClk3;
	wire desClk4;
	wire desClk5;
	
	wire startDes1;
	wire startDes2;
	wire startDes3;
	wire startDes4;
	wire startDes5;
	
	wire drawSquare;
	wire drawSquare1;
	wire drawSquare2;
	wire drawSquare3;
	wire drawSquare4;
	wire drawSquare5;
	
	wire destroyed1;
	wire destroyed2;
	wire destroyed3;
	wire destroyed4;
	wire destroyed5;
	
	wire [32:0] dH1;
	wire [32:0] dH2;
	wire [32:0] dH3;
	wire [32:0] dH4;
	wire [32:0] dH5;
	
	wire [32:0] dV1;
	wire [32:0] dV2;
	wire [32:0] dV3;
	wire [32:0] dV4;
	wire [32:0] dV5;
	
	wire drawDestroyRed;
	wire drawDestroyRed1;
	wire drawDestroyRed2;
	wire drawDestroyRed3;
	wire drawDestroyRed4;
	wire drawDestroyRed5;
	
	wire drawDefenseRed;
	wire drawDefenseGreen;
	wire drawDefenseBlue;
	
	wire drawPlanetRed;
	wire drawPlanetGreen;
	wire drawPlanetBlue;
	
	wire drawRed;
	wire drawGreen;
	wire drawBlue;
	
	ClockDivider clkDiv (clk, clkOut);
	ClockDividerSixty clockTwo(clk, clk50);
	
	DesClockDivider desClock1 (clk, startDes1, desClk1);
	DesClockDivider desClock2 (clk, startDes2, desClk2);
	DesClockDivider desClock3 (clk, startDes3, desClk3);
	DesClockDivider desClock4 (clk, startDes4, desClk4);
	DesClockDivider desClock5 (clk, startDes5, desClk5);
	
	HorizentalVerticalControl 	HVControl (clkOut, HCounter, VCounter);
	
	assign HSync = (HCounter <= 95 && HCounter >= 0) ? 1 : 0;
	assign VSync = (VCounter <= 1 && VCounter >= 0) ? 1 : 0;
	
	DrawDefense dDefense (HCounter, VCounter, drawDefenseRed, drawDefenseGreen, drawDefenseBlue);
	DrawPlanet dPlanet (HCounter, VCounter, drawPlanetRed, drawPlanetGreen, drawPlanetBlue);
	
	movingSquare squareMoving1 (HCounter, VCounter, clk50, switch1, desClk1, 10'd208, startDes1, drawSquare1, destroyed1, dH1, dV1);
	movingSquare squareMoving2 (HCounter, VCounter, clk50, switch2, desClk2, 10'd336, startDes2, drawSquare2, destroyed2, dH2, dV2);
	movingSquare squareMoving3 (HCounter, VCounter, clk50, switch3, desClk3, 10'd464, startDes3, drawSquare3, destroyed3, dH3, dV3);
	movingSquare squareMoving4 (HCounter, VCounter, clk50, switch4, desClk4, 10'd592, startDes4, drawSquare4, destroyed4, dH4, dV4);
	movingSquare squareMoving5 (HCounter, VCounter, clk50, switch5, desClk5, 10'd720, startDes5, drawSquare5, destroyed5, dH5, dV5);
	
	destroyAnimation destroy1 (HCounter, VCounter, destroyed1, dH1, dV1, desClk1, drawDestroyRed1);
	destroyAnimation destroy2 (HCounter, VCounter, destroyed2, dH2, dV2, desClk2, drawDestroyRed2);
	destroyAnimation destroy3 (HCounter, VCounter, destroyed3, dH3, dV3, desClk3, drawDestroyRed3);
	destroyAnimation destroy4 (HCounter, VCounter, destroyed4, dH4, dV4, desClk4, drawDestroyRed4);
	destroyAnimation destroy5 (HCounter, VCounter, destroyed5, dH5, dV5, desClk5, drawDestroyRed5);
	
	assign drawDestroyRed = drawDestroyRed1 || drawDestroyRed2 || drawDestroyRed3 || drawDestroyRed4 || drawDestroyRed5;
	assign drawSquare = drawSquare1 ||drawSquare2 || drawSquare3 || drawSquare4 || drawSquare5;
	
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
