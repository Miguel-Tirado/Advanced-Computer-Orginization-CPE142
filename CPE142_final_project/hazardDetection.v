module hazardDetection (ID_EX_memRead, IF_ID_op1, IF_ID_op2, ID_EX_op2, PCwrite, IF_ID_write, ctrlMux);
	input [3:0] IF_ID_op1, IF_ID_op2, ID_EX_op2;
	input ID_EX_memRead;
	output reg PCwrite,IF_ID_write,ctrlMux;
	
	always @(*) begin 
		if((ID_EX_memRead) && ((ID_EX_op2 == IF_ID_op1)||(ID_EX_op2 == IF_ID_op2))) begin 
			//Halt 
			PCwrite = 0;     // no program counter write 
			IF_ID_write = 0; // no passing data through buffer 
			ctrlMux = 1;     // enable mux to pass zero for ctl 
		end 
		else begin 
			//no Halt 
			PCwrite = 1; 
			IF_ID_write = 1; 
			ctrlMux = 0; 
		end 
	end 
	
endmodule 