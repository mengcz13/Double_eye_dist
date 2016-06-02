module calc_serial(clk, fdata, gdata, dist, address_f, address_g);
input clk;
input [2:0] fdata;
input [2:0] gdata;
output wire [5:0] dist;
output wire [10:0] address_f;
output wire [10:0] address_g;

wire [8:0] pcount;
wire [6:0] wcount;
wire fable;
wire freset;
wire gable;
wire greset;
wire fgable;
wire fgreset;
wire compable;
wire compreset;
wire [5:0] current_dist;
wire allwindowend;
wire pcounter_able;
wire pcounter_reset;
wire wcounter_able;
wire wcounter_reset;

wire [10:0] fsum;
wire [13:0] f2sum;
wire [10:0] gsum;
wire [13:0] g2sum;
wire [13:0] fgsum;
wire [31:0] zssd;


calc_serial_controller csc (
	.clk(clk),
	.reset(1),
	.pcount(pcount),
	.wcount(wcount),
	.address_f(address_f),
	.address_g(address_g),
	.fable(fable),
	.freset(freset),
	.gable(gable),
	.greset(greset),
	.fgable(fgable),
	.fgreset(fgreset),
	.compable(compable),
	.compreset(compreset),
	.current_dist(current_dist),
	.allwindowend(allwindowend),
	.pcounter_able(pcounter_able),
	.pcounter_reset(pcounter_reset),
	.wcounter_able(wcounter_able),
	.wcounter_reset(wcounter_reset)
);

calc_serial_pcounter pcounter (
	.clk(clk),
	.able(pcounter_able),
	.reset(pcounter_reset),
	.pcount(pcount)
);

calc_serial_wcounter wcounter (
	.clk(clk),
	.able(wcounter_able),
	.reset(wcounter_reset),
	.wcount(wcount)
);

calc_serial_windowcalc fwindow (
	.clk(clk),
	.reset(freset),
	.wdata(fdata),
	.wable(fable), 
	.wsum(fsum),
	.w2sum(f2sum)
);

calc_serial_windowcalc gwindow (
	.clk(clk),
	.reset(greset),
	.wdata(gdata),
	.wable(gable), 
	.wsum(gsum),
	.w2sum(g2sum)
);

calc_serial_fgcalc fgcalc (
	.clk(clk),
	.reset(fgreset),
	.fdata(fdata),
	.gdata(gdata),
	.fgable(fgable),
	.fgsum(fgsum)
);

calc_serial_formula formula (
	.fsum(fsum),
	.f2sum(f2sum),
	.gsum(gsum),
	.g2sum(g2sum),
	.fgsum(fgsum),
	.zssd(zssd)
);

calc_serial_comp compare (
	.clk(clk),
	.compable(compable),
	.reset(compreset),
	.rank(current_dist),
	.zssd(zssd),
	.windowend(allwindowend),
	.dist(dist)
);

endmodule