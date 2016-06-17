module topcalcunit(lstart, startplace, startsig, work, valid, finalstart, fdata, gdata, fsum, f2sum, change, result, place);
//完整的计算单元，输出窗口匹配值
//邹昊写
	input startsig, work, valid, finalstart, fdata, gdata, change;
	input fsum, f2sum;
	input startplace, lstart;
	output result, place;
	
	wire startsig, work, valid, finalstart, change, lstart;
	wire [10:0] fsum;
	wire [2:0] fdata, gdata;
	wire [5:0] g2data, fgdata;
	wire [5:0] startplace, place;
	wire [10:0] gsum;
	wire [13:0] g2sum, fgsum, f2sum;
	wire [13:0] wg, wfg, wf;
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
		.fg(fgsum),
		.lstart(lstart)
	);
	//计算fg交叉乘积
	multiple m1(
		.in1(fdata),
		.in2(gdata),
		.out(fgdata)
	);
	//计算g平方
	multiple m2(
		.in1(gdata),
		.in2(gdata),
		.out(g2data)
	);
	//计算gsum^2/size,size是窗口大小
	movemultiple mm1(
		.in11(gsum),
		.in3(gsum),
		.out(wg)
	);
	//计算gsum*fsum/size,size是窗口大小
	movemultiple mm2(
		.in11(gsum),
		.in3(fsum),
		.out(wfg)
	);
	//计算fsum^2/size,size是窗口大小
	movemultiple mm3(
		.in11(fsum),
		.in3(fsum),
		.out(wf)
	);
	//最终计算出匹配值
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
