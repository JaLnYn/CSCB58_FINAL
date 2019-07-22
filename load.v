module load(clk, load, counter, ascii_code, first_letter, second_letter, third_letter, fourth_letter, fifth_letter, sixth_letter, seventh_letter, eighth_letter, ninth_letter, tenth_letter);
    input clk, load;

	 input [7:0] ascii_code; // 10 words in ascii, this is input to demux
    output reg [7:0]first_letter; 
    output reg [7:0]second_letter; 
    output reg [7:0]third_letter; 
    output reg [7:0]fourth_letter; 
    output reg [7:0]fifth_letter;
    output reg [7:0]sixth_letter; 
    output reg [7:0]seventh_letter;
    output reg [7:0]eighth_letter;
	  output reg [7:0]ninth_letter;
    output reg [7:0]tenth_letter;

	  input [3:0]counter;
	 
    always @(posedge clk)
    begin
        if(load) // if we are loading values

            if(counter == 0)
                begin
                    first_letter <= ascii_code[7:0];
                     
                end
            if(counter == 1)
                begin
                    second_letter <= ascii_code[7:0];
                     
                end
            if(counter == 2)
                begin
                    third_letter <= ascii_code[7:0];
                     
                end
            if(counter == 3)
                begin
                    fourth_letter <= ascii_code[7:0];
                     
                end
            if(counter == 4)
                begin
                    fifth_letter <= ascii_code[7:0];
                     
                end
            if(counter == 5)
                begin
                    sixth_letter <= ascii_code[7:0];
                     
                end
            if(counter == 6)
                begin
                    seventh_letter <= ascii_code[7:0];
                     
                end
            if(counter == 7)
                begin
                    eighth_letter <= ascii_code[7:0];
                     
                end
            if(counter == 8)
                begin
                    ninth_letter <= ascii_code[7:0];
                     
                end
            if(counter == 9)
                begin
                    tenth_letter <= ascii_code[7:0];
                     
                end

            //if(ascii_code == 8'h09 //TAB, because there was no ENTER)
            //    begin
            //        next_state;
            //    end
        
    end 
endmodule