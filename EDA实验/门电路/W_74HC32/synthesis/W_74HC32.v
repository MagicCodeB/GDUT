`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module W_74HC32(
       A,
       B,
       Y
    );
input  [3:0] A;
input  [3:0] B;
output [3:0] Y;

    wire GND, VCC, \A_c[0] , \A_c[1] , \A_c[2] , \A_c[3] , \B_c[0] , 
        \B_c[1] , \B_c[2] , \B_c[3] , \Y_c[0] , \Y_c[1] , \Y_c[2] , 
        \Y_c[3] ;
    
    INBUF \B_pad[3]  (.PAD(B[3]), .Y(\B_c[3] ));
    INBUF \B_pad[2]  (.PAD(B[2]), .Y(\B_c[2] ));
    INBUF \A_pad[0]  (.PAD(A[0]), .Y(\A_c[0] ));
    VCC VCC_i (.Y(VCC));
    OR2 \Y[0]  (.A(\B_c[0] ), .B(\A_c[0] ), .Y(\Y_c[0] ));
    INBUF \B_pad[1]  (.PAD(B[1]), .Y(\B_c[1] ));
    INBUF \A_pad[2]  (.PAD(A[2]), .Y(\A_c[2] ));
    GND GND_i (.Y(GND));
    INBUF \A_pad[3]  (.PAD(A[3]), .Y(\A_c[3] ));
    OUTBUF \Y_pad[0]  (.D(\Y_c[0] ), .PAD(Y[0]));
    OR2 \Y[1]  (.A(\B_c[1] ), .B(\A_c[1] ), .Y(\Y_c[1] ));
    OR2 \Y[3]  (.A(\B_c[3] ), .B(\A_c[3] ), .Y(\Y_c[3] ));
    INBUF \A_pad[1]  (.PAD(A[1]), .Y(\A_c[1] ));
    OUTBUF \Y_pad[1]  (.D(\Y_c[1] ), .PAD(Y[1]));
    OR2 \Y[2]  (.A(\B_c[2] ), .B(\A_c[2] ), .Y(\Y_c[2] ));
    OUTBUF \Y_pad[2]  (.D(\Y_c[2] ), .PAD(Y[2]));
    OUTBUF \Y_pad[3]  (.D(\Y_c[3] ), .PAD(Y[3]));
    INBUF \B_pad[0]  (.PAD(B[0]), .Y(\B_c[0] ));
    
endmodule
