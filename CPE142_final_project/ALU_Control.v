module ALU_Control(ALUop,funct,ctrl);
	input [1:0] ALUop;
	input [3:0] funct;
	output reg [2:0] ctrl;
	
	always @(*) begin 
		case(ALUop) 
			2'b00: begin 
						case(funct) 
							4'b0000: ctrl[2:0] = 3'b000; // add 000
							4'b0001: ctrl[2:0] = 3'b001; // sub 001
							4'b0100: ctrl[2:0] = 3'b010; // mult 010
							4'b0101: ctrl[2:0] = 3'b011; // div 011 
						endcase
				   end 
			2'b01: ctrl[2:0] = 3'b100; // ANDi 
			2'b10: ctrl[2:0] = 3'b101; // ORi
			2'b11: ctrl[2:0] = 3'b000; //lw,lbu,sw,sbu 
		endcase 
	end 
endmodule 