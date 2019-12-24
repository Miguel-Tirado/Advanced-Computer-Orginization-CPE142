module instructionMemory(clk, rst, dataIn, dataOut);
	input clk,rst;
	input [15:0] dataIn;            //address input 
	output reg [15:0] dataOut;      //instruction output 
	
	reg [7:0] instruction [0:64];
	
	/*always @(*) begin
		dataOut = instruction[dataIn];
	end  */
	
	always @(posedge clk, negedge rst) begin 
		if(~rst) begin 
			instruction [0] <= 8'h20;
			instruction [1] <= 8'h0E;
			
			instruction [2] <= 8'h21;
			instruction [3] <= 8'h0B;
			
			instruction [4] <= 8'h88;
			instruction [5] <= 8'h23;
			
			instruction [6] <= 8'h9A;
			instruction [7] <= 8'h14;
			
			instruction [8] <= 8'h64;
			instruction [9] <= 8'h05;
			
			instruction [10] <= 8'h65;
			instruction [11] <= 8'h01;
			
			instruction [12] <= 8'h9A;
			instruction [13] <= 8'hD5;
			
			instruction [14] <= 8'h02;
			instruction [15] <= 8'h28;
			
			instruction [16] <= 8'h9A;
			instruction [17] <= 8'hCE;
			
			instruction [18] <= 8'hF1;
			instruction [19] <= 8'h0F;
			
			instruction [20] <= 8'h20;
			instruction [21] <= 8'h01;
			
			instruction [22] <= 8'h21;
			instruction [23] <= 8'h01;
			
			instruction [24] <= 8'h02;
			instruction [25] <= 8'h18;
			
			instruction [26] <= 8'h94;
			instruction [27] <= 8'hA6;
			
			instruction [28] <= 8'h96;
			instruction [29] <= 8'hB6;
			
			instruction [30] <= 8'h96;
			instruction [31] <= 8'hC6;
			
			instruction [32] <= 8'hD1;
			instruction [33] <= 8'h07;
			
			instruction [34] <= 8'h04;
			instruction [35] <= 8'h67;
			
			instruction [36] <= 8'h10;
			instruction [37] <= 8'h0B;
			
			instruction [38] <= 8'h05;
			instruction [39] <= 8'h57;
			
			instruction [40] <= 8'h20;
			instruction [41] <= 8'h0B;
			
			instruction [42] <= 8'h02;
			instruction [43] <= 8'h47;
			
			instruction [44] <= 8'h10;
			instruction [45] <= 8'h01;
			
			instruction [46] <= 8'h10;
			instruction [47] <= 8'h01;
			
			instruction [48] <= 8'h90;
			instruction [49] <= 8'hC8;
			
			instruction [50] <= 8'h80;
			instruction [51] <= 8'h08;
			
			instruction [52] <= 8'h92;
			instruction [53] <= 8'hD8;
			
			instruction [54] <= 8'h92;
			instruction [55] <= 8'hCA;
			
			instruction [56] <= 8'hC0;
			instruction [57] <= 8'h0C;
			
			instruction [58] <= 8'hD1;
			instruction [59] <= 8'h0D;
			
			instruction [60] <= 8'hD0;
			instruction [61] <= 8'h0C;
			
			instruction [62] <= 8'h00;  // HALT is here 
			instruction [63] <= 8'hF0;
			
			// How do i implement HALT instruction here? 		
		end 
	end 
	always @(*) begin  
		dataOut = {instruction[dataIn+1], instruction[dataIn]};
	end 
	
endmodule 