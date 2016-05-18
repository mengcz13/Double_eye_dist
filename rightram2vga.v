module rightram2vga(vclk, data, rdaddr, rdclk, vs, hs, r, g, b, rden);
output reg [15:0] rdaddr;
output wire rdclk;
output reg vs;
output reg hs;
output reg [2:0] r;
output reg [2:0] g;
output reg [2:0] b;
output reg rden;
input vclk;
input [2:0] data;

reg [9:0] vector_x;
reg [8:0] vector_y;
reg [15:0] nextaddr;
reg clk50;
reg clk25;

assign rdclk = vclk;

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
		if (vector_x >= 320 && vector_x <= 519 && vector_y >= 240 && vector_y <= 439)
		begin
			r <= data;
			g <= data;
			b <= data;
			rdaddr <= nextaddr;
			nextaddr <= nextaddr + 1;
			rden <= 1;
		end
		else if (vector_y >= 440)
		begin
			r <= 0;
			g <= 0;
			b <= 0;
			rdaddr <= 0;
			nextaddr <= 0;
			rden <= 0;
		end
		else
		begin
			r <= 0;
			g <= 0;
			b <= 0;
			rdaddr <= rdaddr;
			nextaddr <= nextaddr;
			rden <= 0;
		end
	end
	else
	begin
		r <= 0;
		g <= 0;
		b <= 0;
		rdaddr <= rdaddr;
		nextaddr <= nextaddr;
		rden <= 0;
	end
end

endmodule