`include "nco_dither_lsfr.v"


module NCO (clk, rst, step, out);

parameter STEP_SIZE = 16; // integer part of of phase accumulator
parameter ADDR_WIDTH = 8; // integer part of of phase accumulator
parameter LUT_WIDTH = 16; 

localparam FRACT_WIDTH = STEP_SIZE-ADDR_WIDTH; // fractional part of phase accumulator

input clk;
input rst;
input [STEP_SIZE-1:0] step; // defines sinwave frequency
output reg signed [LUT_WIDTH-1:0] out;

reg signed [LUT_WIDTH-1:0] LUT [2**ADDR_WIDTH-1:0];
reg [STEP_SIZE+FRACT_WIDTH-1:0] ph_accum;


// RTL code for phase accumulator'

always @(posedge clk) begin
    if (rst)
        ph_accum <= 0;
    else
        ph_accum <= ph_accum + step;
end


// generate SIN LUT contents
localparam PI = $atan(1)*4.0;
// Potentially here can be troubles in 'initial'
// if yes, then generate file from other lang and use `$readmemb` or `$readmemh`

initial begin: sin_lut 
real phase;
    for (phase = 0; phase < 2**ADDR_WIDTH; phase=phase+1) begin
       LUT[int' (phase) ] = ($sin(2*PI * phase / 2.0**ADDR_WIDTH)) * 2**(LUT_WIDTH - 2);
    end
end

// dither generation
wire [1:0] dither;
// assign dither = 0;
nco_dither_lsfr generator (.clk(clk), .rst(rst), .out(dither));

// addr generation
reg [ADDR_WIDTH-1:0] addr;

always @(posedge clk) begin
    if (rst)
        addr <= 0;
    else
        addr <= dither + ph_accum [ADDR_WIDTH+FRACT_WIDTH-1:FRACT_WIDTH];
end


// LUT ouput generation from ROM
always @ (posedge clk)
	begin
		out <= LUT[addr];
	end

endmodule
