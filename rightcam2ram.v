module rightcam2ram(pclk, vsync, href, d, sysclk, xclk, resetc, data, wraddr, wrclock, wren, test);
output wire xclk;
output wire resetc;
output reg [2:0] data;
output reg [15:0] wraddr;
output wire wrclock;
output reg wren;
output reg [2:0] test;
input pclk;
input vsync;
input href;
input [2:0] d;
input sysclk;

reg [9:0] vector_x;
reg [8:0] vector_y;
reg [15:0] nextaddr;
reg pixready;

assign xclk = sysclk;
assign wrclock = pclk;
assign resetc = 1;

//always@(posedge pclk)
//begin
//	hpclk <= ~hpclk;
//end

always@(posedge pclk)
begin
	if (href == 1)
		pixready <= ~pixready;
	else
		pixready = 0;
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

always@(posedge pclk)
begin
	if (vector_x >= 320 && vector_x <= 519 && vector_y >= 240 && vector_y <= 439)
	begin
		if (pixready == 1)
		begin
			wraddr <= nextaddr;
			nextaddr <= nextaddr + 1;
			data <= d;
			//data <= data;
			// data <= vector_y[2:0];
			wren <= 0;
		end
		else
		begin
			wraddr <= wraddr;
			nextaddr <= nextaddr;
			data <= data;
			//data <= d;
			wren <= 1;
			// wren <= 0;
		end
	end
	else if (vector_y >= 440)
	begin
		wraddr <= 0;
		nextaddr <= 0;
		data <= 3'b000;
		wren <= 0;
	end
	else
	begin
		wraddr <= wraddr;
		nextaddr <= nextaddr;
		data <= 3'b000;
		wren <= 0;
	end
	test <= d;
end

endmodule