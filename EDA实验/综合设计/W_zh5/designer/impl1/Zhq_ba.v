`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module Zhq(
       DataIn,
       bai,
       ge,
       shi
    );
input  [7:0] DataIn;
output [3:0] bai;
output [3:0] ge;
output [3:0] shi;

    wire GND, ADD_6x6_slow_I3_S, 
        \W_zh5_0.un1_ge.if_generate_plus.mult1_un1_sum.DWACT_ADD_CI_0_partial_sum[1] , 
        \DataIn_c[0] , \DataIn_c[1] , \DataIn_c[2] , \DataIn_c[3] , 
        \DataIn_c[4] , \DataIn_c[5] , \DataIn_c[6] , \DataIn_c[7] , 
        \ge_c[2] , \ge_c[3] , 
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un59_sum.I5_un3_CO1 , 
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un52_sum.I5_un3_CO1 , 
        \W_zh5_0.un1_ge.if_generate_plus.mult1_un61_sum.N98 , 
        \W_zh5_0.un12_shi.if_generate_plus.mult1_un215_sum.I3_un3_CO1 , 
        \W_zh5_0.un12_shi.if_generate_plus.mult1_un208_sum.I3_un3_CO1 , 
        \W_zh5_0/DWACT_ADD_CI_0_g_array_12[0] , 
        \W_zh5_0/DWACT_ADD_CI_0_g_array_0_1[0] , 
        \W_zh5_0/ADD_6x6_slow_I1_S , \W_zh5_0/ADD_9x9_slow_I4_S_0 , 
        \W_zh5_0/ADD_6x6_slow_I3_S_2 , \W_zh5_0/N94 , 
        \W_zh5_0/mult1_un40_sum[4] , \W_zh5_0/mult1_un47_sum[4] , 
        \W_zh5_0/ADD_6x6_slow_I3_S_1 , \W_zh5_0/N94_0 , 
        \W_zh5_0/ADD_6x6_slow_I3_S_0 , \W_zh5_0/mult1_un38_sum[3] , 
        \W_zh5_0/mult1_un33_sum_i_0[5] , 
        \W_zh5_0/ADD_6x6_slow_I3_S_1_0 , \W_zh5_0/N_34 , 
        \W_zh5_0/N_41_mux_i , \W_zh5_0/ADD_6x6_slow_I3_S_0_0 , 
        \W_zh5_0/mult1_un208_sum[2] , \W_zh5_0/m30_2 , \W_zh5_0/N_144 , 
        \W_zh5_0/i4_mux , \W_zh5_0/N_33 , \W_zh5_0/N_31 , 
        \W_zh5_0/N_145 , \W_zh5_0/i6_mux , \W_zh5_0/ADD_6x6_slow_I2_S , 
        \W_zh5_0/mult1_un54_sum[4] , \W_zh5_0/mult1_un54_sum[2] , 
        \W_zh5_0/N94_1 , \W_zh5_0/mult1_un40_sum[2] , \W_zh5_0/N_140 , 
        \W_zh5_0/N_41 , \W_zh5_0/I2_un1_CO1 , 
        \W_zh5_0/mult1_un215_sum[2] , \W_zh5_0/mult1_un54_sum[3] , 
        \W_zh5_0/mult1_un47_sum[2] , \W_zh5_0/N94_2 , 
        \W_zh5_0/I2_un1_CO1_0 , \W_zh5_0/I2_un1_CO1_1 , \W_zh5_0/N125 , 
        \W_zh5_0/I2_un1_CO1_2 , \W_zh5_0/mult1_un38_sum[4] , 
        \W_zh5_0/mult1_un45_sum_i[6] , \W_zh5_0/I2_un1_CO1_3 , 
        \W_zh5_0/ADD_9x9_slow_I3_CO1_0_tz , 
        \W_zh5_0/mult1_un52_sum[3] , 
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz , \W_zh5_0/shi[2] , 
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz_0 , 
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz_1 , 
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz_2 , 
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz_3 , \W_zh5_0/N129 , 
        \W_zh5_0/mult1_un52_sum[4] , \W_zh5_0/I3_un5_CO1 , 
        \W_zh5_0/I2_un5_CO1 , \W_zh5_0/I2_un5_CO1_0 , 
        \W_zh5_0/I2_un5_CO1_1 , \W_zh5_0/I2_un1_CO1_4 , 
        \W_zh5_0/I2_un5_CO1_2 , \W_zh5_0/I2_un5_CO1_3 , 
        \W_zh5_0/N_141 , \W_zh5_0/N_142 , \W_zh5_0/N_40_mux , 
        \W_zh5_0/mult1_un208_sum[3] , \W_zh5_0/N_4_0 , 
        \W_zh5_0/I1_un2_CO1 , \W_zh5_0/I1_un3_CO1 , 
        \W_zh5_0/mult1_un45_sum[4] , \W_zh5_0/I2_un4_CO1 , 
        \W_zh5_0/mult1_un52_sum[5] , \W_zh5_0/I4_un1_CO1 , 
        \W_zh5_0/N129_0 , \W_zh5_0/mult1_un45_sum[5] , 
        \ge_pad[1]/U0/NET1 , \ge_pad[1]/U0/NET2 , 
        \DataIn_pad[4]/U0/NET1 , \DataIn_pad[5]/U0/NET1 , 
        \DataIn_pad[7]/U0/NET1 , \DataIn_pad[2]/U0/NET1 , 
        \ge_pad[2]/U0/NET1 , \ge_pad[2]/U0/NET2 , \bai_pad[3]/U0/NET1 , 
        \bai_pad[3]/U0/NET2 , \DataIn_pad[0]/U0/NET1 , 
        \ge_pad[0]/U0/NET1 , \ge_pad[0]/U0/NET2 , 
        \DataIn_pad[1]/U0/NET1 , \shi_pad[3]/U0/NET1 , 
        \shi_pad[3]/U0/NET2 , \bai_pad[1]/U0/NET1 , 
        \bai_pad[1]/U0/NET2 , \bai_pad[0]/U0/NET1 , 
        \bai_pad[0]/U0/NET2 , \DataIn_pad[6]/U0/NET1 , 
        \bai_pad[2]/U0/NET1 , \bai_pad[2]/U0/NET2 , 
        \DataIn_pad[3]/U0/NET1 , \ge_pad[3]/U0/NET1 , 
        \ge_pad[3]/U0/NET2 , \shi_pad[1]/U0/NET1 , 
        \shi_pad[1]/U0/NET2 , \shi_pad[0]/U0/NET1 , 
        \shi_pad[0]/U0/NET2 , \shi_pad[2]/U0/NET1 , 
        \shi_pad[2]/U0/NET2 , VCC, AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    OA1B 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un52_sum_ADD_9x9_slow_I5_un3_CO1  
        (.A(\W_zh5_0/mult1_un45_sum[5] ), .B(\W_zh5_0/N129_0 ), .C(
        \W_zh5_0/mult1_un45_sum_i[6] ), .Y(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un52_sum.I5_un3_CO1 ));
    AO13 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un59_sum_ADD_9x9_slow_I1_CO1  
        (.A(\DataIn_c[2] ), .B(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un52_sum.I5_un3_CO1 ), 
        .C(\DataIn_c[3] ), .Y(\W_zh5_0/N125 ));
    IOIN_IB \DataIn_pad[4]/U0/U1  (.YIN(\DataIn_pad[4]/U0/NET1 ), .Y(
        \DataIn_c[4] ));
    XNOR3 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un40_sum_ADD_6x6_slow_I3_S  
        (.A(\W_zh5_0/mult1_un33_sum_i_0[5] ), .B(
        \W_zh5_0/I2_un1_CO1_2 ), .C(\W_zh5_0/mult1_un38_sum[4] ), .Y(
        \W_zh5_0/mult1_un40_sum[4] ));
    NOR3A 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un45_sum_ADD_9x9_slow_I2_un4_CO1  
        (.A(\DataIn_c[4] ), .B(\DataIn_c[5] ), .C(\DataIn_c[6] ), .Y(
        \W_zh5_0/I2_un1_CO1_3 ));
    IOPAD_TRI \bai_pad[2]/U0/U0  (.D(\bai_pad[2]/U0/NET1 ), .E(
        \bai_pad[2]/U0/NET2 ), .PAD(bai[2]));
    MX2A \W_zh5_0/shi.shi_11_m6  (.A(\W_zh5_0/N_4_0 ), .B(
        \W_zh5_0/I1_un2_CO1 ), .S(\W_zh5_0/N_41 ), .Y(
        \W_zh5_0/N_40_mux ));
    AX1C 
        \W_zh5_0/un12_shi_if_generate_plus.mult1_un208_sum_ADD_6x6_slow_I2_S  
        (.A(\W_zh5_0/N_34 ), .B(\W_zh5_0/N_33 ), .C(\W_zh5_0/N_31 ), 
        .Y(\W_zh5_0/mult1_un208_sum[3] ));
    XOR3 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un61_sum_ADD_6x6_slow_I2_S  
        (.A(\W_zh5_0/mult1_un54_sum[4] ), .B(
        \W_zh5_0/mult1_un54_sum[2] ), .C(\W_zh5_0/N94_1 ), .Y(
        \W_zh5_0/ADD_6x6_slow_I2_S ));
    XOR2 \W_zh5_0/shi.shi_11_m1  (.A(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un59_sum.I5_un3_CO1 ), 
        .B(\DataIn_c[2] ), .Y(\W_zh5_0/shi[2] ));
    IOPAD_IN \DataIn_pad[1]/U0/U0  (.PAD(DataIn[1]), .Y(
        \DataIn_pad[1]/U0/NET1 ));
    AOI1 
        \W_zh5_0/un12_shi_if_generate_plus.mult1_un208_sum_ADD_6x6_slow_I3_un3_CO1  
        (.A(\W_zh5_0/N_33 ), .B(\W_zh5_0/N_34 ), .C(\W_zh5_0/N_31 ), 
        .Y(
        \W_zh5_0.un12_shi.if_generate_plus.mult1_un208_sum.I3_un3_CO1 )
        );
    IOIN_IB \DataIn_pad[0]/U0/U1  (.YIN(\DataIn_pad[0]/U0/NET1 ), .Y(
        \DataIn_c[0] ));
    XOR3 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un47_sum_ADD_6x6_slow_I3_S  
        (.A(\W_zh5_0/ADD_6x6_slow_I3_S_0 ), .B(\W_zh5_0/I2_un1_CO1_0 ), 
        .C(\W_zh5_0/ADD_6x6_slow_I3_S_1 ), .Y(
        \W_zh5_0/mult1_un47_sum[4] ));
    OR2 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un54_sum_ADD_6x6_slow_I2_un1_CO1_0_tz  
        (.A(\W_zh5_0/N94_2 ), .B(\W_zh5_0/mult1_un47_sum[4] ), .Y(
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz_1 ));
    NOR2A \W_zh5_0/shi.shi_11_m3  (.A(\W_zh5_0/N_140 ), .B(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un52_sum.I5_un3_CO1 ), 
        .Y(\W_zh5_0/N_4_0 ));
    IOTRI_OB_EB \shi_pad[2]/U0/U1  (.D(
        \W_zh5_0.un12_shi.if_generate_plus.mult1_un215_sum.I3_un3_CO1 )
        , .E(VCC), .DOUT(\shi_pad[2]/U0/NET1 ), .EOUT(
        \shi_pad[2]/U0/NET2 ));
    XNOR2 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un45_sum_ADD_9x9_slow_I3_S  
        (.A(\W_zh5_0/mult1_un38_sum[4] ), .B(\W_zh5_0/I2_un1_CO1_3 ), 
        .Y(\W_zh5_0/mult1_un45_sum[5] ));
    IOPAD_IN \DataIn_pad[7]/U0/U0  (.PAD(DataIn[7]), .Y(
        \DataIn_pad[7]/U0/NET1 ));
    OR3B 
        \W_zh5_0/un12_shi_if_generate_plus.mult1_un222_sum_ADD_6x6_slow_I2_un1_CO1_0_tz  
        (.A(\W_zh5_0/N_41_mux_i ), .B(
        \W_zh5_0.un12_shi.if_generate_plus.mult1_un215_sum.I3_un3_CO1 )
        , .C(\W_zh5_0/shi[2] ), .Y(
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz ));
    XNOR2 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un47_sum_ADD_6x6_slow_I3_S_0  
        (.A(\W_zh5_0/mult1_un38_sum[3] ), .B(
        \W_zh5_0/mult1_un33_sum_i_0[5] ), .Y(
        \W_zh5_0/ADD_6x6_slow_I3_S_0 ));
    NOR2B \W_zh5_0/un1_ge_if_generate_plus.mult1_un1_sum_I_22  (.A(
        \W_zh5_0/DWACT_ADD_CI_0_g_array_0_1[0] ), .B(
        \W_zh5_0/ADD_6x6_slow_I1_S ), .Y(
        \W_zh5_0/DWACT_ADD_CI_0_g_array_12[0] ));
    AO13 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un40_sum_ADD_6x6_slow_I1_CO1  
        (.A(\W_zh5_0/mult1_un33_sum_i_0[5] ), .B(\DataIn_c[4] ), .C(
        \DataIn_c[5] ), .Y(\W_zh5_0/N94_0 ));
    AX1B 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un38_sum_ADD_9x9_slow_I2_S  
        (.A(\DataIn_c[5] ), .B(\DataIn_c[6] ), .C(\DataIn_c[7] ), .Y(
        \W_zh5_0/mult1_un38_sum[4] ));
    IOTRI_OB_EB \ge_pad[1]/U0/U1  (.D(
        \W_zh5_0.un1_ge.if_generate_plus.mult1_un1_sum.DWACT_ADD_CI_0_partial_sum[1] )
        , .E(VCC), .DOUT(\ge_pad[1]/U0/NET1 ), .EOUT(
        \ge_pad[1]/U0/NET2 ));
    XOR3 \W_zh5_0/shi.shi_11_m30_2  (.A(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un59_sum.I5_un3_CO1 ), 
        .B(\DataIn_c[6] ), .C(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un52_sum.I5_un3_CO1 ), 
        .Y(\W_zh5_0/m30_2 ));
    IOTRI_OB_EB \bai_pad[0]/U0/U1  (.D(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un59_sum.I5_un3_CO1 ), 
        .E(VCC), .DOUT(\bai_pad[0]/U0/NET1 ), .EOUT(
        \bai_pad[0]/U0/NET2 ));
    IOPAD_TRI \ge_pad[1]/U0/U0  (.D(\ge_pad[1]/U0/NET1 ), .E(
        \ge_pad[1]/U0/NET2 ), .PAD(ge[1]));
    IOTRI_OB_EB \bai_pad[3]/U0/U1  (.D(GND), .E(VCC), .DOUT(
        \bai_pad[3]/U0/NET1 ), .EOUT(\bai_pad[3]/U0/NET2 ));
    IOTRI_OB_EB \shi_pad[3]/U0/U1  (.D(
        \W_zh5_0.un12_shi.if_generate_plus.mult1_un208_sum.I3_un3_CO1 )
        , .E(VCC), .DOUT(\shi_pad[3]/U0/NET1 ), .EOUT(
        \shi_pad[3]/U0/NET2 ));
    AX1B 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un45_sum_ADD_9x9_slow_I2_S  
        (.A(\DataIn_c[4] ), .B(\DataIn_c[5] ), .C(\DataIn_c[6] ), .Y(
        \W_zh5_0/mult1_un45_sum[4] ));
    OA1 
        \W_zh5_0/un12_shi_if_generate_plus.mult1_un215_sum_ADD_6x6_slow_I3_un3_CO1  
        (.A(\W_zh5_0/mult1_un208_sum[2] ), .B(\W_zh5_0/I1_un3_CO1 ), 
        .C(\W_zh5_0/mult1_un208_sum[3] ), .Y(
        \W_zh5_0.un12_shi.if_generate_plus.mult1_un215_sum.I3_un3_CO1 )
        );
    AO18 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un61_sum_ADD_6x6_slow_I1_CO1  
        (.A(\DataIn_c[2] ), .B(\DataIn_c[1] ), .C(
        \W_zh5_0/mult1_un54_sum[4] ), .Y(\W_zh5_0/N94_1 ));
    IOPAD_IN \DataIn_pad[2]/U0/U0  (.PAD(DataIn[2]), .Y(
        \DataIn_pad[2]/U0/NET1 ));
    IOTRI_OB_EB \bai_pad[1]/U0/U1  (.D(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un52_sum.I5_un3_CO1 ), 
        .E(VCC), .DOUT(\bai_pad[1]/U0/NET1 ), .EOUT(
        \bai_pad[1]/U0/NET2 ));
    IOPAD_IN \DataIn_pad[5]/U0/U0  (.PAD(DataIn[5]), .Y(
        \DataIn_pad[5]/U0/NET1 ));
    OR2A 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un40_sum_ADD_6x6_slow_I2_un1_CO1_0_tz  
        (.A(\W_zh5_0/mult1_un33_sum_i_0[5] ), .B(\W_zh5_0/N94_0 ), .Y(
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz_3 ));
    AO1A 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un59_sum_ADD_9x9_slow_I4_un1_CO1  
        (.A(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un52_sum.I5_un3_CO1 ), 
        .B(\W_zh5_0/N129 ), .C(\W_zh5_0/mult1_un52_sum[5] ), .Y(
        \W_zh5_0/I4_un1_CO1 ));
    XOR3 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un54_sum_ADD_6x6_slow_I2_S  
        (.A(\W_zh5_0/mult1_un47_sum[4] ), .B(
        \W_zh5_0/mult1_un47_sum[2] ), .C(\W_zh5_0/N94_2 ), .Y(
        \W_zh5_0/mult1_un54_sum[3] ));
    XOR2 \W_zh5_0/shi.shi_1  (.A(\DataIn_c[2] ), .B(\DataIn_c[3] ), .Y(
        \W_zh5_0/N_140 ));
    IOPAD_IN \DataIn_pad[4]/U0/U0  (.PAD(DataIn[4]), .Y(
        \DataIn_pad[4]/U0/NET1 ));
    AO18 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un47_sum_ADD_6x6_slow_I1_CO1  
        (.A(\W_zh5_0/mult1_un40_sum[4] ), .B(\DataIn_c[3] ), .C(
        \DataIn_c[4] ), .Y(\W_zh5_0/N94 ));
    XOR3 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un54_sum_ADD_6x6_slow_I3_S  
        (.A(\W_zh5_0/I2_un1_CO1_1 ), .B(\W_zh5_0/mult1_un40_sum[2] ), 
        .C(\W_zh5_0/ADD_6x6_slow_I3_S_2 ), .Y(
        \W_zh5_0/mult1_un54_sum[4] ));
    NOR3B 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un47_sum_ADD_6x6_slow_I2_un5_CO1  
        (.A(\DataIn_c[3] ), .B(\W_zh5_0/mult1_un40_sum[4] ), .C(
        \DataIn_c[4] ), .Y(\W_zh5_0/I2_un5_CO1_0 ));
    AO13 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un61_sum_ADD_6x6_slow_I3_CO1  
        (.A(\W_zh5_0/I2_un1_CO1_4 ), .B(\W_zh5_0/mult1_un54_sum[3] ), 
        .C(\W_zh5_0/mult1_un54_sum[4] ), .Y(
        \W_zh5_0.un1_ge.if_generate_plus.mult1_un61_sum.N98 ));
    IOIN_IB \DataIn_pad[6]/U0/U1  (.YIN(\DataIn_pad[6]/U0/NET1 ), .Y(
        \DataIn_c[6] ));
    NOR3B 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un54_sum_ADD_6x6_slow_I2_un5_CO1  
        (.A(\DataIn_c[2] ), .B(\W_zh5_0/mult1_un47_sum[4] ), .C(
        \DataIn_c[3] ), .Y(\W_zh5_0/I2_un5_CO1_1 ));
    IOPAD_IN \DataIn_pad[0]/U0/U0  (.PAD(DataIn[0]), .Y(
        \DataIn_pad[0]/U0/NET1 ));
    AX1B 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un45_sum_ADD_9x9_slow_I4_S  
        (.A(\W_zh5_0/mult1_un38_sum[4] ), .B(\W_zh5_0/I2_un1_CO1_3 ), 
        .C(\W_zh5_0/ADD_9x9_slow_I4_S_0 ), .Y(
        \W_zh5_0/mult1_un45_sum_i[6] ));
    IOTRI_OB_EB \shi_pad[1]/U0/U1  (.D(ADD_6x6_slow_I3_S), .E(VCC), 
        .DOUT(\shi_pad[1]/U0/NET1 ), .EOUT(\shi_pad[1]/U0/NET2 ));
    NOR3B 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un61_sum_ADD_6x6_slow_I2_un5_CO1  
        (.A(\DataIn_c[1] ), .B(\W_zh5_0/mult1_un54_sum[4] ), .C(
        \DataIn_c[2] ), .Y(\W_zh5_0/I2_un5_CO1_3 ));
    XNOR2 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un38_sum_ADD_9x9_slow_I1_S  
        (.A(\DataIn_c[6] ), .B(\DataIn_c[5] ), .Y(
        \W_zh5_0/mult1_un38_sum[3] ));
    XOR3 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un47_sum_ADD_6x6_slow_I1_S  
        (.A(\DataIn_c[3] ), .B(\W_zh5_0/mult1_un40_sum[4] ), .C(
        \DataIn_c[4] ), .Y(\W_zh5_0/mult1_un47_sum[2] ));
    OR3A 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un59_sum_ADD_9x9_slow_I3_CO1_0_tz  
        (.A(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un52_sum.I5_un3_CO1 ), 
        .B(\W_zh5_0/mult1_un52_sum[3] ), .C(\W_zh5_0/N125 ), .Y(
        \W_zh5_0/ADD_9x9_slow_I3_CO1_0_tz ));
    IOTRI_OB_EB \ge_pad[2]/U0/U1  (.D(\ge_c[2] ), .E(VCC), .DOUT(
        \ge_pad[2]/U0/NET1 ), .EOUT(\ge_pad[2]/U0/NET2 ));
    NOR3A 
        \W_zh5_0/un12_shi_if_generate_plus.mult1_un222_sum_ADD_6x6_slow_I2_un5_CO1  
        (.A(\W_zh5_0/shi[2] ), .B(\W_zh5_0/N_41_mux_i ), .C(
        \W_zh5_0.un12_shi.if_generate_plus.mult1_un215_sum.I3_un3_CO1 )
        , .Y(\W_zh5_0/I2_un5_CO1_2 ));
    IOPAD_TRI \ge_pad[2]/U0/U0  (.D(\ge_pad[2]/U0/NET1 ), .E(
        \ge_pad[2]/U0/NET2 ), .PAD(ge[2]));
    NOR3A 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un52_sum_ADD_9x9_slow_I2_un4_CO1  
        (.A(\DataIn_c[3] ), .B(\DataIn_c[5] ), .C(\DataIn_c[4] ), .Y(
        \W_zh5_0/I2_un4_CO1 ));
    XOR3 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un61_sum_ADD_6x6_slow_I1_S  
        (.A(\W_zh5_0/mult1_un54_sum[4] ), .B(\DataIn_c[1] ), .C(
        \DataIn_c[2] ), .Y(\W_zh5_0/ADD_6x6_slow_I1_S ));
    IOTRI_OB_EB \shi_pad[0]/U0/U1  (.D(
        \W_zh5_0.un1_ge.if_generate_plus.mult1_un61_sum.N98 ), .E(VCC), 
        .DOUT(\shi_pad[0]/U0/NET1 ), .EOUT(\shi_pad[0]/U0/NET2 ));
    XNOR2 
        \W_zh5_0/un12_shi_if_generate_plus.mult1_un208_sum_ADD_6x6_slow_I1_S  
        (.A(\W_zh5_0/N_34 ), .B(\W_zh5_0/N_33 ), .Y(
        \W_zh5_0/mult1_un208_sum[2] ));
    IOPAD_TRI \shi_pad[2]/U0/U0  (.D(\shi_pad[2]/U0/NET1 ), .E(
        \shi_pad[2]/U0/NET2 ), .PAD(shi[2]));
    AO1 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un61_sum_ADD_6x6_slow_I2_un1_CO1  
        (.A(\W_zh5_0/mult1_un54_sum[2] ), .B(
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz_0 ), .C(
        \W_zh5_0/I2_un5_CO1_3 ), .Y(\W_zh5_0/I2_un1_CO1_4 ));
    XNOR3 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un40_sum_ADD_6x6_slow_I1_S  
        (.A(\DataIn_c[4] ), .B(\W_zh5_0/mult1_un33_sum_i_0[5] ), .C(
        \DataIn_c[5] ), .Y(\W_zh5_0/mult1_un40_sum[2] ));
    AO1 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un47_sum_ADD_6x6_slow_I2_un1_CO1  
        (.A(\W_zh5_0/mult1_un40_sum[2] ), .B(
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz_2 ), .C(
        \W_zh5_0/I2_un5_CO1_0 ), .Y(\W_zh5_0/I2_un1_CO1_0 ));
    XNOR2 \W_zh5_0/shi.shi_11_m33  (.A(\W_zh5_0/N_142 ), .B(
        \W_zh5_0/N_40_mux ), .Y(\W_zh5_0/N_34 ));
    XOR2 \W_zh5_0/un1_ge_if_generate_plus.mult1_un1_sum_I_12  (.A(
        \DataIn_c[1] ), .B(
        \W_zh5_0.un1_ge.if_generate_plus.mult1_un61_sum.N98 ), .Y(
        \W_zh5_0.un1_ge.if_generate_plus.mult1_un1_sum.DWACT_ADD_CI_0_partial_sum[1] )
        );
    NOR2A \W_zh5_0/shi.shi_11_m9  (.A(\W_zh5_0/N_40_mux ), .B(
        \W_zh5_0/N_142 ), .Y(\W_zh5_0/i4_mux ));
    NOR3B 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un59_sum_ADD_9x9_slow_I3_un5_CO1  
        (.A(\W_zh5_0/N125 ), .B(\W_zh5_0/mult1_un52_sum[3] ), .C(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un52_sum.I5_un3_CO1 ), 
        .Y(\W_zh5_0/I3_un5_CO1 ));
    OR2 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un47_sum_ADD_6x6_slow_I2_un1_CO1_0_tz  
        (.A(\W_zh5_0/N94 ), .B(\W_zh5_0/mult1_un40_sum[4] ), .Y(
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz_2 ));
    IOPAD_TRI \shi_pad[3]/U0/U0  (.D(\shi_pad[3]/U0/NET1 ), .E(
        \shi_pad[3]/U0/NET2 ), .PAD(shi[3]));
    AO13 \W_zh5_0/shi.shi_11_m12  (.A(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un59_sum.I5_un3_CO1 ), 
        .B(\W_zh5_0/i4_mux ), .C(\W_zh5_0/N_144 ), .Y(\W_zh5_0/i6_mux )
        );
    IOTRI_OB_EB \bai_pad[2]/U0/U1  (.D(GND), .E(VCC), .DOUT(
        \bai_pad[2]/U0/NET1 ), .EOUT(\bai_pad[2]/U0/NET2 ));
    XOR2 
        \W_zh5_0/un12_shi_if_generate_plus.mult1_un222_sum_ADD_6x6_slow_I3_S_0  
        (.A(\W_zh5_0/mult1_un208_sum[2] ), .B(
        \W_zh5_0.un12_shi.if_generate_plus.mult1_un215_sum.I3_un3_CO1 )
        , .Y(\W_zh5_0/ADD_6x6_slow_I3_S_0_0 ));
    NOR2 \W_zh5_0/un1_ge_if_generate_plus.mult1_un1_sum_I_6  (.A(
        \DataIn_c[1] ), .B(
        \W_zh5_0.un1_ge.if_generate_plus.mult1_un61_sum.N98 ), .Y(
        \W_zh5_0/DWACT_ADD_CI_0_g_array_0_1[0] ));
    XNOR3 \W_zh5_0/shi.shi_11_m32  (.A(\W_zh5_0/N_144 ), .B(
        \W_zh5_0/i4_mux ), .C(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un59_sum.I5_un3_CO1 ), 
        .Y(\W_zh5_0/N_33 ));
    XOR3 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un54_sum_ADD_6x6_slow_I1_S  
        (.A(\DataIn_c[2] ), .B(\W_zh5_0/mult1_un47_sum[4] ), .C(
        \DataIn_c[3] ), .Y(\W_zh5_0/mult1_un54_sum[2] ));
    IOTRI_OB_EB \ge_pad[3]/U0/U1  (.D(\ge_c[3] ), .E(VCC), .DOUT(
        \ge_pad[3]/U0/NET1 ), .EOUT(\ge_pad[3]/U0/NET2 ));
    IOPAD_IN \DataIn_pad[6]/U0/U0  (.PAD(DataIn[6]), .Y(
        \DataIn_pad[6]/U0/NET1 ));
    IOPAD_TRI \bai_pad[0]/U0/U0  (.D(\bai_pad[0]/U0/NET1 ), .E(
        \bai_pad[0]/U0/NET2 ), .PAD(bai[0]));
    XNOR3 \W_zh5_0/shi.shi_11_m37  (.A(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un52_sum.I5_un3_CO1 ), 
        .B(\W_zh5_0/N_140 ), .C(\W_zh5_0/N_41 ), .Y(
        \W_zh5_0/N_41_mux_i ));
    IOPAD_TRI \bai_pad[3]/U0/U0  (.D(\bai_pad[3]/U0/NET1 ), .E(
        \bai_pad[3]/U0/NET2 ), .PAD(bai[3]));
    IOIN_IB \DataIn_pad[3]/U0/U1  (.YIN(\DataIn_pad[3]/U0/NET1 ), .Y(
        \DataIn_c[3] ));
    IOPAD_TRI \ge_pad[3]/U0/U0  (.D(\ge_pad[3]/U0/NET1 ), .E(
        \ge_pad[3]/U0/NET2 ), .PAD(ge[3]));
    NOR2B 
        \W_zh5_0/un12_shi_if_generate_plus.mult1_un215_sum_ADD_6x6_slow_I1_un3_CO1  
        (.A(\W_zh5_0/N_41_mux_i ), .B(\W_zh5_0/N_34 ), .Y(
        \W_zh5_0/I1_un3_CO1 ));
    XOR2 \W_zh5_0/shi.shi_3  (.A(\W_zh5_0/N_141 ), .B(\DataIn_c[4] ), 
        .Y(\W_zh5_0/N_142 ));
    XNOR3 \W_zh5_0/shi.shi_11_m30  (.A(\W_zh5_0/N_145 ), .B(
        \W_zh5_0/i6_mux ), .C(\W_zh5_0/m30_2 ), .Y(\W_zh5_0/N_31 ));
    IOTRI_OB_EB \ge_pad[0]/U0/U1  (.D(\DataIn_c[0] ), .E(VCC), .DOUT(
        \ge_pad[0]/U0/NET1 ), .EOUT(\ge_pad[0]/U0/NET2 ));
    IOPAD_TRI \bai_pad[1]/U0/U0  (.D(\bai_pad[1]/U0/NET1 ), .E(
        \bai_pad[1]/U0/NET2 ), .PAD(bai[1]));
    IOPAD_TRI \ge_pad[0]/U0/U0  (.D(\ge_pad[0]/U0/NET1 ), .E(
        \ge_pad[0]/U0/NET2 ), .PAD(ge[0]));
    AX1B 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un52_sum_ADD_9x9_slow_I2_S  
        (.A(\DataIn_c[3] ), .B(\DataIn_c[4] ), .C(\DataIn_c[5] ), .Y(
        \W_zh5_0/mult1_un52_sum[4] ));
    XNOR3 
        \W_zh5_0/un12_shi_if_generate_plus.mult1_un222_sum_ADD_6x6_slow_I3_S  
        (.A(\W_zh5_0/ADD_6x6_slow_I3_S_0_0 ), .B(\W_zh5_0/I2_un1_CO1 ), 
        .C(\W_zh5_0/ADD_6x6_slow_I3_S_1_0 ), .Y(ADD_6x6_slow_I3_S));
    XNOR3 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un54_sum_ADD_6x6_slow_I3_S_2  
        (.A(\W_zh5_0/N94 ), .B(\W_zh5_0/mult1_un40_sum[4] ), .C(
        \W_zh5_0/mult1_un47_sum[4] ), .Y(\W_zh5_0/ADD_6x6_slow_I3_S_2 )
        );
    XOR2 \W_zh5_0/un1_ge_if_generate_plus.mult1_un1_sum_I_18  (.A(
        \W_zh5_0/ADD_6x6_slow_I1_S ), .B(
        \W_zh5_0/DWACT_ADD_CI_0_g_array_0_1[0] ), .Y(\ge_c[2] ));
    IOPAD_TRI \shi_pad[1]/U0/U0  (.D(\shi_pad[1]/U0/NET1 ), .E(
        \shi_pad[1]/U0/NET2 ), .PAD(shi[1]));
    XA1A 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un59_sum_ADD_9x9_slow_I5_un3_CO1  
        (.A(\W_zh5_0/N129_0 ), .B(\W_zh5_0/mult1_un45_sum[5] ), .C(
        \W_zh5_0/I4_un1_CO1 ), .Y(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un59_sum.I5_un3_CO1 ));
    OR2 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un61_sum_ADD_6x6_slow_I2_un1_CO1_0_tz  
        (.A(\W_zh5_0/N94_1 ), .B(\W_zh5_0/mult1_un54_sum[4] ), .Y(
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz_0 ));
    AOI5 
        \W_zh5_0/un12_shi_if_generate_plus.mult1_un222_sum_ADD_6x6_slow_I3_S_1  
        (.A(
        \W_zh5_0.un12_shi.if_generate_plus.mult1_un208_sum.I3_un3_CO1 )
        , .B(\W_zh5_0/N_34 ), .C(\W_zh5_0/N_41_mux_i ), .Y(
        \W_zh5_0/ADD_6x6_slow_I3_S_1_0 ));
    AX1C \W_zh5_0/shi.shi_5  (.A(\DataIn_c[4] ), .B(\W_zh5_0/N_141 ), 
        .C(\DataIn_c[5] ), .Y(\W_zh5_0/N_144 ));
    NOR3 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un45_sum_ADD_9x9_slow_I4_S_0  
        (.A(\DataIn_c[5] ), .B(\DataIn_c[6] ), .C(\DataIn_c[7] ), .Y(
        \W_zh5_0/ADD_9x9_slow_I4_S_0 ));
    IOIN_IB \DataIn_pad[1]/U0/U1  (.YIN(\DataIn_pad[1]/U0/NET1 ), .Y(
        \DataIn_c[1] ));
    IOPAD_TRI \shi_pad[0]/U0/U0  (.D(\shi_pad[0]/U0/NET1 ), .E(
        \shi_pad[0]/U0/NET2 ), .PAD(shi[0]));
    NOR3A 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un40_sum_ADD_6x6_slow_I2_un5_CO1  
        (.A(\DataIn_c[4] ), .B(\DataIn_c[5] ), .C(
        \W_zh5_0/mult1_un33_sum_i_0[5] ), .Y(\W_zh5_0/I2_un5_CO1 ));
    NOR2 \W_zh5_0/shi.shi_11_m37_e  (.A(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un59_sum.I5_un3_CO1 ), 
        .B(\DataIn_c[2] ), .Y(\W_zh5_0/N_41 ));
    IOIN_IB \DataIn_pad[7]/U0/U1  (.YIN(\DataIn_pad[7]/U0/NET1 ), .Y(
        \DataIn_c[7] ));
    XNOR2 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un47_sum_ADD_6x6_slow_I3_S_1  
        (.A(\W_zh5_0/N94_0 ), .B(\W_zh5_0/mult1_un40_sum[4] ), .Y(
        \W_zh5_0/ADD_6x6_slow_I3_S_1 ));
    XOR3 
        \W_zh5_0/un12_shi_if_generate_plus.mult1_un215_sum_ADD_6x6_slow_I1_S  
        (.A(
        \W_zh5_0.un12_shi.if_generate_plus.mult1_un208_sum.I3_un3_CO1 )
        , .B(\W_zh5_0/N_41_mux_i ), .C(\W_zh5_0/N_34 ), .Y(
        \W_zh5_0/mult1_un215_sum[2] ));
    XNOR2 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un52_sum_ADD_9x9_slow_I3_S  
        (.A(\W_zh5_0/mult1_un45_sum[4] ), .B(\W_zh5_0/I2_un4_CO1 ), .Y(
        \W_zh5_0/mult1_un52_sum[5] ));
    AO1 
        \W_zh5_0/un12_shi_if_generate_plus.mult1_un222_sum_ADD_6x6_slow_I2_un1_CO1  
        (.A(\W_zh5_0/mult1_un215_sum[2] ), .B(
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz ), .C(
        \W_zh5_0/I2_un5_CO1_2 ), .Y(\W_zh5_0/I2_un1_CO1 ));
    NOR2A 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un59_sum_ADD_9x9_slow_I1_un2_CO1  
        (.A(
        \W_zh5_0.un3_bai.if_generate_plus.mult1_un52_sum.I5_un3_CO1 ), 
        .B(\DataIn_c[3] ), .Y(\W_zh5_0/I1_un2_CO1 ));
    AO1 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un40_sum_ADD_6x6_slow_I2_un1_CO1  
        (.A(\W_zh5_0/mult1_un38_sum[3] ), .B(
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz_3 ), .C(
        \W_zh5_0/I2_un5_CO1 ), .Y(\W_zh5_0/I2_un1_CO1_2 ));
    OA1 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un33_sum_ADD_6x6_slow_I3_un3_CO1  
        (.A(\DataIn_c[5] ), .B(\DataIn_c[6] ), .C(\DataIn_c[7] ), .Y(
        \W_zh5_0/mult1_un33_sum_i_0[5] ));
    NOR3C \W_zh5_0/shi.shi_6  (.A(\DataIn_c[4] ), .B(\W_zh5_0/N_141 ), 
        .C(\DataIn_c[5] ), .Y(\W_zh5_0/N_145 ));
    NOR2B \W_zh5_0/shi.shi_2  (.A(\DataIn_c[2] ), .B(\DataIn_c[3] ), 
        .Y(\W_zh5_0/N_141 ));
    AO1 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un54_sum_ADD_6x6_slow_I2_un1_CO1  
        (.A(\W_zh5_0/mult1_un47_sum[2] ), .B(
        \W_zh5_0/ADD_6x6_slow_I2_un1_CO1_0_tz_1 ), .C(
        \W_zh5_0/I2_un5_CO1_1 ), .Y(\W_zh5_0/I2_un1_CO1_1 ));
    XNOR3 \W_zh5_0/un1_ge_if_generate_plus.mult1_un1_sum_I_16  (.A(
        \W_zh5_0.un1_ge.if_generate_plus.mult1_un61_sum.N98 ), .B(
        \W_zh5_0/ADD_6x6_slow_I2_S ), .C(
        \W_zh5_0/DWACT_ADD_CI_0_g_array_12[0] ), .Y(\ge_c[3] ));
    AO18 
        \W_zh5_0/un1_ge_if_generate_plus.mult1_un54_sum_ADD_6x6_slow_I1_CO1  
        (.A(\W_zh5_0/mult1_un47_sum[4] ), .B(\DataIn_c[2] ), .C(
        \DataIn_c[3] ), .Y(\W_zh5_0/N94_2 ));
    IOPAD_IN \DataIn_pad[3]/U0/U0  (.PAD(DataIn[3]), .Y(
        \DataIn_pad[3]/U0/NET1 ));
    IOIN_IB \DataIn_pad[2]/U0/U1  (.YIN(\DataIn_pad[2]/U0/NET1 ), .Y(
        \DataIn_c[2] ));
    IOIN_IB \DataIn_pad[5]/U0/U1  (.YIN(\DataIn_pad[5]/U0/NET1 ), .Y(
        \DataIn_c[5] ));
    XNOR2 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un52_sum_ADD_9x9_slow_I1_S  
        (.A(\DataIn_c[4] ), .B(\DataIn_c[3] ), .Y(
        \W_zh5_0/mult1_un52_sum[3] ));
    AO1 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un59_sum_ADD_9x9_slow_I3_CO1  
        (.A(\W_zh5_0/mult1_un52_sum[4] ), .B(
        \W_zh5_0/ADD_9x9_slow_I3_CO1_0_tz ), .C(\W_zh5_0/I3_un5_CO1 ), 
        .Y(\W_zh5_0/N129 ));
    OR2 
        \W_zh5_0/un3_bai_if_generate_plus.mult1_un52_sum_ADD_9x9_slow_I3_CO1  
        (.A(\W_zh5_0/mult1_un45_sum[4] ), .B(\W_zh5_0/I2_un4_CO1 ), .Y(
        \W_zh5_0/N129_0 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
