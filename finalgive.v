module finalgive(startsig, update, in, inp, out, outp);
	input startsig, update, in, inp;
	output out, outp;
	
	wire startsig, update;
	wire [17:0] in;
	wire [5:0] inp;
	reg [17:0] out;
	reg [5:0] outp;
	reg [17:0] tmp;
	reg [5:0] tmpp;
	reg state;
	parameter lyx = 1'b1, zh = 1'b0;
	
	always@(posedge update or posedge startsig)
	begin
		if (startsig == 1)
		begin
			state <= lyx;
			out <= tmp;
			outp <= tmpp;
		end
		else
		begin
			if (state == lyx)
			begin
				tmp <= in;
				tmpp <= inp;
				state <= zh;
			end
			else
			begin
				if (in < tmp)
				begin
					tmp <= in;
					tmpp <= inp;
				end
				else
				begin
					tmp <= tmp;
					tmpp <= tmpp;
				end
			end
		end
	end
	
endmodule
