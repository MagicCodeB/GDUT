`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module W_74HC153(
       D0,
       D1,
       D2,
       D3,
       Sel0,
       Sel1,
       Result
    );
input  D0;
input  D1;
input  D2;
input  D3;
input  Sel0;
input  Sel1;
output Result;

    wire Result_1_net_1, Result_2_net_1, D0_c, D1_c, D2_c, D3_c, 
        Sel0_c, Sel1_c, Result_c, \D3_pad/U0/NET1 , \D2_pad/U0/NET1 , 
        \D1_pad/U0/NET1 , \Sel0_pad/U0/NET1 , \Result_pad/U0/NET1 , 
        \Result_pad/U0/NET2 , VCC, \D0_pad/U0/NET1 , 
        \Sel1_pad/U0/NET1 , GND, AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    IOIN_IB \Sel1_pad/U0/U1  (.YIN(\Sel1_pad/U0/NET1 ), .Y(Sel1_c));
    IOTRI_OB_EB \Result_pad/U0/U1  (.D(Result_c), .E(VCC), .DOUT(
        \Result_pad/U0/NET1 ), .EOUT(\Result_pad/U0/NET2 ));
    IOIN_IB \Sel0_pad/U0/U1  (.YIN(\Sel0_pad/U0/NET1 ), .Y(Sel0_c));
    IOPAD_IN \D2_pad/U0/U0  (.PAD(D2), .Y(\D2_pad/U0/NET1 ));
    IOIN_IB \D2_pad/U0/U1  (.YIN(\D2_pad/U0/NET1 ), .Y(D2_c));
    IOIN_IB \D1_pad/U0/U1  (.YIN(\D1_pad/U0/NET1 ), .Y(D1_c));
    IOPAD_IN \D1_pad/U0/U0  (.PAD(D1), .Y(\D1_pad/U0/NET1 ));
    MX2 Result_3 (.A(Result_1_net_1), .B(Result_2_net_1), .S(Sel1_c), 
        .Y(Result_c));
    IOPAD_IN \D3_pad/U0/U0  (.PAD(D3), .Y(\D3_pad/U0/NET1 ));
    IOIN_IB \D3_pad/U0/U1  (.YIN(\D3_pad/U0/NET1 ), .Y(D3_c));
    IOPAD_IN \Sel1_pad/U0/U0  (.PAD(Sel1), .Y(\Sel1_pad/U0/NET1 ));
    IOIN_IB \D0_pad/U0/U1  (.YIN(\D0_pad/U0/NET1 ), .Y(D0_c));
    MX2 Result_1 (.A(D0_c), .B(D2_c), .S(Sel0_c), .Y(Result_1_net_1));
    IOPAD_TRI \Result_pad/U0/U0  (.D(\Result_pad/U0/NET1 ), .E(
        \Result_pad/U0/NET2 ), .PAD(Result));
    IOPAD_IN \D0_pad/U0/U0  (.PAD(D0), .Y(\D0_pad/U0/NET1 ));
    MX2 Result_2 (.A(D1_c), .B(D3_c), .S(Sel0_c), .Y(Result_2_net_1));
    IOPAD_IN \Sel0_pad/U0/U0  (.PAD(Sel0), .Y(\Sel0_pad/U0/NET1 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
