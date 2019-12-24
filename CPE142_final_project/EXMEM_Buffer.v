module EXMEM_Buffer(clk,rst,regWrite,R15Write,memWrite,memRead,sByte,MemtoReg,loadByte,res_IN,R15_IN,op1_dataIN,regDes_IN,regWriteOUT,R15WriteOUT,memWriteOUT,memReadOUT,sByteOUT,MemtoRegOUT,loadByteOUT,res_OUT,R15_OUT,op1_dataOUT,regDes_OUT);

	input clk,rst,regWrite,R15Write,memWrite,memRead,sByte,MemtoReg,loadByte;
	input [15:0] res_IN,R15_IN,op1_dataIN;
	input [3:0] regDes_IN;
	
	output reg regWriteOUT,R15WriteOUT,memWriteOUT,memReadOUT,sByteOUT,MemtoRegOUT,loadByteOUT;
	output reg [15:0] res_OUT,R15_OUT,op1_dataOUT;
	output reg [3:0] regDes_OUT;
	
	always @(posedge clk,negedge rst) begin 
		if(~rst) begin 
			regWriteOUT <= 0;
			R15WriteOUT <= 0;
			memWriteOUT <= 0;
			memReadOUT <= 0; 
			sByteOUT <= 0; 
			MemtoRegOUT <= 0; 
			loadByteOUT <= 0;
			
			res_OUT <= 16'h0000;
			R15_OUT<= 16'h0000;
			op1_dataOUT <= 16'h0000;
			regDes_OUT <=  4'b0000;
		end 
		else begin 
			regWriteOUT <= regWrite;
			R15WriteOUT <= R15Write;
			memWriteOUT <= memWrite;
			memReadOUT <= memRead; 
			sByteOUT <= sByte; 
			MemtoRegOUT <= MemtoReg; 
			loadByteOUT <= loadByte;
			
			res_OUT <= res_IN;
			R15_OUT <= R15_IN;
			op1_dataOUT <= op1_dataIN;
			regDes_OUT <=  regDes_IN;
		end 
		
	end 
	
	
endmodule 