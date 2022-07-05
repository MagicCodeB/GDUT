// comparator.v
module Comparator(DataIn,DataOut);
    input[7:0] DataIn;
    output[7:0] DataOut;
    reg[7:0] DataOut; 
always @(DataIn)
    begin
        if(DataIn[7])
            DataOut={1'b1,~DataIn[6:0]+1};
        else
            DataOut=DataIn;
    end
endmodule