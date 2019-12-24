module comparator(readData1, R15, branch, branchCode);
	input [15:0] readData1;
	input [15:0] R15;
	input [1:0] branchCode;
	
	output reg branch;
	
	always @(*) begin 
		if(branchCode == 2'b10) begin 
			if(readData1 < R15) begin 
				branch = 1;
			end 
		end 
		
		else if(branchCode == 2'b01) begin 
			 if (readData1 > R15)  begin 
				branch = 1;
			 end 
		end 
		
		else if(branchCode == 2'b00) begin 
			if (readData1 == R15) begin
				branch = 1;
			end 
		end 
		
		else begin 
				branch = 0; 
		end 
	end 
	
endmodule 