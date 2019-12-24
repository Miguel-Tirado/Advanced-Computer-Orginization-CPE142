module control(opcode,ALUop,ALUsrc1,ALUsrc2,branch, memRead, memWrite, jump, regWrite, MemtoReg, loadByte, sByte, branchCode,flush,shift_Src,R15write,extSrc);
	input [3:0] opcode;
	//add R15write 
	//add extSrc
	//add shift_Src
	output reg branch,jump, memRead, memWrite, regWrite, MemtoReg, loadByte, ALUsrc1,ALUsrc2, sByte;
	output reg flush,shift_Src,R15write,extSrc;
	output reg [1:0] ALUop, branchCode;
	// ADD brnach code for comparator 
	// 18 bits total 
	always @(*) begin 
		case(opcode)
			4'b0000: begin  // For A type intructions 
						branch = 0;
						jump = 0; 
						flush = 1;
						shift_Src = 1'bx; 
						branchCode = 2'bxx;
						regWrite = 1; 
						R15write = 1;
						ALUop = 2'b00;
						ALUsrc1 = 0;
						ALUsrc2 = 0;
						extSrc = 1'bx;
						memRead = 0;
						memWrite = 0;
						sByte = 0;
						MemtoReg = 0;
						loadByte = 0;
					  end 
			4'b0001: begin  // C type AND immediate 
						branch = 0;
						jump = 0; 
						flush = 1;
						shift_Src = 1'bx; 
						branchCode = 2'bxx;
						regWrite = 1; 
						R15write = 0;
						ALUop = 2'b01;
						ALUsrc1 = 1;
						ALUsrc2 = 1;
						extSrc = 1'b1;
						memRead = 0;
						memWrite = 0;
						sByte = 0;
						MemtoReg = 0;
						loadByte = 0;
					 end 
			4'b0010: begin // C type  OR immediate
						branch = 0;
						jump = 0; 
						flush = 1;
						shift_Src = 1'bx; 
						branchCode = 2'bxx;
						regWrite = 1; 
						R15write = 0;
						ALUop = 2'b10;
						ALUsrc1 = 1;
						ALUsrc2 = 1;
						extSrc = 1'b1;
						memRead = 0;
						memWrite = 0;
						sByte = 0;
						MemtoReg = 0;
						loadByte = 0;
					 end 
			4'b1010: begin   // B type lbu load byte unit 
						branch = 0;
						jump = 0; 
						flush = 1;
						shift_Src = 1'bx; 
						branchCode = 2'bxx;
						regWrite = 1; 
						R15write = 0;
						ALUop = 2'b11;
						ALUsrc1 = 1;
						ALUsrc2 = 0;
						extSrc = 1'b0;
						memRead = 1;
						memWrite = 0;
						sByte = 0;
						MemtoReg = 1;
						loadByte = 1;
					 end 
			4'b1011: begin // B type sb store byte 
						branch = 0;
						jump = 0; 
						flush = 1;
						shift_Src = 1'bx; 
						branchCode = 2'bxx;
						regWrite = 0; 
						R15write = 0;
						ALUop = 2'b11;
						ALUsrc1 = 1;
						ALUsrc2 = 0;
						extSrc = 1'b0;
						memRead = 0;
						memWrite = 1;
						sByte = 1;
						MemtoReg = 1'bx;
						loadByte = 0;
					 end 
			4'b1100: begin // B type load word 
						branch = 0;
						jump = 0; 
						flush = 1;
						shift_Src = 1'bx; 
						branchCode = 2'bxx;
						regWrite = 1; 
						R15write = 0;
						ALUop = 2'b11;
						ALUsrc1 = 1;
						ALUsrc2 = 0;
						extSrc = 1'b0;
						memRead = 1;
						memWrite = 0;
						sByte = 0;
						MemtoReg = 1;
						loadByte = 0;
					 end 
			4'b1101: begin // B type store word 
						branch = 0;
						jump = 0; 
						flush = 1;
						shift_Src = 1'bx; 
						branchCode = 2'bxx;
						regWrite = 0; 
						R15write = 0;
						ALUop = 2'b11;
						ALUsrc1 = 1;
						ALUsrc2 = 0;
						extSrc = 1'b0;
						memRead = 0;
						memWrite = 1;
						sByte = 0;
						MemtoReg = 1'bx;
						loadByte = 0;
					 end 
			4'b0101: begin   //C type BLT branch less than 
						branch = 1;
						jump = 0; 
						flush = 1;
						shift_Src = 1'b0; 
						branchCode = 2'b10;
						regWrite = 0; 
						R15write = 0;
						ALUop = 2'b00;
						ALUsrc1 = 1;
						ALUsrc2 = 0;
						extSrc = 1'b0;
						memRead = 1;
						memWrite = 0;
						sByte = 0;
						MemtoReg = 1'bx;
						loadByte = 0;
					 end 
			4'b0100: begin   // C type BGT branch greather than 
 						branch = 1;
						jump = 0; 
						flush = 1;
						shift_Src = 1'b0; 
						branchCode = 2'b01;
						regWrite = 0; 
						R15write = 0;
						ALUop = 2'b00;
						ALUsrc1 = 1;
						ALUsrc2 = 0;
						extSrc = 1'b0;
						memRead = 1;
						memWrite = 0;
						sByte = 0;
						MemtoReg = 1'bx;
						loadByte = 0;
					 end 
			4'b0110: begin    // C type BEQ branch equal to 
						branch = 1;
						jump = 0; 
						flush = 1;
						shift_Src = 1'b0; 
						branchCode = 2'b00;
						regWrite = 0; 
						R15write = 0;
						ALUop = 2'b00;
						ALUsrc1 = 1;
						ALUsrc2 = 0;
						extSrc = 1'b0;
						memRead = 1;
						memWrite = 0;
						sByte = 0;
						MemtoReg = 1'bx;
						loadByte = 0;
					 end 
			4'b0111: begin    // D type jump instruction 
						branch = 0;
						jump = 1; 
						flush = 1;
						shift_Src = 1'b1; 
						branchCode = 2'bxx;
						regWrite = 0; 
						R15write = 0;
						ALUop = 2'b00;
						ALUsrc1 = 0;
						ALUsrc2 = 0;
						extSrc = 1'b0;
						memRead = 1;
						memWrite = 0;
						sByte = 0;
						MemtoReg = 1'bx;
						loadByte = 0;
					 end 
			4'b1111: begin   //D type Halt instruction 
						branch = 0;
						jump = 0; 
						flush = 1;
						shift_Src = 1'bx; 
						branchCode = 2'bxx;
						regWrite = 0; 
						R15write = 0;
						ALUop = 2'bxx;
						ALUsrc1 = 0;
						ALUsrc2 = 0;
						extSrc = 1'bx;
						memRead = 0;
						memWrite = 0;
						sByte = 0;
						MemtoReg = 1'bx;
						loadByte = 0;
					 end 
		endcase 
	end 
endmodule