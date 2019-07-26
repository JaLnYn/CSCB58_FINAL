// Part 2 skeleton

module Hangman
	(
		CLOCK_50,						//	On Board 50 MHz
		// Your inputs and outputs here
    KEY,
    SW,
		// The ports below are for the VGA output.  Do not change.
		VGA_CLK,   						//	VGA Clock
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_BLANK_N,						//	VGA BLANK
		VGA_SYNC_N,						//	VGA SYNC
		VGA_R,   						//	VGA Red[9:0]
		VGA_G,	 						//	VGA Green[9:0]
		VGA_B,   						//	VGA Blue[9:0]
		PS2_CLK,
      PS2_KBDAT,
		LEDR
	);
	
	output [7:0] LEDR;
	input			CLOCK_50;				//	50 MHz
	input   [17:0]  SW;
	//output  [17:0]  LEDR;
	input   [3:0]   KEY;
	input PS2_CLK;
   input PS2_KBDAT;

	// Declare your inputs and outputs here
	// Do not change the following outputs
	output			VGA_CLK;   				//	VGA Clock
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output			VGA_BLANK_N;				//	VGA BLANK
	output			VGA_SYNC_N;				//	VGA SYNC
	output	[9:0]	VGA_R;   				//	VGA Red[9:0]
	output	[9:0]	VGA_G;	 				//	VGA Green[9:0]
	output	[9:0]	VGA_B;   				//	VGA Blue[9:0]
	
	wire resetn;
	assign resetn = KEY[0];
  assign enable = 1'b1;
	
	// Create the colour, x, y and writeEn wires that are inputs to the controller.
	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;
	wire writeEn;
	wire [7:0] scan_code;
	wire scan_code_ready;
	wire letter_case_out;
	
	wire [7:0] ascii_code;
	 keyboard k0
        (
            .clk(CLOCK_50),
            .reset(KEY[0]),
            .ps2d(PS2_KBDAT),
            .ps2c(PS2_CLK),
            .scan_code(scan_code),
            .scan_code_ready(scan_code_ready),
            .letter_case_out(letter_case_out)            
        );
    
	 
	 key2ascii k2a(1'b1, scan_code, ascii_code);
	 
	// Create an Instance of a VGA controller - there can be only one!
	// Define the number of colours as well as the initial background
	// image file (.MIF) for the controller.
	vga_adapter VGA(
			.resetn(resetn),
			.clock(CLOCK_50),
			.colour(colour),
			.x(x),
			.y(y),
			.plot(writeEn),
			/* Signals for the DAC to drive the monitor. */
			.VGA_R(VGA_R),
			.VGA_G(VGA_G),
			.VGA_B(VGA_B),
			.VGA_HS(VGA_HS),
			.VGA_VS(VGA_VS),
			.VGA_BLANK(VGA_BLANK_N),
			.VGA_SYNC(VGA_SYNC_N),
			.VGA_CLK(VGA_CLK));
		defparam VGA.RESOLUTION = "160x120";
		defparam VGA.MONOCHROME = "FALSE";
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 3;
		defparam VGA.BACKGROUND_IMAGE = "hangman.colour.mif";
			
	
    wire done, enable, letter_found, load;

    reg keyDown = 1'b0;

    reg [7:0] key;
	 wire [7:0] l1, l2,l3,l4,l5,l6,l7,l8,l9,l0;
    wire [9:0] checkModOut;
    wire [3:0] counter;
	 reg [3:0]letterNum;
    
	always @(posedge scan_code_ready)
	begin
		if(keyDown == 0) begin
			key <= ascii_code;
			if(key == 8'h12) begin
				// left arrow
				if(letterNum != 9) begin 
				letterNum <= letterNum + 3'd1;
				end
			end
			if(key == 8'h14) begin
				// left arrow
				if(letterNum != 0) begin 
				letterNum <= letterNum - 3'd1;
				end
			end
		end
		
	end
	assign LEDR[7:0] = ascii_code;
	wire [2:0] colour1;
	wire [2:0] colour2;
    load ld(CLOCK_50, load, counter, key, l1, l2,l3,l4,l5,l6,l7,l8,l9,l0);
    check_module cm(key,l1, l2,l3,l4,l5,l6,l7,l8,l9,l0, letter_found, checkModOut);
    loadValDatapath jeff(l1, l2, l3, l4, l5, l6, l7, l8, l9, l0, letterNum, CLOCK_50, 1'b1, enable, colour1, x, y, done);
    // Instantiate FSM control
	  control c0(CLOCK_50, resetn, SW[17], SW[16], done, enable);
	  
	 
endmodule


module control(clock, resetn, done, key, goNextState, wins);
	input clock, resetn, done, goNextState, wins; //note done has to mean keyboard enter is not pressed
	input [7:0] key;
	//
	//input reg enable;
	reg [4:0] cur_state, nxt_state;
	
	//assign writeEn = VEn || DEn;

	//drawVictoryScreen drawV(VEn, clock, resetn, x, y, colour, done);
	//drawDeathScreen drawD(DEn, clock, resetn, x, y, colour, done);
	
  localparam  DRAW_INIT = 5'd0,
      LOAD_NUM = 5'd1,
		LOAD_NUM_WAIT = 5'd2,
		LOAD_WORD = 5'd3,
      LOAD_WORD_DRAW = 5'd4,
		LOAD_WORD_WAIT = 5'd5,
      SETUP = 5'd6,
      SETUP_WAIT = 5'd7,
      GUESS_LETTER = 5'd8,
      GUESS_LETTER_WAIT = 5'd9,
      CHECK_LETTER = 5'd10,
		  CHECK_LETTER_DRAW = 5'd11,
      CHECK_LETTER_WAIT = 5'd11,
      CHECK_WORD_DRAW = 5'd12,
      CHECK_VICTORY = 5'd13,
      VICTORY = 5'd15,
      VICTORY_WAIT = 5'd16,
      DEATH = 5'd17,
      DEATH_WAIT = 5'd18;
		
	always @(*)
	begin: state_table // next state logic
		case (cur_state)
			DRAW_INIT: nxt_state = done ? LOAD_WORD : DRAW_INIT;
			LOAD_WORD: nxt_state = (key == 8'h0A) ? LOAD_WORD_WAIT : LOAD_WORD;
			LOAD_WORD_WAIT: nxt_state = (key == 8'h00) ? LOAD_WORD_DRAW : LOAD_WORD_WAIT;
			LOAD_WORD_DRAW: begin
				if(done && goNextState) // done drawing
					nxt_state <= LOAD_WORD_DRAW;
				else if(done) 
					nxt_state <= LOAD_WORD;
				else
					nxt_state <= LOAD_WORD_DRAW;
				end
			SETUP:  nxt_state = done ? SETUP_WAIT : SETUP;
			SETUP_WAIT: nxt_state = done ? GUESS_LETTER : SETUP_WAIT;
			GUESS_LETTER: nxt_state = (key != 8'h00) ? GUESS_LETTER_WAIT : GUESS_LETTER;
			GUESS_LETTER_WAIT: (key == 8'h00) ? CHECK_LETTER : GUESS_LETTER;
			CHECK_LETTER: nxt_state = done ? CHECK_LETTER_DRAW : CHECK_LETTER;
			CHECK_LETTER_DRAW: begin
				 if(done && goNextState) // done drawing
					if(wins)
					  nxt_state <= VICTORY;
					else
					  nxt_state <= DEATH;
					
				 else if(done) 
					nxt_state <= LOAD_WORD;
				 else
					nxt_state <= LOAD_WORD_DRAW;
			  end
			VICTORY: nxt_state = done ? VICTORY_WAIT : VICTORY;
			VICTORY_WAIT: nxt_state = done ? DRAW_INIT : VICTORY;
			DEATH: nxt_state = done ? DEATH_WAIT : DEATH;
			DEATH_WAIT: nxt_state = done ? DRAW_INIT : DEATH;
			default: nxt_state = DRAW_INIT;
		endcase
	end
  
	always @(*)
	begin: enable_signals // datapath control signals
		
		//enable <= 1'b0;
		
		
		case (cur_state)
			DRAW_INIT: begin
				
			end
      LOAD_NUM: begin
				
				//enable <= 1'b1;
			end
			LOAD_NUM_WAIT: begin
				//enable <= 1'b1;
			end
			LOAD_WORD: begin
				//enable <= 1'b1;
			end
			LOAD_WORD_WAIT: begin
				//enable <= 1'b1;
			end
      SETUP: begin
				//enable <= 1'b1;
			end
      SETUP_WAIT: begin
				//enable <= 1'b1;
			end
      GUESS_LETTER: begin
				//enable <= 1'b1;
			end
      GUESS_LETTER_WAIT: begin
				//enable <= 1'b1;
			end
      CHECK_LETTER: begin
				//enable <= 1'b1;

			end
      CHECK_LETTER_WAIT: begin
				//enable <= 1'b1;
			end
      CHECK_VICTORY: begin
				//enable <= 1'b1;
			end
      VICTORY : begin
				//enable <= 1'b1;
			end
      VICTORY_WAIT: begin
				//enable <= 1'b1;
			end
      DEATH: begin
				//enable <= 1'b1;
			end
      DEATH_WAIT: begin
				//enable <= 1'b1;
			end
		endcase
	end
	
	always @(posedge clock)
	begin: state_FFs // current state registers
		cur_state = nxt_state;
		if (!resetn)
			cur_state = DRAW_INIT;
		else
			cur_state = nxt_state;
	end
endmodule