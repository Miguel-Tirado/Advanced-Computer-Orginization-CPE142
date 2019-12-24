`include "IFID_Buffer.v" 

module IFID_Buffer_fixture;

	reg [15:0] pcAddIn, instIn;
	reg clk, flush, IFID_enable;
	wire [15:0] pcAddOut, instOut;
	
	initial
            $vcdpluson;
    initial
            $monitor ($time, " clk = %b, flush = %b, IFID_enable = %b, pcAddIn = %b, instIn = %b\n pcAddOut = %b, instOut = %b ",clk, flush, IFID_enable, pcAddIn, instIn, pcAddOut, instOut);
	
	IFID_Buffer u1(.clk(clk), .flush(flush), .IFID_enable(IFID_enable), .pcAddIn(pcAddIn), .instIn(instIn), .pcAddOut(pcAddOut), .instOut(instOut));
	
	initial begin 
		flush = 1'b0; IFID_enable = 1'b0; instIn = 16'h0000; pcAddIn = 16'h0000;
		#10 flush = 1'b1; IFID_enable = 1'b1; instIn = 16'h0001; pcAddIn = 16'h0002;
		#10 flush = 1'b1; IFID_enable = 1'b1; instIn = 16'h0002; pcAddIn = 16'h0004;
		#10 flush = 1'b1; IFID_enable = 1'b1; instIn = 16'h0003; pcAddIn = 16'h0006;
		#10 flush = 1'b1; IFID_enable = 1'b1; instIn = 16'h0001; pcAddIn = 16'h0008;
	end 
	
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end 
	
	initial begin 
		#200 $finish;
	end 
	
endmodule