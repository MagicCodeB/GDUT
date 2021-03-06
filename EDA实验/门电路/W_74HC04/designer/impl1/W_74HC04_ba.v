`timescale 1 ns/100 ps
// Version: v11.9 11.9.0.4
// File used only for Simulation


module W_74HC04(
       A,
       Y
    );
input  [5:0] A;
output [5:0] Y;

    wire \A_c[0] , \A_c[1] , \A_c[2] , \A_c[3] , \A_c[4] , \A_c[5] , 
        \A_c_i[5] , \A_c_i[4] , \A_c_i[3] , \A_c_i[2] , \A_c_i[1] , 
        \A_c_i[0] , \A_pad[0]/U0/NET1 , \A_pad[4]/U0/NET1 , 
        \A_pad[2]/U0/NET1 , \A_pad[3]/U0/NET1 , \Y_pad[4]/U0/NET1 , 
        \Y_pad[4]/U0/NET2 , \Y_pad[0]/U0/NET1 , \Y_pad[0]/U0/NET2 , 
        \Y_pad[5]/U0/NET1 , \Y_pad[5]/U0/NET2 , \A_pad[1]/U0/NET1 , 
        \Y_pad[1]/U0/NET1 , \Y_pad[1]/U0/NET2 , \Y_pad[2]/U0/NET1 , 
        \Y_pad[2]/U0/NET2 , \A_pad[5]/U0/NET1 , \Y_pad[3]/U0/NET1 , 
        \Y_pad[3]/U0/NET2 , VCC, GND, AFLSDF_VCC, AFLSDF_GND;
    wire GND_power_net1;
    wire VCC_power_net1;
    assign GND = GND_power_net1;
    assign AFLSDF_GND = GND_power_net1;
    assign VCC = VCC_power_net1;
    assign AFLSDF_VCC = VCC_power_net1;
    
    IOPAD_IN \A_pad[2]/U0/U0  (.PAD(A[2]), .Y(\A_pad[2]/U0/NET1 ));
    IOPAD_IN \A_pad[1]/U0/U0  (.PAD(A[1]), .Y(\A_pad[1]/U0/NET1 ));
    IOTRI_OB_EB \Y_pad[0]/U0/U1  (.D(\A_c_i[0] ), .E(VCC), .DOUT(
        \Y_pad[0]/U0/NET1 ), .EOUT(\Y_pad[0]/U0/NET2 ));
    IOIN_IB \A_pad[3]/U0/U1  (.YIN(\A_pad[3]/U0/NET1 ), .Y(\A_c[3] ));
    IOTRI_OB_EB \Y_pad[5]/U0/U1  (.D(\A_c_i[5] ), .E(VCC), .DOUT(
        \Y_pad[5]/U0/NET1 ), .EOUT(\Y_pad[5]/U0/NET2 ));
    IOTRI_OB_EB \Y_pad[4]/U0/U1  (.D(\A_c_i[4] ), .E(VCC), .DOUT(
        \Y_pad[4]/U0/NET1 ), .EOUT(\Y_pad[4]/U0/NET2 ));
    IOPAD_TRI \Y_pad[2]/U0/U0  (.D(\Y_pad[2]/U0/NET1 ), .E(
        \Y_pad[2]/U0/NET2 ), .PAD(Y[2]));
    IOTRI_OB_EB \Y_pad[1]/U0/U1  (.D(\A_c_i[1] ), .E(VCC), .DOUT(
        \Y_pad[1]/U0/NET1 ), .EOUT(\Y_pad[1]/U0/NET2 ));
    IOPAD_IN \A_pad[4]/U0/U0  (.PAD(A[4]), .Y(\A_pad[4]/U0/NET1 ));
    IOIN_IB \A_pad[0]/U0/U1  (.YIN(\A_pad[0]/U0/NET1 ), .Y(\A_c[0] ));
    IOTRI_OB_EB \Y_pad[3]/U0/U1  (.D(\A_c_i[3] ), .E(VCC), .DOUT(
        \Y_pad[3]/U0/NET1 ), .EOUT(\Y_pad[3]/U0/NET2 ));
    INV \Y_pad_RNO[4]  (.A(\A_c[4] ), .Y(\A_c_i[4] ));
    INV \Y_pad_RNO[5]  (.A(\A_c[5] ), .Y(\A_c_i[5] ));
    INV \Y_pad_RNO[2]  (.A(\A_c[2] ), .Y(\A_c_i[2] ));
    IOPAD_TRI \Y_pad[0]/U0/U0  (.D(\Y_pad[0]/U0/NET1 ), .E(
        \Y_pad[0]/U0/NET2 ), .PAD(Y[0]));
    IOIN_IB \A_pad[5]/U0/U1  (.YIN(\A_pad[5]/U0/NET1 ), .Y(\A_c[5] ));
    IOPAD_IN \A_pad[3]/U0/U0  (.PAD(A[3]), .Y(\A_pad[3]/U0/NET1 ));
    IOPAD_TRI \Y_pad[5]/U0/U0  (.D(\Y_pad[5]/U0/NET1 ), .E(
        \Y_pad[5]/U0/NET2 ), .PAD(Y[5]));
    IOPAD_TRI \Y_pad[4]/U0/U0  (.D(\Y_pad[4]/U0/NET1 ), .E(
        \Y_pad[4]/U0/NET2 ), .PAD(Y[4]));
    INV \Y_pad_RNO[1]  (.A(\A_c[1] ), .Y(\A_c_i[1] ));
    IOPAD_TRI \Y_pad[1]/U0/U0  (.D(\Y_pad[1]/U0/NET1 ), .E(
        \Y_pad[1]/U0/NET2 ), .PAD(Y[1]));
    INV \Y_pad_RNO[0]  (.A(\A_c[0] ), .Y(\A_c_i[0] ));
    IOPAD_IN \A_pad[0]/U0/U0  (.PAD(A[0]), .Y(\A_pad[0]/U0/NET1 ));
    IOPAD_TRI \Y_pad[3]/U0/U0  (.D(\Y_pad[3]/U0/NET1 ), .E(
        \Y_pad[3]/U0/NET2 ), .PAD(Y[3]));
    IOIN_IB \A_pad[2]/U0/U1  (.YIN(\A_pad[2]/U0/NET1 ), .Y(\A_c[2] ));
    IOIN_IB \A_pad[1]/U0/U1  (.YIN(\A_pad[1]/U0/NET1 ), .Y(\A_c[1] ));
    IOTRI_OB_EB \Y_pad[2]/U0/U1  (.D(\A_c_i[2] ), .E(VCC), .DOUT(
        \Y_pad[2]/U0/NET1 ), .EOUT(\Y_pad[2]/U0/NET2 ));
    INV \Y_pad_RNO[3]  (.A(\A_c[3] ), .Y(\A_c_i[3] ));
    IOIN_IB \A_pad[4]/U0/U1  (.YIN(\A_pad[4]/U0/NET1 ), .Y(\A_c[4] ));
    IOPAD_IN \A_pad[5]/U0/U0  (.PAD(A[5]), .Y(\A_pad[5]/U0/NET1 ));
    GND GND_power_inst1 (.Y(GND_power_net1));
    VCC VCC_power_inst1 (.Y(VCC_power_net1));
    
endmodule
