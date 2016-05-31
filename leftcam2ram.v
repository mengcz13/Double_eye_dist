module leftcam2ram(pclk, vsync, href, d, sysclk, xclk, resetc, data, wraddr, wrclock, wren, data_calc, wraddr_calc, wrclock_calc, wren_calc, test);
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

assign xclk = sysclk;
assign wrclock = pclk;
assign wrclock_calc = pclk;
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
			if (vector_x >= 318 && vector_x <= 396 && vector_y >= 238 && vector_y <= 253)
				begin
				if (vector_x >= 328 && vector_x <= 329)
				data <= 3'b111;
				else
				data <= 3'b000;
				end
			else
				data <= d;
			//data <= data;
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
			if (vector_x >= 328 && vector_x <= 329)
				data_calc <= 3'b111;
			else
				data_calc <= 3'b000;
			//data_calc <= d;
			//data <= data;
			// data <= vector_y[2:0];
			//wren <= 0;
			if (wraddr_calc == 14)
				test <= data_calc;
			else
				test <= test;
			wren_calc <= 1;
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