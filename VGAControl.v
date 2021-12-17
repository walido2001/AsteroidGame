//Code is a modified version of the code shown and explained in the video link below:
// https://www.youtube.com/watch?v=4enWoVHCykI

module VGAControl(
	input clk,
	input clk2,
	
	input reset,
	
	input switch1,
	input switch2,
	input switch3,
	input switch4,
	input switch5,
	
	output HSync,
	output VSync,
	
	output [3:0] Red,
	output [3:0] Green,
	output [3:0] Blue, 
	
	output [6:0] hexZero, 
	output [6:0] hexOne, 
	output [6:0] hexFour, 
	output [6:0] hexThree, 
	output [6:0] hexFive
);
	 
	//Authors:
	//Faruq Afolabi - 217 219 619
	//Walid AlDari - 218 375 162
	
	//Simple Descriptions 
	// Score Value -> Hex0 and Hex1
	// Health Value -> Hex4 and Hex3
	
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
	
	//HexZero[0] -> PIN_C14
	//HexZero[1] -> PIN_E15
	//HexZero[2] -> PIN_C15
	//HexZero[3] -> PIN_C16
	//HexZero[4] -> PIN_E16
	//HexZero[5] -> PIN_D17
	//HexZero[6] -> PIN_C17
	
	//HexOne[0] -> PIN_C18
	//HexOne[1] -> PIN_D18
	//HexOne[2] -> PIN_E18
	//HexOne[3] -> PIN_B16
	//HexOne[4] -> PIN_A17
	//HexOne[5] -> PIN_A18
	//HexOne[6] -> PIN_B17
	
	//HexThree[0] -> PIN_F21
	//HexThree[1] -> PIN_E22
	//HexThree[2] -> PIN_E21
	//HexThree[3] -> PIN_C19
	//HexThree[4] -> PIN_C20
	//HexThree[5] -> PIN_D19
	//HexThree[6] -> PIN_E17
	
	//HexFour[0] -> PIN_F18
	//HexFour[1] -> PIN_E20
	//HexFour[2] -> PIN_E19
	//HexFour[3] -> PIN_J18
	//HexFour[4] -> PIN_H19
	//HexFour[5] -> PIN_F19
	//HexFour[6] -> PIN_F20
	
	//Reset -> PIN_A7
	
	//HexFive[0] -> PIN_J20
	//HexFive[1] -> PIN_K20
	//HexFive[2] -> PIN_L18
	//HexFive[3] -> PIN_N18
	//HexFive[4] -> PIN_M20
	//HexFive[5] -> PIN_N19
	//HexFive[6] -> PIN_N20
	
	//VGA Wires//
	wire [9:0] HCounter;
	wire [9:0] VCounter;
	
	wire drawRed;
	wire drawGreen;
	wire drawBlue;
	/////////////
	
	//Clock Wires//
	wire clkOut;
	wire clk50;
	///////////////
	
	//Asteroid Wires//
	wire drawSquare;
	wire drawSquare1;
	wire drawSquare2;
	wire drawSquare3;
	wire drawSquare4;
	wire drawSquare5;
	
	wire enable1;
	wire enable2;
	wire enable3;
	wire enable4;
	wire enable5;
	/////////////////
	
	//Destroyed Asteroid Wires//
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
	////////////////////////////
	
	
	//Planet Object Wires//
	wire drawPlanetRed;
	wire drawPlanetGreen;
	wire drawPlanetBlue;
	///////////////////////
	
	//Score Toggle wires//
	wire [3:0] scoreCounter1;
	wire [3:0] scoreCounter2;
	
	wire scoreToggle;
	wire scoreToggle1; 
	wire scoreToggle2;
	wire scoreToggle3;
	wire scoreToggle4;
	wire scoreToggle5;
	//////////////////////
	
	//Health Counter wires//
	wire [3:0] healthCounter1;
	wire [3:0] healthCounter2;
	
	wire [9:0] healthToggle;
	wire [3:0] healthToggle1;
	wire [3:0] healthToggle2;
	wire [3:0] healthToggle3;
	wire [3:0] healthToggle4;
	wire [3:0] healthToggle5;
	////////////////////////
	
	//Clocks//
	ClockDivider clkDiv (clk, clkOut);
	ClockDividerSixty clockTwo(clk, clk50);
	//////////
	
	//Destruction Animation Timers//
	DesClockDivider desClock1 (clk, startDes1, desClk1);
	DesClockDivider desClock2 (clk, startDes2, desClk2);
	DesClockDivider desClock3 (clk, startDes3, desClk3);
	DesClockDivider desClock4 (clk, startDes4, desClk4);
	DesClockDivider desClock5 (clk, startDes5, desClk5);
	////////////////////////////////
	
	//Pixel Position Pointers//
	HorizentalVerticalControl 	HVControl (clkOut, HCounter, VCounter);
	///////////////////////////
	
	//VGA Inputs//
	assign HSync = (HCounter <= 95 && HCounter >= 0) ? 1 : 0;
	assign VSync = (VCounter <= 1 && VCounter >= 0) ? 1 : 0;
	//////////////
	
	//Map Objects: Defense System and Planet//
