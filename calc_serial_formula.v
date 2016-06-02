module calc_serial_formula(fsum, f2sum, gsum, g2sum, fgsum, zssd);
input [31:0] fsum;
input [31:0] f2sum;
input [31:0] gsum;
input [31:0] g2sum;
input [31:0] fgsum;
output wire [31:0] zssd;

// assign zssd = ( ( (f2sum << 8) + (g2sum << 8) - fsum * fsum - gsum * gsum - fsum * gsum + (fgsum << 8) ) >> 8 );
assign zssd = (f2sum << 8) + (g2sum << 8) - fsum * fsum - gsum * gsum + ( (fsum * gsum) << 1 ) - (fgsum << 9);

endmodule