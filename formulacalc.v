module formulacalc(sig, fsum, f2sum, g2sum, gsum, fg, result)
	input sig;
	input fsum, f2sum, g2sum, gsum, fg;
	
	
	wire sig;
	wire [10:0] fsum;
	wire [13:0] f2sum;
	wire [895:0] g2sum;
	wire [703:0] gsum;
	wire [895:0] fg;
	reg [] result;
	always@(posedge sig)
	begin
		
	end
endmodule