// Part 2 skeleton

module fpga_top(SW, KEY, CLOCK_50, LEDR);
  input [7:0] SW;
  input [3:0] KEY;
  input CLOCK_50;
  output [9:0] LEDR;

  wire scan_code_ready;
  wire [ 7:0 ] scan_code;
  module keyboard(SW[7:0], KEY[1], CLOCK_50, KEY[0], scan_code, scan_code_ready);\
  reg [7:0] outKey;
  always @(*)
        if (reset)
            begin
              outKey <= 8'b0;
            end
        else
            begin    
            if(scan_code_ready)
               outKey <= scan_code;
            end
	assign LEDR = outKey;
endmodule

