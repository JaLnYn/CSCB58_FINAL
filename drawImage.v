//module drawImage(enable, clock, option, out_x, out_y, out_col);
//	input enable, clock, option;	
//	output reg [7:0] out_x;
//	output reg [6:0] out_y;
//	output reg [2:0] out_col;
//	
//	begin
//		if(enable == 1'b1) begin
//			if (option == 1'b0)
//				drawVictoryScreen dv(clock, out_x, out_y, out_col);
//			else if (option == 1'b1)
//				drawDeathScreen dd(clock, out_x, out_y, out_col);
//		end
//	end
//endmodule
module drawSplashScreen(enable, clock, resetn, out_x, out_y, out_col);
	input enable, clock;
	output reg [7:0] out_x;
	output reg [6:0] out_y;
	output reg [2:0] out_col;
	input resetn;
	
	wire [7:0] x;
	wire [6:0] y;
	wire [14:0] counter;
	wire [2:0] col;
	
	sync_counter_di s1(enable, clock, resetn, 1'b1, x, y, counter);
	splashRAM sRAM(counter, clock, 15'd0, 1'b0, col);
	
	always @(*)
	begin
		if(enable == 1'b1) 
			out_x <= x;
			out_y <= y;
			out_col <= col;
	end
endmodule

module drawVictoryScreen(enable, clock, resetn, out_x, out_y, out_col);
	input enable, clock;
	output reg [7:0] out_x;
	output reg [6:0] out_y;
	output reg [2:0] out_col;
	input resetn;
	
	wire [7:0] x;
	wire [6:0] y;
	wire [14:0] counter;
	wire [2:0] col;
	
	sync_counter_di s2(enable, clock, resetn, 1'b1, x, y, counter);
	victoryRAM vRAM(counter, clock, 15'd0, 1'b0, col);
	
	always @(*)
	begin
		if(enable == 1'b1) 
			out_x <= x;
			out_y <= y;
			out_col <= col;
	end
	
endmodule

module drawDeathScreen(enable, clock, out_x, out_y, out_col);
	input enable, clock;
	output reg [7:0] out_x;
	output reg [6:0] out_y;
	output reg [2:0] out_col;
	
	wire [7:0] x;
	wire [6:0] y;
	wire [14:0] counter;
	wire [2:0] col;
	
	sync_counter_di s3(enable, clock, resetn, 1'b1, x, y, counter);
	deathRAM dRAM(counter, clock, 15'd0, 1'b0, col);
	
	always @(*)
	begin
		if(enable == 1'b1)
			out_x <= x;
			out_y <= y;
			out_col <= col;
	end
endmodule

module sync_counter_di(enable, clock, reset_n, inc, out_x, out_y, counter);
	input enable, clock, reset_n, inc;
	output reg [7:0] out_x;
	output reg [6:0] out_y;
	output reg [14:0] counter;
	
	always @(posedge clock)
	begin
		if (reset_n == 1'b0) begin
			out_x <= 8'd0;
			out_y <= 7'd0;
			counter <= 15'd0;
		end
		
		else if (enable == 1'b1) begin
			if (counter == 15'd19199)
				counter <= 2'b00;
			else
				counter <= counter + inc;
			
			if (out_x == 8'd159) begin
				out_x <= 8'd0;
				out_y <= out_y + inc;
			end
			
			else
				out_x <= out_x + inc;
				
			if (out_y == 8'd119)
				out_y <= 8'd0;
		end
	end
endmodule
