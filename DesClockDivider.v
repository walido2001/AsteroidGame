module DesClockDivider(cin, start, cout);

//Taken from in course labs
//Starts counting the clock, if the asteroid is destroyed, which is indicated using the input "start"

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
