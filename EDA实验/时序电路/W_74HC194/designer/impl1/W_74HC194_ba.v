`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module W_74HC194(
       MR_N,
       S,
       D,
       CLK,
       IN,
       OUT
    );
input  MR_N;
input  [1:0] S;
input  [1:0] D;
input  CLK;
input  [0:3] IN;
output [0:3] OUT;

    wire OUT30, \OUT_11[3] , \OUT_11[2] , \OUT_11[1] , \OUT_11[0] , 
        N_6, N_7, N_8, N_9, OUT_11_sn_N_2, MR_N_c, \S_c[0] , \S_c[1] , 
        \D_c[0] , \D_c[1] , CLK_c, \IN_c[3] , \IN_c[2] , \IN_c[1] , 
        \IN_c[0] , \OUT_c[3] , \OUT_c[2] , \OUT_c[1] , \OUT_c[0] , 
        \OUT_pad[1]/U0/NET1 , \OUT_pad[1]/U0/NET2 , \CLK_pad/U0/NET1 , 
        \D_pad[1]/U0/NET1 , \OUT_pad[2]/U0/NET1 , \OUT_pad[2]/U0/NET2 , 
        \S_pad[1]/U0/NET1 , \D_pad[0]/U0/NET1 , \S_pad[0]/U0/NET1 , 
        \IN_pad[3]/U0/NET1 , \IN_pad[1]/U0/NET1 , \IN_pad[2]/U0/NET1 , 
        \OUT_pad[0]/U0/NET1 , \OUT_pad[0]/U0/NET2 , 
        \IN_pad[0]/U0/NET1 , \MR_N_pad/U0/NET1 , \OUT_pad[3]/U0/NET1 , 
        \OUT_pad[3]/U0/NET2 , VCC, \OUT[3]/Y , \OUT[2]/Y , \OUT[1]/Y , 
        \OUT[0]/Y , AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    IOPAD_TRI \OUT_pad[2]/U0/U0  (.D(\OUT_pad[2]/U0/NET1 ), .E(
        \OUT_pad[2]/U0/NET2 ), .PAD(OUT[2]));
    IOIN_IB \IN_pad[1]/U0/U1  (.YIN(\IN_pad[1]/U0/NET1 ), .Y(\IN_c[1] )
        );
    MX2 \OUT_RNO[1]  (.A(N_8), .B(\IN_c[1] ), .S(OUT_11_sn_N_2), .Y(
        \OUT_11[1] ));
    IOPAD_TRI \OUT_pad[1]/U0/U0  (.D(\OUT_pad[1]/U0/NET1 ), .E(
        \OUT_pad[1]/U0/NET2 ), .PAD(OUT[1]));
    IOPAD_IN \IN_pad[3]/U0/U0  (.PAD(IN[3]), .Y(\IN_pad[3]/U0/NET1 ));
    MX2 \OUT_RNO[0]  (.A(N_9), .B(\IN_c[0] ), .S(OUT_11_sn_N_2), .Y(
        \OUT_11[0] ));
    DFN1C0 \OUT[3]/U1  (.D(\OUT[3]/Y ), .CLK(CLK_c), .CLR(MR_N_c), .Q(
        \OUT_c[3] ));
    MX2 \OUT[3]/U0  (.A(\OUT_11[3] ), .B(\OUT_c[3] ), .S(OUT30), .Y(
        \OUT[3]/Y ));
    IOTRI_OB_EB \OUT_pad[0]/U0/U1  (.D(\OUT_c[0] ), .E(VCC), .DOUT(
        \OUT_pad[0]/U0/NET1 ), .EOUT(\OUT_pad[0]/U0/NET2 ));
    IOPAD_IN \MR_N_pad/U0/U0  (.PAD(MR_N), .Y(\MR_N_pad/U0/NET1 ));
    IOTRI_OB_EB \OUT_pad[3]/U0/U1  (.D(\OUT_c[3] ), .E(VCC), .DOUT(
        \OUT_pad[3]/U0/NET1 ), .EOUT(\OUT_pad[3]/U0/NET2 ));
    IOIN_IB \IN_pad[3]/U0/U1  (.YIN(\IN_pad[3]/U0/NET1 ), .Y(\IN_c[3] )
        );
    MX2 \OUT_RNO_0[1]  (.A(\OUT_c[2] ), .B(\OUT_c[0] ), .S(\S_c[0] ), 
        .Y(N_8));
    IOIN_IB \D_pad[1]/U0/U1  (.YIN(\D_pad[1]/U0/NET1 ), .Y(\D_c[1] ));
    IOPAD_TRI \OUT_pad[0]/U0/U0  (.D(\OUT_pad[0]/U0/NET1 ), .E(
        \OUT_pad[0]/U0/NET2 ), .PAD(OUT[0]));
    DFN1C0 \OUT[2]/U1  (.D(\OUT[2]/Y ), .CLK(CLK_c), .CLR(MR_N_c), .Q(
        \OUT_c[2] ));
    IOPAD_IN \IN_pad[2]/U0/U0  (.PAD(IN[2]), .Y(\IN_pad[2]/U0/NET1 ));
    MX2 \OUT[0]/U0  (.A(\OUT_11[0] ), .B(\OUT_c[0] ), .S(OUT30), .Y(
        \OUT[0]/Y ));
    MX2 \OUT_RNO[3]  (.A(N_6), .B(\IN_c[3] ), .S(OUT_11_sn_N_2), .Y(
        \OUT_11[3] ));
    DFN1C0 \OUT[0]/U1  (.D(\OUT[0]/Y ), .CLK(CLK_c), .CLR(MR_N_c), .Q(
        \OUT_c[0] ));
    CLKIO \CLK_pad/U0/U1  (.A(\CLK_pad/U0/NET1 ), .Y(CLK_c));
    IOPAD_TRI \OUT_pad[3]/U0/U0  (.D(\OUT_pad[3]/U0/NET1 ), .E(
        \OUT_pad[3]/U0/NET2 ), .PAD(OUT[3]));
    IOIN_IB \D_pad[0]/U0/U1  (.YIN(\D_pad[0]/U0/NET1 ), .Y(\D_c[0] ));
    IOIN_IB \S_pad[1]/U0/U1  (.YIN(\S_pad[1]/U0/NET1 ), .Y(\S_c[1] ));
    DFN1C0 \OUT[1]/U1  (.D(\OUT[1]/Y ), .CLK(CLK_c), .CLR(MR_N_c), .Q(
        \OUT_c[1] ));
    MX2 \OUT[1]/U0  (.A(\OUT_11[1] ), .B(\OUT_c[1] ), .S(OUT30), .Y(
        \OUT[1]/Y ));
    IOIN_IB \IN_pad[2]/U0/U1  (.YIN(\IN_pad[2]/U0/NET1 ), .Y(\IN_c[2] )
        );
    MX2 \OUT_RNO_0[2]  (.A(\OUT_c[3] ), .B(\OUT_c[1] ), .S(\S_c[0] ), 
        .Y(N_7));
    IOIN_IB \S_pad[0]/U0/U1  (.YIN(\S_pad[0]/U0/NET1 ), .Y(\S_c[0] ));
    IOPAD_IN \IN_pad[0]/U0/U0  (.PAD(IN[0]), .Y(\IN_pad[0]/U0/NET1 ));
    IOPAD_IN \CLK_pad/U0/U0  (.PAD(CLK), .Y(\CLK_pad/U0/NET1 ));
    IOPAD_IN \D_pad[1]/U0/U0  (.PAD(D[1]), .Y(\D_pad[1]/U0/NET1 ));
    MX2 \OUT_RNO[2]  (.A(N_7), .B(\IN_c[2] ), .S(OUT_11_sn_N_2), .Y(
        \OUT_11[2] ));
    MX2 \OUT[2]/U0  (.A(\OUT_11[2] ), .B(\OUT_c[2] ), .S(OUT30), .Y(
        \OUT[2]/Y ));
    NOR2 \S_pad_RNIVNV7_0[1]  (.A(\S_c[1] ), .B(\S_c[0] ), .Y(OUT30));
    IOIN_IB \IN_pad[0]/U0/U1  (.YIN(\IN_pad[0]/U0/NET1 ), .Y(\IN_c[0] )
        );
    IOTRI_OB_EB \OUT_pad[2]/U0/U1  (.D(\OUT_c[2] ), .E(VCC), .DOUT(
        \OUT_pad[2]/U0/NET1 ), .EOUT(\OUT_pad[2]/U0/NET2 ));
    MX2 \OUT_RNO_0[3]  (.A(\D_c[0] ), .B(\OUT_c[2] ), .S(\S_c[0] ), .Y(
        N_6));
    MX2 \OUT_RNO_0[0]  (.A(\OUT_c[1] ), .B(\D_c[1] ), .S(\S_c[0] ), .Y(
        N_9));
    IOPAD_IN \IN_pad[1]/U0/U0  (.PAD(IN[1]), .Y(\IN_pad[1]/U0/NET1 ));
    IOIN_IB \MR_N_pad/U0/U1  (.YIN(\MR_N_pad/U0/NET1 ), .Y(MR_N_c));
    IOPAD_IN \D_pad[0]/U0/U0  (.PAD(D[0]), .Y(\D_pad[0]/U0/NET1 ));
    IOPAD_IN \S_pad[1]/U0/U0  (.PAD(S[1]), .Y(\S_pad[1]/U0/NET1 ));
    IOTRI_OB_EB \OUT_pad[1]/U0/U1  (.D(\OUT_c[1] ), .E(VCC), .DOUT(
        \OUT_pad[1]/U0/NET1 ), .EOUT(\OUT_pad[1]/U0/NET2 ));
    NOR2B \S_pad_RNIVNV7[1]  (.A(\S_c[1] ), .B(\S_c[0] ), .Y(
        OUT_11_sn_N_2));
    IOPAD_IN \S_pad[0]/U0/U0  (.PAD(S[0]), .Y(\S_pad[0]/U0/NET1 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
