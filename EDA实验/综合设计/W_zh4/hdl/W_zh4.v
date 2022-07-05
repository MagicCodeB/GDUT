// W_zh4.v
module W_zh4(sum,Cout,a,b,Cin,shiftedcarry);
    output[3:0]sum;
    output[4:0]shiftedcarry;
    output Cout;
    input[3:0]a,b;
    input Cin;
    reg[3:0]carrychain;
    wire[3:0]g=a&b;
    wire[3:0]p=a^b;
always@(a or b or Cin or p or g)
    begin:carry_generation
        integer i;
        carrychain[0]=g[0]+(p[0]&Cin);
        for(i=1;i<=3;i=i+1)
        carrychain[i]=g[i]|(p[i]&carrychain[i-1]);
    end
    wire[4:0]shiftedcarry={carrychain,Cin};
    wire[3:0]sum=p^shiftedcarry;
    wire Cout=shiftedcarry[4];
endmodule