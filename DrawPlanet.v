module DrawPlanet(
input [9:0] HCounter,
input [9:0] VCounter,

output reg dR,
output reg dG,
output reg dB);

reg [9:0] midSpan = 10'd44;
reg [9:0] increment = 10'd33;
reg [9:0] diff = 10'd0;

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

//RANDOM SHAPE
//MAKE midspan = 10'd11 and increment = 10'd11 and diff = 10'd0
//Random shapes
/*
always @ (posedge VCounter) begin
	if(VCounter >= 10'd456 && VCounter <= 10'd513) begin
	//increasing span everytime VCounter changes
		midSpan <= midSpan + increment;
		increment <= increment - diff;
		diff <= diff + 10'd1;
	end else begin
	//Reseting if we're outside our range
		midSpan <= 10'd11;
		increment <= 10'd11;
		diff <= 10'd0;
	end
end
*/

//FOR OVAL-SHAPED METEORITE
//MAKE midspan = 10'd11 and increment = 10'd11
//Increasing the span for the roundness of the planet
/*
always @ (posedge VCounter) begin
	if(VCounter >= 10'd456 && VCounter <= 10'd513) begin
	//increasing span everytime VCounter changes
		midSpan <= midSpan + increment;
		increment <= increment - 10'd1;
	end else begin
	//Reseting if we're outside our range
		midSpan <= 10'd11;
		increment <= 10'd11;
	end
end
*/

endmodule
