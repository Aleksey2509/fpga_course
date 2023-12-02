module mux21 (input a, b, sel, output reg c);
	always @ ( a or b or sel) begin
		c = sel ? a : b;
	end
endmodule