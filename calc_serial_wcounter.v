module calc_serial_wcounter(clk, able, reset, wcount);
input clk;
input able;
input reset;
output reg [6:0] wcount;

always@(posedge clk or negedge reset)
begin
	if (reset == 0)
		wcount <= 0;
	else
	begin
		if (able == 1)
			wcount <= wcount + 1;
		else
			wcount <= wcount;
	end
end

endmodule