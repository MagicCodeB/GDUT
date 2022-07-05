// test_74HC02.v
`timescale 1ns/1ns
module test_74HC02;
    reg[3:0]a,b,c;
    wire[3:0]y;
W_74HC02 u1(a,b,y);
    initial
        begin
            a=4'b1111;c=4'b0001;
            b=~c;c=c<<1;
            #10 b=~c;c=c<<1;
            #10 b=~c;c=c<<1;
            #10 b=~c;
            a=4'b0000;c=4'b0001;
            b=~c;c=c<<1;
            #10 b=~c;c=c<<1;
            #10 b=~c;c=c<<1;
            #10 b=~c;
        end
endmodule