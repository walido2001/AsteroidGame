module scoreSet(
input scoreToggle,

output [3:0 ]scoreCounter1,
output [3:0]scoreCounter2);

reg [3:0] scoreCounter1Temp = 4'b0;
reg [3:0] scoreCounter2Temp = 4'b0;

	always @ (posedge scoreToggle) begin 
		if(scoreCounter1Temp == 9) begin 
			scoreCounter1Temp = 4'b0;
			scoreCounter2Temp = scoreCounter2Temp + 4'b1;
		end
		else begin 
			scoreCounter1Temp = scoreCounter1Temp + 4'b1;	
		end
	end

	
	assign scoreCounter1 = scoreCounter1Temp;
	assign scoreCounter2 = scoreCounter2Temp;
	
endmodule