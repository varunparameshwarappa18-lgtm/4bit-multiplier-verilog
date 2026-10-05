// 4-bit Shift-and-Add Multiplier (clocked, asynchronous reset)
module multiplier(clk, rst, A, B, P);

  integer i;

  input        clk, rst;
  input  [3:0] A;
  input  [3:0] B;
  output reg [7:0] P;

  reg [7:0] A1;
  reg [3:0] B1;

  always @(posedge clk or posedge rst)
  begin
    if (rst)
      P = 0;
    else
    begin
      P = 0;

      A1[7:4] = 0;
      A1[3:0] = A;

      B1 = B;

      for (i = 0; i < 4; i = i + 1)
      begin
        if (B1[i] == 1'b0)
          P = P + 0;
        else if (B1[i] == 1'b1)
          P = P + (A1 << i);
      end
    end
  end

endmodule
