module combo1 (input a, 
					input b,
					input c,
					input d,
					output reg o);
	always @ (a or b or c or d) begin
		o <= ~((a & b) | (c^d));
	end
endmodule