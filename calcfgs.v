module calcfgs(clk, fsum, f2sum, g2sum, gsum, fg, valid);
	input clk;
	output fsum, f2sum, g2sum, gsum, fg, valid;
	wire clk;
	reg [10:0] fsum;
	reg [13:0] f2sum;
	wire [895:0] g2sum;
	wire [703:0] gsum;
	wire [895:0] fg;
	reg valid;

	reg [3:0] state, next;
	reg [3:0] vector_xf;
	reg [6:0] vector_xg;
	reg [3:0] vector_y;
	
	reg [2:0] fdata [0:15];
	wire [2:0] gdata;
	wire [2:0] getfdata;
	wire [5:0] get2f;
	reg work;
	reg startsig;
	reg [3:0] count;
	reg [15:0] change;
	reg flag;
	
	wire [55:0] get_g2sum [0:15];
	wire [45:0] get_gsum [0:15];
	wire [55:0] get_fg [0:15];
	
	parameter waiting1 = 3'b000, calcing = 3'b001, starting = 3'b010, waiting2 = 3'b011, waiting3 = 3'b100;
	parameter linestart = 3'b101;
	initial
	begin
		work <= 0;
		state <= starting;
		next <= starting;
		fsum <= 0;
		f2sum <= 0;
		valid <= 1;
	end
	
	always@ (posedge clk)
	begin
		if (state == starting)
		begin
			next <= linestart;
			startsig <= 0;
			vector_y <= 0;
			vector_xf <= 0;
			vector_xg <= 0;
			fsum <= 0;
			f2sum <= 0;
		end 
		else if (state == linestart)
		begin
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
					valid <= 1;
					next <= starting;
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
		end 
		else if (state == waiting2)
		begin
			next <= calcing;
			work <= 0;
			fdata[0] <= fdata[1];
			fdata[1] <= fdata[2];
			fdata[2] <= fdata[3];
			fdata[3] <= fdata[4];
			fdata[4] <= fdata[5];
			fdata[5] <= fdata[6];
			fdata[6] <= fdata[7];
			fdata[7] <= fdata[8];
			fdata[8] <= fdata[9];
			fdata[9] <= fdata[10];
			fdata[10] <= fdata[11];
			fdata[11] <= fdata[12];
			fdata[12] <= fdata[13];
			fdata[13] <= fdata[14];
			fdata[14] <= fdata[15];
			fdata[15] <= getfdata;
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
		end
	end
	
	always@(negedge clk)
	begin
		if (state == starting)
		begin
			startsig <= 1;
			state <= next;
		end
			state <= next;
	end
	
	assign g2sum[55:0] = get_g2sum[0];
	assign g2sum[111:56] = get_g2sum[1];
	assign g2sum[167:112] = get_g2sum[2];
	assign g2sum[223:168] = get_g2sum[3];
	assign g2sum[279:224] = get_g2sum[4];
	assign g2sum[335:280] = get_g2sum[5];
	assign g2sum[391:336] = get_g2sum[6];
	assign g2sum[447:392] = get_g2sum[7];
	assign g2sum[503:448] = get_g2sum[8];
	assign g2sum[559:504] = get_g2sum[9];
	assign g2sum[615:560] = get_g2sum[10];
	assign g2sum[671:616] = get_g2sum[11];
	assign g2sum[727:672] = get_g2sum[12];
	assign g2sum[783:728] = get_g2sum[13];
	assign g2sum[839:784] = get_g2sum[14];
	assign g2sum[895:840] = get_g2sum[15];
	
	assign gsum[43:0] = get_gsum[0];
	assign gsum[87:44] = get_gsum[1];
	assign gsum[131:88] = get_gsum[2];
	assign gsum[175:132] = get_gsum[3];
	assign gsum[219:176] = get_gsum[4];
	assign gsum[263:220] = get_gsum[5];
	assign gsum[307:264] = get_gsum[6];
	assign gsum[351:308] = get_gsum[7];
	assign gsum[395:352] = get_gsum[8];
	assign gsum[439:396] = get_gsum[9];
	assign gsum[483:440] = get_gsum[10];
	assign gsum[527:484] = get_gsum[11];
	assign gsum[571:528] = get_gsum[12];
	assign gsum[615:572] = get_gsum[13];
	assign gsum[659:616] = get_gsum[14];
	assign gsum[703:660] = get_gsum[15];
	
	assign fg[55:0] = get_fg[0];
	assign fg[111:56] = get_fg[1];
	assign fg[167:112] = get_fg[2];
	assign fg[223:168] = get_fg[3];
	assign fg[279:224] = get_fg[4];
	assign fg[335:280] = get_fg[5];
	assign fg[391:336] = get_fg[6];
	assign fg[447:392] = get_fg[7];
	assign fg[503:448] = get_fg[8];
	assign fg[559:504] = get_fg[9];
	assign fg[615:560] = get_fg[10];
	assign fg[671:616] = get_fg[11];
	assign fg[727:672] = get_fg[12];
	assign fg[783:728] = get_fg[13];
	assign fg[839:784] = get_fg[14];
	assign fg[895:840] = get_fg[15];
endmodule