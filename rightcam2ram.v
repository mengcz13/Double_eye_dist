/* 
---------------------------------------------------------------------------------------------
--创建日期: 2016-06-06
--目标芯片: EP2C20Q240C8
--时钟选择: sysclk接24MHz时钟, pclk为摄像头输入的像素时钟信号
--演示说明: 无法演示
--主要信号说明:
xclk: 为摄像头提供的工作时钟信号
resetc: 摄像头复位信号
data: 输出像素数据(供显示用)
wraddr: 供显示用RAM写入地址
wrclock: 供显示用RAM写入时钟
wren: 供显示用RAM写入使能
data_calc: 输出像素数据(供计算用)
wraddr_calc: 供计算用RAM写入地址
wrclock_calc: 供计算用RAM写入时钟
wren_calc: 供计算用RAM写入使能
pclk: 摄像头提供的像素时钟
vsync: 摄像头提供的场同步信号
href: 摄像头提供的行同步信号
d: 摄像头数据输入
sysclk: 系统时钟, 接24MHz
--主要进程说明: 显示进程, 将摄像头数据读入片内RAM, 供VGA显示电路读取; 数据读取进程, 将摄像头数据读入片内RAM, 供计算模块读取(与前者对应的画面位置不同)
--------------------------------------------------------------------------------------------- 
*/

module rightcam2ram(pclk, vsync, href, d, sysclk, xclk, resetc, data, wraddr, wrclock, wren, data_calc, wraddr_calc, wrclock_calc, wren_calc, test);
output wire xclk;
output wire resetc;
output reg [2:0] data;
output reg [15:0] wraddr;
output wire wrclock;
output reg wren;
output reg [2:0] data_calc;
output reg [10:0] wraddr_calc;
output wire wrclock_calc;
output reg wren_calc;
output reg [2:0] test;
input pclk;
input vsync;
input href;
input [2:0] d;
input sysclk;

reg [9:0] vector_x;
reg [8:0] vector_y;
reg [15:0] nextaddr;
reg [10:0] nextaddr_calc;
reg pixready;

reg [5:0] framenum;
reg pickframe;

assign xclk = sysclk;
assign wrclock = pclk;
assign wrclock_calc = pclk;
assign resetc = 1;

//always@(posedge pclk)
//begin
//	hpclk <= ~hpclk;
//end

always@(posedge vsync)
begin
	if (framenum == 29)
		framenum <= 0;
	else
		framenum <= framenum + 1;
end

always@(posedge pclk)
begin
	if (framenum == 29)
		pickframe <= 1;
	else
		pickframe <= 0;
end

always@(posedge pclk)
begin
	if (href == 1)
		pixready <= ~pixready;
	else
		pixready <= 0;
end

always@(posedge pclk)
begin
	if (vsync == 1)
	begin
		vector_x <= 0;
		vector_y <= 0;
	end
	else if (vsync == 0 && href == 0)
	begin
		if (vector_x == 0)
		begin
			vector_x <= 0;
			vector_y <= vector_y;
		end
		else
		begin
			vector_x <= 0;
			vector_y <= vector_y + 1;
		end
	end
	else
	begin
		if (pixready == 0)
		begin
			vector_x <= vector_x + 1;
			vector_y <= vector_y;
		end
		else
		begin
			vector_x <= vector_x;
			vector_y <= vector_y;
		end
	end
end

// Use for display buffer
always@(posedge pclk)
begin
	if (vector_x >= 270 && vector_x <= 369 && vector_y >= 190 && vector_y <= 289)
	begin
		if (pixready == 1)
		begin
			wraddr <= nextaddr;
			nextaddr <= nextaddr + 1;
//			if (vector_x >= 318 && vector_x <= 396 && vector_y >= 238 && vector_y <= 253)
//				begin
//				if (vector_x >= 319 && vector_x <= 320)
//				data <= 3'b111;
//				else
//				data <= 3'b000;
//				end
//			else
				data <= d;
//			else
//				if (d <= 3)
//					data <= 0;
//				else
//					data <= 7;
//			data <= d;
			// data <= vector_y[2:0];
			//wren <= 0;
			wren <= 1;
		end
		else
		begin
			wraddr <= wraddr;
			nextaddr <= nextaddr;
			data <= data;
			//data <= d;
			//wren <= 1;
			wren <= 0;
		end
	end
	else if (vector_y >= 290)
	begin
		wraddr <= 0;
		nextaddr <= 0;
		//data <= 3'b000;
		data <= data;
		wren <= 0;
	end
	else
	begin
		wraddr <= wraddr;
		nextaddr <= nextaddr;
		//data <= 3'b000;
		data <= data;
		wren <= 0;
	end
end

// Use for calculation buffer
always@(posedge pclk)
begin
	if (vector_x >= 318 && vector_x <= 396 && vector_y >= 238 && vector_y <= 253)
	begin
		if (pixready == 1)
		begin
			wraddr_calc <= nextaddr_calc;
			nextaddr_calc <= nextaddr_calc + 1;
//			if (vector_x >= 319 && vector_x <= 320)
//				data_calc <= 3'b111;
//			else
//				data_calc <= 3'b000;
			data_calc <= d;
//			if (d <= 3)
//				data_calc <= 0;
//			else
//				data_calc <= 7;
			//data <= data;
			// data <= vector_y[2:0];
			//wren <= 0;
			if (wraddr_calc == 14)
				test <= data_calc;
			else
				test <= test;
			wren_calc <= 1 & pickframe;
		end
		else
		begin
			wraddr_calc <= wraddr_calc;
			nextaddr_calc <= nextaddr_calc;
			data_calc <= data_calc;
			//data <= d;
			//wren <= 1;
			wren_calc <= 0;
		end
	end
	else if (vector_y >= 254)
	begin
		wraddr_calc <= 0;
		nextaddr_calc <= 0;
		//data <= 3'b000;
		data_calc <= data_calc;
		wren_calc <= 0;
	end
	else
	begin
		wraddr_calc <= wraddr_calc;
		nextaddr_calc <= nextaddr_calc;
		//data <= 3'b000;
		data_calc <= data_calc;
		wren_calc <= 0;
	end
end

endmodule