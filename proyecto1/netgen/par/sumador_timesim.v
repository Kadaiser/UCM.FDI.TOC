////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: sumador_timesim.v
// /___/   /\     Timestamp: Sun Oct 11 17:15:08 2015
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 5 -pcf sumador.pcf -sdf_anno true -sdf_path netgen/par -insert_glbl true -insert_pp_buffers true -w -dir netgen/par -ofmt verilog -sim sumador.ncd sumador_timesim.v 
// Device	: 3s1000ft256-5 (PRODUCTION 1.39 2013-10-13)
// Input file	: sumador.ncd
// Output file	: D:\Kadaiser\Documents\GitHub\TOC\proyecto1\netgen\par\sumador_timesim.v
// # of Modules	: 1
// Design Name	: sumador
// Xilinx        : D:\Desarrollo\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module sumador (
C, A, B
);
  output [3 : 0] C;
  input [3 : 0] A;
  input [3 : 0] B;
  wire A_0_IBUF_65;
  wire A_1_IBUF_66;
  wire A_2_IBUF_67;
  wire A_3_IBUF_68;
  wire B_0_IBUF_69;
  wire B_1_IBUF_70;
  wire B_2_IBUF_71;
  wire B_3_IBUF_72;
  wire \A<0>/INBUF ;
  wire \A<1>/INBUF ;
  wire \A<2>/INBUF ;
  wire \A<3>/INBUF ;
  wire \B<0>/INBUF ;
  wire \B<1>/INBUF ;
  wire \B<2>/INBUF ;
  wire \B<3>/INBUF ;
  wire \C<0>/O ;
  wire \C<1>/O ;
  wire \C<2>/O ;
  wire \C<3>/O ;
  wire \C_3_OBUF/F5MUX_181 ;
  wire \Madd_C_xor<3>11 ;
  wire \C_3_OBUF/BXINV_174 ;
  wire \Madd_C_xor<3>111_172 ;
  wire C_1_OBUF_204;
  wire C_0_OBUF_197;
  wire C_2_OBUF_228;
  wire \Madd_C_cy<1>_pack_1 ;
  wire VCC;
  wire [1 : 1] Madd_C_cy;
  initial $sdf_annotate("netgen/par/sumador_timesim.sdf");
  X_IPAD #(
    .LOC ( "PAD46" ))
  \A<0>/PAD  (
    .PAD(A[0])
  );
  X_BUF #(
    .LOC ( "PAD46" ))
  A_0_IBUF (
    .I(A[0]),
    .O(\A<0>/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD45" ))
  \A<1>/PAD  (
    .PAD(A[1])
  );
  X_BUF #(
    .LOC ( "PAD45" ))
  A_1_IBUF (
    .I(A[1]),
    .O(\A<1>/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD40" ))
  \A<2>/PAD  (
    .PAD(A[2])
  );
  X_BUF #(
    .LOC ( "PAD40" ))
  A_2_IBUF (
    .I(A[2]),
    .O(\A<2>/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD43" ))
  \A<3>/PAD  (
    .PAD(A[3])
  );
  X_BUF #(
    .LOC ( "PAD43" ))
  A_3_IBUF (
    .I(A[3]),
    .O(\A<3>/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD42" ))
  \B<0>/PAD  (
    .PAD(B[0])
  );
  X_BUF #(
    .LOC ( "PAD42" ))
  B_0_IBUF (
    .I(B[0]),
    .O(\B<0>/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD44" ))
  \B<1>/PAD  (
    .PAD(B[1])
  );
  X_BUF #(
    .LOC ( "PAD44" ))
  B_1_IBUF (
    .I(B[1]),
    .O(\B<1>/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD39" ))
  \B<2>/PAD  (
    .PAD(B[2])
  );
  X_BUF #(
    .LOC ( "PAD39" ))
  B_2_IBUF (
    .I(B[2]),
    .O(\B<2>/INBUF )
  );
  X_IPAD #(
    .LOC ( "PAD38" ))
  \B<3>/PAD  (
    .PAD(B[3])
  );
  X_BUF #(
    .LOC ( "PAD38" ))
  B_3_IBUF (
    .I(B[3]),
    .O(\B<3>/INBUF )
  );
  X_OPAD #(
    .LOC ( "PAD50" ))
  \C<0>/PAD  (
    .PAD(C[0])
  );
  X_OBUF #(
    .LOC ( "PAD50" ))
  C_0_OBUF (
    .I(\C<0>/O ),
    .O(C[0])
  );
  X_OPAD #(
    .LOC ( "PAD49" ))
  \C<1>/PAD  (
    .PAD(C[1])
  );
  X_OBUF #(
    .LOC ( "PAD49" ))
  C_1_OBUF (
    .I(\C<1>/O ),
    .O(C[1])
  );
  X_OPAD #(
    .LOC ( "PAD48" ))
  \C<2>/PAD  (
    .PAD(C[2])
  );
  X_OBUF #(
    .LOC ( "PAD48" ))
  C_2_OBUF (
    .I(\C<2>/O ),
    .O(C[2])
  );
  X_OPAD #(
    .LOC ( "PAD47" ))
  \C<3>/PAD  (
    .PAD(C[3])
  );
  X_OBUF #(
    .LOC ( "PAD47" ))
  C_3_OBUF (
    .I(\C<3>/O ),
    .O(C[3])
  );
  X_MUX2 #(
    .LOC ( "SLICE_X32Y94" ))
  \C_3_OBUF/F5MUX  (
    .IA(\Madd_C_xor<3>111_172 ),
    .IB(\Madd_C_xor<3>11 ),
    .SEL(\C_3_OBUF/BXINV_174 ),
    .O(\C_3_OBUF/F5MUX_181 )
  );
  X_BUF #(
    .LOC ( "SLICE_X32Y94" ))
  \C_3_OBUF/BXINV  (
    .I(Madd_C_cy[1]),
    .O(\C_3_OBUF/BXINV_174 )
  );
  X_BUF #(
    .LOC ( "SLICE_X34Y95" ))
  \C_2_OBUF/YUSED  (
    .I(\Madd_C_cy<1>_pack_1 ),
    .O(Madd_C_cy[1])
  );
  X_BUF #(
    .LOC ( "PAD46" ))
  \A<0>/IFF/IMUX  (
    .I(\A<0>/INBUF ),
    .O(A_0_IBUF_65)
  );
  X_BUF #(
    .LOC ( "PAD45" ))
  \A<1>/IFF/IMUX  (
    .I(\A<1>/INBUF ),
    .O(A_1_IBUF_66)
  );
  X_BUF #(
    .LOC ( "PAD40" ))
  \A<2>/IFF/IMUX  (
    .I(\A<2>/INBUF ),
    .O(A_2_IBUF_67)
  );
  X_BUF #(
    .LOC ( "PAD43" ))
  \A<3>/IFF/IMUX  (
    .I(\A<3>/INBUF ),
    .O(A_3_IBUF_68)
  );
  X_BUF #(
    .LOC ( "PAD42" ))
  \B<0>/IFF/IMUX  (
    .I(\B<0>/INBUF ),
    .O(B_0_IBUF_69)
  );
  X_BUF #(
    .LOC ( "PAD44" ))
  \B<1>/IFF/IMUX  (
    .I(\B<1>/INBUF ),
    .O(B_1_IBUF_70)
  );
  X_BUF #(
    .LOC ( "PAD39" ))
  \B<2>/IFF/IMUX  (
    .I(\B<2>/INBUF ),
    .O(B_2_IBUF_71)
  );
  X_BUF #(
    .LOC ( "PAD38" ))
  \B<3>/IFF/IMUX  (
    .I(\B<3>/INBUF ),
    .O(B_3_IBUF_72)
  );
  X_LUT4 #(
    .INIT ( 16'h9666 ),
    .LOC ( "SLICE_X32Y94" ))
  \Madd_C_xor<3>112  (
    .ADR0(B_3_IBUF_72),
    .ADR1(A_3_IBUF_68),
    .ADR2(A_2_IBUF_67),
    .ADR3(B_2_IBUF_71),
    .O(\Madd_C_xor<3>111_172 )
  );
  X_LUT4 #(
    .INIT ( 16'h9996 ),
    .LOC ( "SLICE_X32Y94" ))
  \Madd_C_xor<3>111  (
    .ADR0(B_3_IBUF_72),
    .ADR1(A_3_IBUF_68),
    .ADR2(A_2_IBUF_67),
    .ADR3(B_2_IBUF_71),
    .O(\Madd_C_xor<3>11 )
  );
  X_LUT4 #(
    .INIT ( 16'h33CC ),
    .LOC ( "SLICE_X35Y95" ))
  \Madd_C_lut<0>1  (
    .ADR0(VCC),
    .ADR1(B_0_IBUF_69),
    .ADR2(VCC),
    .ADR3(A_0_IBUF_65),
    .O(C_0_OBUF_197)
  );
  X_LUT4 #(
    .INIT ( 16'h965A ),
    .LOC ( "SLICE_X35Y95" ))
  \Madd_C_xor<1>11  (
    .ADR0(B_1_IBUF_70),
    .ADR1(B_0_IBUF_69),
    .ADR2(A_1_IBUF_66),
    .ADR3(A_0_IBUF_65),
    .O(C_1_OBUF_204)
  );
  X_LUT4 #(
    .INIT ( 16'hEC80 ),
    .LOC ( "SLICE_X34Y95" ))
  \Madd_C_cy<1>11  (
    .ADR0(A_0_IBUF_65),
    .ADR1(A_1_IBUF_66),
    .ADR2(B_0_IBUF_69),
    .ADR3(B_1_IBUF_70),
    .O(\Madd_C_cy<1>_pack_1 )
  );
  X_LUT4 #(
    .INIT ( 16'h9696 ),
    .LOC ( "SLICE_X34Y95" ))
  \Madd_C_xor<2>11  (
    .ADR0(B_2_IBUF_71),
    .ADR1(A_2_IBUF_67),
    .ADR2(Madd_C_cy[1]),
    .ADR3(VCC),
    .O(C_2_OBUF_228)
  );
  X_BUF #(
    .LOC ( "PAD50" ))
  \C<0>/OUTPUT/OFF/OMUX  (
    .I(C_0_OBUF_197),
    .O(\C<0>/O )
  );
  X_BUF #(
    .LOC ( "PAD49" ))
  \C<1>/OUTPUT/OFF/OMUX  (
    .I(C_1_OBUF_204),
    .O(\C<1>/O )
  );
  X_BUF #(
    .LOC ( "PAD48" ))
  \C<2>/OUTPUT/OFF/OMUX  (
    .I(C_2_OBUF_228),
    .O(\C<2>/O )
  );
  X_BUF #(
    .LOC ( "PAD47" ))
  \C<3>/OUTPUT/OFF/OMUX  (
    .I(\C_3_OBUF/F5MUX_181 ),
    .O(\C<3>/O )
  );
  X_ONE   NlwBlock_sumador_VCC (
    .O(VCC)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

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

endmodule

`endif

