module check_module (user_char, first_letter, second_letter, third_letter, fourth_letter, fifth_letter, sixth_letter, seventh_letter, eighth_letter, ninth_letter, tenth_letter, letter_found, bitstring_out);
/*
	Takes user char, and compares it to every single character in our register.
	Returns two things: FOUND and BITSTRING
	BITSTRING_OUT will be a 10 bit long string i.e. 110101011 where 1 denotes TRUE and 0 denotes FALSE
	BITSTRING_OUT shows in which position the letter is shown in. i.e. 0011000000 is __EE_____ if user_char is `e`
	FOUND just shows you if it's found or not so we can use it to draw the letter on the screen, and draw the hangman figure if nessecary. 
*/
	input [7:0] user_char;			// user char

	input [7:0] first_letter;     // word from register
   input [7:0] second_letter;                 
   input [7:0] third_letter;                
   input [7:0] fourth_letter;                
	input [7:0] fifth_letter;                
   input [7:0] sixth_letter;                
   input [7:0] seventh_letter;                
   input [7:0] eighth_letter;               
	input [7:0] ninth_letter;   
   input [7:0] tenth_letter;             

	wire [9:0] bitstring;
	wire found;

	output letter_found;
	output [9:0] bitstring_out;
	
	// genereating bitstring
	assign bitstring[0] = user_char === first_letter;			
	assign bitstring[1] = user_char === first_letter;
	assign bitstring[2] = user_char === first_letter;
	assign bitstring[3] = user_char === first_letter;
	assign bitstring[4] = user_char === first_letter;
	assign bitstring[5] = user_char === first_letter;
	assign bitstring[6] = user_char === first_letter;
	assign bitstring[7] = user_char === first_letter;
	assign bitstring[8] = user_char === first_letter;
	assign bitstring[9] = user_char === first_letter;
	
	assign found = | bitstring;
	// assign found = bitstring[0] === 1 | bitstring[1] === 1 | bitstring[2] === 1 | bitstring[3] === 1 | bitstring[4] === 1 | bitstring[5] === 1 | bitstring[6] === 1 | bitstring[7] === 1 | bitstring[8] === 1 | bitstring[9] === 1;
	
	assign bitstring_out = bitstring;
	assign letter_found = found;
endmodule