`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module W_74HC4511(
       IN,
       Seg,
       LT,
       BI,
       LE
    );
input  [3:0] IN;
output [7:0] Seg;
input  LT;
input  BI;
input  LE;

    wire GND, VCC, N_2, N_3_0, N_4_0, N_5_0, N_6_0, N_7_0, N_8_0, 
        N_9_0, N_11, N_12, N_13, N_14, N_16, N_30_mux, N_20, N_21, 
        N_23, N_31_mux, N_28, N_30, N_31, \IN_c[0] , \IN_c[1] , 
        \IN_c[2] , \IN_c[3] , N_29_c, N_10_c, N_27_c, N_15_c, N_19_c, 
        N_24_c, N_22_c, LT_c, BI_c, LE_c, LT_c_i;
    
    MX2B \IN_pad_RNIFLE13_0[2]  (.A(N_4_0), .B(N_2), .S(\IN_c[2] ), .Y(
        N_11));
    MX2B \IN_pad_RNIEKE13[1]  (.A(N_3_0), .B(N_2), .S(\IN_c[1] ), .Y(
        N_16));
    MX2 \Seg_pad_RNO_0[0]  (.A(N_5_0), .B(N_11), .S(\IN_c[1] ), .Y(
        N_28));
    MX2B \Seg_pad_RNO_0[6]  (.A(N_5_0), .B(N_2), .S(\IN_c[1] ), .Y(
        N_20));
    INBUF \IN_pad[0]  (.PAD(IN[0]), .Y(\IN_c[0] ));
    MX2 \Seg_pad_RNO[5]  (.A(N_13), .B(N_23), .S(\IN_c[0] ), .Y(N_24_c)
        );
    MX2 \Seg_pad_RNO_1[1]  (.A(N_8_0), .B(N_4_0), .S(\IN_c[1] ), .Y(
        N_9_0));
    OUTBUF \Seg_pad[0]  (.D(N_29_c), .PAD(Seg[0]));
    INBUF \IN_pad[2]  (.PAD(IN[2]), .Y(\IN_c[2] ));
    OUTBUF \Seg_pad[2]  (.D(N_27_c), .PAD(Seg[2]));
    MX2B \Seg_pad_RNO_0[4]  (.A(N_3_0), .B(LT_c), .S(N_30), .Y(
        N_30_mux));
    VCC VCC_i (.Y(VCC));
    MX2 \Seg_pad_RNO[4]  (.A(N_16), .B(N_30_mux), .S(\IN_c[0] ), .Y(
        N_19_c));
    OUTBUF \Seg_pad[1]  (.D(N_10_c), .PAD(Seg[1]));
    MX2A \Seg_pad_RNO_0[2]  (.A(N_2), .B(N_4_0), .S(N_31), .Y(N_31_mux)
        );
    INBUF LE_pad (.PAD(LE), .Y(LE_c));
    MX2 \Seg_pad_RNO[1]  (.A(N_7_0), .B(N_9_0), .S(\IN_c[0] ), .Y(
        N_10_c));
    MX2 \Seg_pad_RNO_1[6]  (.A(N_13), .B(N_8_0), .S(\IN_c[1] ), .Y(
        N_21));
    NOR2 \Seg_pad_RNO_1[4]  (.A(\IN_c[2] ), .B(\IN_c[1] ), .Y(N_30));
    MX2 \Seg_pad_RNO_0[3]  (.A(N_3_0), .B(N_11), .S(\IN_c[1] ), .Y(
        N_12));
    INV \Seg_pad_RNO[7]  (.A(LT_c), .Y(LT_c_i));
    OUTBUF \Seg_pad[5]  (.D(N_24_c), .PAD(Seg[5]));
    MX2C \IN_pad_RNI2PQM1[3]  (.A(LT_c), .B(N_2), .S(\IN_c[3] ), .Y(
        N_3_0));
    MX2 \Seg_pad_RNO[0]  (.A(N_16), .B(N_28), .S(\IN_c[0] ), .Y(N_29_c)
        );
    INBUF BI_pad (.PAD(BI), .Y(BI_c));
    MX2C LT_pad_RNI1OQM1 (.A(N_2), .B(LT_c), .S(\IN_c[2] ), .Y(N_6_0));
    OUTBUF \Seg_pad[7]  (.D(LT_c_i), .PAD(Seg[7]));
    INBUF \IN_pad[1]  (.PAD(IN[1]), .Y(\IN_c[1] ));
    NOR2B \Seg_pad_RNO_1[2]  (.A(\IN_c[2] ), .B(\IN_c[1] ), .Y(N_31));
    MX2 \Seg_pad_RNO[2]  (.A(N_5_0), .B(N_31_mux), .S(\IN_c[0] ), .Y(
        N_27_c));
    MX2B \IN_pad_RNIFLE13[2]  (.A(N_3_0), .B(N_2), .S(\IN_c[2] ), .Y(
        N_13));
    GND GND_i (.Y(GND));
    INBUF \IN_pad[3]  (.PAD(IN[3]), .Y(\IN_c[3] ));
    MX2 \Seg_pad_RNO_0[5]  (.A(N_5_0), .B(N_3_0), .S(\IN_c[1] ), .Y(
        N_23));
    OUTBUF \Seg_pad[4]  (.D(N_19_c), .PAD(Seg[4]));
    INBUF LT_pad (.PAD(LT), .Y(LT_c));
    MX2 \Seg_pad_RNO[6]  (.A(N_20), .B(N_21), .S(\IN_c[0] ), .Y(N_22_c)
        );
    MX2 \Seg_pad_RNO_0[1]  (.A(N_5_0), .B(N_6_0), .S(\IN_c[1] ), .Y(
        N_7_0));
    MX2A \IN_pad_RNIFLE13_1[2]  (.A(N_2), .B(N_3_0), .S(\IN_c[2] ), .Y(
        N_8_0));
    OA1A BI_pad_RNIONF01 (.A(BI_c), .B(LE_c), .C(LT_c), .Y(N_2));
    MX2 \Seg_pad_RNO[3]  (.A(N_12), .B(N_14), .S(\IN_c[0] ), .Y(N_15_c)
        );
    MX2 \Seg_pad_RNO_1[3]  (.A(N_13), .B(N_6_0), .S(\IN_c[1] ), .Y(
        N_14));
    OUTBUF \Seg_pad[3]  (.D(N_15_c), .PAD(Seg[3]));
    MX2 \IN_pad_RNIPMPN3[2]  (.A(N_3_0), .B(N_4_0), .S(\IN_c[2] ), .Y(
        N_5_0));
    OUTBUF \Seg_pad[6]  (.D(N_22_c), .PAD(Seg[6]));
    MX2C \IN_pad_RNI2PQM1_0[3]  (.A(N_2), .B(LT_c), .S(\IN_c[3] ), .Y(
        N_4_0));
    
endmodule
