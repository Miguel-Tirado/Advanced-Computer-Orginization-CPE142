`include "IF_tester.v"

module IF_tester_fixture;
	reg sel,pcWrite,flush,enable,clk,rst;
	reg [15:0] branchtoPC;
	wire [15:0] AdderOutBuffer,InstOutBuffer;
	
	initial 
		$vcdpluson;
	initial 
		$monitor ($time,"clk = %b,rst = %b, pcWrite = %b, flush = %b, enable = %b, sel = %b, branchtoPC = %h, AdderOutBuffer = %h, InstOutBuffer = %h",clk,rst,pcWrite,flush,enable,sel,branchtoPC,AdderOutBuffer,InstOutBuffer);
		
	IF_tester u1(.sel(sel),.pcWrite(pcWrite),.flush(flush),.enable(enable),.clk(clk),.rst(rst),.branchtoPC(branchtoPC),.AdderOutBuffer(AdderOutBuffer),.InstOutBuffer(InstOutBuffer));
	
	initial begin
		rst = 0; sel = 1; pcWrite = 0; flush = 0; enable = 1; branchtoPC = 16'h0000;
		@(posedge clk )
		rst = 1;flush = 1; sel = 0; pcWrite = 0; enable = 1; branchtoPC = 16'h0002;
		@(posedge clk )
		rst = 1;flush = 1; sel = 0; pcWrite = 1; enable = 1; branchtoPC = 16'h0002;
	end 
	
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end 
	
	initial begin 
		#100 $finish;
	end 
	
	
endmodule 	