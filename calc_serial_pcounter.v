module calc_serial_pcounter(clk, able, reset, pcount);
input clk;
input able;
input reset;
output reg [8:0] pcount;

always@(posedge clk or negedge reset)
begin
	if (reset == 0)
		pcount <= 0;
	else
	begin
		if (able == 1)
			pcount <= pcount + 1;
		else
			pcount <= pcount;
	end
end

endmodule