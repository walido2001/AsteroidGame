module DesClockDivider(cin, start, cout);

// Based on code from fpga4student.com
// cin is the input clock; if from the DE10-Lite,
// the input clock will be at 50 MHz
// The clock divider toggles cout every 25 million cycles of the input clock


//Taken from Allison's Slides, with a minor modification (Changed D's value from 25 to 50) given that the input clock is 50mhz

input cin;
input start;
output reg cout;

reg[31:0] count; 
parameter D = 32'd5000000;

always @(posedge cin)
begin
	if(start) begin
		count <= count + 32'd1;
		if (count >= (D-1)) begin
			cout <= 1;
			count <= 32'd0;
		end else begin
			cout <= 0;
		end
	end else begin
		count <= 32'd0;
	end
end

endmodule
