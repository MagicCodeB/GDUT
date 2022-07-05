`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module Ymtz(
       A,
       INn,
       Seg,
       Seg_0,
       Seg_1,
       Seg_2,
       Seg_3,
       Seg_4,
       Seg_5,
       Seg_6,
       Y,
       Y_0,
       Y_1,
       Y_2
    );
input  [2:0] A;
input  [3:0] INn;
output Seg;
output Seg_0;
output Seg_1;
output Seg_2;
output Seg_3;
output Seg_4;
output Seg_5;
output Seg_6;
output Y;
output Y_0;
output Y_1;
output Y_2;

    wire un6_Y_0, un6_Y_1_0, un6_Y_2_0, un6_Y_3_0, \Seg_1_i[0] , 
        \Seg_1_i[1] , \Seg_1_i[3] , \Seg_1_i[4] , \Seg_1_i[6] , 
        \A_c[0] , \A_c[1] , \A_c[2] , \INn_c[0] , \INn_c[1] , 
        \INn_c[2] , \INn_c[3] , GND, Seg_1_c, Seg_4_c, 
        \W_74HC4511_0/Seg_1_0_0[5]_net_1 , \W_74HC4511_0/N_61 , 
        \W_74HC4511_0/N_84 , \W_74HC4511_0/N_76 , \W_74HC4511_0/N_78 , 
        \W_74HC4511_0/N_77 , \W_74HC4511_0/N_66 , \W_74HC4511_0/N_72 , 
        \W_74HC4511_0/N_85 , \W_74HC4511_0/N_60 , \W_74HC4511_0/N_71 , 
        \W_74HC4511_0/N_67 , \W_74HC4511_0/N_68 , \W_74HC4511_0/N_62 , 
        \W_74HC4511_0/N_69 , \W_74HC4511_0/N_74 , 
        \W_74HC4511_0/N_78_1 , \Seg_0_pad/U0/NET1 , 
        \Seg_0_pad/U0/NET2 , \Y_2_pad/U0/NET1 , \Y_2_pad/U0/NET2 , 
        \INn_pad[0]/U0/NET1 , \Seg_2_pad/U0/NET1 , \Seg_2_pad/U0/NET2 , 
        \Y_1_pad/U0/NET1 , \Y_1_pad/U0/NET2 , \INn_pad[1]/U0/NET1 , 
        \Seg_1_pad/U0/NET1 , \Seg_1_pad/U0/NET2 , \Y_0_pad/U0/NET1 , 
        \Y_0_pad/U0/NET2 , \Seg_3_pad/U0/NET1 , \Seg_3_pad/U0/NET2 , 
        \A_pad[0]/U0/NET1 , \Seg_4_pad/U0/NET1 , \Seg_4_pad/U0/NET2 , 
        \Seg_6_pad/U0/NET1 , \Seg_6_pad/U0/NET2 , \Y_pad/U0/NET1 , 
        \Y_pad/U0/NET2 , \Seg_pad/U0/NET1 , \Seg_pad/U0/NET2 , 
        \INn_pad[2]/U0/NET1 , \A_pad[2]/U0/NET1 , \INn_pad[3]/U0/NET1 , 
        \Seg_5_pad/U0/NET1 , \Seg_5_pad/U0/NET2 , VCC, 
        \A_pad[1]/U0/NET1 , AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    NOR3C \W_74HC4511_0/Seg_1_i_a4_0[0]  (.A(\INn_c[0] ), .B(
        \INn_c[2] ), .C(\W_74HC4511_0/N_78_1 ), .Y(\W_74HC4511_0/N_67 )
        );
    IOPAD_TRI \Seg_2_pad/U0/U0  (.D(\Seg_2_pad/U0/NET1 ), .E(
        \Seg_2_pad/U0/NET2 ), .PAD(Seg_2));
    IOTRI_OB_EB \Seg_0_pad/U0/U1  (.D(\Seg_1_i[6] ), .E(VCC), .DOUT(
        \Seg_0_pad/U0/NET1 ), .EOUT(\Seg_0_pad/U0/NET2 ));
    NOR3C \W_74HC4511_0/Seg_1_i_a2[3]  (.A(\INn_c[0] ), .B(\INn_c[2] ), 
        .C(\INn_c[1] ), .Y(\W_74HC4511_0/N_85 ));
    IOPAD_IN \A_pad[2]/U0/U0  (.PAD(A[2]), .Y(\A_pad[2]/U0/NET1 ));
    IOPAD_IN \A_pad[1]/U0/U0  (.PAD(A[1]), .Y(\A_pad[1]/U0/NET1 ));
    IOTRI_OB_EB \Y_0_pad/U0/U1  (.D(un6_Y_2_0), .E(VCC), .DOUT(
        \Y_0_pad/U0/NET1 ), .EOUT(\Y_0_pad/U0/NET2 ));
    MX2A \W_74HC4511_0/Seg_1_0_m2[2]  (.A(\INn_c[0] ), .B(\INn_c[3] ), 
        .S(\INn_c[2] ), .Y(\W_74HC4511_0/N_60 ));
    IOPAD_TRI \Y_1_pad/U0/U0  (.D(\Y_1_pad/U0/NET1 ), .E(
        \Y_1_pad/U0/NET2 ), .PAD(Y_1));
    IOPAD_TRI \Seg_0_pad/U0/U0  (.D(\Seg_0_pad/U0/NET1 ), .E(
        \Seg_0_pad/U0/NET2 ), .PAD(Seg_0));
    OR3 \W_74HC138_0/un6_Y_0  (.A(\A_c[1] ), .B(\A_c[2] ), .C(\A_c[0] )
        , .Y(un6_Y_0));
    OR3B \W_74HC138_0/un6_Y_3_0  (.A(\A_c[1] ), .B(\A_c[0] ), .C(
        \A_c[2] ), .Y(un6_Y_3_0));
    AOI1 \W_74HC4511_0/Seg_1_i[1]  (.A(\W_74HC4511_0/N_61 ), .B(
        \INn_c[0] ), .C(\W_74HC4511_0/N_69 ), .Y(\Seg_1_i[1] ));
    IOTRI_OB_EB \Seg_3_pad/U0/U1  (.D(\Seg_1_i[3] ), .E(VCC), .DOUT(
        \Seg_3_pad/U0/NET1 ), .EOUT(\Seg_3_pad/U0/NET2 ));
    IOPAD_TRI \Seg_3_pad/U0/U0  (.D(\Seg_3_pad/U0/NET1 ), .E(
        \Seg_3_pad/U0/NET2 ), .PAD(Seg_3));
    OR3A \W_74HC138_0/un6_Y_1_0  (.A(\A_c[0] ), .B(\A_c[1] ), .C(
        \A_c[2] ), .Y(un6_Y_1_0));
    OA1C \W_74HC4511_0/Seg_1_0_0[5]  (.A(\INn_c[1] ), .B(\INn_c[2] ), 
        .C(\INn_c[0] ), .Y(\W_74HC4511_0/Seg_1_0_0[5]_net_1 ));
    IOIN_IB \A_pad[0]/U0/U1  (.YIN(\A_pad[0]/U0/NET1 ), .Y(\A_c[0] ));
    NOR3B \W_74HC4511_0/Seg_1_i_a4_1[6]  (.A(\INn_c[2] ), .B(
        \W_74HC4511_0/N_78_1 ), .C(\INn_c[0] ), .Y(\W_74HC4511_0/N_78 )
        );
    OA1C \W_74HC4511_0/Seg_1_0_a4[2]  (.A(\INn_c[2] ), .B(\INn_c[0] ), 
        .C(\INn_c[1] ), .Y(\W_74HC4511_0/N_71 ));
    OA1B \W_74HC4511_0/Seg_1_i[4]  (.A(\INn_c[1] ), .B(
        \W_74HC4511_0/N_60 ), .C(\W_74HC4511_0/N_74 ), .Y(\Seg_1_i[4] )
        );
    IOPAD_TRI \Y_0_pad/U0/U0  (.D(\Y_0_pad/U0/NET1 ), .E(
        \Y_0_pad/U0/NET2 ), .PAD(Y_0));
    IOIN_IB \INn_pad[2]/U0/U1  (.YIN(\INn_pad[2]/U0/NET1 ), .Y(
        \INn_c[2] ));
    IOPAD_IN \INn_pad[2]/U0/U0  (.PAD(INn[2]), .Y(\INn_pad[2]/U0/NET1 )
        );
    AXOI7 \W_74HC4511_0/Seg_1_0_o4[5]  (.A(\INn_c[2] ), .B(\INn_c[1] ), 
        .C(\INn_c[3] ), .Y(\W_74HC4511_0/N_61 ));
    NOR3 \W_74HC4511_0/Seg_1_i[6]  (.A(\W_74HC4511_0/N_76 ), .B(
        \W_74HC4511_0/N_78 ), .C(\W_74HC4511_0/N_77 ), .Y(\Seg_1_i[6] )
        );
    IOPAD_TRI \Seg_5_pad/U0/U0  (.D(\Seg_5_pad/U0/NET1 ), .E(
        \Seg_5_pad/U0/NET2 ), .PAD(Seg_5));
    NOR2A \W_74HC4511_0/Seg_1_i_a4_0[6]  (.A(\W_74HC4511_0/N_85 ), .B(
        \INn_c[3] ), .Y(\W_74HC4511_0/N_77 ));
    IOTRI_OB_EB \Seg_1_pad/U0/U1  (.D(Seg_1_c), .E(VCC), .DOUT(
        \Seg_1_pad/U0/NET1 ), .EOUT(\Seg_1_pad/U0/NET2 ));
    IOPAD_TRI \Seg_6_pad/U0/U0  (.D(\Seg_6_pad/U0/NET1 ), .E(
        \Seg_6_pad/U0/NET2 ), .PAD(Seg_6));
    IOTRI_OB_EB \Seg_pad/U0/U1  (.D(GND), .E(VCC), .DOUT(
        \Seg_pad/U0/NET1 ), .EOUT(\Seg_pad/U0/NET2 ));
    NOR3B \W_74HC4511_0/Seg_1_i_a4[1]  (.A(\INn_c[2] ), .B(
        \W_74HC4511_0/N_62 ), .C(\INn_c[0] ), .Y(\W_74HC4511_0/N_69 ));
    NOR2 \W_74HC4511_0/Seg_1_i_a4[6]  (.A(\W_74HC4511_0/N_62 ), .B(
        \INn_c[2] ), .Y(\W_74HC4511_0/N_76 ));
    IOPAD_IN \A_pad[0]/U0/U0  (.PAD(A[0]), .Y(\A_pad[0]/U0/NET1 ));
    IOTRI_OB_EB \Y_pad/U0/U1  (.D(un6_Y_3_0), .E(VCC), .DOUT(
        \Y_pad/U0/NET1 ), .EOUT(\Y_pad/U0/NET2 ));
    NOR3B \W_74HC4511_0/Seg_1_i_a4[3]  (.A(\INn_c[1] ), .B(
        \W_74HC4511_0/N_84 ), .C(\INn_c[0] ), .Y(\W_74HC4511_0/N_72 ));
    IOPAD_TRI \Seg_1_pad/U0/U0  (.D(\Seg_1_pad/U0/NET1 ), .E(
        \Seg_1_pad/U0/NET2 ), .PAD(Seg_1));
    OR3A \W_74HC138_0/un6_Y_2_0  (.A(\A_c[1] ), .B(\A_c[2] ), .C(
        \A_c[0] ), .Y(un6_Y_2_0));
    IOPAD_TRI \Seg_pad/U0/U0  (.D(\Seg_pad/U0/NET1 ), .E(
        \Seg_pad/U0/NET2 ), .PAD(Seg));
    OR2 \W_74HC4511_0/Seg_1_i_o2[1]  (.A(\INn_c[3] ), .B(\INn_c[1] ), 
        .Y(\W_74HC4511_0/N_62 ));
    IOIN_IB \A_pad[2]/U0/U1  (.YIN(\A_pad[2]/U0/NET1 ), .Y(\A_c[2] ));
    IOIN_IB \A_pad[1]/U0/U1  (.YIN(\A_pad[1]/U0/NET1 ), .Y(\A_c[1] ));
    IOTRI_OB_EB \Seg_2_pad/U0/U1  (.D(\Seg_1_i[4] ), .E(VCC), .DOUT(
        \Seg_2_pad/U0/NET1 ), .EOUT(\Seg_2_pad/U0/NET2 ));
    IOPAD_TRI \Y_pad/U0/U0  (.D(\Y_pad/U0/NET1 ), .E(\Y_pad/U0/NET2 ), 
        .PAD(Y));
    OR3A \W_74HC4511_0/Seg_1_0[2]  (.A(\W_74HC4511_0/N_60 ), .B(
        \W_74HC4511_0/N_71 ), .C(\W_74HC4511_0/N_84 ), .Y(Seg_4_c));
    NOR3C \W_74HC4511_0/Seg_1_i_a4_1[0]  (.A(\INn_c[1] ), .B(
        \INn_c[0] ), .C(\W_74HC4511_0/N_84 ), .Y(\W_74HC4511_0/N_68 ));
    XA1B \W_74HC4511_0/Seg_1_i_a4[0]  (.A(\INn_c[0] ), .B(\INn_c[2] ), 
        .C(\W_74HC4511_0/N_62 ), .Y(\W_74HC4511_0/N_66 ));
    IOTRI_OB_EB \Seg_5_pad/U0/U1  (.D(\Seg_1_i[1] ), .E(VCC), .DOUT(
        \Seg_5_pad/U0/NET1 ), .EOUT(\Seg_5_pad/U0/NET2 ));
    IOTRI_OB_EB \Y_2_pad/U0/U1  (.D(un6_Y_0), .E(VCC), .DOUT(
        \Y_2_pad/U0/NET1 ), .EOUT(\Y_2_pad/U0/NET2 ));
    IOPAD_TRI \Y_2_pad/U0/U0  (.D(\Y_2_pad/U0/NET1 ), .E(
        \Y_2_pad/U0/NET2 ), .PAD(Y_2));
    IOPAD_TRI \Seg_4_pad/U0/U0  (.D(\Seg_4_pad/U0/NET1 ), .E(
        \Seg_4_pad/U0/NET2 ), .PAD(Seg_4));
    IOIN_IB \INn_pad[1]/U0/U1  (.YIN(\INn_pad[1]/U0/NET1 ), .Y(
        \INn_c[1] ));
    IOIN_IB \INn_pad[3]/U0/U1  (.YIN(\INn_pad[3]/U0/NET1 ), .Y(
        \INn_c[3] ));
    NOR2A \W_74HC4511_0/Seg_1_i_a4_0[4]  (.A(\INn_c[0] ), .B(
        \INn_c[3] ), .Y(\W_74HC4511_0/N_74 ));
    NOR2A \W_74HC4511_0/Seg_1_0_a2[2]  (.A(\INn_c[3] ), .B(\INn_c[2] ), 
        .Y(\W_74HC4511_0/N_84 ));
    IOPAD_IN \INn_pad[1]/U0/U0  (.PAD(INn[1]), .Y(\INn_pad[1]/U0/NET1 )
        );
    IOTRI_OB_EB \Seg_4_pad/U0/U1  (.D(Seg_4_c), .E(VCC), .DOUT(
        \Seg_4_pad/U0/NET1 ), .EOUT(\Seg_4_pad/U0/NET2 ));
    IOPAD_IN \INn_pad[3]/U0/U0  (.PAD(INn[3]), .Y(\INn_pad[3]/U0/NET1 )
        );
    IOIN_IB \INn_pad[0]/U0/U1  (.YIN(\INn_pad[0]/U0/NET1 ), .Y(
        \INn_c[0] ));
    IOPAD_IN \INn_pad[0]/U0/U0  (.PAD(INn[0]), .Y(\INn_pad[0]/U0/NET1 )
        );
    IOTRI_OB_EB \Seg_6_pad/U0/U1  (.D(\Seg_1_i[0] ), .E(VCC), .DOUT(
        \Seg_6_pad/U0/NET1 ), .EOUT(\Seg_6_pad/U0/NET2 ));
    NOR3 \W_74HC4511_0/Seg_1_i[3]  (.A(\W_74HC4511_0/N_66 ), .B(
        \W_74HC4511_0/N_72 ), .C(\W_74HC4511_0/N_85 ), .Y(\Seg_1_i[3] )
        );
    IOTRI_OB_EB \Y_1_pad/U0/U1  (.D(un6_Y_1_0), .E(VCC), .DOUT(
        \Y_1_pad/U0/NET1 ), .EOUT(\Y_1_pad/U0/NET2 ));
    OR3 \W_74HC4511_0/Seg_1_0[5]  (.A(\W_74HC4511_0/N_61 ), .B(
        \W_74HC4511_0/N_84 ), .C(\W_74HC4511_0/Seg_1_0_0[5]_net_1 ), 
        .Y(Seg_1_c));
    NOR2A \W_74HC4511_0/Seg_1_i_a4_1_1[6]  (.A(\INn_c[3] ), .B(
        \INn_c[1] ), .Y(\W_74HC4511_0/N_78_1 ));
    NOR3 \W_74HC4511_0/Seg_1_i[0]  (.A(\W_74HC4511_0/N_67 ), .B(
        \W_74HC4511_0/N_68 ), .C(\W_74HC4511_0/N_66 ), .Y(\Seg_1_i[0] )
        );
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
