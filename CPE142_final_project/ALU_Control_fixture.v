`include "ALU_Control.v"

module ALU_Control_fixture;
	reg [1:0] ALUop;
	reg [3:0] funct;
	wire [2:0] ctrl;
	
	initial 
		$vcdpluson;
	initial 
		$monitor($time, " ALUop =%b, funct = %b, Ctrl = %b",ALUop,funct,ctrl);
		
	ALU_Control u1(.ALUop(ALUop), .funct(funct), .ctrl(ctrl));
	
	initial begin 
		ALUop = 2'b00; funct = 4'b0000; 
		#10 ALUop = 2'b01; funct = 4'b0001; 
		#10 ALUop = 2'b10; funct = 4'b0001; 
		#10 ALUop = 2'b11; funct = 4'b0001; 
		

	end 
	
	initial begin
		#100 $finish;
	end 
endmodule 