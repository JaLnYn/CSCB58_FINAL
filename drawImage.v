module drawSplashScreen(enable, clock, resetn, out_x, out_y, out_col, done);
	input enable, clock, resetn;
	output reg [7:0] out_x;
	output reg [6:0] out_y;
	output reg [2:0] out_col;
	output reg done;
	
	wire [7:0] x;
	wire [6:0] y;
	wire [14:0] counter;
	wire [2:0] col;
	
	sync_counter_di s1(enable, clock, resetn, 1'b1, x, y, counter, done);
	splashRAM sRAM(counter, clock, 2'd0, 1'b0, col);
	
	always @(*)
	begin
		if(enable == 1'b1) 
			out_x <= x;
			out_y <= y;
			out_col <= col;
	end
endmodule

module drawVictoryScreen(enable, clock, resetn, out_x, out_y, out_col, done);
	input enable, clock, resetn;
	output reg [7:0] out_x;
	output reg [6:0] out_y;
	output reg [2:0] out_col;
	output done;
	
	wire [7:0] x;
	wire [6:0] y;
	wire [14:0] counter;
	wire [2:0] col;
	
	sync_counter_di s2(enable, clock, resetn, 1'b1, x, y, counter, done);
	victoryRAM vRAM(counter, clock, 2'd0, 1'b0, col);
	
	always @(*)
	begin
		if(enable == 1'b1) 
			out_x <= x;
			out_y <= y;
			out_col <= col;
	end
	
endmodule

module drawDeathScreen(enable, clock, resetn, out_x, out_y, out_col, done);
	input enable, resetn, clock;
	output reg [7:0] out_x;
	output reg [6:0] out_y;
	output reg [2:0] out_col;
	output reg done;
	
	wire [7:0] x;
	wire [6:0] y;
	wire [14:0] counter;
	wire [2:0] col;
	
	sync_counter_di s3(enable, clock, resetn, 1'b1, x, y, counter, done);
	deathRAM dRAM(counter, clock, 2'd0, 1'b0, col);
	
	always @(*)
	begin
		if(enable == 1'b1)
			out_x <= x;
			out_y <= y;
			out_col <= col;
	end
endmodule

module sync_counter_di(enable, clock, reset_n, inc, out_x, out_y, counter, done);
	input enable, clock, reset_n, inc;
	output reg [7:0] out_x;
	output reg [6:0] out_y;
	output reg [14:0] counter;
	output reg done;
	
	always @(posedge clock)
	begin
		if (reset_n == 1'b0) begin
			out_x <= 8'd0;
			out_y <= 7'd0;
			counter <= 15'd0;
			done <= 1'b0;
		end
		
		else if (enable == 1'b1 && !done) begin
			if (counter == 15'd19199)
				counter <= 15'd0;
			else
				counter <= counter + inc;
			
			if (out_x == 8'd159) begin
				out_x <= 8'd0;
				out_y <= out_y + inc;
			end
			
			else
				out_x <= out_x + inc;
				
			if (out_y == 7'd119) begin
				out_y <= 7'd0;
				done <= 1'b1;
			end
		end
	end
endmodule
