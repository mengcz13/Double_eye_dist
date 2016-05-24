module compare(in1, in2, inp1, inp2, out, outp);
	input in1, in2, inp1, inp2;
	output out, outp;
	wire []in1;
	wire []in2;
	wire []inp1;
	wire []inp2;
	reg []out;
	reg []outp;
	
	always@(in1 or in2)
	begin
		if (in1 < in2)
		begin
			out <= in1;
			outp <= inp1;
		end
		else
		begin
			out <= in2;
			out <= inp2;
		end
	end
endmodule
