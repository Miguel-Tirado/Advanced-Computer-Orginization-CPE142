module mux2to1 (a,b,sel,out); 
	input [15:0] a,b;
	input sel;
	output reg [15:0] out;
	
	always @(*) begin 
		case(sel)
			1'b0: out = a; //0
			1'b1: out = b; //1
		endcase
	end 
endmodule