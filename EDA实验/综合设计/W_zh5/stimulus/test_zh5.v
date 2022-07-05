// test_zh5.v
`timescale 1ns/1ns
module test_zh5;
    reg [7:0]DataIn;
    wire [3:0]ge,shi,bai;
    wire [11:0]bcd;
Zhq u1(.DataIn(DataIn),.ge(ge),.shi(shi),.bai(bai));
    assign bcd ={bai,shi,ge};
    initial 
        begin
            DataIn = 8'h6a;
            #50 DataIn = 8'h2b;
            #50 DataIn = 8'h3;
            #50 DataIn = 8'h25;
        end
initial $monitor("time=%t,DataIn=%d,hundreds=%d,tens=%d,units=%d",$time,DataIn,bai,shi,ge);
endmodule