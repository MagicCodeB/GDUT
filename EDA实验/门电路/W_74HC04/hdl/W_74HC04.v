// W_74HC04.v
module W_74HC04(A,Y);
    input[5:0]A;
    output[5:0]Y;
    assign Y=~A;
endmodule