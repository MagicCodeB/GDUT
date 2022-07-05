`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module Zdshj(
       Clk,
       Din,
       Reset,
       Dout,
       Dout_0
    );
input  Clk;
input  [1:0] Din;
input  Reset;
output Dout;
output Dout_0;

    wire Clk_c, \Din_c[0] , \Din_c[1] , Reset_c, Dout_c, Dout_0_c, 
        \Moore_0/current_state_ns_1[3]_net_1 , \Moore_0/N_47 , 
        \Moore_0/N_46 , \Moore_0/N_45 , 
        \Moore_0/current_state_ns_a4_2_1[3]_net_1 , \Moore_0/N_36 , 
        \Moore_0/current_state_ns_i_0[1]_net_1 , 
        \Moore_0/current_state[0]_net_1 , 
        \Moore_0/current_state_ns[3]_net_1 , \Moore_0/N_52 , 
        \Moore_0/current_state_ns[4]_net_1 , \Moore_0/N_51 , 
        \Moore_0/N_50 , \Moore_0/N_49 , 
        \Moore_0/current_state_ns_i[2]_net_1 , \Moore_0/N_44 , 
        \Moore_0/N_43 , \Moore_0/current_state_ns_i[1]_net_1 , 
        \Moore_0/current_state[1]_net_1 , 
        \Moore_0/current_state[2]_net_1 , 
        \Moore_0/current_state_ns[0] , \Moore_0/N_39 , 
        \Moore_0/current_state[3]_net_1 , 
        \Mealy_0/current_ns_i[0]_net_1 , \Mealy_0/current_i_0[0] , 
        \Mealy_0/N_41 , \Mealy_0/current[1]_net_1 , \Mealy_0/N_48 , 
        \Mealy_0/current_ns_i[1]_net_1 , \Din_pad[1]/U0/NET1 , 
        \Dout_0_pad/U0/NET1 , \Dout_0_pad/U0/NET2 , \Dout_pad/U0/NET1 , 
        \Dout_pad/U0/NET2 , VCC, \Reset_pad/U0/NET1 , 
        \Din_pad[0]/U0/NET1 , \Clk_pad/U0/NET1 , AFLSDF_VCC, 
        AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    NOR3 \Moore_0/current_state_ns_i[2]  (.A(\Moore_0/N_44 ), .B(
        \Moore_0/N_43 ), .C(\Moore_0/N_52 ), .Y(
        \Moore_0/current_state_ns_i[2]_net_1 ));
    DFN1C1 \Moore_0/current_state[3]  (.D(
        \Moore_0/current_state_ns[3]_net_1 ), .CLK(Clk_c), .CLR(
        Reset_c), .Q(\Moore_0/current_state[3]_net_1 ));
    IOIN_IB \Din_pad[0]/U0/U1  (.YIN(\Din_pad[0]/U0/NET1 ), .Y(
        \Din_c[0] ));
    OR2 \Moore_0/current_state_ns_o2[4]  (.A(
        \Moore_0/current_state[2]_net_1 ), .B(
        \Moore_0/current_state[3]_net_1 ), .Y(\Moore_0/N_36 ));
    IOPAD_IN \Din_pad[1]/U0/U0  (.PAD(Din[1]), .Y(\Din_pad[1]/U0/NET1 )
        );
    DFN1C1 \Moore_0/current_state[1]  (.D(
        \Moore_0/current_state_ns_i[1]_net_1 ), .CLK(Clk_c), .CLR(
        Reset_c), .Q(\Moore_0/current_state[1]_net_1 ));
    NOR3B \Moore_0/current_state_ns_a4_0[3]  (.A(\Din_c[0] ), .B(
        \Moore_0/current_state[2]_net_1 ), .C(\Din_c[1] ), .Y(
        \Moore_0/N_46 ));
    AO1D \Moore_0/current_state_ns_o2[0]  (.A(\Din_c[1] ), .B(
        \Din_c[0] ), .C(Dout_c), .Y(\Moore_0/N_39 ));
    DFN1P1 \Moore_0/current_state[0]  (.D(
        \Moore_0/current_state_ns[0] ), .CLK(Clk_c), .PRE(Reset_c), .Q(
        \Moore_0/current_state[0]_net_1 ));
    NOR2A \Moore_0/current_state_ns_i_a4[2]  (.A(\Din_c[1] ), .B(
        \Moore_0/current_state[0]_net_1 ), .Y(\Moore_0/N_43 ));
    DFN1P1 \Mealy_0/current[0]  (.D(\Mealy_0/current_ns_i[0]_net_1 ), 
        .CLK(Clk_c), .PRE(Reset_c), .Q(\Mealy_0/current_i_0[0] ));
    NOR3A \Moore_0/current_state_ns_a4[0]  (.A(\Moore_0/N_39 ), .B(
        \Moore_0/current_state[1]_net_1 ), .C(\Moore_0/N_36 ), .Y(
        \Moore_0/current_state_ns[0] ));
    AO1 \Moore_0/current_state_ns[3]  (.A(
        \Moore_0/current_state_ns_a4_2_1[3]_net_1 ), .B(\Moore_0/N_52 )
        , .C(\Moore_0/current_state_ns_1[3]_net_1 ), .Y(
        \Moore_0/current_state_ns[3]_net_1 ));
    NOR2B \Mealy_0/current_ns_i_RNO[0]  (.A(\Mealy_0/current[1]_net_1 )
        , .B(\Din_c[1] ), .Y(\Mealy_0/N_41 ));
    NOR3B \Moore_0/current_state_ns_a4[3]  (.A(\Din_c[1] ), .B(
        \Moore_0/current_state[1]_net_1 ), .C(\Din_c[0] ), .Y(
        \Moore_0/N_45 ));
    NOR3 \Moore_0/current_state_ns_i_a4_0[2]  (.A(\Din_c[0] ), .B(
        \Din_c[1] ), .C(\Moore_0/current_state[2]_net_1 ), .Y(
        \Moore_0/N_44 ));
    DFN1C1 \Moore_0/current_state[2]  (.D(
        \Moore_0/current_state_ns_i[2]_net_1 ), .CLK(Clk_c), .CLR(
        Reset_c), .Q(\Moore_0/current_state[2]_net_1 ));
    IOTRI_OB_EB \Dout_pad/U0/U1  (.D(Dout_c), .E(VCC), .DOUT(
        \Dout_pad/U0/NET1 ), .EOUT(\Dout_pad/U0/NET2 ));
    CLKIO \Clk_pad/U0/U1  (.A(\Clk_pad/U0/NET1 ), .Y(Clk_c));
    NOR3A \Moore_0/current_state_ns_a4_1[3]  (.A(
        \Moore_0/current_state[3]_net_1 ), .B(\Din_c[0] ), .C(
        \Din_c[1] ), .Y(\Moore_0/N_47 ));
    AO15 \Mealy_0/current_ns_i[1]  (.A(\Mealy_0/current[1]_net_1 ), .B(
        \Din_c[1] ), .C(\Mealy_0/N_48 ), .Y(
        \Mealy_0/current_ns_i[1]_net_1 ));
    IOIN_IB \Reset_pad/U0/U1  (.YIN(\Reset_pad/U0/NET1 ), .Y(Reset_c));
    OA1B \Moore_0/current_state_ns_i[1]  (.A(\Din_c[0] ), .B(
        \Moore_0/current_state[1]_net_1 ), .C(
        \Moore_0/current_state_ns_i_0[1]_net_1 ), .Y(
        \Moore_0/current_state_ns_i[1]_net_1 ));
    IOPAD_TRI \Dout_pad/U0/U0  (.D(\Dout_pad/U0/NET1 ), .E(
        \Dout_pad/U0/NET2 ), .PAD(Dout));
    NOR3C \Moore_0/current_state_ns_a4_1[4]  (.A(\Din_c[1] ), .B(
        \Din_c[0] ), .C(\Moore_0/current_state[1]_net_1 ), .Y(
        \Moore_0/N_51 ));
    OR3 \Moore_0/current_state_ns[4]  (.A(\Moore_0/N_51 ), .B(
        \Moore_0/N_50 ), .C(\Moore_0/N_49 ), .Y(
        \Moore_0/current_state_ns[4]_net_1 ));
    OR2A \Mealy_0/current_ns_i_o3[0]  (.A(\Din_c[0] ), .B(
        \Mealy_0/current_i_0[0] ), .Y(\Mealy_0/N_48 ));
    IOTRI_OB_EB \Dout_0_pad/U0/U1  (.D(Dout_0_c), .E(VCC), .DOUT(
        \Dout_0_pad/U0/NET1 ), .EOUT(\Dout_0_pad/U0/NET2 ));
    IOPAD_IN \Reset_pad/U0/U0  (.PAD(Reset), .Y(\Reset_pad/U0/NET1 ));
    AO1A \Moore_0/current_state_ns_i_0[1]  (.A(
        \Moore_0/current_state[0]_net_1 ), .B(\Din_c[0] ), .C(
        \Din_c[1] ), .Y(\Moore_0/current_state_ns_i_0[1]_net_1 ));
    AO13 \Mealy_0/current_ns_i_o3_RNI2CRU[0]  (.A(
        \Mealy_0/current[1]_net_1 ), .B(\Din_c[1] ), .C(\Mealy_0/N_48 )
        , .Y(Dout_0_c));
    NOR3A \Moore_0/current_state_ns_a4_2_1[3]  (.A(\Din_c[1] ), .B(
        Dout_c), .C(\Moore_0/N_36 ), .Y(
        \Moore_0/current_state_ns_a4_2_1[3]_net_1 ));
    IOPAD_IN \Din_pad[0]/U0/U0  (.PAD(Din[0]), .Y(\Din_pad[0]/U0/NET1 )
        );
    IOPAD_IN \Clk_pad/U0/U0  (.PAD(Clk), .Y(\Clk_pad/U0/NET1 ));
    IOIN_IB \Din_pad[1]/U0/U1  (.YIN(\Din_pad[1]/U0/NET1 ), .Y(
        \Din_c[1] ));
    DFN1C1 \Mealy_0/current[1]  (.D(\Mealy_0/current_ns_i[1]_net_1 ), 
        .CLK(Clk_c), .CLR(Reset_c), .Q(\Mealy_0/current[1]_net_1 ));
    NOR2B \Moore_0/current_state_ns_a4_0[4]  (.A(
        \Moore_0/current_state[3]_net_1 ), .B(\Din_c[0] ), .Y(
        \Moore_0/N_50 ));
    IOPAD_TRI \Dout_0_pad/U0/U0  (.D(\Dout_0_pad/U0/NET1 ), .E(
        \Dout_0_pad/U0/NET2 ), .PAD(Dout_0));
    XO1 \Mealy_0/current_ns_i[0]  (.A(\Din_c[0] ), .B(
        \Mealy_0/current_i_0[0] ), .C(\Mealy_0/N_41 ), .Y(
        \Mealy_0/current_ns_i[0]_net_1 ));
    DFN1C1 \Moore_0/current_state[4]  (.D(
        \Moore_0/current_state_ns[4]_net_1 ), .CLK(Clk_c), .CLR(
        Reset_c), .Q(Dout_c));
    OR3 \Moore_0/current_state_ns_1[3]  (.A(\Moore_0/N_47 ), .B(
        \Moore_0/N_46 ), .C(\Moore_0/N_45 ), .Y(
        \Moore_0/current_state_ns_1[3]_net_1 ));
    NOR2B \Moore_0/current_state_ns_a4[4]  (.A(\Moore_0/N_36 ), .B(
        \Din_c[1] ), .Y(\Moore_0/N_49 ));
    NOR2A \Moore_0/current_state_ns_i_a2[2]  (.A(\Din_c[0] ), .B(
        \Moore_0/current_state[1]_net_1 ), .Y(\Moore_0/N_52 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
