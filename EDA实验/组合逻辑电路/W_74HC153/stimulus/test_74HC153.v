// test_74HC153.v
`timescale 1ns/1ps;
module test_74HC153;
    reg D0,D1,D2,D3,Sel0,Sel1;
    wire Result;
    W_74HC153 u1(D0,D1,D2,D3,Sel0,Sel1,Result);
    initial
        begin
            D0=0;D1=0;D2=0;D3=0;
            Sel1=0;Sel0=0;
            #100 D0=1;D1=0;D2=0;D3=1;
            #100 Sel1=0;Sel0=1;
            #100 Sel1=1;Sel0=0;
            #100 Sel1=1;Sel0=1;
            #100;
        end
endmodule