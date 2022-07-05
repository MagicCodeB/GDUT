// Moore.v
module vend_moore_reg(Reset,Clk,D_in,D_out_moore,D_out_reg_moore,D_out_reg_moore_adv);
  input Clk,Reset;
  input [1:0] D_in;
  output D_out_moore;
  output D_out_reg_moore,D_out_reg_moore_adv;
  reg D_out_moore;
  reg D_out_reg_moore,D_out_reg_moore_adv;
  reg [4:0] current_state, next_state;
  parameter S0=5'b00001, S1=5'b00010, S2=5'b00100, S3=5'b01000,S4=5'b10000;
  always @(posedge Clk or posedge Reset)
    begin
      if(Reset)
	current_state<=S0;
      else
	current_state<=next_state;
    end
  always @(current_state or D_in)
    begin
      case(current_state)
        S0:begin
	if(D_in[1]&D_in[0])
	    next_state<=S3;
	else if(D_in[1])
	    next_state<=S2;
	else if(D_in[0])
	    next_state<=S1;
	else
	    next_state<=S0;
            end
        S1:begin
	if(D_in[1]&D_in[0])
	    next_state<=S4;
	else if(D_in[1])
	    next_state<=S3;
	else if(D_in[0])
	    next_state<=S2;
	else
	    next_state<=S1;
          end
        S2:begin
	if(D_in[1])
	    next_state<=S4;
	else if(D_in[0])
	    next_state<=S3;
	else
	    next_state<=S2;
          end
        S3:begin
	if(D_in[0]|D_in[1])
	    next_state<=S4;
	else
	    next_state<=S3;
          end
        S4:begin
	    next_state<=S0;
          end
        default:next_state<=S0;
     endcase
  end
  always @(current_state)
	D_out_moore=(current_state==S4);
  always @(posedge Clk or posedge Reset)
    begin
      if(Reset)
	D_out_reg_moore=0;
      else
	D_out_reg_moore=(current_state==S4);
    end
  always @(posedge Clk or posedge Reset)
    begin
      if(Reset)
	D_out_reg_moore_adv=0;
      else
	D_out_reg_moore_adv=(next_state==S4);
    end
endmodule
