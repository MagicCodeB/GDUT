`timescale 1ns/10ps
 module testbench;
    reg[2:0]in;
    reg [3:1]enable;
    wire[7:0]eq;
    
W_74HC138 u1(in,enable,eq);
    initial
        begin
            in=0;
            repeat(20)
                #20  in=$random;
        end
    initial
        begin
            enable[1]=0;enable[2]=0;enable[3]=1;
                #40 enable[1]=1;enable[2]=1;enable[3]=0;
        end
endmodule