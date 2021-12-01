module movingSquare(

	input [9:0] HCounter,
	input [9:0] VCounter,
	input clk,
	input switch,
	input desClock,
	
	input [9:0] middle,
	
	output reg startDesClock,
	output reg result,
	output reg destroyed,
	output reg [32:0] dH,
	output reg [32:0] dV);

	//Horizental Parameters
//	reg [32:0] leftEnd = 33'd464;
//	reg [32:0] rightEnd = 33'd494;
	//Vertical Parameters
	reg [32:0] top = 33'd35;
	reg [32:0] bottom = 33'd65;
	
	reg [9:0] midSpan = 10'd5;
	reg [9:0] increment = 10'd5;
	
	always @ (HCounter or VCounter) begin 
		if(VCounter >= top && VCounter <= bottom) begin
			if(HCounter >= (middle - midSpan) && HCounter <= (middle + midSpan)) begin
				result = 1;
			end else begin
				result = 0;
			end
		end else begin 
			result = 0;
		end
		
	end
	
	always @ (posedge VCounter) begin
		if(VCounter >= top && VCounter <= bottom) begin
		//increasing span everytime VCounter changes
			midSpan <= midSpan + increment;
			increment <= increment - 10'd1;
		end else begin
		//Reseting if we're outside our range
			midSpan <= 10'd5;
			increment <= 10'd5;
		end
	end
	
	always @ (posedge clk) begin
		//Resetting the meteor if it is in the range of the defense system and the switch is on
		if(((bottom >= 33'd376 && bottom <= 33'd416) || (top >= 33'd376 && top <= 33'd416)) && switch == 1) begin 
			destroyed <= 1'b1;
		end
		if(desClock == 1) begin
			startDesClock <= 0;
		end
		//making the meteor keep falling if 
		if((top < 33'd515) && (destroyed == 1'b0)) begin 
			top = top + 33'd1;
			bottom = bottom + 33'd1;
		end 
		else if(destroyed == 1'b1 || (top >= 33'd515))begin
			//dH = leftEnd + 33'd15;
			dH = middle;
			if(destroyed == 1'b1) begin
				dV = top + 33'd15;
			end else begin
				dV = 33'd514;
			end
			top = 33'd35;
			bottom = 33'd65;
			startDesClock <= 1;
			destroyed <= 1'b0;
		end
	end

endmodule