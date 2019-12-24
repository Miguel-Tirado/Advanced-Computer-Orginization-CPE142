`include "adder.v"

module adder_fixture;
	reg [15:0] pcIn;
	wire [15:0] addOut;
	
	initial
		$vcdpluson;
        initial
		$monitor ($time, " pcIn = %d, result = %d",pcIn, addOut);
	adder u1 (.pcIn(pcIn), .addOut(addOut));
	initial begin
		#20 pcIn = 0;
		#20 pcIn = 2;
		#20 pcIn = 4; 
		#20 pcIn = 1; 
		#20 pcIn = 6;
		#20 pcIn = 300;
		#20 pcIn = 260;
	end

	initial begin
		#200 $finish;
	end 
endmodule 
