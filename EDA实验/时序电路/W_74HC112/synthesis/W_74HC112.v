`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


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

    wire GND, temp210, temp2_net_1, temp1_net_1, VCC, S_c, R_c, CLK_c, 
        J_c, K_c, Q_c, temp1_3, temp113, Q_c_i, S_c_i;
    
    MX2B temp1_RNO (.A(J_c), .B(K_c), .S(temp1_net_1), .Y(temp1_3));
    DFN0E1 temp1 (.D(temp1_3), .CLK(CLK_c), .E(temp113), .Q(
        temp1_net_1));
    INBUF R_pad (.PAD(R), .Y(R_c));
    INBUF CLK_pad (.PAD(CLK), .Y(CLK_c));
    INV Qn_pad_RNO (.A(Q_c), .Y(Q_c_i));
    VCC VCC_i (.Y(VCC));
    INBUF K_pad (.PAD(K), .Y(K_c));
    INBUF J_pad (.PAD(J), .Y(J_c));
    GND GND_i (.Y(GND));
    DLN1P1C1 temp2 (.D(GND), .G(GND), .PRE(S_c_i), .CLR(temp210), .Q(
        temp2_net_1));
    OUTBUF Q_pad (.D(Q_c), .PAD(Q));
    MX2 temp2_RNISU0T (.A(temp2_net_1), .B(temp1_net_1), .S(temp113), 
        .Y(Q_c));
    INBUF S_pad (.PAD(S), .Y(S_c));
    INV temp2_RNO_0 (.A(S_c), .Y(S_c_i));
    NOR2A temp2_RNO (.A(S_c), .B(R_c), .Y(temp210));
    NOR2B R_pad_RNIDEJB (.A(S_c), .B(R_c), .Y(temp113));
    OUTBUF Qn_pad (.D(Q_c_i), .PAD(Qn));
    
endmodule
