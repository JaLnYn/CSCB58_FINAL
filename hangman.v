// Part 2 skeleton

module lab6b
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
		defparam VGA.BITS_PER_COLOUR_CHANNEL = 1;
		defparam VGA.BACKGROUND_IMAGE = "black.mif";
			
	// Put your code here. Your code should produce signals x,y,colour and writeEn/plot
	// for the VGA controller, in addition to any other functionality your design may require.
    wire done, enable, ld_x, ld_y, ld_c;
    // Instantiate datapath
    datapath d0(SW[6:0], CLOCK_50, resetn, enable, ld_x, ld_y, ld_c, SW[9:7], colour, x, y, done);
    // Instantiate FSM control
	  control c0(CLOCK_50, resetn, SW[17], SW[16], done, enable, ld_x, ld_y, ld_c, writeEn);
	 
endmodule

module datapath(data_in, clock, resetn, enable, ld_x, ld_y, ld_c, col_in, col_out, X, Y, done);
	input resetn, enable, ld_x, ld_y, ld_c, clock;
	input [6:0] data_in;
	input [2:0] col_in;
	output done;
	output [6:0] X, Y;
	output [2:0] col_out;
	reg [6:0] x1, y1, c1;
	wire [3:0] q1;
	//wire q1out;
	
	
	always @(posedge clock) begin
		if (!resetn) begin
			x1 <= 7'b0;
			y1 <= 7'b0;
			c1 <= 2'b0;
		end
		else begin
			if (ld_x)
				x1 <= {1'b0, data_in};
			if (ld_y)
				y1 <= data_in;
			if (ld_c)
				c1 <= col_in;
		end
	end
	
	sync_counter s1(enable, clock, resetn, 1'b1, q1);
	
	assign col_out = c1;
	assign done = (q1 == 4'b1111) ? 1 : 0;
endmodule

module control(clock, key, goNextState,go, done, enable);
	input clock, resetn, go, fill, done, goNextState, wins; //note done has to mean keyboard enter is not pressed
	output reg enable, ld_x, ld_y, ld_c, plot;
	reg [4:0] cur_state, nxt_state;

	
  localparam  DRAW_INIT = 5'd0,
      LOAD_NUM = 5'd1,
			LOAD_NUM_WAIT = 5'd2,
			LOAD_WORD = 5'd3,
      LOAD_WORD_DRAW: 5'd4,
			LOAD_WORD_WAIT = 5'd5,
      SETUP = 5'd6,
      SETUP_WAIT = 5'd7,
      GUESS_LETTER = 5'd8,
      GUESS_LETTER_WAIT = 5'd9,
      CHECK_LETTER = 5'd10,
      CHECK_LETTER_WAIT = 5'd11,
      CHECK_WORD_DRAW = 5'd12,
      CHECK_VICTORY = 5'd13,
      VICTORY = 5'd15,
      VICTORY_WAIT = 5'd16,
      DEATH = 5'd17,
      DEATH_WAIT = 5'd18
	always @(*)
	begin: state_table // next state logic
		case (cur_state)
      DRAW_INIT: nxt_state = done ? LOADX : S_CYCLE_0;
			LOAD_NUM: begin
          if(key == 8'h0A)
            nxt_state = LOAD_NUM_WAIT;
          else
            nxt_state = LOAD_NUM;
        end 
			LOAD_NUM_WAIT: begin
          if(key == 8'h00)
            nxt_state = LOAD_NUM_WORD;
          else
            nxt_state = LOAD_NUM_WAIT;
        end
			LOAD_WORD: begin
          if(key == 8'h0A)
            nxt_state = LOAD_WORD_WAIT;
          else
            nxt_state = LOAD_WORD;
        end
			LOAD_WORD_WAIT: begin
          if(key == 8'h00)
            nxt_state = LOAD_NUM_WORD;
          else
            nxt_state = LOAD_NUM_WAIT;
        end
      LOAD_WORD_DRAW: begin
          if(done && goNextState) // done drawing
            nxt_state = LOAD_WORD_DRAW;
          else if(done) 
            nxt_state = LOAD_WORD;
          else
            nxt_state = LOAD_WORD_DRAW;
        end
      SETUP:  nxt_state = done ? SETUP_WAIT : SETUP;
      SETUP_WAIT: nxt_state = done ? GUESS_LETTER : SETUP_WAIT;
      GUESS_LETTER: begin
          if(key != 8'h00 ) // done drawing
            nxt_state = GUESS_LETTER_WAIT;
          else 
            nxt_state = GUESS_LETTER;
        end
      GUESS_LETTER_WAIT: begin
          if(key == 8'h00)
            nxt_state = CHECK_LETTER;
          else
            nxt_state = GUESS_LETTER;
        end
      CHECK_LETTER: nxt_state = done ? S_CYCLE_0 : SETUP;
      CHECK_LETTER_DRAW: begin
          if(done && goNextState) // done drawing
            if(wins){
              nxt_state = VICTORY;
            }else{
              nxt_state = DEATH;
            }
          else if(done) 
            nxt_state = LOAD_WORD;
          else
            nxt_state = LOAD_WORD_DRAW;
        end
      VICTORY: nxt_state = done ? VICTORY_WAIT : VICTORY;
      VICTORY_WAIT: nxt_state = done ? S_CYCLE_0 : VICTORY;
      DEATH: nxt_state = done ? DEATH_WAIT : DEATH;
      DEATH_WAIT: nxt_state = done ? S_CYCLE_0 : DEATH;
			default: nxt_state = LOADX;
		endcase
	end
	
	always @(*)
	begin: enable_signals // datapath control signals
		ld_x = 1'b0;
		ld_y = 1'b0;
		ld_c = 1'b0;
		enable = 1'b0;
		plot = 1'b0;
		
		case (cur_state)
			DRAW_INIT: begin
				
			end
      LOAD_NUM: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
			LOAD_NUM_WAIT: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
			LOAD_WORD: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
			LOAD_WORD_WAIT: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
      SETUP: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
      SETUP_WAIT: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
      GUESS_LETTER: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
      GUESS_LETTER_WAIT: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
      CHECK_LETTER: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
      CHECK_LETTER_WAIT: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
      CHECK_VICTORY: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
      CHECK_VICTORY_WAIT: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
      VICTORY : begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
      VICTORY_WAIT: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
      DEATH: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
      DEATH_WAIT: begin
				ld_c = 1'b1;
				enable = 1'b1;
				plot = 1'b1;
			end
		endcase
	end
	
	always @(posedge clock)
	begin: state_FFs // current state registers
		cur_state = nxt_state;
		if (!reset_n)
			cur_state = S_CYCLE_0;
		else
			cur_state = nxt_state;
	end
endmodule

module sync_counter(enable, clock, reset_n, inc, q, debug);
	input enable, clock, reset_n, inc;
	input [3:0] startb, endb;
	output reg [3:0] q;
	
	output [3:0] debug;
	assign debug = q;
	
	always @(posedge clock)
	begin
		if (reset_n == 1'b0)
			q <= startb;
		else if (enable == 1'b1)
			if (q == 4'b1111)
				q <= 4'b0000;
			else
				q <= q + inc;
	end
endmodule
