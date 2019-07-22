module loadValDatapath(first_letter, second_letter, third_letter, fourth_letter, fifth_letter, sixth_letter, seventh_letter, eighth_letter, ninth_letter, tenth_letter, letterNum, clock, resetn, enable, ld_x, ld_y, ld_c, col_in, col_out, X, Y, done);
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
	input resetn, enable, ld_x, ld_y, ld_c, clock;
	input [6:0] data_in;
	input [2:0] col_in;
	output done;
	output [6:0] X, Y; // location out
	
	
  // cover 
	output reg [8:0] q; // 0-328 draw black, 329 - 368 draw underlines, 369 - 529 draw letters, 480 - 496 draw box
	wire [6:0] px, [6:0] py;
  output reg [2:0] col_out, [2:0] img; // color out
	wire drawImage;   

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
		else if (enable == 1'b1)
			if (q < 10'd328) // black out everything drawn before
        color = 3'b000
				py <= [2:0]q;
        px <= [8:3]q;
			else if (q <= 10'd368)
				py <= 100;
        px <= q - 329 + 60 - 40;
        if ([2:0]q == 4)
          color = 3'b111
        else
          color = 3'b000
      else if (q <= 10'd529)
        color = 3'b000
        drawAllLetters dr(first_letter, second_letter, third_letter, fourth_letter, fifth_letter, sixth_letter, seventh_letter, eighth_letter, ninth_letter, tenth_letter, q-9'd369, px,py);
      else if (q <= 10'd545)
        color = 3'b000
        draw dr1(60-40+letterNum*4, 100, 1, (box), [3:0] counter, px, py);
        
	end

  draw dr(px,py);
	assign X = px; //q1;
	assign Y = py; //q2;
	assign done = (q1 == 4'b111111) ? 1 : 0;
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
  wire [6:0] x1 , [6:0] x2 , [6:0] x3 , [6:0] x4 , [6:0] x5 , [6:0] x6 , [6:0] x7 , [6:0] x8 , [6:0] x9 , [6:0] x10;
  wire [6:0] y1 , [6:0] y2 ,[6:0] y3, [6:0] y4, [6:0] y5, [6:0] y6, [6:0] y7, [6:0] y8, [6:0] y9, [6:0] y10;

  draw dr(q - 329 + 60, 100+6, 1, first_letter, [3:0] counter, x1, y1);
  draw dr(q - 329 + 60, 100+6, 1, second_letter, [3:0] counter, x2, y2);
  draw dr(q - 329 + 60, 100+6, 1, third_letter, [3:0] counter, x3, y3);
  draw dr(q - 329 + 60, 100+6, 1, fourth_letter, [3:0] counter, x4, y4);
  draw dr(q - 329 + 60, 100+6, 1, fifth_letter, [3:0] counter, x5, y5);
  draw dr(q - 329 + 60, 100+6, 1, sixth_letter, [3:0] counter, x6, y6);
  draw dr(q - 329 + 60, 100+6, 1, seventh_letter, [3:0] counter, x7, y7);
  draw dr(q - 329 + 60, 100+6, 1, eighth_letter, [3:0] counter, x8, y8);
  draw dr(q - 329 + 60, 100+6, 1, ninth_letter, [3:0] counter, x9, y9);
  draw dr(q - 329 + 60, 100+6, 1, tenth_letter, [3:0] counter, x10, y10);

  output reg [6:0] ox, oy;

  always @(*)
    case ([8:4]counter)
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