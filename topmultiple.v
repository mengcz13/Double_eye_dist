module topmultiple(fsum, gsum0, gsum1, gsum2, gsum3, gsum4, gsum5, gsum6, gsum7, 
						gsum8, gsum9, gsum10, gsum11, gsum12, gsum13, gsum14, gsum15,
						wg0, wg1, wg2, wg3, wg4, wg5, wg6, wg7, wg8, wg9, wg10, wg11,
						wg12, wg13, wg14, wg15, wfg0, wfg1, wfg2, wfg3, wfg4, wfg5
						,wfg6, wfg7, wfg8, wfg9, wfg10, wfg11, wfg12, wfg13, wfg14, wfg15);
	input fsum, gsum0, gsum1, gsum2, gsum3, gsum4, gsum5, gsum6, gsum7, gsum8, gsum9, gsum10, gsum11, gsum12, gsum13, gsum14, gsum15;
	output wg0, wg1, wg2, wg3, wg4, wg5, wg6, wg7, wg8, wg9, wg10, wg11,
			wg12, wg13, wg14, wg15, wfg0, wfg1, wfg2, wfg3, wfg4, wfg5
			,wfg6, wfg7, wfg8, wfg9, wfg10, wfg11, wfg12, wfg13, wfg14, wfg15;
	
	wire [10:0] fsum;
	wire [43:0] gsum0, gsum1, gsum2, gsum3, gsum4, gsum5, gsum6, gsum7, gsum8, gsum9, gsum10, gsum11, gsum12, gsum13, gsum14, gsum15;
	wire [55:0] wg0, wg1, wg2, wg3, wg4, wg5, wg6, wg7, wg8, wg9, wg10, wg11,
			wg12, wg13, wg14, wg15, wfg0, wfg1, wfg2, wfg3, wfg4, wfg5
			,wfg6, wfg7, wfg8, wfg9, wfg10, wfg11, wfg12, wfg13, wfg14, wfg15;
	
	movemultiple tg0(
	.in11(gsum0[10:0]),
	.in3(gsum0[10:8]),
	.out(wg0[13:0])
	);
	movemultiple tg1(
	.in11(gsum1[10:0]),
	.in3(gsum1[10:8]),
	.out(wg1[13:0])
	);
	movemultiple tg2(
	.in11(gsum2[10:0]),
	.in3(gsum2[10:8]),
	.out(wg2[13:0])
	);
	movemultiple tg3(
	.in11(gsum3[10:0]),
	.in3(gsum3[10:8]),
	.out(wg3[13:0])
	);
	movemultiple tg4(
	.in11(gsum4[10:0]),
	.in3(gsum4[10:8]),
	.out(wg4[13:0])
	);
	movemultiple tg5(
	.in11(gsum5[10:0]),
	.in3(gsum5[10:8]),
	.out(wg5[13:0])
	);
	movemultiple tg6(
	.in11(gsum6[10:0]),
	.in3(gsum6[10:8]),
	.out(wg6[13:0])
	);
	movemultiple tg7(
	.in11(gsum7[10:0]),
	.in3(gsum7[10:8]),
	.out(wg7[13:0])
	);
	movemultiple tg8(
	.in11(gsum8[10:0]),
	.in3(gsum8[10:8]),
	.out(wg8[13:0])
	);
	movemultiple tg9(
	.in11(gsum9[10:0]),
	.in3(gsum9[10:8]),
	.out(wg9[13:0])
	);
	movemultiple tg10(
	.in11(gsum10[10:0]),
	.in3(gsum10[10:8]),
	.out(wg10[13:0])
	);
	movemultiple tg11(
	.in11(gsum11[10:0]),
	.in3(gsum11[10:8]),
	.out(wg11[13:0])
	);
	movemultiple tg12(
	.in11(gsum12[10:0]),
	.in3(gsum12[10:8]),
	.out(wg12[13:0])
	);
	movemultiple tg13(
	.in11(gsum13[10:0]),
	.in3(gsum13[10:8]),
	.out(wg13[13:0])
	);
	movemultiple tg14(
	.in11(gsum14[10:0]),
	.in3(gsum14[10:8]),
	.out(wg14[13:0])
	);
	movemultiple tg15(
	.in11(gsum15[10:0]),
	.in3(gsum15[10:8]),
	.out(wg15[13:0])
	);
	movemultiple tg16(
	.in11(gsum0[21:11]),
	.in3(gsum0[21:19]),
	.out(wg0[27:14])
	);
	movemultiple tg17(
	.in11(gsum1[21:11]),
	.in3(gsum1[21:19]),
	.out(wg1[27:14]) 
	);
	movemultiple tg18(
	.in11(gsum2[21:11]),
	.in3(gsum2[21:19]),
	.out(wg2[27:14])
	);
	movemultiple tg19(
	.in11(gsum3[21:11]),
	.in3(gsum3[21:19]),
	.out(wg3[27:14])
	);
	movemultiple tg20(
	.in11(gsum4[21:11]),
	.in3(gsum4[21:19]),
	.out(wg4[27:14])
	);
	movemultiple tg21(
	.in11(gsum5[21:11]),
	.in3(gsum5[21:19]),
	.out(wg5[27:14])
	);
	movemultiple tg22(
	.in11(gsum6[21:11]),
	.in3(gsum6[21:19]),
	.out(wg6[27:14])
	);
	movemultiple tg23(
	.in11(gsum7[21:11]),
	.in3(gsum7[21:19]),
	.out(wg7[27:14])
	);
	movemultiple tg24(
	.in11(gsum8[21:11]),
	.in3(gsum8[21:19]),
	.out(wg8[27:14])
	);
	movemultiple tg25(
	.in11(gsum9[21:11]),
	.in3(gsum9[21:19]),
	.out(wg9[27:14])
	);
	movemultiple tg26(
	.in11(gsum10[21:11]),
	.in3(gsum10[21:19]),
	.out(wg10[27:14])
	);
	movemultiple tg27(
	.in11(gsum11[21:11]),
	.in3(gsum11[21:19]),
	.out(wg11[27:14])
	);
	movemultiple tg28(
	.in11(gsum12[21:11]),
	.in3(gsum12[21:19]),
	.out(wg12[27:14])
	);
	movemultiple tg29(
	.in11(gsum13[21:11]),
	.in3(gsum13[21:19]),
	.out(wg13[27:14])
	);
	movemultiple tg30(
	.in11(gsum14[21:11]),
	.in3(gsum14[21:19]),
	.out(wg14[27:14])
	);
	movemultiple tg31(
	.in11(gsum15[21:11]),
	.in3(gsum15[21:19]),
	.out(wg15[27:14])
	);
	movemultiple tg32(
	.in11(gsum0[32:22]),
	.in3(gsum0[32:30]),
	.out(wg0[41:28])
	);
	movemultiple tg33(
	.in11(gsum1[32:22]),
	.in3(gsum1[32:30]),
	.out(wg1[41:28])
	);
	movemultiple tg34(
	.in11(gsum2[32:22]),
	.in3(gsum2[32:30]),
	.out(wg2[41:28])
	);
	movemultiple tg35(
	.in11(gsum3[32:22]),
	.in3(gsum3[32:30]),
	.out(wg3[41:28])
	);
	movemultiple tg36(
	.in11(gsum4[32:22]),
	.in3(gsum4[32:30]),
	.out(wg4[41:28])
	);
	movemultiple tg37(
	.in11(gsum5[32:22]),
	.in3(gsum5[32:30]),
	.out(wg5[41:28])
	);
	movemultiple tg38(
	.in11(gsum6[32:22]),
	.in3(gsum6[32:30]),
	.out(wg6[41:28])
	);
	movemultiple tg39(
	.in11(gsum7[32:22]),
	.in3(gsum7[32:30]),
	.out(wg7[41:28])
	);
	movemultiple tg40(
	.in11(gsum8[32:22]),
	.in3(gsum8[32:30]),
	.out(wg8[41:28])
	);
	movemultiple tg41(
	.in11(gsum9[32:22]),
	.in3(gsum9[32:30]),
	.out(wg9[41:28])
	);
	movemultiple tg42(
	.in11(gsum10[32:22]),
	.in3(gsum10[32:30]),
	.out(wg10[41:28])
	);
	movemultiple tg43(
	.in11(gsum11[32:22]),
	.in3(gsum11[32:30]),
	.out(wg11[41:28])
	);
	movemultiple tg44(
	.in11(gsum12[32:22]),
	.in3(gsum12[32:30]),
	.out(wg12[41:28])
	);
	movemultiple tg45(
	.in11(gsum13[32:22]),
	.in3(gsum13[32:30]),
	.out(wg13[41:28])
	);
	movemultiple tg46(
	.in11(gsum14[32:22]),
	.in3(gsum14[32:30]),
	.out(wg14[41:28])
	);
	movemultiple tg47(
	.in11(gsum15[32:22]),
	.in3(gsum15[32:30]),
	.out(wg15[41:28])
	);
	movemultiple tg48(
	.in11(gsum0[43:33]),
	.in3(gsum0[43:41]),
	.out(wg0[55:42])
	);
	movemultiple tg49(
	.in11(gsum1[43:33]),
	.in3(gsum1[43:41]),
	.out(wg1[55:42])
	);
	movemultiple tg50(
	.in11(gsum2[43:33]),
	.in3(gsum2[43:41]),
	.out(wg2[55:42])
	);
	movemultiple tg51(
	.in11(gsum3[43:33]),
	.in3(gsum3[43:41]),
	.out(wg3[55:42])
	);
	movemultiple tg52(
	.in11(gsum4[43:33]),
	.in3(gsum4[43:41]),
	.out(wg4[55:42])
	);
	movemultiple tg53(
	.in11(gsum5[43:33]),
	.in3(gsum5[43:41]),
	.out(wg5[55:42])
	);
	movemultiple tg54(
	.in11(gsum6[43:33]),
	.in3(gsum6[43:41]),
	.out(wg6[55:42])
	);
	movemultiple tg55(
	.in11(gsum7[43:33]),
	.in3(gsum7[43:41]),
	.out(wg7[55:42])
	);
	movemultiple tg56(
	.in11(gsum8[43:33]),
	.in3(gsum8[43:41]),
	.out(wg8[55:42])
	);
	movemultiple tg57(
	.in11(gsum9[43:33]),
	.in3(gsum9[43:41]),
	.out(wg9[55:42])
	);
	movemultiple tg58(
	.in11(gsum10[43:33]),
	.in3(gsum10[43:41]),
	.out(wg10[55:42])
	);
	movemultiple tg59(
	.in11(gsum11[43:33]),
	.in3(gsum11[43:41]),
	.out(wg11[55:42])
	);
	movemultiple tg60(
	.in11(gsum12[43:33]),
	.in3(gsum12[43:41]),
	.out(wg12[55:42])
	);
	movemultiple tg61(
	.in11(gsum13[43:33]),
	.in3(gsum13[43:41]),
	.out(wg13[55:42])
	);
	movemultiple tg62(
	.in11(gsum14[43:33]),
	.in3(gsum14[43:41]),
	.out(wg14[55:42])
	);
	movemultiple tg63(
	.in11(gsum15[43:33]),
	.in3(gsum15[43:41]),
	.out(wg15[55:42])
	);

	movemultiple tfg0(
	.in11(gsum0[10:0]),
	.in3(fsum[10:8]),
	.out(wfg0[13:0])
	);
	movemultiple tfg1(
	.in11(gsum1[10:0]),
	.in3(fsum[10:8]),
	.out(wfg1[13:0])
	);
	movemultiple tfg2(
	.in11(gsum2[10:0]),
	.in3(fsum[10:8]),
	.out(wfg2[13:0])
	);
	movemultiple tfg3(
	.in11(gsum3[10:0]),
	.in3(fsum[10:8]),
	.out(wfg3[13:0])
	);
	movemultiple tfg4(
	.in11(gsum4[10:0]),
	.in3(fsum[10:8]),
	.out(wfg4[13:0])
	);
	movemultiple tfg5(
	.in11(gsum5[10:0]),
	.in3(fsum[10:8]),
	.out(wfg5[13:0])
	);
	movemultiple tfg6(
	.in11(gsum6[10:0]),
	.in3(fsum[10:8]),
	.out(wfg6[13:0])
	);
	movemultiple tfg7(
	.in11(gsum7[10:0]),
	.in3(fsum[10:8]),
	.out(wfg7[13:0])
	);
	movemultiple tfg8(
	.in11(gsum8[10:0]),
	.in3(fsum[10:8]),
	.out(wfg8[13:0])
	);
	movemultiple tfg9(
	.in11(gsum9[10:0]),
	.in3(fsum[10:8]),
	.out(wfg9[13:0])
	);
	movemultiple tfg10(
	.in11(gsum10[10:0]),
	.in3(fsum[10:8]),
	.out(wfg10[13:0])
	);
	movemultiple tfg11(
	.in11(gsum11[10:0]),
	.in3(fsum[10:8]),
	.out(wfg11[13:0])
	);
	movemultiple tfg12(
	.in11(gsum12[10:0]),
	.in3(fsum[10:8]),
	.out(wfg12[13:0])
	);
	movemultiple tfg13(
	.in11(gsum13[10:0]),
	.in3(fsum[10:8]),
	.out(wfg13[13:0])
	);
	movemultiple tfg14(
	.in11(gsum14[10:0]),
	.in3(fsum[10:8]),
	.out(wfg14[13:0])
	);
	movemultiple tfg15(
	.in11(gsum15[10:0]),
	.in3(fsum[10:8]),
	.out(wfg15[13:0])
	);
	movemultiple tfg16(
	.in11(gsum0[21:11]),
	.in3(fsum[10:8]), 
	.out(wfg0[27:14])
	);
	movemultiple tfg17(
	.in11(gsum1[21:11]),
	.in3(fsum[10:8]),
	.out(wfg1[27:14])
	);
	movemultiple tfg18(
	.in11(gsum2[21:11]),
	.in3(fsum[10:8]),
	.out(wfg2[27:14])
	);
	movemultiple tfg19(
	.in11(gsum3[21:11]),
	.in3(fsum[10:8]),
	.out(wfg3[27:14])
	);
	movemultiple tfg20(
	.in11(gsum4[21:11]),
	.in3(fsum[10:8]),
	.out(wfg4[27:14])
	);
	movemultiple tfg21(
	.in11(gsum5[21:11]),
	.in3(fsum[10:8]),
	.out(wfg5[27:14])
	);
	movemultiple tfg22(
	.in11(gsum6[21:11]),
	.in3(fsum[10:8]),
	.out(wfg6[27:14])
	);
	movemultiple tfg23(
	.in11(gsum7[21:11]),
	.in3(fsum[10:8]),
	.out(wfg7[27:14])
	);
	movemultiple tfg24(
	.in11(gsum8[21:11]),
	.in3(fsum[10:8]),
	.out(wfg8[27:14])
	);
	movemultiple tfg25(
	.in11(gsum9[21:11]),
	.in3(fsum[10:8]),
	.out(wfg9[27:14])
	);
	movemultiple tfg26(
	.in11(gsum10[21:11]),
	.in3(fsum[10:8]),
	.out(wfg10[27:14])
	);
	movemultiple tfg27(
	.in11(gsum11[21:11]),
	.in3(fsum[10:8]),
	.out(wfg11[27:14])
	);
	movemultiple tfg28(
	.in11(gsum12[21:11]),
	.in3(fsum[10:8]),
	.out(wfg12[27:14])
	);
	movemultiple tfg29(
	.in11(gsum13[21:11]),
	.in3(fsum[10:8]),
	.out(wfg13[27:14])
	);
	movemultiple tfg30(
	.in11(gsum14[21:11]),
	.in3(fsum[10:8]),
	.out(wfg14[27:14])
	);
	movemultiple tfg31(
	.in11(gsum15[21:11]),
	.in3(fsum[10:8]),
	.out(wfg15[27:14])
	);
	movemultiple tfg32(
	.in11(gsum0[32:22]),
	.in3(fsum[10:8]),
	.out(wfg0[41:28])
	);
	movemultiple tfg33(
	.in11(gsum1[32:22]),
	.in3(fsum[10:8]),
	.out(wfg1[41:28])
	);
	movemultiple tfg34(
	.in11(gsum2[32:22]),
	.in3(fsum[10:8]),
	.out(wfg2[41:28])
	);
	movemultiple tfg35(
	.in11(gsum3[32:22]),
	.in3(fsum[10:8]),
	.out(wfg3[41:28])
	);
	movemultiple tfg36(
	.in11(gsum4[32:22]),
	.in3(fsum[10:8]),
	.out(wfg4[41:28])
	);
	movemultiple tfg37(
	.in11(gsum5[32:22]),
	.in3(fsum[10:8]),
	.out(wfg5[41:28])
	);
	movemultiple tfg38(
	.in11(gsum6[32:22]),
	.in3(fsum[10:8]),
	.out(wfg6[41:28])
	);
	movemultiple tfg39(
	.in11(gsum7[32:22]),
	.in3(fsum[10:8]),
	.out(wfg7[41:28])
	);
	movemultiple tfg40(
	.in11(gsum8[32:22]),
	.in3(fsum[10:8]),
	.out(wfg8[41:28])
	);
	movemultiple tfg41(
	.in11(gsum9[32:22]),
	.in3(fsum[10:8]),
	.out(wfg9[41:28])
	);
	movemultiple tfg42(
	.in11(gsum10[32:22]),
	.in3(fsum[10:8]),
	.out(wfg10[41:28])
	);
	movemultiple tfg43(
	.in11(gsum11[32:22]),
	.in3(fsum[10:8]),
	.out(wfg11[41:28])
	);
	movemultiple tfg44(
	.in11(gsum12[32:22]),
	.in3(fsum[10:8]),
	.out(wfg12[41:28])
	);
	movemultiple tfg45(
	.in11(gsum13[32:22]),
	.in3(fsum[10:8]),
	.out(wfg13[41:28])
	);
	movemultiple tfg46(
	.in11(gsum14[32:22]),
	.in3(fsum[10:8]),
	.out(wfg14[41:28])
	);
	movemultiple tfg47(
	.in11(gsum15[32:22]),
	.in3(fsum[10:8]),
	.out(wfg15[41:28])
	);
	movemultiple tfg48(
	.in11(gsum0[43:33]),
	.in3(fsum[10:8]),
	.out(wfg0[55:42])
	);
	movemultiple tfg49(
	.in11(gsum1[43:33]),
	.in3(fsum[10:8]),
	.out(wfg1[55:42])
	);
	movemultiple tfg50(
	.in11(gsum2[43:33]),
	.in3(fsum[10:8]),
	.out(wfg2[55:42])
	);
	movemultiple tfg51(
	.in11(gsum3[43:33]),
	.in3(fsum[10:8]),
	.out(wfg3[55:42])
	);
	movemultiple tfg52(
	.in11(gsum4[43:33]),
	.in3(fsum[10:8]),
	.out(wfg4[55:42])
	);
	movemultiple tfg53(
	.in11(gsum5[43:33]),
	.in3(fsum[10:8]),
	.out(wfg5[55:42])
	);
	movemultiple tfg54(
	.in11(gsum6[43:33]),
	.in3(fsum[10:8]),
	.out(wfg6[55:42])
	);
	movemultiple tfg55(
	.in11(gsum7[43:33]),
	.in3(fsum[10:8]),
	.out(wfg7[55:42])
	);
	movemultiple tfg56(
	.in11(gsum8[43:33]),
	.in3(fsum[10:8]),
	.out(wfg8[55:42])
	);
	movemultiple tfg57(
	.in11(gsum9[43:33]),
	.in3(fsum[10:8]),
	.out(wfg9[55:42])
	);
	movemultiple tfg58(
	.in11(gsum10[43:33]),
	.in3(fsum[10:8]),
	.out(wfg10[55:42])
	);
	movemultiple tfg59(
	.in11(gsum11[43:33]),
	.in3(fsum[10:8]),
	.out(wfg11[55:42])
	);
	movemultiple tfg60(
	.in11(gsum12[43:33]),
	.in3(fsum[10:8]),
	.out(wfg12[55:42])
	);
	movemultiple tfg61(
	.in11(gsum13[43:33]),
	.in3(fsum[10:8]),
	.out(wfg13[55:42])
	);
	movemultiple tfg62(
	.in11(gsum14[43:33]),
	.in3(fsum[10:8]),
	.out(wfg14[55:42])
	);
	movemultiple tfg63(
	.in11(gsum15[43:33]),
	.in3(fsum[10:8]),
	.out(wfg15[55:42])
	);

	
endmodule
