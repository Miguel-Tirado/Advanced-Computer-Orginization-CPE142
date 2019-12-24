module dataMemory(clk, rst, sByte, addr, wrData, dataOut, memWrite, memRead,memOut);
	input memWrite,memRead,sByte,clk,rst;
	input [15:0] addr, wrData;
	
	output reg [15:0] dataOut, memOut;
	//Note that memout was used to see if memory was being written too 
	// might have to remove this port when connecting everything in the end. 
	// ask for clarification?
	
	reg [7:0] mem [0:42];
	//test code 
	always @(*) begin 
		memOut = {mem[addr+1], mem[addr]}; 
	end
	// test code end
	
	always@(posedge clk, negedge rst)begin 
		if(~rst) begin 
			mem[0] <= 8'h42;
			mem[1] <= 8'h31;
			mem[2] <= 8'h00;
			mem[3] <= 8'h00;
			mem[4] <= 8'h78;
			mem[5] <= 8'h56;
			mem[6] <= 8'hAD;
			mem[7] <= 8'hDE;
			mem[8] <= 8'hEF;
			mem[9] <= 8'hBE;
		end 
		else if (memWrite) begin 
			if(sByte) begin 
				mem[addr] <= wrData[7:0];
			end 
			else begin 
				mem[addr] <= wrData[7:0];
				mem[addr+1] <= wrData[15:8];
			end 
		end 
	end 
	always@(*) begin 
		if (memRead) begin 
			dataOut = {mem[addr+1], mem[addr]};
		end 
	end 
endmodule 