// test_74HC112.v
`timescale 1ns/1ns
module test_74HC112;
    reg clk,s,r,j,k;
    wire q,qn;
always #33 clk=~clk;
W_74HC112 u1(s,r,clk,j,k,q,qn);
    initial
        begin
            clk=0;r=0;s=0;j=0;k=0;
            #100 r=0;s=1;
            #100 r=1;s=0;
            #100 r=0;s=1;
            #100 r=1;s=0;
            #100 r=1;s=1;
            #100 r=0;s=1;
            #100 r=1;s=0;
            #100 r=1;s=1;
            #100 r=0;s=0;
            #100 $finish;
        end
    initial $monitor("time=%t,clk=%b,j=%b,k=%b,q=%b,qn=%b",$time,clk,j,k,q,qn);
endmodule