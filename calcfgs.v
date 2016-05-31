module calcfgs(zero, gdata, getfdata, get2f, clk, fsum, f2sum,
					vector_xf, vector_xg, vector_y, change, startsig, work,
					f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, valid, finalstart, update);
	input clk, gdata, getfdata, get2f;
	output f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, fsum, f2sum, finalstart;
	output vector_xf, vector_xg, vector_y, work, valid, startsig, change, update;
	output zero;
	wire clk;
	reg [10:0] fsum;
	reg [13:0] f2sum;
	reg valid, finalstart;
	reg [6:0] zero;
	reg [3:0] state, next;
	reg [6:0] vector_xf;
	reg [6:0] vector_xg;
	reg [3:0] vector_y;
	
	reg [2:0] f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15;
	wire [2:0] gdata;
	wire [2:0] getfdata;
	wire [5:0] get2f;
	reg work;
	reg startsig;
	reg [3:0] count;
	reg [15:0] change;
	reg flag;
	reg [1:0] lyx;
	reg update;
	parameter waiting1 = 4'b0000, calcing = 4'b0001, starting = 4'b0010, waiting2 = 4'b0011, waiting3 = 4'b0100;
	parameter linestart = 4'b0101, clearing = 4'b0110, finalcalc = 4'b0111;
	parameter cout = 4'b1000;
	initial
	begin
		work <= 0;
		state <= starting;
		next <= starting;
		fsum <= 0;
		f2sum <= 0;
		valid <= 0;
		finalstart <= 0;
		update <= 0;
		zero <= 3'b000;
	end
	
	always@ (posedge clk)
	begin
		if (state == starting)
		begin
			next <= clearing;
			startsig <= 0;
			vector_y <= 0;
			vector_xf <= 0;
			vector_xg <= 0;
			fsum <= 0;
			f2sum <= 0;
			valid <= 0;
			update <= 0;
		end 
		else if (state == clearing)
		begin
			next <= linestart;
			startsig <= 1;
		end
		else if (state == linestart)
		begin
			startsig <= 0;
			count <= 0;
			next <= waiting1;
			vector_xf <= 0;
			vector_xg <= 0;
			flag <= 0;
		end
		else if (state == waiting1)
		begin
			next <= waiting2;
			work <= 0;
		end
		else if (state == waiting3)
		begin
			if (vector_xg == 78)
			begin
				if (vector_y == 15)
				begin
					vector_xg <= 0;
					vector_xf <= 0;
					vector_y <= 0;
					next <= finalcalc;
					lyx <= 0;
					finalstart <= 1;
				end
				else
				begin
					vector_y <= vector_y + 1;
					vector_xg <= 0;
					vector_xf <= 0;
					next <= linestart;
				end
			end
			else
			begin
				if (vector_xf == 15)
				begin
					vector_xg <= vector_xg + 1;
					vector_xf <= 0;
					next <= waiting1;
					flag <= 1;
				end
				else
				begin
					vector_xf <= vector_xf + 1;
					vector_xg <= vector_xg + 1;
					next <= waiting1;
				end
			end
			work <= 0;
			if (count == 15)
				count <= 0;
			else
				count <= count + 1;
		end 
		else if (state == waiting2)
		begin
			next <= calcing;
			work <= 0;
			f0 <= f1;
			f1 <= f2;
			f2 <= f3;
			f3 <= f4;
			f4 <= f5;
			f5 <= f6;
			f6 <= f7;
			f7 <= f8;
			f8 <= f9;
			f9 <= f10;
			f10 <= f11;
			f11 <= f12;
			f12 <= f13;
			f13 <= f14;
			f14 <= f15;
			f15 <= getfdata;
			if (vector_xf == 0 && vector_y == 0)
				zero <= getfdata;
			else
				zero <= zero;
			case (count)
				 0:change <= 16'b0000000000000001;
				 1:change <= 16'b0000000000000010;
				 2:change <= 16'b0000000000000100;
				 3:change <= 16'b0000000000001000;
				 4:change <= 16'b0000000000010000;
				 5:change <= 16'b0000000000100000;
				 6:change <= 16'b0000000001000000;
				 7:change <= 16'b0000000010000000;
				 8:change <= 16'b0000000100000000;
				 9:change <= 16'b0000001000000000;
				10:change <= 16'b0000010000000000;
				11:change <= 16'b0000100000000000;
				12:change <= 16'b0001000000000000;
				13:change <= 16'b0010000000000000;
				14:change <= 16'b0100000000000000;
				15:change <= 16'b1000000000000000;
				default:change <= 16'b0000000000000001;
			endcase
		end
		else if (state == calcing)
		begin
			next <= waiting3;
			work <= 1;
			valid <= 0;
			if (flag == 0)
			begin
				fsum <= fsum + getfdata;
				f2sum <= f2sum + get2f;
			end
			else
			begin
				fsum <= fsum;
				f2sum <= f2sum;
			end
		end
		else if (state == finalcalc)
		begin
			if (lyx == 3)
				next <= starting;
			else
				next <= cout;
			valid <= 0;
			finalstart <= 0;
			update <= 1;
		end 
		else
		begin
			update <= 0;
			valid <= 1;
			lyx <= lyx + 1;
			next <= finalcalc;
		end
	end
	
	always@(negedge clk)
	begin
		state <= next;
	end
	
endmodule
