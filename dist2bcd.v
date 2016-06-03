module dist2bcd(dist, bcd1, bcd0);
<<<<<<< HEAD
input [6:0] dist;
=======
input [5:0] dist;
>>>>>>> 1d8c7e6b82cc99ec651e346b42abbe1a73166042
output [6:0] bcd1;
output [6:0] bcd0;

wire [3:0] dist1;
wire [3:0] dist0;

assign dist1 = dist / 10;
assign dist0 = dist % 10;

binary2bcd bbcd1(
	.bn(dist1),
	.Y_r(bcd1)
);

binary2bcd bbcd0(
	.bn(dist0),
	.Y_r(bcd0)
);

endmodule