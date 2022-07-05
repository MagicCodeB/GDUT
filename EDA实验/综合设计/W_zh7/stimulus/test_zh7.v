// test_zh7.v
`timescale 1ns/1ns
module test_zh7;
  reg clk,reset;
  reg[1:0]d_in;
  wire d_out_mealy,d_out_moore;
  wire d_out_reg_mealy,d_out_reg_mealy_adv;
  wire d_out_reg_moore,d_out_reg_moore_adv;
  parameter DELY=32;
Ztj u1(.Clk(clk),.Reset(reset),.D_in(d_in),
	.D_out_mealy(d_out_mealy),.D_out_moore(d_out_moore),
	.D_out_reg_mealy(d_out_reg_mealy),
	.D_out_reg_mealy_adv(d_out_reg_mealy_adv),
	.D_out_reg_moore(d_out_reg_moore),
	.D_out_reg_moore_adv(d_out_reg_moore_adv));
  always #(DELY/2) clk=~clk;
    initial
      begin 
        clk=0;
        reset=0;
	#5 reset=1;
	#20 reset=0;
      end
    initial
      begin 
        d_in=0;
	#25 d_in=2'b01;
	#25 d_in=2'b00;
	#25 d_in=2'b11;
	#25 d_in=2'b00;
	#25 d_in=2'b00;
	#25 d_in=2'b00;
	#25 d_in=2'b10;
	#25 d_in=2'b00;
	#25 d_in=2'b00;
	#25 d_in=2'b00;
	#25 d_in=2'b00;
	#25 d_in=2'b00;
	#25 d_in=2'b10;
	#25 d_in=2'b00;
	#25 d_in=2'b00;
	#25 d_in=2'b00;
	#25 d_in=2'b00;
	#25 d_in=2'b01;
	#25 d_in=2'b00;
	#25 d_in=2'b00;
	#25 d_in=2'b01;
	#25 d_in=2'b00;
	#25 d_in=2'b10;
    end
      initial
	#600 $finish;
endmodule
