module movemultiple(in11, in3, out);
	input in11, in3;
	output out;
	wire [10:0] in11;
	wire [2:0] in3;
	reg [13:0] out;
	
	always@(in11 or in3)
	begin
		case (in3)
			3'b000:out <= 14'b00000000000000;
			3'b001:out <= {3'b000, in11};
			3'b010:out <= {2'b00, in11, 1'b0};
			3'b011:out <= {2'b00, in11, 1'b0} + {3'b000, in11};
			3'b100:out <= {1'b0, in11, 2'b00};
			3'b101:out <= {1'b0, in11, 2'b00} + {3'b000, in11};
			3'b110:out <= {1'b0, in11, 2'b00} + {2'b00, in11, 1'b0};
			3'b110:out <= {1'b0, in11, 2'b00} + {2'b00, in11, 1'b0} + {3'b000, in11};
			default:out <= 14'b00000000000000;
		endcase
	end
endmodule
//module movemultiple(in11, in3, out);
//	input in11, in3;
//	output out;
//	wire [10:0] in11;
//	wire [10:0] in3;
//	reg [21:0] tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9, tmp10;
//	wire [13:0] out;
//	wire [21:0] tmp;
//	always@(in11 or in3)
//	begin
//		if (in3[0] == 1)
//			tmp0 <= {11'b00000000000, in11};
//		else
//			tmp0 <= 22'b0000000000000000000000;
//		if (in3[1] == 1)
//			tmp1 <= {10'b0000000000, in11, 1'b0};
//		else
//			tmp1 <= 22'b0000000000000000000000;
//		if (in3[2] == 1)
//			tmp2 <= {9'b000000000, in11, 2'b00};
//		else
//			tmp2 <= 22'b0000000000000000000000;
//		if (in3[3] == 1)
//			tmp3 <= {8'b00000000, in11, 3'b000};
//		else
//			tmp3 <= 22'b0000000000000000000000;
//		if (in3[4] == 1)
//			tmp4 <= {7'b0000000, in11, 4'b0000};
//		else
//			tmp4 <= 22'b0000000000000000000000;
//		if (in3[5] == 1)
//			tmp5 <= {6'b000000, in11, 5'b00000};
//		else
//			tmp5 <= 22'b0000000000000000000000;
//		if (in3[6] == 1)
//			tmp6 <= {5'b00000, in11, 6'b000000};
//		else
//			tmp6 <= 22'b0000000000000000000000;
//		if (in3[7] == 1)
//			tmp7 <= {4'b0000, in11, 7'b0000000};
//		else
//			tmp7 <= 22'b0000000000000000000000;
//		if (in3[8] == 1)
//			tmp8 <= {3'b000, in11, 8'b00000000};
//		else
//			tmp8 <= 22'b0000000000000000000000;
//		if (in3[9] == 1)
//			tmp9 <= {2'b00, in11, 9'b000000000};
//		else
//			tmp9 <= 22'b0000000000000000000000;
//		if (in3[10] == 1)
//			tmp10 <= {1'b0, in11, 10'b0000000000};
//		else
//			tmp10 <= 22'b0000000000000000000000;
//	end
//	assign tmp = tmp0 + tmp1 + tmp2 + tmp3 + tmp4 + tmp5 + tmp6 + tmp7 + tmp8 + tmp9 + tmp10;
//	assign out = tmp[21:8];
//endmodule