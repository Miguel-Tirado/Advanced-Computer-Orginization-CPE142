`include "signExtension.v"

module signExtension_fixture;
	//reg [7:0] dataIn;
	reg [11:0] dataIn; 
	wire [15:0] dataOut;
	
	initial
            $vcdpluson;
    initial
            $monitor ($time, " data_in = %b, data_out = %b", dataIn, dataOut);
	
	signExtension #(.N(12)) u1 (.dataIn(dataIn), .dataOut(dataOut));
	
	initial begin 
	    	//dataIn = 8'b00000001;
		//#20 dataIn = 8'b00000010;
		//#20 dataIn = 8'b10000000;
		//#20 dataIn = 8'b11111111;
		dataIn = 3'h001;
		#20 dataIn = 3'h002;
		#20 dataIn = 12'b111111111111;
		#20 dataIn = 12'b100000000000;
	end 
	initial begin 
		#200 $finish;
	end 
endmodule 
