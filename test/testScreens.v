// Part 2 skeleton

module testScreens
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
		LEDR
	);
	
	input			CLOCK_50;				//	50 MHz
	input   [17:0]  SW;
	input   [3:0]   KEY;

	output [7:0] LEDR;
	
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
			
	
	wire done;
	wire splashEn, victoryEn, deathEn;
	
	// Instantiate FSM control
	control c0(CLOCK_50, resetn, writeEn, splashEn, victoryEn, deathEn, done, SW[0]);	
	//datapath dp(CLOCK_50, resetn, writeEn, splashEn, victoryEn, deathEn, x, y, colour, done, SW[0]);
	drawSplashScreen(splashEn, CLOCK_50, resetn, x, y, colour, done);
	drawVictoryScreen(victoryEn, CLOCK_50, resetn, x, y, colour, done);
	drawDeathScreen(deathEn, CLOCK_50, resetn, x, y, colour, done);
	 
endmodule

module control(clock, resetn, writeEn, splashEn, victoryEn, deathEn, done, goNextState);
	input clock, resetn, done, goNextState; //note done has to mean keyboard enter is not pressed
	output reg writeEn, splashEn, victoryEn, deathEn;
	
	reg [4:0] cur_state, nxt_state;
	
	localparam DRAW_SPLASH = 5'd0,
				  DRAW_SPLASH_WAIT = 5'd1;
				  DRAW_VICTORY = 5'd2,
				  DRAW_VICTORY_WAIT = 5'd3,
				  DRAW_DEATH = 5'd4,
				  DRAW_DEATH_WAIT = 5'd5;
				  
	always @(*)
	begin: state_table // next state logic
		case (cur_state)
			DRAW_SPLASH: nxt_state = done ? DRAW_SPLASH_WAIT : DRAW_SPLASH;
			DRAW_SPLASH_WAIT: nxt_state = goNextState ? DRAW_VICTORY : DRAW_SPLASH_WAIT;
			DRAW_VICTORY: nxt_state = done ? DRAW_VICTORY_WAIT : DRAW_VICTORY;
			DRAW_VICTORY_WAIT: nxt_state = goNextState ? DRAW_DEATH : DRAW_VICTORY_WAIT;
			DRAW_DEATH:  nxt_state = done ? DRAW_DEATH_WAIT : DRAW_DEATH;
			DRAW_DEATH_WAIT: nxt_state = goNextState ? DRAW_SPLASH : DRAW_DEATH_WAIT;
			default: nxt_state = DRAW_SPLASH;
		endcase
	end
  
	always @(*)
	begin: enable_signals // datapath control signals
		splashEn = 1'b0;
		victoryEn = 1'b0;
		deathEn = 1'b0;
		writeEn = splashEn || victoryEn || deathEn;
		
		case (cur_state)
			DRAW_SPLASH: begin
					splashEn = 1'b1;
				end 
			DRAW_SPLASH_WAIT: begin
					splashEn = 1'b0;
				end
			DRAW_VICTORY : begin
					victoryEn = 1'b1;
				end
			DRAW_VICTORY_WAIT: begin
					victoryEn = 1'b0;
				end
			DRAW_DEATH: begin
					deathEn = 1'b1;
				end
			DRAW_DEATH_WAIT: begin
					deathEn = 1'b0;
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

//module datapath(clock, resetn, writeEn, splashEn, victoryEn, deathEn, x, y, colour, done, goNextScreen);
//	input clock, resetn, splashEn, victoryEn, deathEn;
//	output reg writeEn;
//	output reg [7:0] x;
//	output reg [6:0] y;
//	output reg [2:0] colour;
	
	
	
//endmodule