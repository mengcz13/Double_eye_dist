module seperate_view(vclk, datal, rdaddrl, rdclkl, datar, rdaddrr, rdclkr, vs, hs, r, g, b, rdenl, rdenr);
output reg [15:0] rdaddrl;
output wire rdclkl;
output reg [15:0] rdaddrr;
output wire rdclkr;
output reg vs;
output reg hs;
output reg [2:0] r;
output reg [2:0] g;
output reg [2:0] b;
output reg rdenl;
output reg rdenr;
input vclk;
input [2:0] datal;
input [2:0] datar;

reg [9:0] vector_x;
reg [8:0] vector_y;
reg [15:0] nextaddrl;
reg [15:0] nextaddrr;
reg clk50;
reg clk25;

assign rdclkl = vclk;
assign rdclkr = vclk;

always@(posedge vclk)
begin
	clk50 <= ~clk50;
end

always@(posedge clk50)
begin
	clk25 <= ~clk25;
end

always@(posedge clk25)
begin
	if (vector_x == 799)
		vector_x <= 0;
	else
		vector_x <= vector_x + 1;
end

always@(posedge clk25)
begin
	if (vector_x == 799)
	begin
		if (vector_y == 524)
			vector_y <= 0;
		else
			vector_y <= vector_y + 1;
	end
	else
		vector_y <= vector_y;
end

always@(posedge clk25)
begin
	if (vector_y >= 489 && vector_y < 491)
		vs <= 0;
	else
		vs <= 1;
end

always@(posedge clk25)
begin
	if (vector_x >= 655 && vector_x < 751)
		hs <= 0;
	else
		hs <= 1;
end

always@(posedge clk25)
begin
	if (hs == 1 && vs == 1)
	begin
		if (vector_x >= 370 && vector_x <= 469 && vector_y >= 290 && vector_y <= 389)
		begin
			r <= datar;
			g <= datar;
			b <= datar;
			rdaddrr <= nextaddrr;
			nextaddrr <= nextaddrr + 1;
			rdenr <= 1;
			rdaddrl <= rdaddrl;
			nextaddrl <= nextaddrl;
			rdenl <= 0;
		end
		else if (vector_x >= 170 && vector_x <= 269 && vector_y >= 290 && vector_y <= 389)
		begin
			r <= datal;
			g <= datal;
			b <= datal;
			rdaddrr <= rdaddrr;
			nextaddrr <= nextaddrr;
			rdenr <= 0;
			rdaddrl <= nextaddrl;
			nextaddrl <= nextaddrl + 1;
			rdenl <= 1;
		end
		else if (vector_y >= 390)
		begin
			r <= 0;
			g <= 0;
			b <= 0;
			rdaddrr <= 0;
			nextaddrr <= 0;
			rdenr <= 0;
			rdaddrl <= 0;
			nextaddrl <= 0;
			rdenl <= 0;
		end
		else
		begin
			r <= 0;
			g <= 0;
			b <= 0;
			rdaddrr <= rdaddrr;
			nextaddrr <= nextaddrr;
			rdenr <= 0;
			rdaddrl <= rdaddrl;
			nextaddrl <= nextaddrl;
			rdenl <= 0;
		end
	end
	else
	begin
		r <= 0;
		g <= 0;
		b <= 0;
		rdaddrr <= rdaddrr;
		nextaddrr <= nextaddrr;
		rdenr <= 0;
		rdaddrl <= rdaddrl;
		nextaddrl <= nextaddrl;
		rdenl <= 0;
	end
end


endmodule