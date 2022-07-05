// W_74HC153.v
module W_74HC153(D0,D1,D2,D3,Sel0,Sel1,Result);
    input D0,D1,D2,D3,Sel0,Sel1;
    output Result;
    reg Result;
    always@(D0 or D1 or D2 or D3 or Sel0 or Sel1)
        begin
            case({Sel0,Sel1})
                0:Result=D0;
                1:Result=D1;
                2:Result=D2;
                3:Result=D3;
                default:Result=1'bx;
            endcase
        end
endmodule