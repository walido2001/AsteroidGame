module movingSquare(

	input [9:0] HCounter,
	input [9:0] VCounter,
	input clk,
	input switch,
	
	output reg result
);

	//Horizental Parameters
	reg [32:0] leftEnd = 33'd464;
	reg [32:0] rightEnd = 33'd494;
	
	//Vertical Parameters
	reg [32:0] top = 33'd35;
	reg [32:0] bottom = 33'd65;

	reg destroyed = 1'b0;
	
	always @ (HCounter or VCounter) begin 
		if(HCounter > leftEnd && HCounter < rightEnd && VCounter > top && VCounter < bottom) begin
			result = 1;
		end
		
		else begin 
			result = 0;
		end
		
	end
	
	always @ (posedge clk) begin
		//Resetting the meteor if it is in the range of the defense system and the switch is on
		if(((bottom >= 33'd376 && bottom <= 33'd416) || (top >= 33'd376 && top <= 33'd416)) && switch == 1) begin 
			destroyed = 1'b1;
		end
		
		//making the meteor keep falling if 
		if((top < 33'd515) && (destroyed == 1'b0)) begin 
			top = top + 33'd1;
			bottom = bottom + 33'd1;
		end 
		else if(destroyed == 1'b1 || (top >= 33'd515))begin 
			top = 33'd35;
			bottom = 33'd65;
			destroyed = 1'b0;
		end
	end

endmodule