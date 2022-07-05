`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module Compare2come(
       DataA,
       DataB,
       AGEB
    );
input  [7:0] DataA;
input  [7:0] DataB;
output AGEB;

    wire \Comparator_0_DataOut[1] , \Comparator_0_DataOut[2] , 
        \Comparator_0_DataOut[3] , \Comparator_0_DataOut[4] , 
        \Comparator_0_DataOut[5] , \Comparator_0_DataOut[6] , 
        \Comparator_0_DataOut[7] , \Comparator_1_DataOut[1] , 
        \Comparator_1_DataOut[2] , \Comparator_1_DataOut[3] , 
        \Comparator_1_DataOut[4] , \Comparator_1_DataOut[5] , 
        \Comparator_1_DataOut[6] , \Comparator_1_DataOut[7] , 
        \DataA_c[0] , \DataA_c[1] , \DataA_c[2] , \DataA_c[3] , 
        \DataA_c[4] , \DataA_c[5] , \DataA_c[6] , \DataA_c[7] , 
        \DataB_c[0] , \DataB_c[1] , \DataB_c[2] , \DataB_c[3] , 
        \DataB_c[4] , \DataB_c[5] , \DataB_c[6] , \DataB_c[7] , AGEB_c, 
        \newCore_0/le_OUT , \newCore_0/AND3_0_Y , \newCore_0/AO1D_0_Y , 
        \newCore_0/NAND3A_0_Y , \newCore_0/U1 , \newCore_0/XNOR2_1_Y , 
        \newCore_0/OR2A_1_Y , \newCore_0/NOR3A_0_Y , 
        \newCore_0/OR2A_2_Y , \newCore_0/NAND3A_1_Y , \newCore_0/U2 , 
        \newCore_0/XNOR2_2_Y , \newCore_0/XNOR2_0_Y , 
        \newCore_0/AO1C_1_Y , \newCore_0/AO1C_0_Y , 
        \newCore_0/NOR2A_0_Y , \newCore_0/OR2A_3_Y , 
        \newCore_0/OR2A_0_Y , \newCore_0/AO1C_4_Y , 
        \newCore_0/AO1C_2_Y , \newCore_0/AO1C_5_Y , 
        \newCore_0/AO1C_3_Y , \Comparator_1/DWACT_FINC_E[0] , 
        \Comparator_1/I_19_0 , \Comparator_1/I_17_0 , 
        \Comparator_1/I_14_0 , \Comparator_1/I_12_0 , 
        \Comparator_1/I_9_0 , \Comparator_1/I_7_0 , 
        \Comparator_1/I_5_0 , \Comparator_1/DWACT_FINC_E[2] , 
        \Comparator_1/N_3 , \Comparator_1/DWACT_FINC_E[1] , 
        \Comparator_1/N_4 , \Comparator_1/N_6 , 
        \Comparator_0/DWACT_FINC_E[0] , \Comparator_0/I_19 , 
        \Comparator_0/I_17 , \Comparator_0/I_14 , \Comparator_0/I_12 , 
        \Comparator_0/I_9 , \Comparator_0/I_7 , \Comparator_0/I_5 , 
        \Comparator_0/DWACT_FINC_E[2] , \Comparator_0/N_3 , 
        \Comparator_0/DWACT_FINC_E[1] , \Comparator_0/N_4 , 
        \Comparator_0/N_6 , \DataB_pad[1]/U0/NET1 , \AGEB_pad/U0/NET1 , 
        \AGEB_pad/U0/NET2 , VCC, \DataB_pad[2]/U0/NET1 , 
        \DataB_pad[0]/U0/NET1 , \DataA_pad[0]/U0/NET1 , 
        \DataA_pad[3]/U0/NET1 , \DataA_pad[6]/U0/NET1 , 
        \DataB_pad[3]/U0/NET1 , \DataA_pad[5]/U0/NET1 , 
        \DataA_pad[1]/U0/NET1 , \DataB_pad[6]/U0/NET1 , 
        \DataB_pad[7]/U0/NET1 , \DataA_pad[4]/U0/NET1 , 
        \DataA_pad[7]/U0/NET1 , \DataB_pad[5]/U0/NET1 , 
        \DataA_pad[2]/U0/NET1 , \DataB_pad[4]/U0/NET1 , GND, 
        AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    NOR2B \Comparator_1/DataOut_1[7]  (.A(\DataB_c[7] ), .B(
        \Comparator_1/I_19_0 ), .Y(\Comparator_1_DataOut[7] ));
    XNOR2 \Comparator_0/un1_DataOut_I_17  (.A(\DataA_c[6] ), .B(
        \Comparator_0/N_3 ), .Y(\Comparator_0/I_17 ));
    OR2A \newCore_0/OR2A_1  (.A(\Comparator_1_DataOut[1] ), .B(
        \Comparator_0_DataOut[1] ), .Y(\newCore_0/OR2A_1_Y ));
    IOPAD_IN \DataB_pad[7]/U0/U0  (.PAD(DataB[7]), .Y(
        \DataB_pad[7]/U0/NET1 ));
    IOTRI_OB_EB \AGEB_pad/U0/U1  (.D(AGEB_c), .E(VCC), .DOUT(
        \AGEB_pad/U0/NET1 ), .EOUT(\AGEB_pad/U0/NET2 ));
    NOR3B \Comparator_1/un1_DataOut_I_16  (.A(
        \Comparator_1/DWACT_FINC_E[1] ), .B(
        \Comparator_1/DWACT_FINC_E[0] ), .C(\DataB_c[5] ), .Y(
        \Comparator_1/N_3 ));
    XNOR2 \newCore_0/XNOR2_0  (.A(\Comparator_1_DataOut[5] ), .B(
        \Comparator_0_DataOut[5] ), .Y(\newCore_0/XNOR2_0_Y ));
    OR2A \newCore_0/OR2A_2  (.A(\Comparator_1_DataOut[6] ), .B(
        \Comparator_0_DataOut[6] ), .Y(\newCore_0/OR2A_2_Y ));
    IOIN_IB \DataB_pad[7]/U0/U1  (.YIN(\DataB_pad[7]/U0/NET1 ), .Y(
        \DataB_c[7] ));
    MX2 \Comparator_1/DataOut_1[5]  (.A(\DataB_c[5] ), .B(
        \Comparator_1/I_14_0 ), .S(\DataB_c[7] ), .Y(
        \Comparator_1_DataOut[5] ));
    MX2 \Comparator_1/DataOut_1[4]  (.A(\DataB_c[4] ), .B(
        \Comparator_1/I_12_0 ), .S(\DataB_c[7] ), .Y(
        \Comparator_1_DataOut[4] ));
    AX1A \Comparator_0/un1_DataOut_I_12  (.A(\DataA_c[3] ), .B(
        \Comparator_0/DWACT_FINC_E[0] ), .C(\DataA_c[4] ), .Y(
        \Comparator_0/I_12 ));
    MX2 \Comparator_1/DataOut_1[1]  (.A(\DataB_c[1] ), .B(
        \Comparator_1/I_5_0 ), .S(\DataB_c[7] ), .Y(
        \Comparator_1_DataOut[1] ));
    NOR2 \Comparator_0/un1_DataOut_I_15  (.A(\DataA_c[3] ), .B(
        \DataA_c[4] ), .Y(\Comparator_0/DWACT_FINC_E[1] ));
    AO1C \newCore_0/AO1C_0  (.A(\DataA_c[0] ), .B(\DataB_c[0] ), .C(
        \newCore_0/OR2A_1_Y ), .Y(\newCore_0/AO1C_0_Y ));
    OR3B \Comparator_1/un1_DataOut_I_19  (.A(
        \Comparator_1/DWACT_FINC_E[0] ), .B(
        \Comparator_1/DWACT_FINC_E[2] ), .C(\DataB_c[6] ), .Y(
        \Comparator_1/I_19_0 ));
    IOPAD_IN \DataA_pad[5]/U0/U0  (.PAD(DataA[5]), .Y(
        \DataA_pad[5]/U0/NET1 ));
    IOPAD_IN \DataA_pad[2]/U0/U0  (.PAD(DataA[2]), .Y(
        \DataA_pad[2]/U0/NET1 ));
    MX2 \Comparator_0/DataOut_1[4]  (.A(\DataA_c[4] ), .B(
        \Comparator_0/I_12 ), .S(\DataA_c[7] ), .Y(
        \Comparator_0_DataOut[4] ));
    XNOR2 \newCore_0/XNOR2_2  (.A(\Comparator_1_DataOut[6] ), .B(
        \Comparator_0_DataOut[6] ), .Y(\newCore_0/XNOR2_2_Y ));
    IOPAD_IN \DataA_pad[0]/U0/U0  (.PAD(DataA[0]), .Y(
        \DataA_pad[0]/U0/NET1 ));
    XNOR2 \Comparator_1/un1_DataOut_I_14  (.A(\DataB_c[5] ), .B(
        \Comparator_1/N_4 ), .Y(\Comparator_1/I_14_0 ));
    AND3 \newCore_0/AND3_0  (.A(\newCore_0/XNOR2_1_Y ), .B(
        \newCore_0/XNOR2_0_Y ), .C(\newCore_0/XNOR2_2_Y ), .Y(
        \newCore_0/AND3_0_Y ));
    AO1C \newCore_0/AO1C_2  (.A(\Comparator_0_DataOut[3] ), .B(
        \Comparator_1_DataOut[3] ), .C(\newCore_0/AO1C_3_Y ), .Y(
        \newCore_0/AO1C_2_Y ));
    IOIN_IB \DataA_pad[5]/U0/U1  (.YIN(\DataA_pad[5]/U0/NET1 ), .Y(
        \DataA_c[5] ));
    IOIN_IB \DataA_pad[2]/U0/U1  (.YIN(\DataA_pad[2]/U0/NET1 ), .Y(
        \DataA_c[2] ));
    XOR2 \Comparator_1/un1_DataOut_I_5  (.A(\DataB_c[0] ), .B(
        \DataB_c[1] ), .Y(\Comparator_1/I_5_0 ));
    NAND3A \newCore_0/NAND3A_1  (.A(\Comparator_0_DataOut[5] ), .B(
        \Comparator_1_DataOut[5] ), .C(\newCore_0/OR2A_3_Y ), .Y(
        \newCore_0/NAND3A_1_Y ));
    MX2 \Comparator_0/DataOut_1[1]  (.A(\DataA_c[1] ), .B(
        \Comparator_0/I_5 ), .S(\DataA_c[7] ), .Y(
        \Comparator_0_DataOut[1] ));
    IOIN_IB \DataA_pad[0]/U0/U1  (.YIN(\DataA_pad[0]/U0/NET1 ), .Y(
        \DataA_c[0] ));
    AX1D \Comparator_0/un1_DataOut_I_7  (.A(\DataA_c[0] ), .B(
        \DataA_c[1] ), .C(\DataA_c[2] ), .Y(\Comparator_0/I_7 ));
    NOR3A \Comparator_0/un1_DataOut_I_13  (.A(
        \Comparator_0/DWACT_FINC_E[0] ), .B(\DataA_c[3] ), .C(
        \DataA_c[4] ), .Y(\Comparator_0/N_4 ));
    MX2 \Comparator_1/DataOut_1[2]  (.A(\DataB_c[2] ), .B(
        \Comparator_1/I_7_0 ), .S(\DataB_c[7] ), .Y(
        \Comparator_1_DataOut[2] ));
    AOI1 \newCore_0/AOI1_le_OUT  (.A(\newCore_0/AND3_0_Y ), .B(
        \newCore_0/AO1D_0_Y ), .C(\newCore_0/NAND3A_0_Y ), .Y(
        \newCore_0/le_OUT ));
    NOR3 \Comparator_1/un1_DataOut_I_18  (.A(\DataB_c[5] ), .B(
        \DataB_c[4] ), .C(\DataB_c[3] ), .Y(
        \Comparator_1/DWACT_FINC_E[2] ));
    MX2 \Comparator_0/DataOut_1[3]  (.A(\DataA_c[3] ), .B(
        \Comparator_0/I_9 ), .S(\DataA_c[7] ), .Y(
        \Comparator_0_DataOut[3] ));
    NOR3 \Comparator_0/un1_DataOut_I_10  (.A(\DataA_c[1] ), .B(
        \DataA_c[0] ), .C(\DataA_c[2] ), .Y(
        \Comparator_0/DWACT_FINC_E[0] ));
    IOPAD_IN \DataB_pad[2]/U0/U0  (.PAD(DataB[2]), .Y(
        \DataB_pad[2]/U0/NET1 ));
    IOPAD_IN \DataB_pad[6]/U0/U0  (.PAD(DataB[6]), .Y(
        \DataB_pad[6]/U0/NET1 ));
    NOR3 \Comparator_1/un1_DataOut_I_8  (.A(\DataB_c[1] ), .B(
        \DataB_c[0] ), .C(\DataB_c[2] ), .Y(\Comparator_1/N_6 ));
    XOR2 \Comparator_0/un1_DataOut_I_5  (.A(\DataA_c[0] ), .B(
        \DataA_c[1] ), .Y(\Comparator_0/I_5 ));
    MX2 \Comparator_1/DataOut_1[6]  (.A(\DataB_c[6] ), .B(
        \Comparator_1/I_17_0 ), .S(\DataB_c[7] ), .Y(
        \Comparator_1_DataOut[6] ));
    AO1D \newCore_0/AO1D_0  (.A(\newCore_0/AO1C_1_Y ), .B(
        \newCore_0/AO1C_4_Y ), .C(\newCore_0/AO1C_2_Y ), .Y(
        \newCore_0/AO1D_0_Y ));
    MX2 \Comparator_0/DataOut_1[2]  (.A(\DataA_c[2] ), .B(
        \Comparator_0/I_7 ), .S(\DataA_c[7] ), .Y(
        \Comparator_0_DataOut[2] ));
    IOIN_IB \DataB_pad[2]/U0/U1  (.YIN(\DataB_pad[2]/U0/NET1 ), .Y(
        \DataB_c[2] ));
    AO1C \newCore_0/AO1C_5  (.A(\Comparator_1_DataOut[5] ), .B(
        \Comparator_0_DataOut[5] ), .C(\Comparator_1_DataOut[4] ), .Y(
        \newCore_0/AO1C_5_Y ));
    AO1 \newCore_0/AND_AO21  (.A(\newCore_0/le_OUT ), .B(
        \newCore_0/U1 ), .C(\newCore_0/U2 ), .Y(AGEB_c));
    IOIN_IB \DataB_pad[6]/U0/U1  (.YIN(\DataB_pad[6]/U0/NET1 ), .Y(
        \DataB_c[6] ));
    OR2A \newCore_0/OR2A_0  (.A(\Comparator_0_DataOut[1] ), .B(
        \Comparator_1_DataOut[1] ), .Y(\newCore_0/OR2A_0_Y ));
    OR2A \newCore_0/OR2A_3  (.A(\Comparator_0_DataOut[6] ), .B(
        \Comparator_1_DataOut[6] ), .Y(\newCore_0/OR2A_3_Y ));
    XNOR2 \Comparator_1/un1_DataOut_I_17  (.A(\DataB_c[6] ), .B(
        \Comparator_1/N_3 ), .Y(\Comparator_1/I_17_0 ));
    IOPAD_TRI \AGEB_pad/U0/U0  (.D(\AGEB_pad/U0/NET1 ), .E(
        \AGEB_pad/U0/NET2 ), .PAD(AGEB));
    IOPAD_IN \DataA_pad[1]/U0/U0  (.PAD(DataA[1]), .Y(
        \DataA_pad[1]/U0/NET1 ));
    NAND3A \newCore_0/NAND3A_0  (.A(\newCore_0/NOR3A_0_Y ), .B(
        \newCore_0/OR2A_2_Y ), .C(\newCore_0/NAND3A_1_Y ), .Y(
        \newCore_0/NAND3A_0_Y ));
    IOPAD_IN \DataB_pad[4]/U0/U0  (.PAD(DataB[4]), .Y(
        \DataB_pad[4]/U0/NET1 ));
    NOR2B \Comparator_0/DataOut_1[7]  (.A(\DataA_c[7] ), .B(
        \Comparator_0/I_19 ), .Y(\Comparator_0_DataOut[7] ));
    IOIN_IB \DataA_pad[1]/U0/U1  (.YIN(\DataA_pad[1]/U0/NET1 ), .Y(
        \DataA_c[1] ));
    MX2 \Comparator_0/DataOut_1[6]  (.A(\DataA_c[6] ), .B(
        \Comparator_0/I_17 ), .S(\DataA_c[7] ), .Y(
        \Comparator_0_DataOut[6] ));
    IOPAD_IN \DataA_pad[3]/U0/U0  (.PAD(DataA[3]), .Y(
        \DataA_pad[3]/U0/NET1 ));
    AX1A \Comparator_1/un1_DataOut_I_12  (.A(\DataB_c[3] ), .B(
        \Comparator_1/DWACT_FINC_E[0] ), .C(\DataB_c[4] ), .Y(
        \Comparator_1/I_12_0 ));
    IOPAD_IN \DataA_pad[4]/U0/U0  (.PAD(DataA[4]), .Y(
        \DataA_pad[4]/U0/NET1 ));
    NOR2 \Comparator_1/un1_DataOut_I_15  (.A(\DataB_c[4] ), .B(
        \DataB_c[3] ), .Y(\Comparator_1/DWACT_FINC_E[1] ));
    XNOR2 \Comparator_1/un1_DataOut_I_9  (.A(\DataB_c[3] ), .B(
        \Comparator_1/N_6 ), .Y(\Comparator_1/I_9_0 ));
    NOR3 \Comparator_0/un1_DataOut_I_8  (.A(\DataA_c[1] ), .B(
        \DataA_c[0] ), .C(\DataA_c[2] ), .Y(\Comparator_0/N_6 ));
    NOR3B \Comparator_0/un1_DataOut_I_16  (.A(
        \Comparator_0/DWACT_FINC_E[1] ), .B(
        \Comparator_0/DWACT_FINC_E[0] ), .C(\DataA_c[5] ), .Y(
        \Comparator_0/N_3 ));
    IOIN_IB \DataB_pad[4]/U0/U1  (.YIN(\DataB_pad[4]/U0/NET1 ), .Y(
        \DataB_c[4] ));
    IOPAD_IN \DataB_pad[3]/U0/U0  (.PAD(DataB[3]), .Y(
        \DataB_pad[3]/U0/NET1 ));
    IOIN_IB \DataA_pad[3]/U0/U1  (.YIN(\DataA_pad[3]/U0/NET1 ), .Y(
        \DataA_c[3] ));
    IOPAD_IN \DataA_pad[6]/U0/U0  (.PAD(DataA[6]), .Y(
        \DataA_pad[6]/U0/NET1 ));
    IOIN_IB \DataA_pad[4]/U0/U1  (.YIN(\DataA_pad[4]/U0/NET1 ), .Y(
        \DataA_c[4] ));
    OR3B \Comparator_0/un1_DataOut_I_19  (.A(
        \Comparator_0/DWACT_FINC_E[0] ), .B(
        \Comparator_0/DWACT_FINC_E[2] ), .C(\DataA_c[6] ), .Y(
        \Comparator_0/I_19 ));
    AND2A \newCore_0/AND_SIGN  (.A(\Comparator_0_DataOut[7] ), .B(
        \Comparator_1_DataOut[7] ), .Y(\newCore_0/U2 ));
    AO1C \newCore_0/AO1C_1  (.A(\Comparator_1_DataOut[3] ), .B(
        \Comparator_0_DataOut[3] ), .C(\newCore_0/AO1C_0_Y ), .Y(
        \newCore_0/AO1C_1_Y ));
    IOIN_IB \DataB_pad[3]/U0/U1  (.YIN(\DataB_pad[3]/U0/NET1 ), .Y(
        \DataB_c[3] ));
    IOPAD_IN \DataB_pad[1]/U0/U0  (.PAD(DataB[1]), .Y(
        \DataB_pad[1]/U0/NET1 ));
    XNOR2 \Comparator_0/un1_DataOut_I_14  (.A(\DataA_c[5] ), .B(
        \Comparator_0/N_4 ), .Y(\Comparator_0/I_14 ));
    NOR3A \Comparator_1/un1_DataOut_I_13  (.A(
        \Comparator_1/DWACT_FINC_E[0] ), .B(\DataB_c[4] ), .C(
        \DataB_c[3] ), .Y(\Comparator_1/N_4 ));
    IOIN_IB \DataA_pad[6]/U0/U1  (.YIN(\DataA_pad[6]/U0/NET1 ), .Y(
        \DataA_c[6] ));
    MX2 \Comparator_1/DataOut_1[3]  (.A(\DataB_c[3] ), .B(
        \Comparator_1/I_9_0 ), .S(\DataB_c[7] ), .Y(
        \Comparator_1_DataOut[3] ));
    XNOR2 \newCore_0/XNOR2_1  (.A(\Comparator_1_DataOut[4] ), .B(
        \Comparator_0_DataOut[4] ), .Y(\newCore_0/XNOR2_1_Y ));
    IOPAD_IN \DataB_pad[0]/U0/U0  (.PAD(DataB[0]), .Y(
        \DataB_pad[0]/U0/NET1 ));
    IOIN_IB \DataB_pad[1]/U0/U1  (.YIN(\DataB_pad[1]/U0/NET1 ), .Y(
        \DataB_c[1] ));
    IOPAD_IN \DataA_pad[7]/U0/U0  (.PAD(DataA[7]), .Y(
        \DataA_pad[7]/U0/NET1 ));
    NOR3 \Comparator_1/un1_DataOut_I_10  (.A(\DataB_c[1] ), .B(
        \DataB_c[0] ), .C(\DataB_c[2] ), .Y(
        \Comparator_1/DWACT_FINC_E[0] ));
    MX2 \Comparator_0/DataOut_1[5]  (.A(\DataA_c[5] ), .B(
        \Comparator_0/I_14 ), .S(\DataA_c[7] ), .Y(
        \Comparator_0_DataOut[5] ));
    XNOR2 \Comparator_0/un1_DataOut_I_9  (.A(\DataA_c[3] ), .B(
        \Comparator_0/N_6 ), .Y(\Comparator_0/I_9 ));
    AX1D \Comparator_1/un1_DataOut_I_7  (.A(\DataB_c[0] ), .B(
        \DataB_c[1] ), .C(\DataB_c[2] ), .Y(\Comparator_1/I_7_0 ));
    NOR3A \newCore_0/NOR3A_0  (.A(\newCore_0/OR2A_3_Y ), .B(
        \newCore_0/AO1C_5_Y ), .C(\Comparator_0_DataOut[4] ), .Y(
        \newCore_0/NOR3A_0_Y ));
    IOPAD_IN \DataB_pad[5]/U0/U0  (.PAD(DataB[5]), .Y(
        \DataB_pad[5]/U0/NET1 ));
    NOR3 \Comparator_0/un1_DataOut_I_18  (.A(\DataA_c[4] ), .B(
        \DataA_c[3] ), .C(\DataA_c[5] ), .Y(
        \Comparator_0/DWACT_FINC_E[2] ));
    IOIN_IB \DataB_pad[0]/U0/U1  (.YIN(\DataB_pad[0]/U0/NET1 ), .Y(
        \DataB_c[0] ));
    AO1C \newCore_0/AO1C_4  (.A(\Comparator_1_DataOut[2] ), .B(
        \Comparator_0_DataOut[2] ), .C(\newCore_0/OR2A_0_Y ), .Y(
        \newCore_0/AO1C_4_Y ));
    IOIN_IB \DataA_pad[7]/U0/U1  (.YIN(\DataA_pad[7]/U0/NET1 ), .Y(
        \DataA_c[7] ));
    NOR2A \newCore_0/NOR2A_0  (.A(\Comparator_1_DataOut[2] ), .B(
        \Comparator_0_DataOut[2] ), .Y(\newCore_0/NOR2A_0_Y ));
    OR2A \newCore_0/OR_SIGN  (.A(\Comparator_0_DataOut[7] ), .B(
        \Comparator_1_DataOut[7] ), .Y(\newCore_0/U1 ));
    AO1C \newCore_0/AO1C_3  (.A(\Comparator_1_DataOut[3] ), .B(
        \Comparator_0_DataOut[3] ), .C(\newCore_0/NOR2A_0_Y ), .Y(
        \newCore_0/AO1C_3_Y ));
    IOIN_IB \DataB_pad[5]/U0/U1  (.YIN(\DataB_pad[5]/U0/NET1 ), .Y(
        \DataB_c[5] ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
