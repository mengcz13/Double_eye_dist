module topcalc(clk, d, address_f, address_g, gdata, getfdata);
	input clk, gdata, getfdata;
	output d, address_f, address_g;
	wire clk;
	wire [10:0] address_f, address_g;
	wire [7:0] d;
	wire [5:0] fdata2;
	wire [2:0] gdata;
	wire [10:0] fsum;
	wire [13:0] f2sum;
	wire [6:0] vxf;
	wire [6:0] vxg;
	wire [3:0] vy;
	wire [15:0] cg;
	wire startsig;
	wire work;
	wire [2:0] f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16;
	wire [13:0] wf;
	wire valid;
	wire update;
	wire [17:0] bb;
	wire [17:0] ret[0:30];
	wire [7:0] place[0:30];
	calcfgs control (
		.gdata(gdata),
		.getfdata(getfdata),
		.get2f(fdata2),
		.clk(clk),
		.fsum(fsum),
		.f2sum(f2sum),
		.vector_xf(vxf),
		.vector_xg(vxg),
		.vector_y(vy),
		.change(cg),
		.startsig(startsig),
		.work(work),
		.f0(f0),.f1(f1),.f2(f2),.f3(f3),.f4(f4),.f5(f5),.f6(f6),.f7(f7),.f8(f8),.f9(f9),.f10(f10),.f11(f11),
		.f12(f12),.f13(f13),.f14(f14),.f15(f15), .valid(valid), .update(update)
	);

	coorcalc coor0(
		.x(vxf),
		.y(vy),
		.z(address_f)
	);
	
	coorcalc coor1(
		.x(vxg),
		.y(vy),
		.z(address_g)
	);
	
	multiple sd(
		.in1(getfdata),
		.in2(getfdata),
		.out(fdata2)
	);
	
	topcalcunit unit0(
		.startplace(8'b00000000),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f0),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[0]),
		.result(ret[0]),
		.place(place[0])
	);
	
	topcalcunit unit1(
		.startplace(8'b00000001),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f1),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[1]),
		.result(ret[1]),
		.place(place[1])
	);
	
	topcalcunit unit2(
		.startplace(8'b00000010),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f2),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[2]),
		.result(ret[2]),
		.place(place[2])
	);
	
	topcalcunit unit3(
		.startplace(8'b00000011),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f1),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[3]),
		.result(ret[3]),
		.place(place[3])
	);
	
	topcalcunit unit4(
		.startplace(8'b00000100),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f1),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[4]),
		.result(ret[4]),
		.place(place[4])
	);
	
	topcalcunit unit5(
		.startplace(8'b00000101),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f1),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[5]),
		.result(ret[5]),
		.place(place[5])
	);
	
	topcalcunit unit6(
		.startplace(8'b00000110),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f1),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[6]),
		.result(ret[6]),
		.place(place[6])
	);
	
	topcalcunit unit7(
		.startplace(8'b00000111),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f7),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[7]),
		.result(ret[7]),
		.place(place[7])
	);
	
	topcalcunit unit8(
		.startplace(8'b00001000),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f8),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[8]),
		.result(ret[8]),
		.place(place[8])
	);
	
	topcalcunit unit9(
		.startplace(8'b00001001),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f9),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[9]),
		.result(ret[9]),
		.place(place[9])
	);
	topcalcunit unit10(
		.startplace(8'b00001010),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f10),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[10]),
		.result(ret[10]),
		.place(place[10])
	);
	topcalcunit unit11(
		.startplace(8'b00001011),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f11),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[11]),
		.result(ret[11]),
		.place(place[11])
	);
	topcalcunit unit12(
		.startplace(8'b00001100),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f12),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[12]),
		.result(ret[12]),
		.place(place[12])
	);
	topcalcunit unit13(
		.startplace(8'b00001101),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f13),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[13]),
		.result(ret[13]),
		.place(place[13])
	);
	topcalcunit unit14(
		.startplace(8'b00001110),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f14),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[14]),
		.result(ret[14])
	);
	topcalcunit unit15(
		.startplace(8'b00001111),
		.startsig(startsig),
		.work(work),
		.valid(valid),
		.finalstart(finalstart),
		.fdata(f15),
		.gdata(gdata),
		.fsum(fsum),
		.f2sum(f2sum),
		.change(cg[15]),
		.result(ret[15]),
		.place(place[15])
	);
	
	compare c0(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[0]),
		.in2(ret[1]),
		.inp1(place[0]),
		.inp2(place[1]),
		.out(ret[16]),
		.outp(place[16])
	);
	
	compare c1(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[2]),
		.in2(ret[3]),
		.inp1(place[2]),
		.inp2(place[3]),
		.out(ret[17]),
		.outp(place[17])
	);
	
	compare c2(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[4]),
		.in2(ret[5]),
		.inp1(place[4]),
		.inp2(place[5]),
		.out(ret[18]),
		.outp(place[18])
	);
	
	compare c3(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[6]),
		.in2(ret[7]),
		.inp1(place[6]),
		.inp2(place[7]),
		.out(ret[19]),
		.outp(place[19])
	);
	
	compare c4(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[8]),
		.in2(ret[9]),
		.inp1(place[8]),
		.inp2(place[9]),
		.out(ret[20]),
		.outp(place[20])
	);
	
	compare c5(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[10]),
		.in2(ret[11]),
		.inp1(place[10]),
		.inp2(place[11]),
		.out(ret[21]),
		.outp(place[21])
	);
	
	compare c6(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[12]),
		.in2(ret[13]),
		.inp1(place[12]),
		.inp2(place[13]),
		.out(ret[22]),
		.outp(place[22])
	);
	
	compare c7(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[14]),
		.in2(ret[15]),
		.inp1(place[14]),
		.inp2(place[15]),
		.out(ret[23]),
		.outp(place[23])
	);
	
	compare c8(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[16]),
		.in2(ret[17]),
		.inp1(place[16]),
		.inp2(place[17]),
		.out(ret[24]),
		.outp(place[24])
	);
	
	compare c9(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[18]),
		.in2(ret[19]),
		.inp1(place[18]),
		.inp2(place[19]),
		.out(ret[25]),
		.outp(place[25])
	);
	
	compare c10(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[20]),
		.in2(ret[21]),
		.inp1(place[20]),
		.inp2(place[21]),
		.out(ret[26]),
		.outp(place[26])
	);
	
	compare c11(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[22]),
		.in2(ret[23]),
		.inp1(place[22]),
		.inp2(place[23]),
		.out(ret[27]),
		.outp(place[27])
	);
	
	compare c12(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[24]),
		.in2(ret[25]),
		.inp1(place[24]),
		.inp2(place[25]),
		.out(ret[28]),
		.outp(place[28])
	);
	
	compare c13(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[26]),
		.in2(ret[27]),
		.inp1(place[26]),
		.inp2(place[27]),
		.out(ret[29]),
		.outp(place[29])
	);
	
	compare c14(
		.startsig(startsig),
		.finalstart(finalstart),
		.in1(ret[28]),
		.in2(ret[29]),
		.inp1(place[28]),
		.inp2(place[29]),
		.out(ret[30]),
		.outp(place[30])
	);
	
	finalgive kkk(
		.startsig(startsig),
		.update(update),
		.in(in),
		.inp(inp),
		.out(bb),
		.outp(d)
	);
endmodule