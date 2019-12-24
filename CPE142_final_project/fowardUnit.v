module fowardUnit( FowardA, FowardB,EX_MEM_regWrite, MEM_WB_regWrite, ID_EX_op1, ID_EX_op2, EX_MEM_op1, EX_MEM_op2,MEM_WB_op1, MEM_WB_op2 );
	input EX_MEM_regWrite, MEM_WB_regWrite; // These are the control signals 
	input [3:0] ID_EX_op1,ID_EX_op2, EX_MEM_op1, EX_MEM_op2, MEM_WB_op1, MEM_WB_op2; // values 
	
	output reg [1:0] FowardA, FowardB;
	
	always @(*) begin // FowardA
		if((EX_MEM_regWrite) && (EX_MEM_op1 != 0) && (EX_MEM_op1 == ID_EX_op1)) begin 
			FowardA = 2'b10;
		end 
		else if ((MEM_WB_regWrite) && (MEM_WB_op1 != 0) && (MEM_WB_op1 == ID_EX_op1)) begin 
			FowardA = 2'b01; 
		end 
		else begin 
			FowardA = 2'b00;
		end 
	end 
	
	always @(*) begin  // FowardB
		if((EX_MEM_regWrite) && (EX_MEM_op1 != 0) && (EX_MEM_op1 == ID_EX_op2)) begin 
			FowardB = 2'b10;
		end 
		else if ((MEM_WB_regWrite) && (MEM_WB_op1 != 0) && (MEM_WB_op1 == ID_EX_op2)) begin 
			FowardB = 2'b01;
		end 
		else begin 
			FowardB = 2'b00; 
		end 
	end 
endmodule 