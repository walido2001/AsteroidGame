//Code is a modified version of the code shown and explained in the video link below:
// https://www.youtube.com/watch?v=4enWoVHCykI


module HorizentalVerticalControl (
	input normalCLK,
	
	output reg [9:0] HControl=0,
	output reg [9:0] VControl=0
	
);
	//This code iterates over every pixel that the VGA cable can support
	//Outputs HControl and VControl which are registers that point to the current pixel the VGA is activating
	
	always @ (posedge normalCLK)
		begin 
			if (HControl < 800) 
				begin 
				
					HControl <= HControl + 1;
					
				end
			else 
				begin 
				
					HControl <= 0;
					
					if(VControl < 525) begin
						VControl <= VControl + 1;
					end
					
					else begin 
						VControl <= 0;
					end
				end
		end
		
endmodule
