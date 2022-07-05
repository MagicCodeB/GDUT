// W_zh4.v
module W_zh5(DataIn,ge,shi,bai);
    input [7:0]DataIn;
    output [3:0]ge;
    output [3:0]shi;
    output [3:0]bai;
    reg [3:0]ge,shi,bai;
    reg [7:0]data;
always @(DataIn) 
    begin
        data=DataIn;
        bai=data/100;
        shi=(data-bai*100)/10;
        ge=data%10;
    end
endmodule