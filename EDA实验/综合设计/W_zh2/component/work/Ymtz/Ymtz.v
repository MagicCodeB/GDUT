//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Dec 25 00:13:34 2020
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Ymtz
module Ymtz(
    // Inputs
    A,
    INn,
    // Outputs
    Seg,
    Seg_0,
    Seg_1,
    Seg_2,
    Seg_3,
    Seg_4,
    Seg_5,
    Seg_6,
    Y,
    Y_0,
    Y_1,
    Y_2
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [2:0] A;
input  [3:0] INn;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       Seg;
output       Seg_0;
output       Seg_1;
output       Seg_2;
output       Seg_3;
output       Seg_4;
output       Seg_5;
output       Seg_6;
output       Y;
output       Y_0;
output       Y_1;
output       Y_2;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [2:0] A;
wire   [3:0] INn;
wire   [7:7] Seg_net_0;
wire   [6:6] Seg_0_net_0;
wire   [5:5] Seg_1_net_0;
wire   [4:4] Seg_2_net_0;
wire   [3:3] Seg_3_net_0;
wire   [2:2] Seg_4_net_0;
wire   [1:1] Seg_5_net_0;
wire   [0:0] Seg_6_net_0;
wire   [3:3] Y_net_0;
wire   [2:2] Y_0_net_0;
wire   [1:1] Y_1_net_0;
wire   [0:0] Y_2_net_0;
wire         Seg_net_1;
wire         Seg_0_net_1;
wire         Seg_1_net_1;
wire         Seg_2_net_1;
wire         Seg_3_net_1;
wire         Seg_4_net_1;
wire         Seg_5_net_1;
wire         Seg_6_net_1;
wire         Y_net_1;
wire         Y_0_net_1;
wire         Y_1_net_1;
wire         Y_2_net_1;
wire   [4:4] Y_slice_0;
wire   [5:5] Y_slice_1;
wire   [6:6] Y_slice_2;
wire   [7:7] Y_slice_3;
wire   [1:3] E_net_0;
wire   [7:0] Y_net_2;
wire   [7:0] Seg_net_2;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
wire         VCC_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net    = 1'b0;
assign VCC_net    = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Seg_net_1   = Seg_net_0[7];
assign Seg         = Seg_net_1;
assign Seg_0_net_1 = Seg_0_net_0[6];
assign Seg_0       = Seg_0_net_1;
assign Seg_1_net_1 = Seg_1_net_0[5];
assign Seg_1       = Seg_1_net_1;
assign Seg_2_net_1 = Seg_2_net_0[4];
assign Seg_2       = Seg_2_net_1;
assign Seg_3_net_1 = Seg_3_net_0[3];
assign Seg_3       = Seg_3_net_1;
assign Seg_4_net_1 = Seg_4_net_0[2];
assign Seg_4       = Seg_4_net_1;
assign Seg_5_net_1 = Seg_5_net_0[1];
assign Seg_5       = Seg_5_net_1;
assign Seg_6_net_1 = Seg_6_net_0[0];
assign Seg_6       = Seg_6_net_1;
assign Y_net_1     = Y_net_0[3];
assign Y           = Y_net_1;
assign Y_0_net_1   = Y_0_net_0[2];
assign Y_0         = Y_0_net_1;
assign Y_1_net_1   = Y_1_net_0[1];
assign Y_1         = Y_1_net_1;
assign Y_2_net_1   = Y_2_net_0[0];
assign Y_2         = Y_2_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign Seg_net_0[7]   = Seg_net_2[7:7];
assign Seg_0_net_0[6] = Seg_net_2[6:6];
assign Seg_1_net_0[5] = Seg_net_2[5:5];
assign Seg_2_net_0[4] = Seg_net_2[4:4];
assign Seg_3_net_0[3] = Seg_net_2[3:3];
assign Seg_4_net_0[2] = Seg_net_2[2:2];
assign Seg_5_net_0[1] = Seg_net_2[1:1];
assign Seg_6_net_0[0] = Seg_net_2[0:0];
assign Y_net_0[3]     = Y_net_2[3:3];
assign Y_0_net_0[2]   = Y_net_2[2:2];
assign Y_1_net_0[1]   = Y_net_2[1:1];
assign Y_2_net_0[0]   = Y_net_2[0:0];
assign Y_slice_0[4]   = Y_net_2[4:4];
assign Y_slice_1[5]   = Y_net_2[5:5];
assign Y_slice_2[6]   = Y_net_2[6:6];
assign Y_slice_3[7]   = Y_net_2[7:7];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign E_net_0 = { 1'b0 , 1'b0 , 1'b1 };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------W_74HC138
W_74HC138 W_74HC138_0(
        // Inputs
        .E ( E_net_0 ),
        .A ( A ),
        // Outputs
        .Y ( Y_net_2 ) 
        );

//--------W_74HC4511
W_74HC4511 W_74HC4511_0(
        // Inputs
        .LE  ( GND_net ),
        .BI  ( VCC_net ),
        .LT  ( VCC_net ),
        .INn ( INn ),
        // Outputs
        .Seg ( Seg_net_2 ) 
        );


endmodule
