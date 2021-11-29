// 64-bit ALU test bench template
module alu64bit_test;

// Put your code here
// ------------------

	logic [63:0] a;
	logic [63:0] b;
	logic cin;
	logic [1:0] op;
	logic [63:0] s;
	logic cout;

	alu64bit alu64bit_inst (
		.a(a), .b(b), .cin(cin), .op(op), .s(s), .cout(cout)
	);

	initial begin
		a = {64{1'b1}};
		b = {64{1'b0}};
		cin = 1'b0;
		op = {1'b1, 1'b0};

		#3500
		cin = 1'b1;

		#3500
		$stop;
	end

// End of your code

endmodule
