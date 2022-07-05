// W_74HC74.v
module W_74HC74(S,R,CLK,D,Q,Qn);
    input S,R,CLK,D;
    output Q,Qn;
    reg Q,Qn;
always@(posedge CLK or negedge S or negedge R)
    case({S,R})
        0:{Q,Qn}<=2'b11;
        1:{Q,Qn}<=2'b10;
        2:{Q,Qn}<=2'b01;
        default:{Q,Qn}<={D,~D};
    endcase
endmodule