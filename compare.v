module compare(startsig, finalstart, in1, in2, inp1, inp2, out, outp);
	input in1, in2, inp1, inp2;
	input startsig, finalstart;
	output out, outp;
	wire startsig;
	wire finalstart;
	wire [17:0]in1;
	wire [17:0]in2;
	wire [7:0]inp1;
	wire [7:0]inp2;
	reg [17:0]out;
	reg [7:0]outp;
	reg state;
	
	parameter waiting = 1'b0, working = 1'b1;
	
	always@(posedge startsig or posedge finalstart)
	begin
		if (startsig == 1)
			state <= waiting;
		else
			state <= working;
	end
	
	always@(in1 or in2)
	begin
		if (state == working)
		begin
			if (in1 < in2)
			begin
				out <= in1;
				outp <= inp1;
			end
			else
			begin
				out <= in2;
				outp <= inp2;
			end
		end
		else
		begin
			out <= out;
			outp <= outp;
		end
	end
endmodule
