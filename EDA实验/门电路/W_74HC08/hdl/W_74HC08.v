// W_74HC08.v
module W_74HC08(A,B,Y);
    input[3:0]A,B;
    output[3:0]Y;
    assign Y=A&B;
endmodule