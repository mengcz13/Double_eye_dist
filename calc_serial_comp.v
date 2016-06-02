module calc_serial_comp(clk, compable, reset, rank, zssd, windowend, dist);
input clk;
input compable;
input reset;
input [5:0] rank;
input [31:0] zssd;
input windowend;
output reg [5:0] dist;

reg [5:0] current_rank;
reg [31:0] current_min_zssd;

always@(posedge clk or negedge reset)
begin
	if (reset == 0)
	begin
		current_rank <= 0;
		current_min_zssd <= 32'b11111111111111111111111111111111;
	end
	else
	begin
		if (compable == 1)
		begin
			if (zssd < current_min_zssd)
			begin
				current_rank <= rank;
				current_min_zssd <= zssd;
			end
			else
			begin
				current_rank <= current_rank;
				current_min_zssd <= current_min_zssd;
			end
		end
		else
		begin
			current_rank <= current_rank;
			current_min_zssd <= current_min_zssd;
		end
	end
end

always@(posedge clk)
begin
	if (windowend == 1)
		dist <= current_rank;
	else
		dist <= dist;
end

endmodule