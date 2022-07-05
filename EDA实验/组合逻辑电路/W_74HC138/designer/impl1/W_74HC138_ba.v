`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module W_74HC138(
       DataIn,
       Enable,
       Eq
    );
input  [2:0] DataIn;
input  [3:1] Enable;
output [7:0] Eq;

    wire \DataIn_c[0] , \DataIn_c[1] , \DataIn_c[2] , \Enable_c[1] , 
        \Enable_c[2] , \Enable_c[3] , \Eq_c[0] , \Eq_c[1] , \Eq_c[2] , 
        \Eq_c[3] , \Eq_c[4] , \Eq_c[5] , \Eq_c[6] , \Eq_c[7] , I20, 
        \_l3.Eq36_1 , \_l6.Eq63_0 , \_l5.Eq54_0 , \_l4.Eq45_0 , 
        \_l2.Eq27_0 , \_l1.Eq18_0 , \_l0.Eq9_0 , 
        \DataIn_pad[1]/U0/NET1 , \DataIn_pad[0]/U0/NET1 , 
        \Eq_pad[4]/U0/NET1 , \Eq_pad[4]/U0/NET2 , \Eq_pad[3]/U0/NET1 , 
        \Eq_pad[3]/U0/NET2 , \Enable_pad[3]/U0/NET1 , 
        \Eq_pad[5]/U0/NET1 , \Eq_pad[5]/U0/NET2 , \Eq_pad[6]/U0/NET1 , 
        \Eq_pad[6]/U0/NET2 , \DataIn_pad[2]/U0/NET1 , 
        \Enable_pad[2]/U0/NET1 , \Enable_pad[1]/U0/NET1 , 
        \Eq_pad[1]/U0/NET1 , \Eq_pad[1]/U0/NET2 , \Eq_pad[2]/U0/NET1 , 
        \Eq_pad[2]/U0/NET2 , \Eq_pad[7]/U0/NET1 , \Eq_pad[7]/U0/NET2 , 
        \Eq_pad[0]/U0/NET1 , \Eq_pad[0]/U0/NET2 , VCC, GND, AFLSDF_VCC, 
        AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    IOPAD_TRI \Eq_pad[5]/U0/U0  (.D(\Eq_pad[5]/U0/NET1 ), .E(
        \Eq_pad[5]/U0/NET2 ), .PAD(Eq[5]));
    OA1A \Eq_pad_RNO[5]  (.A(\_l5.Eq54_0 ), .B(\DataIn_c[1] ), .C(I20), 
        .Y(\Eq_c[5] ));
    OA1A \Eq_pad_RNO[3]  (.A(\_l3.Eq36_1 ), .B(\DataIn_c[2] ), .C(I20), 
        .Y(\Eq_c[3] ));
    IOPAD_TRI \Eq_pad[4]/U0/U0  (.D(\Eq_pad[4]/U0/NET1 ), .E(
        \Eq_pad[4]/U0/NET2 ), .PAD(Eq[4]));
    IOTRI_OB_EB \Eq_pad[0]/U0/U1  (.D(\Eq_c[0] ), .E(VCC), .DOUT(
        \Eq_pad[0]/U0/NET1 ), .EOUT(\Eq_pad[0]/U0/NET2 ));
    IOPAD_TRI \Eq_pad[2]/U0/U0  (.D(\Eq_pad[2]/U0/NET1 ), .E(
        \Eq_pad[2]/U0/NET2 ), .PAD(Eq[2]));
    IOIN_IB \Enable_pad[3]/U0/U1  (.YIN(\Enable_pad[3]/U0/NET1 ), .Y(
        \Enable_c[3] ));
    IOPAD_IN \DataIn_pad[1]/U0/U0  (.PAD(DataIn[1]), .Y(
        \DataIn_pad[1]/U0/NET1 ));
    IOIN_IB \Enable_pad[1]/U0/U1  (.YIN(\Enable_pad[1]/U0/NET1 ), .Y(
        \Enable_c[1] ));
    NOR3B \Enable_pad_RNIFNB71[1]  (.A(\Enable_c[1] ), .B(
        \Enable_c[2] ), .C(\Enable_c[3] ), .Y(I20));
    IOIN_IB \DataIn_pad[1]/U0/U1  (.YIN(\DataIn_pad[1]/U0/NET1 ), .Y(
        \DataIn_c[1] ));
    OA1A \Eq_pad_RNO[6]  (.A(\_l6.Eq63_0 ), .B(\DataIn_c[0] ), .C(I20), 
        .Y(\Eq_c[6] ));
    IOTRI_OB_EB \Eq_pad[1]/U0/U1  (.D(\Eq_c[1] ), .E(VCC), .DOUT(
        \Eq_pad[1]/U0/NET1 ), .EOUT(\Eq_pad[1]/U0/NET2 ));
    NOR2A \Eq_pad_RNO_0[2]  (.A(\DataIn_c[1] ), .B(\DataIn_c[2] ), .Y(
        \_l2.Eq27_0 ));
    NOR2 \Eq_pad_RNO_0[0]  (.A(\DataIn_c[2] ), .B(\DataIn_c[0] ), .Y(
        \_l0.Eq9_0 ));
    IOPAD_TRI \Eq_pad[0]/U0/U0  (.D(\Eq_pad[0]/U0/NET1 ), .E(
        \Eq_pad[0]/U0/NET2 ), .PAD(Eq[0]));
    IOTRI_OB_EB \Eq_pad[3]/U0/U1  (.D(\Eq_c[3] ), .E(VCC), .DOUT(
        \Eq_pad[3]/U0/NET1 ), .EOUT(\Eq_pad[3]/U0/NET2 ));
    OA1A \Eq_pad_RNO[1]  (.A(\_l1.Eq18_0 ), .B(\DataIn_c[1] ), .C(I20), 
        .Y(\Eq_c[1] ));
    OA1A \Eq_pad_RNO[4]  (.A(\_l4.Eq45_0 ), .B(\DataIn_c[1] ), .C(I20), 
        .Y(\Eq_c[4] ));
    AOI1B \Eq_pad_RNO[7]  (.A(\_l3.Eq36_1 ), .B(\DataIn_c[2] ), .C(I20)
        , .Y(\Eq_c[7] ));
    IOIN_IB \Enable_pad[2]/U0/U1  (.YIN(\Enable_pad[2]/U0/NET1 ), .Y(
        \Enable_c[2] ));
    IOTRI_OB_EB \Eq_pad[7]/U0/U1  (.D(\Eq_c[7] ), .E(VCC), .DOUT(
        \Eq_pad[7]/U0/NET1 ), .EOUT(\Eq_pad[7]/U0/NET2 ));
    IOPAD_IN \Enable_pad[3]/U0/U0  (.PAD(Enable[3]), .Y(
        \Enable_pad[3]/U0/NET1 ));
    IOTRI_OB_EB \Eq_pad[6]/U0/U1  (.D(\Eq_c[6] ), .E(VCC), .DOUT(
        \Eq_pad[6]/U0/NET1 ), .EOUT(\Eq_pad[6]/U0/NET2 ));
    IOPAD_IN \Enable_pad[1]/U0/U0  (.PAD(Enable[1]), .Y(
        \Enable_pad[1]/U0/NET1 ));
    IOPAD_TRI \Eq_pad[1]/U0/U0  (.D(\Eq_pad[1]/U0/NET1 ), .E(
        \Eq_pad[1]/U0/NET2 ), .PAD(Eq[1]));
    IOTRI_OB_EB \Eq_pad[5]/U0/U1  (.D(\Eq_c[5] ), .E(VCC), .DOUT(
        \Eq_pad[5]/U0/NET1 ), .EOUT(\Eq_pad[5]/U0/NET2 ));
    IOPAD_IN \DataIn_pad[2]/U0/U0  (.PAD(DataIn[2]), .Y(
        \DataIn_pad[2]/U0/NET1 ));
    IOPAD_IN \DataIn_pad[0]/U0/U0  (.PAD(DataIn[0]), .Y(
        \DataIn_pad[0]/U0/NET1 ));
    NOR2A \Eq_pad_RNO_0[4]  (.A(\DataIn_c[2] ), .B(\DataIn_c[0] ), .Y(
        \_l4.Eq45_0 ));
    OA1A \Eq_pad_RNO[0]  (.A(\_l0.Eq9_0 ), .B(\DataIn_c[1] ), .C(I20), 
        .Y(\Eq_c[0] ));
    IOTRI_OB_EB \Eq_pad[4]/U0/U1  (.D(\Eq_c[4] ), .E(VCC), .DOUT(
        \Eq_pad[4]/U0/NET1 ), .EOUT(\Eq_pad[4]/U0/NET2 ));
    IOPAD_TRI \Eq_pad[3]/U0/U0  (.D(\Eq_pad[3]/U0/NET1 ), .E(
        \Eq_pad[3]/U0/NET2 ), .PAD(Eq[3]));
    IOTRI_OB_EB \Eq_pad[2]/U0/U1  (.D(\Eq_c[2] ), .E(VCC), .DOUT(
        \Eq_pad[2]/U0/NET1 ), .EOUT(\Eq_pad[2]/U0/NET2 ));
    NOR2A \Eq_pad_RNO_0[1]  (.A(\DataIn_c[0] ), .B(\DataIn_c[2] ), .Y(
        \_l1.Eq18_0 ));
    IOIN_IB \DataIn_pad[2]/U0/U1  (.YIN(\DataIn_pad[2]/U0/NET1 ), .Y(
        \DataIn_c[2] ));
    IOPAD_TRI \Eq_pad[7]/U0/U0  (.D(\Eq_pad[7]/U0/NET1 ), .E(
        \Eq_pad[7]/U0/NET2 ), .PAD(Eq[7]));
    NOR2B \DataIn_pad_RNIRNPU[0]  (.A(\DataIn_c[0] ), .B(\DataIn_c[1] )
        , .Y(\_l3.Eq36_1 ));
    IOIN_IB \DataIn_pad[0]/U0/U1  (.YIN(\DataIn_pad[0]/U0/NET1 ), .Y(
        \DataIn_c[0] ));
    NOR2B \Eq_pad_RNO_0[6]  (.A(\DataIn_c[2] ), .B(\DataIn_c[1] ), .Y(
        \_l6.Eq63_0 ));
    IOPAD_IN \Enable_pad[2]/U0/U0  (.PAD(Enable[2]), .Y(
        \Enable_pad[2]/U0/NET1 ));
    IOPAD_TRI \Eq_pad[6]/U0/U0  (.D(\Eq_pad[6]/U0/NET1 ), .E(
        \Eq_pad[6]/U0/NET2 ), .PAD(Eq[6]));
    NOR2B \Eq_pad_RNO_0[5]  (.A(\DataIn_c[2] ), .B(\DataIn_c[0] ), .Y(
        \_l5.Eq54_0 ));
    OA1A \Eq_pad_RNO[2]  (.A(\_l2.Eq27_0 ), .B(\DataIn_c[0] ), .C(I20), 
        .Y(\Eq_c[2] ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
