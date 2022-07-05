// test_74HC85.v
`timescale 1ns/10ps
module test_74HC85;
    reg[3:0]a;
    reg[3:0]b;
    wire[2:0]q;
    integer I;
W_74HC85 u1(a,b,q);
    initial
        begin
            a=0;b=0;
            #5 a=4'b0010;b=4'b1000;
            #5 a=4'b0100;b=4'b0100;
        end
initial
    $monitor("time=%t,A=%b,B=%b,q=%b",$time,a,b,q);
endmodule