module nco_dither_lsfr (clk, rst, out);

parameter OUT_SIZE=3;
parameter LSFR_POLY='b11001001;

localparam LSFR_SIZE=$clog2(LSFR_POLY);

input clk;
input rst; 
output [OUT_SIZE-1:0] out;

reg [LSFR_SIZE-1:0] lsfr;

assign out = lsfr[LSFR_SIZE-1:LSFR_SIZE-OUT_SIZE];

wire lsfr_next;

// below line with default parameters is equivalent to
// lsfr_next = lsfr [5] ^ lsfr[4] ^ lsfr[1] ^ lsfr[0];
assign lsfr_next = ^(lsfr & LSFR_POLY);

always @(posedge clk) begin
    if (rst) begin
	    lsfr <= 'b01;
	end
	else
	begin
		lsfr <= {lsfr[LSFR_SIZE-2:0], lsfr_next};
		// above line equvivalent to below 2 lines
		// lsfr[LSFR_SIZE-1:1] <= lsfr[LSFR_SIZE-2:0];
		// lsfr[0] <= lsfr_next;
	end
end
endmodule



