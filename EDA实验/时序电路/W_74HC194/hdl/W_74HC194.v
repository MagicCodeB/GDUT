// W_74HC194.v
module W_74HC194(MR_N,S,D,CLK,IN,OUT);
    input MR_N,CLK;
    input[1:0]S;
    input[1:0]D;
    input[0:3]IN;
    output reg [0:3]OUT;
always@(posedge CLK or negedge MR_N)
    if(~MR_N)
        OUT<=0;
    else
        case(S)
            2'b00:OUT<=OUT;
            2'b01:if(D[1])  OUT<={1'b1,OUT[0:2]};
                  else      OUT<=OUT>>1;
            2'b10:if(D[0])  OUT<={OUT[1:3],1'b1};
                  else      OUT<=OUT<<1;
            default:    OUT<=IN;
        endcase
endmodule