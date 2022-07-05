//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sat Dec 26 14:04:40 2020
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Zdshj
module Zdshj(
    // Inputs
    Clk,
    Din,
    Reset,
    // Outputs
    Dout,
    Dout_0
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        Clk;
input  [1:0] Din;
input        Reset;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       Dout;
output       Dout_0;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         Clk;
wire   [1:0] Din;
wire         Dout_net_0;
wire         Dout_0_net_0;
wire         Reset;
wire         Dout_net_1;
wire         Dout_0_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign Dout_net_1   = Dout_net_0;
assign Dout         = Dout_net_1;
assign Dout_0_net_1 = Dout_0_net_0;
assign Dout_0       = Dout_0_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------Mealy
Mealy Mealy_0(
        // Inputs
        .Reset ( Reset ),
        .Clk   ( Clk ),
        .Din   ( Din ),
        // Outputs
        .Dout  ( Dout_0_net_0 ) 
        );

//--------Moore
Moore Moore_0(
        // Inputs
        .Reset ( Reset ),
        .Clk   ( Clk ),
        .Din   ( Din ),
        // Outputs
        .Dout  ( Dout_net_0 ) 
        );


endmodule
