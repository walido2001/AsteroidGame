module DrawDefense(
input [9:0] HCounter,
input [9:0] VCounter,

output reg dR,
output reg dG,
output reg dB);

//Drawing the shape of the defense sysstem based on the position of the pixel, i.e VCounter and HCounter
always@(HCounter or VCounter) begin

	if(VCounter >= 376 && VCounter <= 381) begin
		dR <= 1; dG <= 1; dB <= 1;
	end else if(VCounter >= 382 && VCounter <= 410) begin
		if(HCounter <= 147) begin
			dR <= 1; dG <= 1; dB <= 1;
		end else if(HCounter >= 269 && HCounter <= 275) begin
			dR <= 1; dG <= 1; dB <= 1;
		end else if(HCounter >= 397 && HCounter <= 403) begin
			dR <= 1; dG <= 1; dB <= 1;
		end else if(HCounter >= 525 && HCounter <= 531) begin
			dR <= 1; dG <= 1; dB <= 1;
		end else if(HCounter >= 653 && HCounter <= 659) begin
			dR <= 1; dG <= 1; dB <= 1;
		end else if(HCounter >= 781) begin
			dR <= 1; dG <= 1; dB <= 1;
		end
		else begin
			dR <= 0; dG <= 0; dB <= 0;
		end
	end else if(VCounter >= 411 && VCounter <= 416) begin
		dR <= 1; dG <= 1; dB <= 1;
	end else begin
		dR <= 0; dG <= 0; dB <= 0;
	end

end


endmodule
