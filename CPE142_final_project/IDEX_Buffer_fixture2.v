`include "IDEX_Buffer.v"

module IDEX_Buffer_fixture;
	reg clk,rst, regWrite, R15Write, ALUsrc1,ALUsrc2,extSrc,memRead,memWrite,sByte,MemtoReg,loadByte;
	reg [1:0] ALUop;
	reg [15:0] op1_IN,op2_in, op1_FWD_IN, op2_FWD_IN, sgn_EXT_IN, ZRO_EXT_IN;
	reg [3:0] regDes_IN;
	
	wire [15:0] op1_OUT, op2_OUT, op1_FWD_OUT, op2_FWD_OUT,sgn_EXT_OUT, ZRO_EXT_OUT;
	wire [3:0] regDes_OUT;
	wire regWriteOUT, R15WriteOUT,ALUsrc1OUT,ALUsrc2OUT,extSrcOUT,memReadOUT,memWriteOUT,sByteOUT,MemtoRegOUT,loadByteOUT;
	wire [1:0] ALUopOUT;
	
	initial 
		$vcdpluson;
	initial 
		$monitor ($time," clk = %b,rst = %b,,regWrite = %b,R15Write = %b,ALUsrc1 = %b,ALUsrc2 = %b,extSrc = %b,memRead = %b,memWrite = %b,sByte = %b,MemtoReg = %b,loadByte = %b,ALUop = %b,op1_IN = %h,op2_in = %h,op1_FWD_IN = %h,op2_FWD_IN = %h,sgn_EXT_IN = %h,ZRO_EXT_IN = %h,regDes_IN = %b,op1_OUT = %h,op2_OUT = %h, op1_FWD_OUT = %h,op2_FWD_OUT %h,sgn_EXT_OUT = %h, ZRO_EXT_OUT =%h,regWriteOUT = %b,R15WriteOUT = %b,ALUopOUT = %b,ALUsrc1OUT = %b, ALUsrc2OUT = %b,extSrcOUT = %b,memReadOUT = %b, memWriteOUT = %b, sByteOUT = %b, MemtoRegOUT = %b,loadByteOUT %b, regDes_OUT = %b",
		clk,rst,regWrite,R15Write,ALUsrc1,ALUsrc2,extSrc,memRead,memWrite,sByte,MemtoReg,loadByte,ALUop,op1_IN,op2_in,op1_FWD_IN,op2_FWD_IN,sgn_EXT_IN,ZRO_EXT_IN,regDes_IN,op1_OUT,
		op2_OUT, op1_FWD_OUT,op2_FWD_OUT,sgn_EXT_OUT,ZRO_EXT_OUT,regWriteOUT,R15WriteOUT,ALUopOUT,ALUsrc1OUT,ALUsrc2OUT,extSrcOUT,memReadOUT,memWriteOUT,sByteOUT,MemtoRegOUT,loadByteOUT,regDes_OUT);
		
		//op1_OUT, op2_OUT, op1_FWD_OUT, op2_FWD_OUT,sgn_EXT_OUT, ZRO_EXT_OUT
		//flushOUT, regWriteOUT, R15WriteOUT, ALUopOUT,ALUsrc1OUT,ALUsrc2OUT,extSrcOUT,memReadOUT,memWriteOUT,sByteOUT,MemtoRegOUT,loadByteOUT;
		// op2_in is in lower case be carful 
	IDEX_Buffer u1(.clk(clk),.rst(rst),.regWrite(regWrite),.R15Write(R15Write),.ALUsrc1(ALUsrc1),.ALUsrc2(ALUsrc2),.extSrc(extSrc),.memRead(memRead),.memWrite(memWrite),.sByte(sByte),.MemtoReg(MemtoReg),.loadByte(loadByte),.ALUop(ALUop),.op1_IN(op1_IN),.op2_in(op2_in),
	.op1_FWD_IN(op1_FWD_IN),.op2_FWD_IN(op2_FWD_IN),.sgn_EXT_IN(sgn_EXT_IN),.ZRO_EXT_IN(ZRO_EXT_IN),.regDes_IN(regDes_IN),.op1_OUT(op1_OUT),.op2_OUT(op2_OUT),.op1_FWD_OUT(op1_FWD_OUT),.op2_FWD_OUT(op2_FWD_OUT),.sgn_EXT_OUT(sgn_EXT_OUT),.ZRO_EXT_OUT(ZRO_EXT_OUT),.regDes_OUT(regDes_OUT),
	.regWriteOUT(regWriteOUT),.R15WriteOUT(R15WriteOUT),.ALUopOUT(ALUopOUT),.ALUsrc1OUT(ALUsrc1OUT),.ALUsrc2OUT(ALUsrc2OUT),.extSrcOUT(extSrcOUT),.memReadOUT(memReadOUT),.memWriteOUT(memWriteOUT),.sByteOUT(sByteOUT),.MemtoRegOUT(MemtoRegOUT),.loadByteOUT(loadByteOUT));
	
	initial begin 
		rst = 0; regWrite = 0; R15Write = 0; ALUsrc1 = 0; ALUsrc2 = 0; extSrc = 0; memRead = 0; memWrite = 0; sByte = 0; MemtoReg = 0; loadByte = 0; ALUop = 2'b00; 
		op1_IN = 16'h0000; op2_in = 16'h0000; op2_FWD_IN = 16'h0000; op1_FWD_IN = 16'h0000; op2_FWD_IN = 16'h0000; sgn_EXT_IN = 16'h0000; ZRO_EXT_IN = 16'h0000; regDes_IN = 4'b0000; 
	end 
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end 
	
	initial begin 
		#100 $finish;
	end 
endmodule 
