`include "ALU.v"

module ALU_fixture; 
	reg [15:0] a,b;
	reg [3:0] ctrl;
	
	wire [15:0] res,R15;
	
	initial
		$vcdpluson;
    initial
		$monitor ($time, " a = %h, b = %h, ctrl = %b, res = %h, R15 = %h ",a,b,ctrl,res,R15);
	
	ALU u1(.a(a),.b(b),.ctrl(ctrl),.res(res),.R15(R15));
	
	initial begin 
		a = 16'h0000; b = 16'h0001; ctrl = 3'b000;
		#10
		a = 16'h0002; b = 16'h0001; ctrl = 3'b001;
		#10
		a = 16'h0000; b = 16'h0001; ctrl = 3'b010;	
		#10
		a = 16'h0004; b = 16'h0002; ctrl = 3'b011;	
		#10
		a = 16'h0004; b = 16'h0003; ctrl = 3'b011;	
	end 
	
	initial begin
		#200 $finish;
	end 
	
endmodule 