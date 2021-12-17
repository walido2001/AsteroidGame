module displayL(input enable, output reg [6:0] out);
	
	always @ (enable) begin 
		if(enable == 1) begin 
			out[0] = 1;
			out[1] = 1;
			out[2] = 1;
			out[3] = 0;
			out[4] = 0;
			out[5] = 0;
			out[6] = 1;
		end
		else begin 
			out[0] = 1;
			out[1] = 1;
			out[2] = 1;
			out[3] = 1;
			out[4] = 1;
			out[5] = 1;
			out[6] = 1;
		end
	end
	
endmodule
