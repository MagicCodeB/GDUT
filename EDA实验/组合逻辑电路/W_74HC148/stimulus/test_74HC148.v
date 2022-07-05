`timescale 1ns/10ps
module test_74HC148;
reg EI;
reg [7:0]DataIn;
wire [2:0]DataOut;
wire EO,GS;
initial
    begin
        EI=0;
        DataIn='b11111110;
        repeat(9)
            #20 DataIn=DataIn<<1;
    end
W_74HC148 u1(DataIn,EO,DataOut,EI,GS);
endmodule

