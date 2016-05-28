module finalgive(startsig, update, in, inp, out, outp);
	input startsig, update, in, inp;
	output out, outp;
	
	wire startsig, update;
	wire [17:0] in;
	wire [7:0] inp;
	reg [17:0] out;
	reg [7:0] outp;
	reg state;
	parameter lyx = 1'b1, zh = 1'b0;
	
	always@(posedge update or posedge startsig)
	begin
		if (startsig == 1)
		begin
			state <= lyx;
		end
		else
		begin
			if (state == lyx)
			begin
				out <= in;
				outp <= inp;
				state <= zh;
			end
			else
			begin
				if (in < out)
				begin
					out <= in;
					outp <= inp;
				end
				else
				begin
					out <= out;
					outp <= outp;
				end
			end
		end
	end
	
endmodule
