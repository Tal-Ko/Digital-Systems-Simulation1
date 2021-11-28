// 4->1 multiplexer test bench template
module mux4_test;

// Put your code here
// ------------------

	logic d0, d1, d2, d3;
	logic [1:0] sel;
	logic z;

	mux4 mux4_inst (
		.d0(d0),
		.d1(d1),
		.d2(d2),
		.d3(d3),
		.sel(sel),
		.z(z)
	);

	initial begin
		d0 = 1'b0;
		d1 = 1'b1;
		d2 = 1'b1;
		d3 = 1'b1;
		sel = {1'b0, 1'b0};

		// Wait for the mux4 to stablize on an initial value
		#56

		// d0 0->1
		d0 = 1'b1;
		#56

		// d0 1->0
		d0 = 1'b0;
		#112

		// TODO: Write the rest of the test cases

		$stop;
	end

// End of your code

endmodule
