 /* Passive buzzer KY-006 
	 Left to right, pins facing down:	
    Signal, +5V, Ground */

module buzzer(
	 input [17:0]SW,		// selects Melody
	 //input [6:0]SEL,
	 //input TIMER,
    input CLOCK_50,		// clock 50MHZ
	 output [1:0]GPIO		// GPIO[0] for connecting passive buzzer
    );
 	 
		
	 
    NOTE note(
		  .enable(SW[17]),
		  //.SEL(SEL[6:0]
		  //.TIMER(TIMER),
        .SEL(SW[6:0]),
        .CLOCK_50(CLOCK_50),
        .sound(GPIO[0])
		  );
 
	
	
	
	endmodule
