// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------

    // Signal declaration for inner output wires
    logic x1;
    logic y1;
    logic z1, z2, z3;

    // Gate instantiations
    NOT #(
        .Tpdhl(10),
        .Tpdlh(10)
    ) g1 (
        .Z(x1),
        .A(op[0])
    );

    fas fas_inst (
        .s(z1),
        .cout(cout),
        .a(a),
        .b(b),
        .cin(cin),
        .a_ns(x1)
    );

    OR2 #(
        .Tpdhl(10),
        .Tpdlh(10)
    ) g3(
        .Z(y1),
        .A(a),
        .B(b)
    );

    NOT #(
        .Tpdhl(10),
        .Tpdlh(10)
    ) g4(
        .Z(z2),
        .A(y1)
    );

    XOR2 #(
        .Tpdhl(6),
        .Tpdlh(6)
    ) g5(
        .Z(z3),
        .A(a),
        .B(b)
    );

    mux4 mux4_inst (
        .z(s),
        .d0(z2),
        .d1(z3),
        .d2(z1),
        .d3(z1),
        .sel(op)
    );

// End of your code

endmodule
