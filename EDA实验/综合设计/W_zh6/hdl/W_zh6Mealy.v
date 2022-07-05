// W_zh6Mealy.v
module Mealy(Reset,Clk,Din,Dout);
input Clk, Reset;
input [1:0]Din;
output Dout;
reg Dout;
reg [3:0]current,next;
parameter S0=4'b0001,S1=4'b0010,S2=4'b0100,S3=4'b1000;

always@(posedge Clk or posedge Reset)
begin
    if(Reset) current<=S0;
    else current<=next;
end

always@(current or Din)
begin
case(current)
    S0:begin
        if(Din[1]&Din[0]) next<=S3;
        else if(Din[1])  next<=S2;
        else if(Din[0])  next<=S1;
        else            next<=S0;
        end
    S1:begin
        if(Din[1]&Din[0]) next<=S0;
        else if(Din[1])  next<=S3;
        else if(Din[0])  next<=S2;
        else            next<=S1;
        end
    S2:begin
        if(Din[1]) next<=S0;
        else if(Din[0])  next<=S3;
        else            next<=S2;
        end
    S3:begin
        if(Din[1]|Din[0]) next<=S0;
        else            next<=S3;
        end
    default:next<=S0;
   endcase 
end
always@(current or Din)
Dout=(((current==S2)&&(Din[1]==1)||((current==S3)&&(Din[0]|Din[1])==1)||((current==S1)&&(Din[0]&Din[1])==1)));

endmodule