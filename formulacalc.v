module formulacalc(sig, fsum, f2sum, g2sum0, gsum0, fg0,
						g2sum1, gsum1, fg1,
						g2sum2, gsum2, fg2,
						g2sum3, gsum3, fg3, result);
	input sig;
	input fsum, f2sum, g2sum, gsum, fg;
	input g2sum1, gsum1, fg1;
	input g2sum2, gsum2, fg2;
	input g2sum3, gsum3, fg3;
	
	wire sig;
	wire [10:0] fsum;
	wire [13:0] f2sum;
	
	wire [223:0] g2sum0;
	wire [175:0] gsum0;
	wire [223:0] fg0;
	wire [223:0] g2sum1;
	wire [175:0] gsum1;
	wire [223:0] fg1;
	wire [223:0] g2sum2;
	wire [175:0] gsum2;
	wire [223:0] fg2;
	wire [223:0] g2sum3;
	wire [175:0] gsum3;
	wire [223:0] fg3;
	
	reg [1151:0] result; //18bit per block
	always@(posedge sig)
	begin
		
	end
endmodule