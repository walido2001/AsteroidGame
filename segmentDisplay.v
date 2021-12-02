module segmentDisplay (input [3:0] a, output [6:0] b);


	//If reading the simplifications is too cancerous. 
	//Check out this google doc for the writtin simplifications which could be easier to read
	//	https://drive.google.com/file/d/1YCHgSkEKiLgrfN2ctlx6sR0d5zlfnmsT/view?usp=sharing
	
	//A -> a[3]
	//B -> a[2]
	//C -> a[1]
	//D ->a[0]

	
	// No simplifications performed
	assign b[0] = (~a[3] & ~a[2] & ~a[1] & a[0]) | (~a[3] & a[2] & ~a[1] & ~a[0]) | (a[3] & ~a[2] & a[1] & a[0]) | (a[3] & a[2] & ~a[1] & a[0]);


	
	// F(1) = (notA B notC D) + (notA B C notD) + (A notB C D) + (A B notC notD) + (A B C notD) + (A B C D)
	// = (notA B notC D) + (notA B C notD) + (A C D)(notB + B) + (A B notD)(notC + C)
	// = (notA B notC D) + (notA B C notD) + (A C D) + (A B notD)
	assign b[1] = (~a[3] & a[2] & ~a[1] & a[0]) | (~a[3] & a[2] & a[1] & ~a[0]) | (a[3] & a[1] & a[0]) | (a[3] & a[2] & ~a[0]);


	
	// F(6) = (notA notB notC notD) + (notA notB notC D) + (notA B C D) + (A B notC notD) 
	// = (notA notB notC)(D + notD) + (notA B C D) + (A B notC notD)
	// = (notA notB notC) + (notA B C D) + (A B notC notD)
	assign b[6] = (~a[3] & ~a[2] & ~a[1]) | (~a[3] & a[2] & a[1] & a[0]) | (a[3] & a[2] & ~a[1] & ~a[0]);



	// F(5) = (notA notB notC D) + (notA notB C notD) + (notA notB C D) + (notA B C D) + (A B notC D)
	// = (notA notB)( (notC D) + (C notD) + (CD) ) + (notA B C D) + (A B notC D)
	// = (notA notB)( (notC D) + C(D + notD)) + (notA B C D) + (A B notC D)
	// = (notA notB)( (notC D) + C ) + (notA B C D) + (A B notC D)
	assign b[5] = ( (~a[3] & ~a[2]) & ( (~a[1] & a[0]) | a[1] ) ) | (~a[3] & a[2] & a[1] & a[0]) | (a[3] & a[2] & ~a[1] & a[0]);


	
	//F(2) = (notA notB C notD) + (A B notC notD) + (A B C notD) + (A B C D)
	// = (notA notB C notD) + (A B notC notD) + (A B C)(notD + D)
	// = (notA notB C notD) + (A B notC notD) + (A B C)
	assign b[2] = (~a[3] & ~a[2] & a[1] & ~a[0]) | (a[3] & a[2] & ~a[1] & ~a[0]) | (a[3] & a[2] & a[1]);


	
	//F(3) = (notA notB notC D) + (notA B notC notD) + (notA B C D) + (A notB C notD) + (A B C D)
	// = (notA notB notC D) + (notA B notC D) + (A notB C notD) + (B C D)(notA + A)
	// = (notA notB notC D) + (notA B notC D) + (A notB C notD) + (B C D)
	assign b[3] = (~a[3] & ~a[2] & ~a[1] & a[0]) | (~a[3] & a[2] & ~a[1] & ~a[0]) | (a[3] & ~a[2] & a[1] & ~a[0]) | (a[2] & a[1] & a[0]);

	
	// F(4) = (notA notB notC D) + (notA notB C D) + (notA B notC notD) + (notA B notC D) + (notA B C D) + (A notB notC D)
	// = (notA notB D)(notC + C) + (notA B C)(notD + D) + (notA B C D) + (A notB notC D)
	// = (notA notB D) + (notA B notC) + (notA B C D) + (A notB notC D)
	assign b[4] = (~a[3] & ~a[2] & a[0]) | (~a[3] & a[2] & ~a[1]) | (~a[3] & a[2] & a[1] & a[0]) | (a[3] & ~a[2] & ~a[1] & a[0]);

endmodule