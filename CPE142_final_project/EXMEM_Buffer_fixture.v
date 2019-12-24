`include "EXMEM_Buffer.v"

module EXMEM_Buffer_fixture;
	reg clk,rst,regWrite,R15Write,memWrite,memRead,sByte,MemtoReg,loadByte;
	reg [15:0] res_IN,R15_IN,op1_dataIN;
	reg [3:0] regDes_IN;
	
	wire regWriteOUT,R15WriteOUT,memWriteOUT,memReadOUT,sByteOUT,MemtoRegOUT,loadByteOUT;
	wire [15:0] res_OUT,R15_OUT,op1_dataOUT;
	wire [3:0] regDes_OUT;
	
	initial 
		$vcdpluson;
	initial 
		$monitor ($time," clk = %b, rst = %b, regWrite = %b, R15Write = %b, memWrite = %b, memRead = %b, sByte = %b, MemtoReg = %b, loadByte = %b, res_IN = %h, R15_IN = %h, op1_dataIN = %h, regDes_IN = %b, regWriteOUT = %b, R15WriteOUT = %b, memWriteOUT = %b, memReadOUT = %b, sByteOUT = %b,MemtoRegOUT = %b, loadByteOUT = %b, res_OUT = %h, R15_OUT = %h, op1_dataOUT = %h,regDes_OUT = %b",
				  clk,rst,regWrite,R15Write,memWrite,memRead,sByte,MemtoReg,loadByte,res_IN,R15_IN,op1_dataIN,regDes_IN,regWriteOUT,R15WriteOUT,memWriteOUT,memReadOUT,sByteOUT,MemtoRegOUT,loadByteOUT,res_OUT,R15_OUT,op1_dataOUT,regDes_OUT); 
	
	EXMEM_Buffer u1(.clk(clk),.rst(rst),.regWrite(regWrite),.R15Write(R15Write),.memWrite(memWrite),.memRead(memRead),.sByte(sByte),.MemtoReg(MemtoReg),.loadByte(loadByte),.res_IN(res_IN),.R15_IN(R15_IN),.op1_dataIN(op1_dataIN),.regDes_IN(regDes_IN),.regWriteOUT(regWriteOUT),.R15WriteOUT(R15WriteOUT),.memWriteOUT(memWriteOUT),.memReadOUT(memReadOUT),.sByteOUT(sByteOUT),.MemtoRegOUT(MemtoRegOUT),.loadByteOUT(loadByteOUT),.res_OUT(res_OUT),.R15_OUT(R15_OUT),.op1_dataOUT(op1_dataOUT),.regDes_OUT(regDes_OUT));
	
	initial begin 
		rst = 0; regWrite = 0; R15Write = 0; memWrite = 0; memRead = 0; sByte = 0; MemtoReg = 0; loadByte = 0; 
		res_IN = 16'h0000; R15_IN = 16'h0000; op1_dataIN = 16'h0000;regDes_IN = 4'b0000;R15_IN = 16'h0000; 
		@(posedge clk)
		rst = 1; regWrite = 1; R15Write = 1; memWrite = 1; memRead = 1; sByte = 1; MemtoReg = 1; loadByte = 1; 
		res_IN = 16'h0010; R15_IN = 16'h0010; op1_dataIN = 16'h0010;regDes_IN = 4'b0010;R15_IN = 16'h0010; 
		@(posedge clk)
		rst = 0; regWrite = 1; R15Write = 1; memWrite = 1; memRead = 1; sByte = 1; MemtoReg = 1; loadByte = 1; 
		res_IN = 16'h0010; R15_IN = 16'h0010; op1_dataIN = 16'h0010;regDes_IN = 4'b0010;R15_IN = 16'h0010; 
	end 
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end 
	
	initial begin 
		#40 $finish;
	end 
endmodule 