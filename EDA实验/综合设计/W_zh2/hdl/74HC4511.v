// 74HC4511.v
module W_74HC4511(LE,BI,LT,INn,Seg);
    input LE,BI,LT;
    input [3:0]INn;
    output [7:0]Seg;
    reg [7:0]Seg;
    always @(LE or BI or LT or INn) begin
        if(!LT) Seg = 8'b01111111;
        else if(!BI) Seg = 8'b00000000;
        else if(!LE) begin
            case(INn)
                4'd0:Seg = 8'b00111111;
                4'd1:Seg = 8'b00000110;
                4'd2:Seg = 8'b01011011;
                4'd3:Seg = 8'b01001111;
                4'd4:Seg = 8'b01100110;
                4'd5:Seg = 8'b01101101;
                4'd6:Seg = 8'b01111101;
                4'd7:Seg = 8'b00000111;
                4'd8:Seg = 8'b01111111;
                4'd9:Seg = 8'b01101111;
                4'ha:Seg = 8'b01110111;
                4'hb:Seg = 8'b01111100;
                4'hc:Seg = 8'b00111001;
                4'hd:Seg = 8'b01011110;
                4'he:Seg = 8'b01111001;
                4'hf:Seg = 8'b01110001;
                default : Seg = 7'b0000000;
            endcase
        end
        else Seg = 7'b0000000;
    end
endmodule