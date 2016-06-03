module calc_serial_controller(clk, reset, pcount, wcount, address_f, address_g, fable, freset, gable, greset, fgable, fgreset, compable, compreset, current_dist, allwindowend, pcounter_able, pcounter_reset, wcounter_able, wcounter_reset);
input clk;
input reset;
input [8:0] pcount;
input [6:0] wcount;
output reg [10:0] address_f;
output reg [10:0] address_g;
output reg fable;
output reg freset;
output reg gable;
output reg greset;
output reg fgable;
output reg fgreset;
output reg compable;
output reg compreset;
output reg [5:0] current_dist;
output reg allwindowend;

output reg pcounter_able;
output reg pcounter_reset;
output reg wcounter_able;
output reg wcounter_reset;

parameter IDLE = 0, WZERO = 1, W1_END = 2, WINDOWEND = 3, WRESET = 4, WIDLE = 5, ALLEND = 6;
reg [2:0] state;
reg [2:0] nextstate;

always@(posedge clk or negedge reset)
begin
	if (reset == 0)
		state <= IDLE;
	else
		state <= nextstate;
end

always@(state)
begin
	nextstate = IDLE;
	case (state)
		IDLE:
			nextstate = WZERO;
		WZERO:
			if (pcount == 256)
				nextstate = WINDOWEND;
			else
				nextstate = WZERO;
		W1_END:
			if (pcount == 256)
				nextstate = WINDOWEND;
			else
				nextstate = W1_END;
		WINDOWEND:
			nextstate = WRESET;
		WRESET:
			if (wcount == 64)
				nextstate = ALLEND;
			else
				nextstate = WIDLE;
		WIDLE:
			nextstate = W1_END;
		ALLEND:
			nextstate = IDLE;
		default:
			nextstate = IDLE;
	endcase
end

always@(posedge clk or negedge reset)
begin
	case (nextstate)
		IDLE:
			begin
			address_f <= 0;
			address_g <= 0;
			fable <= 0;
			freset <= 0;
			gable <= 0;
			greset <= 0;
			fgable <= 0;
			fgreset <= 0;
			compable <= 0;
			compreset <= 0;
			current_dist <= 0;
			allwindowend <= 0;
			pcounter_able <= 1;
			pcounter_reset <= 1;
			wcounter_able <= 0;
			wcounter_reset <= 0;
			end
		WZERO:
			begin
			address_f <= (pcount >> 4) * 79 + (pcount & 4'b1111);
			address_g <= (pcount >> 4) * 79 + (pcount & 4'b1111);
			fable <= 1;
			freset <= 1;
			gable <= 1;
			greset <= 1;
			fgable <= 1;
			fgreset <= 1;
			compable <= 0;
			compreset <= 1;
			current_dist <= wcount;
			allwindowend <= 0;
			pcounter_able <= 1;
			pcounter_reset <= 1;
			wcounter_able <= 0;
			wcounter_reset <= 1;
			end
		W1_END:
			begin
			address_f <= (pcount >> 4) * 79 + (pcount & 4'b1111);
			address_g <= (pcount >> 4) * 79 + (pcount & 4'b1111) + wcount;
			if (pcount == 0)
			begin
			fable <= 0;
			freset <= 1;
			gable <= 0;
			greset <= 1;
			fgable <= 0;
			fgreset <= 1;
			end
			else
			begin
			fable <= 1;
			freset <= 1;
			gable <= 1;
			greset <= 1;
			fgable <= 1;
			fgreset <= 1;
			end
			compable <= 0;
			compreset <= 1;
			current_dist <= wcount;
			allwindowend <= 0;
			pcounter_able <= 1;
			pcounter_reset <= 1;
			wcounter_able <= 0;
			wcounter_reset <= 1;
			end
		WINDOWEND:
			begin
			address_f <= 0;
			address_g <= wcount;
			fable <= 0;
			freset <= 1;
			gable <= 0;
			greset <= 1;
			fgable <= 0;
			fgreset <= 1;
			compable <= 1;
			compreset <= 1;
			current_dist <= wcount;
			allwindowend <= 0;
			pcounter_able <= 0;
			pcounter_reset <= 1;
			wcounter_able <= 0;
			wcounter_reset <= 1;
			end
		WRESET:
			begin
			address_f <= 0;
			address_g <= wcount;
			fable <= 0;
			freset <= 0;
			gable <= 0;
			greset <= 0;
			fgable <= 0;
			fgreset <= 0;
			compable <= 0;
			compreset <= 1;
			current_dist <= wcount;
			allwindowend <= 0;
			pcounter_able <= 0;
			pcounter_reset <= 0;
			wcounter_able <= 1;
			wcounter_reset <= 1;
			end
		WIDLE:
			begin
			address_f <= (pcount >> 4) * 79 + (pcount & 4'b1111);
			address_g <= (pcount >> 4) * 79 + (pcount & 4'b1111) + wcount;
			if (pcount == 0)
			begin
			fable <= 0;
			freset <= 1;
			gable <= 0;
			greset <= 1;
			fgable <= 0;
			fgreset <= 1;
			end
			else
			begin
			fable <= 1;
			freset <= 1;
			gable <= 1;
			greset <= 1;
			fgable <= 1;
			fgreset <= 1;
			end
			compable <= 0;
			compreset <= 1;
			current_dist <= wcount;
			allwindowend <= 0;
			pcounter_able <= 1;
			pcounter_reset <= 1;
			wcounter_able <= 0;
			wcounter_reset <= 1;
			end
		ALLEND:
			begin
			address_f <= (pcount >> 4) * 79 + (pcount & 4'b1111);
			address_g <= (pcount >> 4) * 79 + (pcount & 4'b1111) + wcount;
			fable <= 0;
			freset <= 0;
			gable <= 0;
			greset <= 0;
			fgable <= 0;
			fgreset <= 0;
			compable <= 0;
			compreset <= 1;
			current_dist <= wcount;
			allwindowend <= 1;
			pcounter_able <= 0;
			pcounter_reset <= 0;
			wcounter_able <= 0;
			wcounter_reset <= 1;
			end
		default:
			begin
			address_f <= 0;
			address_g <= 0;
			fable <= 0;
			freset <= 0;
			gable <= 0;
			greset <= 0;
			fgable <= 0;
			fgreset <= 0;
			compable <= 0;
			compreset <= 0;
			current_dist <= 0;
			allwindowend <= 0;
			pcounter_able <= 0;
			pcounter_reset <= 0;
			wcounter_able <= 0;
			wcounter_reset <= 0;
			end
	endcase
end

endmodule