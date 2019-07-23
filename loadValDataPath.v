module loadValDatapath(first_letter, second_letter, third_letter, fourth_letter, fifth_letter, sixth_letter, seventh_letter, eighth_letter, ninth_letter, tenth_letter, letterNum, clock, reset_n, enable, ld_x, ld_y, ld_c, col_in, col_out, X, Y, done);
  input [7:0]first_letter; 
  input [7:0]second_letter; 
  input [7:0]third_letter; 
  input [7:0]fourth_letter; 
  input [7:0]fifth_letter;
  input [7:0]sixth_letter; 
  input [7:0]seventh_letter;
  input [7:0]eighth_letter;
  input [7:0]ninth_letter;
  input [7:0]tenth_letter;
	input reset_n, enable, ld_x, ld_y, ld_c, clock;
	input [2:0] col_in;
	output done;
	output [6:0] X, Y; // location out
	input [3:0] letterNum;
	
	
  // cover 
	reg [8:0] q; // 0-328 draw black, 329 - 368 draw underlines, 369 - 529 draw letters, 480 - 496 draw box
	 reg [6:0] px;
	 reg [6:0] py;
	output reg [2:0] col_out;
	wire drawImage;   
	wire [6:0] drawAllLetterX, drawAllLetterY;
	wire [6:0] drawX, drawY;
	
	drawAllLetters dr(first_letter, second_letter, third_letter, fourth_letter, fifth_letter, sixth_letter, seventh_letter, eighth_letter, ninth_letter, tenth_letter, q-9'd386, drawAllLetterX,drawAllLetterY);
	draw dr1(60-40+letterNum*4, 100, 1, 5'd32, q-5'd368 , drawX, drawY);

	always @(posedge clock)
	begin
		if (reset_n == 1'b0)
			q <= 0;
		else if (enable == 1'b1)
			q <= q + 1'b1;
		
	end

	always @(*)
	begin
		if (reset_n == 1'b0)
			q <= 0;
		else if (enable == 1'b1) begin
			if (q < 10'd328) // black out everything drawn before
				begin
					col_out <= 3'b000;
					py <= q[2:0];
					px <= q[8:3];
				end
			else if (q <= 10'd368)
				begin	
					py <= 100;
					px <= q - 329 + 60 - 40;
				
			
					if (q[2:0] == 4)
						col_out <= 3'b111;
					else
						col_out <= 3'b000;
				end
			
			else if (q <= 10'd385) begin
				
				 
				col_out <= 3'b000;
				px <= drawX;
				py <= drawY;
				end
				
			else if (q <= 10'd550) begin
				col_out <= 3'b000;
				px <= drawAllLetterX;
				py <= drawAllLetterY;
				end
		end
	end

	
	assign X = px; //q1;
	assign Y = py; //q2;
	assign done = (q == 10'd550) ? 1 : 0;
endmodule

module drawAllLetters(first_letter, second_letter, third_letter, fourth_letter, fifth_letter, sixth_letter, seventh_letter, eighth_letter, ninth_letter, tenth_letter, counter, ox, oy);
  input [7:0]first_letter; 
  input [7:0]second_letter; 
  input [7:0]third_letter; 
  input [7:0]fourth_letter; 
  input [7:0]fifth_letter;
  input [7:0]sixth_letter; 
  input [7:0]seventh_letter;
  input [7:0]eighth_letter;
  input [7:0]ninth_letter;
  input [7:0]tenth_letter;
  input [8:0]counter;
  wire [6:0] x1 ,x2 , x3 , x4 , x5 , x6 , x7 , x8 , x9 , x10;
  wire [6:0] y1 , y2 ,y3,  y4,  y5,  y6, y7,  y8,  y9, y10;

  draw dr_1(q - 329 + 60, 100+6, 1, first_letter, counter[3:0], x1, y1);
  draw dr_2(q - 329 + 60, 100+6, 1, second_letter, counter[3:0] , x2, y2);
  draw dr_3(q - 329 + 60, 100+6, 1, third_letter, counter[3:0] , x3, y3);
  draw dr_4(q - 329 + 60, 100+6, 1, fourth_letter, counter[3:0] , x4, y4);
  draw dr_5(q - 329 + 60, 100+6, 1, fifth_letter, counter[3:0] , x5, y5);
  draw dr_6(q - 329 + 60, 100+6, 1, sixth_letter, counter[3:0] , x6, y6);
  draw dr_7(q - 329 + 60, 100+6, 1, seventh_letter, counter[3:0] , x7, y7);
  draw dr_8(q - 329 + 60, 100+6, 1, eighth_letter, counter[3:0] , x8, y8);
  draw dr_9(q - 329 + 60, 100+6, 1, ninth_letter, counter[3:0] , x9, y9);
  draw dr_10(q - 329 + 60, 100+6, 1, tenth_letter, counter[3:0] , x10, y10);

  output reg [6:0] ox, oy;

  always @(*)
    case (counter[8:4])
      4'b0000: begin
        ox <= x1;
        oy <= y1;
      end
      4'b0001: begin
        ox <= x2;
        oy <= y2;
      end
      4'b0010: begin
        ox <= x3;
        oy <= y3;
      end
      4'b0011: begin
        ox <= x4;
        oy <= y4;
      end
      4'b0100: begin
        ox <= x5;
        oy <= y5;
      end
      4'b0101: begin
        ox <= x6;
        oy <= y6;
      end
      4'b0110: begin
        ox <= x7;
        oy <= y7;
      end
      4'b0111: begin
        ox <= x8;
        oy <= y8;
      end
      4'b1000: begin
        ox <= x9;
        oy <= y9;
      end
      4'b1001: begin
        ox <= x10;
        oy <= y10;
      end
    endcase

endmodule