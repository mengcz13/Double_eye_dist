module testmodule(zero, clk, getfdata, vector_x, vector_y)
	input clk, getfdata;
	output zero, vector_x, vector_y;
	
	wire clk;
	reg [2:0] zero;
	reg [6:0] vector_x;
	reg [6:0] vector_y;
	wire [2:0] getfdata;
	always@(posedge clk)
	begin
		vector_x <= 0;
		vector_y <= 0;
		zero <= getfdata;
	end
endmodule
