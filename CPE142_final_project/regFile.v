module regFile(clk, rst, read_op1, read_op2, regWrite, wrData, wrR15_Data, op1_Out, op2_Out, R15_Out,R15write);
	input clk,rst,regWrite,R15write;
	input [15:0] wrData, wrR15_Data;
	input [3:0] read_op1, read_op2;
	
	output reg [15:0] op1_Out, op2_Out, R15_Out;
	reg [15:0] regfile[1:15];
	
	always @(*) begin 
		op1_Out = regfile[read_op1];
		op2_Out = regfile[read_op2];
		R15_Out = regfile[15]; 
	end 
	
	always @(posedge clk, negedge rst) begin 
		if(~rst) begin 
			regfile[1] <= 16'h7B18;
			regfile[2] <= 16'h245B;
			regfile[3] <= 16'hFF0F;
			regfile[4] <= 16'hF0FF;
			regfile[5] <= 16'h0051;
			regfile[6] <= 16'h6666;
			regfile[7] <= 16'h00FF;
			regfile[8] <= 16'hFF88;
			regfile[9] <= 16'h0000;
			regfile[10] <= 16'h0000;
			regfile[11] <= 16'h3099;
			regfile[12] <= 16'hCCCC;
			regfile[13] <= 16'h0002;
			regfile[14] <= 16'h0011;
			regfile[15] <= 16'h0000;
		end  
		else begin 
			if (regWrite) begin
				regfile[read_op1] <= wrData;
			end 
			if (R15write) begin 
				regfile[15] <= wrR15_Data;
			end 
		end 
	end 
endmodule 