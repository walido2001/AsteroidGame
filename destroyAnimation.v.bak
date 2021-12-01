module destroyAnimation(
input [9:0] HCounter,
input [9:0] VCounter,
input [32:0] dV,
input [32:0] dH,

output reg dRed,
output reg dGreen);

	reg [32:0] hMax = 33'd5;
	reg [32:0] vMax = 33'd5;
	reg [32:0] one = 33'd1;
	reg [32:0] two = 33'd2;
	reg [32:0] three = 33'd3;
	reg [32:0] four = 33'd4;
	
	always@(HCounter or VCounter) begin
		if((VCounter == (dV-vMax) || VCounter == (dV+vMax))) begin
			if(HCounter == dH) begin
				dRed <= 1;
				dGreen <= 0;
			end else begin
				dRed <= 0;
				dGreen <= 0;
			end
		end else if((VCounter == (dV-vMax+one) || VCounter == (dV+vMax-one))) begin
			if(HCounter == dH || HCounter == (dH - hMax + one) || HCounter == (dH + hMax - one)) begin
				dRed <= 1;
				dGreen <= 0;
			end else begin
				dRed <= 0;
				dGreen <= 0;
			end
		end else if(VCounter == (dV-vMax+two) || VCounter == (dV+vMax-two)) begin
			if(HCounter => (dH - hMax + two) && HCounter <= (dH + hMax - two)) begin
				dRed <= 1;
				dGreen <= 0;
			end else begin
				dRed <= 0;
				dGreen <= 0;
			end
		end else if(VCounter == (dV-vMax+three) || VCounter == (dV+vMax-three)) begin
			if(HCounter => (dH - hMax + three) && HCounter <= (dH + hMax - three)) begin
				dRed <= 1;
				dGreen <= 0;
			end else begin
				dRed <= 0;
				dGreen <= 0;
			end
		end else if(VCounter == (dV-vMax+four) || VCounter == (dV+vMax-four)) begin
			if(HCounter => (dH - hMax + two) && HCounter <= (dH + hMax - two)) begin
				dRed <= 1;
				dGreen <= 0;
			end else begin
				dRed <= 0;
				dGreen <= 0;
			end
		end else if(VCounter == dV) begin
			if(HCounter >= (dH - hMax) && HCounter <= (dH + hMax)) begin
				dRed <= 1;
				dGreen <= 0;
			end else begin
				dRed <= 0;
				dGreen <= 0;
			end
		end else begin
			dRed <= 0;
			dGreen <= 0;
		end
	end
	
endmodule
