`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module W_74HC85(
       A,
       B,
       Q
    );
input  [3:0] A;
input  [3:0] B;
output [2:0] Q;

    wire Q10_NE, Q10_0, Q10_2, Q10_3, 
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[0] , 
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[1] , 
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[2] , 
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[3] , 
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[5] , 
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[6] , 
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[7] , 
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[8] , 
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[10] , 
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[0] , 
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[1] , 
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[2] , 
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[3] , 
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[5] , 
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[6] , 
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[7] , 
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[8] , 
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[10] , \A_c[0] , 
        \A_c[1] , \A_c[2] , \A_c[3] , \B_c[0] , \B_c[1] , \B_c[2] , 
        \B_c[3] , \Q_c[0] , \Q_c[2] , Q10_NE_0, \B_pad[3]/U0/NET1 , 
        \B_pad[2]/U0/NET1 , \Q_pad[2]/U0/NET1 , \Q_pad[2]/U0/NET2 , 
        \A_pad[3]/U0/NET1 , \B_pad[1]/U0/NET1 , \A_pad[0]/U0/NET1 , 
        \B_pad[0]/U0/NET1 , \Q_pad[1]/U0/NET1 , \Q_pad[1]/U0/NET2 , 
        \A_pad[2]/U0/NET1 , \Q_pad[0]/U0/NET1 , \Q_pad[0]/U0/NET2 , 
        VCC, \A_pad[1]/U0/NET1 , GND, AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    XOR2 \Q_pad_RNO_0[1]  (.A(\A_c[2] ), .B(\B_c[2] ), .Y(Q10_2));
    IOPAD_IN \A_pad[2]/U0/U0  (.PAD(A[2]), .Y(\A_pad[2]/U0/NET1 ));
    IOPAD_IN \A_pad[1]/U0/U0  (.PAD(A[1]), .Y(\A_pad[1]/U0/NET1 ));
    IOIN_IB \A_pad[3]/U0/U1  (.YIN(\A_pad[3]/U0/NET1 ), .Y(\A_c[3] ));
    NOR2A Q9_0_I_6 (.A(\B_c[3] ), .B(\A_c[3] ), .Y(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[5] ));
    IOIN_IB \B_pad[1]/U0/U1  (.YIN(\B_pad[1]/U0/NET1 ), .Y(\B_c[1] ));
    IOTRI_OB_EB \Q_pad[0]/U0/U1  (.D(\Q_c[0] ), .E(VCC), .DOUT(
        \Q_pad[0]/U0/NET1 ), .EOUT(\Q_pad[0]/U0/NET2 ));
    NOR2A Q8_0_I_1 (.A(\A_c[0] ), .B(\B_c[0] ), .Y(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[0] ));
    IOIN_IB \B_pad[3]/U0/U1  (.YIN(\B_pad[3]/U0/NET1 ), .Y(\B_c[3] ));
    OR2A Q9_0_I_2 (.A(\B_c[1] ), .B(\A_c[1] ), .Y(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[1] ));
    NOR2A Q9_0_I_8 (.A(\A_c[2] ), .B(\B_c[2] ), .Y(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[7] ));
    NOR2A Q9_0_I_1 (.A(\B_c[0] ), .B(\A_c[0] ), .Y(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[0] ));
    IOTRI_OB_EB \Q_pad[1]/U0/U1  (.D(Q10_NE), .E(VCC), .DOUT(
        \Q_pad[1]/U0/NET1 ), .EOUT(\Q_pad[1]/U0/NET2 ));
    IOIN_IB \A_pad[0]/U0/U1  (.YIN(\A_pad[0]/U0/NET1 ), .Y(\A_c[0] ));
    IOTRI_OB_EB \Q_pad[2]/U0/U1  (.D(\Q_c[2] ), .E(VCC), .DOUT(
        \Q_pad[2]/U0/NET1 ), .EOUT(\Q_pad[2]/U0/NET2 ));
    AND2A Q9_0_I_3 (.A(\B_c[1] ), .B(\A_c[1] ), .Y(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[2] ));
    OR2A Q8_0_I_9 (.A(\B_c[3] ), .B(\A_c[3] ), .Y(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[8] ));
    IOPAD_IN \B_pad[0]/U0/U0  (.PAD(B[0]), .Y(\B_pad[0]/U0/NET1 ));
    AOI1A Q8_0_I_10 (.A(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[7] ), .B(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[8] ), .C(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[5] ), .Y(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[10] ));
    AND2A Q8_0_I_3 (.A(\A_c[1] ), .B(\B_c[1] ), .Y(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[2] ));
    XO1 \Q_pad_RNO_2[1]  (.A(\B_c[1] ), .B(\A_c[1] ), .C(Q10_0), .Y(
        Q10_NE_0));
    NOR3 \Q_pad_RNO[1]  (.A(Q10_2), .B(Q10_3), .C(Q10_NE_0), .Y(Q10_NE)
        );
    AOI1A Q8_0_I_11 (.A(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[3] ), .B(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[6] ), .C(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[10] ), .Y(
        \Q_c[2] ));
    AOI1A Q9_0_I_10 (.A(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[7] ), .B(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[8] ), .C(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[5] ), .Y(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[10] ));
    AOI1A Q9_0_I_4 (.A(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[0] ), .B(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[1] ), .C(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[2] ), .Y(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[3] ));
    AOI1A Q9_0_I_11 (.A(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[3] ), .B(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[6] ), .C(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[10] ), .Y(
        \Q_c[0] ));
    IOPAD_IN \A_pad[3]/U0/U0  (.PAD(A[3]), .Y(\A_pad[3]/U0/NET1 ));
    IOIN_IB \B_pad[2]/U0/U1  (.YIN(\B_pad[2]/U0/NET1 ), .Y(\B_c[2] ));
    IOPAD_IN \B_pad[1]/U0/U0  (.PAD(B[1]), .Y(\B_pad[1]/U0/NET1 ));
    IOPAD_TRI \Q_pad[0]/U0/U0  (.D(\Q_pad[0]/U0/NET1 ), .E(
        \Q_pad[0]/U0/NET2 ), .PAD(Q[0]));
    NOR2A Q8_0_I_8 (.A(\B_c[2] ), .B(\A_c[2] ), .Y(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[7] ));
    IOPAD_IN \B_pad[3]/U0/U0  (.PAD(B[3]), .Y(\B_pad[3]/U0/NET1 ));
    OR2A Q8_0_I_2 (.A(\A_c[1] ), .B(\B_c[1] ), .Y(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[1] ));
    AOI1A Q8_0_I_7 (.A(\B_c[2] ), .B(\A_c[2] ), .C(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[5] ), .Y(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[6] ));
    IOPAD_TRI \Q_pad[1]/U0/U0  (.D(\Q_pad[1]/U0/NET1 ), .E(
        \Q_pad[1]/U0/NET2 ), .PAD(Q[1]));
    IOPAD_IN \A_pad[0]/U0/U0  (.PAD(A[0]), .Y(\A_pad[0]/U0/NET1 ));
    AOI1A Q8_0_I_4 (.A(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[0] ), .B(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[1] ), .C(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[2] ), .Y(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[3] ));
    IOPAD_TRI \Q_pad[2]/U0/U0  (.D(\Q_pad[2]/U0/NET1 ), .E(
        \Q_pad[2]/U0/NET2 ), .PAD(Q[2]));
    XOR2 \Q_pad_RNO_1[1]  (.A(\A_c[3] ), .B(\B_c[3] ), .Y(Q10_3));
    AOI1A Q9_0_I_7 (.A(\A_c[2] ), .B(\B_c[2] ), .C(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[5] ), .Y(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[6] ));
    IOIN_IB \A_pad[2]/U0/U1  (.YIN(\A_pad[2]/U0/NET1 ), .Y(\A_c[2] ));
    IOIN_IB \A_pad[1]/U0/U1  (.YIN(\A_pad[1]/U0/NET1 ), .Y(\A_c[1] ));
    XOR2 \Q_pad_RNO_3[1]  (.A(\A_c[0] ), .B(\B_c[0] ), .Y(Q10_0));
    OR2A Q9_0_I_9 (.A(\A_c[3] ), .B(\B_c[3] ), .Y(
        \Q9_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[8] ));
    IOPAD_IN \B_pad[2]/U0/U0  (.PAD(B[2]), .Y(\B_pad[2]/U0/NET1 ));
    NOR2A Q8_0_I_6 (.A(\A_c[3] ), .B(\B_c[3] ), .Y(
        \Q8_0.DWACT_COMP0_IF1_4.IF_equal_40.ACT_LT4_E[5] ));
    IOIN_IB \B_pad[0]/U0/U1  (.YIN(\B_pad[0]/U0/NET1 ), .Y(\B_c[0] ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
