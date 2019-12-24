module ALU (a,b,ctrl,res,R15);
	input signed [15:0] a,b;
	input [3:0] ctrl;
	output reg signed [15:0] res;
	output reg signed [15:0] R15;
	
	always@(*)begin
		case(ctrl) 
			3'b000: begin
						res = a + b;
					end 
			3'b001: begin 
						res = a - b;
					end 
			3'b010: begin
						{R15,res} = a * b;
					end 
			3'b011: begin 
						res = a / b;
						R15 = a % b;
					end 
			3'b100: begin 
						res = a & b;
					end 
			3'b101: begin 
						res = a | b;
					end 
		endcase 
		
	end
	
endmodule