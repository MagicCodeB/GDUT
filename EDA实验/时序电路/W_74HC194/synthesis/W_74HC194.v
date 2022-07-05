`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module W_74HC194(
       MR_N,
       S,
       D,
       CLK,
       IN,
       OUT
    );
input  MR_N;
input  [1:0] S;
input  [1:0] D;
input  CLK;
input  [0:3] IN;
output [0:3] OUT;

    wire OUT30, \OUT_11[3] , \OUT_11[2] , \OUT_11[1] , \OUT_11[0] , 
        GND, VCC, N_6, N_7, N_8, N_9, OUT_11_sn_N_2, MR_N_c, \S_c[0] , 
        \S_c[1] , \D_c[0] , \D_c[1] , CLK_c, \IN_c[3] , \IN_c[2] , 
        \IN_c[1] , \IN_c[0] , \OUT_c[3] , \OUT_c[2] , \OUT_c[1] , 
        \OUT_c[0] ;
    
    NOR2 \S_pad_RNIVNV7_0[1]  (.A(\S_c[1] ), .B(\S_c[0] ), .Y(OUT30));
    MX2 \OUT_RNO[0]  (.A(N_9), .B(\IN_c[0] ), .S(OUT_11_sn_N_2), .Y(
        \OUT_11[0] ));
    OUTBUF \OUT_pad[1]  (.D(\OUT_c[1] ), .PAD(OUT[1]));
    CLKBUF CLK_pad (.PAD(CLK), .Y(CLK_c));
    MX2 \OUT_RNO_0[1]  (.A(\OUT_c[2] ), .B(\OUT_c[0] ), .S(\S_c[0] ), 
        .Y(N_8));
    INBUF \D_pad[1]  (.PAD(D[1]), .Y(\D_c[1] ));
    OUTBUF \OUT_pad[2]  (.D(\OUT_c[2] ), .PAD(OUT[2]));
    DFN1E0C0 \OUT[1]  (.D(\OUT_11[1] ), .CLK(CLK_c), .CLR(MR_N_c), .E(
        OUT30), .Q(\OUT_c[1] ));
    VCC VCC_i (.Y(VCC));
    INBUF \S_pad[1]  (.PAD(S[1]), .Y(\S_c[1] ));
    INBUF \D_pad[0]  (.PAD(D[0]), .Y(\D_c[0] ));
    MX2 \OUT_RNO_0[3]  (.A(\D_c[0] ), .B(\OUT_c[2] ), .S(\S_c[0] ), .Y(
        N_6));
    DFN1E0C0 \OUT[0]  (.D(\OUT_11[0] ), .CLK(CLK_c), .CLR(MR_N_c), .E(
        OUT30), .Q(\OUT_c[0] ));
    GND GND_i (.Y(GND));
    INBUF \S_pad[0]  (.PAD(S[0]), .Y(\S_c[0] ));
    MX2 \OUT_RNO[3]  (.A(N_6), .B(\IN_c[3] ), .S(OUT_11_sn_N_2), .Y(
        \OUT_11[3] ));
    DFN1E0C0 \OUT[2]  (.D(\OUT_11[2] ), .CLK(CLK_c), .CLR(MR_N_c), .E(
        OUT30), .Q(\OUT_c[2] ));
    INBUF \IN_pad[3]  (.PAD(IN[3]), .Y(\IN_c[3] ));
    MX2 \OUT_RNO[1]  (.A(N_8), .B(\IN_c[1] ), .S(OUT_11_sn_N_2), .Y(
        \OUT_11[1] ));
    INBUF \IN_pad[1]  (.PAD(IN[1]), .Y(\IN_c[1] ));
    DFN1E0C0 \OUT[3]  (.D(\OUT_11[3] ), .CLK(CLK_c), .CLR(MR_N_c), .E(
        OUT30), .Q(\OUT_c[3] ));
    INBUF \IN_pad[2]  (.PAD(IN[2]), .Y(\IN_c[2] ));
    MX2 \OUT_RNO_0[0]  (.A(\OUT_c[1] ), .B(\D_c[1] ), .S(\S_c[0] ), .Y(
        N_9));
    OUTBUF \OUT_pad[0]  (.D(\OUT_c[0] ), .PAD(OUT[0]));
    MX2 \OUT_RNO[2]  (.A(N_7), .B(\IN_c[2] ), .S(OUT_11_sn_N_2), .Y(
        \OUT_11[2] ));
    MX2 \OUT_RNO_0[2]  (.A(\OUT_c[3] ), .B(\OUT_c[1] ), .S(\S_c[0] ), 
        .Y(N_7));
    NOR2B \S_pad_RNIVNV7[1]  (.A(\S_c[1] ), .B(\S_c[0] ), .Y(
        OUT_11_sn_N_2));
    INBUF \IN_pad[0]  (.PAD(IN[0]), .Y(\IN_c[0] ));
    INBUF MR_N_pad (.PAD(MR_N), .Y(MR_N_c));
    OUTBUF \OUT_pad[3]  (.D(\OUT_c[3] ), .PAD(OUT[3]));
    
endmodule
