// W_74HC112.v
module W_74HC112(S,R,CLK,J,K,Q,Qn);
    input S,R,CLK,J,K;
    output Q,Qn;
    reg Q,temp1,temp2;
    assign Qn=~Q;
always@(negedge CLK)
    begin
        if(S&&R)
            begin
                case({J,K})
                2'd0:temp1<=temp1;
                2'd1:temp1<=0;
                2'd2:temp1<=1;
                2'd3:temp1<=~Q;
                endcase
            end
    end
always@(S,R)
    begin
        case({S,R})
        2'd0:temp2<=1;
        2'd1:temp2<=1;
        2'd2:temp2<=0;
        2'd3:temp2<=temp2;
        endcase
    end
always@(temp1,temp2)
    begin
        if(S&&R)
            Q<=temp1;
        else
            Q<=temp2;
    end
endmodule
        
                    