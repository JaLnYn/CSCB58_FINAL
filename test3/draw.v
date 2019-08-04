module draw(sx, sy, en, img, counter, clk, outx, outy);
  input [6:0] sx, sy, img;
  input [3:0] counter;
  input en, clk;
  output reg [6:0] outx;
  output reg [6:0] outy;
  
  wire [6:0] dhex, dhey;
  draw_head dhe(sx, sy, counter,  dhex, dhey);
  wire [6:0] dbodx, dbody;
  draw_body dbod(sx, sy, counter,  dbodx, dbody);
  wire [6:0] darx, dary;
  draw_arms dar(sx, sy, counter,  darx, dary);
  wire [6:0] dllx, dlly;
  //draw_leftleg dll(sx, sy, counter,  dllx, dlly);
  wire [6:0] drlx, drly;
  //draw_rightleg drl(sx, sy, counter,  drlx, drly);
  wire [6:0] dax, day;
  draw_A da(sx, sy, counter, dax, day);
  wire [6:0] dbx, dby;
  draw_B db(sx, sy, counter, dbx, dby);
  wire [6:0] dcx, dcy;
  draw_C dc(sx, sy, counter, dcx, dcy);
  wire [6:0] ddx, ddy;
  draw_D dd(sx, sy, counter, ddx, ddy);
  wire [6:0] dex, dey;
  draw_E de(sx, sy, counter, dex, dey);
  wire [6:0] dfx, dfy;
  draw_F df(sx, sy, counter, dfx, dfy);
  wire [6:0] dgx, dgy;
  draw_G dg(sx, sy, counter, dgx, dgy);
  wire [6:0] dhx, dhy;
  draw_H dh(sx, sy, counter, dhx, dhy);
  wire [6:0] dix, diy;
  draw_I di(sx, sy, counter, dix, diy);
  wire [6:0] djx, djy;
  draw_J dj(sx, sy, counter, djx, djy);
  wire [6:0] dkx, dky;
  draw_K dk(sx, sy, counter, dkx, dky);
  wire [6:0] dlx, dly;
  draw_L dl(sx, sy, counter, dlx, dly);
  wire [6:0] dmx, dmy;
  draw_M dm(sx, sy, counter, dmx, dmy);
  wire [6:0] dnx, dny;
  draw_N dn(sx, sy, counter, dnx, dny);
  wire [6:0] dox, doy;
  draw_O doh(sx, sy, counter, dox, doy);
  wire [6:0] dpx, dpy;
  draw_P dp(sx, sy, counter, dpx, dpy);
  wire [6:0] dqx, dqy;
  draw_Q dq(sx, sy, counter, dqx, dqy);
  wire [6:0] drx, dry;
  draw_R dr(sx, sy, counter, drx, dry);
  wire [6:0] dsx, dsy;
  draw_S ds(sx, sy, counter, dsx, dsy);
  wire [6:0] dtx, dty;
  draw_T dt(sx, sy, counter, dtx, dty);
  wire [6:0] dux, duy;
  draw_U du(sx, sy, counter, dux, duy);
  wire [6:0] dvx, dvy;
  draw_V dv(sx, sy, counter, dvx, dvy);
  wire [6:0] dwx, dwy;
  draw_W dw(sx, sy, counter, dwx, dwy);
  wire [6:0] dxx, dxy;
  draw_X dx(sx, sy, counter, dxx, dxy);
  wire [6:0] dyx, dyy;
  draw_Y dy(sx, sy, counter, dyx, dyy);
  wire [6:0] dzx, dzy;
  draw_Z dz(sx, sy, counter, dzx, dzy);
  wire [6:0] dbox, dboy;
  draw_box dbo(sx, sy, counter, dbox, dboy);


  always @(posedge clk)
	begin
    if(en == 1'd1) begin // if enabled
      if (img == 4'd1) begin
        outx <= dhex;
		  outy <= dhey;
		  end
      else if (img == 4'd2) begin
			outx <= dbodx;
			outy <= dbody;
			end
      else if (img == 4'd3) begin
			outx <= darx;
			outy <= dary;
			end
      else if (img == 5'd4) begin
			outx <= dllx;
			outy <= dlly;
			end
		else if (img == 5'd5) begin
			outx <= drlx;
			outy <= drly;
			end
      else if (img == 5'd6) begin
			outx <= dax;
			outy <= day;  
			end			
		else if (img == 5'd7) begin
			outx <= dbx;
			outy <= dby;
			end	
      else if (img == 5'd8) begin
			outx <= dcx;
			outy <= dcy;
			end
      else if (img == 5'd9) begin
			outx <= ddx;
			outy <= ddy;
			end	
      else if (img == 5'd10) begin
			outx <= dex;
			outy <= dey;
			end
      else if (img == 5'd11) begin
			outx <= dfx;
			outy <= dfy;
			end
      else if (img == 5'd12) begin
			outx <= dgx;
			outy <= dgy;
			end
      else if (img == 5'd13) begin
			outx <= dhx;
			outy <= dhy;
			end
      else if (img == 5'd14) begin
			outx <= dix;
			outy <= diy;
			end
      else if (img == 5'd15) begin
			outx <= djx;
			outy <= djy;
			end
      else if (img == 5'd16) begin
			outx <= dkx;
			outy <= dky;
			end
      else if (img == 5'd17) begin
			outx <= dlx;
			outy <= dly;
			end
      else if (img == 5'd18) begin
			outx <= dmx;
			outy <= dmy;
			end
      else if (img == 5'd19) begin
			outx <= dnx;
			outy <= dny;
			end
      else if (img == 5'd20) begin
			outx <= dox;
			outy <= doy;
			end
      else if (img == 5'd21) begin
			outx <= dpx;
			outy <= dpy;
			end
      else if (img == 5'd22) begin
			outx <= dqx;
			outy <= dqy;
			end
      else if (img == 5'd23) begin
			outx <= drx;
			outy <= dry;
			end
      else if (img == 5'd24) begin
			outx <= dsx;
			outy <= dsy;
			end
      else if (img == 5'd25) begin
			outx <= dtx;
			outy <= dty;
			end
      else if (img == 5'd26) begin
			outx <= dux;
			outy <= duy;
			end
      else if (img == 5'd27) begin
			outx <= dvx;
			outy <= dvy;
			end
      else if (img == 5'd28) begin
			outx <= dwx;
			outy <= dwy;
			end
      else if (img == 5'd29) begin
			outx <= dxx;
			outy <= dxy;
			end
      else if (img == 5'd30) begin
			outx <= dyx;
			outy <= dyy;
			end
      else if (img == 5'd31) begin
			outx <= dzx;
			outy <= dzy;
			end
		else if (img == 6'd32) begin
			outx <= dbox;
			outy <= dboy;
			end
    end
	end
endmodule

module draw_head(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx <= sx - 7'd1;
          outy <= sy - 7'd1;
        end
      4'd1: begin
          outx <= sx;
          outy <= sy - 7'd1;
        end
      4'd2: begin
          outx <= sx + 7'd1;
          outy <= sy - 7'd1;
        end
      4'd3: begin
          outx <= sx - 7'd1;
          outy <= sy;
        end
      4'd4: begin
          outx <= sx ;
          outy <= sy ;
        end
      4'd5: begin
          outx <= sx + 7'd1;
          outy <= sy;
        end
      4'd6: begin
          outx <= sx - 7'd1;
          outy <= sy + 7'd1;
        end
      4'd7: begin
          outx <= sx;
          outy <= sy + 7'd1;
        end
      4'd8: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd1;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
  
endmodule

module draw_body(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx <= sx;
          outy <= sy + 7'd2;
        end
      4'd1: begin
          outx <= sx;
          outy <= sy + 7'd3;
        end
      4'd2: begin
          outx <= sx;
          outy <= sy + 7'd4;
        end
      4'd3: begin
          outx <= sx;
          outy <= sy + 7'd5;
        end
      4'd4: begin
          outx <= sx ;
          outy <= sy + 7'd6;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
  
endmodule

module draw_arms(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx <= sx-7'd4;
          outy <= sy + 7'd3;
        end
      4'd1: begin
          outx <= sx-7'd3;
          outy <= sy + 7'd3;
        end
      4'd2: begin
          outx <= sx-2;
          outy <= sy + 7'd3;
        end
      4'd3: begin
          outx <= sx-7'd1;
          outy <= sy + 7'd3;
        end
      4'd4: begin
          outx <= sx;
          outy <= sy + 7'd3;
        end
      4'd5: begin
          outx <= sx+7'd1;
          outy <= sy + 7'd3;
        end
      4'd6: begin
          outx <= sx+7'd2;
          outy <= sy + 7'd3;
        end
      4'd7: begin
          outx <= sx+7'd3;
          outy <= sy + 7'd3;
        end
      4'd8: begin
          outx <= sx+7'd4;
          outy <= sy + 7'd3;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
  
endmodule

module draw_legs(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx <= sx - 7'd1;
          outy <= sy + 7'd7;
        end
      4'd1: begin
          outx <= sx - 7'd2;
          outy <= sy + 7'd8;
        end
      4'd2: begin
          outx <= sx - 7'd3;
          outy <= sy + 7'd9;
        end
      4'd3: begin
          outx <= sx - 7'd4;
          outy <= sy + 7'd10;
        end
      4'd4: begin
          outx <= sx - 7'd5;
          outy <= sy + 7'd11;
        end
      4'd5: begin
          outx <= sx - 7'd6;
          outy <= sy + 7'd12;
        end
      4'd6: begin
          outx <= sx - 7;
          outy <= sy + 7'd13;
        end
      4'd7: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd7;
        end
      4'd8: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd8;
        end
      4'd9: begin
          outx <= sx + 7'd3;
          outy <= sy + 7'd9;
        end
      4'd10: begin
          outx <= sx + 7'd4;
          outy <= sy + 7'd10;
        end
      4'd11: begin
          outx <= sx + 7'd5;
          outy <= sy + 7'd11;
        end
      4'd12: begin
          outx <= sx + 7'd6;
          outy <= sy + 7'd12;
        end
      4'd13: begin
          outx <= sx + 7'd7;
          outy <= sy + 7'd13;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
  
endmodule

module draw_rightleg(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx <= sx - 7'd1;
          outy <= sy + 7'd7;
        end
      4'd1: begin
          outx <= sx - 7'd2;
          outy <= sy + 7'd8;
        end
      4'd2: begin
          outx <= sx - 7'd3;
          outy <= sy + 7'd9;
        end
      4'd3: begin
          outx <= sx - 7'd3;
          outy <= sy + 7'd10;
        end
      4'd4: begin
          outx <= sx - 7'd4;
          outy <= sy + 7'd11;
        end
      4'd5: begin
          outx <= sx - 7'd5;
          outy <= sy + 7'd12;
        end
      4'd6: begin
          outx <= sx - 7'd6;
          outy <= sy + 7'd13;
        end
      4'd7: begin
          outx <= sx - 7'd4;
          outy <= sy + 7'd10;
        end
      4'd8: begin
          outx <= sx+7'd4;
          outy <= sy + 7'd6;
        end
      4'd9: begin
          outx <= sx+7'd4;
          outy <= sy + 7'd6;
        end
      4'd10: begin
          outx <= sx+7'd4;
          outy <= sy + 7'd6;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
  
endmodule

module draw_box(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx <= sx;
          outy <= sy;
        end
      4'd1: begin
          outx <= sx;
          outy <= sy + 7'd1;
        end
      4'd2: begin
          outx <= sx;
          outy <= sy + 7'd2;
        end
      4'd3: begin
          outx <= sx;
          outy <= sy + 7'd3;
        end
      4'd4: begin
          outx <= sx;
          outy <= sy + 7'd4;
        end
      4'd5: begin
          outx <= sx + 7'd2;
          outy <= sy;
        end
      4'd6: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd1;
        end
      4'd7: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd2;
        end
      4'd8: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd3;
        end
      4'd9: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd4;
        end
      4'd10: begin
          outx <= sx + 7'd1;
          outy <= sy;
        end
      4'd11: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd1;
        end
		4'd12: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd2;
        end
		4'd13: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd3;
        end
		4'd14: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd4;
        end
		default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
	endcase
endmodule



module draw_A(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx <= sx;
          outy <= sy;
        end
      4'd1: begin
          outx <= sx;
          outy <= sy + 7'd1;
        end
      4'd2: begin
          outx <= sx;
          outy <= sy + 7'd2;
        end
      4'd3: begin
          outx <= sx;
          outy <= sy + 7'd3;
        end
      4'd4: begin
          outx <= sx;
          outy <= sy + 7'd4;
        end
      4'd5: begin
          outx <= sx + 7'd2;
          outy <= sy;
        end
      4'd6: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd1;
        end
      4'd7: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd2;
        end
      4'd8: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd3;
        end
      4'd9: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd4;
        end
      4'd10: begin
          outx <= sx + 7'd1;
          outy <= sy;
        end
      4'd11: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd2;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
  
endmodule

module draw_B(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx <= sx;
          outy <= sy;
        end
      4'd1: begin
          outx <= sx;
          outy <= sy + 7'd1;
        end
      4'd2: begin
          outx <= sx;
          outy <= sy + 7'd2;
        end
      4'd3: begin
          outx <= sx;
          outy <= sy + 7'd3;
        end
      4'd4: begin
          outx <= sx;
          outy <= sy + 7'd4;
        end
      4'd5: begin
          outx <= sx + 7'd1;
          outy <= sy;
        end
      4'd6: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd2;
        end
      4'd7: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd4;
        end
      4'd8: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd1;
        end
      4'd9: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd3;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
  
endmodule

module draw_C(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx <= sx + 7'd1;
          outy <= sy;
        end
      4'd1: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd1;
        end
      4'd2: begin
          outx <= sx;
          outy <= sy + 7'd1;
        end
      4'd3: begin
          outx <= sx;
          outy <= sy + 7'd2;
        end
      4'd4: begin
          outx <= sx;
          outy <= sy + 7'd3;
        end
      4'd5: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd4;
        end
      4'd6: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
  
endmodule

module draw_D(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx <= sx;
          outy <= sy;
        end
      4'd1: begin
          outx <= sx;
          outy <= sy + 7'd1;
        end
      4'd2: begin
          outx <= sx;
          outy <= sy + 7'd2;
        end
      4'd3: begin
          outx <= sx;
          outy <= sy + 7'd3;
        end
      4'd4: begin
          outx <= sx;
          outy <= sy + 7'd4;
        end
      4'd5: begin
          outx <= sx + 7'd1;
          outy <= sy;
        end
      4'd6: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd4;
        end
        
      4'd8: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd1;
        end
      4'd9: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd2;
        end
      4'd10: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd3;
        end
      
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_E(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx <= sx;
          outy <= sy;
        end
      4'd1: begin
          outx <= sx+7'd1;
          outy <= sy;
        end
      4'd2: begin
          outx <= sx+7'd2;
          outy <= sy;
        end
      4'd3: begin
          outx <= sx;
          outy <= sy + 7'd1;
        end
      4'd4: begin
          outx <= sx;
          outy <= sy + 7'd2;
        end
      4'd5: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd2;
        end
      4'd6: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd2;
        end
      4'd7: begin
          outx <= sx;
          outy <= sy+7'd3;
        end
      4'd8: begin
          outx <= sx;
          outy <= sy + 7'd4;
        end
      4'd9: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd4;
        end
      4'd10: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_F(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx+7'd1;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd3: begin 
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd7: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd8: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_G(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd5: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd8: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_H(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
          outx <= sx;
          outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd8: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd9: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    4'd10: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase     
endmodule

module draw_I(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
      4'd0: begin
          outx <= sx;
          outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd3: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd1;
        end
    4'd4: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd5: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd3;
        end
    4'd6: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    4'd7: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd8: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd9: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_J(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
          outx <= sx + 7'd2;
          outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd4: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    4'd5: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd6: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd7: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_K(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd4: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    4'd8: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd9: begin
        outx <= sx;
        outy <= sy;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_L(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd5: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_M(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd8: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd9: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    4'd10: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd1;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_N(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd5: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd8: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd9: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd10: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_O(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end    
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd5: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    4'd6: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd8: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd9: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd10: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd11: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_P(sx, sy, counter, outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd5: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd7: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd8: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd9: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_Q(sx, sy, counter, outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd5: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd6: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd1;
        end
    4'd7: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd8: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd3;
        end
    4'd9: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    4'd10: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_R(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd5: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd6: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd8: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd9: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_S(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd3: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd4: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd5: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd6: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_T(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd3: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd1;
        end
    4'd4: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd5: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd3;
        end
    4'd6: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_U(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd8: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd9: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    4'd10: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end

    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_V(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd5: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd8: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd9: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_W(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd8: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd9: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    4'd10: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd3;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_X(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd4: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    4'd8: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end    
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_Y(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd4: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd6: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd7: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd3;
        end
    4'd8: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_Z(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd4: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd7: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd8: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule



module draw_1(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd1;
        end
    4'd3: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd4: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd3;
        end
    4'd5: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    4'd6: begin
        outx <= sx ;
        outy <= sy + 7'd4;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_2(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd3: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd5: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd6: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_3(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
     4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd3: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd4: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd5: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd7: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd8: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    4'd9: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_4(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd3: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd4: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd8: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_5(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd5: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd8: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd9: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_6(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd4: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd6: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd8: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd9: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    4'd10: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_7(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd3: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd4: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd5: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd6: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_8(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
          outx <= sx;
          outy <= sy;
        end
    4'd1: begin
          outx <= sx;
          outy <= sy + 7'd1;
       end
    4'd2: begin
          outx <= sx;
          outy <= sy + 7'd2;
        end
    4'd3: begin
          outx <= sx;
          outy <= sy + 7'd3;
        end
    4'd4: begin
          outx <= sx;
          outy <= sy + 7'd4;
        end
    4'd5: begin
          outx <= sx + 7'd2;
          outy <= sy;
        end
    4'd6: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd1;
        end
    4'd7: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd2;
        end
    4'd8: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd3;
        end
    4'd9: begin
          outx <= sx + 7'd2;
          outy <= sy + 7'd4;
        end
    4'd10: begin
          outx <= sx + 7'd1;
          outy <= sy;
        end
    4'd11: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd2;
        end
    4'd11: begin
          outx <= sx + 7'd1;
          outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_9(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx;
        outy <= sy;
        end
    4'd1: begin
        outx <= sx + 7'd1;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd3: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd4: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    4'd6: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd7: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd8: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd2;
        end
    4'd9: begin
        outx <= sx;
        outy <= sy + 7'd4;
        end
    4'd10: begin
        outx <= sx + 7'd1;
        outy <= sy + 7'd4;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule

module draw_0(sx, sy, counter,  outx, outy);
  input [6:0] sx, sy;
  input [3:0] counter;
  
  output reg [6:0] outx;
  output reg [6:0] outy;
  always @(counter)
    case (counter)
    4'd0: begin
        outx <= sx + 7'd1;
        end
    4'd1: begin
        outx <= sx + 7'd2;
        outy <= sy;
        end
    4'd2: begin
        outx <= sx;
        outy <= sy + 7'd1;
        end
    4'd3: begin
        outx <= sx;
        outy <= sy + 7'd2;
        end
    4'd4: begin
        outx <= sx;
        outy <= sy + 7'd3;
        end
    4'd5: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd1;
        end
    4'd6: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd2;
        end
    4'd7: begin
        outx <= sx + 7'd2;
        outy <= sy + 7'd3;
        end
    default: begin
			outx <= 7'd0;
			outy <= 7'd0;
			end
		endcase
endmodule