`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module Bmtz(
       DataIn,
       DataIn_0,
       EO,
       GS,
       GS_0,
       Seg
    );
input  [7:0] DataIn;
input  [7:0] DataIn_0;
output EO;
output GS;
output GS_0;
output [7:0] Seg;

    wire NAND2_0_Y, NAND2_1_Y, NAND2_2_Y, \Seg_2_i_1[3] , \Seg_2_i[1] , 
        \Seg_2_i[2] , \Seg_2_i[3] , \Seg_2_i[4] , \Seg_2_i[5] , 
        \Seg_2_i[6] , \W_74HC148_1.DataOut62 , \DataOut_i_0[0] , 
        \DataOut_i[0] , \DataOut_i[1] , \W_74HC148_0.N_42 , 
        \DataIn_c[0] , \DataIn_c[1] , \DataIn_c[2] , \DataIn_c[3] , 
        \DataIn_c[4] , \DataIn_c[5] , \DataIn_c[6] , \DataIn_c[7] , 
        \DataIn_0_c[0] , \DataIn_0_c[1] , \DataIn_0_c[2] , 
        \DataIn_0_c[3] , \DataIn_0_c[4] , \DataIn_0_c[5] , 
        \DataIn_0_c[6] , \DataIn_0_c[7] , GS_c, GS_0_c, GND, 
        W_HC85_0_QASB, \W_74HC4511_0/N_90 , 
        \W_74HC4511_0/Seg_2_i_1[6]_net_1 , \W_74HC4511_0/N_91 , 
        \W_74HC4511_0/Seg_2_i_0[6]_net_1 , 
        \W_74HC4511_0/Seg_2_i_a5_1_1[6]_net_1 , 
        \W_74HC4511_0/Seg_2_i_a5_1_0[6]_net_1 , \W_74HC4511_0/N_110 , 
        \W_74HC4511_0/Seg_2_i_0[1]_net_1 , \W_74HC4511_0/N_115 , 
        \W_74HC148_1/DataOut_i_a3_1[0] , 
        \W_74HC148_1/DataOut_i_a3_0[0] , \W_74HC148_1/N_45 , 
        \W_74HC148_1/DataOut_i_0[0]_net_1 , 
        \W_74HC148_1/DataOut_i_a3_1_0[0]_net_1 , 
        \W_74HC148_1/un1_DataIn_1_net_1 , 
        \W_74HC148_1/un1_DataIn_0_net_1 , 
        \W_74HC148_1/un1_DataIn_2_net_1 , 
        \W_74HC148_1/un1_DataIn_6_net_1 , 
        \W_74HC148_1/DataOut_0_0[1]_net_1 , 
        \W_74HC148_1/un1_DataIn_3_net_1 , 
        \W_74HC148_1/un1_DataIn_4_net_1 , 
        \W_74HC148_0/DataOut_i_0[0]_net_1 , 
        \W_74HC148_0/DataOut_i_0[1]_net_1 , 
        \W_74HC148_0/DataOut_i_a4_0[1]_net_1 , 
        \W_74HC148_0/un1_DataIn_0_net_1 , \W_74HC148_0/N_44 , 
        \W_74HC148_0/DataOut_i_1_tz[0]_net_1 , \DataIn_pad[4]/U0/NET1 , 
        \DataIn_0_pad[2]/U0/NET1 , \GS_pad/U0/NET1 , \GS_pad/U0/NET2 , 
        \DataIn_pad[5]/U0/NET1 , \DataIn_pad[7]/U0/NET1 , 
        \Seg_pad[0]/U0/NET1 , \Seg_pad[0]/U0/NET2 , 
        \Seg_pad[2]/U0/NET1 , \Seg_pad[2]/U0/NET2 , 
        \DataIn_pad[2]/U0/NET1 , \DataIn_0_pad[1]/U0/NET1 , 
        \GS_0_pad/U0/NET1 , \GS_0_pad/U0/NET2 , \EO_pad/U0/NET1 , 
        \EO_pad/U0/NET2 , \Seg_pad[1]/U0/NET1 , \Seg_pad[1]/U0/NET2 , 
        \DataIn_0_pad[3]/U0/NET1 , \DataIn_0_pad[5]/U0/NET1 , 
        \DataIn_0_pad[0]/U0/NET1 , \DataIn_0_pad[7]/U0/NET1 , 
        \DataIn_0_pad[4]/U0/NET1 , \Seg_pad[5]/U0/NET1 , 
        \Seg_pad[5]/U0/NET2 , \DataIn_pad[0]/U0/NET1 , 
        \Seg_pad[7]/U0/NET1 , \Seg_pad[7]/U0/NET2 , 
        \DataIn_pad[1]/U0/NET1 , \Seg_pad[4]/U0/NET1 , 
        \Seg_pad[4]/U0/NET2 , \DataIn_pad[6]/U0/NET1 , 
        \DataIn_pad[3]/U0/NET1 , \Seg_pad[3]/U0/NET1 , 
        \Seg_pad[3]/U0/NET2 , \Seg_pad[6]/U0/NET1 , 
        \Seg_pad[6]/U0/NET2 , VCC, \DataIn_0_pad[6]/U0/NET1 , 
        AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    OR3C \W_74HC148_1/DataOut62  (.A(\W_74HC148_1/un1_DataIn_0_net_1 ), 
        .B(\W_74HC148_1/un1_DataIn_1_net_1 ), .C(GS_c), .Y(
        \W_74HC148_1.DataOut62 ));
    IOIN_IB \DataIn_0_pad[3]/U0/U1  (.YIN(\DataIn_0_pad[3]/U0/NET1 ), 
        .Y(\DataIn_0_c[3] ));
    NOR3C \W_74HC148_0/un1_DataIn_0  (.A(\DataIn_c[3] ), .B(
        \DataIn_c[2] ), .C(\DataIn_c[1] ), .Y(
        \W_74HC148_0/un1_DataIn_0_net_1 ));
    IOIN_IB \DataIn_0_pad[5]/U0/U1  (.YIN(\DataIn_0_pad[5]/U0/NET1 ), 
        .Y(\DataIn_0_c[5] ));
    AO1 \W_74HC4511_0/Seg_2_i_0[6]  (.A(
        \W_74HC4511_0/Seg_2_i_a5_1_1[6]_net_1 ), .B(
        \W_74HC4511_0/Seg_2_i_a5_1_0[6]_net_1 ), .C(
        \W_74HC4511_0/N_110 ), .Y(\W_74HC4511_0/Seg_2_i_0[6]_net_1 ));
    IOIN_IB \DataIn_0_pad[1]/U0/U1  (.YIN(\DataIn_0_pad[1]/U0/NET1 ), 
        .Y(\DataIn_0_c[1] ));
    AO1D \W_HC85_0/QAGB13lto3  (.A(NAND2_1_Y), .B(NAND2_2_Y), .C(GS_c), 
        .Y(W_HC85_0_QASB));
    NOR2 \W_74HC4511_0/Seg_2_i_a5_1_1[6]  (.A(NAND2_1_Y), .B(NAND2_0_Y)
        , .Y(\W_74HC4511_0/Seg_2_i_a5_1_1[6]_net_1 ));
    IOPAD_IN \DataIn_0_pad[2]/U0/U0  (.PAD(DataIn_0[2]), .Y(
        \DataIn_0_pad[2]/U0/NET1 ));
    NOR2B \W_74HC148_1/un1_DataIn_1  (.A(\DataIn_0_c[0] ), .B(
        \DataIn_0_c[1] ), .Y(\W_74HC148_1/un1_DataIn_1_net_1 ));
    NOR2B \W_74HC148_1/un1_DataIn_0  (.A(
        \W_74HC148_1/un1_DataIn_2_net_1 ), .B(
        \W_74HC148_1/un1_DataIn_6_net_1 ), .Y(
        \W_74HC148_1/un1_DataIn_0_net_1 ));
    NOR2A \W_74HC4511_0/Seg_2_i[1]  (.A(W_HC85_0_QASB), .B(
        \W_74HC4511_0/Seg_2_i_0[1]_net_1 ), .Y(\Seg_2_i[1] ));
    IOPAD_TRI \EO_pad/U0/U0  (.D(\EO_pad/U0/NET1 ), .E(
        \EO_pad/U0/NET2 ), .PAD(EO));
    IOTRI_OB_EB \Seg_pad[5]/U0/U1  (.D(\Seg_2_i[5] ), .E(VCC), .DOUT(
        \Seg_pad[5]/U0/NET1 ), .EOUT(\Seg_pad[5]/U0/NET2 ));
    IOPAD_TRI \Seg_pad[1]/U0/U0  (.D(\Seg_pad[1]/U0/NET1 ), .E(
        \Seg_pad[1]/U0/NET2 ), .PAD(Seg[1]));
    IOPAD_IN \DataIn_pad[1]/U0/U0  (.PAD(DataIn[1]), .Y(
        \DataIn_pad[1]/U0/NET1 ));
    NOR2A \W_74HC4511_0/Seg_2_i[3]  (.A(\Seg_2_i_1[3] ), .B(
        \W_74HC4511_0/N_110 ), .Y(\Seg_2_i[3] ));
    IOPAD_IN \DataIn_0_pad[6]/U0/U0  (.PAD(DataIn_0[6]), .Y(
        \DataIn_0_pad[6]/U0/NET1 ));
    NOR2B \W_74HC148_1/un1_DataIn_2  (.A(\DataIn_0_c[2] ), .B(
        \DataIn_0_c[3] ), .Y(\W_74HC148_1/un1_DataIn_2_net_1 ));
    OR2B \W_74HC148_0/DataOut_i_0[1]  (.A(\DataIn_c[6] ), .B(
        \DataIn_c[7] ), .Y(\W_74HC148_0/DataOut_i_0[1]_net_1 ));
    NOR2B \W_74HC148_1/DataOut_i_a3_0_0[0]  (.A(\W_74HC148_1/N_45 ), 
        .B(GS_c), .Y(\W_74HC148_1/DataOut_i_a3_0[0] ));
    NOR2A \W_74HC4511_0/Seg_2_i_a5_1_0[6]  (.A(NAND2_2_Y), .B(GS_c), 
        .Y(\W_74HC4511_0/Seg_2_i_a5_1_0[6]_net_1 ));
    OAI1 \W_74HC4511_0/Seg_2_i_1[6]  (.A(NAND2_2_Y), .B(
        \W_74HC4511_0/N_91 ), .C(W_HC85_0_QASB), .Y(
        \W_74HC4511_0/Seg_2_i_1[6]_net_1 ));
    NOR2A \W_74HC4511_0/Seg_2_i[5]  (.A(\Seg_2_i[6] ), .B(
        \W_74HC4511_0/N_115 ), .Y(\Seg_2_i[5] ));
    IOTRI_OB_EB \Seg_pad[6]/U0/U1  (.D(\Seg_2_i[6] ), .E(VCC), .DOUT(
        \Seg_pad[6]/U0/NET1 ), .EOUT(\Seg_pad[6]/U0/NET2 ));
    IOIN_IB \DataIn_0_pad[0]/U0/U1  (.YIN(\DataIn_0_pad[0]/U0/NET1 ), 
        .Y(\DataIn_0_c[0] ));
    AO1C \W_74HC148_0/DataOut_i_1_tz[0]  (.A(\DataIn_c[1] ), .B(
        \DataIn_c[2] ), .C(\DataIn_c[3] ), .Y(
        \W_74HC148_0/DataOut_i_1_tz[0]_net_1 ));
    IOIN_IB \DataIn_pad[1]/U0/U1  (.YIN(\DataIn_pad[1]/U0/NET1 ), .Y(
        \DataIn_c[1] ));
    OR2A \W_74HC4511_0/Seg_2_i_o2[4]  (.A(GS_c), .B(NAND2_1_Y), .Y(
        \W_74HC4511_0/N_91 ));
    NOR2 \W_74HC4511_0/Seg_2_i[6]  (.A(
        \W_74HC4511_0/Seg_2_i_1[6]_net_1 ), .B(
        \W_74HC4511_0/Seg_2_i_0[6]_net_1 ), .Y(\Seg_2_i[6] ));
    AO1B \W_74HC148_1/GS  (.A(\W_74HC148_1/un1_DataIn_1_net_1 ), .B(
        \W_74HC148_1/un1_DataIn_0_net_1 ), .C(GS_c), .Y(GS_0_c));
    OA1A \W_74HC148_1/DataOut_0_0[1]  (.A(
        \W_74HC148_1/un1_DataIn_3_net_1 ), .B(
        \W_74HC148_1/un1_DataIn_2_net_1 ), .C(
        \W_74HC148_1/un1_DataIn_4_net_1 ), .Y(
        \W_74HC148_1/DataOut_0_0[1]_net_1 ));
    IOTRI_OB_EB \Seg_pad[4]/U0/U1  (.D(\Seg_2_i[4] ), .E(VCC), .DOUT(
        \Seg_pad[4]/U0/NET1 ), .EOUT(\Seg_pad[4]/U0/NET2 ));
    IOPAD_IN \DataIn_0_pad[3]/U0/U0  (.PAD(DataIn_0[3]), .Y(
        \DataIn_0_pad[3]/U0/NET1 ));
    IOPAD_TRI \Seg_pad[5]/U0/U0  (.D(\Seg_pad[5]/U0/NET1 ), .E(
        \Seg_pad[5]/U0/NET2 ), .PAD(Seg[5]));
    IOPAD_IN \DataIn_0_pad[5]/U0/U0  (.PAD(DataIn_0[5]), .Y(
        \DataIn_0_pad[5]/U0/NET1 ));
    NOR3B \W_74HC4511_0/Seg_2_i_a5_0[6]  (.A(GS_c), .B(NAND2_1_Y), .C(
        \W_74HC4511_0/N_90 ), .Y(\W_74HC4511_0/N_110 ));
    IOTRI_OB_EB \Seg_pad[2]/U0/U1  (.D(\Seg_2_i[2] ), .E(VCC), .DOUT(
        \Seg_pad[2]/U0/NET1 ), .EOUT(\Seg_pad[2]/U0/NET2 ));
    IOIN_IB \DataIn_0_pad[7]/U0/U1  (.YIN(\DataIn_0_pad[7]/U0/NET1 ), 
        .Y(\DataIn_0_c[7] ));
    IOPAD_IN \DataIn_0_pad[1]/U0/U0  (.PAD(DataIn_0[1]), .Y(
        \DataIn_0_pad[1]/U0/NET1 ));
    IOIN_IB \DataIn_0_pad[4]/U0/U1  (.YIN(\DataIn_0_pad[4]/U0/NET1 ), 
        .Y(\DataIn_0_c[4] ));
    OA1C \W_74HC148_0/DataOut_i[0]  (.A(
        \W_74HC148_0/DataOut_i_1_tz[0]_net_1 ), .B(\W_74HC148_0/N_44 ), 
        .C(\W_74HC148_0/DataOut_i_0[0]_net_1 ), .Y(\DataOut_i[0] ));
    IOPAD_IN \DataIn_pad[5]/U0/U0  (.PAD(DataIn[5]), .Y(
        \DataIn_pad[5]/U0/NET1 ));
    IOTRI_OB_EB \EO_pad/U0/U1  (.D(\W_74HC148_1.DataOut62 ), .E(VCC), 
        .DOUT(\EO_pad/U0/NET1 ), .EOUT(\EO_pad/U0/NET2 ));
    IOPAD_IN \DataIn_pad[6]/U0/U0  (.PAD(DataIn[6]), .Y(
        \DataIn_pad[6]/U0/NET1 ));
    NAND2 NAND2_0 (.A(\DataOut_i[0] ), .B(\DataOut_i_0[0] ), .Y(
        NAND2_0_Y));
    AOI1B \W_74HC148_0/DataOut_i_a4_0[1]  (.A(\DataIn_c[2] ), .B(
        \DataIn_c[3] ), .C(\DataIn_c[4] ), .Y(
        \W_74HC148_0/DataOut_i_a4_0[1]_net_1 ));
    IOTRI_OB_EB \GS_pad/U0/U1  (.D(GS_c), .E(VCC), .DOUT(
        \GS_pad/U0/NET1 ), .EOUT(\GS_pad/U0/NET2 ));
    IOPAD_TRI \Seg_pad[6]/U0/U0  (.D(\Seg_pad[6]/U0/NET1 ), .E(
        \Seg_pad[6]/U0/NET2 ), .PAD(Seg[6]));
    IOPAD_TRI \GS_pad/U0/U0  (.D(\GS_pad/U0/NET1 ), .E(
        \GS_pad/U0/NET2 ), .PAD(GS));
    IOTRI_OB_EB \GS_0_pad/U0/U1  (.D(GS_0_c), .E(VCC), .DOUT(
        \GS_0_pad/U0/NET1 ), .EOUT(\GS_0_pad/U0/NET2 ));
    AO1C \W_74HC148_1/DataOut_i_o3[0]  (.A(\DataIn_0_c[1] ), .B(
        \DataIn_0_c[2] ), .C(\DataIn_0_c[3] ), .Y(\W_74HC148_1/N_45 ));
    OA1A \W_74HC4511_0/Seg_2_i_1[3]  (.A(\W_74HC4511_0/N_90 ), .B(
        \W_74HC4511_0/N_91 ), .C(W_HC85_0_QASB), .Y(\Seg_2_i_1[3] ));
    NOR2B \W_74HC148_1/un1_DataIn_3  (.A(\DataIn_0_c[4] ), .B(
        \DataIn_0_c[5] ), .Y(\W_74HC148_1/un1_DataIn_3_net_1 ));
    IOPAD_TRI \Seg_pad[4]/U0/U0  (.D(\Seg_pad[4]/U0/NET1 ), .E(
        \Seg_pad[4]/U0/NET2 ), .PAD(Seg[4]));
    IOTRI_OB_EB \Seg_pad[3]/U0/U1  (.D(\Seg_2_i[3] ), .E(VCC), .DOUT(
        \Seg_pad[3]/U0/NET1 ), .EOUT(\Seg_pad[3]/U0/NET2 ));
    AO1C NAND2_2 (.A(\W_74HC148_1/un1_DataIn_6_net_1 ), .B(GS_c), .C(
        \W_74HC148_0.N_42 ), .Y(NAND2_2_Y));
    AO1C \W_74HC148_0/DataOut_i_0[0]  (.A(\DataIn_c[5] ), .B(
        \DataIn_c[6] ), .C(\DataIn_c[7] ), .Y(
        \W_74HC148_0/DataOut_i_0[0]_net_1 ));
    NOR2B \W_74HC148_1/un1_DataIn_6  (.A(
        \W_74HC148_1/un1_DataIn_3_net_1 ), .B(
        \W_74HC148_1/un1_DataIn_4_net_1 ), .Y(
        \W_74HC148_1/un1_DataIn_6_net_1 ));
    OR2B \W_74HC148_0/DataOut_i_o4[2]  (.A(\DataIn_c[6] ), .B(
        \DataIn_c[4] ), .Y(\W_74HC148_0/N_44 ));
    IOPAD_TRI \Seg_pad[2]/U0/U0  (.D(\Seg_pad[2]/U0/NET1 ), .E(
        \Seg_pad[2]/U0/NET2 ), .PAD(Seg[2]));
    IOIN_IB \DataIn_pad[5]/U0/U1  (.YIN(\DataIn_pad[5]/U0/NET1 ), .Y(
        \DataIn_c[5] ));
    AO1C NAND2_1 (.A(\W_74HC148_1/DataOut_0_0[1]_net_1 ), .B(GS_c), .C(
        \DataOut_i[1] ), .Y(NAND2_1_Y));
    IOIN_IB \DataIn_pad[6]/U0/U1  (.YIN(\DataIn_pad[6]/U0/NET1 ), .Y(
        \DataIn_c[6] ));
    IOPAD_IN \DataIn_pad[7]/U0/U0  (.PAD(DataIn[7]), .Y(
        \DataIn_pad[7]/U0/NET1 ));
    IOPAD_IN \DataIn_pad[4]/U0/U0  (.PAD(DataIn[4]), .Y(
        \DataIn_pad[4]/U0/NET1 ));
    IOPAD_IN \DataIn_0_pad[0]/U0/U0  (.PAD(DataIn_0[0]), .Y(
        \DataIn_0_pad[0]/U0/NET1 ));
    AOI1 \W_74HC148_0/DataOut_i[1]  (.A(
        \W_74HC148_0/DataOut_i_a4_0[1]_net_1 ), .B(\DataIn_c[5] ), .C(
        \W_74HC148_0/DataOut_i_0[1]_net_1 ), .Y(\DataOut_i[1] ));
    IOPAD_IN \DataIn_pad[3]/U0/U0  (.PAD(DataIn[3]), .Y(
        \DataIn_pad[3]/U0/NET1 ));
    IOPAD_IN \DataIn_pad[2]/U0/U0  (.PAD(DataIn[2]), .Y(
        \DataIn_pad[2]/U0/NET1 ));
    IOPAD_IN \DataIn_0_pad[7]/U0/U0  (.PAD(DataIn_0[7]), .Y(
        \DataIn_0_pad[7]/U0/NET1 ));
    IOPAD_TRI \Seg_pad[3]/U0/U0  (.D(\Seg_pad[3]/U0/NET1 ), .E(
        \Seg_pad[3]/U0/NET2 ), .PAD(Seg[3]));
    IOPAD_IN \DataIn_0_pad[4]/U0/U0  (.PAD(DataIn_0[4]), .Y(
        \DataIn_0_pad[4]/U0/NET1 ));
    IOTRI_OB_EB \Seg_pad[0]/U0/U1  (.D(\Seg_2_i_1[3] ), .E(VCC), .DOUT(
        \Seg_pad[0]/U0/NET1 ), .EOUT(\Seg_pad[0]/U0/NET2 ));
    IOPAD_IN \DataIn_pad[0]/U0/U0  (.PAD(DataIn[0]), .Y(
        \DataIn_pad[0]/U0/NET1 ));
    NOR2B \W_74HC148_1/un1_DataIn_4  (.A(\DataIn_0_c[7] ), .B(
        \DataIn_0_c[6] ), .Y(\W_74HC148_1/un1_DataIn_4_net_1 ));
    IOIN_IB \DataIn_0_pad[2]/U0/U1  (.YIN(\DataIn_0_pad[2]/U0/NET1 ), 
        .Y(\DataIn_0_c[2] ));
    IOIN_IB \DataIn_pad[7]/U0/U1  (.YIN(\DataIn_pad[7]/U0/NET1 ), .Y(
        \DataIn_c[7] ));
    IOIN_IB \DataIn_pad[4]/U0/U1  (.YIN(\DataIn_pad[4]/U0/NET1 ), .Y(
        \DataIn_c[4] ));
    AO15 \W_74HC4511_0/Seg_2_i_0[1]  (.A(NAND2_0_Y), .B(
        \W_74HC4511_0/N_91 ), .C(NAND2_2_Y), .Y(
        \W_74HC4511_0/Seg_2_i_0[1]_net_1 ));
    NOR2B \W_74HC148_1/DataOut_i_a3_1_1[0]  (.A(\DataIn_0_c[4] ), .B(
        \DataIn_0_c[6] ), .Y(\W_74HC148_1/DataOut_i_a3_1[0] ));
    IOTRI_OB_EB \Seg_pad[7]/U0/U1  (.D(GND), .E(VCC), .DOUT(
        \Seg_pad[7]/U0/NET1 ), .EOUT(\Seg_pad[7]/U0/NET2 ));
    NOR3C \W_74HC148_0/un1_DataIn  (.A(\W_74HC148_0.N_42 ), .B(
        \DataIn_c[0] ), .C(\W_74HC148_0/un1_DataIn_0_net_1 ), .Y(GS_c));
    IOIN_IB \DataIn_pad[3]/U0/U1  (.YIN(\DataIn_pad[3]/U0/NET1 ), .Y(
        \DataIn_c[3] ));
    IOPAD_TRI \GS_0_pad/U0/U0  (.D(\GS_0_pad/U0/NET1 ), .E(
        \GS_0_pad/U0/NET2 ), .PAD(GS_0));
    IOIN_IB \DataIn_pad[2]/U0/U1  (.YIN(\DataIn_pad[2]/U0/NET1 ), .Y(
        \DataIn_c[2] ));
    OA1A \W_74HC148_1/DataOut_i_0[0]  (.A(\DataIn_0_c[7] ), .B(
        \W_74HC148_1/DataOut_i_a3_1_0[0]_net_1 ), .C(GS_c), .Y(
        \W_74HC148_1/DataOut_i_0[0]_net_1 ));
    IOIN_IB \DataIn_0_pad[6]/U0/U1  (.YIN(\DataIn_0_pad[6]/U0/NET1 ), 
        .Y(\DataIn_0_c[6] ));
    NOR2A \W_74HC4511_0/Seg_2_i_a2[5]  (.A(GS_c), .B(NAND2_2_Y), .Y(
        \W_74HC4511_0/N_115 ));
    NOR2A \W_74HC148_1/DataOut_i_a3_1_0[0]  (.A(\DataIn_0_c[6] ), .B(
        \DataIn_0_c[5] ), .Y(\W_74HC148_1/DataOut_i_a3_1_0[0]_net_1 ));
    IOIN_IB \DataIn_pad[0]/U0/U1  (.YIN(\DataIn_pad[0]/U0/NET1 ), .Y(
        \DataIn_c[0] ));
    NOR3B \W_74HC148_0/DataOut_i[2]  (.A(\DataIn_c[5] ), .B(
        \DataIn_c[7] ), .C(\W_74HC148_0/N_44 ), .Y(\W_74HC148_0.N_42 ));
    AOI1 \W_74HC148_1/DataOut_i[0]  (.A(
        \W_74HC148_1/DataOut_i_a3_1[0] ), .B(
        \W_74HC148_1/DataOut_i_a3_0[0] ), .C(
        \W_74HC148_1/DataOut_i_0[0]_net_1 ), .Y(\DataOut_i_0[0] ));
    IOPAD_TRI \Seg_pad[0]/U0/U0  (.D(\Seg_pad[0]/U0/NET1 ), .E(
        \Seg_pad[0]/U0/NET2 ), .PAD(Seg[0]));
    OR2B \W_74HC4511_0/Seg_2_i_o2[0]  (.A(NAND2_0_Y), .B(NAND2_2_Y), 
        .Y(\W_74HC4511_0/N_90 ));
    OA1A \W_74HC4511_0/Seg_2_i[2]  (.A(\W_74HC4511_0/N_115 ), .B(
        NAND2_0_Y), .C(W_HC85_0_QASB), .Y(\Seg_2_i[2] ));
    NOR3B \W_74HC4511_0/Seg_2_i[4]  (.A(W_HC85_0_QASB), .B(
        \W_74HC4511_0/N_91 ), .C(NAND2_0_Y), .Y(\Seg_2_i[4] ));
    IOPAD_TRI \Seg_pad[7]/U0/U0  (.D(\Seg_pad[7]/U0/NET1 ), .E(
        \Seg_pad[7]/U0/NET2 ), .PAD(Seg[7]));
    IOTRI_OB_EB \Seg_pad[1]/U0/U1  (.D(\Seg_2_i[1] ), .E(VCC), .DOUT(
        \Seg_pad[1]/U0/NET1 ), .EOUT(\Seg_pad[1]/U0/NET2 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
