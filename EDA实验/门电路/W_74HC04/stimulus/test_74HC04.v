// test_74HC04.v
`timescale 1ns/1ns;
module test_74HC04;
    reg[5:0]a;
    wire[5:0]y;
W_74HC04 u1(a,y);
    initial
        begin
            a=6'b000001;
            #10 a=a<<1;
            #10 a=a<<1;
            #10 a=a<<1;
            #10 a=a<<1;
            #10 a=a<<1;
        end
endmodule
