module multiplex5_1(a, b, c, d, e, select, out);
    input  a, b, c, d, e;
    input  [2:0] select;
    output  out; 

    wire [4:0] in_vec;

    assign in_vec = {e, d, c, b, a};
    assign out = in_vec[select];
endmodule