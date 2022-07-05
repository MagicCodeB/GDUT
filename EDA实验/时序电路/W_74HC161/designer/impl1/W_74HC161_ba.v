`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module W_74HC161(
       MR_N,
       CP,
       CEP,
       CET,
       PE_N,
       D,
       Q,
       TC
    );
input  MR_N;
input  CP;
input  CEP;
input  CET;
input  PE_N;
input  [3:0] D;
output [3:0] Q;
output TC;

    wire MR_N_c, CP_c, CEP_c, CET_c, PE_N_c, \D_c[0] , \D_c[1] , 
        \D_c[2] , \D_c[3] , \Q_c[0] , \Q_c[1] , \Q_c[2] , \Q_c[3] , 
        TC_c, Qe, Q_n3_net_1, Q_n2_net_1, Q_n1_net_1, N_20, N_11, N_13, 
        N_15, TC_3, Q_6_0_net_1, TC_3_1, \MR_N_pad/U0/NET1 , 
        \Q_pad[2]/U0/NET1 , \Q_pad[2]/U0/NET2 , \D_pad[1]/U0/NET1 , 
        \D_pad[2]/U0/NET1 , \PE_N_pad/U0/NET1 , \Q_pad[3]/U0/NET1 , 
        \Q_pad[3]/U0/NET2 , \Q_pad[1]/U0/NET1 , \Q_pad[1]/U0/NET2 , 
        \Q_pad[0]/U0/NET1 , \Q_pad[0]/U0/NET2 , \D_pad[0]/U0/NET1 , 
        \CEP_pad/U0/NET1 , \CP_pad/U0/NET1 , \CET_pad/U0/NET1 , 
        \D_pad[3]/U0/NET1 , \TC_pad/U0/NET1 , \TC_pad/U0/NET2 , VCC, 
        \Q[1]/Y , \Q[0]/Y , \Q[3]/Y , \Q[2]/Y , AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    MX2 Q_9 (.A(\D_c[3] ), .B(\Q_c[3] ), .S(PE_N_c), .Y(N_15));
    MX2 \Q[3]/U0  (.A(\Q_c[3] ), .B(Q_n3_net_1), .S(Qe), .Y(\Q[3]/Y ));
    IOIN_IB \CEP_pad/U0/U1  (.YIN(\CEP_pad/U0/NET1 ), .Y(CEP_c));
    IOTRI_OB_EB \Q_pad[0]/U0/U1  (.D(\Q_c[0] ), .E(VCC), .DOUT(
        \Q_pad[0]/U0/NET1 ), .EOUT(\Q_pad[0]/U0/NET2 ));
    NOR2B \Q_RNIJ6QN[1]  (.A(\Q_c[1] ), .B(\Q_c[0] ), .Y(TC_3_1));
    MX2B Q_n0 (.A(\D_c[0] ), .B(\Q_c[0] ), .S(PE_N_c), .Y(N_20));
    IOTRI_OB_EB \Q_pad[1]/U0/U1  (.D(\Q_c[1] ), .E(VCC), .DOUT(
        \Q_pad[1]/U0/NET1 ), .EOUT(\Q_pad[1]/U0/NET2 ));
    IOPAD_IN \MR_N_pad/U0/U0  (.PAD(MR_N), .Y(\MR_N_pad/U0/NET1 ));
    IOPAD_TRI \Q_pad[3]/U0/U0  (.D(\Q_pad[3]/U0/NET1 ), .E(
        \Q_pad[3]/U0/NET2 ), .PAD(Q[3]));
    IOTRI_OB_EB \Q_pad[2]/U0/U1  (.D(\Q_c[2] ), .E(VCC), .DOUT(
        \Q_pad[2]/U0/NET1 ), .EOUT(\Q_pad[2]/U0/NET2 ));
    IOPAD_IN \CP_pad/U0/U0  (.PAD(CP), .Y(\CP_pad/U0/NET1 ));
    IOPAD_IN \D_pad[3]/U0/U0  (.PAD(D[3]), .Y(\D_pad[3]/U0/NET1 ));
    DFN0C0 \Q[2]/U1  (.D(\Q[2]/Y ), .CLK(CP_c), .CLR(MR_N_c), .Q(
        \Q_c[2] ));
    MX2 \Q[0]/U0  (.A(\Q_c[0] ), .B(N_20), .S(Qe), .Y(\Q[0]/Y ));
    IOIN_IB \D_pad[1]/U0/U1  (.YIN(\D_pad[1]/U0/NET1 ), .Y(\D_c[1] ));
    AX1C Q_n1 (.A(PE_N_c), .B(\Q_c[0] ), .C(N_11), .Y(Q_n1_net_1));
    DFN0C0 \Q[0]/U1  (.D(\Q[0]/Y ), .CLK(CP_c), .CLR(MR_N_c), .Q(
        \Q_c[0] ));
    IOPAD_TRI \Q_pad[0]/U0/U0  (.D(\Q_pad[0]/U0/NET1 ), .E(
        \Q_pad[0]/U0/NET2 ), .PAD(Q[0]));
    NOR3C \Q_RNIUNGJ1[1]  (.A(CET_c), .B(\Q_c[2] ), .C(TC_3_1), .Y(
        TC_3));
    AX1C Q_n3 (.A(PE_N_c), .B(TC_3), .C(N_15), .Y(Q_n3_net_1));
    AO1B Qlde (.A(CEP_c), .B(CET_c), .C(PE_N_c), .Y(Qe));
    IOIN_IB \D_pad[2]/U0/U1  (.YIN(\D_pad[2]/U0/NET1 ), .Y(\D_c[2] ));
    IOIN_IB \D_pad[0]/U0/U1  (.YIN(\D_pad[0]/U0/NET1 ), .Y(\D_c[0] ));
    IOPAD_TRI \Q_pad[1]/U0/U0  (.D(\Q_pad[1]/U0/NET1 ), .E(
        \Q_pad[1]/U0/NET2 ), .PAD(Q[1]));
    DFN0C0 \Q[1]/U1  (.D(\Q[1]/Y ), .CLK(CP_c), .CLR(MR_N_c), .Q(
        \Q_c[1] ));
    IOTRI_OB_EB \TC_pad/U0/U1  (.D(TC_c), .E(VCC), .DOUT(
        \TC_pad/U0/NET1 ), .EOUT(\TC_pad/U0/NET2 ));
    IOPAD_TRI \TC_pad/U0/U0  (.D(\TC_pad/U0/NET1 ), .E(
        \TC_pad/U0/NET2 ), .PAD(TC));
    IOPAD_IN \CEP_pad/U0/U0  (.PAD(CEP), .Y(\CEP_pad/U0/NET1 ));
    IOPAD_TRI \Q_pad[2]/U0/U0  (.D(\Q_pad[2]/U0/NET1 ), .E(
        \Q_pad[2]/U0/NET2 ), .PAD(Q[2]));
    IOIN_IB \PE_N_pad/U0/U1  (.YIN(\PE_N_pad/U0/NET1 ), .Y(PE_N_c));
    MX2 Q_5 (.A(\D_c[1] ), .B(\Q_c[1] ), .S(PE_N_c), .Y(N_11));
    NOR2B TC_pad_RNO (.A(TC_3), .B(\Q_c[3] ), .Y(TC_c));
    IOPAD_IN \D_pad[1]/U0/U0  (.PAD(D[1]), .Y(\D_pad[1]/U0/NET1 ));
    MX2 \Q[1]/U0  (.A(\Q_c[1] ), .B(Q_n1_net_1), .S(Qe), .Y(\Q[1]/Y ));
    MX2 Q_7 (.A(\D_c[2] ), .B(\Q_c[2] ), .S(PE_N_c), .Y(N_13));
    IOPAD_IN \PE_N_pad/U0/U0  (.PAD(PE_N), .Y(\PE_N_pad/U0/NET1 ));
    IOIN_IB \CET_pad/U0/U1  (.YIN(\CET_pad/U0/NET1 ), .Y(CET_c));
    MX2 \Q[2]/U0  (.A(\Q_c[2] ), .B(Q_n2_net_1), .S(Qe), .Y(\Q[2]/Y ));
    IOPAD_IN \CET_pad/U0/U0  (.PAD(CET), .Y(\CET_pad/U0/NET1 ));
    CLKIO \CP_pad/U0/U1  (.A(\CP_pad/U0/NET1 ), .Y(CP_c));
    IOTRI_OB_EB \Q_pad[3]/U0/U1  (.D(\Q_c[3] ), .E(VCC), .DOUT(
        \Q_pad[3]/U0/NET1 ), .EOUT(\Q_pad[3]/U0/NET2 ));
    AX1C Q_n2 (.A(\Q_c[0] ), .B(Q_6_0_net_1), .C(N_13), .Y(Q_n2_net_1));
    IOPAD_IN \D_pad[2]/U0/U0  (.PAD(D[2]), .Y(\D_pad[2]/U0/NET1 ));
    IOIN_IB \D_pad[3]/U0/U1  (.YIN(\D_pad[3]/U0/NET1 ), .Y(\D_c[3] ));
    DFN0C0 \Q[3]/U1  (.D(\Q[3]/Y ), .CLK(CP_c), .CLR(MR_N_c), .Q(
        \Q_c[3] ));
    IOIN_IB \MR_N_pad/U0/U1  (.YIN(\MR_N_pad/U0/NET1 ), .Y(MR_N_c));
    IOPAD_IN \D_pad[0]/U0/U0  (.PAD(D[0]), .Y(\D_pad[0]/U0/NET1 ));
    NOR2B Q_6_0 (.A(PE_N_c), .B(\Q_c[1] ), .Y(Q_6_0_net_1));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
