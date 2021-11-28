// NOT FOR SUBMITTING - TESTING ONLY
// 1-bit ALU test bench template
module alu1bit_test;

	logic a, b, cin;
	logic [1:0] op;
	logic s, cout;

	alu1bit alu_inst (
		.s(s),
		.cout(cout),
		.a(a),
		.b(b),
		.cin(cin),
		.op(op)
	);

	initial begin
		a = 1'b0;
		b = 1'b0;
		cin = 1'b0;
		op = {1'b0, 1'b0};

		#100
		a = 1'b1;

		#100
		$stop;
	end

endmodule
