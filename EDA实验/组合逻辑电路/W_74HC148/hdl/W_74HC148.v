module W_74HC148(DataIn,EO,DataOut,EI,GS);
input [7:0]DataIn;
input EI;
output EO,GS;
output [2:0]DataOut;
reg [2:0]DataOut;
reg EO,GS;
integer I;
always @(DataIn or EI)
    begin
        if(EI)
            begin
                DataOut=7;
                EO=1;GS=1;
            end
        else if(DataIn==8'b11111111)
            begin
                DataOut=7;
                EO=0;GS=1;
            end
        else
            for(I=0;I<8;I=I+1)
                begin
                    if(~DataIn[I])
                        begin
                            DataOut=~I;
                            EO=1;GS=0;
                        end
                end
    end
endmodule