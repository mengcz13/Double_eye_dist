module formulacalc(wf, f2sum, g2sum, wg, wfg, fg, result);
	input wf, f2sum, g2sum, wg, wfg, fg;
	output result;
	wire [13:0] wf;
	wire [13:0] f2sum;
	
	wire[13:0] g2sum;
	wire[13:0] wg;
	wire[13:0] wfg;
	wire[13:0] fg;
	
	reg [18:0] result; //18bit per block
	always@(wf or f2sum or g2sum or wg or wfg or fg)
	begin;
		result <= {4'b0000, f2sum} + {4'b0000, g2sum} + {3'b000, wfg, 1'b0} - {4'b0000, wf} - {4'b0000, wg} - {3'b000, fg, 1'b0};
	end
endmodule
