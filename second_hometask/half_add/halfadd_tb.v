`include "halfadd.v"

module tb;
	reg a, b;
	wire sum, cout;
	integer i;
	halfadd u0 ( .a(a), .b(b), .sum(sum), .cout(cout));
	initial begin
		$dumpfile("halfadd_tb.vcd");
		$dumpvars;
		a <= 0;
		b <= 0;
		$monitor("a=%0b b=%0b sum=%0b cout=%0b", a, b, sum, cout);
		for (i = 0; i < 4; i = i + 1) begin
			{a, b} = i;
			#10;
		end
	end
endmodule