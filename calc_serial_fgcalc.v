module calc_serial_fgcalc(clk, reset, fdata, gdata, fgable, fgsum);
input clk;
input reset;
input [2:0] fdata;
input [2:0] gdata;
input fgable;
output reg [13:0] fgsum;

always@(posedge clk or negedge reset)
begin
	if (reset == 0)
		fgsum <= 0;
	else
	begin
		if (fgable == 1)
			fgsum <= fgsum + fdata * gdata;
		else
			fgsum <= fgsum;
	end
end

endmodule