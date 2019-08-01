
module NOTE(
	 input enable,
	 //input TIMER,
	 input [6:0]SEL,		// selects melody
    input CLOCK_50,		// clock 50MHZ
	 output sound	// sound for connecting passive buzzer
    );
 
reg [18:0] counter; 

/* slpash screen 2-6-3-5-4-2*/

/* victory 2-2-4-2-6-6-6-6 */

/* correct letter 4-6 */

/* wrong letter 1-0*/

/* lose 5-3-2-0*/


always @(posedge CLOCK_50) 
begin
	//if (!TIMER)
	//	begin
		if (SEL[0])
		begin
			if(counter==113636) 
				begin
					counter<=0; 
				end
			else 
				counter <= counter+1;
		end	
			
		if (SEL[1])
		begin
			if(counter==101215) 
				begin
					counter<=0; 
				end
			else 
				counter <= counter+1;
		end

		if (SEL[2])	// C
		begin
			if(counter== 95602) 
				counter<=0; 
			else 
				counter <= counter+1;
		end
		
		if (SEL[3])	// D
		begin
			if(counter==85178) 
				counter<=0; 
			else 
				counter <= counter+1;
		end
		
		if (SEL[4])	// E
		begin
			if(counter==75873) 
				counter<=0; 
			else 
				counter <= counter+1;
		end

		if (SEL[5])	// F
		begin
			if(counter==71633) 
				counter<=0; 
			else 
				counter <= counter+1;
		end	
			
		if (SEL[6])
			begin
			if(counter== 63775) 
				counter<=0; 
			else 
				counter <= counter+1;
		end
	// end
end



assign sound = counter[11];

endmodule


/* slpash screen 2-6-3-5-4-2*/
/* victory 2-2-4-2-6-6-6-6 */
/* correct letter 4-6 */
/* wrong letter 1-0*/
/* lose 5-3-2-0*/
/*
module NOTE(
	 input [2:0]SEL,		// selects note
    input CLOCK_50,		// clock 50MHZ
    input in,		// pause button
	 output sound		// GPIO[0] for connecting passive buzzer
    );
 
reg [15:0] counter;
 
always @(posedge CLOCK_50) // this makes A
begin
	if(in)
	begin
	if (SEL == 3'b000)
	begin
		if(counter==113636) 
			counter<=0; 
		else 
			counter <= counter+1;
	end
		
	if (SEL == 3'b001)	// B
	begin
		if(counter==101215) 
			counter<=0; 
		else 
			counter <= counter+1;
	end
	
	if (SEL == 3'b010)	// C
	begin
		if(counter== 95602) 
			counter<=0; 
		else 
			counter <= counter+1;
	end
	
	if (SEL == 3'b011)	// D
	begin
		if(counter==85178) 
			counter<=0; 
		else 
			counter <= counter+1;
	end
	
	if (SEL == 3'b100)	// E
	begin
		if(counter==75873) 
			counter<=0; 
		else 
			counter <= counter+1;
	end

	if (SEL == 3'b101)	// F
	begin
		if(counter==71633) 
			counter<=0; 
		else 
			counter <= counter+1;
	end

	if (SEL == 3'b110)	// G
	begin
		if(counter== 63775) 
			counter<=0; 
		else 
			counter <= counter+1;
	end
	end
end 

assign sound = counter[15];

endmodule 

*/
