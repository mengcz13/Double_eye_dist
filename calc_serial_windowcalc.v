module calc_serial_windowcalc(clk, reset, wdata, wable, wsum, w2sum);
input clk;
input reset;
input [2:0] wdata;
input wable;
output reg [10:0] wsum;
output reg [13:0] w2sum;

always@(posedge clk or negedge reset)
begin
	if (reset == 0)
		begin
			wsum <= 0;
			w2sum <= 0;
		end
	else
	begin
		if (wable == 1)
		begin
			wsum <= wsum + wdata;
			w2sum <= w2sum + wdata * wdata;
		end
		else
		begin
			wsum <= wsum;
			w2sum <= w2sum;
		end
	end
end

endmodule