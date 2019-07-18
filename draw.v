module draw(sx, sy, en, img, counter, clk, outx, outy);
  input [6:0] sx, sy, img;
  input [3:0] counter;
  input en, clk;
  reg output [6:0] outx;
  reg output [6:0] outy;
  always @(posedge clk)
	begin
    if(en == 1'd1) // if enabled
      if (img == 4'd1)
        draw_head(sx, sy, counter,  outx, outy);
      else if (img == 4'd2)
        draw_body(sx, sy, counter,  outx, outy);
      else if (img == 4'd3)
        draw_arms(sx, sy, counter,  outx, outy);
      else if (img == 4'd4)
        draw_leftleg(sx, sy, counter,  outx, outy);
      else if (img == 5'd5)
        draw_rightleg(sx, sy, counter,  outx, outy);
      else if (img == 5'd6)
        draw_A(sx, sy, counter,  outx, outy);
      else if (img == 5'd7)
        draw_B(sx, sy, counter,  outx, outy);
      else if (img == 5'd8)
        draw_C(sx, sy, counter,  outx, outy);
      else if (img == 5'd9)
        draw_D(sx, sy, counter,  outx, outy);
      else if (img == 5'd10)
        draw_E(sx, sy, counter,  outx, outy);
      else if (img == 5'd11)
        draw_F(sx, sy, counter,  outx, outy);
      else if (img == 5'd12)
        draw_G(sx, sy, counter,  outx, outy);
      else if (img == 5'd13)
        draw_H(sx, sy, counter,  outx, outy);
      else if (img == 5'd14)
        draw_I(sx, sy, counter,  outx, outy);
      else if (img == 5'd15)
        draw_J(sx, sy, counter,  outx, outy);
      else if (img == 5'd16)
        draw_K(sx, sy, counter,  outx, outy);
      else if (img == 5'd17)
        draw_L(sx, sy, counter,  outx, outy);
      else if (img == 5'd18)
        draw_M(sx, sy, counter,  outx, outy);
      else if (img == 5'd19)
        draw_N(sx, sy, counter,  outx, outy);
      else if (img == 5'd20)
        draw_O(sx, sy, counter,  outx, outy);
      else if (img == 5'd21)
        draw_P(sx, sy, counter,  outx, outy);
      else if (img == 5'd22)
        draw_Q(sx, sy, counter,  outx, outy);
      else if (img == 5'd23)
        draw_R(sx, sy, counter,  outx, outy);
      else if (img == 5'd24)
        draw_S(sx, sy, counter,  outx, outy);
      else if (img == 5'd25)
        draw_T(sx, sy, counter,  outx, outy);
      else if (img == 5'd26)
        draw_U(sx, sy, counter,  outx, outy);
      else if (img == 5'd27)
        draw_V(sx, sy, counter,  outx, outy);
      else if (img == 5'd28)
        draw_W(sx, sy, counter,  outx, outy);
      else if (img == 5'd29)
        draw_X(sx, sy, counter,  outx, outy);
      else if (img == 5'd30)
        draw_Y(sx, sy, counter,  outx, outy);
      else if (img == 5'd31)
        draw_Z(sx, sy, counter,  outx, outy);
    end
	end
endmodule

module draw_head(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx = sx - 1;
          outy = sy - 1;
        end
      4'd1: begin
          outx = sx;
          outy = sy - 1;
        end
      4'd2: begin
          outx = sx + 1;
          outy = sy - 1;
        end
      4'd3: begin
          outx = sx - 1;
          outy = sy;
        end
      4'd4: begin
          outx = sx ;
          outy = sy ;
        end
      4'd5: begin
          outx = sx + 1;
          outy = sy;
        end
      4'd6: begin
          outx = sx - 1;
          outy = sy + 1;
        end
      4'd7: begin
          outx = sx;
          outy = sy + 1;
        end
      4'd8: begin
          outx = sx + 1;
          outy = sy + 1;
        end
    endcase
  end
endmodule

module draw_body(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx = sx;
          outy = sy + 2;
        end
      4'd1: begin
          outx = sx;
          outy = sy + 3;
        end
      4'd2: begin
          outx = sx;
          outy = sy + 4;
        end
      4'd3: begin
          outx = sx;
          outy = sy + 5;
        end
      4'd4: begin
          outx = sx ;
          outy = sy + 6;
        end
    endcase
  end
endmodule

module draw_arms(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx = sx-4;
          outy = sy + 3;
        end
      4'd1: begin
          outx = sx-3;
          outy = sy + 3;
        end
      4'd2: begin
          outx = sx-2;
          outy = sy + 3;
        end
      4'd3: begin
          outx = sx-1;
          outy = sy + 3;
        end
      4'd4: begin
          outx = sx;
          outy = sy + 3;
        end
      4'd5: begin
          outx = sx+1;
          outy = sy + 3;
        end
      4'd6: begin
          outx = sx+2;
          outy = sy + 3;
        end
      4'd7: begin
          outx = sx+3;
          outy = sy + 3;
        end
      4'd8: begin
          outx = sx+4;
          outy = sy + 3;
        end
    endcase
  end
endmodule

module draw_legs(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx = sx - 1;
          outy = sy + 7;
        end
      4'd1: begin
          outx = sx - 2;
          outy = sy + 8;
        end
      4'd2: begin
          outx = sx - 3;
          outy = sy + 9;
        end
      4'd3: begin
          outx = sx - 4;
          outy = sy + 10;
        end
      4'd4: begin
          outx = sx - 5;
          outy = sy + 11;
        end
      4'd5: begin
          outx = sx - 6;
          outy = sy + 12;
        end
      4'd6: begin
          outx = sx - 7;
          outy = sy + 13;
        end
      4'd7: begin
          outx = sx + 1;
          outy = sy + 7;
        end
      4'd8: begin
          outx = sx + 2;
          outy = sy + 8;
        end
      4'd9: begin
          outx = sx + 3;
          outy = sy + 9;
        end
      4'd10: begin
          outx = sx + 4;
          outy = sy + 10;
        end
      4'd11: begin
          outx = sx + 5;
          outy = sy + 11;
        end
      4'd12: begin
          outx = sx + 6;
          outy = sy + 12;
        end
      4'd13: begin
          outx = sx + 7;
          outy = sy + 13;
        end
    endcase
  end
endmodule

module draw_rightleg(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx = sx - 1;
          outy = sy + 7;
        end
      4'd1: begin
          outx = sx - 2;
          outy = sy + 8;
        end
      4'd2: begin
          outx = sx - 3;
          outy = sy + 9;
        end
      4'd3: begin
          outx = sx - 3;
          outy = sy + 10;
        end
      4'd4: begin
          outx = sx - 4;
          outy = sy + 11;
        end
      4'd5: begin
          outx = sx - 5;
          outy = sy + 12;
        end
      4'd6: begin
          outx = sx - 6;
          outy = sy + 13;
        end
      4'd7: begin
          outx = sx - 4;
          outy = sy + 10;
        end
      4'd8: begin
          outx = sx+4;
          outy = sy + 6;
        end
      4'd9: begin
          outx = sx+4;
          outy = sy + 6;
        end
      4'd10: begin
          outx = sx+4;
          outy = sy + 6;
        end
    endcase
  end
endmodule

module draw_A(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx = sx + 1;
          outy = sy;
        end
      4'd1: begin
          outx = sx;
          outy = sy + 1;
        end
      4'd2: begin
          outx = sx;
          outy = sy + 2;
        end
      4'd3: begin
          outx = sx;
          outy = sy + 3;
        end
      4'd4: begin
          outx = sx;
          outy = sy + 4;
        end
      4'd5: begin
          outx = sx;
          outy = sy + 5;
        end
      4'd6: begin
          outx = sx + 1;
          outy = sy + 2;
        end
      4'd7: begin
          outx = sx + 2;
          outy = sy + 1;
        end
      4'd8: begin
          outx = sx + 2;
          outy = sy + 2;
        end
      4'd9: begin
          outx = sx + 2;
          outy = sy + 3;
        end
      4'd10: begin
          outx = sx + 2;
          outy = sy + 4;
        end
      4'd11: begin
          outx = sx + 2;
          outy = sy + 5;
        end
    endcase
  end
endmodule

module draw_B(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx = sx + 1;
          outy = sy;
        end
      4'd1: begin
          outx = sx;
          outy = sy + 1;
        end
      4'd2: begin
          outx = sx;
          outy = sy + 2;
        end
      4'd3: begin
          outx = sx;
          outy = sy + 3;
        end
      4'd4: begin
          outx = sx;
          outy = sy + 4;
        end
      4'd5: begin
          outx = sx;
          outy = sy + 5;
        end
      4'd6: begin
          outx = sx;
          outy = sy;
        end
      4'd7: begin
          outx = sx + 1;
          outy = sy;
        end
      4'd8: begin
          outx = sx + 2;
          outy = sy + 1;
        end
      4'd9: begin
          outx = sx + 1;
          outy = sy + 3;
        end
      4'd10: begin
          outx = sx + 2;
          outy = sy + 4;
        end
      4'd11: begin
          outx = sx + 2;
          outy = sy + 5;
        end
      4'd12: begin
          outx = sx + 1;
          outy = sy + 5;
        end
    endcase
  end
endmodule

module draw_C(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx = sx + 1;
          outy = sy;
        end
      4'd1: begin
          outx = sx;
          outy = sy + 1;
        end
      4'd2: begin
          outx = sx;
          outy = sy + 2;
        end
      4'd3: begin
          outx = sx;
          outy = sy + 3;
        end
      4'd4: begin
          outx = sx;
          outy = sy + 4;
        end
      4'd5: begin
          outx = sx + 1;
          outy = sy + 4;
        end
      4'd6: begin
          outx = sx + 2;
          outy = sy + 4;
        end
      4'd7: begin
          outx = sx + 2;
          outy = sy;
        end
    endcase
  end
endmodule

module draw_D(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx = sx;
          outy = sy;
        end
      4'd1: begin
          outx = sx;
          outy = sy + 1;
        end
      4'd2: begin
          outx = sx;
          outy = sy + 2;
        end
      4'd3: begin
          outx = sx;
          outy = sy + 3;
        end
      4'd4: begin
          outx = sx;
          outy = sy + 4;
        end
      4'd5: begin
          outx = sx;
          outy = sy + 5;
        end
      4'd6: begin
          outx = sx+1;
          outy = sy;
        end
      4'd7: begin
          outx = sx + 1;
          outy = sy+5;
        end
      4'd8: begin
          outx = sx + 2;
          outy = sy + 1;
        end
      4'd9: begin
          outx = sx + 2;
          outy = sy + 3;
        end
      4'd10: begin
          outx = sx + 2;
          outy = sy + 4;
        end
      
    endcase
  end
endmodule

module draw_E(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx = sx;
          outy = sy;
        end
      4'd1: begin
          outx = sx+1;
          outy = sy;
        end
      4'd2: begin
          outx = sx+2;
          outy = sy;
        end
      4'd3: begin
          outx = sx;
          outy = sy + 1;
        end
      4'd4: begin
          outx = sx;
          outy = sy + 2;
        end
      4'd5: begin
          outx = sx + 1;
          outy = sy + 2;
        end
      4'd6: begin
          outx = sx + 2;
          outy = sy + 2;
        end
      4'd7: begin
          outx = sx;
          outy = sy+3;
        end
      4'd8: begin
          outx = sx + ;
          outy = sy + 4;
        end
      4'd9: begin
          outx = sx + 1;
          outy = sy + 3;
        end
      4'd10: begin
          outx = sx + 2;
          outy = sy + 4;
        end
      4'd11: begin
          outx = sx + 2;
          outy = sy + 5;
        end
      4'd12: begin
          outx = sx + 1;
          outy = sy + 5;
        end
    endcase
  end
endmodule

module draw_F(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
endmodule

module draw_G(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
endmodule

module draw_H(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
endmodule

module draw_I(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  reg output [6:0] outx;
  reg output [6:0] outy;
endmodule

module draw_J(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_K(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_L(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_M(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_N(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_O(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_P(sx, sy, counter, outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_Q(sx, sy, counter, outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_R(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_S(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_T(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_U(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_V(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_W(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_X(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_Y(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule

module draw_Z(sx, sy, counter,  outx, outy);
  input sx, sy, counter;
  reg output outx;
  reg output outy;
endmodule