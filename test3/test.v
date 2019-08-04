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
		VGA_B   						//	VGA Blue[9:0]
	);

	input			CLOCK_50;				//	50 MHz
	input   [17:0]  SW;
	//output  [17:0]  LEDR;
	input   [3:0]   KEY;

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
	
	// Create the colour, x, y and writeEn wires that are inputs to the controller.
	wire [2:0] colour;
	wire [7:0] x;
	wire [6:0] y;
	wire writeEn;

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
			
	
    wire done, enable, letter_found, load, s1, s2, s3;
  
    wire [7:0] key;
    wire [9:0] checkModOut;
    wire [3:0] counter;
    
    datapath d0(key, letter_found, CLOCK_50, resetn, enable, s1, s2, colour, x, y, done, completeEnter);

    // load ld(CLOCK_50, load, counter, key, l1, l2,l3,l4,l5,l6,l7,l8,l9,l0);
    
    // load ld(clock, 1'b0, counter, ascii_code, first_letter, second_letter, third_letter, fourth_letter, fifth_letter, sixth_letter, seventh_letter, eighth_letter, ninth_letter, tenth_letter);
    // loadValDatapath lvd(first_letter, second_letter, third_letter, fourth_letter, fifth_letter, sixth_letter, seventh_letter, eighth_letter, ninth_letter, tenth_letter, letterNum, clock, reset_n, enable, col_out, X, Y, done);
    // // Instantiate FSM control
	  controls c0(CLOCK_50, resetn, SW[17], SW[16], done, enable, completeEnter);
	 
endmodule


module datapath(data_in, letterReady, clock, resetn, enable, s1, s2, col_out, X, Y, done, completeEnter);
	input resetn, enable, s1, s2, s3, clock;
	input [7:0] data_in; // the key pressed
  wire [7:0] l1, l2,l3,l4,l5,l6,l7,l8,l9,l0;
	output done, done1, done2;
	output [6:0] X, Y;
	output [2:0] col_out;
	//reg [6:0] x1, y1, c1;
	wire [8:0] q;
	wire [3:0]currentLetterNum;
  output completeEnter;
	
  
  load ld(clock, s1, letterReady, data_in, done1, completeEnter, currentLetterNum, l1, l2, l3, l4, l5, l6, l7, l8, l9, l0);
  loadValDatapath lvd(l1, l2, l3, l4, l5, l6, l7, l8, l9, l0, currentLetterNum, clock, reset_n, s2, col_out, X, Y, done2);
	
	
	assign done = (done1 && s1) || (done2 && s2);
endmodule

module controls(clock, resetn, done, key, s1, s2, enable, x, y, colour, completeEnter);
	input clock, resetn, done, completeEnter; //note done has to mean keyboard enter is not pressed
	input [7:0] key;
	input [7:0] x;
	input [6:0] y;
	input [2:0] colour;
	input enable;
	reg [4:0] cur_state, nxt_state;
  output reg s1, s2;
	
  localparam  NEXT_STATE = 5'd3,
	  LOAD_WORD_DRAW = 5'd0,
    LOAD_WORD = 5'd1,
		LOAD_WORD_WAIT = 5'd2
	always @(*)
	begin: state_table // next state logic
		case (cur_state)
      LOAD_WORD_DRAW: done ? LOAD_WORD_WAIT : LOAD_WORD;
      LOAD_WORD: done ? LOAD_WORD_WAIT : LOAD_WORD;
      LOAD_WORD_WAIT: completeEnter ? NEXT_STATE : LOAD_WORD_DRAW;
		endcase
	end
  
	always @(*)
	begin: enable_signals // datapath control signals
    
		case (cur_state)
      LOAD_WORD_DRAW: begin
        s2 <= 1;
        s1 <= 0;
      end
      LOAD_WORD: begin
        s1 <= 1;
        s2 <= 0;
      end
      LOAD_WORD_WAIT begin
        s1 <= 1;
        s2 <= 0;
      end
      NEXT_STATE begin

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
