// 64-bit ALU template
module alu64bit (
    input logic [63:0] a,    // Input bit a
    input logic [63:0] b,    // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic [63:0] s,   // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------

    logic [62:0] ripple_cout;
    logic [62:0] ripple_cin_next;

    alu1bit alu1bit_inst_first(
        .s(s[0]),
        .cout(ripple_cout[0]),
        .a(a[0]),
        .b(b[0]),
        .cin(cin),
        .op(op)
    );

    assign ripple_cin_next[0] = ripple_cout[0];
    genvar i;
    generate
        for (i = 1; i < 63; i++)
        begin
            alu1bit alu1bit_inst(
                .s(s[i]),
                .cout(ripple_cout[i]),
                .a(a[i]),
                .b(b[i]),
                .cin(ripple_cin_next[i - 1]),
                .op(op)
            );
            assign ripple_cin_next[i] = ripple_cout[i];
        end
    endgenerate

    alu1bit alu1bit_inst_last(
        .s(s[63]),
        .cout(cout),
        .a(a[63]),
        .b(b[63]),
        .cin(ripple_cin_next[62]),
        .op(op)
    );

// End of your code

endmodule
