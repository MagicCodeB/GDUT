// W_74HC161.v
module W_74HC161(MR_N,CP,CEP,CET,PE_N,D,Q,TC);
    input MR_N,CP,CEP,CET,PE_N;
    input[3:0]D;
    output [3:0]Q;
    reg[3:0]Q;
    output TC;
always@(negedge MR_N or negedge CP)
    if(!MR_N)
        Q=0;
    else if(CEP&CET&PE_N)
        Q=Q+1;
    else if(!PE_N)
        Q=D;
    assign TC=&{CET,Q};
endmodule
