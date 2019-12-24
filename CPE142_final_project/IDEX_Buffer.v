module IDEX_Buffer(clk,rst, regWrite, R15Write, ALUop, ALUsrc1,ALUsrc2,extSrc,memRead,memWrite,sByte,MemtoReg,loadByte, op1_IN,op2_in, op1_FWD_IN, op2_FWD_IN, sgn_EXT_IN, ZRO_EXT_IN, regDes_IN,op1_OUT,op2_OUT, op1_FWD_OUT, op2_FWD_OUT, sgn_EXT_OUT, ZRO_EXT_OUT, regDes_OUT, regWriteOUT, R15WriteOUT, ALUopOUT, ALUsrc1OUT,ALUsrc2OUT,extSrcOUT,memReadOUT,memWriteOUT,sByteOUT,MemtoRegOUT,loadByteOUT);
	input clk,rst, regWrite, R15Write, ALUsrc1,ALUsrc2,extSrc,memRead,memWrite,sByte,MemtoReg,loadByte;
	input [1:0] ALUop;
	
	input [15:0] op1_IN,op2_in, sgn_EXT_IN, ZRO_EXT_IN;
	input [3:0] regDes_IN,op1_FWD_IN, op2_FWD_IN;
	
	output reg [15:0] op1_OUT, op2_OUT ,sgn_EXT_OUT, ZRO_EXT_OUT;
	output reg [3:0] regDes_OUT,op1_FWD_OUT, op2_FWD_OUT;
	output reg regWriteOUT, R15WriteOUT,ALUsrc1OUT,ALUsrc2OUT,extSrcOUT,memReadOUT,memWriteOUT,sByteOUT,MemtoRegOUT,loadByteOUT;
	output reg [1:0] ALUopOUT;
	
	
	always @(posedge clk, negedge rst) begin 
		if(~rst) begin 
			regWriteOUT <= 0;
			R15WriteOUT <= 0; 
			ALUsrc1OUT <= 0;
			ALUsrc2OUT <= 0; 
			extSrcOUT <= 0; 
			memReadOUT <= 0; 
			memWriteOUT <= 0;
			sByteOUT <= 0;
			MemtoRegOUT <= 0;
			loadByteOUT <= 0; 
			//flushOUT <= 0;
			
			op1_OUT <= 0; 
			op2_OUT <= 0; 
			op1_FWD_OUT <= 0; 
			op2_FWD_OUT <= 0; 
			sgn_EXT_OUT <= 0; 
			ZRO_EXT_OUT <= 0; 
			
			ALUopOUT <= 2'b00; 
			regDes_OUT <= 4'b0000; 
			
		end 
		else begin 
			regWriteOUT <= regWrite;
			R15WriteOUT <= R15Write; 
			ALUsrc1OUT <= ALUsrc1;
			ALUsrc2OUT <= ALUsrc2OUT; 
			extSrcOUT <= extSrc; 
			memReadOUT <= memRead; 
			memWriteOUT <= memWrite;
			sByteOUT <= sByte;
			MemtoRegOUT <= MemtoReg;
			loadByteOUT <= loadByte; 
			//flushOUT <= flush;
			
			op1_OUT <= op1_IN; 
			op2_OUT <= op2_in; 
			op1_FWD_OUT <= op1_FWD_IN; 
			op2_FWD_OUT <= op2_FWD_IN; 
			sgn_EXT_OUT <= sgn_EXT_IN; 
			ZRO_EXT_OUT <= ZRO_EXT_IN; 
			
			ALUopOUT <= ALUop; 
			regDes_OUT <= regDes_IN; 
		end 
	end 
endmodule 