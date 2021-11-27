// NOT FOR SUBMITTING - TESTING ONLY
// 2->1 multiplexer test bench template
module mux2_test;
    logic d0, d1, sel;
    logic z;

    mux2 mux2_inst (
        .d0(d0),
        .d1(d1),
        .sel(sel),
        .z(z)
    );

    // Every test we wait 38ps. The maximum Tpd of the mux2 is 28, so we
    // want to be able to see changes for 10ps before moving on to the
    // next test.
    initial begin
        d0 = 1'b1;
        d1 = 1'b0;
        sel = 1'b1;

        #38
        // sel 1->0
        sel = 1'b0;

        #38
        // sel 0->1
        sel = 1'b1;

        #38
        // d1 1->0
        d1 = 1'b0;

        #38
        // d1 0->1
        d1 = 1'b1;

        #38
        // Change d0 from 0 to 1 and test changes in d1
        d0 = 1'b0;

        #38
        // d1 1->0
        d1 = 1'b0;

        #38
        // d1 0->1
        d1 = 1'b1;

        #38
        // sel 1->0
        sel = 1'b0;

        #38
        // sel 0->1
        sel = 1'b1;

        // Change sel to 0 and test changes in d0
        #38
        sel = 1'b0;
        d0 = 1'b1;

        #38
        d0 = 1'b0;

        #38
        // Change d1 to 1 and test changes in d0
        d1 = 1'b1;
        d0 = 1'b1;

        #38
        d0 = 1'b0;

        #38
        $stop;
    end

    // Total simulation time: 532

endmodule
