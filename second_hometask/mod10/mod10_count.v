module mod10_count ( input clk,
							input rstn,
							output reg[3:0] out);
							
	always @ (posedge clk) begin
		if (!rstn) begin
			out <= 0;
		end else begin
			if (out == 10)
				out <= 0;
			else
				out <= out + 1;
		end
	end
endmodule