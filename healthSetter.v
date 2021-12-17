module healthSetter(

	input healthToggle, 
	
	input reset,
	
	output [3:0] healthCounter1,
	output [3:0] healthCounter2, 
	output enable1, 
	output enable2, 
	output enable3, 
	output enable4, 
	output enable5

);

	reg [3:0] healthCounter1Temp = 4'b0000;
	reg [3:0] healthCounter2Temp = 4'b0001;
	reg Enable1 = 0;
	reg Enable2 = 0;
	reg Enable3 = 0;
	reg Enable4 = 0;
	reg Enable5 = 0;
	
	always @ (posedge healthToggle) begin 
		if(healthCounter1Temp == 0 && healthCounter2Temp != 0) begin 
			healthCounter1Temp = 4'b1001;
			healthCounter2Temp = healthCounter2Temp - 4'b1;
		end
		else if (healthCounter1Temp == 1 && healthCounter2Temp == 0) begin 
			Enable1 = 1;
			Enable2 = 1;
			Enable3 = 1;
			Enable4 = 1;
			Enable5 = 1;
			healthCounter1Temp = 4'b0;
			healthCounter2Temp = 4'b0;
		end
		else begin 
			healthCounter1Temp = healthCounter1Temp - 4'b1;	
		end
		
		if(!reset) begin
			healthCounter1Temp = 4'b0000;
			healthCounter2Temp = 4'b0001;
			Enable1 = 0;
			Enable2 = 0;
			Enable3 = 0;
			Enable4 = 0;
			Enable5 = 0;
		end
		
	end

	
	assign healthCounter1 = healthCounter1Temp;
	assign healthCounter2 = healthCounter2Temp;
	assign enable1 = Enable1;
	assign enable2 = Enable2;
	assign enable3 = Enable3;
	assign enable4 = Enable4;
	assign enable5 = Enable5;

endmodule