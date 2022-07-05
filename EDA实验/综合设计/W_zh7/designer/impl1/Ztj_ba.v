`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module Ztj(
       Clk,
       D_in,
       Reset,
       D_out_mealy,
       D_out_moore,
       D_out_reg_mealy,
       D_out_reg_mealy_adv,
       D_out_reg_moore,
       D_out_reg_moore_adv
    );
input  Clk;
input  [1:0] D_in;
input  Reset;
output D_out_mealy;
output D_out_moore;
output D_out_reg_mealy;
output D_out_reg_mealy_adv;
output D_out_reg_moore;
output D_out_reg_moore_adv;

    wire Clk_c, \D_in_c[0] , \D_in_c[1] , Reset_c, D_out_mealy_c, 
        D_out_reg_mealy_c, D_out_reg_mealy_adv_c, D_out_reg_moore_c, 
        D_out_moore_c_c, \vend_mealy_reg_0/D_out_reg_mealy_adv_2_i_0 , 
        \vend_mealy_reg_0/current_state[1]_net_1 , 
        \vend_mealy_reg_0/D_out_reg_mealy_adv_RNO_net_1 , 
        \vend_mealy_reg_0/N_79 , \vend_mealy_reg_0/N_77 , 
        \vend_mealy_reg_0/current_state_ns_i[0]_net_1 , 
        \vend_mealy_reg_0/current_state[0]_net_1 , 
        \vend_mealy_reg_0/current_state_ns_i[1]_net_1 , 
        \vend_moore_reg_0/current_state_ns_1[3]_net_1 , 
        \vend_moore_reg_0/N_92 , \vend_moore_reg_0/N_93 , 
        \vend_moore_reg_0/N_91 , 
        \vend_moore_reg_0/current_state_ns_a2_2_1[3]_net_1 , 
        \vend_moore_reg_0/N_98 , 
        \vend_moore_reg_0/current_state_ns_i_0[1]_net_1 , 
        \vend_moore_reg_0/current_state[0]_net_1 , 
        \vend_moore_reg_0/current_state_ns[0] , 
        \vend_moore_reg_0/N_85 , 
        \vend_moore_reg_0/current_state[1]_net_1 , 
        \vend_moore_reg_0/N_79 , 
        \vend_moore_reg_0/current_state[2]_net_1 , 
        \vend_moore_reg_0/current_state_ns_i_0_0[1] , 
        \vend_moore_reg_0/current_state_ns_i[2]_net_1 , 
        \vend_moore_reg_0/N_90 , \vend_moore_reg_0/N_89 , 
        \vend_moore_reg_0/current_state_ns[3]_net_1 , 
        \vend_moore_reg_0/next_state[4] , \vend_moore_reg_0/N_80 , 
        \vend_moore_reg_0/N_95 , 
        \vend_moore_reg_0/current_state[3]_net_1 , 
        \D_in_pad[0]/U0/NET1 , \D_in_pad[1]/U0/NET1 , 
        \D_out_reg_moore_adv_pad/U0/NET1 , 
        \D_out_reg_moore_adv_pad/U0/NET2 , \Reset_pad/U0/NET1 , 
        \D_out_reg_mealy_adv_pad/U0/NET1 , 
        \D_out_reg_mealy_adv_pad/U0/NET2 , 
        \D_out_reg_moore_pad/U0/NET1 , \D_out_reg_moore_pad/U0/NET2 , 
        \D_out_mealy_pad/U0/NET1 , \D_out_mealy_pad/U0/NET2 , 
        \D_out_reg_mealy_pad/U0/NET1 , \D_out_reg_mealy_pad/U0/NET2 , 
        \D_out_moore_pad/U0/NET1 , \D_out_moore_pad/U0/NET2 , VCC, 
        \Clk_pad/U0/NET1 , AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    DFN1C1 \vend_moore_reg_0/current_state[2]  (.D(
        \vend_moore_reg_0/current_state_ns_i[2]_net_1 ), .CLK(Clk_c), 
        .CLR(Reset_c), .Q(\vend_moore_reg_0/current_state[2]_net_1 ));
    DFN1C1 \vend_mealy_reg_0/current_state[0]  (.D(
        \vend_mealy_reg_0/current_state_ns_i[0]_net_1 ), .CLK(Clk_c), 
        .CLR(Reset_c), .Q(\vend_mealy_reg_0/current_state[0]_net_1 ));
    NOR2B \vend_moore_reg_0/current_state_RNO_1[4]  (.A(
        \vend_moore_reg_0/N_79 ), .B(\D_in_c[1] ), .Y(
        \vend_moore_reg_0/N_95 ));
    IOPAD_IN \D_in_pad[0]/U0/U0  (.PAD(D_in[0]), .Y(
        \D_in_pad[0]/U0/NET1 ));
    AO1A \vend_moore_reg_0/current_state_ns_i_0[1]  (.A(
        \vend_moore_reg_0/current_state[0]_net_1 ), .B(\D_in_c[0] ), 
        .C(\D_in_c[1] ), .Y(
        \vend_moore_reg_0/current_state_ns_i_0[1]_net_1 ));
    AO1 \vend_moore_reg_0/current_state_RNO[4]  (.A(
        \vend_moore_reg_0/N_80 ), .B(\D_in_c[0] ), .C(
        \vend_moore_reg_0/N_95 ), .Y(\vend_moore_reg_0/next_state[4] ));
    IOPAD_TRI \D_out_moore_pad/U0/U0  (.D(\D_out_moore_pad/U0/NET1 ), 
        .E(\D_out_moore_pad/U0/NET2 ), .PAD(D_out_moore));
    NOR3A \vend_moore_reg_0/current_state_ns_a2_1[3]  (.A(
        \vend_moore_reg_0/current_state[3]_net_1 ), .B(\D_in_c[0] ), 
        .C(\D_in_c[1] ), .Y(\vend_moore_reg_0/N_93 ));
    NOR3B \vend_moore_reg_0/current_state_ns_a2_0[3]  (.A(\D_in_c[0] ), 
        .B(\vend_moore_reg_0/current_state[2]_net_1 ), .C(\D_in_c[1] ), 
        .Y(\vend_moore_reg_0/N_92 ));
    NOR2B \vend_mealy_reg_0/current_state_RNI1OFB[1]  (.A(\D_in_c[1] ), 
        .B(\vend_mealy_reg_0/current_state[1]_net_1 ), .Y(
        \vend_mealy_reg_0/N_77 ));
    DFN1C1 \vend_moore_reg_0/current_state[4]  (.D(
        \vend_moore_reg_0/next_state[4] ), .CLK(Clk_c), .CLR(Reset_c), 
        .Q(D_out_moore_c_c));
    DFN1P1 \vend_moore_reg_0/current_state[0]  (.D(
        \vend_moore_reg_0/current_state_ns[0] ), .CLK(Clk_c), .PRE(
        Reset_c), .Q(\vend_moore_reg_0/current_state[0]_net_1 ));
    IOIN_IB \D_in_pad[1]/U0/U1  (.YIN(\D_in_pad[1]/U0/NET1 ), .Y(
        \D_in_c[1] ));
    NOR3 \vend_moore_reg_0/current_state_ns_i_a2_0[2]  (.A(\D_in_c[0] )
        , .B(\D_in_c[1] ), .C(
        \vend_moore_reg_0/current_state[2]_net_1 ), .Y(
        \vend_moore_reg_0/N_90 ));
    MIN3X \vend_mealy_reg_0/current_state_ns_i[1]  (.A(
        \vend_mealy_reg_0/current_state[1]_net_1 ), .B(\D_in_c[1] ), 
        .C(\vend_mealy_reg_0/N_79 ), .Y(
        \vend_mealy_reg_0/current_state_ns_i[1]_net_1 ));
    NOR3 \vend_moore_reg_0/current_state_ns_i[2]  (.A(
        \vend_moore_reg_0/N_90 ), .B(\vend_moore_reg_0/N_89 ), .C(
        \vend_moore_reg_0/N_98 ), .Y(
        \vend_moore_reg_0/current_state_ns_i[2]_net_1 ));
    IOPAD_TRI \D_out_reg_mealy_adv_pad/U0/U0  (.D(
        \D_out_reg_mealy_adv_pad/U0/NET1 ), .E(
        \D_out_reg_mealy_adv_pad/U0/NET2 ), .PAD(D_out_reg_mealy_adv));
    XA1B \vend_mealy_reg_0/current_state_ns_i[0]  (.A(\D_in_c[0] ), .B(
        \vend_mealy_reg_0/current_state[0]_net_1 ), .C(
        \vend_mealy_reg_0/N_77 ), .Y(
        \vend_mealy_reg_0/current_state_ns_i[0]_net_1 ));
    DFN1C1 \vend_moore_reg_0/D_out_reg_moore  (.D(D_out_moore_c_c), 
        .CLK(Clk_c), .CLR(Reset_c), .Q(D_out_reg_moore_c));
    DFN1C1 \vend_mealy_reg_0/D_out_reg_mealy  (.D(D_out_mealy_c), .CLK(
        Clk_c), .CLR(Reset_c), .Q(D_out_reg_mealy_c));
    IOPAD_TRI \D_out_reg_moore_pad/U0/U0  (.D(
        \D_out_reg_moore_pad/U0/NET1 ), .E(
        \D_out_reg_moore_pad/U0/NET2 ), .PAD(D_out_reg_moore));
    CLKIO \Clk_pad/U0/U1  (.A(\Clk_pad/U0/NET1 ), .Y(Clk_c));
    AOI1 \vend_mealy_reg_0/D_out_reg_mealy_adv_RNO_0  (.A(
        \vend_mealy_reg_0/current_state[1]_net_1 ), .B(\D_in_c[0] ), 
        .C(\D_in_c[1] ), .Y(
        \vend_mealy_reg_0/D_out_reg_mealy_adv_2_i_0 ));
    IOIN_IB \Reset_pad/U0/U1  (.YIN(\Reset_pad/U0/NET1 ), .Y(Reset_c));
    NOR3B \vend_moore_reg_0/current_state_ns_a2_2_1[3]  (.A(
        \D_in_c[1] ), .B(\vend_moore_reg_0/N_98 ), .C(D_out_moore_c_c), 
        .Y(\vend_moore_reg_0/current_state_ns_a2_2_1[3]_net_1 ));
    NOR2B \vend_mealy_reg_0/current_state_RNIVLFB[0]  (.A(
        \vend_mealy_reg_0/current_state[0]_net_1 ), .B(\D_in_c[0] ), 
        .Y(\vend_mealy_reg_0/N_79 ));
    IOPAD_TRI \D_out_reg_mealy_pad/U0/U0  (.D(
        \D_out_reg_mealy_pad/U0/NET1 ), .E(
        \D_out_reg_mealy_pad/U0/NET2 ), .PAD(D_out_reg_mealy));
    NOR3A \vend_moore_reg_0/current_state_ns_a2[0]  (.A(
        \vend_moore_reg_0/N_85 ), .B(
        \vend_moore_reg_0/current_state[1]_net_1 ), .C(
        \vend_moore_reg_0/N_79 ), .Y(
        \vend_moore_reg_0/current_state_ns[0] ));
    AO1 \vend_moore_reg_0/current_state_RNO_0[4]  (.A(\D_in_c[1] ), .B(
        \vend_moore_reg_0/current_state[1]_net_1 ), .C(
        \vend_moore_reg_0/current_state[3]_net_1 ), .Y(
        \vend_moore_reg_0/N_80 ));
    IOPAD_IN \Reset_pad/U0/U0  (.PAD(Reset), .Y(\Reset_pad/U0/NET1 ));
    DFN1C1 \vend_moore_reg_0/current_state[1]  (.D(
        \vend_moore_reg_0/current_state_ns_i_0_0[1] ), .CLK(Clk_c), 
        .CLR(Reset_c), .Q(\vend_moore_reg_0/current_state[1]_net_1 ));
    IOTRI_OB_EB \D_out_reg_moore_adv_pad/U0/U1  (.D(D_out_moore_c_c), 
        .E(VCC), .DOUT(\D_out_reg_moore_adv_pad/U0/NET1 ), .EOUT(
        \D_out_reg_moore_adv_pad/U0/NET2 ));
    OA1B \vend_moore_reg_0/current_state_ns_i[1]  (.A(
        \vend_moore_reg_0/current_state[1]_net_1 ), .B(\D_in_c[0] ), 
        .C(\vend_moore_reg_0/current_state_ns_i_0[1]_net_1 ), .Y(
        \vend_moore_reg_0/current_state_ns_i_0_0[1] ));
    IOTRI_OB_EB \D_out_reg_mealy_pad/U0/U1  (.D(D_out_reg_mealy_c), .E(
        VCC), .DOUT(\D_out_reg_mealy_pad/U0/NET1 ), .EOUT(
        \D_out_reg_mealy_pad/U0/NET2 ));
    IOPAD_IN \Clk_pad/U0/U0  (.PAD(Clk), .Y(\Clk_pad/U0/NET1 ));
    IOPAD_TRI \D_out_reg_moore_adv_pad/U0/U0  (.D(
        \D_out_reg_moore_adv_pad/U0/NET1 ), .E(
        \D_out_reg_moore_adv_pad/U0/NET2 ), .PAD(D_out_reg_moore_adv));
    OR2 \vend_moore_reg_0/current_state_ns_o3[0]  (.A(
        \vend_moore_reg_0/current_state[2]_net_1 ), .B(
        \vend_moore_reg_0/current_state[3]_net_1 ), .Y(
        \vend_moore_reg_0/N_79 ));
    NOR2A \vend_moore_reg_0/current_state_ns_i_a2_1[2]  (.A(
        \D_in_c[0] ), .B(\vend_moore_reg_0/current_state[1]_net_1 ), 
        .Y(\vend_moore_reg_0/N_98 ));
    DFN1C1 \vend_mealy_reg_0/current_state[1]  (.D(
        \vend_mealy_reg_0/current_state_ns_i[1]_net_1 ), .CLK(Clk_c), 
        .CLR(Reset_c), .Q(\vend_mealy_reg_0/current_state[1]_net_1 ));
    IOPAD_IN \D_in_pad[1]/U0/U0  (.PAD(D_in[1]), .Y(
        \D_in_pad[1]/U0/NET1 ));
    OR3 \vend_moore_reg_0/current_state_ns_1[3]  (.A(
        \vend_moore_reg_0/N_92 ), .B(\vend_moore_reg_0/N_93 ), .C(
        \vend_moore_reg_0/N_91 ), .Y(
        \vend_moore_reg_0/current_state_ns_1[3]_net_1 ));
    IOIN_IB \D_in_pad[0]/U0/U1  (.YIN(\D_in_pad[0]/U0/NET1 ), .Y(
        \D_in_c[0] ));
    DFN1C1 \vend_mealy_reg_0/D_out_reg_mealy_adv  (.D(
        \vend_mealy_reg_0/D_out_reg_mealy_adv_RNO_net_1 ), .CLK(Clk_c), 
        .CLR(Reset_c), .Q(D_out_reg_mealy_adv_c));
    AO1D \vend_moore_reg_0/current_state_ns_o2[0]  (.A(\D_in_c[1] ), 
        .B(\D_in_c[0] ), .C(D_out_moore_c_c), .Y(
        \vend_moore_reg_0/N_85 ));
    NOR2A \vend_moore_reg_0/current_state_ns_i_a2[2]  (.A(\D_in_c[1] ), 
        .B(\vend_moore_reg_0/current_state[0]_net_1 ), .Y(
        \vend_moore_reg_0/N_89 ));
    IOPAD_TRI \D_out_mealy_pad/U0/U0  (.D(\D_out_mealy_pad/U0/NET1 ), 
        .E(\D_out_mealy_pad/U0/NET2 ), .PAD(D_out_mealy));
    DFN1C1 \vend_moore_reg_0/current_state[3]  (.D(
        \vend_moore_reg_0/current_state_ns[3]_net_1 ), .CLK(Clk_c), 
        .CLR(Reset_c), .Q(\vend_moore_reg_0/current_state[3]_net_1 ));
    IOTRI_OB_EB \D_out_moore_pad/U0/U1  (.D(D_out_moore_c_c), .E(VCC), 
        .DOUT(\D_out_moore_pad/U0/NET1 ), .EOUT(
        \D_out_moore_pad/U0/NET2 ));
    NOR3B \vend_moore_reg_0/current_state_ns_a2[3]  (.A(
        \vend_moore_reg_0/current_state[1]_net_1 ), .B(\D_in_c[1] ), 
        .C(\D_in_c[0] ), .Y(\vend_moore_reg_0/N_91 ));
    IOTRI_OB_EB \D_out_mealy_pad/U0/U1  (.D(D_out_mealy_c), .E(VCC), 
        .DOUT(\D_out_mealy_pad/U0/NET1 ), .EOUT(
        \D_out_mealy_pad/U0/NET2 ));
    IOTRI_OB_EB \D_out_reg_moore_pad/U0/U1  (.D(D_out_reg_moore_c), .E(
        VCC), .DOUT(\D_out_reg_moore_pad/U0/NET1 ), .EOUT(
        \D_out_reg_moore_pad/U0/NET2 ));
    AO1A \vend_moore_reg_0/current_state_ns[3]  (.A(
        \vend_moore_reg_0/N_79 ), .B(
        \vend_moore_reg_0/current_state_ns_a2_2_1[3]_net_1 ), .C(
        \vend_moore_reg_0/current_state_ns_1[3]_net_1 ), .Y(
        \vend_moore_reg_0/current_state_ns[3]_net_1 ));
    NOR3 \vend_mealy_reg_0/D_out_reg_mealy_adv_RNO  (.A(
        \vend_mealy_reg_0/N_79 ), .B(\vend_mealy_reg_0/N_77 ), .C(
        \vend_mealy_reg_0/D_out_reg_mealy_adv_2_i_0 ), .Y(
        \vend_mealy_reg_0/D_out_reg_mealy_adv_RNO_net_1 ));
    MAJ3 \vend_mealy_reg_0/current_state_RNI0EVM[1]  (.A(
        \vend_mealy_reg_0/current_state[1]_net_1 ), .B(\D_in_c[1] ), 
        .C(\vend_mealy_reg_0/N_79 ), .Y(D_out_mealy_c));
    IOTRI_OB_EB \D_out_reg_mealy_adv_pad/U0/U1  (.D(
        D_out_reg_mealy_adv_c), .E(VCC), .DOUT(
        \D_out_reg_mealy_adv_pad/U0/NET1 ), .EOUT(
        \D_out_reg_mealy_adv_pad/U0/NET2 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
