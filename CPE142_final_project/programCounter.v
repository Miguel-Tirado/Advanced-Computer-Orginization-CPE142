module programCounter(PCout, PCin, rst, clk, PCwrite);

	input [15:0] PCin;
	input rst, clk,PCwrite;
	output reg [15:0] PCout;

	initial begin
	PCout <= 0;
	end

	always @(posedge clk, negedge rst) begin
		if(!rst)
			PCout <= 0; 
			//PCout <= PCout; 
		else begin
			if(PCwrite == 1) begin 
				PCout <= PCin;
			end 
				
		end 
	end

endmodule 
