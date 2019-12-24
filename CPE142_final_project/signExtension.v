module signExtension #(parameter N = 4) (dataIn, dataOut);
	input [N-1:0] dataIn;
	output [15:0] dataOut;
	
	assign dataOut = {{16{dataIn[N-1]}}, dataIn};
		
endmodule 
