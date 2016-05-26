module compare(in1, in2, inp1, inp2, out, outp);
	input in1, in2, inp1, inp2;
	output out, outp;
	wire [17:0]in1;
	wire [17:0]in2;
	wire [7:0]inp1;
	wire [7:0]inp2;
	reg [17:0]out;
	reg [7:0]outp;
	
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
