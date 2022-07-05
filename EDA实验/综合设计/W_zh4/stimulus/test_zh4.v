// test_zh4.v
`timescale 1ns/1ns
module test_zh4;
    reg cin;
    reg[3:0]a;
    reg[3:0]b;
    wire cout;
    wire y,y0,y1,y2;
Jfq u1(cin,a,b,cout,y,y0,y1,y2);
    initial
        begin
            cin=0;a=4'b0000;b=4'b0000;
            #100 a=4'b0010;b=4'b0001;
            #100 a=4'b1010;b=4'b0010;
            #100 cin=1;a=4'b0100;b=4'b0001;
            #100 cin=1;a=4'b0001;b=4'b0011;
        end
endmodule
