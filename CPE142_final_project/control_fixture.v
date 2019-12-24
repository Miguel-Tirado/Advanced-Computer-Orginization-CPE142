`include "control.v" 

module control_fixture;
	reg [3:0] opcode;
	//reg branch_enable;
	wire branch,jump, memRead, memWrite, regWrite, MemtoReg, loadByte, ALUsrc1,ALUsrc2,sByte;
	wire [1:0] ALUop,branchCode;
	
	initial 
		$vcdpluson;
	initial
		$monitor($time," opcode = %b => branch = %b, jump = %b, memRead = %b, memWrite = %b, regWrite = %b, MemtoReg = %b,\n                                      ALUop = %b, ALUsrc1 = %b, ALUsrc2=%b,loadByte = %b, sByte = %b, branchCode = %b", opcode, branch, jump, memRead, memWrite, regWrite, MemtoReg, ALUop, ALUsrc1, ALUsrc2, loadByte,sByte, branchCode);
	
	control u1(.branch(branch), .jump(jump), .opcode(opcode), .memRead(memRead), .memWrite(memWrite), .regWrite(regWrite), .MemtoReg(MemtoReg), .ALUop(ALUop), .ALUsrc1(ALUsrc1), .ALUsrc2(ALUsrc2), .loadByte(loadByte), .sByte(sByte),.branchCode(branchCode));  //.branch_enable(branch_enable)
	
	initial begin 
		opcode = 4'b0000;
	end 
	
	initial begin
		opcode = 4'b0000;   // A type
		#10 opcode = 4'b0001; // C type AND immediate 
		#10 opcode = 4'b0010; // C type  OR immediate
		#10 opcode = 4'b1010; // B type lbu load byte unit 
		#10 opcode = 4'b1011; // B type sb store byte 
		#10 opcode = 4'b1100; // B type load word
		#10 opcode = 4'b1101; // B type store word 
		#10 opcode = 4'b0101; // C type BLT branch less than
		#10 opcode = 4'b0100; // C type BGT branch greather than
		#10 opcode = 4'b0110; // C type BEQ branch equal to 
		#10 opcode = 4'b0111; // D type jump instruction 
		#10 opcode = 4'b1111; // D type Halt instruction 
	end 
	
	initial begin 
		#140 $finish;
	end 
endmodule