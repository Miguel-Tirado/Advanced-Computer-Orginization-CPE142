module IFID_Buffer (clk,rst,flush, IFID_enable, pcAddIn, pcAddOut, instIn, instOut);

	input clk, flush, IFID_enable,rst;
	input [15:0] pcAddIn, instIn;
	output reg [15:0] pcAddOut, instOut;
	// Is flush are rst or do we need to add rst as well? 
	always @(posedge clk, negedge flush) begin 
		if((~flush) || (~rst)) begin 
			pcAddOut <= 0;
			instOut <= 0;
		end 
		else if (IFID_enable) begin
			pcAddOut <= pcAddIn;
			instOut <= instIn;
		end 
	end 
	
endmodule 