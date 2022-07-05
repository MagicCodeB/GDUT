`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


module W_74HC138(
       DataIn,
       Enable,
       Eq
    );
input  [2:0] DataIn;
input  [3:1] Enable;
output [7:0] Eq;

    wire GND, VCC, \DataIn_c[0] , \DataIn_c[1] , \DataIn_c[2] , 
        \Enable_c[1] , \Enable_c[2] , \Enable_c[3] , \Eq_c[0] , 
        \Eq_c[1] , \Eq_c[2] , \Eq_c[3] , \Eq_c[4] , \Eq_c[5] , 
        \Eq_c[6] , \Eq_c[7] , I20, \_l3.Eq36_1 , \_l6.Eq63_0 , 
        \_l5.Eq54_0 , \_l4.Eq45_0 , \_l2.Eq27_0 , \_l1.Eq18_0 , 
        \_l0.Eq9_0 ;
    
    OA1A \Eq_pad_RNO[2]  (.A(\_l2.Eq27_0 ), .B(\DataIn_c[0] ), .C(I20), 
        .Y(\Eq_c[2] ));
    OA1A \Eq_pad_RNO[1]  (.A(\_l1.Eq18_0 ), .B(\DataIn_c[1] ), .C(I20), 
        .Y(\Eq_c[1] ));
    NOR2B \Eq_pad_RNO_0[6]  (.A(\DataIn_c[2] ), .B(\DataIn_c[1] ), .Y(
        \_l6.Eq63_0 ));
    INBUF \DataIn_pad[1]  (.PAD(DataIn[1]), .Y(\DataIn_c[1] ));
    INBUF \DataIn_pad[0]  (.PAD(DataIn[0]), .Y(\DataIn_c[0] ));
    NOR2 \Eq_pad_RNO_0[0]  (.A(\DataIn_c[2] ), .B(\DataIn_c[0] ), .Y(
        \_l0.Eq9_0 ));
    OA1A \Eq_pad_RNO[0]  (.A(\_l0.Eq9_0 ), .B(\DataIn_c[1] ), .C(I20), 
        .Y(\Eq_c[0] ));
    OUTBUF \Eq_pad[4]  (.D(\Eq_c[4] ), .PAD(Eq[4]));
    NOR2B \Eq_pad_RNO_0[5]  (.A(\DataIn_c[2] ), .B(\DataIn_c[0] ), .Y(
        \_l5.Eq54_0 ));
    OUTBUF \Eq_pad[3]  (.D(\Eq_c[3] ), .PAD(Eq[3]));
    OA1A \Eq_pad_RNO[3]  (.A(\_l3.Eq36_1 ), .B(\DataIn_c[2] ), .C(I20), 
        .Y(\Eq_c[3] ));
    NOR3B \Enable_pad_RNIFNB71[1]  (.A(\Enable_c[1] ), .B(
        \Enable_c[2] ), .C(\Enable_c[3] ), .Y(I20));
    INBUF \Enable_pad[3]  (.PAD(Enable[3]), .Y(\Enable_c[3] ));
    NOR2A \Eq_pad_RNO_0[4]  (.A(\DataIn_c[2] ), .B(\DataIn_c[0] ), .Y(
        \_l4.Eq45_0 ));
    VCC VCC_i (.Y(VCC));
    OUTBUF \Eq_pad[5]  (.D(\Eq_c[5] ), .PAD(Eq[5]));
    OUTBUF \Eq_pad[6]  (.D(\Eq_c[6] ), .PAD(Eq[6]));
    INBUF \DataIn_pad[2]  (.PAD(DataIn[2]), .Y(\DataIn_c[2] ));
    INBUF \Enable_pad[2]  (.PAD(Enable[2]), .Y(\Enable_c[2] ));
    GND GND_i (.Y(GND));
    NOR2B \DataIn_pad_RNIRNPU[0]  (.A(\DataIn_c[0] ), .B(\DataIn_c[1] )
        , .Y(\_l3.Eq36_1 ));
    INBUF \Enable_pad[1]  (.PAD(Enable[1]), .Y(\Enable_c[1] ));
    OA1A \Eq_pad_RNO[6]  (.A(\_l6.Eq63_0 ), .B(\DataIn_c[0] ), .C(I20), 
        .Y(\Eq_c[6] ));
    OUTBUF \Eq_pad[1]  (.D(\Eq_c[1] ), .PAD(Eq[1]));
    AOI1B \Eq_pad_RNO[7]  (.A(\_l3.Eq36_1 ), .B(\DataIn_c[2] ), .C(I20)
        , .Y(\Eq_c[7] ));
    NOR2A \Eq_pad_RNO_0[2]  (.A(\DataIn_c[1] ), .B(\DataIn_c[2] ), .Y(
        \_l2.Eq27_0 ));
    NOR2A \Eq_pad_RNO_0[1]  (.A(\DataIn_c[0] ), .B(\DataIn_c[2] ), .Y(
        \_l1.Eq18_0 ));
    OA1A \Eq_pad_RNO[5]  (.A(\_l5.Eq54_0 ), .B(\DataIn_c[1] ), .C(I20), 
        .Y(\Eq_c[5] ));
    OA1A \Eq_pad_RNO[4]  (.A(\_l4.Eq45_0 ), .B(\DataIn_c[1] ), .C(I20), 
        .Y(\Eq_c[4] ));
    OUTBUF \Eq_pad[2]  (.D(\Eq_c[2] ), .PAD(Eq[2]));
    OUTBUF \Eq_pad[7]  (.D(\Eq_c[7] ), .PAD(Eq[7]));
    OUTBUF \Eq_pad[0]  (.D(\Eq_c[0] ), .PAD(Eq[0]));
    
endmodule
