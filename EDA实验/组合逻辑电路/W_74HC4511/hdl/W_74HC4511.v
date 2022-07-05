module W_74HC4511(IN,Seg,LT,BI,LE);
input LT,BI,LE;
input[3:0]IN;
output[7:0]Seg;
reg[7:0]Seg;

always@(IN or LT or BI or LE)
    begin
        if(!LT)Seg=8'b11111111;
        else if(!BI)Seg=8'b00000000;
        else if(!LE)
            begin
                case(IN)
                4'd1:Seg=8'b00000110;
                4'd2:Seg=8'b01011011;
                4'd3:Seg=8'b01001111;
                4'd4:Seg=8'b01100110;
                4'd5:Seg=8'b01101101;
                4'd6:Seg=8'b01111101;
                4'd7:Seg=8'b00000111;
                4'd8:Seg=8'b01111111;
                4'd9:Seg=8'b01101111;
                4'd10:Seg=8'b01110111;
                4'd11:Seg=8'b01111100;
                4'd12:Seg=8'b00111001;
                4'd13:Seg=8'b01011110;
                4'd14:Seg=8'b01111001;
                4'd15:Seg=8'b01110001;
                default:Seg=7'b0000000;
            endcase
        end
        else Seg=7'b0000000;
    end
endmodule
