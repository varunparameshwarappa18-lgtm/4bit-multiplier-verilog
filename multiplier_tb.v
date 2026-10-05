// Testbench: directed stimulus for the 4-bit multiplier
module multiplier_tb;

  reg        clk, rst;
  reg  [3:0] A;
  reg  [3:0] B;
  wire [7:0] P;

  multiplier m1(clk, rst, A, B, P);

  initial
    clk = 0;

  always
    #5 clk = ~clk;

  initial
  begin
    rst = 1;

    #2 rst = 0;
    A = 4'b1111;
    B = 4'b1111;

    #20 rst = 1;

    #2 rst = 0;
    A = 4'b0101;
    B = 4'b0101;

    #20 rst = 1;

    #2 rst = 0;
    A = 4'b1100;
    B = 4'b0010;

    #20;
  end

endmodule
