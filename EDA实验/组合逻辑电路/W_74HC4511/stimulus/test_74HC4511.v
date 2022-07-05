`timescale 1ns/1ns
module test_74HC4511;
    reg[3:0]IN;
    wire[7:0]Seg;
    reg LT,BI,LE;
W_74HC4511 u1(IN,Seg,LT,BI,LE);
initial
    begin
        LT=1;BI=1;LE=0;IN=0 ;
        #30 IN=4'b0001;
        #30 IN=4'b1000;
        #30 IN=4'b0111;
        #30 IN=4'b1010;
        #30 IN=4'b0101;
        #30 LE=1;
        #30 BI=0;
        #30 LT=0;
        #20;
    end
initial
    $monitor("time=%t,IN=%b,Seg=%b,LT=%b,BI=%b,LE=%b",$time,IN,Seg,LT,BI,LE);
endmodule
        