module movemultiple(in11, in3, out);
	input in11, in3;
	output out;
	wire [10:0] in11
	wire [2:0] in3;
	reg [13:0] out;
	
	always@(in11 or in3)
	begin
		case (in3)
			3'b000:out <= 14'b00000000000000;
			3'b001:out <= {000, in11};
			3'b010:out <= {00, in11, 0};
			3'b011:out <= {00, in11, 0} + {000, in11};
			3'b100:out <= {0, in11, 00};
			3'b101:out <= {0, in11, 00} + {000, in11};
			3'b110:out <= {0, in11, 00} + {00, in11, 0};
			3'b110:out <= {0, in11, 00} + {00, in11, 0} + {000, in11};
			default:out <= 14'b00000000000000;
		endcase
	end
endmodule
