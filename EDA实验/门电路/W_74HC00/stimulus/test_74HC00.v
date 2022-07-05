// test_74HC00.v
`timescale 1ns/1ns
module test_74HC00;
    reg[3:0]a,b;
    wire[3:0]y;
W_74HC00 u1(a,b,y);
    initial
        begin
            a=4'b0000;b=4'b0001;
            #10 b=b<<1;
            #10 b=b<<1;
            #10 b=b<<1;
            a=4'b1111;b=4'b0001;
            #10 b=b<<1;
            #10 b=b<<1;
            #10 b=b<<1;
        end
endmodule