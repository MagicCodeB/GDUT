`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module W_74HC112(
       S,
       R,
       CLK,
       J,
       K,
       Q,
       Qn
    );
input  S;
input  R;
input  CLK;
input  J;
input  K;
output Q;
output Qn;

    wire GND, temp210, temp2_net_1, temp1_net_1, S_c, R_c, CLK_c, J_c, 
        K_c, Q_c, temp1_3, temp113, Q_c_i, S_c_i, \R_pad/U0/NET1 , 
        \CLK_pad/U0/NET1 , \K_pad/U0/NET1 , \J_pad/U0/NET1 , 
        \Q_pad/U0/NET1 , \Q_pad/U0/NET2 , \S_pad/U0/NET1 , 
        \Qn_pad/U0/NET1 , \Qn_pad/U0/NET2 , VCC, AFLSDF_VCC, 
        AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    MX2B temp1_RNO (.A(J_c), .B(K_c), .S(temp1_net_1), .Y(temp1_3));
    DFN0E1 temp1 (.D(temp1_3), .CLK(CLK_c), .E(temp113), .Q(
        temp1_net_1));
    IOIN_IB \J_pad/U0/U1  (.YIN(\J_pad/U0/NET1 ), .Y(J_c));
    IOPAD_TRI \Qn_pad/U0/U0  (.D(\Qn_pad/U0/NET1 ), .E(
        \Qn_pad/U0/NET2 ), .PAD(Qn));
    IOPAD_IN \R_pad/U0/U0  (.PAD(R), .Y(\R_pad/U0/NET1 ));
    IOPAD_IN \J_pad/U0/U0  (.PAD(J), .Y(\J_pad/U0/NET1 ));
    IOIN_IB \K_pad/U0/U1  (.YIN(\K_pad/U0/NET1 ), .Y(K_c));
    IOPAD_IN \S_pad/U0/U0  (.PAD(S), .Y(\S_pad/U0/NET1 ));
    IOIN_IB \R_pad/U0/U1  (.YIN(\R_pad/U0/NET1 ), .Y(R_c));
    INV Qn_pad_RNO (.A(Q_c), .Y(Q_c_i));
    IOPAD_IN \CLK_pad/U0/U0  (.PAD(CLK), .Y(\CLK_pad/U0/NET1 ));
    IOPAD_IN \K_pad/U0/U0  (.PAD(K), .Y(\K_pad/U0/NET1 ));
    IOTRI_OB_EB \Qn_pad/U0/U1  (.D(Q_c_i), .E(VCC), .DOUT(
        \Qn_pad/U0/NET1 ), .EOUT(\Qn_pad/U0/NET2 ));
    DLN1P1C1 temp2 (.D(GND), .G(GND), .PRE(S_c_i), .CLR(temp210), .Q(
        temp2_net_1));
    IOIN_IB \S_pad/U0/U1  (.YIN(\S_pad/U0/NET1 ), .Y(S_c));
    MX2 temp2_RNISU0T (.A(temp2_net_1), .B(temp1_net_1), .S(temp113), 
        .Y(Q_c));
    IOTRI_OB_EB \Q_pad/U0/U1  (.D(Q_c), .E(VCC), .DOUT(\Q_pad/U0/NET1 )
        , .EOUT(\Q_pad/U0/NET2 ));
    INV temp2_RNO_0 (.A(S_c), .Y(S_c_i));
    NOR2A temp2_RNO (.A(S_c), .B(R_c), .Y(temp210));
    NOR2B R_pad_RNIDEJB (.A(S_c), .B(R_c), .Y(temp113));
    IOPAD_TRI \Q_pad/U0/U0  (.D(\Q_pad/U0/NET1 ), .E(\Q_pad/U0/NET2 ), 
        .PAD(Q));
    IOIN_IB \CLK_pad/U0/U1  (.YIN(\CLK_pad/U0/NET1 ), .Y(CLK_c));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
