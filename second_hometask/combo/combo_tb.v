`include "combo.v"

module combo_tb;
	reg a, b, c, d, e;
	wire z;
	integer i;
	combo u0 ( .a(a), .b(b), .c(c), .d(d), .e(e), .z(z));
	initial begin
		$dumpfile ("combo_tb.vcd");
		$dumpvars;
		a <= 0;
		b <= 0;
		c <= 0;
		d <= 0;
		e <= 0;
		// $monitor ("a=%0b b=%0b c=%0b d=%0b e=%0b z=%0b", a, b, c, d, e, z);
		for (i = 0; i < 32; i = i + 1) begin
			{a, b, c, d, e} = i;
			#10;
		end
	#5 $finish;
end
endmodule