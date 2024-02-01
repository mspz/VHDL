// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Thu Feb  1 16:52:45 2024
// Host        : secil5.siame.univ-tlse3.fr running 64-bit unknown
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /nfs/home/m1info4/Documents/git/VHDL/Log/Log.sim/sim_1/synth/timing/xsim/test_log2_time_synth.v
// Design      : log2_hw
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* BUS_WIDTH = "8" *) 
(* NotValidForBitStream *)
module log2_hw
   (DIN,
    DOUT);
  input [7:0]DIN;
  output [7:0]DOUT;

  wire [7:0]DIN;
  wire [7:0]DIN_IBUF;
  wire [7:0]DOUT;
  wire [3:0]DOUT_OBUF;
  wire \DOUT_OBUF[0]_inst_i_2_n_0 ;
  wire \DOUT_OBUF[1]_inst_i_2_n_0 ;
  wire \DOUT_OBUF[2]_inst_i_2_n_0 ;
  wire \DOUT_OBUF[2]_inst_i_3_n_0 ;
  wire \DOUT_OBUF[3]_inst_i_2_n_0 ;

initial begin
 $sdf_annotate("test_log2_time_synth.sdf",,,,"tool_control");
end
  IBUF \DIN_IBUF[0]_inst 
       (.I(DIN[0]),
        .O(DIN_IBUF[0]));
  IBUF \DIN_IBUF[1]_inst 
       (.I(DIN[1]),
        .O(DIN_IBUF[1]));
  IBUF \DIN_IBUF[2]_inst 
       (.I(DIN[2]),
        .O(DIN_IBUF[2]));
  IBUF \DIN_IBUF[3]_inst 
       (.I(DIN[3]),
        .O(DIN_IBUF[3]));
  IBUF \DIN_IBUF[4]_inst 
       (.I(DIN[4]),
        .O(DIN_IBUF[4]));
  IBUF \DIN_IBUF[5]_inst 
       (.I(DIN[5]),
        .O(DIN_IBUF[5]));
  IBUF \DIN_IBUF[6]_inst 
       (.I(DIN[6]),
        .O(DIN_IBUF[6]));
  IBUF \DIN_IBUF[7]_inst 
       (.I(DIN[7]),
        .O(DIN_IBUF[7]));
  OBUF \DOUT_OBUF[0]_inst 
       (.I(DOUT_OBUF[0]),
        .O(DOUT[0]));
  LUT6 #(
    .INIT(64'h0F004F4F0F004040)) 
    \DOUT_OBUF[0]_inst_i_1 
       (.I0(DIN_IBUF[5]),
        .I1(\DOUT_OBUF[2]_inst_i_2_n_0 ),
        .I2(DIN_IBUF[7]),
        .I3(\DOUT_OBUF[3]_inst_i_2_n_0 ),
        .I4(DIN_IBUF[6]),
        .I5(\DOUT_OBUF[0]_inst_i_2_n_0 ),
        .O(DOUT_OBUF[0]));
  LUT6 #(
    .INIT(64'h4544454445454452)) 
    \DOUT_OBUF[0]_inst_i_2 
       (.I0(DIN_IBUF[5]),
        .I1(DIN_IBUF[4]),
        .I2(DIN_IBUF[3]),
        .I3(DIN_IBUF[2]),
        .I4(DIN_IBUF[1]),
        .I5(DIN_IBUF[0]),
        .O(\DOUT_OBUF[0]_inst_i_2_n_0 ));
  OBUF \DOUT_OBUF[1]_inst 
       (.I(DOUT_OBUF[1]),
        .O(DOUT[1]));
  LUT5 #(
    .INIT(32'h0F0F4F40)) 
    \DOUT_OBUF[1]_inst_i_1 
       (.I0(DIN_IBUF[5]),
        .I1(\DOUT_OBUF[2]_inst_i_2_n_0 ),
        .I2(DIN_IBUF[7]),
        .I3(\DOUT_OBUF[1]_inst_i_2_n_0 ),
        .I4(DIN_IBUF[6]),
        .O(DOUT_OBUF[1]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAABFEEC)) 
    \DOUT_OBUF[1]_inst_i_2 
       (.I0(DIN_IBUF[5]),
        .I1(DIN_IBUF[2]),
        .I2(DIN_IBUF[1]),
        .I3(DIN_IBUF[0]),
        .I4(DIN_IBUF[3]),
        .I5(DIN_IBUF[4]),
        .O(\DOUT_OBUF[1]_inst_i_2_n_0 ));
  OBUF \DOUT_OBUF[2]_inst 
       (.I(DOUT_OBUF[2]),
        .O(DOUT[2]));
  LUT5 #(
    .INIT(32'h0F0F4F40)) 
    \DOUT_OBUF[2]_inst_i_1 
       (.I0(DIN_IBUF[5]),
        .I1(\DOUT_OBUF[2]_inst_i_2_n_0 ),
        .I2(DIN_IBUF[7]),
        .I3(\DOUT_OBUF[2]_inst_i_3_n_0 ),
        .I4(DIN_IBUF[6]),
        .O(DOUT_OBUF[2]));
  LUT5 #(
    .INIT(32'h00000001)) 
    \DOUT_OBUF[2]_inst_i_2 
       (.I0(DIN_IBUF[3]),
        .I1(DIN_IBUF[1]),
        .I2(DIN_IBUF[0]),
        .I3(DIN_IBUF[2]),
        .I4(DIN_IBUF[4]),
        .O(\DOUT_OBUF[2]_inst_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEAAAA)) 
    \DOUT_OBUF[2]_inst_i_3 
       (.I0(DIN_IBUF[4]),
        .I1(DIN_IBUF[2]),
        .I2(DIN_IBUF[1]),
        .I3(DIN_IBUF[0]),
        .I4(DIN_IBUF[3]),
        .I5(DIN_IBUF[5]),
        .O(\DOUT_OBUF[2]_inst_i_3_n_0 ));
  OBUF \DOUT_OBUF[3]_inst 
       (.I(DOUT_OBUF[3]),
        .O(DOUT[3]));
  LUT3 #(
    .INIT(8'hE0)) 
    \DOUT_OBUF[3]_inst_i_1 
       (.I0(DIN_IBUF[6]),
        .I1(\DOUT_OBUF[3]_inst_i_2_n_0 ),
        .I2(DIN_IBUF[7]),
        .O(DOUT_OBUF[3]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \DOUT_OBUF[3]_inst_i_2 
       (.I0(DIN_IBUF[4]),
        .I1(DIN_IBUF[2]),
        .I2(DIN_IBUF[1]),
        .I3(DIN_IBUF[0]),
        .I4(DIN_IBUF[3]),
        .I5(DIN_IBUF[5]),
        .O(\DOUT_OBUF[3]_inst_i_2_n_0 ));
  OBUF \DOUT_OBUF[4]_inst 
       (.I(1'b0),
        .O(DOUT[4]));
  OBUF \DOUT_OBUF[5]_inst 
       (.I(1'b0),
        .O(DOUT[5]));
  OBUF \DOUT_OBUF[6]_inst 
       (.I(1'b0),
        .O(DOUT[6]));
  OBUF \DOUT_OBUF[7]_inst 
       (.I(1'b0),
        .O(DOUT[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
