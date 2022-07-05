`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module W_74HC283(
       DataA,
       DataB,
       Cin,
       Sum,
       Cout
    );
input  [3:0] DataA;
input  [3:0] DataB;
input  Cin;
output [3:0] Sum;
output Cout;

    wire \Sum_1_0_0.N_12 , \Sum_1_0_0.N_14 , \Sum_1_0_0.N_15 , 
        \Sum_1_0_0.N_16 , \DataA_c[0] , \DataA_c[1] , \DataA_c[2] , 
        \DataA_c[3] , \DataB_c[0] , \DataB_c[1] , \DataB_c[2] , 
        \DataB_c[3] , Cin_c, \Sum_c[3] , \Sum_1_0_0.N_21_i_i , 
        \Sum_1_0_0.N_22_i_i , \Sum_1_0_0.N_23_i_i , 
        \DataA_pad[0]/U0/NET1 , \DataB_pad[0]/U0/NET1 , 
        \Sum_pad[1]/U0/NET1 , \Sum_pad[1]/U0/NET2 , 
        \DataB_pad[2]/U0/NET1 , \Sum_pad[3]/U0/NET1 , 
        \Sum_pad[3]/U0/NET2 , \Sum_pad[2]/U0/NET1 , 
        \Sum_pad[2]/U0/NET2 , \DataA_pad[2]/U0/NET1 , 
        \Cout_pad/U0/NET1 , \Cout_pad/U0/NET2 , \DataB_pad[3]/U0/NET1 , 
        \DataA_pad[3]/U0/NET1 , \DataA_pad[1]/U0/NET1 , 
        \Sum_pad[0]/U0/NET1 , \Sum_pad[0]/U0/NET2 , VCC, 
        \Cin_pad/U0/NET1 , \DataB_pad[1]/U0/NET1 , GND, AFLSDF_VCC, 
        AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    XOR3 Sum_1_0_0_ADD_4x4_slow_I1_S_i_x3 (.A(\DataA_c[1] ), .B(
        \DataB_c[1] ), .C(\Sum_1_0_0.N_14 ), .Y(\Sum_1_0_0.N_22_i_i ));
    MAJ3 Sum_1_0_0_ADD_4x4_slow_I2_S_i_o3 (.A(\Sum_1_0_0.N_14 ), .B(
        \DataA_c[1] ), .C(\DataB_c[1] ), .Y(\Sum_1_0_0.N_15 ));
    MAJ3 Sum_1_0_0_ADD_4x4_slow_I1_S_i_o3 (.A(\DataA_c[0] ), .B(Cin_c), 
        .C(\DataB_c[0] ), .Y(\Sum_1_0_0.N_14 ));
    IOTRI_OB_EB \Sum_pad[3]/U0/U1  (.D(\Sum_c[3] ), .E(VCC), .DOUT(
        \Sum_pad[3]/U0/NET1 ), .EOUT(\Sum_pad[3]/U0/NET2 ));
    IOTRI_OB_EB \Cout_pad/U0/U1  (.D(\Sum_1_0_0.N_12 ), .E(VCC), .DOUT(
        \Cout_pad/U0/NET1 ), .EOUT(\Cout_pad/U0/NET2 ));
    IOPAD_TRI \Sum_pad[2]/U0/U0  (.D(\Sum_pad[2]/U0/NET1 ), .E(
        \Sum_pad[2]/U0/NET2 ), .PAD(Sum[2]));
    MAJ3 Sum_1_0_0_ADD_4x4_slow_I3_CO1_i_o3 (.A(\Sum_1_0_0.N_15 ), .B(
        \DataA_c[2] ), .C(\DataB_c[2] ), .Y(\Sum_1_0_0.N_16 ));
    MAJ3 Sum_1_0_0_ADD_4x4_slow_I3_CO1_i (.A(\DataA_c[3] ), .B(
        \DataB_c[3] ), .C(\Sum_1_0_0.N_16 ), .Y(\Sum_1_0_0.N_12 ));
    IOPAD_TRI \Cout_pad/U0/U0  (.D(\Cout_pad/U0/NET1 ), .E(
        \Cout_pad/U0/NET2 ), .PAD(Cout));
    IOPAD_IN \DataA_pad[2]/U0/U0  (.PAD(DataA[2]), .Y(
        \DataA_pad[2]/U0/NET1 ));
    IOPAD_IN \DataA_pad[0]/U0/U0  (.PAD(DataA[0]), .Y(
        \DataA_pad[0]/U0/NET1 ));
    IOIN_IB \DataA_pad[2]/U0/U1  (.YIN(\DataA_pad[2]/U0/NET1 ), .Y(
        \DataA_c[2] ));
    IOPAD_TRI \Sum_pad[3]/U0/U0  (.D(\Sum_pad[3]/U0/NET1 ), .E(
        \Sum_pad[3]/U0/NET2 ), .PAD(Sum[3]));
    IOIN_IB \DataA_pad[0]/U0/U1  (.YIN(\DataA_pad[0]/U0/NET1 ), .Y(
        \DataA_c[0] ));
    IOPAD_IN \Cin_pad/U0/U0  (.PAD(Cin), .Y(\Cin_pad/U0/NET1 ));
    IOPAD_IN \DataB_pad[2]/U0/U0  (.PAD(DataB[2]), .Y(
        \DataB_pad[2]/U0/NET1 ));
    XOR3 Sum_1_0_0_ADD_4x4_slow_I2_S_i_x3 (.A(\DataA_c[2] ), .B(
        \DataB_c[2] ), .C(\Sum_1_0_0.N_15 ), .Y(\Sum_1_0_0.N_23_i_i ));
    IOIN_IB \DataB_pad[2]/U0/U1  (.YIN(\DataB_pad[2]/U0/NET1 ), .Y(
        \DataB_c[2] ));
    IOPAD_IN \DataA_pad[1]/U0/U0  (.PAD(DataA[1]), .Y(
        \DataA_pad[1]/U0/NET1 ));
    IOTRI_OB_EB \Sum_pad[1]/U0/U1  (.D(\Sum_1_0_0.N_22_i_i ), .E(VCC), 
        .DOUT(\Sum_pad[1]/U0/NET1 ), .EOUT(\Sum_pad[1]/U0/NET2 ));
    IOIN_IB \Cin_pad/U0/U1  (.YIN(\Cin_pad/U0/NET1 ), .Y(Cin_c));
    IOIN_IB \DataA_pad[1]/U0/U1  (.YIN(\DataA_pad[1]/U0/NET1 ), .Y(
        \DataA_c[1] ));
    IOPAD_IN \DataA_pad[3]/U0/U0  (.PAD(DataA[3]), .Y(
        \DataA_pad[3]/U0/NET1 ));
    IOPAD_IN \DataB_pad[3]/U0/U0  (.PAD(DataB[3]), .Y(
        \DataB_pad[3]/U0/NET1 ));
    IOTRI_OB_EB \Sum_pad[0]/U0/U1  (.D(\Sum_1_0_0.N_21_i_i ), .E(VCC), 
        .DOUT(\Sum_pad[0]/U0/NET1 ), .EOUT(\Sum_pad[0]/U0/NET2 ));
    IOIN_IB \DataA_pad[3]/U0/U1  (.YIN(\DataA_pad[3]/U0/NET1 ), .Y(
        \DataA_c[3] ));
    IOPAD_TRI \Sum_pad[1]/U0/U0  (.D(\Sum_pad[1]/U0/NET1 ), .E(
        \Sum_pad[1]/U0/NET2 ), .PAD(Sum[1]));
    XOR3 Sum_1_0_0_ADD_4x4_slow_I3_S_i_x2 (.A(\DataA_c[3] ), .B(
        \Sum_1_0_0.N_16 ), .C(\DataB_c[3] ), .Y(\Sum_c[3] ));
    IOIN_IB \DataB_pad[3]/U0/U1  (.YIN(\DataB_pad[3]/U0/NET1 ), .Y(
        \DataB_c[3] ));
    IOPAD_IN \DataB_pad[1]/U0/U0  (.PAD(DataB[1]), .Y(
        \DataB_pad[1]/U0/NET1 ));
    IOPAD_IN \DataB_pad[0]/U0/U0  (.PAD(DataB[0]), .Y(
        \DataB_pad[0]/U0/NET1 ));
    IOIN_IB \DataB_pad[1]/U0/U1  (.YIN(\DataB_pad[1]/U0/NET1 ), .Y(
        \DataB_c[1] ));
    XOR3 Sum_1_0_0_ADD_4x4_slow_I0_S_i_x3 (.A(Cin_c), .B(\DataB_c[0] ), 
        .C(\DataA_c[0] ), .Y(\Sum_1_0_0.N_21_i_i ));
    IOPAD_TRI \Sum_pad[0]/U0/U0  (.D(\Sum_pad[0]/U0/NET1 ), .E(
        \Sum_pad[0]/U0/NET2 ), .PAD(Sum[0]));
    IOIN_IB \DataB_pad[0]/U0/U1  (.YIN(\DataB_pad[0]/U0/NET1 ), .Y(
        \DataB_c[0] ));
    IOTRI_OB_EB \Sum_pad[2]/U0/U1  (.D(\Sum_1_0_0.N_23_i_i ), .E(VCC), 
        .DOUT(\Sum_pad[2]/U0/NET1 ), .EOUT(\Sum_pad[2]/U0/NET2 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
