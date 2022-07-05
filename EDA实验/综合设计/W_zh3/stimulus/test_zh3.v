`timescale 1ns/1ns
module test_zh3;
    reg [7:0] ina,inb;
    wire AGEB;
Compare2come u1(.DataA(ina),.DataB(inb),.AGEB(AGEB));
    initial 
        begin
            ina=8'b00011001; #20;
            ina=8'b10110011; #20;
            ina=8'b11110100; #20;
            ina=8'b01110000; #20;
            ina=8'b10011100; #20;
            ina=8'b10000011; #20;
        end
    initial 
        begin
        inb=0; #10;
        inb=8'b11011001; #20;
        inb=8'b10000011; #20;
        inb=8'b00110100; #20;
        inb=8'b01111110; #20;
        inb=8'b01011100; #20;
        inb=8'b10000011; #20;
        end
initial $monitor("time=%t,DataA=%b,DataB=%b,AGEB=%b",$time,ina,inb,AGEB);
endmodule