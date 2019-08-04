module keyboard(
        input wire [7:0] SW,          // output to determine if scan code is converted to lower or upper ascii code for a key
        input wire inputDone,
        input wire clk, reset,
        output wire [7:0] scan_code,         // scan_code received from keyboard to process
        output wire scan_code_ready         // signal to outer control system to sample scan_code
    );
  // mux
  reg [7:0] keyboard;
  reg previousClicked;
  always @(posedge clk, posedge reset)
    if (reset)
      begin
        keyboard <= 0;
      end
    else
      begin    
        if(previousClicked == 8'b0)
          begin
          if(SW[7:0] != 8'b0 && inputDone)
            keyboard <= SW[7:0];
            previousClicked <= 1'b1;
          end
        if(keyboard == 8'b0);
          previousClicked <= 1'b0;
      end
  assign scan_code_ready = previousClicked;
  assign scan_code = keyboard;
  

endmodule
  

  