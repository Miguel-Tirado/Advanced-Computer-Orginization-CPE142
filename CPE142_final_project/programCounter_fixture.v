`include "programCounter.v"

module programCounter_fixture;

	reg [15:0] PCin;
	reg clk,rst,PCwrite;
	wire [15:0] PCout;

	initial 
	     $vcdpluson;
	initial 
	     $monitor($time, " PCin = %d, PCout = %d, clk = %b, rst = %b, PCwirte = %b",PCin,PCout,clk,rst,PCwrite);

	programCounter u1 (.PCin(PCin), .clk(clk), .rst(rst), .PCwrite(PCwrite), .PCout(PCout));

	initial begin
		rst = 1'b0;
		#10 rst = 1'b1;
		#20 PCwrite = 1; PCin = 2; 
		#20 PCwrite = 1; PCin = 4;
		#20 PCwrite = 1; PCin = 6;
		#20 PCwrite = 1; PCin = 3;
		#20 PCwrite = 1; PCin = 1;
		//#10 PCwrite = 0; PCin = 8;
		//#10 PCwrite = 0; PCin = 10;
		//#10 PCwrite = 1; PCin = 5;
		//#10 rst = 1'b0; 
	end 

	initial begin
		clk = 1'b0;
		forever #10 clk = ~clk; 
	end

	initial begin
		#300 $finish; 
	end
endmodule 
