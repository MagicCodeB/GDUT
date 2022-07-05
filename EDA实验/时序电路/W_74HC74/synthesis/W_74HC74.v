`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


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

    wire Qn_RNO_net_1, Q_RNO_net_1, GND, VCC, S_c, R_c, CLK_c, D_c, 
        Q_c, Qn_c, D_c_i, R_c_i, S_c_i;
    
    OUTBUF Q_pad (.D(Q_c), .PAD(Q));
    DFN1P1C1 Q_inst_1 (.D(D_c), .CLK(CLK_c), .PRE(S_c_i), .CLR(
        Q_RNO_net_1), .Q(Q_c));
    INV Qn_RNO_0 (.A(D_c), .Y(D_c_i));
    NOR2A Qn_RNO (.A(R_c), .B(S_c), .Y(Qn_RNO_net_1));
    INBUF D_pad (.PAD(D), .Y(D_c));
    INV Q_RNO_0 (.A(S_c), .Y(S_c_i));
    OUTBUF Qn_pad (.D(Qn_c), .PAD(Qn));
    VCC VCC_i (.Y(VCC));
    INBUF R_pad (.PAD(R), .Y(R_c));
    INV Qn_RNO_1 (.A(R_c), .Y(R_c_i));
    NOR2A Q_RNO (.A(S_c), .B(R_c), .Y(Q_RNO_net_1));
    DFN1P1C1 Qn_inst_1 (.D(D_c_i), .CLK(CLK_c), .PRE(R_c_i), .CLR(
        Qn_RNO_net_1), .Q(Qn_c));
    GND GND_i (.Y(GND));
    INBUF S_pad (.PAD(S), .Y(S_c));
    CLKBUF CLK_pad (.PAD(CLK), .Y(CLK_c));
    
endmodule
