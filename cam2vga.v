module cam2vga (clk, reset, vsync, href, pclk, d, xclk, hs, vs, r, g, b, resetc, test);
output xclk; // cam的输入时钟
// VGA相关
output reg hs;
output reg vs;
output reg [2:0] r;
output reg [2:0] g;
output reg [2:0] b;
output resetc;
output [2:0] test;

input clk; // FPGA提供24MHz时钟
input reset;
input vsync; // 帧同步
input href; // 行同步
input pclk; // 像素时钟，应作为系统时钟
input [2:0] d; // 像素数据

// YUV 4:2:2 像素格式：Y0 | U0 | Y1 | V1 | Y2 | U2 | Y3 | V3...
reg flag;
reg [9:0] vector_x;
reg [8:0] vector_y;

assign xclk = clk;
assign resetc = 1'b1;
assign test = d;

always@(posedge pclk or negedge reset)
begin
	if (reset == 0)
		flag <= 0;
	else
		flag <= ~flag;
end

always@(posedge flag or negedge reset)
begin
	if (reset == 0)
	begin
		r <= 3'b000;
		g <= 3'b000;
		b <= 3'b000;
	end
	else
	begin
		if (href == 1 && vs == 1)
		begin
			r <= d;
			g <= d;
			b <= d;
		end
		else
		begin
			r <= 3'b000;
			g <= 3'b000;
			b <= 3'b000;
		end
	end
end

always@(posedge flag)
begin
	if (vector_x == 799)
		vector_x <= 0;
	else
		vector_x <= vector_x + 1;
end

always@(posedge flag)
begin
	if (vector_x == 799)
		if (vector_y == 524)
			vector_y <= 0;
		else
			vector_y <= vector_y + 1;
	else
		vector_y <= vector_y;
end

always@(posedge flag)
begin
	hs <= href;
end

always@(posedge flag)
begin
	vs <= ~vsync;
end

endmodule