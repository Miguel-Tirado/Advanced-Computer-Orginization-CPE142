`include "fowardUnit.v"

module fowardUnit_fixture;
	reg EX_MEM_regWrite, MEM_WB_regWrite;
	reg [3:0] ID_EX_op1,ID_EX_op2, EX_MEM_op1, EX_MEM_op2, MEM_WB_op1, MEM_WB_op2;
	
	wire [1:0] FowardA, FowardB;
	
	initial 
		$vcdpluson;
	initial
		$monitor($time," EX_MEM_regWrite = %b, MEM_WB_regWrite = %b, EX_MEM_op1 = %b; EX_MEM_op2 = %b,ID_EX_op1 = %b, ID_EX_op2 = %b, MEM_WB_op1 = %b, MEM_WB_op2 = %b, FowardA = %b, FowardB = %b",EX_MEM_regWrite,MEM_WB_regWrite,EX_MEM_op1,EX_MEM_op2,ID_EX_op1,ID_EX_op2,MEM_WB_op1,MEM_WB_op2,FowardA,FowardB);
		
	fowardUnit u1(.EX_MEM_regWrite(EX_MEM_regWrite), .MEM_WB_regWrite(MEM_WB_regWrite), .ID_EX_op1(ID_EX_op1), .ID_EX_op2(ID_EX_op2), .EX_MEM_op1(EX_MEM_op1), .EX_MEM_op2(EX_MEM_op2), .MEM_WB_op1(MEM_WB_op1), .MEM_WB_op2(MEM_WB_op2), .FowardA(FowardA), .FowardB(FowardB));
	
	initial begin 
		EX_MEM_regWrite = 1'b0; 
		MEM_WB_regWrite = 1'b0; 
		EX_MEM_op1 = 4'b0000;               // 4'h0; = 4'b0000; 
		EX_MEM_op2 = 4'b0000;
		ID_EX_op1 = 4'b0000;
		ID_EX_op2 = 4'b0000;
		MEM_WB_op1 = 4'b0000; 
		MEM_WB_op2 = 4'b0000; 
	end 
	initial begin  
		//-----------------FowardA = 2'b10-------------- 
		EX_MEM_regWrite = 1'b1;  MEM_WB_regWrite = 1'bx;
		EX_MEM_op1 = 4'b1001;    EX_MEM_op2 = 4'bxxxx;
		ID_EX_op1 = 4'b1001;     ID_EX_op2 = 4'bxxxx;  
		MEM_WB_op1 = 4'bxxxx;    MEM_WB_op2 = 4'bxxxx; 
		
		//-----------------FowardA = 2'b01-------------
		#10
		EX_MEM_regWrite = 1'bx;  MEM_WB_regWrite = 1'b1;
		EX_MEM_op1 = 4'bxxxx;    EX_MEM_op2 = 4'bxxxx;
		ID_EX_op1 = 4'b1010;     ID_EX_op2 = 4'bxxxx;  
		MEM_WB_op1 = 4'b1010;    MEM_WB_op2 = 4'bxxxx; 
		
		//----------------FowardA = 2'b00------------------
		#10 
		EX_MEM_regWrite = 1'b0;  MEM_WB_regWrite = 1'b0;
		EX_MEM_op1 = 4'b0000;    EX_MEM_op2 = 4'b0000;
		ID_EX_op1 = 4'b0000;     ID_EX_op2 = 4'b0000;  
		MEM_WB_op1 = 4'b0000;    MEM_WB_op2 = 4'b0000; 
		
		//-----------------FowardB = 2'b10-------------- 
		#10
		EX_MEM_regWrite = 1'b1;  MEM_WB_regWrite = 1'bx;
		EX_MEM_op1 = 4'b1001;    EX_MEM_op2 = 4'bxxxx;
		ID_EX_op1 = 4'bxxxx;     ID_EX_op2 = 4'b1001;  
		MEM_WB_op1 = 4'bxxxx;    MEM_WB_op2 = 4'bxxxx; 
		
		//-----------------FowardB = 2'b01-------------
		#10
		EX_MEM_regWrite = 1'bx;  MEM_WB_regWrite = 1'b1;
		EX_MEM_op1 = 4'bxxxx;    EX_MEM_op2 = 4'bxxxx;
		ID_EX_op1 = 4'bxxxx;     ID_EX_op2 = 4'b1010;  
		MEM_WB_op1 = 4'b1010;    MEM_WB_op2 = 4'bxxxx; 
		
		//----------------FowardB = 2'b00------------------
		#10 
		EX_MEM_regWrite = 1'b0;  MEM_WB_regWrite = 1'b0;
		EX_MEM_op1 = 4'b0000;    EX_MEM_op2 = 4'b0000;
		ID_EX_op1 = 4'b0000;     ID_EX_op2 = 4'b0000;  
		MEM_WB_op1 = 4'b0000;    MEM_WB_op2 = 4'b0000; 
	end 
	initial begin 
		#80 $finish;
	end 
endmodule