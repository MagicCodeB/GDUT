//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Thu Dec 24 21:47:52 2020
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Bmtz
module Bmtz(
    // Inputs
    DataIn,
    DataIn_0,
    // Outputs
    EO,
    GS,
    GS_0,
    Seg
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [7:0] DataIn;
input  [7:0] DataIn_0;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       EO;
output       GS;
output       GS_0;
output [7:0] Seg;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0] DataIn;
wire   [7:0] DataIn_0;
wire         EO_net_0;
wire         GS_net_0;
wire         GS_0_net_0;
wire         NAND2_0_Y;
wire         NAND2_1_Y;
wire         NAND2_2_Y;
wire   [7:0] Seg_net_0;
wire   [0:0] W_74HC148_0_DataOut0to0;
wire   [1:1] W_74HC148_0_DataOut1to1;
wire   [2:2] W_74HC148_0_DataOut2to2;
wire         W_74HC148_0_EO;
wire   [0:0] W_74HC148_1_DataOut0to0;
wire   [1:1] W_74HC148_1_DataOut1to1;
wire   [2:2] W_74HC148_1_DataOut2to2;
wire         W_HC85_0_QASB;
wire         GS_net_1;
wire         EO_net_1;
wire         GS_0_net_1;
wire   [7:0] Seg_net_1;
wire   [2:0] DataOut_net_0;
wire   [2:0] DataOut_net_1;
wire   [3:0] IN_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire         GND_net;
wire         VCC_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net = 1'b0;
assign VCC_net = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign GS_net_1   = GS_net_0;
assign GS         = GS_net_1;
assign EO_net_1   = EO_net_0;
assign EO         = EO_net_1;
assign GS_0_net_1 = GS_0_net_0;
assign GS_0       = GS_0_net_1;
assign Seg_net_1  = Seg_net_0;
assign Seg[7:0]   = Seg_net_1;
//--------------------------------------------------------------------
// Slices assignments
//--------------------------------------------------------------------
assign W_74HC148_0_DataOut0to0[0] = DataOut_net_0[0:0];
assign W_74HC148_0_DataOut1to1[1] = DataOut_net_0[1:1];
assign W_74HC148_0_DataOut2to2[2] = DataOut_net_0[2:2];
assign W_74HC148_1_DataOut0to0[0] = DataOut_net_1[0:0];
assign W_74HC148_1_DataOut1to1[1] = DataOut_net_1[1:1];
assign W_74HC148_1_DataOut2to2[2] = DataOut_net_1[2:2];
//--------------------------------------------------------------------
// Concatenation assignments
//--------------------------------------------------------------------
assign IN_net_0 = { W_74HC148_0_EO , NAND2_2_Y , NAND2_1_Y , NAND2_0_Y };
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------NAND2
NAND2 NAND2_0(
        // Inputs
        .A ( W_74HC148_0_DataOut0to0 ),
        .B ( W_74HC148_1_DataOut0to0 ),
        // Outputs
        .Y ( NAND2_0_Y ) 
        );

//--------NAND2
NAND2 NAND2_1(
        // Inputs
        .A ( W_74HC148_0_DataOut1to1 ),
        .B ( W_74HC148_1_DataOut1to1 ),
        // Outputs
        .Y ( NAND2_1_Y ) 
        );

//--------NAND2
NAND2 NAND2_2(
        // Inputs
        .A ( W_74HC148_0_DataOut2to2 ),
        .B ( W_74HC148_1_DataOut2to2 ),
        // Outputs
        .Y ( NAND2_2_Y ) 
        );

//--------W_74HC148
W_74HC148 W_74HC148_0(
        // Inputs
        .EI      ( GND_net ),
        .DataIn  ( DataIn ),
        // Outputs
        .EO      ( W_74HC148_0_EO ),
        .GS      ( GS_net_0 ),
        .DataOut ( DataOut_net_0 ) 
        );

//--------W_74HC148
W_74HC148 W_74HC148_1(
        // Inputs
        .EI      ( W_74HC148_0_EO ),
        .DataIn  ( DataIn_0 ),
        // Outputs
        .EO      ( EO_net_0 ),
        .GS      ( GS_0_net_0 ),
        .DataOut ( DataOut_net_1 ) 
        );

//--------W_74HC4511
W_74HC4511 W_74HC4511_0(
        // Inputs
        .LT  ( VCC_net ),
        .BI  ( W_HC85_0_QASB ),
        .LE  ( GND_net ),
        .IN  ( IN_net_0 ),
        // Outputs
        .Seg ( Seg_net_0 ) 
        );

//--------W_HC85
W_HC85 W_HC85_0(
        // Inputs
        .A3   ( W_74HC148_0_EO ),
        .A2   ( NAND2_2_Y ),
        .A1   ( NAND2_1_Y ),
        .A0   ( NAND2_0_Y ),
        .B3   ( VCC_net ),
        .B2   ( GND_net ),
        .B1   ( VCC_net ),
        .B0   ( GND_net ),
        .IAGB ( GND_net ),
        .IASB ( GND_net ),
        .IAEB ( VCC_net ),
        // Outputs
        .QAGB (  ),
        .QASB ( W_HC85_0_QASB ),
        .QAEB (  ) 
        );


endmodule
