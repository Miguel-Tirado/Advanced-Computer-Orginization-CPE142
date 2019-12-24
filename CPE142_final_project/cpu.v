
`include "adder.v"
`include "mux2to1.v"
`include "programCounter.v"
`include "instructionMemory.v"
`include "regFile.v"
`include "control.v"
`include "comparator.v"
`include "signExtension.v"
`include "zeroExtend.v"
`include "IFID_Buffer.v"
`include "IDEX_Buffer.v"
`include "EXMEM_Buffer.v"
`include "MEMWB_Buffer.v"
`include "hazardDetection.v"
`include "ALU.v"
`include "ALU_Control.v"
`include "fowardUnit.v"
`include "dataMemory.v"
`include "and1Bit.v"
`include "or1Bit.v"
`include "shiftLeft.v"
`include "ctrlmux.v" 
`include "Adder16Bit.v"

module cpu(clk,rst);
	input clk,rst; 
	// IF wires 
	wire [15:0] IFmux_out,pc_out,pcAdd_out,inst_out;
	wire PCwrite;
	wire flush,enable; 
	wire and1Out,branchTaken,mux1sel;// for 1 bit and gate  branch taken goes to and 
	// ID wires 
	wire [15:0] ID_PCout,ID_inst_out;
	wire [15:0] op1_Out,op2_Out,R15_out;
	wire [15:0] fourto16,eightto16,twelveto16,zeroExtend;
	wire [17:0] ctrlSignal;
	wire [15:0] jumpadd;// used for jump and branches
	wire [15:0] shft_in,shfted_out;
	wire [17:0] ctrlSignal_2;
	wire ctrlmux;
	// WB wires
	wire regWrite, R15write;// temp change to arrayed value?
	wire [15:0] wrData,wrR15_Data;
	//EX ----------------------wires------------------------------------------- 
	wire [15:0] EX_op1,EX_op2,signExt,zeroExt;
	wire [3:0] fwd_op1,fwd_op2, regDes;
	wire [17:0] ctrlSignal_3;
	//IF component layout 
	and1Bit andA(.A(ctrlSignal[0]),.Y(and1Out),.B(branchTaken));// finish 
	or1Bit o1(.A(and1Out),.B(ctrlSignal[1]),.Y(mux1sel));
	mux2to1 m2(.a(pcAdd_out),.b(jumpadd),.out(IFmux_out),.sel(mux1sel));
	programCounter pc1(.clk(clk),.rst(rst),.PCwrite(PCwrite),.PCin(IFmux_out),.PCout(pc_out));
	instructionMemory mem1(.clk(clk),.rst(rst),.dataIn(pc_out),.dataOut(inst_out));
	adder a1(.pcIn(pc_out),.addOut(pcAdd_out));
	IFID_Buffer B1(.clk(clk),.rst(rst),.flush(flush),.IFID_enable(enable),.pcAddIn(pcAdd_out),.instIn(inst_out),.pcAddOut(ID_PCout),.instOut(ID_inst_out));
	
	// ID component 
	regFile r1(.clk(clk),.rst(rst),.read_op1(ID_inst_out[11:8]),.read_op2(ID_inst_out[7:4]),.regWrite(regWrite),.R15write(R15write),.wrData(wrData),.wrR15_Data(wrR15_Data),.op1_Out(op1_Out),.op2_Out(op2_Out),.R15_Out(R15_out));
	signExtension #(.N(4)) s1(.dataIn(ID_inst_out[3:0]),.dataIn(fourto16));
	signExtension #(.N(8)) s2(.dataIn(ID_inst_out[7:0]),.dataIn(eightto16));
	signExtension #(.N(12)) s3(.dataIn(ID_inst_out[11:0]),.dataIn(twelve16));
	zeroExtend z1(.dataIn(ID_inst_out[7:0]),.dataOut(zeroExtend));
	
	control c1(.opcode(ID_inst_out[15:12]),.branch(ctrlSignal[0]),.jump(ctrlSignal[1]),.flush(ctrlSignal[2]),.shift_Src(ctrlSignal[3]),.branchCode(ctrlSignal[5:4]),.regWrite(ctrlSignal[6]),.R15write(ctrlSignal[7]),.ALUop(ctrlSignal[9:8]),.ALUsrc1(ctrlSignal[10]),.ALUsrc2(ctrlSignal[11]),.extSrc(ctrlSignal[12]),.memRead(ctrlSignal[13]),.memWrite(ctrlSignal[14]),.sByte(ctrlSignal[15]),.MemtoReg(ctrlSignal[16]),.loadByte(ctrlSignal[17]));
	comparator m1(.readData1(op1_Out),.R15(R15_out),.branch(branchTaken),.branchCode(ctrlSignal[5:4]));
	mux2to1 m3 (.a(eightto16),.b(twelveto16),.sel(ctrlSignal[3]),.out(shft_in));
	shiftLeft sl(.in(shft_in),.out(shfted_out));
	ctrlmux k2(.a(ctrlSignal[17:0]),.b(18'd0),.out(ctrlSignal_2[17:0]),.sel(ctrlmux));//might need to ad [17:0]for ctrlSignal_2
	Adder16Bit a4(.A(shfted_out), .B(ID_PCout), .sum(jumpadd));
	
	IDEX_Buffer B2(.clk(clk),.rst(rst),.regWrite(ctrlSignal_2[6]),.R15Write(ctrlSignal_2[7]), .ALUsrc1(ctrlSignal_2[10]), .ALUsrc2(ctrlSignal_2[11]), .extSrc(ctrlSignal_2[12]), .memRead(ctrlSignal_2[13]), .memWrite(ctrlSignal_2[14]), .sByte(ctrlSignal_2[15]), .MemtoReg(ctrlSignal_2[16]), .loadByte(ctrlSignal_2[17]), .ALUop(ctrlSignal_2[9:8]), .op1_IN(op1_Out), .op2_in(op2_Out), .op1_FWD_IN(ID_inst_out[11:8]), .op2_FWD_IN(ID_inst_out[7:4]), .sgn_EXT_IN(fourto16), .ZRO_EXT_IN(zeroExtend), .regDes_IN(ID_inst_out[11:8]), .op1_OUT(EX_op1), .op2_OUT(EX_op2), .op1_FWD_OUT(fwd_op1), .op2_FWD_OUT(fwd_op2), .sgn_EXT_OUT(signExt), .ZRO_EXT_OUT(zeroExt), .regDes_OUT(regDes),.regWriteOUT(ctrlSignal_3[6]),.R15WriteOUT(ctrlSignal_3[7]), .ALUsrc1OUT(ctrlSignal_3[10]), .ALUsrc2OUT(ctrlSignal_3[11]), .extSrcOUT(ctrlSignal_3[12]), .memReadOUT(ctrlSignal_3[13]), .memWriteOUT(ctrlSignal_3[14]), .sByteOUT(ctrlSignal_3[15]), .MemtoRegOUT(ctrlSignal_3[16]), .loadByteOUT(ctrlSignal_3[17]), .ALUopOUT(ctrlSignal_3[9:8]));
	
	
	
endmodule 