module draw2(bool, ascii_register);
    
    input bool;                                    // boolean expression. If 1, we draw letter, if 0 we draw underscore
    input clk, en;                                // clock and enable which are required for the draw module. Not needed in mux, but needed to pass
    input [7:0] ascii_register;            // This holds the ascii code for the letter tested
    
    output reg [6:0] outx, outy;            // outx and outy needed to pass to the draw function
    
    reg [7:0] Y;                                /* Y is the value being passed. 
                                                    It will either be the ascii code or the underscore code. 
                                                    (underscore code not written yet so left as underscore
                                                    */
                                                    
    reg [4:0] counter;                        // counter that can tick up 16 times to allow draw enough time to draw pixel by pixel.
                                                                                                                                                                                            
    
    /*
    draw d(
        .sy(0),
        .sx(0),
        .en(en),
        .clk(clk),
        .img(bool?ascii_register, UNDERSCORE 8b'98765432),
        .counter(counter),
        .clk(clk),
        .outx(outx),
        .outy(outy)
    );
    */
    
 endmodule
