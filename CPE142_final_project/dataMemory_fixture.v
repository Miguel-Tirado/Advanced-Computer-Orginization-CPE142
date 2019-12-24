`include "dataMemory.v"

module dataMemory_fixture;
	reg memWrite,memRead,sByte,clk,rst;
	reg [15:0] addr, wrData;
	
	wire [15:0] dataOut, memOut;
	
	initial
            $vcdpluson;
    initial
            $monitor ($time, " clk = %b, rst = %b, memWrite = %b, memRead = %b, sByte = %b, addr = %h, wrData = %h, dataOut = %h, memOut = %h",clk, rst, memWrite, memRead, sByte, addr, wrData,dataOut, memOut);
	
	dataMemory u1(.clk(clk), .rst(rst), .memWrite(memWrite), .memRead(memRead), .sByte(sByte), .addr(addr), .wrData(wrData), .dataOut(dataOut), .memOut(memOut));
	
	initial begin 
		rst = 0; memRead = 0; memWrite = 0; sByte = 0; addr = 0; wrData = 4'h000F; 
		@(posedge clk) rst = 1; memRead = 1; memWrite = 0; sByte = 0; addr = 0; wrData = 16'h000F;
		@(posedge clk) rst = 1; memRead = 1; memWrite = 0; sByte = 0; addr = 2; wrData = 16'h000F;
		@(posedge clk) rst = 1; memRead = 1; memWrite = 0; sByte = 0; addr = 4; wrData = 16'h000F;
		@(posedge clk) rst = 1; memRead = 1; memWrite = 0; sByte = 0; addr = 6; wrData = 16'h000F;
		@(posedge clk) rst = 1; memRead = 1; memWrite = 0; sByte = 0; addr = 8; wrData = 16'h000F;
		@(posedge clk) rst = 1; memRead = 0; memWrite = 1; sByte = 0; addr = 0; wrData = 16'h0FFF;
		@(posedge clk) rst = 1; memRead = 0; memWrite = 1; sByte = 1; addr = 2; wrData = 8'hAA;
		@(posedge clk) rst = 1; memRead = 0; memWrite = 0; sByte = 1; addr = 2; wrData = 8'hAA;
		@(posedge clk) rst = 1; memRead = 0; memWrite = 1; sByte = 0; addr = 2; wrData = 16'h22AA;
	end 
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end 
	
	initial begin 
		#100 $finish;
	end 
	
endmodule 