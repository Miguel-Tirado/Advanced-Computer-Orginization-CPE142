`include "zeroExtend.v"

module ZeroExtend_fixture;
	reg [7:0] dataIn;
	wire [15:0] dataOut;
	
	initial
            $vcdpluson;
    initial
            $monitor ($time, " data_in = %b, data_out = %b", dataIn, dataOut);
			
	zeroExtend u1 (.dataIn(dataIn), .dataOut(dataOut)); 
	
	initial begin
		dataIn = 8'b10000000;
		#20 dataIn = 8'h0f;
		#20 dataIn = 8'hff;
	end
	
	initial begin 
		#200 $finish;
	end 
endmodule 
