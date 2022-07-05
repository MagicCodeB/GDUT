`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module Jfq(
       Cin,
       a,
       b,
       Cout,
       Result,
       Result_0,
       Result_1,
       Result_2
    );
input  Cin;
input  [3:0] a;
input  [3:0] b;
output Cout;
output Result;
output Result_0;
output Result_1;
output Result_2;

    wire INV_0_Y, \sum_net_0[0] , XOR2_0_Y, 
        \W_zh4_0.shiftedcarry_0_0.N_12 , \shiftedcarry_net_0[3] , 
        Cin_c, \a_c[0] , \a_c[1] , \a_c[2] , \a_c[3] , \b_c[0] , 
        \b_c[1] , \b_c[2] , \b_c[3] , Result_c, Result_0_c, Result_1_c, 
        Result_2_c, \W_zh4_0.shiftedcarry_0_0.N_19_i_i , 
        \W_zh4_0.shiftedcarry_0_0.N_20_i_i , 
        \W_zh4_0.shiftedcarry_0_0.N_21_i_i , \W_zh4_0/N_13 , 
        \W_zh4_0/shiftedcarry[1] , \Cin_pad/U0/NET1 , 
        \b_pad[3]/U0/NET1 , \b_pad[2]/U0/NET1 , \Result_1_pad/U0/NET1 , 
        \Result_1_pad/U0/NET2 , \a_pad[3]/U0/NET1 , 
        \Result_pad/U0/NET1 , \Result_pad/U0/NET2 , \Cout_pad/U0/NET1 , 
        \Cout_pad/U0/NET2 , \b_pad[1]/U0/NET1 , \a_pad[0]/U0/NET1 , 
        \Result_0_pad/U0/NET1 , \Result_0_pad/U0/NET2 , 
        \b_pad[0]/U0/NET1 , \a_pad[2]/U0/NET1 , \Result_2_pad/U0/NET1 , 
        \Result_2_pad/U0/NET2 , VCC, \a_pad[1]/U0/NET1 , GND, 
        AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    MX2 \newCore_0/MX2_Result  (.A(\sum_net_0[0] ), .B(INV_0_Y), .S(
        XOR2_0_Y), .Y(Result_c));
    IOPAD_IN \a_pad[2]/U0/U0  (.PAD(a[2]), .Y(\a_pad[2]/U0/NET1 ));
    IOPAD_IN \a_pad[1]/U0/U0  (.PAD(a[1]), .Y(\a_pad[1]/U0/NET1 ));
    IOTRI_OB_EB \Result_1_pad/U0/U1  (.D(Result_1_c), .E(VCC), .DOUT(
        \Result_1_pad/U0/NET1 ), .EOUT(\Result_1_pad/U0/NET2 ));
    IOIN_IB \a_pad[3]/U0/U1  (.YIN(\a_pad[3]/U0/NET1 ), .Y(\a_c[3] ));
    IOTRI_OB_EB \Result_pad/U0/U1  (.D(Result_c), .E(VCC), .DOUT(
        \Result_pad/U0/NET1 ), .EOUT(\Result_pad/U0/NET2 ));
    MAJ3 \W_zh4_0/shiftedcarry_0_0_ADD_4x4_slow_I1_CO1_i_o2  (.A(
        \W_zh4_0/shiftedcarry[1] ), .B(\a_c[1] ), .C(\b_c[1] ), .Y(
        \W_zh4_0/N_13 ));
    IOIN_IB \b_pad[1]/U0/U1  (.YIN(\b_pad[1]/U0/NET1 ), .Y(\b_c[1] ));
    IOTRI_OB_EB \Cout_pad/U0/U1  (.D(\W_zh4_0.shiftedcarry_0_0.N_12 ), 
        .E(VCC), .DOUT(\Cout_pad/U0/NET1 ), .EOUT(\Cout_pad/U0/NET2 ));
    IOIN_IB \b_pad[3]/U0/U1  (.YIN(\b_pad[3]/U0/NET1 ), .Y(\b_c[3] ));
    MX2 \newCore_1/MX2_Result  (.A(\W_zh4_0.shiftedcarry_0_0.N_19_i_i )
        , .B(INV_0_Y), .S(XOR2_0_Y), .Y(Result_0_c));
    IOPAD_TRI \Cout_pad/U0/U0  (.D(\Cout_pad/U0/NET1 ), .E(
        \Cout_pad/U0/NET2 ), .PAD(Cout));
    IOPAD_TRI \Result_pad/U0/U0  (.D(\Result_pad/U0/NET1 ), .E(
        \Result_pad/U0/NET2 ), .PAD(Result));
    IOIN_IB \a_pad[0]/U0/U1  (.YIN(\a_pad[0]/U0/NET1 ), .Y(\a_c[0] ));
    XOR3 \W_zh4_0/shiftedcarry_0_0_ADD_4x4_slow_I1_S_i_x2  (.A(
        \a_c[2] ), .B(\b_c[2] ), .C(\W_zh4_0/N_13 ), .Y(
        \W_zh4_0.shiftedcarry_0_0.N_20_i_i ));
    IOPAD_IN \b_pad[0]/U0/U0  (.PAD(b[0]), .Y(\b_pad[0]/U0/NET1 ));
    IOPAD_IN \Cin_pad/U0/U0  (.PAD(Cin), .Y(\Cin_pad/U0/NET1 ));
    IOPAD_IN \a_pad[3]/U0/U0  (.PAD(a[3]), .Y(\a_pad[3]/U0/NET1 ));
    IOIN_IB \b_pad[2]/U0/U1  (.YIN(\b_pad[2]/U0/NET1 ), .Y(\b_c[2] ));
    IOPAD_IN \b_pad[1]/U0/U0  (.PAD(b[1]), .Y(\b_pad[1]/U0/NET1 ));
    IOPAD_TRI \Result_0_pad/U0/U0  (.D(\Result_0_pad/U0/NET1 ), .E(
        \Result_0_pad/U0/NET2 ), .PAD(Result_0));
    IOPAD_IN \b_pad[3]/U0/U0  (.PAD(b[3]), .Y(\b_pad[3]/U0/NET1 ));
    IOIN_IB \Cin_pad/U0/U1  (.YIN(\Cin_pad/U0/NET1 ), .Y(Cin_c));
    IOPAD_IN \a_pad[0]/U0/U0  (.PAD(a[0]), .Y(\a_pad[0]/U0/NET1 ));
    IOPAD_TRI \Result_2_pad/U0/U0  (.D(\Result_2_pad/U0/NET1 ), .E(
        \Result_2_pad/U0/NET2 ), .PAD(Result_2));
    XOR2 XOR2_0 (.A(\shiftedcarry_net_0[3] ), .B(
        \W_zh4_0.shiftedcarry_0_0.N_12 ), .Y(XOR2_0_Y));
    IOTRI_OB_EB \Result_0_pad/U0/U1  (.D(Result_0_c), .E(VCC), .DOUT(
        \Result_0_pad/U0/NET1 ), .EOUT(\Result_0_pad/U0/NET2 ));
    IOIN_IB \a_pad[2]/U0/U1  (.YIN(\a_pad[2]/U0/NET1 ), .Y(\a_c[2] ));
    IOIN_IB \a_pad[1]/U0/U1  (.YIN(\a_pad[1]/U0/NET1 ), .Y(\a_c[1] ));
    MAJ3 \W_zh4_0/shiftedcarry_0_0_ADD_4x4_slow_I1_CO1_i_o3  (.A(
        \W_zh4_0/N_13 ), .B(\a_c[2] ), .C(\b_c[2] ), .Y(
        \shiftedcarry_net_0[3] ));
    XOR3 \W_zh4_0/shiftedcarry_1_SUM0  (.A(\b_c[0] ), .B(\a_c[0] ), .C(
        Cin_c), .Y(\sum_net_0[0] ));
    XOR3 \W_zh4_0/shiftedcarry_0_0_ADD_4x4_slow_I3_S_i_x2  (.A(
        \a_c[3] ), .B(\b_c[3] ), .C(\shiftedcarry_net_0[3] ), .Y(
        \W_zh4_0.shiftedcarry_0_0.N_21_i_i ));
    MAJ3 \W_zh4_0/shiftedcarry_0_0_ADD_4x4_slow_I3_CO1_i  (.A(\a_c[3] )
        , .B(\b_c[3] ), .C(\shiftedcarry_net_0[3] ), .Y(
        \W_zh4_0.shiftedcarry_0_0.N_12 ));
    IOPAD_IN \b_pad[2]/U0/U0  (.PAD(b[2]), .Y(\b_pad[2]/U0/NET1 ));
    MAJ3 \W_zh4_0/shiftedcarry_1_CO0  (.A(\a_c[0] ), .B(\b_c[0] ), .C(
        Cin_c), .Y(\W_zh4_0/shiftedcarry[1] ));
    XOR3 \W_zh4_0/shiftedcarry_0_0_ADD_4x4_slow_I0_S_i_x2  (.A(
        \a_c[1] ), .B(\b_c[1] ), .C(\W_zh4_0/shiftedcarry[1] ), .Y(
        \W_zh4_0.shiftedcarry_0_0.N_19_i_i ));
    INV INV_0 (.A(\a_c[3] ), .Y(INV_0_Y));
    MX2 \newCore_3/MX2_Result  (.A(\W_zh4_0.shiftedcarry_0_0.N_21_i_i )
        , .B(\a_c[3] ), .S(XOR2_0_Y), .Y(Result_2_c));
    IOIN_IB \b_pad[0]/U0/U1  (.YIN(\b_pad[0]/U0/NET1 ), .Y(\b_c[0] ));
    IOPAD_TRI \Result_1_pad/U0/U0  (.D(\Result_1_pad/U0/NET1 ), .E(
        \Result_1_pad/U0/NET2 ), .PAD(Result_1));
    IOTRI_OB_EB \Result_2_pad/U0/U1  (.D(Result_2_c), .E(VCC), .DOUT(
        \Result_2_pad/U0/NET1 ), .EOUT(\Result_2_pad/U0/NET2 ));
    MX2 \newCore_2/MX2_Result  (.A(\W_zh4_0.shiftedcarry_0_0.N_20_i_i )
        , .B(INV_0_Y), .S(XOR2_0_Y), .Y(Result_1_c));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
