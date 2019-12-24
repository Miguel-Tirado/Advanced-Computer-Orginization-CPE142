module mux_4to1(out, A, B, C, D, sel); //D is ground/Dead wire

	output [15:0] Y;
	input [15:0] A, B, C, D;
	input [1:0] sel;
	reg [15:0] out;

	 always @(*)
	 case ( sel )
		 2'b00: out = A;
		 2'b01: out = B;
		 2'b10: out = C;
		 2'b11: out = D; //DEAD WIRE
	     default: Y = 16'hxxxx;
	 endcase

endmodule
