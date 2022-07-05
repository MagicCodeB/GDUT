// W_74HC02.v
module W_74HC02(A,B,Y);
    input[3:0]A,B;
    output[3:0]Y;
    assign Y=~(A|B);
endmodule