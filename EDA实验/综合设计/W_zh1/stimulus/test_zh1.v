// test_zh1.v
`timescale 1ns/100ps
module test_zh1;
    reg[7:0] datain,datain_0;
    reg[15:0] in,invec;
    wire[7:0] seg;
Bmtz u1(.DataIn(datain),.DataIn_0(datain_0),.Seg(seg));
    initial
        begin
            in=16'b0000000000000001;
            repeat(17)
                begin
                    invec=~in;
                    {datain,datain_0}=invec;
                    #20;
                    in=in<<1;
                end
    end
endmodule