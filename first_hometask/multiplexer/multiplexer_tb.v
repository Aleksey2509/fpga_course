`include "multiplexer.v"

module multiplex5_1_tb;
    reg a, b, c, d, e;
    wire out;
    reg [2:0] select;
    integer i;

    multiplex5_1 test_object( .a(a), .b(b), .c(c), .d(d), .e(e), .select(select), .out(out));

    initial begin
        $dumpfile("test_bench.vcd");
        $dumpvars;
        select <= 0;
        a <= 7;
        b <= 6;
        c <= 5;
        d <= 4;
        e <= 3;

        for (i = 1; i < 5; i += 1) begin
            #5 select <= i;
        end
        
        #5 $finish;

    end
endmodule