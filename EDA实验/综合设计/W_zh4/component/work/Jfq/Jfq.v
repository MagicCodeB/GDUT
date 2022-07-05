//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Dec 25 23:13:33 2020
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Jfq
module Jfq(
    // Inputs
    Cin,
    a,
    b,
    // Outputs
    Cout,
    Result,
    Result_0,
    Result_1,
    Result_2
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        Cin;
input  [3:0] a;
input  [3:0] b;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       Cout;
output       Result;
output       Result_0;
output       Result_1;
output       Result_2;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [3:0] a;
wire   [3:3] a_slice_0;
wire   [3:0] b;
wire         Cin;
wire         Cout_net_0;
wire         INV_0_Y;
wire         Result_net_0;
wire         Result_0_net_0;
wire         Result_1_net_0;
wire         Result_2_net_0;
wire   [3:3] W_zh4_0_shiftedcarry3to3;
wire   [4:4] W_zh4_0_shiftedcarry4to4;
wire   [0:0] W_zh4_0_sum0to0;
wire   [1:1] W_zh4_0_sum1to1;
wire   [2:2] W_zh4_0_sum2to2;
wire   [3:3] W_zh4_0_sum3to3;
wire         XOR2_0_Y;
wire         Cout_net_1;
wire         Result_net_1;
wire         Result_0_net_1;
wire         Result_1_net_1;
wire         Result_2_net_1;
wire   [0:0] shiftedcarry_slice_0;
wire   [1:1] shiftedcarry_slice_1;
wire   [2:2] shiftedcarry_slice_2;
wire   [3:0] sum_net_0;
wire   [4:0] shiftedcarry_net_0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Cout_net_1     = Cout_net_0;
assign Cout           = Cout_net_1;
assign Result_net_1   = Result_net_0;
assign Result         = Result_net_1;
assign Result_0_net_1 = Result_0_net_0;
assign Result_0       = Result_0_net_1;
assign Result_1_net_1 = Result_1_net_0;
assign Result_1       = Result_1_net_1;
assign Result_2_net_1 = Result_2_net_0;
assign Result_2       = Result_2_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign a_slice_0[3]                = a[3:3];
assign W_zh4_0_shiftedcarry3to3[3] = shiftedcarry_net_0[3:3];
assign W_zh4_0_shiftedcarry4to4[4] = shiftedcarry_net_0[4:4];
assign W_zh4_0_sum0to0[0]          = sum_net_0[0:0];
assign W_zh4_0_sum1to1[1]          = sum_net_0[1:1];
assign W_zh4_0_sum2to2[2]          = sum_net_0[2:2];
assign W_zh4_0_sum3to3[3]          = sum_net_0[3:3];
assign shiftedcarry_slice_0[0]     = shiftedcarry_net_0[0:0];
assign shiftedcarry_slice_1[1]     = shiftedcarry_net_0[1:1];
assign shiftedcarry_slice_2[2]     = shiftedcarry_net_0[2:2];
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------INV
INV INV_0(
        // Inputs
        .A ( a_slice_0 ),
        // Outputs
        .Y ( INV_0_Y ) 
        );

//--------newCore
newCore newCore_0(
        // Inputs
        .Data0_port ( W_zh4_0_sum0to0 ),
        .Data1_port ( INV_0_Y ),
        .Sel0       ( XOR2_0_Y ),
        // Outputs
        .Result     ( Result_net_0 ) 
        );

//--------newCore
newCore newCore_1(
        // Inputs
        .Data0_port ( W_zh4_0_sum1to1 ),
        .Data1_port ( INV_0_Y ),
        .Sel0       ( XOR2_0_Y ),
        // Outputs
        .Result     ( Result_0_net_0 ) 
        );

//--------newCore
newCore newCore_2(
        // Inputs
        .Data0_port ( W_zh4_0_sum2to2 ),
        .Data1_port ( INV_0_Y ),
        .Sel0       ( XOR2_0_Y ),
        // Outputs
        .Result     ( Result_1_net_0 ) 
        );

//--------newCore
newCore newCore_3(
        // Inputs
        .Data0_port ( W_zh4_0_sum3to3 ),
        .Data1_port ( a_slice_0 ),
        .Sel0       ( XOR2_0_Y ),
        // Outputs
        .Result     ( Result_2_net_0 ) 
        );

//--------W_zh4
W_zh4 W_zh4_0(
        // Inputs
        .Cin          ( Cin ),
        .a            ( a ),
        .b            ( b ),
        // Outputs
        .Cout         ( Cout_net_0 ),
        .sum          ( sum_net_0 ),
        .shiftedcarry ( shiftedcarry_net_0 ) 
        );

//--------XOR2
XOR2 XOR2_0(
        // Inputs
        .A ( W_zh4_0_shiftedcarry3to3 ),
        .B ( W_zh4_0_shiftedcarry4to4 ),
        // Outputs
        .Y ( XOR2_0_Y ) 
        );


endmodule
