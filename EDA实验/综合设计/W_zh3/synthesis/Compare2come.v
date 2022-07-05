`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module newCore(
       DataIn_0_c_0,
       DataIn_c_0,
       Comparator_0_DataOut,
       Comparator_1_DataOut,
       AGEB_c
    );
input  DataIn_0_c_0;
input  DataIn_c_0;
input  [7:1] Comparator_0_DataOut;
input  [7:1] Comparator_1_DataOut;
output AGEB_c;

    wire le_OUT, AND3_0_Y, AO1D_0_Y, NAND3A_0_Y, U1, XNOR2_1_Y, 
        OR2A_1_Y, NOR3A_0_Y, OR2A_2_Y, NAND3A_1_Y, U2, XNOR2_2_Y, 
        XNOR2_0_Y, AO1C_1_Y, AO1C_0_Y, NOR2A_0_Y, OR2A_3_Y, OR2A_0_Y, 
        AO1C_4_Y, AO1C_2_Y, AO1C_5_Y, AO1C_3_Y, GND, VCC;
    
    AO1C AO1C_3 (.A(Comparator_1_DataOut[3]), .B(
        Comparator_0_DataOut[3]), .C(NOR2A_0_Y), .Y(AO1C_3_Y));
    AO1C AO1C_2 (.A(Comparator_0_DataOut[3]), .B(
        Comparator_1_DataOut[3]), .C(AO1C_3_Y), .Y(AO1C_2_Y));
    AO1C AO1C_5 (.A(Comparator_1_DataOut[5]), .B(
        Comparator_0_DataOut[5]), .C(Comparator_1_DataOut[4]), .Y(
        AO1C_5_Y));
    NOR3A NOR3A_0 (.A(OR2A_3_Y), .B(AO1C_5_Y), .C(
        Comparator_0_DataOut[4]), .Y(NOR3A_0_Y));
    AO1D AO1D_0 (.A(AO1C_1_Y), .B(AO1C_4_Y), .C(AO1C_2_Y), .Y(AO1D_0_Y)
        );
    AND2A AND_SIGN (.A(Comparator_0_DataOut[7]), .B(
        Comparator_1_DataOut[7]), .Y(U2));
    AO1C AO1C_0 (.A(DataIn_c_0), .B(DataIn_0_c_0), .C(OR2A_1_Y), .Y(
        AO1C_0_Y));
    AND3 AND3_0 (.A(XNOR2_1_Y), .B(XNOR2_0_Y), .C(XNOR2_2_Y), .Y(
        AND3_0_Y));
    VCC VCC_i (.Y(VCC));
    AO1C AO1C_4 (.A(Comparator_1_DataOut[2]), .B(
        Comparator_0_DataOut[2]), .C(OR2A_0_Y), .Y(AO1C_4_Y));
    OR2A OR2A_0 (.A(Comparator_0_DataOut[1]), .B(
        Comparator_1_DataOut[1]), .Y(OR2A_0_Y));
    NAND3A NAND3A_1 (.A(Comparator_0_DataOut[5]), .B(
        Comparator_1_DataOut[5]), .C(OR2A_3_Y), .Y(NAND3A_1_Y));
    OR2A OR2A_3 (.A(Comparator_0_DataOut[6]), .B(
        Comparator_1_DataOut[6]), .Y(OR2A_3_Y));
    NOR2A NOR2A_0 (.A(Comparator_1_DataOut[2]), .B(
        Comparator_0_DataOut[2]), .Y(NOR2A_0_Y));
    GND GND_i (.Y(GND));
    AO1C AO1C_1 (.A(Comparator_1_DataOut[3]), .B(
        Comparator_0_DataOut[3]), .C(AO1C_0_Y), .Y(AO1C_1_Y));
    XNOR2 XNOR2_0 (.A(Comparator_1_DataOut[5]), .B(
        Comparator_0_DataOut[5]), .Y(XNOR2_0_Y));
    XNOR2 XNOR2_2 (.A(Comparator_1_DataOut[6]), .B(
        Comparator_0_DataOut[6]), .Y(XNOR2_2_Y));
    OR2A OR2A_2 (.A(Comparator_1_DataOut[6]), .B(
        Comparator_0_DataOut[6]), .Y(OR2A_2_Y));
    NAND3A NAND3A_0 (.A(NOR3A_0_Y), .B(OR2A_2_Y), .C(NAND3A_1_Y), .Y(
        NAND3A_0_Y));
    AO1 AND_AO21 (.A(le_OUT), .B(U1), .C(U2), .Y(AGEB_c));
    OR2A OR2A_1 (.A(Comparator_1_DataOut[1]), .B(
        Comparator_0_DataOut[1]), .Y(OR2A_1_Y));
    XNOR2 XNOR2_1 (.A(Comparator_1_DataOut[4]), .B(
        Comparator_0_DataOut[4]), .Y(XNOR2_1_Y));
    OR2A OR_SIGN (.A(Comparator_0_DataOut[7]), .B(
        Comparator_1_DataOut[7]), .Y(U1));
    AOI1 AOI1_le_OUT (.A(AND3_0_Y), .B(AO1D_0_Y), .C(NAND3A_0_Y), .Y(
        le_OUT));
    
endmodule


module Comparator_1_0(
       Comparator_1_DataOut,
       DataIn_0_c
    );
output [7:1] Comparator_1_DataOut;
input  [7:0] DataIn_0_c;

    wire N_7, N_5, \DWACT_FINC_E[0] , I_19_0, I_17_0, I_14_0, I_12_0, 
        I_9_0, I_7_0, I_5_0, \DWACT_FINC_E[2] , N_3, \DWACT_FINC_E[1] , 
        N_4, N_6, GND, VCC;
    
    XNOR2 un1_DataOut_I_17 (.A(DataIn_0_c[6]), .B(N_3), .Y(I_17_0));
    NOR2 un1_DataOut_I_15 (.A(DataIn_0_c[4]), .B(DataIn_0_c[3]), .Y(
        \DWACT_FINC_E[1] ));
    NOR3 un1_DataOut_I_10 (.A(DataIn_0_c[1]), .B(DataIn_0_c[0]), .C(
        DataIn_0_c[2]), .Y(\DWACT_FINC_E[0] ));
    MX2 \DataOut_1[6]  (.A(DataIn_0_c[6]), .B(I_17_0), .S(
        DataIn_0_c[7]), .Y(Comparator_1_DataOut[6]));
    MX2 \DataOut_1[5]  (.A(DataIn_0_c[5]), .B(I_14_0), .S(
        DataIn_0_c[7]), .Y(Comparator_1_DataOut[5]));
    MX2 \DataOut_1[4]  (.A(DataIn_0_c[4]), .B(I_12_0), .S(
        DataIn_0_c[7]), .Y(Comparator_1_DataOut[4]));
    NOR3B un1_DataOut_I_16 (.A(\DWACT_FINC_E[1] ), .B(
        \DWACT_FINC_E[0] ), .C(DataIn_0_c[5]), .Y(N_3));
    NOR3 un1_DataOut_I_8 (.A(DataIn_0_c[1]), .B(DataIn_0_c[0]), .C(
        DataIn_0_c[2]), .Y(N_6));
    MX2 \DataOut_1[3]  (.A(DataIn_0_c[3]), .B(I_9_0), .S(DataIn_0_c[7])
        , .Y(Comparator_1_DataOut[3]));
    VCC VCC_i (.Y(VCC));
    NOR2B \DataOut_1[7]  (.A(DataIn_0_c[7]), .B(I_19_0), .Y(
        Comparator_1_DataOut[7]));
    NOR2 un1_DataOut_I_6 (.A(DataIn_0_c[0]), .B(DataIn_0_c[1]), .Y(N_7)
        );
    XNOR2 un1_DataOut_I_14 (.A(DataIn_0_c[5]), .B(N_4), .Y(I_14_0));
    XNOR2 un1_DataOut_I_9 (.A(DataIn_0_c[3]), .B(N_6), .Y(I_9_0));
    NOR3 un1_DataOut_I_18 (.A(DataIn_0_c[5]), .B(DataIn_0_c[4]), .C(
        DataIn_0_c[3]), .Y(\DWACT_FINC_E[2] ));
    GND GND_i (.Y(GND));
    OR3B un1_DataOut_I_19 (.A(\DWACT_FINC_E[0] ), .B(\DWACT_FINC_E[2] )
        , .C(DataIn_0_c[6]), .Y(I_19_0));
    XOR2 un1_DataOut_I_5 (.A(DataIn_0_c[0]), .B(DataIn_0_c[1]), .Y(
        I_5_0));
    MX2 \DataOut_1[1]  (.A(DataIn_0_c[1]), .B(I_5_0), .S(DataIn_0_c[7])
        , .Y(Comparator_1_DataOut[1]));
    NOR3A un1_DataOut_I_13 (.A(\DWACT_FINC_E[0] ), .B(DataIn_0_c[4]), 
        .C(DataIn_0_c[3]), .Y(N_4));
    XNOR2 un1_DataOut_I_12 (.A(DataIn_0_c[4]), .B(N_5), .Y(I_12_0));
    MX2 \DataOut_1[2]  (.A(DataIn_0_c[2]), .B(I_7_0), .S(DataIn_0_c[7])
        , .Y(Comparator_1_DataOut[2]));
    NOR2A un1_DataOut_I_11 (.A(\DWACT_FINC_E[0] ), .B(DataIn_0_c[3]), 
        .Y(N_5));
    XNOR2 un1_DataOut_I_7 (.A(DataIn_0_c[2]), .B(N_7), .Y(I_7_0));
    
endmodule


module Comparator_1(
       Comparator_0_DataOut,
       DataIn_c
    );
output [7:1] Comparator_0_DataOut;
input  [7:0] DataIn_c;

    wire N_7, N_5, \DWACT_FINC_E[0] , I_19, I_17, I_14, I_12, I_9, I_7, 
        I_5, \DWACT_FINC_E[2] , N_3, \DWACT_FINC_E[1] , N_4, N_6, GND, 
        VCC;
    
    XNOR2 un1_DataOut_I_17 (.A(DataIn_c[6]), .B(N_3), .Y(I_17));
    NOR2 un1_DataOut_I_15 (.A(DataIn_c[3]), .B(DataIn_c[4]), .Y(
        \DWACT_FINC_E[1] ));
    NOR3 un1_DataOut_I_10 (.A(DataIn_c[1]), .B(DataIn_c[0]), .C(
        DataIn_c[2]), .Y(\DWACT_FINC_E[0] ));
    MX2 \DataOut_1[6]  (.A(DataIn_c[6]), .B(I_17), .S(DataIn_c[7]), .Y(
        Comparator_0_DataOut[6]));
    MX2 \DataOut_1[5]  (.A(DataIn_c[5]), .B(I_14), .S(DataIn_c[7]), .Y(
        Comparator_0_DataOut[5]));
    MX2 \DataOut_1[4]  (.A(DataIn_c[4]), .B(I_12), .S(DataIn_c[7]), .Y(
        Comparator_0_DataOut[4]));
    NOR3B un1_DataOut_I_16 (.A(\DWACT_FINC_E[1] ), .B(
        \DWACT_FINC_E[0] ), .C(DataIn_c[5]), .Y(N_3));
    NOR3 un1_DataOut_I_8 (.A(DataIn_c[1]), .B(DataIn_c[0]), .C(
        DataIn_c[2]), .Y(N_6));
    MX2 \DataOut_1[3]  (.A(DataIn_c[3]), .B(I_9), .S(DataIn_c[7]), .Y(
        Comparator_0_DataOut[3]));
    VCC VCC_i (.Y(VCC));
    NOR2B \DataOut_1[7]  (.A(DataIn_c[7]), .B(I_19), .Y(
        Comparator_0_DataOut[7]));
    NOR2 un1_DataOut_I_6 (.A(DataIn_c[0]), .B(DataIn_c[1]), .Y(N_7));
    XNOR2 un1_DataOut_I_14 (.A(DataIn_c[5]), .B(N_4), .Y(I_14));
    XNOR2 un1_DataOut_I_9 (.A(DataIn_c[3]), .B(N_6), .Y(I_9));
    NOR3 un1_DataOut_I_18 (.A(DataIn_c[4]), .B(DataIn_c[3]), .C(
        DataIn_c[5]), .Y(\DWACT_FINC_E[2] ));
    GND GND_i (.Y(GND));
    OR3B un1_DataOut_I_19 (.A(\DWACT_FINC_E[0] ), .B(\DWACT_FINC_E[2] )
        , .C(DataIn_c[6]), .Y(I_19));
    XOR2 un1_DataOut_I_5 (.A(DataIn_c[0]), .B(DataIn_c[1]), .Y(I_5));
    MX2 \DataOut_1[1]  (.A(DataIn_c[1]), .B(I_5), .S(DataIn_c[7]), .Y(
        Comparator_0_DataOut[1]));
    NOR3A un1_DataOut_I_13 (.A(\DWACT_FINC_E[0] ), .B(DataIn_c[3]), .C(
        DataIn_c[4]), .Y(N_4));
    XNOR2 un1_DataOut_I_12 (.A(DataIn_c[4]), .B(N_5), .Y(I_12));
    MX2 \DataOut_1[2]  (.A(DataIn_c[2]), .B(I_7), .S(DataIn_c[7]), .Y(
        Comparator_0_DataOut[2]));
    NOR2A un1_DataOut_I_11 (.A(\DWACT_FINC_E[0] ), .B(DataIn_c[3]), .Y(
        N_5));
    XNOR2 un1_DataOut_I_7 (.A(DataIn_c[2]), .B(N_7), .Y(I_7));
    
endmodule


module Compare2come(
       DataIn,
       DataIn_0,
       AGEB
    );
input  [7:0] DataIn;
input  [7:0] DataIn_0;
output AGEB;

    wire \Comparator_0_DataOut[1] , \Comparator_0_DataOut[2] , 
        \Comparator_0_DataOut[3] , \Comparator_0_DataOut[4] , 
        \Comparator_0_DataOut[5] , \Comparator_0_DataOut[6] , 
        \Comparator_0_DataOut[7] , \Comparator_1_DataOut[1] , 
        \Comparator_1_DataOut[2] , \Comparator_1_DataOut[3] , 
        \Comparator_1_DataOut[4] , \Comparator_1_DataOut[5] , 
        \Comparator_1_DataOut[6] , \Comparator_1_DataOut[7] , GND, VCC, 
        \DataIn_c[0] , \DataIn_c[1] , \DataIn_c[2] , \DataIn_c[3] , 
        \DataIn_c[4] , \DataIn_c[5] , \DataIn_c[6] , \DataIn_c[7] , 
        \DataIn_0_c[0] , \DataIn_0_c[1] , \DataIn_0_c[2] , 
        \DataIn_0_c[3] , \DataIn_0_c[4] , \DataIn_0_c[5] , 
        \DataIn_0_c[6] , \DataIn_0_c[7] , AGEB_c;
    
    INBUF \DataIn_pad[5]  (.PAD(DataIn[5]), .Y(\DataIn_c[5] ));
    INBUF \DataIn_pad[1]  (.PAD(DataIn[1]), .Y(\DataIn_c[1] ));
    INBUF \DataIn_pad[0]  (.PAD(DataIn[0]), .Y(\DataIn_c[0] ));
    INBUF \DataIn_0_pad[1]  (.PAD(DataIn_0[1]), .Y(\DataIn_0_c[1] ));
    newCore newCore_0 (.DataIn_0_c_0(\DataIn_0_c[0] ), .DataIn_c_0(
        \DataIn_c[0] ), .Comparator_0_DataOut({
        \Comparator_0_DataOut[7] , \Comparator_0_DataOut[6] , 
        \Comparator_0_DataOut[5] , \Comparator_0_DataOut[4] , 
        \Comparator_0_DataOut[3] , \Comparator_0_DataOut[2] , 
        \Comparator_0_DataOut[1] }), .Comparator_1_DataOut({
        \Comparator_1_DataOut[7] , \Comparator_1_DataOut[6] , 
        \Comparator_1_DataOut[5] , \Comparator_1_DataOut[4] , 
        \Comparator_1_DataOut[3] , \Comparator_1_DataOut[2] , 
        \Comparator_1_DataOut[1] }), .AGEB_c(AGEB_c));
    INBUF \DataIn_pad[4]  (.PAD(DataIn[4]), .Y(\DataIn_c[4] ));
    INBUF \DataIn_0_pad[5]  (.PAD(DataIn_0[5]), .Y(\DataIn_0_c[5] ));
    INBUF \DataIn_0_pad[3]  (.PAD(DataIn_0[3]), .Y(\DataIn_0_c[3] ));
    OUTBUF AGEB_pad (.D(AGEB_c), .PAD(AGEB));
    Comparator_1_0 Comparator_1 (.Comparator_1_DataOut({
        \Comparator_1_DataOut[7] , \Comparator_1_DataOut[6] , 
        \Comparator_1_DataOut[5] , \Comparator_1_DataOut[4] , 
        \Comparator_1_DataOut[3] , \Comparator_1_DataOut[2] , 
        \Comparator_1_DataOut[1] }), .DataIn_0_c({\DataIn_0_c[7] , 
        \DataIn_0_c[6] , \DataIn_0_c[5] , \DataIn_0_c[4] , 
        \DataIn_0_c[3] , \DataIn_0_c[2] , \DataIn_0_c[1] , 
        \DataIn_0_c[0] }));
    VCC VCC_i (.Y(VCC));
    INBUF \DataIn_pad[2]  (.PAD(DataIn[2]), .Y(\DataIn_c[2] ));
    GND GND_i (.Y(GND));
    INBUF \DataIn_0_pad[7]  (.PAD(DataIn_0[7]), .Y(\DataIn_0_c[7] ));
    Comparator_1 Comparator_0 (.Comparator_0_DataOut({
        \Comparator_0_DataOut[7] , \Comparator_0_DataOut[6] , 
        \Comparator_0_DataOut[5] , \Comparator_0_DataOut[4] , 
        \Comparator_0_DataOut[3] , \Comparator_0_DataOut[2] , 
        \Comparator_0_DataOut[1] }), .DataIn_c({\DataIn_c[7] , 
        \DataIn_c[6] , \DataIn_c[5] , \DataIn_c[4] , \DataIn_c[3] , 
        \DataIn_c[2] , \DataIn_c[1] , \DataIn_c[0] }));
    INBUF \DataIn_0_pad[2]  (.PAD(DataIn_0[2]), .Y(\DataIn_0_c[2] ));
    INBUF \DataIn_pad[6]  (.PAD(DataIn[6]), .Y(\DataIn_c[6] ));
    INBUF \DataIn_0_pad[6]  (.PAD(DataIn_0[6]), .Y(\DataIn_0_c[6] ));
    INBUF \DataIn_0_pad[4]  (.PAD(DataIn_0[4]), .Y(\DataIn_0_c[4] ));
    INBUF \DataIn_pad[3]  (.PAD(DataIn[3]), .Y(\DataIn_c[3] ));
    INBUF \DataIn_pad[7]  (.PAD(DataIn[7]), .Y(\DataIn_c[7] ));
    INBUF \DataIn_0_pad[0]  (.PAD(DataIn_0[0]), .Y(\DataIn_0_c[0] ));
    
endmodule
