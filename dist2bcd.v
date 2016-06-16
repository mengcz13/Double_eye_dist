module dist2bcd(dist, bcd2, bcd1, bcd0);
input [6:0] dist;
output [6:0] bcd2;
output [6:0] bcd1;
output [6:0] bcd0;

wire [3:0] dist2;
wire [3:0] dist1;
wire [3:0] dist0;

assign dist2 = dist / 100;
assign dist1 = (dist % 100) / 10;
assign dist0 = dist % 10;

binary2bcd bbcd2(
	.bn(dist2),
	.Y_r(bcd2)
);

binary2bcd bbcd1(
	.bn(dist1),
	.Y_r(bcd1)
);

binary2bcd bbcd0(
	.bn(dist0),
	.Y_r(bcd0)
);

endmodule