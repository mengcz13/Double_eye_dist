module twocamtop(pclk, vsync, href, d, sysclk, vclk, xclk, resetc, vs, hs, r, g, b, bcd1, bcd0, test);
output wire [1:0] xclk;
output wire [1:0] resetc;
output wire vs;
output wire hs;
output wire [2:0] r;
output wire [2:0] g;
output wire [2:0] b;
output wire [6:0] bcd1;
output wire [6:0] bcd0;
output wire [2:0] test;
input [1:0] pclk;
input [1:0] vsync;
input [1:0] href;
input [5:0] d;
input sysclk;
input vclk;

wire [5:0] dist;

wire calcclk;

wire [5:0] data_in;
wire [31:0] addr_in;
wire [1:0] clock_in;
wire [1:0] en_in;

wire [5:0] data_out;
wire [31:0] addr_out;
wire [1:0] clock_out;
wire [1:0] en_out;

wire [5:0] data_in_calc;
wire [21:0] addr_in_calc;
wire [1:0] clock_in_calc;
wire [1:0] en_in_calc;

wire [5:0] data_out_calc;
wire [21:0] addr_out_calc;
wire [1:0] clock_out_calc;
wire [1:0] en_out_calc;

reg [2:0] count;
reg clk3;

assign en_out_calc = 2'b11;
//assign calcclk = clk3;
assign calcclk = sysclk;
assign clock_out_calc[0] = calcclk;
assign clock_out_calc[1] = calcclk;

always@(posedge sysclk)
begin
	if (count == 4)
	begin
		count <= 0;
		clk3 <= ~clk3;
	end
	else
	begin
		count <= count + 1;
		clk3 <= clk3;
	end
end

rightcam2ram rc2r(
	.pclk(pclk[0]),
	.vsync(vsync[0]),
	.href(href[0]),
	.d(d[2:0]),
	.sysclk(sysclk),
	.xclk(xclk[0]),
	.resetc(resetc[0]),
	.data(data_in[2:0]),
	.wraddr(addr_in[15:0]),
	.wrclock(clock_in[0]),
	.wren(en_in[0]),
	.data_calc(data_in_calc[2:0]),
	.wraddr_calc(addr_in_calc[10:0]),
	.wrclock_calc(clock_in_calc[0]),
	.wren_calc(en_in_calc[0]),
	.test(test)
);

rightram rr(
	.data(data_in[2:0]),
	.rdaddress(addr_out[15:0]),
	.rdclock(clock_out[0]),
	.wraddress(addr_in[15:0]),
	.wrclock(clock_in[0]),
	.wren(en_in[0]),
	.q(data_out[2:0]),
	.rden(en_out[0])
);

dataram rdram(
	.data(data_in_calc[2:0]),
	.rdaddress(addr_out_calc[10:0]),
	.rdclock(clock_out_calc[0]),
	.wraddress(addr_in_calc[10:0]),
	.wrclock(clock_in_calc[0]),
	.wren(en_in_calc[0]),
	.q(data_out_calc[2:0]),
	.rden(en_out_calc[0])
);


leftcam2ram lc2r(
	.pclk(pclk[1]),
	.vsync(vsync[1]),
	.href(href[1]),
	.d(d[5:3]),
	.sysclk(sysclk),
	.xclk(xclk[1]),
	.resetc(resetc[1]),
	.data(data_in[5:3]),
	.wraddr(addr_in[31:16]),
	.wrclock(clock_in[1]),
	.wren(en_in[1]),
	.data_calc(data_in_calc[5:3]),
	.wraddr_calc(addr_in_calc[21:11]),
	.wrclock_calc(clock_in_calc[1]),
	.wren_calc(en_in_calc[1])
);

rightram lr(
	.data(data_in[5:3]),
	.rdaddress(addr_out[31:16]),
	.rdclock(clock_out[1]),
	.wraddress(addr_in[31:16]),
	.wrclock(clock_in[1]),
	.wren(en_in[1]),
	.q(data_out[5:3]),
	.rden(en_out[1])
);

dataram ldram(
	.data(data_in_calc[5:3]),
	.rdaddress(addr_out_calc[21:11]),
	.rdclock(clock_out_calc[1]),
	.wraddress(addr_in_calc[21:11]),
	.wrclock(clock_in_calc[1]),
	.wren(en_in_calc[1]),
	.q(data_out_calc[5:3]),
	.rden(en_out_calc[1])
);

calc_serial cserial(
	.clk(calcclk),
	.fdata(data_out_calc[2:0]),
	.gdata(data_out_calc[5:3]),
	.dist(dist),
	.address_f(addr_out_calc[10:0]),
	.address_g(addr_out_calc[21:11])
);

dist2bcd dbcd(
	.dist(dist),
	.bcd1(bcd1),
	.bcd0(bcd0)
);

//topcalc tcalc(
//	.clk(calcclk),
//	.d(dist),
//	.address_f(addr_out_calc[10:0]),
//	.address_g(addr_out_calc[21:11]),
//	.gdata(data_out_calc[5:3]),
//	.getfdata(data_out_calc[2:0]),
//	.zero(zero)
//);

//rightram2vga rr2v(
//	.rdaddr(addr_out[31:16]),
//	.rdclk(clock_out[1:1]),
//	.vs(vs),
//	.hs(hs),
//	.r(r),
//	.g(g),
//	.b(b),
//	.vclk(vclk),
//	.data(data_out[5:3]),
//	.rden(en_out[1:1])
//);

//rightram2vga rr2v(
//	.rdaddr(addr_out[15:0]),
//	.rdclk(clock_out[0]),
//	.vs(vs),
//	.hs(hs),
//	.r(r),
//	.g(g),
//	.b(b),
//	.vclk(vclk),
//	.data(data_out[2:0]),
//	.rden(en_out[0])
//);

seperate_view spv(
	.vclk(vclk),
	.datal(data_out[5:3]),
	.rdaddrl(addr_out[31:16]),
	.rdclkl(clock_out[1]),
	.datar(data_out[2:0]),
	.rdaddrr(addr_out[15:0]),
	.rdclkr(clock_out[0]),
	.vs(vs),
	.hs(hs),
	.r(r),
	.g(g),
	.b(b),
	.rdenl(en_out[1]),
	.rdenr(en_out[0])
);

endmodule