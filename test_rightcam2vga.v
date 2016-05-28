module test_rightcam2vga(pclk, vsync, href, d, sysclk, vclk, xclk, resetc, vs, hs, r, g, b);
output wire xclk;
output wire resetc;
output wire vs;
output wire hs;
output wire [2:0] r;
output wire [2:0] g;
output wire [2:0] b;
input pclk;
input vsync;
input href;
input [2:0] d;
input sysclk;
input vclk;

wire [2:0] data_in;
wire [15:0] addr_in;
wire clock_in;
wire en_in;

wire [2:0] data_out;
wire [15:0] addr_out;
wire clock_out;
wire en_out;


rightcam2ram rc2r(
	.pclk(pclk),
	.vsync(vsync),
	.href(href),
	.d(d),
	.sysclk(sysclk),
	.xclk(xclk),
	.resetc(resetc),
	.data(data_in),
	.wraddr(addr_in),
	.wrclock(clock_in),
	.wren(en_in)
);

rightram rr(
	.data(data_in),
	.rdaddress(addr_out),
	.rdclock(clock_out),
	.wraddress(addr_in),
	.wrclock(clock_in),
	.wren(en_in),
	.q(data_out),
	.rden(en_out)
);

rightram2vga rr2v(
	.rdaddr(addr_out),
	.rdclk(clock_out),
	.vs(vs),
	.hs(hs),
	.r(r),
	.g(g),
	.b(b),
	.vclk(vclk),
	.data(data_out),
	.rden(en_out)
);

endmodule