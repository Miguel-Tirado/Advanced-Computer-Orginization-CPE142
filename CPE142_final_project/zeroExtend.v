module zeroExtend(dataIn, dataOut);
	input [7:0] dataIn;
	output [15:0] dataOut;
	
	assign dataOut = {16'h0000, dataIn};

endmodule 
	
