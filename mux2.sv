// 2->1 multiplexer
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

// Put your code here
// ------------------

    // Signal declaration for inner output wires
    logic x1, x2, x3;
    logic y1, y2, y3;
    logic z1;

    // Gate instantiations
    NOT #(
        .Tpdlh(10),
        .Tpdhl(7)
    ) g1 (
        .Z(x1),
        .A(sel)
    );

    NOT #(
        .Tpdlh(10),
        .Tpdhl(7)
    ) g2 (
        .Z(y1),
        .A(d0)
    );

    NOT #(
        .Tpdlh(10),
        .Tpdhl(7)
    ) g3 (
        .Z(z1),
        .A(d1)
    );

    OR2 #(
        .Tpdlh(10),
        .Tpdhl(1)
    ) g4 (
        .Z(y2),
        .A(sel),
        .B(y1)
    );

    OR2 #(
        .Tpdlh(10),
        .Tpdhl(1)
    ) g5 (
        .Z(x2),
        .A(x1),
        .B(z1)
    );

    NOT #(
        .Tpdlh(10),
        .Tpdhl(7)
    ) g6 (
        .Z(y3),
        .A(y2)
    );

    NOT #(
        .Tpdlh(10),
        .Tpdhl(7)
    ) g7 (
        .Z(x3),
        .A(x2)
    );

    OR2 #(
        .Tpdlh(10),
        .Tpdhl(1)
    ) g8 (
        .Z(z),
        .A(x3),
        .B(y3)
    );

// End of your code

endmodule
