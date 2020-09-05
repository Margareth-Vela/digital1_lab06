module testbench();
  reg clock1, reset1, d1, d2, d3, d4, clock2, reset2, d5, d6, d7, d8;
  wire Y1, Y2, Y3, Y4, Y5, Y6, Y7,Y8;

  flopd1 U1(clock1, reset1, {d4, d3, d2, d1}, {Y4, Y3, Y2, Y1});
  flopd1 U2(clock2, reset2, {d8, d7, d6, d5}, {Y8, Y7, Y6, Y5});

  initial begin
    $display(" Flip Flop tipo D - Asincrono");
    $display("D4 D3 D2 D1 Clk R | Y4 Y3 Y2 Y1");
    $display("------------------|---");
    $monitor("%b %b %b %b %b %b | %b %b %b %b", d4, d3, d2, d1, clock1, reset1, Y4, Y3, Y2, Y1);
    clock1 = 0;
    reset1 = 0;
    d4 = 0; d3 = 0; d2 = 0; d1 = 0;
    #5 reset1 = 1;
    #10 reset1 = 0;
    #5 {d4, d3, d2, d1} = 4'b0001;
    #5 {d4, d3, d2, d1} = 4'b0010;
    #5 reset1 = 1;
    #5 {d4, d3, d2, d1} = 4'b0100;
    #5 {d4, d3, d2, d1} = 4'b1000;
    #5 {d4, d3, d2, d1} = 4'b1001;
    #5 reset1 = 0;
    #5 {d4, d3, d2, d1} = 4'b0101;
    end

    always begin
      #5 clock1 = !clock1;
    end

    initial begin
    #60
      $display(" Flip Flop tipo D - Sincrono");
      $display("D8 D7 D6 D5 Clk R | Y4 Y3 Y2 Y1");
      $display("------------------|---");
      $monitor("%b %b %b %b %b %b | %b %b %b %b", d8, d7, d6, d5, clock2, reset2, Y8, Y7, Y6, Y5);
      clock2 = 0;
      reset2 = 0;
      d8 = 0; d7 = 0; d6 = 0; d5 = 0;
      #5 reset2 = 1;
      #10 reset2 = 0;
      #5 {d8, d7, d6, d5} = 4'b0001;
      #5 {d8, d7, d6, d5} = 4'b0010;
      #5 reset2 = 1;
      #5 {d8, d7, d6, d5} = 4'b0100;
      #5 {d8, d7, d6, d5} = 4'b1000;
      #5 {d8, d7, d6, d5} = 4'b1001;
      #1 reset2 = 0;
      #5 {d8, d7, d6, d5} = 4'b0101;
      end

    always begin
      #5 clock2 = !clock2;
    end

      initial
    #115 $finish;

    initial begin
      $dumpfile("flopd_tb.vcd");
      $dumpvars(0, testbench);
    end

endmodule
