module movingSquare(

	input [9:0] HCounter,
	input [9:0] VCounter,
	input clk,
	input switch,
	
	output reg result
);

	//Horizental Parameters
	reg [32:0] leftEnd = 464;
	reg [32:0] rightEnd = 494;
	
	//Vertical Parameters
	reg [32:0] top = 35;
	reg [32:0] bottom = 65;

	reg freeze = 1;
	
	always @ (HCounter or VCounter) begin 
		
		if(top > 430 && bottom > 430 && switch == 1) begin 
			freeze = 0;
		end
		
		if(HCounter > leftEnd && HCounter < rightEnd && VCounter > top && VCounter < bottom) begin
			result = 1;
		end
		
		else begin 
			result = 0;
		end
		
	end
	
	always @ (posedge clk) begin 
	
		
		if(bottom != 515 && !freeze) begin 
			top = top + 1;
			bottom = bottom + 1;
		end 
		else begin 
			top = 35;
			bottom = 65;
		end
		
		
	end

endmodule
