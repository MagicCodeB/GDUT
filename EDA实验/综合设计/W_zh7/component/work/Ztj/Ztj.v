//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sat Dec 26 16:20:02 2020
// Version: v11.9 11.9.0.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// Ztj
module Ztj(
    // Inputs
    Clk,
    D_in,
    Reset,
    // Outputs
    D_out_mealy,
    D_out_moore,
    D_out_reg_mealy,
    D_out_reg_mealy_adv,
    D_out_reg_moore,
    D_out_reg_moore_adv
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input        Clk;
input  [1:0] D_in;
input        Reset;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output       D_out_mealy;
output       D_out_moore;
output       D_out_reg_mealy;
output       D_out_reg_mealy_adv;
output       D_out_reg_moore;
output       D_out_reg_moore_adv;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire         Clk;
wire   [1:0] D_in;
wire         D_out_mealy_net_0;
wire         D_out_moore_net_0;
wire         D_out_reg_mealy_net_0;
wire         D_out_reg_mealy_adv_net_0;
wire         D_out_reg_moore_net_0;
wire         D_out_reg_moore_adv_net_0;
wire         Reset;
wire         D_out_moore_net_1;
wire         D_out_reg_moore_net_1;
wire         D_out_reg_moore_adv_net_1;
wire         D_out_mealy_net_1;
wire         D_out_reg_mealy_net_1;
wire         D_out_reg_mealy_adv_net_1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign D_out_moore_net_1         = D_out_moore_net_0;
assign D_out_moore               = D_out_moore_net_1;
assign D_out_reg_moore_net_1     = D_out_reg_moore_net_0;
assign D_out_reg_moore           = D_out_reg_moore_net_1;
assign D_out_reg_moore_adv_net_1 = D_out_reg_moore_adv_net_0;
assign D_out_reg_moore_adv       = D_out_reg_moore_adv_net_1;
assign D_out_mealy_net_1         = D_out_mealy_net_0;
assign D_out_mealy               = D_out_mealy_net_1;
assign D_out_reg_mealy_net_1     = D_out_reg_mealy_net_0;
assign D_out_reg_mealy           = D_out_reg_mealy_net_1;
assign D_out_reg_mealy_adv_net_1 = D_out_reg_mealy_adv_net_0;
assign D_out_reg_mealy_adv       = D_out_reg_mealy_adv_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------vend_mealy_reg
vend_mealy_reg vend_mealy_reg_0(
        // Inputs
        .Reset               ( Reset ),
        .Clk                 ( Clk ),
        .D_in                ( D_in ),
        // Outputs
        .D_out_mealy         ( D_out_mealy_net_0 ),
        .D_out_reg_mealy     ( D_out_reg_mealy_net_0 ),
        .D_out_reg_mealy_adv ( D_out_reg_mealy_adv_net_0 ) 
        );

//--------vend_moore_reg
vend_moore_reg vend_moore_reg_0(
        // Inputs
        .Reset               ( Reset ),
        .Clk                 ( Clk ),
        .D_in                ( D_in ),
        // Outputs
        .D_out_moore         ( D_out_moore_net_0 ),
        .D_out_reg_moore     ( D_out_reg_moore_net_0 ),
        .D_out_reg_moore_adv ( D_out_reg_moore_adv_net_0 ) 
        );


endmodule
