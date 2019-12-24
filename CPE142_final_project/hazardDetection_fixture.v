`include "hazardDetection.v"

module hazardDetection_fixture;
	reg [3:0] IF_ID_op1, IF_ID_op2, ID_EX_op2;
	reg ID_EX_memRead;
	wire  PCwrite,IF_ID_write,ctrlMux;
	
	initial 
		$vcdpluson;
	initial
		$monitor($time," IF_ID_op1 = %b, IF_ID_op2 = %b, ID_EX_op2 = %b, PCwrite = %b, IF_ID_write = %b, ctrlMux = %b ",IF_ID_op1, IF_ID_op2, ID_EX_op2, PCwrite, IF_ID_write, ctrlMux);
		
	hazardDetection u1 (.IF_ID_op1(IF_ID_op1), .IF_ID_op2(IF_ID_op2), .ID_EX_op2(ID_EX_op2), .ID_EX_memRead(ID_EX_memRead), .PCwrite(PCwrite), .IF_ID_write(IF_ID_write), .ctrlMux(ctrlMux));
	
	
	initial begin 
		IF_ID_op1 = 4'b0000;
		IF_ID_op2 = 4'b0000;
		ID_EX_op2 = 4'b0000;
		ID_EX_memRead = 0;
		
		#10 
		IF_ID_op1 = 4'b0001;
		IF_ID_op2 = 4'b0001;
		ID_EX_op2 = 4'b0001;
		ID_EX_memRead = 1;
	end 
	
	initial begin 
		#80 $finish;
	end 
endmodule