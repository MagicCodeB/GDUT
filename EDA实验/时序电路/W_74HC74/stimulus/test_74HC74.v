// test_74HC74.v
`timescale 1ns/100ps
module test_74HC74;
    reg s,r,clk,d;
    wire q,qn;
W_74HC74 u1(s,r,clk,d,q,qn);
task clock;
    repeat(10)
        begin
            d=0;#3;d=1;#3;
        end
endtask
always
    begin
        clk=0;#2;clk=1;#2;
    end
initial
    begin   
        s=0;r=1;clock;
        #5 s=1;r=0;clock;
        #5 s=0;r=0;clock;
        #5 s=1;r=1;clock;
    end
endmodule
