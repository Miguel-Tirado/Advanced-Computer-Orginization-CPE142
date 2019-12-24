`include "instructionMemory.v"

module instructionMemory_fixture;
	reg clk, rst;
	reg [15:0] dataIn;
	wire [15:0] dataOut;
	
	initial
            $vcdpluson;
    initial
            $monitor ($time, " addrIn = %h, clk = %b, rst = %b, instOut = %h", dataIn, clk, rst, dataOut);
	
	instructionMemory u1(.dataIn(dataIn), .dataOut(dataOut), .clk(clk), .rst(rst));
	
	initial begin 
		rst = 0; dataIn = 16'h0000;
		#10 rst = 1; 
		#10 rst = 1; dataIn = 16'h0000;
		#10 rst = 1; dataIn = 16'h0002;
		#10 rst = 1; dataIn = 16'h0004;
		#10 rst = 1; dataIn = 16'h0006;
		#10 rst = 1; dataIn = 16'h0008;
		#10 rst = 1; dataIn = 16'h000A;
		#10 rst = 1; dataIn = 16'h000C;
		#10 rst = 1; dataIn = 16'h000E;
		#10 rst = 1; dataIn = 16'h0010; //16
		#10 rst = 1; dataIn = 16'h0012; 
		#10 rst = 1; dataIn = 16'h0014;
		#10 rst = 1; dataIn = 16'h0016;
		#10 rst = 1; dataIn = 16'h0018;
		#10 rst = 1; dataIn = 16'h001A;
		#10 rst = 1; dataIn = 16'h001C;
		#10 rst = 1; dataIn = 16'h001E;
		#10 rst = 1; dataIn = 16'h0020;
		#10 rst = 1; dataIn = 16'h0022;
		#10 rst = 1; dataIn = 16'h0024;
		#10 rst = 1; dataIn = 16'h0026;
		#10 rst = 1; dataIn = 16'h0028;
		#10 rst = 1; dataIn = 16'h002A;
		#10 rst = 1; dataIn = 16'h002C;
		#10 rst = 1; dataIn = 16'h002E;
		#10 rst = 1; dataIn = 16'h0030;
		#10 rst = 1; dataIn = 16'h0032;
		#10 rst = 1; dataIn = 16'h0034;
		#10 rst = 1; dataIn = 16'h0036;
		#10 rst = 1; dataIn = 16'h0038;
		#10 rst = 1; dataIn = 16'h003A;
		#10 rst = 1; dataIn = 16'h003C;
		
	end 
	
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end 
	
	initial begin 
		#350 $finish;
	end 
	
			
endmodule