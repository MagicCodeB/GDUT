// test_74HC194.v
`timescale 1ns/1ns
module test_74HC194;
    reg mr,clk;
    reg[1:0]s;
    reg[1:0]d;
    reg[0:3]in;
    wire[0:3]out;
W_74HC194 u1(mr,s,d,clk,in,out);
    always
        #5 clk=~clk;
    task s_clock;
        begin   
            d=0;
            repeat(4)
                #10 d=d+1;
        end
    endtask
    task clock;
        begin
            s=2'b11;s_clock;
            s=2'b00;s_clock;
            s=2'b01;s_clock;
            s=2'b10;s_clock;
         end
    endtask
    initial
        begin
            clk=1;in=4'b0110;clock;
        end
    initial
        begin
            mr=1;#5 mr=0;#10mr=1;
        end
endmodule