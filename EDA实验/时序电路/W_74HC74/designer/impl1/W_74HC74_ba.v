`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module W_74HC74(
       S,
       R,
       CLK,
       D,
       Q,
       Qn
    );
input  S;
input  R;
input  CLK;
input  D;
output Q;
output Qn;

    wire Qn_RNO_net_1, Q_RNO_net_1, S_c, R_c, CLK_c, D_c, Q_c, Qn_c, 
        D_c_i, R_c_i, S_c_i, \Q_pad/U0/NET1 , \Q_pad/U0/NET2 , 
        \D_pad/U0/NET1 , \Qn_pad/U0/NET1 , \Qn_pad/U0/NET2 , VCC, 
        \R_pad/U0/NET1 , \S_pad/U0/NET1 , \CLK_pad/U0/NET1 , 
        AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    NOR2A Qn_RNO (.A(R_c), .B(S_c), .Y(Qn_RNO_net_1));
    NOR2A Q_RNO (.A(S_c), .B(R_c), .Y(Q_RNO_net_1));
    IOPAD_TRI \Qn_pad/U0/U0  (.D(\Qn_pad/U0/NET1 ), .E(
        \Qn_pad/U0/NET2 ), .PAD(Qn));
    IOPAD_IN \R_pad/U0/U0  (.PAD(R), .Y(\R_pad/U0/NET1 ));
    DFN1P1C1 Q_inst_1 (.D(D_c), .CLK(CLK_c), .PRE(S_c_i), .CLR(
        Q_RNO_net_1), .Q(Q_c));
    IOPAD_IN \S_pad/U0/U0  (.PAD(S), .Y(\S_pad/U0/NET1 ));
    IOIN_IB \R_pad/U0/U1  (.YIN(\R_pad/U0/NET1 ), .Y(R_c));
    INV Qn_RNO_1 (.A(R_c), .Y(R_c_i));
    INV Qn_RNO_0 (.A(D_c), .Y(D_c_i));
    IOPAD_IN \CLK_pad/U0/U0  (.PAD(CLK), .Y(\CLK_pad/U0/NET1 ));
    DFN1P1C1 Qn_inst_1 (.D(D_c_i), .CLK(CLK_c), .PRE(R_c_i), .CLR(
        Qn_RNO_net_1), .Q(Qn_c));
    IOTRI_OB_EB \Qn_pad/U0/U1  (.D(Qn_c), .E(VCC), .DOUT(
        \Qn_pad/U0/NET1 ), .EOUT(\Qn_pad/U0/NET2 ));
    IOPAD_IN \D_pad/U0/U0  (.PAD(D), .Y(\D_pad/U0/NET1 ));
    IOIN_IB \S_pad/U0/U1  (.YIN(\S_pad/U0/NET1 ), .Y(S_c));
    IOTRI_OB_EB \Q_pad/U0/U1  (.D(Q_c), .E(VCC), .DOUT(\Q_pad/U0/NET1 )
        , .EOUT(\Q_pad/U0/NET2 ));
    IOPAD_TRI \Q_pad/U0/U0  (.D(\Q_pad/U0/NET1 ), .E(\Q_pad/U0/NET2 ), 
        .PAD(Q));
    INV Q_RNO_0 (.A(S_c), .Y(S_c_i));
    IOIN_IB \D_pad/U0/U1  (.YIN(\D_pad/U0/NET1 ), .Y(D_c));
    CLKIO \CLK_pad/U0/U1  (.A(\CLK_pad/U0/NET1 ), .Y(CLK_c));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
