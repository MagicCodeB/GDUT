// test_zh2.v
`timescale 1ns/100ps
module test_zh2;
    reg[2:0]a;
    reg[3:0]in;
    wire[7:0]y;
    wire[7:0]seg;
Ymtz u1(a,in,seg[7],seg[6],seg[5],seg[4],seg[3],seg[2],seg[1],seg[0],y[3],y[2],y[1],y[0]);
    initial
        begin
            a=3'b000;
            in=4'b0000;
            #50;a=3'b001;in=4'b0001;
            #50;a=3'b010;in=4'b0010;
            #50;a=3'b011;in=4'b0011;
        end
endmodule