module testbench();
  reg clock, reset, d1, d2, d3, d4;
  wire Y1, Y2, Y3, Y4;

  initial begin
    $display(" Flip Flop tipo D - Sincrono");
    $display("D4 D3 D2 D1 Clk R | Y4 Y3 Y2 Y1")
    $display("------------------|---");
    $monitor('%b %b %b %b %b %b | %b', d4, d3, d2, d1, clock, reset, Y4, Y3, Y2, Y1);
    clock = 0;
    reset = 0;
    d4 = 0; d3 =
