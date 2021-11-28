// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------

    // Signal declaration for inner output wires
    logic t1, t2;
    logic w1, w2, w3;
    logic x1;
    logic y1, y2;
    logic z1, z2, z3;

    // Gate instantiations
    // Cout circuit
    XOR2 #(
        .Tpdhl(6),
        .Tpdlh(6)
    ) g1 (
        .Z(x1),
        .A(a_ns),
        .B(a)
    );

    OR2 #(
        .Tpdlh(10),
        .Tpdhl(10)
    ) g6 (
        .Z(z1),
        .A(x1),
        .B(y2)
    );

    OR2 #(
        .Tpdhl(10),
        .Tpdlh(10)
    ) g2 (
        .Z(y1),
        .A(cin),
        .B(b)
    );

    NOT #(
        .Tpdlh(10),
        .Tpdhl(10)
    ) g7 (
        .Z(y2),
        .A(y1)
    );

    NOT #(
        .Tpdlh(10),
        .Tpdhl(10)
    ) g3 (
        .Z(w1),
        .A(b)
    );

    NOT #(
        .Tpdlh(10),
        .Tpdhl(10)
    ) g4 (
        .Z(w2),
        .A(cin)
    );

    OR2 #(
        .Tpdhl(10),
        .Tpdlh(10)
    ) g8 (
        .A(w1),
        .B(w2),
        .Z(w3)
    );

    NOT #(
        .Tpdlh(10),
        .Tpdhl(10)
    ) g9 (
        .Z(z2),
        .A(w3)
    );

    NOT #(
        .Tpdlh(10),
        .Tpdhl(10)
    ) g12 (
        .Z(z3),
        .A(z1)
    );

    OR2 #(
        .Tpdhl(10),
        .Tpdlh(10)
    ) g10 (
        .Z(cout),
        .A(z3),
        .B(z2)
    );

    // S circuit
    XOR2 #(
        .Tpdhl(6),
        .Tpdlh(6)
    ) g5 (
        .Z(t1),
        .A(b),
        .B(cin)
    );

    XOR2 #(
        .Tpdhl(6),
        .Tpdlh(6)
    ) g11 (
        .Z(s),
        .A(a),
        .B(t1)
    );

// End of your code

endmodule
