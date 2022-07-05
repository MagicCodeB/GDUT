`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4


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

    wire GND, VCC, \Sum_1_0_0.N_12 , \Sum_1_0_0.N_14 , 
        \Sum_1_0_0.N_15 , \Sum_1_0_0.N_16 , \DataA_c[0] , \DataA_c[1] , 
        \DataA_c[2] , \DataA_c[3] , \DataB_c[0] , \DataB_c[1] , 
        \DataB_c[2] , \DataB_c[3] , Cin_c, \Sum_c[3] , 
        \Sum_1_0_0.N_21_i_i , \Sum_1_0_0.N_22_i_i , 
        \Sum_1_0_0.N_23_i_i ;
    
    INBUF \DataA_pad[0]  (.PAD(DataA[0]), .Y(\DataA_c[0] ));
    MAJ3 Sum_1_0_0_ADD_4x4_slow_I1_S_i_o3 (.A(\DataA_c[0] ), .B(Cin_c), 
        .C(\DataB_c[0] ), .Y(\Sum_1_0_0.N_14 ));
    INBUF \DataB_pad[0]  (.PAD(DataB[0]), .Y(\DataB_c[0] ));
    OUTBUF \Sum_pad[1]  (.D(\Sum_1_0_0.N_22_i_i ), .PAD(Sum[1]));
    MAJ3 Sum_1_0_0_ADD_4x4_slow_I3_CO1_i (.A(\DataA_c[3] ), .B(
        \DataB_c[3] ), .C(\Sum_1_0_0.N_16 ), .Y(\Sum_1_0_0.N_12 ));
    XOR3 Sum_1_0_0_ADD_4x4_slow_I1_S_i_x3 (.A(\DataA_c[1] ), .B(
        \DataB_c[1] ), .C(\Sum_1_0_0.N_14 ), .Y(\Sum_1_0_0.N_22_i_i ));
    XOR3 Sum_1_0_0_ADD_4x4_slow_I0_S_i_x3 (.A(Cin_c), .B(\DataB_c[0] ), 
        .C(\DataA_c[0] ), .Y(\Sum_1_0_0.N_21_i_i ));
    INBUF \DataB_pad[2]  (.PAD(DataB[2]), .Y(\DataB_c[2] ));
    VCC VCC_i (.Y(VCC));
    OUTBUF \Sum_pad[3]  (.D(\Sum_c[3] ), .PAD(Sum[3]));
    MAJ3 Sum_1_0_0_ADD_4x4_slow_I2_S_i_o3 (.A(\Sum_1_0_0.N_14 ), .B(
        \DataA_c[1] ), .C(\DataB_c[1] ), .Y(\Sum_1_0_0.N_15 ));
    OUTBUF \Sum_pad[2]  (.D(\Sum_1_0_0.N_23_i_i ), .PAD(Sum[2]));
    INBUF \DataA_pad[2]  (.PAD(DataA[2]), .Y(\DataA_c[2] ));
    GND GND_i (.Y(GND));
    OUTBUF Cout_pad (.D(\Sum_1_0_0.N_12 ), .PAD(Cout));
    XOR3 Sum_1_0_0_ADD_4x4_slow_I2_S_i_x3 (.A(\DataA_c[2] ), .B(
        \DataB_c[2] ), .C(\Sum_1_0_0.N_15 ), .Y(\Sum_1_0_0.N_23_i_i ));
    INBUF \DataB_pad[3]  (.PAD(DataB[3]), .Y(\DataB_c[3] ));
    INBUF \DataA_pad[3]  (.PAD(DataA[3]), .Y(\DataA_c[3] ));
    INBUF \DataA_pad[1]  (.PAD(DataA[1]), .Y(\DataA_c[1] ));
    OUTBUF \Sum_pad[0]  (.D(\Sum_1_0_0.N_21_i_i ), .PAD(Sum[0]));
    INBUF Cin_pad (.PAD(Cin), .Y(Cin_c));
    XOR3 Sum_1_0_0_ADD_4x4_slow_I3_S_i_x2 (.A(\DataA_c[3] ), .B(
        \Sum_1_0_0.N_16 ), .C(\DataB_c[3] ), .Y(\Sum_c[3] ));
    INBUF \DataB_pad[1]  (.PAD(DataB[1]), .Y(\DataB_c[1] ));
    MAJ3 Sum_1_0_0_ADD_4x4_slow_I3_CO1_i_o3 (.A(\Sum_1_0_0.N_15 ), .B(
        \DataA_c[2] ), .C(\DataB_c[2] ), .Y(\Sum_1_0_0.N_16 ));
    
endmodule
