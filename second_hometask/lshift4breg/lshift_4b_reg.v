module lshift_4b_reg(input d,
							input clk,
							input rstn,
							output reg [3:0] out);
	always @ (posedge clk) begin
		if (!rstn) begin
			out <= 0;
		end else begin
			out <= {out[2:0], d};
		end
	end
endmodule