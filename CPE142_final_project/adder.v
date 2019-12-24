module adder(pcIn, addOut);

	input [15:0] pcIn;
	output [15:0] addOut;

	assign addOut = pcIn + 2;
	
endmodule 
