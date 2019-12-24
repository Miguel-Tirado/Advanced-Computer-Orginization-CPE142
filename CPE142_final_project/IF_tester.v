`include "adder.v"
`include "mux2to1.v"
`include "programCounter.v"
`include "instructionMemory.v"
`include "IFID_Buffer.v"

module IF_tester(clk,rst,sel,pcWrite,flush,enable, AdderOutBuffer,InstOutBuffer,branchtoPC);
	input sel,pcWrite,flush,enable,clk,rst;
	input [15:0] branchtoPC;
	output [15:0] AdderOutBuffer,InstOutBuffer;
	wire [15:0] addOut,muxOut,PCOut,Inst;
	
	mux2to1 IFmux(.b(branchtoPC),.a(addOut),.sel(sel),.out(muxOut));
	programCounter PC(.PCin(muxOut),.clk(clk),.rst(rst),.PCwrite(pcWrite),.PCout(PCOut));
	adder pcAdd(.pcIn(PCOut),.addOut(addOut));
	instructionMemory mem(.clk(clk),.rst(rst),.dataIn(PCOut),.dataOut(Inst));
	IFID_Buffer buff(.clk(clk),.flush(flush),.IFID_enable(enable),.pcAddIn(addOut),.pcAddOut(AdderOutBuffer),.instIn(Inst),.instOut(InstOutBuffer),.rst(rst));
	
	
endmodule 
