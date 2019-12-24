module MEMWB_Buffer(clk,rst,regWrite,R15Write,MemtoReg,loadByte,readData_IN,res_IN, R15_in, regDes_IN, regWriteOUT,R15WriteOUT,MemtoRegOUT,loadByteOUT,readData_OUT, res_OUT,R15_OUT,regDes_OUT);
	input clk,rst,regWrite,R15Write,MemtoReg,loadByte;
	input [15:0] readData_IN,res_IN, R15_in;
	input [3:0] regDes_IN;
	
	output reg  regWriteOUT,R15WriteOUT,MemtoRegOUT,loadByteOUT;
	output reg [15:0] readData_OUT, res_OUT,R15_OUT;
	output reg [3:0] regDes_OUT;
	
	always @(posedge clk,negedge rst) begin 
		if(~rst) begin 
			regWriteOUT <= 0;
			R15WriteOUT <= 0;
			MemtoRegOUT <= 0; 
			loadByteOUT <= 0;
			readData_OUT <= 16'h0000;
			res_OUT <= 16'h0000;
			R15_OUT <= 16'h0000;
			regDes_OUT <= 4'b0000;
			

		end 
		else begin 
			regWriteOUT <= regWrite;
			R15WriteOUT <= R15Write;
			MemtoRegOUT <= MemtoReg; 
			loadByteOUT <= loadByte;
			
			readData_OUT <= readData_IN;
			res_OUT <= res_IN;
			R15_OUT <= R15_in;
			regDes_OUT <= regDes_IN;

		end 
		
	end 
	
endmodule 