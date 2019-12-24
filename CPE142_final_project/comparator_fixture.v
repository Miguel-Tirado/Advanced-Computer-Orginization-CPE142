`include "comparator.v"

module comparator_fixture;
	reg [15:0] readData1, R15;
	
	wire [1:0] branch; 
	
	initial
		$vcdpluson;
    initial
		$monitor ($time, " readData1 = %h, R15 = %h, branch = %b",readData1, R15, branch);
		
	comparator u1(.readData1(readData1), .R15(R15), .branch(branch));
	
	initial begin 
		#10 readData1 = 16'h0002; R15 =16'h0002;
		#10 readData1 = 16'h0003; R15 =16'h0001; 
		#10 readData1 = 16'h0001; R15 =16'h0003; 
	end 
	initial begin
		#100 $finish;
	end 
endmodule 