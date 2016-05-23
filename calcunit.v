module calcunit(startsig, work, fdata, gdata, change, g2sum, gsum, fg)
	input startsig, work, change;
	input fdata, gdata;
	output g2sum, gsum, fg;
	
	wire startsig;
	wire work;
	wire change;
	
	wire [2:0] fdata;
	wire [2:0] gdata;
	
	reg [55:0] g2sum;
	reg [43:0] gsum;
	reg [55:0] fg;
	
	reg [13:0] g2sum_con [0:3];
	reg [10:0] gsum_con [0:3];
	reg [13:0] fg_con [0:3];
	
	reg [2:0] point;
	
	always@(posedge startsig)
	begin
		g2sum_con[0] <= 0; gsum_con[0] <= 0; fg_con[0] <= 0;
		g2sum_con[1] <= 0; gsum_con[1] <= 0; fg_con[1] <= 0;
		g2sum_con[2] <= 0; gsum_con[2] <= 0; fg_con[2] <= 0;
		g2sum_con[3] <= 0; gsum_con[3] <= 0; fg_con[3] <= 0;
		point <= 4;
	end
	
	always@(posedge work)
	begin
		if (change == 1)
		begin
			case (point)
				0: 
				begin 
					point <= 1;
					gsum_con[1] <= gdata;
					g2sum_con[1] <= g2data;
					fg_con[1] <= fgdata;
				end
				1:
				begin 
					point <= 2;
					gsum_con[2] <= gdata;
					g2sum_con[2] <= g2data;
					fg_con[2] <= fgdata;
				end
				2:
				begin 
					point <= 3;
					gsum_con[3] <= gdata;
					g2sum_con[3] <= g2data;
					fg_con[3] <= fgdata;
				end
				3:
				begin 
					point <= 5;
				end
				4:
				begin 
					point <= 0;
					gsum_con[0] <= gdata;
					g2sum_con[0] <= g2data;
					fg_con[0] <= fgdata;
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
	assign g2sum[13:0] = g2sum_con[0];
	assign g2sum[27:14] = g2sum_con[1];
	assign g2sum[41:28] = g2sum_con[2];
	assign g2sum[55:42] = g2sum_con[3];

	assign gsum[10:0] = gsum_con[0];
	assign gsum[21:11] = gsum_con[1];
	assign gsum[32:22] = gsum_con[2];
	assign gsum[43:33] = gsum_con[3];

	assign fg[13:0] = fg_con[0];
	assign fg[27:14] = fg_con[1];
	assign fg[41:28] = fg_con[2];
	assign fg[55:42] = fg_con[3];
endmodule