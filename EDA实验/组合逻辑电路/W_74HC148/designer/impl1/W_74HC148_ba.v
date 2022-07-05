`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


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

    wire DataOut62_net_1, \DataOut_i[0]_net_1 , \DataIn_c[0] , 
        \DataIn_c[1] , \DataIn_c[2] , \DataIn_c[3] , \DataIn_c[4] , 
        \DataIn_c[5] , \DataIn_c[6] , \DataIn_c[7] , \DataOut_c[1] , 
        \DataOut_c[2] , EI_c, GS_c, N_49, un1_DataIn_4, N_47, N_48, 
        un1_DataIn_3, un1_DataIn_2, N_45, \DataOut_i_a3_1[0]_net_1 , 
        un1_DataIn_0, un1_DataIn_1, \DataOut_0_0[1]_net_1 , 
        \DataIn_pad[5]/U0/NET1 , \DataOut_pad[1]/U0/NET1 , 
        \DataOut_pad[1]/U0/NET2 , \DataIn_pad[1]/U0/NET1 , 
        \DataIn_pad[0]/U0/NET1 , \DataIn_pad[4]/U0/NET1 , 
        \EO_pad/U0/NET1 , \EO_pad/U0/NET2 , \GS_pad/U0/NET1 , 
        \GS_pad/U0/NET2 , \DataIn_pad[2]/U0/NET1 , \EI_pad/U0/NET1 , 
        \DataOut_pad[0]/U0/NET1 , \DataOut_pad[0]/U0/NET2 , 
        \DataIn_pad[6]/U0/NET1 , \DataOut_pad[2]/U0/NET1 , 
        \DataOut_pad[2]/U0/NET2 , VCC, \DataIn_pad[3]/U0/NET1 , 
        \DataIn_pad[7]/U0/NET1 , GND, AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    NOR2B \DataOut_i_a3_1_0[0]  (.A(\DataIn_c[4] ), .B(\DataIn_c[6] ), 
        .Y(\DataOut_i_a3_1[0]_net_1 ));
    NOR3A \DataOut_i_a3_1[0]  (.A(\DataIn_c[6] ), .B(\DataIn_c[5] ), 
        .C(EI_c), .Y(N_49));
    OR2 \DataOut_0[1]  (.A(\DataOut_0_0[1]_net_1 ), .B(EI_c), .Y(
        \DataOut_c[1] ));
    IOPAD_IN \EI_pad/U0/U0  (.PAD(EI), .Y(\EI_pad/U0/NET1 ));
    IOPAD_TRI \EO_pad/U0/U0  (.D(\EO_pad/U0/NET1 ), .E(
        \EO_pad/U0/NET2 ), .PAD(EO));
    IOTRI_OB_EB \DataOut_pad[0]/U0/U1  (.D(\DataOut_i[0]_net_1 ), .E(
        VCC), .DOUT(\DataOut_pad[0]/U0/NET1 ), .EOUT(
        \DataOut_pad[0]/U0/NET2 ));
    IOPAD_IN \DataIn_pad[1]/U0/U0  (.PAD(DataIn[1]), .Y(
        \DataIn_pad[1]/U0/NET1 ));
    IOTRI_OB_EB \DataOut_pad[1]/U0/U1  (.D(\DataOut_c[1] ), .E(VCC), 
        .DOUT(\DataOut_pad[1]/U0/NET1 ), .EOUT(
        \DataOut_pad[1]/U0/NET2 ));
    NOR3C \DataIn_pad_RNI90ES2[2]  (.A(un1_DataIn_4), .B(un1_DataIn_3), 
        .C(un1_DataIn_2), .Y(un1_DataIn_0));
    AO1C \DataOut_i_o3[0]  (.A(\DataIn_c[1] ), .B(\DataIn_c[2] ), .C(
        \DataIn_c[3] ), .Y(N_45));
    IOPAD_TRI \DataOut_pad[2]/U0/U0  (.D(\DataOut_pad[2]/U0/NET1 ), .E(
        \DataOut_pad[2]/U0/NET2 ), .PAD(DataOut[2]));
    IOIN_IB \DataIn_pad[1]/U0/U1  (.YIN(\DataIn_pad[1]/U0/NET1 ), .Y(
        \DataIn_c[1] ));
    AO1 \DataOut_0[2]  (.A(un1_DataIn_3), .B(un1_DataIn_4), .C(EI_c), 
        .Y(\DataOut_c[2] ));
    NOR3B \DataOut_i_a3[0]  (.A(N_45), .B(\DataOut_i_a3_1[0]_net_1 ), 
        .C(EI_c), .Y(N_47));
    NOR3 \DataOut_i[0]  (.A(N_48), .B(N_49), .C(N_47), .Y(
        \DataOut_i[0]_net_1 ));
    NOR2B \DataIn_pad_RNIVRPU[2]  (.A(\DataIn_c[2] ), .B(\DataIn_c[3] )
        , .Y(un1_DataIn_2));
    IOPAD_IN \DataIn_pad[5]/U0/U0  (.PAD(DataIn[5]), .Y(
        \DataIn_pad[5]/U0/NET1 ));
    IOTRI_OB_EB \EO_pad/U0/U1  (.D(DataOut62_net_1), .E(VCC), .DOUT(
        \EO_pad/U0/NET1 ), .EOUT(\EO_pad/U0/NET2 ));
    IOPAD_IN \DataIn_pad[6]/U0/U0  (.PAD(DataIn[6]), .Y(
        \DataIn_pad[6]/U0/NET1 ));
    IOTRI_OB_EB \GS_pad/U0/U1  (.D(GS_c), .E(VCC), .DOUT(
        \GS_pad/U0/NET1 ), .EOUT(\GS_pad/U0/NET2 ));
    IOPAD_TRI \GS_pad/U0/U0  (.D(\GS_pad/U0/NET1 ), .E(
        \GS_pad/U0/NET2 ), .PAD(GS));
    OR3B DataOut62 (.A(un1_DataIn_0), .B(un1_DataIn_1), .C(EI_c), .Y(
        DataOut62_net_1));
    IOIN_IB \DataIn_pad[5]/U0/U1  (.YIN(\DataIn_pad[5]/U0/NET1 ), .Y(
        \DataIn_c[5] ));
    AO1 GS_pad_RNO (.A(un1_DataIn_1), .B(un1_DataIn_0), .C(EI_c), .Y(
        GS_c));
    IOIN_IB \DataIn_pad[6]/U0/U1  (.YIN(\DataIn_pad[6]/U0/NET1 ), .Y(
        \DataIn_c[6] ));
    NOR2B \DataIn_pad_RNI30QU[4]  (.A(\DataIn_c[5] ), .B(\DataIn_c[4] )
        , .Y(un1_DataIn_3));
    IOPAD_IN \DataIn_pad[7]/U0/U0  (.PAD(DataIn[7]), .Y(
        \DataIn_pad[7]/U0/NET1 ));
    IOPAD_IN \DataIn_pad[4]/U0/U0  (.PAD(DataIn[4]), .Y(
        \DataIn_pad[4]/U0/NET1 ));
    IOPAD_IN \DataIn_pad[3]/U0/U0  (.PAD(DataIn[3]), .Y(
        \DataIn_pad[3]/U0/NET1 ));
    IOIN_IB \EI_pad/U0/U1  (.YIN(\EI_pad/U0/NET1 ), .Y(EI_c));
    IOPAD_IN \DataIn_pad[2]/U0/U0  (.PAD(DataIn[2]), .Y(
        \DataIn_pad[2]/U0/NET1 ));
    IOTRI_OB_EB \DataOut_pad[2]/U0/U1  (.D(\DataOut_c[2] ), .E(VCC), 
        .DOUT(\DataOut_pad[2]/U0/NET1 ), .EOUT(
        \DataOut_pad[2]/U0/NET2 ));
    IOPAD_IN \DataIn_pad[0]/U0/U0  (.PAD(DataIn[0]), .Y(
        \DataIn_pad[0]/U0/NET1 ));
    IOIN_IB \DataIn_pad[7]/U0/U1  (.YIN(\DataIn_pad[7]/U0/NET1 ), .Y(
        \DataIn_c[7] ));
    IOIN_IB \DataIn_pad[4]/U0/U1  (.YIN(\DataIn_pad[4]/U0/NET1 ), .Y(
        \DataIn_c[4] ));
    IOPAD_TRI \DataOut_pad[0]/U0/U0  (.D(\DataOut_pad[0]/U0/NET1 ), .E(
        \DataOut_pad[0]/U0/NET2 ), .PAD(DataOut[0]));
    IOIN_IB \DataIn_pad[3]/U0/U1  (.YIN(\DataIn_pad[3]/U0/NET1 ), .Y(
        \DataIn_c[3] ));
    IOPAD_TRI \DataOut_pad[1]/U0/U0  (.D(\DataOut_pad[1]/U0/NET1 ), .E(
        \DataOut_pad[1]/U0/NET2 ), .PAD(DataOut[1]));
    NOR2 \DataOut_i_a3_0[0]  (.A(\DataIn_c[7] ), .B(EI_c), .Y(N_48));
    OA1A \DataOut_0_0[1]  (.A(un1_DataIn_3), .B(un1_DataIn_2), .C(
        un1_DataIn_4), .Y(\DataOut_0_0[1]_net_1 ));
    NOR2B \DataIn_pad_RNI74QU[7]  (.A(\DataIn_c[7] ), .B(\DataIn_c[6] )
        , .Y(un1_DataIn_4));
    IOIN_IB \DataIn_pad[2]/U0/U1  (.YIN(\DataIn_pad[2]/U0/NET1 ), .Y(
        \DataIn_c[2] ));
    NOR2B \DataIn_pad_RNIRNPU[0]  (.A(\DataIn_c[0] ), .B(\DataIn_c[1] )
        , .Y(un1_DataIn_1));
    IOIN_IB \DataIn_pad[0]/U0/U1  (.YIN(\DataIn_pad[0]/U0/NET1 ), .Y(
        \DataIn_c[0] ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
