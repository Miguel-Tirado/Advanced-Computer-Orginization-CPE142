`include "regFile.v"

module regFile_fixture; 
	reg [3:0] read_op1, read_op2;
	reg [15:0] wrData, wrR15_Data;
	
	reg clk, rst, regWrite,R15write;
	wire [15:0] op1_Out, op2_Out, R15_Out;
	
	initial
		$vcdpluson;
    initial
		$monitor ($time, " clk= %d,rst= %b,regWrite= %b,/read_op1= %b,read_op2= %b,/op1_Out=%h,op2_Out=%h,R15_Out=%h,/wrData=%h,wrR15_Data=%h, R15write = %b",clk,rst,regWrite,read_op1,read_op2,op1_Out,op2_Out,R15_Out,wrData,wrR15_Data,R15write);
		
	regFile u1(.clk(clk), .rst(rst), .regWrite(regWrite), .read_op1(read_op1), .read_op2(read_op2), .op1_Out(op1_Out), .op2_Out(op2_Out), .R15_Out(R15_Out), .wrData(wrData), .wrR15_Data(wrR15_Data), .R15write(R15write));
	
	initial begin 
		rst = 0;
		regWrite = 0;
		read_op1 = 0;
		read_op2 = 0;
	end 
	
	initial begin 
		#10 rst = 1; regWrite = 1'b0; read_op1 = 4'b0001; read_op2 = 4'b0010; wrData = 16'h1010; wrR15_Data= 16'h0001;R15write = 0;
		#10 rst = 1; regWrite = 1'b1; read_op1 = 4'b0001; read_op2 = 4'b0010; wrData = 16'h1010; wrR15_Data= 16'h0001; R15write = 1;
		#10 rst = 1; regWrite = 1'b1; read_op1 = 4'b0001; read_op2 = 4'b0011; wrData = 16'h1100; wrR15_Data= 16'h0008;R15write = 0;
	end 
	
	initial begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end 
	
	initial begin 
		#100 $finish;
	end 	
	
endmodule 