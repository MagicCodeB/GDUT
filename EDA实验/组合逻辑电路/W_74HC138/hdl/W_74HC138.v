module W_74HC138(DataIn,Enable,Eq);
    input [2:0]DataIn;
    input [3:1]Enable;
    output [7:0]Eq;
    reg [7:0]Eq;
    wire [2:0]DataIn;
    integer I;
    always@(DataIn or Enable)
        begin
            if(Enable[1]==1&&Enable[2]==1&&Enable[3]==0)
                for(I=0;I<=7;I=I+1)
                    if(DataIn==I)
                        Eq[I]=0;
                    else
                        Eq[I]=1;
            else
                Eq=0;
        end
endmodule