//	DrawDefense dDefense (HCounter, VCounter, drawDefenseRed, drawDefenseGreen, drawDefenseBlue);
//	DrawPlanet dPlanet (HCounter, VCounter, drawPlanetRed, drawPlanetGreen, drawPlanetBlue);
	
	DrawDefense dDefense (HCounter, VCounter, drawDefenseRed, drawDefenseGreen, drawDefenseBlue);
	DrawPlanet dPlanet (HCounter, VCounter, drawPlanetRed, drawPlanetGreen, drawPlanetBlue);
	//////////////////////////////////////////
	
	//Asteroid Modules//
	movingSquare squareMoving1 (HCounter, VCounter, clk50, switch1, desClk1, 10'd208, enable1, reset, startDes1, drawSquare1, destroyed1, dH1, dV1, scoreToggle1, healthToggle1);
	movingSquare squareMoving2 (HCounter, VCounter, clk50, switch2, desClk2, 10'd336, enable2, reset, startDes2, drawSquare2, destroyed2, dH2, dV2, scoreToggle2, healthToggle2);
	movingSquare squareMoving3 (HCounter, VCounter, clk50, switch3, desClk3, 10'd464, enable3, reset, startDes3, drawSquare3, destroyed3, dH3, dV3, scoreToggle3, healthToggle3);
	movingSquare squareMoving4 (HCounter, VCounter, clk50, switch4, desClk4, 10'd592, enable4, reset, startDes4, drawSquare4, destroyed4, dH4, dV4, scoreToggle4, healthToggle4);
	movingSquare squareMoving5 (HCounter, VCounter, clk50, switch5, desClk5, 10'd720, enable5, reset, startDes5, drawSquare5, destroyed5, dH5, dV5, scoreToggle5, healthToggle5);
	////////////////////
	
	//Destroy Animation Modules//
	destroyAnimation destroy1 (HCounter, VCounter, destroyed1, dH1, dV1, desClk1, drawDestroyRed1);
	destroyAnimation destroy2 (HCounter, VCounter, destroyed2, dH2, dV2, desClk2, drawDestroyRed2);
	destroyAnimation destroy3 (HCounter, VCounter, destroyed3, dH3, dV3, desClk3, drawDestroyRed3);
	destroyAnimation destroy4 (HCounter, VCounter, destroyed4, dH4, dV4, desClk4, drawDestroyRed4);
	destroyAnimation destroy5 (HCounter, VCounter, destroyed5, dH5, dV5, desClk5, drawDestroyRed5);
	/////////////////////////////
	
	//In-Game Score and Health Monitors//
	scoreSet score (scoreToggle, reset, scoreCounter1, scoreCounter2);
	healthSetter healthyfood (healthToggle, reset, healthCounter1, healthCounter2, enable1, enable2, enable3, enable4, enable5);
	
	segmentDisplay ScoreLSB (scoreCounter1, hexZero);
	segmentDisplay ScoreMSB (scoreCounter2, hexOne);
	
	segmentDisplay healthLSB(healthCounter1, hexThree);
	segmentDisplay healthMSB(healthCounter2, hexFour);
	/////////////////////////////////////
	
	//Lose Screen//
	displayL LoseScreen(enable1, hexFive);
	///////////////
	
	// Toggles //
	assign scoreToggle = scoreToggle1 || scoreToggle2 || scoreToggle3 || scoreToggle4 || scoreToggle5;
	assign healthToggle = healthToggle1 || healthToggle2 || healthToggle3 || healthToggle4 || healthToggle5;
	
	assign drawDestroyRed = drawDestroyRed1 || drawDestroyRed2 || drawDestroyRed3 || drawDestroyRed4 || drawDestroyRed5;
	assign drawSquare = drawSquare1 ||drawSquare2 || drawSquare3 || drawSquare4 || drawSquare5;
	/////////////
	
	//Color Overlap Hierarchy | Determines which color can overwrite the other. ie asteroid color taking precedence over the planet color when they're in the same location// 
	assign drawRed = drawDestroyRed || (!drawDestroyRed && drawDefenseRed) || (!drawDestroyRed && !drawDefenseRed && drawSquare) || (!drawDestroyRed && !drawDefenseRed && !drawSquare && drawPlanetRed);
	assign drawGreen = (!drawDestroyRed && drawDefenseGreen) || (!drawDestroyRed && !drawDefenseGreen && drawSquare) || (!drawDestroyRed && !drawDefenseGreen && !drawSquare && drawPlanetGreen);
	assign drawBlue = (!drawDestroyRed && drawDefenseBlue) || (!drawDestroyRed && !drawDefenseBlue && drawSquare) || (!drawDestroyRed && !drawDefenseBlue && !drawSquare && drawPlanetBlue);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//Other VGA Outputs//
	assign Red = (drawRed) ? 4'hF : 4'h0;
	assign Green = (drawGreen) ? 4'hF : 4'h0;
	assign Blue = (drawBlue) ? 4'hF : 4'h0;
	/////////////////////
	
endmodule
