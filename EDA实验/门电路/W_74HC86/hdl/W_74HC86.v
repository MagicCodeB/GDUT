// W_74HC86.v
module W_74HC86(A,B,Y);
    input[3:0]A,B;
    output[3:0]Y;
    assign Y=A^B;
endmodule