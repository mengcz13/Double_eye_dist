module calcunit(lstart, startplace, startsig, work, valid, finalstart, fdata, gdata, g2data, fgdata, change, g2sum, gsum, fg, place, test, point);
	input lstart, startplace, startsig, work, change, valid, finalstart;
	input fdata, gdata, g2data, fgdata;
	output g2sum, gsum, fg;
	output place;
	output test, point;
	wire startsig;
	wire work;
	wire change;
	wire valid;
	wire lstart;
	wire [7:0] startplace;
	wire [2:0] fdata;
	wire [2:0] gdata;
	wire [5:0] g2data;
	wire [5:0] fgdata;

	reg [13:0] g2sum;
	reg [10:0] gsum;
	reg [13:0] fg;
	reg [5:0] place;
	
	reg [13:0] g2sum_con [0:3];
	reg [10:0] gsum_con [0:3];
	reg [13:0] fg_con [0:3];
	wire [10:0] test;
	reg [2:0] point;
	reg [2:0] pt;

	always @(posedge valid or posedge finalstart)
	begin
		if (finalstart == 1)
		begin
			g2sum <= g2sum_con[0];
			gsum <= gsum_con[0];
			fg <= fg_con[0];
			place <= startplace;
			pt <= 0;
		end
		else
		begin
			case (pt)
				0:begin pt <= 1; g2sum <= g2sum_con[1]; gsum <= gsum_con[1]; fg <= fg_con[1]; place <= startplace + 6'b010000; end
				1:begin pt <= 2; g2sum <= g2sum_con[2]; gsum <= gsum_con[2]; fg <= fg_con[2]; place <= startplace + 6'b100000; end
				2:begin pt <= 3; g2sum <= g2sum_con[3]; gsum <= gsum_con[3]; fg <= fg_con[3]; place <= startplace + 6'b110000; end
				default: begin pt <= 0; g2sum <= g2sum_con[0]; gsum <= gsum_con[0]; fg <= fg_con[0]; place <= startplace; end
			endcase	
		end
	end
	
	always@(posedge work or posedge startsig or posedge lstart)
	begin
		if (lstart == 1)
		begin
			point <= 4;
		end
		else
		if (startsig == 1)
		begin
			g2sum_con[0] <= 0; gsum_con[0] <= 0; fg_con[0] <= 0;
			g2sum_con[1] <= 0; gsum_con[1] <= 0; fg_con[1] <= 0;
			g2sum_con[2] <= 0; gsum_con[2] <= 0; fg_con[2] <= 0;
			g2sum_con[3] <= 0; gsum_con[3] <= 0; fg_con[3] <= 0;
			point <= 4;
		end
		else
		begin
			if (change == 1)
			begin
				case (point)
					0: 
					begin 
						point <= 1;
						gsum_con[1] <= gsum_con[1] + gdata;
						g2sum_con[1] <= g2sum_con[1] + g2data;
						fg_con[1] <= fg_con[1] + fgdata;
					end
					1:
					begin 
						point <= 2;
						gsum_con[2] <= gsum_con[2] + gdata;
						g2sum_con[2] <= g2sum_con[2] + g2data;
						fg_con[2] <= fg_con[2] + fgdata;
					end
					2:
					begin 
						point <= 3;
						gsum_con[3] <= gsum_con[3] + gdata;
						g2sum_con[3] <= g2sum_con[3] + g2data;
						fg_con[3] <= fg_con[3] + fgdata;
					end
					3:
					begin
						point <= 5;
					end
					4:
					begin 
						point <= 0;
						gsum_con[0] <= gsum_con[0] + gdata;
						g2sum_con[0] <= g2sum_con[0] + g2data;
						fg_con[0] <= fg_con[0] + fgdata;
					end
					default:point <= point;
				endcase
			end
			else
			begin
				if (point < 4)
				begin
					gsum_con[point] <= gsum_con[point] + gdata;
					g2sum_con[point] <= g2sum_con[point] + g2data;
					fg_con[point] <= fg_con[point] + fgdata;
				end
				else
				begin
					gsum_con[0] <= gsum_con[0];
					g2sum_con[0] <= g2sum_con[0];
					fg_con[0] <= fg_con[0];
				end
			end
		end
	end
	assign test = fg_con[1];
endmodule
