`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module W_74HC153(
       D0,
       D1,
       D2,
       D3,
       Sel0,
       Sel1,
       Result
    );
input  D0;
input  D1;
input  D2;
input  D3;
input  Sel0;
input  Sel1;
output Result;

    wire GND, VCC, Result_1_net_1, Result_2_net_1, D0_c, D1_c, D2_c, 
        D3_c, Sel0_c, Sel1_c, Result_c;
    
    INBUF D3_pad (.PAD(D3), .Y(D3_c));
    MX2 Result_3 (.A(Result_1_net_1), .B(Result_2_net_1), .S(Sel1_c), 
        .Y(Result_c));
    INBUF D2_pad (.PAD(D2), .Y(D2_c));
    INBUF D1_pad (.PAD(D1), .Y(D1_c));
    INBUF Sel0_pad (.PAD(Sel0), .Y(Sel0_c));
    OUTBUF Result_pad (.D(Result_c), .PAD(Result));
    MX2 Result_1 (.A(D0_c), .B(D2_c), .S(Sel0_c), .Y(Result_1_net_1));
    INBUF D0_pad (.PAD(D0), .Y(D0_c));
    VCC VCC_i (.Y(VCC));
    INBUF Sel1_pad (.PAD(Sel1), .Y(Sel1_c));
    MX2 Result_2 (.A(D1_c), .B(D3_c), .S(Sel0_c), .Y(Result_2_net_1));
    GND GND_i (.Y(GND));
    
endmodule
