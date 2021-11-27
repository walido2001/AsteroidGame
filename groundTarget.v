module groundTarget (
	input [9:0] HCounter,
	input [9:0] VCounter,
	input clk,
	
	output reg result
);

	reg [32:0] top = 430;
	reg [32:0] bottom = 500;
	
	always @ (VCounter) begin 
	
		if (VCounter > top && VCounter < bottom) begin 
			result = 1;
		end
		else begin 
			result = 0;
		end
		
		
	end
	
	 
	
		
		
	
endmodule
