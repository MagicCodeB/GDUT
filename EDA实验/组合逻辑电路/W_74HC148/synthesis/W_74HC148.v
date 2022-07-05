`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module W_74HC148(
       DataIn,
       EO,
       DataOut,
       EI,
       GS
    );
input  [7:0] DataIn;
output EO;
output [2:0] DataOut;
input  EI;
output GS;

    wire DataOut62_net_1, \DataOut_i[0]_net_1 , GND, VCC, 
        \DataIn_c[0] , \DataIn_c[1] , \DataIn_c[2] , \DataIn_c[3] , 
        \DataIn_c[4] , \DataIn_c[5] , \DataIn_c[6] , \DataIn_c[7] , 
        \DataOut_c[1] , \DataOut_c[2] , EI_c, GS_c, N_49, un1_DataIn_4, 
        N_47, N_48, un1_DataIn_3, un1_DataIn_2, N_45, 
        \DataOut_i_a3_1[0]_net_1 , un1_DataIn_0, un1_DataIn_1, 
        \DataOut_0_0[1]_net_1 ;
    
    NOR2 \DataOut_i_a3_0[0]  (.A(\DataIn_c[7] ), .B(EI_c), .Y(N_48));
    NOR3C \DataIn_pad_RNI90ES2[2]  (.A(un1_DataIn_4), .B(un1_DataIn_3), 
        .C(un1_DataIn_2), .Y(un1_DataIn_0));
    INBUF \DataIn_pad[5]  (.PAD(DataIn[5]), .Y(\DataIn_c[5] ));
    AO1 GS_pad_RNO (.A(un1_DataIn_1), .B(un1_DataIn_0), .C(EI_c), .Y(
        GS_c));
    OUTBUF \DataOut_pad[1]  (.D(\DataOut_c[1] ), .PAD(DataOut[1]));
    INBUF \DataIn_pad[1]  (.PAD(DataIn[1]), .Y(\DataIn_c[1] ));
    INBUF \DataIn_pad[0]  (.PAD(DataIn[0]), .Y(\DataIn_c[0] ));
    NOR3B \DataOut_i_a3[0]  (.A(N_45), .B(\DataOut_i_a3_1[0]_net_1 ), 
        .C(EI_c), .Y(N_47));
    INBUF \DataIn_pad[4]  (.PAD(DataIn[4]), .Y(\DataIn_c[4] ));
    OUTBUF EO_pad (.D(DataOut62_net_1), .PAD(EO));
    OR3B DataOut62 (.A(un1_DataIn_0), .B(un1_DataIn_1), .C(EI_c), .Y(
        DataOut62_net_1));
    OUTBUF GS_pad (.D(GS_c), .PAD(GS));
    VCC VCC_i (.Y(VCC));
    INBUF \DataIn_pad[2]  (.PAD(DataIn[2]), .Y(\DataIn_c[2] ));
    NOR2B \DataOut_i_a3_1_0[0]  (.A(\DataIn_c[4] ), .B(\DataIn_c[6] ), 
        .Y(\DataOut_i_a3_1[0]_net_1 ));
    GND GND_i (.Y(GND));
    NOR2B \DataIn_pad_RNI30QU[4]  (.A(\DataIn_c[5] ), .B(\DataIn_c[4] )
        , .Y(un1_DataIn_3));
    AO1C \DataOut_i_o3[0]  (.A(\DataIn_c[1] ), .B(\DataIn_c[2] ), .C(
        \DataIn_c[3] ), .Y(N_45));
    NOR2B \DataIn_pad_RNIRNPU[0]  (.A(\DataIn_c[0] ), .B(\DataIn_c[1] )
        , .Y(un1_DataIn_1));
    NOR2B \DataIn_pad_RNI74QU[7]  (.A(\DataIn_c[7] ), .B(\DataIn_c[6] )
        , .Y(un1_DataIn_4));
    INBUF EI_pad (.PAD(EI), .Y(EI_c));
    OUTBUF \DataOut_pad[0]  (.D(\DataOut_i[0]_net_1 ), .PAD(DataOut[0])
        );
    OA1A \DataOut_0_0[1]  (.A(un1_DataIn_3), .B(un1_DataIn_2), .C(
        un1_DataIn_4), .Y(\DataOut_0_0[1]_net_1 ));
    INBUF \DataIn_pad[6]  (.PAD(DataIn[6]), .Y(\DataIn_c[6] ));
    NOR3 \DataOut_i[0]  (.A(N_48), .B(N_49), .C(N_47), .Y(
        \DataOut_i[0]_net_1 ));
    AO1 \DataOut_0[2]  (.A(un1_DataIn_3), .B(un1_DataIn_4), .C(EI_c), 
        .Y(\DataOut_c[2] ));
    OR2 \DataOut_0[1]  (.A(\DataOut_0_0[1]_net_1 ), .B(EI_c), .Y(
        \DataOut_c[1] ));
    OUTBUF \DataOut_pad[2]  (.D(\DataOut_c[2] ), .PAD(DataOut[2]));
    INBUF \DataIn_pad[3]  (.PAD(DataIn[3]), .Y(\DataIn_c[3] ));
    INBUF \DataIn_pad[7]  (.PAD(DataIn[7]), .Y(\DataIn_c[7] ));
    NOR2B \DataIn_pad_RNIVRPU[2]  (.A(\DataIn_c[2] ), .B(\DataIn_c[3] )
        , .Y(un1_DataIn_2));
    NOR3A \DataOut_i_a3_1[0]  (.A(\DataIn_c[6] ), .B(\DataIn_c[5] ), 
        .C(EI_c), .Y(N_49));
    
endmodule
