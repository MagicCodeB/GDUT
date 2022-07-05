// W_74HC283.v
module W_74HC283(DataA,DataB,Cin,Sum,Cout);
    input [3:0]DataA,DataB;
    input Cin;
    output [3:0]Sum;
    output Cout;
    reg[3:0]Sum;
    reg Cout;
    always@(DataA or DataB or Cin)
    {Cout,Sum}=DataA+DataB+Cin;
endmodule