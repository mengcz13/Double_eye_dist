module calc_serial_windowcalc(clk, wdata, wable, wsum, w2sum);
input clk;
input [2:0] wdata;
input wable;
output reg [10:0] wsum;
output reg [13:0] w2sum;
endmodule