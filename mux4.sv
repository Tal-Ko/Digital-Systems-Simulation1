// 4->1 multiplexer template
module mux4 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic d2,          // Data input 2
    input logic d3,          // Data input 3
    input logic [1:0] sel,   // Select input
    output logic z           // Output
);

// Put your code here
// ------------------

    // Signal declaration for inner output wires
    logic res1, res2;

    // Gate instantiations
    mux2 mux_d0_d1_inst (
        .d0(d0),
        .d1(d1),
        .sel(sel[0]),
        .z(res1)
    );

    mux2 mux_d2_d3_inst (
        .d0(d2),
        .d1(d3),
        .sel(sel[0]),
        .z(res2)
    );

    mux2 mux_res1_res2_inst (
        .d0(res1),
        .d1(res2),
        .sel(sel[1]),
        .z(z)
    );

// End of your code

endmodule
