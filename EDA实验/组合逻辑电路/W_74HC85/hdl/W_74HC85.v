// W_74HC85.v
module W_74HC85(A,B,Q);
    input[3:0]A,B;
    output[2:0]Q;
    reg[2:0]Q;

    always@(A or B)
        begin
            if(A>B)
                Q=3'b100;
            else if(A<B)
                Q=3'b001;
            else if(A==B)
                Q=3'b010;
        end
endmodule