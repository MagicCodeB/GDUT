// test_zh6.v
`timescale 1ns/100ps
module test_zh6;
    reg clk,reset;
    reg[1:0]in;
    wire d_out_mealy;
    wire d_out_moore;
    parameter DELY=32;   
Zdshj u1(.Clk(clk),.Reset(reset),.Din(in),.Dout(d_out_mealy),.Dout_0(d_out_moore));
always#(DELY/2)clk=~clk;
    initial
        begin
            clk=0;
            reset=0;
            #5 reset=1;
            #20 reset=0;
        end
    initial
        begin
            in=0;
            #25 in=2'b01;
            #25 in=2'b00;
            #25 in=2'b11;
            #25 in=2'b00;
            #25 in=2'b10;
            #25 in=2'b00;
            #125 in=2'b10;
            #25 in=2'b00;
            #100 in=2'b01;
            #25 in=2'b00;
            #50 in=2'b01;
            #25 in=2'b00;
            #25 in=2'b10;
        end
    initial
        #600 $finish;
endmodule