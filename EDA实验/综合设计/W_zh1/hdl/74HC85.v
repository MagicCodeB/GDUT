// 74HC85.v
module W_HC85(A3,A2,A1,A0,B3,B2,B1,B0,QAGB,QASB,QAEB,IAGB,IASB,IAEB);
input A3,A2,A1,A0,B3,B2,B1,B0,IAGB,IASB,IAEB;
output QAGB,QASB,QAEB;
reg QAGB,QASB,QAEB;
wire [3:0]DataA,DataB;
assign DataA[0]=A0;
assign DataA[1]=A1;
assign DataA[2]=A2;
assign DataA[3]=A3;
assign DataB[0]=B0;
assign DataB[1]=B1;
assign DataB[2]=B2;
assign DataB[3]=B3;
always @(DataA or DataB)
begin
if(DataA>DataB)
begin
QAGB=1;QASB=0;QAEB=0;
end
else if(DataA<DataB)
begin
QASB=1;QAGB=0;QAEB=0;
end
else if(IAGB&!IASB&!IAEB)
begin
QAGB=1;QASB=0;QAEB=0;
end
else if(!IAGB&IASB&!IAEB)
begin
QASB=1;QAGB=0;QAEB=0;
end
else if(IAEB)
begin
QAEB=1;QASB=0;QAGB=0;
end
begin
if(DataA==DataB)
if(IAGB&IASB&!IAEB)
begin QAGB=0;QASB=0;QAEB=0;end
if(!IAGB&!IASB&!IAEB)
begin QAGB=1;QASB=1;QAEB=0;end
end
end
endmodule