`include "MEMWB_Buffer.v"

module MEMWB_Buffer_fixture;
	reg clk,rst,regWrite,R15Write,MemtoReg,loadByte;
	reg [15:0] readData_IN,res_IN, R15_in;
	reg [3:0] regDes_IN;
	
	wire regWriteOUT,R15WriteOUT,MemtoRegOUT,loadByteOUT;
	wire [15:0] readData_OUT, res_OUT,R15_OUT;
	wire [3:0] regDes_OUT;
	
	initial 
		$vcdpluson;
	initial 
		$monitor ($time," clk = %b,rst = %b,regWrite = %b,R15Write = %b,MemtoReg = %b,loadByte = %b,readData_IN = %h,res_IN = %h, R15_in = %h, regDes_IN = %b, regWriteOUT = %b,R15WriteOUT = %b,MemtoRegOUT = %b,loadByteOUT = %b,readData_OUT = %h, res_OUT = %h, R15_OUT = %h,regDes_OUT = %h",
				  clk,rst,regWrite,R15Write,MemtoReg,loadByte,readData_IN,res_IN, R15_in,regDes_IN,regWriteOUT,R15WriteOUT,MemtoRegOUT,loadByteOUT,readData_OUT, res_OUT,R15_OUT,regDes_OUT);
	
	MEMWB_Buffer u1(.clk(clk),.rst(rst),.regWrite(regWrite),.R15Write(R15Write),.MemtoReg(MemtoReg),.loadByte(loadByte),.readData_IN(readData_IN),.res_IN(res_IN), .R15_in(R15_in),.regDes_IN(regDes_IN),.regWriteOUT(regWriteOUT),.R15WriteOUT(R15WriteOUT),.MemtoRegOUT(MemtoRegOUT),.loadByteOUT(loadByteOUT),.readData_OUT(readData_OUT), .res_OUT(res_OUT),.R15_OUT(R15_OUT),.regDes_OUT(regDes_OUT));
	
	initial begin 
		rst = 0; regWrite = 0; R15Write = 0;  MemtoReg = 0; loadByte = 0; 
		res_IN = 16'h0000; R15_in = 16'h0000; readData_IN = 16'h0000;regDes_IN = 4'b0000;R15_in = 16'h0000; 
		@(posedge clk) 
		rst = 1; regWrite = 1; R15Write = 1;  MemtoReg = 1; loadByte = 1; 
		res_IN = 16'h0100; R15_in = 16'h0100; readData_IN = 16'h0100;regDes_IN = 4'b0100;R15_in = 16'h0100; 
		@(posedge clk) 
		rst = 0; regWrite = 1; R15Write = 1;  MemtoReg = 1; loadByte = 1; 
		res_IN = 16'h0100; R15_in = 16'h0100; readData_IN = 16'h0100;regDes_IN = 4'b0100;R15_in = 16'h0100; 

	end 
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end 
	
	initial begin 
		#40 $finish;
	end 
endmodule 