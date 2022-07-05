//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Fri Dec 25 16:31:22 2020
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Compare2come
module Compare2come(
    // Inputs
    DataA,
    DataB,
    // Outputs
    AGEB
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  [7:0] DataA;
input  [7:0] DataB;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       AGEB;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         AGEB_net_0;
wire   [7:0] Comparator_0_DataOut;
wire   [7:0] Comparator_1_DataOut;
wire   [7:0] DataA;
wire   [7:0] DataB;
wire         AGEB_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign AGEB_net_1 = AGEB_net_0;
assign AGEB       = AGEB_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Comparator
Comparator Comparator_0(
        // Inputs
        .DataIn  ( DataA ),
        // Outputs
        .DataOut ( Comparator_0_DataOut ) 
        );

//--------Comparator
Comparator Comparator_1(
        // Inputs
        .DataIn  ( DataB ),
        // Outputs
        .DataOut ( Comparator_1_DataOut ) 
        );

//--------newCore
newCore newCore_0(
        // Inputs
        .DataA ( Comparator_0_DataOut ),
        .DataB ( Comparator_1_DataOut ),
        // Outputs
        .AGEB  ( AGEB_net_0 ) 
        );


endmodule
