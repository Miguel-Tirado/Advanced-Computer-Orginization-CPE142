module ctrlmux (a,b,sel,out); 
	input [17:0] a,b;
	input sel;
	output reg [17:0] out;
	
	always @(*) begin 
		case(sel)
			1'b0: out = a; //0
			1'b1: out = b; //1
		endcase
	end 
endmodule