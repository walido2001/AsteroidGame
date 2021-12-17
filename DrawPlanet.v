module DrawPlanet(
input [9:0] HCounter,
input [9:0] VCounter,

output reg dR,
output reg dG,
output reg dB);

reg [9:0] midSpan = 10'd44;
reg [9:0] increment = 10'd33;

//Sets the color of the planet based on the position of the HCounter and VCounter
always @ (VCounter or HCounter) begin
	if(VCounter >= 10'd456 && VCounter <= 10'd515) begin
		if(HCounter >= (10'd464 - midSpan) && HCounter <= (10'd464 + midSpan)) begin
			dR <= 0; dG <= 1; dB <= 1;
		end else begin
			dR <= 0; dG <= 0; dB <= 0;
		end
	end else begin
		dR <= 0; dG <= 0; dB <= 0;
	end
end

//Setting the shape of the planet based on the position of the VCounter to get the form of a curve
always @ (posedge VCounter) begin
	if(VCounter >= 10'd456 && VCounter <= 10'd515) begin
	//increasing span everytime VCounter changes
		midSpan = midSpan + increment;
		if(midSpan < 10'd320) begin
			increment = increment - 10'd1;
		end else begin
			midSpan = 10'd320;
			increment = 10'd0;
		end
	end else begin
	//Reseting if we're outside our range
		midSpan = 10'd44;
		increment = 10'd33;
		//diff <= 10'd0;
	end
end

endmodule
