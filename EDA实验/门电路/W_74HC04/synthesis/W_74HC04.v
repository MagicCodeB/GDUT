`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module W_74HC04(
       A,
       Y
    );
input  [5:0] A;
output [5:0] Y;

    wire GND, VCC, \A_c[0] , \A_c[1] , \A_c[2] , \A_c[3] , \A_c[4] , 
        \A_c[5] , \A_c_i[5] , \A_c_i[4] , \A_c_i[3] , \A_c_i[2] , 
        \A_c_i[1] , \A_c_i[0] ;
    
    INV \Y_pad_RNO[3]  (.A(\A_c[3] ), .Y(\A_c_i[3] ));
    INV \Y_pad_RNO[2]  (.A(\A_c[2] ), .Y(\A_c_i[2] ));
    INBUF \A_pad[0]  (.PAD(A[0]), .Y(\A_c[0] ));
    VCC VCC_i (.Y(VCC));
    INBUF \A_pad[4]  (.PAD(A[4]), .Y(\A_c[4] ));
    INV \Y_pad_RNO[5]  (.A(\A_c[5] ), .Y(\A_c_i[5] ));
    INBUF \A_pad[2]  (.PAD(A[2]), .Y(\A_c[2] ));
    GND GND_i (.Y(GND));
    INBUF \A_pad[3]  (.PAD(A[3]), .Y(\A_c[3] ));
    OUTBUF \Y_pad[4]  (.D(\A_c_i[4] ), .PAD(Y[4]));
    OUTBUF \Y_pad[0]  (.D(\A_c_i[0] ), .PAD(Y[0]));
    INV \Y_pad_RNO[0]  (.A(\A_c[0] ), .Y(\A_c_i[0] ));
    OUTBUF \Y_pad[5]  (.D(\A_c_i[5] ), .PAD(Y[5]));
    INBUF \A_pad[1]  (.PAD(A[1]), .Y(\A_c[1] ));
    OUTBUF \Y_pad[1]  (.D(\A_c_i[1] ), .PAD(Y[1]));
    OUTBUF \Y_pad[2]  (.D(\A_c_i[2] ), .PAD(Y[2]));
    INBUF \A_pad[5]  (.PAD(A[5]), .Y(\A_c[5] ));
    INV \Y_pad_RNO[4]  (.A(\A_c[4] ), .Y(\A_c_i[4] ));
    INV \Y_pad_RNO[1]  (.A(\A_c[1] ), .Y(\A_c_i[1] ));
    OUTBUF \Y_pad[3]  (.D(\A_c_i[3] ), .PAD(Y[3]));
    
endmodule
