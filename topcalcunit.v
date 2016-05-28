module topcalcunit(startplace, startsig, work, valid, finalstart, fdata, gdata, fsum, f2sum, change, result, place);
	input startsig, work, valid, finalstart, fdata, gdata, change;
	input fsum, f2sum;
	input startplace;
	output result, place;
	
	wire startsig, work, valid, finalstart, change;
	wire [10:0] fsum;
	wire [2:0] fdata, gdata;
	wire [5:0] g2data, fgdata;
	wire [7:0] startplace, place;
	wire [10:0] gsum;
	wire [13:0] g2sum, fgsum, f2sum;
	wire [13:0] wg, wfg;
	wire [17:0] result;
	calcunit unit(
		.startplace(startplace),
		.place(place),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(fdata),
		.gdata(gdata),
		.g2data(g2data),
		.fgdata(fgdata),
		.change(change),
		.gsum(gsum),
		.g2sum(g2sum),
		.fg(fgsum)
	);
	
	multiple m1(
		.in1(fdata),
		.in2(gdata),
		.out(fgdata)
	);
	
	multiple m2(
		.in1(gdata),
		.in2(gdata),
		.out(g2data)
	);
	
	movemultiple mm1(
		.in11(gsum),
		.in3(gsum[10:8]),
		.out(wg)
	);
	
	movemultiple mm2(
		.in11(gsum),
		.in3(fsum[10:8]),
		.out(wfg)
	);
	
	movemultiple mm3(
		.in11(fsum),
		.in3(fsum[10:8]),
		.out(wf)
	);
	
	formulacalc ff(
		.wf(wf),
		.f2sum(f2sum),
		.g2sum(g2sum),
		.wg(wg),
		.wfg(wfg),
		.fg(fgsum),
		.result(result)
	);
	
endmodule
