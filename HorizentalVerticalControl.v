//Code is a modified version of the code shown and explained in the video link below:
// https://www.youtube.com/watch?v=4enWoVHCykI


module HorizentalVerticalControl (
	input normalCLK,
	
	output reg [9:0] HControl = 0,
	output reg [9:0] VControl = 0
	
);
	always @ (posedge normalCLK)
		begin 
		
			if (HControl < 799) 
				begin 
					HControl <= HControl + 1;	
				end
			else 
				begin 
					HControl <= 0;
				end
				
		end
		
	always @ (posedge normalCLK)
		begin 
			if (HControl == 799) begin 
				if(VControl < 525) begin
						VControl <= VControl + 1;
				end
				else begin
					VControl <= 0;
				end
			end
					
		end

endmodule
