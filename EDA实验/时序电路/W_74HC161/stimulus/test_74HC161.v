// test_74HC161.v
`timescale 1ns/1ns
module test_74HC161;
    reg mr,cp,cep,cet,pe;
    reg[3:0]d;
    wire[3:0]q;
    wire tc;
W_74HC161 u1(mr,cp,cep,cet,pe,d,q,tc);
    initial
        begin
            mr=1;
            #100 mr=0;
            #20 mr=1;
            #200 mr=0;
            #22 mr=1;
        end
    initial
        begin
            cp=0;
            repeat(200)
                #5 cp=~cp;
        end
    initial
        begin
            pe=1;
            #152 pe=0;
            #22 pe=1;
            #200 pe=0;
            #20 pe=1;
            #200 pe=0;
            #30 pe=1;
        end
    initial
        begin
            cep=1;
            #222 cep=0;
            #40 cep=1;
        end
    initial
        begin
            cet=1;
            #333 cet=0;
            #30 cet=1;
        end
    initial
        begin
            d=0;
            repeat(20)
                #41 d=$random;
        end
    initial $monitor("time=%t,mr=%b,cp=%b,cep=%b,cet=%b,pe=%b,d=%b,q=%b,tc=%b",$time,mr,cp,cep,cet,pe,d,q,tc);
endmodule