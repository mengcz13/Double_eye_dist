module topcalc(data_in, clk, d, vxf, vxg, vy, gdata, getfdata);
	input clk;
	output d;
	wire clk;
	wire [7:0] d;
	wire [5:0] f2;
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
	wire [55:0] g2sum0, g2sum1, g2sum2, g2sum3, g2sum4, g2sum5, g2sum6, g2sum7, g2sum8, g2sum9, g2sum10, g2sum11, g2sum12, g2sum13, g2sum14, g2sum15;
	wire [43:0] gsum0, gsum1, gsum2, gsum3, gsum4, gsum5, gsum6, gsum7, gsum8, gsum9, gsum10, gsum11, gsum12, gsum13, gsum14, gsum15;
	wire [55:0] fg0, fg1, fg2, fg3, fg4, fg5, fg6, fg7, fg8, fg9, fg10, fg11, fg12, fg13, fg14, fg15;
	wire [55:0] wg0, wg1, wg2, wg3, wg4, wg5, wg6, wg7, wg8, wg9, wg10, wg11, wg12, wg13, wg14, wg15;
	wire [55:0] wfg0, wfg1, wfg2, wfg3, wfg4, wfg5, wfg6, wfg7, wfg8, wfg9, wfg10, wfg11, wfg12, wfg13, wfg14, wfg15;
	wire [1151:0] result;
	wire [17:0] out0,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15;
	wire [17:0] out16,out17,out18,out19,out20,out21,out22,out23,out24,out25,out26,out27,out28,out29,out30,out31;
	wire [17:0] out32,out33,out34,out35,out36,out37,out38,out39,out40,out41,out42,out43,out44,out45,out46,out47;
	wire [17:0] out48,out49,out50,out51,out52,out53,out54,out55,out56,out57,out58,out59,out60,out61,out62;
	wire [7:0] outp0,outp1,outp2,outp3,outp4,outp5,outp6,outp7,outp8,outp9,outp10,outp11,outp12,outp13,outp14,outp15;
	wire [7:0] outp16,outp17,outp18,outp19,outp20,outp21,outp22,outp23,outp24,outp25,outp26,outp27,outp28,outp29,outp30,outp31;
	wire [7:0] outp32,outp33,outp34,outp35,outp36,outp37,outp38,outp39,outp40,outp41,outp42,outp43,outp44,outp45,outp46,outp47;
	wire [7:0] outp48,outp49,outp50,outp51,outp52,outp53,outp54,outp55,outp56,outp57,outp58,outp59,outp60,outp61,outp62;
	calcfgs control {
		.gdata(gdata),
		.getfdata(getfdata),
		.get2f(f2);
		.clk(clk),
		.fsum(fsum),
		.f2sum(f2sum),
		.vector_xf(vxf),
		.vector_xg(vxg),
		.vector_y(vy),
		.change(cg),
		.startsig(startsig),
		.work(work),
		.f0(f0),.f1(f1),.f2(f2),.f3(f3),.f4(f4),.f5(f5),.f6(f6),.f7(f7),.f8(f8),.f9(f9),.f10(f10),.f11(f11),.f12(f12),
		.f12(f12),.f13(f13),.f14(f14),.f15(f15), .valid(valid)
	};
	
	multiple f2 {
		.in1(getfdata),
		.in2(getfdata),
		.out(f2)
	};
	
	movemultiple lyx {
		.in11(fsum),
		.in3(fsum[10:8]),
		.out(wf)
	};

	calcunit calc0{
		.startsig(startsig),
		.work(work),
		.fdata(f0),
		.gdata(gdata),
		.change(cg[0]),
		.g2sum(g2sum0),
		.gsum(gsum0),
		.fg(fg0)
	};
	calcunit calc1{
		.startsig(startsig),
		.work(work),
		.fdata(f1),
		.gdata(gdata),
		.change(cg[1]),
		.g2sum(g2sum1),
		.gsum(gsum1),
		.fg(fg1)
	};
	calcunit calc2{
		.startsig(startsig),
		.work(work),
		.fdata(f2),
		.gdata(gdata),
		.change(cg[2]),
		.g2sum(g2sum2),
		.gsum(gsum2),
		.fg(fg2)
	};
	calcunit calc3{
		.startsig(startsig),
		.work(work),
		.fdata(f3),
		.gdata(gdata),
		.change(cg[3]),
		.g2sum(g2sum3),
		.gsum(gsum3),
		.fg(fg3)
	};
	calcunit calc4{
		.startsig(startsig),
		.work(work),
		.fdata(f4),
		.gdata(gdata),
		.change(cg[4]),
		.g2sum(g2sum4),
		.gsum(gsum4),
		.fg(fg4)
	};
	calcunit calc5{
		.startsig(startsig),
		.work(work),
		.fdata(f5),
		.gdata(gdata),
		.change(cg[5]),
		.g2sum(g2sum5),
		.gsum(gsum5),
		.fg(fg5)
	};
	calcunit calc6{
		.startsig(startsig),
		.work(work),
		.fdata(f6),
		.gdata(gdata),
		.change(cg[6]),
		.g2sum(g2sum6),
		.gsum(gsum6),
		.fg(fg6)
	};
	calcunit calc7{
		.startsig(startsig),
		.work(work),
		.fdata(f7),
		.gdata(gdata),
		.change(cg[7]),
		.g2sum(g2sum7),
		.gsum(gsum7),
		.fg(fg7)
	};
	calcunit calc8{
		.startsig(startsig),
		.work(work),
		.fdata(f8),
		.gdata(gdata),
		.change(cg[8]),
		.g2sum(g2sum8),
		.gsum(gsum8),
		.fg(fg8)
	};
	calcunit calc9{
		.startsig(startsig),
		.work(work),
		.fdata(f9),
		.gdata(gdata),
		.change(cg[9]),
		.g2sum(g2sum9),
		.gsum(gsum9),
		.fg(fg9)
	};
	calcunit calc10{
		.startsig(startsig),
		.work(work),
		.fdata(f10),
		.gdata(gdata),
		.change(cg[10]),
		.g2sum(g2sum10),
		.gsum(gsum10),
		.fg(fg10)
	};
	calcunit calc11{
		.startsig(startsig),
		.work(work),
		.fdata(f11),
		.gdata(gdata),
		.change(cg[11]),
		.g2sum(g2sum11),
		.gsum(gsum11),
		.fg(fg11)
	};
	calcunit calc12{
		.startsig(startsig),
		.work(work),
		.fdata(f12),
		.gdata(gdata),
		.change(cg[12]),
		.g2sum(g2sum12),
		.gsum(gsum12),
		.fg(fg12)
	};
	calcunit calc13{
		.startsig(startsig),
		.work(work),
		.fdata(f13),
		.gdata(gdata),
		.change(cg[13]),
		.g2sum(g2sum13),
		.gsum(gsum13),
		.fg(fg13)
	};
	calcunit calc14{
		.startsig(startsig),
		.work(work),
		.fdata(f14),
		.gdata(gdata),
		.change(cg[14]),
		.g2sum(g2sum14),
		.gsum(gsum14),
		.fg(fg14)
	};
	calcunit calc15{
		.startsig(startsig),
		.work(work),
		.fdata(f15),
		.gdata(gdata),
		.change(cg[15]),
		.g2sum(g2sum15),
		.gsum(gsum15),
		.fg(fg15)
	};
	topmultiple zh{
		.fsum(fsum), .gsum0(gsum0), .gsum1(gsum1), .gsum2(gsum2), .gsum3(gsum3), .gsum4(gsum4)
		, .gsum5(gsum5), .gsum6(gsum6), .gsum7(gsum7)
		, .gsum8(gsum8), .gsum9(gsum9), .gsum10(gsum10), .gsum11(gsum11)
		, .gsum12(gsum12), .gsum13(gsum13), .gsum14(gsum14), .gsum15(gsum15)
		, .wg0(wg0), .wg1(wg1), .wg2(wg2), .wg3(wg3), .wg4(wg4), .wg5(wg5), .wg6(wg6), .wg7(wg7)
		, .wg8(wg8), .wg9(wg9), .wg10(wg10), .wg11(wg11), .wg12(wg12), .wg13(wg13), .wg14(wg14), .wg15(wg15)
		, .wfg0(wfg0), .wfg1(wfg1), .wfg2(wfg2), .wfg3(wfg3), .wfg4(wfg4), .wfg5(wfg5), .wfg6(wfg6), .wfg7(wfg7)
		, .wfg8(wfg8), .wfg9(wfg9), .wfg10(wfg10), .wfg11(wfg11), .wfg12(wfg12), .wfg13(wfg13), .wfg14(wfg14), .wfg15(wfg15)
	};
	formulacalc yxx {
		.sig(valid), .wf(wf), .f2sum(f2sum), 
		.g2sum0(g2sum0), .wg0(wg0), .wfg0(wfg0), .fg0(fg0),
		.g2sum1(g2sum1), .wg1(wg1), .wfg1(wfg1), .fg1(fg1),
		.g2sum2(g2sum2), .wg2(wg2), .wfg2(wfg2), .fg2(fg2),
		.g2sum3(g2sum3), .wg3(wg3), .wfg3(wfg3), .fg3(fg3),
		.g2sum4(g2sum4), .wg4(wg4), .wfg4(wfg4), .fg4(fg4),
		.g2sum5(g2sum5), .wg5(wg5), .wfg5(wfg5), .fg5(fg5),
		.g2sum6(g2sum6), .wg6(wg6), .wfg6(wfg6), .fg6(fg6),
		.g2sum7(g2sum7), .wg7(wg7), .wfg7(wfg7), .fg7(fg7),
		.g2sum8(g2sum8), .wg8(wg8), .wfg8(wfg8), .fg8(fg8),
		.g2sum9(g2sum9), .wg9(wg9), .wfg9(wfg9), .fg9(fg9),
		.g2sum10(g2sum10), .wg10(wg10), .wfg10(wfg10), .fg10(fg10),
		.g2sum11(g2sum11), .wg11(wg11), .wfg11(wfg11), .fg11(fg11),
		.g2sum12(g2sum12), .wg12(wg12), .wfg12(wfg12), .fg12(fg12),
		.g2sum13(g2sum13), .wg13(wg13), .wfg13(wfg13), .fg13(fg13),
		.g2sum14(g2sum14), .wg14(wg14), .wfg14(wfg14), .fg14(fg14),
		.g2sum15(g2sum15), .wg15(wg15), .wfg15(wfg15), .fg15(fg15),
		.result(result)
	};
	compare c0{
		.in1(result[17:0]),
		.in2(result[35:18]),
		.inp1(8'b00000000),
		.inp2(8'b00000001),
		.out(out0),
		.outp(outp0),
	};
	compare c1{
		.in1(result[53:36]),
		.in2(result[71:54]),
		.inp1(8'b00000010),
		.inp2(8'b00000011),
		.out(out1),
		.outp(outp1),
	};
	compare c2{
		.in1(result[89:72]),
		.in2(result[107:90]),
		.inp1(8'b00000100),
		.inp2(8'b00000101),
		.out(out2),
		.outp(outp2),
	};
	compare c3{
		.in1(result[125:108]),
		.in2(result[143:126]),
		.inp1(8'b00000110),
		.inp2(8'b00000111),
		.out(out3),
		.outp(outp3),
	};
	compare c4{
		.in1(result[161:144]),
		.in2(result[179:162]),
		.inp1(8'b00001000),
		.inp2(8'b00001001),
		.out(out4),
		.outp(outp4),
	};
	compare c5{
		.in1(result[197:180]),
		.in2(result[215:198]),
		.inp1(8'b00001010),
		.inp2(8'b00001011),
		.out(out5),
		.outp(outp5),
	};
	compare c6{
		.in1(result[233:216]),
		.in2(result[251:234]),
		.inp1(8'b00001100),
		.inp2(8'b00001101),
		.out(out6),
		.outp(outp6),
	};
	compare c7{
		.in1(result[269:252]),
		.in2(result[287:270]),
		.inp1(8'b00001110),
		.inp2(8'b00001111),
		.out(out7),
		.outp(outp7),
	};
	compare c8{
		.in1(result[305:288]),
		.in2(result[323:306]),
		.inp1(8'b00010000),
		.inp2(8'b00010001),
		.out(out8),
		.outp(outp8),
	};
	compare c9{
		.in1(result[341:324]),
		.in2(result[359:342]),
		.inp1(8'b00010010),
		.inp2(8'b00010011),
		.out(out9),
		.outp(outp9),
	};
	compare c10{
		.in1(result[377:360]),
		.in2(result[395:378]),
		.inp1(8'b00010100),
		.inp2(8'b00010101),
		.out(out10),
		.outp(outp10),
	};
	compare c11{
		.in1(result[413:396]),
		.in2(result[431:414]),
		.inp1(8'b00010110),
		.inp2(8'b00010111),
		.out(out11),
		.outp(outp11),
	};
	compare c12{
		.in1(result[449:432]),
		.in2(result[467:450]),
		.inp1(8'b00011000),
		.inp2(8'b00011001),
		.out(out12),
		.outp(outp12),
	};
	compare c13{
		.in1(result[485:468]),
		.in2(result[503:486]),
		.inp1(8'b00011010),
		.inp2(8'b00011011),
		.out(out13),
		.outp(outp13),
	};
	compare c14{
		.in1(result[521:504]),
		.in2(result[539:522]),
		.inp1(8'b00011100),
		.inp2(8'b00011101),
		.out(out14),
		.outp(outp14),
	};
	compare c15{
		.in1(result[557:540]),
		.in2(result[575:558]),
		.inp1(8'b00011110),
		.inp2(8'b00011111),
		.out(out15),
		.outp(outp15),
	};
	compare c16{
		.in1(result[593:576]),
		.in2(result[611:594]),
		.inp1(8'b00100000),
		.inp2(8'b00100001),
		.out(out16),
		.outp(outp16),
	};
	compare c17{
		.in1(result[629:612]),
		.in2(result[647:630]),
		.inp1(8'b00100010),
		.inp2(8'b00100011),
		.out(out17),
		.outp(outp17),
	};
	compare c18{
		.in1(result[665:648]),
		.in2(result[683:666]),
		.inp1(8'b00100100),
		.inp2(8'b00100101),
		.out(out18),
		.outp(outp18),
	};
	compare c19{
		.in1(result[701:684]),
		.in2(result[719:702]),
		.inp1(8'b00100110),
		.inp2(8'b00100111),
		.out(out19),
		.outp(outp19),
	};
	compare c20{
		.in1(result[737:720]),
		.in2(result[755:738]),
		.inp1(8'b00101000),
		.inp2(8'b00101001),
		.out(out20),
		.outp(outp20),
	};
	compare c21{
		.in1(result[773:756]),
		.in2(result[791:774]),
		.inp1(8'b00101010),
		.inp2(8'b00101011),
		.out(out21),
		.outp(outp21),
	};
	compare c22{
		.in1(result[809:792]),
		.in2(result[827:810]),
		.inp1(8'b00101100),
		.inp2(8'b00101101),
		.out(out22),
		.outp(outp22),
	};
	compare c23{
		.in1(result[845:828]),
		.in2(result[863:846]),
		.inp1(8'b00101110),
		.inp2(8'b00101111),
		.out(out23),
		.outp(outp23),
	};
	compare c24{
		.in1(result[881:864]),
		.in2(result[899:882]),
		.inp1(8'b00110000),
		.inp2(8'b00110001),
		.out(out24),
		.outp(outp24),
	};
	compare c25{
		.in1(result[917:900]),
		.in2(result[935:918]),
		.inp1(8'b00110010),
		.inp2(8'b00110011),
		.out(out25),
		.outp(outp25),
	};
	compare c26{
		.in1(result[953:936]),
		.in2(result[971:954]),
		.inp1(8'b00110100),
		.inp2(8'b00110101),
		.out(out26),
		.outp(outp26),
	};
	compare c27{
		.in1(result[989:972]),
		.in2(result[1007:990]),
		.inp1(8'b00110110),
		.inp2(8'b00110111),
		.out(out27),
		.outp(outp27),
	};
	compare c28{
		.in1(result[1025:1008]),
		.in2(result[1043:1026]),
		.inp1(8'b00111000),
		.inp2(8'b00111001),
		.out(out28),
		.outp(outp28),
	};
	compare c29{
		.in1(result[1061:1044]),
		.in2(result[1079:1062]),
		.inp1(8'b00111010),
		.inp2(8'b00111011),
		.out(out29),
		.outp(outp29),
	};
	compare c30{
		.in1(result[1097:1080]),
		.in2(result[1115:1098]),
		.inp1(8'b00111100),
		.inp2(8'b00111101),
		.out(out30),
		.outp(outp30),
	};
	compare c31{
		.in1(result[1133:1116]),
		.in2(result[1151:1134]),
		.inp1(8'b00111110),
		.inp2(8'b00111111),
		.out(out31),
		.outp(outp31),
	};
	compare c32{
		.in1(out0),
		.in2(out1),
		.inp1(outp0),
		.inp2(outp1),
		.out(out32),
		.outp(outp32),
	};
	compare c33{
		.in1(out2),
		.in2(out3),
		.inp1(outp2),
		.inp2(outp3),
		.out(out33),
		.outp(outp33),
	};
	compare c34{
		.in1(out4),
		.in2(out5),
		.inp1(outp4),
		.inp2(outp5),
		.out(out34),
		.outp(outp34),
	};
	compare c35{
		.in1(out6),
		.in2(out7),
		.inp1(outp6),
		.inp2(outp7),
		.out(out35),
		.outp(outp35),
	};
	compare c36{
		.in1(out8),
		.in2(out9),
		.inp1(outp8),
		.inp2(outp9),
		.out(out36),
		.outp(outp36),
	};
	compare c37{
		.in1(out10),
		.in2(out11),
		.inp1(outp10),
		.inp2(outp11),
		.out(out37),
		.outp(outp37),
	};
	compare c38{
		.in1(out12),
		.in2(out13),
		.inp1(outp12),
		.inp2(outp13),
		.out(out38),
		.outp(outp38),
	};
	compare c39{
		.in1(out14),
		.in2(out15),
		.inp1(outp14),
		.inp2(outp15),
		.out(out39),
		.outp(outp39),
	};
	compare c40{
		.in1(out16),
		.in2(out17),
		.inp1(outp16),
		.inp2(outp17),
		.out(out40),
		.outp(outp40),
	};
	compare c41{
		.in1(out18),
		.in2(out19),
		.inp1(outp18),
		.inp2(outp19),
		.out(out41),
		.outp(outp41),
	};
	compare c42{
		.in1(out20),
		.in2(out21),
		.inp1(outp20),
		.inp2(outp21),
		.out(out42),
		.outp(outp42),
	};
	compare c43{
		.in1(out22),
		.in2(out23),
		.inp1(outp22),
		.inp2(outp23),
		.out(out43),
		.outp(outp43),
	};
	compare c44{
		.in1(out24),
		.in2(out25),
		.inp1(outp24),
		.inp2(outp25),
		.out(out44),
		.outp(outp44),
	};
	compare c45{
		.in1(out26),
		.in2(out27),
		.inp1(outp26),
		.inp2(outp27),
		.out(out45),
		.outp(outp45),
	};
	compare c46{
		.in1(out28),
		.in2(out29),
		.inp1(outp28),
		.inp2(outp29),
		.out(out46),
		.outp(outp46),
	};
	compare c47{
		.in1(out30),
		.in2(out31),
		.inp1(outp30),
		.inp2(outp31),
		.out(out47),
		.outp(outp47),
	};
	compare c48{
		.in1(out32),
		.in2(out33),
		.inp1(outp32),
		.inp2(outp33),
		.out(out48),
		.outp(outp48),
	};
	compare c49{
		.in1(out34),
		.in2(out35),
		.inp1(outp34),
		.inp2(outp35),
		.out(out49),
		.outp(outp49),
	};
	compare c50{
		.in1(out36),
		.in2(out37),
		.inp1(outp36),
		.inp2(outp37),
		.out(out50),
		.outp(outp50),
	};
	compare c51{
		.in1(out38),
		.in2(out39),
		.inp1(outp38),
		.inp2(outp39),
		.out(out51),
		.outp(outp51),
	};
	compare c52{
		.in1(out40),
		.in2(out41),
		.inp1(outp40),
		.inp2(outp41),
		.out(out52),
		.outp(outp52),
	};
	compare c53{
		.in1(out42),
		.in2(out43),
		.inp1(outp42),
		.inp2(outp43),
		.out(out53),
		.outp(outp53),
	};
	compare c54{
		.in1(out44),
		.in2(out45),
		.inp1(outp44),
		.inp2(outp45),
		.out(out54),
		.outp(outp54),
	};
	compare c55{
		.in1(out46),
		.in2(out47),
		.inp1(outp46),
		.inp2(outp47),
		.out(out55),
		.outp(outp55),
	};
	compare c56{
		.in1(out48),
		.in2(out49),
		.inp1(outp48),
		.inp2(outp49),
		.out(out56),
		.outp(outp56),
	};
	compare c57{
		.in1(out50),
		.in2(out51),
		.inp1(outp50),
		.inp2(outp51),
		.out(out57),
		.outp(outp57),
	};
	compare c58{
		.in1(out52),
		.in2(out53),
		.inp1(outp52),
		.inp2(outp53),
		.out(out58),
		.outp(outp58),
	};
	compare c59{
		.in1(out54),
		.in2(out55),
		.inp1(outp54),
		.inp2(outp55),
		.out(out59),
		.outp(outp59),
	};
	compare c60{
		.in1(out56),
		.in2(out57),
		.inp1(outp56),
		.inp2(outp57),
		.out(out60),
		.outp(outp60),
	};
	compare c61{
		.in1(out58),
		.in2(out59),
		.inp1(outp58),
		.inp2(outp59),
		.out(out61),
		.outp(outp61),
	};
	compare c62{
		.in1(out60),
		.in2(out61),
		.inp1(outp60),
		.inp2(outp61),
		.out(out62),
		.outp(d),
	};
endmodule
