// test_74HC283.v
`timescale 1ns/1ns;
module test_74HC283;
    reg[3:0]a,b;
    reg in;
    wire [3:0]sum;
    wire out;
    integer I;
W_74HC283 u1(a,b,in,sum,out);
    task accumulate;
    begin
        a=4'b0100;
        for(I=0;I<16;I=I+1)
        begin
            b=I;
            #5;
        end
    end
    endtask
    initial
        begin
            in=0;accumulate();
            in=1;accumulate();
    end
    initial $monitor("time=%t,a=%b,b=%b,in=%b,sum=%b,out=%b",$time,a,b,in,out,sum);
endmodule