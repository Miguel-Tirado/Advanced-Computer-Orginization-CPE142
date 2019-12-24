`include "cpu.v"
module cpu_fixture;
	reg clk,rst;
	
	initial
        $vcdpluson;
	
	
	initial begin
		  clk = 1'b0;
		 forever #10 clk = ~clk;
	end

	  
	initial  begin
		   #300 $finish;
	end  
endmodule 