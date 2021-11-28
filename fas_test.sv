// Full Adder/Subtractor test bench template
module fas_test;

// Put your code here
// ------------------

	logic a, b, cin, a_ns;
	logic s, cout;

	fas fas_inst(
		.s(s),
		.cout(cout),
		.a(a),
		.b(b),
		.cin(cin),
		.a_ns(a_ns)
	);

	initial begin
		a = 1'b0;
		b = 1'b0;
		cin = 1'b0;
		a_ns = 1'b0;

		// Wait for maximum Tpd in order for the system to stablize
		#50

		// b 0->1
		b = 1'b1;
		#100

		// TODO: Write the rest of the test cases

		$stop;
	end

// End of your code

endmodule
